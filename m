Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E441F1512;
	Thu, 10 Apr 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306029; cv=none; b=hhYba1Zoa6RN8PHLOv84dGtF3T7zgQjpd472SiD0LkG3meVKhdfKC9I1jmRCCYE98/jNSl4Jg+/wu/H5282WY9jHCd357auvqIXKdIVAnFiMD/1Dz6NUw9r1K0a5WX/AJXO1cU8+JWzNVf1f6qd4XISNXrficL3osnnzIkVOjUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306029; c=relaxed/simple;
	bh=YJ1fBUFdCzWqO3YxK4Zklt1frHayyoFeNWopvzyNJ5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adGY6hMKMEi9RVwstvmsOzyTGglRSqodqaw8VONyRVeIbYnvsIM/F1g26S3MpSX25OMayPxbHZNkUeESE58qClC3LTu1h2vgpqWvka6gBZ2pbuxd2lcskqeAmcW9XJA8c6e2+lgocSjxv4tnbgUktlzys0J1jvxjXoRnv+APYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=AGf+KfmY; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="AGf+KfmY"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3fa0eb29cebso1236324b6e.0;
        Thu, 10 Apr 2025 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1744306025; x=1744910825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmSI5Hp6z7In3hySWV6JWjhLWH0PiTDbWbtlvv+Fw0Q=;
        b=AGf+KfmY39KxMopkRkRB4Hl5phFDCgYajhYsSzgVWxWnE87HcxJZFQ4tsMFSAoWpmq
         HNnCo+HR4eTlTAZMUp/E9kQFo//RZhdzCrLWNti72hQNW3UdIuO1jirpd2+fWINyKFma
         EODUrCcyhh5rE0lHz6GYstQJJZ1oJyYr2Ohh/YjZdWiY/jly+b2qznvYKhjhMVIjmPL7
         KLF01l2pWFNseagBqu0qr3jNkrkWAaU5wWSKRbgGixlE9qjn+SiUKkvcqQhQ7A8oB5ja
         Cx5yv25kIOqyCtDmdH8XaDw30grAKTzphY67vlJz4tRQo3rb3KJZSEmtox9ncEZeSNSX
         3zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306025; x=1744910825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmSI5Hp6z7In3hySWV6JWjhLWH0PiTDbWbtlvv+Fw0Q=;
        b=gmwAulExRLMhA7LglN1robgKStMi1tvQD9dxhbcA06emarU6+l/yEG8ysKw/kFQvXb
         xvmX1QKdHlPzs9Ticx86q3OWpkEcuPxio5WGTRhOrQmjf/a/NxOVAxMd9DaxKSsM+U9J
         iywQ7yQZX+0V1UPv5tdx2vPOrdScncGae2OHt5j2gmLgVwtXcxkfRUM8cW7x1kUO5eUh
         5lSvOQXMVq4C+iD0uXR43YMNjb+RBHmw4y0B7k2/H1jiAb/t5TQM+lsT7P/KGnU2b4Zi
         E6aOwJBxN2xtman0MxYI8zRhGvygwWZVeYwZjDSbkVXT5G92++Xu5jMrEJs/kLJ6ADUs
         hC4w==
X-Forwarded-Encrypted: i=1; AJvYcCV2+kLiL01Su7Qxd725pNlHZpTFydyXS70Ir+Y3L5aBFo7njLjRujQWt/e5jqf+cLQ5YxzZJWbGBqbWECHy@vger.kernel.org, AJvYcCVV+BW2S15+hKBTDDFefxYKtNHEz3g4+GJbM8tsbg8dcpu/YbkTCizSEAHreKOldK6FPw0LcdygUEpy@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwMMszkGKMsYb+f/PEvssfRFADItSkTsmlq9FfmazJN3N0H9g
	bAUfYAnef7cAakIpSn+gFfA6M5O3PEFe9Vd+1A8uJIKN8agKTeA66bgVxVcUJWYxZ6Dp7Jbdowe
	J5WUf87yrdgW7qYG2TLkfeEoiIEo=
X-Gm-Gg: ASbGncttcpAPn5L4o5aIm1fryWMneoqMDTmYo/YIatubNQVGfOLx45pk8levmozGlti
	lV+V5gwQsykZy3ryH2Vh8X0QeKmkiDUnYjHuQHPkio46dbHiKoBny19jNy9VOQ1Bfu1NpkEeVhz
	oM3UyfxxAVdtZw5abmjkcWjFyPqFHvrGU6
X-Google-Smtp-Source: AGHT+IF/gqY5vzWk8FW+ZHvKo0tNdrbYUafaxIcozVbpJ42nzEMGZgVQi051SxXs4z0sThDq69je51dX4tnyVgEEXLU=
X-Received: by 2002:a05:6808:17aa:b0:3f9:176a:3958 with SMTP id
 5614622812f47-4007bfe4d70mr2077459b6e.11.1744306024906; Thu, 10 Apr 2025
 10:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com> <20250410161509.yviucf36uhox4wvm@unedited>
In-Reply-To: <20250410161509.yviucf36uhox4wvm@unedited>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Thu, 10 Apr 2025 13:26:53 -0400
X-Gm-Features: ATxdqUHHjNAS42ycco6oiJlHl6So4Ajtw4evYG_P_SEbuwcFuKEXLrqG0KE478o
Message-ID: <CA+T6QPm2gVSa_+-vj5EA=RAs_sZFjq0LJKYVKPf_LN9Xc9uQQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: Nishanth Menon <nm@ti.com>
Cc: Robert Nelson <robertcnelson@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, 
	Dhruva Gole <d-gole@ti.com>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Ayush Singh <ayush@beagleboard.org>, michael.opdenacker@rootcommit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 12:15=E2=80=AFPM Nishanth Menon <nm@ti.com> wrote:
>
> On 18:18-20250408, Robert Nelson wrote:
> > BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> > PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> > Its dual or quad A53 cores can provide higher performance than classic
> > PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> > JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> > MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charge=
r.
> >
> > https://www.beagleboard.org/boards/pocketbeagle-2
> > https://openbeagle.org/pocketbeagle/pocketbeagle-2
> >
> > Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> > CC: Rob Herring <robh@kernel.org>
> > CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > CC: Conor Dooley <conor+dt@kernel.org>
> > CC: Vignesh Raghavendra <vigneshr@ti.com>
> > CC: Nishanth Menon <nm@ti.com>
> > CC: Andrew Davis <afd@ti.com>
> > CC: Roger Quadros <rogerq@kernel.org>
> > CC: Siddharth Vadapalli <s-vadapalli@ti.com>
> > CC: Judith Mendez <jm@ti.com>
> > CC: Andrei Aldea <a-aldea@ti.com>
> > CC: Dhruva Gole <d-gole@ti.com>
> > CC: Jason Kridner <jkridner@beagleboard.org>
> > CC: Deepak Khatri <lorforlinux@beagleboard.org>
> > CC: Ayush Singh <ayush@beagleboard.org>
> > ---
> > Changes since v1:
> >  - fix '_' in main-i2c2-default-pins
> >  - aliases i2c match original pocketbeagle
> >  - add mcu_m4fss with reseved memory and mailbox
> >  - drop unused main_gpio0_pins_default pinmux
> >  - drop unused main_gpio1_pins_default pinmux
> >  - drop unused main_spi2_pins_gpio pinmux
> >  - Reserve 128MiB of global CMA
> > ---
> >  arch/arm64/boot/dts/ti/Makefile               |   1 +
> >  .../boot/dts/ti/k3-am62-pocketbeagle2.dts     | 528 ++++++++++++++++++
> >  2 files changed, 529 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> >
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/M=
akefile
> > index 03d4cecfc001..4f8fcb69a2c1 100644
> > --- a/arch/arm64/boot/dts/ti/Makefile
> > +++ b/arch/arm64/boot/dts/ti/Makefile
> > @@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_K3) +=3D k3-am625-verdin-wifi-yavia=
.dtb
> >  dtb-$(CONFIG_ARCH_K3) +=3D k3-am62x-phyboard-lyra-gpio-fan.dtbo
> >  dtb-$(CONFIG_ARCH_K3) +=3D k3-am62-lp-sk.dtb
> >  dtb-$(CONFIG_ARCH_K3) +=3D k3-am62-lp-sk-nand.dtbo
> > +dtb-$(CONFIG_ARCH_K3) +=3D k3-am62-pocketbeagle2.dtb
> >
> >  # Boards with AM62Ax SoC
> >  dtb-$(CONFIG_ARCH_K3) +=3D k3-am62a7-sk.dtb
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/ar=
m64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> > new file mode 100644
> > index 000000000000..65000ed8196f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> > @@ -0,0 +1,528 @@
> > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > +/*
> > + * https://www.beagleboard.org/boards/pocketbeagle-2
> > + *
> > + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.=
com/
> > + * Copyright (C) 2025 Robert Nelson, BeagleBoard.org Foundation
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include "k3-am625.dtsi"
> > +
> > +/ {
> > +     compatible =3D "beagle,am62-pocketbeagle2", "ti,am625";
> > +     model =3D "BeagleBoard.org PocketBeagle2";
> > +
> > +     aliases {
> > +             serial0 =3D &wkup_uart0;
> > +             serial1 =3D &main_uart1;
> > +             serial2 =3D &main_uart6;
> > +             serial3 =3D &main_uart3;
> > +             serial4 =3D &main_uart4;
> > +             serial5 =3D &main_uart5;
> > +             serial6 =3D &main_uart2;
> > +             serial7 =3D &main_uart0;
>
>
> We just seem to have 3 uarts pinned out. so why alias the rest? those
> seem unused?
>
> > +             mmc0 =3D &sdhci0;
> Same - unused?
> > +             mmc1 =3D &sdhci1;
> > +             usb0 =3D &usb0;
> > +             usb1 =3D &usb1;
> > +             i2c1 =3D &main_i2c1;
>
> same - unused?
>
> > +             i2c2 =3D &main_i2c2;
> > +             i2c3 =3D &wkup_i2c0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D &main_uart6;
> > +     };
> > +
> > +     memory@80000000 {
> > +             /* 512MB RAM */
> > +             reg =3D <0x00000000 0x80000000 0x00000000 0x20000000>;
> > +             device_type =3D "memory";
> > +             bootph-pre-ram;
> > +     };
> > +
> > +     reserved_memory: reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             /* global cma region */
> > +             linux,cma {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reusable;
> > +                     size =3D <0x00 0x8000000>;
> > +                     linux,cma-default;
> > +             };
> > +
> > +             mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0x00 0x9cb00000 0x00 0x100000>;
> > +                     no-map;
> > +             };
> > +
> > +             mcu_m4fss_memory_region: m4f-memory@9cc00000 {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0x00 0x9cc00000 0x00 0xe00000>;
> > +                     no-map;
> > +             };
> > +
> > +             secure_tfa_ddr: tfa@9e780000 {
> > +                     reg =3D <0x00 0x9e780000 0x00 0x80000>;
> > +                     alignment =3D <0x1000>;
> > +                     no-map;
> > +             };
> > +
> > +             secure_ddr: optee@9e800000 {
> > +                     reg =3D <0x00 0x9e800000 0x00 0x01800000>;
> > +                     alignment =3D <0x1000>;
> > +                     no-map;
> > +             };
> > +
> > +             wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00=
000 {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0x00 0x9db00000 0x00 0xc00000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
> > +     vsys_5v0: regulator-1 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vsys_5v0";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             bootph-all;
> > +     };
> > +
> > +     vdd_3v3: regulator-2 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             vin-supply =3D <&vsys_5v0>;
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             bootph-all;
> > +     };
> > +
> > +     vdd_mmc1: regulator-3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_mmc1";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&vdd_3v3_sd_pins_default>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-boot-on;
> > +             enable-active-high;
> > +             regulator-always-on;
> > +             vin-supply =3D <&vdd_3v3>;
> > +             gpio =3D <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
> > +             bootph-all;
> > +     };
> > +
> > +     vdd_sd_dv: regulator-4 {
> > +             compatible =3D "regulator-gpio";
> > +             regulator-name =3D "sd_hs200_switch";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&vdd_sd_dv_pins_default>;
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-boot-on;
> > +             vin-supply =3D <&vdd_3v3>;
> > +             gpios =3D <&main_gpio1 49 GPIO_ACTIVE_HIGH>;
> > +             states =3D <1800000 0x0>,
> > +                      <3300000 0x1>;
> > +             bootph-all;
> > +     };
> > +
> > +     adc_vref: regulator-5 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "default";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     leds {
> > +             bootph-all;
> > +             compatible =3D "gpio-leds";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&led_pins_default>;
> bootph-all here?
> Please check Documentation/devicetree/bindings/dts-coding-style.rst
>
> 1. "compatible"
> 2. "reg"
> 3. "ranges"
> 4. Standard/common properties (defined by common bindings, e.g. without
>    vendor-prefixes)
>
> ^^ bootph property last one here.
>
> 5. Vendor-specific properties
> 6. "status" (if applicable)
> 7. Child nodes, where each node is preceded with a blank line
>
> Could you make sure that all the nodes follow the convention?
>
> > +
> > +             led-1 {
> > +                     bootph-all;
> > +                     gpios =3D <&main_gpio0 6 GPIO_ACTIVE_HIGH>;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     linux,default-trigger =3D "heartbeat";
> > +                     function =3D LED_FUNCTION_HEARTBEAT;
> > +                     default-state =3D "on";
> Same
> > +             };
> > +
> > +             led-2 {
> > +                     bootph-all;
> > +                     gpios =3D <&main_gpio0 5 GPIO_ACTIVE_HIGH>;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     function =3D LED_FUNCTION_DISK_ACTIVITY;
> > +                     linux,default-trigger =3D "mmc1";
> > +             };
> > +
> > +             led-3 {
> > +                     bootph-all;
> > +                     gpios =3D <&main_gpio0 4 GPIO_ACTIVE_HIGH>;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +             };
> > +
> > +             led-4 {
> > +                     bootph-all;
> > +                     gpios =3D <&main_gpio0 3 GPIO_ACTIVE_HIGH>;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     function =3D LED_FUNCTION_INDICATOR;
> > +                     default-state =3D "off";
> > +             };
> > +     };
> > +};
> > +
> > +&main_pmx0 {
> > +     led_pins_default: led-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x000c, PIN_OUTPUT, 7) /* (E25) OSPI0=
_D0.GPIO0_3 */
> > +                     AM62X_IOPAD(0x0010, PIN_OUTPUT, 7) /* (G24) OSPI0=
_D1.GPIO0_4 */
> > +                     AM62X_IOPAD(0x0014, PIN_OUTPUT, 7) /* (F25) OSPI0=
_D2.GPIO0_5 */
> > +                     AM62X_IOPAD(0x0018, PIN_OUTPUT, 7) /* (F24) OSPI0=
_D3.GPIO0_6 */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     main_i2c0_pins_default: main-i2c0-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (B16)=
 I2C0_SCL */
> > +                     AM62X_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (A16)=
 I2C0_SDA */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     main_i2c2_pins_default: main-i2c2-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (K22)=
 GPMC0_CSn2.I2C2_SCL */
> > +                     AM62X_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (K24)=
 GPMC0_CSn3.I2C2_SDA */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     main_uart0_pins_default: main-uart0-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14/A13) UAR=
T0_RXD */
> > +                     AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UA=
RT0_TXD */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     main_uart1_pins_default: main-uart1-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x194, PIN_INPUT, 2) /* (B19/B18) MCA=
SP0_AXR3.UART1_CTSn */
> > +                     AM62X_IOPAD(0x198, PIN_OUTPUT, 2) /* (A19/B17) MC=
ASP0_AXR2.UART1_RTSn */
> > +                     AM62X_IOPAD(0x1ac, PIN_INPUT, 2) /* (E19/D15) MCA=
SP0_AFSR.UART1_RXD */
> > +                     AM62X_IOPAD(0x1b0, PIN_OUTPUT, 2) /* (A20/D16) MC=
ASP0_ACLKR.UART1_TXD */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     main_uart6_pins_default: main-uart6-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x001c, PIN_INPUT, 3) /* (J23) OSPI0_=
D4.UART6_RXD */
> > +                     AM62X_IOPAD(0x0020, PIN_OUTPUT, 3) /* (J25) OSPI0=
_D5.UART6_TXD */
> > +             >;
> > +     };
> > +
> > +     main_mmc1_pins_default: main-mmc1-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC=
1_CMD */
> > +                     AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC=
1_CLK */
> > +                     AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC=
1_DAT0 */
> > +                     AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC=
1_DAT1 */
> > +                     AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC=
1_DAT2 */
> > +                     AM62X_IOPAD(0x224, PIN_INPUT, 0) /* (D22/C19) MMC=
1_DAT3 */
> > +                     AM62X_IOPAD(0x240, PIN_INPUT, 7) /* (D17/C15) MMC=
1_SDCD.GPIO1_48 */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x0244, PIN_OUTPUT, 7) /* (P25) GPMC0=
_CLK.GPIO1_49 */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     pmic_irq_pins_default: pmic-irq-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x01f4, PIN_INPUT_PULLUP, 0) /* (D16)=
 EXTINTn */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     vdd_3v3_sd_pins_default: vdd-3v3-sd-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0=
_CLK.GPIO0_0 */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     usb1_pins_default: usb1-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x0258, PIN_INPUT, 0) /* (F18) USB1_D=
RVVBUS */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     epwm2_pins_default: epwm2-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_IOPAD(0x01e8, PIN_OUTPUT, 8) /* (B17) I2C1_=
SCL.EHRPWM2_A */
> > +             >;
> > +     };
> > +};
> > +
> > +&cpsw3g {
> > +     status =3D "disabled";
> > +};
>
> This should have been disabled at am62-main.dtsi level (like it was done
> in j784s4) - lets fix that then apply the pb2 without these disabled
> nodes.
> > +
> > +&cpsw_port1 {
> > +     status =3D "disabled";
> > +};
> > +
> > +&cpsw_port2 {
> > +     status =3D "disabled";
> > +};
> > +
> > +&epwm2 {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&epwm2_pins_default>;
> > +};
> > +
> > +&mailbox0_cluster0 {
> > +     mbox_m4_0: mbox-m4-0 {
> > +             ti,mbox-rx =3D <0 0 0>;
> > +             ti,mbox-tx =3D <1 0 0>;
> > +     };
> > +};
> > +
> > +&main_uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_uart0_pins_default>;
> > +     bootph-all;
> > +     status =3D "okay";
> > +};
> > +
> > +&main_uart1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_uart1_pins_default>;
> > +     bootph-pre-ram;
> > +     status =3D "reserved";
> > +};
> > +
> > +&main_uart6 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_uart6_pins_default>;
> > +     bootph-all;
> > +     status =3D "okay";
> > +};
> > +
> > +&main_i2c0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_i2c0_pins_default>;
> > +     clock-frequency =3D <400000>;
> > +     bootph-all;
> > +     status =3D "okay";
> > +
> > +     ad7291: adc@20 {
> > +             compatible =3D "adi,ad7291";
>
> I think the commit message says MSPM0L1105 ? is this in emulation mode?
> if so, we should document this.
>
> > +             reg =3D <0x20>;
> > +             vref-supply =3D <&adc_vref>;
> > +     };
> > +
> > +     eeprom: eeprom@50 {
> > +             compatible =3D "atmel,24c32";
>
> is this the same? MSPM0L1105 doing eeprom? if so, please document.
> > +             reg =3D <0x50>;
> > +     };
> > +};
> > +
> > +&main_i2c2 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_i2c2_pins_default>;
> > +     clock-frequency =3D <400000>;
> > +     bootph-all;
> > +     status =3D "okay";
> > +};
> > +
> > +&mcu_m4fss {
> > +     mboxes =3D <&mailbox0_cluster0 &mbox_m4_0>;
> > +     memory-region =3D <&mcu_m4fss_dma_memory_region>,
> > +                     <&mcu_m4fss_memory_region>;
> > +     status =3D "okay";
> > +};
> > +
> > +&mcu_pmx0 {
> > +     wkup_uart0_pins_default: wkup-uart0-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_MCU_IOPAD(0x02c, PIN_INPUT, 0)    /* (C6/A7=
) WKUP_UART0_CTSn */
> > +                     AM62X_MCU_IOPAD(0x030, PIN_OUTPUT, 0)   /* (A4/B4=
) WKUP_UART0_RTSn */
> > +                     AM62X_MCU_IOPAD(0x024, PIN_INPUT, 0)    /* (B4/B5=
) WKUP_UART0_RXD */
> > +                     AM62X_MCU_IOPAD(0x028, PIN_OUTPUT, 0)   /* (C5/C6=
) WKUP_UART0_TXD */
> > +             >;
> > +             bootph-all;
> > +     };
> > +
> > +     wkup_i2c0_pins_default: wkup-i2c0-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     AM62X_MCU_IOPAD(0x004c, PIN_INPUT_PULLUP, 0)    /=
* (B9) WKUP_I2C0_SCL */
> > +                     AM62X_MCU_IOPAD(0x0050, PIN_INPUT_PULLUP, 0)    /=
* (A9) WKUP_I2C0_SDA */
> > +             >;
> > +             bootph-all;
> > +     };
> > +};
> > +
> > +&sdhci1 {
> > +     /* SD/MMC */
> > +     vmmc-supply =3D <&vdd_mmc1>;
> > +     vqmmc-supply =3D <&vdd_sd_dv>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_mmc1_pins_default>;
> > +     disable-wp;
> > +     cd-gpios =3D <&main_gpio1 48 GPIO_ACTIVE_LOW>;
> > +     cd-debounce-delay-ms =3D <100>;
> > +     bootph-all;
> > +     ti,fails-without-test-cd;
> > +     status =3D "okay";
> > +};
> > +
> > +&usbss0 {
> > +     bootph-all;
> > +     ti,vbus-divider;
> > +     status =3D "okay";
> > +};
> > +
> > +&usb0 {
> > +     bootph-all;
> > +     dr_mode =3D "peripheral";
>
> Can this operate in "otg" instead? maybe use a type-c dock?
>
> > +};
> > +
> > +&usbss1 {
> > +     ti,vbus-divider;
> > +     status =3D "okay";
> > +};
> > +
> > +&usb1 {
> > +     dr_mode =3D "host";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&usb1_pins_default>;
> > +};
>
> is'nt this over https://www.beagleboard.org/boards/techlab or
> https://www.beagleboard.org/boards/pocketbeagle-gamepup-cape or
> https://github.com/mwelling/pocket-bob ?
>
> I think it is better as an overlay? Let us not enable something that
> will add power for no benefit :)
> Further USB1.ID has options for PRU as well. Let the daughter overlay
> deal with it.
>
> On the flip side, we could work the other way - since majority of
> daughter cards use USB host, it could be that the other overlays can
> just disable usbss1 and usb1
>
> Thoughts?

Since you asked, Being the somewhat unique state of PocketBeagle 2 and
other Beagle
single-board computers as rapid-prototyping development platforms, my
personal general
preference is to see all the stuff turned on by default and then to
provide some clear direction
on what is not necessary such that it lives as documentation forhow to
enable it and simplify
the development of overlays. Some of the rationale for this was
discussed a couple
of years back in a series of blog posts by Michael Opdenacker. [1][2][3]

My perspective is that the interfaces need to be enabled to define the
header connector to
the device tree and that the muxes should further be fully described
to the system, rather than
leaving those bits of metadata regarding the running system as an
exercise for the reader.

The aforementioned approach of removing all the "dead bits" is great
until someone is left with
the challenge of figuring out how to turn them on and/or select
between them. Providing an
overlay that disables all the unnecessary bits seems reasonable to me.

Otherwise, I think we can put the entirety of the header description
into an overlay for
cape-specific overlays to use, but I find the lack of an upstream
definition to make it difficult to
enable cape makers to define overlays that are likely to actually work.

Just my $0.0000002.

[1] https://www.beagleboard.org/blog/2022-02-15-using-device-tree-overlays-=
example-on-beaglebone-cape-add-on-boards
[2] https://www.beagleboard.org/blog/2022-03-31-device-tree-supporting-simi=
lar-boards-the-beaglebone-example
[3] https://www.beagleboard.org/blog/2022-06-06-using-the-u-boot-extension-=
board-manager-beaglebone-boards-example

>
> > +
> > +&wkup_uart0 {
> > +     /* WKUP UART0 is used by Device Manager firmware */
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&wkup_uart0_pins_default>;
> > +     bootph-all;
> > +     status =3D "reserved";
> > +};
> > +
> > +&wkup_i2c0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&wkup_i2c0_pins_default>;
> > +     clock-frequency =3D <100000>;
> > +     bootph-all;
> > +     status =3D "okay";
> > +
> > +     tps65219: pmic@30 {
> > +             compatible =3D "ti,tps65219";
> > +             reg =3D <0x30>;
> > +             buck1-supply =3D <&vsys_5v0>;
> > +             buck2-supply =3D <&vsys_5v0>;
> > +             buck3-supply =3D <&vsys_5v0>;
> > +             ldo1-supply =3D <&vdd_3v3>;
> > +             ldo2-supply =3D <&buck2_reg>;
> > +             ldo3-supply =3D <&vdd_3v3>;
> > +             ldo4-supply =3D <&vdd_3v3>;
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pmic_irq_pins_default>;
> > +             interrupt-parent =3D <&gic500>;
> > +             interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <1>;
> > +
> > +             bootph-all;
> > +             system-power-controller;
> > +             ti,power-button;
> > +
> > +             regulators {
> > +                     buck1_reg: buck1 {
> > +                             regulator-name =3D "VDD_CORE";
> > +                             regulator-min-microvolt =3D <850000>;
> > +                             regulator-max-microvolt =3D <850000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     buck2_reg: buck2 {
> > +                             regulator-name =3D "VDD_1V8";
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     buck3_reg: buck3 {
> > +                             regulator-name =3D "VDD_1V2";
> > +                             regulator-min-microvolt =3D <1200000>;
> > +                             regulator-max-microvolt =3D <1200000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     ldo1_reg: ldo1 {
> > +                             /*
> > +                              * Regulator is left as is unused, vdd_sd
> > +                              * is controlled via GPIO with bypass con=
fig
> > +                              * as per the NVM configuration
> > +                              */
> > +                             regulator-name =3D "VDD_SD_3V3";
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-allow-bypass;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     ldo2_reg: ldo2 {
> > +                             regulator-name =3D "VDDA_0V85";
> > +                             regulator-min-microvolt =3D <850000>;
> > +                             regulator-max-microvolt =3D <850000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     ldo3_reg: ldo3 {
> > +                             regulator-name =3D "VDDA_1V8";
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     ldo4_reg: ldo4 {
> > +                             regulator-name =3D "VDD_2V5";
> > +                             regulator-min-microvolt =3D <2500000>;
> > +                             regulator-max-microvolt =3D <2500000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +             };
> > +     };
> > +};
> > --
> > 2.47.2
> >
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D



--=20
Learn about me and setup a meeting at
https://beagleboard.org/about/jkridner - a 501c3 non-profit educating
around open hardware computing
