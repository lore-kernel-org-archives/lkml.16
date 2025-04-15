Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0EE21D3C0;
	Tue, 15 Apr 2025 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742906; cv=fail; b=Ggwr5CrifJShm74jjsMZgn1baSoBQcUeN56Fa+9ousNN76c9edHu3ObFbLYTk39yWSGXgH+HgFXq03raxC+jj+aiX80JXEmrzCdoqP6bOppAwxzjDEfNjbOZzqDVlCmj63eyhWdHhE11cnDtszJPaWarKYTkRSdwXKL4kor/phM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742906; c=relaxed/simple;
	bh=cz4RcpMIs7aE/PZhLjE7P0mrkPmVzLBN8j+VMxIfn7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VTk6ZsUEgkeqBwj+htJvEo8+baIto9Z7vLpKFYhMfkm+pmvCSuI9oyzpHm9eNgZ4EILJgQd120t0GvG0eP0P/41gv7hLRyJtJI7oUHVKGcjTEO8ztQgLLJumZitBrpDWdmdJelyCVRXCOWqOa+b9WHv486Jn62UAxrF+m43hpx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J/j7XQjq; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J/j7XQjq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NS/Cy/T73jKFBI0AuORHfwUkGH7ESWhdUJKSp+YlNha/UQ9dmy05NY09XtJk3eFrEPCEPsSVVYruzJTxB089FcsgMTR+uVfyjaaxK1FsQ6yppRzR5NnnOwpo0LFqQITVMQjPkZjZRqjHiIS3pVhePvNptVtP92F20BD2p9lUGrirTOVTb5jYHsYLoQ2RDhuWBAQRaiT6BimJQBj//Sz7FOEZI2zoj2atfvHgX0n2p8VTgMlPUmPbIH1z3JQOylHHFVv0YG2l0LKut6Tulqi8CjxtYbCJ6la/hVv5IvMJDNLMNwKueTZMkJXJug/fvM/x5RS0kbSv1JVk9/MaKXgAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LH+38TzpQ125psjBtbeDKHIMtYxiSqkIJ4PBrePBDM=;
 b=rM4MOhesVs2VXNSWIlodQndZ51Czm78YS7i3YTbrDVTDGYwfYjb4JLjIKRnwE+6KHwnWiSzyKVcPrdL9mYg7KoU6FcmZeLHBZ6wmqmgm5rra+CX9Ad27t6Idc04K2FoIX95JcjXI7u3kXqRgjgIslwsk3y+B779S6+CCJcj0G1aS9wRSxCS4UqJ8+IZSPdzweGZhuUL8+rkKFfjQOvWsLoSpAeYF+c1LSG8J649ueGj00UVMNVTSQk3U6zyYKLw92sNyG09KiZEaJpJC/4wqmiBg9MgUfHQEZFVugg/wbOtOxFLKGFSB8GGi9JKb5Nxu5PffHvvoOMrf1tat2dRyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LH+38TzpQ125psjBtbeDKHIMtYxiSqkIJ4PBrePBDM=;
 b=J/j7XQjqhp8ZZ1idno5yz/cnAJWInqz+RX7QWOtAZVeB5wulqsZIj0GFrlgSTlYWZBySa411cZf/aYXRcktemr9iOMriAZquoZWMLWmbRZN8pWp3LoFgTJpxDz3vWmMXuj9EcO/1n2bUH4v/Fov7cRME6RR6nXUCPNsBmcSNDZ7NyBKUC5H9mRRPTypbHYJlZr/alFoZsTXACT1uF3sgP1MEiJvwG79HPwQ4SL8/rYtQUwMKXTgJnCF5Ai8xTbSGe8R4SMCnZn98Vvo+6aNWvV4rvaPdkfN1r2RW5rZ3L5EVjbBFr6hUb6TvmeMNCNIUNxVQr+grcsa+ys8V3HsIjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10976.eurprd04.prod.outlook.com (2603:10a6:800:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 15 Apr
 2025 18:48:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:48:21 +0000
Date: Tue, 15 Apr 2025 14:48:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 15/15] arm64: dts: freescale: imx93-phyboard-segin:
 Order node alphabetically
Message-ID: <Z/6p7eN+t6tsHCO6@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-16-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-16-primoz.fiser@norik.com>
X-ClientProxiedBy: PH0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10976:EE_
X-MS-Office365-Filtering-Correlation-Id: 4689733b-0d83-4142-53ca-08dd7c4e17fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fOBGKLuNFk1wIHdEzkcRCG7eb32mMXDn5K8eNJyE0QPlcx6mcZ5RF6oGiJ2A?=
 =?us-ascii?Q?iSWHj/HQqNEqQw2JMB8oLMPp/dKaKVRws3amaLnCeRV6DLzSaO+PgQ8v9+3p?=
 =?us-ascii?Q?LoXdWyBWs5QS4u4lzTxIk9icexciUWEb77mgJgrdqs2ZbZovXLVLNUWm2qcV?=
 =?us-ascii?Q?a6rmXaMMqwA4xsVBRey5k+Vg8fYK4yEMEaJujaYzpb0Bk/UaT644O+RrdDTi?=
 =?us-ascii?Q?tscV8Lvx+AwqgSyNrL1r/v4jyz87UvHDkzaLYte5m+LpldKLRjpRh4o5zsAE?=
 =?us-ascii?Q?Qr2AZk/dS6v8m+Pg5ZxsLeKsfzMLuwc9REWWUZm2xB84c0a59TxRs7OkEex5?=
 =?us-ascii?Q?0EgxjVfrJZ1CYDCegZfGxBAhfnhCn3LBi38WHk7YVfl73/J54zZRhGinT210?=
 =?us-ascii?Q?JtDiYF52+JsNcB92M9wkEtKAmdpWVmZLZD2ceTOWJuGPur5AzEDlD+93eAbG?=
 =?us-ascii?Q?W1ALfcKMsszgsBPyaukcMPpv7/u4r/K/SeZUnh6FOrEmryuqvN9MIwMvCj3+?=
 =?us-ascii?Q?CJTLnKu2bNlLg5TNEQNPXWNHAtb+cCCI//4OodG1PEEIzZri2x4hQyQ7iYNC?=
 =?us-ascii?Q?RxjS8YruFfkGU/dYWWivjavrsLniWF5oX9Er1fcdqNPJ5kCwIJxDr4qm33fZ?=
 =?us-ascii?Q?OGQcnvacR+eTRDBS7ZeY5Aj+c9oGRFVQKMdrdvgtpCaRijDrfFQ1W1pPSN9Y?=
 =?us-ascii?Q?vOqwG3Vvvh5nvrYf32Aqk2UvkYxHiiW/2bNP9KxjA2YXMXJtAgHKNgaWlJVk?=
 =?us-ascii?Q?lZ/F9AwpfjfT1XjvVtQDo1GhId/Mqj/LYhdvfjKBYE09kHMsCyYZUIY09q/6?=
 =?us-ascii?Q?5nFWSAS9f/3MjzzNLFSFYo3aqRx7IIVRh+Zw8JLv4T8JJT6vnvIuKqmbTq50?=
 =?us-ascii?Q?BkNcTTVjOYpWcBiH2gW0uOh9OO/18cpqt+ApkWfBwnq/2NEhDrdem1dGj+wO?=
 =?us-ascii?Q?5XIMBQ/aNC+S2q1PX7r1S6oBQ8QK/e/ZU/0txrMumxNeqJcZPtdS1+fLUjbW?=
 =?us-ascii?Q?malqJQiuQy6Xh/fhAbTjy6zgLYnegWFWRZbf/+tXGC7Q1PKMwbNo2JkXb0MP?=
 =?us-ascii?Q?Ew/FgWZf6h4EEIcg5U+6XSQRyFemqEofw2+Lkc0uDvCTz6Cs91c5pyJTD7X+?=
 =?us-ascii?Q?60LWI3extpixKoa+kUxv992xKfEXtdKZlBaGXv3BWY03BXM09HcoUutkm5rk?=
 =?us-ascii?Q?8ca51y7iksdCQT+/WaBRpctEtX1S2o0nSMXSlD1Pf+uEohDZrj7At1CDQnH2?=
 =?us-ascii?Q?Doz3x35JB40jR3gkCkIZgGCoefw7XHY7JeQM4UgNK1GlGGkl7nUX+rVNc8k/?=
 =?us-ascii?Q?4FBOcnz8m3vj0b3ZpUMxKwifV9nDTtjXW90G7vWL2uEXCz6UNnuQnB61dvJ0?=
 =?us-ascii?Q?0hYD8xW1Lp3hzHwntlm60DYe+S9vIWZSEwi7P/Q3lcE+41UnKr+H2/KTBCXp?=
 =?us-ascii?Q?VtXIGYVUTrkvrraks9o1lcldUv8bgG+nutotea4lmD8Ygj4Lw0Ih/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?970X66BOrEdvEvakhbNaX18vDXMsFnUQoE2+tiYBf12eu6N640DI/J6UBmhT?=
 =?us-ascii?Q?ShbJPE9n3T6n5AfEyLIY982DRQ/GBkhlhi2crK12nqlz4yDRqvIX2B/ALiRE?=
 =?us-ascii?Q?MtuvCSkq+eTxn3dlsNMaWforwXq6UeO5Zx7D4j2roV2YkLUNlPLEJwsHHqS5?=
 =?us-ascii?Q?WqROlZO6FwNicRBivcwbCNWNVnE9qUbhHzuLg1Z7sxpuJ3YASSt2Q+Ox92Os?=
 =?us-ascii?Q?/wycoPBeRGPhYp41jnwAhG9LelJamkZkJELe68NZ+0APHG6SFOsr5L9VRAk9?=
 =?us-ascii?Q?Na7Q+yOk4D4+5wVx7ufmdyE131vZFM1Rm7kLpEOvnG3IL63tL5Oi0Ka9WTVO?=
 =?us-ascii?Q?po+9IMzAlcQnVybxORyfPkIOGj2jZxLgi1vU/FhRdo9O6qLGbdtmit+Hplfd?=
 =?us-ascii?Q?QpEjlhVCwHhl+/qcCWSda4+KxFtHgABwPH3MRuNdiiTHVBs58kKP9qoTzUl0?=
 =?us-ascii?Q?EeVn0oJ4DHB2szUTV2+S9mVeZyciqc51cbFjcqtB4P8vNj67SMORgVsyhOA/?=
 =?us-ascii?Q?/CfYmGrEySY76Ji6vXijUsIu7wzpHcRgg4PyEZ9f1nCnWB9ydJwuhQ4FEcMX?=
 =?us-ascii?Q?z7xg1+caggM/dpm0tF7/7AmG9kat4at5ESaG/6KY5NewNJ9J4OblhCRBT0e+?=
 =?us-ascii?Q?gzbd6qhCGz0s2fvLH+mIAnv4O507/sO2mj5KKs92wMyFr1Y4K5+6KXbzUIat?=
 =?us-ascii?Q?J9T2fcVvflLX7wls5Uv1PUeSQfil8T1Uz/FrDprPHDbtKTf4Bwk+Jr6YMmFc?=
 =?us-ascii?Q?p7K3LBk1wXYzm9temjPF0vVRAEkFY4hUh80WCaQ4b4F0trHHAgGZmsayVf4M?=
 =?us-ascii?Q?ag7qsATMuWcUTjJAd1St93MaeEtkFneh/K4KwcMIgnXNiGosVnaUxQTeux8Q?=
 =?us-ascii?Q?sRhOu9g9LsySm9DUQggqsWrFvCCiKpzEnvzJrrqgY+MD8DnoP+4rgHRjQwqK?=
 =?us-ascii?Q?rspLOqGlC3u0CXW8MyGpdsJeiNKcY2e5HRB8lPK2qGBzyaPAviWllb81kcIC?=
 =?us-ascii?Q?ohwFV3QYXhoTRsxOkiJ+qSyJeVV0bJ17CBk8ughtAEznue35uJF41sPX0Hdg?=
 =?us-ascii?Q?Bwof458+F71FfGYJ2DfGEx/WpRx/uFf6/LNJ8wFzeLjLwt1uD5vvHJ7OT2i+?=
 =?us-ascii?Q?pFCilhnsa0A7rRyrS8U5/RcqwHUujEVdg+9WKBJf/PUPtvhyYLTOi7lAt5HD?=
 =?us-ascii?Q?yS+Ky5njgQ32/qT8LLtoMWcc9Q0kPcvqZRDBsQHgPws0RoDAV3qrGRt5Kdy6?=
 =?us-ascii?Q?0XWLkT/PUJfO5h+roWhXwQefayuaOv6oWM1cDh69nBKO2Oy4l4KeRdi26jgp?=
 =?us-ascii?Q?OsrDmEK8qlWCQdY8HBTpeGl2p1czeFEDDpzdmbDFy1gya6cKviHQtOi2bgxi?=
 =?us-ascii?Q?fLrKyT0R1FrMZN0IVmCrvrT2oa3C5Iasgo6NJ3hulWwjS302HV5tYzYVzWLg?=
 =?us-ascii?Q?YAyXQiq0Fn79OhqR3syiTuQ/YQgwcabW4zsIT3dZMq4wIn+keggS3ME1XeOH?=
 =?us-ascii?Q?tObgiI4aufdyra5kqlRrIwOdyDDPZWNcPnO3m8bjFKc3M3GK7MCiDXOKEU3S?=
 =?us-ascii?Q?mwfnGtpJFwjILTi+TotxHovDh5EYXGWEcfKi3YSo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4689733b-0d83-4142-53ca-08dd7c4e17fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:48:20.9833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGHM6ZgpL7gIZMTwwJhIea+OuiKeGVh7OlTe6+MvqDDk5bl1zixoeGIRlnElQRtaxJWLhtdgv656SAO5G9KLVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10976

On Tue, Apr 15, 2025 at 06:33:11AM +0200, Primoz Fiser wrote:
> Move pinctrl_uart1 to keep nodes in alphabetical order. No functional
> changes.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - new patch in v2 (fixing node order)
>
>  .../boot/dts/freescale/imx93-phyboard-segin.dts    | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index c62cc06fad4b..0c55b749c834 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -228,13 +228,6 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
>  		>;
>  	};
>
> -	pinctrl_uart1: uart1grp {
> -		fsl,pins = <
> -			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
> -			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
> -		>;
> -	};
> -
>  	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> @@ -257,6 +250,13 @@ MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
>  		>;
>  	};
>
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
> +			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_cd: usdhc2cdgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> --
> 2.34.1
>
