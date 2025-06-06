Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE37F1F5FD;
	Fri,  6 Jun 2025 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749172125; cv=none; b=sSH3CaP7OmgNVJ6HTNlEtbYNWvG/UVBRsFbIiCE0EpadK6AhErokVQbWQSut1Uzz38yaft8suyic/SO8Zb/zO5rox3B/P98mCiAnT53Ks7vOhoHuSgrN4GSV01F8xuhh+vGFqd7Y03ckaVuyeM78tBoK9Goc4ti6lNccQTXfdA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749172125; c=relaxed/simple;
	bh=8SL2a+NREpoUleyOuYyYWpd3wsXsziDs5U6boRAlMkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXb0Xhc6s9RgE06DE/gGDGCzA3oB0adEzxflO1g3xdQJxthTze2lMSf4MwTA+3OxHm3kgToowIxpwSvZBY2bseH65jo2Yzql4+n8msKoW9QHQFsYsXyicM1aQYvM/iy3XLnkE1kNGfNFo6/1LsvoqboJaK9sxhzJt1WVn8mPQlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CN1mFCAD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CN1mFCAD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so949472f8f.0;
        Thu, 05 Jun 2025 18:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749172121; x=1749776921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYEjVTO2q/fjJO6JezW3+jRHybTTzDDRHZ1q8l7EvLQ=;
        b=CN1mFCADPk1dPJxU82ZyTJVup8BleSFeWOEX4NRZ4QSmmQMvO9hJPb287dNLrXEPEu
         MA6dztUn7+XVfW/j52N4LVRmYK26IyF2nHi3+PZjSAcNuxVL8HQ4ZGmxPfFKElOuw6tL
         Jb0yi+MmsaT8+clI4ZQSC7c5kRJBAbGPdr0KChMg0mctrx2Qdx5Wg4q7Nm/pumMe2aZy
         43HOqlWlGhv+rEaixCeicVAJttFRACE0XzJnZC1v8p++HmIUZXeIuEBhlQIVHWjxXja7
         ozn+RweUWLPP7uzLCPSLc25zYozeSwf0YUZ3mv037Uw6/FW4AOVqymyzDhKhTXk+JPoo
         D53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749172121; x=1749776921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYEjVTO2q/fjJO6JezW3+jRHybTTzDDRHZ1q8l7EvLQ=;
        b=mBqcGoMfuOJfNG3LyHySmZLcpCrmkmTkSdvhSsCaWEdCIWQ1tsgsh/SOCBo3TB7Duw
         x4KQW83CswX8CsZiYrx7Ou1IfdCg/FnNupe5ThBgE/C0c7IS1KF3RAJn0Muk3jh7x5C9
         WfF0g1kBkVFnRFmLzhUOsuiEWwWv1Ms39EkqEOouAp89hvicbiIS9Xp+CW0Uzvj4fq4O
         n8kQgcnPiVZ499a5M0m9LnTOfgbDaXTUSwnL20IkteriP+uhjziFGntmAf3H/rVimmdg
         Bno5CaDb9IuWsszvFDa/uCngoWevKi2JO/U433k1NEip9HB91hvA2RFQFvACefNaDK7X
         h4jw==
X-Forwarded-Encrypted: i=1; AJvYcCVx2MB7iwbkfuRqxmvyfwmTOI+tLtNC2sQNlcof5og3i6UoHKFOAdx77w67yVV0jH7kiOmYTx0IBAU4R8GK@vger.kernel.org, AJvYcCXeP5E1nNMk95HkDbiR14ruEs2Ftpw5Vb5qy+OX6SExrwO5ak6aVP587WzeMY5iInaYPWP5gx+ls7Nu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg4WFz6AYvHouhBSxT7n/611KtRPwtF5PGw5+KLmbE7SnqA0An
	xqpjw85ikTcaMQtO0DR15J65hlEpEXuEt5zDyYPGPaco2GhMlACRSXkC98SzLWlSqm77pJwdho1
	XeLC4dfDW4H0mmIcVW5g4ub8q5sjvNfc=
X-Gm-Gg: ASbGnct2csXjqRfVL18K7DRzr6RB+pTzUxoskLfT45COl46F0fH51UUeVu69M22Bqgn
	x9zPncCaGNe7woEMp6OKT9Nt73tUtlK2MZWuDcewITAf4TcUfha/AzutRVhytD4IgZXsVh4gYea
	d0Bay04J/Cm39YU4XbZLhXTkvt2u0gBeOLnAGLCowR3mjqwskT6OgXnwXVz4Kg/atPc4WBwZx95
	w==
X-Google-Smtp-Source: AGHT+IF+6pMLhgiX4zBVs0Fe6pTgAuITrX03lpxx0NRlUqiouMTEwuTggJbNGe7ZCqUV7VghrQC9ibWfMUhJrnnSXV0=
X-Received: by 2002:a05:6000:22c4:b0:3a5:276b:1ec0 with SMTP id
 ffacd0b85a97d-3a531ce1597mr932220f8f.45.1749172120878; Thu, 05 Jun 2025
 18:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com> <20250605-rk3588s-cm5-io-dts-upstream-v4-3-8445db5ca6b0@gmail.com>
In-Reply-To: <20250605-rk3588s-cm5-io-dts-upstream-v4-3-8445db5ca6b0@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Thu, 5 Jun 2025 20:08:29 -0500
X-Gm-Features: AX0GCFujXVtxOnpFzKqd0ojvPNjZKkxPqWKAR-S3rOnWfhImO9uPIOpPfZIkgp4
Message-ID: <CALWfF7+BS1jHVrfNC9=OL0vcNoNqeXYBAwF3ueb1xVpfGf0s2A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add support for CM5 IO carrier
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Steve deRosier <derosier@cal-sierra.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 6:12=E2=80=AFPM Joseph Kogut <joseph.kogut@gmail.com=
> wrote:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..6bdb38464820278fc94e0ceb8=
93e204df33c0381
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> @@ -0,0 +1,454 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Joseph Kogut <joseph.kogut@gmail.com>
> + */
> +
> +/*
> + * CM5 IO board data sheet
> + * https://dl.radxa.com/cm5/v2200/radxa_cm5_io_v2200_schematic.pdf
> + */
> +
> +/dts-v1/;
> +#include "rk3588s.dtsi"
> +#include "rk3588s-radxa-cm5.dtsi"
> +
> +/ {
> +       model =3D "Radxa Compute Module 5 (CM5) IO Board";
> +       compatible =3D "radxa,cm5-io", "radxa,cm5", "rockchip,rk3588s";
> +
> +       chosen {
> +               stdout-path =3D "serial2:1500000n8";
> +       };
> +
> +       hdmi-con {
> +               compatible =3D "hdmi-connector";
> +               type =3D "a";
> +
> +               port {
> +                       hdmi_con_in: endpoint {
> +                               remote-endpoint =3D <&hdmi0_out_con>;
> +                       };
> +               };
> +       };
> +
> +       vcc12v_dcin: regulator-12v0-vcc-dcin {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc12v_dcin";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <12000000>;
> +               regulator-max-microvolt =3D <12000000>;
> +       };
> +
> +       vcc5v0_host: vcc5v0-host-regulator {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_host";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vcc5v0_host_en>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       vcc5v0_sys: regulator-5v0-sys {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc12v_dcin>;
> +       };
> +
> +       vbus5v0_typec: vbus5v0-typec {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vbus5v0_typec";
> +               gpio =3D <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vbus5v0_typec_en>;
> +               enable-active-high;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       vcc3v3_pcie: regulator-3v3-vcc-pcie {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3_pcie2x1l0";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               enable-active-high;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               gpios =3D <&gpio1 RK_PD3 GPIO_ACTIVE_HIGH>;
> +               startup-delay-us =3D <50000>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       vcc_3v3_s0: pldo-reg4 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_3v3_s0";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-ramp-delay =3D <12500>;
> +
> +               regulator-state-mem {
> +                       regulator-off-in-suspend;
> +               };
> +       };
> +};
> +
> +&combphy0_ps {
> +       status =3D "okay";
> +};
> +
> +&combphy2_psu {
> +       status =3D "okay";
> +};
> +

If you do end up moving the gmac1 enablement to the board, you should
also add an ethernet0 alias at the board level. Mainline does not
define the ethernet0 and ethernet1 aliases at the SoC level, like the
rockchip BSP kernel does (since not all boards will use gmac0 and
gmac1).

> +&hdmi0_in {
> +       hdmi0_in_vp0: endpoint {
> +               remote-endpoint =3D <&vp0_out_hdmi0>;
> +       };
> +};
> +
> +&hdmi0_out {
> +       hdmi0_out_con: endpoint {
> +               remote-endpoint =3D <&hdmi_con_in>;
> +       };
> +};
> +
> +&hdptxphy0 {
> +       status =3D "okay";
> +};
You could also enable hdmi0_sound and i2s5_8ch. It's enabled in the
Radxa BSP kernel.

> +
> +&i2c6 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c6m3_xfer>;
> +       status =3D "okay";
> +
> +       fusb302: usb-typec@22 {
> +               compatible =3D "fcs,fusb302";
> +               reg =3D <0x22>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usbc0_int>;
> +               vbus-supply =3D <&vbus5v0_typec>;
> +
> +               connector {
> +                       compatible =3D "usb-c-connector";
> +                       data-role =3D "dual";
> +                       label =3D "USB-C";
> +                       power-role =3D "dual";
> +                       try-power-role =3D "sink";
> +                       source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_=
USB_COMM)>;
> +                       sink-pdos =3D <PDO_FIXED(5000, 1000, PDO_FIXED_US=
B_COMM)>;
> +                       op-sink-microwatt =3D <1000000>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       usbc0_orientation_switch: endpoin=
t {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_orientation_switch>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       usbc0_role_switch: endpoint {
> +                                               remote-endpoint =3D <&usb=
_host0_xhci_role_switch>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +                                       usbc0_dp_altmode_mux: endpoint {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_dp_altmode_mux>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&pcie2x1l2 {
> +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> +       vpcie3v3-supply =3D <&vcc3v3_pcie>;
> +       status =3D "okay";
> +};
> +
> +&pinctrl {
> +       fusb302 {
> +               vbus5v0_typec_en: vbus5v0-typec-en {
> +                       rockchip,pins =3D <0 RK_PD5 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usbc0_int: usbc0-int {
> +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +
> +       usb {
> +               vcc5v0_host_en: vcc5v0-host-en {
> +                       rockchip,pins =3D <1 RK_PA0 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +};
> +
> +&sdhci {
> +       status =3D "okay";
> +};
This is already enabled at the SoM dtsi.

> +
> +&sdmmc {
> +       bus-width =3D <4>;
> +       cap-mmc-highspeed;
> +       cap-sd-highspeed;
> +       disable-wp;
> +       max-frequency =3D <200000000>;
> +       no-sdio;
> +       no-mmc;
> +       sd-uhs-sdr104;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det>;
> +       vmmc-supply =3D <&vcc_3v3_s3>;
> +       vqmmc-supply =3D <&vccio_sd_s0>;
> +       status =3D "okay";
> +};
> +
> +&spi2 {
> +       assigned-clocks =3D <&cru CLK_SPI2>;
> +       assigned-clock-rates =3D <200000000>;
> +       num-cs =3D <1>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&spi2m2_cs0 &spi2m2_pins>;
> +       status =3D "okay";
> +
> +       pmic@0 {
> +               compatible =3D "rockchip,rk806";
> +               reg =3D <0x0>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pmic_pins>, <&rk806_dvs1_null>,
> +                           <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> +               spi-max-frequency =3D <1000000>;
> +               system-power-controller;
> +
> +               vcc1-supply =3D <&vcc5v0_sys>;
> +               vcc2-supply =3D <&vcc5v0_sys>;
> +               vcc3-supply =3D <&vcc5v0_sys>;
> +               vcc4-supply =3D <&vcc5v0_sys>;
> +               vcc5-supply =3D <&vcc5v0_sys>;
> +               vcc6-supply =3D <&vcc5v0_sys>;
> +               vcc7-supply =3D <&vcc5v0_sys>;
> +               vcc8-supply =3D <&vcc5v0_sys>;
> +               vcc9-supply =3D <&vcc5v0_sys>;
> +               vcc10-supply =3D <&vcc5v0_sys>;
> +               vcc11-supply =3D <&vcc_2v0_pldo_s3>;
> +               vcc12-supply =3D <&vcc5v0_sys>;
> +               vcc13-supply =3D <&vdd2_ddr_s3>;
> +               vcc14-supply =3D <&vdd2_ddr_s3>;
> +               vcca-supply =3D <&vcc5v0_sys>;
> +
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               rk806_dvs1_null: dvs1-null-pins {
> +                       pins =3D "gpio_pwrctrl1";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               rk806_dvs2_null: dvs2-null-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               rk806_dvs3_null: dvs3-null-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               regulators {
> +                       vdd_gpu_s0: dcdc-reg1 {
> +                               regulator-name =3D "vdd_gpu_s0";
> +                               regulator-boot-on;
> +                               regulator-enable-ramp-delay =3D <400>;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-ramp-delay =3D <12500>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_cpu_lit_s0: dcdc-reg2 {
> +                               regulator-name =3D "vdd_cpu_lit_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-ramp-delay =3D <12500>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vccio_sd_s0: pldo-reg5 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vccio_sd_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd2_ddr_s3: dcdc-reg6 {
> +                               regulator-name =3D "vdd2_ddr_s3";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
> +                       };
> +
> +                       vcc_2v0_pldo_s3: dcdc-reg7 {
> +                               regulator-name =3D "vdd_2v0_pldo_s3";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <2000000>;
> +                               regulator-max-microvolt =3D <2000000>;
> +                               regulator-ramp-delay =3D <12500>;
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
2000000>;
> +                               };
> +                       };
> +
> +                       vcc_3v3_s3: dcdc-reg8 {
> +                               regulator-name =3D "vcc_3v3_s3";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
3300000>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&u2phy0 {
> +       status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +       status =3D "okay";
> +};
> +
> +&u2phy2 {
> +       status =3D "okay";
> +};
> +
> +&u2phy2_host {
> +       status =3D "okay";
> +};
> +
> +&u2phy3 {
> +       status =3D "okay";
> +};
> +
> +&u2phy3_host {
> +       status =3D "okay";
> +};
> +
> +&uart2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart2m0_xfer>;
> +       status =3D "okay";
> +};
> +
> +&usb_host0_ehci {
> +       status =3D "okay";
> +};
> +
> +&usb_host0_ohci {
> +       status =3D "okay";
> +};
> +
> +&usb_host0_xhci {
> +       dr_mode =3D "otg";
> +       usb-role-switch;
> +       status =3D "okay";
> +
> +       port {
> +               usb_host0_xhci_role_switch: endpoint {
> +                       remote-endpoint =3D <&usbc0_role_switch>;
> +               };
> +       };
> +};
> +
> +&usb_host1_ehci {
> +       status =3D "okay";
> +};
> +
> +&usb_host1_ohci {
> +       status =3D "okay";
> +};
> +
Is the combphy2_psu used for a USB 3.0 port? If so, you'll need to
enable usb_host2_xhci.

> +&usbdp_phy0 {
> +       mode-switch;
> +       orientation-switch;
> +       sbu1-dc-gpios =3D <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
> +       sbu2-dc-gpios =3D <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
> +       status =3D "okay";
> +
> +       port {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               usbdp_phy0_orientation_switch: endpoint@0 {
> +                       reg =3D <0>;
> +                       remote-endpoint =3D <&usbc0_orientation_switch>;
> +               };
> +
> +               usbdp_phy0_dp_altmode_mux: endpoint@1 {
> +                       reg =3D <1>;
> +                       remote-endpoint =3D <&usbc0_dp_altmode_mux>;
> +               };
> +       };
> +};
> +
> +&vop {
> +       status =3D "okay";
> +};
> +
> +&vop_mmu {
> +       status =3D "okay";
> +};
> +
> +&vp0 {
> +       vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +               reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
> +               remote-endpoint =3D <&hdmi0_in_vp0>;
> +       };
> +};

Jimmy
