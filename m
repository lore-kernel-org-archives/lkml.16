Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE13F22AE45;
	Mon, 21 Apr 2025 22:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275489; cv=fail; b=PkGYlTq8WV84Rnu7ylpWgZJD+DUNR9Ohd6UhLtDTi7Tw67HuwHIaO3QuvMxzFRzP77qnY2SLzS0aHPh94ecdyg8Xw1RzhwYF0tpotkWetjgiYPGMshYu/ok8onVk0RomdtWRN+17LqkXFLwGQCGq4xDYNaSWgl5ZZyO6OgteAyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275489; c=relaxed/simple;
	bh=LmUR1J2cFy4hqBTeiQMx3L8fUXjRdWDVlurGqM+tJ7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MyQieK9I0toYcIaJHPIZzhIkYJEC8+2vkGEFQMfTAdhiJGHXiTI6ntv7Mnic6i2mPcyngrup8ZzOagz04Z7mNIOghQeVcsfc00ZWzfeU1DtuspQAfjyBXmuJUbN3GCusHIjQfrxxrPcSu3UZaHsqQzy7v8dSLvov3HE7KVb1Rk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lwLeTEbh; arc=fail smtp.client-ip=40.107.223.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lwLeTEbh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR9q1cS8ABPjTx6n2DbFUykarV2EuBXQ3YpfccxYHM9VMphJ7XZ1K6QJOzMVUfHbUx05sOCf/g00LsXEb+CHmVStnuecBKjV/02b4PVa3ijpxIoUmPBBlavtYBl7ZtlfIxcdSp7Tw3hCUqmpdd4Ty8jHwJ/Euq6FIRk6QZpVlKdlWNSUK5k+0BSJc8dvK8BoG/ewPUCXIMpN6Ll41xUrgFdjbVD0kP9s/+Amaw0eiASUdUBw4mW+M4zxp4EeUx48iDAnN9ea/ZsGm0A4UbshiHBJ9s02RX7wbfp2gbzJoTNx9iNa0oB/FAom0Y6oxmraL8Wtm1BHR7yw7GAj7pAwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9VVZF5vcxuUNDd70IavTA6mXTvppe0mJRoO21vJ1o8=;
 b=O/B36g1ILZQrh2E7YqyExZ5smspLU5Az0qQ27l9Csvi88BWZdi9/9Y4g7mxTuVRcYwmfkzulvXzC4kZrY65iFm9yp1H6Y5HLxZz6H1W+MGq53zauhLjmnu/9WjJh5HcA2StK9c3Clb5JGP1/GK4Z193lJe9Ne+4FHNW8fZXKZkuQOHKokm1T6M/fC0NyuaOHtk6lmI42fs24m6VHjlRmZ0GzdVXkB+PCnpJ2XefHe1y6c8jn1vF1HsM9JhdLXEFUf/qqqXQhyJe0kwhK7K8upvMbDivLfhKxTFpyuXYADepS7NaEJbvuKT8f3QQOEnLjaYDUbbDiVzXcPF8C0dH8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9VVZF5vcxuUNDd70IavTA6mXTvppe0mJRoO21vJ1o8=;
 b=lwLeTEbh5yF8AiCmdwNw7VAXZELeoByXeJqjmma7uyMWECYySCxwQFD6CPRYUwKpAbGhcAZIXPUCSk0K3539rdwvYCRAySWrulpZ9K43xCzTjXx+8MKcdGP6OwhHD7jWTcFpWD7zF0QRTXAMc6GASJTcPFaqNvZ5wcN27yoEaDU=
Received: from BL1PR13CA0354.namprd13.prod.outlook.com (2603:10b6:208:2c6::29)
 by CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 22:44:43 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:2c6:cafe::25) by BL1PR13CA0354.outlook.office365.com
 (2603:10b6:208:2c6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.31 via Frontend Transport; Mon,
 21 Apr 2025 22:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:44:42 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:44:40 -0500
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
Subject: [PATCH v4 4/8] x86/resctrl: Implement "io_alloc" enable/disable handlers
Date: Mon, 21 Apr 2025 17:43:48 -0500
Message-ID: <7946011a76cded280c8d5a29aa34fc3a260ab333.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f1ae64-4f5e-4887-8ce5-08dd81261b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dIa59g9T47rYKSma68SZFQdW2vIxmDrcAM0vwIfIhaBq2GztgUd6f7leQLvM?=
 =?us-ascii?Q?dcV8B8k/GGItVAmfcnKjbWdqzGtV61vByAAmWoCXsfFzuTSJHUhNbID+P4Zs?=
 =?us-ascii?Q?OP7cjgqtYbkySmwmMPIbR90jsyitdwqTy9+Pfc7Z44HQ/8PKNOXhNjpe+qCs?=
 =?us-ascii?Q?I3n7X4Z7BpX6CSQlh2ZgXJmVi3MTnsISUm466YYj0wJ9kjOn+/7A4WvDVomh?=
 =?us-ascii?Q?2uZRiTnCb+Nf3sMS1Lt4d4sN16F9Z2P3B7U7LZQ2ALh18gL1TSEGc1Fvxg/i?=
 =?us-ascii?Q?LGEVhSoxv/KaRH4vnTzgbWNLkugX5v7HGBDjuFhO2+cCUuOn4h6fLdKclDK5?=
 =?us-ascii?Q?JN3+WGzWxVBZiNxx804dAz1AKM42ys5clfqGFm8zPt2XTUXNTnirH5awx5cZ?=
 =?us-ascii?Q?HSf2cyz37QmNN4+3HnOm90ToICEgoSw4dR/kNP+IAy0p0RRgDoH1tO7/eLoW?=
 =?us-ascii?Q?kWeQq72E9ZvUyWWH9ulPM8Ts83MMSn8Lki6NA2a6wMgMmaa8bQa4DhGb8HCx?=
 =?us-ascii?Q?L7E1qEEueAXI+SbzZbkkHxzGpFqpa1M1o/CauQqkF3hRikkwTVewNPavsabe?=
 =?us-ascii?Q?H2ds1/hE7XMxT7dPdbsG8RI9Ntrazqub29bNVHZr2iZxgDCywF/QzhDYFo0s?=
 =?us-ascii?Q?6gkE0if8jirv8/rs3T/0APtgivyX5NSGAPhr9d0J70PtW91wEOuVm65I/o/9?=
 =?us-ascii?Q?OVklkFGisp9nD9TPxwktIncbCQVdYSo2FnSLSgDrMRmsYkW6n/3VgV1QXF7+?=
 =?us-ascii?Q?02J9ATVf1mTZYcZkjwTcWtgUy2DpmaPq+GvRtTa9MHlicJYecSicGkYuHA2H?=
 =?us-ascii?Q?hku2xVFGhiTJH5c34GEhPrD32eE2ehzYEphEb1Ylk3pRUh8QJ4nSUGv8Nky0?=
 =?us-ascii?Q?pjc9nGonAO3lvo/AEKPZVARJnZLph928cfJcRNBXONTiFajkwQJF479ffk4H?=
 =?us-ascii?Q?5+Db+PG8KAMPB+FDHd15xUB1z/NgBQ7Kr7rK+5p/fpq61Avd643HoD7hXRxw?=
 =?us-ascii?Q?YWOEbi4NRsg27Xb6TTF51WGqJk9IvzbjVq3CqUPhqvP26cZiMo0DhvSIxEsz?=
 =?us-ascii?Q?NZEQVogaxQNDeDzAkrMkiqGyEBVU+CwljLUGiw0TdQRcB+m/rUkp0yrImbq/?=
 =?us-ascii?Q?37cRHZ3xY4FGvdE+UMbW8pah5ILRZ2ajVH9vD/s2PKarDVr4h6jzlZyfpOkp?=
 =?us-ascii?Q?V7MwPE4yHNOvtCAQ/tdZBIqhiG8zVNQZmM/2VLNoT6Ib+QzjLqrww1uto480?=
 =?us-ascii?Q?qTOXIc0oMmJQTpGQIVg1XELOJ7kBQAY7tTCF7kcNFcSiGo6BRAdfp0VAtxJy?=
 =?us-ascii?Q?F5jbhMUVzfmWE47liLUQK0iYJFp0932fWMLBGkkkuDLzZllSVEWZg4FOA97Y?=
 =?us-ascii?Q?mBo7D4g2GJfrgjLGJN0HJ4QoithIABRv5XX59RBpnlSKpSGKD46+6/bmPrC6?=
 =?us-ascii?Q?EID9bt+WlnMkISGdDvvTVdIlDu+hX5LYhQj//T8ZUJS6k9oz37h9Di74GHto?=
 =?us-ascii?Q?mmETMBzV/28yoZo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:44:42.7711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f1ae64-4f5e-4887-8ce5-08dd81261b97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283

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
 arch/x86/kernel/cpu/resctrl/internal.h | 10 ++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 32 ++++++++++++++++++++++++++
 include/linux/resctrl.h                |  9 ++++++++
 4 files changed, 52 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e6134ef2263d..3970e0b16e47 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1203,6 +1203,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index eaae99602b61..6ead222904fe 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -32,6 +32,9 @@
  */
 #define MBM_CNTR_WIDTH_OFFSET_MAX (62 - MBM_CNTR_WIDTH_BASE)
 
+/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
+#define SDCIAE_ENABLE_BIT		1
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
@@ -381,6 +384,7 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @sdciae_enabled:	SDCIAE feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -394,6 +398,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			sdciae_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
@@ -420,6 +425,11 @@ static inline bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l)
 
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
 
+static inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->sdciae_enabled;
+}
+
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_mon_domain *d);
 
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 93ec829015f1..85796a186374 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1845,6 +1845,38 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
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
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dd09bb9a173b..92e242c13719 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -514,6 +514,15 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
  */
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
 
+/**
+ * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
+ * @r:		The resctrl resource.
+ * @enable:	Enable (true) or disable (false) io_alloc on resource @r.
+ *
+ * This can be called from any CPU.
+ */
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.34.1

