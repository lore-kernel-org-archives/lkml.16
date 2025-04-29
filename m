Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2054.outbound.protection.outlook.com [40.107.104.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5F2BF3EA;
	Tue, 29 Apr 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924273; cv=fail; b=DxQs8OojezNH2QB7r2KIxhJZMU5o8PfbzKBIHi5BI0epxf/yXYPYJj7XniaN7VJ9+qt9uxmkMZ6+CE0N/nGRIGJ8WhQc+RDv5CgxENNz4x9+hOSayYjQIbsw1WA27opHaIDc5cn/g3PZggOk3LyM3cddL6lAr/EmqrKLq8z5+bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924273; c=relaxed/simple;
	bh=/D+Yy4U/arvyV2uhywXyGqHR+CSqJ3GI6GkPpIUpcLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AZ6laKtLfYqV7mFtT1nLN+rarMKANVId/RjFVhXHhHVOkWnb9v1SnR900hZc+3osYBKF7phrPM4CN+T/ASc5e/SoD3Jom04Kg3XqUJNTNynw+gM/dF0VOabkJwGdetecusFZuGXj8NS+hO42s5EgkoZAVLAh0bZB7sDxcE4uWQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DSa62Dg0; arc=fail smtp.client-ip=40.107.104.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DSa62Dg0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pa7v74bUXMkb8Qd+bo7jTBW+pkZA3drxqxpgPrkAstoSQC3+SpcKhPW05lmLcPzRKEmJh2lnpAnqpBXstirCISMxCjRbIVheBng5wBP/+2yBIUK1b7yqugdvfi4oSmWW64mhIIHpj8Cn5fWvK5POL+gbzdiclLtHG2CzRsgLATJI7qtu4HSDnjIAHT/bBpKrZjEXk2yc/SL5UKWmXdLpkwgLSi+w5rB76N7RNuDJK93YJufSpImgglZVjDAA0mDH1M4x0vdA92BTuPLyFRVck8rJw+G/OEPaPDk0JWuUUeG+0ywPYvZAmyw/IArv8bkyp3es5KiTKo6gmT10dqr9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D+Yy4U/arvyV2uhywXyGqHR+CSqJ3GI6GkPpIUpcLk=;
 b=HJ1nCnS0w53l7VMc9rOLUblJTpm+0P5GJma4VgI1iGguAcK0FDinbjrSjfrRY5jTnR7O3Sk7HletT9lGp6znHnuoR6CsGeuoupP+vH8yVzoRQXhv5vY666DrZ+FtcZjFdHNnkIVm0rgHIxH3P/sXUYyXU9mi/bOemzU+vrag7Iy9CNZBS7uFEgIS+Sgjv14q3ouvQlTxB6IbGJ/xt3ngD+2N1g4vKRHvS57BOLmeTfdZoCQJlatZn6KV2pRyXEdyk3MctIjwHcgqTgUP2R4a+XRn23wdWRixlUbfNBZZwRgyInAQXwSsZHF63pgIaq0wChe7Ij8IiTK+jy2VCOr3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D+Yy4U/arvyV2uhywXyGqHR+CSqJ3GI6GkPpIUpcLk=;
 b=DSa62Dg0JXbdUN5qx7Or83fmzJ+uDRClWcFGMH2JT7gDrrH5pX/f7mjC77cIEvwvYQRMhtGHlKxQWT99F6ivS6F8304bW4nf5x62oVBV4P6PnkptlX7hAb/IsjRVsRu5TXPzd9PMrKDfxQozjSMX2pMhCZU/vkg2xL8dIXcn1SBUWRzjDFTD2LM0ZLA97N/te8lQlA98pKzStHzit73mlUecgkBrCGE4D5bDsSpEdTFCUWZQVVewmSr3tuoVmGHxa53KWx6y97HHdPruqA3tWk2kWt6bQPP4imMJ/fz0ztu5ux/B7adUhPQOa2QsaShDU5Cet4XLaR2aK6vJQxghYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9060.eurprd04.prod.outlook.com (2603:10a6:102:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 10:57:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 10:57:48 +0000
Date: Tue, 29 Apr 2025 20:06:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Add PHYTEC
 phyBOARD-Nash-i.MX93 support
Message-ID: <20250429120649.GC28789@nxa18884-linux>
References: <20250425064107.174548-1-primoz.fiser@norik.com>
 <20250425064107.174548-2-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425064107.174548-2-primoz.fiser@norik.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9b1b85-c791-4bc9-e9bb-08dd870cade7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PdDs3FbldAVdGsMuJHN+pzM9/FK80UkMJA32he0z8O79ZjSI/hTw39veHH1p?=
 =?us-ascii?Q?yfVI8WRQi08mruj+smEiEvFNMAnrhr8vnhAXAAVo/RMNiFRy3/dCgkneOKjf?=
 =?us-ascii?Q?L6ELMNwtjeb4ri34JDXrJmrgS23GlvYLnpwAs/q1Yc1sboYUvEe0ueBLCbbk?=
 =?us-ascii?Q?7LMfLD+Z/OGgeYO4RnbRoDyOPTUAA+8JkkcJLrJvhj2dMhgrDau+M5B9S66y?=
 =?us-ascii?Q?G9HcD87vN+MU+dtQ4iCTmKXaBHtObsl3PzcIANIAqeEiY7gOy9BUxPYLiA9q?=
 =?us-ascii?Q?DwlceBIdoViyLO4HTrVsz7gdrcopjvFBKYePklPC6mGxDkybPIKTuR+XjkZa?=
 =?us-ascii?Q?N01qE86hWos6uqP9ghYEfOrBteeFaz5OAJcZgIfutALIZaguSJqGDodMsLcP?=
 =?us-ascii?Q?J/U5LSmWxf8bspiNTc8KiNdNUADEaRqPgAdjGiIozKQE2uTvbBjbwBqe6GxX?=
 =?us-ascii?Q?iekyt+U3f5ss4GxH3mRCCIsGKFlYk1HR6DzhTUGBBPcR458eAsF2qbwXMXpz?=
 =?us-ascii?Q?Ir1TGG7wVXxeJ/fzJFpF41BSoH/ok43FHWIsUVcmHHOdXSkfbRJdB5PZHhqZ?=
 =?us-ascii?Q?z5eSEf8zGX+zxgLg4DuX80R+ryjBTqVsJkzaApg62AS77BkCLqZgLxO9gCRj?=
 =?us-ascii?Q?xl7cpjrwx/iwF7BDMDo1USn7DS0K4lHYBRKGzsiQy1JW12wHGkqr/muuvlNg?=
 =?us-ascii?Q?NBI5ZOgl0FSaq+DhE1z6oCL/uMcYmHBMpfiY/51q9rC/QKm16RnL0/3RhJPq?=
 =?us-ascii?Q?Z3Rh7nv67bT7Ip1ylsfeBZBp9lvHMbTe8QMh0jH97VWAoPWIbWO14JPGqs1L?=
 =?us-ascii?Q?ewk4LFTaQLN6ZCwyQf+xAx9GDDXsDVzs4mMeZFunyAmdE6z4bjcY/8/n6g8j?=
 =?us-ascii?Q?AlQeTZEZg6YtvAQIWsRehMnJsQYP0DDFJpchEMDwvkkPQjPGKRHEv/vHsusg?=
 =?us-ascii?Q?HQ94x922k54TYEFW1NW+VuJtUh13ponXGCEzdXvVuWdLHHLozWhC3QTZuJEs?=
 =?us-ascii?Q?Tx0+6ky5//Yl4RGQOpFFs42C06rDmPTTzCUlpOc2h5u4aR5IJ9meDhZzMUAm?=
 =?us-ascii?Q?k1PObrfVA16SydFUzGtwvLs0oKsnYHacJUX1YFyyIoUj/39xQe4FydwAoXQH?=
 =?us-ascii?Q?fAhjDGT2SJCkmBjWVI7Dfci7r/UnDrn0vasjz4odX+YAAm1Luc7OwCcokbb9?=
 =?us-ascii?Q?CovcVDHtW3E/OFOXKL+c7JEHM5ezW30n/CPzDqWsHL64M8gEuYptVbbvKSoi?=
 =?us-ascii?Q?8+I5QAuJtCOEHXLqdMFjQjd25GWvdHnyRJeDdJm2z1IfUnEbzeb/+D+zjQMF?=
 =?us-ascii?Q?QS9Z4h0acAy/9RMKWlih+apCo7KgY3+eTywmeXfU2aBEt2t/fgUADhzfM9cx?=
 =?us-ascii?Q?fOVwgwRC/8ZjWK5OCZiTxAb2hQS5NsJ4gt7bc4J+HcHDtKinUgbs9uELtsGo?=
 =?us-ascii?Q?OzRd4KkhAbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3noZahmE2GdxnXvsofXK6emNbSiQeApBvxSyLdI7MExFwlFxw25xra1tSXn5?=
 =?us-ascii?Q?iQOvNNPvAmECWbhk9sslSVH2Fdi5lirPp0ahy6UZA4B1rzOHNuzrVO0Jj5E3?=
 =?us-ascii?Q?Zeu9+9hUgKWYYcHQN9YlflwxzwKUPBIOL8tczXVAJ0U3xrgywKhiSedQt+9+?=
 =?us-ascii?Q?6AE/nnIcNLB+2T8Z3kMeBMqJyi9F8tQG95abZwTcnRKj9fNad9Xs82l8KDIO?=
 =?us-ascii?Q?2v+qqV9036cfswGdxrAuoFoQKvVNc1IQ9DmQXDXbSFndtd1I/w7exHox/LNS?=
 =?us-ascii?Q?/k5Pi40QDkcuM0m7/EyCM0AGL7Jimsk4NiLc2EsgzDxEYCQZbXUlwCA7xX8A?=
 =?us-ascii?Q?aXG3VmCtXwUWiu5mejddO/s8NXuzUv4rtu5FumwoSdGsvWVxQjiRCgort++N?=
 =?us-ascii?Q?qeGzrXTwRYbaFKcXJalZ9kBaPt0oFk7MU/o+dDmRHl/HkQvEh61PeinnICOx?=
 =?us-ascii?Q?SkBXV4esB3R/ZSY8Ar7bnI5w1OmMaxpNW4kpbEYlqm63yLju+j43Ce4gCyK2?=
 =?us-ascii?Q?rIn7lBUKE+8CK+YMt80D1CFp+megFm8kI9uykoV50ebhKTU1J4ZkDSTIjxVI?=
 =?us-ascii?Q?BseKfMen/0sjnkQSzUkJ5E/IRFTCPF/QdWoAjBICQNdtuFgfM2e7SM0k7b/S?=
 =?us-ascii?Q?YlgqNWzBGrDszMaC+oIYEMC3Jgs4yLGe/8q4YhtN9hwaacOGCeYlzdm2mnD9?=
 =?us-ascii?Q?AYkC0rar5GQOKmb6DQVHwSsvAFZsCSctrf8lF+UpgC+yqCqC/rb/yFSNFHMO?=
 =?us-ascii?Q?ebXojljdBIHuBOllRXzwoR919d/HV+PPxp03oOuprAqdcGK5SKrKTWmfnxiA?=
 =?us-ascii?Q?TUfW4lkpaWGIY62tJv/fbi5/pgbj8B/Pk+K1lbkceC1GAgoeeD69EoZkPnL+?=
 =?us-ascii?Q?P5PKF/hhmgaCP/3VM5U5Bj6Aqqc7BZa/Ga7NHvrCTki6+3A0EfSQg66v5jx9?=
 =?us-ascii?Q?nzUPj+mZbZznQQjsc6Qo3gMsb1yPBbht5+zhP2qxAThPDZBX4j9Yq+B0vabz?=
 =?us-ascii?Q?GlVG4mcRiI9GUPEmoDSodU1o/VWqu0inl8Gr6c7sQXg8LbiU9GNjGY3JNkz8?=
 =?us-ascii?Q?KemD6Ybaf3dQ9WrM+wx9enLyPP20a1N3KoHgcmpyikIp+7c34o2L/RcpUBfM?=
 =?us-ascii?Q?S0f6TGmOLjWKrWlL0ikD/C4kTwXhfCHTqsI2OA62unojA5uBFSFULXykW1jC?=
 =?us-ascii?Q?hnFGL0auXrCZ/Oj1p0jaU8DB0K1mkI01THzzQpGNJl3D3vRHA39DaBTob21M?=
 =?us-ascii?Q?s8jPf3gAE62xl8BAYlJ863sh3OdoQ9TUapnMorMItRiNDfe8UyrvC3lj/0JO?=
 =?us-ascii?Q?K/zpKY9AJ9nMqqeO9GDRjnsMVa8RennIp6Y634HXunkhxKIv7QyuoaShh6AK?=
 =?us-ascii?Q?uvbGkaAjaNggYeGRxh4LL8pbS6KzYOQ51m22JmuhR96j8I6iBTlUEPT18H1v?=
 =?us-ascii?Q?Flh7AMial49S3AjY+kZAxKAgBUncP9m3eCy2i1/BiDo3ha3XxRweUbC9Y343?=
 =?us-ascii?Q?xmhZhSA2VpBW+zl7ulvlLmIFLWU97l7qEWf9y4RbKsv82o/t6i9ymBkMngZS?=
 =?us-ascii?Q?ZtLx/JKMBKIdaTF/0ZHxl0lNiWckT0vtl8JeEghA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9b1b85-c791-4bc9-e9bb-08dd870cade7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:57:48.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AdPwgY76Nnn1b55xTj6CyA+5cnHAggWL1jb27NSHJQ0CFx8Tsrc0NcFGaru95wHU6GX6AqXpFSLLkAgJgNyMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9060

On Fri, Apr 25, 2025 at 08:41:07AM +0200, Primoz Fiser wrote:
>Add initial support for PHYTEC phyBOARD-Nash-i.MX93 board [1] based on
>the PHYTEC phyCORE-i.MX93 SoM (System-on-Module) [2].
>
>Supported board features:
> * ADC
> * CAN
> * Ethernet 2x
> * EEPROM
> * eMMC
> * Heartbeat LED
> * RTC
> * RS-232/RS-485
> * SD-card
> * TPM 2.0
> * USB
>
>For more details see the product pages for the development kit and the
>SoM:
>
>[1] https://www.phytec.eu/en/produkte/development-kits/phyboard-nash/
>[2] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-91-93/
>
>Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
