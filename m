Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CF1E0DE8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749808287; cv=none; b=qCyoZKUTFw1PRRkh5nNtFS/M5ANq9cehnZfEzlQQd6zETss+ZlWYDAGevYv9l3j7VH1Ig1oVs0AjbvLxHXH6LCyG/b0qJJ+4GKM2lJ/Vtl0tF6SU7QHRXZqmFDWYqB7p/y1Hb7jdv7XXH6zgqf2mumVAoj9pRQHGelJpdgCp/OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749808287; c=relaxed/simple;
	bh=uxQUYg6+4yee/1vZFqXverOf1FUM9PL6+/f4b3MXtbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWfZ5qLnKZq+KEtrcqa52z5ZhN5miTKcKWQmEmBd8aicnufdtvtul518kivQ7UOOIELgR/iZY5hbzGYDe3n9fOzHkMGdynNHPYka9qo+LLGUxqieIEf+TBj5iX1UBgOEiTjSjTG6Mmzt+lwUY5jfbrV0pVDj/rdxYfpa772xE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ly/R6i84; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ly/R6i84"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zMRKcEgrPYZjV2m2qSV/hugst8r3zHgXAlbu8TlewG0=; b=Ly/R6i843glA6vdXvVLa9a7Vks
	bAcmkNs5ivji4I7voIZulG4DC4a4AgoVjvcDIRZBjkETlNsP/3XQSjkeFkbBvZh6+fQk1ih6i6Rwh
	L4jxDuDvBPks1D3/9C1j4Nkc4zesxDStB4Yu/RPVpjOiRfekVkY0Am8/ZHhwXvVdoEZqUkB8usd8c
	8Pd6vvPvRGnWXNS3DUcw9ot5k/Go/cljkbtfGK/GTbp4J7FNGdZRFMR7g6CC5Qm4bdWg93glYEyfp
	ONsC8z61AvbYBYkvGp083DN92u9QQHyOj1A+OP58aX4Nep5w8WkZc/9fz9ZzzXgl/VdTEooEZU9bN
	KW5ItUTw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ14C-0000000Co8c-2YSs;
	Fri, 13 Jun 2025 09:51:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C9FA730617F; Fri, 13 Jun 2025 11:51:19 +0200 (CEST)
Date: Fri, 13 Jun 2025 11:51:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250613095119.GH2278213@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
 <64ae41a7-2c06-4082-a4d6-0db5b635ea01@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ae41a7-2c06-4082-a4d6-0db5b635ea01@arm.com>

On Fri, Jun 13, 2025 at 09:34:22AM +0200, Dietmar Eggemann wrote:
> On 20/05/2025 11:45, Peter Zijlstra wrote:
> 
> [...]
> 
> > @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
> >  	update_rq_clock(rq);
> >  
> >  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> > +		struct rq *p_rq = task_rq(p);
> > +		int ret;
> > +
> > +		/*
> > +		 * This is the ttwu_runnable() case. Notably it is possible for
> > +		 * on-rq entities to get migrated -- even sched_delayed ones.
> > +		 */
> > +		if (unlikely(p_rq != rq)) {
> > +			rq_unlock(rq, &rf);
> > +			p_rq = __task_rq_lock(p, &rf);
> 
> I always get this fairly early with TTWU_QUEUE_DELAYED enabled, related
> to p->pi_lock not held in wakeup from interrupt.
> 
> [   36.175285] WARNING: CPU: 0 PID: 162 at kernel/sched/core.c:679 __task_rq_lock+0xf8/0x128

Thanks, let me go have a look.

> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -2313,6 +2313,7 @@ static inline int task_on_rq_migrating(s
> >  #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
> >  
> >  #define WF_ON_CPU		0x0100
> 
> Looks like there is no specific handling for WF_ON_CPU yet?

Oh, indeed. That didn't survive the tinkering and then I forgot to clean
it up here. Let me go find a broom and sweep these few bits under the
carpet then :-)
