Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76F2F0C4A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190791; cv=fail; b=OV7xaWsj+BEL6/krdZOc+AOSaEKAFCf/98OJbdcDLlBt2q3gV6zEVpHPTDU++n0JwJpdE9tlNnh/U2KPeIBsZCR4pgpb1Rm7NoD5PVscclLR4/YehpcygxmlfoJxuga/WtnQavZ3DnrfpGWv+5ol3o6HCsPyfFlCv7JUctjrYhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190791; c=relaxed/simple;
	bh=+k2Pnt+O7aOj3jS8Or4DNkzQ1DJgXI+BBsjYu2Gun+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lzfKkXGubm17b+Zy1awoPg+NCQK30UjW78VDPtxZWmZNo7nEKI5EGshLBv2eDmQeV3YlXvkb5k2ph0MseMu5N/DDqE7MREUeJU4OJH4BPIeHRdfq6N3D099FUbxoCdGB6G/oF+Nz5UdpT0rjh17kQlRFH7K557fgH8gCjMp7/Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AZ0wAowx; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AZ0wAowx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+1IE7KDFLbqWMOeoUiduQWgnKY7TB5XUkRF384ob2ioSj5uOA3kJ79lvxw4x3IkQgwn3tFZvkd+8SE2GZvDeAPekBTVLWVeIn9MRkm8ROfBg8IN6gjPzQiSwmyTe3E1JQK2r7G2TKtpV/2kzbPY/DsXNqc+zwLp6hoXnR/jKimhWr/aXum/zl3Heih2ovHn3DF3ag5j60l8NKIEYjUmz0XztfNWPmdDLux31+M2c6jSFT9RCjsOQ9YcRcKxm5ZEoC/SFaWtu+atq9gLkiHuejAg6mPz8fxCjvn3EzyhK2CNnIDkHlGhh1bD9Sny5UZeSXHJqRx+HjTqBJf3Z6rBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WLOZPoZKubTDOTu/uZ4nu9smSkUh91N4GeYPh1xles=;
 b=mnjK7hUDh5gx+ffLwicjf/1aJmN/1dVxeyOxp142sRRt4yEViVIn/jZcqXPCAzwBJghCpGXIR4woumCwWemoI5tATrAL7+Mwg0KDSicOD7KjHWhMpA0qTm1D+U3XSfBp/CipVsBZCT6S22N2a4/jPIgcg4w28OKyDvtwisWcPkHmYVZu88dmi1gmv2bFKTCv5rg75S4vY1RaDWp3rNJpoY7kxF3ci2uV+IwKfHIuq9YAX+1aR4zPdzLqUs9POukaf7Pz2AqTaq65IcJ2LzSjmzt9OqlZPqpLGvpByF4TycOUAGGFv8x2ipFjqZbPSVLiEgArWO5TiRZqFKrE6ha0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WLOZPoZKubTDOTu/uZ4nu9smSkUh91N4GeYPh1xles=;
 b=AZ0wAowxC1kZsnYIhW6PlYEk61awkxhLeBnbDkzQmlpbY95YsBxlZEB3E4muzRA3qn5VXT9vliaKKfdCYHyb5uEwB3CCntlTLWAYMaS6F2e9MS28oIpn83fdlDSLEepfD5eViWtKMEh3q4n6WOx7tIsC+ZScwEjbv/yTbIPyQOovw18BQ86PQUyJG7dkclsFWotQ3+ptkVZU4VTm1riCP1TSOP12nK1viL7sFBjZEEFHfk0TJXjqMHj8bv6ayFBfQQS1EyYOYV/20OaqxhG0SxnpBz3PDkHwSVO1SsaSFQB2PbRVF+e+8xddc3tBXk/RggEz24sS4fcDSJUbVT8IiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:22 +0000
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
Subject: [PATCH v4 09/15] sched/debug: Add support to change sched_ext server params
Date: Tue, 17 Jun 2025 16:05:12 -0400
Message-ID: <20250617200523.1261231-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:207:3c::43) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0d1ce8-caad-4699-a7ea-08ddadda6e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yHf0twggEPHLDL1+u2smIhKHXCVfMOwGyiNCiQcThAfz655gIHXtDoe0Oz0u?=
 =?us-ascii?Q?nsQk5wkidK2hlKoUSFQyr2IeCknq+OEqMRbs8PA4Huj+wYbmEcq4geDNZnSl?=
 =?us-ascii?Q?vI9eqJLhh9MGz4XUfNrN7jrOtQ2FP5KjChsU98B0Gbt93LtW90Ro0lTnL00u?=
 =?us-ascii?Q?tCkwkT/n3q4TUxBmhdJ78WA1Kx9aTdGedVJyYrnQhSgA21iy9SM8OJUtTsUR?=
 =?us-ascii?Q?8WybQMC05hvrY0+uPd6IXHRHfn8QrV7oUgs2DRAUw1wGUaZhtyHTp8196T21?=
 =?us-ascii?Q?XZ3SR69cdXr/V1yU2hHlcyN7r+0daRSTbRJMlYw1EhV0p4vf5tUYBvD3vIRy?=
 =?us-ascii?Q?ZkXorSi1tAdKQgLjNXAQcQNBu/2AGRW6JSAxXtBnO8XQpZB9JYs/OO0Vw4NL?=
 =?us-ascii?Q?yEwc4goYlnu7ZYYGPOxkasGNQXhoqRqE4YNO36JAh32s5Yk9e5ObYnBsD46S?=
 =?us-ascii?Q?esQ7wKwiLduQMMkJCw7dRzZfL8AsuMT8gYEFrQzsopZ0dhNtsrjEaIhRt6KO?=
 =?us-ascii?Q?7GAmZCDW88qvgxNXR2lWYh2pSK4JR5T8JolGeNdDdf5YlS8HUVZU9LPjP9I0?=
 =?us-ascii?Q?aari8GsiRLcTh4RL6yvLJNg7zDC6C/+k6JV5z93R3HjndqBlMmqKkA3Umgba?=
 =?us-ascii?Q?hOgbFblYW1ULso5GmlqjuNAQF2eLQmLBL/V3R5qT/iWaxHWVSQl5melD3sdb?=
 =?us-ascii?Q?jwdayPrEKAHCOgEuOunV7WXfySBvWyuGLbhlQoaDHKcut3nBTMT46RPBcqtU?=
 =?us-ascii?Q?kzlSGlZu1m7bBfFQupdYdz10kJ9mkoEmU7xeWMMoqeiVrqkq4JKJ+RM/aJGh?=
 =?us-ascii?Q?lkEK6VHwT8cKX2mijsErU7Qu1s78UNWb3VoMFzjvn/pUhouomi2R4JWoY1C0?=
 =?us-ascii?Q?db/t/cR2oyMPne+EgIN1wY3WOvzQN5SAoI05nsUs1Ulo4q9Eay39jJhEvKls?=
 =?us-ascii?Q?+Ddwthq1HS2gwrUBovSL1WZ/zHVmVgnosHtwU3dPU4M7oJFVklFKkBhx1m99?=
 =?us-ascii?Q?bOc/wlLDqtz30P5wSMbNZuWcCA9M2RNc2ZR0CIv2wj4fMiGFT8B0MBMj8s7g?=
 =?us-ascii?Q?gPvaWqKICznB4u80R6CpDJwr2jNXE42yZd97cq0l+LK9mJfisVz4LxkDKZGK?=
 =?us-ascii?Q?gMtkzkE0rIphszK3644yarumdF+i1r3PvyvKV7VLNmzL+XoMGov9jhTeJg+x?=
 =?us-ascii?Q?tHy4nRKz0ZW00jE+OZtiO8TNIYR6y89zmuagwSFTcd22TR4L0WLyDeD+8ZaH?=
 =?us-ascii?Q?B0ncDBXFsqtQYLPSyPVr3F+n14NJr9Oiu/TbnYIaCwnVMeuNWl9BpG3mNAZ2?=
 =?us-ascii?Q?L8TurJB7BUv5lbkpkhkY2y9mI2wr/Fayl43CT0OPswPbrms3bBiVOptJd1VW?=
 =?us-ascii?Q?I0p6j3HQD5zNcI8IPlF4y0VgOgAIU3qED8y6JBIEcn9Vw7+tOKICwDxSEIvg?=
 =?us-ascii?Q?5njnhVigFLJIQrGI/zlPKOcVrrJ9VioUW+gy2njgh6i0xGI3CF54tA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SSzzAh3kp9+ZG7VAPh5yQf5skFSsAoP/e3AbcaBmP934clZKcsmq2FKWBgxe?=
 =?us-ascii?Q?5xL10zpWXHSTUgP2DgYy7OxowOq9mH59TPqemxGswCIe6WQx3yZP08h5GWSu?=
 =?us-ascii?Q?U78V4CLy560IOUiBWGwt8l9U/2lMm4qCh+yhx7fwD95RUliC7EimFN+VAnGC?=
 =?us-ascii?Q?ZGYTlDnBIY7PdJET/2bJHIwRlmc1J9ZQwxrpCvtna0hixViJJ5h9KjT27RE7?=
 =?us-ascii?Q?kuxk1qIIU40nu1Ygz9GRT6v/0b3Glvv630w/CqbOya2hkfuaqwEj5zXehB+N?=
 =?us-ascii?Q?eI+NvLrqF6ZRJPsTlAv5Y/7krsrlD3rK9kc2GG8Yz3N0MpuZy0CYIxlTO4nJ?=
 =?us-ascii?Q?FxV4F5MZVsgfUfi3Q5rkgG8sBNUDrhnFihV8NmQFKn2BGKGmi168ZXj4RhM1?=
 =?us-ascii?Q?fB3CM2mM4vV3QD8l/pm0Z6xsnAnvS8eVNfuJPOuehCdKIPrikgGcEnYCQkX0?=
 =?us-ascii?Q?MX27jTzDzxId5XUIB5KCTBh189Wg6J4oclOu44/G+jJgMpn8/L/UYU2FIO3x?=
 =?us-ascii?Q?Hmg9Y9OtHeYKgUVQ/xALoTJCtvK2ER5BywGwtxEWjzL2xNvKqMrrcAGxbSWc?=
 =?us-ascii?Q?QBlgd4lJGbidgfT5px6ypXm9kfehkRFdroLUMhpKNEgjC3JE481eO2IP413O?=
 =?us-ascii?Q?2ihM7IHEhwJGNrJuphcKJSd3U62crAUkFb7+KabTvf5yu8rC26iNb0RXTx8D?=
 =?us-ascii?Q?kvBU3P7aTYuR7bvPDE6BfcGkUEzHlTcCW0tmmi14Axj3+g9hAQfWy4Vt9yGv?=
 =?us-ascii?Q?SQymuwDoRzGKEG8zGSj2U7+NFznnu/O44iNp+yIXEZYYz6Hv8m1bt9PBJs+/?=
 =?us-ascii?Q?BqZNYTIGM/uQvWz037GGNz9o5FAAWGLn7GDD/CkLhF0qLtzvuhaUD9h7U7Ar?=
 =?us-ascii?Q?Qz8GnNX2JWp9GOCU2AQUwGYEy4VUvc/AiL1oVmQq9qW5e86Mu+lsRaWIX0WM?=
 =?us-ascii?Q?JOLRj57+yyEg1HljLiy9l1n45WG6SX7C5D1F+khgEzb1qR9svBnMTMqNI6N6?=
 =?us-ascii?Q?BaxgHSmRzsKmQFZL2CMMoUxna5Yd4hZ5PrqvjjkFJnQduSFh5gbp1y3JEYvS?=
 =?us-ascii?Q?M5xECs6Xo4ucyFdwMIHLJRMeEZgNf3Cs3juksJB94O9J36S1vcUzkyrvCkVy?=
 =?us-ascii?Q?F8zseHWgUkklyoGF0loalHT/HFmElwYH4jdYW04lRaYQPOIUdurENsrpKhul?=
 =?us-ascii?Q?pGijEo7zF9O8d8DosI2vv9/SoxUvbRaJtXa3FWi0z5RVRA7luMxYxpq+fztk?=
 =?us-ascii?Q?91NFjCcWBnnO4di4FBfaJxVCE2nB9rGIrRrm6cZ5DPGEhTH9LHit3FVqSBN9?=
 =?us-ascii?Q?yjUQhvhbkKThiMs5i8+QlJbU79O/x7cxVLrbuCeILG+258V69eOV4Qdnh2S0?=
 =?us-ascii?Q?GDZqTHg/ZR3J5cy7203nzL0SjOJmW/V8VzKvPQx8sw3eCNbR61QVqrpzTSXO?=
 =?us-ascii?Q?P9ZysyIhk3O3DxkpquU7qxdZCvNtzq5d4Ybi+woxEXrFaas65y271lNwNGW1?=
 =?us-ascii?Q?R/kbCvIxz3D4QJ7b6+GHva3KAxDbfrUFgzQclivtqTNnpE2WlBUuY8p/tUsU?=
 =?us-ascii?Q?CzQJUQNo9GYkT1wp2yzr5Bp1Q3buYBmHieifnvDB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0d1ce8-caad-4699-a7ea-08ddadda6e69
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:22.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7isjJxQmfJQDQNcoxtE8s70k/VbIeS4BWnZMbaGthyAivpjyHNOOBnqcQpHwYV6p8Eo8xAg0SJa+gJO4++oSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

When a sched_ext server is loaded, tasks in CFS are converted to run in
sched_ext class. Add support to modify the ext server parameters similar
to how the fair server parameters are modified.

Re-use common code between ext and fair servers as needed.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 160 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 135 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 276d51a5690a..fd578a5eb4a9 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -341,14 +341,16 @@ enum dl_param {
 	DL_PERIOD,
 };
 
-static unsigned long fair_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
-static unsigned long fair_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
+static unsigned long dl_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
+static unsigned long dl_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
 
-static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubuf,
-				       size_t cnt, loff_t *ppos, enum dl_param param)
+static ssize_t sched_server_write_common(struct file *filp, const char __user *ubuf,
+					 size_t cnt, loff_t *ppos, enum dl_param param,
+					 void *server)
 {
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
+	struct sched_dl_entity *dl_se = (struct sched_dl_entity *)server;
 	bool was_active = false;
 	u64 runtime, period;
 	int retval = 0;
@@ -360,8 +362,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		return err;
 
 	scoped_guard (rq_lock_irqsave, rq) {
-		runtime  = rq->fair_server.dl_runtime;
-		period = rq->fair_server.dl_period;
+		runtime  = dl_se->dl_runtime;
+		period = dl_se->dl_period;
 
 		switch (param) {
 		case DL_RUNTIME:
@@ -377,25 +379,30 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		if (runtime > period ||
-		    period > fair_server_period_max ||
-		    period < fair_server_period_min) {
+		    period > dl_server_period_max ||
+		    period < dl_server_period_min) {
 			return  -EINVAL;
 		}
 
-		if (dl_server_active(&rq->fair_server)) {
+		if (dl_server_active(dl_se)) {
 			was_active = true;
 			update_rq_clock(rq);
-			dl_server_stop(&rq->fair_server);
+			dl_server_stop(dl_se);
 		}
 
-		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
+		retval = dl_server_apply_params(dl_se, runtime, period, 0);
 
-		if (!runtime)
-			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
-					cpu_of(rq));
+		if (!runtime) {
+			if (server == &rq->fair_server)
+				printk_deferred("Fair server disabled on CPU %d, system may crash due to starvation.\n",
+						cpu_of(rq));
+			else
+				printk_deferred("Ext server disabled on CPU %d, system may crash due to starvation.\n",
+						cpu_of(rq));
+		}
 
 		if (was_active)
-			dl_server_start(&rq->fair_server);
+			dl_server_start(dl_se);
 
 		if (retval < 0)
 			return retval;
@@ -405,36 +412,46 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	return cnt;
 }
 
-static size_t sched_fair_server_show(struct seq_file *m, void *v, enum dl_param param)
+
+
+static size_t sched_server_show_common(struct seq_file *m, void *v, enum dl_param param,
+				       void *server)
 {
-	unsigned long cpu = (unsigned long) m->private;
-	struct rq *rq = cpu_rq(cpu);
+	struct sched_dl_entity *dl_se = (struct sched_dl_entity *)server;
 	u64 value;
 
 	switch (param) {
 	case DL_RUNTIME:
-		value = rq->fair_server.dl_runtime;
+		value = dl_se->dl_runtime;
 		break;
 	case DL_PERIOD:
-		value = rq->fair_server.dl_period;
+		value = dl_se->dl_period;
 		break;
 	}
 
 	seq_printf(m, "%llu\n", value);
 	return 0;
-
 }
 
+
+
 static ssize_t
 sched_fair_server_runtime_write(struct file *filp, const char __user *ubuf,
 				size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_RUNTIME);
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_RUNTIME,
+					&rq->fair_server);
 }
 
 static int sched_fair_server_runtime_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_RUNTIME);
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_RUNTIME, &rq->fair_server);
 }
 
 static int sched_fair_server_runtime_open(struct inode *inode, struct file *filp)
@@ -450,16 +467,55 @@ static const struct file_operations fair_server_runtime_fops = {
 	.release	= single_release,
 };
 
+static ssize_t
+sched_ext_server_runtime_write(struct file *filp, const char __user *ubuf,
+			       size_t cnt, loff_t *ppos)
+{
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_RUNTIME,
+					&rq->ext_server);
+}
+
+static int sched_ext_server_runtime_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_RUNTIME, &rq->ext_server);
+}
+
+static int sched_ext_server_runtime_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_ext_server_runtime_show, inode->i_private);
+}
+
+static const struct file_operations ext_server_runtime_fops = {
+	.open		= sched_ext_server_runtime_open,
+	.write		= sched_ext_server_runtime_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static ssize_t
 sched_fair_server_period_write(struct file *filp, const char __user *ubuf,
 			       size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_PERIOD);
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_PERIOD,
+					&rq->fair_server);
 }
 
 static int sched_fair_server_period_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_PERIOD);
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_PERIOD, &rq->fair_server);
 }
 
 static int sched_fair_server_period_open(struct inode *inode, struct file *filp)
@@ -475,6 +531,38 @@ static const struct file_operations fair_server_period_fops = {
 	.release	= single_release,
 };
 
+static ssize_t
+sched_ext_server_period_write(struct file *filp, const char __user *ubuf,
+			      size_t cnt, loff_t *ppos)
+{
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_PERIOD,
+					&rq->ext_server);
+}
+
+static int sched_ext_server_period_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_PERIOD, &rq->ext_server);
+}
+
+static int sched_ext_server_period_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_ext_server_period_show, inode->i_private);
+}
+
+static const struct file_operations ext_server_period_fops = {
+	.open		= sched_ext_server_period_open,
+	.write		= sched_ext_server_period_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static struct dentry *debugfs_sched;
 
 static void debugfs_fair_server_init(void)
@@ -498,6 +586,27 @@ static void debugfs_fair_server_init(void)
 	}
 }
 
+static void debugfs_ext_server_init(void)
+{
+	struct dentry *d_ext;
+	unsigned long cpu;
+
+	d_ext = debugfs_create_dir("ext_server", debugfs_sched);
+	if (!d_ext)
+		return;
+
+	for_each_possible_cpu(cpu) {
+		struct dentry *d_cpu;
+		char buf[32];
+
+		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
+		d_cpu = debugfs_create_dir(buf, d_ext);
+
+		debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &ext_server_runtime_fops);
+		debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &ext_server_period_fops);
+	}
+}
+
 static __init int sched_init_debug(void)
 {
 	struct dentry __maybe_unused *numa;
@@ -538,6 +647,7 @@ static __init int sched_init_debug(void)
 	debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
 
 	debugfs_fair_server_init();
+	debugfs_ext_server_init();
 
 	return 0;
 }
-- 
2.43.0

