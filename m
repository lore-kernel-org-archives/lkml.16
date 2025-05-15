Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C8128D845;
	Thu, 15 May 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349742; cv=fail; b=RS/4ZHeeT9na/S5Ntr2P6zijByVbkSqco9vce9+f6Dy/EU3I7lL9OqAJcGjO7kPE/gDmDNOPgDH4KxM6WXI/LznpjJQwzzcFAEN9VLQHH7ig9ckt649ObRtPS5RHt8A/hIlLX6YbBGSgi8qKHVPNSIcbs/x1iXKTqwK1HJqH0po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349742; c=relaxed/simple;
	bh=Lp6AGtOw98nD8QYDa1VCqKIv+U6P1I8u2kCNTqvOdpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIiWa0+2TaXZySB3Ptwa6i/M6sElu8JqHCM2W+pibkM9I1GebIbiOD8/UnM0GanohwTtbYZkscT8jyeusCnd4jWVgQIRdv0gxcGWCha3Rb0TkzU7egv87TsYz4cwa+xZDgsZgIyg53i1Fnyxhkx4T5QgQXOo8xeao6GPdiOVm/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ra3pTcXg; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ra3pTcXg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYV8Ta4weVFj6Jf36z+J4T6aH3s523tqrUys405wyBWLNwqUevyhiBO+fJSspq2TxsJimOkVrWZFoO5YFcrCHkHd5WvDECveIkSmbsFhNTqSK+Fe5BDUHBU6+z2soNFVb+AfQlMMHgXSFCEwJFWgob4UuFFlW7gJ8+nz5PtKaX3SlRinACHPYKDg5TCX+TSMycO43NDV3kAOknUr34xjaBZ54f7Z6ay8eq2OvJLk6qP2BD92pgJKuAq4ahqOyVl2JPlqMwCOq6l1mnsdLzKTmWQcaHsSvw7Pocr0v05L3I2o+D3WhjauxASdygVWc65sYbDgSRjpa789VwHrFc37Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iT7VVHnXPPmOehuElpTjJppRIQB4BXJzbNSTs80Xu4=;
 b=rusn5texCKXwsO7NbaA21BB7KwpZBTQux3rTZtSV1M1lp3HJqKK0Yb4qY7EmFnhGvoa+dVmxu/ZAHCDTEeI/T3XjJ8iodEYRioK0pzLKsUNZty4ZVBb5Ns7He6x5I2qCVAGp+3d72GcU6/GXK5cBYRxeBVboVQ2E5/yw4vAPH41+H6JUgPuvaPzVzy90okxkQuislz0W6JqPOvl1CEe8/v+CNcG0hwtSyhqrq+vMX5gaNEfI2qaiVYjtuTUt/OmklZ2OX0Xp8qC7EnoWdU3TBg3rHqc8nBAkRHGY4xGcid7KTk/sU9SVMHjsSvhwL/82lrZciqaIRe5kcA/tkdBXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iT7VVHnXPPmOehuElpTjJppRIQB4BXJzbNSTs80Xu4=;
 b=ra3pTcXgKeVUDyILO5DYOuvAcNjJh7i5U88Bk2hcAWGz9b1FAWJi1pxY6zAHrOLeVp53haiALYYLkKF5enzQd6tPzJmbQCwtxAW7VM0zdaJU2RuoC2qGmGJV2Zgq9hsP+jwRtABmhWQcURsbciWQ4XOTLPi56U5R59/bxT8Lf6Q=
Received: from BN9PR03CA0097.namprd03.prod.outlook.com (2603:10b6:408:fd::12)
 by DS4PR12MB9609.namprd12.prod.outlook.com (2603:10b6:8:278::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 22:55:33 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::22) by BN9PR03CA0097.outlook.office365.com
 (2603:10b6:408:fd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Thu,
 15 May 2025 22:55:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:55:33 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:55:30 -0500
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
Subject: [PATCH v13 20/27] x86/resctrl: Provide interface to update the event configurations
Date: Thu, 15 May 2025 17:52:05 -0500
Message-ID: <ed1ae013a2aa8216444d1b716a1bffc7979a8883.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|DS4PR12MB9609:EE_
X-MS-Office365-Filtering-Correlation-Id: a270ddbd-216d-4527-7204-08dd94039959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/1coTU3/uaiIczc5qndyETNI+sLCzH76EkGjWMC+jb4N0829m+kZWu+BRXdO?=
 =?us-ascii?Q?h9OZbjpBVUoQ7/Aqie3XPmdeXFIxLNeM9B1GFKKGPij4DI76N/ZRfLl5+NuV?=
 =?us-ascii?Q?5X8cHy7UPsuNZDgnun7pmuxib7670eWKCtLS0HGbpWD513X5tIzUJO5kYHSo?=
 =?us-ascii?Q?5rwya664No1cNfcAW3lZcfeaYf09PS4QMNYeUlEd6TYW4NQih5JwMXbFgR5+?=
 =?us-ascii?Q?Pt1TFkbp2kEch5gEaIeektHh/IONaQQ7yiEZuWTsFTpRPFftvQTDgNhQGoOp?=
 =?us-ascii?Q?Bug/aDx3O+SKI+TcLFmWzqnO7uSUpgnPpeIisjbH06A+IS2/Jn+anUA80Bnq?=
 =?us-ascii?Q?nzcpcSV5aWes9s3PVKVtmdyVhtEPNJmjtvIQ9Jird60m7oV+oikuC8gRmLBc?=
 =?us-ascii?Q?1Z33SWr4ocZysE3GZDyScMkVnf4k7Hjq1IJyPc7wkPHQwycIIbVcyV8uQNEQ?=
 =?us-ascii?Q?sbI26TfWD6mjN6VnpaWJ5Lgn1c5Xej7QdZQB51GFC4S/emEidba8xsJOzloi?=
 =?us-ascii?Q?IHcD7aItgMGp+Par9X/y7pO25+sKqFplXyu3NtXQmo9e63gvE/fCY3w5ORC3?=
 =?us-ascii?Q?M13T3ZvK3zZU8ohISigfZYP30SJATxKfEn/P6JxuBmMu0l/8PTbxf7GLoxS/?=
 =?us-ascii?Q?bMFvnf2R5E+3KPx0oBklxiLVWHdmMRgNL9nXE0SCEJV75C8Bi1bWtd4zvcC3?=
 =?us-ascii?Q?0DNQQlhdXm04xVpFc70N0Wiq5KQW2+Ikr+kuaxEpSHwjGEnkcgs9uvFpCI/G?=
 =?us-ascii?Q?AF8cb9fySh2bmUgeZ8lsR2Ro9DVaLdJfAHOx6v5l539agTVObZrW5ye5Xwme?=
 =?us-ascii?Q?X5pmQFxwDLY+fZ83W6VPx0YikiwDInfNTsRTIHfYRtXVC49eX8WbQkAUwrSv?=
 =?us-ascii?Q?BXhSmzTrrEE+R31pTtRCcT+O9lzboNm0SxGXYTHDM0XxBVxZqbS0fCbrSvbw?=
 =?us-ascii?Q?l7aSq5xcv6PXPtd9zzU1uz9Tw/rAnGdPmhlGo4VIsssuf7jeaqpCpuu3/+yn?=
 =?us-ascii?Q?lfL3TYFl6KaZJsbmQUbW5ufmbqExz+YW6PFqtvh9ko4mLYsSZNGxM7BpesiG?=
 =?us-ascii?Q?ShJcFVza/a08Nr7iAjPO+uAW5Y9s1EOA9O8oHajy2/lSGgAGBBmWNsoi4ze6?=
 =?us-ascii?Q?tAVsztkF1VoHl+dP9xtY4DpXwUldSS8WOpSz3bV+DPOsvPBlNNE/Fep1+xGo?=
 =?us-ascii?Q?M56Hg1jSnwfxFbIIhSDq8MFq5AyAThyrnbo2eI+93TnsmT0r1LIMwSHL/Q0w?=
 =?us-ascii?Q?8aJhsfmZfl2nbyVAT8IVbQy6fPK3Re429TF2cYzv0JwEed4aOMKlkGQzluNY?=
 =?us-ascii?Q?khZenxEvjThqkdDQIARukcyNeMsC4YJCaR3JP7c9d6DCKFfEjwUCCTnOaXl6?=
 =?us-ascii?Q?DH/7pPGn8zXrj8qVVxPaWsP737mq3XMHS5G1snJKBB9aAU6B3HJOvWXNQIX4?=
 =?us-ascii?Q?HpppPld9FO3ggUSJtf+yH8dGexBqPSXycL+m0bS8wgjm6oJGtQGjecJgWn1K?=
 =?us-ascii?Q?6YESIJCR6SduwroQ7fHcia8mZqqqY/OY9d0K?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:55:33.4641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a270ddbd-216d-4527-7204-08dd94039959
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9609

Users can modify the event configuration by writing to the event_filter
interface file. The event configurations for mbm_cntr_assign mode are
located in /sys/fs/resctrl/info/event_configs/.

Update the assignments of all groups when the event configuration is
modified.

Example:
$ cd /sys/fs/resctrl/

$ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
  local_reads,local_non_temporal_writes,local_reads_slow_memory

$ echo "local_reads,local_non_temporal_writes" >
  info/L3_MON/counter_configs/mbm_total_bytes/event_filter

$ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
  local_reads,local_non_temporal_writes

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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
index 4eb9f007ba3d..9923276826db 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -336,6 +336,18 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
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
index cf84e3a382ac..8c498b41be5d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1930,6 +1930,123 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
 	return 0;
 }
 
+/**
+ * resctrl_group_assign - Update the counter assignments for the event in
+ *			  a group.
+ * @r:		Resource to which update needs to be done.
+ * @rdtgrp:	Resctrl group.
+ * @evtid:	Event ID.
+ * @evt_cfg:	Event configuration value.
+ */
+static int resctrl_group_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
+				enum resctrl_event_id evtid, u32 evt_cfg)
+{
+	struct rdt_mon_domain *d;
+	int cntr_id;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
+		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != evt_cfg) {
+			d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
+			resctrl_arch_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
+						 rdtgrp->closid, cntr_id, evt_cfg, true);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * resctrl_update_assign - Update the counter assignments for the event for all
+ *			   the groups.
+ * @r:		Resource to which update needs to be done.
+ * @evtid:	Event ID.
+ * @evt_cfg:	Event configuration value.
+ */
+static int resctrl_update_assign(struct rdt_resource *r, enum resctrl_event_id evtid,
+				 u32 evt_cfg)
+{
+	struct rdtgroup *prgrp, *crgrp;
+
+	/* Check if the cntr_id is associated to the event type updated */
+	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
+		resctrl_group_assign(r, prgrp, evtid, evt_cfg);
+
+		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list) {
+			resctrl_group_assign(r, crgrp, evtid, evt_cfg);
+		}
+	}
+
+	return 0;
+}
+
+static int resctrl_process_configs(char *tok, u32 *val)
+{
+	char *evt_str;
+	bool found;
+	int i;
+
+next_config:
+	if (!tok || tok[0] == '\0')
+		return 0;
+
+	/* Start processing the strings for each event type */
+	evt_str = strim(strsep(&tok, ","));
+	found = false;
+	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
+		if (!strcmp(mbm_evt_values[i].evt_name, evt_str)) {
+			*val |=  mbm_evt_values[i].evt_val;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		rdt_last_cmd_printf("Invalid event type %s\n", evt_str);
+		return -EINVAL;
+	}
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
+		goto unlock_out;
+	}
+
+	ret = resctrl_process_configs(buf, &evt_cfg);
+	if (!ret && mevt->evt_val != evt_cfg) {
+		mevt->evt_val = evt_cfg;
+		resctrl_update_assign(r, mevt->evtid, evt_cfg);
+	}
+
+unlock_out:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2056,9 +2173,10 @@ static struct rftype res_common_files[] = {
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

