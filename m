Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621251F4639;
	Wed, 14 May 2025 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224085; cv=none; b=FA/wfhPNAs30ymA5bJj/VNU5WjEhNSLv799gBgPjHU+nie0FL1tVseoW4j5d7LIbkwbYm1WKV+2DBojMRAfjWbsXz1/O532rP+jBgmI/231rf6sX5MzUxAMKCmSExmSiiyhdWGNc+82j4vWDhzbaYm5gmVBQCgm6aIkML02JuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224085; c=relaxed/simple;
	bh=sNOBhPsNu5uN3QG+pzL5WuBSB/PwDT1RXFryXSkgpkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YH+Gc/9HH8EWWWZKwHLeGmvzgzvSV3vxO/I0Svg1P9kMSVe01DnnWDJzFAifQESNyRakcZ0ZucGSUVbPzkqDzx5pYedanqeqAJnoAGnIULfj5T9yQWghLEeJCUmehJoJr9m2jvxRAobClqnCaks3yiuyDS2v3SPF3+0t3W64SDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.215.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15068bee2;
	Wed, 14 May 2025 20:01:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: chainsx@foxmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
Date: Wed, 14 May 2025 20:00:24 +0800
Message-Id: <20250514120024.609948-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>
References: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQksZVk5LGR9ITR1OQktDTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJT09ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a96ceaba7c903a2kunm15068bee2
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6Ajo5LzE3ED44CE4WFTQu
	FClPFD5VSlVKTE9MSUlPS0xCSktIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUlPT1lXWQgBWUFPSU5JNwY+

Hi,

> <snip>
> +	leds: leds {

No aliases needed.

> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_gpio>;
> +
> +		power_led: power {
> +			label = ":power";

Please use standard LED binding.
e.g.
```
color = <LED_COLOR_ID_BLUE>;
function = LED_FUNCTION_POWER;
```

> +			linux,default-trigger = "heartbeat";
> +			default-state = "on";

default-state is not needed.

> +			gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		user_led: user {
> +			label = ":user";
> +			linux,default-trigger = "ir-user-click";

This LED should be user-defined?

> +			default-state = "off";
> +			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		user1_led: user1 {
> +			label = ":user1";
> +			default-state = "off";
> +			gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
> +		};
> +	};

> <snip>
> +	vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie20";
> +		regulator-always-on;

Why does this regulator require always-on?

> <snip>
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		regulator-name = "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?

> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> +	vbus5v0_typec_pwr_en: vbus5v0-typec-pwr-en-regulator {
> +		regulator-name = "vbus5v0_typec_pwr_en";

Please use the name from schematics.

> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?

> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> <snip>
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big1_s0>;
> +};

Please add other cpu nodes: cpu_l1-l3, cpu_b1-b3

+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-rxid";
+	tx_delay = <0x43>;

Please try using rgmii-id and remove the delay.

> <snip>
> +&i2c2 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c2m0_xfer>;

status should be placed behind.

> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +		#clock-cells = <0>;
> +		clock-output-names = "hym8563";

clock should be placed before interrupt.

> +	usbc0: usb-typec@22 {

This node should be placed before vdd_npu_s0.

> <snip>
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id001c.c916";

The phy used in this board is RTL8211FVD, not RTL8211F.
Please use "ethernet-phy-ieee802.3-c22" instead of hardcoding.

> <snip>
> +&sdhci {
> +	bus-width = <8>;
> +	max-frequency = <200000000>;

max-frequency is already defined in rk3588-base.dtsi

> <snip>
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	no-sdio;
> +	no-mmc;

The sdmmc controller supports sdio devices.
If no-mmc is defined, cap-mmc-highspeed is useless.

> <snip>
> +&spi2 {
> +	status = "okay";

status should be placed behind.

> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +				<&rk806_dvs2_null>, <&rk806_dvs3_null>;

Align Indent.

> <snip>
> +&uart7 {
> +	pinctrl-0 = <&uart7m2_xfer>;
> +	status = "okay";
> +};

It seems that uart2 (default serial port) is missing?

--
2.25.1

