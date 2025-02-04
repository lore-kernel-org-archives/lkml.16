Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A41211A0C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673866; cv=none; b=J6bDwC2PCMNuI8IpXKhoLZ5ZQHzd7ychGPXeRwJ1Vt7Wq/jSbsTNbVeDHqrjMdCg7yoj8Pma+udh61S9k6cKMNWcQaG5S+HE8faMyRTHMfq1USsuawGy0pYqYutdx1X3d/MrQc+HPbxv2aSC9HuvV/ageZObmN8hchSVdEtC7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673866; c=relaxed/simple;
	bh=ChNBBi6t65G47K6zr5IQAZcyh9DX/f8S0PxWsg3rbRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bijdD0F6tqtW/uy/B9PtsNKanD6Af0bgD+V6H3cvW5fL5AGLi+z1nFzIUMqVuffYdk2MYW3oBLx7ZKmN1liE9Mh36bjBy4hb8R7J2dN2FsvfTkEjZiE+UAt+EheBmXUkDfZjhDwhznHJZ1KOCjiYOu6bGs/vck7uDSEMHPiympY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 4/8] drm/xe: Add xe_force_wake_get_all
Date: Tue,  4 Feb 2025 13:49:05 +0100
Message-ID: <20250204124909.158315-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204124909.158315-1-dev@lankhorst.se>
References: <20250204124909.158315-1-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For most usecases, we want to get all the forcewakes, and failing to
grab any is similar to failure to grab all.

This makes the next patch to add cond guards a lot easier.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 110 ++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_force_wake.h |   2 +
 2 files changed, 77 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 805c19f6de9e7..cc00d5de8f0ae 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -211,27 +211,36 @@ static int domain_sleep_wait(struct xe_gt *gt,
 					 (ffs(tmp__) - 1))) && \
 					 domain__->reg_ctl.addr)
 
-/**
- * xe_force_wake_get() : Increase the domain refcount
- * @fw: struct xe_force_wake
- * @domains: forcewake domains to get refcount on
- *
- * This function wakes up @domains if they are asleep and takes references.
- * If requested domain is XE_FORCEWAKE_ALL then only applicable/initialized
- * domains will be considered for refcount and it is a caller responsibility
- * to check returned ref if it includes any specific domain by using
- * xe_force_wake_ref_has_domain() function. Caller must call
- * xe_force_wake_put() function to decrease incremented refcounts.
- *
- * Return: opaque reference to woken domains or zero if none of requested
- * domains were awake.
- */
-unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
-					    enum xe_force_wake_domains domains)
+static void __xe_force_wake_put_inner(struct xe_force_wake *fw,
+				      unsigned int fw_ref, unsigned int *ack_fail)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp, sleep = 0;
+
+	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
+		xe_gt_assert(gt, domain->ref);
+
+		if (!--domain->ref) {
+			sleep |= BIT(domain->id);
+			domain_sleep(gt, domain);
+		}
+	}
+	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
+		if (domain_sleep_wait(gt, domain) == 0)
+			fw->awake_domains &= ~BIT(domain->id);
+		else
+			*ack_fail |= BIT(domain->id);
+	}
+}
+
+static int __must_check __xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains,
+					    bool all_or_nothing)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
+	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0, sleep_failed = 0;
 	unsigned int tmp, ref_rqst;
 	unsigned long flags;
 
@@ -257,6 +266,12 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 		}
 	}
 	ref_incr &= ~awake_failed;
+
+	if (all_or_nothing && awake_failed && ref_incr) {
+		__xe_force_wake_put_inner(fw, ref_incr, &sleep_failed);
+		ref_incr = 0;
+	}
+
 	spin_unlock_irqrestore(&fw->lock, flags);
 
 	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to acknowledge awake request\n",
@@ -268,6 +283,46 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	return ref_incr;
 }
 
+/**
+ * xe_force_wake_get() : Increase the domain refcount
+ * @fw: struct xe_force_wake
+ * @domains: forcewake domains to get refcount on
+ *
+ * This function wakes up @domains if they are asleep and takes references.
+ * If requested domain is XE_FORCEWAKE_ALL then only applicable/initialized
+ * domains will be considered for refcount and it is a caller responsibility
+ * to check returned ref if it includes any specific domain by using
+ * xe_force_wake_ref_has_domain() function. Caller must call
+ * xe_force_wake_put() function to decrease incremented refcounts.
+ *
+ * Return: opaque reference to woken domains or zero if none of requested
+ * domains were awake.
+ */
+unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains)
+{
+	return __xe_force_wake_get(fw, domains, false);
+}
+
+/**
+  * xe_force_wake_get_all() : Increase the domain refcount
+  * @fw: struct xe_force_wake
+  * @domains: forcewake domains to get refcount on
+  *
+  * This function wakes up @domains if they are asleep and takes references.
+  * Unlike xe_force_wake_get(), this function fails if any of the domains
+  * could not be woken up. It's all or nothing. This makes it always safe
+  * to check for 0 only.
+  *
+  * Return: opaque reference to woken domains or zero if not all of the requested
+  * domains could be woken up.
+  */
+unsigned int __must_check xe_force_wake_get_all(struct xe_force_wake *fw,
+						enum xe_force_wake_domains domains)
+{
+	return __xe_force_wake_get(fw, domains, true);
+}
+
 /**
  * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
  * @fw: Pointer to the force wake structure
@@ -281,10 +336,8 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 {
 	struct xe_gt *gt = fw->gt;
-	struct xe_force_wake_domain *domain;
-	unsigned int tmp, sleep = 0;
 	unsigned long flags;
-	int ack_fail = 0;
+	unsigned int ack_fail = 0;
 
 	/*
 	 * Avoid unnecessary lock and unlock when the function is called
@@ -297,20 +350,7 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 		fw_ref = fw->initialized_domains;
 
 	spin_lock_irqsave(&fw->lock, flags);
-	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
-		xe_gt_assert(gt, domain->ref);
-
-		if (!--domain->ref) {
-			sleep |= BIT(domain->id);
-			domain_sleep(gt, domain);
-		}
-	}
-	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
-		if (domain_sleep_wait(gt, domain) == 0)
-			fw->awake_domains &= ~BIT(domain->id);
-		else
-			ack_fail |= BIT(domain->id);
-	}
+	__xe_force_wake_put_inner(fw, fw_ref, &ack_fail);
 	spin_unlock_irqrestore(&fw->lock, flags);
 
 	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0fb1baae0a3a3..7102547260f67 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -19,6 +19,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
+unsigned int __must_check xe_force_wake_get_all(struct xe_force_wake *fw,
+						enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
 
 static inline int
-- 
2.47.1

