Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9EB231A57
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614895; cv=none; b=pNwgxYF91XvKdfsf3eCUWg3OGMAz5SZ2cjScJkbYVq+jt+s7EzzfG2/pHXuqEajHE2vCW2FqiIUadMhZLPtv6LZC5kDb0PRtsyekSNMrCZ723ZKB85xZhHKoHkcyARUpB6eY7R5jvUX+kOcEaEbVs9smRHbCat1ZKrwntsFziYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614895; c=relaxed/simple;
	bh=bWF7cTzo58e8FEJAXTR1xHC4XdCu52qz9BUGyeHyfiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ci4ln2qyoN6LAIfod5lDecYEudnXgOzDKcPYP1XtTkUSFL0lmSSheu7m9OKGaQ87eY4iO+0VYBhZGIy0ZriJ0PfbGF6EYLbHVOnRKmB0jpFQZM7ohRaFfiaV/DQVlbvEJv+tNCD6ob9VpDXgt1mDOkoCZsq/OoaEt7C9CKr8sjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YZZ9M9lp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YZZ9M9lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748614892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHKKHnaIUnGjmDt1R62BJHyQuPnUgNgmp6vg7RSSbZk=;
	b=YZZ9M9lpB7lMvTzPjOHxqYLnNof8ClD6+A69dv7txRNHMbydau2yiYVAjLq/amM+W5vWAv
	RcRx7NHWEmWX19JQbShOUnWcg3t/6apbZdUfvOaagGz74VStSHpHajUISWiqbT+Uc2fagX
	w4CLPSNNV19o4iVInKS6jUvuIocL4WE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-REaVvqZxOzyHSPFAVIZ-sg-1; Fri,
 30 May 2025 10:21:28 -0400
X-MC-Unique: REaVvqZxOzyHSPFAVIZ-sg-1
X-Mimecast-MFC-AGG-ID: REaVvqZxOzyHSPFAVIZ-sg_1748614887
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD600180035C;
	Fri, 30 May 2025 14:21:27 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.33.197])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BB47530001B7;
	Fri, 30 May 2025 14:21:24 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v6 3/6] cgroup/cpuset: Rename update_unbound_workqueue_cpumask() to update_exclusion_cpumasks()
Date: Fri, 30 May 2025 16:20:28 +0200
Message-ID: <20250530142031.215594-4-gmonaco@redhat.com>
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

update_unbound_workqueue_cpumask() updates unbound workqueues settings
when there's a change in isolated CPUs, but it can be used for other
subsystems requiring updated when isolated CPUs change.

Generalise the name to update_exclusion_cpumasks() to prepare for other
functions unrelated to workqueues to be called in that spot.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/cgroup/cpuset.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 24b70ea3e6ce9..d0936b5d9920a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1325,7 +1325,7 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
 	return isolcpus_updated;
 }
 
-static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
+static void update_exclusion_cpumasks(bool isolcpus_updated)
 {
 	int ret;
 
@@ -1456,7 +1456,7 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	list_add(&cs->remote_sibling, &remote_children);
 	cpumask_copy(cs->effective_xcpus, tmp->new_cpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 	cpuset_force_rebuild();
 	cs->prs_err = 0;
 
@@ -1497,7 +1497,7 @@ static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
 	compute_effective_exclusive_cpumask(cs, NULL, NULL);
 	reset_partition_data(cs);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 	cpuset_force_rebuild();
 
 	/*
@@ -1565,7 +1565,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 	if (xcpus)
 		cpumask_copy(cs->exclusive_cpus, xcpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 	if (adding || deleting)
 		cpuset_force_rebuild();
 
@@ -1908,7 +1908,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		WARN_ON_ONCE(parent->nr_subparts < 0);
 	}
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 
 	if ((old_prs != new_prs) && (cmd == partcmd_update))
 		update_partition_exclusive_flag(cs, new_prs);
@@ -2933,7 +2933,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 	else if (isolcpus_updated)
 		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 
 	/* Force update if switching back to member & update effective_xcpus */
 	update_cpumasks_hier(cs, &tmpmask, !new_prs);
-- 
2.49.0

