Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AF222AE41;
	Wed, 21 May 2025 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844758; cv=none; b=IIMSEs6pxzQajhFeP+CZ0Xt8I8Txi8pMu2qsGILSN+yxDVCASOKTwtKoGoNiHcDFGOfC3UnM2Pf76Ju7gd0WyUV6F49oTt5aS6ovMF7VUrmvGqFNOgrf1Q2AYs+rV5/XN1QntfWz5CVUdul1+YBAcvPlfcDNtj5CTXE7aGksVoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844758; c=relaxed/simple;
	bh=TebvNaMaU18pQ6UYGJjAoei8ZaawpkQCHdRpR8HAQJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0WGg9aZNRzA/I+QbxGmraVVxkW63gNzUqhZMLGk2hO9KTK7q+k7zHwxE6q5Ih5FkPXVoRO7RAW4r8suB8AuRdh4SFj5qppYLZmjuKWtUokXTbPcnDmPn1qc9+L077B02hcsADs28AHsM6aedXlEPOULT1H6+7HIcLBzs6BDmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0QceTirr; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0QceTirr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3g+CVDtzdZuER6lgO4bsBUK1VAcbEEFUD1kAdD51SmY=; b=0QceTirrCVNAGS9NMWkA8dWXud
	0Ijic96VpnfzbUaQU8WJs5bQ73IwhTxqB43HicBwXfhvTmqdOadYRKNSzRumKnoBPVDo/7llJYeqz
	dGI/DJAJ00kGGqHhjvBCjIK6VuSsPV/jCXtT+Pftb7iM+fYbYKWek5nWH7/IqjQB+Qds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uHmGM-00DKBr-7Y; Wed, 21 May 2025 18:25:50 +0200
Date: Wed, 21 May 2025 18:25:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch
 adapter for RK3588 Jaguar
Message-ID: <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines to implement the 2ns delays?

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_rx_bus2
> +		     &gmac1_tx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &eth1_pins>;
> +	rx_delay = <0x30>;
> +	tx_delay = <0x30>;

Since this has a switch on the other end, its a bit more complicated
with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
to the PHY, and the PHY then does the delays. However, here you don't
have a PHY. So you have the MAC add the delays. This looks O.K. I
would prefer that the driver used the standardized
rx-internal-delay-ps & tx-internal-delay-ps rather than these vendor
properties. But that is probably out of scope for this patchset.

> +			port@5 {
> +				reg = <5>;
> +				ethernet = <&gmac1>;
> +				label = "CPU";
> +				phy-mode = "rgmii";

Again, this probably should be rgmii-id to correctly describe the PCB,
but i don't know if the switch takes any notice of it.

	Andrew
