Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACA513F434;
	Thu, 10 Apr 2025 03:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256869; cv=none; b=lRnvQ1LtAL1y1AfK8rRrr8wpwy32RJqGnZJqLnifnHJvpuIbJFQ6fxh5CkgekP8OZzwMERB0GqLEMRbsrtXXtHRHcuvfarsDPavC8c5TQqZPt5etYOFwOx7X8vVljq6Kt+xssaYT2QH2aCEqXzHbN3ajxFWN0as9PdE7XVO/6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256869; c=relaxed/simple;
	bh=8BXdnXUZJhaBm/iK86CU2W0BqVu6Jkde/ochweChcTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KglYvWpNdieDVjBcOB57fPxPRMG4OABN2xAVxjUIU5knGLZb8EDl3dYdlUF8YO/qgNMxlgAJBiKiTJs2w6nsUtj86zZhJQ42bIW1dlMvVdhIFgsCQ7rs4GgqCiqmZlTuAhU2ggCW5VPWk0poydaae6Me0DF+RapXJVepdNGmPsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekBLXc1X; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekBLXc1X"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5ba363f1aso55886285a.0;
        Wed, 09 Apr 2025 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744256867; x=1744861667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl2Sw4bxxEHiJQNxloPaBGado/8eDTdeu7twZOJULCU=;
        b=ekBLXc1XIkqkuJ4wJje8blmRG0Z8JENjpWP6rDCenCbezc2mD0voMdbZJ2fDHYj4Oz
         4slCYAVFjgOELNgc9OZ89XiPShdCz8tIrSE53aXRs6nhxOVYtnXu93w3ry3ANI0DjNCI
         Pcx5SVY4p2sLn9+y4JHNHvgBwI46Eb4a+XdShxStwXqDm5UbEU5KmYYkK/RMv3LuInhA
         FHE0agfnSiHBJKkKRO2jg25iesllx3IUyL+3p+4Ez5BD0vez6MlXlQqVgNgnrZx7A8rT
         oWs/2LYCTwB+NiBimDk//gxjWNrV8UuPFuUwouivahejjxquNOJsGXFy1LUpjt9wTlLs
         /e/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744256867; x=1744861667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl2Sw4bxxEHiJQNxloPaBGado/8eDTdeu7twZOJULCU=;
        b=La4HbMHVViYYx3tqwWYWge3tQrASE1lIo/19eJHufVsAGKLmZdWGpfQBA+MtuzC4lx
         jCPWvaLKm/ncLFR1HdlhPVlCr0+QDMQX9kpSk+C11rHhfYn/y7XC+tRtoA7aFf6eT4dw
         7aL05Y3KgN17NG8NOKjeLfDgj87jxLlC4nX5hdXzbUJs5BFDmRPNLFfmJPIurgKziln+
         7uzpqeFgzYp+tHd7ZTVKIUUklqF5p2P4hAGCWoYMkygQBz32W5l26c1L/paI+TB80W0D
         pjogMiepHat3Y3JF0xBCLaX1POsgpoDhZ6dgargh2U/r4pIf3yQViZigL2Fvel8czpvN
         d5zA==
X-Forwarded-Encrypted: i=1; AJvYcCV7SP1bcAZiCrSlE3XCtzjamJW3Nfwda19Sh7M6qqke9YgO0uorkQciO6+x4UcjWddAIviW6rIabQ/O@vger.kernel.org, AJvYcCV8QzU1EVa4LySvHqgpOEqFR3emvsJ0PBqETE67cS9qpAdM0QF3L36EQP6Zj+7zRROFUI7MPupbgH1JwTB6@vger.kernel.org, AJvYcCXeb/V/K5rk4HXBlgW+WCZNTdxYuv69aG7VB81QV9/w0liaXJEtiIpwPq4CoJbIiRknhd9AnxpMe7rh@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkMsy4CJW6GmkSWZcmS5OnBzhBCsBrqa3r20g/iiC9bK4uCmO
	SI+Q2kr+U/p2+wnvVpXeqXh+wR1WlvqA0ea/TbsEYiH3Mu2q4MfY
X-Gm-Gg: ASbGncui8dzi3SauqbOCyogctD4FjMLeF3gX5enAKVlSHDWhPy2czGT1UBCK9C2PVi/
	aYwe7/f5s3OtZLWG5/GrS9KmeDU9eg6noEhsJqtWUE5oACGTa15XWgxYNntZmTMUMIvoq4E7GXN
	eqpTjh8WR2jySEI5XXM9jvU9FC/YqBc7qUHbVn+6hf8/L092fz7Pm2Gp0/9lAK5ps9M0y2Pt11V
	EOhlSNYDe0Sta4+cH73hBHI1KMux1f2xKryqJDUXL91iyItkHNBEacTGBcWiTWWztRj5hGr/nqX
	59Duqn+jP2DMM9lp
X-Google-Smtp-Source: AGHT+IHFC2Rk9C/yn6FcOPV21K6GfuBdCrrACTPvQR733CaBYV/6ZYW0J+2NXRDP1n9a2LO4HgQDkg==
X-Received: by 2002:a05:620a:2943:b0:7c7:a555:4a11 with SMTP id af79cd13be357-7c7a76c22dcmr202020785a.44.1744256867149;
        Wed, 09 Apr 2025 20:47:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942eecsm27221785a.17.2025.04.09.20.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:47:46 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:47:07 +0800
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
Message-ID: <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410015549-GYA19471@gentoo>

On Thu, Apr 10, 2025 at 01:55:49AM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 09:20 Thu 10 Apr     , Inochi Amaoto wrote:
> > On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
> > > On 4/9/25 7:57 PM, Inochi Amaoto wrote:
> > > > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..4c4df845b3cb
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > > > @@ -0,0 +1,18 @@
> > > > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > > > +
> > > > > > > > +config SPACEMIT_CCU
> > > > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > > > clock driver built in to the kernel?
> > > > > > > 
> > > > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > > > without clock built in as it's such critical..
> > > > > > 
> > > > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > > > Sorry for a mistake, this first "only" should be "not".
> > > 
> > > This is a general problem.  You can't make a bootable
> > > SpacemiT kernel unless you define this as built-in (at
> > > least, that's what Yixun is saying). 
> > 
> > Why not putting the module in the initramfs? I have tested
> > this in quite a lot of boards (Allwinner, rockchip, sophgo,
> > starfive and etc.), all of them work well.
> > 
> it works, but not optimal, why delay clk initialzation at modules load stage?
> IMO, it brings more overhead for using initramfs..
> 
> but there is always tradeoff and bikeshedding..
> 
> > > But we'd really rather *only* build it in to the kernel
> > > for SpacemiT builds. You clearly want to minimize what
> > > must be built in, but what if this is indeed required?
> > > What goes in defconfig?
> > > 
> > 
> > As defconfig is more like for a minimum example system. It
> > is OK to put a y in the defconfig. But for a custom system,
> > you do give a choice for the builder to remove your module
> > in non spacemit system.
> 
> I get your meaning here to remove/disable at run time stage, while
> we do provide compile time option, if don't want spacemit system
> just disable CONFIG_ARCH_SPACEMIT I mentioned, clk/pinctrl will be gone
> 

I think this is not suitable for the most generic case, Especially
for distribution kernel. They prefer to set almost everything as
module, and load necessary module in initramfs, but the thing is as
you said, it is a tradeoff. So I will wait and see whether there
is any new voice for it.

Regards,
Inochi
