Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F3727381C;
	Fri, 13 Jun 2025 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848880; cv=fail; b=e/QV2gbcvE20AJXV2S92lN4jDAu4PqWeb8j+wNIn+ig5LmNpJeEGVAjrPeIAek5nBfOCpW0rzGuH2DYSXrn2632xfBfx1no2VUOq/hQqkwl3pniL4KfCztontvsQzXpXzr9Mnf6ITl4Ow8gbMFAkajuDofHpeiDT0DHUIL3PL+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848880; c=relaxed/simple;
	bh=5BfU9iDZwCYnFThbeRy8s0CXWAmyd9U56lkCWiPlbVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=doFsPyVD+mwWmmoy3Vwkb6Oonz21xIIjCaUywXZpLxf0eP1KSd6xXW+8G2CVlk8FnXHpUlBi8hgOX9jqwwKZ4sd9uv9JimKGjs+HmodtRVm7x3BSUTrfYGiPJ3ZHjYolKVs0yaaenenCV+iA/FwJWd5rnz0vESsz8JOckGq8dzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KJ3LFCN/; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KJ3LFCN/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdNzjU9lyQwKIveV3K2wKVlU4M9DJWjlQDSLTSCP/RYvOc2pmx7JfBe8jea1C7DWGIXGBxSp8d40x7Zx3+KZB7h73mMOcMIHSC9L7E02xpmtS48ai4cLQokoH6Urwn0L9xx/e8IADQ/ZXgqT8ht0B28V/s45d/tE39Z4w+PHoP2lh1hAHKLhT26LmcufZSGfRDAd5EijpxE9ELBibgZYrDC1sIQeO1V2l6MaN23gWSFjLHEUUSfK6DWBUMw+hRBECIXj74zRxjn74G6lQ+K3FwqTr2cjsgiTaZ9g8xG5sqne99xAdwlDNuYUjzUYjkmnO/FNw6sxpZK09/6s1PQ0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR0oJZ6rUNt4Dy6jyVO/bBDv7d7klwtolNdhOELvpsc=;
 b=wsLyq8n8VyqCAIfOJfDEmUjMbUPAEAspb6+uIZZBII8yeFxTCNElYTvHqaP5OPjn5ic3wu4ucW5RLKAXPFep+tNfNEtamSM9D9GuGawX0YVsGbt0gEwidOHrAr9qS2mesltfLbHSL766dRMvw4U3pN+07Le6X3CzFGaS+NhzyaiAlPmC2M3Ab4wLuaNUQfNC8v9Y9tK3qP1NtNtDyRZxzUwa2zgs6KN6YBym7bz47kOUJNOmV2p57FdzNA1fshRGVoQJlTTTQZihjLG1DRkgOqBWTe4/WakO18Hy/QUy2exkNynokAcOldP6OSBzbLxInfslbvzRwNE8UqLPVK67BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR0oJZ6rUNt4Dy6jyVO/bBDv7d7klwtolNdhOELvpsc=;
 b=KJ3LFCN/2+TlTR82RlZnjzkCH8RSqnwjJww0IEID4s2xGzoQ4aVytFVnWRMWFalUHRyeeORWIA/QYrBjTsq06wKGYuvZYBsk6vdIy4X+2KCEo2paGChVNnvoorSHpPYz5QtSkCy2ZmUvPsUXKfYi48WXW2Mga6QvyfUKDzBNTw0=
Received: from DM6PR05CA0046.namprd05.prod.outlook.com (2603:10b6:5:335::15)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:07:55 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::59) by DM6PR05CA0046.outlook.office365.com
 (2603:10b6:5:335::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:54 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:07:38 -0500
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
Subject: [PATCH v14 16/32] x86,fs/resctrl: Introduce event configuration field in struct mon_evt
Date: Fri, 13 Jun 2025 16:05:00 -0500
Message-ID: <1b9d6c39f654c2a4fe500d7e9be4a13221ac4910.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5464e9-3ff7-495d-c7fb-08ddaabe5db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BArEYXw5NorWnJYluK3QLrmomdC+FsTYD7zvw8qFP5KwGM6NoY6cBjVVX3lv?=
 =?us-ascii?Q?z0o+pYldhdMkL3PGdPIz+ZqavIkA3YEnFq1Bq+n03qEFv7DPJh/9tdLVIzAq?=
 =?us-ascii?Q?fN8m/aJO1TyHPtLSzmO47tdhioETk2IdTT9/Os4t449AhVEeV2L4upma2uxx?=
 =?us-ascii?Q?h/odGH5TwZHn9lHF+U8zN+WDjX/hpC5fxoinKUCW2yoW9eORfCvTAenIpaZ3?=
 =?us-ascii?Q?lrfGfPBb/ObIaGHtoyeYVdgTcRTrOSldjo0i92y+L28V1GARP7/4yWRSxzpW?=
 =?us-ascii?Q?An9S6/tKQRPPyoxgsRza24SJMWhwBdP3rlZ0qZERl8XeztetUV9cwdqqrTCQ?=
 =?us-ascii?Q?/4ahV01CGXhGNe5PG49JMipHB0o/lTChWhKVONLKbEyzOJTetyRBduZNWYzZ?=
 =?us-ascii?Q?XL8LiLT6E/psHeH7OA56cJ656Jc6i/78Gg8+NL5VEq6OBf5TXkJo8ocL94CT?=
 =?us-ascii?Q?8aJP94WMmFRP04KThmtkKI3X2BLpBckjtUbsL3cxriNBTmIg1Go7t7J6n+mB?=
 =?us-ascii?Q?dC+VXG6lvyq3ktnUYZJc/1EzfsiaWhHHKuKAu8k8kRCsZr9sq2EyaMO3pt63?=
 =?us-ascii?Q?nmWE+qPLP9yn36sCBURCXpCJe383UqF9rUw10BZ92m13x+rRA/TE78efbruE?=
 =?us-ascii?Q?nOK0JASka22N5xeBFxU5BvxT38yNvvmyo5E/TpcgnYaP/JGhOlqFr8Ysj9yV?=
 =?us-ascii?Q?Ny1NMpHRY5dO41pd4U7zNr/TAXn5j05gTGfmt4fS4SMoBNMXEb119mrRPWds?=
 =?us-ascii?Q?OZdksb8P9q/b3b+5qpKHV9IZaaKGQQEZB0c9mcPiysf2/04FxZABc0/I+mdX?=
 =?us-ascii?Q?wqruhWj2x5yyqTVllgAk4zs+wklbLpqo1jNYfhGAhGMsynNI6ChR2Cab0jxt?=
 =?us-ascii?Q?ddNnEoIozBitCXzuf+YURjl1MuoDvMRuuUxiIaXMuU2gQhBG1PgnFTxUhkIu?=
 =?us-ascii?Q?hIk4sE0lCdqDIAvjKWUFOn2Ael2Wlh8hZvYsX+XhSeZbvTeFtCPXtrvr2bVg?=
 =?us-ascii?Q?eJYMplYieCUlZuk2mtF63D3600iPrbMsdeBJj+QTqmbHEmanZkzkil+0GDE0?=
 =?us-ascii?Q?CFkz24SAvYgqu24Z3tnKdX8jUwtqh536WK+B+B6vIEdkrbxrOwB202zk0FQy?=
 =?us-ascii?Q?OAsELoB8MmJqSLMsXK7aNh+NehYCqNrCVZuOj1PSjuLalSILTUpaT1Fsh9dV?=
 =?us-ascii?Q?6Qh2xMr6QL10ibaFRnhsyW0446KG+ns9YfdyEZjZzx7+HiEfcT4r14POolBD?=
 =?us-ascii?Q?3BMAMPwmtW8H2oHmZ2hAiPPu3xcHN1xYw6jPJwAF1SjtsRO3hwNEn1oCWu60?=
 =?us-ascii?Q?7oMm2jSeYOlOCPpOVRGMSQR+mP4LUKn7Q3qUOzI8IpMl0N9R5tcxPLG81yCK?=
 =?us-ascii?Q?MAxqg7wrpz32Nz//OL5NJLnhpUFPFdB3lTzj/m3o/H3FjcxOtsDtjN8FUe5C?=
 =?us-ascii?Q?Gdr7uioV8AgqFEDzuWse1fH1HCkvuvaexwAr4NTflvHQAdomCdAne5D3ogUv?=
 =?us-ascii?Q?bBeNt0Z9UWE6Gv8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:54.8116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5464e9-3ff7-495d-c7fb-08ddaabe5db4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198

When supported, mbm_assign_mode allows the user to configure events to
track specific types of memory transactions.

Introduce the evt_cfg field in struct mon_evt to define the type of memory
transactions tracked by a monitoring event. Also add helper functions to
get and set the evt_cfg value.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: This is updated patch from previous patch.
     https://lore.kernel.org/lkml/95b7f4e9d72773e8fda327fc80b429646efc3a8a.1747349530.git.babu.moger@amd.com/
     Removed mbm_mode as it is not required anymore.
     Added resctrl_get_mon_evt_cfg() and resctrl_set_mon_evt_cfg().

v13: New patch to handle different event configuration types with
     mbm_cntr_assign mode.
---
 arch/x86/kernel/cpu/resctrl/core.c |  4 ++++
 fs/resctrl/internal.h              |  4 ++++
 fs/resctrl/monitor.c               | 10 ++++++++++
 include/linux/resctrl.h            |  3 +++
 4 files changed, 21 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 01b210febc7d..1df171d04bea 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -875,10 +875,14 @@ static __init bool get_rdt_mon_resources(void)
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
+		resctrl_set_mon_evt_cfg(QOS_L3_MBM_TOTAL_EVENT_ID, MAX_EVT_CONFIG_BITS);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
+		resctrl_set_mon_evt_cfg(QOS_L3_MBM_LOCAL_EVENT_ID,
+					READS_TO_LOCAL_MEM | READS_TO_LOCAL_S_MEM |
+					NON_TEMP_WRITE_TO_LOCAL_MEM);
 		ret = true;
 	}
 
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 20e2c45cea64..71059c2cda16 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -56,6 +56,9 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
  * @evtid:		event id
  * @rid:		index of the resource for this event
  * @name:		name of the event
+ * @@evt_cfg:		Event configuration value that represents the
+ *			memory transactions (e.g., READS_TO_LOCAL_MEM,
+ *			READS_TO_REMOTE_MEM) being tracked by @evtid.
  * @configurable:	true if the event is configurable
  * @enabled:		true if the event is enabled
  */
@@ -63,6 +66,7 @@ struct mon_evt {
 	enum resctrl_event_id	evtid;
 	enum resctrl_res_level	rid;
 	char			*name;
+	u32			evt_cfg;
 	bool			configurable;
 	bool			enabled;
 };
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2893da994f3c..3e1a8239b0d3 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -884,6 +884,16 @@ bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid)
 	       mon_event_all[eventid].enabled;
 }
 
+u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id evtid)
+{
+	return mon_event_all[evtid].evt_cfg;
+}
+
+void resctrl_set_mon_evt_cfg(enum resctrl_event_id evtid, u32 evt_cfg)
+{
+	mon_event_all[evtid].evt_cfg = evt_cfg;
+}
+
 /**
  * resctrl_mon_resource_init() - Initialise global monitoring structures.
  *
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 468a4ebabc64..a58dd40b7246 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -413,6 +413,9 @@ static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
 		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
 }
 
+u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
+void resctrl_set_mon_evt_cfg(enum resctrl_event_id eventid, u32 evt_cfg);
+
 #define for_each_mbm_event_id(eventid)				\
 	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
 	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
-- 
2.34.1

