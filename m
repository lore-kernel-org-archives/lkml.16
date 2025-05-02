Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F1259C9D;
	Fri,  2 May 2025 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200745; cv=fail; b=skreM7mbpXVa2fdKUH9g8FRwVSoifODYF2IO1Z65JAzC9v+kOKao2TTf0aUY1WiUF7ljxvmcEh9Hamt9BNZAqXX0xUT1V7Eng2TObtZ+66G9KzUUA6WuaeW5fY1ydqO5qozn41Csohm4ZwttzYALDhQ/hYr7gMN8tA+AMjgkONE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200745; c=relaxed/simple;
	bh=rp7ZHCMveTWMMIZyQW9pt3zs05lP1DaqCOLYiilJN14=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSYenVtSFqZ1RkOZZtHWJk0ILiyUoUnl9m0QOf922UogDq3J0Ul+H+wQyCNzU48U11F+dq8xtrsYqNCkw4NWsZzc3O9857HjVEWxSEljExKKgkUVHUmGe2PFqGuV7f2vF+N+GdvBR972mcaMwxQ0QAXw7d4XvJYaDN+Ye8y5g+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fzP+hc0U; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fzP+hc0U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiUFt/dl4UvQdZjHB2Rq16IZNsuo8GGKpchy39Am8ivhMW6v2OMLeoCQ6XM7xKKo9MtjGRa0RSMtGl/PnVBS2tzk+6ck2VsJmxTKC0BZE/pX1SrFAFqz26KxkD6GQEvNwQHV/VbS7EhOJDZNbl9B+wGe26GcmY37hBcXoyQcP+KW3SjRQ3EDW8pbJsuXplnY3Iz7CKOaaRCBS6jesCXGCEdKyXBsLPtMz9hKpWeHF0c1wbLflkwh13BbGpaw7eE7NgtLdIIa/bEWyd7pc7y9WDIq0sYIjsBuhLSoQl8FFPcFmbPuRMYWpGKqLdqTn4dsNNVH0uyligaFeMIBqFiMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyANvGH63FWM5GoJMflml/Yv7F+Ays9Qk5bsDmC9bi4=;
 b=RApZqKn4citfh399D5TV9A4HnEc3ztmx4N3K/NaaNmq2IuxGEMUNcYSdjp+b/gagrFCxRq9bx6JAmXkn8XiRoolaz81FYLjmS4JCB5iWWzlRVjqW696DwCwE13nuVQsmemOjey4nGhzp6MCjhQwkstzbb4xfIgZpsTtk5w0DaCsqxrdx2ALL37c7/e9CfTRedCfRD8TazZe3GTeqvUjITAQ3mkR4mcDB8YzlUeG4Gx/9RSI4OQjKWULw46Sfz6pVaR8H6JfQbQ3lyjTHCORg9p7DQl48ygd41AzSxAmHOJTFBBIhh5yrpuG2iDuFCgbsPYu10phcOS3EYugFZx4b/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyANvGH63FWM5GoJMflml/Yv7F+Ays9Qk5bsDmC9bi4=;
 b=fzP+hc0UVM/lh76RLw2/LKTctLiS/vmaLUW9AvLqq311g1VkCGsXmHISEVMD5AQMfleST/0+IgzEf0m/egYkt57B26RJvd2iWbnWNIUzpbgZm+JZoMrb9PQWWOS4PPeND3RZ/N51T9GoYwEOL3S1cT1F5lXi6KJhBeyTN15pooA=
Received: from CY5P221CA0120.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::9) by
 SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 15:45:39 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:1f:cafe::af) by CY5P221CA0120.outlook.office365.com
 (2603:10b6:930:1f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.25 via Frontend Transport; Fri,
 2 May 2025 15:45:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:45:39 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:45:33 -0500
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
	<cristian.ciocaltea@collabora.com>, Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH 3/9] ASoC: SOF: amd: add ACP7.1 platform support
Date: Fri, 2 May 2025 21:12:42 +0530
Message-ID: <20250502154445.3008598-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SN7PR12MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5c47ca-ee0c-4c46-18f6-08dd89906379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tE4x+NpxNR/asRIx67wCV5/eM6sNcdp9hSAEj5ZKD/X+OWv7alLC6yA1qmnF?=
 =?us-ascii?Q?niQn3oF7vSZ490Xx+Cu/H+gJuUqXPd9wVJjBkwF8Pt81tAhdJKlnEhFToCt7?=
 =?us-ascii?Q?zApBpLIxnK5O+F7nYoZPhzLN6cLUO6WBd55e8PTFtjxiI3XLglNl/SQo/iG3?=
 =?us-ascii?Q?Uh/MpD0GdKfIllbkPcHMqkIfiY09xCfKkAlvNNGQgDol8DzQQEebsbIZLJDN?=
 =?us-ascii?Q?IeC6/wKBuFvMRi51t0yusVsOWpyqAD0DS2Yn3JZtgJ/8a67c0OVU/QySlqtN?=
 =?us-ascii?Q?TUHwxSSmY/zx/2R3pWGUeBjPg0xqd+oErXmZJ42fKdk8q1XcasAhEgg4hv1w?=
 =?us-ascii?Q?w+XbWASmTKtw8a1LcgpzyHZg0paLDfD+v0AT4YgplFNplRFBd5ZVbrUqdDn8?=
 =?us-ascii?Q?amYJOynfrBwpFWe1JJXQFmAYC8rmcXoizXrKTzpFttaZWqHL6PtGYn7lURlL?=
 =?us-ascii?Q?ZRRMozkH9LJtVNXPK7ztB7UyKcpDpJn40dqEFcVKaII46iUKvGhMUnJFHTW2?=
 =?us-ascii?Q?Tyh1LBsTUKeqOH0YXhtGjXBUHGLIydpNX1BKKpvG2xKIh7GvRGlfdlbeEWwe?=
 =?us-ascii?Q?5NAmJPrtptWgYuHFu2+JPcl5hNZYHDA7H8NkvFpj9Jtanv2mhFst0QB7y6Wl?=
 =?us-ascii?Q?/p8g0CnYflHgg8dTLGSMor8RcDlkAdD7QMZTPwhszkfPvXUTYcqcOgZMCHgv?=
 =?us-ascii?Q?TcFxLBC2O+hdEDYGqsRHz2CPfEEV5EwyLlEY16wb419L7MXNNaXSkusLM/LV?=
 =?us-ascii?Q?jSs/2QfzTqzXLR+XuG9nLFoIZSqptTnHdFaKcVys51F8H5Y2ts8eZFhVr785?=
 =?us-ascii?Q?Kj/QrN3Y3oUH6+Ib4wrh5uZ1Mcl6/8A0L0o+cb3qkE7EtHQs0P89ghMHdK9s?=
 =?us-ascii?Q?0sHvmNYCHjiQvwYx4ZNpqHZv/zMd9z5IoDwWpl0602z945B/XsLECRLk8ufZ?=
 =?us-ascii?Q?Gup5e6l34Zx4p2X+ODDz3giw4OUFysIjH3V+8Va6vfM0k5IesOhfWGt9hYAQ?=
 =?us-ascii?Q?Y2IpIUNeYlM6FBxNX3VZXWuO253p3dq871UZifZ7mqVKXz/RvDQf+ee2qeWO?=
 =?us-ascii?Q?JEzGK+CjyOnIIb2ddPYABO4OYjfRS1nye5gpll1tMFB4GnvhXY7zOz65v+MH?=
 =?us-ascii?Q?73y2ELpXH11LmoUqA9F56r/W7DG15kcwsk8aMvDNGwT1xEY6DNMfTZveRZNb?=
 =?us-ascii?Q?8Ag7Z+xrQClU/KzHg/qXWJ7i6WL5/xJmiTLdniwrhT2SdfM7bP/KR39VnV/R?=
 =?us-ascii?Q?gF6uqKVHm1ujMApF9eLm9THjOx4yTnnDOvsrMq4Af7jMfsAt7ePfKJYrgsJk?=
 =?us-ascii?Q?00B6WQBBHEvCazVla4zDoQrns+MfDlJZ2p2e4apqfBXSyfIWLs7BsX4T4HGs?=
 =?us-ascii?Q?FtgNhlbZtpaX5ePn/QiCsfDrXqb4foV8ychD4apUqBQ81UIUqCwZskekmna5?=
 =?us-ascii?Q?YoAkFvSLscSLwGdojDU0cxhX+upw2wijhbBPgQdor08HQdvgYAhI6ZVo6Je9?=
 =?us-ascii?Q?WHQ9jktTJ/avNFbbe+elF5BTCqf9ZB/uJjBM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:45:39.2204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5c47ca-ee0c-4c46-18f6-08dd89906379
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980

Add SOF support for ACP7.1 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/Kconfig     |  6 +++---
 sound/soc/sof/amd/acp.c       | 10 +++++++++-
 sound/soc/sof/amd/acp.h       |  1 +
 sound/soc/sof/amd/pci-acp70.c |  7 ++++++-
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 3ea82fa72e35..984132f32a21 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -94,13 +94,13 @@ config SND_SOC_SOF_AMD_ACP63
 	  If unsure select "N".
 
 config SND_SOC_SOF_AMD_ACP70
-	tristate "SOF support for ACP7.0 platform"
+	tristate "SOF support for ACP7.0/ACP7.1 platforms"
 	depends on SND_SOC_SOF_PCI
 	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on
-	  AMD ACP7.0 version based platforms.
-	  Say Y if you want to enable SOF on ACP7.0 based platform.
+	  AMD ACP7.0/ACP7.1 version based platforms.
+	  Say Y if you want to enable SOF on ACP7.0/ACP7.1 based platforms.
 
 endif
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 30c03a221513..ead31aee5e6f 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -58,6 +58,7 @@ static void init_dma_descriptor(struct acp_dev_data *adata)
 
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		acp_dma_desc_base_addr = ACP70_DMA_DESC_BASE_ADDR;
 		acp_dma_desc_max_num_dscr = ACP70_DMA_DESC_MAX_NUM_DSCR;
 		break;
@@ -97,6 +98,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 
 	switch (acp_data->pci_rev) {
 	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		acp_dma_cntl_0 = ACP70_DMA_CNTL_0;
 		acp_dma_ch_rst_sts = ACP70_DMA_CH_RST_STS;
 		acp_dma_dscr_err_sts_0 = ACP70_DMA_ERR_STS_0;
@@ -336,6 +338,7 @@ int acp_dma_status(struct acp_dev_data *adata, unsigned char ch)
 
 	switch (adata->pci_rev) {
 	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		acp_dma_ch_sts = ACP70_DMA_CH_STS;
 		break;
 	default:
@@ -486,6 +489,7 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 		acp_pgfsm_cntl_mask = ACP6X_PGFSM_CNTL_POWER_ON_MASK;
 		break;
 	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		acp_pgfsm_status_mask = ACP70_PGFSM_STATUS_MASK;
 		acp_pgfsm_cntl_mask = ACP70_PGFSM_CNTL_POWER_ON_MASK;
 		break;
@@ -616,8 +620,12 @@ int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 		dev_err(sdev->dev, "ACP Reset failed\n");
 		return ret;
 	}
-	if (acp_data->pci_rev == ACP70_PCI_ID)
+	switch (acp_data->pci_rev) {
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		enable = true;
+		break;
+	}
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_CONTROL, enable);
 
 	return 0;
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index d084db34eed8..86acd43f707e 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -74,6 +74,7 @@
 #define ACP_RMB_PCI_ID				0x6F
 #define ACP63_PCI_ID				0x63
 #define ACP70_PCI_ID				0x70
+#define ACP71_PCI_ID				0x71
 
 #define HOST_BRIDGE_CZN				0x1630
 #define HOST_BRIDGE_VGH				0x1645
diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
index 9108f1139ff2..8816c323d69e 100644
--- a/sound/soc/sof/amd/pci-acp70.c
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -71,8 +71,13 @@ static int acp70_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_
 {
 	unsigned int flag;
 
-	if (pci->revision != ACP70_PCI_ID)
+	switch (pci->revision) {
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
+			break;
+	default:
 		return -ENODEV;
+	}
 
 	flag = snd_amd_acp_find_config(pci);
 	if (flag != FLAG_AMD_SOF && flag != FLAG_AMD_SOF_ONLY_DMIC)
-- 
2.45.2

