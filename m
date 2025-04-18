Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F422A4E6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993071; cv=fail; b=NNKP9VkGu61eeu1EyJ8Bl7g0/qobyKaRghnid7/MkFQe/qLJ4BkOpYNoYDG6Bj8DPncLLA3KV6Poz9G3mAoVaIyg6c+s9z+PBoUTlqzXfOqRGPkrukxdzBht/Q6NlnQSpUkzM8fOOXrQjHGrMlEztBYtvL0aMAA+w+GJ0zINAac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993071; c=relaxed/simple;
	bh=DQvOfo8t7TDenDPkFIcVdzXEPG3STtAPnjGvsrkfcp8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9o9/gcrqrtGBOUNwERHKxLIs/Cig1rsv54boE59IDe+muaQkuZg8sjEMqDPqkS1UiVWTZUtnX/Bf9/mJTcRyxydcIPriru9u+OBoOq13MkpXF51k1/2qIeuA4TTa696BGjdl5e4WX+AMyCqYfvGI3sQ18XnqG3Vi5lHosJY+Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rnQpJ84i; arc=fail smtp.client-ip=40.107.93.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rnQpJ84i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgB2Mr/rEmJnYEzPn7XYIOdRlzgKCJK6oCW74i0SYc04lqDGvpNUqRdWXYmBXzJSyEoNpykn6LFb5Ug+TzWOTPWBHw642KClhGeXEP5Vo+47hyvtx9Hzr1p4qp0YYaMfbrJ38VEFvwfLcRzzlKljhze4V7VeW7NqizkJonoCHaQNa7necqhth45lK7oCd04Wc4MXWE4u3Wp6UFby0afquYKZmUX7gW9nMy8bJY0MgVsnP3s0V3xchXDThhNLY2sO8g8fSnOrR24dBKnPz9alZBRKIzA+YiO8KaAAIk20L6+cHl7J8KBqNH4RxuDZ9HMLY59VIzfYxoVwaqcAZFhlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1HN7Y5qtZzRBQ83vfYgRP67JShEHlYvn+lR4IhYG2s=;
 b=x+jqnMIAl2A+Pg5Y2ITqaKaSTCvBV1DUdnZOPZ+3vIbXAMoimA/hVfoUSlpemY6Oh+/3Ov4WUkVIttaNTd5I1m9DAzpL03V3GRinyBlcbY2LDRp+zqwB+z7DReeQNdG37oXlmXepuawRtl+zPzxJ46xOpXNP8lET4lhS/vgwb8jXRfSMZ0V2TLkzZ1VfA0NhytHJBLCoCg1pQxeRxzN8szaA5irpwQMHBvU8rpMCOeIuTDQ8GvvjOMkck2NpAbgjYBF/0ZErRR974v+qD9a5zukvsGMU3APFBqG2wbDNbOetiqLKK7hiJxeHUV7wua6QIB/AagCo690EUZc9t4kcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1HN7Y5qtZzRBQ83vfYgRP67JShEHlYvn+lR4IhYG2s=;
 b=rnQpJ84iY5PNTQ3Gwx5JAsDbWK4iHay+q2nrf0r1VcY0SapzE1LF7rcGMUnxjaIaYNUiYy/PK8qQmWClsQoWxsAWLVDgAXsHnTGBAHJV3EeAKvWC9U414wP8eUNbVO38YOFvzWt/vqkhdjZQqNiA5cb5Wti+RqwhssRFo6zWZA4=
Received: from CH0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::19)
 by DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Fri, 18 Apr
 2025 16:17:45 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::dd) by CH0P220CA0001.outlook.office365.com
 (2603:10b6:610:ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:45 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:40 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 16/16] x86/bugs: Restructure SRSO mitigation
Date: Fri, 18 Apr 2025 11:17:21 -0500
Message-ID: <20250418161721.1855190-17-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DM3PR12MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e79413-2245-473c-8dfa-08dd7e948d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VsalWUfc2TYmQO2uqEATSMkMIepaLU12pltEkRSNWQLUnQi/2zVbhzYpnUXg?=
 =?us-ascii?Q?+IpVChX5RDkQFtOYue6Lr4ltjodDOnBmTeIaiEin0RD6g+WI4Z146PDXymui?=
 =?us-ascii?Q?RxOuysw5dogAGEb/EwVZ93InK9dYIK7RY+w/4g5hb6QSexxxPLkNg/nIxwpP?=
 =?us-ascii?Q?Nn8+U0pKhni579oB/ZRGdaBLULU3a8LfLEMNxwZ0BVNuBHW+pHjIYr7BdIF2?=
 =?us-ascii?Q?Qpwar3f6naI6MSvdKTMp/a8OldU0YjXoCm1YwEdMUyVlwhS3qnmyI4zL/4tG?=
 =?us-ascii?Q?uDhK5dSn554Wxlb/fgueBPe396uFGaJ9XRgM/YIcM4ZxacFoqakfgdERa+Xy?=
 =?us-ascii?Q?GoLnldprmjk8NR6Dx17CJ+WIXUXivL1wAIGEPdhJYTt79AJM4TDEoYmhC0Ug?=
 =?us-ascii?Q?6PalTTk9uZBIvHJcyfukkqRnlz4AESOk2hFbsDcSE7x9oj93T21zb+erQ+Mr?=
 =?us-ascii?Q?Jav4+OQjkUIpijqTLyOEEBfuj0lU5WfCFQnO1KSOgh+Gung1pA1+VmKXFNI4?=
 =?us-ascii?Q?YZV7lCsHPAqQMN4o0jxhq49nM32xpGZNPV8vVoHrcg09nbPymn66xhn6DfIq?=
 =?us-ascii?Q?PllCyWPMPLTwzZt6dlJZW+Dz8h2CoQx/gLW4H2pbRqfEnVyBflyG423AYuoW?=
 =?us-ascii?Q?SrPA3z9b0vnCMVADF9zAYKLN5t6ZRCvDA/ROQDt0NIkOt8RDmYbCzhYY2cml?=
 =?us-ascii?Q?Oxq07Ds8ye3gVJW7+kMv5Hjty+zI1c4hk0x5nUbnvaGi77ZKPVsHjibHCEs0?=
 =?us-ascii?Q?nsY2OOBcElZiHcB2pARR71mGJfaK8LAaIZi5PPj9wG7L+QOPiCIna9j3x4Lj?=
 =?us-ascii?Q?XSuTlTkBS97NILyt60McIC7AORf5Fo03YNelKMrqq0DkT2yoMF4XWkOvk33I?=
 =?us-ascii?Q?hZNaMqrdxR6dQBunpy+3XyJTu3GEA28tvNWggfMFE+06EWD5K1GPcjxP6Bfr?=
 =?us-ascii?Q?k4E1dEGANNiZKehePHCc9Eq5sZNzBf0MaxkxMj05OSltVSbjqLU43iHb7EWd?=
 =?us-ascii?Q?l6DSu1zSDOhFA1EHAomDHo5QOpSTt3hx2LcLnIYW92l4Aw94jqxXorfaSHE/?=
 =?us-ascii?Q?ClevEwH7DGKgJx+CaMwvyHQ+0/M9QryUno/ZAm3hrSa1HCUWu8gEk98UiwmS?=
 =?us-ascii?Q?20Oclg9MQHjg9XWXTmkby9YnGEkA0cyOAKZk2CkSPmIOXHndbfN5n/1X8UC8?=
 =?us-ascii?Q?xUHzQD6rTAfMl/x/gLG5xRg8rXtVMX9d1yO1CkYKLtwPL6clpkz2BMjR2vnu?=
 =?us-ascii?Q?+auZEA/l7NvzsfpbfguoDa0M/AsyT60kCplGgQKT5pm9jkbyj9cX6blrDqvV?=
 =?us-ascii?Q?LTlXXx5H66N6tzKB0jvF87AIycu3ErVnGMFR8OJl66snamWWDn41QVTFhCeH?=
 =?us-ascii?Q?WYLepiir1XbDuSk+oepqHTMwvEvb6u2UxiEnPTDyG65Ve5sex91XfbScXpco?=
 =?us-ascii?Q?d86dX11TDHEE50c9MXJ3c95c0ZOzYCiMRMVZIkfRHAwly7tTAi43j57fW4+4?=
 =?us-ascii?Q?ednEbCYO6SXIn3+QdAPLgE67wIaLc7LHFpxv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:45.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e79413-2245-473c-8dfa-08dd7e948d86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434

Restructure SRSO to use select/update/apply functions to create
consistent vulnerability handling.  Like with retbleed, the command line
options directly select mitigations which can later be modified.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 212 +++++++++++++++++--------------------
 1 file changed, 99 insertions(+), 113 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 5f718537ba70..85d27ba2c83c 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -84,6 +84,8 @@ static void __init srbds_select_mitigation(void);
 static void __init srbds_apply_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
+static void __init srso_update_mitigation(void);
+static void __init srso_apply_mitigation(void);
 static void __init gds_select_mitigation(void);
 static void __init gds_apply_mitigation(void);
 static void __init bhi_select_mitigation(void);
@@ -208,11 +210,6 @@ void __init cpu_select_mitigations(void)
 	rfds_select_mitigation();
 	srbds_select_mitigation();
 	l1d_flush_select_mitigation();
-
-	/*
-	 * srso_select_mitigation() depends and must run after
-	 * retbleed_select_mitigation().
-	 */
 	srso_select_mitigation();
 	gds_select_mitigation();
 	bhi_select_mitigation();
@@ -238,6 +235,8 @@ void __init cpu_select_mitigations(void)
 	mmio_update_mitigation();
 	rfds_update_mitigation();
 	bhi_update_mitigation();
+	/* srso_update_mitigation() depends on retbleed_update_mitigation(). */
+	srso_update_mitigation();
 
 	spectre_v1_apply_mitigation();
 	spectre_v2_apply_mitigation();
@@ -250,6 +249,7 @@ void __init cpu_select_mitigations(void)
 	mmio_apply_mitigation();
 	rfds_apply_mitigation();
 	srbds_apply_mitigation();
+	srso_apply_mitigation();
 	gds_apply_mitigation();
 	bhi_apply_mitigation();
 }
@@ -2679,6 +2679,7 @@ early_param("l1tf", l1tf_cmdline);
 
 enum srso_mitigation {
 	SRSO_MITIGATION_NONE,
+	SRSO_MITIGATION_AUTO,
 	SRSO_MITIGATION_UCODE_NEEDED,
 	SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED,
 	SRSO_MITIGATION_MICROCODE,
@@ -2688,14 +2689,6 @@ enum srso_mitigation {
 	SRSO_MITIGATION_BP_SPEC_REDUCE,
 };
 
-enum srso_mitigation_cmd {
-	SRSO_CMD_OFF,
-	SRSO_CMD_MICROCODE,
-	SRSO_CMD_SAFE_RET,
-	SRSO_CMD_IBPB,
-	SRSO_CMD_IBPB_ON_VMEXIT,
-};
-
 static const char * const srso_strings[] = {
 	[SRSO_MITIGATION_NONE]			= "Vulnerable",
 	[SRSO_MITIGATION_UCODE_NEEDED]		= "Vulnerable: No microcode",
@@ -2707,8 +2700,7 @@ static const char * const srso_strings[] = {
 	[SRSO_MITIGATION_BP_SPEC_REDUCE]	= "Mitigation: Reduced Speculation"
 };
 
-static enum srso_mitigation srso_mitigation __ro_after_init = SRSO_MITIGATION_NONE;
-static enum srso_mitigation_cmd srso_cmd __ro_after_init = SRSO_CMD_SAFE_RET;
+static enum srso_mitigation srso_mitigation __ro_after_init = SRSO_MITIGATION_AUTO;
 
 static int __init srso_parse_cmdline(char *str)
 {
@@ -2716,15 +2708,15 @@ static int __init srso_parse_cmdline(char *str)
 		return -EINVAL;
 
 	if (!strcmp(str, "off"))
-		srso_cmd = SRSO_CMD_OFF;
+		srso_mitigation = SRSO_MITIGATION_NONE;
 	else if (!strcmp(str, "microcode"))
-		srso_cmd = SRSO_CMD_MICROCODE;
+		srso_mitigation = SRSO_MITIGATION_MICROCODE;
 	else if (!strcmp(str, "safe-ret"))
-		srso_cmd = SRSO_CMD_SAFE_RET;
+		srso_mitigation = SRSO_MITIGATION_SAFE_RET;
 	else if (!strcmp(str, "ibpb"))
-		srso_cmd = SRSO_CMD_IBPB;
+		srso_mitigation = SRSO_MITIGATION_IBPB;
 	else if (!strcmp(str, "ibpb-vmexit"))
-		srso_cmd = SRSO_CMD_IBPB_ON_VMEXIT;
+		srso_mitigation = SRSO_MITIGATION_IBPB_ON_VMEXIT;
 	else
 		pr_err("Ignoring unknown SRSO option (%s).", str);
 
@@ -2738,130 +2730,80 @@ static void __init srso_select_mitigation(void)
 {
 	bool has_microcode = boot_cpu_has(X86_FEATURE_IBPB_BRTYPE);
 
-	if (!boot_cpu_has_bug(X86_BUG_SRSO) ||
-	    cpu_mitigations_off() ||
-	    srso_cmd == SRSO_CMD_OFF) {
-		if (boot_cpu_has(X86_FEATURE_SBPB))
-			x86_pred_cmd = PRED_CMD_SBPB;
-		goto out;
-	}
+	if (!boot_cpu_has_bug(X86_BUG_SRSO) || cpu_mitigations_off())
+		srso_mitigation = SRSO_MITIGATION_NONE;
+
+	if (srso_mitigation == SRSO_MITIGATION_NONE)
+		return;
+
+	if (srso_mitigation == SRSO_MITIGATION_AUTO)
+		srso_mitigation = SRSO_MITIGATION_SAFE_RET;
 
 	if (has_microcode) {
 		/*
 		 * Zen1/2 with SMT off aren't vulnerable after the right
 		 * IBPB microcode has been applied.
-		 *
-		 * Zen1/2 don't have SBPB, no need to try to enable it here.
 		 */
 		if (boot_cpu_data.x86 < 0x19 && !cpu_smt_possible()) {
 			setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
-			goto out;
-		}
-
-		if (retbleed_mitigation == RETBLEED_MITIGATION_IBPB) {
-			srso_mitigation = SRSO_MITIGATION_IBPB;
-			goto out;
+			srso_mitigation = SRSO_MITIGATION_NONE;
+			return;
 		}
 	} else {
 		pr_warn("IBPB-extending microcode not applied!\n");
 		pr_warn(SRSO_NOTICE);
-
-		/* may be overwritten by SRSO_CMD_SAFE_RET below */
-		srso_mitigation = SRSO_MITIGATION_UCODE_NEEDED;
 	}
 
-	switch (srso_cmd) {
-	case SRSO_CMD_MICROCODE:
-		if (has_microcode) {
-			srso_mitigation = SRSO_MITIGATION_MICROCODE;
-			pr_warn(SRSO_NOTICE);
-		}
-		break;
-
-	case SRSO_CMD_SAFE_RET:
-		if (boot_cpu_has(X86_FEATURE_SRSO_USER_KERNEL_NO))
+	switch (srso_mitigation) {
+	case SRSO_MITIGATION_SAFE_RET:
+		if (boot_cpu_has(X86_FEATURE_SRSO_USER_KERNEL_NO)) {
+			srso_mitigation = SRSO_MITIGATION_IBPB_ON_VMEXIT;
 			goto ibpb_on_vmexit;
+		}
 
-		if (IS_ENABLED(CONFIG_MITIGATION_SRSO)) {
-			/*
-			 * Enable the return thunk for generated code
-			 * like ftrace, static_call, etc.
-			 */
-			setup_force_cpu_cap(X86_FEATURE_RETHUNK);
-			setup_force_cpu_cap(X86_FEATURE_UNRET);
-
-			if (boot_cpu_data.x86 == 0x19) {
-				setup_force_cpu_cap(X86_FEATURE_SRSO_ALIAS);
-				x86_return_thunk = srso_alias_return_thunk;
-			} else {
-				setup_force_cpu_cap(X86_FEATURE_SRSO);
-				x86_return_thunk = srso_return_thunk;
-			}
-			if (has_microcode)
-				srso_mitigation = SRSO_MITIGATION_SAFE_RET;
-			else
-				srso_mitigation = SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED;
-		} else {
+		if (!IS_ENABLED(CONFIG_MITIGATION_SRSO)) {
 			pr_err("WARNING: kernel not compiled with MITIGATION_SRSO.\n");
+			srso_mitigation = SRSO_MITIGATION_NONE;
 		}
-		break;
 
-	case SRSO_CMD_IBPB:
-		if (IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY)) {
-			if (has_microcode) {
-				setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
-				setup_force_cpu_cap(X86_FEATURE_IBPB_ON_VMEXIT);
-				srso_mitigation = SRSO_MITIGATION_IBPB;
-
-				/*
-				 * IBPB on entry already obviates the need for
-				 * software-based untraining so clear those in case some
-				 * other mitigation like Retbleed has selected them.
-				 */
-				setup_clear_cpu_cap(X86_FEATURE_UNRET);
-				setup_clear_cpu_cap(X86_FEATURE_RETHUNK);
-
-				/*
-				 * There is no need for RSB filling: write_ibpb() ensures
-				 * all predictions, including the RSB, are invalidated,
-				 * regardless of IBPB implementation.
-				 */
-				setup_clear_cpu_cap(X86_FEATURE_RSB_VMEXIT);
-			}
-		} else {
-			pr_err("WARNING: kernel not compiled with MITIGATION_IBPB_ENTRY.\n");
-		}
+		if (!has_microcode)
+			srso_mitigation = SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED;
 		break;
-
 ibpb_on_vmexit:
-	case SRSO_CMD_IBPB_ON_VMEXIT:
+	case SRSO_MITIGATION_IBPB_ON_VMEXIT:
 		if (boot_cpu_has(X86_FEATURE_SRSO_BP_SPEC_REDUCE)) {
 			pr_notice("Reducing speculation to address VM/HV SRSO attack vector.\n");
 			srso_mitigation = SRSO_MITIGATION_BP_SPEC_REDUCE;
 			break;
 		}
-
-		if (IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY)) {
-			if (has_microcode) {
-				setup_force_cpu_cap(X86_FEATURE_IBPB_ON_VMEXIT);
-				srso_mitigation = SRSO_MITIGATION_IBPB_ON_VMEXIT;
-
-				/*
-				 * There is no need for RSB filling: write_ibpb() ensures
-				 * all predictions, including the RSB, are invalidated,
-				 * regardless of IBPB implementation.
-				 */
-				setup_clear_cpu_cap(X86_FEATURE_RSB_VMEXIT);
-			}
-		} else {
+		fallthrough;
+	case SRSO_MITIGATION_IBPB:
+		if (!IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY)) {
 			pr_err("WARNING: kernel not compiled with MITIGATION_IBPB_ENTRY.\n");
+			srso_mitigation = SRSO_MITIGATION_NONE;
 		}
+
+		if (!has_microcode)
+			srso_mitigation = SRSO_MITIGATION_UCODE_NEEDED;
 		break;
 	default:
 		break;
 	}
+}
 
-out:
+static void __init srso_update_mitigation(void)
+{
+	/* If retbleed is using IBPB, that works for SRSO as well */
+	if (retbleed_mitigation == RETBLEED_MITIGATION_IBPB &&
+	    boot_cpu_has(X86_FEATURE_IBPB_BRTYPE))
+		srso_mitigation = SRSO_MITIGATION_IBPB;
+
+	if (boot_cpu_has_bug(X86_BUG_SRSO) && !cpu_mitigations_off())
+		pr_info("%s\n", srso_strings[srso_mitigation]);
+}
+
+static void __init srso_apply_mitigation(void)
+{
 	/*
 	 * Clear the feature flag if this mitigation is not selected as that
 	 * feature flag controls the BpSpecReduce MSR bit toggling in KVM.
@@ -2869,8 +2811,52 @@ static void __init srso_select_mitigation(void)
 	if (srso_mitigation != SRSO_MITIGATION_BP_SPEC_REDUCE)
 		setup_clear_cpu_cap(X86_FEATURE_SRSO_BP_SPEC_REDUCE);
 
-	if (srso_mitigation != SRSO_MITIGATION_NONE)
-		pr_info("%s\n", srso_strings[srso_mitigation]);
+	if (srso_mitigation == SRSO_MITIGATION_NONE) {
+		if (boot_cpu_has(X86_FEATURE_SBPB))
+			x86_pred_cmd = PRED_CMD_SBPB;
+		return;
+	}
+
+	switch (srso_mitigation) {
+	case SRSO_MITIGATION_SAFE_RET:
+	case SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED:
+		/*
+		 * Enable the return thunk for generated code
+		 * like ftrace, static_call, etc.
+		 */
+		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+		setup_force_cpu_cap(X86_FEATURE_UNRET);
+
+		if (boot_cpu_data.x86 == 0x19) {
+			setup_force_cpu_cap(X86_FEATURE_SRSO_ALIAS);
+			x86_return_thunk = srso_alias_return_thunk;
+		} else {
+			setup_force_cpu_cap(X86_FEATURE_SRSO);
+			x86_return_thunk = srso_return_thunk;
+		}
+		break;
+	case SRSO_MITIGATION_IBPB:
+		setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
+		/*
+		 * IBPB on entry already obviates the need for
+		 * software-based untraining so clear those in case some
+		 * other mitigation like Retbleed has selected them.
+		 */
+		setup_clear_cpu_cap(X86_FEATURE_UNRET);
+		setup_clear_cpu_cap(X86_FEATURE_RETHUNK);
+		fallthrough;
+	case SRSO_MITIGATION_IBPB_ON_VMEXIT:
+		setup_force_cpu_cap(X86_FEATURE_IBPB_ON_VMEXIT);
+		/*
+		 * There is no need for RSB filling: entry_ibpb() ensures
+		 * all predictions, including the RSB, are invalidated,
+		 * regardless of IBPB implementation.
+		 */
+		setup_clear_cpu_cap(X86_FEATURE_RSB_VMEXIT);
+		break;
+	default:
+		break;
+	}
 }
 
 #undef pr_fmt
-- 
2.34.1

