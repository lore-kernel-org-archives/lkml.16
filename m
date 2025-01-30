Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038B1F1316;
	Thu, 30 Jan 2025 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272076; cv=fail; b=frTH+45jIouSxbDkPqUZgK8KLBhwaP9TP3AjD6EoFR7yBGlaHHwU+Ybwms9G9GLbVxxRebGiPfmkHowjxlhPYd9VqAYhEs93NAjK+ut6OYxNVuo71I8W6cVLsUYG0Mp5AQ4dZcdrtXtn089o7O67UngWfNk3IdErh9cRhli5WW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272076; c=relaxed/simple;
	bh=AjiMHXZo2qpbN+KVSAB2VlA+LJECUpxY4pSOhTGfhVA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxbsE7+URqO4xKezKrKRmQD2cj0UbjyeT9XA2LfDk23ysD0qob9JIsbYTfcsUyJe+YSzyJpITwy3ZCaXJYtZMcqf+E1uWAuvRIDkQ8Jg06RkOjCr4BSNi8IZL5tZbwm7z3xuieb8MOHRU5Q9FgNsXNlX280tKRlf2uTAmFSf1Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Khms2aU3; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Khms2aU3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emVPMGGqPnqOEE8QUoYryRMDpanrIT/nElHy4hlG+zuseQFD33VqSDmXxzh6F4iaviuBwVn6WIjBSzSMOIDCifLBAME5C2hYK7vVjisFjOCIzitBsjHpjC95zIGEnsiOtoc6JlEuy9+odsT2AuupDGlJhbXQ6tUwiih9/ub8jk06fhFpzs0+sbPQpksAn8cozHZsF2hzUcyV3EQacqU2nivq9n8DghV0eJGeYqJ8NhUNlvACq9UfLR0O6KaZQLecXcVJZRqD8HJbY3jMgnmFhGIFR32DJwt3dlCLLvxQPUB6ijp3PkirX2vHvNmZ2gLgCFPqE8eKdlcY53oNfeSGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xaSyDGgR4qveCFlNpl9i9NAsjGX3pBY6SvBP8VKYiY=;
 b=vAXUxzh+S2cStLK33t7skFSmIh/5wmr93/IdXdL8kvF6D+hHr1FGhujQe9II+js+kNg9jETu58uIGyawHdDHkpNJFDZi+dQShKT7uiCHqA9P5h/+ogDSMNko7l/3fFLGypv57CvJjFqx/9QVXy40btmKT5tpKzOQzKEGGQ1YtT0hBsd/Z41jDP8Dyon+/8IIlTjtz1U2xA1Dhj228J7fujHuIqAOnLr/qeh8CNAP6+crqlaBQ3BLdw2QP1uxR627oFnnw0xfYHcFg/0hyfyXMZ7/Bkl007EnS7yjy3J2vd3Q20RT+YuBBUi2gATiRrRiNYRQ/M0jU3Anz+3gYdgq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xaSyDGgR4qveCFlNpl9i9NAsjGX3pBY6SvBP8VKYiY=;
 b=Khms2aU3nfCDCE+eXUenSgX7dMniCmYSNMZZnLPpprvv2RIgW3gQh6MwmRfULSuLdkt5x70C3UkRsLoE6qLfC+OThzZxRO+kgpYKplGwmDPf37Stxt93yGGyX9hqLVnascv9AKq7GAfIZ4MnUhSJs0g1Gz8h3Nej6fPAuZ8BFb4=
Received: from PH0PR07CA0080.namprd07.prod.outlook.com (2603:10b6:510:f::25)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 21:21:10 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::ea) by PH0PR07CA0080.outlook.office365.com
 (2603:10b6:510:f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 21:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:21:09 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:21:07 -0600
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
Subject: [PATCH v3 3/7] x86/resctrl: Detect io_alloc feature
Date: Thu, 30 Jan 2025 15:20:33 -0600
Message-ID: <3c07cd3fb7963320819e555086f701f125b55f4d.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf5be74-1809-40c6-5e54-08dd41740416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SLeRwM1fMH2VXrGGJdZM8+8EwxLaqHc2b5Vj7D6tkCamuGY+hiY3E7BLlb56?=
 =?us-ascii?Q?iEYJLunOGbUdVEgwMBViPpcMWu74bgbnaZDSmU31QcljZb+jFA41TV/wUKpt?=
 =?us-ascii?Q?31MhZx8hF0HhWe6OnMB16HM8auiMb6j7GiGuPoUwWhvhzCVTZt+rcwmosCLW?=
 =?us-ascii?Q?NZ0ZaTQUTwyoEBEdZOMgNzxrWLxsnpm56QpIQxce9NBRsASUE7Vr+IiU9znA?=
 =?us-ascii?Q?388KI4pbKzDatG5nLUs90VEzYNYfYb2HT58FOQAxXRmtaYBHwNkXD5p0a46M?=
 =?us-ascii?Q?WKfj2oLY8k3NMp3RQJy6fAFwH7qYwdwSIC20MSoAdEmQeI9yoUkWq0+p4mtt?=
 =?us-ascii?Q?DV5f8qc583zjc3b+/w44+nB+VAQ6yLcTDyNeaJdouhlsleLqg0S4FG5FT12c?=
 =?us-ascii?Q?9elBGVHiPwtm6KMMMyzE+B5iohTRdwcR4UbUwmHsuQIa1oBhQ4ki7gjpbtpj?=
 =?us-ascii?Q?oxi9FG0Mq2ChoAeNZkExR/RU7K6k9Ltud0FGz7/eNf8S/+ukC4Aa8RpRlJul?=
 =?us-ascii?Q?akrGicHIPah+4TFhJSZwsD+FEnJclQtCWyKvg+cGahvFc9uhYftt1WGHHUIc?=
 =?us-ascii?Q?twka2FmcNnshHEiWvwd7Cj0Ri/76G02BifHkFCP/xqUeIyhMpNPo5Nt5Agiu?=
 =?us-ascii?Q?meU8UMBn5RZkM0IrfcFQaF5jYxqtPBXcXX/9CIILJ9Oom9ZSTl88qezD24/Q?=
 =?us-ascii?Q?QNYdbJ/5PaZF19SNN9KA+H9/1pixZTqvNIMm7ksvfz7iU7JRDC5QZ3tnTFO3?=
 =?us-ascii?Q?UcQsOOOFsi8wxjA4Fp7UvkH3GgPsSP0ega50eOfhGQi6BAMLCHGVGQQ9sZLP?=
 =?us-ascii?Q?Zac2TubhNqVoFZy+mm68eW2qMlExyQkrJzCiPWXt77WhNqJ10FUrD/R5/8YA?=
 =?us-ascii?Q?FDBTmQAFLY2J//lyDGJ43Nr4P2UXQeTCc/iKpNqUruC075cogDZMvOhp0Prt?=
 =?us-ascii?Q?WXpm2ifu4KrPOFeApaut2RvRSuXQu3R6O7nX7Ms3dvTXIS0ox0ncw+IpKUin?=
 =?us-ascii?Q?I4/URfi/8n2J+52ieDVXWeJ2qub+xzFiIdlohGDMrz27oIuWEI1BCzcB4rDN?=
 =?us-ascii?Q?MsLHmeDiVqhD4mC3BPw5JcUQZBn1DmcyZx2wSjAQ66L/cPOCH6tM/I9VlVWD?=
 =?us-ascii?Q?q0XTEo0MYTEgPkSsInos2Q4AmqgJU/cr3CcbYsRXc23eDBG2nV2uUG71mu0/?=
 =?us-ascii?Q?72Ue5+zKYeOFSvbPawpF0mOrHFrJiY9KbTXGqMYU7mozr7sd6JgF42UT5Duk?=
 =?us-ascii?Q?YmSpWuSvf+tOVbHsERGl9XD8aYmE7BGfdeIeOoELskm1Lve70Is5/0siM6LW?=
 =?us-ascii?Q?nueKbdmeXtTo5zUpcEyoHO9P476PLvT3kXugb0uRYqQ/wmsoNTKVXXHj13nI?=
 =?us-ascii?Q?wS2nK6EfopPvJsp82yzJEtZx21vhjIQEHwYQeGgiHufAR+oxA/Sg0iNypzcO?=
 =?us-ascii?Q?GfrgKljHOow2/ujX5iQoG7Hx8L69MqFvGpGPkR8ncvrKZtcQNVqsLnXjCvsj?=
 =?us-ascii?Q?g4ooMlVtFiUNAnM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:21:09.6283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf5be74-1809-40c6-5e54-08dd41740416
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125

"io_alloc" feature is a mechanism that enables direct insertion of data
from I/O devices into the L3 cache. By directly caching data from I/O
devices rather than first storing the I/O data in DRAM, feature reduces
the demands on DRAM bandwidth and reduces latency to the processor
consuming the I/O data.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Rewrote commit log. Changed the text to bit generic than the AMD specific.
    Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
    Removed leftover comment from v2.

v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
    Also moved the io_alloc_capable in struct resctrl_cache.
---
 arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
 include/linux/resctrl.h            | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index c2450cd52511..1ebdb2dcc009 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -306,6 +306,11 @@ static void rdt_get_cdp_config(int level)
 	rdt_resources_all[level].r_resctrl.cdp_capable = true;
 }
 
+static void rdt_set_io_alloc_capable(struct rdt_resource *r)
+{
+	r->cache.io_alloc_capable = true;
+}
+
 static void rdt_get_cdp_l3_config(void)
 {
 	rdt_get_cdp_config(RDT_RESOURCE_L3);
@@ -931,6 +936,8 @@ static __init bool get_rdt_alloc_resources(void)
 		rdt_get_cache_alloc_cfg(1, r);
 		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
 			rdt_get_cdp_l3_config();
+		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
+			rdt_set_io_alloc_capable(r);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index d94abba1c716..dbe6461f3fbc 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -129,6 +129,8 @@ struct rdt_mon_domain {
  * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
  * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
  *				level has CPU scope.
+ * @io_alloc_capable:	True if portion of the L3 cache can be allocated
+ *			for I/O traffic.
  */
 struct resctrl_cache {
 	unsigned int	cbm_len;
@@ -136,6 +138,7 @@ struct resctrl_cache {
 	unsigned int	shareable_bits;
 	bool		arch_has_sparse_bitmasks;
 	bool		arch_has_per_cpu_cfg;
+	bool		io_alloc_capable;
 };
 
 /**
-- 
2.34.1

