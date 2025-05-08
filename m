Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1D31E5215;
	Thu,  8 May 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712279; cv=none; b=hjfBcdgcup9Sh0ISerTNXAtatkrXNlMTre8mMIBe19AzS8HUKxVWe/lH0g9v3mVSDpGP77DgA7RhFGcy/zAndbHbITTxOp8UcQjfx4EMfih3C4YrJBut2gUdnnZefH75rcLW4o2wKVgt/G8cnLf5POCd5C1o7VakirXPt+reEHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712279; c=relaxed/simple;
	bh=6U4sCysadPAAKxSAmee2khkw+B2LWwszfo8nPySP0Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvin+1jbkPGPyrn34j7PSrjG7/0HMWM1gDy3oZrbxD/xOw5kXIrDszD4amvKVcUZuUOp+Rvd94L6jeUcjlTr7CFgPalM3h+rFv4elw4eC9x6l1d/kf7L5bpdsULD8z10MJm5svboVWifdsulEJC4WqKQMjCl/AcCgX9NOldXS8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2CVR4VQ2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2CVR4VQ2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=JDTh6xkMM8HQxsVT5/rBVpuKgI4QSLUTTTY/Sbbvo5Q=; b=2C
	VR4VQ2M62NZxPSLLzrUzNUTFYv9AQDDuYnZtykMx5Wkgz7KgENeQqbaOZ3Tkvf3vIsYyee7AkfSPH
	qknald7sN5FwxwrNmN2hgWFZFR8SdW8BJGMAHQxrXO4rY6OD6gW9q0yEOtGgAGyo5cx2TJnPuERO7
	0q30G1rVlRaaAsA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uD1eZ-00C0VV-Ov; Thu, 08 May 2025 15:51:11 +0200
Date: Thu, 8 May 2025 15:51:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Goran Radenovic <goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
Message-ID: <1281b9c4-ff94-4dfc-a531-45e3dbee3dfe@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
 <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>

On Thu, May 08, 2025 at 03:10:09PM +0200, Goran Radenovic wrote:
> Hi Andrew,
> 
> thank You once again for helpful hint.
> 
> Andrew Lunn wrote:
> > > > > +	phy-handle = <&phy1>;
> > > > > +
> > > > > +	mdio {
> > > > > +		#address-cells = <1>;
> > > > > +		#size-cells = <0>;
> > > > > +		compatible = "snps,dwmac-mdio";
> > > > > +		phy1: ethernet-phy@1 {
> > > > > +			reg = <1>;
> > > > > +			interrupt-parent = <&gpiod>;
> > > > > +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> > > > PHY interrupts are 99% time level, not edge.
> > > That is correct, but I am facing strange behavior, when I set
> > > IRQ_TYPE_LEVEL_LOW.
> > > My board stops booting at:
> > > 
> > > [    2.343233] Waiting for root device /dev/mmcblk0p4...
> > > [   12.638818] platform 5a006000.usbphyc: deferred probe pending
> > > [   12.643192] platform 49000000.usb-otg: deferred probe pending
> > > [   12.649029] platform 48003000.adc: deferred probe pending
> > > [   12.654277] platform 5800d000.usb: deferred probe pending
> > > [   12.659744] platform 5800c000.usb: deferred probe pending
> > > [   12.665089] amba 58005000.mmc: deferred probe pending
> > > [   12.670239] amba 58007000.mmc: deferred probe pending
> > > [   12.675185] platform 50025000.vrefbuf: deferred probe pending
> > > 
> > > I must investigate this. If You have any idea, You are welcome to share it.
> > Could be an interrupt storm. The interrupt is not getting cleared
> > because of something missing in the PHY driver, so it just fires again
> > and again.
> 
> After a brief investigation, I tend to agree with your assessment that the
> issue lies in the driver—likely the stmmac driver — which is outside the
> scope of my changes.
> 
> Therefore, I would suggest keeping IRQ_TYPE_EDGE_FALLING for now, or
> alternatively not using a hardware IRQ at all and falling back to polling,
> as done in stm32mp15xx-dkx.dtsi.

Since edge is wrong, please use polling.

	Andrew
