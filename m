Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEF41EA7E2;
	Fri,  4 Apr 2025 00:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726165; cv=fail; b=Zv8v8ES3kBNRwd0TDW+PigWvnYxk63h7d7BRxgGvGeBQR0PNPoREYjkDOgVFetxtM3Nz4A4OCOMivT4eaMqFZsbccgEhpG7Idg+5HbhI1lsoM2AkgRtoSmKn8t36BtRpgr5f6zYQXX8SQ76fhhQJYc9aB1wjwWx5PSlfKfi4um8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726165; c=relaxed/simple;
	bh=5U42o6gEdBylELQnYSTqZbwAeVdtaE3C5CImyeUq3ao=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSDyhR03HWvHjy2Q1UGKNWT2BBbPvXudbclWIfeyDGaYVj2px0tMlq3ToeeiHxsXM+RlxVcv0smcOrLImiDyphhLnc+nYGRE5Ov0VBadRjGdODeqUh/bmOlufT4wQ8JC+tU/IxU1q3d6QXAIDr2hhH1qghJetASqVO8Bjw92Wpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g+rl0O8f; arc=fail smtp.client-ip=40.107.212.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g+rl0O8f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pL4Iq5Ka3PukkbofNvy1YhOgKMuBv59iFyHatnMIoIQYGacMsJHGhh/qwEYTriZ4UIvMPWd2+feJgAcqaJhNb967yVYzOn/aSjZofrEJb6SFQPg1OAxeohD2gvjXZgLhpWXvojlLWQGAlA8GqMKusiSgOu+6RcyUaanv6vsUPgH+zHgxfpEZIwWLF9BAS3l10Uni9R0vT9mjZoehyi9KPMfO6f9urCRSTyhOjrkVTyubXVL0LSkDCzhGyzYQa5UgXFTD8rYDgJdxyRFGuOuMZOXV03e2yHciEZaLe0YY01UPK0Q/h0MUku2iIvWTBD3kqHPgCzmnP7SWCSR7ba6/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF1EdgIMTPl94zpZ7mVnK7k8cuCfdVAP0cCIHfimp/I=;
 b=YoOKsVL162Cbdx9Bz2Q+JovrAjjMn80yfLVfTFfpCpWrUhtuye8O8VPEWHbQ+fYKSnosGncwwrPKGV+/ryn8A1EkIpxq7rySnFJrDhsgMDo3qOL4MQNp0DdAC46ayVAbz2LLrIW1rnBpCsgYeDDwsE7L7HM/CDdO90fs3QRVPpoRWqOPc8iRrr/j+ohLHQi4jT2MWpUEM362u1/upa8SMSzwIVY6UvPaZbEukU01xQRWHfl+tBgqHWIht8hU5hSZ7lCPGw8dYlEboo9VoqU3W8WHt+MxD4tvQn1O0Uf7/gWcjSQQE7cFdrjiHv87Ute4goJI6yfjSodoD2/GhMWudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF1EdgIMTPl94zpZ7mVnK7k8cuCfdVAP0cCIHfimp/I=;
 b=g+rl0O8fs6C3X9je3HiaPb7x85SPWZL1ysKnsdqvFfPuuLR5bBqlwhX9THKDceOEmz0Ofsc1lhmlZn5ahfdO7VB0/ZWTUIfPpaPUDbQrD3re8OlcweKmMviIpAvK4yu+vzM85EJpg9uGPbg1RMj3oyYVcM2Bi6jflzsrlsdD7iU=
Received: from BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29) by
 MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 4 Apr 2025 00:22:37 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::62) by BYAPR01CA0052.outlook.office365.com
 (2603:10b6:a03:94::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Fri,
 4 Apr 2025 00:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:22:37 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:22:34 -0500
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
Subject: [PATCH v12 25/26] x86/resctrl: Introduce the interface to switch between monitor modes
Date: Thu, 3 Apr 2025 19:18:34 -0500
Message-ID: <1a81e401acc3a4c7f02cb547938940b046d8946f.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 801aaf6b-2c1d-4894-718f-08dd730ecda6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A2mD9D5q9JNcPFP9A/5pkNqe8N5Sfehnj24Tnvb14O1nQpc582hZMoYocmkV?=
 =?us-ascii?Q?mY7XIZXZVwXfTJ0d1DjwPaR+6dFPu9P6nAetaVEqZEE4eE5Urtoa+ySDJyLw?=
 =?us-ascii?Q?B7pbw5Q8FmpZm+Ng3ZEKvV86cI8ryYDgHOmil9oJLaTOYRPPhTWvO83b/oHi?=
 =?us-ascii?Q?1A53PSs5n/SCa9PW2I68euAGhwkcInwSHmadwM0U/e3dQdeHnM2zbDnL+2LF?=
 =?us-ascii?Q?xig2mAYJKcX8QGcTZCuXVwXtDkl2oIzaarRk/2spl2+f3uCr1Acf/t4WqZP7?=
 =?us-ascii?Q?mSptvkHBQ1J/MeC7TXfpMq2KZhEvOnDyNn6p3IQeup/5ouJH16tw59SfHEQk?=
 =?us-ascii?Q?N6cDjeVbHJ27hf5VkRL4nlntFY6Fn0uV1m9r9RoDpCU8LummXZeGlfVQJ8M1?=
 =?us-ascii?Q?5/Q/yJMhvSD548dHRgCLA75vGMnNHZEAduaAehJ7LfRj7WfwzmZkV98VDCKa?=
 =?us-ascii?Q?M9mRuPO4yeqPMap5c98UxYPjE0rUT5t/uCKd39tOQ7d5QQsZq60w22mCJqYl?=
 =?us-ascii?Q?Z0jF+fprFSlUucWCwsr/zbsUGLeRSlC7khFkbnuqVBsbDP74CPD82doCy+aD?=
 =?us-ascii?Q?fLtqh5isXxnvuhI9ihGYAjufYmYzDfRnlDiXv3HW9pcYmLoAdPK4fgMBF98d?=
 =?us-ascii?Q?+FY5mof7xmVTGhnUJzvD61c1ZCVBAvVkzvgZ5weF0OFdB26NH6Y4kByOJTWU?=
 =?us-ascii?Q?lwSZSTGJ37alyg1WRJShLcJ8QENx78wgxrCTKtK+9COaE87U031MzNDTuFE4?=
 =?us-ascii?Q?4rLmG+JrWzGfwqibmgyrH+CMv5lq7EjqWkO4ErxEQKpAZvVYO8jzBIm9nwCg?=
 =?us-ascii?Q?sdl3uwr0e/97XpX7ZZ+C99vzOk6q4gSxALVAPpNir57Vg05L8iuV9EeG2tPw?=
 =?us-ascii?Q?hmSJYaoEHYPnNMFSjSHODJkXTPcfwDabhn/LnXsw8enVQ22chA3LEVsWuMiG?=
 =?us-ascii?Q?MK4V0DOeKkcP6XceKp9drOWG+FuKlelZKZuYcMSHJKw9qoWZrNe6YHYCc7Sh?=
 =?us-ascii?Q?pcJrJ6gLnkfPedaQXeGX85nvEijmGbyXfzXKDORy4Ivrp75RFFCA7CSx1hG1?=
 =?us-ascii?Q?VMDFYMwkbf+32jfvpQX6pwKeP+h+gfbOS0h0CPISFo30+DkAo8pGycuhpnyl?=
 =?us-ascii?Q?7dip+gTJJ/uyUlpGuGEjxtaMUz7pJET6/gH1yk0tc9g5SR+AdtUd0w2nwUa6?=
 =?us-ascii?Q?0hgRTljwx3jzW2wMrrEiQkavkB20H1FLmvlnuCqssa3ZuBJlqFjxehe/MI+e?=
 =?us-ascii?Q?BMyIAmzKgNF7IAnpPNvDMSP07p0tKXj+8HqCPadONxLgg4db05EG0AxF0f85?=
 =?us-ascii?Q?thq0G1NJA2tHCNUSEbtqrkrgqYuOSn2E8WEtUfQHfdc9XLxtOmbINiAhksvz?=
 =?us-ascii?Q?CBHTwveleJ8jsBCxfw03txPA9TsMTSk8qvrAYu2xDYEyoLwRzfUi2nhT11zh?=
 =?us-ascii?Q?7Mz3y3SkLkdFAdmnJe8/gzp9xQ2QyewIoEPIbuCb6yNIpB+XFNKyoT+OeGck?=
 =?us-ascii?Q?Nhy8IFcsYE8ScyQuZOJO3STGQDQZiG5TiFBsk58h1G9Umhl0GPhoutfD+w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:22:37.1889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 801aaf6b-2c1d-4894-718f-08dd730ecda6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411

Resctrl subsystem can support two monitoring modes, "mbm_cntr_assign" or
"default". In mbm_cntr_assign, monitoring event can only accumulate data
while it is backed by a hardware counter. In "default" mode, resctrl
assumes there is a hardware counter for each event within every CTRL_MON
and MON group.

Introduce interface to switch between mbm_cntr_assign and default modes.

$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
[mbm_cntr_assign]
default

To enable the "mbm_cntr_assign" monitoring mode:
$ echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

To enable the "default" monitoring mode:
$ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

MBM event counters are automatically reset as part of changing the mode.
Clear both architectural and non-architectural event states to prevent
overflow conditions during the next event read.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Fixed the documentation for a consistency.
     Introduced mbm_cntr_free_all() and resctrl_reset_rmid_all() to clear
     counters and non-architectural states when monitor mode is changed.
     https://lore.kernel.org/lkml/b60b4f72-6245-46db-a126-428fb13b6310@intel.com/

v11: Changed the name of the function rdtgroup_mbm_assign_mode_write() to
     resctrl_mbm_assign_mode_write().
     Rewrote the commit message with context.
     Added few more details in resctrl.rst about mbm_cntr_assign mode.
     Re-arranged the text in resctrl.rst file.

v10: The call mbm_cntr_reset() has been moved to earlier patch.
     Minor documentation update.

v9: Fixed extra spaces in user documentation.
    Fixed problem changing the mode to mbm_cntr_assign mode when it is
    not supported. Added extra checks to detect if systems supports it.
    Used the rdtgroup_cntr_id_init to initialize cntr_id.

v8: Reset the internal counters after mbm_cntr_assign mode is changed.
    Renamed rdtgroup_mbm_cntr_reset() to mbm_cntr_reset()
    Updated the documentation to make text generic.

v7: Changed the interface name to mbm_assign_mode.
    Removed the references of ABMC.
    Added the changes to reset global and domain bitmaps.
    Added the changes to reset rmid.

v6: Changed the mode name to mbm_cntr_assign.
    Moved all the FS related code here.
    Added changes to reset mbm_cntr_map and resctrl group counters.

v5: Change log and mode description text correction.

v4: Minor commit text changes. Keep the default to ABMC when supported.
    Fixed comments to reflect changed interface "mbm_mode".

v3: New patch to address the review comments from upstream.
---
 Documentation/arch/x86/resctrl.rst     | 25 ++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h |  2 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 16 +++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 58 +++++++++++++++++++++++++-
 4 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index ad35c38eed34..05f1852ad8e2 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -259,7 +259,10 @@ with the following files:
 
 "mbm_assign_mode":
 	Reports the list of monitoring modes supported. The enclosed brackets
-	indicate which mode is enabled.
+	indicate which mode is enabled. The MBM events (mbm_total_bytes and/or
+	mbm_local_bytes) associated with counters may reset when "mbm_assign_mode"
+	is changed.
+
 	::
 
 	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
@@ -275,6 +278,16 @@ with the following files:
 	counters available is described in the "num_mbm_cntrs" file. Changing
 	the mode may cause all counters on the resource to reset.
 
+	Moving to mbm_cntr_assign mode require users to assign the counters to
+	the events. Otherwise, the MBM event counters will return 'Unassigned'
+	when read.
+
+	The mode is beneficial for AMD platforms that support more CTRL_MON
+	and MON groups than available hardware counters. By default, this
+	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
+	Monitoring Counters) capability, ensuring counters remain assigned even
+	when the corresponding RMID is not actively used by any processor.
+
 	"default":
 
 	In default mode, resctrl assumes there is a hardware counter for each
@@ -284,6 +297,16 @@ with the following files:
 	misleading values or display "Unavailable" if no counter is assigned
 	to the event.
 
+	* To enable "mbm_cntr_assign" monitoring mode:
+	  ::
+
+	    # echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+
+	* To enable "default" monitoring mode:
+	  ::
+
+	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+
 "num_mbm_cntrs":
 	The maximum number of monitoring counters (total of available and assigned
 	counters) in each domain when the system supports mbm_cntr_assign mode.
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 2020a2fe7135..2f3a5d78d153 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -599,6 +599,8 @@ int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d
 				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
 int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
 		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
+void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 0c6fd5f6ec19..7f2e1fdfa936 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -610,6 +610,17 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
 	}
 }
 
+void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+
+	if (resctrl_arch_is_mbm_total_enabled())
+		memset(d->mbm_total, 0, sizeof(struct mbm_state) * idx_limit);
+
+	if (resctrl_arch_is_mbm_local_enabled())
+		memset(d->mbm_local, 0, sizeof(struct mbm_state) * idx_limit);
+}
+
 static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
@@ -1558,6 +1569,11 @@ static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
 }
 
+void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d)
+{
+	memset(d->cntr_cfg, 0, sizeof(*d->cntr_cfg) * r->mon.num_mbm_cntrs);
+}
+
 /*
  * Allocate a fresh counter and configure the event if not assigned already.
  */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5d9c4c216522..d10cf1e5b914 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1050,6 +1050,61 @@ static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
+					     char *buf, size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+	struct rdt_mon_domain *d;
+	int ret = 0;
+	bool enable;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!strcmp(buf, "default")) {
+		enable = 0;
+	} else if (!strcmp(buf, "mbm_cntr_assign")) {
+		if (r->mon.mbm_cntr_assignable) {
+			enable = 1;
+		} else {
+			ret = -EINVAL;
+			rdt_last_cmd_puts("mbm_cntr_assign mode is not supported\n");
+			goto write_exit;
+		}
+	} else {
+		ret = -EINVAL;
+		rdt_last_cmd_puts("Unsupported assign mode\n");
+		goto write_exit;
+	}
+
+	if (enable != resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		ret = resctrl_arch_mbm_cntr_assign_set(r, enable);
+		if (ret)
+			goto write_exit;
+		/*
+		 * Reset all the non-achitectural RMID state and assignable counters.
+		 */
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			mbm_cntr_free_all(r, d);
+			resctrl_reset_rmid_all(r, d);
+		}
+	}
+
+write_exit:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -2412,9 +2467,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "mbm_assign_mode",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_mbm_assign_mode_show,
+		.write		= resctrl_mbm_assign_mode_write,
 		.fflags		= RFTYPE_MON_INFO,
 	},
 	{
-- 
2.34.1

