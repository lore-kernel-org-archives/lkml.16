Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912441A9B52
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749811617; cv=none; b=n/1oth7xoVD6nUF78U60TH+FLLpM8aO6ZAwfBgnIppbkVjn02qBGjxx1u5hHPyEV0jYrTqLxthR2ptBIFbVHw3q7sgZ6vLTNrOXs12NbUZBJTny4z6zPLxIDbuuf70xtFG9MFYsRII8HgXkQL5lsEo5WYw1T9RpaVLDUKW5F/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749811617; c=relaxed/simple;
	bh=w1D1f9mKm2VThZAIfscPfnsKUDx57mSW6iODsYBu2bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITJg6QtPG7xCduEjqrNOFomqwhEpisUOiW2PaTeHS7I2gLvyAptTb41kWz8yMTR8AjhlGnSO+8HjtUQkB5fg+J79WjpSR+hSlurvf6ulSeaZ7IlCnd4ix2JzoxkMB63U5uK7ineXieNdcAbeA24oBW/HdQtUIbYpjCyqoF+8W4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vtgZGCer; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vtgZGCer"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RaWGHVe1T+vmohukQc8ZR0O25gU5PdtojC+tRUD34Ro=; b=vtgZGCereAlE/RwX77WIDdu+WV
	ll/YNd2VYognDTMmak1DEbr4AJhXPNgfGxZb6hHFRDzj0l5kA91TNNL6jGMPhvChmQ54vglxevlDp
	eIH2UvSt6ClUx9iNcGzQTv6I3gSMl/S+uXH6fGLOdCxxRZhD1w+UXQFI31Wm+/6rHAJTNj3RvZZqq
	JDOYXa19S/6lCJYMnXv0aGN6Za4hHt5nI3twGp3Ox1MyAN8/qcNK565sRaRoVrztC8YrII+3lVtjn
	fKWhiNCfXZ/wBDUl9rUFXfAddCN9ZGA5NDahohb20zcu3XRBuxVWKwmgXdFi5vvOGE79zb6F1/hfr
	1SQWqSsg==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1vp-0000000CrAH-1rdP;
	Fri, 13 Jun 2025 10:46:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 231FE306187; Fri, 13 Jun 2025 12:46:44 +0200 (CEST)
Date: Fri, 13 Jun 2025 12:46:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250613104644.GB2273450@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
 <64ae41a7-2c06-4082-a4d6-0db5b635ea01@arm.com>
 <20250613095119.GH2278213@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613095119.GH2278213@noisy.programming.kicks-ass.net>

On Fri, Jun 13, 2025 at 11:51:19AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 13, 2025 at 09:34:22AM +0200, Dietmar Eggemann wrote:
> > On 20/05/2025 11:45, Peter Zijlstra wrote:
> > 
> > [...]
> > 
> > > @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
> > >  	update_rq_clock(rq);
> > >  
> > >  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> > > +		struct rq *p_rq = task_rq(p);
> > > +		int ret;
> > > +
> > > +		/*
> > > +		 * This is the ttwu_runnable() case. Notably it is possible for
> > > +		 * on-rq entities to get migrated -- even sched_delayed ones.
> > > +		 */
> > > +		if (unlikely(p_rq != rq)) {
> > > +			rq_unlock(rq, &rf);
> > > +			p_rq = __task_rq_lock(p, &rf);
> > 
> > I always get this fairly early with TTWU_QUEUE_DELAYED enabled, related
> > to p->pi_lock not held in wakeup from interrupt.
> > 
> > [   36.175285] WARNING: CPU: 0 PID: 162 at kernel/sched/core.c:679 __task_rq_lock+0xf8/0x128
> 
> Thanks, let me go have a look.

I'm thinking this should cure things.

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -677,7 +677,12 @@ struct rq *__task_rq_lock(struct task_st
 {
 	struct rq *rq;
 
-	lockdep_assert_held(&p->pi_lock);
+	/*
+	 * TASK_WAKING is used to serialize the remote end of wakeup, rather
+	 * than p->pi_lock.
+	 */
+	lockdep_assert(p->__state == TASK_WAKING ||
+		       lockdep_is_held(&p->pi_lock) != LOCK_STATE_NOT_HELD);
 
 	for (;;) {
 		rq = task_rq(p);
