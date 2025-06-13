Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A127147F;
	Fri, 13 Jun 2025 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848986; cv=fail; b=gZRPG8+vSElBRDcUwYjx46pnZsGhTwuKhxkRYUMvG4LbCzqEj7KuLLa9SuHLi6r7Jqp5PblxTiSCBn0shnyZDJnLHjgUcZeb2w6khZMFwsHg2No/QSsVPYCiYAK9b0JCieJJO0nGvahmNaUJGw7yLRcnOyRCzCsoq5DwigOJqcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848986; c=relaxed/simple;
	bh=nrBkMSeQ4hyt1PJq065LLRj5W7kEqUMIQ1S5AtBQ5IA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dSxszZK0xcAeZIFeuzrG7Jd4g1k96DNv8Y7rCTuRRpqUMNIY4aaaAJTY7G55lUUGD8YmjhMnv1niOX3idmXQG6o3Ib5CZob/x5xsaoMusXce9egNf1gIZhpcSiz1QmpE+BYfRArZ4cPeDvEO44LVW8u2YJ8Q7Dy1gBszX1VthUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OFxdh/1d; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OFxdh/1d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDLadXnUuyuDILvROND5iYozNDIITJhj3gzl4mSLp5MEojf6hxycPpv18HVakx3B9w9Ol76TI0OtB8OtalXoUVtati6Fvudytvyre3USQNCgtMJS4uSiYK/gJ0ROYq1BaVnX88W8Irzv9mydH+YyalcDQWWUVmQbIG1Sv2YdHUM3Yq85RA45bbyvIgpZY5W+9meqiizSVbpJj7hmzWFwDo0cLU2c0w9BLwt6YXIhy+uJWYkM0B5B1NIXZD6yiCwDO1Y+I1wt0GIJbmhxkl6ueDC8UiFWMDIPMI/OMWFn8A0ZSAYgTtGUqcne4j929I/yRvGy3iHkQfPDZ6oib0mEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kz44dNhKh/wmGOH1zi7G3iYeWVetAV8n4l7deteM4rg=;
 b=bnQfNBEIjJEq4jH2JPSocYqLXPeOnNF8RP2cRvdlS5lglmrAjNB/YoES6rDjkJdEMLtQqJHmEcRZjsaKHK6vDkWsWlvg42El1JrvvT54+5jUoV6LEM2e4QDZ36piyhN3kDAvXYjj9s0v8/WR3pdPTOaMM1VGMYQT+I2WhIpvzAE7LhbDbinmJbpfct9RtGUJrVRXuxhxDWHeVxOVhNQpSobF2LQhkpJ6j7jBErN3LD5gAjay7ZgQdf6mBEOdfz4vBV906PNdn7gmti8DBG06adPjUXWhloYAu9WcxzND40EaNwN48u6BAraJdEBrORoDOAYEWolyYJ5I3Y+Hf7d3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz44dNhKh/wmGOH1zi7G3iYeWVetAV8n4l7deteM4rg=;
 b=OFxdh/1dR6PaI84RybgJpRHWRTqHOaG4qZe6+pLx9lfmXmbOwBkokz+TXczMmqjAMmaYJPoL86+M61Yoq6Mnevup03VT1eLO8KoeDdeJpgFr2xtCRlaHZdYUd0PcjgxHDN710Kb58+uAJhgzrksyqTBrK3kEx4KgoLXkJMUG9iQ=
Received: from CY5PR17CA0033.namprd17.prod.outlook.com (2603:10b6:930:12::8)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:09:38 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::96) by CY5PR17CA0033.outlook.office365.com
 (2603:10b6:930:12::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:09:38 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:09:36 -0500
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
Subject: [PATCH v14 31/32] fs/resctrl: Introduce the interface to switch between monitor modes
Date: Fri, 13 Jun 2025 16:05:15 -0500
Message-ID: <dada02bec2f7ea2fa316f892560c07e0bc45df41.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: a483bf21-9580-4c58-47d4-08ddaabe9b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DVX2jJapq9Hq+qYhfjmsutY6pbVATmkfz3Pzn3cNeppJb7XImX5hBLd96na7?=
 =?us-ascii?Q?5GB19XjKvaGDSX0pIsydJKGoAbl/7wtljGtOoLI9hft1+txGVjTpzfI4AIaz?=
 =?us-ascii?Q?Du7bjvXzE8v76TaHxY28jXl1bn9AW8fJPn2RhhV5oVb41HBPIgRshbTACTTG?=
 =?us-ascii?Q?R1axG32NjXaF+H4315SSiHEtpQQZyRSYEHBIeE1mqpDr0oUb3p0tU5qWHNWT?=
 =?us-ascii?Q?ia/6b+fbEOTDbUowbNPw+0o0eRYP1tThn6LzTSmqjPBbwfNkfGAgkVP72Z0V?=
 =?us-ascii?Q?PBzjugI0KQiqNTLQxZtni0Pv6NyISzDXIjzJ2Rl1xrvuhxGyN6TaWg3jwTj/?=
 =?us-ascii?Q?GBO5UIelJ30smXsJPkHe24SEKrXmPexhb+pri0zzfHBFmmTvnZI+MZ9xTeMm?=
 =?us-ascii?Q?JepIaH9PEsAcIN834lkHfBP1oqNw8rHIpsrGUkAl8a+gd/s0IHMqz7k5Je3f?=
 =?us-ascii?Q?2bxF5Bm1bHjYPw9nchDWl/vZ8UkdR2FxehwGJiciCfZxdPq9HzStipA/bKBK?=
 =?us-ascii?Q?DRyi27DO5Q4B9na1RC2Vu14N9ClQKVSSAOnwa7IRoMFZwoZenkxk4K14zfvQ?=
 =?us-ascii?Q?VNQLQSrxgHzDTon1v1MTiCOm4FAkkCvKoKtuFpHNh+j1r7nsE2H2T17JdYiB?=
 =?us-ascii?Q?MnC4nB1hEuuJh7cabh1X7z2HAlLCDuMHPHWO9SYpKxJYtyfpTZqFAmKt88sZ?=
 =?us-ascii?Q?zImfryn72MYrdQ6z9mUYBYr9QWnCbDaPvVdfLzImiBP6bk+2ZtMIY58lINHN?=
 =?us-ascii?Q?4fUA3gtgXwQHorzXJ9LOwWbxdFSUftw6FSwk5h8QQsWf1lmom7q0ibzx96F6?=
 =?us-ascii?Q?/3MeWKPh2rjgLcfvtThD3dEzJYgkdgxsYYyUuMV86ruYODW9w3sY3/4H+eEy?=
 =?us-ascii?Q?dZwV7RY6oDTqWIlOhWBxD5ZUe1tD78OcJcOZ4RwHNfHuEpmrXk2TgirmGj9Q?=
 =?us-ascii?Q?mCLZfR5K2D8tgjx/JKRzBLhqt4fFNjqZs11mDO+9YRjHrEVvhCxnB8TK5QyL?=
 =?us-ascii?Q?+TVyLVin5Q+DDi6O3KQ9mrqaGWVFjmZim0FFzYp8tCO4Kqkor/m04stadwsz?=
 =?us-ascii?Q?eQTdAOKIq1I3MJsDO03YPmbcB4AhiQ0ojV7FymhtbrXIpfAev/DSJcroZV9c?=
 =?us-ascii?Q?49QFxZsVNcBfOvftt2zu4P+q/kc5PRVxRrUtJPK/+m0GqtVbXbBWZL3Z1Yk5?=
 =?us-ascii?Q?SsqvBxS3Z4ZVt6PxKiVZu0JqRtj5nKu5htjn5cqYCt8GcbBtmv3iJxwFobHO?=
 =?us-ascii?Q?EeIWMJiOAId2f+bd1esDYGHtKW3y3y8SaweKNQ8aqqo1SdQ7N1dIJNlUZfkY?=
 =?us-ascii?Q?ngACOFWp1Yrzbph9FZ2U2m4nfuGtqrzMLpx0cYlaCKMub3l4sWXrYzlYetvP?=
 =?us-ascii?Q?EwIEKhos2qKzseY0FlqoPCJPmPjMfw44D75VDBijiAl60lagPvZRbhKfDCpU?=
 =?us-ascii?Q?DsSGN2qpDIfXWRt+Vm9dY8f3z1LSA31THgjiCYTvxNPE+RiDjSz15jFxdPOG?=
 =?us-ascii?Q?vLzRvj7f2hC+jhWBMX4oBNz8ANY77lnyDNTH9vKF79jyiBfTpyD7I24HkeQo?=
 =?us-ascii?Q?dDUDtxv9KlUu6jGlPU4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:09:38.3136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a483bf21-9580-4c58-47d4-08ddaabe9b66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980

Resctrl subsystem can support two monitoring modes, "mbm_event" or
"default". In mbm_event mode, monitoring event can only accumulate data
while it is backed by a hardware counter. In "default" mode, resctrl
assumes there is a hardware counter for each event within every CTRL_MON
and MON group.

Introduce interface to switch between mbm_event and default modes.

Example:
To list the MBM monitor modes supported:
$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
[mbm_event]
default

To enable the "mbm_event" monitoring mode:
$ echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

To enable the "default" monitoring mode:
$ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

MBM event counters are automatically reset as part of changing the mode.
Clear both architectural and non-architectural event states to prevent
overflow conditions during the next event read. Also clear assignable
counter configuration on all the domains.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the changelog to reflect the change in monitor mode naming.
     Added the call resctrl_bmec_files_show() to enable/disable files
     related to BMEC.
     Added resctrl_set_mon_evt_cfg() to reset event configuration values
     when mode is changes.

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
 Documentation/filesystems/resctrl.rst | 23 +++++++-
 fs/resctrl/internal.h                 |  2 +
 fs/resctrl/monitor.c                  | 27 ++++++++++
 fs/resctrl/rdtgroup.c                 | 78 +++++++++++++++++++++++++--
 4 files changed, 126 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index cd82c2966ed7..7e62c7fdcefa 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -259,7 +259,9 @@ with the following files:
 
 "mbm_assign_mode":
 	The supported monitoring modes. The enclosed brackets indicate which mode
-	is enabled.
+	is enabled. The MBM events (mbm_total_bytes and/or mbm_local_bytes) associated
+	with counters may reset when "mbm_assign_mode" is changed.
+
 	::
 
 	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
@@ -279,6 +281,15 @@ with the following files:
 	of counters available is described in the "num_mbm_cntrs" file. Changing the
 	mode may cause all counters on the resource to reset.
 
+	Moving to mbm_event mode require users to assign the counters to the events.
+	Otherwise, the MBM event counters will return 'Unassigned' when read.
+
+	The mode is beneficial for AMD platforms that support more CTRL_MON
+	and MON groups than available hardware counters. By default, this
+	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
+	Monitoring Counters) capability, ensuring counters remain assigned even
+	when the corresponding RMID is not actively used by any processor.
+
 	"default":
 
 	In default mode, resctrl assumes there is a hardware counter for each
@@ -288,6 +299,16 @@ with the following files:
 	result in misleading values or display "Unavailable" if no counter is assigned
 	to the event.
 
+	* To enable "mbm_event" monitoring mode:
+	  ::
+
+	    # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+
+	* To enable "default" monitoring mode:
+	  ::
+
+	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+
 "num_mbm_cntrs":
 	The maximum number of counter IDs (total of available and assigned counters)
 	in each domain when the system supports mbm_event mode.
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 14d99c723ea5..adc9ff3efdfd 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -414,6 +414,8 @@ void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *
 				 struct rdtgroup *rdtgrp, struct mon_evt *mevt);
 int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
 		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
+void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 618c94cd1ad8..504b869570e6 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1045,6 +1045,33 @@ static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
 	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
 }
 
+/**
+ * mbm_cntr_free_all() - Clear all the counter ID configuration details in the
+ *			 domain @d. Called when mbm_assign_mode is changed.
+ */
+void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d)
+{
+	memset(d->cntr_cfg, 0, sizeof(*d->cntr_cfg) * r->mon.num_mbm_cntrs);
+}
+
+/**
+ * resctrl_reset_rmid_all() - Reset all non-architecture states for all the
+ *			      supported RMIDs.
+ */
+void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+	enum resctrl_event_id evt;
+	int idx;
+
+	for_each_mbm_event_id(evt) {
+		if (!resctrl_is_mon_event_enabled(evt))
+			continue;
+		idx = MBM_STATE_IDX(evt);
+		memset(d->mbm_states[idx], 0, sizeof(struct mbm_state) * idx_limit);
+	}
+}
+
 /**
  * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
  * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 8c67e0897f25..6bb61fcf8673 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1876,6 +1876,77 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
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
+	} else if (!strcmp(buf, "mbm_event")) {
+		if (r->mon.mbm_cntr_assignable) {
+			enable = 1;
+		} else {
+			ret = -EINVAL;
+			rdt_last_cmd_puts("mbm_event mode is not supported\n");
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
+		/* Update the visibility of BMEC related files */
+		resctrl_bmec_files_show(r, !enable);
+
+		/*
+		 * Initialize the default memory transaction values for
+		 * total and local events.
+		 */
+		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+			resctrl_set_mon_evt_cfg(QOS_L3_MBM_TOTAL_EVENT_ID,
+						MAX_EVT_CONFIG_BITS);
+		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
+			resctrl_set_mon_evt_cfg(QOS_L3_MBM_LOCAL_EVENT_ID,
+						READS_TO_LOCAL_MEM |
+						READS_TO_LOCAL_S_MEM |
+						NON_TEMP_WRITE_TO_LOCAL_MEM);
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
@@ -2203,8 +2274,8 @@ static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgr
 	struct mon_evt *mevt;
 	int assign_state;
 	char domain[10];
+	int ret = 0;
 	bool found;
-	int ret;
 
 	mevt = mbm_get_mon_event_by_name(r, event);
 	if (!mevt) {
@@ -2249,7 +2320,7 @@ static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgr
 
 	switch (assign_state) {
 	case ASSIGN_NONE:
-		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
+		resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
 		break;
 	case ASSIGN_EXCLUSIVE:
 		ret = resctrl_assign_cntr_event(r, d, rdtgrp, mevt);
@@ -2463,9 +2534,10 @@ static struct rftype res_common_files[] = {
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

