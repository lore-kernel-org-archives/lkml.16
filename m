Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822913A3F7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867103; cv=fail; b=mkPHImxUFmByeDDUjdl2rDLlgOuMdT7rj2n5uaxRS/cnhaliUejtJ2JtDhxwMLWQH95Ysv8oVqeLzKgNuYw2wsEjACyF3nZM/CP+bzA1zt2hszNMKv1vD5EWRnjf+1K65T0ZYG7D2akAHFPJ89uGHHYDamId6Ffm8VIYkvBZptI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867103; c=relaxed/simple;
	bh=DHkN/IcCNJuO7kTols+zunFqNw2ZzI4xkoh5KSn/vUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bswyo8oABRzzt2XBmYcCa8TIG/SJUmKnGrMAS53Hv5Gx+n3sGz8pgaiKjXADpEOQRFblKrWo/7A/P652yneULvN3dJQ69lSF3Z1TGsOS7+xfYaZwtgmk/zN9kyDfdhuAgce83NYqE243FnJbAuZjffwYvSPmTXAxhK45UQOgH3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mir5e81V; arc=fail smtp.client-ip=40.107.244.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mir5e81V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+BubwxyE0HI/wWERIBFvFkbrXLDcYLlJGntX80TBvWkyBZYSFTzJidO3q4UViARjRFeJol+/sr7w9UBLRVLv8Vuz8gfpbpboAD1UTxDBGtJSCfbUZhU2MrSCijSD+eYyzNQKF6Y7DZOUCheWx5BElfBKW4ONvIroSnJioN3aetgSsYaAE5SasbWSUqFjFOcTdVUSxzmNKDcj+oFRs0U3T4W1bT3HwSalXMyqzT2kSG65rAEyYD0A9/t95Q3mDw5armNziLmh5Xq1mn8L1PwL8IXu36oYK75O4U6ZWbNkvXhplCvFOBN3eQHKSrZxc5KVcpTLgYRP1X5yzMSR07v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcmhzC5aCufZU9Gie9pZX64lPL3tXWnBeHErn0ElB2I=;
 b=Ckq9KTcG5o1y1y5E8clBEXuvZFO/qpO3x4OVIDZ8L7zXNVg8ZVkCx+/w6f8Mq8aifuZa1DMvLQ3Yl8eiZvwehpZgh2FjmE7Id/ScnauRjUxRKk7v4Dgb36KStmbHqaOdZB2A+RIZEI4k/PFNzqYfAQO6/iEWmXpOlLQEbM5VFqDSLeFxOAglpGb5iwKjsdInUyp/vgT1RCbojz1elwgqUVKEP3q5q5K5BcYy50D8TO/Q7U0lZ/44FnjYkjWpc25m0wOH9jb6Ddem+z5AIj6784CcRvIIhbAJtkdR0XRdxEoOOgFIRwsHkOw0cjfI/wQCkgkqL5aFkS0sAMaEiZLaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcmhzC5aCufZU9Gie9pZX64lPL3tXWnBeHErn0ElB2I=;
 b=mir5e81VCRzrgpVicS8IMypDtha8Tv0oY1J30iukiG3cQE+s4jQpjFg8rEo2TJkrzrpDqDFByko1dsnyjdR+6m75aYsV/XrHvnVS5/XThrAS4PDIbRwerM6B5kS8nENtsWuMWlvtGVN4KIwm2s7RZzoa4xnRfYW/7agNjI2eKMw=
Received: from MN2PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:c0::30)
 by SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 15:58:19 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::9) by MN2PR05CA0017.outlook.office365.com
 (2603:10b6:208:c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.6 via Frontend Transport; Wed,
 25 Jun 2025 15:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 15:58:19 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 10:58:15 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] x86/bugs: Add SRSO_MITIGATION_NOSMT
Date: Wed, 25 Jun 2025 10:58:03 -0500
Message-ID: <20250625155805.600376-2-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 69239d95-1fd2-4fa0-cb44-08ddb4011a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N9IQhqiucKBePNz5mc1m1n3mvgDlluNUpSdmtzuM+CB6woKkluX+gK0aUB97?=
 =?us-ascii?Q?NcWn3t2W4N3WBHvlpXCuj6M/sKdSKOWEr1RcAXt0PayKvyksZloN0lBD6rTq?=
 =?us-ascii?Q?I1b14ds6ppsGu/ewLFeTHoiutM7zftU5RD5d2YakRb0YRvMXtAD+GKw4YujV?=
 =?us-ascii?Q?8V7+mZ63QL6i5bP3UCspvoAFL52JktmS9rbWtiLChjf+nsYcPPZtOv1UvRtq?=
 =?us-ascii?Q?C6Tl5fhxDJQd0IyZih7XXCyQTXmBOXPn6w37eQW+HMmRqGeuYwLGXt8RIPw0?=
 =?us-ascii?Q?zJTSuIge5qAXp0Lyx73HI+Mmt0Al9FSwZiACkR1O7iWETM3bE3VtssFf7i/P?=
 =?us-ascii?Q?AMElTBHZiC3PjHDmA8j/aeFIiLeiCa3uFO4ESJPm1YAUES0gXj+lWvwaR9QC?=
 =?us-ascii?Q?ETa8cXXO32L2xIGSKm8/ft40WyC8iOEiGJynfvzw9u3TGLQZA1OTMaQTHQFG?=
 =?us-ascii?Q?C2SSKi018JwJsyWeaMbTdYhpbJLApf7WnMHxcLTFi1+ZtasepNt2R25osaeg?=
 =?us-ascii?Q?tkxGBP7kY8KYsOI4Xp+ZkjnsmjjcuHwSkQ5nEXR3Ac3ElhmVYImAtUSl/O52?=
 =?us-ascii?Q?kPrE485wiVCe2+bjjV0D7SeTtQA3Bd19KWwryHIoXevPawQTJKG40hLEv32v?=
 =?us-ascii?Q?PueP44hOErkuHK/vNe78MhJqEaGxohnxJZBFZOVammtyD1f+XCOEe7XlpLsz?=
 =?us-ascii?Q?yTGsFqw/JHq6j6qzff+XseU1cuZQFlXGg5cnrLh8W2MkSxZsyY9Y8lIz5Vb9?=
 =?us-ascii?Q?kM6GW0PQ7lPUK/6MpA5OoPHxyeCF4ihO2FwWRQbChNHi/e/Det4ebO45DvAx?=
 =?us-ascii?Q?NRDNAuHKTizyVjlHaTXuHFY9APD2E12ihVWM/mXxoY7frZf+uHSC8UapKp/r?=
 =?us-ascii?Q?RHNt/zKOl4AolaNR1TMiJM618rr8jFVPwbD5/nDkfTJr2LjCh5QCE/l1CLeH?=
 =?us-ascii?Q?r0FXnAHUqWuEW+J7soDR/+nWyr7m8ClH/RuIPHdmXniv7xlcXpd/ZlIvQaxj?=
 =?us-ascii?Q?fd/zZdM7LOHpdPFQlc8UCpFfooa0Jv3Ev/lU79gg5bGPAKYyF2fGReYPK6tS?=
 =?us-ascii?Q?IfHHrA9Xwhoz7SY2XARc19MujShV3GhSrBCdfZrChc9GEzUig+XtX8EZaojG?=
 =?us-ascii?Q?L/MY4UGBlwunRX31xSqCM+DTUkR/pBa5S91XQf3Q5BtvjLMleEqZhbI6BFR5?=
 =?us-ascii?Q?gEtebYRxc+NEE9nYRh+XapZSWUrQUth1h8B6ppmXnB4FvomWknVFpLmrmMI6?=
 =?us-ascii?Q?iHAGN8S/DDhNHwtr3bL66vPNwefzuanyDygRwdtvhBt8GVys/l7edksGnxqD?=
 =?us-ascii?Q?FCwEaQYP/79YjENFUGbGdfoIpqPEBriF9EUtBqC1fCaVWmkZhiAimqM4Mytj?=
 =?us-ascii?Q?iql7QDB4BMq1qVHnRaEeulEuF5bsxlIXmDz1gc1yeRO9JNaxnbEfLSfFKjRA?=
 =?us-ascii?Q?TKsG8g7VyKE8M+U3JbqlNr7rhTqCU5xO0W0BciKtVcFITsoNyfLVSOqv65xx?=
 =?us-ascii?Q?N4QniJsyRsEA10onpmeRKzARdioAck4anEiK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:58:19.0367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69239d95-1fd2-4fa0-cb44-08ddb4011a9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117

Zen1 and Zen2 CPUs with SMT disabled are not vulnerable to SRSO.
Instead of overloading the X86_FEATURE_SRSO_NO bit to indicate this,
define a separate mitigation to make the code cleaner.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
Reviewed-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/bugs.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index bdef2c9aa1b8..6c991afb7b78 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2851,6 +2851,7 @@ enum srso_mitigation {
 	SRSO_MITIGATION_UCODE_NEEDED,
 	SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED,
 	SRSO_MITIGATION_MICROCODE,
+	SRSO_MITIGATION_NOSMT,
 	SRSO_MITIGATION_SAFE_RET,
 	SRSO_MITIGATION_IBPB,
 	SRSO_MITIGATION_IBPB_ON_VMEXIT,
@@ -2862,6 +2863,7 @@ static const char * const srso_strings[] = {
 	[SRSO_MITIGATION_UCODE_NEEDED]		= "Vulnerable: No microcode",
 	[SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED]	= "Vulnerable: Safe RET, no microcode",
 	[SRSO_MITIGATION_MICROCODE]		= "Vulnerable: Microcode, no safe RET",
+	[SRSO_MITIGATION_NOSMT]			= "Mitigation: SMT disabled",
 	[SRSO_MITIGATION_SAFE_RET]		= "Mitigation: Safe RET",
 	[SRSO_MITIGATION_IBPB]			= "Mitigation: IBPB",
 	[SRSO_MITIGATION_IBPB_ON_VMEXIT]	= "Mitigation: IBPB on VMEXIT only",
@@ -2914,8 +2916,7 @@ static void __init srso_select_mitigation(void)
 		 * IBPB microcode has been applied.
 		 */
 		if (boot_cpu_data.x86 < 0x19 && !cpu_smt_possible()) {
-			setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
-			srso_mitigation = SRSO_MITIGATION_NONE;
+			srso_mitigation = SRSO_MITIGATION_NOSMT;
 			return;
 		}
 	} else {
@@ -2968,8 +2969,7 @@ static void __init srso_update_mitigation(void)
 		srso_mitigation = SRSO_MITIGATION_IBPB;
 
 	if (boot_cpu_has_bug(X86_BUG_SRSO) &&
-	    !cpu_mitigations_off() &&
-	    !boot_cpu_has(X86_FEATURE_SRSO_NO))
+	    !cpu_mitigations_off())
 		pr_info("%s\n", srso_strings[srso_mitigation]);
 }
 
@@ -3265,9 +3265,6 @@ static ssize_t retbleed_show_state(char *buf)
 
 static ssize_t srso_show_state(char *buf)
 {
-	if (boot_cpu_has(X86_FEATURE_SRSO_NO))
-		return sysfs_emit(buf, "Mitigation: SMT disabled\n");
-
 	return sysfs_emit(buf, "%s\n", srso_strings[srso_mitigation]);
 }
 
-- 
2.34.1

