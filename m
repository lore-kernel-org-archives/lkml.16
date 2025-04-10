Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2181EE031;
	Thu, 10 Apr 2025 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744304104; cv=none; b=DXLWHs6LrNm570ABF9kyEnz5zWfb3nf0vKTE7BMJ8zAaPG6v1PxJTi/O7dP0Hk4+yNU7NwLxXOc+oBjasVqO+dBCW76/Bi6zpiJ908/lU6UkxhgvoFXAL3sXCasXOrIFBG/W8a5Ivt89Z62PK6x3vrIoRc07veCuN1+WWcWKYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744304104; c=relaxed/simple;
	bh=6ILYwxPk1uunko0MaW2WhQjFVnHa2NU28ADIkv7zU0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrRIT077acdhp4YWtIX5txgP2fPS6pqUXoVQwzklt3TCL/ZnbmidUqzj6WGJlL1z8ErXSZoUJ+ruuBBj+ZAWEvFAolaz/QoRXyE8dSLgHUY8wzo3gIqZiuaR2Lulq0+6tDTNk+UEAaLpMZmEwiKyxEQozIUxH7ktk35cHZM8WMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Yo8ar9ev; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Yo8ar9ev"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4E37B25DC2;
	Thu, 10 Apr 2025 18:54:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYPDpyDU1__h; Thu, 10 Apr 2025 18:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744304098; bh=6ILYwxPk1uunko0MaW2WhQjFVnHa2NU28ADIkv7zU0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yo8ar9evgyQErWgB1u5lLqMaQwD2Tvr49FX66uZuDCTl8NPdVDfVFghZ4W9R6Gaxm
	 Mz8mOJ0fGzWLWCUY0rhuPrixJ/IrZKiluPQB2r8KYQGfrYo1YJ68jTB+42CH+QqzR5
	 wL9VTnl1vk+oIEavqYHofGrzOerTvx699vl53+cHVL4KxLG+5QFds2oDzwlVbfbhgV
	 X+sSce8U4eEU7g0rugNQjHKUJ7eE5xg6N5FPXz8OFAsjly+tCL9Wuca8uD/jK9bTA0
	 cMRYSw+X+jr4d3UZMHOdQNkBTF+GHaiTzy8HTUuzI6GYBzdUOcd5sLvYbX32itR7TF
	 1sFQCOSmXIc2A==
Date: Thu, 10 Apr 2025 16:54:42 +0000
From: Yao Zi <ziyao@disroot.org>
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: starfive: add DT for Orange Pi RV
Message-ID: <Z_f30vAuATR1DCWk@pie>
References: <20250409091801.855083-1-uwu@icenowy.me>
 <20250409091801.855083-2-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409091801.855083-2-uwu@icenowy.me>

On Wed, Apr 09, 2025 at 05:18:01PM +0800, Icenowy Zheng wrote:
> Orange Pi RV is a newly released SBC with JH7110 SoC, single GbE port
> (connected to JH7110 GMAC0 via a YT8531 PHY), 4 USB ports (via a VL805
> PCIe USB controller connected to JH7110 PCIE0), a M.2 M-key slot
> (connected to JH7110 PCIE1), a HDMI video output, a 3.5mm audio output
> and a microSD slot.
> 
> Onboard peripherals contain a SPI NOR (which contains the U-Boot
> firmware) and an Ampak AP6256 SDIO Wi-Fi module.
> 
> As the schematics isn't available yet, the SDIO Wi-Fi is left disabled
> yet.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../boot/dts/starfive/jh7110-orangepi-rv.dts  | 73 +++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index b3bb12f78e7d5..24f1a44828350 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>  
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-orangepi-rv.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> new file mode 100644
> index 0000000000000..bde01f117e0b2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "Xunlong Orange Pi RV";
> +	compatible = "xunlong,orangepi-rv", "starfive,jh7110";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-ack {
> +			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			linux,default-trigger = "heartbeat";
> +			label = "ack";

Should we sort the properties in alphabet order? i.e. color, function,
gpios, label then linux,default-trigger. See dts-coding-style.rst,

> The following order of properties in device nodes is preferred:
>
> 1. "compatible"
> 2. "reg"
> 3. "ranges"
> 4. Standard/common properties (defined by common bindings, e.g. without
> vendor-prefixes)
> 5. Vendor-specific properties
> 6. "status" (if applicable)
> 7. Child nodes, where each node is preceded with a blank line

> +		};
> +	};
> +};
> +
> +&gmac0 {
> +	starfive,tx-use-rgmii-clk;
> +	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> +	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +	status = "okay";

Vendor property starfive,tx-use-rgmii-clk should go after the common
ones.

> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	/* TODO: Ampak AP6256 Wi-Fi module attached here */
> +	status = "disabled";
> +};
> +
> +&mmc1 {
> +	/delete-property/ cd-gpios;
> +	broken-cd;
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +&phy0 {
> +	motorcomm,tx-clk-adj-enabled;
> +	motorcomm,tx-clk-10-inverted;
> +	motorcomm,tx-clk-100-inverted;
> +	motorcomm,tx-clk-1000-inverted;
> +	motorcomm,rx-clk-drv-microamp = <3970>;
> +	motorcomm,rx-data-drv-microamp = <2910>;
> +	rx-internal-delay-ps = <1500>;
> +	tx-internal-delay-ps = <1500>;
> +};

Ditto, move the vendor properties below the common ones.

> +&pwmdac {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> -- 
> 2.49.0
> 

Best regards,
Yao Zi
