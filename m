Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ECE1FFC55;
	Mon,  9 Jun 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482182; cv=fail; b=REeSbW/5Zq4j9xFz7dsUihJgX0g7lAltDDNhscTeX2hDbjEa865PbxfVgr/8YOR26zXdSevqLRwguZ8K25IGGVCAETOrxzj7TgcYP/w7EmwshyXsUJ2bdF8nMsxaCgMdocEbYK/PzsmiLaxJ/fpIJ67rVmohRZrTR3j12ckouxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482182; c=relaxed/simple;
	bh=Fa7Ppp2AvwjFX37tIpyiHXFny83IFUbgWF/V6tK0IlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JJ3alfyQ15kSIDyuLnEeOPU/KoHxRLR60Vj2ia+tPQ6OP7bgtusoV0bxWL0adPTF0XlPxmQ/biG09RHcK0X4+cqB3FczIa43+b358oT87SGDeYE63+UMGff9BGy9U3rKDsBR0V53lKo9MPIpQwPg9Uxzy6kB08ek5+H3auSexD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fWAVYlC2; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fWAVYlC2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haP51aftNl6V1K5yA777trH5QpEKKhhGmfWaPY7t97eIux98QwDvfYXsoRIemhTIqjxZigb5V52UDRfSNvzyNZXHLkxRSUFsrjb8r8qsA5UdFneTd0a32B/WaW//iFxldRuBQP4dwZfenmdBs/K4PHf8o2ipMgbJ21E16fKN/odp9BWR7KcLcZT0VYMLX9vbI8Z9SnBz/uR3HiVY8P9mCnAYqr23oeoW4Oqo5rqZ7RjlngFgQeKvwKN4OxnaIYi0s5OivIspAj00e1S0gXTT+imGZ4P8ERFaHRvB0pLOnDVkBz0WVeHC6PRnBG4j/wRgEu670SvgawwBZkLnKUMbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGQevNilKf9mN45gXnIlrM45cLmD2Ze74Adxhou8tkc=;
 b=fzPnUOiuXkA4cfVTH3jyXVll5zU54A4QTJRNYPBJ+ctyzKH1glvnA+jpyr1bovCa+b6npo6/1/pS5vJ/6NovNwHATFlhMIAZuVC7tNtUVC1N6nsSKANV9e+B4VdXRuybZ/1EQhwNlzNMCuzHRHtau0ME+0iRsV02QdCNSNAOFhJPqzyFeuzpKymPFY8KTK8z1qcR+dy6JnUWLQD1GZ+XSOSe0MJEkTls67mqItcV9V8zCeuZ+xbR/RJooDpyy98ozmeu31PNsoP3tshIBvhA9HNBnS/zVoGAyzK+JFPVrVI5YVOvZSfPPIwQfg+HjfIHUM+33oFoxwA6z+mkEqnjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGQevNilKf9mN45gXnIlrM45cLmD2Ze74Adxhou8tkc=;
 b=fWAVYlC2VqmuEU91M6Mdqlp092AqdbttLNB+A2IXaRFdEDO4kXjrCPSdm4aez39RK4ok3xKC8J5IaMi5YvfQ5UL4r6vV3Rtqs9A7l4bk24ybyf5mb3IeatTAl9m+d5hHMMacgo3EUlxxx8zih4WK5yJiitDN4YOf22w2I0FCpkJHumtFORwqxN8yJbPoygpaR9inaFRJazKiNg0ROQNBScv8R7nwqTONvRSgg1+FFtMO/gub15NTpyg2G86nwTYhp5OrqBHpAkYPjg0jxHInnwkdV6D/G8Jh1/VBKESMupo0W+lzKu39U98BqSmAR7y7HYc8d5iBnnD9yzrQpP46PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9673.eurprd04.prod.outlook.com (2603:10a6:10:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 9 Jun
 2025 15:16:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:16:17 +0000
Date: Mon, 9 Jun 2025 11:16:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/10] ARM: dts: imx6ul: support Engicam
 MicroGEA-MX6UL SoM
Message-ID: <aEb6uQNDHYRKpiI6@lizhi-Precision-Tower-5810>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
 <20250609101637.2322809-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609101637.2322809-3-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: PH7PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:510:174::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd7f4b1-7e00-476d-6be1-08dda76894ba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ZHtyh3mmAmOyqRQUaoA8fn9yxXRokANeTTPZ8PVfGUL95nhH/ae1gCCCcZGh?=
 =?us-ascii?Q?v4eQahVc1xtoYufyYMZm6M6PF3dyzvwIGj5bx5zN+bHbGX/dCFpZhkG8RatR?=
 =?us-ascii?Q?AufAi089lyOmbF7qLaPSBONdMZ0Z4oDGovW5YAVxtnIcb3PLt12GKK9dq7h4?=
 =?us-ascii?Q?vAlHzSaGj2kp8cLfV+39cpoeeB9bqEYQ/GgMjAVSBVVehNStS5LjgUBPB4vh?=
 =?us-ascii?Q?OzayK++UeCd4vG3Mt/RCQPM4knEawQR7zLNyGGDjHw2FwdjBNWFyq2iJJ6mT?=
 =?us-ascii?Q?fIdnfI9JFbMOcBGo/ECq3UCgQ4CyfqVGGzqzzxCSGqV9TLUAoIvdfYH515ym?=
 =?us-ascii?Q?U2HxNKV2c2nKwCJUS9dcQXBYukbLtXZ6YwlDlxhMwSgXTDHybrrennT0qLQg?=
 =?us-ascii?Q?rBSk5IGuSBqaxQbhcYP8dYt8EDRBVb9ki68po7+PSjCpIZhGImp657MxvU5q?=
 =?us-ascii?Q?Rz2Qr58soT7YQKPbUUvCzeT248lLIeZq7FG4f2094ci7WbvmJulfndTHWz7U?=
 =?us-ascii?Q?5u6AYa25pffGzXHi1E7pbo7htd9SGmqxNDlPxp+urySHehQUHdQENWLgXyNm?=
 =?us-ascii?Q?EjduVGniBhqdZ5TQB83DJp/OirEn2lu3qo4Umnm+DJd0osvAxYZ7m26GY39+?=
 =?us-ascii?Q?P8jYIRorm+FifHg/NrEVHfSDoDkpg/Ge85jwzpKwAi3/qlRCDWAyLWJYa+zC?=
 =?us-ascii?Q?ka9U0Rm18FhZ9Vj9OeKgCw858M5DjqEBIVWDrN755yUdlQHGOGwJVx9LGmLt?=
 =?us-ascii?Q?GKWCUIgcem5WAuJY1tO1/uX8d0iDWhULztJ9SG8gzZXH/GobmtVB1pdd4SUA?=
 =?us-ascii?Q?gSYHVXureTtXsnIc5UHPUDzJyfwLIm/qz6CqGw+dDyDpwYwCwoXWSicBr+Ag?=
 =?us-ascii?Q?3aYWgFDGobVBKPoB8JiIlHnnSAbZ4ozwZP0WupSNM9xEdWFTN5LJTpJYgIAV?=
 =?us-ascii?Q?Y9XnUVMiui/7X8OovVnz+ocUnQgwJcPkUTWFUcgi2Q3hxL0eZL1tMxDensez?=
 =?us-ascii?Q?OgayHT2fWrWO9znAyObBas5Dt1rYKdvR8wiKsrRCilzoT1mQOms74MJp48Hx?=
 =?us-ascii?Q?S5zkLmhhnXJi30nKVZN6F+ePxkBZATBKzcStOc+WyO0tAm3laHqsTDtwrRB5?=
 =?us-ascii?Q?AhzO4Eumv021cnwLyNWXV054UHikp2eO3dfH6uDkQSEXoirYwqZrl/PPmC7d?=
 =?us-ascii?Q?PblWAUxdu4k8AkrJ+Bgn0wJ6bXZOKLqlVJH+MexqoDI/rEJsliZxY+VG7iZF?=
 =?us-ascii?Q?NVvRfk0ALT7moqxzliVKFze8d/LzSJfDy+mu7nuV8DYvEpGDKQvMBJDPzXZE?=
 =?us-ascii?Q?6lt3N+LBGF2PECwbX60HytTlx+HoI21oxrmk/l+dSPGsZXG8jOIMQU6IXQFR?=
 =?us-ascii?Q?am11IlK43GQO5WtztECGoDBL4ZmWfxz0HxPME3+TXcY5qXOKoVf6K+MmXIX4?=
 =?us-ascii?Q?Fy2xnRJWqXO90KvQu0pP6jiVEpM5HZixk/o5wVbKNXGpSFjFaNKoHA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/w+vqV8eldx4SKjhmVblJSfKkMznOVZxJdgnt6krX++jRbXa2GqRAD/ymqED?=
 =?us-ascii?Q?V059lRHKbnRvJqhzKkiGHHJ/SvIadyqhyj/+Q7f7910bcD1Mo6kJCL7D075q?=
 =?us-ascii?Q?GFKvUlRcrGMAtvdWWu0BmpwOP6M+G3fchtrC83/joW1kbCAx0SDE5HDTb4RQ?=
 =?us-ascii?Q?Uy+ELA0C0XcMAlvwwT1JcRB28DKaBoCHgRqtgEy8B9NTQu2WC/v4RJ/16MwA?=
 =?us-ascii?Q?gxah0zbuvYZ1KRyGvoHQUvAK37ivozDspmQ/R3CWCJEe5Jppn8kLlkC1bOvg?=
 =?us-ascii?Q?e9KIaSsTKkhh3XpVQ8DCvrlP10/Aug3n4042/OO/w1iTrwEUUn6Qm97PO8rA?=
 =?us-ascii?Q?8tQ5/AM7Sg94hmxP6Vkts3FluOTqaxlk0g4T+9qpDt5TJijaeThhWURz7DU8?=
 =?us-ascii?Q?1imzbHHsFnItUh6c/bABRMXtQC2aEXGf14g409xWcnDJapQtcoHSmkEvDwrj?=
 =?us-ascii?Q?Oy6TftPCQ8/eiKasnXPeiA3EGrZgYEE5QINJjRb35rlNMgUzFEl/yRvTfUWv?=
 =?us-ascii?Q?LV5dYf0I9u/1UOxfXxh0Fz4BZjernfBHHYY65eBsIEqe/+HODbpywi2X/ofX?=
 =?us-ascii?Q?jxP1WjgrnQPCC4zuB0hM0GtfTAM2R+3IaS6XQknKhpmIODT2idZw19TaPA8b?=
 =?us-ascii?Q?H6cm8mBUV95NWKP1ZOqptwM4GJGn2C2phQ7VZ5TkYISPwo7BlTeTNU/wBvFa?=
 =?us-ascii?Q?LtyJJjeFHrDGLpBvUADD9k54VDXCIWP4muhUu0nQ7Eb9SymJmozaBOGb4vj1?=
 =?us-ascii?Q?ky2uHizpyV3AQC43T9tgUNmbJ/anKmyStqhg/euk5BB2Q+36qCnSR/9Cmh+V?=
 =?us-ascii?Q?dQCaEleHi+juM7yrEMlZlfRV6eWoyjBfxEw0WzYvQB/u0wCy6ZD/Y7FQtn28?=
 =?us-ascii?Q?qpuneUPOpKBXF2GXTfYA+Oxwm4Th859LMyY9EgUUUORaijH1/UW/9HhuMjwG?=
 =?us-ascii?Q?2u+fMGo0JLsQIJo/3LjR2L4V6qZ/FCjcBwPJEUvcz5shrXAN9O6tJkFvs+pL?=
 =?us-ascii?Q?K/u0qfGt9wAe6PLfzHV+flLpQh9k8+kRUlOC3oADsfMCTaE3xnP79Gv4/qGE?=
 =?us-ascii?Q?cxe3u98GARTUZ+o0DkjbTkFlRgwjglPouH2sKqmRVi5WOTbIBzoi/gCLCAKU?=
 =?us-ascii?Q?8uJiVQ/wJ7pHl7NSLxl2AfOQmKj5UM3PSAUQvJWGiaO+vft2IJTy5cwpUHsL?=
 =?us-ascii?Q?F1kk/B1tX2TOpdDWWQY5hStNb329KnsXq64gl+V7Gj8acWbjTR51KTJPjjlW?=
 =?us-ascii?Q?lrvhRpWASVoo+DoMSLzKztWRODy4LRUuj5MRG1RHUgIFjgLeGkNp3FPJF+I5?=
 =?us-ascii?Q?lxUUioCtu27WcSn9B4yS550YMs0IfshIQqpo3ctZ0o01SeoxLMtykNSYmQvX?=
 =?us-ascii?Q?WkiP27R/sXuCxLcqSELN2eSIdDaM4iObF5QzgYOZs8b+A/bktQpyyI8JKclG?=
 =?us-ascii?Q?y+keYHesxbGEeOExXLbXe4fTp7ij+AcATW7fYQ/F2J3d7a8xtE+DUA7cYyPb?=
 =?us-ascii?Q?dK42WVWw75F5WFBzwDeh5rLVr0fOvpgpqLa+2McLNkNsezfhQ3egPgne9hGE?=
 =?us-ascii?Q?FDflqHmGIoU3xZ9oiwTAPLuk+4j+jvAWrBSm3aSF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd7f4b1-7e00-476d-6be1-08dda76894ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:16:17.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4AkMYzrYF9ciSUHaCqqua2SvIAtlXgEfCRROq9+ySA9WpldWr6NffHGY3W2YZMVFaVshYcYyuCaXqmLMgWU/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9673

On Mon, Jun 09, 2025 at 12:15:35PM +0200, Dario Binacchi wrote:
> Support Engicam MicroGEA-MX6UL SoM with:
>
>  - 256 Mbytes NAND Flash
>  - 512 Mbytes DRAM DDR2
>  - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v2:
> - Change local-mac-address to 00 00 00 00 00 00. The actual value will
>   be set by the bootloader. The previous one was assigned to Freescale
>   Semiconductor.
>
>  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> new file mode 100644
> index 000000000000..38971f6512a2
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + * Copyright (C) 2025 Engicam srl
> + */
> +
> +/dts-v1/;
> +
> + #include "imx6ull.dtsi"
> +
> +/ {
> +	compatible = "engicam,microgea-imx6ull", "fsl,imx6ull";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
> +	phy-mode = "rmii";
> +	phy-handle = <&ethphy0>;
> +	local-mac-address = [00 00 00 00 00 00];
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <4000>;
> +			reset-deassert-us = <4000>;
> +		};
> +	};
> +};
> +
> +/* NAND */
> +&gpmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-ecc-mode = "hw";
> +	nand-ecc-strength = <0>;
> +	nand-ecc-step-size = <0>;
> +	nand-on-flash-bbt;

Not related this patch, latest device tree binding for nand-controler should
look like

	nand@0 {
		reg = <0>;
		nand-ecc-mode = "hw";
		...
	}

I am not sure if above dts work at your ul board.

Frank

> +	status = "okay";
> +};
> +
> +&iomuxc {
> +
> +	pinctrl_enet1: enet1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b009
> +			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
> +			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_gpmi_nand: gpminandgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
> +			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
> +			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
> +			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
> +			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
> +			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
> +			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
> +			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
> +			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
> +			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
> +			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
> +			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
> +			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
> +			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
> +			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
> +		>;
> +	};
> +};
> +
> +&iomuxc_snvs {
> +	pinctrl_phy_reset: phy-resetgrp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x1b0b0
> +		>;
> +	};
> +};
> --
> 2.43.0
>
