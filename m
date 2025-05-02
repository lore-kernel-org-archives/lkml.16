Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423E2144C3;
	Fri,  2 May 2025 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222734; cv=none; b=uRoMU7uo7g+zKB5S9t//9NJH3JhS4eQihqisqHhD+VvPVbGULf6PHXC+poE0lxekOcg2fuUkejQtU3zawCG+rXcsTPRDFSvqMUs5u5WrBEcytK2VuO6KLGkmLHq/PBxJbiZ1uR8vdHBfNdAvwbaPy764xD6GvVejoruh5sGp/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222734; c=relaxed/simple;
	bh=QY2GlSzJ1Yxf73WeScnFsy8++FrhbTDdsNu9hs3/c8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SD530gqpvDVULS24dtaecFZ6dNKjhlEiq4RR7honv81rUPRcVCIEVltErcTokn4qjGJTz0+DE9fJGBnO+gKNzJoI0ixv9q5R7tbThtHFwr0Dk3FcFk45k5GWAnuFKvMYkRGKJSJNKr1JLlZn/zjcwP3XtgK2UwCyo4+iMnOztmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2bHeTLMW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2bHeTLMW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V9SjiiEJ5CBwLN0Flq395P6nvTylfhJws1GFCWFkO+w=; b=2bHeTLMWmrEKsZTabi9IKqJnaq
	5rTdIhkvQosr2AG6CUNGOchjzNLxWtTfUSeyet/qYES8qLELeboaz/c3+CU6/QbP7GRlXicop3JzL
	R5cK6DoVo14nhbpju3mvydkOucbj4eQXDN7yTIMoAB2kbX5m8rhQYpV8EO1g4zTPlEt8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uAyIZ-00BRxh-Ba; Fri, 02 May 2025 23:51:59 +0200
Date: Fri, 2 May 2025 23:51:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: rockchip: Add Luckfox Omni3576
 Carrier Board with Core3576 Module
Message-ID: <7c01712f-776d-4073-9829-f18a51df6d4c@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250502205533.51744-4-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502205533.51744-4-inindev@gmail.com>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-rxid";

This is unlikely to be correct. It probably works, but that does not
make it correct.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth1m0_miim
> +		     &eth1m0_tx_bus2
> +		     &eth1m0_rx_bus2
> +		     &eth1m0_rgmii_clk
> +		     &eth1m0_rgmii_bus
> +		     &ethm0_clk1_25m_out>;
> +	snps,reset-gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;
> +	tx_delay = <0x20>;
> +	status = "disabled";
> +};

Please see the discussion about rgmii delays with other rockchip
boards from the last week, and

https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

	Andrew
