Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA0C271468;
	Fri, 13 Jun 2025 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848780; cv=fail; b=EHlYqBkR2kzhQy8eyAf18V7q9NOkDGrRviM/aicsJe5oRfXCS6ukQkaaTMqD6JuaBB5cdFs2BSQ93iPymtX6cDXCkWBaQlDvzlHBXE7EUcvxnd9hRXQkeySX92k+Uxjzk7HtGzvIyNf7hKzCuEwVE2b3T2i274kH4GSjz71edhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848780; c=relaxed/simple;
	bh=2AfXIMJAbzSCSvbFbO9mr/rIknpI29fWB31TWz3qi/g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQWusx4xq2npHisSm+ux20XbCFIPgrT5pGJAG3fRjDVf05WzoDHfk8AgY6Z4e6+csNTwMZTTCDlcBZB7Rhbwt93yFjuVTx/FgER4axIP8IWjh6wStGDI1v1cb7jNe8+tJO7narX8URXv6i5J/imcafU74VQWutnN1vEenBQu4dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ExviOeYv; arc=fail smtp.client-ip=40.107.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ExviOeYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3S0Xx6YTQl+ybo0fj4t0yiFI8UxJ4M6Jw1HJCXCBEd7axH189beeTY0iyfKtUBfvZxeT5H5QX2TPESMB3DETx7F0Jx7u9+6zSVegXx4TipSuH8OOxps1fecbz7VBFU4DhRBlDRmneskbLYkO6NZ8BozgdhJKY1es6LvfM0rM055SEi8bMvSYgrHc6xp8mj6ZA/6O98npNg0jla2wNn0auRJ6FMvIEJY6H6nkcnetG9+K1BYImte6N1/p6rcUJgnhelazI/lOA68Cw3UWmgWR9Z5pSlZvZBdt0ak5t9HQAAG7TsJ36kTZATiC6itt1X3SeS54plCmm4A+2l1m3t+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZUV5kIkSWaQKQ8B+hqZjhwK0i3SYQ8kduGeRRdgIgo=;
 b=RwShy8YJ/wbCioE/O8kGUnDk50TCix/GtBXJL0pu3f8efJAwQonsoPHlArQk7iTK3hHMFNYQgcJm7Ho14Ux0/O5FgpSx2q1scTRB8gFc2GyCUx+yVCJMERTh6R/dBALO7QM/2f7VskvqTLBrERR+gg2dGgU7cjqRcU1cfYa2XnS8vyGR76859AmVxJC/odPMFBnOxAer+GIRbaAdlJ8MTklCVBkeeKL83KKs+NB+otYIgDba6YXaMbMnhgXzOFSkX6HUoe2mtCc+UVUAbxAJ7nUNKWaGHq4ttKJ4dDshpipWb6MJ1M0dO55zJinPv/Wraz/5PEmoNGmgooBjGP2jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZUV5kIkSWaQKQ8B+hqZjhwK0i3SYQ8kduGeRRdgIgo=;
 b=ExviOeYvfoC/OeX9VQMO1ubRqXA3jwxy7srYAvqIuwXX+EQ/PaTww0grZ4Gv7vQwGXVrW2Kr2bf6qEU/OO1k9aFc7SSh6AX2qdINaw/Lb/3fE54Qjsv2HKJSkhy7JUQha67qAPdmiOeWvXbJGp9TvQN1PlDsuEF9G+FVB6XbWOI=
Received: from BY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:a03:1b8::41)
 by IA1PR12MB9523.namprd12.prod.outlook.com (2603:10b6:208:595::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 21:06:12 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::66) by BY5PR17CA0028.outlook.office365.com
 (2603:10b6:a03:1b8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.40 via Frontend Transport; Fri,
 13 Jun 2025 21:06:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:06:11 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:03 -0500
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
Subject: [PATCH v14 04/32] x86/resctrl: Remove 'rdt_mon_features' global variable
Date: Fri, 13 Jun 2025 16:04:48 -0500
Message-ID: <4afa6237d750493d81391173379b12d02f17f7e7.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|IA1PR12MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: f7939d86-b2d0-4460-a93d-08ddaabe1ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kDhYLmd8E3x5ISgL2+hKpJ6WagceNYk6DsGW496PGHRRmtaHuDmpFAGWqs3s?=
 =?us-ascii?Q?AoDTSOqTPWuKMGxfR3pskFNBtFe+nKKc1yu+02M9zNVoYDvAf7Fm4GWVBYie?=
 =?us-ascii?Q?0jCIdAwlDVjaIi/R92QAELEiyvMcUZ1CBlLsr9+/ggR1O9YlBiN16aArCWSZ?=
 =?us-ascii?Q?Pl9GvS7jR60VtnlXQWKckNgCB/5ixJXPX6L7M8R/RJsqBSFMCUrKdKRJbJlv?=
 =?us-ascii?Q?/1vZNkjUpJvUIfyxAAV4JoJMUiipCASN+83qne5/BszhidYDsp/C0T/UExcH?=
 =?us-ascii?Q?Q/JSoglPpl1hFG0MojpuxXdiZL90qzxd06hSC14ZKUaoTFnst7q9vgRu372o?=
 =?us-ascii?Q?qaxNKJCJanFaS30xOX/KQz/HFS2JaYBtd4qfX4RG1vj5wuy69818p//fSPSz?=
 =?us-ascii?Q?nNGR7vwCEtUmDSkJkTlKQ4ED82p2Mdwhp1RxSg2hsd2EShI7d/k0CQiXI2g2?=
 =?us-ascii?Q?3YP3QrWcVuqFdkiKzbN26c4fKLlpgcKpK5sax7X/qikVtxWUPqI71gqF16ug?=
 =?us-ascii?Q?tFR78knXi2SjLo77VyIyj9jaB/mD3wI6Ps7o7xkhWQnn+s9wC64JRw0Y9jYU?=
 =?us-ascii?Q?8KoBMGXzKRGAV9v16vmJbZ0wv85mtJsXSL65ljOpOknrwMTGmcDe/MQlibm+?=
 =?us-ascii?Q?c0Z69Ic4CNzKHhTtdBRIFZUINokh6LUcCSDXOfdGKDOjuYSl1bBog1B7edM6?=
 =?us-ascii?Q?s11n9z3xyBNtXiIwr1l9uIHq55VCKWthVMxdpJnKRG7jId4yOOc9QBWVBBaJ?=
 =?us-ascii?Q?1plSsQUV5gnToOooUDoQ+BOeIY26GxuBYCmtdRyiQNGttazrsql+DOhtBcey?=
 =?us-ascii?Q?Iv6BiHMU4mHuMBUa+7a7zU6pwegk8GzJT/dNK04yGuq3U/OTF9axXJ+RNLrA?=
 =?us-ascii?Q?YOkmWGq/tw0a5hVD9faDGGnt8jV/dfQYUGLAngfwOytCtoz2mvJhgYXi6jUw?=
 =?us-ascii?Q?8Jxic/WfYt6jZSK+JvlUlbfanHWyB6FGlfye+Rip3GY0796EEw/R/HHJKSnm?=
 =?us-ascii?Q?WgAqjnvOGyuv5lfqRTub9/TauzDH4xXEVbwShlw+I38HxP/JVLIrGPBYaLMl?=
 =?us-ascii?Q?JZ4q4EB+VDl2V0I6IJcXAlJf8lzyAQRIZag6DxXqMisif8wXOgfKrMRprsG1?=
 =?us-ascii?Q?V3fB7J1TJJVUCw/efH8gTXWlXmyw98YvAB8Q6yTuVkrXPyyhAxrz33akhDCk?=
 =?us-ascii?Q?EnV7U5D4rv8l+Y+Yf5Lpdz79TrGuOcotw8k4UJrWiUxY5BDnMUR1BKmi8q4j?=
 =?us-ascii?Q?HnQ0Ng2kw9q+T1/3aS2YBZ2jDKRJf0TPQwjeXS8jNWrbLKM4dGxk/mR9KK0A?=
 =?us-ascii?Q?5lr5K0YczjGacUW4m62HHaXOREvMjXdcvHvksow6C0KqDCdneoNk+GxV+CYk?=
 =?us-ascii?Q?dm5H2iDcw3/hRrBhlEEbsmPR5pPMa3FLhOSN6RoIBrMc8sj3tlpmrtAC5uDs?=
 =?us-ascii?Q?NKrplGtSF5ylzpzfx3HqqCP1ssSMdKXYmabaF/8yeqXnf6f55H/V27qNucb5?=
 =?us-ascii?Q?c0bIz9lo7BfAb++ntJQhSa2W9aIhXcyRGXECCHuaYJf7BReCfCvzGmtkNQ5G?=
 =?us-ascii?Q?VIJuQbnUP08D1HWPQbI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:06:11.2453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7939d86-b2d0-4460-a93d-08ddaabe1ff9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9523

From: Tony Luck <tony.luck@intel.com>

rdt_mon_features is used as a bitmask of enabled monitor events. A monitor
event's status is now maintained in mon_evt::enabled with all monitor
events' mon_evt structures found in the filesystem's mon_event_all[] array.

Remove the remaining uses of rdt_mon_features.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14: This is Tony's work. This is part of Tony's telemetry series.
     https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/

     Tony made special update for me to include in this series.
     https://lore.kernel.org/lkml/20250609162139.91651-1-tony.luck@intel.com/.
---
 arch/x86/include/asm/resctrl.h        | 1 -
 arch/x86/kernel/cpu/resctrl/core.c    | 9 +++++----
 arch/x86/kernel/cpu/resctrl/monitor.c | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index b1dd5d6b87db..575f8408a9e7 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -44,7 +44,6 @@ DECLARE_PER_CPU(struct resctrl_pqr_state, pqr_state);
 
 extern bool rdt_alloc_capable;
 extern bool rdt_mon_capable;
-extern unsigned int rdt_mon_features;
 
 DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 1a319ce9328c..5d14f9a14eda 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -863,21 +863,22 @@ static __init bool get_rdt_alloc_resources(void)
 static __init bool get_rdt_mon_resources(void)
 {
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+	bool ret = false;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
 		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID);
-		rdt_mon_features |= (1 << QOS_L3_OCCUP_EVENT_ID);
+		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
-		rdt_mon_features |= (1 << QOS_L3_MBM_TOTAL_EVENT_ID);
+		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
 		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
-		rdt_mon_features |= (1 << QOS_L3_MBM_LOCAL_EVENT_ID);
+		ret = true;
 	}
 
-	if (!rdt_mon_features)
+	if (!ret)
 		return false;
 
 	return !rdt_get_mon_l3_config(r);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 61d38517e2bf..07f8ab097cbe 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -31,11 +31,6 @@
  */
 bool rdt_mon_capable;
 
-/*
- * Global to indicate which monitoring events are enabled.
- */
-unsigned int rdt_mon_features;
-
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
 static int snc_nodes_per_l3_cache = 1;
-- 
2.34.1

