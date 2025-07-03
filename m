Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7053E2D5418;
	Thu,  3 Jul 2025 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552885; cv=fail; b=cHhNd7jaOzv9GRooffQmyhn55txQ5aeeo9EmhepSzKkxAHDV567uhSgvETtTFE23QSPGpuQNxUibkv5bldJ/8qZvGvRGBKKd2cszvbkWtcMarae5owjKEI2zOKuRd45M4oa04ZYg16Z4zeUKwvbNbzmXif/tz/8pdDb31J26JTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552885; c=relaxed/simple;
	bh=5d+OsNviM1R4Zc2Ycg7V39pPNuJC2Ntycm2YjhyU2H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GFuZwzMBcjBZ1++hsN2XyUvgVsEBB0mVbpKnlmyL1uw6UDdWQ54diPlr3xomG0i5A3e63tdPLXE19qgX9My57UrS9I05RthESzKe/Av8Dwwhl0RVTj3K6G+vesBHYbf4ZG/DSxgJtW0qyFPnvL1c9ViW/VGdB3ee0SeKFCMp80g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iIo/42uJ; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iIo/42uJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K753/43Ax75S5ucAGqyy0qiKgVf8JV3mpK01rXofaBQQ/Jda5Rg/oRHX5mZXISJKn7BJzyyAIn146OliSWo+L26uIgpRP5h00Qo2rLpc9I95UHAQLewv85HrgGx8xzAxHrIe0jZFHcAmb1WiXGClx86WCBzYgXhkSz7ki15i+Qp1HKrsciXkWaetXFLPkQdifpIFq+2Rm3dP3wph+lXvjvDVUIfblAMVocBo9pqMpFPjg2NsFeBtLlfVwd0/AByqQ9/wTRGdgvWuUuJkYLG7wBfj+F89BkNayWj9+6iEehzwc3stX812aVpuhG/gk0NKB0MKutj3rDw9blXxVD3DVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfyNGZDhrgoe5wdluwGokG3oeLxUkauurbVbQPgoBK4=;
 b=JulMPnexDxFBMsx/NexbxUA8b5AsIP4Fl8TuFvhSJ+kIgPgaWG3Hfx1119G8I0B6MAiJIBc8QvLl/u7Vz5tojN/6wb8Ck1Vrd934YMlUvjnJ6XqjoP98p8/fxlOpXltGkFuUxeZ6jw4kVQ5UxzLqeSqhXyR1+UWBul2DxuCmHbWcMqJNHOkKs0PrH6Qkf4jK43wRO6cQ9gGrNE6Po+rNYLL62VLwxC6cAlarrkz/P6xS2AGTQGzfMUM49+CijljkTjp3LygRbPJRUR3cFXpOtljO02DNpXFlpikC4jG5eF+D3gGabLSkPNnrvZjxJ0/OTUaL6aRIZDXkhca5oAFGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfyNGZDhrgoe5wdluwGokG3oeLxUkauurbVbQPgoBK4=;
 b=iIo/42uJTQ0/UVAUIOA/1OttgVXXENV1a1Ss5POPmGPrAwllUrPeeXylGdCCLGMHzluja6h4eNBXdryYwrZliLc37LvIz9e9/mos8/WMKzPkKGswHpMv7rs5/VF0wA7nNL/H5JpDKHGJ7WM9w3Uwb538dwZAPW4IlhOfr17aUu+DknaMWPLfcVftgQ4aHKKct0MB7OZgm9c2DvhoMTINZgxWBveWLjxcuuIGXqwr6VOWyvmITqV/Wi2wz2gWXZAZN1hbDksaJFul+z9O7XG1s1jlNwMW6Wb54iSSQeb1l0leqzF1reCr/rCKoQWVnV8mlYFBKPfpEHQdXVUbXdbayw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7440.eurprd04.prod.outlook.com (2603:10a6:800:1b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 14:28:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 14:28:00 +0000
Date: Thu, 3 Jul 2025 10:27:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 4/5] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Message-ID: <aGaTa07x8DdGeF8s@lizhi-Precision-Tower-5810>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
X-ClientProxiedBy: AM4PR0302CA0030.eurprd03.prod.outlook.com
 (2603:10a6:205:2::43) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c2299a-c75f-4d15-01d0-08ddba3dd008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VUGMlKRAyWXW8J2LOqFiu75xdRuPXpTVlCveHn8FD6V/s5141Fpdg2Gg0MvI?=
 =?us-ascii?Q?xIMZ8vORIfV01BookHig4aB30ASgzCqWAJRvStLrX3rx3U61YKiDrPyXS4vN?=
 =?us-ascii?Q?3tiCeXTIC0BnKOXAhlPbZcNmPQE78MKa0x1uxXN3UulM6E9RScpXJqkxQXgv?=
 =?us-ascii?Q?wrSc0PCh4HWsReVHT32aR7EruNkEUOHmT587iGF9+0YP8O2K8sljVVIK7y5I?=
 =?us-ascii?Q?to33EuNWkDaFO4KUpbhB9RuCgEBPBDSdbDrdBiGwbFb/HEImER3VfZx4pxby?=
 =?us-ascii?Q?SJv28nMQcE9gURvQmfmnnh8pOmrutIlY2OJ/wJVhZhtpx7LCJo9Nz/jCX5/v?=
 =?us-ascii?Q?QC0CDMCsQ6M61QADt3xfm5X36ROQHJDZ+DfOW2s3JgZzGS3ofqz0nbQssrWU?=
 =?us-ascii?Q?BFWQDn9yZE6zsEVM1bgsHNw8oCBeoGh1+Rew/HFVGp55sxdYCj4p/L5koZh2?=
 =?us-ascii?Q?RqZp3ckS/CEUjD2kHddHI9Pysrx8d0BCXjelqCvpo6KdHHJpHRO1X+yft4vL?=
 =?us-ascii?Q?ZtYLgiCMzLukKGSeJMkEJSIkazK09xCVBQ9+sYRlYQ3dVSTHgFmrIJAcyzs6?=
 =?us-ascii?Q?0tR+OSRJsQ9PVpTeUK13P9ArEan4kiU7T4KPCfk7FiRr0QBhw8cw97s0nbfy?=
 =?us-ascii?Q?zyZLSnE/6YfCOc2UZu2HI8O/GJBo977omFoEQ0g6qf9uMiTcby2wD6qSXDfH?=
 =?us-ascii?Q?JGpbO4rcv7+0l1sR/ijLmbZYlMar4J1796KBiXgEW+9k8FhS6Qumrur/gJwF?=
 =?us-ascii?Q?BPYz9BzgFqL5BP0irUJtCLb8nwzy0loy78+hO9+6X5PyAwgAvGHR9IzW78uj?=
 =?us-ascii?Q?JTkwRQWfFuCzwt3zzcarplRAMg2V0Ayk9X/ScdnyzaoXNsxexfo6MtfaNsZR?=
 =?us-ascii?Q?xVMxVJICeqj3Ae415/SXolAVwIfK0Yg2Eh2LV6Pea5FOv0zqN3SO989GoW3W?=
 =?us-ascii?Q?E/rnPWjmk9kM/MXcBLtw7YOi0NCs6Ro7YD5Ue1u+jWmnAtpuFYCNVvzYNFP7?=
 =?us-ascii?Q?/QLphMXCivosvheNFmI0JNcsChszi7ocvN/K+RnxmjgQLiO5mlp/Grq3xrNU?=
 =?us-ascii?Q?guEpSeGTghZsl8E0KNEw7XauBno8T3MHE5BPtGrpmugPF2tfh2UxAtRzDHLv?=
 =?us-ascii?Q?IVK1P7joeKKhtwgGd+6SOynjDvTxGqBpB/UtzUnqbfGyWVAKC1SJ5C/fhCLb?=
 =?us-ascii?Q?tC0Fi2H/QJafhpWXGSQblltFGqpf3rDp2drqmEiXmlWn1s6iPRCoxY5O06W8?=
 =?us-ascii?Q?j+cW4dObeB+fFz8ZuOxRraLLZA5aurMCe5zs1MeT9Wgfg3aDNtbYrtb3yAGq?=
 =?us-ascii?Q?77aO3q920Ee+c3ir6nyii4yOrVeFQlTycVxCQ/IeVPNdfgusarFSHOQeJyB+?=
 =?us-ascii?Q?VtK5px39203uATnNJpytSiIxqNhte1zKN4rd6yZf9sV1BLYJabwLLv6lUYNl?=
 =?us-ascii?Q?qIPBhbc9ZPm0b058gXqvnol88EX5jX2RxNMViwRqcnBHfbkTxixA4A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pQPqb2LYX9e2n7V7MFfMg5GMsV2/bg4hWEHFsd4hQ4758zNKP52g1VMKrsS6?=
 =?us-ascii?Q?Zyalh0TrzNKbAbbvsC03hN9e3cVDNNEUYrPpJJTyNJZMGuQ+FGd7PNmkx9F8?=
 =?us-ascii?Q?u/2y8EiSFoEQthZsxkLXAW1qdXbcE70e8czMqqIg+eY1KYtWtjkObWpW68+x?=
 =?us-ascii?Q?EFFgzAnfgI6ReH6+FNQQ2str/8tAkq02THpAdaH2BBXMM/DkpHoq4FMVE+7N?=
 =?us-ascii?Q?D7FzBZcvefTvPfqlNhkHxoFtuZ/40WtDNf98tC//D0YqD7GhhUY1UD9vh+PL?=
 =?us-ascii?Q?EG8Ex1KfjMoIEHqTlZQHs9YzdgmKQXCff/rej7acas4vrL7h3TKbjNBod+Qt?=
 =?us-ascii?Q?EPg/eFAKTzmKmM4z2Jx5xI5ZFODabiS9u0rhARMGZ6qLLrmJFX0dvTNUe7XC?=
 =?us-ascii?Q?GLLERQl+Un9ciTbgkF0Z5VT2VvH0mIDU8DLJu3ld4AWQp5zSiK/58Ij7WqJv?=
 =?us-ascii?Q?DTnHS5hyVygfsP1vOI8T9d5OpIf2m/nXtEHn9bpE+gtsnjM47mO005CInrl/?=
 =?us-ascii?Q?2THELKZiy3pYIdZNVqJvtfai/L+jPjMBxkSxKERN1dSCQpuhUzfzXLEIlBNG?=
 =?us-ascii?Q?VFEjPz1QyhRcFhXwR/d4NGNb/uSzJe06JCpf+uMqsgkThlGwW3A1wLxzp8GK?=
 =?us-ascii?Q?NF9s8u+9/D6KGDbb9PbUnRzBpBrnfLxP6obc01APF2K5dXJm7ROfQZ1qZzIe?=
 =?us-ascii?Q?bWf6iBvPrbTaY/E9BrlxX13D/nykkiloipUkpknspcPyPE5wY9jxTHCVEiDB?=
 =?us-ascii?Q?6HGrdwWPqljkMflgR1wi7vTvjAoddTfuyV/4oJhfzfM8SxR+4MynCBnYOcoX?=
 =?us-ascii?Q?FI4JRLhoVEc/MdXPJU6SebLaDjBucZV2C7uU6btm5CfpYZs2F29TWdJt2pUB?=
 =?us-ascii?Q?f4uzW45GSCb4mUGlRRaGhfG8ktYCbQQ7hgLvwOk0mcHnxLRLlfr/pkXqD6ir?=
 =?us-ascii?Q?KgmVdoBIy+0Z28+kdBzERAkSAz8PL2xXvmG19fVLUbjRfv8GXdc/EP7qj4nd?=
 =?us-ascii?Q?NtPIu0Bma7whEUhi8v0+/zZNbLU209o5xpSkoI87p80TfQbYQ6w8Jj/f4eCN?=
 =?us-ascii?Q?95PbjXxREOg+lYjYbj7cLAx7WlRX7MjWYN/vSyUemZ4zy2q9XGbYv7zaI/Qa?=
 =?us-ascii?Q?CnztgPvEmVpPjCRLR2Fa/YSygWABAHuFil5NnzNBCnj+QtwUYlxIgiPq2JCH?=
 =?us-ascii?Q?i2l62Pzj+GBuwL0QdeOAj0GSVjdpT0spc1FeI+7p1E+ZKZ0BBMIE9y5jWT8b?=
 =?us-ascii?Q?1g1jR8F4vlZNDkf8IMfgJKC1z5uXgX/gMxuXKo0aE2rX2P0mS8mVbBtgpmsY?=
 =?us-ascii?Q?L+z8YWj9SYyVPBiSi86bx4ixgrcvz2p+d50pSXev4/h7VNMj+20zze3SQwr0?=
 =?us-ascii?Q?fHYWxyX0gTz/9bAY4REZja2aHhGYLNp/5A8FxlVYi6cfdYnIHXjs5aJtMTdl?=
 =?us-ascii?Q?cIICAaZFrCGVpbj7wcvH6OxQMHwm0TX35hDRQ1M/EbtsGqY+PviIAsKocPw5?=
 =?us-ascii?Q?2f3LUOb+vhHyxCzlG85bifu0QVuob45qL5y86JnSTF6IInoGiwqfL7Jb0eTg?=
 =?us-ascii?Q?JPImPoHbT0sBXmbTMAIaHp3lKAucP/gnUA1dIJUD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c2299a-c75f-4d15-01d0-08ddba3dd008
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:28:00.4661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPGqO74uYwuI7SdhOVpjrSVd/WCG6QJWkFUbQLTj04fGfZ4NWOpNwa0jLtBpmdYkkeQGKSAg70lJvrCXQ6Z1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7440

On Thu, Jul 03, 2025 at 11:40:23AM +0800, Peng Fan wrote:
> i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
> gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
> register controls the selection of the clock feeding the display engine.
>
> Add clock gate support for the two CSRs.
>
> While at here, reorder imx95_bc_of_match.

Generally don't reorder in this patch. If need, put reorder patch before
this patch.

Frank

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 56 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 828ee0a81ff62c6e4f61eef350b9073f19f5351f..4fd101502e5881c78193c7e443123c8047f216de 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024-2025 NXP
>   */
>
> +#include <dt-bindings/clock/nxp,imx94-clock.h>
>  #include <dt-bindings/clock/nxp,imx95-clock.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> @@ -300,6 +301,51 @@ static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
>  	.clk_reg_offset = 0,
>  };
>
> +static const struct imx95_blk_ctl_clk_dev_data imx94_lvds_clk_dev_data[] = {
> +	[IMX94_CLK_DISPMIX_LVDS_CLK_GATE] = {
> +		.name = "lvds_clk_gate",
> +		.parent_names = (const char *[]){ "ldbpll", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 1,
> +		.bit_width = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
> +	},
> +};
> +
> +static const struct imx95_blk_ctl_dev_data imx94_lvds_csr_dev_data = {
> +	.num_clks = ARRAY_SIZE(imx94_lvds_clk_dev_data),
> +	.clk_dev_data = imx94_lvds_clk_dev_data,
> +	.clk_reg_offset = 0,
> +	.rpm_enabled = true,
> +};
> +
> +static const char * const imx94_disp_engine_parents[] = {
> +	"disppix", "ldb_pll_div7"
> +};
> +
> +static const struct imx95_blk_ctl_clk_dev_data imx94_dispmix_csr_clk_dev_data[] = {
> +	[IMX94_CLK_DISPMIX_CLK_SEL] = {
> +		.name = "disp_clk_sel",
> +		.parent_names = imx94_disp_engine_parents,
> +		.num_parents = ARRAY_SIZE(imx94_disp_engine_parents),
> +		.reg = 0,
> +		.bit_idx = 1,
> +		.bit_width = 1,
> +		.type = CLK_MUX,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
> +	.num_clks = ARRAY_SIZE(imx94_dispmix_csr_clk_dev_data),
> +	.clk_dev_data = imx94_dispmix_csr_clk_dev_data,
> +	.clk_reg_offset = 0,
> +	.rpm_enabled = true,
> +};
> +
>  static int imx95_bc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -467,13 +513,15 @@ static const struct dev_pm_ops imx95_bc_pm_ops = {
>  };
>
>  static const struct of_device_id imx95_bc_of_match[] = {
> +	{ .compatible = "nxp,imx94-display-csr", .data = &imx94_dispmix_csr_dev_data },
> +	{ .compatible = "nxp,imx94-lvds-csr", .data = &imx94_lvds_csr_dev_data },
>  	{ .compatible = "nxp,imx95-camera-csr", .data = &camblk_dev_data },
> -	{ .compatible = "nxp,imx95-display-master-csr", },
> -	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
>  	{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },
> +	{ .compatible = "nxp,imx95-display-master-csr", },
>  	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
> -	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
> +	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
>  	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},
> +	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
>  	{ /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx95_bc_of_match);
>
> --
> 2.37.1
>
