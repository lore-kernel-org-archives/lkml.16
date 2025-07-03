Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30B21D3F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544925; cv=none; b=NwvNM3aMNbQ+lNUPH2k8vtjlBq6AXi0qtVd/0yo8xyDB8P6IMbaHUyFkkNg4izsMdmfFQdsV6mXsUwazWjCpkPm3yRmAiT0hngpVGwY7bKEt3QvcbONiZHYMuAYaXh5tgW8GZhAv5YX+Wx0VCBNBzGm48tKSpkHrVMvQqUpaIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544925; c=relaxed/simple;
	bh=gF6edynPvVItDI0fQb8qSM4Bom7xt5aE7JPOku1spHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjYJ9tE24iOPFD9qXexFvV07F+Cl8Qxeea1hs2oBqxR9Sc5Tt6c+xQ7LotqWMiKJsWhgsVKfXOHhAroQq6ZJfm7fJe01nL1EcwlGe1hQBcsLvB3kanSNlYvfRgSqpWw/la8Yd2cI68HC8hc/bGR80kcHhcdqOZNAU21iNP67Imw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uXIqP-0005GN-OV; Thu, 03 Jul 2025 14:15:13 +0200
Message-ID: <9c0051ef-e05c-433e-92a0-94869c27671e@pengutronix.de>
Date: Thu, 3 Jul 2025 14:15:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mm: Configure DMA on UART2
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 aford@beaconembedded.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20250703113810.73023-1-aford173@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20250703113810.73023-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 7/3/25 13:38, Adam Ford wrote:
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recommended to not use the DMA on the
> console. Because, the driver checks to see if the UART is used for
> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> V2:  Fix spelling errors in commit message
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index cfebaa01217e..ded89b046970 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -915,6 +915,8 @@ uart2: serial@30890000 {
>  					clocks = <&clk IMX8MM_CLK_UART2_ROOT>,
>  						 <&clk IMX8MM_CLK_UART2_ROOT>;
>  					clock-names = "ipg", "per";
> +					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
> +					dma-names = "rx", "tx";
>  					status = "disabled";
>  				};
>  			};

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

