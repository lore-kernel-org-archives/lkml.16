Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAF01A5BB1;
	Fri,  4 Apr 2025 00:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726101; cv=fail; b=duOlgomrskKSHwazubce2eHyv7Rwy5oUlATrxww4agKWmRj8SHEOdvJLXB/H/oZgla9G7hReGdx0Ck5T5YJerYL9X6toJB2b0f472YUpEhF3MJWqRK6vdPz/82B/9KtVQG7N98Ng7SqY1G7vOm7hQycvFpzdA+C7MJ3o1VXT5qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726101; c=relaxed/simple;
	bh=1/Bj+ShI4sO2AzkuTru/0swSsaNUDp+5/NG3k4TZ/MY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oEhIhNJJDuDET0w0u9CMncXwW0KQgRWgq8COXre3tMBn6UWaxPsUMWtN8aLpCAh5bAT5U7WiESwcffg5WEytGU9YzUyBd2RlUD0gjCNxHea9mS7yxGXDmkIRkzCBggrQRIN10pJ5P3IU0grC1OZiyDsU0DXhKoTQuKLZQ/HKKig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0EFcC5gI; arc=fail smtp.client-ip=40.107.93.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0EFcC5gI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaDarFo8gzHBm9fFAdwDojDNShOqOu5j5F8TTj451B8Qv6qHvbQuDQ4Ds2iw79EEjvxjJHh3r6Re6qaTRZgLMKQSUGVYG1dGvLJCM0UKj0qmXU4PUiQNTt2P84kgWalgzXaF7l5kVq1aUVdlYKTHdodOzfNiO7AjJ3jrr/artYo+fQu4pkQ3anKvwI/5zLUMFqYMhtLnfAdA/XJsQGyhxfbHqPAx8A7R5P14i7ryoK0lPBbGb1cAzJJv6cswbiUG1WeTnjIJPmTYML/0TKDvYlizIwJOl3bH+5IQJQ0SQOkITY4bvujKt1XN7XiI3TqQ0ZN9Cfr+PHfc7BPoXqQcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpYuzbH7CuYhdNCbHjCV8aTK2ThRj/bEr4X7569SlAc=;
 b=xxZz2sqGF31qYhj/KcsFukVQX+thaJjbubyu2oS8sQYk0SM47f7PUyXOWHwuD97nkSHPSw5/RJ2dOaP3Z6pnn8TWF8l5M+vyrn4jrOuuBRAgmIlWKmYOhf8huK5IpdIQh+2CBndpc+rMkvZbCmxkjP0JrW+6Uwd5ZlKaAdi13VVUyadrcbPsrSM7zR6fwl0Zh2jlDzHFtfxOJldgUCEcAEdOKb49BGLyse/bkqhq1vBOELU0pert4+2LGtyEykgasc70g6OFFKvRHp4s1jrFDgjgkhZSU5hvSZEOZbhmorPeqQjvaGKlgqKQ2mCg7f90o9LRtPGOzjHKEsGyGNGSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpYuzbH7CuYhdNCbHjCV8aTK2ThRj/bEr4X7569SlAc=;
 b=0EFcC5gIeAgs1qusmJobU36k6MPb9y95a0DxkG4cyCU1q4elwMh5xT6PnpMV5zFN+3hWqWOmRgwAQR41PrAeu1+CAdhxr15M8rN126qqoBGl7zy6N99+OIEPNqFBFiMotkB8HEbvScBP4BjgALbIWkA7gK3uY/DPZCklL/6XDwg=
Received: from BYAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:c0::40)
 by MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:21:33 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::dd) by BYAPR05CA0027.outlook.office365.com
 (2603:10b6:a03:c0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.37 via Frontend Transport; Fri,
 4 Apr 2025 00:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:21:31 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:21:28 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 18/26] x86/resctrl: Add default MBM event configurations for mbm_cntr_assign mode
Date: Thu, 3 Apr 2025 19:18:27 -0500
Message-ID: <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 98635137-3af4-419a-04ad-08dd730ea6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cXiMTtooSGWhEZVNeNtNjcBFbuAZfdPGRQ5JGUh1WOgvtdRWy3ELTYxVVNwu?=
 =?us-ascii?Q?mP+Rq91Nmz2TLL9zNb603Y2jm7iudL4959NixkBlw730eevz8fULF9KxJuM9?=
 =?us-ascii?Q?eSy4azkzU53z0ndpomEuhrI344Ku4E7sETxNFPiFJ5TPlNaRBoDXy1qNeySc?=
 =?us-ascii?Q?PSNE7T61aq1XRZEjvD9pPMm0hQqUoCk4chkfvRAUECaAU6qEagreaQP0YL7r?=
 =?us-ascii?Q?TjTqS/4h/NHMuj3NcVLfELfOKhyizr7pmZmEyBa7eBzFydd55lGiMJGROa8u?=
 =?us-ascii?Q?BLniTXJ/X3dH8/UXs9b+Wq0kOrAc8cPUfSd5hjLnUYfLa0QopwIUMordfq6B?=
 =?us-ascii?Q?WJxI2Gg9x/K1mjrYRtUlSXVe/Hg/vvXhLdos2lbD6+UntmO6nYLT3VJl+FN4?=
 =?us-ascii?Q?EkC0tU9Vl45tzJZEJwfuzaxFl/wleF2EJUhmVAYd6mmJexO6we2UT/Pu+6li?=
 =?us-ascii?Q?VxGnyVZvRFWCg0jTuVS2zwbgCW6lEriauIe7EB38AwG9jo8rNlZ51oZ5yZZG?=
 =?us-ascii?Q?zMA0fnsGS+k7DLRlprNWZZz6M7rNGZ10+V8K7T3f4yd0h0V2dZFsdqh1+Zm8?=
 =?us-ascii?Q?M9eje/vLqj/g759N7Rqum1iN1BkAGRxnL+WLi2guzCQE18obFChhYr1tBuLL?=
 =?us-ascii?Q?QW0AkSY2S53Mkjv3VhAd5EiiYKm+vhnDLW7adZAhyHXAfNsci2gOibbwf8w8?=
 =?us-ascii?Q?2BZWCnv/NLC60pnLWyKLY1uPYjtU8lRRou9Lx3w/Djha112RR9yH0qTou1zX?=
 =?us-ascii?Q?tL3/d2KmbGvl1xV1mlwQraAtIxzn0VZuWGmuqecTMqmMEAfOHJGJ/9GnyhTP?=
 =?us-ascii?Q?jDJjQs7gR5lwoLuCPOhCuOYAyVWwBLe7fy4Z8FufZ3hIk4GgJMv5mtPuJhRm?=
 =?us-ascii?Q?65+Oi+ZYhhBeXYwtKJn4ebtaYwKdT4Evdje0qlPwfC70pxtutH+zoslxxg87?=
 =?us-ascii?Q?baSgmHtWk+2S19+z+ED+39NJHV+fC4mLUqC7MqdgrosbMSwhED/FYChZBdeY?=
 =?us-ascii?Q?sxYIhBduf/0rZpMeNppN356Slfl5O5cZcTvaJ2CexpZNlkrIc39pJ4xSxNlR?=
 =?us-ascii?Q?qrkg+dBOStzgz9Ktj1eWvuyXaF3/C5DalBgS1efeQIAF5VHK+MBS2w0dNVLm?=
 =?us-ascii?Q?y59vhFprAqaBR9Eh8z4NKWbetACrHxuhd7Rm0DXk8zBV88bafAvmQ+NxMqIW?=
 =?us-ascii?Q?zijGxPeOEdsAcCFxgpuJ+LSia0wH4YOcuj0uDjAdKk6uZGs9UWfGcJ0OcDIX?=
 =?us-ascii?Q?+HVlFfKycppnT4AHo9SXFSSuz9jnGG0vp3+km7naq6FUCJDuJOSI0hvRWele?=
 =?us-ascii?Q?jOJ2tTmbLhzEhWC+RpoYG9+X68OQ8+SY6NU2kx041V+JcqYfn8zYYFybitNZ?=
 =?us-ascii?Q?X08C3OwWTrwaHRuYs3hr3NHkm33G6niyaARN3xAwituxZXrKGiqKUptvyJNt?=
 =?us-ascii?Q?lUv60ATWyMbGPnsgjcu4s6l3fnhbV9Pbc1CZeGTBPWB2otOhC4f1BOZUmYaD?=
 =?us-ascii?Q?ZF7aIIvT/73oKi8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:21:31.8205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98635137-3af4-419a-04ad-08dd730ea6b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117

By default, each resctrl group supports two MBM events: mbm_total_bytes
and mbm_local_bytes. To maintain the same level of support, two default
MBM configurations are added. These configurations will initially be used
to set up the counters upon mounting, while users will have the option to
modify them as needed.

Event configuration values:
========================================================
 Bits    Mnemonics       Description
====   ========================================================
 6       VictimBW        Dirty Victims from all types of memory
 5       RmtSlowFill     Reads to slow memory in the non-local NUMA domain
 4       LclSlowFill     Reads to slow memory in the local NUMA domain
 3       RmtNTWr         Non-temporal writes to non-local NUMA domain
 2       LclNTWr         Non-temporal writes to local NUMA domain
 1       mtFill          Reads to memory in the non-local NUMA domain
 0       LclFill         Reads to memory in the local NUMA domain
====    ========================================================

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: New patch to support event configurations via new counter_configs
     method.
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 15 +++++++++++++++
 include/linux/resctrl_types.h          | 17 +++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index d84f47db4e43..aba23e2096db 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -57,6 +57,21 @@ static struct kernfs_node *kn_mongrp;
 /* Kernel fs node for "mon_data" directory under root */
 static struct kernfs_node *kn_mondata;
 
+struct mbm_evt_value mbm_evt_values[NUM_MBM_EVT_VALUES] = {
+	{"local_reads", 0x1},
+	{"remote_reads", 0x2},
+	{"local_non_temporal_writes", 0x4},
+	{"remote_non_temporal_writes", 0x8},
+	{"local_reads_slow_memory", 0x10},
+	{"remote_reads_slow_memory", 0x20},
+	{"dirty_victim_writes_all", 0x40},
+};
+
+struct mbm_assign_config mbm_assign_configs[NUM_MBM_ASSIGN_CONFIGS] = {
+	{"mbm_total_bytes", QOS_L3_MBM_TOTAL_EVENT_ID, 0x7f},
+	{"mbm_local_bytes", QOS_L3_MBM_LOCAL_EVENT_ID, 0x15},
+};
+
 /*
  * Used to store the max resource name width to display the schemata names in
  * a tabular format.
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index f26450b3326b..3d98c7bdb459 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -31,6 +31,9 @@
 /* Max event bits supported */
 #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
 
+#define NUM_MBM_EVT_VALUES		7
+#define NUM_MBM_ASSIGN_CONFIGS		2
+
 enum resctrl_res_level {
 	RDT_RESOURCE_L3,
 	RDT_RESOURCE_L2,
@@ -51,4 +54,18 @@ enum resctrl_event_id {
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
 };
 
+struct mbm_evt_value {
+	char	evt_name[32];
+	u32	evt_val;
+};
+
+/**
+ * struct mbm_assign_config - Configuration values
+ */
+struct mbm_assign_config {
+	char			name[32];
+	enum resctrl_event_id	evtid;
+	u32			val;
+};
+
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.34.1

