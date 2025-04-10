Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788141684B4;
	Thu, 10 Apr 2025 01:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248967; cv=none; b=l6s2+4DA+MnUZtLdhJnCcAoNf6Aie5M0a61XPpSD65cc3rf7sjnSgn5vh/1QRuoarQg00fMfHVpd1qt7kuTpFtf4KBDr385OPOCtT5RExcDreHwN/zQNo+pX47yLseEILym9k63+/6wJr/mRH060nZOr6XgsIELeZgrLcq04V7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248967; c=relaxed/simple;
	bh=WfWVNKFhuyMXuKAZwzpdGkYOiQAtyEHVdr/tazfGwgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ge820sZI3cQ0jIwidf3YH6QlRfsgpDY78FsO7aUpjHmt1TvtaiytpAQZL44r0q1mtXtJeGSvY5n+UtamNcwMTRMDE+1u9B/4eBpDgOXjpTbVB49GgXdMYd5t5gxCWQJ55R6BS4AWB6i7Klee84KrveFIxBif3GT47YGpIk6KEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNeVAd0/; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNeVAd0/"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c592764e54so42777585a.3;
        Wed, 09 Apr 2025 18:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744248964; x=1744853764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn77HHPqYcQPNS+D6QKMYch27BNofJCne2UJ+gPfHFk=;
        b=ZNeVAd0/6bTg/WEpQ5DTXbUdAycp6iAGnDzh21wtupTlvN6XOihSi0qlN4J9uWLOy3
         5iJV0XlErdxR66ELn5YnKszbxr7SNig+ej5WYiUWaQXDYsOMgv05ytj7zoaMGA1RGBzO
         hz9yQm/b2sNhl6xu0gEkm0rIFDK/p+XPPGTiPkjHDsH4toka1bcupMVeJC5/LhrhoBAa
         S/Xh+TjArf14bR/EsU6L77n/bA8AgMHy+nX8/89kIRQIlb7OW1rcnJictkyESQ6NAJ3F
         YBCt8dgDz9lVYVkYoxtkJL/TZrCR0SsNYnic0ifjSjQfbghOzB4j6NiT31Ws3MQrwnVJ
         55gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248964; x=1744853764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn77HHPqYcQPNS+D6QKMYch27BNofJCne2UJ+gPfHFk=;
        b=m8EPENYUsJ+DYc1VQUd8yZWKsw5BsZd0ADfqImMPDunzfS0ZAIvtWMWhz/o/H/YXjV
         2hLOtLrIrcv2BNkahl8IDgkiH/B++n19dn+EYdgV7zPRQz7BfIzDp4MD/syq90K6JLsU
         2FoQ1234OiyL/xmwY9C/IQpI+lxTwsq8w+Zk24JEQF+SlQ4SeISDgcioMw++3ZQJxbRQ
         66Ja+7cPuJZtchdZkcSlDf27c9dIxT/rhEtd3V/gsphptU/5vw7jU4aGAOSTalIwZNY6
         eScHMhHyR+WP0oZDHOoO1iFH9hCYZcH5Nnis++Bx5MHlbLlgFji4wuRG1mYQMTbEzrED
         0W1w==
X-Forwarded-Encrypted: i=1; AJvYcCUAWVvbn5q/D+1K+pSB7QnKpAqtzkUYYZmijgryks76AcVqFFbs0EjnbHtA+Jtyo110Qnkrs3J3LRO1@vger.kernel.org, AJvYcCUVf86CoImsN73vcO0H1/Uq7GHmoWBAIooLL5B7bOQCL7Sp9y9XFCYPUmbMotLGef89jGL6lql+l1iPd5ot@vger.kernel.org, AJvYcCXm2jeCBfawvNkdX9fsA1+SQMOwC4axpg1mvYNEO5RYvf67LN3RVCEHQrVP/6tcqObLjH5Ud552KGpE@vger.kernel.org
X-Gm-Message-State: AOJu0YyGqEVUiVnaI1ik31snWc/v8zFCrCbfOwDH1yV3ndgASHBYK665
	+0iVOEgLmNP8xc8s3xkGpfCHAmOoz6uePQokd7epspk0tcJworKy
X-Gm-Gg: ASbGncs3hVTwrfx/IPdtAvl1Gn5GDPQsfyWwhL8UxPlWe/Nn8VTxbh1F3wyQbHjGhhA
	tOxVPvwOHkxcsHq3z5WL4a/Doev0KL5eq7TAfeavMsTBEM/U03EyanWdtXcqs5g3A84S5cQNlDe
	ueKJcJPI17kz81LBpULEo0r4PTal1TKdLC0jtHZ8YFRWPheGePgQVcm6qd5EImwgL+3tZGWjw1x
	abZ0V1Mr1jFELA/m6aqMReO9Y4guEb6OBjvUSTctyFfCmtgimT8ioCjxNy1xdj8pjEimx73pRSk
	cw8h+58bZHu6fxQ9wScc0ghhDmk=
X-Google-Smtp-Source: AGHT+IEcWmffQfvCuChtXQXpnroPXYRrhJX1q2n+tT6bZYpbzl+MegNQoZB3XFLgQsUM9dwmK7XvZA==
X-Received: by 2002:a05:620a:3941:b0:7c5:5a51:d2d1 with SMTP id af79cd13be357-7c7a81c7994mr96263385a.55.1744248964263;
        Wed, 09 Apr 2025 18:36:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8969e5bsm13726985a.53.2025.04.09.18.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:36:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:35:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <mnkjxqswewyr7agadnv7rprckqafpryotmmi64ckmocwily2yy@mzjwc2qp2wdd>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <20250410011611-GYC19359@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410011611-GYC19359@gentoo>

On Thu, Apr 10, 2025 at 01:16:11AM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 08:57 Thu 10 Apr     , Inochi Amaoto wrote:
> > On Thu, Apr 10, 2025 at 08:54:51AM +0800, Inochi Amaoto wrote:
> > > On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> > > > On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > > > > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > > > 
> > > > > > All register operations are done through regmap to ensure atomiciy
> > > > > > between concurrent operations of clock driver and reset,
> > > > > > power-domain driver that will be introduced in the future.
> > > > > > 
> > > > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > > > 
> > > > > I have a few more comments here but I think this is getting very
> > > > > close to ready.  You addressed pretty much everything I mentioned.
> > > > > 
> > > > > > ---
> > > > > >   drivers/clk/Kconfig               |    1 +
> > > > > >   drivers/clk/Makefile              |    1 +
> > > > > >   drivers/clk/spacemit/Kconfig      |   18 +
> > > > > >   drivers/clk/spacemit/Makefile     |    5 +
> > > > > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > > > > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > > > > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > > > > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > > > > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > > > > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > > > > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > > > > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > > > > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > > > > >   13 files changed, 2348 insertions(+)
> > > > > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > > > > >   create mode 100644 drivers/clk/spacemit/Makefile
> > > > > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > > > 
> > > > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > > > index 713573b6c86c..19c1ed280fd7 100644
> > > > > > --- a/drivers/clk/Kconfig
> > > > > > +++ b/drivers/clk/Kconfig
> > > > > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > > > > >   source "drivers/clk/sifive/Kconfig"
> > > > > >   source "drivers/clk/socfpga/Kconfig"
> > > > > >   source "drivers/clk/sophgo/Kconfig"
> > > > > > +source "drivers/clk/spacemit/Kconfig"
> > > > > >   source "drivers/clk/sprd/Kconfig"
> > > > > >   source "drivers/clk/starfive/Kconfig"
> > > > > >   source "drivers/clk/sunxi/Kconfig"
> > > > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > > > index bf4bd45adc3a..42867cd37c33 100644
> > > > > > --- a/drivers/clk/Makefile
> > > > > > +++ b/drivers/clk/Makefile
> > > > > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > > > > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > > > > >   obj-y					+= socfpga/
> > > > > >   obj-y					+= sophgo/
> > > > > > +obj-y					+= spacemit/
> > > > > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > > > > >   obj-y					+= sprd/
> > > > > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > new file mode 100644
> > > > > > index 000000000000..4c4df845b3cb
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > @@ -0,0 +1,18 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > +
> > > > > > +config SPACEMIT_CCU
> > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > 
> > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > clock driver built in to the kernel?
> > > > > 
> > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > without clock built in as it's such critical..
> > > > 
> > > 
> > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > 
> > Sorry for a mistake, this first "only" should be "not".
> > 
> > > should also be a module. It is the builder's right to decide whether
> > > the driver is builtin or a module. In this view, you should always
> > > allow the driver to be built as a module if possible.
> > > 
> No, we've already made pinctrl as Boolean (still depend on ARCH_SPACEMIT)
> if people don't want this feature, he/she can disable CONFIG_ARCH_SPACEMIT
> 
> https://github.com/torvalds/linux/blob/master/drivers/pinctrl/spacemit/Kconfig#L7

I have a question for this. Does the minimum system can boot without
pinctrl (I mean purge the pinctrl node in dts and use uart only)? If
so, why you treat it a must? In some cases, probe fail without pinctrl
driver is a expected behavior. And if the pin config can be optional,
it will be better to fix the driver and the pinctrl framework, but
not to just convert the module as built-in. It is a waste of space.

Regards,
Inochi
