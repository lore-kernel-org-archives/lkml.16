Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9135271A6D;
	Fri, 13 Jun 2025 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848896; cv=fail; b=FcTirIkHxH8auf7RbvGcHSvPs1B+RMzdgQ7UJADYESCnk5AefMt2TUzx2UOYkN9/8Pfv+EDk6k97EK1I7U54ppxzbVfjKTZ9yHp6SE4g2lpUYO3gBpu9EHpE5X8OcbGYm1vfAW9qEzFNjikyw629QMiAggaYPnrkfDOyyHb9hns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848896; c=relaxed/simple;
	bh=bEbPD4HbpkAAXGXsnK8HLzHbmqod0mT+KOgthaslrbE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bcQEOH5kAiAK4JGWr8sIIOxHtCqcpHJ3oXt04hKKTn61o1lFmm7c1B6TbGy+mFlfyA20cguLI8O9eQVyClgeP1k2zIfYf1w34fNmRXbjeEtPmFv/IzvZ1altApM3vyQujNTXZAJ37Vab2kX+p9vekNLPGVq0kFlRsKckJIzP0uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KY4p14nU; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KY4p14nU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNrkv/Zn6tCaSaVuHw00KAoswRzw1VgkdQsqLEA8xEfRSPTJZ6E5qYH7tRp4qMh9Uf2K9juEQ8OjyDUW9SlPNBE9hil1CkKz6iRUh6P9Ju22M/7qcRvwg/6JQoRKYtNArC6/wHByXpMN4iHLTZJYGqd7Qwz53OrzovHEN5K0KjkorW0cBlFtirVGU3/HKcre0XeRQ+4z0DNvZzdHr9VxScId0f3LoKd7Bjr65WgnUqKJNNrSv+6Pz09GnkTSE3OOGfDBqS+ANQF2j5rxu+F4gLnHLpXhOX4gOkmX/XbyVWG8stYDu76GvH7knLEs7kQ22GUJDhjHoz3ubl8I/9BH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNI8Ek9UAAqS/mxlyZuNiXzPHkNZdAZKtMMVBQ9qLrc=;
 b=U0lh/qHpy2+cHw7K12eWyHOfM5wrd17igdvkZMeHwyrI7dA9wq/egQYvBDKSO2fRodYiR82ZyYuON4jyIBR3MwDIzx80QoRV6E6YHdU31Wnus95MB7TP7zyZgRBpsJxR0pxkG+zcHApmGX2goGKwoRy6MVTIvfzVHF9wIruH8eieuQR4IADUfHTcmbpNsvrq6lsU9vyVgNzrte7skWSXn5nJc+vqkcZzG6OI4yDCLpl/yuOYaJQh2R4RpwTjCLhpg+/9Wy3Q3kdkUFgCiBKcXpY2B0Jp+EtXjD0XtzafQZrnGhegFXKBWcwk2MxeWl1JqJjF8wbMM8IQT3p1GE6Y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNI8Ek9UAAqS/mxlyZuNiXzPHkNZdAZKtMMVBQ9qLrc=;
 b=KY4p14nUZJoFXYoBhQ8FqQtfmgLd0pE7zhPjo7HZToxFH/g9vmgVLcwXvpcsjiJ+gtacIAE2HgOGJPAtLxipgTR5L1XLLzrYHBERYx8wMbCwC45Ct84IbX65sJFzUXS+IgM4bR+gl2yBh2LIm04+hllOpQjE8F9CYp41ebz5Fkw=
Received: from PH8PR21CA0004.namprd21.prod.outlook.com (2603:10b6:510:2ce::11)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:08:12 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::b2) by PH8PR21CA0004.outlook.office365.com
 (2603:10b6:510:2ce::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:08:11 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:09 -0500
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
Subject: [PATCH v14 20/32] fs/resctrl: Report 'Unassigned' for MBM events in mbm_event mode
Date: Fri, 13 Jun 2025 16:05:04 -0500
Message-ID: <794cd45701dd52f0a7c3ebda305ff980e761ba35.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0e1e65-a805-4621-2b72-08ddaabe67e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MY5Eo0kIXwEgWA4+ydst/uKBttOR2B7CJ6H9epk+y90+kj/cPcclrjmhknMm?=
 =?us-ascii?Q?AJFLsWD77lSifB9enZdNbm9ToPe6kFF4zgZ6nTaqyk5YRdi8DtuW2xXOi+3U?=
 =?us-ascii?Q?oZl2v0mglQ931VS7mBcApf8VxvDVKe7KFr4Sj9sPH0nGPSa6bltagiHz0iuc?=
 =?us-ascii?Q?aGyIKskF8a8pJtCUCRl8NOqagztLiBfBsSJv6/Pmu3TSZVDAPEmTBY16ZSLT?=
 =?us-ascii?Q?vle3Yp1OUpZOJxU2F2XrP+jZuNaJpeVDXwdz4LfVv8lA5uxQFYs1mT83dzCO?=
 =?us-ascii?Q?tRDHthEo2zhanp4Nil0d8b+BgWCmHxVPHqDyKcNYgyPDDzNGonzQ20FqQ0h5?=
 =?us-ascii?Q?cQB5ikT+w5qNTUN3eL9awlwgDVIBj1I3w6shvD748nBjU+WPSFwEYe+bmFB6?=
 =?us-ascii?Q?KX/z3PwRn+0JFe7g3stlD/XQdZ2PRU6oa8Z4MudefYnndgMdZsFaXLUqfI+O?=
 =?us-ascii?Q?fGKvqDHv/qVmriXNQw9Tc2UrI1eaXFVHtmHd+QM3p7m5my8IhEHD7C2GORbs?=
 =?us-ascii?Q?mdb1wVLIat5NSVKBMCEx8niGuGVqD+pk7CDHpE8ZGnn50iJWt40bv35jd5Hk?=
 =?us-ascii?Q?4Xkwzptz3BIqj6vIsL0sUofPfGUPvDE1XW4ZiopFJ+Lzuo9uerQOj3mUpcmS?=
 =?us-ascii?Q?3GxMNtrugJuriF455C0MoHGm4iCyT3NpjhFRj935M1PbStVAQkVqb7oMbkYi?=
 =?us-ascii?Q?5Zu62hR/SjkD6CQWl1MwhOOUIyKg3GYv+QOZsxXlj4/DFOkLjGsF9RcYKlxW?=
 =?us-ascii?Q?NDWPmJ+/YlUT4uk7XzrYoUaGM/wka7ZVtWt4EVKqdb7bVI4aKW7P4tLb/9Mu?=
 =?us-ascii?Q?Kiu31MaviLY9sUom+vmnORidU0SDPT5lmcJb1r8p7K/YaXOj37ADOOmPrMhK?=
 =?us-ascii?Q?rYLpRDrku4xYi0jkyxNczoNsEABD/iuBxWPdrp///T1tu+opOeTuCoXvrzoW?=
 =?us-ascii?Q?huNJDPiFxgujn7hpPoFyIfftejG+PHnhNJZIyNgwrgS9l4mP15D3ECHoFWxA?=
 =?us-ascii?Q?yrrNx95xl/YNZMp7QzZpGdcoy0F19DKf7y+9TLzBI3otwbSCiF/OzNrZN+VQ?=
 =?us-ascii?Q?Rs4of1CsqQ2BVlkhX+7LVB7u4otK273yljFio2rnzxEFELpYM1ehi8Vv1scq?=
 =?us-ascii?Q?Khuu4pprxB3agoh1KKPUx3uI+RsDbpz9OKiwvX/aC8yv7rDbsnq7wdRTYHcJ?=
 =?us-ascii?Q?RRgq+Wdn6P3BYIrTTWOWCNDOoHYZR+wew7a1OVut+bghS1yjseQMvFbYc1xu?=
 =?us-ascii?Q?gFE7o4/My6OqjMFpo+AeKd4/ECsSXov3AwGwax+ZnO5DJl+1hEubG85K4nfI?=
 =?us-ascii?Q?aJci/07beSrd1kxf5WM18z8Lv9ang3w7pZvpQ/8w5XLHp7B+1PwmNrBQYCUT?=
 =?us-ascii?Q?HCP2aFBGWXfo05XWoN6PzUUFq+VAVY40Bty/ePRu2Gsb/6XqZH257VE2Pk4h?=
 =?us-ascii?Q?/oA8F8OYCuw5qCqEkjUZGunOmob2G3UDn5qRzmwEzT3CbSxYKbrCOI5df3c+?=
 =?us-ascii?Q?Z8Y1u2Uq5CoUc5tx5fcRV8OpRr4Ab+McojtM9nBX14PpKoCTJK7+g0LV9w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:08:11.8892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0e1e65-a805-4621-2b72-08ddaabe67e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265

When "mbm_event" mode is enabled, a hardware counter must be assigned to
read the event.

Report 'Unassigned' in case the user attempts to read the event without
assigning a hardware counter.

Export mbm_cntr_get() to allow usage from other functions within
fs/resctrl.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the changelog.
     Added the code comment for "-ENOENT" when counter is read without assignement.
     Removed the references to resctrl_is_mbm_event().

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
 fs/resctrl/ctrlmondata.c              | 19 ++++++++++++++++++-
 fs/resctrl/internal.h                 |  2 ++
 fs/resctrl/monitor.c                  |  4 ++--
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 8a2050098091..18de335e1ff8 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -434,6 +434,14 @@ When monitoring is enabled all MON groups will also contain:
 	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
 	where "YY" is the node number.
 
+	The "mbm_event" mode offers "num_mbm_cntrs" number of counters and
+	allows users to assign counter IDs to mon_hw_id, event pairs enabling
+	bandwidth monitoring for as long as the counter remains assigned. The
+	hardware will continue tracking the assigned mon_hw_id until the user
+	manually unassigns it, ensuring that event data is not reset during this
+	period. An MBM event returns 'Unassigned' when the event does not have
+	a hardware counter assigned.
+
 "mon_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the monitor group. On x86 this is the RMID.
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index ad7ffc6acf13..8a182f506877 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -648,15 +648,32 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 			goto out;
 		}
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
+
+		/*
+		 * Report 'Unassigned' if "mbm_event" mode is enabled and counter
+		 * is unassigned.
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
 
 checkresult:
-
+	/*
+	 * -ENOENT is a special case, set only when "mbm_event" mode is enabled
+	 * and no counter has been assigned.
+	 */
 	if (rr.err == -EIO)
 		seq_puts(m, "Error\n");
 	else if (rr.err == -EINVAL)
 		seq_puts(m, "Unavailable\n");
+	else if (rr.err == -ENOENT)
+		seq_puts(m, "Unassigned\n");
 	else
 		seq_printf(m, "%llu\n", rr.val);
 
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4496c359ac22..4a7130018aa1 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -390,6 +390,8 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, struct mon_evt *mevt);
 void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 				 struct rdtgroup *rdtgrp, struct mon_evt *mevt);
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f2636aea6545..cf7f6a22ea51 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -977,8 +977,8 @@ static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d
  * Return:
  * Valid counter ID on success, or -ENOENT on failure.
  */
-static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
-			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
 {
 	int cntr_id;
 
-- 
2.34.1

