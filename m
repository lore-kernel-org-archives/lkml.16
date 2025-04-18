Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08BA227B9F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993069; cv=fail; b=OHnNntqRDYXtWmtgdYy6Q2gp92LlwEdUCxex1nPpbPU9rwHD4yKD8q63e8rANInFWD2YihC+oUtjsP36nLexv+KBnZ5DzQeSWULh4gP7cKBlzQZ8TeODk27lykQPT3o0CmOvdy3I/ScgtXvhLJWmImhmr1qTG0+Kj0MZds8YrbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993069; c=relaxed/simple;
	bh=1EMTUJCQlg2JFmKioKYUBd1PIUgKF0XpX38xcVeWlWE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gd+5f2JTtIrmkVcwN3CpNJOlB6FD+4PkpoyxQD8MSHRGgSu8BxT7lVMaQtEra56vbrfun4ZZaitnt11h65wuAoLBQLcBFhwSioRNlSxokuFRweOAORNoLU+i//rprmuW3/b0GhHDCwq44VcNhDRm3fF4KY3iOvYdBLdRkM6Tq14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gCzi6F1h; arc=fail smtp.client-ip=40.107.94.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gCzi6F1h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3huL/cGDWFUXMS0hs7ji8Sj2dr05QR3A3l8X+AINQo6+7zkOnREBzRcrwKaDStX+Ax2uvjPnuJ9fPKbQZMVGUrOaZM2M48KF2teb6NQKUGkmmWVB2yA+08ag3OIj31CrzRHQqW5VZeSHAiAhHQkufFQ8acH+MnNJphS33nUbg3KKSipP/CJIAXcC1Wl48+1cHfZjmiiqdXJG4CSyitk4QD5oouBdRsBAKIZKQ+pXkxzYalKrSH/QfvGrg6/6PWYTQ3khe2fH2TdWejAtiZrx3j7cOBQWFeWdrzaAqmFsxqIHY6feMft7aWc3IUnFs39YjuiEiPUFKnR1GGi1MuKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10yYG6gKaUANWGlxJ2IzT+O+5mV1AsInBsVtGWzwogU=;
 b=fKFSP17grcNkeN0+i86JDdTNO2OFyGXRbqne6stUe09E0rPfu62yfn1LvN21811b3ObTZFUDaVrpDlmdL8l0If1hwjpKV7d2Xch35PGmPVUL1UaL168StgjYWUXNUxoYHntcy4ntvIMCdVlZ6M6yEw7R2hCl03GmYEfclSDhxx1Rm4OQYKkxAjKnw+xfYGibBPRcMsCR4OWlEQZKeEmV6EnmOL1ksk7yNtzaI+YVomGkwpUU4UeVDaOyYhNFd61n1IId6No8G/CjEFTOIYXrohMpEETypKcR6/r+fJfUhtlinLSzq2WIHEcAoGoJfF+Dh44N5h+lUzXCn6qHJ7+41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10yYG6gKaUANWGlxJ2IzT+O+5mV1AsInBsVtGWzwogU=;
 b=gCzi6F1hnlOY/CQiFYvuIVXRH5nZpI3Q8hQx7HckEO/BqSiZKnoQZEFNmkORXOwaw4pTXOdOSVQULqmFKDQnbbDycBXTLqMjSGatNFDTHNRTWl59mePDizNhZvlCokbUNAU+N1RnYSVWxbdRlEwuoO/MioadV42c2gfNBnF7PUc=
Received: from CH0P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::9) by
 IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.43; Fri, 18 Apr
 2025 16:17:43 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::8a) by CH0P220CA0013.outlook.office365.com
 (2603:10b6:610:ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:43 +0000
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
Subject: [PATCH v5 15/16] x86/bugs: Restructure L1TF mitigation
Date: Fri, 18 Apr 2025 11:17:20 -0500
Message-ID: <20250418161721.1855190-16-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: e57001c0-1d57-416a-7d2e-08dd7e948ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QGvDEPCc8kPktOWDJiRVpkxKBaJkxsv7JfYWLHqjeoR7ttx+bhfAlDq9dE0V?=
 =?us-ascii?Q?LoF47eBbGhr6Vd6nvdoUyWVSdNvBHUNCZNefFdjCxnoeIZrQ6jlG/oSj0iyw?=
 =?us-ascii?Q?fHhuUY29wcoOcZRvcJyVUC8UGV+IWr74NyKM/RUF5j3iAg8JYYpMKQ6IzrvZ?=
 =?us-ascii?Q?QfWKEQGpLrxGbCZN/1du68f1FVX+XnwvWFs486aYhqAw/tSst6yIgWU0wdZd?=
 =?us-ascii?Q?Ch+jAhQmWtwTfLs4qgCiYRF8PolF3Pkke7MYDP3Ix+djayg9WnUx3v5tDIUz?=
 =?us-ascii?Q?8aav4l0+R63Xg0CFJR21KrJA13vw3qZiUxbKheA/PfCRWHnZfPmBzIhVd2OQ?=
 =?us-ascii?Q?xNgNw3GltzHBI0GR5QxarLg83lo7TwWw48Zj8VybGvw7o82CDKeDIX1aGNbK?=
 =?us-ascii?Q?AONUJ4QHBM0JcTds3Yd2QPaUnwFQ7XPNWImaNisZu0OgkZ2Zsv/E+Pb1ti+7?=
 =?us-ascii?Q?hmvMfd8IgPiIgl+RGl2wX84tbOEftBDDDfrRhWJzSfGJjNsKaaZU0Ze8GRE+?=
 =?us-ascii?Q?w0h9gW9fN6sl1cxqHGQ7jFrH3fhrjXkvpaAw3fz4WH9k5YJgptY34UrJ2HLo?=
 =?us-ascii?Q?PdoQQ1/x4x0FXtvG+d1fOn6UpKWR0ReIQmLi1WAZ/n27c26FdbCHaCwdWIkX?=
 =?us-ascii?Q?pYWBtDrHP4ptCP5594i1VADxRTcEq69I5zr/Ey6+aCSbVSXD9SGvWqNF4koD?=
 =?us-ascii?Q?a+AiChayA2ngPMwN4UrgRit5xAqu37+i9uc9rbAppaFd6NUgucf8EIuNWuQ4?=
 =?us-ascii?Q?dvliHdcXhevF18O7vBHxsN1yK4lBQNKV0yiBTzty/5Wh8XBQeZrD2bAyeAvv?=
 =?us-ascii?Q?Zg6sM+rtH6NiwPksC0GO1Yej6fl4nPbB62ZGnHFLVgNB00LbyxhkAL7mRY/2?=
 =?us-ascii?Q?MRlLBkUai/RVuMHt34X1SlOtQmpfUnOZpjMoV2iKxfk1sM3+xzYdM0sBqfgH?=
 =?us-ascii?Q?32L8HZbuQ0UI1xQ6Il9daNm7KytV3c65eyXzaEaUldzEMP4E3k0Eg+wpSGUd?=
 =?us-ascii?Q?YFCLB/ViPOt+CvZMEmKIY8+o1erefTl4ELztnpVd8hI+aFLDXD4tfwnaQk4b?=
 =?us-ascii?Q?B+K3H4Zf2AHmruJ2rlapnvB4vaJrsU7UDbKthS/x2pRYIvZKk92zacdrtV/p?=
 =?us-ascii?Q?vwuyRkkYbwTD6CjKLI9uwh3FK+9B4LlfkKokbbUeG5UeGG+DkI3r86+Sg+e0?=
 =?us-ascii?Q?n18Flu37uGPmNveENxt5NCTbOSdWPK+FyieFQoLrVZuKSgC8EiGCxfdtipsL?=
 =?us-ascii?Q?Kwcazp4pNiF/Ig6+txg04erEDKrX8CQHWsR6rUHBOUA7zPzZQ9PxpzRJI4WV?=
 =?us-ascii?Q?J+r/Yzlua6ByGKCnEfUgtspR9KpbMVs4nFiWUEvP+aoT6r77WwrbHB/ol2MD?=
 =?us-ascii?Q?rpKem2xytfeDUdd4G3IkZlb0185pnIul9RAntTOwBP1mXVJhGb7MCIfTFVXL?=
 =?us-ascii?Q?j3gbPmgq+YilnllPB6vaxGYoVug9Bdep68xMwheb1GFGoxdUCYAf1TYfS0y1?=
 =?us-ascii?Q?znv6sdHihsOZWE6vbMKBjPhMLHMmhBKEjQGn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:43.5364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57001c0-1d57-416a-7d2e-08dd7e948ca2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Restructure L1TF to use select/apply functions to create consistent
vulnerability handling.

Define new AUTO mitigation for L1TF.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/include/asm/processor.h |  1 +
 arch/x86/kernel/cpu/bugs.c       | 25 +++++++++++++++++++------
 arch/x86/kvm/vmx/vmx.c           |  2 ++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index eaa7214d6953..62705783ca3c 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -735,6 +735,7 @@ void store_cpu_caps(struct cpuinfo_x86 *info);
 
 enum l1tf_mitigations {
 	L1TF_MITIGATION_OFF,
+	L1TF_MITIGATION_AUTO,
 	L1TF_MITIGATION_FLUSH_NOWARN,
 	L1TF_MITIGATION_FLUSH,
 	L1TF_MITIGATION_FLUSH_NOSMT,
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index e526d06171cd..5f718537ba70 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -67,6 +67,7 @@ static void __init spectre_v2_user_apply_mitigation(void);
 static void __init ssb_select_mitigation(void);
 static void __init ssb_apply_mitigation(void);
 static void __init l1tf_select_mitigation(void);
+static void __init l1tf_apply_mitigation(void);
 static void __init mds_select_mitigation(void);
 static void __init mds_update_mitigation(void);
 static void __init mds_apply_mitigation(void);
@@ -243,6 +244,7 @@ void __init cpu_select_mitigations(void)
 	retbleed_apply_mitigation();
 	spectre_v2_user_apply_mitigation();
 	ssb_apply_mitigation();
+	l1tf_apply_mitigation();
 	mds_apply_mitigation();
 	taa_apply_mitigation();
 	mmio_apply_mitigation();
@@ -2543,7 +2545,7 @@ EXPORT_SYMBOL_GPL(itlb_multihit_kvm_mitigation);
 
 /* Default mitigation for L1TF-affected CPUs */
 enum l1tf_mitigations l1tf_mitigation __ro_after_init =
-	IS_ENABLED(CONFIG_MITIGATION_L1TF) ? L1TF_MITIGATION_FLUSH : L1TF_MITIGATION_OFF;
+	IS_ENABLED(CONFIG_MITIGATION_L1TF) ? L1TF_MITIGATION_AUTO : L1TF_MITIGATION_OFF;
 #if IS_ENABLED(CONFIG_KVM_INTEL)
 EXPORT_SYMBOL_GPL(l1tf_mitigation);
 #endif
@@ -2590,23 +2592,34 @@ static void override_cache_bits(struct cpuinfo_x86 *c)
 }
 
 static void __init l1tf_select_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_L1TF) || cpu_mitigations_off()) {
+		l1tf_mitigation = L1TF_MITIGATION_OFF;
+		return;
+	}
+
+	if (l1tf_mitigation == L1TF_MITIGATION_AUTO) {
+		if (cpu_mitigations_auto_nosmt())
+			l1tf_mitigation = L1TF_MITIGATION_FLUSH_NOSMT;
+		else
+			l1tf_mitigation = L1TF_MITIGATION_FLUSH;
+	}
+}
+
+static void __init l1tf_apply_mitigation(void)
 {
 	u64 half_pa;
 
 	if (!boot_cpu_has_bug(X86_BUG_L1TF))
 		return;
 
-	if (cpu_mitigations_off())
-		l1tf_mitigation = L1TF_MITIGATION_OFF;
-	else if (cpu_mitigations_auto_nosmt())
-		l1tf_mitigation = L1TF_MITIGATION_FLUSH_NOSMT;
-
 	override_cache_bits(&boot_cpu_data);
 
 	switch (l1tf_mitigation) {
 	case L1TF_MITIGATION_OFF:
 	case L1TF_MITIGATION_FLUSH_NOWARN:
 	case L1TF_MITIGATION_FLUSH:
+	case L1TF_MITIGATION_AUTO:
 		break;
 	case L1TF_MITIGATION_FLUSH_NOSMT:
 	case L1TF_MITIGATION_FULL:
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1547bfacd40f..1b2a783f9ad9 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -273,6 +273,7 @@ static int vmx_setup_l1d_flush(enum vmx_l1d_flush_state l1tf)
 		case L1TF_MITIGATION_OFF:
 			l1tf = VMENTER_L1D_FLUSH_NEVER;
 			break;
+		case L1TF_MITIGATION_AUTO:
 		case L1TF_MITIGATION_FLUSH_NOWARN:
 		case L1TF_MITIGATION_FLUSH:
 		case L1TF_MITIGATION_FLUSH_NOSMT:
@@ -7704,6 +7705,7 @@ int vmx_vm_init(struct kvm *kvm)
 		case L1TF_MITIGATION_FLUSH_NOWARN:
 			/* 'I explicitly don't care' is set */
 			break;
+		case L1TF_MITIGATION_AUTO:
 		case L1TF_MITIGATION_FLUSH:
 		case L1TF_MITIGATION_FLUSH_NOSMT:
 		case L1TF_MITIGATION_FULL:
-- 
2.34.1

