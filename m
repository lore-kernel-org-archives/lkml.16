Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB322ACDC;
	Mon, 21 Apr 2025 22:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275500; cv=fail; b=cPknR56MVtZbFeXck2qSpTzz3KjhHmyXxaqQaQz37tZ/v7AE17QixPDvcKcdFh/pzrv/xIZlGBABnKV0+JBsPMTHXVAxKgTi8x21P/J7V8rOmhOX1yMfYh3IRWOWJTaYCHE2lq9oOUEiaoQ+4W9EHuPCuTQeQyn58mTtH7tB6Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275500; c=relaxed/simple;
	bh=3+q03Qa+y/s793yB/jaQsKdbvGmViY4iofM5JSf8N1s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhDwmus08RO37Z4J76f6DTxX1CK+Fl91Hd2PJjL35nE/IKeoMuf1gY++p8Cw8aea66x+3k7qBehrb1fS034DY5zs7KCFrePdVB7PY5VF6csgCjtKJEr0acgw+F7/x89y5lD9nR4eyPg31FuhhOgCopt+erQiuJxXuJJODrx9rrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DYAVvvPN; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DYAVvvPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg7zb26RCIOvKN9Qf5FSF79SDAvkI8Hf1aKBLLTzIglu40ZKsFLETbHXLAoFjyAoAyZGZhzR0TMy3cVEjnaRYAnVgkNdwX+HdY3ca33DUt+1dgQmwjmzWetkQubn570yHHH3J5f6BgZ5wl0RT5/KRPGu8aitxwH+Z4ALJ9ePvzvZdwJsBgwgAc7Nj7lpvK3u9YSWRALPa9QHkmqQ2q3IxCBWoNdHtrl2TqMIQm3JqU47xTCsmsNzqOr4zEbM/WA8vOC2nF9c1SnMCszZ4JpzPPlbdkfvL/wy5xzUeHCJSSDo5OWyg/jLWSC5g0cj8deZ3W1hhRnUvMYdGP87ZnmDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/7Rk83BXoZrGAdBKfi/Exznj/2AGDtvfEVWmiTZT3o=;
 b=C533vA466iVxjTyU1PCXzRNrcxAtUnEd7hBUaTqjuhbs9708eU7vWJmWGjfhKdFtRMmdxKoJlrQaq5RUD9q14MyA/eByCYJXlzsMyqwC0feepFqZxRP+hJ4dDyKCaKLjS4sGojkFg6iHS1WzrTaI97K7Vp9z7yg3NIFLG//daHQGCtGxYEwaVV0E1Ro/pvpouH127KG1t5s8IGFontEzSq7ICQjyv0Uh4m4QZRyYuMU1f0sSFqddI9vAGg671VkMk07mZ1CCjYxYmKjxHefTsECcGoK4DFz6BD661nrE0OExekD4bi4aEdM1Xo1SeFXxlLjhJImucV/R/L1RgWzG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/7Rk83BXoZrGAdBKfi/Exznj/2AGDtvfEVWmiTZT3o=;
 b=DYAVvvPNEokmhbTga+cMDIPa7QYrmHB4Gajm42Xiy1c+7Eni9VL9y2NauahsZbKXa58Ep655iVBrGhhaXnmm+CkR52FvZhu3v7r+howLZUgI8kQohES+VjpeXPFPS913Ii356xDhN1rKfTJXiKy1Urb9vX7m19FAU13mEqjkWDM=
Received: from BN9P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::12)
 by MW4PR12MB6706.namprd12.prod.outlook.com (2603:10b6:303:1e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 21 Apr
 2025 22:44:53 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::5a) by BN9P221CA0004.outlook.office365.com
 (2603:10b6:408:10a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 22:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:44:52 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:44:49 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
Subject: [PATCH v4 5/8] x86/resctrl: Add user interface to enable/disable io_alloc feature
Date: Mon, 21 Apr 2025 17:43:49 -0500
Message-ID: <963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1745275431.git.babu.moger@amd.com>
References: <cover.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|MW4PR12MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: a1420f62-4e03-484c-20d3-08dd81262172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lWUgZ6L7vxd9z1+juA6XFvzf+Of5+o4ySxbpeWQoxgVcA1A0XcbeXhYcWzRN?=
 =?us-ascii?Q?VrtsgYtBG7bKI4edXXqv0qo77A/MhRB6hRUT0uGY9W1NYLsW99W7s4ryZE5y?=
 =?us-ascii?Q?ZEtvQ5kJe3cqVFYhpcknganLNVMHWZRs1zohyVF4MvqxjwKdrmsSHvOcp4HW?=
 =?us-ascii?Q?QKD2d052+/S85djj0AuUh/vQz/dpFGBFMqcuIkwWmOuKOIlelSaNJosGxvQs?=
 =?us-ascii?Q?JXIC76zWGHfGOUdokIEkBoxwkRR1dwTDFSGNecjTUG0jM3dC5gCS5Q9Wsky1?=
 =?us-ascii?Q?rwgUzewqVYxwuU10i0Q8iLLOQ4f2CeFggvWIl4FgYdFCSwrDa9UkhrX0gm8U?=
 =?us-ascii?Q?cchwrrFh2FejLhyOp97dzf5uZWAF2YISa0QIi4GMKjrdQi4BO0FqzbMmar0q?=
 =?us-ascii?Q?J+yuQw8sKMjSykS0ocuxQtIJqmj0qp3lzmbsTOc7oWQH89rouW672dv0z41q?=
 =?us-ascii?Q?FyEwp8Ll+csabA5Hd1AysBpN+SdEwrdcnlpf91T8TSQHCNUFH+d3Q1HxFqWn?=
 =?us-ascii?Q?oIytdhDDZeaPuqdI0cUGl07eeCT3YWAsn6F/f/PmjdVXDI5B29gY6pszu1ni?=
 =?us-ascii?Q?y/oXkQLdftotj7w+2LT8Xxqr7XbP5IlfxmjTTojAezRL+W9qG31xDmifICGx?=
 =?us-ascii?Q?k0m9waC12hVcLMdh6ji2swXdpFbjIlZ91jlAHw8QkzpL5f+9lXOTGQKTQHXl?=
 =?us-ascii?Q?LUBW+bMYmpCG4cJ+MN6CGo0JFEKmfcnHerskrPJw4iGDwofqRLIhLCMrzUdJ?=
 =?us-ascii?Q?sl43WETWiZwFkr6GRNQCLaegwg1K7KXFAHWh7FF88eFzvpXYG201/J0uP3tU?=
 =?us-ascii?Q?m4FtzQ0jYDQbIxDi92cOxWNeSa5tJjO2/po0ucd4rdToa9QwH6WYgHymgu9z?=
 =?us-ascii?Q?UNcf5idjwAKnMGWfWk6Rw5FaJSfQln1DfqXgn4N7CngVhO+ty5B7d6Q9/h43?=
 =?us-ascii?Q?Dkp8tudHMokh3RuK+88uqgbsZRqjAs/pgAQUuhIJalsLzCyFwiCp7YIOOaYx?=
 =?us-ascii?Q?aUblYSVGZmIRaPjsCQghNlqC18uBPx7PVKjlKJ4tz9ahoYR4271o4EKXcWZq?=
 =?us-ascii?Q?4xKjgrBXS4zwkhSoxswGj2ZVBpLASA8OOLE2p9tfhrdLfO+NkbimJwb7egtl?=
 =?us-ascii?Q?gFHPZFOOvHTWa48stcknPwzOOajOn3+Kg+Ux1M6GM/HkBwU9oDwI2x69fF4l?=
 =?us-ascii?Q?vYJJXjBQ8zYqYWYdWRAPcOzD21QPdnqH32ykbws22D1cY+8SPcCmCl312LOk?=
 =?us-ascii?Q?Oy9kwIZjHfTzNqjDahzC9EoBDHHesobB3soWtSSIBFQzVVdKFIWRqKbTtjGT?=
 =?us-ascii?Q?BjWQn1A/oEV7usYgrtGktCJDCLJbIFuB9TrGExh+Fwh3rSdm1ZwSvLnrqhzC?=
 =?us-ascii?Q?HmU76fQPywEX8XVDX3NjrML0wlu76Qvv/RxmVOGeD+X3nPpkzRvMOSMPqTMy?=
 =?us-ascii?Q?P7lS/2Xks9SJUdOtg4tBGfiJHSpQ//yKWBeAUmWLFAD/wt8IUfUcJDIxbk4V?=
 =?us-ascii?Q?kq2PGmJSb3xUNes=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:44:52.5939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1420f62-4e03-484c-20d3-08dd81262172
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6706

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
allocated for the instruction cache (L3CODE).

Introduce user interface to enable/disable "io_alloc" feature.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Updated the change log.
    Updated the user doc.
    The "io_alloc" interface will report "enabled/disabled/not supported".
    Updated resctrl_io_alloc_closid_get() to verify the max closid availability.
    Updated the documentation for "shareable_bits" and "bit_usage".
    Introduced io_alloc_init() to initialize fflags.
    Printed the group name when io_alloc enablement fails.

    NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
    handle bit_usage for specific CLOS. Its about overall system. So, we cannot
    really tell the user which CLOS is shared across both hardware and software.
    We need to discuss this.

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
 Documentation/arch/x86/resctrl.rst     |  34 +++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 185 ++++++++++++++++++++++++-
 2 files changed, 218 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 6768fc1fad16..7672c5c52c1a 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -95,6 +95,11 @@ related to allocation:
 		some platforms support devices that have their
 		own settings for cache use which can over-ride
 		these bits.
+
+		When the "io_alloc" feature is enabled, a portion of the cache
+		is reserved for shared use between hardware and software. Refer
+		to "bit_usage" to see which portion is allocated for this purpose.
+
 "bit_usage":
 		Annotated capacity bitmasks showing how all
 		instances of the resource are used. The legend is:
@@ -135,6 +140,35 @@ related to allocation:
 			"1":
 			      Non-contiguous 1s value in CBM is supported.
 
+"io_alloc":
+		The "io_alloc" enables system software to configure the portion
+		of the L3 cache allocated for I/O traffic.
+
+		The feature routes the I/O traffic via specific CLOSID reserved
+		for io_alloc feature. By configuring the CBM (Capacity Bit Mask)
+		for the CLOSID, users can control the L3 portions available for
+		I/0 traffic. The reserved CLOSID will be excluded for group creation.
+
+		The interface provides a means to query the status of feature support.
+
+		Example::
+
+			# cat /sys/fs/resctrl/info/L3/io_alloc
+			disabled
+
+		Feature can be enabled/disabled by writing to the interface.
+		Example::
+
+			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
+			# cat /sys/fs/resctrl/info/L3/io_alloc
+			enabled
+
+		On AMD systems, the io_alloc feature is supported by the L3 Smart
+		Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
+		io_alloc is determined by the highest CLOSID supported by the resource.
+		When CDP is enabled, io_alloc routes I/O traffic using the highest
+		CLOSID allocated for the instruction cache (L3CODE).
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 85796a186374..d53a2068cde4 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -68,6 +68,7 @@ static char last_cmd_status_buf[512];
 
 static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
 static void rdtgroup_destroy_root(void);
+static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
 
 struct dentry *debugfs_resctrl;
 
@@ -199,6 +200,19 @@ void closid_free(int closid)
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
@@ -1033,6 +1047,31 @@ static int rdt_shareable_bits_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/*
+ * resctrl_io_alloc_closid_get - io_alloc feature uses max CLOSID to route
+ * the IO traffic. Get the max CLOSID and verify if the CLOSID is available.
+ *
+ * The total number of CLOSIDs is determined in closid_init(),  based on the
+ * minimum supported across all resources. If CDP (Code Data Prioritization)
+ * is enabled, the number of CLOSIDs is halved. The final value is returned
+ * by closids_supported() and stored in s->num_closid for each resource.
+ * Make sure this value aligns with the maximum CLOSID supported by the
+ * respective resource.
+ */
+static int resctrl_io_alloc_closid_get(struct rdt_resource *r,
+				       struct resctrl_schema *s)
+{
+	int num_closids = closids_supported();
+
+	if (resctrl_arch_get_cdp_enabled(r->rid))
+		num_closids *= 2;
+
+	if (num_closids != resctrl_arch_get_num_closid(r))
+		return -ENOSPC;
+	else
+		return s->num_closid - 1;
+}
+
 /*
  * rdt_bit_usage_show - Display current usage of resources
  *
@@ -1076,9 +1115,20 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
 		for (i = 0; i < closids_supported(); i++) {
 			if (!closid_allocated(i))
 				continue;
+			/*
+			 * If io_alloc is enabled, the CLOSID will be
+			 * allocated but will not be associated with any
+			 * groups. The region is available for sharing with
+			 * io_alloc feature as well as resctrl groups.
+			 */
+			if (i == resctrl_io_alloc_closid_get(r, s) &&
+			    resctrl_arch_get_io_alloc_enabled(r))
+				mode = RDT_MODE_SHAREABLE;
+			else
+				mode = rdtgroup_mode_by_closid(i);
+
 			ctrl_val = resctrl_arch_get_config(r, dom, i,
 							   s->conf_type);
-			mode = rdtgroup_mode_by_closid(i);
 			switch (mode) {
 			case RDT_MODE_SHAREABLE:
 				sw_shareable |= ctrl_val;
@@ -1877,6 +1927,121 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
 	return 0;
 }
 
+static int resctrl_io_alloc_show(struct kernfs_open_file *of,
+				 struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = s->res;
+
+	if (r->cache.io_alloc_capable && !(s->conf_type == CDP_DATA)) {
+		if (resctrl_arch_get_io_alloc_enabled(r))
+			seq_puts(seq, "enabled\n");
+		else
+			seq_puts(seq, "disabled\n");
+	} else {
+		seq_puts(seq, "not supported\n");
+	}
+
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
+static const char *rdtgroup_name_by_closid(int closid)
+{
+	struct rdtgroup *rdtgrp;
+
+	list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
+		if (rdtgrp->closid == closid)
+			return rdtgrp->kn->name;
+	}
+
+	return NULL;
+}
+
+static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
+				      size_t nbytes, loff_t off)
+{
+	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = s->res;
+	char const *grp_name;
+	u32 io_alloc_closid;
+	bool enable;
+	int ret;
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
+	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
+		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
+		ret = -ENODEV;
+		goto out_io_alloc;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
+	if (io_alloc_closid < 0) {
+		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
+		ret = -EINVAL;
+		goto out_io_alloc;
+	}
+
+	if (resctrl_arch_get_io_alloc_enabled(r) != enable) {
+		if (enable) {
+			ret = resctrl_io_alloc_closid_alloc(io_alloc_closid);
+			if (ret < 0) {
+				grp_name = rdtgroup_name_by_closid(io_alloc_closid);
+				rdt_last_cmd_printf("CLOSID for io_alloc is used by %s group\n",
+						    grp_name ? grp_name : "another");
+				ret = -EINVAL;
+				goto out_io_alloc;
+			}
+
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
@@ -2029,6 +2194,13 @@ static struct rftype res_common_files[] = {
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
@@ -2137,6 +2309,15 @@ static void thread_throttle_mode_init(void)
 				 RFTYPE_CTRL_INFO | RFTYPE_RES_MB);
 }
 
+static void io_alloc_init(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+
+	if (r->cache.io_alloc_capable)
+		resctrl_file_fflags_init("io_alloc",
+					 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
+}
+
 void resctrl_file_fflags_init(const char *config, unsigned long fflags)
 {
 	struct rftype *rft;
@@ -4381,6 +4562,8 @@ int __init resctrl_init(void)
 
 	thread_throttle_mode_init();
 
+	io_alloc_init();
+
 	ret = resctrl_mon_resource_init();
 	if (ret)
 		return ret;
-- 
2.34.1

