Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4E246347;
	Thu,  6 Feb 2025 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852098; cv=none; b=A4IETlwsGFpw1ImQuIpBJXibolaGRpXp8vCcUp2SPNs8Mlx0HQRMX8/OjGXVRfgNts6cdX55sUrsJS7IP6wl43gbuBZ6ovSenTO5jUvUsZotV6oAdi36LYwxJJFwpvUBCaRkc/gFwrKq9mK3kjOnWIRWfWqqkAdjImaNTWqXMhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852098; c=relaxed/simple;
	bh=FGezJSTQ5loPva1WVPOLm0m15qrrylz37wr6Aolb4rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTabdWqmDw/A0uBYBdJ/ISOWteQGsFfj08Xev0D5yZqu4I2hN+MaET5pzdmpLlrY23F1zg9xfshY3ThncQwgjTWDxCb0YiGBblTqRq6M3XEKLTu5WMYhdvjYLxWqYYH2AGZzb/ETpWw48TJEAVy26bmX/Gvjzp61mVsIBlakr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0hYV0j17; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0hYV0j17"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE32C4CEDF;
	Thu,  6 Feb 2025 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738852097;
	bh=FGezJSTQ5loPva1WVPOLm0m15qrrylz37wr6Aolb4rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0hYV0j171TDpX0CRnCPaUB/bpfbZ7/bDQJ8AHZUBSQRGKPIBIGuGq/ujTrZ+8HyKC
	 i9sTupbt1fkwQq83/9jgmSVND7GFyi/Mbn3VJ8bAx0LW/4pClZ/qTgG0K6Oila+156
	 SMbpEXXpyf+X+RxGOxkhSvOMeDg4CIEnOpRkmpMo=
Date: Thu, 6 Feb 2025 06:46:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/5] USB: phy: convert usb_phy_generic logic to use a
 faux device
Message-ID: <2025020622-porous-possible-847c@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-overstock-scheming-6a30@gregkh>
 <20250205101916.GA4083@nchen-desktop>
 <2025020505-harsh-divisibly-51cc@gregkh>
 <2025020509-imperial-maroon-1bc9@gregkh>
 <20250206015452.GA20613@nchen-desktop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206015452.GA20613@nchen-desktop>

On Thu, Feb 06, 2025 at 09:54:52AM +0800, Peter Chen wrote:
> On 25-02-05 14:41:31, Greg Kroah-Hartman wrote:
> > On Wed, Feb 05, 2025 at 01:27:30PM +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Feb 05, 2025 at 06:19:16PM +0800, Peter Chen wrote:
> > > > On 25-02-04 12:09:15, Greg Kroah-Hartman wrote:
> > > > > The usb_phy_generic code was creating a "fake" platform device to pass
> > > > > around in different places.  Instead of doing that, use the faux bus
> > > > > instead as that is what is really wanted here.
> > > > 
> > > > Hi Greg,
> > > > 
> > > > As far as I know, there are some platforms use the device-tree to get
> > > > the system resource (eg, clock, reset, regular) for this driver.
> > > > We may not use fake bus for this driver.
> > > 
> > > But there is no system resources assigned to this device/driver at all,
> > > so how is it getting anything here?
> > > 
> > > > $grep -rn "usb-nop-xceiv" arch/arm64/boot/dts/*
> > > > 
> > > > arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:649:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/freescale/imx8mm.dtsi:275:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/freescale/imx8mm.dtsi:285:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/freescale/imx93.dtsi:238:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/freescale/imx93.dtsi:245:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/freescale/imx8mn.dtsi:1321:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:149:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:133:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/cn9132-db.dtsi:30:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/cn9132-db.dtsi:44:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/cn9131-db.dtsi:33:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/armada-3720-db.dts:43:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:49:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:53:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/cn9130-db.dtsi:52:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/cn9130-db.dtsi:66:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/armada-8040-db.dts:53:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/armada-8040-db.dts:67:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts:36:		compatible = "usb-nop-xceiv";
> > > > arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts:39:		compatible = "usb-nop-xceiv";
> > > 
> > > Does this actually work at all?
> 
> Yes, at least for some NXP i.MX series SoCs, these SoCs use chipidea IP.
> At above device tree files, the USB generic PHY device node has enabled,
> so the device will be probed and get hardware resources.
> 
> During the chipidea core driver->probe, it calls this generic USB phy
> driver's phy.init and do some actual hardware operations.

Ugh, that's not obvious at all.  The usb-nop-xceiv match with
usb-phy-generic is tenious, but yeah, my change here broke this code.
I'll drop it from the series, thanks for the review.

greg k-h
