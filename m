Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E0019938D;
	Fri, 13 Jun 2025 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826419; cv=fail; b=JTywJY0X531u/L3GaqikbVEl3GuMnlAs70A9vNIANVY9vPJjtUBr9ym/bgT2ThkpXR+Hmglnlhv8ItmzEQZ1svnyc1VVRLbIX2x5wd5l8YzVZaQviH1ZAkQs7bARLRwkr/HIbECY+pK6jZKvs312q7iIz+gPtOBnOuMlKokeqS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826419; c=relaxed/simple;
	bh=lx0ya6OeCLJMQRyZKOIMd0SgKOHRzMOWy1jeOhEkv1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Au7DLlKWtn42PjtMpF0hKGvgaWcbKxH7EL/0jTnntQr+0XdlUuGLMHxS/PDoB9PgkP/KGiiEUU5UysaljueBazH7j4xx7neK7hdXApOT4YzHID8upvw2I8nSlz6ik398NJM9GTxfjoEj+IjoqkSF8gd0ErLKBW3WMn+k9Nm3dG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F4hJ/D7v; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F4hJ/D7v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5RxybD5qfJEv3EEGQ5QH0KzeK57z2Y2YJuOOaeGLne/cxur/hVc3DkxDWM2c65sEyI+pfNpW9UqUZAlOuXFBg/uNAa8GDkqoO0V7Utn1O57k0VliQcO0IUnptSwvLktPIPz63NLd0ICB3feihbVoytkNtxEfgINLSdD63nshxSEG6Uu8coTcK/8J/PuLOryMOh3lxWiZ9HVaz4dEmODqu992ncBhx/3utslr7NHeQ8TIcXPv6IJcCCxtVAGVcWbOSLaWbW1qewuGEKlhpENaQyk6DRKYwY7VGx7tIEeYBsDJ5lT+yqUs/v2n/Ux9bqx1XdYZtYRK9+XOIYB96Srfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juNQORmBoFtZVvDJ3lz7p2sZbFi154fMU61LracQ6H0=;
 b=qTQzwInVaFNulYp3ejy/F4HOvKPLb25zIu1w3U5AzQJuTJ+nM3s2DgMZsbROZ5pPhxo2ZEYOyX2T7teUOBpvn+Kd9RmLkw7VjV/tJDw/cMQrU0rGyqYMw2fwmZAQ+iMDAXQqwsCcO6yaR42fJPQVbKGTzefFbPTlRiZInM1XLPHpZz7XOOMs2BeFPeP3ZaqvYtzjDmANC6lAEwKjrf6UK61D5hntLJwm12/IqlkqwQjnfYibPkA21fkC2wZrJO6J2RpI0IopEeQ7926nt7cM1YFYh34tS8ot1loSc/pNPZvcju3FWpvXgwP437CK8ExtG2EnCKSWhXecnh0RjOc+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juNQORmBoFtZVvDJ3lz7p2sZbFi154fMU61LracQ6H0=;
 b=F4hJ/D7vct3D3ZJw2d2wyuwzosJGnmDFJAOmUcFSAjFJ4UAqgzEsOapVDY+j00h8fNLNmgzlSpLRajjm/itcCU3w1kCvrcfXphECp0f/kY3O7vsNmwa2f+F7/jQhgZTuZZ7/YZYOIhJToXpYBryxW0cEPKqA3DSGIz3H9mVfQoxhzZhU6TKCbQFOeo/XZv/8O1vIwiaGUpxh/NeuT39jaR4s4SAPbG8dkFQnWW4XaCf+3KGVLmoeOX0UM30GNmX4urjfpmRO350fMY7jqDUg7GEV9bqjJ7djuo+mEN86S38XqWdAUr3Nk6l0KUFX9c+A48dSgJ4KPO7O58QJDetdtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7567.eurprd04.prod.outlook.com (2603:10a6:102:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 14:53:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:53:31 +0000
Date: Fri, 13 Jun 2025 10:53:23 -0400
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 2/3 v2] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <aEw7Y0FAlSTqiN5t@lizhi-Precision-Tower-5810>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
 <b5da1cf4e5813d60fdbd9dd5952cd1908ee880e5.1749747898.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5da1cf4e5813d60fdbd9dd5952cd1908ee880e5.1749747898.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 0010268a-66d3-47f6-5932-08ddaa8a1077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2ApNc6xN34Eax+DAFVdymxL5I1GNbgOYkOT1YQohFOhrSmGbKHTuwzpunf0P?=
 =?us-ascii?Q?IRTdnF//X7j1mLDwm6TbM6AoFr0Y+aWN6UkvZruYwG/ZGgn+XxQjltEfI14v?=
 =?us-ascii?Q?7FD/hvx9iVRF4DOaxU7LNW7v0p0WwogfrF+fFWSl52gKl+2ICYOMRcI8M7uL?=
 =?us-ascii?Q?nVA0nly+R3fDfHWkLecVkdNdG+eIdMM+70CVl3bC1Mp+CRQiw8tcw4X9ckaa?=
 =?us-ascii?Q?Zqzbf5r4zwKkNmTsSxasji5aMMwhSirZvpIjhxU5IS8U21+/YWgykEJjxjEK?=
 =?us-ascii?Q?7PyvzXViqQzpKLQkd4p9yd5qD9SU3YJL/OP2yJzqI1YipYnabTS5v0IsCoKn?=
 =?us-ascii?Q?8H88On78TT8WnL6VLTE4POAC/tf4H5nqBOKOG/XlmJci0n66QtRsSXstF+T0?=
 =?us-ascii?Q?ZKVvSI7x8RCJ+MKqoBx5oOktE/+2+GXnl0Xuo3cuVL1cXt0kiGLd8lwgAIf9?=
 =?us-ascii?Q?ApUGVklPTtKjEzoTabNDaqb4y7+c3FFOGDEOZbydNb5zC+7PuJ/qXnudv7r8?=
 =?us-ascii?Q?XqfnruuD8x458iEN3a1cpt+ZHSwATtJ7xJhDHaPFPlxHrEaGm07M4TiLHM6j?=
 =?us-ascii?Q?fAz2OQUeKLWNhbrjYUVOuW2rtSv9iglmoN41M+bv95E/5t6dGcwBn/KEVKhi?=
 =?us-ascii?Q?C/5fWGouxFqsSEm9V7nF2UM0zKYtYMueIFSqJZlfwSSzEVd3erMMGvdQhdDw?=
 =?us-ascii?Q?19QY0M000c2e3txhtP9jTMws9SphR/qGUrwgKqVh/FzSHA3kKVDXVVbigrA/?=
 =?us-ascii?Q?OhaXkCULw/ghzqjt/ae1u1D6oYCz/eWA+RWi9osiYmodZAMjXkgPPMhjjw+3?=
 =?us-ascii?Q?PB4hE3AM2DcedbrJ9o4twstNLa0tveF/P0yNaUoeconJJ3lUK6UZ/t2EAPqO?=
 =?us-ascii?Q?3NpS+Hrebd4/j7wzoEsfDsFBo88KKi72GjAlA4e5ad44/1MDoQEcArE6CmFK?=
 =?us-ascii?Q?sg/VIUt/O4fnuJ3fGiFUfTq8jh0+9RBje6luIstZQGUpHqEIatSgfQBTeP4Q?=
 =?us-ascii?Q?ZucfCoOpakQSvo2Ul3D1GODUZ84bJVO42DDxHUNFWqlGTWcGmSynHDZsQQeJ?=
 =?us-ascii?Q?iPcZJ5rEeZ7UjgXU7tvk6nUMwJ96xIaNDteJXWZgF/zmFFytCGvou4Uuz0ag?=
 =?us-ascii?Q?9PmMt+KlqsVmRT911N4otlt0SZuNzf+b0KUiTbx8W7MyeJFMcFjXUjrqs8VU?=
 =?us-ascii?Q?Vn+K1fH6qxET52PT+iytN1kELBnvDz7eZedJxTbP/+BY85cRfvUWj60GDxAJ?=
 =?us-ascii?Q?1u3aBl/BTrVB5ArOklEaBeSHJaMSrECG98xTjzQkc+AmpupGMFBjFYJ3VAFO?=
 =?us-ascii?Q?ZtPNyDHPRaOM4rDeB4n1h5gMTJjf8WzdvINOIkZZbR3soWk0B0bwM6nPJp+3?=
 =?us-ascii?Q?N5hO1ZA53zV67VL+1woR/Pv4TQ2gGOw8pnD9KgBQIcmZ2tX8QRd5Z8o37Rd6?=
 =?us-ascii?Q?+rMuy561JkV65xxQkFGxulkmh5XMmclgMeNWL/gLWH+uZKT1gWZUfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ipCCtarvW3KFXwNnu00yPOaT3S10GIpDw7S4uM7uVzcDItFDZhLEZPnI8omg?=
 =?us-ascii?Q?5inWpQRiSTq2aiz6ihl0gZImOmUGQGHgHI+gIfDBig37b+XkH0VaeYBv9HFr?=
 =?us-ascii?Q?/+Sr8dQaBdMSAawlkYTc4GuytAS7oTIr2yxYOQ+5+XmjP5XJFsLFCNiwsRSy?=
 =?us-ascii?Q?fVOhleTwAfcZICknARweOgT+WA6BZ24uDSeZjuzFfYURQE0MzvmfS2CODK1q?=
 =?us-ascii?Q?eY5PwsJcwRHazgiBiIgPr0T0bs6IK7g6xplKv1Mqy+PjqVwLqbrnh0EjmeCp?=
 =?us-ascii?Q?Owttjg5261qVRojZynoMxo5JSUhP6CoO9hBBDTFRVA2LLbOi0b6bnP+ViNSV?=
 =?us-ascii?Q?M2WDISwIa0OjNtTh2bFGuuP4l9bfyHS84cl4tBlYgefWNieM189s6qSIIQDM?=
 =?us-ascii?Q?zeZlBjNgiU9M0FTLAez6EKK4m96zwwrnaEE3aoPZqgtMQyGsxQJlwJYbDsq1?=
 =?us-ascii?Q?t3mwXKLFhv15E1z/CsbF4zbBHrOCHJMK18z64CP6dV2IMVQQIf6PqfuILe4e?=
 =?us-ascii?Q?Q1z5ngTgBLdVsW6Grj0M96h3VloY9cwwvwZr9BZ3LksXtUPnv7uLCDKGCkE5?=
 =?us-ascii?Q?yQXbnvigA3SHReiF1DyDQukUHuKLCsUvdl41ZyGtGiP7uQXqeyMLApmXfg4P?=
 =?us-ascii?Q?5uRJRNEgs+ofIVR+AKJp/8pcZnVGLwG9ThsA4IP+xZRBzq7wr7LOJlWpHNxP?=
 =?us-ascii?Q?Qxhfwy7E2mx0UDSDI2xzgZ1J9N8i4e/WDhYB5SDpsWZfMP8wYSzmftuqYqKU?=
 =?us-ascii?Q?oYcfu+FDp6Eh1+keZ1Nu9ZlRN/vF6D866lHX6Aby3lmAcMkqGMJ8nN+6GCne?=
 =?us-ascii?Q?AAq3feZPjHxDZlRS6EZk7Ze3HGcpfUhLI17k2ZG9o97LERkH9l5xexQ/qeYh?=
 =?us-ascii?Q?4O/TIOFx5JG4uxZgVa6MD9V0WhgGrDoQlLbGoZYplsPsAMS+UDFtGUV+MPcY?=
 =?us-ascii?Q?wssDdoqAVWdOdlNt3ww0CJv3bAyf1VM1fhGUQZM5C96EGa1A9bvfLIj3xuG0?=
 =?us-ascii?Q?JJhQ+lLMgcpyqhCPmHYv0zf6vIYPauoVCMWfppwtcWniVnQLMQrTT6cxdeWa?=
 =?us-ascii?Q?nptdSQ7ozR3RiEnkLHwKiWYS9VjYbOD9KSJv/u50dRs/mIh04vbHdvOUEoEg?=
 =?us-ascii?Q?uaTvyb/i3wzIzjoJ8Yuc70TeSc50Iu4s6dSFOiBxHWGGMKEGiTJl56eGwIvV?=
 =?us-ascii?Q?3y5MTVCF/LGM8qSfZGKU74ykypHGnuRYEGRqHa8ouO58d0yci5PD5ii53Q66?=
 =?us-ascii?Q?aosrCNDcZ/C7zvejJR92TerPCBuUE1o3xBFJaaj2jE7pWxYslIO8+pBOdH1b?=
 =?us-ascii?Q?60Sif4iZyJ8mCu8oWj2BjNmQshQO9eoWUHfsUydf7znZE0kyQ6wB52ueFv3t?=
 =?us-ascii?Q?U6Zr/h4eDIOxad5s7DE38hTdrbqg7u2N6DzuW0lSMWTRtvuHEKguq9fkm2jf?=
 =?us-ascii?Q?tD5XHXqN9LDBoUD3fIzGx8zOflbe+zBymDMVF3//o/bURf6qcf7oH9L3C8l4?=
 =?us-ascii?Q?RfuBhZ/DcHAwt8pbKFkUHtvdhb5TmJf+AzWTb3Gx1tYaj6X+7T1uyOzN8CBy?=
 =?us-ascii?Q?ee/5aybHDVWAiv1staRJKCsxtq/lYZV0hiZwcGxx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0010268a-66d3-47f6-5932-08ddaa8a1077
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:53:31.6404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tWY9vkbayHc+9Y4Ti7MqB+gwDYMaNvyP70JYOplpEtQFSw5HA0JulG0othzYwNMTSsPK8QBpmqdXWnXZ+2maw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7567

On Thu, Jun 12, 2025 at 09:50:59PM +0300, Dan Carpenter wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>
> Enable USB driver for s32g2.  This chip has an errata ERR050474,

Can you provide errata link here?

> so we need to set S32G_UCMALLBE for it to handle packages which
> aren't 4 byte aligned correctly.
>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Changes since v1:
> * Update the copyright
> * Use the .power_lost_check callback.
>
>  drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
>  drivers/usb/chipidea/usbmisc_imx.c | 74 ++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 780f4d151345..e8c847eab8e3 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2025 NXP
>   * Copyright (C) 2012 Marek Vasut <marex@denx.de>
>   * on behalf of DENX Software Engineering GmbH
>   */
> @@ -78,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
>  		CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>
> +static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
> +	.flags = CI_HDRC_DISABLE_HOST_STREAMING,
> +};
> +
>  static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
>  	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
> @@ -89,6 +94,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> +	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 118b9a68496b..67ff073ad806 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2025 NXP
>   */
>
>  #include <linux/module.h>
> @@ -155,6 +156,18 @@
>  					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
>  					 BLKCTL_OTG_DPDM_WAKEUP_EN)
>
> +#define S32G_WAKEUP_IE		BIT(0)
> +#define S32G_CORE_IE		BIT(1)
> +#define S32G_PWRFLTEN		BIT(7)
> +#define S32G_WAKEUPCTRL		BIT(10)
> +#define S32G_WAKEUPEN		BIT(11)
> +
> +/* Workaround errata ERR050474 (handle packages that aren't 4 byte aligned) */
> +#define S32G_UCMALLBE		BIT(15)
> +
> +#define S32G_WAKEUP_BITS (S32G_WAKEUP_IE | S32G_CORE_IE | S32G_WAKEUPEN | \
> +			  S32G_WAKEUPCTRL)
> +
>  struct usbmisc_ops {
>  	/* It's called once when probe a usb device */
>  	int (*init)(struct imx_usbmisc_data *data);
> @@ -614,6 +627,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
>  	return 0;
>  }
>
> +static int usbmisc_s32g_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +
> +	reg = readl(usbmisc->base);
> +	if (enabled)
> +		reg |= S32G_WAKEUP_BITS;
> +	else
> +		reg &= ~S32G_WAKEUP_BITS;
> +
> +	writel(reg, usbmisc->base);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int usbmisc_s32g_init(struct imx_usbmisc_data *data, u32 extra_flags)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +
> +	reg = readl(usbmisc->base);
> +
> +	reg |= S32G_PWRFLTEN;
> +	reg |= extra_flags;
> +
> +	writel(reg, usbmisc->base);
> +
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +	usbmisc_s32g_set_wakeup(data, false);
> +
> +	return 0;
> +}
> +
> +static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
> +{
> +	return usbmisc_s32g_init(data, S32G_UCMALLBE);
> +}
> +
>  static int usbmisc_imx7d_set_wakeup
>  	(struct imx_usbmisc_data *data, bool enabled)
>  {
> @@ -1033,6 +1092,11 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
>  		return 0;
>  }
>
> +static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
> +{
> +	return 1;
> +}
> +
>  static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
>  {
>  	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
> @@ -1131,6 +1195,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
>  	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>
> +static const struct usbmisc_ops s32g2_usbmisc_ops = {
> +	.init = usbmisc_s32g2_init,
> +	.set_wakeup = usbmisc_s32g_set_wakeup,
> +	.power_lost_check = usbmisc_s32g_power_lost_check,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1356,6 +1426,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  		.compatible = "fsl,imx95-usbmisc",
>  		.data = &imx95_usbmisc_ops,
>  	},
> +	{
> +		.compatible = "nxp,s32g2-usbmisc",
> +		.data = &s32g2_usbmisc_ops,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> --
> 2.47.2
>
