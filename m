Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B722F0024
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190779; cv=fail; b=pw1X2QmEhTeK9PHP0KPe4IW7gVpQQagBK5IbxC3gPZvEP4/EdtDlbOcBcWsMrE0NxvH2mJkqgaLphgQ1t6v6eIQgsdtlhu2qt5Xucrte8eWt/rywpjqPhJPS1nm+YQe4n5Pn592GUcv0A/L0cfaR7X5lpHBrxXrb3XehNL4Lqso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190779; c=relaxed/simple;
	bh=SnavyRsgL+V9rhB92CPkxq2YcwBrshkAXP4sEhiDlfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QZQFh+YP44MQeviguevwZLMennznozJbNdE+4RnPV1jfuwxI+k896VTvLuqAPxhtYvnlhPjxpHCgWuTKnp0+wJ0wvmiHvHW8KSwMDzmxtUEg+Uru35V9lIzZPvJqNNvXM0B/SPSaO5lY2Odlsgy0dA41BY7NNDNA87HSYYsn+nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fHkKUcZb; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fHkKUcZb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCNBDFepxUeOYsid5maITg0U58dt5ZBDzmdvvGZhlhmmYinPLptAXZ+WgClSMAbKzQjZfXOomqSJC7vlTMMtpreeNJHh3a2gOqq3OZ6tNyPJa7KCFDKhUD5J1cL8MfYPxsW5GrzP5CgXkccvGVwp1SKHtDUam8hJLeoBmw22BsPsTbrlZL15xpYF5Zu+ndC8GJgSvzuuV0TWPA/3RWVKC8TvPijNr9h57IH2sPyuyY8ueNIKnNWJuU3nplqRAUHWKt15bAj8Ck+z92rqzOUiDevxJKP42ksVy5YTRBlz8LJrKoeaw9pKuftrpPT2FJ7nYi/akc82Cw6Bm7cqn3wIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bj7Vx+MuCO9N40LtISa3DOV1Z9khXc8xYVvk599d1pM=;
 b=vGBfeKHyRd+N2nSjySXqy6M3Xu7ftsZ6DE/4c9MF5O+eq94w2zWaOsXDkjBBuWuMpsa/9xJc0hKs7cTlapIF0eXKZxMKvlNSYvX4IBrnbq34+DKXSkixJzCXk3FMpCqn0Dfk407svsRh1IltNXGbx6QrwKMr0m/F9H3mti2z55I5/TmZkGYOihD569GXM40sZRov6Dh/yU2+5SMwHOGOjqHuRc7iBrKz0RVcgARsbNcE554eWHH0vgHDLxWA/RDlOtLAMpIEC/fzcNLJ/ZQsRhkD2jr+nZsaQlQsBnhDI9MpRUo1cna9y8IUoQ90iho8B+jAx7N5TMoAci7oWTwvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj7Vx+MuCO9N40LtISa3DOV1Z9khXc8xYVvk599d1pM=;
 b=fHkKUcZbJ9wl/nSbv6SRPfrQxL9ZjQ7iME8B7yiA7QZy5Dyf3qXZgljFB9tFawGCM00W3Y0hXmgnHvstyyGd+7in9f7AJQd7jpoc7r0uQJsywYhvDmvY0u9GYcrQ2LauEBM126V9e+hOVpqEP8T1iEB1cyWWSR18i+ruIzoIz3Mro4hPEz3tUEonjRTkAjpeNJ0///+aLaqAlB7l3+vVAhigUCPeeH9yljG87k9cgP5qMuxd9S4lL6oXs9qbgxz/O4X7p7c43YTqNzadlSTYEJ50k1GXiWMUogFKdsquZYTKsBOUO6yfZ7iNYPyFUnVKGd3aRY3+JIjp65WveRrYoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:14 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:13 +0000
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
Subject: [PATCH v4 05/15] sched/deadline: Return EBUSY if dl_bw_cpus is zero
Date: Tue, 17 Jun 2025 16:05:08 -0400
Message-ID: <20250617200523.1261231-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: c068c88f-5569-44ff-d4f7-08ddadda694d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zWpFjnIea1YNgvg7Z2PRDIa5AVgl1EefshoFfi1Zr61B6ZpXoiWqHM0bFJmV?=
 =?us-ascii?Q?pcbalAkqzK1e1qXoAEKpbnvELekjgfd4jVMV4Zo6gvTtHsiT3ReAkZLTfqSd?=
 =?us-ascii?Q?KUrQ1KDSxzpsuDG/oJ+ElaheGwzmLLyR1h+sO3QXLjFplJL+hN2bEJM94tPT?=
 =?us-ascii?Q?H9gTHRQKQrbKSz2A+y1/ge7avOW8Bh1ZAgSUX0FE1heye1/W07lwpYJf1YT0?=
 =?us-ascii?Q?I2BxDUyh1l5OXuOjzsiYUqfpzN+KFDbMXBa7SJRn86w9oBnrqyo/OQcFKaTk?=
 =?us-ascii?Q?kp7HoiWGrE4yTfN03cbMD76NXB8Lv/zov9onN7fUdaz/VXbW3JrmWGfBRU4j?=
 =?us-ascii?Q?n4QXsytq3WdfkUpj7sEkiyx7wvYuHqY52QQMk/IoEPmqKEfENh1V8B0C35xt?=
 =?us-ascii?Q?rnRFJfTF6QeKVYN/zPCKLZIdCs4T5540BAz1HIBQAGUk4lrYlUUzwhMeEHRC?=
 =?us-ascii?Q?6FnMhiTJSnZsLl7k8mOpWN9RoGfI+UEHBejl/MxGqLHir6wnMcInuk+cackM?=
 =?us-ascii?Q?s6myMzzyVQvmTA/ZBRoGIhGRpwLnKIwMcUj2JztsIFFAs6s0bePH3KM8xOcW?=
 =?us-ascii?Q?SYoR0LKfm2+GJWzobY7pEbxicrQ5ELGg99OSQqIXWl4n+Q6qHEo/ryD8EKcU?=
 =?us-ascii?Q?me/Uivhb/snGOwaP2n+AXcOrKbT19XBwlgALSSTLjVW2560CIEJgA0StYzjC?=
 =?us-ascii?Q?AltHu40DKwiLUpj4INtZxk6/3WusgdtkZSQywKUmkZBlq9cy5LCh0L9IMuPQ?=
 =?us-ascii?Q?8tnX8cyLQISbfeYc4vNeeyBGKJ7W8Y5erqGT0QS3xY2QoYWjw7xq4gYs1/BA?=
 =?us-ascii?Q?73Ynm0CDikzBYb1a1eeXTtrW1bnsNg1cKLia5ST3Qbm+JUQF2Ivu8kOKWI/w?=
 =?us-ascii?Q?67fSloU/gHfrN+IWncHyy83Yg/YS5x2Us9AOHmBLcmSuITa1PfJjngvt9zvb?=
 =?us-ascii?Q?iyZFKa0QlYrBZyZi25KzTfHa7RNm52/G/lT6qdeVA35TUMWDBCW+zxwV6e0Z?=
 =?us-ascii?Q?JGFbiXssSHC8/GCn/0aKqmchFYEAXqFpeTnFRUpDSleatftOUSod4CcE5KjB?=
 =?us-ascii?Q?c5VKzGUi08nnhTVDwyqHUohhYHVTiFXCa5KUtivWgPnZWGX7OM8S8wm3R/su?=
 =?us-ascii?Q?eaoMmY9E6zsaGVj0L/8Ta3HpkYmfNiJ54bPswUkocyJ02vis4lS6JXrE3K5Q?=
 =?us-ascii?Q?CuyaXxNxYf5K/OmpKuNcDr1S8yIKJVgSE4Za14e4ujZHV+8nwcG4rob0h+tG?=
 =?us-ascii?Q?8GQSncmAZ2eoT9gRx2jAa2ra1gFkq57iZqZXTOor1/jLAF3SKsY6cZwNRgdz?=
 =?us-ascii?Q?4E7CPqKh2gRHnvLPU3MTIiG8hz4qB2+ag1SfkxGhRoZyBrZTecd2/peX8TL/?=
 =?us-ascii?Q?0ylwr8AGkDRaYhTfSKSnSvKgMtRe3LA71i2/Pf6xKPjK8DXpf6KdW0GEy8yT?=
 =?us-ascii?Q?38Gg0BgycXpYdwV1IsYpNipTU6zw1Fsnt6O8IC2m+PE9NuRP53/wYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0N3H/OE9SiJEMBScFLs3mP4RJqcdYDNNCvZxdLjW5gFMMdgZBwV0akfAhYKx?=
 =?us-ascii?Q?j3QI4CK5VQ2AATidTCYuQur40Ri+qhUWtRUf2qNdvgNz08urTQZ/J1sh5Vt9?=
 =?us-ascii?Q?WmXN/BWJnl6MK1PMpXWad8Y5NDA8koc/2nqx/kTGyxQT7TXFX74o8xdf2fdo?=
 =?us-ascii?Q?SlhLZMrpuPbZ4v7DszAiBFSepb4/7bXoFJYTl0ugp24eGvkz51JrKuaRVimN?=
 =?us-ascii?Q?l6Z7hwfhpFAc1q5yTNd4HKHectv/TduD/zoMp2dncH2MuYBBImPJyf9m4b0n?=
 =?us-ascii?Q?yT5y+JKni6LSq5wdWNg6apgShMYE7xyTVy0/VDaUpTo1B/5vE/7Yp104lhW+?=
 =?us-ascii?Q?33zV9oKBsPXP+5lT55bgvNyTyhzdJoFvw2c2Rq4i6wOVnhwX9N/EwwhFatWt?=
 =?us-ascii?Q?zDIQSYWQqE0MGolz6WiSldjFTdRkF/tmBAdFbNmjh3+5tH72xH9NInc+097h?=
 =?us-ascii?Q?gKoXFXGve/AImkjGBE8qjY4wd/t0FMsO1hy2G2G9tEHMnH8JfKg06nktCH/y?=
 =?us-ascii?Q?9fo3hOQ1dDo7mgEfSJ/byGnc0t85KPX3jVw0IJu+VyWDHyYQQRGT2Aaqbe3W?=
 =?us-ascii?Q?0nL42bHsDBcxIwT/EyAY7p1Vvz6MXv9tD10Nir9vdzcjPo2tPXmKMmcK6AFu?=
 =?us-ascii?Q?2ovDr6EuCk7Ac3DAQCGXdHFvR3cjFQwGmYYFxAWmo4AQG5oJ8GPQu0HS6Uc+?=
 =?us-ascii?Q?rnSX6Uh/7Bi2n32hJvB0QoOSMyAxFbT6e17l29hyvIVUETtDMzwpsXaHITyP?=
 =?us-ascii?Q?+BQiFNPKzuY9nyW/X9RQjKH0NguXnJt/IkG09wC304aYfsDvQnKHhXNSN//Z?=
 =?us-ascii?Q?TafzAM5sYTtu6cctGh0rb52sZTg7CwNXqWBaLgYNjLQjoVFqNKrwkOeueG8r?=
 =?us-ascii?Q?7jW/Dwk92upmQpwfPH5JO9FiTWimPJfh1rTz1+D2OvL2g6GJN29Dea2uJXgL?=
 =?us-ascii?Q?1vkH6ymGx9IxTJN0IlBKkF8xoexwgpW8T1GaPqWamEx61ZfwPOeo3tYxMrSQ?=
 =?us-ascii?Q?aB1SWm8DOSLptQf5TCL0RIUpsJlznjIssv29FdhLgl8mXsrOjlsNyf5/8A50?=
 =?us-ascii?Q?G5XMJaR7sfNOXZxPCh+iPLIgF1taKOKYxjBxuJh6ymzNESaT5mPmLhEK5I+p?=
 =?us-ascii?Q?ljURwBcHjTZK6JN8WLs6Ceh61nfVYVU/IozTppzDqJWfuOab8sR+UOfV9BVp?=
 =?us-ascii?Q?Av8suw0JPy9QzJ4lbewv3JbXTfqxHLyj7iuhPGC9B0+CaNSVFRvri3JXYvaU?=
 =?us-ascii?Q?stz+9UnWN5nGT/aV0vHboWRD5kd5EA7K26wOyCzohZbAPi/Bpo8nAYGG3K8W?=
 =?us-ascii?Q?c1hThoDx5lJd3VUBhq/bt/+BZ8g4uFlH3rEXsiuYJwhRngNa7SpKArIqyUzK?=
 =?us-ascii?Q?Bz3AEdaFeyMuHpsjSt9lpf3FGEeRmZdC+EJ5pS878yJPO+xBxRf6A9kImzKz?=
 =?us-ascii?Q?A6CS31Q7vtSAwojhU0qshn0v33lijCNG8yEqoWY4X6x5+ruF+NUPXyws2MdU?=
 =?us-ascii?Q?+swmmkyIMdPeYXa5pA/3Wk6WzptF/DEDnIuY3HdKrDIlpZszD+Ea4GgFGelN?=
 =?us-ascii?Q?Jyz8TwDCClGXaPp4yXzlB03F5Jk0ubnupY0IYbju?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c068c88f-5569-44ff-d4f7-08ddadda694d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:13.8717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMDypXyRSWjznAbzivV7oOpLeY0CDksmqimQgsXHiuR9DtooftwlalaWO/QUmVLfZFVOFOGmIvYdtQ8DspaLEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

Hotplugged CPUs coming online do an enqueue but are not a part of any
root domain containing cpu_active() CPUs. So in this case, don't mess
with accounting and we can retry later. Without this patch, we see
crashes with sched_ext selftest's hotplug test due to divide by zero.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index d2eb31b45ba9..749c1453a809 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1725,7 +1725,10 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	cpus = dl_bw_cpus(cpu);
 	cap = dl_bw_capacity(cpu);
 
-	if (__dl_overflow(dl_b, cap, old_bw, new_bw))
+	// Hotplugged CPUs coming online do an enqueue but are not a part of any
+	// root domain containing cpu_active() CPUs. So in this case, don't mess
+	// with accounting and we can retry later.
+	if (!cpus || __dl_overflow(dl_b, cap, old_bw, new_bw))
 		return -EBUSY;
 
 	if (init) {
-- 
2.43.0

