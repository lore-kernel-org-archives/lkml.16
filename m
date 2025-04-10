Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8681ACA;
	Thu, 10 Apr 2025 01:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247778; cv=none; b=pNKdbhQyjwk7oEP366mqFTJVsul65hAR98SLgN73vrL+N6ArLBok/B6llBpMSwpGfgt8Fx+dsFKiGyqogOMi/WIJt6fekaw5w0TD1ueIgsY1cbiil4vd2Pn+lWrlO1Is/k/i8XjWR7Ppy5n11FRWekRet7eihA4uisGC5cs70rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247778; c=relaxed/simple;
	bh=Obppywlhj4bVVbMYcjcsZxIuwnUSJO4J1OyHVDfojZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tf9e4l+9ney7uWVcGZ8ZC+MCYcUCy4LULB8fqTt3OpehLeiIB8dMusXrleuYyQLRzZ+qPA4pJjZE0Tos5mUoH4t93RB8mxUyk6p9YxWexnvc9nSbxpc1WlbltGv8XIPZONdedL4Nh+9AuaRaQcRTCZxArpXriNK+Tcw2MjHDON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2F9F5343294;
	Thu, 10 Apr 2025 01:16:14 +0000 (UTC)
Date: Thu, 10 Apr 2025 01:16:11 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
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
Message-ID: <20250410011611-GYC19359@gentoo>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>

Hi Inochi,

On 08:57 Thu 10 Apr     , Inochi Amaoto wrote:
> On Thu, Apr 10, 2025 at 08:54:51AM +0800, Inochi Amaoto wrote:
> > On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> > > On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > > > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > > 
> > > > > All register operations are done through regmap to ensure atomiciy
> > > > > between concurrent operations of clock driver and reset,
> > > > > power-domain driver that will be introduced in the future.
> > > > > 
> > > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > > 
> > > > I have a few more comments here but I think this is getting very
> > > > close to ready.  You addressed pretty much everything I mentioned.
> > > > 
> > > > > ---
> > > > >   drivers/clk/Kconfig               |    1 +
> > > > >   drivers/clk/Makefile              |    1 +
> > > > >   drivers/clk/spacemit/Kconfig      |   18 +
> > > > >   drivers/clk/spacemit/Makefile     |    5 +
> > > > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > > > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > > > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > > > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > > > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > > > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > > > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > > > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > > > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > > > >   13 files changed, 2348 insertions(+)
> > > > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > > > >   create mode 100644 drivers/clk/spacemit/Makefile
> > > > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > > > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > > 
> > > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > > index 713573b6c86c..19c1ed280fd7 100644
> > > > > --- a/drivers/clk/Kconfig
> > > > > +++ b/drivers/clk/Kconfig
> > > > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > > > >   source "drivers/clk/sifive/Kconfig"
> > > > >   source "drivers/clk/socfpga/Kconfig"
> > > > >   source "drivers/clk/sophgo/Kconfig"
> > > > > +source "drivers/clk/spacemit/Kconfig"
> > > > >   source "drivers/clk/sprd/Kconfig"
> > > > >   source "drivers/clk/starfive/Kconfig"
> > > > >   source "drivers/clk/sunxi/Kconfig"
> > > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > > index bf4bd45adc3a..42867cd37c33 100644
> > > > > --- a/drivers/clk/Makefile
> > > > > +++ b/drivers/clk/Makefile
> > > > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > > > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > > > >   obj-y					+= socfpga/
> > > > >   obj-y					+= sophgo/
> > > > > +obj-y					+= spacemit/
> > > > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > > > >   obj-y					+= sprd/
> > > > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > new file mode 100644
> > > > > index 000000000000..4c4df845b3cb
> > > > > --- /dev/null
> > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > @@ -0,0 +1,18 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > +
> > > > > +config SPACEMIT_CCU
> > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > 
> > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > clock driver built in to the kernel?
> > > > 
> > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > without clock built in as it's such critical..
> > > 
> > 
> > I disagree. The kernel is only for spacemit only, and the pinctrl
> 
> Sorry for a mistake, this first "only" should be "not".
> 
> > should also be a module. It is the builder's right to decide whether
> > the driver is builtin or a module. In this view, you should always
> > allow the driver to be built as a module if possible.
> > 
No, we've already made pinctrl as Boolean (still depend on ARCH_SPACEMIT)
if people don't want this feature, he/she can disable CONFIG_ARCH_SPACEMIT

https://github.com/torvalds/linux/blob/master/drivers/pinctrl/spacemit/Kconfig#L7
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
