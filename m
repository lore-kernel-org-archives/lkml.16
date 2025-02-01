Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C732AD20
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738404743; cv=none; b=tuuLUI6wI9lBs/lTlgdXM6FUozdlpksiwmMYx5s4e+9YOusmtHYQVz4iZf/9CZ+YoRkWJcWSpT89Pb4qOHxZ0tqMQpHzt/nkftmMzVwexRn8qszGK5cUBQ3k3fpkZGzDEJotN2OYPocF/tEdmiJQMd8Pxk94VIIqeYfUq3nriDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738404743; c=relaxed/simple;
	bh=tGInMMMleDAhCmJVlaRp4GECTwuh9dtDoXgJ5KB+UlE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=VIVH1S4c9FbqY6qUN4Ttf8SyixfdZ19C7HXa5mvXM3PGvCXkV0cUeAjRl9G1FVVxR1mStsVQ3v4S/i8+yALLtkPU7SeIgWl84dWPBxhBDDIMbNekfC/jKJCFB3dD+4vA3xiholp/zc55PE2SbWkuhxVd2sapwv4qACq4tNpr2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=EGwXNjan; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="EGwXNjan"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738404734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFbT05SfZvUFWwT8uQdi/z38WfP7tpfQ+gJgo7bSaVE=;
	b=EGwXNjanDNbXGCEcXxbPSyA2aIaWdTvAYLXh0tuIXVTkoHRwN1AjJHwqObSM6wUz0WzGBR
	p0FYfayb2NNywlE3I9E6etRcFkr/OO4pcTJChDtedRQ4jsyarZzwJJFx2MwKcFAqfKw1Ym
	pzUeq0mxrvRrJBcNExEj3mJfqPlD19cSTUVlk8zbxkCM8jj+RsW6VTxBQjj5F7JDCxIn5L
	T8HNAPoPRLqy0FTn3qIXfE7VBI8vp12JOechI0XOEaD4BSu1mCWfSC+LA7oNsOsMvDzd8W
	J3P+O1wfr2cGxcssgiSL2n3aslq0mv1k2nDitUAShOV/IDA4wjGjo7W1NMqhbw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Feb 2025 10:11:26 +0000
Message-Id: <D7H113ZIQYVN.1V7WM9W27T5PM@postmarketos.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>
To: "Christian Hewitt" <christianshewitt@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-3-funderscore@postmarketos.org>
 <5270ED13-CF9D-4ACE-A52C-EFDB0F71494E@gmail.com>
In-Reply-To: <5270ED13-CF9D-4ACE-A52C-EFDB0F71494E@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Feb 1, 2025 at 6:08 AM UTC, Christian Hewitt wrote:
<snip>
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman=
.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> > new file mode 100644
> > index 000000000..6b72f054a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> > @@ -0,0 +1,311 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
> > + * Based on meson-gxl-s805x-p241.dtb:
> > + *  - Copyright (c) 2018 BayLibre, SAS.
> > + *    Author: Neil Armstrong <narmstrong@baylibre.com>
> > + *    Author: Jerome Brunet <jbrunet@baylibre.com>
>
> If this was cloned from the p241 file I would retain the Baylibre
> Copyright and add myself as an additional author. You=E2=80=99ve extended
> their work not created a new one.
>

I did retain the BayLibre copyright and stated that it is based on the
p241 DT.

> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/sound/meson-aiu.h>
> > +
> > +#include "meson-gxl-s805x.dtsi"
>
> Amlogic Y variants normally omit CVBS, Ethernet, SD, and sometimes IR,
> so you could clone the s805x.dtsi and remove nodes there, then include
> an s805y.dtsi file. Perhaps not worth the effort for a single device
> at this time, but could be done as future optimisation.
>

I could do it in v2.  Could be worth the effort long-term.

> > +
> > +/ {
> > + compatible =3D "xiaomi,aquaman", "amlogic,s805x", "amlogic,meson-gxl"=
;
>
> After updating the bindings, use =E2=80=9Camlogic,s805y=E2=80=9D here.
>
> > + model =3D "Xiaomi Mi TV Stick (S805Y)";
>
> I=E2=80=99d use =E2=80=9CXiaomi Mi TV Stick (Aquaman)=E2=80=9D so the con=
nection between the
> binding name and model name is obvious.
>

I added "(S805Y)" to differenciate from the other, much newer stick also=20
known as an "Xiaomi Mi TV Stick", which uses a completely different Amlogic=
=20
SoC and has different specs, though from what I can tell most commonly call=
=20
that completely different stick, a "Xiaomi Mi TV Stick 4K".

> > +
> > + aliases {
> > + serial0 =3D &uart_AO;
> > + serial1 =3D &uart_A;
> > + };
> > +
> > + au2: analog-amplifier {
> > + compatible =3D "simple-audio-amplifier";
> > + sound-name-prefix =3D "AU2";
> > + VCC-supply =3D <&vcc_5v>;
> > + enable-gpios =3D <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> > + };
> > +
> > + chosen {
> > + stdout-path =3D "serial0:115200n8";
> > + };
> > +
> > + cvbs-connector {
> > + /* No CVBS connector */
> > + status =3D "disabled";
> > + };
> > +
> > + emmc_pwrseq: emmc-pwrseq {
> > + compatible =3D "mmc-pwrseq-emmc";
> > + reset-gpios =3D <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> > + };
> > +
> > + hdmi-connector {
> > + compatible =3D "hdmi-connector";
> > + type =3D "a";
> > +
> > + port {
> > + hdmi_connector_in: endpoint {
> > + remote-endpoint =3D <&hdmi_tx_tmds_out>;
> > + };
> > + };
> > + };
> > +
> > + leds {
> > + compatible =3D "gpio-leds";
> > +
> > + led-white {
> > + color =3D <LED_COLOR_ID_WHITE>;
> > + function =3D LED_FUNCTION_POWER;
> > + gpios =3D <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> > + default-state =3D "heartbeat";
> > + panic-indicator;
> > + };
> > + };
> > +
> > + memory@0 {
> > + device_type =3D "memory";
> > + reg =3D <0x0 0x0 0x0 0x40000000>;
> > + };
> > +
> > + vddio_boot: regulator-vddio-boot {
> > + compatible =3D "regulator-fixed";
> > + regulator-name =3D "VDDIO_BOOT";
> > + regulator-min-microvolt =3D <1800000>;
> > + regulator-max-microvolt =3D <1800000>;
> > + };
> > +
> > + vddao_3v3: regulator-vddao-3v3 {
> > + compatible =3D "regulator-fixed";
> > + regulator-name =3D "VDDAO_3V3";
> > + regulator-min-microvolt =3D <3300000>;
> > + regulator-max-microvolt =3D <3300000>;
> > + };
> > +
> > + vddio_ao18: regulator-vddio-ao18 {
> > + compatible =3D "regulator-fixed";
> > + regulator-name =3D "VDDIO_AO18";
> > + regulator-min-microvolt =3D <1800000>;
> > + regulator-max-microvolt =3D <1800000>;
> > + };
> > +
> > + vcc_3v3: regulator-vcc-3v3 {
> > + compatible =3D "regulator-fixed";
> > + regulator-name =3D "VCC_3V3";
> > + regulator-min-microvolt =3D <3300000>;
> > + regulator-max-microvolt =3D <3300000>;
> > + };
> > +
> > + vcc_5v: regulator-vcc-5v {
> > + compatible =3D "regulator-fixed";
> > + regulator-name =3D "VCC_5V";
> > + regulator-min-microvolt =3D <5000000>;
> > + regulator-max-microvolt =3D <5000000>;
> > + };
> > +
> > +
> > + emmc_pwrseq: emmc-pwrseq {
> > + compatible =3D "mmc-pwrseq-emmc";
> > + reset-gpios =3D <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> > + };
> > +
> > + wifi32k: wifi32k {
> > + compatible =3D "pwm-clock";
> > + #clock-cells =3D <0>;
> > + clock-frequency =3D <32768>;
> > + pwms =3D <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> > + };
> > +
> > + sdio_pwrseq: sdio-pwrseq {
> > + compatible =3D "mmc-pwrseq-simple";
> > + reset-gpios =3D <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> > + clocks =3D <&wifi32k>;
> > + clock-names =3D "ext_clock";
> > + };
> > +
> > + sound {
> > + compatible =3D "amlogic,gx-sound-card";
> > + model =3D "XIAOMI-AQUAMAN";
>
> Just =E2=80=9CAQUAMAN=E2=80=9D ?
>

I wanted to retain the vendor name, and since there is a 15 char limit,
just to be safe I used `MI` instead of `XIAOMI`. But I guess=20
"XIAOMI-AQUAMAN" should be fine after all.

> > + audio-aux-devs =3D <&au2>;
> > + audio-widgets =3D "Line", "Lineout";
> > + audio-routing =3D "AU2 INL", "ACODEC LOLN",
> > + "AU2 INR", "ACODEC LORN",
> > + "Lineout", "AU2 OUTL",
> > + "Lineout", "AU2 OUTR";
> > + clocks =3D <&clkc CLKID_MPLL0>,
> > + <&clkc CLKID_MPLL1>,
> > + <&clkc CLKID_MPLL2>;
> > +
> > + assigned-clocks =3D <&clkc CLKID_MPLL0>,
> > +  <&clkc CLKID_MPLL1>,
> > +  <&clkc CLKID_MPLL2>;
> > + assigned-clock-parents =3D <0>, <0>, <0>;
> > + assigned-clock-rates =3D <294912000>,
> > +       <270950400>,
> > +       <393216000>;
> > +
> > + dai-link-0 {
> > + sound-dai =3D <&aiu AIU_CPU CPU_I2S_FIFO>;
> > + };
> > +
> > + dai-link-1 {
> > + sound-dai =3D <&aiu AIU_CPU CPU_I2S_ENCODER>;
> > + dai-format =3D "i2s";
> > + mclk-fs =3D <256>;
> > +
> > + codec-0 {
> > + sound-dai =3D <&aiu AIU_HDMI CTRL_I2S>;
> > + };
> > +
> > + codec-1 {
> > + sound-dai =3D <&aiu AIU_ACODEC CTRL_I2S>;
> > + };
> > + };
> > +
> > + dai-link-2 {
> > + sound-dai =3D <&aiu AIU_HDMI CTRL_OUT>;
> > +
> > + codec-0 {
> > + sound-dai =3D <&hdmi_tx>;
> > + };
> > + };
> > +
> > + dai-link-3 {
> > + sound-dai =3D <&aiu AIU_ACODEC CTRL_OUT>;
> > +
> > + codec-0 {
> > + sound-dai =3D <&acodec>;
> > + };
> > + };
> > + };
> > +};
> > +
> > +&acodec {
> > + AVDD-supply =3D <&vddio_ao18>;
> > + status =3D "okay";
> > +};
> > +
> > +&aiu {
> > + status =3D "okay";
> > +};
> > +
> > +&cec_AO {
> > + status =3D "okay";
> > + pinctrl-0 =3D <&ao_cec_pins>;
> > + pinctrl-names =3D "default";
> > + hdmi-phandle =3D <&hdmi_tx>;
> > +};
> > +
> > +&ethmac {
> > + /* No Ethernet connector */
> > + status =3D "disabled";
> > +};
> > +
> > +&internal_phy {
> > + pinctrl-0 =3D <&eth_link_led_pins>, <&eth_act_led_pins>;
> > + pinctrl-names =3D "default";
> > +};
> > +
> > +&ir {
> > + /* No IR */
> > + status =3D "disabled";
> > +};
> > +
> > +&hdmi_tx {
> > + status =3D "okay";
> > + pinctrl-0 =3D <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> > + pinctrl-names =3D "default";
> > + hdmi-supply =3D <&vcc_5v>;
> > +};
> > +
> > +&hdmi_tx_tmds_port {
> > + hdmi_tx_tmds_out: endpoint {
> > + remote-endpoint =3D <&hdmi_connector_in>;
> > + };
> > +};
> > +
> > +&saradc {
> > + status =3D "okay";
> > + vref-supply =3D <&vddio_ao18>;
> > +};
> > +
> > +/* Wireless SDIO Module */
> > +&sd_emmc_a {
> > + status =3D "disabled";
> > + pinctrl-0 =3D <&sdio_pins>;
> > + pinctrl-1 =3D <&sdio_clk_gate_pins>;
> > + pinctrl-names =3D "default", "clk-gate";
> > + #address-cells =3D <1>;
> > + #size-cells =3D <0>;
> > +
> > + bus-width =3D <4>;
> > + cap-sd-highspeed;
> > + max-frequency =3D <50000000>;
> > +
> > + non-removable;
> > + disable-wp;
> > +
> > + /* WiFi firmware requires power to be kept while in suspend */
> > + keep-power-in-suspend;
> > +
> > + mmc-pwrseq =3D <&sdio_pwrseq>;
> > +
> > + vmmc-supply =3D <&vddao_3v3>;
> > + vqmmc-supply =3D <&vddio_boot>;
>
> If you add a generic SDIO node here board variants will have working
> WiFi regardless of the module used. The idea is used here:
>
> https://patchwork.kernel.org/project/linux-amlogic/patch/20241127043358.3=
799737-1-christianshewitt@gmail.com/
>

But not all modules are supported in mainline at the moment, that's what I=
=20
meant by "out of scope for this patchset".

> > +};
> > +
> > +/* eMMC */
> > +&sd_emmc_c {
> > + status =3D "okay";
> > + pinctrl-0 =3D <&emmc_pins>, <&emmc_ds_pins>;
> > + pinctrl-1 =3D <&emmc_clk_gate_pins>;
> > + pinctrl-names =3D "default", "clk-gate";
> > +
> > + bus-width =3D <8>;
> > + cap-mmc-highspeed;
> > + max-frequency =3D <200000000>;
> > + non-removable;
> > + disable-wp;
> > + mmc-ddr-1_8v;
> > + mmc-hs200-1_8v;
> > +
> > + mmc-pwrseq =3D <&emmc_pwrseq>;
> > + vmmc-supply =3D <&vcc_3v3>;
> > + vqmmc-supply =3D <&vddio_boot>;
> > +};
> > +
> > +&pwm_ef {
> > + status =3D "okay";
> > + pinctrl-0 =3D <&pwm_e_pins>;
> > + pinctrl-names =3D "default";
> > + clocks =3D <&clkc CLKID_FCLK_DIV4>;
> > + clock-names =3D "clkin0";
> > +};
> > +
> > +/* This is connected to the Bluetooth module: */
> > +&uart_A {
> > + status =3D "okay";
> > + pinctrl-0 =3D <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> > + pinctrl-names =3D "default";
> > + uart-has-rtscts;
> > +};
> > +
> > +&uart_AO {
> > + status =3D "okay";
> > + pinctrl-0 =3D <&uart_ao_a_pins>;
> > + pinctrl-names =3D "default";
> > +};
> > +
> > +&usb {
> > + status =3D "okay";
> > + dr_mode =3D "host";
> > +};
> > +
> > +&usb2_phy0 {
> > + phy-supply =3D <&vcc_5v>;
> > +};
> > --=20
> > 2.47.1
> >=20
> >=20
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic

