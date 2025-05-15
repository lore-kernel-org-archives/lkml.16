Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821B928D845;
	Thu, 15 May 2025 22:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349749; cv=fail; b=GrlmxqYE0y2rrecLO+8ggcyM/eb1lGyvJ36RrXkqin5wVz6LKeLlJdShLM7y2kSxN31K/mWhkqKiZk+IoFrSbSE6XZ3VgNJIGt4K2d+jjCBqtW00FforXrTs+ly217q3VhV4iUbbz1R9jzlOak9VFXrOzHInL/KJZzKNViyIkyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349749; c=relaxed/simple;
	bh=u3Mq6F3+q0KbJzGbo6+aFa1c4uAay3aVYHq/yx7p2V4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IslnkSRIxiumLuuD2+4Q4hi6FMHCiOlkJJRx5SgT5ZjN8aj24JgBPOn5MkXrYurYAuNAP0uVPn1hcoFFQCtf5RM0qPLBq3cNbb/hMQDFuClBwbmax16x7BFwS4EvVHkBuzergzHpSwMUxYtlMdnHP2Jbd+Uyu34Bz6aiFYJc6oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pOcZjWIm; arc=fail smtp.client-ip=40.107.244.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pOcZjWIm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfjHwNmItByj1zx8UcuenEJU/gXLQ4GILBVzLm76XHGtYHj6Yn4gN4sYOW7B0snWS4LS0508j2/SyvndHHTzfhuRYe1kN9IZ+tUNdyGiqnIFMeSmT/5Bvlf4BgOwwGvhtcb7DnKlNXuEQz8dh3kXAJW8l4bBITqHm4wzpOB3nOZ8Gs1YO7dGHx/+C8xnAPxKzeNvU1m487I2LQNlTJvLbTXQ0599Jm3NEjz0sIIotHQFbOYeKZ/UsLYaVIOOWTstF2K5XTxmQoXiqRViQvPYudvUo1C8DW4BFv6m22F+5fBRKEZXVrIgKRDXuOI5tkijjzpOqABel6kJ7D+e3xWuew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfD3lLeta8Ng3P+KvCVlxOsYWLD+rSQbCdzWwxDrGTQ=;
 b=dG57gMzSP/Feef5R3G6U2tP4yUdJBrQ+CvMyDtb0wTaPQ+tD6vt3H++2QjBectbS28XL21tjJ7+k4laV5fXMOgbOhatdgwXeLFdr/Rt656BPFZg57h1+3uPZy5G6bHYeUWg3VFbb3V4Iqjez+C7jjDkBCh+5Y8pnjEDN42eujKgbk/o5UByTo8YqtXMdoUIJzpgpzaU/bSnCMecB69PxTMA6RLVgi6OJHkGvhLDa1z6e/9HK658Lo9ehHjbanFt5arSUKvs7sncZ3ybHqOp5lHNLn4u4qcHNWL2+bNzG1tD5NXRmHAu6xGB/ilFqZ24ZCeZCPOJdgs7r1OKiWOuBoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfD3lLeta8Ng3P+KvCVlxOsYWLD+rSQbCdzWwxDrGTQ=;
 b=pOcZjWImchlp+EklUUqpsMbxXpHDJMXE2alptjfJDFfRjWurnU7x52v9Vr0HtddctsX2I43vOEAZYtVRNM8SA4D+dqJh79GggUO7uk42epwB68scsTB7F33G5MeK/nfgPn90DVqUmi4KrWaiJwIxWwl1qj3eHt2hn9C1c/fCdeQ=
Received: from BN9PR03CA0173.namprd03.prod.outlook.com (2603:10b6:408:f4::28)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 22:55:43 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::70) by BN9PR03CA0173.outlook.office365.com
 (2603:10b6:408:f4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Thu,
 15 May 2025 22:55:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:55:42 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:55:40 -0500
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
Subject: [PATCH v13 21/27] x86/resctrl: Introduce mbm_assign_on_mkdir to configure assignments
Date: Thu, 15 May 2025 17:52:06 -0500
Message-ID: <ec8d3053a63980fb7fd2b4fc8bba0a1cfa8a69e6.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: a9349f4b-7038-4c0c-53fe-08dd94039f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KKj2zz/PhgMKIJ2JKNWV1oOPSR0p7/rpOT/HwFI/ix3DuaGyxc/7epGgYpW7?=
 =?us-ascii?Q?kGhAhfNUHOC+lBdDj0ntAFAe+EaLh8Gk/uRj4up8RomZZ6KrwDOSp6jB3EkZ?=
 =?us-ascii?Q?RqT5WxkuqWnRJy9OKddegsxmBUnMfZAd8kQxkObRuBvwerTpWwpn3P2yBEm+?=
 =?us-ascii?Q?lAadIBkobm3METYBfU5t6BhW2YjGa1syPg6I/0sSHc59Pk+eLpNNb10Wsi7A?=
 =?us-ascii?Q?rEgozHzVof0uarn/DvCvnsGULDiuTFS+6jIZdC25SP6zZKLF6zRgwIbu9CND?=
 =?us-ascii?Q?MHRQaq7nObmBg7/IHPc+HqMdOX5A2ou8WGbrkfQ1eqqmCKSXc8eLhEXnt0/G?=
 =?us-ascii?Q?f+XGSDXetEAniqVjXMtg9bkzMti9PzHPB6W3DvcoqBbQow3tv2O0SknFuEar?=
 =?us-ascii?Q?dkjikApezgPrBk8wugPR6BGx8QSE8kQMwehXwa0O3bc2lIyJVG7y4DjakcAP?=
 =?us-ascii?Q?vAO+bxetPkL+jygYTg4hHet/q5Le9oCbkwXNZXXK+pTIY4ZNTvZgPiXGclbT?=
 =?us-ascii?Q?cip48KvQ1FiTvyECWfIFpuzDE44xgDcgbTuMbBCuOy4dmuTSraim3k1w1rs/?=
 =?us-ascii?Q?PWvVFdEu0SaY6TAiKrb27lykJTF6CpHx1zQjoaNUOZDaKP50lAlpE5ciClU9?=
 =?us-ascii?Q?0Z8qt9OpSCkZu5+tr8AwH/82IUIJGBToaw0zUbUTc5ax2bi7zQp3xLz+Q14g?=
 =?us-ascii?Q?rnpPapT6s/aoMmUxZxRbOwY59Z20IUcttKzZ/AIYrM7J4xLl5X89Fk4yF/cw?=
 =?us-ascii?Q?aDRiERIFM4YHwk8qDZFxcbEzGOJOxxz613e4r24Lom6/AdihXKXGmeQpIKcA?=
 =?us-ascii?Q?z/KSEjv0hKuAVU66RiuisPGLlKua6TsxI/mqHiXyhzQZWhOA0eUZHazx4C3i?=
 =?us-ascii?Q?+DWz+w42a9ep9jHXhan5/p7vQSyWmX0wT5ovoux1vSseeuOt19sqYtI0Fe25?=
 =?us-ascii?Q?TXghO45F9noj2pz/a1Ar+JOzSBg/8oRk0Xyu+a5ZUgnap6GhCxcQ1Z5IA0O7?=
 =?us-ascii?Q?eUq6fwpfY6F21MD16ynPnoeN4qUh2ZpCfQSbnrZQC6W293gTmNqeP/krdZML?=
 =?us-ascii?Q?hzJVY45nssLHw4+md/P43b3Dtrr6lG80D6uibU06fJiw3tVMxbnR1kOwQvaB?=
 =?us-ascii?Q?UUqZAwqv3Fg3VuKdSUYJ57pmsWxNvCH//MHrtTNeYerRguIsvzChdqvDWrcj?=
 =?us-ascii?Q?iiddWKpY/0cmtC7xZ600KH2jMsK9YHEuT4zjWp3PJonymQk3XQkXLJFac7kC?=
 =?us-ascii?Q?b7Jo6FM3O+NEE4BQwaJpDYa4sV2/4RKe/c4clZvfSZ59YgX+TX5IdNt4GQPS?=
 =?us-ascii?Q?gQMW0NyMdCDo8t5JmTilEROQpkn401brMbhwSmNfsyegKrss/WHzVl1BcuVb?=
 =?us-ascii?Q?AWAga3J+ejAek6OQkicdLCCCbwGCTY9T6wwBDEcgoPnzARdvCUnIbv0Oujl5?=
 =?us-ascii?Q?p8Y92zDIfB+VVOULYb8sZJ9QLBiAy8G7iSzAaJ1T3fJQQBxWSg1DcNNdHP9W?=
 =?us-ascii?Q?NNUIPn+uJzuhF/PzU+RBQff3Ymv7CvMRmo9x20NxRRsqbvtKhAQlKfBn2Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:55:42.9852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9349f4b-7038-4c0c-53fe-08dd94039f06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658

The mbm_cntr_assign mode provides an option to the user to assign a
counter to an RMID, event pair and monitor the bandwidth as long as
the counter is assigned.

Introduce a configuration option to automatically assign counter IDs
when a resctrl group is created, provided the counters are available.
By default, this option is enabled at boot.

Suggested-by: Peter Newman <peternewman@google.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Added Suggested-by tag.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.

v12: New patch. Added after the discussion on the list.
     https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
---
 Documentation/filesystems/resctrl.rst | 10 ++++++
 fs/resctrl/monitor.c                  |  2 ++
 fs/resctrl/rdtgroup.c                 | 44 +++++++++++++++++++++++++--
 include/linux/resctrl.h               |  2 ++
 4 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 9923276826db..356f1f918a86 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -348,6 +348,16 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
 	   local_reads, local_non_temporal_writes
 
+"mbm_assign_on_mkdir":
+	Automatically assign the monitoring counters on resctrl group creation
+	if the counters are available. It is enabled by default on boot and users
+	can disable by writing to the interface.
+	::
+
+	  # echo 0 > /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
+	  0
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 1f72249a5c93..5f6c4b662f3b 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -933,6 +933,8 @@ int resctrl_mon_resource_init(void)
 		resctrl_file_fflags_init("available_mbm_cntrs",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
+		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
+					 RFTYPE_RES_CACHE);
 	}
 
 	return 0;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 8c498b41be5d..0093b323d858 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2035,8 +2035,8 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
 	}
 
 	ret = resctrl_process_configs(buf, &evt_cfg);
-	if (!ret && mevt->evt_val != evt_cfg) {
-		mevt->evt_val = evt_cfg;
+	if (!ret && mevt->evt_cfg != evt_cfg) {
+		mevt->evt_cfg = evt_cfg;
 		resctrl_update_assign(r, mevt->evtid, evt_cfg);
 	}
 
@@ -2047,6 +2047,39 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static int resctrl_mbm_assign_on_mkdir_show(struct kernfs_open_file *of,
+					    struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+
+	seq_printf(s, "%u\n", r->mon.mbm_assign_on_mkdir);
+
+	return 0;
+}
+
+static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
+						 char *buf, size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+	bool value;
+	int ret;
+
+	ret = kstrtobool(buf, &value);
+	if (ret)
+		return ret;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+	rdt_last_cmd_clear();
+
+	r->mon.mbm_assign_on_mkdir = value;
+
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2056,6 +2089,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_last_cmd_status_show,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
+	{
+		.name		= "mbm_assign_on_mkdir",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_mbm_assign_on_mkdir_show,
+		.write		= resctrl_mbm_assign_on_mkdir_write,
+	},
 	{
 		.name		= "num_closids",
 		.mode		= 0444,
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index cd24d1577e0a..d6435abdde7b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -278,6 +278,7 @@ enum resctrl_schema_fmt {
  *			monitoring events can be configured.
  * @num_mbm_cntrs:	Number of assignable monitoring counters
  * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
+ * @mbm_assign_on_mkdir:Auto enable monitor assignment on mkdir?
  * @evt_list:		List of monitoring events
  */
 struct resctrl_mon {
@@ -285,6 +286,7 @@ struct resctrl_mon {
 	unsigned int		mbm_cfg_mask;
 	int			num_mbm_cntrs;
 	bool			mbm_cntr_assignable;
+	bool			mbm_assign_on_mkdir;
 	struct list_head	evt_list;
 };
 
-- 
2.34.1

