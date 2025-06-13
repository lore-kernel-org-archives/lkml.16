Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0743271472;
	Fri, 13 Jun 2025 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848755; cv=fail; b=KfbcSPNKYtMqFugV8HbObBKcFiXmpJT4SsFMmc5ZP+T7YOrclU8SoI2Cu+BsthQWfLXAI1dg7s6S+HefNhQGbkcc0h8+zmAbcyOG05CYJVkU79ehXRhAqcliU+RUWejeaRcyxcyAVFOWt1C8vN05vkseynresQKXawJ95DW0+14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848755; c=relaxed/simple;
	bh=7jPxaM7RSwRUkhyI8ytDuSGMFfcYA49Vbyse4ztYPuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InZ1Vs5sjoVl1+8g6nY01Pno4uz8iN6pUHIjHOapvcCdwErWlIRekhfiqiHEcKD7uxwD5M7kFeEqPSC1rluUVhR2GCVUpbEgyFsI8UbgmQ0xwgHAMctcb7Lylxiui1s9fYJWWM8ltTGcesdAc2Ki+nRF6BypLZZQ3nzIz1a1Zfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1cVubemM; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1cVubemM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBWUKa0cr1YZjut7U6de/1klcqbQTR74DppNkjEMAgO33XsK1llZNxRYGTSXF/xYcu2mzRA1MI8Dsb69WsrK4u60/EYCmfHqkdd7B/CKycfDs3SKbFgJmJLEEBPP9ebOLSa+ggBUtJ1fAZCl5/sJ6T7rppJoKi30iis2j1YroJwbbC3pkzUv+gHFtn6CxJN4xXLwIGhTK6ATFfa0xPDRDxQjRKynHkvv4qzpD3q7zCBekebZP3pM52yjyIGZ6beFrskrRNwWh8rJUk5MKE/wH/kO341ij2h4j8cL/KFnkBUk48AfHvvcznJbPbevOvUSNuJjfCKbXIyoO+wwnqIcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=053J/fIPKScCvT7n3uo5wrYKPnA4p4BDsOviX/kNuTw=;
 b=Wx2WvS1kAWJz9DmN0giKqF+3TJEDd7sUiG7YFLPDzRqZy6GmYWgg8CiUE81FQF5bulHl8JBURnsu7lM4YandXaUwhLesrdN5mEtQV2xahzs7oATFsu/T95PHc0lcwDW2JRbBiRWZPWRTJuhdOVCOz0KJXLBISB6RwshqLo8DfkXYuqux6C1mTAMrTIW0vHKk2LBCAa090dp2iR/5IuUkfaVJ1J/y2WAYSPcnfktMLq0TGFxKk2Qd7adsHJIjyUQi5NxBtKXDB8DfsExIWWjwqfTbYPp6ScS4jgdLa9o48NE3Q5dcHP4rmxJotGNGsgDgfrAZmo/tfwALNv8QnXHffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=053J/fIPKScCvT7n3uo5wrYKPnA4p4BDsOviX/kNuTw=;
 b=1cVubemMJnVTEUA0KjLkTd0Nft34m/mTHuCEt+MjqGLiRrXDKUMMVu9XKUZCpVj2A3+MaUIrTg82M8xJwdtDh6M7koM5B0cvBAG6cMtfUviRc3EZ2dNr1wK+9XeLMI+63qK93UqH3GhR1a21YO9TDUO5tyDp1QQ9roy9p4+QW/o=
Received: from PH0PR07CA0041.namprd07.prod.outlook.com (2603:10b6:510:e::16)
 by LV9PR12MB9782.namprd12.prod.outlook.com (2603:10b6:408:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 21:05:50 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::26) by PH0PR07CA0041.outlook.office365.com
 (2603:10b6:510:e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 21:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:05:50 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:05:47 -0500
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
Subject: [PATCH v14 02/32] x86,fs/resctrl: Consolidate monitor event descriptions
Date: Fri, 13 Jun 2025 16:04:46 -0500
Message-ID: <80689a762e59137f0d0297ee4ce0d31f070a3655.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|LV9PR12MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aae3d05-8627-4905-91ce-08ddaabe1354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjPO2ZsrFst4RY28c1psWRSqOz+fq4YoMggt/cNPWMwWMFMttsvjrh5NnK+0?=
 =?us-ascii?Q?QgNHi2EWlWKPt6aal6gVvvLS+9YUiWVMfE8uVvArXdMMpDWoN0Pf5xMtApCv?=
 =?us-ascii?Q?ev0EqSQd1dbwGUAkepGsf5YwVKiZuc9eKF6G2EXz1lnMJP8U0CZ4NSwqjxnn?=
 =?us-ascii?Q?9GOgSW5gXYL2FmjKzspDPkKlCC1ZPsTWMxMQ7XtMLRcmByM3+pmT1zN0T10p?=
 =?us-ascii?Q?e/z3dGbVyKTSGYuOGDlBVI7CX7ZDteakhAV1+BBIRaBznoM3XVaEXEP/VEru?=
 =?us-ascii?Q?90sSUQ0JnE/OqMijn0dN5A/ssR14Ml2Af5H1bRPWCP4c8SFB9P952CD3p5vf?=
 =?us-ascii?Q?IIUVzIeM2O1vKirlabcJvnSvMk8Sg+1EIDLtnZmCyihr7htYw1mQjH/ZgsRR?=
 =?us-ascii?Q?aTfzIfCfhujfeeM4Xfe1LIsq2AY7JI3kCMhEogmdh3Oqyr7SN/kywW0TXIfk?=
 =?us-ascii?Q?veQXFItIjDIqMefoY0xUuViOuISoxCEzuXc3jmSCpl+rPE3iaWU/TKxZ9B3a?=
 =?us-ascii?Q?1QKP7eEsObQIcpsJsCWo6ghlFqFJIjT6WFIvXWyDfaSGPaUUiQHYiycvcq65?=
 =?us-ascii?Q?C8+A1Ed54vhe9hg932SkYGkEDANa5U904/L+chUWAGOzCToYrxsoSO/oeARd?=
 =?us-ascii?Q?cFazplMAxhCWhMfa8S2GyRhHWEk2wHBbC2syz9ERcoiWagyftzouWcM2h3Wk?=
 =?us-ascii?Q?vbO/CWWLo3a5Y0H6sMs7WCHP6mH55HHvmvBmJc9BG65NbsUzYFSQGQ15PG+w?=
 =?us-ascii?Q?kmQ9wxeBhkiJL+X76AQaMTzkpdaxeaGMaEvw2KYxRs3XNxt9m2c8/nuysDSJ?=
 =?us-ascii?Q?A8kHh6Emnj31GIlHmoEufEFEM6g8/z+CaObpSeFGG8L45SxkEU+3kjLAvmMC?=
 =?us-ascii?Q?HjrKEw/8C4YPVbcLbHYmYdx4vshZOOI3ZsZQcg7es94p3q0gWlzWlExJ46SP?=
 =?us-ascii?Q?EH3WDvwtYyz1JdxqpdW62F+zq+kmu2AZnnYxiQ3VoaPjKDY9sMEgVcMRYBL1?=
 =?us-ascii?Q?NbJWwoOn8CzXZZRzK3u0ZtxRpS1iz6ZYvqGlK1+JLih+COUBkY9XF7wsQIQs?=
 =?us-ascii?Q?GJKutV9f3XclobOhdDPEmxX2vMlMuLTyc2Z3Zw1NWwG2HxaaID5ETkp39kFb?=
 =?us-ascii?Q?QsPTAKtu+aGMgCO4F4x8xHlLInzMaVgF4wqrOlKGozxKpWYuImloGpcHDM/0?=
 =?us-ascii?Q?oyJ6HZwEpgKf1XNDd1DZsJHmtdKbYhW1TcfcDhwTqMocNZs3/t5DJZYjvUQr?=
 =?us-ascii?Q?+E/LsjqjJr0ydMrYRHq1al4qHuqO+qaGRf1BTB6qYHbw2OfdwLUQMGZIfLbv?=
 =?us-ascii?Q?3XButwQKDteIhY0axYPeBJ1d61l4mKLAgy9YYMSZXzzPaqvPpafUJtPDoz+p?=
 =?us-ascii?Q?2fh7svkbrt9TWMnGVhZsdAR5WIw79di0Pj0LWPaoZvcvaaGHLF4SSjJ1ZK5L?=
 =?us-ascii?Q?8+X9vXQKXm4sJxkc+bE2zAVPuESVvLkxdQ4Ot3ZSWKA5j8kdcsAiZ7IUWLeS?=
 =?us-ascii?Q?zxPQLBeIaJPslzL9fuR9m6YX/7buPlfxaue0suUg5pgGTo1K6ScaIpQmmdEG?=
 =?us-ascii?Q?P3UEik+KBvQ2uU9Ke7s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:05:50.0252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aae3d05-8627-4905-91ce-08ddaabe1354
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9782

From: Tony Luck <tony.luck@intel.com>

There are currently only three monitor events, all associated with
the RDT_RESOURCE_L3 resource. Growing support for additional events
will be easier with some restructuring to have a single point in
file system code where all attributes of all events are defined.

Place all event descriptions into an array mon_event_all[]. Doing
this has the beneficial side effect of removing the need for
rdt_resource::evt_list.

Add resctrl_event_id::QOS_FIRST_EVENT for a lower bound on range
checks for event ids and as the starting index to scan mon_event_all[].

Drop the code that builds evt_list and change the two places where
the list is scanned to scan mon_event_all[] instead using a new
helper macro for_each_mon_event().

Architecture code now informs file system code which events are
available with resctrl_enable_mon_event().

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14: This is Tony's work. This is part of Tony's telemetry series.
     https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/

     Tony made special update for me to include in this series.
     https://lore.kernel.org/lkml/20250609162139.91651-1-tony.luck@intel.com/.
---
 arch/x86/kernel/cpu/resctrl/core.c | 12 ++++--
 fs/resctrl/internal.h              | 13 ++++--
 fs/resctrl/monitor.c               | 63 +++++++++++++++---------------
 fs/resctrl/rdtgroup.c              | 11 +++---
 include/linux/resctrl.h            |  4 +-
 include/linux/resctrl_types.h      | 12 ++++--
 6 files changed, 66 insertions(+), 49 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 187d527ef73b..7fcae25874fe 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -864,12 +864,18 @@ static __init bool get_rdt_mon_resources(void)
 {
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 
-	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
+	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
+		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID);
 		rdt_mon_features |= (1 << QOS_L3_OCCUP_EVENT_ID);
-	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL))
+	}
+	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
+		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
 		rdt_mon_features |= (1 << QOS_L3_MBM_TOTAL_EVENT_ID);
-	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL))
+	}
+	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
+		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
 		rdt_mon_features |= (1 << QOS_L3_MBM_LOCAL_EVENT_ID);
+	}
 
 	if (!rdt_mon_features)
 		return false;
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 0a1eedba2b03..20e2c45cea64 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -52,19 +52,26 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
 }
 
 /**
- * struct mon_evt - Entry in the event list of a resource
+ * struct mon_evt - Description of a monitor event
  * @evtid:		event id
+ * @rid:		index of the resource for this event
  * @name:		name of the event
  * @configurable:	true if the event is configurable
- * @list:		entry in &rdt_resource->evt_list
+ * @enabled:		true if the event is enabled
  */
 struct mon_evt {
 	enum resctrl_event_id	evtid;
+	enum resctrl_res_level	rid;
 	char			*name;
 	bool			configurable;
-	struct list_head	list;
+	bool			enabled;
 };
 
+extern struct mon_evt mon_event_all[QOS_NUM_EVENTS];
+
+#define for_each_mon_event(mevt) for (mevt = &mon_event_all[QOS_FIRST_EVENT];	\
+				      mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++)
+
 /**
  * struct mon_data - Monitoring details for each event file.
  * @list:            Member of the global @mon_data_kn_priv_list list.
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f5637855c3ac..2313e48de55f 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -844,38 +844,39 @@ static void dom_data_exit(struct rdt_resource *r)
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-static struct mon_evt llc_occupancy_event = {
-	.name		= "llc_occupancy",
-	.evtid		= QOS_L3_OCCUP_EVENT_ID,
-};
-
-static struct mon_evt mbm_total_event = {
-	.name		= "mbm_total_bytes",
-	.evtid		= QOS_L3_MBM_TOTAL_EVENT_ID,
-};
-
-static struct mon_evt mbm_local_event = {
-	.name		= "mbm_local_bytes",
-	.evtid		= QOS_L3_MBM_LOCAL_EVENT_ID,
-};
-
 /*
- * Initialize the event list for the resource.
- *
- * Note that MBM events are also part of RDT_RESOURCE_L3 resource
- * because as per the SDM the total and local memory bandwidth
- * are enumerated as part of L3 monitoring.
+ * All available events. Architecture code marks the ones that
+ * are supported by a system using resctrl_enable_mon_event()
+ * to set .enabled.
  */
-static void l3_mon_evt_init(struct rdt_resource *r)
+struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
+	[QOS_L3_OCCUP_EVENT_ID] = {
+		.name	= "llc_occupancy",
+		.evtid	= QOS_L3_OCCUP_EVENT_ID,
+		.rid	= RDT_RESOURCE_L3,
+	},
+	[QOS_L3_MBM_TOTAL_EVENT_ID] = {
+		.name	= "mbm_total_bytes",
+		.evtid	= QOS_L3_MBM_TOTAL_EVENT_ID,
+		.rid	= RDT_RESOURCE_L3,
+	},
+	[QOS_L3_MBM_LOCAL_EVENT_ID] = {
+		.name	= "mbm_local_bytes",
+		.evtid	= QOS_L3_MBM_LOCAL_EVENT_ID,
+		.rid	= RDT_RESOURCE_L3,
+	},
+};
+
+void resctrl_enable_mon_event(enum resctrl_event_id eventid)
 {
-	INIT_LIST_HEAD(&r->evt_list);
+	if (WARN_ON_ONCE(eventid < QOS_FIRST_EVENT || eventid >= QOS_NUM_EVENTS))
+		return;
+	if (mon_event_all[eventid].enabled) {
+		pr_warn("Duplicate enable for event %d\n", eventid);
+		return;
+	}
 
-	if (resctrl_arch_is_llc_occupancy_enabled())
-		list_add_tail(&llc_occupancy_event.list, &r->evt_list);
-	if (resctrl_arch_is_mbm_total_enabled())
-		list_add_tail(&mbm_total_event.list, &r->evt_list);
-	if (resctrl_arch_is_mbm_local_enabled())
-		list_add_tail(&mbm_local_event.list, &r->evt_list);
+	mon_event_all[eventid].enabled = true;
 }
 
 /**
@@ -902,15 +903,13 @@ int resctrl_mon_resource_init(void)
 	if (ret)
 		return ret;
 
-	l3_mon_evt_init(r);
-
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		mbm_total_event.configurable = true;
+		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		mbm_local_event.configurable = true;
+		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 77d08229d855..b95501d4b5de 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1152,7 +1152,9 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 	struct mon_evt *mevt;
 
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	for_each_mon_event(mevt) {
+		if (mevt->rid != r->rid || !mevt->enabled)
+			continue;
 		seq_printf(seq, "%s\n", mevt->name);
 		if (mevt->configurable)
 			seq_printf(seq, "%s_config\n", mevt->name);
@@ -3057,10 +3059,9 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 	struct mon_evt *mevt;
 	int ret, domid;
 
-	if (WARN_ON(list_empty(&r->evt_list)))
-		return -EPERM;
-
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	for_each_mon_event(mevt) {
+		if (mevt->rid != r->rid || !mevt->enabled)
+			continue;
 		domid = do_sum ? d->ci_id : d->hdr.id;
 		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
 		if (WARN_ON_ONCE(!priv))
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 6fb4894b8cfd..2944042bd84c 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -269,7 +269,6 @@ enum resctrl_schema_fmt {
  * @mon_domains:	RCU list of all monitor domains for this resource
  * @name:		Name to use in "schemata" file.
  * @schema_fmt:		Which format string and parser is used for this schema.
- * @evt_list:		List of monitoring events
  * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
  *			monitoring events can be configured.
  * @cdp_capable:	Is the CDP feature available on this resource
@@ -287,7 +286,6 @@ struct rdt_resource {
 	struct list_head	mon_domains;
 	char			*name;
 	enum resctrl_schema_fmt	schema_fmt;
-	struct list_head	evt_list;
 	unsigned int		mbm_cfg_mask;
 	bool			cdp_capable;
 };
@@ -372,6 +370,8 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
 u32 resctrl_arch_system_num_rmid_idx(void);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
+void resctrl_enable_mon_event(enum resctrl_event_id eventid);
+
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
 /**
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a25fb9c4070d..2dadbc54e4b3 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -34,11 +34,15 @@
 /* Max event bits supported */
 #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
 
-/*
- * Event IDs, the values match those used to program IA32_QM_EVTSEL before
- * reading IA32_QM_CTR on RDT systems.
- */
+/* Event IDs */
 enum resctrl_event_id {
+	/* Must match value of first event below */
+	QOS_FIRST_EVENT			= 0x01,
+
+	/*
+	 * These values match those used to program IA32_QM_EVTSEL before
+	 * reading IA32_QM_CTR on RDT systems.
+	 */
 	QOS_L3_OCCUP_EVENT_ID		= 0x01,
 	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
-- 
2.34.1

