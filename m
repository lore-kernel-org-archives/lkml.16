Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B945822AE45;
	Mon, 21 Apr 2025 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275480; cv=fail; b=e9G9/rk5FlvBEL4p1JXOEEQIBNbOheVluSziZ1BpudhafoJ+a7FkeSitipm1/bK+EmVkVvnk36OamtTfmQOvVtiPUbH1bGDyCwrMoaDlLhR+rRnqdNsqsZJ0JBsLTSF8zOZPXn5qpTu4oH9Avg3LptUASXm7WU83BduE1/3iICg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275480; c=relaxed/simple;
	bh=uCVF57ni0HZdyTTdOlyd//rmXuCdQP1naOGs688u7hE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8VhafzSchDOTGmz2A2SLeMul1aTKTy8SzcyPL+AikjzKSty0CI23U2at/K0V8j6hB+sOePvWQV+7GMJ5z3/ioZ1nwr4a13YWPmbIeQUur9fsFiNo58Scodh2uvgKd0yE+DVzbrrR+QYUJummIbHokSk66aWXdV27DIHXMdxB7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j37QwoCh; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j37QwoCh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSKe++My4Mm10QVpOgoJna/BWLdvn5u3qikbZUrHRki1hXIZm/TYW66R7nbK+IDtRkdLl2vU4CvQkSF9yIRElBogV2DHGWwAF/fs/PoBwa4inz/g99o1Rj3Hel8sGmCVUKWfaPcIEWvIYDZ0U2/2g96+u0kRT8gKdBeDvhyGSsp1p5+f820xRg6gpo8249Mhv1BkB1pyL1GGeWIGJPE7irH05LDMwa+qeIzqZSyTpZZI2rwno/NYnwNLoXrxLOaVcnVeGH6SKOMCtGZuzqB+l4MQVrQVuUQV1kt2ngpDyCk/eM8suwTLL6omrNAy/OUC5X8g5Gj8IbmgAH6Z8Om0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlTuez7BdzYkslvzEpPS+FFIE2p72+fT5pg6yF0/ILg=;
 b=vB7KHVMyiI5hy53hEKDaB3bIpFzCb8Jk9jt8N9jL1kIElm6JsGyOg928QeyJLIo58dKhloVoexQ7fw2L3VpKWziQ++E/Pls39BCGGDKMMvivY+7T6EVIrXMny9J1JevJQX1mgHpJ84GXA+UUYJ2NN8Uhbwzn28aaozwPkANWwKSoCQ79lAgs7XJUnMKNQuSt8NbAsRRm8/uOF9aP6yxaTJd1vMZdxmSeX8NdXFc982fniuqjGpcsSSP5Pt2SlAm0CAaB/lfwphT0zEF2ySeAPkKObDiMPS0XzE4L2qA7Fmi2QS+gCizEqPfEhTa++cjPUbeTvxNCZLyCjyQfx61YYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlTuez7BdzYkslvzEpPS+FFIE2p72+fT5pg6yF0/ILg=;
 b=j37QwoChEyApbynvMojwqFqC8yHOWwldua4rbfPWldmMXT0uwbtTuFXkUbWaATOz+2915smpIM65VrUmW4CXfUEi2jKsZ/w7iDcPPTpZf5EfHhBy4O8qVymjXTTR11TjPbQv2zL6qZwT3sn71KnTZW/qdxiPUPK/VB72P/4Wivo=
Received: from BN9PR03CA0692.namprd03.prod.outlook.com (2603:10b6:408:ef::7)
 by BN7PPF9507C739C.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 22:44:35 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:ef:cafe::68) by BN9PR03CA0692.outlook.office365.com
 (2603:10b6:408:ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 22:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:44:34 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:44:32 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
Subject: [PATCH v4 3/8] x86/resctrl: Detect io_alloc feature
Date: Mon, 21 Apr 2025 17:43:47 -0500
Message-ID: <6deb9ff5a89aaf793ddc0d5a08ac036400cc9c4e.1745275431.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1745275431.git.babu.moger@amd.com>
References: <cover.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|BN7PPF9507C739C:EE_
X-MS-Office365-Filtering-Correlation-Id: 76af3e2b-08e8-4225-157a-08dd812616d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yRDlEUVbQB8owpJUdzvEC4LbHs5ke3OxHVz9k61RdaPh2cpKwZY2CLboiKId?=
 =?us-ascii?Q?0mQpod+7XGY/DaJDuFwifrcGsTzteAE0C5IK4+5o2BDqn/gN5xJWJjz1s+lN?=
 =?us-ascii?Q?0e0oqey+Y8GKdSEIgyCiqRBB/0d87Ou9Z57BMiDu4HwWG5RNSqylvcqrHbKu?=
 =?us-ascii?Q?fPMdq9iJzExHaePhhAog9TQGpLxfO9fPjwZaczsRy7Rv4gxyADBkeX7JuENP?=
 =?us-ascii?Q?3biQwKWKT0JYeU0gzg7aq3i61ZirqhUCY+dJgye9sJ+pbqZ0BF7yYwCYdDlE?=
 =?us-ascii?Q?gbzPqRAYbMmQiZdxdc4S8MUiE/bxiJWGxjsTc4M0RwvTjVIFnxf3ohiF1eXn?=
 =?us-ascii?Q?GQjD8nzoczmNtJxdv0TeiZ6WoLWmp3veEk/YbwHjHi/FRFd9ACGPkT7zIltl?=
 =?us-ascii?Q?/zVOWfwHveDzzgYOD9SZ1g4nLo53ol12Hi7X4KK2nxIjgnOndSDUVYo2Dmkp?=
 =?us-ascii?Q?Pa3aQtnSk4MnkLlG6Dg+jINnI3aIyaL2E1im2b59CTOZGKt8fzvN4QAtmnTx?=
 =?us-ascii?Q?9XINjuBvAp6lYuCIeZouIHluIGie1QPpnFNV2fOobq63K52zmWf1TwJRmob1?=
 =?us-ascii?Q?UMy22dVKQk+mePwWWFhCznBVs90cCgy0FfTXqj9i8uMzNlQGachq/YgG9fCa?=
 =?us-ascii?Q?qT6TwpYY6TKumId6BKittP5iL54BZOObXOszlw3/crcXMqgKFgxowvUgqXZT?=
 =?us-ascii?Q?ykyWrz4Izjeq3wiyejEwQFmQYLrlk4LrxR0GiHjjCeDdbAyiHMbMC4cJLiaA?=
 =?us-ascii?Q?VtptDqEHTOkN6fyq2mPwdklcL8xmcTVoDTCLN0kjIc9h0lurUBxWrIp6M0+/?=
 =?us-ascii?Q?PPpX/HhytEsLNzxgJuf6jCfkHlyyODJ3sRJMGSBTp5a2CRbv+QgNHX5Jvkq6?=
 =?us-ascii?Q?8mNIynxnjnV4DYNZgtfmoC+PXsrAlO/WOaDYHGBIfmYr5GUhK3LdkFYNJqSA?=
 =?us-ascii?Q?2P8iQjke0Yaa03bI+o5tg18PgoHtFqjG9DGehkNaeNDol3Mjqf02c5/T/4GC?=
 =?us-ascii?Q?RccpXu2dHx30mjLnIOnTNECSy3MdnGLwRV+k2agb4o3RdgxYqM8pup7lfcHe?=
 =?us-ascii?Q?oOB5/9PCV1Mgr5JgxUTBF5tAN+LBlF8RpeTCVIsmmLeo3xFffPY5z0YeBlVc?=
 =?us-ascii?Q?KMDVYzVvZtg9NQWEhdtGBbmHUNEaSzhdkt5SYs0bUsnOFuPFRSZWJPI+/H0V?=
 =?us-ascii?Q?Fm3/o5t7VOgAkKI8KvRfyGm6fEy945RoZ0Dc8OIYJ7qKnh9w+wMLhhzESab9?=
 =?us-ascii?Q?x3Y3soHQSaw2kRGeSN1bWL4ugLyU5j1NkCyeLfyGoQrQ0Tr4MXW2WH2s8XyZ?=
 =?us-ascii?Q?azFPCQ+hud5Vf8JuBfyVnDxdCJszGHxHCFuKar5/cmfVfKyv39yuORi4yiw7?=
 =?us-ascii?Q?NjreLRGxVJlpKQF6YSCyWGFzV4c2wYg90JOAxjzfjh3x9GJPRb+G2YbJDoir?=
 =?us-ascii?Q?9P7UsFDnXH4ACJMIuX7UV4H9S67p+1QSVspDDo1I02/mt8L90QFZeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:44:34.7804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76af3e2b-08e8-4225-157a-08dd812616d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9507C739C

Data from I/O devices can be inserted directly into L3 cache. This reduces
demands on DRAM bandwidth and reduces latency to the processor consuming
the I/O data.

Introduce cache resource property "io_alloc_capable" that an architecture
can set if a portion of the L3 cache can be allocated for I/O traffic.

Set this property on x86 systems that support SDCIAE (L3 Smart Data Cache
Injection Allocation Enforcement).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Updated the commit message and code comment based on feedback.

v3: Rewrote commit log. Changed the text to bit generic than the AMD specific.
    Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
    Removed leftover comment from v2.

v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
    Also moved the io_alloc_capable in struct resctrl_cache.
---
 arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
 include/linux/resctrl.h            | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 422083dc4651..c478f591b7c1 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -292,6 +292,11 @@ static void rdt_get_cdp_config(int level)
 	rdt_resources_all[level].r_resctrl.cdp_capable = true;
 }
 
+static void rdt_set_io_alloc_capable(struct rdt_resource *r)
+{
+	r->cache.io_alloc_capable = true;
+}
+
 static void rdt_get_cdp_l3_config(void)
 {
 	rdt_get_cdp_config(RDT_RESOURCE_L3);
@@ -858,6 +863,8 @@ static __init bool get_rdt_alloc_resources(void)
 		rdt_get_cache_alloc_cfg(1, r);
 		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
 			rdt_get_cdp_l3_config();
+		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
+			rdt_set_io_alloc_capable(r);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 880351ca3dfc..dd09bb9a173b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -177,6 +177,8 @@ struct rdt_mon_domain {
  * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
  * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
  *				level has CPU scope.
+ * @io_alloc_capable:	True if portion of the cache can be allocated
+ *			for I/O traffic.
  */
 struct resctrl_cache {
 	unsigned int	cbm_len;
@@ -184,6 +186,7 @@ struct resctrl_cache {
 	unsigned int	shareable_bits;
 	bool		arch_has_sparse_bitmasks;
 	bool		arch_has_per_cpu_cfg;
+	bool		io_alloc_capable;
 };
 
 /**
-- 
2.34.1

