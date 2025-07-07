Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288C4219EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855462; cv=none; b=Ri2Q7wrxyORki7sKs5dGhGhJghTeR5OqF5ZXWvT39zSoWuqzHtsGKiHhUJBNL7ENLriobvB1dFxZeBtNnlO2cqoNQNQX1+xEX8UfmqyaA+TVaQILp1zAB1uGb0jPvYZQJ43cKgaozB1ZjZCYS+WmesvK7aM9gld1TvfZSIpqoH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855462; c=relaxed/simple;
	bh=+FmKbdGqKKJjQjR99VcYD+sfcZZdqxfqEH658C1uJOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVEzs9Spnngjhtz+akKAE3Wl6GdQP0GGHzOd1zLmPtVdklrOK1Xfv/jdiIibHX8jWz8YJJmRshvcX1zLeCO/RJpq60FJd1zEc4rF+CC8b6M5UN1+duo9qyA6PU1tl72oRe95lGiIy99V6vEZMoB0SYyIIwthin+T5y5IJVBtaOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4qRma1+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4qRma1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751855461; x=1783391461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+FmKbdGqKKJjQjR99VcYD+sfcZZdqxfqEH658C1uJOQ=;
  b=N4qRma1+zWvIbxeaMWKq/WNzcI1PyaJZOso/9e7XqrIjLSySTC1hGjbm
   84zwN7xodpblCpKsO4zN8YQ4tNUTip1Q0XtXNO9/wkAxznIrJr2jx9Qdo
   GP/jQGric7Z7VGVkQedC78sSHKwKX4pAKVg4ivW9TH4STa9WLS0Ci5t2i
   RR+5YmsCw/7OjJAm30uDqFF5qfVNQC62R0zdZI+WpoHu2vgFirhOsRS+b
   lsmybAVQ7CV6WcKVo0SKmahodyZksj1EKzbfNfDDcT4gk9HirQgc33LPY
   HqqZZSCmHlX0pfxSuwMnmvaEDmmI3IMxDVuZDWKto0x4HH6LBbdk5iKk0
   g==;
X-CSE-ConnectionGUID: oViLwanLRQ6cxtC9GfUfaw==
X-CSE-MsgGUID: 6cXIN2RVQ7u8ZoF1fhF3rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64756915"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="64756915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 19:31:00 -0700
X-CSE-ConnectionGUID: hayDqQuATk2cmyKadK4uDg==
X-CSE-MsgGUID: aO9VYv9SRpm0kCAO/F/6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="159361632"
Received: from linux-pnp-server-17.sh.intel.com ([10.239.166.49])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2025 19:30:58 -0700
From: Pan Deng <pan.deng@intel.com>
To: peterz@infradead.org,
	mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	tianyou.li@intel.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	pan.deng@intel.com
Subject: [PATCH 1/4] sched/rt: Optimize cpupri_vec layout to mitigate cache line contention
Date: Mon,  7 Jul 2025 10:35:25 +0800
Message-ID: <c3fa01bed2f875293ac65425c75a322e8e70e1d3.1751852370.git.pan.deng@intel.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1751852370.git.pan.deng@intel.com>
References: <cover.1751852370.git.pan.deng@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running a multi-instance FFmpeg workload on an HCC system, significant
cache line contention is observed around `cpupri_vec->count` and `mask` in
struct root_domain.

The SUT is a 2-socket machine with 240 physical cores and 480 logical
CPUs. 60 FFmpeg instances are launched, each pinned to 4 physical cores
(8 logical CPUs) for transcoding tasks. Sub-threads use RT priority 99
with FIFO scheduling. FPS is used as score.

perf c2c tool reveals:
root_domain cache line 3:
- `cpupri->pri_to_cpu[0].count` (offset 0x38) is heavily loaded/stored
   and contends with other fields, since counts[0] is more frequently
   updated than others along with a rt task enqueues an empty runq or
   dequeues from a non-overloaded runq.
- cycles per load: ~10K to 59K

cpupri's last cache line:
- `cpupri_vec->count` and `mask` contends. The transcoding threads use
  rt pri 99, so that the contention occurs in the end.
- cycles per load: ~1.5K to 10.5K

This change mitigates `cpupri_vec->count`, `mask` related contentions by
separating each count and mask into different cache lines.

As a result:
- FPS improves by ~11%
- Kernel cycles% drops from ~20% to ~11%
- `count` and `mask` related cache line contention is mitigated, perf c2c
  shows root_domain cache line 3 `cycles per load` drops from ~10K-59K
  to ~0.5K-8K, cpupri's last cache line no longer appears in the report.

Note: The side effect of this change is that struct cpupri size is
increased from 26 cache lines to 203 cache lines.

An alternative approach could be separating `counts` and `masks` into 2
vectors in cpupri_vec (counts[] and masks[]), and add two paddings:
1. Between counts[0] and counts[1], since counts[0] is more frequently
   updated than others.
2. Between the two vectors, since counts[] is read-write access  while
   masks[] is read access when it stores pointers.

The alternative approach introduces the complexity of 31+/21- LoC changes,
it achieves almost the same performance, at the same time, struct cpupri
size is reduced from 26 cache lines to 21 cache lines.

Appendix:
1. Current layout of contended data structures:
struct root_domain {
    atomic_t                   refcount;             /*     0     4 */
    atomic_t                   rto_count;            /*     4     4 */
    struct callback_head rcu __attribute__((__aligned__(8)));/*8 16 */
    cpumask_var_t              span;                 /*    24     8 */
    cpumask_var_t              online;               /*    32     8 */
    bool                       overloaded;           /*    40     1 */
    bool                       overutilized;         /*    41     1 */
    /* XXX 6 bytes hole, try to pack */
    cpumask_var_t              dlo_mask;             /*    48     8 */
    atomic_t                   dlo_count;            /*    56     4 */
    /* XXX 4 bytes hole, try to pack */
    /* --- cacheline 1 boundary (64 bytes) --- */
    struct dl_bw               dl_bw;                /*    64    24 */
    struct cpudl               cpudl;                /*    88    24 */
    u64                        visit_gen;            /*   112     8 */
    struct irq_work            rto_push_work;        /*   120    32 */
    /* --- cacheline 2 boundary (128 bytes) was 24 bytes ago --- */
    raw_spinlock_t             rto_lock;             /*   152     4 */
    int                        rto_loop;             /*   156     4 */
    int                        rto_cpu;              /*   160     4 */
    atomic_t                   rto_loop_next;        /*   164     4 */
    atomic_t                   rto_loop_start;       /*   168     4 */
    /* XXX 4 bytes hole, try to pack */
    cpumask_var_t              rto_mask;             /*   176     8 */
    struct cpupri              cpupri;               /*   184  1624 */
    /* --- cacheline 28 boundary (1792 bytes) was 16 bytes ago --- */
    struct perf_domain *       pd;                   /*  1808     8 */
    /* size: 1816, cachelines: 29, members: 21 */
    /* sum members: 1802, holes: 3, sum holes: 14 */
    /* forced alignments: 1 */
    /* last cacheline: 24 bytes */
} __attribute__((__aligned__(8)));

struct cpupri {
        struct cpupri_vec          pri_to_cpu[101];      /*     0  1616 */
        /* --- cacheline 25 boundary (1600 bytes) was 16 bytes ago --- */
        int *                      cpu_to_pri;           /*  1616     8 */

        /* size: 1624, cachelines: 26, members: 2 */
        /* last cacheline: 24 bytes */
};

struct cpupri_vec {
        atomic_t                   count;                /*     0     4 */

        /* XXX 4 bytes hole, try to pack */

        cpumask_var_t              mask;                 /*     8     8 */

        /* size: 16, cachelines: 1, members: 2 */
        /* sum members: 12, holes: 1, sum holes: 4 */
        /* last cacheline: 16 bytes */
};

2. Perf c2c report of root_domain cache line 3:
-------  -------  ------  ------  ------  ------  ------------------------
 Rmt      Lcl     Store   Data    Load    Total    Symbol
Hitm%    Hitm%   L1 Hit%  offset  cycles  records
-------  -------  ------  ------  ------  ------  ------------------------
 353       44       62    0xff14d42c400e3880
-------  -------  ------  ------  ------  ------  ------------------------
 0.00%    2.27%    0.00%  0x0     21683   6     __flush_smp_call_function_
 0.00%    2.27%    0.00%  0x0     22294   5     __flush_smp_call_function_
 0.28%    0.00%    0.00%  0x0     0       2     irq_work_queue_on
 0.28%    0.00%    0.00%  0x0     27824   4     irq_work_single
 0.00%    0.00%    1.61%  0x0     28151   6     irq_work_queue_on
 0.57%    0.00%    0.00%  0x18    21822   8     native_queued_spin_lock_sl
 0.28%    2.27%    0.00%  0x18    16101   10    native_queued_spin_lock_sl
 0.57%    0.00%    0.00%  0x18    33199   5     native_queued_spin_lock_sl
 0.00%    0.00%    1.61%  0x18    10908   32    _raw_spin_lock
 0.00%    0.00%    1.61%  0x18    59770   2     _raw_spin_lock
 0.00%    0.00%    1.61%  0x18    0       1     _raw_spin_unlock
 1.42%    0.00%    0.00%  0x20    12918   20    pull_rt_task
 0.85%    0.00%   25.81%  0x24    31123   199   pull_rt_task
 0.85%    0.00%    3.23%  0x24    38218   24    pull_rt_task
 0.57%    4.55%   19.35%  0x28    30558   207   pull_rt_task
 0.28%    0.00%    0.00%  0x28    55504   10    pull_rt_task
18.70%   18.18%    0.00%  0x30    26438   291   dequeue_pushable_task
17.28%   22.73%    0.00%  0x30    29347   281   enqueue_pushable_task
 1.70%    2.27%    0.00%  0x30    12819   31    enqueue_pushable_task
 0.28%    0.00%    0.00%  0x30    17726   18    dequeue_pushable_task
34.56%   29.55%    0.00%  0x38    25509   527   cpupri_find_fitness
13.88%   11.36%   24.19%  0x38    30654   342   cpupri_set
 3.12%    2.27%    0.00%  0x38    18093   39    cpupri_set
 1.70%    0.00%    0.00%  0x38    37661   52    cpupri_find_fitness
 1.42%    2.27%   19.35%  0x38    31110   211   cpupri_set
 1.42%    0.00%    1.61%  0x38    45035   31    cpupri_set

3. Perf c2c report of cpupri's last cache line
-------  -------  ------  ------  ------  ------  ------------------------
 Rmt      Lcl     Store   Data    Load    Total    Symbol
Hitm%    Hitm%   L1 Hit%  offset  cycles  records
-------  -------  ------  ------  ------  ------  ------------------------
 149       43       41    0xff14d42c400e3ec0
-------  -------  ------  ------  ------  ------  ------------------------
 8.72%   11.63%    0.00%  0x8     2001    165   cpupri_find_fitness
 1.34%    2.33%    0.00%  0x18    1456    151   cpupri_find_fitness
 8.72%    9.30%   58.54%  0x28    1744    263   cpupri_set
 2.01%    4.65%   41.46%  0x28    1958    301   cpupri_set
 1.34%    0.00%    0.00%  0x28    10580   6     cpupri_set
69.80%   67.44%    0.00%  0x30    1754    347   cpupri_set
 8.05%    4.65%    0.00%  0x30    2144    256   cpupri_set

Signed-off-by: Pan Deng <pan.deng@intel.com>
Signed-off-by: Tianyou Li <tianyou.li@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/cpupri.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/cpupri.h b/kernel/sched/cpupri.h
index d6cba0020064..245b0fa626be 100644
--- a/kernel/sched/cpupri.h
+++ b/kernel/sched/cpupri.h
@@ -9,7 +9,7 @@
 
 struct cpupri_vec {
 	atomic_t		count;
-	cpumask_var_t		mask;
+	cpumask_var_t		mask	____cacheline_aligned;
 };
 
 struct cpupri {
-- 
2.43.5

