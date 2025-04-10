Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8413878F4F;
	Thu, 10 Apr 2025 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246533; cv=none; b=P4vm9wZdur+Do0DJEejI1MOi6CtSe8SgKBBMYp+OwUreSAc4b99Ik2NqsXwSXkrHSswivn0jjztxWGApgnghYjTJcxCtCnQAuxV4Jybb69t8YTk1UItYm/4+CwidIIjiFMKdUMTbnDkR2skadTNWoWI7826AYZX2r4xRnAQs3dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246533; c=relaxed/simple;
	bh=OHnJFSDfJoLhxqs6zRdOqEbaAkBnWO045bR+BCPNRRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyAs5XpgOQi3f7k3Ep7qubsH4g1rmxar2VoIbeuVPm0qEcBj9G07fgDfQd6Bf/uo365p3BIt1dIS8HCkfGzYNZl2iBAHxVynUAigKl0oDEHRAWEagvrT6vxi7uYry79qqikTh55WTtgoJQg4bfoQI4OxpMKz8/PoH1VESv3MSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBeHsq1F; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBeHsq1F"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c592764e54so38914385a.3;
        Wed, 09 Apr 2025 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246529; x=1744851329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwkifruprja03lOjmLEiYD8iUCfTbujfomvweg3q04s=;
        b=OBeHsq1FA+cRZ60vyHr/HumI3jTxnWpdexbv9iqBJoI7kZKPYYYGY9XmL/5lTUvuwp
         m9WS6jZ06j52vEG4BUJa0Cn1GFYl/qM6/82pb9JC9MhWLeGo0I61RwRtxxGH57isIib2
         pxacEFoDjp0s4zMXPxik4z0+beF2ZiIM0OyxaDWrANrusr1XVPcC53sroRT/zNRLUTAf
         xzzqIGkoLawc/3iueeztrsujJUlP276xlj3I7vdE+N+G8wb1BhvUP36j2/bWsVeKaakk
         MgO5P0Y8I9Nn6W9XS0XU4Wqz6jqTlCrVh53bMAe2B/iBFJf5918ow58Sm+Rr6DmsMwHm
         u8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246529; x=1744851329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwkifruprja03lOjmLEiYD8iUCfTbujfomvweg3q04s=;
        b=oLkVl4TvbTG2cpdiFwr8gYtWbKOhPwrzq34DgwswQUBgfGmnFzbETV5S5LHa43gHIy
         +2NWeCY9/u/5F/eKctrPCEQY9xVORtCR38y+bEQHiFHuTd1WVkvBiRjZ6Xket6ekfbLE
         zIDNahVi7ckx5INBGXa9GGsxuDiEvOM/LJ9ZxKn+bXERStedYsetGMrE6qqzLoBAYGzT
         +ZX/uOcWB+0Jv6115I5g3lRUokvFA9xywE64UGeZyzPwWREp4MwDD8J2XhdR5q3mIVID
         OOeyhM4zxqshxFMdbOEvNa8vXMwh/ay4a+5JAlO5fh68sIbL7s6IPlCdjy23f7Ix536k
         OEvg==
X-Forwarded-Encrypted: i=1; AJvYcCVWXNuUdiD6xipAVrTgj/Iqw8s9LVaAr9EJclYL7PvrJaF/xrkyVHpMacvVPAt2AK5bvRapTdDAeAMM@vger.kernel.org, AJvYcCW3JvmT6AI9scv7v0O9FsW7oFotiJcX+hsjeDO0cw8UtFmAGFr0+TQ2BIAHLAAZ7PH3oBWqoSwsLirE@vger.kernel.org, AJvYcCWGURng+ayavGgu74NmXhpR0mbo6erRPKyOSWEtynJNsXrc5eDtfikg/2qsCauY/4o9CRV+C7c7KCOxqr8a@vger.kernel.org
X-Gm-Message-State: AOJu0YyVkC0BnmcMU4YY7rH/UuUTCsBPDM5O/GZUTlyofPDi12dc6pFA
	Z8Qpmi3dIABY5HnMCKIoKKvwVj95zLOVCPl49KwNWIOwWmyafPzO
X-Gm-Gg: ASbGnctLNROhCjrE6QP/9oKfI6ufIFGHLo9+c942DPBnK4GJijAT2/EFIVfn0TQ0+FQ
	xmohMFv0PFLjqjkAt14JtzXJJhep5mmUOPG9sjC2lVqfcnHwdgPFuMKZQaZN5oEso49LjtieuTX
	bTfgmYBWuylVqgDiLRC3Z6DzJoQ8HusMD3/hiGnwZnrNKCsVV9fifdkWlnzgmwCgomSGm0/Yk6I
	A7rxmkEWV/sXbxroE/H1kHohuQ1k8R9SdiqUwThtMQL8xPLmXMwCxfZKek8BKncRZtBzoZdLiL4
	GMcd76sF9o9uiZ6e
X-Google-Smtp-Source: AGHT+IE60U0O3t2g/z0t8CojVDZ5ZM/gRTXCJPIa/XlR1ySwWZ4MEZOecT280WyJJ9QmFd0KPggOIQ==
X-Received: by 2002:a05:620a:4141:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7c7a8164bf9mr74285385a.23.1744246529432;
        Wed, 09 Apr 2025 17:55:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942ec7sm9342585a.18.2025.04.09.17.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:55:29 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:54:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410003756-GYA19359@gentoo>

On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > The clock tree of K1 SoC contains three main types of clock hardware
> > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > 
> > > All register operations are done through regmap to ensure atomiciy
> > > between concurrent operations of clock driver and reset,
> > > power-domain driver that will be introduced in the future.
> > > 
> > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > 
> > I have a few more comments here but I think this is getting very
> > close to ready.  You addressed pretty much everything I mentioned.
> > 
> > > ---
> > >   drivers/clk/Kconfig               |    1 +
> > >   drivers/clk/Makefile              |    1 +
> > >   drivers/clk/spacemit/Kconfig      |   18 +
> > >   drivers/clk/spacemit/Makefile     |    5 +
> > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > >   13 files changed, 2348 insertions(+)
> > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > >   create mode 100644 drivers/clk/spacemit/Makefile
> > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > 
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index 713573b6c86c..19c1ed280fd7 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > >   source "drivers/clk/sifive/Kconfig"
> > >   source "drivers/clk/socfpga/Kconfig"
> > >   source "drivers/clk/sophgo/Kconfig"
> > > +source "drivers/clk/spacemit/Kconfig"
> > >   source "drivers/clk/sprd/Kconfig"
> > >   source "drivers/clk/starfive/Kconfig"
> > >   source "drivers/clk/sunxi/Kconfig"
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index bf4bd45adc3a..42867cd37c33 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > >   obj-y					+= socfpga/
> > >   obj-y					+= sophgo/
> > > +obj-y					+= spacemit/
> > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > >   obj-y					+= sprd/
> > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > new file mode 100644
> > > index 000000000000..4c4df845b3cb
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/Kconfig
> > > @@ -0,0 +1,18 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +config SPACEMIT_CCU
> > > +	tristate "Clock support for SpacemiT SoCs"
> > 
> > I don't know the answer to this, but...  Should this be a Boolean
> > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > clock driver built in to the kernel?
> > 
> I agree to make it a Boolean, we've already made pinctrl driver Boolean
> and pinctrl depend on clk, besides, the SoC is unlikely functional
> without clock built in as it's such critical..
> 

I disagree. The kernel is only for spacemit only, and the pinctrl
should also be a module. It is the builder's right to decide whether
the driver is builtin or a module. In this view, you should always
allow the driver to be built as a module if possible.

Regards,
Inochi
