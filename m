Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24261F0E5C;
	Wed, 16 Apr 2025 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814497; cv=fail; b=EQVoGKEuLWwahQHGBL/7N900FqCW8bW+u5nq//EeuIuQUPVBQdAlwp87dfkhebhV718iD/sCM3E9jOY2qLJtGOpqH/o9hAcWMIV+Mk05y2PCMqMc5q6kyGrzeQzzVQBiA6TwkzuT1wWoTIibVvDEP4slr1aGvsghp2aokMkioYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814497; c=relaxed/simple;
	bh=RCUtM+mC7aL/iANpgVdmIqbtK2N+slniejGMwqqLfYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KK82/WMApC1RBZYyhe6gA+9Z9mW/KAxObIUqGhxxMgh13AeQ39dNd9wLmO3+tTuJI1PKSHkfmoW/NwFjfpNqVEZIFhFdZzYcbO5hmlyB+memQc0/giAut5UtD+MQhREBvGhI1cUBEMcS+e9bEExGMLPiLCB6SIobGpj0AwR4Ygs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i5fN+rE2; arc=fail smtp.client-ip=40.107.104.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i5fN+rE2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkQSr7TRsoos5NhtTUSybBzn7AxaKn1Df/88cUctxNN2+vFc6sbtLbUqPD0AqsoeDHc3NdmV1bpXy/j5mXH8JcZ6Get7smMGJpBw2v1gxsQN4g71NJzEEEvpYKXNExm+GvgLd5dlhsxDZYOckTpq0lnbLAnm0aYCEmIHrQgXt3IVLyRntkMME090XtFYJ3degyBJ0OS2myX50XaJsH+jNLWMW18fUdxNYZhWeXER62grXiit2ABubRULwDuWv9+gwnnGVctKTVEzLzXRf7VgzkqsY9gxp0lRw5dURwePCHeZNnhV+GYcrJMSw/PJHOeo0JZJzM9qan4P1jcO9a7mEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4xjhhHD6IaQfe414oTA/T4jQsMLrjUjTBOV62wzMe4=;
 b=p2O/vErdEtr+dfyRKTJ3Vh8jogDx7Mgt2x/hmhiy4V9mtom8OGFbKY/PZYVymTSloOwE4tgIUyf3jNZMO0KV2JANHIe8j5a6WOw56R6OQ3qqKa1zx9ZxgrvHYc+NzF3GGSC+qmHN+wldWcPvU9KptpO0dRmYzd1KWHPFA/ZBrYXf3pntGFzkPqIxefzqCCiWJsbtD/u5tca7zF3sxAxM7IdRLAXxWgTGuuuH2eJwh8wi4ED2RtJyGsWOTYJz1KY0VwmyEeJ/yQ2SkXdhD/snjNsx4WaBF2fWLQN+XLziLeZHccBVrfUfipolkDEuEV8ODAC16c5UQ+e/FLjOh9iVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4xjhhHD6IaQfe414oTA/T4jQsMLrjUjTBOV62wzMe4=;
 b=i5fN+rE2saSoFq93jT6kzT6sAoCHqO93/C9lv/pmfbmZsjD1qzH8EuJEfV6zuTEGXmfnZ6vTbFty95e0KWqZYm/M+OaqB0yn0UK2UvSLUSw5aWSle/OVwP27za7QsOOTO5gmrHKTeAHuiw7E7HLbIp0qjpsiS8sTAUdkNwgBr7myb59gkH5Wp7Q2BdmWpl3w0ADIKSzrPF71RdEeOZVCLJYdiMfOUnlu0BKUGLWkl5JpBfmwZITAMZkA3Xlkil7m8P3xSiB49+2zklY2P3EoIz4gmEbOINBIffs0Ek0GO8IQuc7egsxmFmCiyV/tVS5D0R5kITDrDp2MBPcQ0L5uGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 14:41:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:41:32 +0000
Date: Wed, 16 Apr 2025 10:41:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 03/10] arm64: dts: imx8mp-beacon: Fix RTC capacitive
 load
Message-ID: <Z//BlVKCjPabulY1@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-3-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-3-aford173@gmail.com>
X-ClientProxiedBy: PH3PEPF0000409A.namprd05.prod.outlook.com
 (2603:10b6:518:1::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bd837e-79e8-43cd-7337-08dd7cf4c819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q/4QTZnXOd+uDSKP2BNVPjXU1XFO3NsIBRHt1f5sBMdTsSUUU/eehtC2QsB3?=
 =?us-ascii?Q?yG+YA22dAbIFxzfrAUquX/z4psZSUPQ+mj/Fxo7OnRh5lvQzA7YgKjkKAZMO?=
 =?us-ascii?Q?p9E+mNBpKWEO0RxvhG/LxRNFSqX66mIq6DFYRL4dwkVz6vo6MWZX6hKl4QRK?=
 =?us-ascii?Q?FHvyVtp61wQAPYcZFucu2Tqz+CW+gHbA+XEVNprCU1aA+jyLlQzpiewT/VB7?=
 =?us-ascii?Q?NaQylThetXEFdCRYEdEbFk1VA9lkezZ0t9yCXw5S2cLb196IVVzaB1xaBmWe?=
 =?us-ascii?Q?Y5a6qGrAIBzC6pvwx6MOP5tk9oHMrAQZPtlrMFxeaC0ZjsKnztVgnDse3Kyt?=
 =?us-ascii?Q?KjT8nepH3F0GD0ae1cnTXF7HLTV/KIhy+qEa+wutsHgHG29uUDh3r3grdsPB?=
 =?us-ascii?Q?bDgvxfpl31DluAbS7YJzVYHl//b94nNrQwnSbO+L/kiZk6c9pn7Zhlw0ebDb?=
 =?us-ascii?Q?cH9+2tFWaDLJ21ER2ZfYtF3hTOM440X1TnmQFvRajzWcbbzjodOb1y/Gn/8u?=
 =?us-ascii?Q?N5bg3Ur09IApNOAb78zQBggag6GL9nlk4feORs0PUp/xqe22HJWqo0Etp5T3?=
 =?us-ascii?Q?uQgIkf/HohRuwbtsPwO5SQI3OuNKTUrWy3pRWc6C2GujHEfTFBCPbKSiaaka?=
 =?us-ascii?Q?dR9GI9YMhAd6ghc8KIa2nrQM/l2KM+8JImf+2Wv2sZcAO5ZpIkf12dhddCU9?=
 =?us-ascii?Q?shglTQut3nJaGPGiPRIE8nozWwRmZ2AaX5g3Z5iPE0i8mXquHb9OC+8PzCSJ?=
 =?us-ascii?Q?YGJVPVuTENkXdD/J7+RT5Y10B4FpnQNSRS71cBQTMLsark6Ca8gqEzDnPKnE?=
 =?us-ascii?Q?ei4FskGX2/iPplGwZw9FVkmBaqgIkhT+DXWifuSn08potqZKQpa2RSvyUrVh?=
 =?us-ascii?Q?rvehDx4L/ERrLjCxlpjeTi2t9Fetpwm8+bR0r7MZPXlevKFXHWaEuK+du8yY?=
 =?us-ascii?Q?oiD2atKiSmZn/1sfY6AkE9oev75ywhHf/y8F686DvPMxgeeF6MBKDetTersh?=
 =?us-ascii?Q?IoPmK+pnQRKld4F13uuGz4UPFvEuyb3sg1lJJL9gBE7h33b19XP+T8AVNL91?=
 =?us-ascii?Q?8t6Yb02+3tAPJy0/CU2JfAuYY9eEaGNfw02yd5kONAhazpuKnKsKOlxh6Fbs?=
 =?us-ascii?Q?UPoJQq522cpWgFZdfLJjqwgCW99iZfMM9PPvsNmJdXIvt1N/GOJJqIH1gxea?=
 =?us-ascii?Q?ptG0aeLup4cPCODihcNE0lD6EJUf6LhlWTHEfwwM9gGHWVzcDS5gJzHjh/e5?=
 =?us-ascii?Q?oyA1bNU9v0otjvi0x9ccWTIcclzmV46OkaKiGOjC1MvHADB70lcz9ueCQjMY?=
 =?us-ascii?Q?RFHf69N/UTkZomarGHRbD88X4tKOd1yx57DyRkOFEemEAppda1ljoRi7FU4i?=
 =?us-ascii?Q?efzBa8FFavYoI1SsLiAkcMNnkYQ96JlpnLrOQZzx4uvNL5zYVLG92q6lrvhq?=
 =?us-ascii?Q?PCd7OGWRLqX5V5G9RKC634Pwsj0VLfe7Z2MoY//nn9XWAXunkWetzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?27AkxY1k7AfG8KimhCrHnzU/w7XTK415fH+vfPwvPX8WDCt9RMCScmGJqNQ4?=
 =?us-ascii?Q?FeJdzssrGuoMLLWhquUv9BIg4mL0JU5cBgVxZx7ftdpMRrZ+79E0P2bCrLH7?=
 =?us-ascii?Q?7Hg+0wbCT9ZTGAAUlsjY7ZauNRBw0rdAq+vylTtrlZ3V3oWK/GxHw236tebE?=
 =?us-ascii?Q?InVvUl5YxoJJrcgcCo6G9iQEP9ZDTikamKw2+d4p2zezMrM8Qk4igtYMxwQF?=
 =?us-ascii?Q?eoyU6GOeskESb+yF1ka251jkJuud2WBRC9y2IFjwnpt/hhbn3hbQsM4UkkOq?=
 =?us-ascii?Q?JcbSMGkGPgU80PN+9wqTmAGMWzcFNuXF/KuP2FCVEyeV3zxEP9vXjzOy1IYu?=
 =?us-ascii?Q?sfW94oRtjdand/bah4JOw0nJe/iMFyjdXfA5zBMyqBBVJ5Xkt81/nCVOkhPE?=
 =?us-ascii?Q?EPzioHHIWdbTPYKqHtnwELlN7uA5BvVMSqyieTnkS4DUeNJGwhYfaubnJ69M?=
 =?us-ascii?Q?csbeXAKtnUyp/tBnHOBbiZCxL4w5j72ZzwjLWiXZUtXy9i70guwd806fu3e1?=
 =?us-ascii?Q?vwtrD3WHQfFnACTZsX8Q3kX94q4l7xtcGdRYkKvVJZgZOUwz+1c2mvuthzfF?=
 =?us-ascii?Q?9nxNFguMYkW4rI3BRHIa2FOYe9g1zIufeab6XDW5h0mcgJ8hgyrZS7A+npxE?=
 =?us-ascii?Q?zteVaeSeX/fyzDjJ6p5L4xCg7hbu4bci5WCgponjyVx6D+kPeOwCJGLCU5dI?=
 =?us-ascii?Q?AsNvJmjuBghRM8ns4i/HxkE+KAkU1lniW/tlO4ktzpd/8YSp/qFNV7IWUQHX?=
 =?us-ascii?Q?otyyJs+DXoXG36psFAmpWBE7MXkWT9xvtenRx6dwtMpONxO1qeOHQvCTU4JS?=
 =?us-ascii?Q?2n4GJtya3CatSGhV2KHDsGCuGTt24bSuj+yd62Opl9ku2vKwbLpMYckBiU7d?=
 =?us-ascii?Q?KXvWCih9gijUD6WOzf/4jGdwdZfDvCZIlEPPqhXmtiZoPVa4JYvMRWI1Hfbu?=
 =?us-ascii?Q?iNHm/XEHt/W2CmNFUCzGthVg148GJ4cX6zzwfqK9qNnazBczGUjJyz3ff6JD?=
 =?us-ascii?Q?AUDQgp4diTuujAWDQr0HoJOE7GwBeqCQgVab3WIy++hcsTlf8TMJOMZR2Evi?=
 =?us-ascii?Q?TjF5dmQVCz8u2bNLm5xnWEQNrD8qQtYzSrSSuwnj2cLyv7VlG/9/Zepauwzq?=
 =?us-ascii?Q?8CEOsPEoJLNKvAdJnYYMeeq31QfwM0mbpYj9uIUOguiVQHwHU5IAJLeBvb9m?=
 =?us-ascii?Q?+XeGBvclpB9M/Og5vtYiyqurlVwJA+vj2dd2JFrzXSaWQaLuAmsKB9Ieioa2?=
 =?us-ascii?Q?EJDaCmivH2WV3I8RRKqv1SD0oixrsGQ2wk53yVQ+YAmHhEmNKdQTTAlH0AO8?=
 =?us-ascii?Q?BTdafVWW2nMwyGv/lcLuXZykwQbRwlmx8k1AGnAjPzgWr9qzhObEw5KcAJjc?=
 =?us-ascii?Q?z/fXk4Jl2NVLiju2rMbgjiVuGvwARQzYPLCLnmE9auabtWD8IMikkzXA/z3V?=
 =?us-ascii?Q?udsSeLTh21Ea6RWEw6J3hVyAswHzD+SGvwWCzw7TbyDn6kTPCR19cNzUkWAE?=
 =?us-ascii?Q?G9kdn1biwd1txbES0GY+ZGKsauSb2MaC4yBmY+/l4CY0XCw+Cl6zrXUXDPKi?=
 =?us-ascii?Q?TDRJ13XO4eIbr5MRxF6c/N6uXjg0n63vzktuzZrC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bd837e-79e8-43cd-7337-08dd7cf4c819
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:41:32.8860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlgPDthpRqkdkoBBcnsOauwFUKPUy1dRyaDyPoB8XEv0A1eTfMde+1rEfY/8jakFhB0qQhGhtrdqH4pczjuRUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

On Tue, Apr 15, 2025 at 08:01:29PM -0500, Adam Ford wrote:
> Although not noticeable when used every day, the RTC appears to drift when
> left to sit over time.  This is due to the capacitive load not being
> properly set. Fix RTC drift by correcting the capacitive load setting
> from 7000 to 12500, which matches the actual hardware configuration.
>
> Fixes: 25a5ccdce767 ("arm64: dts: freescale: Introduce imx8mp-beacon-kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> V2:  Change commit message, no active changes.
>
>  arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
> index 15f7ab58db36..88561df70d03 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
> @@ -257,6 +257,7 @@ eeprom@50 {
>  	rtc: rtc@51 {
>  		compatible = "nxp,pcf85263";
>  		reg = <0x51>;
> +		quartz-load-femtofarads = <12500>;
>  	};
>  };
>
> --
> 2.48.1
>
