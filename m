Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB99215191
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993062; cv=fail; b=LHzA9pm0yBU26t/AlI22EuIyluwbUlrtPDarn1dhaRyAlPMWzExvmD4+7w2OzUSAJq6ZaPEheLM7w6IQG+kBwrbUvz1wxaEHiNRuMVYEYEaQQw1q7ZIkVictS1ZOfckgLsLnTlCxUjcNnEpFlQXXL/7GXHEVy39tb51Tl6Nom2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993062; c=relaxed/simple;
	bh=CBhMwVu3YEgv8NKYDwJJSGtwbCKLtq2WHl5kLLSt/l0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/f7+vxwanl5X94imHiT8wu/+AEkNR8tQhlM2ee1IIsFG5jn+W+dZ7XqDkF2aQUfey3fQuUlR6bMIHBRKpCpg6BdHY73P/GvSaQ0LwEc21gJkGSlU0Y5FDE5CWKuvjUaH0Z3aFESwSk3p95livwhPr9mjM7AktS6ccE9oLNckMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0ff7l9R3; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0ff7l9R3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMU+29Fofg2CflO4A+YdScmfKNz6anqcgAFaydOyxBNNSAFMCrNxFWCyA9CsU6Hmj7uYng0gnljpcJOaPHDV4K56ZZYR7YZmu9FhpTJNmss3GIz1QIkIHzrd1A3nH5U5/hjXYxZkA2DKxEGlqSO27GIece9b3A/8kCNB8zJl1YaSqmhfEoMhS5cu8gOllTycKNegK7qp4C8a9YVpoAzWdfM1wE9wPY8YDCRi4gOjBOK8xR1ILAtGoyo/VGAWOHpx3GhSbiRlM4d52Pfc951hNyJK67s8IND67pJg0BwUhjtsJWORTmBmMAGxTrscZtwW3WjWaA3wGz2Js8Op22SPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xtGFPoyBeGAxR1RaCQNaPNehQgV095XpKGo91nGxWM=;
 b=kka7OAcyK6rUgTXUZ57KeUF6f6/zSDRA0DRnzb/KSn7jjA3JwKTYBtqZvgBOUMRhAA2E52XTEznKz6zReckr0W4ka552tBa7+tmQyxH+2jmUCVUXzdSKBi1b+WexDohvjFqVSyXEnGqqmj8BnPpb3nx1t0ejU56D/Jjai/TfgG6eOxb+VqWftxLNoKWn3k4PwalDek9hnEOr6UaU84i5lgQHhHzU5S//tvI0/ncTwDQhflMPFEz+92+bBcjnCm4Wi+bOwj2unPD9DQG2jQ49TEL70Lpkrr4x+a0E9V4GGBz1Gra6YYJarmWjwL0naJEgZPdJqZ31onmhny3ejcxjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xtGFPoyBeGAxR1RaCQNaPNehQgV095XpKGo91nGxWM=;
 b=0ff7l9R3lK9x7N95dEWt39xDVJA8ZhC016+8ii5IhieHLGr8V2FfXNuum0mqLRQrRcgFd2Q2zm0qAGfrhiCm35N0WAS5LT3eZTV0uH/5y+HR+60vLhr80iDHtZQ+jPS79YI3KV8ff5ii1jhjfiT12+hfoldMApHEHlAurUlov4U=
Received: from CH0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::24)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Fri, 18 Apr
 2025 16:17:38 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::77) by CH0P220CA0022.outlook.office365.com
 (2603:10b6:610:ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:37 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:35 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 08/16] x86/bugs: Restructure spectre_v1 mitigation
Date: Fri, 18 Apr 2025 11:17:13 -0500
Message-ID: <20250418161721.1855190-9-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418161721.1855190-1-david.kaplan@amd.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3874364f-7443-4a16-137b-08dd7e948928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjppiR8e/5t8TejLu+b/DiZMtFQcrE8OAznpi2hG+Vc4x2NVCDWYLf4sQfV1?=
 =?us-ascii?Q?8CMR1AnYl1kTrSomSRsMqA+ffur7BWK3Wb0Y2nr43BM/HnMMOxcA2Y3vV3BM?=
 =?us-ascii?Q?L1t+B7AZmqI13ppLOwmc7GS+Z0oAR3lN1t9oc5hHQK5bc8P1WK2HkO1Rxs3/?=
 =?us-ascii?Q?VRSUV7oSkfsUjmHo11pMNEskLRviVqfrPXAUlUX+niQ/ddlGTIuNdbRG6YcA?=
 =?us-ascii?Q?8vG6Py0iFooukIqFbqLdxFK2GUtzVp8VOMDsvspZw/TavjhKHmokaX1bo2Cg?=
 =?us-ascii?Q?V63hIMCCqNlFEJAcJRGk1fc8xQc/kBsuJLTjDrUFeC0o2LAfVYbytrNic0X4?=
 =?us-ascii?Q?lHjb01ds2lPWiAx2WrvTDgNAffSxR/yPge2kOBhODFySwQFa9npDcySgBfQl?=
 =?us-ascii?Q?TIHqHE8PNM1qvSr140OYjhm87XD19QzgERR1/PStNCt4zZSF1R7XFzu6eFUp?=
 =?us-ascii?Q?Re9bWmeLv7hD2dBxfesMawu7vfjAP9k2wQbO1TzR4oF8JN92xhJ8b1usN0qJ?=
 =?us-ascii?Q?V7cwqyfSWfzpqr9cFTBX5UKl6pcgGOSAw/iGMRGBUd4HSdPFmEKX7vZ4tqod?=
 =?us-ascii?Q?O1Tjj+UnWO02YUC3GMBscRCJyhVS+bXu7GHB3N5IVovtE494bOThpslIS1P9?=
 =?us-ascii?Q?gKYBsMr3d/9PUNNo0I1le0yXwv4BkK2Cj3+HF/4fI8GhQHpuqsIYABzgCTQf?=
 =?us-ascii?Q?ECjD7e4jd0qqwxuFvJmIAqkTC+jAjj1gzZfYwMkEDQ1eCxDXiVS/f9zjCmkg?=
 =?us-ascii?Q?zuHQA2rqDRDKsWEyJI/hf53LxRu4LUrJBEH092++CW50GoHwP1PWp5pSOQZm?=
 =?us-ascii?Q?JoFLKE9GXfDobfimTVMqt5KnchwN+Sc8CFYNA/1AA7vqyBbJVHHwm0pDOFK3?=
 =?us-ascii?Q?e03nPXvP67pqqrA1KpkxYYRIokkjNO3kEV9YQmFl+NgNQjIQ31jmDxD106Ql?=
 =?us-ascii?Q?Pn54SGEV1tNCzrtFpywNyVjH6fZ9UjWmb+v8COUlZWLv2XOiiCfKbU45ENXe?=
 =?us-ascii?Q?jrMT0qzp8FXrWT7cs8gO8Qw8VkW9CZF/FdZJQwNnMcSRsCHujEPNspHzSEf6?=
 =?us-ascii?Q?c3GDbecCb4J2379WSYIJVx3wSCSgJ7TdNW3IHiIC69F0VXT9P1qXcHAcVYCP?=
 =?us-ascii?Q?8Xb9uf81x53i9VyFqfOuatYswVh1sX1swRZllFvF1yGXhYXv48sqbrjDVR2H?=
 =?us-ascii?Q?yNTwm0EwxB4rViq5BOtJ5aMnt8IHCr1UC90Dh6UyZLXJt+4VsWQpOgDCS58M?=
 =?us-ascii?Q?piirTVIhOF13qxB6xpdtRl6UyHRmRzNTEbe2tzmFV2BquZ2uf5Zr7GCnFkm7?=
 =?us-ascii?Q?qGJkv+vYS+FNKTQdcGA/A1vlwvej93rJWMpzqA84Ldstqlv320NnhzEtB6LH?=
 =?us-ascii?Q?OOz5zfbkb90UEbvW6Hl7dGvEX0jltcqal0Ah8rBIeok1AyWLisHZGDc0M6p8?=
 =?us-ascii?Q?KfL2LHRan9zPxGJOQ6YwdmoDz0It/k/b7tihLgufaqceAQLUz/hqOEMgezYW?=
 =?us-ascii?Q?EQC/MDqpG1RGpDfE21yRWZlKbIqquwPvYHNe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:37.7004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3874364f-7443-4a16-137b-08dd7e948928
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605

Restructure spectre_v1 to use select/apply functions to create
consistent vulnerability handling.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 57f9ebf90472..72e04938fdcb 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -54,6 +54,7 @@
  */
 
 static void __init spectre_v1_select_mitigation(void);
+static void __init spectre_v1_apply_mitigation(void);
 static void __init spectre_v2_select_mitigation(void);
 static void __init retbleed_select_mitigation(void);
 static void __init spectre_v2_user_select_mitigation(void);
@@ -223,6 +224,7 @@ void __init cpu_select_mitigations(void)
 	mmio_update_mitigation();
 	rfds_update_mitigation();
 
+	spectre_v1_apply_mitigation();
 	mds_apply_mitigation();
 	taa_apply_mitigation();
 	mmio_apply_mitigation();
@@ -1017,10 +1019,14 @@ static bool smap_works_speculatively(void)
 
 static void __init spectre_v1_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V1) || cpu_mitigations_off()) {
+	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V1) || cpu_mitigations_off())
 		spectre_v1_mitigation = SPECTRE_V1_MITIGATION_NONE;
+}
+
+static void __init spectre_v1_apply_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V1) || cpu_mitigations_off())
 		return;
-	}
 
 	if (spectre_v1_mitigation == SPECTRE_V1_MITIGATION_AUTO) {
 		/*
-- 
2.34.1

