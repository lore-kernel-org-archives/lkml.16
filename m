Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855BB155C82;
	Fri,  4 Apr 2025 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726074; cv=fail; b=B6n27xt5XGWeaZu7O/R+36R7qVNfuVyjGMD6kqHk7LJdRGOnu00yyxXV401aiG00R9SglKDcoSpwOz16yXi8LE5yStwwCg7aAtlBYfzg37kej4f/j2Vkwx3AuaQZtRpFSskv3xJ+7fquZMwm3G431Cfhyb9miSJaTeKFkUe8XxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726074; c=relaxed/simple;
	bh=8yCZRjuxeCa5+VSNgHN35um4gu3cKDRddHm+nZh15uc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L15KgPXAn1y8CMrpW4YZdb3TleIOSyRRb4UIKOdwtlnvM9Tj5n5sJ+77awWvGAEZYo5kwjFnWSiqkjAHpk28uxBaWVbAX6fJgTTHIC18Mf6EJqbV/VgDSH9MCOxQ2/HbPZbPrkO8YdKBEgIkTK70WTC2DRcTNYSKIZncU/PDPkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cVnajdTu; arc=fail smtp.client-ip=40.107.236.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cVnajdTu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjdgQ5VyLS/A64c6IkuKtvCk4W4+eNA3i+jwm5YMJ7boX1FsIP3iovffo3/WjTu0plHmOP5bMvIKLm5tKQLfsR2piUCBMmFbSf7hPNjzzdAhnIXTR2tO+XKoh+GS8arrdkGqIP90pIhDLPi3hFZlWl+ZWQRwAig6J2qN/5h9zsr4JfIbXIYbe0OLs6yiHNFvRnKINJg/EedXxdnk1n8lH/VnXaGJ+tOFYoPYw7D+Amt+CGcKHSTMnR8h1FRdXD5dgNFCw4EWw7991oHpGvIUOPlnpRQBSz8JAjogqJ+ee/tkXz38o9NHo+mv/gXWkL5uukpEyZ5tAdXazDBEuXqTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7590E6QWyuTJ0CGwBUZdVbvpG/nkfsadLPt1pyrL9M=;
 b=ggG4fS93KDZheGiyvZaTBg56WMPIuCuru8kFFoeTsHXhgq5OXrZKFPiV6n+5iAA7FgYLx+yTEOFBo5svnJRtWkDaHtxCSGVDb3rC5dp8Bv5s1yx037wJ+PgaqJRF2XBO7IrtyqtS3pFdmY+lzuqNBvvEoB9qkohxtMGNkGnL/6OF414GTavNXz6vUPHZ0K6momVWXQP6whyxG5fmTD1Jst8gLfiUmXuZhuDfHuCMZ4Ch63JGcgwHT+q/FzAQcCwXEaPSia/n4fVkbAGAjIltHzb900RQ6/7twsP1r0mdRx8k7mpGyyX3IX+Rtdxh/CCwc5gcUE4Mky4idGqkbh6kaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7590E6QWyuTJ0CGwBUZdVbvpG/nkfsadLPt1pyrL9M=;
 b=cVnajdTue7v7evie2XLifv/CZS3ydMdCsbONUsxyVwTKKJFXjv46M7qQ+oCFv14LcwtvofwK4DhTIL2EkfwqzyvVE84GgiLZ7crPr4jkLYmw9HaQ9mVo6yeGZSPS+lRGI5j2OTZVLXWvSdeTjw1/f7b8T/L0ij5k1cD8Rc+UUPY=
Received: from BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25)
 by SA1PR12MB7296.namprd12.prod.outlook.com (2603:10b6:806:2ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:21:04 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::90) by BY5PR03CA0015.outlook.office365.com
 (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Fri,
 4 Apr 2025 00:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:21:04 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:21:00 -0500
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
Subject: [PATCH v12 15/26] x86/resctrl: Add the functionality to unassign MBM events
Date: Thu, 3 Apr 2025 19:18:24 -0500
Message-ID: <afc5ad9b4b64e4935df47814170a205f35dabffe.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|SA1PR12MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb0089e-d3a6-4ee6-08f9-08dd730e963e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+R0147ZJfMkh3IFXRSItFs7mrA7dRZleUSFpwAihqRKG7WkdgNj5/IJRb7LK?=
 =?us-ascii?Q?5sVPi3fLwCfWrnKNOQyLu+LP1vVpUtQoK6Zz+7FNu7nNYZRoxEishcUXfzBt?=
 =?us-ascii?Q?Xcem2uHy52TMSjXgYJ75NrlFvXGB8h3DvqQlHcs2XVCKalK1dG/bEPa9em1O?=
 =?us-ascii?Q?Ecw+Tj4i4EHeQr/OqqCIVGtJX2eyai1fyF35P50sKOJE5Ozh8MMDXqPFB6iM?=
 =?us-ascii?Q?aVZOs/fUbfk9qfdh6mn6KkZpNaNfrurqcuw9cBlLaSbVDzrArxvRtjVCUEgC?=
 =?us-ascii?Q?pRORM6BY5GeIRE++dyR6DJVY+bT+u4giOpjWmDCEuTYk3cKiiYlTGBlYORiq?=
 =?us-ascii?Q?ZhZfaUMDLuPqRLB5WW2gWpMeMWFCotlp/9PiDFukXldyU0YUdiM5nKcyIpog?=
 =?us-ascii?Q?tHj9jAvcvjsqtqRL3bZFvAt80t04a8pJ6vRWQz2rnaVcK6OYAqnQTKxklTxK?=
 =?us-ascii?Q?EuayJVgPCSJgu947x3rPH9x3OrMG1C/VzaB6Y7Uuvm9kxPLQqjsh0FqUXUua?=
 =?us-ascii?Q?wyN32Iee/YYWdVuQAxJCM8pBF8NkdzpClYIUw938H7/j3GKr5O1nEFlMQ56v?=
 =?us-ascii?Q?cCSO8quv5pLqlO4PABH9HCeHLZAjJi+zCINksebjLn5RPgy18EKfQpRLWOJf?=
 =?us-ascii?Q?uaCqD7jAuQe9IgpekHtwckIEgWU6PpRbuvB7ZvA8dboPdWpF/mYIinOPpBkZ?=
 =?us-ascii?Q?gl2+AKKdRaVNKrp1U93UOREYiZhWnxQaTJqoQcWm9bd8TZbP1gyJZmZbR+7V?=
 =?us-ascii?Q?hOI20+gKEWpyKvljSaj3sgjSEzY4tVkjh7zo3RwkamETjVXYPR7uYtXujH1x?=
 =?us-ascii?Q?M5GsXrq6E8cMGoM/2n9Gx0sG+O8SiqJ/FD8Ie2sxpJDYh3t2lhQKO+cPxV+1?=
 =?us-ascii?Q?8imtm84TmRmCbf1coxR9zgfnY5F4ZW4Sz6CbYICP/G5EhJfZtu5CrR8n++QH?=
 =?us-ascii?Q?nltJfpCsY9wLU8Mp7ZSOBSCv8f1DmGdcqbUSQFr7PJn7Y7y2z1sZoMWEuTBE?=
 =?us-ascii?Q?kAIyL7AnhTtE9SdYtjIcVId50rZ/5+X+hP8RWfj9VqLWGO+sBQUudEvf1xJs?=
 =?us-ascii?Q?8Mq+P1kHkCGeusFf+7W72xKrTEmE/pOKSEJqN6OJEmLCkW/2DCuCJsHscmlx?=
 =?us-ascii?Q?L3yxg1E8UjHhrensSAu9GM79C3OXcw8r4UlxwVkTRdSppeh2O7hYWEibKE7n?=
 =?us-ascii?Q?KsOL2aYxm2n+MeqZDVhWRvasqYGDl5C+f/o0b0gWsDXRiqDpsqzleSieaeQS?=
 =?us-ascii?Q?RRPqTSWP40lHB0aqlFOXV01ugGJWPZa0aGWEHYRi1Rzga0V2fnLAS4CplfhY?=
 =?us-ascii?Q?hC/7XL55JzcN4TeZfn1X9+gwB4MyFN5ssAWQA8P58ZIhjJx/igEYTQQPNYq8?=
 =?us-ascii?Q?sPo11AVRuSeaw4JgZqsWamPeX+RGhYSnKuPAALr95a1FFodAkN3P8y/o13hy?=
 =?us-ascii?Q?q75KVFtkmNjtZoTr/56l/Zwdd2fRuW6FATLDpt4IhugPyoxcd+3SkYrWwDmF?=
 =?us-ascii?Q?u1yImOlvIR0/bnAUvW+edOGUu4FNWnwpLbMg8cacnSk+31Tr9k6Cj2ZwsQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:21:04.2456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb0089e-d3a6-4ee6-08f9-08dd730e963e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7296

The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
can be assigned to an RMID, event pair and monitor the bandwidth as long
as it is assigned. If all the counters are in use, the kernel will log the
error messag "Unable to allocate counter in domain" in
/sys/fs/resctrl/info/last_cmd_status when a new assignment is requested.

To make space for a new assignment, users must unassign an already
assigned counter and retry the assignment again.

Add the functionality to unassign and free the counters in the domain.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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
 arch/x86/kernel/cpu/resctrl/internal.h |  2 ++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 46 ++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 1a8ac511241a..13a2a9b064df 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -576,6 +576,8 @@ void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
 unsigned int mon_event_config_index_get(u32 evtid);
 int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
+int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index ff55a4fe044f..84dcb227f84c 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1593,3 +1593,49 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	return ret;
 }
+
+/*
+ * Unassign and free the counter if assigned.
+ */
+static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				    struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
+				    u32 evt_cfg)
+{
+	int cntr_id, ret = 0;
+
+	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
+
+	if (cntr_id < 0)
+		return ret;
+
+	ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
+				  rdtgrp->closid, cntr_id, evt_cfg, false);
+
+	mbm_cntr_free(d, cntr_id);
+
+	return ret;
+}
+
+/*
+ * Unassign a hardware counter associated with @evtid from the domain and
+ * the group. Unassign the counters from all the domains if @d is NULL else
+ * unassign from @d.
+ */
+int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
+				u32 evt_cfg)
+{
+	int ret = 0;
+
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
+	}
+
+	return ret;
+}
-- 
2.34.1

