Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82177238D22
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408958; cv=none; b=t5a7eFPq8n4eJ1CqG8nSRLOsvFuus9P5kKLOxoG+hGk0FKjq2Jj6LFWq7u42BengPsSR+G8COPgLmRTMVJg0hrPLnWjj8eIMQxTSxMWyj+5rvChcJby0cXguMBKELqvCCLEt0wySYrvgeI9pOaMXj2ySPdRyJh3eFXel8OiHBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408958; c=relaxed/simple;
	bh=tUnBoaORLHpfbwdrdxvfqxGktmMBrPEtRcCrtSH8vC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INX6YmRcEYGpeAcKKnRTohzZ9Npwa1j9WqsFl9KZoS9rmnF/Z3Vpnaoozh1aRiAkz/kUaq/Q6C7JPhRCaMSbKm1bJZzv+1k+0lT4o0iTIlUrkr2SHPvkQF+bFj8VLMIpqsF49TzddyIV24XeDVrTttt2Aa3Qzd7gmQxFX/1uRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gzz4CETi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gzz4CETi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ReT7YFpZx4wQiGsK94qAgaIFoWkcxvduYtOMaEeoQLo=; b=gzz4CETi5xCqjpWcezoXBkx1m8
	vz11zbBjYSoO56u3Ry9yi75gWvqoCPl6eYuY1pUrDEu7HL6jiqnQnrZhxXxdLf022NLjd3Rd2A/ir
	q3ZQEixo9zfnRbCv6vuINpsr6cyFHJ8DLgOAja+jKAc8HFaR2dnEnpjmVPbqEU4u9Nx6dQnq+AgJ6
	95ZfVtfpnMjY5wjgmXmRn2GQTTeQuKSl9TMStdg7SmYB3v8e3MPOUjYRAIoDk3XgeH3e85TyiXjxK
	69SGD3l24vgY3TfmhNFejgzck1yKDC2zzxgdoSnCKN9dGy1D6DHiuzhcLogmUIwWoAz1sxiHsYG3u
	sr1zn7gg==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXKP-00000004fvS-2WkF;
	Fri, 20 Jun 2025 08:42:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 69BDD308989; Fri, 20 Jun 2025 10:42:28 +0200 (CEST)
Date: Fri, 20 Jun 2025 10:42:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with
 different slices
Message-ID: <20250620084228.GP1613376@noisy.programming.kicks-ass.net>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
 <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
 <CAKfTPtA-2YjQ-9jgrAZPT6v0R5X04Q5PoZ6Pa0TzAZji3=jiyg@mail.gmail.com>
 <CAKfTPtCRBMYue3smo-iXEXSzeFGYSJs5mp50zwQZLRvfL-szVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCRBMYue3smo-iXEXSzeFGYSJs5mp50zwQZLRvfL-szVg@mail.gmail.com>

On Thu, Jun 19, 2025 at 02:27:43PM +0200, Vincent Guittot wrote:
> On Wed, 18 Jun 2025 at 09:03, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Tue, 17 Jun 2025 at 11:22, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Fri, Jun 13, 2025 at 04:05:10PM +0200, Vincent Guittot wrote:
> > > > Vincent Guittot (3):
> > > >   sched/fair: Use protect_slice() instead of direct comparison
> > > >   sched/fair: Limit run to parity to the min slice of enqueued entities
> > > >   sched/fair: Improve NO_RUN_TO_PARITY
> > >
> > > Ah. I wrote these here patches and then totally forgot about them :/.
> > > They take a different approach.
> > >
> > > The approach I took was to move decision to stick with curr after pick,
> > > instead of before it. That way we can evaluate the tree at the time of
> > > preemption.
> >
> > Let me have a look at your patches
> 
> I have looked and tested your patches but they don't solve the lag and
> run to parity issues not sur what he's going wrong.

Humm.. So what you do in patch 3, setting the protection to min_slice
instead of the deadline, that only takes into account the tasks present
at the point we schedule.

Which is why I approached it by moving the protection to after pick;
because then we can directly compare the task we're running to the
best pick -- which includes the tasks that got woken. This gives
check_preempt_wakeup_fair() better chances.

To be fair, I did not get around to testing the patches much beyond
booting them, so quite possibly they're buggered :-/

> Also, my patchset take into account the NO_RUN_TO_PARITY case by
> adding a notion of quantum execution time which was missing until now

Right; not ideal, but I suppose for the people that disable
RUN_TO_PARITY it might make sense. But perhaps there should be a little
more justification for why we bother tweaking a non-default option.

The problem with usage of normalized_sysctl_ values is that you then get
behavioural differences between 1 and 8 CPUs or so. Also, perhaps its
time to just nuke that whole scaling thing (I'm sure someone mentioned
that a short while ago).

> Regarding the "fix delayed requeue", I already get an update of
> current before requeueing a delayed task. Do you have a use case in
> mind ?

Ah, it was just from reading code, clearly I missed something. Happy to
forget about that patch :-)
