Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30703074BC;
	Wed, 25 Jun 2025 05:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827945; cv=fail; b=lI7ywbOVUdat38LPc4/TRyV47YoM5IcO/VoO4ZUFMntPeyQbi3K6HTZq45NIh2jW8MeoKQAoq41yFdKa8sJiI41qBbsSfUsbuMm0w7A2LpcgWKv2YnGmlQwYIGUJuNn9x9x3KL9iUhmlgx/LwQIEHxMoDGKuUj7xRECzKrTPJTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827945; c=relaxed/simple;
	bh=hTMbb6c3IygAYAlriXSpNWhd4udNMp3WYzhZFqs1U60=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WWVqyWAXR6AgcG9FnnvP2BKrcNUV89WfYR8fPM/7ZYJcBsed5zUIAeBBPRRWYZKXMA6PhUtJf86WAAobq00jI4/hi/LYrVv97ZoO5T6z6tkDvFaYA8bnkk8N9motvBehNBCreaX6sVItdf8eYtJ6E7krI4W9ixiaLfljsJnJt80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=juKnYdwY; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="juKnYdwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvdAd1lk+Sj6xiFeWWcU41HeGP5LzeGd7r+0PsFlhmmHL9uy9G31v+36RIonerViW/+yfOb35L7NgI5xdMiCJsj6kiHK1VJig8GEEJpodIE5aBdfztki0NAxoU3NJUjB96CeEc0YxIMlBNlsuaXU1HIbwdJijI/YzF3a2WxPMYh1Ndktgan5Ck8UrJGAeVgYHXZfLwKxI2WFYgikMBgOHKxKboocI2BlmhJyc7qIDS89AQ+tgjmvAHoR15U0nl95dKE/BtTR8t6kvD2XqfaUIPsirne5a6/4/lyPDWFtcVYpUVILonCsGaEfupM0B5AQHdde2/ojNM+Ix4EIfCbbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rr1uDwHZ+NbCbgpH9x2DZ5Qj5ugQ6pB4gCbLqqgUp4w=;
 b=guvgV3R/7t9caIFx9SqPFXd214BzY+Gwz+M4ON6XMZjS3AMbdYSg2BP007M+tD9eHGXAleap39kKdmCvaN0qtUGk1l2almJ9/LWMzHJOE795IhfvvU9DC2yCfK1vSHScDLWgCcC8Z94xzJ2zrTP78WMdNJE0UTkj7Yh+I9rFxZPvhG3RCQ0/JBFhM4gMn4l6gy0505keV/7uefIyzniTLxNNSJiVKLc3xgUMDU0Plmg/WELiSPewLep/lPEvdJSBeH0AKqx1XVFwTbQbrep9PgsZbT7FpgSUy0YxjBRLKo7xkdl3GN7QZvTTzSZ6ysPRqgMyDTfWEOF6AnxdbMAPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr1uDwHZ+NbCbgpH9x2DZ5Qj5ugQ6pB4gCbLqqgUp4w=;
 b=juKnYdwYRN3yc0HbC0e3GHIsey6JUBFVUcZcBdgVSxH339Ih44ZF4IYFei6rVrLUE0Zq0URh916q8gATc9LoLzCo18Tx6ri377LqsgXm0PaE7Lsg26au6pmFRyghbo5uPn/xNNzzJLVuf9DAjh5Tlb4fspFuXMG0gLkDhh68pxJ1zvrhTkXhcG/4bMi9QvUSrlRRvfUey67C7ZjOOLs5yg1PVZjI0HlqppgB5NxTeqPn+6gT57VlzZ/VxX6obeuK5ginOlQLu96jUlGI5NbmxRSTeKOb39a0+qM4mBGSexOYLwyuGuWIilzgi7YKGAG2jNrkJXY2JkuLpGCKld9EwA==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 05:05:40 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 05:05:40 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH 0/3] update NETC node of i.MX95
Thread-Topic: [PATCH 0/3] update NETC node of i.MX95
Thread-Index: AQHbz64iZQNI2D52QkmeWki4M3kwB7QTfcuQ
Date: Wed, 25 Jun 2025 05:05:39 +0000
Message-ID:
 <PAXPR04MB85100386B3BACA9724C05B7E887BA@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
In-Reply-To: <20250528083433.3861625-1-wei.fang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|PAWPR04MB9911:EE_
x-ms-office365-filtering-correlation-id: d504beb8-1d39-46da-7b79-08ddb3a5ee0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?w7U9XzrwqOeJVIwsMSmjoeLwlmc4yZSPJUlXSu8qocJrF8Yx9zz2j4kBERqA?=
 =?us-ascii?Q?lc4p+yYMEEMOQ38c0JMEtN76hrOUHzn1Ld/H9o/DLaIguusqLhd0HuEzs+C/?=
 =?us-ascii?Q?aWLbBjAaC3QTfKVe9XFXO4BqyQ0ZGyB+JLjsghkIqfMhPdafrQSK2XNt6f+O?=
 =?us-ascii?Q?otYA3QssI/gMfP9/BT0jIAp9s2ZHNraZcrzzlZIWjxchq2YZz3da1IC+iY7Y?=
 =?us-ascii?Q?Ug0mPtO6leXhZyVM1qaitGr4dDtlSQUVkC57r7ebdtOzfKe1Gm1ytlflDovR?=
 =?us-ascii?Q?hJzYZUGg8uMkZIs7UPZzPGpVInqUjo3iKFls4j1gh12QJobHGhWmX3U4SIsJ?=
 =?us-ascii?Q?Jf9o2rtSCCnl8slq07v7tl+KC+HAiwO11QVulqUuLDBMW71C6ANbSBtt7Wn3?=
 =?us-ascii?Q?FiKM3YNzHe/iHgylpcv7Ykxb4XmIxFUQRJdKL0xo40rUMtSkJjUR6jXVuZ9y?=
 =?us-ascii?Q?lTCP7ka9X6O7JTuUOFh6eW1LnJ8sbtm9FdARg9u72yqGcHL6XCWh4PUH+YGK?=
 =?us-ascii?Q?UIlVciBYT6xLFpyuYqIho445Azy3BwZFnX6XIJ1xYr7EqASo1qfsZSCCxBi8?=
 =?us-ascii?Q?I+GJpHmOKdpYlGotNRIx/ckWQUAY8acLnh0gCvB04warPIm5MXz/GvXQrd3o?=
 =?us-ascii?Q?pTk07WOA/m6TmCsS/pt7kNuUvAueydxoqS8OgyjpZEaQHrH8sV3I84HM31tX?=
 =?us-ascii?Q?7ZlzwXV70DBGX695Db4k8K9zyvU89chsmNQo9/KhYEd/+Ickdj5nVAvhefZU?=
 =?us-ascii?Q?2TnJeSQTFpU89ZuuRlPWMO6IYJJZ2XapZjDZr0c23GDMnWi9b11bIQlyGG/1?=
 =?us-ascii?Q?S5nPXWQvOr0LPJV/IFCtZK0gNzQ7K6tXEz5VaArQpcgYsP/C+4skJpyo3Mww?=
 =?us-ascii?Q?I98C4d+QNKqHNZbjKRZaew8dJMF/SE/abWFh1kA2c+CJ5w1pgdYTYmC2X5+2?=
 =?us-ascii?Q?hh1SL/e1WbRNSCsfUP3XqXjb6qsL5pMxmIy2mUAly48qlRWycl4yCQMLH8Ja?=
 =?us-ascii?Q?Db/45l9r2x7ZT4wFbz5MopnE+10N2rrO9lVuyoGlla0mZsawEBvrqHfT+/zA?=
 =?us-ascii?Q?LaQAOduOl3+tCK1FXR2C6k+raSE3u+QgPMwTiiG+K0lo6ZGHkWhlZbb0NV6T?=
 =?us-ascii?Q?cn7xnilpaT9T03fNgoxzuk/Jbf8mlZRIX6YGpQPq/xjJVabcwvEH5EoAYSVz?=
 =?us-ascii?Q?D2/M3E1RNkqZsIuUzpJUvHSvXeaFtgbnuB8Q2mroAgk+eCcN8pcqSa/Tc5EW?=
 =?us-ascii?Q?sgij2lGTZoA1Kc09yXZnNvDF064ETDpZEMVFl5xWwfmALlb8feP64eYikivU?=
 =?us-ascii?Q?Y5e188CxFNmL9H+o2akNi3OuDJwuzRAMgfCy7JxLsJig4wgOqL918Qg5HbaH?=
 =?us-ascii?Q?Fahkrkxr+snZDgZFxSLs13hkK25wrhwYiAFLRL7T4WXZFpsLFkEfr943lspB?=
 =?us-ascii?Q?kA47bqUbrg3AXr5ykzrCAxoK9hnqk6PZ/439Po3M8aXafGp6GocdzxIE3Tvo?=
 =?us-ascii?Q?Ud06zsC0ImAfayE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n/BdPDlA3NjpYuC+6iI+wJAkwdMjjhtvzQS7Yijo11TiOUoQ8EDAuFXGK75s?=
 =?us-ascii?Q?KOH+tJhvs63o2l/+2gePKVbRSh8g06fLxdEQjsPmi9nunFIBHwqngNmekiNW?=
 =?us-ascii?Q?HdLBH8tfXCnXM8O2fR+qKFq/HbaAi7Ze6x4m/oDp7f2nyNcrcFqOcdw+mdgz?=
 =?us-ascii?Q?nTq7mkUM0n1ngE+1DVxj75hDMyM38CZvr0J86mi/ojleSZBzAkkivEABSXAg?=
 =?us-ascii?Q?rQjlCgcEK1USjSoQK7rXyuaTC9hs/I+j21b4LG50S8QIBw9XWt2mtuC/Utqt?=
 =?us-ascii?Q?1366JZpVh6IasDEvUPNmS6cax5+nOWFfgwyakVcxlxaHYoMAcsejcZ+eDxEN?=
 =?us-ascii?Q?SrUnJpdOlUv+7ufo+29z6J99RYPe35EddAApIiQnFMqCFZrl+PIxkmfOSvBC?=
 =?us-ascii?Q?tlaaztSZN3JLe1AQkfZ7E+i5cDczJ7KozRjDLkHUuZqxVg3iR9o78nGMsoTx?=
 =?us-ascii?Q?+kPGa03SUa0DyuizDuJTbVy2ZGCnG0hkvTRcuTE4oLIboLHHX9yVMNyp4UF8?=
 =?us-ascii?Q?mIq0gePkR32PtBtjUCdQRdjVrmvcz1+sbYAjozQ2+03PiWsMY4WRiXRyaA0T?=
 =?us-ascii?Q?00BIwhYjTfNOkJ9+M6+5ZsiVwYI8T+E6HbLOrloOBop2fBXBgRw20CEDXKZ8?=
 =?us-ascii?Q?pQinEHJSkaAmZ67IfjKEoKerkWbcdwa9BQx3L1ErRIMHn2ur8YuAp8Q86gCs?=
 =?us-ascii?Q?JZHGt/xjR/E13GCAFScJcawSL4fYCkorLKncnq+xGoC3xgYIHaR0FKVGVhDP?=
 =?us-ascii?Q?odYMxfgY4lc99Gjl3iq4nEbv3sGBzPuLXV3LAmOmuniAj2ppplGPA7a8qeZj?=
 =?us-ascii?Q?27lqEcHCff1KL0fN2qbP1E/Y4WbiU3cUsZwDUsVGdrTYTIPwFbS6XjkLw4n7?=
 =?us-ascii?Q?fFCgRWW1PSjnIJgiyOuXg+e0rqDZjZ655nOl1DUGfXqZXb88icJgxw03EeVA?=
 =?us-ascii?Q?mBotuAV256e2vZ50EjYCstBL0+Xahzw1k3CG6iSkVuCb7j0P43+WOEpxkFCX?=
 =?us-ascii?Q?Uk4Usco9yb4xuG4z+zbB4KGfmDDiUzGapDtKOFLrXnSLIZfYJ4aGXtKhXOuQ?=
 =?us-ascii?Q?GlzDzGoWI1Mz4detPl8hU30AQYEJqnKT1djmY19E3YIdoOqOsolBjnFtjGTA?=
 =?us-ascii?Q?tF/jO7DvBWR30i+NZdmOlQPmFhflQrNtFOF2Tuuk1D/ij1z7qej9JwaZge0P?=
 =?us-ascii?Q?tM4x+zu7zLCNQQiAXQ+DKLlRQfhX135eG6VAkP0mFCbKnPgApIvuWBqYkS6I?=
 =?us-ascii?Q?0v6Yzgb0RWCjyhKgIn2KZpCWXxwz3ukdB+lDAIwOMj2rWsWi4zJ4kjLElMhj?=
 =?us-ascii?Q?4GxXTCVKDrKyhG19Hx6prReouruDsgdDSxzR7OuSvYCiyZKO1puF/+L53pLb?=
 =?us-ascii?Q?/AFhuDg4r1qVm8n0DiZkkNBr11EFWcmqG8ZxF4mfW0GT0B5z2Mx4PiCiUVIz?=
 =?us-ascii?Q?uJjst8T3Z7AgLUUffGcuSNiB83L2IfIOeU1+pyBqFBgtidn0o8MEKuqWbrhj?=
 =?us-ascii?Q?OqRBQPHNo/EYE7ozWwz7xcdWfrJQFLr4kLMFVAzYJRnyBOsNsi/XCGYQrGcs?=
 =?us-ascii?Q?hM24bqPseOn5dxqJYys=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d504beb8-1d39-46da-7b79-08ddb3a5ee0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 05:05:40.0448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZuwZxDkFO/t2snFij7ppJfPmv85RkKfyss2m8iQb4cw1xWE7T8FvD//gC6OfBeZqOcwlgRynvEh/gguxK3vDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9911

> We found that NETC has an overshoot issue, so the drive strength of the r=
elated
> pins needs to be reduced. The first two patches are used to fix this issu=
e. The
> third patch adds SMMU support for NETC.
>=20
> Wei Fang (3):
>   arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
>   arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC
>   arm64: dts: imx95: add SMMU support for NETC
>=20
>  .../boot/dts/freescale/imx95-15x15-evk.dts    | 28 ++++++++++++-------
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 12 ++++----
>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  8 ++++++
>  3 files changed, 32 insertions(+), 16 deletions(-)
>=20
> --
> 2.34.1

Hi Shawn,

Would you pick up this patch set?

