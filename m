Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32700278E5A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716082; cv=none; b=M6mB8Ui4P93oH8F6zcdE+IdV2NSA4WbbOUs1J6NHaHH75iijqlikua6S7A4DB0ULDijP2X0z8LoaWFozkQf+yngy7ZkidqTgqIYnpMTgeG5fAHe268pLff4bCpLfbtUUBUz18vvElVQaBJoT0H6Ae09g4VKj1dqRXrBrx6xzXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716082; c=relaxed/simple;
	bh=AgGQmjTxtoeCEQk7QNPu29VeJbPaFauc+CCXb4WV0+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azzX9EEgfwaUteTINrs+7GGNFDymE8pBlb6x7YBC3aaTOlYBIXffQwQaW0IKUzDhuBAE6LSY2dx6JaQF5VC4YV9FJ+YXfiJckIl/U9SgvcOhT2Ih8M+4L9kzmxAa5/PZyd+MucQnpXW6d0k7cd/b1P4DDQe0xEvE9jMp60LvDdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQGN/YOu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQGN/YOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746716080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3ctiV5F9ssGbaCSHFh2xd5zHK/Kx7LjUTiZnT8g3pw=;
	b=eQGN/YOu4BpaqbhagjTUKit9+RPawkMzFQLa+I6dzGj0QTcoWEzAsl7wOx51ZLdzrxKjX9
	SyzTeM7RXSvJXFkhTMeAEdjMipRr6LRZ+H0xn0bbOnhgo7P8YYigtdTwUpaWKPrug0mMKx
	MuaiWSIPpB8Yvc3GYDlVyqc6Au+J6kQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102--Y-HjT7LOJ-Betuoh93dag-1; Thu,
 08 May 2025 10:54:37 -0400
X-MC-Unique: -Y-HjT7LOJ-Betuoh93dag-1
X-Mimecast-MFC-AGG-ID: -Y-HjT7LOJ-Betuoh93dag_1746716076
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41CFC1800370;
	Thu,  8 May 2025 14:54:36 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.32])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 70EEC19560B4;
	Thu,  8 May 2025 14:54:33 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v5 5/6] cgroup/cpuset: Fail if isolated and nohz_full don't leave any housekeeping
Date: Thu,  8 May 2025 16:53:25 +0200
Message-ID: <20250508145319.97794-13-gmonaco@redhat.com>
In-Reply-To: <20250508145319.97794-8-gmonaco@redhat.com>
References: <20250508145319.97794-8-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Currently the user can set up isolated cpus via cpuset and nohz_full in
such a way that leaves no housekeeping CPU (i.e. no CPU that is neither
domain isolated nor nohz full). This can be a problem for other
subsystems (e.g. the timer wheel imgration).

Prevent this configuration by blocking any assignation that would cause
the union of domain isolated cpus and nohz_full to covers all CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/cgroup/cpuset.c | 67 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 95316d39c282..2f1df6f5b988 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -80,6 +80,12 @@ static cpumask_var_t	subpartitions_cpus;
  */
 static cpumask_var_t	isolated_cpus;
 
+/*
+ * Housekeeping CPUs for both HK_TYPE_DOMAIN and HK_TYPE_KERNEL_NOISE
+ */
+static cpumask_var_t	full_hk_cpus;
+static bool		have_boot_nohz_full;
+
 /*
  * Housekeeping (HK_TYPE_DOMAIN) CPUs at boot
  */
@@ -1253,10 +1259,26 @@ static void reset_partition_data(struct cpuset *cs)
 static void isolated_cpus_update(int old_prs, int new_prs, struct cpumask *xcpus)
 {
 	WARN_ON_ONCE(old_prs == new_prs);
-	if (new_prs == PRS_ISOLATED)
+	if (new_prs == PRS_ISOLATED) {
 		cpumask_or(isolated_cpus, isolated_cpus, xcpus);
-	else
+		cpumask_andnot(full_hk_cpus, full_hk_cpus, xcpus);
+	} else {
 		cpumask_andnot(isolated_cpus, isolated_cpus, xcpus);
+		cpumask_or(full_hk_cpus, full_hk_cpus, xcpus);
+	}
+}
+
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
 }
 
 /*
@@ -1323,6 +1345,25 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
 	return isolcpus_updated;
 }
 
+/*
+ * isolcpus_nohz_conflict - check for isolated & nohz_full conflicts
+ * @new_cpus: cpu mask
+ * Return: true if there is conflict, false otherwise
+ *
+ * If nohz_full is enabled and we have isolated CPUs, their combination must
+ * still leave housekeeping CPUs.
+ */
+static bool isolcpus_nohz_conflict(struct cpumask *new_cpus)
+{
+	if (!have_boot_nohz_full)
+		return false;
+
+	if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
+		return true;
+
+	return false;
+}
+
 static void update_exclusion_cpumasks(bool isolcpus_updated)
 {
 	int ret;
@@ -1448,6 +1489,9 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	    cpumask_intersects(tmp->new_cpus, subpartitions_cpus) ||
 	    cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus))
 		return PERR_INVCPUS;
+	if (isolated_cpus_should_update(new_prs, NULL) &&
+	    isolcpus_nohz_conflict(tmp->new_cpus))
+		return PERR_HKEEPING;
 
 	spin_lock_irq(&callback_lock);
 	isolcpus_updated = partition_xcpus_add(new_prs, NULL, tmp->new_cpus);
@@ -1546,6 +1590,9 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 		else if (cpumask_intersects(tmp->addmask, subpartitions_cpus) ||
 			 cpumask_subset(top_cpuset.effective_cpus, tmp->addmask))
 			cs->prs_err = PERR_NOCPUS;
+		else if (isolated_cpus_should_update(prs, NULL) &&
+			 isolcpus_nohz_conflict(tmp->addmask))
+			cs->prs_err = PERR_HKEEPING;
 		if (cs->prs_err)
 			goto invalidate;
 	}
@@ -1877,6 +1924,12 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
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
@@ -2897,6 +2950,8 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		 * Need to update isolated_cpus.
 		 */
 		isolcpus_updated = true;
+		if (isolcpus_nohz_conflict(cs->effective_xcpus))
+			err = PERR_HKEEPING;
 	} else {
 		/*
 		 * Switching back to member is always allowed even if it
@@ -3715,6 +3770,7 @@ int __init cpuset_init(void)
 	BUG_ON(!alloc_cpumask_var(&top_cpuset.exclusive_cpus, GFP_KERNEL));
 	BUG_ON(!zalloc_cpumask_var(&subpartitions_cpus, GFP_KERNEL));
 	BUG_ON(!zalloc_cpumask_var(&isolated_cpus, GFP_KERNEL));
+	BUG_ON(!alloc_cpumask_var(&full_hk_cpus, GFP_KERNEL));
 
 	cpumask_setall(top_cpuset.cpus_allowed);
 	nodes_setall(top_cpuset.mems_allowed);
@@ -3722,17 +3778,24 @@ int __init cpuset_init(void)
 	cpumask_setall(top_cpuset.effective_xcpus);
 	cpumask_setall(top_cpuset.exclusive_cpus);
 	nodes_setall(top_cpuset.effective_mems);
+	cpumask_copy(full_hk_cpus, cpu_present_mask);
 
 	fmeter_init(&top_cpuset.fmeter);
 	INIT_LIST_HEAD(&remote_children);
 
 	BUG_ON(!alloc_cpumask_var(&cpus_attach, GFP_KERNEL));
 
+	have_boot_nohz_full = housekeeping_enabled(HK_TYPE_KERNEL_NOISE);
+	if (have_boot_nohz_full)
+		cpumask_and(full_hk_cpus, cpu_possible_mask,
+			    housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
+
 	have_boot_isolcpus = housekeeping_enabled(HK_TYPE_DOMAIN);
 	if (have_boot_isolcpus) {
 		BUG_ON(!alloc_cpumask_var(&boot_hk_cpus, GFP_KERNEL));
 		cpumask_copy(boot_hk_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN));
 		cpumask_andnot(isolated_cpus, cpu_possible_mask, boot_hk_cpus);
+		cpumask_and(full_hk_cpus, full_hk_cpus, boot_hk_cpus);
 	}
 
 	return 0;
-- 
2.49.0

