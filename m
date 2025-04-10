Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2072.outbound.protection.outlook.com [40.107.103.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B61D95A9;
	Thu, 10 Apr 2025 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297558; cv=fail; b=ZoNUYkcl5ooNE3XkvT4ixlJUjiWfT+dOYFq5c4B7AhFUKjru1+8Tq+vGayCfbrhp++E7kMZgj0MM6m3UIQZgrw9Idg6ir/2dG8s5sPOXWTa3ramXPEnWpCszpxvFbRQeWByQHrIUZKE+EN+0B40NSWMSe3SPJxyhRJGIwez7gB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297558; c=relaxed/simple;
	bh=Pu8TJSbiQ2OhzR296m9z9HIqrlEomcUJfFWY9m3FLZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OP38IHTm1UG91e6jkPBq+gPRw2BD9kr5tPBXLdwrqPFVEfI6v2+NXeWpvlrXJRI/tMvJLPQB2QZ2f9NHIWbPxu/JJdOAD7ZYiaZBQikPfydncgwSmGOzAWSxLxrXMon02PSfj9XbHvN8dtZTa9SY/Yx2wV+zOJWHamba9cMC2hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PAPT099/; arc=fail smtp.client-ip=40.107.103.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PAPT099/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m43qYZyMAxOn1dm1RnNf343dD5rrsnbwFwXCtYWSuBdt+ags+TSWqy8vhFAs64wUnSMvOLRftpLGgGWrqGkEG7a8RxchT90wCznrWdJi/t0TMGcFLtQrM5L3dSKjOtrqPxgagRSMaKwwpZbgJgof3B9nEc9AuPo75Gz0vn4xZLYiao20+602ON2AgK1RG985Ds2v4hbaqszH39t7CuqjGqKQ+Q4IrRez1+8UxJ+Adod2BAAm3Z16NzY6NqAnKr1lzH11D3+I+2DCzGbiwQ1cmLjpHry/y1AHCO0BfNQJhxtJ/R8FAYFYWCjyPgRzJIyHBp9dufxuZ7BJliseNZeUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVmez/e0MNtk92q16T3oioQzdZTnBgQ95XSEbrXfEFE=;
 b=hGTwQZpWOxse+RsT+8/v0VBhJCkSBmQ0GR0sevyKbCoqBejaZ3Fm0YILR2t/QKiAoL8eSnHZHCul701SH7IJftWcrSEZoNk92A21vKnF91Ap+gUvo6frCGKMNjh82YbGX9QWtU+Vcw9tak+K0mav+MW08bR7kmHPAm3iICppYdfF3eU/G6CDGR5n8nxcLMy/r5q2xD79mnozbaq64HAT34AzySF4FRe1qU3M9g4UI4oaiIglefWqajlESWkyAq5MefbUMAEv9Ouir/L+Jgj/yVsZJupNm6Dnd0etlVEOnO8JMImi1eZ56KW1/6PTh3cvUBF4zeVsVBUXhJyGB6kD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVmez/e0MNtk92q16T3oioQzdZTnBgQ95XSEbrXfEFE=;
 b=PAPT099/m5zJW6fiW3p501Gx1Zr5P9QeUefCQ6t/Zez8md/JYjQ6SomRdTpPqe9xHagsQyF+OS2k664Vi6MHGi+ndFxCi1mJSq0tsaKWJfALVidt7IhvZc1i0pF4fJFnAzfkpCmp4ptrOtcCXFSzX4L+tiiNBwBbZNvOITEEovSa8txWwZVIdbEX2+m3T/7lfAGTqhAB98eqswVoP8QpIFNYM6dMKaOifp2ML2BExct3k4iUqO2OkbK/3Fyjildl8q4e14DvzJOPKjMR5a3X55tyPKtegUi5Kk8V85wKQYKiBV8xpUWOp1JwuB6dvGYk/weeF4FFoyAW2ZFM4LcPkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 15:05:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:05:52 +0000
Date: Thu, 10 Apr 2025 11:05:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 07/13] arm64: dts: freescale: imx93-phyboard-segin:
 Disable SD-card write-protect
Message-ID: <Z/feSO9YbHd2lBxr@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-8-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-8-primoz.fiser@norik.com>
X-ClientProxiedBy: BYAPR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::37) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 213627c0-c490-4cac-57a7-08dd78412fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d9aaquSNX9P0FWbpBQ2dkmDAIDBkgbm4ohIb3oq7BuwmNF6leAli9M7xw5Eo?=
 =?us-ascii?Q?5gKnZXN6a/uN9eqHTxPtD2WuF9h3S1P1hLT//veIj6K/uTxcSPPJmU/VwZNC?=
 =?us-ascii?Q?OxQ3yrRQzz3AtfkpBu3ruRju0HuiyAM8HqU6HEANsclfQQPmYXx9e8VRdqa7?=
 =?us-ascii?Q?pv1PVf6+qqnshaYvdNlCpYgl+tk29B8V4cgF865XQLqYFvdEaDhXJ7hmu6k2?=
 =?us-ascii?Q?DecLLsU1P79TIvFwy8eILkQmv3Hq2udAl26LpynorbYzxyv5QYhzMbQcsnqc?=
 =?us-ascii?Q?CocBVKY7hFzP4TbUyu4nc85nb70YuCGBeSLpsp4afcFnNupm9irGN2x2gLkN?=
 =?us-ascii?Q?NYAiNpzS84+nB9/ZyPCcjfrp9X0xcDAiIS/baSP23wqzTBl3x2eXABEgc3BS?=
 =?us-ascii?Q?7XCC5Z5goi7zU3HYtz2WChjKDfNgmlCRaHp9PrkI1pWyNIMEFe1UozrALQzY?=
 =?us-ascii?Q?W3OOQRRVOlCcZI/MSnSR94H/isH3mrvxw2UOp+T0KW5mgt3NnIkVMjS3iKMV?=
 =?us-ascii?Q?VXpCLK2e+8aP4D4OS446Jy0QVWRwZf+2vZlO9cbBUkfiW/dn8GB9pcCWycpV?=
 =?us-ascii?Q?1cdxaM/OAlLWKbu39X1VsUyHHT/7dQn+qdzTuRJeBoBz4MNPM4gYMIdCujsF?=
 =?us-ascii?Q?/zSHg55+BIe98Oy5UJIiaHoixvs3ZItrBCM4Clrr8SFt94TKVY1oOK9gpbtU?=
 =?us-ascii?Q?50XIRZne0OykSr6/LQbcUWGW9bYvvL6eYbLMxDQgTAH+i8fZUtldCc7HMkTF?=
 =?us-ascii?Q?f1AErYFhm6x4aKRiyixPQ2cn4/MNMrH2x8QbWg/y9LQwk5SR/xWe1MMaR26p?=
 =?us-ascii?Q?ZRETcyfThlZxte4SEI9xpFnE5qCzj4AzXHzu+/KXBE6BOVJs2nmSh3ghIhW4?=
 =?us-ascii?Q?b5tedxMuS0iykzMTmKQYrqVvg4SSbvOrX2Bt8H0iCP/87QcHsiVrl5vmXUqD?=
 =?us-ascii?Q?NwjNacozSZGqXQ9y8DdidamhdG29/B2JQcXoAJoYkl4Vt9P2KhI7n1rBIjW5?=
 =?us-ascii?Q?1GGFEBkLK8DM8NSuj+Nth9TV2Ft+xBIfewukU6fEV4YHaWj5GWFIrrVgVtJV?=
 =?us-ascii?Q?ulMtLcVC/rBFiPSCLcdsAs804ZNMXo7mQVqsPVJy3u+Igd9JcsG/mnO7GdMk?=
 =?us-ascii?Q?zRC85D+tTV2lAsZZpDVi7lwqm0mwZ83/uLuhycji+lmXBOnVIdx/JZi9/U7e?=
 =?us-ascii?Q?AHNzbHUDhWWhqIWGzp74jCT8FO6FKEMekK8Vb3l/fk4DhVRWX1XviLiBK6gj?=
 =?us-ascii?Q?m+0UifqU0nHTekV73r5uxPCPvvtyTUym3K7/xk1hbos9P4VPTpZGXpEA6P4i?=
 =?us-ascii?Q?raM3N7k8FJmX4mhDCV7ifaq4hAicWFSy3DMKREcHORw1RM6eREY1q98+VqQl?=
 =?us-ascii?Q?oMAD03/iekLkoVkr+oVz5ifM8ST1bcc91bFZYHf51UtF6SVYPaRU1MINKGzY?=
 =?us-ascii?Q?UKM+kUcx9mwAmNojzFNBcw32IBMfU58U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O/aao3VnbI/1x6MKJB9JZBuqFvd7SXtL3jq6RB6GCe9cFhOSAYUw+7WyTVBy?=
 =?us-ascii?Q?mfPuK50ElxF3/hDKAZzEDrqUTHpdUZko82YQSib1LYNSUFjtUiRTeOdz9X8+?=
 =?us-ascii?Q?LL9+lWvOXIQDZ2BlL3oxSaJvjFhhUxqIMDoBDTNR1sSvbP7ZsqC1iBJfyKKH?=
 =?us-ascii?Q?z9WVoTo9AsXZGtlgv3X2QbuwlfYeFyM60tURPZ04jnGysGyEEBlmMf266Pyp?=
 =?us-ascii?Q?o+CdicrQlpuac+yf1+UgBub/+GzLsfftg0RQE03YuSSIqQwHaaZyckAj3GTQ?=
 =?us-ascii?Q?SLDxaw/tU7jwWRgBFxuFOKh6D3KoeiLkdy1FMNJAnDdLmQMxx5wOHuQlmxQq?=
 =?us-ascii?Q?SJytNA9TZCksZc6XzHktyXxzSW1aEyC1EDdYWkVVZGBbPS2OmOQJP16evHlP?=
 =?us-ascii?Q?iIzfnjMU+xdBEIUBWcpAoxxtd5mS8eNBYQ5luQnOpFi115xgjDkmbrxggHEx?=
 =?us-ascii?Q?d90DwXTYJrH5A5c7sfFhba+nZHNE9bufAd8GEPajGCqKqwLyVcPCiddCy634?=
 =?us-ascii?Q?yNMmwliLaNhIqKX9kH+w00fe3rcNc/wFtiHsPafvjGaaouyF9Eqme5Lq3vbf?=
 =?us-ascii?Q?aN4AtsOIDnE8IwWw6jolVQH0/ipDoaChQJz9wmZbec8v533qlhHOUAqRBzck?=
 =?us-ascii?Q?24amMe3LEqGZ5QKJ/WkoWQMiXUWCGQhkXz7yrVoVK/CBOVaUNHHe9ykXGYlJ?=
 =?us-ascii?Q?1jZWrKtEsmYKM1/WzDfiUE3YXO8X7bXsI87W8OxEc7wf6fGGILxwi4rL2Dcb?=
 =?us-ascii?Q?DLyDe6Pt+YsMKxiUkNFlyMohrCkDO/nijpNv92eYejuxGK4cIXvlv/GgDjvB?=
 =?us-ascii?Q?yFraO5dc5ZZZ9mJ8GbLfjp0u8aTbTiEpqJU/W9cx7W3hkXaMK4BvScHAtfrG?=
 =?us-ascii?Q?tYTfjqX2bCmM7uDRhCANrZANhnoeGJwUHFeelk444O+n8EFXBKhX8I6v+WZx?=
 =?us-ascii?Q?9/UiSuk5nGQeYaoiBF1p80zmeEdxDnMFAmfvs9BQdMZoR2UnLXNup5gC41t5?=
 =?us-ascii?Q?8tr7vh6NjpE6EyWb2cP2ee83OH9BBl3qXhjZ+0RaZC9jURt4gYDkMyE2dCOx?=
 =?us-ascii?Q?dLy7B3bE+Bwj8DDA8bCh0hBMITbw8ageyWxF4cU+JyE08YwH5SxhpwfH4hv3?=
 =?us-ascii?Q?Zaw8DsXd9UvCCZCZUwyn5FacYfLIJaQ9aaJMW1d1nIXUN4Znki0otsUAq6ss?=
 =?us-ascii?Q?5Stl5IZNCyxxGaXlSUvdIlrD5IGXDgh45xNPEx6Wt6V2uE7SExtblEvGCKXt?=
 =?us-ascii?Q?y7HBL1NCwDE7dOhGU6wqWS70lhVpJiN7aiUsvJQpobCx8HxHqrhw01tZPQjt?=
 =?us-ascii?Q?xGqppHVaBSOVbZuQN27QPPruhadrQYdG6JUF2thbRFy1ODK3/2/jD2c5VnkH?=
 =?us-ascii?Q?8gQBavZ2tXxuOwFNQ3Q2zuzOAbssAmu+/q9sIARjc6qRL+Fzj8TABVxPpxyB?=
 =?us-ascii?Q?0vevDlXur65otm/OnafaWMwSLS8d5pm7DEZXfo69rk2aMAFu0kl/fBjvhIh0?=
 =?us-ascii?Q?BAC2K3457rNC8FPc9RxeuVxGbygn2R5IS+y5+xSqWKBJgAfRpQ4sKHM6lJ1m?=
 =?us-ascii?Q?UJIan/UrVel5B9AUpJmfOBufLyNpiOS8YmiI3jtG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213627c0-c490-4cac-57a7-08dd78412fc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:05:52.7927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adzDICyg8rhI0fEG5YnpWmLIxyib3rWFs3k0zIT1DkAsK08L2s0Lc+xXeG2nav00kXrd/B1JLY1+uYJ1xJ9O/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

On Thu, Apr 10, 2025 at 11:02:45AM +0200, Primoz Fiser wrote:
> Add disable-wp flag (write-protect) to usdhc2 node (SD-card) to get rid
> of the following kernel boot warning:
>
>   host does not support reading read-only switch, assuming write-enable
>
> Micro SD cards can't be physically write-protected like full-sized
> cards. Thus disable this feature.

"Thus add disable-wp property".

Frank
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 902b523fc92c..3d5cd0561362 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -48,6 +48,7 @@ &usdhc2 {
>  	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
>  	bus-width = <4>;
>  	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	disable-wp;
>  	no-mmc;
>  	no-sdio;
>  	vmmc-supply = <&reg_usdhc2_vmmc>;
> --
> 2.34.1
>
