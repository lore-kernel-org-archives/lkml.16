Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED8216E30;
	Thu, 27 Mar 2025 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085547; cv=none; b=Vb/07CYO9jFNwEHlhHK6D72Rtssc+1bhTYH/DjTmEP1D/ZN5MxZaY5vrPkxpGoI8o9BL9fZE46D6LlwTZOsucGyW6cYIT5h32uvPcfkD4WO9uEiAWMoC3VdrVd56gMNtgGtz0o3S/wUvfz1bJGU1uikkIE7xAXrNzm/6QCI927c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085547; c=relaxed/simple;
	bh=wmOSQGQoljl9Kvl9qqHqoIdr6Yuih947V+Sqww42Wi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3q2LjUE/ZwapqUe5yawu/PqEwa/SAIyRWOgYjPfBKZsEGVTrVkIakNjRdLe+nxq9Jx19ir/TWAImMltm+PxJdFpC0IxtRZUWLQa2EZP9jjPyHO0XUVZ5SmIJuiqGb/t6J2dNln3vXF9grIgyFTW49GNOH7DHjcPvUmEWq6d/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0EX3l78V; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0EX3l78V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+m0Ulp+iyZSTL8Hc3fHL+e5d9ZfjycSRNPvxPdSsDN4=; b=0EX3l78VIC/2SYqvnQIGHuE3fx
	MzNifBjKPpaF9Ouvha9QKVGjoS82mavtDzOLBbkgnK1VMie/dXk6DyiNIEMaRIpU9IJvM0zIoBRbh
	1XrbWab7NGSjUusNnwBtrshEAuh/xM6FfcytDoLQAVZPL0m/G/nAK2SjCECGxsw1HE90=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1txoAs-007IAg-Gr; Thu, 27 Mar 2025 15:25:38 +0100
Date: Thu, 27 Mar 2025 15:25:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
Message-ID: <cf525617-b895-4d58-8455-a5c7fa9bbeab@lunn.ch>
References: <20250327123907.542132-1-martyn.welch@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327123907.542132-1-martyn.welch@collabora.com>

> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
> @@ -0,0 +1,415 @@
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@4 {

Just conformation, the PHY is on the SOM? Are the magnetics and RJ45
socket on the SOM, or the carrier?

> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <4>;
> +			eee-broken-1000t;

> +#if 0
> +			interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
> +			reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +#endif

Please don't have disabled properties.

> +			reg-mask = <0x90>;

What does this property do? It is not one i recognise.

     Andrew
