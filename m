Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9628A3ED
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499015; cv=fail; b=QuaKeyEdU0XBR79pfOC28RLhlP8cimA8ogkQckKL62k2DJHuXveYKCu3HZV8Mxc14//WG7a3XwVZ4U1craXc4q9QUdS7HP5EGEIe3905RksMelkqFwgSmI1zrfVeXewLl4XjzKWp8ayactikbyQaHZuHl/cI+qldo2IwHQbIViI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499015; c=relaxed/simple;
	bh=k7VqCBskLXoeS9CLvKzNbPefJBL5aqhzMh4RWnjiu+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JtUfwCXoKmxTK6NM7eMQMfbc/u2JdSd0UqAi8jZJKqzCPqPrZMH2ZJGlgykpQ1lm4OcriCmtPYqN1X6W60rr/LNAgCS/sTQAo8qZ7Cgchnz/k3YyBNv+MpTpVM6rK0/C/5l1hFQnRxjG1xJmYWBkxaBBqbE+50JqfiRun0AHLjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r9lOLXaQ; arc=fail smtp.client-ip=40.107.223.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r9lOLXaQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK1dEp60JV22QmiIxG0+XGNmL/ZGbvtKpobpIeX1iwHwOUlSXkT1SMkX3in33hixvdJsC502fpifccJ/kE89fzqvNNVRbIpYOBtAlaHEclo01tBFxTNyAPh0EVO84VFFCVkbnQvIuYYG511QgBJ3l4c41fGWvDhqgvj1vSYiscCs+k+/e6RiGPVALxiro+pLyBXkr1n7RtdU+lridqTqgiN2vRTSN+gmCXFq5PSY8hXBKHBzcyxSNPfvay4TsmAM7tcfvPsm+0IXsS4jJIbIMxjp6LS6Mo9wItbZqtB6eVrUYcjyu0pC1PBiBIOKrAiUqn8lVuTG5eG2uYnQrBqzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thYE1AktPLIU6yybkeXQOW6+wMDHL5QNmKbzToi8Fe8=;
 b=LPkfypft2K8oMiMHQi02pCiKUNJ8IP9hRf+Yg6TY7APFNYIziofN4rAs688IFA1Udh/hNg4qRbwCz0JUmQ0gW15dmQtYkxRK/KvYV/bGoD4+caC41zDqdkZHTvp1F4ByCU3T1SPdX282QmQL1dGcCk5Af2CUBAFAx+D6/KFeDWaZ04VMfZ7rj5Wlj16/0nspq9mxybjC8fyrwDIabSVdIj335cvzjgwGC1AIx4ZB4ZDckn4b7pY43V5RqrCwv51EV2+/cVyRg0v4mhOspVb7HJVnKKuJy4/jP+Bw7fGbvM1Fq4kzAynim0KOYGteLOR74Rztv5DojKSLWArtccO6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thYE1AktPLIU6yybkeXQOW6+wMDHL5QNmKbzToi8Fe8=;
 b=r9lOLXaQJyB8Hr48JfbbULY6Orm4nR54a/+hkMmW6nuyaSchPcOZGtU0rJESt7aJd3FXjXMJtaaXX4ATOHyA7k2DJKQaKGF4G6xSiv70jLq23nfyh9W9KEcFzzp5LxBFdz/XShQqdlRbdCtO6HNRlLA7QZp965onuatMLcyxwWy+nf8l0ULqgBKMNwgKuCAnmgYAyBtHERK+VTDDgGznY5bDGTD3bolJkq3CLdapgjUVRPYRwPVWA3EuUAacdVo2re39ALLu4OrT+tmBLRmIiK+uw4mmCbXN7J4NsDHNSxdOFrgvgDe6zYteHKSs6ZBJq9mqfx1cB5BZI09knZvWfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:30:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:30:09 +0000
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
Subject: [PATCH v6 07/14] sched: Add a server arg to dl_server_update_idle_time()
Date: Wed,  2 Jul 2025 19:29:32 -0400
Message-ID: <20250702232944.3221001-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0055.namprd20.prod.outlook.com
 (2603:10b6:208:235::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0b1179-c74e-4fda-0e60-08ddb9c062ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SFOMgZ54RZtRBFIWokn/14KMvsekIaM1WlYsxUuu3ipWhbnjZcM2LaNLZ4TD?=
 =?us-ascii?Q?Mb5wz6Rd2Ot/+MJmEs4fMIZEXseOZgXyfMMpxpO6Qk/u2RNBRns2IM2a1KSD?=
 =?us-ascii?Q?y9n3zRirWM6u8AVr8ruJwWif8fh/l/mAxveXbdsrY0I2RhjHO6w1w/aXET2g?=
 =?us-ascii?Q?L4simqv73KFmO52sZ6HmWTeO2YWwMfUvnqwsWfIHm2J5/9k5u7D5Fjc4VoT+?=
 =?us-ascii?Q?5qy/J4m+yIWna4VADlhrRC9H+t38zWS4rU2LkTBbkIRljQT3L5csHK31zaSJ?=
 =?us-ascii?Q?sLq2reJ4YICkiT/bkah7hlb4LwZD4acN9V443gig9v4+KT8pQ8QMknBVUZnz?=
 =?us-ascii?Q?wGPi9JZ63Es5rRv/iqrfe4GEdFAiH6MtN+IsJmBkMxIRjsWt8C+6O8HE4u+h?=
 =?us-ascii?Q?ym6ITsvGuEuHqCo5YrMo04ujNd8U5fEDu2noCk6a0VyLoVToCcCY3dyQAL1s?=
 =?us-ascii?Q?QESsdab9zNVlCEkTOCW3ymX2hHE+KwA9Vp3GJEc1VodckkUMHlHLDGvi7TQG?=
 =?us-ascii?Q?fYASx5cR/f1xQ8wLPsruyxI+M8QlvpcNl6pOhqtbSOoerWjgPn/YiGB65QIb?=
 =?us-ascii?Q?hA8vZ1VIoGhxdcYl9U/873oc2sQ9WxzWY5lsmYR1HZ0kACqQVsFBDdXtPNFo?=
 =?us-ascii?Q?UmqTuYfPxgwfymd51pvu0EP5oV6Ai+yAdXluetPsw53FrhRLfm6gIZwJb3cA?=
 =?us-ascii?Q?glkPeGcAyb29QH9xzGkwcZGgSBqF2qGdkUKvirDy8TGl7zo5by2obr2yWw8A?=
 =?us-ascii?Q?TolEy9mmza2q0b+lToQWWFZaySPH5ySDY7EnK0dwSPS48esyNgeD/6f2SBB0?=
 =?us-ascii?Q?oFvwyXa3ozmJk7imxKb6clj6k3cRcSlFdFqv7TSxJhPVpbyfESfQ2Je5bQrm?=
 =?us-ascii?Q?Ei7MCBSCE7fxqwHDmIMJeQcOyECFwut31CK6A99DVWYWkoPGgtYAQKE5Ea7I?=
 =?us-ascii?Q?WbEvVDeTGyVr61UdF/zZ200tP8bZexY2/nDlwTq4Jtzua/MDOAW88BH2+F20?=
 =?us-ascii?Q?9NHwtu7hXGcviaJDtzg22jpJhwfozf6Axf+uFEzLQt/+tzr+2f5acMXu5Xl0?=
 =?us-ascii?Q?TdF6dynA8NnTS/bShWM8ArT8NWBBi9hbXTBDqPDZqib7Lp0+H6BfL6Bdfg6N?=
 =?us-ascii?Q?yhzt4nuBEjjKspmOIh0XUlUVDzeYlIKo7a5X+azKBPkIOVIAvOLXme+wFrqg?=
 =?us-ascii?Q?gYuJfqOBSdsGKEJrVILm95Jc4hjYyYDmMPDusp5w+IBda7HZSGU8eRZ0C86F?=
 =?us-ascii?Q?ikbmGGa8nil3M+CAV8E4yT4DBkYI7jgm1kAD1E0+PMe0oimMSrxTrnivlNYX?=
 =?us-ascii?Q?Wr/UruV3AOq6IXPgUxIj36QRnmy9LN9w8w99T84U/39s0Z+FS9hRSqVqOsFI?=
 =?us-ascii?Q?x8tbzHz7byoT3UoZqz7/GXCfR64XN0TLgDXuNYZpMFsHTmQ47AnI9dKaZmFz?=
 =?us-ascii?Q?mNtQziB5rFRfDEQiQmletHZGlujfhY7r1vaBwoxLjmp4qRhinhh1bA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNE4iSe+17+7GYEwa9PK+3pUatTuQeUvLEEU3vHszKji3vLpouBPAGc4jSpH?=
 =?us-ascii?Q?6Ao7xZL3NOhRJ7zT0R6kqa4tjvBRj8Vn+DttEnrOuW620pEcLjU0XNVZ3klN?=
 =?us-ascii?Q?hjSYkKCmPD1neFXtL2bOJIlt1C5OBK7VYEIbTVX/GUgZ6InbYQ7QK5HUwHCM?=
 =?us-ascii?Q?SaCoVCKE3mvd5J/L9GsnfOuEhh7VFTHLU/XsXj3/2cfa8jR1o4e43yGKi1v1?=
 =?us-ascii?Q?44Sl7hEszR/tLdVOmRr3CBX0tlsqJ7UeDHIBNuAG05kLvKZ4VV16Ox8P1IrQ?=
 =?us-ascii?Q?Gqj/+I1MEXKHndc3zLezhgCQz2EhxC8I83sCK+n3tLZFNzUuZMngzx1FUDj7?=
 =?us-ascii?Q?48ulx/ptPo4r1AV44jSoaRKCTAy22EZ9AxkSG4L5VkPsWrYjW+z351qmd2zM?=
 =?us-ascii?Q?YjY9dXOV14G/vhUtqnphkq9rlMkoWjxcuyVZRpxvrde+8uj+F3xd42iQhFUX?=
 =?us-ascii?Q?GxpuPVkbkgcymuUvAoyDS0zak1mJbWp0SvdNHLc8OwaSrdRngF7h849JSmjK?=
 =?us-ascii?Q?L6nYHChEaeXx4l21oEme/eaSWX+zkX9//v4GxKDqyL5apGNyLVt5ZMj6M5WM?=
 =?us-ascii?Q?01UaG5vV4mdx5G2PiosaGtPPMix+VMxm2t7OlILyzLUwzfNofget6DuaV0iL?=
 =?us-ascii?Q?6JDUy72xdy/ORi0kOaiVWq74v2b9hSeQ8/Vy1SrLwsX0JFfwlBRhYCO9r7au?=
 =?us-ascii?Q?8QwNDCpp7ciWdnAXjM4eCSQwy8vYIiPMq+tk4148rV5SktXrEOmFgmKLEsAU?=
 =?us-ascii?Q?JgQ52lKPQ+4/6GJQtXYsnTbNNxoft0dREk2J9o0rc75V6nTTJVdatiTRqV+a?=
 =?us-ascii?Q?Xgb5QOKPyHgTP18laPh3SXtWdZqDYbKy50S6C4E4qflP/33MHFM0QK1pYBoT?=
 =?us-ascii?Q?OiScP3hbLmvSuzTCbjNXC4YvA3k54743yflHVRkb2rmRHNiqvzNS2WUY8OcT?=
 =?us-ascii?Q?CiUeIZ3olQswg/BOuf9bdx/q4FBSH4ONhZx+cgQZDfQ/B2i/pkvGYl7LRKr8?=
 =?us-ascii?Q?aFNMGSsILLg9BUlv33pbYsLb+JUUD1DrW9K/K7fS9lXkSbnbVWdhc+0pC67M?=
 =?us-ascii?Q?UGLv7AX7+7jU6XyHnmyMkxx2g2F0/223iQT280KJpZ3wBxAo3O3IiwZp0ejO?=
 =?us-ascii?Q?uslITvJJdjbBKygRw8g3xr2kOaTjG2angEtDnxa/zCvsKW5lWX830E9zdvq5?=
 =?us-ascii?Q?128O4sIb/V3FTJpsiCEZG5VlN8aI+0iPzkPVmPMYgxJcdmXVNRB7jxKzI6Vl?=
 =?us-ascii?Q?2ydk4+9jU4zXHgrRV2pCnuCco34AVMdWXnWvG0aZYrW45M8key0On1hgaRPM?=
 =?us-ascii?Q?pmRZSQiMrvaEa+h70ArtNqDeZzGDgvb8CpjztXYcss9pj5eo12cscPieEe8o?=
 =?us-ascii?Q?sb2kVxn9wgiW4zEy/tlvWoakJMk2jPgWm229+zzCHCnm47lU0PCuEl1YgWKE?=
 =?us-ascii?Q?DZIp5EpdHRO4sKQx1MF3KfS4OQv/lI7URTelxnODlhLZ0uYwgkFv6fVOU8TE?=
 =?us-ascii?Q?xj9viT6L1wbACC4xHQ+cEpCu0VGAhSgjd1PCSrGkLg6bukPTp1kdHnnt2OBo?=
 =?us-ascii?Q?yTdglOtwin+LR/zc2MKDEm97APP7N3NDwvvKg/pD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0b1179-c74e-4fda-0e60-08ddb9c062ba
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:30:09.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AK9sqXm7HatmlSFot+hCis0cwEB5LeYWK4wEhkR7MEtLl2O+6O4EFD7zXTqeSHspC/GiWpv6N9UWq/sP3/Y50g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

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
index 2889cfecf835..b571d06c837c 100644
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
index 6bf097e39b4a..033f12ba7f2a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7026,7 +7026,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
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
index 35d7b328a9c7..1ac2fb398982 100644
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

