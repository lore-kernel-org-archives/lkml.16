Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74A2192FC
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748506415; cv=none; b=tq6t3acMPh9ada2lXACCjv5EGGkP8rRiWcgS68Ad9WdmUVgZoSqdR3v6b2HKuRlcbgGYl4jQI6puk0tqsssRpF6QcPtADfWMI8U1lDV+C3/c2Ch/NsIGLCxhTutNt79z4IqrxA/OJcTONBG4oCbSnwmcfHweNGYWEwPQYPcCeR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748506415; c=relaxed/simple;
	bh=Dj800Rb8osT8MxLazIJFPmEF6R5dctoapfWR/QmTZbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cb4i3W31ZOKfBUUXOqg2XYNwrpICckZ5P1EuMtIQ/NTGxrZgZufTEElDAWKCnZaTTBymzK4FgjRIanCDd+ikiDGW2U2e9Fop36WCWX4K0HiyqVHYZKVv57PjEgurwSV+VGXvLGsMv1gHulWYVMA1pNKD7f7ciuL7ZtTpxXd4KiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YjU6Bk6I; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YjU6Bk6I"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e694601f624so439673276.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748506411; x=1749111211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICpkuwnIB07t0a1LMiJBD/dY2z9XSzrmegYeMjwWFeY=;
        b=YjU6Bk6ITknn8xvmecwuI01frodRxOng05v636CNd95BoenF7xPoytZfT3UAwuV65+
         GBs/lKpU3WCgThwVV48GWT1eSvwqrgbzW415JLdVSqiDBNU1GGW+ox9nEH7aLGjRDaiX
         1TfzAXOlhToI38IinBZC0afHkPS4imCCkvaMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748506411; x=1749111211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICpkuwnIB07t0a1LMiJBD/dY2z9XSzrmegYeMjwWFeY=;
        b=H0yfJ7c2pcKdalJnXaKZd9hiVWwNYrc4YdKufPtd1mtNBjmRtetW1b6lmwM1okkhcn
         n0FYwMx/uMv3y5aIlCgGaVr6skWezliZwBcCGNGtMP0s5+WIG43eBNKo+7jkIFeGpdlw
         5oGlz0AS0lfKvT1MWUzqb526BUFbw4WraXnIc+UKGJC0WzMI5ZoUhIctmsn8mJjylgR4
         6FFcfNODQPLN8EqwDbCgN29/+KCoNXRU5gr/r6h4t3QLuZjjnTH2gABmzyUEhTZSQ+7p
         hFE0wbQQsYz53PS0vWoc4iIl1UBmAp5n4QISnrRhrhxt125Y9dp9SCnrBECnVAKAhUX7
         UgUQ==
X-Gm-Message-State: AOJu0YwPsbscSQrD1RozB0GJMhNQ8ng6gbe1X/kNMzv9rk1un67uEZj2
	g1MEH5L7G1ri0M11OKQi/XdjZhAF2JGxtG/fN7LMzrBFJ3b9UJ8xBW7Vk2ar/TdGULzIZ0V6K+g
	+yO2uYY/uwjmf455h7lan3RftbYDG3KH/s1Di7QN5lA==
X-Gm-Gg: ASbGncs6Z3G+emteRJgTtuKD+JoMQKkvrlCIQ+bbDh4BtZrgG5Dd+JzlxmvLUe1jaEL
	26YZPWJoU1gzpdLZ+hkDOl8sqVtJfDuF1k7S0nw8I3byO9AnjEDygEoJMC0WeJPaJpMTyOtOPHy
	ltI6Nxoem4ZCWRVLVG4Nou5i4KwonMGGE=
X-Google-Smtp-Source: AGHT+IFU5bz24+L9U9Lk3j0eXGd/ajUx6skYk6d365ox59VO9f0gJTHfBW+FNUqLd9X/ZJAVZxoazSQmYjLoy63FvbA=
X-Received: by 2002:a05:6902:1504:b0:e7d:6791:9c10 with SMTP id
 3f1490d57ef6-e7f744d5e2fmr1456637276.17.1748506410916; Thu, 29 May 2025
 01:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com> <aDcmWddO3+q+4qI1@lizhi-Precision-Tower-5810>
In-Reply-To: <aDcmWddO3+q+4qI1@lizhi-Precision-Tower-5810>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 29 May 2025 10:13:20 +0200
X-Gm-Features: AX0GCFslQFsmjgK20Th0LuWMG0L2ISJsdlKwxt0PnxTJnAi4jbI-fa627EQHTkE
Message-ID: <CABGWkvrY+27C=Ds8uCWBp4seQiV1RNs2dp1jNRPpUNxgNOSxYg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Wed, May 28, 2025 at 5:06=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, May 28, 2025 at 02:11:41PM +0200, Dario Binacchi wrote:
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
> > Changes in v2:
> > - In imx28-amarula-rmm.dts:
> >   - Replace '-' with '@' for the pinctrl sub-nodes.
> >   - Replace edt,edt-ft5x06 with edt,edt-ft5306.
> >   - Drop LCD reset hog pin.
> >   - Add correct #address-cells and #size-cells to gpmi node.
> >   - Replace edt-ft5x06@38 with touchscreen@38.
> > - Drop from commit messages all references to LCD display.
> > - Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
> >   json-schema".
> >
> >  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
> >  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
>
> please run https://github.com/lznuaa/dt-format to keep nice node/property
> order for new dts file.

Thank you for the suggestion. I made some changes, although I didn=E2=80=99=
t follow the
dt-format output for imx28-amarula-rmm.dtsi to the letter. In some cases, w=
hen
I had to choose between alphabetical order and the =E2=80=9Ccustomary=E2=80=
=9D conventions of
DTS files, I opted for the latter.

Thanks and regards,
Dario

>
> Frank
>
> >  2 files changed, 304 insertions(+)
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
> > index 000000000000..5daa9e22715d
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> > @@ -0,0 +1,303 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacch=
i@amarulasolutions.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "imx28.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +     model =3D "Amarula i.MX28 rmm";
> > +     compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> > +
> > +     memory@40000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x40000000 0x08000000>;
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
> > +     reg_3v3: regulator-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_1v8: regulator-1v8 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "1v8";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
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
> > +                     label =3D "status";
> > +                     gpios =3D <&gpio2 7 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-1 {
> > +                     label =3D "x22_5";
> > +                     gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-2 {
> > +                     label =3D "x22_4";
> > +                     gpios =3D <&gpio3 17 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
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
> > +     xceiver-supply =3D <&reg_3v3>;
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
> > +     phy-mode =3D "rmii";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mac0_pins_a>;
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
> > +     hog_pins_a: hog@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power *=
/
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     edt_ft5x06_pins: edt-ft5x06@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <
> > +                     MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
> > +                     MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
> > +             >;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_ENABLE>;
> > +     };
> > +
> > +     edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_16mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     fec_3v3_enable_pin: fec-3v3-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SPDIF__GPIO_3_27>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
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
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     usb0_vbus_enable_pin: usb0-vbus-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +
> > +     usb1_vbus_enable_pin: usb1-vbus-enable@0 {
> > +             reg =3D <0>;
> > +             fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
> > +             fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> > +             fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> > +             fsl,pull-up =3D <MXS_PULL_DISABLE>;
> > +     };
> > +};
> > +
> > +&pwm {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pwm4_pins_a &pwm7_pins_a>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ssp0 {
> > +     compatible =3D "fsl,imx28-mmc";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
> > +     status =3D "okay";
> > +     bus-width =3D <4>;
> > +     broken-cd;
> > +};
> > +
> > +&usb0 {
> > +     status =3D "okay";
> > +     vbus-supply =3D <&reg_usb0_vbus>;
> > +     dr_mode =3D "host";
> > +};
> > +
> > +&usb1 {
> > +     status =3D "okay";
> > +     vbus-supply =3D <&reg_usb1_vbus>;
> > +     dr_mode =3D "host";
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
