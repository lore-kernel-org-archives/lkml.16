Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704ED238C3B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744704; cv=fail; b=pPq+YTDCiYGkZensj9MaOu6aZV20YlKPF2HqQS7W93AkvJe+xYdij5YNkR0TQUTcTyc3xG0pViHPzyy6CpHwDA3QvzsssEO7w7VaTYKtSMFwdL3+dYhklDCVjRYdh8jU28eCIKPaEM5XQW3wQHPPAXKlSVGTqdfP3x15BPuPc3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744704; c=relaxed/simple;
	bh=terOXdCiQe5u4vzAX61HGKAL6eL4zuPEpMcfbqYp5Ts=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/U9Q5f3xfWRoWsO/xX1cRrynl8u9I/m3M1uzGN3eTRfaJYeRNP7tVqy23EShfQBoJKGZei1CzNFN09rMM9R8HqFIGTTStgER5Kv1ZAb7LHz/CK7KuNvmfG50e5MGIGv1zj4HZa3m4TCLJxlWnTB4CTKfpHCw/IINbZub3UOqVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WYwIE9+r; arc=fail smtp.client-ip=40.107.237.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WYwIE9+r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/XGZNDZ39D7NvaGQOPVvjkIsCXgnAi4w2ptUVspaoYcf9H5nv3nIfxYTiugMVNy9EwqDqONv4YeIdHagkoVt02B1JlMY4UGxnIuomec8MS3sK74V8yBjk7rlWq2LGoJslm44R6CgjFHGhK2tU8WbFrp8iJkzmpisK2ykLpOya/neKb0sJGY8awDS14ghf7Lp1sQ+Cq5OsVDNJC6s+IxlO3W11qw9qfy9+ZATfjM7AaBGd4VJtPgKPTods/JrBq7YuJyodA4qhvd1rgsdbeFNkvwZ1Tw7PEYnYPUbsx+OMGgS2Lgqlf5mg+TMLy0CavNggrqorAAcmeLjXMF2SWtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzvM2ZLdrxrFaLq5Cfs+BIK16r2rHvbnPluKKsKrktE=;
 b=n+C/OZN8FdibnVhGyAYxHxAxFo1Yu3MixPOlWwmdqBdrsF6ydfyQcYkMGkEinjR/mEvpAarI0IObZbvSkNA+h/vOiN06G4L0gRWeSw95Z3C2DpqdQF8TzCKpNfQcAjHx4rvPYWfeS+cG17uXZemiUp1DnqAngf2Oj+8gEEj+4FJBJnZB6YjhSY+Sy2Ezv7vpL4X9AQtBXy0WLiM9JjW7H8W6EG7PUFVzd/Pdi7t3irSHK313MMIxE7YnAZ3GGaRBSBPEmmHtayz+z1dK1iaeo0AhgxgNQ0UYD1o+EecbbQ/B9duMjArsUmTn2NJ3lsAPYQa4WKkVf+tZB2FGYe2nrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzvM2ZLdrxrFaLq5Cfs+BIK16r2rHvbnPluKKsKrktE=;
 b=WYwIE9+ry9cBjQzw6LHWuDERdbZQGfuiiBQIn5/UkbvSElbAnki6ikE/ULX3AWq/hwpmTuomY6HqOnd5g0eZpTXmRY1HMyD57XrnROqpogofitUaoze6+QVAr1Z6oF7BBATyshiae7H19YU2avybCzlOOao+5UawfMmZaNJpXUs=
Received: from BYAPR05CA0101.namprd05.prod.outlook.com (2603:10b6:a03:e0::42)
 by CY8PR12MB7588.namprd12.prod.outlook.com (2603:10b6:930:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:58:18 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::6f) by BYAPR05CA0101.outlook.office365.com
 (2603:10b6:a03:e0::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 05:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:58:17 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:58:06 -0500
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
Subject: [RFC PATCH V2 08/13] mm: Add initial scan delay
Date: Tue, 24 Jun 2025 05:56:12 +0000
Message-ID: <20250624055617.1291159-9-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CY8PR12MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd7491e-130c-4ac2-9c0b-08ddb2e41dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9TAXq5aAKfxqVjhpToz2UtATVHK12EEEnwPHELSz9RMYNKuTYJHMdezkJXIu?=
 =?us-ascii?Q?VXXkgEbG2AAiX9+MxmDrSgZAk2+l80Oj3MGa7MApzEVy26CNWYeud4qIjMdM?=
 =?us-ascii?Q?qPZcQ+Q/wRRCWYgmr9L2FpemJfdsUJSOYpCSbaDRkUMqgj40irXhsx89MwQg?=
 =?us-ascii?Q?MuovZYHrZpjUT3lUdy/kl+oGCi0VHBb/ioZazGURe7wit6qWtSOAOXoCoN4Z?=
 =?us-ascii?Q?+GEjDufPLMPU8UhKE0cDzniy/Tnxuixcj7EdmgcR74tMPu5EGgJ+BoVf79Vp?=
 =?us-ascii?Q?g+rsAqjWl9uRho/7fr5voSQE/2our5D530JUIFAV6NFrDzqCMn/sxoYCwYYZ?=
 =?us-ascii?Q?jq5BNYJma/6Ckkzxo0lHZA+hw0v5roHouBVX5mGBKEF0DF1zFQMNVHiFRR6s?=
 =?us-ascii?Q?zDrnyMbJJCOdh52q/QpbXlaH1/NUodO0U/mrpqt9PzOhIJ957KPL3y+vO13O?=
 =?us-ascii?Q?DV9CD9MPUUm0TTADWNhB0kJONGitRfW2/yyibCO13JpUk4dwO+w4sgzqHCA8?=
 =?us-ascii?Q?i6/bumoH8MAxKGb8aBm8X+goDjUC57aE25rCUJ+F22fRjSAtd6vR8L8azjwC?=
 =?us-ascii?Q?LSvWywq6MtdvUmCmKTx8odXP20c9P8ukyvkMXnK3TZjpERKYe1rz8xUxMC7R?=
 =?us-ascii?Q?LzwYeUF3fAnjCJfiRn524xYbwjUiiwnDQS1dlHhNnrLWUoBz+gt+F5moJAxo?=
 =?us-ascii?Q?ujDmLagIb8UBO/PDKaK5K9rMiTMGgS0af32bCdyUJSu2HomKYOAtCJpcpfCC?=
 =?us-ascii?Q?wuBhFW5bFQ4deJcJBS/szfoRSlbQqdU54wQ5+nj+GkD71ZiejL4mR5bK7LLI?=
 =?us-ascii?Q?ZJgHzJuGAuzTw5wzKd5PKHEgXARct1EzsFzFoyYnH4lnu1JrZRSiEdGth/g9?=
 =?us-ascii?Q?w26/+q3lGz8ecuAfGTCcek9Tu2sjhIC7wn8GVSPAZEPOpQyIUOI3VTF1giiS?=
 =?us-ascii?Q?mEUSZN6zzr6+dk3js7tD/bUzCa3zei/z2eyO8f/3QQIkBliaOsO9LwFZ8wEi?=
 =?us-ascii?Q?RflNwafxiCYSemBZtd7fnuMhAEpw/T9hbsr0bYwBvPGZ13I1aDSwf4JVt7fq?=
 =?us-ascii?Q?NWK14qIG0Zm6tfGCV1yPAWhVeMWdDgtSQPg1E0cqZnT7b4IVffxBIwiui/Rl?=
 =?us-ascii?Q?ICKCVU1pacagOotAQaSKROgDV2lzpT9Orxirn+slbnKvc9IBYh5lrIztaUFc?=
 =?us-ascii?Q?3hE3BP743WmcL/mjTb5H6WPMHRHdt+UEg054TbuzHR/BKQiwmQ/lmfqEb8Zr?=
 =?us-ascii?Q?r96Sgwamg8CcI2FwzIjmb6LeecpyqGPU7hX6LAAIYpwXaHqE5TMOKQM3SCUX?=
 =?us-ascii?Q?vIjXvpoFJ5oCaY8xjyYO0YqEusK3b+7jpyurqaw0I3xlACflXhjlkiIE94b1?=
 =?us-ascii?Q?8gkdVwwEdbKcCh409+9EjTgus1+JIFN7UqFfPZL2reiEykgQz9+U+fl0Cjg/?=
 =?us-ascii?Q?B2eYbeEV5V6cQ+Q7+OQoGjKp1b+8XCS6vWkcobnuB17xZ4yiBRYCbC6p/BEG?=
 =?us-ascii?Q?/LX5UyZ7E8E7F5D2GHpJ5p0YfcPT7MSpZQhh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:58:17.9591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd7491e-130c-4ac2-9c0b-08ddb2e41dec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7588

 This is  to prevent unnecessary scanning of short lived tasks
to reduce CPU burning.

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 mm/kscand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/kscand.c b/mm/kscand.c
index 26b40865d3e5..8fbe70faea4e 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -28,6 +28,7 @@
 
 static struct task_struct *kscand_thread __read_mostly;
 static DEFINE_MUTEX(kscand_mutex);
+extern unsigned int sysctl_numa_balancing_scan_delay;
 
 /*
  * Total VMA size to cover during scan.
@@ -1008,6 +1009,7 @@ void __kscand_enter(struct mm_struct *mm)
 {
 	struct kscand_mm_slot *kscand_slot;
 	struct mm_slot *slot;
+	unsigned long now;
 	int wakeup;
 
 	/* __kscand_exit() must not run from under us */
@@ -1018,10 +1020,12 @@ void __kscand_enter(struct mm_struct *mm)
 	if (!kscand_slot)
 		return;
 
+	now = jiffies;
 	kscand_slot->address = 0;
 	kscand_slot->scan_period = kscand_mm_scan_period_ms;
 	kscand_slot->scan_size = kscand_scan_size;
-	kscand_slot->next_scan = 0;
+	kscand_slot->next_scan = now +
+			msecs_to_jiffies(sysctl_numa_balancing_scan_delay);
 	kscand_slot->scan_delta = 0;
 
 	slot = &kscand_slot->slot;
-- 
2.34.1

