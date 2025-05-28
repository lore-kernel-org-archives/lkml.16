Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46028B3F6;
	Wed, 28 May 2025 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445092; cv=fail; b=bieVEyGyf1BqjKgTTnAvgxY2WM8TYMQ8X+KPuLNmMkhKlRW4zMz7ewsejHruKdJtXMu7Op05tZY0l8Mpv6ba4BXH7SZ9moAwxTE2wqHqk0uCpMrxkzOoqX1+PdKi/N8GcM3NvZMgZg3S4IOELLAm5m6Z/RnIhTTdnb7R8R8IAVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445092; c=relaxed/simple;
	bh=R/cw0kN+w6gGpu1CjMV7f/l7BJJfJ0gYBMXuOr9mdO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jl2pB3sTLThkJLac44Ubw1y2Cm9nZTqrHaVdu3+dnf8UOeua4fcVW6VbCGbsKtJRCijF3PlfChG8MFwFC4rUQHmFePmm1cAPh/8QhVNm+q7YtEwbQgaseTf8/rBFWWHEufIHuQvOizVDpAXqKb/HNvdFdv4PcS3KJW/v/K8eKQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MAv9VvYZ; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MAv9VvYZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9zOruDjTE1RaBsWbFK8MOuI5ZZM9Y+BgTGwFayYVwZQk51Ay8cCr5pACey35GI8N16kY7jUR/o3xOIUWnt2/VO0ZJ8gN2DayhvM2mlVtfYV1Q3d95agKEa52CmjqaA5xBBr5i0tjiqmMz/4umnpCKSAUaWZJy4XCWTpqPJLJg06HOLRJrAyFAmM4ulLpSfs7mujRbSC6iaHZemYlhriIWfJ/gghuzWYuYpzQgBEgvyp35Gw0FpXBpyymi/neVJWjZO2kMbAxAU1DDwHeULnlkcQHzhtbNUBe85Rxw09ipiZxO3kl1Z9rGt0KUoMq25nxGa9uV8TuB/VuCC/pexa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWWiQnU/tt+DrepxgPi3mMduquofqqswkZ36BcCdWsY=;
 b=Qv0CwrrHg9aiPE/vj9Qnnr53SBOGHWH4e1exd17khSVHTl4WGQoGJ5FM4ouNSbyGXfEFRgvAT8zSD4XcY7jb28SuprNV/dUohYAJRas6EBFc7ek4bCsaqgTB4mgNQMfa9jUx45ZyDKlV73xAGBg3xIU7Ch8eHORF+tlfUnrS1mLFxAEK5yqCJ4bFxhWKd07uIK4avZSvLmZhREh1Q+lQd7HfKJf+kLke0fnokM4lJNh58WdiMqj7VR5C4R5XOtCOuCbrwP9YWm4VVbSkIuGBPcg9VlSDFRn9Guhu+KzORBkRFkrVIdcXSe3PjQ/MuJm1zarj6rFYeKxVyN/w3DbIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWWiQnU/tt+DrepxgPi3mMduquofqqswkZ36BcCdWsY=;
 b=MAv9VvYZ/YOjKOzxLhnAr+ME1wnRIGP4v2y8+cMbo4Y8JNPC4x68KXMNj9Lv3AxDg4tZIbak4ZORKaKa6lI3v3hZF3ZiFbquTisDFeC8XH0W6hvs/0dGKo/vd1ULXu8tNR9Pyw8a2CA3X0LqPF885qEftVCQDCpJAdhhSbAeroBuSzF0K0IjYBmH/isWumgMXm1dDYoq/K8/Mex52EdfrucmUHbiH5y3/NX++VK9mxWosk1tvxGMrTHdUycjXGWgw7YymsRfJJR0CGcd0eXHF8GPuPjNsq6WZTgjtCsyQElenu5Mhpb1t+objHs6Ym8ASgbqbaRWSrjExjX7V1NGQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 15:11:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:11:27 +0000
Date: Wed, 28 May 2025 11:11:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH v2 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
Message-ID: <aDcnmmUiDD8fmlkH@lizhi-Precision-Tower-5810>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
 <20250528015837.488376-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528015837.488376-2-shengjiu.wang@nxp.com>
X-ClientProxiedBy: LO4P302CA0007.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c6aa47-f84b-43c1-3fe1-08dd9df9eb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9rVHKGZgGB9LDGFm4BXJGaq4JFfYpZPOPMqd2LRg4ABg6jhGl0Bm4X5UKThy?=
 =?us-ascii?Q?tKwcH89dqnwb5uoL3jZY1+LKpj+CLX0FpKUW2Pm5GEkO/ST4+Rvl4Eigf1UF?=
 =?us-ascii?Q?L8dc/UKxwNF3LmQRoIIDJVSPS8DrrhYu5DZ37qpxF9nazlbHp6L3ZYm+QhSY?=
 =?us-ascii?Q?SRpqX76HGaIm53cC0yt+NiLN2G7gbRXEEjiudH3mv9YA4TYvKA4MOpE+Ad3+?=
 =?us-ascii?Q?G7nqJbBjmiGKOc4odlwFXDAipc8wm588X1VdmUBvZnf/OKTG4YEBvstBWx1d?=
 =?us-ascii?Q?gY0k0KKHufYZqlX6G6ELzSsRAMNZwwV7joPgKZyQwwPRnZJau8175whjCNb3?=
 =?us-ascii?Q?cxouBNnmx65Dv5W3XsiqQxfCGsYVddeDEtTA9wcTnXtPCljkkFsm07KbYBH2?=
 =?us-ascii?Q?aNv+9f12tS1b+bDlK56kdlC2Bs9Luxe/FzzdfBthyA2aoCQU5lwqCQEbSAcR?=
 =?us-ascii?Q?xeDPTBsCASGqWoNu7Ip1SuJTTV+YV4Rpyl/3wtrnqvz1euj5/xAP2Z3JFDhg?=
 =?us-ascii?Q?l56omSZWB+PW0IcbIl51owPmRl+xfvmVtQFOW7ffl+wktg55a8K5YQas+cM9?=
 =?us-ascii?Q?+qndbPKPmPcw5/YuCYVHVyYj1f9dFdxwqzqOjI2c0h2oBEwifvYmNHYeRJms?=
 =?us-ascii?Q?Yc2BCPCNYX1zHthMp524NEoBkmVeB+BIMGVFrBw/sQ5oXd9aMX/VYImDLtLx?=
 =?us-ascii?Q?ZbyGKN+LPa0Bi2JBa133lNkIooTkKWSFcTS38bETj6G0ifEfR79NjpHxm7B/?=
 =?us-ascii?Q?fyavaylQMCRXsY66wMAJISONd9PbktJkhqVpW5E7K5+J/PEfANw4ePdtI4zK?=
 =?us-ascii?Q?T2jrjLBrq9pLdAns0OdGeFRmoj0gZAkZJjP270mUJg0wfDFaSUGsjABIjZY8?=
 =?us-ascii?Q?0TCjbzVPCrU9Z2aVsJ9Xf28fP1T3VL8cDLStB3wsLNNIX5rcy5guxMvRJASF?=
 =?us-ascii?Q?TmcS4hSjwwT2+qENveTVk8qoXfMi6TitP6sJSWJTbU6EG1ux5LePY+jQ33XC?=
 =?us-ascii?Q?oMhZFJkY1obuOaR+6vn/Y3Vhkw9XwXn33IjRw8kGw8oENMLJjkPxrnbC8Aai?=
 =?us-ascii?Q?YwHpvVqY1r+enjivgZyIQJvNkMqPdZADoTFuxI7v5GvFjR9Ls4cjQ13ekFCo?=
 =?us-ascii?Q?MEyzTElyx4EbetdGiMc6CLE1BZ8zL84Om/26N1RooMtLv0deWYJEHG5X2nWN?=
 =?us-ascii?Q?w1wRg7YrnU4JKm1SjeNNEJM8eYuqqButtjmGYMzaVvCeh+F5QtD4CY4n3/2n?=
 =?us-ascii?Q?1wJkcC3VEzcB6Zk537lIzjHMxybbrSWomRvfFQAr5Jj7fw3XsyF7F3He1oZR?=
 =?us-ascii?Q?xTkp86obhIqCu3VDs2tjNHL4kpNqNJEuecgTqqLGmg4svgvY6S/ps5/goJPE?=
 =?us-ascii?Q?oAxUNE1sMjz6cWuoTgPKzvVQpJUYczxr2rQbcuaMmK32z7r/RJ74pTnivCbk?=
 =?us-ascii?Q?tyFJ0X5qXwGs8OaYFnV57pB8FGyE7/3Tu0CIM87QqNI5Oc+cR19i2DVvtRGO?=
 =?us-ascii?Q?hm0VRjctTJGEZIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5+oMry0jXlGcyfe25wIMOyGwNJPNbRjcLAyu0ni16R52ePpbTyrKr3nGK+7?=
 =?us-ascii?Q?EsD642sEqWRxvHl4pt+w8ReR3EjwLhaBjkDslySL0f/Gjt5EyQ2e20jkeW0Z?=
 =?us-ascii?Q?j6td8rp1is5WBPwCyvXdT9TsnnMtgCtDRYyYHsI2R7Igj+AKXHuTv8FAjc0W?=
 =?us-ascii?Q?DQGYhQoKVcc4J/aUH9T4JBMI/PX8xsI0c0tjBeOwec44dE7BW9yVMH3bJcDo?=
 =?us-ascii?Q?56yIz1komLeIcHzjhGXBJRQqz/s3QDf7xk8zPrjffP16KiMDtRZXYnFYj+zI?=
 =?us-ascii?Q?2DBSBQAc0/D4XvHT/qBdEymcA0y1UwYzm8qQD5IuugDJAz/BQtORVlLZQKVY?=
 =?us-ascii?Q?NOBzoWeI1dvm/zLWUs8EOZjx7rGv+zF3BUv+G9bk03F+7O+/7jp66MYANvyM?=
 =?us-ascii?Q?GKlISx3Gb2SLFVIL3V+KbPRv/93PrQMA1024yiRbW4vRQxAj1qp4VgDcajOV?=
 =?us-ascii?Q?/I56HP2QBKh1zgYm6KnkLS8otpjj1tQtgzep9s8ZFp8s0nE49OXOqPIM1c47?=
 =?us-ascii?Q?j7DFbQmWh+8n/A4jEw0Vrj8xy4upBOiUj3SRiKltDMBnHD8JLFbSEQJiJz5M?=
 =?us-ascii?Q?xEMZckt59VtzMhrNqCWiCD9alPaqP0j1RKF//Ng4mV40h+nxdE+TQWMVmK/D?=
 =?us-ascii?Q?kX7u7nWRD7VRED0yXxRdWdIjklUjEx3mU2E9uYh7vaD5DOFqq2rS2/Y5ho1p?=
 =?us-ascii?Q?rTqBPTxi0jXrhuazNrxpQIqtO5T6jLWJrn16gxw2tFY3k8P0q5m0dNb4DKYe?=
 =?us-ascii?Q?sBga37PAs4oWnw4l0CahmN2o4SQxCniwMKeOdnDyXTXIYobhday7UcnOnwoT?=
 =?us-ascii?Q?CpLpLCeCJvRUoaLWX3vIo6BBjLr/Bf16I+bCsiN0/E0JK+qFyHy3PWayQfgc?=
 =?us-ascii?Q?5Lpbl3vclX1IhrFXnYsQwefKq5FHFEiXQEhCGlRhd9mkewGjd93+ri5xkVcr?=
 =?us-ascii?Q?cuqrFijiwPelwUJHKyc1br3vIZX44WPTk4gWxmE+1chS7/ocLb3ejvsJRPJ3?=
 =?us-ascii?Q?EzspMzLRyUT4kdn1MDIcmlhZWRjfXQOcYxnW0cCzcfE21nRu4k56JR+LHYtI?=
 =?us-ascii?Q?yu36NOcRt2GRPvnZZzLUPugRStG8R1eLso35d8m5F02YU6vC3KSgdKu2UU0E?=
 =?us-ascii?Q?rykUv5OqpRTZZOXpKKUL5rE4h65MSTF46fS83ji6181JdEkb2Pi10wwJ0tes?=
 =?us-ascii?Q?OyQn+a/YMvTYshExOrfAZd/2GMsXZ3aq2PmBelS1FYbCATccRqqlPx4HXfvv?=
 =?us-ascii?Q?PBtqKvxm6aRqFSrlxDb2mvGOYroWUHLcGlYEQS/8RMzY5FPZHknezoFBkhOA?=
 =?us-ascii?Q?J4EZumoyRB9OOGMw9T6tYe0X6YUwFacb5TkI1ACWf2Isr1mNYUUPLgd4kDqd?=
 =?us-ascii?Q?lFuJpdeB2Soxe+jvniwjqRpeNd357bbH8uRRWlDRwPxW2Z9+FsIRUaMeOHq5?=
 =?us-ascii?Q?dqAfqi6vitZPjWJ0M3MfwykyThBOLp9TOH22kCceEAOWQT9H1yoBM9ztJ5fc?=
 =?us-ascii?Q?22wj9OLSyEcJ+h2NibEoP+nkdhjIpW+iO+nbcHtbVNoBouQmo6Al+iMF386O?=
 =?us-ascii?Q?Q9pNhlPS/IUnK7z36O4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c6aa47-f84b-43c1-3fe1-08dd9df9eb24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:11:27.6465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ks9fGlgjYRSZT3Bk4FxnJiWf+7uDaMxwIM8pmVEIM9mPnDTd9OEn29KUVfy5DMHkU7/SqoFSb8JBiw3x96kNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

On Wed, May 28, 2025 at 09:58:32AM +0800, Shengjiu Wang wrote:
> Add micfil and mqs device nodes
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index 3661ea48d7d2..66ce94705ba9 100644
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
> +				dmas = <&edma1 6 0 (FSL_EDMA_MULTI_FIFO | FSL_EDMA_RX)>;
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
