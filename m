Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2075.outbound.protection.outlook.com [40.107.103.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8392343AE;
	Tue, 15 Apr 2025 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743526; cv=fail; b=V2wDPyi8eELqDk2d9c2bzHBD4IId4gWOy++cbx+ID+STd++dAoHvl/7kWA+ZyQI6o4Oz0tgfpf3fNNVzYrBsfiOqRPTYKGQvdui2ZBoHL7TCR1y+hyEdY7RSt04htFOI0zmPTJR4TxXs2yvHJg9c+Y0qHJdwVWTBiYsPK2PLGYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743526; c=relaxed/simple;
	bh=Oc8VaY9pXCzkSy1hNHip/kGWRNHBpnRhwSwX41Tlz00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RVM+uwPXI8m9CL2tCaTxKon7vsrTLYKQS3gN3om9DA86weg1y4r5VqunxdFfpvLALR9m0N9p3YaOij5xfCraNvlDKjDn2sIDjONC3ZXTHPrxR+yMeKI678VKRgOiwapuwvB4nYmN3AEboiDqgD7xQqY0OSaUlG1NPkzKzzzg+vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WwC1xS+o; arc=fail smtp.client-ip=40.107.103.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WwC1xS+o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTNZLRk/IcnyNUQLHfL0+v/nokEKoQYvrepwiBAbg9/iWPgZFrTFKU5PL2M2aL7kQlat/H3Z0nKmS6PJEskeC6qgJ7xyuDoTiksgu1A6mZdXa30wB8ymquUUVkUvxvswaXMOVzrHurereKZCzMCm1Q+A54AHgKPwvN8ivcTOdfqLCHQmmzqUYh3a4qOd3sG0DBxSQJBXO/4sA21QCQTQOi0xh5hO19vkPHqs9PqdM1OGr5O27ssaCqgDtmXrMiKTTS01lOoYfz3j3uX2hFjMG3bUKqfdxZnhcFOo/vdYfAo/1Tcs3iIlEwpNGBdOKajWG94UavR/3sflmPOIwdojlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1V/gmUtJw8+EU56Qu84B2EZjteGeFtK3Mz3y15nZd8=;
 b=xyCWEQmJ3pjOQWyaZKDc/J5/eNUs6nAMMPrDu+q3mpvoMLSOhUl5MK0xRpi8PtLY3GCVWquBDXfm7maVxDAXLgWIo3dKp+8SIj7D0TCpukn00Sz9h2YO83hf3GgFQn2QdALRj8B8az42dqM1sMu4tuTIhy6WM6gpbd5fyelShWVAnB14EAu3uZe7MoHV8Mb5vU02z7I0thBUTNvmy2f9zjC0GQcjqErqdfx66KyJ8xr8N/L0OnXlWkZMEv3e5Jhd66pYicWijeGBgQNAQhNn6pjJ2uIJUoZfAO3VGXfJnznrgDQki3Jq63G3eMLB3hvbTaokh4RCVJFV+6iwiPt3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1V/gmUtJw8+EU56Qu84B2EZjteGeFtK3Mz3y15nZd8=;
 b=WwC1xS+og6HXfY7ieoc3oqaajOdrtYfpHXqzdtwv7HnOohd/BIEkBjnHs67d0HYrAVX0P1olVXi/lImMpQfmMCU+3TNGtucEqrr4LwEljlTneZ8gnL0eSKIzyfw2pqOuAa3zivll4MF/Q6YNt5Tiyp837GLyHRtKiFupgVYF2vAgt5ScAnMDkZ5qyQY4ZtitdzUSpS4FWi/LvUJAxG1qG+n/AXuCleDasGpUigOOoCHOMKCBTrMvswaHYXlieU3Tz5mS5/ve5FQ8ipzEKSW5ARx1LQcfiCfBdHS5vWFQiGee0Ur2P57lU2Hrsgyl4k7t9zorRMbvjZUQSgSHj/Lthg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU7PR04MB11137.eurprd04.prod.outlook.com (2603:10a6:10:5b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 18:58:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:58:40 +0000
Date: Tue, 15 Apr 2025 14:58:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 6/8] arm64: dts: freescale: Add the GOcontroll
 Moduline Display baseboard
Message-ID: <Z/6sWD949qKeahtc@lizhi-Precision-Tower-5810>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-6-f309f8d71499@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-initial_display-v5-6-f309f8d71499@gocontroll.com>
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU7PR04MB11137:EE_
X-MS-Office365-Filtering-Correlation-Id: e2eadc0f-372e-4c88-f739-08dd7c4f893f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+DmUEp4VoL29idLQ62U5gFg2rP6KZaqMPM5o28wHWJYszX790hHfLgTKceif?=
 =?us-ascii?Q?jLPbSg9X1CqAt6SgmnB7VZUxFGG8Pa1T6y4nBUb3QdfUltMw74eX6ZXcyv8Q?=
 =?us-ascii?Q?vNckcFey0tJa0n9uo7BZlsBvytw1EeWQlBkKknzpCsq2f65vZqPFBy/i2bDv?=
 =?us-ascii?Q?ge9Hh4x8XGOFiStmzJyXa8vWsWlNqSm2Vu4iEreuRF3dMiVXNWmNvG4ULXQb?=
 =?us-ascii?Q?ueOO4wZ3KoUMWbHNlXhhkmsMITHiCxT+waNx1Q44EdHENc+PEtKFFIjzXEhG?=
 =?us-ascii?Q?JGPo76+w2kZMMQ1CMbHBOzcj38avQ48iHgsBjKgqVBPH5tpxoB/AN/z1G+nT?=
 =?us-ascii?Q?Ny0UaX6qC3KhBhYj5ipSr2rDJvb/iNxdRE3Ivp8/2id6FUdLkfUMZUfSfFIA?=
 =?us-ascii?Q?yEMqlOynUcfQJn0q7sSDar1lEamf7RIVE66dDL0+Q7gIVSvgmHsAmcM/0VyH?=
 =?us-ascii?Q?zFvW3OsOIaOKyi8dx3bI1UXaNXmzfxfXwDb3mLo56QRRDyqCmTY0JjgbXdo3?=
 =?us-ascii?Q?Po85ax/nDyUxQ5jH1yE8QeKKJc0VLDKfsE6GIPJ6nqpB3Xx/t4/p2evuoJW0?=
 =?us-ascii?Q?Utp3HRMbJNKFEvK9wALXc8fLySlorD7VeEesJ6pc7DkiegH9qtXOMTfnh6xs?=
 =?us-ascii?Q?nIPaN2IcLSDlI8JeYuQwuqyX7oq5bsCHHh/ON9/eSyJ677HgIyXRMDLQbA+R?=
 =?us-ascii?Q?R3Cb++OOeH5BIq/GObi9xu8591ofmt7vhk2tE9CfL8/pVP4C0bZc2RcdI29T?=
 =?us-ascii?Q?SzeFLTCGHeKqDeOczrcZ3PsoEYthH5neaWVTJWH9DTCR/imeHvLXiFIMwpJg?=
 =?us-ascii?Q?iy8gkmw/vmSPAZZ699yICew6WQ5GeB0nxYWYKAvwB0qFh73MLumOQsWiyPtB?=
 =?us-ascii?Q?E4G3FA6gIgNYwxfqFRZuPwwUuXCufuSyqhfGCTb01B5Vhb128i6H6Xj7n7oD?=
 =?us-ascii?Q?Ng0oLCA8MOEuGFP8R38gi4X/L2VsDdBIHtuWZPozzuEnJsgk8jINcJ/AK3kt?=
 =?us-ascii?Q?HJRj05jTRO9vFFHQMrdszXqweUyW9Esv/YTEzLykQoPLYb5soQgH0VKOGGNA?=
 =?us-ascii?Q?ZJychU6J6+2xe+f0f/vNKDHw4DCyV4jT/vVlAU8KLI8BcPs1Uu4cMZ0YB2Cv?=
 =?us-ascii?Q?g+XQydGIC85n1HzFrtxlKJHd44XJR58HH/psY/zy5TpEq8UyQR51VDXHfWwe?=
 =?us-ascii?Q?eTlXbv2KE5RBFEHgyynlwojkJALhuRDC9t4BgkDi+YGhmF06IhwqBxshxoaX?=
 =?us-ascii?Q?KkRSS29a3kv3CzErGHSN8ub3MHXAE1pWUVC0nht8XfIMuCIk5rmyGTCWSLQV?=
 =?us-ascii?Q?aGzDc1b0DJ+Xg1UnT1SqjUjJ5EgxoSZdNuopd4aKdAzrglj74Vw1DZbmZMR3?=
 =?us-ascii?Q?vSknGkf26Ii/mns93dMd/yzJJF14YGQDmcTThhVu5wG4QZZbR2XgJgGSRiH5?=
 =?us-ascii?Q?UWoaJoAFcZi6By3xRYaH2iKbJWMpnwWq6z6gPfrVGl2zAbkQZS0cSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ga116q2uGoQhwoBWURTop87nMTpgzwmMy+aag+bqlkd/N51h/yUYMEO9+UId?=
 =?us-ascii?Q?TKCrtZflfrooIAi6R61zjrnmTe7GEYS35htVAPT5jsbAqBrH/WvocByPDyc5?=
 =?us-ascii?Q?cTokX+gRH5mU9GsFDewNsFxhzPvbCkgvB1Ce4McVk1/UJCCcPNYDxwhatMHX?=
 =?us-ascii?Q?9x7fENmbrn/2i+Wo1nmPJ9fmYNPpr8wi4t5sdV3UM9cJ3aaCT27Cqv6qTjVp?=
 =?us-ascii?Q?4vtyEYpnE3+g1Zyl9ZYb26i5tGFTo9m006xTHXLNHBwaOBDj7L3V4PsdX70G?=
 =?us-ascii?Q?qbJ/svcGfNrh7/KGwMoNI/DMPiBqXPY/S3b5uvZ26ozu3hdf4VgpwJxbh172?=
 =?us-ascii?Q?uQgYm80zYvbN8KlCMac6ohKaDvfGmQggiPrIujZkI0ItHjaAjClaqQTJPJV4?=
 =?us-ascii?Q?6jACiY9fzaMeOcTY4hgeovbZxAfKq19otaAcu/36FD1WIMj+9Vq80aMHVpSx?=
 =?us-ascii?Q?TX3PYOsXaKwSaI2Ag+3Zj9kyFVTbxMi2DOxsMi8ed3n2YbjIUQOtZ5f/cLKh?=
 =?us-ascii?Q?Ol/pOdaeCrUkGWWm9lb7aJMAilXc3GvttHti7sA/g9CbpIHaf/je8want5ic?=
 =?us-ascii?Q?FCsJ35o23eHiykYrmDioIBdwbpLrAkjAX3aPmEji6048RBGcdorlwWok/pxr?=
 =?us-ascii?Q?8CHOHNyplIiHlxnuVKVj3fiIHKzPReolpz1zy/UkorWNvGkWgRkVLyRRBBrk?=
 =?us-ascii?Q?A87wOn48OhVDE8M6dNrGMujUOK5god30YU1UCIEz5g6Dkd/3rIh6x8ga88iF?=
 =?us-ascii?Q?EieX4BW8Tqh1dLBHpFlqWbxQJnUe2XVC4LOjr0hY5PKAHkANzL+MLyFVZJxw?=
 =?us-ascii?Q?86tGLHGsBWWaYEt0GxLiewNtgodQTfY6f6YB/BotwEK1ef8CNYvnLpSVERBB?=
 =?us-ascii?Q?SiudaruislMu5Vc/l1V+Ht0spTouQtmGX35UySAMKgW3fdkJA71cksP70LLa?=
 =?us-ascii?Q?NWeriCDfgMhh3ibtYrZ/75GVXjfR9WIZyxgxTzieutrXPQz+P4aWwb3rQ68x?=
 =?us-ascii?Q?IBF1qpWSitewzSfn6azskwhCDUXYpzATErhev4Vero0tY4LVzLnf7FoUczbe?=
 =?us-ascii?Q?omXS5AGqjnOl+5C+Evh/2wnvSEk6it7+RA1IoNZ9tC14zvege0NfBNqi6R/7?=
 =?us-ascii?Q?8D5qQXl24W50liB4lMD0gZ3n0SToREfuBuUy15efo+vf8m96qNc/0qWrxoC3?=
 =?us-ascii?Q?fzP+TZ+W6B0ypMPxD8WHhPkRhFNiFsfU79qL5MQ8axuQ7FBuyg30hia732cp?=
 =?us-ascii?Q?IDUr7OphKn3FfCUYRVslgB7Bdts4mVoNlbC+v8Qjy2/1Yn3J3FYO0C80D5N3?=
 =?us-ascii?Q?2iLUZWqu6CIulcVC899juUqxUqLjBHT5vOtxhoG/wIFY7y7MVpgyZiCyrzdc?=
 =?us-ascii?Q?TrYap2FajtdG1wO60AgD3/daPXLIG4CqnXfiCbP06M4qsbvZzMsdHtkFiYB4?=
 =?us-ascii?Q?18f080rHUE8pyQDk21tcM24sYT8MUTTJ0U5ZVtMyxdTVB2EbLUCJ9wKPN7SV?=
 =?us-ascii?Q?J2NUhcP1s/0F95709RhWVYmGkIatvAYI2kuN5GDvYQuHw1UzNkhlyyQqt8/m?=
 =?us-ascii?Q?SMC+BbETBfVHsZecXUeIwa5WPEzaZlYL3PkeAF38?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2eadc0f-372e-4c88-f739-08dd7c4f893f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:58:40.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZEJrjy8kFFen8Y9L9aXdTcFAcBNzwwME+xXdCsJmmvlB+sgOa+hYc6HZh1N7B0x9o/JUxZ2vM/xO29XC6xGRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11137

On Tue, Apr 15, 2025 at 08:54:29AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Moduline Display platform is a part of the wider GOcontroll Moduline
> ecosystem. These are embedded controllers that focus on modularity with
> their swappable IO modules.
>
> The base Moduline Display board includes a board-to-board connector with
> various busses to enable adding new display types required by the
> application. It includes 2 Moduline IO module slots, a simple mono
> codec/amplifier, a four channel adc, 2 CAN busses, an RTC and optional
> wifi/bluetooth.
>
> busses to the display adapter include:
> - 4 lane LVDS
> - 4 lane MIPI-DSI
> - 4 lane MIPI-CSI
> - HDMI 2.0a
> - USB 2.0
> - I2S
> - I2C
> - SPI
>
> Also a couple of GPIO and PWM pins for controlling various ICs on the
> display adapter board.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 525 +++++++++++++++++++++
>  1 file changed, 525 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..0de49775a0bb2879d60956f8135dd263eaab6c69
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> @@ -0,0 +1,525 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mp-tx8p-ml81.dtsi"
> +
> +/ {
> +	compatible = "gocontroll,moduline-display", "fsl,imx8mp";
> +	chassis-type = "embedded";
> +	hardware = "Moduline Display V1.06";
> +
> +	aliases {
> +		can0 = &flexcan1;
> +		can1 = &flexcan2;
> +		ethernet0 = &eqos;
> +		mmc0 = &usdhc3;
> +		mmc1 = &usdhc2;
> +		rtc0 = &rtc_pcf; /* i2c rtc is the main rtc */
> +		rtc1 = &snvs_rtc;
> +		spi0 = &ecspi2; /* spidev number compatibility */
> +		spi1 = &ecspi1; /* spidev number compatibility */
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	external-sensor-supply {
> +		compatible = "regulator-output";
> +		vout-supply = <&reg_5v0_sensor>;
> +	};
> +
> +	reg_1v8_per: regulator-1v8-per {
> +		compatible = "regulator-fixed";
> +		pinctrl-0 = <&pinctrl_reg_1v8>;
> +		pinctrl-names = "default";
> +		power-supply = <&reg_3v3_per>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "1v8-per";
> +		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_3v3_per: regulator-3v3-per {
> +		compatible = "regulator-fixed";
> +		power-supply = <&reg_6v4>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "3v3-per";
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		power-supply = <&reg_6v4>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "5v0";
> +	};
> +
> +	reg_5v0_sensor: regulator-5v0-sensor {
> +		compatible = "regulator-fixed";
> +		pinctrl-0 = <&pinctrl_reg_5v0_sensor>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "5v0-supply-external-sensor";
> +		gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_6v4: regulator-6v4 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt = <6400000>;
> +		regulator-min-microvolt = <6400000>;
> +		regulator-name = "6v4";
> +	};
> +
> +	reg_can1_stby: regulator-can1-stby {
> +		compatible = "regulator-fixed";
> +		pinctrl-0 = <&pinctrl_flexcan1_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can1-stby";
> +		gpio = <&gpio4 3 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_can2_stby: regulator-can2-stby {
> +		compatible = "regulator-fixed";
> +		pinctrl-0 = <&pinctrl_flexcan2_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can2-stby";
> +		gpio = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,bitclock-master = <&cpudai>;
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&cpudai>;
> +		simple-audio-card,name = "tas2505-audio";
> +		simple-audio-card,routing = "Speaker", "DAC";
> +		simple-audio-card,widgets = "Speaker", "Speaker External";
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&tas2505>;
> +		};
> +
> +		cpudai: simple-audio-card,cpu {
> +			sound-dai = <&sai6>;
> +		};
> +	};
> +
> +	wifi_powerseq: wifi-powerseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-0 = <&pinctrl_wl_reg>;
> +		pinctrl-names = "default";
> +		post-power-on-delay-ms = <100>;
> +		power-off-delay-us = <500000>;
> +		reset-gpios = <&gpio2 19 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&ecspi1 {
> +	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>,
> +			   <&gpio1 11 GPIO_ACTIVE_LOW>,
> +			   <&gpio1 10 GPIO_ACTIVE_LOW>;

indention mess!

Frank
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	connector@0 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <0>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +		i2c-bus = <&i2c2>;
> +		reset-gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
> +		slot-number = <1>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_3v3_per>;
> +	};
> +
> +	connector@1 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <1>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		i2c-bus = <&i2c2>;
> +		reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +		slot-number = <2>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_3v3_per>;
> +	};
> +
> +	adc@2 {
> +		compatible = "microchip,mcp3004";
> +		reg = <2>;
> +		spi-max-frequency = <2300000>;
> +		vref-supply = <&reg_vdd_3v3>;
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	pinctrl-names = "default";
> +	xceiver-supply = <&reg_can1_stby>;
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-names = "default";
> +	xceiver-supply = <&reg_can2_stby>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	pinctrl-names = "default", "gpio";
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_gpio>;
> +	pinctrl-names = "default", "gpio";
> +	scl-gpios = <&gpio5 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	tas2505: audio-codec@18 {
> +		compatible = "ti,tas2505";
> +		reg = <0x18>;
> +		clocks = <&clk IMX8MP_CLK_AUDIOMIX_SAI6_MCLK1>;
> +		clock-names = "mclk";
> +		#sound-dai-cells = <0>;
> +		aic32x4-gpio-func = <0xff 0xff 0xff 0xff 0xff>;
> +		av-supply = <&reg_1v8_per>;
> +		dv-supply = <&reg_1v8_per>;
> +		iov-supply = <&reg_vdd_3v3>;
> +		pinctrl-0 = <&pinctrl_tas_reset>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	rtc_pcf: rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +		quartz-load-femtofarads = <7000>;
> +
> +		clock {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_bt: btgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14
> +			MX8MP_DSE_X1
> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI
> +			MX8MP_DSE_X4
> +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO
> +			(MX8MP_DSE_X4 | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK
> +			MX8MP_DSE_X4
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12
> +			MX8MP_DSE_X1
> +			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11
> +			MX8MP_DSE_X1
> +			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			 MX8MP_IOMUXC_SPDIF_RX__CAN1_RX
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			 MX8MP_IOMUXC_SPDIF_TX__CAN1_TX
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_flexcan1_reg: flexcan1reggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			 MX8MP_IOMUXC_UART3_TXD__CAN2_RX
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			 MX8MP_IOMUXC_UART3_RXD__CAN2_TX
> +			 (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_flexcan2_reg: flexcan2reggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL
> +			MX8MP_I2C_DEFAULT
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA
> +			MX8MP_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2-gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16
> +			MX8MP_I2C_DEFAULT
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17
> +			MX8MP_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c4: i2c4grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_MISO__I2C4_SCL
> +			MX8MP_I2C_DEFAULT
> +			MX8MP_IOMUXC_ECSPI2_SS0__I2C4_SDA
> +			MX8MP_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c4_gpio: i2c4-gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_MISO__GPIO5_IO12
> +			MX8MP_I2C_DEFAULT
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13
> +			MX8MP_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: pinctrlusdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK
> +			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3
> +			(MX8MP_DSE_X2 | MX8MP_USDHC_DATA_DEFAULT)
> +		>;
> +	};
> +
> +	pinctrl_reg_1v8: reg-1v8-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_MCLK__GPIO3_IO25
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_reg_5v0_sensor: reg-5v0-sensorgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD7__GPIO4_IO09
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_sai6: sai6grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_TXD6__AUDIOMIX_SAI6_TX_SYNC
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_RXD4__AUDIOMIX_SAI6_TX_BCLK
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_TXD5__AUDIOMIX_SAI6_TX_DATA00
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_TXD7__AUDIOMIX_SAI6_MCLK
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
> +			MX8MP_IOMUXC_SAI1_RXD5__AUDIOMIX_SAI6_RX_DATA00
> +			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_tas_reset: tasresetgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SAI3_RXD__UART2_DCE_RTS
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +			MX8MP_IOMUXC_SAI3_RXC__UART2_DCE_CTS
> +			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B
> +			(MX8MP_DSE_X6 | MX8MP_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_wl_int: wlintgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13
> +			(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_wl_reg: wlreggrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19
> +			MX8MP_DSE_X1
> +		>;
> +	};
> +};
> +
> +&sai6 {
> +	assigned-clocks = <&clk IMX8MP_CLK_SAI6>;
> +	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <12288000>;
> +	pinctrl-0 = <&pinctrl_sai6>;
> +	pinctrl-names = "default";
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-names = "host-wakeup";
> +		device-wakeup-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> +		max-speed = <921600>;
> +		pinctrl-0 = <&pinctrl_bt>;
> +		pinctrl-names = "default";
> +		shutdown-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +		vbat-supply = <&reg_3v3_per>;
> +		vddio-supply = <&reg_3v3_per>;
> +	};
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usdhc2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <50000000>;
> +	cap-power-off-card;
> +	keep-power-in-suspend;
> +	max-frequency = <50000000>;
> +	mmc-pwrseq = <&wifi_powerseq>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-names = "default";
> +	sd-uhs-sdr25;
> +	vmmc-supply = <&reg_3v3_per>;
> +	status = "okay";
> +
> +	wifi@1 {
> +		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "host-wake";
> +		pinctrl-0 = <&pinctrl_wl_int>;
> +		pinctrl-names = "default";
> +		brcm,board-type = "GOcontroll,moduline";
> +	};
> +};
> +
> +&wdog1 {
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	pinctrl-names = "default";
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
>
> --
> 2.49.0
>
>
