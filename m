Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6771E573F;
	Mon, 19 May 2025 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680165; cv=fail; b=Bhu38pRVsztb5l2THCK7U2cUt2IK946AHdubFoBr/L2pzF9vH/4u1tqUkPmGYnfT3hTxgAsVqKbHqv91y2SOxX6oLDn54YrXTOoGwWkNpsJrJZmr2qerWWuyrD6c0MxpkwbizBeWq9tV1OKLjsDFijO967oKI2GUW6qPKhuKIjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680165; c=relaxed/simple;
	bh=jxZk8RyP3r9lNKG7tyf7Et1xSsH56kYIHp7ADNDKHow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aNxJGZf9/wFSUl6ccO4RyVuewBdM7xCcANNdUz1HsVQdYS3XABP4jj5mLWHLpgBZm+W8/OmNnrwy+lo3b8JLWWNgiQV+d5C4slx/lAd8EoQm69AKLR97PuUr7hIWfq23eVu8PhdnYiMkvUYLGNSmMfdFys6nonn3KnDDSFDt9iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mzs6Udy4; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mzs6Udy4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMXFSShHRJWwTuuiAL90+oxsC7VSGO3n5+LJw9j/MSJzw1+XWBZ2R0sn6cmfBr5dH+oY4tqy7Z37HxPP3kMbgiyZ2XdtgLpJcs0DfWTUrrrfOQtAMfZPD2h5e+pED7Co9oz5xvTZyhl1I3U5oZUHwq7zPLp/9+WWMJhsof0wpBuBEQPCSxnMsV4fYyj/qWFr9ELa868yfxho/Iee89OiiObpkSUa3M1RVnW41SJAt5Qb8N2omNiZJ49GSO7EznPHMd4fcnI6pW+Q7pS4+6SxENCkt+Cb5w6yVxfO0ZNlCs2v7f62ETDXvIGrDaeJRKb52unm1fkwFTllP43hhXiZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e41vySFPErNQnVoah4f6Ip/F82no6PvmvBg7vNienE=;
 b=WyJi8WUARRk6oDNHA2kRoI2qr2vwMEOs1hLJSqqRmuQ9Fg08ctOq6oTBdyYDAYlDGcS8UnF48uxwKkwG0OvEyhz3T91LJlgi37TomtQJZLzEBYLAPcxUOURYsUF0LorSDj4bsEhSciMeOqm//8sO/rpYC0/FdcsQHgLArk0yXxQfdrJPtGyt9PANbbv1lQ+ONIXND/ZD/QiELy8xltv7ESizxnYlg1MmeDcRsTNfPMqyvwZ9sjEcPMZUZCecmpdaId1cHjZ9sJ3iRxdjlJgPyAlmiYDKsi6WJeJ2kbvt+MWSrh1miS1e01xUPRQfxGCCuUZ2PRCarUUjHLS7+bYIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8e41vySFPErNQnVoah4f6Ip/F82no6PvmvBg7vNienE=;
 b=mzs6Udy4tVdx6l/4FVT3Y62oMnlxhXQXlQcvBQyzmeuVcWmo8YzkLx6GECBG0EBPEeTpek8rw7XDUT8pm+ZVXjAStFamts4jO/FmY/lulj2I3H171RZFEeBHgupm0wmiO5q4t6ST4cTWawkLSVLmkZwhg9SdBomllD88RVri1bwgAb3mudaZrKj5fB0reyADKsa4dRz0P1xH4ORv+XL8OIJjZoZFUxykdpd5LNzU+IQr/OTXSq5FeZvnuuk9PXc9ix86+xTt95fvXrVGC616rglVdmJG1NJOv/mSwcJfic1xkMkxlYIVNqA0CY0pUGDlirx1t8BOLOQU/3i+d6wqyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 18:42:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 18:42:40 +0000
Date: Mon, 19 May 2025 14:42:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
Message-ID: <aCt7lrPW08tR6oPL@lizhi-Precision-Tower-5810>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515051900.2353627-2-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 351f8bb8-11c2-4868-620f-08dd9704eed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YombQzz676UMS3u8TR/86sb/ZPeRVm78ejez2FSddG2fni/owHuGdPrkD/KR?=
 =?us-ascii?Q?unJ3blruPJhxGvS6udGwapeUb/FXbZFwiK6EEsH8pE+Vgst8LWgp+ulmHWA5?=
 =?us-ascii?Q?xRDQ1O1qU0ZGkx3WQu9UeIkgIVJYlWhd0mYqdpfx/jI4LLrVUNz3zQVOXMW/?=
 =?us-ascii?Q?tU91rhjBDjleos8uVvbRcJXlTvNoyldRKQdkO+oPSrgJ/Jg9715uLF30iOMq?=
 =?us-ascii?Q?8kkJA/wQnwSMUKsRW1uTFgFhiM5Jt25t3hSuX6uuqAs2Z6IyhsCZSck3LHfC?=
 =?us-ascii?Q?EvQcDkApZQFd3SiHJsEeqAY+ec4nHXGXFnIwAV3m8/iShvgnNAHNTiIVA/82?=
 =?us-ascii?Q?8raOmev7KJyKhm9fvQqJCK3zO2MtZDy84ZZFMSfCPQhd39CpmANUU7ufyp63?=
 =?us-ascii?Q?BkmoqAoDsFPaujelNZ9JtJFUHwSIE8WkEF/N5RfeXF8AkvLOog7nIGE/5e1E?=
 =?us-ascii?Q?x4api5G0x4EeNNlbnrbeDVunrnICXL4TD61FpiBTroUqaDuUSfTDgQXynLN5?=
 =?us-ascii?Q?s8CbUu/gVe+/dxqFxWsVZXi8Jweh8JEAecw6kQZGw/2rOcCHG3ITcyRuQza1?=
 =?us-ascii?Q?krTT/NzyGCbmFy7KZsN1Dn5071Lh5vBEHPsiEgy8UD6Vod+XQ8aBXkIufLdY?=
 =?us-ascii?Q?5tSagvfZ4403WLSTnbm8tbVzfqrYozFfEmvO2ErVX6DI1yhgQoaYrlqmtseW?=
 =?us-ascii?Q?oxScy6g3wDekrx78j3m/GNNuJMQh4a19TMsM1J6fHo6/PtzNmfjFsSV98NMT?=
 =?us-ascii?Q?Fx0etnAORTTRm4qaOwqPqQxW/Qqu7Snz1day1kf9XrkJxbQpaCJxO/fTomHj?=
 =?us-ascii?Q?tcoEK6gvwzEyXKILKBnHv6lrNpTjHKlTzFugluXnzaUlrfWpwP2hZPSbYUUg?=
 =?us-ascii?Q?QB8IsnDdqfHCTpmxzDLV9sElOncTi/RXFlPhlpAatZLiSJYbAd0bv1LcpnXD?=
 =?us-ascii?Q?KWSvEQrGU12myYaV26hKGd1qm0pqe76PTJCyyvpUTzbf/kzE1I9L+060/L3y?=
 =?us-ascii?Q?HNYAI9nfnNtixEjaUBadhgT4tDiBFFg0hNWDBeEWwnaudjyH6M5VJNesILEu?=
 =?us-ascii?Q?QOploSFIpWci/dmtibM2USDGEK0EM+IAurA94DZ6q5lpz8+afMl/fwn6Aev3?=
 =?us-ascii?Q?9Och/ajFeSkTtUBhKHgw5h11YdKSn6zvEah/hgO+6UIESUdYp0ohv3DjzPvW?=
 =?us-ascii?Q?t5ZMyH4jmH0MRZFoxE1IURVMQwuDyM3wgVP9QqH+IeJP1AWIoWJLviPOTIZd?=
 =?us-ascii?Q?caXux4LqKRfxjZePJlWWifgEX5W0UVG39NprqkA76CXizDPRA3GDVsPzGnzb?=
 =?us-ascii?Q?eRKSZ6MLI5reJ20o+Ww7Uza5tg0NqI8kAV8IDf9WOdcTvyzpWJMEkiID9KJz?=
 =?us-ascii?Q?37DGYd+ayf9sLC5tY0u1gs1c9H4CkpvonSg9T772/EZXNPj+gUy1o3qX9mKy?=
 =?us-ascii?Q?1fuS8R0b8jFU6ZImmskVkQ7Mie8pjBJ/fGxCi5wBcCNYcv0UjTcnIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wavLVP1HAhoTRl9WXoGAvw3ZRBRtd6U+kI11rE4y+SnM/GgWC3NMvmDyxd5K?=
 =?us-ascii?Q?jsJ2xwcyr7Ct10T11omJjOTEiPP/67wxImMFsyDusIngl6MaDAcM1DNMCrLY?=
 =?us-ascii?Q?73VTg4pyX7SGAH7J6hnOdmuKkSQy4y+3qBzirDJV4gYNYD+VAe4fa/8Q7Dm/?=
 =?us-ascii?Q?HYkfn5FNpfmy75nut3PQtu8uWmc6fl/h33eBM2MhZiDUYl0VXrFDxKi7VieR?=
 =?us-ascii?Q?1Ii5d0oEGGpYvNgDDkqFlbElMEG3m9kZzySuTzR4uQc6gM0yDAoZiI6tkDBz?=
 =?us-ascii?Q?18qnzBosYSGO2ctFCOQ3vbE7aSP8aiyw5dlwPS6JU+0gvXZpBX7InrJHr8nm?=
 =?us-ascii?Q?ZkdvI2siwkXEe3eGXbxT6cgmr+j7B4Q9m4n/5rlVjxa/aGiKIrxCYERFvIOz?=
 =?us-ascii?Q?eRILby8DI1IRVrsLPOmUFQzcud18ImC3xoZHGnn3T/n+qRi008iv0rLYypw0?=
 =?us-ascii?Q?OrrX8FkuLXZC2t/xltxtJ9bgaWd/OhSRtmyyrFkExjcHFh6bGdsWURODIKsN?=
 =?us-ascii?Q?WrNvxIUmeQaPkxUTfIRr7KmatAshGrH5NYf6C7K8AZ7aKdIpXbio7SMlszmV?=
 =?us-ascii?Q?LLXRkTWUOSp4dZsNFIMw1+TG+Hpu9mCk1jUzvrgVuQKPQu0uAFslVlL9gY9q?=
 =?us-ascii?Q?dsczsVThtvjDv01oIwM7E8dtqk43AOL+Tl6C1KL+TKIOHlmP1wjc8EHBo2L5?=
 =?us-ascii?Q?v9LDQQVCm6csarEedQFYsJ0HCL/2eIpqPOtNHJC3dCRnXVVrhU3BMcul9EKE?=
 =?us-ascii?Q?l8sI+IRQRPJ1Ezshe8KiKSwvRTcXl0baol7oXjdA9HgL/ts+FQwcEtSf/CLj?=
 =?us-ascii?Q?D/HmVcqryy4h/hH7i/5oghkhgJNXzWQtcZ6r33DfM5H1FMymOkuFUGTV/oEL?=
 =?us-ascii?Q?wuVnYFa6FPutHg6W7g0OyWkDrG2dS4bYrvcnIisIt0C8hXQalI+uas07ZqNg?=
 =?us-ascii?Q?szsluI9FIfJ1vO+Q8mOmVkYZyKRLl1OK76AUhTvaQk8uQVkgOuG24FWQZ65A?=
 =?us-ascii?Q?lOxRFiv3BI7ZfyQpzSbs08GI1LvkYXiIH/NtWKsdcWFNHFLVRnz18yeeWfr5?=
 =?us-ascii?Q?smQoSG2gi9ekQdoj5ZNIhQufJO3VWxfft1BSy+18ysiu0Cpec61/ORZM3NPi?=
 =?us-ascii?Q?DT3uuPRLDi+fGvbeWLJNfAz2bkO4VKc2479v9zARRr9N2cApfcnIB8ADTILk?=
 =?us-ascii?Q?p4t4YqBxLH+Ee24GiQjNkpd8peJBy9sGRwREinSzvEPJsRvwnURFy47dUalx?=
 =?us-ascii?Q?KmQ9fnQIk1p+yoiQ3kFmNVnD6uWVTqp4Be7cPxvN0nX+R/rB7/Bvnh7du/3n?=
 =?us-ascii?Q?dyfrVLIwBv77hxyvqRblQs0Pah0QqTGzsitexuxw0P38HFI3++1FYmQlPONi?=
 =?us-ascii?Q?82bq6qD4n4BfqnO+KzQWUC3gOVrYtl6wvviIzjC+z8cLkVYLnYMMO2cPQ9Vo?=
 =?us-ascii?Q?jzivHtwJSC/O15bu5Cqo29weuwtnuActNn7HDhyWHnysEnmyoJVzuxH55nNP?=
 =?us-ascii?Q?yabnQKdnDmJmzkkQAhCZR8Uu4bGlV8azLFNATN0pkxsds3m8Jzo9yD3yF4as?=
 =?us-ascii?Q?6lDPQlPgKZBPM0jGzJo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351f8bb8-11c2-4868-620f-08dd9704eed8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 18:42:40.0956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7odWeUFymxvuVFckt8WU/HAEEZ6o2uVkFgwRuV57pax+jGKfUpL4HrS7ND1kMA4sMfOxhZgZluQlqsPNY8viJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

On Thu, May 15, 2025 at 01:18:55PM +0800, Shengjiu Wang wrote:
> Add micfil and mqs device nodes
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index 3661ea48d7d2..77297dde5c95 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
>  		};
>  	};
>
> +	mqs1: mqs1 {
> +		compatible = "fsl,imx943-aonmix-mqs";
> +		status = "disabled";
> +	};
> +
> +	mqs2: mqs2 {
> +		compatible = "fsl,imx943-wakeupmix-mqs";
> +		status = "disabled";
> +	};
> +
>  	pmu {
>  		compatible = "arm,cortex-a55-pmu";
>  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> @@ -1045,6 +1055,26 @@ sai1: sai@443b0000 {
>  				status = "disabled";
>  			};
>
> +			micfil: micfil@44520000 {
> +				compatible = "fsl,imx943-micfil";
> +				reg = <0x44520000 0x10000>;
> +				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>,
> +					 <&scmi_clk IMX94_CLK_PDM>,
> +					 <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> +					 <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> +					 <&dummy>;
> +				clock-names = "ipg_clk", "ipg_clk_app",
> +					      "pll8k", "pll11k", "clkext3";
> +				dmas = <&edma1 6 0 5>;

there are include/dt-bindings/dma/fsl-edma.h
5 suppose should be

FSL_EDMA_MULTI_FIFO | FSL_EDMA_RX

Frank

> +				dma-names = "rx";
> +				#sound-dai-cells = <0>;
> +				status = "disabled";
> +			};
> +
>  			adc1: adc@44530000 {
>  				compatible = "nxp,imx94-adc", "nxp,imx93-adc";
>  				reg = <0x44530000 0x10000>;
> --
> 2.34.1
>
