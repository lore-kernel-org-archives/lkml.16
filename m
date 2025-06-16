Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEAB288513
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091859; cv=none; b=bWWvCCdZGddFW6w7v8w00vRBB8likTRceZuF5nYW6NTSydFUqvVJBHc5+MkoH5l7NYk5YOoxrblNAIgvT9iuIfilcGJ6CHnFVnyECcaNAVgYAdZ8DFkwFNFh+RD1tT/NH3qIH+/5VeUFTz4/Qnd4R+YxdL5Ego62+D5vQpGN6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091859; c=relaxed/simple;
	bh=jW5HfvATi5Z8ZW87FpgOlN8bPYgpvBt6HYlAd7dl/Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sstNWmqjzQmbvm7A0BG8L6YcBOpd0U0bwAE6UFv/IllOC2pUL6E+17eyqJpEts+3iydGWt5zoCvL1IJYghuGGHlTCBKjQaCo0DEavvS4zSzpDpqM9X67K0CbhPJpbbHCo+Jhwk2HaWGYprnZ5GoDSSFnZJy9PWfjDltlEbEzrqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U7HrwPZD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U7HrwPZD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l62OyoozhHfO7aZJMMaI9qB/kdyK7mbhb+vJUobYbZs=; b=U7HrwPZDjR1h8G4o1bU/2WLgya
	ptr37m1n/kqIVkq+iTt7UmeJpJ2mNnZRpB22cwNtRkM/DMwQGg9UXMeqHeSREplPPAB6zVWq855wN
	K/94oPqM/8FBuXXZxyj4A2LHutWUnDYcqUWUAqCMMZA9t8+s4ktwdowfXJW0kqJ3FGZiy4kc/oxwf
	oZfuuVrLW8PDJd+8Unlow2IZzdxnpNwC7iBh1TyNUyiBin1DEzFtFn7ZxRfY0AnYovJZS4xG5kCml
	3bxpEEuGtEzXh8CF8PRlHWD5pNBEfVKClJ6xQWReSVtFXRxDyKp9WYnCn1nPDhEYBv5lvp+2FwweT
	sxwveNqQ==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCpt-0000000GA2f-2yTW;
	Mon, 16 Jun 2025 16:37:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0B64B30D551; Mon, 16 Jun 2025 18:37:28 +0200 (CEST)
Date: Mon, 16 Jun 2025 18:37:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250616163728.GB1613633@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
 <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>
 <20250616120125.GB1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616120125.GB1613200@noisy.programming.kicks-ass.net>

On Mon, Jun 16, 2025 at 02:01:25PM +0200, Peter Zijlstra wrote:
> On Fri, Jun 06, 2025 at 05:03:36PM +0200, Vincent Guittot wrote:
> > On Tue, 20 May 2025 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > One of the things lost with introduction of DELAY_DEQUEUE is the
> > > ability of TTWU to move those tasks around on wakeup, since they're
> > > on_rq, and as such, need to be woken in-place.
> > 
> > I was thinking that you would call select_task_rq() somewhere in the
> > wake up path of delayed entity to get a chance to migrate it which was
> > one reason for the perf regression (and which would have also been
> > useful for EAS case) but IIUC, 
> 
> FWIW, the trivial form of all this is something like the below. The
> problem is that performance sucks :/ For me it is worse than not doing
> it. 

And because I was poking at the thing, I had to try the complicated
version again... This seems to survive long enough for a few benchmark
runs, and its not bad.

It very much burns after a while though :-( So I'll have to poke more at
this. Clearly I'm missing something (again!).

---
Index: linux-2.6/include/linux/sched.h
===================================================================
--- linux-2.6.orig/include/linux/sched.h
+++ linux-2.6/include/linux/sched.h
@@ -994,6 +994,7 @@ struct task_struct {
 	 * ->sched_remote_wakeup gets used, so it can be in this word.
 	 */
 	unsigned			sched_remote_wakeup:1;
+	unsigned			sched_remote_delayed:1;
 #ifdef CONFIG_RT_MUTEXES
 	unsigned			sched_rt_mutex:1;
 #endif
Index: linux-2.6/kernel/sched/core.c
===================================================================
--- linux-2.6.orig/kernel/sched/core.c
+++ linux-2.6/kernel/sched/core.c
@@ -3844,6 +3849,50 @@ static int ttwu_runnable(struct task_str
 }
 
 #ifdef CONFIG_SMP
+static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
+
+static inline bool ttwu_do_migrate(struct task_struct *p, int cpu)
+{
+	if (task_cpu(p) == cpu)
+		return false;
+
+	if (p->in_iowait) {
+		delayacct_blkio_end(p);
+		atomic_dec(&task_rq(p)->nr_iowait);
+	}
+
+	psi_ttwu_dequeue(p);
+	set_task_cpu(p, cpu);
+	return true;
+}
+
+static int ttwu_delayed(struct rq *rq, struct task_struct *p, int wake_flags)
+{
+	int cpu = task_cpu(p);
+
+	/*
+	 * Notably it is possible for on-rq entities to get migrated -- even
+	 * sched_delayed ones.
+	 */
+	if (unlikely(cpu_of(rq) != cpu)) {
+		/* chase after it */
+		__ttwu_queue_wakelist(p, cpu, wake_flags | WF_DELAYED);
+		return 1;
+	}
+
+	if (task_on_rq_queued(p))
+		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP | DEQUEUE_DELAYED);
+
+	cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
+	if (!ttwu_do_migrate(p, cpu))
+		return 0;
+
+	wake_flags |= WF_MIGRATED;
+	/* shoot it to the other CPU */
+	__ttwu_queue_wakelist(p, cpu, wake_flags);
+	return 1;
+}
+
 void sched_ttwu_pending(void *arg)
 {
 	struct llist_node *llist = arg;
@@ -3857,39 +3906,12 @@ void sched_ttwu_pending(void *arg)
 	update_rq_clock(rq);
 
 	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
-		struct rq *p_rq = task_rq(p);
-		int ret;
-
-		/*
-		 * This is the ttwu_runnable() case. Notably it is possible for
-		 * on-rq entities to get migrated -- even sched_delayed ones.
-		 */
-		if (unlikely(p_rq != rq)) {
-			rq_unlock(rq, &guard.rf);
-			p_rq = __task_rq_lock(p, &guard.rf);
-		}
-
-		ret = __ttwu_runnable(p_rq, p, WF_TTWU);
-
-		if (unlikely(p_rq != rq)) {
-			if (!ret)
-				set_task_cpu(p, cpu_of(rq));
-
-			__task_rq_unlock(p_rq, &guard.rf);
-			rq_lock(rq, &guard.rf);
-			update_rq_clock(rq);
-		}
-
-		if (ret)
-			continue;
-
-		/*
-		 * This is the 'normal' case where the task is blocked.
-		 */
-
 		if (WARN_ON_ONCE(p->on_cpu))
 			smp_cond_load_acquire(&p->on_cpu, !VAL);
 
+		if (p->sched_remote_delayed && ttwu_delayed(rq, p, WF_TTWU))
+			continue;
+
 		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &guard.rf);
 	}
 
@@ -3933,6 +3955,7 @@ static void __ttwu_queue_wakelist(struct
 	struct rq *rq = cpu_rq(cpu);
 
 	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
+	p->sched_remote_delayed = !!(wake_flags & WF_DELAYED);
 
 	WRITE_ONCE(rq->ttwu_pending, 1);
 	__smp_call_single_queue(cpu, &p->wake_entry.llist);
@@ -4371,17 +4394,8 @@ int try_to_wake_up(struct task_struct *p
 		 * their previous state and preserve Program Order.
 		 */
 		smp_cond_load_acquire(&p->on_cpu, !VAL);
-
-		if (task_cpu(p) != cpu) {
-			if (p->in_iowait) {
-				delayacct_blkio_end(p);
-				atomic_dec(&task_rq(p)->nr_iowait);
-			}
-
+		if (ttwu_do_migrate(p, cpu))
 			wake_flags |= WF_MIGRATED;
-			psi_ttwu_dequeue(p);
-			set_task_cpu(p, cpu);
-		}
 #else
 		cpu = task_cpu(p);
 #endif /* CONFIG_SMP */
