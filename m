Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2059.outbound.protection.outlook.com [40.107.100.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2966227146D;
	Fri, 13 Jun 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848805; cv=fail; b=Tkf30+uRcrOoZeRk/0SRSgdQPyx2ohJ/3PhdczW/suiPbfprlY+7cXMqVFirJaUxWv5f2gnw0CabYtSXwalFdR3Di1SGC3dBf+1PdlNeEa/O280g9jwP6/4M7d1tuAFV2MWEPeYwBvLStGFheZiH1thqOsAipZQhyRE5QAz2GqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848805; c=relaxed/simple;
	bh=/p6nXyhU27NgWBn7LqGaSJ5EMyy+06lSBS8TVK/Klac=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QWGr/B5EcgvRQFbxIWJgqKVfMgb4yGYStJL8UINCLp4UUR13TyTAj2AA+wKCMpYycB4eHtFtRXsdvD+FT1Xfe/T6islff+QTzej1BqPKRsJsJTcfYNQGQVCtvhCP6QfaIxBVkP8j6DeazeF3j1YY1HuMseFWv1yImcuBIne3tA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AYykandH; arc=fail smtp.client-ip=40.107.100.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AYykandH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZvonxS5SBtA9lwdaO3L46Y5sJli7YvB1VT4mNuLaIQqLoAizp3SM7jUOFqjFJbuJJAikPwoW2qXQDWGpdPZmHqQTt63Ht9JrBLD1LfKQNzshp9YadfbGFm+8eFYRoex2ovG83LVdqAKgkBtvKI53NHa27QHxpqbQ9J7FJXITJwOAGmEdtFwJSqrwq+mFUiuasaYBhYAhLhNPrsngkJN3MOkMSdzVywx7sDf20AY8Ihvtb6mVqTsIFiUtJmgueYt8iI5WM1Z2i5hDrxY/aqf8OASzrr0oBDYj0Fhtqmk0HMcXgzqKvSQEx4Pzw9dGMIA4ho/wRrLnCZzP764iJL1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEWMJ53VAilOA8CLLL64Lwylod+n7dt0vGjyg/rmdO0=;
 b=ax1F8xPLQAslR2eMt7I3K3jnvKs1zxi2EUGMXpqDR1Kva+8ZQAAglWGqVhD79d0uoiKvbIzduKv0TXJ+UqPh9TRBq5Am0tn5GOiRVuIL2urkAAxPpMN9aLRrgxcn3xlTYJqX4yEzLuCK2H6a2jradUsZ6JYmyi2BzEdz2mPIfa+5vp6MSVdPkI6YcpWrzBHAD9Lsxn/QnX//+fO+fmlQTpKKxe8nH1pRl1g8gVmnLFUVwqrKoLzBwPsgvJksfg8kSMDEbezRwc+XWmbhE18jI7IW7U4Ja3z48Z3frayk8ChL6TfACxR/1LtuSd5wNCr/vPCXvZusb1g2IgH4QeAKFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEWMJ53VAilOA8CLLL64Lwylod+n7dt0vGjyg/rmdO0=;
 b=AYykandH7jpb/axHhmKd3j+YJxB3ewl1ixDeYHyA21znroz8fQLLujMeqKyE6Lsv1UIFYaumKtCKE5xXMTaj45i2i5mOY19GKZtT/YgCFm0hI1MI/in8vmf1anW/L8OOp7vcZlrIPwEYlGOHpu/4vrwXUp7n7fMyIEYxMpAV2NM=
Received: from PH7P220CA0063.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::30)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 21:06:38 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::16) by PH7P220CA0063.outlook.office365.com
 (2603:10b6:510:32c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 21:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:06:37 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:35 -0500
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
Subject: [PATCH v14 08/32] x86,fs/resctrl: Consolidate monitoring related data from rdt_resource
Date: Fri, 13 Jun 2025 16:04:52 -0500
Message-ID: <f6d15921bff2d698d0cc0b2a35d2361c846203e6.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CH3PR12MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 6428e093-cebf-489a-182d-08ddaabe2fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P1vW8vkhQUmWM9W7DsWYx5DH13SzPCWCiYt7ies9Vi+Os+IuPUlJkLC5ZGTb?=
 =?us-ascii?Q?z0satIiauATvGAP3kvP5sYOz1VkH6U6OhcSZVdhEoJ/0GqHhvlddgJMpkF6F?=
 =?us-ascii?Q?noCu2w3/sl3WSRvtGM6VAZ6Cj8+jxUqxdJ+hx18PM0XHTySR5KpZDuyOR1Uy?=
 =?us-ascii?Q?79BO4PtTVdz3Litw20bPCXDLq4wYck1z22H3H5A7uMSywdImYHzVzIcZMThK?=
 =?us-ascii?Q?g77tW8lth1zt77pG7JClPbDe01Kcckf9ADGwBRU7ioB6zdsmDMtQzfQ9Ql/r?=
 =?us-ascii?Q?hO8f6ANlvxen9V+ixBbMHEyoKVnmw1EdTdyHiJrB70UYOoD2FtoEY26n/Hsq?=
 =?us-ascii?Q?e8UL+WIOvcZWC3AgnDN1nmpsKTN/twgZuJYgg5FA0kZA026bJBX6CCUu/J+W?=
 =?us-ascii?Q?hhRdYkoBeCVH4HbhNDL7AoyoKMGxItPDRtIFDASgcMOMYu+ITFLa5mnefD2b?=
 =?us-ascii?Q?u7kJY6b3NIC35UqYxuItarxxzj7lDnsYpzEDHGHKe1ko+PiGkdfMI8EHseMK?=
 =?us-ascii?Q?E/9qwkaIOFhNAxaPAf3Wg2tvajwFs5anYQWR1QCEvuMaVJn50bjsapegtGzG?=
 =?us-ascii?Q?sbDLHGh89ZlNG9tZ6QfrXY+0PAOX4QTtP8hCrYsWZvG6C8mE2cWCNFFUgf/g?=
 =?us-ascii?Q?UV0OIANdqfSikVMYWASUy+nUcaDy7Zz0ZDC1y9VmSoXeWNhwO3PxqQh/JdSN?=
 =?us-ascii?Q?y5PIlj3ypp5NT4rieKNMXrWdXVt/pqp31QwWz/LSXvQrA6SN4aPrveHEGlxj?=
 =?us-ascii?Q?SUwkSkEbVL90UixrErm8ATdpC6z/xyP3DZuMTUhNmtZoaOsOrFZXCVcRoyLJ?=
 =?us-ascii?Q?PZWUZG2p7nobWgR/NwvpsjpAy/Y8k+x4B1kg/ILY9L38PT4Vl2jvhMJ0r+Cv?=
 =?us-ascii?Q?fY8fuK3zpLTV5w4kMBM7ImqnCool4cxKMQvFWzuXvDPp77H4NvtVMzlfe/aG?=
 =?us-ascii?Q?uHoL6KMfMjimT8Wj6VPzpz5kxENGqFJ8+fqAgGCwz6tBVseAs50rJVLC9CqG?=
 =?us-ascii?Q?F96cX9oyXJVeFli61KXe+adTQfGgs41YWpl5x6ygLCn3pllVhv69z5mzm0sa?=
 =?us-ascii?Q?8oW3dT0aCSD1sBhHUrYdAiNIsPgmeKDVrMytFIba1tD6LHLFHH6+rp3Gw1Uo?=
 =?us-ascii?Q?byWMwE0O7w6YGNeog5+BOkqGkSvs7D+B0mnyogzZ0vVNMnVOX6y/k0QrM5ta?=
 =?us-ascii?Q?uzHrcJsmuW8hxOhQilT9JkjYymTKU6+ySr6QGjZqVhZ5bAmMe/VQB/YaVc+S?=
 =?us-ascii?Q?XGvV2nrahTArln7sllscPj/JGE4ZB4nNKbvbvH3Ge/bqBc7RzNs7Po+b7P7T?=
 =?us-ascii?Q?teQQE2rRma2rJm6OtC1bvhc+yZ6p5Oa5oc1LpIv10jiShDh81wxmm/WSK3mi?=
 =?us-ascii?Q?LDvU2OxyWC4/j5T5JSXpQUeKFmp3TNygdtQ/uDrTNxMQxb4nf//BUwjZNisg?=
 =?us-ascii?Q?IV2twOheqgtXbw0dB1AnBKiRVcUcnY4z+/VtZinAdOWt3a/q4SlgCIyMmmYR?=
 =?us-ascii?Q?ZJQ4Qdqnd17gBU2TnzSxtOGKh/TD11WnUimjpR8zk3JF8MJUJy/mxyrG+Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:06:37.6518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6428e093-cebf-489a-182d-08ddaabe2fb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121

The cache allocation and memory bandwidth allocation feature properties
are consolidated into struct resctrl_cache and struct resctrl_membw
respectively.

In preparation for more monitoring properties that will clobber the
existing resource struct more, re-organize the monitoring specific
properties to also be in a separate structure.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the code comment in resctrl.h.

v13: Changes due to FS/ARCH restructure.

v12: Fixed the conflicts due to recent changes in rdt_resource data structure.
     Added new mbm_cfg_mask field to resctrl_mon.
     Removed Reviewed-by tag as patch has changed.

v11: No changes.

v10: No changes.

v9: No changes.

v8: Added Reviewed-by from Reinette. No other changes.

v7: Added kernel doc for data structure. Minor text update.

v6: Update commit message and update kernel doc for rdt_resource.

v5: Commit message update.
    Also changes related to data structure updates does to SNC support.

v4: New patch.
---
 arch/x86/kernel/cpu/resctrl/core.c    |  4 ++--
 arch/x86/kernel/cpu/resctrl/monitor.c | 10 +++++-----
 fs/resctrl/rdtgroup.c                 |  6 +++---
 include/linux/resctrl.h               | 18 +++++++++++++-----
 4 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 6426b92492dc..22a414802cbb 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -107,7 +107,7 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 
 	/* RMID are independent numbers for x86. num_rmid_idx == num_rmid */
-	return r->num_rmid;
+	return r->mon.num_rmid;
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -539,7 +539,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 
 	arch_mon_domain_online(r, d);
 
-	if (arch_domain_mbm_alloc(r->num_rmid, hw_dom)) {
+	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
 		mon_domain_free(hw_dom);
 		return;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 0add57b29a4d..42a9e3cc6654 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -130,7 +130,7 @@ static int logical_rmid_to_physical_rmid(int cpu, int lrmid)
 	if (snc_nodes_per_l3_cache == 1)
 		return lrmid;
 
-	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->num_rmid;
+	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->mon.num_rmid;
 }
 
 static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
@@ -205,7 +205,7 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
 			continue;
 		idx = MBM_STATE_IDX(eventid);
 		memset(hw_dom->arch_mbm_states[idx], 0,
-		       sizeof(struct arch_mbm_state) * r->num_rmid);
+		       sizeof(struct arch_mbm_state) * r->mon.num_rmid);
 	}
 }
 
@@ -344,7 +344,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
@@ -359,7 +359,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	 *
 	 * For a 35MB LLC and 56 RMIDs, this is ~1.8% of the LLC.
 	 */
-	threshold = resctrl_rmid_realloc_limit / r->num_rmid;
+	threshold = resctrl_rmid_realloc_limit / r->mon.num_rmid;
 
 	/*
 	 * Because num_rmid may not be a power of two, round the value
@@ -373,7 +373,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 
 		/* Detect list of bandwidth sources that can be tracked */
 		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
-		r->mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
 	}
 
 	r->mon_capable = true;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index bd6718f0ffd6..5874cfdf8d8d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1135,7 +1135,7 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
 {
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 
-	seq_printf(seq, "%d\n", r->num_rmid);
+	seq_printf(seq, "%d\n", r->mon.num_rmid);
 
 	return 0;
 }
@@ -1731,9 +1731,9 @@ static int mon_config_write(struct rdt_resource *r, char *tok, u32 evtid)
 	}
 
 	/* Value from user cannot be more than the supported set of events */
-	if ((val & r->mbm_cfg_mask) != val) {
+	if ((val & r->mon.mbm_cfg_mask) != val) {
 		rdt_last_cmd_printf("Invalid event configuration: max valid mask is 0x%02x\n",
-				    r->mbm_cfg_mask);
+				    r->mon.mbm_cfg_mask);
 		return -EINVAL;
 	}
 
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index bbe57eff962b..22766b8b670b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -255,38 +255,46 @@ enum resctrl_schema_fmt {
 	RESCTRL_SCHEMA_RANGE,
 };
 
+/**
+ * struct resctrl_mon - Monitoring related data of a resctrl resource.
+ * @num_rmid:		Number of RMIDs available.
+ * @mbm_cfg_mask:	Memory transactions that can be tracked when bandwidth
+ *			monitoring events are configured.
+ */
+struct resctrl_mon {
+	int			num_rmid;
+	unsigned int		mbm_cfg_mask;
+};
+
 /**
  * struct rdt_resource - attributes of a resctrl resource
  * @rid:		The index of the resource
  * @alloc_capable:	Is allocation available on this machine
  * @mon_capable:	Is monitor feature available on this machine
- * @num_rmid:		Number of RMIDs available
  * @ctrl_scope:		Scope of this resource for control functions
  * @mon_scope:		Scope of this resource for monitor functions
  * @cache:		Cache allocation related data
  * @membw:		If the component has bandwidth controls, their properties.
+ * @mon:		Monitoring related data.
  * @ctrl_domains:	RCU list of all control domains for this resource
  * @mon_domains:	RCU list of all monitor domains for this resource
  * @name:		Name to use in "schemata" file.
  * @schema_fmt:		Which format string and parser is used for this schema.
- * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
- *			monitoring events can be configured.
  * @cdp_capable:	Is the CDP feature available on this resource
  */
 struct rdt_resource {
 	int			rid;
 	bool			alloc_capable;
 	bool			mon_capable;
-	int			num_rmid;
 	enum resctrl_scope	ctrl_scope;
 	enum resctrl_scope	mon_scope;
 	struct resctrl_cache	cache;
 	struct resctrl_membw	membw;
+	struct resctrl_mon	mon;
 	struct list_head	ctrl_domains;
 	struct list_head	mon_domains;
 	char			*name;
 	enum resctrl_schema_fmt	schema_fmt;
-	unsigned int		mbm_cfg_mask;
 	bool			cdp_capable;
 };
 
-- 
2.34.1

