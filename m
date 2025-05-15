Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8331DE4C2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316893; cv=fail; b=sK+nVOGGD4BwB97M07JyTBL/M7cMx9DyMczyAt5qEe4YFz+Sc8ZWpkCZVfjmPlX5j42KxczExShfLinY58tXzdJUy0fAjweoS6TKQPLJX7icYVndrXYKRbzbUP6GJW1ooBMHqvPv7XCBtUhxSZUX5NUjJ02DzchkYN2ep/Gr1Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316893; c=relaxed/simple;
	bh=PsvLNCQCmGscS28zRBmAe5oIP6D65kXPe18M7K9118I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GESIh7MwRpYpu7iUKCq62jhjNKCZkzeRL9cQOxRf35oh5APDxQwVcG8KcfrMIzEEk858QIgkepHdYnd18rhria2tIPceB8smkSij8XK3wLyUOLvsswY1Lpn3kVzWTtyM8Vugd2oPXwtKSntyeMb1o9PY8891uXNq93HxfgFKT88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qWx7ZQLy; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qWx7ZQLy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2C1oYHsBVoROEaml+rRtPtr8a6EosvQ2QeoEMNguin240l3NcEnlo3/xy8TjXWgH5A2d2CCdz2XDwg/F7EJICm7RwVaCu+LaQxV3qj11OeY1KONOK/poqPifwsJaIZhH03M7CdelnjRA5v1dM5L1vgfbzmeMNtZ6lj6WTubcghaW+uTb8rMkYa3oYsCxl87GCIW6nnxhQyE5BXDxYyKNY5TLdhXbHxplKyfMyyCvrOusDidB38/N6zvGyaRKw3AvQa6NODIkvwOz0zuK1TkiD2GrkbsWPO+havp9xrSFOrDia30ROkc5zGL8qNbh1V+jd2igp9xRC8c00IQ9zZfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HPpG+9zypFt/r08D4c4QB7/8/7lrcy6PxUMkv5I1ho=;
 b=aeqsIncvYCDjPsKNkSXTiaU/VrKKCT1tj+O3YqlrKth1c2jdrUqhwZqVZjQDdigNgvfpWJeowiyKrSJXxRgQ3U+cgp5EDHfgAcDELQfEyd5W/r1JfgeTAC5F+SHRrFNePoTS+wQ/T0HlVCNamRrvQjOSq2p8/c3VcvG20BstWrBCTiSIkGS9w2+ev3yZi/K+YABYjTKkaXi1XxQ7ZrdhKRIBulzGS5pzNdZ4m8r9ryjuabJCR2a8KUqWOPXExW8kp3EG+8cuggFceVLeGegMmRGtIkbB8piTZdxX4JfSHSYtyHHovPA06KxcFdCIzEV51HRYMRBuvjsmClb/UjGosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HPpG+9zypFt/r08D4c4QB7/8/7lrcy6PxUMkv5I1ho=;
 b=qWx7ZQLywmd5s0k0xxWZRUhwOK54oJA9W0/ugAtzsvOF2P8k1qxJEvv4IQ+KbvVSHa7wsfIA45l8EuwKDSe0NTIt6AJfN2Ty1BhR2pIwWTi2p0IrKZ4I6qmtMHvmiHkZsYL3Sw5MfocOQNP3bPdZvrbTTTGu0YbEqO2nIH2hA2I=
Received: from BN9PR03CA0858.namprd03.prod.outlook.com (2603:10b6:408:13d::23)
 by CY8PR12MB8410.namprd12.prod.outlook.com (2603:10b6:930:6d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 13:48:06 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::d8) by BN9PR03CA0858.outlook.office365.com
 (2603:10b6:408:13d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Thu,
 15 May 2025 13:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 13:48:06 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 08:48:05 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86/bugs: Restructure ITS mitigation
Date: Thu, 15 May 2025 08:47:56 -0500
Message-ID: <20250515134756.93274-1-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CY8PR12MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c67ed82-b036-427b-db14-08dd93b71f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cmPC5kDy4iNXGZLFSZgpkFp0gRMOvwg9vk6DcpwUQoVehLr/LeEpW2MmCf/p?=
 =?us-ascii?Q?8/U2eqUMGMRTRywIHOetN+627VNQxqQU/mx7nEpbLjZfLWcnCsCdC8rtx+Xj?=
 =?us-ascii?Q?qjzjeFIFrbelM8FHIkINW4Pj4Jv1vidVqUpQ8sHb30BVdz4Nvj9J5GIUkZyY?=
 =?us-ascii?Q?chOaA/bXcRPlt/lswYnus6jpNfSF21B7F40c9ER/XwgnP+W5ZfwtzypdwdZ3?=
 =?us-ascii?Q?KA/gSWUFIX90BBr7yUEd2N3AftHCTLdAjrZ7acDCj3JVmSgd3Ivpqb250WEY?=
 =?us-ascii?Q?uaMDPv/pv3C7Hcxyhrb3LMCtFkcmgJadQet5yD8TK+O+dO5AK4UD+zqVyu5O?=
 =?us-ascii?Q?VJY1k1JlNGwXxRNcudTz+ChTvRhUyHhOxt4oumT/iQSmsFgRcUH1QpcPClKH?=
 =?us-ascii?Q?qI1KbzqRPnUhvg4BPRxwkKChBvZi4dZEVo38TwFZo4BbUW6/HgUsd71iW44F?=
 =?us-ascii?Q?uvCKyJnV1nKkDNiB1uNT5u7y/XgjOuoc0T7adfhaelXtrHARvs4WZfzuBjal?=
 =?us-ascii?Q?9PrxDEqGgyCu0ucq7RZaC45H3eFpp0PC0Bwz7VyWX0BZDuLqzQalHyGiRXEG?=
 =?us-ascii?Q?jIbae0dH4W1ZKWel4M9UmCpvBjUEgo4kzxu6oy0tzg9OFHiFLdStVGjFt6AU?=
 =?us-ascii?Q?rv5pe2UJ+7Wl+NZcD62CIUK3kTKQUSDllC3E/93nQ6fuGpFh9BgcRKwqKvNV?=
 =?us-ascii?Q?MIxnoQHQvLK2bpoXZaUQmSKF73pJKpw8mRSMei93Qp8yIWtnjhLzDvdZ+mwU?=
 =?us-ascii?Q?btFl5Zii+3Uw6RBDXDK0D0GA/rsHjSm5SIV7Sgav2faoQFiwbh7CYwse42Hl?=
 =?us-ascii?Q?U2YXy+tU3rPReYDUjTIO3YcQvotPLB3XEfOQYxniy4kRcDn2LFtvsthinlu9?=
 =?us-ascii?Q?2q8iwK67ompRs97KFkPdIVYM4r1P62Upuh/05LIUZFB+caFfICyWiB3whP+q?=
 =?us-ascii?Q?mF5UJ1wdRlZrQ3qB0+UcuO/vtzJ7CEk45n13tM7ffmfIqEfxApvAVK2Z1GJV?=
 =?us-ascii?Q?rtCvTWsPTiubMQo5rQxZXwdM4ehPv5ao7QL6dul3TJ2LP1jmhl4GWSKMgxEJ?=
 =?us-ascii?Q?1m+qvgVQTjbzu4aUaWuhDGQ5jNvn2Go06HkYrgqOaHu2RSIhTQvMKnoUdrrE?=
 =?us-ascii?Q?wQXyeF4zOBzVcN61wbNVqKkjGh9zS8sKvetzsLcwpn3fzHtzyDiZE0AecGgu?=
 =?us-ascii?Q?SIizeT+5uitay/PpKCvWR0xzSCoMBuX6laJncCtkO7rldMZHxpPk9ztnE1Yv?=
 =?us-ascii?Q?WfQvcUwvD9IfAUZaJEDo1b3Ntajn9KkreAOmpxnoJmXG05dahF3SxbuZ/RNf?=
 =?us-ascii?Q?mgp+cTdxuF+pQQRA4wZcRonybCXD6Huy3pFY6GjhDkphTV5prnhwUHiOG+go?=
 =?us-ascii?Q?BfzQ7MKHKQi61+9qFQwH/G8L7THbDrzf0MRco0h1uHr3sXyaM5K3XnlnR4yK?=
 =?us-ascii?Q?NUET5KRpIxCHUCZlgVaxIAmfeG4rEZ9SblMbtSJr1Oe2W8LzPSHkVMvb/SdA?=
 =?us-ascii?Q?LFXg6AbGaPAOVucPxTmK+1DoO7o5QmlR3K3M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:48:06.6794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c67ed82-b036-427b-db14-08dd93b71f23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410

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

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 167 ++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 77 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index dd8b50b4ceaa..db26fb5a0a13 100644
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
 
@@ -1125,6 +1133,14 @@ enum retbleed_mitigation {
 	RETBLEED_MITIGATION_STUFF,
 };
 
+enum its_mitigation {
+	ITS_MITIGATION_OFF,
+	ITS_MITIGATION_AUTO,
+	ITS_MITIGATION_VMEXIT_ONLY,
+	ITS_MITIGATION_ALIGNED_THUNKS,
+	ITS_MITIGATION_RETPOLINE_STUFF,
+};
+
 static const char * const retbleed_strings[] = {
 	[RETBLEED_MITIGATION_NONE]	= "Vulnerable",
 	[RETBLEED_MITIGATION_UNRET]	= "Mitigation: untrained return thunk",
@@ -1137,6 +1153,9 @@ static const char * const retbleed_strings[] = {
 static enum retbleed_mitigation retbleed_mitigation __ro_after_init =
 	IS_ENABLED(CONFIG_MITIGATION_RETBLEED) ? RETBLEED_MITIGATION_AUTO : RETBLEED_MITIGATION_NONE;
 
+static enum its_mitigation its_mitigation __ro_after_init =
+	IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_MITIGATION_AUTO : ITS_MITIGATION_OFF;
+
 static int __ro_after_init retbleed_nosmt = false;
 
 static int __init retbleed_parse_cmdline(char *str)
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
 

base-commit: 04bdd560124ec4d02d1d11ee3abc88d51954d7b8
-- 
2.34.1

