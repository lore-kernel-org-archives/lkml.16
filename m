Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9991B7F4;
	Thu,  6 Feb 2025 01:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738806902; cv=none; b=cueX3a3dhWcW9Bm+G/4hHsxD0TmT++/czq/WhwHETx9DH/uTc8D6BkMS8g2RMkWHO0MLQFDm2tmBmsHW6p74w0c2ba1Lm06BWoEJJxdGLOZGVssnYVZPOLC3XUqoTL+WCPbdLMZspBQViLhiwpS1rE1cbQr97UTHZquJ5XRmbMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738806902; c=relaxed/simple;
	bh=z8xrwFksfvCtNtGLyJB+rxC8Tia8v/YyC+/1zgZPhj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc5TaOyHHuymqG+itBYVbJEal7R6hb49YVwWSiRHvD8sJUfNvmWExWtPihnPb7vmG91/ObMtWST9ucGF1UQYKaFZS6Tqlq4JJjmP7/KZHBR8ldn9+EE/IXO+zhUZOv2uCmPiX95UvgHJ+aIUOaE5Yx/mDW82aPwBnqWxd/283HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ko6t6qFU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ko6t6qFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D12C4CED6;
	Thu,  6 Feb 2025 01:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738806901;
	bh=z8xrwFksfvCtNtGLyJB+rxC8Tia8v/YyC+/1zgZPhj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ko6t6qFUhtziZm7zSWjJCHoMDlpMAjoXtdO6KBcMBmVlNQdIEnWhhwXZRSEgkIluV
	 hzM9XnGndRpBpA/BN3CQF10xrTYlpOJqHeqqnorPEvklH+EgskjLc7AVp0DASjhe9s
	 2EjX95rMdxeif3C1KPsJPIzxlyyUjUlukqYfet/0Ap914muXUemX1FL7hN0sth1dpi
	 NhttEVyJi1rv4fhOPSfPG8pKRB9tqVBbfnNw7FMIMf2UeoR/Z9UWV/tnfUak8PM7wp
	 XRWBQTeFwH8I1ZS+meptKwFDMUV685Hpq+wvR02RCgSmw2bL2dzcNyFG3/Hy57yubz
	 TASw6b4eO/jsw==
Date: Thu, 6 Feb 2025 09:54:52 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <20250206015452.GA20613@nchen-desktop>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-overstock-scheming-6a30@gregkh>
 <20250205101916.GA4083@nchen-desktop>
 <2025020505-harsh-divisibly-51cc@gregkh>
 <2025020509-imperial-maroon-1bc9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020509-imperial-maroon-1bc9@gregkh>

On 25-02-05 14:41:31, Greg Kroah-Hartman wrote:
> On Wed, Feb 05, 2025 at 01:27:30PM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Feb 05, 2025 at 06:19:16PM +0800, Peter Chen wrote:
> > > On 25-02-04 12:09:15, Greg Kroah-Hartman wrote:
> > > > The usb_phy_generic code was creating a "fake" platform device to pass
> > > > around in different places.  Instead of doing that, use the faux bus
> > > > instead as that is what is really wanted here.
> > > 
> > > Hi Greg,
> > > 
> > > As far as I know, there are some platforms use the device-tree to get
> > > the system resource (eg, clock, reset, regular) for this driver.
> > > We may not use fake bus for this driver.
> > 
> > But there is no system resources assigned to this device/driver at all,
> > so how is it getting anything here?
> > 
> > > $grep -rn "usb-nop-xceiv" arch/arm64/boot/dts/*
> > > 
> > > arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:649:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/freescale/imx8mm.dtsi:275:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/freescale/imx8mm.dtsi:285:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/freescale/imx93.dtsi:238:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/freescale/imx93.dtsi:245:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/freescale/imx8mn.dtsi:1321:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:149:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:133:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/cn9132-db.dtsi:30:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/cn9132-db.dtsi:44:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/cn9131-db.dtsi:33:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/armada-3720-db.dts:43:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:49:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:53:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/cn9130-db.dtsi:52:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/cn9130-db.dtsi:66:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/armada-8040-db.dts:53:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/armada-8040-db.dts:67:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts:36:		compatible = "usb-nop-xceiv";
> > > arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts:39:		compatible = "usb-nop-xceiv";
> > 
> > Does this actually work at all?

Yes, at least for some NXP i.MX series SoCs, these SoCs use chipidea IP.
At above device tree files, the USB generic PHY device node has enabled,
so the device will be probed and get hardware resources.

During the chipidea core driver->probe, it calls this generic USB phy
driver's phy.init and do some actual hardware operations.

Peter

>> There is no real resouces here that I
> > can see, so what am I missing?
> 
> Hm, maybe I got this one wrong, I'm getting build errors now from
> kbuild, let me go look into this some more...
> 
> greg k-h
