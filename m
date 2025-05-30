Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639723184B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614902; cv=none; b=EC1HnnfEAyMK2jmbZ2+9LtUju/E/C7AtSRuS2RXyeRpFn2APVP1oAKmL6SmKWsRQ1ygOYZLcgGl6PN0jFLWUMo+zjbdAz3djDWPZvr9zrmG/TN/dJ/WKyE7UjXkPV4JN9HxEz3TBQwazE8tS9WzLLNaLMhuCKWwpXsAVeA7o5Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614902; c=relaxed/simple;
	bh=LHjYm8riG8W4R567kU14JUQ+LnoHd1D4nv6V0O90YEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FG3604U0NKodHW84xRor4566dcagNX4c/ytuRIwAOuYF0XPcAwclcTTe4XKbv6S5IZKB5AQWZdr/7CQg721nf0iBNzzQr3xCE0oAAeHTFjIdUwyi2lOp3xJYMoEL4XNjO3C+xllCJmLkW6Gg30Qd6B0fn+7STzMdHxvqFDMyBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYHfB3+q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYHfB3+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748614899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLbPcSf4WIqCItcJwknSUcI5TkWbTxEt4NB28H4eqo0=;
	b=ZYHfB3+qsSA38XSeJjh4UoBHsqjppl3Rv4tkduihZUDEF59zt9vGe99GYdegv6ohT6rnSC
	GINxYs/Hh+uE+drjOL4aYw30iJnSvePDbSiuRaODqDERDfK7CxKLqYuG8JG0RP8jcG904U
	tEpOIAW5QWys6Vn7olH+85VMJ+bw6bQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-394-h8CJQSRdMoCgxO7AsqtrAA-1; Fri,
 30 May 2025 10:21:36 -0400
X-MC-Unique: h8CJQSRdMoCgxO7AsqtrAA-1
X-Mimecast-MFC-AGG-ID: h8CJQSRdMoCgxO7AsqtrAA_1748614895
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCDB61955D84;
	Fri, 30 May 2025 14:21:34 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.33.197])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1745B30001B7;
	Fri, 30 May 2025 14:21:31 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v6 5/6] cgroup/cpuset: Fail if isolated and nohz_full don't leave any housekeeping
Date: Fri, 30 May 2025 16:20:30 +0200
Message-ID: <20250530142031.215594-6-gmonaco@redhat.com>
In-Reply-To: <20250530142031.215594-1-gmonaco@redhat.com>
References: <20250530142031.215594-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Currently the user can set up isolated cpus via cpuset and nohz_full in
such a way that leaves no housekeeping CPU (i.e. no CPU that is neither
domain isolated nor nohz full). This can be a problem for other
subsystems (e.g. the timer wheel imgration).

Prevent this configuration by blocking any assignation that would cause
the union of domain isolated cpus and nohz_full to covers all CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/cgroup/cpuset.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index d0936b5d9920a..e3494ed677f5c 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1261,6 +1261,19 @@ static void isolated_cpus_update(int old_prs, int new_prs, struct cpumask *xcpus
 		cpumask_andnot(isolated_cpus, isolated_cpus, xcpus);
 }
 
+/*
+ * isolated_cpus_should_update - Returns if the isolated_cpus mask needs update
+ * @prs: new or old partition_root_state
+ * @parent: parent cpuset
+ * Return: true if isolated_cpus needs modification, false otherwise
+ */
+static bool isolated_cpus_should_update(int prs, struct cpuset *parent)
+{
+	if (!parent)
+		parent = &top_cpuset;
+	return prs != parent->partition_root_state;
+}
+
 /*
  * partition_xcpus_add - Add new exclusive CPUs to partition
  * @new_prs: new partition_root_state
@@ -1325,6 +1338,35 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
 	return isolcpus_updated;
 }
 
+/*
+ * isolcpus_nohz_conflict - check for isolated & nohz_full conflicts
+ * @new_cpus: cpu mask for cpus that are going to be isolated
+ * Return: true if there is conflict, false otherwise
+ *
+ * If nohz_full is enabled and we have isolated CPUs, their combination must
+ * still leave housekeeping CPUs.
+ */
+static bool isolcpus_nohz_conflict(struct cpumask *new_cpus)
+{
+	cpumask_var_t full_hk_cpus;
+	int res = false;
+
+	if (!housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
+		return false;
+
+	if (!alloc_cpumask_var(&full_hk_cpus, GFP_KERNEL))
+		return true;
+
+	cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
+		    housekeeping_cpumask(HK_TYPE_DOMAIN));
+	cpumask_and(full_hk_cpus, full_hk_cpus, cpu_online_mask);
+	if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
+		res = true;
+
+	free_cpumask_var(full_hk_cpus);
+	return res;
+}
+
 static void update_exclusion_cpumasks(bool isolcpus_updated)
 {
 	int ret;
@@ -1450,6 +1492,9 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	    cpumask_intersects(tmp->new_cpus, subpartitions_cpus) ||
 	    cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus))
 		return PERR_INVCPUS;
+	if (isolated_cpus_should_update(new_prs, NULL) &&
+	    isolcpus_nohz_conflict(tmp->new_cpus))
+		return PERR_HKEEPING;
 
 	spin_lock_irq(&callback_lock);
 	isolcpus_updated = partition_xcpus_add(new_prs, NULL, tmp->new_cpus);
@@ -1548,6 +1593,9 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 		else if (cpumask_intersects(tmp->addmask, subpartitions_cpus) ||
 			 cpumask_subset(top_cpuset.effective_cpus, tmp->addmask))
 			cs->prs_err = PERR_NOCPUS;
+		else if (isolated_cpus_should_update(prs, NULL) &&
+			 isolcpus_nohz_conflict(tmp->addmask))
+			cs->prs_err = PERR_HKEEPING;
 		if (cs->prs_err)
 			goto invalidate;
 	}
@@ -1879,6 +1927,12 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 			return err;
 	}
 
+	if (deleting && isolated_cpus_should_update(new_prs, parent) &&
+	    isolcpus_nohz_conflict(tmp->delmask)) {
+		cs->prs_err = PERR_HKEEPING;
+		return PERR_HKEEPING;
+	}
+
 	/*
 	 * Change the parent's effective_cpus & effective_xcpus (top cpuset
 	 * only).
@@ -2899,6 +2953,8 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		 * Need to update isolated_cpus.
 		 */
 		isolcpus_updated = true;
+		if (isolcpus_nohz_conflict(cs->effective_xcpus))
+			err = PERR_HKEEPING;
 	} else {
 		/*
 		 * Switching back to member is always allowed even if it
-- 
2.49.0

