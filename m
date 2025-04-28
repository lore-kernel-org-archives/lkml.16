Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16644374EA;
	Mon, 28 Apr 2025 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745822819; cv=none; b=VniwzQyrS0fdFbx/laQUYGhCtMHIu+F0pdPPVyK41bNsGMU63XYs752RbWxwqpmu4Nazzy3bEwlXtN9Zch4lZ9dMEGaLWWioOA3aX4VfpzKCFQrKe7uQdAXa1NOExgdsi3/0C4IJVwh1aJDYhpzHpIfRE+yDGPYu9scWoDPVJmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745822819; c=relaxed/simple;
	bh=RSrxkyaX9/8vKxjAvg5Op68zkrUI3xcDkjLdcziaXDs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0UnqwpFOn2QTgLdbk1KtojeTBbxCTqXCmZ1riD3d/y43zeGmJqezP80lKDEJMpRzbUavp8kfGS5AfLQ2adSvJIRjsLn64naZH6kEjvhaCU2O55Wyf4vp0ovDVd/I2dQlwgX/ZBFSmJhr+KiOGbBRmaOsXYVsjtShidALGBuPQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=iTdhBYLZ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RgcF2MEx reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="iTdhBYLZ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RgcF2MEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745822814; x=1777358814;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=DYnfPVaHALkZ4zVEL1fPaXQONejkm4gzI7Jo6W1CZ78=;
  b=iTdhBYLZEV860hC50dPm3jVcKINbnTVGt6sjDHKSGevRuVPHB+3Q9hYj
   L0oaIXKbgh1kMf94zH6kp0bZzFMR56MMV94/CAqELjak5z5VM1lUB8a74
   RnOy2tU92zNaooYVQ2G/VV5nl/YxTvaZ/7pms3fyEj+ealJ7I+2kZ71d6
   9BTkpZq0FzQ+3X32NpJAvcDAhjBCWjK8UjUE1lmcTpc4KkbtalVla8BCH
   yBQyuhGHfii2t2o4AdAN/zCWsxWew6lypdEngg+inFxR2I0g0ZJpWFZeF
   8CzE9nNG8KJnJJ39QUr9XsWg4wKBq8fptSi66boglltQ1umYCYLHtAZ4o
   g==;
X-CSE-ConnectionGUID: FhqaYLvmQS2fD5a1/I5smw==
X-CSE-MsgGUID: Q0op95EWQOqH1TY1KwSpYw==
X-IronPort-AV: E=Sophos;i="6.15,245,1739833200"; 
   d="scan'208";a="43745391"
Subject: Re: [PATCH 1/6] arm64: dts: imx8qxp: Move Ethernet aliases out of SoC DTSI
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Apr 2025 08:46:44 +0200
X-CheckPoint: {680F2454-6-DC4DC9A0-F4F29281}
X-MAIL-CPID: 4C08CE85893DC81446E935E5F3697A3F_0
X-Control-Analysis: str=0001.0A006371.680F2457.0083,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF062162003;
	Mon, 28 Apr 2025 08:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745822799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYnfPVaHALkZ4zVEL1fPaXQONejkm4gzI7Jo6W1CZ78=;
	b=RgcF2MExF2guXWv9b2n7+g7QPphLq0nculBMqFBJdYIOJ3cfyinKpHSj6V3sLtnupkka1c
	5CnCRCRHAgmbOPLZJ/9W04omT8R+kQ9YxCrl9p6BXSpMaBgRaPMyk4e8JQK5PEV7dNZD5+
	taI9Owy5SISI6MFw3SlO2dglOHHHNycuZUAG/0OLjPmjBxO6Ie8h3e9KIsw9ZxhbTvtv00
	fWhZM5JqZNJ8ZcK/5QPTNXa9quj93iZGBqbVxAebzJC7i+cgo6+7jl21za04cXjbJBLVUv
	99j5DdWlRAeNofcLp+/BLy2xh/oysiepNw24DopJzsJzcXyz7YWdDNEZJlGFkQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 28 Apr 2025 08:46:38 +0200
Message-ID: <2849273.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-1-15b9d5cca611@linaro.org>
References:
 <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <20250425-dts-imx-aliases-ethernet-v1-1-15b9d5cca611@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Freitag, 25. April 2025, 21:48:24 CEST schrieb Krzysztof Kozlowski:
> Ethernet interface, like other exposed interfaces, aliases depend on
> actual board configuration, e.g. its labeling, thus aliases should be
> defined per each board or each SoM.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com> #MBa8Xx

> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts          | 1 +
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts            | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi               | 2 --
>  arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi   | 6 ++++++
>  arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi | 1 +
>  arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi    | 1 +
>  arch/arm64/boot/dts/freescale/mba8xx.dtsi                | 2 ++
>  7 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts b/arch/arm64=
/boot/dts/freescale/imx8qxp-ai_ml.dts
> index 50bf7919c86305403dc9fe2d75ee312dead03b40..2586cabad31ef61594fbe7424=
7d3868639095320 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
> @@ -13,6 +13,7 @@ / {
>  	compatible =3D "einfochips,imx8qxp-ai_ml", "fsl,imx8qxp";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		serial1 =3D &lpuart1;
>  		serial2 =3D &lpuart2;
>  		serial3 =3D &lpuart3;
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/b=
oot/dts/freescale/imx8qxp-mek.dts
> index 4ba8ddd472234704d05db51fb5fb0929e6b15567..b5b14cb20cbef9a67a7661531=
031fafc702dcbcd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -12,6 +12,10 @@ / {
>  	model =3D "Freescale i.MX8QXP MEK";
>  	compatible =3D "fsl,imx8qxp-mek", "fsl,imx8qxp";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	bt_sco_codec: audio-codec-bt {
>  		compatible =3D "linux,bt-sco";
>  		#sound-dai-cells =3D <1>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8qxp.dtsi
> index 05138326f0a572f45122f5ee425089f945fdc656..6d8386bdac00d150d272b62ad=
68c136c0da6ba2d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -20,8 +20,6 @@ / {
>  	#size-cells =3D <2>;
> =20
>  	aliases {
> -		ethernet0 =3D &fec1;
> -		ethernet1 =3D &fec2;
>  		gpio0 =3D &lsio_gpio0;
>  		gpio1 =3D &lsio_gpio1;
>  		gpio2 =3D &lsio_gpio2;
> diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi b/arc=
h/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
> index f7bbb2153ae01a2e97f1e28be0c23f9de4172102..7be0b9ecc8aab1f271c1b658b=
abdb316bae41cc6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
> @@ -3,6 +3,12 @@
>   * Copyright 2018-2021 Toradex
>   */
> =20
> +/ {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +};
> +
>  /* Colibri Analogue Inputs */
>  &adc0 {
>  	status =3D "okay";
> diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi b/a=
rch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
> index f75499765d85dc78808af9ddadc92e133b0c3499..a7159a842d74306f372db7939=
59cdc8e2555eb3e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
> @@ -7,6 +7,7 @@
> =20
>  / {
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &rtc_i2c;
>  		rtc1 =3D &rtc;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi b/arch=
/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
> index 54393a0c5cbfcd55dae080a9f07879748bbd4486..1e588d76a6ddb1bd7f94f444d=
72e2819f267c490 100644
> --- a/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
> @@ -5,6 +5,7 @@
> =20
>  / {
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &rtc_i2c;
>  		rtc1 =3D &rtc;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/=
dts/freescale/mba8xx.dtsi
> index c4b5663949ade617fe9b7be20a3aebf0b322623a..a64ae67ef70cc6a624b06f4ab=
1f3a8ab03ffd1f6 100644
> --- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> @@ -16,6 +16,8 @@ adc {
>  	};
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
> +		ethernet1 =3D &fec2;
>  		rtc0 =3D &pcf85063;
>  		rtc1 =3D &rtc;
>  	};
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


