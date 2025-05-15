Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C8728E572;
	Thu, 15 May 2025 22:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349577; cv=fail; b=CWhPJ06W322R9rpus0e8W2d2OU1NszJ6XKZ07iY5bjsNNQfeCy4eu+Wj/8Fvvzx6LUCISTgujhSmD1oharpg+plQdUMsiRrcsWB3u+4wUluz24G9qN0valiMJ7W7K/yNcW1bhijnKQ3m5+W6hlQWVZA1H2bcLcbNjHoKIOxgh3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349577; c=relaxed/simple;
	bh=gHF0Im8W8X8FVD+zrt4MperDctIIW34ctUc4l/OxMqo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mo81f03PjFNey9JTLkCKg6TsXlO4dChrNvpDdRLIh/nhXpXh3PIkatquOO/pQcgezn+v83uhwq6hZ6nNq+3HXeJM/wo+r3Xd86KFUG6jyjJRyB3uk4sXC/ngmVC3vnhsfy2enBreBC5N8vR9NFaGMNMiJY2gbWj4Dsg51t/XYXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r3oQWbvy; arc=fail smtp.client-ip=40.107.100.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r3oQWbvy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJVXbGJJxJLS3aSdIu+AJcUp6tt/Yfw/dThGPgy4YttXEmdpxO8P6WUGMxVC7mIh6J2wJbiLrPJyIbvozsFGDpXw+QNBMglqzSFmKvxtHl+LC5Vx+L0mPK40U5GwmtIJHgiAa1h1BuGGieY5YXIoIQv/lNBaeWhnbf15kao81egne735DrdwvfCt9JR6S4WK3FI2ApTzoKSot8A1XPI+DIS9iYdEJ0kXEeuCzyWUQIGSp3U5eBOX6u0LpNQRCAS1OIFoOdiNP6gOVCLySrbP4r7A7HCzjVi/kmcONxw7N82RhEdyqYvantkxum8k1/5iIZOXZz4TWUa4d8+ltBz7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBrMXdYLyUpyFC47x8ImWYyRw7PNtAd5L2PoyYtCWRw=;
 b=NjuQGfUrUrDB/dozB30opSZVFY7UtpndTnR6Pb7UrHALzXRIeVa3LYRmEsdXUayshKSeHDmzj27A6R/EBEGMFaqUDdiOJ9CCth28TTARFQgPf5O+QTj5vOjLQSturapa6r4gco7iiFpmfC0b+6BoyTywkcb29XmEs0BfpICosNOrJat4I864EE+UxsvKPVvAKaXye88HSD3bsRgRMe89j6wbXEEP0sO1qTNQ+dYue1KZgXiv+xYWkKzFEoWbJK8B4Nj3Wl60GMQ3w8XGny6uv8TGxgXgFVw0p8pjSH8D04ztE7qkQ9R6pUFHK8Cgm0b9AQ9IQ1hMvyYlyiCzSnwbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBrMXdYLyUpyFC47x8ImWYyRw7PNtAd5L2PoyYtCWRw=;
 b=r3oQWbvy5pGOF7Cs36nCDtWwPmuuUtF0lxB4o7ZbIFKgg48eweHZZe0NzjStxe6N+jMKh2idtCcX0yVYiIKn+KrC7dWA/JPyS6dQZMmDLjGWGK4l5iXBaAHovxRPN7uHC1xOs4b4cqO2Tx3fWtUacegYXmPKuaaKLO+nSx0AOyE=
Received: from BN9PR03CA0350.namprd03.prod.outlook.com (2603:10b6:408:f6::25)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 22:52:50 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::f0) by BN9PR03CA0350.outlook.office365.com
 (2603:10b6:408:f6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.40 via Frontend Transport; Thu,
 15 May 2025 22:52:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:52:50 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:52:47 -0500
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
Subject: [PATCH v13 03/27] x86/resctrl: Consolidate monitoring related data from rdt_resource
Date: Thu, 15 May 2025 17:51:48 -0500
Message-ID: <cb8425c73f57280b0b4f22e089b2912eede42f7a.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a703a0-efa5-4958-3f90-08dd94033827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WurnsAgqXitgfDWKe8cyLnDx0cGACuXn9EXkQHi2D6kMjnGDuE9voHL0jpvf?=
 =?us-ascii?Q?Dt3tQztbKVnzJEwoQ3lH/JHCRJ+LQjuoNITc8DMl9LS/3/+CITNaEno8A/6Q?=
 =?us-ascii?Q?7qWdTFjzDsfbqYAlPJZyTSh/UVorYUcEcVM0yGNm6wZ3PvPn08A3SJMg/tmv?=
 =?us-ascii?Q?6bhsS0tAtL5VXWlZY6zQGX8/Cki9ZoFbQyz0IfqfWAfjmAFqIVmCN/jYD0O7?=
 =?us-ascii?Q?R8iWBuP4DDlAX8vwgPS/LcVA8DVTFD/2wTxKNl2NmZ1t5nnV+zO0wutb6hMq?=
 =?us-ascii?Q?4XrQVmFd9fqc2hadsbHQM/bW48lB14xVWtypfFzgf64leO0pEP2lt1cNmPYt?=
 =?us-ascii?Q?dGxzBsqcLSff0xAsbjOgZa05bDIKxIVEiPwYjd6J7+fyItuwM4GYMchlG2xv?=
 =?us-ascii?Q?Ww6pc2D8Sci8HHd7YgG+UAZ1AF17zRivfxfGkN8JUGp+SHPON4r9DGeAxYow?=
 =?us-ascii?Q?qb03o2IRZz50UEPjW3YHKR69lSYhcMBZ5dt2xEuYtPhu3s/k+P1TTg40iCcy?=
 =?us-ascii?Q?xTScvjMKKvG4L50s/lCqFLaHFKMVKKuSmnyIdj7fTL8N4x0I0PiRkvuJWZ4m?=
 =?us-ascii?Q?YbiyspyO7RWLnl+/dLcaOiP3KGWw9naZXNEI+vZYVKrw7xjZjz5Pt6odkGVn?=
 =?us-ascii?Q?EjZzkvJNB5kz7iDidvlE5cDfuTOzbvSit4L9emgW22Blub7ORiS+P84VZHPj?=
 =?us-ascii?Q?jFMIPK6SqV1ObV9b9CEkWHr2zpML9PQI0RpAmBGrX3PYQs48yFvB2gIMgQHN?=
 =?us-ascii?Q?1zDwIcasKXPKydMMK5egM0+JAG+8Q5PWduVh+DyuefL/Ow3TrcwX0egeGrsk?=
 =?us-ascii?Q?LVumKHrGShgo8EY6g9xCCcpIb1H9pAqv7TOzYqelIwB31EAyky+1qaeJq9vK?=
 =?us-ascii?Q?bXZHlwJ55wHA5JUKTByqVHaoIJdHg3Gcjc1A+8NVtH069QdZBLQjcUFsklfa?=
 =?us-ascii?Q?mR4/qEOuaKic+l8J/7K/ABGAh9AaCY85klkAJ4ygE2uLmaz/885qghMtQ7Eq?=
 =?us-ascii?Q?Kfx7HOHqkBg3k0TEZOB3o5karikmCyclWMk9NOxaFmZFpbYt2EQCTkIw8Vxn?=
 =?us-ascii?Q?Dfsv8+eoethuN22KPeLQh9j6+ZqDvIKCWSUrQiU2E0g4IpStj9nI+T3Z2eHe?=
 =?us-ascii?Q?EjIWzvt6RnRcOhScMCX1ZXWSitBcGndBM4hcTsqOPbWzrm8W9C69SMmUx0MY?=
 =?us-ascii?Q?4n5sJ5ncJCNV6zvYhFSGRlgu3P9HcS6pLUkC8NXn3SsJIYjxnPlKFSYLBNRj?=
 =?us-ascii?Q?b7yIy+n4SvrE0i71ispAzKu+EkFZpeVFPizMi6siXPfq/MUHaQjdcXo/ii6N?=
 =?us-ascii?Q?WZBd1XTLEKMZlrprIIxZ7NHCAe4/AZE0+Lco0svtnF/dANLTUeAyb/vOKLJy?=
 =?us-ascii?Q?fR3NI2L+Vh0QBP4tLI8iwqmksdoNCURVtLZ9sS6mOq9euXsogHbGbmH0Gkcm?=
 =?us-ascii?Q?tVSlsW7xFFS9mu+x1Y5L3rlbhNqrZ4iUVcqrQ0Ob8/xtZgDda+qZwow82+YI?=
 =?us-ascii?Q?loGvzhCbelhS7p80y59bnXQqQ1RClK5j5glC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:52:50.3960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a703a0-efa5-4958-3f90-08dd94033827
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544

The cache allocation and memory bandwidth allocation feature properties
are consolidated into struct resctrl_cache and struct resctrl_membw
respectively.

In preparation for more monitoring properties that will clobber the
existing resource struct more, re-organize the monitoring specific
properties to also be in a separate structure.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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
 arch/x86/kernel/cpu/resctrl/monitor.c | 12 ++++++------
 fs/resctrl/monitor.c                  |  8 ++++----
 fs/resctrl/rdtgroup.c                 | 12 ++++++------
 include/linux/resctrl.h               | 22 +++++++++++++++-------
 5 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 15a1dfa92923..6859566398d6 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -106,7 +106,7 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 
 	/* RMID are independent numbers for x86. num_rmid_idx == num_rmid */
-	return r->num_rmid;
+	return r->mon.num_rmid;
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -534,7 +534,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 
 	arch_mon_domain_online(r, d);
 
-	if (arch_domain_mbm_alloc(r->num_rmid, hw_dom)) {
+	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
 		mon_domain_free(hw_dom);
 		return;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3fc4d9f56f0d..aeb2a9283069 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -134,7 +134,7 @@ static int logical_rmid_to_physical_rmid(int cpu, int lrmid)
 	if (snc_nodes_per_l3_cache == 1)
 		return lrmid;
 
-	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->num_rmid;
+	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->mon.num_rmid;
 }
 
 static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
@@ -208,11 +208,11 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
 
 	if (resctrl_arch_is_mbm_total_enabled())
 		memset(hw_dom->arch_mbm_total, 0,
-		       sizeof(*hw_dom->arch_mbm_total) * r->num_rmid);
+		       sizeof(*hw_dom->arch_mbm_total) * r->mon.num_rmid);
 
 	if (resctrl_arch_is_mbm_local_enabled())
 		memset(hw_dom->arch_mbm_local, 0,
-		       sizeof(*hw_dom->arch_mbm_local) * r->num_rmid);
+		       sizeof(*hw_dom->arch_mbm_local) * r->mon.num_rmid);
 }
 
 static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
@@ -350,7 +350,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
@@ -365,7 +365,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	 *
 	 * For a 35MB LLC and 56 RMIDs, this is ~1.8% of the LLC.
 	 */
-	threshold = resctrl_rmid_realloc_limit / r->num_rmid;
+	threshold = resctrl_rmid_realloc_limit / r->mon.num_rmid;
 
 	/*
 	 * Because num_rmid may not be a power of two, round the value
@@ -379,7 +379,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 
 		/* Detect list of bandwidth sources that can be tracked */
 		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
-		r->mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
 	}
 
 	r->mon_capable = true;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index bde2801289d3..6ffa9d14a8b4 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -866,14 +866,14 @@ static struct mon_evt mbm_local_event = {
  */
 static void l3_mon_evt_init(struct rdt_resource *r)
 {
-	INIT_LIST_HEAD(&r->evt_list);
+	INIT_LIST_HEAD(&r->mon.evt_list);
 
 	if (resctrl_arch_is_llc_occupancy_enabled())
-		list_add_tail(&llc_occupancy_event.list, &r->evt_list);
+		list_add_tail(&llc_occupancy_event.list, &r->mon.evt_list);
 	if (resctrl_arch_is_mbm_total_enabled())
-		list_add_tail(&mbm_total_event.list, &r->evt_list);
+		list_add_tail(&mbm_total_event.list, &r->mon.evt_list);
 	if (resctrl_arch_is_mbm_local_enabled())
-		list_add_tail(&mbm_local_event.list, &r->evt_list);
+		list_add_tail(&mbm_local_event.list, &r->mon.evt_list);
 }
 
 /**
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index ec28228f6a8d..9412c7b64523 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1139,7 +1139,7 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
 {
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 
-	seq_printf(seq, "%d\n", r->num_rmid);
+	seq_printf(seq, "%d\n", r->mon.num_rmid);
 
 	return 0;
 }
@@ -1150,7 +1150,7 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 	struct mon_evt *mevt;
 
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
 		seq_printf(seq, "%s\n", mevt->name);
 		if (mevt->configurable)
 			seq_printf(seq, "%s_config\n", mevt->name);
@@ -1733,9 +1733,9 @@ static int mon_config_write(struct rdt_resource *r, char *tok, u32 evtid)
 	}
 
 	/* Value from user cannot be more than the supported set of events */
-	if ((val & r->mbm_cfg_mask) != val) {
+	if ((val & r->mon.mbm_cfg_mask) != val) {
 		rdt_last_cmd_printf("Invalid event configuration: max valid mask is 0x%02x\n",
-				    r->mbm_cfg_mask);
+				    r->mon.mbm_cfg_mask);
 		return -EINVAL;
 	}
 
@@ -3055,10 +3055,10 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 	struct mon_evt *mevt;
 	int ret, domid;
 
-	if (WARN_ON(list_empty(&r->evt_list)))
+	if (WARN_ON(list_empty(&r->mon.evt_list)))
 		return -EPERM;
 
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
 		domid = do_sum ? d->ci->id : d->hdr.id;
 		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
 		if (WARN_ON_ONCE(!priv))
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 9ba771f2ddea..2a8fa454d3e6 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -255,40 +255,48 @@ enum resctrl_schema_fmt {
 	RESCTRL_SCHEMA_RANGE,
 };
 
+/**
+ * struct resctrl_mon - Monitoring related data of a resctrl resource
+ * @num_rmid:		Number of RMIDs available
+ * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
+ *			monitoring events can be configured.
+ * @evt_list:		List of monitoring events
+ */
+struct resctrl_mon {
+	int			num_rmid;
+	unsigned int		mbm_cfg_mask;
+	struct list_head	evt_list;
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
- * @evt_list:		List of monitoring events
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
-	struct list_head	evt_list;
-	unsigned int		mbm_cfg_mask;
 	bool			cdp_capable;
 };
 
-- 
2.34.1

