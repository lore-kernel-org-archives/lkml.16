Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4797520C031
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791879; cv=fail; b=foj5c7yKVUXODh/0OFNCRE60Sd0SxHCWulMgiOoz0F9NJwR9+HbE0zvGNuQ3ZYiEP1A0duIAABm2Dcpk59iR4WOLwffxKH/M4htwGUdK4pgoDfrgQCZf2sXGO30rer7ZjDpVzsJ9KDJhmvG9BZx4vTNRRx6QjJEQfftJS6awpdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791879; c=relaxed/simple;
	bh=sCwsZl296rcXhp3qydIMICmBoOGcsseSPFCQrLwPXw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ldhc6qTtyYMXHfxSrZJyiebcbYgyL4xeIo6pOKN34NSgpy98NhK1SIHR7+tYJRxtoCuwl+0fnYfR7dAc47INyu7L7ch1cV7XArPMxf4cY4vbpTaTvA1u2xk6KNPC8Ev2zPbIOGfLo4Vaj/ypaXmSx+TulBwLZ3admHlBx9dXzCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BpmECfL8; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BpmECfL8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eU6591wNgf76U5Jn60pr2fEMwEVzpYK2F+BTHL06dQRWbS6Hj01iM8wICvXLvUiiE9E6wPmAowM88KiPE7w6A+2XM63e3ydNnxfksRIVn88ouybivh5ZemB6Ir/dxrRVP0fybY9FWLoqQo9KzdJhMZsVDOrbOHFH3NHlud3RY+Z9v7mu1PMJrNtsh/gnhttXttrTBdpuUM1NvBvGoDslpGfLKYLOkBBIaJ1e9OQm0k85i4lT+yBCXhy2UOqx81VJIzfwK0nJnCdEQYGbras0XBtIskXLyU+olFE/qZ4CcplzYQKvBzOOPSd3xIsihDE0gg/2+NDelImtEBMIcc8kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb6UswdCYXw+LzXL6hFg8OZw3lAUttpCXek0Pv5MiQk=;
 b=E0S3bXCl8hgYWHIrh0XHMZkPnLFSw6JIAnp8s/VsD5rcGU0hdYIlOPxzwjC1sIlA4YJtuHAyNYxbqOuXpmUKQl5fcHKI+zKkRzI242+BMqM5wLVxVUsu/NaFqXyaFhJCYKA+knZsfDJj86tJ79AiN0zi8D2NT3aZm5mU7LBqpGcWALAfD/li93VshY1uG61V1I8p5KalyoPAV6BqEMp55QM9sPRFx4kVqj7bpiUrM6JXpH7wC17OFhMx0ygDyn10FuJpmSI5YKwQGq/ePVGe8gIrkT3Lmf1af3WQYNJLYGV6t5KcSwqfpdITR+zjms6VTgJJYxuxzHXMAM7qmcqJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb6UswdCYXw+LzXL6hFg8OZw3lAUttpCXek0Pv5MiQk=;
 b=BpmECfL81KYmjvUhY9+DppDVijn7QR4UO8ojBZNBJB2zKqTkPJJBqrN2wx4nJEpwd2pONOiyBk0RqeNlrjrqI0E1eyi1LaKwyWvwnt9vdbzUs1VUgDsm+jmB/GDl9lYIPpCpZbM/XcrsBCxaOqPTRGGBARgTp1Y380SxM994b+m/SNtzJ9Rqjq69xTY+ViLz9xUBMwYThj0TUdxwsEt9RW5ZM6AULCypLF3f0wgQE8xWEwOktLbguYweERK0ACZKPZBd9GiqKDqnxG2bsiIr5N/hMIHz3hTuP7o/yXp2VKLSOlwmVkjZu1SPI2kSBmg+nu2iHmwsYwICeVvUnC94aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:17:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:17:55 +0000
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
Subject: [PATCH v3 01/10] sched/debug: Fix updating of ppos on server write ops
Date: Fri, 13 Jun 2025 01:17:21 -0400
Message-ID: <20250613051734.4023260-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0012.namprd15.prod.outlook.com
 (2603:10b6:207:17::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: d9538958-8abf-435e-d7a1-08ddaa39a720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YDtgeGhacyWdFb9+SgPyUSfopCtBEUKlz5IRH8vYEa/DwXENBXTdhE3OLSto?=
 =?us-ascii?Q?DE1HcL59c5OW85r8h4DCMB3JvFNXuGrxD7XSDcSaqhwe5LMTe9u+JZFI6Jt2?=
 =?us-ascii?Q?/tU71iFcvo86CvcbasVtBTg/oic7YawVHCVUSjpaUie3AwvoCH8JVjuoQYEx?=
 =?us-ascii?Q?3CamSFfSZ5O7TYGm6qyXejntfqYTs7pNbrZvs/RsMmOfggcXW9cRO6r+xjec?=
 =?us-ascii?Q?UVvT6Bz1bK9z2MESD4uOGQQ6ILB4K/dOQHCKjFdKfyhMkUoRUuNoPUZT2af0?=
 =?us-ascii?Q?nMgHCwYDK41u5b7GbKboCtWnDF5EDJD/45rJ81/jvctbfNMzyOpy4ycG+XH9?=
 =?us-ascii?Q?o0/nABA1QRQ8mog+p0MgVnmEmlYRx6gjdhvfedOyKe0HrJtzbc3k4BJrmEf3?=
 =?us-ascii?Q?z4ainq2fFRHnUz3aBZvAh8PlGdzrTyDBrIPNs6EksYQyFWXOUDOoTJmRiVVY?=
 =?us-ascii?Q?zwe1lO9xAhUM7alqPoZCik7IIB+UwwA70breFirJSeEmVsl+o7t9Qjb1RlZY?=
 =?us-ascii?Q?FDFVJHz1X/AR8cEMLW7JDCOAs6b8oRXTd5LuZBbjzAj9VLojq7uVvzoQ2uyt?=
 =?us-ascii?Q?yNey7S4t7126CNZdmgfE3ETlWW44qky0M++PDfvPcss6b3+sHI522z1VEfdr?=
 =?us-ascii?Q?83wjYfrHkS+K8/L47bRwTpcXGCnTWJVWN3oo96WYvhKCnaEOPhFei1dJCfGV?=
 =?us-ascii?Q?uBMCH61CZqJ7/wuF7zLjWR/VIDT1lPyiwtuVFkzgtJ5cP4q01FbytvI+z91l?=
 =?us-ascii?Q?OTkL3WOAm9Oxo7lf906rcM71fioN0eh7HXercPNuA2TazVQEb074E/1Cmbh+?=
 =?us-ascii?Q?943JUvJw+lp9hoqeMW/QQujec2hdWM7/4l8x595a1Hm8s8FZWe5qu2zEJuQX?=
 =?us-ascii?Q?k3/6By414cYqgEX8K3aCR5vKBCri92kdlkMkTCefBHbjhP9SldA3Vyb6vBez?=
 =?us-ascii?Q?wuxkmwvclZ3aChe1+uMbjRMxyBcRQ/u+GUcrW985jFwMlnBaAZ+RhMJmCz/c?=
 =?us-ascii?Q?8JHfVxzagILJBWndWYHy7dKpZTU0y/7yFBaC/UrEFqbB3o+gA7XOnP8vuEqR?=
 =?us-ascii?Q?S3kwffl137NPrpY9qXN2pdHDRpYoL5EWwBApms4WPsinNSNy+HdwAdtby5oI?=
 =?us-ascii?Q?08SPGbiQLOFrG+CTORJD/+Ohig2FTqHokHNYRvCYATzBpt3AKfTC7AvLArKl?=
 =?us-ascii?Q?FQPzAjl4ukAT0G8m8xSQnIK8nzSD7XdSLUZYL4/rsGNcNtNUV+zQNlXJzvUA?=
 =?us-ascii?Q?LM2Orc/krPLmTzMn+HCXK+2MaNF9m9418M2bNE7lVLJYcXV+2gjLhEfwwBI1?=
 =?us-ascii?Q?bZ8FQtCbQwb8J4uE/H4aVhst3O3setRJqPy680nNVNWljfefg8Kufihcpl+l?=
 =?us-ascii?Q?5A9vKsncvCb7F8tFVYZ70R9Ts58STyFJjpqqqY9VE9hgVER/CwWFXCzVaJMZ?=
 =?us-ascii?Q?/TxtfvAKKn/Ow0xudPGL4KDUblUd0yo8pNMOJyR/jHQH45g2pQLxGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9sYUSSSagcyc7Zsqf/ZZSxxeAq4p3pQ+veZ7/8b9m3Xap3PF4pMHbjTGeCPp?=
 =?us-ascii?Q?QSLtkruzBOLf2NuKZxX+1oiYyvryfmr2xjyQvFx6FcefAiAQwZJrRRGZOhzA?=
 =?us-ascii?Q?LGEs91cQKoqS8kXjivpDQnlfV+JZUn6DYlp2JmKo3J5icC6mSdffagWRpJ8E?=
 =?us-ascii?Q?YE7wcUwOMH39uARt0znwQ/ZMXBYFGrqTI507zb/d77XhiCXARMvxgnAt4Jlu?=
 =?us-ascii?Q?W//LEHcXFX/4UInT5qeYLRloliSWRZnT2+5Cnb6ygkdiJtRuUMPZc28Inase?=
 =?us-ascii?Q?1cJT+gRZjDQsZ9K8+7yvBvfGfMVy7N207Dkt9rPIEttfPZqwLK/+4cxwQPzx?=
 =?us-ascii?Q?rFRv2BEjYuWqLTc56LEV43wvlzuEQpLUQ2EDky8lwlV2J58GJFgLJPh+zcsf?=
 =?us-ascii?Q?gVx8rIVp/jR0fgHPQDePvkexZjfMRPsckmVpiVzM8C4WUltkWpq1ixu7z+w5?=
 =?us-ascii?Q?Bi79CV59wyfieHhFKB9DFXYliBh4KeAG4+L2G588qDEBGobtvTcEWBshbBqX?=
 =?us-ascii?Q?0xJXdeNaeOnly4iL6PAu8W2yneQvIZlwmDp6kMTI12zFKgbS9JUHt5oQ7o6Y?=
 =?us-ascii?Q?YmzjacDwy31AfUx6cLf5TZOX/4NZGQzf/QVd3HULu+h9Tx5G4SfcYBObSw/b?=
 =?us-ascii?Q?eSvtjiDjAoHFdkzU5XZEMJ+wYzCbqzzEd7n5Rq1KmQfbGxfS8737DCJ1XDCU?=
 =?us-ascii?Q?gy+/jIMGuwMxWccRQydpe8X29J8a/9dTo35AxIGOjT5UXFtqK56YUBGfL30i?=
 =?us-ascii?Q?31FHe4MECqFPgzAMl8EXJkr9ty6FR7IVeYagDi62dePtL3ggJuqVR343KvJh?=
 =?us-ascii?Q?2gt/9yasxXZEsuAKTSiqbrhrYC1Q0AQV47oAOFTxFbRnV4kYk0xSV8fp4QoW?=
 =?us-ascii?Q?/iLhmV33RYjLDWaLCcZSimKUrKbUcUczMuzZ8WjbAKGFE88fsjdKoQnr7+Is?=
 =?us-ascii?Q?ebbVWDER6dejKt7qx42s0KY35peGZrmqNiinAd2LPwDemvgWpq1+FxMbR5VG?=
 =?us-ascii?Q?nfJWHi6Tk6AauPAeStQ99yH1I7pcH5oqnbk+sCoMDakGFoSzONNeqexaygZK?=
 =?us-ascii?Q?zNPGHEpsLEh0OTNT2W0BcRy6L1UX5vhCFu4qHBEqSI7VDFjfWtlN3i0aC9e0?=
 =?us-ascii?Q?a2cXiulj1mkDj8A2TqJWSw3V6VLI9osti1uCvyBgugYZngwSvcFEup/KxjgQ?=
 =?us-ascii?Q?eY0bF1ApVh23xAvZdSjJp1wfqhKmVX0qBCuaml43hymWmnRkj0pHXvWmI1jp?=
 =?us-ascii?Q?Vn5N76q0j4Jxp0GyOXCBKqFSiP3cbmREJbQHp3cfH7Kp1NkR1d0VpfvgIhRL?=
 =?us-ascii?Q?XK/wpM4fni60V1jZfUYlJuGuqBuXXfRwE1A479OZrgkRb1TYskvCaIyQiOGU?=
 =?us-ascii?Q?W9uDYtO6gwoCJ+uD/OMi2fo/NfxHywwW4lce+BTAJ5IYjD1OPqzpXeARgU+l?=
 =?us-ascii?Q?vo2nhyZOPJKRmqyaFkHPS1iXovPuyb75n9B+sxOd7oIvLEGZC7UAvew8wyYn?=
 =?us-ascii?Q?XL64Bm97i65BnublGgItpo2kmVRGIVDyBfYVPJ0v3rk6DdDIRe+xiOrJ85XV?=
 =?us-ascii?Q?s/BaD8FrMYW5vnM+ymhX6NSLuJVy4adOhd1TbCtU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9538958-8abf-435e-d7a1-08ddaa39a720
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:17:55.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJ1I7dPmkp80oZSH9Jk54dVOB1Nt/CcQH/u6xmu6x29cd8WBSuZtxXF4U2MLiGlQgQVUhewT8j9ZBmgEF7WLJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

Updating "ppos" on error conditions does not make much sense. The pattern
is to return the error code directly without modifying the position, or
modify the position on success and return the number of bytes written.

Since on success, the return value of apply is 0, there is no point in
modifying ppos either. Fix it by removing all this and just returning
error code or number of bytes written on success.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 557246880a7e..77b5d4bebc59 100644
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

