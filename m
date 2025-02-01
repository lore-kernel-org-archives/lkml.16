Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB58C125;
	Sat,  1 Feb 2025 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738390116; cv=none; b=odTZlCgZs/0HJX0R/i7NamX7XTLXNrmqiz5xW/b/tsr6YybKwQ6zZAkcKoY6kdlHkQom6tMMSz4p87HjQ7qM6aUlMdRWAm2FoSJ367Z1+ag+SFEo7CmI2DuKKU2ZpF8NjO/DY3u2PRXnjA+/bSA4c1L3yj/9W6t8yDg6etFz6vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738390116; c=relaxed/simple;
	bh=pZ/zoNmZ4ED7ytCEzwIYOZLKRlOCdiLIPbBCgR1z9KQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=d0o/xyWTIVGm83MTx1s1W99BdxvBX5Orb28zhXk0ouv0SLAac9RvZifEHQ2pJ4E30/kAK7c1GMKnofvW82IofaEZhM2/AWpcryCgIvK+m1WMdc05go33OipNXOi7Cs9/W/vmERk48s9i7LlAtJDN1f2BIwotJcs0b+2icVmcsy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBlT/YOh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBlT/YOh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1200739f8f.3;
        Fri, 31 Jan 2025 22:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738390113; x=1738994913; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5L29TJa6m72S7CSmyGeNFab1Ftr8bq9pTOKm5Xk3pg=;
        b=iBlT/YOhOOT4+SnSqsiVJSzr9PD6LoRrwcaYQhREbZelWo61YsrqPY500q6L9GeDBd
         KgY/geXbE1H2F6s4PTXHmKyqQAz+iJbAuLkatsujNLhlBwzgqnmrAuIqmwrl4HKOFswK
         k6NB9tbvl5JYv9sqonFf+BLApH7iwA020ZXnduS+lBW+nAnajE3C7+xnqoiGCXbHW6PS
         4zcA88YKeiWnRJ93Ej8qFL4FB37MIT8zxSbzdYoX9NUkkKCmTcuQ8yjI1oxRUkOQhk+j
         5bPNwaWrauCdJp2UzYRfbYDRqNkBSjk0PoOdmZFzqy5mihxu9tUnkxl/GWmnnRFUOplc
         SHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738390113; x=1738994913;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5L29TJa6m72S7CSmyGeNFab1Ftr8bq9pTOKm5Xk3pg=;
        b=vjhHxDacEU/l7gq1uihx6hs804skI/WRuOy2rTb/nDx69HId7qIDQpgkn64tvLgYR0
         QhSNEUOW5GMTWR+HF6X+p9m6OZLrTUkopFpKytxXRXAALfYJS1b/NmBHBXlCR0Z+fFr3
         4Lub5cCKo5skbvqkGwnrflkRCfPFyW4lEvjDZmVLeIPSdlq8CPRuCN5Pvd8QkQOKldaj
         gFoIRjctt7I/2NCzAoeJP65mlfK2p2UoveAgD702DAwT0aBg9dMGr/1mg8aKl9aLXQXc
         VGWVZRUSFLkpTch6g+9/tCXVoDDiLWCHslPCbUCZVNSQvl8/MkoZcQhDQweKRlcngG/H
         +lRg==
X-Forwarded-Encrypted: i=1; AJvYcCXSlWClehQcSl/VIL4Rupq8i7HbrJkU0YhSyr7wp4GJ+w0Ngb2/r367gMmhm7720mrVPTzcr7zJ9u/IXs5P@vger.kernel.org, AJvYcCXzMw+AdOYcu2cEPZ6ALjymU4qNPkhTWzD0geM2zHGfZTI6dlDty9Dm6MBkJXFLsGDAj73uu9s7qX5X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5Rq8Ny4h1LPzSGswZc6NQYj47co/CtwhNJrneTftxgnizT9p
	AZHlmN6kzifSjDD9kFL6CX3JyW/xOZHhjRA0px89976VDyNG9V/Ls2n4FQ==
X-Gm-Gg: ASbGnctnRe46WjSVFS2QQr8/J5bWLGUGIeyB4qFgjDN4KKMRs3olz0lzpKYVJ6AsTh3
	0AkwAAUZhlOrPSYEFH8MxABwsjBGd5wu4FLMKMfCEh8Cbj//Pqm8JPFtQmDhy7PyopiBeNwkCJq
	SnHrjHk3Mnv0mzvhJt/CyXPJYkyzwxyl/1iv5VO3H05CI4+Kz2CSuTu/DilVFOMTw7WY2eUq1aZ
	bhFTRfbQqIyHDwT0O904f14QwaKOJkYIQ/Ouuzjes2GMBGO1sXN303iBU1eqY/TOm/bX0WCprUn
	RSS8YC7X29EVVqmcBcmHEiGBRhGEbR9j5aCr/A==
X-Google-Smtp-Source: AGHT+IEYH0pv6AduWyKxWc4Cd6i+pLbjNEsHL1oQVmGX+xC5axAa4pD6AzuvU5iIR9IRc8PkpJqOFw==
X-Received: by 2002:a05:6000:188b:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-38c5195f498mr12879535f8f.27.1738390112591;
        Fri, 31 Jan 2025 22:08:32 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42dfsm78311155e9.4.2025.01.31.22.08.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2025 22:08:32 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250131200319.19996-3-funderscore@postmarketos.org>
Date: Sat, 1 Feb 2025 10:08:17 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>,
 Karl Chan <exxxxkc@getgoogleoff.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5270ED13-CF9D-4ACE-A52C-EFDB0F71494E@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-3-funderscore@postmarketos.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-Mailer: Apple Mail (2.3826.200.121)

> On 1 Feb 2025, at 12:03=E2=80=AFam, Ferass El Hafidi =
<funderscore@postmarketos.org> wrote:
>=20
> From: Ferass El Hafidi <funderscore@postmarketos.org>
>=20
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released =
in=20
> 2020.  It is known as `xiaomi-aquaman` internally.  Specifications:
> * Amlogic S805Y SoC
> * Android TV 9, upgradable to Android TV 10
> * 8 GB eMMC
> * 1 GB of RAM
>=20
> The devicetree is based on p241's DT, with some changes to better =
match
> the Mi TV Stick.

Explain the bits that are omitted/different (see comments below).

>=20
> Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> ---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
> 2 files changed, 312 insertions(+)
> create mode 100644 =
arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile =
b/arch/arm64/boot/dts/amlogic/Makefile
> index 2fbda8419..0921707f1 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -49,6 +49,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D =
meson-gxbb-wetek-hub.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-wetek-play2.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s805x-libretech-ac.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s805x-p241.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s805y-xiaomi-aquaman.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905d-libretech-pc.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905d-mecool-kii-pro.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905d-p230.dtb
> diff --git =
a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts =
b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> new file mode 100644
> index 000000000..6b72f054a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
> + * Based on meson-gxl-s805x-p241.dtb:
> + *  - Copyright (c) 2018 BayLibre, SAS.
> + *    Author: Neil Armstrong <narmstrong@baylibre.com>
> + *    Author: Jerome Brunet <jbrunet@baylibre.com>

If this was cloned from the p241 file I would retain the Baylibre
Copyright and add myself as an additional author. You=E2=80=99ve =
extended
their work not created a new one.

> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-aiu.h>
> +
> +#include "meson-gxl-s805x.dtsi"

Amlogic Y variants normally omit CVBS, Ethernet, SD, and sometimes IR,
so you could clone the s805x.dtsi and remove nodes there, then include
an s805y.dtsi file. Perhaps not worth the effort for a single device
at this time, but could be done as future optimisation.

> +
> +/ {
> + compatible =3D "xiaomi,aquaman", "amlogic,s805x", =
"amlogic,meson-gxl";

After updating the bindings, use =E2=80=9Camlogic,s805y=E2=80=9D here.

> + model =3D "Xiaomi Mi TV Stick (S805Y)";

I=E2=80=99d use =E2=80=9CXiaomi Mi TV Stick (Aquaman)=E2=80=9D so the =
connection between the
binding name and model name is obvious.

> +
> + aliases {
> + serial0 =3D &uart_AO;
> + serial1 =3D &uart_A;
> + };
> +
> + au2: analog-amplifier {
> + compatible =3D "simple-audio-amplifier";
> + sound-name-prefix =3D "AU2";
> + VCC-supply =3D <&vcc_5v>;
> + enable-gpios =3D <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> + };
> +
> + chosen {
> + stdout-path =3D "serial0:115200n8";
> + };
> +
> + cvbs-connector {
> + /* No CVBS connector */
> + status =3D "disabled";
> + };
> +
> + emmc_pwrseq: emmc-pwrseq {
> + compatible =3D "mmc-pwrseq-emmc";
> + reset-gpios =3D <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> + };
> +
> + hdmi-connector {
> + compatible =3D "hdmi-connector";
> + type =3D "a";
> +
> + port {
> + hdmi_connector_in: endpoint {
> + remote-endpoint =3D <&hdmi_tx_tmds_out>;
> + };
> + };
> + };
> +
> + leds {
> + compatible =3D "gpio-leds";
> +
> + led-white {
> + color =3D <LED_COLOR_ID_WHITE>;
> + function =3D LED_FUNCTION_POWER;
> + gpios =3D <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> + default-state =3D "heartbeat";
> + panic-indicator;
> + };
> + };
> +
> + memory@0 {
> + device_type =3D "memory";
> + reg =3D <0x0 0x0 0x0 0x40000000>;
> + };
> +
> + vddio_boot: regulator-vddio-boot {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDIO_BOOT";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <1800000>;
> + };
> +
> + vddao_3v3: regulator-vddao-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDAO_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + };
> +
> + vddio_ao18: regulator-vddio-ao18 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDIO_AO18";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <1800000>;
> + };
> +
> + vcc_3v3: regulator-vcc-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VCC_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + };
> +
> + vcc_5v: regulator-vcc-5v {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VCC_5V";
> + regulator-min-microvolt =3D <5000000>;
> + regulator-max-microvolt =3D <5000000>;
> + };
> +
> +
> + emmc_pwrseq: emmc-pwrseq {
> + compatible =3D "mmc-pwrseq-emmc";
> + reset-gpios =3D <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> + };
> +
> + wifi32k: wifi32k {
> + compatible =3D "pwm-clock";
> + #clock-cells =3D <0>;
> + clock-frequency =3D <32768>;
> + pwms =3D <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> + };
> +
> + sdio_pwrseq: sdio-pwrseq {
> + compatible =3D "mmc-pwrseq-simple";
> + reset-gpios =3D <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> + clocks =3D <&wifi32k>;
> + clock-names =3D "ext_clock";
> + };
> +
> + sound {
> + compatible =3D "amlogic,gx-sound-card";
> + model =3D "MI-AQUAMAN";

Just =E2=80=9CAQUAMAN=E2=80=9D ?

> + audio-aux-devs =3D <&au2>;
> + audio-widgets =3D "Line", "Lineout";
> + audio-routing =3D "AU2 INL", "ACODEC LOLN",
> + "AU2 INR", "ACODEC LORN",
> + "Lineout", "AU2 OUTL",
> + "Lineout", "AU2 OUTR";
> + clocks =3D <&clkc CLKID_MPLL0>,
> + <&clkc CLKID_MPLL1>,
> + <&clkc CLKID_MPLL2>;
> +
> + assigned-clocks =3D <&clkc CLKID_MPLL0>,
> +  <&clkc CLKID_MPLL1>,
> +  <&clkc CLKID_MPLL2>;
> + assigned-clock-parents =3D <0>, <0>, <0>;
> + assigned-clock-rates =3D <294912000>,
> +       <270950400>,
> +       <393216000>;
> +
> + dai-link-0 {
> + sound-dai =3D <&aiu AIU_CPU CPU_I2S_FIFO>;
> + };
> +
> + dai-link-1 {
> + sound-dai =3D <&aiu AIU_CPU CPU_I2S_ENCODER>;
> + dai-format =3D "i2s";
> + mclk-fs =3D <256>;
> +
> + codec-0 {
> + sound-dai =3D <&aiu AIU_HDMI CTRL_I2S>;
> + };
> +
> + codec-1 {
> + sound-dai =3D <&aiu AIU_ACODEC CTRL_I2S>;
> + };
> + };
> +
> + dai-link-2 {
> + sound-dai =3D <&aiu AIU_HDMI CTRL_OUT>;
> +
> + codec-0 {
> + sound-dai =3D <&hdmi_tx>;
> + };
> + };
> +
> + dai-link-3 {
> + sound-dai =3D <&aiu AIU_ACODEC CTRL_OUT>;
> +
> + codec-0 {
> + sound-dai =3D <&acodec>;
> + };
> + };
> + };
> +};
> +
> +&acodec {
> + AVDD-supply =3D <&vddio_ao18>;
> + status =3D "okay";
> +};
> +
> +&aiu {
> + status =3D "okay";
> +};
> +
> +&cec_AO {
> + status =3D "okay";
> + pinctrl-0 =3D <&ao_cec_pins>;
> + pinctrl-names =3D "default";
> + hdmi-phandle =3D <&hdmi_tx>;
> +};
> +
> +&ethmac {
> + /* No Ethernet connector */
> + status =3D "disabled";
> +};
> +
> +&internal_phy {
> + pinctrl-0 =3D <&eth_link_led_pins>, <&eth_act_led_pins>;
> + pinctrl-names =3D "default";
> +};
> +
> +&ir {
> + /* No IR */
> + status =3D "disabled";
> +};
> +
> +&hdmi_tx {
> + status =3D "okay";
> + pinctrl-0 =3D <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> + pinctrl-names =3D "default";
> + hdmi-supply =3D <&vcc_5v>;
> +};
> +
> +&hdmi_tx_tmds_port {
> + hdmi_tx_tmds_out: endpoint {
> + remote-endpoint =3D <&hdmi_connector_in>;
> + };
> +};
> +
> +&saradc {
> + status =3D "okay";
> + vref-supply =3D <&vddio_ao18>;
> +};
> +
> +/* Wireless SDIO Module */
> +&sd_emmc_a {
> + status =3D "disabled";
> + pinctrl-0 =3D <&sdio_pins>;
> + pinctrl-1 =3D <&sdio_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> +
> + bus-width =3D <4>;
> + cap-sd-highspeed;
> + max-frequency =3D <50000000>;
> +
> + non-removable;
> + disable-wp;
> +
> + /* WiFi firmware requires power to be kept while in suspend */
> + keep-power-in-suspend;
> +
> + mmc-pwrseq =3D <&sdio_pwrseq>;
> +
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddio_boot>;

If you add a generic SDIO node here board variants will have working
WiFi regardless of the module used. The idea is used here:

=
https://patchwork.kernel.org/project/linux-amlogic/patch/20241127043358.37=
99737-1-christianshewitt@gmail.com/

> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> + status =3D "okay";
> + pinctrl-0 =3D <&emmc_pins>, <&emmc_ds_pins>;
> + pinctrl-1 =3D <&emmc_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> +
> + bus-width =3D <8>;
> + cap-mmc-highspeed;
> + max-frequency =3D <200000000>;
> + non-removable;
> + disable-wp;
> + mmc-ddr-1_8v;
> + mmc-hs200-1_8v;
> +
> + mmc-pwrseq =3D <&emmc_pwrseq>;
> + vmmc-supply =3D <&vcc_3v3>;
> + vqmmc-supply =3D <&vddio_boot>;
> +};
> +
> +&pwm_ef {
> + status =3D "okay";
> + pinctrl-0 =3D <&pwm_e_pins>;
> + pinctrl-names =3D "default";
> + clocks =3D <&clkc CLKID_FCLK_DIV4>;
> + clock-names =3D "clkin0";
> +};
> +
> +/* This is connected to the Bluetooth module: */
> +&uart_A {
> + status =3D "okay";
> + pinctrl-0 =3D <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> + pinctrl-names =3D "default";
> + uart-has-rtscts;
> +};
> +
> +&uart_AO {
> + status =3D "okay";
> + pinctrl-0 =3D <&uart_ao_a_pins>;
> + pinctrl-names =3D "default";
> +};
> +
> +&usb {
> + status =3D "okay";
> + dr_mode =3D "host";
> +};
> +
> +&usb2_phy0 {
> + phy-supply =3D <&vcc_5v>;
> +};
> --=20
> 2.47.1
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

