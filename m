Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC1415382E;
	Fri,  4 Apr 2025 00:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725977; cv=fail; b=YOdkOmVMdkkdvo/Y1qJEPuDdPXECV4d3bL30Tic5EkESTKXJKOrAKTFGUWxHwHEImz3sb6RpvPoYJyib/yBi8H5mONuc52BKigZZQuH97XcqlmFJN186t1ZBhQInLhVaDW47C+TGTivqy6Y3xB2XqeJTrcG7TeWh8V2HLVNzswQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725977; c=relaxed/simple;
	bh=/X+C3aRlj/vC5G7u1K3F+FDa9yAaDW6SDSSlmlyFM/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kc8WglH3r3uPVfxjwWvusQADoUstAUQpQgE6iIj1wMTaVa308sJsFR4Nvkqb5Epmj6qZWhhbRtFhobSeRffdAt9S2vGuXjs8cZzbr78ke39DpuvGWNqWJ6EHkApXbP0Fle2y4gI8CtXDzOPwtxz93+JOJXBbZUTZUIFVrjp0eLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YMB+5BJ7; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YMB+5BJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAQqqaBOVIoJZsSSdHPMwJu63UyQYG8Mh9NMrIeNomws9nbjrkV0zAph2ajZJuot/I239TJNCFVZ+KBuI9eRHHDMMaX+OSQ7ie3w1tIO3sGuUdg6PGDw0/VNbuvNXKEKuiFfOqJlpaf+rT79HHq+a71AodiRi/dUNIJStMVimva5oKDKm9H31E7aJPGvaH5yAd3vm6TS1+SFwVvuPrmPy3TKEma/vnQHutEHY+l0ZVe79K8LhTujv0UI2ynoQTh5sc7FSk3hAcoTUqAjtTH+PnkATwP1Shag40Qw8RR1wZCTMkmCypOfHotDI8C9l4RpayPr/hoKTfWT9mclIfcAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjDlUdz96PntVZPv9BvGMUH7FzKjW5vLzA5RJ+cGiyU=;
 b=e2WqpyFWSmN8m5XMLXjR9aeUo6xdsInIderyAz4PDpaun38epXQFhF5Pjos2Hriq1yqXTdlPWYIWMNSITXb3CHza2v4L97oejekvgsIhg/8PSocd0h6pEATGybef5tcgdwvoUDpaqTTvmJ0LI0cbyJfa8wHRTqr3yVU2IdZrMAPcghsHhe9ow2eChFPnv2SJ6KxqZiSTzYesFfhr3GH04uRVyfoy9cYH0NAqGKnMwC89TRIpvt6mTq2tEs2fMIQvXqRaQ5z+ZOpyiey0MOVNCwisvJcK9SpIqpRUgPikhNeNd88xnzTRNDl2OQrXQGDjUxv+g5LS8inVWM8coCwhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjDlUdz96PntVZPv9BvGMUH7FzKjW5vLzA5RJ+cGiyU=;
 b=YMB+5BJ7zNfIXGdAUUPo62Ozme2tSlfx7Ct0Q3XGpxopzXqSPnm039kk7oo3EorBM/AoeVj3OWooHI+c7Q2ijeJCAAY4yy7ZgMW0KRfnMoQTbD5M9p0/jrJwSVA0ds6YSUivdqeAJq2co4AubqIqfN+ezb/zYzx0MWdwbI7Jt3Y=
Received: from MW4PR03CA0229.namprd03.prod.outlook.com (2603:10b6:303:b9::24)
 by CY8PR12MB9036.namprd12.prod.outlook.com (2603:10b6:930:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:19:31 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::2b) by MW4PR03CA0229.outlook.office365.com
 (2603:10b6:303:b9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.47 via Frontend Transport; Fri,
 4 Apr 2025 00:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:19:30 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:19:27 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 05/26] x86/resctrl: Consolidate monitoring related data from rdt_resource
Date: Thu, 3 Apr 2025 19:18:14 -0500
Message-ID: <9d94d65fbbbd514a60bfa43f7ef1436d8d8255dd.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CY8PR12MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: 192921ee-dc18-4c32-20b5-08dd730e5ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sm4XrpXR18VLdk7xlMENtN6yVaKexL1H4Vj8Dv3IZPsoVU5yLfWT8J6QLXDk?=
 =?us-ascii?Q?4zl5zRhhl4Ln2ep4yCnu/Vxss/SqK1Wu2jNRjHBBCOPEdTzO0Yi4ol7GGksP?=
 =?us-ascii?Q?4aIlKLwvElYVQg891dngjb5EtyuI1pOJBLwjmLelrWuFXJGs6WTC3iwtDmRS?=
 =?us-ascii?Q?dEVCOA/vpgnKfD7zqC0o05XRld374SrwoNSe9X99E2j90yO2yl4+ar1OVKLb?=
 =?us-ascii?Q?XMUpgl6sBSdxgbGQcVOX9d8KBlZmlqFj9M7QD7rMos0tHYqaTnEjdVHM770i?=
 =?us-ascii?Q?hJakhv2+KdsxWBtlIDohFDryJkrPv5xBP7hTd4AqY0NTEOw/e4rVmuH/E8LV?=
 =?us-ascii?Q?8yqJlJNIIUqLbwP9LpZ9MMojYVkYj9gZJs/+++LuQfDYKE3q5wAx/poaD7H5?=
 =?us-ascii?Q?LE8lPaFp3makWn27zbxRh7NhHcOZ+aOZcmd183A2Ww/rr/eWr1Bs6GQqOWVJ?=
 =?us-ascii?Q?anMHGPkMHGU7+0NtTc425Gia/wQEKjEclVz+zNS2XpzQisKTS7H18cEdOaf6?=
 =?us-ascii?Q?akQ9CV2lFF7AmZx0hCiX7pItnZsE9BGK5i7bxOY8M6Bv0QSo78uuWHVYkzUe?=
 =?us-ascii?Q?QcS+FLX+mFBeTL2CLGcmMMndLl3KBQg5gj85xRZvvouzgPwCD1MqTxog5khq?=
 =?us-ascii?Q?5ucigX4sQ/otbcxAHn7lTWHUdhcCoZ5mTGvWV7nKOX5BV5ZIUg2CXD3MG33h?=
 =?us-ascii?Q?WJSvfuzCBALJsAt+TEeRNm294ID6hmrpQFVsQGnmt3oCOGo0gbaU5yJuL1JJ?=
 =?us-ascii?Q?fV0+8SferXDb/Blw9p2EzrFZhSemmBNiD1RUPgbq5SBtljrKKXMatQXVcqwe?=
 =?us-ascii?Q?aQLf9Pn1q3hMLOnHnXuE4QG9MyUtcks4FWP7vjoBbCBrL3DlDPCS1HICzYaR?=
 =?us-ascii?Q?7KI8d1kddTNaWlAm2cxgryHLgQQN8SZcof+BBM2r2DSaJu8slZmI6JZqbGFD?=
 =?us-ascii?Q?z7fZ2d5U8X8QNjLIOB97LmeP+xeTmJE7GUCB7PgywI/2E7mTfDQuBZaxOADm?=
 =?us-ascii?Q?5NVcb9vFK0mv3DT6u2Fea4Fu70SZ6lWxrEsnMm/RsCZEEYx0KJiw+fXRx1e3?=
 =?us-ascii?Q?Nzo5uKA/qWc6JcsGD7/9FKaAVtZOKBMYKfDAXbHcBmGKUDdProEbJtHiFzXe?=
 =?us-ascii?Q?zsFynavFozGhL8xwfyis2JiFNaDQJVPWheQWDXM5wOdp5tXAUzUay8zvu580?=
 =?us-ascii?Q?NDez+Cf3o46TuHSxd98xwyClzbB2dcwMVK0+b7NGZZwZzuf0qFWaj+CNFryi?=
 =?us-ascii?Q?c24xosaNy7aHg/BWnsSEQHH5Zk1lKxlgxWt5A602PnqfJtfRe/ZgC4BMT6Ua?=
 =?us-ascii?Q?9bh7X21qqj/c220/Q9UpI1N7iUHiakLrtS+zsCtJ8GlOdEdwl4SImGFnHQRf?=
 =?us-ascii?Q?1o7rc0pPa36TU25zDlxCF4cSzPv3o1Cn7DhTUv+GEMQsTJbkPkV+HaLz5sDk?=
 =?us-ascii?Q?FiOw2aGuSKvjGUy+JLkPilufxegE+1moWiAMRNhujrMSxDcvZ7oQeYTTlXNP?=
 =?us-ascii?Q?Vw43QFwwzMa9XZc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:19:30.9729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192921ee-dc18-4c32-20b5-08dd730e5ea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9036

The cache allocation and memory bandwidth allocation feature properties
are consolidated into struct resctrl_cache and struct resctrl_membw
respectively.

In preparation for more monitoring properties that will clobber the
existing resource struct more, re-organize the monitoring specific
properties to also be in a separate structure.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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
 arch/x86/kernel/cpu/resctrl/core.c     |  4 ++--
 arch/x86/kernel/cpu/resctrl/monitor.c  | 20 ++++++++++----------
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 12 ++++++------
 include/linux/resctrl.h                | 22 +++++++++++++++-------
 4 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 5ac1fe79a030..16f700c2d00d 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -110,7 +110,7 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 
 	/* RMID are independent numbers for x86. num_rmid_idx == num_rmid */
-	return r->num_rmid;
+	return r->mon.num_rmid;
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -553,7 +553,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 
 	arch_mon_domain_online(r, d);
 
-	if (arch_domain_mbm_alloc(r->num_rmid, hw_dom)) {
+	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
 		mon_domain_free(hw_dom);
 		return;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index b84cd48c3d95..38970096ef3d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -222,7 +222,7 @@ static int logical_rmid_to_physical_rmid(int cpu, int lrmid)
 	if (snc_nodes_per_l3_cache == 1)
 		return lrmid;
 
-	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->num_rmid;
+	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->mon.num_rmid;
 }
 
 static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
@@ -297,11 +297,11 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
 
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
@@ -1099,14 +1099,14 @@ static struct mon_evt mbm_local_event = {
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
 
 /*
@@ -1247,7 +1247,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
@@ -1262,7 +1262,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	 *
 	 * For a 35MB LLC and 56 RMIDs, this is ~1.8% of the LLC.
 	 */
-	threshold = resctrl_rmid_realloc_limit / r->num_rmid;
+	threshold = resctrl_rmid_realloc_limit / r->mon.num_rmid;
 
 	/*
 	 * Because num_rmid may not be a power of two, round the value
@@ -1276,7 +1276,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 
 		/* Detect list of bandwidth sources that can be tracked */
 		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
-		r->mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
 	}
 
 	r->mon_capable = true;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index b8100c89f1a6..17de38e26f94 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1134,7 +1134,7 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
 {
 	struct rdt_resource *r = of->kn->parent->priv;
 
-	seq_printf(seq, "%d\n", r->num_rmid);
+	seq_printf(seq, "%d\n", r->mon.num_rmid);
 
 	return 0;
 }
@@ -1145,7 +1145,7 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 	struct rdt_resource *r = of->kn->parent->priv;
 	struct mon_evt *mevt;
 
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
 		seq_printf(seq, "%s\n", mevt->name);
 		if (mevt->configurable)
 			seq_printf(seq, "%s_config\n", mevt->name);
@@ -1728,9 +1728,9 @@ static int mon_config_write(struct rdt_resource *r, char *tok, u32 evtid)
 	}
 
 	/* Value from user cannot be more than the supported set of events */
-	if ((val & r->mbm_cfg_mask) != val) {
+	if ((val & r->mon.mbm_cfg_mask) != val) {
 		rdt_last_cmd_printf("Invalid event configuration: max valid mask is 0x%02x\n",
-				    r->mbm_cfg_mask);
+				    r->mon.mbm_cfg_mask);
 		return -EINVAL;
 	}
 
@@ -3117,13 +3117,13 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 	struct mon_evt *mevt;
 	int ret;
 
-	if (WARN_ON(list_empty(&r->evt_list)))
+	if (WARN_ON(list_empty(&r->mon.evt_list)))
 		return -EPERM;
 
 	priv.u.rid = r->rid;
 	priv.u.domid = do_sum ? d->ci->id : d->hdr.id;
 	priv.u.sum = do_sum;
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
 		priv.u.evtid = mevt->evtid;
 		ret = mon_addfile(kn, mevt->name, priv.priv);
 		if (ret)
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index afa9aabf014c..f31bb48f2b1f 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -241,40 +241,48 @@ enum resctrl_schema_fmt {
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

