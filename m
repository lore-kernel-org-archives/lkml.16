Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2063.outbound.protection.outlook.com [40.107.101.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F928CF7E;
	Thu, 15 May 2025 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349719; cv=fail; b=V9q3//bSr3LID5vwzj6R0rhroZoL9GqxC+uzX4q4GlWO747ScKBIXhMfcKT2eygTq56m3IMMiUtideTnhi0cUeruW6cbvgbARmbiDZTxTCJn0247PTQZBIdAuhZP0JYnKWt7+k5pnkYdjafVYvY0ueNi0Ib7SbD188Wc+Jxk7PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349719; c=relaxed/simple;
	bh=17VPuDKWOmGfCle6MiAqUDMK8zO8S27U0plqOFmOau8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CqY7WWTh+kqumLEQxJ8oz7Fw+CeeV+By8Oodxgw8vuXpjupu/m/cRw9lJ/rGju2gChiR1qzs/SmO26GG5p39nn8R9nhkp9naxM1mZ68o+tDYt22kKGlSNRNPkgKM9fpbQwNEhSVWZERGxMiKqLT5cWou4uTXGFtf57mWpKw4/zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LRY+Yhc/; arc=fail smtp.client-ip=40.107.101.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LRY+Yhc/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psHwJygHShOjNz6SN8ZMSc2XYKbhn1Bo10KBOWdh2qHat0LckdYWA4JFMMYEBPt80ZKWow09tqTBm49BFtSGCV+ZFEnShT1xR+vp0lUuMU1o1KxepZhnziVxetrovzltRMlL0v3PjG9QjvQhzPGkk0+fmZfTh3NUJgqWeE8F+xeVwtq8E8Ahd2dlLZCA2dKt2J3vX29F4MufIpukRu4od4jHSdZjGeM9NpMAY7hQGPlnIZKVV8tuLVJsASNScjMvYOvL6JtLun8qr1FhE5rKKjKdxc4rJ4sKsuFyegKK8o5FrAB8XAoRMhLc7j0IND+Y4dhbmjxavJXeHATb/FTXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80cyqy5wgwzi6+JWcbAFUq8N6Pr4PDBXGGue+0x4X9Q=;
 b=L7Fn9cn5hnhVlkgR6E3Fi8S4aZzmXVtAwHfaLAhQND8h1dk1tmCHw/oN9sOwBcuZE2vw9nmZaR0KQYuzg6EbPWR12Nf03/o5Ii4UmNKCa8KXYiU8bM5CDUl24TFWP3wRdHneph/PdnQOA7mKY6xg3dCfwtbCKgAwV3evJP0fSVyZ7mFgGMo7YxhhxkTgGX32dQS5ZLZMAxoRnivdL08kKfCKECtmSeUoGwT1Cki28w1aX1zx54L3hkA6iR3BNi+MAfCJDP/NdiezRNSBYmnngrB7LZEU3vDkkFyogWKwKId4dgvTHRNUVy93E/ZqCxbbcX2RzUQtb7NlYEPLsqevYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80cyqy5wgwzi6+JWcbAFUq8N6Pr4PDBXGGue+0x4X9Q=;
 b=LRY+Yhc/Eu6dvZCHwNiQK9epKTmz2ddv9AvEyOFIqAy7P4g8v24425PHouxETWaT75S0xzeJLeew2Y/Ks211o92TDcSoQJz+d2CtToiwEb0U/SFjwXVaLvNfzyFNemy3CpyxC5LO4tT5SbO1IWthjJxPBS+3idgmF55GujwyEMk=
Received: from BN7PR06CA0064.namprd06.prod.outlook.com (2603:10b6:408:34::41)
 by MN2PR12MB4270.namprd12.prod.outlook.com (2603:10b6:208:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:55:14 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::e8) by BN7PR06CA0064.outlook.office365.com
 (2603:10b6:408:34::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Thu,
 15 May 2025 22:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:55:14 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:55:11 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <babu.moger@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
Subject: [PATCH v13 18/27] x86/resctrl: Add definitions for MBM event configuration
Date: Thu, 15 May 2025 17:52:03 -0500
Message-ID: <8e9f18e1bba578d74fc3e3cb887c5101eb73e1d7.1747349530.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|MN2PR12MB4270:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c754d9f-7785-4261-8ef4-08dd94038dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iz+VkV08Frl8yLYyQobeA5cxxD9LJRZKt5fhLmuVV9CCZa6rirJbGWGE2U4E?=
 =?us-ascii?Q?dHnUowwxx+b0PNlzV4vHJkW8TOIkYtSBLVqjO4nFOvQILnmc5nsXLXEfFsk1?=
 =?us-ascii?Q?jnrlOe+RCg6tel3KYc4L2f/lH+ZRz0pfmWn3HLzLMNwMxqLMGnjLOvc1viVB?=
 =?us-ascii?Q?KK1tRt0zrD3yrBTA2xWGMeVv9fFR5oqslylqHL82bnKtALi51/pU8Kauxg7v?=
 =?us-ascii?Q?d1hpUcq3oeKUseUL3V1PtVaflTCmR2VowfL2yx2vsB8tLiDFZwj215qd2+OO?=
 =?us-ascii?Q?V8XnJIVZWEz2qODNX8W3zBHC/lur+5AJy/ZI/pIQdnU4+UcYw6UfyjJo9f3b?=
 =?us-ascii?Q?Wq7hi56A2UUThE1VcvwQTS1/aTTkT9Mov5RuaxRKKIOI5S0Yn3w7Dc5EjbCw?=
 =?us-ascii?Q?joyGcH8N80S8eb7doqqGfx3np/pdDppu7/g3YCqjMoqByyzdTg5znLzvVXSM?=
 =?us-ascii?Q?n/GpQNJEbrthSXW6UXksM7p7UB74UaGxvW7aebOy2qnDmkNgyDr7ZUFGMikO?=
 =?us-ascii?Q?r5kYFIYRjBQDmzdrlbVCyTtx4F+72SnZgS5mQN237RmuxCE2HWaHjfg4uxXl?=
 =?us-ascii?Q?ojKV33q7XYqZJih3AL0Klxf7lPQq71fCsCFn8K8aKVgAuVCr4GlM7DcZ6g9L?=
 =?us-ascii?Q?u8kcsLzWTvufIoV/v61tT3w7oTsbCdwZFM38TLKXL2K8zYzo2rltEUhF+BRw?=
 =?us-ascii?Q?LRxyfLJtiQtTqQBynvj2DwFQjnf2zBetBrIvX2Mv2HLOuksMBRvnJAsiErfR?=
 =?us-ascii?Q?RmoChkWf4y1g7Oy8QhqAiMebWqmJDxSZ7OtwYzNIXqqRJjz9c1qAgBnpOE9P?=
 =?us-ascii?Q?Ow39k5RfoX1JgheVMVWrB66e95W9ejABpHlVCiaHDUxCDaC6PucBAN7NZzmb?=
 =?us-ascii?Q?UyGy33K5PbAtFScIYWeSVJUfp9MiHgxo9TEj5PrDo/NUDMZwGpQiPoHdSWX+?=
 =?us-ascii?Q?AQ03m8ScLyZUqJkzaTXWN/h4wc37YMSRvfAuhchz/F2TSuXDMMuFY++xCwUl?=
 =?us-ascii?Q?/mxI9jQ5V4mzlZAXtu82vI3tJSTTeNZfWiIjrW8QfRa8kOSrmQ3FeCXgmxM/?=
 =?us-ascii?Q?5feMgiY99krHm7hcKdK1P8hPZp9o3X3dtmybFfxR4i9yFFsfJiJUiCMV5iN7?=
 =?us-ascii?Q?P4XFDb/zzIGyyon5Php/AFM1MBcuhQKCfSXYAoyrvQbTS2asocO9tgW8w8uE?=
 =?us-ascii?Q?OPkGv099F9yg1xOmfsBnoSU7ABTh9Jz0IDKseaAz2bCmC6mD/cvbeGRGC8JA?=
 =?us-ascii?Q?Yr/wN9ZZlhx+5iHIIn15UvMnHua5eGVTDEs3KD3KJQ59yaLc8GMrmkmRAxVZ?=
 =?us-ascii?Q?5cVYOTupFRa7p5bdzWhhPS2rmUbiyGkX8hCFN3R6o2DrZ/WeqYhfaVz0dlEH?=
 =?us-ascii?Q?SzQwUJoY/Cs7iQkcrDwQJ30B+k8Pe3NlQ/kvLWU/XL+cRviYhFwhOCorES6R?=
 =?us-ascii?Q?IMRfHrTeq2n8Y8pdgp4YmXAFO2zgQe0KSqwCHVw5wGdMz+M8FdMj9uhpwpTD?=
 =?us-ascii?Q?di+VJy9XqC3YA+ZOWDOAjSc5qi6YthVsaTvY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:55:14.3889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c754d9f-7785-4261-8ef4-08dd94038dfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4270

The "mbm_cntr_assign" mode allows users to manually assign a hardware
counter to a specific RMID and event pair. The events available for
assignment are configurable.

By default, each resctrl group supports two MBM events: mbm_total_bytes
and mbm_local_bytes. Each event corresponds to an MBM configuration that
specifies the bandwidth sources tracked by the event.

Add definitions of supported bandwidth sources.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Updated the changelog.
     Removed the definitions from resctrl_types.h and moved to internal.h.
     Removed mbm_assign_config definition. Configurations will be part of
     mon_evt list.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The rdtgroup.c file has now been split between the FS and ARCH directories.

v12: New patch to support event configurations via new counter_configs
     method.
---
 fs/resctrl/internal.h | 10 ++++++++++
 fs/resctrl/rdtgroup.c | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 0dfd2efe68fc..019d00bf5adf 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -203,6 +203,16 @@ struct rdtgroup {
 	struct pseudo_lock_region	*plr;
 };
 
+/**
+ * struct mbm_evt_value - Specific type of memory events.
+ * @evt_name:		Name of memory transaction type (read, write etc).
+ * @evt_val:		Value representing the memory transaction.
+ */
+struct mbm_evt_value {
+	char    evt_name[32];
+	u32     evt_val;
+};
+
 /* rdtgroup.flags */
 #define	RDT_DELETED		1
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 72317a5adee2..b109e91096b0 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -75,6 +75,20 @@ static void rdtgroup_destroy_root(void);
 
 struct dentry *debugfs_resctrl;
 
+/* Number of memory transaction types that can be monitored */
+#define NUM_MBM_EVT_VALUES             7
+
+/* Decoded values for each type of memory events */
+struct mbm_evt_value mbm_evt_values[NUM_MBM_EVT_VALUES] = {
+	{"local_reads", READS_TO_LOCAL_MEM},
+	{"remote_reads", READS_TO_REMOTE_MEM},
+	{"local_non_temporal_writes", NON_TEMP_WRITE_TO_LOCAL_MEM},
+	{"remote_non_temporal_writes", NON_TEMP_WRITE_TO_REMOTE_MEM},
+	{"local_reads_slow_memory", READS_TO_LOCAL_S_MEM},
+	{"remote_reads_slow_memory", READS_TO_REMOTE_S_MEM},
+	{"dirty_victim_writes_all", DIRTY_VICTIMS_TO_ALL_MEM},
+};
+
 /*
  * Memory bandwidth monitoring event to use for the default CTRL_MON group
  * and each new CTRL_MON group created by the user.  Only relevant when
-- 
2.34.1

