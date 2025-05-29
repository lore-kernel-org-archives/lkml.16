Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C8215F7D;
	Thu, 29 May 2025 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748508116; cv=none; b=g3Od2sktpRpS5mOCKOgYFeS+MU6BD2Qs9rtlZ9mmBh/itErPFMydITrKmsuqeWl5k23fustYTwPLYdIhTRTqpfhIdlLA4jAj5rca7mdFM4De4SMUruPGzwkKNOQ5lcULfzetpG4N9kZmtiYvfBmsEdxEUDDUXflIVH6UK2jCK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748508116; c=relaxed/simple;
	bh=OuspnWTVYQSi8/jedqVn217G1Y2qKL3iu0EIvP7BufQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYat3vIyJUCJGplkdGrzq+hxi4DOGw+AySNwlcU5l1vxdp6wsUR/TQGELYxBtva0wJ4YoHWQsRHu94sFF/750ncVWgy5ZxQBhuJ7UbRl9puW43c6HPvrur7A85u3/uds9TW8FvhBsk173UIErkWG/TllxoZ7b524R0fLCgmMSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=nPrFQVkw; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="nPrFQVkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1748508111; x=1749112911; i=wahrenst@gmx.net;
	bh=UOD287QS0fpGWmLkl73qXJLRrRdbB/PWBAC8P4gOOcE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nPrFQVkwzGVBXHyU834utKM14RjCtEQoD9cyOITpTnRNX4VBCTBioW8aYpw9bSQC
	 WJiXOeiwlz4ZeHDjtbQR/6o4ORHC2qFkzVG+qMMHbbdRqYkeQ70YGSgV5L+qXpSBt
	 1nl0Yyx5d+Hr5V2A4ea65RuANN2ftky8WkERJ3IuD7BhNrUGHyZdA8m4t9H8Il3ps
	 snZyAzscWNswk9tGryWOsHX9GDlI7cAVOZBgdXGmx1FXearejOHvLYpAHZ126dfgn
	 /GpfB60uS+XPMaIC1+Mmjp2mYis17HvbjolZnft7aORXgmko5jaO7iV0VOV4A//tp
	 9XRDXiLBcJv7uVpL8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1v3tSk2hcK-00u7UX; Thu, 29
 May 2025 10:41:50 +0200
Message-ID: <8c0662e9-3f7a-4b71-80e6-3898842e49de@gmx.net>
Date: Thu, 29 May 2025 10:41:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HwcLHcfp+wmgZaWwVrg9XzWtKXnek0CBVHSQTgCsObv1iFQZ+/U
 WaYQCWzAE61a7g6oLCfCpzgmLG00uujGoJUuG6b3Jbkpg7oNWcFzh7gpe5q/0txTtowdX/5
 DpO1Xt0tz+KYyWsodOrU6sRboAlI3DIjPMqPKbHtzqma0AZ6H2ISrOLcaVe+LNSZnD7c7PC
 3j2ojKa4eF2QB3MDo7H0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fWyCDTFUc18=;xD8GD5bQclGsIh/jOg3xXELay79
 VSk4DFVr8SVoRtLRrF/6hI+TQ0SraiVNzMX92DcKfTeTbMBDzofPMHMwMpdQnUUoQ+04yDl66
 hqq50k5fL6Ef6BAquTFhe5sHMMRE3SIvbJlxj0TctzKTmvmv2fG3OZ941IF4OzgTDlXiTkMTi
 6U2YCVRGAVs6MA4QunaTY4PMhQ2d1Uvxg3uw0sNm+rXW2sBnmTdo2yViek1cg0BuwMhgh1qzX
 MI06aSCy5u2QUJBlQNjpkIGEEUjh2kTmVET/Q7W2h8+l66G903QNRFogvI5EuIjkV2M7zIHGc
 k+iM44bjBerltZYLvZXhwDYHj5x7B11qLUb5zqW162tyl0/dJKEAQ6soPtCL3Ar1mZd66t8VZ
 ySZezrc2okVkNPqTe8+lJ1CWpnlDZ+ccPw06GSnsy8up47EQLvV2Lix7dZfOwms+8OdI7KypA
 OP6F67OjBGKvULj/n7enUOFifjTImO9nk7K/8oxz36eWwtMfKyXfC/rFBxof/XsaVzkGnQkBQ
 mCNDaiXKifQXxxi95ZCc2S9nTsXcAc2gNXNpRPYK5eiq/bfvs0T097lb2K9OqMWzkLOgpTbZE
 OKgTeuZ6ARq3Yf5HVzRDA0lQzvB0FKYcEbynN7IeUQ3upxak+8aZl4pIYuUSpCYoOgbsfuDT4
 qPt9AkuTrkdY7jujRPr6TitEm+B3wwklFtpzSu4+YVREuRdM1mjuftxD+nMm83eF0l7gDS9OX
 hkNZjManGO7YbafS1/1/a60YJWba6iHAD6aJWR2x3Ry5Ik6HU7VEtqoGeqQQr+0iN26WJnNLo
 4/cQQZOx3EwxH7m0qRNUkKhotz/fp2n5k9g7oxk18g17poKVsTSWbD6HBtiXIk/gH1vPdQf+I
 DRrBl3CT5vjxNgIpQrmAb59vEBVEp3MMvmHb1D55VrVGIerji3nl96cIm9k8NrpV8wFZ11u49
 pgtPJcZi0PJjQRGLc4ZCIEaCCQYZ+qFoCqoqmQ+5ZX8Es0MNFobbd2usaxhG1g65tKSM/OWvu
 Qz1nmv8t3pSlFUhNLlTu/E57mkIKYU89tUhiyjC+sHU68u1OpV7l8Z0CmdWlrY27L6PgmQtM4
 2BCMM1uYc9ZEiGFEcgBwwKkP8e6qI3EnJYzQdNQrWJ7NGVsgyGu7xVn+IA5tTvHKZ6KVzVJ73
 Qa1pd5cfMSPVwfA1bF1qFTzL4SZnlNR3LGvIrQ5xNIKX/lHkOU6j1H/YMr3CtnAcbXz7j0IdQ
 rydaFSapInjEtJAFjSH3U7uxVJs+5LSeH7Rfjgp07/vq+28/dpr4+FIpr+8RZiU+Yn01nTPRZ
 6V5TGL+ZGGMhA1jWt8B37KpP3ypL1CpGUcNFtRPlirFD50f9bf4lIm68ya7cZN70qBAlMAiqC
 NNq2wzvLY9at5L7OwETngCCMzTHAQlMTOojUOOUXVXHiYiTahtGCt+PzjHU+zbTMiDdHtp+LA
 aNVEZbS91VOIriu2CgrMhOtA3PNWXjGEJW9t3uThOW4bkm8IGaohiMcpw0wAeXiBD+8FZfFAg
 QtnTKUkaxUhVaA5LEB2xNGx6mZcaDX6igUdVhnu4MjryBAmgnWzpVCLA31lBJTNsNGRJi3o6I
 fJQ2RfUwtaA/E4zG3KDPyEo8H2RmGUjyFSnJPNLQxeDhVTOWyx8R/XdpxJP6KcSklw3uevyig
 Gzaazma9eCykiQRZ6rkiJIFug4uF4ZP94XjXIGQ34nhk1OKDl1D3rSZAVj/FaY8iY2fQ1jdYD
 GUMEx2xk+ySLxwXlNoxBax3uk0fgDf7IJGBd1FzzkdgNxA9pudtRYbTSFxU31nz3R8jlVXyke
 cITgmb8oSq2UahqviCuh/9w/Ro2M/zAmG9X8ZLzYX+Dm1tWqir8t9+eGCV2vN8PEujf5K7CT9
 WiKb/sWr1q8evx8AKUHhdD0VW21jClm4rdlOrh1gLNA22wtCrPZnAu99HrxBWp5q/WEdodt6x
 9jl56HZ1QxPNl+HQ1hx46XplQdWwDif3wq9HBwqs4PU1w7u6+H+bceMC4tylNlg1dB03JfC00
 rXlPv9a7hKX4nsRdREnh5WfzTgcURL2LLVzQ9VqMVK2uqufVvH0olV8Zptb20I+qmqUBumvyr
 b/ca5Q8BDBTy6sJE2PppZQuRGU3Sjs5a/Jxknf38YUzREwxIhGQPikFWSS2GqTSrHsgno+lQj
 CcaiEYIX3nMgsD9fFL92kPjCIa9b9t+eEHbxIVj2vz9qDX2uCygT9st16wvIaZi+vFGdK+9Q2
 UnTiaGDiD7W5Kik9FkdZTgHK0uiLZ7HdNSeyItGZx0PmlYJ9IRgvhcR2QkBg1uEdKGlyqfNJC
 +U19Vu5jJwOg9PNh4u37awhU0sCvVwf1HKzqMz5ZV5FuP7SRgNld3Fzyha73xH9b4hh07qD4S
 dZg2nU8z1WkjHwOxydfhIKuuvCijtbWRXbTYknE1tD0Q2PNe7+RwTVMs5y9uNfZuOJ6fUFih+
 9YYDib8bu6OOzi4IjIY2W1BaCO8HsNdXVzMGHmSDUlKDVuq90qr5rCgb3qAOI1MqahIWwV4wn
 a9s56TKqwrPJOd3q2vs6HM4bn6/A8qL/sab/FyE0yMRRSKWPATkrWLn6P1XXEZ1x3xO0PIQuu
 G3voTrgGutFGCucjgwCe8Ewa5wVwAQgOFM9T8sPOznimNilzkYpadb/EPfAkrlaBGkYoKbgUn
 yQYLb/FvzzLPE8Op+O3uWuaT26rQEsshf/frbzQatOH8eTzkAG7eLoTxY89ocQn2aXoJHFpOg
 Dc1pVlbDDuqRyykIbMqmLhpdD/S7e/RhZBz/1ac32MMds9CvpABXUQqQ16jjKZMUvEfA+eEmX
 ix77EYzLz/cGynMqVgnlpYEWuYkiMmCEY/4/xVahfhydPE46URameyo3ewuxSAu8brZSZznZb
 ZCMfDTBkcR8AjzXIressC88rxQeRdLH0Z3REWO3wxUnxWM7/elVT5PtoxlqW7j4BO7UJzvIS1
 Qz1feUgkoWktYXzCMLVAijRMPR/nkqm9StcoI9IOYQfziD+mWNlZl3ECXqFCGHnAV6793tqID
 SytI44C42HPf/LlKPzqxUZcPCjWmy25+L/Leh1gwyzFWvEMbFkgb46NPWoq2icwI4BVIVNOio
 cWiKXRD8fTI9w3UWZZc/P4DcHoR/MrtDjkAKBUJVhgM8Ogfv/bbVmiVQXN3r0RSyWsLAbjXnB
 tgPa2EnreDg8gzP3inQChIWkmL0KBvlxAVRLLZ4Y2pwQ8iY+6ik0ZQDSXB+gP6p8kyotahM6O
 NNrOIdGlzFi/EWaCsWruLu1yO79X9SN8Ob0rsA==

Hi Dario,

Am 28.05.25 um 14:11 schrieb Dario Binacchi:
> The board includes the following resources:
>   - 256 Mbytes NAND Flash
>   - 128 Mbytes DRAM DDR2
>   - CAN
>   - USB 2.0 high-speed/full-speed
>   - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v2:
> - In imx28-amarula-rmm.dts:
>    - Replace '-' with '@' for the pinctrl sub-nodes.
>    - Replace edt,edt-ft5x06 with edt,edt-ft5306.
>    - Drop LCD reset hog pin.
>    - Add correct #address-cells and #size-cells to gpmi node.
>    - Replace edt-ft5x06@38 with touchscreen@38.
> - Drop from commit messages all references to LCD display.
> - Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
>    json-schema".
>
>   arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
>   .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
>   2 files changed, 304 insertions(+)
>   create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
>
> diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/=
mxs/Makefile
> index 96dd31ea19ba..d72ba702b6fa 100644
> --- a/arch/arm/boot/dts/nxp/mxs/Makefile
> +++ b/arch/arm/boot/dts/nxp/mxs/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) +=3D \
>   	imx23-sansa.dtb \
>   	imx23-stmp378x_devb.dtb \
>   	imx23-xfi3.dtb \
> +	imx28-amarula-rmm.dtb \
>   	imx28-apf28.dtb \
>   	imx28-apf28dev.dtb \
>   	imx28-apx4devkit.dtb \
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/=
boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> new file mode 100644
> index 000000000000..5daa9e22715d
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> @@ -0,0 +1,303 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi=
@amarulasolutions.com>
> + */
> +
> +/dts-v1/;
> +#include "imx28.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model =3D "Amarula i.MX28 rmm";
> +	compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> +
> +	memory@40000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x40000000 0x08000000>;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "5v";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "1v8";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};
> +
> +	reg_fec_3v3: regulator-fec-3v3 {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&fec_3v3_enable_pin>;
> +		regulator-name =3D "fec-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpios =3D <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us =3D <300000>;
> +		vin-supply =3D <&reg_5v>;
> +	};
> +
> +	reg_usb0_vbus: regulator-usb0-vbus {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usb0_vbus_enable_pin>;
> +		regulator-name =3D "usb0_vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usb1_vbus_enable_pin>;
> +		regulator-name =3D "usb1_vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm 4 5000000 0>;
> +		brightness-levels =3D <0 255>;
> +		num-interpolated-steps =3D <255>;
> +		default-brightness-level =3D <255>;
> +		power-supply =3D <&reg_5v>;
> +	};
> +
> +	beeper {
> +		compatible =3D "pwm-beeper";
This driver is not enabled in mxs_defconfig, shouldn't this be added?
> +		pwms =3D <&pwm 7 100000 0>;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&leds_pins>;
> +
> +		led-0 {
> +			label =3D "status";
According to Documentation/devicetree/bindings/leds/common.yaml this=20
property is deprecated, please use function and color instead.
> +			gpios =3D <&gpio2 7 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +		};
> +
> +		led-1 {
> +			label =3D "x22_5";
> +			gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +		};
> +
> +		led-2 {
> +			label =3D "x22_4";
> +			gpios =3D <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +		};
> +	};
> +};
> +
> +&auart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&auart0_2pins_a>;
> +	status =3D "okay";
> +};
> +
> +&auart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&auart1_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&can0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&can0_pins_a>;
> +	xceiver-supply =3D <&reg_3v3>;
> +	status =3D "okay";
> +};
> +
> +&duart {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&duart_pins_b>;
> +	status =3D "okay";
> +};
> +
> +&duart_pins_b {
> +	fsl,voltage =3D <MXS_VOLTAGE_LOW>;
> +};
> +
> +&gpmi {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gpmi_pins_a &gpmi_status_cfg>;
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins_a>;
> +	status =3D "okay";
> +
> +	touchscreen: touchscreen@38 {
> +		compatible =3D "edt,edt-ft5306";
This driver isn't enabled in mxs_defconfig, too.
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <19 IRQ_TYPE_EDGE_RISING>;
> +		reset-gpios =3D <&gpio0 21 GPIO_ACTIVE_LOW>;
> +		wake-gpios =3D <&gpio0 18 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&lradc {
> +	status =3D "okay";
> +};
> +
> +&mac0 {
> +	phy-mode =3D "rmii";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mac0_pins_a>;
> +	phy-supply =3D <&reg_fec_3v3>;
> +	phy-handle =3D <&ethphy>;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy: ethernet-phy@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			max-speed =3D <100>;
> +			reset-gpios =3D <&gpio3 28 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <4000>;
> +			reset-deassert-us =3D <4000>;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&hog_pins_a>;
> +
> +	hog_pins_a: hog@0 {
> +		reg =3D <0>;
> +		fsl,pinmux-ids =3D <
> +			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
> +		>;
> +		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> +		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up =3D <MXS_PULL_DISABLE>;
> +	};
> +
> +	edt_ft5x06_pins: edt-ft5x06@0 {
> +		reg =3D <0>;
> +		fsl,pinmux-ids =3D <
> +			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
> +			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
> +		>;
> +		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> +		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up =3D <MXS_PULL_ENABLE>;
> +	};
> +
> +	edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
> +		reg =3D <0>;
> +		fsl,pinmux-ids =3D <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
> +		fsl,drive-strength =3D <MXS_DRIVE_16mA>;
> +		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up =3D <MXS_PULL_DISABLE>;
> +	};
> +
> +	fec_3v3_enable_pin: fec-3v3-enable@0 {
> +		reg =3D <0>;
> +		fsl,pinmux-ids =3D <MX28_PAD_SPDIF__GPIO_3_27>;
> +		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> +		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up =3D <MXS_PULL_DISABLE>;
> +	};
> +
> +	leds_pins: leds@0 {
> +		reg =3D <0>;
> +		fsl,pinmux-ids =3D <
> +			MX28_PAD_SSP0_DATA7__GPIO_2_7
> +			MX28_PAD_PWM0__GPIO_3_16
> +			MX28_PAD_PWM1__GPIO_3_17
> +		>;
> +		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> +		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up =3D <MXS_PULL_DISABLE>;
> +	};
> +
> +	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
> +		reg =3D <0>;
> +		fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> +		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> +		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up =3D <MXS_PULL_DISABLE>;
> +	};
> +
> +	usb1_vbus_enable_pin: usb1-vbus-enable@0 {
> +		reg =3D <0>;
> +		fsl,pinmux-ids =3D <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
> +		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
> +		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> +		fsl,pull-up =3D <MXS_PULL_DISABLE>;
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pwm4_pins_a &pwm7_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&ssp0 {
Just an advice, sometimes it's helpful to clarify the role of a MMC=20
interface with a comment like "microSD" or "eMMC" above the whole node.

Regards
> +	compatible =3D "fsl,imx28-mmc";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
> +	status =3D "okay";
> +	bus-width =3D <4>;
> +	broken-cd;
> +};
> +
> +&usb0 {
> +	status =3D "okay";
> +	vbus-supply =3D <&reg_usb0_vbus>;
> +	dr_mode =3D "host";
> +};
> +
> +&usb1 {
> +	status =3D "okay";
> +	vbus-supply =3D <&reg_usb1_vbus>;
> +	dr_mode =3D "host";
> +};
> +
> +&usbphy0 {
> +	status =3D "okay";
> +};
> +
> +&usbphy1 {
> +	status =3D "okay";
> +};

