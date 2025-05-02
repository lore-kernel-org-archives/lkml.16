Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE33259CA7;
	Fri,  2 May 2025 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200757; cv=fail; b=gReTxIFQBXTb2JibxhJKaH9Tn9Qr0RqfxqY9cPIxtopoJbqu6pGFTg9EzbYriNK/0x8Dw6KnRGw58dLU4gVm855WN42ltLwJ+dMcO4yDyYyNVLk6ZK8lWMp9xYeqXvTbEuSE/p5xczQUwH8pBIIY7+jVW85N2GTn8QI6NF3bIRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200757; c=relaxed/simple;
	bh=Jc2cT8PXKmGrhnY3ewOXMnjdvEY+jtYCaOxI1dHJcEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxvYfdqu1g+VfXK6LBkq3RLpnxGKEK2sKdvj58na1tgi6VyFWQUbvvHzhOMMFd5CajnV09KDECrfO40gQ4UxMM4ksk1l4s9gakYa3TQWSOhYTITZ4k7kpPVmvWm1UQvIugAQtGrGv2qdTNOCXhI7/G1NFV0gpqIRmHOvZlpv+XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M85BaxrW; arc=fail smtp.client-ip=40.107.220.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M85BaxrW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPSR6XA9iYyf83ce26k7VDWV2X+t8Dv5K7SRt0WiqPmT7LfoOaZVwuhi2uTtpoxIreaSPgPG7NoBgfyaUzEnX3fGpY+2hjHMjSTyfNM3wp7xuk/XLqxuR35cTNGqE2BDGz8TqHoCn2Zny0l0QHM1nTVK2dShtrDRPCU5D+qsvyUk+ILaj6QdRYpxt52UUXYtZzj9FIfroVjpeinzVTFAAA+w8ZgIGrKvGbfU+GUtPAo/jWT0KKg5evfDkaRGpJBcNw2UfH6C5FWA0lsYvC8cBnG850QM7hsOA4SXI1cGz8nrnh/W13V+BgF76f6/tWJ6wZQyi5iezvzH29bk7ul1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqsCzqh6oDjBL4gVVBUGjRDUmMRldRKRUNLGD6CswDU=;
 b=whFK1y9nscix+L5FlnE8blgJru8Kh8pqhvJMVUEwQQLKNEjzGsiTSAB8SAq/jTRCtfMeZ6jksE4iqQ7GOSvPiKlxFsBiuR8N1cJjLoK9Bt4YiQItyNBPAH7kAwmhtal5oC2lwahLVf2fI1GbilCJ177HLCCSWVFF8FNgR/q/iXaMwDs2K7SotarCb2rYeygNWvCn6MnhRHXmZdt4A7sUlEF2rpMiH/ECK0V4yet48Nh6KaESSsbGfWGrRoR7NmPveri/G9Lrpwe7R23M98VaO7Qqjq92YQejAlI13sxNXGrjvjmcppEgPwE1JsEqfV2f7+znkhLao1LHPbk7xVfIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqsCzqh6oDjBL4gVVBUGjRDUmMRldRKRUNLGD6CswDU=;
 b=M85BaxrWIVkFKLopAISz9elijG66/49gMLJ/FGdNAsuxtqDtoL+FJ6lI0X+yP4PqgwhwvD1yBeh4yLvB4j1czU2Feo8ypzAi7ZHyC/EWUaOdmrLb8e831z44F6cw6RktDfk8iyYR+H455warP9DYR010jJ52/7YX2kcwstNKYkU=
Received: from CY5P221CA0124.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::7) by
 SA5PPF7D510B798.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 2 May
 2025 15:45:52 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:1f:cafe::76) by CY5P221CA0124.outlook.office365.com
 (2603:10b6:930:1f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 15:45:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:45:52 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:45:45 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 4/9] ASoC: SOF: amd: update soundwire specific acp descriptor fields
Date: Fri, 2 May 2025 21:12:43 +0530
Message-ID: <20250502154445.3008598-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502154445.3008598-1-Vijendar.Mukunda@amd.com>
References: <20250502154445.3008598-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9e7432-a57d-4a8e-6e41-08dd89906b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gi6ja90seZ6SEUPkjk5yZ4G4LcAaBiLUYas6essDvfJWX4SQrZoucXiBDEkG?=
 =?us-ascii?Q?DqySR5Iyhs2/UIf9Ny1kfggdv1EO+iT+uqiifynW8Y96DWNIopuLW11BFU13?=
 =?us-ascii?Q?C1O+5u9kl1RWHhMEz9uMvbiuP7lZDOCfGaYQ2SshQAmOBhcun80t7UO92d9I?=
 =?us-ascii?Q?HprAUeUPtkNXVk32YGr8dMnhLKnDADLUsGsr1ghSMIDFwrqJbtfuNmXNWKqw?=
 =?us-ascii?Q?dij8Z1vzD0gFoQ4OCIG44nUOOM3BCCRfr/AhZ9ctY7oU4SzrdEkLQjrp/KPN?=
 =?us-ascii?Q?hMIDNsa8KavCum8KhpaNRoGYu3lN8GDl6Rg7ac0ol5KiT7F7Bh1HxoMjOyiq?=
 =?us-ascii?Q?oYCjh+9sU2y1LNhC5X9izyJKM5Z4e0KyZrVTvXqeM6Z9K3UoPFqSotY1+VZT?=
 =?us-ascii?Q?YBTphM9igealH7VCMSLFvud5Iqp/VSpK/mAQhwkqwEuFLDXIlRUW7ZX5l3e6?=
 =?us-ascii?Q?0IN2i2mketqy/C+KYzN3P8slrMsxHM6nHKnVtSbhEdWbYMzptbxU0p2v3VOl?=
 =?us-ascii?Q?P85G/duO331hbv7LsgdGAErNmDGAw5i2+vYLNvLFTriI2xNo5MPbbV2YK+MV?=
 =?us-ascii?Q?uKlzVRdschjYN89FqN/YxgNiHp3HNX0SAnidrQsnY0YEkFRBusLNHncWGgrN?=
 =?us-ascii?Q?1EHztSQonnKMPJWTaq8ZnNlbJVOFZCkv+16B4rx+MAUzAWKocDZ+jXrOnQNN?=
 =?us-ascii?Q?lewzzpzRyyrhy9R/JohTXXTO7ItOQUbPomQmmq/oLeqr6VM+DfXtz/9/rOpn?=
 =?us-ascii?Q?MTzJRnTqomWsjoNKG86xpZvWqnXDPG076agWpHxMsIwXlbVUD6mehHBJP2dZ?=
 =?us-ascii?Q?johXvssIvj+M896jRkBZIIWJommNz1zL2ocb/F359bN3iYfHvc2eUCUm9F1p?=
 =?us-ascii?Q?XLGZXeK0c3h9327OrFlIR6UCbLvkMenkbbF8ewNM/BlC7OAxQC0im3Byq51k?=
 =?us-ascii?Q?b0gCTP/YZgmgNinD75RTB2sjQf6Jigv4kcJ5jkaoV4dinvYVGL1m27Ab2aH4?=
 =?us-ascii?Q?nEuruv9L3boULNQUO4kWuYR2OdO4sVmSwUTpUwl6Y+105Jj8BelocZL6m6RU?=
 =?us-ascii?Q?ibK+KQDLr9ZzYVU3xXkI0OLxZ+u0BpbLIbr7+QElzguKraI9eBkrOCpRcgxE?=
 =?us-ascii?Q?f6DOKmOymuOql7UnK8B1zCeoX+BC43gI3HMcflSMbZHqnV1ACAqFal9+hgar?=
 =?us-ascii?Q?YbJGJi9TkZ+2uRvzaRWEACV1VEXQWGwvYnK+8nf0NTGmwfam6WZA2YcIivho?=
 =?us-ascii?Q?tiS1rT7QzDDq5jZP2N7zmiMRIcWUFNOG00VOK/f5zgILey8brjzBlBCBXQ51?=
 =?us-ascii?Q?W8qfEIv2C/OJoFKUf+ukzDUBjBTSyOZU7glKG2Kiiq59Mitk/AWjyGawdxbO?=
 =?us-ascii?Q?jsf6VNQ2+FuXIfr6gwWbh9VVc86kMtKxuR2noglGTSC/kqJ8VVjTfXkdaCz5?=
 =?us-ascii?Q?iF7F7fXtbBQdb/lZxUpTStYFv/SP1/mx6WfYsT7E46SAl6z+umcS5OXeWIfF?=
 =?us-ascii?Q?k/ClRBnuFWR6YCjl8F0HZCZCL1cYrK40W6wj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:45:52.3803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9e7432-a57d-4a8e-6e41-08dd89906b52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798

Update SoundWire specific acp descriptor structure fields for
ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp.h       | 2 ++
 sound/soc/sof/amd/pci-acp70.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 86acd43f707e..097454f2b48b 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -110,9 +110,11 @@
 #define ACP_SDW0_IRQ_MASK			BIT(21)
 #define ACP_SDW1_IRQ_MASK			BIT(2)
 #define SDW_ACPI_ADDR_ACP63			5
+#define SDW_ACPI_ADDR_ACP70			SDW_ACPI_ADDR_ACP63
 #define ACP_DEFAULT_SRAM_LENGTH			0x00080000
 #define ACP_SRAM_PAGE_COUNT			128
 #define ACP6X_SDW_MAX_MANAGER_COUNT		2
+#define ACP70_SDW_MAX_MANAGER_COUNT		ACP6X_SDW_MAX_MANAGER_COUNT
 
 enum clock_source {
 	ACP_CLOCK_96M = 0,
diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
index 8816c323d69e..c4db21668252 100644
--- a/sound/soc/sof/amd/pci-acp70.c
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -40,6 +40,8 @@ static const struct sof_amd_acp_desc acp70_chip_info = {
 	.hw_semaphore_offset = ACP70_AXI2DAGB_SEM_0,
 	.fusion_dsp_offset = ACP70_DSP_FUSION_RUNSTALL,
 	.probe_reg_offset = ACP70_FUTURE_REG_ACLK_0,
+	.sdw_max_link_count = ACP70_SDW_MAX_MANAGER_COUNT,
+	.sdw_acpi_dev_addr = SDW_ACPI_ADDR_ACP70,
 	.reg_start_addr = ACP70_REG_START,
 	.reg_end_addr = ACP70_REG_END,
 };
-- 
2.45.2

