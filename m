Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294C233D9F;
	Fri,  7 Feb 2025 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909754; cv=fail; b=ur6XXsau14CEYTiW6s9kzJDKDaLJZlu1fpwj2CQKoVZU9hatuGddNwgmYDCNDv7HfYYNcPXJ91foPbLLo9xS4yzYN16GC1B2LFjWzwie2/wUalzS5GwmbHG5POCp9lnVnaY7Twa492uVw/q4Fyp6fh46ctwPxHPlNJ6OaVJtVBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909754; c=relaxed/simple;
	bh=HXP/CtawY7tCZ/vpRJ/intIpRp0Q81BZP5slusIr8dE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QW7NQt/zUPEKC3he0xNAKFzszbOKzmt7oZ8Zbk5KGhG4Sfllf3eimLoBA7EtrEvSPgYrFBxFdzwPnPlqklySfDvNX3IgYa9Fwi9GeewylFpITOhc0Ydx/XylgWULxGKvMR62ErncP0rCVvLdqk72nV4mDsgIc/b1orAzL53JZZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b3u2o1f6; arc=fail smtp.client-ip=40.107.102.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b3u2o1f6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiCHAUdcMclq9dLxoMe3+OXXM9kBDGuUi8KWK51GnwWFUQxXMp8tEbZVlGb8gFlOBlx5khFlebg9r6nByrtgaUB4bXQObx0JMhdnqIyAFnFJzcf517XrB3yn4KXyMuoZhWvAQuyyOZwcxJuaAEtNmlP0tcHH6BKq9Mubb33xGs1XCgC+2/qP1rmaNCYGUVji5F6LKdVNzYpdaiFuZUiyT9IC4WsnGRzbNU0ENM654jICq6j3lpevNm4l2pvFVFgh5U9QTOPW/4QjKBXa/Y+CnMBQkVslEQosAswSRfAnCEPzCriWxLc/cMzrl1JHdhkWeEnd8tu+nzOLXYA/kgDfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTdDszGIzCH7Xl+omZEsg1nJLdFN8tHNnKFPSkpR6rE=;
 b=e0KEFF5cNgiiDdPVRwXBeKXfXrSADsFNnvJ/FCiM7/FwmVddPMkp6SSCIkgDAu1jcKvxug+oiTaJX1el5u2c+hjdtndNaD43eiqJObCLuCSPJCEg8Z8rnnNG14gNIrkMWuQ9SAK9FoprP+q9xgNp2daVYW/QmaALEdKQ7ltJ6DPmc7E12iGPSIErm3jKszYiXDPZLcXXCU0yZnkgkysJc+O23RceO0hNG1JMFrbg5D9fwLs+JhCYK4M4gj9Pmrv4JUdbLfrpdByPuDlpQvbyk4gCjXJLaNDksMRZaKPw8QCmYRkblgMlknO9jpZ5BLw7yNC7z5fUTtA9jOVdI8wfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTdDszGIzCH7Xl+omZEsg1nJLdFN8tHNnKFPSkpR6rE=;
 b=b3u2o1f69EftU3iaOUeX6ib0CS2KCrQiky5Ad0fHto+1jWwhZdv0bojWVZGRQmtc+nl5W0HCjKWiIn1fjvIBpIXiAIgaLH77LEGueFREjpnlqFEcTPZSO+KQHPp5Ma97wvw97lLMv2iKZt2Nh2nYIM/1oZdu0uMjDSw7J3Huv4w=
Received: from MN2PR19CA0033.namprd19.prod.outlook.com (2603:10b6:208:178::46)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:29:07 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::fe) by MN2PR19CA0033.outlook.office365.com
 (2603:10b6:208:178::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:29:06 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 07/25] ASoC: amd: ps: refactor soundwire dma interrupt handling
Date: Fri, 7 Feb 2025 11:58:01 +0530
Message-ID: <20250207062819.1527184-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS0PR12MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: d56b8d61-02d2-4828-8db7-08dd4740b965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k9KoBAl4inM8vwEUVHXPKvUagMeD27RJOXF+55NLvpDqSQwiO3NdoKBtdTnV?=
 =?us-ascii?Q?HvPy0N9tz9KXHoJFny8rXHPvi3fkUOQeyoMiFMO/3JYiwDQrWOa5RUvzBZXT?=
 =?us-ascii?Q?dk7+U8+hZQdNg66FSdsH+9wqCbtTyN2El2aNqK/7/OXMksBXwMgy++Q16llv?=
 =?us-ascii?Q?dO8FcXHPeiXOaOUV3FsN3rpXUj4lJ3kXCWvIEJyGqv8yrrpqA4CmLnU+Ggol?=
 =?us-ascii?Q?/rVl81qJaz+Y9AMNdDrH5R+ZIeY+/Xjx+FyYP+rYFOc7aW8tdBcUDd7iSAzq?=
 =?us-ascii?Q?E/dV22RgYCkty3v96ImfRf8VLFlA8JU1B5QNJfqC0iaGQJeICMKsCilV3QjC?=
 =?us-ascii?Q?HOuTVnnnljuAL/bxuiGsOGWk0ea5znALy73DN37hVZAo2XAsKRMugfreuclQ?=
 =?us-ascii?Q?VUYu/9T+nIky1FGy7684QkIia2PahSLBxI0gkFDKMmNTLPWaZrc3GDnPGYCU?=
 =?us-ascii?Q?ZGVaUE6LWR/HqKY6gTL5npDLQ6fMXB3rNouXGB5ZBDIK3YWfXZk02DhSDg6O?=
 =?us-ascii?Q?AYH75VWuyWYHACXxCBZ3CYF6aEiH0lVvkBuhbRUtl37FxWa37cr6qfQgc2zd?=
 =?us-ascii?Q?FRJjiSmwmZ8tEncb/lt9QEAyyy/R42ceQW/6U1vVSIsjAvtHi/hWs52aXCxj?=
 =?us-ascii?Q?o1OfQHmGkVfL1weZmOo/nDNrKnVb2X3NfHhieY5yCqc34M62ra1U9zW7ntNM?=
 =?us-ascii?Q?bMeSQ6KDBfICNrL+tQA+qKAMdPtLpoV/3RCFa+WyefDg/6N6G07cPuJM1f6W?=
 =?us-ascii?Q?llY4KcSeUZcPugGMe7x8bemAgDDgLcTzqQ9UrV5xpPvTbndY7oVILQsL/eiS?=
 =?us-ascii?Q?C06Q/y+Uq+JfBZIQ3TvitRiLFyl8vNoUZyJt49yvpPPNtsb6Ws9F8yxBYeZB?=
 =?us-ascii?Q?emWoA109xhsLKlYtMOSjO8zrj+v/wdNDdoo2Jg03xuKn5afyN4I85utDkIRP?=
 =?us-ascii?Q?E6s53D4LFfSEKEfTon8s+0MX6ojREvDAV6sgP45GlQGJY36pW3Uvfp3obDna?=
 =?us-ascii?Q?Thlu0vqSXwA5EXCIWqC7+iS//qQpeOdqpaHgpiBekx+vx8AucNeHAJgRly2I?=
 =?us-ascii?Q?9NQuJeosAeuZuSHo7cVWcE/6wHXO0XSl46dxVb5A1/gCz4iVtLC4aNfbUJ6Y?=
 =?us-ascii?Q?zAMCW2q5/VklYcPSMOfQ6wdE+NCDOH+czL//QBSE3g12zlwDLJRoRz/B0YUT?=
 =?us-ascii?Q?vbJhtghOgwxgryxy00NWuX5xMIE6Zo6we8CQEt91yeYVYdCjCyb1CJv3QOUu?=
 =?us-ascii?Q?JQMhpPNDjc8fpHnBQk932Bvq9qpALatiJu6rILtukXyqtSE48M7P99pLE6gn?=
 =?us-ascii?Q?n4nGEtPdJ/cXk1l4PAnFntW1L1bu1aZCZKROetk3f04CPkiZqWABAaxiPBEf?=
 =?us-ascii?Q?IpFpfl2yfHQdU7LISNQMnA0EhAHgViQ+i92Anfo7x0vRTTKxFyPUSDb2Wki6?=
 =?us-ascii?Q?pHIr+Z6eslfhrYYKBa9CmuI4tjLK6DkFFM68WWYuPLHARlUMPv/PgnDP8JKl?=
 =?us-ascii?Q?OUPCISY3iJwwWfE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:06.9772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d56b8d61-02d2-4828-8db7-08dd4740b965
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318

Move the Soundwire DMA interrupt handling to separate function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 96 ++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 46 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 5d9c230043a6..04b43b4128bc 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -21,6 +21,55 @@
 
 #include "acp63.h"
 
+static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32 ext_intr_stat,
+					      u32 ext_intr_stat1)
+{
+	u32 stream_id = 0;
+	u16 sdw_dma_irq_flag = 0;
+	u16 index;
+
+	if (ext_intr_stat & ACP63_SDW_DMA_IRQ_MASK) {
+		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
+			if (ext_intr_stat & BIT(index)) {
+				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
+				switch (index) {
+				case ACP_AUDIO0_TX_THRESHOLD:
+					stream_id = ACP63_SDW0_AUDIO0_TX;
+					break;
+				case ACP_AUDIO1_TX_THRESHOLD:
+					stream_id = ACP63_SDW0_AUDIO1_TX;
+					break;
+				case ACP_AUDIO2_TX_THRESHOLD:
+					stream_id = ACP63_SDW0_AUDIO2_TX;
+					break;
+				case ACP_AUDIO0_RX_THRESHOLD:
+					stream_id = ACP63_SDW0_AUDIO0_RX;
+					break;
+				case ACP_AUDIO1_RX_THRESHOLD:
+					stream_id = ACP63_SDW0_AUDIO1_RX;
+					break;
+				case ACP_AUDIO2_RX_THRESHOLD:
+					stream_id = ACP63_SDW0_AUDIO2_RX;
+					break;
+				}
+				adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
+				sdw_dma_irq_flag = 1;
+			}
+		}
+	}
+	if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
+		writel(ACP63_P1_AUDIO1_RX_THRESHOLD, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
+		sdw_dma_irq_flag = 1;
+	}
+	if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
+		writel(ACP63_P1_AUDIO1_TX_THRESHOLD, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
+		sdw_dma_irq_flag = 1;
+	}
+	return sdw_dma_irq_flag;
+}
+
 static irqreturn_t acp63_irq_thread(int irq, void *context)
 {
 	struct acp63_dev_data *adata = context;
@@ -35,10 +84,8 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 	struct pdm_dev_data *ps_pdm_data;
 	struct amd_sdw_manager *amd_manager;
 	u32 ext_intr_stat, ext_intr_stat1;
-	u32 stream_id = 0;
 	u16 irq_flag = 0;
 	u16 sdw_dma_irq_flag = 0;
-	u16 index;
 
 	adata = dev_id;
 	if (!adata)
@@ -82,51 +129,8 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
 		irq_flag = 1;
 	}
-	if (ext_intr_stat & ACP63_SDW_DMA_IRQ_MASK) {
-		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
-			if (ext_intr_stat & BIT(index)) {
-				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
-				switch (index) {
-				case ACP_AUDIO0_TX_THRESHOLD:
-					stream_id = ACP63_SDW0_AUDIO0_TX;
-					break;
-				case ACP_AUDIO1_TX_THRESHOLD:
-					stream_id = ACP63_SDW0_AUDIO1_TX;
-					break;
-				case ACP_AUDIO2_TX_THRESHOLD:
-					stream_id = ACP63_SDW0_AUDIO2_TX;
-					break;
-				case ACP_AUDIO0_RX_THRESHOLD:
-					stream_id = ACP63_SDW0_AUDIO0_RX;
-					break;
-				case ACP_AUDIO1_RX_THRESHOLD:
-					stream_id = ACP63_SDW0_AUDIO1_RX;
-					break;
-				case ACP_AUDIO2_RX_THRESHOLD:
-					stream_id = ACP63_SDW0_AUDIO2_RX;
-					break;
-				}
-
-				adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
-				sdw_dma_irq_flag = 1;
-			}
-		}
-	}
-
-	if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
-		writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
-		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
-		sdw_dma_irq_flag = 1;
-	}
-
-	if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
-		writel(ACP63_P1_AUDIO1_TX_THRESHOLD,
-		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
-		sdw_dma_irq_flag = 1;
-	}
 
+	sdw_dma_irq_flag = check_and_handle_sdw_dma_irq(adata, ext_intr_stat, ext_intr_stat1);
 	if (sdw_dma_irq_flag)
 		return IRQ_WAKE_THREAD;
 
-- 
2.34.1

