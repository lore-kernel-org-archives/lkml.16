Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE22FBFED
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270917; cv=none; b=P5gHhCOHlQM9p9ku+pEKNmIWE5uT5+S4kV5oxYtsqpEFVlr9fc0D6NpdlPtZ/gPYaVzFIEml4c8bRLDf/rApQ0P+4X3sXKjvOocZZdUlhKVWOp4g7Z3DkjKRfUK4EbZevwf1AguUUNQhOhr+jz43UGTNA9B35kqwXwKY13QXM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270917; c=relaxed/simple;
	bh=RUIbYeV38UehaAavCqtUVWreQbqIvMzQPunFd7dVPyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nzm7Ku6skORzgLcSoIMVnTsqDhfLNjvSWDaPtFERhQETbGDLm9wp9WChfMfmJr8ewsuksm4tdeOptPipC31yfOalmbU4lZM/tCb9mFe/8h4/7fz9qSGQznPwU1NdTCxhel20eNqlBKW2RqU7JuzYJfo7KMA4C1hPgt5AyDArxK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mvd9Vfzt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mvd9Vfzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270915; x=1781806915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RUIbYeV38UehaAavCqtUVWreQbqIvMzQPunFd7dVPyE=;
  b=Mvd9VfztrhHTmbjDNIxNZ/GGBzT7vnFVGVF55+uq3hkxTLk1MtmoMPMI
   U1wXH7aIGF8CNiN6VHqa6PsrvDZd1CfkDD23bWW38C2q0vuFWUdOR1rsg
   nQS1Vx/AFI6+tsMY9N0jzPGLqIf//4y/teLgExUZvlOCdWkv+ZRBOa19l
   Q/hMdcFdmtGM8n1dub+WeL8RYjxLFhZ3ifnf7sPjEA0wCKGpnuAk0VE1o
   xK9Vp73JH2YBrGV5TiS4D6hJAPIirmfsd5xm4xtPojrdCuhbtq4bZsQTB
   QF0NjbAxGEPgdEHlXrMy/bsHGHXWbrQ1UYQwmOgyrnmyyqbinzuyILx3v
   g==;
X-CSE-ConnectionGUID: s21awipcQP25JSLcWRQsFw==
X-CSE-MsgGUID: 8CcDA+u7TbaNoc5uJcqMDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931593"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:55 -0700
X-CSE-ConnectionGUID: SW2wbjbRTeKDU7dLzQyhpA==
X-CSE-MsgGUID: /CMNaZ0xTte1NASZbF1kDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959969"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:54 -0700
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
Subject: [RFC patch v3 11/20] sched: Introduce per runqueue task LLC preference counter
Date: Wed, 18 Jun 2025 11:27:59 -0700
Message-Id: <5334cbd97788ba58938444f6e6f07e6c433a9e1c.1750268218.git.tim.c.chen@linux.intel.com>
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

Each runqueue is assigned a static array, where each element indicates
the number of tasks preferring a particular LLC mapped to the
array index.

For example, rq->nr_pref_llc[3] = 2 signifies that there are 2 tasks on
this runqueue which prefer to run within LLC3 (indexed from 0 to MAX_LLC
across the entire system). With this information, the load balancer can
make better decisions to select the busiest runqueue and migrate tasks
to their preferred LLC domains.

Note: The static array could be converted to an xarray in the future.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c  | 36 +++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 88ff47194faa..ba62b445bbbb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1195,16 +1195,45 @@ static inline int llc_idx(int cpu)
 	return per_cpu(sd_llc_idx, cpu);
 }
 
+static inline int pref_llc_idx(struct task_struct *p)
+{
+	return llc_idx(p->preferred_llc);
+}
+
 static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
 {
+	int pref_llc;
+
 	rq->nr_llc_running += (p->preferred_llc != -1);
 	rq->nr_pref_llc_running += (p->preferred_llc == task_llc(p));
+
+	if (p->preferred_llc < 0)
+		return;
+
+	pref_llc = pref_llc_idx(p);
+	if (pref_llc < 0)
+		return;
+
+	++rq->nr_pref_llc[pref_llc];
 }
 
 static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
 {
+	int pref_llc;
+
 	rq->nr_llc_running -= (p->preferred_llc != -1);
 	rq->nr_pref_llc_running -= (p->preferred_llc == task_llc(p));
+
+	if (p->preferred_llc < 0)
+		return;
+
+	pref_llc = pref_llc_idx(p);
+	if (pref_llc < 0)
+		return;
+
+	/* avoid negative counter */
+	if (rq->nr_pref_llc[pref_llc] > 0)
+		--rq->nr_pref_llc[pref_llc];
 }
 
 void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
@@ -1417,8 +1446,13 @@ void init_sched_mm(struct task_struct *p)
 
 void reset_llc_stats(struct rq *rq)
 {
-	if (rq->nr_llc_running)
+	int i;
+
+	if (rq->nr_llc_running) {
+		for (i = 0; i < MAX_LLC; ++i)
+			rq->nr_pref_llc[i] = 0;
 		rq->nr_llc_running = 0;
+	}
 
 	rq->nr_pref_llc_running = 0;
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c83a71ac8ca..391ddc0195f8 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1107,6 +1107,7 @@ struct rq {
 #ifdef CONFIG_SCHED_CACHE
 	unsigned int		nr_pref_llc_running;
 	unsigned int		nr_llc_running;
+	unsigned int		nr_pref_llc[MAX_LLC];
 #endif
 #ifdef CONFIG_NO_HZ_COMMON
 #ifdef CONFIG_SMP
-- 
2.32.0

