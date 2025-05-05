Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020101.outbound.protection.outlook.com [52.101.227.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6F9208CA;
	Mon,  5 May 2025 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746426637; cv=fail; b=bSRgQ5G03afV9+PbgaY5O5O9DGuHjzyTX4LNX8Y2jhFx8DySk7COxmWsipj0h7ZBRHxVVV66YWEob0RzsHcaQvCznf9DPBTEUm4lMghzbjgQWJzYAoopLscNfRqdJeouQDiQ6I1+g15JMKLcD+woyEVcx/gXjZPobqKT4xW/0PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746426637; c=relaxed/simple;
	bh=XU3l5fcjrGu5ZeF/pRFuNjOTaw9mSCwDGVq0onDuki8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UIEtBOBkk3X2BZshVpxOIpyhEnzfJVFQzKz0IurGNzuUvozT1TKo8RRVBBLJrl7xu9ywWByJ8jTOFdNo/FABYDlhbVTxphoDhLLulg1S89ip+Xyfeavpqdq4pm2WeRXNL7vO2GVrB4r6EDW81/hhifgE7EymTdk7E/PnWSWr1Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/AmEz5e2zBlNmiDd4TOoiu/8Y72QGymPL0Tgn009Yrao21Uh3i+unrbYh2mFJSl+33f3ua1vFcPftCw+2wc2QSuRUcO2bVqfebiMXJ82GR/M8ZTQ+O2HPNebTRz3bTWOdlXGi+cqawkcjOfgCm8k8XjKPoy5HRJtSXCT8GLkelnE1OizFjInEBBdDCa470A9oBNngGim3cMrioF+M/7CgB9GwL8LsdOuXuHBl/m4p0M26Y/CswicWrxJtk5y01sM292auYgH4KCD6iGH6VbcjrY766+qYt2Ly7/jaYHcfKHQCT5Phuo98WSKuFzX9RnP2MCpIYy63ujkZgnXAn0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU3l5fcjrGu5ZeF/pRFuNjOTaw9mSCwDGVq0onDuki8=;
 b=afRcD5VEFtCa94+KsFfT2KoRZEMkH/ooPDzBsMya3E8LG9lmsaGzyA3JB1aWrdDzHNxnAIX/NNc8o1eufi/WWJCjRtRAFo9CnYRLgCalUN3eKR9+kF4ihWeZ/bKQR/nqrNcnzGyh6zeY2RskyZszbti2C4s8UIrgk+62gZ8dKV/0PpgcKav4P674geKNv1F1ahntpiAvUX/2mBFcLPvjW7EyezOxFOYYJSCiqOW5pAtCF/GWf3DgwTESKib4xtPs6GSKTaGju58rpK3O/xI+mnre6uhMcBeLuamL0umSSQ4uXUPQn+a7GhewSlS9wWBsIqw0vJuZJ1Gj08OoQaOfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0282.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Mon, 5 May
 2025 06:30:31 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8699.024; Mon, 5 May 2025
 06:30:30 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing
 SD card timeout
Thread-Topic: [PATCH v2] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing
 SD card timeout
Thread-Index: AQHbvYLMU4ICpHKdFEyZG7H2oknCuLPDjH37
Date: Mon, 5 May 2025 06:30:30 +0000
Message-ID:
 <PN3P287MB18294987F3FF8061245E62EC8B8E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250505055828.4160-1-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20250505055828.4160-1-himanshu.bhavani@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0282:EE_
x-ms-office365-filtering-correlation-id: 2e22b389-e309-42d0-18d8-08dd8b9e5554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Vr6CtNJqEX0ULZfqocqcrf5zSI7AlYw7HzQK3ffWcyLl8K0oKfw3aAJSyn?=
 =?iso-8859-1?Q?qIXlxbO0Zd78qQ1s2X1LVKm/k3owcY4AEXrmqUTBvvVKdWk5tz5Jt7bi7p?=
 =?iso-8859-1?Q?L8TiZPhuEQ5fHNYgZbFparWtRp8lTv9IQEBTuqUZzHwTvV5gzx8s3NdC4E?=
 =?iso-8859-1?Q?hZik1EthZvW7OoAlS35y9tFcsUMFeP6KkCQlKEn9hxZ2LI+YYIC8KkiuxY?=
 =?iso-8859-1?Q?iTHcSz+Xg4DZJucdw7m8Bu1M3oSNPsk7Gh2upWex07ZtMzJc+Vxs0kxNCS?=
 =?iso-8859-1?Q?Jo3rc35dE00f7pCTixoNMK/0uJBlqG3vBEe84K5FV1ewuA1T4Q/RTy5wnI?=
 =?iso-8859-1?Q?GNKoIVgWNAn6spQDP7pvPaM491diNIn8Wc/7Y0Ejx8dx0hbOJgYOOSBEKE?=
 =?iso-8859-1?Q?4Yk8cH7xFM2FlzlBdv3bvU9AcZEb2bnkaGiTm7qvf0zQCd856bRc0Kb6DL?=
 =?iso-8859-1?Q?7Y09BxqGhqZZizd8Jm1zMnMtoamwTaOdym9dFGoitu1+Np7aMSl2n30TAR?=
 =?iso-8859-1?Q?cRnSDy1hUa0iubaXbZhhxhp4ehFhCWxB7nR8IqyjyNcg0+7VDugkRmqEsC?=
 =?iso-8859-1?Q?0HpLtxPfoYwNiP12lC84h/+lDPETjmBKcR/7t5Ln2ko9+JvYI/FSYosih0?=
 =?iso-8859-1?Q?acex346SevTFYs9wZqC2dA8VT4nB0V/QA9zKyS3MviDW6R/S7znopfni4E?=
 =?iso-8859-1?Q?S1pFHjsnbT7G3tG2ypPrGcHkziGxP9QJjWdoNrj52TXZpS7Kr5BKncCQrx?=
 =?iso-8859-1?Q?6OnjZF1uzASnmuFM5f10HnJQtwQBtZfLi1KGjsbYNwS7NHQlJAyxSYqwKN?=
 =?iso-8859-1?Q?r2DH6QteXuh02YJ6YvJek848X1Gp6KpU3FH605H+N2EM6i51bsP+e3TZCs?=
 =?iso-8859-1?Q?abt0KPpnnU3Ty15x2Qe45PxPhJmVxEUbtgORx6bq/KCqpWgxUlSR6Xpbx+?=
 =?iso-8859-1?Q?4KNaTMPh7Wb2Aqaus9ixF7USarW5P4A8bskeEXU/ouNokbehUlGJH/A+B0?=
 =?iso-8859-1?Q?jD9moa8vZekyOcfBBeJIvvdcpSIBCeB5GCOCO5Hbl0dq+1YX7dsw18i3Qb?=
 =?iso-8859-1?Q?X/KmqlMTL4voyRxs5Ikl7Lz+VaI9uezjKhvjlvSLeLQ0ev/+o0x0F185ew?=
 =?iso-8859-1?Q?A8DHg1lgYNB7mpHnm8yKdw2/RHMJd+5Md7xDOg6mFi8C2CrjQKoa2StBis?=
 =?iso-8859-1?Q?kP6N6dfOsgADJrtbg+PUeD7Y4svOYvmbaBj2NIXZMR13mhKbGhUzzAjN3q?=
 =?iso-8859-1?Q?A4Ngmf0Qv16Mk8pilCVM389vA/obkRDAjkXP7Z+Ii8f5rnGaNE9fveXCc1?=
 =?iso-8859-1?Q?oPTWsD5DbhNhxa3phJw5H3QYGzqZEhioo10BEKsEG/8g3yMFKE4fGynE4w?=
 =?iso-8859-1?Q?H1/7zHAJ6zytdRnKycVH1nHeeH7lTOJ0U1+Wfr89jyat1hhl52C19TzdX4?=
 =?iso-8859-1?Q?51SbDiK0oZND9Sck7bNsCAo5pHHkHUpz2NOx0ZWtQGzrtCyd/dv3z2IGml?=
 =?iso-8859-1?Q?7oswo2hg+Pv8lYNDRowxkbgX+7Y3YZJz/fB8CGSP/kYw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ONAXnKGaFADNDGsurnaYQ4PKd9avswa63egA7tSicNoV3/Ytt68gCjD78h?=
 =?iso-8859-1?Q?FuB1xo8oHOR5NJNq4QjoQBh6vn4lkmts6rGqXkz4M74H9O9jWAOvP+snvc?=
 =?iso-8859-1?Q?ahQGa2O+0fszaZkUeYnuAlY08PLXZNILOeUzPbLuEMOLLfIVtJpYfp6wKM?=
 =?iso-8859-1?Q?9qLRIAWrK7Yv49loe4YGpJptjSsRR7BR1GXIdF+xhub6UpI7TMiyyt1VCl?=
 =?iso-8859-1?Q?sLLuS4P4YL4w7SOL6YKDckLVYC/fXXB3VPkiMXBkl3YKr/tOiQXaj8N9Hv?=
 =?iso-8859-1?Q?LF2T5XelCbCzxZjhtdLgqFSPxbOWBAeLBTcjDFMFXJ7TjxhUAKeuQzpQfm?=
 =?iso-8859-1?Q?JXIStm1I2rPxUfog29IOljKZhAzmyykiztjVrw6Z1OI3ld6T/ylm09HJgS?=
 =?iso-8859-1?Q?OYUkWphIZ6+r91JDAISFCr1oHZF6fLElpN5xJHwgBNMNhffUBaJDq3i2r5?=
 =?iso-8859-1?Q?ub+P+XtQsZb1zIMlgyoCkkKU/rkLX+g7dG1pW55/lZmy2X0tFH4v1JnwhA?=
 =?iso-8859-1?Q?zN7FrUZk9q6cdzjJgBRGlodeLViNndn8exGq2Ht+YbjesBZnUB1CY7A50H?=
 =?iso-8859-1?Q?zgihXJ0okRZdo+u7mk90XXMX9TbToeWu0enI45J3Cqa+ZGgDjyzAlxyFbO?=
 =?iso-8859-1?Q?31vUG8hqXtJCDxsM3Wc4fabbj2Ot5X3ddZFWDszZ9azVAoonLxyCIO7RCH?=
 =?iso-8859-1?Q?v/eumaRs0196MeP1ka/JFPkJARP5ETwuyN8AABSXRVYvanLI4Hj805lCxH?=
 =?iso-8859-1?Q?NxJ6QVx1vVZCzxfjHpxAd4PVth6/GBnyuS02LEvITPTL3nqwWxgXnxauOu?=
 =?iso-8859-1?Q?J80bF/K5pPhBHWIT67kXzLZTIQRp/svY/kYVxptCxw0f1KEaXQtwJV/ICm?=
 =?iso-8859-1?Q?OS7RM4DbF6uyNBewvlp5/dnRiWdRWWv0t5J+k6Swtui+0dPcJ4l80bIGDA?=
 =?iso-8859-1?Q?GHSa925+0aqqNkYrgJlpw2n9baYggQtF4TOnpoMDiw4gzzcxAMV6eOrl7g?=
 =?iso-8859-1?Q?6EL4G7osCS3rOfdvNvbtbg9TCAn60oogUqFGX6LGYg8VgTuA9nCS7NznE1?=
 =?iso-8859-1?Q?7w7vlAcM9S6nSAiY1dAO5bZHkmbyV6xoMTkpMVSYj3WrIeP9aJpM+ilp8l?=
 =?iso-8859-1?Q?IW2F/Nm+9jNJJDjDnSqbR0FQdP9UV+cegWjfOZUXHZEuU1ysPY97hLBiAS?=
 =?iso-8859-1?Q?VIfNdt9Kuimf+YS1Ll47+jrvnZz8mgCNu5famfl5PFuAGDXr/XUShv2JgG?=
 =?iso-8859-1?Q?wgQixkmusUypR8wJJFkzCR8IgMILmv5koAXKggaaoojS5NIpKeiO23gSdz?=
 =?iso-8859-1?Q?o37mzZ4ofgRIkQ+xSW3YUQdNI/Q67gL5lKV0lAd9LlW0NrJ92lBoxSK5hM?=
 =?iso-8859-1?Q?DjUockFwwTRnrKL/IgNionOrkhfMwQIRblNdWc/aENYsFu6oe925+pPwG8?=
 =?iso-8859-1?Q?BZ2zUsbLaiF0jpDq/gj7Anh9bUR0eTiFU/Vx8F3TAu2ku4jyL8pMzxB2QV?=
 =?iso-8859-1?Q?eio6bG7I4LvmumCoTqx5E7/NPSpdLDEznDxwcnuhdSRuY1ptZ6CT47yU8X?=
 =?iso-8859-1?Q?Nh44YwmJzYbjorzYc/kK5rBTWnwAdIR2SvcFxwRgVsop1/dww3XzkvLXoD?=
 =?iso-8859-1?Q?tZ0cnhREz1ciWjAsMoLKpVBpJmj/6v8rAEDsnlndjrr0HRY/8k3MCdnA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e22b389-e309-42d0-18d8-08dd8b9e5554
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 06:30:30.8930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkO9EqphVRQW5SEmWgHBXqJz7Jn0IzGQvV9ukzSdjRAJDIcOIRK28Y3KUq3TPKY+X/lXP7ixx967gVs8QmYjuKuy5QglID/QUy5WsO6+SfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0282

Hi Himanshu,=0A=
=0A=
> Fix SD card timeout issue caused by LDO5 regulator getting disabled=0A=
> after boot.=0A=
>=0A=
> The kernel log shows LDO5 being disabled, which leads to a timeout=0A=
> on USDHC2:=0A=
> [ =A0 33.760561] LDO5: disabling=0A=
> [ =A0 81.119861] mmc1: Timeout waiting for hardware interrupt.=0A=
>=0A=
> To prevent this, set regulator-boot-on and regulator-always-on for=0A=
> LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V=0A=
> signaling for USDHC2 using a GPIO-controlled regulator.=0A=
>=0A=
> Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite=
 =0A=
> Symphony board and VAR-SOM-MX8MP SoM")=0A=
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
=0A=
Acked-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang =0A=
=0A=
> ---=0A=
> =A0arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-=0A=
> =A01 file changed, 11 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mp-var-som.dtsi=0A=
> index b2ac2583a592..b59da91fdd04 100644=0A=
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi=0A=
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi=0A=
> @@ -35,7 +35,6 @@ memory@40000000 {=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0x1 0x00000000 0 0xc00000=
00>;=0A=
> =A0 =A0 =A0 =A0 =A0};=0A=
> =A0=0A=
> -=0A=
> =A0 =A0 =A0 =A0 =A0reg_usdhc2_vmmc: regulator-usdhc2-vmmc {=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "regulator-fixed";=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0regulator-name =3D "VSD_3V3";=0A=
> @@ -46,6 +45,16 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0startup-delay-us =3D <100>;=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0off-on-delay-us =3D <12000>;=0A=
> =A0 =A0 =A0 =A0 =A0};=0A=
> +=0A=
> + =A0 =A0 =A0 reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "regulator-gpio";=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator-name =3D "VSD_VSEL";=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator-min-microvolt =3D <1800000>;=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator-max-microvolt =3D <3300000>;=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&gpio2 12 GPIO_ACTIVE_HIGH>;=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 states =3D <3300000 0x0 1800000 0x1>;=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 vin-supply =3D <&ldo5>;=0A=
> + =A0 =A0 =A0 };=0A=
> =A0};=0A=
> =A0=0A=
> =A0&A53_0 {=0A=
> @@ -205,6 +214,7 @@ &usdhc2 {=0A=
> =A0 =A0 =A0 =A0 =A0pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdh=
c2_gpio>;=0A=
> =A0 =A0 =A0 =A0 =A0cd-gpios =3D <&gpio1 14 GPIO_ACTIVE_LOW>;=0A=
> =A0 =A0 =A0 =A0 =A0vmmc-supply =3D <&reg_usdhc2_vmmc>;=0A=
> + =A0 =A0 =A0 vqmmc-supply =3D <&reg_usdhc2_vqmmc>;=0A=
> =A0 =A0 =A0 =A0 =A0bus-width =3D <4>;=0A=
> =A0 =A0 =A0 =A0 =A0status =3D "okay";=0A=
> =A0};=0A=
> --=0A=
> 2.34.1=
