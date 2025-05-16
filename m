Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA9E1D6DBB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399395; cv=none; b=E/trXe9VwGcjNiPXBxyO0PkyXSDZlTqhganXaLLtQcFFR7b6EG/FZMsaVYm5RqyNN0nQ86I+sw3EUSNMH8KRHrBFmAzNpv8+pmfv5qRe5vmQDjpyaNTiwvRAVHRPUcq5hAmuNeAewUxuu5YNQVWr/DGGFqiAnHhGyWnByrf6Zmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399395; c=relaxed/simple;
	bh=YWPz8xau0yWL1j67W0GgmxlVBGsYPYpfzELXaiipSm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ex5p9zdTnTZ+fHICvMmKCCEKYGkJx1IXNTBj21uIwaqR8JXpJa5XmwoHu28OUDrC6/5vHllgvinLQvo+1BRaoyE4YdjkTSSZpzaYkgUbA+wAZXrPzfGKpd2BHYHku/VXKTDUSO6soZA92kAg5bVeqo2+y2XjmgLQQJeRCW8EWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gm35F5ri; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gm35F5ri"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7tsCPctjV/C2vvgrIX4ADZu0tFupWawbubj6AZGDco8=; b=gm35F5riwDDPRASqo9Pt7V6BhM
	8RMM6wxdGPxpl3oR3Pnpo8TegM0kW/mKWYzM/FvrycjKO+ZCUvwWmVmwIGomM97mO6/OG7VIyu1GD
	lAtbSwD/erFUT9JIyQLAhWF0bEurERRrlXBruGFVb0xn1TnbsrAgHLR62SIoHkL3/5/BLr1g7KOa0
	RfMNZE6Cl0i5XmVXAULbuXSKIOs0iEbzjy+j0c7izr3HDEF3czu+BefzpAq7cpUo7ex4ZrQS4GdhR
	Eq+mJy6F4booAoJ/HeFp2ixp3gK8H79bu30rsRozf8/OyCgDUBQdbL9QUXvkONSg8kYXWAENy5WWz
	Klpxw3Wg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuOp-0000000FOhb-0vYA;
	Fri, 16 May 2025 12:42:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2A9DA300780; Fri, 16 May 2025 14:42:50 +0200 (CEST)
Date: Fri, 16 May 2025 14:42:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Steven Rostedt <rostedt@goodmis.org>, mingo@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de,
	qais.yousef@arm.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, wim@linux-watchdog.org,
	PRAT Maximilien <maximilien.prat@cs-soprasteria.com>,
	CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>
Subject: Re: [PATCH 16/23] sched,watchdog: Convert to sched_set_fifo()
Message-ID: <20250516124250.GD16434@noisy.programming.kicks-ass.net>
References: <20200422112719.826676174@infradead.org>
 <20200422112832.165197058@infradead.org>
 <20200422085155.7549ca94@gandalf.local.home>
 <20200422132448.GH20730@hirez.programming.kicks-ass.net>
 <b506e413-f6ef-4f9c-8c15-5fc76f978235@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b506e413-f6ef-4f9c-8c15-5fc76f978235@csgroup.eu>

On Fri, May 16, 2025 at 10:42:47AM +0200, Christophe Leroy wrote:
> Hi Peter,
> 
> Le 22/04/2020 à 15:24, Peter Zijlstra a écrit :
> > On Wed, Apr 22, 2020 at 08:51:55AM -0400, Steven Rostedt wrote:
> > > On Wed, 22 Apr 2020 13:27:35 +0200
> > > Peter Zijlstra <peterz@infradead.org> wrote:
> > > 
> > > > Because SCHED_FIFO is a broken scheduler model (see previous patches)
> > > > take away the priority field, the kernel can't possibly make an
> > > > informed decision.
> > > > 
> > > > Effectively changes prio from 99 to 50.
> > > 
> > > Hmm, this being a watchdog, and looking at commit 38a1222ae4f364d
> > > ("watchdog: core: make sure the watchdog worker always works")
> > > 
> > > I wonder if we should add a sched_set_high(), or have some other kind of
> > > watchdog handler that is guaranteed to trigger.
> > 
> > It's FIFO, it'll never win from either a deadline or a stop-task. After
> > that it doesn't matter.
> 
> It does matter. I didn't realise it when you sent out this patch five years
> ago, but today I'm facing an issue due to that patch. On powerpc 8xx the
> watchdog must be woken up every second, the HW is not able to take a higher
> timeout. I have process that is running at SCHED_FIFO prio 90. From time to
> time it keeps running for a bit more than one second, leading to a watchdog
> reset. This didn't happen before your patch.
> 
> Why having arbitrary selected prio 50 and not kept it at the highest
> possible priority ?

Because if your random program of choice would have had a prio-90 task
that was super duper more important -- like stopping the saw from taking
off your fingers that had a runtime of mere milliseconds, then having
the watchdog thread delay that could be catastrophic, no?

> What would be the solution to fix this unexpected watchdog reset ?
> 
> > 
> > fifo_high() is most definitely a bad idea, because then we're back into
> > the whole 'fifo priority' has meaning -- it does not. At least, it
> > doesn't until you've got system design information.
> 
> I don't understand why it has no meaning. When I have a user app at FIFO
> prio 90 and one at FIFO 89 I know the one at 90 will immediatly preempt the
> one at 89 when receiving data, and that's the behaviour I expect. What am I
> missing here ?

The 'until you've got system design information' bit. Not until you have
the domain expertise of all possible runnable tasks on your system, can
you determine FIFO priorities.

The thing is; you cannot design two programs that use FIFO in isolation
and blindly smash them together and expect it to work. FIFO is
fundamentally non-composable.

Someone has to go and set the priority of every FIFO task on the system,
otherwise things will not work. This very much includes the watchdog
thread.

So the solution is to know your setup and do your setup, including
the watchdog thread priority.
