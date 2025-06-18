Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C23B2F4A0D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270911; cv=none; b=qgOqtbwj/b1lT+pk59OtjXjeOpPuI2zhfn0D21JXULqPLorw/ZgDKmNNS7Urzt/SfBFCUz801jIRaBO9Cslv2B7LxeJe//HjIB3+4P845payLN3vcYxAOxAbfLaUARgyfK6W4UUcOiOk0TZHcE9SbDMxaEDC/rvvNnXsMH1W0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270911; c=relaxed/simple;
	bh=nwpdkAoJpW4EOqPZQh+uhJ+qmZILgurvv6g4rDaWrYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HAZIoXDlwzbldKWFUzY/Q4Jaxhhc2Mkt0bb9WOBfRPLAMS3DspRW02WEau/R32ErYRWHNC9ZlNYoWyuZiO4M7Awr204pB/+urb4Knb8pmbJ2BIdcVmJE5vaTPh/a1tQlov0Ea2J7+pXzMfBW5Wl8AAuJzrs80wakQeKZDNOWJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivStBZKK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivStBZKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270909; x=1781806909;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nwpdkAoJpW4EOqPZQh+uhJ+qmZILgurvv6g4rDaWrYo=;
  b=ivStBZKKr1kLat+jKvOOQxbf9d4bC1I/SJy7LDib/zgN3n589asFL4+r
   PYsbbyBX6DjZAdbQ1Ik/G6Sc6usq0dD9Ziu/7QfHFyk6vz2whi6PSRkGc
   qh0Xwo9lT9BAKy1pR/Oo42AYGiTgM5CVtwmFP8HFWa4TdxGk4w9dRkMX3
   4DxdIZo1ar93mu1DEN1+6WJ0elyBKkJVxfHeC50jqR9/1tsGUnexjnQ7X
   3xWpf6BNsr2eTOb+JyArdlGpErCa4hDLn0ptngc6kRC2FeOvceeJAY/Rw
   iKQTxZNYHsLyWzeH16AJJGbNG66qTaf60D44RqGpvBPrHgL3ZhdDghMpz
   A==;
X-CSE-ConnectionGUID: x7oHEr0dTrOTH6OFzpdkdg==
X-CSE-MsgGUID: UfwNMRYcRZKjKAWmE406aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931496"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:48 -0700
X-CSE-ConnectionGUID: FdoRwVvNTIiAzpt945cGzw==
X-CSE-MsgGUID: TkAAX+2KQ6qAC2qWqI6SgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959815"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:48 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
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
	Len Brown <len.brown@intel.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [RFC patch v3 04/20] sched: Avoid calculating the cpumask if the system is overloaded
Date: Wed, 18 Jun 2025 11:27:52 -0700
Message-Id: <2901db739c1792eb9ece08a2b8d3b8de32efd0eb.1750268218.git.tim.c.chen@linux.intel.com>
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

From: K Prateek Nayak <kprateek.nayak@amd.com>

If the SIS_UTIL cuts off idle cpu search, result of the cpumask_and() is
of no use. Since select_idle_cpu() can now be called twice per wake up
in the select_idle_sibling() due to cache aware wake up, this overhead
can be visible in benchmarks like hackbench.

To save some additional cycles, especially in cases where we target
the LLC frequently and the search bails out because the LLC is busy,
only calculate the cpumask if the system is not overloaded.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 567ad2a0cfa2..6a2678f9d44a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7918,8 +7918,6 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 	int i, cpu, idle_cpu = -1, nr = INT_MAX;
 	struct sched_domain_shared *sd_share;
 
-	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
-
 	if (sched_feat(SIS_UTIL)) {
 		sd_share = rcu_dereference(per_cpu(sd_llc_shared, target));
 		if (sd_share) {
@@ -7931,6 +7929,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 		}
 	}
 
+	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
+
 	if (static_branch_unlikely(&sched_cluster_active)) {
 		struct sched_group *sg = sd->groups;
 
-- 
2.32.0

