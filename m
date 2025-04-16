Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0011620E31C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820806; cv=none; b=ucMh885JPFxfYDjzAeEbIKaqg1tqoq5tp1wFf88Jt2YFXURCfKkPXyyR/8dFXjLHx/UfwOIAopwgGjmnYykv9w5Sph8nCRyU4TMunMeIbPfbh/eKquZGLZ36eAgDNCRtm6W+yfgRwGRQPq98SyCiAJAuTw2acA9grY2cmebzq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820806; c=relaxed/simple;
	bh=IgVUPVmeENy0Uzuoi0wDjp+mUTJq74C5LbxA0jQcmRU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSk5zbni2o5lkeHzlpuqAS/dApAAmEAvGZX1QiNRQuFGPuiUk7WyloOPYovrDANoJtDIbgwX2tyT+TCNESrTemClQFd9/7TNT16NWaBLI8UNCNFrdc+Q2dosHgbRvl06Kh8yJJfcT54rJb8Ys0vHh/GVnFypVsoocT5P47bPml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zbk9V2mz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zbk9V2mz"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac345bd8e13so1200335166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744820802; x=1745425602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FlZ3978PiTGhVSgh9hGMx7P3nOMDWWhOsbZtxjmYRo=;
        b=Zbk9V2mzhvYatYTUOlXlO837M+Gz8+Hde2DMQCNpqHmfAXowQx43KtI8Fcn54XHz5A
         4S04TNsffSUSK3qDocq8M8dd4EuM2JJlsWxvnG5UTulUD7qGwNHD4HGSMo5bgvZdQuiZ
         o5EdZYA+J66smISdM4BYTjwZESdVpwxHfOiQfC4DnKidSfmf1jYZY6DIJ5b8fc37pDPe
         nkq1GrBQ+HYunIBXFGhxiOJTyB0d9YNCoeeLvCpKBoVJ27fTdyCdi/yUZJP+MAqeG6Yx
         BM5ntIRGHA0WQHTBkpoOxJZ2g8wOW29GQpHZGeM+E1z+N6D4MlFFlKdQBaI9XdxwDlmW
         /iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744820802; x=1745425602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FlZ3978PiTGhVSgh9hGMx7P3nOMDWWhOsbZtxjmYRo=;
        b=gdP/382RiW9cG82NDKRRxtNoZSiKmCFv5Yxykjc1UusnCVk2CKihSQi7/3Hbzbwjg2
         uogZ/awTVs5JlByAqaQf661diIlXuVKyH+pFWvnxTDTwGK0RtVa5tuOFZ0bB8v7rtGTi
         kZi00e58i/6xU9sCe5fjaW273cQEMhv7gEeSYQ0eMG5NQPAhEeYYxffjHYtXR9ROTfdE
         h1d7kLTeIctjF3uPPkbW/dw+5bvpHPLglqRzfzOjAfcK6eFD8Yv8nL8sf9lpgjqUqXA9
         rj6xi19KVEwCJfQ4U2zLc5n8dnMTsb2yprgKJQTecrYIdkTa6jPDCkUu0z4mJrgydkxk
         +BNg==
X-Forwarded-Encrypted: i=1; AJvYcCXdyGNb0OuYaGSQxsJzoK4lDik6PpaY4ArfmdrsdO/HrnsAOs17jJdaiN5F4rzP7rN95GwhQP74fOtDtJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0kpWC+EtdGavMxAXDKNxeeT8FPfvcfwrOLv6cYDjskVs7numV
	7oom9TXs9ngwHdp91shoq3ty3e636vzliam/gOXPVYc+wZKCyXFqV0PSPnbDG2Y=
X-Gm-Gg: ASbGncsD3wXea0dNEybsClvijDkCZ7aH1kqBwnSWt6ZXmvecmz/4avSY2ThovOMJtsp
	O1vveFQaSl1Lbo9mVKVPfliGW2FRAFpEYGoBrmwNbVfw65IQFa26PUgSqOzSTklq16mG9YcF/Bt
	Wk9tpTHlbx3H6K5yA6MBbH0Pub9mikyTUBuThmtNNWQTBonOYM+AuPjBiZZCRzLNOoLKVrjIVUH
	VVlX4fWbo6b4xdgJgmxQ59+deu+6U0u54RTvbj7MjSbbYDYDeEnAtUVPoPU2lj84nWLpiMcAoGJ
	eJf4E8FDmwWdBDc8+GawmUdteO9Eif4elwJP348F7k8jzer8LmZ+NidBY8Z37wbsxWry6xUPgYX
	ZPnlOSQ==
X-Google-Smtp-Source: AGHT+IHS1EQoXBYosStv1ftcoY5+W8c3n7WjQIALsG6rcu4q9LYmbRt8Y9GVkdutMbrKBeFufo1cQw==
X-Received: by 2002:a17:907:2d9e:b0:aca:c441:e861 with SMTP id a640c23a62f3a-acb42890585mr270946866b.7.1744820802220;
        Wed, 16 Apr 2025 09:26:42 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1ccd75sm155050366b.142.2025.04.16.09.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:26:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 18:28:05 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 05/13] clk: rp1: Add support for clocks provided by RP1
Message-ID: <Z__alTyVJOwu_1gR@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <370137263691f4fc14928e4b378b27f75bfd0826.1742418429.git.andrea.porta@suse.com>
 <23ac3d05-5fb7-4cd8-bb87-cf1f3eab521d@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23ac3d05-5fb7-4cd8-bb87-cf1f3eab521d@gmx.net>

Hi Stefan,

On 14:09 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > clock generators and PLLs that drives the sub-peripherals.
> > Add the driver to support the clock providers.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   MAINTAINERS           |    5 +
> >   drivers/clk/Kconfig   |    9 +
> >   drivers/clk/Makefile  |    1 +
> >   drivers/clk/clk-rp1.c | 1512 +++++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 1527 insertions(+)
> >   create mode 100644 drivers/clk/clk-rp1.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 896a307fa065..75263700370d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19748,6 +19748,11 @@ S:	Maintained
> >   F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> >   F:	drivers/media/platform/raspberrypi/rp1-cfe/
> > 
> > +RASPBERRY PI RP1 PCI DRIVER
> > +M:	Andrea della Porta <andrea.porta@suse.com>
> > +S:	Maintained
> > +F:	drivers/clk/clk-rp1.c
> > +
> >   RC-CORE / LIRC FRAMEWORK
> >   M:	Sean Young <sean@mess.org>
> >   L:	linux-media@vger.kernel.org
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 713573b6c86c..cff90de71409 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -88,6 +88,15 @@ config COMMON_CLK_RK808
> >   	  These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
> >   	  Clkout1 is always on, Clkout2 can off by control register.
> > 
> > +config COMMON_CLK_RP1
> > +	tristate "Raspberry Pi RP1-based clock support"
> > +	depends on MISC_RP1 || COMPILE_TEST
> > +	default MISC_RP1
> > +	help
> > +	  Enable common clock framework support for Raspberry Pi RP1.
> > +	  This multi-function device has 3 main PLLs and several clock
> > +	  generators to drive the internal sub-peripherals.
> > +
> >   config COMMON_CLK_HI655X
> >   	tristate "Clock driver for Hi655x" if EXPERT
> >   	depends on (MFD_HI655X_PMIC || COMPILE_TEST)
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..ff3993ed7e09 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -84,6 +84,7 @@ obj-$(CONFIG_CLK_LS1028A_PLLDIG)	+= clk-plldig.o
> >   obj-$(CONFIG_COMMON_CLK_PWM)		+= clk-pwm.o
> >   obj-$(CONFIG_CLK_QORIQ)			+= clk-qoriq.o
> >   obj-$(CONFIG_COMMON_CLK_RK808)		+= clk-rk808.o
> > +obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
> >   obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
> >   obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
> >   obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > new file mode 100644
> > index 000000000000..72c74e344c1d
> > --- /dev/null
> > +++ b/drivers/clk/clk-rp1.c
> > @@ -0,0 +1,1512 @@
> > +// SPDX-License-Identifier: GPL-2.0
> ...
> > +
> > +static int rp1_pll_divider_set_rate(struct clk_hw *hw,
> > +				    unsigned long rate,
> > +				    unsigned long parent_rate)
> > +{
> > +	struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
> > +	struct rp1_clockman *clockman = divider->clockman;
> > +	const struct rp1_pll_data *data = divider->data;
> > +	u32 div, sec;
> > +
> > +	div = DIV_ROUND_UP_ULL(parent_rate, rate);
> > +	div = clamp(div, 8u, 19u);
> > +
> > +	spin_lock(&clockman->regs_lock);
> > +	sec = clockman_read(clockman, data->ctrl_reg);
> > +	sec &= ~PLL_SEC_DIV_MASK;
> > +	sec |= FIELD_PREP(PLL_SEC_DIV_MASK, div);
> > +
> > +	/* Must keep the divider in reset to change the value. */
> > +	sec |= PLL_SEC_RST;
> > +	clockman_write(clockman, data->ctrl_reg, sec);
> > +
> > +	/* TODO: must sleep 10 pll vco cycles */
> Is it possible to implement this with some kind of xsleep or xdelay?

I guess so... unless anyone knows a better method such as checking
for some undocumented register flag which reveals when the clock is stable
so it can be enabled (Phil, Dave, please feel free to step in with advice
if you have any), I think this line could solve the issue:

ndelay (10 * div * NSEC_PER_SEC / parent_rate);

Many thanks,
Andrea

> > +	sec &= ~PLL_SEC_RST;
> > +	clockman_write(clockman, data->ctrl_reg, sec);
> > +	spin_unlock(&clockman->regs_lock);
> > +
> > +	return 0;
> > +}
> > +
> > 
