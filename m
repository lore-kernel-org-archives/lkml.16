Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127B42727E7;
	Fri, 13 Jun 2025 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848952; cv=fail; b=gl1clhQpopjOV49SI/7bmKWuSb1kHTy1q++nSCoY07MJDGvKow/+2DeYUG24G6Vp/RFJEfCfEXSJwIfD1X/Vf0eFYv3htraGeInVwZcJutIienE2OzVMPxOYQtBMPjc2QxklX9e3Djbug07EORjVNZT049xNw0X5P9u59PEY5+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848952; c=relaxed/simple;
	bh=w8w7PSg45AY4bxzhMkUpbwgVIb1aWqQz72jdOgmpY34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuzjaZJwJmqZNLQipBUCijsWqjLaal7AIIMM7SiVt6P4mhzT1RNxuiw7APcIt2FhKKidsOlG8lqqRH8ue4KDKvf5eYCSn/HmeVatLHbR4T3h30QVj/WVSIdbgRwx5/qqMBLY6GhcMVbp+WZI8nj21b7CeJfNYhtP+1KK8BLC3sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jgowTEpH; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jgowTEpH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wawvBHK2SoJKUdngcPD3UsIDKlR8C9+fAxsDga+zhr0bROKZfXpfyf0OovlS8F/Zkj5iU1CbUpFbLkE3J7Rx0Z0yDKlghlfsXzOZyZqKhERzHC9APPDh4Lv7EqQKy3v+PJxsGXoWU2Rnc3FRuEi1xDLjpFMQKLJMhObT08gYbn6lfEYJMztVhVuq/nhaczTvkzoC/JaWHB7aduHnSP60gs989EOKApFl3F8qT6GUQTf1jMp+tqENrpsxtZJUkQ70+DbM/MytdziDZUHNBRltARkqxwnoExUUScRJHUERtnSRMKMFHlk1ibrk4iJp7/XzRsNFTS95pXYUydSi1QAMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRZ/DsQQFoJAX9eqcmsR1Bhsh7kPV8sbSwx2dSGn1hY=;
 b=v1Yi9r0XUDXUMVKRTTUY2XWLBV467qdDZVNCEzg0Ra1JYJeCQyU2Blvih6+nUC0TKgIkJlu4BW9YnypFL04zoXpe1dWbiCU7pqR2xwwfDvy/E//BteCu+Q4DMYvFa9wWxPthYk5gFjejshQudO7009DRAdA2ULHrTIEWaN2zH8YmIB5o8JBPZElgIwRtiiDYa4jF4tM4ykhgVyGou0DBDXe972nuSMnjA6bNPPnmIlLXqrvToNi1sW3u2ayygDYHCaayU8mj5jWcZSiAtaM9CT4OAJPv/hJ24p46V4wDd9mmqILqAlxPOyfgAQNTQPB1TbgplK6hNbhDM8B7HDwIsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRZ/DsQQFoJAX9eqcmsR1Bhsh7kPV8sbSwx2dSGn1hY=;
 b=jgowTEpHlul92Z99j/j3mOL871lPPaZZpqeVOetFtXPRtrdWjhe2nfCrC3yUr9GsSlAz+Ia/qpA0SgxMIy3DRADI6KSWSVZzeQsrjhFMJoTvTmO2HtoJgjP/kzFLu/HniSj/bCpk7BeOmyD8w8TR6ctSUV6RYWc/svG+yqCYz5k=
Received: from CY5PR17CA0060.namprd17.prod.outlook.com (2603:10b6:930:12::27)
 by DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Fri, 13 Jun
 2025 21:09:07 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::c2) by CY5PR17CA0060.outlook.office365.com
 (2603:10b6:930:12::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Fri,
 13 Jun 2025 21:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:09:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:09:04 -0500
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
Subject: [PATCH v14 27/32] x86,fs/resctrl: Auto assign/unassign counters on mkdir
Date: Fri, 13 Jun 2025 16:05:11 -0500
Message-ID: <e20b41f127668098a9e662e866767b582878b98e.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 971d126d-4324-4521-9307-08ddaabe88cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BmS1ZIblSFX0XWk0LHB4R+hRxo35Arw0mEIz8cEBCC9hV3zEL28cMWL27gaM?=
 =?us-ascii?Q?3FPz9x9Y0AlYDyobq3VxExrmuxGKlz3yjqkKzSR54v5jKjBSWV/xox7iwEUE?=
 =?us-ascii?Q?/WV38D0jSJm4KseA63J8eEXVIj+R+iC59ehzyOcCHoIz3E4Wqb4IkzB19vKP?=
 =?us-ascii?Q?psf3lVGOKLucrOuLrj/5Ya83Jnvu9yS7e4X5GayY1m8ty1wjuzSZgUrSLsCR?=
 =?us-ascii?Q?DRgOxYC0QsTRYuTzIMBvtoevMT6SKb/w6G4ob1Jk9s5cSVfE0dd5SkjBORms?=
 =?us-ascii?Q?FLUiTXIx5LNQyfNniLalmJEZWdcsHm3iAsdBZ5GjUQzCtw5DectRC1lJsKKy?=
 =?us-ascii?Q?9Z4+geEUnRQAjgIEGPrYzLjiclcq1YQ5nOrZiDXKZa7dAxXCAOKJDCX62OK3?=
 =?us-ascii?Q?kwi/Uy9N7YWpQscXjAhpCkB4wNt7sOz4QsrAUzLXsH7n5nlbT+NMNlRkrYQ9?=
 =?us-ascii?Q?OoumqqTvvnc66xz1Bs9gel/jwElVxQJ74ymn9Qg89wQRcVZcNlm7OQtK41xN?=
 =?us-ascii?Q?ID2FF2rWRlbFiWU9rlO47MMWnOdxOSF0Vx6Maz9IAgU7IU9enXqgZLBHpnn4?=
 =?us-ascii?Q?V0otPVF4B1ASPijtEVfLx5g+rtu0jptMAcZ9cqrqdNiX0JBZ4hQuZIIyX5Hx?=
 =?us-ascii?Q?KdLbmIjO3q7o63kcYgmBR+UCr/SNQnISZ73TjBHZUELGFvTMxnjw8e79mZJ3?=
 =?us-ascii?Q?njHxD2N7lTJL93DIYqdbr69/oNTrbDAKCV+t+f452tXwbmRcNsQZDCxsjM5g?=
 =?us-ascii?Q?4xVY6q3HVWjsWShWtYQLexpKT0Ox/eJdI5wNG2zcvKFSGM5jaup+zzC+Dugl?=
 =?us-ascii?Q?b/XdrLI0L4/dMLIYemO+pk6T7y3OWXlECNwpV2LFO3TVor6KoWBSt/RIo03P?=
 =?us-ascii?Q?Vdl8u/AEKKGLSyryQ9gFmrA+MADK5hxPO4gw6+DZRrjGtxvCUIAmhXh6dq9s?=
 =?us-ascii?Q?yTNFoKJJFNgC23QWAKZjbpHCVwCr0g/mLWxmGODG6Yuwe3Hrxc/h7CrepmWD?=
 =?us-ascii?Q?AbrLe79iCiZfm/hI2M8qiZjnX2L6mzxTLVSMmuQ95gqOjGCQ+wA11O8rCTYP?=
 =?us-ascii?Q?tAXJkvYY1aBvXFj+b+v0LSlJTINYEyw7khN2jzn4mmp4bRl1BFQkHsuvNNVP?=
 =?us-ascii?Q?2TTFt8YUyoUaNPTDVv2B9oUlJIsEUYqbTB7Ia016YWJACr+D5GCrQ/tVUq2K?=
 =?us-ascii?Q?jIJVrA9u/yTG6751y0UnKjqc+rpTSoLhC0/PAzekht3pS1aH7sq/aRQ2XEjI?=
 =?us-ascii?Q?xvOCMKYIXAW8rWPfK56uaoQ1/zz1HE6ukZvxEGgk4haIt2MZezD7UJQuL+nW?=
 =?us-ascii?Q?Ih1uRjGX8DY7SsW5TQCPyeBdt0XoQKOQlF8KKazKegToAMJPBNoISNPU63Ec?=
 =?us-ascii?Q?kte1Tt3lym1Ernnv56LKKI7pNVTMUf3W5eYHuBnE5Dt0Kxvr6S1/bg2ZWwNS?=
 =?us-ascii?Q?kwt/XyfdD9pj5AjUwZmAAHndFeVnYbFpy1YovaIQtsfX2uB5NyGPelySo7hx?=
 =?us-ascii?Q?ll8QO1+avH716nxdyxXnUnHto2dNegGWsu/tTfrUsDVLmCNCN1hFtSY9FA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:09:07.0996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 971d126d-4324-4521-9307-08ddaabe88cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020

Resctrl provides a user-configurable option mbm_assign_on_mkdir that
determines if a counter will automatically be assigned to an RMID, event
pair when its associated monitor group is created via mkdir.

Enable mbm_assign_on_mkdir by default and automatically assign or unassign
counters when a resctrl group is created or deleted.

By default, each group requires two counters: one for the MBM total event
and one for the MBM local event.

If the counters are exhausted, the kernel will log the error message
"Unable to allocate counter in domain" in
/sys/fs/resctrl/info/last_cmd_status when a new group is created and the
counter assignment will fail. However, the creation of a group should not
fail due to assignment failures. Users have the flexibility to modify the
assignments at a later time.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the changelog with changed name mbm_event.
     Update code comments with changed name mbm_event.
     Changed the code to reflect Tony's struct mon_evt changes.

v13: Changes due to calling of resctrl_assign_cntr_event() and resctrl_unassign_cntr_event().
     It only takes evtid. evt_cfg is not required anymore.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The monitor.c/rdtgroup.c files have been split between the FS and ARCH directories.

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
 arch/x86/kernel/cpu/resctrl/monitor.c |  1 +
 fs/resctrl/rdtgroup.c                 | 71 ++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index ee0aa741cf6c..053f516a8e67 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -429,6 +429,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 		r->mon.mbm_cntr_assignable = true;
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+		r->mon.mbm_assign_on_mkdir = true;
 	}
 
 	r->mon_capable = true;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index bf5fd46bd455..128a9db339f3 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2945,6 +2945,55 @@ static void schemata_list_destroy(void)
 	}
 }
 
+/**
+ * rdtgroup_assign_cntrs() - Assign counters to MBM events. Called when
+ *			     a new group is created.
+ * If "mbm_event" mode is enabled, counters are automatically assigned.
+ * Each group can accommodate two counters: one for the total event and
+ * one for the local event. Assignments may fail due to the limited number
+ * of counters. However, it is not necessary to fail the group creation
+ * and thus no failure is returned. Users have the option to modify the
+ * counter assignments after the group has been created.
+ */
+static void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+
+	if (!r->mon_capable)
+		return;
+
+	if (resctrl_arch_mbm_cntr_assign_enabled(r) && !r->mon.mbm_assign_on_mkdir)
+		return;
+
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+		resctrl_assign_cntr_event(r, NULL, rdtgrp,
+					  &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
+		resctrl_assign_cntr_event(r, NULL, rdtgrp,
+					  &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+}
+
+/*
+ * rdtgroup_unassign_cntrs() - Unassign the counters associated with MBM events.
+ *			       Called when a group is deleted.
+ */
+static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+
+	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
+		return;
+
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+		resctrl_unassign_cntr_event(r, NULL, rdtgrp,
+					    &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
+		resctrl_unassign_cntr_event(r, NULL, rdtgrp,
+					    &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+}
+
 static int rdt_get_tree(struct fs_context *fc)
 {
 	struct rdt_fs_context *ctx = rdt_fc2context(fc);
@@ -3001,6 +3050,8 @@ static int rdt_get_tree(struct fs_context *fc)
 		if (ret < 0)
 			goto out_info;
 
+		rdtgroup_assign_cntrs(&rdtgroup_default);
+
 		ret = mkdir_mondata_all(rdtgroup_default.kn,
 					&rdtgroup_default, &kn_mondata);
 		if (ret < 0)
@@ -3039,8 +3090,10 @@ static int rdt_get_tree(struct fs_context *fc)
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
 out_closid_exit:
@@ -3186,6 +3239,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 
 	head = &rdtgrp->mon.crdtgrp_list;
 	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
+		rdtgroup_unassign_cntrs(sentry);
 		free_rmid(sentry->closid, sentry->mon.rmid);
 		list_del(&sentry->mon.crdtgrp_list);
 
@@ -3226,6 +3280,8 @@ static void rmdir_all_sub(void)
 		cpumask_or(&rdtgroup_default.cpu_mask,
 			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
 
+		rdtgroup_unassign_cntrs(rdtgrp);
+
 		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 		kernfs_remove(rdtgrp->kn);
@@ -3310,6 +3366,7 @@ static void resctrl_fs_teardown(void)
 		return;
 
 	rmdir_all_sub();
+	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
@@ -3790,9 +3847,12 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
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
@@ -3802,8 +3862,10 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 
 static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
 {
-	if (resctrl_arch_mon_capable())
+	if (resctrl_arch_mon_capable()) {
+		rdtgroup_unassign_cntrs(rgrp);
 		free_rmid(rgrp->closid, rgrp->mon.rmid);
+	}
 }
 
 /*
@@ -4079,6 +4141,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	update_closid_rmid(tmpmask, NULL);
 
 	rdtgrp->flags = RDT_DELETED;
+
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 	/*
@@ -4126,6 +4191,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	cpumask_or(tmpmask, tmpmask, &rdtgrp->cpu_mask);
 	update_closid_rmid(tmpmask, NULL);
 
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 	closid_free(rdtgrp->closid);
 
-- 
2.34.1

