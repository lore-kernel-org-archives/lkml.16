Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245DA1DE2A9;
	Fri,  4 Apr 2025 00:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726127; cv=fail; b=dBSRAkcT56Sv34GRbUwd8+3ngTyl7eRCXATSQaptxEMtvBDQfgbwCk5bsugb54fLhWrJeE6jsA9tERMa94Utop4F21hAFYyx1hKiZak8LQYZs0jFuBEt1oF4fvOyCQdxbtcGjMXpv4fFBU/18XhcZrgV2IjXjkCvg6xMgM00vYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726127; c=relaxed/simple;
	bh=4W68sf57fAM/PINNFBOgSpiZtwAnwAvmzVZ6Y5aMh88=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YOcuW+aG9MQVVd59F3LVKI+tEf4xKYSFXbEMFNxhqjdjNd2FlJQyqsVcWaAF8DpzRgh9zUkwiCKN4DZDST4X6Ml/PxrO10XirFX9bb/oKz2RW4YsiG1HUMpxUbXMAafO80pZRYeM0G2ltVDLi7CJhnubY8iYr2tn6FqbJc4VeZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L776J7Hp; arc=fail smtp.client-ip=40.107.93.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L776J7Hp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2kVlAzfzmu9lu8VhfdshoOPTS1mQYXgfCuDXGMIzUDKonjIfS4IuX5DBcTHp3BGt3o0SHbeRJbXGf3CtUGvXvegoLpFb0Fyb12b6Qez5/fwbgjyEf7iwI/31eVxw5rb7nVm77aDhO2K96SN34Be36ftrt/fBUnsv4NVGYwZuUTLIZoIyAi1BPMlmsdwXV7JYyi9T9lHICPF7iQ6S7Pbk2iyD0YwpY7IKTtGxPSVAUgIao/mahr7dI9yhuTv6HgN1s7fZ3O1Ta4zwQQSYc5knS6lKZs4Zz0XyKUAdVZDA2uVyXUn0ETc2+K15qFH10vuthGIOFeI29EhB46KGDCeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beXPrSm5Vyll/3pPrVs+udMgPnFW/tf5OANMvA0eARU=;
 b=q8D0R7AZi0Erv8GMf/n88iSRbDNNJ2MCce3dpHa/jASmbwsm1Y/1XQv9m5t+aM/LR1Lx3Bk1m6ZcdMl2o4oroGKRIj0ph/QKQdn2SdB5rClfThWgRm1l888CcLm4CwZ/eOGQBKNW72fJcRrxJq4WoKXi2ngjgA8U7+cUI6WJXhSJDiLJBjqzyvGthBiYoZVRd8ax6CUBS9kEUCSTkezHN1VuN7C3UYlKeEvYYpUPv6e7AnSBt7idin7P7N3p35QCDmdv3Imds6FplxeO8oImzy5Bx+Ir9Io7n19DdoTy824K5zGMv1nWTs8id8+LG0tJ18Lyq8poEvV9DzGO+0ZHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beXPrSm5Vyll/3pPrVs+udMgPnFW/tf5OANMvA0eARU=;
 b=L776J7HpdioGhN9bzOHGYFaAL8UoFZDib7mXXAdSRDuAdw3WXlNChKRNGAgg3whgbQs1+cTkmQg8SCWxPbjPBLXgayT5cIZ2ekxVTbdeZvisCjfSumdvN0ne/i+ir7pUpuOS8oghNIIk+21eBombJENLYj0K9bEWEabYXt3LmPE=
Received: from BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27) by
 SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 4 Apr
 2025 00:22:00 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::3e) by BYAPR01CA0050.outlook.office365.com
 (2603:10b6:a03:94::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Fri,
 4 Apr 2025 00:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:21:59 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:21:56 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 21/26] x86/resctrl: Introduce mbm_assign_on_mkdir to configure assignments
Date: Thu, 3 Apr 2025 19:18:30 -0500
Message-ID: <96edc86bf65a7c261a4d4eb1467220d7f7d1cd62.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3bc215-119a-472f-5ace-08dd730eb758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BE8c/B96Omi/pFI4u0wwfbuW3sgXydOfwEFmsUfeP112Gbu2xNW74tSptWoE?=
 =?us-ascii?Q?HAcWH4E8LtqJNZO8CrZkCDNb7fdNW1/kKNtQobJqGh6jH76vt6UeEKb/+nMD?=
 =?us-ascii?Q?hoyOjv+4Ec9fSafZ1+OMAwC1asdlB4CM4ry9CX8KiKlLV18T0f0jw5BaaQFb?=
 =?us-ascii?Q?g5d09PZZoZGjBZdfTkAA1k5GB1gjtwOMZhD2gfI7ZAEZoNaylhdUZgjyqdw+?=
 =?us-ascii?Q?FGQapyJE9T8KrjHdVGjZOn17q/soLUDOb3YhlHT0lCyRqzhUBqZBo12JY5E7?=
 =?us-ascii?Q?a2CT4C1b9MGADwfsPMRIIC5wU4RlCGFpCD53QJHWSsDOoVuLiDezMBsvPhRo?=
 =?us-ascii?Q?sqBn7aEC7jKpM47T5lGoTz4d3T6FrwYmY4QaHS6ypLVEPJuXz+wRjDct9rTv?=
 =?us-ascii?Q?HWk9g7AggdJgHTpMmWulAmCsX/O7s402EldTXf03V8aZz33DKJMKn+u8TVn2?=
 =?us-ascii?Q?9+trE7XaR+4i+ru98PQhNo3c1+svf4Ur6aaQvSKSBVnf0U7B4BYYeQJn7NTT?=
 =?us-ascii?Q?/B8SK3KkqqDaPPwUy6gJvbN7qZ3FTMEuCj0/kbbHwUksvtSYs0kefMMHIfNn?=
 =?us-ascii?Q?QR9eY7zDba1u1MEY/UXpLK5S2dSuWdlAmySKBXH9nt2oCcFNWHCuxFETk8If?=
 =?us-ascii?Q?5kEK5iDWKOod1KQA3nrLsTHdFv4PaI8Kef2ans5zPnUi9s9krwi5gkdBCjnk?=
 =?us-ascii?Q?igXoPRkASnUd8XufsCWpNJ1pApFGDQRpZOhp4Ql1qMnV7ZSjcdDQZ5a3BtDq?=
 =?us-ascii?Q?7rSh7cGDyf/JX6U0YHGf70+7L9zvVCMuuYND0/EWownE8ZxOKJViysU521f7?=
 =?us-ascii?Q?cpxPwKy3PQSoYA803E+u3eDX3+gnVTx0kcT1TNkLazCNRNH1TDPRmoBIAzOF?=
 =?us-ascii?Q?R6wpDaUXcP0hSQA2InR6kMgnozuj4goU6yFmtI8ehxkLXr+Q8g74PxcEPPow?=
 =?us-ascii?Q?rOiIWmALB8dtfs8bXOT3FVWRX2OoEENtnBGglfMSkW0pJtLmkmWtMzXP2NQb?=
 =?us-ascii?Q?kB54eOaFjYkdJbrIVLgTo/v7/k16QyURB8qgsa+O7x9oQ5aPjGfw2YA5UstM?=
 =?us-ascii?Q?yL8uugn2NC8tSecqTxJai4iQcsWdIAuM5r5XMrgKlGTlFqgjFZC+74zQnmad?=
 =?us-ascii?Q?NQTO/l8Lsf4FTSfXQW8zuiwL+67h6XLxuE6JOdOYB7gLRtKXeWKqr5V95F4p?=
 =?us-ascii?Q?qQcN/q9EVUmW91PEOxUGCcOu8b84PHB7hkoMxECU4sUT+ZcLhMOe+PwrTHFE?=
 =?us-ascii?Q?0MOokZ907mq59j6LF88eUl3f+udalaHTuOmDJ8se5CfzQlKkXb4pRyylxC/g?=
 =?us-ascii?Q?1WSyI/itqaGsG2cyp7wf8kOjBVM+YemyiBOeZs57eu8uV2n7mgiQvft5arQY?=
 =?us-ascii?Q?OSy9LzYn6Hdwxapv6hpJOEWjjN4oSR9fDzQkzMN8HKV/rfITfjcBZx14wzgn?=
 =?us-ascii?Q?EF+a7Zv9Psqp+gW98PQEUoEP7m9jPil1ZbGnh+t5MB+O4RjfPA1svklDjH48?=
 =?us-ascii?Q?jrXM86LXZRN38cQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:21:59.7829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3bc215-119a-472f-5ace-08dd730eb758
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063

The mbm_cntr_assign mode provides an option to the user to assign a
counter to an RMID, event pair and monitor the bandwidth as long as
the counter is assigned.

Introduce a configuration option to automatically assign counter IDs
when a resctrl group is created, provided the counters are available.
By default, this option is enabled at boot.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: New patch. Added after the discussion on the list.
     https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
---
 Documentation/arch/x86/resctrl.rst     | 10 +++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 40 ++++++++++++++++++++++++++
 include/linux/resctrl.h                |  2 ++
 4 files changed, 53 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 4e6feba6fb08..a67f09323da0 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -345,6 +345,16 @@ with the following files:
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
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 4525295b1725..ee31dfe2c224 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1265,6 +1265,7 @@ int __init resctrl_mon_resource_init(void)
 		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
 		resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
 		resctrl_file_fflags_init("event_filter", RFTYPE_MON_CONFIG);
+		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO);
 	}
 
 	return 0;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 7792455f0b26..592a9dc5b404 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -993,6 +993,39 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static int resctrl_mbm_assign_on_mkdir_show(struct kernfs_open_file *of,
+					    struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+
+	seq_printf(s, "%u\n", r->mon.mbm_assign_on_mkdir);
+
+	return 0;
+}
+
+static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
+						 char *buf, size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
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
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -2176,6 +2209,13 @@ static struct rftype res_common_files[] = {
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_available_mbm_cntrs_show,
 	},
+	{
+		.name		= "mbm_assign_on_mkdir",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_mbm_assign_on_mkdir_show,
+		.write		= resctrl_mbm_assign_on_mkdir_write,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 107cb14a0db2..ad3d986c4ea1 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -250,6 +250,7 @@ enum resctrl_schema_fmt {
  *			monitoring events can be configured.
  * @num_mbm_cntrs:	Number of assignable monitoring counters
  * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
+ * @mbm_assign_on_mkdir:Auto enable monitor assignment on mkdir?
  * @evt_list:		List of monitoring events
  */
 struct resctrl_mon {
@@ -257,6 +258,7 @@ struct resctrl_mon {
 	unsigned int		mbm_cfg_mask;
 	int			num_mbm_cntrs;
 	bool			mbm_cntr_assignable;
+	bool			mbm_assign_on_mkdir;
 	struct list_head	evt_list;
 };
 
-- 
2.34.1

