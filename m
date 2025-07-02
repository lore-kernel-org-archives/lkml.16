Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023099.outbound.protection.outlook.com [40.107.44.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5640072637;
	Wed,  2 Jul 2025 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418530; cv=fail; b=htjfA3SPDv7qu2rm3DHvKylylIp4oFsJEQH22+Q0jThQzeYg0ajPElKpbWaO1nUBk5l5/nqsFGwFuxAJFc7NzWKfsfWuOvNk4FZKvkW4UWjqRnIo1s2D8qQQWh0iDn8GmK2E2oYapLzjbOCA/H9t4EqTJe1IJJL3Fv6AO1vbZAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418530; c=relaxed/simple;
	bh=Q+83ReYIREi2z+kpkDbc/lWc2hmdzN6UNT9OkFkRnT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAjU9VcE3c1bQVu0Qb4QaXe7XPWmdrs9cV7JTKjqWGAmZuGYtlqsUeXmzx7B5Xy4+WOgGdBsNr9RJy9QVh76EI3Q0PhuPsXRI8kCeS8f20gt7cl9IYuaDfv+21sbTVtxF2yuwFeyZDJ+eyeoU5OHDIMKkRtu2KVadLnPPkizk/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk3XR9cNsxDPRHC7jOLNfNA7LXdoRB2yZg/D+bH3zcCeNesfXPQdzpgr5F/M4y74g6cmksZ62nyRrNcuN1OyvuFwZ04sPup2RDFuGx04rOFshblI5m/HzR7WJ8stI8kDzhxGAiO/VYihAcQOwjbTpzJablvrnMGpbB05h6wEm8CZwgpH1X7KzyPPsj1QKwwIjJ7TGntVuZ46gEKWvx63t3IzfNEwOqwSDP+6Ovbps5gPfQWtUBSIYqpU7vt0vq9jPlK67I8Six0fKL6ofI1neLGvdk7frY1jA0SoN7mgSLql0Aiw9Jhz7FJ3FDTzarDw25Pauw+VfihU/4SJPIlUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPdUrnuwZaOfmraDIavj++69sz0H/U7ywOtY7+y38Yw=;
 b=ygpAn5j/WyYBM9x25DN+ynnTKS4qX/5sC0hEm+0qiM7gwy/Ig5YaOapzkT1d1+omInWvbqln0yIk8Ehon8u5igamILBW7F5FESd205R0JvenupXSaM7mT+B2JY0oc9XoFhxt/1LWMPjGXd181aB8bnME2foddEs0yq0EPMOhqqM1cpeXICoAw4OEehQpGJuBwGIaL8mDJnYiVnDIqOKzZJ2ELdEce7+KqAIvd8uN42mFJ410UEr5AD3eBFO3imaOx5kk1F44GH2rJG06tECehBddXNWb0jBm7LWMAJSEH/vFSXE5sP42RL3TLr8alUmq28cqGHM6pNDktqWCoxLVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0006.apcprd02.prod.outlook.com (2603:1096:4:194::8) by
 SG2PR06MB5082.apcprd06.prod.outlook.com (2603:1096:4:1c9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Wed, 2 Jul 2025 01:08:40 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::95) by SI2PR02CA0006.outlook.office365.com
 (2603:1096:4:194::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 01:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 01:08:39 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 694ED40A5BD6;
	Wed,  2 Jul 2025 09:08:38 +0800 (CST)
Date: Wed, 2 Jul 2025 09:08:33 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: <robh@kernel.org>, <arnd@arndb.de>, <jassisinghbrar@gmail.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cix-kernel-upstream@cixtech.com>,
	<maz@kernel.org>, <sudeep.holla@arm.com>,
	<kajetan.puchalski@arm.com>, <eballetb@redhat.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
Message-ID: <aGSGkU9Gj_MubOJM@nchen-desktop>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609031627.1605851-6-peter.chen@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SG2PR06MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5f558d-fd7d-416d-3702-08ddb904faaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OG8MC7qHGLg7SLCXyHM0XizeDznQV42h6HmwY/81qApBJQd0Ecq/itdgQ187?=
 =?us-ascii?Q?+A2cdCIlbs6bdav/5jO4M2cENYjItoJNFnNN/GxrnjyBcIVaSgGcfUrd38YM?=
 =?us-ascii?Q?RyoAjJZfUzCzjuy1NBbsOqRxtW83UYGWzvK7r+UHz29MtBSqA9XaDpbtd1cB?=
 =?us-ascii?Q?DLFrJRuOCbIgNo79QCBUK0iLLBuqzubhJKD5/xg/z8/lL20oxKzX9Q+X38D6?=
 =?us-ascii?Q?b8DCMa9eh0ZxQVstOwvAhhXRxgPL3hgWaEk3aGY5yEqiNyD+NWR/8GAhUSWa?=
 =?us-ascii?Q?nkLuq0V8ZqP5O0WeJs1GIKHfZh9G36PP0Ofuf5Vn4wIaTSqTI30WojuTVmKP?=
 =?us-ascii?Q?8sBvtLVz61RxfvIBnI4EVDs0B196YUyizx/JtG/hIfcHYj0U9JSu4mv3pFBL?=
 =?us-ascii?Q?NfwXbfkmzyE8QenEGKAJ16BQOgKtABNPSu52kS66iVRglgWw5ZYXlP/8JqkZ?=
 =?us-ascii?Q?HFixVX8wNRIuPabvJEy9QhPp01KiZ0bCh1MbX2KtOdz+3Hn5JHXbQjyV48dd?=
 =?us-ascii?Q?Q/okISA6Xb8umuyA3hjCcofejc4cyLb8wjfk0XjErN+gg7eGi63QeC6WDi8T?=
 =?us-ascii?Q?bFj5VmMi2aVSvVpAv/lUkrtHuJUp2NNITpIpQmOZ5e4xSuX1NcqjdFGnqlks?=
 =?us-ascii?Q?E9DSNOHx8Oc/OZ5XJxtZmi7mxd0kJUy7oE7A8ODOM/+5q4vIA+/+qhXgpN4P?=
 =?us-ascii?Q?TdlOgVKc3mdM4L9yqh4Tj4VO65OfB/GpPzJ03bWAA3vGhjG8REPO6Ujrteq4?=
 =?us-ascii?Q?6QRKpTskdk4KU/vLThpUuefNEvX8YN2tTKwp14NhmO3w9ZaP0Z4XjGC46NZG?=
 =?us-ascii?Q?P2BXchKmmz6P1y+w6pB7eJC03/yDZsxLmwQJKrxtTiVuidO0Gw4DoCrkd29A?=
 =?us-ascii?Q?l2P78Q9NfZNLtuPb584MviyLdHQmlagyT+iE7lAAI6jmzhu3pV5GDSdTh5r6?=
 =?us-ascii?Q?oyY4++A9Bba4nIV4lf8IVCDEyYYxMsUNxIqgMZuLD3R7bbDDBzDDco/Z2pAf?=
 =?us-ascii?Q?vFtWkE0CdLOfx53AJaXh4QKIzFpvVaysvQVnf9DpG/0zNBIAnFjjw9VqGZHy?=
 =?us-ascii?Q?xyikW49ZS4pv4qPqy7+u43NqxrfidRDd8IG2EHfsM7TpJyJ21ILiW1tx17ID?=
 =?us-ascii?Q?iaIt2q43NKs8XGIjOXBgGCzbEk8xdUGrFFeDZ1Shud+pAubalcoMpeSp8F7e?=
 =?us-ascii?Q?UGl5Bctem3kZYkWTYPhPfHt+kBe3CB9So+QDizo0mpHIby23Lc/QVUqgy6sy?=
 =?us-ascii?Q?jRfox+Jgs/lxUUdAfkGMO+Tm/7WjRuHyLhFOyaHSjASMzsfoPrRVvKRkWyqX?=
 =?us-ascii?Q?wPfBsgp5No5m/lGosTMB0EuY2vcVYmyoGBukksbMO1IMcRuLgN87qoapzGd9?=
 =?us-ascii?Q?WbxmbWIuPN9WG9QPaqHJQRKigHrw8h6JapxxCAcaIlYLpDsqBGfrTtzv5f2d?=
 =?us-ascii?Q?qr1nQyXZWSEVBs1OgZtiTviT05tU8+/5IlmKyyUSSkknWVDCacQ7brgQwK+y?=
 =?us-ascii?Q?wkrM2kLzg0jsIV7ICtkCxUHPXMa+ymUHFqjh?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 01:08:39.1212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5f558d-fd7d-416d-3702-08ddb904faaa
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5082

On 25-06-09 11:16:23, Peter Chen wrote:
> From: Guomin Chen <Guomin.Chen@cixtech.com>
> 
> The CIX mailbox controller, used in the Cix SoCs, like sky1.
> facilitates message transmission between multiple processors
> within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> and others.

Hi Jassi,

A gentle ping.

Peter

> 
> Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
> Changes for v9:
> - Move macro definitions above where they are used
> - Remove the brackets around the number
> - Merging and sorting local variable definitions
> - free the irq in the error path
> 
> Changes for v3 (As mailbox patch set):
> - Update MODULE_AUTHOR.
> - Remove the extra blank lines.
> 
> Changes for v2 (As mailbox patch set):
> - Update the real name and email address.
> - Remove the ACPI header files.
> - Update the Copyright from 2024 to 2025.
> - Update the Module License from "GPL" to "GPL v2"
> - Add an interface for message length to limit potential out-of-bound access
> 
>  drivers/mailbox/Kconfig       |  10 +
>  drivers/mailbox/Makefile      |   2 +
>  drivers/mailbox/cix-mailbox.c | 635 ++++++++++++++++++++++++++++++++++
>  3 files changed, 647 insertions(+)
>  create mode 100644 drivers/mailbox/cix-mailbox.c
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 68eeed660a4a..4fef4797b110 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -340,4 +340,14 @@ config THEAD_TH1520_MBOX
>  	  kernel is running, and E902 core used for power management among other
>  	  things.
>  
> +config CIX_MBOX
> +        tristate "CIX Mailbox"
> +        depends on ARCH_CIX || COMPILE_TEST
> +        depends on OF
> +        help
> +          Mailbox implementation for CIX IPC system. The controller supports
> +          11 mailbox channels with different operating mode and every channel
> +          is unidirectional. Say Y here if you want to use the CIX Mailbox
> +          support.
> +
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 13a3448b3271..786a46587ba1 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -72,3 +72,5 @@ obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
>  obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
>  
>  obj-$(CONFIG_THEAD_TH1520_MBOX)	+= mailbox-th1520.o
> +
> +obj-$(CONFIG_CIX_MBOX)	+= cix-mailbox.o
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> new file mode 100644
> index 000000000000..eecb53d59dfe
> --- /dev/null
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -0,0 +1,635 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "mailbox.h"
> +
> +/*
> + * The maximum transmission size is 32 words or 128 bytes.
> + */
> +#define CIX_MBOX_MSG_LEN	32	/* Max length = 32 words */
> +#define MBOX_MSG_LEN_MASK	0x7fL	/* Max length = 128 bytes */
> +
> +/* Register define */
> +#define REG_MSG(n)	(0x0 + 0x4*(n))			/* 0x0~0x7c */
> +#define REG_DB_ACK	REG_MSG(CIX_MBOX_MSG_LEN)	/* 0x80 */
> +#define ERR_COMP	(REG_DB_ACK + 0x4)		/* 0x84 */
> +#define ERR_COMP_CLR	(REG_DB_ACK + 0x8)		/* 0x88 */
> +#define REG_F_INT(IDX)	(ERR_COMP_CLR + 0x4*(IDX+1))	/* 0x8c~0xa8 */
> +#define FIFO_WR		(REG_F_INT(MBOX_FAST_IDX+1))	/* 0xac */
> +#define FIFO_RD		(FIFO_WR + 0x4)			/* 0xb0 */
> +#define FIFO_STAS	(FIFO_WR + 0x8)			/* 0xb4 */
> +#define FIFO_WM		(FIFO_WR + 0xc)			/* 0xb8 */
> +#define INT_ENABLE	(FIFO_WR + 0x10)		/* 0xbc */
> +#define INT_ENABLE_SIDE_B	(FIFO_WR + 0x14)	/* 0xc0 */
> +#define INT_CLEAR	(FIFO_WR + 0x18)		/* 0xc4 */
> +#define INT_STATUS	(FIFO_WR + 0x1c)		/* 0xc8 */
> +#define FIFO_RST	(FIFO_WR + 0x20)		/* 0xcc */
> +
> +/* [0~7] Fast channel
> + * [8] doorbell base channel
> + * [9]fifo base channel
> + * [10] register base channel
> + */
> +#define MBOX_FAST_IDX		7
> +#define MBOX_DB_IDX		8
> +#define MBOX_FIFO_IDX		9
> +#define MBOX_REG_IDX		10
> +#define CIX_MBOX_CHANS		11
> +
> +#define MBOX_TX		0
> +#define MBOX_RX		1
> +
> +#define DB_INT_BIT	BIT(0)
> +#define DB_ACK_INT_BIT	BIT(1)
> +
> +#define FIFO_WM_DEFAULT		CIX_MBOX_MSG_LEN
> +#define FIFO_STAS_WMK		BIT(0)
> +#define FIFO_STAS_FULL		BIT(1)
> +#define FIFO_STAS_EMPTY		BIT(2)
> +#define FIFO_STAS_UFLOW		BIT(3)
> +#define FIFO_STAS_OFLOW		BIT(4)
> +
> +#define FIFO_RST_BIT		BIT(0)
> +
> +#define DB_INT			BIT(0)
> +#define ACK_INT			BIT(1)
> +#define FIFO_FULL_INT		BIT(2)
> +#define FIFO_EMPTY_INT		BIT(3)
> +#define FIFO_WM01_INT		BIT(4)
> +#define FIFO_WM10_INT		BIT(5)
> +#define FIFO_OFLOW_INT		BIT(6)
> +#define FIFO_UFLOW_INT		BIT(7)
> +#define FIFO_N_EMPTY_INT	BIT(8)
> +#define FAST_CH_INT(IDX)	BIT((IDX)+9)
> +
> +#define SHMEM_OFFSET 0x80
> +
> +enum cix_mbox_chan_type {
> +	CIX_MBOX_TYPE_DB,
> +	CIX_MBOX_TYPE_REG,
> +	CIX_MBOX_TYPE_FIFO,
> +	CIX_MBOX_TYPE_FAST,
> +};
> +
> +struct cix_mbox_con_priv {
> +	enum cix_mbox_chan_type type;
> +	struct mbox_chan	*chan;
> +	int index;
> +};
> +
> +struct cix_mbox_priv {
> +	struct device *dev;
> +	int irq;
> +	int dir;
> +	bool tx_irq_mode;	/* flag of enabling tx's irq mode */
> +	void __iomem *base;	/* region for mailbox */
> +	unsigned int chan_num;
> +	struct cix_mbox_con_priv con_priv[CIX_MBOX_CHANS];
> +	struct mbox_chan mbox_chans[CIX_MBOX_CHANS];
> +	struct mbox_controller mbox;
> +	bool use_shmem;
> +};
> +
> +/*
> + * The CIX mailbox supports four types of transfers:
> + * CIX_MBOX_TYPE_DB, CIX_MBOX_TYPE_FAST, CIX_MBOX_TYPE_REG, and CIX_MBOX_TYPE_FIFO.
> + * For the REG and FIFO types of transfers, the message format is as follows:
> + */
> +union cix_mbox_msg_reg_fifo {
> +	u32 length;	/* unit is byte */
> +	u32 buf[CIX_MBOX_MSG_LEN]; /* buf[0] must be the byte length of this array */
> +};
> +
> +static struct cix_mbox_priv *to_cix_mbox_priv(struct mbox_controller *mbox)
> +{
> +	return container_of(mbox, struct cix_mbox_priv, mbox);
> +}
> +
> +static void cix_mbox_write(struct cix_mbox_priv *priv, u32 val, u32 offset)
> +{
> +	if (priv->use_shmem)
> +		iowrite32(val, priv->base + offset - SHMEM_OFFSET);
> +	else
> +		iowrite32(val, priv->base + offset);
> +}
> +
> +static u32 cix_mbox_read(struct cix_mbox_priv *priv, u32 offset)
> +{
> +	if (priv->use_shmem)
> +		return ioread32(priv->base + offset - SHMEM_OFFSET);
> +	else
> +		return ioread32(priv->base + offset);
> +}
> +
> +static bool mbox_fifo_empty(struct mbox_chan *chan)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +
> +	return ((cix_mbox_read(priv, FIFO_STAS) & FIFO_STAS_EMPTY) ? true : false);
> +}
> +
> +/*
> + *The transmission unit of the CIX mailbox is word.
> + *The byte length should be converted into the word length.
> + */
> +static inline u32 mbox_get_msg_size(void *msg)
> +{
> +	u32 len;
> +
> +	len = ((u32 *)msg)[0] & MBOX_MSG_LEN_MASK;
> +	return DIV_ROUND_UP(len, 4);
> +}
> +
> +static int cix_mbox_send_data_db(struct mbox_chan *chan, void *data)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +
> +	/* trigger doorbell irq */
> +	cix_mbox_write(priv, DB_INT_BIT, REG_DB_ACK);
> +
> +	return 0;
> +}
> +
> +static int cix_mbox_send_data_reg(struct mbox_chan *chan, void *data)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	union cix_mbox_msg_reg_fifo *msg = data;
> +	u32 len, i;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	len = mbox_get_msg_size(data);
> +	for (i = 0; i < len; i++)
> +		cix_mbox_write(priv, msg->buf[i], REG_MSG(i));
> +
> +	/* trigger doorbell irq */
> +	cix_mbox_write(priv, DB_INT_BIT, REG_DB_ACK);
> +
> +	return 0;
> +}
> +
> +static int cix_mbox_send_data_fifo(struct mbox_chan *chan, void *data)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	union cix_mbox_msg_reg_fifo *msg = data;
> +	u32 len, val_32, i;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	len = mbox_get_msg_size(data);
> +	cix_mbox_write(priv, len, FIFO_WM);
> +	for (i = 0; i < len; i++)
> +		cix_mbox_write(priv, msg->buf[i], FIFO_WR);
> +
> +	/* Enable fifo empty interrupt */
> +	val_32 = cix_mbox_read(priv, INT_ENABLE);
> +	val_32 |= FIFO_EMPTY_INT;
> +	cix_mbox_write(priv, val_32, INT_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int cix_mbox_send_data_fast(struct mbox_chan *chan, void *data)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	struct cix_mbox_con_priv *cp = chan->con_priv;
> +	u32 *arg = (u32 *)data;
> +	int index = cp->index;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	if (index < 0 || index > MBOX_FAST_IDX) {
> +		dev_err(priv->dev, "Invalid Mbox index %d\n", index);
> +		return -EINVAL;
> +	}
> +
> +	cix_mbox_write(priv, arg[0], REG_F_INT(index));
> +
> +	return 0;
> +}
> +
> +static int cix_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	struct cix_mbox_con_priv *cp = chan->con_priv;
> +
> +	if (priv->dir != MBOX_TX) {
> +		dev_err(priv->dev, "Invalid Mbox dir %d\n", priv->dir);
> +		return -EINVAL;
> +	}
> +
> +	switch (cp->type) {
> +	case CIX_MBOX_TYPE_DB:
> +		cix_mbox_send_data_db(chan, data);
> +		break;
> +	case CIX_MBOX_TYPE_REG:
> +		cix_mbox_send_data_reg(chan, data);
> +		break;
> +	case CIX_MBOX_TYPE_FIFO:
> +		cix_mbox_send_data_fifo(chan, data);
> +		break;
> +	case CIX_MBOX_TYPE_FAST:
> +		cix_mbox_send_data_fast(chan, data);
> +		break;
> +	default:
> +		dev_err(priv->dev, "Invalid channel type: %d\n", cp->type);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static void cix_mbox_isr_db(struct mbox_chan *chan)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	u32 int_status;
> +
> +	int_status = cix_mbox_read(priv, INT_STATUS);
> +
> +	if (priv->dir == MBOX_RX) {
> +		/* rx interrupt is triggered */
> +		if (int_status & DB_INT) {
> +			cix_mbox_write(priv, DB_INT, INT_CLEAR);
> +			mbox_chan_received_data(chan, NULL);
> +			/* trigger ack interrupt */
> +			cix_mbox_write(priv, DB_ACK_INT_BIT, REG_DB_ACK);
> +		}
> +	} else {
> +		/* tx ack interrupt is triggered */
> +		if (int_status & ACK_INT) {
> +			cix_mbox_write(priv, ACK_INT, INT_CLEAR);
> +			mbox_chan_received_data(chan, NULL);
> +		}
> +	}
> +}
> +
> +static void cix_mbox_isr_reg(struct mbox_chan *chan)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	u32 int_status;
> +
> +	int_status = cix_mbox_read(priv, INT_STATUS);
> +
> +	if (priv->dir == MBOX_RX) {
> +		/* rx interrupt is triggered */
> +		if (int_status & DB_INT) {
> +			u32 data[CIX_MBOX_MSG_LEN], len, i;
> +
> +			cix_mbox_write(priv, DB_INT, INT_CLEAR);
> +			data[0] = cix_mbox_read(priv, REG_MSG(0));
> +			len = mbox_get_msg_size(data);
> +			for (i = 1; i < len; i++)
> +				data[i] = cix_mbox_read(priv, REG_MSG(i));
> +
> +			/* trigger ack interrupt */
> +			cix_mbox_write(priv, DB_ACK_INT_BIT, REG_DB_ACK);
> +			mbox_chan_received_data(chan, data);
> +		}
> +	} else {
> +		/* tx ack interrupt is triggered */
> +		if (int_status & ACK_INT) {
> +			cix_mbox_write(priv, ACK_INT, INT_CLEAR);
> +			mbox_chan_txdone(chan, 0);
> +		}
> +	}
> +}
> +
> +static void cix_mbox_isr_fifo(struct mbox_chan *chan)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	u32 int_status, status;
> +
> +	int_status = cix_mbox_read(priv, INT_STATUS);
> +
> +	if (priv->dir == MBOX_RX) {
> +		/* FIFO waterMark interrupt is generated */
> +		if (int_status & (FIFO_FULL_INT | FIFO_WM01_INT)) {
> +			u32 data[CIX_MBOX_MSG_LEN] = { 0 }, i = 0;
> +
> +			cix_mbox_write(priv, (FIFO_FULL_INT | FIFO_WM01_INT), INT_CLEAR);
> +			do {
> +				data[i++] = cix_mbox_read(priv, FIFO_RD);
> +			} while (!mbox_fifo_empty(chan) && i < CIX_MBOX_MSG_LEN);
> +
> +			mbox_chan_received_data(chan, data);
> +		}
> +		/* FIFO underflow is generated */
> +		if (int_status & FIFO_UFLOW_INT) {
> +			status = cix_mbox_read(priv, FIFO_STAS);
> +			dev_err(priv->dev, "fifo underflow: int_stats %d\n", status);
> +			cix_mbox_write(priv, FIFO_UFLOW_INT, INT_CLEAR);
> +		}
> +	} else {
> +		/* FIFO empty interrupt is generated */
> +		if (int_status & FIFO_EMPTY_INT) {
> +			u32 val_32;
> +
> +			cix_mbox_write(priv, FIFO_EMPTY_INT, INT_CLEAR);
> +			/* Disable empty irq*/
> +			val_32 = cix_mbox_read(priv, INT_ENABLE);
> +			val_32 &= ~FIFO_EMPTY_INT;
> +			cix_mbox_write(priv, val_32, INT_ENABLE);
> +			mbox_chan_txdone(chan, 0);
> +		}
> +		/* FIFO overflow is generated */
> +		if (int_status & FIFO_OFLOW_INT) {
> +			status = cix_mbox_read(priv, FIFO_STAS);
> +			dev_err(priv->dev, "fifo overlow: int_stats %d\n", status);
> +			cix_mbox_write(priv, FIFO_OFLOW_INT, INT_CLEAR);
> +		}
> +	}
> +}
> +
> +static void cix_mbox_isr_fast(struct mbox_chan *chan)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	struct cix_mbox_con_priv *cp = chan->con_priv;
> +	u32 int_status, data;
> +
> +	/* no irq will be trigger for TX dir mbox */
> +	if (priv->dir != MBOX_RX)
> +		return;
> +
> +	int_status = cix_mbox_read(priv, INT_STATUS);
> +
> +	if (int_status & FAST_CH_INT(cp->index)) {
> +		cix_mbox_write(priv, FAST_CH_INT(cp->index), INT_CLEAR);
> +		data = cix_mbox_read(priv, REG_F_INT(cp->index));
> +		mbox_chan_received_data(chan, &data);
> +	}
> +}
> +
> +static irqreturn_t cix_mbox_isr(int irq, void *arg)
> +{
> +	struct mbox_chan *chan = arg;
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	struct cix_mbox_con_priv *cp = chan->con_priv;
> +
> +	switch (cp->type) {
> +	case CIX_MBOX_TYPE_DB:
> +		cix_mbox_isr_db(chan);
> +		break;
> +	case CIX_MBOX_TYPE_REG:
> +		cix_mbox_isr_reg(chan);
> +		break;
> +	case CIX_MBOX_TYPE_FIFO:
> +		cix_mbox_isr_fifo(chan);
> +		break;
> +	case CIX_MBOX_TYPE_FAST:
> +		cix_mbox_isr_fast(chan);
> +		break;
> +	default:
> +		dev_err(priv->dev, "Invalid channel type: %d\n", cp->type);
> +		return IRQ_NONE;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int cix_mbox_startup(struct mbox_chan *chan)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	struct cix_mbox_con_priv *cp = chan->con_priv;
> +	int index = cp->index, ret;
> +	u32 val_32;
> +
> +	ret = request_irq(priv->irq, cix_mbox_isr, 0,
> +			  dev_name(priv->dev), chan);
> +	if (ret) {
> +		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq);
> +		return ret;
> +	}
> +
> +	switch (cp->type) {
> +	case CIX_MBOX_TYPE_DB:
> +		/* Overwrite txdone_method for DB channel */
> +		chan->txdone_method = TXDONE_BY_ACK;
> +		fallthrough;
> +	case CIX_MBOX_TYPE_REG:
> +		if (priv->dir == MBOX_TX) {
> +			/* Enable ACK interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE);
> +			val_32 |= ACK_INT;
> +			cix_mbox_write(priv, val_32, INT_ENABLE);
> +		} else {
> +			/* Enable Doorbell interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE_SIDE_B);
> +			val_32 |= DB_INT;
> +			cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +		}
> +		break;
> +	case CIX_MBOX_TYPE_FIFO:
> +		/* reset fifo */
> +		cix_mbox_write(priv, FIFO_RST_BIT, FIFO_RST);
> +		/* set default watermark */
> +		cix_mbox_write(priv, FIFO_WM_DEFAULT, FIFO_WM);
> +		if (priv->dir == MBOX_TX) {
> +			/* Enable fifo overflow interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE);
> +			val_32 |= FIFO_OFLOW_INT;
> +			cix_mbox_write(priv, val_32, INT_ENABLE);
> +		} else {
> +			/* Enable fifo full/underflow interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE_SIDE_B);
> +			val_32 |= FIFO_UFLOW_INT|FIFO_WM01_INT;
> +			cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +		}
> +		break;
> +	case CIX_MBOX_TYPE_FAST:
> +		/* Only RX channel has intterupt */
> +		if (priv->dir == MBOX_RX) {
> +			if (index < 0 || index > MBOX_FAST_IDX) {
> +				dev_err(priv->dev, "Invalid index %d\n", index);
> +				ret = -EINVAL;
> +				goto failed;
> +			}
> +			/* enable fast channel interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE_SIDE_B);
> +			val_32 |= FAST_CH_INT(index);
> +			cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +		}
> +		break;
> +	default:
> +		dev_err(priv->dev, "Invalid channel type: %d\n", cp->type);
> +		ret = -EINVAL;
> +		goto failed;
> +	}
> +	return 0;
> +
> +failed:
> +	free_irq(priv->irq, chan);
> +	return ret;
> +}
> +
> +static void cix_mbox_shutdown(struct mbox_chan *chan)
> +{
> +	struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +	struct cix_mbox_con_priv *cp = chan->con_priv;
> +	int index = cp->index;
> +	u32 val_32;
> +
> +	switch (cp->type) {
> +	case CIX_MBOX_TYPE_DB:
> +	case CIX_MBOX_TYPE_REG:
> +		if (priv->dir == MBOX_TX) {
> +			/* Disable ACK interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE);
> +			val_32 &= ~ACK_INT;
> +			cix_mbox_write(priv, val_32, INT_ENABLE);
> +		} else if (priv->dir == MBOX_RX) {
> +			/* Disable Doorbell interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE_SIDE_B);
> +			val_32 &= ~DB_INT;
> +			cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +		}
> +		break;
> +	case CIX_MBOX_TYPE_FIFO:
> +		if (priv->dir == MBOX_TX) {
> +			/* Disable empty/fifo overflow irq*/
> +			val_32 = cix_mbox_read(priv, INT_ENABLE);
> +			val_32 &= ~(FIFO_EMPTY_INT | FIFO_OFLOW_INT);
> +			cix_mbox_write(priv, val_32, INT_ENABLE);
> +		} else if (priv->dir == MBOX_RX) {
> +			/* Disable fifo WM01/underflow interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE_SIDE_B);
> +			val_32 &= ~(FIFO_UFLOW_INT | FIFO_WM01_INT);
> +			cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +		}
> +		break;
> +	case CIX_MBOX_TYPE_FAST:
> +		if (priv->dir == MBOX_RX) {
> +			if (index < 0 || index > MBOX_FAST_IDX) {
> +				dev_err(priv->dev, "Invalid index %d\n", index);
> +				break;
> +			}
> +			/* Disable fast channel interrupt */
> +			val_32 = cix_mbox_read(priv, INT_ENABLE_SIDE_B);
> +			val_32 &= ~FAST_CH_INT(index);
> +			cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +		}
> +		break;
> +
> +	default:
> +		dev_err(priv->dev, "Invalid channel type: %d\n", cp->type);
> +		break;
> +	}
> +
> +	free_irq(priv->irq, chan);
> +}
> +
> +static const struct mbox_chan_ops cix_mbox_chan_ops = {
> +	.send_data = cix_mbox_send_data,
> +	.startup = cix_mbox_startup,
> +	.shutdown = cix_mbox_shutdown,
> +};
> +
> +static void cix_mbox_init(struct cix_mbox_priv *priv)
> +{
> +	struct cix_mbox_con_priv *cp;
> +	int i;
> +
> +	for (i = 0; i < CIX_MBOX_CHANS; i++) {
> +		cp = &priv->con_priv[i];
> +		cp->index = i;
> +		cp->chan = &priv->mbox_chans[i];
> +		priv->mbox_chans[i].con_priv = cp;
> +		if (cp->index <= MBOX_FAST_IDX)
> +			cp->type = CIX_MBOX_TYPE_FAST;
> +		if (cp->index == MBOX_DB_IDX) {
> +			cp->type = CIX_MBOX_TYPE_DB;
> +			priv->use_shmem = true;
> +		}
> +		if (cp->index == MBOX_FIFO_IDX)
> +			cp->type = CIX_MBOX_TYPE_FIFO;
> +		if (cp->index == MBOX_REG_IDX)
> +			cp->type = CIX_MBOX_TYPE_REG;
> +	}
> +}
> +
> +static int cix_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cix_mbox_priv *priv;
> +	const char *dir_str;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq < 0)
> +		return priv->irq;
> +
> +	if (device_property_read_string(dev, "cix,mbox-dir", &dir_str)) {
> +		dev_err(priv->dev, "cix,mbox_dir property not found\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!strcmp(dir_str, "tx"))
> +		priv->dir = 0;
> +	else if (!strcmp(dir_str, "rx"))
> +		priv->dir = 1;
> +	else {
> +		dev_err(priv->dev, "cix,mbox_dir=%s is not expected\n", dir_str);
> +		return -EINVAL;
> +	}
> +
> +	cix_mbox_init(priv);
> +
> +	priv->mbox.dev = dev;
> +	priv->mbox.ops = &cix_mbox_chan_ops;
> +	priv->mbox.chans = priv->mbox_chans;
> +	priv->mbox.txdone_irq = true;
> +	priv->mbox.num_chans = CIX_MBOX_CHANS;
> +	priv->mbox.of_xlate = NULL;
> +
> +	platform_set_drvdata(pdev, priv);
> +	ret = devm_mbox_controller_register(dev, &priv->mbox);
> +	if (ret)
> +		dev_err(dev, "Failed to register mailbox %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id cix_mbox_dt_ids[] = {
> +	{ .compatible = "cix,sky1-mbox" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, cix_mbox_dt_ids);
> +
> +static struct platform_driver cix_mbox_driver = {
> +	.probe = cix_mbox_probe,
> +	.driver = {
> +		.name = "cix_mbox",
> +		.of_match_table = cix_mbox_dt_ids,
> +	},
> +};
> +
> +static int __init cix_mailbox_init(void)
> +{
> +	return platform_driver_register(&cix_mbox_driver);
> +}
> +arch_initcall(cix_mailbox_init);
> +
> +MODULE_AUTHOR("Cix Technology Group Co., Ltd.");
> +MODULE_DESCRIPTION("CIX mailbox driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

-- 

Best regards,
Peter
