Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2060.outbound.protection.outlook.com [40.107.104.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC520E000;
	Mon,  3 Feb 2025 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613193; cv=fail; b=Gx5WkfEV2p1w2x0o19MyGg7ZpJbxsYY8Prs/iQbJdx2b+ogmzmV2iFfO7RyTVvJeOvv7ckr8U9C5XFZBCHg5ZbfW8UlkcUk8FuUAMZ7xbOkhXJFDHBo1+5L5vlUZaC1R3HjrbaPB+84PqT2s69g9S2spAe5XJncNhtJ7zIOq/bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613193; c=relaxed/simple;
	bh=PArUzL9NZDcO6m32MtnAlYPKA8jf4h7X5zZGLBG/8Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ejt3wyO/h7UMzh6vpvOgfH9JqllGB1Qs+VMYdaliFYd+Jsmw2XPueJQva5EttFak/Gz38ZiWZng7OFXBAjRigPXsBRx1kHapZ8Clcjt0NAmMGsbRRdYjJ9/j2x6M72daBM9MTtUJDBracUTBxmzsTk05GKa4jeePx2W2fdwEq/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iVjSS/n+; arc=fail smtp.client-ip=40.107.104.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iVjSS/n+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKb2kd+YleOVRyDEv8MWFZRUpvsDoIcBGBCPnXaCGlARmyu0LgY8Xht3BYvrgy0gEZYZVVhWmnRSJYz51MstJqXdGG07vymtk7x/bHUkqEPkvGd6czxLWsz4/mOfAaeBRKA30rwyLMppuAelX6c2D6ZUPmlFNsASlbWBUY08PPSUm6YrS8HFJSyVjwszEs95uubzKUqzA3QmPHt5wGN6a4mIGUuT2NHSswqLXLOm0mL7Yd3f6RTQx4+zpLTasRH4aM9AHCurm1zTXsQdw95W9BzsMdopLB+JTTROq9NhsSC1b2LMk5HL6pXrYdUSF6/LXx9enea2qn6c7cMfIuP18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNTuYji1v0EQjUnX6xWg0aTqIqekCi+wZJeqAteyvpE=;
 b=sbdf2HaKHDfGHK1qtsm37GEHWD7QDa8AKeX+aQZlJ9RMDZa76an46/tsnxNk5cJXzGPmgOrG0tWpR+AqVYdJVyhC84Ct6qjiGH3+UXRQG4AsAb3p18a/BsUU5xlcCeaDyCAU3fxE2mfbGG1vO6QD5mLoOqLRteZPihst1XLrumJV6wC+RrCr4UBOeOfrmLXgFLVCW3EQLslWAYNHTNJqqw8YT96CkdnMzRbcaMlDZpthXlQAZ3fxEqF7vMUsHUEqcKTn3FiacZXcqzgsayFD2QnjzbaqMkxnC5PPFfwE0VI0VloC9aAEjUqigiQHHHBgvzjZGuWH71b3mIYCGoSr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNTuYji1v0EQjUnX6xWg0aTqIqekCi+wZJeqAteyvpE=;
 b=iVjSS/n+w+L47eu9VhTkb/QWrWsAVwUcuIuJxr0rF5gO48D1pXnS8UEFvaakyVEYHaSGVu26xVsSzIh0V0VeUngZiwNEJCYAW2+A9HUypBoY9EaIb/dSU+fH498SbqxeysfhY8ApUkbwInL0ENru3STAqIDTHLNPa5vhvSG5GhBDnj2IdxhL2YjtwntwFh9drXmvMui2mpdMTnsyYc0vM6HZSKHCygFw8gfl4VuZsB+Q5cuLZFoRPI7HXoQUoi3TZuMN9JO2u06as+3zS5lOFkYVWAJIx4Tox21M/KrdEA78nJhjWILyzxtXWChJxInb5jFhMlCZo3jh7VUVezzOGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 20:06:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 20:06:27 +0000
Date: Mon, 3 Feb 2025 15:06:20 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 8/9] ASoC: SOF: imx: merge imx8 and imx8ulp drivers
Message-ID: <Z6EhvHXeNJPW1Cwh@lizhi-Precision-Tower-5810>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-9-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203171808.4108-9-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: f74d2eb3-8209-4ac3-0db5-08dd448e3e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ANepyYj8E5DrHhSv4iDPZc2hEd9tRJmFQiWMSPMGttaTcw+g7NebsWKaFWSs?=
 =?us-ascii?Q?syBMz2xqv4dWikPdMfaRQx+CVJmUoQgaCWjSG/OAMaCEvGmfPE161k//phPm?=
 =?us-ascii?Q?3QeDtY606tJhfM+v6WsqzJeg/j0W6CboxFqoGo1/UFV4T50Oh8+SmkS6C6Yl?=
 =?us-ascii?Q?lHxnI8TAwV5E2ngavL0wsdQbbNl7ZAuuRQEFFTxe5AylsUHPAr6y41n59epv?=
 =?us-ascii?Q?YnMfNzU9nR2EP2Ki5EMr4+AO2tdIvqXY7DvJfBywuSOtqCLJj/7R17Cfd/e2?=
 =?us-ascii?Q?yuyzJm1Q5wINdVmu8fDU+Jq1UzwYNgOc+zqiXtJRVrkVZ8Ut2Jron4OvWH3J?=
 =?us-ascii?Q?q4HE9gI+BHxr0smTnv1F1RCR/7N7+YLcla58GCuUEeIkGG6m5wlgYsJinCYo?=
 =?us-ascii?Q?hpFbXzEVIvB9nIgQh5zb+X/U7CN85hS4C3x05Jz/C4RpCwmGqP4yln64cY6C?=
 =?us-ascii?Q?VSBHYUvLjhjCyBRAdoc4jaRtAH4Qqk8mxYoFVXKARyXEr6Mog7T2e+CNHo9v?=
 =?us-ascii?Q?lYGDw3aGS4EfqiOGhf1HiuJILTkfY4FkWxTGqSm+r0Cb+DN/AgXimKOro5lq?=
 =?us-ascii?Q?7P5oqRneUuEWypvmoGa/PJyUUhVmozmXgBuD8T8KJrzF1NBplvFSAOWgXS67?=
 =?us-ascii?Q?SHfvihv2ALTMC6J6x6HmQIaosTZDDNC5QKXf+jxctEFpdDU9JJ3VnnypGEtO?=
 =?us-ascii?Q?yDOUhZYy6sO6Lgx/XtEcoZKc8R+uNMo4w9jk1y7Pv3CrOdJyk2I7gR2PTmon?=
 =?us-ascii?Q?9q9t5SqzVyal25RjJ95RYOumYtm9y2OiOUu7kl6+TDTWMNsnp5XnlGl8LI3V?=
 =?us-ascii?Q?kn6ADUw+trOYxdjJf/3XuOrfHLp0uar1lH040uUJQ7BC/hSj24I10XNbzDVF?=
 =?us-ascii?Q?ZWwHbIJgqnlJlj3RclhdioIX0bDl7zWbfeylljbqa693kz8ES/P8D9WCLzyV?=
 =?us-ascii?Q?XxEPrm3RprBCYe0LK/oDCJGrKWfqoNaHrJixgyJ09j/GixaPfOghsBmHu5xs?=
 =?us-ascii?Q?jhff1fbjY+vb0NKRRxr1BOv3mb5xg17LHO5Q3KpnyiQm5RptzFbE6igrytj7?=
 =?us-ascii?Q?hmshGf4iti68HG9hDyQVb2gt+xxwMJYS3f8z94zUdYG9qEII1gyP9E5H5iGy?=
 =?us-ascii?Q?EKZ6J0c9yGYGDwYxRxu1Zt6DEPqJTQ7DxQNrSV88ktKz27PLjcbJvVuG1ZNX?=
 =?us-ascii?Q?cMpYFRT1Kuc+HvEqqifV3BDvrBrJdbS00RCoC6z+YenYdewTQPBk50h3KjTm?=
 =?us-ascii?Q?ugG/YMsAbjiLKv1FHcfzLzY2of21aXm+Q4p23onwAO3027bh+mH0N+4db/wc?=
 =?us-ascii?Q?2mrty2zONIVjnlHlA1mCon81raTInWx4Ch4AMPGTEqJ2O0ngCXSsb/prZOdb?=
 =?us-ascii?Q?sa1OY1/PHBQ1lD1kohUEFUBBhSct+A7kZCurzIQmtSrF7CeNQSR550p3OR/n?=
 =?us-ascii?Q?2uNmnZtigNSrcPTJa1YQiiHbH/eIk9eX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xce4MV4uPeaoFmAEACbViJMRyqwgt3y7QqKxjxVQz2OVW+GG7G8CWv9MMQHU?=
 =?us-ascii?Q?RK+qTwBNCJh3HKQ4HeLtpm4OpE75u0oN+jvTfGB0bmFV6fyPbnbGfWb51Ta+?=
 =?us-ascii?Q?O74BUhMYHgqsxX1ERxJsHHTF+09smeO27odfRvf+bbGxosQDyZdaVK71Kqip?=
 =?us-ascii?Q?9bQuijOAipnXVacLG5dsBK84bv8667bTA9sTVu0ENXy71KyjQDdlXscK+CuW?=
 =?us-ascii?Q?7mG4VjhfnxY1NwmAP1vr3ISuTPh1ZWPS68NC1T7aUbJ1w8oW2X6N9QKwenTG?=
 =?us-ascii?Q?n6RdO1bv09HboL7XNTB9xCbR6XqYtfkpOgphcdd5P3ZTQvaTwQVSIJ3WMMms?=
 =?us-ascii?Q?pjIywZTjqtCQ7hTarnWfdBO3i71HKW2Qml8tX+5sdSmn/D3tInq8SUeK3OQp?=
 =?us-ascii?Q?X8ojORyAk94Sov0KYIdLh3JjdIZ+BBXjZQitU2qG9l9UJUP/6CySJfmSiozb?=
 =?us-ascii?Q?aKsbeOb7TkQM5iAbfLPM3wJPDQqx2p5E8CLeHtGAxYk+Iq8FIqFesE2pUPye?=
 =?us-ascii?Q?JWM6/az5poER7KWcS4niDXJqcfu3vndJ21JSB6EdTa+zmGoxSIUTe3N4rKQ3?=
 =?us-ascii?Q?RVcocAVRI8PJk2MMNa0seghQevD1Q30G+PSyy4qELw3T+4tLKXgWYMMqFhSH?=
 =?us-ascii?Q?s+LWxeYb5cjUXTHyn3sxBRxpePtiBt9xvcwrDMFS3s3xrFvQDtr/rNFRUHkZ?=
 =?us-ascii?Q?gK/jFdjYS8Zijq5nPMgrCOVexvSCJpfCloXQxct99uSC32gjGtSWvPU6MGoF?=
 =?us-ascii?Q?bDyWGATg/noplmNoLL6ydkj22gLXgWC738km0Xg+s06M/ttrJGiGk5bcIXxw?=
 =?us-ascii?Q?Q+V+Nq0x6xXYn3k0tjGwdOEWPN3Q9bkZzoY5x/yoq9OQrL7elhvtrhayRz3Q?=
 =?us-ascii?Q?Ug/+8FvraEg78qn77RokNDRPh+LvUhhnyClKBqgmN/qVZKOrYWAWmUmYhn4g?=
 =?us-ascii?Q?4mJy0BrWuIxI9Y5N1Em+21AoX5uFVggvyA0RPWorDxx+U8ib+zkhcxEhGr1p?=
 =?us-ascii?Q?IKIE8vjRYHZPYI/S9ZN6io/JWV6mQU1wss7mtL8FMKYtlsF6ZpeWMCS2zYrT?=
 =?us-ascii?Q?4bQpKkCWzpiioY0nboRA8KV0yOCb9oHRZXTr4f7821gAgn8Hn4nP12BgvwJq?=
 =?us-ascii?Q?7jg3DRMAHukfKn7I+IzpWfEMUXfiVSC58Gglfmt7GGM2/DygQc39EvAegNeA?=
 =?us-ascii?Q?zr6I/KC3ihkxtpkHmzPXYgv5KsFIhNbqAa4eRFRJsOi2dDAUHVS453jT4ejB?=
 =?us-ascii?Q?S69eJOw+1RIn0rhiYNIWRkisuWzoEZLSWEP+NxlVkM5YqeFu7RpyjSUPo5sc?=
 =?us-ascii?Q?hXLhMydtG863yNcU9sWsiAlPNOwSTqaQ7h77RxJGZxsDT1+9g+R1JF9D5ayg?=
 =?us-ascii?Q?Z4+OxjJ2j4r1rn2S1tcODsdaXkjQajTYbsitCw5JDI/T9kCqRTgIYUuWEJH8?=
 =?us-ascii?Q?nuRMxNHeC+4kn1eL9MMN5pC2OcbjlydyT6omTznocRrAO7w7LbmmbItW95z+?=
 =?us-ascii?Q?BsgJYnljuDJK8ptrwzyRx0kH9XIbsOm0gLhpqCal3fofcH3G+6aN+guJfysr?=
 =?us-ascii?Q?ykxVx3kobAvrDCGMadE9YWz7QQ390/s3xrM3iFZz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74d2eb3-8209-4ac3-0db5-08dd448e3e39
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:06:27.9324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJGBHomAOSQI3HHvkY/hMvFmGr4IXWYl9h/UcCS8hqXMm+myMy1jFd0fWzFCInY2JeYTUjGo3DC3x1ra/mMxCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

On Mon, Feb 03, 2025 at 12:18:07PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Now that the common interface for imx chip has been introduced,
> there's no longer a need to have a separate platform driver for
> imx8ulp. As such, merge the driver with the imx8 driver. Furthermore,
> delete the old driver as it's no longer useful.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  sound/soc/sof/imx/Kconfig   |   9 -
>  sound/soc/sof/imx/Makefile  |   2 -
>  sound/soc/sof/imx/imx8.c    | 113 ++++++++
>  sound/soc/sof/imx/imx8ulp.c | 520 ------------------------------------
>  4 files changed, 113 insertions(+), 531 deletions(-)
>  delete mode 100644 sound/soc/sof/imx/imx8ulp.c
>
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 92fdf80d6e51..2edf9de2c886 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -32,13 +32,4 @@ config SND_SOC_SOF_IMX8
>  	  Say Y if you have such a device.
>  	  If unsure select "N".
>
> -config SND_SOC_SOF_IMX8ULP
> -	tristate "SOF support for i.MX8ULP"
> -	depends on IMX_DSP
> -	select SND_SOC_SOF_IMX_COMMON
> -	help
> -	  This adds support for Sound Open Firmware for NXP i.MX8ULP platforms.
> -	  Say Y if you have such a device.
> -	  If unsure select "N".
> -
>  endif ## SND_SOC_SOF_IMX_TOPLEVEL
> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> index 852140bb8104..36a3a67c6efb 100644
> --- a/sound/soc/sof/imx/Makefile
> +++ b/sound/soc/sof/imx/Makefile
> @@ -1,9 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>  snd-sof-imx8-y := imx8.o
> -snd-sof-imx8ulp-y := imx8ulp.o
>
>  snd-sof-imx-common-y := imx-common.o
>
>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
> -obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 015ba496863e..a5e9e053bf48 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -8,6 +8,7 @@
>
>  #include <dt-bindings/firmware/imx/rsrc.h>
>
> +#include <linux/arm-smccc.h>
>  #include <linux/firmware/imx/svc/misc.h>
>  #include <linux/mfd/syscon.h>
>
> @@ -29,6 +30,16 @@
>
>  #define AudioDSP_REG2_RUNSTALL  BIT(5)
>
> +/* imx8ulp macros */
> +#define FSL_SIP_HIFI_XRDC       0xc200000e
> +#define SYSCTRL0                0x8
> +#define EXECUTE_BIT             BIT(13)
> +#define RESET_BIT               BIT(16)
> +#define HIFI4_CLK_BIT           BIT(17)
> +#define PB_CLK_BIT              BIT(18)
> +#define PLAT_CLK_BIT            BIT(19)
> +#define DEBUG_LOGIC_BIT         BIT(25)
> +
>  struct imx8m_chip_data {
>  	void __iomem *dap;
>  	struct regmap *regmap;
> @@ -49,6 +60,11 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
>  	IMX_SOF_DAI_DRV_ENTRY("micfil", 0, 0, 1, 8),
>  };
>
> +static struct snd_soc_dai_driver imx8ulp_dai[] = {
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai5", 1, 32),
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai6", 1, 32),
> +};
> +
>  static struct snd_sof_dsp_ops sof_imx8_ops;
>
>  static void imx8_ops_init(struct snd_soc_dai_driver *dai_drv, uint32_t num_drv)
> @@ -74,6 +90,8 @@ static int imx_ops_init(struct snd_sof_dev *sdev)
>  		imx8_ops_init(imx8_dai, ARRAY_SIZE(imx8_dai));
>  	} else if (of_device_is_compatible(sdev->dev->of_node, "fsl,imx8mp-dsp")) {
>  		imx8_ops_init(imx8m_dai, ARRAY_SIZE(imx8m_dai));
> +	} else if (of_device_is_compatible(sdev->dev->of_node, "fsl,imx8ulp-dsp")) {
> +		imx8_ops_init(imx8ulp_dai, ARRAY_SIZE(imx8ulp_dai));
>  	} else {
>  		return -EINVAL;
>  	}
> @@ -220,6 +238,68 @@ static int imx8m_run(struct snd_sof_dev *sdev)
>  	return 0;
>  }
>
> +static int imx8ulp_probe(struct snd_sof_dev *sdev)
> +{
> +	struct imx_common_data *common;
> +	struct regmap *regmap;
> +
> +	common = sdev->pdata->hw_pdata;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(sdev->dev, PTR_ERR(regmap),
> +				     "failed to fetch dsp ctrl regmap\n");
> +
> +	common->chip_pdata = regmap;
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_run(struct snd_sof_dev *sdev)
> +{
> +	struct regmap *regmap = get_chip_pdata(sdev);
> +
> +	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
> +	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, 0);
> +
> +	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
> +	regmap_update_bits(regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
> +
> +	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
> +	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, 0);
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_reset(struct snd_sof_dev *sdev)
> +{
> +	struct regmap *regmap;
> +	struct arm_smccc_res smc_res;
> +
> +	regmap = get_chip_pdata(sdev);
> +
> +	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
> +
> +	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
> +
> +	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
> +
> +	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
> +
> +	usleep_range(1, 2);
> +
> +	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
> +	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> +	usleep_range(1, 2);
> +
> +	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_res);
> +
> +	return smc_res.a0;
> +}
> +
>  static const struct imx_chip_ops imx8_chip_ops = {
>  	.probe = imx8_probe,
>  	.core_kick = imx8_run,
> @@ -236,6 +316,12 @@ static const struct imx_chip_ops imx8m_chip_ops = {
>  	.core_reset = imx8m_reset,
>  };
>
> +static const struct imx_chip_ops imx8ulp_chip_ops = {
> +	.probe = imx8ulp_probe,
> +	.core_kick = imx8ulp_run,
> +	.core_reset = imx8ulp_reset,
> +};
> +
>  static struct imx_memory_info imx8_memory_regions[] = {
>  	{ .name = "iram", .reserved = false },
>  	{ .name = "sram", .reserved = true },
> @@ -248,6 +334,12 @@ static struct imx_memory_info imx8m_memory_regions[] = {
>  	{ }
>  };
>
> +static struct imx_memory_info imx8ulp_memory_regions[] = {
> +	{ .name = "iram", .reserved = false },
> +	{ .name = "sram", .reserved = true },
> +	{ }
> +};
> +
>  static const struct imx_chip_info imx8_chip_info = {
>  	.ipc_info = {
>  		.has_panic_code = true,
> @@ -278,6 +370,17 @@ static const struct imx_chip_info imx8m_chip_info = {
>  	.ops = &imx8m_chip_ops,
>  };
>
> +static const struct imx_chip_info imx8ulp_chip_info = {
> +	.ipc_info = {
> +		.has_panic_code = true,
> +		.boot_mbox_offset = 0x800000,
> +		.window_offset = 0x800000,
> +	},
> +	.has_dma_reserved = true,
> +	.memory = imx8ulp_memory_regions,
> +	.ops = &imx8ulp_chip_ops,
> +};
> +
>  static struct snd_sof_of_mach sof_imx8_machs[] = {
>  	{
>  		.compatible = "fsl,imx8qxp-mek",
> @@ -319,12 +422,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
>  		.sof_tplg_filename = "sof-imx8mp-wm8962.tplg",
>  		.drv_name = "asoc-audio-graph-card2",
>  	},
> +	{
> +		.compatible = "fsl,imx8ulp-evk",
> +		.sof_tplg_filename = "sof-imx8ulp-btsco.tplg",
> +		.drv_name = "asoc-audio-graph-card2",
> +	},
>  	{}
>  };
>
>  IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx_ops_init);
>  IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx_ops_init);
>  IMX_SOF_DEV_DESC(imx8m, sof_imx8_machs, &imx8m_chip_info, &sof_imx8_ops, imx_ops_init);
> +IMX_SOF_DEV_DESC(imx8ulp, sof_imx8_machs, &imx8ulp_chip_info, &sof_imx8_ops, imx_ops_init);
>
>  static const struct of_device_id sof_of_imx8_ids[] = {
>  	{
> @@ -339,6 +448,10 @@ static const struct of_device_id sof_of_imx8_ids[] = {
>  		.compatible = "fsl,imx8mp-dsp",
>  		.data = &IMX_SOF_DEV_DESC_NAME(imx8m),
>  	},
> +	{
> +		.compatible = "fsl,imx8ulp-dsp",
> +		.data = &IMX_SOF_DEV_DESC_NAME(imx8ulp),
> +	},

Can you put imx8ulp_dai into driver data to avoid of_device_is_compatible()
logic?

Frank

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
> diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
> deleted file mode 100644
> index 0704da27e69d..000000000000
> --- a/sound/soc/sof/imx/imx8ulp.c
> +++ /dev/null
> @@ -1,520 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> -//
> -// Copyright 2021-2022 NXP
> -//
> -// Author: Peng Zhang <peng.zhang_8@nxp.com>
> -//
> -// Hardware interface for audio DSP on i.MX8ULP
> -
> -#include <linux/arm-smccc.h>
> -#include <linux/clk.h>
> -#include <linux/firmware.h>
> -#include <linux/firmware/imx/dsp.h>
> -#include <linux/firmware/imx/ipc.h>
> -#include <linux/firmware/imx/svc/misc.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_platform.h>
> -#include <linux/of_reserved_mem.h>
> -
> -#include <sound/sof.h>
> -#include <sound/sof/xtensa.h>
> -
> -#include "../ops.h"
> -#include "../sof-of-dev.h"
> -#include "imx-common.h"
> -
> -#define FSL_SIP_HIFI_XRDC	0xc200000e
> -
> -/* SIM Domain register */
> -#define SYSCTRL0		0x8
> -#define EXECUTE_BIT		BIT(13)
> -#define RESET_BIT		BIT(16)
> -#define HIFI4_CLK_BIT		BIT(17)
> -#define PB_CLK_BIT		BIT(18)
> -#define PLAT_CLK_BIT		BIT(19)
> -#define DEBUG_LOGIC_BIT		BIT(25)
> -
> -#define MBOX_OFFSET		0x800000
> -#define MBOX_SIZE		0x1000
> -
> -struct imx8ulp_priv {
> -	struct device *dev;
> -	struct snd_sof_dev *sdev;
> -
> -	/* DSP IPC handler */
> -	struct imx_dsp_ipc *dsp_ipc;
> -	struct platform_device *ipc_dev;
> -
> -	struct regmap *regmap;
> -	struct clk_bulk_data *clks;
> -	int clk_num;
> -};
> -
> -static void imx8ulp_sim_lpav_start(struct imx8ulp_priv *priv)
> -{
> -	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, RESET_BIT, 0);
> -
> -	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
> -	regmap_update_bits(priv->regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
> -
> -	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, 0);
> -}
> -
> -static int imx8ulp_get_mailbox_offset(struct snd_sof_dev *sdev)
> -{
> -	return MBOX_OFFSET;
> -}
> -
> -static int imx8ulp_get_window_offset(struct snd_sof_dev *sdev, u32 id)
> -{
> -	return MBOX_OFFSET;
> -}
> -
> -static void imx8ulp_dsp_handle_reply(struct imx_dsp_ipc *ipc)
> -{
> -	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
> -
> -	snd_sof_ipc_process_reply(priv->sdev, 0);
> -
> -	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
> -}
> -
> -static void imx8ulp_dsp_handle_request(struct imx_dsp_ipc *ipc)
> -{
> -	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> -	u32 p; /* panic code */
> -
> -	/* Read the message from the debug box. */
> -	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
> -
> -	/* Check to see if the message is a panic code (0x0dead***) */
> -	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
> -		snd_sof_dsp_panic(priv->sdev, p, true);
> -	else
> -		snd_sof_ipc_msgs_rx(priv->sdev);
> -}
> -
> -static struct imx_dsp_ops dsp_ops = {
> -	.handle_reply		= imx8ulp_dsp_handle_reply,
> -	.handle_request		= imx8ulp_dsp_handle_request,
> -};
> -
> -static int imx8ulp_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -
> -	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
> -			  msg->msg_size);
> -	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_run(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -
> -	imx8ulp_sim_lpav_start(priv);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_reset(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -	struct arm_smccc_res smc_resource;
> -
> -	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
> -
> -	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
> -
> -	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
> -
> -	regmap_update_bits(priv->regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
> -	usleep_range(1, 2);
> -
> -	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> -	usleep_range(1, 2);
> -
> -	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_probe(struct snd_sof_dev *sdev)
> -{
> -	struct platform_device *pdev = to_platform_device(sdev->dev);
> -	struct device_node *np = pdev->dev.of_node;
> -	struct device_node *res_node;
> -	struct resource *mmio;
> -	struct imx8ulp_priv *priv;
> -	struct resource res;
> -	u32 base, size;
> -	int ret = 0;
> -
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	sdev->num_cores = 1;
> -	sdev->pdata->hw_pdata = priv;
> -	priv->dev = sdev->dev;
> -	priv->sdev = sdev;
> -
> -	/* System integration module(SIM) control dsp configuration */
> -	priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,dsp-ctrl");
> -	if (IS_ERR(priv->regmap))
> -		return PTR_ERR(priv->regmap);
> -
> -	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
> -						      PLATFORM_DEVID_NONE,
> -						      pdev, sizeof(*pdev));
> -	if (IS_ERR(priv->ipc_dev))
> -		return PTR_ERR(priv->ipc_dev);
> -
> -	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
> -	if (!priv->dsp_ipc) {
> -		/* DSP IPC driver not probed yet, try later */
> -		ret = -EPROBE_DEFER;
> -		dev_err(sdev->dev, "Failed to get drvdata\n");
> -		goto exit_pdev_unregister;
> -	}
> -
> -	imx_dsp_set_data(priv->dsp_ipc, priv);
> -	priv->dsp_ipc->ops = &dsp_ops;
> -
> -	/* DSP base */
> -	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (mmio) {
> -		base = mmio->start;
> -		size = resource_size(mmio);
> -	} else {
> -		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
> -		ret = -EINVAL;
> -		goto exit_pdev_unregister;
> -	}
> -
> -	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
> -	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
> -		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
> -			base, size);
> -		ret = -ENODEV;
> -		goto exit_pdev_unregister;
> -	}
> -	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
> -
> -	res_node = of_parse_phandle(np, "memory-reserved", 0);
> -	if (!res_node) {
> -		dev_err(&pdev->dev, "failed to get memory region node\n");
> -		ret = -ENODEV;
> -		goto exit_pdev_unregister;
> -	}
> -
> -	ret = of_address_to_resource(res_node, 0, &res);
> -	of_node_put(res_node);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to get reserved region address\n");
> -		goto exit_pdev_unregister;
> -	}
> -
> -	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
> -							  resource_size(&res));
> -	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
> -		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
> -			base, size);
> -		ret = -ENOMEM;
> -		goto exit_pdev_unregister;
> -	}
> -	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> -
> -	/* set default mailbox offset for FW ready message */
> -	sdev->dsp_box.offset = MBOX_OFFSET;
> -
> -	ret = of_reserved_mem_device_init(sdev->dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to init reserved memory region %d\n", ret);
> -		goto exit_pdev_unregister;
> -	}
> -
> -	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
> -	if (ret < 0) {
> -		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
> -		goto exit_pdev_unregister;
> -	}
> -	priv->clk_num = ret;
> -
> -	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
> -	if (ret < 0) {
> -		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
> -		goto exit_pdev_unregister;
> -	}
> -
> -	return 0;
> -
> -exit_pdev_unregister:
> -	platform_device_unregister(priv->ipc_dev);
> -
> -	return ret;
> -}
> -
> -static void imx8ulp_remove(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> -
> -	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
> -	platform_device_unregister(priv->ipc_dev);
> -}
> -
> -/* on i.MX8 there is 1 to 1 match between type and BAR idx */
> -static int imx8ulp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
> -{
> -	return type;
> -}
> -
> -static int imx8ulp_suspend(struct snd_sof_dev *sdev)
> -{
> -	int i;
> -	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
> -
> -	/*Stall DSP,  release in .run() */
> -	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> -
> -	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> -		imx_dsp_free_channel(priv->dsp_ipc, i);
> -
> -	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_resume(struct snd_sof_dev *sdev)
> -{
> -	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
> -	int i, ret;
> -
> -	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
> -	if (ret < 0) {
> -		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
> -		return ret;
> -	}
> -
> -	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> -		imx_dsp_request_channel(priv->dsp_ipc, i);
> -
> -	return 0;
> -}
> -
> -static int imx8ulp_dsp_runtime_resume(struct snd_sof_dev *sdev)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = SOF_DSP_PM_D0,
> -		.substate = 0,
> -	};
> -
> -	imx8ulp_resume(sdev);
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static int imx8ulp_dsp_runtime_suspend(struct snd_sof_dev *sdev)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = SOF_DSP_PM_D3,
> -		.substate = 0,
> -	};
> -
> -	imx8ulp_suspend(sdev);
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static int imx8ulp_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = target_state,
> -		.substate = 0,
> -	};
> -
> -	if (!pm_runtime_suspended(sdev->dev))
> -		imx8ulp_suspend(sdev);
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static int imx8ulp_dsp_resume(struct snd_sof_dev *sdev)
> -{
> -	const struct sof_dsp_power_state target_dsp_state = {
> -		.state = SOF_DSP_PM_D0,
> -		.substate = 0,
> -	};
> -
> -	imx8ulp_resume(sdev);
> -
> -	if (pm_runtime_suspended(sdev->dev)) {
> -		pm_runtime_disable(sdev->dev);
> -		pm_runtime_set_active(sdev->dev);
> -		pm_runtime_mark_last_busy(sdev->dev);
> -		pm_runtime_enable(sdev->dev);
> -		pm_runtime_idle(sdev->dev);
> -	}
> -
> -	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
> -}
> -
> -static struct snd_soc_dai_driver imx8ulp_dai[] = {
> -	{
> -		.name = "sai5",
> -		.playback = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -		.capture = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -	},
> -	{
> -		.name = "sai6",
> -		.playback = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -		.capture = {
> -			.channels_min = 1,
> -			.channels_max = 32,
> -		},
> -	},
> -};
> -
> -static int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
> -				       const struct sof_dsp_power_state *target_state)
> -{
> -	sdev->dsp_power_state = *target_state;
> -
> -	return 0;
> -}
> -
> -/* i.MX8 ops */
> -static const struct snd_sof_dsp_ops sof_imx8ulp_ops = {
> -	/* probe and remove */
> -	.probe		= imx8ulp_probe,
> -	.remove		= imx8ulp_remove,
> -	/* DSP core boot */
> -	.run		= imx8ulp_run,
> -	.reset		= imx8ulp_reset,
> -
> -	/* Block IO */
> -	.block_read	= sof_block_read,
> -	.block_write	= sof_block_write,
> -
> -	/* Module IO */
> -	.read64		= sof_io_read64,
> -
> -	/* Mailbox IO */
> -	.mailbox_read	= sof_mailbox_read,
> -	.mailbox_write	= sof_mailbox_write,
> -
> -	/* ipc */
> -	.send_msg	= imx8ulp_send_msg,
> -	.get_mailbox_offset	= imx8ulp_get_mailbox_offset,
> -	.get_window_offset	= imx8ulp_get_window_offset,
> -
> -	.ipc_msg_data	= sof_ipc_msg_data,
> -	.set_stream_data_offset = sof_set_stream_data_offset,
> -
> -	/* stream callbacks */
> -	.pcm_open	= sof_stream_pcm_open,
> -	.pcm_close	= sof_stream_pcm_close,
> -
> -	/* module loading */
> -	.get_bar_index	= imx8ulp_get_bar_index,
> -	/* firmware loading */
> -	.load_firmware	= snd_sof_load_firmware_memcpy,
> -
> -	/* Debug information */
> -	.dbg_dump	= imx8_dump,
> -
> -	/* Firmware ops */
> -	.dsp_arch_ops	= &sof_xtensa_arch_ops,
> -
> -	/* DAI drivers */
> -	.drv		= imx8ulp_dai,
> -	.num_drv	= ARRAY_SIZE(imx8ulp_dai),
> -
> -	/* ALSA HW info flags */
> -	.hw_info	= SNDRV_PCM_INFO_MMAP |
> -			SNDRV_PCM_INFO_MMAP_VALID |
> -			SNDRV_PCM_INFO_INTERLEAVED |
> -			SNDRV_PCM_INFO_PAUSE |
> -			SNDRV_PCM_INFO_BATCH |
> -			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
> -
> -	/* PM */
> -	.runtime_suspend	= imx8ulp_dsp_runtime_suspend,
> -	.runtime_resume		= imx8ulp_dsp_runtime_resume,
> -
> -	.suspend	= imx8ulp_dsp_suspend,
> -	.resume		= imx8ulp_dsp_resume,
> -
> -	.set_power_state	= imx8ulp_dsp_set_power_state,
> -};
> -
> -static struct snd_sof_of_mach sof_imx8ulp_machs[] = {
> -	{
> -		.compatible = "fsl,imx8ulp-evk",
> -		.sof_tplg_filename = "sof-imx8ulp-btsco.tplg",
> -		.drv_name = "asoc-audio-graph-card2",
> -	},
> -	{}
> -};
> -
> -static struct sof_dev_desc sof_of_imx8ulp_desc = {
> -	.of_machines = sof_imx8ulp_machs,
> -	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_3),
> -	.ipc_default            = SOF_IPC_TYPE_3,
> -	.default_fw_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof",
> -	},
> -	.default_tplg_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
> -	},
> -	.default_fw_filename = {
> -		[SOF_IPC_TYPE_3] = "sof-imx8ulp.ri",
> -	},
> -	.nocodec_tplg_filename = "sof-imx8ulp-nocodec.tplg",
> -	.ops = &sof_imx8ulp_ops,
> -};
> -
> -static const struct of_device_id sof_of_imx8ulp_ids[] = {
> -	{ .compatible = "fsl,imx8ulp-dsp", .data = &sof_of_imx8ulp_desc},
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, sof_of_imx8ulp_ids);
> -
> -/* DT driver definition */
> -static struct platform_driver snd_sof_of_imx8ulp_driver = {
> -	.probe = sof_of_probe,
> -	.remove = sof_of_remove,
> -	.driver = {
> -		.name = "sof-audio-of-imx8ulp",
> -		.pm = &sof_of_pm,
> -		.of_match_table = sof_of_imx8ulp_ids,
> -	},
> -};
> -module_platform_driver(snd_sof_of_imx8ulp_driver);
> -
> -MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_DESCRIPTION("SOF support for IMX8ULP platforms");
> -MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
> --
> 2.34.1
>
