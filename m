Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670E5221FAF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451577; cv=fail; b=gbByOPJqC/cDwgtOzm0R0QPuEzoHgpYw125P4xD6BbvnPItCew13UFw3jWYxaMED4VdWUbMTDhLPyCNkRORBE9S8sr53NJA7Nnmcb5n4YPNxD9VEEgt1gRAp9JQf8VM3IJFUJ9l4Nhg3GqiKH59CwkBVlVPnsuBy6Kv3uEMeCok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451577; c=relaxed/simple;
	bh=QhxUDThs67x0k8qqo08vISFBwIeTJOcica1WhY2mVMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h0CUHiy9B0YHTHAZ0U2FWiUYE9s7QC1Ld1IOBVDF/eMJZ12FRdGYOFHmVD8pK0LT+uyrPiTW6Tvc354FSFWU/drkXoqHe1DPjdS3klh65WrXENnFvgGNNhDtvN/Cno055Zvv+W+agv0NB8sJDcETsqqFesdUSDaZUSYOZf30I4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o1erGrr7; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o1erGrr7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAiGrjw6xFnYIZRqiZ9IuFDuafKrJOA1uDn9P8BInAA+E36t3cDSiL7Vmr9rU47x7s3cCJ+cGnEaE3Va5xYeGtmHOSGC+dlZ9TL9PGtD1hL3qiClqy7GoIEmCTfsEwW8/ioRyx0h+N8dJ/n93mUe9HyzX5JBSf7vfZBYS6Qwf/5WEL88xwBlbw4gELw8iIwZbtj8rzNKHdI7eTnVki3r4l6NmUJMywSs5YbIuEXqTLtQDfd7hTpPf9vbdOAmU8rUh/PI0f0Gh/nn9L1Vi80iBgBsj+Cd2Rq6k1wGzJSg/5Ttl36wcRe8PvPt3qbTvbneF4fYs0qkmClfgh7xeu9fFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugt2KV14dwIST7JdQy7v5q9Q2dpKYvMlxlYi34outxY=;
 b=xGEzoEyXquR+fZ6x2G1ZnMiV0wO3g6fzxS89fGF2v2KD7s55fPsMpRTyZTbyuJkVlx9v6HvuKRmUYqCN/PZT3I69oakOTVxzlkmigog2FNcYT+la5XmxrbkueaCgyjy+sKFRdCO/KVBWusVxVksMS3XVoNHR4H6ny7L8NI8Rup+tE4082ZjR0PisCAUZzwpXizGEzBY4bkHpeDmlSst8IRvv4/xzX6PjspS+lhVyg02muDq6Quqn/VcQQMaQWfH7uQQSU1Tpb3/RTZXaYikMcWEt5zN2MH9HTxcr07jjX1XnVU5ZevE7LKMcGN3QdmtLsgbk3gzMSZ2RSGQd2kyIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugt2KV14dwIST7JdQy7v5q9Q2dpKYvMlxlYi34outxY=;
 b=o1erGrr7vsZpuIC+81Y14TfYcXWY5HT/dFiHtCIqD0NwmF+qd4fCsQ8bxYEb5NSXvbn87FGBEGxP/qnOwYD544nQt9Tn1taUKcJM1zSeAZIP/pM/m/R2mpFi/3zQxysvYMsioInnGIseLyT0oht+OnrjIfsnx4Fs3OLOqK/wG5mpjmd2JgFCz9gUxOAdFyTHRlHBdEHEP895FMgV64+1ueaddabQBNpjdDIsDMiZz3rPhSAo+o0bzrkYAc8KxO7uJ0AEctGFhGdhpc4JOIgbTPfftWGqR8DmBmXZigEqPilDUM9A8daUGt9tm/LmkfrlkIne3teZe4IM4JMIX1+5Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:32:50 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:32:50 +0000
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
Subject: [PATCH v5 04/14] sched/deadline: Prevent setting server as started if params couldn't be applied
Date: Fri, 20 Jun 2025 16:32:19 -0400
Message-ID: <20250620203234.3349930-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:408:fd::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 71eea08a-8e96-4e56-12a3-08ddb0399fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LW8N+3gPph16YP8m7dw2L43BKPzEa8TeAVVWoc7eUM+wOQq1EbRg+HLrWW2e?=
 =?us-ascii?Q?m+dmfutR9p7FKvZ7DLESbAP4vrb9/tbyw/y+BTJO7mwcWucm/4d9VlYV5Wx/?=
 =?us-ascii?Q?i+C/kbcjr8eb2LXxLuYjdDhZhuaTbL9yuYnnt1DQAmc8j2JIB4RpzbjAF1z0?=
 =?us-ascii?Q?38uSp+6wOQG2KCTIqK9mAnzpo8lMB3KPg8JV9zu9oI1JmBxy2ObTAvFMEj1c?=
 =?us-ascii?Q?pkLwIV33CX1HHTQVpezYEH79XKfZdVjFmcM3OiHczomYU8s4O5czfdDPKwkp?=
 =?us-ascii?Q?L3elAj0HzOK5/9MmPqaXfp1Jay8EV9MhH8pMZNfr2cczSbTYPIEHYW4i8Bdh?=
 =?us-ascii?Q?6MY0v8vz7n6tSpPMfpBXHZPhyDecibB65pOqDP9EPALk/VB2gAM8T3FIutNh?=
 =?us-ascii?Q?83UOt1Ird1E9JyJ6wN4++uR0X3fZaADIlIXc+uwNIlwOssz4bRjrGMSXLT/U?=
 =?us-ascii?Q?YklI6qG/Zk73HmtlGWLu+TdoG4JLyOZPQf7k+waitlcuIHV1g2HjZzXFclGa?=
 =?us-ascii?Q?aKkDf8HPCzL1Cy8mED0+3c++up/MHPcpLobSTU9p1/18WG+XYmL7lmvZP+2i?=
 =?us-ascii?Q?3ueE4t26805Y0PML+7tiZ1PnbmLwNl1tcRTaUFdXSCLJqHFyRLnfhDWFJl2A?=
 =?us-ascii?Q?27AZpemtMxndvGOn0DrGWqWM3ASZhB8RdXLIdlvfgIq7cp6TW/XRUXDACJn3?=
 =?us-ascii?Q?smj/5DmDFK3FQrUZup6jRNb9f3im1FIaori4gRiJgn/XdfrUW3Zmh7i+yQ86?=
 =?us-ascii?Q?Hyfr88zzCtpP/NB6f8JriSIwMshnYOu7l/Uro47I/6Rqy1vu4qCoy5Yyamj1?=
 =?us-ascii?Q?j5Ie214BLyGM4rf1wSdqD1kmMCwyEFTpABc0sybb5KO6uPE9TB4jm47QP3G/?=
 =?us-ascii?Q?kO59IKXELAnPHLJVs4Up7GRxYX/0JN8gGojJ4Lrt9jkNE+3UHkHEir0y8Qyc?=
 =?us-ascii?Q?4VXOmgfatzaeld40bRS/RRdKrs9/bE8ijYV8vS4BjMc+yyANc3pRczhMkIOo?=
 =?us-ascii?Q?lLmE9pC17Sd+dmS9xafsXU8nWn8nQ0o0/KlMNdB7qFnWLf5RgjsI/qs+poQD?=
 =?us-ascii?Q?D/YWwkk42reTcz+sNXo8pW/zNav0swzG3+2TpPs2UWNiG/Vjftgtmk836uFf?=
 =?us-ascii?Q?WU9Mt62vUpdfzsVSNgsHFJaHy29OfjUbqZTKcyhJnqD1mOj3V0+Bs4E/M/j5?=
 =?us-ascii?Q?JzAaq2I5GVQvTGilc82UVxSjAR3USxXRdUSO4J7HbTX92mhMww77sakffpq0?=
 =?us-ascii?Q?sacCEKRbOrzNmJt4pQc7zS27UD438HQZFbDfTLVJggY7lbO1xCBG1IU8vP8G?=
 =?us-ascii?Q?KZpuTXFNTGP2zNjOihssQF2LvCxxk/Dqm9gshiUPFMgZKzGAvEcmi6InCyOU?=
 =?us-ascii?Q?Lg9E3eObnSiNNhKT+5cZQ7fC0rihXFi2vpzeg40Wm+muqNi5cbQeoTnxkcAk?=
 =?us-ascii?Q?sBw7JMJHTE56NJe1vi/WqpSx//AI8Jla1YnBpAw+EPzYU3APVKIFLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2TcWh4WywmBmP7oU0n0PeHYTCngWnhe5RNxDI/q5DCVDxacuvg1VF7p//tOS?=
 =?us-ascii?Q?DcXHnC/fXn43Qq1+YLcKxNbwgS727VMvbcHEOsckYIhpRx0aDwTYlTsR6TW0?=
 =?us-ascii?Q?drVurCqXgCT8DYgUE2h8+qDWSs87ZME+MoJuIzSzR7jh2JrSM7+iMjxw1OmO?=
 =?us-ascii?Q?ynD8oeZP7PUSKdEEByY2/j3c33MZWlUOAnhI/Jtgp49Cb3iJ24BmX7iAOAYM?=
 =?us-ascii?Q?O2zOzA7v9Ojt7KvIdRrCv2+LyOHoPfrQK3cgLOvwFW1r9oMJ5ev7nscYT2be?=
 =?us-ascii?Q?bhkZdhqgVACZ/BapKyxFMlteyAlJHTuMILrpRYLtoYk5uITbtHw1VraISkEv?=
 =?us-ascii?Q?WyBzUQkUEqb/yJjO+X++wYJlWUYTjf0Ahe0pLFhUhX/SYZnZdaL9/2Ui4dFB?=
 =?us-ascii?Q?hPoGoZesozQBFfh5iFM401xT7f8JuqRhWtO7Zkz5Kwb/8hVJ7Vu9EV4S8Xn3?=
 =?us-ascii?Q?0mV/3AIIMlBedTmevCD4z+Jj9aKkx2BnuCuc4imTcBY0fsGdj2MOk6FFjcfY?=
 =?us-ascii?Q?v71vEtPM347GCk3BDMQhm5T50cfXRiJp+jEJI6CBj02F7rWlK4QfNDf4IFuR?=
 =?us-ascii?Q?YsF1V9T2mwHxLWXR4cTmPsyDdao8M/FYNV4hL8NGqhDSQoUTp8buOgTXAppU?=
 =?us-ascii?Q?SMYQ5iR9i8sbJ/sDo6zt96vd2jY3Wl6dN99cu27DjFZycB8rvS5NjA8dNKUG?=
 =?us-ascii?Q?+Ma+OIsO9cULp8/YcbacpUDk2tCnBVNbW5D7HoO2LJBoWJv3Pa89dT9iLUyR?=
 =?us-ascii?Q?oOlo64PmvKDBzTRWWPRK+PKUnI9SfBplHwiJU1SeMQHIZQwbg+6zZQQLWfCa?=
 =?us-ascii?Q?EEsEhOkQAYYMjySPw/r5vwBulIeORdnTRcv8KrtS1dhtQnmfsg8+m7F/HdPP?=
 =?us-ascii?Q?IoplQtT4JL70chADcEjMLg0yamgzW3H2tV/yrVetxHDSPMGa3VkpFHX1dVyG?=
 =?us-ascii?Q?ILc6elXEQJ4tIGimvUokosogC/I2kDKullaRMGG+lH+IpAX4wa1WAf+bkDfC?=
 =?us-ascii?Q?Qa0rZwBA0RhCprPXvUcRLYb9EbZTnUT0zsOkX+5J6ebqirBHri+zEx8LpE1n?=
 =?us-ascii?Q?MPvHEVmq1/FpEg25aHpLP6MyxSEegXenyIMv/MIH2mWGlW0SXAGewNhBsXaO?=
 =?us-ascii?Q?v9J39/gJvEHOXclCSjX9uotXk5rpCtYyUdTRNNK/pQV+KMNvQlAoJZf3S35t?=
 =?us-ascii?Q?au8lcG4N9rDgVMDGZlCkQXf0KNhABUdKNd9eTzhUgqk6gk89X3YVK7KoQjnh?=
 =?us-ascii?Q?Qk5hTALgOPhEkIpw1WPmD/K5vwpByJJlc/jR6swYmouXLFW1Thxyk6jGEDPj?=
 =?us-ascii?Q?6jZOmp5q21NqONPOEOxTAgEdUX2SEvzky8kNFTTBVtLInGJK4MjFGbXSTFkB?=
 =?us-ascii?Q?fTo8NtC8ELBars65JXN6W/2unJKi3D29+CMWUfWyyfAXM8tbSgIvqux9lN2A?=
 =?us-ascii?Q?J7EZpKwRj1d/O1JUToc8Pi9+g6OKls7bGJd3PQHf8epC8FzTaTRBXu249grG?=
 =?us-ascii?Q?robNV9cFw8/ynP8lhYgkfjI5/zNaPNMxec6sNqksXqct8H7sfRnmlAlH47QC?=
 =?us-ascii?Q?2S7a6dxEEVQOYtVeoHlw+EgUoN4jPY7Rlaf69GR/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71eea08a-8e96-4e56-12a3-08ddb0399fe4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:32:49.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLoCzO15hR53KozSqxyjuFFmc8heT+Iy1e1rfuJ8jPipVkc8sa/AjMppdJfOA5BweGM4Px79/6rvgmYj1QuwUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

The following call trace fails to set dl_server_apply_params() as
dl_bw_cpus() is 0 during CPU onlining.

[   11.878356] ------------[ cut here ]------------
[   11.882592]  <TASK>
[   11.882685]  enqueue_task_scx+0x190/0x280
[   11.882802]  ttwu_do_activate+0xaa/0x2a0
[   11.882925]  try_to_wake_up+0x371/0x600
[   11.883047]  cpuhp_bringup_ap+0xd6/0x170
[   11.883172]  cpuhp_invoke_callback+0x142/0x540
[   11.883327]  _cpu_up+0x15b/0x270
[   11.883450]  cpu_up+0x52/0xb0
[   11.883576]  cpu_subsys_online+0x32/0x120
[   11.883704]  online_store+0x98/0x130
[   11.883824]  kernfs_fop_write_iter+0xeb/0x170
[   11.883972]  vfs_write+0x2c7/0x430
[   11.884091]  ksys_write+0x70/0xe0
[   11.884209]  do_syscall_64+0xd6/0x250
[   11.884327]  ? clear_bhb_loop+0x40/0x90
[   11.884443]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

It is too early to start the server. Simply defer the starting of the
server to the next enqueue if dl_server_apply_params() returns an error.
In any case, we should not pretend like the server started and it does
seem to mess up with the sched_ext CPU hotplug test.

With this, the sched_ext hotplug test reliably passes.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ae15ec6294cf..d2eb31b45ba9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1656,8 +1656,8 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 		u64 runtime =  50 * NSEC_PER_MSEC;
 		u64 period = 1000 * NSEC_PER_MSEC;
 
-		dl_server_apply_params(dl_se, runtime, period, 1);
-
+		if (dl_server_apply_params(dl_se, runtime, period, 1))
+			return;
 		dl_se->dl_server = 1;
 		dl_se->dl_defer = 1;
 		setup_new_dl_entity(dl_se);
@@ -1674,7 +1674,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
 {
-	if (!dl_se->dl_runtime)
+	if (!dl_se->dl_runtime || !dl_se->dl_server_active)
 		return;
 
 	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
-- 
2.43.0

