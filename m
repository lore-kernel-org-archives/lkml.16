Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595DA271A84;
	Fri, 13 Jun 2025 21:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848788; cv=fail; b=C3PyaPmMYF4oxsYUChqk/k+R21ADkMwxX9/nrh9gpd6yHNe2KkOC/GFnechW6oH3d/Qnh8VErhP638Kf2LcwGapkf+g6H9bEtZo7O0kq1pFID2fjB4CJJBnJSKOCNgngYQ4rbH1h6x4pIHe41gMuv5H0dx3/VIgnWQ2+diOnE3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848788; c=relaxed/simple;
	bh=MoAbk1nEXwmKkkfeLK2LdiUAwxJK55FTXHKdwnEF/Bs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ePuBwdx83sbAyImKRV+7dOoPEqu1nngAVsadII0vFjSeqyA1WYx+6SL0e046GaJGQkNdZeECAhH3JlftSwVzaSgtZeyAH2yNs/ziovLLtLiAwehGXhi7xy1B8kMJGiKSX3UFY5rZbNo791nesHlYlCDct+N1ILa96OU/eLrbrWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j/mdemX2; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j/mdemX2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1WCi7w5P3GwuO5pQUh0JL/534PqjD1YlXBxuXNoEv9REeSl8Hy5dMlKjtTdE9hxQmlFVB4anY1eEpZ/8qN6A+JQunjg864tGMtJou1vtgKPEdPSdc+2WCcNZ2fS6aETjUEG0z/naieujPI+G1RG60eNwRYAAYYp0LySOhf5lSTsOk+u5omzbucs00tmPlk6m+dqaDThtjHUPrhWNaUDQQj5sPTSLDqBjMBAc6Dtsq3Zki3Wpb+Qaz0i04tZ5VrZClcxeDYTCaZhV+oUt5lMgJx2TES8GZylxExMbhPcjMIyP44Vxl9K7BpxWYgviW3yLxvkARJ9KVjWY4e5EXbUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtzFJvqzMUELqaySWL/j2JzAswxcVP0as/ID9+S0Kmk=;
 b=kjEqROL+pARmCuxFLZ6V7nHYwToGBViloXG0NN9YchEpuxo9j3nOmyknwYbQtVt7Z6hzsTyKczixPji45sAnQqBEwBP3VVQNePsJ9GZ6cueo/s419HF60/H2blrv7HB79OuStiQe5aAENtjU2tCmlYBgi2liNzUeu46ToUZ4LeQ/kxUEd0JV7FtykMx4LBEURHd9dF7dmkiikpDp7+pv7N4xgDOJBNq/j1loHZUwn9v1bS5hsjPQnj9wDMMLBBR8Xq5vBGOM2yUPy22vdzPAMYUhTCfY6cxpUeLzsOMtEWS6a84815WNXEeCy+cZuASOxHcKDow8pqNpQr+z2VeAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtzFJvqzMUELqaySWL/j2JzAswxcVP0as/ID9+S0Kmk=;
 b=j/mdemX2ih3+u5E0AI97Rde7uKD9Xs0jp54IpRQFfSK/xU9J7HiS4Tm3kybu5fWCaeJrVimrJGjBJXViNkRYXpmsdEng5tZefV0A8CylX5+KSWSR5TGAgGd9cOM5F5FI5TJPUBk0PM4wCxvLbQksdHrojRZ9ArmYPvS3f47A5/g=
Received: from PH7P220CA0085.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::26)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 21:06:23 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::7d) by PH7P220CA0085.outlook.office365.com
 (2603:10b6:510:32c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 21:06:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:06:22 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:19 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v14 06/32] x86/cpufeatures: Add support for Assignable Bandwidth Monitoring Counters (ABMC)
Date: Fri, 13 Jun 2025 16:04:50 -0500
Message-ID: <c3a7f07ae0e8d1495b778013afb09d078ee4618d.1749848715.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749848714.git.babu.moger@amd.com>
References: <cover.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f539753-c64a-43a4-635c-08ddaabe267b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jATu5zK1e6J9+2F7oVMSIfOKfZN3yTi7ZbMSS2DpcoKMa/HNMANcarf9z55C?=
 =?us-ascii?Q?3Lmz9io1rYJXXJtC6qxLzFm4riXQno03cV33MShi7sGbyync1s1NhBYCkKQi?=
 =?us-ascii?Q?L6xNpvTpBem50O39a/kX1TP0WbXgikmPOIMLHkz3E19i4V0d4mmR2yXm6wxx?=
 =?us-ascii?Q?uowL0KHO7IvcaZg5/sO8auR0kO0SUfjXjtJyCtYxA8ZWWLIwXeG1vt7DvtZf?=
 =?us-ascii?Q?fxHGL0qYPit0F35tJlDzxcMYLZTA1uPsTYP05aEAMD1Sh9tVt3iIuhQTX3pc?=
 =?us-ascii?Q?ygX/fpuOJ6/xaDP4X2SJSoVgjB0Ls7UO0wLjh/NACsWnYBbe0h9j43gc+Sba?=
 =?us-ascii?Q?p+acTm35ZbmZR5i6tt3GNTdg/VNi0Jzsmwq6FAPCJzt/StcxBdciBW+rGujh?=
 =?us-ascii?Q?OvPjLss+jDL5LMrLBQPcws0AEIH74o7wdFyHCck+nLMjhBIx9V2NlXWodvGA?=
 =?us-ascii?Q?EKB2dznYkpYbUzyv4yxO8ccKDONHfuuV3lwlB4gxzKfoEdFCpx/LmLD74QOT?=
 =?us-ascii?Q?dsTEuFruuHcFKz1ToiBgPvm6EIWtAG+G/E7YNbGAB954u5cryEK/BVAlABrr?=
 =?us-ascii?Q?QP8jluOMVnkAgEV3NDbiMwMftPZ5tkqkQbIQhqrla/HrAA0gtcJOuJ+XpyYt?=
 =?us-ascii?Q?Eeupai6RJdyC66CqdceTjUhvwkh4xr992sTOYEEUDKJIPoB2bc9U8A6OIumJ?=
 =?us-ascii?Q?4VAc3FedZdHzHmGTgxQrYZZ+6zlRrqUx8K6lzkuYusZ4Q7L5go9t7crGGzo8?=
 =?us-ascii?Q?zC71Kui9F5UIOxNFak51JvdCHeUR2vPaiRCyxhl+3Q2ILrtJTzG4i+jh9TcT?=
 =?us-ascii?Q?6MB8dJd/3eftPVg9bsuSv5RD/o4PLKirW1sqA9zzSJ0LmA/5k5g95hb7xzZb?=
 =?us-ascii?Q?BWiCvIfKpYy+GtUMRrzAnax3nzwthsER4itzxGY/aG4fIYgd1lEcMDzTu7B7?=
 =?us-ascii?Q?U2aTuZENteqfsw/hZE/52/oNzJqxZPW0HrJWz6oV9rTY5jXVwGlbOZTFMrSE?=
 =?us-ascii?Q?arHs97tt8xQkgsXJvLJ8bmoJ/9UE26eKCpgPnMPCaDfp6xj2OOzKn8aMUx9k?=
 =?us-ascii?Q?4aKkL6ufKJ0AChYaiDEGgdAXrHfhYEOzwwr/0JDksogharnEuwpJ6rG/gB8m?=
 =?us-ascii?Q?r5GIs3ki92mgLftLHf1Lj3XKp2FoGaI5Nv9Suyqx6cPKMXBdxJ54oQjxkxfn?=
 =?us-ascii?Q?Lg3d7rKlt6sMm6OUdDQ11/CJMYWwDpZUD1igQB4uFDAc6w91LkRn7m2GN8+F?=
 =?us-ascii?Q?QcF+++EnTlkeXDSxMDvS2Xqhwxx4Z90nMD3OuzS+HbausCOScBgL5PvmrVxA?=
 =?us-ascii?Q?UpVCutmzov7oCLWwGx/HStqZH7B9ZcX4OvHsfAPaD583X9sqAQ+N/wQXo5E5?=
 =?us-ascii?Q?qVKVwYqIArXBITz98wiTKgGG1MQ6ztEd0OWvFUMwIM38q+ZwnUYeYJqmQJd2?=
 =?us-ascii?Q?OtK2tt54dFSUkMgY5FsSvcP1e8xCDUeVOzEy342y/nzzq4EZJTyPIGAIoR/Y?=
 =?us-ascii?Q?80J0dZxhhQLT7tJrHJsAa2l2TeW6hcWIFWqateHxVD8cP3JVCBf8Bhgf1YpQ?=
 =?us-ascii?Q?83CcpICzfsjsVG+Tgi8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:06:22.1557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f539753-c64a-43a4-635c-08ddaabe267b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055

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

The ABMC feature allows users to assign a hardware counter ID to an RMID,
event pair and monitor bandwidth usage as long as it is assigned. The
hardware continues to track the assigned counter until it is explicitly
unassigned by the user. There is no need to worry about counters being
reset during this period. Additionally, the user can specify a particular
type of memory transactions for the counter to track.

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
counters, the kernel will report an error. In such cases, users will need
to unassign one or more active counters to free up counters for new
assignments. resctrl will provide options to assign or unassign events
through the group-specific interface file.

The feature is detected via CPUID_Fn80000020_EBX_x00 bit 5.
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

v14: Removed the dependancy on X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL.
     as discussed in https://lore.kernel.org/lkml/5f8b21c6-5166-46a6-be14-0c7c9bfb7cde@intel.com/
     Need to re-work on ABMC enumeration during the init.
     Updated changelog with few text update.

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
 arch/x86/kernel/cpu/scattered.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index ee176236c2be..44ae69a8748d 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -487,6 +487,7 @@
 #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
 #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
 #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
+#define X86_FEATURE_ABMC		(21*32+11) /* Assignable Bandwidth Monitoring Counters */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index dbf6d71bdf18..d5d4a573aaf7 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -50,6 +50,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
 	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
+	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
-- 
2.34.1

