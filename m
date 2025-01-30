Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C551EF09C;
	Thu, 30 Jan 2025 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272084; cv=fail; b=RBW7bUTX9qUKPBFNygMPGCMPFwRxO0cfQk3W+s4O3YBWvX+wQlI7wqch9tDOeBilUG4B2iyg8C1pt1uzw+/J/+jwvUxL/D/o4SHQc3RVe5gttkOzfuDqghanSyEeJQphHFOPRbpdvJB9j1lZxy+DFUzbi6UrbdfvOGRl4X4qEUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272084; c=relaxed/simple;
	bh=h+1lz10zVvQ4Ay2Zx+T8ok5n817/61sguWY4v0wGwmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTUsMFRbyldhqPfyywtRI9O6HQiO4eH+gMhBSN4SzGWujMMxm8QG5K3anzivZaDCtfjn3opAqoFO9F09SV51gkvLR46aZ0wuF7lnz6IwtMaqXBu4s/c1P68mmRLSRsoyJJ8CalqKxvwuYl2KPY5euo9eJhPlyYGSn3GGJm1dwwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1WsDFwQH; arc=fail smtp.client-ip=40.107.94.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1WsDFwQH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVK/Ple3tP6gtS4nUL3mkk8UqDWRGH0cO+y19g4d4Wi8XSNOREBDruYi6UL/ClMNp71qTkZLDZUKahV2A+x7zjB0leZH7Aicw/jittHy+F5bjqkd2e+Ss6E2PsPItJ1WUXpRk50B5hr9mNT/VkvgMl/n6tY+VPnnjIRbESgnaFZWnG99hhi6kEGK2nv76PMnyxsvooibZhLtKvHnWXahKX4s7o+Xwqs/Vjwksm0SfShN9jIUoy0hjolaEi/fliCgZVzhG0ARe+oP6wCQQKjnbfUb+SRYn1E5bcB9VVzfPjOcYG6Q7dpSq71YaiqSSVSYM1pF2t26mII069WxrdOFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CJHBNIes4ATPzE+CBxF9gNEHtpbUhWmQnfLkqPcFJc=;
 b=su6LcsRPYdhdyjOCR9IY/XB8NFzoTIg7TzxLli74/8mFUOf6KzixmQLEiZCrIE02ELCUReh4LifibDFLhuAXnKz/wp80S5fsqAB2BJd9Zk5rLuwh8BfCz59kPIyFQUa+fkFRAKL5OEI2Q6HG5kWx2PsgZa7OIz+fjXZnPwHINv9GQC4OXf3I6guoenL5OMeFfVSwgs+SjcT9kzN+8g9K/DhTCLPG9GOivWvZ7P1kayR5ZTbgodKs5TTX/sjNhDIQ1e/D+e2pNT0BMy8y7VCeFoVTFQUQ7AXRHHP90bLyff1fHot2nF06m2dRfmkU1aNI2X8nN7lKv4qa7pht5hcJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CJHBNIes4ATPzE+CBxF9gNEHtpbUhWmQnfLkqPcFJc=;
 b=1WsDFwQH6ALuJAZC7HHuInwiGZqe/D63CuhAnNUKlhsUQGJy/V+V8D4o2wRr7T/ksfwv0RTjPyKrvD36OIQ2MmA/Wd7E36Oj+B5h0FtDP7O7M8lOES7FpI/oazCy1HeSnPDJD3h1YHP5nndpyVrpC5z9IG4pn4v4RV8ypfwsYbA=
Received: from SA9PR13CA0117.namprd13.prod.outlook.com (2603:10b6:806:24::32)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 21:21:18 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::77) by SA9PR13CA0117.outlook.office365.com
 (2603:10b6:806:24::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 21:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:21:17 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:21:15 -0600
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
Subject: [PATCH v3 4/7] x86/resctrl: Implement "io_alloc" enable/disable handlers
Date: Thu, 30 Jan 2025 15:20:34 -0600
Message-ID: <dbb4447267592aa731c8fbe1274adf81b0ef2103.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|CH2PR12MB4261:EE_
X-MS-Office365-Filtering-Correlation-Id: 17de3caf-3984-4654-85a7-08dd417408e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hH39ysg4sUoXqJ5/zfXMJX3RXqBbcC4zxbu2N5/I4xvLMKqPE1Z99OqWiCgW?=
 =?us-ascii?Q?NtJ3sZ68tCeqr1LwQ9JWKjiP7aUeCqyNeFL82AiYm58uVzuB+S6xHm2oEPAL?=
 =?us-ascii?Q?92Cup98REEvzKGWeuZKXL639fCy+3pwa8u8v23gEhaeabtKgHvOfFnpWzMkZ?=
 =?us-ascii?Q?Oj+Lt6N/NnieHrjVaxtHj9AeWhEwSXCiVtUu9hV38C5WMtf3JnssAoC8rj3L?=
 =?us-ascii?Q?3DPj1zoeBYnBOsKL4a63Vpty9OazxqU35O6yU9t9J4ZwB/H8okVsenSvoMu0?=
 =?us-ascii?Q?LliGqI5BPdwQhz1rFv5L1M/DV7PpmuLPITTTVbVEefVG7rC6BPy00EXGHoQ7?=
 =?us-ascii?Q?zXIBcp4G9sG1QsKFl2wvnKUnWOOrCwo+q1cb6FeqRrOAdCGHWuLGC3+f0pKl?=
 =?us-ascii?Q?rKpcAgPsmCebAN6xxcFWQKYSrVHg299NOUCAHBTJD/MTr8vZH4OZuzXa5QpN?=
 =?us-ascii?Q?otuTVfAgHiFIyy11Ktr7pmeGluJ+4EL1okZUDbYBQOJIWwzRu/7RzizgQVKP?=
 =?us-ascii?Q?raLDQFNVegSqnh4RgQEIldeo5oi5x9BXTTFyUPXeTjj3URmh2N0rxhHmotha?=
 =?us-ascii?Q?nKh/yAw+w4u7IffkInSH1ITO1YrdtWmALgiw9QdPvRMCERtSPdJIW4MEZwyJ?=
 =?us-ascii?Q?5fMjJn30H2w+MnrtOqQiLBfLsh/INJuehf5TLRLb4GDzM01fEq0P5SOHRoIX?=
 =?us-ascii?Q?MMebA/G7UAMp7Qg57pkNEtNtK1pe54Y4aNSfokyQLQEd5MCOSsjXHGnicZef?=
 =?us-ascii?Q?Yc+R97NXK9Xios5omJ6qwxJ4Fff9RD6H3JiwXRNe0v8qHYa+2l8lOCPLDndW?=
 =?us-ascii?Q?dhSJ2TtHuAEmkN3QwmBaA6pEQ6JT7Jrr3vmjKj2jQnx2JRy9hsd3mLWCUjsP?=
 =?us-ascii?Q?7zfIZE7fQOlI26/pgcJQ0LODu21ik9gpNj1xnSiQ0xfOeHhjfBOxzaN23ZK4?=
 =?us-ascii?Q?b9uJzNevWuOEk/uwFAXBNv8OySRrjuGnT/fMpiVHQxMgoeuYebzvJGntxSnf?=
 =?us-ascii?Q?YW1xtAAfFa2nGGOE/CtehsCNcJzqYGLQInqvfMIx0Kfp63QNrciDbmT/aFwl?=
 =?us-ascii?Q?HbvH1d/AN90qQGaoDHl23LdEAkQcTBD4Jp4IU1wypGWsuwLMsP7Aismi1NF/?=
 =?us-ascii?Q?mpOBHNTCfOq/fF91LsLq8NNZ+jJGm7SUwJQzmBwR5+QhhRA/iIKCj67M4FIS?=
 =?us-ascii?Q?WMwgXp/LdCb9i6xngwc3Lfby1YBJW9MFfG6xb0RsU1GSPnIZtI20QkwzXhJ6?=
 =?us-ascii?Q?AoBj+i4r3bDDEJJQLJz991y+47sUvmcwAozzIglDVe5LJqXA6T/GzjyuyvNu?=
 =?us-ascii?Q?hQPccChNZe6jB4EsMWMsWXcdzlggfPeTvnzxClxQgrKOBoSCYulW5bjAOpzd?=
 =?us-ascii?Q?6+uqjOzjnfgsncQSGlmvYgceImGLCmCgm3oRSk0DChu5gef1aQd4AP18Q/xR?=
 =?us-ascii?Q?OEFRq8pjOcE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:21:17.6943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17de3caf-3984-4654-85a7-08dd417408e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261

"io_alloc" feature that enables direct insertion of data from I/O devices
into the L3 cache.

On AMD, 'io_alloc" feature is backed by L3 Smart Data Cache Injection
Allocation Enforcement (SDCIAE). SDCIAE feature can be enabled by setting
bit 1 in MSR L3_QOS_EXT_CFG. Apply the updated SDCIAE value across all
logical processors within the QOS domain when modifying its state.

Introduce architecture-specific handlers to manage the detection and
enabling/disabling of 'io_alloc" feature.

The SDCIAE feature details are available in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Passed the struct rdt_resource to resctrl_arch_get_io_alloc_enabled() instead of resource id.
    Renamed the _resctrl_io_alloc_enable() to _resctrl_sdciae_enable() as it is arch specific.
    Changed the return to void in _resctrl_sdciae_enable() instead of int.
    Added more context in commit log and fixed few typos.

v2: Renamed the functions to simplify the code.
    Renamed sdciae_capable to io_alloc_capable.

    Changed the name of few arch functions similar to ABMC series.
    resctrl_arch_get_io_alloc_enabled()
    resctrl_arch_io_alloc_enable()
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 10 ++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 32 ++++++++++++++++++++++++++
 include/linux/resctrl.h                |  9 ++++++++
 4 files changed, 52 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 9a71880eec07..fea1f3afe197 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1197,6 +1197,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 20c898f09b7e..61bc609e932b 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -56,6 +56,9 @@
 /* Max event bits supported */
 #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
 
+/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
+#define SDCIAE_ENABLE_BIT		1
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
@@ -479,6 +482,7 @@ struct rdt_parse_data {
  * @mbm_cfg_mask:	Bandwidth sources that can be tracked when Bandwidth
  *			Monitoring Event Configuration (BMEC) is supported.
  * @cdp_enabled:	CDP state of this resource
+ * @sdciae_enabled:	SDCIAE feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -493,6 +497,7 @@ struct rdt_hw_resource {
 	unsigned int		mbm_width;
 	unsigned int		mbm_cfg_mask;
 	bool			cdp_enabled;
+	bool			sdciae_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
@@ -539,6 +544,11 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
 
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_mon_domain *d);
 
+static inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->sdciae_enabled;
+}
+
 /*
  * To return the common struct rdt_resource, which is contained in struct
  * rdt_hw_resource, walk the resctrl member of struct rdt_hw_resource.
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6419e04d8a7b..c5a0a31c3a85 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1798,6 +1798,38 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static void resctrl_sdciae_set_one_amd(void *arg)
+{
+	bool *enable = arg;
+
+	if (*enable)
+		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+	else
+		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+}
+
+static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_ctrl_domain *d;
+
+	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains*/
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list)
+		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
+}
+
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	if (hw_res->r_resctrl.cache.io_alloc_capable &&
+	    hw_res->sdciae_enabled != enable) {
+		_resctrl_sdciae_enable(r, enable);
+		hw_res->sdciae_enabled = enable;
+	}
+
+	return 0;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dbe6461f3fbc..e77c3b37bad4 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -343,6 +343,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
  */
 void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
 
+/**
+ * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
+ * @r:		The resctrl resource.
+ * @enable:	Enable (1) or disable (0) the feature
+ *
+ * This can be called from any CPU.
+ */
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.34.1

