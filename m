Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DB71531C1;
	Sat, 21 Jun 2025 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750520382; cv=none; b=OcXLSfWVkRxOukldG/zDW7cyn0IVVP2xxYL4OcVCknJ5zR5NojyOjG7U6ogeyEEegZQHNLrVaq/OpOaZpckz04dR2mWIXWinVikr/Pl7TYEQEBapqNlKLCN0s8YlIldBPLc9xgRgfBhZizhj+kQDvBXB3cynJAVTHofdNygTRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750520382; c=relaxed/simple;
	bh=dplF8ekAxy0g9mjGS0TkbciEvIH5BOn328ZM7y56QMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/2NIA+JMu9IGaWONYuYZbbOQpwbL7wG3VeMDYneqcPkX7KhPgGI1wrWZnDVj99EBGOiIy8DXva8hNk9UDan6MuXfgjYfB4HX6wyqFHtIpDO53s1U7VfvcOX2aE+ycJEk7cTcGW58hecPuikawH7fG1TfOCxIKDAVROq4IHYVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxLZRfsZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxLZRfsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6970C4AF09;
	Sat, 21 Jun 2025 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750520382;
	bh=dplF8ekAxy0g9mjGS0TkbciEvIH5BOn328ZM7y56QMU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CxLZRfsZuT4zKM7mMcYSLnekN+VWNdM4ntkVy+cR4qqOAE3ft82UDnVDoVHgWfNWJ
	 QExaIOemdfA8xa0ujTNgPcHDkJekn7qHUr6aZVTglWNI0gRJAjrAmvoeMH+KenBmA8
	 7tpmAkdInLLEiwt08YzLgHCdwXQoipVT7/TR5Pwu4DEC52DYGs2dk8xUVq8/dSS1yL
	 fm2zjxSgLDpmgrKlrUxaRMN4JbI6Ypq2CGvH3MYjypNxeiUsFFcXMWGD+XXjvAUxey
	 gPkvilmUZHShVf29t21iwWlCc0NhuG0rjZ2RzKV52jFBrT9CTKHq1k5hYneGXILzFB
	 90FTrhtwujmSg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b43cce9efso23542411fa.3;
        Sat, 21 Jun 2025 08:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKWaAb17mxjkQByI/X9mQlUqLr0VidsV9ghBsDaeRRn4oijGSJEaVBa3jojdiMTchNgyCTn/q/mRGu@vger.kernel.org, AJvYcCX1X7fKKZjDiV2fG3tO/pFOe8LehyauKzqpgSFy6QFSJDNJnCaoD3i0TVqnaF8fio2xz8iko49iAQBS1Td/@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxBuesn3PLLiDN6I0QKLD9BqUMXcu4Pop9fulLLCm2ShujzFz
	Do+UC4ZRJFq+bhz3wzx1sobOgYRh8tLhx53vEyWz2K5BmA59QNdYPmoijqwP/OsAfIkp1+j6rCO
	OFck30BlhOdPby/daBbwfPcmlGU01hCY=
X-Google-Smtp-Source: AGHT+IHp+KTn6vrfzc/etDt3kJzlnpgqNnQtsoMZL4Gc1/QE7cGkyToUM5xdaei/51KZAZZFA9559BxEBagsXbi5UnM=
X-Received: by 2002:a2e:bea9:0:b0:32a:91e6:1a26 with SMTP id
 38308e7fff4ca-32b991634e6mr22175591fa.3.1750520380134; Sat, 21 Jun 2025
 08:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619173007.3367034-1-wens@kernel.org> <20250619173007.3367034-6-wens@kernel.org>
 <20250621153229.6796e824@minigeek.lan>
In-Reply-To: <20250621153229.6796e824@minigeek.lan>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 21 Jun 2025 23:39:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-KNN2x+HNE7cSPiTRyo0s5O_yiC147YKDkMhVJjW7Qw@mail.gmail.com>
X-Gm-Features: AX0GCFsagBrOtjfAiLiTlC6pylx4Eb7dHXq8d26EI-noP8C4gcnGxxd8rnfNPHE
Message-ID: <CAGb2v65-KNN2x+HNE7cSPiTRyo0s5O_yiC147YKDkMhVJjW7Qw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: t527: Add OrangePi 4A board
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 10:33=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> On Fri, 20 Jun 2025 01:30:07 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> Hi Chen-Yu,
>
> many thanks for piecing this together!
> I compared this against the schematic, and found only some minor nits,
> see below.
>
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The OrangePi 4A is a typical Raspberry Pi model B sized development
> > board from Xunlong designed around an Allwinner T527 SoC.
> >
> > The board has the following features:
> > - Allwinner T527 SoC
> > - AXP717B + AXP323 PMICs
> > - Up to 4GB LPDDR4 DRAM
> > - micro SD slot
> > - optional eMMC module
> > - M.2 slot for PCIe 2.0 x1
> > - 16 MB SPI-NOR flash
> > - 4x USB 2.0 type-A ports (one can be used in gadget mode)
> > - 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMA=
C200)
> > - 3.5mm audio jack via internal audio codec
> > - HDMI 2.0 output
> > - eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
> > - USB type-C port purely for power
> > - AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
> > - unsoldered headers for ADC and an additional USB 2.0 host port
> > - 40-pin GPIO header
> >
> > Add a device tree for it, enabling all peripherals currently supported.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 378 ++++++++++++++++++
> >  2 files changed, 379 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-=
4a.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 773cc02a13d0..780aeba0f3a4 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -57,3 +57,4 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg=
35xx-sp.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-orangepi-4a.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts =
b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> > new file mode 100644
> > index 000000000000..8a62607e584c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> > @@ -0,0 +1,378 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > +/*
> > + * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun55i-a523.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +     model =3D "OrangePi 4A";
> > +     compatible =3D "xunlong,orangepi-4a", "allwinner,sun55i-t527";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     ext_osc32k: ext-osc32k-clk {
> > +             #clock-cells =3D <0>;
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <32768>;
> > +             clock-output-names =3D "ext_osc32k";
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             /* PWM capable pin, but PWM isn't supported yet. */
> > +             led {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     gpios =3D <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 *=
/
> > +             };
> > +     };
> > +
> > +     wifi_pwrseq: pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             reset-gpios =3D <&r_pio 1 1 GPIO_ACTIVE_LOW>; /* PM1 */
> > +             clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> > +             clock-names =3D "ext_clock";
> > +     };
> > +
> > +     reg_otg_vbus: regulator-otg-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "otg-vbus";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             vin-supply =3D <&reg_vcc5v>;
> > +             gpio =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>;   /* PL4 */
> > +             enable-active-high;
> > +     };
> > +
> > +     reg_pcie_vcc3v3: regulator-pcie-vcc3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-pcie-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             vin-supply =3D <&reg_vcc5v>;
> > +             gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>;   /* PL8 */
> > +             enable-active-high;
> > +     };
> > +
> > +     reg_usb_vbus: regulator-usb-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "usb-vbus";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             vin-supply =3D <&reg_vcc5v>;
> > +             gpio =3D <&r_pio 0 12 GPIO_ACTIVE_HIGH>;  /* PL12 */
> > +             enable-active-high;
> > +     };
> > +
> > +     reg_vcc5v: regulator-vcc5v {
> > +             /* board wide 5V supply from USB type-C port */
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-5v";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-always-on;
> > +     };
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply =3D <&reg_cldo3>;
> > +     cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
> > +     bus-width =3D <4>;
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc1 {
> > +     bus-width =3D <4>;
> > +     mmc-pwrseq =3D <&wifi_pwrseq>;
> > +     non-removable;
> > +     vmmc-supply =3D <&reg_dldo1_323>;
> > +     vqmmc-supply =3D <&reg_bldo1>;
> > +     status =3D "okay";
> > +
> > +     brcmf: wifi@1 {
> > +             compatible =3D "brcm,bcm4329-fmac";
> > +             reg =3D <1>;
> > +             interrupt-parent =3D <&r_pio>;
> > +             interrupts =3D <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
> > +             interrupt-names =3D "host-wake";
> > +     };
> > +};
> > +
> > +&mmc2 {
> > +     bus-width =3D <8>;
> > +     cap-mmc-hw-reset;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     non-removable;
> > +     vmmc-supply =3D <&reg_cldo3>;
> > +     vqmmc-supply =3D <&reg_cldo1>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&pio {
> > +     vcc-pb-supply =3D <&reg_cldo3>;   /* via VCC-IO */
> > +     vcc-pc-supply =3D <&reg_cldo1>;
> > +     vcc-pd-supply =3D <&reg_cldo3>;
> > +     vcc-pe-supply =3D <&reg_aldo2>;
> > +     vcc-pf-supply =3D <&reg_cldo3>;   /* VCC-IO for 3.3v; VCC-MCSI fo=
r 1.8v */
> > +     vcc-pg-supply =3D <&reg_bldo1>;
> > +     vcc-ph-supply =3D <&reg_cldo3>;   /* via VCC-IO */
> > +     vcc-pi-supply =3D <&reg_cldo3>;
> > +     vcc-pj-supply =3D <&reg_cldo1>;
> > +     vcc-pk-supply =3D <&reg_cldo1>;
> > +};
> > +
> > +&r_i2c0 {
> > +     status =3D "okay";
> > +
> > +     axp717: pmic@35 {
> > +             compatible =3D "x-powers,axp717";
> > +             reg =3D <0x35>;
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <1>;
> > +             interrupts-extended =3D <&nmi_intc 0 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vin1-supply =3D <&reg_vcc5v>;
> > +             vin2-supply =3D <&reg_vcc5v>;
> > +             vin3-supply =3D <&reg_vcc5v>;
> > +             vin4-supply =3D <&reg_vcc5v>;
> > +             aldoin-supply =3D <&reg_vcc5v>;
> > +             bldoin-supply =3D <&reg_vcc5v>;
> > +             cldoin-supply =3D <&reg_vcc5v>;
> > +
> > +             regulators {
> > +                     /* Supplies the "little" cluster (1.4 GHz cores) =
*/
> > +                     reg_dcdc1: dcdc1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <1160000>;
> > +                             regulator-name =3D "vdd-cpul";
> > +                     };
> > +
> > +                     reg_dcdc2: dcdc2 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <920000>;
> > +                             regulator-max-microvolt =3D <920000>;
> > +                             regulator-name =3D "vdd-gpu-sys";
> > +                     };
> > +
> > +                     reg_dcdc3: dcdc3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1160000>;
> > +                             regulator-max-microvolt =3D <1160000>;
> > +                             regulator-name =3D "vcc-dram";
> > +                     };
> > +
> > +                     reg_dcdc4: dcdc4 {
> > +                             /* feeds 3.3V pin on GPIO header */
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vdd-io";
> > +                     };
> > +
> > +                     reg_aldo1: aldo1 {
> > +                             regulator-name =3D "avdd-csi";
> > +                     };
> > +
> > +                     reg_aldo2: aldo2 {
> > +                             regulator-name =3D "vcc-pe";
> > +                     };
> > +
> > +                     reg_aldo3: aldo3 {
> > +                             /* supplies the I2C pins for this PMIC */
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-pl-usb";
> > +                     };
> > +
> > +                     reg_aldo4: aldo4 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-pll-dxco-avcc";
> > +                     };
> > +
> > +                     reg_bldo1: bldo1 {
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-pg-wifi";
> > +                     };
> > +
> > +                     reg_bldo2: bldo2 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-pm-lpddr";
> > +                     };
> > +
> > +                     reg_bldo3: bldo3 {
> > +                             regulator-name =3D "dvdd-csi";
>
> In my version of the schematic this is AFVCC-CSI (whatever that means),

I believe it's power for the autofocus part, if one is included.

> and ...
>
> > +                     };
> > +
> > +                     reg_bldo4: bldo4 {
>
> ... BLDO4 is DVDD-CSI.

You are right. I must've edited the wrong entry.

> Not that it really matters, since both are not used yet ...

Actually, I believe the names you gave are from the first page, but if
you look at the page with the camera connectors, neither of them are used.
The connectors both get power only from VCC3V3-CSI, which is CLDO2.
So neither of them are connected.

> > +                             /* not connected */
> > +                     };
> > +
> > +                     reg_cldo1: cldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-cvp-pc-lvds-mcsi-=
pk-efuse-pcie-edp-1v8";
> > +                     };
> > +
> > +                     reg_cldo2: cldo2 {
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc3v3-csi";
> > +                     };
> > +
> > +                     reg_cldo3: cldo3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-io-mmc-nand-pd-pi=
-usb";
> > +                     };
> > +
> > +                     reg_cldo4: cldo4 {
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-3v3-phy1-lcd";
> > +                     };
> > +
> > +                     reg_cpusldo: cpusldo {
> > +                             /* supplies the management core */
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <900000>;
> > +                             regulator-name =3D "vdd-cpus";
>
> This also supplies some 0.9V USB circuitry, so maybe add this to the
> name?

Sure.

> > +                     };
> > +             };
> > +     };
> > +
> > +     axp323: pmic@36 {
> > +             compatible =3D "x-powers,axp323";
> > +             reg =3D <0x36>;
> > +             #interrupt-cells =3D <1>;
> > +             interrupt-controller;
> > +             status =3D "okay";
> > +
> > +             vin1-supply =3D <&reg_vcc5v>;
> > +             vin2-supply =3D <&reg_vcc5v>;
> > +             vin3-supply =3D <&reg_vcc5v>;
> > +
> > +             regulators {
> > +                     reg_aldo1_323: aldo1 {
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-wifi";
> > +                     };
> > +
> > +                     reg_dldo1_323: dldo1 {
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-wifi2";
> > +                     };
> > +
> > +                     /* Supplies the "big" cluster (1.8 GHz cores) */
> > +                     reg_dcdc1_323: dcdc1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <1150000>;
> > +                             regulator-name =3D "vdd-cpub";
> > +                     };
> > +
> > +                     /* DCDC2 is polyphased with DCDC1 */
> > +
> > +                     /* Some RISC-V management core related voltage */
> > +                     reg_dcdc3_323: dcdc3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <900000>;
> > +                             regulator-name =3D "vdd-dnr";
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&r_pio {
> > +/*
> > + * Specifying the supply would create a circular dependency.
> > + *
> > + *   vcc-pl-supply =3D <&reg_aldo3>;
> > + */
> > +     vcc-pm-supply =3D <&reg_bldo2>;
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_pb_pins>;
> > +     status =3D "okay";
> > +};
> > +
> > +&uart1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +     uart-has-rtscts;
> > +     status =3D "okay";
> > +
> > +     bluetooth {
> > +             compatible =3D "brcm,bcm4345c5";
> > +             clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> > +             clock-names =3D "lpo";
> > +             vbat-supply =3D <&reg_aldo1_323>;
>
> Is that some kind of trick, to accommodate *two* power rails for the
> chip? Because to me it looks like the AXP323 ALDO1 and DLDO1 are
> connected together and both supply the WiFi-BT-combo chip.
> It's probably fine to model this way, since ALDO1 is the weaker of
> the two, and I'd guess the WiFi needs more power, but worth a comment, I
> guess.

Yeah, it's mostly a trick. I suppose we can use the regulator coupler
thing to couple them together, but the kernel coupler driver currently
doesn't do non-always-on regulator coupling. I would need to look into
why that's the case.

Mark (CC-ed), do you have any idea off the top of your head?

> Rest looks good to me.

Thanks.


ChenYu

> Cheers,
> Andre
>
>
> > +             vddio-supply =3D <&reg_bldo1>;
> > +             device-wakeup-gpios =3D <&r_pio 1 3 GPIO_ACTIVE_HIGH>; /*=
 PM3 */
> > +             host-wakeup-gpios =3D <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* P=
M4 */
> > +             shutdown-gpios =3D <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 =
*/
> > +     };
> > +};
> > +
> > +&usb_otg {
> > +      /*
> > +       * The OTG controller is connected to one of the type-A ports.
> > +       * There is a regulator, controlled by a GPIO, to provide VBUS p=
ower
> > +       * to the port, and a VBUSDET GPIO, to detect externally provide=
d
> > +       * power. But without ID or CC pins there is no real way to do a
> > +       * runtime role detection.
> > +       */
> > +     dr_mode =3D "host";
> > +     status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +     usb0_vbus-supply =3D <&reg_otg_vbus>;
> > +     usb0_vbus_det-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
> > +     usb1_vbus-supply =3D <&reg_usb_vbus>;
> > +     status =3D "okay";
> > +};
>
