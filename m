Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062.outbound.protection.outlook.com [40.107.247.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AF282EE;
	Fri, 16 May 2025 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365218; cv=fail; b=jysBvtyeke4H5XldqhyxrVQ0ZTYn+7+wjzloQzoe65hLh68w1oFq88JdGwyXhUa2ky3So43hmSgPov4kNSXmF52AsgL+hu5oX1FeZapgnoFozL2XTwLuLLt+Yq3SmQV4XOsfWUhL6t1ZVdWHl5PdpkDQ02ztIjL5aNX06+9hvrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365218; c=relaxed/simple;
	bh=fy+ADRquVR1m4yTFCy+15ajVYm7kgZQIHpop2M5UBP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PJZf4OMZd5RL2Fga6Y09nQwHzD+v4EkN6ueiuHbVymCHynffeUepWnMO0f8wuVBFHK0TpxowAT3diJogBHBnLZ+NmUURZx3Dyid6CVheF0nQvINVSAzANl1vkxDDv5pJdXx6fcunhUBnIAFEn7RKqXLQ7Xwp4ZmI1o+JKT7KRpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oD9lcDeW; arc=fail smtp.client-ip=40.107.247.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oD9lcDeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHIvpvERulU9YjeZ4Q1Fps5cUA64ewB2yYnJpnLk+Shyah2IMTgZ5MnViCpE4VD/BRRJmm8MTr//bkRODGCHUI8KwIfyjOaatEi1uwtD3XTZ069cSeCF/fUcfNWvdew5QPX/hnh0KT6S5R0w6+QRnNoiUujr9G0N4angw45+oSALtV72eTkOLiezofAkyU6OFB4ACNpVz8LchkBr3wgVv07vCTlDlHPAb0Lpa2ZnWFs0oa3fDvLq7dJXCrvJaDa+fKjSC5hZgLOnQmtBfTyHlk0b2LSQ8QSwe74/84yoWEAhwBhVXgjPUUS5An9x+LKU9kgSpiFDkRqvj7Kar8K8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy+ADRquVR1m4yTFCy+15ajVYm7kgZQIHpop2M5UBP4=;
 b=WlvxcPtYu+N2ULCi9/u8Q2fTqZMpVesHT3KZ9DfuWylUZzKEEZYkFTDFy+KYo8hrwqA9Z5leMhK8b9fUK22hahkoq1ySQPGa10Hmiirh1oq8BiHr08iR6NLIEJVBQMSgBPqyioKqs53qlFcuTl0JPUVdR8S4xhzQ0kJsXXsWY4E/3HpefgVXh68r3bhdYlYjpLgB+cmvEZDB1AcaW2MCjy9hEmnybJ82luXwbkuHuVW+6eVi0WMNl7+ho6jCr0JUbDxFATGifNnjs1li8HCPDRxxmuazDcBeR2nOEWJbjZ+ABq8aAWuR5nOpihBYoDgSri1G4G551bs9oFeokWIvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy+ADRquVR1m4yTFCy+15ajVYm7kgZQIHpop2M5UBP4=;
 b=oD9lcDeW0e9qj1BUarBrYCWmqGnwiQr8VabTnwfQFo+dZagQu7ezC4KjPvsqhXFOP45jEyzku8S5Mr5sh4Y+5js9aSglTu4EQqiawA2E+ygEi/x1Yy+4jhtHGUTVlHApBny3lTnxs4KzHszDLYqzQ6xdqfU30SeSoDd+7paabkjc5BANSQUJIqymohW3cPLCNEVsSqrF1Oen7ec3jqu4+fUscnSCxrvKE4syM0oL/iag1fWiTeOFLSCm+HK0n+zQfmzC86iLVJRcSl5LcMsSkgN2SwbGhicp1ukmgMe+1iLFn8T4T6HL6EC1DdZ1Irot6ehE6C3doffOMX2PHR9mlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8291.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 03:13:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 03:13:33 +0000
Date: Fri, 16 May 2025 12:23:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] arm64: dts: imx8mn-bsh-smm-s2-common: Enable GPU for
 smms2 and smms2pro
Message-ID: <20250516042300.GF28759@nxa18884-linux>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514082507.1983849-5-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 960de2ca-cc3d-4e46-2807-08dd9427a43e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dtly6XtBNXdmVdiVs18xPCysktkaEe5qyeYhRt8b9W7HcDZhb0au3r22DMB+?=
 =?us-ascii?Q?DK8tmjaqGKrTzTgvxE6MtPsDqVyJ8bnfELkob2nRWkI4nIFQXNQkwi1UXgKG?=
 =?us-ascii?Q?Jlj4/J/ft8oHoTfeHPPSvJ2aC8mZXp2pXfVuTmtb7HGZrGomVpHfwbMR12P6?=
 =?us-ascii?Q?PENb1PeRas5H5QTcoM4H1VpXyKmn+WrrpZwjFVBXWM5JMGr0Ejx0/KtH4pJ7?=
 =?us-ascii?Q?JPGPQ1H8eBXnhN0/uV/CDzJcawvGAwdhLb7aACE1LtdecaDpDHGRfaxX6BAj?=
 =?us-ascii?Q?1Tp44z2QNCqJZLnQQ6WjMA/Wje0FmhUit+v6oFoeB+ALYOD+M5pvKlOcfQOO?=
 =?us-ascii?Q?Ijcj6kk53b6JwbJAFJXvz4zepKnyR1ChGJSZXQRz92h6PmbM/VtRBWRfLQvS?=
 =?us-ascii?Q?HyC3q+7mz2Z89l+MHShTMcX4hlLdKj94EwWV6C8naIifaBXSZtv9kE2Y0N2G?=
 =?us-ascii?Q?lKpkUoR9iJxceAjV5NhiaQ/gotXHnTacbFyaWZer3jKUIBsyfINCpgBolsPT?=
 =?us-ascii?Q?o9TcUMhB9Cfkg+E156qT9Fk+uqC55Is26e88ZBqv/LxuJ+sKI2AHAzIP4XE7?=
 =?us-ascii?Q?gpY9+LnjoCrNIdT0U6tNUGFS6A6Srh1AVGJBI30qLyyRBSf5ZiV09p1bnm+S?=
 =?us-ascii?Q?Xti+JvPND6Q3KgodOJkVsio3BPuYg69uGZYP13kBe8mAdcEfu2g1bS/+RPaP?=
 =?us-ascii?Q?DxpU8B9lEI6ZqAE5mcbCSQxOzQCBBV+IeoPuzp/wc6UOFypU0EIA9122Gmxp?=
 =?us-ascii?Q?nSWTf3y1tFm+JMdeL/px0UErOi7tp996W4n5X6YHXpWA0x9WBPghfJJDXs2L?=
 =?us-ascii?Q?8ujfnZzQofXbAg3mz7KYJTHifqoZUFna630EW4sFtoE8ZVYSDkzSeTLQ7a4/?=
 =?us-ascii?Q?9SMeVAwQLTjFFYsJRvQHuNeZDGV/Dw3GDBvDYLxjMl89ynEv1azNA6ehWg9/?=
 =?us-ascii?Q?PQ2jQgBh+491lmgaRCWp405OARUfslrrzIMq2Zw9jR5jWzMEn+j68KDr/74W?=
 =?us-ascii?Q?fnpOLbZr5hWt6VqsRFDjaWMKSX/pmHgflitbkrtuLPJkw/wjA0IuhgFE9MLh?=
 =?us-ascii?Q?J9PuHu8mgD3Qqt34dHWNE7i6nDHX6ev+gvD9Td6zEeiwz9zftawBDAGU/TJK?=
 =?us-ascii?Q?xLvMQ+236qNcMMOR4hisrmGAsfX2pJBumXAQcbqhGoIPR74B9ayi7UdqMLAs?=
 =?us-ascii?Q?fCPv1JZz4mVCbhKspHcQk1j5yxPZLZN8mcW4J+J6xug+ManBGmLn7UMxgocP?=
 =?us-ascii?Q?LJWqIJSOUjWuk6e3PGXe+LXfUXGepZ69zrvQjGyipkTdcl2DKHICiU4XTXhT?=
 =?us-ascii?Q?ToQUWpnL6NkUfKnHjOYiKcEsTxE8BVLYa+l70naznj41iYsoyXPJ8mP14Q27?=
 =?us-ascii?Q?l9GnNaZIwP8xa0ELV9QrRSPxwB3lelliJ/hR0ZFOYN2xQzWN+EAwyQidnOjX?=
 =?us-ascii?Q?Vh2fd5u7AA2hhZxPyQ8HAqYRkxg11ytUb16WzL0usbNqcQsO+L9TCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i7WMxFJZAyIW93a6dwbF4vuwFR3qq5BgNPiSPHmXDb/NuJvnwKptsQtH7v2W?=
 =?us-ascii?Q?Me6xhl0fk19zPFe7o5f5F1iRZMXGP/iOsRllxrWhppgJvha1e0x69BWPZ1UK?=
 =?us-ascii?Q?ggjiBA57fSTY1vFs0YS7GJEIvDxljN/F3IdR1+5J+BABjbeBzgA4kZKnqGd2?=
 =?us-ascii?Q?pVSJGRf/ZoZPGyccqNCFCj2g5BWRvsQvyTeie0lC7IGds8SF0VSkdKA+9ilU?=
 =?us-ascii?Q?WU50pzuwWtmC5nc3yuVHfDGdWhONjnP/Rl7vIwK0cJHZbOeizYB0++Ryidc/?=
 =?us-ascii?Q?psUykWDthibAM6k+IbXIkAUaDgoceL46sgC2MCddF7+N0bm6hnI5fIUXnPoU?=
 =?us-ascii?Q?aYV4lCzywqjGqwAuxDGSX1X8bf87smHgybDJ2+tvTjFDxXJAN97VtbYT4s1f?=
 =?us-ascii?Q?xjIyfdIZQbECdhj+A3kEk7o7moG3ZP6YowHigehUUYqZSX6DB0tw0rddAjeO?=
 =?us-ascii?Q?ZSB8CF5tvzJt+Qgj9Jkz9qZv37CaJwGEU5uyeLn/gD8f8xDyOTxdkRa37JW6?=
 =?us-ascii?Q?E16UZldNqOopnEEbvInk3+8TqbY1AErQ+vt39oG67Lfzk7zSNU3nB5WQOA15?=
 =?us-ascii?Q?NqFP8WY66Wwxwd8RolV2rEbFXdOysTrOLWM/pYFlSfxTLLdh41mtteMuQXPK?=
 =?us-ascii?Q?gcUjsvz//tQyU/ppiW5SxOdB77+J2fJeJkFxUomfOLCRYe9oVGKgiMJh/ubf?=
 =?us-ascii?Q?+WmZon7bouzrwUrOIBNqoML5yF0sBDiF4+rL6XBTMpxnHBs0Gbg0htxS11qU?=
 =?us-ascii?Q?IfSRUd9cNzbm0yAMaEJ3GRzDL0Mp3JusB2zNn6LzmS+KRdODldcyWbeI7Zrd?=
 =?us-ascii?Q?sOQ5xUE/p67oklz3bBhfUtktQpBSBfCYqHB3ZBX1AOmHUO4SKZktPFecOc4o?=
 =?us-ascii?Q?lmdMbrTGqouGjyj2BvJztcHZqIdVvZM5NZ6jAahB3P7Ik0maZlfNliwu65kR?=
 =?us-ascii?Q?xlqtuLc3Db3mPanuXsFQC+sEGcJrj4giY5hP+WL6oOkuWbwI52ahIty/tTyu?=
 =?us-ascii?Q?0NcrtgYqqHJFCylHnx6Q4RF83Yn0x1KmLjrh6nKsAFz+j7mhTucjNO9sgkvp?=
 =?us-ascii?Q?pVLCsp4A0Ui0al6Y14m6OGA+Cwbq2a6Ceo6TiZ3r3UiI5RES4tR6Pj6Ux8oG?=
 =?us-ascii?Q?0fxDOlCYMCV4+yTd9JOXN+YyOhnrxEwS596gHNW1LipibcLV+h3BtHHlJsQG?=
 =?us-ascii?Q?7hUxxgxJPCjT86+0ZN3oIY2BUz9CxhmESaBqlhi9pFPtoovCmumFPtUt71Lb?=
 =?us-ascii?Q?Hbf0Vc3mCExDPPRKpVtqPAF+dQfVsItQFAPWWC1OY9uURpQegcJIDVlSxVdO?=
 =?us-ascii?Q?ILhNlGQSjgHhWav/WSp2xrMuyKtjV44qRRzRRLCfLbmC76bz0S53lg43w+M7?=
 =?us-ascii?Q?VaC2WXitt7zHPfaqGAbLtU8TP3k8vtNCgMggFawnG2GDyEVzEk2uVUomEdVS?=
 =?us-ascii?Q?VTycs1KEWHpDEq1n8+T/RNXTWWGcmxLAID7GXpOOPVv6LoL4qRKV2xDQ+S80?=
 =?us-ascii?Q?acLsEC8Bm+39nZoQMQaLUxMdiCnDA1mPf/6SiaKneZiSYga1es7cEATF/T8j?=
 =?us-ascii?Q?UIVeygdJJE++XD0l/fIK5W2tivD0XWQYbdvTXh7u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960de2ca-cc3d-4e46-2807-08dd9427a43e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 03:13:33.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nbuF220YL67he8n4j/VU7FTn8x6yRlGqRc+1F1dfXXRw0jG0I1r1vNhuyGUbxclWgVZlSGu08jpuMa7DrmYlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8291

On Wed, May 14, 2025 at 10:24:58AM +0200, Dario Binacchi wrote:
>From: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>
>
>GPU is enabled in order to use image processing so it must not depend on
>display
>
>Signed-off-by: Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>
>Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
