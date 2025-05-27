Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D21DE8AD;
	Tue, 27 May 2025 05:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748323469; cv=fail; b=UYOqrQzu5SHDdjuBdwwEbHGXIb3PNQqkH+9mll9CqdWR37Hi9l3t0fVM7VGbD8H0QpiMWct0UoOVi7NqPRq8SXCgB4c7unqmdIN83cdhp5ovIpLpskFDJzj8MWvvHETj0EAIkH0EztwS5YpTTNI0sslBo1arrA2InJy5K9HOWos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748323469; c=relaxed/simple;
	bh=WWZmRug+GqmobSTPCbtcE9GdGvz9tfUgiM8zgUpVScE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l8GtVPN2Xzzice7wkakXdBpWaIWlMeLT+gKoNUpbaZOjLh2PbfagCoBB90cSZA4qz1pAWnMLxsLvwhmuDEd9xnZb0YOuK2rD6eL2sm5YvMZI540PToRJU7I9+SHSz99E5t6f0VFBO3Ucke4UuiNPqHHvwFKLxTAIP1F8yDvN08I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X3IUmBAU; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X3IUmBAU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbmECtOnilueZ2ow789Hjl4Tl984ubiULRY3oI7YwCOB+SAUoCvVVFCzUU0O3iA+ut5n9k0KrndaIt/Vb6qBrw1cI6KdNDL9QlvFLufcDte8Kc2Y44FMuo1zGaBRkVmlfqrLQjFdUuMiJhEABv7stPLnEobdxocCewk2gzuzXu7U4coGMFWwHHfnLHf8susx9u+UbchqUiNzH1+PHQNR2B8VaDVHPR6h10CIJs6dnEYtMutrzmeDp9HmRGWR36/ZTKtwxyE1r0cwUi0ibEoE9Rk0mH/fa5C3WDAdCIOCjAx7orf+fhd9KEThfd9rR9ydBpHLC/EKTx4eAc8nhYGMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFbY11UKk3FAl7qDd1qikSBTtMkriMMQjxt/cEY+GQE=;
 b=FxwtleaSJSJRIm41uJZVBBoQU6X2cxsCvWZEP3ztoxG5ZmY4SE8vfieAS0zlzKI5/X5kzhrPwUVI75YbXrprSsglsyBhkKKkLLLoeArQIQBtQPImexB8SVY/E+BR0XHuSpOwLosHtHo3MpmhXcxFGmevPCOsbZtwfkWvn7h3MlCg1Ero75gFLm4R7ZegEeX/ec60kqS2lEGZOhoQs+mfZDxD4F/tPJ1d6HHZD/kwT4/1ySO+bc2rMcHBa3jFLVIpQEftM7YPiiWgLAM7P9CaSZkY6k3roJAv6xsPsVgl2pqF6NR/r8PJUbsQCgc4xtKAHjPGZFgwJS6x3mhdGkclpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFbY11UKk3FAl7qDd1qikSBTtMkriMMQjxt/cEY+GQE=;
 b=X3IUmBAUorHls0fsO11h6xU2wnjnKJmVvSGqlahZkxTlLXi5o9eBZYK4TiM60/pBfebSHPg+mcMh4n2gwyX6XFQWZKncKk0iQ4510FCPdRhLnFoErTy6kY9f6SYQnYAeF2cXIVYY4xso6LH9W89lfN2noCOS/kr06Ohrst6TqhqPluPkl1z11ieA+ZPYeqJdLGRvTw8cNzD1+gslSwJRfqf5K3T/QPP8LZTcvGxP3FhuNPQQH4QGQMobkgCKkLSHAomKWPfhOWAQgtF+kR5DCzksMA2Dk1TetZZVpZeX+ycOvvpthIAqCCNOf3zsOWcR4Vp8IeE+9d179mxyjict1A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9891.eurprd04.prod.outlook.com (2603:10a6:10:4c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 05:24:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 05:24:23 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frank Li <frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 4/6] ARM: dts: vf: rename io-expander@20 to pinctrl@20
Thread-Topic: [PATCH 4/6] ARM: dts: vf: rename io-expander@20 to pinctrl@20
Thread-Index: AQHby/5rcmkIYnq6ukiZ4Q/SIstRErPl9wmA
Date: Tue, 27 May 2025 05:24:23 +0000
Message-ID:
 <PAXPR04MB8459B664F892D4A8726C70B88864A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
 <20250523161726.548682-4-Frank.Li@nxp.com>
In-Reply-To: <20250523161726.548682-4-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB9891:EE_
x-ms-office365-filtering-correlation-id: befd92d0-9642-457b-d444-08dd9cdebdd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2Ieqvace+UQG/CMDwGJJiaANwdbxaw9tIX2jq2FBheTRFgwHwWd/KMnU+Bu+?=
 =?us-ascii?Q?LjNpNW9VLCJeW1mM7QXCnxyl900WtbG6Ix89f+kAq0dbdin3JQU4Jxlk1VDh?=
 =?us-ascii?Q?eNzQy5Vu6rib6fpKaUyHqDn3EV3CdRvS2oqrMHc6l7o7n/PiQKgFTilDAhH/?=
 =?us-ascii?Q?s/FYofKxxY6MRTz8wqX4PmM803jrIdC8FloL9nY41PjSYjQlMyPqnOPbovGG?=
 =?us-ascii?Q?eo6FS4AM8lPWtqEpXV3Iu2osyp3uf0pKOyExXVZ9orHus1rwx/ZaCOhcQ9Sz?=
 =?us-ascii?Q?09CxX+ZS1Xgk6rgwv30LjmKKNXAKns3V99sAmQZ8uk4bWtQktUeKHodkNTeG?=
 =?us-ascii?Q?aAV6idK+Wsz86ecNynmh5pKaAOkuwW2kFRdM+N7Fj56BAl5ZVHP0XQM3aFuJ?=
 =?us-ascii?Q?zBXQuDFKZE6neQ+FI4sBnx2C9edvM/sB5Vm5ITO1lV3X3Yl34k1o98QrBxEF?=
 =?us-ascii?Q?RKMxiWg34Y+NKe9/X/zE9h6/9wT3OUumxc7cG0I3o5+J1ZwPmUcDxRZ7X3GX?=
 =?us-ascii?Q?iTqLrCUG951UvC+ojDCpZjV0FIcN71Skc/xCOmhPyiCVDaO7pWSbEFojEUyk?=
 =?us-ascii?Q?wh8jDBqU1cUEYePTR1cYfskJM1D2mhbZ4EqtxVW2so2tmkS450WhFiwb2lNF?=
 =?us-ascii?Q?1zTNtY+lLr4Hy5+YT9IrYZmFs/Bn6ymOZcoJmAqOdhT7UbWfUORhLFoMXEq9?=
 =?us-ascii?Q?nMafUnGyDl6fzbUDqBJ5WORA68Km3yIrmyNlBeUIUG6FqRl3M8u/3R2DJpsj?=
 =?us-ascii?Q?NsK/VzoF3QOu5IwFD98//Evqhy1Qy+q5NHui1OQ7Y1yOrNzIA84av8f751kv?=
 =?us-ascii?Q?UoUUPw75wYwC/h82cp5ritlxLqzASyxFtRxiw5ltbEPcqi493Kp6cRrtiDyC?=
 =?us-ascii?Q?nOaaJy60YCh5hdCkU9u7rQuUiwhNeqxkLGiYjvrL1VDJLn5PMoDfCndBnwUH?=
 =?us-ascii?Q?MIhNJoOeDyKRhzF/dZjfb3kxTzAsIaurg7UPUr6HqcZRt47vcUQB2vtYPtgj?=
 =?us-ascii?Q?/eM4eLVIpdlqU3VIvagsABkALg1fFFaMTip5LNrET3kFQgLVD05BY5my0rKn?=
 =?us-ascii?Q?70pXs0ToU5vSu2yT63cG2IXK7VjCq5aLJ3mo75B0A1pGFIxnNYp4N2hn+d1s?=
 =?us-ascii?Q?mdhBeeJrIG764KU+VVY61/t4oMbGH6ZC+8LpcWxoxPUbuCYoAESHhZ2Wdo5P?=
 =?us-ascii?Q?3+fmf03UnhhpiFBLCK6aF+kU1VHM2WldOBTKG7JPAskwYWyd2fm9VFIebnE5?=
 =?us-ascii?Q?cD2Sx+YKfJQ837yVs1j4gkzgqoodbcw6BP1JX4szgPrmpsfHYIhVvbpik05N?=
 =?us-ascii?Q?Q1dQK/2g+cPFPYPUNIb9lep1Ry7Hkre0tYSOMMfCLKkuXFCPUOx8KRULJogW?=
 =?us-ascii?Q?g5SFH9GPOrG5nENfqq7bB3qy1bPGwlWSxNGpa/LpRqDmCsWAVWcA9ZDW6OTZ?=
 =?us-ascii?Q?b+HxmWdyNuf8oYX20bwLn4k2MYhjxQb83Z2xOLEVXeqyjZshCLgA11q0D+Vt?=
 =?us-ascii?Q?J5emIi2pShuUPJQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ccq2Drko7f/UWA5f3FCK23ZKibnqs5ESHpjhWm9/wkSbWGaRzL0t69j12+Ov?=
 =?us-ascii?Q?SE97DPM8HHAZMlAjmp4r85Jat67nvN9fkBikv+88ImldzPk8Q4NeEhmvXDJa?=
 =?us-ascii?Q?U+ST91FVOD9UJDqqzYbh519V8yx+VkqsY4XJ2i6qoYGkY0UOtCmCh9pgHV2Z?=
 =?us-ascii?Q?F8J7RmGOqrv2LpG2Uuh97v9Z0mStqoprsD79+pLy/OEG823R59+OypbF01LI?=
 =?us-ascii?Q?lyeRLff6R0UWqbvxWjY+4KICQzrJUlsNc9EH298pBcfKkhjuSOxGRB6+YzPh?=
 =?us-ascii?Q?pRtgG7E6aBn8TLkjq4o032loqtU3j5owlbkRLeCsP1sdPdj7fd1I7/L4eKoj?=
 =?us-ascii?Q?7nzFZ+a1W7VLf4Mvo1ijLehJbM6LdmKR5JRfM6CBqd4FVTvetB8iKG/ep7CH?=
 =?us-ascii?Q?0tQ1QtG/n2ErMquq3gKPM8S3gtw2phuxa6XHTfhi1ncGkJXKAB9H1/SCgrqX?=
 =?us-ascii?Q?RPjxTc0aBq5fDd02GiFGK0vvu37MaVLTjfV25DIh5Dfp6gvwTGSPLYhn5h6V?=
 =?us-ascii?Q?J4xSJGwfBHMWDXbCPdrkOPv+w71W9cMO51qfpjfJ6GINC2ORiQxEgft0j+xv?=
 =?us-ascii?Q?xI5ZNlzb1uZAjLsI1YDfkxr0OOWaqtxLSk5qLJ2ZCSxAWAb95tjXU1bC4Yim?=
 =?us-ascii?Q?qG/7fmc8le3xtQyrVQxpy4mfEwKH44JZA7Ch/8Ga0JaBselqt4tKs01OGZqN?=
 =?us-ascii?Q?KJ9VqYTPtE2+mJ2jOnaJzvYDHr9o1h+mjK5F33klNV6lUdJL81bhAyfX6VsO?=
 =?us-ascii?Q?9XifF5JZXSnLIHmjNixwrLSB6YXBquQiOYOI5809p3AAEomS9Hjg2lrtav1+?=
 =?us-ascii?Q?Lsi1JaIZR3RgQVTdZLmkg8sY62mXBkpXu0KZ6Ytug8zFr/hr+F30C0+3GLqY?=
 =?us-ascii?Q?ZfpvPIlLeIhajmHYrjt81Y7xKlzHWlKloj1pyFwI0ZxlG3VhbksP0DcK55E0?=
 =?us-ascii?Q?TzkyfPPzpJ3hSVO8XvUdN/coRBx+2nSzy0VnnRj9kxuptyRjSIDH7FZWt++r?=
 =?us-ascii?Q?gXBydoaUxHF+Jo8M3c6tt5ONddT7yNkV2wz+qZNk36sop+I6INFKyqFzLHbg?=
 =?us-ascii?Q?YJyBg1owyjAYz0U/ISSEDPHihsI7CsexzlLDt7DnIkiP1YjQChD7rpXk7aWf?=
 =?us-ascii?Q?ibglBcvTmqwnuq7XDwYYaL9hRB0rWj5CSWOUC3iKnMD5WnsXF5bcnKgJZdhG?=
 =?us-ascii?Q?JuejqxuL/YUK2CRvViqoMnxYXxWKP6emXiEOxiFHxE41SyIzgqcdagwtsb9G?=
 =?us-ascii?Q?LCG88PlnSSy7sZCuO7ciN5lehy8bztXjp/MBNKyFMdu0BpizymAuOWIrp6o2?=
 =?us-ascii?Q?Edz/ZuCszNMV79sSYBLyvkVBmFLxkKilw31fqveLs8AHCvVNaViXNdYEBMiO?=
 =?us-ascii?Q?nrqWfEinZHiNNpJn/Be9pMJ37i9nZp3JPA83OeJk85ilqNvp71im5QEV2NlW?=
 =?us-ascii?Q?c5zzTnH/qQ0LTDKPWefwZwtwVThDKuB17FU0PXoHcgs6g9TAmnA0y2eV3Dqy?=
 =?us-ascii?Q?1M1vmtT/fChEN6NK8hcUy6Vy+PikDtK5ffqGF2t0xJkvOxTHW7P14n67l/Ti?=
 =?us-ascii?Q?q0NPhdH6WHfJy7xlz0g=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befd92d0-9642-457b-d444-08dd9cdebdd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 05:24:23.7937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: afBSPK8X+sgM+tYpCec18LknjzpLttC7Y+IGijnTO58FgtVqHVGndmRzg2QUeowk14n3Vd5dYtTrkT4Hh3eGlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9891

> Subject: [PATCH 4/6] ARM: dts: vf: rename io-expander@20 to
> pinctrl@20
>=20
> Rename io-expander@20 to pinctrl@20 to fix below CHECK_DTB
> warning:
>=20
> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: sx1503@20
> (semtech,sx1503q):
>     $nodename:0: 'sx1503@20' does not match '^(pinctrl|pinmux)(@[0-
> 9a-f]+)?$
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts | 2 +-
> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> index 7a209c9c57a4d..79ea7cf57a4dc 100644
> --- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> +++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> @@ -311,7 +311,7 @@ gpio5: io-expander@18 {
>  	 *    I/O14 - OPT1_TX_DIS
>  	 *    I/O15 - OPT2_TX_DIS
>  	 */
> -	gpio6: sx1503@20 {
> +	gpio6: pinctrl@20 {

Use gpio-controller?

>  		compatible =3D "semtech,sx1503q";
>=20
>  		pinctrl-names =3D "default";
> diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> index b3d338312df4f..8020a644dd9d1 100644
> --- a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> +++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> @@ -583,7 +583,7 @@ &i2c2 {
>  	pinctrl-0 =3D <&pinctrl_i2c2>;
>  	status =3D "okay";
>=20
> -	gpio9: io-expander@20 {
> +	gpio9: pinctrl@20 {

Ditto.

Regards
Peng.

>  		compatible =3D "semtech,sx1503q";
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&pinctrl_sx1503_20>;
> --
> 2.34.1
>=20

