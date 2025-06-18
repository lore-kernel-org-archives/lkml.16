Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65BD27F008
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234815; cv=none; b=Z1gxIDJ5j5TrxJPi8zKZWov33Q6NILtL5M+mCPiVDfio/X6wEV6QsafsNIr9kEw5adoaBuDvilCHRZL4PRnm6lRiwewV3Znzk5vGbNWdESSNnTcJl8oN+QlzIGlSFFyZ1sf7jjy4EI2GG0+xWjWXqa1CepS1ocBA7Wk4Wa5KCg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234815; c=relaxed/simple;
	bh=n6FRq4hLBNgw5sNGtNO7D49/eL2X5zS4MeHEADLptN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XDUEUvSZvhBy1kotK7hrUOmkFoTsw5UwiM/sHE0pquULXnq0BisPPyLWeSLEeyBEY9q4gydVjFX35ppLf7MjaSlycfnTJszBoa7M7aNnDE80+QudLXNn9BBvabKpjA5qcyThZyG8bubY+1kfREhGAh+489eyutqJhTaCo/ICeP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BvencyQN; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BvencyQN"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2f603b0ef6so4902881a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750234813; x=1750839613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWYudEDJAAvgfGWWEcIqHeRQ/IYrWVCczg2BhjdVlC8=;
        b=BvencyQNF6PEUfMZM6czq6yJrMYbfEpo3o1KU4p+Oku0YgbkMcnTlxUGnFZFFYkSU1
         dkHC9A0VpMu6d1exXOudNMXuZu+hGuHTF0hdl42smrRI9fya0J/7D7BvATX1Spx2giry
         xRjapu1aa3Zko1rSfKLwjMV7mB9aVvjBxHzWr5g+K7nOHcilfTy31qI++ZGPRAEa4U3k
         vgw6Yi0sBHJ25zwSzEbt8w71XcIeEBT5Js4pfjGlBfH8MLSB5ixsCnpN2aXDDJPWt9yJ
         4SMVx5npdLeLWh6UyNX2bAXokjQBJ99HV8uot+Az1C93a+vm7JwCtKZKTBF/iL84YGCT
         5tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234813; x=1750839613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWYudEDJAAvgfGWWEcIqHeRQ/IYrWVCczg2BhjdVlC8=;
        b=KSTMwVnCZdwuYhIjk49ky9AQSuHwUTq1T+QE+I1kuVAnkKyv/Fgj/dfkPi+SggDEGd
         9ybpjvbB7fy6qrPKX8/Sh9ff86f7Ng5MbSMeLsqVQZ8BzqhwHTZjH1uW2e8dUy9r1Otn
         DaJc790HYCt5gaQYV43a3tDEdrjwAmK9CsHgYU9p9ko7r460bXtgAm/Zucnd/uMEe0Zs
         yT3Lafpwa1qSbxWduoUTevGZRILMwj0pxdd8XFOl0iyx5a3yKx6voxuihNbm/o1V0d1y
         AYzINxTBjaX2btZQLaf5vHAaW7QFeAlCtOKYfz/2w2RlJkvaSSKFWteHly3M1UBcBfHD
         ZOaw==
X-Gm-Message-State: AOJu0YwPy29poZeSznpxH6z3MU80Kz0Qs5+rbtN/WBnORhN9K+f1k+DY
	ooBPSjsT962S8LkRxqtpjqFwbxhXOTk2PH7kB80sge1MGHFdafptwu2vwafTyl4d5g==
X-Gm-Gg: ASbGncuhcueQUeAAvN2MZEAUkIT6HKal473ut+kdEu1DV3TOh/fRu2+rlA6qQTxS10I
	ZXrSoKKp9jcT8waIUJqVBLwjsbn5mQXMz8QdextthofFnbuzX0w+5///VOS072NCboKaqdtckKS
	plznYqlOaD167kqhswkETA6nlT8qfdwOp/bFmKyhEwYuJY1S4Va281r2QtFI9MYnTZA59cXHAv2
	NLYhbDbJoaZEQd31B2wIQf1CXB/5PLbCT2gz6Nk5eb5wX3cSkUYuV53DeVaBJg4n85PYyKI4jXe
	c8t288RPSt3uERfecOGfPIbkY7KKarMUTLj10088J0//4Xay9wci7yEiCo5cUl+QLB6bHDgBq4Z
	7Mb5a3oWgXZ5jep6I1Q5sbeaIzVDbGFfb
X-Google-Smtp-Source: AGHT+IEGfnZMoac1TZrD0R+tvjt46YLurScQxzAmxfvwWqmkfICoBLwc3b76pZaoa4a8vAkVTTea3A==
X-Received: by 2002:a05:6a21:2001:b0:21f:ff2a:af83 with SMTP id adf61e73a8af0-21fff2ab818mr2623220637.15.1750234813106;
        Wed, 18 Jun 2025 01:20:13 -0700 (PDT)
Received: from 5CG4011XCS-JQI.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm10432084a12.69.2025.06.18.01.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:20:12 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 1/5] sched/fair: Add related data structure for task based throttle
Date: Wed, 18 Jun 2025 16:19:36 +0800
Message-Id: <20250618081940.621-2-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618081940.621-1-ziqianlu@bytedance.com>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Valentin Schneider <vschneid@redhat.com>

Add related data structures for this new throttle functionality.

Reviewed-by: Chengming Zhou <chengming.zhou@linux.dev>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 include/linux/sched.h |  5 +++++
 kernel/sched/core.c   |  3 +++
 kernel/sched/fair.c   | 13 +++++++++++++
 kernel/sched/sched.h  |  3 +++
 4 files changed, 24 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index eec6b225e9d14..95f2453b17222 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -874,6 +874,11 @@ struct task_struct {
 
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group		*sched_task_group;
+#ifdef CONFIG_CFS_BANDWIDTH
+	struct callback_head		sched_throttle_work;
+	struct list_head		throttle_node;
+	bool				throttled;
+#endif
 #endif
 
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a03c3c1d7f50a..afb4da893c02f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4446,6 +4446,9 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	p->se.cfs_rq			= NULL;
+#ifdef CONFIG_CFS_BANDWIDTH
+	init_cfs_throttle_work(p);
+#endif
 #endif
 
 #ifdef CONFIG_SCHEDSTATS
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6b17d3da034af..f7b8597bc95ac 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5757,6 +5757,18 @@ static inline int throttled_lb_pair(struct task_group *tg,
 	       throttled_hierarchy(dest_cfs_rq);
 }
 
+static void throttle_cfs_rq_work(struct callback_head *work)
+{
+}
+
+void init_cfs_throttle_work(struct task_struct *p)
+{
+	init_task_work(&p->sched_throttle_work, throttle_cfs_rq_work);
+	/* Protect against double add, see throttle_cfs_rq() and throttle_cfs_rq_work() */
+	p->sched_throttle_work.next = &p->sched_throttle_work;
+	INIT_LIST_HEAD(&p->throttle_node);
+}
+
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
@@ -6488,6 +6500,7 @@ static void init_cfs_rq_runtime(struct cfs_rq *cfs_rq)
 	cfs_rq->runtime_enabled = 0;
 	INIT_LIST_HEAD(&cfs_rq->throttled_list);
 	INIT_LIST_HEAD(&cfs_rq->throttled_csd_list);
+	INIT_LIST_HEAD(&cfs_rq->throttled_limbo_list);
 }
 
 void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c323d015486cf..fa78c0c3efe39 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -728,6 +728,7 @@ struct cfs_rq {
 	int			throttle_count;
 	struct list_head	throttled_list;
 	struct list_head	throttled_csd_list;
+	struct list_head        throttled_limbo_list;
 #endif /* CONFIG_CFS_BANDWIDTH */
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 };
@@ -2627,6 +2628,8 @@ extern bool sched_rt_bandwidth_account(struct rt_rq *rt_rq);
 
 extern void init_dl_entity(struct sched_dl_entity *dl_se);
 
+extern void init_cfs_throttle_work(struct task_struct *p);
+
 #define BW_SHIFT		20
 #define BW_UNIT			(1 << BW_SHIFT)
 #define RATIO_SHIFT		8
-- 
2.39.5

