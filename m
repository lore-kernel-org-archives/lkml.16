Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E428C2C2;
	Thu, 15 May 2025 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349617; cv=fail; b=A7AV1lDwuth41eNmojk7RExSnMK7uXGjixGH53y0D7hd9zUe2GfdfgK5JaJBrd/6d3TtgOjR3LYgu5zScGVl5VsSNbTUTt1eXDoa3ktooog+ppaR49AH8r2TDDYQRBQb9nfrVZk2l0bQYHyYEjcpG5JeWASy/1XyZW+Lp5wG/v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349617; c=relaxed/simple;
	bh=sZwmpPXRz8GEiz3dAKWnHvNdlzlKdAY+x6M7cyfXVIk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbMgM+YcbJ6IenMf9yoaM4EOIFFqOmtPb4gWMM48vmOWzL3Rye0kDzGwSHt2Td6YCZaiGXQUNOh6wTBLEgnzlQAP2blojEisTHUDG44HqzdeXsyV2zs2b7bXQJbgG22APhl5+G3Jw8YmWIcf7p8b1lY+UvHHXiBvhEXlHVdyB70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AdUziLfu; arc=fail smtp.client-ip=40.107.95.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AdUziLfu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARGxABbiyki8i8iZp8yPqlY0kSlu1bpCWaqP1Kyhjt4SfyKEjdk6J4fK64R/G3YI5yv3HO54iwRooFVGzdxYCpTDi1AJDrSsFRNXvnTVn/8LI3xIMDJC3TKoWKkhVYGQL62MBzrmwFame+jEBnzgVW5FYpqFP96jk6jTAx+ZyKgtSVSkuIFJtTrBitOfVhRGmgfNr/wchGv2vZmWZ8MzGJlW3LJOr7krd2qrOm+ZwlKY0R5vCnYc4modHy91Og+pJABZggTKWGaAKB80mQvy2Z4MES7ov4yP54VOTTAdoEwJaKYzdIUJtH/JEU6+9NN8lVbmvUrUCvI8yzsQcbKdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwxYVwemHOzvAyud1yZbWakkt3bTCFU9s7J0l/NjzcI=;
 b=jrQ6JRZCrLOLIU4NDHakKT3ZgRRMEsiNE50ZgpEpYG5twIm34CL59xEklXGQA3VhXPPoNBp1TDSzp6NuM4GOjmpE4s9PXlf81S05NpSrMUOTcFBIO9gyYRe0xgRbjaGWfd0SgK7Cgt6ihMABzjTj6rHzIG1g1Npf1Q/Z+vqAx7a5GbY87t/f50HWiwXGecQxuPLihdMun7D6xc9bLLIupYWsZH+m6OX+Hz1Zq/h59RLz41UMCSrLfy6fhKGhCN4nmMcqjW8y5hkAkhnUhxj6ZBvKEZnbOZ6dDHwSNxstUUcfALMdb3tEmeLqv3u1g27HFi2VKLzp17PboLb5nHLy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwxYVwemHOzvAyud1yZbWakkt3bTCFU9s7J0l/NjzcI=;
 b=AdUziLfutlINCw+d5KoOTwChNe1UjfArqU/CZAi9EBLtGxnnI2NEl/sJhZ+qlCraFVUGj+NBMe1ru7cp26p4uRxl4ZoSc8RIvFyEzuZzRSeP3CssCIJ2gTxXY1zR0wbzWg0ncljfbseV2FTIemjLr6jKUjI22ctIvIlKv6zZQCU=
Received: from BN0PR08CA0019.namprd08.prod.outlook.com (2603:10b6:408:142::12)
 by CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:53:29 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::8a) by BN0PR08CA0019.outlook.office365.com
 (2603:10b6:408:142::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Thu,
 15 May 2025 22:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:53:28 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:53:25 -0500
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
Subject: [PATCH v13 07/27] x86/resctrl: Introduce interface to display number of monitoring counters
Date: Thu, 15 May 2025 17:51:52 -0500
Message-ID: <bfab743a93ed88a841afd5b1a6398accd8d1d32a.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CY5PR12MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 6daf80c9-ff18-48f5-61c7-08dd94034ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9BqlSUFIBLbX3RB2Pc1tEj8aG5N6nSYzmIf54dBLNQkgYvc2Tbbp0kbePTr9?=
 =?us-ascii?Q?iXmo8C2ur2js0Ada7trYHxvs2D8cXFDfVmD2HzRiGXZmCC26uCs8iZEeeRZB?=
 =?us-ascii?Q?5EzvNOJ74mfOGr4687ncVcYgq+Ygl6h3mCKpMTrKqaev4gE88oommE3YWoWk?=
 =?us-ascii?Q?GPtRyYk1+SnN9/ua7x0SuKmK07U/n54mM0QEGmM7h5FxyOmV54MdZyUI8TQR?=
 =?us-ascii?Q?JRR9nbHlCZb5NU1IFxlmxz80SY0g3MDuXF4jhblxfh4+NubqS0Mc0EG/kqFS?=
 =?us-ascii?Q?SJVrhWnXVdb4YPxshYC9ZI4foEZ4q/0KbxDjffHUkcTxdvxYnItEwxgYPjmC?=
 =?us-ascii?Q?BukUi6mdVaVTUiTcRjQ689wiwLJJAWd6Ec5McAiO5jpum9x/jy1qXw6LQfQb?=
 =?us-ascii?Q?OstWzu034O7zTakYnSUVDEnVZzOy75TCGjt8eONvywZuWi8pCbEzqbcK9csQ?=
 =?us-ascii?Q?ErT4ofQKj4m+qkqJ3EL65R7h/idRTOFnJEUEweQK47XAdMVPs9EhscwGRQCe?=
 =?us-ascii?Q?lHRs0wa98+IpzWGqFiYA5ADJ/1/j7rkvRG5bDHL0OEylYLyzuVfgY/ZNW5LX?=
 =?us-ascii?Q?IGj6g6lSojRz6x9hSk8EUd00/rKFXewNgp3yo3QN2M+YxbZKZpY5DemT253u?=
 =?us-ascii?Q?yw+hyklbGJU/p4H0b8xQPCNvdvFcW72JPGl6Ng9FssDskAvjegcxKz3BSpAU?=
 =?us-ascii?Q?E251mYnLVa8kAlBQiwYaf3/5HtTqWnPTLCNT39FNq+NzeUltZgzqbBKixUzq?=
 =?us-ascii?Q?jvata6nWIp6Tb5qHWTxbxJ04lkc87OCDdc3vYJeMT0J6MWkB6pFkXAFft6Fc?=
 =?us-ascii?Q?Mz8m91rIy9Kp2dBkiBkozdCnPeXyKlVXOE44KjoDhAdGDi48RexwfsCsHurF?=
 =?us-ascii?Q?5pNQZA//i6c9YO8xfkPI0U0VleiZgce2+b/B0YlZ/XsWEdZ77Ml7h6OdhdQC?=
 =?us-ascii?Q?+UTGcGE8Bv4Du/0sAASH790P7ZEOOHA6gngrYCn6T2wUzPydk7xwdIbaPwFm?=
 =?us-ascii?Q?g07gFfIGFJauMHr3aFCGigJAll0n5ExOALI3eEPpmFbZfMIEbKrWLH6XYYqC?=
 =?us-ascii?Q?U/2onJY3FaPAluwg8Xp+VBd5xqh7piyQGsYIEWTqjWTBY4yut8xHTLsgzcQa?=
 =?us-ascii?Q?GVcMwAYCg1QtobgpkTWf1SGOnaDO5xgJeQV0+V8fD16hU16RrAHvbtj4irx1?=
 =?us-ascii?Q?lO2pFf21BNdSneMcFFhd0D+XK6rG3FPntOZpa3toeIPMuY6+LcZETuZNU9fx?=
 =?us-ascii?Q?GpzREQtSGgKfauXsT1SWLiLtf/5NqxowKxsDeGGGGiB85vhuYl6kNlP94yYA?=
 =?us-ascii?Q?jythfqEOw2ljdExqmkRC7j7oWGNS0PDnxpO0wefTriQdit+NbIrVnzXfvDnB?=
 =?us-ascii?Q?HsNh7mar/+2YvhK1BdYkFE/fIHcWZekereGp7BK22/3/iNhzaKq3SLqk9pRD?=
 =?us-ascii?Q?6lWhc+gHa8orw4Xh0WtCBinVKIrGiQ9qlIwJn4gRpABeBlP/1OTMaMLJMI21?=
 =?us-ascii?Q?eCnGqcGvKI/r9MVN1cN1HVEH8i6I2z8V7G9J?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:53:28.5397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6daf80c9-ff18-48f5-61c7-08dd94034ee3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479

The mbm_cntr_assign mode provides an option to the user to assign a counter
to an RMID, event pair and monitor the bandwidth as long as the counter is
assigned. Number of assignments depend on number of monitoring counters
available.

Create 'num_mbm_cntrs' resctrl file that displays the number of monitoring
counters supported in each domain. 'num_mbm_cntrs' is only visible to user
space when the system supports mbm_cntr_assign mode.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Updated the changelog.
     Added fflags RFTYPE_RES_CACHE to the file num_mbm_cntrs.
     Replaced seq_puts from seq_putc where applicable.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.

v12: Changed the code to display the max supported monitoring counters in
     each domain. Also updated the documentation.
     Resolved the conflict with the latest code.

v11: Renamed rdtgroup_num_mbm_cntrs_show() to resctrl_num_mbm_cntrs_show().
     Few monor text updates.

v10: No changes.

v9: Updated user document based on the comments.
    Will add a new file available_mbm_cntrs later in the series.

v8: Commit message update and documentation update.

v7: Minor commit log text changes.

v6: No changes.

v5: Changed the display name from num_cntrs to num_mbm_cntrs.
    Updated the commit message.
    Moved the patch after mbm_mode is introduced.

v4: Changed the counter name to num_cntrs. And few text changes.

v3: Changed the field name to mbm_assign_cntrs.

v2: Changed the field name to mbm_assignable_counters from abmc_counter.
---
 Documentation/filesystems/resctrl.rst | 11 ++++++++++
 fs/resctrl/monitor.c                  |  4 ++++
 fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 8013418b6ca2..abbbbdf61062 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -284,6 +284,17 @@ with the following files:
 	counters. This can result in misleading values or display "Unavailable"
 	if no counter is assigned to the event.
 
+"num_mbm_cntrs":
+	The maximum number of monitoring counters (total of available and assigned
+	counters) in each domain when the system supports mbm_cntr_assign mode.
+
+	For example, on a system with maximum of 32 memory bandwidth monitoring
+	counters in each of its L3 domains:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
+	  0=32;1=32
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 6ffa9d14a8b4..039516cf410d 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -918,6 +918,10 @@ int resctrl_mon_resource_init(void)
 	else if (resctrl_arch_is_mbm_total_enabled())
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
+	if (r->mon.mbm_cntr_assignable)
+		resctrl_file_fflags_init("num_mbm_cntrs",
+					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+
 	return 0;
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a9e1055df75f..51f8f8d3ccbc 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1831,6 +1831,30 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
+				      struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+	struct rdt_mon_domain *dom;
+	bool sep = false;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+		if (sep)
+			seq_putc(s, ';');
+
+		seq_printf(s, "%d=%d", dom->hdr.id, r->mon.num_mbm_cntrs);
+		sep = true;
+	}
+	seq_putc(s, '\n');
+
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return 0;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -1868,6 +1892,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_default_ctrl_show,
 		.fflags		= RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE,
 	},
+	{
+		.name		= "num_mbm_cntrs",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_num_mbm_cntrs_show,
+	},
 	{
 		.name		= "min_cbm_bits",
 		.mode		= 0444,
-- 
2.34.1

