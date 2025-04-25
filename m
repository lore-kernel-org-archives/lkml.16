Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B232D22D4D7;
	Fri, 25 Apr 2025 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745560927; cv=fail; b=Enac4k/yjK5XJGLQLAgVwiJpnxqEZ9swHEjvUNfxNNTQBNks/LhNHp8wazyqWVgWLj8SZmlSl/CsXMgfxCddcj6wmgcDOZe31I3ZsGu2DVfUVNaTM+SkFXZddW9XrXfTXEVwUou63kEtMhKz1QZscu5QDD0G+WoLnTwN1iGyBYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745560927; c=relaxed/simple;
	bh=P+brc8N66crh4h2dkGj4vNYkuVdRhDBrJ+iEx8k1Ec4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XUKLtdv8amiV8jxzRdApAv5Y1jAL7W3AX8mV6Po1Snba+a6bvOo+l3+nzF5ZaqWN+8bNKscJoe6tXngqNBTiAbDOeUt8pH1nWnkqKtcrhjzgxZPCIj+yp0cvvMsxh9BU15dQ1/l6XqBg8cddShB5blnK7RLGUbutm9j7CCPeGJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xTMJDv0i; arc=fail smtp.client-ip=40.107.236.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xTMJDv0i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDOB/kSDjtoIPRSyrKFP83HJC6wRf3D6WjcRICx8Oc4qt/KLDUm8R8Jh71n9tt2kmTGUgyt4jaFdSJRjvJDP2/e3wlNqyKsbpyJiayYRsWHshcRZs61WTuUBJ1K9ehdkxHBEq8nO/bcPuQFUDC8CNW52RyXTBSqLrs4JDblq5McXzzUx4GFAF3cvya2d7uBq4eY8w5vKUGPvUDXfeljEGK99+bthpThQC2mpxc/zvS44/xEprFQyzwKrh9UOLZsjLqVmOT2TtccWot5QbNbkz6HghFRWp/HSDFpGF/wu4p0eU3xhq+W78QCts4DbZff3nsacSQ+JdQ4xjy4lGnh2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bM6TPaKz03x3RFvZ9CUHpt2auoApf5pInKl8yhoFleg=;
 b=VEWEAQhd0Zn/08n8gkGPCMmYQ+8RfukvWyJsY08Sk1GgnBpm0pk+tJJ5LVGHXEarnaQaOSWNZyWjHL3YoEW7CxwG8tSy6ZuGAjAIZBFDcHuHfY818WlAL0DHT49E21agGJRW3Uz2bGKzTeMZXhD7tbFkrIYIDwRxJ0JjWD7tGifO43DW4JQK5n2H6f5yNp0+fPRugxwGJr4R6y1JOLrRVA+p4tsthawG2tbyUeORHHn7CLomV4LN3vFyIe+xywE3sdt81I7MzzD3LiBSwaBeH4INDZCqd7QL9oH3NevbIpFDJILlTvzYsnUfUWKuBaBYAxytgU0rRahR0jtW8Sk13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM6TPaKz03x3RFvZ9CUHpt2auoApf5pInKl8yhoFleg=;
 b=xTMJDv0ifw5io0V8B3ViSJ50m9xcMX3C1/JFj3/2rzEd727WksakPajnt/taoDnjHw6QtkSZywaMBlNSb5SXle5XFHOacCOwhbXav44KEmMeyQk0PbKRHkfPbquhlma1xkAAQce4Pju6HRFnrnoIzYXXCoZCfxDcLMfCSjK2FE0=
Received: from CH0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:610:cd::34)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Fri, 25 Apr
 2025 06:02:01 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::b0) by CH0PR03CA0119.outlook.office365.com
 (2603:10b6:610:cd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.39 via Frontend Transport; Fri,
 25 Apr 2025 06:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 06:02:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 01:02:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 01:01:59 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 01:01:55 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<mario.limonciello@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH
	<gregkh@linuxfoundation.org>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: amd: acp: Fix devm_snd_soc_register_card(acp-pdm-mach) failure
Date: Fri, 25 Apr 2025 11:31:41 +0530
Message-ID: <20250425060144.1773265-3-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 6559d52d-5f0f-4e87-3866-08dd83beb1ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p0QjIFES2oGsD8gh2LRz3cd3QQ2cu2NdWe9y59xtGjvimJUy5Vp699/u7uth?=
 =?us-ascii?Q?yeYnRGFyQS4CP/BucpIGmu64EKd6iKE+ehzOWx1kNuFXvaY6MKQjSh9P2WqV?=
 =?us-ascii?Q?LcuSo0GuCAIK+mE+TS6AzrV+wic75yvmFNKnSDT6D/Fz9anOdMaYvr010kwa?=
 =?us-ascii?Q?G6xAy/kLP/MgmHSvDNkNycERgbfYB4tSHUfMtElMHpdJ6luhPJ7OwPXsmiDW?=
 =?us-ascii?Q?mQfSErLKQCWEsRYGRfS+NiaLzjAkLci0Q6xrHmRqEzVPb6brhb3t0MSIz+h4?=
 =?us-ascii?Q?AHVJms0Qtmljx/htXQ4OHP/wh7YJQEwauTPRqw7y/rmIFgkYBDSI5ehz2nDG?=
 =?us-ascii?Q?2LKPXATlDhj8bJdvDlYxdmQtP9k8BRHcM0FoBZ8TzHXU0x7WkLZy13zmTj+2?=
 =?us-ascii?Q?Np6d8xVXKbn+kZ8pPKqmkp9imhOj1N46f1+HppbjfkBYuakn8QWSCs8r5gO+?=
 =?us-ascii?Q?SdZLBu8J0SkDOCjVBjcD8lEpx83OrrkNz+UY7agERY3Uy7CWbNukEx8vDqzD?=
 =?us-ascii?Q?IMyQ8K3SdmC11aqlyvMFtdxbIJnwtRRsAY86H7RwEqySFknSCffLyhfEwrlY?=
 =?us-ascii?Q?jqJ9EpA0pE/YmU+owVHzZFnS9eFPG9rryZ7DKBBrLSfLBGFBa7EYI9gZ/kPC?=
 =?us-ascii?Q?AX6Xn1tc9ooX8HWlymETPuBGAiDDD76YISxCzqRGVZgo4EVzRTqt1hh0rHnC?=
 =?us-ascii?Q?TrKtjPRaz/KvIi/Gvh7j9wmGaB0AXbBquKd874XWnmTpwtMpL5/DGuM5OXml?=
 =?us-ascii?Q?oD9GM/HbWfiAP4Ai9tzPJBaOdBtcneNfU75SHNreYxpUpEyCleWdK8LXSIg6?=
 =?us-ascii?Q?l8X3j9LMjX7nCZSIZPZ6V4K3DoocSHTpbho9JVqo+9jJXOU185NW797ayKnz?=
 =?us-ascii?Q?x9Pf1qrhqgVpDMveuloFqPrp/z9G9JFaVSvEWoxmCIMipkt5aFME7f7jizYm?=
 =?us-ascii?Q?intdpqz8Mx8D1J2YDA68eeA+RLU+E91fPvULw1RNliWJDkKAFkwCHfHF+Ze4?=
 =?us-ascii?Q?m+hf2tvSDMKC7oL0z+TiCtmKBcuCbhfjdPPvxMv1/Mhf+EsVXdrwu0gaziat?=
 =?us-ascii?Q?LlyD0YtPNR4l7ZNeFC0e/uLBWGCvwB5h7R3sOhl8/DkG+cg/7xhnGrR1VuLm?=
 =?us-ascii?Q?MvL7QwoBi9amBPU7CPqwj60WsF1vY3JmcOvLVFNN53fcG8Cnv9MRIQ3r+q6R?=
 =?us-ascii?Q?soooLSEcjh3wUNS4M8HIOI0Pd0O0ocqutf0O7/ewPB9jBUuGUj+pgztBItF6?=
 =?us-ascii?Q?IJ3yOafWNGi0ViT/J+0O2kFj4aSmX0I1VYsQ/AmjlbR+8YPCB+fiWj9wXFX5?=
 =?us-ascii?Q?JJsG7Iea9WJA+tbLhYAAa0oZyud6TY8+Ew8MgnJbABsfzVRwlRjtpDXt8/D0?=
 =?us-ascii?Q?umMo8kap4ECkq2cT2fmvCWI1dzWYOW0rEK48PrZAJ/xaMiXg234ynZ1SIRgj?=
 =?us-ascii?Q?CWgaWrK4pxXfs0kvocnuPxfyD8jdh3fRyKwZ8r8P0EN+1UhfmeFz14uYXS52?=
 =?us-ascii?Q?q8hFMj0Ci3MMAIF96uGnirlpT0LkrIO3RdlO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 06:02:00.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6559d52d-5f0f-4e87-3866-08dd83beb1ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838

Add condition check to fix devm_snd_soc_register_card(acp-pdm-mach)
deferred probe failure, when pdm DSD entry is not available.

[15.910456] acp_mach acp-pdm-mach: devm_snd_soc_register_card(acp-pdm-mach) failed: -517
[15.910536] platform acp-pdm-mach: deferred probe pending: (reason unknown)

Fixes: 6e60db74b69c2 ("ASoC: amd: acp: Refactor acp machine select")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index b4d68484e06d..ba8db0851daa 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -450,7 +450,7 @@ int acp_machine_select(struct acp_chip_info *chip)
 	struct snd_soc_acpi_mach *mach;
 	int size, platform;
 
-	if (chip->flag == FLAG_AMD_LEGACY_ONLY_DMIC) {
+	if (chip->flag == FLAG_AMD_LEGACY_ONLY_DMIC && chip->is_pdm_dev) {
 		platform = chip->acp_rev;
 		chip->mach_dev = platform_device_register_data(chip->dev, "acp-pdm-mach",
 							       PLATFORM_DEVID_NONE, &platform,
-- 
2.43.0

