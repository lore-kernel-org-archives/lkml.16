Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A01F12E0;
	Thu, 30 Jan 2025 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272060; cv=fail; b=ZGuVeASK5Wjlj++IPe67WOyP4yPKYhhXCAocrfnvDltkFRXXg7ojdTZ29br24LtqdSLiamgZyXPylLY8VkOFSV1BdRL0rjvcgWmieLh7+D6svC14A0wyIxaY2JUn8BZjosI+Dm2bW8rB6JLLjG4xsIN59Dt8n6CpP5HL+16+U3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272060; c=relaxed/simple;
	bh=Iu2WXgVldplSSa/mAiQvBatVsJ38BBBEelg8+0EpsLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZEafV6pMEqf+DdP4FH6U/HN97vHrHSL5yYWDF/ytTGmgO+hGO1hsRPeni7dLftCI34CE4OKyfHhzrf/uj0Qwk3Ca7sPQp6dsJdTFxzv/ooJQ41fLZCvPkFft1MvWIOE2jJcBJexbuIH8xNCQ5dwtTF0GzGOgIHIoQ5HxTaNEic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xAk8KbuV; arc=fail smtp.client-ip=40.107.223.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xAk8KbuV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD9+fYT6R2cjWluNKTD+zYBfgArefst82oxnogsOoMTqQhGJhjgSmS8+sDgtKngvv81KMtZBESibtjtDmCEUM4jUZupB9iVnHXQuzpgLPjZHIVMwEI7RmsHjSbgq2B1WXEmRLa8sDoQCr35S52z8H8KsgEHvkdO5UkltWqOj1nn7eeUJ6bfYDL+CDLfkf8GGGSHp4gTlbJxCvIjVe/VHG7mItErYiuSY+j+L9HCsy7wYKkIj9vnCiG0VbC6CzcV69Xveo2w17VAlNieua9a7RV128xvSiVGA+OVOyEUC7aayhIzH4SGa23soJ05XshIT06VWPVvoHiuiARsvU3I+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eif7wt9Yegq9FMghUWxYaggB58LSd1Z3zEIoJmMZd04=;
 b=YL1niZvw1B8PfY8btFO6mHBLSVR0ujRbf/IlHZ5tr8WbxZvf96wF8TB2tfiBFe6ZrG1hWqVZHF1yAh+FeJFkOQC4Zr+gWc9kgZspGMtyX6qWdcvT6fb4cruMpxsFXy1tO3SFObnbYJJmCaYkMj4lev+QpaNTNdhfNtwN0nYSV4A+CHVhgN/p23IFdCwG57w5fFIfJImivCJqgxjamAKD1yLvN5Y/kwtoyqH0aLZH6gUtK2+Y9THYQvTAry8rnJoDxWFXbLAg4Kq91vVqa5ZjUUZSgbXpm2VzYg0jrFFrelRykSpkpuySBqUuwnlmfgd1nQbxS6sHoEzYc/Z+82lyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eif7wt9Yegq9FMghUWxYaggB58LSd1Z3zEIoJmMZd04=;
 b=xAk8KbuVmT3p7Bunq9yDsrtqw+dIZau3RNB02yWq1mTenLb6alfwGKnT34XUZEgymDsQzE8KUA8cUYuo9isdO0YoU3NMKW+JTLXt/iu4CtPJdN3fBB2ZF5mBMYtUGAmKMl7+ykm9fO6+kRi5uePpDf1pBlTbZ4cFAY6jLvooTxM=
Received: from PH8PR20CA0001.namprd20.prod.outlook.com (2603:10b6:510:23c::15)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 21:20:54 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::37) by PH8PR20CA0001.outlook.office365.com
 (2603:10b6:510:23c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 21:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:20:53 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:20:51 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v3 1/7] x86/cpufeatures: Add support for L3 Smart Data Cache Injection Allocation Enforcement
Date: Thu, 30 Jan 2025 15:20:31 -0600
Message-ID: <be5d9ac169f678d9b3b242910f1b1ceca57087b1.1738272037.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738272037.git.babu.moger@amd.com>
References: <cover.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: fde89e3f-5c43-4222-c8e9-08dd4173fa8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+6zW5Fj7OUVbl+iKeeETHOPn2WoT7cFh8uScl6eRyxl5HcQBUOzK1zL+EvpD?=
 =?us-ascii?Q?iQF3IaH7mDTrtKM/IDj5NpFyAawTDtl5x3OIFPts8/4JYAvG5tgIIM9yIZox?=
 =?us-ascii?Q?8Lkh+NsdPpwzXLLWsDAztV+gBV4YSLDeraF4naYEkUl11wN88b9ZVmr4bLJD?=
 =?us-ascii?Q?xYgjZ1/TMTz67YBTIdoXpMjMJ9ZrrJNgQQi6a/4jFmI8NOQjxcFAUfP3/Wfb?=
 =?us-ascii?Q?o+QjB/rdWfyLZ+yjLLlsPw62oqGQyvJ7noac1k1tayrc6Qfs/HL5ygHu6IP7?=
 =?us-ascii?Q?1G/toTByKmfJyB0HZcwPqqElMTFch8pLRSBlVyVZESarjylIS9b66d73IC2Q?=
 =?us-ascii?Q?ixlRtQyPcwm6epBN3GnLPf90xPzOIdFhyuP8xHGNbHZpfB+JH96vuoxjPG9M?=
 =?us-ascii?Q?6OQXN75E6qOCY/11AUABB1tG/H6AUCYxCZ1nf+QbEIRrEAC7anwp94+ouxx7?=
 =?us-ascii?Q?XoyqXyTa1rcXxH1eaPyPgQT+8fcRmYP/0L5AIDPXrGidJ+xL60tNmU0TWiaN?=
 =?us-ascii?Q?1bC1Ofk+XGcLZImaLckFt8lk/49UaQsLY2HwMIlpkiRWi3KomGRVpjbYAFeJ?=
 =?us-ascii?Q?7/l8m5uyL/TunOqFBRxAv6PCMqIdiW5zaS2AqOeU3R+inpUJRLA9R1W+sNnQ?=
 =?us-ascii?Q?eekoMJGW3Pqjg4sMgKjn3kSsQNeNx9/IZwd+gVkDGvksdsLrXmzpd5jkOO2b?=
 =?us-ascii?Q?KU3tHFDxCr2Dw6ADVBQ+PqH7eLgrUqYf8sJKIKk76+YLPqhpszelva5/XEdI?=
 =?us-ascii?Q?171b5BbV8yiI0SpOU3KQXxgY1YT1riJIYXong9XcY3rdJbtG9gYS0z9u6omV?=
 =?us-ascii?Q?affFweFR4qrwXBX9rfjZj3n6RvuyFxj+yBaCZPchJShVsYiBkDDiNrScyCCK?=
 =?us-ascii?Q?LITaKJKZivzY8aKZ4C81f6b5x+PEnyFfY9ei/yKJXTqc40Blyv1LNzbu/Quo?=
 =?us-ascii?Q?fmVj5qjSyvma4O9R+Oy/pfxIOHZkhYoefus5f9nQO+6kGY/yJBaQWTvLhNlF?=
 =?us-ascii?Q?CiUPL6/87vWTTlXE94ETMG3kuqa38Cll1scoyj3oITBfhI/DYJ93FDORudIE?=
 =?us-ascii?Q?mdrLkNSwkx0wIwjcPG3hgXqegPPlYoLa23e4JsDu40fsNgf47H7ylBsLvc9e?=
 =?us-ascii?Q?SUxZxYVEms09lt5c2JFBvU2rBqNuJNc6kveBLJjF9K1QsIdYhN+3sVk7//bL?=
 =?us-ascii?Q?Glg+3XCiBMB5nHWrYvhYCoEuXpB6HSat1r2JuRIM7ySR23zEJSLAlJhsHM9l?=
 =?us-ascii?Q?ZHZEv2p6QLZCXJGk6i7anTh3KI2sxOuonnHKVp5gDW6fQ57o0UR6lqzir4u5?=
 =?us-ascii?Q?b9p6FcGw/xutWqYJrehAVfSSb9mIAuTUeJNkKs2jVvcD8HeCiBxWotnWOzst?=
 =?us-ascii?Q?tcOi/+VubNMc/6A7MmJkgd2dYgvH9OnZOvK6G/rb0QJi7Y86iHGUjwJVowop?=
 =?us-ascii?Q?j95Gm1kkZ/w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:20:53.6468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde89e3f-5c43-4222-c8e9-08dd4173fa8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318

Smart Data Cache Injection (SDCI) is a mechanism that enables direct
insertion of data from I/O devices into the L3 cache. By directly caching
data from I/O devices rather than first storing the I/O data in DRAM,
SDCI reduces demands on DRAM bandwidth and reduces latency to the processor
consuming the I/O data.

The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system software
to control the portion of the L3 cache used for SDCI.

When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
partitions identified by the highest-supported L3_MASK_n register, where n
is the maximum supported CLOSID.

Add CPUID feature bit that can be used to configure SDCIAE.

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: No changes.

v2: Added dependancy on X86_FEATURE_CAT_L3
    Removed the "" in CPU feature definition.
    Minor text changes.
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c   | 1 +
 arch/x86/kernel/cpu/scattered.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 508c0dad116b..a738617b1910 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -483,6 +483,7 @@
 #define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
+#define X86_FEATURE_SDCIAE		(21*32 + 8) /* L3 Smart Data Cache Injection Allocation Enforcement */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 8bd84114c2d9..8185521ce854 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -70,6 +70,7 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
+	{ X86_FEATURE_SDCIAE,			X86_FEATURE_CAT_L3    },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..d18a7ce16388 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -49,6 +49,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
 	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
+	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
-- 
2.34.1

