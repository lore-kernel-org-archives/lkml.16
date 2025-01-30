Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C5C1F150B;
	Thu, 30 Jan 2025 21:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272109; cv=fail; b=ilL5mo1OUsRoaBMGy9shzHGjprp5bFrt43eKjT+ZIhTkpMCN94JfLqGol4HwDKu220GFyCGmbrkApOsI1vnA9hGzkmvYcNgus+1Dc65a6gYtyWMOYgYSxV2HtCUjQ/fRWfOjxaAf3E/zjdkDIBmvnICsNOCwfEe4HVppE0DOZC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272109; c=relaxed/simple;
	bh=ShSfUEvFhZHdtnAARXcM+XaY1LCwsrdvKwWLljfit04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uyJ5curNUWXP15mZzGvukCSktlf20/h/Aiu6dh9Wi2Yhcdx2puUHTBZb7udfUSiJJQaq4XOWwFV2vX67nBhW+VR+LWvoUtjhLBR33OroIXcbaQyeCq1EhhJSV9X03k4FJvjwURkaR81oDLKgBy0Eqtd2IlykUplWFqcuCfvdicY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yh0q+OhN; arc=fail smtp.client-ip=40.107.244.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yh0q+OhN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdpJZHZ+P5Kf5fiaKIXDNZ5W8ltTdR/Qx02GmSsoo9bN7tIvzB7TZ51lix+8prhOEn/2AhtiksLsxnus8oQUYoOztNOmzOJID0HMArmTSHRwZcdvLWBRgYH+ITuxO0lzaQr66dfZ9ALoCLwIx/S3PDyI6lzD5mRllNdYwKVsidc5OO70fM79I6DL0+4wnzPeq1KpB6ZhCtpO5nvnDzzXOogE5l40pVANg8UNbN0RSqxJS1WBQjeD5KZliNBAjwUSp8Mu7DCzMYdzstHwdiPuVfxBUaH3fM64Fx5MloZYbs6r0HydXQUNVa26lSjkvjpwxW2DxGBHJqCv4n6X+zCZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htxZTctPX0Yn7JnTh7m1uomqFc2F5hj4Q8gM6Q51qc4=;
 b=cCtKLYpSauOEwr2Czc1w+SFnKsW6Gg1/K0U7Uss5YGTRti9MqA9NrHur/UujG2dFfAaPdWKiorDStKSnP9/we+JJzQgJkLAvsq+7es5sgbJiCHEWpJNP/dbKujMKT+Fj6HF0Ffy85AQIx0Qvn4xuzT5Xc3LEXbBKZoYeELshkG3AU1KR3ZfJWwUapitHss4fo9x6YSenJjxrLTUrYCpwVBTBuLQ22qxJn7QaK7IwLgT2oIpvgVWlizZXNo4nizYQaAN4AF0dZUhtx+HeUyQe3i4yZYqB9f4MMcRqhwISb9ptGgonAV68YM/SqTK70KbesrchRrG1qDMZT5ChFm8pqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htxZTctPX0Yn7JnTh7m1uomqFc2F5hj4Q8gM6Q51qc4=;
 b=yh0q+OhNLTYEMcvgqxsAnLPsRCpnozR39nONhKJENnYDAsfwygX6m8XBIqsBdt5lJfX8EMoAVnrZr5r/IbaIgO6HVvaSFMfmT0nFPrPg/vo8/ldOJNGIb6WAN+ll5xawtN2SaRzhydkZBx2FfIryk+LFTFiKN53L05AWmqWTmTM=
Received: from PH7P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::16)
 by CY5PR12MB6082.namprd12.prod.outlook.com (2603:10b6:930:2a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 21:21:42 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::e8) by PH7P223CA0021.outlook.office365.com
 (2603:10b6:510:338::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 21:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:21:41 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:21:39 -0600
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
Subject: [PATCH v3 7/7] x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks
Date: Thu, 30 Jan 2025 15:20:37 -0600
Message-ID: <74b65f562c4d61d24cb2be53fb05ee1ca436d59e.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CY5PR12MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 22408b9b-34b6-47c1-d574-08dd4174174c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tVrGbWX3RLqc4xk1kRDWjIsT4pqAA4bisCBi9gLxxgMzQYdw298YkcWmGOCd?=
 =?us-ascii?Q?fDtF7zkRm1jxgH7enMbUOeZkS0UXeCg4UsZj7eoj3pNldum5cldmT74FCgg+?=
 =?us-ascii?Q?hfjIaCbgip7+4xN2oEJswSyAgJsvnER0R86bGoQ/8TTBkQJiLZKucRoOxcQv?=
 =?us-ascii?Q?eoXqbxAEGKhCu8G47/dWRWSbGWXj463lcbO43Gp1wN6mkWbqqMDax/xTRnAI?=
 =?us-ascii?Q?bFdOwF6NDIWlpLXWK8iZPoXpvSWlQCJa59F4GwUsz2KlCLp2Nlp08PzjWc/z?=
 =?us-ascii?Q?MSgY6YVG4tpcSLuE7N+F5h8Wnk59KEtMjcstvgat2X/pS7Utp/ox4A/gwgQT?=
 =?us-ascii?Q?aJ1j80gB/XwLtRSmWPrfJgJloGjvvVCdxtGJiScWnXnDN3X6lKFFdBf1yfe0?=
 =?us-ascii?Q?tEVigl89sUlBbtrHMs/6IIwND4cBSLrL0wWTG9ewqDtgbCQ1vzVF3fjSh9rg?=
 =?us-ascii?Q?+VzMSsRwvJfL/3cnrxi9ePYTfDkPVEIXZ59cVOQ0LUqCZ6C0u5FVUTZL5MJB?=
 =?us-ascii?Q?n+ml7qWxIEVD4qO2TrtH+wSn8X0cMGZXKKOf4dZbLoShZBSb5CVy/ADrTgOB?=
 =?us-ascii?Q?7Tiy1NjSxJUZ1r/UZUmB1HzsWW+3mRN4cyrci0y2nzN9cBrrF1BSqVlcxBi4?=
 =?us-ascii?Q?6viOQEHYY69IvkG4lUAOv2AlPWhX5+N0M+wfDFlzDnf9X8qKT8a8bzEMySxF?=
 =?us-ascii?Q?U7wi4dC/P5OckzixM/sa8Jb6nKJn+KVK3WAdSJFKMxlq0qMoFARfSbpRj/f1?=
 =?us-ascii?Q?zXBPeALEfQ1aWQziFf2lw42ltneB0iEfz8sxkvOuwrG+PeXXr6ULTvudgd3d?=
 =?us-ascii?Q?yg0mZmxNRLbkJhH5M+J+jmI4W7SuzRmaZY+sB/iacyHNkk0+mqlqnGQpDKzK?=
 =?us-ascii?Q?XPAcTNRFtC2yzVXMp2lVThNyb7Vd787PyI5KOdfSIbJ9PKzce4fqae248W61?=
 =?us-ascii?Q?T6y9tGtKY3whp6mSV56jv1CAs/3/fQir16ODb/9ZgBpqcZWOgQYzTgRWRuwZ?=
 =?us-ascii?Q?sWRincIcZl89r9Kk39A9Stw2bXLyJ8aZEaScfN8IUILrBB1Yk2mzV1yxBlng?=
 =?us-ascii?Q?KItiKMWVQyE6IZNI65sq0r3PZXbSmOmwqYb6BywFnbAL0wFYIX38I0H2G1AL?=
 =?us-ascii?Q?llXT02QqcoWcEhsKT64j68Y8tiktJmNXffuu6ULLyYGbgAAtOsZGFYMzTJ26?=
 =?us-ascii?Q?NiHafwMqhUiXz02w/qyld6Gpol0wVVsVLF2o4BLQRqR2WRaG0dOu8wCB5ymi?=
 =?us-ascii?Q?SSeN2RlxGZFSg/OIrmr3zWQldsgqI7aTd+YU3CXxHmWjJg4tO1stanx09DY3?=
 =?us-ascii?Q?dna075Qeqmt2yJQ/YEzQSt2OXaU/foiECXEqv0QeRBtuIk1pYBhMHeSQUeeg?=
 =?us-ascii?Q?zyW3KlKa04e0Tx+BnxiBW6840/oZx46u/kmmFdXsJKrilsD+SNjhLJ0nZanF?=
 =?us-ascii?Q?610WWQJM8ti9+uDP/RxwnzhODKPl/McRFShKcIA9kBo6b1JlcrTxmXEQ0cfq?=
 =?us-ascii?Q?WInm7/ISTQQqvOs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:21:41.8620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22408b9b-34b6-47c1-d574-08dd4174174c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6082

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
v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
    and resctrl_io_alloc_closid_get().
    Taken care of handling the CBM update when CDP is enabled.
    Updated the commit log to make it generic.

v2: Added more generic text in documentation.
---
 Documentation/arch/x86/resctrl.rst        |  12 ++
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |   2 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |   1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 134 +++++++++++++++++++++-
 4 files changed, 147 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 1b67e31d626c..29c8851bcc7f 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -169,6 +169,18 @@ related to allocation:
 		When CDP is enabled, io_alloc routes I/O traffic using the highest
 		CLOSID allocated for the instruction cache.
 
+"io_alloc_cbm":
+		Capacity Bit Masks (CBMs) available to supported IO devices which
+		can directly insert cache lines in L3 which can help to reduce the
+		latency. CBM can be configured by writing to the interface in the
+		following format::
+
+			L3:<cache_id0>=<cbm>;<cache_id1>=<cbm>;...
+
+		When CDP is enabled, L3 control is divided into two separate resources:
+		L3CODE and L3DATA. However, the CBM can only be updated on the L3CODE
+		resource.
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index d272dea43924..4dfee0436c1c 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -102,7 +102,7 @@ int parse_bw(struct rdt_parse_data *data, struct resctrl_schema *s,
  * requires at least two bits set.
  * AMD allows non-contiguous bitmasks.
  */
-static bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
+bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
 {
 	unsigned long first_bit, zero_bit, val;
 	unsigned int cbm_len = r->cache.cbm_len;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 07cf8409174d..702f6926bbdf 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -669,4 +669,5 @@ void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
 void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
+bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 81b9d8c5dabf..9997cbfc1c19 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1999,6 +1999,137 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/*
+ * Read the CBM and check the validity. Make sure CBM is not shared
+ * with any other exclusive resctrl groups.
+ */
+static int resctrl_io_alloc_parse_cbm(char *buf, struct resctrl_schema *s,
+				      struct rdt_ctrl_domain *d)
+{
+	struct resctrl_staged_config *cfg;
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	u32 cbm_val;
+
+	cfg = &d->staged_config[s->conf_type];
+	if (cfg->have_new_ctrl) {
+		rdt_last_cmd_printf("Duplicate domain %d\n", d->hdr.id);
+		return -EINVAL;
+	}
+
+	if (!cbm_validate(buf, &cbm_val, r))
+		return -EINVAL;
+
+	/*
+	 * The CBM may not overlap with other exclusive group.
+	 */
+	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
+	if (rdtgroup_cbm_overlaps(s, d, cbm_val, io_alloc_closid, true)) {
+		rdt_last_cmd_puts("Overlaps with exclusive group\n");
+		return -EINVAL;
+	}
+
+	cfg->new_ctrl = cbm_val;
+	cfg->have_new_ctrl = true;
+
+	return 0;
+}
+
+static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
+				       struct resctrl_schema *s)
+{
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
+			if (resctrl_io_alloc_parse_cbm(dom, s, d))
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
+	struct resctrl_schema *s = of->kn->parent->priv;
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
+	ret = resctrl_io_alloc_parse_line(buf, r, s);
+	if (ret)
+		goto cbm_write_out;
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
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
@@ -2160,9 +2291,10 @@ static struct rftype res_common_files[] = {
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

