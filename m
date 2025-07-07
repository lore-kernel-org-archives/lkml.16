Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC6B2E3712;
	Mon,  7 Jul 2025 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877927; cv=none; b=GZzQAketfL5XfCbxR4oRqTddyl7c+uEJwLGPMoNNV0PQEcp678tM7VXv5nrB3maXWsjcyr+iPG7CRsXWop8nOwv+FqyBchvycY6U0rgcL9lWXon+WTh07fWwT7XLR8VMk4f2FozBM9+vERrXtNg5EcBhB/Oa5m8CyOcDE938Sns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877927; c=relaxed/simple;
	bh=fAbrkbbHu5n4B9+4v4yVoWzl2w8+qf9jJb+YrihF6ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuVKwd7P1XYVbSwToNKztOoKqDRWk9U5xYEeHsPEaugjH7ihJIEM9XDXA7BUPDcdzT1KuycTY8nrpkdN55rv2yrpxm6PchUTemeM+IOcOy7MIuSMTBnpSrQjkFkOmynybKM9fJRBLAGes7KJYZiZzn4I4/19Fw4ddnGVkug4s34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Am+AuqQX; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Am+AuqQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h+1DDYoaS1Ipu12iZO8xaUeU/BSiLpWZ922LTtPQMUc=;
	b=Am+AuqQX1OzceuAS0C6wsFLQ1oe+IZyfkfmO9eBiqI7vCsFbRp6lSPeip4n/rL
	XzoJsG3nF+eO7bifCsGdYTwKSdeTwVEAl05kGBQFqEFHzTDv0qjEkIy6kI45QEE4
	xnXI6xZZ1Yp7gEDIG4Da5MhwJHWtpaKpfgSY7n1XmbPco=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3xsP6iGtoPxw9AA--.22655S3;
	Mon, 07 Jul 2025 16:44:44 +0800 (CST)
Date: Mon, 7 Jul 2025 16:44:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: imx: add dts for the imx8ulp evk9
 board
Message-ID: <aGuI-i5bI7lHsFjP@dragon>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
 <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Mc8vCgB3xsP6iGtoPxw9AA--.22655S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrWkJrW5tr1kWF13Xry5Jwb_yoW5Zw4fp3
	Z7Cw45Wws2gr9rtrZIq3Z2qF98Gws3CrnruasI9ry8tr15u343tr48trs3Gw13uwsxA3y7
	CFWqqrnrCrs8Gw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UivtAUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBxWu2hriPzw3QAA3L

On Mon, Jun 30, 2025 at 08:22:39PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DTS for the i.MX8ULP EVK9 board.

Could you highlight the major differences from i.MX8ULP EVK board in the
commit log?

Shawn

> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 4da7501ece17..4b288b324d38 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>  
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> new file mode 100644
> index 000000000000..5497e3d78136
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8ulp-evk.dts"
> +
> +/ {
> +	model = "NXP i.MX8ULP EVK9";
> +	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
> +};
> +
> +&btcpu {
> +	sound-dai = <&sai6>;
> +};
> +
> +&iomuxc1 {
> +	pinctrl_sai6: sai6grp {
> +		fsl,pins = <
> +			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
> +			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
> +			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
> +			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
> +		>;
> +	};
> +};
> +
> +&pinctrl_enet {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
> +		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
> +		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
> +		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
> +		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
> +		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
> +		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
> +		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
> +		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
> +		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
> +		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
> +	>;
> +};
> +
> +&pinctrl_usb1 {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTE16__USB0_ID		0x10003
> +		MX8ULP_PAD_PTE18__USB0_OC		0x10003
> +	>;
> +};
> +
> +&pinctrl_usb2 {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTD23__USB1_ID		0x10003
> +		MX8ULP_PAD_PTE20__USB1_OC		0x10003
> +	>;
> +};
> +
> +&sai6 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_sai6>;
> +	pinctrl-1 = <&pinctrl_sai6>;
> +	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
> +	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,dataline = <1 0x01 0x04>;
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

