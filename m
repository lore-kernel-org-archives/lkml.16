Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546862F948D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270915; cv=none; b=gCit7OdxmL/z+sHqvOYlmAu0jpeZwqhZeORAcAbKfGEmC7Cut1d8DS6/6wZGZvCrl4vEp3HCh8qjH6ozHZZ6tcNiYj+z1Y0m+CEOlg676Q1clxzwBbJ2P+CbCmGGNeEg3rwixeD6+R0v81UsIKJXJfMsf8UU4IJzxCienwRrWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270915; c=relaxed/simple;
	bh=GRt1KcpJc3uX3j1lW75IjTwwtuVzCFPIjuwEQmJ7o0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FBJTd0ukxWRW+/MIo7zsf0SmGsGIBox8sqZYavmOM5fv6LOEqVyOr4wp2ndfb2WlEQFkw2Pp36oF0gqWn9mhyDwfdEsnpnqdcv1XeDKQshvz9ZWQHVjdtgZQp4BkNGTp0CFAVo9mAHC/VnVDZvOjoYt4QE/rqzevU8YFJ+7bEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSgKa/Xs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSgKa/Xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270911; x=1781806911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GRt1KcpJc3uX3j1lW75IjTwwtuVzCFPIjuwEQmJ7o0c=;
  b=MSgKa/Xs8zOJ4H2lqLt5AoI5bQ2Z5hgnpUup28q98ByliGPYLMtTuVoT
   +lSE1UHq2qbmWe+CGFnXXNN0O11daPjgIRfzwTIAXeYYAwWhWm/SJOst4
   2yClxpLCWgokA1/yxRHLW2J/20uBhmoIokqluLvohhQNoEZU8oeZgagEC
   Urji0g1zMpdionTkeyTJrvrZh+ExyPjKEjVPQFLk6s+JnHq/wiwVKWRjm
   iKAY3vicJCdgEZaqexyIOwSVKYAdj5Ds+qaro+e1pYLQIVMXZfJCil89W
   2TwNI95OlQaBFc3aLSCKuvjf4TUtpWBzOnftomqkcPANu/uLnxs7/ZZJ5
   Q==;
X-CSE-ConnectionGUID: OsOzpi1fQVmQCEIlEJnnaA==
X-CSE-MsgGUID: b5N1VeS7R72ao2jICSSBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931510"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931510"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:49 -0700
X-CSE-ConnectionGUID: 03mrFPsdTSSv8opMC44BDA==
X-CSE-MsgGUID: vBS5/z1NSra3RrHanVjnzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959835"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:49 -0700
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
Subject: [RFC patch v3 05/20] sched: Add hysteresis to switch a task's preferred LLC
Date: Wed, 18 Jun 2025 11:27:53 -0700
Message-Id: <7371f30196b317c0c5a0ae3fa463ec76a4dc69ef.1750268218.git.tim.c.chen@linux.intel.com>
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

Switching a process's preferred LLC generates lots of task
migrations across LLCs. To avoid frequent switches
of home LLC, implement the following policy:

1. Require a 2x occ change threshold to switch preferred LLC
2. Don't discard preferred LLC for a task

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6a2678f9d44a..7fb2322c5d9e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1175,6 +1175,14 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
 #define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
 #define EPOCH_OLD	5		/* 50 ms */
 
+static int llc_id(int cpu)
+{
+	if (cpu < 0)
+		return -1;
+
+	return per_cpu(sd_llc_id, cpu);
+}
+
 void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
 {
 	unsigned long epoch;
@@ -1299,6 +1307,7 @@ static void task_cache_work(struct callback_head *work)
 	struct task_struct *p = current;
 	struct mm_struct *mm = p->mm;
 	unsigned long m_a_occ = 0;
+	unsigned long last_m_a_occ = 0;
 	int cpu, m_a_cpu = -1;
 	cpumask_var_t cpus;
 
@@ -1337,11 +1346,13 @@ static void task_cache_work(struct callback_head *work)
 					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
 			}
 
-			a_occ /= nr;
+			// a_occ /= nr;
 			if (a_occ > m_a_occ) {
 				m_a_occ = a_occ;
 				m_a_cpu = m_cpu;
 			}
+			if (llc_id(cpu) == llc_id(mm->mm_sched_cpu))
+				last_m_a_occ = a_occ;
 
 			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
 				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
@@ -1355,13 +1366,10 @@ static void task_cache_work(struct callback_head *work)
 		}
 	}
 
-	/*
-	 * If the max average cache occupancy is 'small' we don't care.
-	 */
-	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
-		m_a_cpu = -1;
-
-	mm->mm_sched_cpu = m_a_cpu;
+	if (m_a_occ > (2 * last_m_a_occ)) {
+		/* avoid the bouncing of mm_sched_cpu */
+		mm->mm_sched_cpu = m_a_cpu;
+	}
 
 	free_cpumask_var(cpus);
 }
-- 
2.32.0

