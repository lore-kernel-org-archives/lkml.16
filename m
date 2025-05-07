Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8375219AD5C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634981; cv=none; b=qDCvDShvTUmC9MqSm/tNNqTHfgduxw9gHBLzOCsh36WK4kvTqm8X/InPXEYxkA3mxA6uUwL5qmU3h7VTlc5zmjIMoP6Rh/Rq9UhbUtqepckD0WYbi69dYJVPwweGhygT7y7AO6TDoBdL7ZYui9/oX30ZvuisJ5cvZuy0rLqx/L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634981; c=relaxed/simple;
	bh=Ol2/vY77MjaTU3wvjpzVZP9L+fNJkq5zxkYL/AYyCVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foAKzsAaIus5JVUlTQW9irkXFrcsTYJxcwy4/UrU2QrxeKFY+CYPOPfUL8gSwDNaKbhmUR5M+n7VH0kbf1kJWmOBTMNIwZ4HLwNFuJzFfMNpzkSl0c70LTSuOiLZHiUx8CFaKUzH7y76KFKVk2dm9/x65o5t6e5xu1KxiJTlp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fnl0Zr7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fnl0Zr7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E63DC4CEE2;
	Wed,  7 May 2025 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746634981;
	bh=Ol2/vY77MjaTU3wvjpzVZP9L+fNJkq5zxkYL/AYyCVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fnl0Zr7ay/Tu/dN0Ab8/WMC7OTuXzD0T6qALw5E/IT/5sjHXpioZE9UaVUxkaEE8w
	 0OWT0q4JohtuWQtNPZ1CBGoPcrVX7oPUw0eOlq2V7SJYiQ3hsVqIwCEww5bAfnXcP4
	 lebX9jGOeZJNbPLepIBOzkdE0e4tbye3xMbLzlIHDPyrR9SsH4Te6zHmXKqq4oCRVa
	 /lWDIip8eeUqhDzfXmk8XIGCDs4TKvdREcSaWw8/Ww+ImCPo7PJiDlX6vzdJpoqYOe
	 mf7+0jJ0MuslvG0HH3gT3ZVBnPzorIOIuXARYL8qbAQobtiBgX+617bTmSYeue/Y8Q
	 oZIcbcLQ4p6RQ==
Date: Wed, 7 May 2025 18:22:55 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, ardb@kernel.org, arnd@arndb.de,
	bp@alien8.de, dwmw@amazon.co.uk, hpa@zytor.com,
	linux-kernel@vger.kernel.org, michal.lkml@markovi.net,
	tglx@linutronix.de, torvalds@linux-foundation.org,
	vkuznets@redhat.com, yamada.masahiro@socionext.com
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
Message-ID: <aBuI36FCDbj20x28@gmail.com>
References: <20250506170924.3513161-14-mingo@kernel.org>
 <9b31f1df-7dc6-468b-9418-0b13239df8bc@gmail.com>
 <aBsGXCKX8-2_Cn9x@gmail.com>
 <CALOAHbDGSpDnzQ7AKiMci0708DwYr8gmruVGdJZ_Nt9rmnbxNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbDGSpDnzQ7AKiMci0708DwYr8gmruVGdJZ_Nt9rmnbxNg@mail.gmail.com>


* Yafang Shao <laoar.shao@gmail.com> wrote:

> On Wed, May 7, 2025 at 3:06 PM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Yafang Shao <laoar.shao@gmail.com> wrote:
> >
> > > Hello Mingo,
> > >
> > > > +CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
> > > > +CONFIG_IRQ_TIME_ACCOUNTING=y
> > >
> > > Enabling CONFIG_IRQ_TIME_ACCOUNTING=y can lead to user-visible behavioral
> > > changes. For more context, please refer to the related discussion here:
> > > https://lore.kernel.org/all/20241222024734.63894-1-laoar.shao@gmail.com/ .
> >
> > Yeah. I actually agree with your series. It (re-)includes IRQ/softirq
> > time in task CPU usage statistics even under IRQ_TIME_ACCOUNTING=y,
> > while still keeping the finegrained IRQ/softirq statistics as well,
> > correct?
> 
> Correct.
> 
> >
> > The Kconfig option is also arguably rather misleading:
> >
> > config IRQ_TIME_ACCOUNTING
> >         bool "Fine granularity task level IRQ time accounting"
> >         depends on HAVE_IRQ_TIME_ACCOUNTING && !VIRT_CPU_ACCOUNTING_NATIVE
> >         help
> >           Select this option to enable fine granularity task irq time
> >           accounting. This is done by reading a timestamp on each
> >           transitions between softirq and hardirq state, so there can be a
> >           small performance impact.
> >
> > It only warns about a small performance impact, but doesn't warn that
> > CPU accounting is changed in an incompatible fashion that surprises
> > tooling...
> 
> Yes, this breaks our userspace tools.

Okay, so 2 out of your 3 fixes are upstream already:

  763a744e24a8 ("sched: Don't account irq time if sched_clock_irqtime is disabled")
  a6fd16148fdd ("sched, psi: Don't account irq time if sched_clock_irqtime is disabled")

But we don't have this one yet:

  [PATCH v8 4/4] sched: Fix cgroup irq time for CONFIG_IRQ_TIME_ACCOUNTING

  https://lore.kernel.org/r/20250103022409.2544-5-laoar.shao@gmail.com

which is also essential to fully fix the tooling regression, right?

I think this last patch fell between the cracks, I didn't see any 
fundamental objections against the fix.

Since the patch does not apply cleanly anymore, mind sending a fresh 
-v9 version against v6.15-rc5 or so?

Thanks,

	Ingo
