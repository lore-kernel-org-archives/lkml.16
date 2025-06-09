Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAC624E4AD;
	Mon,  9 Jun 2025 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749457984; cv=fail; b=gk/9Xq2y6+dGwKxEWjz1oJRR/heUmWd9tXjybV3bfU1cqSVXKY0XnjI89/n0Iotii4bkIjqsDMz33BYVn0VU5XsKITJc2b2VrofwNJrCu388MTUEMQA0GF/A3MAE8CQbpxITeikkxN19guZvtECQX8tXH8BiSQseQZImu719eZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749457984; c=relaxed/simple;
	bh=EsGCWxCglL1+Pl6Ee7oiq2XrTogsifkoGMP++UIfZL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QCMCOoEr+xVCoi/cM3tW2RWc8ho+48ZA0D04NfrmFQoUBXWljSO8WbGg03RBLjw1FWPdktQbBzqZuEoF/imGeq+rDB1evTpVdWS3izrdzh5xUCMEHo/NSzH36+qbV/kkeYZgJmvoAEJYoPrI0J1i89PgGNFdgBPi6op6aWPQKPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Uhn9W4an; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Uhn9W4an"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qd/PraoGMwE/sEmynN+l98SuOp4wBEzYa/3RAY8jMXAQGhaM492yZUGKy1oDZpTMrY0mLgS1AtJRAlgg1m7DfN4fQXGAEEWgpVQo+uIGDMmK17H1TgTGD5xPmvWZhurzzsYqytmHMA8XwuJqALHG4d3Up59ztqSnG00U54j7RzI7iLxLfw+OQkMgwpraHIHNSp2v4ssl8yvQBFQLUntKULhJeKwAHbQqsVeQWAKQNnmNtLdo43+t0FO/dNir3eeeIUnTre5u/tgMssQK72G+OzsiZxQ+HYZ7pxIUPPLLW3Ft0nY5Dl8mjT2heH13WbvzSjaVfOgu9weRm76sCswkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L75FRxkBVWPIv02z5w+MNyU6IBKnnKihr6UxNA6kwCM=;
 b=HRZ1vzMl92Fj0iPP/NJ7652PcFFf/Tmx5ulhcIQF6ndb24IKW9hVpe7qYDqXLvx8akwPwjlEb8W9f5HtzX4WaJuY3sj83Icrbpd0p5jGAAX5lkH/kLvM44Ru6F6KD+86R5emdf/gRBppMrxXvZsCf3ifZ1yfTVTAnMfj+i0BH3i4urbIucPfn/BTsP0Lr4kTA6tlbWCQ5OI1Ow10SZ59GZdbXXCidFhpcduBoDEev/7mCQ2lC6WPjBuTerdh7j8SfDyhTfI5t7C92LeMekVjrT37QYetr27pQVgNOlsz2wa00kSyXm+ZUiPoMUv4LCJgqlFDcLsU2vzP9+CGVNiuuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L75FRxkBVWPIv02z5w+MNyU6IBKnnKihr6UxNA6kwCM=;
 b=Uhn9W4antVi3dIH/rpAzb+PrkfKhzYli+aTjhg0zM+B0aE/TTp7ifCIEw30iRK14KG9fo1RB0Qq/bCx3CusavEUmjCBapOThCJtdhrxaFU2u0P3d9xfkn/3b0u4BtxjjVouaVg/ar1ooUPq+wA8jlVStfg8pYXQYg5eyYLEZbwgc/5Y190awAKqBzvKuyh9aDuV6YyDTRIQnttSCVng/5uFZraWsVeWqJ8yCKZa6+GZDlAJmh6IJw2EqahsM8IQWAaBWwXs0Msd9yXBQNAt5dSge+mBSY79GnOodqZevn2Y/GNWSQr2jk2pXg1FmDDjE61tFt1kNx/qdkIbmbJ1FwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7639.eurprd04.prod.outlook.com (2603:10a6:20b:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 08:32:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:32:59 +0000
Date: Mon, 9 Jun 2025 17:43:05 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW
 board
Message-ID: <20250609094305.GD13113@nxa18884-linux>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
 <20250607093342.2248695-10-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-10-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SGBP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::21)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d632a80-6310-425a-20c8-08dda7303dba
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?I9QhhuSNkDAuC8y1qYAvU7q/iN8ZScS42ldYXBBvSJQLUtmK7JJMLWkN3QEG?=
 =?us-ascii?Q?ecZt90d+V0RIKiqQRNETIDPpkuXdno3AAK4o4EJyfOe1jY1yAOxTVSBS28Fl?=
 =?us-ascii?Q?XIVGUYHZhKkrDAQ3utCeUEI0FAU++cd4dEI2ef7tHv+6Zt1ynVTVVfwkbRbc?=
 =?us-ascii?Q?XQcJDghzwXUmOtoH+A1kHOUtWUEvtDJc27+LoJNdjOmkQU5/B0REHcG7p0rW?=
 =?us-ascii?Q?ZbB24htCYbtu4u+HEs+vdXfCbIcQWUrgqKFrXJh43BQj9vh/UVyrAqhH9Eld?=
 =?us-ascii?Q?EEM+nhaVUacH7aNZ2IBIRxDZEtK57P7Wdha2PTowX3tICS3Ee4TmrR93Yhl9?=
 =?us-ascii?Q?vepOycOx9JMi88tD8Zo/eP824WiyxlDMTD9OzTDIz6HKFB56pkWp64GuAoI2?=
 =?us-ascii?Q?IR7LJIvL13C+6+eH8vK9JpRipP3ifZrHOSAY5XtzGjv7fvbj8DiEa59FA4nz?=
 =?us-ascii?Q?xZt6YZ7DwdSpyATmciZ6WnjScM8pyiDnuSo78vSKBXxSoK9jiBidCj8zrBTd?=
 =?us-ascii?Q?QpkNNzLWMq9hEyvXXmIs6JgH3Zm4CkriiONBrZ33InYxxZgxS5jj2tmBFxMf?=
 =?us-ascii?Q?cCi43k36OkAEdiuBylXklnZsSzgUPYgNEkdkVjrebah0IbVoJH09QdIIe7WG?=
 =?us-ascii?Q?nFpdcsE57d7wLIHAOFZIUXlhnk94yme6gaHBX8GaUh8pMQDEHAaypneAYyzr?=
 =?us-ascii?Q?EA64dJIMID8YdJxXuQrl9x7ndsGWKuKEuYtcS4gkPKTq/GNqYrQzBcF2qH7e?=
 =?us-ascii?Q?yBSvfHWjCzSkrghgdq3RtPJdZ5qusB89o4pwn+IfqXAvOR/5hy4dNdK7pBtR?=
 =?us-ascii?Q?sS6sLkshkbv9yo8XdBmX5puWZI53ROeCTc516nUHEN/DF0GwxXmjztjDRdTu?=
 =?us-ascii?Q?lPxdDqH1JFCG1dVRo3NRwD1CIS/1u1HEvHkGn5tbx8nSbunBfG/aEWLf7zK/?=
 =?us-ascii?Q?5UqzAyc4TI2ElFWXTsamiBoxh9pxpyXrGf4MXQn6JDEFSYFkzJ4IJ3EPfFUa?=
 =?us-ascii?Q?sEKJIl+IOaCwMQRrKAKXjNBZIaWe8O5VQFligJOIweoR0Nbt2pNzoituc0CH?=
 =?us-ascii?Q?4VYL0wIo4Wedf3Nd3pulFebQ9sDFHJR/vvnGFEpRW5UpTHb0OhWijpzvUe6S?=
 =?us-ascii?Q?prAoeuV/zub+KaQsShW2KzhgM1LMdv1bRYQobHBCdtC2/w9hA8j7tMlrQVnb?=
 =?us-ascii?Q?VGqt9cBOTzH0WQ6tBb02L7detTKjhxvh1FtNk67/+fy+NaWTy1UspDBViM7j?=
 =?us-ascii?Q?GtvgildpWxNGEpNR+f4ZaP+YYHJ69hDOlZJ3l1g4vKlui/YeU5eopBC1+06Q?=
 =?us-ascii?Q?zfSztha1uRTLH30DlUYcRF22xER7PFYGpd9lovFsakAC9ajceSBq/J51D54I?=
 =?us-ascii?Q?2SrHtvTTqMxeD4rFeI/k1SDnLKaI0UXD6tX7YDYXa4GlY3+NpnMNsyZ9fb3r?=
 =?us-ascii?Q?hFcfLln38JA+4BfrkjYqTpFcgmJn5pZivCTUhHn5zyLbQKyIz3ii4g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?q9TJrg/48/g3kz1xQnseRptdafkvi2bQehz87HLmt8xCH6ZpBBA2JD8F4vn6?=
 =?us-ascii?Q?V3JctzWjMof3nLflrgMHRuDqg19WA6fE2CgZQ27nwHUrJVxPIMzaj2WIUWF3?=
 =?us-ascii?Q?G1+42JNrmiZBFvlo4/CFiCBHMqCRt7rVIQF7v1dSKyaApQ/oyg8OZ0evhvux?=
 =?us-ascii?Q?sroPzWW1uRMxRAYS5DG9aeAX/DpGpeSvI9MRfbLCuGCZnNq8WVkoxGpS0K8R?=
 =?us-ascii?Q?x3NXdvXfFU5AnAzdx4hhmSJKJRESo0gi6TNfjp/G5MNRbkN/sHo3wxMjpD0F?=
 =?us-ascii?Q?f7DdDQovpfvRYcp+IT21H+NSWyKBWD68yE3yvegt0B/zFzatpJ7ZBB/QDDaZ?=
 =?us-ascii?Q?FbtS9PgkiuuUCROvDIMpjy9vsdAHfojgou+kCBOlAjoTzw85bXhDGJhq1H/H?=
 =?us-ascii?Q?kC/taNweT9B5B2ED4uwNEF2FCe6Y3uVxtuGa7X7JnSpXBaOWvX85ohEuq6jG?=
 =?us-ascii?Q?0blY2jNqPzXNq282SHm2x39YvB0M7PwaZQrttSx1Y52QS9hAdidKww4pQIUW?=
 =?us-ascii?Q?232M8rLcpG1IrvNpE3WyyQz8psBlAaNQMWbxbdVAF76/ClFckdKIUa3hwbwS?=
 =?us-ascii?Q?PrcjvbltJ8ghDW2Hm/nKnZ4tTQwOUR2+HZejXUwTOaUoCyOj8D4h0VIwc1Wj?=
 =?us-ascii?Q?47em4xJDWTgsx+91JHukrUKu0qV9NGHe358Ir1iNLpz3rp5AGs1/hQ/GPeJH?=
 =?us-ascii?Q?1CEZ7ZIrwa4muYWm22KtG0x3ZA1vr1/NQ7ZLvNXklckCLqWUTOTJBzl1S5gd?=
 =?us-ascii?Q?iP7AXrkt1Mrz5cThSHxYCbWAkvjNnQbYDI34w8VfO4Vr07IPz3eqSEPgjW5m?=
 =?us-ascii?Q?Ztu8JQCTkRLJa5H3XVkqOZnn2gP/XuWaEG/1sM1uBCF7jJ8EotbVsEliMnDf?=
 =?us-ascii?Q?6NfB6XqzGRWdzpv2Rh0tMntOOnNIPobVfRKiG6Xhtce+QJ1dDKvfr2HuAxNI?=
 =?us-ascii?Q?5431m101erN7q1RcUq7h3xxfbVkk1j2s25t8mPPGgnoZQfINzQ2A4Nr52YyU?=
 =?us-ascii?Q?AHoOu/JZ2dIPLVaLq3sbsXfF6NokZmyHZ3l+xiWj7ZfQhEZjl5YS1jHIgRLh?=
 =?us-ascii?Q?+zEf0fXbjpJtFWryx9kQN/txS/sneOZ9QeJI/KfYuCLWwrJzE5Y/ZjtIZ891?=
 =?us-ascii?Q?znDuqjqIfiAS21TCrwW0Ubt642zEcsP+/CVnvZ1yfdVxDWbFUzwUs1AUFCtY?=
 =?us-ascii?Q?SLJnzBytNNpHOMbP3bfE7iXz/LDaqErpq79KherOY35/ZP7mgDmR0aAHko2m?=
 =?us-ascii?Q?4u4QKvPNvPBrwCPZ3ZinMB5H8LzK4k7V9QVhBE16LIVBvnARpdElUxNBfHQN?=
 =?us-ascii?Q?Agg58BDL+nrwDhOCvu/3dxQy180U4N507Sq9QnPvXDbTOzGnoBgmPuBHGLzl?=
 =?us-ascii?Q?G6zgXOwKi8ngmUTh6qE7qn8DZJnwQAnCq73g60qi+hh8u/v83oAk0NicNkT0?=
 =?us-ascii?Q?U3OkFW4MBdHI1E3G4+rF4fD4vXhV8svgAreMaamp6y2Fht6lZOaFF90VSzXI?=
 =?us-ascii?Q?pkG/Yq5ePg4TbmWUkmJtDkeK9cIGPKmOztjHHuS9yj0FWVaQ98Bq3MstSOfS?=
 =?us-ascii?Q?XyiWT5ErQ7GT0ITB4L4N1GTjAZNjAZ7pfYFjVxNv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d632a80-6310-425a-20c8-08dda7303dba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:32:59.4285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SJlxtLt60e/SRRpaZBv2Sx4mWKU7E8l3FV0FsE39rr2Um3mRmZ6iKeAnUWYxwl+TiJr2db6WmSGD4lUdOBjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7639

On Sat, Jun 07, 2025 at 11:33:21AM +0200, Dario Binacchi wrote:
>Support Engicam MicroGEA GTW board with:
>
>- 256 Mbytes NAND Flash
>- 512 Mbytes DRAM DDR2
>- Buttons
>- LEDs
>- Micro SD card connector
>- USB 2.0 high-speed/full-speed
>- Ethernet MAC
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>---
>
> arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
> .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 164 ++++++++++++++++++
> 2 files changed, 165 insertions(+)
> create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
>
>diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
>index 32dfd69b8d8b..de4142e8f3ce 100644
>--- a/arch/arm/boot/dts/nxp/imx/Makefile
>+++ b/arch/arm/boot/dts/nxp/imx/Makefile
>@@ -357,6 +357,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> 	imx6ull-dhcom-picoitx.dtb \
> 	imx6ull-dhcor-maveo-box.dtb \
> 	imx6ull-engicam-microgea-bmm.dtb \
>+	imx6ull-engicam-microgea-gtw.dtb \
> 	imx6ull-engicam-microgea-rmm.dtb \
> 	imx6ull-jozacp.dtb \
> 	imx6ull-kontron-bl.dtb \
>diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
>new file mode 100644
>index 000000000000..1c82ac08bfb4
>--- /dev/null
>+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
>@@ -0,0 +1,164 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
>+ * Copyright (C) 2025 Engicam srl
>+ */
>+
>+/dts-v1/;
>+
>+#include "imx6ull-engicam-microgea.dtsi"
>+
>+/ {
>+	compatible = "engicam,microgea-imx6ull-gtw",
>+		     "engicam,microgea-imx6ull", "fsl,imx6ull";
>+	model = "Engicam MicroGEA i.MX6ULL GTW Board";
>+
>+

Drop extra blank line.

>+	reg_1v8: regulator-1v8 {
>+		compatible = "regulator-fixed";
>+		regulator-name = "1v8";
>+		regulator-min-microvolt = <1800000>;
>+		regulator-max-microvolt = <1800000>;
>+	};
>+
>+	reg_3v3: regulator-3v3 {
>+		compatible = "regulator-fixed";
>+		regulator-name = "3v3";
>+		regulator-min-microvolt = <3300000>;
>+		regulator-max-microvolt = <3300000>;
>+	};
>+
>+	gpio-keys {
>+		compatible = "gpio-keys";
>+		pinctrl-names = "default";
>+		pinctrl-0 = <&pinctrl_gpio_keys>;
>+
>+		user-button {
>+			label = "User button";
>+			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
>+			linux,code = <BTN_MISC>;
>+			wakeup-source;
>+		};
>+	};
>+
>+	leds {
>+		compatible = "gpio-leds";
>+		pinctrl-names = "default";
>+		pinctrl-0 = <&pinctrl_leds>, <&pinctrl_pwrled>;
>+
>+		led-0 {
>+			gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
>+			default-state = "on";
>+		};
>+
>+		led-1 {
>+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
>+		};
>+
>+		led-2 {
>+			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
>+		};
>+
>+		led-3 {
>+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
>+		};
>+	};
>+
>+	usb_hub: usb-hub {
>+		compatible = "smsc,usb3503a";
>+		pinctrl-names = "default";
>+		pinctrl-0 = <&pinctrl_usb_hub>;
>+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
>+	};
>+};
>+
>+&iomuxc {
>+
>+	pinctrl_gpio_keys: gpio_keysgrp {
>+		fsl,pins = <
>+			MX6UL_PAD_JTAG_TDI__GPIO1_IO13		0x0b0b0
>+		>;
>+	};
>+
>+	pinctrl_leds: ledsgrp {
>+		fsl,pins = <
>+			MX6UL_PAD_JTAG_TCK__GPIO1_IO14		0x130b0
>+			MX6UL_PAD_JTAG_TRST_B__GPIO1_IO15	0x130b0
>+			MX6UL_PAD_JTAG_TDO__GPIO1_IO12		0x130b0
>+		>;
>+	};
>+
>+	pinctrl_uart1: uart1grp {
>+		fsl,pins = <
>+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
>+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
>+		>;
>+	};
>+
>+	pinctrl_uart2: uart2grp {
>+		fsl,pins = <
>+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
>+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
>+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
>+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
>+		>;
>+	};
>+
>+	pinctrl_usdhc1: usdhc1grp {
>+		fsl,pins = <
>+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
>+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
>+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
>+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
>+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
>+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
>+		>;
>+	};
>+};

we usually put iomuxc at the end of the file.

Regards,
Peng
>+
