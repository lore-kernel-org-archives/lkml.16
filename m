Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3C22F74B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887312; cv=fail; b=QkL2+dIpKa0nEcb1glbdHWI9O9e8Ri27I0gQYMZeKkGxbrctzBhmVYmvORAiUiudX13+xJOOSrASTB5SjZehuHa8XQdauedxQLw8mmcf69WchrNTDNTO04KPjlkSlRMjd4pIZ6pf+BSq0skyRkKIRdpdeb4dgdXKSWDRgijEWdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887312; c=relaxed/simple;
	bh=LzZfCfeKwWf87UIPvxgnZPiIAPg08z+kv5sshR7F9NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oSuq/MKjN/TOcUZMCwbloYE9zp7LEdwANlgfOSVeZ9fSjYMkZMQb9Ky2HX6GMXMlf62E9X4UteXPABdt3tPXoXw0HtnKsxcEVrAUIe1hSaf2MMt06iXEoM4umkqHreRQY5HTspIUgD7bsSN6z4WRg1P/mHTDob59Ym1jR8I+IsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GBjdzAxk; arc=fail smtp.client-ip=40.107.244.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GBjdzAxk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhaS/NuWNQTlbfl0xCDAaRtuzceyydpohJw3TT5ynK325nSBcxVVBxVZYJs9Hw7URj14IA4g+xqu/+knEh1v6BoVlYQNrgJ8iSFuhJpPwA5JhQFkwKMhunqm4N4yq+3cPvef/tc9elwFALKoBCesRUeMKWExiMX2mk6NpS5sy7W//+rjPYB0+ABFyl530AWmxyIT5bARmiWxwrmUERY4zT9maTJ1k5cCKba9Di8ILljr1PTHzY9KFkTzhkUnT+UExE4+UvBGBOzzEmXbWDND8sXXmEM2e5N+zxJxsnCRYGxuUxB1QyzfCzt9X+G9oYKLDIh63w2kBICQb/10gRWMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TewCJ9W9uDhnDcVIU06dzp1rld3+GKn9qxJH5i3aTSo=;
 b=rO8GO140qIaApInfIjO8XwfO/5ipbfGllgGdN5AnF3Ho7WUTCp0Y6UWvvKfdzgTdZtSU/3zwwVKrTYHp+U8/OepCAjsCHsjdlhK6uhmnwpH5sF4ShRJ0/a7t6F/uDmZI1ljA8hVX6rcuOlLEqAqmlEmKmQOjtqvnEzYGonneF5oGN1r9x8/sXxZfdjrQPk4PTYxBDPBX7EJkBOVAgRlbFrLzmgHXjj4yBrahzbixGGssuZlqteFFTLMY1rtsUe0tIzU8T2cit+QfssUZGlyYCE6wpEF6nbJWA+jMWp1DULLP5RmbRuKQ8Tx7Mo0XieUW2mPj78kWFNB9uvcW5erpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TewCJ9W9uDhnDcVIU06dzp1rld3+GKn9qxJH5i3aTSo=;
 b=GBjdzAxkXkSlKCj4jtTUEvfAWO0vyi0K8r8Pkmw35W65AOYkYzFrEoC4M3xFVq7Ov/EqXROg8bzCs0Tm6LLWUTamo2iaJxIlrJDMT1jMVMRW5ba9YtMgLkxnvcf8pEJtS5P+/Li8R1W7ValcA3DHOHkMrK/iLhAwwfz0PdtGS5nBZs8dh3i9nFx/WbLxXjIjmtDMcS6FJhd+l31NKrbGEw4/cgZQGRPLuAuhvfDT+W7ohXuRXlIujkIi1bEminGQ6OqWgJza2V+lhoK5nDMy7pDF2pVyv7LcbFNbQEaGepzjT5jgkLLjnjbVEqmPcADUBhFiMqi2PzBURdNVvP/lxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 18:01:44 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:44 +0000
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
Subject: [PATCH v2 09/10] sched/ext: Relinquish DL server reservations when not needed
Date: Mon,  2 Jun 2025 14:01:05 -0400
Message-ID: <20250602180110.816225-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c3f4bf-3558-4909-9096-08dda1ff88b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jWa+3glZx41piA+WU9bnYfFH+RBmaf1ps5hgv6kkDfQ06WVVp+u16tZmaHfb?=
 =?us-ascii?Q?qcUiYqdtvDSgltwcgkw9odiRqjUt9HuTuWqbfYfJqMPiFaiB0wO+9WTry0i2?=
 =?us-ascii?Q?p5XT2z/AA2wtU9TDUfPXa88VX9PcnhYvKD7DlVy8ZR4nYkJfe55nbt0tEI7G?=
 =?us-ascii?Q?uI9Jb4v6Ncd5P99PhheJXnBQsqZXzhlOIDoxYFhPoTB3Rh2JfF+ZrOevv6Hc?=
 =?us-ascii?Q?X1530tpVMx2vWhFdxcL/niVNq8e2QLIkwoYyPwdKPiTobn0mf4uEt1dB5BbH?=
 =?us-ascii?Q?wm/8Ld3Tc4PyjNsUKUulS+JU5ILYCcBlEyAJQ1DMuFhGRJGVvRUDuQRJUXpx?=
 =?us-ascii?Q?rpIwdheSNylnuqnOGKeZt8cm2v1j+qPTUNB9uPOAzn4CN+VJ7GbC5cvWRHuX?=
 =?us-ascii?Q?JqV/8vBrxmYfvj7dr/cKWzTROj52BagWmQto4hfXktjrnfwfL39W2mIt18we?=
 =?us-ascii?Q?jxt+m8R5OdFYDYJD94o8HTYPD7XX+UJ2TctNksN00biH65+YGTzV19DQGXDH?=
 =?us-ascii?Q?tlYe7w53QI9vP4QNzvSDAHAuNSbfPxi9Hhkj5cRcu3wgLIlQvz+lsYqJMrHM?=
 =?us-ascii?Q?lZ5knF8K6fO6LCLcie86TatH5phd8BK1s7d9dxz5m6pw/XCeqBTff0ftT7Bn?=
 =?us-ascii?Q?ztn1PmQiWv2UqT1yhJ8UX+9sX7CUR64uaeB6P8pARbtNdWNt2db4B08BwrQK?=
 =?us-ascii?Q?obK2wcKQRw8keFxumQbBsknZEl7zZZY37N2hf+sDYJCZiP7TmpKaeAU4nSTV?=
 =?us-ascii?Q?zZA0iC4TJKU++C7Iai0t1ef8E0lVRcnKqvzib1UXWlchoqanrBdhJRBSG3Mv?=
 =?us-ascii?Q?5L6i3JeBCjiKi4WCI0Ta3xRPJarLntUbG77WLyk8ZwCj6MHdWcthAEUGhnPf?=
 =?us-ascii?Q?P7SEVYi5si2dlDfj96SXn1QM7tirwaLJWerdkte7mdoj+a5NMILp05g3JR16?=
 =?us-ascii?Q?LLhbWGCvyjtW1ABL/6bF0jD069s5ttQB7AlBD7XnwvKVw6OqazKw1LixHJwJ?=
 =?us-ascii?Q?8dJOf01098Itp0+z/yX9LrzH3Ky0Sae444ylhZWzZK7jjy7UNCfXYWNoqWy2?=
 =?us-ascii?Q?i+QFgL6b3eNL3SZLSdD82MdyPPF9R9v/9VbwPyNdbEvlZRraTof4sjM9C1Tq?=
 =?us-ascii?Q?BzfZGSA2NliTDdtYk9mS0OV5ffKhclys5qLlmOsCMf8FVxIxHlgfsGAvzDuS?=
 =?us-ascii?Q?6d//v91IOMp9ICuL/2e0cM7dsJUu09qKbAdU5H9onLmZJMh+oljPdYcvPg4r?=
 =?us-ascii?Q?0/YgKJpHgFskbaZNeWmaKrJXu/jCJHzAirXo+GeSJ7ohbwNXU8C2BB20y9zc?=
 =?us-ascii?Q?GLg8FDsI2v/z0gZQbB28u84kzrLArkoFaNQPzM0+NL7MwVfPfz3RWPxRCnIE?=
 =?us-ascii?Q?3SEJ+XXsIZlhLfnwmcneBh5lD46LtL7M/zQe42AugBaZgRHXlEsGNXHAoeuy?=
 =?us-ascii?Q?5hgWOgkpqq8Ri7ob29vQkRI1YQrYp60dydcLttmhOtaOOYjEA9NFaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HNkX4YAJnaPSJlphwizZiyPs+1lA2DjAHLJmKMesYyLxyc6RrRg+HrnSeWWo?=
 =?us-ascii?Q?zkI6U7TYhnzRny/RK8X8tjS0/nBPTdR7YvUazu3byqdIEeNN/VdKj2DyylMf?=
 =?us-ascii?Q?PKyM8ltNW1AnqQUvfZy+aw0ZItUMBVGq8XwcfGVbXUaS5tm4En2CWO0oCH24?=
 =?us-ascii?Q?ikM6pNOJzWyoFvc5ISdHb2m8lgD2F9jfnoTb5W2T0YQy8IqpEpj0MDGcNhOq?=
 =?us-ascii?Q?JtVM+K+kpJV0y75Qe8TtSWSp+PErifiiH9eHXFN7zNFnTgczQ/o3snKJzT5M?=
 =?us-ascii?Q?VisVsznVkCwnil3n1V7T8+ZwxPRcllX80iGaTwe0e9ONaZpZmT+Yhv+dGmQZ?=
 =?us-ascii?Q?IAEal3IKOaX1Ri/EJ+QYyeEdGwykXqEd7iaeeF3ixafeM/3EFzzU00YZr5X4?=
 =?us-ascii?Q?UBnevcB+YONOKJY0nPlHWGI76GLacQ6j0hiDfRuvfrUz9e3EL9wlaaEm27fc?=
 =?us-ascii?Q?VHSEkS7Lrx7DWd1+wF3oO8pVEEQycnDFV03TAlrq2W620QBgtVVukYhW9n2I?=
 =?us-ascii?Q?GS+OLcw3EttOlj3lZEK8qtzdrps9DKfTXdcVYT/+cwkF9LOc/tioCNKWXpuv?=
 =?us-ascii?Q?Q3eoshUhczTBGUIHn4+TIZZMNo9gLgqJobNOAuO2yhZaLG/JPnNIAAP/52eP?=
 =?us-ascii?Q?6x20zIxFqk3ZajjJ0ORGMxroqbBBn6R8KGRIWwvz4/v5LLbaWVij8578xBwX?=
 =?us-ascii?Q?mWiX/fUM4Q7Uy32wVwr7ScCVfJBvKK3nBJbGqbbWaYyrHviIwMUc0LXYJTvW?=
 =?us-ascii?Q?1S1CkIjQxHoF0k99mmoDXhqoFvCChMUN19qT/73qb3Sher++VT8/CgU/P2RM?=
 =?us-ascii?Q?rVzzdTVthVOn/2bpWrItNFiwzFOD8TSsqapK3lTVdYrUkMAz2Bj4vrBsBopj?=
 =?us-ascii?Q?lj7gkGWwbjy4C1PL2jjFvkDATxMGbXs7KEVQeNgBmBKCy6q4AoJprUQ01g5G?=
 =?us-ascii?Q?DqvkauPSqe9kZuVw6Dk00+3N1ydxAk9J1UMYtDYBCySEZ/rez64twYYiHHC0?=
 =?us-ascii?Q?wy0F/bom7+pHd8jVpZXGtQRIpYBV/mi+DnSmC9hloPuAYHsJGa4EQK6WQ4j/?=
 =?us-ascii?Q?1fp0TIwWvAKE/ildG1oulJgsWnG9u/MPLRbVxRY768R7mxKoVj3FFE8oRSAz?=
 =?us-ascii?Q?XkN3dsh+JZM5RN0QKYBqZBNFV1d/KZerUxl87l3MjemYCCJlLQzp+FQZZdTO?=
 =?us-ascii?Q?34YWhi7ibzumcm/cdnXWSBA3U+K6nGio4+5/Z+V0GJbjjVMAnJo5hgUW9IYs?=
 =?us-ascii?Q?l2AaGhsZOIp2AT5LoDnzITTdSEo5EU6kJu3dsSdSvVNh3j4D9pUawAHgFuSH?=
 =?us-ascii?Q?Z2gVrhCMn/IqBZmNQ+oxmluTWAnN/jajWZDPY6wzT2LW405Uwk8P3uUL8AUD?=
 =?us-ascii?Q?t+v2Goik59U5+tOz1Awv4zDY1QVPuJ33FpWTXNiRkSVFEp57aaNFkJbFgJst?=
 =?us-ascii?Q?ZvDSdbuROBFLhCI4sXRq5ehPvkhire5UzL/sVIlxpCeVFKP8OGf30VlphR3e?=
 =?us-ascii?Q?As+2e3RX7J7v3uFSXvUvxq6NnhGnyn6yUfPOHPxHJOENE8xZrmiFj3G8dehr?=
 =?us-ascii?Q?5ZUAUW+hHiyJxcS7kv5kGn7Ezwpqpl0aLo+nLWPF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c3f4bf-3558-4909-9096-08dda1ff88b9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:44.0186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+wJiDurCBj/RNjOe0m0N3wWS3XHQMjFknkqRMDqOBPAjZAy5EEDwy2U/Ri2Cb4RJNCRmHAXakn8LZHKzFrhiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534

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
index 52f98c3944ed..c938a19cd44f 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4784,13 +4784,28 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
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
+		rq_lock(rq, &rf);
+		if (dl_server_active(&rq->ext_server)) {
+			dl_server_stop(&rq->ext_server);
+		}
+		dl_server_remove_params(&rq->ext_server);
+		rq_unlock(rq, &rf);
 	}
 
 	/* no task is on scx, turn off all the switches and flush in-progress calls */
@@ -5547,6 +5562,27 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
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
 
 	scx_ops_bypass(false);
-- 
2.43.0

