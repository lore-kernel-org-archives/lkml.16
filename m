Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069E1F4CAF;
	Mon, 19 May 2025 18:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680293; cv=fail; b=LClZt4RdoYAMvC9QGdpYz2k0YzjZoaYOVQ6iWp93OHK/BIDtKTgdFIt4hStmGB2f9jehMFNaW3dccxRmTcu6NW5cXnvL6k91ODefFeqqZYksf7jt0Mv6Kqd77JTZGVWepFviuAK7giqtNP3r92hzDoXG6xxNLABEVS7yrfQOC18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680293; c=relaxed/simple;
	bh=BsgW3RZ7iauDPiZl+vs3CJv6DaFlhmvgLmrn+oluu0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NBAGWIkYQOOyEfI7IAKZty0QqGTNH4aOXVWTj7lH7RogIUYwn0kFwngd6Lzr59vahzLtDwHJV+KyWWp1dCIfNKlwOEynyoyvIDa82RNVPuJW+pg3xSxODgeRj7w5skoCUJEHZ7ngVfMv7reWvb95Fyx55LTG+3cXE1uzUb8nap8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CP2XdBiK; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CP2XdBiK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM8RnJw65x/rcpW10BQdzXUi2B/2LpxTWt7eejaq6EMslfJ0KBgd2CSbqT1VpZr4dM9uih73PKjjsa3pEmRsRGDHgGpBA6iwRotcBZtZQxuHeDAv1ITbO3coYIt1XEV0G8jcmVFQRbukW/RIV6FgvHSOztl1PGFbFm5/LLCug9irtyjTmcupIgMF7fLM3WBX0I1kM8wHb0zS5oRa1Ep1kIih6KWlw3dgbT4yjhoSZq5omgsVvgiz4J6bu+0ue6WBfr+NHyXYrglCh5RJnlczOCyO4e0YAtenHQPbDu4o108vafWc5gP33yBtt7ffQntHE72xKWdv9L9zQszwh4vDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU+e2cPG4lChdzYdzcOsUefdSUsynmwkLFH0enZEJeg=;
 b=XwQSzr1m91YMoGFzwG1/18qsypirYJx7imQaQeIsgAMOJE1V6fVngKYCCWwu40yQwgC22/dBE8P090s5qyeLtPSNTbR4A4FHmyCLDUMraYLq2wnISIWPj8BsMF/VILTcJq03qBxXkr1LjvTsKX2AcPaNylqv2U3tiXMi5Nyd7aqqrQPrmdyz2lLvgBVPVsLWA3Tmu0DhbnkcwLLsG8cxawCiIaybwrkg54/k3Yzbdgw+47LMCzuTHGgNGl74NmpaEAWuJqWoYy0rZhmtx1VQ2r3yjpTsNl/gR0889My00lU31lcZTwx7Vl2U2ghmRY6dAyeDe51d9ObB/OMuFHXwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU+e2cPG4lChdzYdzcOsUefdSUsynmwkLFH0enZEJeg=;
 b=CP2XdBiKsEaWNcu/gbF0aWc4tdmhdPa94av627tvTemarPKdzvc+kbwunfEouTPvGGcE/ynEgivtbR7GbeoM0wYZcD1bqmAqUHWMWuCZdZT2HeK8G91RwiE+ed642Q7XJ5E1eQ20std+4qUQs5pQhAB5GM2bHqKZPQUG/kNgZVYcloX05zbema9THoy6r02gRJFSUacxSJXC1q516zHFwhuxcUvJGOzaf9cCPdxSO9aGUog+LqTMJ8BeaDHPcrn14+gP3rBwbZfBuepB/K3SM7/rQr5CvA6DirSabB2nVdhY85PhG1QbbuB+wUCmPXl2sIErgFMhxJPbsXR/oEdFFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 18:44:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 18:44:47 +0000
Date: Mon, 19 May 2025 14:44:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH 2/6] arm64: dts: imx943-evk: add lpi2c support
Message-ID: <aCt8F+idwMI6OggH@lizhi-Precision-Tower-5810>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515051900.2353627-3-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0464ae42-b045-4c2b-22c6-08dd97053a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?woTLTa9qXiid/IQroDZuNWRqZ48v43E/6yVQlR3ti3R8P7Jh5b9b84QcRDgx?=
 =?us-ascii?Q?X9dDVssP4EW9pfkk26uAENZOh5u8UuP/5yrXT1VJ0ccaV7eX1Qbo7Bgskhpq?=
 =?us-ascii?Q?tJ0DXEeHpAQonXYwQM5XAEwiw8Vdsyq7GSjGw4olLIv8hbOQeYBCJG1wAU+f?=
 =?us-ascii?Q?EhLuDG2qbK2qEHKtXa+owcDyU0PI8WSBHgApp+lBE8Cf0ewo7f0CX+xVVGV/?=
 =?us-ascii?Q?P9Wqaymn6/Xvam2fBPTdG+QLWvN+SUSdVa3ePBzP4G7S92xwp64Q7ppdYg67?=
 =?us-ascii?Q?sBgyEWcLAUdAwz2rU30H6l63nR9/CTN/5Eup68EgW1tHa35VRP3lKku4XYc6?=
 =?us-ascii?Q?11UG+iypSyD2xxDBkwRgwGKLdItXL/ZHkmPwnQSwMGdBN9CB+Tu3fqyaY38i?=
 =?us-ascii?Q?hxSyQolMFSOWU7RAoPxSdS8fFVvOw2NsG495QO05SssoOiSRLWsRSeTojOpg?=
 =?us-ascii?Q?KgJDW04rK9S0ceYe8aMu0jpnK46DrUVOIywCnBbYIib/kF/OgnFfDMu8oJyI?=
 =?us-ascii?Q?vosYFTsAyTGFhjQW4agU0lDZRzXHsG+a/599g9wOUkjnbOM/bNVul8FDYD9Y?=
 =?us-ascii?Q?uBNUrTfr4F1KiMG4BhR+ihj7/SfcMyKvW2zTY2Hykv2baSIBGaRK6Rj5j2mM?=
 =?us-ascii?Q?vWq+FVe54g7qBlDqv3EjCReCt4U2th5pglT607IdD7aGnkwbmj7c1NIcB16t?=
 =?us-ascii?Q?0foC/AuiUN357h9MAxY2qSCB9HPOtTjiSZHdf0WenDBBiXUJFwHflunmKy3m?=
 =?us-ascii?Q?ydONgArPGSqSEJMTGhuI+Qttl5oSBJmNnx/IF8UO0TuQwZMrwltTOzcbqnAl?=
 =?us-ascii?Q?NCG53dN0h6lV6Q2bbtb7XKC9hyB81L63VlLtBlXbxp4VFfMWPgeSV3G/xUW5?=
 =?us-ascii?Q?8mgdnPazrFBoxo58eEzAi8oYvPgXj+RoVJ1ReE0mN1FnVEa8rU1w2KYiBmRh?=
 =?us-ascii?Q?tBrP5pHJwo/QNr4N9CS/b3g9UuC8xa6xNNzUBNx9DCLzfTfQNwrJSfuQMZVq?=
 =?us-ascii?Q?auVbHoPxbC6WmLqHfmG5CqAe4WXB8IZIg+IZVtLqEZKGigjzWMXCo3RQNLYe?=
 =?us-ascii?Q?xSguDRUehtyy65NxY7kJdlfsF3bQdBN/Oo71VBK7+36FWXfzaWtoerJraEvv?=
 =?us-ascii?Q?EW9R39YKTPVDGGCmA0Y+dwZ6P54e4JD7Ja59aEbUfFCfXgJXnN2+nBNNtCWA?=
 =?us-ascii?Q?Mirm2FSF6a6+fVssdJdV/t1TfjkFSlVcE0ShD2YhzxHkBeK/b9srnqZkmzU+?=
 =?us-ascii?Q?Kl4+ylk90ev5KJSfIjOv9MStNGUUrfckVZ+aLuFrMpYY6YFG/LLlw0HmkolT?=
 =?us-ascii?Q?AmqKU0ai53SdMYhGieL+20RF+T5cWvI8O3kL5nUCQ3xKjNAo07zHf1bzYR5T?=
 =?us-ascii?Q?XnliSMJ5ejb8UrwfXMxqfuTR8V8DtCbRDE+RNldYbU1lfBgBaAWhH08zMifz?=
 =?us-ascii?Q?lzFE45jQu2lHT7sfrrJjBvFgTjFlV3kdW7gMRT9s5Vj+yalrq0m7vA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VBSMMFFmHvFAwOz3xYdok0vMqC+psSRHLP8Do5pvK+r+7wPgFbHKWbj13scj?=
 =?us-ascii?Q?a1rYnZthbmBZoFZrqwKr62qsi11CPg6EVOI/aeEUJ1/kvxTMxFkX/+4VECW7?=
 =?us-ascii?Q?Sdy6W6TxfIFLU4KmcW1HLSiazTAj+KKlSpKXRVU84rpXbe4zzl1+aUB5C0Yl?=
 =?us-ascii?Q?lkMqo3gs0srgVZCHwiX6RNUuMBkY8gZWngMweS2lVawpgD2FX5i5Ng1iH/qo?=
 =?us-ascii?Q?HCRzcRbqQcGXeWkzyrh+9VISrLwATtOrdxGLYu+wpxMHLZRqncehplZbKeTL?=
 =?us-ascii?Q?9Znj1kUpTQr5xG6/M5UiXDS8c6ik5TSfptrq2dw/2a5RoxN1hHE5s8krrocl?=
 =?us-ascii?Q?yLzOSyy4s6JddEtaTFWh3NqL048zIqm40DV1KYjhHb5Jh0QsNK39eYYIC/XF?=
 =?us-ascii?Q?G60yhvsMAFXub7UzkoxlSYX2grL+Y4viJMxboLop6jLlpzVOISLoLRjaNLhk?=
 =?us-ascii?Q?fLdxX0kdqBkIdneolIyUc7TxcYTRXat1dm/nPeoHVkdfP4LZWqSl5bVtL76D?=
 =?us-ascii?Q?9mYTyc1u1B07jbsjbFROUQVq3mnhix9fny3WiRGX3p4ym3J56LgrAkCnSHp2?=
 =?us-ascii?Q?EevWZpZfzf2P5ACxshTF/Bbi/oK6t8lOaqBPYmJ9MqMq0BCLPNwS3QiLE3Jc?=
 =?us-ascii?Q?TeeHU7+VVAUVAZbdqFIHCHg1CNyqhUhMW3szuFKS80iVDsKA2ZK/mWIHyqyG?=
 =?us-ascii?Q?5jjFVblojOJW8J7D7/CAmA/MGgYKnpRoJJ8gOW1GdMQUcyy1FT5kXCLIXBTC?=
 =?us-ascii?Q?mmr3iRNF6gxVwnBgh9oi6JO5FbLhV6EMfgEvKXMQ26vHY4f6ui3JYqdIfdOM?=
 =?us-ascii?Q?Tjyz8JRaqFemfQ4icZ+U8a7HV/8UI0Il/6T5cF+aQdfKQHL1r55CkEC/pWSH?=
 =?us-ascii?Q?fkPNz+fpp5YdH35YuFUmFarrsU6ygpD8RLFStC5uV//7G5FUw35ghWGdQxVK?=
 =?us-ascii?Q?DT9fNiqLwrBDul/Vhsnn1LxuAIuRCv8GW/BZWuYlJHwSa+3Hk47YT5SWwXBU?=
 =?us-ascii?Q?C7wllIlOLp8bpLo76VAosnhPiPGIuLg+QFHCGql6JLxZUd8QImTOEpUrZZ8t?=
 =?us-ascii?Q?bRBRl/7m9gTpclEReWNgBrZVMhuaTPRRymxH2YbmM5+c8cN7DiTvvmnWsPYb?=
 =?us-ascii?Q?GrYfZmEw7pT53hlTxisJ9qTSJTzLZbqLxPjmZlPYUNYlIpDzoGK0NZA9yUgZ?=
 =?us-ascii?Q?QwZhXDv8vJsDLBSljkKx6b4y1ugSOvTO9N+wbs6DpBXSNNL2SSXmw6vCuBqz?=
 =?us-ascii?Q?PGSNDNnj1bPm/5kaHV767ycVmQdHPNvmipquVih3Lc2ZRlSKc5d8Ni3HExEa?=
 =?us-ascii?Q?jB3PIR+u+DiH8VwaEDzeZUzrhSq9YaTxXQv/IkGggTWpFyaaLe4zCNGeG+Po?=
 =?us-ascii?Q?+Thn2W4ktyCk0AT8lOw05RkMm2R5ncnCXVoGJOkYDYjYzCTC/Vz6MpEmGQFG?=
 =?us-ascii?Q?YBt5QyoO1wmDmSOOEStHRAHzwyu1UM28v8P/aOn5ngdUB91qNJE/01Vew/Os?=
 =?us-ascii?Q?dNqRsnL0iR7WxPVQ0+w8QL3G3JLmv4vmT3qQsjY38y7+67zaIU9VFVmlMZSK?=
 =?us-ascii?Q?w7bB0OobjumtTPfNqws=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0464ae42-b045-4c2b-22c6-08dd97053a98
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 18:44:47.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGyjbKlWAH+fiktPrkNvZ+A6j6YSysMaQiSnhpU2M4hN6xol1ksvDCYHd25en8ABQnEjBNVfw2Q9t+b095sgRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

On Thu, May 15, 2025 at 01:18:56PM +0800, Shengjiu Wang wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Add lpi2c and i2c-mux support for imx943 evk board.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 132 +++++++++++++++++++
>  1 file changed, 132 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index cc8f3e6a1789..a566b9d8b813 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -12,6 +12,9 @@ / {
>  	model = "NXP i.MX943 EVK board";
>
>  	aliases {
> +		i2c2 = &lpi2c3;
> +		i2c3 = &lpi2c4;
> +		i2c5 = &lpi2c6;
>  		mmc0 = &usdhc1;
>  		mmc1 = &usdhc2;
>  		serial0 = &lpuart1;
> @@ -53,6 +56,113 @@ memory@80000000 {
>  	};
>  };
>
> +&lpi2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pca9548_i2c3: i2c-mux@77 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@6 {
> +			reg = <6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@7 {
> +			reg = <7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +&lpi2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c4>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&lpi2c6 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c6>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pca9544_i2c6: i2c-mux@77 {
> +		compatible = "nxp,pca9544";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
>  &lpuart1 {
>  	pinctrl-0 = <&pinctrl_uart1>;
>  	pinctrl-names = "default";
> @@ -60,6 +170,28 @@ &lpuart1 {
>  };
>
>  &scmi_iomuxc {
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO16__LPI2C3_SDA		0x40000b9e
> +			IMX94_PAD_GPIO_IO17__LPI2C3_SCL		0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c4: lpi2c4grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO18__LPI2C4_SDA		0x40000b9e
> +			IMX94_PAD_GPIO_IO19__LPI2C4_SCL		0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c6: lpi2c6grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO29__LPI2C6_SDA		0x40000b9e
> +			IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
> --
> 2.34.1
>
