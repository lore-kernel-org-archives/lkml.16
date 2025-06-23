Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE448231C8D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677399; cv=none; b=Fam25MiFlbVJzTuZ+EUUazoaLnSpkJp6qyBFweFcZogsBhYBswn37tqetdck5JtCrPz0/aaU7ITGq0t6lQ2Ptlq91KQvMSDfrEWgCneJuE4LOfJUS+TCG4iGe/jbWn3B97BlHIejnpyrGkubsVQMjTPjt8dXjcW0bHg+pVWIhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677399; c=relaxed/simple;
	bh=DYNqBNUlWgKAuEVOS77tdc0ByrFSa87MJlxXA+bR9/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVIgUXk6na8VUfTN7RI7aWHSZVeYbQeOO5qPuTu1f/0QfZAMln6mWtf0y7EBJqt3sOo+j+ZVMexAG4vOkXLun5n0BE/luugaJTrLJDCj3VT5cPfWNSiLkj2kMfhSzxtBifPWg4/AKiHbnODS7pb398LaLJLtgv/ZiPneD5Z6xjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RCTRSHQw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RCTRSHQw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FLmwIsPITEhQQnQYQD3b/uMa0DBJuudsbqTBC6gMFw8=; b=RCTRSHQwiDz31/tj4iZJ7P086H
	4s0nkNqFxwSjdrGYF2J9sV9/831UqffpQhR7DuB8ypTiyeXoHSlqFg3g9si2K5PpSfjtKHimoxf3M
	dMBTtDd04H4q9+SznOZWZlKUH8SNS37GiD4sOP83eKaLOJtSp9yzbc01sqVsA0v+QEYyoGV/n+22i
	CYhjkXUYA2OwKdnFp8JO9uXTvpPfVEwwk90w7WR71H6pdgIDJ02h/qog4T7fj9c6Ivj9F+Bk97jaz
	v2XWaMSpw9k3T1CYMS0rRZOEU6GhGHyGz8m4dXUcjXOfs+8DP18L762VoljhRAzT2roGcaYKAV9OL
	FMcfLz0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfA5-00000003EHW-18yT;
	Mon, 23 Jun 2025 11:16:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 68B52307E51; Mon, 23 Jun 2025 13:16:28 +0200 (CEST)
Date: Mon, 23 Jun 2025 13:16:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with
 different slices
Message-ID: <20250623111628.GS1613200@noisy.programming.kicks-ass.net>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
 <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
 <CAKfTPtA-2YjQ-9jgrAZPT6v0R5X04Q5PoZ6Pa0TzAZji3=jiyg@mail.gmail.com>
 <CAKfTPtCRBMYue3smo-iXEXSzeFGYSJs5mp50zwQZLRvfL-szVg@mail.gmail.com>
 <20250620084228.GP1613376@noisy.programming.kicks-ass.net>
 <CAKfTPtAvuuOTmuMpzs8GUpUebL76h7F8zuN1tnJz_KFYxAFN3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtAvuuOTmuMpzs8GUpUebL76h7F8zuN1tnJz_KFYxAFN3w@mail.gmail.com>

On Fri, Jun 20, 2025 at 12:29:27PM +0200, Vincent Guittot wrote:

> yes but at this point any waking up task is either the next running
> task or enqueued in the rb tree

The scenario I was thinking of was something like:

A (long slice)
B (short slice)
C (short slice)

  A wakes up and goes running

Since A is the only task around, it gets normal protection
 
  B wakes up and doesn't win

So now we have A running with long protection and short task on-rq

  C wakes up ...

Whereas what we would've wanted to end up with for C is A running with
short protection.

> > Which is why I approached it by moving the protection to after pick;
> > because then we can directly compare the task we're running to the
> > best pick -- which includes the tasks that got woken. This gives
> > check_preempt_wakeup_fair() better chances.
> 
> we don't always want to break the run to parity but only when a task
> wakes up and should preempt current or decrease the run to parity
> period. Otherwise, the protection applies for a duration that is short
> enough to stay fair for others
> 
> I will see if check_preempt_wakeup_fair can be smarter when deciding
> to cancel the protection

Thanks. In the above scenario B getting selected when C wakes up would
be a clue I suppose :-)

> > To be fair, I did not get around to testing the patches much beyond
> > booting them, so quite possibly they're buggered :-/
> >
> > > Also, my patchset take into account the NO_RUN_TO_PARITY case by
> > > adding a notion of quantum execution time which was missing until now
> >
> > Right; not ideal, but I suppose for the people that disable
> > RUN_TO_PARITY it might make sense. But perhaps there should be a little
> > more justification for why we bother tweaking a non-default option.
> 
> Otherwise disabling RUN_TO_PARITY to check if it's the root cause of a
> regression or a problem becomes pointless because the behavior without
> the feature is wrong.

Fair enough.

> And some might not want to run to parity but behave closer to the
> white paper with a pick after each quantum with quantum being
> something in the range [0.7ms:2*tick)
> 
> >
> > The problem with usage of normalized_sysctl_ values is that you then get
> > behavioural differences between 1 and 8 CPUs or so. Also, perhaps its
> 
> normalized_sysctl_ values don't scale with the number of CPUs. In this
> case, it's always 0.7ms which is short enough compare to 1ms tick
> period to prevent default irq accounting to keep current for another
> tick

Right; but it not scaling means it is the full slice on UP, half the
slice on SMP-4 and a third for SMP-8 and up or somesuch.

It probably doesn't matter much, but its weird.
