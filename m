Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7322EE292
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433054; cv=none; b=F81WeS4ImOQ4YRq3Ky2zV1G1P/UTmQXu7tV1OWe8L0Z4AgAf8RHgZarwQapIOvCGeMuHTxV6pEM4YwYJBGlIaUlWQqdllUVkyPGTWvYwdP+rlJjnqKiNEi/xDUoNONrWBsKD+VZDNj1pO8onPddbnRO6hGKSTGDSbOTNlpYiAbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433054; c=relaxed/simple;
	bh=vnW8kJaV0O0HSpg7bi8GGu5oDp8CCjUQLMI+a+c5Vcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkZjYujV1dOlDSsBCVXZoPb2EtcaRs6+lvLk9H+HxuCbH2PnGM22GrVGp3H/6R2L6x4T//rO4YDWQSMsas++jFGA+y4L13Ko00/yHSvhcg1r6AfE2XSbOh5K8Wfjt1vT7vf3T4bP1H5YFEmf1PIQHL+9VR76su+uyNnL9Fs0DEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNKp1ZbC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNKp1ZbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9261DC4AF0B;
	Fri, 20 Jun 2025 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433054;
	bh=vnW8kJaV0O0HSpg7bi8GGu5oDp8CCjUQLMI+a+c5Vcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PNKp1ZbCYdnBF13DAcFDhh/M24iQe9UvTOiMbkv5Np46wgVnHH4/w7hasjZsfke1G
	 ID8YPOrLGM0ffC+gyo6ifmHIkHJPBkF5tJ2dvHUwQyfjqimxU40wjbDQTr2b99oBpi
	 FYrWlC+u9CmY87WFOl7lHu9ttmGqoHuqrjff4064WlhbNrcItvNO85j7B/VzcWcrcv
	 tDvpdz4tyGnKb1u0PHLljrCvIs8d6AvB+G8olw1oUAeqeElaSvMk9cgnlYEqOs8Xwr
	 1NH0Ph93k4SWZRxJwrsIBCCMd7IsPVEWeV7NMcr15a5Lzh5urT5NtrWep+LMXe7h+q
	 C0e1tfv9VCXuA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 22/27] kthread: Include unbound kthreads in the managed affinity list
Date: Fri, 20 Jun 2025 17:23:03 +0200
Message-ID: <20250620152308.27492-23-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The managed affinity list currently contains only unbound kthreads that
have affinity preferences. Unbound kthreads globally affine by default
are outside of the list because their affinity is automatically managed
by the scheduler (through the fallback housekeeping mask) and by cpuset.

However in order to preserve the preferred affinity of kthreads, cpuset
will delegate the isolated partition update propagation to the
housekeeping and kthread code.

Prepare for that with including all unbound kthreads in the managed
affinity list.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 59 ++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 24008dd9f3dc..138bb41ca916 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -366,9 +366,10 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
 	if (kthread->preferred_affinity) {
 		pref = kthread->preferred_affinity;
 	} else {
-		if (WARN_ON_ONCE(kthread->node == NUMA_NO_NODE))
-			return;
-		pref = cpumask_of_node(kthread->node);
+		if (kthread->node == NUMA_NO_NODE)
+			pref = housekeeping_cpumask(HK_TYPE_KTHREAD);
+		else
+			pref = cpumask_of_node(kthread->node);
 	}
 
 	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_KTHREAD));
@@ -381,32 +382,29 @@ static void kthread_affine_node(void)
 	struct kthread *kthread = to_kthread(current);
 	cpumask_var_t affinity;
 
-	WARN_ON_ONCE(kthread_is_per_cpu(current));
+	if (WARN_ON_ONCE(kthread_is_per_cpu(current)))
+		return;
 
-	if (kthread->node == NUMA_NO_NODE) {
-		housekeeping_affine(current, HK_TYPE_KTHREAD);
-	} else {
-		if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
-			WARN_ON_ONCE(1);
-			return;
-		}
-
-		mutex_lock(&kthread_affinity_lock);
-		WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
-		list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
-		/*
-		 * The node cpumask is racy when read from kthread() but:
-		 * - a racing CPU going down will either fail on the subsequent
-		 *   call to set_cpus_allowed_ptr() or be migrated to housekeepers
-		 *   afterwards by the scheduler.
-		 * - a racing CPU going up will be handled by kthreads_online_cpu()
-		 */
-		kthread_fetch_affinity(kthread, affinity);
-		set_cpus_allowed_ptr(current, affinity);
-		mutex_unlock(&kthread_affinity_lock);
-
-		free_cpumask_var(affinity);
+	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
+		WARN_ON_ONCE(1);
+		return;
 	}
+
+	mutex_lock(&kthread_affinity_lock);
+	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
+	list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
+	/*
+	 * The node cpumask is racy when read from kthread() but:
+	 * - a racing CPU going down will either fail on the subsequent
+	 *   call to set_cpus_allowed_ptr() or be migrated to housekeepers
+	 *   afterwards by the scheduler.
+	 * - a racing CPU going up will be handled by kthreads_online_cpu()
+	 */
+	kthread_fetch_affinity(kthread, affinity);
+	set_cpus_allowed_ptr(current, affinity);
+	mutex_unlock(&kthread_affinity_lock);
+
+	free_cpumask_var(affinity);
 }
 
 static int kthread(void *_create)
@@ -924,8 +922,11 @@ static int kthreads_online_cpu(unsigned int cpu)
 			ret = -EINVAL;
 			continue;
 		}
-		kthread_fetch_affinity(k, affinity);
-		set_cpus_allowed_ptr(k->task, affinity);
+
+		if (k->preferred_affinity || k->node != NUMA_NO_NODE) {
+			kthread_fetch_affinity(k, affinity);
+			set_cpus_allowed_ptr(k->task, affinity);
+		}
 	}
 
 	free_cpumask_var(affinity);
-- 
2.48.1

