Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD31F0E34
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589375; cv=none; b=gj5pAKAr5BKsg8Px6PNEL92/B8WMmzq28dmxKEnSlgtfswulLFlXUKxlPnnMOvf0sUvIW/8WmmExt6lF4U2tMZkgqFtsyEoS5Y8ZmVlMNb/1YTIYh+VrcZgY8uereMPzwObd1pqoC/QuDAP8yaTJKX9swywa6+TeqyIjbz4fyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589375; c=relaxed/simple;
	bh=Wqv44jqsdsXHNZZ0Py7UlIVLoL8po8LiL4dYM3Poszo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdUtqto1pL77nwdrqxWMfQNKSeYW4Pzb6do8WfNpwiKAl5QZwlmD0aHFWpuwWlXKzRpobHfzYZQkso+p2TWzGIcL6Ve7LqW7qLEPpR8Y0JucEHeQ2vmuXHbwtiSNnhIbc5tFZ8Fq6QLpsZJlOh/pHPnLY01yKNMYgdclaa/8rXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FtUWSb5D; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FtUWSb5D"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7f7d5ff805so946787276.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748589372; x=1749194172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgcHaRaxMh2WbXNoh/qrbXHdrEGtMeR1ldHMhM030sw=;
        b=FtUWSb5DLXIW/d/pmg/yKrMZeUoTX+yVZ3cSEncJoOoa6AzDSqWrC/4ROVdQYgIRDq
         0Y95UP3IScJavxl7v/skNmljXdo+OJ22oSSd16ACnkG6VNRsKg027GbFJ7Qt1lUCqhjL
         Uti77YA++zwoXPgG97CmY+09D0ZjtVb/DkpX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748589372; x=1749194172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgcHaRaxMh2WbXNoh/qrbXHdrEGtMeR1ldHMhM030sw=;
        b=G4cjAaPP0F98mGvbCJGYTdT6x6gK+uJ7pA+Z7C7GbG5sDRjxGP0Xx799RioC7c64yo
         uM12WdKMcrA0zoR/vxgbVnbE46rFhCfwy6FTvdwyHtOVsENllPPSCL8cI5oQ4uTNDoJY
         rmzqCYvz6YQbGF5GVy5NLx1YArz2/Sq7ED0KYRMGhhaaraghh9y3h6lWtZBpzgEPySH+
         FyzgWF5WsZhC0Nqvmkzf1JtS+9to0W9ogmKNpd9NTO/hDdy2PmEwPVB3u656L7OkxAQa
         QkfA+1a3/gl3Qn9OZ8YIHHXDZ5aYSHmwvWrBTiif80h1XKP0v709zlMxOo/CP1lXcYNo
         evqA==
X-Gm-Message-State: AOJu0YwK6HBXZE3mbBDTz0oVSlk456j8KUUL6QLMCZ6SM9QDk9AUwGLp
	8mRP/tS8oTEhzVHtZw0rHSsmjc9C0wfMVRGIxx2ZUtHxSOQFszhM3BQN2cELrE2OmUdhhLL2m8y
	DeKwNCHVRBg3X7FBFPxZMBd3bNzafqmZRLYQBUuur2Xb/E0bJRbfd9qc=
X-Gm-Gg: ASbGncuJC+gtcjARP5kCYEbzD+RgR1zKCUmMWIPvtH+c1D4ld+LdGnXPP8GU1ApxD20
	/pbFYvgcJyZh/4+Q5mN8TbtLvxTnw41lcdkJlleeK/F/J6J16bvzP0Cekz8EndKcqjUQXBC8Nbf
	eUB8ofQ/LLLCVNavjuLeEFjPm5DX2e9jsWem4R+354
X-Google-Smtp-Source: AGHT+IGRsXkIuu587xAn1aOXqHZH9/FTuNF5ewSeuATBJbnOQrjPTYZFfIwV+E/yE+CdERS8vXt8QgflfaHX20EKDWA=
X-Received: by 2002:a05:6902:2ec5:b0:e7d:b16f:f804 with SMTP id
 3f1490d57ef6-e7f81de0b4dmr2375591276.15.1748589372522; Fri, 30 May 2025
 00:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
 <20250529143544.2381031-5-dario.binacchi@amarulasolutions.com> <aDiDUm6cvrC2q/SP@lizhi-Precision-Tower-5810>
In-Reply-To: <aDiDUm6cvrC2q/SP@lizhi-Precision-Tower-5810>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 30 May 2025 09:16:01 +0200
X-Gm-Features: AX0GCFvYo9dOy9zIb2T_By8Dl0RHc058BX9IZtozb0vhcx7jqadzWyBHPYQtSZo
Message-ID: <CABGWkvrYiVJn4WdEpNfn8HnZgxYvNJG2Hu59eSvFNvOk7XvkEw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Thu, May 29, 2025 at 5:55=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, May 29, 2025 at 04:35:11PM +0200, Dario Binacchi wrote:
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 128 Mbytes DRAM DDR2
> >  - CAN
> >  - USB 2.0 high-speed/full-speed
> >  - Ethernet MAC
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v4:
> > - Drop label property (deprecated) under the leds sub-nodes.
> > - Add microSD comment above the ssp0 node.
> >
> > Changes in v3:
> > - Drop xceiver-supply property from can0 node.
> > - Rearrange the order of specific nodes and properties
> >   alphabetically.
> >
> > Changes in v2:
> > - Replace '-' with '@' for the pinctrl sub-nodes.
> > - Replace edt,edt-ft5x06 with edt,edt-ft5306.
> > - Drop LCD reset hog pin.
> > - Add correct #address-cells and #size-cells to gpmi node.
> > - Replace edt-ft5x06@38 with touchscreen@38.
> >
> >  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
> >  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 301 ++++++++++++++++++
> >  2 files changed, 302 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> >
> > diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp=
/mxs/Makefile
> > index 96dd31ea19ba..d72ba702b6fa 100644
> > --- a/arch/arm/boot/dts/nxp/mxs/Makefile
> > +++ b/arch/arm/boot/dts/nxp/mxs/Makefile
> > @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) +=3D \
> >       imx23-sansa.dtb \
> >       imx23-stmp378x_devb.dtb \
> >       imx23-xfi3.dtb \
> > +     imx28-amarula-rmm.dtb \
> >       imx28-apf28.dtb \
> >       imx28-apf28dev.dtb \
> >       imx28-apx4devkit.dtb \
> > diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm=
/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> > new file mode 100644
> > index 000000000000..5ef9b79cda1c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> > @@ -0,0 +1,301 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacch=
i@amarulasolutions.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx28.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +     compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> > +     model =3D "Amarula i.MX28 rmm";
> > +
> > +     memory@40000000 {
> > +             reg =3D <0x40000000 0x08000000>;
> > +             device_type =3D "memory";
> > +     };
> > +
> > +     backlight {
> > +             compatible =3D "pwm-backlight";
> > +             pwms =3D <&pwm 4 5000000 0>;
> > +             brightness-levels =3D <0 255>;
> > +             num-interpolated-steps =3D <255>;
> > +             default-brightness-level =3D <255>;
> > +             power-supply =3D <&reg_5v>;
> > +     };
> > +
> > +     beeper {
> > +             compatible =3D "pwm-beeper";
> > +             pwms =3D <&pwm 7 100000 0>;
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&leds_pins>;
> > +
> > +             led-0 {
> > +                     gpios =3D <&gpio2 7 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-1 {
> > +                     gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-2 {
> > +                     gpios =3D <&gpio3 17 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +     };
> > +
> > +     reg_1v8: regulator-1v8 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "1v8";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +     };
> > +
> > +     reg_3v3: regulator-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_5v: regulator-5v {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "5v";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_fec_3v3: regulator-fec-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&fec_3v3_enable_pin>;
> > +             regulator-name =3D "fec-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&gpio3 27 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             startup-delay-us =3D <300000>;
> > +             vin-supply =3D <&reg_5v>;
> > +     };
> > +
> > +     reg_usb0_vbus: regulator-usb0-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&usb0_vbus_enable_pin>;
> > +             regulator-name =3D "usb0_vbus";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             gpio =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_usb1_vbus: regulator-usb1-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&usb1_vbus_enable_pin>;
> > +             regulator-name =3D "usb1_vbus";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             gpio =3D <&gpio2 6 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +     };
> > +};
> > +
> > +&auart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&auart0_2pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +&auart1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&auart1_pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +&can0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&can0_pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +&duart {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&duart_pins_b>;
> > +     status =3D "okay";
> > +};
> > +
> > +&duart_pins_b {
> > +     fsl,voltage =3D <MXS_VOLTAGE_LOW>;
> > +};
> > +
> > +&gpmi {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
>
> Needn't this, dtsi already set it.

Yes,  I can drop #address-cells, it's already set by imx28.dtsi
But I must re-set size-cells.

>
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&gpmi_pins_a &gpmi_status_cfg>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c0_pins_a>;
> > +     status =3D "okay";
> > +
> > +     touchscreen: touchscreen@38 {
> > +             compatible =3D "edt,edt-ft5306";
> > +             reg =3D <0x38>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
> > +             interrupt-parent =3D <&gpio0>;
> > +             interrupts =3D <19 IRQ_TYPE_EDGE_RISING>;
> > +             reset-gpios =3D <&gpio0 21 GPIO_ACTIVE_LOW>;
> > +             wake-gpios =3D <&gpio0 18 GPIO_ACTIVE_HIGH>;
> > +     };
> > +};
> > +
> > +&lradc {
> > +     status =3D "okay";
> > +};
> > +
> > +&mac0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mac0_pins_a>;
> > +     phy-mode =3D "rmii";
> > +     phy-supply =3D <&reg_fec_3v3>;
> > +     phy-handle =3D <&ethphy>;
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ethphy: ethernet-phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     max-speed =3D <100>;
> > +                     reset-gpios =3D <&gpio3 28 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us =3D <4000>;
> > +                     reset-deassert-us =3D <4000>;
> > +             };
> > +     };
> > +};
> > +
> > +&pinctrl {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&hog_pins_a>;
> > +
> > +     edt_ft5x06_pins: edt-ft5x06@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
> > +                     MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,pull-up =3D <MXS_PULL_ENABLE>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +     };
> > +
> > +     edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
> > +             reg =3D <0>;
>
> Any warning report if all reg is 0?

No, I don't see any warnings of that kind. Nor do I see them for those
contained in imx28.dtsi.

Thanks and regards,
Dario
>
> Frank
> > +             fsl,pinmux-ids =3D <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_16mA>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +     };
> > +
> > +     fec_3v3_enable_pin: fec-3v3-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SPDIF__GPIO_3_27>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +     };
> > +
> > +     hog_pins_a: hog@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power *=
/
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +     };
> > +
> > +     leds_pins: leds@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_SSP0_DATA7__GPIO_2_7
> > +                     MX28_PAD_PWM0__GPIO_3_16
> > +                     MX28_PAD_PWM1__GPIO_3_17
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +     };
> > +
> > +     usb0_vbus_enable_pin: usb0-vbus-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +     };
> > +
> > +     usb1_vbus_enable_pin: usb1-vbus-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +     };
> > +};
> > +
> > +&pwm {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pwm4_pins_a &pwm7_pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +/* microSD */
> > +&ssp0 {
> > +     compatible =3D "fsl,imx28-mmc";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
> > +     broken-cd;
> > +     bus-width =3D <4>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usb0 {
> > +     dr_mode =3D "host";
> > +     vbus-supply =3D <&reg_usb0_vbus>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usb1 {
> > +     dr_mode =3D "host";
> > +     vbus-supply =3D <&reg_usb1_vbus>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usbphy0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&usbphy1 {
> > +     status =3D "okay";
> > +};
> > --
> > 2.43.0
> >



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
