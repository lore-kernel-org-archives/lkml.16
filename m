Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022121.outbound.protection.outlook.com [40.107.75.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD851E51FE;
	Tue, 20 May 2025 04:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713998; cv=fail; b=f6KrFM390dt1qmmFPoEle7VAvZjsZ2XG+wH0oCefFWpwL95GRNfu9MNexfiMkIyUW2kyWzCVTYcmHOWzoeFEV97vfRsZMKS+r1YNCuLEH4l0PpTA+UJR+phZA5NvBbvPHBGkkdjFDM/iUt1xotLI7epaW+I0zfNVjP8FWrRS4ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713998; c=relaxed/simple;
	bh=k3O8+UlU/1e97Uj7wLFajZusexYnN7XRSuC+J4L2FvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6hlzpMM6JOtC0cBNWQdDp4Jdsdd3PEEyltVP+Lz3+k9p2kW3wDXDohdtPl21cQYjydUSqr0n7G1cpk7kxF8iI4xyYtjgyko/UvVtjJsNvuzJAttvuXV1ta0eMTEuIzagSS1k2q5bMknSSu9h9nM7JGTUoC54UPtl2AXEbjWDJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUhXYLqbIWkSQCoN77P4fCVkBS4JvmuiloV9cbCZY6eRI5E85K4JC3Hx9Nb939qtTCepRDe20sveDpS/ujQ8Ff81FtFoB/U2OAiJ1gD9A8eyAqeMZAkg9MN9xgmEFLfC92qPX+KY4jvBbv2Z/m+/iIv5NmU1TlckR7uDsfgjBlsAXxbcqFQl02kI574bgb9eRAtUHH0QuEa3zbHtweRgsHNtzWQ1sEsu2Hy/gdtFv4r0ncZ2eDTZqGr0A7Wv+Le2+CXY/tBGPgEZ6hKEpMKk+o3yAWn93KCEGtR/8IPeQ19JNFB4pFzg7jRuBLmZ2x/yz2/8fNIbDZO+LJAL1Vzw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHQ9PjkVRFQYPfJnACZEp48qV1JwY3YsU1pngAMcgeo=;
 b=YWht9kUCsqxHg1ppH7eBFUZ3faBAdP08JFTMLp6xVHWQ90zae8qx+BLU+fh3VxOZnkvVVssIGfrQgzBzxHQRzqdSBmeLF9g5pqBLyggmUQLaDPReO1tnLURHoLfEpR+cR+dnqmJVYqjUemau/zwv2XI8TKVYZBHaFZf9M9y38iQB6XZ16SKnGK5K+V9ol1IZBoj8/bQsyItC1rUWpttdhNSezueNAYYdscPV/KoH0Wo3oGlRgej13TuV5vhVrJa2ynuDB2mptxPxhCDNS/oZupTrIktIL8jMRiKRSVdlL7X4P9yz9+ieHermk7dq30Zrb+UHnOYAcKi30pMERHzhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0214.apcprd04.prod.outlook.com (2603:1096:4:187::17)
 by KU2PPF6B67D0B99.apcprd06.prod.outlook.com (2603:1096:d18::49c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 04:06:27 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:187:cafe::f0) by SG2PR04CA0214.outlook.office365.com
 (2603:1096:4:187::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 20 May 2025 04:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 04:06:27 +0000
Received: from gchen (unknown [172.20.64.84])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C8DF240A5BFE;
	Tue, 20 May 2025 12:06:24 +0800 (CST)
Date: Tue, 20 May 2025 04:05:38 +0000
From: Guomin chen <guomin.chen@cixtech.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: peter.chen@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	maz@kernel.org, sudeep.holla@arm.com, kajetan.puchalski@arm.com,
	eballetb@redhat.com, Gary Yang <gary.yang@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: Re: [PATCH v8 5/9] mailbox: add CIX mailbox driver
Message-ID: <aCv/ksNjpYcOMZCj@gchen>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
 <20250513020327.414017-6-peter.chen@cixtech.com>
 <CABb+yY2fj13YDCYD9B-Hwta47=+CLy6eGSOOc_ez2HrR4-xbjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY2fj13YDCYD9B-Hwta47=+CLy6eGSOOc_ez2HrR4-xbjg@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|KU2PPF6B67D0B99:EE_
X-MS-Office365-Filtering-Correlation-Id: 194e9ad2-0fe5-4edd-ba1f-08dd9753b186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KzPg9oziBBUDuwiGMOhWM+ijPuGHqZuGDWaq+O9eFQm2uNr3E8+3NX8kPmO1?=
 =?us-ascii?Q?BDgP3nTvzv6h+HEv1Jq1FsQs3BARlxfN6JW3PBNHhdZeb5zd6oswAaau22Ko?=
 =?us-ascii?Q?3ZZGfPWjbl1MvgSyZColJmj20WzfozWl+0C0EDCu4CaX3arjb1Xf2VFyXpr9?=
 =?us-ascii?Q?cbFlfh9qCg/YfIsYlO4vIZJZYku6ZteVplro//NQYMxD5Nkwoh0o9uhQGE0C?=
 =?us-ascii?Q?9DO95I+twztMwSN2oqJJcj0fzFHmYHZr67o6k8SFD5NOsKinUckAJLwdxJfJ?=
 =?us-ascii?Q?Z+PayVobsVx+ffFQbDLqNtvkMlMf1pp1PiQl2i5DgOHlv49avt9K2gJXHxEc?=
 =?us-ascii?Q?ZNGLWy+z+/t1EM0JrrUTZr5ZPh236hNANyc3xit41RZ2ZzuiULB2mOWoFplO?=
 =?us-ascii?Q?1gD7avTsEMnJYI1DKtf/QSvOfhCyv6NlA8ruZu6MY67KV8Q3R5IMfGv6pqFk?=
 =?us-ascii?Q?f4C7nvY43W+Ztp1L9sI5d6mEFemJjU7B3/5KL6hgRiSIWWdemB5D/yhweH/T?=
 =?us-ascii?Q?iO2OqVuYyd5Bd6whe/d009gvEp9/wlicQcxUFTK+OTFNktj/Q/Mp2VHtoa/C?=
 =?us-ascii?Q?Uz4IsKIZz89leef7GknFJ2FFrCDFvb7GI6q3wYcUeWsZJY8zH2BUXtTiX6zb?=
 =?us-ascii?Q?mBw6wh7uSQhZ2bFrxuIZriiZG6B6kGzp9PRikytulDLoV7v58eNlNaD+vrUU?=
 =?us-ascii?Q?4usw2S2sK4mg48Nq4wNuMTxeOLTYOMYAjKY1Sg+kAbwTdY1WpohOas8eyGg4?=
 =?us-ascii?Q?sG0vylbsLx8CZMQB9uCtpXR6QVLKrcJa2LVqx5JxZqOg7/4ZJk8JZ1u4egeX?=
 =?us-ascii?Q?fMaW9d6G3Ftx2IxAtozUDrVlk6Qh2rzmJgX4O7n+rNnGR+3AxZ4JLefJcZu4?=
 =?us-ascii?Q?UUuDG3bb5wfg4LqD21+JFiE/O2rutqkqqBkISpUkiamVzEJIl2NqSMZNH5JP?=
 =?us-ascii?Q?D4SRRZ1QNa1XAnl7iNTRKtnCMMtc0a5F9+RQjAqnBpmJcq3p/svQrIw//B1T?=
 =?us-ascii?Q?IwTV2qgTErQu+NErQHZB7SvkFDKFcWISL05f0cRW8EYNjfngjZTiKTUAuLVh?=
 =?us-ascii?Q?vaBkurBzu2mFoHNp6Ti72DmhjVXax0wTBrdUtTKsUVVnHadPF17/L2Er5u4K?=
 =?us-ascii?Q?fvUNeyndT8p2BI5sMV8vLgctCeL9f9es5PtvGl/HJdtMLXZiZxme2egOOKaw?=
 =?us-ascii?Q?qEhtIsWiUyQssWD23lGeytYh4Owm9o//f0ULJKmK05jPufPVhZhF8K7haG63?=
 =?us-ascii?Q?dUD3iAJJhklem0EFrYi8KuEy5o15kDL/LshF5VBBqUWwd9Ptiyq2RbpJJuTU?=
 =?us-ascii?Q?QDuaQAC+hvhnzw6Gcv8JgThZjQ9pp1Qpy9CoZDID8BEA4R6+fppyYJe65LkT?=
 =?us-ascii?Q?+Qzo4Q8tKUl/xh6RsPEVeVcSH/mtYHlAUCXFBhRdQg79DPx/fcsKjVtWeY+u?=
 =?us-ascii?Q?bcMEigpZHsXFwFrrZ2pq0hWRjJWGb+WvfTXCXqxj1Z79wk8tPiQpf6szRO8o?=
 =?us-ascii?Q?mjZx/Zwwe05COfOXyB3lRVLpVIPfRrB8unoV?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 04:06:27.1084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 194e9ad2-0fe5-4edd-ba1f-08dd9753b186
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF6B67D0B99

On Mon, May 19, 2025 at 12:46:54PM -0500, Jassi Brar wrote:
> [Some people who received this message don't often get email from jassisinghbrar@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> Hi,
> 
Hi Jassi 
  Thank you for your feedback.
> > diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> > new file mode 100644
> > index 000000000000..c2783dd7d145
> > --- /dev/null
> > +++ b/drivers/mailbox/cix-mailbox.c
> > @@ -0,0 +1,632 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2025 Cix Technology Group Co., Ltd.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "mailbox.h"
> > +
> > +/* Register define */
> > +#define REG_MSG(n)     (0x0 + 0x4*(n))                 /* 0x0~0x7c */
> > +#define REG_DB_ACK     REG_MSG(CIX_MBOX_MSG_LEN)       /* 0x80 */
> > +#define ERR_COMP       (REG_DB_ACK + 0x4)              /* 0x84 */
> > +#define ERR_COMP_CLR   (REG_DB_ACK + 0x8)              /* 0x88 */
> > +#define REG_F_INT(IDX) (ERR_COMP_CLR + 0x4*(IDX+1))    /* 0x8c~0xa8 */
> > +#define FIFO_WR                (REG_F_INT(MBOX_FAST_IDX+1))    /* 0xac */
> > +#define FIFO_RD                (FIFO_WR + 0x4)                 /* 0xb0 */
> > +#define FIFO_STAS      (FIFO_WR + 0x8)                 /* 0xb4 */
> > +#define FIFO_WM                (FIFO_WR + 0xc)                 /* 0xb8 */
> > +#define INT_ENABLE     (FIFO_WR + 0x10)                /* 0xbc */
> > +#define INT_ENABLE_SIDE_B      (FIFO_WR + 0x14)        /* 0xc0 */
> > +#define INT_CLEAR      (FIFO_WR + 0x18)                /* 0xc4 */
> > +#define INT_STATUS     (FIFO_WR + 0x1c)                /* 0xc8 */
> > +#define FIFO_RST       (FIFO_WR + 0x20)                /* 0xcc */
> > +
> > +/* [0~7] Fast channel
> > + * [8] doorbell base channel
> > + * [9]fifo base channel
> > + * [10] register base channel
> > + */
> > +#define CIX_MBOX_CHANS         (11)
> > +
> > +/*
> > + * The maximum transmission size is 32 words or 128 bytes.
> > + */
> > +#define CIX_MBOX_MSG_LEN       (32)    /* Max length = 32 words */
> > +#define MBOX_MSG_LEN_MASK      (0x7fL) /* Max length = 128 bytes */
> > +
> >
> Move these above register defines where these are used.
> Also, no need for brackets around numbers. Here and elsewhere.
> ....
Okay, I will move these two macros to the beginning and
remove the brackets around numbers.

> > +
> > +static void cix_mbox_isr_reg(struct mbox_chan *chan)
> > +{
> > +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> > +       u32 int_status;
> > +       u32 data[CIX_MBOX_MSG_LEN];
> > +       int i;
> > +       u32 len;
> >
> cosmetic: tidy these up by merging and sorting in reverse christmas tree.
> 
Okay, I will make an overall adjustment according to this rule.

> > +
> > +       int_status = cix_mbox_read(priv, INT_STATUS);
> > +
> > +       if (priv->dir == MBOX_RX) {
> > +               /* rx interrupt is triggered */
> > +               if (int_status & DB_INT) {
> > +                       cix_mbox_write(priv, DB_INT, INT_CLEAR);
> > +                       data[0] = cix_mbox_read(priv, REG_MSG(0));
> > +                       len = mbox_get_msg_size(data);
> > +                       for (i = 0; i < len; i++)
> > +                               data[i] = cix_mbox_read(priv, REG_MSG(i));
> > +
> > +                       /* trigger ack interrupt */
> > +                       cix_mbox_write(priv, DB_ACK_INT_BIT, REG_DB_ACK);
> > +                       mbox_chan_received_data(chan, data);
> > +               }
> > +       } else {
> > +               /* tx ack interrupt is triggered */
> > +               if (int_status & ACK_INT) {
> > +                       cix_mbox_write(priv, ACK_INT, INT_CLEAR);
> > +                       mbox_chan_txdone(chan, 0);
> > +               }
> > +       }
> > +}
> > +
> > +static void cix_mbox_isr_fifo(struct mbox_chan *chan)
> > +{
> > +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> > +       u32 data[CIX_MBOX_MSG_LEN] = { 0 };
> >
> Is it really needed? Can we do with just zeroing the byte after valid data?
> At least move it under "FIFO waterMark interrupt is generated", so it
> is only done when needed.
Yes, In some cases it is not necessary.
I will move this under "FIFO waterMark interrupt is generated." 

> > +
> > +static int cix_mbox_startup(struct mbox_chan *chan)
> > +{
> > +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> > +       struct cix_mbox_con_priv *cp = chan->con_priv;
> > +       int ret;
> > +       int index = cp->index;
> > +       u32 val_32;
> > +
> > +       ret = request_irq(priv->irq, cix_mbox_isr, 0,
> > +                         dev_name(priv->dev), chan);
> >
> Can we do this later just before returning from the function? Or
> atleast free the irq before error returns.
This cannot be done before the return, as it needs to be registered
before the interrupt enable register. 
However, I do need to free this IRQ before the error return.

> Also please make sure you run scripts/checkpatch and have all warnings cleared.
I have already run scripts/checkpatch to perform the check. 
The warning you mentioned is due to the need to update the MAINTAINERS file for
the newly added files, right?

Thanks
Guomin Chen
