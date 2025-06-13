Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589DF273816;
	Fri, 13 Jun 2025 21:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848887; cv=fail; b=jFOK96eUoUmqwktpeSL99e/9df1whxq/ci+osqc3FzKPwvSgRRa7ovqA2782k/zX3TrP7V3J392BrmDothT9cnzE51amKTYLkxTH/Jhj6b5yxJwMdP8Fx4RDjJCkK8k7rxHUevqfNVz2DrIAVDlEchrTX017IuBmarzs/lOecFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848887; c=relaxed/simple;
	bh=NoCvKmrRbLjHWxz43aN0b8VfM+3yOjZXaqRZSjcZA7M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHUSzavb8NH7q0OmACVwO+TMPH6hb006QetSa/svL6q/6oyLdqCLRd1Faa1LoZKjCvJKrdus0rEaVvwNWMgUQReHouO7I4XM2xRmwqdpldtwzj1ToEBpILinK80kJzBqxmYddTQPCozrQYmhai7Ts3cjB2KD4j1rpMzUXCEN6YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yKyujKK9; arc=fail smtp.client-ip=40.107.220.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yKyujKK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2bDa7DQWAiigesXupJI2z5i1Bwfhpsby0tGinuET6UkNdfGZaq6CRd7tXxizQyt83XgSyBKLM+vRUnfswnxqmHAWPB78fShTcVYeDWouX0WSEcy5kJlPcZBHdFodNr8vMJk6cWXS1zgfYPite2K4CBZe2nRzRy+L3aUAzRhfzvPu8W0IMc48oFnLK7PtgoGnsVkCmFhUoZSeupr9Fxn1w7GzPfaSXngikUTnp9zi2gwIQdodf8lti9LI/p0pxC8emqliApzL9Z8K03EFiQzXuhc8NKInOW0vHmaQcMI1AsXW4562MwBkx5f1ckkJ3/4HX4y4ElzdwDhqfy+DkRDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwVv5RYmWSy+Uc0Qp7g9Rqt394dhUp3ERCT3KZg4Kks=;
 b=MuXN58J7KZUtPxXyGEadFuMD29fMjHsct2vGsD6zUVXmZiYzxFlDRcnpCTSrCXrP9GwSE7WsfBHKp6/3pm3TtfXv0oIoSgjzNsolxG7dfeMNsepC5/Qsb/3bZDM7Nq+gJEL8whs5FM4xfAZ7F8nO0MlgsUZiMBB2MiNlenRtJRzDKlBuwiBHUiwSYW5kH8gkvIb/a4ejc7hhuSACvQE9msKZLvCgcBLUSB8IeWfJMaim14K3k0ZTaqw7rbE+axmxTa6EOBrXZiWlQy3kpzGRC5VLDSpASRWndoV5xzIZb0cWsNMIaCr0YVQju160lnP2Vglnx0pbpooUXm0SJNC0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwVv5RYmWSy+Uc0Qp7g9Rqt394dhUp3ERCT3KZg4Kks=;
 b=yKyujKK9ISGMYDifmROkS3T/16+lH0H6D3MxwiXW862TJ6KG2cILKsp8E7ROQ/8PefBMCtaDxspl699BGfR95RxeJMTR5UO7xhI04WeRLWIpkOGdxqZk2AbvII3wVdz40g6hafJJiQFLjTHsvEx1R13QioY6K6I3MJugBchi0r0=
Received: from CYZPR17CA0008.namprd17.prod.outlook.com (2603:10b6:930:8c::17)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Fri, 13 Jun
 2025 21:08:04 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:8c:cafe::de) by CYZPR17CA0008.outlook.office365.com
 (2603:10b6:930:8c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 21:08:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:08:03 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:01 -0500
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
Subject: [PATCH v14 19/32] fs/resctrl: Add the functionality to unassign MBM events
Date: Fri, 13 Jun 2025 16:05:03 -0500
Message-ID: <83d54b00cc873d7d4dec433b7f528da10963d025.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|DS0PR12MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 05912bb3-b089-4d61-c1b1-08ddaabe631a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MW+7KnJKnA5p1gqZ1Myup6lipwHuy+OaG977snnchMEgKVC88j+Any39LNye?=
 =?us-ascii?Q?S9aWv1tFIaNNKiz8SHArB0+4ms3ZqdUnfSNRqktmpospLJUYSdEpKdum0ZGd?=
 =?us-ascii?Q?xfhQcjqus/HUyCK3KNKGf3RL0jZ/oaE+y9vJTW25ls/mSYkOgOKLtRH1jaBB?=
 =?us-ascii?Q?u6gO7wk8uncBt7BXYL4uHMb8y6cO2LRL4PmwAzAF+xW7BgZ3dJ9H2rYEtal0?=
 =?us-ascii?Q?mo/6+9yAiXBUwdy1d3UD6wuV8g+HC3yEGYOta9p/zCu8Cxeqw+3eYuVg1t0R?=
 =?us-ascii?Q?W4CFVt8BUIGDKbmWnJ9xgYg3WzgL8PnolbbhEkpUpgoYCezr1fFJ9zeUAlKz?=
 =?us-ascii?Q?VP9GabQFKx3SGL44mq3o0N+ArxvuSIMXGLrJ3ShvFVv0Uoy4hxYhdv668xcR?=
 =?us-ascii?Q?jjMMwD1rZ9BaltnBqGiJ9AdOdACfBhr3PUQwAHiy6LTFTSdoJgatdbBNrWyX?=
 =?us-ascii?Q?QsfJntSnPw/505t01if0sICVn7AY0mjVnGbN+VkfRhhAA4kyTYvgUtXH4LOP?=
 =?us-ascii?Q?DT4GkfcmN+JK4QTHHeo2Nw3rRYHZ4nnDqH0oi3L/cgPlYxz8ZYAPQMsolqas?=
 =?us-ascii?Q?Op8pyqeFi5Y+wZ/oaM0U9jxH/mpSTkjqS5H1Q5I16nvueAgFDfn8pVKGexg4?=
 =?us-ascii?Q?mUT8ObtOstZQ4VW45vQIDOtWAS3+ohclvMbdAyTKFJMAg4yXAORSEBMJ3/IH?=
 =?us-ascii?Q?ERe8/RX93mFywlADkOOfk4Q0CjCntUpKiKB5kn8Io7Nuuy+uQB1FGFtYhETZ?=
 =?us-ascii?Q?xqPl2vgaQ2qP0XfPXNCTxpGRVb7xP1gYNHZd7mx5hImiIVNUWh0duMsOz9xB?=
 =?us-ascii?Q?WdMvHsx6Qb811H9ncdiZQsOx2Wyhu/AqfY/JvYAZEdX3weOLOK4MoaI1Naiv?=
 =?us-ascii?Q?Z/vV507su+CzbQ3FTgPJ2MMKijHdGcDlanVhzahXsck60yy4exbogzHi0cw8?=
 =?us-ascii?Q?9MAcXJ2VTT3SVqTIx7UsSnEM0/uuPKjHQc+OQMpGwza0bW4GisMxdCtCFxly?=
 =?us-ascii?Q?plM55U07K67SnKHX8ZqLryNgfjLjjADz1wLoEipmMXcj/ApCBIH5yAgTydLD?=
 =?us-ascii?Q?I3TsBnB4EZr/PvvL2a7xvxRNHtia2JYy6NMHFx/3L1DNxIwYCheUjig8Z/ip?=
 =?us-ascii?Q?BxeFtMdiS6quchHpFwy5qucBU2usShO+xG87bwGro+OKzagvYNJNJMffAXy/?=
 =?us-ascii?Q?VNYM2SdHLUFkZGSoGW5eJlKo4h3bgat5Jq9eGpashTRpbuEFM4J6PdRO/A9m?=
 =?us-ascii?Q?w/u8H0LeorNxrwU/wnvH2JBJVT8GrhstFlY4YN4DNNzB+H22xt21MSM/jqzB?=
 =?us-ascii?Q?XwhUiMwvBmv4VI1VnbSTESmhslgw2iGnZ2M48JepaI7crYaJHs+IdTa4kdst?=
 =?us-ascii?Q?htUh5hilIt+VdqXPGr4+VCZbNm5rXkzU2g2tPOlkY6q/B7H7tNhz4fcyxJQS?=
 =?us-ascii?Q?uPfE9V9c+p/aG+VHzuE/yPSmXhLujxNWhRxOZGFYWsoDi5DXdupyaOoxDrhG?=
 =?us-ascii?Q?Blqih6GTXWMIK7Av6T5kCOTSQFY8ztDKoiC3jNmqdhx7jrbXGtAdTLk1Pw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:08:03.8568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05912bb3-b089-4d61-c1b1-08ddaabe631a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

The "mbm_event" mode offers "num_mbm_cntrs" number of counters that can be
assigned to RMID, event pairs and monitor bandwidth usage as long as it is
assigned. If all the counters are in use, the kernel logs the error message
"Unable to allocate counter in domain" in
/sys/fs/resctrl/info/last_cmd_status when a new assignment is requested.

To make space for a new assignment, users must unassign an already
assigned counter and retry the assignment again.

Add the functionality to unassign and free the counters in the domain.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Passing the struct mon_evt to resctrl_free_config_cntr() and removed
     the need for mbm_get_mon_event() call.
     Corrected the code documentation for mbm_cntr_free().
     Changed resctrl_free_config_cntr() and resctrl_unassign_cntr_event()
     to return void.
     Changed subject line to fs/resctrl.
     Updated the changelog.

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
 fs/resctrl/monitor.c  | 47 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 0767a1c46f26..4496c359ac22 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -388,6 +388,8 @@ int resctrl_find_cleanest_closid(void);
 
 int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, struct mon_evt *mevt);
+void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				 struct rdtgroup *rdtgrp, struct mon_evt *mevt);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 38800fe45931..f2636aea6545 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1016,6 +1016,14 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
 	return -ENOSPC;
 }
 
+/**
+ * mbm_cntr_free() - Clear the counter ID configuration details in the domain @d.
+ */
+static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
+{
+	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
+}
+
 /**
  * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
  * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
@@ -1084,3 +1092,42 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	return ret;
 }
+
+/**
+ * resctrl_free_config_cntr() - Unassign and reset the counter ID configuration
+ * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
+ */
+static void resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				     struct rdtgroup *rdtgrp, struct mon_evt *mevt)
+{
+	int cntr_id;
+
+	cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
+
+	/* If there is no cntr_id assigned, nothing to do */
+	if (cntr_id < 0)
+		return;
+
+	resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid, rdtgrp->closid,
+			    cntr_id, false);
+
+	mbm_cntr_free(d, cntr_id);
+
+	return;
+}
+
+/**
+ * resctrl_unassign_cntr_event() - Unassign a hardware counter associated with
+ * the event structure @mevt from the domain @d and the group @rdtgrp. Unassign
+ * the counters from all the domains if @d is NULL else unassign from @d.
+ */
+void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				 struct rdtgroup *rdtgrp, struct mon_evt *mevt)
+{
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list)
+			resctrl_free_config_cntr(r, d, rdtgrp, mevt);
+	} else {
+		resctrl_free_config_cntr(r, d, rdtgrp, mevt);
+	}
+}
-- 
2.34.1

