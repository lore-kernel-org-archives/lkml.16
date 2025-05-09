Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAF6238151
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808154; cv=fail; b=HkUYHZly3/SmaPGxFsBz1TKvIGWidlanDyU6DXMQ0ErOEVqEHPBGqhr/pxqbB9cxJr44C5FLHpQngt3TJGUUOMZxvQJdWE8f/IL618WaR7x9WoxKdslW7ozh8rtIUy+o4H/yfi0Q1cdzij52RypUkmS7uoxIuncmu4zcpkuGZus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808154; c=relaxed/simple;
	bh=nnVEZK8E2WSfyPPq4z6x1v0qkqfcXD713rKpQABisd0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMGgVs7OWBncmo3V+NeppJTtNVi3/w35i2rnkCKhSfz5WW8a+FBXNyrUh6G9LS3UsP+r6Z6qyI7S+WJP8V5TsCgMuttw+VoBgWGTM1hAvIpK+Ty1uw81QLdV8m0+pUzIc2drA9NKXxHEqVRTJawRQWHv8eS01DBsCkmN9zg8Vfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bHJ99MF4; arc=fail smtp.client-ip=40.107.93.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bHJ99MF4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuz+ZZxSdiYI3tw1G+1B+I2FT4ef5GYIUimpV8NoToEosHphDfLn001nuyk1/iCmdHj9LaJPsw7VRtX4/MUpqttsIhXr/Uj8b0LwnPHydx7/189/0rguhg94EhOXWSMgAB1ZCVNDiIbv6I+24kZF1r35mc+nV7TKS9+/qSdMtN41IkYDzJ/uGe7GH3T8pVl4BLquycKX1ldKZJ5BHsuZz9qV6qVP3cj7DZZpIDqzo2814oudmvf+Anz6HF+Lue+wmq3uWZUCaMo/j6I8kRCtHrqzFvWRa8YIzJ6StXNtkvTsbbwvsa+sPTYdlOHA2Nt/MeyL8yNzZ+3n9zRwbeu/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESSAFQwIg28BwrwypKLZDxYDSij6Tz1LiZ0Nj3O0cko=;
 b=wqnSEuDQzoh3MsGm0rZ9T1b4xw8r5JgFqGCxzD6enl7t/7Mr/stDM6A4xFZT90P+TOS6nxK+VJiSmkQCl2+LnkUGPt+jUVjvBKCToj/PhScBV5gGck1ZXKs5f6EswzPWPoA45KnZ9mfgZxZvn5hgBUjtQFQdDb3+uvFVJeJ00I5+FLuLxhuROQTssuX3OAml3LSvPY9TiWdIphu6KXRoby0XNy6HjhuSNk/InkdH6uZ+qRP1tilX2JzE4jj44b2tbh+ml5Is0l8KDfj/4P6BSMZ/fXvBwv/cXwTPfSsYvJuF3mHrLdg4D264itvpoZ4CnnVSQvZG6zZQTvav3SF/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESSAFQwIg28BwrwypKLZDxYDSij6Tz1LiZ0Nj3O0cko=;
 b=bHJ99MF4zG3hEPPNVkeRzlAV75m84txwDKTctf7ooF8vM8BlIofLnxj961v6WNRDcHRxbPkMnaienyFlIVWBtiY6nQ9nvV7F1gcnli4Hy6y22i0lSt1q6iwaBalo9TXJvix78L2DsYcXTIONdtRYuuESG9Kv+DWEdt902Niy9bE=
Received: from BL1PR13CA0093.namprd13.prod.outlook.com (2603:10b6:208:2b9::8)
 by PH8PR12MB7421.namprd12.prod.outlook.com (2603:10b6:510:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 16:29:05 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::38) by BL1PR13CA0093.outlook.office365.com
 (2603:10b6:208:2b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.11 via Frontend Transport; Fri,
 9 May 2025 16:29:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:05 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:29:02 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 19/20] x86/bugs: Print enabled attack vectors
Date: Fri, 9 May 2025 11:28:38 -0500
Message-ID: <20250509162839.3057217-20-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|PH8PR12MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 6846cb9e-f80a-4327-e4a0-08dd8f169d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dtVKJjwedUZjMfBtI+wh/JnljFNhNxQozmY742Rcx0zAK/K8RcSTLKBBqWxA?=
 =?us-ascii?Q?S3iFvPjIUWYm46v2++ymyXNt1mBFbWPFOgJ3fvD1cZzInfAc1/T2nbzjN+D/?=
 =?us-ascii?Q?E+DMxp0ikZ8So72WoIfxjbocRGdwj9IYKRxpdqXRzkmQMTscrO9MvMX02n+7?=
 =?us-ascii?Q?kt/8TNBNP/OnOAVej1uosAM+LuXqYCC2u2xQIJkFQha0/MBxTW6iKZGt+Y4A?=
 =?us-ascii?Q?7nbciYSFkWxw4novSLXwPTi/EDs8h1/ReB5t4OTEQA1Wos4gwuEPQTgiJCpp?=
 =?us-ascii?Q?M/5XWoo6jFtBsOpmNFJ+Au/XwPYK5H+uxnYagRqkvbewS/V6L99bYY63uUkN?=
 =?us-ascii?Q?RGwyJMfYjPFNGNL0GYY6XdKuoGbnpzie092s+r8OI6kGNMw1aA0E97I2/q/O?=
 =?us-ascii?Q?yZFo6T9mPqD5ym2rDpB2uwX+i9et5YCRr9Rfzd55pwrLeJXibcbr4g2AFL25?=
 =?us-ascii?Q?EQfG1sAAs426eNbb0z9deo8z0M3OuDQljaa3OSh15HqqBAME1WwpsdbUVbXk?=
 =?us-ascii?Q?AccvMCWYUnbbcevXTlDfzUMDBdl5+AHa+i+zChFbJ0NbSruSZuFhBaJANJDb?=
 =?us-ascii?Q?K79Gh0s9hOo1xkaB+KUGp5IY7Pe909ii/lNC++SW5C9xq68BbhRZnXrfjWRN?=
 =?us-ascii?Q?ifZJ/WoxMsuJV4gMf9p+jzIOZpIib9mefSX4FpDv27w/Fb9aQfl3uEILj6Xv?=
 =?us-ascii?Q?L/JewXTpFCgha3+xNyT/SJTiRbxW3N2TU3TaDYSosutctPPK5krMoS5uySv9?=
 =?us-ascii?Q?q6TMuV5C64CWQ6jq8FB5sExc23kd6Hnd+cL9Fq02KcZBPcAMOlqC+nGXMaKz?=
 =?us-ascii?Q?H3ZdsgR+WvM6aDFLSetHkZFhT7h59s1PmW0HgaKQHdIL5WnLUCqpniQkW3Uc?=
 =?us-ascii?Q?BbkxJY6FpWEB6RXveSJcDd+JGpIxFTrBoDeYk0zPUK4F7DD7d9dtMPF/U3pu?=
 =?us-ascii?Q?kPOY6mQxbr9uMSjL8lExA4OV/oBcxQfkfbdCYN6e7kb5MWJ8XJaR2OhKBchu?=
 =?us-ascii?Q?o1RWp0g1xo5LZK02p6TsdGxQpMtv8pGZQwWbunOnrXHeCBxiB24B0rCdX18t?=
 =?us-ascii?Q?QCdfvSatc4MNaHrjjyZFfAln9aVqBKp+javqwKSWmDOp2LIVnKHgY2v/IfFH?=
 =?us-ascii?Q?uIbsWDlTPngMe/rfBOGajOoEqBWUeOV/4WRwY+TFuY41kukcnX4NeNX8Cssx?=
 =?us-ascii?Q?Cie0CU4qJ1HdyeoIwxz7ZpqQ5ImVlycYhh8qjP5FXtBekAqYB8f0LEgPxMDZ?=
 =?us-ascii?Q?+bgueFGDVGnXLRuPaWMd7izw8xH39zStb8WFTIpeE9aC1i2+RFt0p9DoMMZk?=
 =?us-ascii?Q?1KMjbt/0+01Lc7YUk+RBVO+v6E4QrS2LRXuc0BrTiYEhJn9nFvF+Tpb1a7sP?=
 =?us-ascii?Q?JjtqT6EKLcLpth8hEozZ/v96NEOJ4naXbRHuC4YMeqVhFzUKmorbkG7kxtHm?=
 =?us-ascii?Q?YW0Jqco420i1Dp6WiCkY9B3PM8CpXx4/iZz/u17Mqmnq0ST/VUl1nQSokm5F?=
 =?us-ascii?Q?WCJLEyTjpLb9wYPetksoQJFpC9Di9Ufocq8S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:05.1696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6846cb9e-f80a-4327-e4a0-08dd8f169d91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7421

Print the status of enabled attack vectors and SMT mitigation status in the
boot log for easier reporting and debugging.  This information will also be
available through sysfs.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 55b0658562c0..4e01903ca6fd 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -177,6 +177,39 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
 DEFINE_STATIC_KEY_FALSE(cpu_buf_vm_clear);
 EXPORT_SYMBOL_GPL(cpu_buf_vm_clear);
 
+#undef pr_fmt
+#define pr_fmt(fmt)	"mitigations: " fmt
+
+static void __init cpu_print_attack_vectors(void)
+{
+	pr_info("Enabled attack vectors: ");
+
+	if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL))
+		pr_cont("user_kernel, ");
+
+	if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_USER))
+		pr_cont("user_user, ");
+
+	if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST))
+		pr_cont("guest_host, ");
+
+	if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_GUEST))
+		pr_cont("guest_guest, ");
+
+	pr_cont("SMT mitigations: ");
+
+	switch (smt_mitigations) {
+	case SMT_MITIGATIONS_OFF:
+		pr_cont("off\n");
+		break;
+	case SMT_MITIGATIONS_AUTO:
+		pr_cont("auto\n");
+		break;
+	case SMT_MITIGATIONS_ON:
+		pr_cont("on\n");
+	}
+}
+
 void __init cpu_select_mitigations(void)
 {
 	/*
@@ -197,6 +230,8 @@ void __init cpu_select_mitigations(void)
 
 	x86_arch_cap_msr = x86_read_arch_cap_msr();
 
+	cpu_print_attack_vectors();
+
 	/* Select the proper CPU mitigations before patching alternatives: */
 	spectre_v1_select_mitigation();
 	spectre_v2_select_mitigation();
-- 
2.34.1

