Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4094A1E;
	Sat, 24 May 2025 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108682; cv=none; b=oCWw+RtxdlOKzr9Vev6fdLroMJUjRusOJLzPviHsdqamJ+61TZVQybP0VnAY+O1lqdCToN3teaxrLr4L0wrESX8w0XEbzN/h9WG4wd2EucOx2KWB0lhZLl+1yhRlGbGPCkxhhfHXteKRIistujuIJifFDQ1xcd+gMvFRWZn05jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108682; c=relaxed/simple;
	bh=y1UhHLgIIOVa+CVOIfiBtXhm5Yk2ZvimQ7gEiQogyzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoBuBew3AfqklsWSdmepev1y17z7uegetOckd+Zb7oNOWIS2QCXNE8BZzCwQQiuE5BarF7iV8MghnqOjc59gNB/vKCPcMbtSQnwa3KGaePqpsLtFlEdFRmvUz7d2qICxJH8r/m95sp9Aj2Th3zNwThlKQE6+f8msSXB6JrytEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Jr0iAPFV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Jr0iAPFV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ooNZFNesDamgJmBUO308M7JMOnZukel6+UrLmdW/7ag=; b=Jr0iAPFVZj7M98iaizRYZqW0t2
	HFuQMZMIhVeRJpTTsHH70QsW/qID6h8BDVOlf2Hc+TrBFqvNbwoaDHJ+Qvd3DWN0oAIqYhaaaK3c5
	128hXJEGA/XqAP1vogm4qOGDXo+q8+bFEQutgtcLu4QUOGiLkjXfGf1uBKnMUeaW2hkc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIsv7-00Dh4H-Qj; Sat, 24 May 2025 19:44:29 +0200
Date: Sat, 24 May 2025 19:44:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Stoidner <c.stoidner@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524112315.695376-1-c.stoidner@phytec.de>

> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 88c2657b50e6..b481097f08a4 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -68,6 +68,8 @@ mdio: mdio {
>  		ethphy1: ethernet-phy@1 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <1>;
> +			reset-gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
> +			reset-assert-us = <30>;

Is there anything in the datasheet about needing a delay after the
reset? There is a DT property for this:

  reset-deassert-us:
    description:
      Delay after the reset was deasserted in microseconds. If
      this property is missing the delay will be skipped.

Anyway:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
