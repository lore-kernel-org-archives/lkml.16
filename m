Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9B22A7FF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993071; cv=fail; b=uPl/y1OHVjrtct1yduIcXNpNBkPVrN/0FI0KYR3XDGOB1Gv4NDqrEI53nKYAKEDRnmhvxk1BKluSiSqRdb9yMbiEZTmrwYv3SjxedOfwcjLWoeXTCzKS45sJVGpZXH3oq/KQt0Qa2u1YuGkkNMPK6UFs3PCYxI8kdAjo3joAVR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993071; c=relaxed/simple;
	bh=r3BCTJ+2VZd4Jwdn19LX/GQFHm7pQOyglZ8tilINqi8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+M8b02UZhHG+46Ja/CFUXmb1rUx6zZcKbEFNUCGgKqXrqGHkrowPe08NVIqFooJoxCnMbazzsWPVkiFWGkIE74cWMvKeHKCjcWa9aIcH+BRIc4nmmERjev9SrS8lVuLgtq6EaJm8t52+xcWCxW2hra8PaDtEzgg6xmQRuQKDL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=msk51bbB; arc=fail smtp.client-ip=40.107.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="msk51bbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+iEJG+mtMlieYkOHaWvqc+XiYoh2ocfda76KaVf3rcpCK7o7qi/jne9I7q4FpjD653VxgPy2ot0TUmN6nPwFp6yC3yRR2Im7QG2ph6ZSf3dAbxwNh+XwyI4MQDjb+xtM9d3Xix6YzSFlykydKckLS+9g73mOajGOYi0SsD9/Xan7xsFaJPTqJQKcx6+wUHg0VhB6vOCtdGdTdl9j8PZ53GiwXOIreYjcHB6+Q4cCOk+Ia0tga2DC7AjkHlr32eqvLYWJuLJr+XC0auHJalVNQQ1OvnQt/j7vU7Rgg/cf53pQF54Qz5QJugKq0JVKVsU9VUa2EoLWgfqhdFIfQjKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/W61BUKgYnO/Dlz9DF4zyVbY8L4XvAa9KHdzYdMvgA=;
 b=x5IUMCdvTNkC+6G2NCrNvBg4TeX/RRenPVnRgp/z+enbDZl+nPSOPLKdxNX5dbNGLxyPqMvcVcgLiyvz1M2spSDbvqGuoXihem6UUQoXmzRuo2hlYguc0BgwTOUVxhKkek3d8jUNXF9yFSFkGQ/4DVXoOmX4mLYTbL4G6Pku3XL62ggb7dAssNulzhbomeO5z+LOcyyosONYgFUSFBYB1Rwz2sy0PDpGnFxGC2H7gdxhmhrwZnASf39G3DgWADES34IBCDHac38d9hDV7Y3IRr1YjY9iebgsTApKQ4OOg63j/rZAG//5M9YlXbJGT8oZ09yJKj36NT/n2buAIXReDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/W61BUKgYnO/Dlz9DF4zyVbY8L4XvAa9KHdzYdMvgA=;
 b=msk51bbB6iwgoWogSxAxQSvGdILp2enzvXrTiP54Xg9TLdAbwx+rx7OFKi4J0V9rownCt21MVHX6svS20tNICosjeS5hR5B8JNqvv2Cz7G81AUMT5VN4WaYrjWQZAfCYIqcBnKyvks4q1tSwvs4NbBJoLhkDHOQ3Xmlda2FJgWM=
Received: from CH0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::35)
 by DS0PR12MB7583.namprd12.prod.outlook.com (2603:10b6:8:13f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Fri, 18 Apr
 2025 16:17:42 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::2c) by CH0P220CA0015.outlook.office365.com
 (2603:10b6:610:ef::35) with Microsoft SMTP Server (version=TLS1_3,
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
 2025 11:17:38 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 13/16] x86/bugs: Restructure spectre_v2 mitigation
Date: Fri, 18 Apr 2025 11:17:18 -0500
Message-ID: <20250418161721.1855190-14-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DS0PR12MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a24875-b757-4ac0-db30-08dd7e948bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4tzGHt/hLI2eoJVjuYjjRkIDtmBU+hUusiJ8pFZtlrb8Max0mT42x20/HZnC?=
 =?us-ascii?Q?iSfr8Hns1YSExG5cJ7qX7Um4GAm/fe/UQ7F/wSDhpf+sIrTYsWCCFHwbVoKE?=
 =?us-ascii?Q?u1+DaiSc2dKSG51awY5nA7wdLGVGBcUsHVgFlG6BDtAN1A2RQQWGcIiWMFA1?=
 =?us-ascii?Q?zESPRO9pri5ofv4WhljIJNuieptjqKMMnfnRNQoSiBEr/WtxYUxJLEBaDMLD?=
 =?us-ascii?Q?08T4F0MQaLhqKjDnIJvI88mW9wjex7bOBstalm2RvSANuXKawSCwI1iiG5Cg?=
 =?us-ascii?Q?7k3MESQVKPkBr5pKjEpQw1GwP3Jm7CPzHIm1dIuBn0pvdnBrVHRv5tgsWrJF?=
 =?us-ascii?Q?/jTvgU9kugJlT7d1eJS1hFuZhMRICF9/Ko/7vXy4Xtr9mBI/cMcCm2gYHiOA?=
 =?us-ascii?Q?wtYyVlFqWNhnjnVXGr0iAOdzQ/uBgjpsGMuWQEdKZgzJFHwBlDkyAsFnLC2Y?=
 =?us-ascii?Q?xeahor5xt7S+4cx3Xx53SjUXxWrHHq7LmePA75o56q92lqEHdUxe/DbVvVD/?=
 =?us-ascii?Q?ksY4N28ZfQm8nJSl6Xb8l8bUXoF5UJH46gwPd+IgWNRPKoJVUxIHxspKunHY?=
 =?us-ascii?Q?fRgaf/69J/5i9QcbV9bSWGQlYvPnwFBIEaL0S09PuC+aiZP9E2cHa2W4E0IS?=
 =?us-ascii?Q?LfgRX8hbQ+ob6ncRVxAfeCbd4ddHdYFPmR/iGtf2YQtDHrYj8WA77YjzlsDS?=
 =?us-ascii?Q?4UrIt7/qMSqLRCGqPsN4lKFheZUlto2XHWVL6gpuHHZ8mtP9boxozqHEzTAK?=
 =?us-ascii?Q?WpPRE6vtYEQami6SQe4Z/lGfnrFgrhjSKO+jBsKJwBUqBzjv2IWocmmOSu78?=
 =?us-ascii?Q?RlQty/AaTQPRs1hrzh8r22cIFn1pmAxQAeU1JWDw+WGr0zEIK8Cp67jARiDA?=
 =?us-ascii?Q?iyGGn2oWoRHhmHi6rTOgivpoNlTCQcF1tGCZSayb/ch2uA5WnTWrdscjqgft?=
 =?us-ascii?Q?URdF9Pz1Y8vvl9T+lmkBuvk9KWzV78KF5jFhthVm3vfofMnMdSuZ3r+H5Fay?=
 =?us-ascii?Q?+NdnBfsthgJBTyGF5ruiYZITCbAHwhLYW59iw7GWZ1TamLuhuMsV7CYjdFmf?=
 =?us-ascii?Q?D/3AMQXl2lUK6vaL+Pn+/flFRMqqxxcnymMQIS0pR+8pxf9lNUK4tIp2lz+/?=
 =?us-ascii?Q?dKVlEilb8ayJn8X9s6sAEqwkVNHJaFOT2RDyDebVaM9jVNESiEqIECMtWIFK?=
 =?us-ascii?Q?+W9JFHgF4TzipUySrL7ZVV6THKd7MT4wNFRyruVdJKXOXS+01MuaDbTNVo1b?=
 =?us-ascii?Q?Kc5oppmXTBXO4aSX5b7O7Tngk/eqyeA687tgmhuGSBMV8+PIDkG1SZ1Ud8p9?=
 =?us-ascii?Q?gil5XnSbYoT55tvDXzg4RZyZkWejbrQVsZQxyM5aBvalIXADrRvAHlWL9Dhp?=
 =?us-ascii?Q?k+SkXH0nAC2bQfOOtlAtcP9LRIiortksudzJsMQO8/cVXKrhcgMzB2qwMbFm?=
 =?us-ascii?Q?Wru0uFQNXnWI6sPx4JvSHRyNUedoovkuBTpw22QSu5uyppqCf62kabtnpFF8?=
 =?us-ascii?Q?7J/BZd2EuQeDbqLQKd4MsxSIDJdM0k7Zr+K9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:42.1292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a24875-b757-4ac0-db30-08dd7e948bcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7583

Restructure spectre_v2 to use select/update/apply functions to create
consistent vulnerability handling.

The spectre_v2 mitigation may be updated based on the selected retbleed
mitigation.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 80 +++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index b7063f58ae88..8fe00fe987d5 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -56,6 +56,8 @@
 static void __init spectre_v1_select_mitigation(void);
 static void __init spectre_v1_apply_mitigation(void);
 static void __init spectre_v2_select_mitigation(void);
+static void __init spectre_v2_update_mitigation(void);
+static void __init spectre_v2_apply_mitigation(void);
 static void __init retbleed_select_mitigation(void);
 static void __init retbleed_update_mitigation(void);
 static void __init retbleed_apply_mitigation(void);
@@ -217,6 +219,12 @@ void __init cpu_select_mitigations(void)
 	 * After mitigations are selected, some may need to update their
 	 * choices.
 	 */
+	spectre_v2_update_mitigation();
+	/*
+	 * retbleed_update_mitigation() relies on the state set by
+	 * spectre_v2_update_mitigation(); specifically it wants to know about
+	 * spectre_v2=ibrs.
+	 */
 	retbleed_update_mitigation();
 	/*
 	 * spectre_v2_user_update_mitigation() depends on
@@ -230,6 +238,7 @@ void __init cpu_select_mitigations(void)
 	bhi_update_mitigation();
 
 	spectre_v1_apply_mitigation();
+	spectre_v2_apply_mitigation();
 	retbleed_apply_mitigation();
 	spectre_v2_user_apply_mitigation();
 	mds_apply_mitigation();
@@ -1876,18 +1885,18 @@ static void __init bhi_apply_mitigation(void)
 
 static void __init spectre_v2_select_mitigation(void)
 {
-	enum spectre_v2_mitigation_cmd cmd = spectre_v2_parse_cmdline();
 	enum spectre_v2_mitigation mode = SPECTRE_V2_NONE;
+	spectre_v2_cmd = spectre_v2_parse_cmdline();
 
 	/*
 	 * If the CPU is not affected and the command line mode is NONE or AUTO
 	 * then nothing to do.
 	 */
 	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V2) &&
-	    (cmd == SPECTRE_V2_CMD_NONE || cmd == SPECTRE_V2_CMD_AUTO))
+	    (spectre_v2_cmd == SPECTRE_V2_CMD_NONE || spectre_v2_cmd == SPECTRE_V2_CMD_AUTO))
 		return;
 
-	switch (cmd) {
+	switch (spectre_v2_cmd) {
 	case SPECTRE_V2_CMD_NONE:
 		return;
 
@@ -1898,16 +1907,6 @@ static void __init spectre_v2_select_mitigation(void)
 			break;
 		}
 
-		if (IS_ENABLED(CONFIG_MITIGATION_IBRS_ENTRY) &&
-		    boot_cpu_has_bug(X86_BUG_RETBLEED) &&
-		    retbleed_mitigation != RETBLEED_MITIGATION_NONE &&
-		    retbleed_mitigation != RETBLEED_MITIGATION_STUFF &&
-		    boot_cpu_has(X86_FEATURE_IBRS) &&
-		    boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
-			mode = SPECTRE_V2_IBRS;
-			break;
-		}
-
 		mode = spectre_v2_select_retpoline();
 		break;
 
@@ -1941,10 +1940,32 @@ static void __init spectre_v2_select_mitigation(void)
 		break;
 	}
 
-	if (mode == SPECTRE_V2_EIBRS && unprivileged_ebpf_enabled())
+	spectre_v2_enabled = mode;
+}
+
+static void __init spectre_v2_update_mitigation(void)
+{
+	if (spectre_v2_cmd == SPECTRE_V2_CMD_AUTO) {
+		if (IS_ENABLED(CONFIG_MITIGATION_IBRS_ENTRY) &&
+		    boot_cpu_has_bug(X86_BUG_RETBLEED) &&
+		    retbleed_mitigation != RETBLEED_MITIGATION_NONE &&
+		    retbleed_mitigation != RETBLEED_MITIGATION_STUFF &&
+		    boot_cpu_has(X86_FEATURE_IBRS) &&
+		    boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
+			spectre_v2_enabled = SPECTRE_V2_IBRS;
+		}
+	}
+
+	if (boot_cpu_has_bug(X86_BUG_SPECTRE_V2) && !cpu_mitigations_off())
+		pr_info("%s\n", spectre_v2_strings[spectre_v2_enabled]);
+}
+
+static void __init spectre_v2_apply_mitigation(void)
+{
+	if (spectre_v2_enabled == SPECTRE_V2_EIBRS && unprivileged_ebpf_enabled())
 		pr_err(SPECTRE_V2_EIBRS_EBPF_MSG);
 
-	if (spectre_v2_in_ibrs_mode(mode)) {
+	if (spectre_v2_in_ibrs_mode(spectre_v2_enabled)) {
 		if (boot_cpu_has(X86_FEATURE_AUTOIBRS)) {
 			msr_set_bit(MSR_EFER, _EFER_AUTOIBRS);
 		} else {
@@ -1953,8 +1974,10 @@ static void __init spectre_v2_select_mitigation(void)
 		}
 	}
 
-	switch (mode) {
+	switch (spectre_v2_enabled) {
 	case SPECTRE_V2_NONE:
+		return;
+
 	case SPECTRE_V2_EIBRS:
 		break;
 
@@ -1980,15 +2003,12 @@ static void __init spectre_v2_select_mitigation(void)
 	 * JMPs gets protection against BHI and Intramode-BTI, but RET
 	 * prediction from a non-RSB predictor is still a risk.
 	 */
-	if (mode == SPECTRE_V2_EIBRS_LFENCE ||
-	    mode == SPECTRE_V2_EIBRS_RETPOLINE ||
-	    mode == SPECTRE_V2_RETPOLINE)
+	if (spectre_v2_enabled == SPECTRE_V2_EIBRS_LFENCE ||
+	    spectre_v2_enabled == SPECTRE_V2_EIBRS_RETPOLINE ||
+	    spectre_v2_enabled == SPECTRE_V2_RETPOLINE)
 		spec_ctrl_disable_kernel_rrsba();
 
-	spectre_v2_enabled = mode;
-	pr_info("%s\n", spectre_v2_strings[mode]);
-
-	spectre_v2_select_rsb_mitigation(mode);
+	spectre_v2_select_rsb_mitigation(spectre_v2_enabled);
 
 	/*
 	 * Retpoline protects the kernel, but doesn't protect firmware.  IBRS
@@ -1996,10 +2016,10 @@ static void __init spectre_v2_select_mitigation(void)
 	 * firmware calls only when IBRS / Enhanced / Automatic IBRS aren't
 	 * otherwise enabled.
 	 *
-	 * Use "mode" to check Enhanced IBRS instead of boot_cpu_has(), because
-	 * the user might select retpoline on the kernel command line and if
-	 * the CPU supports Enhanced IBRS, kernel might un-intentionally not
-	 * enable IBRS around firmware calls.
+	 * Use "spectre_v2_enabled" to check Enhanced IBRS instead of
+	 * boot_cpu_has(), because the user might select retpoline on the kernel
+	 * command line and if the CPU supports Enhanced IBRS, kernel might
+	 * un-intentionally not enable IBRS around firmware calls.
 	 */
 	if (boot_cpu_has_bug(X86_BUG_RETBLEED) &&
 	    boot_cpu_has(X86_FEATURE_IBPB) &&
@@ -2011,13 +2031,11 @@ static void __init spectre_v2_select_mitigation(void)
 			pr_info("Enabling Speculation Barrier for firmware calls\n");
 		}
 
-	} else if (boot_cpu_has(X86_FEATURE_IBRS) && !spectre_v2_in_ibrs_mode(mode)) {
+	} else if (boot_cpu_has(X86_FEATURE_IBRS) &&
+		   !spectre_v2_in_ibrs_mode(spectre_v2_enabled)) {
 		setup_force_cpu_cap(X86_FEATURE_USE_IBRS_FW);
 		pr_info("Enabling Restricted Speculation for firmware calls\n");
 	}
-
-	/* Set up IBPB and STIBP depending on the general spectre V2 command */
-	spectre_v2_cmd = cmd;
 }
 
 static void update_stibp_msr(void * __unused)
-- 
2.34.1

