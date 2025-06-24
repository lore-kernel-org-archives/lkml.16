Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE90723BD00
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744718; cv=fail; b=uvwD+XATMKhZUn1VlTsEQqE+XaYaA5juQLIWZUl8stijh32ReuBCqJFwRLiuR0JTOdAAkHtwzQcP2WNLJGAv2M+9zZn7e/4C8IQDgtvyEa9JZHDj/NJ/3p4zbP3IF9Yj1L4pqkTQB/wqI8urnD44wsnZHKcxKI8+U0VLr90pFWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744718; c=relaxed/simple;
	bh=p39gu98CVTJ6pC7RKtxWLBj+Hcy/UcLQAfJhkAhfU24=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRQmXywA86FOBS+ipnrWNcOmD0EejPNaIlN4w7z4daBFtCXPVookpEOAZVbfOZc/LAbEO7P8GW1JrkE28uK3FY0O+gQj3KuXA/YGgeOPoVOplrGJyREmRpN2qj/Rmw7XiOu7N3N59ckUlRB+XMxvf6kQCSlAKJPWA1w8br/EWdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WI+vaT20; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WI+vaT20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxGFC/eErxXVhu3XCdvioLclpUhY07pb+mKukeUcVFTRvLk+8gbuoBVWT5xa5VXAOpNd6wa3ce+9QXeMBuuJ2wQ7Pc76XtXG9cLEcYDuqmZwjlHjqX+rMK9hnr+dEw435bYLXafIiwKKByqHRXI4XOZjAQb8F+J1ZQ1K/SIlQCHZpQFBabZUEjU1K8eORqN/ltAScs+/wmnqFqSKPwhiye45QN5ODTQg8l9QLZdaL2gQoeqQFo25FCo2ZbbRZIPt6zMoABhfF+TYPVeP9jE53p866OBBp66tbBfJGnBW44/07zqIZTgJ5GqfIXKVC39OZzhge0RYW0weSOWB9WVVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W9V9RNju1GPWwk32Vv9FAlyVQ1UuiOqdNEqvGwMF/A=;
 b=cm6G/dy90Ho6mZGscf9rLxeUaOHyrViOM/BUnmw0Z5ZgkicvJe93ShQN/VqX148uPrT6jh3wQKRye+ynqMCC4T7cJAUYzoOyMV1Nx7yzJu9cYFvmCthCiV8ZOvH+vw2ae2dEEDX+3hwsGNxLQ4s6sLJPhR217Su7bkje/L6150N6m6tUTkl4KvhqoqppZk0wrDJC0+9DWb9qCaG+PcyWp3nIuzie1T1U1YgrMQIWWTsrArCwIg/37QiQe3PFGzueopHfV16YTVcJXyP8O4LOpYqAOS3tl5m+p5FNPOZewKyXJNTcIXqCy3tSCGWs3RdhVp/Hq+RkyxLXlkF4YSU2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6W9V9RNju1GPWwk32Vv9FAlyVQ1UuiOqdNEqvGwMF/A=;
 b=WI+vaT20fzAbVyTwvYMBqnUgjzzm+7K3oJarSl3AWG7TAwKsuNgFIYjRrhx+l9zi4VlY5r+uSOp7RmRu62nTT73spzjiTF4vDl1yEaujLaTMILrLDcWoMZ52/gMeVnMenzNJd2Z28x8GOPPCe1lUl3qjrIXsAmyVVkhAU96X4xY=
Received: from MW4PR04CA0228.namprd04.prod.outlook.com (2603:10b6:303:87::23)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:58:29 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::4d) by MW4PR04CA0228.outlook.office365.com
 (2603:10b6:303:87::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 05:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:58:28 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:58:17 -0500
From: Raghavendra K T <raghavendra.kt@amd.com>
To: <raghavendra.kt@amd.com>
CC: <AneeshKumar.KizhakeVeetil@arm.com>, <Hasan.Maruf@amd.com>,
	<Michael.Day@amd.com>, <akpm@linux-foundation.org>, <bharata@amd.com>,
	<dave.hansen@intel.com>, <david@redhat.com>, <dongjoo.linux.dev@gmail.com>,
	<feng.tang@intel.com>, <gourry@gourry.net>, <hannes@cmpxchg.org>,
	<honggyu.kim@sk.com>, <hughd@google.com>, <jhubbard@nvidia.com>,
	<jon.grimm@amd.com>, <k.shutemov@gmail.com>, <kbusch@meta.com>,
	<kmanaouil.dev@gmail.com>, <leesuyeon0506@gmail.com>, <leillc@google.com>,
	<liam.howlett@oracle.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mgorman@techsingularity.net>, <mingo@redhat.com>,
	<nadav.amit@gmail.com>, <nphamcs@gmail.com>, <peterz@infradead.org>,
	<riel@surriel.com>, <rientjes@google.com>, <rppt@kernel.org>,
	<santosh.shukla@amd.com>, <shivankg@amd.com>, <shy828301@gmail.com>,
	<sj@kernel.org>, <vbabka@suse.cz>, <weixugc@google.com>,
	<willy@infradead.org>, <ying.huang@linux.alibaba.com>, <ziy@nvidia.com>,
	<Jonathan.Cameron@huawei.com>, <dave@stgolabs.net>, <yuanchu@google.com>,
	<kinseyho@google.com>, <hdanton@sina.com>
Subject: [RFC PATCH V2 09/13] mm: Add a heuristic to calculate target node
Date: Tue, 24 Jun 2025 05:56:13 +0000
Message-ID: <20250624055617.1291159-10-raghavendra.kt@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624055617.1291159-1-raghavendra.kt@amd.com>
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 137fca18-1447-45a3-0c7c-08ddb2e42479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XVcA8s9OO2RvGjEIv7UnBCCETpigH7plF3l+XeZlLC5hHWXZ5gSP+c0hymtE?=
 =?us-ascii?Q?s4M/dMCliGgW/3vCmYZDHv2HiZMrsIkk7WiqEQiFo4VxT7a8yZOXuUi7JgPM?=
 =?us-ascii?Q?RUAC5BH2QT+ugx9zuRbaC/mwIg5Nuro6DxmBL/f8tkrYwhAJ2BBQislRBpAM?=
 =?us-ascii?Q?T4eD6NHrU9//VsjNKGzLeIx4+Ju5efu6/qNe13ltNRwjH+bZFiFfPFUVnyKW?=
 =?us-ascii?Q?B/ZWQA2QBFlo1soL/wRqrv6cw9lOZsjM7hvvvQskQigMBuzkW1kBWShb1rm4?=
 =?us-ascii?Q?DrYMKPqAomgjy2gbz7EwcU8DeRpEbwel9zTj/OZMTj6PEsOyP5BPVB1aof53?=
 =?us-ascii?Q?9owQD381HNQSGs9Rjzw393gO55KQpcmrlAHNVDZkqhIuC0gp4Q7iI3DZF+gA?=
 =?us-ascii?Q?BhAYLAZ0RwMyopeVAXZkC9CoAwfpUhKYo7g9l5ETaV4XV/zJIIT5hY8z/NM4?=
 =?us-ascii?Q?VK56BP+yVqOX+jdH9TFzt5jOe6Fg5Jk2i8nKxSJKmguqXgaUlirPc3140E4b?=
 =?us-ascii?Q?dXBbFKLkKEtRtkFqxh9aNrpn0pRJPFsIlFY97WQt8q49Tq+cmM6N0DRWgti9?=
 =?us-ascii?Q?F2uqj5kVdx3qicXLOuZYLoIbSMT/h9O+OSUkitPzHHD8yVDU3cdfXpZkEj9l?=
 =?us-ascii?Q?TQWEB9PTw2Jo/yB2vGugrTM12x+o9kO2quzZKXTOkvqWkwiAb8N8j7+NvOVl?=
 =?us-ascii?Q?f5z2z6F4cPJAdtaXmP2NJxwV+Po4mbn3T+HKeHnMGAAFxi0T0vWB1JA+8c0e?=
 =?us-ascii?Q?0zNS2pEKUlDmzFT9ksKw26lpZD6Qn5m32iT5FC1KRhNHGpyPil+9MqhfLZO5?=
 =?us-ascii?Q?3kCSqfM7urdmbTKM5X5GXZrqIUNcp4kRpIPP3JMkJLEpOcogWz3YRKVS0Hww?=
 =?us-ascii?Q?9kwRnPRuLZl0KSYA371Coos6Hih/GxkI8b+px5zNxlqSFCrPPZ1GSe78223D?=
 =?us-ascii?Q?HA0lh4i/Kk9fPZpekQhiVMxT3QstKZR5iVfNKilNO4UFpPUFvwqNMffAniz7?=
 =?us-ascii?Q?JlI5TtVzeXsxVA/Ok/hc5Qq1e7AzfcFKGQcFMel3WR78nkISDduWzKpd+gGQ?=
 =?us-ascii?Q?ER7m0Tx7pUjmKg8a1g31AzG2c619Fqek9iG26v2qsYDh7G8n51a4P1zfHIBP?=
 =?us-ascii?Q?lIV/P8FDlRgMJM6v5+wIOdLbzaVlwfEzWSIO4pUKC7Kgwse3PT9ACzAWmHE0?=
 =?us-ascii?Q?PPdAFWmLK1ThpDGb2UYRpjekKjlY/AS+2mVIu7Au/k/TxcbIp6Nn+hH2U7V5?=
 =?us-ascii?Q?gJz9JA9towzQ5So0IEwYOdW/B7n41RwOyvRmszs5e0SqccF3sspU+j/BeiCA?=
 =?us-ascii?Q?Pl+D8trYA6QFtbyJkH3Odhh+W6+AjXtz1vGgcClwjfd7hhtSLSnhonfDzI4P?=
 =?us-ascii?Q?8FhEMu9FSwideXhvzVL/JtMiST//lccwjgvmnHMe6HfUH0xXox5fdofYMwSW?=
 =?us-ascii?Q?C+c2gqmiwvYqVmZkqU4pnE3ZaOh/ibIYsrzBJntnt2VgnoJZ6ZRVpxEdhfW5?=
 =?us-ascii?Q?uN/7ChEtLlrOU8a8TLrAsZZfW47uCNxUJmfpSxI/KKV/WmHkKwlxjyXk+jCx?=
 =?us-ascii?Q?5xZG2vqeeIzHNsFoALgwDrnpI5afDfYb8lNOVBNvBmOVc1CBQh+BrbCGywDN?=
 =?us-ascii?Q?5O/cOUPVfwcKxnefOpXtTZ4ztJG5Ue1dh5EEY0AqhBFyYnTP+pR7tzyIesKY?=
 =?us-ascii?Q?cDwQNSdy6LlM2GYwysu4TuJDVoZ7ZLNW/zKU+i+kkbKAEFbjICrro2rDIMLk?=
 =?us-ascii?Q?yFzz3AhsTALgkeQUV7eWVPhj1aXayilp7IykbgB4QjcpaOi5gYiqfPKLvpD5?=
 =?us-ascii?Q?KS/IVdWUYyA9Zw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:58:28.9467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 137fca18-1447-45a3-0c7c-08ddb2e42479
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

One of the key challenges in PTE A bit based scanning is to find right
target node to promote to.

Here is a simple heuristic based approach:
 1. While scanning pages of any mm, also scan toptier pages that belong
to that mm.
 2. Accumulate the insight on the distribution of active pages on
toptier nodes.
 3. Walk all the top-tier nodes and pick the one with highest accesses.

 This method tries to consolidate application to a single node.

TBD: Create a list of preferred nodes for fallback when highest access
 node is nearly full.

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 include/linux/mm_types.h |   4 +
 mm/kscand.c              | 186 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 181 insertions(+), 9 deletions(-)

TBD: Also maintain nodemask instead of single target node to handle failed
migrations?.

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f9..571be1ad12ab 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1109,6 +1109,10 @@ struct mm_struct {
 		/* numa_scan_seq prevents two threads remapping PTEs. */
 		int numa_scan_seq;
 #endif
+#ifdef CONFIG_KSCAND
+		/* Tracks promotion node. XXX: use nodemask */
+		int target_node;
+ #endif
 		/*
 		 * An operation with batched TLB flushing is going on. Anything
 		 * that can move process memory needs to flush the TLB when
diff --git a/mm/kscand.c b/mm/kscand.c
index 8fbe70faea4e..2996aaad65d6 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -104,6 +104,7 @@ struct kscand_mm_slot {
 	unsigned long scan_size;
 	long address;
 	bool is_scanned;
+	int target_node;
 };
 
 /* Data structure to keep track of current mm under scan */
@@ -116,13 +117,23 @@ struct kscand_scan kscand_scan = {
 	.mm_head = LIST_HEAD_INIT(kscand_scan.mm_head),
 };
 
+/* Per memory node information used to caclulate target_node for migration */
+struct kscand_nodeinfo {
+	unsigned long nr_scanned;
+	unsigned long nr_accessed;
+	int node;
+	bool is_toptier;
+};
+
 /*
  * Data structure passed to control scanning and also collect
  * per memory node information
  */
 struct kscand_scanctrl {
 	struct list_head scan_list;
+	struct kscand_nodeinfo *nodeinfo[MAX_NUMNODES];
 	unsigned long address;
+	unsigned long nr_to_scan;
 };
 
 struct kscand_scanctrl kscand_scanctrl;
@@ -218,15 +229,121 @@ static void kmigrated_wait_work(void)
 			migrate_sleep_jiffies);
 }
 
-/*
- * Do not know what info to pass in the future to make
- * decision on taget node. Keep it void * now.
- */
+static unsigned long get_slowtier_accesed(struct kscand_scanctrl *scanctrl)
+{
+	int node;
+	unsigned long accessed = 0;
+
+	for_each_node_state(node, N_MEMORY) {
+		if (!node_is_toptier(node) && scanctrl->nodeinfo[node])
+			accessed += scanctrl->nodeinfo[node]->nr_accessed;
+	}
+	return accessed;
+}
+
+static inline void set_nodeinfo_nr_accessed(struct kscand_nodeinfo *ni, unsigned long val)
+{
+	ni->nr_accessed = val;
+}
+static inline unsigned long get_nodeinfo_nr_scanned(struct kscand_nodeinfo *ni)
+{
+	return ni->nr_scanned;
+}
+
+static inline void set_nodeinfo_nr_scanned(struct kscand_nodeinfo *ni, unsigned long val)
+{
+	ni->nr_scanned = val;
+}
+
+static inline void reset_nodeinfo_nr_scanned(struct kscand_nodeinfo *ni)
+{
+	set_nodeinfo_nr_scanned(ni, 0);
+}
+
+static inline void reset_nodeinfo(struct kscand_nodeinfo *ni)
+{
+	set_nodeinfo_nr_scanned(ni, 0);
+	set_nodeinfo_nr_accessed(ni, 0);
+}
+
+static void init_one_nodeinfo(struct kscand_nodeinfo *ni, int node)
+{
+	ni->nr_scanned = 0;
+	ni->nr_accessed = 0;
+	ni->node = node;
+	ni->is_toptier = node_is_toptier(node) ? true : false;
+}
+
+static struct kscand_nodeinfo *alloc_one_nodeinfo(int node)
+{
+	struct kscand_nodeinfo *ni;
+
+	ni = kzalloc(sizeof(*ni), GFP_KERNEL);
+
+	if (!ni)
+		return NULL;
+
+	init_one_nodeinfo(ni, node);
+
+	return ni;
+}
+
+/* TBD: Handle errors */
+static void init_scanctrl(struct kscand_scanctrl *scanctrl)
+{
+	struct kscand_nodeinfo *ni;
+	int node;
+
+	for_each_node(node) {
+		ni = alloc_one_nodeinfo(node);
+		if (!ni)
+			WARN_ON_ONCE(ni);
+		scanctrl->nodeinfo[node] = ni;
+	}
+}
+
+static void reset_scanctrl(struct kscand_scanctrl *scanctrl)
+{
+	int node;
+
+	for_each_node_state(node, N_MEMORY)
+		reset_nodeinfo(scanctrl->nodeinfo[node]);
+
+	/* XXX: Not rellay required? */
+	scanctrl->nr_to_scan = kscand_scan_size;
+}
+
+static void free_scanctrl(struct kscand_scanctrl *scanctrl)
+{
+	int node;
+
+	for_each_node(node)
+		kfree(scanctrl->nodeinfo[node]);
+}
+
 static int kscand_get_target_node(void *data)
 {
 	return kscand_target_node;
 }
 
+static int get_target_node(struct kscand_scanctrl *scanctrl)
+{
+	int node, target_node = NUMA_NO_NODE;
+	unsigned long prev = 0;
+
+	for_each_node(node) {
+		if (node_is_toptier(node) && scanctrl->nodeinfo[node] &&
+				get_nodeinfo_nr_scanned(scanctrl->nodeinfo[node]) > prev) {
+			prev = get_nodeinfo_nr_scanned(scanctrl->nodeinfo[node]);
+			target_node = node;
+		}
+	}
+	if (target_node == NUMA_NO_NODE)
+		target_node = kscand_get_target_node(NULL);
+
+	return target_node;
+}
+
 extern bool migrate_balanced_pgdat(struct pglist_data *pgdat,
 					unsigned long nr_migrate_pages);
 
@@ -492,6 +609,14 @@ static int hot_vma_idle_pte_entry(pte_t *pte,
 	}
 	srcnid = folio_nid(folio);
 
+	scanctrl->nodeinfo[srcnid]->nr_scanned++;
+	if (scanctrl->nr_to_scan)
+		scanctrl->nr_to_scan--;
+
+	if (!scanctrl->nr_to_scan) {
+		folio_put(folio);
+		return 1;
+	}
 
 	if (!folio_test_lru(folio)) {
 		folio_put(folio);
@@ -502,6 +627,8 @@ static int hot_vma_idle_pte_entry(pte_t *pte,
 			mmu_notifier_test_young(mm, addr) ||
 			folio_test_referenced(folio) || pte_young(pteval)) {
 
+		scanctrl->nodeinfo[srcnid]->nr_accessed++;
+
 		if (!kscand_eligible_srcnid(srcnid)) {
 			folio_put(folio);
 			return 0;
@@ -695,7 +822,13 @@ static void kmigrated_migrate_mm(struct kmigrated_mm_slot *mm_slot)
 
 			spin_unlock(&mm_slot->migrate_lock);
 
-			dest = kscand_get_target_node(NULL);
+			if (!mmap_read_trylock(mm)) {
+				dest = kscand_get_target_node(NULL);
+			} else {
+				dest = READ_ONCE(mm->target_node);
+				mmap_read_unlock(mm);
+			}
+
 			ret = kmigrated_promote_folio(info, mm, dest);
 
 			kfree(info);
@@ -781,7 +914,7 @@ static void kmigrated_migrate_folio(void)
  *		Increase scan_size by (1 << SCAN_SIZE_CHANGE_SHIFT).
  */
 static inline void kscand_update_mmslot_info(struct kscand_mm_slot *mm_slot,
-				unsigned long total)
+				unsigned long total, int target_node)
 {
 	unsigned int scan_period;
 	unsigned long now;
@@ -829,6 +962,7 @@ static inline void kscand_update_mmslot_info(struct kscand_mm_slot *mm_slot,
 	mm_slot->scan_period = scan_period;
 	mm_slot->scan_size = scan_size;
 	mm_slot->scan_delta = total;
+	mm_slot->target_node = target_node;
 }
 
 static unsigned long kscand_scan_mm_slot(void)
@@ -837,6 +971,7 @@ static unsigned long kscand_scan_mm_slot(void)
 	bool update_mmslot_info = false;
 
 	unsigned int mm_slot_scan_period;
+	int target_node, mm_slot_target_node, mm_target_node;
 	unsigned long now;
 	unsigned long mm_slot_next_scan;
 	unsigned long mm_slot_scan_size;
@@ -870,6 +1005,7 @@ static unsigned long kscand_scan_mm_slot(void)
 	mm_slot_next_scan = mm_slot->next_scan;
 	mm_slot_scan_period = mm_slot->scan_period;
 	mm_slot_scan_size = mm_slot->scan_size;
+	mm_slot_target_node = mm_slot->target_node;
 	spin_unlock(&kscand_mm_lock);
 
 	if (unlikely(!mmap_read_trylock(mm)))
@@ -880,6 +1016,9 @@ static unsigned long kscand_scan_mm_slot(void)
 		goto outerloop;
 	}
 
+	mm_target_node = READ_ONCE(mm->target_node);
+	if (mm_target_node != mm_slot_target_node)
+		WRITE_ONCE(mm->target_node, mm_slot_target_node);
 	now = jiffies;
 
 	if (mm_slot_next_scan && time_before(now, mm_slot_next_scan))
@@ -887,24 +1026,41 @@ static unsigned long kscand_scan_mm_slot(void)
 
 	VMA_ITERATOR(vmi, mm, address);
 
+	/* Either Scan 25% of scan_size or cover vma size of scan_size */
+	kscand_scanctrl.nr_to_scan =	mm_slot_scan_size >> PAGE_SHIFT;
+	/* Reduce actual amount of pages scanned */
+	kscand_scanctrl.nr_to_scan =	mm_slot_scan_size >> 1;
+
+	/* XXX: skip scanning to avoid duplicates until all migrations done? */
 	kmigrated_mm_slot = kmigrated_get_mm_slot(mm, false);
 
 	for_each_vma(vmi, vma) {
 		kscand_walk_page_vma(vma, &kscand_scanctrl);
 		vma_scanned_size += vma->vm_end - vma->vm_start;
 
-		if (vma_scanned_size >= kscand_scan_size) {
+		if (vma_scanned_size >= mm_slot_scan_size ||
+					!kscand_scanctrl.nr_to_scan) {
 			next_mm = true;
 
 			if (!list_empty(&kscand_scanctrl.scan_list)) {
 				if (!kmigrated_mm_slot)
 					kmigrated_mm_slot = kmigrated_get_mm_slot(mm, true);
+				/* Add scanned folios to migration list */
 				spin_lock(&kmigrated_mm_slot->migrate_lock);
+
 				list_splice_tail_init(&kscand_scanctrl.scan_list,
 						&kmigrated_mm_slot->migrate_head);
 				spin_unlock(&kmigrated_mm_slot->migrate_lock);
+				break;
 			}
-			break;
+		}
+		if (!list_empty(&kscand_scanctrl.scan_list)) {
+			if (!kmigrated_mm_slot)
+				kmigrated_mm_slot = kmigrated_get_mm_slot(mm, true);
+			spin_lock(&kmigrated_mm_slot->migrate_lock);
+			list_splice_tail_init(&kscand_scanctrl.scan_list,
+					&kmigrated_mm_slot->migrate_head);
+			spin_unlock(&kmigrated_mm_slot->migrate_lock);
 		}
 	}
 
@@ -915,9 +1071,19 @@ static unsigned long kscand_scan_mm_slot(void)
 
 	update_mmslot_info = true;
 
+	total = get_slowtier_accesed(&kscand_scanctrl);
+	target_node = get_target_node(&kscand_scanctrl);
+
+	mm_target_node = READ_ONCE(mm->target_node);
+
+	/* XXX: Do we need write lock? */
+	if (mm_target_node != target_node)
+		WRITE_ONCE(mm->target_node, target_node);
+	reset_scanctrl(&kscand_scanctrl);
+
 	if (update_mmslot_info) {
 		mm_slot->address = address;
-		kscand_update_mmslot_info(mm_slot, total);
+		kscand_update_mmslot_info(mm_slot, total, target_node);
 	}
 
 outerloop:
@@ -1111,6 +1277,7 @@ static int stop_kscand(void)
 		kthread_stop(kscand_thread);
 		kscand_thread = NULL;
 	}
+	free_scanctrl(&kscand_scanctrl);
 
 	return 0;
 }
@@ -1166,6 +1333,7 @@ static inline void init_list(void)
 	spin_lock_init(&kscand_migrate_lock);
 	init_waitqueue_head(&kscand_wait);
 	init_waitqueue_head(&kmigrated_wait);
+	init_scanctrl(&kscand_scanctrl);
 }
 
 static int __init kscand_init(void)
-- 
2.34.1

