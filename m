Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F01155393;
	Mon, 28 Apr 2025 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745822849; cv=none; b=B5uJ9ZeqzyIUeQ1Pg8Wp2d8tFpwcTXjLouRu3+VuGYJWfNn0GKPyHnhEGDE/VLPs0gsn100pG5FS/MhQQrL9xvl1ARHRgMmP3YKlrwSZtAqxo4DGFrc6KkR2ANK3tKtcto8bbWUAzIC+oh213Jtg2BUlMJX8ky7586Bg0YaKDtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745822849; c=relaxed/simple;
	bh=0vr5UdvwTOTZ2qO3du3ovx0jK05QZ/mcpt4XGuFmKho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kY8gD0b/StViaAGTklVc2WxoOzdz7kVJhCVZQW5Yj6b76/l/bQDI+tJFLkU/rU39lW/pSC1oK+WynBbQf8/nbQ70qRXVDPAa40cnTdCLMljrzp8/Blv5/yVgEnmMyYtHLSNXpfgJY6jolc6Uqw98uEzC1BCWiLBhk6veOfDWZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=iBbqvPC2; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JC046UbU reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="iBbqvPC2";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JC046UbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745822846; x=1777358846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZBqDGBVBCVpYBwr8tietgtO1LqWCCwzvJbm38qxhowI=;
  b=iBbqvPC2AxrsqkDfi3saa7vNxHkMlrwqa2lBwuIBhnrr+Dt/vjBNSM6e
   dGPXZSFtvYvkChViruCLnyZxKws0lt+Ch+TCzXNWizB+sdTI7dqgVz5wf
   SSsz4k5/PBMXroHGpAP1nV26saW34ugkoKA24z4OOKmWMo6gZHVnyT6q3
   o58qW3XxsqO+g7yVMKyP7zPXDbrR89dluMZOcA1zJ7W8+1YIFBWwdL+2H
   G8vcXig/PmgKalmsSlBUwPq9ayo/cfoTWpho3NE2ed6v0Gx3TEPi2Ka/C
   uE6Z8+EoDDfu2GUGLXkWfpLuBgO8x/ES86FPjV38N0j/DbYgdNseeFHFF
   g==;
X-CSE-ConnectionGUID: WZV5xmnNQGadjtch4F1GWQ==
X-CSE-MsgGUID: EWyDwkvrRUWwOAHjK73GNQ==
X-IronPort-AV: E=Sophos;i="6.15,245,1739833200"; 
   d="scan'208";a="43745407"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Apr 2025 08:47:22 +0200
X-CheckPoint: {680F247A-5C-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 98C439B8310E7532A3EDBD785AE80060_4
X-Control-Analysis: str=0001.0A006368.680F248A.0051,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DBB0165489;
	Mon, 28 Apr 2025 08:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745822838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBqDGBVBCVpYBwr8tietgtO1LqWCCwzvJbm38qxhowI=;
	b=JC046UbUKuj61k1XOnaBegDZuEbYJ+Kj1uws3Kf7YV6sh6Mss5xS+GqTLxDTI4paUPBQyA
	GZo8GQQ3XhkA0u7UsNKgI2NIc/sHY5zmUOUT60m7llOx2KobpfEdDeAWUA2ryZDBRSez0V
	N6yRm5SYl2U1uhR+Ka0T4ra7ukAbDdiSc+iV9PAzk+Rh5a7F+lZxGm+QKesdm5vRoEgk7o
	OCyRMviM/RbjxpsIEjLJtMNF4nNIrA9UP4XG9UzFsmbCR1Ie1KrJiCSOVrvSBkpJ+WVZNa
	fRfLm8WnVpM5EpA6I0ih9qB2OF2LagziCukImrMlL7dGwYp9D4i0ptUAnXhJgA==
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
Subject:
 Re: [PATCH 3/6] arm64: dts: imx8mm: Move Ethernet aliases out of SoC DTSI
Date: Mon, 28 Apr 2025 08:47:17 +0200
Message-ID: <5951912.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-3-15b9d5cca611@linaro.org>
References:
 <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <20250425-dts-imx-aliases-ethernet-v1-3-15b9d5cca611@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Freitag, 25. April 2025, 21:48:26 CEST schrieb Krzysztof Kozlowski:
> Ethernet interface, like other exposed interfaces, aliases depend on
> actual board configuration, e.g. its labeling, thus aliases should be
> defined per each board or each SoM.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com> #MBa8Mx

> ---
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi          | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts   | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi               | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts      | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                 | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts  | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts    | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts     | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts           | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts             | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts          | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-phg.dts                  | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi         | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi             | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi             | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi       | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts        | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts        | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi       | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi          | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi          | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi       | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi        | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi                     | 1 -
>  arch/arm64/boot/dts/freescale/mba8mx.dtsi                     | 4 ++++
>  26 files changed, 70 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 62ed64663f49521a9c14927886018058e489c914..ffe1d18c5b626253323e45aa1=
ba2c27e3742ef1e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -7,6 +7,7 @@
> =20
>  / {
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &rtc;
>  		rtc1 =3D &snvs_rtc;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts =
b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> index 472c584fb3bd294dce18341ce1afc277be1c3825..5dd685ffc9825329f739cda32=
274cb223e88bf15 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> @@ -14,6 +14,7 @@ / {
>  	compatible =3D "dmo,imx8mm-data-modul-edm-sbc", "fsl,imx8mm";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &rtc;
>  		rtc1 =3D &snvs_rtc;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mm-emcon.dtsi
> index af7dc8d1f5f10d5e2eac677af60c7926e95fdac6..ffee784539ffd0e8cdcdfeb97=
bac817e4c128fba 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
> @@ -9,6 +9,10 @@
>  #include "imx8mm.dtsi"
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &uart1;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts b/a=
rch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
> index 90e638b8e92a95214d8c3c719dd2a6db2630ebac..a98316b7dc443cf9bbf7c45ec=
8d1d8b3847ddd70 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
> @@ -15,6 +15,10 @@ / {
>  	compatible =3D "ees,imx8mm-emtop-baseboard", "ees,imx8mm-emtop-som",
>  		"fsl,imx8mm";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	connector {
>  		compatible =3D "usb-c-connector";
>  		label =3D "USB-C";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mm-evk.dtsi
> index 5f8336217bb88b1d0501e6208c936c51ce23b312..48a76f656fd4302218a430beb=
c08afb0bc3d09b7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -10,6 +10,10 @@
>  #include "imx8mm.dtsi"
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &uart2;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts=
 b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts
> index 502745402847ea16ea0e53415a9063c6ba9dbffa..5c340bb01a7afc342650f7ea6=
52e281cf0906a2e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts
> @@ -14,6 +14,10 @@ / {
>  	compatible =3D "engicam,icore-mx8mm-ctouch2", "engicam,icore-mx8mm",
>  		     "fsl,imx8mm";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &uart2;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt=
s b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
> index ddac8bc7ae65159314c2f8a9d41eafb51ae4f863..9f70bafcaa4bedcb71d8c4671=
46c92535b23c149 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
> @@ -14,6 +14,10 @@ / {
>  	compatible =3D "engicam,icore-mx8mm-edimm2.2", "engicam,icore-mx8mm",
>  		     "fsl,imx8mm";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &uart2;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts b=
/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts
> index 055faae79930cbdc347f849cfae7ef3b24746b12..e7af6ea80ebc886df82281ae3=
912b17dbbcb5dbc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts
> @@ -12,6 +12,10 @@ / {
>  	model =3D "InnoComm WB15-EVK";
>  	compatible =3D "innocomm,wb15-evk", "fsl,imx8mm";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &uart2;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts b/=
arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
> index 33f8d7d1970e0b165c159a788fa0a96cbefb0d82..23fc653a3a45474b2fa1df620=
fe0f568a8a6fca1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
> @@ -12,6 +12,7 @@ / {
>  	compatible =3D "kontron,imx8mm-bl-osm-s", "kontron,imx8mm-osm-s", "fsl,=
imx8mm";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		ethernet1 =3D &usbnet;
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/a=
rm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> index d16490d876874b7bfc9066efdd724bbb52f518b7..5d6a09322f2750b8b1c6dc93b=
995dac7cabe35a2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> @@ -12,6 +12,7 @@ / {
>  	compatible =3D "kontron,imx8mm-bl", "kontron,imx8mm-sl", "fsl,imx8mm";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		ethernet1 =3D &usbnet;
>  		rtc0 =3D &rx8900;
>  		rtc1 =3D &snvs_rtc;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts b/arch/arm=
64/boot/dts/freescale/imx8mm-mx8menlo.dts
> index 0b123a84018b2978291ccff845332d55022c7c75..ba5f85454d1c78c635363f13f=
508f363a4aa53aa 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
> @@ -14,6 +14,10 @@ / {
>  		     "toradex,verdin-imx8mm",
>  		     "fsl,imx8mm";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	/delete-node/ gpio-keys;
> =20
>  	leds {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts b/arch/=
arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
> index 12fb79d20b29e21c1984a7077c61803875523c7e..21649620aac4cd32eeae08758=
cd80eb8be1db2f8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
> @@ -10,6 +10,10 @@ / {
>  	model =3D "Boundary Devices i.MX8MMini Nitrogen8MM Rev2";
>  	compatible =3D "boundary,imx8mm-nitrogen8mm", "fsl,imx8mm";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	reg_vref_1v8: regulator-vref-1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vref-1v8";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mm-phg.dts
> index a134b183364961afdaca057655dff6a7e248e51f..c3a7435201d9c0f8c5469c133=
9e3a39ac81e4ffe 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
> @@ -12,6 +12,7 @@ / {
>  	compatible =3D "cloos,imx8mm-phg", "tq,imx8mm-tqma8mqml", "fsl,imx8mm";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		mmc0 =3D &usdhc3;
>  		mmc1 =3D &usdhc2;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch=
/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
> index 672baba4c8d0527f2de002d49aa96d30a6ae2373..db8a8022e86d0671296b202b1=
25446e7856581bc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
> @@ -12,6 +12,7 @@ / {
>  	compatible =3D "phytec,imx8mm-phycore-som", "fsl,imx8mm";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &rv3028;
>  		rtc1 =3D &snvs_rtc;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mm-ucm-som.dtsi
> index d3b21203c5f49e9bb697c602d49e3f8ac9c9f603..18f4b30d7e41e8e7ecabc4c0b=
9fede0ec6376d7a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi
> @@ -9,6 +9,7 @@
> =20
>  / {
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &rtc_i2c;
>  		rtc1 =3D &snvs_rtc;
>  		mmc0 =3D &usdhc3;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mm-var-som.dtsi
> index cdfacbc35db57b654f7b965a513cf04cb4a697b9..9d207dc75cf9322c68e5c7032=
fe5cab58f0f2ad9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
> @@ -9,6 +9,10 @@
>  / {
>  	model =3D "Variscite VAR-SOM-MX8MM module";
> =20
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D &uart4;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
> index 5a3b1142ddf4b7d31db2e6e2723e86cc089a96db..1d03e9a32da2d5ec40a751d10=
cfefae4eefd71e7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
> @@ -10,6 +10,7 @@
> =20
>  / {
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &gsc_rtc;
>  		rtc1 =3D &snvs_rtc;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> index 46d1ee0a4ee86b025d94453460770e08b5dd8d32..1f7cc6310d61c98523f0fda92=
dc1cd060a26c2a2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> @@ -18,6 +18,7 @@ / {
>  	compatible =3D "gw,imx8mm-gw7902", "fsl,imx8mm";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		ethernet1 =3D &eth1;
>  		rtc0 =3D &gsc_rtc;
>  		rtc1 =3D &snvs_rtc;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> index 86a610de84fe2348554354f838e1d824a24a4322..b1f83f84e7e11446fcfefdc1c=
7f20a5fdf3e3338 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> @@ -17,6 +17,7 @@ / {
>  	compatible =3D "gateworks,imx8mm-gw7904", "fsl,imx8mm";
> =20
>  	aliases {
> +		ethernet0 =3D &fec1;
>  		rtc0 =3D &gsc_rtc;
>  		rtc1 =3D &snvs_rtc;
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
> index 3d0b14968131049b15fea3f52d10f60c006f341b..440678d8e933bf60325fea1ca=
340441451e8e93e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
> @@ -4,6 +4,10 @@
>   */
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	sound_card: sound-card {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,bitclock-master =3D <&dailink_master>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
> index 1d8d146d9eebad32de81c0f7860be52a4b6d7ef2..570091dded8446cf14fcc1869=
105f513abef6651 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
> @@ -4,6 +4,10 @@
>   */
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	sound_card: sound-card {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,bitclock-master =3D <&dailink_master>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
> index 29075ff5eda63b50bc008ad501e96333c6d07325..9c27dab2668defe2bcab46686=
d2e83433e846665 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
> @@ -12,6 +12,10 @@
>  #include <dt-bindings/leds/common.h>
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	/* AIN1 Voltage w/o AIN1_MODE gpio control */
>  	ain1_voltage_unmanaged: voltage-divider-ain1 {
>  		compatible =3D "voltage-divider";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
> index 4a0799d63446cdaa0a404091386ce8a4164d5aca..285eb0ba87e53f9adf9e102aa=
c9329146b047a27 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
> @@ -11,6 +11,10 @@
>  #include <dt-bindings/leds/common.h>
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
>  		pinctrl-names =3D "default";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi b/arc=
h/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
> index 763f069e8405442f2af7491ff810b8b2375248f2..7df5f44c5f5f438ac28376d1d=
fb3caa04a077f0d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
> @@ -6,6 +6,10 @@
>  #include <dt-bindings/leds/common.h>
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mm.dtsi
> index cfebaa01217eb02b9514c51ae7dabc6cd7b7245a..67c57c071c8ab8d55ef1c93ae=
155ed08c7c6af30 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -19,7 +19,6 @@ / {
>  	#size-cells =3D <2>;
> =20
>  	aliases {
> -		ethernet0 =3D &fec1;
>  		gpio0 =3D &gpio1;
>  		gpio1 =3D &gpio2;
>  		gpio2 =3D &gpio3;
> diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/=
dts/freescale/mba8mx.dtsi
> index 7ee1228a50f4f9bfa46edc62d956b47b906326f5..1b24dfc36c8340b8f5852c2dc=
37278c8386294d8 100644
> --- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> @@ -8,6 +8,10 @@
>  /* TQ-Systems GmbH MBa8Mx baseboard */
> =20
>  / {
> +	aliases {
> +		ethernet0 =3D &fec1;
> +	};
> +
>  	backlight_lvds: backlight {
>  		compatible =3D "pwm-backlight";
>  		pwms =3D <&pwm3 0 5000000 0>;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


