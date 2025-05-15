Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6CF28D8C4;
	Thu, 15 May 2025 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349761; cv=fail; b=XJW3ekieGDPt8EKOoAQ/mKoPl4A76Yed2/Ctup89s/XjUtYo3ocusD4xrfwbyBRsYWdSoPFuJlqLhN6E1lNLwJwa7U38MoJD2YH5IUmzYEfYMPXWE4/cdFTBu7zGr9Lp6p79dFXrqYMJRb8h4iCbtB1eWME3DUlb4COMrN9Lt+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349761; c=relaxed/simple;
	bh=qo5zX5zCDxE1xAZPsHZrOmvCRwQ3JG+K8dflhu/MbCM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLLscoeV0UAOHqcSwi28TGnMQuqBIKTKyL8d+nACYen5pZEh80UFXKVrmvsfq4OUZnj+5XsZqh1lsFdET2mI6Qm9PH1MzEf5BQhw6SoPCwyiPFytGeUswqJQpdfkk2qtKAdCb+oJ+wPGsTUiIXV4SOyeeDD63TDULZ544jsoaqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RhHQDIZ2; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RhHQDIZ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yods4le+Y1G/ryU+3p1ak248UigIBglgZpOh263LbE55/z4ZYpOIUBdkWRGaTHNd1Vgosrw8Pvt7nH+D0xRH/zjzBfqrzXPWxoOuVzRn4/hnhTAA4RiP8VO/GREno/26YJlhX9C2gpVS0ZLY8lirWBdPMjxXL1PlV5FgtVA7q6kVkp4uE+nAaJU8rMo/5fukQLrNI2Bnvf1G4MnEnzmSNMlkXyVGZrcTjUKqm2kE6uBNIkrVWlUcbw7/U5i3L0Ypiq7lWLR6CjoFZ3l6ivsC0uoaC8MPqO5PfK95MH7Dtp4PuT83fXJDHKuiKSNrbl51I/OrU7iLrBvdHmb2DO4Muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R72LMR3xfreYKkcME3/0odm0LGY05apoI8kKaaoHwlg=;
 b=oP1RykY58tog9CWrcOL/HPbNF4VaSJ29P8+0ivciuisifJVill3EzSVpFZEHz9a7+p3o0UTah6vwbVUbJKCZlf/Q4t5TJPSlOFbbSlJcAKKuK0LP9npbtwj/p/8S7Imdih9pGXH7PYqwL3L5+O1m9vFY1RWvosb6FosKaQqeiyVy660HtIVRNQ+PVea5S4zgf6DdHJXZ9gm1Lid/tR/gW3oIZP9BSSQ94U6XPjPtEXN+Cg5Zvi0dpRinAjO4BK5xncrvY9aMhQGkESON3pLjkFLxDGkYDfNYGgE3H1E1079D8wEkUyrqnU4EDAOiBZnC6U+OOE3xb9tomdpietNmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R72LMR3xfreYKkcME3/0odm0LGY05apoI8kKaaoHwlg=;
 b=RhHQDIZ2tBnC+Os4RWm2aMXuq3LQ6Z8QMFY0+FYFKxXsBzMsbGel/gFbj1W7+cN3jmhuMza1A1TjNi7IG67CfK0C+U2gUZHdZ64ppFenGy/Dk2jANsNpeJ185fcegwpkxKqK+JTg2TB6pUHqKclvIZr5qRFuMgpdwQttmHuGjbQ=
Received: from BN0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:408:e4::35)
 by CH2PR12MB4102.namprd12.prod.outlook.com (2603:10b6:610:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 22:55:54 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::10) by BN0PR02CA0030.outlook.office365.com
 (2603:10b6:408:e4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Thu,
 15 May 2025 22:55:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:55:52 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:55:49 -0500
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
Subject: [PATCH v13 22/27] x86/resctrl: Auto assign/unassign counters when mbm_cntr_assign is enabled
Date: Thu, 15 May 2025 17:52:07 -0500
Message-ID: <8ae6b97ada1737a87d3c6aebb524081c95ff623f.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|CH2PR12MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: 40dce6be-e77a-4d29-c7e9-08dd9403a4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2K0rRNPWNVZbUITo+y0tpm1EkHagU61H9swMu8Ew/lxJZasQCKXavvZfBJpW?=
 =?us-ascii?Q?SAub8wI9o8/+hpdiP6/uHEAzjVs2iuiWHoNBdK4z+JF2nPrl+ye13mcLvvUz?=
 =?us-ascii?Q?TrvuP76WK/GRSHh6lhFdJm2pYF0ff717/p9mB1uqPOwOiX/wpIPAfCQIcpxz?=
 =?us-ascii?Q?puIvp4GDLUmRL+NjwijdVJfnUuBLbVRkOVk+z+4PhwUZ+1hHHWt3+4GpaTah?=
 =?us-ascii?Q?gQ/1GC9QQWCuQoGhRX7HRyRx1dUxQMS8eFycycQXB8Orsdi1ioEm9fLYoaTD?=
 =?us-ascii?Q?f8lob9HSRpnnfmYv7g/vHLg2lCNz/Yds9k1P3I+ucT36QSF+Ff+BOwiylJxw?=
 =?us-ascii?Q?3r+9Gbuq5uQ+qHi7F/Dr1+H9G/pLbGpUqp9MxCKPoBOwZ1S/51mTeZp67MBK?=
 =?us-ascii?Q?Twj6luzztlXoiSvCQzDp1kfhOtgfwF93Pt164bYWNnc2GjMlREshiVw1670A?=
 =?us-ascii?Q?xu0QmkLgMmI2tD6YOSv7IaTXocPKzWqxcWaSdbJ5vHEDpVFDldAmviwSsOdB?=
 =?us-ascii?Q?LV4Z9kAzHW4POL2P5/eWEuKHs0tyyZnZLKgcAU99LDZSiRs6/1/rWoGl4bA1?=
 =?us-ascii?Q?PWLpIAp8ThqF2i//8HeG1nXWpngjKFfXNt9ycxgHNc3rwR79dQbQmtc7F4NG?=
 =?us-ascii?Q?3ljqxrP1FNuyUab8JshX0/nCG4TOa+b3TvU/lQE/Ye7CD0+nBQEedesrn/3s?=
 =?us-ascii?Q?EZfYAv5gBa1va4NARGurd5g2vBZP9994InuEKw4kuLQ8pXgK9Y9QMKCVKHYN?=
 =?us-ascii?Q?31Uis4zhi9IfFwkT3UMyKQbwwm431s6lLiLw2ZE0fr6l29iPFIY2dRJ9w2hY?=
 =?us-ascii?Q?6NGNQG30Yf7WbJtzaADqprji8PmH+XxmTi/QfUaS/74rwgwDZ2dg8Zf0R8Nf?=
 =?us-ascii?Q?1eKOmKXjmGOufibOMqpHa5PWPQLi5lLsCUxwvzbbseo/UBlKEfMRMwS7U7lV?=
 =?us-ascii?Q?YD+q6wSJrtUFwTSuCI7u3us6Qo2efp06mm/AJvsqioj7XJAnfJt7qrZ1CqmK?=
 =?us-ascii?Q?71CFMGuxf05qf5NJqV1S0uFBY6R8YlGVYonT4h9LEv3xT7UzvDfwl+dexarJ?=
 =?us-ascii?Q?YGwrvJsFtyPNT0C7ZDNaKi5pXmIymtSRUwYPYWyh26SHJ8ZyjvMd725goJcT?=
 =?us-ascii?Q?6nHx2AgyUF1FwNP2QwuIz1LLGBgeumHYn+ZkjGbf8yn7nKVg5Fj5cpzpTWTK?=
 =?us-ascii?Q?vcvDLcWc9E6A7fq7tIHfZJ8AHL2pR0YDe8R+tWJLU3W14afNg9oXXkawu03e?=
 =?us-ascii?Q?Y9TBKkrfejU+RqutJ6ckN2oyG7mN9luxBTX540EXoNnPROn4+EPzOLJxhPq4?=
 =?us-ascii?Q?54tWpEAnCJKaQbgLuJ9vFvH7wY0LUbcYGXIChtwQcPaZ6PgARm4TOFzlcT+I?=
 =?us-ascii?Q?MXO3daNCppvoSTWeZnejhK2P+bFrejre4IfCIoYLTH7Yl7NWkEEeZbo7bH9L?=
 =?us-ascii?Q?TlKGv0B5V/aMsuGrBNgjt6yJmzTSFeoZwBUBLo+hENixbX3bxLUja6DblWMS?=
 =?us-ascii?Q?f6OO+cXAlI2hkKtnSIjLYD+pxFttoz0zAejV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:55:52.6352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dce6be-e77a-4d29-c7e9-08dd9403a4c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4102

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
 fs/resctrl/rdtgroup.c                 | 65 ++++++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 36a03dae6d8e..c3e15f4de0b4 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -435,6 +435,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 		r->mon.mbm_cntr_assignable = true;
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+		r->mon.mbm_assign_on_mkdir = true;
 	}
 
 	r->mon_capable = true;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 0093b323d858..931ea355f159 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2946,6 +2946,49 @@ static void schemata_list_destroy(void)
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
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+
+	if (!r->mon_capable)
+		return;
+
+	if (resctrl_arch_mbm_cntr_assign_enabled(r) && !r->mon.mbm_assign_on_mkdir)
+		return;
+
+	if (resctrl_arch_is_mbm_total_enabled())
+		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+
+	if (resctrl_arch_is_mbm_local_enabled())
+		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+}
+
+/*
+ * Called when a group is deleted. Counters are unassigned if it was in
+ * assigned state.
+ */
+static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+
+	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
+		return;
+
+	if (resctrl_arch_is_mbm_total_enabled())
+		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+
+	if (resctrl_arch_is_mbm_local_enabled())
+		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+}
+
 static int rdt_get_tree(struct fs_context *fc)
 {
 	struct rdt_fs_context *ctx = rdt_fc2context(fc);
@@ -3002,6 +3045,8 @@ static int rdt_get_tree(struct fs_context *fc)
 		if (ret < 0)
 			goto out_info;
 
+		rdtgroup_assign_cntrs(&rdtgroup_default);
+
 		ret = mkdir_mondata_all(rdtgroup_default.kn,
 					&rdtgroup_default, &kn_mondata);
 		if (ret < 0)
@@ -3040,8 +3085,10 @@ static int rdt_get_tree(struct fs_context *fc)
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
@@ -3187,6 +3234,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 
 	head = &rdtgrp->mon.crdtgrp_list;
 	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
+		rdtgroup_unassign_cntrs(sentry);
 		free_rmid(sentry->closid, sentry->mon.rmid);
 		list_del(&sentry->mon.crdtgrp_list);
 
@@ -3227,6 +3275,8 @@ static void rmdir_all_sub(void)
 		cpumask_or(&rdtgroup_default.cpu_mask,
 			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
 
+		rdtgroup_unassign_cntrs(rdtgrp);
+
 		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 		kernfs_remove(rdtgrp->kn);
@@ -3311,6 +3361,7 @@ static void resctrl_fs_teardown(void)
 		return;
 
 	rmdir_all_sub();
+	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
@@ -3792,9 +3843,12 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
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
@@ -3804,8 +3858,10 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 
 static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
 {
-	if (resctrl_arch_mon_capable())
+	if (resctrl_arch_mon_capable()) {
+		rdtgroup_unassign_cntrs(rgrp);
 		free_rmid(rgrp->closid, rgrp->mon.rmid);
+	}
 }
 
 /*
@@ -4079,6 +4135,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	update_closid_rmid(tmpmask, NULL);
 
 	rdtgrp->flags = RDT_DELETED;
+
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 	/*
@@ -4126,6 +4185,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	cpumask_or(tmpmask, tmpmask, &rdtgrp->cpu_mask);
 	update_closid_rmid(tmpmask, NULL);
 
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 	closid_free(rdtgrp->closid);
 
-- 
2.34.1

