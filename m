Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012141CD15;
	Fri,  6 Jun 2025 00:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749171116; cv=none; b=r5fiQKMKIrXZOr4ze1ndQeJOfqO8PyDyy+BAvXmXx4yzatJtdZSK6O9EXaHQ7xyl1WTDDxsiqJefHgvsXMH+skzxYsms46aJrAEQqy/sbchgFUOa6pJJ5gUTNe/M325ZvOHPQVjonv3UnkcQ9onp/e3TKd7zHEhK3xWThQPlMHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749171116; c=relaxed/simple;
	bh=6Nm5wKH2gLRJXtw6pTRP6GaKKzBhe+GS4TRaNH00bVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUXhCqy4OTuApBPp9CzXHRDLoB3p7kh1aqA3/zNcQjYVfMNTzAFBAWHTNJqFr7u73FCugt7/BcT0WvdzuABhc4dRYtgRAI6IloHclW3uMHj5uFt9I4YKIUcUelXIL9bYlqH4VRV6CB9uE4NDRbeAUxdHyUKo9JdqLkOM+20kvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwgPxoVy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwgPxoVy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so18929265e9.1;
        Thu, 05 Jun 2025 17:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749171111; x=1749775911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pDd/em4BnTremoHZ4ljFwRuxK1c22ANbjaIWqYoupN4=;
        b=gwgPxoVyu6Qy3xIykguZHkK0I9igwWAzXOcc8XsyrV7MICeRYRbiNNFVLetcuZoJXp
         7bs+oLa8HAqCxZem/DDRHvP6Uql4Vk1Wey7c6ThG8nk87ox5Z/Ws7mHyluyzO/ekA/LE
         7vZ6xJZ4RMpZ3vrMAgCjCUQKxVJGMccrOYPrWIOeFzYybsNBc6GKz+44XZJXXVVEtRgB
         ALBnGpJNFJCf5CAeIo39bnbAOxHjUNaaKodrBmUT47q+GEBXiKucPEYUjwBPuk6izz3M
         ZGfkp/aFRNMuD7Fw8zKeP44GNtvXJdyG6MQDpNoPQyNXU5gaYwMPKtDVFvA4UAx3hj0t
         JZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749171111; x=1749775911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDd/em4BnTremoHZ4ljFwRuxK1c22ANbjaIWqYoupN4=;
        b=llh2H+Q3gXtuiernjl3fvkP8LwervQimluSrjQZXIFxvgGF4Ug57zeXbQi55+RBk7f
         TnPeNTTSazSGYQ5ezstMzvbu2UAxD0qEK63YJliE+dzy3pnptVcBNRJ0enozA1R+Q9vU
         GYA5dKu72ADkX1Pbmk3A+9uCJnPmAwu2E5nQqNF94FBUI+ofrJ/zy3bxoLK/+jhSQ0L2
         BLghr1RirQN8HwTHSwhv1bHQGSj8BVx8k6uuxPgT3L3uTO1aP+DOmT1yA+mycJnDmgs5
         VpgfRWuANErr5DgWP4/IYD1LFqtMiqpCeD77WvGPUJlY5TF3mh7I3ldoYgwmukFflJ8n
         jz/A==
X-Forwarded-Encrypted: i=1; AJvYcCX2LqiyMFTHeCUzZbXCZYdjSGm/S0RK0v0JiQW1sCT+VxMOIWjhcxIiJsRxQ/xVKD7WHvUwGuAH8fh/@vger.kernel.org, AJvYcCX4jqO0lr7zu/7SRTevomUqOLagb9OOpCHNmIhRmk26HIooGqXEaBfME/dIwwMc1drZODTyx4+r2+iFDDRT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi52nmbVwp9yezJjQOUGLDUx9mkNeswTScrtmVBYiuMc8fcp1o
	W1ou7+DwF2Mx7mR5ZSi0kzOg/l/XmMYsuC9nUanYvRwbs5YuGJm9/R+STP8IEJRf2ZuKYsVoQta
	5Y+MkNv6p87h8bmHo44FX3pBkKoKqrqQ=
X-Gm-Gg: ASbGncsatP2Uw/63EL1GsxKOQNQKbrvDDrcGi68mlAMfl91pFDPgDXfKALdnpPUVgm/
	EYkPl0cqddYOZpopCNGefBFvjCB87xWmeqqmcqq2EwW+8eVc6+zcMHqYHSyy7G1E/bGFBqyeGew
	3J3ce8K+Zq+q9l9yz/YiE9cUoYnrqIBp2hpjaX9vJJMp9z21qDQLDNnuyIKkb85HP4BKthu3KVy
	w==
X-Google-Smtp-Source: AGHT+IFmJe8yFH3mtq1Z6Tv7efTynx3Rh7g1ZDY0N3/XsC7tUoceZKE++OJZinpMI9oi2tnQpCU05SbiAGXhzc5oB+w=
X-Received: by 2002:a05:6000:310e:b0:3a4:e480:b5df with SMTP id
 ffacd0b85a97d-3a531cdcf1bmr1029174f8f.44.1749171110901; Thu, 05 Jun 2025
 17:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com> <20250605-rk3588s-cm5-io-dts-upstream-v4-2-8445db5ca6b0@gmail.com>
In-Reply-To: <20250605-rk3588s-cm5-io-dts-upstream-v4-2-8445db5ca6b0@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Thu, 5 Jun 2025 19:51:39 -0500
X-Gm-Features: AX0GCFsRkfO5vf9GbjFEfVPfc0GUX68k1KXUdvbKCGuPNLJHp2VacWfI4Po_q7M
Message-ID: <CALWfF7J-Lygg+N3oH+p7XkPvH_6ZbvTRY6CaZzFqDixzSgDHBA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: rockchip: Add rk3588 based Radxa CM5
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Steve deRosier <derosier@cal-sierra.com>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7946fe2bb4e721689e3eb4d60d8e9783402f05e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Joseph Kogut <joseph.kogut@gmail.com>
> + */
> +
> +/*
> + * CM5 data sheet
> + * https://dl.radxa.com/cm5/v2210/radxa_cm5_v2210_schematic.pdf
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +
> +/ {
> +       compatible = "radxa,cm5", "rockchip,rk3588s";
> +
> +       aliases {
> +               mmc0 = &sdmmc;
Since the microSD card is on the carrier board, this alias should be
moved to the board DTS.

> +               mmc1 = &sdhci;
Most of the other Radxa rk3588 boards have the eMMC alias to mmc0. Why
does this use another convention?

> +               mmc2 = &sdio;
The sdio is not enabled. This alias won't be used.

> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led_sys: led-0 {
> +                       color = <LED_COLOR_ID_BLUE>;
> +                       default-state = "on";
> +                       function = LED_FUNCTION_HEARTBEAT;
> +                       gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +};
> +
> +&cpu_b0 {
> +       cpu-supply = <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b1 {
> +       cpu-supply = <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b2 {
> +       cpu-supply = <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_b3 {
> +       cpu-supply = <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_l0 {
> +       cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +       cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +       cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +       cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&gmac1 {
> +       clock_in_out = "output";
> +       phy-handle = <&rgmii_phy1>;
> +       phy-mode = "rgmii-id";
> +       phy-supply = <&vcc_3v3_s0>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&gmac1_miim
> +                    &gmac1_tx_bus2
> +                    &gmac1_rx_bus2
> +                    &gmac1_rgmii_clk
> +                    &gmac1_rgmii_bus
> +                    &gmac1_clkinout>;
> +       status = "okay";
> +};
Should this be left disabled on the SoM dtsi? And only enabled on the
carrier board, if the carrier board has the RJ45 jack?
i.e. a handheld using the CM5 may not have ethernet
https://github.com/StonedEdge/Retro-Lite-CM5

> +
> +&gpu {
> +       mali-supply = <&vdd_gpu_s0>;
> +       status = "okay";
> +};
> +
> +&hdmi0 {
> +       status = "okay";
> +};
This should be moved to the carrier board DTS where all the other
HDMI0 nodes are.

> +
> +&i2c0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c0m2_xfer>;
> +       status = "okay";
> +
> +       vdd_cpu_big0_s0: regulator@42 {
> +               compatible = "rockchip,rk8602";
> +               reg = <0x42>;
> +               fcs,suspend-voltage-selector = <1>;
> +               regulator-name = "vdd_cpu_big0_s0";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt = <550000>;
> +               regulator-max-microvolt = <1050000>;
> +               regulator-ramp-delay = <2300>;
> +               vin-supply = <&vcc5v0_sys>;
> +
> +               regulator-state-mem {
> +                       regulator-off-in-suspend;
> +               };
> +       };
> +
> +       vdd_cpu_big1_s0: regulator@43 {
> +               compatible = "rockchip,rk8602";
> +               reg = <0x43>;
> +               fcs,suspend-voltage-selector = <1>;
> +               regulator-name = "vdd_cpu_big1_s0";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt = <550000>;
> +               regulator-max-microvolt = <1050000>;
> +               regulator-ramp-delay = <2300>;
> +               vin-supply = <&vcc5v0_sys>;
> +
> +               regulator-state-mem {
> +                       regulator-off-in-suspend;
> +               };
> +       };
> +};
> +
> +&mdio1 {
> +       rgmii_phy1: phy@1 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0x1>;
> +       };
> +};
> +
> +&pd_gpu {
> +       domain-supply = <&vdd_gpu_s0>;
> +};
> +
> +&sdhci {
> +       bus-width = <8>;
> +       no-sdio;
> +       no-sd;
> +       non-removable;
> +       max-frequency = <200000000>;
> +       mmc-hs400-1_8v;
> +       mmc-hs400-enhanced-strobe;
> +       mmc-hs200-1_8v;
> +       status = "okay";
> +};
> +

Jimmy
