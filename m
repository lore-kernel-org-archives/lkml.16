Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06033AC17;
	Fri,  4 Apr 2025 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725940; cv=fail; b=oizK2ep/44NmE+0dFux47SccMititWH/Ph1BwlOqou1IaZwjErzYlOTR4xBjGs/1vmtmA/n25zgW/A2tgdiGNfyjj18Fp709gZgl7jl9q+9PEURlWwhb3FH078mBJKpJ/o9LCqXcRMY0DZj9tRuxiJUhEoFyQw2Z38pERLzAFJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725940; c=relaxed/simple;
	bh=F3uukRERJW3JhEOTTVV1sBpStZNJpo4aicMGuybGboI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3w0JcgJer5jTlW9EVhSatMPzQSai6XvMGDp5gf3/95ivZKU1svpMV9b6Iw4xXTmU90wTMksrM7jdvo7o1H7765dBXAN5M+4smAo8rzNj083dULeKas4PgDiDI5TsQBeYi+A+Ls+Oiy/2h0Kmm0iXKOsWY+6AL9bbSaO2kUQYcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XPxgS0y+; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XPxgS0y+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGK/LzDOooksqwddupgbbUMcMAjX6Q9JwpL/Ey/45sIvPfT4s+0GAhpNr+0Z2zCHCZpLRI9vRIxDKE1Q8I0Kb0fMuQHdjrbZqzxeSMPgycmcjiDSfZTnbBfeAtStwrms1WE0+gNPpMapm6+hkBbuPEu84V8v33+L1ODZVe/CXXaUk0fIA/vMUVFx5x9C5LtLeQYqsGdcQHS1Ny1Qte6n8urEAmM4tB/M1ePFgWAwJCUXJmj5qiF8YJ74kZIzaWa0MdiKn46cvrW7A0YoPEwBgljlVb9Pjj/M1uCBX7isqZUnEnEWg8DnqXecxNeEuObZzddpHOrv5kXJPgKD6SIo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OMOou6oSwhFqONDv35RrMsA/Y1PwTPTQJAIv6OMAkU=;
 b=wXd0kFUPKbbH58i38DW/JPXIYXnvaQVfwZiPy75IyYd3XB4fPUM4r7DbmWGHZPgobLR1bypujCN4B6lbHCGofA26H0An3RxD6+TYVUnzMCjJ9MyVvrHTAniOw8s/fl6MxHPjWOpZDoCTwXqwWD4CBq18SEonHGSCViUAme1eYLoCf6PatONlt0HM1IxKiPdSN7ypf0kKBKmDuPR3iHMLuneyxjBcOlM09d34/9Warlz5R/Bb+nDCqlc+BPFKTAXs1KHHFES5NcHpWokfLeRwxd7AxwINGrq1DBsALiwcYVtI5T8Y39Z9SJgOINDLr4m7ISwUDOrb/om2U35mLrnj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OMOou6oSwhFqONDv35RrMsA/Y1PwTPTQJAIv6OMAkU=;
 b=XPxgS0y+eOfKNngF9C6RUHq+nF0DCb/krzgftnLN35vjSwUxjIzLZ9qNz1FQdm84VHmhXug5uWTzUJqDYpxaC0e98utWDj9+GzFF/KIAStPmJ1rzbaibMm3+nc3cAgUpbmSOZMP3fLt9ZQkApqh/DgImhmBNoUZWBT4b0jjuLsk=
Received: from BY5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:1e0::30)
 by SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:18:54 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8f) by BY5PR03CA0020.outlook.office365.com
 (2603:10b6:a03:1e0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.18 via Frontend Transport; Fri,
 4 Apr 2025 00:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:18:53 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:18:50 -0500
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
Subject: [PATCH v12 01/26] x86/resctrl: Introduce mbm_total_cfg and mbm_local_cfg in struct rdt_hw_mon_domain
Date: Thu, 3 Apr 2025 19:18:10 -0500
Message-ID: <bbe371a2025d6f0bcd9151a9a4311f504c5a6a21.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: b57b2c74-93e6-4d08-8469-08dd730e4877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?80mOi6xXvn0aoCJGFYdwMDiFqwANIhDcqyV2Sz8T+Ukp2hz+e1j1qyS/pxne?=
 =?us-ascii?Q?0nXpl1SL1Uqfykz+GEugKHpF6tiH3Tqw4tKXM3WSLiYU5A3zH4XMjhd4fBZ3?=
 =?us-ascii?Q?6Y0pkFuQrqmJxcblgMbsgYIcuRr552VePqjjtxlwete/kfS4Y1//r2mIzK+q?=
 =?us-ascii?Q?5ex327Qdp9BBRSiG50wgtxMRCvFk57di7OOjX+BToIrWxRMUD7+TKNDRIiwl?=
 =?us-ascii?Q?Jr6FpZkgjILSQ+yKnR4XOdeyYWlsGP+NcG590LcVaEIQ7CSmJQ9ewPGFezb2?=
 =?us-ascii?Q?qQJ0y7YuX+xlyRQgx9zgUzzLkaB4Z7IOVo0IyG/PeN2gnb5wYENaCLYfU+CV?=
 =?us-ascii?Q?8Qz3zkBYDLV8czU/A62DYL2mB3owrsHScMddyrhp/ooMojGp0Z/tA3U+G5Oj?=
 =?us-ascii?Q?LVTOeIWu2EIUvoVHRKlIFZ4QbaiaM+Mm54JdLBKek88DWPYT48DBWYt/pG2L?=
 =?us-ascii?Q?C724qaFtvJ2/aY3F4O+Yzo8QfITLwWeDpYZXqcoiAwkq2ReIBA6U3lBrsqdt?=
 =?us-ascii?Q?plZZuIkyny6JorYpEXu0aOrDIUGb+ODOTFSVrmtJYVL2/YKp02J7qFtJNBGJ?=
 =?us-ascii?Q?3ZCpTBdsM6TxGMtuIDY7DeAFnfe6W8Jnqx6PMqFUAGyk52V+lg/nFhLm9pBQ?=
 =?us-ascii?Q?+CTejge3C3nAUkDlxtjyeYSV/+ERCM2wUKHouAVSnqPtPrRvVJJdxxCeHF7z?=
 =?us-ascii?Q?4G/zezD79JtF+YFORQdHgA/Eh7XBF5iYSKonFeyCFRILezJHqJVSRUeoAgoW?=
 =?us-ascii?Q?z8FucLaxYBiz8o0z7n0MkS5Ew2sd4A0IgrS8C4/k2csdhSL28gqJ572coVuq?=
 =?us-ascii?Q?eqABcY73B+bD7oH4cJ9zLckGfnS2JHGAikiDwazEULZuQurgcj5NeTT1SS2j?=
 =?us-ascii?Q?aQAiUZJTBcdnXxaLzegxOlD2O2rpsqqQNGS9dcksuys0XEdDyIZ+Ep973Io/?=
 =?us-ascii?Q?hDD7xWS2MNwGCSzs6P2eHZbdfLiAiCVdeO2Dihw0rKsei9gBag3Gle3Q7GAs?=
 =?us-ascii?Q?lrmRBBjNt/43Fy5clyaz4W4AygCHwkwUicN0PXbS5GWNG/yOuUmNh51XLmbP?=
 =?us-ascii?Q?/uTmzXvsGM2uZ4A38uRsO3mYhP0uR5rY/FF+V7KKNMAtcJAJHddhYll5UUXC?=
 =?us-ascii?Q?yIaycG5XeH4g9B+9f5VNVkoNgUdMp5wkUE+TDWgbZi2Qby+zvdBeJnEB4Gtg?=
 =?us-ascii?Q?+sr6rs3dx4398F7ANwvVxpiU7l+gwPp47Jv4F6oI8zmpSqF/pT0p7aTlhZ4d?=
 =?us-ascii?Q?41RcKth/InGJnsWbJ6tp54jrl39QAa+zrWEx89Ns1G/zaa4t9aqGSBTvWyIf?=
 =?us-ascii?Q?EzqJ1gDO0bts7bORFNXM1benTQ7bWC6oXN3UY+lQacx1ExpbHDo32/tyZv9z?=
 =?us-ascii?Q?3NzMlYR5JzVljnLc2jNW3bHsKJxjyOKNSZFGRhlMsrcYJx08x9SU5f8oFNBx?=
 =?us-ascii?Q?fvgiYmg9PEvIlDULgGqN7W5iqEMh+lrV2zlIOfmpCvltIbzz5ZvOqAXFOiQ1?=
 =?us-ascii?Q?BfcdyTAtTqbV1+M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:18:53.7444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57b2c74-93e6-4d08-8469-08dd730e4877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782

If the BMEC (Bandwidth Monitoring Event Configuration) feature is
supported, the bandwidth events can be configured to track specific
events. The event configuration is domain specific. Event configurations
are not stored in resctrl but instead always read from or written to
hardware directly when prompted by user space.

Read the event configuration from the hardware during domain
initialization and store the configuration value in the rdt_hw_mon_domain
structure for later use when the user requests to display it.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Fixed the conflicts due to recent merge.
     This patch is for BMEC and there is no dependancy on ABMC feature.
     Moved it earlier.

v11: Resolved minor conflicts due to code displacement. Actual code didnt
     change.

v10: Conflicts due to code displacement. Actual code didnt change.

v9: Added Reviewed-by tag. No other changes.

v8: Renamed resctrl_mbm_evt_config_init() to arch_mbm_evt_config_init()
    Minor commit message update.

v7: Fixed initializing INVALID_CONFIG_VALUE to mbm_local_cfg in case of error.

v6: Renamed resctrl_arch_mbm_evt_config -> resctrl_mbm_evt_config_init
    Initialized value to INVALID_CONFIG_VALUE if it is not configurable.
    Minor commit message update.

v5: Exported mon_event_config_index_get.
    Renamed arch_domain_mbm_evt_config to resctrl_arch_mbm_evt_config.

v4: Read the configuration information from the hardware to initialize.
    Added few commit messages.
    Fixed the tab spaces.

v3: Minor changes related to rebase in mbm_config_write_domain.

v2: No changes.
---
 arch/x86/kernel/cpu/resctrl/core.c     |  2 ++
 arch/x86/kernel/cpu/resctrl/internal.h |  9 +++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 26 ++++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  2 +-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index cf29681d01e0..a28de257168f 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -558,6 +558,8 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 		return;
 	}
 
+	arch_mbm_evt_config_init(hw_dom);
+
 	list_add_tail_rcu(&d->hdr.list, add_pos);
 
 	err = resctrl_online_mon_domain(r, d);
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index c44c5b496355..9846153aa48f 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -32,6 +32,9 @@
  */
 #define MBM_CNTR_WIDTH_OFFSET_MAX (62 - MBM_CNTR_WIDTH_BASE)
 
+#define INVALID_CONFIG_VALUE		U32_MAX
+#define INVALID_CONFIG_INDEX		UINT_MAX
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
@@ -335,6 +338,8 @@ struct rdt_hw_ctrl_domain {
  * @d_resctrl:	Properties exposed to the resctrl file system
  * @arch_mbm_total:	arch private state for MBM total bandwidth
  * @arch_mbm_local:	arch private state for MBM local bandwidth
+ * @mbm_total_cfg:	MBM total bandwidth configuration
+ * @mbm_local_cfg:	MBM local bandwidth configuration
  *
  * Members of this structure are accessed via helpers that provide abstraction.
  */
@@ -342,6 +347,8 @@ struct rdt_hw_mon_domain {
 	struct rdt_mon_domain		d_resctrl;
 	struct arch_mbm_state		*arch_mbm_total;
 	struct arch_mbm_state		*arch_mbm_local;
+	u32				mbm_total_cfg;
+	u32				mbm_local_cfg;
 };
 
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
@@ -504,6 +511,8 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
+void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
+unsigned int mon_event_config_index_get(u32 evtid);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a93ed7d2a160..abd337fbd01d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1284,6 +1284,32 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	return 0;
 }
 
+void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom)
+{
+	unsigned int index;
+	u64 msrval;
+
+	/*
+	 * Read the configuration registers QOS_EVT_CFG_n, where <n> is
+	 * the BMEC event number (EvtID).
+	 */
+	if (mbm_total_event.configurable) {
+		index = mon_event_config_index_get(QOS_L3_MBM_TOTAL_EVENT_ID);
+		rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
+		hw_dom->mbm_total_cfg = msrval & MAX_EVT_CONFIG_BITS;
+	} else {
+		hw_dom->mbm_total_cfg = INVALID_CONFIG_VALUE;
+	}
+
+	if (mbm_local_event.configurable) {
+		index = mon_event_config_index_get(QOS_L3_MBM_LOCAL_EVENT_ID);
+		rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
+		hw_dom->mbm_local_cfg = msrval & MAX_EVT_CONFIG_BITS;
+	} else {
+		hw_dom->mbm_local_cfg = INVALID_CONFIG_VALUE;
+	}
+}
+
 void resctrl_mon_resource_exit(void)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index c6274d40b217..bee32eaef8ab 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1601,7 +1601,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
  *         1 for evtid == QOS_L3_MBM_LOCAL_EVENT_ID
  *         INVALID_CONFIG_INDEX for invalid evtid
  */
-static inline unsigned int mon_event_config_index_get(u32 evtid)
+unsigned int mon_event_config_index_get(u32 evtid)
 {
 	switch (evtid) {
 	case QOS_L3_MBM_TOTAL_EVENT_ID:
-- 
2.34.1

