Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E5D26A0A7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867106; cv=fail; b=D6XRmEBc5DzhX5vBaraOb1MeR1VCo/DzBRgRNaNcUI6aZvQLtdpcnXkMZ/ky4q0Yg0vuwQEBnixOPfnLJhaMHfB/3KwX/1x4sKBPx/4g0vVtkY6L+nO8ZGhW3gf6WkVB5jTdA1yYCYRjpKLAqaXEvgECpV7kucMgT/T/e/Op7Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867106; c=relaxed/simple;
	bh=MtIkkb2l4LiU2huNGXMrSZxg/0WEXWR/bhSji30GxP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NioUFElOuyQRsTjlIiZY/4pradAZU1Oh2LzsiHnKhxW5tkXpPweDc1eja/8IQ/Vm8aTwLqnYARxCnHAQbfGTF+h7ocHJKWAQyol6JsfcCS4bBUfFWA/58AnkPJxjPRGBo294YTjMhS28V9+VEPN6hI+6Ymu5yLWB349fD+q1viU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nOZp2bDs; arc=fail smtp.client-ip=40.107.102.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nOZp2bDs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=po2FWrHRghr85MAjd9tN1dJLVvtOu9LoFXEFD+YHQHlcEM+n5qZYaqCH/6r0yowIeYCymVyRZfk8LlTIoUsmt9mzTeVG8rYKnKFvtznqOm8c6aofxl75laMLrR76dV5+wO1WUof81obCXTQ3KV1ZNftivaA9xDa57vj7eHzvh8zTu3/us86V66/KfNlKJQRTjsA/6bQdRTCwL5VjhRsSXynUI0q8kh4a8Pn4+I68oopDDcpoYADgXHdVTocWf8HZZln1grCXiWbAp83F1HSnU8YiYtf9ZDdQLk8vHm7XDAHzL7fx2738J/yS8VnsybhEsUwXy3HFoXcddmtpvcJIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6q2jhy9D3tPUDIKdLn5GFCk8XMhbbu08wQbzA+La3k=;
 b=IO1Kybaqxu4B8AuuAk9BjnwNdzdoPnxWGCFu4vUqzQCO8m7dVGIeLsTWpXGxysZOF0qRuLG+5kil9noRxKSPNxw7Bp5FHgvaBzVMLp4GTKluIBE6fZNAIPggmprVUf8VoQedQ4ackWA6Qo5YGs5vvgswBUmM8izhddtaUTFCNgiFWUYsSF5JfDgCr8epD5WlaRQh+ibzEliH0tQJhrkLNw/Ivgd/pp7bTxllAQtuLh9aSajaoK8Uf94n1b88P4Tyig6D7jgan5z2K1QIK1iqBatGyUmVqrPCMziMW6fAuC8RgdFf8Lrj+4ZO8FydvJ0EseKkKOUcWkabNNYpJ506Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6q2jhy9D3tPUDIKdLn5GFCk8XMhbbu08wQbzA+La3k=;
 b=nOZp2bDsCNsnP440aetZZYSy+tS5ERNsUG9yANyHpp6cBg2GCMlwvYfsa2ZHruDUwln9JPJuR8OPjX1wexZF6UEX2vD1zj7O5rPL/YAi4TQkNaJbxNjNIMJtLdRmmOyJr5nj7Vqh1RNmrQZyzs0+8bk/M4uqRhQUlhalSNL9u+Q=
Received: from MN2PR05CA0028.namprd05.prod.outlook.com (2603:10b6:208:c0::41)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 15:58:19 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::92) by MN2PR05CA0028.outlook.office365.com
 (2603:10b6:208:c0::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
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
 2025 10:58:16 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] x86/bugs: Use IBPB for retbleed if used by SRSO
Date: Wed, 25 Jun 2025 10:58:04 -0500
Message-ID: <20250625155805.600376-3-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DS2PR12MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb1923e-988f-44d3-732d-08ddb4011b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIonYULDQNo76oMKYLyWW7qs0iy7l4rQ0ZRrQFzLEcFnk6jeS4Pzew1uOfw6?=
 =?us-ascii?Q?5PU2NPSsfca78xrKJpqiEBU0YX3Lk3bvBjSpkAb8p8WSE/u9/w1mZ5Oa+N7t?=
 =?us-ascii?Q?9TbRCsApDFsTfkRHE4Y83EHCtlNNC1u3kPOzaI2rp8vQaT/LlXdytqQsvbfW?=
 =?us-ascii?Q?IbnVtFbbQJZNjoC0VNSQpVrZo1YB5AhpsLihROv8SzaHhpzEY0rH/QVWCRiK?=
 =?us-ascii?Q?B1icuMGMddykZ167euCmdrH013Re3p8lEHO9iKDhJdg2HGNj3SO/oxlryBky?=
 =?us-ascii?Q?5KhYyANGA37PLVkRa8ubpPSW+9saSCB9b8dPNXuSYBwMakEaOCW+M3mGQg2Q?=
 =?us-ascii?Q?nY6pqcxDngCb7WQQai6pGxUNoyo2wdmagp/NdF5fGiIvfraANbn8qeu6p4LW?=
 =?us-ascii?Q?7F+mc+8n6irhhkD5bphwbi1Q44MSDqFv7V+RDMSSWICOwFCx5l8/wzLOVF4m?=
 =?us-ascii?Q?loa3oeIWSvJO7Obz8uUBkvfhzoCdeWxCzo0h3VANql1BkW4fjN/HR6+RYBwn?=
 =?us-ascii?Q?ojq7+RZIGQgnCcBlZ/wO91UUJbCrtVKyq++oAr8BsRjN2hXxMBNrCo2BgRNC?=
 =?us-ascii?Q?L39aXWgnjLlJayRBjwJiBzGD01XUkTJF2eooZKaEMYffOU0hPhfbI31GibCo?=
 =?us-ascii?Q?TTdtRCc5dBfgBgY640sQlNJcCDPx7ilknE3zglyfA1swtIHSQBTJuDVzsE3a?=
 =?us-ascii?Q?uMheLW9xK4cnwKO+KHxTUc9A8Ltc2OrJyChtEIDIOFD96wUEcanKAh1qbi8t?=
 =?us-ascii?Q?JD6R2oWOigH914kG0g40rNZE4P5Mc40i/3fvw1/HNy7vdvZBUdwEdwoS1vr5?=
 =?us-ascii?Q?OvuJhTI1jf77yB8y+PECnA/tvNBaIZiBSWQWKPfhV4MV+4EK+5W5W2tfbaL1?=
 =?us-ascii?Q?PMFVar7/b5M7fxgq0pZLZaWGume3rnR+nxzvGFIWLGj6A3UVwaLs9dhuVev9?=
 =?us-ascii?Q?hr2QTy0f8d87dQMKfU+PYRHN44yzg1HjUl9zmTyl0iAKujo/GJmrxY9N+ZoA?=
 =?us-ascii?Q?mDaHl7hXBWpSYUoAjiEw63XiiS842uvHyG8qHoJ2HMQGwjg8ytF3heLqeNZN?=
 =?us-ascii?Q?riTo5Om1ECdhc5AmUleA7VIBbyAMWvDvcs++cbV4bLOrA6BeiTNaTWkIp6o1?=
 =?us-ascii?Q?nBC5apj0DvXJVtP/dLatuDirxVaPEwNy+5+RtD/AsqKKEBdhYgZ3YNJXG/5h?=
 =?us-ascii?Q?4DoKEfsbXc2xnptIY/WrNeWzN/Vigrn0/Uo2lQqZ6MoPtiYEaFWukXPRLeoi?=
 =?us-ascii?Q?MKhQLdiA9iqeqmNgHZbfybwzFZGRfbj7xsajlE05f79KeBesNguAcn078LGD?=
 =?us-ascii?Q?F3RXBrY9RG/iEWfcoFPLdqNo4DIOr/yOMSsQXr7IklCHZn3jsrTD3lazBmkx?=
 =?us-ascii?Q?2/YwauKM8hACkeRKPd8DrzR+sBkSUiRE+A4lmxxhF53iTF8DFuzaKOAZW10N?=
 =?us-ascii?Q?0ZMDRN6rW0Ch5TtCPzo5baFy8g1P5dcPzXzB7Hl2682W+X/Tss1Ii9vILRrK?=
 =?us-ascii?Q?VRz5CbkE0cpLQ/21BnCBiT/fD4CHkeEVcerf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:58:19.7818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb1923e-988f-44d3-732d-08ddb4011b0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9774

If spec_rstack_overflow=ibpb then this mitigates retbleed as well.  This
is relevant for Zen1 and Zen2 CPUs which are vulnerable to both bugs.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
Reviewed-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/bugs.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 6c991afb7b78..b26341983230 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1171,6 +1171,21 @@ static enum retbleed_mitigation retbleed_mitigation __ro_after_init =
 
 static int __ro_after_init retbleed_nosmt = false;
 
+enum srso_mitigation {
+	SRSO_MITIGATION_NONE,
+	SRSO_MITIGATION_AUTO,
+	SRSO_MITIGATION_UCODE_NEEDED,
+	SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED,
+	SRSO_MITIGATION_MICROCODE,
+	SRSO_MITIGATION_NOSMT,
+	SRSO_MITIGATION_SAFE_RET,
+	SRSO_MITIGATION_IBPB,
+	SRSO_MITIGATION_IBPB_ON_VMEXIT,
+	SRSO_MITIGATION_BP_SPEC_REDUCE,
+};
+
+static enum srso_mitigation srso_mitigation __ro_after_init = SRSO_MITIGATION_AUTO;
+
 static int __init retbleed_parse_cmdline(char *str)
 {
 	if (!str)
@@ -1280,6 +1295,10 @@ static void __init retbleed_update_mitigation(void)
 	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF)
 		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 
+	/* If SRSO is using IBPB, that works for retbleed too */
+	if (srso_mitigation == SRSO_MITIGATION_IBPB)
+		retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
+
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
 	    !cdt_possible(spectre_v2_enabled)) {
 		pr_err("WARNING: retbleed=stuff depends on retpoline\n");
@@ -2845,19 +2864,6 @@ early_param("l1tf", l1tf_cmdline);
 #undef pr_fmt
 #define pr_fmt(fmt)	"Speculative Return Stack Overflow: " fmt
 
-enum srso_mitigation {
-	SRSO_MITIGATION_NONE,
-	SRSO_MITIGATION_AUTO,
-	SRSO_MITIGATION_UCODE_NEEDED,
-	SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED,
-	SRSO_MITIGATION_MICROCODE,
-	SRSO_MITIGATION_NOSMT,
-	SRSO_MITIGATION_SAFE_RET,
-	SRSO_MITIGATION_IBPB,
-	SRSO_MITIGATION_IBPB_ON_VMEXIT,
-	SRSO_MITIGATION_BP_SPEC_REDUCE,
-};
-
 static const char * const srso_strings[] = {
 	[SRSO_MITIGATION_NONE]			= "Vulnerable",
 	[SRSO_MITIGATION_UCODE_NEEDED]		= "Vulnerable: No microcode",
@@ -2870,8 +2876,6 @@ static const char * const srso_strings[] = {
 	[SRSO_MITIGATION_BP_SPEC_REDUCE]	= "Mitigation: Reduced Speculation"
 };
 
-static enum srso_mitigation srso_mitigation __ro_after_init = SRSO_MITIGATION_AUTO;
-
 static int __init srso_parse_cmdline(char *str)
 {
 	if (!str)
-- 
2.34.1

