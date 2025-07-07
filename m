Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF7219EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855453; cv=none; b=k8g8Cszhnp58431312n71ej/cgQkGExD0Z8pUB/4omE5B160fLTt/Jpw7zLwq3/2D4qEu72PLkMinYNEvry+bIKxasWPtMeF2VUd7Vk+SHNcNXlg8OZ52i1S5OmZXIDDsuJ/qHt1JqbOW6SBmEWbw6MLN8tMFeozm0A+Kog0SRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855453; c=relaxed/simple;
	bh=45Jh8xqcMuVmWcxUNLWFpAIQj11BsmVdcsHdw2DhEFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MM2TodcoWtvIozSDPoYTn2aaOlg8vp4Pdf51nXtIvFaJ8iJJo82HzcSckr6K83Ljus9teN2D/sUdeBgLt7In8huzJ/O0IKDUDQIEO7q1Szq3kDfk5gCAD0OErDj/b4LX4dpQSELyyggplgdrALqjAL+UCpGdUn4M1hrP1iI/s1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tc9Wy5p5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tc9Wy5p5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751855451; x=1783391451;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=45Jh8xqcMuVmWcxUNLWFpAIQj11BsmVdcsHdw2DhEFs=;
  b=Tc9Wy5p5IdvQKTrXBs5QjrB50sO3uxYKIveiZz1S5LSNIBBDpvbr55lk
   Lq3JOdu74KQab3xzoVIYytAA16FF86A0RNY0OOOfsu5sMEcFYTaAU8SD5
   plPpjFLRUHhlt55aYr9DpPVgug/ifTZoDAiL/q41OovpVJUBkTGNacUlQ
   u9xw+j1XNncCuj7XAsIIX1Qo/1YC/feMS1CccFFhO8J2H267cIDBYJFDn
   MAbqPDP1u4gjOxCRzeV3nahOlMgWq3d3YZS6L5giFsgncXqNTg78kBTdw
   8GU+vziKU/Ns5n7EmGiPHjDBEApEgmDWxfkff611sM7jGyTnG/8LhUL15
   A==;
X-CSE-ConnectionGUID: yDOTd0axQ/uaz5dUKyxpRg==
X-CSE-MsgGUID: hPDaqs3mRLuB0RnW+dg7Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64756902"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="64756902"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 19:30:51 -0700
X-CSE-ConnectionGUID: j4qGjXP1TDWvGd8nes6JKg==
X-CSE-MsgGUID: ms2kk6OmSbuRE+1nfyi74A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="159361605"
Received: from linux-pnp-server-17.sh.intel.com ([10.239.166.49])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2025 19:30:49 -0700
From: Pan Deng <pan.deng@intel.com>
To: peterz@infradead.org,
	mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	tianyou.li@intel.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	pan.deng@intel.com
Subject: [PATCH 0/4] sched/rt: mitigate root_domain cache line contention
Date: Mon,  7 Jul 2025 10:35:24 +0800
Message-ID: <cover.1751852370.git.pan.deng@intel.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Deng Pan <pan.deng@intel.com>

When running multi-instance FFmpeg workload in cloud environment,
cache line contention is severe during the access to root_domain data
structures, which significantly degrades performance.

The SUT is a 2-socket machine with 240 physical cores and 480 logical
CPUs. 60 FFmpeg instances are launched, each pinned to 4 physical cores
(8 logical CPUs) for transcoding tasks. Sub-threads use RT priority 99
with FIFO scheduling. FPS is used as score.

Profiling shows the kernel consumes ~20% of CPU cycles, which is
excessive in this scenario. The overhead primarily comes from RT task
scheduling functions like `cpupri_set`, `cpupri_find_fitness`,
`dequeue_pushable_task`, `enqueue_pushable_task`, `pull_rt_task`,
`__find_first_and_bit`, and `__bitmap_and`. This is due to read/write
contention on root_domain cache lines.

The `perf c2c` report, sorted by contention severity, reveals:

root_domain cache line 3:
- `cpupri->pri_to_cpu[0].count` is heavily loaded/stored,
   since counts[0] is more frequently updated than others along with a
   rt task enqueues an empty runq or dequeues from a non-overloaded runq.
- `rto_mask` is heavily loaded
- `rto_loop_next` and `rto_loop_start` are frequently stored
- `rto_push_work` and `rto_lock` are lightly accessed
- cycles per load: ~10K to 59K.

root_domain cache line 1:
- `rto_count` is frequently loaded/stored
- `overloaded` is heavily loaded
- cycles per load: ~2.8K to 44K

cpumask (bitmap) cache line of cpupri_vec->mask:
- bits are loaded during cpupri_find
- bits are stored during cpupri_set
- cycles per load: ~2.2K to 8.7K

The end cache line of cpupri:
- `cpupri_vec->count` and `mask` contends. The transcoding threads use
  rt pri 99, so that the contention occurs in the end.
- cycles per load: ~1.5K to 10.5K

According to above, we propose 4 patches to mitigate the contention.
Patch 1: Reorganize `cpupri_vec`, separate `count`, `mask` fields,
         reducing contention on root_domain cache line 3 and cpupri's
         last cache line.
Patch 2: Restructure `root_domain` structure to minimize contention of
         root_domain cache line 1 and 3 by reordering fields.
Patch 3: Split `root_domain->rto_count` to per-NUMA-node counters,
         reducing the contention on root_domain cache line 1.
Patch 4: Split `cpupri_vec->cpumask` to per-NUMA-node bitmaps, reducing
         load/store contention on the cpumask bitmap cache line.

Evaluation:

Performance improvements (FPS, relative to baseline):
- Patch 1: +11.0%
- Patch 2:  +5.0%
- Patch 3:  +4.0%
- Patch 4:  +3.8%

Kernel CPU cycle usage reduction:
- Patch 1: 20.0% -> 11.0%
- Patch 2: 20.0% -> 17.7%
- Patch 3: 20.0% -> 18.6%
- Patch 4: 20.0% -> 18.7%

Cycles per load reduction (by perf c2c report):
- Patch 1:
  - `root_domain` cache line 3:    10K–59K    ->  0.5K–8K
  - `cpupri` last cache line:      1.5K–10.5K ->  eliminated
- Patch 2:
  - `root_domain` cache line 1:    2.8K–44K   ->  2.1K–2.7K
  - `root_domain` cache line 3:    10K–59K    ->  eliminated
- Patch 3:
  - `root_domain` cache line 1:    2.8K–44K   ->  eliminated
- Patch 4:
  - `cpupri_vec->mask` cache line: 2.2K–8.7K  ->  0.5K–2.2K

Comments are appreciated.

Pan Deng (4):
  sched/rt: Optimize cpupri_vec layout to mitigate cache line contention
  sched/rt: Restructure root_domain to reduce cacheline contention
  sched/rt: Split root_domain->rto_count to per-NUMA-node counters
  sched/rt: Split cpupri_vec->cpumask to per NUMA node to reduce
    contention

 kernel/sched/cpupri.c   | 200 ++++++++++++++++++++++++++++++++++++----
 kernel/sched/cpupri.h   |   6 +-
 kernel/sched/rt.c       |  65 ++++++++++++-
 kernel/sched/sched.h    |  61 ++++++------
 kernel/sched/topology.c |   7 ++
 5 files changed, 291 insertions(+), 48 deletions(-)

-- 
2.43.5

