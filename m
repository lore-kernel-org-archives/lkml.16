Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03A2253E0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993068; cv=fail; b=suRMuymDzH8qZchzPZNcwIjymob7e3rQF7yecAuhl9HVC5fNXrkNDR3JxNVQ0Vy4JVzmuYKvTI7tDhHLbUbRDhFRaY/S+qodEIkruLOAuqMeJ3xaexLtYKCDkYSMiSBqqECRjtidBjG3nbZFRdt33kScw86qjYMWtMGHsussHu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993068; c=relaxed/simple;
	bh=bajGMSPkB82Z5Zwd7VYwiT/SutgQkxtjxJijRnjSqoY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5yQfOl1o1jzevCQErnFZSxW1zjBruwK6Gpd6r5ewzAaqzBOBp+6apA+j4ol8WoXteaFK/VLstOH3+cNtLuVoYjdCkHrzher9h5mIp2CK5BHA2clrD53pFmGSaRnShLRRp0SN0FWI46HGBz0mY67ikJbFkRrebxRhO0aRvl72mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zpqnqLy8; arc=fail smtp.client-ip=40.107.95.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zpqnqLy8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBPL+LhVc8YtjSUpGKVPor9mSq+v1r34v9NGdlWaKBZDYQmp71nMG7LiySmgpM4RkAjj9W5r7qoYWu1fFJAwSb378whtV27FvuYWESSFO6tQKVkHr10v6Q2BNVwSeMFcUOi5rYUw/Syje5/HCEKUEg7dpzU/llDcyq9BUPLVI35k+pANFn9WOIdSVz0/bV58e/wBSTCYgVJPspsbYgvXu9Vz+7FHZV/4Yo8A1KJldxv/E9IU9FqDj9gCtXvueGJ/7eZNaH6VtCL06NYqBbqIClVzJtX8RdYUatUFGLzgmDs4aJkrydRv0Bx9ajlbK85qgDsCYp+DbcTJ1u6iJKeVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sgwf0Xphyf4SwcKftlufKjMxIk67YlR37oaO8Ej1oOE=;
 b=NIikbMty+CFccHu3RkNbncNAbqHo7rrUR8D3bhZmem5vJYRpZTM2yAoDQK9qXtO0spJ5nkl0iwwlLIjU2gvp1eq7MN+AcWe8OCZ9l9EIJj1SUK9mb2Rwg8CpwDtDvh3WpHn/uhF1JRoSrer9tnB3TdNJrj7A0R+R1dMnKdyP9Xh9KjhKtzd57ZHKoC3RQmpsCnPvFpTfklW0IL+sEBx8r1zLwNuu4Kklt9ZR0Jy0OflgGiV7S3nVtQIxBQWSgjCvJtRYba6UYy7mujUIN3VqLLtWkPOa/fgdwIFc4sFS+6ehYObQJtRPEeKDA3k5h72bX7nVEc6Dl6vWrIudeS9R/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgwf0Xphyf4SwcKftlufKjMxIk67YlR37oaO8Ej1oOE=;
 b=zpqnqLy8uyIp+qLfMxznVnzO7LAw3CmvN9ThJAI5oPsJ9RBYnLIX2PmfskxG6LYsN5gYf9qtA2hEIPAmCj7DYAAWGZUf/YIpYmp4/ADPcW7hhwPdPfes8Dp5B7lGxMye7oVr+zFLoPkpUjS7sInAw3iSogR9lIpYQCBeboaLofg=
Received: from CH0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::27)
 by PH7PR12MB9128.namprd12.prod.outlook.com (2603:10b6:510:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 16:17:39 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::53) by CH0P220CA0006.outlook.office365.com
 (2603:10b6:610:ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:39 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:36 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 10/16] x86/bugs: Restructure retbleed mitigation
Date: Fri, 18 Apr 2025 11:17:15 -0500
Message-ID: <20250418161721.1855190-11-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|PH7PR12MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d003cd-8043-4bc2-4802-08dd7e948a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oSe8TWE1rPjBbCLDyIAUh7ixB8z1RrTkt+GfLRdtNL0UNHty6Avdi+iQEpL6?=
 =?us-ascii?Q?UkQAR30uEFhjO/44YD4sYI6mcQRniPIzlJTdcdc2RVZIVlld4xVKh84Wmc4y?=
 =?us-ascii?Q?lxi5tkmgMUmBfyTV3Cw0AGvmlly7vLrplUSL/W1LVMCosFrTj9X2CM01IkLy?=
 =?us-ascii?Q?LRdRf0UL0ZkeXeLmZA7/xGZrqRwpAdRsTxNVhZ543wXvPR6e9XUp4YRGZj15?=
 =?us-ascii?Q?K27SrE+7d/W7VsuTrHu0475TYvyimVxgGG34Dp78PR7W3Kgfj3X5b7ALtmXN?=
 =?us-ascii?Q?C+MBXWpmLOMxdNqA3LkxNCK7+NslTtmNgMsPBOIJzQxiyEVdL5MnauPDFCYY?=
 =?us-ascii?Q?5lBDsdB3QPz08yeyPI+oeWyY7cpwesZaL+1xwHOj1Ek9osFl9mX/9VUkorCf?=
 =?us-ascii?Q?wMtETKiVupHNhPFETQHpfN7IQHZdbPuO24oK8ABbwn5+EznwNixodvz9rm35?=
 =?us-ascii?Q?vYqEU0r8Kr/LrcrCFdQE5ihVG2RprAinAlETwzCYWQY9Tz9XHPjOd+RXwUlG?=
 =?us-ascii?Q?TBSk5rq3BqrcQWFoKY+pvKgtu80JgQsbnNflvovmMINtljC+bBzVWwJI4TBT?=
 =?us-ascii?Q?CP7JDqjtaJzAplwlwgdkmlGuOW0eM1IRikowb2PVLbDbOFdTesuCTZby2avU?=
 =?us-ascii?Q?bfQaUgdjaaGOPgo7Ck83ohA2MJ25RTyIVIoVsMR00aX6MrwcUFCy9d094qt1?=
 =?us-ascii?Q?KlhTfdwaYankbYHpB6QsdbwM83y2gBBQK73ztIoRLGIthHETRYKTX3skzDPp?=
 =?us-ascii?Q?sLWHU0WWIMkRHMWKB45C9j6YDtjh5t5KlC83HdD3rV7IqHAnJ+Eddp/x1POh?=
 =?us-ascii?Q?F0ByQb3hUNuoZNbIL8vvwcScFMphR4faGAH+AcJm+yDw4mzqetuKOsJYCUtM?=
 =?us-ascii?Q?eDEyPLJK1yskSovLEqoCMnj/AbYBoHZxW6WJDJtEjTnTdkooXh2PLolbL+uL?=
 =?us-ascii?Q?Yp9GONnWsR8Tx82ID+AdQEixEKvH5L0eCLxUOfXdm4NG2EbzsItZl8gCW3pY?=
 =?us-ascii?Q?n40ykSfRF1SRxgt76ve3Gx0y3TlqkxXt3KqDHkH2Mlu0u8e2q1MV0XReXJxm?=
 =?us-ascii?Q?pfLmePQLX77L/5i7Tl0Z1xT0ESQi79ZzEPmHDFlzpV2uJn8M3AYX58ub/XI6?=
 =?us-ascii?Q?AEoyuKBuntRkxRvN0RNb2RmcG4KGIBU3pjFW0cdq2BzvvlSA3kFsEnkja9tw?=
 =?us-ascii?Q?pc+1o5DCXN/w5LWkGRnTNHsQBI8Poc3OyecfKtsc4TRJcWG6VGLc484dqrOd?=
 =?us-ascii?Q?Lr/LIdos6D8A9ELqBCgJTFM5yB/lj+/CHyWf9R55KV+/gU1LU6SuDZzq1NR+?=
 =?us-ascii?Q?oMQ1C53dcYQbT/kvLHa97mtoplq3lOsdaNbG3BE+yQACUD6txSqk7uT4dv7B?=
 =?us-ascii?Q?nv8wan+h/j23pykBXLWWgAQBYjKRh0BflgP8BnyiKb/ASexpaIzx5+gShgxA?=
 =?us-ascii?Q?63c8O13y2AakZnaM+Cs8/tBk9f5XZFd7wlT6iXI7mDO3NZjy9hr26B5U8C9E?=
 =?us-ascii?Q?qwtEbJtX9uXFg94LdxEJ9hxA75WdPlGIZ1Rd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:39.3530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d003cd-8043-4bc2-4802-08dd7e948a24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9128

Restructure retbleed mitigation to use select/update/apply functions to
create consistent vulnerability handling.  The retbleed_update_mitigation()
simplifies the dependency between spectre_v2 and retbleed.

The command line options now directly select a preferred mitigation
which simplifies the logic.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 180 ++++++++++++++++++-------------------
 1 file changed, 90 insertions(+), 90 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 84d3f6b3d1eb..248b6065f4bc 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -57,6 +57,8 @@ static void __init spectre_v1_select_mitigation(void);
 static void __init spectre_v1_apply_mitigation(void);
 static void __init spectre_v2_select_mitigation(void);
 static void __init retbleed_select_mitigation(void);
+static void __init retbleed_update_mitigation(void);
+static void __init retbleed_apply_mitigation(void);
 static void __init spectre_v2_user_select_mitigation(void);
 static void __init ssb_select_mitigation(void);
 static void __init l1tf_select_mitigation(void);
@@ -187,11 +189,6 @@ void __init cpu_select_mitigations(void)
 	/* Select the proper CPU mitigations before patching alternatives: */
 	spectre_v1_select_mitigation();
 	spectre_v2_select_mitigation();
-	/*
-	 * retbleed_select_mitigation() relies on the state set by
-	 * spectre_v2_select_mitigation(); specifically it wants to know about
-	 * spectre_v2=ibrs.
-	 */
 	retbleed_select_mitigation();
 	/*
 	 * spectre_v2_user_select_mitigation() relies on the state set by
@@ -219,12 +216,14 @@ void __init cpu_select_mitigations(void)
 	 * After mitigations are selected, some may need to update their
 	 * choices.
 	 */
+	retbleed_update_mitigation();
 	mds_update_mitigation();
 	taa_update_mitigation();
 	mmio_update_mitigation();
 	rfds_update_mitigation();
 
 	spectre_v1_apply_mitigation();
+	retbleed_apply_mitigation();
 	mds_apply_mitigation();
 	taa_apply_mitigation();
 	mmio_apply_mitigation();
@@ -1081,6 +1080,7 @@ enum spectre_v2_mitigation spectre_v2_enabled __ro_after_init = SPECTRE_V2_NONE;
 
 enum retbleed_mitigation {
 	RETBLEED_MITIGATION_NONE,
+	RETBLEED_MITIGATION_AUTO,
 	RETBLEED_MITIGATION_UNRET,
 	RETBLEED_MITIGATION_IBPB,
 	RETBLEED_MITIGATION_IBRS,
@@ -1088,14 +1088,6 @@ enum retbleed_mitigation {
 	RETBLEED_MITIGATION_STUFF,
 };
 
-enum retbleed_mitigation_cmd {
-	RETBLEED_CMD_OFF,
-	RETBLEED_CMD_AUTO,
-	RETBLEED_CMD_UNRET,
-	RETBLEED_CMD_IBPB,
-	RETBLEED_CMD_STUFF,
-};
-
 static const char * const retbleed_strings[] = {
 	[RETBLEED_MITIGATION_NONE]	= "Vulnerable",
 	[RETBLEED_MITIGATION_UNRET]	= "Mitigation: untrained return thunk",
@@ -1106,9 +1098,7 @@ static const char * const retbleed_strings[] = {
 };
 
 static enum retbleed_mitigation retbleed_mitigation __ro_after_init =
-	RETBLEED_MITIGATION_NONE;
-static enum retbleed_mitigation_cmd retbleed_cmd __ro_after_init =
-	IS_ENABLED(CONFIG_MITIGATION_RETBLEED) ? RETBLEED_CMD_AUTO : RETBLEED_CMD_OFF;
+	IS_ENABLED(CONFIG_MITIGATION_RETBLEED) ? RETBLEED_MITIGATION_AUTO : RETBLEED_MITIGATION_NONE;
 
 static int __ro_after_init retbleed_nosmt = false;
 
@@ -1125,15 +1115,15 @@ static int __init retbleed_parse_cmdline(char *str)
 		}
 
 		if (!strcmp(str, "off")) {
-			retbleed_cmd = RETBLEED_CMD_OFF;
+			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 		} else if (!strcmp(str, "auto")) {
-			retbleed_cmd = RETBLEED_CMD_AUTO;
+			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 		} else if (!strcmp(str, "unret")) {
-			retbleed_cmd = RETBLEED_CMD_UNRET;
+			retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
 		} else if (!strcmp(str, "ibpb")) {
-			retbleed_cmd = RETBLEED_CMD_IBPB;
+			retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
 		} else if (!strcmp(str, "stuff")) {
-			retbleed_cmd = RETBLEED_CMD_STUFF;
+			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 		} else if (!strcmp(str, "nosmt")) {
 			retbleed_nosmt = true;
 		} else if (!strcmp(str, "force")) {
@@ -1154,57 +1144,42 @@ early_param("retbleed", retbleed_parse_cmdline);
 
 static void __init retbleed_select_mitigation(void)
 {
-	bool mitigate_smt = false;
-
-	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
-		return;
-
-	switch (retbleed_cmd) {
-	case RETBLEED_CMD_OFF:
+	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off()) {
+		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 		return;
+	}
 
-	case RETBLEED_CMD_UNRET:
-		if (IS_ENABLED(CONFIG_MITIGATION_UNRET_ENTRY)) {
-			retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
-		} else {
+	switch (retbleed_mitigation) {
+	case RETBLEED_MITIGATION_UNRET:
+		if (!IS_ENABLED(CONFIG_MITIGATION_UNRET_ENTRY)) {
+			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 			pr_err("WARNING: kernel not compiled with MITIGATION_UNRET_ENTRY.\n");
-			goto do_cmd_auto;
 		}
 		break;
-
-	case RETBLEED_CMD_IBPB:
+	case RETBLEED_MITIGATION_IBPB:
 		if (!boot_cpu_has(X86_FEATURE_IBPB)) {
 			pr_err("WARNING: CPU does not support IBPB.\n");
-			goto do_cmd_auto;
-		} else if (IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY)) {
-			retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
-		} else {
+			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
+		} else if (!IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY)) {
 			pr_err("WARNING: kernel not compiled with MITIGATION_IBPB_ENTRY.\n");
-			goto do_cmd_auto;
+			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 		}
 		break;
-
-	case RETBLEED_CMD_STUFF:
-		if (IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING) &&
-		    spectre_v2_enabled == SPECTRE_V2_RETPOLINE) {
-			if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
-				pr_err("WARNING: retbleed=stuff only supported for Intel CPUs.\n");
-				goto do_cmd_auto;
-			}
-			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
-
-		} else {
-			if (IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING))
-				pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
-			else
-				pr_err("WARNING: kernel not compiled with MITIGATION_CALL_DEPTH_TRACKING.\n");
-
-			goto do_cmd_auto;
+	case RETBLEED_MITIGATION_STUFF:
+		if (!IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
+			pr_err("WARNING: kernel not compiled with MITIGATION_CALL_DEPTH_TRACKING.\n");
+			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
+		} else if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
+			pr_err("WARNING: retbleed=stuff only supported for Intel CPUs.\n");
+			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 		}
 		break;
+	default:
+		break;
+	}
 
-do_cmd_auto:
-	case RETBLEED_CMD_AUTO:
+	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO) {
+		/* Intel mitigation selected in retbleed_update_mitigation() */
 		if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
 		    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
 			if (IS_ENABLED(CONFIG_MITIGATION_UNRET_ENTRY))
@@ -1212,18 +1187,65 @@ static void __init retbleed_select_mitigation(void)
 			else if (IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY) &&
 				 boot_cpu_has(X86_FEATURE_IBPB))
 				retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
+			else
+				retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 		}
+	}
+}
 
-		/*
-		 * The Intel mitigation (IBRS or eIBRS) was already selected in
-		 * spectre_v2_select_mitigation().  'retbleed_mitigation' will
-		 * be set accordingly below.
-		 */
+static void __init retbleed_update_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
+		return;
 
-		break;
+	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
+		goto out;
+
+	/*
+	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
+	 * then a different mitigation will be selected below.
+	 */
+	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF) {
+		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
+			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
+			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
+		}
+	}
+	/*
+	 * Let IBRS trump all on Intel without affecting the effects of the
+	 * retbleed= cmdline option except for call depth based stuffing
+	 */
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
+		switch (spectre_v2_enabled) {
+		case SPECTRE_V2_IBRS:
+			retbleed_mitigation = RETBLEED_MITIGATION_IBRS;
+			break;
+		case SPECTRE_V2_EIBRS:
+		case SPECTRE_V2_EIBRS_RETPOLINE:
+		case SPECTRE_V2_EIBRS_LFENCE:
+			retbleed_mitigation = RETBLEED_MITIGATION_EIBRS;
+			break;
+		default:
+			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
+				pr_err(RETBLEED_INTEL_MSG);
+		}
+		/* If nothing has set the mitigation yet, default to NONE. */
+		if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
+			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
+out:
+	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
+}
+
+
+static void __init retbleed_apply_mitigation(void)
+{
+	bool mitigate_smt = false;
 
 	switch (retbleed_mitigation) {
+	case RETBLEED_MITIGATION_NONE:
+		return;
+
 	case RETBLEED_MITIGATION_UNRET:
 		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
 		setup_force_cpu_cap(X86_FEATURE_UNRET);
@@ -1273,28 +1295,6 @@ static void __init retbleed_select_mitigation(void)
 	if (mitigate_smt && !boot_cpu_has(X86_FEATURE_STIBP) &&
 	    (retbleed_nosmt || cpu_mitigations_auto_nosmt()))
 		cpu_smt_disable(false);
-
-	/*
-	 * Let IBRS trump all on Intel without affecting the effects of the
-	 * retbleed= cmdline option except for call depth based stuffing
-	 */
-	if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
-		switch (spectre_v2_enabled) {
-		case SPECTRE_V2_IBRS:
-			retbleed_mitigation = RETBLEED_MITIGATION_IBRS;
-			break;
-		case SPECTRE_V2_EIBRS:
-		case SPECTRE_V2_EIBRS_RETPOLINE:
-		case SPECTRE_V2_EIBRS_LFENCE:
-			retbleed_mitigation = RETBLEED_MITIGATION_EIBRS;
-			break;
-		default:
-			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
-				pr_err(RETBLEED_INTEL_MSG);
-		}
-	}
-
-	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
 }
 
 #undef pr_fmt
@@ -1851,8 +1851,8 @@ static void __init spectre_v2_select_mitigation(void)
 
 		if (IS_ENABLED(CONFIG_MITIGATION_IBRS_ENTRY) &&
 		    boot_cpu_has_bug(X86_BUG_RETBLEED) &&
-		    retbleed_cmd != RETBLEED_CMD_OFF &&
-		    retbleed_cmd != RETBLEED_CMD_STUFF &&
+		    retbleed_mitigation != RETBLEED_MITIGATION_NONE &&
+		    retbleed_mitigation != RETBLEED_MITIGATION_STUFF &&
 		    boot_cpu_has(X86_FEATURE_IBRS) &&
 		    boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
 			mode = SPECTRE_V2_IBRS;
@@ -1960,7 +1960,7 @@ static void __init spectre_v2_select_mitigation(void)
 	    (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
 	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)) {
 
-		if (retbleed_cmd != RETBLEED_CMD_IBPB) {
+		if (retbleed_mitigation != RETBLEED_MITIGATION_IBPB) {
 			setup_force_cpu_cap(X86_FEATURE_USE_IBPB_FW);
 			pr_info("Enabling Speculation Barrier for firmware calls\n");
 		}
-- 
2.34.1

