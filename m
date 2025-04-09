Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406011C5D63
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225725; cv=none; b=RKPXgaarL92oWkxee6P5r4JTETF+fFTuPHOI1MDgp8mM9QjzGCBb6nA1ZVD+LEIIhqhxcJhHt0cSV2Us5av8LUU2LYDdpHs76X+mVQg2qZV2c+jYK2XKzgQOdRVQ7NFvS8apMfr0MguPMnxeWePsH+AnkQTYkVG6f8Czd5X4g+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225725; c=relaxed/simple;
	bh=C5KMsG8hLiNkhMG2R2yhs8GG0soJXSaxFUn+sWzM15g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DA9u62KLfuxjSZ+xefT19CJyCemCLivuSjd9jGfotMaUcS2C4wdDqK7mdk/uHyiInoH4DK3h7j9LEaZJ6bwvrXX00sF5Ue5IY0O1DBA+i0OdebhaKMhijaELu/3vt6yPH+w5KnBMlcdB+N78txA69zn9MEvoNQxNWxoy09dYIjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ublz1CXm; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ublz1CXm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MWq7+ZDeu6lqJHXnARaq7nLRtV46HbSzyx3OJzyzJMY=; b=Ublz1CXmy2JM4TN48lLyQmk0YA
	eEteI5fUkemxJXiM1OpYItcz6MZbTTauiv+DwjvwOMjyGEzk0hzOUgyDN8GWPLtxewu3UgZA7eJQH
	XbbARf5uXjuPkBI/LhOlJZIc258rEQNWjCjAOJq2czH77zsq7wmp3HRbZXQS/CEQ0LZs0N5l+Ufws
	7cHS35b3l77Bvfgc6dTl90k/iq2K0ZVhDbKqtDXMXtk5+43k4JyxfmoA/KZmFjvT1mS4uy+mw5+LG
	0/YgOFTV0y8rc3hxid5KNiudKvVSrcdYNYkCVmNCn74/5OVloO2WTN01HVwxWq/BjHXJMm01wbOC6
	PWxUfIFg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2amo-00000008ffB-25gk;
	Wed, 09 Apr 2025 19:08:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 153713003FF; Wed,  9 Apr 2025 21:08:34 +0200 (CEST)
Date: Wed, 9 Apr 2025 21:08:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, linux-mm@kvack.org,
	Ingo Molnar <mingo@redhat.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v12 2/3] sched: Move task_mm_cid_work to mm work_struct
Message-ID: <20250409190834.GQ9833@noisy.programming.kicks-ass.net>
References: <20250311062849.72083-1-gmonaco@redhat.com>
 <20250311062849.72083-3-gmonaco@redhat.com>
 <20250409140303.GA9833@noisy.programming.kicks-ass.net>
 <c0df7480-1c18-421f-9348-2d39b7bebb49@efficios.com>
 <20250409152025.GK9833@noisy.programming.kicks-ass.net>
 <e916f393-b18c-4641-ace7-cf23b7508e09@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e916f393-b18c-4641-ace7-cf23b7508e09@efficios.com>

On Wed, Apr 09, 2025 at 11:53:05AM -0400, Mathieu Desnoyers wrote:
> On 2025-04-09 11:20, Peter Zijlstra wrote:
> > On Wed, Apr 09, 2025 at 10:15:42AM -0400, Mathieu Desnoyers wrote:
> > > On 2025-04-09 10:03, Peter Zijlstra wrote:
> > > > On Tue, Mar 11, 2025 at 07:28:45AM +0100, Gabriele Monaco wrote:
> > > > > +static inline void rseq_preempt_from_tick(struct task_struct *t)
> > > > > +{
> > > > > +	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
> > > > > +
> > > > > +	if (rtime > RSEQ_UNPREEMPTED_THRESHOLD)
> > > > > +		rseq_preempt(t);
> > > > > +}
> > > > 
> > > > This confused me.
> > > > 
> > > > The goal seems to be to tickle __rseq_handle_notify_resume() so it'll
> > > > end up queueing that work thing. But why do we want to set PREEMPT_BIT
> > > > here?
> > > 
> > > In that scenario, we trigger (from tick) the fact that we may recompact the
> > > mm_cid, and thus need to update the rseq mm_cid field before returning to
> > > userspace.
> > > 
> > > Changing the value of the mm_cid field while userspace is within a rseq
> > > critical section should abort the critical section, because the rseq
> > > critical section should be able to expect the mm_cid to be invariant
> > > for the whole c.s..
> > 
> > But, if we run that compaction in a worker, what guarantees the
> > compaction is done and mm_cid is stable, but the time this task returns
> > to userspace again?
> 
> So let's say we have a task which is running and not preempted by any
> other task on a cpu for a long time.
> 
> The idea is to have the tick do two things:
> 
> A) trigger the mm_cid recompaction,
> 
> B) trigger an update of the task's rseq->mm_cid field at some point
>    after recompaction, so it can get a mm_cid value closer to 0.
> 
> So in its current form this patch will indeed trigger rseq_preempt()
> for *every tick* after the task has run for more than 100ms, which
> I don't think is intended. This should be fixed.
> 
> Also, doing just an rseq_preempt() is not the correct approach, as
> AFAIU it won't force the long running task to release the currently
> held mm_cid value.
> 
> I think we need something that looks like the following based on the
> current patch:
> 
> - rename rseq_preempt_from_tick() to rseq_tick(),
> 
> - modify rseq_tick() to ensure it calls rseq_set_notify_resume(t)
>   rather than rseq_preempt().
> 
> - modify rseq_tick() to ensure it only calls it once every
>   RSEQ_UNPREEMPTED_THRESHOLD, rather than every tick after
>   RSEQ_UNPREEMPTED_THRESHOLD.
> 
> - modify rseq_tick() so at some point after the work has
>   compacted mm_cids, we do the same things as switch_mm_cid()
>   does, namely to release the currently held cid and get a likely
>   smaller one (closer to 0). If the value changes, then we should
>   trigger rseq_preempt() so the task updates the mm_cid field before
>   returning to userspace and restarts ongoing rseq critical section.
> 
> Thoughts ?

Yes, that seems better. Also be sure there's a comment around there
somewhere that explains this. Because I'm sure I'll have forgotten all
about this in a few months time :-)
