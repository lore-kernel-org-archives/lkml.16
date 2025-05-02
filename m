Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977F72571AC;
	Fri,  2 May 2025 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200790; cv=fail; b=E6jd/QZDs7s/yKMmJK3QbWq0dYihEmmGhC7E7Zd12v6wHXEuwIW5klCgmcIQtAhQs26iEXbAhgXXfuRksVifH+lk/bEDMCXceB5IrOHaxuJeTE8/6KQzLbT6xdPgSLg2fBjhK6Ba+Qx18rXjlqOHX1RSL/iTzzubKpuDcE92Sx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200790; c=relaxed/simple;
	bh=aUXgsChHs+f83y+VruCwXoH0Ha7pHO6sH9ZpuYdo93s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmz9fsgjFZmNPVMCUqK9bqrS+51ZTs4e28EmgIIGWRUaoUhhesh0euPGgz6/i8AodjAsbe2sJZNO8aocfntVWufM3BMvs1KFPx1CS92feOkKkSp/aHh1r3Y0N0uCPC+H1vIKmyZK9IUdL5Fq/yoRtpNQ5+6rWYa/i6nF5PdwbH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zIqK5rtu; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zIqK5rtu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g57/5eHXWKIrmosz1Du517+12E9Wky9lRoqz7RxsMy9pJj5t3eJLYaQuRkvW9zd1FSbxzJZGa7Vjcb14Aw82OObXcaVZHlGszu21CeM8Un6DanKeBIRDRCMnhYyeQFw6zkjdGQFZfpiwzfZC7VIyQs3+d8Y0rhYbu+N8IRn0HGRBm1gaA4mz/FCh6gRGLD9yqJflJTpwzvIMwQCfwmUhvp9Jw/JkIpFqImdcfhGiN7RBoHMkq/g2DWyGLkizlExneWjs1O8tmBvc9GHKySLiJUTQC7SmLJCBWz8gOk8YKEsOeqE404/TAfMCwhJaOk9qokl+yKxVbmBpgP4ZDFOXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NYVjNs7AnJgHF6Pcw7IFQH0tMtMLxCfA6YXSTyNs6Q=;
 b=lKESTKMKhu2SLqC1aG1dleC7qRBE6DHTMJJPbwq5Zns29LDiKXZSK0k/FMF0GfS3Eat5rpXD/gyxdJuYxUEdAdUErzI3zDQfucbujlAU+QJjAeBsxQsYwZLZOtlwzgzYwi+gpjqkO4LDsbJVr3dRp+RL+XMkXroYMRQNmoj/jiZ8HfxKucKzEIKMSK6fBz4h+eHTFPlMBsd+DARybGtGA1ZRvmc9TyHwGYC1WLbCl4RlKmsMsHaVRcW9FeWThr1o89nx96zKeo+unYQxlOmG3m5PdLdqVyFvg4yhVLevUEPB9190ZFwsC1HEw6TxJNZ+Yr5PQA0+VkSlg8kPQLhfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NYVjNs7AnJgHF6Pcw7IFQH0tMtMLxCfA6YXSTyNs6Q=;
 b=zIqK5rtuoCU2qjqfoPaGjTxm+qDqIP7KXPhAjW5rnF04w2WIqB2+Hp+CUHeLaeo9HfFNFm2e/ITPVGlIUm+rcD6NdsDtCUpp9lAtw7+rfDPHFTK3HfjrCzw/MRTs/F9KSfoBzv5n9EJMiQUzb5ln/Nf+Vu2fCrGzb8x7V646Rog=
Received: from SJ0PR13CA0142.namprd13.prod.outlook.com (2603:10b6:a03:2c6::27)
 by LV2PR12MB5799.namprd12.prod.outlook.com (2603:10b6:408:179::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 2 May
 2025 15:46:24 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::53) by SJ0PR13CA0142.outlook.office365.com
 (2603:10b6:a03:2c6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Fri,
 2 May 2025 15:46:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:46:24 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:46:18 -0500
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
	<cristian.ciocaltea@collabora.com>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 7/9] ASoC: SOF: amd: enable soundwire host wake irq mask
Date: Fri, 2 May 2025 21:12:46 +0530
Message-ID: <20250502154445.3008598-8-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|LV2PR12MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ffab0a-3b1f-4aaf-39e5-08dd89907e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tfh4M+KiIUl6sNui9oQne+10Lmm8qNqt/7i7Mk0DJsM17JbIDGahl6vlWXLb?=
 =?us-ascii?Q?vmhEp7430zDr4jhgcYJalIBZ/7Hfsue7YMFosOiudhcC16FtjqV4fmfpUQaJ?=
 =?us-ascii?Q?kxWb/BmQ67U/wG2/KDiuheQJDTvxCNXOArn4zhsM1K28hoLMtz0ODSWpE7uk?=
 =?us-ascii?Q?jySqc1Ojxgba4fnyPNrDBLJbh6rMbGWfExZ2f72jjU6R4NUV65KAZYCdMaur?=
 =?us-ascii?Q?IDUr+8mSt8sCduJbUndNlyeyWHoomMeVwPUqUjrbTet0UT9JqfV5wm4Z/t4l?=
 =?us-ascii?Q?Z4sTffoCA90hgTdL7ngWY5ZhedBun1ZbuNMlxkqlG7WvFGUsFd4Nz6SLbWRw?=
 =?us-ascii?Q?sdDZ/cMyfD+yFUqVYEl7a4fom0/vA7V3K1oWig2GVvHrY8UnRM+m2Uy09X0M?=
 =?us-ascii?Q?6XD4xNHo+E0QlJO6Q9SZznejJfRj8NipUZpCEmjPHAzckCho8YlWKEyhLT0f?=
 =?us-ascii?Q?yTLoY0GhI0uM0+lWTkC439QeQbtwg1Fza7GGWeepmkbj/64IdVFJh7UieNFw?=
 =?us-ascii?Q?35YslrI9ygXsQcS4PhwoM5gzNGL+0nOOvarWO20N+ZVPGokK1wtx7N+jOcKw?=
 =?us-ascii?Q?Os/tqj4nm0k1KiN7d8H8CAhfheMUJF/c0TKnBaDMifzC+B8JO5HwHbbWPsy5?=
 =?us-ascii?Q?GLUh8RuqsfbnKeJqKykx8PlC4uDW1h8P3n0hwNEkI16Glm5Hzcd1tuRGvVof?=
 =?us-ascii?Q?Hu6fpPPXubHVzRx6VkkIgOApNn11mpGfrM6hkvcsXNHc7r/ZFxLMkvu5xyEZ?=
 =?us-ascii?Q?CKrk9bpvncq0qCjOMQe+1YksgnWNFCvCPeyjHqqDBoz0CzXLYoOzx0/zdlJD?=
 =?us-ascii?Q?BJ7VKHLqm/wiDXSKaTbnIiVELKGq5oKqGPF0e3BAFd2rGhq91nI6Trc2gkSS?=
 =?us-ascii?Q?bGFwasf8Bx8y99fHtgS0X/mxUS71HIgeb//NYJDZzUmSxP/gTLQARBE/DcG5?=
 =?us-ascii?Q?tmDe7U+OTyu8HfmgT3VhxtrUjy92TcYiYvINmVGaYr2E2R57cE69X5TEFr65?=
 =?us-ascii?Q?rFEXN1QKdoWmvaR17IAxl1X6UHzDuCRwqjxPOWio+78400EN9FipKbtLKgrO?=
 =?us-ascii?Q?cRJDWMYJB/qPXr0bZvqeCEhu/jZpslx/zIJ7H5B7o3kQtaEY7Tp7YJb3a89X?=
 =?us-ascii?Q?FNRJJuaodmHMwhPHZgBHW6jzXsRXf318oCuu9uBFfGZ11/bVNh/l/A0qcMmK?=
 =?us-ascii?Q?8f3TYEWov3vZQW2EXnu3vhaP79dbOQTlanpLEbzRoyPkneCCDJL2HaiFYy1c?=
 =?us-ascii?Q?HXKyhnES9psUJMAbGLHJEzdQ8bfScPIaKZNfx64s1uIk8gyrfTWj4MrDevWI?=
 =?us-ascii?Q?Nt/BvOQVODtlFx8dXWTzs7KH5WSltiBrGCxhyJWUgyx49eevoshTItBlU1BW?=
 =?us-ascii?Q?FvwzGhzCztFiTrQ3CMZobnn3MUZq8xholACTs5mFTf+wl8muxgkT27ii+a09?=
 =?us-ascii?Q?Fl9SQCwqI4mBVxM9fALjhHYhwbAk27139/rtqRE4mRe5TTpggcOQQ74X3Ila?=
 =?us-ascii?Q?KUuXifIglJtMEHQR5UKZzk3ccIEvd7twEot4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:46:24.5560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ffab0a-3b1f-4aaf-39e5-08dd89907e7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5799

Enable SoundWire host wake interrupt mask during acp init
sequence based on wake enable checks for each SoundWire manager
instance for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h | 5 +++++
 sound/soc/sof/amd/acp.c            | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 414151187b44..e77554f74c20 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -131,4 +131,9 @@
 #define ACP_SW0_EN				0x3000
 #define ACP_SW1_EN				0x3C00
 #define ACP70_PME_EN				0x1400
+#define ACP70_EXTERNAL_INTR_CNTL1		0x1A08
+#define ACP70_SW0_WAKE_EN			0x1458
+#define ACP70_SW1_WAKE_EN			0x1460
+#define ACP70_SDW_HOST_WAKE_MASK		0x0C00000
+
 #endif
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 2ad5fbf43c8a..d62ba4f75e4f 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -563,6 +563,7 @@ static int acp_init(struct snd_sof_dev *sdev)
 {
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	struct acp_dev_data *acp_data;
+	unsigned int sdw0_wake_en, sdw1_wake_en;
 	int ret;
 
 	/* power on */
@@ -591,6 +592,12 @@ static int acp_init(struct snd_sof_dev *sdev)
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+		sdw0_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP70_SW0_WAKE_EN);
+		sdw1_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP70_SW1_WAKE_EN);
+		if (sdw0_wake_en || sdw1_wake_en)
+			snd_sof_dsp_update_bits(sdev, ACP_DSP_BAR, ACP70_EXTERNAL_INTR_CNTL1,
+						ACP70_SDW_HOST_WAKE_MASK, ACP70_SDW_HOST_WAKE_MASK);
+
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP70_PME_EN, 1);
 		break;
 	}
-- 
2.45.2

