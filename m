Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F95C201034;
	Tue, 10 Jun 2025 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568782; cv=fail; b=eoZ/K3IbluyqRaM7SijEBGZCGXtmGR8wTVhHQsMEYtOR4gmykQRxyaA0AX82yPmVlamIl56VIYQKFsjRifdKY6esjeFGq9Wc9l2o0TKzsb6clEt0L/ceFm78c4lgm9jB6RybtpOEm2vp/ttb2nroWp2uTt0fW5yghiS9EYwR5QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568782; c=relaxed/simple;
	bh=t53gGEZ+avOcU5oDkSeZiDpNhFAWXPsu77mvZB5f2Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AOeQH64tmv4spE15FF5rwEG6ShsdtOgOXzmyUosE1PBupeDBeVrsp/RbzZkUYZl7CuOSYyErdKHeEPZ0aB+oWjNepvGsPRpCAt9wzKFb5G8NcZXKKL+iZAcOoPLlGBYTrzcOAoaPLtLxlnIvndG8uIfTOEuWNUSBjyhoXtwtoDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WejfA8zv; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WejfA8zv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNf8xYyQUeWG5BWsmNwMaInuYEGE3qSaMzpLTp3d2L2Dv7LXee+qvxQCXMHjIwVIndqtQK0/GE3mFnAPI8RGh7Ld85MFUyeRxaAqbMMaWFG3t0S+ATxbwshALkEG77lSTRNp6IglLj54+zMR5h7MWYxYUgP8YeJQzY79g6fddM3pgvTi6Gnc4K6nz+BYpvAwRTJzyDcP9TrZf49u7zQz8Mr54kMcBzu7pKaywUaDo6ubMPgaUKs5DjMfMLWNfePP/rKz/5apt/C5XeUmtzon9Ud2m2M0qF0qPxZg3ZovZG88ijjkPSkMHoJk361gFt9Y7vkT1gjugQzz4alNtrKIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhikFKRcRUlhx/oMxfyKhgDItPzPjV0EcGVe83UdT/M=;
 b=W7RVSNtR4MpgHT/IaHeuzQf9rZ/rKQtHXTwfnMEWmH+EClXEjH6UDTuPaw5W7S3QlH12paLqiS2WzVa0ugxyr9s2DE+w/wGlYMnEUhv47Ol2JIBBPbK1at+mH0/orQqoFTausJSVBUNBep6ynKcQ5jPy6cSJjedZ1HC9qmx8JnKg7wOr5FURROgD5aAlIFPDFWwBquwI+0+aCDodDvrZ1SayTkHawgM00c90uthPDwDmoYwFewwYaH632lvIU0lRZ8GVLHaYk3nlWHJrecI246YGf3MWNsCMhxZuV32xorx44tADUV7z4lVK4jP3MiE9NuhznfXU5cbRsnKpGJsjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhikFKRcRUlhx/oMxfyKhgDItPzPjV0EcGVe83UdT/M=;
 b=WejfA8zv2oI9x2Ed2jV+Nd+YbhaIC/KkfqUCP2M9IfOzB8k2LXKKGDvTUS5kUToa3CATTz3zQYfnnxZSatvPlgrkbOxc7UbxyRZ1zHruxJNQeglHnJDUG49kG2G3Ruv+SJ7wtySIqNPQLxc9nng0kcmsC1mR5kd/mPBckrot6tH3LiyORBN1cbWiiGaF92MK5tZYs6amaETso3m/kV7mbpWy/p3hwHeGG2dcP8brnsa2S5zTs8/4RE+LaDXqX6+kbgGl2eZ1RipREG3TasrQKWw3wvMd5aIVgXnkgzcjc2wkHkko08Dq84r6hJUQ26KF1hKSCSvzJw+w9XpeY/mOXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Tue, 10 Jun
 2025 15:19:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:19:37 +0000
Date: Tue, 10 Jun 2025 11:19:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/10] ARM: dts: imx6ul: support Engicam MicroGEA BMM
 board
Message-ID: <aEhNAby/1HpTRtjX@lizhi-Precision-Tower-5810>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
 <20250610100139.2476555-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610100139.2476555-4-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SJ0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffb38ca-0acd-4ec7-51cb-08dda8323662
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?1KGPLJT3AuVsNJ1+fN6pITK6iy6/5B6rU6C9TdYi833G9X7/LYyMCsVDaLM6?=
 =?us-ascii?Q?AqyKj/sExsBiH6aOnSyFL8GFgI/Qyv2ra5edbIMDGvUV/KsqC1ra50/kYKRC?=
 =?us-ascii?Q?FN+HA9qbQ+6F8d/jfop6q6ba8Q7pOW0bCMzgSdzmaiY7AhkhjqFjG5g0/uOD?=
 =?us-ascii?Q?oJ1Hm8hXVmwQLUREvl77peGEJ8CxctYKW2D+nrb62Saw6DLXMp/pYob79xiC?=
 =?us-ascii?Q?04PtDdXhJd/kmeqCkCt005c+1+o9CGvISuwmR0epIsquv3nQ5SttAa6WCJ5/?=
 =?us-ascii?Q?wY2k7Qo28gcBaWQ4MQ9ilhTPPawG5dnMcgH+SUP9MeWbTGdOzuBm77npPX6F?=
 =?us-ascii?Q?ohYYtQ5tUQYhyX4F04C/kDji+M5KZ0uv7i3A+4MRKKNV6WwOkn3g5mJGFrOu?=
 =?us-ascii?Q?0EDfVd6OGKF71Uji/Y8O6tt8hVimmwC5VudJrXGOet6BlO7325Rfe8CoTHN9?=
 =?us-ascii?Q?roWRgO++n4M5P8ew0ooygawVkySa5oQC9F2DT3waOH3z/bS4gkeW/35wK30Q?=
 =?us-ascii?Q?7dlDZWTKfN7kGIr/8gJXNVNc9q9maV5BwXDYjyG3Q2FwHixwVTgsi61pcbQl?=
 =?us-ascii?Q?+1JPyLV84DE55UbyMeMbo9ruvSpfTAgHzfU4maKSWaQFlZ648MmAGoOUWh7Z?=
 =?us-ascii?Q?EygcG8DE1RVcAFyJQMDW4iSWZF/RSFCcEzv9nXgEde6o0O58PEGfd+lpXQ/z?=
 =?us-ascii?Q?gkj6Zyjg1GrtUqeO3uT7RA8/JtioDVZCVlAC9eARKa8buKJ+xUoTIdmmOspM?=
 =?us-ascii?Q?Ihcw+wRZrcvibjlONtT17df2asFkiUJht94a6RPSxwunxZPEQXEi8Udx8Zu0?=
 =?us-ascii?Q?rTnj3P93qVHxZah4AWLgCES9Ai3/wXl4VYWh/wppLt4FCzWT7Hq93Iv9Zz7C?=
 =?us-ascii?Q?FnGWc8dZ//Gup/grQiXbG0RWc6KwxdU6aChP6kQDk5urUhvLJ+2hHJnnHFgD?=
 =?us-ascii?Q?ghMXSZ32acFcqBTTnYH+Px5S25N6u+25yZQT+3+OTryItm9yrL+8FKI+4OdA?=
 =?us-ascii?Q?Y70Kgj8mrB/xiClW0cxo1RDiBPjFtqpufiOWNlEAuMA2cJfizLPPTDSfBzVQ?=
 =?us-ascii?Q?vnIwXZKFQStemM6dFTMmgIEVj3XhNa11RzWmrGb/Pu5wt7RlLVj1t1TUvT6n?=
 =?us-ascii?Q?/xPH+6jHnl/op02KzmxgzFx/S/Hz8Z240yaWJOOjZJOsaDNc2IV5IoAJebx1?=
 =?us-ascii?Q?mDOFvwjWw+f+JknG6RZPuI3DT59sntGO1+Td02B5xkEUeDCnj6GZIZxR+9aP?=
 =?us-ascii?Q?c55s+kXWTvaxyldLYV4OrO78s8e2sMe4h3kugsY52ooQk+tSwoyqUSrQTU4B?=
 =?us-ascii?Q?yJKqwlqQBZh8pdDW+HLyVedUQ+ZVviCOznc3BicQtKhVJTfNf+MIDwCiDwGr?=
 =?us-ascii?Q?qNqPfv7u5ivZLJvSiqeBQ99yvnpZenKnIyorGP6uKhmAgFmhxvs8GL0rL/fT?=
 =?us-ascii?Q?GFw+7GGM42V4u6L/JzXmq3IIDKplkST+GLACbnuLAdAew4et7j7m3g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?73QdNYjJJajqusvUQxlovv0GPOL/lZa4+l7ZarNDLo5Wl6pvjQ5bBys0sMen?=
 =?us-ascii?Q?rjRmXPXuUENknmi/cARRcwSUmEXHroQLmpxxA2qHO/R3SBhtn09646MpPP8L?=
 =?us-ascii?Q?07H+0mbf6rIlSbpymm6U9K/stPcvpYAd0VwIehccQzusosjJD2P6ZAwjU2Xi?=
 =?us-ascii?Q?w+xP8oJlaiVDR72u2BLc2mdVccZ3L3X5UEry4iHx9rXo4BCUykflWDmAELRi?=
 =?us-ascii?Q?bwHwbieSsASPcuODbX7vZ4M4ca2Ril/JP+VjG+DYAdPVASTH7XcF6ka5bsqR?=
 =?us-ascii?Q?msMpXYWwiIu4/5eZvVJ4CCrXc6BsFYDc1AhD6EqhI0EQLY38X9DDclRc4PmP?=
 =?us-ascii?Q?T8mofKBz9+WJZAxcZ3fE8JavAz3DPcsdI+G5Nthnep5MFwQzXo/rh6smVS5v?=
 =?us-ascii?Q?4q7NWwE9Z0L/g7UT1J+clK3Ula9zNYhwN6FETbjK/ir58yTgR62Bi8am2LTm?=
 =?us-ascii?Q?prSZQ/J3rvLtepDa+NYxbuOlCDmnnZ5rnJ6QUjJ7MY/IQcHxtn8MwtOCCXe4?=
 =?us-ascii?Q?blsvw7L3iVNh1ggrQylGBll1TORDQx+xfKFJxkWCU68qEjKPgSAD0eKLlkkl?=
 =?us-ascii?Q?QUnHro/X7++IlkZ7IuWU+N/y649obzPCyfW6k62yjpZlEYB8Muu3b8fSQMYs?=
 =?us-ascii?Q?+wfRBzdMMK27OtdkrxtzHmhiHv395W9TMPlghfw5Zm8x5S7w5SgyHjO40kjZ?=
 =?us-ascii?Q?j15YujtsvhcOZdVpIDOpHDdmwqzYG3JNi6pl6cmxee5phuNMr5VQwJsIZ+wA?=
 =?us-ascii?Q?qInm/LNAQ67AwYb96NRmg5XumiGzCl1Fte7JHDFOwFWUp44llJr24gzaInhm?=
 =?us-ascii?Q?BLZctqpUJy2Ed8Q6GB6pWNGzpgyvCQltttQG5YFE3gESY3y1XAC14a8LKM9b?=
 =?us-ascii?Q?ZWqvI/BNx26JMyyp65A7DNkBlk6hD7RolTo3zFGeHnIeFG4GgZ5Dph4TNxml?=
 =?us-ascii?Q?P72enAdgo/NyODjABgxR8HUw1kMv15x+Xe5RHetkCeZlVAO5GnrK62RMMiE4?=
 =?us-ascii?Q?0hYhmo1tNVNQuwIwMuW70BNEjJtdPyTaEM1CwWJGOgw2AV+iEBItPdIozuos?=
 =?us-ascii?Q?Wi8zqC07IspbIccIa2i/6Qn2y7Fe0+XrhkJY6/pqd9qpPZvpuQufIBYswjwS?=
 =?us-ascii?Q?mfqk3/TPo6CPfI6B596F485vzD0i2LLjr5om8mx18lSdvCdwisvy1SX9J/pR?=
 =?us-ascii?Q?/H7sCHAk96SrmbaqljHdxEitE1Vo+HY4owWyZHsvaGdZxEFcXUFRzEJGsBUm?=
 =?us-ascii?Q?3/VDdMVZo1jm9BnLTaT9rUhDvO3JnrIMnsbyQxGPTtjgfvU/xNGeU3hhq3Nl?=
 =?us-ascii?Q?jp0MPp89+ujNli6eCuDQB+fH473rkcmnXSXIgVD36xJRiBAWsaMrs/2vZlB3?=
 =?us-ascii?Q?zKawLpKMdgpgkieSZePnUQgE/aEV17vWgFbeiq0aLaD9rDK6AYZiX1G5xnav?=
 =?us-ascii?Q?hMRrUVePmd56MD8uPXINJKRw5rduHTtxXOoVCCoIwpyBtpxMqEFZXp759oHV?=
 =?us-ascii?Q?FXvI86atV2Kf2m4uvcyYnmN/4WNI+LHt4jOzp63aShdDqT6RywNFMlDbuleu?=
 =?us-ascii?Q?MgKZvE5+Fe+ke+dE2IAZW4Wm+5KjctS55MrMxmXo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffb38ca-0acd-4ec7-51cb-08dda8323662
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:19:37.2828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89Vr7T99uTu9KdxVkb83KklxbpxffedTaoBpfcVC7xs8iUFoGdjaQlVQGMeMoWMbihYeX9Sn/Ua7jHPRbB+zJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9452

On Tue, Jun 10, 2025 at 12:00:16PM +0200, Dario Binacchi wrote:
> Support Engicam MicroGEA BMM board with:
>
> - 256 Mbytes NAND Flash
> - 512 Mbytes DRAM DDR2
> - CAN
> - Micro SD card connector
> - USB 2.0 high-speed/full-speed
> - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
>
> Changes in v3:
> - Rename sgtl5000 node to audio-codec.
> - Move the reg property of the audio-codec node right
>   after the compatible property.
> - Drop an extra blank line from iomuxc and iomuxc_snvs nodes.
>
> Changes in v2:
> - Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
> - Add Reviewed-by tag of Peng Fan.
>
>  arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
>  .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 303 ++++++++++++++++++
>  2 files changed, 304 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 8b3abe817e12..57f185198217 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -356,6 +356,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-dhcom-pdk2.dtb \
>  	imx6ull-dhcom-picoitx.dtb \
>  	imx6ull-dhcor-maveo-box.dtb \
> +	imx6ull-engicam-microgea-bmm.dtb \
>  	imx6ull-jozacp.dtb \
>  	imx6ull-kontron-bl.dtb \
>  	imx6ull-myir-mys-6ulx-eval.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
> new file mode 100644
> index 000000000000..279d46c22cd7
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
> @@ -0,0 +1,303 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + * Copyright (C) 2025 Engicam srl
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-engicam-microgea.dtsi"
> +
> +/ {
> +	compatible = "engicam,microgea-imx6ull-bmm",
> +		     "engicam,microgea-imx6ull", "fsl,imx6ull";
> +	model = "Engicam MicroGEA i.MX6ULL BMM Board";
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 100>;
> +		num-interpolated-steps = <100>;
> +		default-brightness-level = <85>;
> +		pwms = <&pwm8 0 100000 0>;
> +	};
> +
> +	buzzer {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm4 0 1000000 0>;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usb1>;
> +		regulator-name = "usb1_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio5 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usb2_vbus: regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usb2>;
> +		regulator-name = "usbotg_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_ext_pwr: regulator-ext-pwr {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_ext_pwr>;
> +		regulator-name = "ext-pwr";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio5 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "imx6ull-microgea-bmm-sgtl5000";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&codec_dai>;
> +		simple-audio-card,frame-master = <&codec_dai>;
> +		simple-audio-card,widgets =
> +			"Microphone", "Mic Jack",
> +			"Headphone", "Headphone Jack";
> +		simple-audio-card,routing =
> +			"MIC_IN", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HP_OUT";
> +
> +		cpu_dai: simple-audio-card,cpu {
> +			sound-dai = <&sai2>;
> +		};
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai = <&codec>;
> +		};
> +	};
> +};
> +
> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	codec: audio-codec@a {
> +		compatible = "fsl,sgtl5000";
> +		reg = <0x0a>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_mclk>;
> +		#sound-dai-cells = <0>;
> +		clocks = <&clks IMX6UL_CLK_CKO>;
> +		assigned-clocks = <&clks IMX6UL_CLK_CKO2_SEL>,
> +				  <&clks IMX6UL_CLK_CKO2_PODF>,
> +				  <&clks IMX6UL_CLK_CKO2>,
> +				  <&clks IMX6UL_CLK_CKO>;
> +		assigned-clock-parents = <&clks IMX6UL_CLK_OSC>,
> +					 <&clks IMX6UL_CLK_CKO2_SEL>,
> +					 <&clks IMX6UL_CLK_CKO2_PODF>,
> +					 <&clks IMX6UL_CLK_CKO2>;
> +		VDDA-supply = <&reg_3v3>;
> +		VDDIO-supply = <&reg_3v3>;
> +		VDDD-supply = <&reg_1v8>;
> +	};
> +};
> +
> +&pwm4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm4>;
> +	status = "okay";
> +};
> +
> +&pwm8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm8>;
> +	status = "okay";
> +};
> +
> +&sai2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai2>;
> +	status = "okay";
> +};
> +
> +&tsc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_tsc>;
> +	measure-delay-time = <0x9ffff>;
> +	pre-charge-time = <0xfff>;
> +	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb1_vbus>;
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb2_vbus>;
> +	status = "okay";
> +};
> +
> +/* MicroSD */
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	vmmc-supply = <&reg_3v3>;
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_can: can-grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
> +			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO00__I2C2_SCL		0x4001b8b0
> +			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA	0x4001b8b0
> +		>;
> +	};
> +
> +	pinctrl_mclk: mclkgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_JTAG_TMS__CCM_CLKO1		0x13009
> +		>;
> +	};
> +
> +	pinctrl_pwm4: pwm4grp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
> +		>;
> +	};
> +
> +	pinctrl_pwm8: pwm8grp {
> +		fsl,pins = <
> +			MX6UL_PAD_ENET1_RX_ER__PWM8_OUT		0x11008
> +		>;
> +	};
> +
> +	pinctrl_sai2: sai2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x130b0
> +			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
> +			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
> +			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
> +		>;
> +	};
> +
> +	pinctrl_tsc: tscgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x000b0
> +			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0x000b0
> +			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0x000b0
> +			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0x000b0
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
> +			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> +		>;
> +	};
> +};
> +
> +&iomuxc_snvs {
> +	pinctrl_reg_usb1: regusb1grp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x17059
> +		>;
> +	};
> +
> +	pinctrl_reg_usb2: regusb2grp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER3__GPIO5_IO03	0x17059
> +		>;
> +	};
> +
> +	pinctrl_reg_ext_pwr: reg-ext-pwrgrp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
> +		>;
> +	};
> +};
> --
> 2.43.0
>
