Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F21235BFE;
	Fri,  7 Feb 2025 06:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909770; cv=fail; b=j6AXeqdDAf5Y8YUqViBO30xDLnMgClRKzDX0KFMIgdAx7w20+mJ0nnVDCu2dU/FJbpcCVpYVP1Gk9f4DKTcRt1A4YkmLrnuZoP0CcwE+TGqFbn9w5jxuugLy4eg6Ch/vyD/adU9IEPSNS5D6yor1/SBK03Vq9J5+FgcEidBsH1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909770; c=relaxed/simple;
	bh=niT1sOYMxrrkYHJDp3mh+xhqYQ0/cfug//Qg8mCmQzs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GCCeK/dvbXgXGlRcgeDHV9v+u0R1egR4C59MDfeHNDcPRFxjM/fI03STu/aly7Dey83J+4ohlNuJlX34Bk36hPI2VDf5pyfa/VWs03dsDHgtivZNTluiKBcUFXGzNwJWKAZ87RQQYJwHNYZA8qasHFhdxaOOtGqDSz4TZ7UqawM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rn7RJRXY; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rn7RJRXY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flM4lQWABYKoJIEbbHHjxNhTK6cg73b01Vch2l/aKPUF2Q2yuKtgTU7BZ5gs6YnzxybjGWnI8G/pNHjjO8JlM2MJGDGqA4sj9kYZBQIUBgdoZ6qw8x1ubmS/QBhht4qT19vJOymo/sBKZM3f/Y8Qy0NdYyDlE8TcvZjv6Dy/XmYDNRdRS8i+mhjcR+fulA9WJIE/MpOspmaNX4XI986ZHPTPa6zFclsW0B2f+CDiQMYaZIxAYyv75IO5F7B8xVS6ea5QwdSy9ddhyi366M0GolqbAqXxKVOSWTjO4mLLPVMC0nnkO6PIoopTyJp7gY+wlLitKBdBbrovZDjEJv0YSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=becwH0gojfQkVgOzX9CKvUeF4J3+9v6jiIkj9qa7xh4=;
 b=Bz+R2XXQt+dvFhiRSbNVX2U2aGsg53zoNYKKkJRvUN3VdhvegCPf7+mHrwrR9lLLmbWu7z5ojzBEgVTerUdmG441eGS5dxno2iwSfWs+eTlbE7Bu7y4gYiqI9XpXf2WuTbtTbCMmVyK1kzOQ2W2iLFp0LI1h2stShNoyWLkA6OYC+nG7M9d7fMpJxGDneuzyBaVAnxYOUK0GrvXzE9Fqm+zwh3q3VE57P20wgRRMUj1r+D1//ePShhxgC3A4PFzRhSHvEyvwnXh5GO3O96iZhdcvBcGZOU56vFMMK9OiQioImfY4EBLU50gzOL8rGzVOcbm3pm/7aDzeVPhZTJiXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=becwH0gojfQkVgOzX9CKvUeF4J3+9v6jiIkj9qa7xh4=;
 b=Rn7RJRXYNv50qSFTlrtSRsBxBrqwQ+hsF/ZHezXeuFyy9VsGCK2kFLDlTCG+zyfaG+YGBrIN3LDJk32ZwqlUGkzJerh0ZNQAtjmQ4qVpkU4ZFzPbRGfot92CV0JGwQo9Vn0iuh5sIudJkGaEkO1KQ9N8h8+Py8RcuHH3BiPUB5Q=
Received: from PH7P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::14)
 by PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:29:25 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:338:cafe::ab) by PH7P223CA0022.outlook.office365.com
 (2603:10b6:510:338::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:29:24 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:18 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 12/25] ASoC: amd: ps: add pci driver hw_ops for ACP7.0 & ACP7.1 variants
Date: Fri, 7 Feb 2025 11:58:06 +0530
Message-ID: <20250207062819.1527184-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|PH7PR12MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0e455e-d938-4ace-afce-08dd4740c3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?chYsCTlkd0414xCD9frFmstY/ODl0U59NvWjh/GH8VY+z+y129Z54kgfkPSd?=
 =?us-ascii?Q?FwF9ApYPHhKqB/1zONdFodIMygIVkdCn+ofWxGJaOF7dAW0zVVJB8X3PfWIK?=
 =?us-ascii?Q?VVN7JWwagLpCjoJjMddukwPsEps47vs1RuPe0rsqgDWX60SqlgVDCcWfMQn6?=
 =?us-ascii?Q?CW8nMUIRHfhIN2ZOCfHpdMK0+j9thjVDyFb+jmtbf1cYdBW4haodvbWbt3Ce?=
 =?us-ascii?Q?Gk7+8/tsv03cRibs04G6QUQRISdJN+8w5zv8HsRSVMJSJE5PfqWSqgh1XGBE?=
 =?us-ascii?Q?HawFqQbmaL7Y9Xej82FGGsgLd6nylCvJ7Ox/peVvkUCt2yUzqMar/5Rts55z?=
 =?us-ascii?Q?UEz7W103s4wYuRfPz7FhHCw6HaSHQeqBqJbf44nLgP21VMDfOqUKakygtMEl?=
 =?us-ascii?Q?luMfKnhqX8tEsS/t8cGaGzOxtZwTxjjd4LxjzBcNTNaTMm6F4esR688l/S6V?=
 =?us-ascii?Q?Q3DZMaivOYKQB5m8BUyrnbdytZ+jKSpefXmn5MM4ckpNLAYUW4LT01HA2Mqd?=
 =?us-ascii?Q?3SJpdyMeiFS9mOO6iu7TLSAn4cezDWBQQYIRn0oVy35BEtEuXON0wgvdlJTh?=
 =?us-ascii?Q?neKF8Edq3EZ/pmZFV8nHNSBf0Ah1aKijl3maXQRDdczbKW2pTk//sPgOYFrP?=
 =?us-ascii?Q?9QDSI0I3Sd+44823R6lKjyWBz8zy9wLjOXlyLeGEUWDcKOK7juR1TmpSwXsl?=
 =?us-ascii?Q?IwZNmP6nQIV1sd9HuUh36V8UkMToZRnd3sM6TDckQMp8gBp6IynoS7tMfm8f?=
 =?us-ascii?Q?Vlpgp5m4g0KwgSXi6VhLlQudBpQJeXmD53V8xxVLRNWNNd2H3oBTxJXCuXDb?=
 =?us-ascii?Q?ocpXkQQ25eFKCmA/5Hn5O6voedCMb2gbFpTjbpa7WL4KVXPVSBCu02Fxfrhi?=
 =?us-ascii?Q?KYi3LWVnzGrSj5SXG4kKmMMa6MZ0R0gzuRn8nAaVgGn7vhqvS1WG85f9tFM9?=
 =?us-ascii?Q?P2eYsm6INW63cciujS+A9T9gbfJ9+oMsJ7hBQzVMk9xYliHXkGkxZs0IBMOA?=
 =?us-ascii?Q?lQaDsUSWPWdg58zl0xMpx2hK4Eo0XMJOIcvGgNfjLdeEI5aP1PM6aSSliV/n?=
 =?us-ascii?Q?9id+0mgBeRe+i9igcHTeeg5+oi06BXNrA/nVhKub9Vds1NDRuFWzbAixOe6R?=
 =?us-ascii?Q?ASwpcULSXcy2spNRYYJNiC1DN9t7kvWjLPIhtHHfNOpAaoInU4mea7AF/JI7?=
 =?us-ascii?Q?aI0MykL7eHTRALlxIAwUwHLR+/h7vflw0sfLmEBSF0dfdrsg+mPMliIBIdrz?=
 =?us-ascii?Q?nMUadWANq4x85hLi8nX1se0h3Ee46CYfFujT3b+wm9/lDH/ma+AxuRpn/B7h?=
 =?us-ascii?Q?r921ZmYz1c0CaueP1yL6VH1nP7+wQV/ahFSuHtC7swa35GR0dqKrdgQCbYc4?=
 =?us-ascii?Q?YLIUwM6Dj/iEhvJ4VfjMMqKaBODfMg94lLHzkeDQO49sC+IQ1d4En8Duh3VL?=
 =?us-ascii?Q?MMnp7GUiPRYUHWpndEX+9wMf65Dy/snD1dMpXi7VX2jwfmO0CnqGwLb7BuoI?=
 =?us-ascii?Q?TNDpS1cj4eQ3lVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:24.1728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0e455e-d938-4ace-afce-08dd4740c3b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223

Add below ACP pci driver hw_ops for ACP7.0 & ACP7.1 variants.
- acp_init()
- acp_deinit()
- acp_get_config()

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h     |  14 ++++
 sound/soc/amd/ps/pci-ps.c    |  10 ++-
 sound/soc/amd/ps/ps-common.c | 138 +++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 098597d92bf9..f65f242211e9 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -12,6 +12,8 @@
 #define ACP63_REG_START		0x1240000
 #define ACP63_REG_END		0x125C000
 #define ACP63_PCI_REV		0x63
+#define ACP70_PCI_REV		0x70
+#define ACP71_PCI_REV		0x71
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
 #define ACP63_PGFSM_CNTL_POWER_ON_MASK	1
@@ -132,6 +134,12 @@
 
 #define ACP_HW_OPS(acp_data, cb)	((acp_data)->hw_ops->cb)
 
+#define ACP70_PGFSM_CNTL_POWER_ON_MASK		0x1F
+#define ACP70_PGFSM_CNTL_POWER_OFF_MASK		0
+#define ACP70_PGFSM_STATUS_MASK			0xFF
+#define ACP70_TIMEOUT				2000
+#define ACP70_SDW_HOST_WAKE_MASK	0x0C00000
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
@@ -149,6 +157,11 @@ enum acp_config {
 	ACP_CONFIG_13,
 	ACP_CONFIG_14,
 	ACP_CONFIG_15,
+	ACP_CONFIG_16,
+	ACP_CONFIG_17,
+	ACP_CONFIG_18,
+	ACP_CONFIG_19,
+	ACP_CONFIG_20,
 };
 
 enum amd_acp63_sdw0_channel {
@@ -293,6 +306,7 @@ struct acp63_dev_data {
 };
 
 void acp63_hw_init_ops(struct acp_hw_ops *hw_ops);
+void acp70_hw_init_ops(struct acp_hw_ops *hw_ops);
 
 static inline int acp_hw_init(struct acp63_dev_data *adata, struct device *dev)
 {
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 04b43b4128bc..8f73d2ce2197 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -438,6 +438,10 @@ static int acp_hw_init_ops(struct acp63_dev_data *adata, struct pci_dev *pci)
 	case ACP63_PCI_REV:
 		acp63_hw_init_ops(adata->hw_ops);
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		acp70_hw_init_ops(adata->hw_ops);
+		break;
 	default:
 		dev_err(&pci->dev, "ACP device not found\n");
 		return -ENODEV;
@@ -460,12 +464,14 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	if (flag)
 		return -ENODEV;
 
-	/* Pink Sardine device check */
+	/* ACP PCI revision id check for ACP6.3, ACP7.0 & ACP7.1 platforms */
 	switch (pci->revision) {
 	case ACP63_PCI_REV:
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
 		break;
 	default:
-		dev_dbg(&pci->dev, "acp63 pci device not found\n");
+		dev_dbg(&pci->dev, "acp63/acp70/acp71 pci device not found\n");
 		return -ENODEV;
 	}
 	if (pci_enable_device(pci)) {
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index 9098974b3608..a15284bde48d 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -246,3 +246,141 @@ void acp63_hw_init_ops(struct acp_hw_ops *hw_ops)
 	hw_ops->acp_suspend_runtime = snd_acp63_suspend;
 	hw_ops->acp_resume_runtime = snd_acp63_runtime_resume;
 }
+
+static int acp70_power_on(void __iomem *acp_base)
+{
+	u32 val = 0;
+
+	val = readl(acp_base + ACP_PGFSM_STATUS);
+
+	if (!val)
+		return 0;
+	if (val & ACP70_PGFSM_STATUS_MASK)
+		writel(ACP70_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
+
+	return readl_poll_timeout(acp_base + ACP_PGFSM_STATUS, val, !val, DELAY_US, ACP70_TIMEOUT);
+}
+
+static int acp70_reset(void __iomem *acp_base)
+{
+	u32 val;
+	int ret;
+
+	writel(1, acp_base + ACP_SOFT_RESET);
+
+	ret = readl_poll_timeout(acp_base + ACP_SOFT_RESET, val,
+				 val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK,
+				 DELAY_US, ACP70_TIMEOUT);
+	if (ret)
+		return ret;
+
+	writel(0, acp_base + ACP_SOFT_RESET);
+
+	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP70_TIMEOUT);
+}
+
+static void acp70_enable_sdw_host_wake_interrupts(void __iomem *acp_base)
+{
+	u32 ext_intr_cntl1;
+
+	ext_intr_cntl1 = readl(acp_base + ACP_EXTERNAL_INTR_CNTL1);
+	ext_intr_cntl1 |= ACP70_SDW_HOST_WAKE_MASK;
+	writel(ext_intr_cntl1, acp_base + ACP_EXTERNAL_INTR_CNTL1);
+}
+
+static void acp70_enable_interrupts(void __iomem *acp_base)
+{
+	u32 sdw0_wake_en, sdw1_wake_en;
+
+	writel(1, acp_base + ACP_EXTERNAL_INTR_ENB);
+	writel(ACP_ERROR_IRQ, acp_base + ACP_EXTERNAL_INTR_CNTL);
+	sdw0_wake_en = readl(acp_base + ACP_SW0_WAKE_EN);
+	sdw1_wake_en = readl(acp_base + ACP_SW1_WAKE_EN);
+	if (sdw0_wake_en || sdw1_wake_en)
+		acp70_enable_sdw_host_wake_interrupts(acp_base);
+}
+
+static void acp70_disable_interrupts(void __iomem *acp_base)
+{
+	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base + ACP_EXTERNAL_INTR_STAT);
+	writel(0, acp_base + ACP_EXTERNAL_INTR_CNTL);
+	writel(0, acp_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static int acp70_init(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	ret = acp70_power_on(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP power on failed\n");
+		return ret;
+	}
+	writel(0x01, acp_base + ACP_CONTROL);
+	ret = acp70_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	writel(0, acp_base + ACP_ZSC_DSP_CTRL);
+	acp70_enable_interrupts(acp_base);
+	writel(0x1, acp_base + ACP_PME_EN);
+	return 0;
+}
+
+static int acp70_deinit(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	acp70_disable_interrupts(acp_base);
+	ret = acp70_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	writel(0x01, acp_base + ACP_ZSC_DSP_CTRL);
+	return 0;
+}
+
+static void acp70_get_config(struct pci_dev *pci, struct acp63_dev_data *acp_data)
+{
+	u32 config;
+
+	config = readl(acp_data->acp63_base + ACP_PIN_CONFIG);
+	dev_dbg(&pci->dev, "ACP config value: %d\n", config);
+	switch (config) {
+	case ACP_CONFIG_4:
+	case ACP_CONFIG_5:
+	case ACP_CONFIG_10:
+	case ACP_CONFIG_11:
+	case ACP_CONFIG_20:
+		acp_data->is_pdm_config = true;
+		break;
+	case ACP_CONFIG_2:
+	case ACP_CONFIG_3:
+	case ACP_CONFIG_16:
+		acp_data->is_sdw_config = true;
+		break;
+	case ACP_CONFIG_6:
+	case ACP_CONFIG_7:
+	case ACP_CONFIG_12:
+	case ACP_CONFIG_8:
+	case ACP_CONFIG_13:
+	case ACP_CONFIG_14:
+	case ACP_CONFIG_17:
+	case ACP_CONFIG_18:
+	case ACP_CONFIG_19:
+		acp_data->is_pdm_config = true;
+		acp_data->is_sdw_config = true;
+		break;
+	default:
+		break;
+	}
+}
+
+void acp70_hw_init_ops(struct acp_hw_ops *hw_ops)
+{
+	hw_ops->acp_init = acp70_init;
+	hw_ops->acp_deinit = acp70_deinit;
+	hw_ops->acp_get_config = acp70_get_config;
+}
-- 
2.34.1

