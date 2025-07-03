Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963E31AAA1C;
	Thu,  3 Jul 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552751; cv=fail; b=cJWeJk/u6QNG99qLVmqfuaB+lbJZ8LUs/9lJV0SCFqcaeyN0wCe/AwQ3rAsOksp6svHxgFlYTwi6jhDwgQj2wHlzqv5cKuPROZtBFyZNiX6SPwLE1K8Kr44j0rGKTDeOZHpZhmjrwpebAzLvbug2KIabP9o13FIOCH0rGF2XU/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552751; c=relaxed/simple;
	bh=0d5josAXWAhlbg7UmZazyxA9k5UhpWrr6tVibBz0caY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LQ/dqr2ueGI2RufD6QqCwIUbzSk5lHLfKT1a1FTy+Ig1iE0P6fhjN1kG4k5eEHh4G5Kv2oRUAufWERBKTXqeZEhhv4AYLXbhp2jn+SOSm86jPd4jviVuxAWXJDpMLfkUs8Oz8/59vaa9BI5lUdtF9fTSbOr2QbqbsCs3Zw8gDLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NsLRCghH; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NsLRCghH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eD5zZEE/O8tlBj75Q6VLg+do+2S/E3s13gfLExxQIYKIWFCiqUGpfwSRbtxn45a0FD7Rq51HnWldlF/G5udottfK6kXGLo56+2SrOl9AVmcpMbBJeFdMc9/EEqYZ3Hm6WxIyNQT37QuDzGfl9Rmz/CzEzcOHFC8JwkHsC7tLlcWT2YQtG8dzvjde4852S8fEeyDooapo6UUJ74csfDuafZtvg9MFNfIu1UlcFSqhdMFYPX6T2bYuD0hVsER03DQs1/uDAOvrsXqHoxHX2imNEQRSa4XLEwNmV5Y33dTx18iCF8IiMr9+MLKdSgZTzI61NJBsJWzFYfPG0g6n+sWHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHKcldLfB+Xu1KMhY7zi99ECR4WmVylOfwj93fzflVA=;
 b=W3fwjOeBO9H9gjNki6PKGXEbLNwGHcZfwT2C0FtCBy753EK6+BB4KDrq7lknU3VuqVJud0KHu0T0yXLmtjKfSxZXy/kY6cFOqyh4yU2i2Iln1sNGdfJFfAtdkT6trd4tl8e8ljwXKxqV8K7VRwRoSlpzIlriuoGn+rvWNimravfznlC0isI74l3O0JoEllPVB1kgj2GJgLkcTxU4kaaH4/KUD2HmxIcwkKbQGbY0ixNbGnPJStDm682IH3FnhEZXObj3YT6/w3Q62MSZoCJdE36S9fq8haBd2ircXfeBISlcS6K21pAq59sZ4wOe5+uFrNKx+4z2Njh5bRn+B6lHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHKcldLfB+Xu1KMhY7zi99ECR4WmVylOfwj93fzflVA=;
 b=NsLRCghHlUXcbq97vaZ3j5Qgww2fHH9wEATolFVwtD/ClKvE+j49z5WG1smcjHIqziJF3crpxJrY5m2NDbVx+ZbUgSzISuDXk+sJ5UI8Htj1MHq/9Kz4R+t+vFwNLiUVTGKl2muJaCkrncLOW/DUvxYjPaSDZ/P5c1jHiw6aB5Z9QRl7/YFT3mpEvuajtYY9CqDOZaCOj53WQHV+2a78MCHnWI+6H67DjDwcj2EmRM0ytH9axTthyLYyaF+buQuEa8ckQcXUw2D3u0S+fnh2ROmqk6XuTMF0lTVz3eBQynYD6vd1WUBK3lBdF1N5bT6yyjVMFjuLnN8n7JHstttNpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7717.eurprd04.prod.outlook.com (2603:10a6:20b:292::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 14:25:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 14:25:46 +0000
Date: Thu, 3 Jul 2025 10:25:40 -0400
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
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Sandor Yu <Sandor.yu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 3/5] clk: imx95-blk-ctl: Rename lvds and displaymix
 csr blk
Message-ID: <aGaS5NU/HwpHJX18@lizhi-Precision-Tower-5810>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
X-ClientProxiedBy: AS4P190CA0022.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8ed6cf-12cd-436f-b602-08ddba3d804f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I9ayc89NYMjDUO8QZLc0ZfrGf50FR1xEIdP6OvDNjpPBjtuRo/tfAc1zZr7W?=
 =?us-ascii?Q?aZcxEbLn02YN2oOZEUbGv318XdrdAtEED5kHOAC9OH1O38CPlLGgY635/zts?=
 =?us-ascii?Q?cLim33nU1SjpZUmu7GL9Si83WF08qkJdjqU6XZq/gbGka8NuB3C9amiXiPVr?=
 =?us-ascii?Q?vgoh6MnhdyGZfQqujuCn0muoErwshYTKDORzbn6DPRtim+IDiM1hVuaTI2DF?=
 =?us-ascii?Q?sqoPpKoozZsuryhoNT24dZr+MokfP1oefTOipUuKksUXD1nN1sQjiSV+8enQ?=
 =?us-ascii?Q?9grN2HGPKihUigjdX/XsiHOqEpwYUl3223si3u+GQT3Jrs7g8aaUZx8Kd93s?=
 =?us-ascii?Q?kX8d+6xl5bVhAZBBgNrJIa9hZVzsJ5VyMykfbM2xL+JUGvTIA/Fbvz5DBwCd?=
 =?us-ascii?Q?O9ktPPFyUX6hvCHvJWwLGrfSRsJIqFoPpghjCndVuHRm7JqdG0jaQ6e59LVg?=
 =?us-ascii?Q?tLRV6JLkXqrt+Pce41bpeNh5/r5oT2Fm6vnjLSd+pzze2Cp/PGAt36I+Ms4L?=
 =?us-ascii?Q?mIE9rPUpra59I5EiNxlHsQpfIhvAkqlTeTn/K17B7VcS952nw5VjSL6zsuee?=
 =?us-ascii?Q?9FcsHDEP555bv3NaftMxfZuJPIa0yhOffyt9RmygqUtvqf9QzDWEnwcVB5ms?=
 =?us-ascii?Q?uVp6sQ5Q6WUa+BLp0/kC5B9dYPupdFAoqID7SfeGnrDLJ55HwjKXXM3WtuJL?=
 =?us-ascii?Q?C5tCmvxLUl3Y9KoazF3+2TgG+K6tzPOk6XktZIasjqcN1SidipEjNBHSSi0l?=
 =?us-ascii?Q?FGwt7A7zFOOxkQDDyHp9Jj8vvAjZNA4Ci6iyEK8P3BJHg0nXqT4hcI3wKrfO?=
 =?us-ascii?Q?1CjmWxdkLPjtKf3IFACYVK7Z4ciHCVa6aJuWHlwansMKXnayOl7kMvENcGlq?=
 =?us-ascii?Q?kbRaGauy4SY7HGOl30YKmGJzRslY8k/fK7h6VeKVwRJo7fokHULwe1TmtDQi?=
 =?us-ascii?Q?aCAFqczo7Vj8KnT2tW0Z9B9b8T5zYcMGbEujXYjlIyG1jmEGRzS2tv44YGx2?=
 =?us-ascii?Q?r6Aaam+UMowjon+MOE3GGi5OZUiIs2RAVwCXkA4L1aXplaNNz6VCEU4FkPcS?=
 =?us-ascii?Q?+SHDKnhnNl+KDWyMOtcn+5mStk6Z9xUFQmZyWZ778eLP5euv3UijlJjM2gAe?=
 =?us-ascii?Q?NMQ2mNIj/qFn3xFWpUmqyhJMuVKxz4a7OD1Rr/B46hIl7VnTxr0mCiSi5GCJ?=
 =?us-ascii?Q?K6YGjYJX5bFGZ1SUYsKHblu5bnxx+G8SV12TaxV3+wR/xggTk/hYOJe+lOlE?=
 =?us-ascii?Q?Dgw56LLoAgFCU5rGzyci9JlCCxaybQQ7XY1YJKvWWw93Gv/Cl7yk/IQJvtFJ?=
 =?us-ascii?Q?rMpMaIMvQNO89MPs82fgwDPlRV+jwKs3IysesE4lyD/LNRDTwlQ4LeoEakSu?=
 =?us-ascii?Q?Tf1nt51bJBP7udBy80uAw6Hhj5VAtkUaH8WwNuGJoNg5XTYsJE1bNNDc8wgY?=
 =?us-ascii?Q?J+nim4QfoctuR7gtfTx4PaxKCZK/J9g8EnBwWW87v0vcefYhFChBQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bmp+K7SdsYilJ8fOZvaQ1NOAZGABBnVB48RoNqYveHbhveEMuRrg22V+/srY?=
 =?us-ascii?Q?DBS5eEmiXJ+xDMcAclQefzJzF0P2ZOL+9NFsmhHeKRGFliezOXrPYxWAxvoj?=
 =?us-ascii?Q?2TUvbcXXVJhydGuaJSclFH5gp6GT5HMQeVzFllVKWDytJnhmhz0NRrc9DRTd?=
 =?us-ascii?Q?udipgPOnPMIiFI6KscM1m41D76FlW9BVLS3It0p6pyo9HcO27/6HYtGGN64p?=
 =?us-ascii?Q?DKEFUTdLhLjMIo612iKZ7BCviLo8uA7/0cQ0Oa8rdZxhtfqvuiipPNAGj2XZ?=
 =?us-ascii?Q?JmiIgvM0/VVBSNmHFrqKiD46llm/49p/M09GzhZ9kDWOmHesTuTtrUAd3l0F?=
 =?us-ascii?Q?Aig8c06Db8+geSE65OBlyqtNyPRAHyeMIvFdcgptodly+D4k2mogjuSbE8R7?=
 =?us-ascii?Q?KLcE95GY3H0cj4mq/GsGLxJ063FW9Gfn5pHJT8tIcKgDNA/WzJWT5oCg2ufC?=
 =?us-ascii?Q?7fw9dmKdTlexLXuT4c4xHiRI2kEpjeDIVzGoEzlpf1M/phVO5CYQueL4Mvyc?=
 =?us-ascii?Q?8pMfbgt5v/ipbgs6ULOtJWBSKJzf8Xeog6lz4SEzGfvasc/dvQZI2XIIlnSk?=
 =?us-ascii?Q?myAv+L3jOHSeyHh8er+WIL8ANIrSVL4rsNxPYOnt67WzjqTQsqmZInoSics6?=
 =?us-ascii?Q?LxLhTBSOj2bDNDwWi6ogb3wX1RbpcLgbNa6nfNdfjGUZX81Tx4G/kUakJTp1?=
 =?us-ascii?Q?eeG6JMSzp4h0nYnCdqYva46Cag7m6/ZcCvUKy6YkcXE8xpiwSzdcUH5fIhoW?=
 =?us-ascii?Q?XX5gu6ECX/lPfsbFXa8Dhq0FvFL2FMStovcSdumkRIVuQHwdZJ8jPhNTLAxe?=
 =?us-ascii?Q?9DyXm7BvXO9wfhnDYH4RjtXkB908LeEFWY+EtCX9MekbXiNTDG1+4dlfcxnn?=
 =?us-ascii?Q?6G43qk2q5cwxa1tCUjPx/SVg4/4N5PegaTEMs4kldhKa6gylXtEHIa0XRYb3?=
 =?us-ascii?Q?xOOUKZ2UstzVemLmCoZSQrOWS9Zhn2NjW/IjaX3vaT0x0AKRPTafYAM2BkFF?=
 =?us-ascii?Q?wC2Z6+062srYIzb1pkjiEjUsHnr9LJyanY7fEwWld7iZFEARoM/ag/P94Z/H?=
 =?us-ascii?Q?BYZXj6swHTwDfOnMXICKAbm1dJOUKLJwZxuu8bg6SoQ1B4V1HNmu00m13d/x?=
 =?us-ascii?Q?MnwEv06Ss9zE5n4SsFJpGxim3PcnxH/JkrfUJVET3F+iKn7eBp5M6ctXfEBc?=
 =?us-ascii?Q?WNVzmxXEyR6MNRXii4bfOaxGbv/a/4NV6r1lFwsMN9Beynn+bAeGhByfhaMh?=
 =?us-ascii?Q?8QE5RxH4ozMyV0NPcYT1ctbnVL5G/ySQosQ+a1oZvKLVHTnQsI84vxP/zrBr?=
 =?us-ascii?Q?ot0Me3xWwAHTMS8FjSlGeCdWKZ27ty3+Wz8BhdOG/WMZdzfIP3qz26MuvMXe?=
 =?us-ascii?Q?fBq5IeNHZhWUjQJeqO0ppS/FxCq8ToDwj+aQ5bw826A/NLPilHcbgH9tPt/U?=
 =?us-ascii?Q?Xh1mtAT3QeNUgVzd7e3lgYofnrzdQYRiVCBRwBqGzd2L/dg2wXglm1usykDI?=
 =?us-ascii?Q?Ts1O1F3MN6+CANGw6EkSFKlUTWO/ZJl+cQS6NR4WtxB/GWsJK6V4vk160cI2?=
 =?us-ascii?Q?GDt6hN2azSxrrRFKTFUWeh4QFhBhAocsu3eZS6Pe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8ed6cf-12cd-436f-b602-08ddba3d804f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:25:46.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4epdQ4mACdcc8eNVqm5vQl2F58aWxZlcb+AHR72l21zRfogr5sI4z0C8Oy1eUSHcsXHhNXifyL8e4MSd1fRksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7717

On Thu, Jul 03, 2025 at 11:40:22AM +0800, Peng Fan wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
>
> Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
> support for i.MX943.
>
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 86bdcd21753102b7d160288e7b69bf73da5a5706..828ee0a81ff62c6e4f61eef350b9073f19f5351f 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -156,7 +156,7 @@ static const struct imx95_blk_ctl_dev_data camblk_dev_data = {
>  	.clk_reg_offset = 0,
>  };
>
> -static const struct imx95_blk_ctl_clk_dev_data lvds_clk_dev_data[] = {
> +static const struct imx95_blk_ctl_clk_dev_data imx95_lvds_clk_dev_data[] = {
>  	[IMX95_CLK_DISPMIX_LVDS_PHY_DIV] = {
>  		.name = "ldb_phy_div",
>  		.parent_names = (const char *[]){ "ldbpll", },
> @@ -213,21 +213,21 @@ static const struct imx95_blk_ctl_clk_dev_data lvds_clk_dev_data[] = {
>  	},
>  };
>
> -static const struct imx95_blk_ctl_dev_data lvds_csr_dev_data = {
> -	.num_clks = ARRAY_SIZE(lvds_clk_dev_data),
> -	.clk_dev_data = lvds_clk_dev_data,
> +static const struct imx95_blk_ctl_dev_data imx95_lvds_csr_dev_data = {
> +	.num_clks = ARRAY_SIZE(imx95_lvds_clk_dev_data),
> +	.clk_dev_data = imx95_lvds_clk_dev_data,
>  	.clk_reg_offset = 0,
>  };
>
> -static const char * const disp_engine_parents[] = {
> +static const char * const imx95_disp_engine_parents[] = {
>  	"videopll1", "dsi_pll", "ldb_pll_div7"
>  };
>
> -static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
> +static const struct imx95_blk_ctl_clk_dev_data imx95_dispmix_csr_clk_dev_data[] = {
>  	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
>  		.name = "disp_engine0_sel",
> -		.parent_names = disp_engine_parents,
> -		.num_parents = ARRAY_SIZE(disp_engine_parents),
> +		.parent_names = imx95_disp_engine_parents,
> +		.num_parents = ARRAY_SIZE(imx95_disp_engine_parents),
>  		.reg = 0,
>  		.bit_idx = 0,
>  		.bit_width = 2,
> @@ -236,8 +236,8 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>  	},
>  	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
>  		.name = "disp_engine1_sel",
> -		.parent_names = disp_engine_parents,
> -		.num_parents = ARRAY_SIZE(disp_engine_parents),
> +		.parent_names = imx95_disp_engine_parents,
> +		.num_parents = ARRAY_SIZE(imx95_disp_engine_parents),
>  		.reg = 0,
>  		.bit_idx = 2,
>  		.bit_width = 2,
> @@ -246,9 +246,9 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
>  	}
>  };
>
> -static const struct imx95_blk_ctl_dev_data dispmix_csr_dev_data = {
> -	.num_clks = ARRAY_SIZE(dispmix_csr_clk_dev_data),
> -	.clk_dev_data = dispmix_csr_clk_dev_data,
> +static const struct imx95_blk_ctl_dev_data imx95_dispmix_csr_dev_data = {
> +	.num_clks = ARRAY_SIZE(imx95_dispmix_csr_clk_dev_data),
> +	.clk_dev_data = imx95_dispmix_csr_clk_dev_data,
>  	.clk_reg_offset = 0,
>  };
>
> @@ -469,8 +469,8 @@ static const struct dev_pm_ops imx95_bc_pm_ops = {
>  static const struct of_device_id imx95_bc_of_match[] = {
>  	{ .compatible = "nxp,imx95-camera-csr", .data = &camblk_dev_data },
>  	{ .compatible = "nxp,imx95-display-master-csr", },
> -	{ .compatible = "nxp,imx95-lvds-csr", .data = &lvds_csr_dev_data },
> -	{ .compatible = "nxp,imx95-display-csr", .data = &dispmix_csr_dev_data },
> +	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
> +	{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },

You touch this two lines, can you keep it as order

{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },
{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },

Frank

>  	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
>  	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
>  	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},
>
> --
> 2.37.1
>
