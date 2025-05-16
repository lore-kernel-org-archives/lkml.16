Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA879EA;
	Fri, 16 May 2025 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747361091; cv=none; b=HJPwzqTqWL69Ndiajd9SGKRApijUK8Cvwppt0jvHdxfvj9Bx1uClFoSh4SuPSEIceyWqqHepWrOwvZgmfVFKglP8tcVYVwlpyEEhFwIs3qHu+pBBIQq0UHxhkLpxOrZDG1F0W+E35s5C9eAJujyD/uaPvsEzO+Qecc2oBh9hcDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747361091; c=relaxed/simple;
	bh=sUht+kwWjhTzgBgD9uXTU21MoaPsxXXMW/kqXmYdvLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rY2C3OD9z0VNCGXCLxX1G0kfhPQY01pO7WktVd/GLmSC4a253GKnhZNryCRHQlh7EAfSRBDaaZRxEObCWOlckeaN/AeC6Qf5InZKyMNN2+KXomGlYHxTFLw7kaF7H762+sIcLojXlRv0dWcgSI709uyQxtnqk92UVZe+In0UOss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqJ0oyxt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqJ0oyxt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a108684f90so1019034f8f.1;
        Thu, 15 May 2025 19:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747361086; x=1747965886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy01KX7nYzGNumbQFm35zaepqsv7aOtl9u6oXIRJoWg=;
        b=ZqJ0oyxtt+3V7d+/xlTLHwhkV6pyW/SsqDwQpbcRRwZLooLIZDrpaYejyUIiMdtqCg
         1RN4MDnBpqxvGg4NN9V0ZO6lkqVuxceDqUw4EvasuWbSCGhwv7TcwiXbHK01Xf7r1mAx
         +O54nmrYg14yJYiP9WUrzEir04yFWrPMQCjId7cmTtXbHr1ewwj2MltzRAwweDHyCtL0
         Z1syOSBBA0nGD5AlP5UJEaxW2ddXLnaz4nIecmHWnJQdwFKoJkfRQhjX0RDm3GPLnEPy
         DQgB/jYAdN1ecH3ps334Bq7w5Qty7VxWNmb1ruxtxYpizFqpV6PVX6ae3ZvsjhKPaZIa
         tCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747361086; x=1747965886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy01KX7nYzGNumbQFm35zaepqsv7aOtl9u6oXIRJoWg=;
        b=MNUbm8kwQEYq04uxdqA/EvOtLUV9gniPaIyGMEmoVmcN6E9TkwSXJn42G76N740i2R
         cR3xH6ogZjt9eI4Jb+ATjxsZKYSF2Wf4BIVrB+L+buHj9po9kqra89dptUtHo2tKlFx4
         5e88gB4BGF+VGnTdxFWZI3IBQCDTYSxy/uOm2L7l/uBqL+FQLnLREwcm/SpG+0T8i8Cf
         aewyq5x6pXXXGlGHvVpl5WM9aXt3BxySs76JyAWUTUX88TLpuPAWfXBSahv4SH6LeEcZ
         yZKCtKQEKqAQ7iR5HEmjJkNQ5hobaK39+0itOlnOUWYFiEdHWGyfHmFDB9ms06QMugTK
         OHFA==
X-Forwarded-Encrypted: i=1; AJvYcCWXI1zIQv4ZurdD+O83gtbhT4/+29K7CIHzTNtmrC3xy/jM2XW9llLD4odcUuWY+xS7ThHZwFQOkXoYT0ez@vger.kernel.org, AJvYcCWwp709gUBRjKk7q66upBKys0CCG1mJcW1a1TO/XoKlCgZ9B/elG4E2Y2S4AQmny7fhwizzgp4JidwK@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOQ5dQKT7ZtnwYoHgwrMC4D3PQabHSmE47b+QFoSNJD+ylt6e
	69uAR2agrsBPi3pjwpBkpaCAqWug0Npe+x2Uu2KyjUhIt8lBzoU8Un9Xl5Iik3+lAiKwRWSVGTl
	ql9VbDtR5MKQQkjbvZjDqyV1AFldgCMEzkypK
X-Gm-Gg: ASbGncsbURxBR8sCkoEk1TZG3dV6IVu9mna9Ro09QPXC112HXbAN2JQ2Pa1sd88erYM
	33FztnMx2qdqFt1+Cs53EfR2DZmv551F1YlBoPBhuX+9RuKZqfqjjK56sIKhy/6BgmL3mdyCq2v
	0BSISO6rlu7XaC3RmUUF0XodsBtNSrrMvOavSgXSx1eRM+SUs0UUWomiuoWmSKFJEGV3yk0qGga
	Jo=
X-Google-Smtp-Source: AGHT+IHsCYWCS385NwfjK9Bhmj7WA0kaaAqXyoMvtuzuzoKl3kURP3UyOxsnoFYsMNuuiOmuCyNtWdOmh4w9MkgCl5Y=
X-Received: by 2002:a05:6000:2ce:b0:3a0:7d15:1d8a with SMTP id
 ffacd0b85a97d-3a35c852ff6mr1772884f8f.38.1747361086289; Thu, 15 May 2025
 19:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516012402.580468-1-i@chainsx.cn> <20250516012402.580468-3-i@chainsx.cn>
In-Reply-To: <20250516012402.580468-3-i@chainsx.cn>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Thu, 15 May 2025 21:04:35 -0500
X-Gm-Features: AX0GCFtbc13K1rfulb196kbfV4DhQixriaUAAN0YHKgi96d5SnEpOVwWz4vNEnU
Message-ID: <CALWfF7K8_K20nT2Pf9t267sgoUK2GvSqh=Stui_f300cYLoSLg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
To: Hsun Lai <i@chainsx.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, heiko@sntech.de, krzk+dt@kernel.org, 
	sfr@canb.auug.org.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 8:32=E2=80=AFPM Hsun Lai <i@chainsx.cn> wrote:
>
> The Firefly ROC-RK3588S-PC is a SBC based on the Rockchip RK3588s SoC.
>
> Link: https://wiki.t-firefly.com/en/Station-M3/index.html
>
> The device contains the following hardware that is tested/working:
>  - 32 or 64GB eMMC
>  - SDMMC card slot
>  - Realtek USB WiFi 5/BT
>  - NVME 2242 socket
>  - 4 or 8GB of RAM
>  - RTL8211 GbE
>  - USB 3.0 port
>  - USB 2.0 port
>  - HDMI port
>
> Signed-off-by: Hsun Lai <i@chainsx.cn>
>
> ---
>
> Changes in v3:
> - Update the name of leds
> - Add more cpu nodes
> - Update mdio compatible
> - Fix the order in the node
> - Add the default serial port(uart2)
>
> Changes in v2:
> - Fix rgmii delays
>
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
>
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 926 ++++++++++++++++++
>  2 files changed, 927 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index e63c3f5eb..dd6ae546d 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -182,6 +182,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.d=
tb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-rock-5a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-rock-5c.dtb
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64=
/boot/dts/rockchip/rk3588s-roc-pc.dts
> new file mode 100644
> index 000000000..386caebc9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> @@ -0,0 +1,926 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3588s.dtsi"
> +
> +/ {
> +       model =3D "Firefly Station M3";
> +       compatible =3D "firefly,rk3588s-roc-pc", "rockchip,rk3588s";
> +
> +       aliases {
> +               ethernet0 =3D &gmac1;
> +               mmc0 =3D &sdhci;
> +               mmc1 =3D &sdmmc;
> +       };
> +
> +       analog-sound {
> +               compatible =3D "simple-audio-card";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hp_detect>;
> +               simple-audio-card,name =3D "rockchip,es8388";
> +               simple-audio-card,bitclock-master =3D <&masterdai>;
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,frame-master =3D <&masterdai>;
> +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PA6 GPIO_AC=
TIVE_LOW>;
> +               simple-audio-card,mclk-fs =3D <256>;
> +               simple-audio-card,pin-switches =3D "Headphones";
> +               simple-audio-card,routing =3D
> +                       "Headphones", "LOUT1",
> +                       "Headphones", "ROUT1",
> +                       "LINPUT1", "Microphone Jack",
> +                       "RINPUT1", "Microphone Jack",
> +                       "LINPUT2", "Onboard Microphone",
> +                       "RINPUT2", "Onboard Microphone";
> +               simple-audio-card,widgets =3D
> +                       "Microphone", "Microphone Jack",
> +                       "Microphone", "Onboard Microphone",
> +                       "Headphone", "Headphones";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai =3D <&i2s0_8ch>;
> +               };
> +
> +               masterdai: simple-audio-card,codec {
> +                       sound-dai =3D <&es8388>;
> +                       system-clock-frequency =3D <12288000>;
> +               };
> +       };
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
> +       fan: fan {
> +               compatible =3D "pwm-fan";
> +               cooling-levels =3D <60 100 140 160 185 220 255>;
> +               fan-supply =3D <&vcc12v_dcin>;
> +               pwms =3D <&pwm11 0 50000 1>;
> +               #cooling-cells =3D <2>;
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&led_pins>;
> +
> +               led-0 {
> +                       default-state =3D "on";
> +                       function =3D LED_FUNCTION_POWER;
> +                       gpios =3D <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               led-1 {
> +                       function =3D LED_FUNCTION_HEARTBEAT;
> +                       gpios =3D <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +
> +               led-2 {
> +                       default-state =3D "off";
> +                       gpios =3D <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +       vcc12v_dcin: regulator-vcc12v-dcin {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc12v_dcin";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <12000000>;
> +               regulator-max-microvolt =3D <12000000>;
> +       };
> +
> +       vcc5v0_sys: regulator-vcc5v0-sys {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc12v_dcin>;
> +       };
> +
> +       vcc5v0_usbdcin: regulator-vcc5v0-usbdcin {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_usbdcin";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc12v_dcin>;
> +       };
> +
> +       vcc5v0_usb: regulator-vcc5v0-usb {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_usb";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc5v0_usbdcin>;
> +       };
> +
> +       vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3_pcie20";
> +               enable-active-high;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               startup-delay-us =3D <5000>;
> +               gpio =3D <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc12v_dcin>;
> +       };
> +
> +       vcc5v0_host: regulator-vcc5v0-host {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpio =3D <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vcc5v0_host_en>;
> +               regulator-name =3D "vcc5v0_host";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       vbus5v0_typec_pwr_en: vbus5v0-typec-pwr-en-regulator {
The "regulator" should be a prefix instead of a suffix to be consistent.

> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpio =3D <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&typec5v_pwren>;
> +               regulator-name =3D "vbus5v0_typec_pwr_en";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc5v0_sys>;
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
> +&cpu_b0 {
> +       cpu-supply =3D <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b1 {
> +       cpu-supply =3D <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b2 {
> +       cpu-supply =3D <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_b3 {
> +       cpu-supply =3D <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_l0 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&gmac1 {
> +       clock_in_out =3D "output";
> +       phy-handle =3D <&rgmii_phy1>;
> +       phy-mode =3D "rgmii-id";
> +       pinctrl-0 =3D <&gmac1_miim
> +                    &gmac1_tx_bus2
> +                    &gmac1_rx_bus2
> +                    &gmac1_rgmii_clk
> +                    &gmac1_rgmii_bus>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +&gpu {
> +       mali-supply =3D <&vdd_gpu_s0>;
> +       status =3D "okay";
> +};
> +
> +&hdmi0 {
> +       status =3D "okay";
> +};
> +
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
> +
> +&i2c0 {
> +       pinctrl-0 =3D <&i2c0m2_xfer>;
> +       status =3D "okay";
> +
> +       vdd_cpu_big0_s0: regulator@42 {
> +               compatible =3D "rockchip,rk8602";
> +               reg =3D <0x42>;
> +               fcs,suspend-voltage-selector =3D <1>;
> +               regulator-name =3D "vdd_cpu_big0_s0";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <550000>;
> +               regulator-max-microvolt =3D <1050000>;
> +               regulator-ramp-delay =3D <2300>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +
> +               regulator-state-mem {
> +                       regulator-off-in-suspend;
> +               };
> +       };
> +
> +       vdd_cpu_big1_s0: regulator@43 {
> +               compatible =3D "rockchip,rk8603", "rockchip,rk8602";
> +               reg =3D <0x43>;
> +               fcs,suspend-voltage-selector =3D <1>;
> +               regulator-name =3D "vdd_cpu_big1_s0";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <550000>;
> +               regulator-max-microvolt =3D <1050000>;
> +               regulator-ramp-delay =3D <2300>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +
> +               regulator-state-mem {
> +                       regulator-off-in-suspend;
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-0 =3D <&i2c2m0_xfer>;
> +       status =3D "okay";
> +
> +       usbc0: usb-typec@22 {
> +               compatible =3D "fcs,fusb302";
> +               reg =3D <0x22>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usbc0_int>;
> +               vbus-supply =3D <&vbus5v0_typec_pwr_en>;
> +
> +               usb_con: connector {
> +                       compatible =3D "usb-c-connector";
> +                       label =3D "USB-C";
> +                       data-role =3D "dual";
> +                       op-sink-microwatt =3D <1000000>;
> +                       power-role =3D "dual";
> +                       sink-pdos =3D
> +                               <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM=
)>;
> +                       source-pdos =3D
> +                               <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM=
)>;
> +                       try-power-role =3D "sink";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +
> +                                       usbc0_orien_sw: endpoint {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_orientation_switch>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +
> +                                       dp_altmode_mux: endpoint {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_dp_altmode_mux>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       vdd_npu_s0: regulator@42 {
> +               compatible =3D "rockchip,rk8602";
> +               reg =3D <0x42>;
> +               fcs,suspend-voltage-selector =3D <1>;
> +               regulator-name =3D "vdd_npu_s0";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <550000>;
> +               regulator-max-microvolt =3D <950000>;
> +               regulator-ramp-delay =3D <2300>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +
> +               regulator-state-mem {
> +                       regulator-off-in-suspend;
> +               };
> +       };
> +
> +       hym8563: rtc@51 {
> +               compatible =3D "haoyu,hym8563";
> +               reg =3D <0x51>;
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "hym8563";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hym8563_int>;
> +       };
> +};
> +
> +
> +&i2c3 {
> +       status =3D "okay";
> +
> +       es8388: audio-codec@10 {
> +               compatible =3D "everest,es8388", "everest,es8328";
> +               reg =3D <0x10>;
> +               clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +               AVDD-supply =3D <&vcc_3v3_s0>;
> +               DVDD-supply =3D <&vcc_1v8_s0>;
> +               HPVDD-supply =3D <&vcc_3v3_s0>;
> +               PVDD-supply =3D <&vcc_3v3_s0>;
> +               assigned-clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +               assigned-clock-rates =3D <12288000>;
> +               #sound-dai-cells =3D <0>;
> +       };
> +};
> +
> +&i2s0_8ch {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2s0_lrck
> +                    &i2s0_mclk
> +                    &i2s0_sclk
> +                    &i2s0_sdi0
> +                    &i2s0_sdo0>;
> +       status =3D "okay";
> +};
> +
> +&i2s5_8ch {
> +       status =3D "okay";
> +};
To use this, hdmi0_sound will also need to be enabled.

> +
> +&mdio1 {
> +       rgmii_phy1: ethernet-phy@1 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0x1>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&rtl8211f_rst>;
> +               reset-assert-us =3D <20000>;
> +               reset-deassert-us =3D <100000>;
> +               reset-gpios =3D <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +
> +&pcie2x1l1 {
> +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> +       vpcie3v3-supply =3D <&vcc3v3_pcie20>;
> +       status =3D "okay";
> +};
> +
> +&pd_gpu {
> +       domain-supply =3D <&vdd_gpu_s0>;
> +};
> +
> +&pinctrl {
> +       hym8563 {
> +               hym8563_int: hym8563-int {
> +                       rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +
> +       headphone {
> +               hp_detect: hp-detect {
> +                       rockchip,pins =3D <1 RK_PA6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       leds {
> +               led_pins: led-pins {
> +                       rockchip,pins =3D <1 RK_PD5 RK_FUNC_GPIO &pcfg_pu=
ll_none>,
> +                                       <3 RK_PB2 RK_FUNC_GPIO &pcfg_pull=
_none>,
> +                                       <3 RK_PC0 RK_FUNC_GPIO &pcfg_pull=
_none>;
> +               };
> +       };
> +
> +       rtl8211 {
> +               rtl8211f_rst: rtl8211f-rst {
> +                       rockchip,pins =3D <0 RK_PD3 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +
> +       usb {
> +               vcc5v0_host_en: vcc5v0-host-en {
> +                       rockchip,pins =3D <1 RK_PB6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usbc0_int: usbc0-int {
> +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +
> +               typec5v_pwren: typec5v-pwren {
> +                       rockchip,pins =3D <1 RK_PB1 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +};
> +
> +&pwm11 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm11m3_pins>;
> +       status =3D "okay";
> +};
> +
> +&saradc {
> +       vref-supply =3D <&vcc_1v8_s0>;
> +       status =3D "okay";
> +};
> +
> +&sdhci {
> +       bus-width =3D <8>;
> +       mmc-hs400-1_8v;
> +       mmc-hs400-enhanced-strobe;
> +       no-sdio;
> +       no-sd;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&sdmmc {
> +       bus-width =3D <4>;
> +       cap-sd-highspeed;
> +       disable-wp;
> +       max-frequency =3D <150000000>;
> +       no-sdio;
> +       no-mmc;
> +       sd-uhs-sdr104;
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
> +                               <&rk806_dvs2_null>, <&rk806_dvs3_null>;
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
> +               vcc13-supply =3D <&vcc_1v1_nldo_s3>;
> +               vcc14-supply =3D <&vcc_1v1_nldo_s3>;
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
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-enable-ramp-delay =3D <400>;
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
> +                       vdd_log_s0: dcdc-reg3 {
> +                               regulator-name =3D "vdd_log_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <675000>;
> +                               regulator-max-microvolt =3D <750000>;
> +                               regulator-ramp-delay =3D <12500>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
750000>;
> +                               };
> +                       };
> +
> +                       vdd_vdenc_s0: dcdc-reg4 {
> +                               regulator-name =3D "vdd_vdenc_s0";
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
> +                       vdd_ddr_s0: dcdc-reg5 {
> +                               regulator-name =3D "vdd_ddr_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <675000>;
> +                               regulator-max-microvolt =3D <900000>;
> +                               regulator-ramp-delay =3D <12500>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
850000>;
> +                               };
> +                       };
> +
> +                       vcc_1v1_nldo_s3: vdd2_ddr_s3: dcdc-reg6 {
> +                               regulator-name =3D "vdd2_ddr_s3";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-max-microvolt =3D <1100000>;
> +                               regulator-min-microvolt =3D <1100000>;
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
> +
> +                       vddq_ddr_s0: dcdc-reg9 {
> +                               regulator-name =3D "vddq_ddr_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcc_1v8_s3: dcdc-reg10 {
> +                               regulator-name =3D "vcc_1v8_s3";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       avcc_1v8_s0: pldo-reg1 {
> +                               regulator-name =3D "avcc_1v8_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcc_1v8_s0: pldo-reg2 {
> +                               regulator-name =3D "vcc_1v8_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       avdd_1v2_s0: pldo-reg3 {
> +                               regulator-name =3D "avdd_1v2_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <1200000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcc_3v3_s0: pldo-reg4 {
> +                               regulator-name =3D "vcc_3v3_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-ramp-delay =3D <12500>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vccio_sd_s0: pldo-reg5 {
> +                               regulator-name =3D "vccio_sd_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-ramp-delay =3D <12500>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       pldo6_s3: pldo-reg6 {
> +                               regulator-name =3D "pldo6_s3";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       vdd_0v75_s3: nldo-reg1 {
> +                               regulator-name =3D "vdd_0v75_s3";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <750000>;
> +                               regulator-max-microvolt =3D <750000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
750000>;
> +                               };
> +                       };
> +
> +                       vdd_ddr_pll_s0: nldo-reg2 {
> +                               regulator-name =3D "vdd_ddr_pll_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <850000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
850000>;
> +                               };
> +                       };
> +
> +                       avdd_0v75_s0: nldo-reg3 {
> +                               regulator-name =3D "avdd_0v75_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <750000>;
> +                               regulator-max-microvolt =3D <750000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_0v85_s0: nldo-reg4 {
> +                               regulator-name =3D "vdd_0v85_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <850000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_0v75_s0: nldo-reg5 {
> +                               regulator-name =3D "vdd_0v75_s0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <750000>;
> +                               regulator-max-microvolt =3D <750000>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +
> +&tsadc {
> +       status =3D "okay";
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
> +&u2phy3 {
> +       status =3D "okay";
> +};
> +
> +&u2phy2_host {
> +       phy-supply =3D <&vcc5v0_host>;
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
> +&uart7 {
> +       pinctrl-0 =3D <&uart7m2_xfer>;
> +       status =3D "okay";
> +};
> +
> +&usbdp_phy0 {
> +       mode-switch;
> +       orientation-switch;
> +       sbu1-dc-gpios =3D <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
> +       sbu2-dc-gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
> +       status =3D "okay";
> +
> +       port {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               usbdp_phy0_orientation_switch: endpoint@0 {
> +                       reg =3D <0>;
> +                       remote-endpoint =3D <&usbc0_orien_sw>;
> +               };
> +
> +               usbdp_phy0_dp_altmode_mux: endpoint@1 {
> +                       reg =3D <1>;
> +                       remote-endpoint =3D <&dp_altmode_mux>;
> +               };
> +       };
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
> +       extcon =3D <&u2phy0>;
> +       status =3D "okay";
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
> --
> 2.34.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
