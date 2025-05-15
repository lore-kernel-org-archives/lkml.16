Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9228E5E1;
	Thu, 15 May 2025 22:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349653; cv=fail; b=D8kW6u81KczTw2eSTq/ZRztSQIFNsNI0eureLRepjQzRbPoqktr1V4M/cQ4OCdYWVwf/C4SMg2tQWxBc0dJZwUY3viFzq5AZ5VtD6IwKNSZv+d//Dzr4EkoeUrmgR4EVY7JL5Eo8bvCYV1+zeasiA+Vskj7mabq6QOJJdmAv480=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349653; c=relaxed/simple;
	bh=UD4gpt93Z5WHPIiKUVOf7lZQ89yMwsn2QAGUmA9GAZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pv/lhJTdDBXEMKM4PZIC279le+M7C3AtEM+8RgVLXB7EkKBFBwwP/6DZ8kdSbMa0ynRcZfreAoWIUaY72SLy/lOZ/KYORNOf2tsDFscCbhdRp3dA/CmMrGFXZoHX3NPffo46FgGf3CEvAQWYptBudZJhIKSiGSXlHx1khuzKrdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oxRX6yar; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oxRX6yar"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YokU7rM4PJKfKroJXaPICe4hhm5uQrwo7807erbFdBlBRgqTELEuKKDChhyKmCNG0Jfdov+o4B8oPAuPl5+yl42uszQB1HhOfs9/Fvyvkp8UovzFRjdjJSNDxBPlTrDkMdNnKy6zm6uB6JZVaZ5Lgo8OPKUDBALd0yi6LlRoqIaAMKr/IjCrkJNpXVz2+FBX4NZF2X9m3w8CXXLH+LAUWm5JNr7TmRMYwzDgNOdB+c6x6Y6e9fqMZjaq/on9uLGIVD6PqQZHELO6DjTMZyUFCeY72EdsJHdZYv63J4jQ7uB3fBybUs5R6yb6GDjABj8GhMGNm0qrICml3AnPu/Mcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32B82KLGJbHcD7IM4Th74wTr5F0rgWq002Y91Zj10CQ=;
 b=MCCW/hgqBExkae9jA08RLfaoEEdjdFnZo73J63Wos1mCgC0qPXTyecO7Qi1J2Nh4bhaOhGkpUo44LoKUOu2lbngk6F/E9GoXCPJ0xHojjjAY5/rReosqUfaZjeq3CXoYM3tTNpcWjbnQMnhQlj8yGiaeSVeGmvPXOD7c/95SmJct3nS3N7xsBEAXDlKEe557JOuHWklPHgS8mUqv/JaCgG1NL9GjdVs7VQTgrZeKgMNrWvOzKgAoivNB+HF+KctOWKjuplrEK6soUim9R3qaI4v6BhzyKh5ChAXc2xHgieOwrao2zKBjl1sqI8JQ1+ALRRsTdyHphB4roZtILk2hQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32B82KLGJbHcD7IM4Th74wTr5F0rgWq002Y91Zj10CQ=;
 b=oxRX6yarSzvWlUXmE/ve1MuJeGPcfdQy5gPal3j3obpTt5GZYm6vhD09/AxOI4+z+O8GaazVuBQlJUj6doy3P4x74O4fWWpv47U97XXOdEpFFd+5brxsBAV7ZB1Ay4JmYLxAFa8DPNBbnJjLrhby+N/FqIGd3KPmvLT35D6Pp4Q=
Received: from BN0PR04CA0210.namprd04.prod.outlook.com (2603:10b6:408:e9::35)
 by DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 22:54:07 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::ca) by BN0PR04CA0210.outlook.office365.com
 (2603:10b6:408:e9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Thu,
 15 May 2025 22:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:54:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:54:03 -0500
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
Subject: [PATCH v13 11/27] x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter with ABMC
Date: Thu, 15 May 2025 17:51:56 -0500
Message-ID: <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: c85adc86-201a-4933-6e3f-08dd94036608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T7zjgu8pn2YTRWL99OoDfvVvgikLVBSCkUbR5UY72U0nQnDOovuKEp3FYlsb?=
 =?us-ascii?Q?mgJGsyu+duFKeadu5KI4Y2HCJBcS7X+ls3n5cBCxhaP+PLC+JS7lpy4LZRPm?=
 =?us-ascii?Q?3B1Lp9XBXVJ23q37ybHQZbHXyzw7v7oDf2cuuQoGMNtQNfONrIP7Kp9AMYmG?=
 =?us-ascii?Q?v1vygSrAXN3buSYEWrWFw8Ijl3SgOsqB6c4hpd3VS2jkV83PiQEiYp/5rKNH?=
 =?us-ascii?Q?Rxnly9vV7XytrJFf+PDbraPu0ziiW2HL6gKdd8Jw+jla9B2R4qdm1GN8Nvve?=
 =?us-ascii?Q?JapqqwctlNi7UFyk9nSyIci2+XSkfZ0ILVXBQ/vz+6uEtpIaBz0j4Fv+ZZmZ?=
 =?us-ascii?Q?JtZ3lFy3btmVQYTvmAdMEQXU0ZveaFj44wmULYy2dfKCxHhZoq6PTnpb2O7B?=
 =?us-ascii?Q?B92uWh4jQSDuLnF/2x1ICixsoL8KCXL9PLm954SBeuFEMAEQ2afKvo3dP003?=
 =?us-ascii?Q?gJfuOrWTMhma+C7jo5OBbufVnJ3ifZr9ZlsfVAsfQSRi5ERfd7UeZPpZbDVI?=
 =?us-ascii?Q?XP2H07PpKO6IcycCX8AJK6DYCf9e8SDAnNbFeqR84HT4u9r3/lr5GFHDQjA7?=
 =?us-ascii?Q?1pXd2vPBsn2fIXTwHkmPpv6noJPF2DLGiEB+5pnCtIfO7CF83uGQDB5jlKxO?=
 =?us-ascii?Q?K4osXWuESdx4roHX0EkjVPKO7Zx6OHaa09n9iFyZZxrus1iBAIw0NQXTBV8T?=
 =?us-ascii?Q?+cjT5C7UzO3bdlYVWN1QdUTXrPvKCLCNQGq6dyknnE2gsQ+Zme/fr0Mz5Fb3?=
 =?us-ascii?Q?nel0x6nDMD49MkD7XUogdkFuTWFJBZJ2U+96GM5J6p9nfrOujU87eXqULCnb?=
 =?us-ascii?Q?D+OXfLPocbAwtKAt7CRxl2MMkkTrmpGgHVMwRBCKMl9u4+TjOa3Fkgtamqr5?=
 =?us-ascii?Q?LmfgOHNIoeFF5J904lTty77jyOSw7eVzSPSunuV1t7g6NWRhD8LlsxCEqFcB?=
 =?us-ascii?Q?fxdjYwCrKCR9O6srR95dm563WBrarkMyciBTbTRdMPhV5TrxjBf2Dmt5HnGU?=
 =?us-ascii?Q?atQ+9So5vD3IF4+9Hw6bEjiyg933b83odC6pyEPBfJ8hnjZxdf0hoZsAqjEA?=
 =?us-ascii?Q?iGbDPdyPnNObCrngiB83MCmvZ1aKB/EF+5sBwDOSaq+YOy6LG+IfiXw6jVtX?=
 =?us-ascii?Q?4R0PXYjI85Ase+N45u06ZTR1uAdvWPBt1ni8ylNbBJ9w5Ubl2gU+OFrz5+CI?=
 =?us-ascii?Q?LBBgxsqKyYznlemTu2b8jkAV9WyufpcR08kOvJSW3segsGi5uKIksMtkUYsI?=
 =?us-ascii?Q?sLKStue0VHtXpITpnjwa74sHtAPIrnGIJdh4lZZX2NDIjQu+1J25JWbpExkB?=
 =?us-ascii?Q?a46XWbxWwp9ubJzvrNrZDnkMCkE6Rc6agxxWhClXDb7NnvhZRFwzUmbHc2te?=
 =?us-ascii?Q?xJX9lgJtJohAEl3L0/kVa/BTiEd7J3ojXhkz3mMZVJU1hI24NmRAgtHgT7nm?=
 =?us-ascii?Q?7VAvxeGlRmcfLBIsivTicW58lPLiqgNoizIKGnyT7oFcC8/L99dcr6N7Uh9+?=
 =?us-ascii?Q?BRraWJay6NaZKZCC6bV/ufYj8l8pG3sF8SHMBVgqFvFEQFWFU31nW0H0EQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:54:07.3697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c85adc86-201a-4933-6e3f-08dd94036608
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as it
is assigned. The assigned RMID will be tracked by the hardware until the
user unassigns it manually.

Implement an architecture-specific handler to assign and unassign the
counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
specifying the counter ID, bandwidth source (RMID), and event
configuration.

The feature details are documented in the APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
    Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
    Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Moved resctrl_arch_config_cntr() prototype to include/linux/resctrl.h.
     Changed resctrl_arch_config_cntr() to retun void from int.
     Updated the kernal doc for the prototype.
     Updated the code comment.

12: Added the check to reset the architecture-specific state only when
     assign is requested.
     Added evt_cfg as the parameter as the user will be passing the event
     configuration from /info/L3_MON/event_configs/.

v11: Moved resctrl_arch_assign_cntr() and resctrl_abmc_config_one_amd() to
     monitor.c.
     Added the code to reset the arch state in resctrl_arch_assign_cntr().
     Also removed resctrl_arch_reset_rmid() inside IPI as the counters are
     reset from the callers.
     Re-wrote commit message.

v10: Added call resctrl_arch_reset_rmid() to reset the RMID in the domain
     inside IPI call.
     SMP and non-SMP call support is not required in resctrl_arch_config_cntr
     with new domain specific assign approach/data structure.
     Commit message update.

v9: Removed the code to reset the architectural state. It will done
    in another patch.

v8: Rename resctrl_arch_assign_cntr to resctrl_arch_config_cntr.

v7: Separated arch and fs functions. This patch only has arch implementation.
    Added struct rdt_resource to the interface resctrl_arch_assign_cntr.
    Rename rdtgroup_abmc_cfg() to resctrl_abmc_config_one_amd().

v6: Removed mbm_cntr_alloc() from this patch to keep fs and arch code
    separate.
    Added code to update the counter assignment at domain level.

v5: Few name changes to match cntr_id.
    Changed the function names to
      rdtgroup_assign_cntr
      resctr_arch_assign_cntr
      More comments on commit log.
      Added function summary.

v4: Commit message update.
      User bitmap APIs where applicable.
      Changed the interfaces considering MPAM(arm).
      Added domain specific assignment.

v3: Removed the static from the prototype of rdtgroup_assign_abmc.
      The function is not called directly from user anymore. These
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 37 +++++++++++++++++++++++++++
 include/linux/resctrl.h               | 17 ++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index ff4b2abfa044..e31084f7babd 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -448,3 +448,40 @@ inline bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
 	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
 }
+
+static void resctrl_abmc_config_one_amd(void *info)
+{
+	union l3_qos_abmc_cfg *abmc_cfg = info;
+
+	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
+}
+
+/*
+ * Send an IPI to the domain to assign the counter to RMID, event pair.
+ */
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			      u32 cntr_id, u32 evt_cfg, bool assign)
+{
+	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
+	union l3_qos_abmc_cfg abmc_cfg = { 0 };
+	struct arch_mbm_state *am;
+
+	abmc_cfg.split.cfg_en = 1;
+	abmc_cfg.split.cntr_en = assign ? 1 : 0;
+	abmc_cfg.split.cntr_id = cntr_id;
+	abmc_cfg.split.bw_src = rmid;
+	abmc_cfg.split.bw_type = evt_cfg;
+
+	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
+
+	/*
+	 * The hardware counter is reset (because cfg_en == 1) so there is no
+	 * need to record initial non-zero counts.
+	 */
+	if (assign) {
+		am = get_arch_mbm_state(hw_dom, rmid, evtid);
+		if (am)
+			memset(am, 0, sizeof(*am));
+	}
+}
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index d77981d1fcb9..59a4fe60ab46 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -559,6 +559,23 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
  */
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
 
+/**
+ * resctrl_arch_config_cntr() - Configure the counter id to RMID, event
+ *				pair on the domain.
+ * @r:			Resource structure.
+ * @d:			Domain that the counter id to be configured.
+ * @evtid:		Event type to configure.
+ * @rmid:		RMID to configure.
+ * @closid:		CLOSID to configure.
+ * @cntr_id:		Counter ID to configure.
+ * @evt_cfg:		MBM event configuration value representing reads,
+ *			writes etc.
+ * @assign:		Assign or unassign.
+ */
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			      u32 cntr_id, u32 evt_cfg, bool assign);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.34.1

