Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D525DD18;
	Tue, 20 May 2025 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731612; cv=none; b=qtBCSNmg6wF4yhRi/yQUvp0P1vEpQl199pZHh/3NjrfuFNU21gHi/PFi08b+XhTGJMn/1BNoRxzy3d50JmdrKvhYU/u/EXc7dbNc0N6bcLEhx6qt1YuymeM9RxzKQ05tw9whFlMf4l9ZXjRbPGGR12IirT7uJ9WYkaXuEfZr8WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731612; c=relaxed/simple;
	bh=/cBn7/afihVspLZ8dscheq2oAej7A2VWzWI1xW+tNR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbgBnqSPcmS8q4KMnmXX5Tp48yd/68/KIRMHhGi8EaGPNC5P+djZcQAD3ORyKoFKkvHlqUGZ6naFUNF/6talJ1iSxpK61xMESba2QXeQnDA0zI7JbV92L5rDZyR6sJS9hBl8YL4K64I3r1oHzkSX0/7F0MuxH1QXp7WZfN2uSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=cAQXddps; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="cAQXddps"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w0LsP1fiZLjpi1gUjPOfQqurrRWtv9lamy0l+H19eNs=; b=cAQXddps1vtWNSjTgqR6JR92O/
	A1Ul4BSViUPWt9tLuHIctuBmrLCSjqBtoB5E9M0C4nC/WRRgMLHV8aUYGnJqG8dOmaBlyIpGhvkKI
	pBptnZMQrLeWndGWsrFddQG3KuNkECU8Wv8GhmXG0ZA54ru0m/WPNJoQuct2xKoQbriAx+G0jMD+3
	ogJWW5IueXiow4jsKv7Lhtpi2zB2ObuAG2fnvW0pR5+5SdZIeRgrz3VanAZlcJWK3+HntLxuc8n//
	24MKYDkz1Fru7hNdy3blghtKO8NwnazWBxz2YB7lC1O6zCvTWYWF2wpnfToYGqiMp73irFST3y1UP
	Q/WlkGow==;
Received: from [89.212.21.243] (port=52674 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uHHqP-009yd6-21;
	Tue, 20 May 2025 09:57:01 +0200
Message-ID: <e986fcf0-fe2b-43de-9d46-8ea60d97ca14@norik.com>
Date: Tue, 20 May 2025 09:56:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH] arm64: dts: freescale: imx93-phycore-som:
 Delay the phy reset by a gpio
To: Christoph Stoidner <c.stoidner@phytec.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20250520073450.388989-1-c.stoidner@phytec.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20250520073450.388989-1-c.stoidner@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Christoph,

On 20. 05. 25 09:34, Christoph Stoidner wrote:
> According to the datasheet the phy needs to be held in reset until the
> reference clock got stable. Even though no issue was observed, fix this
> as the software should always comply with the specification.
> 
> Fix this in the bootloader, as this is the point where the reference
> clock gets initialized and stable first.

I would remove this paragraph about the "Fix this in the bootloader..."

Doesn't patch apply to both the kernel and the bootloader FEC driver?

> 
> Use gpio4 23, which is connected to the phy reset pin. On the same pin
> RX_ER was used before, but this signal is optional and can be dropped.
> 
> Note: This comes into effect with the phyCOREs SOM hardware revision 4.
> In revisions before, this gpio is not connected, and the phy reset is
> managed with the global hardware reset circuit.
> 
> Signed-off-by: Christoph Stoidner <c.stoidner@phytec.de>
> ---
>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 88c2657b50e6..f8e2f3f3baa8 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -58,6 +58,9 @@ &fec {
>  				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
>  				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
>  	assigned-clock-rates = <100000000>, <50000000>, <50000000>;
> +	phy-reset-gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
> +	phy-reset-duration = <1>;
> +	phy-reset-post-delay = <0>;
>  	status = "okay";
>  
>  	mdio: mdio {
> @@ -91,14 +94,16 @@ pinctrl_fec: fecgrp {
>  		fsl,pins = <
>  			MX93_PAD_ENET2_MDC__ENET1_MDC			0x50e
>  			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x502
> -			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
> -			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
> -			MX93_PAD_ENET2_RXC__ENET1_RX_ER			0x5fe
> +			/* the three pins below are connected to PHYs straps,
> +			 * that is what the pull-up/down setting is for. */

I would remove this comment and maybe move it to the commit msg why are
you changing the PD/PU configuration.

Anyway, if you decide to keep it, you need to fix the following warning:

WARNING: Block comments use a trailing */ on a separate line
#46: FILE: arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi:98:
+                        * that is what the pull-up/down setting is for. */

BR,
Primoz

> +			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x37e
> +			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x37e
>  			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
>  			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x50e
>  			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x50e
>  			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x50e
>  			MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
> +			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
>  		>;
>  	};
>  

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com
