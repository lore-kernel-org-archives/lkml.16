Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE58625228B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791889; cv=fail; b=E1zD0p/ycvVWMqgm/nwTcpbK1YLce43JxA4ovNINUzqjFohdYaBcdPiTorjHHvxs/MYAvKffIm2BZkL9Xrjt823U7rr/Yy1l+AyhkDm69bjFetRXVsWVsoWP2ETe7oYsy66HEhMxg9QfuzVMUV7dgcOA1g3RUgUTtFQWhioxvjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791889; c=relaxed/simple;
	bh=xfZEYR1dy280Wf/DrDjGdcTGsOHCwf8KqX2Jh791Hzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XFoYztnQWWoHRsbgonqDOIJag7bab3Y9jJHE2M2pp5rhr5QC2iNkgrbNxXVvPY7VgVWWjPTGcp00kJsY1KiaehftLvwe5TV17PblQrnZag+YODf0WG9pRzdMzLkkAIgtsR7JXrLg2fZJydS86pnNb/ITyYNEsKhbdfE7X88iLWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jeRVKjxJ; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jeRVKjxJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eugv26VzPQBlJPrA8DuSReqDBZ0i5UIamg0DHfaBj5Y6TBpqIogQNx8waXUaofOFmCqTJqXWhFnVA1s/5lJRfNr+cSi9jkfqVm0SoCqRasNYXmuGhL9uuALO2gMsqZHRoD0SspG4Cl8rUO4H2LKb6zCuk3BFdRBKKQq2i8nm9pT/nz5BASLkPyNzbi//O4t+7GUxV6ce2Lb6DmbT8NUM9bBoqN4mbFtjX+ERIezSsbF6IIQ3HcViduK2sh38YXDfbmgr+lAEZ0bwuJB4xqmSxUs+cO8s1XI5LF2Sw0N7ezZHTGK8R8y1DdswIP6Aue/R2qwGW0f6IQAOMp+jwiZQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/2sJhzkv6oJFVGyrAa+g34VjNR2qNfQ9ZlGUoE55Cs=;
 b=laoW/OaNr2rmNC4QtYVPjUSoDQ1rANUhEBf5/PtIZy/GypG9fJQcIQfEw1fe2joSivKVkkGyXPNDDAP/Vg2BOATJZeo5g8AAcwJvcBBKSP+yYWEtiSWaod20cErlTErFkPmC0CvrC8Eek/BcdN+FNUnPPq6RDzCIoiABcu2SERSDbcqlAVVi/thNno7LM2qf2Xew0FI40q0i3ZnI2rI9wm7z11uERUeUumDRWL6Lhs/MR5Cg97WcpWzerDIh7PzBrFCbuk/Z/Jkn2bCNydKwYLZSY9EwE0EWGBf3kHO6Eg+H23fypk6iNYwycPcJABE+A9saQDsw7lGmSkNtqCQZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/2sJhzkv6oJFVGyrAa+g34VjNR2qNfQ9ZlGUoE55Cs=;
 b=jeRVKjxJ/UGvLeD3TasON6QIX+iUK67aAlS0ps4HJh/mL5jZNUhwqI377aF7GOLi7irynvnBE9hxEtGDE/eEWdpuE6QIptpDevriwhQ8WjO/5RB4ymKbd1M3L4FX77oc1sFsXETdqqV5EICMsVUR7x+J/BVYwYrFujadD+WTlSkN2AlfCAYPKKXNmmIT/ScKTAByC3smn2idkY0KqAJ4/eWxKPWY1aFVYM2w2Wn+PIoSdAy5ZUAoNn//zxkqJebZvWTNW3qb8hIQI1NXJoDUytk5WdjV4eKCRkk/W/Fu3NcHF6CWul4kcNi1x9NvHYIIuSLec2vF9AU7gWTqGYEjIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:18:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:18:05 +0000
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
Subject: [PATCH v3 05/10] sched: Add a server arg to dl_server_update_idle_time()
Date: Fri, 13 Jun 2025 01:17:25 -0400
Message-ID: <20250613051734.4023260-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0014.prod.exchangelabs.com (2603:10b6:208:71::27)
 To SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf7812e-81dd-4756-f568-08ddaa39acfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8tx0TsYJ/M/j4Dr7QkWf2EykjujnvXcqgPaYpGcKz198BL0EsU75U7cqAlvz?=
 =?us-ascii?Q?owZ5oNXrFYdZmUFHtYVXLsSJvyBt5Gv5sJobFMPHcKcw7CSk+8j5h2ylulnT?=
 =?us-ascii?Q?O5wSq7AteYMh6HbsXkk2OK8U9JEPSh8NrPCq3mdgU4VhQwGl2fgayMGrb2GP?=
 =?us-ascii?Q?WNpkWICzXY3OvZYJmwWC5GhBRiQXV3Rzhct7RK7oGOH9qgYlU42hSKuqQoDs?=
 =?us-ascii?Q?cxb/gmk/cFyY6cH5JRM2WbR5hKneu3VVSlJab9PSAbzAR2KUu8ZFc3d1xC0p?=
 =?us-ascii?Q?GlOTiQjJGIpHOWdF1QF8mp6+F6uxCCXEQiivLDWo9Lui5pzON/tPggRII2yt?=
 =?us-ascii?Q?yIdVxPd8sZvm6Eitvtmwl+HqhQsodebm3ld8iujPSy16jx1KrS01pcFto7cT?=
 =?us-ascii?Q?AFjmM1Dydg+8b73JJ4YbuXK/xDjcn9P5HghgvK3cLknzA65dXpbaZDSqv84p?=
 =?us-ascii?Q?9vR/nAAw0hXKTIEy0QcN29Q0EkjZIFzghW8vjjPhVidd+zb4HQGdwdb5pZ2D?=
 =?us-ascii?Q?Cl5RZe0xUoZznZY2j49/AFCIPf+gKAtI3KdPcJIE/UPKlBZlduwL1cZcou5B?=
 =?us-ascii?Q?qo65OAUd7bJzkGZqQ4k3P/c22+sczUFW1ouv2IblbBpyUWpn790ivoPOeo2T?=
 =?us-ascii?Q?qMxzkpg/ek6lWQcEUi+J5OA+lAEfYVHXjJiA4Il4l7obvpT/KnxYJfULZmOv?=
 =?us-ascii?Q?t0Blj+aBgGQY8vGtziyt5GVUVV2FAbfcXfFHQTuMsidO0bzzAaG6UhJiCpTu?=
 =?us-ascii?Q?4t3lLo2KA8RAa5XLeWlZUwvThi3Cid+k1Kbv6M7uyR3J6xIBLYZKhrDJQ3P2?=
 =?us-ascii?Q?LkDH7wc9nOhLq4TK65CXNkmNpLjOeh1YUIKEN/byO3CpcO6La3CbjBl/sK7s?=
 =?us-ascii?Q?AOdWVzZLpxT+ZyF/khtXR24T71HRk8CIqn0Zne+YpcIZ4uiWLpjB2scoCJzt?=
 =?us-ascii?Q?w2x2XX7JraHjUC4FauFrQyzqpnwbD+Kws+usBqzWiIjB0Yv0qfvpgk5vxG0L?=
 =?us-ascii?Q?tbQPDRzXrzb3atULe2Sdc/AZxk85V3G40qNspKoprYW5kqVbQqbj6N76KsF4?=
 =?us-ascii?Q?wj5WwvXCkF18sGVl/sjzhQ8QFlI1x4PmB706gMksX9+ZHEFybMEl3SoAsB2e?=
 =?us-ascii?Q?y1YboEeireBcd5D4DMaAvPbUyMJNldXVdiopeXwd60yoT+u6/qTY8xvJdYng?=
 =?us-ascii?Q?+lP2n4w3wd80GHt3REigqcNqZfsvVsYIFeaJKYX+reolk6EnGdTzkczJkBmq?=
 =?us-ascii?Q?eAIGN9zUoedNk52ques+ciTHHqExKmhK8uLhhOylOVb6nEEEuf5JlLzqznZU?=
 =?us-ascii?Q?5nIR92xZHUrOasDDXatX3acvlBIave+emovayvApBMZUDCBK1kQ1SWy3hhr0?=
 =?us-ascii?Q?e6hhZ9UVhsVob4bCq3jlgpH81Rf9YXnl3hw68iIGm5MjFtUJw/xQRpK0JUQT?=
 =?us-ascii?Q?k+HvaX7xUi2O8DELAWC8itbpcrAdTbsazIpdJaweXkJlM9ljj1SdCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I1NQv0IBk8jB0wmcibY5u9ScKc8lZpvdX4R0Cw4R8rcjZCQ1ZQO/1cSGPPfC?=
 =?us-ascii?Q?qqAANKkvu8ChP4oupSKouE2CyGcsbNacDZotJXm25HT/UFAugX8uDTWgyQ8r?=
 =?us-ascii?Q?Pm9cbyU2xpd0178d3W93piu59fVYtdOSd7qAFfU+2OQkapGN1atiyfQPmdP2?=
 =?us-ascii?Q?d1JkRaMhnngE+yd9Frfcb7H8HPM9Ec88mOcixFkflpWM1YvQPX00YAdF8KLj?=
 =?us-ascii?Q?N5UKA9pvzLtLaEIReAtEGEYvBObfFMFiY388FoYnBrVuJRyP4MdYms4jp831?=
 =?us-ascii?Q?AqSvuOLmDdrKdkL8nvtd3/pKa65ggs9RefmUWQML2bSRWa86MUobYAkvxMm1?=
 =?us-ascii?Q?kr7hbx33Cw+U0DRFA4xyTFZqgb2XBMO6QqKrPXMRM1vqwNTcj5iJC6dX3qr2?=
 =?us-ascii?Q?aRJTXa2pqeUlbZrB4WeZU49q9mnh4FvFoMak2xAy3hJCXZXfvHt7CgiPk75j?=
 =?us-ascii?Q?ZpFByO9XrRqfctR0ewcYEYgtrgMBQKbEIO0Xos2R318MyWsSK9ZI+j6M0yTV?=
 =?us-ascii?Q?7vJ4S+YaBE4Cf4YCsPRRlFfjlilv3co59+EPrbZIITy9WR2GFf89yr61H/Co?=
 =?us-ascii?Q?3j8SIrvmGbIJ2eAlR6v7bn6gj7D+HiPiGEOEzqLfiXlYWe8yHZZb8X9ank+P?=
 =?us-ascii?Q?Ph5r6IbIOz3/4KmOYlAuBobXTy+z55A0LFBAKesiMThZMDlCch9t7BfK3lWn?=
 =?us-ascii?Q?STxXOnmjSxS5bEipkxw6lNq7yflxCnzrXOKHJC8qbMrHvRdw63roVZdwGPqk?=
 =?us-ascii?Q?Y2NPYFvg3DTPm+P9LeGAlM35YPMKfaDGByLX0q5E/5FlnSqze3UI7dtuPgY3?=
 =?us-ascii?Q?EcXnZGiQ68C4HQaOVe19f2Vjc/g7rWo54Y3Rah7sQ7LP1QM6nNM+S0OJ+Kdf?=
 =?us-ascii?Q?yqgLPYty+AHKIDOWoyALWjk3zqlb6Ch5iD3zErfsj04hAAX7u8WTYcViJRWb?=
 =?us-ascii?Q?727PsZckI7GzUjWMBXU7bVWvQOutMG5YXA4H8CVXF+UF6ytM7rQa5sVL404c?=
 =?us-ascii?Q?BtDNjZWplGSxB6t8e8VQknUa7beCxjkH953HwmqYFVZXDw/78DQoyYf7Gd0o?=
 =?us-ascii?Q?71h+LABZ87Enq4YMitpdAKYDl/HAZ+DmCsG83bIn/uxpnUO5IrrxoeaajJEC?=
 =?us-ascii?Q?do3V/yGBkfW54HdkYQc63jPoeC3KUWuzKKFmpTc8F3Agh35OTSnX7FOD/0fw?=
 =?us-ascii?Q?iKW1TiAruOq6aPpnlaYYIHxYsH2PQS2p4W5z0H97wWR4SAU3P2EP5o5Btt95?=
 =?us-ascii?Q?+YfHrBvL6L1v7G1qeZRo4uERLdPpFD086P3RpK+ijKDwV1ZnAJdy1tMbI/1i?=
 =?us-ascii?Q?WxVK03974H9su3BthK9AjsFcN0OzjOnPvUmncBzJJog/5QY1LH4SWMQ39uVC?=
 =?us-ascii?Q?2DpVhaOR7nEECisWCZcbQIXpfc8tEw+KH07H558T84MgLZ3Q5Wt7a6uMN+DN?=
 =?us-ascii?Q?PlvkVZTPov10Z7U64z+5Dhr9C+MDyvspoBo0C1Qs2wNXAAxu1sfPO6+QHHgX?=
 =?us-ascii?Q?Gmidwl1H7wmxoQXPdp1jUmZsutuj9lRqWBf6TsbcOCBI/cpjMsechKWI49/m?=
 =?us-ascii?Q?akhhH8i8YZs8d1B8W4XkGXGRNtmUA0/YQyTX4UNL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf7812e-81dd-4756-f568-08ddaa39acfb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:18:04.9640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkRCQKru3fBUtbphiBm5haqsUTm/lXw4LH/+JSMNNaKGlb0ovxtsJEryuYB3gYbRwfAFvPY2aISCfahY+oCRAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

Since we are adding more servers, make dl_server_update_idle_time()
accept a server argument than a specific server.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 17 +++++++++--------
 kernel/sched/fair.c     |  2 +-
 kernel/sched/idle.c     |  2 +-
 kernel/sched/sched.h    |  3 ++-
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 62d7c18bff64..eb2521584f15 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1609,28 +1609,29 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
  * as time available for the fair server, avoiding a penalty for the
  * rt scheduler that did not consumed that time.
  */
-void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
+void dl_server_update_idle_time(struct rq *rq, struct task_struct *p,
+			       struct sched_dl_entity *rq_dl_server)
 {
 	s64 delta_exec, scaled_delta_exec;
 
-	if (!rq->fair_server.dl_defer)
+	if (!rq_dl_server->dl_defer)
 		return;
 
 	/* no need to discount more */
-	if (rq->fair_server.runtime < 0)
+	if (rq_dl_server->runtime < 0)
 		return;
 
 	delta_exec = rq_clock_task(rq) - p->se.exec_start;
 	if (delta_exec < 0)
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
+	scaled_delta_exec = dl_scaled_delta_exec(rq, rq_dl_server, delta_exec);
 
-	rq->fair_server.runtime -= scaled_delta_exec;
+	rq_dl_server->runtime -= scaled_delta_exec;
 
-	if (rq->fair_server.runtime < 0) {
-		rq->fair_server.dl_defer_running = 0;
-		rq->fair_server.runtime = 0;
+	if (rq_dl_server->runtime < 0) {
+		rq_dl_server->dl_defer_running = 0;
+		rq_dl_server->runtime = 0;
 	}
 
 	p->se.exec_start = rq_clock_task(rq);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2b7958d2fb06..6fd4100fd5db 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7016,7 +7016,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued) {
 		/* Account for idle runtime */
 		if (!rq->nr_running)
-			dl_server_update_idle_time(rq, rq->curr);
+			dl_server_update_idle_time(rq, rq->curr, &rq->fair_server);
 		dl_server_start(&rq->fair_server);
 	}
 
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 01e9612deefe..13a3d20d35e2 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -451,7 +451,7 @@ static void wakeup_preempt_idle(struct rq *rq, struct task_struct *p, int flags)
 
 static void put_prev_task_idle(struct rq *rq, struct task_struct *prev, struct task_struct *next)
 {
-	dl_server_update_idle_time(rq, prev);
+	dl_server_update_idle_time(rq, prev, &rq->fair_server);
 	scx_update_idle(rq, false, true);
 }
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b4b9c98f0c6d..467e39205ebf 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -386,7 +386,8 @@ extern void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 		    dl_server_pick_f pick_task);
 
 extern void dl_server_update_idle_time(struct rq *rq,
-		    struct task_struct *p);
+		    struct task_struct *p,
+		    struct sched_dl_entity *rq_dl_server);
 extern void fair_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
-- 
2.34.1

