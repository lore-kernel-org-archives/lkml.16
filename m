Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472FD29293D;
	Thu, 15 May 2025 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349597; cv=fail; b=jm6Jy1Ai6z03OxG/yDfRch9MVL9JE4FaXIjLVZwkjWhkdpJI9Hica3JhctAN6PIzg5X3L2gUT2y8aQZgZcuZEJIJjoqcBgsvqKMnqHgt+Py6Bv85xxZ5CHADxG87l/o38vvCWJGDxIZ+n/1hLjlDKXPNeUCsoQTy8M4hungXtRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349597; c=relaxed/simple;
	bh=3uvAMjzSVYWVLvOzoZ6SbjTzyQDlJhrmgG7AoF4SqkM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jB6CJ6iHDfffHNc/O5ZL0FzCyFxgbq8QgrcmVe2HB1K5wm5Sjs95cnxFYfqhIx2BwHPMzoh0gVtwIMT9Fn+9Ox1Ra6PtMKTL4xr++/n3WdvUfYuc8o9xeTiu0b6tJgxzQYt9T1NZMxPqfl7kJ/uogu/jFAVxm5SUXs5K+oERlB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5hEYhbYK; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5hEYhbYK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4MYZSn5uaGRw+eWDOMZhApYN/jh8+PqpcnhWAal8rUfsA+7jrSjq5tJ/DfVSO7kW8JJHbWzOFO45jIQWE5l3mnHBbhkaStNMyywLJWVHFsrLwCkPC54OFqkXhFWfYp7b2HIQIPyr6EY7PX1pDxqE6vEQ8R4R5GALgoHkJ/Uy9i5KZ4PFqwkwbwqC1zg0dhxFXAhEJeOsyS419qv/P4OE8sQynKR+hVnZMrZg2ZnCtSSQ2t32kbdPD6KpCTD1vkXeyb1lLBiQtFZKQhuOih/uBO1WKJbc0iABqmHfu/gerQ5NcYenkaDw9GHXz5QWN99dCduBRJssRTRbyyizncL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c9RIkKhuBbh5GQnSPdBAPekWZ1MQWSNSDIewdp760A=;
 b=QryDjwmqcEwAX0TlYf8HQe/zZeWB9qtwvFPe749fUSP80prGviEAMcdxa+Cfbecdiozx/52ftjiEHP5lDstEJsiQV2JBA4hdDAkb0qAA9LnmSq5aQvAff3sP6+DSvvTku9uvQ+VAzqesg0s9kR1VqWsdcLjmeWcTvjOiEu1/2Mvjochn7eTnaQGzpQUjAL+UM+L+fiAg7UVKO1vPVJAImrEBVWGQqoPmSB/H3VBM+49GH9nEidAilmMunwbzn0v3od/3v2Or2o2gGdu3mnTcEA9NP9Kp496oyc2lqFyESqfQoQYcpRZ/WI7oi2OUgYHM6EMDxB0xZeiN+kKb5kCdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c9RIkKhuBbh5GQnSPdBAPekWZ1MQWSNSDIewdp760A=;
 b=5hEYhbYKCxDGXyCeovtg34/cgPX/loKWHPMZOh54MjslxqZv2JZS2J6mt7HPJ3btS6831SkgYBYaCjR4XYDOAiNwaTMcos/fVmtDzWd0x0MgUJonSIZNFMtntGdf3Ri3N5MleNLSAm4iE/4rMDR3px2aJ5pBV0IwNKSiIvHzypA=
Received: from BN9PR03CA0370.namprd03.prod.outlook.com (2603:10b6:408:f7::15)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 22:53:09 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:f7:cafe::3d) by BN9PR03CA0370.outlook.office365.com
 (2603:10b6:408:f7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Thu,
 15 May 2025 22:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:53:09 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:53:06 -0500
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
Subject: [PATCH v13 05/27] x86/resctrl: Add support to enable/disable AMD ABMC feature
Date: Thu, 15 May 2025 17:51:50 -0500
Message-ID: <e7d0c61696b8f1fcfe9e520b4b41fdd3a624878c.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 3106a6fa-ff56-47ef-24ca-08dd94034385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l6keoFlyznH8ie+YqOKHYhJV1fewqoMcW+0WxU/Ido4bbfu4V1b54pC8dQDL?=
 =?us-ascii?Q?AApgHwwDxvUGBisMoqrVX8hrcyT+YxbGEXnvtjaVm7BjoxfZu8+s0TnNLULn?=
 =?us-ascii?Q?fpTFQDh/yPfQ4se2G/eRnAWjaUYLirreJnTxbuJnlHDqzJtqgzHmiaPe6QnT?=
 =?us-ascii?Q?aO6lQOBwUw+6a7DPZFmscMEPf2aoA6F9oRiowFMQ8fYsRvWJ9DT20Tg/0nuy?=
 =?us-ascii?Q?ZLx+qLxRcdA7ulwaiGzY34b6WgqddklGQwYPV7F1B921UgNHRzsGq6r3DgBm?=
 =?us-ascii?Q?wLNThaeWvH60IS+Fz5Fi2JNlljUUac22cO1J7XLTar2O2XKgX1ymlJjPYEmx?=
 =?us-ascii?Q?ITARZtedw5z3zwEq7+TS/Eux1EeN06bjahr6RY2bpHziiVaVryTcjFf9I+Qs?=
 =?us-ascii?Q?UCx61RmkAhgj6o4FD2cdAyZiCv1/AiEbVofKvBRW8Xo0EzIr/WxxJMXzOYHq?=
 =?us-ascii?Q?ybS5jZHR29U4sZfX8bAiQCH9iLtBpRP0ZrU3ggJC0OKromaWUwS17EPmlFqN?=
 =?us-ascii?Q?p9PKJPx76XWdA370d4GoYzZrGgx/CdaiHsbVVCfAPgj8//R1brvidmFtYNH0?=
 =?us-ascii?Q?eJgceXeJQuqkh6sRNav5xv8PfMD5Tko09LU7JFFSquyj0r8swyJhm8ySLPaF?=
 =?us-ascii?Q?odq6VPlVTTrxVnyOzsQOkM2/EmZNo7u20wYxAzkoU5ShLLhHLS4gvNHHZybr?=
 =?us-ascii?Q?Gkis+FPT2yUKWiGFq8XyJWzZMaE9bW0J/RkwxhhqQywytNcqR2TeBIxoeI9K?=
 =?us-ascii?Q?gGTUMHRK7B9LSlVupnDcj6wvYkFwjlmR9akSJBhb9+zK8dYDBzIHZD/1fQfr?=
 =?us-ascii?Q?Pa/CiWY9BEeYoXmfz0DSrCTNSEla9DOd+Bgokt+oug+PnqUYer+n/x+nf6f/?=
 =?us-ascii?Q?2pPic8jMA1TdljAAxn7Bbrt+IuKViQDhs3g8LzZE9pRX9HU7VDs5sgmJA1gr?=
 =?us-ascii?Q?b92kbOMCAaRVSc17HAQ+YlKIml40MMg4JLEv+zs0+2F/zV/7nt2/B7u33dCF?=
 =?us-ascii?Q?dpJ8lRrvGXBc/J5pU6uKwnVWtBSn5Ab+GJcTRhCiPHy0n9k8pjhJ/4yfAsGc?=
 =?us-ascii?Q?0WDc+bXvB51uYXX85zy+7+MoWngfGLVtKlfNWKrsnuWqJ4/DTzbdlfT7YZy+?=
 =?us-ascii?Q?TZ86JgAWfKGSUlw0aDjhwjfGnRonKJrz8xJaSl9lCNFRay+3L+3iTBAfwUXL?=
 =?us-ascii?Q?ubTq3/Ss3zGCyxBnkLO7P25BDYafOyI56E3tJsPq7G/XZxKILrmRwsYXpCbF?=
 =?us-ascii?Q?JxqOOBCQKTqOWokhX73zQvieCe0KDSLz+cnOWCGhXEyS+DxCigM30q2YYSue?=
 =?us-ascii?Q?WoXtPluYThKQaoueDfCpVBlOPcv5pUrQxY5R4j/PdG9CWZ29g/Vr0M1boMXQ?=
 =?us-ascii?Q?Cu9dTr1yqy7xpKw1+6XtsAJ2yJdUDboRtnzRBQ27EZq9XDCIuwH9+XDxcGGp?=
 =?us-ascii?Q?I4miXde4GVzmmPLBHeijxouXYWXWhyRO6gLXrMGq6hQe/QZVldkM88iYHBTr?=
 =?us-ascii?Q?YEbDD9d1/l1gZH98QehZ1waDFGo7n8hybuKbRccyipApQb4hwwnx7SLfhA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:53:09.4684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3106a6fa-ff56-47ef-24ca-08dd94034385
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809

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
 arch/x86/kernel/cpu/resctrl/monitor.c  | 43 ++++++++++++++++++++++++++
 include/linux/resctrl.h                |  3 ++
 4 files changed, 52 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e6134ef2263d..3970e0b16e47 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1203,6 +1203,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 5e3c41b36437..fcc9d23686a1 100644
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
@@ -102,6 +105,7 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @mbm_cntr_assign_enabled:	ABMC feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -115,6 +119,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			mbm_cntr_assign_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index fd2761d9f3f7..ff4b2abfa044 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -405,3 +405,46 @@ void __init intel_rdt_mbm_apply_quirk(void)
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
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		on_each_cpu_mask(&d->hdr.cpu_mask,
+				 resctrl_abmc_set_one_amd, &enable, 1);
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
+inline bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
+}
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 065fb6e38933..bdb264875ef6 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -428,6 +428,9 @@ static inline u32 resctrl_get_config_index(u32 closid,
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
 
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.34.1

