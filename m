Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACD520AF62;
	Sun,  8 Jun 2025 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749387382; cv=none; b=KmmWIAYOM1B+FmW9Yxq73ZrtdoRO0M4/KUy3CUa/2vhdijvemUrmONbO+DZUQ7iS37RzZh8h8Nti0uTTMS3lYVQ3KfNw9nRFT+HDhoC310ncXMxPHq0WVmAL+CLPgAlFofbq3KPAhuI2f3K83ICrU8YHmXBCo2Qa33Lv4RmFi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749387382; c=relaxed/simple;
	bh=Go6x1BmcSqCSXvT/v/ESQsjuPTG5afKQKpXyC0pS3k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mm4seltMrCri6cW4W+J7/xPsKkHHF37cztn9cIo4yrj1X42/3frL1v1y3mTlDPP6GRPiObNF5dBTS5hhZazHD6p0pDsvgsz/kM5Bu+i+Au7zNuUR2p+tyCt45wfTauwCU/XfsxyRZNHGVu2iZYHWbmjcdiTKgP+Bm76jlQMt6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CAC07342FA2;
	Sun, 08 Jun 2025 12:56:19 +0000 (UTC)
Date: Sun, 8 Jun 2025 12:56:15 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
	sboyd@kernel.org, inochiama@outlook.com, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <20250608125615-GYB108101@gentoo>
References: <20250607202759.4180579-1-elder@riscstar.com>
 <20250608002453-GYA108101@gentoo>
 <52c27139-20aa-4995-b3b5-290df13f1ec9@riscstar.com>
 <aEUVwvKHCu4hr6xs@ketchup>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEUVwvKHCu4hr6xs@ketchup>

Hi Alex, Haylen,

On 04:46 Sun 08 Jun     , Haylen Chu wrote:
> On Sat, Jun 07, 2025 at 09:46:03PM -0500, Alex Elder wrote:
> > On 6/7/25 7:24 PM, Yixun Lan wrote:
> > > Hi Alex,
> > > 
> > > On 15:27 Sat 07 Jun     , Alex Elder wrote:
> > > > The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> > > > parent for numerous clocks.  Guodong Xu was recently testing DMA,
> > >              ~~~~~~~~~this is still vague, numerous isn't equal to critical
> > 
> > I will give you a full explanation of what I observed, below.
> > 
> > > > adding a reset property, and discovered that the needed reset was
> > > > not yet ready during initial probe.  It dropped its clock reference,
> > > > which dropped parent references, and along the way it dropped the sole
> > > > reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
> > > > disabled, which resulted in a non-functioning system.
> > > > 
> > > So, I'm trying to understand the problem, and would like to evaluate if
> > > the "critical" flag is necessary..
> > > 
> > > It occurs to me, the DMA driver should request and enable clock first,
> > > then request and issue a reset, it probably could be solved by proper
> > 
> > No, that is not the issue.  The reset is never deasserted.
> > 
> > > order? so what's the real problem here? is DMA or reset? dropped the
> > > clock? or does driver fail to request a reset before clock is ready?
> > 
> > The problem is with the pll1_d8 clock.  That clock is enabled
> > successfully.  However the reset isn't ready, so the clock
> > gets disabled, and its parent (and other ancestors) also get
> > disabled while recovering from that.
> > 
> > I'll give you a high-level summary, then will lay out a ton of
> > detail.
> > 
> > In the DMA driver probe function, several initial things happen
> > and then, a clock is requested (enabled):
> >   <&syscon_apmu CLK_DMA>
> > That succeeds.
> > 
> > Next, a reset is requested:
> >   <&syscon_apmu RESET_DMA>
> > But that fails, because the reset driver probe function hasn't
> > been called yet.  The request gets -EPROBE_DEFER as its result,
> > and the DMA driver starts unwinding everything so that it can
> > be probed again later.  Dropping the clock reference results
> > in parent clocks dropping references.  And because pll1_div8
> > initially had a reference count of 0 (despite being on),
> > dropping this single reference means it gets disabled.  Then
> > we're stuck.
> > 
> > 
> > Here is how the DMA clock is supplied (at boot time):
> > 
> > pll1 -> pll1_d8 -> pll1_d8_307p2 -> pmua_aclk -> dma_clk
> > 
> > pll1 and pll1_d8 are enabled by the boot loader, but at this
> > time the drivers for various hardware that require them aren't
> > "getting" and enabling them (yet).
> > 
> > devm_clk_get_optional_enabled() causes clk_prepare_enable()
> > to be called on the target clock (pll1_d8).  That simply calls
> > clk_prepare() and clk_enable().  Let's focus on the latter.
> >     clk_enable(dma_clk)
> >       clk_core_enable_lock()
> > 
> > So now the clock enable lock is held.  The target clock's
> > enable_count for pll1_d8 is 0.
> > 
> >   clk_core_enable(dma_clk)
> >     clk_core_enable(parent = pmua_aclk)
> >     ...
> >     enable_count++ (on dma_clk)
> > 
> > The parent gets enabled (I'm fairly certain pmua_clk's
> > enable_count is also 0).
> > 
> >   clk_core_enable(pmua_aclk)
> >     clk_core_enable(parent = pll1_d8_307p2)
> >     ...
> >     enable_count++ (on pmua_clk)
> > 
> > And so on.  When the clk_enable(dma_clk) completes, we have
> > these enable counts:
> >   dma_clk:		1
> >   pmua_clk:		1
> >   pll1_d8_307p2:	1
> >   pll1_d8:		1
> >   pll1:			1? (I don't recall)
> > 
> > The -EPROBE_DEFER causes the  devm_clk_get_optional_enabled()
> > for dma_clk to get undone.  That means clk_disable_unprepare()
> > gets called on dma_clk.  Let's just focus on clk_disable().
> > 
> >   clk_disable(dma_clk)
> >     clk_core_disable_lock(dma_clk)
> >       (takes clk_enable lock)
> >       clk_core_disable()
> >         --enable_count becomes 0 (on dma_clk)
> >         (disables dma_clk)
> >         clk_core_disable(core->parent = pmua_aclk)
> > 
> >   clk_core_disable(pmua_aclk)
> >     --enable_count becomes 0 (on pmua_clk)
> >     (disables pmua_clk)
> >     clk_core_dissable(core->parent = pll1_d8_307p2)
> > 
> >   clk_core_disable(pll1_d8_307p2)
> >     --enable_count becomes 0 (on pll1_d8_307p2)
> >     (disables pll1_d8_307p2)
> >     clk_core_dissable(core->parent = pll1_d8)
> > 
> >   clk_core_disable(pll1_d8\)
> >     --enable_count becomes 0 (on pll1)
> >     (disables pll1_d8)
> >     BOOM
> 
> Yeah, I got the reason that pll1_d8 is disabled, but I don't still
> understand why it matters: pll1_d8 is a simple factor gate, though being
> parent of various peripheral clocks, it's okay to enable it again later
> if some peripherals decide to use it or one of its child, isn't it?
> 
> I could come up with several scenarios where disabling the clock really
> causes problems,
> 
> 1. Some essential SoC components are actually supplied by pll1_d8 or one
>    of its children, but isn't described in devicetree or the driver,
>    thus disabling pll1_d8 leads to an SoC hang. We should mark the
>    precise clock that being essential as critcal, instead of setting
>    pll1_d8 as critical to work around the problem.

I second Haylen's suggestion here, instead of marking pll1_d8 as critical,
we should find out which is the precise clock, or if turns out pll1_d8
must be provided for some essential SoC/CPU/or Bus, then fine by me

> 2. There're bugs in our clock driver, thus it fails to bring pll1_d8
>    (or maybe also its children) back to a sound state. If so we should
>    fix the driver.
> 
> Unless you could confirm pll1_d8 (not its child) really supplies some
> essential SoC components, I don't think simply marking pll1_d8 as
> critical is the correct solution.
> 
right

> And, I don't even know what "non-functioning system" behaves like. Could
> you please provide more information, like soC behaviours or dmesg when
> disabling pll1_d8 causes problems? Thanks.
It could be likely the system just hang without any output.. maybe bus hang
or something like that.. It would be great to poke vendor to get info
from high topology level..

> 
> > I hope this is clear.
> > 
> > 					-Alex
> 
> Regards,
> Haylen Chu
> 
> > 

-- 
Yixun Lan (dlan)
