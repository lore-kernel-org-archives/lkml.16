Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42171586C8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069629; cv=none; b=c3Sd87MMKmwU8cLGmT5dXmqqEgEzjFIYEvu3v5lzmvCNCKJbNDgqzHa9ViShDB1wo81BkCvvZCRxeWv96MadNof0fmeiC9wX8ViMzIIhGlhJSqKjIOEkn3kLtcR92/N2lYoduUv7zl2b1XzPtfIeJviZ9nhxEHvvB6Nf7Ze/384=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069629; c=relaxed/simple;
	bh=AbvE5c3dYOD/66rM6cge3IeNI23tpIjwleY3jYySq/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqYSr7E+eqMytDWBrAI4jbL/bUUVWPELqI51nOO3e/1kFLWDA+YojPSmU8Ap8BzpIDeV4h1kvrboP1CThTUuy9T177KN93X4PZbGvQHmIs8SK/qt3VWhO+H4pgmY/jk7Tar/bU+VGFPhQO6V57SH2+JVIyikx/hZNAmZoSy7z+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5FmmgjY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5FmmgjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A341EC4CEDD;
	Mon,  7 Apr 2025 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069628;
	bh=AbvE5c3dYOD/66rM6cge3IeNI23tpIjwleY3jYySq/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5FmmgjYX0Wp/zR9Chhk/bN8lqvJSMCjSQQc2oasdA8P6Lx8tjG5gvtYRaxIrNgC1
	 WiW7mwXr0tmjQ/Boefr8RnntsfTW/TsVjJfHAu3EKk481Cgn+ZFpUW2rudQz8jBL1R
	 DfqSGEVXfaTVdtjs35TDcpovdiNtsUBe7rPnruk6LuYfhIMskolSNlxMBMuxj0bZGE
	 yC4jNECJ+8Wul+M3B0e1Jv4wAP6ybI/k44OB4WO4zkzPZqKvf7lRNtip+8QdqzbxcB
	 a9HS1942e94FNK4qd92U2E41Ty1aVwTQG76/2osS4G7R8K2Rbl2MKVo3Bo8ng6zSRy
	 gi62TvkChc7Tg==
Date: Mon, 7 Apr 2025 16:47:05 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org, peterz@infradead.org, 
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <xgj3in4cuy3k2phafttxb4cwz6rn6vuj5tvwjioqbrl4hxivkt@wkr5pi6zfrv7>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
 <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
 <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
 <4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>

I think Thomas, Peter and Steven are the experts here, but I'll give my
limited understanding.

On Mon, Apr 07, 2025 at 10:00:54AM -0700, Paul E. McKenney wrote:
> > cpu_init() is called from e.g.:
> > asmlinkage void secondary_start_kernel(struct task_struct *task)
> > OK should this also be noinstr? Or is that just implied because
> > of asmlinkage?
> >
> > <linux/compiler_types.h> will resolve to:
> > 
> > #if defined(CC_USING_HOTPATCH)
> > #define notrace                 __attribute__((hotpatch(0, 0)))
> > #elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
> > #define notrace                 __attribute__((patchable_function_entry(0, 0)))
> > #else
> > #define notrace                 __attribute__((__no_instrument_function__))
> > #endif
> > 
> > which I read as three different ways of saying "don't patch here".
> > 
> > Which is confusingly similar or identical to what noinstr does, I do see that
> > noinstr pushes the code to separate section but that in turn might
> > be what __attribute__((__no_instrument_function__)) and
> > friends does?
> > 
> > Are they equivalent?

noinstr is much broader than notrace.  No instrumentation of any kind
(ftrace, kprobes, sanitizers, profilers, etc), in the prologue or body
of the function or its callees, except for regions marked by
instrumentation_{begin,end}().

noinstr is needed in early/late entry code before/after RCU transitions,
as instrumentation code might depend on RCU.  Also, entry code tends to
be sensitive and unable to handle random instrumentation code.

notrace is more narrow, it just means "no function tracing".  It's used
by tracing code and the functions it calls.  It's also used for early
boot code, as ftrace can be enabled on the kernel cmdline.

I believe noinstr is not typically needed for boot code, at least for
the primary CPU.  RCU isn't present yet, and many instrumentations might
not yet be available.  Or their handlers can detect whether they've been
initialized yet.  Or they're disabled in .init sections.

Whether noinstr is needed for *secondary* boot code, I don't know.  It
may be dependent on the instrumentation implementations, e.g., whether
they're enabled globally or per-CPU.  At least on x86, start_secondary()
is notrace.  I don't know enough to say whether that's sufficient.

> > sched_clock_noinstr() is tagged noinstr and sched_clock() is
> > tagged notrace, so there must be a difference here.
> > 
> > secondary_start_kernel() is tagged "notrace" on arm64 but
> > not on arm, should it be tagged "noinstr" or "notrace"?
> > 
> > This kind of stuff makes me uncertain about how this is to be
> > done. A "noinstr vs notrace" section in Documentation/core-api/entry.rst
> > would help a lot I think!

Sounds like a good idea.  We just need a volunteer :-)

-- 
Josh
