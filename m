Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601312045BC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206246; cv=none; b=cyUDcaWwS/vnAC/9vr6QVtia4FcTQMPd7eMvED7v9EKZ0kKV2VJJLgwBwEqIE3MmRS+wNHMY36fQXAFbakXWR9x6Kv8NRZJFtJBcBk4umPV+oZOEHo9eVoYQAJ5ouoUVWfAi5+myL9jL7wvER+fafEXrrPk3isKNaugWgbBd+nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206246; c=relaxed/simple;
	bh=UD6nYLwiuBEsKgfJlf0Unq67sRh4l0bjKGn9AJ0VpF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J6F7uqEaxT32UEBxrSQCL+3cojdRbPZQQFQKhOytZdS+PTN+q7WKXy50s3loBm9q6HkxZqYYtT6UFXynFuF4pnt/SnFD2VH06ivZy5P7mvOfsYwPgoo1ypV6YM94Nf2l8p9aPyFJGZuLth/e8Cyoxqk5pAXICdDi4f8LTD4Hsc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5G6iEoA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5G6iEoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206245; x=1776742245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UD6nYLwiuBEsKgfJlf0Unq67sRh4l0bjKGn9AJ0VpF0=;
  b=M5G6iEoAu7fNeFu+iumhwMY356Zm623f8ujNFitSCUq18XM22GqKhn//
   VnJCdo76lNoAuDAqH+aZoNdGRoSUqSKJj/ZSmz6qk0oRd6bsIK1ZLWgx2
   vJeD0YcggG/EOVqhh3yzmGZb++iyjmBU3AMpXm91aFL0j6/uYDSijsMjx
   LqTbdBRluvlPHGQqD+XJodEQ3lQOxeN8nYecVSlgmaoEV1rt/z56IS9hf
   Zo02ylcxHKJFPJJWQAwDRNddckwXeGAZciLz2KndSZGl5eUCAmuLjeO7J
   T4dsXznKnCDg539b44E5Xp8xSCU9E90dKFySynjlVBoEAkw2jLUNT3lbH
   w==;
X-CSE-ConnectionGUID: eJdKTGJ5RwGjlSIsKnJ+Zw==
X-CSE-MsgGUID: zSr1hSx/TPm4VczOmWLm2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="64144193"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="64144193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:30:44 -0700
X-CSE-ConnectionGUID: lRA4h+KMRiCO6ODq9AiIoA==
X-CSE-MsgGUID: U+OblyDQQ46Vo4z3tm1qgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="131355364"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa009.jf.intel.com with ESMTP; 20 Apr 2025 20:30:40 -0700
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
Subject: [RFC PATCH 3/5] sched: Avoid task migration within its preferred LLC
Date: Mon, 21 Apr 2025 11:25:04 +0800
Message-Id: <01a54d63193fab5c819aab75321f6aa492491997.1745199017.git.yu.c.chen@intel.com>
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

It was found that when running schbench, there is a
significant amount of in-LLC task migration, even if
the wakee is woken up on its preferred LLC. This
leads to core-to-core latency and impairs performance.

Inhibit task migration if the wakee is already in its
preferred LLC. Meanwhile, prevent the load balancer
from treating the task as cache-hot if this task is
being migrated out of its preferred LLC, rather than
comparing the occupancy between CPUs.

With this enhancement applied, the in-LLC task migration
has been reduced a lot(use PATCH 5/5 to verify).

It was found that when schbench is running, there is a
significant amount of in-LLC task migration, even if the
wakee is woken up on its preferred LLC. This leads to
core-to-core latency and impairs performance.

Inhibit task migration if the wakee is already in its
preferred LLC. Meanwhile, prevent the load balancer from
treating the task as cache-hot if this task is being migrated
out of its preferred LLC, instead of comparing occupancy
between CPUs directly.

With this enhancement applied, the in-LLC task migration has
been reduced significantly, (use PATCH 5/5 to verify).

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 kernel/sched/fair.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 22b5830e7e4e..1733eb83042c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8806,6 +8806,12 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 	if (cpu < 0)
 		return prev_cpu;
 
+	/*
+	 * No need to migrate the task if previous and preferred CPU
+	 * are in the same LLC.
+	 */
+	if (cpus_share_cache(prev_cpu, cpu))
+		return prev_cpu;
 
 	if (static_branch_likely(&sched_numa_balancing) &&
 	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
@@ -9553,14 +9559,13 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
 		return 0;
 
 #ifdef CONFIG_SCHED_CACHE
-	if (sched_feat(SCHED_CACHE) && p->mm && p->mm->pcpu_sched) {
-		/*
-		 * XXX things like Skylake have non-inclusive L3 and might not
-		 * like this L3 centric view. What to do about L2 stickyness ?
-		 */
-		return per_cpu_ptr(p->mm->pcpu_sched, env->src_cpu)->occ >
-		       per_cpu_ptr(p->mm->pcpu_sched, env->dst_cpu)->occ;
-	}
+	/*
+	 * Don't migrate task out of its preferred LLC.
+	 */
+	if (sched_feat(SCHED_CACHE) && p->mm && p->mm->mm_sched_cpu >= 0 &&
+	    cpus_share_cache(env->src_cpu, p->mm->mm_sched_cpu) &&
+	    !cpus_share_cache(env->src_cpu, env->dst_cpu))
+		return 1;
 #endif
 
 	delta = rq_clock_task(env->src_rq) - p->se.exec_start;
-- 
2.25.1

