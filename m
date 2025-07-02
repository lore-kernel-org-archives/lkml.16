Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B324FBFF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499002; cv=fail; b=EvOzVHYXv7tXQtxKlVHXgE0XJM4IjJcA6MuG1IKQ2ekDrUV5u3RabS4xiLj55flJ718cyIjKM6jyt+DA4kJdK1yvlK4dYQODopROhhJQvZJx+dohF9hKrGzwdvRbUhUFV5oclMvs2vWF7Z5ixpqtX0FZa2aGArLVkOT0+YJlKio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499002; c=relaxed/simple;
	bh=n8bViulrVc4VSU1lIlTfOtjvdQMq7lQIkcC+C8/aMLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=coDVRxTlJORyBRMF+uI6jMdWTRPJz4ep9zytghZQc7/zg5/oqZLRzO5ZCjvyjyEx5ldPwKR4AjPhnfisn7/PTg0/uyHyQGeY163CeqxSUf+prUxN+lidJKVuY/BhsTyWN+kK6Xk88dc1cFiAVo8wfbWAEsiyDp6RNcF6VUUdcsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pMjaEWiW; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pMjaEWiW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3JGsAR9CiYDa7jj3iQSnZYwibvNEf4NPdkAoCEcomER1mSi3zZTihW5xgKyqG+iIc30E0yn6GwhulXiwI/Q8ktI/ZkhA9CjiUp2CKmDYEHlumPuJRSzOQsqJJL9yhu4oC6JR9APSiLMqq5XwdJFYTXdSPTQUsA5pQ/wva4Xy404Yaon3gJ9SuxzZJIHCfsbthL1Y4fKqXMpzbFo8r/J/q85reNBuKHh0f0MxLbjq5NITNGl3ulp1RTo7Mhb0GDwwQ429RIsYYGKcomf+NcUI911GDRh6pSkFyoCvfxWl6QW12IgUSAEXs5RaMqLkSo9WorQtnt8sqRTfKHF7BrtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn4M+V7yIbiqIAKcPu82//HDUBJVrah+SJ6ATdMku6I=;
 b=bhzavCJm1doWfWNbd+PR6mhcQ2zhNdc06mmk6WN3sFfkfYifFms5lUbL2oQyHB20f6U48YSa/re5+Ljl9qmc440q6vSzAQdXHAqRVpMlga857fnUbMo/plp02YpOdU36pPytUQg5Z0SPzPh5TVE6T72jKxQ8IAvj7oXrMlAIodOGiLb66iv42WBpoqmZi2P78LbF5J2dgQe75AAuxL5IIHLUQL7HkPQR0JXxSarld2hrMNgboEnq1zvSSGyrgovlq0Ta4h4EZVg9D48GuskC/Op870X/iQ3/PNRWMHi2twH9aWBFCobPFTPjqEz+GnBpYiBg3x7wlVrmn4HikVIz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn4M+V7yIbiqIAKcPu82//HDUBJVrah+SJ6ATdMku6I=;
 b=pMjaEWiWromK0IUvMn1pYxtOdutk6p7hTGi7Aojg45K550uRl5O8jay3WV95fODnTzCbrdiDqHf1lMFk+qDbXT/0AZjQGsnUtMhDVv44UOjQmUQ+Ms+GK2PlWBa+bjCnSrCFYQT5u54+q2rO5hX12kU7fmYu9ITcBj2OhJ/3oEuTiQ4zOlEvnY+Zc7MCI+B/UoXxJ3yU5N/mY2tfMycu4PaFKUbcCSECJ+ev61qpy6hF4YTPmE1qf3gCPRZo8xdIxQjO8yG81e9EdP4s51QGq7gQ90piYSX93vVyFdJqyMOXx7o2obs1dfefuDuZWvoL1MPDMyQXp66T7kloi1Rexw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:29:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:29:57 +0000
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
Subject: [PATCH v6 01/14] sched/debug: Fix updating of ppos on server write ops
Date: Wed,  2 Jul 2025 19:29:26 -0400
Message-ID: <20250702232944.3221001-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: eab57509-2f64-4f5f-4bd3-08ddb9c05b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VOzm1Yw4mB0BuWSrwJmYvBDYoItDEGVMlz5CVzqjfQRSMYdith2zq424yebj?=
 =?us-ascii?Q?nTOYN5Wjq/AI40hDj62mJ/S0sl/Cgi3miQm3Zu3cY/gBjRr+L2Wc0seTzdSN?=
 =?us-ascii?Q?V/dvYWOSIUJZyGMXje3L7ro9E5aN575l3LswgGYe1sk3S9YpknvDfdjPsdqL?=
 =?us-ascii?Q?YP04jx9x7u63ti3t5b3bT8MXIWqc/bmkqC7oiz5Hsbu6OFY5E1T9ESJNV50m?=
 =?us-ascii?Q?RWCnV7BUtXDiKOHldvObJ8hHdaXkc7vw/a5ndApKu32ygmnv8r9bZ7FoLwWR?=
 =?us-ascii?Q?W3+9RXkcmRzVBDR7Y1anwMVeXMX5PWklMN07uC0ahE2qJ/5NsIvYJ62KhSz/?=
 =?us-ascii?Q?hjVo3MpcFEvcZ4iXsA/EIXMCA4+F/yU/HZumPd/sPzEoLeyasW0BeLIU8WHj?=
 =?us-ascii?Q?ZTicFWlnYJnx8p7deNwk6if1j4b4n6gw8mpr5cpt0kNfRP5WUCz0Rhz37/oy?=
 =?us-ascii?Q?hMZUMfAaFVl91Z9JXBvrJ+hZaXGWKMlq9UqlVTH4ry5zkpi2xjyQ9zo23LN1?=
 =?us-ascii?Q?d4rhNLAYs9kVIxmu7NwQbVS8zpStJaxlvp2Xj4rksOXH5Wv10qP51kxRh8M4?=
 =?us-ascii?Q?JjrjWD+YUjjPpQt+UilzplZSvjafsVnIU2isTJl+ziOGatbjA1vNB2QLlmNR?=
 =?us-ascii?Q?RJs0tBtUk6OMpZsa0/Nr9pvglVIC/uUy8zUQVnoK4uRqdHHbeua0Buvx6t7P?=
 =?us-ascii?Q?v9h7rQHFRw2KT6DIgPrdOD/v1lPYoBodpiKAnsT2vtmDsZXOMG5pG+sXyj5I?=
 =?us-ascii?Q?2t2pgbq52HNyE507eo6KEP7NQDHsrzisIePlfC2J50z3pz7G2vXg9lLvG9n8?=
 =?us-ascii?Q?vinpjGoizYtT6z1PTHTXpu/STDBpgCkifnphsHQZNwjajoQhXeFFT0P7cO2+?=
 =?us-ascii?Q?kNd95KP7HhiUDmypkjVrxhqBTMvJ9sIC1+VPDUDEisRZsvPiPpf4x/rzGs0z?=
 =?us-ascii?Q?q4RFA1POccGwnL6y6ipvZvVht20HJXVN0ouxNuBw7CYoWGTBg9Kdh0pMJkhz?=
 =?us-ascii?Q?yTBPgAkiAnWhAgZMEEBrufOzwxhI9hvYPGD4dA8kqMck3Y+NDhAOLnzqjlB4?=
 =?us-ascii?Q?2RfZYEuYbt7PsztVmnPYRIzuZMI4PlF2c7wiDnGVEXD44+vkJxtslrMCD9AB?=
 =?us-ascii?Q?7RiwEgl1Jp7RDcqogj93uBY3bLhGYO4Xmy1sw8ejW5eRq2SeCNI9qm25vuDX?=
 =?us-ascii?Q?ARGb8e0a2OCyQ+NMMQaYtORHsCiwWMXaBGPCE5xaH5qII/3ssOFoLDH0IU4x?=
 =?us-ascii?Q?hbzWzfZjBR3pI6WQw9R56nLo0FJ4WiVP6WUgnJYFlNTEwXvZTJdioaspR8ia?=
 =?us-ascii?Q?TulFl+LG9IZwJ/tBaJUryFZjDwXyWpdo+kTUOuEhWWNUOx0Ik5hYLu2Gy1Mc?=
 =?us-ascii?Q?XQL1L4Gulqwvdp64FFzkKnS0/sSNpIN6ZvlqnKWpFCShWRXPQx6NOkw+17Fo?=
 =?us-ascii?Q?klz0ut++L0QJo/CgZpzqnFqoFCUAGnSuG3G9vA/a+ibY0fVIkTUPzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fcqtRVW1Dhl+nUfoiHoG57+iARfNipkiFtcTzqB1RdIq3F+cO5B16/5der+i?=
 =?us-ascii?Q?YzK8dxv3fcZ+cbRZVXLlYl5WRX2pRhC4z325GsLkIlK9sEeGn+h5xJ8DZ8TT?=
 =?us-ascii?Q?2UI8bajnTDGz2KNeYA6nudY3eOokn+mRTjMQvmoYYhvJiCH7BsBQ5gUZSU0E?=
 =?us-ascii?Q?img5FklAtwprWIxug+ozLCSVcryHW6xIdte9/jlaPcEQRjTiyUcB0horyJ2w?=
 =?us-ascii?Q?nj659wXUITc0V0ipofVPFu/dvtb9VPSvZbRtHSJa/fyKzxZnly2qY2z3Nfjb?=
 =?us-ascii?Q?U4sO/bxY5Qn58zdVQNvMjqoRSkgdcaQl3YMzY7U+TleDvC05+XOuUQoJNQ4Z?=
 =?us-ascii?Q?/h6Kas0zQAduwKUY6MX8towXgal/0yPP/T2P/4NBpNWGvYgl8wWN/ZNSp9cS?=
 =?us-ascii?Q?NuwGHMCA/mhrDY6OPVmEwjFJ/wN+Fk0pcB96I9/OCGaZbHFyWCcycuz6kbKV?=
 =?us-ascii?Q?dWLBhhqUGL/u/HyPqIpe61naWLrU0FnSvpYcLfdaO5eSKcChTKU/oK1reNbx?=
 =?us-ascii?Q?Xy3Y5+KAAwdT3Fsj7bITnCvG7zwrsEMoADwEbqe39R8AoNHXTYuIrUxrw+s+?=
 =?us-ascii?Q?MyPH8l3d72hBU1WbNup89r7RyT8TkTH/YVSDEuCOc2GD8Pk9ak6GTBUxYc73?=
 =?us-ascii?Q?B+AhJHudLGKt7dqCWN3KGgbN7NWMuyLobi5k0WiO9FY6dYhqjY2wpvLUA9SK?=
 =?us-ascii?Q?che1Z/VsUUOqDn/e+L3O4pxuo6kZSQg+0/TdOR5tkJmtgBRY/hyEepqYQ12T?=
 =?us-ascii?Q?FlVHE9Gv8WrPWAOYLw6IoK3uz35S299MB1an71Jk7UyGGg1yMj2sRfeJv9UU?=
 =?us-ascii?Q?MzBWudwJWbLvV4Y5a6LuaGHqRozEx6XNTO1ny1yKUkdENpBOH6J6R0IHQHbn?=
 =?us-ascii?Q?iBV1juJgV/8HCUJTjf/FshX3CHxLu8v2xIR0kFLvmN7iID9/xEAhmOCT7iFY?=
 =?us-ascii?Q?ZrgX07paEpugbp6dmsxlrehoNnXaMmeURRp6aiMEyu7jG3o+DMLJ/ZeRzO+D?=
 =?us-ascii?Q?zc0VONm4n9KlkMI4N/olyxPe8uSgP7Vp2kwv7ZECVYJbvbRYsmL6RTuwd2KG?=
 =?us-ascii?Q?LU4gljEMZZdBqfSyUA3IlvVWYHn2l9aEemHiFUcPBtl1vtm0iFrjqNbVTWuF?=
 =?us-ascii?Q?qN3T2AxFmiyV+BNdQQ5TL4bUoG3iBzg0NSrVkhwUUUgIzyw2LsFaABiocX3O?=
 =?us-ascii?Q?C8XP16kkgCPbdobKAlbda/ZQO1RhU2TMYolMcaaPqMwbk9Tn5jHbJXtQPcT1?=
 =?us-ascii?Q?EZMlQwUkXFCqM6TDBrgW+5dKtsdFzx/M2MeKyg5nbJrFpLWa42v7ID346nOM?=
 =?us-ascii?Q?9FFIArWsYAuhpjXEoewL2fqSsMz4KJzf7QyOoR9JyK6DhDOrwLAXfCJODIhN?=
 =?us-ascii?Q?x+vP29uCCSw4EaVm5S+ZcrtMwkRAJHOREuOV5coqNp8EqXvN84bldpC+xo1X?=
 =?us-ascii?Q?ttiBcVHxLji2IKC0H30RBwt3wYUiY+bXl4Ey0m9C70gq9Wp9A5C5vUoHlvCK?=
 =?us-ascii?Q?g3OV64NceIfODNr2Yj2dKlrJ4NLWFrxwUE4BtWlpzM32lMXpCxSqzigQiJ+8?=
 =?us-ascii?Q?b51TQaBlmM3zCblTM6tmRjFON2CL60y6VCMM5H+nZSq0Bvjq1Pr1/nrABaus?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab57509-2f64-4f5f-4bd3-08ddb9c05b24
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:29:57.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bSlDn/ygEBWc90lB/joOwFoW39K17EWNmbSRv8HxqIzhu0FNsmS7JLoPqcCs4U+zmugv/mo18EzqtK2Qs5KQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

Updating "ppos" on error conditions does not make much sense. The pattern
is to return the error code directly without modifying the position, or
modify the position on success and return the number of bytes written.

Since on success, the return value of apply is 0, there is no point in
modifying ppos either. Fix it by removing all this and just returning
error code or number of bytes written on success.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Acked-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08075..9db3fcb4bc8b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -350,8 +350,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
 	u64 runtime, period;
+	int retval = 0;
 	size_t err;
-	int retval;
 	u64 value;
 
 	err = kstrtoull_from_user(ubuf, cnt, 10, &value);
@@ -387,8 +387,6 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
-		if (retval)
-			cnt = retval;
 
 		if (!runtime)
 			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
@@ -396,6 +394,9 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 
 		if (rq->cfs.h_nr_queued)
 			dl_server_start(&rq->fair_server);
+
+		if (retval < 0)
+			return retval;
 	}
 
 	*ppos += cnt;
-- 
2.34.1

