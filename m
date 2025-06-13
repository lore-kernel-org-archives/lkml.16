Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F2D2737EC;
	Fri, 13 Jun 2025 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848906; cv=fail; b=YURo5asaiK8OdX0QaJVhRbrfwFCcvPfYbD8vBjqXWuqugNJL37gfHxZ7ktaVbtj2o6dPEXVJ5HDVsrcxSeS1ky/Vco4d7DWxPJnm8AVdff6uVV8BrDQBtLeOkJpG4WP6TX/SXw56XbjbSSMMOTteHy8oS7KtZoB/rSxig1LJv6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848906; c=relaxed/simple;
	bh=6tYfU1Id2XFoUMEezkZ/ZHlsHd1hkxsCKKUmtlXxfac=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4123KbtnDbkYpdv6OdDzXGRShCB6Xm/23IS9PgaYqh1M2lXruIaJwJCucO+OKpioYPNVQx/haNIR7SzvjvVQIQVRz5DQkITa87Qelv47GGde8SrwYbyWJWx3H6g+yQChznVDXAn3lZvTf1ioK2bcxTCsMo2gzN/CJHM7gzKQCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m5h7C0BZ; arc=fail smtp.client-ip=40.107.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m5h7C0BZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kT4k0MYsZJPXicyBFdyePvM+7+pXunTxHq8Yp+CiA8ERnAfD263GWFuuobjpE8HtAuCPbWmpkfzxJrzcpQVfZwFZ8quoUFe7Gcw+bBMkZ/LYi7UuvsbPXLWMSzOvvQuMhItMiLQtoySDiHulZYRXcfFAu/RZe6M4ifwTSir/Bi9+i2dQfz9BFVPE/LSONo+LwieW1RzouKaa06EAmvmTbss4OtB36B3583GYWnGKeBTW02jKcrkTJYZ8v1Cjqp7MJioTGbGzqCsjtDA91ipd1smi7zrjTpGXKALyTbqd1nEjF+PSYGHrUaQfyhA278xR7rdNMpQPv6iNqddx7SGHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLens14F6NUmFTQA5a2gobwz8Y3vUrFg4TRAzFN/L5c=;
 b=fRKtZa9NOl3jawsXp5KvCInX5tNSKTQy2T9I/mj5jDTnqmde91sU0LyVOo4ouUnifKJpGhEFowojf1mHTfwBcQOorVXP0gNxMAKwUwS7lu1i9lqgM1BR85ONEpORsIxhFaWnsjtkmWFoc0O91I3xkE3Ij/HAe0g9ZBRGfjFLycPjybrftlNyONGQmXoosko4dweXepnlHAoQBdRTawp8eRPiV0QOe5wiuZ55ZVT502B54hTdedjofqE1Zj9k03gkH6x3AlUSRiycAKMz6JztzLcmTZ6zSaKQ+/jJUrKrFLMhoV2L4XvNTapEovcipXmeTbEjJZMmVD2IHclYuYyLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLens14F6NUmFTQA5a2gobwz8Y3vUrFg4TRAzFN/L5c=;
 b=m5h7C0BZ0fTZCY3eVpFXiMal+ylN2IQ7cPmDKqtB+R1pu0w1rOjvAFwbIWl4DsAKwxhJYdw7rd98yyZa271Ouzw74ZjZjWUOW5J5VFD3nYgfHrpMfj/qPlMbRYMOnsHdsLvUEio/0clqABfCmN5fH36CkZSAqMW/SbmejgzVOJs=
Received: from DM6PR05CA0063.namprd05.prod.outlook.com (2603:10b6:5:335::32)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 21:08:20 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::40) by DM6PR05CA0063.outlook.office365.com
 (2603:10b6:5:335::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 21:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:08:19 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:17 -0500
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
Subject: [PATCH v14 21/32] fs/resctrl: Pass entire struct rdtgroup rather than passing individual members
Date: Fri, 13 Jun 2025 16:05:05 -0500
Message-ID: <84e5cffb2b3f8088f77781babe89b0cab513ed79.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd3010c-46b1-448d-098d-08ddaabe6cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t2fPt1kQpC0/F9R+8Qa7jy9TIS5uyvNqj8f65N1JULWAD0AZcIxiVEt5+MjZ?=
 =?us-ascii?Q?ddz7PIjtFvovVntq9jtJqI39TxYJT4sfPy8vzUd8njA1jOkupdjIn5YSm4do?=
 =?us-ascii?Q?wZqphbzMyDER22JcX7iWeDVhyQtTNcp9Xay9NlwrSAy6yWEFDeZvCO/izgXT?=
 =?us-ascii?Q?PPKWhoUEo8HfYT70NGjY8j/RQD+HNRF1kthlxKatWA3CRM2GcAz1dBN7e9OL?=
 =?us-ascii?Q?e2MPSN+QdKTDEGNAaAfeJDzykOwuEqtwJmLyUfAwgsLciucG8v3ytN2hF66S?=
 =?us-ascii?Q?ggQ8IkqOhLYmAgUTgjGIozTpLUvU8+RBCGoqSQSQlGXo0zVy5pKUYKBS4RDG?=
 =?us-ascii?Q?r4GqROU54D6uchILtzPrw4/edeJwK8oO0J+9rbds9HdEU6s5WI9M3ysQYZ+K?=
 =?us-ascii?Q?wpICriJ0SKDkEEBesgonQJtKDPozzxlBBihIb5ZPWEnYXlEE9pw5etYtNxTq?=
 =?us-ascii?Q?0xPNd2COVZqRyQ4LYsYkON8SQtrYRVwP7Ft1ECY4xpfJ+zb+5GfQd2I9cT5R?=
 =?us-ascii?Q?FRKgto1r2dg4lSf3XuzLGrrLj+oCkj1tifkIl9uJTRTwmaRf5mJbHxgDy4ok?=
 =?us-ascii?Q?1k2TCp5W0WurOPCLfPTv+lxtLtL5s/wsCQC+rAR0nvb4A82O44BeOseSugOr?=
 =?us-ascii?Q?0JnVI481hw9GfFyMggH4Gk5DuAvMt2hOZIJZxbRShcNIZ5Akvaudkx6cUp8l?=
 =?us-ascii?Q?rPFrVYh18JMOXqX4taWlTZ0O5C8gGWWioiWSQ8PucliJlvBBSX577Wx6CJ/1?=
 =?us-ascii?Q?SXjnTzilwwhDHY64lrrvkGjINQyFC2UdHbaB986l4E97vpjtqeI4DJQGudmp?=
 =?us-ascii?Q?V84sty1rGqxWJSCvlBSSjSqyyvNlB9hyLAuhsoAW5OQy9itY5xRVaxrEmumg?=
 =?us-ascii?Q?4M8NR4OHfMauEk8kDoocRSvf3864BvbxeAwefJgxTFcCYncxZJrP1nGI68lp?=
 =?us-ascii?Q?96WZ1OreqqfXmCSb5GVgKp+plzcKikdYpz1C878qq+ybnmBaSytknFapAomq?=
 =?us-ascii?Q?hc5YpgwhieQ4A4D6Zi6DOqBF3McLR7AoOJBBik2TV0bukMF7Y8rasy6pYXma?=
 =?us-ascii?Q?ycILOOk+fnmaZrpG1dJo8KZXbHZnVcE9rTe59rpReHvmjL5npK6TIfIz/js1?=
 =?us-ascii?Q?VtLJDwtfxnzSXH20HEH3TEO/Sl7wfAQide/ttThbajtDGB7hrUMkCxzd+DeC?=
 =?us-ascii?Q?N/f9gd7mhAUAeslIo/N3ycvEBzlY5Wei029/MC17SWyUNWDdmsCV50GfF/2u?=
 =?us-ascii?Q?2uiJBReFL1+h0TGfWQt4B1Uo0m9W4gvQY7gzQd0/b9WdIoN3+ztgKIR8ofze?=
 =?us-ascii?Q?7ABKCYc+mMmR24Zr0TdxkmnLWUoyNL16jbYP40QmFK/FVdKRUjY+i1uWqShw?=
 =?us-ascii?Q?zfwsKOkGmYqLMBLg+7f+mSmGIvcx5WvKcupnU9dlTXqYtZryBUMMxaLG97Dz?=
 =?us-ascii?Q?sDcuMuyauQZu8PpjbzZVmZgowTo1C5DPKPy+zMqMyI620lPOCGNNr05WOwSU?=
 =?us-ascii?Q?F5TgOxpO9ymqgo0b7d/TBTIgIHPVwAyzv0ypjyWEkL6JGWFmndg4UHADNg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:08:19.9485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd3010c-46b1-448d-098d-08ddaabe6cbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187

Reading the monitoring data requires RMID, CLOSID, and event ID, among
other parameters. These are passed individually, resulting in architecture
specific function calls.

Passing the pointer to the full rdtgroup structure simplifies access to
these parameters.

Additionally, when "mbm_event" mode is enabled, a counter ID is required
to read the event. The counter ID is obtained through mbm_cntr_get(),
which expects a struct rdtgroup pointer.

Refactor the code to pass a pointer to struct rdtgroup instead of
individual members in preparation for this requirement.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Few text update to commit log.

v13: New patch to pass the entire struct rdtgroup to __mon_event_count(),
     mbm_update(), and related functions.
---
 fs/resctrl/monitor.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index cf7f6a22ea51..31e08d891db2 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -356,9 +356,11 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
 	return state ? &state[idx] : NULL;
 }
 
-static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
+static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
+	u32 closid = rdtgrp->closid;
+	u32 rmid = rdtgrp->mon.rmid;
 	struct rdt_mon_domain *d;
 	struct cacheinfo *ci;
 	struct mbm_state *m;
@@ -429,9 +431,11 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
  * __mon_event_count() is compared with the chunks value from the previous
  * invocation. This must be called once per second to maintain values in MBps.
  */
-static void mbm_bw_count(u32 closid, u32 rmid, struct rmid_read *rr)
+static void mbm_bw_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	u64 cur_bw, bytes, cur_bytes;
+	u32 closid = rdtgrp->closid;
+	u32 rmid = rdtgrp->mon.rmid;
 	struct mbm_state *m;
 
 	m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
@@ -460,7 +464,7 @@ void mon_event_count(void *info)
 
 	rdtgrp = rr->rgrp;
 
-	ret = __mon_event_count(rdtgrp->closid, rdtgrp->mon.rmid, rr);
+	ret = __mon_event_count(rdtgrp, rr);
 
 	/*
 	 * For Ctrl groups read data from child monitor groups and
@@ -471,8 +475,7 @@ void mon_event_count(void *info)
 
 	if (rdtgrp->type == RDTCTRL_GROUP) {
 		list_for_each_entry(entry, head, mon.crdtgrp_list) {
-			if (__mon_event_count(entry->closid, entry->mon.rmid,
-					      rr) == 0)
+			if (__mon_event_count(entry, rr) == 0)
 				ret = 0;
 		}
 	}
@@ -603,7 +606,7 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_mon_domain *dom_mbm)
 }
 
 static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *d,
-				 u32 closid, u32 rmid, enum resctrl_event_id evtid)
+				 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
 {
 	struct rmid_read rr = {0};
 
@@ -617,30 +620,30 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *
 		return;
 	}
 
-	__mon_event_count(closid, rmid, &rr);
+	__mon_event_count(rdtgrp, &rr);
 
 	/*
 	 * If the software controller is enabled, compute the
 	 * bandwidth for this event id.
 	 */
 	if (is_mba_sc(NULL))
-		mbm_bw_count(closid, rmid, &rr);
+		mbm_bw_count(rdtgrp, &rr);
 
 	resctrl_arch_mon_ctx_free(rr.r, rr.evtid, rr.arch_mon_ctx);
 }
 
 static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
-		       u32 closid, u32 rmid)
+		       struct rdtgroup *rdtgrp)
 {
 	/*
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_TOTAL_EVENT_ID);
+		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_LOCAL_EVENT_ID);
+		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
 }
 
 /*
@@ -713,11 +716,11 @@ void mbm_handle_overflow(struct work_struct *work)
 	d = container_of(work, struct rdt_mon_domain, mbm_over.work);
 
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
-		mbm_update(r, d, prgrp->closid, prgrp->mon.rmid);
+		mbm_update(r, d, prgrp);
 
 		head = &prgrp->mon.crdtgrp_list;
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
-			mbm_update(r, d, crgrp->closid, crgrp->mon.rmid);
+			mbm_update(r, d, crgrp);
 
 		if (is_mba_sc(NULL))
 			update_mba_bw(prgrp, d);
-- 
2.34.1

