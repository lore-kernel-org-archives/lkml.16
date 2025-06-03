Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6A187346;
	Tue,  3 Jun 2025 19:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748979741; cv=fail; b=jt4dDKJcO8XTdmZEQxXeXhAL0cpCDPiWDr+0rGFWguqRAT4EqFnDzZPx7e3P8gwSiwFaK7ROPv57Fj6bXnTG8rlFrcNdcPWSUM1wwPX3u3BucIoNjFsqkrUV3ArLLqjdSlN/wKp2rrZJJRL/R71dIebPmgtk44SHA3KX3QznhI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748979741; c=relaxed/simple;
	bh=Iu1V0DzOCOuW7MYtAH+ELOmLm5hP2Pd1wK4XYa8/3Vg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TmOwvmPc+tF3ZDBrSaVdZjX7akEkruJlZOx6/7bwRn70jjkXB8BYMABelMdFCZlpYZomsnpN72zEFre56QGxd5gFaRnCEa8Thf0KU42zOzvYMkvbxcJM016HGBzHb0aVcAkZJzMC7mowspfmWNqulD9nMpoGgVCJmlWEh15lG4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZDnkXiYr; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZDnkXiYr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMCHYxfS6jZqthJ8U6m7vjFa7pKI78Aag2p/arHMUGLDAUO7ME4vIPSTNxP2Mr5XOxc5/2lrHyQqNNc/MvSSV+MYcrrr7kK+PnMByRMYGMnDjynUTJmUSRndd+evLl58cG3VovvVYfJ7oq2SAJ2DBpkXEr+uVdgapS4n4gWqitnRIwz/i9KwRP50iBUJeM6SMRJhlajoZyQLGTwMP51qPiYUWTEF9Z5+zzxiKI92DwRx0fAzY8zmdMXQZOypayF7ifPzBHdPcCS/N3/HLCYgYVuZm92Z9tQ6PcBqJNnMZAAEDyHDombAOkxWKex1RHZbHsP4CqeI+VNumu8seTfK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwPg3S8KYrAxAd3PcwYJmXVgBo1RwNmK63YWZ39eYbQ=;
 b=Ko1uGTh8o4jR9CcB2MIx4G8uNliIlOAsE4VTjgDe5gUaXMUdr7AtsbwoXG77kPbdkRn6qK35ipdENAQO68SxqbqNXUb/UBzUI19dBqEt5Zd7bU3kCDOGFNC4K3sporMwlQmPlORA7H3tcl8ev1MidKLfKS5XgIuV70OkmZ4sNOaA1QV204Q58CPFjEc3q+C0OEKzZNEHI1rFvDCtcAoozusA6oalanliieuwEenBVNg/zOcx6bDinRE1fFOIq+GFAYzNEQk/rREgTAkCAUdigUITNTFtbKRthBHaEQXRIzxrahLb5esRIgAH0Lr15ZnZfM/9EDdBHAzPSoeUNUx4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwPg3S8KYrAxAd3PcwYJmXVgBo1RwNmK63YWZ39eYbQ=;
 b=ZDnkXiYrcRdujRK6WKelKAvYZGT7uqArNZGOn3v7gq3keumgIkz85GcLjTfK0FWppcomPibpT3/3YwpmXSZPY1ybRtyAstogE7uj5opYOUNtQy71lmL/lQnIr3L/HuAnlgknP/3bYru4m+iJa0M7QwoEGGovJjq0v13jIHyZdQE=
Received: from BL1PR13CA0225.namprd13.prod.outlook.com (2603:10b6:208:2bf::20)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Tue, 3 Jun
 2025 19:42:16 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::88) by BL1PR13CA0225.outlook.office365.com
 (2603:10b6:208:2bf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.13 via Frontend Transport; Tue,
 3 Jun 2025 19:42:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 19:42:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 14:42:14 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 14:42:11 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v13 0/3] mtd: Add support for stacked memories 
Date: Wed, 4 Jun 2025 01:12:06 +0530
Message-ID: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: d645e7d7-b941-4980-413b-08dda2d6bec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ROyI/revSbVCa51wW+I2XVs241F0cw8H0pvUPCL7tLpuvEPrMc7pmugotqDW?=
 =?us-ascii?Q?jwGU11TLecSRPx1rgwRjL8mn8Jzx/Dgo3SQK8cDcuh1/jXahKy1eI4l02vrv?=
 =?us-ascii?Q?oiaQQt7W4JDOH869cB+qH92EfkYt2WDozFWXFKzCU30zZAXc23AmqwX3JzRv?=
 =?us-ascii?Q?BJHBg7f2URe3Yf0jyECDKo0sHHABcy5q9Elc/yhduafV50bxQANpkHe2x68m?=
 =?us-ascii?Q?PNC7MSNHCDh7ooXiZLiqLeDut2ZVGbOpWNERN9cmxk0dqObrTTuCWftqQ4PR?=
 =?us-ascii?Q?93C6WMR3o4Wx7AnlAoai5VH8j+Olxu+H0tjjacrolmdWpdaxCUjLoWkIG/65?=
 =?us-ascii?Q?dDs5UjA+vNqHexQQqBqT5gGE7zhehH28qnKyQ1Kg2odjB0JptDEUoryVPxeC?=
 =?us-ascii?Q?2N7XsMC3tdH5jWy5ePVZirqIHDVM53y2d+v62athxT/64sSJRgVcTP8S1i6Z?=
 =?us-ascii?Q?7flijs5zkcwGvhEfMAPVkaiuEodyjcp7jL6b/VadCj2ptKBDVbhQAA3PpolP?=
 =?us-ascii?Q?fQp2hrOkbh+2S6u43Njs6O1YiEtm1knjHKkIUonCs6ZssfLdHIvNGmkxsAiu?=
 =?us-ascii?Q?IGDO1qp18tMQBXMXmC5cZe4cyGDbynZRwrKeS+q3bfGUDw+kUW49PfWngHAG?=
 =?us-ascii?Q?9LT5KVooRUjMUMJZymBhA5yYJEPaCmlwQTaWM16wASvKEOMzehgvQhgCoNsH?=
 =?us-ascii?Q?z4erAbFAv9WlvMQgguamv5SNL5P0Y//T87C+B2sj+F6yzlHaym/6hlN3Muiy?=
 =?us-ascii?Q?yxurpc6y6PPqrH7tWOFpc1jQzvoEHqhocwTz2R+e7TWMiOHmbfv1hWLyCpfY?=
 =?us-ascii?Q?V8OyJCAfCOdxIB00dOwAKpDqF+VNYBl4PsPD6DcJ31LFXSuiy7kTb9q8NrnO?=
 =?us-ascii?Q?ERiBqzo+wU5ZaVq6axID518ILKq2x5T22Ptek9hu2VlihSRb7mAshp/RiGgO?=
 =?us-ascii?Q?KOpYEujz8lOZmgd74zeI3pXkY7T2RLF69Iwrutxf+vLAck/d50wRydbcrws7?=
 =?us-ascii?Q?B2CH8jxC39/0JaAYiDZA0y/6yWEwqyIpbk8JKqP0VOHI6F8r36V+3C5fqQOM?=
 =?us-ascii?Q?WOdYImSPSqtj1o2Mds16+Y7DjLUtY9BTHoDldk5fmrDX6i5jTsJvDOOlaNKe?=
 =?us-ascii?Q?0nqAmVjkvZooZOmPg7MXXVnuQquHu3x2Cr/HLzZ+Z/DAZW9gw8Mz+kJ1MDw/?=
 =?us-ascii?Q?KUI1KsVd4ho6syoL87wEEQDvC7ugNV8ZTZht/2Rij5ZxxIEFrDllRshZOKuk?=
 =?us-ascii?Q?wxccDf+J4/UChvBoD7sg5C5CwrWJc/GKPDRI8WZZjXKkGqGCaK/plAoPnXqg?=
 =?us-ascii?Q?7TwvStWUNcHU6Gbd2Y2VgOSaLMivpiwhB2+ATzQu8oyL+iz3Je50hSJHEOyv?=
 =?us-ascii?Q?i9rahkLwrfaPn6OKA38ZFny/2/XrenRSGB6iW3VogWl9/lhVG45noZDqlYGR?=
 =?us-ascii?Q?XXrrG7m7ChUaIvWRJ/55iHwYweOnVgTJDE4qNaKY1eQSx6AwIcAB8FiJBvm8?=
 =?us-ascii?Q?wzaGNQC94ZGLGhU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:42:16.3584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d645e7d7-b941-4980-413b-08dda2d6bec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663

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

 .../bindings/mtd/partitions/partition.yaml    |  18 ++
 drivers/mtd/Kconfig                           |  10 +
 drivers/mtd/Makefile                          |   1 +
 drivers/mtd/mtd_virt_concat.c                 | 305 ++++++++++++++++++
 drivers/mtd/mtdconcat.c                       |  12 -
 drivers/mtd/mtdcore.c                         |  12 +
 drivers/mtd/mtdpart.c                         |   6 +
 include/linux/mtd/concat.h                    |  44 +++
 8 files changed, 396 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/mtd_virt_concat.c

-- 
2.34.1

