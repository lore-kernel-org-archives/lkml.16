Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02657272E6E;
	Fri, 13 Jun 2025 21:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848920; cv=fail; b=Xe1q+tjnPhoKaEYM8qPTLZGqblM7dw+gQndaD1n+6QtbPT5l+Aph1X0rqlDgY2JUwzkDJLuetKyu1LQrpe8Ulm+DDYehNfTX5cwufRpAjpf5ASm+fXAU7casK2nnEC1nLi7Mn1Wla8IetB1Ss5Ql3bNV6rYXwoGT2DycRPGdP/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848920; c=relaxed/simple;
	bh=L31aCqarey28i9I0CJ0sm9LRpN7Jd9evSz6Oyp/Hu7s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KE0Jyg3O0DL9CRRWvWzDd1tlfrJQNddd1JFpCEfzZC22Z8ZYv8jYaSb7vmG5a4Unu2cBB+RzVwmgfsi0DNRzMEjKLvcO9tekjnPTlnsT0SZChZxgigp6Wweeu79c65JUm/DS9K7wO7pylfxjlmUhfPYPgCOjTKujHMypNHC0zKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zsdl1yUT; arc=fail smtp.client-ip=40.107.93.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zsdl1yUT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1PA3YxpnkjxfCMmeqbA1tg/7YZzhGnWlVrr9pq7ArV/gDR/wXnTFejt5PQYQvoY4y60acDtsH1B9S1+JAEzrIGVXO9Q86TTgQwEnz0VtbloLRJEdFnZClPBgEOaqb1FX+1gR72+ZvOgxKGJCDthVGrsWggXo4h/t9EagYMz4C2wlVUvueoCQviRH7oJhT8yJLXagOWKvaFnbQmmso3n+Zo5l20h7/A+f7FRvRZ7WMXg97TYTC0PSVY8qX4EgfVu66Ctf/lHxU6iprWBitc4eZihXvmjWZzZcqCAjFXOXREinnCuyGHrXY3hXiI7QgytEjB36NUa2H5cllBnK1oMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6U8LdGvGhXhlsROb4YPBU5C5QiAFKLqBQXF5uQ4Y/0=;
 b=L9uhX2P5ou4LD8juE8R0S9M2C/GQ9LcwWcTNpO5J4HkIDKfmnBCdPabCJ3Yz2g4a/duO+BgoKPwl9XELDVGPhpWELEQJ1h2SuzuDOOK0SncGn6pmCTV6CSPSkof1+gLYDO/O7iIgIINiq6HTqTuXk2wg4VnDSYKgrVFfmray4lGsJ0PCrbsWWEHvR6jQYpnJKo1QxoIeADVrxOCF/6kfOukJ4lAO8zCfkM3eMfSyAExhsLwOxTpHAEWb3qattPRi8vNeEeQ+a0C5Z7PFtYvGHuHD2WGMOw4qYc40ludLPpuYHSFsNAGSkKLgIH3YqVPtfFsNfofrJitg+i2gSfiGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6U8LdGvGhXhlsROb4YPBU5C5QiAFKLqBQXF5uQ4Y/0=;
 b=zsdl1yUTcnxFNoMB3K7gdYCknRQAJ+Huu+ODdDMS4XLf+jVh/Q5imNe3niSW5RyRQPStZpKIUBOBqKLX0pVt7wZRcAtwOGk4JOdLlAokc+1JgNZJ3ntwRiQaIS2gPb8P9JU0BjKLhPVgBVb3Z0dtCEi59IuROnEL3rQpcpiiQUY=
Received: from DM6PR05CA0052.namprd05.prod.outlook.com (2603:10b6:5:335::21)
 by IA1PR12MB6043.namprd12.prod.outlook.com (2603:10b6:208:3d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Fri, 13 Jun
 2025 21:08:35 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::6f) by DM6PR05CA0052.outlook.office365.com
 (2603:10b6:5:335::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:08:35 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:33 -0500
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
Subject: [PATCH v14 23/32] fs/resctrl: Add definitions for MBM event configuration
Date: Fri, 13 Jun 2025 16:05:07 -0500
Message-ID: <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA1PR12MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cca4e14-b7b0-47c6-8e39-08ddaabe75d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mZSjyJmefS2C4j5R4YCHp3+Ypv2kcAe8U+ecNtr5pnL/XnsUHklOHfE2nThp?=
 =?us-ascii?Q?zdz0fE8fD7mxgV65WOuNq3L0VY5jFXn5myTvZz5pRyakdaNgfeu9JKwZNbBi?=
 =?us-ascii?Q?eefyELp7w1Kv5rd+CiiK4QXnLXouJNdRWPZIBYqx8o/XcAMDp6MrucdVh66F?=
 =?us-ascii?Q?6MP4uj3bKOQq6JHlWl6fD7sD58mHj4PtnodGq/voxigweyExbpllTtOM9t0B?=
 =?us-ascii?Q?QMTX+1EmSKPHVcffnueejSZxyvMVxxrDD5IwS4UsQfiQFhdOCd4HW6obcuFe?=
 =?us-ascii?Q?9YgvdIf25axH1J2na4oBzoAF+f7eAyIcKzoojxVsgV6ZEsK1EWScwFFSAbl8?=
 =?us-ascii?Q?mKAhCAdzTHo3+NWKPCYg0ab5UClehmjdrrqbXYc0iMJT7jaEaWDMpgkVt68O?=
 =?us-ascii?Q?/oHyGL1ycgYDbfHOAHa3JCfE4cc/+uudglFm0yuBk1fFdEWh+1BnwJFBuTs+?=
 =?us-ascii?Q?NQYu0/rJb6peAfxTPot1zxdpdeuius+taTC3K4K6712+X9FF44yOqrJiodO/?=
 =?us-ascii?Q?dEzHQZ9amnXHUGz92CqjhpkoHCeU8NYgBpu49HZqnXZR+40nDe69Z5cu7OIh?=
 =?us-ascii?Q?x3HuB3u8M7qCfQXc7dvJm2v6eO0aqjff0mVJtBWHIRVqh1iT6WfELTRVob4+?=
 =?us-ascii?Q?7yvFe1lcr52ucfWSrTSPYhD5m81Qn/bfE+kL0VKP2NT5H4mpArl3V8fymXbI?=
 =?us-ascii?Q?TyaM2JJ/Tg3Xpu/cLgv0rlW1iNuvrt9L7vXB6YMob2Yb3EVGjwCG1qYmBNrP?=
 =?us-ascii?Q?6OM83yY6FasWUkhLyxoikVerDclmUPlAwQlxI/awrHAU6nqCcWIpIZH1qITY?=
 =?us-ascii?Q?0E9leTdp0Oe/tpKXSpP3k6HvYSQtizer6lB9oGgpLEwmE04mmXdlXhg1o1TC?=
 =?us-ascii?Q?KDjZhOybv+Rj7v6A/Wz5u/pE803cyrM+LC3pZ38DRUFJqqvQNrWhc6qhtOVj?=
 =?us-ascii?Q?z0bGegwwl7JBTlC/Ndf9O7l/msEDH1Me7e7F94wHbTll2hljxgCdD//63TqN?=
 =?us-ascii?Q?8NqXgsdp9TCnIYlisZaN4LraVA/xhqQI4ttbyn2+tm5SOJOj7pYPTP1YRLA+?=
 =?us-ascii?Q?IsTnLo3Sw8qcRF/n29pB6rzUEhYcjn05i/c57IPFPANWe3TT1ACZbF7bfpsx?=
 =?us-ascii?Q?SalK81Pp2QT59taKLD8cBQPW6k9y+kV8kRiQGPwgisOmQAcnTTuqSeVkEE3e?=
 =?us-ascii?Q?EM+da96YPpgu74qjbs2SouX+A+52DKaRGtcwHF8Nl71qenFokkgESqLbiyHF?=
 =?us-ascii?Q?de7ls+BUfALmRq4gdYs1VPSt9gAqYiVVXB3l/fe8KfELuJIAXtx8AXq2c5cu?=
 =?us-ascii?Q?puQ0mu0YsR3NC5pcNCNZ8CHX1RJRBrhCN4+ufmVZ2fbuGwl36XKLwRFrM1y8?=
 =?us-ascii?Q?Tma02AYwsknSa1WyPi2asxmjkGrbdGrEk0tabkMkN6cswRkdk/pRebIS2NSI?=
 =?us-ascii?Q?U7m9JUPAL2IssRpqU/jr49G8Vk4VZHjse3fo+7DD//VeGUih5eTRKS77jgw1?=
 =?us-ascii?Q?rxUExWAMtaUn0pwAKwIPdyOT0PTiDO9I8WFgZ7u6HQFnU3KRdIRdgmxD5A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:08:35.3076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cca4e14-b7b0-47c6-8e39-08ddaabe75d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6043

The "mbm_event" mode allows the user to assign a hardware counter ID to
an RMID, event pair and monitor the bandwidth as long as it is assigned.
Additionally, the user can specify a particular type of memory
transactions for the counter to track.

By default, each resctrl group supports two MBM events: mbm_total_bytes
and mbm_local_bytes. Each event corresponds to an MBM configuration that
specifies the memory transactions being tracked by the event.

Add definitions for supported memory transactions (e.g., read, write,
etc.).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Changed the term memory events to memory transactions to be consistant.
     Changed the name of the structure to mbm_config_value(from mbm_evt_value).
     Changed name to memory trasactions where applicable.
     Changes subject line to fs/resctrl.

v13: Updated the changelog.
     Removed the definitions from resctrl_types.h and moved to internal.h.
     Removed mbm_assign_config definition. Configurations will be part of
     mon_evt list.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The rdtgroup.c file has now been split between the FS and ARCH directories.

v12: New patch to support event configurations via new counter_configs
     method.
---
 fs/resctrl/internal.h | 11 +++++++++++
 fs/resctrl/rdtgroup.c | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4a7130018aa1..84a136194d9a 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -212,6 +212,17 @@ struct rdtgroup {
 	struct pseudo_lock_region	*plr;
 };
 
+/**
+ * struct mbm_config_value - Memory transaction an MBM event can be configured with.
+ * @name:	Name of memory transaction (read, write ...).
+ * @val:	The bit used to represent the memory transaction within an
+ *		event's configuration.
+ */
+struct mbm_config_value {
+	char	name[32];
+	u32	val;
+};
+
 /* rdtgroup.flags */
 #define	RDT_DELETED		1
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 08bcca9bd8b6..5fb6a9939e23 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -75,6 +75,20 @@ static void rdtgroup_destroy_root(void);
 
 struct dentry *debugfs_resctrl;
 
+/* Number of memory transactions that an MBM event can be configured with. */
+#define NUM_MBM_EVT_VALUES             7
+
+/* Decoded values for each type of memory transactions */
+struct mbm_config_value mbm_config_values[NUM_MBM_EVT_VALUES] = {
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

