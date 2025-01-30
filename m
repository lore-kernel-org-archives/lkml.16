Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172B1F1526;
	Thu, 30 Jan 2025 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272093; cv=fail; b=VeL3Y0qTLLr77t7e1fWAwyo0lHNK+OaMXCu3+o4p4I6jvXCgNFxUsz6PrR3jVFIHuhHfFXSdocAAwuNr6W2NnetRfOQ6iZBsBJg3bd6IKhcIjM0yLvFHSPB/ovIectLVWI0mn3O+NAgMXFM3KDzF2VmIWMCArP4gsGyfhS74tb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272093; c=relaxed/simple;
	bh=DkbwQuTFb9yM5DfZrpg4noMpy0t1mICtMXuZQ29l2ns=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e52/J050lKXgCIU1syktb1LI0ifPK7/W9W0fF5zgzgeNJPWWim6RxzuXyefNkLmvGdeoQlqccT1y3SFQ1l6VuN2V2FI191P7+BBRrcinPVax+ZhqHyQwAjvsYMd1a7/BzNGlWdKSRR7ip94VPAD9KKSsfjr8u3PDxO/ijZGrzZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jk+2eYHX; arc=fail smtp.client-ip=40.107.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jk+2eYHX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQBmxCgJXpW831cxw74xbcpzUOKCtTYrmUCCXXTgmb+Wk188s4/mmc6cc4QQmDV5LgxvFVa+5c1iUe3CTYpQOkATWJENMRtvCT9mO3GdeIWs/oLW2xUiswhgr7zVPDXN5x2yCEeuOw4VE5oVDUU/jqXOprnmJ5gqF+7XJqH9HkXawLKFVyxNt9EEaO1a/NCE+6nyi3OhROb7RH4snJU3dSgXPhXyVbHg9VSqZcAQn3IV2BafYkueynfyJPFI1uRts9crA6UsznY4rn5J8wi2b1NnhEGHq16hTNGAx93+UPrqN69DGhs67+0YGWrjp4RaM0FZSdOXinkJo9oTXxo91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkjPBhhCxdph2M0NGWvAoTXLtH6yLQ62YKDut/lTLzA=;
 b=f94i5QESSle7METB4q2eLrHR2xORMBsRZ0fgegN0vUlzRm7aTqrIHLvTGYJJLTYZFCxpsXFEMP1EFq2l7ZUGy5/u9ZFzgHpWtq0M4gFR48VqjYvIj69HgI+Z3FTRUV37RI2p6++L1Q5WvUv0KbGgga5SdEOWGz9VQ6Af5e5kaQfPN8kmzK9i7Oh/5HPGY+RCXJNdmRv6ABNaq5QfD2x2dDs0sFDJiTqVjxfMstoB+Opq1VQF4aAFq1VYZNunqX0+96331IQSqQVvQr1n2fzZwI44QVUIraLtkOqabTL34tcUSIv70F2EmT1Zt4Egbs+02VVJikIWJGQGtPSsPDGrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkjPBhhCxdph2M0NGWvAoTXLtH6yLQ62YKDut/lTLzA=;
 b=Jk+2eYHX3Vo4r7E3GDyS48Y3oct0ko4hLL664103HJwzY97th+NTG/JSLy1M9ffxQl/+k8cvl0F5tk8+Xyl0zLyiGfLgd7bfOat4a2dspM8zi4yNqFBmgSqssSLTPZy05ODMIvUdD6eGx+jDWGyIPjme8uNEsz6gcYrlCQHeGKk=
Received: from PH7P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::28)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 21:21:26 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::13) by PH7P223CA0002.outlook.office365.com
 (2603:10b6:510:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 21:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:21:25 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:21:23 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v3 5/7] x86/resctrl: Add interface to enable/disable io_alloc feature
Date: Thu, 30 Jan 2025 15:20:35 -0600
Message-ID: <aa0898d0e6514568086a87fce83969cd55d5a731.1738272037.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738272037.git.babu.moger@amd.com>
References: <cover.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: da32f153-d695-4242-3853-08dd41740da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EUdNmBLOHCZLTqz/82kyi0PC2SobWsgsjGquDiM+49hvgHamA9T0+rM6Ftjb?=
 =?us-ascii?Q?uJdWoCUogCIWaxYT387V76KeCz0KAz3WebiiG6pIdF5I4rx75GYEYEUzZD3f?=
 =?us-ascii?Q?oj43VlzVmJ4R4fJIdbndQ+x93wrQ9KdKeTkraVf6U2vM/L4MNlvUFp3eojDk?=
 =?us-ascii?Q?1670syvINuIfpkIBOLJ5X/GqQStLwQ7U/cahcEAt2cR4LdSFe/q2zT6Gp62q?=
 =?us-ascii?Q?o860TTgNjVxfacVV+QBXaJVKehf8n+I+gB4GLUFrZLl4bIfDwj0V7/Ebz7JV?=
 =?us-ascii?Q?NNvI8XGGhQN8tIWZC+NaGwwUJsHZYbzGkluyEjq90WgMLMlN2JN7wNE/DfXX?=
 =?us-ascii?Q?D5SxosTabFxSPoaffR6iIMOC6fM1nsKlyFJXK3/JC3Emt1eb33DmePEhHsNC?=
 =?us-ascii?Q?2aW87Z9BfWXy++GBrSrBoCiTI1N2ooPzkZ+imrFx0HXToaRVG8nSNPfFRifM?=
 =?us-ascii?Q?xagZydBBasHostZJ+byWBBpKXq6jYgZ7osSUfwNg+Lcgo2KshoPPQjSpcqW1?=
 =?us-ascii?Q?TpIYDo4Xrm/F+BHDbj/f9kbRfthOl5hEod9H57uyPyx9tAV5DEdr060lcnP9?=
 =?us-ascii?Q?XlHiPBrAgV7bZnOAfAHGDgF4MiQ4d358icBSbcTzC/rMikuYWkRBhgjy+4FJ?=
 =?us-ascii?Q?8MOmRAytHZrUITWUVJUcv3LGGnRBzU2a9od9QYKRKLBP+4mWHnVqy2kvI8Qg?=
 =?us-ascii?Q?fQawo1eqOl2AcR/pTxYM00YEe6NIAjFXEfOE7j4g7M3NCP0Qg4AvpcM4KnCo?=
 =?us-ascii?Q?5eOhQGM9Hp+aruCSqLlZRKKOz9IMFdJuNgivBg2TRZsejXI8Bw+BIwzYGR//?=
 =?us-ascii?Q?9Gk05ceINkJ8P2NVtSlvjajDp4yhjLeN3bUYFqx3AwAagPa9NxbMOnKVHFF5?=
 =?us-ascii?Q?wZL5rqAmPSVNcm0G5Gpgho66ntL35k76WvdgW/p1pQNLnPug2Nhc7ukv3BEZ?=
 =?us-ascii?Q?ikkHpSLFTV9FID9eNCE3BemlcxKHKMU02/jaDZR4kKWUUAXqMXHYWSqqDhrz?=
 =?us-ascii?Q?Q5nz4IaLorUhKdJ3a/Ku2IqjoBUAqlHqVyLf2NZtsg9PHPyWIhVWxxevK0Sv?=
 =?us-ascii?Q?pcwQdRFlPJ3wObtPtWVnvZUhgChqKCm/yDMZvAU1ApQqrZK+NEXyrUa8gksC?=
 =?us-ascii?Q?wuXkAa/XbPC3Y5yJt+BfvKCfiCxZ8ONnA+OSxfmJ4nxrKuP3xy6NXOPm5U6r?=
 =?us-ascii?Q?dDbX43IyfEu3397rxXpXwb2o9xvIECx0sTb8PUFew8mpd/fqU/galVLPKEie?=
 =?us-ascii?Q?49dBWd6fn2NwZ6zntIyEcoX65h0zyDUTmsxaqObpndTB7RDze3n/dcd6mc3k?=
 =?us-ascii?Q?gl5084rRXqsBD8RyzBeHBdUxnWgFl3iAx/ZHUAJqa1i3NU1vF7LGCTYadiBk?=
 =?us-ascii?Q?wNCgTpC1DanS/WFt12tHcPzf3k1qm8IJeh28y75hsrE1udarmJCearMsz2ab?=
 =?us-ascii?Q?D0pG9EldcPI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:21:25.6902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da32f153-d695-4242-3853-08dd41740da9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911

The io_alloc feature in resctrl is a mechanism that enables direct
insertion of data from I/O devices into the L3 cache.

On AMD systems, io_alloc feature is backed by SDCIAE (L3 Smart Data Cache
Injection Allocation Enforcement). When enabled, SDCIAE forces all SDCI
lines to be placed into the L3 cache partitions identified by the
highest-supported L3_MASK_n register as reported by CPUID
Fn0000_0010_EDX_x1.MAX_COS. For example, if MAX_COS=15, SDCI lines will
be allocated into the L3 cache partitions determined by the bitmask in
the L3_MASK_15 register.

When CDP is enabled, io_alloc routes I/O traffic using the highest CLOSID
allocated for the instruction cache.

Introduce interface to enable/disable "io_alloc" feature on user input.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Rewrote the change to make it generic.
    Rewrote the documentation in resctrl.rst to be generic and added
    AMD feature details in the end.
    Added the check to verify if MAX CLOSID availability on the system.
    Added CDP check to make sure io_alloc is configured in CDP_CODE.
    Added resctrl_io_alloc_closid_free() to free the io_alloc CLOSID.
    Added errors in few cases when CLOSID allocation fails.
    Fixes splat reported when info/L3/bit_usage is accesed when io_alloc
    is enabled.
    https://lore.kernel.org/lkml/SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com/

v2: Renamed the feature to "io_alloc".
    Added generic texts for the feature in commit log and resctrl.rst doc.
    Added resctrl_io_alloc_init_cat() to initialize io_alloc to default
    values when enabled.
    Fixed io_alloc show functinality to display only on L3 resource.
---
 Documentation/arch/x86/resctrl.rst     |  34 ++++++
 arch/x86/kernel/cpu/resctrl/core.c     |   2 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 144 +++++++++++++++++++++++++
 3 files changed, 180 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 6768fc1fad16..1b67e31d626c 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -135,6 +135,40 @@ related to allocation:
 			"1":
 			      Non-contiguous 1s value in CBM is supported.
 
+"io_alloc":
+		The "io_alloc" feature in resctrl enables system software to
+		configure the portion of the L3 cache allocated for I/O traffic.
+		By directly caching data from I/O devices rather than first storing
+		the I/O data in DRAM, reduces the demands on DRAM bandwidth and
+		reduces latency to the processor consuming the I/O data.
+
+		The feature routes the I/O traffic via specific CLOSID reserved
+		for io_alloc feature. By configuring the CBM (Capacity Bit Mask)
+		for the CLOSID users can control the L3 portions available for
+		I/O traffic. When enabled, CLOSID reserved for the io_alloc will
+		not be available to the resctrl group.
+		::
+
+		  # cat /sys/fs/resctrl/info/L3/io_alloc
+		  0
+
+		  "0":
+		      io_alloc feature is not enabled.
+		  "1":
+		      io_alloc feature is enabled, allowing users to manage
+		      the portions of the L3 cache allocated for the I/O device.
+
+		Feature can be enabled/disabled by writing to the interface.
+		Example::
+
+			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
+
+		On AMD systems, the io_alloc feature is supported by the L3 Smart
+		Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
+		io_alloc is determined by the highest CLOSID supported by the resource.
+		When CDP is enabled, io_alloc routes I/O traffic using the highest
+		CLOSID allocated for the instruction cache.
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 1ebdb2dcc009..88bc95c14ea8 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -309,6 +309,8 @@ static void rdt_get_cdp_config(int level)
 static void rdt_set_io_alloc_capable(struct rdt_resource *r)
 {
 	r->cache.io_alloc_capable = true;
+	resctrl_file_fflags_init("io_alloc",
+				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
 }
 
 static void rdt_get_cdp_l3_config(void)
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index c5a0a31c3a85..37295dd14abe 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -62,6 +62,7 @@ static char last_cmd_status_buf[512];
 
 static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
 static void rdtgroup_destroy_root(void);
+static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
 
 struct dentry *debugfs_resctrl;
 
@@ -180,6 +181,19 @@ void closid_free(int closid)
 	__set_bit(closid, &closid_free_map);
 }
 
+static int resctrl_io_alloc_closid_alloc(u32 io_alloc_closid)
+{
+	if (__test_and_clear_bit(io_alloc_closid, &closid_free_map))
+		return io_alloc_closid;
+	else
+		return -ENOSPC;
+}
+
+static void resctrl_io_alloc_closid_free(u32 io_alloc_closid)
+{
+	closid_free(io_alloc_closid);
+}
+
 /**
  * closid_allocated - test if provided closid is in use
  * @closid: closid to be tested
@@ -995,6 +1009,33 @@ static int rdt_shareable_bits_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/*
+ * io_alloc feature uses max CLOSID to route the IO traffic.
+ * Get the max CLOSID and verify if the CLOSID is available.
+ */
+static int resctrl_io_alloc_closid_get(struct rdt_resource *r,
+				       struct resctrl_schema *s)
+{
+	int num_closids = resctrl_arch_get_num_closid(r);
+
+	/*
+	 * The number of CLOSIDs is determined based on the minimum
+	 * supported across all resources (in closid_init). It is stored
+	 * in s->num_closids. Also, if CDP is enabled number of CLOSIDs
+	 * are halved. To enable io_alloc feature, the number of CLOSIDs
+	 * must match the maximum CLOSID supported by the resource.
+	 */
+	if (resctrl_arch_get_cdp_enabled(r->rid))
+		num_closids /= 2;
+
+	if (s->num_closid != num_closids) {
+		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
+		return -ENOSPC;
+	}
+
+	return num_closids - 1;
+}
+
 /*
  * rdt_bit_usage_show - Display current usage of resources
  *
@@ -1038,6 +1079,14 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
 		for (i = 0; i < closids_supported(); i++) {
 			if (!closid_allocated(i))
 				continue;
+			/*
+			 * If io_alloc is enabled, the CLOSID will be
+			 * allocated but will not be associated with any
+			 * groups. Skip in that case.
+			 */
+			if (i == resctrl_io_alloc_closid_get(r, s) &&
+			    resctrl_arch_get_io_alloc_enabled(r))
+				continue;
 			ctrl_val = resctrl_arch_get_config(r, dom, i,
 							   s->conf_type);
 			mode = rdtgroup_mode_by_closid(i);
@@ -1830,6 +1879,94 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
 	return 0;
 }
 
+static int resctrl_io_alloc_show(struct kernfs_open_file *of,
+				 struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = of->kn->parent->priv;
+	struct rdt_resource *r = s->res;
+
+	seq_printf(seq, "%x\n", resctrl_arch_get_io_alloc_enabled(r));
+	return 0;
+}
+
+/*
+ * Initialize io_alloc CLOSID cache resource with default CBM values.
+ */
+static int resctrl_io_alloc_init_cat(struct rdt_resource *r,
+				     struct resctrl_schema *s, u32 closid)
+{
+	int ret;
+
+	rdt_staged_configs_clear();
+
+	ret = rdtgroup_init_cat(s, closid);
+	if (ret < 0)
+		goto out_init_cat;
+
+	ret = resctrl_arch_update_domains(r, closid);
+
+out_init_cat:
+	rdt_staged_configs_clear();
+	return ret;
+}
+
+static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
+				      size_t nbytes, loff_t off)
+{
+	struct resctrl_schema *s = of->kn->parent->priv;
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	bool enable;
+	int ret;
+
+	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
+		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
+		return -EINVAL;
+	}
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
+	if (io_alloc_closid < 0) {
+		ret = -EINVAL;
+		goto out_io_alloc;
+	}
+
+	if (resctrl_arch_get_io_alloc_enabled(r) != enable) {
+		if (enable) {
+			ret = resctrl_io_alloc_closid_alloc(io_alloc_closid);
+			if (ret < 0) {
+				rdt_last_cmd_puts("CLOSID for io_alloc is not available\n");
+				goto out_io_alloc;
+			}
+			ret = resctrl_io_alloc_init_cat(r, s, io_alloc_closid);
+			if (ret) {
+				rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
+				resctrl_io_alloc_closid_free(io_alloc_closid);
+				goto out_io_alloc;
+			}
+
+		} else {
+			resctrl_io_alloc_closid_free(io_alloc_closid);
+		}
+
+		ret = resctrl_arch_io_alloc_enable(r, enable);
+	}
+
+out_io_alloc:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -1982,6 +2119,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdtgroup_schemata_show,
 		.fflags		= RFTYPE_CTRL_BASE,
 	},
+	{
+		.name		= "io_alloc",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_io_alloc_show,
+		.write		= resctrl_io_alloc_write,
+	},
 	{
 		.name		= "mba_MBps_event",
 		.mode		= 0644,
-- 
2.34.1

