Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3233086
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750817723; cv=none; b=lzf7wTR7mEDeVbFBlRUuKue9I/gtQnsxwyQ+qwq6G5NDfijytBC1gI/RXCwEeUjDknXpBpuErwKBX0OPVMWT/cFvhUIre3QWpv5mYIq7S43RJVwNZEfowZ9ZO4S2LkXiQsqrMdzlwcBI6Bf/7eY3Z0FHgeyEFf6u+5+LWBj+x9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750817723; c=relaxed/simple;
	bh=FzxUUqh0xMibWP3tI2gdghaU5jOpT5eCOiDlKcYLzUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcQ26eGMYz64vV73lxpFZ+RwaDUdfu+4liaDIOSrh9Dm/YW+wZmaAWnCS0F2j4JgeMeHZ9I4j0RgGzqoSlw2WhbYPoabJqrvuSlzLq1jT+3TMMBoSrgwWp00XZU3yWk/wnGrBCq3Z4v1PeJZvM9dyccIP5eBj9yVYbHt0LJG5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=i+rYGofY; arc=none smtp.client-ip=68.232.139.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="i+rYGofY"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750817721; x=1782353721;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FzxUUqh0xMibWP3tI2gdghaU5jOpT5eCOiDlKcYLzUw=;
  b=i+rYGofYcTVaqdXyxD+C/eU1rU6uJip+i+lXzdcLBMn9mAfO2yVt6oHY
   oDovvyZv48TRPx7J1by9AMRe5GC0Mt0XTU4EASASO4HjrKr7JWB3xK02D
   zefHEkf0RbyiGgBb03Rg1wwJr+3BlP5NEea9srOOTPPVUMDobz72Rp1Bd
   pkFZWmDAg6bP+9U6mj6vPn8ZH08/+jInVM31MABNACCcXhdC6eq0TOWjQ
   gztC3aF5yBUF5HHZO1+iOyoR7gpwg0erZ+BLWTHU/Lko6+jB3VKOsGygS
   SvH2eXzqHtyCkT3XP55jNF+exOGucXX8vFc+IQM3Fj4oj4IYLlED4Vzhu
   g==;
X-CSE-ConnectionGUID: cVmwckgmQDqEJU0ckWJuMA==
X-CSE-MsgGUID: 07BO5NyjRoOMys7JblvUmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="203088323"
X-IronPort-AV: E=Sophos;i="6.16,263,1744038000"; 
   d="scan'208";a="203088323"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 11:14:10 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 13B1B1C01685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:10 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 5081218001FB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C0D49D50F4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:14:07 +0900 (JST)
Received: from FNSTPC.g08.fujitsu.local (unknown [10.167.135.44])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D9EC1A000B;
	Wed, 25 Jun 2025 10:14:05 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	y-goto@fujitsu.com,
	Li Zhijian <lizhijian@fujitsu.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	lkp@intel.com
Subject: [PATCH RFC v2] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE accounting
Date: Wed, 25 Jun 2025 10:13:52 +0800
Message-ID: <20250625021352.2291544-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Goto-san reported confusing pgpromote statistics where
the pgpromote_success count significantly exceeded pgpromote_candidate.

On a system with three nodes (nodes 0-1: DRAM 4GB, node 2: NVDIMM 4GB):
 # Enable demotion only
 echo 1 > /sys/kernel/mm/numa/demotion_enabled
 numactl -m 0-1 memhog -r200 3500M >/dev/null &
 pid=$!
 sleep 2
 numactl memhog -r100 2500M >/dev/null &
 sleep 10
 kill -9 $pid # terminate the 1st memhog
 # Enable promotion
 echo 2 > /proc/sys/kernel/numa_balancing

After a few seconds, we observeed `pgpromote_candidate < pgpromote_success`
$ grep -e pgpromote /proc/vmstat
pgpromote_success 2579
pgpromote_candidate 0

In this scenario, after terminating the first memhog, the conditions for
pgdat_free_space_enough() are quickly met, triggering promotion.
However, these migrated pages are only accounted for in PGPROMOTE_SUCCESS,
not in PGPROMOTE_CANDIDATE.

This update increments PGPROMOTE_CANDIDATE within the free space branch
when a promotion decision is made, which may alter the mechanism of the
rate limit. Consequently, it becomes easier to reach the rate limit than
it was previously.

For example:
Rate Limit = 100 pages/sec
Scenario:
  T0: 90 free-space migrations
  T0+100ms: 20-page migration request

Before:
  Rate limit is *not* reached: 0 + 20 = 20 < 100
  PGPROMOTE_CANDIDATE: 20
After:
  Rate limit is reached: 90 + 20 = 110 > 100
  PGPROMOTE_CANDIDATE: 110

Due to the fact that the rate limit mechanism recalculates every second,
theoretically, only within that one second can the transition from
pgdat_free_space_enough() to !pgdat_free_space_enough() in top-tier
remaining memory be affected.

Moreover, previously, within this one-second span, promotions caused by
pgdat_free_space_enough() are not restricted by rate limits.
This theoretically makes it easier to cause application latency.

The current modification can better control the rate limit in cases of
transition from pgdat_free_space_enough() to !pgdat_free_space_enough()
within one second.

Cc: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Reported-by: Yasunori Gotou (Fujitsu) <y-goto@fujitsu.com>
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
V2:
Fix compiling error # Reported by LKP

As Ying suggested, we need to assess whether this change causes regression.
However, considering the stringent conditions this patch involves,
properly evaluating it may be challenging, as the outcomes depend on your
perspective. Much like in a zero-sum game, if someone benefits, another
might lose.

If there are subsequent results, I will update them here.

Cc: lkp@intel.com
Here, I hope to leverage the existing LKP benchmark to evaluate the
potential impacts. The ideal evaluation conditions are:
1. Installed with DRAM + NVDIMM (which can be simulated).
2. NVDIMM is used as system RAM (configurable via daxctl).
3. Promotion is enabled (`echo 2 > /proc/sys/kernel/numa_balancing`).

Alternative:
We can indeed eliminate the potential impact within
pgdat_free_space_enough(), so that the rate limit behavior remains as
before.

For instance, consider the following change:
                if (pgdat_free_space_enough(pgdat)) {
                        /* workload changed, reset hot threshold */
                        pgdat->nbp_threshold = 0;
+                        pgdat->nbp_rl_nr_cand += nr;
                        mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE, nr);
                        return true;
                }

RFC:
I am uncertain whether we originally intended for this discrepancy or if
it was overlooked.

However, the current situation where pgpromote_candidate < pgpromote_success
is indeed confusing when interpreted literally.
---
 kernel/sched/fair.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..505b40f8897a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1940,11 +1940,13 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
 		struct pglist_data *pgdat;
 		unsigned long rate_limit;
 		unsigned int latency, th, def_th;
+		long nr = folio_nr_pages(folio);
 
 		pgdat = NODE_DATA(dst_nid);
 		if (pgdat_free_space_enough(pgdat)) {
 			/* workload changed, reset hot threshold */
 			pgdat->nbp_threshold = 0;
+			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE, nr);
 			return true;
 		}
 
@@ -1958,8 +1960,7 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
 		if (latency >= th)
 			return false;
 
-		return !numa_promotion_rate_limit(pgdat, rate_limit,
-						  folio_nr_pages(folio));
+		return !numa_promotion_rate_limit(pgdat, rate_limit, nr);
 	}
 
 	this_cpupid = cpu_pid_to_cpupid(dst_cpu, current->pid);
-- 
2.41.0

