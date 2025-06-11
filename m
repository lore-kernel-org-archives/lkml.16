Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055AD244674;
	Wed, 11 Jun 2025 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677075; cv=fail; b=K0FZBkYV0f5hHq10B3mrJhN5q51d2WsmLWhWl7SE5hcNbwzEfkHHWBGkBsABokz2iAJtwl/EENqqpMMcHFFvrY5Pg+vmd4lo1bVSDMFEbDqanqjs7PgvGzT5N0U3t5ER/zw6lTiQ2pdFsK6M0h8xF1kIIxQoG15Nf/sQh7Ibggc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677075; c=relaxed/simple;
	bh=zeTfgCcBlCZASP9dH44ugFKhq+EcaQiUHB1OtV/gFVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRmbPGt3NtjQTeizX4e8mYyXXolWLPaORm0myP8C9JJoAt96J/DWfKw8QrJS0ZqE3RSsDol/jDX2gR/+dbEHwUrSRDuoWJ4ihwJbs+RuHSlZzfhxTR9RZCpTafXiyMCMpMxez6g+GV4sGLXiGgSYF/a84UGsTpdeJGpxnLbZeyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Os7kGKnK; arc=fail smtp.client-ip=40.107.243.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Os7kGKnK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWK0KfYlChVYamTHGwN3S64Q3tC6dppgEd28bxuUJIr9gMfrI+Sxs8geRMUp0uJ7jLr8FRSjp21hDJB563JCYZSlOnyKiJR4Sq1aL5YIuCbaOari8U3LnAimcyF06FPi1QYgs0GtGq1xLuDLSl0IAyOMQt98AuevJzxieLY49ZZD77cPnNP+6vx+JjFBN1OpgmLOCkFXvlCYxDP/DAU3F+ZuVHPYFXQPYMXzvU2QOETmZfPOBfe+xb3dqsk8DLoCuVgxIX4p9eF+jmb6UXyHXtmQJz8m6p3GXkuGt4HOO3G+sdaIzmha6j/28lO1gVxFs3oiJmUlOxUk/TnagNxQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zVWCFNmU//CttTxPHIjI51Zv4hegM63lyqq0FcL/mw=;
 b=FRGNIrmrrdAL4TitxfU2CjiYRLVrZbg/WKBxlt3W0tKwVV5SUdf7UyeQIP1JhrB3qdme+UHhpvjxh38mOd1DsyeiG6K/RL/l3gBc4Aac7tT8K2UUtU/Qhq+l0MbD1Xkn+2vI338Em+mvsphuELaON7yqvYLgJRO4KzlEFdwQ4Uc9SMUQYa0adKqu+Dd9POWfmiOovXoAsa2AqQ+t4ws5cDN4xhLeLzU6J5e6yNv1aRCNi1zkH0JMQNRBkTYqRDq/SMOenXyawMihwy+uC+g0if1vp38OE8YBrQEgO7cE+RDMATreafqFit1aCPGzh9CgQuFgnYLMJz/oVv0jgeCL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zVWCFNmU//CttTxPHIjI51Zv4hegM63lyqq0FcL/mw=;
 b=Os7kGKnKszMCzLMTpMImjzktPcn6/TFhtlQGoAyJfzSXA2VuAxz7c7QsB/RnxwwQMVd4FpUV8EX0YIuchPT37AuWi25Ek79+1yZgPtTgWLefDhTW93Of9F1Uz9jAyI0cg9O4Qnez6povV1oVY9oatOVWxyc2Hm4lCmUYQ9enzb0=
Received: from SJ0PR03CA0354.namprd03.prod.outlook.com (2603:10b6:a03:39c::29)
 by CY5PR12MB6574.namprd12.prod.outlook.com (2603:10b6:930:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Wed, 11 Jun
 2025 21:24:28 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::76) by SJ0PR03CA0354.outlook.office365.com
 (2603:10b6:a03:39c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 21:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:24:28 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:24:24 -0500
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
Subject: [PATCH v6 4/8] x86/resctrl: Implement "io_alloc" enable/disable handlers
Date: Wed, 11 Jun 2025 16:23:29 -0500
Message-ID: <548b542ff537936cc8a20f721f6f2472189c536d.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|CY5PR12MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eef140c-0d2a-4aba-088e-08dda92e58e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OUpj+kDIqw8caybAgcMKR8OG1Gly8WUfWoHLwvPsstbBWPAFTZDwdGHKSSLe?=
 =?us-ascii?Q?8cCmaj0/Ui4xxFdiZT5tBukIde9BHh9J3rDJfO5T155n7tnWdrWqyT8zAOFw?=
 =?us-ascii?Q?/F5OmPN1iq0VgBzQ5YOrqIq6i96+SjFlZ8xdqOZbYVUxakMlGVbhr7Wk/Utv?=
 =?us-ascii?Q?1r6Fm5sjWgCO8xEq7XgPHG+FuqHyzR6gIazNEkKEM15gXzANR+t3xqiBcQBy?=
 =?us-ascii?Q?1P00E7cmTCXWtb/KxjEc99LiYaEbam3oV1SqMWL7+pgE6RcaWeGuErNVB1Eu?=
 =?us-ascii?Q?2+VPX32lC0YpKcmACI1dSvR/q8Qr0owNA0WvwTniEXuly9aIL6nBZ1k0rbrM?=
 =?us-ascii?Q?iIo50t1f3STd51qC3mFCxT5Pd2w7icmd126lkALY2Ibivt9LKYHwUf9guqhA?=
 =?us-ascii?Q?xC3PbE4NptRRMpo9oj28OEDS88hUuIM0r/as+feRwVHlT2113Wm94Cb8JH9D?=
 =?us-ascii?Q?GhcVhCr0+2WTLGUQkqh8z/fH+YoRYX2XGK2o3m6Ne6V9WU+gZd6Z0MXBSzhy?=
 =?us-ascii?Q?IKd9mav4AqH86f6BEeq8ip1LIqOi4LRldK3HHcE8SVyVD67DWYhS93QKigi/?=
 =?us-ascii?Q?JtGu904PO4UeiZcWaccAQ4LeErDCSSqUjB2tmQLETtySIYJLeAxz1XwHCzSj?=
 =?us-ascii?Q?ebL7mbEe6eDV9rNXVMRkqJhqVR4NHXOxTcmSGmjNOOyh9gLdrfU2ux5yhkCE?=
 =?us-ascii?Q?Xo+N0m1fv6uNl0C9Lyn4cQZ6b6a5kuJd6eFygIByrLGu0oJoFwQG7L9IMAC/?=
 =?us-ascii?Q?ecLW0z9QwglUD1JDFQXBcNc1CIzrvgEuP4/R+BbONNP6IvE4LlY++pTVWIyR?=
 =?us-ascii?Q?GmsyphWrP5qXiNdrM7LDctgCABzanl8TzzHURcMLMI+c13kGGeWU4PW92Bb6?=
 =?us-ascii?Q?Rxbtexailsj1eI5OV/rYK/M0quG3fIBCrh1HxpTymzyVvA8D+FVvoAMnSwQE?=
 =?us-ascii?Q?tgY/k/htfiZKofcSrrXj6ncu+TDqbT+8occoSSmiwawxL/O00psjddnKfg4q?=
 =?us-ascii?Q?LAly4jUWhjxZf5dInNLkILa1Z5slwaAJk4z5llQ3kudc3bTb3777cwelVa/E?=
 =?us-ascii?Q?F0ZVWPO3VONz5puiAQ8+DSCXjvaup66C5hUeCH1mISKLuB2y74a/szsP4mC7?=
 =?us-ascii?Q?rT9kK/SNq6vOv14lrVgN213YYYFd1IJ0G+BWwIkGyKPuM2PlBiBBex6euDY0?=
 =?us-ascii?Q?fzWiMIevHfMjqF3Jyqt4GZb+YJSpKA7ixENOJLwct4yqDWN8ZvU3iUW0ed76?=
 =?us-ascii?Q?FWFFl0ovx9Dsgrk4gUhECs4X+5hZTA3Xn4SUzx0D6i+AN/uOQmLcfqD9cU+d?=
 =?us-ascii?Q?do9lWTqNimXvvGAxOV3cBNncnydvwSX9roTpEQ3lN9u3YkxzRTcE0n9gvAGq?=
 =?us-ascii?Q?aLpcEJewuZrLVkV1G3TR07ZtXRfiITY2VHTaHnq/oydf+zxkmi1PFerX/k0y?=
 =?us-ascii?Q?qvDXuqOvsFiaBD6Gsy0Sm8ltqxboV/4Gp5GsPv3Y0nBpAcf+1Jv5SCelP3Nr?=
 =?us-ascii?Q?z6depU92KJklcUkgb+Dk33i3ajEjAjDIErZhw6yJe0tZgPm31iFVvGUVRw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:24:28.0395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eef140c-0d2a-4aba-088e-08dda92e58e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6574

"io_alloc" enables direct insertion of data from I/O devices into the L3
cache.

On AMD, "io_alloc" feature is backed by L3 Smart Data Cache Injection
Allocation Enforcement (SDCIAE). Change SDCIAE state by setting (to enable)
or clearing (to disable) bit 1 of MSR L3_QOS_EXT_CFG on all logical
processors within the cache domain.

Introduce architecture-specific handlers to enable and disable the feature.

The SDCIAE feature details are available in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v6: Added lockdep_assert_cpus_held() in _resctrl_sdciae_enable() to protect
    r->ctrl_domains.
    Added more comments in include/linux/resctrl.h.

v5: Resolved conflicts due to recent resctrl FS/ARCH code restructure.
    The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.
    Moved prototypes of resctrl_arch_io_alloc_enable() and
    resctrl_arch_get_io_alloc_enabled() to include/linux/resctrl.h.

v4: Updated the commit log to address the feedback.

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
 arch/x86/kernel/cpu/resctrl/internal.h |  5 ++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 40 ++++++++++++++++++++++++++
 include/linux/resctrl.h                | 21 ++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index b7dded3c8113..b92b04fa9888 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1215,6 +1215,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 5e3c41b36437..cfa519ea2875 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -37,6 +37,9 @@ struct arch_mbm_state {
 	u64	prev_msr;
 };
 
+/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
+#define SDCIAE_ENABLE_BIT		1
+
 /**
  * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
  *			       a resource for a control function
@@ -102,6 +105,7 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @sdciae_enabled:	SDCIAE feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -115,6 +119,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			sdciae_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 885026468440..3bdcd53b3ce3 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -229,6 +229,46 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l)
 	return rdt_resources_all[l].cdp_enabled;
 }
 
+inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->sdciae_enabled;
+}
+
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
+	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
+	lockdep_assert_cpus_held();
+
+	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
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
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 0e8641e41100..06e8a1821702 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -531,6 +531,27 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
  */
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
 
+/**
+ * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
+ * @r:		The resctrl resource.
+ * @enable:	Enable (true) or disable (false) io_alloc on resource @r.
+ *
+ * This can be called from any CPU.
+ *
+ * Return:
+ * 0 on success, or non-zero on error.
+ */
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
+
+/**
+ * resctrl_arch_get_io_alloc_enabled() - Get io_alloc feature state.
+ * @r:		The resctrl resource.
+ *
+ * Return:
+ * true if io_alloc is enabled or false if disabled.
+ */
+inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.34.1

