Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C9381A3;
	Thu, 10 Apr 2025 00:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246681; cv=none; b=mq4izF8QryQv08Yon7m/vpbSQiI+EweGcjQeBzpBbx+DfUUuallXI2bMsu7TSXpHM8VHOurEhTvtxkq82oz5H4e/8yR2JQ0adNGesMWTlRGtOaHINH8PnifKyx5+54lVtgD2e/zVqxCtBMyUFNWjbp35aWXxbSz7uliMvMGlets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246681; c=relaxed/simple;
	bh=gTFgNKyrKidNGGxA7hq3GqQc+k2Bkqh/7DU9089x8mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzYIBWN8FiKG/pv9XLofGxKXXNcKubL163BlqE5Gg3VNfB3GhGFEGZCrpCj/oi38j6oIxf5wXKA6j0ZPKGaZgLRItp9OvoDeIokZVcqJowPy/g1LBPBQer8CwCyPW2erIrOG9Ws02Gt9ynnQfKiBCRmfWY55OPEetUp0ow5anzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUMrcZx1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUMrcZx1"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5e39d1e0eso27266385a.1;
        Wed, 09 Apr 2025 17:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246678; x=1744851478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9iTZbextS/6RO2qTODUHsN3tyzaIcsCAslxYIXkL/0=;
        b=nUMrcZx19CkI69rSXj95qZmxUHTsJBTDIm/f7+nJUrXTfCzS7Uuh7LLfxlCznby9gf
         QqZ6OpzdvEcCJpBRSD4VBCcFkXl1fXy/XnyybOYM78kYkrEhZ66DaAFt6DgCMUBZ+eek
         V9q7P75frhdep4jKpKD/rpe4g0qzpZCfpz09hkY4+QPPTTzhlHKan7yCwtshCb25YB9H
         g7+NG6RHZo0QUaW3l7/RZQE+XAxfHLltjTlQ9fMCXxNxqt9f8f7cqQMl5JilXwaRcsdr
         yTwJJFODHFmROW6mP03fFXJlctobIdUVgt06McOXZ3EAXmFS8e8UcXpPspeyIdfi0RjL
         Sqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246678; x=1744851478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9iTZbextS/6RO2qTODUHsN3tyzaIcsCAslxYIXkL/0=;
        b=xGuiBeXTvePS0XBYIAA+GQ6yrX9mlgfOyiv6YZfoZqRSHcoDgfDivINUtVv0eyQdBy
         OhnlKiygJKwO4bn4C/FlLm8z7MOe2Xz66LayjCuez4fZ9XUcGuB0msBZq1PX5IpgpQsD
         QaWLcUWCv/AWUKudrL6AvFnHx6hMu8thXVGiN6amyc/4r1VjNIhP/48VVAzxmwt7aVV0
         2vDeP0GoHw7HLXY2MnhY33/aeC/r3mgQt5UD+TAPx8FSiaXItQeTZiJeAykGxnlYb/W0
         hig/4AXUYgkU6Vhgi1091Zo24E2NHM1pXFR4kwBZM1WtMjCtICpqQ1KTlbyBYnDiNnUN
         4jhw==
X-Forwarded-Encrypted: i=1; AJvYcCURc5i3gRWDsFBxm+egFHH17QtvHEV/WAAFxLXyyKPtCA6sDdk2X2Oro6y98KvxbL5h5FcmL75sO2XojyOi@vger.kernel.org, AJvYcCWeW4v9fZ2+z7cxwZlysDMd6ZJ5IrO/H/uhMWW5ao4FFenXTL3QafJ6hWJGqLp/czAGQfIpTA6ch+H0@vger.kernel.org, AJvYcCWhGF9bWaH0HCpWdg3BJrpQL+xBcEIWFt/YjbDmFo3JhbUo2qsox2gB4XFITsGbRDglbb1mXmS0K1Cb@vger.kernel.org
X-Gm-Message-State: AOJu0YwovEnYbQmTbAL6X0eReJOoPP8JsAJOdaTgroT6QTJx9WTXeeVw
	pFXimNgd2Ct9ogGrHVrbnFQRJ7Zh9/pu7wU1+wFNAhI1KMI8FTKx
X-Gm-Gg: ASbGncuHvXoigm1md9r0hwRo/pjkS03mZkBIe3xdJe7gwoTswqJWEdfRXzIkoUHOyTf
	/y524q+227JXrA5HkmGAF0tmk4u5G/2YsQDc04kBKfJlHF6AlIfkCCgEMe7J5dIClf9IaTA2xlE
	l5mFhS8dwNW0NusQoONqz+ap+w1d37qv5WivoQp/jlTc8FQSlKxb32FF9BfQn+gidMxBsSUYyoF
	htIfDnUgzknLQF+BKWyq8zqgFr5ua2vJoYKXbWPhvg81dpegoJCKhVK2F9xjXzxUH9uUKl/nqY8
	1kOFA8c6m+wb4q3o
X-Google-Smtp-Source: AGHT+IHrGSeffXI0VYRSl9GnvlywdVwYqlOpNJ0nBajlzAmynsAYh/0Dr6x3Qk/EjEDEI+gdM/HEVQ==
X-Received: by 2002:a05:620a:430e:b0:7c5:65ab:4ff2 with SMTP id af79cd13be357-7c7a76c3ae3mr127180985a.46.1744246678606;
        Wed, 09 Apr 2025 17:57:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f9938sm8543585a.69.2025.04.09.17.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:57:58 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:57:20 +0800
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
Message-ID: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>

On Thu, Apr 10, 2025 at 08:54:51AM +0800, Inochi Amaoto wrote:
> On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> > On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > 
> > > > All register operations are done through regmap to ensure atomiciy
> > > > between concurrent operations of clock driver and reset,
> > > > power-domain driver that will be introduced in the future.
> > > > 
> > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > 
> > > I have a few more comments here but I think this is getting very
> > > close to ready.  You addressed pretty much everything I mentioned.
> > > 
> > > > ---
> > > >   drivers/clk/Kconfig               |    1 +
> > > >   drivers/clk/Makefile              |    1 +
> > > >   drivers/clk/spacemit/Kconfig      |   18 +
> > > >   drivers/clk/spacemit/Makefile     |    5 +
> > > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > > >   13 files changed, 2348 insertions(+)
> > > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > > >   create mode 100644 drivers/clk/spacemit/Makefile
> > > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > 
> > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > index 713573b6c86c..19c1ed280fd7 100644
> > > > --- a/drivers/clk/Kconfig
> > > > +++ b/drivers/clk/Kconfig
> > > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > > >   source "drivers/clk/sifive/Kconfig"
> > > >   source "drivers/clk/socfpga/Kconfig"
> > > >   source "drivers/clk/sophgo/Kconfig"
> > > > +source "drivers/clk/spacemit/Kconfig"
> > > >   source "drivers/clk/sprd/Kconfig"
> > > >   source "drivers/clk/starfive/Kconfig"
> > > >   source "drivers/clk/sunxi/Kconfig"
> > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > index bf4bd45adc3a..42867cd37c33 100644
> > > > --- a/drivers/clk/Makefile
> > > > +++ b/drivers/clk/Makefile
> > > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > > >   obj-y					+= socfpga/
> > > >   obj-y					+= sophgo/
> > > > +obj-y					+= spacemit/
> > > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > > >   obj-y					+= sprd/
> > > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > new file mode 100644
> > > > index 000000000000..4c4df845b3cb
> > > > --- /dev/null
> > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > @@ -0,0 +1,18 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +config SPACEMIT_CCU
> > > > +	tristate "Clock support for SpacemiT SoCs"
> > > 
> > > I don't know the answer to this, but...  Should this be a Boolean
> > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > clock driver built in to the kernel?
> > > 
> > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > without clock built in as it's such critical..
> > 
> 
> I disagree. The kernel is only for spacemit only, and the pinctrl

Sorry for a mistake, this first "only" should be "not".

> should also be a module. It is the builder's right to decide whether
> the driver is builtin or a module. In this view, you should always
> allow the driver to be built as a module if possible.
> 
> Regards,
> Inochi
