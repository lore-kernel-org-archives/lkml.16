Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3222028D8C4;
	Thu, 15 May 2025 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349665; cv=fail; b=AyoTfUYfu1mBEB4AeyXlx6uGSDl4GWZR7HZJzDSbHrLvedqk9p851VexlUCoOX2c5S5nBC8Fu3miWEdW3SQgqKTXhRi180ry/L8ygM2PytWHbXLidNPWXaNnZwqTFg1wgBAfMpG8QsaZvm635avwvc47YvdxLR/t8XV+YBn3t3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349665; c=relaxed/simple;
	bh=jaBOlCyKeTznfflRMV6AZ3ppi0uBmXWFVZZGdpKcxM4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJAcoDtzn3vjJQ9hsnJ4a2sT7JExlTW8pw69G6h4P/kaJNPx7w0eXcx+WF46G60r2Yj7hJYNvr9zwaxpIgWoqMwf1BYSe8ShviFzE6aRfHAN90WI5SHs3FA96UA90kjy6yA5AOOS8vm32xlUsqz7Pe0A7CZbbe047uSjE8+VO78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OX3i9otm; arc=fail smtp.client-ip=40.107.101.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OX3i9otm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMFoungazQ7mpKvj8oX0zpx81tn1zdjKHwtyAn6A2JA0/i5Nhzn+6a11k95jt2eHVz7nGDQnivVHmOOAZdh+gpq0Hj+AVXqYAIDnJPacOpTEdwFCKzNYFzvHXjj7REIPb9jLmh2ABNoqBg9fmw3KOaTbW3KbTiEYh7+pqenSWGKPThDGFngxRLOpHCMOVAiPaDnVJJ0jXU1TUPVazu66pHz5FPVBuWBIdkaEyQhath4VbsDTO551OtWJtVjhGvIt3jyejTyx880X9XDKUGxKicl5mtFsFIyKW7kaprbfvqR+5WExbkSsB2Dolf/lx7G6zNwb8LDGtIhTsJCyj0vrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy/TxVySw4h94wuTcseqUiMgpPwH9Cfk1iwTMOvzr4g=;
 b=vByKlk8dVUgFhIEEGoJ+uLTB3gpBuFwxQDOvRxEsPmhEtQbREcq88JJaKx8cJHtgzSf4fVV46pjnW++/kc7QKc/vXBfYQZnm+yZnHa3bGkHMr9B12YRtNL8ErLTzbjbk/WWO5Bd+THXHf8IZeVn2/0/1i4PpxocP8Rt2I7eVSe4ILVoaXsA0yMYkitKcGTEqj3LcI8GXefS4iL4+9NEMsWc0pT7zk8n7dMdLnIPGjogILzhETP7FR8jfU5u5bxWDCmbiDAVKahGS33dAHkukWlvcUCHDcDKcvsdAodWQ8jzMcP9NjfUtD3r1vuTgvyZq7zMbsO/DJaXgvNrAl9Y8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy/TxVySw4h94wuTcseqUiMgpPwH9Cfk1iwTMOvzr4g=;
 b=OX3i9otm7RBdAZxAuL3OsdWiMbtk+0KYDqhihLJhSkCrSdKmHY6AvPmb9DcH3n4hfWC9r77Dw9IoyDSe+RsA4jAmeGZMRWN7eWh7mICRO6hjz/GRYhsJ9ZHMxY8XnNjaUbzOkf15wBJJg5PigLoG+wiVuWgkJL+/syW5AiIf6Ik=
Received: from BN0PR04CA0193.namprd04.prod.outlook.com (2603:10b6:408:e9::18)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:54:20 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::b2) by BN0PR04CA0193.outlook.office365.com
 (2603:10b6:408:e9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Thu,
 15 May 2025 22:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:54:19 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:54:13 -0500
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
Subject: [PATCH v13 12/27] x86/resctrl: Introduce event configuration modes
Date: Thu, 15 May 2025 17:51:57 -0500
Message-ID: <95b7f4e9d72773e8fda327fc80b429646efc3a8a.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DS0PR12MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 180ad92c-0035-4db1-d6b4-08dd94036d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VyF/QwYc8FW0UCgrLygGaO9LrP4zt1KKN+SJRWAk95r68bcnQXXdhlqOY8Uu?=
 =?us-ascii?Q?5u+6AaVenv4vKBiKybSCFij/Jql6E0hD3mgInqapaA0Ay7kFa5PitT+uHnlh?=
 =?us-ascii?Q?T8XUzs84dKbQAuwbtXjgIEsLS4by2AEzDbuNlNGjIfaZUYCWLI1Rp7sKFI8N?=
 =?us-ascii?Q?93EqpUiXi17/hKT2+6HgdXHq3HWlSOO5k0JoBz2tSylxUPQDPmOQp7ekbFZA?=
 =?us-ascii?Q?ewiDaHM/M5XQdlcqSUJ8cHIVBa+YkYVJmWsxYoluV+Q+7+Gcz0FTOf1W22me?=
 =?us-ascii?Q?jdPSFXZnLUpZ2svUB7WjCrH97R1MZDWInUnzqtxl+9cUTQVMfaqP+RazH43M?=
 =?us-ascii?Q?U2K2yCSfBCWDoOZSW5LjEAWtppmPk6T1CNUxq3kGdcT4DKWhdgT6byJyI4b3?=
 =?us-ascii?Q?KoLqKGWmpaWyztguWwYak3TJSVg+dVDnfHMNtGnpb9H+K26LgxjseXM7VmFW?=
 =?us-ascii?Q?Jhhndt9WtkbGD61Y64yVhnIh5E4WfJXAYG6U1CRYM2QzQiiAW+8AmeP7RSjS?=
 =?us-ascii?Q?uBEYe2BK3yGJkN9Yw4M/ERY3Ky0BBnXaMmBUB/8R407ERY2AH303eBhNl9JH?=
 =?us-ascii?Q?etkAPd+1dcsAYNNjC59bJjwmGEn7lruluBt37J5HDRYvoCTaJJBDZWv9HV1i?=
 =?us-ascii?Q?vPeuYXIlb8zwbnGM8uwwwdWfGsdA1CbX681mPfmJ5pGy94AsuSi8Y1AFbVa2?=
 =?us-ascii?Q?rkrgCyzLfAwDFd63uFgaT/eKkqYpbt9UKrR07J12ppjSzzOQYZjp5wwE0VxG?=
 =?us-ascii?Q?O82Z1WTAeD6VseRPehzYEKnbBkhNdlRAbnpMaveYhs1KZaTLkD/arXD1ukHZ?=
 =?us-ascii?Q?qzDOO9oSsN8iAp3FJKfxXeKGSos/tUmv0c7N8S6Bnf6fJk6Ucxr7WPc12NLs?=
 =?us-ascii?Q?08wMh9gFP/U+jK7z4SB5a07AltnNo3rOT+oCQEbyGYTFaiuFtOFK2H4xs+NY?=
 =?us-ascii?Q?WUwY8fKLWBAJXf1hDhfk+XGCuB+u6V8GuEEm5mIV6C9XSSgdn9lXPvd01XWh?=
 =?us-ascii?Q?nVdbp3MbxCRjOojxPMdcuk/6hYXoedBacXnJ9oIS4vStHYdVyX/ySzGM23GR?=
 =?us-ascii?Q?kvqTPc1CC9kxd+ftrKMTsr9n1QZBbKTitLEC9bVJLkH8feoLYQ96a9t99Oqk?=
 =?us-ascii?Q?/PeaCbqaEUwxQjKCwJiMhP9nNx6hfM/JPlAaCFdKi+n6EYVElsY/QSdsWyPM?=
 =?us-ascii?Q?UzYBUFnomOHeankA5P/4XMCIyT4/hVZkyI1jHD9MHdMFQEyz71GZBT2n64tG?=
 =?us-ascii?Q?mTgzZtmn/lwWQq7lOpHn02tSJwHj1HGg7VlG9VoDQ619IVLB4wr6lLcs+fHB?=
 =?us-ascii?Q?GUyhgp3dM1ZPCFDTrUTbJNrhlhNZAVB+w6SKvFxsjWcNft3SIldPwLW+hWFm?=
 =?us-ascii?Q?UnWmpfbbL7NrLUhoyACDwbrpSpOGwY/Y0h2WnzuKiafRwwvhILJT2ZfueBq3?=
 =?us-ascii?Q?yvqD/6IwPjW7D8+jqpbJJ7C6tx02oV3mx+LY3OeKoSyN0QXQ4IIM5qmeVSCy?=
 =?us-ascii?Q?i75izPlPwM5XaZQPeXtx4dLvTZkgsYogTzYu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:54:19.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180ad92c-0035-4db1-d6b4-08dd94036d6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437

MBM events can be configured using either BMEC (Bandwidth Monitoring Event
Configuration) or the mbm_cntr_assign mode.

Introduce a data structure to represent the various event configuration
modes and their corresponding values.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: New patch to handle different event configuration types with
     mbm_cntr_assign mode.
---
 fs/resctrl/internal.h         |  6 ++++--
 fs/resctrl/monitor.c          |  4 ++--
 fs/resctrl/rdtgroup.c         |  2 +-
 include/linux/resctrl_types.h | 11 +++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 9a8cf6f11151..0fae374559ba 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -55,13 +55,15 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
  * struct mon_evt - Entry in the event list of a resource
  * @evtid:		event id
  * @name:		name of the event
- * @configurable:	true if the event is configurable
+ * @mbm_mode:		monitoring mode (BMEC or mbm_cntr_assign)
+ * @evt_cfg:		event configuration value decoding reads, writes.
  * @list:		entry in &rdt_resource->evt_list
  */
 struct mon_evt {
 	enum resctrl_event_id	evtid;
 	char			*name;
-	bool			configurable;
+	enum resctrl_mbm_mode	mbm_mode;
+	u32			evt_cfg;
 	struct list_head	list;
 };
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2548aee0151c..8e403587a02f 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -903,12 +903,12 @@ int resctrl_mon_resource_init(void)
 	l3_mon_evt_init(r);
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		mbm_total_event.configurable = true;
+		mbm_total_event.mbm_mode = MBM_MODE_BMEC;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		mbm_local_event.configurable = true;
+		mbm_local_event.mbm_mode = MBM_MODE_BMEC;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 	}
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 752750e3e443..f192b2736a77 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1152,7 +1152,7 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 
 	list_for_each_entry(mevt, &r->mon.evt_list, list) {
 		seq_printf(seq, "%s\n", mevt->name);
-		if (mevt->configurable)
+		if (mevt->mbm_mode == MBM_MODE_BMEC)
 			seq_printf(seq, "%s_config\n", mevt->name);
 	}
 
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a25fb9c4070d..26cd1fec72db 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -47,4 +47,15 @@ enum resctrl_event_id {
 	QOS_NUM_EVENTS,
 };
 
+/*
+ * Event configuration mode.
+ * Events can be configured either in BMEC (Bandwidth Monitoring Event
+ * Configuration) mode or mbm_cntr_assign mode.
+ */
+enum resctrl_mbm_mode {
+	MBM_MODE_NONE,
+	MBM_MODE_BMEC,
+	MBM_MODE_ASSIGN,
+};
+
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.34.1

