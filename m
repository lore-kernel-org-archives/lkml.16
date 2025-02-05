Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD9126C18;
	Wed,  5 Feb 2025 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762895; cv=none; b=Y9ucAf4vcqe2+v0FZDnYFlT6JofKOhGt15a0rLeb3gdqoZUQ3VbTWZKpg4lyvB6qUSs+nl8f0dLwsSCggOo+/tHGuaImvwpCojrQmhbnDIqqf+b/TAztb/RKdE4P8w0lJCPxVhGPycC2WYd435Z5mU6dbiCIyuPJN+o/VtNMa4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762895; c=relaxed/simple;
	bh=U7Js62AsEd21eUFkVDcJZEIJ38W1+b5iygkxCIM0T/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNP2JekQsz9AHvSfUcHIDlTc6rcFa88tebETkKmhm2SQklQyTDuXcIBmW6CL5hBv6naxzLZYeo0BMQMxJ2l1MQ6DxuzdI7yEYESkTsKHX6bJHr4Bd7d1G1iz5ipUVbxtMl8RcU6F+H6qDEcp0fzj2yZzrYgJmsPFNV6LMqGstrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ipc43YHY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ipc43YHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546CBC4CED1;
	Wed,  5 Feb 2025 13:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738762894;
	bh=U7Js62AsEd21eUFkVDcJZEIJ38W1+b5iygkxCIM0T/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipc43YHYKI5ichfkTqCIKfXGjwrQzPBdiEP/txhS0RBTd7ClzPjqn5LEWh4GL8ysx
	 D6XQLB8os7Xgd6DB1B6CCAjNGHs2tbPYwI6k6B3aH8xLtf4JD0/T8DJE/DGKPMZvvD
	 9Ba03/ZHI1jvrexIUnYsr+j/O0iph6v9O0biyuL4=
Date: Wed, 5 Feb 2025 14:41:31 +0100
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
Message-ID: <2025020509-imperial-maroon-1bc9@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-overstock-scheming-6a30@gregkh>
 <20250205101916.GA4083@nchen-desktop>
 <2025020505-harsh-divisibly-51cc@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020505-harsh-divisibly-51cc@gregkh>

On Wed, Feb 05, 2025 at 01:27:30PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 05, 2025 at 06:19:16PM +0800, Peter Chen wrote:
> > On 25-02-04 12:09:15, Greg Kroah-Hartman wrote:
> > > The usb_phy_generic code was creating a "fake" platform device to pass
> > > around in different places.  Instead of doing that, use the faux bus
> > > instead as that is what is really wanted here.
> > 
> > Hi Greg,
> > 
> > As far as I know, there are some platforms use the device-tree to get
> > the system resource (eg, clock, reset, regular) for this driver.
> > We may not use fake bus for this driver.
> 
> But there is no system resources assigned to this device/driver at all,
> so how is it getting anything here?
> 
> > $grep -rn "usb-nop-xceiv" arch/arm64/boot/dts/*
> > 
> > arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:649:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/freescale/imx8mm.dtsi:275:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/freescale/imx8mm.dtsi:285:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/freescale/imx93.dtsi:238:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/freescale/imx93.dtsi:245:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/freescale/imx8mn.dtsi:1321:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:149:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:133:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/cn9132-db.dtsi:30:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/cn9132-db.dtsi:44:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/cn9131-db.dtsi:33:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/armada-3720-db.dts:43:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:49:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:53:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/cn9130-db.dtsi:52:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/cn9130-db.dtsi:66:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/armada-8040-db.dts:53:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/armada-8040-db.dts:67:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts:36:		compatible = "usb-nop-xceiv";
> > arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts:39:		compatible = "usb-nop-xceiv";
> 
> Does this actually work at all?  There is no real resouces here that I
> can see, so what am I missing?

Hm, maybe I got this one wrong, I'm getting build errors now from
kbuild, let me go look into this some more...

greg k-h
