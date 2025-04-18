Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3ED2253AB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993067; cv=fail; b=d2IoFW3EQoSuo9nzTO1LeR4VbICicip8xc6JvNltOrau+E2zZESPvMsNiF1HNsa0H1w0pC6l16Rsxl27R/fQHcPUzlbmJFQx1TvCCQIm59StU2b3YmsttogX71AQ+QSmUf8sHF5QTMKvvWPzKBYdl5PGESjtol7GWAzJyfpl8rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993067; c=relaxed/simple;
	bh=5iRtUnLaQ70eHCpDnnlQSyRBKJbjDLqOD0OwGy3vJ8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRolcFI1c1yJIbp7TNBq0UVfIAD4j5tcmarzmE4tQy807jGJi5kzsAY1PogxNSLm+6a5HLhIuRAzATCT2G5tXyt2UGDDwvMlFLDutpynKrgPcXIERi/HYX2t1IBlUTgDh0cZIyU1opDfBkpC0oQsr1NiXgWtZzXykEeMCIWsLbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lmqGq9GO; arc=fail smtp.client-ip=40.107.244.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lmqGq9GO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qkm2nUhirInC4UV4YJ1qkOhn8+rBYnXnH650AtRzWuw6MDv9/XOLINoz1pxwMAhjStXUveZcQg24x/QkfdecNfK/nLMKWZoUroBm9Hhpik4O1fT7blnHstHSC8nLanqpO28vTeCHe8oq8gtuq1uDSHos1oR/twYlGUeUAybqUA+eLV8ju0sOUjZDUqWAwcamvdpDb83/wBkMF+kIEaYwCLyYw6XkRkAsZenxnQcYZec6feYQ1rpprQ3gYfvngJwP5z5Gu0xDJVHRlq4VsaiMxlt53X+gG3mpyWJhD4BKOFCbNbwTaFUXHcvp37AEAYsIOuTEflQvAjs8KYrthRpuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFotI3Ihh2pzL62wcKH7sAJGZf5NE5OlW2l1PCUQQ+U=;
 b=OUnOc4hBEan8k4XBSMweJ2gFaJ5Akn3iZtS4GqY/gwKEVQ+sodtkIiU9a5lqwSGZxizkXtqSSTmWRS8cmHEQDnW2jyMmdzdvEDP2S4cChIZMPPpE0yxt7I+zjJM9GlCnpVUvXD153PSn1T6la3x0JJ8i+m3Yl5BiYO2E4A78XYlFY2bWKL6QTxrRwGuZh+JNOwfpwVikYO/grbE3EAwd02/cqws8ieI+y7JkiumDyE0uzv+Eg2EI2oH7id5pm2Qu39jFJT+HpSAIeSKGSNug7WJdh025zoxOOOLeP6SE6e4aIay+Tp1Fx/8ZBNCQGQt+P2bS2fHhYWnnZ6y9pl4GLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFotI3Ihh2pzL62wcKH7sAJGZf5NE5OlW2l1PCUQQ+U=;
 b=lmqGq9GOagI+OY38TWAertb+ZsHTjNyJSItJmoM5RmmRBs3Z3ZxwNOJ9vGJsm8mNd/Ycn6YgEBhKrU2SUFaM6hoajQVm8vJiLkVXu3b6eJA1hsCGyHySuJeUst2M9HNNLfsyTiEqEas2z9owKRgQuK0TU18mQO0nJf7MCqIt4xw=
Received: from CH0P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::22)
 by IA1PR12MB6209.namprd12.prod.outlook.com (2603:10b6:208:3e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 16:17:41 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::f0) by CH0P220CA0026.outlook.office365.com
 (2603:10b6:610:ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:40 +0000
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
Subject: [PATCH v5 12/16] x86/bugs: Restructure BHI mitigation
Date: Fri, 18 Apr 2025 11:17:17 -0500
Message-ID: <20250418161721.1855190-13-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: ce71687a-5f58-424d-91cc-08dd7e948af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sonGZiJVoAdWP3eqBgGXC8bIoTDX7ni6WQVHqPmAR+5zAjVeAYmRT694vq38?=
 =?us-ascii?Q?tE8Vd1wU+JqfzT+2dPawb/iehz9WXN8FGTE0t8HlgbyTPPAncPXfpM9/2fcu?=
 =?us-ascii?Q?MvPeQ53ECWeQ3I3ZZP+rS6A7tfobEDZIRNqEOF91Pthng6Yr8jT3Q9k98kcW?=
 =?us-ascii?Q?r6vnjhwJaXI8EM6SEoBKxp9q1C/KfYbr2Ww4V4KuiU111Zkc1FrB/cws8X4r?=
 =?us-ascii?Q?NKPEmNnsSj+TOgeY93jBdYh8lktqmI/R6kRyft7WXHx5p3Aqz3vKIhkYaqEy?=
 =?us-ascii?Q?Q2hBPfES+4JuZuCde6A/TADBqmpJTnHEg+BEAMhQi2Lbt090paWKh6M2PwRC?=
 =?us-ascii?Q?GzJFy5YgzQSsirbJDNo9Q1fo8Sk91aR03RAAcyamnxkzDsPLpLdvTWF1dznv?=
 =?us-ascii?Q?vudyKlyj8qfndIFni4y5EXqSnxTbfvZmqRUXJQckiH4377VB+pte+GRpO8s1?=
 =?us-ascii?Q?FooGC1aYxNMg9XFkUK0byo1XPKSVfK7L75W1X8YS4MYKj3pgcd9jqlGIBWwG?=
 =?us-ascii?Q?jfkamNX6hezAnYUP0iR0NEyiyF7bpLSo9YorFue9AKeK2E+HPaN/Z+q62cfc?=
 =?us-ascii?Q?I5ZRPNmmH0zWSc2so8E8skdc/9adDylAQY5uSnhJJUG2E9AoPd7N0SeRuiVP?=
 =?us-ascii?Q?oY3eSOo2dZiPnptL55rjzOLURNz5YrQEuwEB7xwpeGCUdJREOZyIc4fuDZ+4?=
 =?us-ascii?Q?qWqBzkixFwmdPkf971ddZs6D/iJoDESLICYPzp//53lXjdeHbfj+WHSWIDy8?=
 =?us-ascii?Q?ruJE+X/+tdVR0xSYjla3cIT/CrQKv92QllnbDBsfTAFsolMXHE4FJGNx8fSq?=
 =?us-ascii?Q?y7hzS6xIvAtuOpDUPZQBEPEtFjhA8iHs/mJOW++9pRV15jEYer1ei731PtHU?=
 =?us-ascii?Q?siqEAKh8OtrNiWq0OweyO05kUgPLILTg1dtVfcP/Np0RkCipCj6JuAulgPGE?=
 =?us-ascii?Q?g4VJfPgblN9aeNJauHZM0eWoG0HwgMIJDl8qjIq3TPkHRfzGosKlJBlHfaO2?=
 =?us-ascii?Q?YFPWpPjsOT70ynDF2ocL4/aVYvcwImkqTwlQfsaDHe7AIDUNZ/or4yc8lllu?=
 =?us-ascii?Q?V4g5sMnL6egioe70tyf6et77S1ZjxpQ93uO69uRQIXqexv4TDs4HljkoXA8k?=
 =?us-ascii?Q?6qEyDOHVgB1lP+b+l8soiBnkuRYvYiwWcztMXbip2yAyj+6xCSeCOuplKw3q?=
 =?us-ascii?Q?2xdpXt2iM9sS7K6+chFPaneiUyhFWiO2lLuwou3FWGh8qRwJUPmmajCYdOES?=
 =?us-ascii?Q?y1EkvZiDka5pdgxXv2ValHu+OnVg0IP89M4+mF3rig+J8Ujspa95jpwZ0Npe?=
 =?us-ascii?Q?c/ACxI9gX+MBeThz2IWfZIh9aGH77aaILyDNYh38os+TfmPYR52B8hslqJAu?=
 =?us-ascii?Q?QfYtHXDIbgsX5Maa/yG9QMet2lLJ1Q1n/nr3ThFd/Dz8NpBp2URYGb0fS1R3?=
 =?us-ascii?Q?39RgRsLIGH4pbF0xWUxnVAipB7GR3c2myurCLl9y5eYtZpc8UwZ6rklda+LZ?=
 =?us-ascii?Q?02JH5OUFs5yNUx/+brrJGEnqIi66CAbuKXMg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:40.7377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce71687a-5f58-424d-91cc-08dd7e948af7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6209

Restructure BHI mitigation to use select/update/apply functions to create
consistent vulnerability handling.  BHI mitigation was previously selected
from within spectre_v2_select_mitigation() and now is selected from
cpu_select_mitigation() like with all others.

Define new AUTO mitigation for BHI.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index bb20cfb81015..b7063f58ae88 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -82,6 +82,9 @@ static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
 static void __init gds_select_mitigation(void);
 static void __init gds_apply_mitigation(void);
+static void __init bhi_select_mitigation(void);
+static void __init bhi_update_mitigation(void);
+static void __init bhi_apply_mitigation(void);
 
 /* The base value of the SPEC_CTRL MSR without task-specific bits set */
 u64 x86_spec_ctrl_base;
@@ -208,6 +211,7 @@ void __init cpu_select_mitigations(void)
 	 */
 	srso_select_mitigation();
 	gds_select_mitigation();
+	bhi_select_mitigation();
 
 	/*
 	 * After mitigations are selected, some may need to update their
@@ -223,6 +227,7 @@ void __init cpu_select_mitigations(void)
 	taa_update_mitigation();
 	mmio_update_mitigation();
 	rfds_update_mitigation();
+	bhi_update_mitigation();
 
 	spectre_v1_apply_mitigation();
 	retbleed_apply_mitigation();
@@ -233,6 +238,7 @@ void __init cpu_select_mitigations(void)
 	rfds_apply_mitigation();
 	srbds_apply_mitigation();
 	gds_apply_mitigation();
+	bhi_apply_mitigation();
 }
 
 /*
@@ -1792,12 +1798,13 @@ static bool __init spec_ctrl_bhi_dis(void)
 
 enum bhi_mitigations {
 	BHI_MITIGATION_OFF,
+	BHI_MITIGATION_AUTO,
 	BHI_MITIGATION_ON,
 	BHI_MITIGATION_VMEXIT_ONLY,
 };
 
 static enum bhi_mitigations bhi_mitigation __ro_after_init =
-	IS_ENABLED(CONFIG_MITIGATION_SPECTRE_BHI) ? BHI_MITIGATION_ON : BHI_MITIGATION_OFF;
+	IS_ENABLED(CONFIG_MITIGATION_SPECTRE_BHI) ? BHI_MITIGATION_AUTO : BHI_MITIGATION_OFF;
 
 static int __init spectre_bhi_parse_cmdline(char *str)
 {
@@ -1818,6 +1825,25 @@ static int __init spectre_bhi_parse_cmdline(char *str)
 early_param("spectre_bhi", spectre_bhi_parse_cmdline);
 
 static void __init bhi_select_mitigation(void)
+{
+	if (!boot_cpu_has(X86_BUG_BHI) || cpu_mitigations_off())
+		bhi_mitigation = BHI_MITIGATION_OFF;
+
+	if (bhi_mitigation == BHI_MITIGATION_AUTO)
+		bhi_mitigation = BHI_MITIGATION_ON;
+}
+
+static void __init bhi_update_mitigation(void)
+{
+	if (spectre_v2_cmd == SPECTRE_V2_CMD_NONE)
+		bhi_mitigation = BHI_MITIGATION_OFF;
+
+	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V2) &&
+	     spectre_v2_cmd == SPECTRE_V2_CMD_AUTO)
+		bhi_mitigation = BHI_MITIGATION_OFF;
+}
+
+static void __init bhi_apply_mitigation(void)
 {
 	if (bhi_mitigation == BHI_MITIGATION_OFF)
 		return;
@@ -1959,9 +1985,6 @@ static void __init spectre_v2_select_mitigation(void)
 	    mode == SPECTRE_V2_RETPOLINE)
 		spec_ctrl_disable_kernel_rrsba();
 
-	if (boot_cpu_has(X86_BUG_BHI))
-		bhi_select_mitigation();
-
 	spectre_v2_enabled = mode;
 	pr_info("%s\n", spectre_v2_strings[mode]);
 
-- 
2.34.1

