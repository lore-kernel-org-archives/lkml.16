Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C826B537FF;
	Wed,  2 Apr 2025 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622315; cv=fail; b=d5SNvGrZKlZY5Mo874Suxj4A2XO/Pn5tcMEIboPTsMV8ZbLLNnjfEQPMrLKHclU9egmJKQ0rM/cH959b0697RUs+YfF2JICwIoQuUAoqqUnICYPSvdQl22gJy4maRRfvvIrHdiODMw/bkzX502iZq+NO4x/hZ2xZlqRrVp/CC3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622315; c=relaxed/simple;
	bh=wNUmVvKBMKrjHlwSUHo17nSQT9Wrnncj+ZgKU1dZg8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EAzbMfsIUmX69glLPx7Ux/SnS/C/ZMs3ld69OuRhOPypPnMXtXG93MwKS2/gIkYaE75COmBUcXtskW+lNhnSXioCA8IZ68LWpSqDa86fKiybzk1gNLng3lkImAMLxWaJANJe5QXvPYWiS8O1sxAmZY18/YLWQ4VJIywOFNJIl1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eohC9kvq; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eohC9kvq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecE+JqLcDOr59NonB82hDUC0uSzLttyAqjqX0JywR67l8Ck13BYHhEPDY8eghwDKzNudlxmLbAd4TiEtU7R+J5IO/awkINKabdmJlIoYDfXy/QRSDcICkttgE7/NL3sI6dT6lRpPEMS2kzVjOiIEI3bSk0h9c/sqVlzUBZGptj0lq74liECfWhw+kLoFDNCXNNqKOTCekBmS8ePf3T6y3v1nwFJDPkx+/lFEiPtlvpFosgEtnKpzfLwW/c00vTTDSPNQYmsb6iF4hdYVQsab3RgKSjLWAsYjPzG5j/6LOfnJXteE1l8JtDfYgSxqhduVhrfGd1r6grswDLq616slqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk20JCNdq7tZ00XNMGhGxqTmvgCWt5nzBiAo9OXIz4g=;
 b=KLjLObcJTS8LCw2EA81iuZcrsHc2rkeXrRjmqZoaNdBy89bsLNZyoRplkOKHU8wQVR27DOSLhYcBdccmMr3NP2Lzxp7xjh/hM1vy74XxetmsEwnD8uCGNhU5LOpm/NwGRqgGXQKOuunc1qaJIWHJvMCa09LyFkZ5/NOZD4llTIuQiEDLrygNCp3lFCkFa6Bfi2qawX5M9CdvpdIggDvQbxl4vwA9ewD6BeBH+24nK0ynD/b1JiakzRrD+ofvhV+65UamYcamSMr1DQMyqtFLPizMKDwLRcB0DPRodsUfjmd3v5dYCioTSB8x7roP3nfCJ36jbLTv5eYE6UFp/QomGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk20JCNdq7tZ00XNMGhGxqTmvgCWt5nzBiAo9OXIz4g=;
 b=eohC9kvqk0bJdA6GzR9CjI7oeL5Cc/+3i3RNnOS4rNlNLLklYO84KcRz2VF0aGouHtEfIWhWA3nRGPto6ugb4kBLs3FMMUl2iHSYbyRG2hC9Y4LsLXz4uvqjG+myhV/P734CA0Abxpq8IrvX+BDA4FMZFXfMpCFsQGmrVNzFmChOhmeB3KtKfm+s9RIYw4wAEzYBNdaPbk/OwX25alDBc+MSuqxeXRknK/ybihzNbrFX9IvyP87xi+eHAOk7Fc/TaKdfz1u5UyI9Dc41H86mLFANY+n9Q7KA/iNuw9MQmzBSZjDG3V1x6uerrfeJAfXo+1s1Y4bdilUnuPFLxhFEEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 19:31:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 19:31:49 +0000
Date: Wed, 2 Apr 2025 15:31:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/9] arm64: dts: freescale: Add the GOcontroll
 Moduline Display baseboardy
Message-ID: <Z+2QnSKdz729L2dw@lizhi-Precision-Tower-5810>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-6-9f898838a864@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-initial_display-v4-6-9f898838a864@gocontroll.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ddf602-b7a3-40f9-da1a-08dd721d0320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FF0wTpmPYUpCDffaYZk/WG43fWu7SpMbxQEQcOpNnCLIF4zuJn+bAIGUjpsl?=
 =?us-ascii?Q?zykrmVSd73gOeIJdAPubIf7Y1mPY2xHjtRZSZyEVKLs2okTELAlJmyo0uTX2?=
 =?us-ascii?Q?6TRXN6bcjeYPxfV/FMOhUHXS+AgYdmENTC8r3kfaseKvBScUoLXW1dPqrd8J?=
 =?us-ascii?Q?1r4Gaudd6mTTUDcnv+Crb5lqDhdQ77OVd5Vlh8Vpk8FTg0Gb1Otfm0wgkPG9?=
 =?us-ascii?Q?+HCEsvkPNp29z8KS4MayEGa67E+pEm+EY1xp3byAG7KZ3Kq7hG4U1tjPGcg9?=
 =?us-ascii?Q?5J4gJ+kK22pu8pRD8gnUnXYbhotLntz6noQxlxlrDqdI8cNlfhlQVc+HkMDy?=
 =?us-ascii?Q?3/KfQCSsR3D4agZw3K/XtRysLZocnYgMz6ierv4JefqVIS+cwttLS5k7sulO?=
 =?us-ascii?Q?XaS2KXWtMctcq9jACuKVsRF4qyhS3hf4whv6c0tIbN7j28Y9XbsgFLSXca3R?=
 =?us-ascii?Q?3Kmw64PgH6GdNcMBdblXca65uTxfhRfJ2Xqwu40LkHdm77D9iQFIVEeGeVTo?=
 =?us-ascii?Q?wynHMRp+x+FbSLzZaOAQjbOlNrWWQwtYTzAj+vQvr5417WuvIwNAjMmXfJt5?=
 =?us-ascii?Q?peTPIlErFn8rcp/TLDZioqs79CbX1ZHR7sax8/fyD24RAGZRwWf//ayN/JGe?=
 =?us-ascii?Q?sNDVcz6+OOPSFS4HKMNDww2+3fdl3AzYwgh3dSxSdRpZ58U95zYCJMYGIemH?=
 =?us-ascii?Q?Rpeqn2yytgc22lxtjJMn6KYSgSxzNmR5PeWNOk+TJ9rtoyVaRqnPlKKRjFGB?=
 =?us-ascii?Q?eY2aWr9ScUC5Led5cHXEVNBFFXnfML0ERGtu2UCNzjLM6i8ibfpTfhmY/2/g?=
 =?us-ascii?Q?3botcmFNHfBG/uEBU5muuJcgZc5eUATrTHWiTrjSDKhbHC35GZ8qRyPsABzz?=
 =?us-ascii?Q?hwAcXN5Ht0PsfCWB7DPLrkkKPN6hustdQ3BONrgXWvim4NcAqyLYiPVrteEB?=
 =?us-ascii?Q?wMbePZ49tVA1MOX15qXWFD7EUdbW/RaanR9oNX+hlXqQgB3d+hSu2C0ocqrP?=
 =?us-ascii?Q?nXG5AR71dyTncMeUSrdXNNRhOygSkHTGr2FpBTJ4gpqsgltavJYA1kvrYzxU?=
 =?us-ascii?Q?/R3CEx9k4S8qPuczbnzOA7IxvhyDylt/m9+u1oqz7VyCbOl+V6xi0cRHg+fW?=
 =?us-ascii?Q?Z1taqZjz3ZiUFGZEX2JHdLP250SBbLXBOYudkORlqzHlrLe5nU9ZJiZ+HOND?=
 =?us-ascii?Q?PxLEcJULDidIPG5WY9VjCRgFcKkcjAO7IjsjqJBOmX7R13cNgus1XHoJicMN?=
 =?us-ascii?Q?ppstoUfZCev9bP3AUi4ioB2yNaDPS9fAga6LJuCzKIi7fSeXbadbH4+Rqo5S?=
 =?us-ascii?Q?SFG2QbcjGErrP01FeV/jsnk2Jn9mQxxDKooGANsrDB2aZsey9eFZ3f8YdYrX?=
 =?us-ascii?Q?4Q8Pt8ts5dTGwB8Nn0eS65cvEEaORHei6jmF9ePgkZRvbqSmTD6OOX1dxxoq?=
 =?us-ascii?Q?G3lnDk5pxrL3/jREIXXSoKGWWDjK3tH+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qurPL2dZjx2HNyE5XVP0ftMAOEjEE3JLAMFCdfTYimK4SB78gIYJCeNJ7Ks1?=
 =?us-ascii?Q?8g7852oPQY9OBO1WaEanQgaDew9VgnqBj1XA9D9y0x3Bo17ydjSxc5GSAiAn?=
 =?us-ascii?Q?Uf7uxNF9qmC7aguAe5inYkdZOF9r+r5TpwdmSeZwEGCtTsdEQhaeMaU3JECW?=
 =?us-ascii?Q?HjbuzmykasPw6B+0xxPnMRgXlWDqQCZIOqZNNcjr2A/RQdYljoR2l0knKZL9?=
 =?us-ascii?Q?W3PVV/k68j9mkZ0b85rOVvsY9UFX4epf+SweZFyekXNlTcT0QbZrLxcpmY/i?=
 =?us-ascii?Q?B3JnaNdwf27HBoM3CAiTNR6o1J63JvjK3VwG9dstEILUUoOw+e0kybqAlur1?=
 =?us-ascii?Q?0nnEDCX4TbbIqNzkPqrTIsCAY2/0HasgLRXhyWy1sSMGRqEEKjFUG0M77WxI?=
 =?us-ascii?Q?QC9JWryLG1rQx7P7xzdFqV1F6A2BHeHDeB+kr2gGaS04Z4tqoQJ+m5Zepw87?=
 =?us-ascii?Q?ABdmbvCzo4dnGH9eHGN+BbpYPx8045N8zlADGUJlTgBuy8sSHRZMi3kJ4yl7?=
 =?us-ascii?Q?QKKEcYSsaiVAJwo6uy5qCz/ywpg0OQr3/cFBPqslgA9Aphis59iD5JApZU6O?=
 =?us-ascii?Q?gDPnZifwwSmjFS0/xuYQD5BkrSnvoA9TtyJFKSVoyK1nF1HYd2Op3pCKCVvj?=
 =?us-ascii?Q?eG75nQwsQdX9TXeEVABlPYtr3BtGHKeMilBP19ytQcNoRd8gbfo08Eftq+Hc?=
 =?us-ascii?Q?CrK2C4XSoaC3bUaolFmdMu3Gr+7sVVbISLxsCNZMbO5cwP9etsOgREesXrKg?=
 =?us-ascii?Q?jFLz1Gtx7MX9VNwOYZDdYzvV16+3NJplMIg0VgLEcVc0HeBX0aMSOMRjv9Q1?=
 =?us-ascii?Q?t6FQqYMEFuGIoyQtRJNGVjvlHlAtDnsQFipw1KDm2pqEvwyrSD4SFVhn6nbc?=
 =?us-ascii?Q?FWWLWIKgzonpvTrMtLzk/lDGyWnNrVbQRPGKIzY66T9XiaHVWRpJlAXITx6S?=
 =?us-ascii?Q?cwGiM/YzmCvFuvxW+Ku+EyvyqpKKQ19jDUrK0SRynYQyMU/xsERJdGqWsYjv?=
 =?us-ascii?Q?dRmVQZe32TmZf6c2k6OdiyHumDG7V6pUhfS+VOAuVyNA5pO1cBnTpd4f18F6?=
 =?us-ascii?Q?KEg9Q8oKtnD2w6gy8uq7UKV2MKiRv54JjyPRzhDbQAVjYiSxodY7lVohGOze?=
 =?us-ascii?Q?33Pb6d5fHgWEafeleb/l78QAE53vXxykaYtc5v7ixPuHnR0zSSDtaX12xRWA?=
 =?us-ascii?Q?Mncgeu4iQXv+T5+arLmZSh/ntSvuLO1nIlk4iENm6495Dg3yFPpnveh38mpB?=
 =?us-ascii?Q?doje7G4/1eCVXpqlyanWACYQYBHUlNWgpnhhZYj5XYOjxFpC/1a7Em9JyB+a?=
 =?us-ascii?Q?jKH+Q8212HgOrwKTrbC+OXI+SjexBPbSSqRf+YhV7/Z3R3qo1P9FyOP5w4Vu?=
 =?us-ascii?Q?ILG00JYziAzkLTtQEC6cRBedwkmLvqtzkmuzd9yJn3g0bvXaiC+DP9aCcbg/?=
 =?us-ascii?Q?00YWRit/XnK7JAhPFY6zHWFQ2+OGdXJ0PMDFqZXRS8fNPZNngwd7bIsguBd4?=
 =?us-ascii?Q?aUCe9xTaXW0QVw3oA3cyp0v0DxTMsWJX1hQFsVa4GcbqpVv7Lead9KIob4TZ?=
 =?us-ascii?Q?fW88hK3l0QSVYR5czYAWPUC8wEoqKQC9vWkXfDLw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ddf602-b7a3-40f9-da1a-08dd721d0320
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:31:49.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6byeAu4Ap6Dxlg4yC4jTrpExG2w4t55cBdPA2rGkXrClI9rNFiouWWOcugAqqq2futcmSOSzZl4yyaKW79hTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599

On Wed, Apr 02, 2025 at 09:07:09AM +0200, Maud Spierings via B4 Relay wrote:
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
> index 0000000000000000000000000000000000000000..4649b5f1b64d733380a5eb027812da65d3df61ac
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
> +	cs-gpios = <
> +		&gpio2 12 GPIO_ACTIVE_LOW
> +		&gpio1 11 GPIO_ACTIVE_LOW
> +		&gpio1 10 GPIO_ACTIVE_LOW
> +	>;

generally,
	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>,
		   <&gpio1 11 GPIO_ACTIVE_LOW>,
		   <&gpio1 10 GPIO_ACTIVE_LOW>;

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
> +		aic32x4-gpio-func = <
> +			0xff
> +			0xff
> +			0xff
> +			0xff
> +			0xff
> +		>;

is it possible put it into oneline?

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
> +		MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI
> +		MX8MP_DSE_X4
> +		MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO
> +		(MX8MP_DSE_X4 | MX8MP_HYS_SCHMITT)
> +		MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK
> +		MX8MP_DSE_X4
> +		MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12
> +		MX8MP_DSE_X1
> +		MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11
> +		MX8MP_DSE_X1
> +		MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10
> +		MX8MP_DSE_X1

keep use same indentation.

Frank
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
> +&usb3_phy0 {
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
