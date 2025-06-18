Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23042FC004
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270918; cv=none; b=prYV6kiZ/g5CU/Hn41eTTdcf+nsgsejRMF9YlOFqiewBWHbnrWCTP9kxBZckxiRQ1VvQpER8tjN7QgbQ4c0zij9LcckrJVkX+Cpu6SZazEmgx+hiz7gehO5ul8BA5MMZlqJwJ29H/mrdXyUEt1ZTi0aUDrhm0/ch8vBT2HSUIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270918; c=relaxed/simple;
	bh=iM3ABT5TB/b+NuSHpzRR+MTBRchvN6UYmnNwwhN0XIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UorTPRN8/VKWenu+tPzkgHwZNthp7FChWvQMxBlnU9ZXHkqWwmKJBieJwmssJMgRaYf3QdYXGefsj9yI6+t1biKPLv8Rtoe+CX8vRIiRQisArNkktnElOHhLTlNzPEMBul5M5VTszzGE4dDKi0vulBDpxRNY+j7NieHcUzTr6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvIH6C13; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvIH6C13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270916; x=1781806916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iM3ABT5TB/b+NuSHpzRR+MTBRchvN6UYmnNwwhN0XIw=;
  b=dvIH6C13m8eg38MbrhvutO7tNOXJjoru+H/dxlcGqGgIEqt/3lnui+ls
   Ax0AdHjwUeIvAv0vKW02IFqBb62BDr2GZeTL5v+KcPecWocJqc8AwLJPW
   p6Re4BEEp9c3O5ht3z8Rh9lsWPW/V46p2aLbDPxAIC/89O9nQObGsK7fd
   S23TsGqyhc3rr4+MaCrD+MN/GwL1Up9gi5S59wfKXiFZTw2VyXU6i/ieb
   p3W93cwc0GbptCXluULNXuQNFNSSINbzdZ13xvmBr8sQkUjlHJttZa6ng
   jxyrfFMwPCHG2cw2U4W0FjchU7U1sQuFxJb51T+CMtt3NmPwYWM3XaTsO
   Q==;
X-CSE-ConnectionGUID: WGpTAeg9TUi2Z/6fkCAarg==
X-CSE-MsgGUID: 7dA/FD/PQxGrwYmk5u2dRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931607"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931607"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:56 -0700
X-CSE-ConnectionGUID: bXFqvuY3S6+9Zd3SiPYU/Q==
X-CSE-MsgGUID: /yrcI1KcQO2+tdFpydQB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959988"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:55 -0700
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
Subject: [RFC patch v3 12/20] sched: Calculate the total number of preferred LLC tasks during load balance
Date: Wed, 18 Jun 2025 11:28:00 -0700
Message-Id: <4a37811c12bbca8cb669904ad67dad3b7e99a552.1750268218.git.tim.c.chen@linux.intel.com>
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

During load balancing between LLCs, gather the number of tasks
on each runqueue of a source LLC.

For example, consider a system with 4 sched groups LLC0, LLC1,
..., LLC3. We are balancing towards LLC3 and LLC0 has 3 tasks
preferring LLC3, LLC1 has 2 tasks preferring LLC3 and LLC2 has
1 task preferring LLC3. LLC0 with most tasks preferring LLC3
will be chosen as the busiest LLC to pick the tasks from.

The number of tasks preferring the destination LLC are gathered
from each run queue for a source LLC.

For example, consider the sched_group LLC0 with two CPUs, CPU0
and CPU1. On CPU0, 2 tasks prefer to run on LLC3, and on CPU1,
one task prefers LLC3. The total number of tasks preferring
LLC3 in LLC0 is 2 + 1 = 3.

These statistics enable the load balancer to select tasks from
a sched_group that best aligns tasks with their preferred LLCs.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ba62b445bbbb..99f3cee7b276 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10459,6 +10459,9 @@ struct sg_lb_stats {
 	unsigned int nr_numa_running;
 	unsigned int nr_preferred_running;
 #endif
+#ifdef CONFIG_SCHED_CACHE
+	unsigned int nr_pref_llc[MAX_LLC];
+#endif
 };
 
 /*
@@ -10937,6 +10940,14 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		if (cpu_overutilized(i))
 			*sg_overutilized = 1;
 
+#ifdef CONFIG_SCHED_CACHE
+		if (sched_feat(SCHED_CACHE)) {
+			int j;
+
+			for (j = 0; j < max_llcs; ++j)
+				sgs->nr_pref_llc[j] += rq->nr_pref_llc[j];
+		}
+#endif
 		/*
 		 * No need to call idle_cpu() if nr_running is not 0
 		 */
-- 
2.32.0

