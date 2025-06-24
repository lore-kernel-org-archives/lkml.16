Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582379F2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744701; cv=fail; b=oh+v8fWdbz8c8ceAd9UKURTHroYyyWb35wJ5JZkiIVj7Yg2UO0QrxPZq7GDVfKUJnE1jBjXcpEBrVusirGcOiW9v4yDtBlk5MS53O+NiN1/vCzzncOJrRjpc7sybZJsGDoVaa9kdJkNEnwnyoKurUqyeSTeftbRbVZWj7ngGDcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744701; c=relaxed/simple;
	bh=ym+0KEzVCBFSrM9PS86YJgk/PURdOi4Lmxcp+kTvGqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVL0kPcS0ItDoosozhz5dIia1PLDolMTZbXG8Rp+bqKi1e+pvnoG1E1ouISDdKYDwOo0Z8qCAV+jVVXkr2PLKA82SyEet5cvMtaj/OFU8Dq9BzjsrDar1ncnLDsZYQCEAm1sTb6GcAQQsUB6vh/j4Gn4cPiMIgNTMUXCnw5zezM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QzN4QK/B; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QzN4QK/B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVtIEjj2X04uqrrlA9HtJcZypqQYtBqZ8nsy9ejLWfkP8/E2fPSTszFn7LHhYOKivdcHvDozPLStesSyyJF+fXqu6WoSUUq+7mRSR5DGQzfI14OTbd/jumSvQ2KlqgOwHiP3nqtPl8ECkQcTlsf27i4vvJlIhwUtilLrnEXFtEA9SoQ5WRAVzlp2oXZNodi8keRIcMMttvFhAezd1eeo343XIAQqTSKgEh778jeSDPGnL1cCRR1JMgTDXVnKtRanTlVjtfNv66Nm8YQFNVBjoYb7P3q/Qgk5650PBTfPTc05CPAC5O/rEC+pBVX8ikANc4eJkdEI9gjuPFiBb5HBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npimcWnWmW3Czx8tRelspzT5xqxVtPyB2JuYUhRJ0Q4=;
 b=rTuF4KNP75TI4ald/CrfFXA401h5iNMa3g4Zxx0OtPNPoWdv9adqm9omTC23bT0D4pOvutedk+R5hukQP+j6qZ6947FzSMyhUeG6cm73Iv0lFVsV9v+8WjhYG8OO3woiXQNUoXtP6AxDX2fALvZZOK1S919KhdNdIAGIyPLeZEUUKtvpORSNJZ3sVlXOP9DN18AQlYtVrE6Z2kNKEByq4YPsiQiVVAtsI1bZA1vLhDj3z6+BuGW8dRNgRId1vGiztcYKAPQ3EKrEJT70sW/qk3VaXPBtpNI1luA6ZuEKAmsXMtwUlGrKtUMf0ifJYt+9C9O5LTB6OC2C0qzq/Pnhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npimcWnWmW3Czx8tRelspzT5xqxVtPyB2JuYUhRJ0Q4=;
 b=QzN4QK/B9iiuyg4qNVnznUTGN7m/mTW+3xLtrvNNs/4AO8PApIOdGjKRnjzdRFKaYr24hnbSS46SoiGXWQz1+rjokCYEaRPLVp4vH83th8OXFQKAD3joOUACKeTNLUzL0zy49g19lkg9XtGdxtL8cGDpeX6d7AWUxyRD8fttquc=
Received: from MW4PR03CA0352.namprd03.prod.outlook.com (2603:10b6:303:dc::27)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.35; Tue, 24 Jun 2025 05:58:14 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::9d) by MW4PR03CA0352.outlook.office365.com
 (2603:10b6:303:dc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Tue,
 24 Jun 2025 05:58:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:58:14 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:57:55 -0500
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
Subject: [RFC PATCH V2 07/13] mm: Add throttling of mm scanning using scan_size
Date: Tue, 24 Jun 2025 05:56:11 +0000
Message-ID: <20250624055617.1291159-8-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 228ec93d-0a35-4ac5-e8cf-08ddb2e41ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I1/aSF0walt6ErTnmuSSaplkvZOgq3P5H8qzE35mfE6uwpeeSfI2WIrMeMvn?=
 =?us-ascii?Q?Lrj5Bicz3cqdYVrGtOOtCYSdRN5KZls1djA/I2vIV161F0ZyRmpD68lqblkh?=
 =?us-ascii?Q?AwgUyaziUdqTuYy+OxBndeQaOsclBjMtrPltgBMxgecAuuxzLEFbcuEG5hyB?=
 =?us-ascii?Q?Lzhbd9uCdfUDY1yW8mJGWNgm9jBiQ7IszgJBTlQwNjOZla9WYbH20bYJdFaH?=
 =?us-ascii?Q?QulF/4+K41I3GrLpduKfjGRkUF5BBKkJ2AWurxTdYz5mIM6zeha6MUlPjvoc?=
 =?us-ascii?Q?hpZDn0v9BiEVUrlNLjg3JwL3Kct13rQF7lS744WDeXAXE58BjPB9zevJtMTt?=
 =?us-ascii?Q?735uHVtJebIvSIccnzRHCvwBvGYxtWTYUKEqxz5R2VgpHZa2YC1+t4Fgn1jv?=
 =?us-ascii?Q?C+3Mo05p7dLf9pLKJue/qvZGOVxqk9yfv70DXm0+C5sIv+CNCCPnGqxTQRDa?=
 =?us-ascii?Q?N6Mbi4LV3uN/nJJTtSeEgZi1J9YfZBwMksJDnyFWWZ6xkLUPfb/eHhV6HY75?=
 =?us-ascii?Q?k1LZSwsxNZ/U3hDXSJw8KKWpIBrE88hu3/u/JGm9CrZQwMW5NI5jaOxEmxPr?=
 =?us-ascii?Q?yfQ9Ii3n6gY461GYYtwt4ROrCSjmaigERaFZOzSUbQ+61Gb95y0HfcurFQ+Q?=
 =?us-ascii?Q?F7AkehA2RKSvN+X3MxFyMXoapvuHkgD+dyFY/UGC9YzVWa8BziNiAFMyZq5e?=
 =?us-ascii?Q?WQWC9YY8/z2qrRVuPuTmTlpNP5VKo/UCEwnxjVg159EzhFJXDJKUT5UVfU5s?=
 =?us-ascii?Q?7EvTm90E4LUvlD2f7RvojCrYQoBwbZamj16r2SJdAU2QQ+LvyKnG81zxhTym?=
 =?us-ascii?Q?fBeba7BZMKven/he0ZNZCXo0MIbfgTKYXlfZ8d1KmxhIjo7t6ozCRi9A+UMw?=
 =?us-ascii?Q?RPy0FDktn1EWRcqDtCttLNCf36MOgbmFkJ4iAS5NUUKPBmgmjww/pKnMESAw?=
 =?us-ascii?Q?5HtvD+ltkykLU5HmfmSnaJez7/e0P56Mo4wNGUmrpLI/UEThSEUXNuH56Vow?=
 =?us-ascii?Q?771byr4NpK7EKzqh0wFcDAb7ibqUjQpeS3x2qCWJnadigWzaobxB0tD3by57?=
 =?us-ascii?Q?S/dBS2uwLtj+C2kz6KCZ7FDDrWzkaY3nVLSMnO5QGr7jgTcUfC7OrdX6bgkD?=
 =?us-ascii?Q?uhsSkYqz9ha9TyOB+poPCYpTvACbPZskGA9jka7uUEyUz3tBnaCnPGnokPCW?=
 =?us-ascii?Q?aOI+BEw5eUikViy4silOumzPVOeCF3rvd0tqOKJ5LmA+q5EhRn/h3p4E+cqY?=
 =?us-ascii?Q?VW1HjABUmcXDcO84rMz6Tb0inR5dJD5WUEh9G8cCtFNepaIeEIkD9GmdTznj?=
 =?us-ascii?Q?7GbHIx98QoA3qw+TbB0L+qJmG3iDnjWye4Aj+to3gMl0ezimC1uFTW1vg5Gb?=
 =?us-ascii?Q?DGLZputMRkbuBN6Cx1kXvIRdO6i24u+9qAdmLDpvsVMsrBcIVBQ+S47EKkAs?=
 =?us-ascii?Q?JY6BIE3Azo3FNtxQvhLuZh6e/oN40z4I2xyuRPKCr+CusYpMlpMGyytF3oSd?=
 =?us-ascii?Q?kGtxwp6xEd9GfYDGybM9wzjggAiQJNotVEFT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:58:14.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 228ec93d-0a35-4ac5-e8cf-08ddb2e41ba6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

Before this patch, scanning is done on entire virtual address space
of all the tasks. Now the scan size is shrunk or expanded based on the
useful pages found in the last scan.

This helps to quickly get out of unnecessary scanning thus burning
lesser CPU.

Drawback: If a useful chunk is at the other end of the VMA space, it
will delay scanning and migration.

Shrink/expand algorithm for scan_size:
X : Number of useful pages in the last scan.
Y : Number of useful pages found in current scan.
Initial scan_size is 1GB
 case 1: (X = 0, Y = 0)
  Decrease scan_size by 2
 case 2: (X = 0, Y > 0)
  Aggressively change to MAX (4GB)
 case 3: (X > 0, Y = 0 )
   No change
 case 4: (X > 0, Y > 0)
   Increase scan_size by 2

Scan size is clamped between MIN (256MB) and MAX (4GB)).
TBD:  Tuning based on real workloads

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 mm/kscand.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/mm/kscand.c b/mm/kscand.c
index fca4b7b4a81f..26b40865d3e5 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -28,10 +28,15 @@
 
 static struct task_struct *kscand_thread __read_mostly;
 static DEFINE_MUTEX(kscand_mutex);
+
 /*
  * Total VMA size to cover during scan.
+ * Min: 256MB default: 1GB max: 4GB
  */
+#define KSCAND_SCAN_SIZE_MIN	(256 * 1024 * 1024UL)
+#define KSCAND_SCAN_SIZE_MAX	(4 * 1024 * 1024 * 1024UL)
 #define KSCAND_SCAN_SIZE	(1 * 1024 * 1024 * 1024UL)
+
 static unsigned long kscand_scan_size __read_mostly = KSCAND_SCAN_SIZE;
 
 /*
@@ -94,6 +99,8 @@ struct kscand_mm_slot {
 	unsigned long next_scan;
 	/* Tracks how many useful pages obtained for migration in the last scan */
 	unsigned long scan_delta;
+	/* Determines how much VMA address space to be covered in the scanning */
+	unsigned long scan_size;
 	long address;
 	bool is_scanned;
 };
@@ -744,6 +751,8 @@ static void kmigrated_migrate_folio(void)
  */
 #define KSCAND_IGNORE_SCAN_THR	256
 
+#define SCAN_SIZE_CHANGE_SHIFT	1
+
 /* Maintains stability of scan_period by decaying last time accessed pages */
 #define SCAN_DECAY_SHIFT	4
 /*
@@ -759,14 +768,26 @@ static void kmigrated_migrate_folio(void)
  *		Increase scan_period by (2 << SCAN_PERIOD_CHANGE_SCALE).
  *	case 4: (X > 0, Y > 0)
  *		Decrease scan_period by SCAN_PERIOD_TUNE_PERCENT.
+ * Tuning scan_size:
+ * Initial scan_size is 4GB
+ *	case 1: (X = 0, Y = 0)
+ *		Decrease scan_size by (1 << SCAN_SIZE_CHANGE_SHIFT).
+ *	case 2: (X = 0, Y > 0)
+ *		scan_size = KSCAND_SCAN_SIZE_MAX
+ *  case 3: (X > 0, Y = 0 )
+ *		No change
+ *  case 4: (X > 0, Y > 0)
+ *		Increase scan_size by (1 << SCAN_SIZE_CHANGE_SHIFT).
  */
 static inline void kscand_update_mmslot_info(struct kscand_mm_slot *mm_slot,
 				unsigned long total)
 {
 	unsigned int scan_period;
 	unsigned long now;
+	unsigned long scan_size;
 	unsigned long old_scan_delta;
 
+	scan_size = mm_slot->scan_size;
 	scan_period = mm_slot->scan_period;
 	old_scan_delta = mm_slot->scan_delta;
 
@@ -787,20 +808,25 @@ static inline void kscand_update_mmslot_info(struct kscand_mm_slot *mm_slot,
 	if (!old_scan_delta && !total) {
 		scan_period = (100 + SCAN_PERIOD_TUNE_PERCENT) * scan_period;
 		scan_period /= 100;
+		scan_size = scan_size >> SCAN_SIZE_CHANGE_SHIFT;
 	} else if (old_scan_delta && total) {
 		scan_period = (100 - SCAN_PERIOD_TUNE_PERCENT) * scan_period;
 		scan_period /= 100;
+		scan_size = scan_size << SCAN_SIZE_CHANGE_SHIFT;
 	} else if (old_scan_delta && !total) {
 		scan_period = scan_period << SCAN_PERIOD_CHANGE_SCALE;
 	} else {
 		scan_period = scan_period >> SCAN_PERIOD_CHANGE_SCALE;
+		scan_size = KSCAND_SCAN_SIZE_MAX;
 	}
 
 	scan_period = clamp(scan_period, KSCAND_SCAN_PERIOD_MIN, KSCAND_SCAN_PERIOD_MAX);
+	scan_size = clamp(scan_size, KSCAND_SCAN_SIZE_MIN, KSCAND_SCAN_SIZE_MAX);
 
 	now = jiffies;
 	mm_slot->next_scan = now + msecs_to_jiffies(scan_period);
 	mm_slot->scan_period = scan_period;
+	mm_slot->scan_size = scan_size;
 	mm_slot->scan_delta = total;
 }
 
@@ -812,6 +838,7 @@ static unsigned long kscand_scan_mm_slot(void)
 	unsigned int mm_slot_scan_period;
 	unsigned long now;
 	unsigned long mm_slot_next_scan;
+	unsigned long mm_slot_scan_size;
 	unsigned long vma_scanned_size = 0;
 	unsigned long address;
 	unsigned long total = 0;
@@ -841,6 +868,7 @@ static unsigned long kscand_scan_mm_slot(void)
 	mm_slot->is_scanned = true;
 	mm_slot_next_scan = mm_slot->next_scan;
 	mm_slot_scan_period = mm_slot->scan_period;
+	mm_slot_scan_size = mm_slot->scan_size;
 	spin_unlock(&kscand_mm_lock);
 
 	if (unlikely(!mmap_read_trylock(mm)))
@@ -992,6 +1020,7 @@ void __kscand_enter(struct mm_struct *mm)
 
 	kscand_slot->address = 0;
 	kscand_slot->scan_period = kscand_mm_scan_period_ms;
+	kscand_slot->scan_size = kscand_scan_size;
 	kscand_slot->next_scan = 0;
 	kscand_slot->scan_delta = 0;
 
-- 
2.34.1

