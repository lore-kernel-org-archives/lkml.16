Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884A1BD9CE;
	Wed, 11 Jun 2025 21:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677086; cv=fail; b=Y9vMO6v0BfF1jyNiaSzPUKu/qq0udSW3w3QW8W3OW+Oj4eMru/inzvRMh0p5HE/U6Gev6ZrNy8lNRsElH9XsEkUo0USe8ya602PmXwUi3bl8AsThmJTNiQJxM75H86OST3MkaJ1EbV0oORJT7Qyg9G8PaGXp4vWzlHiHRCa1PbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677086; c=relaxed/simple;
	bh=okbKyjN/UHnW54RjACMzc0Im7fimRCV3cmiXpE4X8SU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HitzRx04RMX0IlKfARifdiElInvCMTrk6w8AO3J5dKVixnCZGUAOvfDoFj1mcSxlbrWwgH9QPxk7huQJM5mjRki6/oAyV+JsNzUCyiq1o46dkJaaTnzSAUbgZy9mv/6ud4aF6u58zLf34jMgvIH+Odjxkxvbdl/FyOLe/x6IZt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c3+/5yqk; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c3+/5yqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjDB+uiS1AV+gp9Mp2sAAPri6c0Zs3CX9wwlO5gFbfLQOWuaUpRnkPVj+AUnw1HHw2MDEuEKWYwSBoA+3xEQLYWl94nsdW2bDzJxCYhD6qsr96LH06AGmSdbY3Gu8WdizdnaUcS4i54JvcdEXwwcrfrZL++LxsMBeS5drllkWsiIudR3F2Z/YUfzVM3+t3RSpLKdDOAXWAjYtza53wcaoriLnLRGLC1KwImbkpBOzpl9oyIQIVgaNeAPRrUHppUepoRgGKmrtSY58KB4X4UJNUjE1wlcAJrXJ0oPTZbSJecz2qtO1OKLIi2nD4JLSEtcsyoyBHCaV1FgE3Uj2m9MRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e53JyH8A/fnDNi8zN3PRjRibeHYRW5mkb8V0Om9WIk=;
 b=FyO0lXqldntCob7Hm8jgoJhZ1LK/1VeYFrnzjO3+iTwSyUKH2sa0coAw7LXxiSOq22jSGcHVBlTwA5k9ZvFbUAElU/GX3EA/R6oaCvGjXt/cbU6mSqgn/cCNitH0SIAOrgWi9XkN20UcHXROnJYvN6pFgp1bTtLe2gWYdd00rfgaMcUMYLvU9IJQiKbM+yc6LwZpaC3fpla1ERkeNFUPrzrazB4a299APjHHnyVMdYoTjUdI83bag6O/4b4uwdHC6d1elWDqiTeTp8p4fq1sG+kVZ2dxHWklzEQlcOYaLEYlXgZXsRcBJj5Qe4oZQYIPye7TuqxJWhdqUgny1an5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e53JyH8A/fnDNi8zN3PRjRibeHYRW5mkb8V0Om9WIk=;
 b=c3+/5yqks6cNVj3EgP5jGMyq1O9FE4fucNbdtpKuOXAVw97eOvlaFDEB/2q71rCnOn/p+lAWOwimyyJPh0ijDQvcHU/ll3HWgUKMaB2sCbJZAzqiNnlAKupdhwMPNNRfUgyOebHhWnYrzTeQVovUIJ+HGkfT3HvEuTaefNMAX4M=
Received: from SJ0PR03CA0347.namprd03.prod.outlook.com (2603:10b6:a03:39c::22)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 21:24:38 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::dd) by SJ0PR03CA0347.outlook.office365.com
 (2603:10b6:a03:39c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Wed,
 11 Jun 2025 21:24:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:24:37 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:24:34 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable io_alloc feature
Date: Wed, 11 Jun 2025 16:23:30 -0500
Message-ID: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749677012.git.babu.moger@amd.com>
References: <cover.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|PH0PR12MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cf3ec0-34c9-4475-651d-08dda92e5eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?429xKJCTpFlViQ1mjvJ9VBHVb20XfPF3ycz0MyAYhiLeFvDjCldyKQD3mcE1?=
 =?us-ascii?Q?PQiBCimSrMh7JWO6Jgip8t03qft9Mu5Q5Bj8k18V0xlBX72h+L3dI+DHZElF?=
 =?us-ascii?Q?vChK9W5Tx5AaiPkWWmJnL0qZDjdiwTVqXqu6yJyVX6kfR1ZeezopPAJY4Ewv?=
 =?us-ascii?Q?+lx2xTqfoczAQ5/qHQKjfgVKcyeVH7KVgXfuM6e1hQOss9/oEjpwBn2xzqFW?=
 =?us-ascii?Q?pEeFmdsqnEJRInRV4gjaXgna5ACuNtOwsw5GDkpgPZ4eaV5hL8G25ZmkOb68?=
 =?us-ascii?Q?lUBmeLCnmNNg2hnd3wCt9L5aqrwfvY24a3w9fjz54+J01IsS/hjtCyF0zz58?=
 =?us-ascii?Q?njyjCNOYAqv4ywQ2X/rdkRKDOIgJ4oofsS742J9MY8okbdPDHUKseF2+ER5c?=
 =?us-ascii?Q?6vGHZGNDoXrw2EXi7XLKoLDZBMEId4hn6PIUgb5iUm+y3cWliJMSqfKCZa+E?=
 =?us-ascii?Q?dFpHi0UboWzeg0QPc2fRUjf5x57N8td0Q7D7wIKGm07JytV0n4yNblwSLq3w?=
 =?us-ascii?Q?GfRqNvyZilQ4aDFW3K33RGZPbv75+GkbuVtnmrYuEUqFlsiNjAlD7gzbKZzZ?=
 =?us-ascii?Q?7NAZ74VSX3ZZly/IqqwTwNBP1J9ac050wbQHOPIyb2SJ2EgW+68aFyPYPcz5?=
 =?us-ascii?Q?of52UrKXOs2TR6kWVTQ7OrphQBuLif2GeYh9lQaaVILoSz+emleW/z8LJ/mx?=
 =?us-ascii?Q?4oPXktiUA9wwewgaX0VU4PjJd9j7zr09wsEX6tgUKgvRkoWdwJrn2gLt7JFa?=
 =?us-ascii?Q?mTfz3xojXvBiTekXeiN4Cq2nEdyawkt3+Qa6AogtCjlLRBqQhWnBoIDvbvFV?=
 =?us-ascii?Q?rvQCWSY3ZVMTuIAfiNbUw0yfLF01j6UV8mZfxc7I85jyJqo2J3kZpX4lFM+j?=
 =?us-ascii?Q?Qau7ieLST5gHF0sWIKY3hXa9bijfq30LajSyNaNBFFbqsJUU2nguZ5EDO5yv?=
 =?us-ascii?Q?sdqRGB1/qK3f0hZn4EgLS3Mu8IuTonjc6txqOxuC+vukplty2VyHa6OqOW5T?=
 =?us-ascii?Q?cUOfqsfZMgNRwhikU3XuapkOS2gtrJFHTQWtN1qB/LUxKSY1oHHE8JdorAVI?=
 =?us-ascii?Q?YeIKA0gPN6wlmQnuMIfHrXwY+HO4V/n4p3EzBURTyMb0DtueDhUgtNXsLhbX?=
 =?us-ascii?Q?BIbVjNRZTulfIzZ3bcg/Alz+urMagSBCBnYCccXmlHsAdUbx27CAaMk59vJ0?=
 =?us-ascii?Q?sbk0CBKtiLOGgJBEeYWZn9PzsHCzVFZyOwhTK3LSPHsta7Q5vliaJtXwwK5J?=
 =?us-ascii?Q?XQ4qPjeuK6wOcNHmtl0lrhZ/svfc0fwYFzd8uMe+pHmUQwZPxYnoNhjkXHB3?=
 =?us-ascii?Q?K+tth5zUNtsDV3YTYxWGYaBjJmV8JKhDAKBpOYkfxJvts7PYtOWLDciQJshO?=
 =?us-ascii?Q?r+sV2uo7cDS4JbMzXSwGXAUBSyIcBLVDlo0KbOvVkU25CS9vi1Jvt2REwmqq?=
 =?us-ascii?Q?rzfpSpR0dOwuYy6jif8SE9EMTwCAvgQ6+AIP+XWijNS2vabQCvHyUs9QsR7+?=
 =?us-ascii?Q?Y3ReCNvuQROK9qQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:24:37.7747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cf3ec0-34c9-4475-651d-08dda92e5eb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098

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
v6: Changed the subject to fs/resctrl:

v5: Resolved conflicts due to recent resctrl FS/ARCH code restructure.
    Used rdt_kn_name to get the rdtgroup name instead of accesssing it directly
    while printing group name used by the io_alloc_closid.

    Updated bit_usage to reflect the io_alloc CBM as discussed in the thread:
    https://lore.kernel.org/lkml/3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com/
    Modified rdt_bit_usage_show() to read io_alloc_cbm in hw_shareable, ensuring
    that bit_usage accurately represents the CBMs.

    Updated the code to modify io_alloc either with L3CODE or L3DATA.
    https://lore.kernel.org/lkml/c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com/

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
 Documentation/filesystems/resctrl.rst |  34 ++++
 fs/resctrl/rdtgroup.c                 | 216 +++++++++++++++++++++++++-
 2 files changed, 248 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index c7949dd44f2f..03c829b2c276 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
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
+		The interface provides a means to query the status of the feature.
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
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 1beb124e25f6..bbc032b4d0e9 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -70,6 +70,7 @@ static struct seq_buf last_cmd_status;
 static char last_cmd_status_buf[512];
 
 static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
+static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
 
 static void rdtgroup_destroy_root(void);
 
@@ -232,6 +233,19 @@ bool closid_allocated(unsigned int closid)
 	return !test_bit(closid, closid_free_map);
 }
 
+static int resctrl_io_alloc_closid_alloc(u32 io_alloc_closid)
+{
+	if (__test_and_clear_bit(io_alloc_closid, closid_free_map))
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
  * rdtgroup_mode_by_closid - Return mode of resource group with closid
  * @closid: closid if the resource group
@@ -1030,6 +1044,29 @@ static int rdt_shareable_bits_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/*
+ * resctrl_io_alloc_closid_get - io_alloc feature uses max CLOSID to route
+ * the IO traffic. Get the max CLOSID and verify if the CLOSID is available.
+ *
+ * The total number of CLOSIDs is determined in closid_init(),  based on the
+ * minimum supported across all resources. If CDP (Code Data Prioritization)
+ * is enabled, the number of CLOSIDs is halved. The final value is returned
+ * by closids_supported(). Make sure this value aligns with the maximum
+ * CLOSID supported by the respective resource.
+ */
+static int resctrl_io_alloc_closid_get(struct rdt_resource *r)
+{
+	int num_closids = closids_supported();
+
+	if (resctrl_arch_get_cdp_enabled(r->rid))
+		num_closids *= 2;
+
+	if (num_closids != resctrl_arch_get_num_closid(r))
+		return -ENOSPC;
+
+	return closids_supported() - 1;
+}
+
 /*
  * rdt_bit_usage_show - Display current usage of resources
  *
@@ -1058,20 +1095,23 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
 	struct rdt_ctrl_domain *dom;
 	int i, hwb, swb, excl, psl;
 	enum rdtgrp_mode mode;
+	int io_alloc_closid;
 	bool sep = false;
 	u32 ctrl_val;
 
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
-	hw_shareable = r->cache.shareable_bits;
 	list_for_each_entry(dom, &r->ctrl_domains, hdr.list) {
 		if (sep)
 			seq_putc(seq, ';');
+		hw_shareable = r->cache.shareable_bits;
 		sw_shareable = 0;
 		exclusive = 0;
 		seq_printf(seq, "%d=", dom->hdr.id);
 		for (i = 0; i < closids_supported(); i++) {
-			if (!closid_allocated(i))
+			if (!closid_allocated(i) ||
+			    (resctrl_arch_get_io_alloc_enabled(r) &&
+			     i == resctrl_io_alloc_closid_get(r)))
 				continue;
 			ctrl_val = resctrl_arch_get_config(r, dom, i,
 							   s->conf_type);
@@ -1099,6 +1139,24 @@ static int rdt_bit_usage_show(struct kernfs_open_file *of,
 				break;
 			}
 		}
+
+		/*
+		 * When the "io_alloc" feature is enabled, a portion of the
+		 * cache is reserved for shared use between hardware and software.
+		 */
+		if (resctrl_arch_get_io_alloc_enabled(r)) {
+			io_alloc_closid = resctrl_io_alloc_closid_get(r);
+			if (resctrl_arch_get_cdp_enabled(r->rid))
+				ctrl_val = resctrl_arch_get_config(r, dom,
+								   io_alloc_closid,
+								   CDP_CODE);
+			else
+				ctrl_val = resctrl_arch_get_config(r, dom,
+								   io_alloc_closid,
+								   CDP_NONE);
+			hw_shareable |= ctrl_val;
+		}
+
 		for (i = r->cache.cbm_len - 1; i >= 0; i--) {
 			pseudo_locked = dom->plr ? dom->plr->cbm : 0;
 			hwb = test_bit(i, &hw_shareable);
@@ -1803,6 +1861,142 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static int resctrl_io_alloc_show(struct kernfs_open_file *of,
+				 struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = s->res;
+
+	if (r->cache.io_alloc_capable) {
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
+			return rdt_kn_name(rdtgrp->kn);
+	}
+
+	return NULL;
+}
+
+/*
+ * When CDP is enabled, io_alloc directs traffic using the highest CLOSID
+ * linked to an L3CODE resource. Although CBMs can be accessed through
+ * either L3CODE or L3DATA resources, any updates to the schemata must
+ * always be performed on L3CODE.
+ */
+static struct resctrl_schema *resctrl_schema_io_alloc(struct resctrl_schema *s)
+{
+	struct resctrl_schema *schema;
+
+	if (s->conf_type == CDP_DATA) {
+		list_for_each_entry(schema, &resctrl_schema_all, list) {
+			if (schema->conf_type == CDP_CODE)
+				return schema;
+		}
+	}
+
+	return s;
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
+	if (!r->cache.io_alloc_capable) {
+		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
+		ret = -ENODEV;
+		goto out_io_alloc;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r);
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
+			ret = resctrl_io_alloc_init_cat(r, resctrl_schema_io_alloc(s),
+							io_alloc_closid);
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
@@ -1955,6 +2149,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdtgroup_schemata_show,
 		.fflags		= RFTYPE_CTRL_BASE,
 	},
+	{
+		.name           = "io_alloc",
+		.mode           = 0644,
+		.kf_ops         = &rdtgroup_kf_single_ops,
+		.seq_show       = resctrl_io_alloc_show,
+		.write          = resctrl_io_alloc_write,
+	},
 	{
 		.name		= "mba_MBps_event",
 		.mode		= 0644,
@@ -2062,6 +2263,15 @@ static void thread_throttle_mode_init(void)
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
@@ -4249,6 +4459,8 @@ int resctrl_init(void)
 
 	thread_throttle_mode_init();
 
+	io_alloc_init();
+
 	ret = resctrl_mon_resource_init();
 	if (ret)
 		return ret;
-- 
2.34.1

