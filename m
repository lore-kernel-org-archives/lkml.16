Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F9D1F7904;
	Wed, 11 Jun 2025 21:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677063; cv=fail; b=poEVDM4uwYAABoCiHpY2MttHiiXeBKR6X8LumzOG+aB7UzR1upeRctOxSBemvvXBGHn54WIEef98A96/2TKasWjnQtSgoqteES6/8iYSHyaOAY0BE/6ua1zLcRZ+3+BU74KVug2CS6OKDHHEk8x52O9hTlJVVmcIpD+81tFwjHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677063; c=relaxed/simple;
	bh=5fd2Cq855QzimkXAeGqDfI4dj7WrLcNxl2OZP4cgQaY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQt01RW/UDfaWRsHElcp/StUkvGOgWJ7WonNrLyvKCkPxe2mKQuV0T8YnKMRly5LW7sJhDxOdiPnegVWBO1Vft9l23kmNzmsLwXEDrrI2Ji60ptT7jLEU9x6uP9mtINfIY5aScimib2rowbFv7cA1C+CpA+N84CQlilPPZ19DR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MaO09uGB; arc=fail smtp.client-ip=40.107.223.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MaO09uGB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzrSEryT5G+t2fHSpNHK57IXeSdbYkNPtPFfoRnoHxITMUCodf+edaEMMTQf6Z+RASx80lehZH0JJSQd4ZEsN+rNkqbKDLQbDTaZVrqUgfkLcphfctFTFj/xNuWNcuqOawMpSMSEQVjaCJqNKdKZslUaLWYOYbXqBuBmiNzh33S9bjeouTbS26MvWZgj/Q9MYuunmw6htBZwlFJVpBA3C5cl7yTp0f0Rz8OGm3eqzBxe0c4Aa/J827D42VrJ+NmvODCdu6oyE4VCNFQ5dc+uJKdjGnU2CC9qgiYI7PrFr4UfaQiwcL/k4QfM8KtSD/djiC+JxjK1he3p4myClQBXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sURvzpHMy88oDCY13Fv9Uuz0UyXjf6snuAz4mtFxzoY=;
 b=j0a2L0B/b3jsn7ADoC4u7IODBxee2smvzgHwWSXM5ejQ6dgtWERWz2o8oCymoRL9hNHCUmDC0v+kv/K0wfw4088L3yQ2PajCeNRLVJQDoBWrM+nrXfZK8W2e6MunqdExSpxvlw8xRKWexDY84E+24kM+e2pBS4jNSCM/TbvpL9B4lopMFgqySwCXGVGwZEFzZCiyDMXDITA0SnO+ci51uM+kboTICYEgLfebZk4T8FBELZPb9Ch9R+rO8UEIHwUU+fklSuX6WdAdJM1HGLcdwbR40dxMqdm0CfRFMm223VO7TcQW5rRZA3AM96bDbr697F4BrFqFTMhnJdEQMoZEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sURvzpHMy88oDCY13Fv9Uuz0UyXjf6snuAz4mtFxzoY=;
 b=MaO09uGBiESGZpewXP7yi3mZdMY5KQ+cfW41KX9kNralW69LuDk3djG8hBIpiJzd+E51h8aHAIKlIjuZPQrSne7OKs01hTKclHNqpas8vYYEwZokYm4px6sWayVW+XKVIuue0emnkWD4V/qCADqUnwyNsTRGK+tlJRuNGvnkQiw=
Received: from BYAPR06CA0018.namprd06.prod.outlook.com (2603:10b6:a03:d4::31)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 21:24:19 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::df) by BYAPR06CA0018.outlook.office365.com
 (2603:10b6:a03:d4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 21:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:24:19 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:24:14 -0500
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
Subject: [PATCH v6 3/8] x86/resctrl: Detect io_alloc feature
Date: Wed, 11 Jun 2025 16:23:28 -0500
Message-ID: <8861ecc4aa962909faf07985448a333a75ca7c33.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f1d805-5cc9-4d48-6743-08dda92e53a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RddrmAjKgVa3Q6A3zbcWoeFjynlq5LS/KqT6h/yAOdab6h6gXyNPIVvMV5EK?=
 =?us-ascii?Q?n4wkZsPVEZNFFKnqC5yjYpLOtoLVXMHbbvyRFa87C3p4MWt9ZVgZcgGr9RY0?=
 =?us-ascii?Q?r+A/kYffa4mZTMaYwaeddnzVlxC+8axM3QjYXbUVwhkFMszuzjbCP0VKXbCV?=
 =?us-ascii?Q?cj28jEssBcOhZ9taE8QjglZPvXs4Aide6o/pmHtqqtkrzlZKr4Z/3bYDXxca?=
 =?us-ascii?Q?kuyQQi2VgLQ2w8Qwo5d8gamRYbirfAeOnc+wP+TImafn9LeMRx55stGLGUyv?=
 =?us-ascii?Q?nuRa/QUZl2LE+vrz49tS7f43GG8HyVokFykIcErrX1NuW4otdb3O92hpz2yw?=
 =?us-ascii?Q?LHhFz0Juj22B6v5X6ehzK446A92Aax8ZWfClRtd1VqdElvj/Q4TIitE2grTo?=
 =?us-ascii?Q?gmHLI0w2gnqMHGx7P/axgJDLxFMSvBvrFiaqFk8Gtc/EgsGH3xhJcqEw55HF?=
 =?us-ascii?Q?t4eCn59rL+dBhuE8vOLu8/35rAmQ+VbXFbOF5h86PlNiSG0+3v76Kql5fw9+?=
 =?us-ascii?Q?e3Q+VEFVr/uM5g4PvdA1Nlom+lDMc81W5v26T1Ijk8nHJ63+M10kYzbRnbBw?=
 =?us-ascii?Q?FycDS1a5Pzv2U4c9/CK6LV5EVIYdo40mbXWPHoyUKRsqRfcMGu9EQPgafwsD?=
 =?us-ascii?Q?GDhG21gvQnsuXKHjoccXembqINL7nmwhXl6864GHh6kTn3qAdrI8suBckCC7?=
 =?us-ascii?Q?W7Iuljy+RZfk2+K5sLWx10kroRC0T54cVbD1sua11K1EgPEfJJbyzGpzyMCJ?=
 =?us-ascii?Q?V+v7WYh8e/ln8PAmRsh10nh+0MeKgUy+2O+AT8h/E35NdrGxmUj1GDhVfSt8?=
 =?us-ascii?Q?8aMR9GWj9YSvefzpdL2oG5eJcs8pzyl73ZQwjZL345lDE6gt8vjlESbN8scB?=
 =?us-ascii?Q?PsUpiW6peCrShIzdzUCXP5Tv+LsdRXNBeEdVnbjIy/YWvz9Gwkq4v9Vz6CwI?=
 =?us-ascii?Q?Yuk+aE42ohP/JCqaSeaGQMymPbTWEslpwEr/nq5B/4u0iV9OPpB/Kq79wgnY?=
 =?us-ascii?Q?h+x0irxE9G7XgNxTt6ccwPA1VxkUC4HUACGK8hZFMF+QP4QgLEh6ZoGRF5Tb?=
 =?us-ascii?Q?AwVVvaSvQGwSO2d7hIf9shvVRvU3A3I/kpgOL0OyOb3msZZ136uObegq4QD5?=
 =?us-ascii?Q?CM9ttgXJACKTQsCzr9pRPyw7iP5jR8q9Px8htGDFPP9Mf3dBgeJcLqwI1loz?=
 =?us-ascii?Q?LahMydNDUDGt+/7Z8ZWiYi80u8caxAnsvYBKVI9AQyLpcR25IvLJyWLb6A8A?=
 =?us-ascii?Q?agiXokmkbIYgslHCNNRaqj2oYjjEHrKMX8pNS7qS+SvQATajpG6AD46YYEKV?=
 =?us-ascii?Q?XPRWAhBpyHviONykFA3RyZBVm2L0UhtqqujWiC7Mc01Py0iHXaHdQma4/z1W?=
 =?us-ascii?Q?XJHU3DMZkewD4THThHs3vlJ03h99MIpBQrxSbk/3CM1JI0U4S0U2u+8MJUp7?=
 =?us-ascii?Q?yERVxmmOKbAo+q/57fTKPynRZ+5I1Nzc/btr1eXrEKoEummiesHZOFFFu7ii?=
 =?us-ascii?Q?0kn8jufLq0lUumE4/OJ2b0HH3PkTgj7iVmU0XWF3H21AwdpCrzmiuok9Hw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:24:19.1822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f1d805-5cc9-4d48-6743-08dda92e53a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346

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
v6: No changes.

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
index 326c679ade5c..a3d174362249 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -274,6 +274,11 @@ static void rdt_get_cdp_config(int level)
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
@@ -840,6 +845,8 @@ static __init bool get_rdt_alloc_resources(void)
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

