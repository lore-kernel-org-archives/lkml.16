Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352F237194;
	Tue, 10 Jun 2025 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568831; cv=fail; b=oHLaUel9Z/wLHAap+Pvf5qcfbgB8o4RdgPuGqaqVRVO0sdzSvUNJIR/nHNJd7rX9w05YTK+/Ab+MXfMw8WlGf3OzMwawZf9d+8hA9P4Nd9p25Q+ISkFuTeXQs8dRIDB9SEgy5g/WTGMOkFEK3Yfz+00QSQBeyLr+GjCXhgbWBxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568831; c=relaxed/simple;
	bh=wKXpRJaJuBgohKPUXijylEmpu/7jol2aTbYeoffcyKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EkXEa9tzkJnYnw6ABnRSHXjb+VjpoRzHCl9+KOaTWxEBg2p5uqv+DMao8nVI6OMFzQSEBGNPlAX+jS4uAJNO1Q3s9rvcrg0IwuMJ+TRenCP3wm8USY1SJozW3APYu7CWY9d2RSQET+CKXU6f4SoooMw1xsnfNczy/F9O81tSUoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lOD5F45m; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lOD5F45m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmELbXwP1bL+i64xXFR2n+wgk+uR/rOvduGWRBzXuTi8t2pr/ivsP+GoJ16V66l0bbtDOV6/fbSEGgIsCJ3Hk6qs6gml/+XFK5QD9afGHjzAvqKqHVDa8+DwkQFPzxqKWipN2LNEX7kFf4S+ukX3szyGaw6CQ/wB4f6Elvc60MCCU3k5SBsI530g0qmbAnXL9zJgVePdTuNitRohTuyhdPQzC/EYhR56whQxzpPJY2+eo9ndufgjFnVskFSbtQ9jcyQBDQ2XDFb6zj3igOk9s12DK4w2yGZb5RHndY5N+CNhhs6pPRbNqKg4wb9Briv4gmzZs4/hiu+fcFBzoLMiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWikEzmwrqgR1hFfJnjuG4qHsGCF6zlS35eYiBJqOIQ=;
 b=i7Rrie06neCSXzk4HWsx0x9faydORuRwidl/c4hAgfFVepfnaenlRjnNGvhH60GqfGH8eVcfoSV4JRlr6PHW0UdPdfsBXE/MVUHbo1B5ESxMni9gthzDGxjlU2G3sp49TbqfQbK2LSuQ/gxAn0EqONapyRXVvWbTRfgYsPCcwjLkKwcy9hlzDnqIU++eGqG6Q0U2RqsA+wR1QFvTI9gf7tb7l6Ux4o1KzBzdPICu1e3llANv2RkYAbOtqK6QnuRn+/TMiPc8z0pbv3zizwbn/tRZdLzgwxIqIBRXrirSgao3Yq0Cux3q7hk57VxnvTgY+9E8v95Ga+vqueT/b4vUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWikEzmwrqgR1hFfJnjuG4qHsGCF6zlS35eYiBJqOIQ=;
 b=lOD5F45m+pxkxARwOL+9nYUtkmioJAW5en7mFxU8IMcCbETumwfTwZjbAZhU2fOI7Z7aFFeTpqkwlTgoDxdk8D6o1pROsURqYZcVMBaq72qqHxy4UxQ5A5N8tTmoSazwPAQdh8QyvtacO42ZxR6UdJhHo+Eydq4hyPUoR9J8fB1OM0xiD5xyNMrbUbkgtzMkySwj2By/Ji+ZmQ+tANKWp535KsE+wE0+UHzMX99AXcmN0xPXu0Day2tUUs1eFiZTMZO8qHUapk0iWdA1E3aeMRrSQRnkEeqqP53SOAKbvvMJzwx175FPg4HfShhXGfGG9IMRWHyzv6KRRT+dNKLKIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Tue, 10 Jun
 2025 15:20:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:20:25 +0000
Date: Tue, 10 Jun 2025 11:20:17 -0400
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
Subject: Re: [PATCH v3 07/10] ARM: dts: imx6ul: support Engicam MicroGEA RMM
 board
Message-ID: <aEhNMeXk1IHKhSsM@lizhi-Precision-Tower-5810>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
 <20250610100139.2476555-8-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610100139.2476555-8-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 819979d7-b528-41f6-5879-08dda83252ff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Y0rO8pva/EewB/KbeT1XOVME4memnPwn44VY5mSZfXByNIyxFAdjidW349/z?=
 =?us-ascii?Q?qq88r9B6thZw1H4uFj+4FG6uqtZ4ZMy3wdeAKYBMjOxOmKxgaXBNNS7egGUu?=
 =?us-ascii?Q?TqOwa5WMe9Ohwm0MqRtlfOcnOfp4RxbvIat2X+a4ZVgyhdo8Ho5pH0NQ8E6O?=
 =?us-ascii?Q?OapHwi1QLxsVqbjQEo57reiHgcJSsfNsmATXGwDdLxNFFHQ79EOYKWt6zpVY?=
 =?us-ascii?Q?lNckCfPsqZpfExchVU7qLr6ZLeRADHY2eXKb+Lpn/0TbQsVOH/cKBAQeQGwA?=
 =?us-ascii?Q?MLPtHtkgPpr+FFrvOI3SJNwI4T+CP3rNOBoqee8Nb82VySqCe72R1BU3eEU9?=
 =?us-ascii?Q?VXF1s6ONhcDftiBjddOOVY3vVvj7Y7V7OXrMx4qV01FoMc9RoxOcZmZjNJBg?=
 =?us-ascii?Q?RrsXVF8/gHZhb7pa+uVIy5XxFqiYcNUJJehiOyuIaHlEyLgf2klFP+fZiqkf?=
 =?us-ascii?Q?smzD6eMFJkxLA5tXMVFjHgwVYFfdKQ9w2Zd10LQcqPHy2WS24s95T6k+trMr?=
 =?us-ascii?Q?n34E9Gi88byfAJNDr2lqpZdKtOiifrEKH1zPjXxbDJ5+FdGosYzD3ev4ICwx?=
 =?us-ascii?Q?+i7K+y95pxqLariKEznhY6XmRbLpB1579/vDSb9a057KPxUr/AQrZ/PxW1cm?=
 =?us-ascii?Q?U6jKfKLAWUVfxHZ7cw1uVli5xCRyBk4QfDku7WVsOqo+Nouu+QyvgMgSrYOQ?=
 =?us-ascii?Q?9K7hxnxMJgvw2yIq2kn+PcwEczdf944HNFMd+sHYAodLeal2ewILCTkXhXui?=
 =?us-ascii?Q?eis1TLokdivRIWvigFGHXkTrBBhDegWuE/WwkPitvz6AkpO1zJF9xWpuab64?=
 =?us-ascii?Q?5vHM5ZRubzwR835eg7WHNGW7lLc1Ur9m3S8KtK8ntYCpuf3wOcvg6YBwquV5?=
 =?us-ascii?Q?Xd3DxNzN98+mUU8f68FkpzCzxcsP242zBDA5UyTXOjOCIupk2PWcL+zoUnXk?=
 =?us-ascii?Q?awDv2JKwpDywla5mqhVz/hRU9T1u04bscl+mpQb6MBTKjALFNKAUb6Jt7TNm?=
 =?us-ascii?Q?ii66wVZJpyTaSB2n7T8pqRVyMwpUhF1y3OQL10ON7N7DZhOWk/niJXhyIHXQ?=
 =?us-ascii?Q?hvqrPicf3JDtChOQ7Fe3SIUcf9HU3gZDuGRnsq8MyHDmuoNGa7tl958i1I9Z?=
 =?us-ascii?Q?dTY2yNbp2dronjc7lQhJH56fG+Hj+7HH5CX/mFwjYxMRQzNlQTpMIVPCw2dW?=
 =?us-ascii?Q?TqaW/Iesuwp9KfQR9morLtBAjDtcfR5W0n0c6QIQopAugNbVpgFwoqdgYpwp?=
 =?us-ascii?Q?WjyU1sU9qmnptwtovi/Wk5fxWwH+xxDptirbcQNADS38XeE01CHdvYcvLQ3m?=
 =?us-ascii?Q?9PhmT76s1srYlzEPEWKv63JOhXxT6jYX7IL6Ng2WjCOrSr4GdlJFLOLhZUod?=
 =?us-ascii?Q?IXwQn3uKnscJMQSsxTq8ZdyFsMaMB8MkwjKBVT3/HJwP8uGuCHrfCY9WW8cj?=
 =?us-ascii?Q?UQ5UBj295TEiwhYrMq/KyvHn65glGRaGlNJta8rX78WKP7spFB9Mxg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?GZZhM7xIAtQ4PY0/Yl+D3cCoLE9cANAo1J8uKvhKsdh5+8YXTaRUrHvRYFqd?=
 =?us-ascii?Q?8u72jupzO62j24duMrcBFwU515vYNj+9iVnS5/vZgpGanXbE0FfPcx18ljZE?=
 =?us-ascii?Q?ydFD+uUJmM8h8yCiswPCiL2HCkyOtvzGP7ciqEg0B8WKL9mmvgBqXEX2FY6f?=
 =?us-ascii?Q?vxs15+Jz2hQHgPiwSvv99bhP4SjhiM4DOlASDrRDd7q85hV/Mc5/B7ee42ZU?=
 =?us-ascii?Q?cEp6ZcaQDsF0ylMicBxTEilEDrFiGqWKZQjDZjL3jm8uCOpFIS3X7A2Ua9+a?=
 =?us-ascii?Q?c9MXFn0hgSkOWQOTTZZsnNaaI9A9r2jDK5BeMlzGtG1I+1vmnFPzzBdokTQb?=
 =?us-ascii?Q?JzP9EQZxBrEW7tUXjScirrhx9alaDmXJ2IaIjben8UWyfZfDcnJm1QftPrOV?=
 =?us-ascii?Q?rRg4aPuWehW/ts98nlB2wttmqkpyX3PX7wL3yzvAI/9cfo3eUgwqm/WRbCAY?=
 =?us-ascii?Q?lOxnnBXDA0BPkpOIMlJgN6hcvV8RS++dR9QAE9hLVztaAH8ekMhl9mLEeq7a?=
 =?us-ascii?Q?SpauDk+v+kfOgbNTQliKUGEIyWE9L9l6YuQyS2lBO2LX/qZmCsFA7ryH4Ph1?=
 =?us-ascii?Q?y6938dTFXf+RlWbjZ53tVg45juYnL70fUYSRxX+1esmJqNjK2MWO755vpVh6?=
 =?us-ascii?Q?3jzkrBqC8QfhgByWWdWU6ZOq/BXfoNVV5cYN/DmFLHGxhtDTpIH8FwTVD8Qp?=
 =?us-ascii?Q?wslWluc9p6BfYd5eCdeZ0FenkZxfC6Lr6jwUBqc5I9gyVxRBG5prV73QRoR8?=
 =?us-ascii?Q?6UBoYrobYY2i4fcK8I2yn/gAxkSTjztPsdRylPhS8ieyDvFplsds5DBQKDGw?=
 =?us-ascii?Q?i7G8MiNk5EagAYNxWh2XjXPEBtxhSpoRyWmSxNGF5TF/JL++Dhch8jxkVmdg?=
 =?us-ascii?Q?pBpcfUxjjM1sdAKLuYoxhOBkARNdBMLlPwMuZJnDr8wLI6WX7T2nt9IDMoum?=
 =?us-ascii?Q?ryEtdXzlStlnl2c3BzJm8nzBYjXYMzdVwvOKCDgoxy4dqnomKJJGKrzmLNDK?=
 =?us-ascii?Q?3CgGHecX3wFkBU81O6eTiqvEknjPvcC5zTZjQ91WHXlMzzzF5eHfIfqKsy4K?=
 =?us-ascii?Q?UCUUp0H64qlJJxP0F2Be1FOjelBJZPR8tKPGZ2QDfpwn7z1nD9pxelz6vBKN?=
 =?us-ascii?Q?emzcUQX8nS8+VNoHQSMZ+QikGqgGmQomNNUchp2qwIBTuoximUKU5pwq5HLE?=
 =?us-ascii?Q?oVenK9qf7paAchzduY9qFH7r1bz23OPvPaw3Ls7KBFq9G7cZUB/OG+U+WbG/?=
 =?us-ascii?Q?q1JC7j0xX6cD6xrYRTpBMQZCp59EwN3diBJ6f2D3XFI6LAWFWwbUPyVBQ0g7?=
 =?us-ascii?Q?zGr3zAqHAQQqEPIeWecg3XXOwkKNqgzEXnEg+NW/f+ahZ5wRoHnL/OXKVIxx?=
 =?us-ascii?Q?7fpAcn7+O+bliQ6iB4ZQDd9scp4aQBTPeM40x3R+skWAzkvQOW3Okq7N+uWn?=
 =?us-ascii?Q?fgAqdMqrPDIG5lkkcjiD8sBgwy4Fyj7sKW89iUSS2XufXA1sdy0z2wxwaQEE?=
 =?us-ascii?Q?EwCa7LcT5Koy667jGIGCNJ7Vzmgbj4BWcoRd4/66qqZPELmKzNb84Ncp6T2N?=
 =?us-ascii?Q?xFFcK449K4nXGJjzDZY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819979d7-b528-41f6-5879-08dda83252ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:20:25.3841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHTux+JcxMZg43a8qQehJRB6BW1xFSIiWPARInf9LZgCvweRDKIAq6ZfN/CzvGdn2TXO5bc/Up/6ciF7jf/Mug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9452

On Tue, Jun 10, 2025 at 12:00:20PM +0200, Dario Binacchi wrote:
> Support Engicam MicroGEA RMM board with:
>
> - 256 Mbytes NAND Flash
> - 512 Mbytes DRAM DDR2
> - CAN
> - LEDs
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
> - Add Reviewed-by tag of Peng Fan
>
>  arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
>  .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 360 ++++++++++++++++++
>  2 files changed, 361 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 57f185198217..32dfd69b8d8b 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -357,6 +357,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-dhcom-picoitx.dtb \
>  	imx6ull-dhcor-maveo-box.dtb \
>  	imx6ull-engicam-microgea-bmm.dtb \
> +	imx6ull-engicam-microgea-rmm.dtb \
>  	imx6ull-jozacp.dtb \
>  	imx6ull-kontron-bl.dtb \
>  	imx6ull-myir-mys-6ulx-eval.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
> new file mode 100644
> index 000000000000..5d1cc8a1f555
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
> @@ -0,0 +1,360 @@
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
> +	compatible = "engicam,microgea-imx6ull-rmm",
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
> +		simple-audio-card,name = "imx6ull-microgea-rmm-sgtl5000";
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
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_leds>;
> +
> +		led-0 {
> +			gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			status = "okay";
> +		};
> +
> +		led-1 {
> +			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			status = "okay";
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
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	touchscreen: touchscreen@38 {
> +		compatible ="edt,edt-ft5306";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
> +		report-rate-hz = <6>;
> +		/* settings valid only for Hycon touchscreen */
> +		touchscreen-size-x = <1280>;
> +		touchscreen-size-y = <800>;
> +	};
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
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb1_vbus>;
> +	disable-over-current;
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb2_vbus>;
> +	disable-over-current;
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
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> +			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO00__I2C2_SCL		0x4001b8b0
> +			MX6UL_PAD_GPIO1_IO01__I2C2_SDA		0x4001b8b0
> +		>;
> +	};
> +
> +	pinctrl_leds: ledsgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_ENET2_RX_EN__GPIO2_IO10	0x130b0
> +			MX6UL_PAD_ENET2_TX_DATA0__GPIO2_IO11	0x130b0
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
> +			MX6UL_PAD_ENET1_RX_ER__PWM8_OUT		0x110b0
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
> +	pinctrl_touchscreen: touchgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_ENET2_TX_CLK__GPIO2_IO14	0x17059
> +			MX6UL_PAD_ENET2_RX_DATA0__GPIO2_IO08	0x17059
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
> +	pinctrl_uart4: uart4grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x0b0b0
> +			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x0b0b0
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
