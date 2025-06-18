Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012023.outbound.protection.outlook.com [52.101.71.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CA3085D2;
	Wed, 18 Jun 2025 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270540; cv=fail; b=AdMVkBUyuLrUVrJDkmSaQnTEjoZBn6uLotvNxiDHp4tIHv3F8WiVqRfyKdW7+EOnkqCpCsyZ1eMnKNzHMbCdnAJPIBy6/0vKJi72OvPvXNhNq8mNtjT6g6phbvSICH8edo4JSjYm9gI55XdeaYUZCWm9EKuE7gg5gwNSj8VpCys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270540; c=relaxed/simple;
	bh=whOQHELd9o+/j/WdT8uM78Ie8ZBEs4upBxcdQo5I2qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AU83xm3URpFEU2ZplHDI6BJphsegnMyc7/DF2CuaaJyYTCjlcocTSV4BwmHbtKuUPfWsva77gnE1xUpRqgC3Sdj7KoSFYP6bf394OcFt+ShRAuvjwQ5h7rS+YYi2sesz9l+LJXSY1KTakTTTjNYGSVlbMprcmeO8ZF52Zv0HOPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vnr+Y9LC; arc=fail smtp.client-ip=52.101.71.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vnr+Y9LC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9vJBAliJvzj+Nz5/zp4DpPwZiQfpU54ckhMhW94xFxDJPK/3sZ0mFuSO6VL81Q24KQlTk6mrV6unn5eAKe3VsNGft96lV5BbTGii0KmPQaFe1Lp8cQVa/8hxtP2RE0KkO99fMg03HT7yp+u7kJ39NcHvBX8yT7zhR+LUPQ79T3HrI/fRjOO4seIx1yLJWYjTQ5stIGhsCDuor6Q3D911mKY+G4gOTcld531v6F55ijUtDgutoWLz+6ysyCgnvA6GNNPCSj9Z8rfSyRxRbwwYXT6vBGQf8TpCM/ipNscVr03zU4q+YSc97oFtcDVeVOi/X6OQGAQKMKKRWIJW6dnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRbq7OKqMBEVj4dkUrebOVAQgxj/W1z6PJpr3fFK+aM=;
 b=hQZHpAVxR08azIwcCEd99BNOALW2u6SuchPPNWb+2VEGSUTsw+gjD4YrHfDEqQPh4ERZln220enCO47scSpkCr30xEDf/AwzMEK92gz9JST+uURGYAZlOgjqATOX7HA2vdX1QM7yxJYCeJP9kpSjfnpJ14Sj35SwHkaGM4h5n4xxm9Tn2q7ArNtGcbgZU1tUHJTsWVbRXplgW7HjOmepT7M8nBUEbIc7Qh0aAv4kIWfZV2FI39LkzdX3joDkbEHkOV6VjFZ7siv12OB5hogbAPnGC6YgT3+ajKh/1j3qUcnqtEbtc51KZKLGTIhGN4O3Nj3prmPcpsbAdPuUcutIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRbq7OKqMBEVj4dkUrebOVAQgxj/W1z6PJpr3fFK+aM=;
 b=Vnr+Y9LCwRUksiN7T4F+Ktt05d7cNCW8teh262902Lt7rWxB/vSLIbDJ4ZqfNgVjjts51JruZs/g77wCPSCUnpeKXl4ppUogr62WhLFv7kCXUN4dK3XWgoikMTvOvLKlpuknU9jOgsWwrjA2e9VwJdENk0nAovHAeH4QlC1QuCAh6IIrCG+9HX1HSj7Q+vc5Wb99ztuQsbvC1jTPLpClRgYpDEboT9oy6NrmB4fIESiapYddoL6sSnkWM/xM03Gjn4/b0Z31/nl/qPr5TkIttQfGP1jC6YCp6SfvjkIxWAh2mvkuuJjzTO58ZNckdyfZRDVOb/rnvgr9vKP17xbilQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7845.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 18:15:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 18:15:34 +0000
Date: Wed, 18 Jun 2025 14:15:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: Fix an out-of-bounds access in
 dispmix_csr_clk_dev_data
Message-ID: <aFMCQhOSoaMnccNA@lizhi-Precision-Tower-5810>
References: <20250618065318.319339-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065318.319339-1-xiaolei.wang@windriver.com>
X-ClientProxiedBy: AS9PR06CA0644.eurprd06.prod.outlook.com
 (2603:10a6:20b:46f::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: d36fc467-f7fe-4111-872a-08ddae941e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EyjVSyftxdOdolSNwS67SmPI5EYN/DP29idae6svt3DOTBhuRbJ/4tJ8WiIt?=
 =?us-ascii?Q?gzEuBdJX/9COo0esBePmFvKyE7ipo7tjjYU1xwl4hrvf5M+GfehZVvqtkAB0?=
 =?us-ascii?Q?jPCm4wMngT2gHdLskkc+CevFtpg6P1RGOZ5hsu33CSGALzcxcpr6g02uKcwR?=
 =?us-ascii?Q?uVduhQNEx7n286YUrsWxH5pXkd74c7g7vWQG2UKb2xklWCVE2PXPXpOzxGMZ?=
 =?us-ascii?Q?nm82cEUqdiMxGRNHrO9CSPcDvX5qoArv4eKINKBLVTHNjqct1SBZX0LcAIEy?=
 =?us-ascii?Q?2HKO1XQu2mhW1ddyxYdQ0GCK+zY8lVbVmZq1lwup5RYiYqrO1JBKj+XfNVVU?=
 =?us-ascii?Q?tLcg3CjN3J2Gk+u1R59UTWVCgVst4SxCXfQKL44A7NqR2ZGaDTnkw7NiKySp?=
 =?us-ascii?Q?aexlHAw3MZdTMGSOujFcmAFaYZhqlwdMXM7/TZx6a+gaOn3RudRLtN7Am24r?=
 =?us-ascii?Q?oAV5oxtdU+EotJ/MEZbAIP6q2lQa6bXgHlg2n0HODmopKyexyy/Q+AQwwpKZ?=
 =?us-ascii?Q?IyRPDuMEXOzepmyUd35E/fXgHaMQoPKB+QM4+lJZBPJ3HC78PmpXf15llyPs?=
 =?us-ascii?Q?bm6WLtjkBZcGUCyH9l5wHht5TftRNj9c0Ogazta+vtnSJRGRM6fEc6WgOJ5e?=
 =?us-ascii?Q?7/eeD+FobahTZVujxyvoh4wbUEm4jXMcSvOV75TYlhp+S3cNL3wjrFgEpvTs?=
 =?us-ascii?Q?UsXiCsa2BCH5pL1Icla/fIbL+yMKsrmtVxrocgTCdvczSrwbbtoKmcv4Bms7?=
 =?us-ascii?Q?SZNI/4ihGgp6bK14GYyeBDHAm1MLxZjnAynxHTSf0j1SWoOdrkxmOlKlk5/M?=
 =?us-ascii?Q?GqqkJbbgZd/WLBzp5MdqqDYcWDsRNubPC1+vhX2KM+FEwZgZOawemYkY3yoW?=
 =?us-ascii?Q?uRYG+F2Z4EYLQQjUEC8xfDP8NyTZRIV05X8qGiD+7mgL6J8f11IBOxpazwiJ?=
 =?us-ascii?Q?o7/Bo1NSmS7o1Dc3Iwt4w6n48mb7yRmZFy924O41m7vO/QRkdp5ofWQsNDwX?=
 =?us-ascii?Q?JOcSxgvZ+wDdCxZmUJHrencQcCnoJaKbohhMLEqN3E+oBSpsftLQgDo5HAJx?=
 =?us-ascii?Q?6VaqWTfz2Y9cN106ZTHLwr2LgDuQqOjRQ9GC8vfVSI68jOjND3vVtL41znuj?=
 =?us-ascii?Q?WEyd8jR9PTKsBnTVdH2fASBt1K0oTtQApzG6cA1UPvzQ7v6pbosHFgCdv/oy?=
 =?us-ascii?Q?PUoBIecGkj1LhbbxnZJ/HBmnb7ArfFgHhVs9sAfZAPVEwa2iJ5ACYnxH3rrW?=
 =?us-ascii?Q?EvWTYzo6hXXhVuPTOviaZcXVGwy+vgSA1CAAOR2OjPbHWENIn7HUVsGB9T9K?=
 =?us-ascii?Q?+uPlB3hQNSHKRZPv2js7wZ2LQYQgKOudnvMBTH9rHCfZDWGgBvnQEdrUawXH?=
 =?us-ascii?Q?J1B3J45/SzWNPNGW0n8dZXe3kpMKy5ie92orpCivH+0ydX6BX2+igOtKHUbR?=
 =?us-ascii?Q?n2fxcKw74qdTJSAP4B3mmFSKUwCTDPkRdEjXLjGcThyWwf5wwug/DpK3Url/?=
 =?us-ascii?Q?S2HdD5yFQsFOPP0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GB/4czoPV0dSoX/Ibs1E8j5ojRZlJAEn56tMLOIKvQAVLvePLdXWPeGPgrn5?=
 =?us-ascii?Q?P//X2N87h7f6zFyynPVfbo0P571RP8SLD4yjlePzrgkT9nIpw1QisdZIQ0sc?=
 =?us-ascii?Q?b7vDycvblPs0bv7V8XHznMCEgwbs204LuzUwn8R94s0BUFSHBghme8qOP3LU?=
 =?us-ascii?Q?2E1gcaMV32loXdREyExgN1ygamhmSnBpjHtlT+cz6UWd17HyMpZ5ZroD/bXd?=
 =?us-ascii?Q?AbkKbKR7AUZye/E5yJpnMtgrT9p93Wk21Evv7lz5ZeOKzDtRm2fxmZg0SAHh?=
 =?us-ascii?Q?UBA5BCBiePihXS1sC4aadzzcRIEUPGAxYm6wvjvrjTCr9x5J/cN3Hie9UfI8?=
 =?us-ascii?Q?LOMi3lbMQbkQ6ahjfs+IYjhZqRIAVAa522/kZGE0OIvUWiQG8hm6YD0X7tvm?=
 =?us-ascii?Q?PgAkcqmONoEm58y4KhWVDA6TsXcBQo1NKP5WIcA0T7y5j/YZIy/t31BwZgK8?=
 =?us-ascii?Q?Fe8yIb4W9czT1YRPYRE6hkrzju/XcAkagOZ0URvBfm9jMOLSs7JFkBVQJEH/?=
 =?us-ascii?Q?bu5ANtfmqPvDXufoVvJfink9GhoJlZuO66BXHaaGlOkkSAqtiQF7FcvrE53o?=
 =?us-ascii?Q?yNCxWHycO9yxs6yIaLG5HaPPjpaA5P2wII/A6cuDxRLGfL2eLKRUjqtX+1Ym?=
 =?us-ascii?Q?fb74XXOFPlVLnfXjzfHCWIyHm2C+owalJcizxfkHVkRRc5z4Rdq+r35kzm8p?=
 =?us-ascii?Q?QQAg00D0X5hLpZJWIINCYor/mBum5mTkWZsNizURpcAZ/yTAkdgpp1eQvJlo?=
 =?us-ascii?Q?tAW83ScaIZ8CA8s5epy5+3PiPmJiwRIyd7ZX9BjmoyWu5o3qhwqXfU/REbjf?=
 =?us-ascii?Q?JZuEbRdgbqrJC+SabSwzFt3/kIctWui5AgkylnvTrJ/s6Oaj6acTSe70ruNk?=
 =?us-ascii?Q?v50UlbnU+WpEmFchMOuAnBQDX40Tv7tHUcJppq5R9gVPKlzAG6tFVoureUO2?=
 =?us-ascii?Q?3J3pBxeLnQSoWioC5i7+nl8mjusWxzwW1xlMJT1LxtSyGxRmmNmex95Kyhtx?=
 =?us-ascii?Q?AHcrSRo4Ol2VQiH6d1YlmKbY2MP1pMfkrUKpa3b5ymI+sQ/n6Zrm4ftUV5aT?=
 =?us-ascii?Q?fnM4BBmpYfCVfwiD8PR7DFSRpjcHd/VD70xMylQkT0ymXR2/hKOtV/eO4/1F?=
 =?us-ascii?Q?BfwlvCJw629qxbiFdfU/37+rjNGhFUNU8SCHgDvtTxBMu0KhVzOk9KSFzdgs?=
 =?us-ascii?Q?yhFDmUgIhsFxIAjNbFxGh/Pf8oLCS6640LJFvFWSzc2AE6jA5/VvF9fnp/IM?=
 =?us-ascii?Q?/RiT9ZO7w6BTQs/mIvkkhFfa00+LW9AJ8jvEeFdGbOIrkMhatcS1rlIx9Y2H?=
 =?us-ascii?Q?N7I5eGjMoLiuRfqUmgXTssmmARfmIrAyKM9rwTXf2Y5obCSRQfK7Jlibbn1w?=
 =?us-ascii?Q?zzEqQovIkE+4ccJPvOmXC0V6qcXkDZzKNmzokQXiJUZq0NTS1RzOVFQmHmI1?=
 =?us-ascii?Q?9nE57HT2s+tjEZjgZnqTMeuuwFb3U2+PWkqcz36eM3T+wq0LaHcaa9q74gdI?=
 =?us-ascii?Q?XU/0TnI3q56wENCoWWe4mR8xF5oOK3TCohT6F3n7Zcw51odXhSzWOaewDxC3?=
 =?us-ascii?Q?yueesdVJHWlkrfP89dlMr70Cnjlj6QjgJWUaB6H0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36fc467-f7fe-4111-872a-08ddae941e8c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 18:15:34.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uY0he9spWuWn7ghFgZkxurvH4X+olr/EdoUXKmpEsf/BVZeyImeWPRB5XtpJV0JZs10ecf98HnHXrI8K9nVWvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7845

On Wed, Jun 18, 2025 at 02:53:18PM +0800, Xiaolei Wang wrote:
> When num_parents is 4, __clk_register() occurs an out-of-bounds
> when accessing parent_names member. Use ARRAY_SIZE() instead of
> hardcode number here.
>
>  BUG: KASAN: global-out-of-bounds in __clk_register+0x1844/0x20d8
>  Read of size 8 at addr ffff800086988e78 by task kworker/u24:3/59
>   Hardware name: NXP i.MX95 19X19 board (DT)
>   Workqueue: events_unbound deferred_probe_work_func
>   Call trace:
>     dump_backtrace+0x94/0xec
>     show_stack+0x18/0x24
>     dump_stack_lvl+0x8c/0xcc
>     print_report+0x398/0x5fc
>     kasan_report+0xd4/0x114
>     __asan_report_load8_noabort+0x20/0x2c
>     __clk_register+0x1844/0x20d8
>     clk_hw_register+0x44/0x110
>     __clk_hw_register_mux+0x284/0x3a8
>     imx95_bc_probe+0x4f4/0xa70
>
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

You need cc stable.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v1:
>   https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250614112255.2838154-1-xiaolei.wang@windriver.com/
> v2:
>   Use ARRAY_SIZE() instead of hardcode number here.
>
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 25974947ad0c..cc2ee2be1819 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -219,11 +219,15 @@ static const struct imx95_blk_ctl_dev_data lvds_csr_dev_data = {
>  	.clk_reg_offset = 0,
>  };
>
> +static const char * const disp_engine_parents[] = {
> +	"videopll1", "dsi_pll", "ldb_pll_div7"
> +};
> +
>  static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>  	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
>  		.name = "disp_engine0_sel",
> -		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
> -		.num_parents = 4,
> +		.parent_names = disp_engine_parents,
> +		.num_parents = ARRAY_SIZE(disp_engine_parents),
>  		.reg = 0,
>  		.bit_idx = 0,
>  		.bit_width = 2,
> @@ -232,8 +236,8 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>  	},
>  	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
>  		.name = "disp_engine1_sel",
> -		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
> -		.num_parents = 4,
> +		.parent_names = disp_engine_parents,
> +		.num_parents = ARRAY_SIZE(disp_engine_parents),
>  		.reg = 0,
>  		.bit_idx = 2,
>  		.bit_width = 2,
> --
> 2.43.0
>
