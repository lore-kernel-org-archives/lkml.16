Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF5F218596
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319618; cv=none; b=YoeP0XMc4BWAL4s47eTU4n0u+aS6AoNHzFE3BkeQWVwO8QDjbrkt8MIYBUdUD76Qjf5feO0B3h+mrx2QDlea9v92YpOJkiL9b6IxHKueF/HQ4uDUyTUQ2LBG01X2dScnGR08pQNy8g/3mDbZnQOpV7vbkQa5VU6HAzRxyClDDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319618; c=relaxed/simple;
	bh=Wx7EkHpEKpF0iXlyn2dwo76kz1GGR/Yk/XzsioU02cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0uGFd85WHiFKPjr2CyfD+++RAQPrpWj24UoDx1yYYXecMq+ma8j6D8iChqjeUQeKQ0lNGruZy7GfkkKH4c3O4eNeqVnpYZfkjCUSBEt8zvC9JxDe1Q9ptdgAXB/eJIuTK5zjyNtDHaF6bILPwXzjm9/RooTG6zP30xqFwLDku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=jlJpAGqF; arc=none smtp.client-ip=139.138.61.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="jlJpAGqF"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750319616; x=1781855616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wx7EkHpEKpF0iXlyn2dwo76kz1GGR/Yk/XzsioU02cc=;
  b=jlJpAGqFpZ/5pypWv7b3WGzY6O0WdhZk7QlO/WvQ4UtaBZq8QRj06wwy
   htnDZckURYvR+1Z6rMTfgYLldWMCtY0ATCXrdfCx3N4qn0Lv1tP9wAsCm
   ZS+0QYjRLquUo8KzS2j1XrlVPR2UfF4HvEhyIJWKPFLFzPwFuXO1enffP
   8uUVGnQ/oBwiar7Vw+mcHUay99lZyTnPu5tIJnnwdN3gJovn83QnC7Mqa
   creiFUX9fGfpgp+VzK0FHGGQ6tlDz9NFXmnw+90iicdTFBolR5Lj/FOJB
   iufGEkCnvX7SGfXiC6mxHj5hvdyCIawtWF9nl8F+QydzUZm4A9ZaDx+t+
   A==;
X-CSE-ConnectionGUID: 0HTVxlj7SbiJR1QjsUzbhA==
X-CSE-MsgGUID: 0eMjcV9fSPuNQLW9+NevqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="182154775"
X-IronPort-AV: E=Sophos;i="6.16,248,1744038000"; 
   d="scan'208";a="182154775"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 16:53:28 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 06A88D6EDD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:53:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B903ACF7CF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:53:25 +0900 (JST)
Received: from FNSTPC.g08.fujitsu.local (unknown [10.167.135.44])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D97371A008D;
	Thu, 19 Jun 2025 15:53:21 +0800 (CST)
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
	Valentin Schneider <vschneid@redhat.com>
Subject: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE accounting
Date: Thu, 19 Jun 2025 15:52:45 +0800
Message-ID: <20250619075245.3272384-1-lizhijian@fujitsu.com>
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
The issue manifests under specific memory pressure conditions:
when top-tier memory (DRAM) is exhausted by memhog and allocation begins
in lower-tier memory (CXL). After terminating memhog, the stats show:

$ grep -e pgpromote /proc/vmstat
pgpromote_success 2579
pgpromote_candidate 1

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


Reported-by: Yasunori Gotou (Fujitsu) <y-goto@fujitsu.com>
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---

This is markes as RFC because I am uncertain whether we originally
intended for this or if it was overlooked.

However, the current situation where pgpromote_candidate < pgpromote_success
is indeed confusing when interpreted literally.

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
---
 kernel/sched/fair.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..4715cd4fa248 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1940,11 +1940,13 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
 		struct pglist_data *pgdat;
 		unsigned long rate_limit;
 		unsigned int latency, th, def_th;
+		long nr = folio_nr_pages(folio)
 
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
2.43.5

