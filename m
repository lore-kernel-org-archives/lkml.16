Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C31D9346;
	Mon, 16 Jun 2025 19:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750101874; cv=fail; b=RFkVoRDHubFz8yV4Q0Yu79ADdoIwRkdJt9FX9Khq3GcwgoIkOcrczkNf2DAek0ZXBjgBTgBzQoQ92yIuNH0VYpw9hrKNXssG0DwoGD/WkIMOQ9id0FxcNSFdN/nRT6v9MEiSQUAizcSLN3iYTojUt5RPFKcAlQjDaiXGkY5jzc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750101874; c=relaxed/simple;
	bh=T9tyTFZpVXY6zdDxpw/yi/Fq3OMWa05gXcNsFD7noHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rd6WHqhe0iF4huC54T++TGN9QOBp4S08fhSCcoqTApTgNF/FppRBtsLydaZb5dpE33Ka8uff9CAYcwy8IK3klkvXHwnyKLsMBuRs3gVUsjo/OC+4zKiR77tDMWiqssqXxGnszmUqZV5WESCzaThnz+usmCd+Pw1hLLgWbjo9I0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iUjG+VmM; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iUjG+VmM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q50i5MBlBkidG9zT9fw5Wr65hRYS6eMzozmapzyDlM+jWPDzUdZcbfSXQgAwnyEpeNtCzU3+Fe20HOQG15kp8+fASYGsZaBfonNjmYIBN+4wpp60cxM7MflKP5dSpDNUsPOn6ucf4+uEqG090168vNsRNACGKSkvD/NB5oLFeJyggoDz1oxseY9njCeLJSyey5GbgjSs9NiMtQaZlDI1Rd1CLk0HVjYbsaGn25OfE7zafRAJLn1+rAbZy6yd8mOqQpEZ2v/9EuVSfZ7uY/XoI3mcKywE4Q35UOMsoEkA76mPMlImvrfISm8OaG6IyHdz1SqqeTkkUyRmWkBRYehD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iVe6b+WvKvabfCUceXG6WzA9lhwY3YrMb04Wn7U1xI=;
 b=Shu+chq9vgB3Jnzk3qna5mdLdcI+U5o6FXNoziWb2XfcYJ1KUsH+EbDSuFKVew98czdINQbLRsMmJHa/P8RTA9uaCC8NagPYLPoGNoPmPBmozWvwOTH+LF/V/cJyq+aaHpN9Xsou5v7ix9z1pbjYiLc+13avagwB76Ba0YevhDAvA4xgBh04uKDtyBRm9f59sOhRCmHphRahFscteCAz9F14bbB/HqTwjAZ2YZrCma0/6ms4/diiyQTKqW9LYoFc5E6vr/AE9qa9TOGP2TpDEkMjZAzDSAAICfwnlTZkXsqkXZ+jB3eEgUTrl3jJbusWpqRHMnarJFBrxIszTDG5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iVe6b+WvKvabfCUceXG6WzA9lhwY3YrMb04Wn7U1xI=;
 b=iUjG+VmMN/S/Li3G9bhgpE6E7EZT8XvYfxgjn0SPlZsSxDsfFUB6UPR4oZAKaF741R1SBzqSZJh7xwNj+vevyoA9Wk8GNTvsoybX8ocILAu8b+58Dy9sxVaqPWIc8NwFJT2w1ZN3+TPYFl03BfX1Gwp67S/BgEhF/wDHR8xBRVHPg445YiVnkPO5uVCn7VdJsPirafA69ZZQVTdI0QtNcrU8ykmudgy/xcY0SuD7fP6+r9B6lgVPwms6Wbb2SS2ujnGRsJUqOf4U502W12lNNIYkEdqd4hudSDOziK29nbaHhPbnpcGobF2t2LS0456PUwg/0LOKy4wmgLOQZaydIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 19:24:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:24:29 +0000
Date: Mon, 16 Jun 2025 15:24:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Fix an out-of-bounds access in
 dispmix_csr_clk_dev_data
Message-ID: <aFBvZUhCENuRoUtq@lizhi-Precision-Tower-5810>
References: <20250614112255.2838154-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614112255.2838154-1-xiaolei.wang@windriver.com>
X-ClientProxiedBy: PH8PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a041985-f612-4b1a-09c5-08ddad0b69f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bl+X5I6N+ouSujdwBQq6S1v0XP2bBLbmtU3NFbStbgqUkiFLk+6FNtMUefJe?=
 =?us-ascii?Q?weIoe81XUuvB7IsRo8hE8RI2QxxsVvZU5R7qC+/Nr22Pl4c9kgbe82WZC2u/?=
 =?us-ascii?Q?br+MoGnm3AqsPQn8gV8hIB8nHT5XYSDBHOOBJM+qMW0bZJWUftMIrlHbF+lP?=
 =?us-ascii?Q?HH5z1IQg6WaaqZOzj38KnmLGXTlvoMG96bgVsnQhs07QxAbWpR2hSbtOrqb4?=
 =?us-ascii?Q?erSwEdnvT7Dy2BinRzOUhgB/KlaVRbUueLghFYFVeT4Q4UqZtUFE5Bc1+NUW?=
 =?us-ascii?Q?AnmzZPbqXxjlpHabGLcQlKEKvAXzT5KG7nU3YGsXrnAAl+Uz0YUFcb8hcvVU?=
 =?us-ascii?Q?VDT7J/1hw35uzDAjbQzhFO+zgG6vVO8kpJHyVOIEZVfRi2lbO9xnVftoFYRj?=
 =?us-ascii?Q?n4KARuWWntj/hfyWgTwaDRXpDQkjIEy3958HqRk2BHWHrX1CrN1I+y9SHI7C?=
 =?us-ascii?Q?qJ6eEXX7WIwfmq85avYeNCZspsE+qR2g9Z/S+YVVPNbQWpHaqIIYWEILHiT0?=
 =?us-ascii?Q?Fh9Wg2zry6CafT8EPyLB+smM7dmqj6s/iFgseidt8F4dTnbqddOMXMOzwLDc?=
 =?us-ascii?Q?tJydPKKqrr0LcJ2pyPX5XOzAkpCHN3mEWA+x0btzHqTFmqsCoD9TPzDjGT3z?=
 =?us-ascii?Q?LWKQyT8mz9c1T8hGjwAVvsvdziDUD9BVvZmIyZL2b9MRn4cQJqCq1g9lQaC1?=
 =?us-ascii?Q?QPRryK9tcU6vJkNRmyM2zQy08puuODVyJJ5p45pHbE2SsTN3vspxYk8KETI1?=
 =?us-ascii?Q?pa52XABdeH90vpTuhFqHIHTeOd8XnB8iJpAfnouA7ChTAnLlzdOszcG0I7xW?=
 =?us-ascii?Q?AcckLyb0MwNxKlauR1Wnm93MXsNkvWyGcT27y498e9ixI56bmjd+IqAKGg6o?=
 =?us-ascii?Q?7Q3bXNFhdRfQpi+RtXNR5CVB6CdNy9Z6ARm5qoBgX+wXj/Ert2R2BbOcend9?=
 =?us-ascii?Q?fLuhFJ4LMUfiqP0Gl+D7gAL4M3NLQtCdCGMO61B5f3PAZSrqomCBu8ppxuIo?=
 =?us-ascii?Q?pi2ijcUZYN1HrGHl951OCTsGg1cmePFqjfJiHfNyaAqFhS1eYtLC9yoNe4g8?=
 =?us-ascii?Q?BAoo3/BXdIdGk96Yfv9ToVzl54H1fP7ktLn8AEws+3mbsXzwLYa/SxU1TItH?=
 =?us-ascii?Q?IS7/NxkDI+MJ/mTqw3HmJjLah2BihomjOgAjc2kGA8qKMWszLx+H43kuzXyD?=
 =?us-ascii?Q?xkjgwSTFidNaDhzEm0AWHZKjiN8+cm7Dja31WwA4LYxdx8Jb/MlH+1IhVlzU?=
 =?us-ascii?Q?7wiTvWGHBwsbfJnmi/a7FN6NH1JOuISBnWNZ10yNM4spsxqKk6lkWYV6UoPW?=
 =?us-ascii?Q?iymZAiS+jmth8XcCHJuJ2Go6NohyKLnJPZySUa+KyinUV23MmoYZKayQ9rRw?=
 =?us-ascii?Q?C9HopXucJ+wykA91bo2K8SBsT3/n78UjV6lr5ReQsCBHmcstLi3ValvSD0Q4?=
 =?us-ascii?Q?XIu8v8lmVEr9bQepy0UjbNaJMZofMlp3ABo2MbrpChei3eszvocsXg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D6wZ4Qg9kwJ9psxsPJZPX7zEBHLwgbMQHBU4Z5kXf6aH64VIFLKpAvf8fRgF?=
 =?us-ascii?Q?NV0kwbUd93MnEqXP589Ug4swYCCYck9eQADEdu61yGDt1iYsmVwPqJras+AK?=
 =?us-ascii?Q?bv2c53w5Jj4qTi6cqzkb/uXZUz5kRV8wbwFkQSMoJYBksqqDrdNIssjYI9gG?=
 =?us-ascii?Q?b3rGBgd3w8zgBXflF7EybuKh/8hlb9kEQ6drQIb0fIgjlQN2fxPWqXgMPk8k?=
 =?us-ascii?Q?bdYAzkorg4j/KHjYjoAvOztyiMpiHJ4NAEnAT5CdKmipylbADMQoTQGTE6v3?=
 =?us-ascii?Q?YkKkm5Wij0MsWLNzOY/hfcfKgM+75qzKwOGjtwhJdLb2cCTYfjO4FEX395/f?=
 =?us-ascii?Q?ICwO1YDLQ8xI2IilO4iGMu/xFVURCXihRyKmbQv05wJr6TJO4J+hFO0TUGjA?=
 =?us-ascii?Q?wFrxAnPNmVLSoUTyZOfi1v7LqVtU+pO1dmGp8Oy6XEeE99vfwJh1sPy1bhdF?=
 =?us-ascii?Q?OoowBmiJpZfqzyo1E0XmrV0N2ziqmUyCrq/qidJBTS0kUqlyOmcjRJZrsVFB?=
 =?us-ascii?Q?viuMst5IVmykEbn4YHbXB7ICC3utqhazGBeckBI8BLBeCcAdhZQE5EcB2DO5?=
 =?us-ascii?Q?IxHcfmYHoJ0szsxzivjs+YfhKe7KaTiH2pJhQ4mlnbqjGWUzpBOwS2jAnwp/?=
 =?us-ascii?Q?8rsldeMV22NxmdOPphQem5gTPd2hVH0pffc5lXWXKOAnA/3cNyXJD2Csh/2A?=
 =?us-ascii?Q?5k0CqBcoLA/mBZOa5crantENGn7xoNdzR7QRORIfKFsBqv/BZRSwOqeDSjND?=
 =?us-ascii?Q?1WoBI0uoOy/nnytE3/usVjCzQdWvI2tIlwnDRAiZu23bhqLZtnWKWZ9afyFN?=
 =?us-ascii?Q?V+LrPiGdF0xMuvu7U+rjTEQr9ZDWt8hPSWLKPMYYGckxUI1ksL0WdH0Ath0h?=
 =?us-ascii?Q?5b4otXTPjqN7oBEXapYn1UoPx+X4Slygoa5dm6m2LsDfzBrx+q1yCq2uU41U?=
 =?us-ascii?Q?iz5XR+KG2rrxe227rue42R0lKxcCoRaxEy0S9YISpwx+2pI56S/LBhc5NhT5?=
 =?us-ascii?Q?LZS9/wLZrasHOYa+MsarW1rZpEhhyv3Y4rRf+hKUTD9zeGrmBdqoXX8HLyyU?=
 =?us-ascii?Q?etQnD5lUl+iljED4lnDXre+YXw5m/4B0K6UO/1pQnM4fSGzHESn2T5D78xtu?=
 =?us-ascii?Q?7HznUGzUxAiFn/mUq52YV9EkxTxLmxl8iySr1Dwk8HrjzFDFG7JXiPpl2k3j?=
 =?us-ascii?Q?MqIWdG4goGYMyM+V/f2LZPcSb48ZZDYtBLV3C9Cgy3vXZZIEsMq6hYR3eZhA?=
 =?us-ascii?Q?gD/dla05nCb7/TMqnCnSxHjT03mPEnjyya2yr0EIpetk+2AKJCjdL50vn29c?=
 =?us-ascii?Q?+5gMvuJ2tAMPdbkBnb/G1LLY+kPej4GSIu52UhzTpl2pc8U/+Ylot2acMyr8?=
 =?us-ascii?Q?m7wBt0cdu4tK/mubFpAGf8Vnp1huP4UfSyP7adep/GoWWFMVcmC+ZyXc3NZH?=
 =?us-ascii?Q?15cOp02xq8jQ+YHJTdu1GQjGserM8w8T9EeKYouaOSfDveqUHqSpc8JhEN+P?=
 =?us-ascii?Q?1ZRUmv27BCEYO+2YKniwGRuoGDVFxfA0MbXbl/ix2xB//VM3PYf9/JiXODO4?=
 =?us-ascii?Q?WUSX4+7hM1GOD5CZBhBqNbsNN8LgTb9EWPZylLKY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a041985-f612-4b1a-09c5-08ddad0b69f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:24:29.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yBe8FkKRDZoluVpzwydRpL5p6yPrnm15WhetTrcTXNtHqkquwd7qUS8nVsAve70ORxhk8rtzydn4+j7ZwBUGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8353

On Sat, Jun 14, 2025 at 07:22:55PM +0800, Xiaolei Wang wrote:
> When num_parents is 4, __clk_register() occurs an out-of-bounds
> when accessing parent_names member.
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
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 25974947ad0c..fd11932b12b3 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -223,7 +223,7 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>  	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
>  		.name = "disp_engine0_sel",
>  		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
> -		.num_parents = 4,
> +		.num_parents = 3,

Although this is simple fix, is it possible to change to

const char *parent[] = {"videopll1", "dsi_pll", "ldb_pll_div7"}
num_parents = ARRAY_SIZE(parent);

to avoid hardcode number here.

Frank

>  		.reg = 0,
>  		.bit_idx = 0,
>  		.bit_width = 2,
> @@ -233,7 +233,7 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>  	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
>  		.name = "disp_engine1_sel",
>  		.parent_names = (const char *[]){"videopll1", "dsi_pll", "ldb_pll_div7", },
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.reg = 0,
>  		.bit_idx = 2,
>  		.bit_width = 2,
> --
> 2.43.0
>
