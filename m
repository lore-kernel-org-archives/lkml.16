Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A131D54EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045255; cv=none; b=tDEO/r5aOi7jzaAtIT/FoBVG70SwJYkHXAa8e1ExJzj5DEODwGPYKfajXu96CVpGV/B+c/YLXMX0+pNXDFBiOUnlOXI8BH0otDptC0MxnddmN7xPPvC3pAMAsHOrtoBijMxKB6XgHOfr5TGydzEBv0XZUBb2ItvFbDRruFjbFn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045255; c=relaxed/simple;
	bh=ulG/3ksGQhOb6YzURseStzy1EXvhbkyKTyfVCaK8SyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGda3diG2YJcgPw2yzQF7gUV4dviICdLIH4Z676OVHc6rJqcbZX4DnYzWP4OgOERCP5PfVfmRd0bfze62lZg9asGld1kjqlNBWA3D6Nq74brP6s92M64dJSs8Y7Py/Vdy5R9oWuUdv47xIUTqvbJCTbvkFpIB5GpxI/YQx0PwDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rl99jLRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rl99jLRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8695DC4CEE7;
	Mon,  7 Apr 2025 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744045254;
	bh=ulG/3ksGQhOb6YzURseStzy1EXvhbkyKTyfVCaK8SyI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Rl99jLRXVvyQYdmBMGBK9z1gdjO2frTv9eX6gSEEGwkjjbnqvl+fHkv6tbaZnukN9
	 D9bCJVnjq0AvSCN0Aq4xHHMG7pSeX5GuwskelskKNxuu6Zpp1FL0fW5If9kth3MMI+
	 bqfmkhJ7oYxjvHhNGxmWI54LgNYjRrNvI5ZgG/bD0orzRO3ZMS76Qf8O4LpHuVvKP4
	 q7U7c4/bnNsFhpS1uwEObZoiSHzB6Z60TAiCJEHMA++f3XCr60vEb1QItdWA8bHc7o
	 MQzTnAnnxBjcVUCe4Lx1Z/nGhwceLpCt20+OgEIuvl7fvd61dcZc4fn7rkK+6HCG0E
	 hLjD452BLHr7A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 35B4DCE089F; Mon,  7 Apr 2025 10:00:54 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:00:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org,
	jpoimboe@kernel.org, peterz@infradead.org
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <4157fe23-8be8-4fd1-a69a-c59383b9516d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
 <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
 <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaYQx8gBnkjW0zy=-FNS-P+TtjXoNBsBR2D4FTWo28R1Q@mail.gmail.com>

On Mon, Mar 31, 2025 at 11:48:40PM +0200, Linus Walleij wrote:
> On Wed, Mar 12, 2025 at 7:00 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> 
> > Once you are confident that you have all the needed "noinstr"
> > and "__always_inline" instances in place, could you please add
> > ARCH_WANTS_NO_INSTR to the list of "select" clauses for "config ARM"
> > in arch/arm/Kconfig?
> 
> I would love to do that, I'm just not sure what this really entails.

I freely confess that I have only seen this done, not done it myself.

> Surely this patchset tags a noinstr on every entry point from
> exceptions and syscall software interrupts.
> Documentation/core-api/entry.rst is pretty good at explaining this.
> 
> But what makes me uncertain are things that are tagged
> "notrace", such as void notrace cpu_init(void) - surely we
> don't trace, but should that be "noinstr"? It's even marked
> "notrace" but not "noinstr" in arm64.

I know that __always_inline does the trick, but I am not sure about
notrace (my guess is "no" on notrace).  I added the objtool maintainers
on CC.

No argument on the usefulness of documentation.  ;-)

							Thanx, Paul

> cpu_init() is called from e.g.:
> asmlinkage void secondary_start_kernel(struct task_struct *task)
> OK should this also be noinstr? Or is that just implied because
> of asmlinkage?
> 
> <linux/compiler_types.h> will resolve to:
> 
> #if defined(CC_USING_HOTPATCH)
> #define notrace                 __attribute__((hotpatch(0, 0)))
> #elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
> #define notrace                 __attribute__((patchable_function_entry(0, 0)))
> #else
> #define notrace                 __attribute__((__no_instrument_function__))
> #endif
> 
> which I read as three different ways of saying "don't patch here".
> 
> Which is confusingly similar or identical to what noinstr does, I do see that
> noinstr pushes the code to separate section but that in turn might
> be what __attribute__((__no_instrument_function__)) and
> friends does?
> 
> Are they equivalent?
> 
> sched_clock_noinstr() is tagged noinstr and sched_clock() is
> tagged notrace, so there must be a difference here.
> 
> secondary_start_kernel() is tagged "notrace" on arm64 but
> not on arm, should it be tagged "noinstr" or "notrace"?
> 
> This kind of stuff makes me uncertain about how this is to be
> done. A "noinstr vs notrace" section in Documentation/core-api/entry.rst
> would help a lot I think!
> 
> Yours,
> Linus Walleij
