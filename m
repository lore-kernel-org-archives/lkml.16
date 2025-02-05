Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4013AA3E;
	Wed,  5 Feb 2025 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762669; cv=fail; b=dSb4YV+EGLK1cNDyoHdlc5vQpWnKVhQib1PaJJwU39U6+2CfRttmu8jwiunbpk+KexXzv0eB0Bt+wYjwfd5/UZdwjPfz3JUz2NByi7YN01HBZndbDBNFkyjVRux5tO4B307gP4UOyEzOpnYIqhaeZeO7uS/GfunrzYqCFVUk2kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762669; c=relaxed/simple;
	bh=O3aUoQPgEuXu3PSZNxYGY17lE/OxsYlsmsqYOgyr+y8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OWIz8r2eGgs3+f8lwJvRZtbJMXGoZDkJOxIo0yTT+tZrmAWtXgBnLyrh+2h2HTImCPsmTbuiVDFfXxPjj1vWuqIPf6rK3lOX4kPn7k4KpNf5eaR1JFczPcF/OW+2ORq3LWzsU/fySW/7mtmUCld4Rm2IB3IWfh3c+88Qo9spuig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BSXdptZ8; arc=fail smtp.client-ip=40.107.237.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BSXdptZ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8LikkA5QUOfs4vZWOmvIW0aL0+XplEWO7Mcn7rbb2jlaT5RFd9yOl37gXp+LwMNhFwKw1v8V0jwgP99pibg6/GOu3lcXUwZyjSwt2DuXm+8rek3dBoJNxafcmTfBCyDQqFUyQCO2ApCLt0XaebtpOdNqcQ/Umwd78qvmE5QKUzGNL4lBeJTSj2R68D5tAWBB3ZXn/7jezvTTSEdXNWxPiaBS9Buj67ZcQZ2ns9dxRaTB359tmpXF8YviPJzuWyBpXxpwMcwpmabBS/jw/jZB8yFip2VeT4n+v+lRKeGOpr4DDB+IhQWya7VYOGAFQ9Ru3OJhrHnNIM3Ih4oDvMRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaeZYK5UXKfAV7RovG7bHqoGQAhh3lUMPZUZQqJox9c=;
 b=ecn82QGSgE2cYDoDYhdzH8TabAQ/wKOAKpsByCqvRbSIpt/0zUGOajD+Y6fZ66dCxIcHe0CGHkAvFmh9BeuiObIsXXg4pPvWlZ6o8PCkheh/k/S9JasDVq2Ubam7O8jMD9t2wDhr8pZyw/jlQI/8ksxSHW0AfPCFioc6PxkxhdbYnzjWJ/lOT+nxzx60c/VC2JehG27XpbV+DzHLWn9nfkRInvT9NVQndLwzR3X+k1jwJM+q8cbDhuoh3FR803oFV1julUTwIXMWTo7KsNN0vWTSh+76MM5AhGASr3afLcjLibPDbqvF0s73mmzhcNd0QIeM+xQIVoiS+yy7UzWwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaeZYK5UXKfAV7RovG7bHqoGQAhh3lUMPZUZQqJox9c=;
 b=BSXdptZ8ViMF+rLwO3OBEp080++EjR4hyT9Vyolr0+FS2r8sWWs7jyCepON+SR5vPozu/NvwTsmg+YPXEffvKBWvRZ2TNLcIaY5ODkB4CpP7BN6ZwZOA6mZqeqMTOT3iJJO7OPgsnZPtfZyNmIu1NRQE2inFwC729pzAhYaaReo=
Received: from SJ0PR05CA0166.namprd05.prod.outlook.com (2603:10b6:a03:339::21)
 by CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 13:37:39 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:339:cafe::8b) by SJ0PR05CA0166.outlook.office365.com
 (2603:10b6:a03:339::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.12 via Frontend Transport; Wed,
 5 Feb 2025 13:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Wed, 5 Feb 2025 13:37:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:36 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 07:37:33 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v12 0/3] mtd: Add support for stacked memories 
Date: Wed, 5 Feb 2025 19:07:27 +0530
Message-ID: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|CH3PR12MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd65f60-b41a-4793-49a9-08dd45ea41c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iXOBRBk2S4VkOq13qsgKkz+l6VkCxRtVZMHmLPt4Mq3DlTBQR0pf2KWOh2Jj?=
 =?us-ascii?Q?t8+aUgTgWVPJGVBiVjOIkh0w8K88E+p/xhl0t+4SxAt8+w+dP3SFlc2n8D8k?=
 =?us-ascii?Q?/qMriIxrdRMglDJeRYjKMQBtllPuo+kQeS6cN2Msi62R00aSwWSUVx4yVtxh?=
 =?us-ascii?Q?ITjuhIvABsRX4RPGJck5zA3MjXtRUy7a1aNepPGlJKDTQjOMGUDJ/lhWckJD?=
 =?us-ascii?Q?HwkYvekIpdGAKksN/gqngyt5c56kgiuqVURgbIJ7vaUsQ8USAnLxC/aKHU3Z?=
 =?us-ascii?Q?M/rJ+6f7MY6kHg76zBSZ4DnxtEuFtGstGeehIfdYq+3Xz+82erZpydLlptpb?=
 =?us-ascii?Q?jJXG+4tSTma6WCy5yQ7jc5LlTjhuj4RN2aJwAuEfmdictCkEqvl06HHgouvz?=
 =?us-ascii?Q?LC0mOGVIRnbRVCQP40G73pkX8VfqNiaqhQEl5ssiYxeuqCnrqCYnFxlVDUsy?=
 =?us-ascii?Q?K8W31FdIjmWbbryM4U3LaGEIA8C0kAWIU40Mj+oDWu5V3QZNvVS2DKJb0qs6?=
 =?us-ascii?Q?TXNRnnAUGkMKZsZlaJbIO9w3iNj/1BCslc64Ct8ucp22KKNXQsKw8vdLqheO?=
 =?us-ascii?Q?QaANTco97jT1wHDk32awPIAS9RJBYdZlboH8dIc3ZMlOs2D+6K2wR/75H/8Q?=
 =?us-ascii?Q?09DgOYSsf+9jvCPjf7s2MhJfqxlLkXw4K5/aHA/aOjeTeChFgBw+dnwsXdSU?=
 =?us-ascii?Q?oN2hiGH7vV4K1+47Um474XOZH3En497NEY3gGOscnM3Bv20H+Rjz5opXh+4f?=
 =?us-ascii?Q?qsvOzFH7dyj/mEsBN8Kx9h7eXKbGq+Jj4NH7I595uhzXpHbF8lwMtEK1ri7b?=
 =?us-ascii?Q?HFtPYZsumYu7Kd4KlP4BMT0XM1Icujh7YYTIK8cCaBPuZys9bRBypgkjdfK/?=
 =?us-ascii?Q?qFm0X/acihoREEAnaFrnoETro8+iUyK37R4dkRnSjgcl8L9AcXNj1bV4K0JI?=
 =?us-ascii?Q?l8vxk0I1UCTYsGvedJUF2QAb+AtnWXzLoOoeHwogO2ptgYLcsQKOFiSXR6fz?=
 =?us-ascii?Q?8TFQVWt8xfOeNd6utPzzzpI0Z+5uAv1IJlHppfncarLO0snF0lPpbRXkz/6Q?=
 =?us-ascii?Q?hr4MJG3+TsBoGvjtT7E3w0Z1P+OB1BmqQGE0vRs0C5zx5YXum6DpMXxv2T58?=
 =?us-ascii?Q?R5FtlkUjVKwuuCAiLl3v+MJhX9FlndH37Le2DA0G7nTZBQmGMwVV8pPlrjYt?=
 =?us-ascii?Q?d+9L5e55qNkPGOkobCzeAgaszo6dbdRzfd4754ZlW/deRxQPd6qKVKwLwnyf?=
 =?us-ascii?Q?9T+0BNqzRfzy/njPXpi1mPU5/wXOSuFTeDDqDsgQNXzjVhO+hjcNoaEROlNS?=
 =?us-ascii?Q?YBCCt4HSTv8jJ+2rjkD0tROlm6EcLD0A1XRYvmKGr5pwdc/5UTCzRVw8YJMS?=
 =?us-ascii?Q?cjk/XTyyCn7GWomeNezGdQPXFDlBnFIBm1jvzPKxQPcdZn4R49CD/R0DNJCo?=
 =?us-ascii?Q?m0FdVw0lcRVb90jtuppcAQIb3qaQHyNv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:37:38.3028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd65f60-b41a-4793-49a9-08dd45ea41c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7738

This patch series is the next version of [1]. After a series of discussions 
on [1], we have decided to:
1/ Send separate patch series for stacked and parallel support, starting 
with the stacked series first.
2/ Add stacked support by enhancing the existing mtd-concat driver.

To add stacked support via mtd-concat, MTD device concatenation needs to be 
made more generic, and I found [2] to be a suitable approach for this.

As background, a few years ago, Bernhard Frauendienst initiated an effort 
[3] to achieve the same, which was later adapted by Miquel [2] to introduce 
stacked mode support. In this approach, partitions to be concatenated were 
specified using a DT property "part-concat" within the partitions 
definition, allowing two MTD devices to function as a single larger one in 
order to be able to define partitions across chip boundaries. However, the 
bindings were not accepted. As a result, the mtd-concat approach was 
dropped, and alternative DT bindings were introduced [4][5][6], describing 
the two flash devices as one. Corresponding SPI core changes to support 
these bindings were later added [7].

While integrating stacked mode support into SPI-NOR, Tudor provided 
additional feedback, leading to discussions about updating the existing 
DT bindings. To address this, I sent an RFC [8] to initiate discussions on 
adapting the DT bindings as suggested by Miquel in [2]. Following that, 
I am now submitting this patch series that updates the virtual concat 
driver referenced in [2] along with some minor mtdcore changes. 
Since I have taken ownership of this effort, I have included Bernhard and 
Miquel under the "Suggested-by" tag.

[1] https://lore.kernel.org/all/20231125092137.2948-1-amit.kumar-mahapatra@amd.com/
[2] https://lore.kernel.org/linux-mtd/20191127105522.31445-1-miquel.raynal@bootlin.com/
[3] https://lwn.net/ml/linux-kernel/20180907173515.19990-1-kernel@nospam.obeliks.de/
[4] https://github.com/torvalds/linux/commit/f89504300e94524d5d5846ff8b728592ac72cec4
[5] https://github.com/torvalds/linux/commit/eba5368503b4291db7819512600fa014ea17c5a8
[6] https://github.com/torvalds/linux/commit/e2edd1b64f1c79e8abda365149ed62a2a9a494b4
[7]https://github.com/torvalds/linux/commit/4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
[8] https://lore.kernel.org/all/20241026075347.580858-1-amit.kumar-mahapatra@amd.com/
---
BRANCH: for-next

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

 .../bindings/mtd/partitions/partition.yaml    |  17 ++
 drivers/mtd/Kconfig                           |   8 +
 drivers/mtd/Makefile                          |   1 +
 drivers/mtd/mtd_virt_concat.c                 | 254 ++++++++++++++++++
 drivers/mtd/mtdconcat.c                       |  12 -
 drivers/mtd/mtdcore.c                         |   7 +
 drivers/mtd/mtdpart.c                         |   6 +
 include/linux/mtd/concat.h                    |  36 +++
 8 files changed, 329 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/mtd_virt_concat.c

-- 
2.34.1

