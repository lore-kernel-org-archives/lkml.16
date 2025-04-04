Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99318C034;
	Fri,  4 Apr 2025 00:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726137; cv=fail; b=A9+96JGWZhoTbtT9gxvZUqQ+X/EoZXn1hlMjFV9rJyPwIJ888ePdDyVqJ0tER5e1wK8xIEMnWWyBq4C9/Yixl67YzZopDCQPI59KKQUrNbWu+V4ce9gCyBK9R7RntAhyBJtONRNQRtF6NugOlruhY9MfLPOMRwk/C9HgZZUSzCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726137; c=relaxed/simple;
	bh=BHTRTG2IG/QAPupSscj7UonMBvS+B2m/0LWzhYQLm9E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qmhtwZnU5EeNnJ58g+mH2nLWGxNzUvb4OZ2JToQo1X1gNvcEbl+T4potRnA9YbHCBr5uScZyNiqbjh0dwxZzLFhfMAKkkf+0nCb0qVcmF8N/jealL3sGh7hyEYc3/m2v6AMhByZiAMOzy7b1h8xehCcrMCq+0CNCL63hRQxiV6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZnTEY+4l; arc=fail smtp.client-ip=40.107.243.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZnTEY+4l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrLHlGN0vPLVbyRy63ajMpQUS9aDxXgOuP6+q0HuqPcejXeVxuzcVzioty08A42oLtn3pUaribycpdINCMuAm9qM+BJ9GZCFUn6jRAnycMaS+tuwj7WtrVH0TeIbPPtWwVSSvWeq+4HfvkK/v3bVwGtj6weYTxGDdxYiAycMFY3BEabXrha9DnNUWiNJuAhZVz3ZeWjV+OrPqQDElubecczjqJrlvByjT99jBd+hj5GU/sEls3zD2A9NqhqG215Vi8tfb3nOWk3tq9DIDDT1C7dGaFLRiKKBoQlh3d1E+uN4u/WPJ0h95DI3rvk9oxvFU1Eoki08bwycJf7uvxBtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48+fEdU9BQnsKybNMdwSJnhMbbTLsLje9uXev1lkWpw=;
 b=g0yW/Y0u2UpJorXbS+PLSScUQdTB8JKv94+g3GUThbtYVsIuiRakJNPor0jjMpKgLhssQAM7Bj1LabauM5wsxDHaanq8VMFcnMqwSh2REFGu++i2bW5V9DOQdk9flOyT1fHD7BOcTaqzsPV+9h6Z0Sl7VNjkm9oMWnyFOq9L9Vav6rtlIgqV88mV+o+YNQDSfP6GdLQh4n52U6oqHdihmcw1xVEw6R/sSGNIpYfwo9KDfbvMD2bo99QyrMVDK5AgHV+y6zJiOTpy957pma49j88eMSSp/9t+Nb0Lt6ACC0fqvcXOr4XiHWUq6gp9s6cdsPWFVDNYx8MK/XhpBxlRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48+fEdU9BQnsKybNMdwSJnhMbbTLsLje9uXev1lkWpw=;
 b=ZnTEY+4laDGKO5H1Dgr6NJ8+dmJUOL7M++pywqe4ewQjlE3B7QGFVrso7nOSj887SqfM6N5CbbBE7JEKFaw5/THGeG/8qZ04xaF3jqF8OzXAfCV/P2QAV4D7roX9gLLEf2p/tQRglV1Z5rpQTXEVjxcII0LRzF3Z63iEtaAD0zA=
Received: from BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22) by
 IA0PR12MB7751.namprd12.prod.outlook.com (2603:10b6:208:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 4 Apr
 2025 00:22:10 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::22) by BYAPR01CA0045.outlook.office365.com
 (2603:10b6:a03:94::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Fri,
 4 Apr 2025 00:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:22:09 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:22:06 -0500
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
Subject: [PATCH v12 22/26] x86/resctrl: Auto assign/unassign counters when mbm_cntr_assign is enabled
Date: Thu, 3 Apr 2025 19:18:31 -0500
Message-ID: <367590f90311fa9dbdf9b128bb281f076f026c91.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|IA0PR12MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d27d48-dc91-4899-9feb-08dd730ebcf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GSb2V6cs8tkxFzdUh63bMhOk5yF44JNRItlxD6mGKVdz4jLf/TisGXecrhhi?=
 =?us-ascii?Q?t/CoPMTRVDcsx/lpYXOomFeXIjDbUv1P9Hr6Pmbzpw83DT8G2wiwpiGiToSe?=
 =?us-ascii?Q?Wno6VLrGb8Jofh87zE8TQOMP4h6NioSMRkRH8iEYjugbXlK6X3bPq32ZC0aB?=
 =?us-ascii?Q?vyJrQCn1I5gbAUsIjJrENUZ662zdJoItTUsXyt2Xk3heBtlq94kadoOQ9TvE?=
 =?us-ascii?Q?VVW5JKmjmJdEYsABLMi3bYxQwkCo0MiXO3hzlP1n9rdO1pjYukySQuXMi3Y3?=
 =?us-ascii?Q?J0eCNUIc3V/TwiWK/hq8B3193Ntrh6teIh4+JtgKgGw2J8D5s4B1eVO7BENE?=
 =?us-ascii?Q?o2GeYHBo3+VFk+djabuxMe5e/uZ0MulOtDpFWw5L03y2UJWlFSYV/WNfLhW2?=
 =?us-ascii?Q?bYSfLQyc24bpSPeb9QxYyI6xCLhy+xfjw+q0sgY/dLlkHQG+KrcBLdfFgd8z?=
 =?us-ascii?Q?0Kyrl6YonBpIcZ2PTE9xOmychbWDcKFmPg1vMI3DpYkZPq4+fxLtUv0xFuui?=
 =?us-ascii?Q?MY2kQOb/2bq2cnKZrnvmHWhfeOHkKMpbZbb8SzVm6SjAktnwbyYXYCd6aVAP?=
 =?us-ascii?Q?6WzVA99hvYnQXCeZHSHKYNR4k6pCqPEGpZLSAoOhsw5XdSknfgcQNXWIIrru?=
 =?us-ascii?Q?WeSIOTo9qNvkWX3HqG92ryl/5ShvkWdWG5D/LP3yhuVqm+jyLg5bZmzbxHC2?=
 =?us-ascii?Q?9otzgnRac+pJsgNh0hApbW6V7CsGRy1q9m6c9Qv3/1YA9ebvNksnGg35vqqt?=
 =?us-ascii?Q?iAKQ+PMRfBTFjxK8pFM+5ZBg5w/QmFv4UMhjlQcuNvk9u1DDdpXUquRt4qC0?=
 =?us-ascii?Q?skScbDH+Bx+XlRoD1uu9Z+JNr4FC3B9Ebs1DYCJIsaliQ/W+fttdq3V0fcUv?=
 =?us-ascii?Q?dtymPpegZQ5mko8JL0pUnNGO88TTUJMbhFRPv/qaQyxkQu85dvpOnUx4QmOS?=
 =?us-ascii?Q?CQ5+v/HTf+HXI6wm85sH7kB9qK+YSaxnPb3YwJW9nmxmYTAGbdYEcAumw7nr?=
 =?us-ascii?Q?6gpW0jXXaQuY6oYEVl79eEFWDiJiSGP3AOwuwWrJVYpoKNuUJY76wyq5/xFO?=
 =?us-ascii?Q?C4HbPSZ86HmPyqE4ZLEmEYIQWY8/sLdt8kvLkvpoPlkXBx6HK3qiZAREHUX5?=
 =?us-ascii?Q?ZNq7WhEyrysv+CM82W+IKGiLplJFYWhOEzw/7W9RhIzKnsM0TK2zkIOeeRE8?=
 =?us-ascii?Q?Md1B4i63i1myFsjE/KsmKGwXl6cXMCmM3HlgtYMoeWD/MAiE5v+iuczpIR2S?=
 =?us-ascii?Q?oE2POlSdVJcy4vDE4gzOM4tZoeuCQuaR23tg5/7hWs4iC4d4VajpviPJ2HqV?=
 =?us-ascii?Q?V7isRu/mxgtn5v+8/QkdhpF/bN6k7PEsvP64FFlvrmT9Y4zj54l28C6vEnBM?=
 =?us-ascii?Q?rrKULwyn7AsT15Qm6N60eEBLq7dQO3SuovDGFvV6efwfrYTeH5/BxKsGi2xr?=
 =?us-ascii?Q?K1tg8Y18gaMbNKbWB03vMYtyyFcgs8mutgUuVZmQMHd59Uq+YI3jIV1I1fYo?=
 =?us-ascii?Q?afjBzlT9w1/96s0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:22:09.1735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d27d48-dc91-4899-9feb-08dd730ebcf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7751

Automatically assign or unassign counters when a resctrl group is created
or deleted. By default, each group requires two counters: one for the MBM
total event and one for the MBM local event.

The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
can be assigned to an RMID, event pair and monitor the bandwidth as long
as it is assigned. If these counters are exhausted, the kernel will log
the error message "Unable to allocate counter in domain" in
/sys/fs/resctrl/info/last_cmd_status when a new group is created.

However, the creation of a group should not fail due to assignment
failures. Users have the flexibility to modify the assignments at a later
time.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Removed mbm_cntr_reset() as it is not required while removing the group.
     Update the commit text.
     Added r->mon_capable  check in rdtgroup_assign_cntrs() and rdtgroup_unassign_cntrs.

v11: Moved mbm_cntr_reset() to monitor.c.
     Added code reset non-architectural state in mbm_cntr_reset().
     Added missing rdtgroup_unassign_cntrs() calls on failure path.

v10: Assigned the counter before exposing the event files.
    Moved the call rdtgroup_assign_cntrs() inside mkdir_rdt_prepare_rmid_alloc().
    This is called both CNTR_MON and MON group creation.
    Call mbm_cntr_reset() when unmounted to clear all the assignments.
    Taken care of few other feedback comments.

v9: Changed rdtgroup_assign_cntrs() and rdtgroup_unassign_cntrs() to return void.
    Updated couple of rdtgroup_unassign_cntrs() calls properly.
    Updated function comments.

v8: Renamed rdtgroup_assign_grp to rdtgroup_assign_cntrs.
    Renamed rdtgroup_unassign_grp to rdtgroup_unassign_cntrs.
    Fixed the problem with unassigning the child MON groups of CTRL_MON group.

v7: Reworded the commit message.
    Removed the reference of ABMC with mbm_cntr_assign.
    Renamed the function rdtgroup_assign_cntrs to rdtgroup_assign_grp.

v6: Removed the redundant comments on all the calls of
    rdtgroup_assign_cntrs. Updated the commit message.
    Dropped printing error message on every call of rdtgroup_assign_cntrs.

v5: Removed the code to enable/disable ABMC during the mount.
    That will be another patch.
    Added arch callers to get the arch specific data.
    Renamed fuctions to match the other abmc function.
    Added code comments for assignment failures.

v4: Few name changes based on the upstream discussion.
    Commit message update.

v3: This is a new patch. Patch addresses the upstream comment to enable
    ABMC feature by default if the feature is available.
---
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 95 +++++++++++++++++++++++++-
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index ee31dfe2c224..4e22563dda60 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1316,6 +1316,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 		r->mon.mbm_cntr_assignable = true;
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+		r->mon.mbm_assign_on_mkdir = true;
 	}
 
 	r->mon_capable = true;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 592a9dc5b404..3e440ace60e0 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -72,6 +72,18 @@ struct mbm_assign_config mbm_assign_configs[NUM_MBM_ASSIGN_CONFIGS] = {
 	{"mbm_local_bytes", QOS_L3_MBM_LOCAL_EVENT_ID, 0x15},
 };
 
+static struct mbm_assign_config *mbm_get_assign_config(enum resctrl_event_id evtid)
+{
+	int i;
+
+	for (i = 0; i < NUM_MBM_ASSIGN_CONFIGS; i++) {
+		if (mbm_assign_configs[i].evtid == evtid)
+			return &mbm_assign_configs[i];
+	}
+
+	return NULL;
+}
+
 /*
  * Used to store the max resource name width to display the schemata names in
  * a tabular format.
@@ -3043,6 +3055,67 @@ static void schemata_list_destroy(void)
 	}
 }
 
+/*
+ * Called when a new group is created. If "mbm_cntr_assign" mode is enabled,
+ * counters are automatically assigned. Each group can accommodate two counters:
+ * one for the total event and one for the local event. Assignments may fail
+ * due to the limited number of counters. However, it is not necessary to fail
+ * the group creation and thus no failure is returned. Users have the option
+ * to modify the counter assignments after the group has been created.
+ */
+static void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+	struct mbm_assign_config *assign_config;
+
+	if (!r->mon_capable)
+		return;
+
+	if (resctrl_arch_mbm_cntr_assign_enabled(r) && !r->mon.mbm_assign_on_mkdir)
+		return;
+
+	if (resctrl_arch_is_mbm_total_enabled()) {
+		assign_config = mbm_get_assign_config(QOS_L3_MBM_TOTAL_EVENT_ID);
+		if (assign_config)
+			resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID,
+						  assign_config->val);
+	}
+
+	if (resctrl_arch_is_mbm_local_enabled()) {
+		assign_config = mbm_get_assign_config(QOS_L3_MBM_LOCAL_EVENT_ID);
+		if (assign_config)
+			resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID,
+						  assign_config->val);
+	}
+}
+
+/*
+ * Called when a group is deleted. Counters are unassigned if it was in
+ * assigned state.
+ */
+static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+	struct mbm_assign_config *assign_config;
+
+	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
+		return;
+
+	if (resctrl_arch_is_mbm_total_enabled()) {
+		assign_config = mbm_get_assign_config(QOS_L3_MBM_TOTAL_EVENT_ID);
+		if (assign_config)
+			resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID,
+						    assign_config->val);
+	}
+
+	if (resctrl_arch_is_mbm_local_enabled()) {
+		assign_config = mbm_get_assign_config(QOS_L3_MBM_LOCAL_EVENT_ID);
+		if (assign_config)
+			resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID,
+						    assign_config->val);
+	}
+}
+
 static int rdt_get_tree(struct fs_context *fc)
 {
 	struct rdt_fs_context *ctx = rdt_fc2context(fc);
@@ -3097,6 +3170,8 @@ static int rdt_get_tree(struct fs_context *fc)
 		if (ret < 0)
 			goto out_info;
 
+		rdtgroup_assign_cntrs(&rdtgroup_default);
+
 		ret = mkdir_mondata_all(rdtgroup_default.kn,
 					&rdtgroup_default, &kn_mondata);
 		if (ret < 0)
@@ -3135,8 +3210,10 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (resctrl_arch_mon_capable())
 		kernfs_remove(kn_mondata);
 out_mongrp:
-	if (resctrl_arch_mon_capable())
+	if (resctrl_arch_mon_capable()) {
+		rdtgroup_unassign_cntrs(&rdtgroup_default);
 		kernfs_remove(kn_mongrp);
+	}
 out_info:
 	kernfs_remove(kn_info);
 out_schemata_free:
@@ -3312,6 +3389,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 
 	head = &rdtgrp->mon.crdtgrp_list;
 	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
+		rdtgroup_unassign_cntrs(sentry);
 		free_rmid(sentry->closid, sentry->mon.rmid);
 		list_del(&sentry->mon.crdtgrp_list);
 
@@ -3352,6 +3430,8 @@ static void rmdir_all_sub(void)
 		cpumask_or(&rdtgroup_default.cpu_mask,
 			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
 
+		rdtgroup_unassign_cntrs(rdtgrp);
+
 		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 		kernfs_remove(rdtgrp->kn);
@@ -3384,6 +3464,7 @@ static void rdt_kill_sb(struct super_block *sb)
 		resctrl_arch_reset_all_ctrls(r);
 
 	rmdir_all_sub();
+	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
 	schemata_list_destroy();
@@ -3847,9 +3928,12 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 	}
 	rdtgrp->mon.rmid = ret;
 
+	rdtgroup_assign_cntrs(rdtgrp);
+
 	ret = mkdir_mondata_all(rdtgrp->kn, rdtgrp, &rdtgrp->mon.mon_data_kn);
 	if (ret) {
 		rdt_last_cmd_puts("kernfs subdir error\n");
+		rdtgroup_unassign_cntrs(rdtgrp);
 		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 		return ret;
 	}
@@ -3859,8 +3943,10 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 
 static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
 {
-	if (resctrl_arch_mon_capable())
+	if (resctrl_arch_mon_capable()) {
+		rdtgroup_unassign_cntrs(rgrp);
 		free_rmid(rgrp->closid, rgrp->mon.rmid);
+	}
 }
 
 static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
@@ -4128,6 +4214,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	update_closid_rmid(tmpmask, NULL);
 
 	rdtgrp->flags = RDT_DELETED;
+
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 	/*
@@ -4175,6 +4264,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	cpumask_or(tmpmask, tmpmask, &rdtgrp->cpu_mask);
 	update_closid_rmid(tmpmask, NULL);
 
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 	closid_free(rdtgrp->closid);
 
-- 
2.34.1

