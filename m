Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CCF1F5846;
	Thu, 22 May 2025 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943558; cv=fail; b=ZK7Xo/j66z+LfzhY8C1aBYgRvawjDnL9Pv5cjEk4CC336o8pSU6USyJHnZY642GxfHNq/2/QdVxrUEUtXFH/JDPmEe5MwBqvlQ4pe3Gfw8+kK2VgdKI2bqfnlvVhmokxBQzhdtrQVGNbpbvCAtuB/de0nAjFm7ue8TBhFHZcfoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943558; c=relaxed/simple;
	bh=KzRZaqNNVBpv3S7Mbh1Hshr/L/ANDadn4Rk3+ek17Gs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEh3Omd6L2dAQ9RftwogcjVHVS3/3hPgSU7/hGBUWv4nFDQBmCcGlFFgaManazZ8ZRe6Ni5UWa2MoW6EDtDX/lqA93nynSlnp9yDYpPJ0TJ4OUmiO1AXwLd6LNOUb6+hjA3nVdk/i1qPG55KhYGTrXIcxvznrLBn3iPU4BmJpnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oRFAR2ph; arc=fail smtp.client-ip=40.107.243.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oRFAR2ph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7+QQkzYyu8OBCrhpz3shPeJWd4EpuTN00nBskHdzy8pRN4tm+DmwMzGGxdigRhnqYBKZUghZqt5lbSTQzObJn5Sl8/LD93KfDkDhNtH4tKQPwY5a+1JTbzZ22D7QR6he6oMqsjD2sFVNPD/n9L3L8pwkDyhX8u3bWevodNHuNS/8lyBCX+ql9HFVPegZg2j/5X/LItSgwaTGA7thm+0daLGKUi6JnKaPZFGGrUE09EvqgBc10uruLmXKFbEY/c57ZJcl18owKYFnTAPqw6nDBRlAxIEG0FbMHtHdfEpVl026JfJ+bVot3ZoFrWmiD6mlZ3I73EsPfU44pDOveUrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijR2YWPKSDKKKSK+UWeyZ+ptR0FhbPrdbj2Wfb4wRy4=;
 b=ta1Q5YUKebI8TeUjHTQvIFQG/jAflkSSYu+Rz71UheD0lQS4dKd9bbAxP4BycsgQNwIDb1ERSvbVlAcWegMeOdXl3VSbNPAKOsFbR9EbnEnXf/5GR+n90E2fVTclNLcFpF5pjZLIUqyfXvpPN5xPzEY5hn9paNfFnO1QknVNWobj1lO9chWICkBpilhIBDpSaS+HT2mypl4avY+FPNh5md4QZPOCpjATKClKlhLaTtXFmnxpQ39jsS03h4bzKSKmEew/WQ1zjgDIzYRtgn/U0anQgj5XBOP7iDXwLuaUPfkkPpHasrewySDVgNJhWpXCHqOhtyZENHbKjeMsg+Q8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijR2YWPKSDKKKSK+UWeyZ+ptR0FhbPrdbj2Wfb4wRy4=;
 b=oRFAR2phQLrd6+LvUUsS3BEX7DMjcECGRvTklNr9rdLGlc7FNpbIoK0s9KBPKTL2gYsorZhqenegUQ52mGoNt5i/TFa/w5yzt7xeGkrIkrD/tTQFOii2V6Ly57rlqRi+CbeK6GTvVfRNl8mKo8zlqLcQXOo7X1l41v/TaLX16cc=
Received: from SJ0PR13CA0151.namprd13.prod.outlook.com (2603:10b6:a03:2c7::6)
 by SA5PPF6407DD448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 22 May
 2025 19:52:34 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b9) by SJ0PR13CA0151.outlook.office365.com
 (2603:10b6:a03:2c7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 22 May 2025 19:52:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:52:34 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:52:28 -0500
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
Subject: [PATCH v5 3/8] x86/resctrl: Detect io_alloc feature
Date: Thu, 22 May 2025 14:51:34 -0500
Message-ID: <f9d51abe3ba54a38ddbf6ad2a8c98d65ffd6b672.1747943499.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SA5PPF6407DD448:EE_
X-MS-Office365-Filtering-Correlation-Id: 820efd53-6ca8-4b09-6af5-08dd996a3214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OZKgp18mheAOk8+Hr8imekEPqmosQ0miFr5HvxouZ6yGSLN6aAIL7MK807fe?=
 =?us-ascii?Q?zs1+nDmvm7g06tCcv0U5A/u1kQNJcXFYmQ03Jj80EB0NXMYTx7Ou6MmvZ5pQ?=
 =?us-ascii?Q?A4CSsCiVDDdzST7MaEG+0vWSPWXfHXyApYsbVa76bT140RpV+n3oniNQC+ji?=
 =?us-ascii?Q?va1PN5/TJ1CJzg7llxGl7KyTNodF2S1smH5S0T3JPxH0L9TyFyc4Sp9nlBPY?=
 =?us-ascii?Q?C5GxOR179S9TCLUKmHSv0mFA77EKHreTrZHWqB29B/7yLcg8zlHExPSJC0ID?=
 =?us-ascii?Q?P16JYFz4TeHyDlWip+IbNZKe4/LyJo+lx/vHPgxRVK4xkHBME2bqjQ4atnRY?=
 =?us-ascii?Q?15StmMJiUUC2zSWsObSAAM1E0ewr0+bbrFYjkrsNTO/O/UBjxFvlovnxAn3B?=
 =?us-ascii?Q?S/Qrp+auiYRzY//ZTvlm9OpadLnYDjHbXis+kh1XEZ+akcqEzpHj0hB/2cAJ?=
 =?us-ascii?Q?aDVQjdBdXx98a9O1d3yiCYoG7rkoEx2SApO9u0wLcT+YPX6+QwW929FzP5IV?=
 =?us-ascii?Q?s0sQ6WC8Cr7QqT6sb+mk0MJAkwOPa7E/KsgHGIKii+qvZWdmsRu1PKnZeZzn?=
 =?us-ascii?Q?/6dYXbdgrkPgM6o3HBP/BcnjfY5n3nSXGzHvNjbyPr76jRL/2syO9alxseSk?=
 =?us-ascii?Q?Lh//qRzgSnxXs86d+Bv1FmrwWjQclD2MMH5kbzckKV6raqaFqnb3p1phVaU4?=
 =?us-ascii?Q?zQaKcJpXwgk0f3TIHInfezPNb+W2frmdXI2fbw1PFLf7YiOtIOkGITHok18k?=
 =?us-ascii?Q?RYp15QfFO7FZrYoA4cm6oSRvBT7aXS1/a9FRSNQXsOSzW9/CxYf6kCT78Mjt?=
 =?us-ascii?Q?z/nm7e7BvdKM4lEWYn4rpmcTR1oC7nmEwipbyJi96jG3pXGCJpeJ1wjgKZEI?=
 =?us-ascii?Q?ZFtRSZyaCkWydosvwYEXtCK+4krlPTlgEfrH53UE6HJLEsZt7W0/PUtTJv15?=
 =?us-ascii?Q?fJcs91Sn4NMv20pD2vHPD0TTFZxuSsfalVqm3xwA767GWq4sI5ah4A2mPVgK?=
 =?us-ascii?Q?igq8f7LTtP/4HrQUIafqH+JvChcEWlFLJ7Ie0nrMNjIJ7Zgrkp8b783nHMmO?=
 =?us-ascii?Q?t82lAvY2qWmaXmFc1qeivZURQhWcmj5BigRuu1xJzuHeBvxMK3gI6tVfhdKy?=
 =?us-ascii?Q?/SiOnejAOmQf04v8dQvHUaejWZVHoJdrWPlPqZRDQtjpfndBuSHnG8ftJHl1?=
 =?us-ascii?Q?EisrTxQ0cGoC61B4vSvX0ZapkZHN64MKrF3q3MJeARGj4R/hoNGJAP8IeLYX?=
 =?us-ascii?Q?2893JO2dvp3meQNLRztsh/6nDfJGHiNhe2fyzHOV//fl09CyIG60A6oZ/fOX?=
 =?us-ascii?Q?u3f/+YVvwG8vVaHrtY4vo08cpPny6guusxZDnOtMZ+NgaqIeIrI1qqHvzGMI?=
 =?us-ascii?Q?sVhgt6mGPGR3fJLoawsb4WRDToTRYjZYQ3Qy32Lhbg7ouA+CM22oREUrROpJ?=
 =?us-ascii?Q?xOvUjpmC+q6OtQp/xcyefWCX6OH8sPFTRieeuaH/9H27mecbRTCtOtSr7p6T?=
 =?us-ascii?Q?nrbkZC0xmwvC7n/rFwgHuqbBd9RNeGxmOS3w?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:52:34.0942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 820efd53-6ca8-4b09-6af5-08dd996a3214
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6407DD448

Smart Data Cache Injection (SDCI) is a mechanism that enables direct
insertion of data from I/O devices into the L3 cache. It can the demands
on DRAM bandwidth and reduces latency to the processor consuming the I/O
data.

Introduce cache resource property "io_alloc_capable" that an architecture
can set if a portion of the L3 cache can be allocated for I/O traffic.

Set this property on x86 systems that support SDCIAE (L3 Smart Data Cache
Injection Allocation Enforcement).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: No changes.

v4: Updated the commit message and code comment based on feedback.

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
index 2161520114dc..1cbcf70d6036 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -273,6 +273,11 @@ static void rdt_get_cdp_config(int level)
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
@@ -839,6 +844,8 @@ static __init bool get_rdt_alloc_resources(void)
 		rdt_get_cache_alloc_cfg(1, r);
 		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
 			rdt_get_cdp_l3_config();
+		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
+			rdt_set_io_alloc_capable(r);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 9ba771f2ddea..0e8641e41100 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -191,6 +191,8 @@ struct rdt_mon_domain {
  * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
  * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
  *				level has CPU scope.
+ * @io_alloc_capable:	True if portion of the cache can be allocated
+ *			for I/O traffic.
  */
 struct resctrl_cache {
 	unsigned int	cbm_len;
@@ -198,6 +200,7 @@ struct resctrl_cache {
 	unsigned int	shareable_bits;
 	bool		arch_has_sparse_bitmasks;
 	bool		arch_has_per_cpu_cfg;
+	bool		io_alloc_capable;
 };
 
 /**
-- 
2.34.1

