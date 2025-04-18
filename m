Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A6217F30
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993063; cv=fail; b=RLp4GaMSo6f4Hx4UH6PBCUiVrPQAESUVTsOZU5aqWf5P+vYKSO97UAfmuxFcZokZLqyJWGYPn49Pp5EkrblEVENG/sIXCYHmOVtgArida6P1lEwFybIr7WTIANWJtZO+r45S2gZcz2uaoQbXntW4GZXO3BwE2a5YJ2Jd21PMWeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993063; c=relaxed/simple;
	bh=qtffWf1gssTclUXMJPT9AvR+8HIItC7QHnOMHezmSk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSFVgbPFD2JKT5HCDlORZQxwR3OxjZBNZUl5yfWJBOgaNFUrCKaKYLlNhhDGQX6DZ6tlagEAd85tvO8xKe29I3NW1hJ0MBI62j+eRb+y1FLKyhPlIIWC08N9xdq6XT8U0cMIsAyxjmAfYFEPziN4hvsZcyv0UIONzcRorOJ8/R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rpsu+V15; arc=fail smtp.client-ip=40.107.96.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rpsu+V15"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb46EJmLpQEuWei2KT+USgUb5Bn7jVmoepckQtrgb16u+pDWSpvPeyGQBJvWVCRBKfenwdTIucLYkOe1HUQm7QthQUbYepgHU35MUerWydZx3zed6GIorA2K/lSnb9QecM31M2jWBwyW+MBZocB0xRbDVCZRnEZDrRI6TLeqbsFA6sM/NH41IlBMQbd18augHTE8Q9YhFOgdRB5XdPpPGWIjpUCVV4ZxiOn6tPUYjDWZigE9GqQKUcgkrHlG1tzo5E46tEoGBBfJlBCmzTcpqGVQYMZkYGWtOnV7jtjduqkylrTLijg9Omeijz0QM5M8+m1df7nGyRODBDplq4cUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbAt0VnNOmUUYoV+umXu/JsfGsS1kJueof43zvJCrYA=;
 b=pnpiNUPYpzxAAfH2IxI/yMM8FQ6aoowsN3hiWURzexRxnsFhkuaVPPV02Bm4psyga+fTIH0q8ITCY9STz4ylzs03atMZWJAkEDEbFCUENWNmPO8biTLUSnWYNRZDAQYtHear6lfQUOvhUquWnuLIvMabjCCFmqmNj29dFqXElw61rlGAjqAzAT6Sb0Hl0LIX1DD+7BoiB0Cia+7fLovemGsM/h+zXMOis0CPL62BSzZTGXLh1jy7buJ0YHhjPwOLudyCDwAZJN/3wQ7czHksxH5aHnued+cEbdMdhzJ7nu9hjqNALJMri1/9pWHwwXXWJF2ppl1L3vlAP7dnjLeKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbAt0VnNOmUUYoV+umXu/JsfGsS1kJueof43zvJCrYA=;
 b=rpsu+V15xUfpHvVdFexOl9O9LQTXDxoUpwi5Jthaa14x19jvGZchjB0eFk8TbyTFwtpqWFmP8Rh9uhbBQe/JqINhk32XzBAjW8KNAKtwziFPHpBvw2nA1qj4fDa+vJMFS8SxPoAurDNbtX/WWHdV5u8GA7Sr7huiRjpgo+iXp/U=
Received: from CH0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::6) by
 IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Fri, 18 Apr 2025 16:17:34 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::2d) by CH0P220CA0008.outlook.office365.com
 (2603:10b6:610:ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Fri,
 18 Apr 2025 16:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:34 +0000
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
Subject: [PATCH v5 03/16] x86/bugs: Restructure MMIO mitigation
Date: Fri, 18 Apr 2025 11:17:08 -0500
Message-ID: <20250418161721.1855190-4-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: a137fa94-9eda-4c8d-a5f7-08dd7e948724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tbS1pfLWiKL/UrjUHWVDxSda2SB4VuVfFmhkl7tDSiYKLGNQarcg+tbRA/5O?=
 =?us-ascii?Q?JRtMLiKhXnCcqKi7ldmbRMo0loL/h6LoShwyEpHRRbpFVBxpWTYphyMF5EOs?=
 =?us-ascii?Q?kbdU49RD9h/3z1aKZJEGeFdYtS4grbhkwh/RdO/7QtRyCg5gCKjii9WqaQ5G?=
 =?us-ascii?Q?pIwU+Lk/6wJNStpHb/s+lEFPAfGQulzMb6wIZH6CC+ql1FHJIsI3vVnJUd4a?=
 =?us-ascii?Q?aIptpxdBTNQKSn99XuLuiDXEAv+7qnnlAMYGMWnFRjWcO2s9nwCWYPZn7DbX?=
 =?us-ascii?Q?sNkOTaFmbeqtltzkbO2/fXkl9xMblet6MkIJ+3bUU5wBW7kc12m58O3qrOZP?=
 =?us-ascii?Q?ZZCR+J6Nq58TVRunQV3PYoh+ULThvrc6eZseMY0H2k+Hcxtsai7HZEkAUGj8?=
 =?us-ascii?Q?h89X5euk5weeIMqFaTquIYICkwKT9ww+PTBz5hTNuGxk/ZBLII/zY5fGP9St?=
 =?us-ascii?Q?UiPaywgLaHG3gMjJwlCW9cc4Ifi9GpFFxd7d0qG+EPWwoFsbvTUleLAthks5?=
 =?us-ascii?Q?WMJBe4yG6x21JMH4M5i61OIm9j/Dcpnfby96seDQKFIrsYsaIlAbzwPm5/1F?=
 =?us-ascii?Q?9LbaZf7iD4dAlx5I58Go9YqbSak3M7K2Wf6IYaM5pExxry1GAMwMvFCDI+8c?=
 =?us-ascii?Q?8XzkaXukrA3aLcP3BjG4Xs6JHFx9F//JqxDvf2qFXcKKB1aLQ3mP5w3Cj3Yn?=
 =?us-ascii?Q?DeuFnDbVp2flkcLuaO86wtQOMymzyhm76raSj0bVt1HyYZlBVVIO7pv5vcNK?=
 =?us-ascii?Q?OuhESwXEIbX05Ff+Fn+UcU+1ukQCB3tz0El1WoRz/itEB7aSVUB0PLU/94pQ?=
 =?us-ascii?Q?04SYEQztxHNWnMI+wwWUlU++N4rk98WG8KWR7As+OVqMaUncy9/xLwYZaUBs?=
 =?us-ascii?Q?KJNSy9llqALNRn+kSLaZmun2dOii7v1hHXy1ZVhYqh9rWiSdO0axfU0NspVL?=
 =?us-ascii?Q?LwUWW166zFOBtzC7s92Gdlq42Kx48cULV+bqDKpfZIrT6pNb5IeAm1FUXBZp?=
 =?us-ascii?Q?IojEHAzIIUsUh7togSFGGVz/YsVj731EmoAjSL009FcwC+cDS2Px8XVzZOKS?=
 =?us-ascii?Q?mIXSTzhQFyUw5wHimi7eavLHgf6USMac9bOXxjlGk3D0e2+OmHxc4NDBJ2D5?=
 =?us-ascii?Q?BT3XEroM2h8RBuXjW4ugGANIGxryzUTr8w6NzkFt0dzfohtazvOxeBbUa8NO?=
 =?us-ascii?Q?y4ePACNEm0VyieUIdlZ5GsBwwVedZ7NDGF42euZ6IHGfworzMpym4Cpf4B4g?=
 =?us-ascii?Q?skGiaGpoaXGkiEMRigEnYHB0Gn2gaoglO5R8+GlurAXCFAj4dek1SYR/obz8?=
 =?us-ascii?Q?N79VDHxhTUzherBUCER/dX66/y9pRD7SQ7mGicKF4jj1Onlzn4tkF0TP+W2l?=
 =?us-ascii?Q?gQ0Es1VFe33b6018XlFzQ5EJ4H2H4HcTSFQTR72Pjp5XyTjLuSdkGiCvy1H7?=
 =?us-ascii?Q?a7EuFmXkKMwxLEMMej0tFmzc7eA5jG+5cBLddX0eLJPU+LFtpM4YghB1sJfp?=
 =?us-ascii?Q?MKtQ9JIKG9hEEwAqyUsF8Fhj3WEh+v/OnY94?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:34.3215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a137fa94-9eda-4c8d-a5f7-08dd7e948724
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531

Restructure MMIO mitigation to use select/update/apply functions to
create consistent vulnerability handling.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 74 +++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index c0ba034ae1f9..28b55a7457bc 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -68,6 +68,8 @@ static void __init taa_select_mitigation(void);
 static void __init taa_update_mitigation(void);
 static void __init taa_apply_mitigation(void);
 static void __init mmio_select_mitigation(void);
+static void __init mmio_update_mitigation(void);
+static void __init mmio_apply_mitigation(void);
 static void __init srbds_select_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
@@ -197,6 +199,7 @@ void __init cpu_select_mitigations(void)
 	l1tf_select_mitigation();
 	mds_select_mitigation();
 	taa_select_mitigation();
+	mmio_select_mitigation();
 	md_clear_select_mitigation();
 	srbds_select_mitigation();
 	l1d_flush_select_mitigation();
@@ -214,9 +217,11 @@ void __init cpu_select_mitigations(void)
 	 */
 	mds_update_mitigation();
 	taa_update_mitigation();
+	mmio_update_mitigation();
 
 	mds_apply_mitigation();
 	taa_apply_mitigation();
+	mmio_apply_mitigation();
 }
 
 /*
@@ -516,25 +521,62 @@ static void __init mmio_select_mitigation(void)
 		return;
 	}
 
+	/* Microcode will be checked in mmio_update_mitigation(). */
+	if (mmio_mitigation == MMIO_MITIGATION_AUTO)
+		mmio_mitigation = MMIO_MITIGATION_VERW;
+
 	if (mmio_mitigation == MMIO_MITIGATION_OFF)
 		return;
 
 	/*
 	 * Enable CPU buffer clear mitigation for host and VMM, if also affected
-	 * by MDS or TAA. Otherwise, enable mitigation for VMM only.
+	 * by MDS or TAA.
 	 */
-	if (boot_cpu_has_bug(X86_BUG_MDS) || (boot_cpu_has_bug(X86_BUG_TAA) &&
-					      boot_cpu_has(X86_FEATURE_RTM)))
-		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
+	if (boot_cpu_has_bug(X86_BUG_MDS) || taa_vulnerable())
+		verw_mitigation_selected = true;
+}
+
+static void __init mmio_update_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA) || cpu_mitigations_off())
+		return;
+
+	if (verw_mitigation_selected)
+		mmio_mitigation = MMIO_MITIGATION_VERW;
+
+	if (mmio_mitigation == MMIO_MITIGATION_VERW) {
+		/*
+		 * Check if the system has the right microcode.
+		 *
+		 * CPU Fill buffer clear mitigation is enumerated by either an explicit
+		 * FB_CLEAR or by the presence of both MD_CLEAR and L1D_FLUSH on MDS
+		 * affected systems.
+		 */
+		if (!((x86_arch_cap_msr & ARCH_CAP_FB_CLEAR) ||
+		      (boot_cpu_has(X86_FEATURE_MD_CLEAR) &&
+		       boot_cpu_has(X86_FEATURE_FLUSH_L1D) &&
+		     !(x86_arch_cap_msr & ARCH_CAP_MDS_NO))))
+			mmio_mitigation = MMIO_MITIGATION_UCODE_NEEDED;
+	}
+
+	pr_info("%s\n", mmio_strings[mmio_mitigation]);
+}
+
+static void __init mmio_apply_mitigation(void)
+{
+	if (mmio_mitigation == MMIO_MITIGATION_OFF)
+		return;
 
 	/*
-	 * X86_FEATURE_CLEAR_CPU_BUF could be enabled by other VERW based
-	 * mitigations, disable KVM-only mitigation in that case.
+	 * Only enable the VMM mitigation if the CPU buffer clear mitigation is
+	 * not being used.
 	 */
-	if (boot_cpu_has(X86_FEATURE_CLEAR_CPU_BUF))
+	if (verw_mitigation_selected) {
+		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
 		static_branch_disable(&cpu_buf_vm_clear);
-	else
+	} else {
 		static_branch_enable(&cpu_buf_vm_clear);
+	}
 
 	/*
 	 * If Processor-MMIO-Stale-Data bug is present and Fill Buffer data can
@@ -544,21 +586,6 @@ static void __init mmio_select_mitigation(void)
 	if (!(x86_arch_cap_msr & ARCH_CAP_FBSDP_NO))
 		static_branch_enable(&mds_idle_clear);
 
-	/*
-	 * Check if the system has the right microcode.
-	 *
-	 * CPU Fill buffer clear mitigation is enumerated by either an explicit
-	 * FB_CLEAR or by the presence of both MD_CLEAR and L1D_FLUSH on MDS
-	 * affected systems.
-	 */
-	if ((x86_arch_cap_msr & ARCH_CAP_FB_CLEAR) ||
-	    (boot_cpu_has(X86_FEATURE_MD_CLEAR) &&
-	     boot_cpu_has(X86_FEATURE_FLUSH_L1D) &&
-	     !(x86_arch_cap_msr & ARCH_CAP_MDS_NO)))
-		mmio_mitigation = MMIO_MITIGATION_VERW;
-	else
-		mmio_mitigation = MMIO_MITIGATION_UCODE_NEEDED;
-
 	if (mmio_nosmt || cpu_mitigations_auto_nosmt())
 		cpu_smt_disable(false);
 }
@@ -679,7 +706,6 @@ static void __init md_clear_update_mitigation(void)
 
 static void __init md_clear_select_mitigation(void)
 {
-	mmio_select_mitigation();
 	rfds_select_mitigation();
 
 	/*
-- 
2.34.1

