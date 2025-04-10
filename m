Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368951754B;
	Thu, 10 Apr 2025 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744245484; cv=none; b=V+bHQYqfwe+gY8g/2T7aii1mI8sWlhaCgtxxjUZX/Xp64suY46L1EIykPxind9IV+25srEmdKhIlWxLYlEk4xtPcgj26S9KPQ4j1ThamhZkV0iyyO/j31WUNlD6iwQSsPa/oBDCHy+tn7nuUA6LUKSXKiIYR3vXb+2q56oUes54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744245484; c=relaxed/simple;
	bh=Pib55EvMjvIrTsAVmhgO6uA6SgdnIcsHusx8WQ6efgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GA3o1sEsMQcph4OG/IeTYLy3K6BbYBlO4eg3qWanlip9UYxnMAWQVnkvqG3L+MG2L0JDmVsuSTcymPFDPt7UkZEoG7Yv8MAey6tzLvRtLtme+zT/FaXbPds8cmn40cnjIL7xMy873NfgQkUqI4NEWipaXjNPWttvHeCl6GqjJec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 12FDC3432CF;
	Thu, 10 Apr 2025 00:38:00 +0000 (UTC)
Date: Thu, 10 Apr 2025 00:37:56 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <20250410003756-GYA19359@gentoo>
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

On 14:37 Tue 08 Apr     , Alex Elder wrote:
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
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 713573b6c86c..19c1ed280fd7 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> >   source "drivers/clk/sifive/Kconfig"
> >   source "drivers/clk/socfpga/Kconfig"
> >   source "drivers/clk/sophgo/Kconfig"
> > +source "drivers/clk/spacemit/Kconfig"
> >   source "drivers/clk/sprd/Kconfig"
> >   source "drivers/clk/starfive/Kconfig"
> >   source "drivers/clk/sunxi/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..42867cd37c33 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> >   obj-y					+= socfpga/
> >   obj-y					+= sophgo/
> > +obj-y					+= spacemit/
> >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> >   obj-y					+= sprd/
> >   obj-$(CONFIG_ARCH_STI)			+= st/
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
I agree to make it a Boolean, we've already made pinctrl driver Boolean
and pinctrl depend on clk, besides, the SoC is unlikely functional
without clock built in as it's such critical..

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
[...] 
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
> 
Yes, I do prefer 100 cloumn.. please check more of this files

But anyway, I can bear with it if clk subsystem maintainer have enforced
80 column policy for the whole clk subsystem, to make consistent

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
