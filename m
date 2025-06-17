Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184002F0C79
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190794; cv=fail; b=Vkck/gFckPLdDRBoaZA1TRHwqjm8zDkGP2RHGlX5a36/uquMRxi5+24XLO+RNG7Rqt5ZSHeG3YR43XS8pGC9rCaWgHHYkgZaDJjGd9imtoY/wHamXTLfPqe7rg8QBAMdeWlCxbaAi2+buGHuB38yTc3bbJMCqTmfqhvti5UdLaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190794; c=relaxed/simple;
	bh=QI+MSFTwFaGXsOWcRqJWVnjdOW64zQZzGTUN7BQVrBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nYzLOwY/1oRyPoDWcr5MHEzxH5ODZxhhosZvpenqsH+Ls7H/pjw03/SMMCjlYxnZUlPVBmXUGtC3WCbymU//ORcbb0EwcJXhHbDrr7WYDZ3/MeA3U08ZHMAPoXS/h+gkHw5Aaku7XiorE0FMxWFFw+owHBQ/KMkIY0R8QFYgTDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sAj3u9Aa; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sAj3u9Aa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXGl++ZUY7eA7YYUF+2WkYen3AXQzu5GI/vMyyFgSCBIKzdE7jXs9i7lFc/xl4pmAEiMBBiDsIirpXInDuZXtded/eKl1OtHLn975eIzDPxfyDN4fDwRbX/ax11iIrlzOpejlf8+K3QhgOJ8vC1eHLJVMqOwKTW1KRWgPvyEGmehiQJinzqp9aqOAfdbKEynqOE+DvBNBWYhorcc3tNYHq/y36NIXf4A5GCi6niqUxEEhXHDhywaJsyDFT9qJy4ZBiqFOBKsaw684G2HU00sYlssZekYXO8lAIc/vxwSc4fUpvh6o9NEJuj20QvIH0nC3WLrA68BJytr1QDSGPHp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPpQp325V//zMy9ZlGpDO6RGac7O3M60jHuX0ke9jLw=;
 b=jRXeTogorqh18ARi3VSBAwuNFTPjX4HLLPZvLOsj/vvm70ZRJKcUwfrag8cjb1itjQ3yZhNz9sleGdcRQhlvJ5C6iqu2Zs7cNwstXGvAiVOiRoFC20wPUHmRYvMa1KXoaUBoAhM86qSAZwCsticbD/trGjNo+fK4eedM6JAWLqYwwXlbLoi6cVNGKp/l6+1KBUeXZmy/bo5QpJBUGwZCfekWpNJ/Cb9ebXvCYfhv2kxkds/11caCNND9/ScPlJjCx2XJlJcuaFONInY7ZjBhR1d99xMTXJfOL7HXlmJXGWgHMM8wbO2jtdX42EyrQbuuyF00/oDi28a0IM+3W53LgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPpQp325V//zMy9ZlGpDO6RGac7O3M60jHuX0ke9jLw=;
 b=sAj3u9AaSkJVDfM1yFr7OkZ4utc6dbW4//jmqWM56JwErnw3Zge7GzWXEocCZj8waJt7WiPY2ahjvYM0KpA2auBvVqafYvcZ2g5EYc2x04XfdzREPUE2DF4H6rcMk35MwTDD2PkrFNjtFRk+GDRB1CJMggHcCR57KFf2HhoqvtPnH2OJqBi4wbuGNP8OnP/TFa8g30ln5QoZFc65NySybONKDRmBX1w4TN7w2vhwHj5YUoCUvBWvh7DcUH1XaLre14WeeHGhDJqknDxpy1pAm8z1Dyd+TJ9lNXBegNLrn/ifB+jqGZ5LRRlNaZv3NMg24xLmHapeAYyHnkCDrA1VxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:26 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 11/15] sched/ext: Relinquish DL server reservations when not needed
Date: Tue, 17 Jun 2025 16:05:14 -0400
Message-ID: <20250617200523.1261231-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0064.namprd20.prod.outlook.com
 (2603:10b6:208:235::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d44f35-994b-4608-f417-08ddadda70b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9eqMmBnhfehZUYeMcREUconF846lvfictpjXzEc3FaFHElvn5xo3zY/M3aeR?=
 =?us-ascii?Q?jN7F0cpMDCVWrwSFGaYiPeVf4lNWFR/0ifxJ6JeYYPL6nFARBsHo1Bvordlc?=
 =?us-ascii?Q?2VBP7wwzwtzX9yY14OBHSbn0KD1nZPGSwr+aoAGmo7+sgxJcnHj1polYu0Qp?=
 =?us-ascii?Q?DOl3NzdQqJd5X3TT06DqFGTZmeEEkbjKTDkOl+vpTzrF2lN92tqoYJGEI6Cc?=
 =?us-ascii?Q?6kHAZ6wQM3BDaY5bU9tSJyFdf2TNRDpW1crsK+pahCsU2TxcTjn7KuV9953S?=
 =?us-ascii?Q?imkGWtdu71UVXQuGA4xWz7fYXde0AJAOhY/J/Ql8FVDH+n1SpackF5E/1n+G?=
 =?us-ascii?Q?KTW4G/6gDKN5axsg0TdDXkOQSa4q+ADgK0BwD4c695i/XqvVtPTfWZ4tZv8U?=
 =?us-ascii?Q?ukLjDifVDeJkVgwa49CgNFyFRzaVhQW0GBxO5Cdh7Htz/tMjdaJWGH9EZOtH?=
 =?us-ascii?Q?X3I7GE22cYpWuRwkhDoS7qjQMD3d4MvU8trMdWaYHegmB9T+XfdFw7tRofdG?=
 =?us-ascii?Q?FUDPVIvpUnDvY9yjT+9S62mHJT0JoPT51CrfqCQlQZFYaACQh6coEm5Bb3Yf?=
 =?us-ascii?Q?7HsoQkbajLFvHifxWwR0OpnmHCZ8Aw1WTQwi+JEvFdfwh1QI/7L8BugxDOeC?=
 =?us-ascii?Q?7WZfN7G4GnfTZtjlq0Elof8NRAtW1ySu6NYNOhuODpJsrb9mWWOhuif6ZDuv?=
 =?us-ascii?Q?La4VCwK8sgefsJz82t7lD0leQKQn+aCH5DibPBU/Xq+/IENX3+6wIlwvECuj?=
 =?us-ascii?Q?Y32rqBo2BT2Hn9/vImCD2I7CCeC3A4hmsL7/aQU3YYcVgxkjTt4dxBy2A5vm?=
 =?us-ascii?Q?6pDHyjKdD+msSqV4XV6by++gvFisXPqqQ+Ud5dgsTQYAQUl6zA9+x/aN1zeO?=
 =?us-ascii?Q?QAdkdl3NxvHKljCwjJkTwsk5zwDOxx5H4I/qAvXDdRRJaeXnc/xpkAYPH+zR?=
 =?us-ascii?Q?U6PVrxwWdLNVpwEZJaD4yS1ORWDmaoJGQOXpsICzbZnpQF86+RAzAI0V0yxI?=
 =?us-ascii?Q?DtMnbhe8pt/X8LqTs4Ha2HpQ3rHyebQbz6t4Bz14EOP/Dr6KKNoKBa5YmXy5?=
 =?us-ascii?Q?Jzj2pc6UQQ7T93LRJJdNWCgoTH7eridJKlacWFre0f95shrUGiQ5rFoePqzr?=
 =?us-ascii?Q?HW3iMWEg2QdrAleP0peVYsoUsJRiQwEMLZYmc8ucKiD1B8YqxzaxsmW5zbyQ?=
 =?us-ascii?Q?vwzkDEAVCRjc56kfJuU9bWMNzVr037ynjw31Fxc2chg4YN/AGe5+QUN18i1h?=
 =?us-ascii?Q?+/o0q9An9cw1OTjaN6Kt+L6cnUlJu5ScZ9J2o2e7l2GFv9p8WeQhhMo/9z/I?=
 =?us-ascii?Q?oVzvjn6yKGdEnLqrYo+HIhS3I2y+oQaytbuVxG5tfBWqK3D/qnsnCEmReNWP?=
 =?us-ascii?Q?HiGFa7tT1yFjEXZiyB6bRqjkgCcWnrQtly0OoLJwIxkiPos5VESObr7g+q7b?=
 =?us-ascii?Q?A0UllAVtulwdUwGqj3nOZguFllOWDzWs2FKeyXsR1aNw+CeNlq1vdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LWA/RRu0ioMw0XtnUE9OoWOCi3GhMAd9BlJdwaKdxmACrivcRRkXUUsWkHr8?=
 =?us-ascii?Q?+WqFjf3aJUr1wnAZqbQEMX4jWRaeVDnnYStjlu807zTyCLXk1T8Ro6QS34t4?=
 =?us-ascii?Q?K4PcEGFSwbH9/JMI/ZUgh27bOhb8DJ7LM/tLd8CQ/6tMCRmT184n2SwwEwbV?=
 =?us-ascii?Q?c4PiZ7DwUBGgqjeo6LCjjDbj57+glbT1XEUbJS5RT/tFjHgXwX4/r/B9JFTO?=
 =?us-ascii?Q?xg9zX/ON3ZCE0PXpX0cFOmzyS4rwl7jsKkD7pTlqf6wPAS/SSBrjB7kGCNaz?=
 =?us-ascii?Q?oIcmJSchEluEVrlXcSS7r5H5Ko+WC16QPrOe9G6PmDX97kePnhdoJ2hE3jC9?=
 =?us-ascii?Q?5O1yV/ih4pWcRDcUevnN3hvW4HpoaaW4XzMLAQ8i41ijHrgmv6ACIxFdB1Bh?=
 =?us-ascii?Q?tcMi5pNHq6DeHtVMdhlVyVoED1YiDWVf1dDnk7v/9Z1N6HZKlPc8kWtE7GIe?=
 =?us-ascii?Q?yvBTvgOcLSNERRJcAmqwutad9F+1d0O/zidCcZc7+PK1gN9iafp1IJBSJzSH?=
 =?us-ascii?Q?tt71dsw3iaUcbt6KkkhdbXG0EBN0Kz4l7KbRJVR8bOSNnu6mPYBl9T7iQheo?=
 =?us-ascii?Q?OV77kQmq5mbHuM0Wja4UT2KCN3gon9GJQ4Xe65t/KTQ4Jz91eJP27/5UiqTR?=
 =?us-ascii?Q?tBkl+iOO5phLHK3moijiQpMD4dfH3bsbTLYhLthh3kkG+58Mdr6m9/XIcrcO?=
 =?us-ascii?Q?LoOaXJ36KhdMKKh9DECNrvvhihqbEBfjESO9b+y+gxIPkIF+kliJM85hK4hF?=
 =?us-ascii?Q?EdP1CmlSvYEP0n/Jeneamsi+8kreeWQ5uXML02uKGj6aOZEIesnntIquw1pR?=
 =?us-ascii?Q?Gm7YA7fGMyL2AL3bfoCFDdUuQMvfyrRZuTPFKf9B3dgU2ZDMUqwSVy2YTzik?=
 =?us-ascii?Q?oan1iWLVjiHAyKzXYMa4tmVkBnul5xspT2NIVLVGZkJ4Q2gPi0gPWdxv8wld?=
 =?us-ascii?Q?u12DSGogcmLCrkjzIrikMwFhrfW8W+G6jUu40jpFy75Wdaa8uGHO/9jZuKBD?=
 =?us-ascii?Q?uMHUZIz10L3fBN374DRl3MV4HSu3ZKjUCKU8u1qTDYP3FeacSh12O0+Qx4sN?=
 =?us-ascii?Q?bLDJ2FwbX57EFh8SCTl6adFHAKvpxTlv6soEbcgHeOXH3aL3eX7/HDpRRFyL?=
 =?us-ascii?Q?dJagbVG96aq4CGGOIjJ4oIdUNhoAz3DAFTHuRsmfOsmGiuxI+9TLl9O9H011?=
 =?us-ascii?Q?We59hoJRxLBWZLGmlKCYj2le++btnSp8NRZy87cWWTkibM38zeKTQXshJKeY?=
 =?us-ascii?Q?w/IhJO8ugKe6h82+GQ8UpU5rIW7NF5oeATAc1WePplHA5E1lveDvUxSJf3OO?=
 =?us-ascii?Q?1J8wYw5+h4kyApwtAzbhH9D/TuyokulXxh5kB/B2SGdYneYaFeSK6AaEmgMf?=
 =?us-ascii?Q?Fb3bsS1s0mTXTQ+OzkOhDhYEjpECPMrVWVyZLSgSA2C5HK5wtv63QRf0E+vo?=
 =?us-ascii?Q?+Cf7Z4TxOOa6Bj6dxmLu59JzXrDcmrH54cYle7+QTP+XQqh4YPuyS9MqBbSj?=
 =?us-ascii?Q?8jCPLGByMADOdGyIoAJqpCXCvD7WWUDDpQ4iqW45+CnUxKTLA0IWac5OFDih?=
 =?us-ascii?Q?ojyiF51Ir7UuymK3dSWsqwFc85ALRK9kGxXtW2me?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d44f35-994b-4608-f417-08ddadda70b0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:26.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYWioLwhhsppxenn9ORKxVfvZArMJhgP0232KjHAQQXM3GsLijYr9trdrIGWXabhJVSSGxPjcb6TvcAnh9xM3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

I tested loading a test SCX program and verifying the bandwidth both
before and after applying the patch:

Without patch:
Before loading scx:
  .dl_bw->total_bw               : 1887408
After unloading scx:
  .dl_bw->total_bw               : 3774816

After patch:
Before loading scx:
  .dl_bw->total_bw               : 1887408
After unloading scx:
  .dl_bw->total_bw               : 1887408

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/ext.c | 44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index a31fa12fac48..562cd28ff42f 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4983,13 +4983,28 @@ static void scx_disable_workfn(struct kthread_work *work)
 	scx_task_iter_stop(&sti);
 	percpu_up_write(&scx_fork_rwsem);
 
-	/*
-	 * Invalidate all the rq clocks to prevent getting outdated
-	 * rq clocks from a previous scx scheduler.
-	 */
 	for_each_possible_cpu(cpu) {
 		struct rq *rq = cpu_rq(cpu);
+		struct rq_flags rf;
+
+		/*
+		 * Invalidate all the rq clocks to prevent getting outdated
+		 * rq clocks from a previous scx scheduler.
+		 */
 		scx_rq_clock_invalidate(rq);
+
+		/*
+		 * We are unloading the sched_ext scheduler, we do not need its
+		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
+		 * the first SCX task is enqueued (when scx is re-loaded), its DL
+		 * server bandwidth will be re-initialized.
+		 */
+		rq_lock_irqsave(rq, &rf);
+		if (dl_server_active(&rq->ext_server)) {
+			dl_server_stop(&rq->ext_server);
+		}
+		dl_server_remove_params(&rq->ext_server);
+		rq_unlock_irqrestore(rq, &rf);
 	}
 
 	/* no task is on scx, turn off all the switches and flush in-progress calls */
@@ -5725,6 +5740,27 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		check_class_changed(task_rq(p), p, old_class, p->prio);
 	}
 	scx_task_iter_stop(&sti);
+
+	if (scx_switching_all) {
+		for_each_possible_cpu(cpu) {
+			struct rq *rq = cpu_rq(cpu);
+			struct rq_flags rf;
+
+			/*
+			 * We are switching all fair tasks to the sched_ext scheduler,
+			 * we do not need fair server's DL bandwidth anymore, remove it
+			 * for all CPUs. Whenever the first CFS task is enqueued (when
+			 * scx is unloaded), the fair server's DL bandwidth will be
+			 * re-initialized.
+			 */
+			rq_lock_irqsave(rq, &rf);
+			if (dl_server_active(&rq->fair_server))
+				dl_server_stop(&rq->fair_server);
+			dl_server_remove_params(&rq->fair_server);
+			rq_unlock_irqrestore(rq, &rf);
+		}
+	}
+
 	percpu_up_write(&scx_fork_rwsem);
 
 	scx_bypass(false);
-- 
2.43.0

