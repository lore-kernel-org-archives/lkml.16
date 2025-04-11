Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A822127B;
	Fri, 11 Apr 2025 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391669; cv=none; b=uJfWjATsJZAGGHyTnGtx1sQi8IFKuOF3OucJCB3jcSRh3JwOySHATNFmkJ4ynKJghnnLJVa5zoOn5TXmkOWhHf2LicWP1+kIwi9L1v+iDy/d3Kpa5GlWX5Xxi73JbnwY9R9rzeY0t1fzvYwsS1EEc0KT8bpTHQ9lk+qH4DMFMDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391669; c=relaxed/simple;
	bh=peTZfiU/FGMDTElzr14TAHqTpKsRGqP+lSXjLYFmdSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzAnMhtScubzi11yolJIaFcEitfj7qIZRWCpN93XzyDebEBIu0rT4T/edA8R9E/9kBJjkRURkSk6EeT0WglhlduLUjqqWD65QAv0rIRrvx0LH/qKsjm9nKELhz+NPR41fmjNbQh8AZtTbH6NANukeXIlwMaJifwvfJKyoDrscWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIoY5Z6g; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIoY5Z6g"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so3067192a91.3;
        Fri, 11 Apr 2025 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744391667; x=1744996467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZtmV9TuWbxyWvjRy9KTH0D/rkWddSzW49m1b9NLvBg=;
        b=BIoY5Z6gr5Y5OnBEvNZwGJTdIHGt97rJhakbXHnOW/y/aexlcRi5pfbuay9gL8A2zT
         Ro0MfxRrir97qWx2/Y33+1RgbavsTAK7A3zrEzPSAlun+cZLIuMeRPVmTNWNaVs2N+5o
         6vHXEaAo94qE7mmHOax4V6JR4TMJXqmHWdFoFCdaaRdCz6/AP33Z2utKHybjy0lU/7jb
         26Fp13GwPhANU4+LFkwCRk+//1q0sKY8KSw4QaEQ+Lww7n2LkLsxsFM2Bage1NJoLW06
         bGidk4pxW++YszMxh+fSEy31QPNAvEYh3177oHOEX1jo3Ri87v0nCkBxCZryo1kkbW/T
         boGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391667; x=1744996467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZtmV9TuWbxyWvjRy9KTH0D/rkWddSzW49m1b9NLvBg=;
        b=luEvXJ2KpZAotffbZAgr/oPLniOedqDDy+bBmvj0/VnLkkndTzghO0wVcg+rwXEEdu
         cq5SR65HN7mV+pYUfUBXt4DBv13RWSmcA/nXxmgBM9jvmvPl/wzYZn0B0FE9p1nZuipZ
         JkkUBdLEWJsr4Sl8YgOJFc8/uLQiWyFs8XB8eIhQb42vKlGOuOmV1yyuQGPXW+KjcQnC
         meZlzD9sxQvhTMkdwZgvNla+39CM5YjO3po7praO7tYWoB8uinbTAY5bnLqHDnPEu8xz
         MghPrGzUA4/ov7qauOabqwnh0pNS1UTVVhktKZvuV/ABvnYzNjxS8wlRCZtKPXgITwf5
         RBGA==
X-Forwarded-Encrypted: i=1; AJvYcCWUD0tdmyEUYraYeSfu2rkKyIW90lFR9pfGclDOeJjw5mOgh5kyzOvNwvFC9q7ZVxH1M4hhh29PlnEP@vger.kernel.org, AJvYcCWgNMjrCF+/1ozilIxRF3VhOZUwwph7576vxSzUesaFFlTmvM5UVnfRoaFGbh/yhfGi15l0GyIqQA4rW2Q4@vger.kernel.org, AJvYcCXNP+xnF2mVyeUemOLUCwRMDARD8ZCLAD/jNnAuoDEzWc/41LHN26EkfcTPIv5fjwX/zl9DauPjzk4D@vger.kernel.org
X-Gm-Message-State: AOJu0YwrYCwiNGEBTOL4sxytllWpsClgOIZIwOgOy/ZNj6IjVTxZgQtu
	fEMPABvf6aFkQloGiviYZkWBzHvZ0N9SKv+tHrv9CrPIg3Va78L4
X-Gm-Gg: ASbGncvWGAkjOFSBLQ11KwGuRw4C2h4oFB6C55BZINRMCjjtdj1xyxm3H+KYrX861zf
	cwyORBNJx4FPVf6xhu82eAYO/0UmFOT3MY06m02eIiMpfOUQOZgmCqye7KBbrdQs79MnWb6s6WA
	G4PhMVIhMp4jqZu6ZMZla0WZZTd0DaPv+6VOkYYtfnWAXvOnUPr0v+bHtHX7hBJVnBZHYs2+Mz9
	QXmfA6+Rjdv3lSSYtDdgh+5Ly1xfw+s3x5K5zpX18PXBPXowevS4jdriBTuXU/bBv+Ld4ja0WJQ
	9eq4RTiqoJppjbhDVA5cBr/LgvTLTrs8DYhaj8K7
X-Google-Smtp-Source: AGHT+IEUJgIKcaUb8JEq+V2aIJnLrL/NN4PAPW6tR0kpm23V60WZyUoVVsASzUds8R6wJCjRp3i5mA==
X-Received: by 2002:a17:90b:2811:b0:301:1bce:c25a with SMTP id 98e67ed59e1d1-30823646472mr5126875a91.20.1744391667339;
        Fri, 11 Apr 2025 10:14:27 -0700 (PDT)
Received: from localhost ([5.34.220.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171954sm6049259a91.38.2025.04.11.10.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:14:26 -0700 (PDT)
Date: Sat, 12 Apr 2025 01:14:22 +0800
From: Goko Son <goku.sonxin626@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
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
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Goko Son <goku.sonxin626@gmail.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <Z/lN7qrISpbK6MQY@goko-w.tailce6c49.ts.net>
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
> anyway, I'm open for this, make it tristate do provide more choices,
> and it's probably better leave users to decide..
> 
> Ok, I'm fine with leave clk as tristate with proper default deconfig,
> but if people want to pursue more to make more driver(pinctrl) modulized
> feel free to test and send patches, I just won't put efforts myself.
> 
> thanks
>
Hi Inochi, Yixun

I'd like to volunteer to test if building pinctrl along with clock
as module is a feasible way, and will send a follow-up patch if it
works, thanks
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55
