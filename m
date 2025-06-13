Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B06D253B7B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791896; cv=fail; b=i1c01Zu+/PiqRM8SNsQyFNToAv5CBDAVuTx9oqgd9wgt74MUYOCurLUKn0p6KeJkshbXyXr9v6OOVD8LxMSlgO121KMmrJERjT3zNbfzPcu3ZxiyRBKrOw6pcmdUglIUtdUp4Eo0Iu4+xmAYdVtpfJgzXvtksIH9ePw5+/D4/hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791896; c=relaxed/simple;
	bh=DSuF61X7IihaBXswU2sB3vyW/yJhc6ZM22i86k8VfnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KhkMvknNI8spn4fv0RdSTKN8EHVxeZOtDwTxKZpytwvRO20C//kyQFB8UP5pYLE+er6xpV1NPVfTDHeNIX7Py2ihMXopINrxrhp2oeTa7gHV9vyCziyHVKlkE27dJQG4hikBAnwKedIc/c70L8GJ0LABa0VP5+hhudpOOKE/gAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ssvzigJp; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ssvzigJp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx4OnLy8Waxr/cJc9j7Fd4GIBEEXZrkjLklZlXjIpo8FefRvMCD4JCvcQuwoOpEr+e69NjaCZGMm9Fcz8uEhdPuHvfTaixG96/a+E753FroimQuMmXJtc/ypLM90cmeuVlpMUSoMKTNBE0XClazEOim4SsmjtOMh81JGjz2oRyv2v+MlU+JFqQboux4xpx/9DHRqbZ5El4KCuN7fK9iHtC08Jhafw1004yzJ5EQfwWBrQi9SQLKll5nr6pe7HWtKKOQkv1xlDjLtrxIORArjDN9Ksokg3mVhoM6C3ZOa6MKZPAlMqwHUuH9rFUfd9XGJRJYwRLGhRSZS0Ibws5nakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBBuVpQf4tDIs1OZcpVN5XkycTIMESHLNWgpeZDFbs8=;
 b=fd/q/nm33NhDxhJGIztbYdGhiuz5xhZeGxNYlgZY6ndfmtludkzzE2t4bgcW0k+AuyEJa7LQESYVEmLFW+bC9rSscux3HZEY1vdXu6wPAVQUn1qQRwDrmqNMv9G/5rn2mgcwr4LMdIsx6hvlx36mZce8Rkz5uQJsjFEXI1A/a+u5/pQ1qpOfxs3CpZBF3nV18+y3qoxJhpSK6/P6MOMhhoT7mnuzeX/jQ+vQz0nYtIhp5jYeEKAGlNQwzG07lPCqNuteh39Xplh4vys6bMoZvmHl8qYbcs6ZP49ppLHEEP3jBf+Y2qOXzfXY+aAtIBn4V0OwG3kG6MRgPBCxapNbNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBBuVpQf4tDIs1OZcpVN5XkycTIMESHLNWgpeZDFbs8=;
 b=ssvzigJpNu1p56Zz5R5J8yXE5quYD9DhPndbpoOzEHjZVgS9oPFyol1PP7AvVIE0bNV/4Y/nZOGB3uvgIRVTimZHa6CUOAHJCFmI22Gt/0o3MSAxxdMdMdcZ8PYJEzWfFzSrg5WLCjA1R2s3zbqRXe1kq0+1Wsny51Nie/GSh9zjXZPXPzRmg5iFxZMEC+NA9nFs4kDZrNAFXuCCvJu6/a65ILd+aJlRTxjIqnQBh7l4ZFrNsRrSQNBUZaL6oLxxnLgFzVN1Hx1cpuPibFcGATX8lpcuNtmK8PX2rv3BIu7/HLCRsuCKfnMzFLEfZYVzlw1zMy9L6puUiwyP+M8kKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:18:12 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:18:12 +0000
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
Subject: [PATCH v3 08/10] sched/deadline: Add support to remove DL server bandwidth
Date: Fri, 13 Jun 2025 01:17:28 -0400
Message-ID: <20250613051734.4023260-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0018.prod.exchangelabs.com (2603:10b6:208:71::31)
 To SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: aee30a73-a9c7-45e1-fde4-08ddaa39b14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lptjrKMLqsB5VGQDdNJHGoGVNf4jSwAtE5iON1GNxlSsy1rS1uI8jF2Jvf+i?=
 =?us-ascii?Q?kq0NDrmkDyPBEWqIiZSmZrPUh1vWW/+aAI9ofg2AtIzqh4LKzn0y/Bszjync?=
 =?us-ascii?Q?BhvZG57o4wOpZ3AEKq0t2C8ho6lQ4LF/CnkuO/wVpyzHM+AHYhdt8uepPnd7?=
 =?us-ascii?Q?04Ph4KuRUOZ5ADajTBHaRRO6Mn2D9GBUp4VYlXvhu9NmXD3jI9XU/jbBSFhe?=
 =?us-ascii?Q?sPgnFO+sshHEi3VKUmJ+wFdoQWVXfUxx9/gQv4kceI0E4mG/crPHI4N9OAY9?=
 =?us-ascii?Q?9kJBuwRN2+rGBQnwlUVnSRB0fW3ajQYYru0FNNFcSSo9pxJ24RKjPaOWCMIu?=
 =?us-ascii?Q?bix7CpSepPIcnkUWVz0mqc/pwF1RdEgSDXqU8UmxCZPEDj9gvs+b+6YRILKU?=
 =?us-ascii?Q?aRqsEGHknB4JjJQKdXvVKDH2U+vON5XHrSclcD9d3grh6QApriRBNc9qPBJA?=
 =?us-ascii?Q?+qH/dM1SyU2ml6NwvpT0e8wenxY17d6XsPqgesVijjkqq0hkRPbdqOYgjwPk?=
 =?us-ascii?Q?UuK33BXdioclBrGoxas5GcgqTKNcoOyWqFB2GAs3ZK74N1PuisFaDEVnqfFn?=
 =?us-ascii?Q?Dhdii/UL3CyI/kvsbjGUrhTQspUTRCXSUwDPbHz7sV+mJW2HsgUvALxh78OW?=
 =?us-ascii?Q?idcfxAbjZw+SWyEYAKc1lbvpZTdTtUtxxW9NSZu9tuchoRJZqtQaCpNrMAlv?=
 =?us-ascii?Q?h5uF/GGFlHXxxCH97kbFrf5e3rw26MJG5mRxxXNexvPoimXUJYoDU7h8fFfb?=
 =?us-ascii?Q?RzJcyuM0hVCQBccBsiwkkJMZhO82KDR3KkZZsYqsoqqhQQ1o8wKN4mYBmdle?=
 =?us-ascii?Q?oYDCznYkrqgzIg2RKeUYlk40Yf4SLTras2EzxEI1blaDyVGdUKefDait4RIG?=
 =?us-ascii?Q?EzXjaFMqGD0FGiOQUJJhbjlVX/CAwr4PBqd2O9kLqgppnhbybWFrQ2U7f6Ib?=
 =?us-ascii?Q?KxJ9b1ji9EdoFyIboJpVx3bsE7HzX+LongC6p2hgbyt5dUm83GpBhrUcugvi?=
 =?us-ascii?Q?tUXFu3HYdv+WrW2joOdFjhuAuvbNvQAFeSXumoVnwOG/f0d/1brlSoBZ7hrT?=
 =?us-ascii?Q?zrrOpkKzUHi8xc4AOM6uETWJkpEZGDyCPZOeWBIcWPNpSqIxyTH22gePjvQW?=
 =?us-ascii?Q?V99vc+faoZA0Emd7iv4Vq2KUyuCOFFkfZjGuSxL6qswyv1YT30rMBLVsstTK?=
 =?us-ascii?Q?Z1FHyh6itwfc4pmvZ/0vEBEONTwwo2mSPJoJsYIim835h+KDv+nEvC3CBUAm?=
 =?us-ascii?Q?17uFXvO1lE1t+XoI0nVlrSJTqGXp95mEGsyPEORXvBCCEzmGdV7f767La8KN?=
 =?us-ascii?Q?remrSd8ufhhf1X1LBEN7fFC3m3g+8hbH8ZPZR/bpX60zEB3zGgTpdiUDYjoQ?=
 =?us-ascii?Q?CSeIPHjYZsaVA9GcGvStFwM3X+PJIsKqAU/eFeoRSXM9hXNRQQeVzTLAe4Fq?=
 =?us-ascii?Q?JwusR5Ff+G5MGZz4FP56Roa73xHetXln+qLonxo4STgBVplsW4PzvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8W03miOfOlfnbs/DgzCmM+tG29izjwsWq1qwsH4mtk3Su6NkzoVjg9pVsSaO?=
 =?us-ascii?Q?I5kFnSIrXJMI7/eiGgXvKg1Nfr6chZhoVRCq0XqU+3IKAKYYeeFoJAUhfxDc?=
 =?us-ascii?Q?obbqf6KpLXArqwvxDDnTz03EFOyqHBAMtDcCJvon1Ol6ye/8IvXzOUo4gK1M?=
 =?us-ascii?Q?6/2pBvM4pCK51E+7TNZ9H2UaxE9meLeGiVpMG9CCZJUBgYyAXYHinE8bANfk?=
 =?us-ascii?Q?YVzn1m8WeiW6mGyVNBmkMvJbiARY+FtPpWE78NDtsL/BC82jrntf/XAVac55?=
 =?us-ascii?Q?6Goa3jIK57tfOHmRe5V9Hp8BzaUN47fwZl/LP8nufjXfGE0xFTZuYq/ESqzb?=
 =?us-ascii?Q?47OZ5z5Ke+Z9TU/59vw91/+lTlGGfDXjS+TnDUmUI2WCta90zao3aKdqlgo1?=
 =?us-ascii?Q?sFjZlhbQeZRUWaTbFAYqt3kXksKwVQiT5HxB6Kjx+pfPh+TISrEAAUL9rgnD?=
 =?us-ascii?Q?3gXVTFj+nuitDa138kJrRDGCMIVqCfGfgCRiQ55kXhdaJkslaM4L2oMSkn+o?=
 =?us-ascii?Q?WeoFb1t6TwvhrpOFWtwHWIE9RvavwKgitYYb+LSUEjFrorWBEYhXgsRwec5j?=
 =?us-ascii?Q?nKZRS0fiMYuA9PgyK8tgIYZpXNsmab4bGAFwHulMSsASBn44RoKR2FtzSCEu?=
 =?us-ascii?Q?CuFITC5RKLmVUluXUP3xkS98F9uopVeY8LtTIt1cHtzy688yMGS8v9B1KVPI?=
 =?us-ascii?Q?8vuUpdfQffhvlI7bRm3K5yrbqy9DeBEtS8svV2sEdfNRenud5IrgPgC8O+O4?=
 =?us-ascii?Q?TWeXJa6DTaP32eShxadfDBS7qYpcEzEFEpbO20/sDSolf713qHGRNbiYFVyD?=
 =?us-ascii?Q?uKB+oTJa+3NjODIUPrktBEjZVvzjb2JNHqC6ZQompbnwFisl6LicFcYMM39N?=
 =?us-ascii?Q?L9OA+OF/VYMhRzgGKyD4s54KJNVGHh/YUTlqrgwQYMhF0fUizUa432fHTRtI?=
 =?us-ascii?Q?mtn15MUdL1bQqd4ITeUVxthBNOmWDu9acArJkfRO4lvXYQ9U8ZBsPNAry8Si?=
 =?us-ascii?Q?eb4hbpQvgssNHMvRhFcBIfoddBEq2RxM81swZph6hcIKzb3Ua37qQoDDjU7r?=
 =?us-ascii?Q?4qp4n14PHDFuqaTZmmcdBfk5KmxR28g/wCccsATX3CQYViFigKw3+s0UUjaF?=
 =?us-ascii?Q?0hlefC/6SJJz2zsO2vv6nLX8KQrhDsKgE74VOlf2XU7M3bcnzFr/blZNR6KB?=
 =?us-ascii?Q?oYhROHALhLJuVDag89cKd9zE4Zs0FJ1m9x8GWtq7PUZxHc9wm9P84kEwmoZm?=
 =?us-ascii?Q?GbF7xGaCc9WOsCC2m0DiS32Dp4+lYGb9qTBXIAtQ5TNzvX8Uf+O3k41GOz0x?=
 =?us-ascii?Q?MgNZfv9/OAxKQaT+x6CYD/t7HiErhbA0A3BCqrIZELBlaYatnqzNRAqKlvuV?=
 =?us-ascii?Q?TEESwXYzlfKPrC0v3BF1JC1ugT8ZD+tnc9z2F754hgAv5cuALErxhfdviDgK?=
 =?us-ascii?Q?yY6GaxwC1gIHp+eqE5wVsT4UlOkhCYhfFyYaJIlik4MU0tVOS6LV69fue/0T?=
 =?us-ascii?Q?lVtSclGiUaINdSa4fCnoBeyvI/P5kTvSgycGcm0lpacGTJ4fhx00j7m77cmg?=
 =?us-ascii?Q?es1ARBtUCfZTmxPbUabjl4vKBa0WoB+J+er9QVzf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee30a73-a9c7-45e1-fde4-08ddaa39b14c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:18:12.2150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8x2NL/Ifvlst+041CdPKHmzfe2S7ApjYSuv/PAJ5LC6vhVOHotUsd2FZBYMMbQgYSS64EhioHpVuTEjMaj7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

The DL server for sched_ext will have its bandwidth removed when
sched_ext is unloaded. Add support to DEADLINE for this, so that the
sched_ext DL server may do so.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 55 +++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h    |  1 +
 2 files changed, 56 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 4ed61266f3ea..0e73274d8c31 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1752,6 +1752,61 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
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
2.34.1

