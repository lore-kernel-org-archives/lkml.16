Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490341DE4C4;
	Mon, 19 May 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659944; cv=fail; b=blhW1Aa5J23bliVBoxjIPkKWNI5RyrY9WO+XoHynrNDT9DCFks43DGkMdjPFaCLLcoIBb5DuBYuuoEJM2OKX5wEmM9YFb+Jv2HsjqZwtF0SeQEDuBDqyefTroa2ls7qfiYVBI5UVnzYlutO57yiDRjwhI5v2XbT4ZXbTLK3q4m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659944; c=relaxed/simple;
	bh=S+tKIdv4ANB88zJwYcJAAighZiuEnyd249WLVYzZaTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fXRntDFy+sYkI3/BJm/aedUEakXIOqGQbeLOcI9UrwxbW/LOq8SDBaKIfl//GUPu8ZnoCCKaLRcza4XtUE9rqimEJDXKkNAd5x8mpkNpU4193Ug00LXWXue7kxeuvGfFSp7OQZK+UtSKpKBCfILulasYFl1UKCD1aipXVu2rg6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DdTpfAoW; arc=fail smtp.client-ip=40.107.20.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DdTpfAoW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nU38Isce0I04onWOVj1Jk3iRZA7PRIadOwkM7V/nPRGGZwQGlKpiCv7x6LJucSL1hOhldgkzQ11GXK4vdfuV0UUCSFI6mysnWY72sjhWU1tTNqFAA1krVuEGReGTuQ6+rgoC4Uq8TDcp1V8NEnhUPJZvYWR+2edxoxBMN6roLM92E40h9TptBL32UGvGCUrRm1j1ZeDi84Hgd1gJU2azJxClQig4tK+TG2Jks0ERBET+OeciDy0TXX/3SFsctH9Hx5OkiBKnImhWq92XZAhaW478xCCeb6pX2jvPsBIunw+HOkG2fAV3bvI9cb2jnsigqpYGk1ubL7bBvxfSv6z6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+tKIdv4ANB88zJwYcJAAighZiuEnyd249WLVYzZaTQ=;
 b=XCsVkciUEY69hh2FF6rJtiJQhdfmn9fCRbarJVnvulzctKcl5GuwDMt7VEgpFl/LyN1Gokah4hey4rFhQabLbbO6h5O1HIOJMjsdPcfQPLo2hFeI+48jQToyIfJfww2LX/glohrOlVAO5RnBPk06R8yBeb2K25Uj0uGaYjxLtSnfJ4qjBZfdRMhX3a+eK0TvvI1C3ol0pJkHiGjBvxtfqkFXBnC0/821szM4BdTE8tMBxggccTGGZob7b9ikXZ0Zf8kMOHyHHhAGnkkoUfeMyfoJIAydsNdMvWT9nhvfHJsIB1EMC6ure4UBBfr685NubbGXvyZXLJuF6e1VsOHP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+tKIdv4ANB88zJwYcJAAighZiuEnyd249WLVYzZaTQ=;
 b=DdTpfAoW30BhBVTy7ulYGfztEVV19R37DSBtVhN+DnSXEcNP+df4Gx3qhyPjeX8Gt/cfMpSBLmG9TOJLlOFL1VGxfBKpighutEhKmelnR54bzid59k+N3H6RJD76ObSTkXCSQD+zCX6HbrS3cHLiJBtCFzyjfBT5wgfvC9HeW00k7Vcwz6ajHkDzfrGBrd28lyOyWe8chp5jbuTscRaEsLZt3ij8C5N/VRwo9m9d1xh7HUrPyK48V6D+2ATMfVF0uAR6iSqDMlLy1ljZU5ABC6f4tpzOT2gQrpqa9QRnNB4EFpgO4SqhhCy/tSQKeKK3siKrmPdbnpjHKvxyAIN1rQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:05:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 13:05:37 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux@ew.tq-group.com" <linux@ew.tq-group.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2 to
 600mV
Thread-Topic: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2
 to 600mV
Thread-Index: AQHbxLR5ITiZk0OCC0e5vj4gJrt237PZ8X1Q
Date: Mon, 19 May 2025 13:05:37 +0000
Message-ID:
 <PAXPR04MB845962432774371D73E8E229889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10729:EE_
x-ms-office365-filtering-correlation-id: 6b220079-6e08-447b-4f0a-08dd96d5d958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?plnFYC/CRG5QEyNrtgLlAuwWCCvPmJT5/ygb6kyxqhRcmfVouudLwf4gZqb0?=
 =?us-ascii?Q?Vw3TaTqd7clPCJCXHaWaVhoq/jz2i3jn5uuhraRLLHo+UtBnk2N7CeD5oCo2?=
 =?us-ascii?Q?Zaw36iQKQfMTTy55Zb9vWIed9AfLwvErvZkvvXN5LLmtyYjnVCqBC4j/vFzm?=
 =?us-ascii?Q?R0oxa2g7iN0YHhS1KlJkXpZJyVJWmfRVtu48OD7mY5f2BbGEO/GftpaVkVoS?=
 =?us-ascii?Q?wMFQuBDOOJ4j7y/phDHb4KmI9AF9FrOa122RjZVd9KSDakDST9JBmLE8H+ia?=
 =?us-ascii?Q?AhXOniIZBWUccDn0cEg9iJPWGiWq3j34xbpn/UfmY++th40P+qPYRf61Bmgo?=
 =?us-ascii?Q?qHmvJdNm10ctPUe/biO1RITulIyWT5FMT0ax+1tJFgBofghWYQpEiAYWByMz?=
 =?us-ascii?Q?3qHOasCGNFHuz8S60qNmjlC92fY1GH2syeSkot+UdB1oO796RZ3PqweTj8Lb?=
 =?us-ascii?Q?kA1jORxgZSyBR/DbVnpnM1je8kLq2MHuDC3bKrKSiBYnAZzvDywSH6LgQRDP?=
 =?us-ascii?Q?X0vEsb8SoTkE5jtZJ2hVbPad6F6KFKqnoXBPdoMrj9i+daQXjfrMu/mydPdk?=
 =?us-ascii?Q?/UCEZmmS7SKhhu6TQ2m9jcFy9UHFp9/NW/qdE56gY4P1HLvf2mVNSf4lOdzG?=
 =?us-ascii?Q?RaL2jY6Z9dLoA3hO3TxPwRjPVxOXb57V4uI/1Zp363qlc3r5vPN+/MSKclos?=
 =?us-ascii?Q?PmLKYNY74pb6Cu3p5VIbCtrSWxr15zsnE42iqrp6ClzK8gTGq8sfYuYMBRFb?=
 =?us-ascii?Q?ba4ABSJJN3hFSyqpvYwNyq5ASAgy5/AAD1mmp4Ch5h1+j1RUF9fSvZiPQ9Tt?=
 =?us-ascii?Q?QzihrsP/yfhLyeVaeDqOnWkoYD3FqeB/RStEWzV1wgEDt6EB1+p/6CMOm6Aa?=
 =?us-ascii?Q?oHLqfrxr+RhJsnUYfM0BH4bDEEbQ6pfdUCqh/MaXah1eCjSsfzm+U46EXIA4?=
 =?us-ascii?Q?kObagBdDHrAhsyZ8D+2L3nNlGdgt05Nz9e+ngqEeH0UGnZttqkTjsrZyNY+K?=
 =?us-ascii?Q?mqMeFHXFg9kbBVrxLs7KiNCdj79k+jUnYhldCuqVugnX2VQ0qvn2FBZXA162?=
 =?us-ascii?Q?PkqiHWuXGls6NAsLml2c+yBZ4XHf/YG8L5U1D0+EdJmFMhOFzMCNNpZuZFGn?=
 =?us-ascii?Q?SnSUoW/PziieGvCwJA940j23X7VE8HFuo7DRTAJz8z7CTQSEQeX84C7geVCr?=
 =?us-ascii?Q?lP4WBtZLIq49PeyZMh9nZUKPDA0gSI6pf3bA5kdMuVxxCK0f0fJaXznBcvx/?=
 =?us-ascii?Q?t+XjUffTWnEC0IeCmN3K0S3Z/JnZ755IC1ZM3Se2Yetva682XgkMlCCZdxHT?=
 =?us-ascii?Q?cC59rzocZrH0sNB0KZA0TjoNTk8NC2dltV9hHUztjPFB12oxaWrplSiQWJ/O?=
 =?us-ascii?Q?81VnF03Vh51i6ON/JgO1ooGVKJ2LxsB7a77iqsxC+FUPIICqRRu5m3XTHDrH?=
 =?us-ascii?Q?+WQzSqoVcBcLz/uhxHBgmm2Qqw1jQjSHxC99N7Wy8aB1hpnPz0M2Hw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FPw7S0x7qwPM2+PCsiZpsOqjP/5mSGvYuVK7OPOJ02HYJhyQyjGH7uth+bHA?=
 =?us-ascii?Q?zdbhT6MR4LCvRqbMQUSA26i1NvCTk5ERmzBN817f5zhSQbZZ/UJV91cWVa8J?=
 =?us-ascii?Q?pbj7Cb5fbL2dcx7yaJmYvAgUUGqHcCz+rsNgFHd14HNxiLUKcMQsbHYMaR0j?=
 =?us-ascii?Q?0SBCi1Q+aKD4VSmDBRTdm0g6ZR0pi7pNGe6nI+O4PAF0BzqFKr9y6QSdw8bK?=
 =?us-ascii?Q?4Uw8sGY2Au16XN4TGmaklfhpP9n+xa90Ai9AHNpRboAyUNTOcwumFxCexUxN?=
 =?us-ascii?Q?al6o1MAWVEPurTCBwQexs8n6jlJ7/H6tzlJ1dQh/7a9FVtEmfdmhVroNrO+E?=
 =?us-ascii?Q?BNDc3mMcYS+vxEQcOXaDRqC9vTNlRVVRnMGkUNBcVddOqRwDwOSAfp7VpOfE?=
 =?us-ascii?Q?E4h9QTCrFPAoWQ2u4zXp5bSGZxWZ6fR9GrrrKFjPrpUEHSFOER8g1qRRsKv1?=
 =?us-ascii?Q?ZawaI6Zz3Esp092vpv/ddG4mriaODvc1xZWE4UcNzU9Uv1wjxieGw4q4eTov?=
 =?us-ascii?Q?OTdelyQDX5NAUzznL9i6zQJoiia5oFbmGws+uqZlqGxkAPo1u2haxhdjY65p?=
 =?us-ascii?Q?jlpWzAosI4SGDEQKDsnyQdLRlJQXNw/1T133oB1E+VyWmPt3usaiIKfasMjy?=
 =?us-ascii?Q?merjX0I26jYJArRht6YV1+Osk80JHRMPR3FSsGgFcrmMtm9hpHw8jgFf/978?=
 =?us-ascii?Q?DVXPexCALDf+eB2p1Bj7uHj3jkLYYJAq5lleXk2phVxotNL6acF60JSd70Ss?=
 =?us-ascii?Q?xNk/sBlux2P9QlXADRKIWpvOZQmTHbdjA0k5hXcIeyRqsP+x0DYt27EXMVrg?=
 =?us-ascii?Q?+AjKgut89FFrIDBgE9gp6FaW4se92qxbJzKT/sl3h2cZqv4OHcCnuPNvtytR?=
 =?us-ascii?Q?ZYTHKK3mRNV/eTa90gNfeid8mAD7Gxw05f//thmiG0e6lXWmtXgCeRd1NAFw?=
 =?us-ascii?Q?Z2VnUrbnFS7zTFL+U0wIiEX/M1OWAEuSL9cBu09Fi/jdieYGAsnOi9Yml9UX?=
 =?us-ascii?Q?h4wiDBPN9h64G6ZlUcCE0Afrz3d9bCMj/nrtpfckJmXmSVxIuK/3p33Dlvkz?=
 =?us-ascii?Q?GNxKLgmSIY6fdKA41/feI54E4CnleIdQ3bOiZ7jVNuzfnXanxYlp6PR2TnNN?=
 =?us-ascii?Q?UW9rxgqu2jNEE4Wj6WkHNaonv6Y7OU1i0bUY7jE93c5r+ojrXZL7Zvp/+XYQ?=
 =?us-ascii?Q?Sf3S4OVPUoOofNuqSPLhINGbM4G3CIcFaWMdxDcDp0bdxGT8ebY5+UPBlWCu?=
 =?us-ascii?Q?mSVbHT1o8BkKDMeGb85o88wJPi7zBlaxtaGa/JrIPK9lbkWGyzxbRo5K37sU?=
 =?us-ascii?Q?WcGAkTMYHIAks0Y1Y+uiB8OgikdQuCeDq3PuemRao03TPsLIRV1HHCDJ+9kf?=
 =?us-ascii?Q?0XRnsmVhj2wUZJxIfY+ssbA/qFYHAk42oMej21i/hhCg0VDcgoRaMeNaEVVg?=
 =?us-ascii?Q?hlZk2w3BXf9k7mcRgmcrRWBEtObQzfzzMaerp8PxTuJgwS5iG+yRa3Dnzwnt?=
 =?us-ascii?Q?C2wHFw2ksxirUP7UBnFNnwU5YLwOnuv2CJuPqbvTUoNAn2oS3Bf6LHtsTfMQ?=
 =?us-ascii?Q?gPwV37LGQAdbkuQFTCU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b220079-6e08-447b-4f0a-08dd96d5d958
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 13:05:37.4944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEKWgbeybn1XOIGd6MnJmzQLJBVWcRxJWt5T7ZdK1D88nCALh/94MZluqzRxr2V0lgxsK9TbqfXGAcdbFSakHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729

> Subject: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit
> BUCK2 to 600mV
>=20
> TQMa9352 is only using LPDDR4X, so the BUCK2 regulator should be
> fixed at 600MV.
>=20
> Fixes: d2858e6bd36c ("arm64: dts: freescale: imx93-tqma9352: Add
> PMIC node")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Peng Fan <peng.fan@nxp.com>
