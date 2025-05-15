Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D83293732;
	Thu, 15 May 2025 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349799; cv=fail; b=ayQmr6BbjEfQIlcD9oQRrlcNUt0Xiptcvqj48ud88IKOsbEYK3VkTYEGYin6/Kcj0015Fe5kZZifeb9kIl4I8IMt5aUHUYPmVm9x2FMsHusbSZnxL+KW8Z82D60k/MthC35uR5PvUcviEkw0CiUbAIsnEkS4SDrf53Y3w9MbrQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349799; c=relaxed/simple;
	bh=UfEN1JBPzfQh/bG4aX8Kjd+zYoNK74/vZDIK0IsoHkw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TgBotmv10psAEX/805LvQSX6ejdAQZYYtLZahOjwT/jwMNuSGGHzbNi6tH9ur9JqB7d/tUSCVdVSR6GePC8svbOhcwKmfERiIHB2Qj10OwfAWLaJUcoxSKb7tDMbjB2e3o+J2lbq2pIP0pZdqnbIFD7ske2NcFhJiwLw+IlOraM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AVWi4F9w; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AVWi4F9w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4UQLYPVso9t4a9DQZaeT8Ww9uQwg+f2Biez9WHuRhUcZ7Z4VfdYaMtYbeMJ6KFHLBt9hcpBnPxZ48YQiEzrcFU5uyrJpZEzYw/jrMXgSuFmRj6YCa4Ho/OP5WDrDHdE8cVo0M65QJ2nXrWbezL1RP3JzlxEMtpvoR0YX6FVej4eZHixS0AejzZA2lJSyYokllDMrHV3B0/Ovw1G9PGQEqG8J67+m6OHWY/uy56nAahvcaSotiUX/2owULA3O/gRg4ZtkGjz0OxboR5nxCNGJoXDJ8wEo2chg+TtfdKODnj9N/Qmp3OJH0pzZ+2X7YUL/JwE28BADULBULFQIkwaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJKeK/2Nh2+QKqoi1N/8RmFJzWmWMMSTZd3hbBqqmdc=;
 b=EvrK7TuAcEO0GNfK6a80nYsCKdLCiPyKFJ57u4G4SxoGoxrJJ05LhbpVgatF0CmF5yBpZZmoa43hgIe6Ps4ORXFjeHbZ06jMQyxpWQUjiuEjbSWboZI1F3NVOlGoMF4o9aVdJenVSD31GRPiOfKYLLATD3H5Tu6gf2JgyDDgxygMPg+WT//Zjrbqe3rLLXliUergDC3rgBly6T0v+iC3vL9yxloOZaTNgn694xBTBDhzV5jcqHY/luU+qroVIdeqVmh5p0NYW+TcD3qYlicAUWje8RMCk3g/FUmxXz8vj/oA/q96MIlq3plKj0IC7kNfv15EtUJ8O/qENKjrXpoLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJKeK/2Nh2+QKqoi1N/8RmFJzWmWMMSTZd3hbBqqmdc=;
 b=AVWi4F9wqi2ryWQmo42ybnlQf/ydj31GWEMXDoGFSUYEA559Qdv8oArukPG8G3gIx7pBH/TMiBplI+GTZWXV3mlgaXzDEVo9LHCHMBEaG7x0hxqXGcCC3XyOTdVzZA2/0d+d5vrOpWD7BrBR6TSn1peA6U7gckl/7+h10QiDZ5g=
Received: from BN9PR03CA0173.namprd03.prod.outlook.com (2603:10b6:408:f4::28)
 by SJ5PPFFA661D690.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 15 May
 2025 22:56:32 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::6e) by BN9PR03CA0173.outlook.office365.com
 (2603:10b6:408:f4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Thu,
 15 May 2025 22:56:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:56:30 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:56:27 -0500
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
Subject: [PATCH v13 26/27] x86/resctrl: Introduce the interface to switch between monitor modes
Date: Thu, 15 May 2025 17:52:11 -0500
Message-ID: <5b5662a8195efdba2254de221f441a700be795b0.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|SJ5PPFFA661D690:EE_
X-MS-Office365-Filtering-Correlation-Id: 40eafd9c-6def-4fa0-e031-08dd9403bb87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?95qr5FjplHObnIGpKOlqqXy0hKelfPs6Op3nVh4hkf5Bm7DoBVf48g+//CTt?=
 =?us-ascii?Q?By2/mW8Wx7OyE6sGYwI20glBY2Ob8ojtwtINyhQ24ZKN+ZQWw38y5ULQqM3G?=
 =?us-ascii?Q?ZV5ShHI6rvb/DymSIvNDbPuv96Rjp/uOGhMZvUw433lp8qdUxvqf/h5YXtdk?=
 =?us-ascii?Q?5+cnRpFT9DhPHRUFW4e5bI0z4GNmZctU8xpwV7vX+NmcxVhQQT1SHvU+KBs7?=
 =?us-ascii?Q?M8nhrcdbDYdPCFKzK+fkCErk0Zg8Upgk9Ve7U+qOS9p/I5OO2bLJaF4cTEN7?=
 =?us-ascii?Q?N928qDWoJMI79rLuQoJoKaGrjj0G8S0/Jrlh76KMbxTno8yrEqaNHB0zbAQh?=
 =?us-ascii?Q?8uCPHrRm0tT8VvrkxWUPkdIy72RDIWViYVY9knnzVA/2Tvunacr+pUxJ6Vyr?=
 =?us-ascii?Q?UBeWsQhq7D/pmSnpSf6TdAgsZI37wXtmhRcSNlNri0hPusWAmEzZwKnnMfo0?=
 =?us-ascii?Q?hGudcACN6lCNkNlODSxaa9u49luocJVGDI+M0mp/N4JHp6CGbXFnVYXuSgBQ?=
 =?us-ascii?Q?MZVILhVIxNwRNKP090bP5ng+7Q3GvmJ8GpKaBaVGeCn7jXdgse/k0OXaxFzI?=
 =?us-ascii?Q?/RMKX09C8jBKVzNXH212XgfHE9CedE8x9jp9IZgZmbC4kaMetUZVBEPV9RrX?=
 =?us-ascii?Q?WeC3raPv5nsbieOgc5yLld5MZ2hYIJw8qjIZ4zHPdKJuec1F4i+e3PXlYbfh?=
 =?us-ascii?Q?FQK0JozFhRDDuyhTKvzyqMF5cyOF4l8qvf/FsTcgXxhVos4+EmfspLg/T/TI?=
 =?us-ascii?Q?YE6plPFyyOB4gTqRy0OSAJjvCrfkaWX65pGtxlQq5DyGEDvAUxwvAO+YsEpj?=
 =?us-ascii?Q?NQFL7TNpjwlXHTkUWIUUG9pbJKz69vO6+b+NkIjrI97AeF5SyRoKXJzZ7hMg?=
 =?us-ascii?Q?sPLvc8BvGMDuiEy5MhgW7JCEf4hFK+tv29/iFmNH5VEL6GFpqw4/KhJCnv4y?=
 =?us-ascii?Q?YP8PFHDjgR/c7BnuYWSwBinTlzzCWbANd1ZkkCnG4Msjk5WaXQfvsKg7xyUB?=
 =?us-ascii?Q?yVOdj5QSbmixgvD/yfSpt2cpTMEQ8rgOJMGxUm6gLqQ5zxlIChLLxMjT/k3X?=
 =?us-ascii?Q?OtpahWoSooqhf5NHkfyiYOvQtUrTBDkt6ITmkCogS1hG0KwmaL0laVTx5fwo?=
 =?us-ascii?Q?n02jvv3mAePk37dPRqyI6+cHGi+t1ALqNJD2KytWez7jbmJAJu90bpEQInek?=
 =?us-ascii?Q?EazefZ233V6S7cU8uwvoSQbqimdExj4pSR/CfaQ/wMbH5602QzbUH9higbzS?=
 =?us-ascii?Q?lusFE3YvpX9AV9R2aqbwcby4bcG+YkFoMXx+NeMqZsWiavjOYBEb49t0imts?=
 =?us-ascii?Q?Tzji0ii3N1UlPuJnZjKgP9SCz+hahvSXEVm4QQ0jUT6c3sjaaxKj8Zg1TpdK?=
 =?us-ascii?Q?KXEXEwv/rieDPd//i6qIMQ4pmEvZGbaHe2BEImkF+jGaWFRriJXJaJHQMuTZ?=
 =?us-ascii?Q?gjXS9t5lE9Q65tyVda1/1SAJYjEDEnLWZ++6xmxP7KNT3FgRzjXXPZB9C2U4?=
 =?us-ascii?Q?2+EKhYW5Wz5QRk0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:56:30.8110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40eafd9c-6def-4fa0-e031-08dd9403bb87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFFA661D690

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
v13: Resolved the conflicts due to FS/ARCH restructure.
     Introduced the new resctrl_init_evt_configuration() to initialize
     the event modes and configuration values.
     Added the call to resctrl_bmec_files_show() hide/show BMEC related
     files.

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
 Documentation/filesystems/resctrl.rst | 25 ++++++++++-
 fs/resctrl/internal.h                 |  3 ++
 fs/resctrl/monitor.c                  | 53 +++++++++++++++++++---
 fs/resctrl/rdtgroup.c                 | 65 ++++++++++++++++++++++++++-
 4 files changed, 138 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index d779554a2f91..7c304821ce93 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
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
 	"num_mbm_cntrs" file. Changing the mode may cause all counters on the
 	resource to reset.
 
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
 	counters. This can result in misleading values or display "Unavailable"
 	if no counter is assigned to the event.
 
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
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index a6069a5dfd49..d5edb28a8df7 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -404,6 +404,9 @@ int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d
 				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
 		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
+void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d);
+void resctrl_init_evt_configuration(struct rdt_resource *r, bool enable);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index b982540ce4e3..bebe83cf48d5 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -911,16 +911,13 @@ int resctrl_mon_resource_init(void)
 
 	l3_mon_evt_init(r);
 
-	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		mbm_total_event.mbm_mode = MBM_MODE_BMEC;
+	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID))
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
-	}
-	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		mbm_local_event.mbm_mode = MBM_MODE_BMEC;
+
+	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID))
 		resctrl_file_fflags_init("mbm_local_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
-	}
 
 	if (resctrl_arch_is_mbm_local_enabled())
 		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
@@ -938,6 +935,8 @@ int resctrl_mon_resource_init(void)
 		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 	}
 
+	resctrl_init_evt_configuration(r, true);
+
 	return 0;
 }
 
@@ -1010,6 +1009,25 @@ static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
 }
 
+void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d)
+{
+	memset(d->cntr_cfg, 0, sizeof(*d->cntr_cfg) * r->mon.num_mbm_cntrs);
+}
+
+/*
+ * Reset all non-architecture states for all the supported RMIDs.
+ */
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
 /*
  * mbm_get_mon_event() - Return the mon_evt entry for the matching evtid.
  */
@@ -1119,6 +1137,29 @@ static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domai
 	return 0;
 }
 
+/*
+ * Initialize the event modes and configuration values.
+ *
+ * total event is set to count all the supported memory transactions.
+ * local event is set to count all the local memory transactions.
+ */
+void resctrl_init_evt_configuration(struct rdt_resource *r, bool enable)
+{
+	if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		mbm_total_event.mbm_mode = MBM_MODE_ASSIGN;
+		mbm_total_event.evt_cfg = MAX_EVT_CONFIG_BITS;
+		mbm_local_event.mbm_mode = MBM_MODE_ASSIGN;
+		mbm_local_event.evt_cfg = READS_TO_LOCAL_MEM |
+					  NON_TEMP_WRITE_TO_LOCAL_MEM |
+					  READS_TO_LOCAL_S_MEM;
+	} else {
+		if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID))
+			mbm_total_event.mbm_mode = MBM_MODE_BMEC;
+		if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID))
+			mbm_local_event.mbm_mode = MBM_MODE_BMEC;
+	}
+}
+
 /*
  * Unassign a hardware counter associated with @evtid from the domain and
  * the group. Unassign the counters from all the domains if @d is NULL else
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index d6bf2a50a105..c76d598e4d23 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1872,6 +1872,68 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
+					     char *buf, size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
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
+
+		/* Initialize event configuration details accordingly */
+		resctrl_init_evt_configuration(r, enable);
+
+		/* Update the visibility of BMEC related files */
+		resctrl_bmec_files_show(r, !enable);
+
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
 static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
 				      struct seq_file *s, void *v)
 {
@@ -2462,9 +2524,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "mbm_assign_mode",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_mbm_assign_mode_show,
+		.write		= resctrl_mbm_assign_mode_write,
 		.fflags		= RFTYPE_MON_INFO | RFTYPE_RES_CACHE,
 	},
 	{
-- 
2.34.1

