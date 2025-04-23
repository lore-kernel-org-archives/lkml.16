Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B717255229;
	Wed, 23 Apr 2025 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397898; cv=none; b=iBrQUodbhw0baASCi5e5sbVyWdFlWqySd1HIcXT74tp+b6VgpPfgZCchO8Z3A/65LeHgbwGuU8TzfP3LW6yOh5l2QqdUNUC6vsC66ifk9MLtqfrdNbrvGFVxZ6XOGkRfc6ZyaKChyin+wzV5tLB/JshaqzQd3B6tOnUeUJZOTIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397898; c=relaxed/simple;
	bh=fB5j9Qh2d3h0SnxxtIGEil8fLk3S4gA+eewhDbj2B6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFMnXzMJUtx/X54PUgBi+d5XV6mJhj8NF0MPuEOqyfowUr1cnpbyjidU5Gh3xbB+gJh6XFwG01R/blUuZiK3g4TgHF8dPWCkTcnQ1761Y+bkoi4MG1KgMy1ncvIAw/3F5ZXhr4tvlfMktytlJU+nLKDdd9rRdvzovQKqy+1BYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mPONR0tJ; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mPONR0tJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cTTTAQDf6fHnIShOY7nHVrkl1CzARvdCJOI3IZdV3Ac=;
	b=mPONR0tJ6JOAJK6st/hPw4OWfYhiQ3c37toLpvSvAaTUNYLlNVJC1R9nNG+9bO
	H8o+3/NoDauh6x0yPfh+wYor+sUeJSUF4A25f5qsCk4oitUYlN9mKUDmXZZeIpqs
	hptJqog/aAY1kmbLxXjDx5rYnCbMdc1NB+fa+38LBlu4Q=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD39tU8qAhoAhnAAw--.25448S3;
	Wed, 23 Apr 2025 16:43:42 +0800 (CST)
Date: Wed, 23 Apr 2025 16:43:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add
 Raspberry Pi Camera V2 overlay
Message-ID: <aAioPO9pZUFfyjpc@dragon>
References: <20250324071102.23765-1-alexander.stein@ew.tq-group.com>
 <20250324071102.23765-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324071102.23765-2-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgD39tU8qAhoAhnAAw--.25448S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrWDKFyfXrWkJrWxJFWfGrg_yoWrKryfpr
	n7Ca93GFs7Jr4xAwsIqrnIgrn0y3y8GF4jvr1UAry8Cr129FyxtF90qr15urWfWFnFv3yj
	vF92qry2gFnIqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jO8nOUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ04ZWgIgd2b8QAAsX

On Mon, Mar 24, 2025 at 08:11:00AM +0100, Alexander Stein wrote:
> This overlay configures IMX219 MIPI-CSI-2 camera attached to ISP1.
> Also add additional overlay both using LVDS display and camera.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   4 +
>  ...imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso | 107 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index d7ac8dda4bde5..b5cd2efd260cb 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -247,10 +247,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
>  
>  imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
> +imx8mp-tqma8mpql-mba8mp-ras314-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
>  imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
> +imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb
>  
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
> new file mode 100644
> index 0000000000000..0bc96d242f33f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +
> +#include "imx8mp-pinfunc.h"
> +
> +&{/} {
> +	/*
> +	 * The three camera regulators are controlled by a single GPIO. Declare
> +	 * a single regulator for the three supplies.
> +	 */
> +	reg_cam: regulator-cam {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam";
> +		/* pad muxing already done in gpio2grp */
> +		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&reg_vcc_3v3>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	cam24m: cam24m {

Can we name the node clock-cam24m?

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "cam24m";
> +	};
> +};
> +
> +&i2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;

'reg' doesn't match unit address.

Shawn

> +		clocks = <&cam24m>;
> +		VANA-supply = <&reg_cam>;
> +		VDIG-supply = <&reg_cam>;
> +		VDDL-supply = <&reg_cam>;
> +		orientation = <2>;
> +		rotation = <0>;
> +
> +		port {
> +			sony_imx219: endpoint {
> +				remote-endpoint = <&imx8mp_mipi_csi_in>;
> +				clock-lanes = <0>;
> +				clock-noncontinuous;
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <456000000>;
> +			};
> +		};
> +	};
> +};
> +
> +&isi_0 {
> +	status = "disabled";
> +
> +	ports {
> +		port@0 {
> +			/delete-node/ endpoint;
> +		};
> +	};
> +};
> +
> +&isp_0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			isp0_in: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> +				remote-endpoint = <&mipi_csi_0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi_0 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			imx8mp_mipi_csi_in: endpoint {
> +				remote-endpoint = <&sony_imx219>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi_0_out {
> +	remote-endpoint = <&isp0_in>;
> +};
> -- 
> 2.43.0
> 

