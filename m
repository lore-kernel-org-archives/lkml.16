Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18CD1411DE;
	Fri, 11 Apr 2025 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381835; cv=fail; b=bxE0m01UCG5L9Z9Ajg3wxLTIsMA/T6IQh6vMz0TFbJpyU96Z93QObbXzNW8b0EUV2/fUKHuhz9VvMjbFPe3f7TdyTgA+MSoF/V34/c2ZVwrVZ+bX1n1KnRFnFt9mSHsJkrSgQIcAAO4XgxyYZ+fWeImg3S5t1ENUO3vDhYcZMU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381835; c=relaxed/simple;
	bh=aGb+tJtpsuqjdMneozTFJv/I9tsk8dzUOk0op1x0diY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eVMit1d6CUKiLoiDFX9xscECN1t6TV4aWnPo7NgglyQjzt1H6C7YZ2BLOQHVuPQ/yzNS6dIKsVwfP8DX71bQEHek5FXy9zi1beAsvbIj9B8lL7bCN5Ys4VT3YZaRuP+xnGC+taSkNFH1Y2CfsRgtOZTvQB5l3FOgSuSimFeNOHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NfaumqYY; arc=fail smtp.client-ip=40.107.21.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NfaumqYY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOewWT5XoOX834B4hGd1p5j/hVgCLsz9YaCy13uH6FAjST1miqx1ze9JGqKFnmTUKYlrW0l69tzF/iTa9p53764aJ3NYii9JRJ4DRIRIdtKOVnAbGiHZ9/cMy/7d0G8tUctRUkRr/bwIZintLcFzwDcv9nAyfErNmAuJ7mwg82wDHw/q54US6ZzwFaaz9hBLDUkq9Idsi2edPdHLpiaP+LRGXwicPbvfUyH8YcUDo9GaLt6Z3icfF4rpcWyT/okuE0T1PKc1HIIKCck1fPLn26JRWLMAIicqMqWXmWlgLUvqMU5oRc7+GFFRm2G1TCNOGQE+LfHrr3qXrWjBzxD2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqS5RWltBb+chmuENNPZoiu9jz1Tbx3yucFbBwWInOw=;
 b=X6pBqQtvDym/YFNAu0hXP/Kr5n/sl5sK8RlfwOO6lNdlx8ullg0oWzk+D3wKbhO1G7crdajoUUkz3PO2CkGNaat61Q2ElgHH1dQH4CLiU+chUvTcaMyor2g3CujUxTX8GWkCFJeBjQ4uiesdOu4yDzdDWxE6gqcb6GxUHsb8mSUsAgN2eeQTGoH40awGXK/vKEBorD8/A4+DN05KqOJg69g627PvZ3DAhCA4ZzwGaFWNinRNQYS4KeBeKo9t989Tv64xnCyGcTwcwk+SHAhgPRaGy1G3XczWultVUJx7KQ9EpyxdPG++ahe3kZRh8qbP0e0+jur2B0DFK0ut6G0uyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqS5RWltBb+chmuENNPZoiu9jz1Tbx3yucFbBwWInOw=;
 b=NfaumqYYGLUVQ9rP2c90G3POTNvNglWeVX1bWlU8IxMyjX6stDqramxvsfPQgvjG/G7gPADiJ4reDAS+2sn157qla0otlcnd3L9AEZrScIOiQ+Z79iGu3DgG+id0pTFifxvk/VC/pzZwzBYADhQNwWtzMRmhWk544Gn5K1uTw5QUKVsEpP0N1h+0yEx9OxPyfTU4q2MhuRaNA8Khne7cgtWm6VD9GULA0ESVABZp5Uk/HggmY/QwdYRtVNRQ78qAdOwJEUjiX57dfJ53mLZX1irojkAk8Sfk/9h4ONEfkbq3UAvDgTygbbZuNy/9hm+fhRq0l/qqLs4MxxVu4Qye5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB9294.eurprd04.prod.outlook.com (2603:10a6:102:2a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Fri, 11 Apr
 2025 14:30:29 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:30:29 +0000
Date: Fri, 11 Apr 2025 10:30:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
Message-ID: <Z/knehHQeTTUXgr3@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
 <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
 <ef74e49d-c413-4719-a174-42df91384469@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef74e49d-c413-4719-a174-42df91384469@norik.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd860aa-43f4-4680-6c9b-08dd7905689a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0JTc039iNEa1bI48hrhWWcrGJUl7HmUQAqnjWgzlaDnvPv+9R3WlWU8cgZnN?=
 =?us-ascii?Q?geCGToUS0MjqlYh36WVK5AXrYzHAz7fHrczd0d8WF1fXkBP0BXvdlKSWO00/?=
 =?us-ascii?Q?ojBfon7Pscgh1rF6n9XhFBq93U8mk9y3UaFxdWEL0wOKJ9/GrkeN9iHfGw2U?=
 =?us-ascii?Q?7ic9lkb9jfPyYRIgpCbwialZmwHzLcrFpmEHZTr2R9lQIfGz3rBVfnN+IUe6?=
 =?us-ascii?Q?War4xgFHC8fIAsIBx7ChMKuJH4lnzuresp4LzssuSAVk5ymAD9TJMag+GVp0?=
 =?us-ascii?Q?V7c3BVizDXbKtp2w543vNUQZUCuZWVFUxoHp6+WjwRWolzZlLs7jpQ3Ei7Ja?=
 =?us-ascii?Q?On8e7fH5tG0FU6cZ4mGza5FZluyiYgfGx2RmsCcvQQjifkSR/8zoaIxMGR+Y?=
 =?us-ascii?Q?ec7zOE4o/y17MeVN9bBBGgAPHhgz3+5dA8ZDgflES3+7oHAChdEko7T1tYQb?=
 =?us-ascii?Q?ik5DYoW3+EpsXXEXA+Xp6naDLB7CtYiEtE/w5/v5UcBjcTXWVZwo/m1z/Ue7?=
 =?us-ascii?Q?uqW3q6qRNXJVZ33ZXaOcD50GLH2fXDJZi2CtpaDsjR7DKdCMPMHbXFsfjMd8?=
 =?us-ascii?Q?3hbdCJvtjgr/yvkEVzzHZhMr/0IHJKqXpCNa+sGGXYwcExJY9BSaM/0xOkSa?=
 =?us-ascii?Q?5qu9tS82PCi6i34uec+Wa3QqDDZdkHRk7LK2L9lAJmxOAsx7kE3611Lix7Th?=
 =?us-ascii?Q?t6XduZ+MWZYyYnKpcwCBfyEtql02m7vQlh3VwvPMiYNuqxm2mf89dW3K49x0?=
 =?us-ascii?Q?pANB62/gLoQjR1rSRZd9vWRLxlDQcrkAA6WCv376RsEEZ7FW1fMToGzZ4iYQ?=
 =?us-ascii?Q?n8rJYdByYBoa/mAojQ87lBxQnDMOnxxD54amgdgJiMKB7qi4zbsugDZfxtPW?=
 =?us-ascii?Q?f9qwObnxo1yogU4cK4cmSs/V+VNKWOYBBTVCsKaPMVyVoWhopvG5jluPi2Lh?=
 =?us-ascii?Q?U6YK2nRnQtX3dPgwXOpkR+1JO8zR8UnYRRxqzxJ6rsNYDW+SgnWstJ9OayHw?=
 =?us-ascii?Q?Fb4h59CKMFUu5waEJnGbf7WT17rzdqyzs/anyxwfW+/v+/8Y84wNVFBdjE/B?=
 =?us-ascii?Q?AuqUAMb9Dgb3hDPpo1Vf55PIO6tnjM4bxrntYl3iO4h5CXXftTGEYRP2kQNt?=
 =?us-ascii?Q?cQH18WrKzUgmtTHsQg2k2djYtAHaPJmL/8ElJ51Sczp1uzZod87LxDVGTnsJ?=
 =?us-ascii?Q?v8ro2d0l/1KPC2Y/+t3P/Een8iEA9FwIEpqjf9SzjVX3BOeQ+Qoj75byllbR?=
 =?us-ascii?Q?F1MPF1VUNb+1LgaDfm/luQhl40zbwd9mEBvYGV9ui8Zb409sPr8XbzYu4jt3?=
 =?us-ascii?Q?CPIU4YWM7Xwu0YF3ru/VPTd1expnZTyT5Csinf7RkSTXhD0H60fjORhRSa+q?=
 =?us-ascii?Q?xUvLS8NMnt5bLub2L41I9PYXjK0IHidTnk/96k7lXrgYK5jzYMKB6vOxEHAd?=
 =?us-ascii?Q?mNF7Id2Zt7KnsI5chNS8kxqP6kYDLGwGrPzqMpdcvBBA26hp9GnW/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ylNhNfwd+feqGaJ3iMewegoOiPEFPrWQkZJH66XpXu6XNx3FwZQcW+GCK8Q3?=
 =?us-ascii?Q?VMs39nq0VodMyOUc6/yaWx94Yee7p3KlSpwHkjvS3I499RzxwNqzJxZZrAUI?=
 =?us-ascii?Q?BphbkovjF50SMBbCSmZMR9tI6ajmjCY0afE/8Y7RoSYuQhlI+92c7DFkP01v?=
 =?us-ascii?Q?1rDJmGfIF3Gv/Hdb+yttJBfHJPk6ZnDZK1+rxGt779k+fvcGO5xNSx5Mf3BI?=
 =?us-ascii?Q?5eavG63SECYej0S9+hm2sWK7HS05vKUQjSirbX2sEgjfm5N9n4l6d3fm1Ztu?=
 =?us-ascii?Q?ROXWUxsdMGsb9lZkgRZCI56CuEgng6LiaptrUAB77a7vOsdXGzGBpijHyFt9?=
 =?us-ascii?Q?WIXs3kmyplk0hL3xFcj6zJGikjUlejeNXzV3rqQpjfOL4GjFX9XfMwBNf8JP?=
 =?us-ascii?Q?0U6o4xstvbCXNgrODQ0KAD5Z5K0G2afgZnae1q22CeV+MymhZMmszUdbIdAR?=
 =?us-ascii?Q?8vk3HzH34Wx53c3br4CiMx4wY7VUpoThQABZ9UeJfpkgheF0QygZVq4dIJul?=
 =?us-ascii?Q?Cq4Ev4xygFBYFeze1auNxqyElS4oDc+zxsXJom0lTmqEjlWh0fO3kXJu1cJo?=
 =?us-ascii?Q?XgIlDcVl9kjHQAJZmhHu7URgJc5Aczi+lEXJECXKuDCLHRBtaHqeVKKgxzkl?=
 =?us-ascii?Q?GmyoXJsE4K0Z28nXi3TXUHg7JY6tmCR62Ai1p1H/V/JxwagKt9X0wGbQP963?=
 =?us-ascii?Q?NglMMV8xQhlIExoEZRysNZsAqmoHpG1Gwwkc2xzUS4OcqE3GsLeIQFNYQxe6?=
 =?us-ascii?Q?4onQ+xIv93ianOjAq2Ab+iiDihw7vdpZiB6u/dcVNX/khMnfE+Ws38Jic17q?=
 =?us-ascii?Q?W7gf8QqLHM/N6rLMvMabH0LYnUTyo0e2izmjQU75pb06aZ/WXqSGBbSBchpC?=
 =?us-ascii?Q?X7AkkmGJ4isQ8IvEuQxEf69/gFroNlxofGNi91Va01WXOk/pFctr4qd3S8mG?=
 =?us-ascii?Q?jdChyW1o+oN+JPvUBZxKkVCMa8sFWbDNLBemgQUe+99+O58pA7MTacNDNidz?=
 =?us-ascii?Q?6QBlv44AnG3hG7+OdFlYeoHJ4mrBuPZBvtiXARXSzQrlYKZj/AA6WnJ/uUZS?=
 =?us-ascii?Q?IzTmy3txgcLALtKUMvL5aMSMb7R59NCAEnGme+gfd5WMWY0vjdkFDL6qGvk/?=
 =?us-ascii?Q?VUWHyTbrCo3JrM5GSL57oe5JNeco6oSQCABg56Zu6q9+dJguOHkjdW/fnS2y?=
 =?us-ascii?Q?0KLO+575VUpOM/PKQM8RSHYu8C0fS1amCoBs/OpskCXMhdk7aOBKIsbwuzJl?=
 =?us-ascii?Q?smd4CrxgVeINx4GrhKU8hBQ+eXE24URnBtNkuOHF0RsM+s8yazDNtijqZYr8?=
 =?us-ascii?Q?SldF2BD8Pc9zrDwpmUT7ZBDJaTNhp9UD/X2x0o07CBeUw/ZEPUwDE2Q9jLu1?=
 =?us-ascii?Q?l3fu8sDKQiUnNRuDmKcGi7l56aDfGVP+CFvTE04Ke/AsXrbR8wByL5Hb/jy1?=
 =?us-ascii?Q?GXeGJIlBk1e5uYq0JR3yEKY1At5J4hYyDaTgYMixEC3c/hGLf6j4oR3fo4fv?=
 =?us-ascii?Q?BAxtVqgkTgovEduH/JQlnYywfSYcAx7XbY4FiRbi4cWcxDGWsuYLDsBAZL21?=
 =?us-ascii?Q?BQ9vzzjkgHGYF+pOJGnKOeq72eFIB1Yr0J9fS9vb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd860aa-43f4-4680-6c9b-08dd7905689a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:30:29.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHWuPdEvAFELYu+kDM80bw601ID9Ij2NkkDq6oD1W9vuOp1MN60fbI1OOCrIoOrOwVZ2LIPIrtd25w8Ese8CWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9294

On Fri, Apr 11, 2025 at 10:08:21AM +0200, Primoz Fiser wrote:
> Hi Frank,
>
> On 10. 04. 25 17:23, Frank Li wrote:
> > On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
> >> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
> >> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transceiver
> >> chip.
> >
> > Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy instead
> > of use hacked regulator-flexcan1-en.
>
> Sorry can't do.
>
> This doesn't align with other i.MX PHYTEC products using flexcan such as
> imx8mp-phyboard-pollux-rdk.dts.
>
> Even the i.MX93 EVK uses the same mechanism.

I think previous method is NOT good enough. Suggest involve CAN and PHY
maintainer to discuss these.

Frank

>
> BR,
> Primoz
>
>
> >
> > Frank
> >
> >>
> >> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> >> ---
> >>  .../dts/freescale/imx93-phyboard-segin.dts    | 32 +++++++++++++++++++
> >>  1 file changed, 32 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> >> index 38b89398e646..027a34dbaf04 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> >> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> >> @@ -26,6 +26,17 @@ chosen {
> >>  		stdout-path = &lpuart1;
> >>  	};
> >>
> >> +	reg_flexcan1_en: regulator-flexcan1-en {
> >> +		compatible = "regulator-fixed";
> >> +		enable-active-high;
> >> +		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> >> +		pinctrl-names = "default";
> >> +		pinctrl-0 = <&pinctrl_reg_flexcan1_en>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-name = "CAN1_EN";
> >> +	};
> >> +
> >>  	reg_usdhc2_vmmc: regulator-usdhc2 {
> >>  		compatible = "regulator-fixed";
> >>  		enable-active-high;
> >> @@ -38,6 +49,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >>  	};
> >>  };
> >>
> >> +/* CAN */
> >> +&flexcan1 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&pinctrl_flexcan1>;
> >> +	xceiver-supply = <&reg_flexcan1_en>;
> >> +	status = "okay";
> >> +};
> >> +
> >>  /* I2C2 */
> >>  &lpi2c2 {
> >>  	clock-frequency = <400000>;
> >> @@ -79,6 +98,19 @@ &usdhc2 {
> >>  };
> >>
> >>  &iomuxc {
> >> +	pinctrl_flexcan1: flexcan1grp {
> >> +		fsl,pins = <
> >> +			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
> >> +			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
> >> +		>;
> >> +	};
> >> +
> >> +	pinctrl_reg_flexcan1_en: regflexcan1engrp {
> >> +		fsl,pins = <
> >> +			MX93_PAD_ENET2_TD3__GPIO4_IO16		0x31e
> >> +		>;
> >> +	};
> >> +
> >>  	pinctrl_lpi2c2: lpi2c2grp {
> >>  		fsl,pins = <
> >>  			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
> >> --
> >> 2.34.1
> >>
>
> --
> Primoz Fiser
> phone: +386-41-390-545
> email: primoz.fiser@norik.com
> --
> Norik systems d.o.o.
> Your embedded software partner
> Slovenia, EU
> phone: +386-41-540-545
> email: info@norik.com
