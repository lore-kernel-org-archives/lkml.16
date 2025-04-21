Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753641ADC8D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206234; cv=none; b=Uy1+upQv+uUMpMtgF3JdjUicyIKngsw5KOw8YkddDgZcW0VsMc2a+E6HM13qBYjjlEaIKGO+NyOyJf65IQr4ntHIHi/ypZ6wADfj1cfF1oFdfa9ZgSWIvnHC/CmuDK5ypjMPswJqsix5vceL0saN10HBNjaIF/3bevoBPnqWSbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206234; c=relaxed/simple;
	bh=Uvyzn2iZjV1/tyvMqIEGzXXaiEHvY5yO7ykOj+isebM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o+tyMEDZ5YgwJczsbzqLlnM8yzWqy3DxjbnSBoiuhoRmqIng7QDyEB/vmIjRaMCEpJOcZs4yJZWQ/NPUJLUEDNmGVw794Fx8MKPjdWpo0OIKfuE0ellRK2hvoiENiaHe/duxMbLhn9JuakkZdpVELKFlKhz3lxmaZreerdIr9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGedbg1b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGedbg1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206232; x=1776742232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uvyzn2iZjV1/tyvMqIEGzXXaiEHvY5yO7ykOj+isebM=;
  b=iGedbg1bBvbtXPixA9ALpn4sR2v4hQOxGm7IynDmayVjcuQKKrUhTrW8
   JBENO/GUMN3gYmWmyXM16TlgbkH3JlrkMAWaAlBxkxxr/kW3iKOG2qrCF
   Pk2oopRVRrT2JkjoRD35+1wVN94h52/RXZuOjhQN0QVBOKg3G5WhceUdg
   6tpBO7CF+NI0J54oxcRs1sa5kDuWPwkrJE8dTixT13Ex0YAp/8l/2Duw8
   xJp4ES7wEvPqRicpSVStLskBmyQK8kgDYSBwYWGmP8q4/FotSXE34u78M
   qkFwSsgPaLj7ri+xytItc3Kv3XQiolg6kkU34/gcYyzsNabhfHM1DIEzl
   w==;
X-CSE-ConnectionGUID: 0qxie4TnSjOYjKCjHfB6yA==
X-CSE-MsgGUID: zN66KwU3T5iWRjdlVjGmHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50563108"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="50563108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:30:30 -0700
X-CSE-ConnectionGUID: B3f+p0sFS9qo+OAGS9RZaQ==
X-CSE-MsgGUID: Z0kNp9jLSnSxv6NyrZjBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="154772663"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa002.fm.intel.com with ESMTP; 20 Apr 2025 20:30:24 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Libo Chen <libo.chen@oracle.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [RFC PATCH 2/5] sched: Several fixes for cache aware scheduling
Date: Mon, 21 Apr 2025 11:24:41 +0800
Message-Id: <660bc36a8aacc6ba55fbcf8b0f9f05b6326e69ce.1745199017.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745199017.git.yu.c.chen@intel.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Fix the compile errors on per-CPU allocation.
2. Enqueue tasks to the target CPU instead of the current CPU;
   otherwise, the per-CPU occupancy will be messed up.
3. Fix the NULL LLC sched domain issue(Libo Chen).
4. Avoid duplicated epoch check in task_tick_cache()
5. Introduce sched feature SCHED_CACHE to control cache aware
   scheduling

TBD suggestion in previous version:
move cache_work from per task to per mm_struct, consider the actual cpu
capacity in fraction_mm_sched() (Abel Wu)

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 include/linux/mm_types.h |  4 ++--
 kernel/sched/fair.c      | 15 +++++++++------
 kernel/sched/features.h  |  1 +
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 013291c6aaa2..9de4a0a13c4d 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1411,11 +1411,11 @@ static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumas
 #endif /* CONFIG_SCHED_MM_CID */
 
 #ifdef CONFIG_SCHED_CACHE
-extern void mm_init_sched(struct mm_struct *mm, struct mm_sched *pcpu_sched);
+extern void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *pcpu_sched);
 
 static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
 {
-	struct mm_sched *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
+	struct mm_sched __percpu *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
 	if (!pcpu_sched)
 		return -ENOMEM;
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 23ea35dbd381..22b5830e7e4e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1175,7 +1175,7 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
 #define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
 #define EPOCH_OLD	5		/* 50 ms */
 
-void mm_init_sched(struct mm_struct *mm, struct mm_sched *_pcpu_sched)
+void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
 {
 	unsigned long epoch;
 	int i;
@@ -1254,7 +1254,7 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	if (!mm || !mm->pcpu_sched)
 		return;
 
-	pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
+	pcpu_sched = per_cpu_ptr(p->mm->pcpu_sched, cpu_of(rq));
 
 	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
 		__update_mm_sched(rq, pcpu_sched);
@@ -1286,9 +1286,6 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
 
 	guard(raw_spinlock)(&mm->mm_sched_lock);
 
-	if (mm->mm_sched_epoch == rq->cpu_epoch)
-		return;
-
 	if (work->next == work) {
 		task_work_add(p, work, TWA_RESUME);
 		WRITE_ONCE(mm->mm_sched_epoch, rq->cpu_epoch);
@@ -1322,6 +1319,9 @@ static void task_cache_work(struct callback_head *work)
 			unsigned long occ, m_occ = 0, a_occ = 0;
 			int m_cpu = -1, nr = 0, i;
 
+			if (!sd)
+				continue;
+
 			for_each_cpu(i, sched_domain_span(sd)) {
 				occ = fraction_mm_sched(cpu_rq(i),
 							per_cpu_ptr(mm->pcpu_sched, i));
@@ -8796,6 +8796,9 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 	struct mm_struct *mm = p->mm;
 	int cpu;
 
+	if (!sched_feat(SCHED_CACHE))
+		return prev_cpu;
+
 	if (!mm || p->nr_cpus_allowed == 1)
 		return prev_cpu;
 
@@ -9550,7 +9553,7 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
 		return 0;
 
 #ifdef CONFIG_SCHED_CACHE
-	if (p->mm && p->mm->pcpu_sched) {
+	if (sched_feat(SCHED_CACHE) && p->mm && p->mm->pcpu_sched) {
 		/*
 		 * XXX things like Skylake have non-inclusive L3 and might not
 		 * like this L3 centric view. What to do about L2 stickyness ?
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 3c12d9f93331..d2af7bfd36bf 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -87,6 +87,7 @@ SCHED_FEAT(TTWU_QUEUE, true)
  */
 SCHED_FEAT(SIS_UTIL, true)
 
+SCHED_FEAT(SCHED_CACHE, true)
 /*
  * Issue a WARN when we do multiple update_rq_clock() calls
  * in a single rq->lock section. Default disabled because the
-- 
2.25.1

