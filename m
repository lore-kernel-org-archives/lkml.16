Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79514292924;
	Thu, 15 May 2025 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349686; cv=fail; b=SRmow+i4uXsLh3WKlpCTUn6tMHV9+7+V/uohz59MKEQjFBFtVND0ii65u5lWWY9KLGjoD4r4W8VBeMJ8zup0odwo/N9UMKMOa6BqY8oyOjtF+DvJzcg2SAoNd0Pkk5ojySOOHVQ+5KscsSy07XsowWjl7O7jiUE/AD4nF+bwUwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349686; c=relaxed/simple;
	bh=LQMzVGFunxKFXL0LNVcTMM5QxN3gnOnv+wXNK8fQSdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krHAcfXYEIgbqyi9NAU50gRgGp6e/8OxUfxR3iQtuBpVvc1qXNzs7380vKTpE4XTPtFcvR0NfIEd3UbftRc3aSR0xoQuIOuxMf0CO48gnoIFNC+IjAO0V1HqgoLn42OHM2GNHDbh5+mWH76O4YSrz5HyNwbVlsXPNwmeErIuMGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kUXpl2do; arc=fail smtp.client-ip=40.107.243.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kUXpl2do"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4wBHOA1RI2KZ4Y6dWqUzBDlMBtTJQUFxhUsu2QpngcEGMLYtd37Bgcg6VP2amBkdHvop3g8jCC3D8v3JZc/1LVqcycHPB2ANm5C6jYgNn9f2GFj9TIONZM0jgqPIVTvm0Nbp1NqRg/0BVS4DYG9N+TAyJRwgzTVdTCjg+u/BFIwelNfKnHmI/4zVAECqitJoz/mDp2MxdIsZGSMkREPc+Lqj+xgj5zVpsYCSQtucoBElGB0EnPYs5oLTwH3iGGfanzi6uqXLI2MekchZIVsMDYhARDmkFD2sZTuf1TgyPPvvvMgYkDs+6Ww39O1gQ96/zDsbEzhadKOC42gM0zCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9uZGkK0mRw7dMtI4hYXpICzwbjAcBBnQ1fqswQhats=;
 b=uEHQ5mMam2nM8Nz2YNLz9nmk+suHGNzYuMRwblglvwzA/T0RIlQ6sCNdzyrY8pG1hZmS4Mg6h4IOz9PqzgJypf9WrCl0XbZMc8jR44Ixx0GsYCftW8K53hC7C4ZWLlShqqJl1r8GHRU8AlQ6kjnijgALBZ/wKwo6vsy+pww9PEsH2QcRukYC7Xv5nZQQhf9aZWUXZXdxpEMojViLNJeDTULJczUu+yn62L41ooktKwfAvrSATGvhAFFwBzStI0Tb3YIDrnTpji/jn+P+VzgcdN7d1d37TxeMiGb0t+0DqHNdF5GA5s5xLCFD0UkRSqHim+ravyT3wE+4+lGvm6Uw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9uZGkK0mRw7dMtI4hYXpICzwbjAcBBnQ1fqswQhats=;
 b=kUXpl2dobFFu7SP32yjJUDXlMSe6ynW/75hvatxnETsEUupPusxi1i+v5JhJcHxnMSsDT6Gx2MfHILf1J5WAii6EaUbyX1Hw9xEt450RuM6ZtXVy0yvWcQSnN4GPiPvi1+RDdhUEa4BlzUA6UrKTko0wwMF7O1hw2zJ8op8p7ug=
Received: from BN9PR03CA0051.namprd03.prod.outlook.com (2603:10b6:408:fb::26)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 22:54:38 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::16) by BN9PR03CA0051.outlook.office365.com
 (2603:10b6:408:fb::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Thu,
 15 May 2025 22:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:54:37 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:54:32 -0500
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
Subject: [PATCH v13 14/27] x86/resctrl: Add the functionality to unassign MBM events
Date: Thu, 15 May 2025 17:51:59 -0500
Message-ID: <1ba0091cad7d1e5ab32136d4742580294a2ce5e3.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8e04e4-cb96-45f0-41ca-08dd940377cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qng8Ut7DFhy3qgd8nZQSQOgoWTQ9ay3oP8H3FfMjHDLXPAtA361GhRfLlsJV?=
 =?us-ascii?Q?VIbsf+o00Z79iV0UGHvU/uHga6p2q5+FQJrjh8hAVAcScZfY4ZbN3eXyIIPV?=
 =?us-ascii?Q?7JjCxWevosG2DFpS4jnmlOhoOm5HdHT7ikyKZCg5D//uywGl1/SlrzrKmDDH?=
 =?us-ascii?Q?z9w3zB7fMwLaPul03ZPPuMMKM/SLTHALrEtwATayN3KCfInjiTvb8vw4x4Fr?=
 =?us-ascii?Q?dfvYaX/jXo5RPLiNMwh3pESDIaRAdmhG8CjDDugha3r8qgVk3PFlgfzP6nex?=
 =?us-ascii?Q?98DC8pstvARzSFPjjUhCWM9J0LR7/qLa0YBg+AtLjqHeSD/fcrKh40u7jniA?=
 =?us-ascii?Q?elvh+yBaW/y8wamDI/hOJuq83mSR2cn/4XrP/nsl0p4Da0AT176wqCOBBxhW?=
 =?us-ascii?Q?hpQNfKehVpqxw+ZWSEZHdU3phnz3iN2uDuBWYPISHhb2gDSfWtxL7PM916lY?=
 =?us-ascii?Q?h2sPTwIXo2waCuI+tHAVzsNK3XG3LU8shmYoGZzHfDDW8lGbqX1JN5R9LmNz?=
 =?us-ascii?Q?GsVVvx5tTPKlQwxT8NDe+zf2gqD8bhZn4N0/b/XNUaDqDN1Y8rDx8LTlHYjf?=
 =?us-ascii?Q?KzyUhu8QGk5mD6NveYHic90APaRY6OvSPJg5ODIVNVTq8TRWKaGu6mM9EIZ5?=
 =?us-ascii?Q?dXfXcUVasvJA6OxFfCKfpGT6Q64pbLb5E+Bvh6kzQRz7eSoV9OxW0xah3Frk?=
 =?us-ascii?Q?g/9Ab/MwUvEpwntx3xdcICZLs2WzGtjCM2XJ97tALJC46KbE5m8rXsLbmeQF?=
 =?us-ascii?Q?RM6R4XqUu/w6HYQ+xUcBCZHiYgfsCEo+rScHd/tU3f0FTMC1RCYyjJ7pwl7V?=
 =?us-ascii?Q?L1PxucuP3kHimSGJaZ8fUya4gKZYV4yFW9CJ2VSDp8YmbF6+O1fkcwjUiAVe?=
 =?us-ascii?Q?ApkwogjMmrdVp6u+DKI+8I2eQ8m4u5mpjGmAV2X9Sf1jVVinYg4gz6oIstc8?=
 =?us-ascii?Q?/+Hgy0WU6HYzySB/A0ZCzUKh/KIITWeM3YJTWawMe/wwkKhkw/CYJn1FaTOn?=
 =?us-ascii?Q?5B21qA0uW5MfdsZyx6EX/hf5ea12zas79MqcEJZKqeWVnAKQdd1hi7SyOvf9?=
 =?us-ascii?Q?/Bz/kP+Nzv/bwFqIPXgMToSGJIcemk47DZ9Dh0GnPzSobo/ed5b3Rbmt+a1a?=
 =?us-ascii?Q?8qggv4/YHtUWVxJC4Z8NNOjUrVEDdggmqb6Dke89iE9wKCZ72gZ3ZIUPUvTI?=
 =?us-ascii?Q?x2atGYvIaiCtNE7BU7E00tjP7g2pFxLbv/frqLf08agkpNiEa4m5tSr9gjTJ?=
 =?us-ascii?Q?oEXYbp24P+o4LnRiGWKOENz2NKUQpr1jlsrQ8l6YYwV7gOtJ5w/KpcDR5LDa?=
 =?us-ascii?Q?gLxdLxYn4qPh1TZOCLUnUfCfW7+NG16f4v/Qs/KPckD6IJddw+3qmsV6U2u5?=
 =?us-ascii?Q?vdY278KfnzawuRrIl9v+UfeV8Z+WKmClRlnLIzvqoZe/ZST5pRBVDtFkWjIK?=
 =?us-ascii?Q?RfJ5Rh2hgcuHWb1PSGTULUjfNYMIfQ9OkLJcJHWVLRRSbtkaXRhdYTT1Lnkx?=
 =?us-ascii?Q?o3iuZtF+tQv0dXI1EbYWlnSpKdo3Pv5n54GBDxNpFSBDTNN7AG4F7ymM1Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:54:37.1750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8e04e4-cb96-45f0-41ca-08dd940377cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
can be assigned to an RMID, event pair and monitor the bandwidth as long
as it is assigned. If all the counters are in use, the kernel will log the
error message "Unable to allocate counter in domain" in
/sys/fs/resctrl/info/last_cmd_status when a new assignment is requested.

To make space for a new assignment, users must unassign an already
assigned counter and retry the assignment again.

Add the functionality to unassign and free the counters in the domain.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Moved mbm_cntr_free() to this patch as it is used in here first.
     Not required to pass evt_cfg to resctrl_unassign_cntr_event(). It is
     available via mbm_get_mon_event().
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The monitor.c file has now been split between the FS and ARCH directories.

v12: Updated the commit text to make bit more clear.
     Replaced several counters with "num_mbm_cntrs" counters.
     Fixed typo in the subjest line.
     Fixed the handling error on first failure.
     Added domain id and event id on failure.
     Added new parameter event configuration (evt_cfg) to provide the event from
     user space.

v11: Moved the functions to monitor.c.
     Renamed rdtgroup_unassign_cntr_event() to resctrl_unassign_cntr_event().
     Refactored the resctrl_unassign_cntr_event().
     Updated commit message and code comments.

v10: Patch changed again.
     Counters are managed at the domain based on the discussion.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     commit message update.

v9: Changes related to addition of new function resctrl_config_cntr().
    The removed rdtgroup_mbm_cntr_is_assigned() as it was introduced
    already.
    Text changes to take care comments.

v8: Renamed rdtgroup_mbm_cntr_is_assigned to mbm_cntr_assigned_to_domain
    Added return error handling in resctrl_arch_config_cntr().

v7: Merged rdtgroup_unassign_cntr and rdtgroup_free_cntr functions.
    Renamed rdtgroup_mbm_cntr_test() to rdtgroup_mbm_cntr_is_assigned().
    Reworded the commit log little bit.

v6: Removed mbm_cntr_free from this patch.
    Added counter test in all the domains and free if it is not assigned to
    any domains.

v5: Few name changes to match cntr_id.
    Changed the function names to rdtgroup_unassign_cntr
    More comments on commit log.

v4: Added domain specific unassign feature.
    Few name changes.

v3: Removed the static from the prototype of rdtgroup_unassign_abmc.
    The function is not called directly from user anymore. These
    changes are related to global assignment interface.

v2: No changes.
---
 fs/resctrl/internal.h |  2 ++
 fs/resctrl/monitor.c  | 60 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index ce4fcac91937..64ddc107fcab 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -379,6 +379,8 @@ int resctrl_find_cleanest_closid(void);
 
 int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index d76fd0840946..fbc938bd3b23 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -989,6 +989,14 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
 	return -ENOSPC;
 }
 
+/*
+ * mbm_cntr_free() -  Reset cntr_id to zero.
+ */
+static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
+{
+	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
+}
+
 /*
  * mbm_get_mon_event() - Return the mon_evt entry for the matching evtid.
  */
@@ -1068,3 +1076,55 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	return ret;
 }
+
+/*
+ * Unassign and free the counter if assigned.
+ */
+static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				    struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	struct mon_evt *mevt;
+	int cntr_id;
+
+	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
+
+	/* If there is no cntr_id assigned, nothing to do */
+	if (cntr_id < 0)
+		return 0;
+
+	mevt = mbm_get_mon_event(r, evtid);
+	if (!mevt) {
+		rdt_last_cmd_printf("Invalid event id %d\n", evtid);
+		return -EINVAL;
+	}
+
+	resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
+			    cntr_id, mevt->evt_cfg, false);
+
+	mbm_cntr_free(d, cntr_id);
+
+	return 0;
+}
+
+/*
+ * Unassign a hardware counter associated with @evtid from the domain and
+ * the group. Unassign the counters from all the domains if @d is NULL else
+ * unassign from @d.
+ */
+int  resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int ret;
+
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
+	}
+
+	return ret;
+}
-- 
2.34.1

