Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7919F464;
	Fri,  2 May 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200729; cv=fail; b=rW8jbUjLVBavKjxsHm7ANW4j9F5IeyEm/XS1JH3VpNi6kWEtRmLAPgURijZoGPwoxftwBXVYbfWjtRu4SM/dMwsdhNhzBBBkFfcLwxTy8HDuM7KS84gCkH/ZTxusF6LzSy1M/LiJ/okQ7abBA7O9PZJunlxZa1eSncP6sO7yHv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200729; c=relaxed/simple;
	bh=5W22ljiQShcGUH8nDWhy+kkSmUjuUd9Ig6m7PajWPnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CcH79pdCWtceWJxG4KRg0HyKj6nAEcR8LjuQphqBClsfQ9PBT47qDiMeuqWZ5RqRlLWGue1gaFROVLUZ7PdF+BbtfUHMYWT3oJPAs/k3phsRrlcqCnpaLp4OS97unPZGA4vQ3q+Riex4Q0ziQO5YjAcKtzDNpPmMPqvXrRuAsNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tVFeO0NZ; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tVFeO0NZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sahxgZzOwJ+ZYCkXO5PBeZfHFzhcPOjZgNbqmjzQe0bsLZruXGz/vlsp7LWscKGVL8qHqOHnHOMpN3KxoDuF9G3LvFhdaNaBDStqBtnDWsPPJw5JYWT1MnQD9P7WDifXBVbUWx0UvdUAvMxblx1PdJ9f/YdHSm5hWIpURyzu14fD8Do9ElZeaL0iekdOg0crYEZkPf1Hp0i7uNkbeogL+77PttHO/8rwPLj97lDOyLRfevw0wggHOJJ2ShMWh+BsaDHPrUAqSOatpUPY2mTnTelPD/Do9K8c0bwGpQaZ6oip+dIV8EFpQq6LlPAoP9u+DJauGcCptGVoNAmpI89/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xik/W7c+Zp9I7MHz5I3QLVnjMTpjhAGUmum+/QRjRa8=;
 b=DZlTtFEiBhIsFFPl2s1mssQE5aMPBSe3aroSIPMlx794py8uMOLZNVDnynpDhp7fBSo4ezw4ywB9TmKUuQLLuvrXmBnSuszbfQtAq1cmSmMBzRme9xa6M7IeYomQHk70q9feR+mVQuTIsZt3Arf5dfcqUtdOr2oTpWuuQNbz/DtXXz6tLSV3y6zgtg9f9p0QwzbeFFLNMAt7OlvRDa83wNp9x0IV3ivQR4OCltJztkbgvFqHmVnNx4Hy6ZG/se6essQ07ripkoXpCoHYUnSajA1Q8x4XUQWkNVVwuWLPL+Y/2+CnOPOHKlJUUezLQm2h1tLvLEAvNOswg9s8XpNP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xik/W7c+Zp9I7MHz5I3QLVnjMTpjhAGUmum+/QRjRa8=;
 b=tVFeO0NZKWFbRceUhKiZSjrp09hxivK8BWZAMxuPVI5aVjzmceykAqFXjSZFVEld+pPCqaG8KjgtSVupXYH1c1rlyF896jYVlCUrVid21H9vyyO+JwqbKwVGjH+f5j66kIMkIFwkJOwgeplKK708p3b1P/DPU+ftWuyCE8xaYcM=
Received: from PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::19)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Fri, 2 May
 2025 15:45:21 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::1c) by PH7P220CA0168.outlook.office365.com
 (2603:10b6:510:33b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 15:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:45:20 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:45:14 -0500
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
	<mario.limonciello@amd.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH
	<gregkh@linuxfoundation.org>
Subject: [PATCH 2/9] ASoC: SOF: amd: add missing acp descriptor field
Date: Fri, 2 May 2025 21:12:41 +0530
Message-ID: <20250502154445.3008598-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd57db0-864a-4f09-6de9-08dd89905870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T3Zjf/mogedzuFVyujMR6xyEwAjQARBrmf7/YRdWd5je/wu2anSpoTeCBoqt?=
 =?us-ascii?Q?mLt2kx3aQpxLWafD97aXMqHdSVCdFFuRE/st7fpGYPNujDjSf3LW0PIdEiZ+?=
 =?us-ascii?Q?fBz9isWwtpJLRU8Ar8rppxviDc9YfvnEitBt9xGpJO6TRNsilShvkAHyST8M?=
 =?us-ascii?Q?7/5a+Nx92CgiO1cd/PC6liAi0Hj36iOC2Ryrg7Mp6BJJJ6X5+sERiOk1WQyl?=
 =?us-ascii?Q?u9o/3whWZwSH+dZNNdCQrnY5kZPmCyf3PgvewvuERCA0cC1RiIn0YI83twpA?=
 =?us-ascii?Q?XgFeFJYvUS5wCdeZprKwanQIEbFkbdvJuc6rCMrTri7BkBqK+DX/1pNssheV?=
 =?us-ascii?Q?ak5F9MukxMg/uaViVTGlRllJyEOPPp26GXQveEd/7Bb/H9ImETapdSFqZ+Fo?=
 =?us-ascii?Q?8GaRCHaeHLcIiSJ2AotdqHTsKwGfj6GBv+Gv8mNAK3R8HW8DSk0DTQx9MSCY?=
 =?us-ascii?Q?x45RgwwhufPpvwxG5I76nJSgbKA8PdAlqVxwTg3PAKUL/2vEM5XblMKpZlca?=
 =?us-ascii?Q?vbjFj4Tv9bUabIC0q9kLA1DRe9V/LKX5cDnZNHn9ek0XwesRHRNlFxECLsGE?=
 =?us-ascii?Q?CWA3yVs+aeMVdR9yfAuWq0iv8O2DIhFrLBaV4uTE8OSUVpeySU2x6k0P9VE3?=
 =?us-ascii?Q?jmQqPwk6gGj1q5G3/+BtTItn+KZ3y8/sNdzrI7p8RBGKLiYcVn6QkEBPQIW6?=
 =?us-ascii?Q?Z6KO/0+Yky1Bvp+7mJsSIYOd9gS9v98gWLJZuNEPlNsQOOmHdBSlCU+IQJD5?=
 =?us-ascii?Q?W3oQVjy7jIweeUXDPUyXJEyc3np1oD7ono8gUZ/kf6rXgU84xnuVYG+JE5UC?=
 =?us-ascii?Q?7XkwQ83FDabQ3GAurFBUFmD22D6a6CJFVo2Bp7GpEaQp0/tuX/jjpUHzmQ7s?=
 =?us-ascii?Q?U0kBGfd9xOzjl2nB6oewyrSg4v9tkOw1twkSM9FBPhaBxlXZGqsFW9qhaNGs?=
 =?us-ascii?Q?vipQsFnBiBUx5CFDXku17Vwakg2VcArYaoOAQPV6pEdTSIsOqJ3M/J0d5bDb?=
 =?us-ascii?Q?orjT+ZfHd22Ixy2qa6oQsZybW/VgOvvBifT00idMJDOAb8YlnXbA5kWUckLc?=
 =?us-ascii?Q?irvcL+/8FV9qSM7kGdzjeeNOrRs7wGVZVezRHG8DUcadDnDf+kZc4mubXBe0?=
 =?us-ascii?Q?UGUHti66jBN/tj3BXqUKGqS0mf1iOg5+auYtE85LJVBfhSH++GAsaLaZCueE?=
 =?us-ascii?Q?ey+Ewc/7n2qopjcdz9aJIuMS6SqqKVkPjre+ewaam3KDFUrb/tAPsgtSpbgu?=
 =?us-ascii?Q?/a3gNbGN8Rc6zgwT0EUeEt6hd7fIypHuJ2gf9a9MsYsNR1bWxIX4KZa1kWx0?=
 =?us-ascii?Q?3sG9jxIRx8glhGtOReSEwsjYdhQPnNkCPX8mQdwzYM1Qv23TEbMuQv5rYmFQ?=
 =?us-ascii?Q?zv0EbZr7wm1bSvLp+hBFTM8YYsgAyqD8JRPV8GmNlETMqOonNZGCuyS5hQaN?=
 =?us-ascii?Q?F7ygFYgEtKgyDPAs6an2V/pAdkcqQf0L+mfi+DjiddCu9nNIUWZhQww0QjEL?=
 =?us-ascii?Q?9wkSj6M51qwN/J6DhmShdXUVLoZ3BqgXiHth?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:45:20.6912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd57db0-864a-4f09-6de9-08dd89905870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447

Add missing acp descriptor field acp_error_stat for ACP7.0 platform.

Fixes: 490be7ba2a01 ("ASoC: SOF: amd: add support for acp7.0 based platform")

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/pci-acp70.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
index 8fa1170a2161..9108f1139ff2 100644
--- a/sound/soc/sof/amd/pci-acp70.c
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -33,6 +33,7 @@ static const struct sof_amd_acp_desc acp70_chip_info = {
 	.ext_intr_cntl = ACP70_EXTERNAL_INTR_CNTL,
 	.ext_intr_stat	= ACP70_EXT_INTR_STAT,
 	.ext_intr_stat1	= ACP70_EXT_INTR_STAT1,
+	.acp_error_stat = ACP70_ERROR_STATUS,
 	.dsp_intr_base	= ACP70_DSP_SW_INTR_BASE,
 	.acp_sw0_i2s_err_reason = ACP7X_SW0_I2S_ERROR_REASON,
 	.sram_pte_offset = ACP70_SRAM_PTE_OFFSET,
-- 
2.45.2

