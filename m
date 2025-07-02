Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564225EFB6;
	Wed,  2 Jul 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455390; cv=fail; b=umPb0VjKnXLZ4bi8EIr14RGVqIQ8apT7aVwMnV2mU+w9YPuaOJQ3qP17vxUdbcxpIulSbfjTwoOKl4xvssv3r8MIfW3VjBFLWbh9ewZiCYQv/XcIrtmMv89EjQOOR2APOVbedQDOpNgq3WxbtAjN+40WSmur2kJbnl1IKjMmzlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455390; c=relaxed/simple;
	bh=mge9SmX7ez9YEml77zLZqZ8GNy+CeWdeeK9wgV4ERW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cWjbp7XEwGPXR7ka59+DYPjbpoePaTW1nXCwAd7jd7mweQw2IhfJum40AbbueXRZSwwwlI2kGUBfSdLmLMIoVEZIrwz0xu83lAy1dAFFyZkdcv//XUfv8xwkmU8AMEnap2R8bys9nMMLMtT/yq0JTWPhZgOWpkKesfYwV3JNEvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g1WoYpsb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ea2H3Cts; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g1WoYpsb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ea2H3Cts"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AIpQ9026460;
	Wed, 2 Jul 2025 06:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ubGOZqiEvmYcGLHv
	sfcvb+ltkiaMtvhS2Wj3MMxAeNA=; b=g1WoYpsbMEstlZQbwjtp0G7dTAXLN2iq
	1DkcwhnOoJKbFoVJh00tz+bHS05xcT4G35sKeId9A+mPrHZKAIFyRnFyxwxMr8Bn
	qiUvT3MRFy7Gt1nqYqKAk6SlmcjdRDSHnlA7HvE5oDSu26VQpzLbfVdfWp1WzDGT
	EB/GwRrj8YzkPB+CVv3wcsjZnjlySygX13XSzesxnoTLowKLLOJWQGNHP5qOVS0M
	EEmLTzMywPJttE/PuGHlrCWEjMFpwy8q8NyaB8pgJl9zwrftKW/2myOuJkD9yA05
	/e7HZrkVK3+IQo2hUMWyugWGwqUt/qEGxqE6ohYPGrMKpWPO0Fa14A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2101.outbound.protection.outlook.com [40.107.237.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47jcth5ew8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 06:22:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEQeM+Edo0Df40F0FIycPE6UAbyFDh4iJcagBcNs5Q8DzEF2WCgAjU3OW47vsxM3xBJzUK/AT5d+KK2xQSJ/+agnNko2apk+t04SL8bMJdSvS6ak1KZoLaG35BUaOBVgsMHQRTW20IB700BoaNQSHw55xdVq6RJVxddzWPAMtV6JFXfYNju++Wtg9MtTfScng/gO9vqaA+F70LxV6LckriFDZlniWv3AscLGq3CpYGy4nLdvXqfmrU+1qkao64xziBxArpkDMGMgQJwx8kn8dnpSi6ZSEpV4GOEtKBkckKd+zQKP2Mb08duNpO2jYq7IwWEFFpI4+A7d4VNLMDxAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubGOZqiEvmYcGLHvsfcvb+ltkiaMtvhS2Wj3MMxAeNA=;
 b=jZ4wws9Fw89+AaM4XikJMlTTcxjJjACoJ6CJHBVos+pc/fvsf33pyfcptP9MLo+9V3qE5O7/ssV+ASVFb+9jF2YvqeLJEo3fIyhV/z2aWfF0PnY6iyqtYcLQqQcn0hb57R6i5mHnI4xMHWY7poBeCM7FxqC1kJ3mqijVnEILjuQp0pDZDcZs6OAzJ69Sxs2K1nlR+HeQUSInLrm5ZQbMmkciVTANkWpuLjf0Qy0v8RgZbwIV7E2a/r2NfSwv370qol6MwBLfdzShCXZLIB7zW/q8gFN4S585d6gzwkb7dl03HRBAtqoJcqHQuVa9cgJtLA0KwtkhiCpHR1mDPaNUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubGOZqiEvmYcGLHvsfcvb+ltkiaMtvhS2Wj3MMxAeNA=;
 b=ea2H3CtsByUnLIpurm9iRz0H3KzKV1FSsOGk3mEiLFHcUBSAJWFXxxOIyqbicFt8VwBkeDUH99OYoOmrfksY7MupacYoxrWZc5NdiZDH2DHeU0ZRRQmH6WXJjSuYRXMwitEFvJIbGvcl0LodC7aCU02DwuU4QWsyYeh+Rzs0vgE=
Received: from SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23)
 by BY5PR19MB3811.namprd19.prod.outlook.com (2603:10b6:a03:22d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:22:47 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::bc) by SJ0PR05CA0048.outlook.office365.com
 (2603:10b6:a03:33f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.11 via Frontend Transport; Wed,
 2 Jul 2025 11:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 11:22:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51B63406542;
	Wed,  2 Jul 2025 11:22:45 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1456C82024B;
	Wed,  2 Jul 2025 11:22:45 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: Intel: sof_sdw: Add quirks for Lenovo P1 and P16
Date: Wed,  2 Jul 2025 11:22:35 +0000
Message-ID: <20250702112235.377479-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|BY5PR19MB3811:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5bb09ce2-45a1-4513-ce92-08ddb95ac5db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oTiTiVvI5IFXEQqIpjubNU/Jur9meq7BqVQKYH2yUpqnn1IR1aYhzK2oMIkn?=
 =?us-ascii?Q?1fmnV3IiWaOY/VvhBZravEkS+0z10+ap4I3OAnJC01gS7LC2EV3ZhaSlvry9?=
 =?us-ascii?Q?PliMWyWM8M/xlAIWKVAMu8ys8se5JjDtHKyaMqE1ANJ7TvhKU08FKLkXiMNG?=
 =?us-ascii?Q?xuV7ne3g4sFDfnWqU8zwvGcFrJtiIVJYiqtUCnzP6QurgXVce3eaOVsj2aKv?=
 =?us-ascii?Q?AK+GKEoAtCHSc4KdMsCcP/JDjTkD47d5UqmoO1FZgCKS5RPDO76gKKLVIZMi?=
 =?us-ascii?Q?I3YecJViYrTjKiBFgDZFClyj2mcYg4K+nmLNDJkYBbnY6k5ohau0nvRDcGOt?=
 =?us-ascii?Q?tUSDZi5fmEaGQqN8GP4NFI8+ZQOSJycNXBJXMOBkWM9XOUonVWYMOr6S6C3h?=
 =?us-ascii?Q?/FxKaibr6CRm5PDjABf69eyKVraLdfM/Db9kpe69GwRhW0ix8I5dLYJ0jKp+?=
 =?us-ascii?Q?QR2yKhUzhWCT5U/U7GUZlqJNS58OkQGrr2HoGHMvgqB/T10MxdJote/CwQCZ?=
 =?us-ascii?Q?W4Vfd8twwavT1K1kaULGsebatdAl2ERoXZmMq3S/gvrBddGikHSdnPkVZN1S?=
 =?us-ascii?Q?+0zS13BAQtLHsjfFZcfGEeTqRbPCIkAxzAZLma25oqSF5VZpbjftTIlm8VBM?=
 =?us-ascii?Q?Z7XjNs02VCo+a7X+/JQ+XwqykTpXcYBreLkaaxaU/fIyyKxpsbFCcwOo6qPw?=
 =?us-ascii?Q?s9OzRRLLF3I+wYiPIbQo9kXNPsqOfnxG+3bIaBHQjFp8rj35njW5Aj+S0UCr?=
 =?us-ascii?Q?yyoQpe/hQsdH/KbIeurBaIfwTL4k6H/1SLT+2E1MjA/IDEf+MQA18SnaC95u?=
 =?us-ascii?Q?Bu+G0Dz2JJhlDeEb6oXleDlhLMqcqtRqyv2gsdxJ+3Ea4LOYaB1to/utrESC?=
 =?us-ascii?Q?FGAO/dY+TJD+GApbGfflrKcOSanQH/G9jIABLXPBMJ7RAbmLtuoOHr6FN2/Y?=
 =?us-ascii?Q?glpQ18O0XP+wtN1buKIbLxKsNnpafcf0NIYSP2Ib/htc0+0qMX4rssCOEX/3?=
 =?us-ascii?Q?zassvviR9oqfRWSh6Gr4BXB0MmsuaQw2B6amoa0ye4+SlCf5Ho/u4Wf78Dy4?=
 =?us-ascii?Q?ZfnBYNxuV4XsjMhCG2HwvyoXmYSSK06eZXk9T+NawuPVpjTkKL7eOrNg/AVv?=
 =?us-ascii?Q?ab6Kz00tDaC2LsVWQ4F8DXOFvr6vX0DJpdmD1MgaguGr/IeyzL/jGLp1o4TZ?=
 =?us-ascii?Q?seiwk8MwgT12f0dZiSYoVXjgfLyt1a6P05W8LuHmPQzcKZ7D4kwOay9jCjmU?=
 =?us-ascii?Q?E29TlfRBmDrHE/icQqf5uGpxf5+DILs8CtmrMO5sc8f7ygEMff/ALca9HKGc?=
 =?us-ascii?Q?80LTqxnnIQ9yWyPdeyRh9MnlTTS6HaVTZWBKAGCIkSTGNFsVfDY9UcxRU3s+?=
 =?us-ascii?Q?uMR7bC5fgiFaX2IiqOgToLHVyrYWaXlgvYf3/myjL4PFh6H3sszIM29aRfKx?=
 =?us-ascii?Q?/zSYLlkPlZUOWZoEQqIPYiswedkOwS8C18IxrMH2Qhbj0gdLn24PiPqYu5Nf?=
 =?us-ascii?Q?dm0qwy94guXNod80BVO2fDWvcrUD1/dHb1sr?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:22:47.0794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb09ce2-45a1-4513-ce92-08ddb95ac5db
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3811
X-Proofpoint-GUID: 3-wSzN-Y4zlxUjFZ2NmNsmpPSxByIJWY
X-Authority-Analysis: v=2.4 cv=Qste3Uyd c=1 sm=1 tr=0 ts=6865168b cx=c_pps a=VwMy6949QmfyZ88rPZqQKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=B3KfDADGxY1k0BY96H0A:9
X-Proofpoint-ORIG-GUID: 3-wSzN-Y4zlxUjFZ2NmNsmpPSxByIJWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5MiBTYWx0ZWRfXyh1VAec2jaAG IUDTvEi2BqGkUWlOrV8zMcPI1sMI+Fn3fj6aqelGJiAjRPSU5kQUD/3Pl2o6kBhRwbsvU+ES13n LlIdJ8Cer6pqM7ZSFyq4EG4lv5vxmxJ6xhXkD4huSDRMdjaKE+0/7GAwcOv/iAPxnfNcCi/Y9Lz
 flXcECz5mb4ixQvn5DDsqMDaGYQOH4Apho5FWszVixM49J9PW5pqYmba5qxF6648Q2+Ecm75RSg d6Rw5OTgnm23AuJRaSxGj8ozHxGm38+MsatirBApH8ivKw5vMpSIZ+VAOysuHwFABsUyCbMdVqZ 9WrQ/BktCrijFqFEa1+F0TrhQdOkyQv2iZ43Vv6CMgUX8Pnbrdhbl+0q6Ga+tw5s7aTexLrfIVH
 RkN1ovBjtaDma31biC9bnLBzU8WFoWnq7NjByhpuG86N3ioBK751DbVBWW2rZHORX1e41KcM
X-Proofpoint-Spam-Reason: safe

These Lenovo Laptops have the DMICs connected to the host instead of the
CS42L43 and so need the SOC_SDW_CODEC_MIC quirk.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 05d13bacf88a..c639df2cacdd 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -783,6 +783,9 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 static const struct snd_pci_quirk sof_sdw_ssid_quirk_table[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e13, "ASUS Zenbook S14", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1f43, "ASUS Zenbook S16", SOC_SDW_CODEC_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x2347, "Lenovo P16", SOC_SDW_CODEC_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x2348, "Lenovo P16", SOC_SDW_CODEC_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x2349, "Lenovo P1", SOC_SDW_CODEC_MIC),
 	{}
 };
 
-- 
2.43.0

