Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850317736;
	Wed, 14 May 2025 02:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747188275; cv=fail; b=cDS1ZdAtVSqcl5gULmENcMtLJxToxO1rejUYcTg6zjag26EB/Qor0K4WTkIzqyZPPAiYPMc8qriD8qUFiO7U+4t22VpY2q9D5vtiyJKHeNVsAfQD+vbI1oEE4EHQtnJi+Hn7lyvmUE4sai8Ns1uocLa9XP2Kf6l5OUMjvBV7vC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747188275; c=relaxed/simple;
	bh=SpjdlDDNVDWqAOFdTaVZmcQjWFsl2mxiwDxzw8NKQLg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SX50eBQa/lDoEOQp7E4vDmGMVyD4TNHte38dIt+m6NPyPV/7pC2eKP4EA6O8QkYQVV2+USxIFuEP8P0ZN76OaYLg3IaKrQ1XesM2zrX939aO0Qet9EmUj6jCIxbhR4PDYQiR6OwO1xtTzFFCUtx2kjhITkGomV9Cekz6AhIHwd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Br6Q/J/U; arc=fail smtp.client-ip=40.107.21.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Br6Q/J/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l00rpWkdU9klu5tOT/6AgkAu1q8jwXnYU3jakKAj4E4EbD4NY4arAuV1mQ8OcsDO5CJmp+YJ5e/VTfb1QfD9tVJz7KGZ9xo50+yxQxAAsYMiQlyfT3RyZl1RqyCivcKlb5AONuHAasgXar4+VxLkF7vNBEchHSxtfPK4lwj0bksmxK3DnskcbYtLYzYagPXI8w4jNXUGwzyG3LDdmLebJidJlYskMeJayABTKIOivyStQzEBUMOIze5pJxYk6XHUoXJnG8PQA8xOt8ptx+ftKzHEo1KK8XcoWOtSbRpp5eCa/ocPnYqZlyG+B72V33OcAqnzd0PIcETR9r/36GU7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDSfDllUZjBzghwvBeGyRcXT7GI1SrTu2v2BmM8Mmxo=;
 b=ZOTpvY0I7FCJ52m7ei6p0A0Nh9FeakS5Y11+swjeRK2pU+d1T9bowmOEz3nuTJocn4+q9MhiUjAZDZ68kxjnAShKmOyb3hvN9IUnphGgaQ9LA8+1kqEr1/w4IygRO/7cWP7KsTFAX+XoZqzlL8R5iCZNDtUDAmRtyju04+03P+EaNXO1gMF/rk9O2BrLWjE0ZtqBMd0eImuPTv0dUOQXAb26TIp62pPquVqYtmh4N+GFfTJaxnR4jEPd4x/2/DT7LqiXLrYfQzCJTe2PNabPyWqMiYMR/H2RHb+E1pDVn5gVv4zGbGxRRWb48MyGi1e3/T/deCQR6M0nsoAk/Le+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDSfDllUZjBzghwvBeGyRcXT7GI1SrTu2v2BmM8Mmxo=;
 b=Br6Q/J/UHSNijZUtn7pvxvh51+BJNTwYqE9wvV0bPPu7hrHev/eazY/ektjDX9ianevExTTmZEH3h/GZD6b0OpBTOOZhF4Z5E0OlnPtxPcZpuf/oG2fYun4RDpvvQoHOcZbCShQDkMPszXvJm/DwoZuHdp5wgDmtxcN436EAsHuV2NuLC/T7kIei2fjEWad6sO5jajZtgMvjKapQe3mjYBF27CYDLnyjF9H2SY8wrIFiRY7H5RBYIs7S5XReH917ylpeyQW/2u4xjQkGSBLaIbp3T5Ok9ZXk3yhFBqIdIHuIR6cwQpt2etRhYmuD8kmbHZyR2tCzZWM39pPBrfv1FA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AS5PR04MB9754.eurprd04.prod.outlook.com
 (2603:10a6:20b:654::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 02:04:30 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:04:30 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Carlos Song <carlos.song@nxp.com>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, Frank Li <frank.li@nxp.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "conor.culhane@silvaco.com"
	<conor.culhane@silvaco.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx95
Thread-Topic: [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx95
Thread-Index: AQHbt011JflTfXfu/0edJCBSHAtQ3LPRem5Q
Date: Wed, 14 May 2025 02:04:29 +0000
Message-ID:
 <VI2PR04MB11147377F1A706A4676D29CFFE891A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
 <20250427083230.3325700-4-carlos.song@nxp.com>
In-Reply-To: <20250427083230.3325700-4-carlos.song@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AS5PR04MB9754:EE_
x-ms-office365-filtering-correlation-id: c0b5f01f-5655-4a53-7039-08dd928ba98c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|7053199007|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bwc+tRV1vu8hN56V+QYdYjeg3zySREiHMEDNoCwvpVJ2+q+LeOx4ZtGOH9jF?=
 =?us-ascii?Q?y8kdW0R82rgjr1GQtCMcReArUoCUyZ/TB3PNujxC34K8tmKm3KrzCHbE1+xf?=
 =?us-ascii?Q?h9lngPBLF/YdZ8671FNfGCOG5jQgYlAsBUmbqo0jVR5rSt7XZhX5CIkwr91Z?=
 =?us-ascii?Q?Uo62LIr6mY+qsAxdRm+/t4bC9oSgEgECED7b783vuXc4lEIWCmPqyxiHwhey?=
 =?us-ascii?Q?Kext0zw6KL+sce67ZHq5xP/C3OKPsfLc/Q5kGta1LptEqVFSwMtUJqqyunCh?=
 =?us-ascii?Q?BJCcMi9nzf7rFIV3l41wtHgXuS97P1ZXxrPt/JKirOiz5ef/11Q2T9G43W8W?=
 =?us-ascii?Q?etOSPdhIJ0xUKVl1s92CPUjg23Ed8qGCPiAhOhdJYJkFNeX8tOlHr/cFzFjl?=
 =?us-ascii?Q?9RleGQfMUGZ9izOwlsfwcBdAbtPZf2hIgt1FI7WwUNptgJ4a6UAtl485GYnn?=
 =?us-ascii?Q?SO49efjjLlIk5P57ZhQCM5xb9/0Pn6fIezqYzyf/CMyb158SRAVSFe3XdPCi?=
 =?us-ascii?Q?wv0QSokUZKhH0xAyE1vTna67ZVP526L2p4yoT/sCxtcaDnT7NrAicRugUPJk?=
 =?us-ascii?Q?VzEy0hqY062ie4n25Cpn2qDNzJI8woA4wmEz/uVM9Rc7NoZVnSlk+JpzZUpK?=
 =?us-ascii?Q?LtdiRnRH7yb0I9QLVmXkUOUelq+wJKpdOMcEe4TH8bDEQUmB6UMaGEkQV3xT?=
 =?us-ascii?Q?dyGeXcidlVlpbn4Ybu3vT1ggG0Kk782EZ6VY5tsMg2zjtRsU2pU5TQfCDxH5?=
 =?us-ascii?Q?DrDO2Lr0cihFKDSiLnLQXjzEvaMSVujipiINRPDJgxnNfj0N6r7eZT29vyz/?=
 =?us-ascii?Q?w8a21ZF7MiyTDvbGMqyNOgqHZNJijAGgTU7KAJefwBQcigABF//Wlu4zcRFE?=
 =?us-ascii?Q?I3MiwbAY/b7LG2axNP1dWXG0Im74fNVbHGsJAiQZmN7pMwhzqMUS/KZRJFEu?=
 =?us-ascii?Q?uwnQN5zHjp1Hw/0Y0QCnFagvsPONRV3pyowWhbRSLrQRUPSRCI/MT0GQRtGK?=
 =?us-ascii?Q?a+9VPp0OlUE70jVf0g6Sr7oTOg03cv1qIMEtYFik88cKyPDa+ywwgV92BIPP?=
 =?us-ascii?Q?jEjwgWH9Sgu3y7GMyxbeQtqmSXEjoWDhTtCCxhPy6uHb5k781x6afmfBBHCt?=
 =?us-ascii?Q?w2swV3A0vP6nrOfGELfA7WF07MzFVnZgNlLU8Sr7WGN2vXDbP13sKybSmkXc?=
 =?us-ascii?Q?e8w5E6tng0RoOMvVmzro2CherKQIun/jdMyna132jm6zCzZJhFcmg+PUZ9jx?=
 =?us-ascii?Q?0Undb9szuxLYFThu41edNBxZvtkXB5UEajBQ2UFbupsKoYe5fliSu0gNt0et?=
 =?us-ascii?Q?ftp3612P+ph2mC/mb6s/hi8J2/UIa4safy+Wjq5/to8MnhWVtGufkDG39V3a?=
 =?us-ascii?Q?gYscIbxyJ/uOsqpvjP/4i0H4KneXyOEb+hRpObby90JSjjk1Ukkfnu/9OCQJ?=
 =?us-ascii?Q?1tpLv12znOOcJOfAn4IulMQgljXnRTF/F5E3I1wB6xSaLIvC8Vw42MU/hrWX?=
 =?us-ascii?Q?mNfPGXtCxHqaSC4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(7053199007)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZGWx/BIwzOJLn5TX8TEIP0rdQS2oI9bUlLB2hSdgWQ/WvUF8LDKMKsZAePLz?=
 =?us-ascii?Q?mGIGGQvWKmmGMq28tjU8ud1yDwRW1Oh8JjB3EL8x8ytrhAvjp/DGUmNj9DEZ?=
 =?us-ascii?Q?GdMvHfRkxTiNIstbuzkmtZiRH8V5ILbDlMrx0KcDaG6XjSM3zzj6e1/zkpRg?=
 =?us-ascii?Q?iio+lc9/Fsm8IJUgrODYPPop3nlzUqmYtRLN7mrTnANT/Df5gMWuSB+08Sh8?=
 =?us-ascii?Q?MmDyzgVfvjiBHzmDqNPp5KpgZX50KjXDmDTTlAuh9XCksbwZFSDBTQfEfdWP?=
 =?us-ascii?Q?lSQQPHUMr4APo1QopWCmPS/5Zo+E+Oeon16EvjXVxwDeuK+lz9ORohzjSaOd?=
 =?us-ascii?Q?NrKWO22WtJFXn9P4AOE5eTkBjKXApPlGwAfQ1Pr7IlD6rkvcZIVgISbe19aM?=
 =?us-ascii?Q?YGqhvi2E3fsCuZQxi4x515OblUjuuMLHnCxCq//X/0DPZASz5w0/M6eyOfzk?=
 =?us-ascii?Q?LTvZVeeoRnYj/F2EmG5gAwn1Y+mND31fbPL7F9D5nzKcwgYIh3kokLR5MrGJ?=
 =?us-ascii?Q?TipLSbgUCm/Emb2bmKBhs10HtFeMSoOj3L4UvUsX9OyBIH0vEwsqZdWWwJp4?=
 =?us-ascii?Q?e4NQoSfHnrj1YrhyqhOBpUpem8wvA2IXVp9/8hT93Kgqqpr9hXwaAL3lQG2R?=
 =?us-ascii?Q?NBXuaXJ90SrnPMW9NVec+bHLJnkruyDIm//ifsjTXbBJl3HA8H1/YXiS7Ayf?=
 =?us-ascii?Q?RikoV0mUJTArBvsSv7fiFFWE3+1wgPM1rI78rLptXJ4J/3gxEPr07QPwZThm?=
 =?us-ascii?Q?G8MtIFxid6FZaP1r0iDBs6yAxRbZ1mwez6xKaO4ugQ6R7WqVky4BfT5G9MTP?=
 =?us-ascii?Q?2/HsHEtb0WUlH0k6WLG+BQoOd+0tGN+ezUsuWAn9YNbFjovoz/HErxyogz3K?=
 =?us-ascii?Q?YG7P8KZYaAV5lLDk2cs2PSJAXeRWYoCw0ykBJi4/GzGt4bCDtqh205mOZjaw?=
 =?us-ascii?Q?2qCR7MbeeK3EJW0xGNOI1WBf6N4AP24pox70/jFRXtfWEAu3UbdY1vm2RSrT?=
 =?us-ascii?Q?/e21CFjCp4tk0a8H5oY721ythLod8WTdhEcpoQwCKwSl1JXyi0rZWR+x7fD0?=
 =?us-ascii?Q?OINZi9BArwju5o+ze/v+pZ5RLdXQ4sJFVCfH0mFvc0bz2zoT30OMziiNRK0O?=
 =?us-ascii?Q?KV1nI9l1Lahqn1p7qJQ7BMgEmvEU9fmKW5YHNpSBp8JfLHhpHsw6WA/7/Ton?=
 =?us-ascii?Q?VZYChNqtQpbjeO/Ka384jDKpaYFdyu4tZl7TV9M0MKdy+qUnJfL6pEDE9O05?=
 =?us-ascii?Q?yKfGei4wyJAYVSTyT6H+Oa1DvlmeiMLF1Lp2v9sgmNqbzSi4HgY5OjwW52fh?=
 =?us-ascii?Q?GZ2JfzvytqHKVxyI3rCi/rvOwAGOcYT5JgU/hv/1DJVZQuB8kjY4Cb5PHBqv?=
 =?us-ascii?Q?cyrWXcd4fjVkiVsPhrOx9o5QNfAtdhXNEDimJJaAmbmddH0+tMgWG7Pgearj?=
 =?us-ascii?Q?BShQUJoPhr4bao4l6T/6U6CCoecll52LoMdX57XE3fHUV0W1piUH+dWHs2dN?=
 =?us-ascii?Q?50s+Uy3hARk2Br5pqSHqawhNZ1pjW9MLTnSu+9sFD5W+M1v8HHmtE8FgFjx8?=
 =?us-ascii?Q?B6B5sARRVen5utoWXzBnHPKY6HlhSPN+fp0oXswW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b5f01f-5655-4a53-7039-08dd928ba98c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 02:04:29.8678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldTaNFSnZfD9s45pXtfoZyL+XSAlmrcwK6rpQD4a8tllyMDBieuIaqxlk+fbDW9KGl54egGvB3bpPOTZRAVBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9754

Ping to avoid missing..

> -----Original Message-----
> From: carlos.song@nxp.com <carlos.song@nxp.com>
> Sent: Sunday, April 27, 2025 4:33 PM
> To: miquel.raynal@bootlin.com; Frank Li <frank.li@nxp.com>;
> alexandre.belloni@bootlin.com; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; conor.culhane@silvaco.com
> Cc: linux-i3c@lists.infradead.org; imx@lists.linux.dev;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: [EXT] [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx9=
5
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> From: Carlos Song <carlos.song@nxp.com>
>=20
> I.MX95 I3C only need two clocks so add clock fix. Add "nxp,imx95-i3c"
> compatible string for all imx95 i3c nodes.
>=20
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Change for V4:
> - No change
> Change for V3:
> - Remove unrelated fix in imx95.dtsi
> Change for V2:
> - No change
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi
> b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 59f057ba6fa7..ce0787410f9d 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -681,15 +681,14 @@ tpm6: pwm@42510000 {
>                         };
>=20
>                         i3c2: i3c@42520000 {
> -                               compatible =3D "silvaco,i3c-master-v1";
> +                               compatible =3D "nxp,imx95-i3c",
> "silvaco,i3c-master-v1";
>                                 reg =3D <0x42520000 0x10000>;
>                                 interrupts =3D <GIC_SPI 57
> IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells =3D <3>;
>                                 #size-cells =3D <0>;
>                                 clocks =3D <&scmi_clk
> IMX95_CLK_BUSAON>,
> -                                        <&scmi_clk
> IMX95_CLK_I3C2>,
>                                          <&scmi_clk
> IMX95_CLK_I3C2SLOW>;
> -                               clock-names =3D "pclk", "fast_clk",
> "slow_clk";
> +                               clock-names =3D "pclk", "fast_clk";
>                                 status =3D "disabled";
>                         };
>=20
> @@ -1266,15 +1265,14 @@ tpm2: pwm@44320000 {
>                         };
>=20
>                         i3c1: i3c@44330000 {
> -                               compatible =3D "silvaco,i3c-master-v1";
> +                               compatible =3D "nxp,imx95-i3c",
> "silvaco,i3c-master-v1";
>                                 reg =3D <0x44330000 0x10000>;
>                                 interrupts =3D <GIC_SPI 12
> IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells =3D <3>;
>                                 #size-cells =3D <0>;
>                                 clocks =3D <&scmi_clk
> IMX95_CLK_BUSAON>,
> -                                        <&scmi_clk
> IMX95_CLK_I3C1>,
>                                          <&scmi_clk
> IMX95_CLK_I3C1SLOW>;
> -                               clock-names =3D "pclk", "fast_clk",
> "slow_clk";
> +                               clock-names =3D "pclk", "fast_clk";
>                                 status =3D "disabled";
>                         };
>=20
> --
> 2.34.1
>=20

