Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B525BEFB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791902; cv=fail; b=dGOmzueR22eblsf+CBoYfncoGXT40bYnCHcNiSLXH67EhBxdUA3kqoeRx/4vBQbWf391iy8Fpf9AXu5EnU+iWgCLDkBgfxsLPlStTH3KMyxQ0UftwHRcQq/XBTyn7VYSf+CpXS14bZvM7HQsKwMzXGWArmd3UqL6Ie29sBC77kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791902; c=relaxed/simple;
	bh=5FX59P+hGvhtviF5FyYCMB91LDG1SdZn1pGieiCxSu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBF+gkjBOU8iLzR04f2p9L5SLxA4ss3KN2qA5Hc7Yh0qvbZ61L3Mg5Jqd47isfA1zFva29kDTrefmnHnyh6iuxY4Inh8/0/1Yano9mxFo5xwXZGRV/GU47DzffY9WicOJZKta9oEuEO3Bo0G9RuzRD/npamBHN1uYKvQxbrTfu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=POHYk/C0; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="POHYk/C0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnICLM8pbIKkQsTun4r61c5AKZEVLBhZP+toVSo1Y4V00J04iW5URg8vDN9nQscb5PDpmj9MAAqZRDWMoNnDthiKR18WBjgXGm+z12fDz3lygvf3fd9id2UCEwYEN06urhHRZ/DqEjAtp3bh8/IVlLyZuikMd9EdFHZfWnEfQOvYDCRQgx9uOso9LKpemxatrt1Q+YqUZD4zM+uZDxBLfkFlMY6WE/3eZtKJi683z5V4RCcsnO+yXE7ncyHs2qO7ifZ5GdvYRccNbEwk2XGBCxzvPoc3V/SGhEa5/OizxgYlnUap+X2jgGTIn0Zk5GoZeHGlMBPa/Cm4/Wz3MW+G1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VblxxYelK6gtjDCRANGjDtmDB34FDt9Lv48gOEPXVjY=;
 b=EDOBPYPw4oPdJxgAQEsn9V0kBDdtv0C/RvjtN3B+GzbbalVUy0bKhKWEpwtMt4JNje8VPWbHI1gD+FGKSCE+4AuaYOngh+UYMNnI0Yd53vqZHl0bEkp69J1CFoA5ohHwuPIrR8KDIMV9IwjKIuRYBlkHX+IH0ZNJfgfSHdFoLWyqdinoWX8ugk9AWXojDfKvb+r/ABN8s191/V+xoXUPAf+IBf58m2iNftkqUyd9/3BvWBahJ2lI8RmDOl30RnMfcGykFsKTewRdld+88y7mKHHRINqhoJ+KWTQEYZXvkpPki4p7vdvjeI6cGd/aJqpcvX3X/CEQTH2XzYWRmBhqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VblxxYelK6gtjDCRANGjDtmDB34FDt9Lv48gOEPXVjY=;
 b=POHYk/C0ZMr+c5dSJ29brsFrkEVOM5VpuyHi+UAF/TxeJ7W8TMyhwQaqPefyZg30FTcOghJA2XmeooQxw7Jfz8/JXouhZWUH3iRhgz1Cfxwlhn3PS1GlDNRIy1aVskodRZpU4rI8RE1Sio8jAcmerX3vdNEiIYouvd4c2ykZYtEO5zkAClWp+aSRJOqMT8rRfwl+7ZhD2MSnnb7b2A66Auovl+o1abpGIeP1fv9/esI7vxLbTM4nONKmvMlO5OieNFQhAhb/dIjChIXQiU9FfYbfFXfK0mF7S35m2zJCN3zjd8sOEVVSL7T/bBhPxx7sIDnKTijBgG4UlzD2KJWogw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB9071.namprd12.prod.outlook.com (2603:10b6:8:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 05:18:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:18:14 +0000
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
Subject: [PATCH v3 09/10] sched/ext: Relinquish DL server reservations when not needed
Date: Fri, 13 Jun 2025 01:17:29 -0400
Message-ID: <20250613051734.4023260-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0029.namprd08.prod.outlook.com
 (2603:10b6:408:142::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf65943-7a98-4504-f2e2-08ddaa39b287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?04p0ho9eA9I21lAtTFCO12qaADPbrIoRY7BNW1vTh1bKeSNOBpBdMHpuS/Q8?=
 =?us-ascii?Q?XgkYeyDm/ecIZ58+3ok7X/XchOeiLdDUWTC8rm5I97tw/YQ1V6ssjenmgL4T?=
 =?us-ascii?Q?clo28KFBVoBpjLviQJFbHLQGvOUYrMrJ3zXzuSUWfLhg0/VEzBeya7c+ngCb?=
 =?us-ascii?Q?63NorY/eoaT6rLMDjq6zdAvBa27QuN9Ds8xHGBC965klmEZ8Ekwx1QbQfCqr?=
 =?us-ascii?Q?k7MTPq3cF7fS17nm9PM2+eSnIFjTl48AxpSzZZjHs0/pnufeAnrHGWMeMyZS?=
 =?us-ascii?Q?vJzuqFB2YRJ8PBiGr98JuA6+sl8yl99gorDzcXGgYXGA4+zfLXox4W6cE8ML?=
 =?us-ascii?Q?zaZIPqmcQwjo6VmHd3vsOfd3oo+jLVB2wnEWEgugJZaH1CXayMv2uuhbhRh4?=
 =?us-ascii?Q?2JUwYrONq0Zx5cmPg3Eh6Pog+j09b7helrAo3ZqEihdtYvQ5KsFK3NHmAcnN?=
 =?us-ascii?Q?bD6cqWJGnGtJ0SWbHsMuSUwvnczLbywyLwChCwZzepyVqoY142AVqAVx6mqc?=
 =?us-ascii?Q?O+aMQTxc2Z4TqMqKuUkY5h5GwUpSN7ut3fkzPyCQrkoyqSXqBb5w0lLO3Tms?=
 =?us-ascii?Q?cWBhKV8Ntc4r5AdD4iUodd01qN622EAjU5P0xGO5b0o6LDkEFO2F1yF0cSGd?=
 =?us-ascii?Q?w5mICVZTf/lBWrTBIt33dXjjH8T5IAf+mXfYtlfkirnFAIKIlFLvDqSY89pa?=
 =?us-ascii?Q?ZiGobzn8kx3mYo+zV+CdZ2CpMGsFvwNVpjJgjsmpakvf70YlLd6tKS3lRv5I?=
 =?us-ascii?Q?hzvRBL7PTuxum5cEuL3APLLb6D5EEdnr+x2V+2LJYewBT6JFtRUbcn+vcBeE?=
 =?us-ascii?Q?v394hEGkMPayyoRc0BBjWREKzwyPnZZ2XK+j7Hp2OuUhk1TGZlEQDrHAN/0I?=
 =?us-ascii?Q?MJpbBSxw5J9Ws34qW3TNZD9GS7SdyPN7aTAgf93tP6dH/dO48icVX2ZJoSgJ?=
 =?us-ascii?Q?2ZA9yU8pP4q8gycugpzbbIC2WaCaP2PCSi8A2YyOWSU6vOWjiTjDGK9z6slK?=
 =?us-ascii?Q?euCAlWjSzNSKuB8cUxFQN3BqNGI2Zr9VIlzM8NVZKQYCvvQPdHDJMEwgvfYS?=
 =?us-ascii?Q?MqmPHMbxLcxHwjdksCXq68OkmZMo9FBMH5R3ZiWYF3srvc0xK/EkrRkgdzds?=
 =?us-ascii?Q?SbvFMnDJO+/KPXGfC1krUeCEzjKBpkbbHp4+VAgKlIWvPaJTw+jCT2QUy+Qa?=
 =?us-ascii?Q?OafOWRJKOzumeNPBnTbnMNYlfEmimAOYWHwMJlts89n9D8jAe+EeTgshJ6L2?=
 =?us-ascii?Q?8XAN0UKtbdYW+ggecsrm17IaAH7qIcswS9liklpWIWHfN4oJ/hv3VcR3PfCk?=
 =?us-ascii?Q?qIOqRSFyyfGWUdD20ro8Vz2B1l/M3geUCDeEjVTScdGAeBy8+rV7s5JvdyVY?=
 =?us-ascii?Q?nZnPh+faBEzi/kHLZMO3ypqi5GFeKrW84l5eX+2YQeTlH4TAeJg4zDgdTBM0?=
 =?us-ascii?Q?cA1gYhKzAe5XpBXCJJxTKESjPQDMsQlByftW8hmVfUVI2DAOv2ZUSQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHIXe7AaUeaukfUUiOJ37slBOYSFR9xTFjXl9i6sjtADaN0p92J0SYT6xhZz?=
 =?us-ascii?Q?Bnyoc3pSTj+VQw1hLSYxRi3zxeux2OuxGsvmz8cO1pvMe1+4JLRLBcEVCWDk?=
 =?us-ascii?Q?Pvt/rNHA5mlXDgNLw4xooWBOYRdXtLPkrmQ+bQm+UJO0sb0iM2MNuFsTHxSL?=
 =?us-ascii?Q?bDx1Z8CLhqfwLylc/ArREIM4OPbWz1OM1NNAMdmtpLbV1FkTLFQmft6omxTG?=
 =?us-ascii?Q?H/Kv5md9AZvNh2F0Kh2raGkdiLqqzTliyHCwbpVIJZjbG6tOrXa2xX10/EkD?=
 =?us-ascii?Q?oR5mhqh6ecxUquV61YM3W8tE3yz2FqujrwMqWzwCKDhLTYWwGZsD7BS7lXed?=
 =?us-ascii?Q?R6B49o/GK/i/3KFIYMHhMVnTQq8+GCkATPUlm/efYb5GkaL07eiV68/RwkGh?=
 =?us-ascii?Q?ntf1c1JO5UDZcI78WtD6lUaP/CaL5zEhOiF/xaEgjxCPvpvnDuIaI10d9frR?=
 =?us-ascii?Q?wZQ/iQi2RW/4SshcRQZuq/W4JGdI9UDbbHpJ5sf9BCQex0R4r7V2ba8iB8fu?=
 =?us-ascii?Q?/Vjb/tTKo+ZPd7CzopaxOMOlojccanHpFbLXFeVuUBhc0iSExedCbDn+HR53?=
 =?us-ascii?Q?zkG47pP0p0cCHVvk0tgTFm+yXZMa+ZvDTIeZpGA9PA5QnMXRwy15xjvE3zRx?=
 =?us-ascii?Q?iJILXrF5Xe8lMD0P5nx56ita5Lxt84nUnl92XdKVSAqtyy/FKi3xU1I/XQE9?=
 =?us-ascii?Q?7NEhiP2QWR0Yl+I3zWM1K9Q5Z34+B8CmAKr5A8yglHU7nbEvhoJ+rEDSXc3D?=
 =?us-ascii?Q?6cvAKG9kexUxnkRlJuXts9K5rTgDslC/AEmtBCb/Wcd2zf95C3Fnji1veVUp?=
 =?us-ascii?Q?EFp7wwQKyYECpPosyIedw3eEvYvcsE6VW/wejodO0rLBKIVEpY+ZJ8GtnBW+?=
 =?us-ascii?Q?Alfx2ufpj/sCWNeCGUnxIkv5KxoBfUD6cT06kEZYOeK7MgUZRtUs+xbTUTQo?=
 =?us-ascii?Q?BaEYbSpT/bM7YJayNgmDAvcTxHpxWAnzPhIREAc4kEk0hSjMwG3rv52Eb1qx?=
 =?us-ascii?Q?5ffiSEnJkRuftHjacg8VoZpBSEei+wMY4akuRERwHWXHa9UHB5xMvAaMYugA?=
 =?us-ascii?Q?Jgpd/J0QhxBQoCL/uX4vov55PrS2tqTGNlVnPXIgl/mF01Acopog46LFOhik?=
 =?us-ascii?Q?hztcc1cvCzokYpMfAeDrE7eRS/YGIfJSVyXQnThtKELblpPdwtCRKmWHmwuj?=
 =?us-ascii?Q?U/kgjmM4vA2tKOlr4AwS2gKB8Jjxqvselt1ogITJKIp5XwPu8tlYeeAmWnwc?=
 =?us-ascii?Q?mN+GIMhQRKyA1+zRUWDPKOZiEG3fJ9ocZJwdYObbPmaslPU1jFKDldrtQjTV?=
 =?us-ascii?Q?Kbc9q7m2RezV5Ce6lpSFvdzlMZQyAoLUmMFV1asWdvfGeUbbmNuhstqzMqim?=
 =?us-ascii?Q?gGZ6MiD434xiU5WMlyk5ouceoiFhsOjtinhNE4sZNOfZQ4/ks/8YaBMvqIEy?=
 =?us-ascii?Q?cH+IwqP5hSUgXy6W+UljwYS7hGL19F9WOBCAU7MmjqD9mzEy0CSe5I6ns2rJ?=
 =?us-ascii?Q?hD0enlmYgqnLdE4bD5gvs/0QFXd9r6FccSkEYmdXVje/Cf9Hyk5yXIlHE/A8?=
 =?us-ascii?Q?et+WmeTcyKhMLezp/Ch7o9cW85F6CwV5XJ8/c/H3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf65943-7a98-4504-f2e2-08ddaa39b287
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:18:14.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toTfhQFxrimg0Ow4LdLJFuefMr17+zEAuk06KvzJUCFJXpV5wHjZfm0/nRnnuLJfPZ8lAiCY2esNFaY6aRUoow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9071

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
 kernel/sched/deadline.c | 11 ++---------
 kernel/sched/ext.c      | 44 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0e73274d8c31..924dbbfb4b40 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1786,18 +1786,11 @@ int dl_server_remove_params(struct sched_dl_entity *dl_se)
 	dl_b = dl_bw_of(cpu);
 	guard(raw_spinlock)(&dl_b->lock);
 	cpus = dl_bw_cpus(cpu);
-
+	if (dl_se->dl_non_contending)
+		sub_running_bw(dl_se, &rq->dl);
 	sub_rq_bw(dl_se, &rq->dl);
 	__dl_sub(dl_b, dl_se->dl_bw, cpus);
 
-	/*
-	 * If server was active and consuming bandwidth, remove it from
-	 * running bandwidth accounting. This should not happen because
-	 * we call this only after the last dl_server_stop().
-	 */
-	if (WARN_ON_ONCE(!dl_se->dl_non_contending))
-		sub_running_bw(dl_se, &rq->dl);
-
 	/*
 	 * Clear all server parameters. This will also clear ->dl_server so
 	 * the next dl_server_apply_params() will reconfigure the server.
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 52f98c3944ed..2e77d9971c22 100644
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
+		rq_lock_irqsave(rq, &rf);
+		if (dl_server_active(&rq->ext_server)) {
+			dl_server_stop(&rq->ext_server);
+		}
+		dl_server_remove_params(&rq->ext_server);
+		rq_unlock_irqrestore(rq, &rf);
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
2.34.1

