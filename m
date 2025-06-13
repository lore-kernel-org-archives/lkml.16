Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F05E273810;
	Fri, 13 Jun 2025 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848945; cv=fail; b=hOPVbBu3XZMjAZLfDmk239H/F/yvHZ2zjNrOUQaEnlOMYDGJ/3YR3LFUK3JN4sO3lWelYJ3ZMuelNNiFHnnuwCGnGjKyrFCmMe7YQ1CxFoChaKqvA09ZlF6orvdXxX9gQ8yUJbt8kT9r5SGNbD+P/0eFKr7lU61Ij5ttie9xcSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848945; c=relaxed/simple;
	bh=4bFMNdnQf+6YNkTZeoM5BMqDzhqlKiQonnTCxDaLEQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLZ0DvkOw86mbwRmSQlaF/7goeTl3J1yWnGBhDiVMDW03GWsgvle0LlD02CgMyuuLiit8JKYbj+9N3HpnBkVeH0+Aj/k26F7c2SJARO+cYb/FGvJpLaK+6ilZ4w3Dv3ARlVSs2fPOKsI7Y/7vz7uHlUfgM7vjqBfFAsG5rgz+Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XnNByYi8; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XnNByYi8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwoQ6b7igQ58dZ5suH7Jf7Za7rU0Rr7OsEWC1fdmA6eGe0sLKoJl1drtikEgjv1unEVFn5mwWdN040l1aMtc2M5x3c1UZIP8WTMgcaC9+392nx39/nyOYieLUwl/eLiVhq86bmiuRWfdA+WuA9aOb3L5t9SSKd9AnJleH3AXLYN73NZ5Tli9moJB942VykpHbaxE103shPZnQj0r1D63JV6xxsA3o29XrixeM4qtP8NYHiVMcd0h9dwQ2AWegL7TEJzAbaafa9YDwX/0RrkN9betwab5O+h4I6BOGZAxPaoy0FomZM38+40x1KGYuAmopemEXADLiSQlUQid8a8z0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0qd+DykOPr3yHTX/yOD+ziS4y8nvw4ixsfA/dt0UgY=;
 b=Ci0AZ2EswykV3pvNdhogMfRZwGa/yZxWRxGn1mGHihiac9wlGTV9CkR2/q7WzZBw2zSStSzLaWUExMzrS1I7rxgXcghfe+ZsqkhjzvBtZStn7tJdeoOoemB9rYYkSimFyHwAUQ7G+s4YVuS36isF+Rx3xp14tSSQcixCHTikJt7i72qgJh61tHdiXyABEHKueswvJ4BuOJ9zFV283maXmUsVPJP79PwnuJI9WKIthKECPLMH1tokVk3R9Q6Dh11EN0z8t6cJSS0XI2nJU49ngDExBKYLYwIpsJBTBAdK6Wf0JQ7WGueCHovz/+UbjxM5HOP4ECckW3lRFCChFL6tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0qd+DykOPr3yHTX/yOD+ziS4y8nvw4ixsfA/dt0UgY=;
 b=XnNByYi8KU4MPWv3IeDxKt+n9SSZlyV352xN6x7vy+oJqMAy0Lx86URcnfeRlTPBT6BSIvxI8tqMgHfDfoxhc7PsawmSGHl3KLeuxDp9h5EnAQN111p0a7UNVydLjd6i7F56n50rDgj8sYhoq49O3VM2ivmQCL6P9msrd08FTBA=
Received: from PH8PR21CA0003.namprd21.prod.outlook.com (2603:10b6:510:2ce::14)
 by BN3PR12MB9594.namprd12.prod.outlook.com (2603:10b6:408:2cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 21:09:01 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::17) by PH8PR21CA0003.outlook.office365.com
 (2603:10b6:510:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:09:00 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:57 -0500
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
Subject: [PATCH v14 26/32] fs/resctrl: Introduce mbm_assign_on_mkdir to enable assignments on mkdir
Date: Fri, 13 Jun 2025 16:05:10 -0500
Message-ID: <a44e9063c26c2c33701816d09f488cec522f2530.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|BN3PR12MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f7267c-7a70-400e-ca4a-08ddaabe850f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9DV752GlTr/mzOatJd9ZY2AjJs5gd6PfGKcpMTYFijPPUPzE+1Ch8Th0/mzK?=
 =?us-ascii?Q?KHtDiaKUqfOX4rDYgfix0GjqC0OMS2qBT6ZmJxSu6HHfUrGVDBk2GjHExjh7?=
 =?us-ascii?Q?iQMyUoS0vcaZbC6Kp3o1zKv4VlAR5ZSVWYeWYHMAabVem4uQfDJqtNWG4g56?=
 =?us-ascii?Q?d5tvz9Sm5pwujALBIIKuJucJ5q2+1aG9ECYQq4GBUhJ2q2wzgL8knig2wMhu?=
 =?us-ascii?Q?z6dJVSVdmbPJS2QwMHI2/+FYIOY2WL1RA3MEZ+eyT76cinmylFerC+bMSeJv?=
 =?us-ascii?Q?bRArxTWg/Wk9/jcYbzjcnKZLDa1NkYqRvU++YRnKoKF9dHkD4cVFTcfIvuns?=
 =?us-ascii?Q?8bBAa1xu686zkug8IZyzo/LvGOY9uKjjWqDh535Pu9nOWxgLgxQiGHEkhQri?=
 =?us-ascii?Q?iYCh9yS0lOSaeOgLeULNKt0OqBBGvUiUcVPDQHWxNvYQLoBEUM9BW6v28Xhe?=
 =?us-ascii?Q?Sc5KsoD+kJ6DUzMGIcXshrnG2xpnbwn+hHAiAzq40GK0Rwd83B8VQXK5TFgx?=
 =?us-ascii?Q?fvp64mrHqT7CtN/OWYniQ3vsXB9x9RYFieCw/M+Unl81eFjmQ19MgjSLkXnu?=
 =?us-ascii?Q?LEsBQKXRuz5zuEq196Wp7NjdgS7Q4RnpzPtyWiHe6hk9z0S4/W9w25rGv1VP?=
 =?us-ascii?Q?3Uoc+iu6xlkQ0MANb08YUbRHJBzYiu6ulwf2jVzHa0828JD2e2yeqMWc8RZ4?=
 =?us-ascii?Q?G3SxlzjCW4+t8d532hvvbqqFWc7PVM1MglnAaCZuLfFeCMzed7YhEr6mpA8T?=
 =?us-ascii?Q?1UAQKZHCo3VssOZC+aM4qiWbrq0k+G0ef1Vrg5NdTqkFOTBFO8SykAysuJZe?=
 =?us-ascii?Q?zV9g5dUP3ye11Sr276wLFtQBTHvwjkOcySGYNq+2I2DUOcvBdEWL015Vn8xR?=
 =?us-ascii?Q?DfwA/5td7TsDryofwCrweBOddnw+Lcz9gyBtzmE1+/7+5MD0sSsaqaazx9W6?=
 =?us-ascii?Q?nw8hB1Ov+4mPN2SqvTaM/BWGSxVp/5bB3OjaDVEV+4702pgWKVbWTC8AdBcO?=
 =?us-ascii?Q?zJnPne9Dz3o5XIS2kGXcAMVmZVnxBLh1jvM2e4pFyd9VLLElkp8gMrhuC/UO?=
 =?us-ascii?Q?DqVsJwFvUyyrBK/Uln3nJpzfzTFRnTGSJMcR4knSpJ5JLBIKdYbOEUIy4aMH?=
 =?us-ascii?Q?r+ngASmuHQANG/tMw9zad6HacTWT1ZMLJFbm9qTfH1u5NJbFQPs/OLc7zYbF?=
 =?us-ascii?Q?RvA0ftBp0usVGapY2XtVlm8kycB81nkNSYDYIP5Pc7Tazhz1iC81/or2o4FR?=
 =?us-ascii?Q?ytx1rrLOn54rJ3AdgrJMBkdLy03tPCLxN3jcqm3hyjX7JbiS+7uC/1Cfb9w9?=
 =?us-ascii?Q?bdEQZdFGmspinKuBEeaUtvzfV/Y+gL3ca5rUXeli/VQ/TRT0I5DZ0QmqeIR9?=
 =?us-ascii?Q?XLYJYJUGkDFEY+58S5ccpRRwec9IeD4zOA3rAOrCp8igPp9ECeVLKC+QLrV4?=
 =?us-ascii?Q?joLSk2SekkgtdRDGwdc8fVWRbHJmwyDLpFyKrS03lvag8Kt8SEWsz+DD6tQc?=
 =?us-ascii?Q?y58vCMhCuImuaVo9xbNnWpPAKJso8YeH/FcEblH2qYX9VA50RTFpVwiVAw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:09:00.8391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f7267c-7a70-400e-ca4a-08ddaabe850f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9594

The "mbm_event" mode allows users to assign a hardware counter ID to an
RMID, event pair and monitor the bandwidth as long as it is assigned.

Introduce a user-configurable option that determines if a counter will
automatically be assigned to an RMID, event pair when its associated
monitor group is created via mkdir.

Suggested-by: Peter Newman <peternewman@google.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Added rdtgroup_mutex in resctrl_mbm_assign_on_mkdir_show().
     Updated resctrl.rst for clarity.
     Fixed squashing of few previous changes.
     Added more code documentation.

v13: Added Suggested-by tag.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.

v12: New patch. Added after the discussion on the list.
     https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
---
 Documentation/filesystems/resctrl.rst | 16 ++++++++++
 fs/resctrl/monitor.c                  |  2 ++
 fs/resctrl/rdtgroup.c                 | 43 +++++++++++++++++++++++++++
 include/linux/resctrl.h               |  3 ++
 4 files changed, 64 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 2cd6107ca452..f94c7c387416 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -354,6 +354,22 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
 	   local_reads, local_non_temporal_writes
 
+"mbm_assign_on_mkdir":
+	Determines if a counter will automatically be assigned to an RMID, event pair
+	when its associated monitor group is created via mkdir. It is enabled by default
+	on boot and users can disable by writing to the interface.
+
+	"0":
+		Auto assignment is disabled.
+	"1":
+		Auto assignment is enabled.
+
+	Example::
+
+	  # echo 0 > /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
+	  0
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 09a49029a800..1ec2efd50273 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -957,6 +957,8 @@ int resctrl_mon_resource_init(void)
 		resctrl_file_fflags_init("available_mbm_cntrs",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
+		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
+					 RFTYPE_RES_CACHE);
 	}
 
 	return 0;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index fdea608e0796..bf5fd46bd455 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2045,6 +2045,42 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static int resctrl_mbm_assign_on_mkdir_show(struct kernfs_open_file *of,
+					    struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+
+	mutex_lock(&rdtgroup_mutex);
+	rdt_last_cmd_clear();
+
+	seq_printf(s, "%u\n", r->mon.mbm_assign_on_mkdir);
+
+	mutex_unlock(&rdtgroup_mutex);
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
+	mutex_lock(&rdtgroup_mutex);
+	rdt_last_cmd_clear();
+
+	r->mon.mbm_assign_on_mkdir = value;
+
+	mutex_unlock(&rdtgroup_mutex);
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2054,6 +2090,13 @@ static struct rftype res_common_files[] = {
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
index 4b52bac5dbbc..39dd3acff372 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -281,12 +281,15 @@ enum resctrl_schema_fmt {
  *			monitoring events are configured.
  * @num_mbm_cntrs:	Number of assignable counters.
  * @mbm_cntr_assignable:Is system capable of supporting counter assignment?
+ * @mbm_assign_on_mkdir:True if counters should automatically be assigned to MBM
+ *			events of monitor groups created via mkdir.
  */
 struct resctrl_mon {
 	int			num_rmid;
 	unsigned int		mbm_cfg_mask;
 	int			num_mbm_cntrs;
 	bool			mbm_cntr_assignable;
+	bool			mbm_assign_on_mkdir;
 };
 
 /**
-- 
2.34.1

