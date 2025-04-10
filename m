Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5270800;
	Thu, 10 Apr 2025 01:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744250157; cv=none; b=f3RHg2wkPMJQRQ0LncgmWpSLsF/4GIPl9LBphGZmk/rbJwzRfiBQgqO37r+AKCrPQCp+KmKHI2o+hKG7RMQFZh8xrmL+bcrUTp+C5X2+ezlgXDGKgRp3JYrE+mlRxsRY0eZdhTxX5tq3zphiPAgH0iwu36akOKDix8XxpJTd3HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744250157; c=relaxed/simple;
	bh=XmaKd+S/DqswSqfYVPzLG9jI4c9YIGnYHhOZDkKiBnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCNot3np1gYK50YJJnlMmCvgTo/OwEraqcWdrVYbqlICvku+kQEqk6MyWxrZA2DrbyZAjym6Bxgrb2x/PXs/d5KPvc6HQtZc90zdtFLJ0hIiNrlkZw/GMq3EiBScLLKLkFrApRou8o4YYGslhN0vnSxfgLopiW27141q6o8ngOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3882934322C;
	Thu, 10 Apr 2025 01:55:53 +0000 (UTC)
Date: Thu, 10 Apr 2025 01:55:49 +0000
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
Message-ID: <20250410015549-GYA19471@gentoo>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>

Hi Inochi,

On 09:20 Thu 10 Apr     , Inochi Amaoto wrote:
> On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
> > On 4/9/25 7:57 PM, Inochi Amaoto wrote:
> > > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..4c4df845b3cb
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > > @@ -0,0 +1,18 @@
> > > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > > +
> > > > > > > +config SPACEMIT_CCU
> > > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > > clock driver built in to the kernel?
> > > > > > 
> > > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > > without clock built in as it's such critical..
> > > > > 
> > > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > > Sorry for a mistake, this first "only" should be "not".
> > 
> > This is a general problem.  You can't make a bootable
> > SpacemiT kernel unless you define this as built-in (at
> > least, that's what Yixun is saying). 
> 
> Why not putting the module in the initramfs? I have tested
> this in quite a lot of boards (Allwinner, rockchip, sophgo,
> starfive and etc.), all of them work well.
> 
it works, but not optimal, why delay clk initialzation at modules load stage?
IMO, it brings more overhead for using initramfs..

but there is always tradeoff and bikeshedding..

> > But we'd really rather *only* build it in to the kernel
> > for SpacemiT builds. You clearly want to minimize what
> > must be built in, but what if this is indeed required?
> > What goes in defconfig?
> > 
> 
> As defconfig is more like for a minimum example system. It
> is OK to put a y in the defconfig. But for a custom system,
> you do give a choice for the builder to remove your module
> in non spacemit system.

I get your meaning here to remove/disable at run time stage, while
we do provide compile time option, if don't want spacemit system
just disable CONFIG_ARCH_SPACEMIT I mentioned, clk/pinctrl will be gone

anyway, I'm open for this, make it tristate do provide more choices,
and it's probably better leave users to decide..

Ok, I'm fine with leave clk as tristate with proper default deconfig,
but if people want to pursue more to make more driver(pinctrl) modulized
feel free to test and send patches, I just won't put efforts myself.

thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
