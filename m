Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83F244667;
	Wed, 11 Jun 2025 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677121; cv=fail; b=MGrVpdX4jk0mbaqfB2e5pg3PnwL88H49QnKWEnhhxTpzvtwCxET3uBHhMbN1axYlIL2Uc+egUv4Vmm+fSK3CmNlUrwI/7+3sjO7hbm9NZVwFPW4GQifKYMUMxGCo/szqmanWVaZjiQYCnjbzJzi/Dk9/sGl05tbZIXOSfDIKw+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677121; c=relaxed/simple;
	bh=Jsa4HbK4S6FURQbRN/ne9XaHlbZsmdM/c5YYbi4h/0k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saGSwCOc/0kpxi+azr/IL4WX2WFS6BVSKVbVpgdzwOnO66q4wsaufzgf+vSqgadGuCMcgHepxX+G6uD5iqvaVmcYr3KTPkOKrx4+G7NbNTOwq9IM8RNhTh/sgl0yvCRWIMFmq7uHKa/MAuihISQextalhrZjFdCgkBwVBLhG3D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=suAyCSXX; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="suAyCSXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lef/KEc9wLkDF2GT22xY9+v9cgluRzcbJUABQq20wgNk6TJ4DQAJuxcyM3rN5W0sAL7fTVj7EeaDVfSwsb9jVe2y3bqPFZg9GpP97usrQBYg4SHPwvACa//tYBKDZIh6OE+HKaQcGCkCJBJQztHTBxNM/T1x7XRVvgwOyiMDOX+WXVPA6OCIBCtDtNzgVxqYMZ/WHUTPPw5zB2BwE+Vh1i4MOv9gbf4DR+HtCcWorjF+KO0fJ6k21Lr16Jk+3DSVOSZ39YUkOF/wAcGpymC6ddrYFOx2ZGj1Zn5Xa5RYzpbK96BDK7OU1OGjhoboYWFmBRd6O89nwsi77lJpxklheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoqNfEXCQvOFMsyE29PDc+vGXUGybL1Tiw2FUfG1Ae8=;
 b=bbOTVrSZauk2FhdDsQNRJ7kXK/jcEvmAbdYnxC96V1E6dRHiMLVGVwzchXqtLK7DiRHdVb8nQRj291vMpoMhX2VBjI3PTGBFTppl5lVnXNsNvIA0adrD9YJVAIweUykvWpJxF6G1XyMlXeVWOUr49xdGBbCWls3s6eBSXLrT/j7ErkucEP21S+Aw1hqHs2Dqol9TG3L6yDRAVeqtqZdLVyysT4OrbEBxDbK4oAChwYeRbjOaaS6nqYLe6CPU7uMNnmzlsMSaUz6z539rgQnez3GbCo9X25F9W5yoo0Pd/y9EkgmNNylGYiFm79PMfOIO2pYEpuRTgPulwzg/s2yPWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoqNfEXCQvOFMsyE29PDc+vGXUGybL1Tiw2FUfG1Ae8=;
 b=suAyCSXXShTV5Fui9R5YbWH3KYbRxbZqCqn0WpCJKOmkPe3YSRzSqRR4JtSAg7SJi3UQ9hHJ7Lwm0l+PadKJa/mLVaaflLILmm0j5vY0buImS7dUcAefZp2Br55kA3j8QkfUxDGL5dJVJ17r0wFD9CgBWVKI0RF2FmbliBiKn6g=
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 21:25:11 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:87:cafe::5) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 21:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:25:10 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:25:03 -0500
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
Subject: [PATCH v6 8/8] fs/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks
Date: Wed, 11 Jun 2025 16:23:33 -0500
Message-ID: <6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: a8324ddb-3d63-42b3-d4e6-08dda92e726c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0tQ3xPkvsVAD1u60ssN8KLuioknvUhYz2/g9eb4B5z62noPSFYJAH6vljF6C?=
 =?us-ascii?Q?BFZOxl9e4qcky1R3gzXo7fQpIogqqL4cTrHVf1zzhzmfleniO4G3ZaKk5lf0?=
 =?us-ascii?Q?6jCzvhzpF7WTttPdPQVhiclTpfj16Dn/y2Pd9n2zQtH3o6he2StDYau66uGW?=
 =?us-ascii?Q?M4BSlK1Uf4EO/N3qyZF7ZXV0CXmjTbg0O/4n6XHOKApZxSJ97CotW9QHcSL1?=
 =?us-ascii?Q?Z75s/glj/TLV53ggKhkg91sLN/wiIJepABBlt5gzn1Naxt7zFU22KDHnK7ZJ?=
 =?us-ascii?Q?ylRTDbwMxXN3AyTrqi4qzNABrElSwEJmfcPi2uyiub+76rChH8DnlnAjNDSK?=
 =?us-ascii?Q?KIC/urIlGp0sWsIFm/VqU8V46ssX546Cm0eZIuZavftXwfY5AT0nSlIbFWs2?=
 =?us-ascii?Q?YJvvKBdT24+GA5pGYhavKtB0SyhQGOLHODNOqSnkPbw2/CWrLsZboSLGa+xH?=
 =?us-ascii?Q?iYx/D/l5z/niCD450hyiiEqCNbdgnxlrooo8lZ0UWymEVuCgGZREv2TpY7Ze?=
 =?us-ascii?Q?Nx5irSuWmTAW/BZK9DNQLRjDNEU5g0poLmxVyIxTpWjfE21K3seHTLFTQM/J?=
 =?us-ascii?Q?WesqdnOOPb6GQfokLFJsStOX3BrYY0f4wgSyKqW4YlC6W+SxfXKwWi/M/5Sw?=
 =?us-ascii?Q?wAGcnB+n0nFoILHqg/HiW3gZN97jsKuTKswcGrD2CN2qXBuKZprCfSkJ1Pau?=
 =?us-ascii?Q?KAUN4kzc4iT1v8XI5zKPBDU1R7IS68lh4rFYzMDGONNMXVuAb4bjQPe9zPk9?=
 =?us-ascii?Q?0D/I4ofUIjXI0PuSf9ZXW+r492x7yWvQMHcTxmfzdsrf6DlPUV/5qYVAssAV?=
 =?us-ascii?Q?jKPAAic71BecQdZA4opTUMk52i1mFKnSXtUoUXeGvSzbqW/WnNR7b6/OS4RN?=
 =?us-ascii?Q?GIZbQSit6EmUJip+p0fpCq3CTjp6EyEjt0QUKx8cXqBa+LQo33Xb6vSlxtXw?=
 =?us-ascii?Q?nK6E+1T4lFswKIGP6XE7qy506eYe5e9yKiTeMt3fSA+yoLQqpUGoIuajv0Ml?=
 =?us-ascii?Q?eolYLI5tLaTMofyTltPlSPHQFoNfdLa4hHHZ2PbegIIkZPm27jzQLrJc2ZgF?=
 =?us-ascii?Q?UUGX2LvDrOPve7OCsD50ANDFWe1jBG1Nlzo0l/V2seXHagGXFbqzt+PUzC8i?=
 =?us-ascii?Q?NdDnvb0f+gh8s9CMqE/llb2s8QHXFbRgi/bfHtQ8CtrGK9LUGwM76oTXWaxh?=
 =?us-ascii?Q?tEq/T/k21glDwuDuQRhZYBnl4JUhjYWPyyBv+G7GzwC9U3mc9JtBJdSp6NHi?=
 =?us-ascii?Q?QWKa9kbPyOp0I6rHVZkZb2uxxoUp9GjNQAd+tYodG4T60s76kUNMi9BHrCy6?=
 =?us-ascii?Q?nkbyOUeYrfMXv2SJWO3lfickdBuNdnR5rtRuZ9PTDuGiaLgtmQHX+8mX0rhi?=
 =?us-ascii?Q?xbOA4IARJrb/sYJJeNoDWwdRgkXsbpIHhHoBO+FTcNjFHGHRslPYyvX7InDQ?=
 =?us-ascii?Q?UTrvyae3h/6IBlAD63tMYmA4YNZDdqqOy2rvQL20N8IObNWdaV7ZU/3XUXMV?=
 =?us-ascii?Q?DJKkklGSXMLino1Rb8ofVgnxshDLHzRT0KaJ+JOekZkoPoYQdAsdwYyZRQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:25:10.8539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8324ddb-3d63-42b3-d4e6-08dda92e726c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184

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
v6: Updated the user doc restctr.doc for minor texts.
    Changed the subject to fs/resctrl.

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
 Documentation/filesystems/resctrl.rst | 13 ++++
 fs/resctrl/ctrlmondata.c              |  4 +-
 fs/resctrl/internal.h                 |  2 +
 fs/resctrl/rdtgroup.c                 | 89 ++++++++++++++++++++++++++-
 4 files changed, 105 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b31748ec8c61..ae1157dcb4a3 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -181,6 +181,19 @@ related to allocation:
 			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
 			0=ffff;1=ffff
 
+		CBM can be configured by writing to the interface.
+
+		Example::
+
+			# echo 1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
+			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
+			0=ffff;1=00ff
+
+		When CDP is enabled, io_alloc directs traffic using the highest CLOSID
+		linked to an L3CODE resource. Although CBMs can be accessed through
+		either L3CODE or L3DATA resources, any updates to the schemata are
+		always routed through L3CODE.
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
index 0c2d2cf4baa1..f6c44fae4b72 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2037,6 +2037,92 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
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
@@ -2198,9 +2284,10 @@ static struct rftype res_common_files[] = {
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

