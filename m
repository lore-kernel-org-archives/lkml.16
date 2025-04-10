Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83141DC9B8;
	Thu, 10 Apr 2025 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297739; cv=fail; b=HAhzEAQIuSKTENmZ7LwTGeDAeBQictyhwfoLEYxiBBD+xoynSyzsbSasnnYPfllHIPym+QO0yHjNRvSc+q2MYaxbUCgFdMImW0pLUwDzbO7ahqCNBJ3ZCrO+SKZs8fXLBgf0SE+G+q7EAj0PXbmn8RoZ+K9ea0T6ey6b4vgZhSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297739; c=relaxed/simple;
	bh=/9sYhsIL6FHc9b2ImmwvyZyTqPEeSWzF6pnBus6ujMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d8CAl43rU613oOp1DuF8Fek2GyqPejvEzV/g1WgEPv4SUwXPiJKt1TcLS6e433ZJU2wTLXIOUDgKYJBj7fVIk3Rtjc2r0hjcHJY+kv3xdrGD8ymg3pk3dz7kHfOyhSYJ/f2P1EwlkCwigEWft3kOLRDOX/hjI3cR3r4Xaz0LKP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MviooNBH; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MviooNBH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeFOQH1G7/oLuUELw7fB8fyXRxj0MLswzhPtr3lXvf9T5Yr7k8XD6gceWnP9mWdS9zkXm36J5nWrvP1MBXDmlBHBD0U1jDKijC7w9iy/Idqs8cyqn5pppRuHNrkFRjEOkkT39RiyjF6eSINAKctk5mc1VJJ+afV5ULY59dYtHjswiwV9uYwcCIl/RNYjCafU2xWLJXG9RMfqOCxyZLXxBpXuwZjNunuggTFq+KAP1RQE8dEfhRwuQXtjzElhbNc/TXxGbFV33n2Sfzp8Y1Qxycgkk1zn5MIvOQjCEC/g01e/H9YqwIKJk6teTLWZ/yQkKNGTOPpSx5t+zQRCWuxU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJEaH0m1HIjXtpRKEHfl8oXFOFDKTiMH/sGscVNEsZ8=;
 b=K/5zTAdZJbz3cXSclY+EgO3/sBqI5qG860mPjKDKt4PXYkOjj8nj1bPv5CBaWexbyAZi3ZM3mAb1peCwOLQr0HruHCn+IkWkszyNDUxFUPHEZXaFr/AsrY8V7BtCp7B7Oasz9uEqiCY6TmH9CEtRRpvIHoso8snVfAO7vYIHHGTci+QXEI0hWLQKiqoxq9DrjRRoeFcxFCL3JIVOLdYJ0l5d4na3BdhaczbhiF9pCNmnkCy3kqieh9Qg724v/dEc8U308wNbXq8aoLyY0k1PWC/Ar7NGwQT3f87qlvqQ1YCMazS8Tn9/mWvOUNBA/2OEbJG8KaaN5LM7ANa/bct5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJEaH0m1HIjXtpRKEHfl8oXFOFDKTiMH/sGscVNEsZ8=;
 b=MviooNBHmXtHSKZ0jJzHPL+Zd6ZgXA3di7Mm+Nhxj6Bb+Rvv6fWH3K99AJewCYEns6iQzxGuqyyw2Pm3TZmAB612lLA2HVcMHu37zSPx5D2Do0CH9Ee3bECU2kmTlLh6lduUDOJlbm+VKVCaiP0zkCYrcCsk9xcNLfpWnF/etvnbd6YRYMpPTLujiw0aIsXlsomouiKE81/jHO5AocP0LfyMLVSuvc/XbSTLCFbM8SrxmqzlaSmQ6tzKTvQDBkm035cLrWx744s4cGjpxsDlZKOfLD1AvOFS8Xl2nBrseYAvNYNrGksHYPH+7chYwOJlUsqfeEbiX7ubh3c8XtQSYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8436.eurprd04.prod.outlook.com (2603:10a6:20b:347::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 15:08:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:08:55 +0000
Date: Thu, 10 Apr 2025 11:08:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 08/13] arm64: dts: freescale: imx93-phyboard-segin: Fix
 SD-card pinctrl
Message-ID: <Z/ffAARERkPI5brX@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-9-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-9-primoz.fiser@norik.com>
X-ClientProxiedBy: PH0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 10dea9dc-3a7d-462d-4414-08dd78419c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yz8YaodEjyLmWUsx7bD0Vut9CqlEJzTJji6jso3TiItPdsP+cbCa++6d7UDP?=
 =?us-ascii?Q?58DUiuUVH+Ttuy6DBqMgArPsme5oVVE6RTzp0sEUzTcMCDEHJ2SuX1ln3u0h?=
 =?us-ascii?Q?clNdVfPf13tRT9FI6Z/9Fgm7faQ5ZtjC6fZViLOKIbcP78G/H16kqhcuFLih?=
 =?us-ascii?Q?gWrAbKyy14ZTIOLP5ahFz+qahpCVlrj6fkME2DGfbn/pjDGh4gJScOwJh1fO?=
 =?us-ascii?Q?9554FP/cqBYRNYthgzKAFxWntgS4i8rpNHaXw1kfuKqjiYb014AtZRRcgEgo?=
 =?us-ascii?Q?FeheH1LBhTFsFez+X8VRJRfqxXwvFQ/Ef6rd2nIHqcItgu583Av1QJ0dhEg5?=
 =?us-ascii?Q?nMuVqeTgb30UFcpv7XTbFcnH3/bHRTD2aPhVEFoCoHROOO800u6iVKx9Z5vR?=
 =?us-ascii?Q?fdgr8Rjnv+ZehB2Wmn8LBIQVj8e9a5BBEfVaqW2EDn/8c3wiW1XL8U1RkgSM?=
 =?us-ascii?Q?XDtjpgzc/Fh7Es0tYiLu9d2s+Ki3DnUw013MSzPc5MyabVMa5v00JfplGemN?=
 =?us-ascii?Q?TuJayheyE2KalLcI1jLAJCttv3HtpFx0Ha5itfUghiq49DCX//RTjLRCHGYz?=
 =?us-ascii?Q?1nkhak5qwgJ6NCabb01Q6JhHIj7xB2qmNpfiWqeFXZ9dkWnkdimc0Oa0WDT+?=
 =?us-ascii?Q?AnhTClAAF+OotbVRel5FJozags34uqzZNCl9YzjZ3HiDmx6HT21PW/XyaLot?=
 =?us-ascii?Q?Fo6CEHYMehs3zgnmxExidw2JPKdthnjkbvvLB7boFMz4G37psIKLpIJafqbc?=
 =?us-ascii?Q?qGnui8l3z/IqNlaJhHf+yBTctGQsYuxSqZTCS7pF3xDpL16uu5SFTnr595jW?=
 =?us-ascii?Q?edjghZyLnjt78rjbHjjK3NkzQbbzAtTOk1SI4SzqRNInyQ9RMXqdNeyAGTVv?=
 =?us-ascii?Q?BEjVGhfsKK6OtEAbzTOlGmaPCNa8mwoaNBqHQwRaU4VEi3V0n7UpsA35YEqw?=
 =?us-ascii?Q?GdFgPQR3VfobWNXGmgRWvBohqG/WR06B1SK1r1Ouf/LZy7QWU3xWi5ufeIIN?=
 =?us-ascii?Q?kObqjqiPi9qODihcB6fc28s2tjaOKyNr1lsVfGrcDm+Jx+LnvkoWjd3NK544?=
 =?us-ascii?Q?be5HHFzo7HVum2RUwBK7Z276Ub/vlhKYS5qd8FFCi8EMmV0qmzBrHO/wdLL6?=
 =?us-ascii?Q?ZEaCFehJKjW27kJDr3L9n13WNvGVLrffJMI9qPwwAd17V1nYnt5OL8Yt4lZl?=
 =?us-ascii?Q?V3cNa0sAJhXnUpm0PZBXW8BsXAgoh+3+uvnujwMxEiY/3sO6AQfS4dSszJBm?=
 =?us-ascii?Q?KPkN+Pvpa4qs4vbvXLOfuk87zn6xXai+h16GNfrEvIGCIpp57XPwnRwAtE8f?=
 =?us-ascii?Q?yHS3LHNo+tqBpRcbn/ol7suS4aA01QbXz4FzkmVabGFAptVYrAcl9/KKLHMl?=
 =?us-ascii?Q?lCxXnrOsqlxrIINiSzzMOW1P79VSjbmHUS5OrEk3Y0gYAuq8b57mV3cWNyVN?=
 =?us-ascii?Q?sl8LO/CDP22jJwCggRjHM5HxSkUHib2U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0PTb2RxnA3xA77sEFF/ZuatV4fbcI1/gx8T2TTLZC3Xtf3HnZhM7vNBibz73?=
 =?us-ascii?Q?wcJljfK5O5TyHE3FpehXsj0OAnN0p5DfvKPsY+0P5YHyn9WhbsXma5Eql3YB?=
 =?us-ascii?Q?s5QckqUZldm1/4NFAsDa9fYzcm2J5Uz4BtgbghePD6QcWWWiAEryY2/tu6Vi?=
 =?us-ascii?Q?6eTA6pfzmEhvqfT3apTgooALMT67qwLtm63Vvg4Kqn69zLmXxNOETIGQDkPZ?=
 =?us-ascii?Q?hrdqLh4SP6OHwCUlQcQRb41gwALnBgpUkhmqglhKFCnhI4+vuePzCVAwNsdB?=
 =?us-ascii?Q?9k+1PtEBn7WXcwzRr8gfVYa9Uahl+0NbmPCfr7DST4xBZHBMRjkpfICESH9d?=
 =?us-ascii?Q?mdJ20VKBvRfXUaZTMq5ClYKB9dQ0trDdNP0zGmyOL+tdcjTs40ep+QpiBVWh?=
 =?us-ascii?Q?na9q/isWRbJTdZxJVW1GDS5xWvmpxoKh8NVxKYH8D/wyhmJhxQK54o6NXt6S?=
 =?us-ascii?Q?iQPGw5NK197QHTMBT+xId3jRMNnD52fnWR1FpV6ir8Dk1yHVEivrSHJ2FEtg?=
 =?us-ascii?Q?NOgCUR/E+ZALYs8RHWG40Vj05u+Gu9t2O3Cs/nWCtE3+24qgUTeWydvTDjMW?=
 =?us-ascii?Q?aALx2Ea+nJp7Gaiw6YzXauvPdWv76sBeHH/HWH20/1ZFsRZkg3eyQfxxcbMf?=
 =?us-ascii?Q?aZazIqFMZZ5UyKByQwAuVghUDE3R9K0lZ6SW1FA7YTbC5qE/X9y0G8uyrc3g?=
 =?us-ascii?Q?OpJ/5WvJ8Tkq2m8a9i+9AbmfjElJZEwV+WmG1kOK/FL3z4CRiQiKMrij2C2f?=
 =?us-ascii?Q?hOXiyVyDH3ByRnZnWoCaEFNjfp2RR3b8uIH2JYjaHRHX7OdPpTvkdORKzt/m?=
 =?us-ascii?Q?mOtuiccPKtEcY95DIHBt9rqPQkIrqZuvUAZ1iHBQst/0SsYVzrSAZBwT5d1A?=
 =?us-ascii?Q?Lee7W+mKAm0VHJkIsP8SgkFCIxUFriuH+xqiQA6Y9Bk/xcLkrmvxNBziwcVk?=
 =?us-ascii?Q?SJI5CYolqgbODiD9P/P5ccVxdedjC53kA27G5Wl7uw2R/wpvSEB7pJn0Cacj?=
 =?us-ascii?Q?+/NRCKHEIBWhAsWlrQ27yTkkN1RhgRVKOkiJ0YVW0P8PHrW+Pxjr5a9rnjww?=
 =?us-ascii?Q?afm5rnGSvueVAAsyoAljluz/rpn95rXmFLgJDUl4YyuN5rhU25vCWRLOra3b?=
 =?us-ascii?Q?pclz4JL4mZTufKKzUaLiQHtsmQ7Fo8w9qIgEYKEMhU5x7FI0ImfjOpAbEQ+x?=
 =?us-ascii?Q?dJdX1jHkQQKeZxNIGUbGfZkNe7aWI0MZVD0xlfwndhUiMhLoIBQY8QQ+fewl?=
 =?us-ascii?Q?68OCFXFNZE68Qpm4ir4hQzv3iFcwL3YT+BHLNjnpJMH38/EsPyb1Zraco0Cs?=
 =?us-ascii?Q?g9wt78TJk1huFgAR/grdq6DcpbiIlEcGGI0Q5DK1l39SroPiF09UyW1mHN20?=
 =?us-ascii?Q?SMnc7lhtEbxhT9A80rrXShnG8aSMFlctsY6/8uQfQq7dDKA5R/Un5Rolc710?=
 =?us-ascii?Q?azkYJCx9+18L7xae9iAu2S5JDx4sjC6uBShY2GCZ23cuui+vE2p/qgN/hBr3?=
 =?us-ascii?Q?Je+iH7BVnyop6LXZsjM8jVP7ZdHWZuDprsrLI50Oqp12SlmQT/SEf1vy8r0f?=
 =?us-ascii?Q?id/QaLtfHZ7kmO8XRNbLk+sQEDm1Okckrf4P4tEU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dea9dc-3a7d-462d-4414-08dd78419c81
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:08:55.3319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikNm3qX1x63cftaZkRBgdJqFlJgR7K9QcmwiwLEzuGUr+kWEiNgtmNDa4arJTS/jnjm0oR0+VPf9c4hfEGybyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8436

On Thu, Apr 10, 2025 at 11:02:46AM +0200, Primoz Fiser wrote:
> Until now, all usdhc2 (SD-card) pinctrl labels pointed to one pinctrl
> group "usdhc2grp" which was overwritten twice by the 100 and 200 MHz
> modes. Fix this by using unique pinctrl names.
>
> While at it, apply i.MX93 chip errata ERR052021 workaround and adjust

Errata link here!

> pinctrl drive-strengths to improve signal integrity. Drive-strength
> values come from the downstream PHYTEC kernel and were devised and
> verified by the hardware department measurements.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../dts/freescale/imx93-phyboard-segin.dts    | 47 ++++++++++---------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 3d5cd0561362..525f52789f8b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -75,39 +75,42 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
>  		>;
>  	};
>
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */

errata's implement need seperate patch

Frank
>  	pinctrl_usdhc2_default: usdhc2grp {
>  		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x179e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x139e
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
>  			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>  		>;
>  	};
>
> -	pinctrl_usdhc2_100mhz: usdhc2grp {
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
>  		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK            0x179e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>  		>;
>  	};
>
> -	pinctrl_usdhc2_200mhz: usdhc2grp {
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
>  		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK            0x178e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>  		>;
>  	};
>  };
> --
> 2.34.1
>
