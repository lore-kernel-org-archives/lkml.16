Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFE11D63D3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619146; cv=fail; b=i41apR2+J7Kukek/QMIlfUsR7XYomdHa7V7JNygU7QWmtJXWieJG1lkj3+SG/fpPG61TWqABsi+maP9YFvHTrbiuGyzOF8Sb16gZ5yV/V3FH7LcrRiJiKzR/uXKr7bs9Gp7st7f0zvl/11HEbq9EQmy6f0yOR/Ud1XBdGC2Tmbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619146; c=relaxed/simple;
	bh=FRIvBXAyl1D9eJbUzS1wGGaTljaQtJFngJshBmihAPY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZMEwP9yJESHVdHDGA6e7sfkGXdcF1fryRfConowe1Xf1o71bv5lNTfON4G6KuS1FKvxRiad6GBJNX0bd/ZEKqhixJ5a6BLP9iVpxI5bcndujCYKlcBECYy3dd9G7PbjBWtd3dOcv9YTB+VKqPjCz0lETfv0GLM3Bxu3196/aLMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FKEIjbfk; arc=fail smtp.client-ip=40.107.223.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FKEIjbfk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zw0XvVE4u3PIERdoGa8Sv1w8BDjxlmpfLRpxoMzX2xH/l9SGvzmIh75qOUoXF43ogFU7wUfEWzVnOvMSQ8tB3owLi76Sf5J2Gi3FjfNDdN1mzkDJqqCZM8tw51FQpm1VO+6emJXjPrZjMLNNuAl3K5xzkemMLmm4J2/etRtb+j0VkBT7y+3HeflmB17xKnEN7bepruAo42FxRzhe5Qj9FjKRiyYq3THL6r0E29GLT9EUoUdCoNCx5A2KND2UgekCfnOEC23cfbygzfxnx0TR1nMu7ut+kmqgPqydByEVg+5SgVxww8R3anLffEnq9LsTBDnryN0pFS9HtB/toAObFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19CeiAnzjKHVe5Ppe8Ya3G55ATYr3ahsjTDTv32LodE=;
 b=NGNnjxQ9DF7c5uLWzY1dDwP8xUfNtnBbXdaBLFb1TObbqK5KnMyEG2cRJfXwXFM/3tRhAniK8PG4wS4o9xIsPKOCrdkyExD8mBIUyMwE5X7UnF5imHdoZTP3vqr56TNkAZ/MwgIb9m2E2S7PT7VP/oqOItz0d9M075WTKaVFnxMpN2902WxAyY2N9q5U9XYy/jdRJLJY7rHG8vjPVjhPaeyut2FA/bRh+N9Jlygbp4JwCLF0EbdwhCOjQnFcYwOxxwktyWs0KUPSk25D4zCFTMzWK2ZSIm5IQ7Cp9FgUzOpXZr//sM3kp1zlnbdULmzyI5HenJCw+MUGSeZZDepoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19CeiAnzjKHVe5Ppe8Ya3G55ATYr3ahsjTDTv32LodE=;
 b=FKEIjbfkd00TZF0r6XECw8re6f745aRyfeMZzOq56+f1SdeGfCP78l1lhLxXGWttuwabq8eXjqbfM1ahuff0tN34Tao4evTkvrZ6qlWEj2D6/ERXYVLN/QmUdXrl8lhc0bpGvp+ElewXU6oFJIZ0tBouY4k+YHaxd6Ye3JAcAZU=
Received: from CH0PR04CA0034.namprd04.prod.outlook.com (2603:10b6:610:77::9)
 by SA1PR12MB8120.namprd12.prod.outlook.com (2603:10b6:806:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 18:39:01 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::f6) by CH0PR04CA0034.outlook.office365.com
 (2603:10b6:610:77::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 18:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 18:39:01 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 13:38:57 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>
Subject: [PATCH] sched/wait: Use guard() for wq_head->lock
Date: Wed, 2 Apr 2025 18:38:43 +0000
Message-ID: <20250402183843.15540-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SA1PR12MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8b5a91-53b6-424a-282a-08dd7215a302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ecP4oO7XwOGjHxRXuPOTEbRQ3tjTfxA8kiBfEv805DpXakMxyYbK6mEOoSsz?=
 =?us-ascii?Q?RKq2+922N4zMF8URmoG0ErmFWbv8uA7rHpkvRXZPTUEy6/j0dWNMy0nmZJxq?=
 =?us-ascii?Q?HbwVbiWKTfgNJPqlrNsNJjEz3Wvq2szmrcGjD9fOQ0Xy6uVQ/MMcXe1qN+XM?=
 =?us-ascii?Q?/wSniEAMlERP6J1DWHObDZWszaRr65YpUtFKELsN5FPZ/nzz7YXKzpcwOV2a?=
 =?us-ascii?Q?bKud/VOVCxwvjMUaeJwSN4/HWwXJZLGzamtqRdr3sw2+A6xIHPc1xNeCnhzX?=
 =?us-ascii?Q?t3KqnVFdiokRJXQYmZTyZ2jDH8K5OGsp2JKbmj/MC3goemtiouhVLrbuwmYb?=
 =?us-ascii?Q?gVkq/aju7CeD7oBO6LFpqP0X8vcXRQqTZgES5L5+7tZ/VR+kPvjZan/KA25V?=
 =?us-ascii?Q?foPJ96opXBtkzhntugMQ+/i6fhAQf2IZWNljmimp/JvCUnHv/oQBJUYbtcWG?=
 =?us-ascii?Q?Ynrg6lFRrB0ol/YXCO5Nb8Eq9+lK0n5wFjewf686HzCM9A5l1ynPSZzJ4tPh?=
 =?us-ascii?Q?uRnt5VT4gbOMsAcWzCnArZrH+Jst+9gzyrp2ges26tvTwHNgCwp9tvAbBZX4?=
 =?us-ascii?Q?r9Zh8Dmeiq60xTwvoYIN7+2ARnO+d77LOhs+wnEC4rAV/Twlm/NTJzA0rFgb?=
 =?us-ascii?Q?dXu7kp5j8ny0x8X7hCS0RC2n+z5jRNHxRy+dmf6Ozrf0PV14AowdvUd1o58y?=
 =?us-ascii?Q?xm5tepQhfxGe7j3cIYXRe7NWT56bELWshIwXNlm7c55dingo3hUK9icxXVYr?=
 =?us-ascii?Q?0Ne+/clCy+n0GKI1nOumG1QIDj4UrpBxOaMQKguNLYsSjJJG1pwd1l2foVsS?=
 =?us-ascii?Q?jvsexNPM1njYJx1Jey4dIRWKKnwRxR3kRJIECqe61cCEhbREIfZa1+l9KZxL?=
 =?us-ascii?Q?FEc5qYFZNzQ+auADpuBYlGjeV9KeMi+m847ojNX7DqgLs6sG8wQpEyjE54Fx?=
 =?us-ascii?Q?j3GsLz6r6fCUqrAFy6iasi9cE05fp5zuQgO0IQFNzOw+drxd3WtOTvjh5Msi?=
 =?us-ascii?Q?uyzkZkIQPrfMXUsnuOwAonlm2AV4bFDGuW4OTG7XAFLz4BByWgTes81PZKY3?=
 =?us-ascii?Q?a5r8ZLIbFrKnxg54qJ68t3bZ6nkce+RwgBYkxgGUYOK2OOL3N2y/DTNIau98?=
 =?us-ascii?Q?RZhAiDzYJfoAf7AUp/mtXwjO+q4JgOr2d2J0Yu2v6l5fxoFw9m+rciDPrwh4?=
 =?us-ascii?Q?5RwfNnN+ScHWZp4fE4LQIJcIas4gb1P2+EkyxgolJoxyBfbuHIFZe0i9MKu7?=
 =?us-ascii?Q?uXUwLHZj/PP/mVgJ+PvHDuJsSUW3C5mwiH7Z85S4DLbBr1th/NfKHp3iAVGt?=
 =?us-ascii?Q?HzAgal4vXB7LxwcugG14K14KxBUegKRnbdKrTT8k/29P8ALTPgdnmCBaPXnf?=
 =?us-ascii?Q?+xoeCfxCCj2o/eOoHOcbRSEaT9PH7zq+0mQwrDViUNl2pgFey+P3y7aGgaPa?=
 =?us-ascii?Q?Aa8DodOFPHfZmcxuVhR7M+yOZYAc9HYP0z0suZu2gKMJq10Um8jXurUxX0ii?=
 =?us-ascii?Q?+px65ezQ4FCjHww=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 18:39:01.0560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b5a91-53b6-424a-282a-08dd7215a302
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8120

Using guard(spinlock_irqsave) for "wq_head->lock" helps eliminate the
local "flags" variable, the local "ret" variable in some cases, and
helps simplify the flow in prepare_to_wait_event().

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/wait.c | 69 ++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 51e38f5f4701..2cf7687e00e0 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -16,44 +16,35 @@ EXPORT_SYMBOL(__init_waitqueue_head);
 
 void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
-	unsigned long flags;
-
 	wq_entry->flags &= ~WQ_FLAG_EXCLUSIVE;
-	spin_lock_irqsave(&wq_head->lock, flags);
+
+	guard(spinlock_irqsave)(&wq_head->lock);
 	__add_wait_queue(wq_head, wq_entry);
-	spin_unlock_irqrestore(&wq_head->lock, flags);
 }
 EXPORT_SYMBOL(add_wait_queue);
 
 void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
-	unsigned long flags;
-
 	wq_entry->flags |= WQ_FLAG_EXCLUSIVE;
-	spin_lock_irqsave(&wq_head->lock, flags);
+
+	guard(spinlock_irqsave)(&wq_head->lock);
 	__add_wait_queue_entry_tail(wq_head, wq_entry);
-	spin_unlock_irqrestore(&wq_head->lock, flags);
 }
 EXPORT_SYMBOL(add_wait_queue_exclusive);
 
 void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
-	unsigned long flags;
-
 	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
-	spin_lock_irqsave(&wq_head->lock, flags);
+
+	guard(spinlock_irqsave)(&wq_head->lock);
 	__add_wait_queue(wq_head, wq_entry);
-	spin_unlock_irqrestore(&wq_head->lock, flags);
 }
 EXPORT_SYMBOL_GPL(add_wait_queue_priority);
 
 void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&wq_head->lock, flags);
+	guard(spinlock_irqsave)(&wq_head->lock);
 	__remove_wait_queue(wq_head, wq_entry);
-	spin_unlock_irqrestore(&wq_head->lock, flags);
 }
 EXPORT_SYMBOL(remove_wait_queue);
 
@@ -99,13 +90,11 @@ static int __wake_up_common(struct wait_queue_head *wq_head, unsigned int mode,
 static int __wake_up_common_lock(struct wait_queue_head *wq_head, unsigned int mode,
 			int nr_exclusive, int wake_flags, void *key)
 {
-	unsigned long flags;
 	int remaining;
 
-	spin_lock_irqsave(&wq_head->lock, flags);
+	guard(spinlock_irqsave)(&wq_head->lock);
 	remaining = __wake_up_common(wq_head, mode, nr_exclusive, wake_flags,
 			key);
-	spin_unlock_irqrestore(&wq_head->lock, flags);
 
 	return nr_exclusive - remaining;
 }
@@ -228,14 +217,12 @@ void __wake_up_pollfree(struct wait_queue_head *wq_head)
 void
 prepare_to_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state)
 {
-	unsigned long flags;
-
 	wq_entry->flags &= ~WQ_FLAG_EXCLUSIVE;
-	spin_lock_irqsave(&wq_head->lock, flags);
+
+	guard(spinlock_irqsave)(&wq_head->lock);
 	if (list_empty(&wq_entry->entry))
 		__add_wait_queue(wq_head, wq_entry);
 	set_current_state(state);
-	spin_unlock_irqrestore(&wq_head->lock, flags);
 }
 EXPORT_SYMBOL(prepare_to_wait);
 
@@ -243,17 +230,17 @@ EXPORT_SYMBOL(prepare_to_wait);
 bool
 prepare_to_wait_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state)
 {
-	unsigned long flags;
 	bool was_empty = false;
 
 	wq_entry->flags |= WQ_FLAG_EXCLUSIVE;
-	spin_lock_irqsave(&wq_head->lock, flags);
+
+	guard(spinlock_irqsave)(&wq_head->lock);
 	if (list_empty(&wq_entry->entry)) {
 		was_empty = list_empty(&wq_head->head);
 		__add_wait_queue_entry_tail(wq_head, wq_entry);
 	}
 	set_current_state(state);
-	spin_unlock_irqrestore(&wq_head->lock, flags);
+
 	return was_empty;
 }
 EXPORT_SYMBOL(prepare_to_wait_exclusive);
@@ -269,10 +256,8 @@ EXPORT_SYMBOL(init_wait_entry);
 
 long prepare_to_wait_event(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state)
 {
-	unsigned long flags;
-	long ret = 0;
+	guard(spinlock_irqsave)(&wq_head->lock);
 
-	spin_lock_irqsave(&wq_head->lock, flags);
 	if (signal_pending_state(state, current)) {
 		/*
 		 * Exclusive waiter must not fail if it was selected by wakeup,
@@ -287,19 +272,18 @@ long prepare_to_wait_event(struct wait_queue_head *wq_head, struct wait_queue_en
 		 * we fail.
 		 */
 		list_del_init(&wq_entry->entry);
-		ret = -ERESTARTSYS;
-	} else {
-		if (list_empty(&wq_entry->entry)) {
-			if (wq_entry->flags & WQ_FLAG_EXCLUSIVE)
-				__add_wait_queue_entry_tail(wq_head, wq_entry);
-			else
-				__add_wait_queue(wq_head, wq_entry);
-		}
-		set_current_state(state);
+		return -ERESTARTSYS;
 	}
-	spin_unlock_irqrestore(&wq_head->lock, flags);
 
-	return ret;
+	if (list_empty(&wq_entry->entry)) {
+		if (wq_entry->flags & WQ_FLAG_EXCLUSIVE)
+			__add_wait_queue_entry_tail(wq_head, wq_entry);
+		else
+			__add_wait_queue(wq_head, wq_entry);
+	}
+	set_current_state(state);
+
+	return 0;
 }
 EXPORT_SYMBOL(prepare_to_wait_event);
 
@@ -355,8 +339,6 @@ EXPORT_SYMBOL(do_wait_intr_irq);
  */
 void finish_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
-	unsigned long flags;
-
 	__set_current_state(TASK_RUNNING);
 	/*
 	 * We can check for list emptiness outside the lock
@@ -372,9 +354,8 @@ void finish_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_en
 	 *    the list).
 	 */
 	if (!list_empty_careful(&wq_entry->entry)) {
-		spin_lock_irqsave(&wq_head->lock, flags);
+		guard(spinlock_irqsave)(&wq_head->lock);
 		list_del_init(&wq_entry->entry);
-		spin_unlock_irqrestore(&wq_head->lock, flags);
 	}
 }
 EXPORT_SYMBOL(finish_wait);

base-commit: 328802738e1cd091d04076317f3c2174125c5916
-- 
2.34.1

