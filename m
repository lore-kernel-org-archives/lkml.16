Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D9223D291
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744658; cv=fail; b=k+O1PCxOqcG1dIyNDw/80ZBOVQPNI2sgCy+tQxxYyNrAuilvTpuWu8MjK4nXvUztPvFFkZo5ijsP9qvfob7c4jpDsycivt8aVfYBnx74qzxvo24oOBFZ8poSof6ejUrr6a8xmRIJUDXrvNGD08E7pm6WBU03vszHr+1qtJsEZ34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744658; c=relaxed/simple;
	bh=mlKbFyLO879L9ZGO6W2Todke4iYvjPDaXw9kiH2FtTc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rt0rdlvL2urAC0BvLqc6ilfpQtEUXO333OMs2S8DWiKQSD7vTjQLj5TK8jpMwmcCLV6y0kwt4fN4qq+C2UY7Qn9RiSIHVfavTDr3Lb2wA87vHpweZTKeM+XkNYjAYKtAuepCsXuhFhB3klETVLvhIGnzjVBms01SBf295WC14M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xvJyB0q6; arc=fail smtp.client-ip=40.107.223.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xvJyB0q6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuKhrtBrhzTdBq979O6kM3zs1fyNCi9z8w7mnUCzno+lAaM54jXUWolxaVe7NDzZ/d+5ry+swQRWZ1HFht9L5KVl+5ySICV4/1S2GLhpaGkAxiI0DYNj2ojPsKHof8wVx5LbkW1pFbSmnUx31vy+DyX3zeNC2diw/dnc3528jgQQLvr8P0z3XMBp5u4vH4KmsgEhUtSjS0JeTGa/ggVIM+SYwUqhiTsYmamRDX0WAvyqCR4mv3Hq+BG2saT5UOBe5g0KQAWczOV+FnIoFdtSX4xyYzdysi7wi5YGJYiiH2r4+ZKKL+dLe2mgY5667x4atjgxgPbpvQ8obwNIGLwB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdOQYLhTNCqfmU1NWburArptQfvvwJQRaJdxML9mfgk=;
 b=PB58cMY6lnzAop+782r1g8sUScELVrMi6cETs4wh9bRzwGkTlRQuKy+pkUMNfxwzm34jEe7iaTgRS8F3rNoLx/yESETSQ9jHVHBFxe2K6wg0SLhF1tD1rGAxdSAXsOkdG6xoeNRVFJ0JpdYdQS2dzV71slSTemaC5jASZJEVnji2etEWFA8a0yMgFVjTOAOLjs5wCCChlI5vemObOfpkrhNRoBWtuzZBNnm4kJAUveiNoOSDmofCvam4/mVAyKBwglSnqnhdfNfkucYVpYnxR9OmDcf09WsdI4cpzA0+NqrQAlbw1Z6PFf7cQMfL+2yMxVEVauSmESCbDIX+V6nUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdOQYLhTNCqfmU1NWburArptQfvvwJQRaJdxML9mfgk=;
 b=xvJyB0q6TRk+nHp/ClBL6zctGZtF4P2X3Q7lB1UlxNQONDvYSRI3jdm/vrhpU/J2bpHHecdDqzMjaQn8sy1E7I41Ajy1p2HEMqByxcBWzQUJTT8X8bzSmrAUJ8flI0AwQgkvBRtMC1SLuPGL4rINuoQJ3oflgeQu3iJlE08I05w=
Received: from BL1PR13CA0314.namprd13.prod.outlook.com (2603:10b6:208:2c1::19)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 05:57:33 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::8f) by BL1PR13CA0314.outlook.office365.com
 (2603:10b6:208:2c1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.15 via Frontend Transport; Tue,
 24 Jun 2025 05:57:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:57:33 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:57:22 -0500
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
Subject: [RFC PATCH V2 04/13] mm: Create a separate kthread for migration
Date: Tue, 24 Jun 2025 05:56:08 +0000
Message-ID: <20250624055617.1291159-5-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee3e0f7-99d2-4050-1d4b-08ddb2e40376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D5TdYBKICLghZNF4X5Ls02v2mzMzaXij1eFPDsYzkx+bLvF3n9wix8oSD0Vh?=
 =?us-ascii?Q?IncSw2r+5g7X86EbIscInfr677P63VNE8lsV5nXn2KSqOSF5ZBQXtINv6giL?=
 =?us-ascii?Q?htZREeIaWWGXBLFhwbmp9oNvdpWrmCh6ExIl4mqHsjIfTZiYom2xj6xnFBc0?=
 =?us-ascii?Q?yy7xiDHGCkbTH+xvTbDI4tQP+IerW8T7vp3jO/DVRaekah3MDJUPi+n0bmhr?=
 =?us-ascii?Q?owSE2JuKX8LCBCCEUP1vAbcfcb3ENSx+WcKvHGeoGugOBOrWyxIiEgUgl1/e?=
 =?us-ascii?Q?7xrljFbagC3/p7wItJWmcULigbdPhgXjw6N4/LnygybUaBd0JPjPJSMbuz3o?=
 =?us-ascii?Q?16De7sUFSRWAEh0G3ROaSw8U+x8CiJfMbjQDFJfkipGOdCYzjvbHQ6c34Z+y?=
 =?us-ascii?Q?yP/YytF7a7Dxum9kJQ6HKOHlQbBS0JE0HWyQsMvM2AWaVMXFqbRDWtr+udDl?=
 =?us-ascii?Q?93ZQyHFfFXL6AUboIxfpDtAOg26sBlu2BniKZc6xLuRFawk23eDKMbJCSaB5?=
 =?us-ascii?Q?vpifciJ0//D7H83yNQUaI020zu4q1wsZzDiy4g89KJfGvX0zKJVr2m6Rk7rh?=
 =?us-ascii?Q?M/K9MlAlXZg/sxzA4yc0UUEkhbISaPWmmpTGI6in93P85wAtcIf9GYVRI/Mh?=
 =?us-ascii?Q?Gxqe/FItZt+0UsouFGO/VsnUxsi4VBLVYnKzmKtH0KtVGvS20PB44X1b1NwV?=
 =?us-ascii?Q?yoXp2TxRsnVnB+/W36lQvjsGQ9C9tjBviz7j/M7+kpkTFWOXQqw9C9Ck3NcQ?=
 =?us-ascii?Q?hp+m9a0C6PBfLziW5Dd+st/eu4c/G6hxDrg/WpPq7H+AoutU5ykCYCBthJy7?=
 =?us-ascii?Q?H6viW4vUkR3HDFgv4SKTVnEwp4MzjCbq75jTDY2h9H/NTTtfXYkKKSd+kgGb?=
 =?us-ascii?Q?k2qeJEAUGDaK9HJKmV7iguiherKdaiRe6/438atTh0lV95p39O25AFFy+KST?=
 =?us-ascii?Q?0XtyLgGl3EJZzZzRF1UYpcITFT/YQ6xsIVib25QOC1nTh9qyS5Zu/xu1ZPEh?=
 =?us-ascii?Q?NXHYxi+lx+CJTKRIkzctT6IYHJl/D8MyCVRAew6cc+QnqY32Tbia5yL2kZ5U?=
 =?us-ascii?Q?Wm2m8xBJcdu9as1+axfRN7kLtaEq6w7D8yfk2uhioqqmRVZhKEcbSTVILxS7?=
 =?us-ascii?Q?Z2Qg00mRIfJRIauquqF0IQdCowoq3+Wnh4YtXl/LmCTEYBrbrUZEbef0i7zE?=
 =?us-ascii?Q?FFNJE1ociL8ztDu9Qu+JIFovfpAvMILlpvmOaAWVNh3nBgDn791L3hBOZkVg?=
 =?us-ascii?Q?QdM0bAk2xlxEiihnKOX55FnP3AT+aEtLj6UZziXUCVQaGuSK3rDBCQGtCQ1J?=
 =?us-ascii?Q?kaUt/0noCAYAN2ZBuU0GV47ErhKf3oxcMIcFfV5eJGLUfzv0uI+GUOqDQ/Zu?=
 =?us-ascii?Q?NKs15+gqdT4sn25K17XS/W0T71vCMV4T/QoFUyFLh1kEhLkTOerhIYkK2+lL?=
 =?us-ascii?Q?gbRkHI8FRr3lZtzo6H517BoMkrD/bujj7UBT3xX/VRC2r5zViHH5NE9QdqNW?=
 =?us-ascii?Q?U8NHbdQvGiCCbrUR2xKDM+GITSZ7SEt7w1gs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:57:33.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee3e0f7-99d2-4050-1d4b-08ddb2e40376
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311

Having independent thread helps in:
 - Alleviating the need for multiple scanning threads
 - Aids to control batch migration (TBD)
 - Migration throttling (TBD)

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 mm/kscand.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/mm/kscand.c b/mm/kscand.c
index 0edec1b7730d..e4d8452b0c50 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -4,6 +4,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_notifier.h>
+#include <linux/migrate.h>
 #include <linux/rmap.h>
 #include <linux/pagewalk.h>
 #include <linux/page_ext.h>
@@ -41,6 +42,15 @@ static unsigned long kscand_mms_to_scan __read_mostly = KSCAND_MMS_TO_SCAN;
 
 bool kscand_scan_enabled = true;
 static bool need_wakeup;
+static bool migrated_need_wakeup;
+
+/* How long to pause between two migration cycles */
+static unsigned int kmigrate_sleep_ms __read_mostly = 20;
+
+static struct task_struct *kmigrated_thread __read_mostly;
+static DEFINE_MUTEX(kmigrated_mutex);
+static DECLARE_WAIT_QUEUE_HEAD(kmigrated_wait);
+static unsigned long kmigrated_sleep_expire;
 
 static unsigned long kscand_sleep_expire;
 
@@ -79,6 +89,7 @@ struct kscand_scanctrl {
 };
 
 struct kscand_scanctrl kscand_scanctrl;
+
 /* Per folio information used for migration */
 struct kscand_migrate_info {
 	struct list_head migrate_node;
@@ -131,6 +142,19 @@ static inline bool is_valid_folio(struct folio *folio)
 	return true;
 }
 
+static inline void kmigrated_wait_work(void)
+{
+	const unsigned long migrate_sleep_jiffies =
+		msecs_to_jiffies(kmigrate_sleep_ms);
+
+	if (!migrate_sleep_jiffies)
+		return;
+
+	kmigrated_sleep_expire = jiffies + migrate_sleep_jiffies;
+	wait_event_timeout(kmigrated_wait,
+			true,
+			migrate_sleep_jiffies);
+}
 
 static bool folio_idle_clear_pte_refs_one(struct folio *folio,
 					 struct vm_area_struct *vma,
@@ -533,6 +557,49 @@ static int stop_kscand(void)
 	return 0;
 }
 
+static int kmigrated(void *arg)
+{
+	while (true) {
+		WRITE_ONCE(migrated_need_wakeup, false);
+		if (unlikely(kthread_should_stop()))
+			break;
+		msleep(20);
+		kmigrated_wait_work();
+	}
+	return 0;
+}
+
+static int start_kmigrated(void)
+{
+	struct task_struct *kthread;
+
+	guard(mutex)(&kmigrated_mutex);
+
+	/* Someone already succeeded in starting daemon */
+	if (kmigrated_thread)
+		return 0;
+
+	kthread = kthread_run(kmigrated, NULL, "kmigrated");
+	if (IS_ERR(kmigrated_thread)) {
+		pr_err("kmigrated: kthread_run(kmigrated)  failed\n");
+		return PTR_ERR(kthread);
+	}
+
+	kmigrated_thread = kthread;
+	pr_info("kmigrated: Successfully started kmigrated");
+
+	wake_up_interruptible(&kmigrated_wait);
+
+	return 0;
+}
+
+static int stop_kmigrated(void)
+{
+	guard(mutex)(&kmigrated_mutex);
+	kthread_stop(kmigrated_thread);
+	return 0;
+}
+
 static inline void init_list(void)
 {
 	INIT_LIST_HEAD(&kscand_scanctrl.scan_list);
@@ -555,8 +622,15 @@ static int __init kscand_init(void)
 	if (err)
 		goto err_kscand;
 
+	err = start_kmigrated();
+	if (err)
+		goto err_kmigrated;
+
 	return 0;
 
+err_kmigrated:
+	stop_kmigrated();
+
 err_kscand:
 	stop_kscand();
 	kscand_destroy();
-- 
2.34.1

