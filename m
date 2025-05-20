Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3388D274FE1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737703; cv=none; b=qaainrybSnGChsdJ8V7wQxh/kIduiuVG9Bf+CjI934TPPZ0zh8rqXE1mI3ePWhlYc/wvrH00vMM6FPnUYYD1Kt/3VmBPqqU4RJ3pH2p/2vbipJPo74lVrQDK24Sedm8F/V9wyIoJa8sQxp5LKsuBFXJs/TKsTr6bq/6H0HRJQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737703; c=relaxed/simple;
	bh=Izb7aLi+WH+5cs0TzodTTJ7VdCAULb3n19DWVdGXYqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tLz6G/gcdV19nleBbd0GM/LXQqPTrBevANXADOxxss2QCiog6RyaVp26YcysG95uKLeqBhXAN/8NOFQ2/SnuKxrRd1ZRH5Q2MsH36puLL08TP5F9fiHhrSZGrGR7dqj3qHd3FcxDQZKM/A8UTYt9YJXP36OOHonAjKisFl8JYyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eFQFiaYn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eFQFiaYn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30ea7770bd2so4073766a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737700; x=1748342500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXD9eQDD1WY6muo41vlEIFm8Mrw4lgDt+RYZt2fuhCY=;
        b=eFQFiaYnG8I/lhNfZBW1PCBLqlUsQwMNP6saMLlfKkCrYpXx4z7W9srP9e3RavXutu
         LXGL5NTIy1V+nG9yn66J0Fu3o7LMgP93xlqT3DF39qawem+Ajbw2ASA6rc96sJxRGlD5
         fYHqz0CuuGC90vbI7GIwr2o6FEfTrsfviQ6JAEdtxrkL4EgWpzBJVRmRtAQUAchbNfdd
         JTg0SoFW7UA81PkeCFvTHGU+B1BHeyLiTlZx+ivDRLtfO8/ByUyv80bDxm1bwEti3p7T
         VKLjziHaMcR1GnVa1mM9Yu1Tl8gq2cvPnshLdOrLYeCsRdUxziBsoaCTqgdkHe3s4ef2
         lnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737700; x=1748342500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXD9eQDD1WY6muo41vlEIFm8Mrw4lgDt+RYZt2fuhCY=;
        b=FPmnYoEicr86iSnAqtYR3BcT7z68C2MzzWjLPNtIpyLDbkY1OTmDukNadpgXytZuiA
         sp2DcHdZnhAgg7lPrmM5kgXxFp+GkMgH0lDSpyseit277J6LKDpLmw4PcVuFh8v+cpho
         3N265n43wuy0ay1GAY3NB7wKkBes7qINRl+YsyukYE+fuTm9oj9aMQngSpJi+ynIgiNf
         xy10KpML3AGA/2dgzu4PDSpotcYOAR85FGhsmNoY3KmiP3C7xhG5VXdjaKn5wzCiNNO2
         JrNr1UwSh9YkIZa4S8WI7D0Q/wMo3BVYJ82ECPuBfBJdePyI0N3kUPBS2Cd6nVKKE53N
         SRtw==
X-Gm-Message-State: AOJu0Yxd+vsLZ/oVn24+DTIOWPd4anesOjfejZPe+DxtfT9O/5vAEc1U
	m3e2iStQVoE+D7CMXfz0sXH/bjvf+br4kwb/+jvQn/q67q8qKMJQuA7W5VCnQZXWWw==
X-Gm-Gg: ASbGncvAyJQ1kmiZ5xSdS9QlhRMQVTkLCnSeZ0jeh+x2XsOEHZ1T/BZ+2b9eN4A16kn
	d2L+CnpC6rA9Y59pw1+R5IVSyHwCWzQgnfu10DwMLvKk6azYsf5jvPztntm3746sRIyg2QmN+K7
	h1MpgzbX4XGicHFlajFRBvdU37TVHCZ+evDX9bYQs7JW/ydCZvXorbnLw017qZuUEG+kv7bQk22
	7fooMwqCFiZ/RRYJ36LL5s2MUi5pI1N8f2NwoJ6/xx8WexEZID2S2R0kZRgNhOvvghi1fzXyGsw
	XsV66kS1DkGy122eHF03DhMYqLyVqF6xFy0P8PZwMWc1PNzR3w5P5iVBYfZ3o798ipE=
X-Google-Smtp-Source: AGHT+IG2QnNtVSL+EkvUPcvvnHLtnaeImNOLRa+FXdFlfdjwO/g1dA37F8n6SYaiNH+3L7tzVxSVtw==
X-Received: by 2002:a17:90b:4c47:b0:30e:391e:ac00 with SMTP id 98e67ed59e1d1-30e7d5564f2mr29766668a91.18.1747737700320;
        Tue, 20 May 2025 03:41:40 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:41:39 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 1/7] sched/fair: Add related data structure for task based throttle
Date: Tue, 20 May 2025 18:41:04 +0800
Message-Id: <20250520104110.3673059-2-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520104110.3673059-1-ziqianlu@bytedance.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Valentin Schneider <vschneid@redhat.com>

Add related data structures for this new throttle functionality.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 include/linux/sched.h |  4 ++++
 kernel/sched/core.c   |  3 +++
 kernel/sched/fair.c   | 12 ++++++++++++
 kernel/sched/sched.h  |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index b98195991031c..055f3782eeaee 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -879,6 +879,10 @@ struct task_struct {
 
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group		*sched_task_group;
+#ifdef CONFIG_CFS_BANDWIDTH
+	struct callback_head		sched_throttle_work;
+	struct list_head		throttle_node;
+#endif
 #endif
 
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index bece0ba6f5b3a..b7ca7cefee54e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4499,6 +4499,9 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	p->se.cfs_rq			= NULL;
+#ifdef CONFIG_CFS_BANDWIDTH
+	init_cfs_throttle_work(p);
+#endif
 #endif
 
 #ifdef CONFIG_SCHEDSTATS
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index eb5a2572b4f8b..75bf6186a5137 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5825,6 +5825,18 @@ static inline int throttled_lb_pair(struct task_group *tg,
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
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6de..921527327f107 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2703,6 +2703,8 @@ extern bool sched_rt_bandwidth_account(struct rt_rq *rt_rq);
 
 extern void init_dl_entity(struct sched_dl_entity *dl_se);
 
+extern void init_cfs_throttle_work(struct task_struct *p);
+
 #define BW_SHIFT		20
 #define BW_UNIT			(1 << BW_SHIFT)
 #define RATIO_SHIFT		8
-- 
2.39.5

