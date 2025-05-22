Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2065.outbound.protection.outlook.com [40.107.95.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7612BFC6F;
	Thu, 22 May 2025 19:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943604; cv=fail; b=XU0y7qbvYXDhHQqUaf4oNRMBp+BUx3fhr0GXQnnh7LsUJoePSnmsVBlBMjxLRDlF/UqBSbcVfNtRkDXvEm9dx98bFPfx2wXb4OMyeVvgtg2/TgO7FGSdzmvAVlrzlg3GUtixhuHWjksILPC1058aHJhKx4bcDTUh9EZhb/t93BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943604; c=relaxed/simple;
	bh=XtfIkAbRkRt7ylobprpx8LAzYsEwIfVgDPZVEdgiR8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wz1fj/7mZhUwauLNea3Tj2aibt7WyqZdSJkfBGi7/fBffkTiUxOrFu/dISZ/kXhTOj8qf3SGawbLCZJMZ7a+DDnS9pYHjRM8Ztp1hAYvZHx42w1UW45H1lRjV6GhC5z7IOMJTp++8+H6Kytxv8bGVq0xTIb717SeNcENh8J47LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xkrpSx8h; arc=fail smtp.client-ip=40.107.95.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xkrpSx8h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFCKXvcLtWdixWhjFMhSiMkEuzU360q0ZVG4WxwwFLAqKBELcR+sicAmqUyEeLZ+2W4NgogEain1v+3TbD03yIaOSiGUnC12psyFVbyrLqw1rTzwApGSutYkXFQSrakrAn03Yw4M9UQZsKkvq4mAdMLk6i4XB7ThuxLQF64LNPAVG/PzRas7QEQ+1vpka/xZ4Zw5E2gxNkE6F4j+rtYgncwjvsLk79GICMYAd8XgP2pJGVhYUP9YTtun0SH43998JwPKzKRWf94AEM+C/moplkiwsYPVHL0sDXRV6mAcXjra033g0TkrGzr2bjy1x8oqOnh/0LTwQNgrGV5hbreBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSFZVyoWIYTnBfq/Zhfku9nPlqIVW2fwoE6qiTxk+2E=;
 b=ebY4GQAraRPAk3aIeIZo17yjML53rHalqxM2c9foAYSC+0f22AMawrUIucDWZNWC4UyP8DuwVGqg64t8bW3zN2aqAwyba3IqWwLINrC7AACE/PwA++LPfHLdbUiWo9tkXO0wOXlWnRMI6EEYAkbItdyrAljGs3APZuGwpkzac6V89J0OUpHIndO1ie64vjvv+cZ+b/F15uIEg1JmcMKzQ/eOrPK7o8GVHMNEoigQL5sh06ymJjbwgmuRFkuK5UWcUErQd4uJq3FVtIuIv6d4An43mWo9vvPlqpeKKfZbKO2waHU1NwNeSIwVuQccaRvTHmr0GMqcvwNReG3bKMiQGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSFZVyoWIYTnBfq/Zhfku9nPlqIVW2fwoE6qiTxk+2E=;
 b=xkrpSx8h/vK2ab7Tnz4c6VgIapM3u8/vnWJWHQMgqFJXmY5lUnCT1vS5s/j/2duUY+wRKepxrToca5q03nnJnn3NjCWCwC/uDI8il7FffvNj19N3RFVIBSmjgJ+PeRixfxrjeBppH2R5tbG/sNHQJlvKLlaJ03DrxMaZDTKyzn4=
Received: from SJ0PR13CA0204.namprd13.prod.outlook.com (2603:10b6:a03:2c3::29)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 19:53:20 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::19) by SJ0PR13CA0204.outlook.office365.com
 (2603:10b6:a03:2c3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 19:53:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:53:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:53:15 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <thomas.lendacky@amd.com>,
	<seanjc@google.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <nikunj@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <babu.moger@amd.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 8/8] x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks
Date: Thu, 22 May 2025 14:51:39 -0500
Message-ID: <ad6ee3076967940e9a173c595ec5db6725d93846.1747943499.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747943499.git.babu.moger@amd.com>
References: <cover.1747943499.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: b576d57e-d1ea-4c3d-ab9b-08dd996a4c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KBjzvAZBZQyZ/Rh4JvOg/ar2RfPqDNgJBwNfsBzTauolMxsQVBN4sVSRB5xo?=
 =?us-ascii?Q?HtOfbRcOvVA4q5jtRwXS/bw08tNJuYpFm6toluddIEYiZEu/m/uMI1yBefOu?=
 =?us-ascii?Q?SHlJCyGVH7l3Ao53BL82Z1nf7NvFeSHQhixLFVHCd/eq4gTIqtPf4iTWCilF?=
 =?us-ascii?Q?3sbN5TkSboXwsJh7v3fsgplDYNJha6qljuI2mzi+7drR2mI4MVcTDs481pP7?=
 =?us-ascii?Q?jSHZPmcxyq2KAFo1TKS71XKRZhYMj1s/ld7r5bi43Zq8TzMrMUAQP3RvyOyv?=
 =?us-ascii?Q?a6s3BjFeFVKOrc110hpBPV7ywOobluFHbqvN2AEeWKLglE4dwLjQVmSi323M?=
 =?us-ascii?Q?e50kxcrXOIZVDfvmEuzyKlsWVoOUfx6/LtU0eeTLAsTZY7kyQBojWOfV7qec?=
 =?us-ascii?Q?ppKJbunk8aPayuleUWV2+GR/q78WVSLnGA+4eJcn9xqZCZmo2gKqERBp8uDL?=
 =?us-ascii?Q?7MAEmWm8ONIKlYSstrAg16YS4OOZtBoBNYabLEVaHsmdfUvk37P9zJxtSmvB?=
 =?us-ascii?Q?XNB6WdbdZIX3WCWj8+C27XnXBcfT5+OM0lXHKY3dDAsZWD1141I3f+OV1QtW?=
 =?us-ascii?Q?tLVNtnKd6DbqW5QhD9FlepiCIBUhrnrR691RUCT3tmEm+FKIoQ025vhWCGbO?=
 =?us-ascii?Q?9d76Ms7/0lVALMl74fPrXLz51mJprCDeEN5dzswLTXiJsjiMAIhCJkyyL3pZ?=
 =?us-ascii?Q?JJCLiXXTUYPfB9r/xFsXwgruZDl5WiwXQTPPRX3XLW/tIjFC6yYgzpzsORrz?=
 =?us-ascii?Q?1ZzsmHFsK5KUw9VkOORMp018FCRy3ttWhJYINWDPqXPPm8qb+HZ8FSwS6nRo?=
 =?us-ascii?Q?V50tTllSUgna/CTkBVSgLBNm7rnO4IXDCyGvZCePpSKL43gHbO9PzRDKjVQo?=
 =?us-ascii?Q?RLNzgn9Q3hwtfbkpTIQhtWJmWZafKaTkYVXjhNjZGZl2ROg3HEBhdVNrQkZ9?=
 =?us-ascii?Q?AyejtaHuaamu3Guam/PH6/U8gsm03fTN7ZvEhY1Fg0tUZmu7fTzISjkgBdCM?=
 =?us-ascii?Q?D0GvrTByN6BtNPGmoS0VKVIkWoOlA6L3CXitOQ/idBre5TlXa/URWsZjgP4W?=
 =?us-ascii?Q?tBYjYaqRnpgodJee4x7oL/H+H/PEkHDIRY9miwjhFCscK50SQvlYO3CTy25T?=
 =?us-ascii?Q?cR5FGB5MSKZ977TkCLmvYJrP428CBVydKkWNe+QGGu5GUT2ZE9eVSYXFwfGd?=
 =?us-ascii?Q?8GlbfANkUmNwFEyOoPIedSeYhA2lYK7ADQPCvX1M52bqeTA1rfBYv7ybBfGc?=
 =?us-ascii?Q?hTpcLN5U8GqVAfBzILs66oMyILjefzFuBDcOvWXWHfRi7CVMDkL9YU1f93jQ?=
 =?us-ascii?Q?wGK+mBjOx/SCf5enRc21ESO64IvB/CHOKhYQ0hZSYPE7QweO1gWQNZV5sAVL?=
 =?us-ascii?Q?+WZ1n0Jpw+HgeExm/E51KD16IYwvvFBMR4lAT9Z8/F3WkjsJhIG/2PX9wRqN?=
 =?us-ascii?Q?AGOvYwJNVloEJ/m7qRTwGk2+JeLznwbVxQAQS5jILU3hxqoYjzJfdyyfnJn6?=
 =?us-ascii?Q?M7L2gh3qLLKVUnBSxkfynwszISN7+l8PswfI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:53:18.4828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b576d57e-d1ea-4c3d-ab9b-08dd996a4c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259

"io_alloc" feature is a mechanism that enables direct insertion of data
from I/O devices into the L3 cache. By directly caching data from I/O
devices rather than first storing the I/O data in DRAM, it reduces the
demands on DRAM bandwidth and reduces latency to the processor consuming
the I/O data.

"io_alloc" feature uses the highest CLOSID to route the traffic from I/O
devices. Provide the interface to modify io_alloc CBMs (Capacity Bit Mask)
when feature is enabled.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Changes due to FS/ARCH code restructure. The files monitor.c/rdtgroup.c
    have been split between FS and ARCH directories.
    Changed the code to access the CBMs via either L3CODE or L3DATA resources.

v4: Removed resctrl_io_alloc_parse_cbm and called parse_cbm() directly.

v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
    and resctrl_io_alloc_closid_get().
    Taken care of handling the CBM update when CDP is enabled.
    Updated the commit log to make it generic.

v2: Added more generic text in documentation.
---
 Documentation/filesystems/resctrl.rst | 23 +++++++
 fs/resctrl/ctrlmondata.c              |  4 +-
 fs/resctrl/internal.h                 |  2 +
 fs/resctrl/rdtgroup.c                 | 89 ++++++++++++++++++++++++++-
 4 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 5594422f133f..59697c99a22e 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -169,6 +169,29 @@ related to allocation:
 		When CDP is enabled, io_alloc routes I/O traffic using the highest
 		CLOSID allocated for the instruction cache (L3CODE).
 
+"io_alloc_cbm":
+		Capacity Bit Masks (CBMs) available to supported IO devices which
+		can directly insert cache lines in L3 which can help to reduce the
+		latency. CBM can be configured by writing to the interface in the
+		following format::
+
+			<resource_name>:<cache_id0>=<cbm>;<cache_id1>=<cbm>;...
+
+		Example::
+
+			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
+			L3:0=ffff;1=ffff
+
+			# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
+			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
+			L3:0=ffff;1=00ff
+
+		When CDP is enabled, io_alloc directs traffic using the highest CLOSID
+		linked to an L3CODE resource. Although CBMs can be accessed through
+		either L3CODE or L3DATA resources, any updates to the schemata are
+		always routed through L3CODE.
+
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 6409637b4de6..f3e5e697945c 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -148,8 +148,8 @@ static bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
  * Read one cache bit mask (hex). Check that it is valid for the current
  * resource type.
  */
-static int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
-		     struct rdt_ctrl_domain *d)
+int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
+	      struct rdt_ctrl_domain *d)
 {
 	enum rdtgrp_mode mode = data->mode;
 	struct resctrl_staged_config *cfg;
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 10a3188ffa54..755f23934295 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -382,6 +382,8 @@ bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
 void show_doms(struct seq_file *s, struct resctrl_schema *schema,
 	       char *name, int closid);
+int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
+	      struct rdt_ctrl_domain *d);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9277b9c146bd..b84fee51c57d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2035,6 +2035,92 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
+				       struct resctrl_schema *s, u32 closid)
+{
+	struct rdt_parse_data data;
+	struct rdt_ctrl_domain *d;
+	char *dom = NULL, *id;
+	unsigned long dom_id;
+
+next:
+	if (!line || line[0] == '\0')
+		return 0;
+
+	dom = strsep(&line, ";");
+	id = strsep(&dom, "=");
+	if (!dom || kstrtoul(id, 10, &dom_id)) {
+		rdt_last_cmd_puts("Missing '=' or non-numeric domain\n");
+		return -EINVAL;
+	}
+
+	dom = strim(dom);
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
+		if (d->hdr.id == dom_id) {
+			data.buf = dom;
+			data.mode = RDT_MODE_SHAREABLE;
+			data.closid = closid;
+			if (parse_cbm(&data, s, d))
+				return -EINVAL;
+			goto next;
+		}
+	}
+	return -EINVAL;
+}
+
+static ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of,
+					  char *buf, size_t nbytes, loff_t off)
+{
+	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	int ret = 0;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	if (!r->cache.io_alloc_capable) {
+		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
+		return -EINVAL;
+	}
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+	rdt_staged_configs_clear();
+
+	if (!resctrl_arch_get_io_alloc_enabled(r)) {
+		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r);
+	if (io_alloc_closid < 0) {
+		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	ret = resctrl_io_alloc_parse_line(buf, r, resctrl_schema_io_alloc(s),
+					  io_alloc_closid);
+	if (ret)
+		goto cbm_write_out;
+
+	ret = resctrl_arch_update_domains(r, io_alloc_closid);
+
+cbm_write_out:
+	rdt_staged_configs_clear();
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2196,9 +2282,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "io_alloc_cbm",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_io_alloc_cbm_show,
+		.write		= resctrl_io_alloc_cbm_write,
 	},
 	{
 		.name		= "mba_MBps_event",
-- 
2.34.1

