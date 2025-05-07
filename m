Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313D2820A9;
	Wed,  7 May 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622444; cv=none; b=WlVNWmqFcq2fwURs+lnC3g0HIfWfGvifyU0S+Ze3zticpcXnyA4gVlcyc4UCMJlqiSmN6QLYDyqSC6HSMDkUC0FRrVa88VpkvvBpkIBOCkZ1Yg4LUEYND253mFVPoGJNaSJudiAMzZi73C4Eg80C+8tNbYsUVl+YLsD+/Ds+akc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622444; c=relaxed/simple;
	bh=2eKsRyJmadDpyCD5A2PDs4UfN+odr6zcOnDDEHtPqOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQqIkMThttF8KxEC8Usk6p0eIRccAqYqbHbV1EDvPi/EIVilvi7zv/9CPTFjmhjWBh8zoYQsKXqyGD/hkdeeY3ozH1ooecbD1o51BvcsdGsi6mJByCypnhLlXXIrkN3ZbY+ahhbqA2A3lNmMKqhRRujdFog0eH4mEzFFaN3QRoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=cGG+Z50p; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="cGG+Z50p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0fFKNksEmsQbsR0EeTe+adaYOVO5vW1ZpKsqI4+DB0w=; b=cGG+Z50pQm4mNB0XLYgfBKfuDN
	LcmS5xvP96t6kKOa1AQP65/D3VYC4jAh0qaiWrV3uxoBb8Q0GZmjaB+bch+hhgpUWJ4F5I0VcCNr7
	/4qySYXc5TTwrfO0BDKmvUcqfmaG2/6fsDXZMvQElpu34LYb4R1DhkhBVtyJ1TczM0qQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCeHd-00Bsiq-9G; Wed, 07 May 2025 14:53:57 +0200
Date: Wed, 7 May 2025 14:53:57 +0200
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
Message-ID: <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>

> > > +	phy-handle = <&phy1>;
> > > +
> > > +	mdio {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +		compatible = "snps,dwmac-mdio";
> > > +		phy1: ethernet-phy@1 {
> > > +			reg = <1>;
> > > +			interrupt-parent = <&gpiod>;
> > > +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> > 
> > PHY interrupts are 99% time level, not edge.
> 
> That is correct, but I am facing strange behavior, when I set
> IRQ_TYPE_LEVEL_LOW.
> My board stops booting at:
> 
> [    2.343233] Waiting for root device /dev/mmcblk0p4...
> [   12.638818] platform 5a006000.usbphyc: deferred probe pending
> [   12.643192] platform 49000000.usb-otg: deferred probe pending
> [   12.649029] platform 48003000.adc: deferred probe pending
> [   12.654277] platform 5800d000.usb: deferred probe pending
> [   12.659744] platform 5800c000.usb: deferred probe pending
> [   12.665089] amba 58005000.mmc: deferred probe pending
> [   12.670239] amba 58007000.mmc: deferred probe pending
> [   12.675185] platform 50025000.vrefbuf: deferred probe pending
> 
> I must investigate this. If You have any idea, You are welcome to share it.

Could be an interrupt storm. The interrupt is not getting cleared
because of something missing in the PHY driver, so it just fires again
and again.

	Andrew
