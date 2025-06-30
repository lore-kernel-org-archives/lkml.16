Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F8285411
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287660; cv=fail; b=BMFSMSZWsduodLJgxHGcm8EDduuu5I3KRvTkBTcWmPJbt+1cVLWyO8BgC2XztTcxeAHMvRt9Lt1gWYNDtadcQCkmM0D6Y2eDCcG//dT8x0bPyCG0EqCtj6g6sOuyEfIXFrgpfsWElSj41QoNk49+YZ/HMKL30FCyH0Ups4aNWzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287660; c=relaxed/simple;
	bh=EeoPpw59z63mmCCJZCHy8lWdb9gHjIcaMpHjqcbDEfw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nWC4nPMe+GA38uBg7Fzk2dolKEOfXU4GwH8VmW/9yYDSCPgFoq7R30jCSCyRrLiukxEJ9SmS2oy6R9Mb25GkvNxqwLSokbned8rXqnUxUdsScFK/Uuy36BUmJ+H/yQGajHK14C2rOnRmakBLaT14NOYDDlE6RJylDcRWMEZtHBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=UOBIa6YX; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="UOBIa6YX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqvKvwPNaUFEwBRhjhd0EHq99YhbHQdKJkVA54YFhXRjJ4Y3KDdroFe5hUytmQ3itX0PEbt0pEYcJMp8Dl1/HLDaJ/dCY/NjRTcqsF0N9zoFiOUrjjIthVW8rW7mNcquRLUHxJ1oAHsTRGwdGW7W99OZG6hTyudO0mTeIcCx3a4W8iPhSSqs4b5P0uaPfQrjmgzomsW5rf+T1pvPxSHOOjNMcmGq1JN9EHPFd9bOchg7mlvst7+HwYnP8Rcp/7nvv2kYEzrFpeA67rlZIAzvQBwTUYNSceaKg8UGvZINSNMKMoZshzGtuy8sKx6ylZgLP8XuW47qmUP8x3QwRifg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxpcUkj23bnYV/8piSvo9ttcKA20Gc1qOIZiOr7hBEo=;
 b=eTmkD+WhQ5BYQYWn6vKpcraJZGIdvzgEsG46AvrAFSEAq9OCTpnFh0s8Zni/s4xWVmVjdUM4+WG3qyGHwBFecKhpOZLZnuxDTnf9ewmTmeQY4Drz2RTK3wCjsiqUTgZhuX1WIErfjXi3WGZeG6SGeXddxXNGuGZi+qoN9w1xamb+fiwH3+k+NBsOyMlfekQf1pdoK6dgsJWKCN/JM+c/VZekVfVE5GyOrUZ/32t1YYP7HLKgqyidc1JyU3xK0DJpwG1Yi/IO/BOTewCwKxy+sAul+xODrYHUCYuE369krTlQSHsmXfnFeVf+OZKiTI831hySUVCoL76Q3AD1yM/mCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxpcUkj23bnYV/8piSvo9ttcKA20Gc1qOIZiOr7hBEo=;
 b=UOBIa6YXQteVrUr/ElVv1iRwjPfPcG8HSMX9pRMjvwn4d0aohydS/+bt65wLT++6SNhHlsOnOKvzes+e1BlYxFIcg/nw0var7w6KDikDSeFJZ8YJjztrypj39z5fxTA+gQZcDyWAfy3jl7RDDFzD1i+pgmpMEBv1JDqMWISEPf3Es/+NpM5Y8MIlOejmgMtZQILjO+FfkXXhrFTHTOZGYrk9/DKeSX2ZsXaDcj2jrD6yMxy4dI4tJMahdk0eYRe4stYT4EThsZSA2RP5G94a31jDhtkSPgxlabTbBhHAtPkypCr+gyFHZSTjl9XHZlc0nhLGvWxjFpjVEo1WQHAScw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com (2603:10a6:102:246::20)
 by PR3PR07MB8132.eurprd07.prod.outlook.com (2603:10a6:102:173::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Mon, 30 Jun
 2025 12:47:33 +0000
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60]) by PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 12:47:33 +0000
From: Wladislav Wiebe <wladislav.wiebe@nokia.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	mingo@kernel.org,
	tglx@linutronix.de
Cc: akpm@linux-foundation.org,
	bigeasy@linutronix.de,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org,
	wladislav.wiebe@nokia.com
Subject: [PATCH] irq: add support for warning on long-running IRQ handlers
Date: Mon, 30 Jun 2025 14:46:44 +0200
Message-ID: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To PAXPR07MB8771.eurprd07.prod.outlook.com
 (2603:10a6:102:246::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR07MB8771:EE_|PR3PR07MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: c82ab7b7-f9e8-4141-fea3-08ddb7d448b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7M3C/ehUKwUoCscx0atbDfFGbFIs2TJfxoN4+sY8OQwCTrwPosjVcBHdwspz?=
 =?us-ascii?Q?PMhzEByTzviDVhDEvBuc/0YO8g5j2hmMQB5+R52ohB9xci+QEA2MB8nJ9Iax?=
 =?us-ascii?Q?73AJBkDkfX6pLTsvFASlUzytQ5tbDZDZJ0ilcZqcowqbeEEE9SwkAOvoV5KC?=
 =?us-ascii?Q?4NpnjuaG7PG/eewNSGqOY8/Ojb5K73gbV+sZKg3kNvc2Es6To9eGgJyxS4tC?=
 =?us-ascii?Q?pcXlLjjMs7Wc3xOHPcwOLeoZ64QSWM2woqi7+/ViL4lxxAEiJ3aJ0JNsbnBR?=
 =?us-ascii?Q?gYf3d8d9m8FCaqlGPwGi83s/4U2daZoyCVUyXbZyQ3rYhfgm8pkf19fp8Jy6?=
 =?us-ascii?Q?M2q0WxAYWvw1CjFwXNk9IoqSD7Xuc+FFfi8tmRUvFjMaU+44sB7sClwLeB16?=
 =?us-ascii?Q?s/esOGZrJ5apqfptAjB7561BJOPWyhnrP1vJgbGYGqtBnoameXtyeY9ZsDCb?=
 =?us-ascii?Q?+Gi8xxRvUqKLTrJsWGY+3LyEHJG+cANgugyB62y82lgl1GdYVkFXFqO/qs9F?=
 =?us-ascii?Q?26gyvyq7M+fVilW5qFsJ6MvoyKrzoKrGoP8GakL0sZktEqYE1pAvL6t86TCl?=
 =?us-ascii?Q?amkeItoaD/gBzgw1fCi6DrdrHOfJxsAwGTp5Ikfy5THVw01jyHd5TGlNQskl?=
 =?us-ascii?Q?v/14p1sXaN+5zRi31jLOZ37RGK60fUzrYKA6b0t3GcJ86A9K6Y9B9Yozoe6Q?=
 =?us-ascii?Q?TLicQ24NXnYOlTyPT5BS5ckU2TJybla5tgc5bcwS6luMB93lPi5NDPAaX3Vp?=
 =?us-ascii?Q?KrdkWOu2yDzJNGz44gVPoDzb3bBRbAETXjAe/JKyEfmytJUHqrYllYswVdTE?=
 =?us-ascii?Q?XEbCk7naN+WmKOfI5w2fsD4OZNBZAB0eApjQNZI1UxazpoCFj7rN+pfLhYwe?=
 =?us-ascii?Q?tkh8NpTQI7w5++Wzyzq5MFQEFpvFFzKdW40ukOVWPqygHt5foYBz2L3bvocZ?=
 =?us-ascii?Q?+ak48hkRU1f5plSDp84uvPEIeYS6LXINr9tF2CAqaVOP9bAknJfzq0zXgnDX?=
 =?us-ascii?Q?pNHY/T4AF8OJgjFLqdRaXYk5a+5TyFap4P6VOP5gtjma5Z4uTQ59vqKs20dJ?=
 =?us-ascii?Q?DzoyGHRu0CrEU+YDqoIA4GbYacrw+0gBHwr2JMLkI8D+f3df9sG5A9OCPO2b?=
 =?us-ascii?Q?2dmTskMOoKgiIvC0PzOfXK4RFK0Jal5uPH5XpW6HVxNkZ0Keccym75gk8+Gp?=
 =?us-ascii?Q?HwLuGgYq/C9+RGveIQxoVZ7tv+Eftr8iNaJZwXn3zy+GeLfpGIzujX8yqhHp?=
 =?us-ascii?Q?8RnyYiZaqM0UCkfC/AXSIs1iH1XswsQc9VXqmDLYbHorbXXZR1qL9isdc2xS?=
 =?us-ascii?Q?G9ZNhvbQnQNT+lHGSuX/NEaOwDXa9ow+yIAslPoW5uahcdnn7ZWK/Prz1cmL?=
 =?us-ascii?Q?GmCmF10YFcxMoXOb60Ef2vDw9JbuI+81BXz5Qr3rLnuk4mcEPj1aghSjYxW2?=
 =?us-ascii?Q?Wgg4lA8MX+4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB8771.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oEEwbJYLR/0OCRfoXC7R3kfjD6pJkao5lG9A9if0FvIcNkXaQfqJsnuAi7gU?=
 =?us-ascii?Q?LPOGEDpCitab1xr5N+o1Rk0uzRoR/z3R9V3eIQQHkZLZ32xbcU0pNVhPledu?=
 =?us-ascii?Q?swfEZpvnV8Psxalaq0pWfZzkDAA6l/R/ndtsC0n7Ufv+dLEiI7GoYrRqD/gI?=
 =?us-ascii?Q?JQuNA84+Iw8f1Sah37/Nf9xDuoHYYIm5JzMlLBsNd3bhDRcegyaBXAWJQXV0?=
 =?us-ascii?Q?Lowh6k32Xq0PVFBpOFPLkKSnx2u9RCIZj5os8qGzJNwPb0CEYic1Xz621Xu6?=
 =?us-ascii?Q?7eJCT7h3w6oQWw8yJTyyCXmprI7XDk0PBcJcSaUHtH9Jt02yskIUDhZCsXyj?=
 =?us-ascii?Q?HWR/mIUFHpf3SzahD4WtFD1z99JJ4tecLDQI/wy8sa8MVboHfPuMJhfcmxEF?=
 =?us-ascii?Q?8oaWXPVs6q6LTD01IqKqQqzifsnRk2EN4vDJyWfaHu8ZowtIyOyLA5K8Y+x3?=
 =?us-ascii?Q?GPGbtwCQvJ4cRZHuS6qLfFi0+LrnJmKasShkG2pKEAlLIUfkqod++vFBKU5o?=
 =?us-ascii?Q?ClfA92FqykQxWKtfRGa95ytZXmKyba2pkF9HsMEkVwI7gdjJ2gYTyWPi0WKU?=
 =?us-ascii?Q?kPNjQ1SfjgSSfq8MtpRRXUfnlbdJZ182nMubS4qMp7uDGRkMcf69B90fXv90?=
 =?us-ascii?Q?lyZD224oATJwSitQbqcm9x6r9ueYaXJgcXxR+UpYYtHx/27KtOHG4Gelaozq?=
 =?us-ascii?Q?oFR/LkPk03QyuapItt2xvqUgVW/xZe9E/7WI0kqG0c2MYLvP/KwCQR2AQq6k?=
 =?us-ascii?Q?j6dOy82jxiRvKAbHtDSvr49MEOMj7PjDs1Q87cPHRZ8hFgVKsJHdXogLo55s?=
 =?us-ascii?Q?IX+ZK13y7mRsfkzYGw72gftq8lDdXcs2l5OWbX1BwoL67pDup7/1qapFJbC/?=
 =?us-ascii?Q?YJwskNlBvUwR/SXdW0c5VakTBeXREQTW/7cKNkt7QiYw/2nysNsPvNIT5g0n?=
 =?us-ascii?Q?NtBeAmO6X7PwgaCjTmYzDL7Sw/apzdy/NdxqMCXF4SM4O4mMaHIUp9i+C8/G?=
 =?us-ascii?Q?GgAP+wlVBC1O3uZScXSTrlY9/Qj77x6bdNJXyY3M+mCXgeBPwAtuqG12t5aN?=
 =?us-ascii?Q?J5ORb7VHxXJAtHwrzu4JS8UK2wGgURZ+H/sGkjVgiyknjbh4WFxuCIqZXBqL?=
 =?us-ascii?Q?loONbgKHF1T2dgPARX9ZGE5fbNPVd8YuGJ2sljpv2ag+e/G8vSDNcXEtPmtm?=
 =?us-ascii?Q?xBab6r2CPEXmWSSK8QizzUM4Qd1ioyhrZR9qfnJbJafOsv+GEck9vXTejhYE?=
 =?us-ascii?Q?eraBftOYfIooRgb0N8KXoR9blPMdmymX0qlXKw8azCMImYvRGkiCm7MgcOMU?=
 =?us-ascii?Q?IdwyFxKiKw9cMDuFgRGg3yrFmlgjzu3bu+9a6iu09Uf1yVJ8QPey2r9Haq0q?=
 =?us-ascii?Q?S/N6lPNbUvVC4X/fKeO6aKaCbyeUTucqto1OPpiebtMhlDwgg5arP1sxXxRv?=
 =?us-ascii?Q?0jqhjfyV/sCAJcIOuBsGak4p+EXRlDBsQ11mQi95t0QEcjvTutkbFuDL/hbw?=
 =?us-ascii?Q?PSmoUvly9V/yzyxYGe8QM9rHOv2f1DPdgHsd7h67A7ThCodWRwwwP+fhlzxP?=
 =?us-ascii?Q?injDDXP6WE6tu2Bep99MoY1EzhyGNfhIHa6AK1y5mmvkMkssBHBddXYN1FKE?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82ab7b7-f9e8-4141-fea3-08ddb7d448b0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB8771.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:47:33.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBHlCBQ14lYuTiiNKsozzmVh+J0SNRwfmaf3jB8dmf8C95YC7nhLHFflECQZMQR84Lf087Zy4m8MigCqRSMjwMpe6zIVRgq6tuyHVXiPRc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8132

Introduce a new option CONFIG_IRQ_LATENCY_WARN that enables warnings when
IRQ handlers take an unusually long time to execute.

When triggered, the warning includes the CPU, IRQ number, handler address,
name, and execution duration, for example:

  [CPU0] latency on IRQ[787:bad_irq_handler+0x1/0x34 [bad_irq]], took: 5 jiffies (~50 ms)

To keep runtime overhead minimal, this implementation uses a jiffies-based
timing mechanism. While coarse, it is sufficient to detect problematic IRQs.

A warning is triggered only when IRQs are disabled on one CPU long enough to
stall jiffies updates and exceed MAX_STALLED_JIFFIES.
Optionally, the reporting threshold can be adjusted by adding
extra jiffies via CONFIG_IRQ_LATENCY_WARN_THRESHOLD.

This approach avoids relying on high-resolution timers and aims for negligible
impact during normal operation.

Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>
---
 include/linux/interrupt.h | 25 +++++++++++++++++++++++++
 include/linux/tick.h      |  2 ++
 kernel/irq/handle.c       |  2 ++
 kernel/time/tick-sched.c  |  2 --
 lib/Kconfig.debug         | 29 +++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 51b6484c0493..d3c5f920c4ea 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -15,6 +15,7 @@
 #include <linux/cpumask_types.h>
 #include <linux/workqueue.h>
 #include <linux/jump_label.h>
+#include <linux/tick.h>
 
 #include <linux/atomic.h>
 #include <asm/ptrace.h>
@@ -881,4 +882,28 @@ extern int arch_early_irq_init(void);
 
 #define __softirq_entry  __section(".softirqentry.text")
 
+#ifdef CONFIG_IRQ_LATENCY_WARN
+static inline void warn_on_irq_latency(struct irqaction *action, unsigned int irq,
+				       unsigned long jiffies_start)
+{
+	unsigned long delta = jiffies - jiffies_start;
+
+	/*
+	 * Warn about long IRQ handler latency only if jiffies are reliable.
+	 * The reporting condition hits only when there are at least two CPUs
+	 * with active ticks.
+	 * Jiffies updates are stalled on this CPU until MAX_STALLED_JIFFIES
+	 * reaches and a force update happens on another CPU with active ticks.
+	 */
+	if (unlikely(delta >= (MAX_STALLED_JIFFIES + CONFIG_IRQ_LATENCY_WARN_THRESHOLD))) {
+		pr_warn_ratelimited("[CPU%d] latency on IRQ[%u:%pS], took: %lu jiffies (~%u ms)\n",
+				    smp_processor_id(), irq, action->handler,
+				    delta, jiffies_to_msecs(delta));
+	}
+}
+#else
+static inline void warn_on_irq_latency(struct irqaction *action, unsigned int irq,
+				       unsigned long jiffies_start) { }
+#endif
+
 #endif
diff --git a/include/linux/tick.h b/include/linux/tick.h
index ac76ae9fa36d..543bd96b0653 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -14,6 +14,8 @@
 #include <linux/rcupdate.h>
 #include <linux/static_key.h>
 
+#define MAX_STALLED_JIFFIES 5
+
 #ifdef CONFIG_GENERIC_CLOCKEVENTS
 extern void __init tick_init(void);
 /* Should be core only, but ARM BL switcher requires it */
diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index 9489f93b3db3..273aebd71d8d 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -145,6 +145,7 @@ irqreturn_t __handle_irq_event_percpu(struct irq_desc *desc)
 	record_irq_time(desc);
 
 	for_each_action_of_desc(desc, action) {
+		unsigned long __maybe_unused jiffies_start = jiffies;
 		irqreturn_t res;
 
 		/*
@@ -156,6 +157,7 @@ irqreturn_t __handle_irq_event_percpu(struct irq_desc *desc)
 
 		trace_irq_handler_entry(irq, action);
 		res = action->handler(irq, action->dev_id);
+		warn_on_irq_latency(action, irq, jiffies_start);
 		trace_irq_handler_exit(irq, action, res);
 
 		if (WARN_ONCE(!irqs_disabled(),"irq %u handler %pS enabled interrupts\n",
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c527b421c865..5daee2bb3a18 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -201,8 +201,6 @@ static inline void tick_sched_flag_clear(struct tick_sched *ts,
 	ts->flags &= ~flag;
 }
 
-#define MAX_STALLED_JIFFIES 5
-
 static void tick_sched_do_timer(struct tick_sched *ts, ktime_t now)
 {
 	int tick_cpu, cpu = smp_processor_id();
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ebe33181b6e6..88566adf4381 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1856,6 +1856,35 @@ config LATENCYTOP
 	  Enable this option if you want to use the LatencyTOP tool
 	  to find out which userspace is blocking on what kernel operations.
 
+config IRQ_LATENCY_WARN
+	bool "Warn on IRQ latency"
+	depends on NR_CPUS >= 2
+	default n
+	help
+	  Enable this option to receive warnings when IRQ handlers take too long.
+
+	  To keep overhead very low, this implementation uses jiffies-based
+	  timing - which is coarse, but sufficient to detect problematic IRQs.
+
+	  The minimal possible threshold is hardcoded by MAX_STALLED_JIFFIES
+	  as the reporting condition hits only when there are at least two CPUs
+	  with active ticks. The reporting threshold can be extended by adding
+	  additional jiffies to CONFIG_IRQ_LATENCY_WARN_THRESHOLD.
+
+	  The warning includes the affected CPU, IRQ number, handler address,
+	  name, and the duration it took to execute.
+
+	  Say Y if you want to identify problematic IRQs in the system.
+
+config IRQ_LATENCY_WARN_THRESHOLD
+	int "IRQ latency warning threshold in jiffies"
+	depends on IRQ_LATENCY_WARN
+	range 0 10000
+	default 0
+	help
+	  Set the latency threshold (in jiffies) for the IRQ warning messages.
+	  Consider it will be added to MAX_STALLED_JIFFIES.
+
 config DEBUG_CGROUP_REF
 	bool "Disable inlining of cgroup css reference count functions"
 	depends on DEBUG_KERNEL
-- 
2.39.3.dirty

