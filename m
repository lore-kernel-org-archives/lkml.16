Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191202F41;
	Thu, 22 May 2025 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918259; cv=none; b=P9Xz14xa+uyUuNaYs+fKfROd4/52XXOSFDjnNRnd8KWxUjCWdm5GSwHE/qlALJUi979jrJBebyti+acJLpLAsYbJG32/tyXp5SHnpJG9vtesxijRVMHE070fa8DAJGV14TWckv9FwxOrlAWvnLhZkN7m2zwEHGYk3Ld3FXc5cs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918259; c=relaxed/simple;
	bh=AmQ+WbfG9xtw0Z+jRNSrCJrEUIrK7Wv3brjyfx7Lyiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnY6abJpbIWz9UaPvPyYIzmy/yGq5Dxk7Gpx294MA32HglFAsHa3/UPKqWyd3YGOQ7tsXkLhuajdr/JLn+hm3hFIDrvVgttJ+OB2ox65T9m6GIYZwjE6wbmMYfzJOt9SQeWmKNn/dQnPOMhj0KYW1qrXPPrCUGObD1RROOuKtls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Fe+uMmjt; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Fe+uMmjt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ziV+qFWQFPGemtwtFuQ2yto/+aZFcx7ZXSBvpy3WpXs=; b=Fe+uMmjtdt4LUngmv3HG9SnhGa
	ae1zfCnl9CkSjiudDhV24Xr3nhTqPUAd0fp+PeA8Dm7cZTkUmNC0BCN9fsFkZdNc+VRHiRJ6Ru+gL
	WKMEE9yXPOyV1bECHpNIcwT59ilUoK+dAMpkgpZoRtjOimeLgLMNSZDASTdZoGWju0Rw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uI5No-00DUjP-Ee; Thu, 22 May 2025 14:50:48 +0200
Date: Thu, 22 May 2025 14:50:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch
 adapter for RK3588 Jaguar
Message-ID: <9c99aba9-87f5-41fe-8b11-7ef27525750c@lunn.ch>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
 <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
 <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>

On Thu, May 22, 2025 at 10:18:12AM +0200, Quentin Schulz wrote:
> Hi Andrew,
> 
> On 5/21/25 6:25 PM, Andrew Lunn wrote:
> > > +&gmac1 {
> > > +	clock_in_out = "output";
> > > +	phy-mode = "rgmii";
> > 
> > Does the PCB have extra long clock lines to implement the 2ns delays?
> > 
> 
> Not that I am aware no.

So 'rgmii-id' describes the hardware.

> 
> The issue here is that I believe the Linux driver actually got the whole
> phy-mode thing wrong?

Quite possible, a few drivers do.

> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> 
> First, tx_delay defaults to 0x30 if absent, rx_delay to 0x10 if absent,
> which seems a bit odd but why not.
> 
> Then you have rk_gmac_powerup() handling the delays.
> 
> If RGMII, then use rx_delay and tx_delay. If RGMII-ID, use neither. If
> RGMII-RXID use tx_delay. If RGMII-TXID use rx_delay.
> 
> This is the complete opposite of what I was expecting?

This driver, and the aspeed driver cause a lot of problems....

> > Since this has a switch on the other end, its a bit more complicated
> > with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
> > to the PHY, and the PHY then does the delays. However, here you don't
> > have a PHY. So you have the MAC add the delays. This looks O.K. I
> 
> The switch actually supports adding delays on the port used for DSA conduit.

That actually looks to be the simplest and correct solution. Set the
MAC to 'rgmii-id', rx_delay and tx_delay to 0, even if they are
ignored. And in the switch, also 'rgmii-id' and let it insert the 2ns
delay. You can use rx-internal-delay-ps and tx-internal-delay-ps if
you want, but it seems to default to sensible values.

> I'm a bit confused by the following sentence:
> 
> """
> Normally, the MAC does nothing and passed rgmii-id
> """
> 
> is this something that the MAC driver is supposed to do or is the subsystem
> handling that somehow? How do I know how/when to rewrite the phy-mode passed
> to the PHY?

A small number of MACs have hard coded delays. You cannot turn the
delay off. So the MAC has no choice but to do the delay. 'rgmii' is
simply not possible, so -EINVAL. For 'rgmii-id', if you pass that to
the PHY, it will also add a delay, and 4ns in total does not work. So
when the MAC is adding delays, it needs to mask out the delays it is
adding before calling phy_attach() passing an rgmii mode.

	Andrew
