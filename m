Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D84B67F;
	Mon,  9 Jun 2025 04:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749442912; cv=none; b=ixU+VKauMh8fPAOIgJFLeewmGQq05x5j2okhmotsK2+2yZfimqiROZjFne/OXaNE1ZIgce3LkuKkJlczEWmfAzbOHcBXjDf5cZabwir7101xKPHSXrCctw2O5MdPP5DfiSmKtGH2uZyLyp0B48kVfaDTjhNbXZk53fsBcGO12A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749442912; c=relaxed/simple;
	bh=jS0cEzQw8X9ASmmTWmyjGvXq7CYOImtqUSmMlKYOQ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqTIPNWIEVQrD0ydZtnUtOZAP2/FhTdJxlU+/Gm9e8GOhRzZGI2G9fxqmiIJPTEGg3QaATYH+vS6Do3cqCP+oK/VRlZsL1TSETmB61Sg611f8BwUd8IxvVqP/IKHuzjCgeVKYKvg+zME766KdeDbRKVgWQZEvCx0CkCG3yCFdaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=wpF99Ev9; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=zbaw+kg3; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="wpF99Ev9";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="zbaw+kg3"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 7995812FB41C;
	Sun, 08 Jun 2025 21:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1749442908; bh=jS0cEzQw8X9ASmmTWmyjGvXq7CYOImtqUSmMlKYOQ7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wpF99Ev9a1i3kYzbIH8xr9WdebuCDfK5QA0LVjIOfyUqwwfetuWYZf1d4C2miIIbt
	 vwI0K65ufIRSKKDBuEDxTmDYJ/f7xqPrfZJxQ491KFwC5LJ1TeaBaxUXGYB180MWTb
	 /SDBJCEWCFz49iIyzlGuHieYs+YvOlTzDR4ivA2TjsNtYdwXSkhJ1DaeAfjm82FM16
	 SqS67RH0O3eBwbpUjwk0ieSrnIwiAB2no+uHSoekILYWJa3ScUJTaCxz/M+uJUOvvM
	 ztlKorjuRtkLdXQJwjzGA0AR3NFFlkyw/H3KRofWxs5owqTmvqxJaYOzZuzEfaW9Ab
	 dD0y0aJuHVkhw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-z2SKhicKqm; Sun,  8 Jun 2025 21:21:45 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 1082D12FB401;
	Sun, 08 Jun 2025 21:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1749442905; bh=jS0cEzQw8X9ASmmTWmyjGvXq7CYOImtqUSmMlKYOQ7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zbaw+kg3PaM6bHrS+UWUsB27CpmMy8q0fPqD4qLEwRWvYm2ovPE8+PC0AcRKgVvMJ
	 HALTz+cSrlxDOrYDOlplmYc3qUovcSrjGtJcP5ubfO/X5IE1A6fah+Y13qeKBH1LZP
	 5d6xQKArlcgrC+uFnqEMCvkQVBa1Rlvvgychc+5hwt5B2JJ9s/LC916wU6Bqz0tBTP
	 /0lIGkjH3aUbEztmUtIRTkzvTtT5K9zArUEMIBEFb5HxCPNKYmd5/XA9Fj4WXvlvqq
	 foGBgGl0qLo7mOVvhs4CLgTja3MbhLYvdmxksv4IDPafiBWdM14FPMxV/EQ5zrlzp8
	 Qwi0l8o7HDkDw==
Date: Mon, 9 Jun 2025 04:21:39 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, inochiama@outlook.com,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <aEZhU5kk7pMnl7F9@ketchup>
References: <20250607202759.4180579-1-elder@riscstar.com>
 <20250608002453-GYA108101@gentoo>
 <52c27139-20aa-4995-b3b5-290df13f1ec9@riscstar.com>
 <aEUVwvKHCu4hr6xs@ketchup>
 <ef696db8-20ca-4710-b642-8d22263d4ffe@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef696db8-20ca-4710-b642-8d22263d4ffe@riscstar.com>

On Sun, Jun 08, 2025 at 01:31:42PM -0500, Alex Elder wrote:
> On 6/7/25 11:46 PM, Haylen Chu wrote:
> > On Sat, Jun 07, 2025 at 09:46:03PM -0500, Alex Elder wrote:
> 
> I respond below.  I'm leaving all the context for now.
> 
> > > On 6/7/25 7:24 PM, Yixun Lan wrote:
> > > > Hi Alex,
> > > > 
> > > > On 15:27 Sat 07 Jun     , Alex Elder wrote:
> > > > > The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> > > > > parent for numerous clocks.  Guodong Xu was recently testing DMA,
> > > >               ~~~~~~~~~this is still vague, numerous isn't equal to critical
> > > 
> > > I will give you a full explanation of what I observed, below.
> > > 
> > > > > adding a reset property, and discovered that the needed reset was
> > > > > not yet ready during initial probe.  It dropped its clock reference,
> > > > > which dropped parent references, and along the way it dropped the sole
> > > > > reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
> > > > > disabled, which resulted in a non-functioning system.
> > > > > 
> > > > So, I'm trying to understand the problem, and would like to evaluate if
> > > > the "critical" flag is necessary..
> > > > 
> > > > It occurs to me, the DMA driver should request and enable clock first,
> > > > then request and issue a reset, it probably could be solved by proper
> > > 
> > > No, that is not the issue.  The reset is never deasserted.
> > > 
> > > > order? so what's the real problem here? is DMA or reset? dropped the
> > > > clock? or does driver fail to request a reset before clock is ready?
> > > 
> > > The problem is with the pll1_d8 clock.  That clock is enabled
> > > successfully.  However the reset isn't ready, so the clock
> > > gets disabled, and its parent (and other ancestors) also get
> > > disabled while recovering from that.
> > > 
> > > I'll give you a high-level summary, then will lay out a ton of
> > > detail.
> > > 
> > > In the DMA driver probe function, several initial things happen
> > > and then, a clock is requested (enabled):
> > >    <&syscon_apmu CLK_DMA>
> > > That succeeds.
> > > 
> > > Next, a reset is requested:
> > >    <&syscon_apmu RESET_DMA>
> > > But that fails, because the reset driver probe function hasn't
> > > been called yet.  The request gets -EPROBE_DEFER as its result,
> > > and the DMA driver starts unwinding everything so that it can
> > > be probed again later.  Dropping the clock reference results
> > > in parent clocks dropping references.  And because pll1_div8
> > > initially had a reference count of 0 (despite being on),
> > > dropping this single reference means it gets disabled.  Then
> > > we're stuck.
> > > 
> > > 
> > > Here is how the DMA clock is supplied (at boot time):
> > > 
> > > pll1 -> pll1_d8 -> pll1_d8_307p2 -> pmua_aclk -> dma_clk
> > > 
> > > pll1 and pll1_d8 are enabled by the boot loader, but at this
> > > time the drivers for various hardware that require them aren't
> > > "getting" and enabling them (yet).
> > > 
> > > devm_clk_get_optional_enabled() causes clk_prepare_enable()
> > > to be called on the target clock (pll1_d8).  That simply calls
> > > clk_prepare() and clk_enable().  Let's focus on the latter.
> > >      clk_enable(dma_clk)
> > >        clk_core_enable_lock()
> > > 
> > > So now the clock enable lock is held.  The target clock's
> > > enable_count for pll1_d8 is 0.
> > > 
> > >    clk_core_enable(dma_clk)
> > >      clk_core_enable(parent = pmua_aclk)
> > >      ...
> > >      enable_count++ (on dma_clk)
> > > 
> > > The parent gets enabled (I'm fairly certain pmua_clk's
> > > enable_count is also 0).
> > > 
> > >    clk_core_enable(pmua_aclk)
> > >      clk_core_enable(parent = pll1_d8_307p2)
> > >      ...
> > >      enable_count++ (on pmua_clk)
> > > 
> > > And so on.  When the clk_enable(dma_clk) completes, we have
> > > these enable counts:
> > >    dma_clk:		1
> > >    pmua_clk:		1
> > >    pll1_d8_307p2:	1
> > >    pll1_d8:		1
> > >    pll1:			1? (I don't recall)
> > > 
> > > The -EPROBE_DEFER causes the  devm_clk_get_optional_enabled()
> > > for dma_clk to get undone.  That means clk_disable_unprepare()
> > > gets called on dma_clk.  Let's just focus on clk_disable().
> > > 
> > >    clk_disable(dma_clk)
> > >      clk_core_disable_lock(dma_clk)
> > >        (takes clk_enable lock)
> > >        clk_core_disable()
> > >          --enable_count becomes 0 (on dma_clk)
> > >          (disables dma_clk)
> > >          clk_core_disable(core->parent = pmua_aclk)
> > > 
> > >    clk_core_disable(pmua_aclk)
> > >      --enable_count becomes 0 (on pmua_clk)
> > >      (disables pmua_clk)
> > >      clk_core_dissable(core->parent = pll1_d8_307p2)
> > > 
> > >    clk_core_disable(pll1_d8_307p2)
> > >      --enable_count becomes 0 (on pll1_d8_307p2)
> > >      (disables pll1_d8_307p2)
> > >      clk_core_dissable(core->parent = pll1_d8)
> > > 
> > >    clk_core_disable(pll1_d8\)
> > >      --enable_count becomes 0 (on pll1)
> > >      (disables pll1_d8)
> > >      BOOM
> > 
> > Yeah, I got the reason that pll1_d8 is disabled, but I don't still
> > understand why it matters: pll1_d8 is a simple factor gate, though being
> > parent of various peripheral clocks, it's okay to enable it again later
> > if some peripherals decide to use it or one of its child, isn't it?
> 
> When it gets disabled, the system becomes non-functional.  What that
> means is that everything stops, no more output, and even when I
> enabled KDB it did not drop into KDB.  *Something* depends on it,
> but there is no driver that properly enables the clock (yet).
> This means--for now--it seems to be a critical clock.
> 
> > I could come up with several scenarios where disabling the clock really
> > causes problems,
> > 
> > 1. Some essential SoC components are actually supplied by pll1_d8 or one
> >     of its children, but isn't described in devicetree or the driver,
> >     thus disabling pll1_d8 leads to an SoC hang. We should mark the
> 
> This is what I believe is happening.  So my fix marks the one clock
> as critical in the driver.  I would not want to mark it critical
> in DT.

Okay. Then please make it more explicit in the commit message, "pll1_d8
seems to supply critical SoC components" describes the situation more
precisely than "Clock pll1_d8 got disabled, which resulted in a
non-functioning system".

> >     precise clock that being essential as critcal, instead of setting
> >     pll1_d8 as critical to work around the problem.
> 
> I provided the chain of clocks leading to the dma_clk.  Disabling
> the dma_clk did not cause harm; disabling pmua_aclk did not cause
> harm; disabling pll1_d8_307p2 did not cause harm.  Only when pll1_d8
> was disabled did the machine become unusable.

I don't think this is an evidence strong enough to prove pll1_d8 itself
is critical.

pll1_d8 supplies not only pll1_d8_307p2 and its children, but also
pll1_d16_153p6, pll1_d24_102p4 and many more. It's totally possible that
not pll1_d8 but actually pll1_d16_153p6 or pll1_d24_102p4 is critical
for SoC operation: in a normal functioning system with a working UART,
these two clocks are always enabled since they (indirectly) supply UART
bus and func clocks, hidding the problem.

In your case, when DMA driver reverts the enable operation, the UART
driver don't seem to be probed yet (or enable count of pll1_d8 won't
decrease to zero). Disabling the parent may cause an SoC hang as well if
pll1_d16_153p6 or pll1_d24_102p4 is critcal in fact.

> > 2. There're bugs in our clock driver, thus it fails to bring pll1_d8
> >     (or maybe also its children) back to a sound state. If so we should
> >     fix the driver.
> 
> No, I found that pll1_d8 had an enable count of 1 after dma_clk
> was enabled.  And then the set of disables that resulted from the
> -EPROBE_DEFER discovered its enable count was zero, and therefore
> disabled pll1_d8 (after dma_clk, pmua_aclk, and pll1_d8_307p2 were
> disabled).  I do not suspect the clock *driver* is at fault.

A correct enable count doesn't mean the hardware is configured
correctly.

> > Unless you could confirm pll1_d8 (not its child) really supplies some
> > essential SoC components, I don't think simply marking pll1_d8 as
> > critical is the correct solution.
> 
> I did confirm this.  The child gets disabled before the parent in
> clk_core_disable().
> 
> > And, I don't even know what "non-functioning system" behaves like. Could
> > you please provide more information, like soC behaviours or dmesg when
> > disabling pll1_d8 causes problems? Thanks.
> 
> Maybe you could, as an experiment, pretend <&syscon_apmu CLK_DMA>
> is a clock for something and get it during probe, using
> devm_clk_get_optional_enabled().  Then just return -EPROBE_DEFER
> after that, and I think you'll reproduce the issue.  In fact,
> you might hit the issue more quickly if you used CLK_PLL1_D8.
> 
> 					-Alex

Thanks,
Haylen Chu

> > > I hope this is clear.
> > > 
> > > 					-Alex
> > 
> > Regards,
> > Haylen Chu
> > 
> > > 
> > > > > Mark that clock critical so it doesn't get turned off in this case.
> > > > > We might be able to turn this flag off someday, but for now it
> > > > > resolves the problem Guodong encountered.
> > > > > 
> > > > > Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> > > > > be supplied for a CCU_FACTOR_GATE clock.
> > > > > 
> > > > > Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > > > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > > > Tested-by: Guodong Xu <guodong@riscstar.com>
> > > > > ---
> > > > >    drivers/clk/spacemit/ccu-k1.c  |  3 ++-
> > > > >    drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
> > > > >    2 files changed, 15 insertions(+), 9 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > > > > index cdde37a052353..df65009a07bb1 100644
> > > > > --- a/drivers/clk/spacemit/ccu-k1.c
> > > > > +++ b/drivers/clk/spacemit/ccu-k1.c
> > > > > @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
> > > > >    CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
> > > > >    CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
> > > > >    CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> > > > > -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> > > > > +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> > > > > +		CLK_IS_CRITICAL);
> > > > >    CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
> > > > >    CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
> > > > >    CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> > > > > diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> > > > > index 51d19f5d6aacb..668c8139339e1 100644
> > > > > --- a/drivers/clk/spacemit/ccu_mix.h
> > > > > +++ b/drivers/clk/spacemit/ccu_mix.h
> > > > > @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
> > > > >    	}									\
> > > > >    }
> > > > > +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> > > > > +			       _mul, _flags)					\
> > > > > +struct ccu_mix _name = {							\
> > > > > +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> > > > > +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> > > > > +	.common = {								\
> > > > > +		.reg_ctrl	= _reg_ctrl,					\
> > > > > +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
> > > > > +	}									\
> > > > > +}
> > > > > +
> > > > >    #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> > > > >    			       _mul)						\
> > > > > -static struct ccu_mix _name = {							\
> > > > > -	.gate	= CCU_GATE_INIT(_mask_gate),					\
> > > > > -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> > > > > -	.common = {								\
> > > > > -		.reg_ctrl	= _reg_ctrl,					\
> > > > > -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
> > > > > -	}									\
> > > > > -}
> > > > > +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> > > > > +			       _mul, 0)
> > > > >    #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
> > > > >    			    _mask_gate, _flags)					\
> > > > > -- 
> > > > > 2.45.2
> > > > > 
> > > > 
> > > 
> 
