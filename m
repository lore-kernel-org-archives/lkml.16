Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7A231C9F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 04:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738901459; cv=none; b=dyNJ1hymryk8ZPNn4/yn5u369nte1/5hmHpELjr8G4FYKUv5zU8KwniHAldpjhYR+ZcGt2AdaCZCWKVJqH5LLz6YNGMUdOLFk/cHXvu7bm3tPtkWkXJDt1tVRHCVB2DBzNuLzsoqwDooIWogd1zgx6QU9xNmzseL8K8HRLlUneg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738901459; c=relaxed/simple;
	bh=/WuqGtx+K6eP+iK0k2Ti/Yj9IjGoQodgI8gj6iHK1pk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dDQxj3NEHyl7cmL98Qq20dxpG9CnohCLyA5t4UMHKfp0RUFPrpFjJSptk5LQKokQ6+bi9ZAW2oEadXbDW7PAZbnZEG+iQ105DlgwElAnYUhGcvmOXflO63DgByFe8AzRnnk6dcUSdp+u5gBSBGGqQh8bzqopzv3gZrzlglghK5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LFaiz+7s; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LFaiz+7s"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-218c8ac69faso3629615ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 20:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738901457; x=1739506257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7F6Jk5p5R7n2K53wBQ1De4ty3jblv5oRK/XfgrdxAM=;
        b=LFaiz+7sYZPPBaYHrBhsJDEo7TuiBawVoqLlRrXw6wNa5MtEqYBjBulTikXfPn9RCU
         sv0EKfX3eg5m0FxfnMeXEl16v6je/wznr0Y5K42qGI0U/3IDvdwYzvv+ntlkWZGSFJp0
         H3EpD53RNnRyulFJbkY4qeimKSJoUV/TS68z/xmk58aLVESiaVi9dNVP06UwxEuuXlb/
         CcV1K1z3yGGnWS4bxqa9LpfebPlW+7JWlBiUdNO62ZOg+AV3CI4/pvFfj6FEdlg3IkoH
         gBiSKaMp1XmD+pQvGD4nmOj6KxUzbpKPQLYbDtmIc3nDDhoUNFnhT4kLXv6nILvySzKK
         C3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738901457; x=1739506257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7F6Jk5p5R7n2K53wBQ1De4ty3jblv5oRK/XfgrdxAM=;
        b=L/MOMwxgRIkdKYN/4gT5ROVMgPKgY4gXeCDB5cq7CbvYTfpJx4p+bxwBjH1qLDTfU3
         Mrhw5UG8CI42p435ro3nsu2d2HQ8IH3zCiWEMGcEuUGb1owP3+okk5oD2IdiIFtBiKPI
         WR6urgOxfhUJ7/Aicbd9XQALVctFEAIQOrc+iRwg6hTd33ToiiP0S0Fs/SsLZ3vL6GBV
         OnY/8dGDzo4XO0RQ6mG9O+sHqMeiyheujK6KvsDmzNtYQYB9mxtJySLMGVgrZI6DLfm1
         8GWdsKGh9uabEBsTIo/0U41aJN/QzpoP0kxItcCjGzMTEXPRRbWL5avAJwiY6kuFtJqt
         cqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbre/TBZO3XbuNPxSnXJvDei5nCSQYtfpWGpkgGE+6VOEx+gietZ8vfte/CwAaQpH3GjpY0IXbBLGXeb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy9BmDUyO79GOpfQVAQET3BAxP8ovkWZaHpo4bp4T/Qk9AVKv8
	+PZdvbuFW++vPPJ1IwOIfxdnqpOMSOLgt2raRxezniDtwkiYy9AlqKUtI5cING8=
X-Gm-Gg: ASbGncsMUA3789fG7yPR5DhWBMMp1UNxCS7p7ABHVYq8aWTxPzOKC5tzKLYz2W9+sjo
	LQaxp+M2ZbDuK7D9YOD/MCBPfqREC0KEkxvreyNAfgtMeKNc8QM5O1/xIiC3CpJenxBCi+myMGL
	Cepm9o+rsAQu3yz6agWRhwR5wZw0qaPjBBfDusRuXtnfxHzbz196IJEqIjHliqE6TAsj43U7Mvd
	FObRTccxnQBoNFGSHSWpVqepte3qs2Egj37R3E4PJikYFTOMmUvdu76fqVu0074GcQo6qENl/RE
	pWF0Fx5y1hHX6DWfad2PVbObo5uk3UX2JIGBH9Z4KguWdoOzYigT+Q==
X-Google-Smtp-Source: AGHT+IGMttM8ydsBtBmcEXAfQlBmTHGrdwn3FVFgbbgH385LTqOErMCIGNcyDKcuP5ZFLCLDmNfYSg==
X-Received: by 2002:a05:6a20:c88b:b0:1e1:9f77:da7b with SMTP id adf61e73a8af0-1ee03b0647amr1378658637.7.1738901457130;
        Thu, 06 Feb 2025 20:10:57 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aee7fbasm2135485a12.46.2025.02.06.20.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 20:10:56 -0800 (PST)
From: Abel Wu <wuyun.abel@bytedance.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/2] cgroup/rstat: Add run_delay accounting for cgroups
Date: Fri,  7 Feb 2025 12:10:01 +0800
Message-Id: <20250207041012.89192-3-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250207041012.89192-1-wuyun.abel@bytedance.com>
References: <20250207041012.89192-1-wuyun.abel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-task and per-cpu accounting have already been tracked by
t->sched_info.run_delay and rq->rq_sched_info.run_delay respectively.
Extends this to also include cgroups.

The "some" field of cpu.pressure indicator may lose the insight into
how severely one cgroup is stalled on certain cpu, because PSI tracks
stall time for each cpu through:

	tSOME[cpu] = time(nr_delayed_tasks[cpu] != 0)

which turns nr_delayed_tasks[cpu] into boolean value. So together with
this cgroup level run_delay accounting, the scheduling info of cgroups
will be better illustrated.

Only cgroup v2 is supported. Similar to the task accounting, the cgroup
accounting requires that CONFIG_SCHED_INFO is enabled.

Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
---
 include/linux/cgroup-defs.h |  3 +++
 include/linux/kernel_stat.h | 14 ++++++++++++++
 kernel/cgroup/rstat.c       | 25 +++++++++++++++++++++++++
 kernel/sched/cputime.c      | 12 ++++++++++++
 kernel/sched/stats.h        |  3 +++
 5 files changed, 57 insertions(+)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 1b20d2d8ef7c..287366e60414 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -328,6 +328,9 @@ struct cgroup_base_stat {
 	u64 forceidle_sum;
 #endif
 	u64 ntime;
+#ifdef CONFIG_SCHED_INFO
+	u64 run_delay;
+#endif
 };
 
 /*
diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index b97ce2df376f..e2ac42a166c1 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -31,6 +31,15 @@ enum cpu_usage_stat {
 	CPUTIME_FORCEIDLE,
 #endif
 	NR_STATS,
+
+#ifdef CONFIG_SCHED_INFO
+	/*
+	 * Instead of cputime, run_delay is tracked through
+	 * sched_info by task and rq, so there is no need to
+	 * extend the cpustat[] array.
+	 */
+	CPUTIME_RUN_DELAY,
+#endif
 };
 
 struct kernel_cpustat {
@@ -141,4 +150,9 @@ extern void account_idle_ticks(unsigned long ticks);
 extern void __account_forceidle_time(struct task_struct *tsk, u64 delta);
 #endif
 
+#ifdef CONFIG_SCHED_INFO
+extern void account_run_delay_time(struct task_struct *tsk, u64 delta);
+extern u64 get_cpu_run_delay(int cpu);
+#endif
+
 #endif /* _LINUX_KERNEL_STAT_H */
diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index c2784c317cdd..504da76553ee 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -445,6 +445,9 @@ static void cgroup_base_stat_add(struct cgroup_base_stat *dst_bstat,
 	dst_bstat->forceidle_sum += src_bstat->forceidle_sum;
 #endif
 	dst_bstat->ntime += src_bstat->ntime;
+#ifdef CONFIG_SCHED_INFO
+	dst_bstat->run_delay += src_bstat->run_delay;
+#endif
 }
 
 static void cgroup_base_stat_sub(struct cgroup_base_stat *dst_bstat,
@@ -457,6 +460,9 @@ static void cgroup_base_stat_sub(struct cgroup_base_stat *dst_bstat,
 	dst_bstat->forceidle_sum -= src_bstat->forceidle_sum;
 #endif
 	dst_bstat->ntime -= src_bstat->ntime;
+#ifdef CONFIG_SCHED_INFO
+	dst_bstat->run_delay -= src_bstat->run_delay;
+#endif
 }
 
 static void cgroup_base_stat_flush(struct cgroup *cgrp, int cpu)
@@ -551,6 +557,11 @@ void __cgroup_account_cputime_field(struct cgroup *cgrp,
 	case CPUTIME_FORCEIDLE:
 		rstatc->bstat.forceidle_sum += delta_exec;
 		break;
+#endif
+#ifdef CONFIG_SCHED_INFO
+	case CPUTIME_RUN_DELAY:
+		rstatc->bstat.run_delay += delta_exec;
+		break;
 #endif
 	default:
 		break;
@@ -596,6 +607,9 @@ static void root_cgroup_cputime(struct cgroup_base_stat *bstat)
 		bstat->forceidle_sum += cpustat[CPUTIME_FORCEIDLE];
 #endif
 		bstat->ntime += cpustat[CPUTIME_NICE];
+#ifdef CONFIG_SCHED_INFO
+		bstat->run_delay += get_cpu_run_delay(i);
+#endif
 	}
 }
 
@@ -610,6 +624,16 @@ static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat
 #endif
 }
 
+static void cgroup_run_delay_show(struct seq_file *seq, struct cgroup_base_stat *bstat)
+{
+#ifdef CONFIG_SCHED_INFO
+	u64 run_delay = bstat->run_delay;
+
+	do_div(run_delay, NSEC_PER_USEC);
+	seq_printf(seq, "run_delay_usec %llu\n", run_delay);
+#endif
+}
+
 void cgroup_base_stat_cputime_show(struct seq_file *seq)
 {
 	struct cgroup *cgrp = seq_css(seq)->cgroup;
@@ -640,6 +664,7 @@ void cgroup_base_stat_cputime_show(struct seq_file *seq)
 			bstat.ntime);
 
 	cgroup_force_idle_show(seq, &bstat);
+	cgroup_run_delay_show(seq, &bstat);
 }
 
 /* Add bpf kfuncs for cgroup_rstat_updated() and cgroup_rstat_flush() */
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 5d9143dd0879..e6be57cdb54e 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -243,6 +243,18 @@ void __account_forceidle_time(struct task_struct *p, u64 delta)
 }
 #endif
 
+#ifdef CONFIG_SCHED_INFO
+void account_run_delay_time(struct task_struct *p, u64 delta)
+{
+	cgroup_account_cputime_field(p, CPUTIME_RUN_DELAY, delta);
+}
+
+u64 get_cpu_run_delay(int cpu)
+{
+	return cpu_rq(cpu)->rq_sched_info.run_delay;
+}
+#endif
+
 /*
  * When a guest is interrupted for a longer amount of time, missed clock
  * ticks are not redelivered later. Due to that, this function may on
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index 19cdbe96f93d..fdfd04a89b05 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -252,7 +252,9 @@ static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
 		t->sched_info.max_run_delay = delta;
 	if (delta && (!t->sched_info.min_run_delay || delta < t->sched_info.min_run_delay))
 		t->sched_info.min_run_delay = delta;
+
 	rq_sched_info_dequeue(rq, delta);
+	account_run_delay_time(t, delta);
 }
 
 /*
@@ -279,6 +281,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
 		t->sched_info.min_run_delay = delta;
 
 	rq_sched_info_arrive(rq, delta);
+	account_run_delay_time(t, delta);
 }
 
 /*
-- 
2.37.3

