Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A8271A6A;
	Fri, 13 Jun 2025 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848858; cv=fail; b=L67+SOxBC3utuqKHrYkDMuKULb8KRxNOb4WeaQ4W6tpTLVFDXjNj80+/301lCqr8rI9DA+VQzDLv3frHcGCGG44loTPuM6TP6fDqBhC5Df71uvmu7VuasIhjpkrfGrdbIJYCeneGYKd4kf0N0kXDExA3eUlrGui2gd5wQTRNB/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848858; c=relaxed/simple;
	bh=avDxoKntVHya4Nn1QAAPzvqzeCCuIH74pf0g1JE8O/w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nd+t4ts16OPL2kjR3FRh6ZJy2CunAhEF+40/W8Ad7XrnpRQW+dfeIYPygTZyOUx2Va9d8WGwCiHwRa5FEB1qDuNzQffIl+FN1RVThm8mfj8ub3mi3MdxN0wLc93qPVefvDS8vplaKkvfZ42Ku7JcZDjiNWhvfggooCW4843rghw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1Eikw+gO; arc=fail smtp.client-ip=40.107.96.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1Eikw+gO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pxt9WsQaUPjYxhMZj1jF4xM8k08DhY8oMSIaYdBdA450nqM3vwlGcEzITNCgqSm/YRQ7Agf7miANuPwGad9vuIV6yit7kO2EnQ9ew9XZTjNjHEdTkpcl605DHTjx5EuRgn4f+wOr+iD8xYTED6hKFmMV2LKa0DX3vOPuXCMPX2/vQc5CFzyKajT3fb3+O1KW/b59V7Y8X5BD7UBP10qkAX/GKvZ6UX+TsTet0o+uL2EIZoOnY3rr0NIWUXrBQWgpMvk2Ap2m5KJLd9Cp0Kilfqg/aIa1NyAtOrh7pSLIBQ5ps9ybHZEWpErNkqoIqHx0xeobF+asTAIGCw3mXu4DwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zkqRYZ1pP6kCegRWRtnxZgQpLnGhYQo5vOXahBWaGk=;
 b=Pln53bUCLcwgLWai0S/u2Y6uPlmewnlM4B97mYDTqzf4Bqc0KBHxyv8kNNqBdS0zX+XnJp842qF9xpggFP1VfwKtRAnI5b/O0YIvLiTaPQrvMeSkkSXbWylgaM2os0k6WgZPPWQJFMPbvh7MSwEO9eZFvC0UrzAMLf5OYVptyPi+1mRD1PjWHAze3X4Y37HmuM4p+/nxjAE+uQ3yOCpW6n/sq8TVhhYmbgqIzLHquGA1KGmQny2l9OQ+WDogzAML0Vlyp3YW4bsbJQt62ulXd008wXTM8+HAlSGgx89xDJwufXc1Q4d5k+mKHytO1NLvbHW7ZCNgIaWG5ysqr9vqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zkqRYZ1pP6kCegRWRtnxZgQpLnGhYQo5vOXahBWaGk=;
 b=1Eikw+gOIVt2O3unh5Lwz/RpkRQWmybO3tDmG4NH7kjC8egZyq79vtM/0+wbLZRuQQzjDh41rR5VhoWfIALzX1obyMqhiEjHfd7malPj9EUvotkGzTS7Hb6PRKSpWGfizpui7BefCgvCsH9JOQjp5ARBmfBXxQ1In9S745E/Yxk=
Received: from PH8PR21CA0010.namprd21.prod.outlook.com (2603:10b6:510:2ce::10)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Fri, 13 Jun
 2025 21:07:29 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::75) by PH8PR21CA0010.outlook.office365.com
 (2603:10b6:510:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:28 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:07:22 -0500
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
Subject: [PATCH v14 14/32] fs/resctrl: Introduce interface to display number of free MBM counters
Date: Fri, 13 Jun 2025 16:04:58 -0500
Message-ID: <ad9a9feca7638f9be09e348e3647d010a1a5db61.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cee885-69ff-4d8f-993d-08ddaabe4e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kfWlwBlSg1wV1BOzGh99VgLfIP2WaUz6mVV+g72jtgz3Y3fyGKo/6XYF0XBA?=
 =?us-ascii?Q?VJQPQzCeoPixqyC1Sa4Ay92ID4z1ZQczsQKnfk9kkvjqyJReKaDrc5WALiRM?=
 =?us-ascii?Q?M5DzxTNYFbJmSku52HX4usHRQtQK5SOlXp7EylolF1ktl/kqqqLHa1aUJcgx?=
 =?us-ascii?Q?jw7/WaoxeR3ihh3RayRhRzNziTlxGAMOQRsr3ntDJuQOYGLWjUCPBmp/s10v?=
 =?us-ascii?Q?yxpuYHPYLuIYV52HXC96rPlnaPJKdEJpHisephW1YPSmSucUWRuEaA64ojx4?=
 =?us-ascii?Q?pyyGs0ys7VMgKAjxaMk+FJrMmjoC3YeIlxCBkS6c2zCj/sRlzoppkHh9BKrn?=
 =?us-ascii?Q?oIgvwFcgSwEFdSyD/dnM715TKqCV/DabfutcsYFgWC70lXyc3cZulSMsQcEY?=
 =?us-ascii?Q?emYZRcvRClsGZl+M70quOK4u/C84DJvWuKZ+RBgJfr/hJPK/+aRU8K0NHwHT?=
 =?us-ascii?Q?hTFXJpiRq3bOtxXdwmRLo9MMqag7Py2u7MeErvGkaOWYNqcZSpOLeJiLe2gu?=
 =?us-ascii?Q?LGRGrL273gQYY50qQ5pBv2x2W8UQsMpFIyqXk/TSQ+6+IyfU4iXF4N0TitA2?=
 =?us-ascii?Q?IOvkPTlao9LvvxiHd1eIuSOnUYFe7gGLLKMS8xUtUw918le3PjgVv1S0wIAu?=
 =?us-ascii?Q?O0BG9kUk4zXutKQWy9ag/+7hFOEGidtx7bCs9LWW2oJV4lihR0dtaiwyaiIT?=
 =?us-ascii?Q?teiQ9IDtRUGTGJfwp50ZKvWwTqNr52HdSYZNUIpSvzaq1Its6fLTjfdK1JPz?=
 =?us-ascii?Q?eXmt5/yTshZMQgpZIPg0rJyCKSx2BjNTFEh42LTqghvs9RzoHUdqxF8xpxtP?=
 =?us-ascii?Q?jm0eqHSPizeEoGx0yI6nhHFZT9bRRtv1xVBoWwFR5C8gf+PelIQxtuvxnC5K?=
 =?us-ascii?Q?mZcGZGhCouKClMOl43XkRmJD3OiMlF0HXa+/ZhHRqKbOhsnYxspRpoLgq0wp?=
 =?us-ascii?Q?RncHe6H9Evs2VMjY1qXaVsxCW8jlS+7m5pKXYdkt2ivCbWabyirluDJ9DX53?=
 =?us-ascii?Q?r7ufdsAXHnUmurgyEkYsciomBYGd/0sMM/x7Dv27tSRiRfIY55pCWnH4QMI/?=
 =?us-ascii?Q?1Qnhk9J1auiuGS31Z+i5t5q0aWTO6LYnZ9Zq44b1N0OLmw1NsQ/z67EGlC1O?=
 =?us-ascii?Q?Bys6M6vQP8CmZOlEpaoipetVmoc6eIZx+mXbXK8URZoKHr1iHXr6n/xT6HtF?=
 =?us-ascii?Q?oultHx4xb/c0CVS4Jrf9Izn9LGT7cUdGhoW+JR+DQvfGTf5nGPwVA7KxMBPI?=
 =?us-ascii?Q?MWEBDqxXJU/DdnZisOnubdbO8GnSOzapVSKxY4RrSMkU/bLOnB4So9EJL6q4?=
 =?us-ascii?Q?Pitpx3CXW5lI34MwE1EEzR13ubF7t1/jD23VFtmG0HM6NF8nQWe/WWbQ+n03?=
 =?us-ascii?Q?v+Yoze0+OeiSct1Ic7NAkZ1r2A9NqpFeMi/h5xPrLeiAsuwsFJHoqkZtGlTU?=
 =?us-ascii?Q?ya8X4wiosv5T71bh4KXXxzVEHO23qMQx4iMLt5JsXY5lgQ5IbxufLV15RwsM?=
 =?us-ascii?Q?fj9KfxAAdGQlWdDHkwPOeivL4GLHCM3vJ7wNSqyMdyL0vjFNK8YLT4fZhg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:28.8079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cee885-69ff-4d8f-993d-08ddaabe4e35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719

Provide the interface to display the number of counters IDs available for
assignment in each domain when "mbm_event" mode is enabled.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Minor changelog update.
     Changed subject line to fs/resctrl.

v13: Resolved conflicts caused by the recent FS/ARCH code restructure.
     The files monitor.c and rdtgroup.c file has now been split between
     the FS and ARCH directories.

v12: Minor change to change log.
     Updated the documentation text with an example.
     Replaced seq_puts(s, ";") with seq_putc(s, ';');
     Added missing rdt_last_cmd_clear() in resctrl_available_mbm_cntrs_show().

v11: Rename rdtgroup_available_mbm_cntrs_show() to resctrl_available_mbm_cntrs_show().
     Few minor text changes.

v10: Patch changed to handle the counters at domain level.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     So, display logic also changed now.

v9: New patch
---
 Documentation/filesystems/resctrl.rst | 11 ++++++
 fs/resctrl/monitor.c                  |  5 ++-
 fs/resctrl/rdtgroup.c                 | 48 +++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 801914de0c81..8a2050098091 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -299,6 +299,17 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
 	  0=32;1=32
 
+"available_mbm_cntrs":
+	The number of assignable counters available in each domain when
+	mbm_event mode is enabled on the system.
+
+	For example, on a system with 30 available [hardware] assignable counters
+	in each of its L3 domains:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
+	  0=30;1=30
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 92a87aa97b0f..2893da994f3c 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -924,9 +924,12 @@ int resctrl_mon_resource_init(void)
 	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
-	if (r->mon.mbm_cntr_assignable)
+	if (r->mon.mbm_cntr_assignable) {
 		resctrl_file_fflags_init("num_mbm_cntrs",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+		resctrl_file_fflags_init("available_mbm_cntrs",
+					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+	}
 
 	return 0;
 }
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 90b52593ef29..08bcca9bd8b6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1853,6 +1853,48 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
+					    struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+	struct rdt_mon_domain *dom;
+	bool sep = false;
+	u32 cntrs, i;
+	int ret = 0;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		ret = -EINVAL;
+		goto unlock_cntrs_show;
+	}
+
+	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+		if (sep)
+			seq_putc(s, ';');
+
+		cntrs = 0;
+		for (i = 0; i < r->mon.num_mbm_cntrs; i++) {
+			if (!dom->cntr_cfg[i].rdtgrp)
+				cntrs++;
+		}
+
+		seq_printf(s, "%d=%u", dom->hdr.id, cntrs);
+		sep = true;
+	}
+	seq_putc(s, '\n');
+
+unlock_cntrs_show:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -1876,6 +1918,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_mon_features_show,
 		.fflags		= RFTYPE_MON_INFO,
 	},
+	{
+		.name		= "available_mbm_cntrs",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_available_mbm_cntrs_show,
+	},
 	{
 		.name		= "num_rmids",
 		.mode		= 0444,
-- 
2.34.1

