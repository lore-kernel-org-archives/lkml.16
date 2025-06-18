Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FAE2FE315
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270929; cv=none; b=onyBzk/JV7TsJ4rqzmPQxAynG5u8Uiv7NZBFqjIXX/vDeaVGTR6XM7u2t1DQFh6/8C8E442NQANkusHEp/W0G7MKp4l8bRLhTJDwy/WN6tGk0cfY5IF9GwVw8LyU0L2HDfqYL9FKb8t0ShAVnCE5wIeOC+RJNYKLspjyv345oV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270929; c=relaxed/simple;
	bh=GCa+xOiJ3NtDwAxf3UTuM7FdSBlF1t2VJbPM88NipeI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lTB8OKjeVhk51AV9Z+yat4UlgOV4jPlwKTO3U5BqELX9+KB8jLro3KX85VFITsktx5Jba308vcVyotxvDMbwXzp5+qGVCYSvBcIyb/4B4Tot6SKFpcXHB6THYMdfQWeqbaG5Ds7ceyhFMgv2UbsDTiF0uZ6QidbwEUWatyQKrK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXZaT3cj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXZaT3cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270924; x=1781806924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GCa+xOiJ3NtDwAxf3UTuM7FdSBlF1t2VJbPM88NipeI=;
  b=IXZaT3cj2WJHpQsa0eOY4RKLxD0XHxWtW3DBUY3jLShIsyHbPv6kV6PS
   wBTZARncyqd81MhW2Dh6tAi77Kk2I1a86TYlMhKSh30I/NZi9Ohg6RQEG
   B2e6bpm5YRM81JbZP0vAzdhRwJTJ6z+fezdmgGlo8EIBWlV8PKGUd4V1y
   Q1K/xPtqmRaKI9stHeDWuocbpuMmO319jhINNuhdgtWOIH748A4vI8EIM
   vIBaj9+wydAwFrFxiz/O6rePd8/Uv/i5oca2c3tnOmtRZT0khUyTei51V
   l/RHQAM9KvyJRqc9LiIGKWsg+Dg76/187VJoJGXKdR6viVZo8MkXQOzWR
   g==;
X-CSE-ConnectionGUID: bOCOGOeLQ5mxgMbCQRgg+A==
X-CSE-MsgGUID: LC2a0LmnQ2qip+retIyBQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931720"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:22:03 -0700
X-CSE-ConnectionGUID: rby7BZr4SRm2YmXdsRLRtQ==
X-CSE-MsgGUID: N6pda5x3S0GkUhyJrY38ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960173"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:22:03 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Juri Lelli <juri.lelli@redhat.com>,
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
	Len Brown <len.brown@intel.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [RFC patch v3 20/20] sched: Introduce SCHED_CACHE_WAKE to control LLC aggregation on wake up
Date: Wed, 18 Jun 2025 11:28:08 -0700
Message-Id: <1f8e7ec2d84a94ac0a31ca6182218ffaf7e166df.1750268218.git.tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1750268218.git.tim.c.chen@linux.intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce SCHED_CACHE_WAKE feature to enable or disable cache-aware
wake up. Disable this feature by default because cache-aware wakeup
is overly aggressive in stacking wakees of the same process on the same LLC,
if they are frequently woken up.

The wake ups can be much more frequent than load balances, adding
much overhead when load balance alone for LLC aggregation is sufficient.

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c     | 6 +++++-
 kernel/sched/features.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index af742601f2d7..32c90fab0d63 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9028,7 +9028,7 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 	struct mm_struct *mm = p->mm;
 	int cpu;
 
-	if (!sched_feat(SCHED_CACHE))
+	if (!sched_feat(SCHED_CACHE) || !sched_feat(SCHED_CACHE_WAKE))
 		return prev_cpu;
 
 	if (!mm || p->nr_cpus_allowed == 1)
@@ -9041,6 +9041,10 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 	if (cpus_share_cache(cpu, prev_cpu))
 		return prev_cpu;
 
+	if (_get_migrate_hint(prev_cpu, cpu,
+			      task_util(p), true) == mig_forbid)
+		return prev_cpu;
+
 	if (static_branch_likely(&sched_numa_balancing) &&
 	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
 		/*
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 11dbd74cd365..44b408cf0dd4 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -89,6 +89,7 @@ SCHED_FEAT(SIS_UTIL, true)
 
 SCHED_FEAT(SCHED_CACHE, true)
 SCHED_FEAT(SCHED_CACHE_LB, true)
+SCHED_FEAT(SCHED_CACHE_WAKE, false)
 /*
  * Issue a WARN when we do multiple update_rq_clock() calls
  * in a single rq->lock section. Default disabled because the
-- 
2.32.0

