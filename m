Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2073.outbound.protection.outlook.com [40.107.247.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1711D5166;
	Thu, 10 Apr 2025 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296570; cv=fail; b=iW7V+NImhFpB7RdeWiyiTMMyh+btRfxDICY1esbtzLjN3p+OoDMQqSnZqY7MGS11cI5nx0mx+Gx+JvR9W1vTTUY5p1FUQWDVnmPWdOhYMiXUEGlpieCxrZDWOBmpQ+tg1nKxa/qy4eNINrI+Z2ThXwh19vNYqAEGUM0nOwnm/uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296570; c=relaxed/simple;
	bh=k4gLku8JOwbwihoZfbfEiN5CEObhHdnUn52NdyR51I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tcd91j1F/+HDHOKgbPZY3nCjR53eaJtnlbvEvt6C9V0Cbkb6bRxSoyVD0rAtEuA2s9MAxgAEIULhEIEhrSoUOiYPiB0L95Ti/gFko+sVW0ozlNSQzrHMGD3HaCMVTc9U5Q04QDaA+wuoLeLXUxRcOV/KyjgJJ/fKxnFvzt81pLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m6ddbB6w; arc=fail smtp.client-ip=40.107.247.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m6ddbB6w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qplqzgkQXy7C1nlR6q2WkjlTPg3S5qw5tfP36+vvicSM5okV77kSPZG3bgUQBxRFeZYEi6XyOqtev25ZD2lOTOIXu9n1RM9Ydz1wlToizgZky9vk/JZmxgsQbo1bXfL0vqXFgZEp/K/n2TGq+vqInRLKT1sZeQgaaigmbkrvlQahPDWYLFXNTiuN8SWf8R4UraaWr0Reaap174VzrrRgZF+Cz5ACf5omO0NTYeiCjRVYbvBjS/1uzEhXc7i0nrwS3HGLn1q5TpRZNeoCW5VqS4psKHqFBN+av9rW+fj3KdmyyeDbkb3tdYgRdwrk46ApG/5h8J1tz7bPcQ+RvfrLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XqWDri4TTaMeD/D+sHa9cY43piPw+4PMJH2wpXQP9c=;
 b=k2HFXvfd5odVsFyGr74sEAqE+ebsIseMcPHVvebk3qabuAkeBfb4T+I4zGgcAZQ2wXgS71H4Du7sxT+6u6SxYoE+qND7dJvHiznAiUcZwDtjiqSrFXZfsyVs5Y99cU+ZZPYcauvaiHURF/h81JUspcEIyoApcfRQ/FMell/s6IyY6IYkTNxTQRm6Gxtagu8e3UZWosV+0BBFRQAnFzke8I7zBRTLg5fvvr8q2QwCpQFIf3fgKvwhpk9FzSHJwMVsjEwJySzRnqUuoj9BBFUy4Xd2l0eGvVwN42Jj5VDDPX/QHhwX8uXI9wA/GV7aocR1zl+71Ggi+/SWoi9dfLcFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XqWDri4TTaMeD/D+sHa9cY43piPw+4PMJH2wpXQP9c=;
 b=m6ddbB6wviegcB3tHVA5+0dOIlziUkcJp0GIvG0L27pczy0hCkN2srGo7NFAyeEmdu6OzumrnCiA2Gx08bj7B8a8evG0DUE/KbiTxFBZMy54/xaT9cLslTgIHGqDhdNfkREISuOPbHzAzeG8PnQmHK42pLaO52ea13AcH715jfAR4EiOzOMzkOb1vWGg1BQZktUiMBZGz2RNfztN1yy+nyZGxBx97lmYYDE4nU5jDc9y+HBuNyU/4i9gpmxbETXyi91CT1oVisTpkqQETg8CScg+BQZ9e7dm7yQOuZDWJe6F+v+iVugz5Gtl0VdfSM18594iq8S5lIHin5bxy2Nzfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10830.eurprd04.prod.outlook.com (2603:10a6:800:260::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Thu, 10 Apr
 2025 14:49:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:49:25 +0000
Date: Thu, 10 Apr 2025 10:49:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 03/13] arm64: dts: freescale: imx93-phycore-som: Disable
 LED pull-up
Message-ID: <Z/fabrdNCCEMnlKQ@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-4-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-4-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8PR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:510:2da::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: a4915f99-75fe-415e-b990-08dd783ee317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5YUJ8dn/z2GVCfINtoVx4OuYREnGE9WCUSYKObspvM4Rtgza57mPtRrU2X4G?=
 =?us-ascii?Q?ioWbp1j/6y3xioDa33EdtSa/zkwR63JzD7TxuatkPJbB2Eo6FVMVkG1juhmV?=
 =?us-ascii?Q?1kOzaADmzcdSz5+hPpehwwPmLiAt221GTujL5Oc3gM3eLV22CBkRhkNYsP9V?=
 =?us-ascii?Q?RG9iG7mtrYr8NmJzdgB/59h1NeGvXIXYpTLD3qRuXDE2y4Znay46IPKTtD1u?=
 =?us-ascii?Q?v7R8NKZTFsX01q7W44UtbLg2vX3Ur2GCiu0QC92zpfN1ZPYYMnBYeORHTiCv?=
 =?us-ascii?Q?iQeRcLG0yid34MxNlCBCHCEz42SIkSOQPXuGrW3oOkCk1Z/pzvVKQXvS8YL3?=
 =?us-ascii?Q?MMTseobbU2S7bosbNeq1ovgDZUsrQSqsM2PlwUWeEiqfk+otN+gEvM4mMVHp?=
 =?us-ascii?Q?ZIeJC5FTOVWjDyVvnjfeb+NVTiOD86MBfgKV5T1eYoKNw+ViUbsgNlH7cOP5?=
 =?us-ascii?Q?TXN1kneyiuh9e77ikr8on9m/sDtDas8S+Uzgt0Py9LLVkoXJcEVAZq1DynsG?=
 =?us-ascii?Q?ZqdNIzN8OK6FZJ6VkHbNSeY0r9VHGT/U9IutdXdNs0XnTB5mNyAROqeGBkm+?=
 =?us-ascii?Q?FKHGcW1dhI2XPTBRUmIlRHJ3xffigZaj/6Sz0ScimrvTkaB8Gx4aGOZCuqEg?=
 =?us-ascii?Q?m9wKZAhrYibFIsyaK6HGMi4bWeLqS7mDUCFxODDoq6jNtntO9SMPybkSP3Q9?=
 =?us-ascii?Q?+6pY4xqJIgojJY6STNN7GVH/9RrNeJ2THOInjM9KNfkPn0BhB/PevwCZHGbo?=
 =?us-ascii?Q?cgAI4rsm7AXPQfauaxkWYkeCWz7D8RSoLDYlc6oX0cY+zZ14w7I58+858Er2?=
 =?us-ascii?Q?WVbNDC3lxhU8MaBSeIpV1MNbCzn6oRCIgcCIAg/3BGwSMZ8MeZkA5ZkF/U1Y?=
 =?us-ascii?Q?dAjbAd52tzZfB2ptaY+AH9Cq4bfW/7F9zFlOTklvmnGkK5yABRoc8EyMMI9B?=
 =?us-ascii?Q?8KuFMRdtD0sTCb1yONw4p+35YZCNytw9N8DVUNL9Wxfge8mbGesDYMy36vzN?=
 =?us-ascii?Q?H9KRxTalpD8VvwK0M7zxhC7K++nFcDtGtil4+awKTYtZPIH8ghvJkTFj1N3Q?=
 =?us-ascii?Q?+KP3OLOiNRxTvrV1/NWTGrbc5whvG25lfBzsEPlBHLn/KIww6En/44BEn99v?=
 =?us-ascii?Q?4mWsFdpsKHA7diEV23mzXHewraNzbuAlQwxXBF3v1r1apDCT9IQvllLlYQO3?=
 =?us-ascii?Q?SUAwETKXIZvZ7IppYVN8UIjWXHiKPqLPvtNzKqfVLXPvzh202jC+BC14ldph?=
 =?us-ascii?Q?Ddr0TQEbFU2LCEKMXf0LI+QBRh+4XAGFFMpFITwnrZIqYy/ckMtLjUNB5AiO?=
 =?us-ascii?Q?tyYMirrq8vILDsN2/M+WXkDD/N/bRYgCvvKQqixSdH/Dk6gi2SEcQh4+1PtY?=
 =?us-ascii?Q?28OsZjlz7VqdwfWIwjC4ingIiiNdvBxikukJz5UNIoKXjFzV66XjPL7iokHL?=
 =?us-ascii?Q?VvnUuiU5DkrkiT4t2frRUwNuu9QljqzF8ybE4Xq65fEwrd5B4teW+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ZWyqZOoTizCLNWcV3D5v11TxwpkQGyhgtn59cJNTfR6GeKUSBpS1pLUXqcs?=
 =?us-ascii?Q?SgxVO43kRzVqEHM8n61k9Nj3hgdqkWByQRXowNFjm9tQZE1Ob+EZ3BIWyhz7?=
 =?us-ascii?Q?xPzcM73ZsjPzKf8QP7ZR9e/5LTbFN9gCZwh9CoJYvbnSCR0dpkisjIALUdCt?=
 =?us-ascii?Q?sRS5yBtEE8IvvhxdusuopibOr3Fm5VJL7mLeCWfJFaMdPk3Q7XJMJ2PvHqiJ?=
 =?us-ascii?Q?qQ8TpFgS3gOxKrSU+hTXXHSGnUCAx9LYLSDZb8poUmPg4HNRQcQ47ES51cIh?=
 =?us-ascii?Q?tyrs54QgfTnb7xWNgxzRXOrpZk1NeMZ5LHMtTjCVlp4of1PiPmf83Di4lWTh?=
 =?us-ascii?Q?ZMXYHaASSvXVqDxhUejhvzTuWj03M1Ot/xqdYJ28wWEOvAAEP2gSVTrDqsB/?=
 =?us-ascii?Q?I5WT7GQlNzrktvaNsRRtCPfb6Q5eDHoI9ykhaMl/vu7VmQE4dTmtDK4Rz1wJ?=
 =?us-ascii?Q?81TKxl6LKw1CTZoReHgaHmhWXCqFmdvehdSgmTRZK/vfs0WZf+BJDUe3tpbp?=
 =?us-ascii?Q?8C4s7JTRYANiwEELEZ9gl9ZV5AhoRpj3kUY1Pag+AE6cbLi4QI+Z+ngeFss3?=
 =?us-ascii?Q?CiyF0e7VtWZfanjTzthCYTK1DWDk1aN5iveUil82ljslpt4HU1rHVEfCjNtW?=
 =?us-ascii?Q?RrckxWc6ybqSfl5PJgfrRaVuVm/os5ge5Qzqahyy7XGX8Xt/AtWXpDunp9pI?=
 =?us-ascii?Q?jCoVX11VaIjT8rR6FQtZuzFfW13QFoPlqJmztg2Rbt6RUF0NOq5loQ9KykXr?=
 =?us-ascii?Q?nLztOF15DjoVhoABiMPd2ZnLtdW1ULGqSO8/5RCPcHke+2BzVTthy4GN+LH/?=
 =?us-ascii?Q?Z//P1QYRedzbpKCWnlJMkAadfI7MztD12zxZEZubG22gVxW/l09mNSDifXPR?=
 =?us-ascii?Q?bWUP5mdjVptKsilTSgbX9LnDYFhh7nfi9DfIegEP296pbQuohnE4XP2vOduK?=
 =?us-ascii?Q?0fNn0JKD+o4EVONMzxSehCEViAOj7TcCdkRCJJZZ9y2LDlt+qfmPBhzla0Bs?=
 =?us-ascii?Q?xOHxm2LKfUy/wDhNBD7DeQT6YHFFoW2VZ4T5FQROA9EbZd3DFixPNCguWyfl?=
 =?us-ascii?Q?4pG1JRo8iATIfgrh9hiHqwLNqgVdtcfa2y8ESTGZ5gPlVVXAekwL+ThRCmWp?=
 =?us-ascii?Q?JvOSiKrdl+SN6f3dHOLQASbqZpoWJpLTFIojtxE3eMpatPlZbmyaWzk0qeEG?=
 =?us-ascii?Q?8hDVvCuh5NUvYSOZP53h7FFGEZ4SWFDy+Ae2wmTZ+M89GsScmgFW7DxLAna8?=
 =?us-ascii?Q?KzZrFsOz9jvpyps9Mt+AvkBnLyy9TMcmBYTcEF4S0N7lEyGK+6LbIjEZWGhz?=
 =?us-ascii?Q?pVogiyWCoam9oF/72De3+cnY0yVVuU3AcndLcILiomfa6ia+k6ga8gv89V/y?=
 =?us-ascii?Q?xckHfHcSUR/iBm9OPG3mInMu54EfR2kx/8g7Im1nQcQJQS1uNV1Km4m7Q3A9?=
 =?us-ascii?Q?wTQ7JAAHgnEj/o8e0ouHQiKQp60f+Y3sRjAKtwgBN62T/QiA/eRbQtFvp3gF?=
 =?us-ascii?Q?8CXiZCTNuvS8a2UgeHzXtbxj8WcxvgCuzTlTO3C/fAA7k8uzSnbjWViw6K0+?=
 =?us-ascii?Q?Nd+j0P0u7Q7dZqm/V6nD9rV7Hml3zF/xEVUgVoYs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4915f99-75fe-415e-b990-08dd783ee317
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:49:25.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWNNpyWzAQY8rfLIzxs+K7FeGeazMNzTPtXxUEYXnMmQdYEtsU8lAEor+go3CAEIdbcLwH72p9KHxkaBHDXx/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10830

On Thu, Apr 10, 2025 at 11:02:41AM +0200, Primoz Fiser wrote:
> There is already an external pull-down resistor on the LED output line.
> It makes no sense to have both pull-down and pull-up resistors enabled
> at the same time. Thus disable the internal pull-down.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 442ee067a047..82f680d891c2 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -196,7 +196,7 @@ MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
>
>  	pinctrl_leds: ledsgrp {
>  		fsl,pins = <
> -			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x31e
> +			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x11e
>  		>;
>  	};
>
> --
> 2.34.1
>
