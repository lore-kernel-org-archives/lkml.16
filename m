Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30B15689A;
	Mon, 23 Jun 2025 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676100; cv=fail; b=fJi90PQiJnRAuO9UnwX0DAn6t6J2AFCbA1FuR0oUpZdK6RKT7/gCPvM6kVFbOdOlnn4hQD4c9lGSxDY74KqE1lla2ydfCfutjha+nOaWqz7uJ3gfsd2Tdh8dK0O/SjRhiMGMlMpyfKEhAWBOZDfrgZaVsqZUjWvkQuArjYaQWrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676100; c=relaxed/simple;
	bh=lo33dsIidDXyb1+/kBgPFU+w8mHmjnthPfiDruxVgVA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KjeOIOcAmbFsrzQ2adESiXr5bSAQyAoCTRzosdF1mrZk9gQf5rtNOQbDpuTbra+MWKdlV6XchGUd5ObbZ8Q23IiQYx6bGn4YsGNWxVsmyKaE3I97nckANnICl8vAv9J4ZBUcKKk9yXZyIs/63QJmmnKOvV4UAhpmKhkf3p/siFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rVbgSgJV; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rVbgSgJV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Be1m60dP1rqizX7izlqPg1GmiGn3bbH/2slMnu1z7MufXYq7L6N2sGnH+/WmiNeW+BbOX18K13tGhSICEbdmum2estKxaD6wn1Vf1Y+ChAxmaJtXq875jH+8B9jHxBk1k5PwxmEASp12D6/Xz5+DGhqPl+weI24UB6VqZ3+t4OMohO5QhBsXU9XzqseyYlZIUGpdDlnLxlijneQhzUE2ISJ0Joc4VQL7t2WJWW+m4VuKkdI7E0C8njw6BciXpzYC7zw8RMYiw9X3JYaAHY1oGZYgKJ7I9lc8BmHLT0jS9tBzS3qCNAccXjHmUucG2OY0K2gXmE/4/tci1M7gAbvPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjUD/Wu8snS6OlgFDnfg91MTTMfj7R7Y84ryk8H/ycc=;
 b=XDSmFgwIbf3lM4r9ApkM04LzmzDkXfQcBrbFGY+I72yrk3Pwb8gu3mP9PKVpbQPhoBBp9k75k3lp9iVskMa33jYKPZeeuf3Fgnn0xFRRtVU8DZu4m6EwlRsuaf9Xi3DC2Kpb3FdGqY0wjZ4WmWx1nsIfHRgudIOIWU4HkAC4DGYcT73UN8+K2e9uuNDHnBRwHSyBufqxqnBjxQm1U9knK3P1qvhQnxT5c0GliYYkGrxwrS6Pfw36hcCQdSeCQvT3HiFOTOuA1Xidz57TMv1XNcAVXE5ySpEHc1Q/4Yv39rQ46TvyXJB35pXnMdiOsz/zJH9lnzkIwI+3FCyQmxdIXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjUD/Wu8snS6OlgFDnfg91MTTMfj7R7Y84ryk8H/ycc=;
 b=rVbgSgJVkNYfi9J9av4pQdA7Q0LfYp00zVYkIslX2OgvHVgkNvW6U8jX54v/MeOXeLqxZ9qhmwnSvs4qkhgu4L/hOw5L/4iFPJc2l+Wtqckd/qZEhV415YeoQFnxzxB8A7SxPRFUC2PrW/zEFKVDvIxWgTeoQIYuJ3zQkOWQzZE=
Received: from PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::17)
 by CYYPR12MB8938.namprd12.prod.outlook.com (2603:10b6:930:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Mon, 23 Jun
 2025 10:54:53 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::ee) by PH8P221CA0061.outlook.office365.com
 (2603:10b6:510:349::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 10:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 10:54:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:54:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 05:54:50 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 05:54:47 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v14 0/3] mtd: Add support for stacked memories 
Date: Mon, 23 Jun 2025 16:24:42 +0530
Message-ID: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|CYYPR12MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de31d78-7a20-4738-85b5-08ddb24461e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gclVB9a3yeJ7iUpGe2z4FDJzvIjxcLon8VxB9t04WcamzeYWVThb/5UWBya+?=
 =?us-ascii?Q?cgNKiCU7WnOgoRoQecUeJdWF42L22LO0GM5gVJVFEAiCiA1Z1WGI+C4TCXQj?=
 =?us-ascii?Q?x8PVeW20jqHFoGzSJxuHcaLrp+tfHdHnlQOL7G63fXW9eMxF6t1Zs/Pkv3jv?=
 =?us-ascii?Q?TUp9Hb55r1iBtFxKKtU8Uwg1eiuGibp/4LtoU+ej7DnUQ0qyHEr8olKfWpHd?=
 =?us-ascii?Q?xVW2W4JiInX1k5HzcyRX+J5QVPV2XelPxJyN3JP3pVXXjNQruagXaUS5bIWr?=
 =?us-ascii?Q?5SXsQVJhFs89t+PnhlPva/0FmuyRI9W+QCGS8Q+YbcDO20OrKkFWbgdNJPQ3?=
 =?us-ascii?Q?cJecOPwOdCpRGLUvb1O/XvjYtc75Qemq7mGDhCGuGaXvMRW80UWSCScdmA97?=
 =?us-ascii?Q?qunHjFdP1C7efu3aQsbqmE2ki43OhufgjJNDMJYj/F1UZoZbqqoqPTOjzQNJ?=
 =?us-ascii?Q?aQmSQZ13J88XEUMgytAFf5Qe6IxhLAHSIli3tlDH/Wqr7apOchWCWPfcybU4?=
 =?us-ascii?Q?R8yz/Ye1cwJ0uBp73BdU1sK/5O9oiPzZNUVi5gG78ATsw2n3wOyynhR6VjM8?=
 =?us-ascii?Q?4j4/yxlOW2geSc7507gsKR03pHNuEE/6K43YDWzSh6F2GrwwSMbyRYc8zEEK?=
 =?us-ascii?Q?nOGWy44PM7LQgH3/186+KgsMvbSWCDcfu1+1EM+Hr6JKAeFsOVsMwTmjel5n?=
 =?us-ascii?Q?LR2YmQDWGq+dZTUSUdF+ZYYJByyuhTBPW/mM+iUYhcMY75gWs/Ehx9nDoUMz?=
 =?us-ascii?Q?J1cbJpl0/9TtTrUMiqneIQTHX/c5+7QLuEOiveBsQdJCwDPAlsAyhKxnvazH?=
 =?us-ascii?Q?SIWinzgvYvLtyXO6FXKMr3G52cA2K8vjlI3Twmxj9ZB6rIgxX9EXtqNvdE8k?=
 =?us-ascii?Q?cWchliu/WWnc3wAeBVDZbLz1JVMpChXMF18zGNPM/D4HJ8SMzspy7wjwbAiA?=
 =?us-ascii?Q?kCMDwBI3QQ7EyGH9hz173lM5RsPjMNBndHQPUv5riCTK/BgFCouTzIKfJ/oN?=
 =?us-ascii?Q?IwOsEJ3RLJYpVO/1v+/nOvm0Wu+ScwNKFmYBXhlfjr18W35quhk9pnISEMVk?=
 =?us-ascii?Q?o/C0Z5sdKNt8pPt/onY7idXC8j9JiqlB4ar80Xfbcrwwolo0IMmKm4SKJ2JJ?=
 =?us-ascii?Q?Sl6XSeTM/OcULNu3Ml8MUOmNthXM5OnJltKSUaw7/ezAmePF/npqvDSVkZNv?=
 =?us-ascii?Q?Q3bZeTRNd78s1MRvhUAj2ZISIEvH1scH+p3jAMIjScaygmOIpkj14t1IqZjF?=
 =?us-ascii?Q?vjwPPzKro0X1PSVyo5bqsC02nIiMQInPirLA2CxCq+ANRYQ5/2LRUWwN5cJT?=
 =?us-ascii?Q?kbGn6LWgd71Yoyfh9huFRRFnDNx+9otDflmRMHxYXks0kMkjlNMowEQQhKiG?=
 =?us-ascii?Q?fK+BlKzNeTMIcIK2rK3YlZN1Uayd6ubhn3kIjJgLC22InYzR9KJ00IA9hNlz?=
 =?us-ascii?Q?j8tSXzbwla8db/J8823IkEfxKHH5f4Dze3YnIwio4NXlmcGvMe8j7JxuwBmj?=
 =?us-ascii?Q?d+2yMXhrJ7F1enD+bxBcQHSJfLJKvGWCIVehCt0kLfjTrM30/fyyanNj1A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:54:52.5224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de31d78-7a20-4738-85b5-08ddb24461e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8938

This patch series adds stacked support by enhancing the existing mtd-concat 
driver to be more generic.

As background, a few years ago, Bernhard Frauendienst initiated an effort 
[2] to achieve the same, which was later adapted by Miquel [1] to introduce 
stacked mode support. In this approach, partitions to be concatenated were 
specified using a DT property "part-concat" within the partitions 
definition, allowing two MTD devices to function as a single larger one in 
order to be able to define partitions across chip boundaries. However, the 
bindings were not accepted. As a result, the mtd-concat approach was 
dropped, and alternative DT bindings were introduced [3][4][5], describing 
the two flash devices as one. Corresponding SPI core changes to support 
these bindings were later added [6].

While integrating stacked mode support into SPI-NOR, Tudor provided 
additional feedback, leading to discussions about updating the existing 
DT bindings. To address this, I sent an RFC [7] to initiate discussions on 
adapting the DT bindings as suggested by Miquel in [1]. Following that, 
I am now submitting this patch series that updates the virtual concat DT
bindings and the driver referenced in [1], along with some minor mtdcore 
changes. 
Since I have taken ownership of this effort, I have included Bernhard and 
Miquel under the "Suggested-by" tag.

[1] https://lore.kernel.org/linux-mtd/20191127105522.31445-1-miquel.raynal@bootlin.com/
[2] https://lwn.net/ml/linux-kernel/20180907173515.19990-1-kernel@nospam.obeliks.de/
[3] https://github.com/torvalds/linux/commit/f89504300e94524d5d5846ff8b728592ac72cec4
[4] https://github.com/torvalds/linux/commit/eba5368503b4291db7819512600fa014ea17c5a8
[5] https://github.com/torvalds/linux/commit/e2edd1b64f1c79e8abda365149ed62a2a9a494b4
[6]https://github.com/torvalds/linux/commit/4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
[7] https://lore.kernel.org/all/20241026075347.580858-1-amit.kumar-mahapatra@amd.com/
---
BRANCH: spi-nor/next

Changes in v14:
 - Updated 1/3 to address review comments.
 - Updated 3/3 to add mtd_virt_concat_destroy() API that would remove a concat
   incase one of the mtd device, which is part of the concat, is removed.
 
Changes in v13:
 - Updated 1/3 to modify the Device Tree binding to support multiple concatenated devices.
 - Added Rob's "Suggested-by" tag in 1/3.
 - Updated 3/3 to define CONFIG_MTD_VIRT_CONCAT as a boolean and depended on CONFIG_MTD_PARTITIONED_MASTER.
 - Updated 3/3 to remove late_initcall and invoke the API directly from mtdcore instead.
 - Updated 3/3 to add support for concatenating more than two MTD partitions.
 - Updated 3/3 to add support for multiple sets of concatenated devices.

Changes in v12:
 - Add stacked mode support throught mtd-concat driver.

Changes in v11:
- Rebased patch series on top of latest for-next branch.
- Added a new patch(1/10) to replace spi->chip_select with
  spi_get_chipselect() call in tps6594-spi.c.
- Added a new patch(2/10) to replace spi->chip_select with
  spi_get_chipseletc() call in cs35l56_hda_spi.c.
- In spi.c initialized unused CS[] to 0xff and spi->cs_index_mask
  to 0x01 in all flows.
- Updated spi_dev_check() to compare the CS of old spi device with
  the new spi device CS.
- Updated cover letter description to add information regarding GPIO CS
  testing and added Stefen's Tested-by tag in 3/10 patch.

Changes in v10:
 - Rebased patch series on top of latest for-next branch and fixed
   merge conflicts.

Changes in v9:
- Updated 1/8 patch description to add an high-level overview of
  parallel(multi-cs) & stacked design.
- Initialized all unused CS to 0xFF.
- Moved CS check from spi_add_device() to __spi_add_device().
- Updated __spi_add_device() to check to make sure that multiple logical CS
  don't map to the same physical CS and same physical CS doesn't map to
  different logical CS.
- Updated 1/8, 5/8 & 7/8 to support arbitrary number of flash devices
  connected in parallel or stacked mode.
- Updated documentation for chip_select.
- Added a new spi-nor structure member nor->num_flash to keep track of the
  number of flashes connected.
- Added a new patch in the series 4/8 to move write_enable call just before
  spi_mem ops call in SPI-NOR.
- Added comments in SPI core & SPI-NOR.
- Rebased the patch series on top of the latest for-next branch.

Changes in v8:
- Updated __spi_add_device() and spi_set_cs() to fix spi driver failure
  with GPIO CS.
- Rebased the patch series on top of latest for-next branch and fixed
  merge conflicts.
- Updated cover letter description to add information regarding GPIO CS
  testing and request Stefan to provide his Tested-by tag for 1/7 patch.
- Updated 1/7 patch description.

Changes in v7:
- Updated spi_dev_check() to avoid failures for spi driver GPIO CS and
  moved the error message from __spi_add_device() to spi_dev_check().
- Resolved code indentation issue in spi_set_cs().
- In spi_set_cs() call spi_delay_exec( ) once if the controller supports
  multi cs with both the CS backed by GPIO.
- Updated __spi_validate()to add checks for both the GPIO CS.
- Replaced cs_index_mask bit mask with SPI_CS_CNT_MAX.
- Updated struct spi_controller to represent multi CS capability of the
  spi controller through a flag bit SPI_CONTROLLER_MULTI_CS instead of
  a boolen structure member "multi_cs_cap".
- Updated 1/7 patch description .

Changes in v6:
- Rebased on top of latest v6.3-rc1 and fixed merge conflicts in
  spi-mpc512x-psc.c, sfdp.c, spansion.c files and removed spi-omap-100k.c.
- Updated spi_dev_check( ) to reject new devices if any one of the
  chipselect is used by another device.

Changes in v5:
- Rebased the patches on top of v6.3-rc1 and fixed the merge conflicts.
- Fixed compilation warnings in spi-sh-msiof.c with shmobile_defconfig

Changes in v4:
- Fixed build error in spi-pl022.c file - reported by Mark.
- Fixed build error in spi-sn-f-ospi.c file.
- Added Reviewed-by: Serge Semin <fancer.lancer@gmail.com> tag.
- Added two more patches to replace spi->chip_select with API calls in
  mpc832x_rdb.c & cs35l41_hda_spi.c files.

Changes in v3:
- Rebased the patches on top of
  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
- Added a patch to convert spi_nor_otp_region_len(nor) &
  spi_nor_otp_n_regions(nor) macros into inline functions
- Added Reviewed-by & Acked-by tags

Changes in v2:
- Rebased the patches on top of v6.2-rc1
- Created separate patch to add get & set APIs for spi->chip_select &
  spi->cs_gpiod, and replaced all spi->chip_select and spi->cs_gpiod
  references with the API calls.
- Created separate patch to add get & set APIs for nor->params.
---
Amit Kumar Mahapatra (3):
  dt-bindings: mtd: Describe MTD partitions concatenation
  mtd: Move struct mtd_concat definition to header file
  mtd: Add driver for concatenating devices

 .../bindings/mtd/partitions/partition.yaml    |  20 +
 drivers/mtd/Kconfig                           |  10 +
 drivers/mtd/Makefile                          |   1 +
 drivers/mtd/mtd_virt_concat.c                 | 380 ++++++++++++++++++
 drivers/mtd/mtdconcat.c                       |  12 -
 drivers/mtd/mtdcore.c                         |  17 +
 drivers/mtd/mtdpart.c                         |   6 +
 include/linux/mtd/concat.h                    |  59 +++
 8 files changed, 493 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/mtd_virt_concat.c

-- 
2.34.1

