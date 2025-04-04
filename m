Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5410D1ACEC6;
	Fri,  4 Apr 2025 00:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726053; cv=fail; b=XxzMmU8UwGq999RX9cNlCq5o2iM2gc7uN6dz46110tjbvDz1RfgbpQJ7Tk8yPacKdh2P5AA7P0dxk+Mwg17IcjJgwS0K09ot3H8OdlxsXBkC4xEeZ2oYJd8XTLWq8rmvyeNF1zd9CgpYyPkf31tz9miY4VvGFz0q1ahKj/VzbSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726053; c=relaxed/simple;
	bh=bXT/cybqccKhcxCtJW/CW2oqT9mR7nsn0ql4stXjzz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AArw9OqQnOzQ4nzmaU2urqT9oKtMMS35W3jOfQmTfqUlcPpRLAIInsXS4LtbqrLcIXWKnDg0F/6E9ErS3JW1Ir7VMCNht64mxh6ew1aVSTdRd+Ae5gx6Il9CvRzzv+q7yYLSUMvaRaJQvetZOBv7ml3Yny6vR9RhHle4PWtFW5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QScNE90l; arc=fail smtp.client-ip=40.107.237.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QScNE90l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHOE31ZmLZjAAA/C6BHtd0mwCpgt8YS9MCK9/wTMgO8wBznoeUT5Kp+lwl1OWxCfUDY5yfQO3yHKgSGC/frj375PUD77hW5osfKRaMTjU1eUShI0QzFo4YjUHW2jyimZlPPkQKW16mA6pofMudwRW3UXILOX8lutuS2WTquIb3Zzf687z08IFgoBpdDFZ4RexJq8gwXn6BdA6Ouvy9zPVfdf4ibf/JhIz7EjVVZ4eKeRGBIXfMRpkPtAOJSOT7GBCyOk3m6cdfuxDwfDEN9nbf+mPOTx5dyNz1oyGV6SWF8kcOoNxm2uV6oeM1W9cPxY6O5PGDMl+TNXaW1AjW5Gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhJU0H7wo+g2wuu2UcGG0oKL5cX9qql5MynRXSP0+j0=;
 b=dwSHxSrHhVOjAzDQuRIk/2sbRm0mDt+bixwrr5I8AWyjUtPeUcJF7sszvw1SQ4helttA+sFGGfSNyZjnZXrQD/fdxOL9s5IG0Zaslxyl3aq5wHssLCT/xhYGhxqijJnF3VS31tuM/8PoskQHQzsYa9bHY3QC3x3YrswuaZAMKD2svMZccOUxSqgLsINoh3Tjwa0lk2w+oUqtAGJ22K8W6RvJu0bZaMEG3Eo+SetxPyy3ZeZUGASB1p/PGj6PRa1vvspmzFwfgpCXsoZ0eVCTa5jJCCu21dCH2EseN4ah/sSo5VKByUlUJANHdYrZw61xqN1+ge/inKdtWrAH7nNloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhJU0H7wo+g2wuu2UcGG0oKL5cX9qql5MynRXSP0+j0=;
 b=QScNE90lJD9KIYkTEZUnB6rGQ7zmfN+R851esGPqdwHs6g1n8QyhSd+e3axW/fY7lmVV45+x0MHxDgAaUXnutT2K4G2q0N7KwIKBE1jEQDAbmpccu3G8vUYSIWFZS5SK8TNkDECOZ1GDgCvr0k2mp21zQFEolnpV5mOmGeP5EmE=
Received: from BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46) by
 CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.47; Fri, 4 Apr 2025 00:20:46 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::f) by BYAPR01CA0069.outlook.office365.com
 (2603:10b6:a03:94::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Fri,
 4 Apr 2025 00:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:20:45 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:20:42 -0500
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
Subject: [PATCH v12 13/26] x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter with ABMC
Date: Thu, 3 Apr 2025 19:18:22 -0500
Message-ID: <187d14b81db5f9a2f19657dd3af07e8555d68261.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1d6543-facf-4e59-b25f-08dd730e8b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CceV92RSOcYXyWY4BjdFOqknPaNm1OacQPeC42augMUnyGc4jqzJ3KoCwDT9?=
 =?us-ascii?Q?PBnZ8sFlyl5Dl8l8vDL7la1go0wwgrya2BcrUaKaJOXaJm1A4fAJPm3e5euK?=
 =?us-ascii?Q?/SDESuHDt45oZdgS7Cd2p5vtXEEY+kg9MkExz/M97BDmjan9CbLixpGG3GSG?=
 =?us-ascii?Q?g10jCrMZUWCAh4G7iWrKiXRPLkI83O8FzPF0rdhwCJThA2/5eJXG03AbZk2y?=
 =?us-ascii?Q?bil5h6xb3n+nnDA+he4xrbHHbSlJ9IrIIt45DOp4n5zgZ2rYfBWBvtcfnocO?=
 =?us-ascii?Q?gmXm9H3V1QuM/RjkkyrobgpoOQnQVpfSTDF2hI/hsMWHcLfVW3rqYQqYpqML?=
 =?us-ascii?Q?Sed92pGvk2V3FdbPs66ZBZ3AJOBtSzUMQXLAqpZdrZZyDSpbfN/xl1JE6/Vs?=
 =?us-ascii?Q?YN1984LPUTEv2EQ/Ywa5QRcCeFvT5JiTrgEMqHfqQrYsEvmCjedpsrREUbaY?=
 =?us-ascii?Q?so4Ap/g9ynQcrOAUpZaAXNmNWkPlzLsycTlQagEq6x2gW22esteYIQ67CpmO?=
 =?us-ascii?Q?aq5C5dKI31X+NbKhxGXzyEE8BnKfbrz0XwMN1XSSTZcW9bNX7R+51SvOH20X?=
 =?us-ascii?Q?LXoGKGaaAG63paTmTeUq9Qh6axeUEjCrAiyBCx0Rq1Vt3LCswWxzSwTyb7g/?=
 =?us-ascii?Q?segFwkhiM5rjm/N1gQq5PnUkod3ICUePEXF2szp0Q3zqSiq8cR39HPyGrKeF?=
 =?us-ascii?Q?cH/eXIeVprC7uJoBRGNacrjt8s6pRcIgZI9Lb4f9qsTKPXskcaSojGF0TQ9y?=
 =?us-ascii?Q?elbBYbHvI2EmwwqdQoNRHLZjztqV9yYNNP+AsNvpm6WEIPzwHJgKChECjTT9?=
 =?us-ascii?Q?8dLuNuPs9TTALoxcJSMApTmVFSNG4LyopOwRGd6nqD+zNoEOfqXTW6EK9klk?=
 =?us-ascii?Q?aJ/Wr8kN35Ln7WzzddJLK5thCFn0VNDX4zuiTVmE0QKfucugRh0S9nC7lWN5?=
 =?us-ascii?Q?P0f63koZDmulLR3OeaGtg6xlX0dPMV99q1aIIsdBjmyKmh53tGnsOEJHCU4W?=
 =?us-ascii?Q?xCwlIaZxu7kmG6U3+XkshNGmxQq/qLTRv8bO78r+prMb8efY1HYiw4XSNII5?=
 =?us-ascii?Q?OL7JxuFGiRTyLPO7BDqJNKqdg2uisTQmgGv4aId0LZ79I+uySRUPvdtlh1Vg?=
 =?us-ascii?Q?dapgNm+MyoGChqQMGF9TfVw2jq51zUnqayy0hEbHq+QKBVJKCo6eynZVCfwF?=
 =?us-ascii?Q?8NyaC6NZRFWpoQXm7P+5cHC0LFCN2vi8b4Ih6EAVrk1Xdf7hjx3FWBHhUYhU?=
 =?us-ascii?Q?IWRrrBRixxtFNoTEisggGWYb7mkhcJeZ2OojpMOBWf9ejNl5PJGEPafEnUaa?=
 =?us-ascii?Q?yxMiexaKLivjnsj9yeerN2uI+Su1IcnAriHqyqhAYF6eo/D982vK7t+A+1kf?=
 =?us-ascii?Q?A3IPI54aJT1oXLb6+Hmb1ulu98KLHlp0mcsN8LxE9s5+EZl57Tp6DSLfT++B?=
 =?us-ascii?Q?CMsxqUCTNeswbUueUi1s1PJlbo/tKtNWGjKNzkE9rr929XQz+f9g29FKq4Zu?=
 =?us-ascii?Q?VoFFkRBl6PEtL4Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:20:45.4083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1d6543-facf-4e59-b25f-08dd730e8b03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249

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
v12: Added the check to reset the architecture-specific state only when
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
      changes are related to global assignment interface.

v2: Minor text changes in commit message.
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 39 +++++++++++++++++++++++++++
 include/linux/resctrl.h               | 15 +++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 8a88ac29d57d..77f8662dc50b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1430,3 +1430,42 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
 
 	return 0;
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
+int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			     u32 cntr_id, u32 evt_cfg, bool assign)
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
+	 * Reset the architectural state so that reading of hardware
+	 * counter is not considered as an overflow in next update.
+	 */
+	if (assign) {
+		am = get_arch_mbm_state(hw_dom, rmid, evtid);
+		if (am)
+			memset(am, 0, sizeof(*am));
+	}
+
+	return 0;
+}
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 294b15de664e..60270606f1b8 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -394,6 +394,21 @@ void resctrl_arch_mon_event_config_set(void *config_info);
 u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
 				      enum resctrl_event_id eventid);
 
+/**
+ * resctrl_arch_config_cntr() - Configure the counter on the domain
+ * @r:			resource that the counter should be read from.
+ * @d:			domain that the counter should be read from.
+ * @evtid:		event type to assign
+ * @rmid:		rmid of the counter to read.
+ * @closid:		closid that matches the rmid.
+ * @cntr_id:		Counter ID to configure
+ * @evt_cfg:		event configuration
+ * @assign:		assign or unassign
+ */
+int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+                             enum resctrl_event_id evtid, u32 rmid, u32 closid,
+                             u32 cntr_id, u32 evt_cfg, bool assign);
+
 /* For use by arch code to remap resctrl's smaller CDP CLOSID range */
 static inline u32 resctrl_get_config_index(u32 closid,
 					   enum resctrl_conf_type type)
-- 
2.34.1

