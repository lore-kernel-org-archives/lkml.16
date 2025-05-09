Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB8241114
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808149; cv=fail; b=tUPFVhQZIFRagbxQP5r1j9f0INlCYjGaLdkr3783L2Igqoz6Vuq938UqECFYVumnNLoa7B2IeVVedN8WjfzfcbpqE6jMBUaJb5w7Wfm4sajv+4tpBiVvO5qeG9I68yCm9aloCSBUNc5puNvygOPnKTAFJqWjgUvH8KLtOSPTbHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808149; c=relaxed/simple;
	bh=96JgUOpuZxSdrn1gpLF5lfFY8Q7uB9UXUg9he1Ta9sw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFsV4ihmFaKhmdObuW3757k9GWOcwR4skzEcyWkb+3R8F4/YMHsL1IelhQ4FXXOcMMx5l98m0fWERm6J2vz3wc+rHWB83V8BsxMOt9IUQCQKxD40mUfQVHlBy+B1/gHMqcp2wHD3JqLDDkS4Zh+BJXKYL+pQ0j99Yz8+3KguIIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KtsZsgDa; arc=fail smtp.client-ip=40.107.244.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KtsZsgDa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPGnUAogNzSDtbkNI/CS8gb6jIft6TRt+GLXrcmauZkiL1DNBsfD+ZOf5hdHtyLsCuiGkfjw/6YtQR9UnHQJunCEDQ2LWNVnSrczQkUAHAthjz+BVk9FHOVe7NgPIHX8T7sn/6oqrFIyjoYewmjaXfFO7K4QzBvA7ntfgT2KJ/cgks0lCeX3WIJW8FROw89tIcizPdyJgEet2HNOhvfmSDtKdO9RXugd4sAJLOaCXprdzAAhRwM9/+a9kD+pma9r3lCHrGjZORwvhw0SJBnxNDp3TDFefDSvsLKtZjzpnSpZ9opqjE9h+WjSdA1P7tneRamjn1oq0U+kMF0uwf8K8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsMOWUhAPS4lERF+BAdHn98PM4z4Nad+dqCgDa2W4JU=;
 b=p7MTLp6IjbrsOf2B/Nuib1ZHgfjhZPqPHbzXzUVuqATZVdKkcYFltebmzbzPy+daZ52AvZmiljS63WCATaWhpG3RJvfmL41+SWegvSTm3BOqKy7tnX6zU5/f+Oh5xHNPH1EiGYns0vjsR3lS9JYV1F4ReONUFpitWA/i5kBljCqsrWCH4hBvF7a+yAGGngFvZI4j3G6MkGlrv/7rCJ9zgf7gOV1soSfF/hqum0saNEQEzFaf6Evq/fDydBXxrpgPdI3xsQpxCZil6qJDVUn5QiuNBF+QpONdYS2+nnPwqIH0CKs6L6OIYix0UjIdEaRZZC1EFMkSHqRE41V2LaNcBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsMOWUhAPS4lERF+BAdHn98PM4z4Nad+dqCgDa2W4JU=;
 b=KtsZsgDacYQrpMxzKWVAu0K6i3mUkkTXOCvlXy+lO4k84i8YrmsBmVlIpZ6I33/M/So87DVDzbiI3GpooImtW8BVHbqGAXozWQ/4Uq2da13yB31ulG5ikMr1A11cnJw3DbPTvnHePamAcZ1jkrjbNeZ0msKYc/ZeH2Dx3PziZYE=
Received: from BL1PR13CA0104.namprd13.prod.outlook.com (2603:10b6:208:2b9::19)
 by SA1PR12MB7320.namprd12.prod.outlook.com (2603:10b6:806:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 16:29:04 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::ce) by BL1PR13CA0104.outlook.office365.com
 (2603:10b6:208:2b9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:04 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:29:01 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 17/20] x86/bugs: Add attack vector controls for SRSO
Date: Fri, 9 May 2025 11:28:36 -0500
Message-ID: <20250509162839.3057217-18-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR12MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cccb08-3a5a-493f-af74-08dd8f169cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rgl8bS3CEPYFYAqATdplnG9oSqhcQdonrV8gl6D+xJmGj49pYhT19qAR1KAh?=
 =?us-ascii?Q?5y24HLCgxwwwcaJ5qkYMLAyaBlJalh2h28STqA/KFkqOLzUmq0Dssx1gnE0Y?=
 =?us-ascii?Q?vYhNG6TiT6jrHKS25S7G6KymzJxXh2cv88pcKteZFu4U0KHxWA58hZsMXfDy?=
 =?us-ascii?Q?XcV8m8tHX91MRuMIYwOxK9e2BAWN5PgmYNetAY8OoyW/A7zT4lHfxjB/G1vT?=
 =?us-ascii?Q?erTV3vX7IZCP6e3M7RekRSt97pji81SLTFU/AbA8iugCUtZVSqofQP64yD5t?=
 =?us-ascii?Q?aec+WhgG27ALqUMf4l3ciP848xjb1vhIhpC0ANBwyYbEBZgghIPHKNRV4+Ni?=
 =?us-ascii?Q?A0bl6edcLL4suSpZ/snTuu9LZnOYNUy2xB8dChEeoYYPWfalfW6ereSkCRmd?=
 =?us-ascii?Q?VuphUWHYPpASLTJW95dOyp18Ed6NrSbTL0XF8Z8kicuCRBIipTumE5sbj3Ho?=
 =?us-ascii?Q?1ty+qfwBUDfKcWjnlsShhzZliXeDuLNWCTXk0FQaXJkKEwIbFWlnCCJr+KoA?=
 =?us-ascii?Q?nmwX9/NY/c4lycUorsuxtyrYBKsP1VFSMf+d9gSKgS1r5+AOomiuhn0YtN7K?=
 =?us-ascii?Q?rs24X5gJtXaq4KS9HcVVaF7r8VQWnb9ppaqi+NNciMnhLGGJ56OeiRUQzDTf?=
 =?us-ascii?Q?I8OYgR+CCmZyenyBrmhPlhN+a2TKWtyVkSQsZb3OK4D9t/gvDZRydx2GrRG3?=
 =?us-ascii?Q?X7b9RlvbatMaLf3TiQC7/qIQsmHK6hKRrEn1kSjV//awl8dm2YhImlwZNZm1?=
 =?us-ascii?Q?D+X2luMqT7JXA29ANcOKYgSi8bNrlBrBVWuHehJ6MpQmEzL1jfLZTjnNVZXn?=
 =?us-ascii?Q?8TYfrBeKrge9f/vyM6XBYEyIGD806Dkgf2yJDdNcb+80QEgHQ16Ks86ASetd?=
 =?us-ascii?Q?VpnuMXQkl2Caa7XLR7ykV8w1uOPlAKNzj8UnEBTG9pvTCx5fzBLe0t+cK0Nx?=
 =?us-ascii?Q?Wt/xjykYPjqq35DvvmxFI/f7NchRBf/EWGTS+Xg/BWOIIThde+ssWn6jERoV?=
 =?us-ascii?Q?1g0kJEIJ+G5CNmVFcNSK6wwwZwoS0XdWDIinVnqx6CDRZkjS+R0o5K9/0bcp?=
 =?us-ascii?Q?MRtAtvnFVWt0X2Bp/F1jldXRvSmfD+RqMp5MTQc8zbNRp7JMvAxPsJSpAhw+?=
 =?us-ascii?Q?6rpjCe0sBSNk10qS2WsuLmYBzY48ceQy7udC9rUCfvDqJm8nblyp9jBkCgrI?=
 =?us-ascii?Q?ngVA3yWIYLYFcB1WDUL2T3GLaRht3eZT24Kod61gPczJgs5HQ7PpcSJs3T6N?=
 =?us-ascii?Q?VohoOmS1QBZqZzzcINc7ZH0r4qPWQdoWNPHEwnsLVGTh1olmg734lQnHtiSE?=
 =?us-ascii?Q?fTimb+aIudcd7/gdgTGk/kQiismdAEUy+yK8YctaRFFyGJhVwcs2JHjjeFza?=
 =?us-ascii?Q?brSM7LZguR6xDbRcGu6ON3eamUztm2nXCZKZkqn4P6HuB1YwppHNVVXNLnN5?=
 =?us-ascii?Q?VWsV8nkyd79bEpL3gG16dr7HUK8kpyJCL3pei9t14tfWe3J4lifj2t+p+3rT?=
 =?us-ascii?Q?/8L7jr9CX7FGJGJIYriwTSXUa4zYso2pgOfg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:04.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cccb08-3a5a-493f-af74-08dd8f169cff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7320

Use attack vector controls to determine if SRSO mitigation is required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 19a176369b22..55b0658562c0 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2840,14 +2840,19 @@ static void __init srso_select_mitigation(void)
 {
 	bool has_microcode;
 
-	if (!boot_cpu_has_bug(X86_BUG_SRSO) || cpu_mitigations_off())
+	if (!boot_cpu_has_bug(X86_BUG_SRSO)) {
 		srso_mitigation = SRSO_MITIGATION_NONE;
-
-	if (srso_mitigation == SRSO_MITIGATION_NONE)
 		return;
+	}
 
-	if (srso_mitigation == SRSO_MITIGATION_AUTO)
-		srso_mitigation = SRSO_MITIGATION_SAFE_RET;
+	if (srso_mitigation == SRSO_MITIGATION_AUTO) {
+		if (should_mitigate_vuln(X86_BUG_SRSO)) {
+			srso_mitigation = SRSO_MITIGATION_SAFE_RET;
+		} else {
+			srso_mitigation = SRSO_MITIGATION_NONE;
+			return;
+		}
+	}
 
 	has_microcode = boot_cpu_has(X86_FEATURE_IBPB_BRTYPE);
 	if (has_microcode) {
@@ -2909,7 +2914,7 @@ static void __init srso_update_mitigation(void)
 	    boot_cpu_has(X86_FEATURE_IBPB_BRTYPE))
 		srso_mitigation = SRSO_MITIGATION_IBPB;
 
-	if (boot_cpu_has_bug(X86_BUG_SRSO) && !cpu_mitigations_off())
+	if (boot_cpu_has_bug(X86_BUG_SRSO))
 		pr_info("%s\n", srso_strings[srso_mitigation]);
 }
 
-- 
2.34.1

