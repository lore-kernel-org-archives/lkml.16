Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CFC26B08B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210454; cv=none; b=aMwBYVchkbnhuMPohwTxTfXYOa+St2PRuR61/oTpoHcQmGnZhkAH8e89tm2WePI36P5NIiBVeRFTROlfgvgjmP7L4SkyCxMii7puBjS70PmQwfgz8GnibPJ9LlJB2fdA7Qyh0BFtJVOWn72x79lV9vS46taF1ZYPU64qz1wqW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210454; c=relaxed/simple;
	bh=OgrtvKdW6hHbfFL3Z5QqyEJtaKKz1c0spsbYTEWIApM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHL9XutwptbctTh4TeKqjfxgdRtwyq7SpDM06oP51JfDDC5DjBpba54hVABYNdgROxeKQ2nWsC91Aol+NzykxhiE6f6ZnJO4hr64h/tVfkcc7PXIZUZ+lwDKp8ovbOK+DC8ggHBRaLB+jFlD+NEM7nSBPKt2WnMX3/R3K6qzN+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YFdbsn17; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YFdbsn17"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q2yzikvxBitch/WE/XzY4P6IVqHEQubOAm9BFK3IPX0=; b=YFdbsn17w2z4V+CT7FPgQEEsu/
	VE4ar0H0DZxgvypexjbNzyq/5bQfSSW0N0gK1h2U7jkrRwR6JY56bxDoy4eAXbRmcivdeoEhW0RSK
	8b3rjYHGq3lyFgGDS7aYAfmTZCaCmMqnJQ4sfAQUPd45QcjD0vtAnkzbckg70rPhZRrSy0JXcpN+j
	Yk1StE1G6UtbOjmY/p0WhTcFN0QKaj0r2aLpWD8R1b//0op84G4VZftxaJmd12NipIgsiBRTyzT8F
	Iyq2eKcvU/HQFjs5VLZvETglCp2NErW2hcYrpsxU95eYdpMAx2o6Ulvx2VmEIIQU1UX2IPf2qaRu3
	XhF43ynw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WoW-00000001cFx-0c2a;
	Wed, 09 Apr 2025 14:54:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 50F253003FA; Wed,  9 Apr 2025 16:54:04 +0200 (CEST)
Date: Wed, 9 Apr 2025 16:54:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <20250409145404.GH9833@noisy.programming.kicks-ass.net>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
 <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
 <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
 <4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
 <xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>

On Mon, Apr 07, 2025 at 04:47:05PM -0700, Josh Poimboeuf wrote:
> I think Thomas, Peter and Steven are the experts here, but I'll give my
> limited understanding.
> 
> On Mon, Apr 07, 2025 at 10:00:54AM -0700, Paul E. McKenney wrote:
> > > cpu_init() is called from e.g.:
> > > asmlinkage void secondary_start_kernel(struct task_struct *task)
> > > OK should this also be noinstr? Or is that just implied because
> > > of asmlinkage?
> > >
> > > <linux/compiler_types.h> will resolve to:
> > > 
> > > #if defined(CC_USING_HOTPATCH)
> > > #define notrace                 __attribute__((hotpatch(0, 0)))
> > > #elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
> > > #define notrace                 __attribute__((patchable_function_entry(0, 0)))
> > > #else
> > > #define notrace                 __attribute__((__no_instrument_function__))
> > > #endif
> > > 
> > > which I read as three different ways of saying "don't patch here".
> > > 
> > > Which is confusingly similar or identical to what noinstr does, I do see that
> > > noinstr pushes the code to separate section but that in turn might
> > > be what __attribute__((__no_instrument_function__)) and
> > > friends does?
> > > 
> > > Are they equivalent?
> 
> noinstr is much broader than notrace.  No instrumentation of any kind
> (ftrace, kprobes, sanitizers, profilers, etc), in the prologue or body
> of the function or its callees, except for regions marked by
> instrumentation_{begin,end}().

Note that noinstr code goes into its own section and various probing
mechanisms (HW breakpoints, kprobes etc..) are explicitly excluded from
touching code in this section.

> noinstr is needed in early/late entry code before/after RCU transitions,
> as instrumentation code might depend on RCU.  Also, entry code tends to
> be sensitive and unable to handle random instrumentation code.

Not strictly RCU, but including RCU. Some of the early entry code might
not have a sane stack or anything much a 'C' environment relies on,
could even not have normal page-tables set up.

noinstr is very much an attempt to stretch the whole 'C-as-assember'
ethos. Only emit the code I write, don't play silly buggers.

Current noinstr usage is indeed interrupt/exception/syscall entry but
also idle loops. Various idle routines disable RCU (which then
prohibits tracing) but some go even further and dismantle much of what a
normal C environment would expect.

> I believe noinstr is not typically needed for boot code, at least for
> the primary CPU.  RCU isn't present yet, and many instrumentations might
> not yet be available.  Or their handlers can detect whether they've been
> initialized yet.  Or they're disabled in .init sections.
> 
> Whether noinstr is needed for *secondary* boot code, I don't know.  It
> may be dependent on the instrumentation implementations, e.g., whether
> they're enabled globally or per-CPU.  At least on x86, start_secondary()
> is notrace.  I don't know enough to say whether that's sufficient.

There might be a case for noinstr there, but as of yet, nobody went and
audited all that. Thus far, I've been the idiot doing all the auditing,
but I think I'll pass on this one for now :-)
