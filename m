Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94F12FA65E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270916; cv=none; b=UeyCyGRjZM/3la5K7W5DZr7Fqbx/pXCPlXhvjgFOgYIXCDUEtBpJd57eBNDqgWvGJv8lBL+mUxf5kMWOHyA8RedaqjM+j02Jn9B78T1lChIZ2n/HcQ4ovyIdvMDIjh6GJZ0rAG3+mVxq530ReordkAU/8zkHRYpmSCOgeBTL+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270916; c=relaxed/simple;
	bh=qCkIhL6rGvZ+dzcJ6E4keINBL3DRXFHBoE2OhjjXt84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HdR2Xf4V3RIfo4sN94qeqMUmpg9AvXnNLA7hey4fd0WeAkTF0T4KDeRwQToF9rBlqaacSEzIC3ldfo3gUF0PSPBuQsHrIDtfOE0rb1e2syBB9Uy0m0Pyuh26N9i8RFDaGsxHG8i9HPtFTwvfAZ4PLiBu3T6sgQXJ8rTnQ7LikE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctebiIFc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctebiIFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270914; x=1781806914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qCkIhL6rGvZ+dzcJ6E4keINBL3DRXFHBoE2OhjjXt84=;
  b=ctebiIFceLs/6XgbLjwR55dJzRZbzapx502Dxi0l/NvCbPchL4pYfpTv
   mX4fL7dCkAt2uRGyN8gw9ioXWlpiuXifnjj+0MNxYIis5NlGMWrVuELt9
   p2k9M3g2gYolFGidjsV123j/xwGYMbxHzvGAIu7gZe6H/GBXSmGkX0BuE
   BbuXEWcCw0iqTOGZJwjotpQh0+0BjJedRDEyx/wJT4zQv28fNmgWwOtv1
   f4suB3nLhc82MQOzvFx7z7nB0rbHQlioxhlaZW+cZpn776eX5rSkia9jE
   XjCTqRmxuGrPP0O3C/HkP/FgXNG323aYUO7tahFuWXcmZCHjHmALri07M
   Q==;
X-CSE-ConnectionGUID: NPicx326QWy/zNraeo2kXQ==
X-CSE-MsgGUID: V9D14qHKQa6053W/dqsxug==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931566"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931566"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:53 -0700
X-CSE-ConnectionGUID: 7bYdnBGCRGq67Ukuexzzfg==
X-CSE-MsgGUID: bMqkNepHSg24kSctAmlfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959924"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:52 -0700
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
Subject: [RFC patch v3 09/20] sched: Introduce task preferred LLC field
Date: Wed, 18 Jun 2025 11:27:57 -0700
Message-Id: <7b9df4433d73ce415a27925ce42cec53774debaf.1750268218.git.tim.c.chen@linux.intel.com>
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

With cache aware scheduling enabled, each process is assigned
a preferred LLC id, which will be used to quickly identify
the LLC domain this thread prefers to run. This is similar to
numa_preferred_nid for NUMA balance.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 include/linux/sched.h | 1 +
 init/init_task.c      | 3 +++
 kernel/sched/fair.c   | 7 +++++++
 3 files changed, 11 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 7ce95a32e9ff..2f1cb7445733 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1404,6 +1404,7 @@ struct task_struct {
 
 #ifdef CONFIG_SCHED_CACHE
 	struct callback_head		cache_work;
+	int				preferred_llc;
 #endif
 
 #ifdef CONFIG_RSEQ
diff --git a/init/init_task.c b/init/init_task.c
index e557f622bd90..5fffbe766f57 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -188,6 +188,9 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 	.numa_group	= NULL,
 	.numa_faults	= NULL,
 #endif
+#ifdef CONFIG_SCHED_CACHE
+	.preferred_llc  = -1,
+#endif
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 	.kasan_depth	= 1,
 #endif
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5549710d95cf..cc804a8c7061 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1267,6 +1267,7 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	struct mm_struct *mm = p->mm;
 	struct mm_sched *pcpu_sched;
 	unsigned long epoch;
+	int mm_sched_llc = -1;
 
 	/*
 	 * init_task and kthreads don't be having no mm
@@ -1293,6 +1294,12 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 		mm->mm_sched_cpu = -1;
 		pcpu_sched->occ = 0;
 	}
+
+	if (mm->mm_sched_cpu != -1)
+		mm_sched_llc = per_cpu(sd_llc_id, mm->mm_sched_cpu);
+
+	if (p->preferred_llc != mm_sched_llc)
+		p->preferred_llc = mm_sched_llc;
 }
 
 static void task_tick_cache(struct rq *rq, struct task_struct *p)
-- 
2.32.0

