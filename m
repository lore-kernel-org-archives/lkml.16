Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D34F14830A;
	Fri,  4 Apr 2025 00:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725961; cv=fail; b=cPqwc5Ob033GUI4PuEDzF/CQ2c/A2l0mYA5gSVr62t1sLuQI7U3us6QOnohs9+NW76Tbm7jEW7u8kSoZrtU4mnjqgzeXohF1jbqBzO2/z1p5XnxVtUiUW6YCPXkRDARrDl0U68XcSDDxzXSYEnDA44jf6TCS+av35dcf+GK2qRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725961; c=relaxed/simple;
	bh=Ix+kassLOcT9QsVpG/5XfRpAXcyKgYY3DtwtqgrE14c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gWVA6xH2RdPxcAzOclZE5ENDseEfMCQbuoq6+toyxadW3eSGkkje46gWCr58c4A2akqUnftm8oXjyRBxqckuhNdW9pWCbSFEVbTJWZIZ99GM1DQrZ9YMkd3NnCWeCXUw/di1IJarDP41w52t4D3xdS/IdxoYg0wdxGYbtvYB1+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PkjTYQOj; arc=fail smtp.client-ip=40.107.96.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PkjTYQOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDserQWObdLMu2vpXE317TCZwQjPpJ3sc8m66E/TDAPtDlyIuhFvYpkXioO3cXfLrpuxVPofmdaQCLrfgyJ4iFvz5Nm55hC+7vnqJEd66w/x5BH1WMdO+inrgbyv39mZNyRykycn99Kjb4Pkxj9BhmxXqEScaFa20raRhG4dHEtHorO2eKPn/t0g4jM+35TtOriPI3Z2IzkrqiBG/RLwFUixtN3pA+BWYQf7XUnEDH+Q51W2W31WAbl1KByFzjQl/PjnPE7zQwh5+ZNzG2yLpz6FZFAbmD3/KsWMfH+oWPYdn84JlILsfN0WLEUWaduqV4BuvnBEjrhva9D2Dvkg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO5AkJMvnkArleSbe7rd41u2vc2JrZG1JWSDivzw2WM=;
 b=O+JCUH3ZV8D35H2IRiAtKD+rQA8gzhJ7d2Fiu9N2Q5VzHAwANowk2WkyY5wafDTDjHyGg1jC5xHbqywX4ZYqHphTAlhOM1dhh/MA5vK9uWt0sBMRtL4aIvp6NtCQsh+XYz/xChqlMrNUQOLh05gyaGaMD5hm9vbxTywlsESlrST54p+TTwG/wdYQkL0W6HuwaA523WLEv9HTeHp+UaoQPR7cACBpy2Wmj7Kw/TLmq3m8k78tkhEeOMmizkbZGAFnIYl/enAsv+niPftLG/7RyFgRSyqV+Q3y1N+AsGY7oHPxq1AZHb2MJCtiaZ2s0/iVbBw56hSqUxRdhAWeGVdewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO5AkJMvnkArleSbe7rd41u2vc2JrZG1JWSDivzw2WM=;
 b=PkjTYQOjGLQeU+3IhVb4FVU/gPxMtL2HglQfFuFJgIGq3dXsHVlt4iDBVM/CdGfSIWbYV1ov4PHE7V7u4H1CKT8y4qcVAwvjxHfx/PiZ+r4tH2vCaLlRoflts0++Ez6vnQGdvgL4x34kVueluVRV5B1w/nhqpw1cwbzvj4vjMP0=
Received: from BYAPR05CA0035.namprd05.prod.outlook.com (2603:10b6:a03:c0::48)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Fri, 4 Apr
 2025 00:19:13 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::d5) by BYAPR05CA0035.outlook.office365.com
 (2603:10b6:a03:c0::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.27 via Frontend Transport; Fri,
 4 Apr 2025 00:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:19:12 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:19:09 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 03/26] x86/cpufeatures: Add support for Assignable Bandwidth Monitoring Counters (ABMC)
Date: Thu, 3 Apr 2025 19:18:12 -0500
Message-ID: <135e452ba38426487e143bc4661883e4939d502c.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 6affa520-5667-4610-b1d3-08dd730e5395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gvqAQfArS+x5ZP0tnsWTaxoln66rS/ZzNPVAywrDYAppMvPHxeXyNzZ0r7al?=
 =?us-ascii?Q?ICN4fywHuhg+rd7YMQozYdZPWVv4wl6Zxlw6SSK1g0I8OjKMIEmtG6Q7UXbw?=
 =?us-ascii?Q?G/kSfUfEVJqTvjqQv4ytwn1SpzgO9JR0SOMOhQosoIiZ0URdvcsLdbG4WxB+?=
 =?us-ascii?Q?8a5L8mkAIAZsgPrJAK8sUfUcq1yA8ZVtNeBMWNBEf/a173gKjyUkKBLzMF2Q?=
 =?us-ascii?Q?Y+PGugtPWNxiwW7DBiVdpS1tHiOGZASQ9gq2J7m5PSk6wnctywfruBj/T07y?=
 =?us-ascii?Q?CEydAT3c3MtPJVjO1cALw9kqZnS9VdrphR/7LILPUxsDObvLMs7yMkh0BEIK?=
 =?us-ascii?Q?a6FCx8wIJHyXPFaZqjsKzb989vIuJPEQNYNcaxR2O4kq924KYom8x8+VqPlD?=
 =?us-ascii?Q?O+ztkMJtq+05JjjdfnST0KlD6nLml7SmC4mnkHFkkIGjUWwIxomc+rcgbC5g?=
 =?us-ascii?Q?G1b/ad6m4XdJD3SAbmfgtbIL1vkzTi01bVw7tlod9RJms2SUhdOPV/tA7fCn?=
 =?us-ascii?Q?t4PCKntOixPJqe5xJr1iqsgScPSlcPY+BE+rjBofJpEj/UnWRLiF3L6RpNZ0?=
 =?us-ascii?Q?JaaRpOUb3rtGq1hZeMkKL6byfFRe5Ay33puFdnxLSDBlp3mgk1KbbOXReP3c?=
 =?us-ascii?Q?Po2itF+OHlqmcMFcx2rMnj8ALB43ROZcOpxzXh1o8Zal26UPS58HtfmqObzE?=
 =?us-ascii?Q?YIvHxTPiOF2Vm9JllVfcCh/kaUY/EQ4SR1xkEeHG7xIUu6uvus6wcFwGP5Yv?=
 =?us-ascii?Q?VhaOl7GpdC0g8NnP2DkegwzWWM4cdNG2QHDaMT4PXxjjdiPpvp6xjN45QdOy?=
 =?us-ascii?Q?/SXiV1OjFSgtv3YiNr8bcsR4cl8CdhhXbjm/xKbu8cdMpqZWOPtAFXaxbkDo?=
 =?us-ascii?Q?GsRbqB9nqKLERzV9Y8GmnWkS7Cio3pDXrpm5fghG4KrUJtGRuz737L4gjMLR?=
 =?us-ascii?Q?NsgAXUDmDWkxO17KtEoB62r8/6LiwTA0+3iz9l5/d40ZLQe0lrausO8N3Ofm?=
 =?us-ascii?Q?uj+EUwVm3S2yeU2C8wU7R/m3dH4WIp/THptIlf+CrHnppS/8/Z4b9ZcTzeWf?=
 =?us-ascii?Q?UXog4K+sT9ZgGXUb/SPylxeRysyCAwAGKn2DovnMF6b+/++iKvz+MzRnMZcx?=
 =?us-ascii?Q?uAISgFjS0CgUFGNBmxWeBm5OZ71t5JDxpFdgKS4qyZLrCRh3CWiTysBBKkUZ?=
 =?us-ascii?Q?TuO/xWaT944HG1K4FoW1yC0+XPQe9t5itbdXUjrhZb4jq5xKCDq9peIQS5bA?=
 =?us-ascii?Q?4T+spXzZMgMY8NUgPZ1CKno6PaIzzJq9uZtKX8dDgpgUM7bbzXrAKlSc7THW?=
 =?us-ascii?Q?f6a/M34ld3YMzygTERwf3XRlXXTXTK0sDKW8gKDKU7Fefen4gA8Wjor+2LE/?=
 =?us-ascii?Q?fsrwQ+EravPK9NR0rtTKuxt9mD7dxgcn7rro08TLThs56TyROI0aMzzF/1Qq?=
 =?us-ascii?Q?aGZ6cP8CQ9UD0VazxrS/0uYv60CFulvKEHsYhJFS4X0o5/tUPBuEt/oT10sW?=
 =?us-ascii?Q?DAJY2tIxFpZNpqk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:19:12.3971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6affa520-5667-4610-b1d3-08dd730e5395
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986

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

Linux resctrl subsystem provides the interface to count maximum of two
memory bandwidth events per group, from a combination of available total
and local events. Keeping the current interface, users can enable a maximum
of 2 ABMC counters per group. User will also have the option to enable only
one counter to the group. If the system runs out of assignable ABMC
counters, kernel will display an error. Users need to disable an already
enabled counter to make space for new assignments.

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
index 8b7cf13e0acb..accc1c328672 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -479,6 +479,7 @@
 #define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
+#define X86_FEATURE_ABMC		(21*32 + 8) /* Assignable Bandwidth Monitoring Counters */
 
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

