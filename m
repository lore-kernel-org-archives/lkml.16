Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105ADDC1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423951; cv=fail; b=et9BdZO1kcDU2f8TP5ed1YOLCpk8/1frNtRzmFMwvkG0Btw5BgOJgPDfqCLwT8k1Ies54xywTlMzDTgleTtfrm3RFYw7wrUJ8h/eq4ddU+V4YtIsV3maHNSbb4VSlsCjST+VLjSjZ95eT38g7jpI5Xv+Wt58QGpYMrD3WsBerCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423951; c=relaxed/simple;
	bh=XmLoQBAbbgk24h+mwv+eiiBN/K7eB+2sncHDw8ialt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1YPc8X4u9lzYa+XAYGVAvox8OW9qW8WSZiSUugARaTqEHCLX7EEmaREehovbVcTb9dNwvglQ5yb14K85An64gguu4n7cTb7tUEGUQFXat1TLFtwEzMPEE9HBl2TkJ8kohxuikBVClf6hoKyfr8Taj9vm7KEuQ/31WeNurLEb1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FoNYpp8w; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FoNYpp8w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKYfg4yQaD+sjI/Lqn9MLNHsvFx1S8PqpOZfgBVpqtvejfAWELjBgYHSZRHTSW5FLEh2AlNCEPj/oA71L2L2TnXcjnS/VU6xi/BAMT1CU+B7lZHGEOLOoU6kwnTvQ3dO4gGZ9A9iLSdDT202Z/ANDkyhsUgD4YO8eFdvkYKF44V+AUYDksv9XuyGWKBQPpC0b127X3ZT2Cz5Ls3FxlopcLHN+zTTQOp8Ne3kkxD/ECF1gxf9tfFU2VYcpCgonqxbA8qRnQ9CYyg9SdytCVIRFazqSLxvU8rpKcAvgqffHMYBhiVUR0cppny5bpIxm4NqXzxNcfj0BG0Y4Rx9mAV6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgPtLXP9NytwIF0RnvP58bUjgXTW04xc4Jbo3n31T/4=;
 b=cec52Qo+fiuMQjtSH2J+Z7qdMMjwXbwp8opGTmhfQgDMBAWoR+Qi9R6dEr/VW3bzTV7Al74sdjUXx3/TRMwZAV/5kh1ocakPSjiDQvmdth7dDfe9jQxSVqsus3WvoIW09/ZxgpeHr8YiubKe3nWwbbHFARpkNqnlDkXt0l2ANk/Ft52SOpnMVQJ41VxVjbEWMFxoP2miz/zyFmdF5DlC/IS1nsMbrDL0VQKpSF1/G0zkkdTj+00+rFCkkywyLO3ozrk3YsGNLfsKoEVcpnoxZ29DxkDBpIs2GyW1TVQZcpwrCleaJShN+vgCl6NOJZDiE3bB+vRu8o82A3asd5Z8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgPtLXP9NytwIF0RnvP58bUjgXTW04xc4Jbo3n31T/4=;
 b=FoNYpp8wUH/szhW2DQLBKm7BHNtCsF7gBBN3I4gWWmpPgHlBmduT1eZPgkmT6KTG52PHsQlZSAjreDWg9qsIdd5XlwVD2eHCpX36pIIo4sa75urxL8VntclZIW22X/wDA3v2GvnElGo04f+rZHGhuh/BvyHMlKmdlYwDKQ3lIM8=
Received: from CH2PR05CA0032.namprd05.prod.outlook.com (2603:10b6:610::45) by
 SJ0PR12MB7066.namprd12.prod.outlook.com (2603:10b6:a03:4ae::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Fri, 16 May 2025 19:32:24 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com (2603:10b6:610::4) by
 CH2PR05CA0032.outlook.office365.com (2603:10b6:610::45) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via
 Frontend Transport; Fri, 16 May 2025 19:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 19:32:23 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 14:32:20 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] x86/bugs: Restructure ITS mitigation
Date: Fri, 16 May 2025 14:32:11 -0500
Message-ID: <20250516193212.128782-1-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515134756.93274-1-david.kaplan@amd.com>
References: <20250515134756.93274-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|SJ0PR12MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff90932-628e-4861-0b22-08dd94b061f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wPlqLqNBEUABaTn+MFKqkP2P282C9yiYO8/s6/KndAglvWZxVcIG6Qg0pTtU?=
 =?us-ascii?Q?sQMoT8WhSKFyW8+/1TGCAtZGbBb3fRyfWuhhqLt2VwITlDF79gS3PPx5ocZL?=
 =?us-ascii?Q?yIJI7DtGQIhYU0kbz1WBFwQa5Vrwb7JYTxCrs/kcaA6zW/ERjk6XSQFtS1m8?=
 =?us-ascii?Q?+EsY46oxTHHF4O5JDvW+Fkk8Ov7s2QyXxeyKdUbCMKwpkkizrU06S8+oAbNo?=
 =?us-ascii?Q?y+PxVM1ieppvMOPlGosXcWWVss2emi44GZfL3lIMZ0/cuGa5Qu/K9Tt8qDZS?=
 =?us-ascii?Q?iGbcrWmHlQjM7i9Lr6cqydFrzNx99j9AmquqIk7N9PS7D+Gq6DV/RXsc5sIn?=
 =?us-ascii?Q?iFE8XrVQVOlFL17XrXI5AJoS7qMUrcnWFSixqEOnALyau009z0/e1ULE3M3c?=
 =?us-ascii?Q?LuEGDJVlwjw6GXeN9bPOq/Pn7IZQ4icr7gZYa5tfSZBwUpV/gZBG1VwgQzjc?=
 =?us-ascii?Q?3xPW8e+MQIjnDcKc4yjbcEMnYb7dZD2fIZCLb+GIXb9Na+LhfuvDUi0kG9T7?=
 =?us-ascii?Q?3i7lIUm+wWt9iR+o2cRwp+B6XQkytEhjYconVRwHi/330Y4GnL44/54j/KcO?=
 =?us-ascii?Q?N0rb2T4jqTr+dGb4Px6o6Z+4yhHULozvwfRtWQUfh2kebEbEy72FsBuS7PO1?=
 =?us-ascii?Q?YNwm1agF8najlaOAbJdO9wUo0zUd98d69cWngFuw3IjJelP6B5OEWkgY6qFM?=
 =?us-ascii?Q?X0ow6pg7WARzla+33Tp6gO+eexeL5bAg3R+xoaYHDki2r1zetm8uJxwkh4Xh?=
 =?us-ascii?Q?f7g2DFXbd8/RxRsfzXqZsPw2LIezRs2TyU5Bd8Iv3oryW3nBjUGR1hat0pgS?=
 =?us-ascii?Q?QvPk2iWSskgm4U29qn2CuyY6t8sYefjpGuVqEdT1yxkehuQNaB6bUTtGdLXl?=
 =?us-ascii?Q?NWS1CViR+N9B56YPVJFsS6xinML4gYQ4+HsV3MIgf0Wa4yUvTUcbC1UTFg6D?=
 =?us-ascii?Q?h8DLFZG4K40lm1AzpPJVgjJghACQJoFVyNP/KVyAcCAYFaxP3j89zZeiZJSc?=
 =?us-ascii?Q?8WvjkfI5ke/WYo2mu8L1Olt0AKunpk1smGnrTjt7/NmnQrdr4ClkobP3+zCH?=
 =?us-ascii?Q?ET/NiiCk+KtnetQkvhYpu9mZ7+AXk+WOOwb//2di+t1lCRth8fCjdds5gaAf?=
 =?us-ascii?Q?vGky1HkRALLvlZIcoGjgvtAQ0ubZ73ziBBlg++4SY/fq4J8L1R5QXgs55SQO?=
 =?us-ascii?Q?MtM0L4uCua07eQkCWwz9UXmYBHEUx1BD5SMHFzJCy7ZVDKRmvGl3SpfL6Bll?=
 =?us-ascii?Q?66k4RGPk3uwccgSGHZajGG9LHjv3lwXn43SkXIm9vEEop4eaiwJN53qhLm0i?=
 =?us-ascii?Q?S01D3rJQBjl/WyeEmMC4Z3SNRdKzPnu+q8bEZT/aNW4I+Y5abHYds4FqA766?=
 =?us-ascii?Q?0QgsjDolITZJ9w+RfCoMdDQU+arjd0Bw82BsE8/bYK76NKqqpio0ThB73ZPC?=
 =?us-ascii?Q?Y7lZirwn7DDMUnOg1nPYNlLH8fbYV5jnhZb37AWRlxvJOoz9uHVyQNABYvzd?=
 =?us-ascii?Q?tUlCwt/J3C7D8wuB2i3bcZBJMFwf39qcUnEo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 19:32:23.4468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff90932-628e-4861-0b22-08dd94b061f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7066

Restructure the ITS mitigation to use select/update/apply functions like
the other mitigations.

There is a particularly complex interaction between ITS and Retbleed as CDT
(Call Depth Tracking) is a mitigation for both, and either its=stuff or
retbleed=stuff will attempt to enable CDT.

retbleed_update_mitigation() runs first and will check the necessary
pre-conditions for CDT if either ITS or Retbleed stuffing is selected.  If
checks pass and ITS stuffing is selected, it will select stuffing for
Retbleed as well.

its_update_mitigation() runs after and will either select stuffing if
retbleed stuffing was enabled, or fall back to the default (aligned thunks)
if stuffing could not be enabled.

Enablement of CDT is done exclusively in retbleed_apply_mitigation().
its_apply_mitigation() is only used to enable aligned thunks.

Changes since v1:
   - Moved ITS enum definition before retbleed logic

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 167 ++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 77 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index d1a03ffd4b9d..3d5796d25f78 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -92,6 +92,8 @@ static void __init bhi_select_mitigation(void);
 static void __init bhi_update_mitigation(void);
 static void __init bhi_apply_mitigation(void);
 static void __init its_select_mitigation(void);
+static void __init its_update_mitigation(void);
+static void __init its_apply_mitigation(void);
 
 /* The base value of the SPEC_CTRL MSR without task-specific bits set */
 u64 x86_spec_ctrl_base;
@@ -235,6 +237,11 @@ void __init cpu_select_mitigations(void)
 	 * spectre_v2=ibrs.
 	 */
 	retbleed_update_mitigation();
+	/*
+	 * its_update_mitigation() depends on spectre_v2_update_mitigation()
+	 * and retbleed_update_mitigation().
+	 */
+	its_update_mitigation();
 
 	/*
 	 * spectre_v2_user_update_mitigation() depends on
@@ -263,6 +270,7 @@ void __init cpu_select_mitigations(void)
 	srbds_apply_mitigation();
 	srso_apply_mitigation();
 	gds_apply_mitigation();
+	its_apply_mitigation();
 	bhi_apply_mitigation();
 }
 
@@ -1115,6 +1123,17 @@ enum spectre_v2_mitigation spectre_v2_enabled __ro_after_init = SPECTRE_V2_NONE;
 #undef pr_fmt
 #define pr_fmt(fmt)     "RETBleed: " fmt
 
+enum its_mitigation {
+	ITS_MITIGATION_OFF,
+	ITS_MITIGATION_AUTO,
+	ITS_MITIGATION_VMEXIT_ONLY,
+	ITS_MITIGATION_ALIGNED_THUNKS,
+	ITS_MITIGATION_RETPOLINE_STUFF,
+};
+
+static enum its_mitigation its_mitigation __ro_after_init =
+	IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_MITIGATION_AUTO : ITS_MITIGATION_OFF;
+
 enum retbleed_mitigation {
 	RETBLEED_MITIGATION_NONE,
 	RETBLEED_MITIGATION_AUTO,
@@ -1242,11 +1261,19 @@ static void __init retbleed_update_mitigation(void)
 	/*
 	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
 	 * then a different mitigation will be selected below.
+	 *
+	 * its=stuff will also attempt to enable stuffing.
 	 */
-	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF) {
+	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF ||
+	    its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
 		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
 			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
 			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
+		} else {
+			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
+				pr_info("Retbleed mitigation updated to stuffing\n");
+
+			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 		}
 	}
 	/*
@@ -1338,20 +1365,6 @@ static void __init retbleed_apply_mitigation(void)
 #undef pr_fmt
 #define pr_fmt(fmt)     "ITS: " fmt
 
-enum its_mitigation_cmd {
-	ITS_CMD_OFF,
-	ITS_CMD_ON,
-	ITS_CMD_VMEXIT,
-	ITS_CMD_RSB_STUFF,
-};
-
-enum its_mitigation {
-	ITS_MITIGATION_OFF,
-	ITS_MITIGATION_VMEXIT_ONLY,
-	ITS_MITIGATION_ALIGNED_THUNKS,
-	ITS_MITIGATION_RETPOLINE_STUFF,
-};
-
 static const char * const its_strings[] = {
 	[ITS_MITIGATION_OFF]			= "Vulnerable",
 	[ITS_MITIGATION_VMEXIT_ONLY]		= "Mitigation: Vulnerable, KVM: Not affected",
@@ -1359,11 +1372,6 @@ static const char * const its_strings[] = {
 	[ITS_MITIGATION_RETPOLINE_STUFF]	= "Mitigation: Retpolines, Stuffing RSB",
 };
 
-static enum its_mitigation its_mitigation __ro_after_init = ITS_MITIGATION_ALIGNED_THUNKS;
-
-static enum its_mitigation_cmd its_cmd __ro_after_init =
-	IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_CMD_ON : ITS_CMD_OFF;
-
 static int __init its_parse_cmdline(char *str)
 {
 	if (!str)
@@ -1375,16 +1383,16 @@ static int __init its_parse_cmdline(char *str)
 	}
 
 	if (!strcmp(str, "off")) {
-		its_cmd = ITS_CMD_OFF;
+		its_mitigation = ITS_MITIGATION_OFF;
 	} else if (!strcmp(str, "on")) {
-		its_cmd = ITS_CMD_ON;
+		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
 	} else if (!strcmp(str, "force")) {
-		its_cmd = ITS_CMD_ON;
+		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
 		setup_force_cpu_bug(X86_BUG_ITS);
 	} else if (!strcmp(str, "vmexit")) {
-		its_cmd = ITS_CMD_VMEXIT;
+		its_mitigation = ITS_MITIGATION_VMEXIT_ONLY;
 	} else if (!strcmp(str, "stuff")) {
-		its_cmd = ITS_CMD_RSB_STUFF;
+		its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
 	} else {
 		pr_err("Ignoring unknown indirect_target_selection option (%s).", str);
 	}
@@ -1395,85 +1403,90 @@ early_param("indirect_target_selection", its_parse_cmdline);
 
 static void __init its_select_mitigation(void)
 {
-	enum its_mitigation_cmd cmd = its_cmd;
-
 	if (!boot_cpu_has_bug(X86_BUG_ITS) || cpu_mitigations_off()) {
 		its_mitigation = ITS_MITIGATION_OFF;
 		return;
 	}
 
-	/* Retpoline+CDT mitigates ITS, bail out */
-	if (boot_cpu_has(X86_FEATURE_RETPOLINE) &&
-	    boot_cpu_has(X86_FEATURE_CALL_DEPTH)) {
-		its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
-		goto out;
-	}
+	if (its_mitigation == ITS_MITIGATION_AUTO)
+		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
+
+	if (its_mitigation == ITS_MITIGATION_OFF)
+		return;
 
-	/* Exit early to avoid irrelevant warnings */
-	if (cmd == ITS_CMD_OFF) {
-		its_mitigation = ITS_MITIGATION_OFF;
-		goto out;
-	}
-	if (spectre_v2_enabled == SPECTRE_V2_NONE) {
-		pr_err("WARNING: Spectre-v2 mitigation is off, disabling ITS\n");
-		its_mitigation = ITS_MITIGATION_OFF;
-		goto out;
-	}
 	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) ||
 	    !IS_ENABLED(CONFIG_MITIGATION_RETHUNK)) {
 		pr_err("WARNING: ITS mitigation depends on retpoline and rethunk support\n");
 		its_mitigation = ITS_MITIGATION_OFF;
-		goto out;
+		return;
 	}
+
 	if (IS_ENABLED(CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B)) {
 		pr_err("WARNING: ITS mitigation is not compatible with CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B\n");
 		its_mitigation = ITS_MITIGATION_OFF;
-		goto out;
-	}
-	if (boot_cpu_has(X86_FEATURE_RETPOLINE_LFENCE)) {
-		pr_err("WARNING: ITS mitigation is not compatible with lfence mitigation\n");
-		its_mitigation = ITS_MITIGATION_OFF;
-		goto out;
+		return;
 	}
 
-	if (cmd == ITS_CMD_RSB_STUFF &&
-	    (!boot_cpu_has(X86_FEATURE_RETPOLINE) || !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING))) {
+	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
+	    !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
 		pr_err("RSB stuff mitigation not supported, using default\n");
-		cmd = ITS_CMD_ON;
+		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
 	}
 
-	switch (cmd) {
-	case ITS_CMD_OFF:
+	if (its_mitigation == ITS_MITIGATION_VMEXIT_ONLY &&
+	    !boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY))
+		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
+}
+
+static void __init its_update_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_ITS) || cpu_mitigations_off())
+		return;
+
+	switch (spectre_v2_enabled) {
+	case SPECTRE_V2_NONE:
+		pr_err("WARNING: Spectre-v2 mitigation is off, disabling ITS\n");
 		its_mitigation = ITS_MITIGATION_OFF;
 		break;
-	case ITS_CMD_VMEXIT:
-		if (boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY)) {
-			its_mitigation = ITS_MITIGATION_VMEXIT_ONLY;
-			goto out;
-		}
-		fallthrough;
-	case ITS_CMD_ON:
-		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
-		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
-			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
-		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
-		set_return_thunk(its_return_thunk);
+	case SPECTRE_V2_RETPOLINE:
+		/* Retpoline+CDT mitigates ITS */
+		if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)
+			its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
 		break;
-	case ITS_CMD_RSB_STUFF:
-		its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
-		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
-		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
-		set_return_thunk(call_depth_return_thunk);
-		if (retbleed_mitigation == RETBLEED_MITIGATION_NONE) {
-			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
-			pr_info("Retbleed mitigation updated to stuffing\n");
-		}
+	case SPECTRE_V2_LFENCE:
+	case SPECTRE_V2_EIBRS_LFENCE:
+		pr_err("WARNING: ITS mitigation is not compatible with lfence mitigation\n");
+		its_mitigation = ITS_MITIGATION_OFF;
+		break;
+	default:
 		break;
 	}
-out:
+
+	/*
+	 * retbleed_update_mitigation() will try to do stuffing if its=stuff.
+	 * If it can't, such as if spectre_v2!=retpoline, then fall back to
+	 * aligned thunks.
+	 */
+	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
+	    retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
+		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
+
 	pr_info("%s\n", its_strings[its_mitigation]);
 }
 
+static void __init its_apply_mitigation(void)
+{
+	/* its=stuff forces retbleed stuffing and is enabled there. */
+	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
+		return;
+
+	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
+		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
+
+	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+	set_return_thunk(its_return_thunk);
+}
+
 #undef pr_fmt
 #define pr_fmt(fmt)     "Spectre V2 : " fmt
 

base-commit: 9162d2f2aab03400a773d9e8078f8c19e1f53228
-- 
2.34.1

