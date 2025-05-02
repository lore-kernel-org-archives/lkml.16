Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3190B19F421;
	Fri,  2 May 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200805; cv=fail; b=QDKG1xOpFi7p7W2CWzhGAcJkt3VCovnE8CEN7bvuUigGlGkzTicBuPz8GEn5SjyWb0AK/hNsw08za6v23KTFnXUApLyrVU8D5/uZuLlN+ZpWN/I0vOYuG1f1tJqleh83rSmKb+qaxMehHludloQNExDUHKYIqOMFG2td+N3Y83g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200805; c=relaxed/simple;
	bh=hXo9CI5utGtGX0MVBnyOeYfDFmqGuMhI3RiYqmwTt/8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9JruJHRty6WloZ7iSJVj9n5ZR7KDOSkPzhVD4RL3u/JLBkgc0sJSQ2PKGnEtIV+XgRvbQ2jQF40lKGAFpmo08Gn3Ljn5NjAw/hdGAGGP+orVL44ABQVbbxvjKGpgJtrPK8wmAFP8qrxmWv++yEeHNQ8Q3oO9IEn+uya/wD4SYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0Qp+90O7; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0Qp+90O7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erMlZWIrLqfJ4ACqa7VQTGQeUhrG4gjX6s0C0wIZXiI7LuU09m9W2p7Lbje97bchsBJMQv+i4oodCEqrVRaherhC8mw11Guy6Vd5ylXv8OJdmh371l0CXXay29H3kwPI/QB5cc1CIZ9zpRYaCQlg35wL2K7vkgm9O2+lk85HihpcO7DCVi5OIPGZtUh2ciW0uVODun/TegzP5ZWNnzoZo7niGeNw1PNfDaENz/PBLjSGBfXJs/I1lKUutZjRUXdlRVHDXd6S+nxyUiCmlX/Shl7E5xIGy+nIwZzdn7yXqqsaL8FKN68FrIO7E1lAMKWIzoGSSlKh6qDn65XKX8xSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCXUIVKZruexcTPYVZ+SRymY41QVPfXItn/6lfZ3Fwc=;
 b=XQcgoO2F1/kl1lkeze6/t6stNY83UuFzEiL4gRVvglfm6iXSBPDqGe2Diacxux8sGOzCiT5gj+4rNAOgdxWKLtomL2uSPAnYtY9tq1XWCLnxRqpsWdz50nME8nV3Jlq1RaZEVI71hghJfP6sHwHwjxKSd3/yvjp5FUEeEDyMBsHRMXn/nWBnxwJlvE39EhNrKHue8zaRJZI7qmJkYEXmtLDtqbaFtzMQRY2+qy779OgbPlotDTGneuf3bUGKQnU3zFN8w6VhXyzH4wOjz+7X3shEK05Hle/Cj1/lBOnznhRKxJbYFT9tR3Ke/SC48qd9jmWL7YRChgLjixSuvQNvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCXUIVKZruexcTPYVZ+SRymY41QVPfXItn/6lfZ3Fwc=;
 b=0Qp+90O7x2x5UAV8Mpjf9NHvdLCs7XwNXMnikfjMKaZtHVNdccDbf7QPqYkEYUYtYHedgVAUlIklqxxpP14XUVnhbYabL9btO5RUdrNeIJ8uNYGXUvBsejgIazhViv2irl/grMjQrN18isZS6GcPgGW/OzqJ2GC+KzFQPDtq4yY=
Received: from SJ0PR13CA0123.namprd13.prod.outlook.com (2603:10b6:a03:2c6::8)
 by IA0PPF864563BFB.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Fri, 2 May
 2025 15:46:39 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::4e) by SJ0PR13CA0123.outlook.office365.com
 (2603:10b6:a03:2c6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.22 via Frontend Transport; Fri,
 2 May 2025 15:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:46:39 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:46:33 -0500
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
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 8/9] ASoC: SOF: amd: add soundwire wake irq handling
Date: Fri, 2 May 2025 21:12:47 +0530
Message-ID: <20250502154445.3008598-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|IA0PPF864563BFB:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7e51e0-71de-4541-1ee3-08dd89908766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AWsRQUru2/UKPK+AjyRCNM1JTBfyjBu+aYQUIf+ecWwi8AbNflWmyrEwyM0U?=
 =?us-ascii?Q?RA8sLhU4HJrf08S2kat48nbfB5C8bi3ovXMOG2ICXVkbE5NHVHQOMELF3uDc?=
 =?us-ascii?Q?+d61/KZsT5NMkd3Mw5Zwuz7ArEVHi/qhfRyYgrykLVphGCU35lSkw7KMX4uz?=
 =?us-ascii?Q?0JhoQyDA0RZUiQ2ZDFpvrHfRow1whAkkL8woMBDHtXTIwV1zl8NId6CaVUXg?=
 =?us-ascii?Q?BC09ePQ9mzNGVTQoDF+yMoU8NFEImZokW5/NYApjPU3HZ+bx8Pu+XHHrzTnr?=
 =?us-ascii?Q?Dzzy9q7lvbSm3nKvvg4eWiQ95mj5J4NqJadBJnzkusPZq5UrrOTPe0rkMU+q?=
 =?us-ascii?Q?/ut/2jjYPPlaNN4s1t/ve3MrgtC7BGMAxqvP1NwuXx8f4pzQmrQSZsoXa5c1?=
 =?us-ascii?Q?rtq16OKW681OHYNzgxydPXRORgeMFJMGaG7qkcYH2cIjU2dmWVF23dSYuda7?=
 =?us-ascii?Q?8p0NBxgJ9yMKX1WBK+2xROPdqw3htlbj1I6YNvN71Bt6JPlPStDx50AQN3PO?=
 =?us-ascii?Q?DNMU18ErLlv5VDL0RUYnYmHQix/D8GV9Nq6vPIIthrvjszZWhdMXMPfKdCME?=
 =?us-ascii?Q?L9aJ/jrHp49q6YpWk3B5csqNVB9EnmyxDivyENvT4Gaj0Dc0cvggnI1X5Lq9?=
 =?us-ascii?Q?BY8n8YbI0lej5LqP5cW/pzTlcycc8iCAlNjiF4HoiAyvTFmjgY14807cGBsg?=
 =?us-ascii?Q?B2wYXtzftRnWOFJJX5sfZkRipcCSQwwpuGHdp2CcXtZ+YNrHnXtCH/8TM0IB?=
 =?us-ascii?Q?Q7P2ARkr9+HcE6AXx44b9dtixaNmhr/SI6WaMO8/wvDhec0Fa9wDKIlLNQ3M?=
 =?us-ascii?Q?A/WAUpGh884KZnuVish8TlmQ6HOYijcwzs5Bi9lpnf1hayhR1ZdPCICjhqJY?=
 =?us-ascii?Q?NW0nvEcDXLLVu7mbhh4+EhzZNp2RvOAKMtBqeDBXxXvfIu0oWnbbgkxW+iGF?=
 =?us-ascii?Q?DyqqSq7aD0Te9z1sZgEWH9V3sHKVwgLnTqY+EQcecPjyJ9E45uVSjcp8vnYL?=
 =?us-ascii?Q?ebk6TxoSgk/HD1x7Ycgkeot9SEFuhl05BIu1At3fu9hRTew1dmI0eQSTfgNp?=
 =?us-ascii?Q?JFTkRL/D/NbBnRbzm2njYo6F+xvhPZEMf7CYdKFKEJiUgUeYGMTQOWz8pJHC?=
 =?us-ascii?Q?9ucM8G0E69zNP6H22oKEDGVUFJzRds0TT8XhELBqzvilJ8wniHK2KAFGeB+Z?=
 =?us-ascii?Q?4OIlrQ8bAEbstQylnpm+m0dhhCS/oO7fl9Wax6oaElLHmFjQyw8xqAmJaB2a?=
 =?us-ascii?Q?R2FKdITRtzA+bKanOu4nQeFXpM+F+vg5TGCJU0HcZkyJfZP/NTocyzEquSCT?=
 =?us-ascii?Q?ppGv2HK4viq6FbWpgr9hXxapvecZm6BPseNq+YiybwY1jVNen3KGylejVuBv?=
 =?us-ascii?Q?IdSyQG6pPnG9/47bOgO5g7cwcWT7ZGUsDRL8SAhEmSXlUwHxOKOePct8ZDin?=
 =?us-ascii?Q?4Bf8CnDvYoHZ93wOaqJS9pAchOOxo1q6JqQ+agoFt/FeqDEtJ9JyCn5xLyHc?=
 =?us-ascii?Q?yVK9g9JobSi5adoxwp9kqe5CA97J6LzsLBA6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:46:39.4936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7e51e0-71de-4541-1ee3-08dd89908766
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF864563BFB

Add SoundWire wake interrupt handling for ACP7.0 & ACP7.1
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  4 ++
 sound/soc/sof/amd/acp.c            | 73 +++++++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h            |  4 ++
 3 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index e77554f74c20..08583a91afbc 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -135,5 +135,9 @@
 #define ACP70_SW0_WAKE_EN			0x1458
 #define ACP70_SW1_WAKE_EN			0x1460
 #define ACP70_SDW_HOST_WAKE_MASK		0x0C00000
+#define ACP70_SDW0_HOST_WAKE_STAT		BIT(24)
+#define ACP70_SDW1_HOST_WAKE_STAT		BIT(25)
+#define ACP70_SDW0_PME_STAT			BIT(26)
+#define ACP70_SDW1_PME_STAT			BIT(27)
 
 #endif
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index d62ba4f75e4f..ec904482a294 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -386,6 +386,69 @@ static int acp_memory_init(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static void amd_sof_handle_acp70_sdw_wake_event(struct acp_dev_data *adata)
+{
+	struct amd_sdw_manager *amd_manager;
+
+	if (adata->acp70_sdw0_wake_event) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+		adata->acp70_sdw0_wake_event = 0;
+	}
+
+	if (adata->acp70_sdw1_wake_event) {
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+		adata->acp70_sdw1_wake_event = 0;
+	}
+}
+
+static int amd_sof_check_and_handle_acp70_sdw_wake_irq(struct snd_sof_dev *sdev)
+{
+	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
+	u32 ext_intr_stat1;
+	int irq_flag = 0;
+	bool sdw_wake_irq = false;
+
+	ext_intr_stat1 = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
+	if (ext_intr_stat1 & ACP70_SDW0_HOST_WAKE_STAT) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
+				  ACP70_SDW0_HOST_WAKE_STAT);
+		adata->acp70_sdw0_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP70_SDW1_HOST_WAKE_STAT) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
+				  ACP70_SDW1_HOST_WAKE_STAT);
+		adata->acp70_sdw1_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP70_SDW0_PME_STAT) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP70_SW0_WAKE_EN, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1, ACP70_SDW0_PME_STAT);
+		adata->acp70_sdw0_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (ext_intr_stat1 & ACP70_SDW1_PME_STAT) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP70_SW1_WAKE_EN, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1, ACP70_SDW1_PME_STAT);
+		adata->acp70_sdw1_wake_event = true;
+		sdw_wake_irq = true;
+	}
+
+	if (sdw_wake_irq) {
+		amd_sof_handle_acp70_sdw_wake_event(adata);
+		irq_flag = 1;
+	}
+	return irq_flag;
+}
+
 static irqreturn_t acp_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
@@ -418,7 +481,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
 	unsigned int base = desc->dsp_intr_base;
 	unsigned int val;
-	int irq_flag = 0;
+	int irq_flag = 0, wake_irq_flag = 0;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
 	if (val & ACP_DSP_TO_HOST_IRQ) {
@@ -456,8 +519,14 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 				schedule_work(&amd_manager->amd_sdw_irq_thread);
 			irq_flag = 1;
 		}
+		switch (adata->pci_rev) {
+		case ACP70_PCI_ID:
+		case ACP71_PCI_ID:
+			wake_irq_flag = amd_sof_check_and_handle_acp70_sdw_wake_irq(sdev);
+			break;
+		}
 	}
-	if (irq_flag)
+	if (irq_flag || wake_irq_flag)
 		return IRQ_HANDLED;
 	else
 		return IRQ_NONE;
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 097454f2b48b..d3c5b2386cdf 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -263,6 +263,10 @@ struct acp_dev_data {
 	bool is_dram_in_use;
 	bool is_sram_in_use;
 	bool sdw_en_stat;
+	/* acp70_sdw0_wake_event flag set to true when wake irq asserted for SW0 instance */
+	bool acp70_sdw0_wake_event;
+	/* acp70_sdw1_wake_event flag set to true when wake irq asserted for SW1 instance */
+	bool acp70_sdw1_wake_event;
 	unsigned int pci_rev;
 };
 
-- 
2.45.2

