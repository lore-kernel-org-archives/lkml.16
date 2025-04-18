Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCAA2101BD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993060; cv=fail; b=YDueOALNVcTVF8z4qut+CY9JvfSwGRI4huCaSt9Xc0swn/nR3fIqo71AqBRtZAjosD59RvBBPMBTVYEPIJAax/09Oz1r5xsMPr7js1jrx0dFJZ8B9XCNLFaLV1OkBPj6AQia4hqXY7YvMAicil1UzJz48bzuw6kcmgxLRZby4zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993060; c=relaxed/simple;
	bh=fty9OlrIx/fpOj6iVlmYBkx84XPBF32CXhf16afDUpA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuYS4ufMxMm998wxKDL+KEiSxa/LuJiHR3EPsLxao/iMJFlNm72Q9h/K/dsq+vJh89cunqpMdwun2Pf2DxjC4blI3WyYN1sWBnxjey2+x11ZPbePXyWSCFIr3uWPshjauvRsEIT1s/NpKA1Jk2kyHfvOYZyI96wVdzyiz49wpXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1mH9+w67; arc=fail smtp.client-ip=40.107.102.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1mH9+w67"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR5H16FLxPA6+2Lz4+Z6r8flB17KKpnw24RScTGyQ/5M1ro2cdkDEHROrt0GlMTPmx1fYw676L1ggZXZ/f+5eJ+DNU5yxFV3Eljvdrs/KmbtojKD+eyM1kNzeJU4GGdGBEdvusXKq2g9U2nFOOHCP5ey5vkcZuL5kw4JdnHh8LuakWgx59Qfdym/WdlYKZnK19LsjIcx1nnjp3XZ18AgjapZcKZUmSk9GZQiQYWrjM9JNSwdBzeP9dw6XDWoVUFpu9hOwu7ltbs6L13Gj15iHQb7bEaojAbPsYUumkUELkvhg3TLVWuZg0jpoRjvHcR+wrt40pA577acvhjQ5JItqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7reZJ6fWZZne3TJrLf3zTxxP9MAvx/A5reF4heMvBA=;
 b=r65jTtdhZD1OTO/JsAFXP2zbaPIgyk3gcSban1F87A+xOjKn9ixWKVcH4hwae6VZOS6eyTySE2/vhXtEtOJQTNBV2Xe/qZKVT4HzB48iRVukg0Ln4WYTblg0d3BkUY6xy/UtqxVuHCHeUPV8rhKuBgP/10efkccckhIVBs6pc7WgWF5Ag7aZuxy7m2t54E6Lyl2bH0zbYtj0KafNeD5ImCk0z2DsDAJf3K9WJRaDM9xfKep7057ZTmbBDW/YKxGywJFk2Y6nyip8gbWtnRcsJdU+sAKfXKpaObFLyhPi5tikplb2urB+uaJbrGJFQI7YG6axNMw12J1/GTRZb+iSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7reZJ6fWZZne3TJrLf3zTxxP9MAvx/A5reF4heMvBA=;
 b=1mH9+w67srC4w12CPpNTB+AGtvbVBQHvCsdnVxjBNek7H+Dp7jIbs7ymF43ku/7tiYKD3yDxwPtDErzXH5Al7+ql3gmZ01sOSs00PVadaDOMiA/oqRXGo9rpEmfZipiw7CExjcCnuK9z9j9q6g1m5KuMFKYwsViAP1XcADlkXzA=
Received: from CH0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::6) by
 SN7PR12MB7276.namprd12.prod.outlook.com (2603:10b6:806:2af::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.30; Fri, 18 Apr 2025 16:17:33 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::3a) by CH0P220CA0008.outlook.office365.com
 (2603:10b6:610:ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Fri,
 18 Apr 2025 16:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:32 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:31 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Date: Fri, 18 Apr 2025 11:17:06 -0500
Message-ID: <20250418161721.1855190-2-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SN7PR12MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8db439-3762-4ee4-e95a-08dd7e948658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ECuKqL2cJHBmuxHwk71CkDB8RHs71zvX0kq+pARYy5JdGQVqhjnKVObE80ZI?=
 =?us-ascii?Q?9PcvH7WB3ArQ8gf0O1PGmIQQ36im+sCFw5VO16s8EO846yQHcd28d2W3g1bI?=
 =?us-ascii?Q?ZbbRr3DnG8GCXrh97dBS3vXa3m8DdSRONkmr6Zq2oZ3PreHv6fIsEBm9lySy?=
 =?us-ascii?Q?oFVxMGK9BKpIKUvt/MRZWYnOGk/v1sj5QQsyXNzewSsyZFfoWF7eZchmDnVP?=
 =?us-ascii?Q?aFlftzoiVkQGufT8bAAE9YBq98hQwURNclFMdlcpR8eH1x4TRT3YWWnL7KCS?=
 =?us-ascii?Q?WRejVk3GirJYxbX9kNJzyCcmfsfVHNo/XvNXQd40MIrIvzLTCq29JkpX7yTo?=
 =?us-ascii?Q?w7O1zLdZuhzW/UVq/7tJjzLQCbuyWxNo3wdB4sRNodv3DkcUeqRtlAHtNJNH?=
 =?us-ascii?Q?q9Z9qnd0V/16QsRXfzBusAdi/WTni+7SpaxXK2958TOCai+MGTfInDx0EdJa?=
 =?us-ascii?Q?kEp5A2/WAlfQ6m/ZIOjc7BILRHwanXhaWgjXLvg6fTnI3XmsIo+HLGaJSFVs?=
 =?us-ascii?Q?qZAadhWQXQZCvFhbiHRnL1nBpjGhGF0Acg1rm54NDrmImBIrfs9rsZHDw1rG?=
 =?us-ascii?Q?Q6erKXjgVK4MKMuqs97UNXR+NB9V6VJ17ST28UeuzJEOBqywKkVKlTlN9oUM?=
 =?us-ascii?Q?/lhGxm4TMc2aQx0RlCS+2o3LRk0ZSkndyEcm+dJ/dd64hgjSwD9YvvzTfVqH?=
 =?us-ascii?Q?4YOnfMh0essBUtegq5Kf9Y0gEqWlhoA5/IO8rzE29asiSdjllpbIM3sPWmu9?=
 =?us-ascii?Q?s/2PZC7wlX6OxH8d0bCGzT1zuGW2L9blXR2X01HlWViB2/wWcDFN9Gvrn/2o?=
 =?us-ascii?Q?cCUH9tT+5YmHPGlQVrraTAz7ibSE0Hp+2Q3fvGjpuL6zG7Wsr7mhB6xRq5DC?=
 =?us-ascii?Q?e3DqSmA4jDKEr78rOiQI9zCF+4eDh1tbWqZJRM8Y1mE2Mt3jta+DX7+9nBqf?=
 =?us-ascii?Q?rTa8hMxhcmwpwI8EfK9cYPI/ePTogM811IMAiTEHnbeozlfp7Hhp5/Ewg/Hx?=
 =?us-ascii?Q?5UHkrXP2SjF7Xx98Pjutvokuwfnjfkrqx8vDOKGus9paGvTJnbK9Uf6/0Vgq?=
 =?us-ascii?Q?oO1J09pPGDjckFUGHF0n4GNp6zAVCCxtIs/A+r5GlKoldIHjrR81cbB70CJb?=
 =?us-ascii?Q?3MstX/S+DeZHgWOtnxm17fJczghot6sA2lfbMp3l40OUmfdMDXIkg6BBlR8J?=
 =?us-ascii?Q?nUPri+7Q/w3SNrYfc+J1UB0JvzUYCPmNnNMdyhNbv6W0qtdZyeWPVfIJRy6z?=
 =?us-ascii?Q?IgDC46DJDudR/LyMWAnwTylmstDcNRcJskf5cy8DGyNzwuzy/P5d2fkwTIGw?=
 =?us-ascii?Q?ZYBYmpYZxdD6tNj9ASOGvE0KOn+H3eQWH/vAAwhTyCrZ+kV7H/OC2sOnixhI?=
 =?us-ascii?Q?Ap2Ay6GcgXNI+rTFHPuwQhHVwkooNMyUzwNXpD5Z3HO9L5hEuzhJo+SaMP41?=
 =?us-ascii?Q?Ex4Bj3WsuBt42yFJLz8ZLKgtw6DesfIg7vOuqjsTtO8EOP0KhH63LtjFqnRE?=
 =?us-ascii?Q?mdKmFX4LAzb58WxG7a5Q3n9iF4v79IY8pGqC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:32.9853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8db439-3762-4ee4-e95a-08dd7e948658
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7276

Restructure MDS mitigation selection to use select/update/apply
functions to create consistent vulnerability handling.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 58 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 9387f5f9de12..4295502ea082 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -34,6 +34,25 @@
 
 #include "cpu.h"
 
+/*
+ * Speculation Vulnerability Handling
+ *
+ * Each vulnerability is handled with the following functions:
+ *   <vuln>_select_mitigation() -- Selects a mitigation to use.  This should
+ *				   take into account all relevant command line
+ *				   options.
+ *   <vuln>_update_mitigation() -- This is called after all vulnerabilities have
+ *				   selected a mitigation, in case the selection
+ *				   may want to change based on other choices
+ *				   made.  This function is optional.
+ *   <vuln>_apply_mitigation() -- Enable the selected mitigation.
+ *
+ * The compile-time mitigation in all cases should be AUTO.  An explicit
+ * command-line option can override AUTO.  If no such option is
+ * provided, <vuln>_select_mitigation() will override AUTO to the best
+ * mitigation option.
+ */
+
 static void __init spectre_v1_select_mitigation(void);
 static void __init spectre_v2_select_mitigation(void);
 static void __init retbleed_select_mitigation(void);
@@ -41,6 +60,8 @@ static void __init spectre_v2_user_select_mitigation(void);
 static void __init ssb_select_mitigation(void);
 static void __init l1tf_select_mitigation(void);
 static void __init mds_select_mitigation(void);
+static void __init mds_update_mitigation(void);
+static void __init mds_apply_mitigation(void);
 static void __init md_clear_update_mitigation(void);
 static void __init md_clear_select_mitigation(void);
 static void __init taa_select_mitigation(void);
@@ -172,6 +193,7 @@ void __init cpu_select_mitigations(void)
 	spectre_v2_user_select_mitigation();
 	ssb_select_mitigation();
 	l1tf_select_mitigation();
+	mds_select_mitigation();
 	md_clear_select_mitigation();
 	srbds_select_mitigation();
 	l1d_flush_select_mitigation();
@@ -182,6 +204,14 @@ void __init cpu_select_mitigations(void)
 	 */
 	srso_select_mitigation();
 	gds_select_mitigation();
+
+	/*
+	 * After mitigations are selected, some may need to update their
+	 * choices.
+	 */
+	mds_update_mitigation();
+
+	mds_apply_mitigation();
 }
 
 /*
@@ -284,6 +314,9 @@ enum rfds_mitigations {
 static enum rfds_mitigations rfds_mitigation __ro_after_init =
 	IS_ENABLED(CONFIG_MITIGATION_RFDS) ? RFDS_MITIGATION_AUTO : RFDS_MITIGATION_OFF;
 
+/* Set if any of MDS/TAA/MMIO/RFDS are going to enable VERW. */
+static bool verw_mitigation_selected __ro_after_init;
+
 static void __init mds_select_mitigation(void)
 {
 	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off()) {
@@ -294,12 +327,34 @@ static void __init mds_select_mitigation(void)
 	if (mds_mitigation == MDS_MITIGATION_AUTO)
 		mds_mitigation = MDS_MITIGATION_FULL;
 
+	if (mds_mitigation == MDS_MITIGATION_OFF)
+		return;
+
+	verw_mitigation_selected = true;
+}
+
+static void __init mds_update_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
+		return;
+
+	/* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */
+	if (verw_mitigation_selected)
+		mds_mitigation = MDS_MITIGATION_FULL;
+
 	if (mds_mitigation == MDS_MITIGATION_FULL) {
 		if (!boot_cpu_has(X86_FEATURE_MD_CLEAR))
 			mds_mitigation = MDS_MITIGATION_VMWERV;
+	}
 
-		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
+	pr_info("%s\n", mds_strings[mds_mitigation]);
+}
 
+static void __init mds_apply_mitigation(void)
+{
+	if (mds_mitigation == MDS_MITIGATION_FULL ||
+	    mds_mitigation == MDS_MITIGATION_VMWERV) {
+		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
 		if (!boot_cpu_has(X86_BUG_MSBDS_ONLY) &&
 		    (mds_nosmt || cpu_mitigations_auto_nosmt()))
 			cpu_smt_disable(false);
@@ -599,7 +654,6 @@ static void __init md_clear_update_mitigation(void)
 
 static void __init md_clear_select_mitigation(void)
 {
-	mds_select_mitigation();
 	taa_select_mitigation();
 	mmio_select_mitigation();
 	rfds_select_mitigation();
-- 
2.34.1

