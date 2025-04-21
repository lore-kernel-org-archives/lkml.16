Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36EE256C93
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206192; cv=none; b=Jilyj5ypNG7yZID/jonMEYeBwfrZx38dkrfgyly4nMbz/KHs3MMd5PiF7tKpDZ9/4V6ZlEiD6t6WOrCrNU9PdhOQArp+63DLyFdZaGb5ZEXjMTSpLN0tKGhYFrni85HVuHTA2swZbqY+a1hxTL23DIAtLYjHji1z21S4DQTG2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206192; c=relaxed/simple;
	bh=OM0nAaGd3JcLLZTLK2bZYs40W8rs+4yGk9C1iGBIVFg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BGGt+DHc5X7QurKR4GXbQ/MxvfxsF3kGaoJiKbFI3Fllgh1iQvu9sVpmifsgw1fyJREZPMCvGMydmjFZh3t/Ko4dgM/8p01m8rluplajcW94rvECztFxUZNr6HGmTA6I5z71PztyWizrlfEeD6/NLNPnBwbRAsnghYWJj3Si9n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NR0FXKur; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NR0FXKur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206191; x=1776742191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OM0nAaGd3JcLLZTLK2bZYs40W8rs+4yGk9C1iGBIVFg=;
  b=NR0FXKurACYQMAG7XioRrCqBtwyyXRBt3r4gpNEG50oI69mOEXLz/KY4
   X13I44R+ClNVIleMss3P1L2h1gemHrIrC3Y0YGwH2phlYTbEMgjmyDTRn
   YVvjezaksRbSWfKTcj2uJojuSpYJ7mJCxdNM0j3gMUfgYjmS4gwZ1llwA
   yzpKYopuJwmNbXMoE7cPiEewo+a5gwDa2R5YbCQM59w1sJFjxGP1wYoVi
   fNcQsQ+4ndeCREE26Ifp3gEXGmVcjYUA1xjks+NQYK8rOoyIR8H9GnmqG
   Ng6WLrwVvNwp4EYqHKTBdKvrOx2bEN2VH2EulTHTKPQbshF44xS1Iu5Pi
   A==;
X-CSE-ConnectionGUID: p9j19AxTSA+7QSOi5TpmyQ==
X-CSE-MsgGUID: tSmdaz00RTS+DsPtG9i2hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="58103901"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="58103901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:29:50 -0700
X-CSE-ConnectionGUID: 7DsBu+/CTpi0B9Dv8Aqa5Q==
X-CSE-MsgGUID: Cw49p87/TuWJPpPit5gruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="136700224"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa004.fm.intel.com with ESMTP; 20 Apr 2025 20:29:46 -0700
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
Subject: [RFC PATCH 0/5] sched: Introduce Cache aware scheduling
Date: Mon, 21 Apr 2025 11:23:59 +0800
Message-Id: <cover.1745199017.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a respin of the cache-aware scheduling proposed by Peter[1].
In this patch set, some known issues in [1] were addressed, and the performance
regression was investigated and mitigated.

Cache-aware scheduling aims to aggregate tasks with potential shared resources
into the same cache domain. This approach enhances cache locality, thereby optimizing
system performance by reducing cache misses and improving data access efficiency.

In the current implementation, threads within the same process are considered as
entities that potentially share resources. Cache-aware scheduling monitors the CPU
occupancy of each cache domain for every process. Based on this monitoring, it endeavors
to migrate threads within a given process to its cache-hot domains, with the goal of
maximizing cache locality.

Patch 1 constitutes the fundamental cache-aware scheduling. It is the same patch as [1].
Patch 2 comprises a series of fixes for Patch 1, including compiling warnings and functional
fixes.
Patch 3 fixes performance degradation that arise from excessive task migrations within the
preferred LLC domain.
Patch 4 further alleviates performance regressions when the preferred LLC becomes saturated.
Patch 5 introduces ftrace events, which is used to track task migrations triggered by wakeup
and load balancer. This addition facilitate performance regression analysis.

The patch set is applied on top of v6.14 sched/core,
commit 4ba7518327c6 ("sched/debug: Print the local group's asym_prefer_cpu")

schbench was tested on EMR and Zen3 Milan. An improvement in tail latency was observed when 
the LLC was underloaded; however, some regressions were still evident when the LLC was
saturated. Additionally, the load balance should be adjusted to further address these
regressions.

[1] https://lore.kernel.org/all/20250325120952.GJ36322@noisy.programming.kicks-ass.net/


Chen Yu (4):
  sched: Several fixes for cache aware scheduling
  sched: Avoid task migration within its preferred LLC
  sched: Inhibit cache aware scheduling if the preferred LLC is over
    aggregated
  sched: Add ftrace to track task migration and load balance within and
    across LLC

Peter Zijlstra (1):
  sched: Cache aware load-balancing

 include/linux/mm_types.h       |  44 ++++
 include/linux/sched.h          |   4 +
 include/linux/sched/topology.h |   4 +
 include/trace/events/sched.h   |  51 ++++
 init/Kconfig                   |   4 +
 kernel/fork.c                  |   5 +
 kernel/sched/core.c            |  13 +-
 kernel/sched/fair.c            | 461 +++++++++++++++++++++++++++++++--
 kernel/sched/features.h        |   1 +
 kernel/sched/sched.h           |   8 +
 10 files changed, 569 insertions(+), 26 deletions(-)

-- 
2.25.1

