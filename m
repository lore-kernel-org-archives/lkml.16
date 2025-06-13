Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2835273D9D;
	Fri, 13 Jun 2025 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848884; cv=fail; b=gFQCTvPsSpGkDpISJbdzJT/HYtiVq8AMR/WWFGg/cnE4NLVQocWjZ+oaneLo5au7Wss/I12AinyyZr4cfUDWq/fDlygzALKijagmbHawHpNJy1DJ7x5f4Y2ZDgxFo9WZ9KrshFAhNzbeosSLvEkyJZLPAS+bS4Sf5IiBweK372w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848884; c=relaxed/simple;
	bh=CFZZ4Y+8y9Mcy7qyY1/na5fg+RZlOVl3ebT+KDT05iI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IXkWY44P1t3+dvH7w471IkMW33Z5yzoeUjRMN+M2Q7rsnnonAXvOUHVQFZmVl8KsGP8Iyk+sS4ITGQIceRU98V/3pDorv0kLL5eEwyr4Zp4pNOP8+LFxUfrIY0IsApLpL0YcGwhnj78ldSDAYeuCMCd7Kn1N7ebuaAI1oOvqdg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ld8bm178; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ld8bm178"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUsntiNDogxfuumL5MZqNdarV7wVI5BPLk7JkJgREAKaM02BbBxH+AvGNcjsLyWzJm/PAIuxrKNuu7Ps1Pamthlh3u5Ceo2cbjb74VE5PyLXa2E+PahS5ctfmw9lP/HI7U9FNI/+uMchcNWVOXCYcPke4MDiAehD+BjhGWjdACpLjqs3Xo5YHtqOxNzZjLSzSqotgssgpQffyrdW98uWqjRJyu0Fp3jHYhELcIEr79zjiZkyH9vJ6l+ORX5IOTBvueCKTYlj5UYO9oldLNtozFKftz2aMKmRaumisO+fVi2xDvNONj0466rAobrD7EqrODHCufJgEfd1poybhH07jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXYD/H8mcF6+k5rhW9/p4qVdw+xoTCeG5UTEQ7KLbS0=;
 b=V8zpqhnat3GyLIv53k8rUSAlmh/l0Cj9rO1OA4QMSRAiA4PxPaxmVUFXFOV82Lj7pGhgUKQT/OG8MahvbNh45qbeDnm6ya8L7s6GqY3i90skwRGnUHPa2euPU5fSmPmf6EkzAH61qUoNWcyn/g8bVfpp3wzpRSRuD1/1BUie7+u9ggCzLTJlE5fMn97eVKK+gZ3UVriHZ4wvggA0fV4qhSootszknf9t27SFpN6nAlsKU68fsaYtX8WgBr8ErdvPhxaqzlO/6jsQOLjSswzqtN+LCd3kgn7IHDGCnGF8A5PzOy7CyfvQJ4jxwaO6Rsr7Q4FAlgsOy+cv8/IbZ4g4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXYD/H8mcF6+k5rhW9/p4qVdw+xoTCeG5UTEQ7KLbS0=;
 b=ld8bm178nbl9BVUlxTzz9tcMtbRpwnreCGhMzIOg2VCBKivYWatFdlQ9RXHDolmKPm6f1RoVt1m+VO38BeUh2SDVxiOT3V17NslL9ZLrq8zBzWqlvT8oFjGZa/B9QasQWRsH92QqIpqIU+NKGBHiaoRiYTB8YfOc6Gc/+a2lTUQ=
Received: from DM6PR05CA0058.namprd05.prod.outlook.com (2603:10b6:5:335::27)
 by DS0PR12MB8320.namprd12.prod.outlook.com (2603:10b6:8:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 21:07:55 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com (2603:10b6:5:335::4)
 by DM6PR05CA0058.outlook.office365.com (2603:10b6:5:335::27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19
 via Frontend Transport; Fri, 13 Jun 2025 21:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:55 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:07:53 -0500
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
Subject: [PATCH v14 18/32] fs/resctrl: Add the functionality to assign MBM events
Date: Fri, 13 Jun 2025 16:05:02 -0500
Message-ID: <eea2cfb5b6231b322ab2194abfcd1ce335e2bdf5.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DS0PR12MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 6559eaef-62cc-4102-e651-08ddaabe5e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u516bxvRaVg8lcZJ1wL28QEDmlHwVgYpkyMW6bqKC0ryrG48Yj64qIRaq2aQ?=
 =?us-ascii?Q?f2XLnD4OteG0zdLG7IvmwNj1CRsxB1/w6SxpWBQJGjEOFBkoxZpJP7kHb9f3?=
 =?us-ascii?Q?IQlgAd+MnxRisMWw/eb72UOlFXdt1Q8cimy3o/81tvHtaNY00x88iFS32vXZ?=
 =?us-ascii?Q?ronh7nUrzwy7t8uqbATtuQ18sHQium31oOPkzlq6xIVTECUztcnOMEqxuLl0?=
 =?us-ascii?Q?I/kih+aYYj3EH79pyymIi3YjXxhgj4x4CIwgFqGscnTfAczu3/HvHkZe4645?=
 =?us-ascii?Q?7F1gGmKbLXE1kNukYl0oZ1+F3hONrWOtOpCk5UWXwSipluwHTwAapjYETBZh?=
 =?us-ascii?Q?YtcjnoCYrCpkCoaUWmhff3wvUsnQt7Nd5paSMnUlV+BvmWkm7wlAbFh4QP3C?=
 =?us-ascii?Q?UsM9WyfmNjGcK5ioDX00tLfkNMu72aZanTuz/O6yf7A5R1JIAX8o0O2iO3Np?=
 =?us-ascii?Q?xJ5s1mxD0RriaylrJXNH2HMmdKxeqBGtD+F63F7i0OsCd50HOrEFMd9+75Vw?=
 =?us-ascii?Q?IZJLWYusTieIEYg8QZIHTbJ72T7wPFs/EiP70ALSgscB+ndE5DyMyf4oiiO+?=
 =?us-ascii?Q?J+F1X9O7Y8uioXHjKjknHFLCWLNdIbcSqoeAGXifhzS7sEW8CBwZZta4W19g?=
 =?us-ascii?Q?nuaUs7vD4VkheX8Szcj30vtKhO8knsjkK8PM41g14RkB8aLqIebVHpnVoZWN?=
 =?us-ascii?Q?/343PEXDN85sb5NXDqLNpn3Yy4r+BboBav0ZNgNg3ZK5F2d7y6AvlIfBbC/2?=
 =?us-ascii?Q?b5d9bkLFTKs2L08/mZo2QZeDrxC/V7aRqmvnqbs1txbIPSlmM2R7EcGSlCzP?=
 =?us-ascii?Q?7RBrEtnnCwDsc2tis4nq+D7fauIz3Z8fabDuiO9eyUFKX4i7KYkj2kHG3Duw?=
 =?us-ascii?Q?OJRutHoKKfivEL4tdKRWORh/miL4GOCt/Hwy8p/W+46xr/DL35xnMdeKvOZZ?=
 =?us-ascii?Q?4QDHPLvgxm4a1SEfNGnluid5b4OIropolbBzNAsPOxcGdrtgBQ4vzYjub1Sj?=
 =?us-ascii?Q?ohH8B4lck45oCof/5s9KUo9FjySmaaV+vo1pPE47CbbYgA9cru1GA6pSUAVT?=
 =?us-ascii?Q?0OKcF3pwBjOgchiB22gly3VAiEdJqB7U6rj0nq6Q0c+ZS22+qi+aoMrQVxgP?=
 =?us-ascii?Q?HluiakLURU3OKwAKWNixNLHIuuk4QQWy3eUn4gpoUj1WGFmivT1gyOssLXGs?=
 =?us-ascii?Q?cqCgQF4f/8/UYzQLGH5tWyDxBtsAfBSChHFbNiiMgmI3h4qm6Au42uPfsvq/?=
 =?us-ascii?Q?kZ8Eeqltdnbv2OhmITU+rj4ihKdHLFoMe7tEXcSnj9mf8BMTsVfpSGcrHAMN?=
 =?us-ascii?Q?JJFEK/0VIcFhauS/7fWMlafAcz7L+1JdaVtujdxvWv4/JUVaxlUgD7gARMVW?=
 =?us-ascii?Q?Zq+db+R6Q6vJBglB9uNTrOsBUY7E28jIsRpJvT3VxsbQwoITgq4zwrCwPmNV?=
 =?us-ascii?Q?/WlUGFygnAQ1t+szB3lVJzXcgpsGnhSRRgujtCOgKleh+U4f5GwvsdIj0pDm?=
 =?us-ascii?Q?j2tqzYtwYA27vM80200wNaHxEHFimsdhvfotLS9G9/4yUcAireGMdhKXo5Mv?=
 =?us-ascii?Q?0OJHlPrXNb1fTr72szo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:55.5328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6559eaef-62cc-4102-e651-08ddaabe5e22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8320

When supported "mbm_event" mode offers "num_mbm_cntrs" number of counters
that can be assigned to RMID, event pairs and monitor bandwidth usage as
long as it is assigned.

Add the functionality to allocate and assign a counter ID to an RMID, event
pair in the domain.

If all the counters are in use, kernel will log the error message "Unable
to allocate counter in domain" in /sys/fs/resctrl/info/last_cmd_status
when a new assignment is requested. Exit on the first failure when
assigning counters across all the domains.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the changelog little bit.
     Updated the code documentation for mbm_cntr_alloc() and  mbm_cntr_get().
     Passed struct mon_evt to resctrl_assign_cntr_event() that way to avoid
     back and forth calls to get event details.
     Updated the code documentation about the failure when counters are exhasted.
     Changed subject line to fs/resctrl.

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
index 71059c2cda16..0767a1c46f26 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -386,6 +386,9 @@ bool closid_allocated(unsigned int closid);
 
 int resctrl_find_cleanest_closid(void);
 
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, struct mon_evt *mevt);
+
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 3e1a8239b0d3..38800fe45931 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -950,3 +950,137 @@ void resctrl_mon_resource_exit(void)
 
 	dom_data_exit(r);
 }
+
+/**
+ * resctrl_config_cntr() - Configure the counter ID for the event, RMID pair in
+ * the domain.
+ *
+ * Assign the counter if @assign is true else unassign the counter. Reset the
+ * associated non-architectural state.
+ */
+static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				enum resctrl_event_id evtid, u32 rmid, u32 closid,
+				u32 cntr_id, bool assign)
+{
+	struct mbm_state *m;
+
+	resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
+
+	m = get_mbm_state(d, closid, rmid, evtid);
+	if (m)
+		memset(m, 0, sizeof(struct mbm_state));
+}
+
+/**
+ * mbm_cntr_get() - Return the counter ID for the matching @evtid and @rdtgrp.
+ *
+ * Return:
+ * Valid counter ID on success, or -ENOENT on failure.
+ */
+static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id;
+
+	if (!resctrl_is_mbm_event(evtid))
+		return -ENOENT;
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
+/**
+ * mbm_cntr_alloc() - Initilialize and return a new counter ID in the domain @d.
+ *
+ * Return:
+ * Valid counter ID on success, or -ENOSPC on failure.
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
+/**
+ * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
+ * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
+ *
+ * Return:
+ * 0 on success, or a non-zero value on failure.
+ */
+static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				     struct rdtgroup *rdtgrp, struct mon_evt *mevt)
+{
+	int cntr_id;
+
+	/* No need to allocate a new counter if it is already assigned */
+	cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
+	if (cntr_id >= 0)
+		goto cntr_configure;
+
+	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, mevt->evtid);
+	if (cntr_id <  0) {
+		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
+				    d->hdr.id);
+		return cntr_id;
+	}
+
+cntr_configure:
+	/*
+	 * Skip reconfiguration if the event setup is current; otherwise,
+	 * update and apply the new configuration to the domain.
+	 */
+	if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
+		d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
+		resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
+				    rdtgrp->closid, cntr_id, true);
+	}
+
+	return 0;
+}
+
+/**
+ * resctrl_assign_cntr_event() - Assign a hardware counter for the event in
+ * @mevt to the resctrl group @rdtgrp. Assign counters to all domains if @d is
+ * NULL; otherwise, assign the counter to the specified domain @d.
+ *
+ * If all counters in a domain are already in use, resctrl_alloc_config_cntr()
+ * will fail. The assignment process will abort at the first failure encountered
+ * during domain traversal, which may result in the event being only partially
+ * assigned.
+ *
+ * Return:
+ * 0 on success, or a non-zero value on failure.
+ */
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, struct mon_evt *mevt)
+{
+	int ret = 0;
+
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, mevt);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, mevt);
+	}
+
+	return ret;
+}
-- 
2.34.1

