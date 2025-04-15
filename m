Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7461641A8F;
	Tue, 15 Apr 2025 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742810; cv=fail; b=co0feljsFkPWifvvZf7mrvR/HA6PM6s/gf1Q4M+Ov3uQnoX1TD7Excam+4sY85sWmsi85PzEZzivQkryihdEslbDj9FJS75UPt78aGmdDOTnURtI9TocJIq7vavagWruTdcLv+MOJ1G4/p4+EwcOQ8LEslmIbnF4o2ThSJPkKCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742810; c=relaxed/simple;
	bh=XgOmLP8I/fNYMxaThWLSlznJ+LZzwlRofGudwkAOPbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KC2VJx15YnWBx5rK5vViQxcC8zIBOlY6FpJ/lZImp5uU3IIBqKOcFrQugAAd+9qpmSCbcaY+XdRrkMyK8EescyTKH2HXl4Doykkd5rsX2kgHn2VMEU4R8tfc3aJv9bTx6lQM/xQiP4Eec+uObTdCSrBrzoAz/mhTMmpIFCVtV5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YGIvBACw; arc=fail smtp.client-ip=52.101.70.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YGIvBACw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yt2pD+RWI6ohXkuPB0HfQJ8OSQNdLr59Kv2hX/O4sqBoEq2R7HNSFLWSv9f9bjo6AK4Ee9iv6t6VLSwo0PBuu/t1JDdp8lsTDg56htVwKpHklmAsDNHgGxE6cYrDZJfESTGE7Vczt9tEdPjTMDn7YnqDDz7tt0Sd0XLZinwAHyjmgrOjOToviHJJrzfUxXJI/zvq4T92XA9wThCWkYrWpzDL6Vb0tlnoYZ7kERsZ8Ku8JAa4/A8rOU5+VdI+/NSbfBm0MJxLPR6H3BYG8lrcEZTW8cozyZ7urT3gMMYzlsCTUFosqtumZu3UvJyjwa+/dhSovuBmPjd+P2vOJEgVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFs/SLkZR84WaL2XaVVktQqnvt8K5T6zcRjmrL7ISMY=;
 b=tHMQ4c22lyNF57ZTuMQgcodt14j4CG0FtbCx9JW9w0ydQtgI6kjysiLHfnbnVPzy5ZjAyweCJYmI6VOVcB2DUsHoeYRTOMBVYltV4hTDS18rWdCahNKztugWI7uEtBsouzWxxQA94V8HzlY9V79asQHR5fmhUBlxPwQdTmWX5Zcl6zGeW1+1RZrmmUp4aV101r5dmx21ntj7iigZ1uNGtMcz0Yi0KzPil03520xXJni1Hxg+K7GEdOK7UNAD2wozC0QvFafd418jBqXBpCBRYct4q4q9OsTKWMfwZkpLlWBIAMFBH+CYOzu32IP3x8ukzfhLmO2hl4nh5CtN622hig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFs/SLkZR84WaL2XaVVktQqnvt8K5T6zcRjmrL7ISMY=;
 b=YGIvBACwosjzpF7ws7j7o5pRrMcDkSE+/GyfZ/4F3pFC86EwFt8qs8+epFtHI6txBS4paQSSObeWedoBvdKWeiyc/UB7Tm3oTir8dY6Yz8qx1mXbDVlTkIQA8f1Q0wShYZnwlBdmxZZ25bG8eZqeVl7COMVavA++JoWm9FrdmxuMWg1OJyih77KNaIJOT6Y67nSd059UKNEbgVY/MxAM5xyaz+1JeUulHdUzrDMulb6DIvlQkIL8zfLHifbr28flEJHt9loJBaIO4/RZmB7PWSl5bznaTRX1GKo+kr/8Tnpy7HZ5oGNqo+I7jAmt/HY/f49udwEAB9niwyn7KPTUJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10447.eurprd04.prod.outlook.com (2603:10a6:102:413::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 18:46:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:46:46 +0000
Date: Tue, 15 Apr 2025 14:46:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 10/15] arm64: dts: freescale: imx93-phyboard-segin:
 Add RTC support
Message-ID: <Z/6pkVPh5Rn9oOPY@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-11-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-11-primoz.fiser@norik.com>
X-ClientProxiedBy: AS4P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10447:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b773a4-777c-45de-a6ea-08dd7c4ddf4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SVQ9N8xjtj5PW8B7xJNE3XRkBRUoHBpP5GZqHZEwM17vom54ncgLiSGWseXY?=
 =?us-ascii?Q?5AUMhdaHhUG4fI6h3YXaHBrzpgXZp09tMPRlyuwiHYmqO7b/XRgYOas7ojvN?=
 =?us-ascii?Q?cMPiNSoNtJa9RV2Xjb88un6tlCX92smySfTvXPkqMZ4rS1Fm9nHHibm1nmwr?=
 =?us-ascii?Q?0LCeTNTWfml9Z8GgkZPd0jzovv6w+eJGUTUrmzHANFO7Uju4rVVJCUReAGJz?=
 =?us-ascii?Q?6uP8tqRnaDTg4hZZqC5x6E2zX1hXwwGt1A+iFZrvfcqszybBVGi4RiliAgPU?=
 =?us-ascii?Q?33f9EGjLBjXeofTJd0MI05BnPWJ7Oe9f+pQ4TqfjZR7+92egReXhwfmbeeLJ?=
 =?us-ascii?Q?LlLmLIvEbwX+EjYysJdEpwoldXCGC4yrfQN0si4HUFwc5Chz8x92eEs7zhAo?=
 =?us-ascii?Q?5gv+nkNzBjA/QDecYccBxZ9qvlBsBuFcxL+TmqtL9ADpJsviXuTjfgvjaPnR?=
 =?us-ascii?Q?KmaSvs/ACpIJM6Bzqihqh/8nlbhHERoL+MLCfg1OEKrPFzoYqp8ERDJ3mE+E?=
 =?us-ascii?Q?uL9OOP6yKqkacxKzqmhXBHcmH1O3aOO7woR6s0M8Y675PNfAxsfjZtoDW1tY?=
 =?us-ascii?Q?XXq5JYWyKlDaw9a2ohUDwSQ8WLXM5ERcX7b3X5fDo/WLMiuvhZUJJf4u7iPH?=
 =?us-ascii?Q?SlSJGXL4+34ksYGr0p6w3Ncub6Bc2flN9pjWaHUCAX1/R8FF2uUYuFZgNeYX?=
 =?us-ascii?Q?6jIc5iGbuMyR+5LiElnEYtjPKodW28QNMzC3FJddkuengw7K/TTPakrnkJj4?=
 =?us-ascii?Q?NxBJUWkHnTYzu6VB8NaS5HphS8d5sVyuDV1lU3I4KLan4heG3aR3Iva7wD6h?=
 =?us-ascii?Q?DO1XCwWfxTKY6UFLWSPQYZJ5mUbRLoIqGw1GdhgB6WZ7FsGAe4Lm+Qxu9O0H?=
 =?us-ascii?Q?f7HXXDM9MWnk56gydQAQ8u/DJvRnhqFBJ1ub1wqr3dmsuTwoO352LwtFsXfH?=
 =?us-ascii?Q?8Lr5aZ8CgZ4CumLHFi2eZHbcMY/sCKh6LAITLhP3EK2WRk/aSgoORVcZBbzl?=
 =?us-ascii?Q?hBShO5jFEyMXn8Aq10xuqpH0g5P+0JyHrQpDDtbA/vIpZudg2W4LDED7BxL4?=
 =?us-ascii?Q?M0L01pGgIyc7+mdwFz0pdjCQ/1ZwIWNTtvDgXPgnZT2JZVajwb2ZNWHfcHWb?=
 =?us-ascii?Q?3fqlYYakIjl1UFn6HAbGrBz9p+XRDyVNT0v7DJ+O6wkR3tKRRjld2WEfEsLf?=
 =?us-ascii?Q?fm7VXTvwz/J0ch0r6n5/UQuWuXh42knifHq82wIFOIHsOOe60uak3jyRh1rM?=
 =?us-ascii?Q?ShLNHu5LNttFCeOsBAh2HaNFusGZx5mdbja0GmAbHhPPT1TTyGxEA9QAxXBi?=
 =?us-ascii?Q?SaJ1NZ0Gv2YCGd7KblSfKgPhAph5d2BBjSpxCDIvW/hW/Uw64y1D/pBIqrz1?=
 =?us-ascii?Q?ZgWuZMB3rV6F/XMak3FOZtPZrd8vbXy+ysL0J+p3ecFZQMjFijgqHXnIEdLI?=
 =?us-ascii?Q?U6jbDoOXsXFtGuB8R1KJ+wK+5miLAWdbWagSRUbze41PEIC5wB1JDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QpJYo4oFpLYdhx/MvfFBGhIqnjfZmc0Nt0QwCzb88GQoLz4IiCkypdMjwtSx?=
 =?us-ascii?Q?dIgkf5CIcNaxPjwukepie/oHwbCcB2/vzkqwC4LgvUyWbtYbo72Fs6+36LUN?=
 =?us-ascii?Q?bJ0riBglpLJSNkcScvr+uaJDdHcDRceqzvcVF+qntWJmBRxva50mwLHLUzj4?=
 =?us-ascii?Q?/b52I7EXsny+2uwqKHORdcI2XbyHRh25LjbUhyxNG1G3i6TaX3XMYUhMSsYz?=
 =?us-ascii?Q?0sR2jErO9IOsJ127UQWe3bDpgz9etYeb3Jisct26dBKRDamdnFwgShTcMSDE?=
 =?us-ascii?Q?0Hsjgefyfckas8dIqoCqX6CxzT0jMbBsZ18jyOaeWDA92wqYbhBbIb1cCO7n?=
 =?us-ascii?Q?dHdiz1XMcHM8jaDotMD+nDHQsPerUDZGwFlPD/Mg2/V9JptFL/MdwnP0KgLc?=
 =?us-ascii?Q?ZccvWcDxYgJPnK4zWkR2B+CSP57+ohEgNYuG6nSe5P1XFj9CZoecH8ax9bxW?=
 =?us-ascii?Q?CVg8Fb/NKsKPv1O1j9vsUgoSWmyttB1ksTB2csO3bdoteMOU/nlYyEUr3ov2?=
 =?us-ascii?Q?rkF38TY9poKnmBE+eQN7nXj7u6WZpEFyPKz/ntxrPxHjVY/s4Z3KpcGbLlMT?=
 =?us-ascii?Q?eZn83Z4KO97OaLvk8DiBAMzwxaikNGIp6e5rjW3UWS1jK6LeCoZcOpdszDFq?=
 =?us-ascii?Q?Qq1Sxjf7kY23nO2iSSXOvpWi3EDnN55oC4fjjYy2aSCSxfyWHBnD83yFZQaM?=
 =?us-ascii?Q?eKSt1hnH+dN7RqYmts6ngUluKYwtzxW0S3dOordHuNglyr7QTtDwKvR7IfG0?=
 =?us-ascii?Q?wYLKfaIw5ncJ2Y/htihr+drL0iOYkILS/vPTAn4WkCq0p6ue1w/JGHk3mAZK?=
 =?us-ascii?Q?kB4dW8pFrutvfESqZqDdOz7bXvMqTvSGtK7IjH0Qba6hbgxFwVMJZqBukEEQ?=
 =?us-ascii?Q?B+hTCG9mTbjANQcHihP3SsvdUyxTOhn/nPH/UMLA0UGZAAyAdi79nbdR3wvQ?=
 =?us-ascii?Q?LD9CVQoiq3DhMo3uWAA+/rU6yINH9UkbhQv4yZ6xtshjcIF0tLe8CQKuMa3I?=
 =?us-ascii?Q?miQj9GBdk4VCmnylr1BEWBsR+w0F7b+l/GmcuV7Eawxw87gsteP9NV6EBHI5?=
 =?us-ascii?Q?bgue4v41TK/P7Ft0jiBRHgJl4nulQgU76tDUouVKdRMYvum0qz+ORHbUr/Pp?=
 =?us-ascii?Q?Hmtd9E5tbTl/05nnFTaaUXsSqLCPTjYJt2kI9O19ZyMp+NNba7wRuaSnqyR0?=
 =?us-ascii?Q?tQpb6A7NUNfeMUiScFaaKkNCxBEwcXFw6eIEfmMp1162MABku6svtRYyzLWa?=
 =?us-ascii?Q?o9AAez2PRlkIfQKB+hlQGaf2S0q0KshWEw763HtJarBTQ8R/g/bIx0EE4eYE?=
 =?us-ascii?Q?ZZRZmQ5G/S9NMlTQGETrDx3YHPy6x9/NyrkJdNKTbhsPfNi61oB7seIkBvV2?=
 =?us-ascii?Q?XqOYn/VxnXc23btANyTwzylb3kmBYpx2DD8IKtUKsfxRx26YmCxBiYg/+dDA?=
 =?us-ascii?Q?Da1vtfjTodZ9Zj17rPsdR1gC+rrhiqMUjocDva8uRlzkeYxGrNxOabuAuqzJ?=
 =?us-ascii?Q?FqSCiNM63h2SO0aoELy85ukC2iLWXAAuWz83PA83dNcDHYpymdKFsXvZob9A?=
 =?us-ascii?Q?+QGGN49dixv0RmvAsP5Ms4nze9uLtF1TEbHq8/h1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b773a4-777c-45de-a6ea-08dd7c4ddf4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:46:45.9272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0Zqms1wSvu0wqPaGgVz/nF7cf1OIecCsxUZwhIUImX+x8UyqIe8VBDhwlWYnEURtasyR1eifvHqXZJJX6Ze7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10447

On Tue, Apr 15, 2025 at 06:33:06AM +0200, Primoz Fiser wrote:
> Add support for RTC connected via I2C on phyBOARD-Segin-i.MX93. Set
> default RTC by configuring the aliases.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
> Changes in v2:
> - reword commit message
>
>  .../dts/freescale/imx93-phyboard-segin.dts    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 525f52789f8b..38b89398e646 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -17,6 +17,11 @@ /{
>  	compatible = "phytec,imx93-phyboard-segin", "phytec,imx93-phycore-som",
>  		     "fsl,imx93";
>
> +	aliases {
> +		rtc0 = &i2c_rtc;
> +		rtc1 = &bbnsm_rtc;
> +	};
> +
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
> @@ -33,6 +38,24 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  	};
>  };
>
> +/* I2C2 */

nit: needn't it

> +&lpi2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	status = "okay";
> +
> +	/* RTC */

the same here, not name is rtc.

Frank

> +	i2c_rtc: rtc@68 {
> +		compatible = "microcrystal,rv4162";
> +		reg = <0x68>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
>  /* Console */
>  &lpuart1 {
>  	pinctrl-names = "default";
> @@ -56,6 +79,13 @@ &usdhc2 {
>  };
>
>  &iomuxc {
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
> +			MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
> @@ -69,6 +99,12 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
>  		>;
>  	};
>
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_cd: usdhc2cdgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> --
> 2.34.1
>
