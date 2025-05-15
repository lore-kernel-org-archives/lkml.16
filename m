Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BED3298996;
	Thu, 15 May 2025 22:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349692; cv=fail; b=FgMjvzIDBncxVa7Uj+LGbKuljKuaeQo9nGJky3A1ojcQYqbQ9nAcWoW9j6ktHsRmLaWsYOBQWVFkQym+o0SHjePnPi+LDGIstCx9XF4uN3q7sUiFfqiJY5R+oyWpRZ9gLSNjiPvHxbfSgxgZLfAppdaQ8W1Es67Hjc+bvIqAHqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349692; c=relaxed/simple;
	bh=lWL9ozXIEU4adkYROpVZ/JouhefYUAEJa59x+2x5pSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okmdK0LiTkrH0oHwrx1+FbJyVDGHuuA5X4FdUBMjldWIqjOYzI6OYyeGYZjPPGmAlrj30gxCaQayHwwJkGpab6yr1RS+ikznvU6Z5c9IpZEXkfWGGv0qUXOmiyPsYq0d1Dy42xTST1rWNZxXQzD0fJ85ADAIOZ2my+/nVueaERg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YQEzfIrV; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YQEzfIrV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCC5oYeSNN+8NaAB+trvB/esI9X/TxU7bzkeRXzGhGgh5T1yCcGInSeR2K38pH2W0yU9783G1/nvg3pnCQGnhLPTnhSsVvg5g0RLg82/P3tQAYd80tEw75Q164Ft5rEmC536pXa0hWH9xmwSS9HqndQRCdRRs8s+bUUS+NUmbLivchRhh1+X+XWmeDqA9Ev5zmlxFsPP6Ke+bc6ZMSBPquugaHgIW9iDnf7AfKetCE39+IY4swZfqPyQn526be4uG0grKGTUKrkySePqFi/IcfKGqNcLgph0LCW5MFbe6vMrSknTwWVQAKCqWkXkqcNnklU6udMbmn1eon3hl0RFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhEUDIMo2Fu8S0Huk+Ti2RqKqojAuDl/+x5tIa9M4jY=;
 b=Ppoblr9WVWacsFwLJq0WWFizb96MXAxnaJY7eOfroFTQ14ClM2x0RDWHmltMlSUy5S37PwNcbNkIg+ZYegAIaGL6PmIPb+A4v20yboZixH5opvu/zozWnGyYQveZBlT6T/WhLZTS/MKqh3Ln2fak2kibszYM1iYpQfzrmhAa+wec2np4MaatfYdzNh3Cx9Dmy3TKkfQ7NlpmoLu773DKM5ecCa05FKioRHEBudva1rBaoZvsGuJ5cGvpAwWXbuHvEnGNvC6YYINjADQwjXNnzBGrBY329BEvsc5sT+GWSaAA8k8mJXDa0/iB+P3ghyx/5Bsvt3m9CROSj2q5Goxc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhEUDIMo2Fu8S0Huk+Ti2RqKqojAuDl/+x5tIa9M4jY=;
 b=YQEzfIrV5svE3R3Gipd3vdMnU6vy2rUd6CUKLbV7ihiuh/zgcAUs3noFW9NUE1xJbg5bkA1Tlu0VMuvsO3u8Gg9g8UNDZW7iS4YfNjkefLeSEGmeQo/8WpAADeY7zrExkxdt1FfX6VlXK8BxGVZCGgO40uNxUQ28UkD2UVz7JYs=
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 22:54:45 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::c9) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Thu,
 15 May 2025 22:54:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:54:45 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:54:42 -0500
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
Subject: [PATCH v13 15/27] x86/resctrl: Report 'Unassigned' for MBM events in mbm_cntr_assign mode
Date: Thu, 15 May 2025 17:52:00 -0500
Message-ID: <df408cca8a500713b8a7e49ed5a95d9ccc54c48e.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ada5381-b3a2-4a24-2e82-08dd94037ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cldwbeTSwMya7VVX3R5mpZDiUSLC2CXsMgBxN634Sd1hOv18KweNdqxl8wyE?=
 =?us-ascii?Q?cNsx0Rwcv6DDZPSQssDz8m6Y7SvF54QPzCiKZNJk9WHRTFi/keGuu95m2UoN?=
 =?us-ascii?Q?TQXgACcU9iTwosrV4/F+UdKLKpQtd8x5BYhy4oxVqj6vmSexMQTAES7IHq4K?=
 =?us-ascii?Q?iNVi2rwjAUm1MUjdONaDtWcWdc8G55D+RjlAXeJEya4mb1PjnQh/nqoBNbjZ?=
 =?us-ascii?Q?1mUPgIv67/XRXSWm1w3XgZuTXUXOFS1tbzUu2qibBuZuXL99rz2mGVBViPeJ?=
 =?us-ascii?Q?YMaRcQGOX4poTiu7PlsZcQ79uRAsE+RJn4g/ZqulqJsImdIGY7+9lDo/51wJ?=
 =?us-ascii?Q?WLrY7xRZG7KqUmQbnf9MjWnyYPAP8YAy2XZ6Qr6Ews27MdkZrCceco95w+u6?=
 =?us-ascii?Q?yocQRJCJFcXp3vg39b3yXps+8UE6oY2F/azn+bt+0IXjXrmNJHVr92MOjVCz?=
 =?us-ascii?Q?lgLVVdVv3hUCbNaLSEMMRw++RKSbGQN1DjFOtRKrl7jOEsRJCuR3zzk7TCwb?=
 =?us-ascii?Q?OZJzXgCkJ/YxyCIXJ+YvAnTn/ULgDzZNDg231aagLIEQzn/DN+tM4XTCch8U?=
 =?us-ascii?Q?w2yTrd0Ct5F4X+kSvZ+JvcDdNI6X+BUVi2Isb4+JE6S6E+FQcLPaJxYwtTfi?=
 =?us-ascii?Q?KRVAidGiNCocUQznxln47el4Tbs1F61nhgdSOdtSe6vMCYVzt/3Ev8M3Z4EO?=
 =?us-ascii?Q?v9zOSZOMJmAmI02MEsEScyy+E+6weSpVpxlbJz7z6punXEuq9kvQ/RcWE1TM?=
 =?us-ascii?Q?4elvfaLk4tEwWAbiuUdf5QxNIFdpTkMWacEdTZ38GX+TfsvQR1s4wNHtU5sN?=
 =?us-ascii?Q?LTDj4M/nGLUqFgx2DIjlJ8HzdFtAp2KpnkxXt+55+NUJcfLu9Qy4ofo3RcDT?=
 =?us-ascii?Q?2P9Mn2T6mMeVOwozNUxXwx+2KnWP1MC4V6yyUY2uLy/clt16VGXgNlie42gB?=
 =?us-ascii?Q?rHcHgTM/1jblsPCy0a30LztGU0Ibe/oUECeNJZLDJVHKFKiOlXeQus9iGt4S?=
 =?us-ascii?Q?8pWPhdDenz1t8EAJbTufEVrSkClE5UAqhynVw8fRREWZGcA5+B2zsSmllDEZ?=
 =?us-ascii?Q?/HwR3hXUcQVP08Grua2ogBfYhfAc6f+gAyFIO0qXcS/3cWTSu049xADYDD0p?=
 =?us-ascii?Q?EU2kCbqq+Z2DDDBUgtlh0CTaeH6Jncj4Sxx0oomdP5pXopID62ZOjJrbRkXp?=
 =?us-ascii?Q?nM7f1+eIJiEvPKfLcIkQ34FxbbWqMLKWTYgchTscntHArXUq/5nqH6Um6s9a?=
 =?us-ascii?Q?mvEDHnVDT2r4Bipz1sdLY7Pi1ivgeLHgwASl4AA38EOh73XOWxHNt3NhCD8Q?=
 =?us-ascii?Q?sq1XbbYuyFrCw1Wf+tSG+d1u5oztoLdSwQkJxn7DJVZulpBpqH+cTl2qJvXp?=
 =?us-ascii?Q?82p9+O0033HE5F99PcU+ftQD1EgXTlKovEhxvQ5bQBAIii11kzfkV5gyZjcc?=
 =?us-ascii?Q?ePOxZOkGPmpEfSRITHbSZbnVV710bxeLOI9b/nP3aLJHFKc+LZxqIP23qVpy?=
 =?us-ascii?Q?v7hRqNXzCZdVkyLbOPmrCG7EwGSmwURGs7za?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:54:45.6929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ada5381-b3a2-4a24-2e82-08dd94037ce0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081

In mbm_cntr_assign mode, the hardware counter should be assigned to read
the MBM events.

Report 'Unassigned' in case the user attempts to read the event without
assigning a hardware counter.

Export resctrl_is_mbm_event() and mbm_cntr_get() to allow usage from other
functions within fs/resctrl.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Minor commitlog and user doc update.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The monitor.c/rdtgroup.c files have been split between the FS and ARCH directories.

v12: Updated the documentation for more clarity.

v11: Domain can be NULL with SNC support so moved the unassign check in
     rdtgroup_mondata_show().

v10: Moved the code to check the assign state inside mon_event_read().
     Fixed few text comments.

v9: Used is_mbm_event() to check the event type.
    Minor user documentation update.

v8: Used MBM_EVENT_ARRAY_INDEX to get the index for the MBM event.
    Documentation update to make the text generic.

v7: Moved the documentation under "mon_data".
    Updated the text little bit.

v6: Added more explaination in the resctrl.rst
    Added checks to detect "Unassigned" before reading RMID.

v5: New patch.
---
 Documentation/filesystems/resctrl.rst |  8 ++++++++
 fs/resctrl/ctrlmondata.c              | 14 ++++++++++++++
 fs/resctrl/internal.h                 |  2 ++
 fs/resctrl/monitor.c                  |  4 ++--
 fs/resctrl/rdtgroup.c                 |  2 +-
 include/linux/resctrl.h               |  1 +
 6 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 2bfad43aac9c..5cf2d742f04c 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -430,6 +430,14 @@ When monitoring is enabled all MON groups will also contain:
 	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
 	where "YY" is the node number.
 
+	The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters
+	and allows users to assign a counter to mon_hw_id, event pair enabling
+	bandwidth monitoring for as long as the counter remains assigned.
+	The hardware will continue tracking the assigned mon_hw_id until
+	the user manually unassigns it, ensuring that counters are not reset
+	during this period. An MBM event returns 'Unassigned' when the event
+	does not have a hardware counter assigned.
+
 "mon_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the monitor group. On x86 this is the RMID.
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 6ed2dfd4dbbd..f6b8ad24b0b5 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -643,6 +643,18 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 			goto out;
 		}
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
+
+		/*
+		 * Report 'Unassigned' if mbm_cntr_assign mode is enabled and
+		 * counter is unassigned.
+		 */
+		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+		    resctrl_is_mbm_event(evtid) &&
+		    (mbm_cntr_get(r, d, rdtgrp, evtid) < 0)) {
+			rr.err = -ENOENT;
+			goto checkresult;
+		}
+
 		mon_event_read(&rr, r, d, rdtgrp, &d->hdr.cpu_mask, evtid, false);
 	}
 
@@ -652,6 +664,8 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		seq_puts(m, "Error\n");
 	else if (rr.err == -EINVAL)
 		seq_puts(m, "Unavailable\n");
+	else if (rr.err == -ENOENT)
+		seq_puts(m, "Unassigned\n");
 	else
 		seq_printf(m, "%llu\n", rr.val);
 
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 64ddc107fcab..0dfd2efe68fc 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -381,6 +381,8 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index fbc938bd3b23..c98a61bde179 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -956,8 +956,8 @@ static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d
  * mbm_cntr_get() - Return the cntr_id for the matching evtid and rdtgrp in
  *		    cntr_cfg array.
  */
-static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
-			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
 {
 	int cntr_id;
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index f192b2736a77..72317a5adee2 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -127,7 +127,7 @@ static bool resctrl_is_mbm_enabled(void)
 		resctrl_arch_is_mbm_local_enabled());
 }
 
-static bool resctrl_is_mbm_event(int e)
+bool resctrl_is_mbm_event(int e)
 {
 	return (e >= QOS_L3_MBM_TOTAL_EVENT_ID &&
 		e <= QOS_L3_MBM_LOCAL_EVENT_ID);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 59a4fe60ab46..f78b6064230c 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -441,6 +441,7 @@ static inline u32 resctrl_get_config_index(u32 closid,
 	}
 }
 
+bool resctrl_is_mbm_event(int e);
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
 
-- 
2.34.1

