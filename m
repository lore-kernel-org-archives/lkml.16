Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F108A2580DE;
	Fri,  2 May 2025 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200773; cv=fail; b=eilYFCASSGEfpwjn5Jy4VFNLfhKH+mhUpOGfqew9hJIkPjOUEOHyMVxHDqgFjXm0c+8W94CSzEs1DKqR2/tIb0Q5DwCgvrad7oBUR8jMUHQmGnm1vtAktCsUzzE3RJP3bejoFIMh5AUG/4h1j5u9sh6mq3EvYFxI7X7oKwrkIKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200773; c=relaxed/simple;
	bh=kfWPKZEDTqEVB6+vFU0KobyDzIcOPupwMaOKNt+EIRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ApJF/ePflcsgG/zZxqzhka2hKrKHA62FqlCFaN5wlmGb8BSemQGhRhjCJy86eZ5IZXD9sJEdI4SQavX+vNGx8j2fCF3zvmo87tMmicH3KpPX0bks6HRjKJQza25IxB/gi7c1yLLjzOzYkBhppfTdPCwgOfEP1WDq3uiQWZrLtc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kk8bcrQ3; arc=fail smtp.client-ip=40.107.100.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kk8bcrQ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVLppvZTUyI2KD+PQ+dBGMNC7zO3O33movSwDDnAy805yjGnW+u3NKeVzseUcERGiABissqwQ/posa+M+L8ELn4sn47HuIf8qqkzGkMQXDe4BlYFlxGIX+HnYSA801cWnBs3OtoaCLPurR/6ARAL0TBw7sNbokU1Jp2RxmdHY8Y9npjVFTX4OvIMWQ7tncYToz4Yd0jqaKX9hjdY6JjcI+qpdB0uP1iJPfI7eEYg3Q4xPLtT70kLJ1SspmCJeYX45xtSQtdddE7Qrk9UMsjxedybdH9LpPaqFQMddR58ifqFX1rImpGg28x43lbRSi028ahd67zqY/XNuH/dTRQSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2mu4L3aj0kLpb0Plk+a+mhOU0lvO5w4D51py2Ma49I=;
 b=xWC/S2gwGwNg7VmO9XLlJSIIJofam0kPZTnY81m4jpD+sUcPkBPiZG89DEJhhp/D83qigC+KE+kMvUTX/WHLSREg9DlOdxn6MjyEqMAw9sqPEypN3Wh4YBaOZB3fgx3Ji3Ax4MPvJHiQpkQoUjW8ZasiOWVEWzIr3pwUrhi83eAJxBd1vmseiOGJW3P+ZW8/iDyHexQA9dxdwgiC/RSeyxkaC7lF80vaj+XRsRJs89AJMyY0OkmqxIWzSbtPC437FDr5BbosUXp4qC31WTJTYtM/fhNLosZO6uU6DSCAI9UFnnbWZS09TuBDu6jHkFQAyfsMUrEVcIxtTTDfrAghtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2mu4L3aj0kLpb0Plk+a+mhOU0lvO5w4D51py2Ma49I=;
 b=Kk8bcrQ3PT6SZM9Y0tfz55h+G/xliu4Df+K8v7SScXP4/Og02nUgxiEWV5pyFH9KMjPppzWmytou427bL2K1ki5JYZ/9scpyNKkgU1mVaCvCpdvXFH8S91xlLrrMo+Xvm/XAzuD5LG0J+Z91AjmlaHOOhDffBJCW8jACAzwlqYE=
Received: from SJ0PR03CA0074.namprd03.prod.outlook.com (2603:10b6:a03:331::19)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 15:46:08 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::d) by SJ0PR03CA0074.outlook.office365.com
 (2603:10b6:a03:331::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Fri,
 2 May 2025 15:46:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:46:07 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:45:58 -0500
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
Subject: [PATCH 5/9] ASoC: SOF: amd: enable ACP_PME_EN register for ACP7.0 & ACP7.1 platforms
Date: Fri, 2 May 2025 21:12:44 +0530
Message-ID: <20250502154445.3008598-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b1878f-eb78-40bb-955b-08dd89907474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uPU/B7DzhpDTGbEEcYaxYYhmVVVfu5UkXz3gepnkrBFVA+nRlwgWeWhj2CsD?=
 =?us-ascii?Q?rAUqTlQKqOsY6EGsZz176J5eFEWWD3EkabbRJ79fGrgM0fJOcNhfLw+Llez1?=
 =?us-ascii?Q?kRq7kOrgjcBjWBFE5d8efDvU5pISETJNhq/rWKVHlklvB07c92vvoX9ei3tN?=
 =?us-ascii?Q?s1tlEE2UC31oEUUzsblrfi2qeSBKQC/ZyK2fIwdMU0rBHQrrFVugO2ZvYfmr?=
 =?us-ascii?Q?IOyiVQbw38IqUDbpN6SzxdfCYHnEB4f2PTrlVke0vZk7ppM1pa6nX1Zjslir?=
 =?us-ascii?Q?CXY7xHlJz7VGWiNtGbmWuggNfyeWV/VMhhZ01T2XCWquhCD1ZXiIHgyb27nP?=
 =?us-ascii?Q?iI9N0B2hiKI6DuQ3mC1Jbo8LaLadZX9sCWn5a5T2nawirnQjZTKTo+M6JYnY?=
 =?us-ascii?Q?tRfv5vZj8b10/udHrHbx3vse3gCzYgP/WKSH7mL+sbz/I3/K4d+MXFOjj6BC?=
 =?us-ascii?Q?zJstbQrag3U9BhcOb2Q8xQniB5ggvoc1iwfWMHhJibLuKBoRMt0LJ0FBmra/?=
 =?us-ascii?Q?Sha0t4xcGVW7HKFNMY69smhqUbeJvuM7PKuPnCzWQk/HyJpRAXzwBGOUsfQa?=
 =?us-ascii?Q?1FtbmmiRXVRz9ehe0XhsAoWJZUzG085L8+NBtvr5I1ehz24E+H+IIiROdp+0?=
 =?us-ascii?Q?j3tnQo4/VZQkLzde3V1GdBNWZlHazffk062SufH3T5Xcv6otNM4ARgx9VzkR?=
 =?us-ascii?Q?71vRWNFnexvS4qNfq1PlwerLq2y1hT44mDRNXivCBmQlapOQtMUe6uvQeTUm?=
 =?us-ascii?Q?oR4NJHBnPFWSYTnY3v54ZwQZ9UvrBoFWEYS7yN6JHXgsOp/i48IUgH//b8ut?=
 =?us-ascii?Q?eBW4o4hOD5f7rd5fHKFlN+91BfAPzWY/0MqvLzAU11E2d4iogMJwK6EXufR5?=
 =?us-ascii?Q?kf9lU8m+e5HiDMSPAY/NmC4ml4vU45dJO9x3b8VWpvbp0p4HoNpFLqwVapnp?=
 =?us-ascii?Q?qJJ2nNcCRXjevZPW9uREUH7TAu8c7VaSJZUaGEA5estxb7sWvQ9aRJsCHNiU?=
 =?us-ascii?Q?4uMsg3atHpVzP3wTrbIYfMYsBPz2422r5e2+ktdZyjzPADlIakwWPpfruvRA?=
 =?us-ascii?Q?sGUgDyuJTjEfPtv1eqrrT1lay32aXPxl3k1vvmeuAB+lx+3SzzgeCtFbhHlt?=
 =?us-ascii?Q?uocbi7HFeSmEwXqxZ/nbvn1Uq1n+7CHxCGqd4Tv2G1lVSIi0UAd4ablLQutf?=
 =?us-ascii?Q?FO/XWq2DrqkIUTayfmR2d0VNpQ4K1VwQpxyHXnozywBkwUdzCAyXaTsM7qTg?=
 =?us-ascii?Q?O7WY+8uPdj+2ZhzhIHyRr/BmCquV2DRBBg+aEfQ7x42BOzd6SJdYyrmsq+AC?=
 =?us-ascii?Q?uXN+RY7x9PypuQkb80CKanxv9HS8V0nyi8ENzTfP2lspettFR7pygOmJW/Xv?=
 =?us-ascii?Q?EG316PDjr5neKABQRX4g3WfcJHv0bl8qTnmp8zYMfDpzdU25HWL840jGFUpO?=
 =?us-ascii?Q?W3b1WgdTbvMbksPIbTWvTWZYMBIOb+uhsDYsD7R5d5/JFN27IfP1UCQMPAjR?=
 =?us-ascii?Q?b2b5GFmerMxsLeVyN5cdemUO/oN+Q4EN61l+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:46:07.7239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b1878f-eb78-40bb-955b-08dd89907474
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243

As per design flow for ACP7.0 & ACP7.1 platforms, enable ACP_PME_EN
register for below scenarios.
1. During acp init sequence
2. During resume sequence for SoundWire ClockStop power mode.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  1 +
 sound/soc/sof/amd/acp.c            | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index ecdcae07ace7..414151187b44 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -130,4 +130,5 @@
 
 #define ACP_SW0_EN				0x3000
 #define ACP_SW1_EN				0x3C00
+#define ACP70_PME_EN				0x1400
 #endif
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index ead31aee5e6f..615ed7ff3846 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -570,9 +570,11 @@ static int acp_dsp_reset(struct snd_sof_dev *sdev)
 
 static int acp_init(struct snd_sof_dev *sdev)
 {
+	struct acp_dev_data *acp_data;
 	int ret;
 
 	/* power on */
+	acp_data = sdev->pdata->hw_pdata;
 	ret = acp_power_on(sdev);
 	if (ret) {
 		dev_err(sdev->dev, "ACP power on failed\n");
@@ -581,7 +583,16 @@ static int acp_init(struct snd_sof_dev *sdev)
 
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_CONTROL, 0x01);
 	/* Reset */
-	return acp_reset(sdev);
+	ret = acp_reset(sdev);
+	if (ret)
+		return ret;
+	switch (acp_data->pci_rev) {
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP70_PME_EN, 1);
+		break;
+	}
+	return 0;
 }
 
 static bool check_acp_sdw_enable_status(struct snd_sof_dev *sdev)
@@ -646,6 +657,12 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 		}
 		return acp_memory_init(sdev);
 	}
+	switch (acp_data->pci_rev) {
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP70_PME_EN, 1);
+		break;
+	}
 
 	return acp_dsp_reset(sdev);
 }
-- 
2.45.2

