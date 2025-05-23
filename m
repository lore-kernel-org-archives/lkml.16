Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F8C226D04;
	Fri, 23 May 2025 18:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025560; cv=fail; b=c5F6sloma1z4NqzDUzUZldCHHoWBkL3MByzJIIPbvTa2sV2CzHnQltnfoFNaUAKIdNjtlAUhCEk3y4W55q3Z8M9nW6FovEmu578BNkNSJ4zHMUd7sQyn2ar3MBX1QUlBdeamTY6IO6WJM0UKFw8M8WHatQdt2pcFBfnRbDT/CPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025560; c=relaxed/simple;
	bh=F78tvIPRN1+U3g2joeuOVMbWCIILav4B7ubQmUaEpz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qhDQrVU7TcukjLEkUevzlGcek06OC87XhLLGrpAUWR0AwVUvRhp8kmW9AkWsBHYiK0hA/4yVceI1KPHFJps2/qIEJHC7rRtDusHsR/N7QttqakKXPoOUE0/aQ2IAssAPzDcuuUyVtDef6RnwIPmf5KCErglfyla2q03Dg1xPvaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cDHl+xG7; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cDHl+xG7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PruX6n0oHqiauymPzVnUe/Rx8Ty9XNTZj78qqmUdoZ+l7UdaxRpPSVncdYb4oXiMsQKFdaBQ9pQ09nqGCjeHKr1xz0J/zpuOYf3GSxkmZg6e6oTzpxSt1cNjQq42hUi1IjLXrGnetsHe/WbyGbSL2b+RgFHnB9fkKFWiqJKxMkNje0uxj4R8aYPkWpjXP0lIiXzrEvL1X6Johbe3nCjbxTWv16y+5puzIt4sRLXnG7JQ7/1347Z7SpRTGAHdxRS258WkhRyM+FmCN62Ucnou2yUwkbA9ia+SlA7JQHgqUyEKheo0Y/5c4doxw0SZ4DfMzM1nI7flbr4uZz2m2qS6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QweLqFEobH5Er/yxSCpjlSmhC6vKtKkRvjUkTLIppfs=;
 b=ZpOtwCi6MVxJUxt1FeDhuE94MdOkTY7JoO63iKJtZ633CD6/oz375JzorcrpFowZIPoZArJG/xxn3njbaaxeEWIt2xrhKPwmAGA2bpsr/f4BjDC++/EQigO0fwi7wYl6PfdNmaPkTHkezRWjxgT3Y0bom23X21NYoY1lMjpyzy8V0BJIAuENGeNU87XrcXrTJHb2WhezAOEUh8AJiAtg2xHbbIMK30Xv+3Ghd2VGfUBjbzY86JBx0iaAmaBzE+R9QYA5Yrdqh3MH9MdkgxeRLLEs35VkboExzSaCrfbj+ix5o3JM8X3NHwVYjCUGhmq9e2MSFnbrWHlZLxUeuwE5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QweLqFEobH5Er/yxSCpjlSmhC6vKtKkRvjUkTLIppfs=;
 b=cDHl+xG70NpcUBgL6f69RMj713uX9bqs0szYnWQIYeJoui4SIqY2YVO8i5glzn8x6/eDqsGgbxCc2RpYQsK5MSFo2tPoDlmuRaETa3DbhFiCVN3E6zqN0L5fnkWlb6vJ8ki4FPPbelo5csP0QjNa5qim+k1VkOQZBOmEaMs8kMdQTTckzsCevbsDGBFj+0QhWnIyvdKDz4jU6zWK18HfHRQW4P1XRGUMFScWdFa/J4WFx3QH+PIyrR42GZaDv9Z8INuSaMNXOcgTU1e1t7R3ynEfYhbRxFc7Qc/QODoL9COnvlEdpaXLKZdJIsmPWdtDzSv8iEZsZlCZGP0KUa+ssw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB11058.eurprd04.prod.outlook.com (2603:10a6:102:489::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 18:39:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 18:39:12 +0000
Date: Fri, 23 May 2025 14:39:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-venice-gw74xx: update name of
 M2SKT_WDIS2# gpio
Message-ID: <aDDAxHcEbjegbnjm@lizhi-Precision-Tower-5810>
References: <20250523173231.4166626-1-tharvey@gateworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523173231.4166626-1-tharvey@gateworks.com>
X-ClientProxiedBy: SJ0PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB11058:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e5740e-7f6c-4e22-aae7-08dd9a291c7d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?BVIEbS39T3zrmAJHVd12YTsMMyiyxH+khx0vzFW3GymZ/a3IxvaX+fJh3281?=
 =?us-ascii?Q?lfyS82hc/tpzug1LlmyHe5A5MgwMr2NjfuRX6eEdjVLztYHJZT45vzN6ZaFh?=
 =?us-ascii?Q?Ug9QtwBDt9KyqP3tV/91x+EA8yPYo1Scvk5g4pA1T9pbcNY5Q7PlQb0vJyZx?=
 =?us-ascii?Q?ASFkiSl/9FunmBQpP2za7Pyb3cRswNhayfvswS5yP+i+L0mobYpxS5FypVYh?=
 =?us-ascii?Q?6uJD6VRW3cjZcvlvLnDzwGPVhLt6RpOtHF149xDgqQtUCAHleQU66+HvALDs?=
 =?us-ascii?Q?SyZBr/jZ+TNdfq+9+PuxG8se9lT7m7bXKue0NOQ8LXZCDWWVWT0hgY4yilrH?=
 =?us-ascii?Q?LxXZTsA+FPPs9oIlXu3CF2SMLFaA21TVwnOXSZCViVJdBKuB1wth1EXd3MUP?=
 =?us-ascii?Q?5E4gI6dGvDR6YRiVAgfl+CTtHeMuf6pkMYmBzB2BPdie1KwawqY+l9sJcdaT?=
 =?us-ascii?Q?nLTxUqbhUWq3qavonV62p1/+hpeuwKnrgqvikAR7UfhXpoE4hiJm21NGepWK?=
 =?us-ascii?Q?7nK77LphlFqpCs6n5l3mNXpY5qWYz6u30hz9d/wRqDsjXlrepxIfY97bLHUW?=
 =?us-ascii?Q?GXTmQoFQiWZqSTR0IPwJs3QwGB7FmFh/0Sy0Lon0XEg8clg25B57BL3FJU8x?=
 =?us-ascii?Q?uJXZbBJwZmRlO1dLw6nvXMoOt4FrmUpcBWfBEIhg0l0G1CsKFYZrpN7Bkgeo?=
 =?us-ascii?Q?lTKQp9ex88kem/GwXLjPPLjX6+7aKcTMnoGy4KX5UXcfkfMdUOxTlMyNlAu2?=
 =?us-ascii?Q?9NQq7vd2HoKebIscvn/rkQa0Eq3XO2Vow7eKk7NpWfaiSMV8IptZrYJWHlPJ?=
 =?us-ascii?Q?mhJOWa7JESxgciKJBM4ApoiBes7vWY5RovuhRmI7igsMnN/fmSYPHeB/l+AZ?=
 =?us-ascii?Q?l2rKNWlRvNWnZuZehavPDUpFtJF448hO8ffFRYvBJQvDjsPsLdXDIned4Lwq?=
 =?us-ascii?Q?fx8plgmGVntkig28QEPCav4+gNrVZjgVD+3SC7l0wwI/PYpstvUWoc3mVk7L?=
 =?us-ascii?Q?2jOiug2k59aKBpDXcLxYbZ25L0s1ZBxov9FFxzGsA2G7be45MtuTpMitd/5v?=
 =?us-ascii?Q?n/LZpshnApK+JXQLfZAb+AlSbtsevf9ZAs5NaYc4Q/HUbN5R0ZavLE/Wr0km?=
 =?us-ascii?Q?pZkzTK/Wm7KsGOVX6ra05igzb86Sxy+a94UE4X42UBw8xI8RY6G0bTXs0vfO?=
 =?us-ascii?Q?CJoiEte+4JTSjmNx5wPqkqxdkf41XeWmw2maf1S9/Ky9y+VKye8LQUk2yJxg?=
 =?us-ascii?Q?8GHyTqD5CbbKLc/oiDl01hn76J9cuu37E+PoP1swigtmreVO8hBCGFwM/AI8?=
 =?us-ascii?Q?0YChbKMzdii+/BfogwJLBnKnhRTsf0QL5PVRtQ2ygkNs58bDB3HkIPK+Moq/?=
 =?us-ascii?Q?UVIb9179HQcPR2VW970luCDeQY4JMLgnXIg7pbcrOWUolZNqGZckcEFhc6bE?=
 =?us-ascii?Q?GsHnWfrbqNibl+kYpWoVMWmOQkrXiCCdg+SPJ9tbLaotfFkiF4S+cQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ELmYfFe+6FIWEntlG6yDgFfdmuMGgBKM8SC9//WLpRSGalOGYmD6tYRZYd37?=
 =?us-ascii?Q?hoA7ekhyhJXMVFweGhSAL1jqkEb3S2XKsX1RL2Q+W0Aprg5E3vlwSJq0/sNn?=
 =?us-ascii?Q?yaQ+RP7pFC/JW7L+THy9iPIQ49ektp4DCbNpXRnKjpYTTCBAJswj9B8ALnA5?=
 =?us-ascii?Q?c24GSGrWsUh6OdMdYbbI2GaebhONQCUPwCE5ibQ5EcoWyQioRKb/XBAlv0tq?=
 =?us-ascii?Q?2XXmQEjO3wzAtuTOTLnqUiNMLZNgKnU2xzNYd4I3tI/lc2DjEa+lzf+FI2to?=
 =?us-ascii?Q?FciHgfT+0dUOnl7w/TRNDgML34hvp1Onvm2xVHe6FuwX+twSuLon0hKyMfi+?=
 =?us-ascii?Q?oT8pMdmZ6csdx08R1CjovdfZ2WqktaAA3AC9wx3QD93a82Yrem9MMNOTcPFG?=
 =?us-ascii?Q?j7d4+bX6ALB+MpUTK32KHmSzN+OhHe2Llv3BFwc3Ncm/0XO8TpBGHjhuujnY?=
 =?us-ascii?Q?Rv5wYwYIqtSc3jy7HpmC1V0N/+sVfqcHpAnuqEgCQp+dZ7afpICzq/GHcnMc?=
 =?us-ascii?Q?f2ktl7qtylWpETxW6jjP8FcKZtOPC/C9fDI1yv48X549n4jVnaGbNTkAFyF5?=
 =?us-ascii?Q?YEdwYu1g+LeBWq0lLJStlp4kCmQLmhdUO8fr7XkgSU646/HQPH1y8E00gGOn?=
 =?us-ascii?Q?FMJGx3pW4O/LOYXUvL6+3PPVjT1rSnt7Wif7Pl6jyCGQYZGi8/YDfMYEVuNM?=
 =?us-ascii?Q?AGiqJIuxUdG36FJHuQKptnertDKrxFZttaoHCFG6Mxz9o0duarGMBK08ithD?=
 =?us-ascii?Q?EOe8t7rWQQ2W3maAjGiusPta5SnAuYKaDNSB3oJBuwoDRvZB6mjTPzhdWRPc?=
 =?us-ascii?Q?9SVzkll9hZ9JfPkEhrgobFxSi9KqZE5ZjZirc2bn/1jvxVERkDC6+wBuy7Wu?=
 =?us-ascii?Q?90hjSUUOcuydpGZ5uw6QRsl9RJanaP/u7/iBottq70DgG498Y1KsWG2kdjdX?=
 =?us-ascii?Q?+EC80J9OHf90ruUTnOUOX4ctHsxa6r5VdadDcYqeQXvto5acuCbfF54rwsHm?=
 =?us-ascii?Q?cyp9YwX+48Pt/uzQIV8yiKaeBjJCYKUngBZ1XguD2wOIxMJzwdhcfuN01Ipy?=
 =?us-ascii?Q?HFK/ttL54Vhev1CReyEl3mXGqDUqJbq1nxd7VPv2khMuPLKMCzYWj2H+lCdW?=
 =?us-ascii?Q?ONBcqHW3SbnNpy9Eirjd8rwUY6fQuw7EmgvWeUh2roee5puMWQnnZ6sHdayB?=
 =?us-ascii?Q?7LORCZ0vwgVbtrmnyl0gOdDTqcMOA7Y7auVyXVEu1Jbr58X4mPtJx23SBOc8?=
 =?us-ascii?Q?uGE4NVWYZHzBEz3SAwfZQnpGPJFvpXgThNi3cvod5Y5PzYKFEQ1Kcak3o3ad?=
 =?us-ascii?Q?kr+qdflR4QEnnEF+MCSRhgWAkwpXieXn/a6KaM29QTNzsBMldyTwql6GVdIx?=
 =?us-ascii?Q?GFzkkWqnMGx87fkwhbCWXrPEeFvLpuED0QXx1nc2LZADCOvCRGGSxkzuzz1q?=
 =?us-ascii?Q?dabKeISoLo8B5CAKvvEWGudJIvzz3mSm82s0rRENNxcSq6zceBSVFhgt5FLR?=
 =?us-ascii?Q?I3TBtqfPDhYWHLF43ywYpAiXnG6jBt6dZASOcPWqz2XRpSMYV4ZNpnKuRQRY?=
 =?us-ascii?Q?nT+LGq8y6YB4oqQSNBPgSSUYlK3TMmlpEi5EdaSO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e5740e-7f6c-4e22-aae7-08dd9a291c7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 18:39:12.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgnsevgLjGfg51jd6ByIe14EvzrofWccmQjlbtENMT72gEPaqPlK2AOapFX0E9t6AF0bXk20cu1h24CCdYAlXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11058

On Fri, May 23, 2025 at 10:32:31AM -0700, Tim Harvey wrote:
> The GW74xx D revision has added a M2SKT_WDIS2# GPIO which routes to the
> W_DISABLE2# pin of the M.2 socket.
>
> Add the iomux

You have not add iomux setting, just change comments.

Rename m2_gpio10 to m2_wdis2#.
Rename m2_wdis# to m2_wdis1#.
Update related comments.

Frank

> and a line name for this and rename the existing
> m2_wdis# signal to m2_wdis1#.
>
> Fixes: 6a5d95b06d93 ("arm64: dts: imx8mp-venice-gw74xx: add M2SKT_GPIO10 gpio configuration")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> index 6daa2313f879..f00099f0cd4e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> @@ -301,7 +301,7 @@ &gpio2 {
>  &gpio3 {
>  	gpio-line-names =
>  		"", "", "", "", "", "", "m2_rst", "",
> -		"", "", "", "", "", "", "m2_gpio10", "",
> +		"", "", "", "", "", "", "m2_wdis2#", "",
>  		"", "", "", "", "", "", "", "",
>  		"", "", "", "", "", "", "", "";
>  };
> @@ -310,7 +310,7 @@ &gpio4 {
>  	gpio-line-names =
>  		"", "", "m2_off#", "", "", "", "", "",
>  		"", "", "", "", "", "", "", "",
> -		"", "", "m2_wdis#", "", "", "", "", "",
> +		"", "", "m2_wdis1#", "", "", "", "", "",
>  		"", "", "", "", "", "", "", "rs485_en";
>  };
>
> @@ -811,14 +811,14 @@ pinctrl_hog: hoggrp {
>  			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09	0x40000040 /* DIO0 */
>  			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11	0x40000040 /* DIO1 */
>  			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02	0x40000040 /* M2SKT_OFF# */
> -			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x40000150 /* M2SKT_WDIS# */
> +			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x40000150 /* M2SKT_WDIS1# */
>  			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40000040 /* M2SKT_PIN20 */
>  			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x40000040 /* M2SKT_PIN22 */
>  			MX8MP_IOMUXC_SD2_CLK__GPIO2_IO13	0x40000150 /* PCIE1_WDIS# */
>  			MX8MP_IOMUXC_SD2_CMD__GPIO2_IO14	0x40000150 /* PCIE3_WDIS# */
>  			MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18	0x40000150 /* PCIE2_WDIS# */
>  			MX8MP_IOMUXC_NAND_DATA00__GPIO3_IO06	0x40000040 /* M2SKT_RST# */
> -			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14	0x40000040 /* M2SKT_GPIO10 */
> +			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14	0x40000150 /* M2KST_WDIS2# */
>  			MX8MP_IOMUXC_SAI3_TXD__GPIO5_IO01	0x40000104 /* UART_TERM */
>  			MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31	0x40000104 /* UART_RS485 */
>  			MX8MP_IOMUXC_SAI3_TXC__GPIO5_IO00	0x40000104 /* UART_HALF */
> --
> 2.25.1
>
