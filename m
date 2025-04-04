Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA115382E;
	Fri,  4 Apr 2025 00:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725985; cv=fail; b=Dzs/1SZrta/i8SNmkbUlpirfiqSasr5E3c2YDwnfVJk9Zbwwgm8xEqVP0ve9oXIXTBNJdxioLiqiWnax1PQbp3wFTDZbWKqMeTutgWrtd6FAeYBEMQQybYnVPy8CKTN77jT7oYJ5RSV+aklvGSQSfnq8Dfx5BHeW7RhoeA7aAjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725985; c=relaxed/simple;
	bh=DINMcUH+i8BGfR0gT+4yGQ1oULMNpECHYH92dBf8O1U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OkId6bqyrAe9/fYLKNMrVXZLgC8jPkgNTebmMl5ypUt4zPWBLcGFMN4Y0q26ToheHpyompkRwUY39BlF8vIfaEpqHsm22+7yOD1gmivUPf4wq5uX7wWWXD7gdrcfcTG1TmducN4f2V20C4foJMLHM/faqlGUJRwiYJz92zDIG0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GkTcEq3T; arc=fail smtp.client-ip=40.107.93.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GkTcEq3T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5xn+4hGIwE1kiaYZuVv4u9QVIR7ylOpkW5bws4IjErqXOM3OjJe1nzee2RG0kkyb7E9GZKlWjBwFdkNa4oHHYkkYtY7gjcawp5723qFcnuviUdDS90OllztjM4H8uepNTWYT4CLKfczQi5U4QkiPgYIZ9cAW48/LaX1i1mnJDxSEIgrEHCj049wDtFdnDsyWSxnkvNBaJr7enk9e8+OoMYkdJRYifka0mhC9aJ+XSXvuRO7ccStjKdnIojegin8g2qO2X3iLeiM6Wlx7Pdnn4FHg+lfcM7PscDm0UvaXcsuTBfBBcCFJhX44sC90OQT9bcihXJIurm0OpeYisMn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E53Itn4WC8Sr+s8/AqehfYj6Sl30PbeYyusHa+eOmrE=;
 b=Ouy+MSU9MqBAZEIf7FLPaw3XEnfEXclYq3a6CGGmrDw0CeDli5jB8qDFpgPw+e2RWS2GgbWH3QZ56uc4vJjSKCvPERvB5uYtiV2k1N7VmYC00Ewmsvxa5hsr3fewWl3ndIYtMqiyEDRs1LH90Y0ZkcwdqmIFh5F0Q0oiKgkL8e/5pfeyG31Vs7w9ab6CHVB2ALouGsT/eniSpD2ztonc3Q2iAEFNSnlF5A75rMZnGTflz5VN4vAYnWtxAdyA2oQ9l/+LRxy10k66R9AvQ2lWO7HqlX9hawVvlHwg1h8m/41tKiHrQdpACG+bNa/7Q3wi6009TwUQJaM2wN1Pw6Gv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E53Itn4WC8Sr+s8/AqehfYj6Sl30PbeYyusHa+eOmrE=;
 b=GkTcEq3TV0l3wVrAko+7DmZwWEBZty7cFCIQC8AGh2NvfMXh3+XmKXVv99vgM3NxAdrOuUpOMBqZ4mY6KlL4jv33Boi31AYbyYi88kiCG9hmo1pXQjvWSWqil6HTE9zjtuX9rMqMydpjUmq/hQK1Pxmrod8OYulYb+egkUP0blk=
Received: from BYAPR07CA0058.namprd07.prod.outlook.com (2603:10b6:a03:60::35)
 by SA1PR12MB8887.namprd12.prod.outlook.com (2603:10b6:806:386::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 4 Apr
 2025 00:19:40 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:60:cafe::9a) by BYAPR07CA0058.outlook.office365.com
 (2603:10b6:a03:60::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Fri,
 4 Apr 2025 00:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:19:40 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:19:37 -0500
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
Subject: [PATCH v12 06/26] x86/resctrl: Detect Assignable Bandwidth Monitoring feature details
Date: Thu, 3 Apr 2025 19:18:15 -0500
Message-ID: <09a409e53110be930262f50361aa7cf4fc18f9bb.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SA1PR12MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 587bcc8c-2326-41d5-e7f3-08dd730e6425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oNJXpJnv/qAaytm4+UYVPsv5lj84BAu5LywPhbMt5KLaci5Aw5MNunZjyGt9?=
 =?us-ascii?Q?fwbT+X0JPaRsWiuprVP1nnitFbodnBV2r6aWo5BALxw+/0DmopONVxaJwOhH?=
 =?us-ascii?Q?wtCDeXhYpffOO+AfcLoaMNfC0PmuA3r54+A1sSmiSTIYM5tdQSzocJnH7c0M?=
 =?us-ascii?Q?AsX5a6RKHIPLgjMag+EmNqrZS38ffD1+SnngubOhTqFTMVwb0uS9+3C1Aq2A?=
 =?us-ascii?Q?26vjrCugO+OE5NS+rW3oTtCPPi/LCycKMMzW56dqZaKR3Jo2ke4HD1M4Zzr7?=
 =?us-ascii?Q?0vzfzXO8S4QAnN8g3aLMXk9Hbtk2PRgcl//BBv/SY3vwA0JCL2BJ4sxF5LeL?=
 =?us-ascii?Q?ojsWfQTVBzsc9eitwgLDxWw7jWOyPrHuU1YEMHqfPEvJSpcFiL7c537UviI7?=
 =?us-ascii?Q?IWlNjtDT6TQaREHHJPriHyKl0N1vef6hKRCLoyNjWjRzS7iLYkmZl/fMdyrq?=
 =?us-ascii?Q?uqDXO7csdqpVGsHmvY092hRjF1Lg3f9qYeAwBezQ4XSgd92SLyRdrAxywtRT?=
 =?us-ascii?Q?JE3ANaZEOyPHyzLr5jUaWe5J0rU/uLHsPP5seygUtQFLAxykdXrXBdCwo/Jm?=
 =?us-ascii?Q?GrJ3rKRwdg1ZyjEHm6klP9Ma6tTYBcJOjNo5uN8fwNTu6Jo2+tCSiwVw4CIG?=
 =?us-ascii?Q?IyZQ/SqIyxs2o1dvs7LW4Pb3demo8DCQ2l/mjS0eu3kFoRvSqSHIDXyaFRfi?=
 =?us-ascii?Q?rRnMIfe6Zo0hqmMD5h36BOzcyAzQGe72FlN1ykZ9D/8DlRPmz7BmbWZe9brc?=
 =?us-ascii?Q?nQJpFxx/63BRE51mG0nnA7K9Ce+Bldoqvmtxa0V1D+Ydsqm5XCw2T6hzvfzZ?=
 =?us-ascii?Q?XyZOrEwjYt8Ei9NShlkFthFeUGrtga50AY/yhpIHfJn4tiOpu40H0LqVbvDV?=
 =?us-ascii?Q?hgToqiVwS19eyVUqX8Ik7FrPRjbu91v3tex7X1SioRvqsS2t643r8I/pGlhr?=
 =?us-ascii?Q?COW7hwE34OJc6fQKcwQvHmjY1Dnxc0Wtun2FE49XOCZIcOFVvVpvwey78Ptr?=
 =?us-ascii?Q?RZD7MxDXXqgJLT4pP8FSJqGYYKOSBEpRDODmw/mcEEEc3Lk6AUKT+K7vtrw7?=
 =?us-ascii?Q?266Z8yXJSumFGHyOPUSpG1cSwQupgbM76joZWJIU0FF30/ae7Kk78+MYlnPq?=
 =?us-ascii?Q?nDGfJAgK5OVJDrzjZ9fEl6bOTmE1Nn4XSqixjQdgnUXww2lvtVGPO3FsrZBt?=
 =?us-ascii?Q?z1l60vVM/TdmUG0N7BLVyPBTc5VDByoPIOxB5ijAhiPAedYQKwUUOn11AksC?=
 =?us-ascii?Q?645jxQQfk7KVaA/a1Omyf6oKBzdwA23Ui46B0b/HTxiK0aqWODNk3G/ADHS8?=
 =?us-ascii?Q?0ENOXxY6b/t+Q3yG+YbdCilS4nQrgT/W9WE2LnSd3K2zzozTBjsgT9PyYBQU?=
 =?us-ascii?Q?Fw20FiNbr0XSMbuOOtdIBi0cqFSwiLOLTxO6HwCgsRUL8WNFtmXD60EAap9q?=
 =?us-ascii?Q?SC8nsZqMj27jSOmCAci/JKddB2leqMAyynTMvgls5jZSBMZ47lI6hwN3WBcT?=
 =?us-ascii?Q?8H2QxiET25pj2Tg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:19:40.1858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587bcc8c-2326-41d5-e7f3-08dd730e6425
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8887

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
index 38970096ef3d..4132efd83be5 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1242,6 +1242,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	unsigned int threshold;
+	u32 eax, ebx, ecx, edx;
 
 	snc_nodes_per_l3_cache = snc_get_config();
 
@@ -1272,13 +1273,17 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
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
index f31bb48f2b1f..8247c33bbf5a 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -246,11 +246,15 @@ enum resctrl_schema_fmt {
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

