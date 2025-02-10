Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928581C07C6;
	Mon, 10 Feb 2025 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177706; cv=none; b=po7fdFGi/jT2dyhj3mF6GMBMiUYwMTqmBCyEZICUETY6pjhd942aR82oJGgqosP+xYcTD8QcCee7vNcZhqdtH8b9+OWUvFy4mVJ2wpXp+4OecMXp3+cQ2uTcB0K+yGuMMmwuZc4iXzfvJ2hoHrXGIpwpflOWNFHW2T4U6cAOqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177706; c=relaxed/simple;
	bh=1wEXGJKcurF+XfisQ5qSR9bzpi4fUcawaiSk2FPYeVc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=snLt3K3zh/9eMRXG/nPMoWFuHqtBOF3/Zfj57faDuyPU0JER5bZy7R/zg5g3EZ/qI8B9QIKT59IS7Ar8TsEG0rZCTTjt9BqkLOCu4DXwkNPWYOn4tKzxHUDYbk5Ks7DdXpeF5wLd9QI2FpdBgKzl0eFTVxQKVjxBlswSe05dLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=v0J0YdnD; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="v0J0YdnD"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739177702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJDsXEUj7b3zFzIa56IlFMlf0KA++lbCdlBM2nqsilY=;
	b=v0J0YdnDhV2JdIPnHjExKgY7f+g62uivJWpRaaDng8nXi8FVRlv/E4cVWE6BdMbojTJv9H
	LcIIphbc1mib1Pa7dFu5slwoLl6s99GENLAGqEknDpxL1R7Yt9in2+KYvm+wxiJY0jG4GU
	yDPYzG9lou4DhNIHVpe1Db6ugDR8feK1wRyHmm0w8seXgwK5aPuWAPmB5Vu0s2bA0Zyrqy
	80ZmOfa7vSbS8aGY/At+mDKaPCOp7IbnyJCT/zFb4vRdVc3mB67m6mR6rRp9db/oQBM4gM
	BZg55pmuEN4f0LICXuwvoT4k+4Lo0gb5PykDZ/yRNbkNKV8RH5JYjBxUt5Wpyw==
Date: Mon, 10 Feb 2025 09:55:02 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 4/4] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar
In-Reply-To: <20250207-pre-ict-jaguar-v5-4-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-4-a70819ea0692@cherry.de>
Message-ID: <eca58eff9c22a96ea03507b7a8a015dc@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-02-07 16:20, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Pre-ICT tester adapter connects to RK3588 Jaguar SBC through its
> proprietary Mezzanine connector.
> 
> It exposes a PCIe Gen2 1x M.2 connector and two proprietary camera
> connectors. Support for the latter will come once the rest of the 
> camera
> stack is supported.
> 
> Additionally, the adapter loops some GPIOs together as well as route
> some GPIOs to power rails.
> 
> This adapter is used for manufacturing RK3588 Jaguar to be able to test
> the Mezzanine connector is properly soldered.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   5 +
>  .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 
> +++++++++++++++++++++
>  2 files changed, 176 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> 8f93e0c4d6032d0ca2d93f44384c027e53aa5efb..58664453e019496420dfec7b781cc313fab04185
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -145,6 +145,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += 
> rk3588-firefly-itx-3588j.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
> @@ -197,6 +198,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=
> rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> 
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtb
> +rk3588-jaguar-pre-ict-tester-dtbs := rk3588-jaguar.dtb \
> +	rk3588-jaguar-pre-ict-tester.dtbo
> +
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
>  rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
>  	rk3588-rock-5b-pcie-ep.dtbo

Looking good to me, thanks for the patch!  The employed approach
was already discussed and commented in detail in the v4 of this
series, [*] so please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Please note that my tag applies to the changes introduced to the
Makefile only, because I have no clue about the actual hardware
design and don't have access to the schematic of the ICT tester
described in the new .dtso file below.

[*] 
https://lore.kernel.org/linux-rockchip/a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org/T/#u


> diff --git
> a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
> b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..9d44dfe2f30d793accb994a230c58038f0c3daad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2024 Cherry Embedded Solutions GmbH
> + *
> + * Device Tree Overlay for the Pre-ICT tester adapter for the 
> Mezzanine
> + * connector on RK3588 Jaguar.
> + *
> + * This adapter has a PCIe Gen2 x1 M.2 M-Key connector and two 
> proprietary
> + * camera connectors (each their own I2C bus, clock, reset and PWM
> lines as well
> + * as 2-lane CSI).
> + *
> + * This adapter routes some GPIOs to power rails and loops together 
> some other
> + * GPIOs.
> + *
> + * This adapter is used during manufacturing for validating proper 
> soldering of
> + * the mezzanine connector.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +&{/} {
> +	pre_ict_tester_vcc_1v2: regulator-pre-ict-tester-vcc-1v2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pre_ict_tester_vcc_1v2";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +	};
> +
> +	pre_ict_tester_vcc_2v8: regulator-pre-ict-tester-vcc-2v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pre_ict_tester_vcc_2v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +	};
> +};
> +
> +&combphy0_ps {
> +	status = "okay";
> +};
> +
> +&gpio3 {
> +	pinctrl-0 = <&pre_ict_pwr2gpio>;
> +	pinctrl-names = "default";
> +};
> +
> +&pcie2x1l2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2x1l2_perstn_m0>;
> +	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>; /* 
> PCIE20X1_2_PERSTN_M0 */
> +	vpcie3v3-supply = <&vcc_3v3_s3>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	pcie2x1l2 {
> +		pcie2x1l2_perstn_m0: pcie2x1l2-perstn-m0 {
> +			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pre-ict-tester {
> +		pre_ict_pwr2gpio: pre-ict-pwr2gpio-pins {
> +			rockchip,pins =
> +			/*
> +			 * GPIO3_A3 requires two power rails to be properly
> +			 * routed to the mezzanine connector to report a proper
> +			 * value: VCC_1V8_S0_1 and VCC_IN_2. It may report an
> +			 * incorrect value if VCC_1V8_S0_1 isn't properly routed,
> +			 * but GPIO3_C6 would catch this HW soldering issue.
> +			 * If VCC_IN_2 is properly routed, GPIO3_A3 should be
> +			 * LOW. The signal shall not read HIGH in the event
> +			 * GPIO3_A3 isn't properly routed due to soldering
> +			 * issue. Therefore, let's enforce a pull-up (which is
> +			 * the SoC default for this pin).
> +			 */
> +				<3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>,
> +			/*
> +			 * GPIO3_A4 is directly routed to VCC_1V8_S0_2 power
> +			 * rail. It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_B2 requires two power rails to be properly
> +			 * routed to the mezzanine connector to report a proper
> +			 * value: VCC_1V8_S0_1 and VCC_IN_1. It may report an
> +			 * incorrect value if VCC_1V8_S0_1 isn't properly routed,
> +			 * but GPIO3_C6 would catch this HW soldering issue.
> +			 * If VCC_IN_1 is properly routed, GPIO3_B2 should be
> +			 * LOW. This is an issue if GPIO3_B2 isn't properly
> +			 * routed due to soldering issue, because GPIO3_B2
> +			 * default bias is pull-down therefore being LOW. So
> +			 * the worst case scenario and the pass scenario expect
> +			 * the same value. Make GPIO3_B2 a pull-up so that a
> +			 * soldering issue on GPIO3_B2 reports HIGH but proper
> +			 * soldering reports LOW.
> +			 */
> +				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>,
> +			/*
> +			 * GPIO3_C6 is directly routed to VCC_1V8_S0_1 power
> +			 * rail. It should be HIGH if all is properly soldered.
> +			 * This is an issue if GPIO3_C6 or VCC_1V8_S0_1 isn't
> +			 * properly routed due to soldering issue, because
> +			 * GPIO3_C6 default bias is pull-up therefore being HIGH
> +			 * in all cases:
> +			 *  - GPIO3_C6 is floating (so HIGH) if GPIO3_C6 is not
> +			 *    routed properly,
> +			 *  - GPIO3_C6 is floating (so HIGH) if VCC_1V8_S0_1 is
> +			 *    not routed properly,
> +			 *  - GPIO3_C6 is HIGH if everything is proper,
> +			 * Make GPIO3_C6 a pull-down so that a soldering issue
> +			 * on GPIO3_C6 or VCC_1V8_S0_1 reports LOW but proper
> +			 * soldering reports HIGH.
> +			 */
> +				<3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D2 is routed to VCC_5V0_1 power rail through a
> +			 * voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D3 is routed to VCC_5V0_2 power rail through a
> +			 * voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD3 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D4 is routed to VCC_3V3_S3_1 power rail through
> +			 * a voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D5 is routed to VCC_3V3_S3_2 power rail through
> +			 * a voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +};
