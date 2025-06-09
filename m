Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9A7E9;
	Mon,  9 Jun 2025 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484877; cv=none; b=cvsjoGB459yjgmlfYS8vXkCzMtIxV6vZn6wFm+J1bxQaM32mYgyu3u//nxMbuOsipUb2ovtK3nfVgHbEi6JcvuAUBmXTNvHiPp+TtM5OaM1Q/kFujpckCq5vYjxvKxIxoKnQaGsgZvyXC2Sy9JMrH3Pp4EldFK9NoETQsi76VsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484877; c=relaxed/simple;
	bh=oZ2eFoC+V5lXSs62YPNGeUBebnPSxj7VP91pS1H4+Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMyW3BNgO/6TeauKyn3pmUc/7jvg2VKKv+sqyqpWGBSQEHqiCaWyW2JVDuDhNDVaDdapdWBckA+GqBgV5q9VyPdW2pD0RsBnE9UqxrNHr1ftttYqac+2qUevl5UNqhP9NzujfYxSYq93LUvvQiACYggcCiKWEfEULa86JdgfWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xthttr2N; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xthttr2N"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso3977188276.2;
        Mon, 09 Jun 2025 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749484874; x=1750089674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6fBa/D7ZSdkp1CcirJkKYMOK5Z9MjA4EI8lgY6/+9GI=;
        b=Xthttr2NhdDyVpGuga9EcQQaxw/rgvpJIQTjHa4aJKGsWbtm5u0i4y0lkD2Fd2Gmno
         LgybhzE5qPnfsm5kTxT2E7MCzk7QXzX/fH3HN1sJOdGNU3C8cQ9gl5JxpjOvz5k537z+
         0/0TowCJKOJu2tZ+6aid3xjggM/wCyo8JTLRhqp6RRnP9qYRBqpDkbxGw7tbBe0waPmT
         EQu5TQ9BSAcYgDheFE+89/baVBXsf+NpX7T/jemaD4yinTaAV0yX35U81mHq2/eyuw3n
         As4xroNWJ7GgAF33KS9sV0mrrQqmUf+gIL4CSfEkL1gREmprkQnKTIhlIErxu2Bxbb9G
         Q9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484874; x=1750089674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fBa/D7ZSdkp1CcirJkKYMOK5Z9MjA4EI8lgY6/+9GI=;
        b=AOus5Ul8rq/XCO34/a34ER75P0ZoyMolO9S8UGdVfHdN47Z78PgomZeMDgTjlb/iQR
         42IXA1SS1lGuBhGkzMxbxE/xpB4E/a8GiVk40BbR2w8TvCwCza2n8hbnZMXe6a0rR7p/
         dqgGklKjrUSWOkuhenKIEYVVS+9Mixm3i+HBHD+uXz2mHenFs34c+vOLGelSPqEL+PEW
         3Y1025LWUa4KLgc9QAK/IdYWf1Lcc7U8ASUzsqssD4MbnoFKHv66qGBbaG6nWx+C/aGN
         H3HK41I5V0pJqpbEbwG+5uWe0zZvHDeNtazmWThBfHo+NbjAjrfFKLxOCd/wMTrLlJgU
         H2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqCBXk++p1dEQi37gS+LFASFVOn6XabyC7gQbT29H94OOUUbDhNnXi6v7gT0nTpzA5xBE11xB+WiUT2bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyShWMwgYLBcMYLO5UQwmB007M0VWbDmDa6LGdWWybEqRcUp468
	Rs9zcYPQY57DqcWqmmVr11W9nwcmnkuYDCAmrVtkKyko718wiZvy6ho47gSa8DFa1yUvEarx+b0
	FmxrMzGhkonp938EuPBKBwSP9ME9cHt4=
X-Gm-Gg: ASbGnctJ0CWmwMIGua8nILlaImZ1xfKwWxM+4nPBWbvN0t7M3ZzYZPs2gu0g+8M4OWg
	V9En6ay/g/otekRaJ03IgQF0jdkfzIsSfWPh6HunkKVH5rsuY9pYccnxXxDQRPT/ioZudRDLazC
	FVRa/tvPNMGg7smaBIk+9n6q32s9Fe97myL2J1r5B5sw==
X-Google-Smtp-Source: AGHT+IEIB8zpDCWcvtBAEzi9NFpxDUdLEsuaA1XVK7qwbkI8oYOnzL1Es6VPcyxBlIwHUkvGkUTGO5iDPTFdkAt7y3Y=
X-Received: by 2002:a05:6902:4911:b0:e81:992c:944d with SMTP id
 3f1490d57ef6-e81a214a687mr19372674276.29.1749484874113; Mon, 09 Jun 2025
 09:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com> <aEb5PHawmlhXs0xs@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb5PHawmlhXs0xs@lizhi-Precision-Tower-5810>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Mon, 9 Jun 2025 18:00:56 +0200
X-Gm-Features: AX0GCFvjgcJAA-64XgvWKGj9tzVUxKIm25Rq28d_hMMp4iijhQyDQKRcAqF3GIk
Message-ID: <CAK+owoidpKXje+vbCSKRbHMZfiWUkp9oO=JDfe7UOoYu=jz+tQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
To: Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

> +                     reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +                     reset-assert-us = <10000>;
> +                     reset-deassert-us = <100000>;
> +                     vddio-supply = <&reg_phy_vddio>;
> extra empty line here.

Ack, will add the empty line before the leds block.

> +                     at803x,eee-disabled;
> +                     eee-broken-1000t;
> are you sure eee broken? recently we found it wrong copy from fec.

You're absolutely right. I checked the MXL86110 datasheet and it clearly states
that EEE is properly supported for both 100BASE-TX and 1000BASE-T operations.
These properties were indeed copied incorrectly from other configurations.
I'll remove both at803x,eee-disabled and eee-broken-1000t properties in v2.

Thanks for catching this!

Il giorno lun 9 giu 2025 alle ore 17:10 Frank Li <Frank.li@nxp.com> ha scritto:
>
> On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> > Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> > integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> > MDIO bus at address 4.
> >
> > This patch adds:
> > - EQOS controller configuration with RGMII interface.
> > - Proper reset timings.
> > - PHY power supply regulators.
> > - RGMII pinmux configuration for all data, control and clock signals.
> > - LED configuration for link status indication via the LED subsystem
> >   under /sys/class/leds/, leveraging the support implemented in the.
> >   mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
> >   Two LEDs are defined to match the LED configuration on the Variscite
> >   VAR-SOM Carrier Boards:
> >     * LED@0: Yellow, netdev trigger.
> >     * LED@1: Green, netdev trigger.
> >
> > The RGMII TX/RX delays are implemented in SOM via PCB passive
> > delays, so no software delay configuration is required.
> >
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> >  .../boot/dts/freescale/imx8mp-var-som.dtsi    | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > index b59da91fdd04..3be59692849f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
> > @@ -55,6 +55,24 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
> >               states = <3300000 0x0 1800000 0x1>;
> >               vin-supply = <&ldo5>;
> >       };
> > +
> > +     reg_phy_supply: regulator-phy-supply {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "phy-supply";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             regulator-enable-ramp-delay = <20000>;
> > +             gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_phy_vddio: regulator-phy-vddio {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vddio-1v8";
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +     };
> >  };
> >
> >  &A53_0 {
> > @@ -73,6 +91,54 @@ &A53_3 {
> >       cpu-supply = <&buck2>;
> >  };
> >
> > +&eqos {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_eqos>;
> > +     /*
> > +      * The required RGMII TX and RX 2ns delays are implemented directly
> > +      * in hardware via passive delay elements on the SOM PCB.
> > +      * No delay configuration is needed in software via PHY driver.
> > +      */
> > +     phy-mode = "rgmii";
> > +     phy-handle = <&ethphy0>;
> > +     status = "okay";
> > +
> > +     mdio {
> > +             compatible = "snps,dwmac-mdio";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             ethphy0: ethernet-phy@4 {
> > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > +                     reg = <4>;
> > +                     at803x,eee-disabled;
> > +                     eee-broken-1000t;
>
> are you sure eee broken? recently we found it wrong copy from fec.
>
>
> > +                     reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us = <10000>;
> > +                     reset-deassert-us = <100000>;
> > +                     vddio-supply = <&reg_phy_vddio>;
>
> extra empty line here.
>
> Frank
> > +                     leds {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             led@0 {
> > +                                     reg = <0>;
> > +                                     color = <LED_COLOR_ID_YELLOW>;
> > +                                     function = LED_FUNCTION_LAN;
> > +                                     linux,default-trigger = "netdev";
> > +                             };
> > +
> > +                             led@1 {
> > +                                     reg = <1>;
> > +                                     color = <LED_COLOR_ID_GREEN>;
> > +                                     function = LED_FUNCTION_LAN;
> > +                                     linux,default-trigger = "netdev";
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &i2c1 {
> >       clock-frequency = <400000>;
> >       pinctrl-names = "default";
> > @@ -239,6 +305,27 @@ &wdog1 {
> >
> >  &iomuxc {
> >
> > +     pinctrl_eqos: eqosgrp {
> > +             fsl,pins = <
> > +                     MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC                             0x2
> > +                     MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO                           0x2
> > +                     MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2                       0x90
> > +                     MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3                       0x90
> > +                     MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK       0x90
> > +                     MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL                 0x90
> > +                     MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2                       0x16
> > +                     MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3                       0x16
> > +                     MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL                 0x16
> > +                     MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK       0x16
> > +                     MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                                 0x10
> > +                     MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                             0x150
> > +             >;
> > +     };
> > +
> >       pinctrl_i2c1: i2c1grp {
> >               fsl,pins = <
> >                       MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL                                0x400001c2
> >
> > base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
> > prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
> > --
> > 2.43.0
> >
