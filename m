Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E92737F2;
	Fri, 13 Jun 2025 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848812; cv=fail; b=nZAFAfth3st+nWhonXQr+yKxU/MEzGC/IX+7MTH0JK1LyxQFVX1BLm62tU5kSbIHCJBxMKvLX5vHvuDmaKEJsFAtTm+NmcxENv2IHu1Np9GP28VyzAbet7RBUniZIUGFGS5mvrlRhJ00z29VUFjqzKZG2DrWEbxN/2/HUztF74I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848812; c=relaxed/simple;
	bh=EdU0bJ/lB/x9FnR0AhjnmPoHEoszK4q9Iwc/qfObI7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPVPfVlI4zT9r6oC0lQEOhFNIBkOBaAR/utWi8eZEl/VEbxJChW/j6P557auszPqzXniAVFCAHxHqNcVW7G7thGIhegY+Wm38KoMvrIj4IW1HH8h5tCXhuQ9BEhh3PAUP1Jju2ZoTIe0Q03fM2YoV0bRgf9jZr/8bglEOmHPGZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X090SMTq; arc=fail smtp.client-ip=40.107.95.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X090SMTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNAiXj2YyWHrzGs7idDMoUjY0qg7436yZ15MZuy+amtVwnLPHrIYaSSQeqtRTQuOIY6yeOStXRh1sQ+k2hXD91F6XYmOEQdXyjfuffD/cNvLIGLbm0zEKe0akCSZOKa2n3OjdyBiIIPIJQ5CM3Rz/1lpvYKCU+AhDUinqYtsh9CxQsQfcN5q157Z2LIwhRI2tNe4GCwfySQh+7afI3mAETaJtAa+KfApROL+uN5oStrZxUYfzrrFuP9dJ8Ao5GR0Ey8DtUzwOPvNZdDQ+E/MuhqlzUDBC2AwO9SUaaJBZT6L5wyyFLEjU0TMb5uDM5lk+gRcTvJXOdW6TXzXlijm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzVQxq23P9wIjz/W/+k93+GWu4bkuPjW5Hf7VbkPw6k=;
 b=AF4uMQt+M/MGgCxFySbhiWdtlNJWxAEv2CO7zVAyZJGjeFq89II4ji0ZqyieDnNyYiiF5P3PedEWjsiEmq6gXuFw0c0TzoMuLgVGFW7U8oI2gHkowSH94MAFMC+uvoUnxSPi5B2ZMtbCVF4TD3OUDYuJdp38b2AaBfcc+RJyBUgLnlVaHfOvFZ3SSp/UWE9kw+sin8NZc2UcXflRoiHQfxCbwVceV3rgfd9xus8IiBVDD/OfRffoR6t3A4nJ0Nmz2r1410mBWwG+vSaPjpa/gT/v2z4wlRb+2JENSQciRbzr+8REzoU6WOL5UVqdRTB4JMG/c0dUH7SGkTg6V+Q0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzVQxq23P9wIjz/W/+k93+GWu4bkuPjW5Hf7VbkPw6k=;
 b=X090SMTq4pwh1IMIzkQGaN7pb81p6OQ6araJrFckvd0XDqVVtGpn1AqV+IhmL2l5G6dubX9JkYqMqHWdxf9Psz09wBAKT+GlJIdUZpZVrPePHuqkaFvdkzpzgyc5ZDIinka/XrMD9zGyDNMB1MZ5YAN1sK5s7oDIP6E7RNeFs+g=
Received: from DM6PR05CA0046.namprd05.prod.outlook.com (2603:10b6:5:335::15)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:06:45 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::85) by DM6PR05CA0046.outlook.office365.com
 (2603:10b6:5:335::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:06:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:06:44 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:42 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v14 09/32] x86/resctrl: Detect Assignable Bandwidth Monitoring feature details
Date: Fri, 13 Jun 2025 16:04:53 -0500
Message-ID: <31b14155abb7a66aace3dabfa4cc481bfd9e6647.1749848715.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749848714.git.babu.moger@amd.com>
References: <cover.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6c2c03-be90-443b-26f1-08ddaabe33f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k+1p00FQCkzB3IEero05aVaxnOva1FjbpJPPa/TY+4QmE6bphyycbnGV/+N3?=
 =?us-ascii?Q?kYXiSf0p/xXMyohQbX8rPXObGIezqdwcbeVRvBxTnYpRWlcayaRz/ar2P17c?=
 =?us-ascii?Q?GdT+sKM143Av81ZKIkb6Eaf5DqB6OtdXn7Qko1xrfRwOHTRfqKtl1LkgiOk5?=
 =?us-ascii?Q?bUNA0A3p0xTGb9xwg3+Q2qK13CxBoCBGyWoaFBlRasz3ddDJzSvDG+690+zv?=
 =?us-ascii?Q?eaHQVRgl6c6OL+qhuQE9AHpMu1VNFFbucztj7ixJSfyk7C0dL4gdEiDB0swk?=
 =?us-ascii?Q?9UxnK9lJeNUSzArxVpjOyyhjziryeuWU1sI4o6ONr/qOH8R5/OVHYXB4aQIs?=
 =?us-ascii?Q?LJnNON4PHVeUzip4JQs/PSaA4L+88qbGpLPmW7uoBvkFv9QqrszfU1oaeqey?=
 =?us-ascii?Q?liFip+NS32vpDWydhaiYFkuS9iYQIbvdUz4VkAL4kymwV92WBcBX+TnuEtDq?=
 =?us-ascii?Q?T6o1RZMD+UD9a/FJKcG8+VfIaGFts13KaqiEr8hHavV8SHpmKAby9oyIwPdB?=
 =?us-ascii?Q?ndVuvexU9A2WWo75D41aooqyOWP8UKjm4A4CY1VFGZ7b/eEMJYUuoYEjcfJx?=
 =?us-ascii?Q?AHwFfqhBX7bUZ4KDvSgvsw5n2a/uc1hyteir7+fZlB0AO/Ven5NLXTJipZLr?=
 =?us-ascii?Q?huq4U5EXqb9ZtqHi/6cgivYIpE4aRqE1FzUxcNKLKpfsa5haJawKzZ0cuSVy?=
 =?us-ascii?Q?OcPwM6bP4YQPdRzdzBPl0lxuYoALO4y/DT2nlckacIW3LAy6cLQG2MpZGJ2K?=
 =?us-ascii?Q?cJG0yFT4kBXrKWyNPphOdBpVPC1oATGBMHXu3AqqL35dIL5wz0tqLxNngu0m?=
 =?us-ascii?Q?Mxy8fe8+qRrzKbmxV2unxndVlC2wP/l/lBn1L7Fh0nYrvuOHxI9J9uwgPfKz?=
 =?us-ascii?Q?+fir0Jum/pYGnkUWRhSYTPsQTtogvaKFRKhBMXfJfs63h9EoxRX1gEi6IuOT?=
 =?us-ascii?Q?MYMd/Y6BHgPU8Ae05Jsk1ObKWiu6144pZEMFcfZXCIr1r+heCeCWRZ43aCAk?=
 =?us-ascii?Q?8cPG8TgdTjzIndYnsjpDyeV8vorn8U86t61Ar3BuRqlEjCFYJmTqYvMRNyB7?=
 =?us-ascii?Q?IfqwI11MnEDr5ax35YRzvrLjChjokd2aW+c8JJYyzcFcS926hL5R6si5ulSf?=
 =?us-ascii?Q?wUKxR9zS4M/mDt8GrM7FOaPGTDZrEp7oGjhtKj0u3AUDf5n0CHG64xjGOZXB?=
 =?us-ascii?Q?mBWYxBK2Q0kQ1gJvAYvuNRgPum2rMs3Es/5Ha4Ux/ZVG8cjkQb3doBV1Eawr?=
 =?us-ascii?Q?PIDUJpgy0j3r2e8FRF9vEwPOYTvJpQn6N3GH8bumJQwDGN5SuWCv9DLmf+iz?=
 =?us-ascii?Q?il3wlMxphpAgHy8viltV/7NIxrOZjDECtKuVGD/lJGuDOrYwuzN1Ohv7uoRA?=
 =?us-ascii?Q?DcDWR2ol8ZmTfDty+2460cpUoaIfLsrk6kBXKPl3b/OaVzGQ2xVYJaA8hbWc?=
 =?us-ascii?Q?JeSTQFkCxGSIwoPCGDtpK9Sk68IRolrRSp90TQvJSRzGpTVSasxCeQCTW6Hk?=
 =?us-ascii?Q?nTtORZXmY1YJoBhxm40+EZpgQuAwHC5K7SFLW60tufJ5zgScUtN2511KsQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:06:44.7515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6c2c03-be90-443b-26f1-08ddaabe33f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085

ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
Bits Description
15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
     Monitoring Counter ID + 1

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Detect the feature and number of assignable counters supported. Also,
enable QOS_L3_MBM_TOTAL_EVENT_ID and QOS_L3_MBM_LOCAL_EVENT_ID upon
detecting the ABMC feature. The current expectation is to support
these two events by default when ABMC is enabled.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated enumeration to support ABMC regardless of MBM total and local support.
     Updated the changelog accordingly.

v13: No changes.

v12: Resolved conflicts because of latest merge.
     Removed Reviewed-by as the patch has changed.

v11: No changes.

v10: No changes.

v9: Added Reviewed-by tag. No code changes

v8: Used GENMASK for the mask.

v7: Removed WARN_ON for num_mbm_cntrs. Decided to dynamically allocate the
    bitmap. WARN_ON is not required anymore.
    Removed redundant comments.

v6: Commit message update.
    Renamed abmc_capable to mbm_cntr_assignable.

v5: Name change num_cntrs to num_mbm_cntrs.
    Moved abmc_capable to resctrl_mon.

v4: Removed resctrl_arch_has_abmc(). Added all the code inline. We dont
    need to separate this as arch code.

v3: Removed changes related to mon_features.
    Moved rdt_cpu_has to core.c and added new function resctrl_arch_has_abmc.
    Also moved the fields mbm_assign_capable and mbm_assign_cntrs to
    rdt_resource. (James)

v2: Changed the field name to mbm_assign_capable from abmc_capable.
---
 arch/x86/kernel/cpu/resctrl/core.c    |  4 ++--
 arch/x86/kernel/cpu/resctrl/monitor.c | 11 ++++++++---
 include/linux/resctrl.h               |  4 ++++
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 22a414802cbb..01b210febc7d 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -873,11 +873,11 @@ static __init bool get_rdt_mon_resources(void)
 		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID);
 		ret = true;
 	}
-	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
+	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
 		ret = true;
 	}
-	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
+	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
 		ret = true;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 42a9e3cc6654..a6b9a6ba036d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -339,6 +339,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	unsigned int threshold;
+	u32 eax, ebx, ecx, edx;
 
 	snc_nodes_per_l3_cache = snc_get_config();
 
@@ -368,14 +369,18 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	 */
 	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
 
-	if (rdt_cpu_has(X86_FEATURE_BMEC)) {
-		u32 eax, ebx, ecx, edx;
-
+	if (rdt_cpu_has(X86_FEATURE_BMEC) || rdt_cpu_has(X86_FEATURE_ABMC)) {
 		/* Detect list of bandwidth sources that can be tracked */
 		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
 		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
 	}
 
+	if (rdt_cpu_has(X86_FEATURE_ABMC)) {
+		r->mon.mbm_cntr_assignable = true;
+		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
+		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+	}
+
 	r->mon_capable = true;
 
 	return 0;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 22766b8b670b..c0195498bd4a 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -260,10 +260,14 @@ enum resctrl_schema_fmt {
  * @num_rmid:		Number of RMIDs available.
  * @mbm_cfg_mask:	Memory transactions that can be tracked when bandwidth
  *			monitoring events are configured.
+ * @num_mbm_cntrs:	Number of assignable counters.
+ * @mbm_cntr_assignable:Is system capable of supporting counter assignment?
  */
 struct resctrl_mon {
 	int			num_rmid;
 	unsigned int		mbm_cfg_mask;
+	int			num_mbm_cntrs;
+	bool			mbm_cntr_assignable;
 };
 
 /**
-- 
2.34.1

