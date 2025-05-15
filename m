Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DB128CF5B;
	Thu, 15 May 2025 22:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349559; cv=fail; b=scbr4fbDoD2M8GC1IwsgMgADbFLZfHjfqpedrEbBkBSVG84GaMqCaIp/1vHn7oXcC0mTB1D1Uh7YYlkmJrJhUfiFvOClKKQSaVwVrp5rdtGYABaqEGPLnDVWIcoiimJbSJ6ngbIeD2NLR7VKM2VTvCDFNZwPzS4FOfbd4wwjzO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349559; c=relaxed/simple;
	bh=g1vG1TVFWJ83nexjkUzg6XRo07BFjZ82aZ+Prv+QKFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VuUDhrtsq6mdQytn0fVbGdv8ZKGIei9xmkikcsdB1K30+uBbygyJONCtUD9P8E1LXn6L7MhPD4qvVRbPOY7Zd/NlXYdsJYEN1OJD68GYFHzB0kwKmRaDtaarlWSMvbHmE6ng076ecc9+goZKD/VJ7Z6hN8kp+tcsk4emocmvFxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wrSaL29f; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wrSaL29f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dko0YhzZcRWGYyyHnY95/0TzJn/bJ30JW0KSx5kH3K8e2m40qvzpbtpva6iCYyuYfXMJhvdY/kFoiVUC4GVNa2Hli7mKF1x+o7fRTwBgM1HtFk35nMIz9a3YPWB/p1yPC1aXgySK1p9oCa0/LknNouPWHppkF2fqvzpJKS1vMiFcKr6HMu7sp1EM9mQgwW2Vm6hIrhOUVppphcnt/0xvQ4NQtaov3/PUIeLEc+yn5zMoGH/wEmN6cPnmdgjcCSwAMd684AOA1oNuYFwF6SIVAifW5BAeWYN795diQNLPNLfLq3yzTzMK/dmE3XUu7tM1qMmP84CnsNYPYrTKq3/yWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po7O7xeWZu12ShzY87rp997Tlag5EYSyzVHIz/yf6Qo=;
 b=VhEBb18ZS4eDGDsabUBdO0DqKa/XAocLJ87JLrMvNi+KLKYqygQAF8RbM4HUyoRd47si3CZquaVhryCdpp7fB8tdqSPR5jFyOtlM7pSZG75F2KxCpIAGO8iY/vd+BL2qvw8HrExkwX1OkxKPrEkpVjExF1H4BPG1Jr7fWIQiLFonok1vwANr2kKALmnQ9hSSooM9/Ws+yv/+F5G4FayPmXaf+YHllx2sh1GmA1ThHjZ1AjdkuZFEXSEZoI6D8jwW3hGg6zWvP2tP5a1grT5jKU3cwR/o6XmOb29c6A4P2nTzNgNZhNv2wmLmVvYVReriVlw1kR98j9H2Ohqc0zcGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po7O7xeWZu12ShzY87rp997Tlag5EYSyzVHIz/yf6Qo=;
 b=wrSaL29f/bA6Z6qynFYufbmzJqujXv+02qlX+4BJGvvtHuPuOHMIUXFOlcq7jgxi98727AZDpDBLK1O6r0ebNyxp3PBZqoN7flRAQNaIZrUF2ZdijUETLAsY0rkQD8j0CRITj94szUR9YxCu6yPWY7ij38GeAEhQlFqaGqaw4DE=
Received: from LV3P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::30)
 by SN7PR12MB7809.namprd12.prod.outlook.com (2603:10b6:806:34e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:52:33 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:234:cafe::ad) by LV3P220CA0010.outlook.office365.com
 (2603:10b6:408:234::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Thu,
 15 May 2025 22:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:52:31 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:52:28 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <babu.moger@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
Subject: [PATCH v13 01/27] x86/cpufeatures: Add support for Assignable Bandwidth Monitoring Counters (ABMC)
Date: Thu, 15 May 2025 17:51:46 -0500
Message-ID: <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|SN7PR12MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fee09c0-ea93-4955-5274-08dd94032cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vt6XY9fhwrdr8mTpn469nVAFJ44IvTG1Movec3MZJTWQ3byPoTROpy5aXA+x?=
 =?us-ascii?Q?s13chsTC/CgG8G+Aleno1+9aEadO6ssWVYeMhKKmUCI8t5ebLtz/zKi/Iv3Z?=
 =?us-ascii?Q?eUu05Cu7qAKzIYcF3QgWYakaNxWwSLnoUvqjqbOHulvJZA4TCSXezqhTvPTI?=
 =?us-ascii?Q?yJZdkPtZdiRTTZUbaSbFQs5z0gfM/RMcO/6GP0klJoNZnIK+8aiH17XTAeA7?=
 =?us-ascii?Q?rev45xStniHm+yuvAoWANloXiKXScdzNlEAKaFvdA6Fuv9mLBr9GLkj8csg3?=
 =?us-ascii?Q?7uUQisdF/takwEDK6StO/SkFMgtqZu6nXnDAH6Zr6/EDwc94iH/wOCe99/RC?=
 =?us-ascii?Q?8+E6tPE13aNz87mGbm/FXt4DS8mXLiY2tfywdsqC6kcjWNCIv57+e9Mr0ZFl?=
 =?us-ascii?Q?bvxWCoHr1oLh5tXXxAqO7Q7sv3Jjf4k0qsR4U8emz/fk+aBBNYCW4GWu1Itp?=
 =?us-ascii?Q?3BEWRZ3mbiphdQujUa2ESMKI4iONLvbiYm40EixLAQ9Gj7f09/pL3W8w2Heb?=
 =?us-ascii?Q?VEEe8GFEdSSBluf4gkztztNhk7/SjCgwDBrn/aHcmKkajHwS3EyW2ud0a7WA?=
 =?us-ascii?Q?CqG7RuP16hQ6MHtxZNLw3cI/vcOJEkoJZgUvXSH7tJmnlRJ2NwEvIb09l99N?=
 =?us-ascii?Q?UVVk42PmcoYv47QOH7b9lRoQW/GIrirbdCAFljnD/9ju7BhuJMdmWtYG5VaZ?=
 =?us-ascii?Q?zNoYmayQnn1rTEPeJLyQ/zD7GnGdtxynjAluTaC8HO4bg0U6/xYG7KJr1TMG?=
 =?us-ascii?Q?VRh8sWOl51MWIRkOPGesIrF+rb9uZ/nd34TlQofkv3ITlizNzaxcXxvIdYq0?=
 =?us-ascii?Q?VLr9d6kC44I4AKTeOAurdImOUR6SCp3aKAbjIaF3d27LnCLPJUgBgij67ayw?=
 =?us-ascii?Q?/SSv2sMef0K1oRNyn2+fFSEpKLiTp9EwdFyy1Wxxi3eQ0wQm9Mk3Ib/YTrdi?=
 =?us-ascii?Q?bLTej/k6gzkzBxho81G3X4D0SZrrhvYvTVpzarRJW2D57CrBxqcofqiI1lzt?=
 =?us-ascii?Q?lfvnlxqFOvIVLCjxUf+N+MOGymABiWzqpnM7bPg06agcgMzmqAtmJeS19Rr1?=
 =?us-ascii?Q?Uq8Ux8KPPQSfqOYd8A6mcEyACpIQRwAVuH75CquTNwu4sUush2NikJwhkMg9?=
 =?us-ascii?Q?8Zq8hSP54WwEVJYbskmwRT7x/EAOVsSeN+E7Z5H+O+4cEbTT65XwwDoJAsNy?=
 =?us-ascii?Q?FlCL4UxD3YYDXT3Q6fDuVNYKFqAhDydzShm4U8TkPaTvogiCNdQ8vqhkPi1H?=
 =?us-ascii?Q?BcXBFo1xQlMV5RPR+CiyLtWxH0dV4Oi62echpNClee70ZsYUfvuJ2/oWcGCM?=
 =?us-ascii?Q?AQOIVHb9RSzwFCD2BYd/baIVEQUcp/KJx//+hxAp204rGhrr8ChpzfOU9UZa?=
 =?us-ascii?Q?We2YutI6zcMtb3WqlmnI6F8HQLpZEbPTZh4tyEf8WDpV+iRANikyWz8tjQTB?=
 =?us-ascii?Q?12v11C+BgFuOyuTD8F1o15kXcZBhnVpc5pbrUVeHfyFn+NE3297SlC15d6cT?=
 =?us-ascii?Q?nV3qu8wLuNJ6X9c927s6AmoUnv0WDHkQ/FSZP7/Rm5J5Otp9pghXXIsM7Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:52:31.3151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fee09c0-ea93-4955-5274-08dd94032cc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7809

Users can create as many monitor groups as RMIDs supported by the hardware.
However, bandwidth monitoring feature on AMD system only guarantees that
RMIDs currently assigned to a processor will be tracked by hardware. The
counters of any other RMIDs which are no longer being tracked will be reset
to zero. The MBM event counters return "Unavailable" for the RMIDs that are
not tracked by hardware. So, there can be only limited number of groups
that can give guaranteed monitoring numbers. With ever changing
configurations there is no way to definitely know which of these groups are
being tracked for certain point of time. Users do not have the option to
monitor a group or set of groups for certain period of time without
worrying about RMID being reset in between.

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as it is
assigned. The assigned RMID will be tracked by the hardware until the user
unassigns it manually. There is no need to worry about counters being reset
during this period. Additionally, the user can specify a bitmask
identifying the specific bandwidth types from the given source to track
with the counter.

Without ABMC enabled, monitoring will work in current mode without
assignment option.

The Linux resctrl subsystem provides an interface that allows monitoring of
up to two memory bandwidth events per group, selected from a combination of
available total and local events. When ABMC is enabled, two events will be
assigned to each group by default, in line with the current interface
design. Users will also have the option to configure which types of memory
transactions are counted by these events.

Due to the limited number of available counters (32), users may quickly
exhaust the available counters. If the system runs out of assignable ABMC
counters, the kernel will report an error. In such cases, users will nee
dto unassign one or more active counters to free up countes for new
assignments. The interface will provide options to assign or unassign
events through the group-specific interface file.

The feature can be detected via CPUID_Fn80000020_EBX_x00 bit 5.
Bits Description
5    ABMC (Assignable Bandwidth Monitoring Counters)

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
Note: Checkpatch checks/warnings are ignored to maintain coding style.

v13: Updated the commit log with Linux interface details.

v12: Removed the dependancy on X86_FEATURE_BMEC.
     Removed the Reviewed-by tag as patch has changed.

v11: No changes.

v10: No changes.

v9: Took care of couple of minor merge conflicts. No other changes.

v8: No changes.

v7: Removed "" from feature flags. Not required anymore.
    https://lore.kernel.org/lkml/20240817145058.GCZsC40neU4wkPXeVR@fat_crate.local/

v6: Added Reinette's Reviewed-by. Moved the Checkpatch note below ---.

v5: Minor rebase change and subject line update.

v4: Changes because of rebase. Feature word 21 has few more additions now.
    Changed the text to "tracked by hardware" instead of active.

v3: Change because of rebase. Actual patch did not change.

v2: Added dependency on X86_FEATURE_BMEC.
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c   | 2 ++
 arch/x86/kernel/cpu/scattered.c    | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..d5c14dc678df 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -481,6 +481,7 @@
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
 #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_ABMC		(21*32 + 9) /* Assignable Bandwidth Monitoring Counters */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index a2fbea0be535..2f54831e04e5 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -71,6 +71,8 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
+	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
+	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..3b72b72270f1 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -49,6 +49,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
 	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
+	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
-- 
2.34.1

