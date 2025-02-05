Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F98319B586;
	Wed,  5 Feb 2025 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771818; cv=fail; b=hs4ZXWSiO7tfWxVjXRuVgRbC+wb2tYZmYao3P5394Sh5q6jXgigFkJKTbkbcYlAPBNb0tumDJXYnilgwfPqrZo62DvMpc0UjCxne+CqL2+faRPEdDgQ0jJsC/DBx17HX4Cdq91ki32iduI09NJsgKPM6NNpttTaUwiG0plVraxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771818; c=relaxed/simple;
	bh=TQ/iVaQYBtYjawaSgc+mXp0se8zhTAox2opKoSIkIQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c4AHWSWUMZnObJ/jrdOf7PpQe+OXNUB7/72jni4b1hOQY5r4CY7EVOxb4xa14WAJvNuFYbqYvJZ0PxJyLyvMmLv6cZW9LsjvUml0yxYVXnJm1bL/IrhSLwi8Ouwh0WmSXU8bhrT2XpFsG0iluuCN42xertNlN00J70IPAn4bVmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V0SyOSUc; arc=fail smtp.client-ip=40.107.21.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V0SyOSUc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZlOWpBdoofA0jT1GzPrTbsM4IC7SNj/gxRkYyi03TZEGiSswBKtCsr7ZzAjxwe680gefi4GU5oVo88eQnO1/PRjs8WOCCb7c2g1D3jr+JRj4tQmz5CYt3r1gtPtuwUaaJePQOUaWB3XVVpjrqmG5XIrAtpyCnZtssvY2yj8zp2JwmqkUi+pjGUrgfU7K7QbjFnLC+UFEKfvX1t5/zfVSW1p64Oz/oLY1vQaAmXCeeuvY5vWRrWj/ML68L6B0MDJ2NHN4J//iH8M+otv9hUIAZC0mDzlgMh1Js+7fwPmCYL7N2ep3BMftzUaJDuK3IIsTYoEPuJYCZwzb47Y3yhSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5P+OyHKqSzzPncSiqpt8ULWntS5azAhRM59s7DaiyQ=;
 b=kJHevonwV1MrDQzP6ytKDi2Rjxu5OuSnNYV6Qnw2TAsE9kQw8RDcPCnMB0unccFkBqvGPMcoIk9haFc/kS1XoXTv2pfxUbTa1XVdQlzIviqbKKYjRFTQmYVKkIgDFCMG8OAPMNK0doEShYCqeLnK5NJizb80M7c8pbyW/ISEB8GJoC1ZiSbUO/S7F/Icmo0H7eoLlc9P0ig+SDoKE+qV6lskNeAnhrBajndBnentCDSiyI0eqezJc0fS321bz4aUAR3Hf3fVQ0xIX0QUIKx0wfez85tEoV19cX8bV3v3GINdqCTMMEDXDsW+idZ3azenodsxPO5nlN+/kz3JnRnwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5P+OyHKqSzzPncSiqpt8ULWntS5azAhRM59s7DaiyQ=;
 b=V0SyOSUcrb/fPBAkV+R9mLqwsEiiY1T/5kV2bei385vuuZsFaEiQRaQ8Q4Qoec1AetJwsGTrV/V0ALZ2tKnLK/lJH7Yo+Jd1Glw81nPVIRpujvHxeeytn4lLJayF5m1bCMT3kf//8IfTYVrPQMglQTlzPaQ2fA2/v4KEm6uQROSr+ABGChrS7SJA8oJObLXU1sFN2j2NtQYhE52PGKbT9Ju2keYDjE/QJ5Jqa8T2T2XTVBXaVr8MqR8kJbjLD+Jza1rvuGppOJ5bfqNq2CCaGAnSPr2oK1t3qYQ0NVrP4RfVKSDvpOBl1PItMAe3HmO3L124HMckvI3vWkIrk+nNsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7348.eurprd04.prod.outlook.com (2603:10a6:20b:1db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 16:10:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 16:10:09 +0000
Date: Wed, 5 Feb 2025 11:10:01 -0500
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
Message-ID: <Z6ONWfIycA0oHEB6@lizhi-Precision-Tower-5810>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-2-laurentiumihalcea111@gmail.com>
 <Z6EeZ4lgKVHCee3e@lizhi-Precision-Tower-5810>
 <db81aa4e-dc1f-4c6d-b58f-82883622b0dc@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db81aa4e-dc1f-4c6d-b58f-82883622b0dc@gmail.com>
X-ClientProxiedBy: BYAPR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:a03:114::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b0ae23-d5a5-4bd0-dfa9-08dd45ff9007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5l/cmNcQPRS6KnJwpuJJZQazXEmbSorcj6SUPciqDG3UDMyHBHfzgZO2ikSP?=
 =?us-ascii?Q?+4cjDdZdsjuORpNHzEp8HF53lb9X63ZcWJWf/DWvJGQFDU8tmtC7ixCX7fuy?=
 =?us-ascii?Q?veXtD5ZWFaN6LOjkUdeoxgRF4s1VtTzGR1VeSEK5DdDxZoc4zU0LVRvp61HD?=
 =?us-ascii?Q?L3FAKDvgLeAjuYl3W8Tv5MezRIxlhrLII6pePO2KKdwPq0jI6gg+i4raTEE1?=
 =?us-ascii?Q?VBr58U97IXeomJM2j295UV314rxccIYjOPnNrkXMJrxS+FMtgo/R2XcxXU77?=
 =?us-ascii?Q?7eq2vxhiAXu/SdJy46k7Nm424kEUM+dIGY0HzewOdiLiKj+5FlRlutF1PhPr?=
 =?us-ascii?Q?BgGWV3wSuwpanOAqQMtnY6Zc35jlWopUBHGbGR8bYySWPNyrDB2sbmJw3cQA?=
 =?us-ascii?Q?zk0kPw03CU9g78fAvY+pM5qK6UZeyqd73ScvQGuNO+qL6LLcpDz5/QmlWfIJ?=
 =?us-ascii?Q?OFmkwMwIiuad8JAN27iKhRFy3I+q0Sv3tjIR42qR6B7qyNsBmUDp0x1JyErw?=
 =?us-ascii?Q?cec1DbaSUCYQzxLxekn3rUQh1w9ZipiffqiMqtXdXyq7nXKFpCjPau4Rl9IV?=
 =?us-ascii?Q?j6ujkLgGjrFvYhepk5udUW22Q6HjJsaMTlnMmDYV+MQcKLeu9wGCeFeN36kk?=
 =?us-ascii?Q?0IANOC/Y/xsT9EpYnCkF2fBb43lBj3/7dMpTYD3wZpGlIms2w7fO26LXxEfs?=
 =?us-ascii?Q?W1NJQIn6qabkjV3jEzDDm6IzhVxHo6Zngaa9QRGi/XdbST+YCndjUDk+LO2/?=
 =?us-ascii?Q?W4/MP6i3UBt6zczkVMaHJM/b1T/WYXktNfxTh4ds/9f9lKS5TYnMpdyxQU2T?=
 =?us-ascii?Q?FkVPs50IRTeMcjRZotNYG6iKK0TZ63gMBt5NWs+ZbhrMvyvCwCrd0/rdhNWC?=
 =?us-ascii?Q?UCTP71ASpSeALSTegC7k9b7EYd+GZJcWalzGEl/NI5fqhjrIfMHsFFdj2z4l?=
 =?us-ascii?Q?4wdUjGYdGtrQEmfavh+fDIbMfWrUN/KsYxbcF9LPgbUa6CSmcHJwvxXScdTB?=
 =?us-ascii?Q?ot84Ti9r7vPiS7sHAqA3ExQ2Ze28RUXeY7ftISQr29XI2ntGAqDF1Y7G4P1Y?=
 =?us-ascii?Q?3m8Z691xbD+rPGf3/xyMsKPguuNMYHX8IPd2ncKALADFHCWxz0O7TKPVWUt0?=
 =?us-ascii?Q?/ibDiJRsGQV1NHaeNYObBfaeNiCx7M+9HXTyCyVUXdY8zk2bsfMJHJ19dw+N?=
 =?us-ascii?Q?Rt28BG9y5fS5vYEtK5wLxqrkGmN2KfbAHtO68YR+ModMuUCvB1dKxje2lEE4?=
 =?us-ascii?Q?pwH9zVAoxEXC6N5KFGYWpfqwq0J1G0F6BKsksL4GDm+R4jIV1gKHE0hRJ1mY?=
 =?us-ascii?Q?Q0p32t/+9zbqrpw8WtknFWrClyvbFUOSDCotfR683hk64wu1GRdkN6HlY0e0?=
 =?us-ascii?Q?635f/4OKnDfcGeSnHwY/bax5pZ2cUX9u3VM2JRgHM5IXqHLJIL3kmmos/N5K?=
 =?us-ascii?Q?828vdctlBUbHe8Rqo4mleXrcEQOqOKDN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HSCfY/Gvaakzc4OrC8RdBpAIWOY2CCuPdttUwrBFcMmLE6mgiZpigbnnfVSN?=
 =?us-ascii?Q?OKjf/oA8pEIzdvwSep3w+L1OSxvw26I0zArEiNfiysJ2uyJuEV+VjlybCJxa?=
 =?us-ascii?Q?quf3jKwGKVs6ZSZDDDdnhhjaWMKyGVlAhB8kND8snxCiaf1yEQfRjElAB8pZ?=
 =?us-ascii?Q?AgsCQVGKp+xnHfVOajVA6Hktdw3gVYlIhvr8sND1JK833YLJlyzn5gZ4EPgs?=
 =?us-ascii?Q?RoLB/wOjThATLZEHvum02HaDkIytVEY7W8+PI0BJWKm5LgmefmiqXQAfxhJj?=
 =?us-ascii?Q?+7MC2gYC3cpfDMacgPio3mxtGANrU4/fJHJ6BRpdgSlM9ZRmidvLuT1Lut96?=
 =?us-ascii?Q?Y9jI/oBsrcyTJzQYX0EEhHXLb5RqkKGxOE2bN6TYZRA6v0RT9IEYOfjhRZdK?=
 =?us-ascii?Q?u6dOc57+MgquaAubhFh7GsIZ16W+xalwNCr0aoYzov1WDCkgy99F3LdnsoYm?=
 =?us-ascii?Q?tuh9SX7MYoB8lpIueaXGhhL/4HFktfvH2VAXCLUvq/muwUQCaOXjJQC7svdG?=
 =?us-ascii?Q?re2VFPOPo4OcwnBZh61rxOjEbxlBlakAwZGX8xVGuGPtXGAjwMZb23X8UjEA?=
 =?us-ascii?Q?eyvUmrId+7U6Uk28Zn0FFth+/DmQwlgHFgyup52C4C+tU98PobLvvBuXBY/i?=
 =?us-ascii?Q?vNCuqyCwatLq+Y/fZ0LoDZClIxtLpzrsm0HJ1K63t6Rp0P9avTUfx5DLZH51?=
 =?us-ascii?Q?mA7/CPSA95NpAa+YWnN12WA4a8MMMRrCU7feDRpiCB2LVlpnnSNXbb+iYVO2?=
 =?us-ascii?Q?qRdrEF/x6tB8BvprVMnTMC+1XEAz/Lq72D1J5jjoUd9YxSRgDXbsgiBLVTU4?=
 =?us-ascii?Q?IfpK/OFtvKhyIXduGhSW7YC3dd5Mar5JuittEl3auRJ5hiBx28qYAGLclUCy?=
 =?us-ascii?Q?8QY1+zN98O6PtYtigT0DDJdtlq/szZ6Q6LT3C0Npbu/4StlDOPX122fLw9z7?=
 =?us-ascii?Q?sBMMdNAl73PEnT3PO2yLXZBIpt9Zl7CW1D4LIOP1oBqJFDd/JEHcN12eRdob?=
 =?us-ascii?Q?6BJglrNtChZV9qmioWZJ0ho2EqJrPjmhzJhmdn1iN/wbhlpNCY5PST6+i1z4?=
 =?us-ascii?Q?9DHfmkDIlWKgcMK5rq4fCbRDWQ7JZuwf6L1FQi9SNz5xpHCxLQLhU0xCh3Jc?=
 =?us-ascii?Q?PFRd5w5/rncPe/fBCMHCS7migUSANDjdcIiTg5GfogiwvET8nS7H8wQpFPqI?=
 =?us-ascii?Q?8gXZYOzgo+rFR9SzQTsQDLNrEXHANy0hot57gkHOjrwW3MID9CDDJ3NvxQ4h?=
 =?us-ascii?Q?9Y0rC4zRFA7TNxlipL21AEfIXuTWxErX7ASgw6bCclMeUt94TumtwH1D6FJw?=
 =?us-ascii?Q?kWbleF5EZ5T7+6EWV4EuT6/pfeIPJvQW0gRZpVIgSNBQoAjVlLJDyG7kez/H?=
 =?us-ascii?Q?zCjLR4UkRhS96NX1v88LTeoaRDjkIzgMNzzkgQZqFR3w1xQw9bG+O3a4vUfQ?=
 =?us-ascii?Q?8wlowZbiwoEqe4IQ8TJhHQrsk4P+9dNWQt0Y6J9bmH+MWYc7HkxiSFx5UnUO?=
 =?us-ascii?Q?wEWFdvR5iGiJqkxBm5ICubhvw6ZHEOWvoWsfeyPNkND43zdLrOdrpx6kgblR?=
 =?us-ascii?Q?PHpTC5Q4j4973lkVCMA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b0ae23-d5a5-4bd0-dfa9-08dd45ff9007
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:10:09.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3fEClKPHdZugrz6vA5Bm/PCyij6EvfwQY/VRfI5uKO2/3E61QYakBMk/opSfXuzBBP4bMQ8LQTyLm9k6tvNgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7348

On Tue, Feb 04, 2025 at 06:59:53PM +0200, Laurentiu Mihalcea wrote:
>
>
>
> On 2/3/2025 9:52 PM, Frank Li wrote:
> > On Mon, Feb 03, 2025 at 12:18:00PM -0500, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> The SOF drivers for imx chips have a lot of duplicate code
> >> and routines/code snippets that could certainly be reused
> >> among drivers.
> >>
> >> As such, introduce a new set of structures and functions
> >> that will help eliminate the redundancy and code size of
> >> the drivers.
> > please wrap at 75 chars
>
> sure, fix in v2
>
>
> >
> >> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> >> ---
> >>  sound/soc/sof/imx/imx-common.c | 419 ++++++++++++++++++++++++++++++++-
> >>  sound/soc/sof/imx/imx-common.h | 149 ++++++++++++
> >>  2 files changed, 567 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
> >> index fce6d9cf6a6b..5921900335c8 100644
> >> --- a/sound/soc/sof/imx/imx-common.c
> >> +++ b/sound/soc/sof/imx/imx-common.c
> >> @@ -1,11 +1,16 @@
> >>  // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> >>  //
> >> -// Copyright 2020 NXP
> >> +// Copyright 2020-2025 NXP
> >>  //
> >>  // Common helpers for the audio DSP on i.MX8
> >>
> >> +#include <linux/firmware/imx/dsp.h>
> >>  #include <linux/module.h>
> >> +#include <linux/of_reserved_mem.h>
> >> +#include <linux/of_address.h>
> > keep alphabet order
>
> ok
>
> >
> >> +#include <linux/pm_domain.h>
> >>  #include <sound/sof/xtensa.h>
> >> +
> >>  #include "../ops.h"
> >>
> >>  #include "imx-common.h"
> >> @@ -74,5 +79,417 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
> >>  }
> >>  EXPORT_SYMBOL(imx8_dump);
> >>
> >> +static void imx_handle_reply(struct imx_dsp_ipc *ipc)
> >> +{
> >> +	unsigned long flags;
> >> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
> >> +
> >> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
> >> +	snd_sof_ipc_process_reply(sdev, 0);
> >> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
> > Are you sure have to use spin_lock?
>
> not sure, this definition was taken from previous drivers. I'd say keep it for now
> as removing it would require some more testing which will take some time.
>

Change lock type need seperate patch. analyze is more important then test.
It is really hard to hit race condition at normal user case.

You can check if any irq handle use ipc_lock? If irq handle already defer
to thread irq, mutex most likely is enough.

Frank

> (snip)
>
> >> +static int imx_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
> >> +{
> >> +	int ret;
> >> +	const struct sof_dsp_power_state target_power_state = {
> >> +		.state = target_state,
> >> +	};
> >> +
> >> +	if (!pm_runtime_suspended(sdev->dev)) {
> >> +		ret = imx_common_suspend(sdev);
> >> +		if (ret < 0) {
> >> +			dev_err(sdev->dev, "failed to common suspend: %d\n", ret);
> >> +			return ret;
> >> +		}
> >> +	}
> >> +
> >> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
> > does pm_runtime_force_suspend()/pm_runtime_force_resume() work?
>
> no, these functions are not called directly by the PM core, but rather by the SOF core.
> Using the proposed functions would result in the SOF core PM functions (i.e: sof_resume/sof_suspend)
> being called twice in the case of system suspend/resume, which is wrong.

Does SOC core should check it? I don't reject this change, but check
run time pm status in suspend often cause some bugs.

Frank

>
> (snip)
>
...
