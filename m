Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA47257AD1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791887; cv=fail; b=C7oe9r0c9G0kBoNWPjYFDi2Av957CV7mdn3uikXJxDA2ShJKva5CYpM1S7X1hU+tezy9+SScFblzZlOgYwKqO8oYfIDqy2S7yTlJ43Kp+DN7r98QOFZ6hOcJlnoJILZ7xkHNKTPeYz9/vS5QfQh4tl0qKrFPKjvlmN1KsnJtvFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791887; c=relaxed/simple;
	bh=Juv21hMcdYacjbhdxTYReCoDxUJQlJx9ZgGwj91jApw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tn1kPXokZv91T3LXKzLVzBbgze28uSjWn/LmcBL1choBVa4wcpByME/n4HiCE5fifYQSm+XI6Gzopi+6o2p6sziKj9OuDflRRHeDasCG/4P7uZi2AY7QWAXvwHGjuWVu/rqG/zgiwRXBxYC55vrA0g/MqKEdGrAI6sEx/vhz/K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Az8PUkEt; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Az8PUkEt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2+9POg1oVXFO8O8eklzVjQfCzKuhrcFoWYNkoMdnzwq6U8V8JflZbW9Gb8O9ko51oBqMaAs5Am+Fkkqu1Z7mhXaFNjP7PzaMjJhGTojH39ppfBbOIcRkWgkb/aifnZP4Pe9uYzcHlbIDQdgmR3t4rniAHUxWhx15mVl8ngIaFfV6jmZZ1FL0ePsK50GT1iTFQEJr7f3zTt+msTHkrxQiOnsMZRFJ/EWUa9kMrEX5mdsnDvgAJGDiNPi+yXnS67LNwMFH6hIpfbc4FvqWgghsJ7R7wwqn6hc/jKxqqHYaJSdoI44OEIFYdrChHMgjjcz+mWRyat9QEdBQliV/RedWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0yuxP2iQj548flbo5wqOoFSGkAgaGxFJFEWVeOFzr4=;
 b=v95/Ocfw6E2alOnSVxsqur81TrObVFYxZCUDvChFMvxNBQ3GSM5Tlz/j3wO7QVkmbxsw6kvaYVEnqFKsp+nBmAxEL19TUWzsAk7hH6BZjO4svtjUNFXgwe+k76VlwjdJ9VB95PF/p+SnntREk7EQtK+Yo1QRVVd7TOfmqcTUy9HxckToMNijxbz45OtqsUaGmEeQfyP/IY1ukBRtbQRiA6lTISwQTYI7fMPeg5lWBfWqXirLy2FlnoudvAfiUs/TI8WTAQqYlLwVFEZa/G9KBrfaTLh7/TBSPzNQmKnaYVnAUMBG6WImnTmaMzgU656yg3edsj9QuTF7tZJiWW71sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0yuxP2iQj548flbo5wqOoFSGkAgaGxFJFEWVeOFzr4=;
 b=Az8PUkEtlAUFddSZi0TDa7UdaLDaHjT3TDthRYG8N9ZQ6syxVyKDOCLU4Sr8cR0LVVLbRbDy1tjZCeFQHzhpw4mjnZGSOZa/eiaTsva04AGIpMUCDhEaiLYZjNsYgGYiBn1ptJPIqBlwosjjt9Ux3mXb9lS7phhF1drSZ3mm3aXK+p+qqeI2SN48AuvvqibiZrFnjqeQCNN2l2/ZMmF3dJRemcYzsg49B+0chO5cSmjiA0zAHmPMyLXlrhT5eftS3C7NrO4dLRgWMNi5So5n93mEEcL5R7gnx/D4S52yJXnq/VO911ASG7xa+eTUT0o+Z4oP0SxJO6V5Im/JqdxkpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:18:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:18:02 +0000
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
	Valentin Schneider <vschneid@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v3 04/10] sched: Add support to pick functions to take rf
Date: Fri, 13 Jun 2025 01:17:24 -0400
Message-ID: <20250613051734.4023260-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:208:335::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 3380fd3e-b3e4-4b98-3348-08ddaa39ab7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JAiN5VAPuY9uzQsXh92R7U7cWBsQHihvhjSOQxrzBTZmDwUG8TdmUXHxn9WN?=
 =?us-ascii?Q?VDzap/NSiqpT58TcqxyOxtoraUhIDN6+vDrMEILaSoW+0Xg+tmSZ5ClQibqq?=
 =?us-ascii?Q?FtKUg8t3vyfoMin0kgWYJbOPzsDDMmSLb8yWzPgkLwwZMZlXoXQNnPeagGlv?=
 =?us-ascii?Q?DU3sfZl0pOyi81vfaTKfgFHsfLCZLxesn4fqDpZqVtFIvfbGyRt0V0XNtSjy?=
 =?us-ascii?Q?Jbicd8EdL9eEdhcotPouH4nByk72/VC3ZsogYB4I8S0hcGGfW1I0MpC+4mrG?=
 =?us-ascii?Q?Ig5D4ENmQkUsIMCMrd3jgIihGq0vjyU15rGajvDsX3mNmuU2GB7ofA7THI2Q?=
 =?us-ascii?Q?D1LtFvMKxTBd7VFTEWR5gYLN9PTerpJzL1HNPcOfhxG0+GvFhq4yc6CBZFQz?=
 =?us-ascii?Q?NBeRISGkp5hOthyca1tGGJ4FgICqG2cdq9eEk1lwmlaqda0wUo/uhYHDwB2l?=
 =?us-ascii?Q?WUq21p0Nz89ygZ9/C2QS7Q3I/CjQ9nLSQyolRZavCJNMow1w1bVqy5DoqO7D?=
 =?us-ascii?Q?KoIophSuEeURPY5cAnQDOo/BRObk08Ash2qDQiBdU49ENyZHyEKJsgKirbVi?=
 =?us-ascii?Q?gpu84vInUcaQ5VXAH585RfU0MmFyBtbsytwOwuDO7dueU+eBV4aJZil+c5XZ?=
 =?us-ascii?Q?JuxMBckzUAG3WltVWTM8gfGGDaSW5GxDYSGg7haDtbNr3fSYQ+W5zQlgJWhW?=
 =?us-ascii?Q?+OsDEtbzQnmoAKDLuu6QJtR+oTzQtDPxxesWB38WQgyL2EUTag2Q7kx30y+K?=
 =?us-ascii?Q?DUljSnABUMzEFXt/mpL/4AzK5CA0EpQYWRTjd7PWNQ8foLskXp2RdasFFOpG?=
 =?us-ascii?Q?8UvuOZjHvioFQP8l1BrcRJFo/tJqn5lnCyNsqiW2UDrBCaNvyU74v3zzrkcq?=
 =?us-ascii?Q?G1ly4zVTMYSPgrxF6lXI1hMGGOZJRLEv3dzA7xogdCG1iyxAqOYY0eoO9oy9?=
 =?us-ascii?Q?D/qGaoUWsG2vru2PqrPvi7v7CG4Hkp6j2xwzBBf4BUrLRQCnP/eSKx0n7gQH?=
 =?us-ascii?Q?rvun3RTxfW7+lofdWPvwZ/XT/LJPdU6QCTiXcVHXg7yB77MG0YBgi0xYwC/S?=
 =?us-ascii?Q?yYdnt1PbDQE5QbWgKcGFlUqUq2swTqO/T922G66RiwG9T/ninv1y04g413lB?=
 =?us-ascii?Q?ahMKmxWif9ZWOBIt4BzgZ4rADsKFjlnDWouqzjioPU1HB15s8tVqkvLWEEx6?=
 =?us-ascii?Q?RVrtMI5ft1cdFdV5tdE9yXHP9kmr4ZERrKwviXwwHX0ViNWbRMLsunGWUK64?=
 =?us-ascii?Q?gNJntt0uW8/pL9GCE3HMCQtd5V8s6hGss3L0pa1FSpSN3SLKQvm39ioLXN5O?=
 =?us-ascii?Q?ptK7tlyWgTdzfKAp3nXmNW42slA/vBpNceCfpk9L/Jxmsk/ZxBALVCzkyrJb?=
 =?us-ascii?Q?ggTqvA3PVGgYdvTxRMPib2Dyr2sN0ZaeC7dneB782MZXHIXTJN9Uf+XLySoo?=
 =?us-ascii?Q?HSZlDwDA0nLdLIYO/vaO8qJkUQZkP2gNutIAfuj8aRII/o97CIL3Tw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CT+4cfGmC/7COem2/dN2eXkrQh43cqlOOReVAchTDSS/j/BESQToIxzl6tc+?=
 =?us-ascii?Q?Vs5iTaJWrC7c7bWmXxUjMZbtC4WmrMFpshBPNGZPxsKyxvurSFckXZ60XPud?=
 =?us-ascii?Q?ebocibkBMOy3tJiR8JkrFlo96iyuxCPTMM7OXDnolL6Gr1+8n5gVoWdylY4P?=
 =?us-ascii?Q?ynesEx+KGvR8gEFs0PqM9RdR4g7W/Wv85xGq+88rfhrIVY78q/QlDjQORFu+?=
 =?us-ascii?Q?iPGnm45Xr1w+xY4qUhXQDsc2c50GwY2iafiJDAI9BUL1k/JdFl+zyB3ns5sH?=
 =?us-ascii?Q?Ng2lle7Kr26T60aHY5zioMFQqvBBKTGF9zyBAOY8vBoFHEOE9tzy0kDyvZaI?=
 =?us-ascii?Q?1ZrJDTlUiy0W6tQLPHy62gpOTebCX/piRW1N8bs/XiJDIlUBdrnEaiHhiBYp?=
 =?us-ascii?Q?Zg6u7ZiNJz1ry263S4ynGsF0FlgCiCMa3D3/WHNPMwal7syuPhfgOKTLVLIK?=
 =?us-ascii?Q?WuQ8nCkNMoT/7gxO8/YownY3PJEg56ApUXLHb9jNqE+Zwzm6EZ341iZJ1yOb?=
 =?us-ascii?Q?D7Sf3BuvDwuPLQ4Hy/shR4ZN8B2fnCvpdskTDEr5LzNiRxgXpX2lLCN6uH/r?=
 =?us-ascii?Q?ReWfNk/e3cPUf31PfXp+GIJlGT5dJ6oWuYDewpWf9+piZEcoSSrQoCxEWrCz?=
 =?us-ascii?Q?1vsrdCq9/EzSFWEZc8/c/g59kyvcYBVKHKg+atUgdTnJOVTkl742JuOoadq8?=
 =?us-ascii?Q?M2BUtFFXrxXI9hCeqgcjplZa4rl9m6QKixawi7HEbEbJZUllEqJ3qeCoYmlB?=
 =?us-ascii?Q?3mlcTXcQHGD197oLQpEdWNk3gi1XihK++hnx8YxzpiTSt/ocq5/3ok4i8Kwp?=
 =?us-ascii?Q?ASAUSkWpySupG6y5J8cvEVPxgXG639nH3eog8X92Apw0xSzC/3VyS8F20zg5?=
 =?us-ascii?Q?1vYZLPs1swlKoCxjrYdeROmuWD6td/1UPdO0R06ikShXaIjzdD2fDJSSUn/T?=
 =?us-ascii?Q?mUZlDkZfz4RWVQuMK8MSl8qxG7jM0FopUYdtIMUYNNyGb/hM01Nm5nLS5rPh?=
 =?us-ascii?Q?4UaP3JyqeahljwzhuUnAw4Yc2rtpyyk/DGOIjUEtiDIaZWWGyg9ThjMxqCwO?=
 =?us-ascii?Q?+fE+wQtf8815MnIwCJHCUNboUej/DZdwBQn4UPGOf9s1dgry9XIW5tlVkvmp?=
 =?us-ascii?Q?BW696l27hbpnJ7nPB66Lpaz7jBfUEUPvHEx3g7DVT48sAU2RewBuY/BulGys?=
 =?us-ascii?Q?kiYkT4S/NHMvHwS6JM6+iqjo5bSpp9XQuKmatOap2Vnvyw595dRBh0HCBXtp?=
 =?us-ascii?Q?ah4boCsH1jG7126HFWFGqBjXMXSUNjL7LBlQslLUZHuZiuorFIdSpDufILGN?=
 =?us-ascii?Q?Dz4NVlGxwDiiKTd1RA7gTXOpcQEsJ4P1rimNfJBeGevmgrWNou9xOyVz9dre?=
 =?us-ascii?Q?fmQLRsOdzG7M1QCo0jUZYSJ7bOTCEG3VfUz8ruowIwQF2ehmiOs8Kpvp3DO2?=
 =?us-ascii?Q?/5d0PJSrSddAcCBloa+peO5qUVSGc1w0gJPEXcl0zUJDuc20KUeinZKNQUZP?=
 =?us-ascii?Q?JJHMotL7nTJ0+ucXrJKRLO8sFAHezJKKY649XMZ54DFaz/lTUfRRANn++RJ8?=
 =?us-ascii?Q?9vqjchAYdU+BdenGgybXO41/kBT7/BQ8zF1Ts9mX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3380fd3e-b3e4-4b98-3348-08ddaa39ab7a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:18:02.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrQJ7cQ0wlhj8AAeBmGuECoGmmNXn5EVh3s3LU75hK1MN9tSnnyTJQFHsdrRhDce2ggMGu/TGXDpOYjnKW9X7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

Some pick functions like the internal pick_next_task_fair() already take
rf but some others dont. We need this for scx's server pick function.
Prepare for this by having pick functions accept it.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 include/linux/sched.h    |  2 +-
 kernel/sched/core.c      | 16 ++++++++--------
 kernel/sched/deadline.c  |  8 ++++----
 kernel/sched/ext.c       |  2 +-
 kernel/sched/fair.c      | 13 ++++++++-----
 kernel/sched/idle.c      |  2 +-
 kernel/sched/rt.c        |  2 +-
 kernel/sched/sched.h     |  7 ++++---
 kernel/sched/stop_task.c |  2 +-
 9 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 45e5953b8f32..1000d2aa8482 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -630,7 +630,7 @@ struct sched_rt_entity {
 } __randomize_layout;
 
 typedef bool (*dl_server_has_tasks_f)(struct sched_dl_entity *);
-typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *);
+typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *, void *);
 
 struct sched_dl_entity {
 	struct rb_node			rb_node;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62b3416f5e43..19b393b0b096 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6045,7 +6045,7 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 
 		/* Assume the next prioritized class is idle_sched_class */
 		if (!p) {
-			p = pick_task_idle(rq);
+			p = pick_task_idle(rq, rf);
 			put_prev_set_next_task(rq, prev, p);
 		}
 
@@ -6057,11 +6057,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 
 	for_each_active_class(class) {
 		if (class->pick_next_task) {
-			p = class->pick_next_task(rq, prev);
+			p = class->pick_next_task(rq, prev, rf);
 			if (p)
 				return p;
 		} else {
-			p = class->pick_task(rq);
+			p = class->pick_task(rq, rf);
 			if (p) {
 				put_prev_set_next_task(rq, prev, p);
 				return p;
@@ -6091,7 +6091,7 @@ static inline bool cookie_match(struct task_struct *a, struct task_struct *b)
 	return a->core_cookie == b->core_cookie;
 }
 
-static inline struct task_struct *pick_task(struct rq *rq)
+static inline struct task_struct *pick_task(struct rq *rq, struct rq_flags *rf)
 {
 	const struct sched_class *class;
 	struct task_struct *p;
@@ -6099,7 +6099,7 @@ static inline struct task_struct *pick_task(struct rq *rq)
 	rq->dl_server = NULL;
 
 	for_each_active_class(class) {
-		p = class->pick_task(rq);
+		p = class->pick_task(rq, rf);
 		if (p)
 			return p;
 	}
@@ -6199,7 +6199,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	 * and there are no cookied tasks running on siblings.
 	 */
 	if (!need_sync) {
-		next = pick_task(rq);
+		next = pick_task(rq, rf);
 		if (!next->core_cookie) {
 			rq->core_pick = NULL;
 			rq->core_dl_server = NULL;
@@ -6230,7 +6230,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
 			update_rq_clock(rq_i);
 
-		rq_i->core_pick = p = pick_task(rq_i);
+		rq_i->core_pick = p = pick_task(rq_i, rf);
 		rq_i->core_dl_server = rq_i->dl_server;
 
 		if (!max || prio_less(max, p, fi_before))
@@ -6252,7 +6252,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 			if (cookie)
 				p = sched_core_find(rq_i, cookie);
 			if (!p)
-				p = idle_sched_class.pick_task(rq_i);
+				p = idle_sched_class.pick_task(rq_i, rf);
 		}
 
 		rq_i->core_pick = p;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ae15ec6294cf..62d7c18bff64 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2419,7 +2419,7 @@ static struct sched_dl_entity *pick_next_dl_entity(struct dl_rq *dl_rq)
  * __pick_next_task_dl - Helper to pick the next -deadline task to run.
  * @rq: The runqueue to pick the next task from.
  */
-static struct task_struct *__pick_task_dl(struct rq *rq)
+static struct task_struct *__pick_task_dl(struct rq *rq, struct rq_flags *rf)
 {
 	struct sched_dl_entity *dl_se;
 	struct dl_rq *dl_rq = &rq->dl;
@@ -2433,7 +2433,7 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 	WARN_ON_ONCE(!dl_se);
 
 	if (dl_server(dl_se)) {
-		p = dl_se->server_pick_task(dl_se);
+		p = dl_se->server_pick_task(dl_se, rf);
 		if (!p) {
 			if (dl_server_active(dl_se)) {
 				dl_se->dl_yielded = 1;
@@ -2449,9 +2449,9 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 	return p;
 }
 
-static struct task_struct *pick_task_dl(struct rq *rq)
+static struct task_struct *pick_task_dl(struct rq *rq, struct rq_flags *rf)
 {
-	return __pick_task_dl(rq);
+	return __pick_task_dl(rq, rf);
 }
 
 static void put_prev_task_dl(struct rq *rq, struct task_struct *p, struct task_struct *next)
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f5133249fd4d..d765379cd94c 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3281,7 +3281,7 @@ static struct task_struct *first_local_task(struct rq *rq)
 					struct task_struct, scx.dsq_list.node);
 }
 
-static struct task_struct *pick_task_scx(struct rq *rq)
+static struct task_struct *pick_task_scx(struct rq *rq, struct rq_flags *rf)
 {
 	struct task_struct *prev = rq->curr;
 	struct task_struct *p;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 125912c0e9dd..2b7958d2fb06 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8842,7 +8842,7 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 	resched_curr_lazy(rq);
 }
 
-static struct task_struct *pick_task_fair(struct rq *rq)
+static struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
 {
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
@@ -8880,7 +8880,7 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 	int new_tasks;
 
 again:
-	p = pick_task_fair(rq);
+	p = pick_task_fair(rq, rf);
 	if (!p)
 		goto idle;
 	se = &p->se;
@@ -8959,7 +8959,8 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 	return NULL;
 }
 
-static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev)
+static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev,
+												 struct rq_flags *rf)
 {
 	return pick_next_task_fair(rq, prev, NULL);
 }
@@ -8969,9 +8970,11 @@ static bool fair_server_has_tasks(struct sched_dl_entity *dl_se)
 	return !!dl_se->rq->cfs.nr_queued;
 }
 
-static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
+static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se, void *flags)
 {
-	return pick_task_fair(dl_se->rq);
+	struct rq_flags *rf = flags;
+
+	return pick_task_fair(dl_se->rq, rf);
 }
 
 void fair_server_init(struct rq *rq)
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 2c85c86b455f..01e9612deefe 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -463,7 +463,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, bool fir
 	next->se.exec_start = rq_clock_task(rq);
 }
 
-struct task_struct *pick_task_idle(struct rq *rq)
+struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
 {
 	scx_update_idle(rq, true, false);
 	return rq->idle;
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c37033..6e62fe531067 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1744,7 +1744,7 @@ static struct task_struct *_pick_next_task_rt(struct rq *rq)
 	return rt_task_of(rt_se);
 }
 
-static struct task_struct *pick_task_rt(struct rq *rq)
+static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
 {
 	struct task_struct *p;
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6d..b4b9c98f0c6d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2401,7 +2401,7 @@ struct sched_class {
 	void (*wakeup_preempt)(struct rq *rq, struct task_struct *p, int flags);
 
 	int (*balance)(struct rq *rq, struct task_struct *prev, struct rq_flags *rf);
-	struct task_struct *(*pick_task)(struct rq *rq);
+	struct task_struct *(*pick_task)(struct rq *rq, struct rq_flags *rf);
 	/*
 	 * Optional! When implemented pick_next_task() should be equivalent to:
 	 *
@@ -2411,7 +2411,8 @@ struct sched_class {
 	 *       set_next_task_first(next);
 	 *   }
 	 */
-	struct task_struct *(*pick_next_task)(struct rq *rq, struct task_struct *prev);
+	struct task_struct *(*pick_next_task)(struct rq *rq, struct task_struct *prev,
+										  struct rq_flags *rf);
 
 	void (*put_prev_task)(struct rq *rq, struct task_struct *p, struct task_struct *next);
 	void (*set_next_task)(struct rq *rq, struct task_struct *p, bool first);
@@ -2574,7 +2575,7 @@ static inline bool sched_fair_runnable(struct rq *rq)
 }
 
 extern struct task_struct *pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf);
-extern struct task_struct *pick_task_idle(struct rq *rq);
+extern struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf);
 
 #define SCA_CHECK		0x01
 #define SCA_MIGRATE_DISABLE	0x02
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index 058dd42e3d9b..1c70123cb6a4 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -33,7 +33,7 @@ static void set_next_task_stop(struct rq *rq, struct task_struct *stop, bool fir
 	stop->se.exec_start = rq_clock_task(rq);
 }
 
-static struct task_struct *pick_task_stop(struct rq *rq)
+static struct task_struct *pick_task_stop(struct rq *rq, struct rq_flags *rf)
 {
 	if (!sched_stop_runnable(rq))
 		return NULL;
-- 
2.34.1

