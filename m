Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B527146E;
	Fri, 13 Jun 2025 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848875; cv=fail; b=kV7JWa/23k5Kny95NhP3ZYBogiURNo8++JQ9IBtjUlNPRNB2wyTB5tlqFDGaq2OOa6ffwA8bTIV1rHbuk/7aDvkmLD0w7WN366FiNfnElL0375dDOySLbQSu4bNyTtZ8Z6vDV1nZqdIgmFon16v3NhovueUpWdqb4m+oCCkw6Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848875; c=relaxed/simple;
	bh=vT+2G5M+CJ/8Lb64LuCeVUoQNWyNEkOzAvpS+x4OXU8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMIYZfSh0lOIMsudeV9beqde/7NFKqzRTs3Y3pJKaPiBDoRhZ4HD+5Qig+lMH95gnEZGl9sYRY0JZTVKQLrZntjYp/MNyAGaj1RFOYJgjchYpWKu8Yf9r8H8n8dvWZlb9NIOf/thjHl1W63QP2GLb2c81OFMUJdaT19ONi/PvA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XOKRxQ5j; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XOKRxQ5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0i+1ecg3BZ7P1ZlNG6C8ivigi7fUpRbBwhVg0L8AHOlddQLPOOhZew6J4waAFIfexy3xujVtuyTyW1yYZQHKNtlrItU0VjWIP470m59b8ZI6syGly8fBqz4ja7jopEpF+9LnUAiEUvP4rTDGRqoRjklYjO3UMuh9raIEaKHTAUDG2WvBBusY9qW5aHAoQIUezUNNg11J/51meYWdvrxFJMjabWbCnPyM4cJq0/6QoqtSL+54vNkfs+RN0DMhrCAWLOmDw7gOHlwfvfEqxYRGjyEW+7AH6Ms1t8TAEUqNHXucx2Yw+ckz/TbwLHEw7yKOAcRXDh2KchAbB4NnspIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQCk2tJG1DkrCIWt2s4kOJxkGXDEgZithkT92CTR1gc=;
 b=bF1ujndU1CRSRNcfgqTkXnLANwhcq3M/W6pcZGKcCtaFtO3+P/hJ4s+g6fMtRYCF60kpPBQmzrRjXCx0XnJXGJXNaMXiOeeRKGmMDAlWfAsMlBdh6IueKEnQim8ZhAWhI2uj/70bvdpNCIhhgr3/s6apEmbZKwKVgO3ONOdktI0qMU+BEHUO++ji98lFO+dnSLDkZHAeVl9DrUlrMWvc7HNtne/goavT0AHvB5ZQfHLjmjiti5mhLtrwgqnR0btBz4TN+Uojy4yOVSken9P0w3LwDrL6+n06Vks2dVLIRUkgkujL0ZTvvN5n6ESx3hipJIL7OnGST+e+I1T1ebDlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQCk2tJG1DkrCIWt2s4kOJxkGXDEgZithkT92CTR1gc=;
 b=XOKRxQ5jkbljYFx/M2FPfSVs0xU25XVPtZvUXdOdbks3c0HznMYL4vRhhwFqnFTsWDTUjvlmOgOaB0OykZZb2A7T8EwcbEAG/JDsz2DoaEgCPAympFlYLr1iq1+yW185mFqVm6H+HUeC08ouE8nmyiVohhSslL8OVwGM6gx5AOc=
Received: from CYZPR17CA0001.namprd17.prod.outlook.com (2603:10b6:930:8c::27)
 by PH0PR12MB8125.namprd12.prod.outlook.com (2603:10b6:510:293::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Fri, 13 Jun
 2025 21:07:47 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:8c:cafe::31) by CYZPR17CA0001.outlook.office365.com
 (2603:10b6:930:8c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 21:07:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:47 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:07:45 -0500
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
Subject: [PATCH v14 17/32] x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter with ABMC
Date: Fri, 13 Jun 2025 16:05:01 -0500
Message-ID: <72b62da44d72938a33b58fe3e853da2e41dfd67f.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|PH0PR12MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 2674f935-68f9-4b98-577f-08ddaabe5978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mJX5WvIyVaoPySypmjo8BbQiQS1LFId1zNdrlHKlW5jf/+GCnmUYd4I1ZLoF?=
 =?us-ascii?Q?UGIX5khBTIyIIDxM73vZbFp3mhTw2zHyTIDp+F8UPN2lPaGxwu2RfnOKmmCV?=
 =?us-ascii?Q?O9r02jJ/eZUOHJSjofzT+weKLyKGASHMOO3buK9UGS/COn9oIz4tFTDcWkf7?=
 =?us-ascii?Q?GHiAOu5FJypZX+roQy12ixqRCRxoTHJaOQZ4OfRuFbupve2U23RXCZMzFuyi?=
 =?us-ascii?Q?DJcGxT+r7zqsFltaohF1/Udd+8WJfzeIKu8suWhg67YBTwljPPsLJfbNG/uz?=
 =?us-ascii?Q?PQPXJyOyKCnU82wo5Bn+b/8rl4vXshfh0rjimvsjV3UOK7UhI+3HkfoGD7fw?=
 =?us-ascii?Q?VuOjYUPecnAGnU+QHlq5Xljfxsk2rsGvZ8Nv9oC0Muod9fmGTPxAnoMz+Tpm?=
 =?us-ascii?Q?kf/utUJ973yu2Y4eLRsGNa+be960VzfUrfZ4TkV625grxw06/0fGY3Ku6+x4?=
 =?us-ascii?Q?dEk5ICPGLUv4j7jyjc7MAUG41MB44nAeE55I+zPqBHNaWEKs8uMvZg9+Zz13?=
 =?us-ascii?Q?KrPDE9vpAUiXQFmF7FDLSCntXa7UyrKr1JTFa8AWUuRuaI5NQnkPd/z8PAQ4?=
 =?us-ascii?Q?0XAyJMbDCjHGHJRS+agnvGyK9NA9YIDXPHLGFtXIXlGWB2za4TdVPIAC0Qab?=
 =?us-ascii?Q?SYdz6G5yA7SOBUOAyz3r9T6ngigahzze0oMgvJqkiGZnNUVQCYUbz2AAVcFq?=
 =?us-ascii?Q?QEstNPtzH1sWFSA6HiyQMQrN29Gsu6sdk3KUxxL8vIhkd1ekyulG/ez6Y4JN?=
 =?us-ascii?Q?29hGuBmFAidn5rg2gJv9JP2vfGIU/vKOLUW55R2lVBQW3n5XvYb7KtyfdXzu?=
 =?us-ascii?Q?4hERbBOr4CwRhGsm5jpNcQaerc4HSL3YTBLiZnCCJIPCfMqcE0g4pHgmdMYS?=
 =?us-ascii?Q?kHtnz+Kdl0pLRHwmkXE9qTO3Rhp+JdynPMQxzaTNDSxfIvvIXj1Z5hQIkZG2?=
 =?us-ascii?Q?9EZyn9cjuPdDmJJeGW7QxL0pZTzELUG3HM6dlH2mz11w0qzIroC/LcWfsso2?=
 =?us-ascii?Q?IQQiRkhrwpitXbySrMcPa93ZGQ95LcedSRtjVghgCjVaEEzl6+cgUc1ICxGy?=
 =?us-ascii?Q?PSSUfIWdeFKa1wX8/EubB6sTo8t1X02TxBMG1Dl4ngwT7w+XeMcLaa5yXvYe?=
 =?us-ascii?Q?/HKBisMygY/hBuJWSUoGjKIE0ye8n4sMfXR4SZItG9UXApof7HPQ5ubtoZ4O?=
 =?us-ascii?Q?ZcOnmyNFbJrDphrS0CKioxkyYh7S3tkgcqMl+qUuCA0cdV4Z0HEmxyrtu8hI?=
 =?us-ascii?Q?mWzv9tXbI2UlEbxcnmigZ9zPHLpmPxUhETxsFPD2CfiHlpTa3TtGwpLecZk7?=
 =?us-ascii?Q?dtogA/UZd+m5I8LOK6Pu7cy6BLxqyI9yQ+kV9FZdJGwd7CM+Vpqb84IGpA21?=
 =?us-ascii?Q?vjXY7Gg94+o6bhXLbeq5JsLS60lVccRtyWrrZP1p01zpMRoKPtEzwVu0e+E7?=
 =?us-ascii?Q?kVZZWiVTzCe5qXmP//UjgYM9juS5XXrTO0DlW7QFDEf5tp76VYzYPMcLtYIh?=
 =?us-ascii?Q?ynxqb39qEPTb0kAAypWx2/3y4P0ZNI0eTADwESh3Bor+Llnl1MB5jsHS6Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:47.7008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2674f935-68f9-4b98-577f-08ddaabe5978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8125

The ABMC feature allows users to assign a hardware counter ID to an RMID,
event pair and monitor bandwidth usage as long as it is assigned. The
hardware continues to track the assigned counter until it is explicitly
unassigned by the user.

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
v14: Removed evt_cfg parameter in resctrl_arch_config_cntr(). Get evt_cfg
     only when assign is required.
     Minor update to changelog.

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
      changes are related to global assignment interface.

v2: Minor text changes in commit message.
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 38 +++++++++++++++++++++++++++
 include/linux/resctrl.h               | 19 ++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 0ad9c731c13e..6b0ea4b17c7a 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -444,3 +444,41 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
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
+			      u32 cntr_id, bool assign)
+{
+	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
+	union l3_qos_abmc_cfg abmc_cfg = { 0 };
+	struct arch_mbm_state *am;
+
+	abmc_cfg.split.cfg_en = 1;
+	abmc_cfg.split.cntr_en = assign ? 1 : 0;
+	abmc_cfg.split.cntr_id = cntr_id;
+	abmc_cfg.split.bw_src = rmid;
+	if (assign)
+		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
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
index a58dd40b7246..1539d1faa1a1 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -594,6 +594,25 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
  */
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
 
+/**
+ * resctrl_arch_config_cntr() - Configure the counter with its new RMID
+ *				and event details.
+ * @r:			Resource structure.
+ * @d:			The domain in which the counter ID is to be configured.
+ * @evtid:		Monitoring event type (e.g., QOS_L3_MBM_TOTAL_EVENT_ID
+ *			or QOS_L3_MBM_LOCAL_EVENT_ID).
+ * @rmid:		RMID.
+ * @closid:		CLOSID.
+ * @cntr_id:		Counter ID to configure.
+ * @assign:		True to assign the counter, false to unassign
+ *			the counter.
+ *
+ * This can be called from any CPU.
+ */
+void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			      u32 cntr_id, bool assign);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.34.1

