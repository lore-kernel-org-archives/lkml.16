Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F385154C05
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926404; cv=none; b=CuZA6PI8WKyhlh+xpUfbElijGXzNsJdiuUjXsGdqfSa30YBu9Pjzaym51mqzW8XU5pXn4lGZjMbXhm9e3E/PtLutGnduMdYHAIJJ6rSUwziQJitLAUkQrd9QRlNl9K+kcQVdYIUNKG2451VNR4RMGQJRqZPnYVkxi/WdqnCRuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926404; c=relaxed/simple;
	bh=zmnf4kNDZH9bEEvjoqcRRv2Sc2hYXJFMSW7cfLmOB9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osv8FAYnVcA5gSwgvL0qWL/WxgA0btezUH43Cld7Vqx5FAylwq8fKSb+0ESp8vmZEOBg4Lyn5f0iyA7HNAo7UcotNt+zWUIS+WHGxHNlf/LLXxz6E7VEvA95KXYn/ClUiAx+/m6riU0WoVYpYRyn/2ylXnT1MZ7TZ9kyVcLgUPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mhbSiXjp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mhbSiXjp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PHjEvLGOnaOqo/YIENcJvNEsNer01OucTijilJi0xAk=; b=mhbSiXjpXraoED2YXCR3YGaBqV
	nqeP9rH4+l4IKTPFxHV1aQP//abHYPlsdsFzURczehgJrQe+h4M6I8jA/oTwY4GRX8Nmc0xDoQM0A
	o2BAHza0dzZTcWMKxPEgMSUA1Oi/z0fPNZXs5PyEyveN9ioJoN1QJ4+SVfzoQa8wHVeMMUEOG7kY7
	iWXGKvui1heVbdrRCS0Fi49QHTXdo/xBSnoYqypWzdlx7AIB5DL6lYI3spX4nW3sf8pDqFMktTiBa
	9Q+N+kqGndWYHXleFTc3ti3PYIVdHikxj4hXtlOiAZYtXvhgSdGiIojny6JAgkqIedi65cePiO/yi
	6I6g4fcg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMBw-0000000HA7s-0qLH;
	Fri, 07 Feb 2025 11:06:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CA27C300310; Fri,  7 Feb 2025 12:06:34 +0100 (CET)
Date: Fri, 7 Feb 2025 12:06:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250207110634.GC7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203142743.GI7145@noisy.programming.kicks-ass.net>
 <20250203155114.YVGnCHUT@linutronix.de>
 <20250204103447.GU7145@noisy.programming.kicks-ass.net>
 <20250205083926.etxnZAoP@linutronix.de>
 <Z6XVLqexaKZr0cy1@jlelli-thinkpadt14gen4.remote.csb>
 <20250207110050.stt_l7KT@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207110050.stt_l7KT@linutronix.de>

On Fri, Feb 07, 2025 at 12:00:50PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-02-07 10:41:02 [+0100], Juri Lelli wrote:
> > Hi,
> > 
> > On 05/02/25 09:39, Sebastian Andrzej Siewior wrote:
> > > On 2025-02-04 11:34:47 [+0100], Peter Zijlstra wrote:
> > 
> > ...
> > 
> > > > Anyway, none of this solves anything when a process has both an active
> > > > RT part and an active !RT part (which isn't uncommon AFAICT).
> > > > 
> > > > Then the RT bits will still get interference from the !RT bits. Do we
> > > > want to complicate things and consider that?
> > > 
> > > I don't think so. The active and inactive are common but it is still the
> > > same process so you can expect it. The ugly part is when it is an
> > > entirely different task and it is random which one it is.
> > 
> > Not entirely sure we are thinking about the same situation, but it looks
> > like we have cases of RT tasks that are affected by the underlying issue
> > this set is about because they make use of libraries. So, in this case
> > we have a cross-process (RT/!RT) situation that I am not sure we can
> > address sanely. What do you think?
> 
> I wouldn't advice to use "unknown" code in a RT application and even
> threads. Audit libs before using them and not just collect them.
> A lock without PI in your RT thread is not good. A lot of locks, not
> knowing the "locked" time, also not good. Things that work most of the
> time due to the fastpath and only break from time to time.
> Also, a thread does fork() once during start up and things may continue
> to be good but may catch up eventually.

Anyway, supposing people want to tinker, it should be possible to split
the local hash based on if the address is mlocked or not.

This gives some obvious issues where people do futex_wait(), mlock() and
then expect futex_wake() to still work, but that should be rare. You
typically mlock before you start using the memory.

As always, mlockall is bad, do not use, like ever. But especially in
mixed mode RT programs.
