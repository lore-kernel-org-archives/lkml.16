Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFDA221FC7;
	Mon,  2 Jun 2025 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873033; cv=fail; b=u9En4A4c1qJ4KkcghY/RmLvG8KaRbqb6W+KpazhPbodDSRVkXKZ8afIpU7xhfktTvUUNBKrtrC7dwV+V7DuMdpdsP1GHky7qEQp/Aq4m/U+qZo1TJZ8VbAEjBRv7kn13BGez7YF7rEF5iYQtItGDl1lMDTi1Ju7Ccnj7OwjjRPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873033; c=relaxed/simple;
	bh=rVvEQBNL9s8kWg1p5lQMywGwX4N5pJRlGg9opyKNaBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q01gzDsRT4q0jydz1Q1LHUx4DemnuE+UJcsgYnnsxSh7A7phwqV1qEeJ6a+VyyfaEOXZvbCWKAOOkywsttwGPjoXh1YaMyehgLv6Mu85W7bRC0RAi2S4a0XPuALxSctJp1613Mp9ba1TY/gL/1BXkzlzZWa7sPonQXZh0463Nf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ItCirEdA; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ItCirEdA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0UK3lYIGUfUfZoPI2VWRBMQ96ET5zhgiR+MNQmVMJwlfEgultVgK6u7Qa7+6Hs7gsrbc67u1nlrwUkD97Xiao3i0DfOYtFpixic2vYRn/AbgX43IclFQFM/BrQcfW3RKyWxGl53n78ePfrswwlvu0Qc2bCAsNyrAAOnZpNlvUfEoD+Yhxv5EyqdmBYzgJZHr/iU7xdh2s8gqM71uUL58Y8naZ+RIky7MybtmHAl1zEVJUgYjzhhx53NKug/yNw988prnuxYIagbvJFfG9CN+kXc40XtcLtFiCQHPLH1+dbTroEDWsisjv5Qnnqwie4JUZrpLBwWhgfVZ0WCyPAOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/nyneKmtkgZBGL2F/s2E1C/wuedGwW+rfEUfe2VLO4=;
 b=TIuyqxGcOXCumoonvgxmbEsZl4l87dRASwadM1u5eDLG6D3jiENiTQUn9aA7JHCiYhy8EuQDGUXzGyYAr3zijoVmxgvzFDCF6lv+y5NVbHygmHBLRLdBfP2MDhhAnCiZliFKkBYkI0oKyEpJTzl6H+6m4XnOw307c8SvR/EtC6BPD8eUmyxJnBPR6Llgix/NwbwXW9ir0fITDFhuTttV/5umBz2M5t27R4YchKQnQq4X7+e50AIOK/p2ZzaiBO0f48NHAhmzGHpJOACXiM6/8RayY2tMuCvQhfYlOfILgec0o2pptKYbN8+8oowjQ8TyK7S0exoEHi1+kZgrSFgR1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/nyneKmtkgZBGL2F/s2E1C/wuedGwW+rfEUfe2VLO4=;
 b=ItCirEdAaG7cXtFfHVasXDXZ9NXzDSA2Jk65hLbtPirPatRf637HdWuQtfefGs+GS2slEmlHGjw/EzkBCFYnb01Bx8v6+sqccxfCm2BlCxeh5HGVeKYqk66h3ixJpM8TvzHxVeHgD1EzQeGQjib7yHqlWeUQnkQEKCkQ6ifoElbi+H4TazTlNoRr/DtFsyBdn5xMoAq1iITX5Nd2i83TnbiCLUA7rPbUCRA1gc8ybpCfwaAvj97QhBjYDvRpQZVyVF9+zbzMEkPL3LEVzoCA0aqaZdLR5Ja813p67oICCn77gLksLtSybHcuomOhtIaWbAYJoaaNv++Ud0xjjDZp3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB8035.eurprd04.prod.outlook.com (2603:10a6:20b:248::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 14:03:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:03:48 +0000
Date: Mon, 2 Jun 2025 10:03:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/6] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <aD2vO4xxUzJzKeQM@lizhi-Precision-Tower-5810>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
 <20250530160748.2476088-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530160748.2476088-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SJ0PR05CA0134.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a002d6-d643-4568-aef8-08dda1de4b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dKhnTWDaTqaTuktzlGzxBqjfUuH8tOuccWG6hmUirzvN6Ye+FeaL1yvHvrFj?=
 =?us-ascii?Q?0GXvOHEm+76Y9/fgL7YERckRx7OZfvwkVwO4DITAYyQ0QL5yJtgMCADeJZmP?=
 =?us-ascii?Q?mSeQJ0VjEAmywTeOywmADDnv75KTKN2REycFUcXxdIshgsp/tlVR9/TdTWzn?=
 =?us-ascii?Q?WDpPhZAS7bE484TFoCCS4sFzfbj09zBTu6MEq6YvPusozj+la3LXK3X3uQ7P?=
 =?us-ascii?Q?z+MsO/DkFGOjdJK9ht1PaVLJEUMH1wn5fBX/yPRbLcZqMc3AoZto/2CbMTps?=
 =?us-ascii?Q?O4eEWbONQ7iAwUCKffoJsdulOFexixoUVBi45GJV69mNzxxn0YM9B9oS/wR/?=
 =?us-ascii?Q?4PdRUzEGi1GBIC/io7AhMqARM+eI6RexQJlwFEww3BQYaN9ivNBzXkPvkfsS?=
 =?us-ascii?Q?cwor3FsDt3A1oz3RdKMzvAlLtCAQ/sUasVE2JlXg85FLVSmbrzXuJqcDaA4N?=
 =?us-ascii?Q?etvig7zYhQ+rPUBzDecN4RjWT2sTDwZvGPvcJ5SzA8uH4tpna+b5iGFNyZqP?=
 =?us-ascii?Q?onE44DNNAZhpPf/dBAkDY1pWXuYnWiW4++9yx94RjOwBM04f4szq6HtuVgRv?=
 =?us-ascii?Q?vLWvE4p4OxfXO61JyA8vS3NueCJ0/7JklewcdrdqI/zEkrlq7NvI0YO5gFvy?=
 =?us-ascii?Q?iFdxiDLIzziPw4XyaYqquUTD3rFDRD9yer2VsPW7n2qkspU+StMNkEw2+zGk?=
 =?us-ascii?Q?qWRV9sC8R9LB5z9fhFjFeCbrggN8h2KJTpaa01c7B41HgsafADLFpzDGoAp2?=
 =?us-ascii?Q?jTAeeShGX/ZM2l499pFlPh0UcnJvedVWe5Qr+vXUM8alQ6aI/bnMbGEqRN3I?=
 =?us-ascii?Q?GeX7CGaDNj4OGjaMjCpPb8Vqywwh2imymjD+wLCwcl0x5WmFzg8b8nx1N9OD?=
 =?us-ascii?Q?6Tb6vdL6T5160V5wpdbOkuhvSBTSBg5CQhGvxJszNQ+2LZ47WGu//jKteyXc?=
 =?us-ascii?Q?+N31EOp9FRAMZRQ4uH9+aenyQiWLYxscJ7n/FZcyYqCLb2JIQlinE1+pECda?=
 =?us-ascii?Q?N6gF+r+KGV01y9j6dT5MOY9h36x5bBDGmQIExnN4VstP7b8TqUzhvWB8mTQ5?=
 =?us-ascii?Q?XeuxDL26d7xeVhNzBcKYAnLyqy2ae3ioBOvowRFA/dQYituGTRktAJOuBrgo?=
 =?us-ascii?Q?VD8SIQJkv1/fimYqvCIlfEu2t2cAGVDtHBn8vufLXTsQgjPvkF3cXjIHhNWb?=
 =?us-ascii?Q?rqN1iG057cxQBjP8N2LfYRrG9KDqZmmULszMUJfhbdDRiEWs/fNuJnrZbT0z?=
 =?us-ascii?Q?XtLUxx9MBEt0WODaT6nOlP0fbz3qZZPXwtq6wXTDw1XRsxSP5IqfmUEQzs1u?=
 =?us-ascii?Q?Pd4n5sM6ZsFcro70bMHIwGW9zJCN1HERU6UiL8Xd/WPYjVnrKwKxHyCuYgFd?=
 =?us-ascii?Q?BqWI6BW0ABf47giBbAscBO/jpB61NhIJAag6yRS5vTskc4s6e9n/Boa4Itan?=
 =?us-ascii?Q?PUpKmg83IkDnFCHF+cLFJz+lnTMbZMeBPD/Chqh6Km60s2yRgGSCEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ftl1tX6KP9fRzCohtT1Z4S1l4Tg4sAf4xul6xtm9zAVlJtDpKEwHBKAzHFC?=
 =?us-ascii?Q?GgcLkg8emZlv7dRneFnXWlcwE6h+ci6+w7Bv0H1oivdGBRbN7h8qj3JSobXv?=
 =?us-ascii?Q?Qo7p0gDpi9QRSi6Qo62M+zpytN13c/xC2IM4vhEPhEPZOKR26GZCH5ZUFiiH?=
 =?us-ascii?Q?rz6eomjwV1hjOobHDYMhZ3EgW5rwsLJnxPT14QuBQdBESRR/RPzrrmHV6c8c?=
 =?us-ascii?Q?rdlYIyTM71HU2tPKK9GY+Gw9nP2flY++UA+iLodkT1CMf4z3ewxAUJdZNzfZ?=
 =?us-ascii?Q?T015Cywr7wD2VLv/vmqWfnls7F3ynhkpKoaO73H0ZE9F3frbAlB0h087SQz/?=
 =?us-ascii?Q?dL9C/YujHpaMSuG4Z6cTTIfodp3J/+TCf2q4SBC8Pqfv4lzfmPqkYX4ITita?=
 =?us-ascii?Q?yKAc6K+wOXEMSzOyv37h4Qu/4HkTOGsF/cyVf5M1Ku73UnFTKCbq+O4rsxd/?=
 =?us-ascii?Q?j4CqLc3b4gJu+wZQ5JBfqWDh+3KJuTxmpcIKrZlGyJlW5UWDtEL4lbqw8BDY?=
 =?us-ascii?Q?MOU5WWMvkMPd5Ek0f9KMF6k88kmGgo4hLWoXPuA536E5OzCmVQfz4lLDavSp?=
 =?us-ascii?Q?QoTh30zUVBVjWtCuljZWWBn4EARqXw3tce81PJZXCN/DjSw+wzbWjvSmvm+L?=
 =?us-ascii?Q?0pQJc7qecbu4kqbMRyPMwDJpk2FdKOdhgnIjNrz/vx6IPyuGOJPplNFzO1NQ?=
 =?us-ascii?Q?kPsYjiMKROiz00q/YLhEJgsA+ZA7Jl2tlorgVMr6v6Xx+02euXhXd0VvDuk6?=
 =?us-ascii?Q?j9wcTAX5hScISysAuOiwt9Tk8NNbjX089dy5YhyMF94d08jKw6L0Xb3v1mBI?=
 =?us-ascii?Q?c7WZbfbmsYGLFl7w1tfMFtU0IJL2zgY1jlmSfwUAVW5QkWhTjmCkEE3uyb/d?=
 =?us-ascii?Q?E5+qBhXyPEzOgiX0lh2fdryuAnQIFfhvBcBfLe0gaeHJU492+MsKFYL4w4ke?=
 =?us-ascii?Q?BeD4yE/xzk8WiunHrL89FYhFNvY8/vXtUmWya//q3Gi5+7X/UBCs01XOo3uv?=
 =?us-ascii?Q?IM4sct3LRySjsvm+xDbBbBCdkuonFnBDuk8JUYIEIbz96v/tHx/1tmFbj/rE?=
 =?us-ascii?Q?0VLNs1tLcGuGsRxclmlzTuo9VGDy4N/bZQfnx1YnIXFARgZaFGtJvjPad32H?=
 =?us-ascii?Q?rB1kwA91YK74Vg6PvZy9R0+qALdJ+0xmCTredJBc+Yo91L5+MAzG9nzppYvl?=
 =?us-ascii?Q?n4DFFTwh26F6FNZttuJ36JuLfFM9vNsZ8aHgfTWrjZJNhqaD88CSFRHVORZt?=
 =?us-ascii?Q?LCKEMJOSyidSDuMwXJ8VPVA6K0wnGwmsRo4VAj7mOoVsrOjzvUfrM2/M+mQ2?=
 =?us-ascii?Q?HHZh407okggdvssLVkWbJ/nuN0DOjkUM60rXniIJg6pW77MSXXM+eWrpz2hj?=
 =?us-ascii?Q?G7XW57+Jivgxbq9TDGLDNA8lXuLYDjm7cxDRqm4vK9texv04LBPiZ8BT0JYa?=
 =?us-ascii?Q?SvkMBRyw/M3s/95YA0Hpo9ddbeJoxwqfwGXRDwzS/9yqw8m5+oykfNtJJb2V?=
 =?us-ascii?Q?xfyij+gsnrptH6Gb/pz6g0fhc/FnkWQi0NHP/lo/4rCxUNEuusQ8FSY1wtSs?=
 =?us-ascii?Q?VWovXrRmKPBwUujANQoU0Etpq4BqkYjyXEGXqEhh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a002d6-d643-4568-aef8-08dda1de4b81
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:03:48.1953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9RN2O1VMwcGcFVdlWk3gHNmNlco9pLI1a7r9bkGynjHqtrRG1ji2/k1T3gfCPCd4yygB3MvsyK+FdUA8m1GrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8035

On Fri, May 30, 2025 at 06:07:35PM +0200, Dario Binacchi wrote:
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 128 Mbytes DRAM DDR2
>  - CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v5:
> - Drop #address-cells from gpmi node

Okay, actaully imx28.dts's #size-cells is wrong.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Changes in v4:
> - Drop label property (deprecated) under the leds sub-nodes.
> - Add microSD comment above the ssp0 node.
>
> Changes in v3:
> - Drop xceiver-supply property from can0 node.
> - Rearrange the order of specific nodes and properties
>   alphabetically.
>
> Changes in v2:
> - Replace '-' with '@' for the pinctrl sub-nodes.
> - Replace edt,edt-ft5x06 with edt,edt-ft5306.
> - Drop LCD reset hog pin.
> - Add correct #address-cells and #size-cells to gpmi node.
> - Replace edt-ft5x06@38 with touchscreen@38.
>
>  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
>  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 ++++++++++++++++++
>  2 files changed, 301 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
>
> diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/mxs/Makefile
> index 96dd31ea19ba..d72ba702b6fa 100644
> --- a/arch/arm/boot/dts/nxp/mxs/Makefile
> +++ b/arch/arm/boot/dts/nxp/mxs/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
>  	imx23-sansa.dtb \
>  	imx23-stmp378x_devb.dtb \
>  	imx23-xfi3.dtb \
> +	imx28-amarula-rmm.dtb \
>  	imx28-apf28.dtb \
>  	imx28-apf28dev.dtb \
>  	imx28-apx4devkit.dtb \
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> new file mode 100644
> index 000000000000..af59211842fb
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx28.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "amarula,imx28-rmm", "fsl,imx28";
> +	model = "Amarula i.MX28 rmm";
> +
> +	memory@40000000 {
> +		reg = <0x40000000 0x08000000>;
> +		device_type = "memory";
> +	};
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 4 5000000 0>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		power-supply = <&reg_5v>;
> +	};
> +
> +	beeper {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm 7 100000 0>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_pins>;
> +
> +		led-0 {
> +			gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-1 {
> +			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-2 {
> +			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
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
> +		regulator-always-on;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_fec_3v3: regulator-fec-3v3 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fec_3v3_enable_pin>;
> +		regulator-name = "fec-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <300000>;
> +		vin-supply = <&reg_5v>;
> +	};
> +
> +	reg_usb0_vbus: regulator-usb0-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb0_vbus_enable_pin>;
> +		regulator-name = "usb0_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb1_vbus_enable_pin>;
> +		regulator-name = "usb1_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +};
> +
> +&auart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&auart0_2pins_a>;
> +	status = "okay";
> +};
> +
> +&auart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&auart1_pins_a>;
> +	status = "okay";
> +};
> +
> +&can0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&can0_pins_a>;
> +	status = "okay";
> +};
> +
> +&duart {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&duart_pins_b>;
> +	status = "okay";
> +};
> +
> +&duart_pins_b {
> +	fsl,voltage = <MXS_VOLTAGE_LOW>;
> +};
> +
> +&gpmi {
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +
> +	touchscreen: touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
> +		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
> +		wake-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&lradc {
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mac0_pins_a>;
> +	phy-mode = "rmii";
> +	phy-supply = <&reg_fec_3v3>;
> +	phy-handle = <&ethphy>;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			max-speed = <100>;
> +			reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <4000>;
> +			reset-deassert-us = <4000>;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hog_pins_a>;
> +
> +	edt_ft5x06_pins: edt-ft5x06@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
> +			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_ENABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
> +		fsl,drive-strength = <MXS_DRIVE_16mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	fec_3v3_enable_pin: fec-3v3-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	hog_pins_a: hog@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	leds_pins: leds@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <
> +			MX28_PAD_SSP0_DATA7__GPIO_2_7
> +			MX28_PAD_PWM0__GPIO_3_16
> +			MX28_PAD_PWM1__GPIO_3_17
> +		>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
> +	usb1_vbus_enable_pin: usb1-vbus-enable@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_DISABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm4_pins_a &pwm7_pins_a>;
> +	status = "okay";
> +};
> +
> +/* microSD */
> +&ssp0 {
> +	compatible = "fsl,imx28-mmc";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
> +	broken-cd;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb0_vbus>;
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb1_vbus>;
> +	status = "okay";
> +};
> +
> +&usbphy0 {
> +	status = "okay";
> +};
> +
> +&usbphy1 {
> +	status = "okay";
> +};
> --
> 2.43.0
>
