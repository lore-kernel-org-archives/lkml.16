Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7255428E5E3;
	Thu, 15 May 2025 22:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349587; cv=fail; b=piieC79lCVd5OMsoGNf3uErNyOPK227/sI83XxXsNQDVpjjaFEV9R7YwAfcCxC6DZY0flIj/acZ/2vLPBr7+x2FsULMlIyJI+2HBbJoKssaEiHfCx4pXRs22A55blVllMAqP5oUKWSRdi7YoaC6Y9u0AwZA848jffAtfXGrw9b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349587; c=relaxed/simple;
	bh=2RH+SkoZXqohLg/zSDlrqEWMmiVWQ4gamf4smxLYl8Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sfx2Eos2PB/wa1fuUoTo/TJaP57qej/bh31SjRHQqmZtYpRVTUw7ETuHmOYpRa5adcSRY/UGNr8kzrJ0wkeItVLMgKSXf95dw8nYP6EbpIQ+b+w1ioy9812KmeF5snHB5pcIZIlGmRBevnJJtwwCNYspV/on8V4DaB82cWORXRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5gWm+m7s; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5gWm+m7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtjLm40RKymZAkljDkZNCIryb4dO76d0+a0RyzbXXYTzm6A+/M9TxIStN5HuI3zKCsXlJkQgBK2bnuA1Ql2OoCZn8Ci4WAu1WrOLpmZjg/v+Ym7NBPoh8pZqWXeYGVCua72zUOwKV2ZXc3dxc7jsc0vmnHeB+0SqxWNk1vySzGfqLYsyJkvKs2g48ue8KYh3gYt/uKlrEiHwfFLcUBK0UYGHn9ptYmdJg7LgbHUdIf9FgSHxc1CRyutmXU5HWDsLZczJcRNFKmPpyg9fAVZEKfYkv0eJV3YP2BdZpMmXtwz3c2qgbqZfg/I2cKy2sZG/wwRRMyR/UbVxgmFD5arHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+E4W8NtiFTTSqcn4AqDvt5+bB56hyjI1wYqqU2Vij0=;
 b=aPm7aO6vBsmXUaYRWF7tcCCFjhO6iKsd2qn6jKUfSXT8koPPrvMt3yL8ef75LOr06Vkxsg64HRir7RnNSLR9ACoLGDwDOuudfZXHhEP3CoaTZQOLM+BPOeLrcJTb1xW2bWqY1S0DoVlLolAVltOuVqYh/BhHWMayypJb1JX/qtM2cBweLUYPBOe5/Cnj6MJSWwVIm6PHpv6RbNlQa3jfhu83e8wXlfJzJDh9qJ+bXgtsvMJG+PSR0L+BTNuoBK6+Ln+7hE2AMIEfaxr1wYWg1uyrwXR5HNPW7IKHrZCvMLdEAOcVswjUMztEYHn8XsFQPZ1Z2ow4QyCS2Yz4K+WvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+E4W8NtiFTTSqcn4AqDvt5+bB56hyjI1wYqqU2Vij0=;
 b=5gWm+m7sry2zI1Hw/pMb1nXwV6amgp3qckXyGy87ewbRXhS3tYXkULI23t2SPl5Lq24qauvE20dh4JU9vaUgs9/a1N73oGSljdYZ+jlG2D77I6grgcij5znsVrrU4soBbbpstigu4D89gZqLMyEOnGON6Ll9n3cjYlr4yJhY5kU=
Received: from MN0P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::10)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 22:53:00 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:208:531:cafe::2) by MN0P222CA0009.outlook.office365.com
 (2603:10b6:208:531::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Thu,
 15 May 2025 22:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:53:00 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:52:57 -0500
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
Subject: [PATCH v13 04/27] x86/resctrl: Detect Assignable Bandwidth Monitoring feature details
Date: Thu, 15 May 2025 17:51:49 -0500
Message-ID: <a4e2388b708883874adcd621f50f773484945489.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: d74bfda9-9734-4866-1010-08dd94033de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DwI43Aiusi2F8vzfT+jS+ke5nT+R91HGcUv9Y0tVZloAZeLwDXrXeIkUYlMJ?=
 =?us-ascii?Q?k/iES00jTisYsSiU+t0X+nhSroZQXvrbDlYeX5NZBPLfMmzddPHN9p/RA9ln?=
 =?us-ascii?Q?Arh6IXpzb3pAXVz6m4LHxFvdTbiU4RrfXiUQe5pH3BHNJIW2pi+IPLTvuYdF?=
 =?us-ascii?Q?+GhONJfyk52n/i/ATtjAywJQMEKHUpLrCOuIRTMYtbhsxcW+R/1KmqXxt8bN?=
 =?us-ascii?Q?G7x+oLSkH41n7b+C9ef1bFmMpnlGkfuvZkL6rb9U47R46LVU1WG/MbdCubT4?=
 =?us-ascii?Q?4CJrihkIMLi0MhkFQVmL2nPvcOF8hjJISUX1+0zkLqKD9OiInPuANeX+aQkQ?=
 =?us-ascii?Q?NQoWddd2pbwdS8x0w42k1qylIDn5TC3nYd1JAngNc2N4Yv4PAgQqkOfmyB+Y?=
 =?us-ascii?Q?A1sor/tAQG4CbVSA2gbAsKGmIBDIMKzonw/YffVM9cLU0fYUDbcfgkAky7gp?=
 =?us-ascii?Q?YEDZqd9hyYlJiuGPhcyUjVi1dyd080gPi4BvSy8iX2adUh5imdAmRp2EdCNy?=
 =?us-ascii?Q?vKG1womdismTLYOinHDLAUnYNzwhOVgZ6qZbNVAVdqkTQMcF3rq3MZ75LttO?=
 =?us-ascii?Q?X6x0ExglRX0OMHNEIVN6ZZR4V0ZKc83FqUsnlKz1VfJLt1AuSKfqtNbmb/QK?=
 =?us-ascii?Q?CAITUQah1G9tyARc4cxbqh2inuE7JqunRmA0PNlyuL9jeKKjRZUxpz56pUtA?=
 =?us-ascii?Q?1EIEYDeVbdhAHzNB2PVLQgVJOTFCyGWWOGMM8j1Iz7+C5RIr39sHr1WO/3LW?=
 =?us-ascii?Q?V7+a21VCDy+ifB7dr37pMWl3cwczbRjQVquOG/FKMvTnGp2WsiHtZtdku4rc?=
 =?us-ascii?Q?kNfVqpnkLmoxW0eA1csY5ZThfs2Ue753bBD87V/Ef/ifJtXr5crVQCuhYsLp?=
 =?us-ascii?Q?SGQtmF2py/ygumSmFxCX1mZPfgHpJrTs+4UXdnN9ZCoX0hpuZnfRchZbitaJ?=
 =?us-ascii?Q?yzzN8YHknsbs5QOZWVKnakpE1oY1BeL+rNQzE9K0m6pvtVp2pzfB+8oeSrhQ?=
 =?us-ascii?Q?tVD8WduCi95WiIq7UtExbrhMEXwsP6Qddf/rZdhJqEonETS8lMEOZcngtw7I?=
 =?us-ascii?Q?rfjvwzuxpZ2N5VsA8by6CzJQjPWvKxaj/KA9a32l5sMp+jLLAd2eIZnLUupp?=
 =?us-ascii?Q?9NO4uk49dfbY+mCBB5S8uTXSPO3PgitCE6TTgpSOSx+Mt6LEdxuVqwi8hYY3?=
 =?us-ascii?Q?+5h/MBvRvPhf1yiLgqa/TBnowOq//JHhUrOmXYbgMG4X2j+35sJhd61raroI?=
 =?us-ascii?Q?YuG/bGmrSeZFb5mz7/rAVJWv0c3a5FsvCqmSc/el1vvrIVGCB/zfGx1Nr/vw?=
 =?us-ascii?Q?rwOHD6Kyk+0qtuqiBbHeeZOFAEx9sjPISF57oX+qIRtNnvEwTHEOhnnR33Bh?=
 =?us-ascii?Q?S1AoXJwKGrSJiJLHFKwallChX8RJsrED8b1kObhgMTKClnMkWW90Br2Qt1dx?=
 =?us-ascii?Q?pJL6jpbbUKvx7OwDgybMfCW5jwYmhspmE8SxUVQt3gjuI8thKx5OuQ4UJhnI?=
 =?us-ascii?Q?GPlGuMTZc/0EU7pNMtMDFCkH6ebFfl5L6I1oP4KokO2xIZVjwy6S4Z/hgA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:53:00.0340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d74bfda9-9734-4866-1010-08dd94033de6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305

ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
Bits Description
15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
     Monitoring Counter ID + 1

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Detect the feature and number of assignable monitoring counters supported.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: No changes.

v12: Resolved conflicts because of latest merge.
     Removed Reviewed-by as the patch has changed.

v11: No changes.

v10: No changes.

v9: Added Reviewed-by tag. No code changes

v8: Used GENMASK for the mask.

v7: Removed WARN_ON for num_mbm_cntrs. Decided to dynamically allocate the
    bitmap. WARN_ON is not required anymore.
    Removed redundant comments.

v6: Commit message update.
    Renamed abmc_capable to mbm_cntr_assignable.

v5: Name change num_cntrs to num_mbm_cntrs.
    Moved abmc_capable to resctrl_mon.

v4: Removed resctrl_arch_has_abmc(). Added all the code inline. We dont
    need to separate this as arch code.

v3: Removed changes related to mon_features.
    Moved rdt_cpu_has to core.c and added new function resctrl_arch_has_abmc.
    Also moved the fields mbm_assign_capable and mbm_assign_cntrs to
    rdt_resource. (James)

v2: Changed the field name to mbm_assign_capable from abmc_capable.
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++--
 include/linux/resctrl.h               | 4 ++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index aeb2a9283069..fd2761d9f3f7 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -345,6 +345,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	unsigned int threshold;
+	u32 eax, ebx, ecx, edx;
 
 	snc_nodes_per_l3_cache = snc_get_config();
 
@@ -375,13 +376,17 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
 
 	if (rdt_cpu_has(X86_FEATURE_BMEC)) {
-		u32 eax, ebx, ecx, edx;
-
 		/* Detect list of bandwidth sources that can be tracked */
 		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
 		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
 	}
 
+	if (rdt_cpu_has(X86_FEATURE_ABMC)) {
+		r->mon.mbm_cntr_assignable = true;
+		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
+		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+	}
+
 	r->mon_capable = true;
 
 	return 0;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 2a8fa454d3e6..065fb6e38933 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -260,11 +260,15 @@ enum resctrl_schema_fmt {
  * @num_rmid:		Number of RMIDs available
  * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
  *			monitoring events can be configured.
+ * @num_mbm_cntrs:	Number of assignable monitoring counters
+ * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
  * @evt_list:		List of monitoring events
  */
 struct resctrl_mon {
 	int			num_rmid;
 	unsigned int		mbm_cfg_mask;
+	int			num_mbm_cntrs;
+	bool			mbm_cntr_assignable;
 	struct list_head	evt_list;
 };
 
-- 
2.34.1

