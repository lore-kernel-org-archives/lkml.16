Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16823BCFA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808144; cv=fail; b=HzL4yPOvhoxaSFYjkfjoXqb2agxi1hTiUEYPDeTz3gr6kCDgGA4UMfkd7mpgQSvkR9mUBh86/bCOj5mZZIfXHp7kWR+FPG5lhaiYsnF8dHXvDw9OF3G9yt1zOfY7Lmiw0WMNVj1sjPGrf5DIqYiWb1EkLOLHA9GeDIm7GiDDPjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808144; c=relaxed/simple;
	bh=NesYlbIV+sJo3sKnYpGhEvX+FOnp012PegdJnjmLuJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQ9iYpS4OkhXD4SyEwSvcbtTxah2tl8SmTSHT0CtC8OEnRDdISBTvBmQeCZsdN7yrRATxscenyW9UEpxojCp0U17dClXxhOIkf3b4/gCnXjRfiFIW450ZmWys9cruZpNmuwjDRkfTXcSma7jd29vn9xWP78MJZA7oGDQZMR/JtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jyNXPBYN; arc=fail smtp.client-ip=40.107.94.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jyNXPBYN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvDEDNxTgC+KI5aj3xDQmhf1fqPAlMFJrp7keQfyvc24glZOxgYEgOW24VF2nmkKKHqE8Bz1EY6uDGFN26nSdE+KER4xSiQ8ALoG7MFh1fRw8jyehowCYq22MJnoNNbfGUQMrJJn4TUAKq1d+Nal2Vh3ahaiC+lZB+dax0B3DIMI7NKNbuI/zlQksRNK1XJOTLLPWgDeDrCr35fBMudiTEpNU6ChV9T7jOAx7BUPxIiwwzdYFz4iv/c3uaOT2SLV2J4Y3DAVnqsN+86WXb5KV1ruPKCeAbyUQm9nIVCsf+KSSOCQzeJirv63sT0NBmhC/xTSMP9zBOdxSAh62t1iwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLW/IklWVsR3uxy5SU2GiksbMSmraWw5GdM9fwBJQAo=;
 b=kFTjaI67C/JqvULaUILcNNMsI57v1klgodhq0Ra0bGZDSXzxy07L4Zph7V6JeGWgMU167iOtx9xO4HwE2DZJ44Y7mgU6JZEZ/iKFa/x8QOqTG5e8BKNihJp4u30Y+MpGOJ18Axx1pZCND5CB9ByXE9gBqAvI41Y8PdO3SrfMjAwFDX9ghL0QCYkj1jsJuNuxn95q6reVE2cJn0eKXzw9V2ZsqXSU3LaxPuQbbtaFN97xKhyomsQxiU6s/YlWWldwHKfg+CNakrccnQgRUnjWTVK0jvdzn0BRhQ0kjVUz2ZNxRpz6ljtDgKaifvVPwO5DDS/XxNn+qFjTcMrV+RBxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLW/IklWVsR3uxy5SU2GiksbMSmraWw5GdM9fwBJQAo=;
 b=jyNXPBYNfXixSbRJ/jxpFYxkvfbxEhsujWG7rXqpEZLwywwwbJO4dPjQ+bS01Ke4RJHOCHmROlz+XXocmiHwij8xT+02caGQ/yduiiFqTe0hOLQs5bjJpXgsDqekG5aEuvZCe3YxXozl2f3zsdaShjXg880DWW+12YPTXr7soBo=
Received: from BL1PR13CA0110.namprd13.prod.outlook.com (2603:10b6:208:2b9::25)
 by SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 9 May
 2025 16:28:58 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::a7) by BL1PR13CA0110.outlook.office365.com
 (2603:10b6:208:2b9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:58 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:56 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 09/20] x86/bugs: Add attack vector controls for SRBDS
Date: Fri, 9 May 2025 11:28:28 -0500
Message-ID: <20250509162839.3057217-10-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR12MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b24c9e-26d6-4bdf-2d0d-08dd8f169964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?88YHTLuI49xbWAdTvo7ViZdlgp8RmX0HiNnU/GHuVMrM2y7Mb4ZeBshotKF9?=
 =?us-ascii?Q?4Lqv5M6LlnMCH94f/jH9v3lt7qtxAAjCbw7e4Z5svPMfHZEMxxHD0oSvoBae?=
 =?us-ascii?Q?kRNZdcXog3D3FGbTmtxz+mGmPzqYpYM30LrtzfvAPUr5eTKLtZjq/WFUEHor?=
 =?us-ascii?Q?M8J0HEV2frY0uSY1jRGklanfruYS6t4/8wdtfJdCdqdrHCIuDA/piNxPmWEf?=
 =?us-ascii?Q?JDuiC4EU3FQr6HCj7eNk1cM3cDVc+WACp8dtQC0h8wSHgrjFTLd+hdt9oJKD?=
 =?us-ascii?Q?yype8yXpWZHg9jWTMpBzlT/bUDoqBWfC7YRI3J7NegbxVJX2PniEh4gCquO/?=
 =?us-ascii?Q?lLdSEZDeGqGDXjbITFgpJNSnorf4QhutJHYYlTeyndp33iZXggLYoPH1i1P0?=
 =?us-ascii?Q?XVxIMloiwRQiEy8FLzIrYoaMkkRWSicpzZjxH+Vwsx8FrjT1fiDCqurQBlaE?=
 =?us-ascii?Q?ckxKpk8WSn3bFfsOjQjIgMHOLaywv49abo7h4I4sOoGPWAYz25ktx8CNy24S?=
 =?us-ascii?Q?QUldcnY9PiM7Exiki0HU1QvJS/p6XPBbz/kHMfUjxv7HgwL/AU6sqUpqQceV?=
 =?us-ascii?Q?YM2G/3qzjp9kagfPrS3cC5ZmPWOdh72VgX6DzHZR0+OlbWz8/PWqahuIvzdT?=
 =?us-ascii?Q?Y+lQQ93wfc6enERBw7hhgyoRUHGjio88DFObslzi/kNqHgLETO0lHpBeMPW3?=
 =?us-ascii?Q?if4TJeD0B10Ot214UFyJnXuopujD1u3/VVI7ognO7qBm9/n1J7JeZmU8I2rk?=
 =?us-ascii?Q?x8Cozu4zXuJqqL2Z9ileqff05/CyxI7//AqyvMm/bD95nPVpzwAQ44DoB3m2?=
 =?us-ascii?Q?h7YzlGt5CYH1EiHjCAEtAl2rD3TBkXmAIFHyFSdxUTOsoIT9S7bYvKRQFnG+?=
 =?us-ascii?Q?DAofE0YViBphu09YilDcwSmJjOaOVSzMLV5Jsd8YhONoCYopduhx/L5uALTO?=
 =?us-ascii?Q?T+HAMo6/Ec9z68lFfGvXbsVBFLnzJo9S1mhG12XZFe3Qu6R2X5xWJGiSXRlZ?=
 =?us-ascii?Q?UnQ6RmumbMb7g7VQVKf8AH4el4pZPYPnANZz6vTNNhpOJwAqojEXSeJWMX3m?=
 =?us-ascii?Q?vBqnK3jbLW+xJQOZ7YV5sj1DXFCHWmAJ7Olbuynwkh9S92aH41zrzar92Nwx?=
 =?us-ascii?Q?ahw9KHVN9Gq19zv74AvWe5AjP/3cfk0xeY2d0xxfliroS67Ki1jR6TiJlT5y?=
 =?us-ascii?Q?0yCOyAiMjDJ4k8+Rz66vIXyt/dXKXDiyr12eUGA0DJjq7Qr3YD/I/HAWKZKF?=
 =?us-ascii?Q?4qbfmgAxO+S39NUTrHeJceNZzeDitNPMrZsuG+VWy8dzCzEFscGFa6b9QOzE?=
 =?us-ascii?Q?AwTiSvzqr8X/2r4BLWlba3rouyOmN6qiNJ5NkWT8s1mZe5xuAfPEhWcNZL9o?=
 =?us-ascii?Q?Yt4WnKQzWNEGxD1X0kLjT8XA45S5qAKX64I2iEG3ps+3/v/EwCJ8CkaIeANV?=
 =?us-ascii?Q?j0Rus0h0NgwD18TsevzxnbGDeS9LpYTLWpduQ49obCqa5dz1cPZSwHnWv2aJ?=
 =?us-ascii?Q?GAPmu4QOJ8mCrBu3RbAXIbReRT04wb4WJ+dK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:58.1578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b24c9e-26d6-4bdf-2d0d-08dd8f169964
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8144

Use attack vector controls to determine if SRBDS mitigation is required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index e807176bc845..237ef8d0980a 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -848,13 +848,19 @@ void update_srbds_msr(void)
 
 static void __init srbds_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_SRBDS) || cpu_mitigations_off()) {
+	if (!boot_cpu_has_bug(X86_BUG_SRBDS)) {
 		srbds_mitigation = SRBDS_MITIGATION_OFF;
 		return;
 	}
 
-	if (srbds_mitigation == SRBDS_MITIGATION_AUTO)
-		srbds_mitigation = SRBDS_MITIGATION_FULL;
+	if (srbds_mitigation == SRBDS_MITIGATION_AUTO) {
+		if (should_mitigate_vuln(X86_BUG_SRBDS))
+			srbds_mitigation = SRBDS_MITIGATION_FULL;
+		else {
+			srbds_mitigation = SRBDS_MITIGATION_OFF;
+			return;
+		}
+	}
 
 	/*
 	 * Check to see if this is one of the MDS_NO systems supporting TSX that
-- 
2.34.1

