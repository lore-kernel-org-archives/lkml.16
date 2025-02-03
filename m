Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB751E7C03;
	Mon,  3 Feb 2025 19:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612341; cv=fail; b=CZQ5DBDp2k6Zi0XDmyAfyYBVx7yF17fdDVWrSY5T4haaTqLZZ2BwS++3Mq8Ucfb+VSN4D14EKXHPbiK2UcypDNPixpr/r6lYqdfPg0ym5dum/BUFKNx4xGoWjhppXelFlNNJLrWAK7i8dAQ4szaNsldDyWbYJziGBfzGY8FMkUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612341; c=relaxed/simple;
	bh=vgkUL2B8+rDREvsmrJry+e1EcIzsy8j65oYaQTuk5yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eAi89vCByLDJV/uNFM++z0CPOUfHM6/Cp2yU83OAQ3YPNQbOdIcuy3wbi4vTMxPifw+h1TI6XNA4M39rHip44L8ab7A/8/uBmj0oHn0qLI8RVSFw+TFG6GYu5I+rVjp5hp3IbjhUKahzuCG6u5/Zv9jbcfYbTfTreI3T8q6J0bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B85bazul; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B85bazul"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRnKOO+gStGAK8swZdQKv5P4uhwEohHoYmDi5vnkE8M6YHbpbLBg/zdQ8FoOYsq0e9CTJD8ttd0mNvhRefZGNhNGOm0L6wIiyoaTaPy5rHWCM8vZkUo6pmGTRZjjNOgVn8HazQ+JW/ziB09WZEfdjjHLR/e2P2II3+LIku+p2d5VZBRRhC/jKUkR3GUxHDVEBB5gVxi0wJggS+6YyPsVQBNxSIMmcrVS6TSMHItGlm1htpxV9FzPXj1mgxBmm4iMin5i37zOCJWL3HzDvZvZ0Xcv8tU/j9cyXbVvhhXs8aX1NtrJR1xKXJo/GH348Yc8ny2ZnDuwoSQ+H6KWhfS5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uydvN7veaaXkGTiwDTcHDJwhdf+9nsYKUpZXx0NsfXk=;
 b=BYVW/AtBkTbYHSc7eN1DnSB1CFPMGTu6KFuGwAUZ4qdG1u22MJro04AXxBNqNq+Cs4iALSAHM3n/5FSshjProQfet1Z0Tnyu6PrxBeix6eOvmafJn+7SLLnlMKrr9MvMRztVx5bLK6R/68xfeIHPVEBGngFDajRL54ze7uJ7COXeldDKi64u1bz1qZAxHya4oRu7uSPAKhxRtRkUm3gdaOqfZCHfKmyFBuH0jH4/7D4m7H06u60Sp4CZxd5Dh4M488oswmiUhmtHTR71aXYM4PpYjYp7v1Ow9eKjPuua2qvFQ6LfdqZAnMFaSExchbOsSKYnXYcyRMhdA3pF+M3o8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uydvN7veaaXkGTiwDTcHDJwhdf+9nsYKUpZXx0NsfXk=;
 b=B85bazul8SPq+pSn+Z/vcRIeFya33yCyzMK7WLm1JRhmfP9dnTQ/IREIuNj42JKzVcxZpHuCVHaHZetQ9/2SwiWRbFZSvkslCmbO55t3aUoYEQBWiCoV6wOY6nu9XmbwRiRHkodultgVl4KkgFP07BhKaE8dKARwblrgHL7Bp4PZwL4FWuoCFwjRk64x9ivDKUnK1LA6ncfj+LBGXWI3DJVOkDpS1CrlZbiqToiSgeiPeDJQnz419wZSFXRKEBWoHIuU1zgdCSMOIsfIaPNbtmxbOlOltJUp/X0RkaPkAnd87rhF3Q0FZkMEuaSIQ6Bjo7afYWcQCHdsTLDJy3TH5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 19:52:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 19:52:14 +0000
Date: Mon, 3 Feb 2025 14:52:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/9] ASoC: SOF: imx: introduce more common structures and
 functions
Message-ID: <Z6EeZ4lgKVHCee3e@lizhi-Precision-Tower-5810>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203171808.4108-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 587de30a-cb53-4702-7088-08dd448c4176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/IieJOVWqCDh0U7O/rpEq03qcVbli+tEUBHTBLAX6WBJ6LXd7F38GLjSERnW?=
 =?us-ascii?Q?5sZyOqXCqkKQqgXX0kEn7nuCyEv6lvLclSsc0ZpIeuVMyOOhxsUTw4KAbqY8?=
 =?us-ascii?Q?ElL1CZDX+mvwZRpfmu7pxeBGiD8ftBv1InW5qWdsEizJx8bhg/HQZt/UmeTY?=
 =?us-ascii?Q?kjk+nWOxWa+6zERLy/EFbaUx595z3MaSK/1Nj6XeB8UaJ2weqSh0pqLElkTJ?=
 =?us-ascii?Q?7mSwVIA8y7B5/z4yj7GbyKtj38c82XGtzGHE0OtHX13LukCknBSATCocAXo0?=
 =?us-ascii?Q?guoug74HAOn6R8+Hk8JHEqY8eZSOXN1B0xnq3cKkril1QRlZ0MllrSsdeR11?=
 =?us-ascii?Q?pKa3rNeKbahcmQUpmdIYj7AD/DMSjiFOWCJO5p5R2qdGdk4xPI3WAk5ehCVv?=
 =?us-ascii?Q?O6wAFkfftd9UjfEYIg+07q3NmtDD0lsFGLliuCuxY2yYTuF9dutocKhMyV6v?=
 =?us-ascii?Q?wIF7lgnfaSifV1ku0qoga3s/d3YUvRdZLdvorwZAtWhAwq5GL4K0yFaRQ11h?=
 =?us-ascii?Q?2SG5VB0vtCLRKm1DYqXai0aXXpmPBMsNqQDw9Ml8yAp6ooyx0l989+EEJ0yN?=
 =?us-ascii?Q?Ing0dcfqbibx6clywBWza3yrMWxiz7GWVIzeM9giG8TAwd6fSVeOLVeM77R1?=
 =?us-ascii?Q?phYlhZ9WE1rnC9lXj/EQtGiEwdElk7n+soEzFDFfy8i0CvV0+95+f9MI5j8d?=
 =?us-ascii?Q?GoIi2VfMp+3LzfmUwV+hnYffcQvScfzAkwGVsvym2V8TTPfl3uK38wJ3XBAU?=
 =?us-ascii?Q?8lpnpPGZYWhWZEd1n/EhvsmQyVxeCbesZRFv5uVYhWersgOLfkJhZjWDachn?=
 =?us-ascii?Q?/6C96GtwkpKofHmc0qP8KInsQLsJ3ijjpjlN2R73pXunoiKtiMZrICmvdBsL?=
 =?us-ascii?Q?psLb7nbDj0RR980UF5zoeimdkB6Q77oXskM7wJvRbAmBtQFWZQCbS1WbzDll?=
 =?us-ascii?Q?TNQU3WEVkkbkqL1hGg2QVE1HV5QkUsKPqzQblTcigr1jxZHjivW3xPZWlaKy?=
 =?us-ascii?Q?vb+om/b81E6Vj0Cw3mWG7p3uyVZjiKpvNueZxnTXrLfsyLCArCI84XjHR/2I?=
 =?us-ascii?Q?OEh/9SEEnrg2UNLpJ+uIuct7sCnFLLPFXD74lInYeDPNjSQLM0SlPuCrAHX9?=
 =?us-ascii?Q?PcmfWqygvA2/EUHTRCel/NS3dtafj9HKqDS04k//Eh5/2j2VuFlJmPYczuiA?=
 =?us-ascii?Q?TXV30JyD/gYjoCAfiEvY8o9BH9hBNHaqWXx1sM/z0ORyxmY7FDX8Zfnx8d+/?=
 =?us-ascii?Q?MIek2nZJxSVqvX9CMkJ2Pbe6dLqM9P6iBOj8ZQguUQUWxK1gtdcs3y/vtZZP?=
 =?us-ascii?Q?xNYpA8+u1LfK/6ZxVExiewbiqOc/o/1CO8y1QhkGxsVWeXXdXZ6guszpmpnO?=
 =?us-ascii?Q?tAJebhWXE+lL/Xvnom7J8393fhFxEPCqJb142K8+H9TqxjVSAEgxwxmKLkUA?=
 =?us-ascii?Q?gXr5gXRGUB7/HZQR3mrIBbN/ACGERKZI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gZyN9GtjRyeZvtdBgm3tm/q/f3Q6GGMYPSejsRWM2F2s4fvvkJuldMMmUBfD?=
 =?us-ascii?Q?W7/6mjWME+u+6B6keQb0Jt09lfB/EtTF2lf7HJXnofeW4QWgq90L+CB9Auo4?=
 =?us-ascii?Q?cYMorihwG+9fL9Gr7gS1hJ/NihqATpplQrNs/I0RNr14O/kmyAt1d93KG5JT?=
 =?us-ascii?Q?TdNRnPTkB1B89woGDe6ZuKYV0fsaMgvmITaCKpiFmPZuPfSJ3uqhWGT089tW?=
 =?us-ascii?Q?zvg5X/wiaZCIcbpbZ6Y2gG/kq4d1DbXgQjv7pFxe1PNe4yu4QQzo8dGO4pyP?=
 =?us-ascii?Q?+lXEUx/a3vwheGeNSvDMxankdfX5XOPno+QbcURVOH8QrZqmEh3ZwrU1rcd+?=
 =?us-ascii?Q?ssgyex+24G12fQmbVQWUeMNR+LCVIZf+lfD0mzk8AS39zThF4hUA120oNIJi?=
 =?us-ascii?Q?fAYciSXtayb0xqXpQrV/zznTRUNM7Mvhjk+bqVbMs3lQzLjAuBtMO5TVK0lo?=
 =?us-ascii?Q?4M3MQJqBfO37QQMaUZNoysZ/WnSit+o6YGdOxI9fgwG6VT1AI9tqKCrj45pU?=
 =?us-ascii?Q?GTBpY077blcFPvKHMjgh1jwoDlDO7MIfXt2woni+JhK72vJuW9iaK0xC17HD?=
 =?us-ascii?Q?FQ0Lh7USD3nGZ1h9aaR4i/JBGPOUMRU1TnA25iEiyYZ9QFms/FJB2zzN5/Hs?=
 =?us-ascii?Q?F3UMCw89WmQAH4XFDGNMGLLytqoib6LQJ+Jh/cRWHr5k2+SsP5+Xs26HFB2M?=
 =?us-ascii?Q?+EZsXHqoT7FifymTlJjh0uKhxJ3RNOR2FBG5CmeU5I5nhTRngQGLUuNUTOm2?=
 =?us-ascii?Q?fr3AUgl/ryBWSvLtRqidR2KyBj7sbXLD3hWZJadfrRNXE2QDlfRn2f3FM4OH?=
 =?us-ascii?Q?s4g5UvEN6gU5LwKwsYJey53J1ISchMeAu3oBeFajJvEuqL9Gth/BDkD0JZaf?=
 =?us-ascii?Q?TYUhm+AO+eoiX7133UaRYrOhRsUm+BLQAif8viYSNq2f5wPva4Ya19TeZg25?=
 =?us-ascii?Q?yFub8bIw+TqWQmgoAEvuqn3RZol/8GijzAa7x/97FFIZGU+ablJV+3a7sXSX?=
 =?us-ascii?Q?G5uqJ3V9S8it9JMDyUnmTLtSH4frwA4npCrLsOlVY/BhbjAqQaFEVitvrdd1?=
 =?us-ascii?Q?xZIukVaPX3F7OBHZCdADgqA/AtUFWvsn6MBO+9NakFSkH++aCpADzDs9gTj6?=
 =?us-ascii?Q?UMPid/1WX+MnpiIYYiqC1+uDxYoVKo6PP9V60IrDw/NoG+mH7D26drbgtnWj?=
 =?us-ascii?Q?rXy8W6ORgN5CXGp5L2e4bSMmZODO+nUGP0Wis3gvh3sz4bL5dJjxYNV22E3i?=
 =?us-ascii?Q?k52gC1WmDIrDyOlIRfh0C5z6ceFex1PS3wxTqpnK2zRxPtIuvqdkAnjII5bx?=
 =?us-ascii?Q?EY5/rjdDpLVvSZLZ6ECotoDmTwPdF/zkZtJigcQD8pfJ8WPxK/n5Miq81mwS?=
 =?us-ascii?Q?wQEHjY9h0OqZofWNxl9pMiw+6/6v7JDQeeuufkna967XmzX2xkfKWpg3JPXS?=
 =?us-ascii?Q?A1sh72VLRLyebm7bJAa8ecXoMLYKTtqhppSZc1+5XZEyRJnAvOs+MMozu+T8?=
 =?us-ascii?Q?xarF5FMYwuiHRbLvZseC+gE5MwfTEVniuhLOLA8AE9MxApZUITmfZvA3l51Q?=
 =?us-ascii?Q?CWbVS+LvJq9ERB/okVlbWfNPgSeWCLnq3OIEja2I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587de30a-cb53-4702-7088-08dd448c4176
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 19:52:14.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ5SZBLY3LhF7X2hvMERX3I7QW/A/Jr30/KEj0NgKvGFEAvp9ov3jBWom1IFvH6qJxRgEGnmAIOVQHd3F1dkxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758

On Mon, Feb 03, 2025 at 12:18:00PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The SOF drivers for imx chips have a lot of duplicate code
> and routines/code snippets that could certainly be reused
> among drivers.
>
> As such, introduce a new set of structures and functions
> that will help eliminate the redundancy and code size of
> the drivers.

please wrap at 75 chars

>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  sound/soc/sof/imx/imx-common.c | 419 ++++++++++++++++++++++++++++++++-
>  sound/soc/sof/imx/imx-common.h | 149 ++++++++++++
>  2 files changed, 567 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
> index fce6d9cf6a6b..5921900335c8 100644
> --- a/sound/soc/sof/imx/imx-common.c
> +++ b/sound/soc/sof/imx/imx-common.c
> @@ -1,11 +1,16 @@
>  // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>  //
> -// Copyright 2020 NXP
> +// Copyright 2020-2025 NXP
>  //
>  // Common helpers for the audio DSP on i.MX8
>
> +#include <linux/firmware/imx/dsp.h>
>  #include <linux/module.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/of_address.h>

keep alphabet order

> +#include <linux/pm_domain.h>
>  #include <sound/sof/xtensa.h>
> +
>  #include "../ops.h"
>
>  #include "imx-common.h"
> @@ -74,5 +79,417 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
>  }
>  EXPORT_SYMBOL(imx8_dump);
>
> +static void imx_handle_reply(struct imx_dsp_ipc *ipc)
> +{
> +	unsigned long flags;
> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
> +
> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
> +	snd_sof_ipc_process_reply(sdev, 0);
> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);

Are you sure have to use spin_lock?

> +}
> +
> +static void imx_handle_request(struct imx_dsp_ipc *ipc)
> +{
> +	struct snd_sof_dev *sdev;
> +	u32 panic_code;
> +
> +	sdev = imx_dsp_get_data(ipc);
> +
> +	if (get_chip_info(sdev)->ipc_info.has_panic_code) {
> +		sof_mailbox_read(sdev, sdev->debug_box.offset + 0x4,
> +				 &panic_code,
> +				 sizeof(panic_code));
> +
> +		if ((panic_code & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
> +			snd_sof_dsp_panic(sdev, panic_code, true);
> +			return;
> +		}
> +	}
> +
> +	snd_sof_ipc_msgs_rx(sdev);
> +}
> +
> +static struct imx_dsp_ops imx_ipc_ops = {
> +	.handle_reply = imx_handle_reply,
> +	.handle_request = imx_handle_request,
> +};
> +
> +static int imx_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
> +{
> +	struct imx_common_data *common = sdev->pdata->hw_pdata;
> +
> +	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data, msg->msg_size);
> +	imx_dsp_ring_doorbell(common->ipc_handle, 0x0);
> +
> +	return 0;
> +}
> +
> +static int imx_get_bar_index(struct snd_sof_dev *sdev, u32 type)
> +{
> +	switch (type) {
> +	case SOF_FW_BLK_TYPE_IRAM:
> +	case SOF_FW_BLK_TYPE_SRAM:
> +		return type;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int imx_get_mailbox_offset(struct snd_sof_dev *sdev)
> +{
> +	return get_chip_info(sdev)->ipc_info.boot_mbox_offset;
> +}
> +
> +static int imx_get_window_offset(struct snd_sof_dev *sdev, u32 id)
> +{
> +	return get_chip_info(sdev)->ipc_info.window_offset;
> +}
> +
> +static int imx_set_power_state(struct snd_sof_dev *sdev,
> +			       const struct sof_dsp_power_state *target)
> +{
> +	sdev->dsp_power_state = *target;
> +	return 0;
> +}
> +
> +static int imx_common_resume(struct snd_sof_dev *sdev)
> +{
> +	struct imx_common_data *common;
> +	int ret, i;
> +
> +	common = sdev->pdata->hw_pdata;
> +
> +	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
> +	if (ret)
> +		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
> +
> +	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> +		imx_dsp_request_channel(common->ipc_handle, i);
> +
> +	/* done. If need be, core will be started by SOF core immediately after */
> +	return 0;
> +}
> +
> +static int imx_common_suspend(struct snd_sof_dev *sdev)
> +{
> +	struct imx_common_data *common;
> +	int i, ret;
> +
> +	common = sdev->pdata->hw_pdata;
> +
> +	ret = imx_chip_core_shutdown(sdev);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "failed to shutdown core: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> +		imx_dsp_free_channel(common->ipc_handle, i);
> +
> +	clk_bulk_disable_unprepare(common->clk_num, common->clks);
> +
> +	return 0;
> +}
> +
> +static int imx_runtime_resume(struct snd_sof_dev *sdev)
> +{
> +	int ret;
> +	const struct sof_dsp_power_state target_state = {
> +		.state = SOF_DSP_PM_D0,
> +	};
> +
> +	ret = imx_common_resume(sdev);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "failed to runtime common resume: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
> +}
> +
> +static int imx_resume(struct snd_sof_dev *sdev)
> +{
> +	int ret;
> +	const struct sof_dsp_power_state target_state = {
> +		.state = SOF_DSP_PM_D0,
> +	};
> +
> +	ret = imx_common_resume(sdev);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "failed to common resume: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (pm_runtime_suspended(sdev->dev)) {
> +		pm_runtime_disable(sdev->dev);
> +		pm_runtime_set_active(sdev->dev);
> +		pm_runtime_mark_last_busy(sdev->dev);
> +		pm_runtime_enable(sdev->dev);
> +		pm_runtime_idle(sdev->dev);
> +	}
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
> +}
> +
> +static int imx_runtime_suspend(struct snd_sof_dev *sdev)
> +{
> +	int ret;
> +	const struct sof_dsp_power_state target_state = {
> +		.state = SOF_DSP_PM_D3,
> +	};
> +
> +	ret = imx_common_suspend(sdev);
> +	if (ret < 0)
> +		dev_err(sdev->dev, "failed to runtime common suspend: %d\n", ret);
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
> +}
> +
> +static int imx_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
> +{
> +	int ret;
> +	const struct sof_dsp_power_state target_power_state = {
> +		.state = target_state,
> +	};
> +
> +	if (!pm_runtime_suspended(sdev->dev)) {
> +		ret = imx_common_suspend(sdev);
> +		if (ret < 0) {
> +			dev_err(sdev->dev, "failed to common suspend: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);

does pm_runtime_force_suspend()/pm_runtime_force_resume() work?

> +}
> +
> +static int imx_region_name_to_blk_type(const char *region_name)
> +{
> +	if (!strcmp(region_name, "iram"))
> +		return SOF_FW_BLK_TYPE_IRAM;
> +	else if (!strcmp(region_name, "dram"))
> +		return SOF_FW_BLK_TYPE_DRAM;
> +	else if (!strcmp(region_name, "sram"))
> +		return SOF_FW_BLK_TYPE_SRAM;
> +	else
> +		return -EINVAL;
> +}
> +
> +static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
> +{
> +	struct platform_device *pdev;
> +	const struct imx_chip_info *chip_info;
> +	phys_addr_t base, size;
> +	struct resource *res;
> +	struct reserved_mem *reserved;
> +	struct device_node *res_np;
> +	int i, blk_type, ret;
> +
> +	pdev = to_platform_device(sdev->dev);
> +	chip_info = get_chip_info(sdev);
> +
> +	for (i = 0; chip_info->memory[i].name; i++) {
> +		blk_type = imx_region_name_to_blk_type(chip_info->memory[i].name);
> +		if (blk_type < 0)
> +			return dev_err_probe(sdev->dev, blk_type,
> +					     "no blk type for region %s\n",
> +					     chip_info->memory[i].name);
> +
> +		if (!chip_info->memory[i].reserved) {
> +			res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +							   chip_info->memory[i].name);
> +			if (!res)
> +				return dev_err_probe(sdev->dev, -ENODEV,
> +						     "failed to fetch %s resource\n",
> +						     chip_info->memory[i].name);
> +
> +			base = res->start;
> +			size = resource_size(res);
> +		} else {
> +			ret = of_property_match_string(pdev->dev.of_node,
> +						       "memory-region-names",
> +						       chip_info->memory[i].name);
> +			if (ret < 0)
> +				return dev_err_probe(sdev->dev, ret,
> +						     "no valid index for %s\n",
> +						     chip_info->memory[i].name);
> +
> +			res_np = of_parse_phandle(pdev->dev.of_node,
> +						  "memory-region",
> +						  ret);
> +			if (!res_np)
> +				return dev_err_probe(sdev->dev, -ENODEV,
> +						     "failed to parse phandle %s\n",
> +						     chip_info->memory[i].name);
> +
> +			reserved = of_reserved_mem_lookup(res_np);
> +			of_node_put(res_np);
> +			if (!reserved)
> +				return dev_err_probe(sdev->dev, -ENODEV,
> +						     "failed to get %s reserved\n",
> +						     chip_info->memory[i].name);
> +
> +			base = reserved->base;
> +			size = reserved->size;
> +		}
> +
> +		sdev->bar[blk_type] = devm_ioremap(sdev->dev, base, size);
> +		if (IS_ERR(sdev->bar[blk_type]))
> +			return dev_err_probe(sdev->dev,
> +					     PTR_ERR(sdev->bar[blk_type]),
> +					     "failed to ioremap %s region\n",
> +					     chip_info->memory[i].name);
> +	}
> +
> +	return 0;
> +}
> +
> +static void imx_unregister_action(void *data)
> +{
> +	platform_device_unregister(data);
> +}
> +
> +static int imx_probe(struct snd_sof_dev *sdev)
> +{
> +	int ret;
> +	struct platform_device *pdev;
> +	struct imx_common_data *common;
> +	struct dev_pm_domain_attach_data domain_data = {
> +		.pd_names = NULL, /* no filtering */
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +	};

try keep reverse Christmas tree.

> +
> +	pdev = to_platform_device(sdev->dev);
> +
> +	common = devm_kzalloc(sdev->dev, sizeof(*common), GFP_KERNEL);
> +	if (!common)
> +		return dev_err_probe(sdev->dev, -ENOMEM,
> +				     "failed to allocate common data\n");
> +
> +	common->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
> +							PLATFORM_DEVID_NONE,
> +							pdev, sizeof(*pdev));
> +	if (IS_ERR(common->ipc_dev))
> +		return dev_err_probe(sdev->dev, PTR_ERR(common->ipc_dev),
> +				     "failed to create IPC device\n");
> +
> +	/* let the devres API take care of unregistering this platform
> +	 * driver when no longer required.
> +	 */

I remember only network subsystem use this type comments style.

> +	ret = devm_add_action_or_reset(sdev->dev,
> +				       imx_unregister_action,
> +				       common->ipc_dev);
> +	if (ret)
> +		return dev_err_probe(sdev->dev, ret, "failed to add devm action\n");
> +
> +	common->ipc_handle = dev_get_drvdata(&common->ipc_dev->dev);
> +	if (!common->ipc_handle)
> +		return dev_err_probe(sdev->dev, -EPROBE_DEFER,
> +				     "failed to fetch IPC handle\n");
> +
> +	ret = imx_parse_ioremap_memory(sdev);
> +	if (ret < 0)
> +		return dev_err_probe(sdev->dev, ret,
> +				     "failed to parse/ioremap memory regions\n");
> +
> +	if (get_chip_info(sdev)->has_dma_reserved) {
> +		ret = of_reserved_mem_device_init_by_name(sdev->dev,
> +							  pdev->dev.of_node,
> +							  "dma");

do you need put "of_reserved_mem_device_release()" at imx_unregister_action?

The below error path will miss call of_reserved_mem_device_release().

> +		if (ret)
> +			return dev_err_probe(sdev->dev, ret,
> +					     "failed to bind DMA region\n");
> +	}
> +
> +	if (!sdev->dev->pm_domain) {
> +		ret = devm_pm_domain_attach_list(sdev->dev,
> +						 &domain_data, &common->pd_list);
> +		if (ret < 0)
> +			return dev_err_probe(sdev->dev, ret, "failed to attach PDs\n");
> +	}
> +
> +	ret = devm_clk_bulk_get_all(sdev->dev, &common->clks);
> +	if (ret < 0)
> +		return dev_err_probe(sdev->dev, common->clk_num,
> +				     "failed to fetch clocks\n");
> +	common->clk_num = ret;
> +
> +	/* no effect if number of clocks is 0 */
> +	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
> +	if (ret < 0)
> +		return dev_err_probe(sdev->dev, ret, "failed to enable clocks\n");
> +
> +	common->ipc_handle->ops = &imx_ipc_ops;
> +	imx_dsp_set_data(common->ipc_handle, sdev);
> +
> +	sdev->num_cores = 1;
> +	sdev->pdata->hw_pdata = common;
> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> +	sdev->dsp_box.offset = get_chip_info(sdev)->ipc_info.boot_mbox_offset;
> +
> +	return imx_chip_probe(sdev);
> +}
> +
> +static void imx_remove(struct snd_sof_dev *sdev)
> +{
> +	struct imx_common_data *common = sdev->pdata->hw_pdata;
> +	int ret;
> +
> +	common = sdev->pdata->hw_pdata;
> +
> +	if (!pm_runtime_suspended(sdev->dev)) {
> +		ret = imx_chip_core_shutdown(sdev);
> +		if (ret < 0)
> +			dev_err(sdev->dev, "failed to shutdown core: %d\n", ret);
> +
> +		clk_bulk_disable_unprepare(common->clk_num, common->clks);
> +	}
> +}
> +
> +const struct snd_sof_dsp_ops sof_imx_ops = {
> +	.probe = imx_probe,
> +	.remove = imx_remove,
> +
> +	.run = imx_chip_core_kick,
> +	.reset = imx_chip_core_reset,
> +
> +	.block_read = sof_block_read,
> +	.block_write = sof_block_write,
> +
> +	.mailbox_read = sof_mailbox_read,
> +	.mailbox_write = sof_mailbox_write,
> +
> +	.send_msg = imx_send_msg,
> +	.get_mailbox_offset = imx_get_mailbox_offset,
> +	.get_window_offset = imx_get_window_offset,
> +
> +	.ipc_msg_data = sof_ipc_msg_data,
> +	.set_stream_data_offset = sof_set_stream_data_offset,
> +
> +	.get_bar_index = imx_get_bar_index,
> +	.load_firmware = snd_sof_load_firmware_memcpy,
> +
> +	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
> +
> +	.pcm_open = sof_stream_pcm_open,
> +	.pcm_close = sof_stream_pcm_close,
> +
> +	.runtime_suspend = imx_runtime_suspend,
> +	.runtime_resume = imx_runtime_resume,
> +	.suspend = imx_suspend,
> +	.resume = imx_resume,
> +
> +	.set_power_state = imx_set_power_state,
> +
> +	.hw_info = SNDRV_PCM_INFO_MMAP |
> +		SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_INTERLEAVED |
> +		SNDRV_PCM_INFO_PAUSE |
> +		SNDRV_PCM_INFO_BATCH |
> +		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
> +};
> +EXPORT_SYMBOL(sof_imx_ops);
> +
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_DESCRIPTION("SOF helpers for IMX platforms");
> diff --git a/sound/soc/sof/imx/imx-common.h b/sound/soc/sof/imx/imx-common.h
> index 13d7f3ef675e..b31898866681 100644
> --- a/sound/soc/sof/imx/imx-common.h
> +++ b/sound/soc/sof/imx/imx-common.h
> @@ -4,10 +4,157 @@
>  #define __IMX_COMMON_H__
>
>  #include <linux/clk.h>
> +#include <linux/of_platform.h>
> +#include <sound/sof/xtensa.h>
> +
> +#include "../sof-of-dev.h"
> +#include "../ops.h"
>
>  #define EXCEPT_MAX_HDR_SIZE	0x400
>  #define IMX8_STACK_DUMP_SIZE 32
>
> +/* chip_info refers to the data stored in struct sof_dev_desc's chip_info */
> +#define get_chip_info(sdev)\
> +	((const struct imx_chip_info *)((sdev)->pdata->desc->chip_info))
> +
> +/* chip_pdata refers to the data stored in struct imx_common_data's chip_pdata */
> +#define get_chip_pdata(sdev)\
> +	(((struct imx_common_data *)((sdev)->pdata->hw_pdata))->chip_pdata)
> +
> +/* can be used if:
> + *	1) The only supported IPC version is IPC3.
> + *	2) The default paths/FW name match values below.
> + *
> + * otherwise, just explicitly declare the structure
> + */
> +#define IMX_SOF_DEV_DESC(mach_name, of_machs,				\
> +			 mach_chip_info, mach_ops, mach_ops_init)	\
> +static struct sof_dev_desc sof_of_##mach_name##_desc = {		\
> +	.of_machines = of_machs,					\
> +	.chip_info = mach_chip_info,					\
> +	.ipc_supported_mask = BIT(SOF_IPC_TYPE_3),			\
> +	.ipc_default = SOF_IPC_TYPE_3,					\
> +	.default_fw_path = {						\
> +		[SOF_IPC_TYPE_3] = "imx/sof",				\
> +	},								\
> +	.default_tplg_path = {						\
> +		[SOF_IPC_TYPE_3] = "imx/sof-tplg",			\
> +	},								\
> +	.default_fw_filename = {					\
> +		[SOF_IPC_TYPE_3] = "sof-" #mach_name ".ri",		\
> +	},								\
> +	.ops = mach_ops,						\
> +	.ops_init = mach_ops_init,					\
> +}
> +
> +/* to be used alongside IMX_SOF_DEV_DESC() */
> +#define IMX_SOF_DEV_DESC_NAME(mach_name) sof_of_##mach_name##_desc
> +
> +/* dai driver entry w/ playback and capture caps. If one direction is missing
> + * then set the channels to 0.
> + */
> +#define IMX_SOF_DAI_DRV_ENTRY(dai_name, pb_cmin, pb_cmax, cap_cmin, cap_cmax)	\
> +{										\
> +	.name = dai_name,							\
> +	.playback = {								\
> +		.channels_min = pb_cmin,					\
> +		.channels_max = pb_cmax,					\
> +	},									\
> +	.capture = {								\
> +		.channels_min = cap_cmin,					\
> +		.channels_max = cap_cmax,					\
> +	},									\
> +}
> +
> +/* use if playback and capture have the same min/max channel count */
> +#define IMX_SOF_DAI_DRV_ENTRY_BIDIR(dai_name, cmin, cmax)\
> +	IMX_SOF_DAI_DRV_ENTRY(dai_name, cmin, cmax, cmin, cmax)
> +
> +struct imx_ipc_info {
> +	/* true if core is able to write a panic code to the debug box */
> +	bool has_panic_code;
> +	/* offset to mailbox in which firmware initially writes FW_READY */
> +	int boot_mbox_offset;
> +	/* offset to region at which the mailboxes start */
> +	int window_offset;
> +};
> +
> +struct imx_chip_ops {
> +	/* called after clocks and PDs are enabled */
> +	int (*probe)(struct snd_sof_dev *sdev);
> +	/* used directly by the SOF core */
> +	int (*core_kick)(struct snd_sof_dev *sdev);
> +	/* called during suspend()/remove() before clocks are disabled */
> +	int (*core_shutdown)(struct snd_sof_dev *sdev);
> +	/* used directly by the SOF core */
> +	int (*core_reset)(struct snd_sof_dev *sdev);
> +};
> +
> +struct imx_memory_info {
> +	const char *name;
> +	bool reserved;
> +};
> +
> +struct imx_chip_info {
> +	struct imx_ipc_info ipc_info;
> +	/* does the chip have a reserved memory region for DMA? */
> +	bool has_dma_reserved;
> +	struct imx_memory_info *memory;
> +	/* optional */
> +	const struct imx_chip_ops *ops;
> +};
> +
> +struct imx_common_data {
> +	struct platform_device *ipc_dev;
> +	struct imx_dsp_ipc *ipc_handle;
> +	/* core may have no clocks */
> +	struct clk_bulk_data *clks;
> +	int clk_num;
> +	/* core may have no PDs */
> +	struct dev_pm_domain_list *pd_list;
> +	void *chip_pdata;
> +};
> +
> +static inline int imx_chip_core_kick(struct snd_sof_dev *sdev)
> +{
> +	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
> +
> +	if (ops && ops->core_kick)
> +		return ops->core_kick(sdev);
> +
> +	return 0;
> +}
> +
> +static inline int imx_chip_core_shutdown(struct snd_sof_dev *sdev)
> +{
> +	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
> +
> +	if (ops && ops->core_shutdown)
> +		return ops->core_shutdown(sdev);
> +
> +	return 0;
> +}
> +
> +static inline int imx_chip_core_reset(struct snd_sof_dev *sdev)
> +{
> +	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
> +
> +	if (ops && ops->core_reset)
> +		return ops->core_reset(sdev);
> +
> +	return 0;
> +}
> +
> +static inline int imx_chip_probe(struct snd_sof_dev *sdev)
> +{
> +	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
> +
> +	if (ops && ops->probe)
> +		return ops->probe(sdev);
> +
> +	return 0;
> +}
> +
>  void imx8_get_registers(struct snd_sof_dev *sdev,
>  			struct sof_ipc_dsp_oops_xtensa *xoops,
>  			struct sof_ipc_panic_info *panic_info,
> @@ -15,4 +162,6 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
>
>  void imx8_dump(struct snd_sof_dev *sdev, u32 flags);
>
> +extern const struct snd_sof_dsp_ops sof_imx_ops;
> +
>  #endif
> --
> 2.34.1
>
