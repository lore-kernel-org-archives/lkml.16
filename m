Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA771D7E52;
	Wed,  5 Feb 2025 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738773003; cv=none; b=jGKR/y1pPiIWoyTBVTRJfravA9cUbHc2w3uj/KyNiVYuG94V7ngYyj3SjoXES9xqd9TpRZICuJA1YadCqSBUD73+0dEmOD+qkKn5oYIYPqSKKTQePcCfwDgM20iHZqwWlIBqI9YdI029VBk7LUus+eNv5WARzWkhkIJ1W5Kyn2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738773003; c=relaxed/simple;
	bh=9LFjJ6NXk2rfVkXzdsuvSlijF69zSXMTmUu2znW441Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzoOJ6dtx9+2e8cM8zLX0Nyo1+gzdxhRrKzygpFAzOZYYymCikKQ/fI2yo9ItE6wkvYtSNcZi9qKQt2pn3DkMIzQ+oTHlNFCFcvy0rguCkXPmyEIYuBTRsLT9S9Cy9GaN0hlLBG0SuAxiT30gXJEjzoddsL8b475ObylM94Yd7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5440d1f506aso198077e87.2;
        Wed, 05 Feb 2025 08:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772998; x=1739377798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJP08c1syErdLpLuzNMXT58izEIVTQHRy0abr6LqiVk=;
        b=TWN+QWBr3QWdCXB5CW1iMtphRTYmfgVoyhaIHnywx0asQRkZVaDpeSQevfYd1UDOsF
         PIaw4bpKoXX+7HJg81HzoL+ZQSngp3MUhmNpVB6mL/I821Mr1v4Hdq3cRM6naFpVymra
         AvVWcLPvYU9tXlvYH21zfoXdpGywp3tmsIOdIGaRLmR4/2CjYJophukDZXpNZSjWsu+B
         OYuldqJ6NmgGFF2448yuWNKaDdhDfs2X8nfkl5JCq7Bdn8Y1+v4t38ivZXDpuG/1zhp/
         o5ESgZ6sXiMJrqv4St4jWh7iojG+zLz+2t2XQCRPwofEdblk+FSYC2Axx4DZSsiithy9
         dKVw==
X-Forwarded-Encrypted: i=1; AJvYcCVuDpENYfoNuLVamwbmV87AX1y4jrWAC2v5ge02xWMFz6LzlXrLJladujaYlBSdsimzcdqD21IzBoHR@vger.kernel.org, AJvYcCXtYnBjZYuMdPZU0VpJf+ow4uxLVwtyKA4SPEcwpSm1Q6vIqNwZrcioIM6CKy1UaObWZ4LMR6jOGE8GYGiT@vger.kernel.org
X-Gm-Message-State: AOJu0YxAoQqr9QKMJck1XlLcLGH3P7znxBHeWJCLUIV2h1jY0BLuUl+3
	Q8Q/TzSJkHolSE0ek+hk/cVwnUCy6MypX8WfarPRQkQalxxrETmFKwKzk6Px
X-Gm-Gg: ASbGncvhM6xsdTovGaStQD40DFtceoMLK4LriGhxmnIxCVcf+uxx+iPYoEtw8yz0Wsd
	H+uwRVEwfo5zw0X1SaNRyO3KXKSUeqX25SCAYVvF+48GrFfAUbDrM3cbPXaGYboZ6/cMzWJTP8R
	WEoByCklDeY5LoJkmvNlMLIdPPz0Zu1Znpw91sVFaTZLaqJpQEjRSJSOalHtHaYh+wW1wTuSUxk
	9BtVxzfl99imqpZYF7W53unnRKvgXtPI3fhOrZO9K+m2zJhjYTe2kz4byFPBojjDkEFwN1/Zn9y
	IUS6WWpskxohdHHxj7wxWL3aTbjLgnRFKPXpY03qiljiKg1x
X-Google-Smtp-Source: AGHT+IGwUG/CBsUpGRYjhgcNPscgKNmRQ+cVua2eVnjMgls4C4dMGEeHOIpe1PmYAks/OPTDp4q4wg==
X-Received: by 2002:ac2:4e12:0:b0:542:1c1e:ea7f with SMTP id 2adb3069b0e04-544059f7bc1mr969179e87.9.1738772997589;
        Wed, 05 Feb 2025 08:29:57 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb785dsm1963287e87.170.2025.02.05.08.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:29:57 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30616d71bb0so70666951fa.3;
        Wed, 05 Feb 2025 08:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOUnt3AfkFAgJsk22TUxS50eM60u2mW90HnD3xP7uTBLp5QFoIFF57GIenaeEOn9U4YxQaNQ0fhjDP+vs2@vger.kernel.org, AJvYcCWEFINcVLEShkrYhCT1GFFJQF/ndOFxHyxS/pC9UrhRv3BSHkueTUXQgVQqEWlRJPTW2+dl9lathJk9@vger.kernel.org
X-Received: by 2002:a2e:bea6:0:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-307cf38ebf7mr12010981fa.32.1738772997061; Wed, 05 Feb 2025
 08:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128200355.1948997-1-lukas.schmid@netcube.li> <20250128200355.1948997-5-lukas.schmid@netcube.li>
In-Reply-To: <20250128200355.1948997-5-lukas.schmid@netcube.li>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Feb 2025 00:29:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v6559Bw7ZMWoNfhTHFUYQHPjgmrTMFsF_+vi0BE617pGHw@mail.gmail.com>
X-Gm-Features: AWEUYZk6f9wurvaVXnEbxyhBjVM_hcqXeYFv8MCBUGs98p48pzlnXVUfKxLlxEY
Message-ID: <CAGb2v6559Bw7ZMWoNfhTHFUYQHPjgmrTMFsF_+vi0BE617pGHw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] ARM: dts: sunxi: add support for NetCube Systems Kumquat
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 29, 2025 at 4:05=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.=
li> wrote:
>
> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
>
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC with Battery Backup
> - QWIIC connectors for external I2C devices
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 278 ++++++++++++++++++
>  2 files changed, 280 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat=
.dts
>
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index 48666f73e638..d799ad153b37 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> +DTC_FLAGS_sun8i-v3s-netcube-kumquat :=3D -@
>  dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-a23-evb.dtb \
>         sun8i-a23-gt90h-v4.dtb \
> @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-v3s-anbernic-rg-nano.dtb \
>         sun8i-v3s-licheepi-zero.dtb \
>         sun8i-v3s-licheepi-zero-dock.dtb \
> +       sun8i-v3s-netcube-kumquat.dtb \
>         sun8i-v40-bananapi-m2-berry.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
>         sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/=
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> new file mode 100644
> index 000000000000..e4e98ddfbd96
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-v3s.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/{
> +       model =3D "NetCube Systems Kumquat";
> +       compatible =3D "netcube,kumquat", "allwinner,sun8i-v3s";
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +               ethernet0 =3D &emac;
> +               rtc0 =3D &ds3232;
> +               rtc1 =3D &rtc; /* not battery backed */
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       /* 40 MHz Crystal Oscillator on PCB */
> +       clk_can0: clock-can0 {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency  =3D <40000000>;
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +               autorepeat;
> +
> +               key-user {
> +                       label =3D "GPIO Key User";
> +                       linux,code =3D <KEY_PROG1>;
> +                       gpios =3D <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_=
UP)>; /* PB2 */
> +               };
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led-heartbeat {
> +                       gpios =3D <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +                       linux,default-trigger =3D "heartbeat";
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_HEARTBEAT;
> +               };
> +
> +               led-mmc0-act {
> +                       gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +                       linux,default-trigger =3D "mmc0";
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_DISK;
> +               };
> +       };
> +
> +       /* EA3036C Switching 3 Channel Regulator - Channel 2 */
> +       reg_vcc3v3: regulator-3v3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&reg_vcc5v0>;
> +       };
> +
> +       /* K7805-1000R3 Switching Regulator supplied from main 12/24V ter=
minal block */
> +       reg_vcc5v0: regulator-5v0 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
> +};
> +
> +&codec {
> +       allwinner,audio-routing =3D
> +               "Headphone", "HP",
> +               "Headphone", "HPCOM",
> +               "MIC1", "Mic",
> +               "Mic", "HBIAS";
> +       status =3D "okay";
> +};
> +
> +&ehci {
> +       status =3D "okay";
> +};
> +
> +&emac {
> +       allwinner,leds-active-low;
> +       nvmem-cells =3D <&eth0_macaddress>;
> +       nvmem-cell-names =3D "mac-address";
> +       status =3D "okay";
> +};
> +
> +&i2c0 {
> +       status =3D "okay";
> +
> +       ds3232: rtc@68 {

Nodes on an addressed bus should be ordered by their address, not
the name of the label.

> +               compatible =3D "dallas,ds3232";
> +               reg =3D <0x68>;
> +       };
> +
> +       eeprom0: eeprom@50 {
> +               compatible =3D "atmel,24c02";             /* actually it'=
s a 24AA02E48 */
> +               reg =3D <0x50>;
> +               pagesize =3D <16>;
> +               read-only;
> +               vcc-supply =3D <&reg_vcc3v3>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +
> +               eth0_macaddress: macaddress@fa {
> +                       reg =3D <0xfa 0x06>;
> +               };
> +       };
> +
> +       tusb320: typec@60 {
> +               compatible =3D "ti,tusb320";
> +               reg =3D <0x60>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};
> +
> +/* Exposed as the Flash/SD Header on the board */
> +&mmc0 {
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       broken-cd;
> +       status =3D "okay";
> +};
> +
> +/* Connected to the on-board ESP32 */
> +&mmc1 {
> +       vmmc-supply =3D <&reg_vcc3v3>;
> +       bus-width =3D <4>;
> +       broken-cd;
> +       status =3D "okay";
> +};
> +
> +&ohci {
> +       status =3D "okay";
> +};
> +
> +/* Disable external 32k osc as it is broken on current revision */
> +&osc32k {
> +       status =3D "disabled";
> +};
> +
> +&pio {
> +       vcc-pb-supply =3D <&reg_vcc3v3>;
> +       vcc-pc-supply =3D <&reg_vcc3v3>;
> +       vcc-pe-supply =3D <&reg_vcc3v3>;
> +       vcc-pf-supply =3D <&reg_vcc3v3>;
> +       vcc-pg-supply =3D <&reg_vcc3v3>;
> +
> +       gpio-line-names =3D "", "", "", "", // PA
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", // PB
> +                         "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA",
> +                         "UART0_TX", "UART0_RX", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI",=
 // PC
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "", // PD
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "Q12", "Q11", "Q10", "Q9", // PE
> +                         "LED_SYS0", "I1", "Q1", "Q2",
> +                         "I2", "I3", "Q3", "Q4",
> +                         "I4", "I5", "Q5", "Q6",
> +                         "I6", "I7", "Q7", "Q8",
> +                         "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST",
> +                         "ESP_nBOOT", "", "", "",
> +                         "", "", "", "",
> +                         "SD_D1", "SD_D0", "SD_CLK", "SD_CMD", // PF
> +                         "SD_D3", "SD_D2", "LED_SYS1", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
> +                         "ESP_D2", "ESP_D3", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "";
> +};
> +
> +/* Disable external 32k osc as it is broken on current revision */
> +&rtc {
> +       /delete-property/ clocks;
> +};
> +
> +/* Exposed as a USB-C connector with USB-Serial converter */
> +&uart0 {
> +       pinctrl-0 =3D <&uart0_pb_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +/* Connected to the Bootloader/Console of the ESP32 */
> +&uart1 {
> +       pinctrl-0 =3D <&uart1_pe_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +&usb_otg {
> +       extcon =3D <&tusb320 0>;
> +       dr_mode =3D "otg";
> +       status =3D "okay";
> +};
> +
> +&usbphy {
> +       usb0_id_det-gpios =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> +       status =3D "okay";
> +};
> +
> +&spi0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       cs-gpios =3D <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> +       status =3D "okay";
> +
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               label =3D "firmware";
> +               spi-max-frequency =3D <40000000>;
> +       };
> +
> +       can@1 {
> +               compatible =3D "microchip,mcp2518fd";
> +               reg =3D <1>;
> +               clocks =3D <&clk_can0>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */

Please use interrupts-extended instead.

ChenYu

> +               spi-max-frequency =3D <20000000>;
> +               vdd-supply =3D <&reg_vcc3v3>;
> +               xceiver-supply =3D <&reg_vcc3v3>;
> +       };
> +};
> --
> 2.39.5
>
>
