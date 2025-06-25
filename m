Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4529C33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867105; cv=fail; b=ghtwmVJlL5vP6wFj6TPT+CC3iItTyI7pa6BuN4Uuivsi8E1ZWm29HkONuThLp3IRuOiWK4URVpIvlB8PabKPr6JSNFDW4MgStDa1+KfjxuD4uu5uEKXo5pVbRkOlPqV3/NweK/MD6q7vGI81+PrrDJ5AT4zPoiHFYzj36Myzklo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867105; c=relaxed/simple;
	bh=M41zfocNtqJl0AuJDx+9o3FoHvmno7lzMaHgh7rFYvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DEOSd/hdvlAXXzo6PhbYZTKlrqfreFXQQcadmyMmWhQr2NAAEnfeJd9ZQ/UoBGmPIuKCCPTC01r4EkYJsFoO19atLPGzWYHO1DpF0veXa4wo0tewiONdmbDT48MSgIet8xE82XaKV4q590vfEYwv/W2LpoBldUJAxQf33Z/YhQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WKxa7HGb; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WKxa7HGb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmzxzDBebkdITGWU3+u/48R3LNNNvHaOAh7XpMDUN+8fXuP3kfYyErjkR6m/vI87Fnw9ya3IZ1BhZr7WqGpQTSm6/WO0q/pV09w2ujfpLHjl3S6C3CP86Jqge+XkKiDMupg+T8e0awXeLnK1nwRAmrPahEsf2kGOQD0D4rVoIAraFkOCm2uJfdwh2oYHkdMKyvDBinrkhv1hBrSOA5YA1eHTMSoS6Oj9cTN6qWT34pizxqjZV/pHgKKEWizye9M44f0kF48RWCjLtuLafeAWu0u6s5oWKRwsIjzEr49XGJNrczvGEuVHBSVQmhPKDOCFj6C3F+GtA6Cq5ZenC8JkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJComv1xNJrqZwVaI5/VkjS4dMvzutrNpjD5xjg/Ycg=;
 b=p8nwhnOSdliBs0eY0v6PJmPSbNW/WKXpQGY90hTYY3m6i4bA7kVKbjl0eydDhvE8qwPbpUbaRa+BReP4Lbvch2GeFP6WfN0mp+iDBgkG2G6iaZ9m3gX9ytrlvjmGJtEkdng5d+jBB1Y1+k4TiizpZanDHUuHypsqajxt/wylBhK6A9giVM6yZbaM4P/AVAmoXaym+DFDbv2bZszSbNKsbsTDSqDxvr4jgy6ZQj/ZnXExSQFjVS2LiuOP0Iz0tfczatfx970bZLzodzgUMbcSh9XWMI242Jzo0D2YRgcsX6nU/zZKMlGnC7VJeDcxZBcq1zpEAwtpQIvUCptElmgDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJComv1xNJrqZwVaI5/VkjS4dMvzutrNpjD5xjg/Ycg=;
 b=WKxa7HGbHHG1LDQKrRUTJOydgXIYfEdNbGCORYv/a6COkpfW1Ou9En3iOy3f3rH5LQ/5/7QsOcMHCpfdP+qQF7vqhccO7BApckskR8owV/dHMvfc6l0vQvQp3dZQ8GlrZBi/3dQ+YZi47F47qAn9MagA/4m0bNf2AUfQdw98NMY=
Received: from BN8PR04CA0032.namprd04.prod.outlook.com (2603:10b6:408:70::45)
 by BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 15:58:20 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:70:cafe::ea) by BN8PR04CA0032.outlook.office365.com
 (2603:10b6:408:70::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 15:58:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 15:58:20 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 10:58:17 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] x86/bugs: Clean up SRSO ucode handling
Date: Wed, 25 Jun 2025 10:58:05 -0500
Message-ID: <20250625155805.600376-4-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625155805.600376-1-david.kaplan@amd.com>
References: <20250625155805.600376-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e756d6-9ac3-421e-0256-08ddb4011b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V9/dQTZO8ZsOFTX46wSKduu1svs1ES1PLlkbhTeSDB9YOKPtGwjj+FD8KVNi?=
 =?us-ascii?Q?or9XVBw+JI56RMpWg61N3I8DqugCAjfoTHa6v0tbcw3AG8B/Cbi0RM/l+T7+?=
 =?us-ascii?Q?QVRvguoNWkQ11iSAqK+NnRRSf2lJgTc5lfRxyNSlVONAhyYx8ymiZ7r/t9VH?=
 =?us-ascii?Q?ew55jxFlQGE8F/8rc3fWDSB3AuMFy58X5mT3bLndWSbfowgHteLOY6UZ5oms?=
 =?us-ascii?Q?maewRRTrp3qOExhRsI9zYPFLw8B35apQLirmmW5N/VCevJsOebjs3D+vcay0?=
 =?us-ascii?Q?7jBv++XVQfYmIM6U3DUh3kToKFZS7BDRQLlVvDJOAi0EgRVRxmJA77GIjKEf?=
 =?us-ascii?Q?Y/7D7UjDcSI9xMPZM/qySHwC18HBbZywWp6Hwo47r+6RaJdwAeDKEQ/yqc6l?=
 =?us-ascii?Q?rU+7S40Z2fHTLLEH9eE/s4AobMk/hcXFDCq9ynIZVVSz2KIQ3iU5XDbADPIL?=
 =?us-ascii?Q?pUfIW43QFgyCJ4it/5S/qSFLCm9fNpVulQrsZ4FGRhtaS9/yTQzOPcdCeoO4?=
 =?us-ascii?Q?RskbeKdtRchlLUdCrNt+96UwI1MkJ6b9hLQO6gDLCtNvKgak2cUSXL5EKkyG?=
 =?us-ascii?Q?jehjNIvFBUnnnweiuy9KWTSJjRWrqTY51ZWakfZIhjuhTGqc8DhTlLXfERi3?=
 =?us-ascii?Q?vQw1xrGL/BgOAFZNuuwk2k+eYPf0jqxw2i+sNIyLSHYoSybpiZH7TvW827Wh?=
 =?us-ascii?Q?k08qenHQXeNzVsaTqdZkYP6XQ9biFqIG97nGwZE3nXGiN/U7mZksO9aUDR6z?=
 =?us-ascii?Q?0MUaw0nwJcNa+nuB+uqz0WaxyQvE7Vcgg5+2SeIeTa7KBgdUchXVDzpJKyMI?=
 =?us-ascii?Q?b1i7UzGwSjh9LWyRU9qrPJ9fZUVpxv0DfxMIc7elmawjeonBbp2eDdUsDHLG?=
 =?us-ascii?Q?VSPnEP2qO6JzF3IXgqA0EK/AvWAHXVcmD9AmJRK3tw91fbetEreDOiDb+Oow?=
 =?us-ascii?Q?1mmGXAWDG4r31RTZIXP+fcfmnWdiM6ob2R/5uscT+SGm3Vd9qkgv79QTUb1x?=
 =?us-ascii?Q?1aR8LLQTME67BOstJSlrCaH4uSJNdXNKwJuMmIXmOQf1EPv73fVrN8nPporO?=
 =?us-ascii?Q?32I314Ug3FskUJGH/MMOG8Q+QivcH1OWbv/rb/VUsvyvpNc14nTj7MzJPi8R?=
 =?us-ascii?Q?x/CA5tAEna0pJTR+294MX39Vex4NN1X6WGWm0hZph+0D33s3tB5uCeR4ysQv?=
 =?us-ascii?Q?0QykpSHp4BcZZWH834hXeCyjZb0zvfDpSOAeFY5R2jFZIveUTUG0qJF407lw?=
 =?us-ascii?Q?09sVddKzIkhKMCGtIXaOfJ9RFVB2l2Bb+/cvJqNPvUjfrB6sm2L13srPWnGf?=
 =?us-ascii?Q?/IYsHgyjxNgP+kDNouLsa5MZ4qm7NnMTxN2KcGrx5nrRk+DkcUSrRTVkPdJO?=
 =?us-ascii?Q?6pIG3ixxdmPLVuJM7UX3a1h8AJnzp0zfJu2OA+QSdmwJf3N8hUExH2HFsvbN?=
 =?us-ascii?Q?cknYzZBR7i2+INCONueoEwugudhjb6kNMs2ry3X+a1FZ1A7cZFYzAVWf9Mi8?=
 =?us-ascii?Q?EE3zPG98ztSk/VW0cRNgPaL0E6djTHoXd/tw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:58:20.2749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e756d6-9ac3-421e-0256-08ddb4011b58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533

SRSO ucode only exists for Zen3/Zen4 CPUs.  For those CPUs, the ucode is
required for any mitigation other than Safe-RET to be effective.  Safe-RET
can still protect user->kernel and guest->host attacks without ucode.

Clarify this in the code and ensure that SRSO_MITIGATION_UCODE_NEEDED is
selected for any mitigation besides Safe-RET if the required ucode isn't
present.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index b26341983230..e2a8a21efb10 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2902,8 +2902,6 @@ early_param("spec_rstack_overflow", srso_parse_cmdline);
 
 static void __init srso_select_mitigation(void)
 {
-	bool has_microcode;
-
 	if (!boot_cpu_has_bug(X86_BUG_SRSO) || cpu_mitigations_off())
 		srso_mitigation = SRSO_MITIGATION_NONE;
 
@@ -2913,23 +2911,30 @@ static void __init srso_select_mitigation(void)
 	if (srso_mitigation == SRSO_MITIGATION_AUTO)
 		srso_mitigation = SRSO_MITIGATION_SAFE_RET;
 
-	has_microcode = boot_cpu_has(X86_FEATURE_IBPB_BRTYPE);
-	if (has_microcode) {
-		/*
-		 * Zen1/2 with SMT off aren't vulnerable after the right
-		 * IBPB microcode has been applied.
-		 */
-		if (boot_cpu_data.x86 < 0x19 && !cpu_smt_possible()) {
-			srso_mitigation = SRSO_MITIGATION_NOSMT;
-			return;
-		}
-	} else {
+	/* Zen1/2 with SMT off aren't vulnerable to SRSO. */
+	if (boot_cpu_data.x86 < 0x19 && !cpu_smt_possible()) {
+		srso_mitigation = SRSO_MITIGATION_NOSMT;
+		return;
+	}
+
+	if (!boot_cpu_has(X86_FEATURE_IBPB_BRTYPE)) {
 		pr_warn("IBPB-extending microcode not applied!\n");
 		pr_warn(SRSO_NOTICE);
+
+		/*
+		 * Safe-RET provides partial mitigation without microcode, but
+		 * other mitigations require microcode to provide any
+		 * mitigations.
+		 */
+		if (srso_mitigation == SRSO_MITIGATION_SAFE_RET)
+			srso_mitigation = SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED;
+		else
+			srso_mitigation = SRSO_MITIGATION_UCODE_NEEDED;
 	}
 
 	switch (srso_mitigation) {
 	case SRSO_MITIGATION_SAFE_RET:
+	case SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED:
 		if (boot_cpu_has(X86_FEATURE_SRSO_USER_KERNEL_NO)) {
 			srso_mitigation = SRSO_MITIGATION_IBPB_ON_VMEXIT;
 			goto ibpb_on_vmexit;
@@ -2939,9 +2944,6 @@ static void __init srso_select_mitigation(void)
 			pr_err("WARNING: kernel not compiled with MITIGATION_SRSO.\n");
 			srso_mitigation = SRSO_MITIGATION_NONE;
 		}
-
-		if (!has_microcode)
-			srso_mitigation = SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED;
 		break;
 ibpb_on_vmexit:
 	case SRSO_MITIGATION_IBPB_ON_VMEXIT:
@@ -2956,9 +2958,6 @@ static void __init srso_select_mitigation(void)
 			pr_err("WARNING: kernel not compiled with MITIGATION_IBPB_ENTRY.\n");
 			srso_mitigation = SRSO_MITIGATION_NONE;
 		}
-
-		if (!has_microcode)
-			srso_mitigation = SRSO_MITIGATION_UCODE_NEEDED;
 		break;
 	default:
 		break;
-- 
2.34.1

