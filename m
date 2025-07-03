Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012004.outbound.protection.outlook.com [52.101.71.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB12E9EAD;
	Thu,  3 Jul 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552624; cv=fail; b=g4t4Ty4TbPG/EmKhjX1fxBtrZS9oeeIrk+3e6B6dED7Xn5MwJsF/3IJD16oj4Vupag5uZpzP80eId2YCcpCl84JPuGiVTOoDMIwqD435/d83DSR01Q4TWdRPb1Ucx22YHkU+ZlRKWZhwneL2gkYQTdrr3J2jeXmFwDY13lbqZ+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552624; c=relaxed/simple;
	bh=xuyhlb/WRPFY73BoXBHtTdFf080C6Km6GQuoh4Icckg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=urd2Ciuq19SqXhggRfBRvGJQGjT8P5xR11gbR9BTmjiNjczRfHNp3sx3QZXsRmfzLdV7T1S7ihS4rBBoTMi0jXYpilJOwOYqaw5JhTrkZAia0KbArQkF3zknOPy7Rtc4Eht2t+Bb/HQzOTEGwB8s1eMrai1GUqmokanRGtQwlnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nFgQiXCq; arc=fail smtp.client-ip=52.101.71.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nFgQiXCq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFp936eOTo0KicNIIfCMGUKPlhBlEWLBpI1TCINp5hTNr0PRvuHNszEZBKDI2WmmdZwH4vzphyzzduEsoBQApNiF2dTmz/9LYyLPhZ8LWi3n51cLMMRK0OOy2ymbk/jWcglXPyQTXuugmDXUI2nHbjhdmjwVEwNt4FTtWP6dhDA9NxXxlx/+gU91jPh+Sxp4tFlHMhgbWeh/rVjQO0dL00aE7lEPMU41DgN+KFb0c0D2vKt74p0sukHDe/WW+b7mCLgOiWv57Sgo3wpA5J/Zbpb6apzt5ppvLk5/D22tuOcGvJeJb9trG35ro+6t/69Yd6d74C/gE/ayzRLWt1Gdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jdz41nPuTufqCforSCRC1izBtnm5JRMIQDvPSlzuonk=;
 b=aET2bm3vZ/2LMqoQuvP137xGXRGigPaDd6tyDuvZxNt+NdgNEb+cK2ft7FaIYOOT44yBoYXHnjFnVU2io/N7FEsdbK7PiP/wUhxUZLlFuqsSgX5IWDTfgfgE5TVWn3oHd+OMisTahcAuK8NBeAyeqHef8jJDCO3C11QnrxL7198ntQln7FFML0HvNlVhxpXC/sjMzjDT0D/l9BE1+KzkgIrY6DXVeEDU1c5rgwf+k5gvnqCgflF7rOezm1J1IqwEXppJLWd6ZC5FTv1wniEb05Szu0pPC+WZp05UGkWDjsWi/SA08iWSaW9R9V3QPZRNZXgbuH7SC2EiaaIT4jdKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jdz41nPuTufqCforSCRC1izBtnm5JRMIQDvPSlzuonk=;
 b=nFgQiXCqn1eVjK8DU9MRXCFPGlPa78ZPB/bu4rVWpAAmkNMugTsUk4/MvZnHTTJkXTSkBdE9EhnF2qbCGN50RxIUp9Ovo8FXitabGSCotSLIXfH7LpUSu60T1rILXWdDEcpho00zWAD4x2pZG5oCN3RyBOCRhXgQERybrP0omVhpOs8GYibH9fds4EPF6K5EVdRlBoAf9v6ri3XKpMFs824+WC4kMFr9Yg8SkwFboVun4SzDnZA6owdnbPjE/Mp9N/nt7XNF0IU7Xbf/pcHobxo/Lbg+wcHlj8DA59dSnMeuxoRqySvE2mL97o6MIWe1emWgqFm7p8eMy9f9VaDwXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB8058.eurprd04.prod.outlook.com (2603:10a6:10:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Thu, 3 Jul
 2025 14:23:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 14:23:38 +0000
Date: Thu, 3 Jul 2025 10:23:32 -0400
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
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 2/5] clk: imx95-blk-ctl: Fix synchronous abort
Message-ID: <aGaSUTDYNQgtLNaM@lizhi-Precision-Tower-5810>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
X-ClientProxiedBy: AM0PR06CA0123.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: c32874d6-5f0d-4f89-5f8e-08ddba3d33b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5BjKAH80wFR4nEH9KZWNZWppOS+zRdafNKtyfZBizoju8Kfcy3jQwAfh3vOS?=
 =?us-ascii?Q?Oi1pqvpOwOK2L/Sm+n6rBOWl98sI6qh4IN4Fsq5W3o+iT/FY9I+sSDM31+lO?=
 =?us-ascii?Q?DQM/PNYIuUVA3QEBVajKFuOqoVEacf7fqJXSRovCFwIFfITE/BOBPMOnwefZ?=
 =?us-ascii?Q?WaBqM2Cz5Eif07Socu2RxN8FWVlo/t21foySA9wybC6EEYcfIEige/yDjcFZ?=
 =?us-ascii?Q?IAJRfa0WVjOyR9qd1DmNQ6gTsaGxg+j44Rbc2uviniPPydT1XrA1HcAVFyiP?=
 =?us-ascii?Q?cVKl9qUnmsPgAbIEfyvjDFKG6g7zH8ubxd8aBRF1iKDmZc64Szn4gugs0Fi9?=
 =?us-ascii?Q?1n/RSpdmneBKd5koTcxP/+wGPAYMjNQcotWKZ7LnawNkt3fRHj/OyjHtcoUr?=
 =?us-ascii?Q?aZbQYyFrK28HvC5tYzeGl190SeFyQUKxAxG8tyy+JW7fFA/JaNjGmPcyhQsd?=
 =?us-ascii?Q?233WDPYjAvUltiGTZG80BVJi3U4/tIrDJLnk/SnhVSyt00KdsLSthVS35A4k?=
 =?us-ascii?Q?Qy/92TSTVbCZ/03FuBgJq1U5cKr7uo8fE2TKs3d6ET3madivMyayLVt7pRNw?=
 =?us-ascii?Q?KbOXoDwes924OJlsiGsrrLDllxXwKCUT7c9cqoKJgXOQdoeWf+VAyt64spp2?=
 =?us-ascii?Q?unLA7uaHIKrN/IlyBSumBAGbFMeXPtt2ifIax9UjWvjkbaTomucLZfqqS7cS?=
 =?us-ascii?Q?dTkJN6/yCczbQVPXrbv4bI+y5ioKHJL455zzeWnSv/VwS9VYbobpv3uzcmwC?=
 =?us-ascii?Q?TehY4b0hF/qO9v+atK0RRc9sTVb6Wc0CmiBnlVyHuwkbhCKxGdzUm7nDolzS?=
 =?us-ascii?Q?6kEV0DmUT3mLwZlNFfsBQNWinSmUiAk9g5d+ft5I2pfGevrSxzmdLGyeMUVb?=
 =?us-ascii?Q?PZP9mwXV3Qroi5CvB61cprrz57Vv2bs15kTaFQrTxVaFMQSTES9kM5Bj4Dvp?=
 =?us-ascii?Q?ySr2PfNJ9cC+U7FKsJ+fTnxuMhaFcFdO4V3wEFUOxLAQ6yDy/hV1/Lq0N78J?=
 =?us-ascii?Q?GPyK3pfERT8Pj1gzhqGKEb5R1J0Sn7xP9I1IBWCIDhM7toTzPgFFbz31ck0v?=
 =?us-ascii?Q?6XDH5FbhQBoyUUXCQasxeYmsvq8cubbMuvyawu04TeNv5VdwlFbmoNIfKvyu?=
 =?us-ascii?Q?QDkXmiIV7oQDxppLcnppzjFWWlWTni3e9r5b9Nbl2jqrFIh0suN1VfbRBS8d?=
 =?us-ascii?Q?zzJMqXMfHCIH4k+trqd8y8ai82se4hCtH1Tn18i7rlNlCsoU6qumx3j9r+wb?=
 =?us-ascii?Q?4a/gVpRjiOWv82Z0LhJTgsLncfaVfrgBraD636FwO7zCTEhEla0f5oWQ5itB?=
 =?us-ascii?Q?Vj2CE7NK2cLuSfzrczGZknLRArK1T9TR3RSL+wWFnA9h0PKPu3UvaDxnxPLr?=
 =?us-ascii?Q?vebneL5Kyiabi+IUfPC2HpH7OGBxZCNCg+72a3brdb9wLqZQfwdSwVKeia3f?=
 =?us-ascii?Q?7tkxbtO2K0pEVvUwtXBXfuzSm77XVMYiAY3OA/3NqH/3cikl7kniqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Ew0RBJsHwUo3k0uXndXqzPMAFY1UYY1PDaxp/fvXPiRj2qANHiUmk5WEdhJ?=
 =?us-ascii?Q?frhXO3BMLrSHCz2OJANWoT3MV4uMdou4ic8jM98U2j8UnPPqFgkAUyS3BjXe?=
 =?us-ascii?Q?RWwq6U1Z8UDohzBmgz31r52NYiRwmkGLZl63yFBVQh20i12ZLWjVfbgZvGsw?=
 =?us-ascii?Q?XD4Zbk92aZxjQbtp43OEHlXh7vTez0Sl94bdmF8eZXJ7CxRpZMueIHnuCHaE?=
 =?us-ascii?Q?2Kmx8lQ3GgcYq7BwXgyXG74w3oMdmeG4v/kcvj9B8bu2QQXuzr53DyKTyrcS?=
 =?us-ascii?Q?HHC6DsDeq/yuohpr6CX+f4tAMhg8esJfnWVNXy7hPXvgiP/qu+4KDQYLiAI4?=
 =?us-ascii?Q?D/Qk8pnO1mib/dc2g5RT6h+TgVIZNggQZfJDou8RQ9i2MNFXVW9WGiOuyXLr?=
 =?us-ascii?Q?QMA3EnvuP3G0Wo7oNFYUryIvhS9RJaIVWCz/blCbxEtdehuY/vl+/IFr9d2k?=
 =?us-ascii?Q?S0tmzNmkfrzTIHlYeCs3zx6FV2D8ZpFNkgOa37uhnA4gvO5ao01FdqBbD1AB?=
 =?us-ascii?Q?Fdz8zd6Zr8sF4U/An16lSNc4GDbTGNE8zZ691dKrGV1alA7LKiVaeIVCB8QP?=
 =?us-ascii?Q?Y2bResoUm3XAK3xjG0dICUZ8UTsQKi0D4WmQQ6XQj6wVIwDIOeNv0i84mr3D?=
 =?us-ascii?Q?uhBjfRsRFy7RI5h0oX8FvI5p0dvUfK5XgRPa71ICo8QVm7ON8D43Weeb8A4p?=
 =?us-ascii?Q?959RPgkN4qQLo77iJYokUA75VvGj70zPygGf5D2B1+RYuDs5oywNe+se+EWC?=
 =?us-ascii?Q?gPgqDSKJpL3Gp+D9XoVewxF/p87Gu8m02XB12g/loVsKwWtJzegqhc1lJ9uU?=
 =?us-ascii?Q?c5KUN8wAQrIEiE4BfmJzTOVY3SZ5t+ud8ItoFP3b38zKo2qg4Ps8JIKGRa6w?=
 =?us-ascii?Q?yGayorL75HAHpzmTOIjme0p0zvjTPVi+K0RdlPlibfxWMdcFKxH2BKuWNKzS?=
 =?us-ascii?Q?tmUjdolRQKJqntpOvurIFcXwaA7rAPJsI3qmvOuMEUysHNOEkGJvu38zNRuF?=
 =?us-ascii?Q?njx7rCMYgrWpqTuCDXYFQKZzzWycDdWg4Nlj3ceVT7RcBzcWjbwyE5lpjo0O?=
 =?us-ascii?Q?z9ZlKt2SSKsk0tVEOUab8JvGuumkS+cpF9shfisG9rvwcVB0xTOr57rrMh2Y?=
 =?us-ascii?Q?7EUEhGIgC8DqnKyZ7QzgzHZ86tP/3Qunm8nAkS313XyfeGPa9UHLtnkucAU5?=
 =?us-ascii?Q?xqHymdCZaT34QgbbogRnvGjzVuNw7aUKIfo/TrlMWIINGcsX1I1pvGGODNqX?=
 =?us-ascii?Q?vjU+GjfeoVsC2RHRwGmRzDZ5f+z4wThQued+bvU3VFSFMqJTfftvZpIAcjSK?=
 =?us-ascii?Q?FiEMCu014AL8qyLWJqVrlxLnQQ7/dcpJkfVbnbJau7gbWKryHNWrD8BuHbMM?=
 =?us-ascii?Q?WEyFOh+xYq5h/r5sQzUya6627AC7rSUi+z2Hso0CUli38y0z4RxZTr5sUoXJ?=
 =?us-ascii?Q?+rl0Tlkj5xxEAbjpMsTGNTIW2FIqHsqace32oPJE6t9xS/VN9HeqZ4bQc8nX?=
 =?us-ascii?Q?FF18qTwPNXQqb8tRPZeASWqOUwXlDuRS06+uDyb8Bzk8V8ov6tRzt1O2chNP?=
 =?us-ascii?Q?9u3+c+uGsgfJOJ/UDYM4xf6oSGJfgh8eXxavYxq0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32874d6-5f0d-4f89-5f8e-08ddba3d33b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:23:38.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgdzrcKlj+rLBgLrodUydjIOqACXufyjjrhItNSfuYXNXYpYpymriDnuT0qWKWIt5pKvLHHL9QOXysj1ehmjoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8058

On Thu, Jul 03, 2025 at 11:40:21AM +0800, Peng Fan wrote:
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>
> When enabling runtime PM for clock suppliers that also belong to a power
> domain, the following crash is thrown:
>
> ---
> Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_mux_get_parent+0x60/0x90
> lr : clk_core_reparent_orphans_nolock+0x58/0xd8
> Call trace:
>  clk_mux_get_parent+0x60/0x90
>  clk_core_reparent_orphans_nolock+0x58/0xd8
>  of_clk_add_hw_provider.part.0+0x90/0x100
>  of_clk_add_hw_provider+0x1c/0x38
>  imx95_bc_probe+0x2e0/0x3f0
>  platform_probe+0x70/0xd8
>
> Enabling runtime PM without explicitly resuming the device caused
> the power domain cut off after clk_register() is called. As a result,
> a crash happens when the clock hardware provider is added and attempts
> to access the BLK_CTL register
>
> Fix this by using devm_pm_runtime_enable() instead of pm_runtime_enable()
> and getting rid of the pm_runtime_disable() in the cleanup path.
>
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-imx95-blk-ctl.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index cc2ee2be18195f0e05e911bcb26e284b1a894244..86bdcd21753102b7d160288e7b69bf73da5a5706 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -342,8 +342,10 @@ static int imx95_bc_probe(struct platform_device *pdev)
>  	if (!clk_hw_data)
>  		return -ENOMEM;
>
> -	if (bc_data->rpm_enabled)
> -		pm_runtime_enable(&pdev->dev);
> +	if (bc_data->rpm_enabled) {
> +		devm_pm_runtime_enable(&pdev->dev);
> +		pm_runtime_resume_and_get(&pdev->dev);
> +	}
>
>  	clk_hw_data->num = bc_data->num_clks;
>  	hws = clk_hw_data->hws;
> @@ -383,8 +385,10 @@ static int imx95_bc_probe(struct platform_device *pdev)
>  		goto cleanup;
>  	}
>
> -	if (pm_runtime_enabled(bc->dev))
> +	if (pm_runtime_enabled(bc->dev)) {
> +		pm_runtime_put_sync(&pdev->dev);
>  		clk_disable_unprepare(bc->clk_apb);
> +	}
>
>  	return 0;
>
> @@ -395,9 +399,6 @@ static int imx95_bc_probe(struct platform_device *pdev)
>  		clk_hw_unregister(hws[i]);
>  	}
>
> -	if (bc_data->rpm_enabled)
> -		pm_runtime_disable(&pdev->dev);
> -
>  	return ret;
>  }
>
>
> --
> 2.37.1
>
