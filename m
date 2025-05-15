Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AFC293725;
	Thu, 15 May 2025 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349636; cv=fail; b=ERCeK/Qz8OFj9cIrMt5StWxoGleyK6O+ucCRFhwidDcplP0zdUzryJ2/6XVqszA3mYTT7Xhvo61Mplvtw7NQ+1HQaiz1aD/v9auUwYL1Lvls3vzRuN2WDQKIbSYmkI1rbQd3J6u48N0bgwRb32SJnBpM490kpi4PUK3NnsnMsc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349636; c=relaxed/simple;
	bh=tF/J9L8tzhpjpQZZqDo7R+/Z78ikF2AeLRRdMpLKZNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YRTmRI0lmQk6jvPBHLVC1QelUOyPT8GEg8rNDgyk44jWYvHAicn1KwBg3jb4lsGSsvZldi/zIZa6lthkgXNphf1VRuj4UiUQB6aLBB5mYVuocqdUcijmYuqkfmzPpTd7aJN2dxt+6L9Ldz2NUsfrYRaPJxyU/1Oq3ETgAtx7HaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qaiwAeb2; arc=fail smtp.client-ip=40.107.243.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qaiwAeb2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7YKuuh2EkkhMjrTc9Etc0/D6FGohch7MsOwSpznpJcStiwSfZXjrBMy7zopEpJ3KE7WuMw1pv7zWNAHdMGdnfKWJT2zc4mjV3uQHH4eqI3Km92v790YFtyd7SHCcaEpSNAtE3OJLN18ZIeTYCe27QgYCyNGIxWHqpym8pfVjc6mYHOu48dUXgK5r3O6Vnp7p00l+XbciSyyJJGhS+JTtORHK8KckMx0xsrolI4HNarWHF7ppG72Fpgc/jVht4emcUWO99JKyFhxJGf0Sw/4q5RYHE5CYGwPoOFvGrpqDzwSo4MCva5EbIVYZEMD3Ym6yaCfRFU50KAvmGXF+j1iJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=211ip/OWPS/dFpl9CAynwjK1FupVsst57iYzL5gRdTo=;
 b=VZW7/qVQ0wIoxEjtVCOHKdLWIs6PXTQjNwzpKHI5RFduqDJ4TPW164ebyV9PfQBT1Z3bXdjbiNTzxnXP+EkQ2QDshXQHDHxcEjoHAQyjJWNeCYmp5KNsxLa5BAYb5/3sO9QcsruaW1HaOrB6/zzGG5e9usfMXmRd3us3Qqqyn0iwAXcUkEwX6rjs8rFTlQcSgyuf9JRss+RKGCN0R0cNi0rvPhxC7thZDbSZ0lHcpcE7BIl7AzYpq+6Z5eD/w+GoMiXOh5c6291k+g5DRjAXjk+4V9AXOF7ao9Sywfv77OKHMIFFAwI5JvIo4lFxQD3DCT2Wmy8fHBnyUUSkP8jIWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=211ip/OWPS/dFpl9CAynwjK1FupVsst57iYzL5gRdTo=;
 b=qaiwAeb2XsWCZ/Iz8+hE9YYpFw8bLe86XTWYjMhTbQ7Z1z56lnqhohAlg6Vjk2+rYEcYPY9ONVPSLmHfiA2QNNO4L7pLjOapBDAgLbxaFBBSdtYlOcRkJiKYOp8e6FZzmpEj02iLPEBWSGUCri6KHfiLgCFpFrNiM6tXz4m36Ws=
Received: from BN8PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:60::32)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:53:49 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:60:cafe::70) by BN8PR12CA0019.outlook.office365.com
 (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Thu,
 15 May 2025 22:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:53:48 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:53:44 -0500
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
Subject: [PATCH v13 09/27] x86/resctrl: Introduce interface to display number of free MBM counters
Date: Thu, 15 May 2025 17:51:54 -0500
Message-ID: <dc20bb6d3a654a3859f24fd036f4a095bd07c27f.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8afa50-37ea-4b38-ae01-08dd94035ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IlEvQnHCSMnptKuO/+9xQVgpk0DJRF98d0qTroz+Tl4yKWnTfiBrF1rQq0Gu?=
 =?us-ascii?Q?SWDLZ08qTeZnHzm70gFID6KA7zgS2jukIqaUXoChSx/hKs6KnPDgGTp5AHVS?=
 =?us-ascii?Q?tPjqxlgp2VP8HXJLBozn0Q8A6Tck5tUvtqdLfcpJZiMGoFUnlChoy0u6quEA?=
 =?us-ascii?Q?lN9cE1vE0CVm78pndji3/aQkYoH/KFmd80VYVhppcTP60ZrYYu+dg58zs3fk?=
 =?us-ascii?Q?B/FMeBZbzLgk4I3rcnQ0ppNfsgB0aCah0VPt7YvjCpZNyKWTxGOm9ku7+OdD?=
 =?us-ascii?Q?BzTtsu1tXiM1HkjuzVfo/nAmkGk1NS2+0T9MUFJHv8+dbIx/6GcmE+PyG4ui?=
 =?us-ascii?Q?vfS1FsuSRgnGA0YDsaMqGzDA/C1/SDYMK9QgzYAt5OIgmP9WX4BTBDG9YlzO?=
 =?us-ascii?Q?2mqMNKBgeGJGgbVOroC6GeTmJZbltvnZMEkUCWNGaJxkVDR9Y4x8fVaBP9cP?=
 =?us-ascii?Q?oUZS0JiYktonD3KlxFx2BygyWhpWvyaRRemdodLscCuWE3Y2I12tyNzmPjxI?=
 =?us-ascii?Q?RAI8eARvUphKgF9QSPsnxXA77dEamF8LW6Wk3CK5h1tri84JJ4ATvhKrDX4A?=
 =?us-ascii?Q?3fZ2DWqIWtBzdoy6PsDMA70QFASrdAG5UPHBXgUZQ1K0Khkinftd9x1edfoX?=
 =?us-ascii?Q?naGNKbnqVVH7COW53QaPtK1aKfx0PD00iRTScDeJ7Vpaf1lTjljn4lP1Xwze?=
 =?us-ascii?Q?HAadkaNds3oIe+MSmKQx7kE9siALruLFFYCmEdiGXJQwSPLmuqdpgwC05DgP?=
 =?us-ascii?Q?vBx/NL/tYWcYBaq3gnRRuG96grPhpSzFU1k25KwmHt8mg1MPu1XnXu8vPUQK?=
 =?us-ascii?Q?3ZzgSufXWc5WKhSOE+GJqs4DLgcuNKbL+FEYi+SZ4Y7QDKNX/joNoMJU21+r?=
 =?us-ascii?Q?x9ryjlc4tc2fOwKVV0UfzrpONEeinOgL/TCzCB02Kb39VYfVLHkED1iIGUPh?=
 =?us-ascii?Q?+/1Myd8oPcRHyueWG/GtAB81qdd+EhAe+agrzzcfskizh9+lfh+RasUe9wXl?=
 =?us-ascii?Q?mLBCApq/1lt4xQ2NTb6Gy5bfZiH1Ga77fT8QvoP5fWWUMB0m8HC4GKWq5zQI?=
 =?us-ascii?Q?gLGLHwm9xbIuM1DZlGHnAZg2f1nBYgzcWRxxQvA3LJvhSqj03+amUnewHMW6?=
 =?us-ascii?Q?vFzmdpBO9k6GK086Fw9D4NVaDLv3nYbW27H1bfrlZPe4iXXl4WVnqghkbSvj?=
 =?us-ascii?Q?zSSHjpLPQMv8nLmA6o7BgLmKWEgMYbN/TUKf3gB+izlPPTwvnY4tDpZhg/3r?=
 =?us-ascii?Q?SQx3HVxFFncwgC7u3D43PxZnlu3eBA1Cze/qggDoCzLKPG2r1w+yJGzQDgss?=
 =?us-ascii?Q?PdAVagpR4Q5wiY2dFqm9UzZ+KjxPxv/CjjUTIw+e4Xy+eYALyPwmvxhflNZ9?=
 =?us-ascii?Q?QnLfxXWlGAMA2QwRag9nxhtEUtnCns3qavd3Vn+BfjbTwCMHIZAlXuRNTDdR?=
 =?us-ascii?Q?CLsx8laPcfSt/On/ld8RXRAsTXMnX/smdLN2tIOruzqDcvcIfaDKTf80cb+s?=
 =?us-ascii?Q?+19NSZZApatYdZUBTLnIfGLHSSdEz2WSyYoTJztLiPCVuEy8C1lh0fJgHQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:53:48.5552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8afa50-37ea-4b38-ae01-08dd94035ad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140

Provide the interface to display the number of monitoring counters
available for assignment in each domain when mbm_cntr_assign mode is
enabled.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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
index abbbbdf61062..2bfad43aac9c 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -295,6 +295,17 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
 	  0=32;1=32
 
+"available_mbm_cntrs":
+	The number of monitoring counters available for assignment in each
+	domain when mbm_cntr_assign mode is enabled on the system.
+
+	For example, on a system with 30 available [hardware] monitoring counters
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
index 039516cf410d..2548aee0151c 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -918,9 +918,12 @@ int resctrl_mon_resource_init(void)
 	else if (resctrl_arch_is_mbm_total_enabled())
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
index e2005fc9acd9..752750e3e443 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1855,6 +1855,48 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
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
@@ -1878,6 +1920,12 @@ static struct rftype res_common_files[] = {
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

