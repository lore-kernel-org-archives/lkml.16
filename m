Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6341F0E36;
	Thu, 30 Jan 2025 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272101; cv=fail; b=DrZRJXtb9a6ccSAHKzPfvyrPi+z6tBHe6sFNH+nj/8TqvfelsVjgZGyp0bjwtKSEB6xgSFK4DuIi4s8tuP9vEtnZJNxuJ9IyMc5eJqWXXz5b3N8cypN9060mbpDd4Ibx9tF4jXDLDdZO0NG31C+5lebsNSj7zADNUTswxu/wp34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272101; c=relaxed/simple;
	bh=vVjHJOo5LqLlvkoCKs05INMQfntNDW1zOh8Avq5ySgg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q1w2oWpCJ+hGN88b+LLhkFmTfAVeEN+lGt/LVnGqy3SAWYvxbMh0NbAqL+8duDLHzlzrQ97TLIi53b+euZW1W5nvr8oTv3m52Rxy3M+5AMyi6GauWFsB4iP632udFOziivazss5A9PXYRSlfp05ig9F23tvoACk+tt5P8s4FoDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L2erSkHm; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L2erSkHm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG98BzEQb2BRKNWYMP5gbjj5atjmeVjnr+YJdvRmsobcZncaGR5TrDByj2X5DSbG7++illgSqSZXAOQnOKySV06HXAZHD3WatSAg9SC/oET0K1JCMcueFxh0whvIhst6Bn0xlx4MzBTyOSt1peEsDRrFMFELL9x7AdRZdPEjYhVGcvYBGsFgzCsf6gXkeCjkplojnj/38f1jP3zIXnXriobCd0V9MfPf6HSzcStBuOWTTDQwf8V7KunLSF3ixPhLqqTT9OO4eFv1yLecXhtbjt9/6NnTCR5iu8uyRqaexJXg82r8bW9HH0H6oCGvePBgOyCgoGx3vja2gBX+Yx0x3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qUThLeh6M5mcT28Y4sQhwpGMoecU5bXkAW4TF3pM10=;
 b=Kv+MLZiMLp1uKKMQgbpHeIw6OcLBV3BPAHcwBP5noHKZTOxS7dAOU7pJ3qfQ4utL8Ff/lTx6QJX3VBfsDA76g82QD8XumT7mc9Fu+0HPcOJthmW1oZZgGmOzk8R6fMYhW0vZCmhE2KCNEH8FE25Vfe5Ign2Szgv5CbMgm82tvBC44Px0hr1TQWa8K6jjytOSFr/s+eIIIjI0dDtB5dMCs4vyWnbAS+v7r+WXtLMsoKWQMeiZDNFGkGn2bkAFotpxYCfG6kSTptojosbmNve8r1qemGDsohPwgQXTiq0UA9GyxTdijk2xc8RzZqUE3x/ie56Rf6gO4R7w9axjnyR8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qUThLeh6M5mcT28Y4sQhwpGMoecU5bXkAW4TF3pM10=;
 b=L2erSkHmbctACVnp9MZ6QrQxno2DujBJMVc6sQORcNOhGCBbkTQOk+ZKUM8D/f0nYOM2MDXfMkJXKBU4NJE2iRjJixRzkjcxmtR6Zt+psnQoRyywBVGFgfxPjGyru1MXqZU3+y+m/zY1XEuMxSELLMiAYuwIU7a7/IZOFDStESM=
Received: from PH7PR17CA0029.namprd17.prod.outlook.com (2603:10b6:510:323::23)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 21:21:34 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::dc) by PH7PR17CA0029.outlook.office365.com
 (2603:10b6:510:323::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 21:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:21:33 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:21:31 -0600
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
Subject: [PATCH v3 6/7] x86/resctrl: Introduce interface to display io_alloc CBMs
Date: Thu, 30 Jan 2025 15:20:36 -0600
Message-ID: <873d649aa0e5f6c24b6340cdcf9ac96ea57d7331.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: deac3b9b-9c38-4d30-6b76-08dd41741276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vFlwgJ3wVQ71DO8SokSdEPDrjTakwZD8xitmPd56Da1P63wUQxK1zAMWZnyv?=
 =?us-ascii?Q?FMLMLbOBH9yE4bETbeagg++xPl+qwONDuj8NLHg7QRbUGZHm+ApcAyhngJtb?=
 =?us-ascii?Q?XpGdtGOoEIiHLlnEodOifxHVc/g26SKbN+a9VVnlLNaMGrdpe34GNe82vpN1?=
 =?us-ascii?Q?tZUe9CIe26yus7x0T+ZFVgNxA+ABKnxpyi89gZFyD3UjPDkABp3O40+HnbB3?=
 =?us-ascii?Q?tQpUiqGzn5nSrS3+A8lCgokXtkN9Sc5/V7bMoPLFpSgBqz+7cIt6gZRN6hgx?=
 =?us-ascii?Q?dads5t9LJL/N8nAMr750rwAkJG6+isA6ffoh02QnFeaFgNV86i+7BZlBkmlt?=
 =?us-ascii?Q?5Lbg8bJ3sQQbyDjzz5MW+gNTrMlkyq5JXjrTn1Kt1HZX5TpXMbahKJn2nPSv?=
 =?us-ascii?Q?qi3NFVs1nXTbfQvuHjukbIXXxGGsLP3TRRuGgZZ1N7w7ywxUiHq2W/TBAeZt?=
 =?us-ascii?Q?3zscYuqTFhqQsfAN7Fb6mL0oSsOxTZGaLXTX3NNjc9Qh5iXUJoCfCTC7F26B?=
 =?us-ascii?Q?tMP0chL8mjU4p3QIeab1/0fkXT4nLo9y1MHI2u1TqNQWZv/wy/YDbUoKSR0J?=
 =?us-ascii?Q?jQbG28vQLCbNQHJ5ETOBZ6Bnn2CuS3lHb6xsaoKuzPncgDp46CXRmi/+XCC+?=
 =?us-ascii?Q?dDsl61WCt2x1wOru2fERj8KQMr8FQOEtAR4A2C3e33WpYGNIuHvfNdLnq43U?=
 =?us-ascii?Q?LrePPmaIg86uvFWb8wwmpBO2A/KOle+JQlFz5PSXjBxSB4MBxiM9+ZxLB/eg?=
 =?us-ascii?Q?jS0yzVthY0f6S9P4QfbwmtpnLAkqIYiNftgobjPny1yBlOzZqWKksonvhKr6?=
 =?us-ascii?Q?QVSmjNKgVvVpk49eq2qojXht/k2qcbP1231Iemx0v4OUa6dO4SDuwYVDdM4I?=
 =?us-ascii?Q?dBBbltXepUjRdypHwfvxVjV9pFgJUXLVnYOzcrUYHSk9OphTSl5l33+Vj9mM?=
 =?us-ascii?Q?JcXyx+mHXt6HbrOOy0uxcn6c/6kFFPtyOSDdnYm1SKSg0+tWjOX31C1LlJ/v?=
 =?us-ascii?Q?D4CyiUax51KYy8v0q3hTe+rBMF1pzyBUFayZn1FGIcFuvs1fKGIcWLFAmqVP?=
 =?us-ascii?Q?7WS+a4fdKesT8IENhiCuowOW0NvQhL1IsLMaufDyhl49jsCsFnl+yq5NVNwN?=
 =?us-ascii?Q?tkE7hPniSQyljc1OtFeV0mXqOFz8d6jci8KTAlkIFD4jOwpCclGosPabxOrC?=
 =?us-ascii?Q?DtqnCPJzqnRMtyczMxlDdJfQdjo0umxYpWGWNWBe8cVP3xctsCSq/7Yozwrs?=
 =?us-ascii?Q?M+leu31EQH9RUr/g0OTcEE+W6TYjBp4LHb0y22uZASw7SgKIZlRU4/zg87c2?=
 =?us-ascii?Q?cFolLQGLhnHsTHIcOEA/7D/qsmLBWUm1ImU8hB7pcfozhG2u4pz3nHzhCpAi?=
 =?us-ascii?Q?8lh0dTcKgsZF47pb86Ac3U4QB6VNeeYMDyWEsNtSeO6+CYWXWICYBoXWMjVv?=
 =?us-ascii?Q?Gl/cEgNxaEr3da8KNtInMAli4RCAnPf43ttA2DxcxOTeDZQvGdVcybcWgMrI?=
 =?us-ascii?Q?YbgvzDZ5UK/NuXc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:21:33.7459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deac3b9b-9c38-4d30-6b76-08dd41741276
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462

The io_alloc feature in resctrl enables system software to configure
the portion of the L3 cache allocated for I/O traffic.

Add the interface to display CBMs (Capacity Bit Mask) of io_alloc
feature.

When CDP is enabled, io_alloc routes traffic using the highest CLOSID
which corresponds to CDP_CODE. Add a check for the CDP resource type.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
    and resctrl_io_alloc_closid_get().
    Added the check to verify CDP resource type.
    Updated the commit log.

v2: Fixed to display only on L3 resources.
    Added the locks while processing.
    Rename the displat to io_alloc_cbm (from sdciae_cmd).
---
 arch/x86/kernel/cpu/resctrl/core.c        |  2 ++
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  2 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 38 +++++++++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 88bc95c14ea8..030f738dea8d 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -311,6 +311,8 @@ static void rdt_set_io_alloc_capable(struct rdt_resource *r)
 	r->cache.io_alloc_capable = true;
 	resctrl_file_fflags_init("io_alloc",
 				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
+	resctrl_file_fflags_init("io_alloc_cbm",
+				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
 }
 
 static void rdt_get_cdp_l3_config(void)
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 536351159cc2..d272dea43924 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -444,7 +444,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	return hw_dom->ctrl_val[idx];
 }
 
-static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
+void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
 {
 	struct rdt_resource *r = schema->res;
 	struct rdt_ctrl_domain *dom;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 61bc609e932b..07cf8409174d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -668,4 +668,5 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
+void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 37295dd14abe..81b9d8c5dabf 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1967,6 +1967,38 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
+				     struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = of->kn->parent->priv;
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	int ret = 0;
+
+	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
+		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
+		return -EINVAL;
+	}
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	if (!resctrl_arch_get_io_alloc_enabled(r)) {
+		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
+		ret = -EINVAL;
+		goto cbm_show_out;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
+
+	show_doms(seq, s, io_alloc_closid);
+
+cbm_show_out:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return ret;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2126,6 +2158,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= resctrl_io_alloc_show,
 		.write		= resctrl_io_alloc_write,
 	},
+	{
+		.name		= "io_alloc_cbm",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_io_alloc_cbm_show,
+	},
 	{
 		.name		= "mba_MBps_event",
 		.mode		= 0644,
-- 
2.34.1

