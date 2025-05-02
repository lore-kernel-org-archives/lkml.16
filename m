Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A9259CA8;
	Fri,  2 May 2025 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200780; cv=fail; b=NJ1Ehsei3IvG3w+r0tqoXsDUMqNIns6DcUgXQf6dswU7JHTQsTDfhaE42Sl5uQBGU/qINaxKBjEvOVS5KZtdOTRsZPBvQNpA/YoLUz3vF9FnHtWKT6L1ffRemYjsCIzsdwIjVUOI4mJJVLPOvvofg1OiW6bIrAgEtudO2LwiGWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200780; c=relaxed/simple;
	bh=T/IQFyroPLfeHbXYNTjfo3K5pvi3/huyIs4hF/sVo4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ftysUUfgmPAgnIUpbj/knvdWVHo+VQdgqerBez/5ebrKdqp8JtmFDDWlKzuvBfewk6zwEdxtwZSk+QGwpDZ5bb7BfQsIRUsoDNMKuFyogEHrc7DCIlFggh/GeFRA3Uny+XmojNMfdifJKkYidvVuIjJwAjv54HyIyOXNFniUruE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HWt+pENh; arc=fail smtp.client-ip=40.107.94.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HWt+pENh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPGkXAAwEgHN3Mtv3eWK0rRzQAc/FiPfsLM3bXtlRHIhhUu1mztNnPVbc6TOmS2clpEsklX+wlnRO2NAy3SiJT7ck5wGb+8j8EnlfkXCxkBHDYU8q3lN60HFsU9xsMO7pEJO+1ueyBcbNdWDyLsh06FD9cbEonA8R7uyEoSC/dT2PMgx40YTU47ps6upPpIOVuXGOLZRS4pUqV9VNXBgmdJyyiyFoveS0zEaiI32f7aICgG2jkYerjOKTgoculw1jiSotkTlqIctJXndYjRyqrJfn6/UQb8iVn0xt5Kdjkh7084btZdP8od9GapkPayGpEDvcDSRSugAo+H/oW9KbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXklqTExAVT1ExOnaKWNxY6OTLlP/g3hkhx+OUlHE+M=;
 b=U8wzIDf3Fxtcsta8SS/lneQa9hxTEYdGQHmsh0SbMlcPt+3fEZU7LwdXNqaRFj55sSDxDzZmZL3G2KmdNKPdqkEosD4OckrFkpEENupyLUtePluOAz3KknoeiNtUxnPlwTkiZn4N70FxrtZ8IdTdmXlg1b9fJZeznhhvq8a7WHDsNPj5h8vbPjiml/hY/X6pUbRSn50c0UxY5FWWvuwtCOLmwh7Gmz7h8xu5MweWLFdgJkrj0RkT4U3rv6AMw/+y+KJT25FFsQ+CHhtTrqQZABkz5dQIiBU5TT5xgZ49JTWtnBi8vgnMcRIBFcBfX4wgTOPlz98rXlxHf9NsrFmxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXklqTExAVT1ExOnaKWNxY6OTLlP/g3hkhx+OUlHE+M=;
 b=HWt+pENhBdNqRM+r/Wt2jigaaa4Wx3AQkqF/9Tj4FIPmWMjjXVVXOW+OeOVbVojvv8rhyusfFxzItnKjewBzPPTR5UgTah/35t84qpQljtvsVckqYxQqvBOiZQBgMISM8l2rq6seBf4p0YxCmi+jITS4WWZEbFMP2ohNx+bW/IM=
Received: from SJ0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:a03:331::12)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 15:46:13 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::8e) by SJ0PR03CA0067.outlook.office365.com
 (2603:10b6:a03:331::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Fri,
 2 May 2025 15:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:46:12 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:46:06 -0500
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
	<cristian.ciocaltea@collabora.com>, Peter Zijlstra <peterz@infradead.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 6/9] ASoC: SOF: amd: refactor acp reset sequence
Date: Fri, 2 May 2025 21:12:45 +0530
Message-ID: <20250502154445.3008598-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd304e8-40b3-498d-c0d8-08dd89907791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KgTARiDdpjsGLeoUJ0cP4qCLwTNdd22EZDde3Nkku9eZz6MSGl2mO96eFL+S?=
 =?us-ascii?Q?JHm+l+/5x0pXHT/qVYJVHC6O8Otfbd7bJFMXdsvshXF6K6GTyV5H4RKM/9UZ?=
 =?us-ascii?Q?LH6BIyXI65jyTa8SVrFOTbies7Kxrvq967lQlPZZgIy4ha3L/28elzevrNh4?=
 =?us-ascii?Q?HIGQtmGChrkYANfvWYbA9XYd08zJuQIHW7vodoiVyViPYclEp65KmHtwf7Z6?=
 =?us-ascii?Q?1Geui28F36mIfpXdRH3V7iXDtKu2EyJt6PkAqVvD2HUCY7ZSiv7PqwLjTDM4?=
 =?us-ascii?Q?XTO1ExV05KYmBeqa4qJWTICAIIXALiunltKirUA4255rLk8hMz7j4JXStASh?=
 =?us-ascii?Q?7w4zxOj3V3Zcw5S8DSN2T1L+GLkxnuNy1ip7f9AePSFjRhcU/g+XrT0UO8Sj?=
 =?us-ascii?Q?rCMSsx25/aZoOP3EanJoUdjokvLS16dGlbOz1lER+huDwskjyhBJWV4D8RVh?=
 =?us-ascii?Q?tpELuOmaC/K3iQv8mT+N/kqpZm+AqADC9qeIv3Pot7KmRtYYCKnHd6+VYprL?=
 =?us-ascii?Q?8zz+xdajxCY3mbJLTUkuSaeaImaJAO5bgwOiZACCMfX9LDuNrUaFoOe601WK?=
 =?us-ascii?Q?C9RLvLXue+etqttDEyegrjm4ow/zUWNqdUD0MOQW0V6IxUaSJUTGhq7iEwtJ?=
 =?us-ascii?Q?KTFHdoa2Ak4RLreH8Zefvk58OnHj+2zA1DHXbS0i2R9MW5P20kweiVvQ6pV0?=
 =?us-ascii?Q?1XGj5uqml7PiKb7xhZM+quGgFGTuyysa+8bjPd1Qmlm6BFB5921E2Oprkg1l?=
 =?us-ascii?Q?1k7D4SX4Q23kJDDDDA53e30jySwXmeg1Kugq4/RcHduRHxoiOD+qQJYDkuOl?=
 =?us-ascii?Q?dicnX/KqXAeBXZZwheiUt5XeutKL8q4g6lHiJFYyfkuZKIMGNcpmHCsDiI83?=
 =?us-ascii?Q?cpayTnxSHOmY9Pf4wc/YhUJWKLzXMkHEjLqi+A+iAuwEguaiwgIkaTPjsqpz?=
 =?us-ascii?Q?00iUs+cWhZy6QcvCdDJOXs1y++7sziAvcjZ9cUgroaMAbX5z6ZrcXaf8MQuc?=
 =?us-ascii?Q?Qp39/jIc93aRwEU8LgIXN3vRw1icbQR2XOGg6kiI+TZxbG+ZKQj38YpuJk8+?=
 =?us-ascii?Q?AgsnXbk1m1e8WufB+V0PttvATph/FMs0P6001+uSGV+8lP4/xrz/jporgOEy?=
 =?us-ascii?Q?aTdfMKlb7kDNeRijG72/8EpwWKQPutqhT1Srw9S22kgMGKCSU4Kt98d6HJDA?=
 =?us-ascii?Q?fmSI28LCCfLGF0BK3preSUIsdHcVpyv/PGCzLebVbjjngx0OdNfRKzojttxl?=
 =?us-ascii?Q?3bb3YnbT6s4MPwGMkxWQ3L/kE/YFj7plL4eNPOYtOsUtPsE7ndiCsgY4lBIP?=
 =?us-ascii?Q?wXWIBRB01+6vBiUBr+8SkISrib6VHvvA8Ah1DX9HkcP/BtO9IhMsxaKdMhmz?=
 =?us-ascii?Q?L2Pm12xYx3tHFdF9Q8N85NkwmI9eYAon87ajS8kI1ij0GmHa1DIpo254YUgv?=
 =?us-ascii?Q?y315NaMoFbwp+K1q5acc5EADYODpUNDvYWsYYQEFMp/3YfUTznbvcB6y+x1/?=
 =?us-ascii?Q?hAHMyh1STN0PHIZUy+6YJMe05y2eLiNphkG0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:46:12.9478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd304e8-40b3-498d-c0d8-08dd89907791
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779

Below mentioned register sequence should be part of acp init
sequence.
1) Set ACP clock mux selection register to ACP_ACLK clock
source.
2) Enable ACP global interrupt enable register
3) Enable ACP error interrupt mask.
ACP reset sequence should contain code related to asserting
acp soft reset and release the soft reset.
Move the rest of the registers programming to acp init sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 615ed7ff3846..2ad5fbf43c8a 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -511,7 +511,6 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 
 static int acp_reset(struct snd_sof_dev *sdev)
 {
-	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int val;
 	int ret;
 
@@ -532,14 +531,6 @@ static int acp_reset(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		dev_err(sdev->dev, "timeout in releasing reset\n");
 
-	if (desc->acp_clkmux_sel)
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_clkmux_sel, ACP_CLOCK_ACLK);
-
-	if (desc->ext_intr_enb)
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_enb, 0x01);
-
-	if (desc->ext_intr_cntl)
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_cntl, ACP_ERROR_IRQ_MASK);
 	return ret;
 }
 
@@ -570,6 +561,7 @@ static int acp_dsp_reset(struct snd_sof_dev *sdev)
 
 static int acp_init(struct snd_sof_dev *sdev)
 {
+	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	struct acp_dev_data *acp_data;
 	int ret;
 
@@ -586,6 +578,16 @@ static int acp_init(struct snd_sof_dev *sdev)
 	ret = acp_reset(sdev);
 	if (ret)
 		return ret;
+
+	if (desc->acp_clkmux_sel)
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_clkmux_sel, ACP_CLOCK_ACLK);
+
+	if (desc->ext_intr_enb)
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_enb, 0x01);
+
+	if (desc->ext_intr_cntl)
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_cntl, ACP_ERROR_IRQ_MASK);
+
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
-- 
2.45.2

