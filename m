Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0C273D9C;
	Fri, 13 Jun 2025 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848961; cv=fail; b=OTXOjflQ7EI3URCi03fIsXHM3Dasdp4vKHf+GR2ANfMcZKaxsAtENHKJkn0G/HrhgGYfJ/uRQSms2PG7OgqeTJK29scyZyrjlW2KZ9VgKRddBadLGwSatRVhqaXD3bNYpNKOwHOkxKxss4hTxZoK2/VWzna7qc3GAMrhV6cV4Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848961; c=relaxed/simple;
	bh=FRQudJC9NxL//f/JrOgH/HAiBIr08RaHzlVLTAc1D3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leZ7v77CK9ryCfiSe1DDTlZk8e943wwamt2286b8aXuCRiPnma8WEoKG0MKUxsvFeK9Mm0alNH6/hehvK88UpMnc62lOQHjq2HuWkTDNv0Ok9layWcQavd57FmH5xUIcSO8b4K50MPYWrGuQAU9A+ARNo5pI9tryYGCRAc6FmKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ybqf5lTM; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ybqf5lTM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnbxw2OBWF5yp67sACNV1a6vj0AQ3DlqrAOGGjSEE6B4XunGR9+5XfvUUJtMMHrGpmX00tAOn800KMpTLi1hzofIIXhrtMmYBP8OI8qPiAinGVvboH4Y4bMn/OK3P5fPR7iV6woBuXn3PRTLkUiAvkHCyp0CYHBs3wa/tdMxQloXTpe39RcCc0YllVqHSOxMVVAqAhAY0r9X8y+DDVMUgX8tSW7NwWhDcl7BdglprPYA8ZrbOsRsbBklmamzUiOJidisdYUapJGTuDQ9W2skqs8ebfbwwA6FkotTKWBEjHfieMJa8d+CAguMN7Ltx8sbZgNsTlLgZfhJx7h7pnnbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irzaO2h2hW+z+KF3z6J/dEetIUxov7ZeLDetAxRqjSo=;
 b=wfrPEx+AxirNQdA9xOGseRISFtIAC15PaGjONrKG3jB7hUGjPjSKsYyGY/KgdA9hbPunJOXUXWpN0HiXCbkF8bQlz3sfktPOceyYjspMxpWZxkT0QD4O25AcY+gzaWq+zLJ4/KsW1jhOjZyt4q3CIZAaO/e3OK70ky7Q3waxlrZb15ku4Jk3K8wOw9dQVkqBki57KEy6Pro1T34jovC+hDwESjQotHQmoTRR6qkZ9NykKcUJSXcW2Dl6NNPBoy0F79fitpNXXZDPpKZ0G2mxbkHqAAesRwsUUXXrOS9TRNvp8+6aCghjEg42dy7oUKNoq3cHTyIzZsPUc6sDUu5S9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irzaO2h2hW+z+KF3z6J/dEetIUxov7ZeLDetAxRqjSo=;
 b=ybqf5lTM5ogh1nbxRhgKy88PdF+EGdwenckdoYvyQ2fiVXenx93iw4UZFsZXxEgpCF2YanTNGsYd5D/yoXXa7QLBelDP2EpmL3gXhoRbsEmgPxPgTVlpW2hPEOjagP1/jK3Lzg/GZNJ+oAXz2Rx+tH+MCgLTeuIxykcuDOJ5rYs=
Received: from PH7P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::33)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:09:15 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::a0) by PH7P222CA0021.outlook.office365.com
 (2603:10b6:510:33a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:09:14 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:09:12 -0500
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
Subject: [PATCH v14 28/32] fs/resctrl: Introduce mbm_L3_assignments to list assignments in a group
Date: Fri, 13 Jun 2025 16:05:12 -0500
Message-ID: <ee123e224ae4b7869378316df0da4ff00a19d093.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f5fd76-c15c-4715-793c-08ddaabe8d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iheGwj5XzqH5EJXOwD2Ug7huHhUH7qL6NI2dDxJx2q14vxOc1LIhY6uwtX/E?=
 =?us-ascii?Q?MWSUSfBQ47arhkLQE0Jsd8xd5FHV6EN/4f0Jig01lmZtKmpG1oNJjK5B6vye?=
 =?us-ascii?Q?/mBeOKQLeY0uan7kIk2mSah9EHYEnKb5VRAraF2GSKPSWJGoU+YucPgQXGrE?=
 =?us-ascii?Q?hw5TFSfPCWoQYR/XfKRFWW9XbFW0CeZEft8EyDfyQw97yJ5TFRiGxH5VA2l0?=
 =?us-ascii?Q?roEMxmbUR9W8vLMUynuYFonQK3jDwPHPkyjRznG6MaJs4w+Bk7PdHoaY3txq?=
 =?us-ascii?Q?OxNq0UmSBLh/61IxP52c6JzFum0zLaW1bCBeKAMop5eHrF84LZcPv3yixtV0?=
 =?us-ascii?Q?PWMI2k85UHApvgrjV6E+o1PYZT6u6gA2ea3SlHQZiAqenR+ICivItJ+JKTAf?=
 =?us-ascii?Q?lud2raNWq3K+cZwBCqokUsKzWT/Vs+dFKsV/0tRh10NY+cV2L/ecUzAPyp4P?=
 =?us-ascii?Q?ibKaJjMbXZEZNmYrNS9wA2k7oxcXScuagsL3W08TlvAlW7XchSczHXOx1Waz?=
 =?us-ascii?Q?2o1cP1+Cl3h9eOxEF6eb/B/KxVDWwbo/pG6PvqtW20V76e0opdgVNApIGPGl?=
 =?us-ascii?Q?t/SUgL/CJSaSSqgZDw4V/x4w/v+hakLQPAl5YjKLlrYGAO1crfc8j3+LEOgS?=
 =?us-ascii?Q?/69zy2DdSEHLcmXLfGWyP4cKodnRGzqZcBJGLRNP26X+dmBws3EugVg+ojW0?=
 =?us-ascii?Q?CqAhLl7hJSNq0YVAV16AEXnrlnCc/MMVd2o2pQCBTlEi4Go4Oa0uICtpKcwN?=
 =?us-ascii?Q?zhrt10nlsrtRuY5HNd6vMhgG7uFFJ7hLiOMXXatklzjUxZugx8qJBEbFgT9c?=
 =?us-ascii?Q?ZCLa+fikAEf0XAimP1R9kb3G/Rf/znxqj2XE4d8aGLTPcmsJ6rzqUHqHPCOf?=
 =?us-ascii?Q?k5DIYD9neZfdK3GCmlhI5YIHi+HJaYiBzLzOAg/kkDR/xcC3LNiL8V6HPr3i?=
 =?us-ascii?Q?9tE1njFalZqPrcVtBvjlvUW22c/Ic3w7l3Dlj3vhnWKWTnIKHLDwZ1aNearM?=
 =?us-ascii?Q?mXrStams0lHdskTr6JiW1T5+mfIbeV49jb76hnX+AdIR11S22bujilVvKQgO?=
 =?us-ascii?Q?Ey4IysQR/Xdl2qu7AyfUj0PmVLHh+RI1ZSBgXdpKmaBCxzh8uS/e5YiTe4rl?=
 =?us-ascii?Q?s3NdUCcHXRTdcQLnEqEpPo4pUSWs5vP2qpApbxj8dmhGr3mzxuHo81NyrUa6?=
 =?us-ascii?Q?W4UfTI1IoJoO24/qePxkk3UlQtPf/vltFGrDBgfyhI2ewCrlNNKwrH+6YeuN?=
 =?us-ascii?Q?6Qb5NXD4gp5kgQZ0bxIhs0gHqGjzK90v9IXVzLEUm72g2rr7t1GHEdzpuDVd?=
 =?us-ascii?Q?cjS+4k+l+uOhlqy00RUp3NRLBy2ZHljdmY0X1S5VFHfuTOAmVZhtnBOeFXG8?=
 =?us-ascii?Q?ohRw3q8aJzmjyGnT/FMcqfvluEyVBv1bGruXLaJpXra6bEk9/bfFZfJgUCVo?=
 =?us-ascii?Q?OJDu3FjOqR27fu+tx9lxOYaD5JOVBGzsmkmjKiI1fXjIom1VbgnIFjYIWngw?=
 =?us-ascii?Q?OkcjCr3eT2svOik=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:09:14.6933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f5fd76-c15c-4715-793c-08ddaabe8d52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977

Introduce the interface to display the assignment states for resctrl group
when "mbm_event" mdoe is enabled.

The list is displayed in the following format:
<Event>:<Domain id>=<Assignment state>

Event: A valid MBM event listed in
       /sys/fs/resctrl/info/L3_MON/event_configs directory.

Domain ID: A valid domain ID.

The assignment state can be one of the following:

_ : No counter assigned.

e : Counter assigned exclusively.

Example:
To list the assignment states for the default group
$ cd /sys/fs/resctrl
$ cat /sys/fs/resctrl/mbm_L3_assignments
mbm_total_bytes:0=e;1=e
mbm_local_bytes:0=e;1=e

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Added missed rdtgroup_kn_lock_live on failure case.
     Updated the user doc resctrl.rst to clarify counter assignments.
     Updated the changelog.

v13: Changelog update.
     Few changes in mbm_L3_assignments_show() after moving the event config to evt_list.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The rdtgroup.c/monitor.c files have been split between the FS and ARCH directories.

v12: New patch:
     Assignment interface moved inside the group based the discussion
     https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
---
 Documentation/filesystems/resctrl.rst | 28 ++++++++++++++
 fs/resctrl/monitor.c                  |  1 +
 fs/resctrl/rdtgroup.c                 | 54 +++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index f94c7c387416..a232a0b1356c 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -516,6 +516,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	/sys/fs/resctrl/info/L3_MON/mon_features changes the input
 	event.
 
+"mbm_L3_assignments":
+	Exists when "mbm_event" mode is supported and lists the counter
+	assignment states for the group.
+
+	The assignment list is displayed in the following format:
+
+	<Event>:<Domain ID>=<Assignment state>
+
+	Event: A valid MBM event in the
+	       /sys/fs/resctrl/info/L3_MON/event_configs directory.
+
+	Domain ID: A valid domain ID.
+
+	Assignment states:
+
+	_ : No counter assigned.
+
+	e : Counter assigned exclusively.
+
+	Example:
+	To display the counter assignment states for the default group.
+	::
+
+	 # cd /sys/fs/resctrl
+	 # cat /sys/fs/resctrl/mbm_L3_assignments
+	   mbm_total_bytes:0=e;1=e
+	   mbm_local_bytes:0=e;1=e
+
 Resource allocation rules
 -------------------------
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 1ec2efd50273..618c94cd1ad8 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -959,6 +959,7 @@ int resctrl_mon_resource_init(void)
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 RFTYPE_RES_CACHE);
+		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 	}
 
 	return 0;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 128a9db339f3..18ec65801dbb 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2081,6 +2081,54 @@ static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_mon_domain *d;
+	struct rdtgroup *rdtgrp;
+	struct mon_evt *mevt;
+	int ret = 0;
+	bool sep;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		ret = -ENOENT;
+		goto out_assign;
+	}
+
+	rdt_last_cmd_clear();
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_event mode is not enabled\n");
+		ret = -ENOENT;
+		goto out_assign;
+	}
+
+	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
+
+		sep = false;
+		seq_printf(s, "%s:", mevt->name);
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			if (sep)
+				seq_putc(s, ';');
+
+			if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
+				seq_printf(s, "%d=e", d->hdr.id);
+			else
+				seq_printf(s, "%d=_", d->hdr.id);
+
+			sep = true;
+		}
+		seq_putc(s, '\n');
+	}
+
+out_assign:
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2219,6 +2267,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= event_filter_show,
 		.write		= event_filter_write,
 	},
+	{
+		.name		= "mbm_L3_assignments",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= mbm_L3_assignments_show,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0444,
-- 
2.34.1

