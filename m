Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7B289E1F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650068; cv=none; b=mRqLu6e3Xt8XDik0Q0zclCDryUTqD6BEGUNSTqJY5H4/1LxIvzWIBPzI38IxBl+qG8Hfjb0IQYJDciE9ExjDsfLYvYKLEIxhRDYg0sm1H5DL1mfnopC9Oh9F30ey2m5uD81+IyLJ84Fp1KHgrwPpl2Xm7EmLDKJ6eVyBMXFOIW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650068; c=relaxed/simple;
	bh=bq/tUz8+PnqM6nxcezrNEqn5rYJuAd3brMzH40sTN4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dl+pYRt1MPueCes56bMSJHo/IKSXBGeiuNscit0hU3QoJbEVwr3M7O0qxoEMRwdGrJJiMaoVbVUD9qiVr1zDXOS/muNwZk4Kr3FIar1m7JlhzyeDRL3t0Yg8ZmbcsxiziZwEs3p326M3MDV7LhV8GzmmUwFJosKrT/PC8c/OMbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qs1Kn3dn; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qs1Kn3dn"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73c17c770a7so7433405b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749650066; x=1750254866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR9o2apmoS5K1kwH23e2gWRlf4LgWrNIowsdolXs2NM=;
        b=Qs1Kn3dnBarWqeUXBS0P+UQdvtVeCkrhmFwY1McUZXcwj5TG2DAQCmPcIYRu3dkLp3
         WdOqohba2aNbS26Wcl2iUK226uQN584OghzVI+n709trAXhoIU5aCPDXKJqiPcxQ9xQM
         tzgCjBAyDnxIZMNNsdKcBPoM4JEjO9spGUDUDGFxGGnGgut2OFR5BfTXmMEZ63Qkoaph
         LfBQsGEOyy3vE3rolH/4HjZaLY06sPlchCdGxKOggVJBDuaWeoXTRUMpgf5Dauyu7qdE
         oVAx3hmhiGvuecj4v/hkY4JFdPu5PIA2FY3Emghs0Q/CnPR1ah3VnPIoYomq6qWR3CFJ
         3haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650066; x=1750254866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FR9o2apmoS5K1kwH23e2gWRlf4LgWrNIowsdolXs2NM=;
        b=JYEpbVofkv5KdwTfr1h8dCyiaoyl4bez8avsCc89sEYxW4DRpVtHrwVFXe53SwMCmP
         sxHZ54Ol+jCJ11nApiFzqeqjA/5nE3drTWuvCpTY9WkL8BWfhH68GIhFU8Id755XIug9
         4tHpq05IQCFWVUU1tKp3aX1TmMqxMQ/KkKiTwJifF/mq61Wh8+sK4LJqQ/Z/QgbGpW0a
         1lWR+REMU+ruenwYx2U8U0viVFPFeXmBTNlP/4Krc5hmuPlO10MGeDWynyulK1dBEskx
         GvZpHBxdcc92XqMDZgv/BIFIlwJZvK6sEz41bUV6BJPHb0JYxnbz75HA90W+ItWskcEu
         2rJw==
X-Gm-Message-State: AOJu0YxfNY3P+l7KekYvXzfO1ypY3vnB4FT/k7QXi0wPaBjR9CWsSYkU
	IMZmutB4WI9xy6fU76+GWVghrO1UfDQkP9nVa5sM3kLlb7HxWlKO113NxhjzH1jibbk=
X-Gm-Gg: ASbGnctFgjz2r3iJn/5iPCWwb1K/GnUsIQtKsHiVqb+mujfJH+wvs+pXvPu3KuFzT30
	5bkqI3MIEFQ/0Omi2tlYSpHP8udUBdK2ghrLiLN2IFf5PMObNwZX1uFLlTUsSZku8su0/0OfzkP
	0CY9KajcHhM9XE7i6k3RO/jRzI3m6tHQYblTpjAGS7sYd2Wtw3a8i7K1J+5CZ3CdwGAVU5N7+8h
	yjkagsG1Vx6AE+V0NtYbb1OsmKcitHG89pSqoQDmf7fIGW5ruBjn1Ke7wmkajSaGtnv2Gjn31LZ
	4w7ufsGYaVONk4rmhCYJLGIIqQ1f538WFqV7ecd1u6x/uq2xW/IN4Z3SqcpOg6UEmEypLzRv13M
	HzLlw/SHEuVIiJdwdgDF1CpmqkN017UPsPfjiSl074g==
X-Google-Smtp-Source: AGHT+IFrLC+yuJFvq4r3rOF1rC2VfzOmPUFL/Fma5cMOOqtOKXcRgS+zxE30RWeyGI88Zc+2bQ/fbA==
X-Received: by 2002:a05:6a20:2451:b0:1f5:9024:324f with SMTP id adf61e73a8af0-21f8673d1famr5056807637.31.1749650065784;
        Wed, 11 Jun 2025 06:54:25 -0700 (PDT)
Received: from eric-acer.tail151456.ts.net (36-225-84-3.dynamic-ip.hinet.net. [36.225.84.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea3cdsm9247523b3a.159.2025.06.11.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:54:25 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH 1/4] sched_ext: Clean up and standardize #if/#else/#endif markers in sched/ext.c
Date: Wed, 11 Jun 2025 21:54:01 +0800
Message-ID: <20250611135404.13851-2-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611135404.13851-1-yphbchou0911@gmail.com>
References: <20250611135404.13851-1-yphbchou0911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 kernel/sched/ext.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 2c41c78be61e..55702b7a72e2 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1792,12 +1792,10 @@ static void run_deferred(struct rq *rq)
 	process_ddsp_deferred_locals(rq);
 }
 
-#ifdef CONFIG_SMP
 static void deferred_bal_cb_workfn(struct rq *rq)
 {
 	run_deferred(rq);
 }
-#endif
 
 static void deferred_irq_workfn(struct irq_work *irq_work)
 {
@@ -1820,7 +1818,6 @@ static void schedule_deferred(struct rq *rq)
 {
 	lockdep_assert_rq_held(rq);
 
-#ifdef CONFIG_SMP
 	/*
 	 * If in the middle of waking up a task, task_woken_scx() will be called
 	 * afterwards which will then run the deferred actions, no need to
@@ -1838,7 +1835,7 @@ static void schedule_deferred(struct rq *rq)
 				       deferred_bal_cb_workfn);
 		return;
 	}
-#endif
+
 	/*
 	 * No scheduler hooks available. Queue an irq work. They are executed on
 	 * IRQ re-enable which may take a bit longer than the scheduler hooks.
@@ -2542,7 +2539,6 @@ static void move_local_task_to_local_dsq(struct task_struct *p, u64 enq_flags,
 	p->scx.dsq = dst_dsq;
 }
 
-#ifdef CONFIG_SMP
 /**
  * move_remote_task_to_local_dsq - Move a task from a foreign rq to a local DSQ
  * @p: task to move
@@ -2709,11 +2705,6 @@ static bool consume_remote_task(struct rq *this_rq, struct task_struct *p,
 		return false;
 	}
 }
-#else	/* CONFIG_SMP */
-static inline void move_remote_task_to_local_dsq(struct task_struct *p, u64 enq_flags, struct rq *src_rq, struct rq *dst_rq) { WARN_ON_ONCE(1); }
-static inline bool task_can_run_on_remote_rq(struct scx_sched *sch, struct task_struct *p, struct rq *rq, bool enforce) { return false; }
-static inline bool consume_remote_task(struct rq *this_rq, struct task_struct *p, struct scx_dispatch_q *dsq, struct rq *task_rq) { return false; }
-#endif	/* CONFIG_SMP */
 
 /**
  * move_task_between_dsqs() - Move a task from one DSQ to another
@@ -2886,9 +2877,7 @@ static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
 {
 	struct rq *src_rq = task_rq(p);
 	struct rq *dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
-#ifdef CONFIG_SMP
 	struct rq *locked_rq = rq;
-#endif
 
 	/*
 	 * We're synchronized against dequeue through DISPATCHING. As @p can't
@@ -2902,7 +2891,6 @@ static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
 		return;
 	}
 
-#ifdef CONFIG_SMP
 	if (src_rq != dst_rq &&
 	    unlikely(!task_can_run_on_remote_rq(sch, p, dst_rq, true))) {
 		dispatch_enqueue(sch, find_global_dsq(p), p,
@@ -2962,9 +2950,6 @@ static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
 		raw_spin_rq_unlock(locked_rq);
 		raw_spin_rq_lock(rq);
 	}
-#else	/* CONFIG_SMP */
-	BUG();	/* control can not reach here on UP */
-#endif	/* CONFIG_SMP */
 }
 
 /**
@@ -3288,10 +3273,8 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 static enum scx_cpu_preempt_reason
 preempt_reason_from_class(const struct sched_class *class)
 {
-#ifdef CONFIG_SMP
 	if (class == &stop_sched_class)
 		return SCX_CPU_PREEMPT_STOP;
-#endif
 	if (class == &dl_sched_class)
 		return SCX_CPU_PREEMPT_DL;
 	if (class == &rt_sched_class)
@@ -3304,14 +3287,12 @@ static void switch_class(struct rq *rq, struct task_struct *next)
 	struct scx_sched *sch = scx_root;
 	const struct sched_class *next_class = next->sched_class;
 
-#ifdef CONFIG_SMP
 	/*
 	 * Pairs with the smp_load_acquire() issued by a CPU in
 	 * kick_cpus_irq_workfn() who is waiting for this CPU to perform a
 	 * resched.
 	 */
 	smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
-#endif
 	if (!(sch->ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
 		return;
 
@@ -3508,8 +3489,6 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 }
 #endif	/* CONFIG_SCHED_CORE */
 
-#ifdef CONFIG_SMP
-
 static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flags)
 {
 	struct scx_sched *sch = scx_root;
@@ -3639,7 +3618,6 @@ static void rq_offline_scx(struct rq *rq)
 	rq->scx.flags &= ~SCX_RQ_ONLINE;
 }
 
-#endif	/* CONFIG_SMP */
 
 static bool check_rq_for_timeouts(struct rq *rq)
 {
@@ -4299,14 +4277,12 @@ DEFINE_SCHED_CLASS(ext) = {
 	.put_prev_task		= put_prev_task_scx,
 	.set_next_task		= set_next_task_scx,
 
-#ifdef CONFIG_SMP
 	.select_task_rq		= select_task_rq_scx,
 	.task_woken		= task_woken_scx,
 	.set_cpus_allowed	= set_cpus_allowed_scx,
 
 	.rq_online		= rq_online_scx,
 	.rq_offline		= rq_offline_scx,
-#endif
 
 	.task_tick		= task_tick_scx,
 
-- 
2.43.0

