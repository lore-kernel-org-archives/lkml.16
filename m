Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FDD27380D;
	Fri, 13 Jun 2025 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848941; cv=fail; b=OfA54c3lh4gAfRyDwAwftIpfsrZdhXpYH/DHHWS/xL16VArHnI2LjP5iar8poTt/SLVh1BrLetyUiFV77H33I0DTpwOWt9XCEhpR1dULuYdE5N2BK5wb/aK8Eik3xGqKZuAEVex1glHbxSnzXj9EWwDL8RpiredqlXH6k7SZB4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848941; c=relaxed/simple;
	bh=Onvxk7f26RVub/XLUEv4gvotG8WpGrNqRU4+/3Y2a0M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MS7MdafQawpam5FhgO0QlshU0NZfe+dqLMNfsaBDLfrXEno4IHnJpUpskm78LaRgwIsshppvtSlccSFwTP848e+YUdp6C70jkXZaSrPTF4drFSa0SvOIK1S3ykWkd6tbnRMuvzE9wD5VwO85U2qMt3ISG1oUjlSn2L7c5fBJ7mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BLztImF5; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BLztImF5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3l4h7p/Qen2iKqrkpPW8lt++lBAqS4C7F3+5ZhMQeq8QBzc3Wy6JHm2Rmd51nT2vhXHdWXKvFMdiZ4eLpPNrXM+HsBuJs5Cpqit0VQ/UtRcH92J9S1G18yvkxpM/AVG7libYRRHUvh1ujA7OU0U3aQyaNQIQhXdYVYnYZrgi2jlbV/pU+h0pOy6g9zOcy3PAQMP6/JxsX7OUa2P1dm5lbbfJqHk9SIIP46wSvIhN98UJZV4qlbH7j5K6VsmmoQjyplIaaErd2cxYViQ053HqC7YaaF+GPJQxOXrp46qALwh0TF2x45ztA8WfRs/lrjsQ343tBpAbNf/kUgYvc1o1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNyLC52AeTCBT/3TUcOWmscRgPRuAXlXQmP9jPfQaXU=;
 b=QN7ht3r8PbfHX3o4BYLSlf4MwUxDv1fnHJSzUftVjVIWa/5hSVZKkaTTjnsmwqa7XMD2ZRJdjZjVeEy0AkRjUGjZ2Ka/NY/f+PZ2GBmhImD+MJFH9F6Bh7T7jEMR+z7SCTFdaA3lv5VKl91oJ1NhjO6T4c0AQGr6jep7iQX1SjqN5GFv2GpdheVb6TEWOl0IE4ASsO9xw8dBDNEwy27EO6VXvYLxn/fUe8zWhveTkrMyGi3s7M0ic0nRTK6uLBKGGd/jANLhry1zO2eBLciqUKGMV8+WRzO853Vv/6UUZZ8/ew+EQF0Tv8OF1+S3tihxTHiGJiaybd4fHwTGsx65Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNyLC52AeTCBT/3TUcOWmscRgPRuAXlXQmP9jPfQaXU=;
 b=BLztImF5neFNat54iY/vY2/KGj+0QATGuwyq666Ig4x5NZRey5NJK08HgUyDFhnXmrxJlgTRPclWlNJe2HGXGqFUjO/i61B/3Mi7WAp/hbcGNrIO+wh80Y+jvPXDTadQDlnsEHw6lpQU7DoxRqnQ8/m6DqefrSidrIEa27gxUPU=
Received: from PH8PR21CA0020.namprd21.prod.outlook.com (2603:10b6:510:2ce::27)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.21; Fri, 13 Jun
 2025 21:08:56 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::65) by PH8PR21CA0020.outlook.office365.com
 (2603:10b6:510:2ce::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.11 via Frontend Transport; Fri,
 13 Jun 2025 21:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:08:56 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:49 -0500
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
Subject: [PATCH v14 25/32] fs/resctrl: Provide interface to update the event configurations
Date: Fri, 13 Jun 2025 16:05:09 -0500
Message-ID: <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: eb77f6d3-f632-440c-a24d-08ddaabe8279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yOL5opTNijo+Dm7vU3fS1eANTdpYp7ZLnEGMGzdH9Hgy1lMFds0imwVVEfpa?=
 =?us-ascii?Q?n8ifZphHikUyIxML9oLCtdrL1Puudt3PrZbU0NlCUkjF7dvoz6QSdFWvWWH0?=
 =?us-ascii?Q?RuhW202dGY57uPWjESY5+oWKyZo8uZr5R/6mclhuJrchZgFojcVnyBesPz8j?=
 =?us-ascii?Q?DrLzBGMq/hBjwG0dRhifhuT4d8qT7CmOLRGNdKZ/KKreDeWFSn7HBwUoqgoT?=
 =?us-ascii?Q?YmQncDWUtg+wBczD5TIIUhCygt48k72AiizOs8UiOJ2A0FGnF4MYLB5jyVBV?=
 =?us-ascii?Q?qZ4Wv0fbAmh5CZ5eRyjvU3e4BMcWpLxi7y1bfhIl67p+o6lGqRh64Tralu3f?=
 =?us-ascii?Q?npwLYem+WQ87Y/mpMrQpFr1YToZB5xrST9qBHfR4U9gBqy+lVQThwPxPgQmQ?=
 =?us-ascii?Q?FdYQ39FRm90lasgF/z+TsonR2QBzVXm8XKyxoFcDHn+ObBM7Ns1BO9ZZ6lcE?=
 =?us-ascii?Q?xopTP1q4DugVCRK1AGI099epyRiTCFOnJYnHycbYDZmxiDZyTf2UyxDPLzXI?=
 =?us-ascii?Q?6qBqoMsgxnF1RO8vuCGLCdD/hRJ6agpSTNU8ACwQPYCLw6B8ylQtTtdiyywc?=
 =?us-ascii?Q?7AptDEXV7VpyNucinDOQDMNVcu+09jICtMiZ/elgkK7SbXYN0FJ01WpwABQD?=
 =?us-ascii?Q?P8UyhX6cwiKHfkU3GC6LuqEApkOn/waogpnXTSHkhxzVM22cxWhvMQjO6TnW?=
 =?us-ascii?Q?HIqSEzREpUQLWWdvnL8ypAF0gWi2LbomIas9NQzkqaJSzJu94vB4i3FfhNku?=
 =?us-ascii?Q?e09Pm1seBJoqDBoHFSvoJ9UDneTwISkm+1jumss10defgXoMt4ix7Oi3wlav?=
 =?us-ascii?Q?tqpinaSco5kwqAgxjcGvxmjdw0xtWh5aMMFNaor8eqtywk9hy+cMcnz4ggCS?=
 =?us-ascii?Q?10EmHvb6O4ieogYhzWSIkViJtd79FCEncS37xuxZaEk676xD52UjHkkYngs1?=
 =?us-ascii?Q?Z0fTsOUagK7hgFHzjLk+cvnvsjDzbE2xJOdP3dDF5hsRKX4fsJTFWBUoQCvk?=
 =?us-ascii?Q?65Xaj9D24mAcPO8y6OHwpk9bf+PAeMGQCBKnHZxSc1v201H3jGQKtxxIWPiv?=
 =?us-ascii?Q?3J5E0P09LDPUqLSYtCl3eJqwhubKrnCSxa7o96ICTC/1XcGjJUrKcAISK6JS?=
 =?us-ascii?Q?A//DxFkrgonJciYdkwDCGqKF3C9YqFGZ4fRzd+3o7ak+K9q3MBO3xTb36fp8?=
 =?us-ascii?Q?mUI6KnBs+EgsJGRZm6uowBOS2niB19/4uknAyBnb0/jMA9aEf1QqvKPN3vsL?=
 =?us-ascii?Q?1DlOW5AcHaxsDri+/Ada1q3+xUAhX5yL3YjP/h1TQV0B1DGWSvNxH4JSuIPH?=
 =?us-ascii?Q?Tb1PPPll55rqpeUSnq5bWYH9Ug5AKeIqfCC2YEVgEJgI++EMcIW5HVoLJLUM?=
 =?us-ascii?Q?l/jFGtXPPOFIcK/TsJzvel3Vo/s0hL6TmjGQbECIN7xGaX8TIEennaBqmLFe?=
 =?us-ascii?Q?iODD0I6Qx/KX95H4wtL2B5ocsT4Vc2Y3MypXiV2MZ/ZcgP/UpJEn8OoE2CpN?=
 =?us-ascii?Q?mVttYC6vORI6ctZDB7r9vyoCBMHEPKtrptoEQKb6JfOxpvZKHj1uwFXwpw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:08:56.4999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb77f6d3-f632-440c-a24d-08ddaabe8279
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267

When assignable counters are supported the users can modify the event
configuration by writing to the 'event_filter' interface file. The event
configurations for mbm_event mode are located in
/sys/fs/resctrl/info/L3_MON/event_configs/.

Update the assignments of all groups when the event configuration is
modified.

Example:
$ mount -t resctrl resctrl /sys/fs/resctrl

$ cd /sys/fs/resctrl/

$ cat info/L3_MON/event_configs/mbm_local_bytes/event_filter
  local_reads,local_non_temporal_writes,local_reads_slow_memory

$ echo "local_reads,local_non_temporal_writes" >
  info/L3_MON/event_configs/mbm_total_bytes/event_filter

$ cat info/L3_MON/event_configs/mbm_total_bytes/event_filter
  local_reads,local_non_temporal_writes

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Passed struct mon_evt where applicable instead of just the event type.
     Fixed few text corrections about memory trasaction type.
     Renamed few functions resctrl_group_assign() -> rdtgroup_assign_cntr()
     resctrl_update_assign() -> resctrl_assign_cntr_allrdtgrp()
     Removed few extra bases.

v13: Updated changelog for imperative mode.
     Added function description in the prototype.
     Updated the user doc resctrl.rst to address few feedback.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.

v12: New patch to modify event configurations.
---
 Documentation/filesystems/resctrl.rst |  12 +++
 fs/resctrl/rdtgroup.c                 | 120 +++++++++++++++++++++++++-
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b1db1a53db2a..2cd6107ca452 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -342,6 +342,18 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
 	  local_reads, local_non_temporal_writes, local_reads_slow_memory
 
+	Modify the event configuration by writing to the "event_filter" file within the
+	configuration directory. The read/write event_filter file contains the configuration
+	of the event that reflects which memory transactions are counted by it.
+
+	For example::
+
+	  # echo "local_reads, local_non_temporal_writes" >
+	    /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
+
+	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
+	   local_reads, local_non_temporal_writes
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index e2fa5e10c2dd..fdea608e0796 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1928,6 +1928,123 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
 	return 0;
 }
 
+/**
+ * rdtgroup_assign_cntr - Update the counter assignments for the event in
+ *			  a group.
+ * @r:		Resource to which update needs to be done.
+ * @rdtgrp:	Resctrl group.
+ * @mevt:	MBM monitor event.
+ */
+static int rdtgroup_assign_cntr(struct rdt_resource *r, struct rdtgroup *rdtgrp,
+				struct mon_evt *mevt)
+{
+	struct rdt_mon_domain *d;
+	int cntr_id;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
+		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != mevt->evt_cfg) {
+			d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
+			resctrl_arch_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
+						 rdtgrp->closid, cntr_id, true);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * resctrl_assign_cntr_allrdtgrp - Update the counter assignments for the event
+ *				   for all the groups.
+ * @r:		Resource to which update needs to be done.
+ * @mevt	MBM Monitor event.
+ */
+static void resctrl_assign_cntr_allrdtgrp(struct rdt_resource *r, struct mon_evt *mevt)
+{
+	struct rdtgroup *prgrp, *crgrp;
+
+	/*
+	 * Check all the groups where the event tyoe is assigned and update
+	 * the assignment
+	 */
+	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
+		rdtgroup_assign_cntr(r, prgrp, mevt);
+
+		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
+			rdtgroup_assign_cntr(r, crgrp, mevt);
+	}
+}
+
+static int resctrl_process_configs(char *tok, u32 *val)
+{
+	char *evt_str;
+	u32 temp_val;
+	bool found;
+	int i;
+
+next_config:
+	if (!tok || tok[0] == '\0')
+		return 0;
+
+	/* Start processing the strings for each memory transaction type */
+	evt_str = strim(strsep(&tok, ","));
+	found = false;
+	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
+		if (!strcmp(mbm_config_values[i].name, evt_str)) {
+			temp_val = mbm_config_values[i].val;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		rdt_last_cmd_printf("Invalid memory transaction type %s\n", evt_str);
+		return -EINVAL;
+	}
+
+	*val |= temp_val;
+
+	goto next_config;
+}
+
+static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
+				  size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
+	u32 evt_cfg = 0;
+	int ret = 0;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ret = resctrl_process_configs(buf, &evt_cfg);
+	if (!ret && mevt->evt_cfg != evt_cfg) {
+		mevt->evt_cfg = evt_cfg;
+		resctrl_assign_cntr_allrdtgrp(r, mevt);
+	}
+
+out_unlock:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2054,9 +2171,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "event_filter",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= event_filter_show,
+		.write		= event_filter_write,
 	},
 	{
 		.name		= "mbm_assign_mode",
-- 
2.34.1

