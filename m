Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4A6145B25;
	Tue, 13 May 2025 18:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161854; cv=none; b=Uf2szNJbxSqhJwPxWXnyC57LIAgEUc5vX5VFQg9dr1iDw7v82TfGxllvOi/+jj34PFav84+8QqlXnFcDuma3gSi1SoYOan9aOANgXXht4zkkjoSGGkOtXiwZLlDnSmOwoChaQYjDEKfrq5Bys8EdDOrEXrPCGy0KzvLU3RxvgqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161854; c=relaxed/simple;
	bh=reLz897hVz05HvXtHa9lTriiIjTIaDJtuS3Ke0IaOSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAU1Wo95qmCvV12HzuTgQEos533gFGWm9UHaDxf/8IoXwhtjf8oAhQ7I8TuHQEGdAdn4AyLElW4KUySSZhqDtMtngFerLb5mffQG30GpT9EGIx8umPCI/6UnnaFBHlPKN7CgCEF8vLxFjW20iNJVVgMwmiz7+0VhYr2VBEQStwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=N1MArj0D; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="N1MArj0D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/OBINtI0SAZP2fUdQnW19FOxjYjmq02Jp24p47V1i4U=; b=N1MArj0DxnQLp1gnjOJp7tC7Yi
	9upVlge54nLsV6IlChGDVcNBfiltmQWCdo7msRylE6vERsX8YOWC566zrpDtt2BRdQJ80VBhwAbMC
	6vGnv2yUYRLGHo+ciUKU8b9Y56fziOS5LCBa2HqAoJird5xIlQMbVpv7HI265ICDT+T9EAGRmYpAt
	9mNmOGzJcm1Aq8tKeWhG855fyQaEL38UBnXHMVn21/sFIb2PM15uvPvyvQiJwaE84w8Dql9BLUzyP
	cfn9ngGz78gBZrHxUpOAJMJfnFLIDH0M87ajaIYlaBKH772g9+3eJyGhk8N7nG9vHMxM+MzxbZ4X3
	y6Bj3Xnw==;
Received: from [61.8.147.169] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEubM-0003sw-Um; Tue, 13 May 2025 20:43:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Fred Bloggs <f.blogs@napier.co.nz>, Hsun Lai <i@chainsx.cn>
Cc: Hsun Lai <i@chainsx.cn>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH v1 3/3] arm64: dts: rockchip: add DTs for Sakura Pi RK3308B
Date: Tue, 13 May 2025 20:43:39 +0200
Message-ID: <2678259.iZASKD2KPV@phil>
In-Reply-To: <20250513163515.177472-4-i@chainsx.cn>
References:
 <20250513163515.177472-1-i@chainsx.cn> <20250513163515.177472-4-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Dienstag, 13. Mai 2025, 18:35:14 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Hsun Lai:

> +	vcc5v0_sys: vcc5v0-sys {

preferred node-names for regulators is regulator-foo, so here please
regulator-vcc5v0-sys (phandle can stay as it is).

Same for all the other fixed-/pwm- regulators below.

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	vdd_core: vdd-core {
> +		compatible =3D "pwm-regulator";
> +		pwms =3D <&pwm0 0 5000 1>;
> +		regulator-name =3D "vdd_core";
> +		regulator-min-microvolt =3D <827000>;
> +		regulator-max-microvolt =3D <1340000>;
> +		regulator-init-microvolt =3D <1015000>;
> +		regulator-settling-time-up-us =3D <250>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		pwm-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vdd_log: vdd-log {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_log";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1050000>;
> +		regulator-max-microvolt =3D <1050000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc_ddr: vcc-ddr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_ddr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1500000>;
> +		regulator-max-microvolt =3D <1500000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc_1v8: vcc-1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_1v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		vin-supply =3D <&vcc_io>;
> +	};
> +
> +	vcc_io: vcc-io {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_io";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc_phy: vcc-phy-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_phy";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc5v0_otg: vcc5v0-otg {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_otg";
> +		regulator-always-on;
> +		gpio =3D <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&otg_vbus_drv>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +};


> +&i2c1 {

empty i2c controller? I guess it is routed to the external pins?
If so, could use a comment explaining that.


> +/* SPI0 for external gpio pin */
> +&spi0 {
> +	status =3D "okay";
> +
> +	spi_dev@0 {
> +		compatible =3D "spidev";

having a generic spidev is not allowed. If there is an actual
device connected there, it should have a real compatible.
If that isn't a real device, this could be handled in an overlay.


> +		reg =3D <0>;
> +		spi-max-frequency =3D <0x2faf080>;
> +	};
> +};
> +
> +/* SPI1 for ws2812*/
> +&spi1 {
> +	status =3D "okay";
> +
> +	spi_dev@0 {
> +		compatible =3D "spidev";

same as above, please no generic spidev

> +		reg =3D <0>;
> +		spi-max-frequency =3D <0x2faf080>;
> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rtc_32k>;
> +
> +	usb {

please sort these nodes alphabetically

> +		otg_vbus_drv: otg-vbus-drv {
> +			rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	sdio-pwrseq {
> +		wifi_enable_h: wifi-enable-h {
> +			rockchip,pins =3D <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	wifi {
> +		wifi_host_wake: wifi-host-wake {
> +			rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +
> +	bluetooth {
> +		bt_reg_on: bt-reg-on {
> +			rockchip,pins =3D <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		bt_wake_host: bt-wake-host {
> +			rockchip,pins =3D <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		host_wake_bt: host-wake-bt {
> +			rockchip,pins =3D <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&pwm0 {
> +	status =3D "okay";

status as last property

> +	pinctrl-0 =3D <&pwm0_pin_pull_down>;
> +};
> +
> +&saradc {
> +	vref-supply =3D <&vcc_1v8>;
> +	status =3D "okay";
> +};
> +
> +&pwm3 {

please sort phandles alphabetically

> +	status =3D "okay";
> +};
> +
> +&i2c1 {

same

> +	status =3D "okay";
> +};


Thanks
Heiko


