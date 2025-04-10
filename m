Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B52040A8;
	Thu, 10 Apr 2025 06:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268101; cv=none; b=K73YnaQS0y1gdGtoutAjlZW7hzdQblUogBf34vOV/BXEkjTl2a7kgs7RmxI6KtIlb6Ti7JQmO5NGydazkW52R0gNO3Rgrocl13I8pOqtFqleUBbG78usMKd/ObVFp4fWyv6qDbDooNv7l6FMCn7GAYK1qP/jD/o4RMcafiVCqzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268101; c=relaxed/simple;
	bh=HUIAPAT3dmn4Ct98CAcjc3KkRq+veQyAM3y3S2Ak8oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJZAb1mi0pdkmrqHvk1LAopCYDNT3RX91+WDPz7WUcOl8QLKCtdoLI18nWgzK661o8o0ukQypWQpfV1BfOl57PaO2y99OjgYS7KKUguV7/42kQkPgvIELxcJI/Uv5yeKxa9xc6Cl/dV0NFYiMagTC8BlFRAJusLFyMDbZFWw/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=JDggdZkf; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=cQpxRFnV; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="JDggdZkf";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="cQpxRFnV"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 912A512FB450;
	Wed, 09 Apr 2025 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744268097; bh=HUIAPAT3dmn4Ct98CAcjc3KkRq+veQyAM3y3S2Ak8oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDggdZkfysJ4KqXSWbIEkiLPCmktGskkGl7l/QyxPtA1NCS1LYpQZ7EHy8ZpqqMJg
	 KB3oXt8QgUlsMyO3eg0BtIiKtVY4/5UNI186q+tIo2/MN5F4bPGqR8RP53VHOHxOcL
	 Tn8+iq1DJf0n8RYD63nht/VXy8s0FzqC46z/87OW+DIBSzDxYxI3bEftClgprLSdBE
	 aKDA1GA12USoqgW2UNNnYwATSFtJYH/Fax8PTk235vdYnsaGXpDWgCj6cERliY8IiI
	 VNnZYSLWffm3IxNH5XJBhf9bT7WacrZkG9dAWIhSnJD5ZUZfBL6gGJFJ5h1GRtS7Hy
	 LtfkYJGC7YccA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEo3DGS71jgD; Wed,  9 Apr 2025 23:54:56 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 2E9B612FB430;
	Wed, 09 Apr 2025 23:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744268095; bh=HUIAPAT3dmn4Ct98CAcjc3KkRq+veQyAM3y3S2Ak8oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQpxRFnVGP23jB7Rb3sQeMaDbkAFOWS2SGdzYhpRp135JZfnv06xy0F8Xu3w2eUBI
	 vLy/EgMMWKz3WkvabeFiIjsOAL5u0KtBh97wS2nQSrgn7UONXjk79XgWn3g6+FblzA
	 9PWVYsq2AyikV27CC7wid+Vp+Azo2PU5MckNkUDtlGa8qtVG1omES5EEYHMXsl3nFX
	 H3ZNtGLw9gh27+elenDkmMdnG2CS0XwoJKwdKMxDwb4WIxJHD9w40FvTYTgF6jHdx6
	 CVms+8lvuhrwngOiUT0wz5unMu+wGbH/IIX6M+hTCLVi59rQDFI2V1RxZwk4lhnhPZ
	 zHKF2BjmKBa3Q==
Date: Thu, 10 Apr 2025 06:54:47 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <Z_drN1MM-Fi7pM4Q@ketchup>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>

On Tue, Apr 08, 2025 at 02:37:23PM -0500, Alex Elder wrote:
> On 4/1/25 12:24 PM, Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> I have a few more comments here but I think this is getting very
> close to ready.  You addressed pretty much everything I mentioned.
> 
> > ---
> >   drivers/clk/Kconfig               |    1 +
> >   drivers/clk/Makefile              |    1 +
> >   drivers/clk/spacemit/Kconfig      |   18 +
> >   drivers/clk/spacemit/Makefile     |    5 +
> >   drivers/clk/spacemit/apbc_clks    |  100 +++
> >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> >   drivers/clk/spacemit/ccu_common.h |   48 ++
> >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> >   13 files changed, 2348 insertions(+)
> >   create mode 100644 drivers/clk/spacemit/Kconfig
> >   create mode 100644 drivers/clk/spacemit/Makefile
> >   create mode 100644 drivers/clk/spacemit/apbc_clks
> >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 

...

> > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > new file mode 100644
> > index 000000000000..4c4df845b3cb
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/Kconfig
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config SPACEMIT_CCU
> > +	tristate "Clock support for SpacemiT SoCs"
> 
> I don't know the answer to this, but...  Should this be a Boolean
> rather than tristate?  Can a SpacemiT K1 SoC function without the
> clock driver built in to the kernel?
> 

As mentioned in the other reply, modules in initramfs are a solution.
I'd like to give the user rights to shrink their kernel image, thus
prefer to keep our driver buildable as a module.

> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	select MFD_SYSCON
> > +	help
> > +	  Say Y to enable clock controller unit support for SpacemiT SoCs.
> > +
> > +if SPACEMIT_CCU
> > +
> > +config SPACEMIT_K1_CCU
> > +	tristate "Support for SpacemiT K1 SoC"
> 
> If you decide SPACEMIT_CCU needs to be Boolean, this one should
> be Boolean too.
> 
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	help
> > +	  Support for clock controller unit in SpacemiT K1 SoC.
> > +
> > +endif

...

> > --- /dev/null
> > +++ b/drivers/clk/spacemit/apbc_clks
> 
> This entire file seems to be an accidental addition.

Definitely. I'll remove it in v7.

> > @@ -0,0 +1,100 @@
> > +		[CLK_UART0]		= &uart0_clk.common.hw,
> > +		[CLK_UART2]		= &uart2_clk.common.hw,
> > +		[CLK_UART3]		= &uart3_clk.common.hw,
> > +		[CLK_UART4]		= &uart4_clk.common.hw,
> > +		[CLK_UART5]		= &uart5_clk.common.hw,
> > +		[CLK_UART6]		= &uart6_clk.common.hw,
> 
> . . .
> 
> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > new file mode 100644
> > index 000000000000..cd95c4f9c127
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> > @@ -0,0 +1,1316 @@

...

> > +/* APBS clocks start, APBS region contains and only contains all PLL clocks */
> > +
> > +/* Frequency of pll{1,2} must not be updated at runtime */
> > +static const struct ccu_pll_rate_tbl pll1_rate_tbl[] = {
> > +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> > +};
> > +
> > +static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
> 
> You have added new rates to this PLL table.  But you still
> say above that the rate for PLL2 cannot be updated at runtime.
> It's slightly confusing.

As now we have a codepath to adjust PLLs running at unknown rates
to a known state, the extra entries don't really matter. So it could be
removed.

PLL1 and PLL2 are both required to run at fixed frequencies to provide
the exact clock frequency for the peripherals. Technically the frequency
could be alternated as long as the PLL is disabled before changing the
rate. So I'd like to correct the comment as well,

  /*
   * PLL{1,2} must run at fixed frequencies to provide clocks in correct
   * rates for peripherals.
   */

> (By the way, I am pretty sure I've stopped seeing the WARN()
> call.  I'm sorry I haven't gotten back to you with more
> details on that.  I'll try that when I'm done with this
> review.)

It's nice to hear that my fixes work.

> > +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> > +	CCU_PLL_RATE(2800000000UL, 0x0050dd66, 0x3a155555),
> > +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
> > +	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
> > +};
> > +
> > +static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
> 
> You added more rates to this table too.  You should call attention
> to things like that, when things have changed between versions of
> your patches.  (If you did, I missed it.)

I've mentioned it in the cover letter :)

> - synchronize PLL configuration entries with the vendor kernel

> 
> > +	CCU_PLL_RATE(1600000000UL, 0x0050cd61, 0x43eaaaab),
> > +	CCU_PLL_RATE(1800000000UL, 0x0050cd61, 0x4b000000),
> > +	CCU_PLL_RATE(2000000000UL, 0x0050dd62, 0x2aeaaaab),
> > +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> > +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
> > +	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
> > +};
> > +
> > +CCU_PLL_DEFINE(pll1, pll1_rate_tbl, APBS_PLL1_SWCR1, APBS_PLL1_SWCR3, MPMU_POSR,
> > +	       POSR_PLL1_LOCK, CLK_SET_RATE_GATE);
> > +CCU_PLL_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR3, MPMU_POSR,
> > +	       POSR_PLL2_LOCK, CLK_SET_RATE_GATE);
> > +CCU_PLL_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR3, MPMU_POSR,
> > +	       POSR_PLL3_LOCK, CLK_SET_RATE_GATE);
> > +
> 
> I suspect Yixun would like you to have lines like the next one be
> 84 characters wide--slighly wider than the 80 column limit.
> 
> I'm not going to ask you to change it (but he might).

Okay, I'm willing to take the style changes in v7 anyway.

...

> > +
> > +struct spacemit_ccu_data {
> > +	struct clk_hw **hws;
> > +	size_t num;
> > +};
> 
> The above structure type ought to be defined nearer to top
> of the source file.  (I move it in my reset series, but I
> won't have to if you do.)  I make another suggestion about
> this type below.

I thought it helps to have the definition near the place where the first
time it's used. But if you consider it's better to place definitions of
all datatypes at first, I'm willing to follow.

...

> > +static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> > +	.hws	= k1_ccu_apmu_hws,
> > +	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
> > +};
> > +
> > +static int spacemit_ccu_register(struct device *dev,
> > +				 struct regmap *regmap, struct regmap *lock_regmap,
> 
> Since you're splitting the arguments across 3 lines, I'd
> just put each one on its own line.  (Personal preference.)

This looks better to me as well. Will take it.

> > +				 const struct spacemit_ccu_data *data)
> > +{
> > +	struct clk_hw_onecell_data *clk_data;
> > +	int i, ret;
> > +
> > +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> > +				GFP_KERNEL);
> > +	if (!clk_data)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < data->num; i++) {
> > +		struct clk_hw *hw = data->hws[i];
> > +		struct ccu_common *common;
> > +		const char *name;
> > +
> > +		if (!hw) {
> > +			clk_data->hws[i] = ERR_PTR(-ENOENT);
> > +			continue;
> > +		}
> > +
> > +		name = hw->init->name;
> > +
> > +		common = hw_to_ccu_common(hw);
> > +		common->regmap		= regmap;
> > +		common->lock_regmap	= lock_regmap;
> > +
> > +		ret = devm_clk_hw_register(dev, hw);
> > +		if (ret) {
> > +			dev_err(dev, "Cannot register clock %d - %s\n",
> > +				i, name);
> > +			return ret;
> > +		}
> > +
> > +		clk_data->hws[i] = hw;
> > +	}
> > +
> > +	clk_data->num = data->num;
> > +
> > +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> > +	if (ret)
> > +		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int k1_ccu_probe(struct platform_device *pdev)
> > +{
> > +	struct regmap *base_regmap, *lock_regmap = NULL;
> > +	struct device *dev = &pdev->dev;
> > +	int ret;
> > +
> > +	base_regmap = device_node_to_regmap(dev->of_node);
> > +	if (IS_ERR(base_regmap))
> > +		return dev_err_probe(dev, PTR_ERR(base_regmap),
> > +				     "failed to get regmap\n");
> > +
> > +	/*
> > +	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
> > +	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> > +	 * status.
> > +	 */
> 
> I have two comments on this next section (handling the
> lock being in a different area of memory).
> 
> First, now that you're defining a spacemit_ccu_data structure
> type, you could add a field to that type with an identifier (an
> enumerated type, one per CCU).
> 
> Then the following test could check that field rather than
> the compatible string. This isn't much different in practice,
> but it would allow future code to make other decisions based
> on the identifier--long after initialization.

I'd like to put off the change until we really need to make such
decisions, afaik we don't in current version of clock and reset driver.

> Second, why does it matter what region the memory is in (whether
> it's MPMU or something else)?  I think it would be better to
> specify that as a "lock-region" or maybe "regmap-lock" property.
> It's value is a simple phandle, and you're just looking up the
> regmap from it.

Actually it does somehow matter, offsets of registers representing the
lock status of PLLs are hardcoded, thus I don't think a generic name is
very useful. And we've already had comments in both dt-bindings and
driver to make purpose of the property clear.

> If you think this is a good idea you'd need to get input and
> approval from the DT maintainers.
> 
> > +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> > +		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> > +							    "spacemit,mpmu", 0);
> > +		if (!mpmu)
> > +			return dev_err_probe(dev, -ENODEV,
> > +					     "Cannot parse MPMU region\n");
> > +
> > +		lock_regmap = device_node_to_regmap(mpmu);
> > +		of_node_put(mpmu);
> > +
> > +		if (IS_ERR(lock_regmap))
> > +			return dev_err_probe(dev, PTR_ERR(lock_regmap),
> > +					     "failed to get lock regmap\n");
> > +	}
> > +
> > +	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
> > +				    of_device_get_match_data(dev));
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register clocks\n");
> > +
> > +	return 0;
> > +}
> 
> . . .
> 
> > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> > new file mode 100644
> > index 000000000000..971c489c261a
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_pll.c
> 
> . . .
> 
> > +static int ccu_pll_init(struct clk_hw *hw)
> > +{
> > +	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> > +
> > +	if (ccu_pll_lookup_matched_entry(pll))
> > +		return 0;
> > +
> > +	ccu_pll_disable(hw);
> > +	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);
> > +
> 
> Looks like you now ensure the rate is set to one of those
> in the table if it isn't already.  Nice work.
> 
> 					-Alex

And thank you for your patient review and hints.

Regards,
Haylen Chu
