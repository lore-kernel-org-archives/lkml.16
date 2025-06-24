Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406911ACEC7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744752; cv=fail; b=IHXlXAtixDnnNzChCbVticXvC35BDTwwE6c5B+OhQuiBcZ1VK3wUHrUOTM4o3fQ2O1wnYzDr9g+aEqxL2L1mVj9YqOpg2i/gXYzLWavbo82yYUD7OTqL+w2FThnfAzp+b2Bpx+Ehm4/jwaSGgWawrLdYq/jgh/bPWbF8SnADzTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744752; c=relaxed/simple;
	bh=9M65CGbM34QfG9K8CMW9NfGvvdd2jHcsw7LFVRwxST0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZVY9xEYkd1rpJKxWnsqTUaX2Icr6L8JdsXyTGBmE1su/BNemtQrBW8BUahhwf3tD5g0M3FSxy9naj8UgwSLeMA4Ticx6uszX2Be6W7bbIMnEm92B6MswSEUuO0peghFOIorglfiOn04VZBcQHGYWNp7gbVHUNfW6FBtk0ZmLPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JLZDWksO; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JLZDWksO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRJKZtIGEg1u3cVy3moNzrbGt+vLaB0nWKroEcJVBZysi59IR3jEDtKleA8LbR3MbsHQJT2n7yBUb04XpFZrEh47SJPhVixN+cAkHIk1YE2jOn4N+KX++j8pT2LiEnZXC3wSlIYZw/9AjGemejdwuo9Z6ye9Vyl3PJPq+w+/u2/lY4Hl0WvyY4be5h66E1etmcVYo+Z7aPp+rlNyQqwR5OE2cblHcgUlmpTn6hO5m6iMnqjQ7+KRJteZSWB7eFXJrjP9Lt5OfR3vHOngcFogBMfLfHd5qYu8UFzL7Ujeq63qPFbxh+APxjSx75fy9VCJluWPEWSVmEQCUyO1S+x0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKaAakPxqUSAFILU7cEmHZbRTs/vYYCAD9wl7zSr8CI=;
 b=L2VK3QN8FigIJkpf9ZnwkEC0HsstvoFKSWMJ6+CekooBj8eGMkDpKjH3KGCGOTRDdVbd1iqGoBoQrcXHhBfv9DzHl6XEHWEDJm/bvluB1ShSIVD+bSXL9ROZvLczDZMi6ZVbjj4NGDIEaGZzr9w6n7Dnlb+AdBYZ8WhPO//OCBoaZGszHoRtIJkCFFWHCCnr9aWe4XuwlXnqEdvKr4cQxe0HAwrmLPXrJLbGmR9Q5LkWO2Rc0TkvpZMjLbGfhz7e1c+g+L4EWLUUT7SY1Iq0ab2EB4CLkCvhX2wxlwx2fv96+Nd8ikJQyv56U62kywKUb/8JWdENgDlwojx5DDVyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKaAakPxqUSAFILU7cEmHZbRTs/vYYCAD9wl7zSr8CI=;
 b=JLZDWksO4vqNptwHIQSMiE/Dfb7fZz+kWtCphwOwTPeKtQoJeUH7VBknUfeGYMG6LnNyDOsfaSrPHEvyDzCyON6K1pqkrpFUkHsKUOemv4j10nOfN5MgeLIOzyNUpQoDXNNxcyH4KA/leums9krL8gfrk9/EiQEukjDwxK6vFEw=
Received: from MW4PR03CA0336.namprd03.prod.outlook.com (2603:10b6:303:dc::11)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:59:06 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::84) by MW4PR03CA0336.outlook.office365.com
 (2603:10b6:303:dc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 05:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:59:06 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:58:50 -0500
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
Subject: [RFC PATCH V2 12/13] trace/kscand: Add tracing of scanning and migration
Date: Tue, 24 Jun 2025 05:56:16 +0000
Message-ID: <20250624055617.1291159-13-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: b063c693-2074-4ae4-4a9a-08ddb2e43ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMHyX30NOlqFNBO6jjfnqZhfXP+xRs7VDzMgBCuYP74zNGPrYQl3inYcOu8b?=
 =?us-ascii?Q?c4qq2j06VR6RuQZGw+Yo0xV+Vg8XfiOWrUZdwsBqpBGTIEDsE+0SmHu0bs6n?=
 =?us-ascii?Q?SM/mqpiPUcaaVVkfuMiJEx16vA649FTh/LpF0EiGVCEeqtat6bmDxEUw+utH?=
 =?us-ascii?Q?87EMyvMoD7r39end/zOv70IfH6KyMKvavri0BmaagDvWKL2h9yV9fPFLPQEN?=
 =?us-ascii?Q?/n4YjnKJnSm8xZ3ty9HWM9Kd1pKaePkpEMqiua/sk2juMTVhhc7G46rCT3RU?=
 =?us-ascii?Q?sRdo7xQSMfV2+zNU6/smwM13W5Tf+TPCSlNjhNDMqkw//D6ubeEZOzSlbpLx?=
 =?us-ascii?Q?o8O1PBHNAKoU6Uad6L8PRdgHRwH3eq1xCFWHDTP2hxbWnBSwguMKzI4jnncR?=
 =?us-ascii?Q?ePGxIocxfCX0zNh4iwpxvhcT4v/5kGb6+hIIskg7Thp+JvKFT4ILTvvA/RvL?=
 =?us-ascii?Q?zsbCyGZ87YPvFwk+Xc/aCtG00yNT5+0J2M4gUcPRAC9lvgY2bB/ap+SgOauf?=
 =?us-ascii?Q?qJUA6njWZmaLr3sDlt3Y/Q5rt1vxgTvyjRG6bqvgiNav/Z8oZh4SUiq6hWKP?=
 =?us-ascii?Q?EWxYGQuxLJoiNCTjR5wjAZRHIX8qWvGz/ZYu+for5yOm2rEc71Zh/JMHtzh1?=
 =?us-ascii?Q?ZlV/okT2iX2GMHWB+27h9nrWC7hmyq+hV4q4DovLRCJdsZG7Z8xFNduELk9O?=
 =?us-ascii?Q?FkiMjmcL59Q9gPEZKlkzNpm9Ytp4ibUm0ZKB0Lzx7R5SAXX9otLAjuW6ARa5?=
 =?us-ascii?Q?KFWP/1WD0kO28VXhlP3RgZqnN2zoMJ+rhBoxWg8JVsAkd88ioixF4usfXWMj?=
 =?us-ascii?Q?aD3isZAmw2nh1mqbOBYYGeogoXHK/7ioX7gbH4NKw2PlaJHzmzBHD0nP45t9?=
 =?us-ascii?Q?IgU1RSG6UhwKiVmgC++tdG4933HPpPEYQUM1mDWqNe+eHB8RG0+8DbXea+NF?=
 =?us-ascii?Q?7IVaem/wd2UHECYkUPhH/SNjl2v32NIFtfBPhFyVCuHdu/x65g4R4dUyYNGn?=
 =?us-ascii?Q?ju4Ozr3B5WVqrH+CXnCWgEqhA8Zcv1bnRpbB1mEDogEBkx10P/suvy5owmZG?=
 =?us-ascii?Q?/fTFN9HGEJ2vjp19BlCuaxwmx55bb+U719lok3tyk/9rKvm602IQWtYjFwkl?=
 =?us-ascii?Q?PcvcycukdM34BTXEfuFhh3i7Vo1IxHgztRpPB0/1hYVtyUDRoX2v6Vegzm0Y?=
 =?us-ascii?Q?OU+QIlKl1okIiC+OIXsIHc/+ykq1AuMzm6RoT/b9ZVW1uuX8lfRz3K7xSh4+?=
 =?us-ascii?Q?YAzoEhiC1GPsrI7G3nBnzFmJhs13oKnAGaFe9IUSlOkivjwCP1JxWmOSyFvL?=
 =?us-ascii?Q?O/l/RJw0JC2uUG1hdGvV8dzqFedbzbuIvB71O/o0H8MEeGBKjviNHcOydIqp?=
 =?us-ascii?Q?HfMafrHrT6sjWBLXGMP0auiZTBYa4fOwFEJ+eWDfFX1YqOQi5XbX1gb/Up5L?=
 =?us-ascii?Q?9QgrvSMyDTxJqD5N/O8ow6EKeH/QcXO2KDVIlqFBQ1/+wlmnY7RWh/Uly22/?=
 =?us-ascii?Q?j4X01igDJ3pDbYXm3DqGxx8Bz4lLgWLZqe5A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:59:06.4876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b063c693-2074-4ae4-4a9a-08ddb2e43ad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838

Add tracing support to track
 - start and end of scanning.
 - migration.

CC: Steven Rostedt <rostedt@goodmis.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>
CC: linux-trace-kernel@vger.kernel.org

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 include/trace/events/kmem.h | 90 +++++++++++++++++++++++++++++++++++++
 mm/kscand.c                 |  8 ++++
 2 files changed, 98 insertions(+)

diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index f74925a6cf69..682c4015414f 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -9,6 +9,96 @@
 #include <linux/tracepoint.h>
 #include <trace/events/mmflags.h>
 
+DECLARE_EVENT_CLASS(kmem_mm_class,
+
+	TP_PROTO(struct mm_struct *mm),
+
+	TP_ARGS(mm),
+
+	TP_STRUCT__entry(
+		__field(	struct mm_struct *, mm		)
+	),
+
+	TP_fast_assign(
+		__entry->mm = mm;
+	),
+
+	TP_printk("mm = %p", __entry->mm)
+);
+
+DEFINE_EVENT(kmem_mm_class, kmem_mm_enter,
+	TP_PROTO(struct mm_struct *mm),
+	TP_ARGS(mm)
+);
+
+DEFINE_EVENT(kmem_mm_class, kmem_mm_exit,
+	TP_PROTO(struct mm_struct *mm),
+	TP_ARGS(mm)
+);
+
+DEFINE_EVENT(kmem_mm_class, kmem_scan_mm_start,
+	TP_PROTO(struct mm_struct *mm),
+	TP_ARGS(mm)
+);
+
+TRACE_EVENT(kmem_scan_mm_end,
+
+	TP_PROTO( struct mm_struct *mm,
+		 unsigned long start,
+		 unsigned long total,
+		 unsigned long scan_period,
+		 unsigned long scan_size,
+		 int target_node),
+
+	TP_ARGS(mm, start, total, scan_period, scan_size, target_node),
+
+	TP_STRUCT__entry(
+		__field(	struct mm_struct *, mm		)
+		__field(	unsigned long,   start		)
+		__field(	unsigned long,   total		)
+		__field(	unsigned long,   scan_period	)
+		__field(	unsigned long,   scan_size	)
+		__field(	int,		 target_node	)
+	),
+
+	TP_fast_assign(
+		__entry->mm = mm;
+		__entry->start = start;
+		__entry->total = total;
+		__entry->scan_period  = scan_period;
+		__entry->scan_size    = scan_size;
+		__entry->target_node  = target_node;
+	),
+
+	TP_printk("mm=%p, start = %ld, total = %ld, scan_period = %ld, scan_size = %ld node = %d",
+		__entry->mm, __entry->start, __entry->total, __entry->scan_period,
+		__entry->scan_size, __entry->target_node)
+);
+
+TRACE_EVENT(kmem_scan_mm_migrate,
+
+	TP_PROTO(struct mm_struct *mm,
+		 int rc,
+		 int target_node),
+
+	TP_ARGS(mm, rc, target_node),
+
+	TP_STRUCT__entry(
+		__field(	struct mm_struct *, mm		)
+		__field(	int,   rc			)
+		__field(	int,   target_node		)
+	),
+
+	TP_fast_assign(
+		__entry->mm = mm;
+		__entry->rc = rc;
+		__entry->target_node = target_node;
+	),
+
+	TP_printk("mm = %p rc = %d node = %d",
+		__entry->mm, __entry->rc, __entry->target_node)
+);
+
 TRACE_EVENT(kmem_cache_alloc,
 
 	TP_PROTO(unsigned long call_site,
diff --git a/mm/kscand.c b/mm/kscand.c
index db7b2f940f36..029d6d2bedc3 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -1035,6 +1035,7 @@ static void kmigrated_migrate_mm(struct kmigrated_mm_slot *mm_slot)
 			}
 
 			ret = kmigrated_promote_folio(info, mm, dest);
+			trace_kmem_scan_mm_migrate(mm, ret, dest);
 
 			/* TBD: encode migrated count here, currently assume folio_nr_pages */
 			if (!ret)
@@ -1230,6 +1231,9 @@ static unsigned long kscand_scan_mm_slot(void)
 	mm_target_node = READ_ONCE(mm->target_node);
 	if (mm_target_node != mm_slot_target_node)
 		WRITE_ONCE(mm->target_node, mm_slot_target_node);
+
+	trace_kmem_scan_mm_start(mm);
+
 	now = jiffies;
 
 	if (mm_slot_next_scan && time_before(now, mm_slot_next_scan))
@@ -1300,6 +1304,8 @@ static unsigned long kscand_scan_mm_slot(void)
 		kscand_update_mmslot_info(mm_slot, total, target_node);
 	}
 
+	trace_kmem_scan_mm_end(mm, address, total, mm_slot_scan_period,
+			mm_slot_scan_size, target_node);
 
 outerloop:
 	/* exit_mmap will destroy ptes after this */
@@ -1453,6 +1459,7 @@ void __kscand_enter(struct mm_struct *mm)
 	spin_unlock(&kscand_mm_lock);
 
 	mmgrab(mm);
+	trace_kmem_mm_enter(mm);
 	if (wakeup)
 		wake_up_interruptible(&kscand_wait);
 }
@@ -1463,6 +1470,7 @@ void __kscand_exit(struct mm_struct *mm)
 	struct mm_slot *slot;
 	int free = 0, serialize = 1;
 
+	trace_kmem_mm_exit(mm);
 	spin_lock(&kscand_mm_lock);
 	slot = mm_slot_lookup(kscand_slots_hash, mm);
 	mm_slot = mm_slot_entry(slot, struct kscand_mm_slot, slot);
-- 
2.34.1

