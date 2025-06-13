Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C73253935
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791881; cv=fail; b=kFGxfLb38FI+/5Vtt1bnvRddKoC4VHlkQeFz7c/VCm4mBBMEEiRVXP9GQ3z/R6ahfHenddJ/9VRVo160ttkBjqwlUZt0wuZz6ssRoRJDnb5xOEnUIPGJIEgU5EUjf9SggloP4T0Br9hlK12a6+HtYlJ0YRjZd3zeEYbSmw+u77U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791881; c=relaxed/simple;
	bh=rvklTC7OHA/mtpWd4Dt6JtK7HwaBzPDkG1ZDBrI1cco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MKjJj9SVmrMC0Ovj/Jj7NorLzjwvajruz8yhZCzPvp6A6wuXlwR08JirMdNECp4hamt/wJ+1C/wqudUJfvocN7PWtSW+bbOxugD8BApmSuY8iY154JSEiIvdp+AojTF7RdQTiJFa2/ioCuI49EtWLqDV55e+opyCkWaAGiOAmMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RlHnasKB; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RlHnasKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFpthd8XWJvG+Wa9LNUPEn9t0uoGz2XmtfV3niPQbVg1wwbSIHUG+7LDvExP9Io7j8TKZncWf5viu0gn1XVmyWrEQ5jntjAw/n3J8j+BSokJdtfWF4kegOzJ6iSJxH8QONuj6c/EI8x5iBQW1KG1Tx8ExXQUttIdjGC/kanlhwJHQmUNVBLgOZfuVSw2/bfZ8XIwgy4FC0NMR9Vld6Iv487z8awIkb7Ron04w9MMCPoim9fPAGpsunUUgmVnjY+TSaXsOCR04InfiQG+KfB6PjxRFU6BhORvIUgmaKuQS+uBP/3PZPyo+MJJAhjuC8XcINAai9nWVo8OO3S8N3bcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGauF2OvkWyipUyZ/vICGe8NaOIPGAuHnTxbWoCtbLk=;
 b=XyMkfg4BA63wR5IOx918DOeSPviAfh1VqCTaTc6REtCTfcy18t5S42qg1D66WvzqNpHz8gpSVQtcqQ5UhgkF3vUR8qu+hyIiLT3R7dBrlsVtvux413oLufEmSYvJdxLaEAH7AqNgSpowbtzYZpMQlu1626emJPvbLc0PspuWUjzrPjCBmjK0pwuITObMXddpldnypC3HhPVjE+mwV6HwzIzmOCXydbe+LIxTl5hEB3mIiba+o4qHnCAiB5zwT18La4K5JgAv3/DvStGP9JwCzmg8JKSX796M++V0S+LucYCcfpRDLFfNdNxOvk2OaPimq0lu4KdXKks0IJG7orVh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGauF2OvkWyipUyZ/vICGe8NaOIPGAuHnTxbWoCtbLk=;
 b=RlHnasKBJGRqS4uCUgJh5shJCKklYg14pzZUoBz1Pg4E/xXXojrsdArl44qDPGTjOUZ3d2SxW/oh0nyexSUzAvh8PgWwBYYibN+MT24svxrvViJRjDTZQWEA1uroMUCvTxVLYuo4F6tdD8Z0hd9PCKj//ygbzP2hT13gRtG2Bwg06k4BI8Agq2YDOT4CzVv0tmR5sSR+WTuv77MbSMh0CCNmR+Xi/Q8x1i+rWi6j1RdD8H823QFB19i0LqYtQv64UjiUSwZip/A5rYV3rAPTEDasuD25El897qGxl9ogiB9ZRi63qf3Huside6NOuh90uBwaxmjcPbIh8bktY2dqkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:17:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:17:57 +0000
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
Subject: [PATCH v3 02/10] sched/debug: Stop and start server based on if it was active
Date: Fri, 13 Jun 2025 01:17:22 -0400
Message-ID: <20250613051734.4023260-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:408:e5::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7e9abc-f9cd-482c-e0ef-08ddaa39a860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dr7NHq1qG/P8Wi/wXEl3diqQCdDjkJsnuKCQ7lkv4tJlKjXGf5rV+Ta8cYm+?=
 =?us-ascii?Q?dq01yw4MvrbH4oDiCwk6Vp/hkuREHaPS2Cuo5ZeH9CReFlvXtOdlwEOfuw4J?=
 =?us-ascii?Q?05elckSIsv8rRWiSPaGtcJ8YeEgg7syBZH5RsVJHWbdJ7QaDzLlo6E07m3OA?=
 =?us-ascii?Q?Yl5cvA7Othw/5nAB8vvJt7ag1myyNSucfxhXmqgaJB1ReujyrZNDHjDxKCBE?=
 =?us-ascii?Q?Qa7qRWMe36abxo43z6BS2OVWfE6xh2nCLLn9nGxtA8+vyJOGEVAFH0jYR9zp?=
 =?us-ascii?Q?Nq1Eh4DMvk3iLoRbji/OEKwZ4DHtO1maAS0Hz0BrTeK1nHboBvl+pNrrfrMV?=
 =?us-ascii?Q?GrK3lNoR9uRS4xRhGLkEVaMz8CbyQ4uKCNB0+Ic8vduK5QzEboZozp4C5wIu?=
 =?us-ascii?Q?UI3uS4FC9JOVsybSAfXhXi4meSVyOSJ9eAT/JYKmY35K8cbdDCvWKqTAHCJB?=
 =?us-ascii?Q?nlBXYnc7uiD3EIcke7vS9KRXKoJm6edCwiaeWAiJto+1w7RV+uBMBGMKzwHY?=
 =?us-ascii?Q?gTafSlaWBqy0la4vtLdj+kvZs0WOFoKjd7w06mFSbxeLI4fyD4e3zcZnaRwu?=
 =?us-ascii?Q?KOgvTyklUjPGeBuXX4YTvgpet95ojmK1bcsn8oxRXI87BGVhu4vMZeCMdo2s?=
 =?us-ascii?Q?ZMWddDsotelIoKti7tODmhHEWEFi+O98JbCudv0R9FBuG0c6pi0hfLUQkjKX?=
 =?us-ascii?Q?TXz5YOJrRmkWnkAAPpO1R0Rn2/xgzBSGmO75jk2HTh3gAy7WrDptlHH8ux0A?=
 =?us-ascii?Q?AqBm50R79wPEnNsuqyzw2lV5ksfA9Zs5Gp2dmO4nSpARG8U+BKeAtRGAopXB?=
 =?us-ascii?Q?uX5SV+VckBkzdOzAYySdsvLuQnr6LvldZdGAfagLcyfV8KRsrz68FxS+orpC?=
 =?us-ascii?Q?qMP5jnRtPRvYmrqKHnKjUVD0RsV60W55apHER/cmH1IweXMwj00Nlbd4mMyX?=
 =?us-ascii?Q?3s6AuVi96sU/8w/rCPWdZGjxm6rsGvuOkOV8Y0+jp75AmLfyL7vQn0VO0Be1?=
 =?us-ascii?Q?3jQP5Tcd9a7WlHiJj+1ojUuMJbNMPQf+tb/afUhI3+6G/tMlWkXciJkfGU7X?=
 =?us-ascii?Q?oLrLufXRm387jBM0C8YfTJs3U5b4NYYAMNY94MeY/lxiVFVOBF/SYTd8A6wj?=
 =?us-ascii?Q?nEMqKl4xSwmwP4E77w4MaOZXRldZYmSbRf5daaCU5UBReUPdcrflRSxOVTMW?=
 =?us-ascii?Q?nbb8uaZbcswwIhCr/xaG2PzXoFtMzMSM2vooRdhGZBpXPklIbqmLqXRiMDPy?=
 =?us-ascii?Q?GyEp62nZrt45YXIfbkU7X4HahCVTmQwY4QcChDRVyR/oplOZjKn4Cwb4b1JU?=
 =?us-ascii?Q?UtiPyYJFjG6ovMzm6Hmt+IOPUsTs8KA6+2l/cSiZDxesjAuffh3Kkz68NrJr?=
 =?us-ascii?Q?ac2D5sd3Z7gSuChYs4Ct80Ij5QAqtFRdciIqzqeoJlw8Ox03Z2n/wiPo7x5K?=
 =?us-ascii?Q?v1eNLjXcojyTI7HypZ0lYkKwFuLGAJcnx+PUuXmpcSBmAMGLiN85UA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?an9BIYJg+5BTK4sGRxxLvtmvKsKIXj89Jraz0NV06vnPiJLc2fhGVRXYdZcJ?=
 =?us-ascii?Q?2fRm+NckabuQdfLCKhqYMbz8aKZcK2y9LNbnlSHfMX7TLy81NMUhZ1fCtUhp?=
 =?us-ascii?Q?iBOwUq32cfrPSN3LE0g7TGJOwoqO652wx1dlgPMPn+OaQxjpBmONbGr5OMMg?=
 =?us-ascii?Q?eZgYDpFlcXFmNuF+yLBtl8hxawfELyycnOgaFx+sOwZszYy09YyPmgw+wzxs?=
 =?us-ascii?Q?eAGd26Xctq7wuZWy3gVtdAJRpdsXZEHk277injW49f2lKdZCuB+IOZGCqloy?=
 =?us-ascii?Q?W1HGxWlTwgyYf8wPBti3e3EoqgltUlILGxx7cOeT9oP2H9Tv8M/SAKm2ZXqT?=
 =?us-ascii?Q?QnG3iSBZh6e4Alj+37PCkpzqkkn+hv9AHEo5FoohWz72gKefnmNcPO29tIpo?=
 =?us-ascii?Q?9yDGnRC3kitmn7UYnYeYcdr6VTyEArMrHYPT9OD7a9QbiboCS32zusWNHkhb?=
 =?us-ascii?Q?l13tDvgPpjlYpQJEWksfWgY+E5tH6uk/8Zt/v+iF7SIXVwLSmRJF8uK7F8HX?=
 =?us-ascii?Q?1ITZ0MNPvGvxKGaqaBX9Uic+YGb/FRDRG4k9cMSorlpyPai3wqtt9mHTZIiJ?=
 =?us-ascii?Q?jv3kz+YR/e5YPcf9qVK6tDt2uQwf98hj/0wGC2wj68wWHn+xq138quZRSh7O?=
 =?us-ascii?Q?43vJ06ipRv9wha3lbjAeNHQsVVoSnKVohTsRSPTI6/nvWSd3rptGfeT8Tr++?=
 =?us-ascii?Q?Oa13YUd17PGsm2UTpEH2qYj9+NQRKcBx0PR9a8dF/6TrE27tMTHmFzkmJ+iq?=
 =?us-ascii?Q?R6MqSqvF+4KKaKLjq4YOUo+cdredfQFw4XTbf/TCIHrFGcwGttK9OAPxBBCQ?=
 =?us-ascii?Q?hIwQBEpmBwyEd40UeMLq14bzntQ4V0amM8EuG09qjTZmEOuPGZgUpGqIMb3J?=
 =?us-ascii?Q?IKxMHN9RWBFmNwX8m64V73oNPpOsr7NigvIyoxEUc16ggKRqAIOpTk7XqP0I?=
 =?us-ascii?Q?oatrXRaFoMLR2yuj9Ec+Mj3NkAvFN6sHQ5KXwHnjdjcvD4RI2O2Vl7gDV/Y1?=
 =?us-ascii?Q?i0rEYatJxvne4yQEUxTmpA773LO1qVw4KSffX98j/cy5W+MOiWVbLSV6mTc4?=
 =?us-ascii?Q?4MUb3tE3OrzYuON4iMo8gnokyujlq1xXxr4A4CGCrEfhlAYu/UgD8Giyqwpq?=
 =?us-ascii?Q?Wuq7HVWUeQ7FuXgdnLyAz4mv/lXIEkIyY6SFloEjvV30U+Y27uPPbhkV7pQp?=
 =?us-ascii?Q?ekmjSAhrCTggR22RlRszcIpKSDvIKF5UojlyENTh88+lFU0SLao4SdKwToY1?=
 =?us-ascii?Q?GdGsK1jtsWuNli3gWeeYdU68qkD7nPH1ApYBUWPxTG3yAzogljPZafDpAGBD?=
 =?us-ascii?Q?fjFtBrFUIkf0dSoRyUM8itChjCTQnuqliRHI9o6+HQXZFmA0yBpxxf65gl1J?=
 =?us-ascii?Q?Um1Pw050CIp0/L604ZRul06OvyaTuPXP9TRzAt+s8Qb4W2Q/sZa6oPLF66CY?=
 =?us-ascii?Q?87C2kqFf61q5dX++rT/dowWqgGRVLsqmFZKRp6anUkaXlAXaUYCah6wkPjuU?=
 =?us-ascii?Q?mTC2MTlJX+ruESXdVXx+F13xXqT31dE1R3EApU4r8UEdpi+R2OINBxHQ74Af?=
 =?us-ascii?Q?EzRTwOtIh6oIcSpThrrwgaaPqAX4qiyVn/Uft1Y1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7e9abc-f9cd-482c-e0ef-08ddaa39a860
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:17:57.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bhQte9YnW7YFMWISW69nQfXUkKiIdgriQOrxqu60IMIu/nxH747CsFcfHyj5EjvrOJ1YO6wa5R3xeZCpY4WSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

Currently the DL server interface for applying parameters checks
CFS-internals to identify if the server is active. This is error-prone
and makes it difficult when adding new servers in the future.

Fix it, by using dl_server_active() which is also used by the DL server
code to determine if the DL server was started.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 77b5d4bebc59..6866f0a9e88c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -349,6 +349,7 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 {
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
+	bool was_active = false;
 	u64 runtime, period;
 	int retval = 0;
 	size_t err;
@@ -381,7 +382,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 			return  -EINVAL;
 		}
 
-		if (rq->cfs.h_nr_queued) {
+		if (dl_server_active(&rq->fair_server)) {
+			was_active = true;
 			update_rq_clock(rq);
 			dl_server_stop(&rq->fair_server);
 		}
@@ -392,7 +394,7 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
 					cpu_of(rq));
 
-		if (rq->cfs.h_nr_queued)
+		if (was_active)
 			dl_server_start(&rq->fair_server);
 
 		if (retval < 0)
-- 
2.34.1

