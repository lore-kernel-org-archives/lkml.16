Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9682899;
	Wed,  9 Apr 2025 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183024; cv=none; b=CP7sp2W9PofOgGD10EgS31vfKCzEYK4VGpFUBQm7PbYBF1KPrZU8hw2E/8nG11fEbMSRbQc7RKxktytAi1lhiggWQiUsc799VYq33wXT4TQeDpJHZ/bhg7hdD4gSfrFGKLcNPGMNCxUd3Q+AmEWs32wSWODp2RkovtpnWJMa624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183024; c=relaxed/simple;
	bh=r2zp0Jh8f4vqUHginnmtJJBhdbwal4jkb2aBS8B/mZ4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0Nzi4twZJhp/+6Xhbd3hdo/ebIebz+JV4nVvImTy3ggZaQDY8mvuWMspyReCgox8/OOV1UpHu8rqf9Ma3ACkZTziOAeRwwXFgfqXAAGcqwwbNyKwtbWSQgrY4Lhvxu9asem8sTNUCwNgvqh3WxzMeihWgkBvqJr3W57eUKdn0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/45KJsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/45KJsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5435EC4CEE3;
	Wed,  9 Apr 2025 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744183023;
	bh=r2zp0Jh8f4vqUHginnmtJJBhdbwal4jkb2aBS8B/mZ4=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:From;
	b=B/45KJsbBRhKG8E7BNsN4qAy714i1ne3/AZYDME5ZLdyHWHnZgGeBzrwq+Qtf6W4i
	 shnt0BNjqVp49hN9/ePRmD61+1zuFHm4MOeg5CVEoKonwnOwpZPmiEFqfyGPqZRSX6
	 cdprmZtxHokShPwvQJEfD7ao1ZPYjG+hUjRUclXvqJGbZP/OLUF0bRKWfjA75KZ9V/
	 xuW/fH2C8ARBN/9HzekxEGQFIUB4PiFRGuZU3CTO8R304uhrnk5s+qkHMGLtfUCuPS
	 nBfx5MKT/aYXq3pFfQERYJEhR+hp3K0pLdxbqPs6y626xB7OK1fQOq/bbA9vUrYw4K
	 stwFGSBgk23IA==
From: krzk@kernel.org
Date: Wed, 9 Apr 2025 09:17:01 +0200
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250409-calculating-hungry-mosquito-f8cfeb@shite>
rom: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407-am62lx-v4-2-ce97749b9eae@ti.com>

On Mon, Apr 07, 2025 at 10:34:39AM GMT, Bryan Brattlof wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add the initial infrastructure needed for the AM62L. ALl of which can be
> found in the Technical Reference Manual (TRM) located here:
> 
>     https://www.ti.com/lit/pdf/sprujb4
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v3:
>  - Added more nodes now that the SCMI interface is ready
> 
> Changes in v1:
>  - switched to non-direct links to TRM updates are automatic
>  - fixed white space indent issues with a few nodes
>  - separated out device tree bindings
> ---
>  arch/arm64/boot/dts/ti/Makefile              |   3 +
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi    | 672 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi |  19 +
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi  | 144 ++++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi         | 121 +++++
>  arch/arm64/boot/dts/ti/k3-am62l3.dtsi        |  67 +++
>  arch/arm64/boot/dts/ti/k3-pinctrl.h          |   2 +
>  7 files changed, 1028 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 03d4cecfc001c..93df47282add3 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -32,6 +32,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
>  
> +# Boards with AM62Lx SoCs
> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
> +
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> new file mode 100644
> index 0000000000000..697181c2e7f51
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -0,0 +1,672 @@
> +// SPDX-License-Identifier: GPL-2.0-only or MIT
> +/*
> + * Device Tree file for the AM62L main domain peripherals
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> + *
> + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
> + */
> +
> +&cbass_main {
> +	gic500: interrupt-controller@1800000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
> +		      <0x00 0x01840000 0x00 0xc0000>,	/* GICR */
> +		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
> +		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
> +		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		/*
> +		 * vcpumntirq:
> +		 * virtual CPU interface maintenance interrupt
> +		 */
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		gic_its: msi-controller@1820000 {
> +			compatible = "arm,gic-v3-its";
> +			reg = <0x00 0x01820000 0x00 0x10000>;
> +			socionext,synquacer-pre-its = <0x1000000 0x400000>;
> +			msi-controller;
> +			#msi-cells = <1>;
> +		};
> +	};
> +
> +	gpio0: gpio@600000 {
> +		compatible = "ti,am64-gpio", "ti,keystone-gpio";
> +		reg = <0x00 0x00600000 0x00 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 267 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		power-domains = <&scmi_pds 34>;
> +		clocks = <&scmi_clk 140>;
> +		clock-names = "gpio";
> +		ti,ngpio = <126>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		status = "disabled";
> +	};
> +
> +	gpio2: gpio@610000 {
> +		compatible = "ti,am64-gpio", "ti,keystone-gpio";

64 or 62?
> +		reg = <0x00 0x00610000 0x00 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 281 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 283 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 284 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 285 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 286 IRQ_TYPE_EDGE_RISING>,
> +			     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		power-domains = <&scmi_pds 35>;
> +		clocks = <&scmi_clk 141>;
> +		clock-names = "gpio";
> +		ti,ngpio = <79>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		status = "disabled";
> +	};
> +
> +	timer0: timer@2400000 {
> +		compatible = "ti,am654-timer";

64? 654? 62? You need to use proper compatibles matching the hardware
(see writing bindings).

> +		reg = <0x00 0x2400000 0x00 0x400>;
> +		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&scmi_clk 47>;
> +		clock-names = "fck";
> +		power-domains = <&scmi_pds 15>;
> +		ti,timer-pwm;
> +	};
> +


...

> +		chipid: chipid@14 {
> +			compatible = "ti,am654-chipid";
> +			reg = <0x14 0x4>;
> +			bootph-all;
> +		};
> +
> +		usb0_phy_ctrl: syscon@45000 {
> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> +			reg = <0x45000 0x4>;
> +			bootph-all;
> +		};
> +
> +		usb1_phy_ctrl: syscon@45004 {
> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> +			reg = <0x45004 0x4>;

No, you do not get syscon per register. The entire point of syscon is to
collect ALL registers. Your device is the syscon, not a register.

Best regards,
Krzysztof

