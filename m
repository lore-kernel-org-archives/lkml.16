Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E322DF83
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887311; cv=fail; b=nM1OX8nR+1iiyZwrqOyvalJsEpa39yZ9c4ajSNzXDyuRSBjAGs5CBD5h12o7bh5cXumL1cIm0qbOY4cV498CDntfNerNKW7aICg7wv41Fs3UMEsp031PiO+o/upfb8FOaH5EcV1Qs+gq5RwMpAZpdrv54D3ANXBhjheQ7hlGY1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887311; c=relaxed/simple;
	bh=8ezU/XHbk0TFICh9RGCtSajRPGC2PMZZ4CSl2XnhmzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZiH/H/VHQr3bPoT0uVGaPfKvnN3IZteBuViN6RksAeMNuWUBCoGEqmIRM348svtn54nbO9RXLrBq4/QB4SLMH9B90aG0LU72H3E0UiBVltgz4KBrbxrKq7lek0mCgssAyEW7lwQnXaka7KOOPeSF2UnrOPORIm1Tqg8Ca3lHL4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GvdcUpuV; arc=fail smtp.client-ip=40.107.244.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GvdcUpuV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noM7oQ9c55YHdwbz5x5qC06XfNDRcuf3j124YRon2U2GUWFFaAlc54v5I6SM35px3jgOuncuu21NwAZPxwK3mwyrWq4iw8UPBqOFpQ1cQSNhqw7lymzvZyb3kbJFzTHbhKstUbpvDa5pKilhroRRGo0sZLdGsVPNaa8tbrlB0j3WOZ4WJM9wVKhDy7StPFQsYaVddur6ytd3163jOpXjLR3N+BusdkvVSBlDSTas1cT7f/3qzMfQwXbW3yZST5n/ikc7+i2pivXisml0tY2SUNifqHZ+nTO3AmmM9wSJaB18IrUnG8ddAGMs0d6zv5o9vQEfUns49A28ACJliiefeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxb/q8yadsJVytj+pZOH+lh/PKzfqpU3Ue3MDe3zRXY=;
 b=y5xbWMjtqUZiLlZSuEUDwbOlvWtgWFnDX3GqafmX8H5hG7v05CEdCSLw7E6wiToM+jDu4t2TXjn4xmG9KjPf2a1liSzwsG91sH9WTJ1kptXzsEWgHH6jJnu2A/j/QzJWhJnRALDgF+5DQJ8Cgd9H4DotXSRL4v9FIT4AvPDk/Qx9kpv1MK0osjVFLlobcQODDmAt3emVXsZpNo0quO0WF6UQiNjiKj3oPzSyogDY8/zIZ/OwtiGlCg94TKSTAZb0zbAWj34B7TO++sR3UyLLsGTENLLTk/rGqzTecekRf5rDyHBJTtr5NcCCsjIFh/kwH6hGM2x9iBUEDcyqo/F44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxb/q8yadsJVytj+pZOH+lh/PKzfqpU3Ue3MDe3zRXY=;
 b=GvdcUpuVZK6iIz8/5PJwPZuwXy+95G4j4PVHqpMtLawgtT5kyNN/FgXGOTMWo1iGRYs5Lo2bPcqs/bwbsqgDMhAyJgjdKKUuz6fH4CQe3mffYVJbAbTD3EswKttJPv/vkoC3pMvj1CP1llNk4ZRswwF+ZqC/iRVpCPfqZt4toWneZWH/CP9dNF0l89ygQQFsG6vg5G3VjQvci3dnncetakq0bU+Ro6DkLh68HIFjFQQrzfaFZQeRTDi3PNlbRnQoX8Nex0yL5tkHPiQT4QcSRuq41niJ2qZlTTJAZoeZHNHboga+tkvGE7FRd/pugtr/yGbI5YbXxs+iyie0dzEIsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 18:01:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:41 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v2 08/10] sched/deadline: Add support to remove DL server bandwidth
Date: Mon,  2 Jun 2025 14:01:04 -0400
Message-ID: <20250602180110.816225-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR12CA0007.namprd12.prod.outlook.com
 (2603:10b6:408:e1::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 823b3532-d6cc-4464-882b-08dda1ff874a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DO+YyYWbO02b7hiFkhMWYPdcLIggCQp8yrtawdPbkYN4eBmQKLbdG/eetU70?=
 =?us-ascii?Q?DczT6TbWujxsdv2oCKZrLiPEf9b458COAGQGEtLJmTOKcfY9Px2R1GP3MDlq?=
 =?us-ascii?Q?2XlyvH7kLTvEwmf12sajLb/nY0cOyu+bZOrRqxcDrKuj/g/afB7vIM2DgivE?=
 =?us-ascii?Q?qmMZA/M2D+IVj0+ex9Q/3wwlKdr3xj5IXoon16WJD0Mx2jXB3WuRsJP/ttx7?=
 =?us-ascii?Q?/eIaXnv1j//8Jy4QLDgllsYU1CUXQVPSKMeBFcBhFJl8Z4FystVWXRG/szHK?=
 =?us-ascii?Q?OLbfD/gn+BsS/YhE5xCj9p5Esj2KgQsWUAYXft1Qx8hmoyEQLIRhQLktSLW3?=
 =?us-ascii?Q?BAeg8JcMKvIDBy5lvREMV13WN7zcx3vmSKIiHvtgz2XVcwecPSeYlBBnf3fL?=
 =?us-ascii?Q?m/EJAWfq07YupZLR7v2LswdvnLoupEf3THcGcGeHnswSfL9nFJeRLQC3NBje?=
 =?us-ascii?Q?u5zlXi/SYHjCU4W27JJ3BpK6mDQM4dXcVAAYFs3sx47hQLMBT7HPHSioVAQj?=
 =?us-ascii?Q?7L7ZiXs1varooKOV/ZBhiKLyUR7wF98+BNudagJiUhq1xLoZa/Ut/Tt6p5Ie?=
 =?us-ascii?Q?0DuIJSY2PavLpQm0e5gmIT7KxM27FFN6JferGpuPTwPtev/J/bChWIrnNwtV?=
 =?us-ascii?Q?qvqLvE0mY2g5Kvqx9/6vPPJQ2UFST33iH1u6n8g8FlAMsxbA4uZ04G3HeMUF?=
 =?us-ascii?Q?HD/JN8sqGeJI85oygRmT+aB+Ox39If9021JKp0ELi6BetZYKUUZtRfeOolXR?=
 =?us-ascii?Q?yYP+cJ9Rcg5Rp5KqGEYQZq/sUoGYhu0M3qIwt0ajmFZbMdkZb0aa0Raz61Rz?=
 =?us-ascii?Q?DmUfzexsm0Whzg0cm7MY39DWhwGEul7h3ltPiZr0sGJTzoMHLPRMj2MvBGTr?=
 =?us-ascii?Q?4Q1sGW/hs8KZd5Rbt7O0VWRx1B+gCmyYObsMFw24aYEKFU19WUOmutfAsssS?=
 =?us-ascii?Q?Dvb92Zczcvb8aHmwh0oYjXYbvi/vxxv1Ed8ti6/Nh7WTeOaW3r6FaYyyyytI?=
 =?us-ascii?Q?/kCz3oOrgR0gpSzd2wSsotmdbhsGwuDpkjJeKnbeAWwA7FSpQs9YOxGUml+G?=
 =?us-ascii?Q?dRI4XW6U3l3NeyiHNY9aiReHuxO1KSyP1nThkho5JQmCwM8MMxcVtmCAHGJl?=
 =?us-ascii?Q?S6+R4jjcbUZwbhgzCUrHRKtnbB1qO11L9SE4U4sTds3CP4pmmJ3dKSDihKCI?=
 =?us-ascii?Q?MZUHtgebrU35bcOl6at9TQNFW9/5xxMaVPnIPYNB9ZtmRlkCBNUJ4uGQA/PG?=
 =?us-ascii?Q?ETEqPHsKV0VszomqzZP01ho5cRJZvV/MxGfrDb4L8Bj3HLjKNTY9p35p4yTB?=
 =?us-ascii?Q?Gxxx0dJsKsYKA67jrtaWyaNC4kP8ne6h+2MxSYMEBSd78DRdHeMzlClzli9R?=
 =?us-ascii?Q?5BiwfNFJ7arQFCXIhx/EPMfsSs02U/lh42G8CmHB/oc08mYgY6hQakRmmVJk?=
 =?us-ascii?Q?ZRgcMEHwOf/8HKm2GiBt9x7mpSWZ87ZD0D3rVg6h9wms6sj3SA/Gig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UocST/m60N4fEdBOQ1T0SQL6UzswMEZkayECo7HyxIsXvdY1aijH0H9b7lXR?=
 =?us-ascii?Q?KLVl9D/LHDI+cgkAMcOuI6M7j/FL+wYShdmgCfz091L85dzGUCajZBDpntNj?=
 =?us-ascii?Q?Bx84k/rEJrTrnMaW968acHs2QL5TioYKyJMn1rfntZ5hAFn5xm36wYvYa7g9?=
 =?us-ascii?Q?OHIn8tt63bH6SHZ6yXBzaelQQrYZCbav1TIS9u3oTxnld9fxRlm8TXgtg6iv?=
 =?us-ascii?Q?9Zj/7punXlYfpxv3uKS3PbxiMuD/g1IfiisdYVMN8EdxJ4kUV1tPRTFi8hmF?=
 =?us-ascii?Q?I9Ctsg9IMGrpgXeEgN1mvMcNMRCrznrTapf4bI4kIyFkccgxaDtVta4fwk96?=
 =?us-ascii?Q?XEQct9rIQzF/HAoDzymF//6p9/U85J+3wDZH1DMtDjTUkrGi2t0reX7VE5/W?=
 =?us-ascii?Q?F3LVHP7HjJ+oQ/46vSVfQan6vcFILvOErWR0tOuWCsfQOGmTHfaQDjiDdmDB?=
 =?us-ascii?Q?N8QDZCI9CZGMvXHsmWq+Kv3kFL6C1y5fftnS8ykCEDrgxszPUoU0I2cfMpUP?=
 =?us-ascii?Q?TZuOKnReYGt0wmOy50CSnMNQgGrYf6PYebpuKggnX6s/X9yP5peM1Xw9DueP?=
 =?us-ascii?Q?9aLO/OAGF9RXj3c4YZ8SmiQ2Hzy+2hDJBg51Od7rjMr5CPwyYthX+iZr+PNV?=
 =?us-ascii?Q?cI6qQH3aF55NYQKaq8Vq1M8/RP+ul/Hk4ERCHnMwq0oaUqY1t1E3Jxgiwojj?=
 =?us-ascii?Q?F6rM2Ezhx8W7qwm1VXPdwty+HCWoF3WzSfyGxxy37gjGt6tJhOUkvQ4FG646?=
 =?us-ascii?Q?u0LFbsyYtARTGx4cNw43EJ99aQMLQrIeND51PhRjK0EsIPOT30GAM1b0+E7W?=
 =?us-ascii?Q?sbiQguQToJX02Am7PAr5+o0AWT2Ci6i3L/SYnpmXso6zbulCzK+2LScrTgFQ?=
 =?us-ascii?Q?MoTYIssxw9VT6HmcSU+DdZ0hCs/EM01+9C1pBiveBiZfGlcIKhRL2SdySY6h?=
 =?us-ascii?Q?is1Nmg6XitW4pgV3hkjZJxTYw/VoVfW91tcSHuPNqyafDrBvAenhgM0NyTtT?=
 =?us-ascii?Q?iuxnStGq9I68lNOEHydI77uNb7ilnEbqoVVM7wyW8W8QREL3ujen8N0v34IH?=
 =?us-ascii?Q?J/VS9N0oqzRXKbZhKv/CgM42AfEh6SXATPpZUA4eRN3yrslzkPrgQhwgbTZP?=
 =?us-ascii?Q?jAuNj3zV31TogWCnObYx92hsx/QV2eKcTYbkDGChPPYcew9YRycVUAPvBDLo?=
 =?us-ascii?Q?6L0ICxgPJNyQrc/84VwhQQPI0c91jNYAa/Wq7737SMDEgijwAbBwQgHOzH5Y?=
 =?us-ascii?Q?2FJVT3UIBLL71xpYy5BnxvCC646UkL3rL1HUsmUf7tcMRxXEzncS3AwAVGyW?=
 =?us-ascii?Q?m0OSkybxtALhgHbIWd/9ggTsBZYn863/ToO3iqPv7yK5QZ3ei0LnPVPHdOeB?=
 =?us-ascii?Q?OvAi0RwgdiPKp+KJMYDGvUcIn96pBlX+Wm54zQtMGFbrbjeP08WJrHmsPaKL?=
 =?us-ascii?Q?2iMF4FVOvvLKGIt9gozWqA6VQQdOkThD2AJK0VaOqvBUdLGY0OTsq4Sj8Td4?=
 =?us-ascii?Q?TLhSDfzksyciFWGFqHoSwzQwclMph3aMrXv0/1xTIOVE8CpTO5v57YJ3R68I?=
 =?us-ascii?Q?Ytq4VCbVZVTSEPyh6QQ/1u0MF8UrnbZJoa8PDk+X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823b3532-d6cc-4464-882b-08dda1ff874a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:41.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOqcGh8ZyflEVDTFW6fRUd3Q6AHybZ+Teh35I/HpnWdWlyG23zQJuU42+JlA21Er+bv63jhyCnE97w8utfk8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534

The DL server for sched_ext will have its bandwidth removed when
sched_ext is unloaded. Add support to DEADLINE for this, so that the
sched_ext DL server may do so.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 57 +++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h    |  1 +
 2 files changed, 58 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 4ed61266f3ea..e585ff39fcc3 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1752,6 +1752,63 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	return retval;
 }
 
+/**
+ * dl_server_remove_params - Remove bandwidth reservation for a DL server
+ * @dl_se: The DL server entity to remove bandwidth for
+ *
+ * This function removes the bandwidth reservation for a DL server entity,
+ * cleaning up all bandwidth accounting and server state.
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int dl_server_remove_params(struct sched_dl_entity *dl_se)
+{
+	struct rq *rq = dl_se->rq;
+	int cpu = cpu_of(rq);
+	struct dl_bw *dl_b;
+	int cpus;
+
+	if (!dl_se->dl_runtime)
+		return 0;  /* Already disabled */
+
+	/*
+	 * First dequeue if still queued. It should not be queued since
+	 * we call this only after the last dl_server_stop().
+	 */
+	if (WARN_ON_ONCE(on_dl_rq(dl_se)))
+		dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
+
+	/* Cancel any pending timers */
+	hrtimer_try_to_cancel(&dl_se->dl_timer);
+	hrtimer_try_to_cancel(&dl_se->inactive_timer);
+
+	/* Remove bandwidth from both runqueue and root domain accounting */
+	dl_b = dl_bw_of(cpu);
+	guard(raw_spinlock)(&dl_b->lock);
+	cpus = dl_bw_cpus(cpu);
+	if (!cpus)
+		return 0;
+
+	sub_rq_bw(dl_se, &rq->dl);
+	__dl_sub(dl_b, dl_se->dl_bw, cpus);
+
+	/*
+	 * If server was active and consuming bandwidth, remove it from
+	 * running bandwidth accounting. This should not happen because
+	 * we call this only after the last dl_server_stop().
+	 */
+	if (WARN_ON_ONCE(!dl_se->dl_non_contending))
+		sub_running_bw(dl_se, &rq->dl);
+
+	/*
+	 * Clear all server parameters. This will also clear ->dl_server so
+	 * the next dl_server_apply_params() will reconfigure the server.
+	 */
+	__dl_clear_params(dl_se);
+
+	return 0;
+}
+
 /*
  * Update the current task's runtime statistics (provided it is still
  * a -deadline task and has not been removed from the dl_rq).
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d206421b1146..e6af0c1fc985 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -393,6 +393,7 @@ extern void ext_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
 		    u64 runtime, u64 period, bool init);
+extern int dl_server_remove_params(struct sched_dl_entity *dl_se);
 
 static inline bool dl_server_active(struct sched_dl_entity *dl_se)
 {
-- 
2.43.0

