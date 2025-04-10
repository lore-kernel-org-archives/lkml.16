Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798116FF44;
	Thu, 10 Apr 2025 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296992; cv=fail; b=tDeuyd4jTVrQbnzZD9X02CMcJYzwIGI3a3rewAASmFmzCwmxWsF8+acUmksyrIlA3Ajm5loIEqezmwwcaeC4UmCeqQZUl+QOlWpz3M8xOJu8KWLl4K79gBVOImQYNU7vSkOe7s7B9HpEe6lFuc0U4OB3DZhbrPuqKpszLEueEL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296992; c=relaxed/simple;
	bh=LTtP6H9wsTRrqxuZAnXFP/QL3cm+HcCkQnoLs3QQYn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XY57/Ef6oda0e2/pR1/ztyhrCaJuAtYAmGxAy21q2Rb2f/2hNEsA65JQ1i9GjUB3hpb5N80pECzHzL1Vu2H/4YLFRhdkNW9k1ZXw1v+f7znrFgIfngQ3xg57+vmNA3erpK6/oU4a3Stu88qV7XZhHUdBrTFF/cC4YYurftxtoCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=efTZDAix; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="efTZDAix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neaOa6cpXt7sUSxBY3Dv+/ivlrmzTLY6lfBYq/Fa7nkeQtttHKJaaFYxC2IonHXwxGsW5LzXRHWlpIbavFYVRe2YFpj1Rk4RMUiDK005wM80Yq9TR/hMqfD82iV1KfKuA3JicqPbI2hDF7Ac3e5wVBlVbXqM2lMLPpNqb7lv9+ZLNoA8KL5tgoPYVZSu8hkv2hD4okOUGbu7rgxMReBGz0iaR+GbQB1BWbXmnyhOAFtd4b1ghodHHKIw0M1ugO6T8CtcBHRr01aHiYlZ/4QOYl9bLc+2MjmBc14PXEMG2RKCFv70o8SEun9sORyueb2UpN5sBdiKyJ21Ya1FLEop/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTm1LU2ehBmo7bIZPZW2dbmtl642+DHFwuvjAJT0RL8=;
 b=RwuJmAR8od6R8YwtJFl8LTN74SS/RU35BgceQZeufNjdxfZJo1j+6Hu9uLemEvzaJUYlQaM8zsBq5e22v3GyayLrlk6537zPUPmVMklXbc776Z0kpex9BhWk+Ek/YG7JcignuQqh38MiMJonoolL1vPkWzW3YLJ1wS6Vpd9MVoI03OZBrR6XSr93QES7Uy2bodcOi9PdywVtINKySidmqNKIrnITPjawFOIp8nFKsEPvg1BmMa+YCZU+PXotiXnuXi6TLKUXAr70OKA0uy/XZ/+cszjHRIqLnaUKxTa1PPhlpYcbZHbOqeFSoV0SmqE3StLoJz1X9SfyTgc+JxI3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTm1LU2ehBmo7bIZPZW2dbmtl642+DHFwuvjAJT0RL8=;
 b=efTZDAixY9iP8ZElfYDj5Eog3BWIPUVT4E87iRQv+vvJacZwl5zBNtZHtQlQNA+658kQj9hM5O/F0suw+yqIsrOxo1WuPTQEQO1uK+3Ck1jNjSd28BwdlAMN2CBXFiShTKJOOJnwdH80daZ6wBXSiRtUujDtEH3QMpPNchHqjC2fHG8bkHggqR3aCoSxHOtkABlIWZuPIxyAlFCnRVwGwllWehETa6sik6wfmIRWekqFlFUZ5RZNC213tS1wOLbXnaxvaAYFzktZCaPbIwu3t7qlEiRVvI5440D2DCXWE004mrbMCJA6NH3e3lhaqQ0kBVZUr9xovvmxdVqCQNuLiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9140.eurprd04.prod.outlook.com (2603:10a6:102:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 14:56:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:56:27 +0000
Date: Thu, 10 Apr 2025 10:56:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 04/13] arm64: dts: freescale: imx93-phycore-som: Enhance
 eMMC pinctrl
Message-ID: <Z/fcFPrHdI8/IBRC@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-5-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-5-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: c84794b4-8370-4c85-6448-08dd783fdef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QjX6vbSNlfv5qxhjU5kc2TMPLYzrvB90SHu1VR8z3yaebIbH+7l2dNJ8wafm?=
 =?us-ascii?Q?v3cvUCYBSiVud5/cPe6sUT1ai/5Z7bfPRLPLZEsSJaEAmvIX2wnBNhqOy0i7?=
 =?us-ascii?Q?Y9Auk4CHxtAvHzsnfH8CBYtApm8E3jDrpVX9EdIqZOx8l62dRazarpokQ0pZ?=
 =?us-ascii?Q?R0us9zt3BGOxWAJkp78sGvEbVIFto93QmmkIMBhBt/75YZet2SHX7DscLkK4?=
 =?us-ascii?Q?KDlMfafTZ5sfik+IVfG34V6wMs56i+Jd9gnW+ldkOQ9Do/LjSVAYDoL0RJ3i?=
 =?us-ascii?Q?JtXKPnh9X49h9j/ELHygyrg1MA6IS3QduMp8LX/fN+dBLpURSiAfXRVgTSIF?=
 =?us-ascii?Q?Z0fpSdLHuHB5BYxlM3yIZUGjjpOGwSWTE303a5jabWvHtAdWOLhahugZixEE?=
 =?us-ascii?Q?vsgwqJUnyFLKHnJjohySLWPeLiqtmAODoWR1XXLGHEmLF7WLQM2o9vPpDXGS?=
 =?us-ascii?Q?DDdUmW8ptLjrrVIO7kyibH6+Z6oDanxhUZ1NTEN5mG8d0SpIZCvPrgeQYIsu?=
 =?us-ascii?Q?zNG6jV4C+y5KPwpG+E3uXt8Vst4luwXqcFdswE9p1umfrB0LEFY3DriDDHlN?=
 =?us-ascii?Q?me+Tcj23Fk7xMA1HqtvsMNwGzmgxlYC4cXMuzKzZ5lqAgNStUaH9MVc90V72?=
 =?us-ascii?Q?kqWfYQTTP9Wl/zBmQqiu6JUTxlwE51VosIXgG1PBV4SJJSfwmWcubPJ1n/rk?=
 =?us-ascii?Q?BjyUeerzOFMUrrjAbQQHjRewCir25HBSp/fo/HYFFKYsGR1txzYN/r6sXbeQ?=
 =?us-ascii?Q?PJ7xqIqLKUrKV//9ifG5s6FpkXiCg9NUgicnNdBEDclxSD+S07ZEpSsKA/iH?=
 =?us-ascii?Q?JoM0nElHfObwnBDaCaJpaGnOxlfm+Jno3VXJ5YQU0ZP++nERjoDqM9Nx7T2F?=
 =?us-ascii?Q?gSPfw2yEhxuGIWppMMH0rRTeqcUMjhZsIb2xF3LaQpdxj8IPURWMQKrwnCda?=
 =?us-ascii?Q?D3NA52uWFXMl6fup9FicNFVZjUolBUQVFL/pCdwbKBNNB4/oXBWFw4YYDCF0?=
 =?us-ascii?Q?oEP1ZadhQQQR1geUbacjAK2ZDgBErXJR/5/8fkHdsCeJnR7nxEBOjU8wwKur?=
 =?us-ascii?Q?t9Ar4JpTei+x+HXSit39gzSIC4iAedNYicADJ9kKKWSaQ9bllY40r1493F8H?=
 =?us-ascii?Q?zgEw6XaMELQDJNYYehlmDwyOGPK2h/UupKWecuOsZcukMq/77RSQd3uwk3Xc?=
 =?us-ascii?Q?cZgRZYA767ceshrjWDh3q9meMeQNhK1/G0NMSsxZPao1+pw88w3+DvUn3odW?=
 =?us-ascii?Q?q8HGjVKXaJfh1xs7d0+YV9HRzgLh5gv4ejVViixrpee4HFvQcKzjfF5KcBnz?=
 =?us-ascii?Q?4xLYuuxDm3tkdEnqUlFwVRQglKLfd7l4ecV2Z3zL9k3MU6kpOQN1nrvEbklk?=
 =?us-ascii?Q?7EOOQ1//KYEFAY0eMyyfgmovM7qIPJG1M1Lv2XXynQWV7gHCAPH45WJ9BMqs?=
 =?us-ascii?Q?WEM01q5j4LKXb0fIFIlBqpuvEJZasV/I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+UgZ83ZGgtQNBPTctfq7tv1RetYOEZNCmOZkDogaycu5ugxs0eotHmS/iBRW?=
 =?us-ascii?Q?Nzn3bcB4xLls0NWkGYQRYkroRmwDcUyw07EURHQXQh7+mGtxPghizrAX1SLq?=
 =?us-ascii?Q?Kk2zZFeutlefF2IKeEB0MmugIfWQt3UpOcOY94GB20qOhC97teqw628mXwwe?=
 =?us-ascii?Q?I0LWVJXe0+nta2eo1lH/wwbxQIMHl/SlrNyM5esLJS33ipJLHU8lX3kZKyp3?=
 =?us-ascii?Q?FE4fKBTAx63MzeYagDUHwWsFoCGTNjsqY2Pql6C2KoubfqmgCrfbZvQngLzn?=
 =?us-ascii?Q?3YoYDREe82Mferl9p93m5gies91Qhh6WFJ7nGMMA5KC5bBHcE0dLmpIt42tf?=
 =?us-ascii?Q?39JeAA7VTOEolx04Le8K0dDLlHWITIsXXalM8KR3tT052TH8Boh8W6tYSszg?=
 =?us-ascii?Q?41nS3RYzL+hUMSFCoiS6aN79sIDIzWNonu3JyooCS7s8e86+YWpafrtcmagD?=
 =?us-ascii?Q?4/Sy9tUQPkVSsxEnSZBGnNDyUPM5Mq1xS5b0g8yAOm08jve+yeK1emI4kfdS?=
 =?us-ascii?Q?1a7qTQ+ZP9oGoLei9yeOsd4R7ZF59vXdgXWGD/2q/1ZrOV3EA3EJn9dYNaR7?=
 =?us-ascii?Q?QlAa1LrqpeYQCPpuVUnmc28r1zZ+kp/K5E/mBsjyW7Yaj84jF26UZTnvPZCB?=
 =?us-ascii?Q?a2MO7u3+0n6GoJcWMFlk6TjZA7z3tdHybFLo+9kHI8ITEJzbXv5hiP++V6v+?=
 =?us-ascii?Q?bkZ3Uf3iAcJYCZVA6NfPd7OHHWq7udN2eEeXdYUAbGIdN1XfKtCaAA5sp5Oo?=
 =?us-ascii?Q?1dvJ17g1fPl7J+dISeeLp6Q6W63y83sYuc8p0WIIHJqCzM0yD55Jxyyfx7xG?=
 =?us-ascii?Q?69LUYUwrm5SyxlnP9iqCtNwgTGTWSgugxT1Vet0FMj+ypzw6T/hN/JNNRYF3?=
 =?us-ascii?Q?KWUj5yPs6jSJmfvdZVNsKnbFxPCx3B1rVFC4tFZSceMcfB1XNfDyfA/1617M?=
 =?us-ascii?Q?QNNm3Lo3cXKSw444XlyWiWW9KK6eLxQPBApKTDnZgta0zdra8Uq4sMQVT+qb?=
 =?us-ascii?Q?uv2zxEnieqp2IcD5VmY6Gu0RNk7n6HzWW+g0Tn0K67B1lAITmNN8K0kXBlwh?=
 =?us-ascii?Q?ZHbOAbgS7mEjWoIqN4+Agj5w61kapzbVmvoGC2Y9DfEwbKkxnWJ+p/P+pTym?=
 =?us-ascii?Q?7Ry4YOR8NjNoBeCJkTeoAYWuiEq+s1QWNdJlIC/QJbSb6cQtGk1E5KrYvli2?=
 =?us-ascii?Q?W8cMr6UaC9viQ/7PXdweb0nsW/S56/AGz3h4dLO/MMQM4qq/Z2mtGbEOzA2W?=
 =?us-ascii?Q?d0Tgi2drfLcRpFMrkVOCxxmrcoeQCo9uLo2BkN4O07NTaUfrucA80kKmUJrY?=
 =?us-ascii?Q?fmhIMb0z7dKeAElnjSHGZBGJWnLO29SutvtFvW1wao7NcnU7hzBKkgUlufJp?=
 =?us-ascii?Q?TSG3VoE7w4h/BNGgEVF/EdrcTwpG1kSSB1nBdWmXgwByu6oqIFPOhioeCdXB?=
 =?us-ascii?Q?yGjHLD71FvBGVjo9ZkPSFgchxJDy+TEp+DozGf8OuWOs8lYptZ59tiZAof7O?=
 =?us-ascii?Q?wlpts9942ejc/Kv74G82vz2p7rUvJNVZhwwjFopR4xG7FYuPJeuAxjQDlw28?=
 =?us-ascii?Q?OGMrAVD7MoL26MFI5sxMT2J1Ft7vafxm0sUcJ4KA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84794b4-8370-4c85-6448-08dd783fdef5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:56:27.6957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1zG2zKQinVo8urv9qk05pDt4txkHEBBc2vqfl3fbd8F7m2PbQ9mjnH9dsjVjuED+hCcFkUI5EVOyhoqUqf0+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9140

On Thu, Apr 10, 2025 at 11:02:42AM +0200, Primoz Fiser wrote:
> Improve eMMC on phyCORE-i.MX93 SOM by adding 100MHz and 200MHz pinctrl
> modes. This enables to use eMMC at enhanced data rates (e.g. HS400).
>
> While at it, apply a workaround for the i.MX93 chip errata ERR052021.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../boot/dts/freescale/imx93-phycore-som.dtsi | 57 +++++++++++++++----
>  1 file changed, 47 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 82f680d891c2..3d84eed33074 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -166,8 +166,10 @@ eeprom@50 {
>
>  /* eMMC */
>  &usdhc1 {
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>  	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>  	bus-width = <8>;
>  	non-removable;
>  	status = "okay";
> @@ -213,18 +215,53 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
>  		>;
>  	};
>
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
>  			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x1386
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x1386
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001386
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e

any reason why DATA0 is difference with other one?

> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e

any reason why DATA0/DATA1 is difference with other one

Frank
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013be
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
>  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>  		>;
>  	};
> --
> 2.34.1
>
