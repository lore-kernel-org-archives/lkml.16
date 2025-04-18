Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E235222ACF1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993072; cv=fail; b=tHdSEL13VFuqHUTQwA1qEaOu64LyBmbtwZuLLqEIVfN7iREBmLbD2NBgL3HfSsFu6h8WqOBMRv+76hS5sZFSdLOZhSYzfNENMi3BFgSbsUu2Q8DxMkuVgFGX7KgiHo7sTgTxtqe7WmZ7O14bsg69ry1ENNUB9MsaiR0r1yH0yxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993072; c=relaxed/simple;
	bh=UeVMmh2ja4RO9mNmVEsOVpR48Sb04UXKKVjqNGW5ZEk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzr/BvaGimxOJoPUnHWRHBGITR6FcMrKOL8KZyu2R93NfQ/OppT7pGNQkg6S/OBFeMLA+u61S1ZtJ8TUEpdq05IzvwGAw9GyFFby9sFRswl1z2voNRGT/SOgMONeOLD/UaSljcVez2nKj1X5vRYwgixIs6GIYnmACoh1yxCjeRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eX6oZlml; arc=fail smtp.client-ip=40.107.94.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eX6oZlml"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceUsUbarMVQAGwEiiDC7Ic76HXzgeS69o/t5E9NP9f+iUnj2HVTvK2qZv8yZIAsOTiMdmK2cOm2TzehYQ/qI/6pyTCONuS7nkeiJhO46z5PkIryctJPQQ1tM5PLxBkdHOEFggfJRXsTm7TM/2caCS49eqx2IFxQxvrWxtU9iwKZkAZQAHKJs9kHW8bP9ANk/bw8ZYOy8z1mkyjXHdISXe5/UhowfbKCDrwuo6r+4KeaXuCoVUQhXw9CMypttOU7Hec/jz8RNYocqtPyexnoVUQqbvfX2u/m/1aKUQaTph0Fgy1o9r+V4sPIOqwUhysC9tqib5feQvdiYLQ/LKqGWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlvdF+ilONzqdsZzQvcPbOJAsYxj38KEp2TmYpn6Nmc=;
 b=EkOui5n9mfuZHPUlzqO9UjWBrER11/V9LTfrn705bBpD+/GwnPTrcxE+IpkAgYFNRblleQiIikeU6+aeP6gIHz2Uf8rv4y5qje4j73ZaT6uWQxnHPsjXmA34YyRFaTD+H370DkLL1/MDlAK+C67ap/qVbPbTr2wDaTDZxQ4d25B8V1plsSaiF2yp6hrjCxLPRRk4G6FmDQH59Bx55GfnmuvG/NKB+NO8Evg7gbxncSmOfOsbnolCeChMcMeeJptHpwHxhKzOX/q+/M2p5Fg4FLa9cCH9rXyEhHVCIO53oPe4877OvUKybBqXpsRjOcTFtU0kwjhxPL4LI9omted5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlvdF+ilONzqdsZzQvcPbOJAsYxj38KEp2TmYpn6Nmc=;
 b=eX6oZlmlYTLJpMNLB8K03oGm/W8l4/R3GLhjz6qhS8Dmv7U9qmlS6UI5TU8PzFLclp/ModcHyebrn2JPpt0vBkod4Je3cIZvWYyKNTYbn9zi6v1rq6/UYBHYU58q/eBZU/lqUKb5OoZyPg0qdEJa2kYEX545TcvoRqCJMXLrfJo=
Received: from CH0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::32)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 16:17:43 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::fd) by CH0P220CA0016.outlook.office365.com
 (2603:10b6:610:ef::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:42 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:39 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 14/16] x86/bugs: Restructure SSB mitigation
Date: Fri, 18 Apr 2025 11:17:19 -0500
Message-ID: <20250418161721.1855190-15-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MN0PR12MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 7051c4da-cf86-4f7b-50df-08dd7e948c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KJu3uqUUuI/9QLnkbyvVHPLj0SzMFn9gjQnzLJpmsmeO3BxIcJNdXt0dOZAu?=
 =?us-ascii?Q?lo7edFP6Kbn5FQ8I2iE/mmw7s3KUecaEwSmeznG3GvXqxJ3WgfkJUiQHDh04?=
 =?us-ascii?Q?goQs6wPHou7kPZUZyH6WtB0H0FVGJpuLxbMtbNFr6tYhaOmf4s/CeLz5bH3y?=
 =?us-ascii?Q?T/VCqdg4PNrIEyFyPvX2CgLZ576I9zz1HDbaWTaWLHrVL14dm3cYA83nmkoN?=
 =?us-ascii?Q?J95YD2YFvNStGiyGBZCY9u5vnCsSeTtofzxyr2ytbs+JfARe0RVNwLs4K0wf?=
 =?us-ascii?Q?5hbtz4iixosHAe74WKjRXlvW/+YoTynByAK2ou3Yo2bvULByGk/tSMkujAYC?=
 =?us-ascii?Q?UQohk3tFkWrulQP2NC/cia9Cm9eH5tlDHkAL187XesVVjpvQiwVDR4hMMGaW?=
 =?us-ascii?Q?px6C1urGADjW7sEK62QzU0QZxUExqSTEqxrl+YiT3u5sOwqQOzSMORdBcfm8?=
 =?us-ascii?Q?R8SautzaFCLJ3o6AsIp44NIWKs7/0z4VtZQdBDpx8F294uTMPh6FhUpPb6zW?=
 =?us-ascii?Q?BMsc9bny8mBnZ8PHcZRAUjAgKd+wAMHqavC0YG3wdKPNJJ1/8Be16otQanm5?=
 =?us-ascii?Q?OaCDoKcdeXzPwIxYaLq47/5WVW42SxGo6DzHhEV3+yFpGoI0FhC3zfF5rxM5?=
 =?us-ascii?Q?y/nF1ezTWUW91OMPgzII+68vnf9dYTHMvyrDCH2+P9+RgVyhoyIviTxVVI9A?=
 =?us-ascii?Q?bsHBdCZ9EZMBOqzw71UjGrLFmKTBOoQQVGIXw3i+txodQ0QB4Idz+bbkExEa?=
 =?us-ascii?Q?5MH6eHB7cmL8sP30yzzzhVHLD6yQu6QwvUg59EcRW9d//suCsqdhgXGs3xSH?=
 =?us-ascii?Q?4aBHuL2QCX5PrVaNhPFNc/MKDAdK0hK9hOPbsI7DhDzDkhhW5rCeddQI/8xf?=
 =?us-ascii?Q?uOUglFnU+hZtdlLvEAcnlCB8df5cyusJnGyHU/4aUQyPu1rvhns6ifDh49Rs?=
 =?us-ascii?Q?wSLmluAD6tMbjLIRHDC5Bu+DAgajGFWaDJg/QOujZ1kd2LqsDjCZW/aP950H?=
 =?us-ascii?Q?vuViuIWm0wXJ7uGWe+6LDUCwe55tkfUkMr170pvR4T6ONE8587tj5MfGsQsr?=
 =?us-ascii?Q?jI3CqA5qcoBxHid9fdj00+7Jn/T44/TYQXdYa9aBHw0QU8+N1Q57TVsS0gNQ?=
 =?us-ascii?Q?PDsLykmrujP2xJv9aSHLnJovafvHGbWRyJl59KW43XISgpL/KIMlcLSurWD4?=
 =?us-ascii?Q?QcGovygSIJeiKDcdADgGOtdGZfHSVxFskU1Eh0c+4etyIhpmCpJ2jGGhKS3J?=
 =?us-ascii?Q?22LxHbFnn9pGUfJpH8gt9DDQRrV2b1GXa1Gz77zcWZroGvMVNDf3S4AuhozF?=
 =?us-ascii?Q?jv37/i828N/DQV7wd9BGTHKhUdQKTbXPDu80J+p9JniHzWlZCF+mqW8kgnxo?=
 =?us-ascii?Q?Tdsf0C3ttRPReQt1j6//F79AvysYY3fSmJ+M8HQZSq4om/tvLiVGAYCd6aiL?=
 =?us-ascii?Q?2+fAPGJicjWfqO5rB1+9HHPKPMtgQPDp/smMLuLrV5oxvIrV2CXtOtUs9fEy?=
 =?us-ascii?Q?MDxUQ1bZnHy48/Hh93Wuyup20QC2b//qF/Ks?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:42.6111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7051c4da-cf86-4f7b-50df-08dd7e948c15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929

Restructure SSB to use select/apply functions to create consistent
vulnerability handling.

Remove __ssb_select_mitigation() and split the functionality between the
select/apply functions.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 8fe00fe987d5..e526d06171cd 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -65,6 +65,7 @@ static void __init spectre_v2_user_select_mitigation(void);
 static void __init spectre_v2_user_update_mitigation(void);
 static void __init spectre_v2_user_apply_mitigation(void);
 static void __init ssb_select_mitigation(void);
+static void __init ssb_apply_mitigation(void);
 static void __init l1tf_select_mitigation(void);
 static void __init mds_select_mitigation(void);
 static void __init mds_update_mitigation(void);
@@ -241,6 +242,7 @@ void __init cpu_select_mitigations(void)
 	spectre_v2_apply_mitigation();
 	retbleed_apply_mitigation();
 	spectre_v2_user_apply_mitigation();
+	ssb_apply_mitigation();
 	mds_apply_mitigation();
 	taa_apply_mitigation();
 	mmio_apply_mitigation();
@@ -2224,19 +2226,18 @@ static enum ssb_mitigation_cmd __init ssb_parse_cmdline(void)
 	return cmd;
 }
 
-static enum ssb_mitigation __init __ssb_select_mitigation(void)
+static void ssb_select_mitigation(void)
 {
-	enum ssb_mitigation mode = SPEC_STORE_BYPASS_NONE;
 	enum ssb_mitigation_cmd cmd;
 
 	if (!boot_cpu_has(X86_FEATURE_SSBD))
-		return mode;
+		goto out;
 
 	cmd = ssb_parse_cmdline();
 	if (!boot_cpu_has_bug(X86_BUG_SPEC_STORE_BYPASS) &&
 	    (cmd == SPEC_STORE_BYPASS_CMD_NONE ||
 	     cmd == SPEC_STORE_BYPASS_CMD_AUTO))
-		return mode;
+		return;
 
 	switch (cmd) {
 	case SPEC_STORE_BYPASS_CMD_SECCOMP:
@@ -2245,28 +2246,35 @@ static enum ssb_mitigation __init __ssb_select_mitigation(void)
 		 * enabled.
 		 */
 		if (IS_ENABLED(CONFIG_SECCOMP))
-			mode = SPEC_STORE_BYPASS_SECCOMP;
+			ssb_mode = SPEC_STORE_BYPASS_SECCOMP;
 		else
-			mode = SPEC_STORE_BYPASS_PRCTL;
+			ssb_mode = SPEC_STORE_BYPASS_PRCTL;
 		break;
 	case SPEC_STORE_BYPASS_CMD_ON:
-		mode = SPEC_STORE_BYPASS_DISABLE;
+		ssb_mode = SPEC_STORE_BYPASS_DISABLE;
 		break;
 	case SPEC_STORE_BYPASS_CMD_AUTO:
 	case SPEC_STORE_BYPASS_CMD_PRCTL:
-		mode = SPEC_STORE_BYPASS_PRCTL;
+		ssb_mode = SPEC_STORE_BYPASS_PRCTL;
 		break;
 	case SPEC_STORE_BYPASS_CMD_NONE:
 		break;
 	}
 
+out:
+	if (boot_cpu_has_bug(X86_BUG_SPEC_STORE_BYPASS))
+		pr_info("%s\n", ssb_strings[ssb_mode]);
+}
+
+static void __init ssb_apply_mitigation(void)
+{
 	/*
 	 * We have three CPU feature flags that are in play here:
 	 *  - X86_BUG_SPEC_STORE_BYPASS - CPU is susceptible.
 	 *  - X86_FEATURE_SSBD - CPU is able to turn off speculative store bypass
 	 *  - X86_FEATURE_SPEC_STORE_BYPASS_DISABLE - engage the mitigation
 	 */
-	if (mode == SPEC_STORE_BYPASS_DISABLE) {
+	if (ssb_mode == SPEC_STORE_BYPASS_DISABLE) {
 		setup_force_cpu_cap(X86_FEATURE_SPEC_STORE_BYPASS_DISABLE);
 		/*
 		 * Intel uses the SPEC CTRL MSR Bit(2) for this, while AMD may
@@ -2280,16 +2288,6 @@ static enum ssb_mitigation __init __ssb_select_mitigation(void)
 			update_spec_ctrl(x86_spec_ctrl_base);
 		}
 	}
-
-	return mode;
-}
-
-static void ssb_select_mitigation(void)
-{
-	ssb_mode = __ssb_select_mitigation();
-
-	if (boot_cpu_has_bug(X86_BUG_SPEC_STORE_BYPASS))
-		pr_info("%s\n", ssb_strings[ssb_mode]);
 }
 
 #undef pr_fmt
-- 
2.34.1

