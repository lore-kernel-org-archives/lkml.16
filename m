Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C07279333;
	Mon, 19 May 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659960; cv=fail; b=JtxncWsZIU81ExMR82ysIgkSh0cgG4gtitf0zhIivVgDnrvQGAN8f/YrDMJmzE/5qALi0lLoFcA+9ho/xwGGNqgwMIkyQ7cNHLPPxfeRj3qVXTKs3KRGXSDMxMjQ8REV0OkUrOAUuHDcZNbAyMfOHt0HgEth/4HmjOKkB8yPDbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659960; c=relaxed/simple;
	bh=OVTP+Sro1Iycdf6Ax8NGgb0PH2C8N9tc9ycxETYc9p0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q4XKBjpFrd8VjOTK14J+j9yeKl/2PFPgcrVVdLT1tRe7NwGFCBn4Q40mgWq3pSah/gjZxv/aavXak2hGR/lvWty0iKGeoW0+rzXJSz8l32cLqFyhNwl254utqCdCYEDa1b7vYV0FNMzqQ5tcbO5uyfkrHzjF0yi63UiAeoZ3UKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SfgwtAsY; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SfgwtAsY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxOBj4AFRLi+SGlY3NUAmgf7m9Y4Zw1+N0b/sTHxr1KJp4NWWR5azrdEAjgvgmCF1jXTi3ostRKwd1TIW8NbU9TYdWuhzHYNN55ZGAPzRk6PJPIcrVyk9HH1Bh0bR+HC5W1bYvsipqWoKFjsWos3G0XT+0Uv2RUwXQxFiyUHjyDmilTB7KWRtYhHcvloEX/fPBKxcK8P9pT0qqts88Er+qwuSv2zGSCTrIXLUFZei8G2VDmP64ft6wAOjgrSXyneRngb8sSbWaWlqkA8/SpA8Ifo2UcgP1cDDTyV20ofyGWOs6OetKlJqjqLW1vjwq+pWJelMlWvSaJw7VBbDOq/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVTP+Sro1Iycdf6Ax8NGgb0PH2C8N9tc9ycxETYc9p0=;
 b=fK8BJNmNIhKlQNKtqPybW7RXePOOoQ0PvUSrRovEBw+HEup/+XBCkqlGv4VsLPwbvT5JqFm2HWk38vLH9mF/WbrF5DXkChNaa5kWbpf7JTBvrn14tSeguAN/2gQCj6vPYO4GcDxomOUsWw9gIyGMy1WU3MhL4TofFHCmsrdgpgHGQ43dMnfeoiF+xMWu10utQrilALaMTbv1STYV7ip3nzT7t9Op8pbRUvPWcv20geZLsMWLwr2kF5vibUp48b7I10D/YbbCLSJ81LI55OHXCfC7nLkVLC+gZ0uxNpPKIlpAsAwEw0kcwtw8w7+lHmEfb5B2GOeqe2pXAjn6BNWCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVTP+Sro1Iycdf6Ax8NGgb0PH2C8N9tc9ycxETYc9p0=;
 b=SfgwtAsYC0fdUZIDpPwHle2U1ARn1AVosREuB75+sxDHBsb/dPOZ8qtBLQVtePOgpnsLqAD5SZ2QU5AlAAScu5pF9j7pRupE/AgUPNmZsZuB0u4/eeC+1Q771x8zXcMx+T3fKlt8wlZozmH4+N7x60Z+CfV9SHs8II8Qtc9riKbcB9umiD6Ub+heGExEuKIemZJiezGQFrsFouRPEqve4/RgWW8aFOMfa1YXmi1eM9ugq/nquSGrwfwtAnzT3nf40sc9nYOcjdYV1Y3SEZABRKswROygsdTqDAyguW8ghSoNykf1h69nvcqRpTcJaiR5LWnkMtuJPmUqKVTVGwmvBw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:05:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 13:05:54 +0000
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
Subject: RE: [PATCH 2/2] arm64: dts: freescale: imx93-tqma9352: Remove
 unneeded GPIO hog
Thread-Topic: [PATCH 2/2] arm64: dts: freescale: imx93-tqma9352: Remove
 unneeded GPIO hog
Thread-Index: AQHbxLR6gogo2lxGNEWu9hudkSyFn7PZ8bqQ
Date: Mon, 19 May 2025 13:05:54 +0000
Message-ID:
 <PAXPR04MB8459925D2FFC3145A6C52F64889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
 <20250514094130.621087-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250514094130.621087-2-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10729:EE_
x-ms-office365-filtering-correlation-id: 02c3afee-7f05-47a1-55bb-08dd96d5e359
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Wc27fa61q3PX4yKQ5L/8a54JVkHkGdOL6QOseg/RX2MPhcMCLZ5neLBK98gX?=
 =?us-ascii?Q?iHyEaXr1VkpU7kJXmPpZGv4M3oKxe3XhtYuIEx8L7PZ3ZJ8zY0bHhqUboJF3?=
 =?us-ascii?Q?Crc9gIA1yFSBJrcx7OB+OFMXbvCf6DQa56oQ1xcujljaemq38aKRSrMKZmt8?=
 =?us-ascii?Q?X6ZUnSGescSfv4YxevVt+ZEdarFoiYxR/ubm4JW7H0g+iIktRjRuN8LcgwxU?=
 =?us-ascii?Q?NbwCdU/Q4TVHp2n9qwl0T031y1LSO93WT3rfEkNNJR61QKTZ16AdB0HnA1sF?=
 =?us-ascii?Q?Rf3FZj3XteV9ROM3f9IC6v+KbE6EskWdYlzgJjCEsAp9FEj1DRNdu5qY8ip0?=
 =?us-ascii?Q?xp4VSPK+F0mKifNDTz63Lb6R3G52qjXkxmAGclCwIAsw1fAYvzCQUyG4C02W?=
 =?us-ascii?Q?E6SJHOzLZ3D6TkdX7Q73i0PJq2+VlRhCdLYv0EVPPxQdiaztgX8avWg8SzlK?=
 =?us-ascii?Q?8LydI/vN6tDrcCzr30OgpejiRCsUhv+a1mTWd0OGf3HyZzCDMEp8CI4TAWmp?=
 =?us-ascii?Q?aOXNPsh9p0eU4GUqRiQwAWGPa/Y+F50N1hpMH6Gwba6uHkKwMwA7duGfvJok?=
 =?us-ascii?Q?OJlI2rC6h0SpGFTcID8GJQ6nRw+B+gHtmLbrL9hv+RrAUiTYrvnQ2yuflfW8?=
 =?us-ascii?Q?Gcdlz/2i+HEP0pnIuUBQCqbAWRbSfs2UsqHSB3SV3odV1hWvvPkf2P9qerNG?=
 =?us-ascii?Q?ZpQxDxVT84Khcirw2BexWm9zYsUryw8B4jMZAfaYEobbyJNwnTP3CM/Qtb0P?=
 =?us-ascii?Q?pzQLAaRlnwLDLAnptZclz5CLkgJrlbyQWKx0cE9hKyRUIHOywXaGPBIPaFZM?=
 =?us-ascii?Q?sDUzCd4uD7XKgDWGs46oo54mIGNDpeeJxa4kt31bx2KMlOzmfEJerUehT+hz?=
 =?us-ascii?Q?M22VVL+sz1MnY5VHMOwCs+rYwOsIpLWZHRi4rhykI1S+T7cBNsuS6VqLmMZL?=
 =?us-ascii?Q?5TWKiI9Ne7xyk40fJyp4vVSzDnztjC/2Q5qKzXI+yMZiso6kdA3ZqBBy3Q0x?=
 =?us-ascii?Q?MTHsSvxwCdHFOMLYi0bQvDF2nYrDLmb5Umi/dalyHKquOoYAJqyPPYM7WY6J?=
 =?us-ascii?Q?P+1YrvqU1o1jIRfqubvtQBYXmOlLPDFBsTMAftT+FCpA/CWWl2AadCbtilTR?=
 =?us-ascii?Q?DJKOfdgw5zQ7q0mmQZ7cPvDJMQ42LsMEVr43RiYFDsJ4jf50rmlGzCOIpGA/?=
 =?us-ascii?Q?tuB1YjD9yR94L86NxyRM6sw6YSrWxLSD1uUTIGSozHWKvMzrTEPX9kg1OTln?=
 =?us-ascii?Q?QpFTx5JzvRauTXDV98S+JwmpIwj3S5kprUE4KG+DlCXEehvNqvMlaCzRaZKP?=
 =?us-ascii?Q?k4dA2fTXIo8CB1wfuWRGNbmhqDrnIT08lpJGeSYL45+6pVbhdzVNOJTKYehC?=
 =?us-ascii?Q?cSacuzjB34iMyMP8Fr9uGmXl6N0jKwE6IvCiqxKowsF3PJijWjuDCVdtbcfp?=
 =?us-ascii?Q?DBwfo0+j+K6YpEdUjClV95QW62+92tbU4Ahc42+sEe898dPWSEfezQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Okh60812fX1oREzNs/HwmWX2gL/liLOuaS9Hbk6Fy1F4tmxUI5dMYiLZ41mB?=
 =?us-ascii?Q?Un0mZq8tOSrNiE/1ruhK7LImDGn+IDW6Bl25FgsPwzy4SMPG5nSzeMOnMAIm?=
 =?us-ascii?Q?a64tajQXhI6qRYH5w3bbjAglwc5EIIxyw3pe+D7G07WbRmD5Esi+fIpOX9bN?=
 =?us-ascii?Q?TOR2AWWLlpJ2B7j4JtEVtCk2AM5BynFGVYzn7qpS2IcHFkXCG5meUu+xZu0R?=
 =?us-ascii?Q?BCS+QV0LlCOEW8V7AU6iPUJ1LCCOoeY500QXlIwKBkAxgjqjRAfl26kdInPO?=
 =?us-ascii?Q?L52TRko8zW7Mvy0W5G3zd/ZE1Ztca9jOGKBJ24Ekrjx2fxORxWaDFJHvGWHU?=
 =?us-ascii?Q?c4VTEBLLZW3T0XNJGZTQwGCCG8MXk883wewXziZ2XQ4Awgr7U6f+07qHWCX2?=
 =?us-ascii?Q?DipxOcgX881kpl5eNTAFWhKuFetqsprgay+eWjcP/yJJSHpBt3GOvHN+c84S?=
 =?us-ascii?Q?9aFf2NMc5W46bKe6LcEwkgJYDNlg/fOXuFufWdpcFpFVuZSe5flUpCVc7ev2?=
 =?us-ascii?Q?hBby+ZBQLg+eN9JIMYC8iVgqRjsj9c8xuy9lGd7Dx7BLM/Bt8xz8j/cJCf4y?=
 =?us-ascii?Q?aAZDJ5Qm7fS0gEHRizStJhEf3mCdKgNfCnusOBPfT6CMZzjU+42sBBe63mwt?=
 =?us-ascii?Q?4kHnPYq3edtXmvZyhA7IAyDzcnvCoFYE/Rm+ePb8oPy4MHoLHuQx75OXKk9e?=
 =?us-ascii?Q?NlQF8qKN64hAzIJdlOJ/SJ/IbjIVBjORq5Yhc3t8YvGna9azGdV+fDef9ShV?=
 =?us-ascii?Q?Nhv66ni08iTrV3Hp5HCC4UKClQAtT1ZcgQUtVleDkKKgoFRctd/61QALHXoQ?=
 =?us-ascii?Q?grbtAsVKSpWYBBQ23psPBSDUnTcSOJ9s6jdcvuF384DR2eofY1WfC0CiIiIN?=
 =?us-ascii?Q?KXYjqVDZGbhpNAhKiYkI+iMdccvGITEgBwsH8tvsd0whPsoL5WlZa0URtniZ?=
 =?us-ascii?Q?SIIBTkveZ+mUFYhJerOPQUTgpaYSNCH7TZpFuDnCGD0VRfHWFd3/pLMEgpkU?=
 =?us-ascii?Q?Y5U4YTt4jFNcsJ6gzqIxBcv4+rA8sWgX4bgUDo2bjzJXLV97OFY/BeYh6dij?=
 =?us-ascii?Q?wtFtrQ62siQzhuuZGtpOQOwAsij1uvU+PNM04P8wo16cJ3y3KgNgg52jdF4R?=
 =?us-ascii?Q?3pYthCXLDj8omTbtTbHPVm/DqaoY4PPL9Vgb3pI3UNalnX0Pe5M5VD5uwMcG?=
 =?us-ascii?Q?B/zlOebbGQYgqCTYatlj6GdyO2SfWNCOcBQQ1Xc62VQPY9NTNrWYzCcedm8b?=
 =?us-ascii?Q?th+FQ0icR5KCNV2r5kWzMkuRsrujNrSwiWR1CBX+TcJIhG0iZCmmtT8Uv/jU?=
 =?us-ascii?Q?K9KUQdzhBg8rVHsBUJL8YqlNIyp5lCSq7l8RUHqccnZdXWH78cJh2w72FAje?=
 =?us-ascii?Q?ush7DXJU3aqwoScN9TvS7//FQAIzwsSg4D8t+LDlUd7oRdsGIDmHcsNbf/5X?=
 =?us-ascii?Q?F6l7Ts7dyISGoODdIqEFu6d02cdL/CZzy3QHOoq8d1/a5nLv5kYLVmrq3BPQ?=
 =?us-ascii?Q?4Ib6Ev9wKhPK5unh4loLZR6u12crvgtZhejmPWz1oG6C+ngOPjovyYdEz5Av?=
 =?us-ascii?Q?YorIeA5hSGqa3ySvx24=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c3afee-7f05-47a1-55bb-08dd96d5e359
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 13:05:54.2929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ed2YjFDUfAhvaWZP3fErZOk/C0P1KlePHIMNYSTMKIwsLJj0yRAf9uiEu3CYEMbuDaXXGINGYZgWhy7LSuqd4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729

> Subject: [PATCH 2/2] arm64: dts: freescale: imx93-tqma9352: Remove
> unneeded GPIO hog
>=20
> Starting with commit e6ef4f8ede09f ("gpio: vf610: make irq_chip
> immutable")
> gpio-vf610 supports locking GPIO being used for IRQ. This already
> prevents configuring the GPIO as output, so there is no need for a GPIO
> hog.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Peng Fan <peng.fan@nxp.com>

