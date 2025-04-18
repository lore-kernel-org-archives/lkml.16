Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37821420E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993059; cv=fail; b=j5cAylZs5CKvWvx1WtQEh/tcRgXaCG0P7uUG1upY163as46kpzkHmojBVpNKyg8X9EUroa9G7+IJ0o+yeJjfl7LS1Tf8UFqaKWbztj+AvG6O65HgO1iq1m/9gsc155KatTevie6wV9Ea5GnXZOuOGh8TxOxY0c+gQ+Mo9WljFpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993059; c=relaxed/simple;
	bh=dt45PNj+0M5jKE/EBij8x0Tmn2vFvKASbF7a1EWPk5o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7pO7Clv/Q7TyJ82Wz8wdD/DLANPXiU7G2lYA/wBv2yJR3LpW8yRzvK/eF2UVWMPIxxjxVzn3pRgEoFbT4JiqxpMP9Ql2bzFmZHKOAu0Wty2DnTiroNMI2LSfs65FLmoMqCKwC3GW9M17ERrwmhyrfAQ1TT1KrxcbYUbBKypSWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HtMUShqw; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HtMUShqw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CG54rVnaAw3kpokPbVKWAy03DKGxI2t7ljs06QCWXBxloHlsua6rOtuM/fc8ubziYjuoGBJ6+cJUCBiTkd1FZirb3m7p7NN0kGcqelrPJOLIzYMLwtK2t08vgBpVkJ3StMGW8+VyaxCuPyA4o3m0zG8tDU/h0S1nxf5h4iCGjNT9wgSpxTInO4cG0p65o/1Ag1XPOweNb5WYLp2nHYQ6S49blrxtxWqvCXWBPY4fVinMy6w3MeJYk/fezPBcwAw8iBSUvD7RHciNqrqojXo1FG0ktJP6SzC5/fSua4j9B4oan5Ry4ahW5jmP7BlqFIftAl1E4ll+iJsDidWw9LSAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yUiwlZDTxktjU4xlofONWs07IVe2tiI61PNKgc/hnU=;
 b=CH6CWCn7wGioS+sBz0DMy0Pr1ByCPvtL2rRi10hxr1hlAcinteYBLf7BbjQpKX0Pqsxz000NQeH2bKSNxSZW0AKLzrbrtTIbAkHOmLymyjGBNpfAjNUry7OHqMIt/xDOFBP7RxJWuQgVIWNpFYTd/3jZkZNSX9w1U6OssmpRr0f6iGS59SesNCHncvhvIS6jh7X4uSGrRtrjPrEG+RzNvirKlxa7MFbOX6IWdUsbjnH1t8+BpPLSKX+hEsSwW7Is8HNwEVIjfRSMFfVBOh2jGgKL7lxrrGm1xgS0jKuHQ8TpaUywuL/LfX5dUC7NmqCHANGU30UV0ordgoIYulcJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yUiwlZDTxktjU4xlofONWs07IVe2tiI61PNKgc/hnU=;
 b=HtMUShqwua8fw/FtOt5qp5BQUl0oSvUd5ZwykGyPUW2nrNSq9dc6yJSumT38aenkojmn3WooFkXX749xKRYR2/IsS40oZjHsexTNhQ/Yufm8VfYaqL8fw2yptPLV4TO56ge30FhzhFbHZU9eC6XriSUUGB0FNDxDZWhVOV4ar/w=
Received: from CH0P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::17)
 by DS4PR12MB9562.namprd12.prod.outlook.com (2603:10b6:8:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 16:17:34 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::1e) by CH0P220CA0029.outlook.office365.com
 (2603:10b6:610:ef::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.24 via Frontend Transport; Fri,
 18 Apr 2025 16:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:33 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:32 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 02/16] x86/bugs: Restructure TAA mitigation
Date: Fri, 18 Apr 2025 11:17:07 -0500
Message-ID: <20250418161721.1855190-3-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DS4PR12MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dcc5a20-9ff8-402e-f289-08dd7e9486bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W99eU3Q8IYvADfkXf70h1uns6Nc8/l6J9LhTEmEX2J8AOfIh2sYoLeNMnUIc?=
 =?us-ascii?Q?dLErY/eqOVH/6Y5Cwhg2r/v4IecV3Ps74anP0wU0ciH7N5lqylnLGuT9FP9M?=
 =?us-ascii?Q?/OvJUoBEL4wPsfRIqYIHfRbaJS37HFVMisDMvn0hT5NSSCNVHuRH17sUljR+?=
 =?us-ascii?Q?Ucy10lgHCZdr08TL4CWDBXIj72JNoNnaIn7MTzRwgwCxkVOkkYIygVEfcijL?=
 =?us-ascii?Q?DLFunqG9IkHmFXt9IScf1YGsNBMsZfcsPcVVrtzuETl46WiKhseatBY5kzLR?=
 =?us-ascii?Q?Sj0zad63utTKBkWuZqn1mJgb01/fU1vVVBwdkuGUmy6cVlw+fQzrz3nP1/8x?=
 =?us-ascii?Q?t3w6DAzv18rUMGiBAvBGOYYhZcfEJFrNn/Xnor87OOY7nBNucxvoNKPrMdVU?=
 =?us-ascii?Q?/Qo8gwsNcfxu72Dy8g2Gv7DcfuOxmO55nYFIqzZ163v/5qJbQGsZ4Mc9ggZa?=
 =?us-ascii?Q?w1QWpEEKkSrXLoQittV3Aihr/dzAEGUnFH38akKPQVB26EG9TwT07aSYGa28?=
 =?us-ascii?Q?4Melk8Y/2WB9skwkZFOdqtLUCEcsZ7PZJv7CvhdLuKd3CSNubm/XevyplaK0?=
 =?us-ascii?Q?WTGldA3Sg298fEuvrUlbZvbsmVqH8QCijePkMqMiBOSpNAPrXbi+A7ahW4Qf?=
 =?us-ascii?Q?5jd3eaiW+jtB1rPw5p6OJT9X/npftzSOgd4rKD5wPblqy+dYDTg9+y+Jf8JT?=
 =?us-ascii?Q?34uuLxmOOy10TIEdWs/MiTL2ylc0MPaitLUMCJMHLQByrh/Ec6nMuLfbnxrc?=
 =?us-ascii?Q?X6neYAZ33xZf4bP4yotBLhM9uny+/OEh2zJzccEADMQ1Be8z0Nd6XGAi/uKr?=
 =?us-ascii?Q?STT+AGOfgol2h3ZQ8sEuTWHQq666Y1sar8G3OGnj/VYUeDNu9KLE2saYq5Mf?=
 =?us-ascii?Q?ULtXqxM0zC7jM+1zMcNIgPmpnn+bCbf/fWCf2HcHOhYxfMuJkwtzgsgtjC8C?=
 =?us-ascii?Q?qEPyMWwPyiyuTnHOogNE/QgpWMdRNUuQYqzDEenwKs0mJoMqb1dW74dFaoUa?=
 =?us-ascii?Q?YX1C/JT5kSP2vpNSMaBjsyIgYGLLzUM6ddYz5tk9XkDhzlxuNJ3mbfPMPWfO?=
 =?us-ascii?Q?t/zlWfKlZEsail47Q6TsIiOH1Cvzz65Hy1O6jAVc4tezZGuNA2kr1i1W9oI2?=
 =?us-ascii?Q?AtDxia+VukNheFLM5CKPJ4jgS+0GdhrMS4pZIJqcFPJ5N0YVLb+Blw3fIjyI?=
 =?us-ascii?Q?CZEQZAmWsA0s+ATTHuUli4FWqoqHvC5xfPfgwTDMiFhbJ0aXox38ppqELdE7?=
 =?us-ascii?Q?LjO4/89S6K4qU3KRP6Sj1MT7pHcrQjccF0Wo7ZSDNG56BDPj1JiFfDV5neMN?=
 =?us-ascii?Q?N7y9pnK+ShXPMZ3aTAWoltqUt6YdNWjstOhJpIJoPQVynFxAvH5tSCll34hh?=
 =?us-ascii?Q?mrwZApt9pA+ucQFlJbcVNe63+E9PCcuUraZnxKEjCJ+AXmd5vZsdFcgJs1/m?=
 =?us-ascii?Q?8qYu9ktGTXAsHrOCHc5E027lEZcso75vGunPWomiqBXBuLY/0GtijovpDMcD?=
 =?us-ascii?Q?1WU30GzlU94zDt/llB9zM4sQdVbWbSe2tau4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:33.6361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcc5a20-9ff8-402e-f289-08dd7e9486bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9562

Restructure TAA mitigation to use select/update/apply functions to
create consistent vulnerability handling.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 94 ++++++++++++++++++++++++--------------
 1 file changed, 59 insertions(+), 35 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 4295502ea082..c0ba034ae1f9 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -65,6 +65,8 @@ static void __init mds_apply_mitigation(void);
 static void __init md_clear_update_mitigation(void);
 static void __init md_clear_select_mitigation(void);
 static void __init taa_select_mitigation(void);
+static void __init taa_update_mitigation(void);
+static void __init taa_apply_mitigation(void);
 static void __init mmio_select_mitigation(void);
 static void __init srbds_select_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
@@ -194,6 +196,7 @@ void __init cpu_select_mitigations(void)
 	ssb_select_mitigation();
 	l1tf_select_mitigation();
 	mds_select_mitigation();
+	taa_select_mitigation();
 	md_clear_select_mitigation();
 	srbds_select_mitigation();
 	l1d_flush_select_mitigation();
@@ -210,8 +213,10 @@ void __init cpu_select_mitigations(void)
 	 * choices.
 	 */
 	mds_update_mitigation();
+	taa_update_mitigation();
 
 	mds_apply_mitigation();
+	taa_apply_mitigation();
 }
 
 /*
@@ -394,6 +399,11 @@ static const char * const taa_strings[] = {
 	[TAA_MITIGATION_TSX_DISABLED]	= "Mitigation: TSX disabled",
 };
 
+static bool __init taa_vulnerable(void)
+{
+	return boot_cpu_has_bug(X86_BUG_TAA) && boot_cpu_has(X86_FEATURE_RTM);
+}
+
 static void __init taa_select_mitigation(void)
 {
 	if (!boot_cpu_has_bug(X86_BUG_TAA)) {
@@ -407,48 +417,63 @@ static void __init taa_select_mitigation(void)
 		return;
 	}
 
-	if (cpu_mitigations_off()) {
+	if (cpu_mitigations_off())
 		taa_mitigation = TAA_MITIGATION_OFF;
-		return;
-	}
 
-	/*
-	 * TAA mitigation via VERW is turned off if both
-	 * tsx_async_abort=off and mds=off are specified.
-	 */
-	if (taa_mitigation == TAA_MITIGATION_OFF &&
-	    mds_mitigation == MDS_MITIGATION_OFF)
+	/* Microcode will be checked in taa_update_mitigation(). */
+	if (taa_mitigation == TAA_MITIGATION_AUTO)
+		taa_mitigation = TAA_MITIGATION_VERW;
+
+	if (taa_mitigation != TAA_MITIGATION_OFF)
+		verw_mitigation_selected = true;
+}
+
+static void __init taa_update_mitigation(void)
+{
+	if (!taa_vulnerable() || cpu_mitigations_off())
 		return;
 
-	if (boot_cpu_has(X86_FEATURE_MD_CLEAR))
+	if (verw_mitigation_selected)
 		taa_mitigation = TAA_MITIGATION_VERW;
-	else
-		taa_mitigation = TAA_MITIGATION_UCODE_NEEDED;
 
-	/*
-	 * VERW doesn't clear the CPU buffers when MD_CLEAR=1 and MDS_NO=1.
-	 * A microcode update fixes this behavior to clear CPU buffers. It also
-	 * adds support for MSR_IA32_TSX_CTRL which is enumerated by the
-	 * ARCH_CAP_TSX_CTRL_MSR bit.
-	 *
-	 * On MDS_NO=1 CPUs if ARCH_CAP_TSX_CTRL_MSR is not set, microcode
-	 * update is required.
-	 */
-	if ( (x86_arch_cap_msr & ARCH_CAP_MDS_NO) &&
-	    !(x86_arch_cap_msr & ARCH_CAP_TSX_CTRL_MSR))
-		taa_mitigation = TAA_MITIGATION_UCODE_NEEDED;
+	if (taa_mitigation == TAA_MITIGATION_VERW) {
+		/* Check if the requisite ucode is available. */
+		if (!boot_cpu_has(X86_FEATURE_MD_CLEAR))
+			taa_mitigation = TAA_MITIGATION_UCODE_NEEDED;
 
-	/*
-	 * TSX is enabled, select alternate mitigation for TAA which is
-	 * the same as MDS. Enable MDS static branch to clear CPU buffers.
-	 *
-	 * For guests that can't determine whether the correct microcode is
-	 * present on host, enable the mitigation for UCODE_NEEDED as well.
-	 */
-	setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
+		/*
+		 * VERW doesn't clear the CPU buffers when MD_CLEAR=1 and MDS_NO=1.
+		 * A microcode update fixes this behavior to clear CPU buffers. It also
+		 * adds support for MSR_IA32_TSX_CTRL which is enumerated by the
+		 * ARCH_CAP_TSX_CTRL_MSR bit.
+		 *
+		 * On MDS_NO=1 CPUs if ARCH_CAP_TSX_CTRL_MSR is not set, microcode
+		 * update is required.
+		 */
+		if ((x86_arch_cap_msr & ARCH_CAP_MDS_NO) &&
+		   !(x86_arch_cap_msr & ARCH_CAP_TSX_CTRL_MSR))
+			taa_mitigation = TAA_MITIGATION_UCODE_NEEDED;
+	}
 
-	if (taa_nosmt || cpu_mitigations_auto_nosmt())
-		cpu_smt_disable(false);
+	pr_info("%s\n", taa_strings[taa_mitigation]);
+}
+
+static void __init taa_apply_mitigation(void)
+{
+	if (taa_mitigation == TAA_MITIGATION_VERW ||
+	    taa_mitigation == TAA_MITIGATION_UCODE_NEEDED) {
+		/*
+		 * TSX is enabled, select alternate mitigation for TAA which is
+		 * the same as MDS. Enable MDS static branch to clear CPU buffers.
+		 *
+		 * For guests that can't determine whether the correct microcode is
+		 * present on host, enable the mitigation for UCODE_NEEDED as well.
+		 */
+		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
+
+		if (taa_nosmt || cpu_mitigations_auto_nosmt())
+			cpu_smt_disable(false);
+	}
 }
 
 static int __init tsx_async_abort_parse_cmdline(char *str)
@@ -654,7 +679,6 @@ static void __init md_clear_update_mitigation(void)
 
 static void __init md_clear_select_mitigation(void)
 {
-	taa_select_mitigation();
 	mmio_select_mitigation();
 	rfds_select_mitigation();
 
-- 
2.34.1

