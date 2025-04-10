Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF61F4E2;
	Thu, 10 Apr 2025 04:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258068; cv=none; b=u7/MoXkPuN3ej6XpQQEHgksn3hDVU7s6yeBYkYh0dnAj3uWEwpXSy8Enr/7zFeqpNSOoLV8j4OZXGppWcAZpZaF81rFZgC1JeTTkiluCg0aR+2D7zDFZBDOKwbPKmQkk4Q+EnzoCCpEObgTX6cEhWwUvcSqFM+QF3QDYNVoc8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258068; c=relaxed/simple;
	bh=6X8CIRzu/7C0i9tpkQQDyN8gtCt7xELDMOU+oJyN9yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ6Gt0MjL12L4E4oCNdgwNppEWxHVsvstdqopIryYBwS7wpf58svg96fWMMMxbYNOCz56ACcp7Lx8c3Gx7jsL/2ht2PHYedmPUcSmsnQaYG1FB3MhOHn42HVLdkElJWbGmK+Giksg0vxPgiix4szzFCT/t5NmzFWNeOVQlILAQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=ODE8xmaZ; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=IT1yWtxB; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="ODE8xmaZ";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="IT1yWtxB"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 99EB112FB451;
	Wed, 09 Apr 2025 21:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258065; bh=6X8CIRzu/7C0i9tpkQQDyN8gtCt7xELDMOU+oJyN9yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODE8xmaZpaM2vx6KXzglfkYZGQRpncMebes4iBfHIZ1+NKkbesT1cbYtSEgfSc0mb
	 IAS7beaF22YkL1GlWX1DgEil7138L1fhsZe/2nJC1+p1KCrMp5/5ArIbo0UhZbsdOX
	 8M6BNtRJ8uE1djCeQLJF5KPngnoMHABCzl2UzR9XrlxKnilPbdVOEHcfD2L6yHb1h9
	 2NCXGgi4TH9ABBPURtS+vBvJPLBYlEHJ8kZUb8wHwdGIMfdmCQGXfCNfGqGAcNj/GA
	 YzSiR3r1TZrOGCxvsNCEDkvDgMsuQyUOhF+LN3iVxh4ZFQCgzOtCy4e0tVEsIyQOIW
	 PXmqqg9GbhutQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfdSQCvaCpS6; Wed,  9 Apr 2025 21:07:43 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 7D41112FB430;
	Wed, 09 Apr 2025 21:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258063; bh=6X8CIRzu/7C0i9tpkQQDyN8gtCt7xELDMOU+oJyN9yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IT1yWtxBWJHexa920HMgFACR6jjj/Rfv9SnqyVrWjx4HCeEg9SeC0plLOjUmWrxXs
	 1CgJRdqM7Icyj+s5A/Wd+rYX/6NPrRyqRHY96aez2BrpUZfOCshuYR0sUSWUs1srXg
	 yKgUw148SUaNi/IPnangfzT4ml21TYXWA1a1oJTcLCmacP6xIlriRECZN9oI6dyZaM
	 heSSOm1Cfr3N2usxnrFFZuIfaOn6iq69QdvCVbD8e2CnPdtIwcqgPo2DarmiA14FUx
	 8qzhtlc48s+xNxLC5Yx4q8tBYziW53OnEN9IBXCtidId+N6YeZDIelp1I5SCNImWlB
	 sS06RCtmkI7og==
Date: Thu, 10 Apr 2025 04:07:35 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>,
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
Message-ID: <Z_dEB4tfWO9KiErA@ketchup>
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

This is also my original consideration.

> it works, but not optimal, why delay clk initialzation at modules load stage?
> IMO, it brings more overhead for using initramfs..

For distribution maintainers and users, keeping stuff buildable as
modules shrinks the sizeof kernel image, which I'd like to see. Thus I
won't make the entry boolean.

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
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

Thanks,
Haylen Chu
