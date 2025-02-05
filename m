Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164C015198A;
	Wed,  5 Feb 2025 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758454; cv=none; b=AyxA6WvHypZowqYWv3gik3E2HccB7HKtcaO9+Y8Jxf2ARwzkJJETN6UGekVJ6i+VJZO12+H6pyE+asUZLz6luaom1ZmE1IFUmDjbrsjpkrUpSYLYdrvy+6FLUhBfDnU9LMASvoVPb9kA+E8Rbw5SgHOik3AEW6tAcHU6dEJncmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758454; c=relaxed/simple;
	bh=Hv+9xYQ9CAGfmXnWvUtaY/aBiYCQlbRi5+XZwb6tiGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeajkpC1E5UbGBPdfibkiYFndtB/pq3bZPKheJK8NU3IWUETFqzgGvEk4rMNb08sbJgdB1+MTa+G7XPY1n8AzPZdwAhoX8aP2bNxoQIUgFyJpI461Tqd+Q5t26Z85xk7YYnOvF6kRu76twvMF8SwSdHldKGC+hFeJbdnZbPHAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wLB2Lsgu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wLB2Lsgu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1340C4CEE2;
	Wed,  5 Feb 2025 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738758453;
	bh=Hv+9xYQ9CAGfmXnWvUtaY/aBiYCQlbRi5+XZwb6tiGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wLB2LsguuDjrJK4Diz4d/2AQQANLOS821Tq9RcqF8B43gfkWg3C1w+jlaEBMRd7n9
	 Y9g2YOzeiIKW/BE5zgGF87bJ95uTkcuTto0Va4MG8v9dukxSd4mgmlKCsPEpbnHj9c
	 Mcs78Xu2aFHFVM65F2sb4tEebAQTsKqs7pqvWp84=
Date: Wed, 5 Feb 2025 13:27:30 +0100
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
Message-ID: <2025020505-harsh-divisibly-51cc@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-overstock-scheming-6a30@gregkh>
 <20250205101916.GA4083@nchen-desktop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205101916.GA4083@nchen-desktop>

On Wed, Feb 05, 2025 at 06:19:16PM +0800, Peter Chen wrote:
> On 25-02-04 12:09:15, Greg Kroah-Hartman wrote:
> > The usb_phy_generic code was creating a "fake" platform device to pass
> > around in different places.  Instead of doing that, use the faux bus
> > instead as that is what is really wanted here.
> 
> Hi Greg,
> 
> As far as I know, there are some platforms use the device-tree to get
> the system resource (eg, clock, reset, regular) for this driver.
> We may not use fake bus for this driver.

But there is no system resources assigned to this device/driver at all,
so how is it getting anything here?

> $grep -rn "usb-nop-xceiv" arch/arm64/boot/dts/*
> 
> arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:649:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:275:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:285:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/freescale/imx93.dtsi:238:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/freescale/imx93.dtsi:245:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/freescale/imx8mn.dtsi:1321:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:149:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:133:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/cn9132-db.dtsi:30:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/cn9132-db.dtsi:44:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/cn9131-db.dtsi:33:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/armada-3720-db.dts:43:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:49:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:53:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/cn9130-db.dtsi:52:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/cn9130-db.dtsi:66:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/armada-8040-db.dts:53:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/armada-8040-db.dts:67:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts:36:		compatible = "usb-nop-xceiv";
> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts:39:		compatible = "usb-nop-xceiv";

Does this actually work at all?  There is no real resouces here that I
can see, so what am I missing?

thanks,

greg k-h
