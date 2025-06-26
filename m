Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BF02E11BF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942424; cv=none; b=NL24dItI7oxbY1RZog2OfJN/00QVEh78Z2i/GqknJ+ArONhnEgZf2dit/nEWoZguQDVt0PcEI9QqOGoxd/mtdKVZeM48OfEfgJMm0+OdCaExXVlt8bImDoXlmJHjyXQQpxRdVkNcQodb7TCZbJm9UTyQIAVmlvmNMder0rUY83Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942424; c=relaxed/simple;
	bh=4UbaF7UJNuqJ/NGv2r+anNWGMicRdp4ab8TOZLSQfVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW2xrcvfihjGLq3R+N/0hpWKX7euhvYQ/xCCd7GTzel4aEJXvLlXcsDoSHIgxoJTFRFvFpMWrWTvSH9QObxc5xLUzLKOmiyExh9rjJHW1yTRnMa7jc2aaDMvv5hKEqNdusweCYFwnSZ3Jy0kjRTREZ5RNq8tT0IzF+GziCvUdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=H+NmZjA1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H+NmZjA1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JtsXPN/EbRnRkfVDVnd5VwLOIbO3iMF7jQ9dJCcE/5o=; b=H+NmZjA1tEsnemrw7hUwwDUwOi
	tiQFQW6fUGUtMPGKy55K10q7oKvJRHrYmja6F+Bc71MYDwFDS1tofC+CcDeQrPjYplfVTrEZJcf/c
	8rPzdI/Ig+bFUT0HfULp3Ym6RRejJuVo3HGcdmuQ/hd/hwKV6EK6Cf82g7vtPblvymIiETFOru9wl
	2FjKEe/IoTIVkRLgTAeLxKqZQUcrTPlPkGtTlkdtvR21vCkLJkCXy2yf2NAYt0kFaNfUkhtiC9z3C
	kswjA/yIXwkUz3fUDB4qlHDMAkgVhWW6+zWJctw271vJyzq72V9HafqVdDsx1UqZdomeihH0Gxhem
	N0Fcla7w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm6X-0000000BfW9-0YYx;
	Thu, 26 Jun 2025 12:53:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CFF5030BDA9; Thu, 26 Jun 2025 14:53:23 +0200 (CEST)
Date: Thu, 26 Jun 2025 14:53:23 +0200
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
Message-ID: <20250626125323.GG1613376@noisy.programming.kicks-ass.net>
References: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
 <20250605100009.GO39944@noisy.programming.kicks-ass.net>
 <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>
 <20250606082834.GM30486@noisy.programming.kicks-ass.net>
 <c32fcf451dad1cac40ad827e53ac6c027403b07e.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c32fcf451dad1cac40ad827e53ac6c027403b07e.camel@mediatek.com>

On Fri, Jun 13, 2025 at 03:47:47PM +0800, Kuyo Chang wrote:
> On Fri, 2025-06-06 at 10:28 +0200, Peter Zijlstra wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Fri, Jun 06, 2025 at 11:46:57AM +0800, Kuyo Chang wrote:
> > 
> > > Thank you for your patch.
> > > I believe this patch also effectively addresses this race
> > > condition.
> > > I will queue it in our test pool for testing.
> > 
> > Thank you; I shall await the results!
> > 
> It works well during both regular and hotplug tests(one week).
> I believe the patch is workable.

Thanks!, I'll queue the below in tip/sched/urgent

---
Subject: sched/core: Fix migrate_swap() vs. hotplug
From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 5 Jun 2025 12:00:09 +0200

On Mon, Jun 02, 2025 at 03:22:13PM +0800, Kuyo Chang wrote:

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

This is a confluence of fail, where both wake_q and ttwu_wakelist can
cause crucial wakeups to be delayed, resulting in the malfunction of
balance_push.

Since there is only a single stopper thread to be woken, the wake_q
doesn't really add anything here, and can be removed in favour of
direct wakeups of the stopper thread.

Then add a clause to ttwu_queue_cond() to ensure the stopper threads
are never queued / delayed.

Of all 3 moving parts, the last addition was the balance_push()
machinery, so pick that as the point the bug was introduced.

Fixes: 2558aacff858 ("sched/hotplug: Ensure only per-cpu kthreads run during hotplug")
Reported-by: Kuyo Chang <kuyo.chang@mediatek.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Kuyo Chang <kuyo.chang@mediatek.com>
Link: https://lkml.kernel.org/r/20250605100009.GO39944@noisy.programming.kicks-ass.net
---
 kernel/sched/core.c   |    5 +++++
 kernel/stop_machine.c |   20 ++++++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3943,6 +3943,11 @@ static inline bool ttwu_queue_cond(struc
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
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -82,18 +82,15 @@ static void cpu_stop_signal_done(struct
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
 
@@ -101,12 +98,13 @@ static bool cpu_stop_queue_work(unsigned
 	raw_spin_lock_irqsave(&stopper->lock, flags);
 	enabled = stopper->enabled;
 	if (enabled)
-		__cpu_stop_queue_work(stopper, work, &wakeq);
+		__cpu_stop_queue_work(stopper, work);
 	else if (work->done)
 		cpu_stop_signal_done(work->done);
 	raw_spin_unlock_irqrestore(&stopper->lock, flags);
 
-	wake_up_q(&wakeq);
+	if (enabled)
+		wake_up_process(stopper->thread);
 	preempt_enable();
 
 	return enabled;
@@ -264,7 +262,6 @@ static int cpu_stop_queue_two_works(int
 {
 	struct cpu_stopper *stopper1 = per_cpu_ptr(&cpu_stopper, cpu1);
 	struct cpu_stopper *stopper2 = per_cpu_ptr(&cpu_stopper, cpu2);
-	DEFINE_WAKE_Q(wakeq);
 	int err;
 
 retry:
@@ -300,8 +297,8 @@ static int cpu_stop_queue_two_works(int
 	}
 
 	err = 0;
-	__cpu_stop_queue_work(stopper1, work1, &wakeq);
-	__cpu_stop_queue_work(stopper2, work2, &wakeq);
+	__cpu_stop_queue_work(stopper1, work1);
+	__cpu_stop_queue_work(stopper2, work2);
 
 unlock:
 	raw_spin_unlock(&stopper2->lock);
@@ -316,7 +313,10 @@ static int cpu_stop_queue_two_works(int
 		goto retry;
 	}
 
-	wake_up_q(&wakeq);
+	if (!err) {
+		wake_up_process(stopper1->thread);
+		wake_up_process(stopper2->thread);
+	}
 	preempt_enable();
 
 	return err;
