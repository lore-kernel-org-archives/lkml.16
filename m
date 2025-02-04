Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFD212D69
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675312; cv=none; b=JC0Z0fq8NyeO1N1kanKNEtuCBTyGqvtTz8lbj0dHJmIrHw++GgRdzJo9nRdzhMMs3YBlmO5ZdRPVJKcHTa+6klYhdKw42RXJ0JKpFngDKrAE6bBnLiDRNL8ngUk48SefWLgaw9GVR59uH92+P84MJEeHg2jokT5ocdZxE4kowk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675312; c=relaxed/simple;
	bh=+TbL0+quHUDVQElRQ0L08tL+VJH/yxHvmh0vQreNoVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HCZa9+BEdUwogAATxfiNS/NOrrwBqs+AxIIUBaF2KFSbJZ9lcmZAXqQAmM6/2lELhgPQ4x8todN15v70NCiZKfBWg9mT6eOmbzNers2W7KjPZqEIDSOrTRB/Oznrapi9wQJzpNDKlMi5pyi0mwcDL9CsWs90YaYY7SIiYLkq+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 3/8] drm/xe: Add scoped guards for xe_force_wake
Date: Tue,  4 Feb 2025 14:22:32 +0100
Message-ID: <20250204132238.162608-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
References: <20250204132238.162608-1-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of finding bugs where we may or may not release force_wake, I've
decided to be inspired by the spinlock guards, and use the same ones to
do xe_force_wake handling.

Examples are added as documentation in xe_force_wake.c

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 51 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h | 15 +++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 4f6784e5abf88..805c19f6de9e7 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -16,6 +16,57 @@
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
+/**
+ * DOC: Force wake handling
+ *
+ * Traditionally, the force wake handling has been done using the error prone
+ * set of calls:
+ *
+ * int func(struct xe_force_wake *fw)
+ * {
+ * 	unsigned int fw_ref = xe_force_wake_get(fw, XE_FORCEWAKE_ALL);
+ * 	if (!fw_ref)
+ * 		return -ETIMEDOUT;
+ *
+ * 	err = do_something();
+ *
+ * 	xe_force_wake_put(fw, fw_ref);
+ * 	return err;
+ * }
+ *
+ * A new, failure-safe approach is by using the scoped helpers,
+ * which changes the function to this:
+ *
+ * int func(struct xe_force_wake *fw)
+ * {
+ * 	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, XE_FORCEWAKE_ALL) {
+ * 		return do_something();
+ * 	}
+ * }
+ *
+ * For completeness, the following options also work:
+ * void func(struct xe_force_wake *fw)
+ * {
+ * 	scoped_guard(xe_force_wake_get, fw, XE_FORCEWAKE_ALL) {
+ * 		do_something_only_if_fw_acquired();
+ * 	}
+ * }
+ *
+ * You can use xe_force_wake instead of force_wake_get, if the code
+ * must run but errors acquiring ignored:
+ * void func(struct xe_force_wake *fw)
+ * {
+ * 	scoped_guard(xe_force_wake, fw, XE_FORCEWAKE_ALL) {
+ * 		always_do_something_maybe_fw();
+ * 	}
+ *
+ * 	do_something_no_fw();
+ *
+ * 	guard(xe_force_wake)(fw, XE_FORCEWAKE_ALL);
+ * 	always_do_something_maybe_fw();
+ * }
+ */
+
 static const char *str_wake_sleep(bool wake)
 {
 	return wake ? "wake" : "sleep";
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0e3e84bfa51c3..0fb1baae0a3a3 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -9,6 +9,8 @@
 #include "xe_assert.h"
 #include "xe_force_wake_types.h"
 
+#include <linux/cleanup.h>
+
 struct xe_gt;
 
 void xe_force_wake_init_gt(struct xe_gt *gt,
@@ -61,4 +63,17 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
 	return fw_ref & domain;
 }
 
+DEFINE_LOCK_GUARD_1(xe_force_wake, struct xe_force_wake,
+		    _T->fw_ref = xe_force_wake_get(_T->lock, domain),
+		    xe_force_wake_put(_T->lock, _T->fw_ref),
+		    unsigned int fw_ref, enum xe_force_wake_domains domain);
+
+DEFINE_LOCK_GUARD_1_COND(xe_force_wake, _get,
+			 _T->fw_ref = xe_force_wake_get_all(_T->lock, domain),
+			 enum xe_force_wake_domains domain);
+
+/* Only useful for guard xe_force_wake, guard xe_force_wake_get gets all or nothing */
+#define xe_force_wake_scope_has_domain(domain) \
+	(xe_force_wake_ref_has_domain(scope.fw_ref, domain))
+
 #endif
-- 
2.47.1

