Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1CA19C554;
	Fri, 23 May 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983645; cv=none; b=OPUfas+I3IYdoZtlhil1GTkAff8IcRG4NUPvk//f+maJc+Vyn6HOwAe5j7qNT9z0yVmzgQbclolBXuNr8ovohCI3utQbIfDFWTxo9o5tNmerYcQN0iUJd1hwHkU4NTHa1EpbyuH98cHkF1akYl0c4LKY7OOWVAdEPSC8Gc/1xQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983645; c=relaxed/simple;
	bh=8WCJbnqixS0gV3zgM0YYZWjc6DTcQ87mv5+b+jVxxHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P6FpLm84EX15vRKFfBehNnju8VytsVAbGhcLQSvIgBBGPSg7YssuhsqfD9ZtyoSgv4k1715RlYENzL8fnWA2Ia4COKyc/qJpQavM2PKsEJEECVuqVe50iy86sdBRf5fFvjbafmcrbzEWe6gvGGNYNoK3BcRtMw9dSwH/dhXHs3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.214.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1625f069b;
	Fri, 23 May 2025 15:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: i@chainsx.cn
Cc: devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
Date: Fri, 23 May 2025 15:00:26 +0800
Message-Id: <20250523070026.50263-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519075432.2239713-3-i@chainsx.cn>
References: <20250519075432.2239713-3-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkpOVkMdSkxMTE9KHU1MQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VCQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a96fbf181af03a2kunmfbc2900462617
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46Hjo5LzE1CBYCTgI3Vh9N
	UR4aFA1VSlVKTE9MQkNITUhKTE1OVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUJCWVdZCAFZQU9ITkM3Bg++

Hi,

> <snip>
> +		led-0 {
> +			default-state = "on";
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};

From PATCH v1, led-1 is a user-led, so it would be better
to make it off by default.

Please also add `color = xxx` to these leds.

> +	vcc5v0_usbdcin: regulator-vcc5v0-usbdcin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usbdcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};

The DC of this board is 12V, why is there 5V?

> <snip>
> +	vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie20";
> +		enable-active-high;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <5000>;
> +		gpio = <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;

Please put enable/gpio before regulator.

> <snip>
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc5v0_host_en>;
> +		regulator-name = "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?
It will be enabled through the corresponding phy-supply.

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> +	vbus5v0_typec_pwr_en: vbus5v0-typec-pwr-en-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&typec5v_pwren>;
> +		regulator-name = "vbus5v0_typec_pwr_en";

Please use the regulator name from schematics.
xxx_pwr_en is usually the name of the pinctrl.

> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?
It will be enabled through the corresponding phy-supply.

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = ...
> +	pinctrl-names = "default";

pinctrl-names should be placed before pinctrl-0

> <snip>
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			op-sink-microwatt = <1000000>;
> +			power-role = "dual";
> +			sink-pdos =
> +				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
> +			source-pdos =
> +				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "sink";

The TYPE-C of this board does not seem to support pd power supply?

> <snip>
> +	};
> +};
> +

Extra blank lines.

> +
> +&i2c3 {
> +	status = "okay";

> <snip>
> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +				<&rk806_dvs2_null>, <&rk806_dvs3_null>;

Align Indent.

> <snip>
> +	};
> +};
> +

Extra blank lines.

> +
> +&tsadc {
> +	status = "okay";
> +};

> <snip>
> +&u2phy0_otg {
> +	status = "okay";
> +};

> +&u2phy3_host {
> +	status = "okay";
> +};

Missing phy-supply?

--
2.25.1

