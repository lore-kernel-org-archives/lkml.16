Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011012.outbound.protection.outlook.com [40.107.130.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8220D4F0;
	Wed, 28 May 2025 21:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748468430; cv=fail; b=JlXr6gawGP1CLZ3GuDKhD4gyWuUCthX/nceT8zK5jzTjsu5bHzdDaWxhNebV0fuX5m/S+kIHKLq/ZH1P5yRkkjL8JXEdHCTVt7jaq9dsL2KQDTXifOuEL57+ZRejWV8vwExPh2Z7FArvIZJF+cSj5B5jfGuqcoVv53spO1QvWOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748468430; c=relaxed/simple;
	bh=B6wgs7TtFyHh3moeKmn+0DYulrz9WLF1zgidHI0GZPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uEuwXll26oDx/EWC0aNjFge8YYiVQLR2NYFgIBtXM9auIha4eGJWERCDc4H4TheafZLARx5ToIQv/WkDX3Bl7zE1xFbO8cRUPN7ZJ7+sUG0Br4ZfvJJ+Fq+uBwzc8ylS48tvSlE6WSaXIgr9/p0a00ygq/FMrm4ior6tPNXBvnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ntHcVVbN; arc=fail smtp.client-ip=40.107.130.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ntHcVVbN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwXZuTNXeYf/CM6wBafQ6aEDlrUWt9Mp4S8qaw4tSpuNzx9QvxZi5bShL8BfzThDgE+aKr8lTEKIZODHWJMuUSMONwAj9ixOSppaNvfdq1Lr5a8X/76U5u0Fc6GmWNW1pXF0j0uTs9UH+DJ9l1yegAeXYe0XGKdDJZWpI3ODx34roaBud3NjhRT6A4UCMAAytacJTUaJTqkSidIWzvWfrp5WyaP5hD86OCDLDBA/am9mrBZPVYYw4DsJiPbG6UUv+8eurmOE1ktB5N0oDuyaX8azoeYStSLtcCzEERT0BKYbedOb55PeyE5J8ZFzGekP3/4RRd/tUQw4AsPYfZaijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBWn6Iuo1TneHanK9lhKXFOEDE1dfutTQEu7PTG1x2k=;
 b=OhE6bt/TdcjeNSd3vWjB7aQkBdcRfypdaOHn7wJM/cXzw0ek8dsEF7fGN+PXCGNjR6uVYcFANBhGP2R3farI+RmaNC/uZ04ImrDHkoK8ynJwz4yh0zfM8S/J2LlyUCmyXhYPn0OGYdVL0KQEdICxB/87eX+A5gvScjMo1fZj6Fk4xyUSiw7MSJKq7SSLTtLzFE5KUyCc5Z/uiTdO/S4CD7k8NmnnhThxQDGfKvwsSychw6Y+0k4xHBpJ+/eZMALcS3tbTygy5i0cddvYfG2ygZAE/4qVgQoBAcYbLsBrb7AiWbKctBUQDC5DsIYlVzEzhnLhfM4DCkS3R9svqp57ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBWn6Iuo1TneHanK9lhKXFOEDE1dfutTQEu7PTG1x2k=;
 b=ntHcVVbNcFaS6BA6IgO7zXwdPYBK5YgPiWHYDK29D6qxNoKa5siso2e/X+wg+ySHPWcJ4IBkLv94gPEkcuFuc2LePfe/V6hcu/bSjtf1MAjGXsw9G2nWOX4SddttTf9hYBItG6xpoQbDIPCQEdVo359uJ7CuVdd7HObH/NwKxbe/5sf7yo+vdgHGEmoMWHApP566fqR5OnhO0aEZ9G39DJabYQQJdCRChciwEfJvEzHVhYwrbrE8ksnqJHUT4qrKmK8b+48JlnQUqYx1SFLgZQ6x3N8BeTpdCw6eTxIiLmh4HzN0ya0pN59QqiHeQ9mzr89NMmuqq2ebVifeWsi9wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 28 May
 2025 21:40:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 21:40:26 +0000
Date: Wed, 28 May 2025 17:40:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fe40c5-d0e0-4ece-ba3c-08dd9e3041f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ipEmaicjd/fOKZ9riCg8m4E1FSDTpDByvU2lAFJcSAYbmgBePx9raNZtBAbK?=
 =?us-ascii?Q?Yn1NWY2eAIb5k2Mhe3Tr7WxVMDuNn2LRzWc6llVn5N0plxl1xzvmF7V1r5vx?=
 =?us-ascii?Q?nQB3i8bT900zP/P5gv01JDL650NFNk1KYmjrcLtuT0iJBIqASpo16gDAXSBC?=
 =?us-ascii?Q?BoDz5BYMq6OXDyMy84Nyb0yR19r6OOFfzW4mDWgRdJfvSZU7YbX/6TQkFmPc?=
 =?us-ascii?Q?ks8IxekClcNtPhdcFdvWxKb/LTSE2IHWaXz+jA+AiWPh5fDLDV66bg6oQdsK?=
 =?us-ascii?Q?tULbupWw+Inycilerh36nomyYPd8bYw44AvXoyc9MLVVS5TwLPPaWCUHDhsQ?=
 =?us-ascii?Q?OS1wH/Rlj53O4mGUJNyxNvOIwQjeStNcn1QtDHTSVkW4Bqqs4BpVlStMrRne?=
 =?us-ascii?Q?VGmZ74lbwIEqjO1QtoDk2mfEGdUWJqv4SMkRkoXO59N29XoFJDjyPzzIgrsL?=
 =?us-ascii?Q?xEuKMhdyjxXhhN5v6I+7QOGiu6NgQEDF1IDxEYqYey4LLz/vr5pTLU7CsCyt?=
 =?us-ascii?Q?L2WmBtWLG2xAm2CKPYYldfoFdbJAH1a/Ym8S178jr0oolsI0hbP8gcURmwBA?=
 =?us-ascii?Q?gx1cGGD7D+Ok2pHo9DtjajfJj7HaBIiuXLNKElh5fIaVQ8XnHqhqxlAm5D0d?=
 =?us-ascii?Q?hBE/7TBZrL/CKJppE+oxCvPUTTMHmaN2wlf4HwXBsWfFdC8PAwJ3SWLlrwaB?=
 =?us-ascii?Q?dYmTsb+gkOPvScDYMwwsRgBS+ICBUlssswh3BVCJExBhq3bSFoCWKMchdL1x?=
 =?us-ascii?Q?iIHNH7oBywOIpUhUM61T1mdZzc2jZfwScTVJcuWK8gm1RcpcYk5kt2rkmh7g?=
 =?us-ascii?Q?XUFTvs0H8bRqB5MxDdA7erNQw7OYFs7UHh5pITONdbNWPWLAD3UxYtkjp0e7?=
 =?us-ascii?Q?M890Y8sZ/kdIfKr2p4jvI3yRb6xsdr3qL8x7dvMCNBlop5DkfljCEXNoyb6z?=
 =?us-ascii?Q?SfYZxmCA28y5KkEbpvFO5zzbLlh1rGVoEVxTSaQWlZZ1/l6CP7DuIwwNK9ip?=
 =?us-ascii?Q?ABwAXeuWEwCzX4ErCjta9MDVk5zVJlRtgQyLWssCp0oEz3fIX/LSUfsrgFuj?=
 =?us-ascii?Q?UfhdWnOoi9HXIAvyZMxgxXJ2sfxyrDm7JJt67RltW7lu935he2nabZ/e8bE8?=
 =?us-ascii?Q?Xk+45fp3z82OaVniugB3lLpAE0J+1qVKare+NKVI9c1N2E3BY2+CX3A2b2cb?=
 =?us-ascii?Q?Iks2iCDz52VlCsrlltwF8eBCgR+Q0R9H/dDlbiie+IlgGgUi0dV47I233Vs6?=
 =?us-ascii?Q?QKPbp5qa8TUihK5vT3ev99EO2h1IwsZyb5Z8165WEZ580OzT+ZXfJR/pna2i?=
 =?us-ascii?Q?9k+3ICMCeoFz4HbQqQoZjBQi4S0jrVBP5AjiVZjPd+3hP7evrtK1ebb8iurZ?=
 =?us-ascii?Q?4xWfSefxl4HjVG91Vw70Zmpr0M86Ba68sbwBEkG511NyaWZoAPZa6Px7ygdn?=
 =?us-ascii?Q?A6eF6iu2IRDtkSTey5JPLp2N8sh7J5YX7z1O9YzZBLSAQTdDJzrdimM+0DE0?=
 =?us-ascii?Q?rGqqkhXJ/km/uVY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cyuoHKr1Gy0rUz3LubARIdWY09epvDdZhHNJ7CQ/HijNbmvaggeGu7rjK1G?=
 =?us-ascii?Q?PdFaMKWYkK0WaHatPC9Xp/zSRuUcgtM9nxLUfyF+e0zMRqmLRPXKSZMDolgB?=
 =?us-ascii?Q?3o9jFPsgWBRs/hgge+p2LIeTpeIwheg1HJRK0PQ/e4at2jFdbqvsBxXNSSet?=
 =?us-ascii?Q?t2HpnKIhtlq6URON5yzNJ3R4oOOKWmg5HSEUN/kDFCzLJiRymVfWchfJSZuC?=
 =?us-ascii?Q?TnEh05KwA5aZFiaje1OjrqE1sQSTUfSxgNBTvEKYmsKB/XK6oFU4UFSUXi8C?=
 =?us-ascii?Q?BPIsWBaMo2RiY2oxqKRazeyMS+Zf5L5Tpq4KmcHvGy0Wy8UB7vUPFN8vaznJ?=
 =?us-ascii?Q?SC88uqM+/iDHeCzT7t7PZB7Q2FBVN7qmFeNZLM3DmUwJVrQK8i0BxgrMKShJ?=
 =?us-ascii?Q?YomJQx7urBmmHQvqeuHEM97BAIhWXnHIWFGTWVAGhZaSJPPiUILRedJFC6Ar?=
 =?us-ascii?Q?+BKQT125etuJlclRIo1mCr9VA8dnMxfJpytcLspVmKJhDQbewm5+kr8FwxLc?=
 =?us-ascii?Q?gRIRpKYsaB8BSG5hkvjQ+PotcJZDqhKY/6faNCOSWUT+ciVWtp8oPKTa2fLC?=
 =?us-ascii?Q?E17hEV6Iq7VefrAYo9BDTY+h5WjCd0TNYaPvLL2r3K9uDji1odzxIty2SLpi?=
 =?us-ascii?Q?pp5rLpC4nwJ809Lv+8LaiMDVSmNOfA6lPnvtJsXaJIbLiG0Fs5dG1VJmHKAc?=
 =?us-ascii?Q?cFJt3UZ3r3vPt9Pu4g0i4IN67gwRrlm18mNg2a4TmltpyrwQ7MKCas3liNMg?=
 =?us-ascii?Q?j68ODJX+eBKTnISou0sRKWMca1IEQ4H4HPeG9gpAq396If6XzSibrPqW5KMw?=
 =?us-ascii?Q?MA0kKNcws7fa7d8AArW/R5qddFV2BOll7fe2qOQibfmlOAnTjLx+eh2R93dr?=
 =?us-ascii?Q?I34KU6nrxHFxB8drgf/vAR4kW6hccqcSXa8O90yGRI59Z9QvjiF1+zIUUSAo?=
 =?us-ascii?Q?XbtKQYxx40D35SVhrajW/jZ1JkhTL73ZmYPqHQ85dQEXBTq71+C+rtGmFwkt?=
 =?us-ascii?Q?kH1mAQcXGrdg6bj0n5i7nHu2S4kUCWSxm7f5XKbgnlU8nROxB0FIdG0c8u43?=
 =?us-ascii?Q?imL5r4F3sFh96yxz+ImVDVfJj3LnoGxRp+JapGZ4W20xT1W47sHKKX7063Ug?=
 =?us-ascii?Q?sY/NcwQCVi0hvM/rUTjmGQ35WgvIUQJsaPSP9383ebY/FgXnuxDkBHjNE1ae?=
 =?us-ascii?Q?fVlya95LWIIS2K1xU/Y17Fxey1iPjs/NJGTMoQGybTA4V8jXNfyOMTwUD4XL?=
 =?us-ascii?Q?NJVlx29fnOCuxQAc2Q+R0YcUY77YuWl+VzaeuEeYhz9oUpMbxXU9F8W4XICp?=
 =?us-ascii?Q?R83B2vs2UOqtHQQl0NSsJiE2nw7n+II+8y7iwPzdL4DT2EHrswEu08B1p8O/?=
 =?us-ascii?Q?GCrHgsSMeskgQsoiz6Q3A7srySyHH+s1TWFVAvtUODLTuY4deuziqlyRxtV4?=
 =?us-ascii?Q?DDo3HavRtKGSruOO5ctSzAdoMRO2JbHCgny7MzLLuIP823YsNc17gMvuDVa+?=
 =?us-ascii?Q?dVFwC9eXNRdpwJlSQMCMesseSGuWaO7795OcOb+DukermbqdsKX3BuwGHxdZ?=
 =?us-ascii?Q?zVqPCbDCH0IAgs/cMz3AuIbvdb7va7P3JoH+wGun?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fe40c5-d0e0-4ece-ba3c-08dd9e3041f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 21:40:26.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz0FEL+6p3u3Yo2WCEttFfzP0kDclJOpZGiDqzwHQiPjATT02wG3QsmB7/fsMVotX71IHkpaksxmnnQQBhPHBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

On Wed, May 28, 2025 at 10:57:39PM +0300, Dan Carpenter wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>
> Enable USB driver for the s32g3 USB device.
>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
>  drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index ce207f8566d5..d062399ce15e 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
>  	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
> +	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},

If it is same, suggest compatible string fallback to nxp,s32g2-usb

compatible = "nxp,s32g3-usb", "nxp,s32g2-usb".

Frank

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 43098a150e83..34fd26faa303 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -677,6 +677,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
>  	return usbmisc_s32g_init(data, S32G_UCMALLBE);
>  }
>
> +static int usbmisc_s32g3_init(struct imx_usbmisc_data *data)
> +{
> +	return usbmisc_s32g_init(data, 0);
> +}
> +
>  static int usbmisc_imx7d_set_wakeup
>  	(struct imx_usbmisc_data *data, bool enabled)
>  {
> @@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
>  	.flags = REINIT_DURING_RESUME,
>  };
>
> +static const struct usbmisc_ops s32g3_usbmisc_ops = {
> +	.init = usbmisc_s32g3_init,
> +	.set_wakeup = usbmisc_s32g_set_wakeup,
> +	.flags = REINIT_DURING_RESUME,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1432,6 +1443,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  		.compatible = "nxp,s32g2-usbmisc",
>  		.data = &s32g2_usbmisc_ops,
>  	},
> +	{
> +		.compatible = "nxp,s32g3-usbmisc",
> +		.data = &s32g3_usbmisc_ops,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> --
> 2.47.2
>
