Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D1F111BF;
	Wed,  4 Jun 2025 21:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749071244; cv=none; b=n52RbaML/zbhJQKu/vGpBYyMPI+PNTr/j9B3m4ejxFnR+7pIk7z4Ch6nmayuS40LyMoHkcO6hIHg31QtQVT2bUway4Y2Ktl7y4z1DZkS9f2T2ZfKXlvLYooFyU27m4dZq881/X7QHx7HqnM+GAK+dYbuPJZ/UI7eIW2oc+a/Cj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749071244; c=relaxed/simple;
	bh=iwCXWGGatTQ1u27BEE5OUR7pg8jFHDjdG7eAGn89v24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUB2UdZW6oERA83G3SgpSmrK0i5736oe3R0aXCglyHuWox6/Lysp6PXwdKQzMU+c8e65ksMoH3a2L8+imYSafEBLZoRmsQAFyCKwuyfeM+krLJdr+99+K09v4PpXQF2Ap3RimYBs1h4sLn/y2FRZ0bzWQjfqdz3zXkQ8HcK3FFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=p53paCPZ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="p53paCPZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mVs0AHMw3fsD2UbtLb9zEeprGKSe+lXYMd++O3wZybo=; b=p53paCPZfwt6vUSz1ut77lJU3q
	sqxSL8txzmDgA5Pvy1zTINe3wZduLjQ8/0z49OmzRiEvv3tjAQCcMbYoF+13oGJ6dHcsv86uhZYiW
	HJFRB0cHFQ6ZGo6WRroV1AWhCkeYEyG+wwS1dmVzbFrae5QEwkLr75VyaZcgqPPT3LRc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMvKJ-00Ei1J-VB; Wed, 04 Jun 2025 23:07:11 +0200
Date: Wed, 4 Jun 2025 23:07:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
Message-ID: <66af3e62-83c7-4859-b8af-215098a825f0@lunn.ch>
References: <20250604-jaguar-mezz-eth-switch-v3-1-c68123240f9e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-jaguar-mezz-eth-switch-v3-1-c68123240f9e@cherry.de>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_rx_bus2
> +		     &gmac1_tx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &eth1_pins>;
> +	rx_delay = <0x0>;
> +	tx_delay = <0x0>;
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <1000>;
> +		full-duplex;
> +	};


> +	switch@5f {
> +		compatible = "microchip,ksz9896";
> +		reg = <0x5f>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <RK_PB7 IRQ_TYPE_EDGE_FALLING>; /* ETH_INTRP_N */
> +		pinctrl-0 = <&eth_reset_n &eth_intrp_n>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio3 RK_PB6 GPIO_ACTIVE_LOW>; /* ETH_RESET */
> +		microchip,synclko-disable; /* CLKO_25_125 only routed to TP1 */
> +
> +		ethernet-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			lan1: port@0 {
> +				reg = <0>;
> +				label = "ETH1";
> +			};
> +
> +			lan2: port@1 {
> +				reg = <1>;
> +				label = "ETH2";
> +			};
> +
> +			lan3: port@2 {
> +				reg = <2>;
> +				label = "ETH3";
> +			};
> +
> +			lan4: port@3 {
> +				reg = <3>;
> +				label = "ETH4";
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				ethernet = <&gmac1>;
> +				label = "CPU";
> +				phy-mode = "rgmii-id";
> +				rx-internal-delay-ps = <2000>;
> +				tx-internal-delay-ps = <2000>;
> +
> +				fixed-link {
> +					speed = <1000>;
> +					full-duplex;
> +				};

For these bits only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
