Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E2111AD;
	Wed, 28 May 2025 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748468262; cv=fail; b=imuJFJA5ph88+Pk5KgEPQ3HtHJlFNvaOJVNYZuiDKmTWLoeii3wqS9vCaPbhEnYSVWWBaIlFaMJe7I4YOdEiyflIl2yGdO2Bqf0QUjrzDHPddlCQRkKsNlXdAd2mS8mIEJb7w9aIgMx8oQ/3fMur8D5UWuVKuI8G4Qr/Wx7ROzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748468262; c=relaxed/simple;
	bh=VyRnUFXwAmdHK/Wl5i71iCVXlEeER4Chjd4gGDOv2Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S/5pj5zb8VfX1vLiMNMMF7hMqAtFyGSILKzofjoq9vIgMBj1k6j2cCsXHzeD8r3I+M7HFJdpgKNjK42XMmO3844c2MUrt6uABlnd56wKWg79jtp2vtlhjnBBgIJs1Hdmin/qU/yf/6KI4o/NHfQ0pG5SO+6wIxE/U7tVUPBuT+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g4+rd6y/; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g4+rd6y/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crXhOXfpJN5px1ZB3n2dFKs3quCtvfkDD+mxgczIkfS4jZvlc3xWMbvTWu2mFiXUdhKbQMSEXY+muE8l/meRcco9NGEmxVsYB+KNx17mrbQ3hIBdcGB4rLVveWb9qIegkwvYTD0rZ56XToB9RlSfiMR4KGVevUKZ0jD5OCAXGGVXClnbtNK3u+fk1ZIr/410B47rdbLTJFyp6oRmIeUVnLdskN0mftCv24+aquHAAwvzTAauQdJb6Bd1iiJS3TMHaOzjIJMylWFXXnpnG4FEPS6XxtD+2pmYqcllXgH+++P8nYAlsXcb+X/vH+azNUHh3MJjvOnL4Cl/S5RSE5g4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcMvVOm8/PJlso4iNdfjLWnIAHLaTBGH0VuuHrSty00=;
 b=KHvFXklRn+/rxwbTctR8wio790rnwvAcQLZ126wrP7PxTUFQAx0w2i4BuPi5o/B7sXEaJNZah2d8rPhxxcp9lq4afcwEk3i/vCGUrfdCPr7KccMohFP1/rdNxLwq1PaEHCrKtnYSgMB80NyVc5T7GZ8aS1paradh7RgoNv5KegQa1tPBog1Ta+RCmjKXFil+G7uwyhgxMpNazdhDvu2Y7qiD0TrmoYR28UJ6DxRweBUUp1d1i/5AhbFdL1LjeJb2/9DoZCzFFtSAw6bsoMe+xNwCDW2MMnL0Lad2HEKaUr1rcSoFt4HXsacsoh7wXqlZ9jLVcZyT1eJ//REpB8BeKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcMvVOm8/PJlso4iNdfjLWnIAHLaTBGH0VuuHrSty00=;
 b=g4+rd6y/D+l8PKxIFzZ1qTDA8767hnxNal8y74Y2NxS/g8jx/5VDhA8oljwi5gjsj0+/jnKij7cI+BUIQw4oNFIc+0mF9mTtrkc0DWn3qKyeQ8FVDcnAGL7BL0nFQ0V/2OsDnB0jGb0dkHxA9kBZb2FIrRV90VGTAfbN8wvIzXjptd3NCoDeZdhHzKvDYGNbKdhCk28Tu9kB6xphWxa/kldMH3ZcL7Gxvm0yDdfAeBA/eVc24j0uz4OhmBTE9zlHRkJzy/gYpJtnWP2FFcxziGpB1aaRpp7iI3FUBK0Q5ZIOZ5NJkS1B7ot1/yZwdl1d20gzAzSsVrkWt0tFrcZq1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 28 May
 2025 21:37:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 21:37:37 +0000
Date: Wed, 28 May 2025 17:37:29 -0400
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
Subject: Re: [PATCH 3/4] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <aDeCGScTPXKzoqyL@lizhi-Precision-Tower-5810>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <7407d9e557bfce2a5541fd002d36c15a041c0cc2.1748461536.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7407d9e557bfce2a5541fd002d36c15a041c0cc2.1748461536.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: c79c877f-4ff0-4ba0-5010-08dd9e2fdd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sVpKeeU/ho5eMAxE/YY8xK1mZSBJk2GccJGnUgKcaVyCmfcxatPg/5ZFh9BA?=
 =?us-ascii?Q?E5QKFiVxSmhiROVngPZ5fBALIcSXVm1VgzEUDIg2Tq9QZUCGufn4AGSaAPqF?=
 =?us-ascii?Q?+xQWHhXwcsE8Rs3zFQkA5a/2luk3t+c5/r9s9CQh+RK+meOxljxVPKGy9tVZ?=
 =?us-ascii?Q?L3W1m35kuOuTaPVK6SXiuLG95NIoWMwLIfawFKjaSOKaYzbAfJT9L7K+H33h?=
 =?us-ascii?Q?uxnEpS70cH6drUytCQU/gE2iiI++XARD7e89OtGPNqV3PUi/gAmYMVciI09y?=
 =?us-ascii?Q?JmzdzOSehr5mFTpLnz0EEyE8ElVgrJVRkuo78L9J6B4xdxNS2pdwXBDjd4y2?=
 =?us-ascii?Q?6gA4nhKHA+cA0cFWvfAJWQ47o5bYdlt/9RVD/BxXe5SMrwqYW2FoTN9+dozi?=
 =?us-ascii?Q?dySKgiME3cRHxpEjTBoXeFQT7xcj6XpYswBwDm8jo/w19gOcdo6BBBKaFZ6l?=
 =?us-ascii?Q?MiSOPrkm2kiyRfh2gkTufa6ESPYDH1SNyVV7IPpbUEL6nfUsiMHCU9TJZwqx?=
 =?us-ascii?Q?u7AsQn4tS25yLctYCAk/usnFXbzLeQ3Gj6OHPiXHDkLVkdHTKr+KEU+Lj3Gm?=
 =?us-ascii?Q?4M3rPoJSiP/0SnawYmWE/8IaklFi+cmsVO7588jOoNI31TGLgeFIK/hoP992?=
 =?us-ascii?Q?2GDBtVHVer9tUe88pm4gatrAkv4jp9GCRDy5MWdLSmQeHYrDmh6UfQe7+ZzS?=
 =?us-ascii?Q?CBrFt+SeOC76feDdbwMNAXs6yR7i58lWkkmIEON4FwBtZ86X9ssZHE6Z2CEt?=
 =?us-ascii?Q?HjTId8ZZOJlhFplFRfebHgNwEo5+QK4kEzeO/UXwecMVbmzTgJ9TLyYQcdV4?=
 =?us-ascii?Q?MwIu2LnrB5dMh/t9+sWh2CYXi+V6DJsEOqbYawFVO8Wf2R8zbCfsP6f/4MRl?=
 =?us-ascii?Q?M1rO09Ix0rRlIWHAJuHvD/bAzhdxoVEScoZkclVCSmJwXJPc6RtAP/xraxcX?=
 =?us-ascii?Q?sxRCo9fWJDVUz2wvmxUipCInuvXeDXx+gT0OAYixG9U0oYJbOjFSH8QeVwDX?=
 =?us-ascii?Q?+uUDW+NBrvVKkgGAI42zcwT8qgOIIucoejwsUqoMH40BWiRkbG3kuGh9sw0N?=
 =?us-ascii?Q?J60/Qu3c4VtLfa1LOJMh34QLjURzs/lZUr9MQjUISzXHvLfcncrXAPbXsqEm?=
 =?us-ascii?Q?BwYh9I3+4IqY14qLgiDfkQhUYRoWBFT5GbZjGCRCBnA5JGrXwuMfo2IBX3GQ?=
 =?us-ascii?Q?rsGldnkjpyyCml2Z2z4nt8LmUQlMjYvqMGI9y3DfaN8tAnymjN+wl5/iWTBL?=
 =?us-ascii?Q?JrPWdAjgORSxRdtF4yJ/NTjzKrfU0ttaIOZ2en4C9E7UJwi1U5uauWA1oncD?=
 =?us-ascii?Q?6Twuh2SvRKnE16snJKNhwv9B/aZ4ahAfOWaNdiV9/bKy4AmvKpTJlfDkMApI?=
 =?us-ascii?Q?RVnAwoG3wzKWA/4vpP7gvRAj7dXOYDQb2nKJ1lifsTtnNkNz7Bu0D/bSw98Y?=
 =?us-ascii?Q?XMsRYjICtzXiaUHPaszDtFtnqQAx12Zn4q3rml1Mljq4DpoyghWklAKkA1xt?=
 =?us-ascii?Q?d/njd8oF/TRvvCQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4OPOE42we6G94wIpwvwI/zwBKOoUR7U6cnEyP94y9KH95duKPHK6EBERhenB?=
 =?us-ascii?Q?PiRT3gH5+cSGCVjqoML1cP/NYgvedawKpl2emxBt4NxrHuCf1kc0tBWmIDex?=
 =?us-ascii?Q?uLjK/E3lkd8NyyOlGnIcdaco0ON/clxfYX8H7pXYTOfrc8NXUlfrtNgLYu9h?=
 =?us-ascii?Q?XtysKr5Mlfv3ocwpZrTRkb67cwAcgEGogsk6Ml9X6XucYQrvVeZkc4eehPC0?=
 =?us-ascii?Q?LqjUB83lQlsugXGeSQ34q6YVcpWKG1ItlKn5/Mwa77UsN6t+VTVQUVbbyCzK?=
 =?us-ascii?Q?XHlO0GoWb7ru6Acju4HkZWN9kj/DgLXSLiZ3OdVUoFQv6Gb3Lvw7iFEEuPhq?=
 =?us-ascii?Q?sASOc36FTTxJmCmOc6vbd30Af3DsA3jA2l6w/0ozSlbnWLP4qUpqfwa5iJaH?=
 =?us-ascii?Q?iLLHsi+e0wN8VPErTFaaVboC3EWNwwR15leQGpTaYJfKcHGwIYCJBCnLGpOe?=
 =?us-ascii?Q?ZQQY/FI12gXK/0rovjMe/IXkHEd9p2Gds6stLBuqLqTDx40IfjEpp7lwHIBS?=
 =?us-ascii?Q?NUWlxWzWA+MV/nMxEZqTEVuxlDbMHmJWEtDUwpnhIM/fbnQ74Ialxt4n3hZc?=
 =?us-ascii?Q?6YMNGK4Miid69Jzpy4keA8q0DzFuAVY01U8NSBkg6QLbDTjKecOoN7e46s2H?=
 =?us-ascii?Q?j1fKDdycc1Inj+i3fq8gq8DDCWi4675Jv0A37vCjC110BdVu15uB2+9oDLky?=
 =?us-ascii?Q?aSNnlxuCUagIv+j2HLhy0vGORpvduBWa4NRfHNw5F8YeWiVrcvJCVKQlWxqx?=
 =?us-ascii?Q?IRi5mYBVzw4zSAwWlyzrVXujHnF/YkAJs+5B5NMEIlLGDflNlFFIPjhG61GG?=
 =?us-ascii?Q?PyhZfY5it72haK3LswPVNbXpZhjkn8QGv5bmZdTWdrLCbrt1aQF++FG4W6Yd?=
 =?us-ascii?Q?jhnuAwDqAMWeOHK3K3XS6s5EqLbFu/C66N98Rt4ORq4QDF8ETHVBPgBH1JQl?=
 =?us-ascii?Q?ZAPkZnuHp7owcjClLAZWksrDS1q+JYNGX+7lmR0x0pYp3BsKh0oEbpBua/WR?=
 =?us-ascii?Q?zOgu8V5MUFotwT3sHaoJrBhvEOnaqOcUKew+Lc4zObCfQAYyocaSw4kIbne/?=
 =?us-ascii?Q?4AyuVUQhL7xs9x3ouS0wIsB5p5+UcLbrEXjsp71gsluO0odq3vtH3PYMfdYd?=
 =?us-ascii?Q?xdQfWMNAFO9HsD8kD1Avk3SU7A/xtmOS1FFvgQlPWg7gm6OzAOrpMb4paEeO?=
 =?us-ascii?Q?UXo7b45v7pUKxhf9Y4Fjz4VsoEpWZRNtkEa8ohOf2HTSx/ZbRw9EjWy5VL0V?=
 =?us-ascii?Q?ARrVimNl4VUMDx1mGJXEANn3+fQcl4SwtRIfIXqtP4684bzc/jBiXMYM+b1O?=
 =?us-ascii?Q?mo92Wiv3NkzPimSIsb6jttqxs3oswIg1zjjyDG9hmO7cIV7FxZOIjw64VjRw?=
 =?us-ascii?Q?eFe0oZ4cICBArKTUq9kHiPX+XyHOpxK5+fZ601A1YnqRP6YDbH3VCcJpaNrB?=
 =?us-ascii?Q?ocj65An2LN/W8M/6rVMyARQzemprq5gEHOmvv75E7Pg9ws2XlOEYxb+ZgScU?=
 =?us-ascii?Q?6WQCFzAqaRGNhISaPU0306CD2xjOryUTJ7XlJRcNtYzc6BE9BdUfOOvMK89j?=
 =?us-ascii?Q?zXitxCvM17sgeg7g4lTPWt7HpQ/8LXhij+2YSUbE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79c877f-4ff0-4ba0-5010-08dd9e2fdd72
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 21:37:37.4146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcygxPmTAZWY30T9PoMF1DvKHkZhL9+VcApNGuUIAqsipVZkWFt5A4jYHWW3aGmhLrRu2jqd5ocwu0btBVXLpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772

On Wed, May 28, 2025 at 10:57:27PM +0300, Dan Carpenter wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>
> Enable USB driver for s32g2.
>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
>  drivers/usb/chipidea/usbmisc_imx.c | 69 ++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 780f4d151345..ce207f8566d5 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2020 NXP

2025?

Frank

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
> index 95759a4ec60c..43098a150e83 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2020 NXP
>   */
>
>  #include <linux/module.h>
> @@ -158,6 +159,18 @@
>  /* Flags for 'struct imx_usbmisc' */
>  #define REINIT_DURING_RESUME	BIT(1)
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
> @@ -618,6 +631,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
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
> @@ -1135,6 +1194,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
>  	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>
> +static const struct usbmisc_ops s32g2_usbmisc_ops = {
> +	.init = usbmisc_s32g2_init,
> +	.set_wakeup = usbmisc_s32g_set_wakeup,
> +	.flags = REINIT_DURING_RESUME,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1363,6 +1428,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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
