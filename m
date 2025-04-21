Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8322B8B3;
	Mon, 21 Apr 2025 22:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275522; cv=fail; b=EJrUPgYlXD6xROURYPNzui5NErITBEPIq9V3c/v03Iy30GRCkSWGeBFnvRnTi4S72HWaq2/uDhSLfvGWZQAwvgeIbamVwyK/RmDxCwsFUyJjt/8SMST6QJnZl0E6bqFi22n4J40F5Kp9xNqkuvnCfyZn5oT9otASayWl636yMRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275522; c=relaxed/simple;
	bh=dRMt3ZopNq3lEtpQVfuEyBn6idXRnWriHozzerhhKrY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4HTP3huWA0RbrpX+Wye4qIikYK5eU/wJsxkikqUBs27TYITxDRcfI4FjJG+ABpqf5oA3h9cSe3tjjv46BmRITRLWki6zeHjR4Giepy/BKW51nMBdrzG0zryhGvTUqlqXNbr/APLekR2E5oMvF59Ieu8jWmQs3zEArybP2dpt+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Dh6IqVti; arc=fail smtp.client-ip=40.107.243.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Dh6IqVti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJIE3R5d2LESkYtmvw2X9cTEfSg18aMhxDPC+/F1xUrwMlNLOeiIxYq5iQh68HdVSOpX4SgZl6nrFDflNGxvuSH1BwpAdwXAFSo1qciO7YEwUxaEgS4J08Hn0Zlg1l6LfuipGzBEZHNNbkeJRjTYgg7pEyaOm0dK/cc/4LqvTC7I58IJVLzBa63mh9fGhQueGWMxGeRvXxgHQDB8ddrZwPfAI+x4wJhCDacPrl3Zgj8dxYLkWrXKmEntZyCgyRqx+89TWOQSFlYudfn+l7hoNTD/0if6IPoek6PA/mmyRPmgFmYbXBXc19EnQFF9lkaxHKR4UjBglsr8nepH6etjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZSOCnsRJxwAkEJm225sPS5SExvd7Tm4rMZ7/+S4EcQ=;
 b=dzBim2qRNo9+h790z7A3orE3rKKJy4zREyvX7OzDJ0JMJKXtyf9tO5M6H0MH8BXybMy0PooELOn4ujIFUIBDcGU5nAmNOzDmsb5hSdYHbyUBAYbbyMAx5iqtkNewOqvS63SA/+Xm0lsV0j90a7F0UZg6gIUMJWNitV+w86Usxa1eh01pGLKO8J+Y3L30a+0wqO0K3g1nyYXa05Uqg4Gtxb2cJTPphDHcAgNiyiTgX4sRrZKheAsQSAkoXUlJq87fqejn+DNuNh8Fr7aXJKLxQgGWlgPwtqQkQx4aTL8T/8Jr7V6LFymA1dETrLthpJqC/jR4YtnLX40piwhs4dgACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZSOCnsRJxwAkEJm225sPS5SExvd7Tm4rMZ7/+S4EcQ=;
 b=Dh6IqVtiwKnb/XjZKBxbDpb28MPB2+Fb/90XB8+xHntmzPLpUXTsc0g3jcRowdbnsXMad/DiG5Qm0bI20RxjQhoC3aAm+RQUrJKHzIWraZnoQSv0VUY1SgVTjuHKH3YG9jdqRJuyP30GdkgHcn8hVuGECGp1jXec4MA8+xNFBjk=
Received: from BN8PR04CA0060.namprd04.prod.outlook.com (2603:10b6:408:d4::34)
 by DS5PPF5E0E7945E.namprd12.prod.outlook.com (2603:10b6:f:fc00::650) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 22:45:15 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::5e) by BN8PR04CA0060.outlook.office365.com
 (2603:10b6:408:d4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 22:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:45:15 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:45:13 -0500
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
Subject: [PATCH v4 8/8] x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks
Date: Mon, 21 Apr 2025 17:43:52 -0500
Message-ID: <0c8ca43fbc6a220dc0ed7f45c933e3dab1a43119.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|DS5PPF5E0E7945E:EE_
X-MS-Office365-Filtering-Correlation-Id: e1adb588-3064-4f0c-7088-08dd81262f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9UqsE/vtWFtHMTDtt/0sOpHYq9fX0v7LmpZD8JqNoHYdHiVVMM1x9xV1Ua8U?=
 =?us-ascii?Q?ZninWW0VRcVJ9K1n/I/anl2/5AOP9SolyCFN0jQU5V3WR/wDcgemiCJ3Q2A5?=
 =?us-ascii?Q?UMlRCEDMiSuBOEx4laBdkSXHiYenqjgSJK9iMsyzseYrs/2IsdJUIu5L3KOU?=
 =?us-ascii?Q?nVRt+K+XF7tHeumhQRHdE+wsJvaR+MgJzPxDxFlbtB7Etvsz3Urj6CNZmZxx?=
 =?us-ascii?Q?EOJjPEoIPCNw3nQ4fucUm4ugrvC0R9RMbon6sA7v1mgIMdohC9fGu1Tj28O+?=
 =?us-ascii?Q?FOzQhwy60YXxK5sTZ2eSbOryE+sEgqpgIZA150vtodf5rtBYoULiWheQGUon?=
 =?us-ascii?Q?FfZdRtO2ENGtDDNqUlygL3Gxe9Gmx7m3fB1e/zFVvEW5VDtjL72gDE+a9obs?=
 =?us-ascii?Q?ASKuJc3i4JnTyHdRtOGPM5NTz90r6UCCKn6duleIwGuvvhaDEzOcBFB5cvJh?=
 =?us-ascii?Q?HRs9K6BsciSxaZcKcDUbBK3u2vFKmjOy5cZGjdZecyXqcNbNMsw4AjbanwJZ?=
 =?us-ascii?Q?8KSRNj3t5sfT8v5MEdVA6CEKMmv7GQjabS/dWmkmlGUR8mAKkzu0x0KcriFR?=
 =?us-ascii?Q?ahPSxW/b5d1XUGEG0l2mOfh92kDBpqetzDYkDxc1+ACZmbk3P6qEnouoTNfW?=
 =?us-ascii?Q?T9bzzkzh2QZk+ns8ACWjyZypCqCgwF/dsjNqgb6FvQ1EmT+X69mlHDLP6TL1?=
 =?us-ascii?Q?RiIWZVYvYF+ZVLQxu+4u/0kXPp6Ke5mreSYfSPthDj7a2qCgxQPoru4f86Ae?=
 =?us-ascii?Q?Okpzri/Xxqoea8uJcmaJRYKSscRtYtnwF93nrHfDmzr4GKWplOl0jW4BFFe6?=
 =?us-ascii?Q?UK9jHlpgHyKBV2YsAzKWIHTxeA4frYVir9+8B2ep4zULmamrnI9agrq1tEvz?=
 =?us-ascii?Q?+KHlMVpnm9JSyqQJkMMEBOH28UF/RZeZC0jgvGkTzzaOESsUYR/XmxaNTX2u?=
 =?us-ascii?Q?ZRHhoe8+3qGdPb/2gXhvUFlQaN5JRcCocwtFRYV/fZ5cpGIzJdDg7ke3phGc?=
 =?us-ascii?Q?Rr2qSuukXzPYHuqK1lx0ob81Q96/6T9Trcv1s16xJeGT/J0TDZK9FOgp/MaS?=
 =?us-ascii?Q?lvfBhyo+LnDpaWZx7imNuozuXf7VVE0ev2HCktOFpoB5D8IX/B5FSXTHHHDa?=
 =?us-ascii?Q?HtC01chuYPB59yNqRwoBm9dlQ037A7pXpRqtfvZpF3nMLlTa7H1RA1Wg+KO6?=
 =?us-ascii?Q?S0lOu03U4stOGycu1bGvrFu67iqlAATSe/agsrTguqdZ+XpFKjirrIfpMsgQ?=
 =?us-ascii?Q?Z7wsJn2tfp1OuA0x48lIBorRSs3C9A1jRGOa/JI5pg40X/fA6cwa1tu1s/Rk?=
 =?us-ascii?Q?By6patCjs4jbA4yM9kzmyWPSchVL4oM8QRt/cozQVUU9V1r2To3A5mKxPRyj?=
 =?us-ascii?Q?Umjcar7vmLYWy7pkhD2xOWwDBXi+XK/9eCxOAvI6AEOkfUMofrNbfC1+MTdg?=
 =?us-ascii?Q?3Etq6aKaPij82/o3b6r61aAs+o1V4gdy5WjtE3TvVLn5IuXCv6yS10F2f8mC?=
 =?us-ascii?Q?rcYPIfv2mVMnJ7w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:45:15.3741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1adb588-3064-4f0c-7088-08dd81262f06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5E0E7945E

"io_alloc" feature is a mechanism that enables direct insertion of data
from I/O devices into the L3 cache. By directly caching data from I/O
devices rather than first storing the I/O data in DRAM, it reduces the
demands on DRAM bandwidth and reduces latency to the processor consuming
the I/O data.

io_alloc feature uses the highest CLOSID to route the traffic from I/O
devices. Provide the interface to modify io_alloc CBMs (Capacity Bit Mask)
when feature is enabled.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Removed resctrl_io_alloc_parse_cbm and called parse_cbm() directly.

v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
    and resctrl_io_alloc_closid_get().
    Taken care of handling the CBM update when CDP is enabled.
    Updated the commit log to make it generic.

v2: Added more generic text in documentation.
---
 Documentation/arch/x86/resctrl.rst        |  21 +++++
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |   4 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |   2 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 108 +++++++++++++++++++++-
 4 files changed, 132 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 7672c5c52c1a..6fdea77a1675 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -169,6 +169,27 @@ related to allocation:
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
+		When CDP is enabled, L3 control is divided into two separate resources:
+		L3CODE and L3DATA. However, the CBM can only be updated on the L3CODE
+		resource.
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index e5d1e77e1995..315584415cc4 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
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
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 92246d2b91c8..1d3b60741a39 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -526,6 +526,8 @@ void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
 void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
+int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
+	      struct rdt_ctrl_domain *d);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5633437ea85d..73532c363e57 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2082,6 +2082,111 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
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
+	char *resname;
+	int ret = 0;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
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
+	resname = strim(strsep(&buf, ":"));
+	if (!buf) {
+		rdt_last_cmd_puts("Missing ':'\n");
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	if (strcmp(resname, s->name)) {
+		rdt_last_cmd_printf("Unsupported resource name '%s'\n", resname);
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	if (buf[0] == '\0') {
+		rdt_last_cmd_printf("Missing '%s' value\n", resname);
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
+	if (io_alloc_closid < 0) {
+		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	ret = resctrl_io_alloc_parse_line(buf, r, s, io_alloc_closid);
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
@@ -2243,9 +2348,10 @@ static struct rftype res_common_files[] = {
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

