Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869427146D;
	Fri, 13 Jun 2025 21:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848764; cv=fail; b=iy17Cnkks8Lvb9jYDQWrq9Ng0ekNKXLpKnKFGjxev49g/FuXIf30qzDdHDNvjZ+chTAHEdcdx3b+7fnDE9Y2ZjEVIvFDPxDtEM7dVq9CZmduZwTwDDoWZeFkLxT/DHk4B/Jd+7+5zExl1uGl+KVjzLDEWxwonztKmChaupCawYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848764; c=relaxed/simple;
	bh=f10zETfLq/4fAK09b5lqH/745VS1vjLiMTZoTrCn/8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJvOqUp7oiV4vQYQzseRsY/mXqxKUK2aBbJHu+Kxg832L0YmRj5cY5D8T4cKI5zfHvJBIMHMFVJ46O4gP6AEX0kw83j4oG54m7a6igLSH8ggaFK4c2Zj5Kr8Rc6FZK0dVcUsncPqjcg0dyAJcvwbItKkmNINuoCnL8arGSsPJ3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y3oYr1i1; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y3oYr1i1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYPkODn4f4sjiw57w9QQufXY+7b88rPojOk6LbRNl0Naj0y6IlgspmsmGI6JtcAkvmg6yXKgKNAufMg4n9LSoH1/rQj6yOKD+8HAkZ9g/g7dRLP9hHMs+jy4iFnhx7ZOr3TcAtH1r878XarT76ZRzucPwI7j6z2tNi/2LBRgbLUxAXivY0hdMIAYDkUbQWBzi/7pE0jJ7jAPBBjtPc6U/uLp6YWL9f/QXS2SLek23Ht9Hi/yisKlaGaNix97JmqksGO5DXk3OrwExs+StUV3YoCf3//sZLr047SqwYgmp+7/fM9N+v7pqgr5aIz90oDLboUm6WGh29QfFCBACcVMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbcfbFuJO2K4O0Eey5ocGfj27PjsOicxurrTvWGUMSs=;
 b=A5wbzuICWxfPt29vhMmaJhvHXYC2AlDk5IdgILglV7i8b4xiAxaj2nTUWo3Reg6jQj8m8NUFgXgrySkuUGpEtEC8gE3nCdkRsBOvgsVZZeDKcc5y0aI+y6qiiv3RW808oJDZQyfzF7AOEzo1P5Z5/B1oLFJwewSOceo5+D2TWgy2gE4aQVNmJleicldz+l6TFz8gvFT3Rf7PkJ/8dYw47Dhqh78JWt5s+gIC7MD/Maje4I1RDbOIffE6cYHBc9uvBSoRK2QlnMM/j2+/fcWSvLULQOlQPI3u6kFJb0bUgBzQTbVwMClUK2vBmG9NMymidNz7tHn4fITShMzKy8JU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbcfbFuJO2K4O0Eey5ocGfj27PjsOicxurrTvWGUMSs=;
 b=y3oYr1i1duoUoCXwHjmto9UUIlMmG3k30OwDwdp8raotTSgzP3pxnsLlUn8dAGPNdjU5crWvzb/G7ZUY+QYtnksrsZ/D6YnKxdw/b9PbEVCd8/raFxqgHbpzwIuhdEkQoNLUzYSZso4WSl2jeQTKofLtQ4V7C/zEA+AKqY9oLBc=
Received: from DM6PR05CA0064.namprd05.prod.outlook.com (2603:10b6:5:335::33)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 21:05:59 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::77) by DM6PR05CA0064.outlook.office365.com
 (2603:10b6:5:335::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:05:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:05:57 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:05:55 -0500
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
Subject: [PATCH v14 03/32] x86,fs/resctrl: Replace architecture event enabled checks
Date: Fri, 13 Jun 2025 16:04:47 -0500
Message-ID: <56733e6ae9b3d5848bd78e04abf71f84e474a4be.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: a33bb84d-5955-4646-8544-08ddaabe17c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IXOzTObUVTsa5KKEaD4e5OG/hmMq7FDZXu52R1TRRDGLgxbYxJhG9yuCNyEG?=
 =?us-ascii?Q?QkZF4rWPOE++10AKtkZG8X2xiscAChiw4bkOtIIWS+6lUt1TTs4f57yquZ4t?=
 =?us-ascii?Q?FVAR4/7Q07sRdj8xRC/nurx+1aQ7Tka2HtFeSjpmCOtZJbr+Vghcmx9NCbKy?=
 =?us-ascii?Q?Hsu0va98LcmMv8NNK15uAtU9Kpio7gd5KWqikFa7HEZcP7LS1pRDPtGVaIUP?=
 =?us-ascii?Q?jVfR4P4br8JT3XG4XBXPIfeGvWMYu+LL0PRCuFsyw+47dFxTUkVuKvHDWvMq?=
 =?us-ascii?Q?fUf1tOnbdaEy3wddmYm4DYMs8wK2r6hTrNXiDt5zkrKBCuO3jIrDOn2jxym1?=
 =?us-ascii?Q?b2bxvsg1pS7sOl7EOricxp4push3cfyRTvo0OVuyx/YLCo9JtSNdS90trstQ?=
 =?us-ascii?Q?yR/o27ARPhYuHxrCGptUUyDZzDKbaRGPyO8ApNUxf2m43vgOdMcpw/j8Kj+J?=
 =?us-ascii?Q?wo1EA34+flGx93mW2ugywqZ6/8FrfX/vOwcSU3L5XS+XVOYZBkl0pAmOyB9p?=
 =?us-ascii?Q?3ZekIjcJ51oh5a1lZZcAys5G/GxdR6YkBqImqiJ+g25sCMWRsh0KA+tQe8Fh?=
 =?us-ascii?Q?ZhA+qXy/9xrf8AlQn/SJbOTaxGi2TKye+Q3kLmz48VbRpv+cmuJJn+b37/u2?=
 =?us-ascii?Q?Ep6OKSUg4nxOSfcZRR6cjDWDaxhuit/qyEiN3vU8nXQqiyUpBgLBD/zV36oI?=
 =?us-ascii?Q?ilayd+lf/kGyFbpRQbcYA17A4Y4PNo4C8R6I2AsivgJpjFoleKdIQwcexGZ+?=
 =?us-ascii?Q?zFBalE6cXCNq7iujxy4VEggjDPJKRm7JY+E186KvnOneYlh9DH6PKtqJHLmN?=
 =?us-ascii?Q?yKNekHv2z7Q+gI9RJUgT2cHE8IEB/DQSE0m1/+t5WuBqGfXsN3xJvaB3or4s?=
 =?us-ascii?Q?X7HNzd6Qaj9RTvQK+ZQ2TM84+4oC08CASrZRICNxXTOwotm74OaYB0x1pnna?=
 =?us-ascii?Q?Rr5H+XnCNdpQk2+6kKvzA89fYDqDEibMxKn8f+qZkIYk53OnFA5wr3U0SamF?=
 =?us-ascii?Q?CGYMl+Zgd/o7HjvSayH99vJIRGsP7tilzVZqjtIJhGBF07WhZv02FEu2sjGl?=
 =?us-ascii?Q?7w8EakwrdupZShKSBulCjLaOlLmWw+Mwe8eho5Ss39Fnq+ey7REMZc3zPEdx?=
 =?us-ascii?Q?7OzeSQsbjie30rZODMrCiNE/D5h2odpf70eOmqjSLITk3iSuH8SZOSp/m867?=
 =?us-ascii?Q?Pbp/vvmAtJ/mF/Ssl0sQZ8a2h+6VDiyIovyCLBP4UqovoIjvb8oDRASpKjFl?=
 =?us-ascii?Q?2NJQoyZACQ+5oJp0EsPUS4+CWQIhYRzXXxsaxEcnLJ7kjYiOim11nYTmfH3R?=
 =?us-ascii?Q?Z+HvTLgd6v1+L59wJPFJkUdZJKqf/Ez0vc81e4DBhBXzf+3RPQe+pi946Ac3?=
 =?us-ascii?Q?l6LyrNQeJO78CiQxNhUAtYHIhi21jpp6mad3GdYZm0XjwPA59Q2/xllOEEiL?=
 =?us-ascii?Q?9+NYUN5zlTbvF81UATISUR7zOFcjnLp7xZ7n17xvnNe7Gi0Cci8MoDnbeMtc?=
 =?us-ascii?Q?E5BUUUGaNjAcTE6A1TGm1iRmSUFghJ98beJHp6a6flZh20mFhhH3MYQ5FAE9?=
 =?us-ascii?Q?OEH3DJZrhHKQGtpRuxs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:05:57.4481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33bb84d-5955-4646-8544-08ddaabe17c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088

From: Tony Luck <tony.luck@intel.com>

The resctrl file system now has complete knowledge of the status
of every event. So there is no need for per-event function calls
to check.

Replace each of the resctrl_arch_is_{event}enabled() calls with
resctrl_is_mon_event_enabled(QOS_{EVENT}).

No functional change.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14: This is Tony's work. This is part of Tony's telemetry series.
     https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/

     Tony made special update for me to include in this series.
     https://lore.kernel.org/lkml/20250609162139.91651-1-tony.luck@intel.com/
---
 arch/x86/include/asm/resctrl.h        | 15 ---------------
 arch/x86/kernel/cpu/resctrl/core.c    |  4 ++--
 arch/x86/kernel/cpu/resctrl/monitor.c |  4 ++--
 fs/resctrl/ctrlmondata.c              |  4 ++--
 fs/resctrl/monitor.c                  | 16 +++++++++++-----
 fs/resctrl/rdtgroup.c                 | 18 +++++++++---------
 include/linux/resctrl.h               |  2 ++
 7 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index feb93b50e990..b1dd5d6b87db 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -84,21 +84,6 @@ static inline void resctrl_arch_disable_mon(void)
 	static_branch_dec_cpuslocked(&rdt_enable_key);
 }
 
-static inline bool resctrl_arch_is_llc_occupancy_enabled(void)
-{
-	return (rdt_mon_features & (1 << QOS_L3_OCCUP_EVENT_ID));
-}
-
-static inline bool resctrl_arch_is_mbm_total_enabled(void)
-{
-	return (rdt_mon_features & (1 << QOS_L3_MBM_TOTAL_EVENT_ID));
-}
-
-static inline bool resctrl_arch_is_mbm_local_enabled(void)
-{
-	return (rdt_mon_features & (1 << QOS_L3_MBM_LOCAL_EVENT_ID));
-}
-
 /*
  * __resctrl_sched_in() - Writes the task's CLOSid/RMID to IA32_PQR_MSR
  *
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7fcae25874fe..1a319ce9328c 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -402,13 +402,13 @@ static int arch_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_mon_domain *hw_dom)
 {
 	size_t tsize;
 
-	if (resctrl_arch_is_mbm_total_enabled()) {
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		tsize = sizeof(*hw_dom->arch_mbm_total);
 		hw_dom->arch_mbm_total = kcalloc(num_rmid, tsize, GFP_KERNEL);
 		if (!hw_dom->arch_mbm_total)
 			return -ENOMEM;
 	}
-	if (resctrl_arch_is_mbm_local_enabled()) {
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		tsize = sizeof(*hw_dom->arch_mbm_local);
 		hw_dom->arch_mbm_local = kcalloc(num_rmid, tsize, GFP_KERNEL);
 		if (!hw_dom->arch_mbm_local) {
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c261558276cd..61d38517e2bf 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -207,11 +207,11 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
 
-	if (resctrl_arch_is_mbm_total_enabled())
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		memset(hw_dom->arch_mbm_total, 0,
 		       sizeof(*hw_dom->arch_mbm_total) * r->num_rmid);
 
-	if (resctrl_arch_is_mbm_local_enabled())
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
 		memset(hw_dom->arch_mbm_local, 0,
 		       sizeof(*hw_dom->arch_mbm_local) * r->num_rmid);
 }
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index d98e0d2de09f..ad7ffc6acf13 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -473,12 +473,12 @@ ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 	rdt_last_cmd_clear();
 
 	if (!strcmp(buf, "mbm_local_bytes")) {
-		if (resctrl_arch_is_mbm_local_enabled())
+		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_L3_MBM_LOCAL_EVENT_ID;
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "mbm_total_bytes")) {
-		if (resctrl_arch_is_mbm_total_enabled())
+		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 		else
 			ret = -EINVAL;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2313e48de55f..9e988b2c1a22 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -336,7 +336,7 @@ void free_rmid(u32 closid, u32 rmid)
 
 	entry = __rmid_entry(idx);
 
-	if (resctrl_arch_is_llc_occupancy_enabled())
+	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
 		add_rmid_to_limbo(entry);
 	else
 		list_add_tail(&entry->list, &rmid_free_lru);
@@ -637,10 +637,10 @@ static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_arch_is_mbm_total_enabled())
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_TOTAL_EVENT_ID);
 
-	if (resctrl_arch_is_mbm_local_enabled())
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
 		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_LOCAL_EVENT_ID);
 }
 
@@ -879,6 +879,12 @@ void resctrl_enable_mon_event(enum resctrl_event_id eventid)
 	mon_event_all[eventid].enabled = true;
 }
 
+bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid)
+{
+	return eventid >= QOS_FIRST_EVENT && eventid < QOS_NUM_EVENTS &&
+	       mon_event_all[eventid].enabled;
+}
+
 /**
  * resctrl_mon_resource_init() - Initialise global monitoring structures.
  *
@@ -914,9 +920,9 @@ int resctrl_mon_resource_init(void)
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 
-	if (resctrl_arch_is_mbm_local_enabled())
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
-	else if (resctrl_arch_is_mbm_total_enabled())
+	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
 	return 0;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b95501d4b5de..a7eeb33501da 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -123,8 +123,8 @@ void rdt_staged_configs_clear(void)
 
 static bool resctrl_is_mbm_enabled(void)
 {
-	return (resctrl_arch_is_mbm_total_enabled() ||
-		resctrl_arch_is_mbm_local_enabled());
+	return (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID) ||
+		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID));
 }
 
 static bool resctrl_is_mbm_event(int e)
@@ -196,7 +196,7 @@ static int closid_alloc(void)
 	lockdep_assert_held(&rdtgroup_mutex);
 
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
-	    resctrl_arch_is_llc_occupancy_enabled()) {
+	    resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
 		cleanest_closid = resctrl_find_cleanest_closid();
 		if (cleanest_closid < 0)
 			return cleanest_closid;
@@ -4051,7 +4051,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 
 	if (resctrl_is_mbm_enabled())
 		cancel_delayed_work(&d->mbm_over);
-	if (resctrl_arch_is_llc_occupancy_enabled() && has_busy_rmid(d)) {
+	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) && has_busy_rmid(d)) {
 		/*
 		 * When a package is going down, forcefully
 		 * decrement rmid->ebusy. There is no way to know
@@ -4087,12 +4087,12 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	size_t tsize;
 
-	if (resctrl_arch_is_llc_occupancy_enabled()) {
+	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
 		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
 		if (!d->rmid_busy_llc)
 			return -ENOMEM;
 	}
-	if (resctrl_arch_is_mbm_total_enabled()) {
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		tsize = sizeof(*d->mbm_total);
 		d->mbm_total = kcalloc(idx_limit, tsize, GFP_KERNEL);
 		if (!d->mbm_total) {
@@ -4100,7 +4100,7 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
 			return -ENOMEM;
 		}
 	}
-	if (resctrl_arch_is_mbm_local_enabled()) {
+	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		tsize = sizeof(*d->mbm_local);
 		d->mbm_local = kcalloc(idx_limit, tsize, GFP_KERNEL);
 		if (!d->mbm_local) {
@@ -4145,7 +4145,7 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d)
 					   RESCTRL_PICK_ANY_CPU);
 	}
 
-	if (resctrl_arch_is_llc_occupancy_enabled())
+	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
 		INIT_DELAYED_WORK(&d->cqm_limbo, cqm_handle_limbo);
 
 	/*
@@ -4220,7 +4220,7 @@ void resctrl_offline_cpu(unsigned int cpu)
 			cancel_delayed_work(&d->mbm_over);
 			mbm_setup_overflow_handler(d, 0, cpu);
 		}
-		if (resctrl_arch_is_llc_occupancy_enabled() &&
+		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
 		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
 			cancel_delayed_work(&d->cqm_limbo);
 			cqm_setup_limbo_handler(d, 0, cpu);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 2944042bd84c..40aba6b5d4f0 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -372,6 +372,8 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
 void resctrl_enable_mon_event(enum resctrl_event_id eventid);
 
+bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid);
+
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
 /**
-- 
2.34.1

