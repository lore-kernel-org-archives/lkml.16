Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1E26E143;
	Mon,  5 May 2025 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462416; cv=none; b=ZjhXks1JkH7ucv8AKjYgDJxW5GMHAkWEgZm+FijdSgi9MUPCiMiZXA9AMIp3zsUFgs/iISVS/kx4N/OlMJFFsZIqd+AV89MqDUcfV/Vc1FMRHYGfy09yyzhxoowutw/nEbQ8YPGoE/C2AuW9o+ByKQX2Z3qjgn+5OBuqKXZnKzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462416; c=relaxed/simple;
	bh=0FA9ZxPVKHr+QVDvJVcCqlsa9HFGPQiD9yLo3K/xWI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjS8t1zNw2l8WBbUj0l7CY3pIRcBcskS+qX7xYe4rRuJa7j/ovgEQ3sHFxQiycFOw0yfEfMfYu7/cOIvnBOJZLro3hgy5wSrz93V7bbHvgpyG12Dui5tjLRYRDSq98bAWOd95zvsb+eflFFF69BOrbQVsVLb0xxWxf1dhuU5rkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=RE31I3cy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="RE31I3cy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QWyIPfbKGN6ElRg+2eJC1JBl8Q1lwxPgt6OPkmoGqmQ=; b=RE31I3cyW0mz2FPDHHVzAG1o8i
	luuxU+UMhj6rjeMh8qgLY19WO9Rm7EEb+oHli+X8wWex2vmKvkGZcoYr841sopZHutbBUukxKJzVv
	wwhHElTDP+ZmaDlQeFAZDIaucZhGZV+NEZJbc2HiG8ay3LPmmxlmC9FR7XbZ3/h9i3Oc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uByeV-00Bc3T-En; Mon, 05 May 2025 18:26:47 +0200
Date: Mon, 5 May 2025 18:26:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
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
Message-ID: <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505115827.29593-5-goran.radni@gmail.com>

> +&ethernet0 {
> +	status = "okay";
> +	pinctrl-0 = <&ethernet0_ux_rgmii_pins_a>;
> +	pinctrl-1 = <&ethernet0_ux_rgmii_pins_sleep_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;

max-speed is probably pointless, rgmii cannot do more than 1G.

> +	phy-handle = <&phy1>;
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy1: ethernet-phy@1 {
> +			reg = <1>;
> +			interrupt-parent = <&gpiod>;
> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;

PHY interrupts are 99% time level, not edge.

	Andrew
