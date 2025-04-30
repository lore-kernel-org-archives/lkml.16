Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958AB2797BA;
	Wed, 30 Apr 2025 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042950; cv=fail; b=CvoPc6W0QYr905ssbh6b+/VBjnakFxImIIeNmeDRde3Q/M273ZNh2tNfSMtcaDW5rrAoUzATaGi4OjW5IRQOd2LBVQSHuau+Z8VPaRCeqHB5m0YPfg9+zMjZO9iWEWm/mdjb6fu69Aq8JBg95UKts8ZhCdGEwjZtShQeYWNLOVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042950; c=relaxed/simple;
	bh=MPw8SdR8S6AutihhOgWvUlWu/ls0ZQpOa+wvciy1yRY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nosZo37RAlYZR0E+7hlmSk2rQ7s83fgfSTBNh9lb0FEMduywoV5/LLrKkMPlyC3PREJ75TfBJET8gFQk7CBJNODbMhYs+xQos1ZTlDbaaiLT3BWHHKWC2N2XQRSpsv7oXvZj8Sh6WStzLswESJ393TMwTGbM6EGuuVqBnwh9zSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ezpy2rH4; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ezpy2rH4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fv7DeOeuP3bxVUUr7k+8MX/hgQReOEeNCNtWx3UMzMPGFdwe1P5XRCsuOGDV/2oi+UdbkN1z2iTTxNOri3iJLoJsoaEP3zWnPaZ0xEL6VZ9DU8nvfoMeZhVU39iXsJbTq+XqKiNTij5DiLrhraoSw0zfOB5elBfAPLEsluPEZ9wiqfW4Y+Wk0xzzQ4jx/uS2zEyYTtcfytAJ19uNCpzLZ78q6HtfJC2rDF++aVtQljEuS9EuKbHMXIE7e6CgOdx46pAK1ZSDwdIpiACYlWdJMZDeWZo4LN5yVPcbkWy0JAU8otVGXwI0gfWDI8+R14vjVLJmV+5XJFV0wFLO7mEdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwV1G6bFEuOoq2wzJSRUwdpZSwYrR5Hg3k2a1LOfCY0=;
 b=HzIrwL3GYBNEaXS9cyKeQ/S8hijK5VahAn9ezaSWHJwvR8B+U4S1Kg0/EAQySr0iKSVWs6aHb/WQ9ZF2PjebQCNfD+J7Aj6Y4LvX26JVARpadnT5PMbLaRjkwkbf6ZZYKmgbE2z5KUk2xc+eofBdwWJdsncFNd+rKJ82VUcJIzZ+fw8RAPbMbu7CXW0ZHwqK8ptcgacL+qdKlGj2hZ6AC8EzKgv5Qfq8zQOahX03z9yckFqKzD8TtNoMRVA4Jz7oDm42IY+yzrUJzcGcc8vUH/ze1+3X4DkaDl3U+MW2iaIHoPnz0zOw6d3dOgERlGW/lqr24JBmjj+ErceMzHHcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwV1G6bFEuOoq2wzJSRUwdpZSwYrR5Hg3k2a1LOfCY0=;
 b=Ezpy2rH48zme3gPt7PDN4tMqELCi3X0qDP0ByAPmJAvHX7SekYCMYjWrlwDaWA737VWZeZ5yyeQMVVILZ3n7QP42MjfBzGSjJ1Fh70tFUBOKk78qcUcZWIRTtG3BzC5BUek7Dfh9bNfeV6dfp7mjwYDqTQ2nprjZTfrRbB1BQyo=
Received: from BN0PR04CA0182.namprd04.prod.outlook.com (2603:10b6:408:e9::7)
 by DM6PR12MB4369.namprd12.prod.outlook.com (2603:10b6:5:2a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 19:55:42 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::dd) by BN0PR04CA0182.outlook.office365.com
 (2603:10b6:408:e9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 19:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 19:55:42 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 14:55:38 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: ps: fix for irq handler return status
Date: Thu, 1 May 2025 01:24:43 +0530
Message-ID: <20250430195517.3065308-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM6PR12MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a396ab0-3c2c-429b-99c5-08dd8820fd31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GdCX7jnqrVeciRZugycF85TFziPtqsczJaSa3LZEdraCEN11/ou/n6nEbOmw?=
 =?us-ascii?Q?0w4XsIXYOIE2N6ch9CDsbafXXMZ2VhjwKyBQPjL8mcebTbqux8zfkwT52H5I?=
 =?us-ascii?Q?yetE5ejKQjj+2ziLtwRziMtT5s8WizhcMmjvPTEyGT1Pex8UWrVtRuGjvEZk?=
 =?us-ascii?Q?znFGFj4CscGqjCj6j42YPvwiphIHKrXEstZ/YfLGGsVdeqtV696iGgrixn2r?=
 =?us-ascii?Q?mUcQhdc8mMFDB8MsOoUIro65E0Jm9Fgar8eyqh80G2ceZhomA2ndCGQGZGQ7?=
 =?us-ascii?Q?I030HPqB7i5vP2P62sKk2fXarjE1RkrdRXkwDgZLGDtJWpkGKWVsl5ahoWhW?=
 =?us-ascii?Q?9UYwhgo4Er/MgvkVKVTlWvK5upRWMl/VrPZlK1n+P2kaqJO/4aQcqXVMFtt/?=
 =?us-ascii?Q?lqiTNWRzag3P+fnxms8D9Q24svEOie2HfwofsNtAQ75B8BPM8er2iG3AK8Gc?=
 =?us-ascii?Q?iXiSVcIlltBMgIGDuQIQI3kgStJAIfc4Azny+p2irzrzDlrFk4CTxW2gEi4r?=
 =?us-ascii?Q?qYNgDP6l8nOpE9mgOzt3yosebAO65Do8BANPV7cvWyqNy3y1GkATygEUpBkk?=
 =?us-ascii?Q?ryRIOJKD6ASFCHmwirIyCtNK9QVjl75b3kea0n9IhCwnKPMOm6dbH135AJ4d?=
 =?us-ascii?Q?e4CWnmgDgwUf9puK0QZILQuPZT3lkTV2ZK2Vbz0FiKue6diu934Zkpvk1fiG?=
 =?us-ascii?Q?fdsyE6r4oXh1wxEu5CluFZvX3wSOrzERPQF5e7deCMWf+UZEYmcqiuTZhX4D?=
 =?us-ascii?Q?DCmoa/xbjtdwXfkW+gP+cmpSOlfWqUrbBTqEvWitzbBahYkhjYuA7xCLZ4kE?=
 =?us-ascii?Q?ZFoBBY6t+gCWVOeUXnL6GnMZ1dc+5Au0/CPVGffu8jXfHg20S8XEJ8y7S8ZP?=
 =?us-ascii?Q?BBGJfY5twPcCONfl616JVcMJNoVOwcg/zj6OX4W7xbwr0PHgM5cWf0lJRK7X?=
 =?us-ascii?Q?qgu/FdEPldiutMDEXygtmsyIVunqU0osPCWCzBOcqJVHOgVhtpjIVXmp7Pg/?=
 =?us-ascii?Q?UpfPBAWOkEyS+jDf0q1j56+nCSrv7SehnZjmwOk68Rre49w4qS86egswIFMv?=
 =?us-ascii?Q?F9m14Vj4b2+oMWwiFxxtXv5alK2Bhxus5gk+VUxVg0mgPNmU3MrnBBxjUA3p?=
 =?us-ascii?Q?/Xhvk1+im5ZCAOsMIlwWBPFg1TvDk7DxOoEyxuxhp/ihmLe4WSlWeMjptfpK?=
 =?us-ascii?Q?LlyTft6BcMjVBn1AP1VsEZWzreHGmmIHI6nOxjwg4MIPl3OgxXE5nkG/jxW7?=
 =?us-ascii?Q?gXE8O8Ih/Kw6/gFHZWpsR4ewtABW+XDq9aOyQRfvBvWZq3aacT57VOoiqkoV?=
 =?us-ascii?Q?uWOTjUESN8olXVFxZHX3QcfY+d6UHgFrGQjBUAfJGofsP4qXHeH0bOVp31vn?=
 =?us-ascii?Q?GCcafBObRR4QuHrh2y3vGttBWVac3h1Vm4jjxG4b3Zz4RgGBV6BxWOpnVTS4?=
 =?us-ascii?Q?n0KhtbFSjZOpcMPNyMysR87yxgzgfmK/xYVgWrdYXznnNl+lKdY/402Ms2F8?=
 =?us-ascii?Q?w6ndHs7uyqpWfRtHPPM+HsL/ydKjlcLLHwtH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 19:55:42.4268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a396ab0-3c2c-429b-99c5-08dd8820fd31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4369

If any Soundwire manager interrupt is reported, and wake interrupt
is not reported, in this scenario irq_flag will be set to zero,
which results in interrupt handler return status as IRQ_NONE.

Add new irq flag 'wake_irq_flag' check for SoundWire wake interrupt
handling to fix incorrect irq handling return status.

Fixes: 3898b189079c8 ("ASoC: amd: ps: add soundwire wake interrupt handling")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 8e57f31ef7f7..7936b3173632 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -193,6 +193,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 	struct amd_sdw_manager *amd_manager;
 	u32 ext_intr_stat, ext_intr_stat1;
 	u16 irq_flag = 0;
+	u16 wake_irq_flag = 0;
 	u16 sdw_dma_irq_flag = 0;
 
 	adata = dev_id;
@@ -231,7 +232,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 	}
 
 	if (adata->acp_rev >= ACP70_PCI_REV)
-		irq_flag = check_and_handle_acp70_sdw_wake_irq(adata);
+		wake_irq_flag = check_and_handle_acp70_sdw_wake_irq(adata);
 
 	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
 		ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
@@ -245,7 +246,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 	if (sdw_dma_irq_flag)
 		return IRQ_WAKE_THREAD;
 
-	if (irq_flag)
+	if (irq_flag | wake_irq_flag)
 		return IRQ_HANDLED;
 	else
 		return IRQ_NONE;
-- 
2.45.2

