Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5081A83E2;
	Wed, 23 Apr 2025 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402152; cv=none; b=rKNkzoEH4qqBYkYr/6hFdo5yxz0HE7dK7ynSEdvTXUw2W4JuJfx25z/4GvhRiVjxXDOZTATfqUYv6x815M8HqhbML7vQivmCHcg7PO/uSpjaNRfvOobZsy3b2GvCc/RNMfzgBf6nKg1gGbxMR+FoKy6CViidZRrL1xkMMdeDf2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402152; c=relaxed/simple;
	bh=IX355T5bF+gY8hYv3hsDrYQj7EXvm48oDjcOSaLE15Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8jozom497YxQZl5khUzep6O/Oi4Sg1FSmpX2gQZ/A2bRRZ9ChvI1gYEtqiNAKFGj5OsZClbtV9IBIwWb2qIyLhwJ97Fbco09rP8lhSCJAM18Lt5o8rzAEB+v+1UJPLKCVY9Ec7NzWtONDNX5bXrJI9Z1GUAsU+OGwxM9WHAdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KsqFhg/1; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KsqFhg/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NlhH8WEkZpuN13W3VEIII6VHYDH2gaUlvN68bRqY43U=;
	b=KsqFhg/1z+Wlpt1mkRvAVzxScxkUwbLEiLR9Mk8dymJf9frcxhtvyZt/0v4j2A
	rxsY5FsARt9RdCppDIP17UtGdGdeP/7TBjeVhNwe9g2M0vfpFz1eUQP53x7GIA6h
	nZ2+m9/K2vEpM7qVZMrln+BW3tAVNdJ4h8yDFfsCg3GdY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCHItjtuAhoHeXSAw--.33364S3;
	Wed, 23 Apr 2025 17:54:55 +0800 (CST)
Date: Wed, 23 Apr 2025 17:54:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 5/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for
 CDTech FC21 RGB display
Message-ID: <aAi47dGoKbHqEo7Q@dragon>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
 <20250408093059.551700-6-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408093059.551700-6-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgCHItjtuAhoHeXSAw--.33364S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1DWr1rWF17Jr4fCF13XFb_yoW5Zw1xpr
	nrAayDCr4UGF4UXr18GFs8Kr1DK3yFg3W3ZFyYyFWjqrsruw17JFZ8KFnxWry3ZrW5Gw15
	XasY9ayFgFnxJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jO8nOUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNA+F6mgIuO8d-AAA3C

On Tue, Apr 08, 2025 at 11:30:52AM +0200, Alexander Stein wrote:
> This adds an overlay for the supported RGB display CDTech FC21.
> DCU graphics chain is configured accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
>  ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
> 
> diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
> index 7f96de6f80224..7b97b718ebc16 100644
> --- a/arch/arm/boot/dts/nxp/ls/Makefile
> +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> @@ -9,5 +9,7 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>  
>  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
>  ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
> +ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtbo
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
> +dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
> new file mode 100644
> index 0000000000000..31494d9d09f8f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&backlight_dcu {
> +	status = "okay";
> +};
> +
> +&dcu {
> +	status = "okay";
> +
> +	port {
> +		dcu_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> +
> +&display {
> +	compatible = "cdtech,s070pws19hp-fc21";
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	polytouch: touchscreen@38 {
> +		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
> +		reg = <0x38>;
> +		interrupt-parent = <&pca9554_0>;
> +		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +		/* LCD_PWR_EN -> TSC_WAKE */
> +		wake-gpios = <&pca9554_1 4 GPIO_ACTIVE_HIGH>;
> +		iovcc-supply = <&reg_3p3v>;
> +		vcc-supply = <&reg_3p3v>;
> +		gain = <20>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +	};
> +};
> +
> +&panel_in {
> +	remote-endpoint = <&dcu_out>;
> +};
> +

Whitespace at EOF.  Fixed it and applied the series.

Shawn

> -- 
> 2.43.0
> 

