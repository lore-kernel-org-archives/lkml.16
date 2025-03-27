Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BB1481C4;
	Thu, 27 Mar 2025 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087769; cv=fail; b=NnEw0WIXnjLiJ1lISb6hDTtFC21GBgLx+cmMpJiE0eREHwCctT7Bq8WOUG97wu+632d3uLazmuD9PemFp2Iu2RtrlgZf7yIrPjRajZ4TLVpqkhKtGGLU81wPm7cWjHkkE2DAC+9/PG3/IPdRfeBs+IrgAWzw6m0LgoZKicYEaGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087769; c=relaxed/simple;
	bh=uk3YDZqn0bmN7yM3PycvKrASLJwz4NnHC4D+nWLbVsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UqzgisJEeM+fE+gAbl4WRTmksxDfi3Q0aPSZIOy7I0CpafyLNLrcxGWpZnsDIjEG7qO0jUXcN68kLngOZZB1sUbwWvgfUNcyU3pov/CBpZiykQRfueXSO7wwMCQ7d+SesC508WFm4e1r7zWONGEtMx/qvTuhNv4f82/B0M7NkH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iHoq+SIc; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iHoq+SIc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZcryus+KfLefkprki9CGdn922SW7HSix9VXfdzSmzumpQ64gfVfZd2l2aWnHg+1VBloUonEWbHlAIN33vNU2BtU4cx5553nPx9elXc4DFJj3V/EaU97GWvzXcalLle/I/Hl3ISt6t8p0tDgibxOxMPml70Q2rU2YHGghITe/9iKQsPrBaSHgY2BNDm4r+qJ5+cQxAzVrEvEPLWuR4FXRNvFbZOVu7CM6PeQdnN1OMr9N0jGwzte7ZzRp0xbGIfhSuG3MNLmhCp9W7F4s57bLI/wcAC6hqQonauDI1/WghsECvLHuiFcv1qawKL4FCvn3Yp/Q4vlmoTMoO54niD2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g3oe3yXXKzhICfOIMNmQuHz2bFDI2b/+aExE9/4v4A=;
 b=GiJYO71Inhd2ZFsIDZIfmIPCFk6HVT3Zd0v4svgMMXUOi8H5n5YBQAYAu09WA628Axv1vZseWyvF6grsGfP98BniAcSKXiTdGWwkAZIB9csttZK3NVpmGLbEwlDVorjO9KWTqCiSJHXnaoRkame5pFjki3YNMPT3anFnlilrn/3aP0CJOUedMUECx7tU9I8HQ40p1xS+tmWsVMFYfwE5PREedjAmZbvaEJkh2GoSUNisoa9BHzOAdKmPxVS/bUNxSU9ZzmzYafUx50bQIFeaXaBmyoJJ9W75n11iDDYvOyjmpA56PzTqqvESH2iA7BYGlwTuFl8TUMehJhPpi9Gmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4g3oe3yXXKzhICfOIMNmQuHz2bFDI2b/+aExE9/4v4A=;
 b=iHoq+SIcypJRKyW+xba1+HTKv3/Yoq2LtQaXQWOP9mHauONFVdHEI6khosqWvU2Zj1cLP7qr9iys0bGBLjxdGXqYiOGaMFSShbNSxkHll2yWzOQUe6gfnfQVZ65NldVDZPQ8NkCj1gLigok4IKH+IEU3DDiuc8w5JRxEE5gfKYXG9rhSi7BLsCIxAHFiJT1K4b1bqQWly+zv+bY1AttvlWUOl08ugIN0eusekFz0nFFRGBLS22IdWMD8x4igaNIjgacYFPbLukH5V7+pJK73DMyfMCsQItGav969h+EhyH4sNtP0oaUlFqXPCKF3MMd+mJqiH6JD2WVRE+A3/eYGeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:02:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 15:02:44 +0000
Date: Thu, 27 Mar 2025 11:02:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for
 CDTech FC21 RGB display
Message-ID: <Z+VojbGBQ29j5H/o@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-6-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-6-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 726c59eb-f760-4550-89a4-08dd6d406d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ePEX06M70UUQ3q6sdbCCxcOHLmGupPTEhmoGS8YMyXqgTqMCNrLBNH2fbDD0?=
 =?us-ascii?Q?bxd4JCV0iEripTG7VrB7IMHJFJsC1tPTOqwUCc1m29vHK79OcxQ/6F9yOpJ/?=
 =?us-ascii?Q?8OmQtRP8MxHYXofqp3euooclYopT0dc4WJbL7NeD0oZu81Yd46Clc57Bxqcg?=
 =?us-ascii?Q?Avz4Mf+ZYBht+b+cCRysJNyjK6KsZ7Mx809441B8+NqMQff1bOGXYx5ZjndF?=
 =?us-ascii?Q?7liRtlA7KbZkSE2JqAogiqcTr4GkO+0We/Q+o9JP4JNhlQHpuYun3rAF85xn?=
 =?us-ascii?Q?sHnUCD+996EXoQQfeaNvpUN2zcVQgETa1MeSHrIxPZjpNM0dbcwkvH2dBzwe?=
 =?us-ascii?Q?NvglLvUuapL5ZKkhTL+ZMRhvmz7dI6CJ1uAEdD3p9ssw2D4hwBr245o/AIFy?=
 =?us-ascii?Q?RMi3tr5n7AdhBrWIRqC2MOWR+msQO4C2tyfDE/l/rckr4r6kN/IGdM2nidY8?=
 =?us-ascii?Q?k3f8GN/a6n5TcER15bJCPEJq81dqQGLIHkhcFOSyBrlzBngtCIFqWcob2Mvd?=
 =?us-ascii?Q?EX/dBdprjJlx6RclMaI4AgE8R9p6d1hdmCLnXScubMoLhaLJ6Q3RtpCDvxCK?=
 =?us-ascii?Q?JRh/GIwVsznDMuau3mWDr5V8i/x8icA3IG1Tx8ODgxHkBsrcwxRBiS+snGgJ?=
 =?us-ascii?Q?uB41d3Ruwv850VrWLUfIY0364ntcpxqOLCzeS7ZpaTGgJgOANkaJkidqn5mi?=
 =?us-ascii?Q?Bn0paijCj1w82P76Ck+Q2gMHpod+zawa5FqeXx2+DBaTkGORpCzDeQoTS99V?=
 =?us-ascii?Q?D3YkBymekyReM6XilEKYwvXfJNPHE+61epVtF0kwZkVTMZCcVJ9RsfKlXE5v?=
 =?us-ascii?Q?/LwI68UtRWHxvegS9nO5lICsPKZN37GyrGT8Kb0NbNUg0G0oYA//fuMBYXmU?=
 =?us-ascii?Q?ZGkFQ2HRA8p8i3t/RxLLC06un1FAKwrF3D45iEH4S8sS5NPHTntdB3ZIwMfU?=
 =?us-ascii?Q?qWaeXCg+kIMAI8yXWquYVzog70LZzhdLXLsWMq/pq33Ja9kC4tsjRGtB1/JL?=
 =?us-ascii?Q?5jlZzWpiwdRyBGUAEjpHfLKl1teWvU1hDaeYLTpKuahrN0UECObS2cCM66sW?=
 =?us-ascii?Q?MA10VnSYPxnaWiNs0/uEPpiJz1OYnFJ5LcWEs58bm7n+qsi6jTGEmwXly2Jj?=
 =?us-ascii?Q?tB+3h4XNGQJY437xZgXkfYneodhc9lNfaRJJZCuIZZHsKndaU/LoLgVrm2X7?=
 =?us-ascii?Q?Ae/Pz36gtwW16u2mzeqHfcvRPXmJlGBWUqeIMxOgFiPrbmDHYTaec+3Lgn8D?=
 =?us-ascii?Q?ulP6KcqYDFFHP5eiLrT/nzjMVmVutEplSz/WtjVrOIbVKi6X7wHS1qsOM7Aw?=
 =?us-ascii?Q?V3rcZuYxEm+HVsXkDXjnk7xWkL+WzwezyyygXO/BjmERBd9n9cOF9ASR+CA3?=
 =?us-ascii?Q?1vn0O2p/bOCud7kk784FXxx8gpz6SAzoZTibgjsMkLHp9AAr30pKOPxmBSFx?=
 =?us-ascii?Q?U54E+h8RTvCbp16bvaHHm4kuiMevYYOZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MZHVuk7yd+fAgcg76OSieBNTSZksNlOL61jRbxFguvGu8NhrHpNZGaMbVez1?=
 =?us-ascii?Q?VepNCfaCneWUSvOpc8bgRaULzyW1cxROUvJIdrWznMjTG8SF8rd48ttJhg05?=
 =?us-ascii?Q?OXtY3lWLgZbX9tt9JX8Y9aC6s6izPtDX8jcZFWx3fAqQce5XTIBhn7Uz5gSa?=
 =?us-ascii?Q?KgaeFC77dSDclFhMbB9nfChT495FMdwgGoOHWk9SO5UVUgDd/jcF+fU2VIS7?=
 =?us-ascii?Q?BUWXP6Qw3Z+r2wE2FsG5x26va+L83x0qoOq6knpgt8aaRted4/paCpmnjUpt?=
 =?us-ascii?Q?fTTXa9GhvEDxJI564QQFf5ZiREhYdpZsQ9oUht77wnEYck4tkoPY7GbOjG9o?=
 =?us-ascii?Q?vHNH1wi1agL7uQbgs66w9GzZEaDXoP9UnyJF3EzQ7kzsZOFB/ZGf7PBX2J+t?=
 =?us-ascii?Q?ehDct5/GvCqRzLZN4qFpTFPQvc1b3qjgUUHIONyQYPy6PsrImsAmE3xUIeUU?=
 =?us-ascii?Q?/AY0X0D+0jQLhNBHT/GNs1VDb7urhoUjkvgpi42HiEWfuPaJLFU5RYN5P6qV?=
 =?us-ascii?Q?GXgCiC8H1JCja91Tp4n5KogRtIhgEQraQXJNy6gUM4BlZhSN0wSelM6IY+Ex?=
 =?us-ascii?Q?4tRLC9tLQzeo/OfRrpKdBU+RzLESHWu0MXAL5mw/llRE1uXpsdgIllztyIH6?=
 =?us-ascii?Q?ZGI6Sz5v/l9+ZwlIhRIWU+0PgbXTtdVc1VkuBlQ3zRUOjHthu/wHg8U0faaN?=
 =?us-ascii?Q?yDLTz80YqfbvrzBvljVh79V267io0zIu6LFn2cEul1A4BXXEn5/Rm1zVb0BO?=
 =?us-ascii?Q?VtRnXVHRBTF4TMHAkk73G6JaaD12gX1Xoi3Gzn+LrV6x2IX3XaFU3LS1lBfx?=
 =?us-ascii?Q?A4Q4EP9LlXhO/Ajm1zdD9UJI79qpcxNUezBXrtAalf/rPr/xVvP0Cpbme6b6?=
 =?us-ascii?Q?vEKqVaO0FkM1DpgTQ6ObcLDIFBV1WBTy/n44NcppLeTU0x6u2gbl2zKJPhrY?=
 =?us-ascii?Q?VYKtRQs90oPX/TjJP4f0cgMuz3r1MFlu7iIp0+79xTCJLXNq8FHZ1FAUzRdY?=
 =?us-ascii?Q?Kwvh5TPQ9RAtfw9gyGZQKU7FTwgbMQD0Ayk4JuB4VmWlGfkwuhrFvPuP2m1y?=
 =?us-ascii?Q?XvDsrhVxq27eIfB4ovZkFIIfZHL1IZLs6xdUsnetRKhNGAoLWnGjB70Dyel/?=
 =?us-ascii?Q?Hzo79CqXa1bNph22TpEr1wxgksZUXlVB1EznitrWKmeeagXIPOhorWfGLF/V?=
 =?us-ascii?Q?TACuzaAAXQhtJxywboa00AdVq/+5T4mCjmA+4kpSyGuUrlxIbwhAVAE8JMwD?=
 =?us-ascii?Q?LyqhuuOcjeC1eOz2RQO62Q3VHTayDeUeoUAEEPtZ/vAD1ZLZ6o8Jgvm9xOcl?=
 =?us-ascii?Q?ql7u6QKex+qCks8vWbYnRzVm96igjwbh/lXcfZUliGM4sI7Muw/Z+yCj2jhQ?=
 =?us-ascii?Q?+Nz8vpdYJR1OUud2UuQns0vpXyimX3V8pRpcJoLqs/YY6bCRpjm/mLVWl74k?=
 =?us-ascii?Q?y6qBpNApNwCX8WKWv0MbncIER0auchn4TFYjzM5eFSs9hah8wnqDArZscOjQ?=
 =?us-ascii?Q?L90EfjdwBumiNxmCASJ2d9UBFCexFGMmOJchnAs0hpqsaOOltkS7H4zTTzKD?=
 =?us-ascii?Q?5HS7iHqtFfoeOV0v0+RG2G8gwtHcBP+xYE20sqza?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726c59eb-f760-4550-89a4-08dd6d406d9f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:02:44.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znPGijH1eczyyiIKNo81XPwLzS6UKR/Mlt83REgHf7M0FsCNDXt+P3sn+HJ7LvIqTyNJyZkAiu1VRazxMDU06Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285

On Thu, Mar 27, 2025 at 03:41:11PM +0100, Alexander Stein wrote:
> This adds an overlay for the supported RGB display CDTech FC21.
> DCU graphics chain is configured accordingly.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
>  ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
> index 7f96de6f80224..7b97b718ebc16 100644
> --- a/arch/arm/boot/dts/nxp/ls/Makefile
> +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> @@ -9,5 +9,7 @@ dtb-$(CONFIG_SOC_LS1021A) += \
>
>  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
>  ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
> +ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtbo
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
>  dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
> +dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
> new file mode 100644
> index 0000000000000..31494d9d09f8f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&backlight_dcu {
> +	status = "okay";
> +};
> +
> +&dcu {
> +	status = "okay";
> +
> +	port {
> +		dcu_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> +
> +&display {
> +	compatible = "cdtech,s070pws19hp-fc21";
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	polytouch: touchscreen@38 {
> +		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
> +		reg = <0x38>;
> +		interrupt-parent = <&pca9554_0>;
> +		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +		/* LCD_PWR_EN -> TSC_WAKE */
> +		wake-gpios = <&pca9554_1 4 GPIO_ACTIVE_HIGH>;
> +		iovcc-supply = <&reg_3p3v>;
> +		vcc-supply = <&reg_3p3v>;
> +		gain = <20>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +	};
> +};
> +
> +&panel_in {
> +	remote-endpoint = <&dcu_out>;
> +};
> +
> --
> 2.43.0
>
