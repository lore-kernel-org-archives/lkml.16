Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7372EE985
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190787; cv=fail; b=LA2SuxyuLs+Nl46BaZKjnpoCSQ7XmjN+m5fKFG3PUFOoFZhfY/LljVkKAimystBR0fdcDqI3xcZLE25rg44JkBUr2tuVorYUDDHWtXg4PVNumNnVMBrNEl3m4gpagN516NA1OE0GZUm2j+q2k4HhWMew0zy9NejI5wFzKOJKhac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190787; c=relaxed/simple;
	bh=o7KBEJWgmdRM1L3DLcsrVTOWlRA5ELrSWVK4cmhWrys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KUQ3kecVnTIzhzq/Uf4SQDIdriwgQH3MjPX1+2rGDyWJmBYiML6VnklKGLMr+N+HHICh8oBF4CEO+1Wub/tI7/1s07cpj7vRape4oSEf2k3SENc/y7onxIa87koQv8nAu/EKcaasy58ay+dZoicDsC6scOxVuPICvioicDyxMew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b8nFmRXs; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b8nFmRXs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6MhwoNlClXc2ye+RcY47Nlyips2yF0zocY9mtyol4YblKnk8M7oEm2kKGEa0QhfiBY6+6Bj8HxuT/XXj+TZKNpkw0R7dpDRoG+W+Wdrnzz6gIzuJIcDJQVsmnv4ONmXDwYalkeIVrINwbdyHTWYwJUUH3yA0rmsSsEBwo55jdNj6uKtFFGwrkuqIEtelrq08dwAXEwRPKRVsobbdKYRmpSlj+l8YNKj/oL3m4B8RN0XPq2EqqIGN8BD1dI75HSKV6fU35JE7skTu1eKAaVEndbrWYpvUKu2xTo91h0qH922GOYaVmyx/86Ve/NvFUtxMlcNhYrl6KYQ7W0dzSCQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCEugULIeG32du8napmciqf42uSPo7UVw836G+sTAFc=;
 b=WdnSPX6Klk4fyFEdXUvMimsDSYtR+UEK9pau5mzsqAQGQK/99XYt/OfilXdu5UTcEPdVsFq80y1yJduWuI4G3AuB4viFZp+Uaewwmt/Q/S6kUvo/ZOu7eRr4k+z/IMYH/barNysQ3hpgoi/bsV//mV1d14RJbsC3kn/bo2Spsi7cJTsOHpFq+fFabNgdXNX5F7KSllyMNT3pOV6ojoMnR3DseZ0LoLkveV79cV8VcJsehv0dxeIrlAW/juBoWzfXA/yOl7yjCo7QKsttQY/05IP2KnySQqbD3bua8U2h1afLEaXqKAdu/aKlRfEVpJNSAURP0K7865ODIyJsxPYNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCEugULIeG32du8napmciqf42uSPo7UVw836G+sTAFc=;
 b=b8nFmRXs8Miq/Q7HPcpBD4GOcO92lN7mh0TauYjUuyvYQbRSlS7Gh8boV8ulzd0EmGUjK5uX3EdHRiKxChNcyQALgcztwLwnYRDA4fSRhP0s3ubJokTN9p8ic7m/BZAQ+NiyJYU7kynSmGEIrnhWibkQ8aFaAaagDEobV4zSVuirFUkcNRyiWiedAjt0/ht55PbBGtwc05nGyC40iRWa4dikFbVPaUfOunCYK2goXZQjvmqRviJisdfAA8UZvc0+0oHBB69HBOXnT3eVG3rDmGDsuz64XefdByfxoHKt4QBSL6w3uRwOwClUo4rMh7eRakNuyTfx/HuB0wfgatR6Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:18 +0000
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
Subject: [PATCH v4 07/15] sched: Add a server arg to dl_server_update_idle_time()
Date: Tue, 17 Jun 2025 16:05:10 -0400
Message-ID: <20250617200523.1261231-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:207:3d::42) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: dc58a6e3-eb7d-4365-7430-08ddadda6bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mgwyD9nOlx7dPwkV6Xw5KhvA+5sytaLdq7cs/XH+8AUOnh+jO/lPEY4oQORz?=
 =?us-ascii?Q?o1ODzntjUxbWp8BsuZeVkdR8OvL01Ita9s2EB32toA2S4JEnbaKuVNF44qRA?=
 =?us-ascii?Q?jlGTwlK3hqU/YdmQiKOUR7Rw36gFZq9IGHd6uysb8nex+YjTl/j6p2uNeSL0?=
 =?us-ascii?Q?LaKsiBbdZAjTLVpX1QmE4KIo0zq4XElogrsZW8cMy6MXVZu00dHihwFJ4awJ?=
 =?us-ascii?Q?SyyQqVnFWDdP13N/UrZI+UhIzQOSkAxLMsgxubPJTK6R7tjhA8S+bPukYkKV?=
 =?us-ascii?Q?FDBFoyrDBBi6qhQMLNJFQumCxOHJHte0DMLAmN6vgdGxcCIOLhHMCScppDkP?=
 =?us-ascii?Q?JpK8d2UbLAx1PmrDK9r5jaAXF7Sy+JDZu15Snji0+BDB8b1c/sdNwXPKmgVG?=
 =?us-ascii?Q?npwAnnwa0Yg8CVY+9UJ6FD1Oc6YY92rlkOF+/CktwXJ269hDERhmj0Fc/XgE?=
 =?us-ascii?Q?8FUFO/HhwFK4bkeV9yXMyLCqedw+D7c0qlRgPCZtu2MrRjuzw2K6YZ3s46zS?=
 =?us-ascii?Q?EwBwLM6RtLd2q3+BhWOBXJQF0+icBSh36KUOIKoZAulcsOQeXIE9NoyeHRze?=
 =?us-ascii?Q?YHndJcuA+GfCs2Stcndterrvh7/Dvmge295GTmaSY42wDe6MUj8sIxOpvsoc?=
 =?us-ascii?Q?Rn1D3VhEhS+a9A3wvBzlriwAOn699GZyYu2i4g45zvz/MYfGrgD+kGhEed5g?=
 =?us-ascii?Q?IU66Av880bSt3uwNrh+q4pYwzl6nagtECyyqwmFPy2EdBk+2TzZhHzUP7Lei?=
 =?us-ascii?Q?3qVFCaDv0ui/Fsz+O+M1fe68NRKyYTcgendmHs8JbJeD5BgYHBZdHfrJ3XUE?=
 =?us-ascii?Q?2ijHDWbBlbMMl29C8tmJ/zeoUpFxZXochqTx6fF2eJ+3nMSogyNw6SZG7Z5Y?=
 =?us-ascii?Q?dP8zhKS8JG4mB8UAhAIU0HxpOFmuGALQuCjuOhKpCL96EZArc7gvP4gx7ydh?=
 =?us-ascii?Q?rDf34JPpMwPA1dhjyX90t7ODVpURLHCve+kyY2WJfKjzlv2BfQQlbq1/7O3w?=
 =?us-ascii?Q?LdHPyKn8YBpeN/MYcEKdG/yOhPqnUH4o3u8V/FM24qgVcIn7Nmq8yoIp7/H+?=
 =?us-ascii?Q?uRuOzmKdsL36GFGwGHkxQFt1+beYa2NKWu+hhkC62NcYtU1vJ50b7v/Ez3q1?=
 =?us-ascii?Q?wxHN3wzR/QUmow3QgYHFBvAnIPZNqyBWE1Iy7CQ+oa4wpFFIhBnWtFqnRjLn?=
 =?us-ascii?Q?V6jOO/8DYe2Mh04CUW2HU/UAHmfoaTyGxfgm15O9z55QcyuiUHUmJBd8HEYR?=
 =?us-ascii?Q?DKAppW4KXwmMhabZ+mLf8D4ZiofQai2JPlPF8TdIe6wNnixTB1uahhxsZRyk?=
 =?us-ascii?Q?003wMU534pNEVV01qHI0wgQHU+AGx+sdePeiUI5QUct3UR4wVdvsSOTRpyJu?=
 =?us-ascii?Q?vkUFVKRK3OsosYy5NNDlfVnAvh+9/+N85tRbjROX6BF8u7fRXP77dh2GmXwf?=
 =?us-ascii?Q?lHkQYp0fwFywCRLAkEfysbx7tPopZvx5GRMkA6zoAHLCA7Pxinwyhg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XbQ4WzNFvKjwFYML2L/11I0erMc3YuOJ9Hn96rmIgQmuAVbl+rrG9pHeygXn?=
 =?us-ascii?Q?EjBbw0mBbo6Icp++4X/rxoUK3Nicc0MQKs9c4/JPhRIoB59O1CDKV2lY+cvN?=
 =?us-ascii?Q?myfsY4xNpwok0y8JW+0Sgay70f4A2AdEe6wXeZosfSC5030B2VmJUO9nx/iM?=
 =?us-ascii?Q?yORAZJJSo6zGUWBd5ZrLenGcUQThXB5JA4w2F9ua+Xor0H+HS9NRZgzSM7J1?=
 =?us-ascii?Q?bd+y+7tyN/arsIYBL1fNm1B+7+vcs5G9M9erCYz3DCrF77zrz5N1qXRasypr?=
 =?us-ascii?Q?hSIagOKuuR5lJ2+Bu40b7pScI4QjC12RPRvuPzFdmHn/q2Y3Hh2d05RClYKs?=
 =?us-ascii?Q?TbR1XZyH+Umbybtw+c1V4fZj7EjWKad82WubqzBvbQ1XVjGbWtF1vybkBut5?=
 =?us-ascii?Q?UCLQYTG2rGDjy83NBpFKCLieypRRyFiYkhx/cDfw8fd8yQ5qT3l4kEwYmmRy?=
 =?us-ascii?Q?phaPJBJXOVzDFpO0bHNSEThDzyLkyKw90GjW6GX0qd4GM/Dh9zxqwnSf4/R1?=
 =?us-ascii?Q?Q50pJ+CkUBN1BJYGBvbo+/8mYchvvPUj1SL6e1NNUNIf0/jtZcW7YfmIi6jv?=
 =?us-ascii?Q?VGLK8aDZuHRHgnI1ABzMerE2Z3DXCqs6fN4xYVgnJlax5nxI/42zmqPSjHRr?=
 =?us-ascii?Q?lOQZ2HH/0fACWPpdlUzUi3Z+LaImVwuagbBg5yaxAApP1ndQ4rT4Z4sGFVIW?=
 =?us-ascii?Q?ET+1wzcAVIAhikw7Ggv8VjiYuMCB889xcgP6K1oYeI866leTmjr5n3oC9XNj?=
 =?us-ascii?Q?u2ycKVJcYQ7IZ8PlDzaXhrlmCUjai9bl40MUqV9nO/gMsudUMOLFnCLlX6s7?=
 =?us-ascii?Q?A9rHPwGqP/sVsqm29NAWruveWuvsQb5g/weRQlqsklqRaQGowwBtiH+RDZkL?=
 =?us-ascii?Q?A0H0AcX2rMcFy0x6ZWmIXv6rlDINqieEBlmnB44gNNGMWqe50y0DKhlhYOU/?=
 =?us-ascii?Q?490Dz2CjBiDeFo6G2U8zlWPHktnl9McwSCXjHiRmCFYOIispqQaL+Htmwarh?=
 =?us-ascii?Q?75w+wC2ahOGP+LJJzIIbjMwCJmZOJNXJPeLLsy/DQ/ktreGCQIB8MAvorvlX?=
 =?us-ascii?Q?eprsz1taJRxsKewRs+XD9GQyE6B4E0t/R4+g1e59pvJEihgd1JIEYerd7mTh?=
 =?us-ascii?Q?qnQow7gsFCHDMVySV/+uBLyo5aEnev1bayPl+o1jz0LPW0DLkTdCNBd8aRl/?=
 =?us-ascii?Q?r4zysZfWhOhbF3aLUrdwc8DrmltXt/TAn+MBdSQymbLi5AEOHH8tSabg3pvr?=
 =?us-ascii?Q?Co2ehvcNR/kDGOa3qPak3lJpzQlb1myCENwBmZZ9H9EzMzadDFRi6yb0vKp9?=
 =?us-ascii?Q?wJYzlSRwiFEgEASwoCRjGb3ZFy69BpUsz7YuKeJp3O7iesYINHVNCHb8TNpK?=
 =?us-ascii?Q?OT5X5e4qNxrxHol8RKG+lUEqq/b9Ka60xv4ZGc7bjNR0cCAMoZnAyg0t8Ivd?=
 =?us-ascii?Q?b39MpzOk8usrm6RCcZ+rIWOI3n7U4OCnerG37POXpVzP0sBwPbjiNFRhO/4N?=
 =?us-ascii?Q?GTs9l9sQpJyiw04l5nGdn3YYwuiyuO+hw1EVi+tu8pMCGX1qXF7HoQCKw3t/?=
 =?us-ascii?Q?m5GV1q3vAOXSfm9SEGuEpZlRwyUqXrnARyQ3OvLQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc58a6e3-eb7d-4365-7430-08ddadda6bf4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:18.3124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFf52d55x5YtTPg6pbn4vLCLk683GIn6Iy6EYu0VNx6FUIikmIebpfw1THqTV1BDwijbO8X+Vnhm/c4QnthYiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

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
index ca2a31da8107..562e1e7196b1 100644
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
2.43.0

