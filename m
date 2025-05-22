Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3221F5846;
	Thu, 22 May 2025 19:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943539; cv=fail; b=BBKK89e5fzc4ZpvMy324JpcKun7LWie2H9FP8fZmePzqUn22f1dF48CX0N4pXdYEsj8scn4Z5q+T8866kyKEW9nrhbI/wqDv8pwjXO1DLPaNUjrZs6dI8LwxdctPDPNQJ3vMu1IF9n2Ah6OKJThmCuzZKS6vuHS8G+N8E4a2F1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943539; c=relaxed/simple;
	bh=c/UimaDrn4m0NQJKEYDU2W3hPMeT/i+PVZ8lPBWQt10=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fLXJIigGQyjswb9g2YV3Zk0ZjMHaz4N4NIgs5t8TDrcRmo1RkoDdpPJ6z0Nl32pTbVu+XM7WHM1BkODNyrILKsKAHZ7JcViX9pjJXGQxAjdUGEUSLhwugcu9FwGIs3pSuItgC918fA+Z2b0OBSJvVCz2byRJU+TA9bKcjNxjxL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jBGu6Pho; arc=fail smtp.client-ip=40.107.95.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jBGu6Pho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B++Ax0UrKoNszGEpbN4BiJF5pxkT9cIwnHsyZzBy/W/qMY4BYMynfRiQVNDD8vpF8+H7EFnnb4AD+yw6ujjHb2ZEYLlJhMdzAupSSWbBnnJFdtQsLFWWJ/z4g3DMGTI0rYMYbtMmcVCPrQHxuaL44HcPK+JmCPhLDKsJEi+lE4+cVWoEJ//PdPKbVY5ah1QzUJ0NhYalQDNT/0et0p/CisHz4IFkF1nFdE88BEM3sPrumg3D/o8C2YearfWypJn4iuPOMNtD4hYYXy7l4twBE5E5f3yjG5ZKWCWFFA/Nl4WVim1cZCVPQA2JpzpAnS5w7raOFKSMkjIKLeF9UR84QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4MoShoD2SuGk5sPaRohH2WtVmFoHV4cQ82g6Fj/r78=;
 b=mj8/gdxtH2rfgFD7co+Hve9vJQNjFiFbwg/lyVSUPxASpsbSlcIy/UmW42ihTxtooJhhRxmSKuuMrjAcVv+Nnagds7lHuMuAiXuKFrZzbJ3Hs6dMfXE1v4eb3I74/YRbY2PKtLQkgtbJpdpt9/bQhUd7gbEr+xIntvtV6xF8uRU+PXD5oLq/Imv3H+TJVmMyQFQVDjR3XEqHZapKonqIXl7EIbvsdEmRHFyofYxd0cMy/hNbLI4bspvTVSp662VuEpFZRZOiLDMlTQ1nmDNCoYork5POikRdf/TmrmxUCSMneUDOb3oPUc8PiMH6hbBCgUw2KgXo+CGlodubXTZMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4MoShoD2SuGk5sPaRohH2WtVmFoHV4cQ82g6Fj/r78=;
 b=jBGu6PhosUWP271IvVG3VW2QvttgHXTe0mX6YdR3TODIpi05oKi4zaw78wxoLgLVz8FaUif30sNpBGVg/GAxs5E9B4scJ/Xbi3sGBWnFCDJf3lGLbI1UWn1xk7ogNUjdq97zouZ4pXP6mGpGq9aAuWEP4KZXRpXwW22JxUrSe6M=
Received: from MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::9) by
 DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.21; Thu, 22 May 2025 19:52:14 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::fb) by MW4P221CA0004.outlook.office365.com
 (2603:10b6:303:8b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 19:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:52:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:52:09 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <thomas.lendacky@amd.com>,
	<seanjc@google.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <nikunj@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <babu.moger@amd.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/8] x86/cpufeatures: Add support for L3 Smart Data Cache Injection Allocation Enforcement
Date: Thu, 22 May 2025 14:51:32 -0500
Message-ID: <263f7eb2f37992404a1f35bb2aa7c83b63578b09.1747943499.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747943499.git.babu.moger@amd.com>
References: <cover.1747943499.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DM4PR12MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: 8949ffc4-61a3-43b5-b62a-08dd996a25c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fqn0AJKvAT/H5Rw8/2QchkmGqzn0+1UQ0E8sVlwitiXbIDuE6Ra6q511v+9N?=
 =?us-ascii?Q?Ee3gOq0VVpc435OrZMCeDRbCpPGRtzI+27iW1hA64Sc4bFQ4LDri2dcpWaRL?=
 =?us-ascii?Q?9DSTLjBx0VP6SWtmvLSqkXZe0bAUuAvpAOk5S80Cwt1qsH93vOBNmJ9iIxol?=
 =?us-ascii?Q?5KLoZ/On5VUZY6e3TOF/gl2C7Y171Pk6DEyDZxuv+ScRFIIyIkFa9tVt4ywP?=
 =?us-ascii?Q?D4LYvkGjou3A5PZGumU84RN7OTPjjoSlxFQFOIvpZzo8MmoKVPyOplH3WrCb?=
 =?us-ascii?Q?uH45+Nc+qtBc2aBhYEr3EsX4YBrMWNVFavtFqWYo8NiNRjnTXCpZ9mvWmbNo?=
 =?us-ascii?Q?/sXOGMrMpT2GupdVTS/TMGjH5s9Pz5gHNSevTF3bdV6eLuItRG46q/cDLVBI?=
 =?us-ascii?Q?s5xMtTzsPOR3cmWOEbYq4LFwcj0/2YN+IYihqXktpJsrtGkjAZimOMhAsGhi?=
 =?us-ascii?Q?N3e11AukZonnQX+htA67PtmLWg6gQ81EVBuMZ2utnImdTWxqp14GFXx42P1Z?=
 =?us-ascii?Q?s4qx3zkSSfzwJGizLTBsN0xyH/iw3KRnHYfUzgnhrjgT8bb92Qj+yS50442S?=
 =?us-ascii?Q?fRlzjJINL3UZxhrYPAVsBZW08WCjkSeYzBe3nyp55d7pC9C/SO31UaX/hybl?=
 =?us-ascii?Q?1sjOss2AH1drzFaGIs6x0j7/DpyLumMEpuE9EkUdzM9HT8DGm06kmbk06MBE?=
 =?us-ascii?Q?g9egykX7KQRU+/wwiNzc7RA+39ShGMvApvX40B7kKVk27+w4MnLEEszUpfX3?=
 =?us-ascii?Q?ssgXaO7p9O9eAkZxg+2tITUmX5zX2E3M7ucqC9BlHRsv1LGsvwEwd4+wayZJ?=
 =?us-ascii?Q?at8GkEzFTa29td491p74pvVY1xu8AoX6M4Z/SXmMws8qc4VqJKoNEBY5emQ8?=
 =?us-ascii?Q?6GAwSa1IRvpEsgJooNeOex81nqQKPCPGWnLjkfz2jFCCL15DcpgDYHand4jv?=
 =?us-ascii?Q?6sxVv6q+KYdDmH1vifAsLNO3GtFMAhFtbSQk4bVXLH1rpjU15XP8Cu4gyoww?=
 =?us-ascii?Q?Yu4UOfTm0zxnZe/1atxDfjWkQ+deTPG/tT6N+S++t1cUGtRLKgFRvjlZT53k?=
 =?us-ascii?Q?zwDZr7koGPi6VWrxG7sdkRKA2Wk2FiWm5BXTYqpe/Lc24lBk8tsvU1bUOaVa?=
 =?us-ascii?Q?hVbvJZWnvMaeRFvS+mdHvfQeHtW+LIjChTtgHd/S/UhNUhNSxUkZFn1goOcx?=
 =?us-ascii?Q?muR676+Kl+Y271nqjuepKrEML9o37IkeYxBoJygFaTlgia3BgLN1RucdyENP?=
 =?us-ascii?Q?JKOPkWJsIoMnFKaJp3MPDmFmXBMqBD75DSuATWo6c9A9IKezbILb2vcZ7Lzz?=
 =?us-ascii?Q?SXWeyGhv9UHoZtrxGWabS3VlLiA9kpnyWQj2eupAAZ4yNN1TMaAGnuxt532Q?=
 =?us-ascii?Q?xOWiFIIghI0ijwkrjdaHussMUO6SVjHmaTcs48v8zg9QQe81Hq+zAXKC+avT?=
 =?us-ascii?Q?AmLc7+hEpI7/vYoN/Nu+SH1762ignqvUkVg48kLFd3Wymv4PyLNLHA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:52:13.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8949ffc4-61a3-43b5-b62a-08dd996a25c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590

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
v5: No changes.

v4: Resolved a minor conflict in cpufeatures.h.

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
index 6c2c152d8a67..8dfbea91bef6 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -481,6 +481,7 @@
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
 #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_SDCIAE		(21*32 + 9) /* L3 Smart Data Cache Injection Allocation Enforcement */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index a2fbea0be535..2687ae01a471 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -71,6 +71,7 @@ static const struct cpuid_dep cpuid_deps[] = {
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

