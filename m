Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DCB1F8733
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749117624; cv=none; b=MuZ9/rns7Qf/Teo/AECvJr0f4QkCOA3zOIXhE/Ni8HDb/HsineIFIn1a3o2AUPS7aLnzphdSRG2/bAe1z1LkmuPlhm2yYpztk6ABczFpktUAF7OtHhxaozHOR6NLTu0QhuGs5j/k5syc11ppbPoaUrm+0GtsFjoAAbdorP8zx0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749117624; c=relaxed/simple;
	bh=YXujSu5prHyr29Ezh1slQ95QWQAo6Et6QIL3Rapq/TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgaB9bkLMeqAZJ1TpZEfzqwuvuMSPWaj+QZtpBOdkUjFmPqQpjY6K5+Jd0aLg3HzEXXDFfwCJnD8OBb+EsOjo/97IP9hPRBLraE5uwCDINBGHRk8w0moWUrpsFUU700/nNHnaSI8uFB4nfx2Lgc1cvFwx6VGJU95q4M/CgguX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TPSn4nCq; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TPSn4nCq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5gaT7m1y3gHJH3Wh7s86xKh8A4+RoMUe3RY8wTdWPP0=; b=TPSn4nCqcq6VTujRF5jDE6WIMG
	gEvhkyJv2MJRyPHXaU7ct6kNpg+MlEGjjcvbQ45SXbo1yEPIrjLNMQXuLGquJpfJ1azNBjl8zQW1g
	55rXHW024aTbJv9miWVl0ASkYXagnOMK98mvggMWgM2TkL/XwoZu5oy4+XHpH/HjnQ2xWkTAh8Qp4
	ikpJqkHdREQSLWs7gGfxArKeb0ansCNPq0AtBDi5MGQ31psT3MW1fWX6/Buzi50v6OfDpANe+PxmE
	Ik/V4v2JWfEXZiGXjBPB+3GBRU4sccJlTkEjHzPrtdH0lfwC2z9bCtSNMk6akPevlLjENL5sdwTHr
	+xtBK5Qw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7OM-000000018qX-3FjU;
	Thu, 05 Jun 2025 10:00:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B48FF3005AF; Thu,  5 Jun 2025 12:00:09 +0200 (CEST)
Date: Thu, 5 Jun 2025 12:00:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
Message-ID: <20250605100009.GO39944@noisy.programming.kicks-ass.net>
References: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602072242.1839605-1-kuyo.chang@mediatek.com>

On Mon, Jun 02, 2025 at 03:22:13PM +0800, Kuyo Chang wrote:

How easy can you reproduce this?

> So, the potential race scenario is:
> 
> 	CPU0							CPU1
> 	// doing migrate_swap(cpu0/cpu1)
> 	stop_two_cpus()
> 							  ...
> 							 // doing _cpu_down()
> 							      sched_cpu_deactivate()
> 								set_cpu_active(cpu, false);
> 								balance_push_set(cpu, true);
> 	cpu_stop_queue_two_works
> 	    __cpu_stop_queue_work(stopper1,...);
> 	    __cpu_stop_queue_work(stopper2,..);
> 	stop_cpus_in_progress -> true
> 		preempt_enable();
> 								...
> 							1st balance_push
> 							stop_one_cpu_nowait
> 							cpu_stop_queue_work
> 							__cpu_stop_queue_work
> 							list_add_tail  -> 1st add push_work
> 							wake_up_q(&wakeq);  -> "wakeq is empty.
> 										This implies that the stopper is at wakeq@migrate_swap."
> 	preempt_disable
> 	wake_up_q(&wakeq);
> 	        wake_up_process // wakeup migrate/0
> 		    try_to_wake_up
> 		        ttwu_queue
> 		            ttwu_queue_cond ->meet below case
> 		                if (cpu == smp_processor_id())
> 			         return false;
> 			ttwu_do_activate
> 			//migrate/0 wakeup done
> 		wake_up_process // wakeup migrate/1
> 	           try_to_wake_up
> 		    ttwu_queue
> 			ttwu_queue_cond
> 		        ttwu_queue_wakelist
> 			__ttwu_queue_wakelist
> 			__smp_call_single_queue
> 	preempt_enable();
> 
> 							2nd balance_push
> 							stop_one_cpu_nowait
> 							cpu_stop_queue_work
> 							__cpu_stop_queue_work
> 							list_add_tail  -> 2nd add push_work, so the double list add is detected
> 							...
> 							...
> 							cpu1 get ipi, do sched_ttwu_pending, wakeup migrate/1
> 

So this balance_push() is part of schedule(), and schedule() is supposed
to switch to stopper task, but because of this race condition, stopper
task is stuck in WAKING state and not actually visible to be picked.

Therefore CPU1 can do another schedule() and end up doing another
balance_push() even though the last one hasn't been done yet.

So how about we do something like this? Does this help?

---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62b3416f5e43..c37b80bd53e6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3939,6 +3939,11 @@ static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
 	if (!scx_allow_ttwu_queue(p))
 		return false;
 
+#ifdef CONFIG_SMP
+	if (p->sched_class == &stop_sched_class)
+		return false;
+#endif
+
 	/*
 	 * Do not complicate things with the async wake_list while the CPU is
 	 * in hotplug state.
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index 5d2d0562115b..8855a50cc216 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -82,18 +82,15 @@ static void cpu_stop_signal_done(struct cpu_stop_done *done)
 }
 
 static void __cpu_stop_queue_work(struct cpu_stopper *stopper,
-					struct cpu_stop_work *work,
-					struct wake_q_head *wakeq)
+				  struct cpu_stop_work *work)
 {
 	list_add_tail(&work->list, &stopper->works);
-	wake_q_add(wakeq, stopper->thread);
 }
 
 /* queue @work to @stopper.  if offline, @work is completed immediately */
 static bool cpu_stop_queue_work(unsigned int cpu, struct cpu_stop_work *work)
 {
 	struct cpu_stopper *stopper = &per_cpu(cpu_stopper, cpu);
-	DEFINE_WAKE_Q(wakeq);
 	unsigned long flags;
 	bool enabled;
 
@@ -101,12 +98,12 @@ static bool cpu_stop_queue_work(unsigned int cpu, struct cpu_stop_work *work)
 	raw_spin_lock_irqsave(&stopper->lock, flags);
 	enabled = stopper->enabled;
 	if (enabled)
-		__cpu_stop_queue_work(stopper, work, &wakeq);
+		__cpu_stop_queue_work(stopper, work);
 	else if (work->done)
 		cpu_stop_signal_done(work->done);
 	raw_spin_unlock_irqrestore(&stopper->lock, flags);
 
-	wake_up_q(&wakeq);
+	wake_up_process(stopper->thread);
 	preempt_enable();
 
 	return enabled;
@@ -264,7 +261,6 @@ static int cpu_stop_queue_two_works(int cpu1, struct cpu_stop_work *work1,
 {
 	struct cpu_stopper *stopper1 = per_cpu_ptr(&cpu_stopper, cpu1);
 	struct cpu_stopper *stopper2 = per_cpu_ptr(&cpu_stopper, cpu2);
-	DEFINE_WAKE_Q(wakeq);
 	int err;
 
 retry:
@@ -300,8 +296,8 @@ static int cpu_stop_queue_two_works(int cpu1, struct cpu_stop_work *work1,
 	}
 
 	err = 0;
-	__cpu_stop_queue_work(stopper1, work1, &wakeq);
-	__cpu_stop_queue_work(stopper2, work2, &wakeq);
+	__cpu_stop_queue_work(stopper1, work1);
+	__cpu_stop_queue_work(stopper2, work2);
 
 unlock:
 	raw_spin_unlock(&stopper2->lock);
@@ -316,7 +312,8 @@ static int cpu_stop_queue_two_works(int cpu1, struct cpu_stop_work *work1,
 		goto retry;
 	}
 
-	wake_up_q(&wakeq);
+	wake_up_process(stopper1->thread);
+	wake_up_process(stopper2->thread);
 	preempt_enable();
 
 	return err;
