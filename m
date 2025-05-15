Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC2C28D8C4;
	Thu, 15 May 2025 22:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349672; cv=fail; b=KNQVTaMmn/59Nj5hjKx89mZAMG/Ju9IYTvEqUO1MXYV60WbH4JbmI+C7Wf29b9ru5mvsNg+sSXkBbAS1IIOxmxiPKGP6C2cNtNztT6l1K1c2f3DLZEMh6IYC8txbZ5jEHSFxk+RMHTJc6JNd5/MllGXc716lLjs5RVzO8NhYOGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349672; c=relaxed/simple;
	bh=LwKbrldtM7FqjX3/6asK14EyFucCEVcrhm4yJL2SNbg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YD2cjVI3ACZLaNT8eILI4NokLuMLmo/KeiTqji6mEnSeBnl3IQNzdTBU7Pdg6sx+I3hFupIuuw2nvuiMZRqybPmBKEylN6UaeF50sknUbmAgneZeq3VY/w6FHeY3jQn2B6rXD03JR8vGVZig/yDjkddoYoHRoqJ4Gr97nN3PgYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DnIU5LBV; arc=fail smtp.client-ip=40.107.100.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DnIU5LBV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHvcadQemcWLGEQCMkfOTHXqIU31l2M7zhVShY937AE3F98HiDXOkKnk/OPV2ypC8FtTsaRMuXyTTyVPuI6Mwf8z5Gj27kftymqMG3/EN576SXOor2bahCsI47UZ4G5CW3g31EmKLkeU5FfGGxcvpOlJGqoxM5hNKRUnRtSAwW5SzF6qSmDRa8BmEwjmXLjuSTLbevuwwoILvOU2Ds6RskC2+eIzUfu9lFLwp/ex0CHYB2pGJq6oaBTqupCAQnBSU3cgOZ3z0hWYUx/EJFYADQ+fHT0LtQcATIJbhiC+Ht6lq1g2MAHPAeIa+dhPfOMEYPqi4gy/5iSHmYejKejeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iDSzoeHUENvrtYhRToqnXWHc+MyM9WHjIfABKWl9KA=;
 b=vSxlwmCRgADf9s93CLh3b7GvpMANz1YnMdVRGMPMSSwyl8Wc8AZcC56P2wN5giXoja1v8jEiR+ZxBvOICrrfZ2yTaNdpREUhf97kr5RrCqiUFxecziD+NUk7sUP7zM5mj6XKuRaHA1qNLaEpAS0xypu7BQKBPRXgnnR9k9RCavZ7WZVmzK1C39pF7KraAqiN9qnheTnLvue3N/hgDYa9g2SCO4ubciebS6ZJ5g5zOq+5EClnDJoDnFUUZEyUKJm8lR/jh+sEGVjr84VdXQAwhBuj3MAaaZA2sUF0yQKvk63OaUEAbbh98xLv9Px7e5xvw6XGB9oTVOINE1UJWUkJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iDSzoeHUENvrtYhRToqnXWHc+MyM9WHjIfABKWl9KA=;
 b=DnIU5LBVrx+/gLgoJvAzL7vdS8TQp9gbwynGTC5xRnUBCjvo6zqfMu4WNsCbO/8354ocSpKmt3/BW8DZHmYk5IdCvXrw3BExvspgKPe6Vd3NmKzjl5/WtS+xiGM+zBlvwtflwA/d+tol+Dl9KsyLADr0cg5+WjkI5TmbC2Ph0Ak=
Received: from BLAPR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:32b::14)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 22:54:26 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::8c) by BLAPR03CA0009.outlook.office365.com
 (2603:10b6:208:32b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Thu,
 15 May 2025 22:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:54:26 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:54:22 -0500
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
Subject: [PATCH v13 13/27] x86/resctrl: Add the functionality to assign MBM events
Date: Thu, 15 May 2025 17:51:58 -0500
Message-ID: <690c1af39c9f7d4d9d5a1f2f84e89717bb756f23.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf78a81-b023-4c67-9f6b-08dd94037141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q2DflaLCzIz8UznFHh4gUWuyoBJ1k67yhwOeaR0HkRFjEuLKFsACyxMLbMdY?=
 =?us-ascii?Q?tCrHa6IQVHDV9vSL8dxZ6XulMUhIZE/0dmuL2jAJ2+iMethyFHZxUzg17Ipp?=
 =?us-ascii?Q?KqKJMAW8I7SBYgCUdxZJQ+d6bWDAMrxRYCLwxf1MJuMeBq8zjGMeMXgn8eG2?=
 =?us-ascii?Q?jIjQuko8UBQwAPRNa7dG8vDSXvvWEoqpnk13mGfnr4A5udsp9/s3R3Aq6IZU?=
 =?us-ascii?Q?ou6i11n7c7HE+TYNyYr4xyNJOw8zjmZ3gOc8RxMdLRYpUoOvcbM9HeiU4mHL?=
 =?us-ascii?Q?nSAgzbBReX0TppGGzHH71PPlkXyOxkEfFUFu3uAAbsKnrNlq+VQ8jm0Rktxe?=
 =?us-ascii?Q?dJzEhYxDR+WHufFF/DMnLUfNh9ip+3mlXudZLgLAxueri3Uxglj+Ln+0lt68?=
 =?us-ascii?Q?V9WORamCz24s+6A5AawIMBD3Xw78eQREMfJSWsIB2bKeUMZqNRRr+CZSG8Ps?=
 =?us-ascii?Q?m1Kkiwq9cs/sL8dZrksakj9ImJkZ2vBRqzhsWHjRaOlGwJTQr9adxPScpWZ4?=
 =?us-ascii?Q?pXbV1jlX0jcqWHZMwEli4pJPqkeUEqaSk8UQ0lRPCinqEDD/7mCbH2w7hO7e?=
 =?us-ascii?Q?T1G7qXBq/0OXuDanJ0dvFcFbQxGxCicSNy1QT+kiGDUjBR5+qNyO0e37kuNO?=
 =?us-ascii?Q?d6Sb5bPZI8wlFluA1msVXh0w14VV3LD/y/48uqd8meQEF+KhWdIQFU4TILn3?=
 =?us-ascii?Q?Yn+UA/NQLm0yVzOxQXh0V7iJnRMTtTy+68wDTrJS3dVFM9v4beS2ICpSwsdB?=
 =?us-ascii?Q?qU46LtyRxW2LHRa87CMiECjVIDmDqfmBuIu6tCxSJWbEE4ULi6ojRRuAPcRc?=
 =?us-ascii?Q?ibKP4iFHgo4MxEt33plOZu8wY+bRL6pK7Yioefb6V8gtSp0ZbM9/rnhhboWw?=
 =?us-ascii?Q?nzVviG4UPScgvp2xJyb5l3yOzOCmCVffbog/bnQSZP5sccKzlVOGRgsY1KLW?=
 =?us-ascii?Q?gRYunpvLsz6xYKstnlmgNC7Dx/moOYlofaqRqTlPUZCu0bdKW1VFZgSBN28G?=
 =?us-ascii?Q?Kbu8T6atfsTuSztpW3yXqn7SIYMYyJQ1S1a0s8muB4VY//hl+qV+y6a8Zqql?=
 =?us-ascii?Q?AEA9sUHUPaJyGpGvYvORrzMlpLmX0v6Eg83Pl8eooiGBgzajFS3jHWlm90ro?=
 =?us-ascii?Q?CeTibE+HwwWHK3kbs/sHa3IR1R6unNJOWY1aqrJriIyCcvkxKsITpZtMKZIp?=
 =?us-ascii?Q?rndJ0L4BRKSPWuyIKDqzsidwdUH/Ox4hX0kpF24WCRDvxCgvDZaYHy3a7yxc?=
 =?us-ascii?Q?sFv89kV/MThLldhZH4QGWq7g2z28ZpMUc/aDC61XSz+DRPiqI+zMLje6xDzk?=
 =?us-ascii?Q?+WZmq6Z+N/Jfsbm5aCKr2nuS7Gt9SZz7FEt9Lg1PSwD4YMOQ55pu/8Zorm5D?=
 =?us-ascii?Q?ZSi/hFdMgzSAV1IHQspG2kDqKl2npeQItKSnbVLZapMoOmRkGUAxQxq2owMt?=
 =?us-ascii?Q?W08lMC2o+3R/wOb9fDh2BUEU1c/YlsMtl4KyThRz3qqvd2IqCI3Ov64mwYMt?=
 =?us-ascii?Q?idjixayi8zW1EeHcOR7AWxWJ9QwBfFErT8pxXD+JhN0K04cDeVuj+FE5wA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:54:26.1985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf78a81-b023-4c67-9f6b-08dd94037141
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920

The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
can be assigned to RMID, event pair and monitor the bandwidth as long
as it is assigned.

Add the functionality to allocate and assign a counter to am RMID, event
pair in the domain.

If all the counters are in use, kernel will log the error message "Unable
to allocate counter in domain" in /sys/fs/resctrl/info/last_cmd_status
when a new assignment is requested. Exit on the first failure when
assigning counters across all the domains.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Updated changelog.
     Changed resctrl_arch_config_cntr() to return void instead of int.
     Just passing evtid is to resctrl_alloc_config_cntr() and
     resctrl_assign_cntr_event(). Event configuration value can be easily
     obtained from mon_evt list.
     Introduced new function mbm_get_mon_event() to get event configuration value.
     Added prototype descriptions to mbm_cntr_get() and mbm_cntr_alloc().
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.

v12: Fixed typo in the subjest line.
     Replaced several counters with "num_mbm_cntrs" counters.
     Changed the check in resctrl_alloc_config_cntr() to reduce the indentation.
     Fixed the handling error on first failure.
     Added domain id and event id on failure.
     Fixed the return error override.
     Added new parameter event configuration (evt_cfg) to get the event configuration
     from user space.

v11: Patch changed again quite a bit.
     Moved the functions to monitor.c.
     Renamed rdtgroup_assign_cntr_event() to resctrl_assign_cntr_event().
     Refactored the resctrl_assign_cntr_event().
     Added functionality to exit on the first error during assignment.
     Simplified mbm_cntr_free().
     Removed the function mbm_cntr_assigned(). Will be using mbm_cntr_get() to
     figure out if the counter is assigned or not.
     Updated commit message and code comments.

v10: Patch changed completely.
     Counters are managed at the domain based on the discussion.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     Reset non-architectural MBM state.
     Commit message update.

v9: Introduced new function resctrl_config_cntr to assign the counter, update
    the bitmap and reset the architectural state.
    Taken care of error handling(freeing the counter) when assignment fails.
    Moved mbm_cntr_assigned_to_domain here as it used in this patch.
    Minor text changes.

v8: Renamed rdtgroup_assign_cntr() to rdtgroup_assign_cntr_event().
    Added the code to return the error if rdtgroup_assign_cntr_event fails.
    Moved definition of MBM_EVENT_ARRAY_INDEX to resctrl/internal.h.
    Updated typo in the comments.

v7: New patch. Moved all the FS code here.
    Merged rdtgroup_assign_cntr and rdtgroup_alloc_cntr.
    Adde new #define MBM_EVENT_ARRAY_INDEX.
---
 fs/resctrl/internal.h |   3 +
 fs/resctrl/monitor.c  | 134 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 0fae374559ba..ce4fcac91937 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -377,6 +377,9 @@ bool closid_allocated(unsigned int closid);
 
 int resctrl_find_cleanest_closid(void);
 
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 8e403587a02f..d76fd0840946 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -934,3 +934,137 @@ void resctrl_mon_resource_exit(void)
 
 	dom_data_exit(r);
 }
+
+/*
+ * Configure the counter for the event, RMID pair for the domain. Reset the
+ * non-architectural state to clear all the event counters.
+ */
+static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				enum resctrl_event_id evtid, u32 rmid, u32 closid,
+				u32 cntr_id, u32 evt_cfg, bool assign)
+{
+	struct mbm_state *m;
+
+	resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, evt_cfg, assign);
+
+	m = get_mbm_state(d, closid, rmid, evtid);
+	if (m)
+		memset(m, 0, sizeof(struct mbm_state));
+}
+
+/*
+ * mbm_cntr_get() - Return the cntr_id for the matching evtid and rdtgrp in
+ *		    cntr_cfg array.
+ */
+static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id;
+
+	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
+		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
+		    d->cntr_cfg[cntr_id].evtid == evtid)
+			return cntr_id;
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * mbm_cntr_alloc() - Return the first free entry in cntr_cfg array.
+ */
+static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
+			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id;
+
+	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
+		if (!d->cntr_cfg[cntr_id].rdtgrp) {
+			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
+			d->cntr_cfg[cntr_id].evtid = evtid;
+			return cntr_id;
+		}
+	}
+
+	return -ENOSPC;
+}
+
+/*
+ * mbm_get_mon_event() - Return the mon_evt entry for the matching evtid.
+ */
+static struct mon_evt *mbm_get_mon_event(struct rdt_resource *r,
+					 enum resctrl_event_id evtid)
+{
+	struct mon_evt *mevt;
+
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
+		if (mevt->evtid == evtid)
+			return mevt;
+	}
+
+	return NULL;
+}
+
+/*
+ * Allocate a fresh counter and configure the event if not assigned already.
+ */
+static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	struct mon_evt *mevt;
+	int cntr_id;
+
+	/* No need to allocate a new counter if it is already assigned */
+	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
+	if (cntr_id >= 0)
+		goto cntr_configure;
+
+	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
+	if (cntr_id <  0) {
+		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
+				    d->hdr.id);
+		return cntr_id;
+	}
+
+cntr_configure:
+	mevt = mbm_get_mon_event(r, evtid);
+	if (!mevt) {
+		rdt_last_cmd_printf("Invalid event id %d\n", evtid);
+		return -EINVAL;
+	}
+
+	/*
+	 * Skip reconfiguration if the event setup is current; otherwise,
+	 * update and apply the new configuration to the domain.
+	 */
+	if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
+		d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
+		resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
+				    cntr_id, mevt->evt_cfg, true);
+	}
+
+	return 0;
+}
+
+/*
+ * Assign a hardware counter to event @evtid of group @rdtgrp.
+ * Assign counters to all domains if @d is NULL; otherwise, assign the
+ * counter to the specified domain @d.
+ */
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int ret = 0;
+
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
+	}
+
+	return ret;
+}
-- 
2.34.1

