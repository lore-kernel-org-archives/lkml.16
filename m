Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D92272E59;
	Fri, 13 Jun 2025 21:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848817; cv=fail; b=IgorZf+mBheT9Q6tlSjDQvcuGS+sR2gy2BzUmhgBNQOtnfvEXRJaNOFOxUMoIUrAMImabKfVoW/3CqedIrVU8+faPrL1U9CYGrn2AFXykGMfeXcsFvSHodbZhKRcukWWiB2zDgFA2qLsz485pNmc5gzLYVgobUQTyTOfSocCi7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848817; c=relaxed/simple;
	bh=Afskno8kyqo7YjoacOlGg0iuMaUlXY392WHzBmCVz08=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e2yg/9UDqvyvW9z2vFU/diM+JhbgMzyw8u/0Fd2X4dTuR2vUzBNTiHNB/szjLJEF/w5gOwwZnEFavks9azgWEzYt40UmJfHt9MmIFt77PgZhD6Vd6M0F9MSgcXxPLy7HuOthhix3xsYx/DFEw3gMBBbxkoLutJZkTSy2gjYqln4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MmjyAOVn; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MmjyAOVn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRYM29VFC+wSY/gnG7hGuTq/zeDg92j1Oi2GWz5oOO5FZwvbyGq6cqmFyCqnKQg3ynhC2gzFU/5BTFh3+F5WSvRtU1r2VbtfMRY1XoMvbLXfTtA6u3b/aa583Wy/kw6gA5XNAaKkENNWkQ+NxweDbV0jODwTlrwGnMim7pZ3YdnufooATwTzqmEuZ81Bkz0tDyHFjPcaQWFnkWZbcA584lTvGIDtfOD2kipqqJgJwS+nYqyEs9UOpvQJvLGKMok+EgAvgrVH1WtASkq48s75qMc1peGGG8LYwKXKOLJaOPnUm7nWkY1AqfCOCnTVNZKQhsOtQMbuUsU80kmobC1huQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emLHUt62lYytrDS2iZ1Hwe0iL5DvcadKNCWKViJbAn8=;
 b=joDhqo2IKlgnh2+TJsCYv69PmdUdZmVrzlB9a7tcEVRN5mbOzTFPk3n363oGexyJjZeo9KX8D+CSEhgAoBoaa1iSQptZOMCIivGAhz+L55as5KxWFfDzwULPcY9A8K+AZZ8mfaZmhweBdQeNeNpnJrSQ90BDtpcOX3AzvWS2iDCEAFUFYpixxyHTaRwlJ4jhTmLk7sE/KENjn/ol/+Rrudcq2kwttwr2LG0xXzbIxL1JsTGgFFihfw/V1AZOuYd+Ddl+ORSsw2Iz4TwBOyT/klLGOwxow4j0/lin16fRUQXj4J3sC58KU6c1fUqNC+C59FcZdiMp7eN9c3E6MAg9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emLHUt62lYytrDS2iZ1Hwe0iL5DvcadKNCWKViJbAn8=;
 b=MmjyAOVn9Dd1inkXJTfzN9HSS+tLB6l9dtq/yAhfswZ7HubaP5etnTLNvPvdIYBc8H69XldZ5OhDhAJP6GvwBQeHlO0p2nYxf9wz3aDUqeF7njEyHTfSus5HzhvBp2QYBSa/M8BR2pKT28G5RC0f/ltqxi7DgQbj8dSopioLVB4=
Received: from BY5PR17CA0031.namprd17.prod.outlook.com (2603:10b6:a03:1b8::44)
 by CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 21:06:52 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::4c) by BY5PR17CA0031.outlook.office365.com
 (2603:10b6:a03:1b8::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 21:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:06:52 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:50 -0500
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
Subject: [PATCH v14 10/32] x86/resctrl: Add support to enable/disable AMD ABMC feature
Date: Fri, 13 Jun 2025 16:04:54 -0500
Message-ID: <b755ee48c3c70fdd2015b51a331bb0456a107569.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: ac63a099-3b7c-4fbc-8124-08ddaabe389f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WC4vddLW3PoF5hoIFtx4VhPFVYTmymibb7eXsNioBfGLpHjT0HCxWW0o7v3G?=
 =?us-ascii?Q?1Es9MovlJxhFSaZIzCm4O7g1I1UHeAkGNB+BPdHQM5V4csdqjkzbjB0s5PlJ?=
 =?us-ascii?Q?7MJu9aZbsE3YE1d0QNwQ1dcxBUd23hVwWH2WdWL3ktxHVyBO7NUj2yUyh0kt?=
 =?us-ascii?Q?7o5S49qWT71O1uKQuARQQuD3jCQV3Jgz8uTh0SwPw9JAhTsWWPNQjYwglr9W?=
 =?us-ascii?Q?vFMehfzNuk6lCuk9yUdIRCl7UZvhDiHQWP/WAgxisbRsiri2gtwYpH8dPNJx?=
 =?us-ascii?Q?sGM0e/tL8hd32WNZ2/ZqbflvydSbiY3y8A/ZaCxu1qdg7tmxcySCrOMzmKt/?=
 =?us-ascii?Q?Zqi2DSct28cFbkeAq4dmmXx7pw11vBIqke6MkZT7y9sFdEQcO+5gFX30Mf7B?=
 =?us-ascii?Q?ZQtfK50GskPmfWTsFyy+pn9dP6nrh1z79/otOSssdqAk2IGBF0tFaJYNZV+I?=
 =?us-ascii?Q?kDiGc+cMmQl+lF7BeeNw+G7zlcJY3B/OmyGUlqDeiiWq0bFeO9kbtUvLGrE/?=
 =?us-ascii?Q?n+45BBPJMQJ9ZgT5yds7xCcGEOs5DKLNXnl2yOkUCs5Eh8d5KdLUgMDc0m5D?=
 =?us-ascii?Q?9sdqmSwxMTLu/0yKpuw0LJg5nYt6H9aLQWxXUgr3A1JtLk5Wjb6XCOxmwkPJ?=
 =?us-ascii?Q?yKEuSU30XezFUIA477z0ZN7DaRhA91QOQCX9RTA+FfMyExIUNJlb6EbJXIW0?=
 =?us-ascii?Q?pkbm37vLqNFTF4MB2SavTt6T9c81r4o/GikaqRvLcxjkS++Ty/9nFggDS1yk?=
 =?us-ascii?Q?9YxRxk+Fv2JPrY7xRKAzXb2FAf8F8mCkG/qevVbigcEBDkFL9qy/mAca8m2O?=
 =?us-ascii?Q?JgpM+USIe/a9Zo4YB3MUd5i9e+xEGwTCS3mynOx8RnATVzFaeDf5Was6s73O?=
 =?us-ascii?Q?2cvCLJowR9QjGbqJop3BWisoZG/1YuA005iEIwalk+OF4G+5Q7MXbdwyvnuR?=
 =?us-ascii?Q?mOxs/kztBKU8FBcMM7m5S/q+BecFydgP4CxavkbFkoGRE8cXvKl8YbguNfIl?=
 =?us-ascii?Q?MOl26sXZElL873d01XQzP8lzVwvHFsHfzyyKqs4+CiaUxrG94G5zsJhJLQGV?=
 =?us-ascii?Q?EZfgNysqOl5AADHs6y4jNhdKSaWxLCNNADzGd2ZdiUljt3Zl7GL6eCaD/NqU?=
 =?us-ascii?Q?LoCtOyJOFHrg4RGTCQxKK6ygyR91uSw94+JtKLAx3oNn6dCQWQdAGR0RD16T?=
 =?us-ascii?Q?Hrk/JVyrBXUa38fYBYsvR+8tCutpVGkOzLlrXv7lM11qln2XAypQY1ZlnCAr?=
 =?us-ascii?Q?871s80Xv18DcQjlrXNibo5nW3Fr5CenDZKXhtyqYOOa1H8to9jT6dGynjdjv?=
 =?us-ascii?Q?Tb3gEgeSalOq4zU4rl4xUv4Y1RNtvG2Ej0hXKcMFcovJ/U28GTfkMb7faw4C?=
 =?us-ascii?Q?tn+piL3+2bPPx7msZLmdYj9BLOqAWHV90v1siKBCMUxqsB6Txsk3s/t5z4nS?=
 =?us-ascii?Q?sV/uhR77RzH8sQ4Q2U9+CusK+vziM1cHChl71sFVsfOVBqOaFHUMuorwJsZx?=
 =?us-ascii?Q?YcWa1QqkwyAbGLX3Z6RuZ1K4/hTZHRh0C8MIyMhLJyWLay+/pAaApwQNoQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:06:52.5927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac63a099-3b7c-4fbc-8124-08ddaabe389f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553

Add the functionality to enable/disable AMD ABMC feature.

AMD ABMC feature is enabled by setting enabled bit(0) in MSR
L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
to be updated on all the logical processors in the QOS Domain.

Hardware counters will reset when ABMC state is changed.

The ABMC feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Added lockdep_assert_cpus_held() in _resctrl_abmc_enable().
     Removed inline for resctrl_arch_mbm_cntr_assign_enabled().
     Added prototype descriptions for resctrl_arch_mbm_cntr_assign_enabled()
     and resctrl_arch_mbm_cntr_assign_set() in include/linux/resctrl.h.

v13: Resolved minor conflicts with recent FS/ARCH restructure.

v12: Clarified the comment on _resctrl_abmc_enable().
     Added the code to reset arch state in _resctrl_abmc_enable().
     Resolved the conflicts with latest merge.

v11: Moved the monitoring related calls to monitor.c file.
     Moved the changes from include/linux/resctrl.h to
     arch/x86/kernel/cpu/resctrl/internal.h.
     Removed the Reviewed-by tag as patch changed.
     Actual code did not change.

v10: No changes.

v9: Re-ordered the MSR and added Reviewed-by tag.

v8: Commit message update and moved around the comments about L3_QOS_EXT_CFG
    to _resctrl_abmc_enable.

v7: Renamed the function
    resctrl_arch_get_abmc_enabled() to resctrl_arch_mbm_cntr_assign_enabled().

    Merged resctrl_arch_mbm_cntr_assign_disable, resctrl_arch_mbm_cntr_assign_disable
    and renamed to resctrl_arch_mbm_cntr_assign_set().

    Moved the function definition to linux/resctrl.h.

    Passed the struct rdt_resource to these functions.
    Removed resctrl_arch_reset_rmid_all() from arch code. This will be done
    from the caller.

v6: Renamed abmc_enabled to mbm_cntr_assign_enabled.
    Used msr_set_bit and msr_clear_bit for msr updates.
    Renamed resctrl_arch_abmc_enable() to resctrl_arch_mbm_cntr_assign_enable().
    Renamed resctrl_arch_abmc_disable() to resctrl_arch_mbm_cntr_assign_disable().
    Made _resctrl_abmc_enable to return void.

v5: Renamed resctrl_abmc_enable to resctrl_arch_abmc_enable.
    Renamed resctrl_abmc_disable to resctrl_arch_abmc_disable.
    Introduced resctrl_arch_get_abmc_enabled to get abmc state from
    non-arch code.
    Renamed resctrl_abmc_set_all to _resctrl_abmc_enable().
    Modified commit log to make it clear about AMD ABMC feature.

v3: No changes.

v2: Few text changes in commit message.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h |  5 +++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 45 ++++++++++++++++++++++++++
 include/linux/resctrl.h                | 20 ++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index b7dded3c8113..b92b04fa9888 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1215,6 +1215,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 44ef0d94131e..1a4e96044aac 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -37,6 +37,9 @@ struct arch_mbm_state {
 	u64	prev_msr;
 };
 
+/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
+#define ABMC_ENABLE_BIT			0
+
 /**
  * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
  *			       a resource for a control function
@@ -103,6 +106,7 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @mbm_cntr_assign_enabled:	ABMC feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -116,6 +120,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			mbm_cntr_assign_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a6b9a6ba036d..0ad9c731c13e 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -399,3 +399,48 @@ void __init intel_rdt_mbm_apply_quirk(void)
 	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
 	mbm_cf = mbm_cf_table[cf_index].cf;
 }
+
+static void resctrl_abmc_set_one_amd(void *arg)
+{
+	bool *enable = arg;
+
+	if (*enable)
+		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+	else
+		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+}
+
+/*
+ * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
+ * associated with all monitor domains.
+ */
+static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_mon_domain *d;
+
+	lockdep_assert_cpus_held();
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_abmc_set_one_amd,
+				 &enable, 1);
+		resctrl_arch_reset_rmid_all(r, d);
+	}
+}
+
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	if (r->mon.mbm_cntr_assignable &&
+	    hw_res->mbm_cntr_assign_enabled != enable) {
+		_resctrl_abmc_enable(r, enable);
+		hw_res->mbm_cntr_assign_enabled = enable;
+	}
+
+	return 0;
+}
+
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
+}
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index c0195498bd4a..f078ef24a8ad 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -440,6 +440,26 @@ static inline u32 resctrl_get_config_index(u32 closid,
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
 
+/**
+ * resctrl_arch_mbm_cntr_assign_enabled() - Check if MBM counter assignment
+ *					    mode is enabled.
+ * @r:		Pointer to the resource structure.
+ *
+ * Return:
+ * true if the assignment mode is enabled, false otherwise.
+ */
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
+
+/**
+ * resctrl_arch_mbm_cntr_assign_set() - Configure the MBM counter assignment mode.
+ * @r:		Pointer to the resource structure.
+ * @enable:	Set to true to enable, false to disable the assignment mode.
+ *
+ * Return:
+ * 0 on success, non-zero on failure.
+ */
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.34.1

