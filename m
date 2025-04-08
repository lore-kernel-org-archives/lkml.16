Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C2360
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744071216; cv=none; b=pbtHcTC25Eze5bnRmorAVeG8RbRdCzchTb06hfNj39754LCWO+sioIv7P/fDwxAyU66kFDvDYHCdGJXwE3qBkw7E0sqNRxGR8s4yYVin8SIEIJIt88nWH/H9ztQ60F/BE7SG4JGbdtdhXlQaCjFdvPfzeigHRvG+jlpNN5fEd+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744071216; c=relaxed/simple;
	bh=sLe2pwxNBGHnOjNQ6kRXwxeDWgrAF6CVi6iutseRCmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qlt39EntloXG6lg61TZa7daT5/HWwL9R/SBEa+IrS5BoQhAnrkxIeAD2lMKmsYDp5lhqEB9pH9kbBd5c0Cf48deGYvj/E8nS0HUJR1lFP1RtHyB0uD+QnT4mrxkWQovK2sJvRHD1wCoyVFWKBG0b3fXNT+SLzlXOeCEdcA8w8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D6AC4CEDD;
	Tue,  8 Apr 2025 00:13:35 +0000 (UTC)
Date: Mon, 7 Apr 2025 20:14:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann
 <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel
 <linux-kernel@vger.kernel.org>, frederic@kernel.org, peterz@infradead.org
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <20250407201450.5acc83e3@gandalf.local.home>
In-Reply-To: <xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
	<1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
	<CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
	<4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
	<xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Apr 2025 16:47:05 -0700
Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> noinstr is much broader than notrace.  No instrumentation of any kind
> (ftrace, kprobes, sanitizers, profilers, etc), in the prologue or body
> of the function or its callees, except for regions marked by
> instrumentation_{begin,end}().
>=20
> noinstr is needed in early/late entry code before/after RCU transitions,
> as instrumentation code might depend on RCU.  Also, entry code tends to
> be sensitive and unable to handle random instrumentation code.

=46rom my understanding, noinstr is usually used in context switching code.
That is, switching from user to kernel and back. It's highly sensitive
and I believe there's CPU helpers that will prevent random code from
happening here (I'm guessing at this, but from the strictness they have
about not doing any instrumentation and how things will break if you do, I
feel that there's going to be a hardware enforcement here, if it's not
already there).

>=20
> notrace is more narrow, it just means "no function tracing".  It's used
> by tracing code and the functions it calls.  It's also used for early
> boot code, as ftrace can be enabled on the kernel cmdline.

Right, notrace is basically code that doesn't make sense to trace. Like the
function tracing code itself. Also clocks that the function tracing uses.
You really don't want the clocks being traced as they are used by the
function tracer. Now that we have ftrace_test_recursion_trylock(), it
doesn't crash like it use to. But recursion does cause overhead.

Note, I've been thinking of letting some of the tracing code be traced.
Like the access to files and such. Just because there's been times I want
to know what code is actually being called there (like when I set up a new
histogram!).

>=20
> I believe noinstr is not typically needed for boot code, at least for
> the primary CPU.  RCU isn't present yet, and many instrumentations might
> not yet be available.  Or their handlers can detect whether they've been
> initialized yet.  Or they're disabled in .init sections.
>=20
> Whether noinstr is needed for *secondary* boot code, I don't know.  It
> may be dependent on the instrumentation implementations, e.g., whether
> they're enabled globally or per-CPU.  At least on x86, start_secondary()
> is notrace.  I don't know enough to say whether that's sufficient.

Not sure, as there's really no context switch at this time. But Peter and
Thomas would know better than I here (continuing to pass the buck!).

>=20
> > > sched_clock_noinstr() is tagged noinstr and sched_clock() is
> > > tagged notrace, so there must be a difference here.

sched_clock() is using in tracing. If it wasn't tagged notrace, the
function tracer would be recursing on it.

The noinstr looks like it was created just because some archs call
sched_clock in noinstr code?

> > >=20
> > > secondary_start_kernel() is tagged "notrace" on arm64 but
> > > not on arm, should it be tagged "noinstr" or "notrace"?

According to commit b154886f78924:

    arm64: make secondary_start_kernel() notrace
   =20
    We can't call function trace hook before setup percpu offset.
    When entering secondary_start_kernel(), percpu offset has not
    been initialized.  So this lead hotplug malfunction.
    Here is the flow to reproduce this bug:
   =20
    echo 0 > /sys/devices/system/cpu/cpu1/online
    echo function > /sys/kernel/debug/tracing/current_tracer
    echo 1 > /sys/kernel/debug/tracing/tracing_on
    echo 1 > /sys/devices/system/cpu/cpu1/online

If other archs crash when doing the above, then sure. Label it notrace ;-)


> > >=20
> > > This kind of stuff makes me uncertain about how this is to be
> > > done. A "noinstr vs notrace" section in Documentation/core-api/entry.=
rst
> > > would help a lot I think! =20
>=20
> Sounds like a good idea.  We just need a volunteer :-)
>=20

Agreed (but not me!)

-- Steve
