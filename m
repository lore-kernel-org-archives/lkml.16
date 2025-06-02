Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985D227BA4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887304; cv=fail; b=lvqhwnObiwbAoDdnZny9pMCCpeMT0VQI55zkpeKKczlsHW/jTY3jV6XhFvx5ecl5NU4CIUqltyLPaCcX7vGVE+OpRq7ebjJUNfpP78PWpmC9RTFXdcNRbXzoJFCXsTxa7oC1TbfpT9oXwCHZcaugCLyKLqJm6AOKn+W0Rm16Xu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887304; c=relaxed/simple;
	bh=5TSmCE5A3cu5N0ax8G2kvx4UV0pum/ind1SmZIT7H0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LzifyhxEc9QAMBqssNp76+Oh+PyXH+fFukuUrBFq9CGwpgfUI9qC+B26RcMxYfCCMicTaCEvabAsRpnAKrl30UIgAduCQfzYLMyWMUbR88XQxEyP7FMXEf7ThKK5pIU2Pdb3+H90SushF8E0wEk82KGdMC0qRHUhOVcpsk13lJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=czXVCMfd; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="czXVCMfd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l76SXlUJr4Qo5osH56tsdd3SjcXbFLVD9Sj93oTbQLV74ib0BHpuDW7OOmDgMvGWxHqAP1houUIIiLsiGDReUEexibcGiUlEhKyUBCi9uI0LW+ObSMKd1jxwptURSIzJDNfPCadEBlefOJwan6LNq6L81zaKWUyAvi/bhwa2DRr4dArD8exD/EK5M7jO4ZwUnLmTqXsRkEp/+VSnYQbSY5ZYcgdO3FxrHq63qJjtJFquVbEobtA05eOt+qOivoCiVlYJlzfZxcImTXLCIyK/fWWRO1ApCiM/CH2l/+NZX/VAL6EfGFmrtnsI7pHWu2shXNEWprys47ucsQIyN+vcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVn8gl7f57la8NrwrsJocGZRs4ZUQBWOrKjHHm23kXM=;
 b=sulPyj9wMjC4SDqhFLuMW3K3er4otO+MTa58l0DkyYVXkA0KGkulb9gCM+mnVXROs/QjU46TFdC8u6CePADRRpXVWMAU/kR3TtNJ42Q4sTHhcEzi6E3voJhiYPorGIk6m5+J94AmUYjyZV/4Ko1/zB4hOHqD2pNSNbAw7lUACOwje9+TWc2IABkNg74KyYP1OujBQ+cqpEUS9XgyCWSObBsPHyj3DAlkKcrlcc8YQ8aYlpx+KGTJ8dDYwRsgsUQGeBWS0MbN9mk0wVvWzbrZNt2JKhT4W+lVopEM4Hk2xdZZYbnSQW7mYE2qQeNp1GizR7TCbmKZ5ZRAMiAQA7mtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVn8gl7f57la8NrwrsJocGZRs4ZUQBWOrKjHHm23kXM=;
 b=czXVCMfdBVHfqV8m0shKEOfcxII0FbdVRAdZ++iKgJsM7XNoWWP8LflOqjuQg9XJkzd80Xdkv+1tO2tszZM7Ww/aeR3rrGw5cgElNgmVfprqPHmG7Jr4MZ3nx8/LO/37B2Fq2EDWvvtPT2Vrd+glEMCpG6QxGJ7FGy+oLjArE0tv5eeObfEch1oFijoznOf9JlxM4TMnXHUXkJ73VNTOc5++euPPFyoZzBx+Tc4QrrLf76hvKOVf4Y0jZeynJKn7AX0MKPkOuEzZLYQAr3kqFNoG7S8JloRdPEwvphl6jiqidxDAqepqNgts50pzOW3mMR0VZjtYjvkHUSrw/0wEUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 2 Jun
 2025 18:01:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:36 +0000
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
Subject: [PATCH v2 06/10] sched/debug: Add support to change sched_ext server params
Date: Mon,  2 Jun 2025 14:01:02 -0400
Message-ID: <20250602180110.816225-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:408:e1::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 512969ae-4028-4c50-a785-08dda1ff845c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?38VzkAWbtgf39sSF+lPhrTTZSum3n9J5iSPR5T7Djnz83f97fjJjed/cDtJ6?=
 =?us-ascii?Q?5SEj+OmUXW6vwGvPC0gBo3TTccvfkXgkLIz9wOncFQD/K3dNNI8m//O+FA9j?=
 =?us-ascii?Q?4NFJX0U6pTafSUxzj0Yoam9CWnqyVcwpKLex4zqme1h83zQVidUL2n2KPmvA?=
 =?us-ascii?Q?UlerMAPuYE7tRdg3Lh2nsnzXv5koiy7jX/fsHWR3u5lcDeMeceIe9vsHa+Bz?=
 =?us-ascii?Q?LyaAS9j/OUWMfvHSuEpycQ0+ke9RpI4kcEF7ropLeF1Mv6FHW8XTrgV/dlJZ?=
 =?us-ascii?Q?UMzxCtVdf/urSFi24ltzkry7P0YHLbkFRz5tniogvgASPOQ+6obyM+PcinnX?=
 =?us-ascii?Q?rN8Nvuh8HjazQZaKrLXBNKMhFnq7uUfFoay16fV+5PB4K9HZxGF8N4gih0Rd?=
 =?us-ascii?Q?COfNlqS7/z9po9FIETnLtfGyEabtmQcKEenIDg9QGl5oPxWKwjRr2SCTuPjF?=
 =?us-ascii?Q?gpGbzvTjdGr93MfoImrAROIGh6dSjsuYvOq5Yrc8yluk0Bgdmr6fxZHUyHg6?=
 =?us-ascii?Q?23rtWXsOYdttgX9v8H2UdJbrkTcHyv4+o8MmSA0kvspDuzwNxFYVNos7OUN0?=
 =?us-ascii?Q?0/WM15GoGgzq+kZXTQXmMUB8E2edKb/XJfoL7aDjAppu+qqbJ4qAJAcI2uAm?=
 =?us-ascii?Q?lKRK8rdRdz5xeozKbBB9Eo7g+PXQ2R+SUmTGfaRO0oOYNku58d/Guk1VVGZL?=
 =?us-ascii?Q?HoMqp8zs75quZ4AfcpTV4CKO2rbJ7bLzgZzxHmeAzwo33xiLG0cKGzj/hYLE?=
 =?us-ascii?Q?MayzVaQRybTxXQu7pKDt6wp9bM+aRAgGdny7obyygaxIJs9LUL4jziIVkMSR?=
 =?us-ascii?Q?OEokYDaIESrXLmaYmfrQU6aL/mkWH/nLYQjg/L1DoqBrLGJNX8hcHpUKQiiK?=
 =?us-ascii?Q?t3VS+B5cAf2Y7v+XGTrQVcZpUHtanRTYSI9AHW2c8Z2440RCL2uO4qchsXZ5?=
 =?us-ascii?Q?7AEu0T54s6x28SYJPqOzw8Z4b9odX4EzfKutYnaxiy2iO4zC/pwn6gfG55d6?=
 =?us-ascii?Q?QACT1lE4ZrDIrc0RyHDrVzJ2fVnvKe5K9WzSkZIl4aFymoLYJq762L1MO6dX?=
 =?us-ascii?Q?v1JlYNFrfREy2C51p0fe8PfQw2hmbK9WpwDTJIquP4+m/6NqlROw9Z7rzFDO?=
 =?us-ascii?Q?Ssu86pzhkmRlMh+2/A6Cdj1cnpQvV4V91oYO6wri7rgQ73MFReyhgHGVbzdF?=
 =?us-ascii?Q?89xcIYlHovxGsOFrgpobCB/UV/0oGNNn1eLzNA2FLNU9Je/tCpUHgrx7i+RM?=
 =?us-ascii?Q?CiOc50JXBVMVzzcJF5DxdDZ7+JADfjTGyy7IPYqQov4KbG7VaYApcIgZXt0r?=
 =?us-ascii?Q?d41pA6zMyqiEmcmCNP++uSeHM9YFmNfkGxZ1oWnpEpH6T/+XEEAf1JZUIC/y?=
 =?us-ascii?Q?Nz8OR5vPHuHzxokLVmcgAvAWpM8UtuAAVHk88d6dEW3PSfNagJaeRirt2qQl?=
 =?us-ascii?Q?oGBrqmJAv8FbUEosKTAFOXQJZf0jBM0pMMkJvwu2qPd4tLlKzCWIlw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+plqeKzHk3lsNNxqmdGVRcmLG1b4yp0IaVP/NG9GFko0qC+cTJGypF7uOlFf?=
 =?us-ascii?Q?43B0BOJmeHi71vL2bFnT+cG+L+04EvniZ11OEVs+a4fcqWHiMUTh5MF2XPtX?=
 =?us-ascii?Q?VMGlqAgrokrf1UTC/dQuUfB31DxBF/k2Q713dkebqa9ruvZ05s4A3AmKzbLS?=
 =?us-ascii?Q?cV7RvlhUR8RYz/hwM+aLApPiLisOU+ig+63ckOxmNHtDFDld4f1l1RvgM6Sg?=
 =?us-ascii?Q?bX1gAFXmkRkMomsV9yo48zQTp7SInLuUpwLJV/u3g4sywf+KbLXCflOnlM5X?=
 =?us-ascii?Q?iTFRRYOHrtyQcpAmXq+rVP01F8Hq0oypDAy5V1ssKZw6PPBoKXi20FEpeHzp?=
 =?us-ascii?Q?tAD+AWCLfFSQ9xROEuyKNnDQ739kvc5WsbzrIff9PtXLM8TTWVvyp/VpgKzF?=
 =?us-ascii?Q?3cMkbuKVIpPMJD4gsPXHHKklEjY6lKCjRKsii57dPzaMqmrH6rOqUoYPJIsO?=
 =?us-ascii?Q?wXo4MQAkCANtcj1vprwjK4dWGDFEristf56mml+7K4+RXi6fAO7BR9Svbm5S?=
 =?us-ascii?Q?WkQUF6A5WU6jRwl0OwlyeEC3eJf3NNX0m/YhyvvuSs6uUlryO9InGvz5dZWT?=
 =?us-ascii?Q?EsLUR+m1FxdEG03ubkWcaAHX2AiCRv1aiiMBiik3C4NMkVKGUWO8fxZ1Hmnl?=
 =?us-ascii?Q?Mxu7iqVmQQvnepqpAnsE1CzBsvdBsXxGEEOlHDfI+81fXkJYKVSWAP7ER2fT?=
 =?us-ascii?Q?BLLuy3PBG8dnmjgm5eh+J3dtyN7UokvJBmNrdZjSPIIW4wT10phwXxPxX8G6?=
 =?us-ascii?Q?HD7/If/bj5q66Ih7xfLdWUl+0mxrt1DkADxlzZbLHPAmobwi7LDmsidwGpak?=
 =?us-ascii?Q?ws0u86lspEbp8A8KCyp+y78Me4kkASaXYszdofTzKsTYMGTVk7iAT7iYxwvU?=
 =?us-ascii?Q?9qXZABntBQvl6WbK7qJMverVlX7E4tH+YLk2wpuePuvCOxx0Y0wEt1UDQWCa?=
 =?us-ascii?Q?iQdPI4d62fIfCjcsVNHU3jj1Y2/qD9e1gQpiszPsu+83rSeuszFSoilddObL?=
 =?us-ascii?Q?eUmXFRzUxJdOHezjyNmakiGRT5g71nPkeSt4tkq2YjO4WByHNNSPLONlYwaT?=
 =?us-ascii?Q?JlBSmY3W4aIey6Wde/EoVa2kpr6vG6HUeF5HOTxiiC71N4Ja4z50hHowqCTj?=
 =?us-ascii?Q?dHXduzvEQlmUy4wA5MvDLN63BvNdFZqXotFRdTkTb54g50nA5OVOOGLN8zYO?=
 =?us-ascii?Q?XkX16lrbmxm5r6AHbHGYkqzJLkwcCvIqcr1ZhiLDV5AhZnGMJ59CZKapBKYz?=
 =?us-ascii?Q?nCUgKvYcZ4ew+VsGkhH6xMaWH6dw6vA+w6MMjViNYeK9HYBvcPrR9j+V1jsF?=
 =?us-ascii?Q?6hDJE5k/gdc30vzDROiUfFptwhImVAIca/Z53EJ+v2G3fNai1A8vrel3YUBj?=
 =?us-ascii?Q?OMxVEE5qCYIGLpZHMyJlP6VseHEpBFMpf9YxwAY4aoMnt3Wg4ADYppqDbjFa?=
 =?us-ascii?Q?wmrpsOWHx6ihFEzIcPhfIhyajf/iJbfkmuvrTl0YkZF3bPR1n0/BR+GYEnYK?=
 =?us-ascii?Q?lnBaRGJ1l8+jPdNWgsk3QLdPkluE47Hdb0DawkgJXpM74UglC3pmiANhflAN?=
 =?us-ascii?Q?0iv+M3ASjb04FBB0wnEPR1kl1gt2OR1ZMrIwW4rx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512969ae-4028-4c50-a785-08dda1ff845c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:36.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xn2YU/5zXI80ZtJxSJwXf91OquK/VVuDVC0LlTx6UzRsgRiuNoQ4V7q9gAKtPKQaj2pdHF/W3XzrPOD6x63rsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683

When a sched_ext server is loaded, tasks in CFS are converted to run in
sched_ext class. Modify the ext server parameters as well along with the
fair ones.

Re-use the existing interface to modify both ext and fair servers to
keep number of interfaces less (as it is, we have a per-cpu interface).

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 91 ++++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 6866f0a9e88c..f1af2999a8e5 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -341,17 +341,18 @@ enum dl_param {
 	DL_PERIOD,
 };
 
-static unsigned long fair_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
-static unsigned long fair_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
+static unsigned long dl_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
+static unsigned long dl_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
 
-static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubuf,
+static ssize_t sched_dl_server_write(struct file *filp, const char __user *ubuf,
 				       size_t cnt, loff_t *ppos, enum dl_param param)
 {
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
-	bool was_active = false;
+	bool was_active_fair = false;
+	bool was_active_ext = false;
+	int retval = 0, retval2 = 0;
 	u64 runtime, period;
-	int retval = 0;
 	size_t err;
 	u64 value;
 
@@ -377,41 +378,57 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		if (runtime > period ||
-		    period > fair_server_period_max ||
-		    period < fair_server_period_min) {
+		    period > dl_server_period_max ||
+		    period < dl_server_period_min) {
 			return  -EINVAL;
 		}
 
 		if (dl_server_active(&rq->fair_server)) {
-			was_active = true;
+			was_active_fair = true;
 			update_rq_clock(rq);
 			dl_server_stop(&rq->fair_server);
 		}
 
+		if (dl_server_active(&rq->ext_server)) {
+			was_active_ext = true;
+			update_rq_clock(rq);
+			dl_server_stop(&rq->ext_server);
+		}
+
 		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
+		retval2 = dl_server_apply_params(&rq->ext_server, runtime, period, 0);
 
 		if (!runtime)
-			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
+			printk_deferred("Deadline servers are disabled on CPU %d, system may crash due to starvation.\n",
 					cpu_of(rq));
 
-		if (was_active)
+		if (was_active_fair)
 			dl_server_start(&rq->fair_server);
 
+		if (was_active_ext)
+			dl_server_start(&rq->ext_server);
+
 		if (retval < 0)
 			return retval;
+		if (retval2 < 0)
+			return retval2;
 	}
 
 	*ppos += cnt;
 	return cnt;
 }
 
-static size_t sched_fair_server_show(struct seq_file *m, void *v, enum dl_param param)
+static size_t sched_dl_server_show(struct seq_file *m, void *v, enum dl_param param)
 {
 	unsigned long cpu = (unsigned long) m->private;
 	struct rq *rq = cpu_rq(cpu);
 	u64 value;
 
 	switch (param) {
+	/*
+	 * The params for fair server and ext server as set via debugfs
+	 * are the same, so we can just use one of them
+	 */
 	case DL_RUNTIME:
 		value = rq->fair_server.dl_runtime;
 		break;
@@ -426,50 +443,50 @@ static size_t sched_fair_server_show(struct seq_file *m, void *v, enum dl_param
 }
 
 static ssize_t
-sched_fair_server_runtime_write(struct file *filp, const char __user *ubuf,
+sched_dl_server_runtime_write(struct file *filp, const char __user *ubuf,
 				size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_RUNTIME);
+	return sched_dl_server_write(filp, ubuf, cnt, ppos, DL_RUNTIME);
 }
 
-static int sched_fair_server_runtime_show(struct seq_file *m, void *v)
+static int sched_dl_server_runtime_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_RUNTIME);
+	return sched_dl_server_show(m, v, DL_RUNTIME);
 }
 
-static int sched_fair_server_runtime_open(struct inode *inode, struct file *filp)
+static int sched_dl_server_runtime_open(struct inode *inode, struct file *filp)
 {
-	return single_open(filp, sched_fair_server_runtime_show, inode->i_private);
+	return single_open(filp, sched_dl_server_runtime_show, inode->i_private);
 }
 
-static const struct file_operations fair_server_runtime_fops = {
-	.open		= sched_fair_server_runtime_open,
-	.write		= sched_fair_server_runtime_write,
+static const struct file_operations dl_server_runtime_fops = {
+	.open		= sched_dl_server_runtime_open,
+	.write		= sched_dl_server_runtime_write,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
 	.release	= single_release,
 };
 
 static ssize_t
-sched_fair_server_period_write(struct file *filp, const char __user *ubuf,
+sched_dl_server_period_write(struct file *filp, const char __user *ubuf,
 			       size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_PERIOD);
+	return sched_dl_server_write(filp, ubuf, cnt, ppos, DL_PERIOD);
 }
 
-static int sched_fair_server_period_show(struct seq_file *m, void *v)
+static int sched_dl_server_period_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_PERIOD);
+	return sched_dl_server_show(m, v, DL_PERIOD);
 }
 
-static int sched_fair_server_period_open(struct inode *inode, struct file *filp)
+static int sched_dl_server_period_open(struct inode *inode, struct file *filp)
 {
-	return single_open(filp, sched_fair_server_period_show, inode->i_private);
+	return single_open(filp, sched_dl_server_period_show, inode->i_private);
 }
 
-static const struct file_operations fair_server_period_fops = {
-	.open		= sched_fair_server_period_open,
-	.write		= sched_fair_server_period_write,
+static const struct file_operations dl_server_period_fops = {
+	.open		= sched_dl_server_period_open,
+	.write		= sched_dl_server_period_write,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
 	.release	= single_release,
@@ -477,13 +494,13 @@ static const struct file_operations fair_server_period_fops = {
 
 static struct dentry *debugfs_sched;
 
-static void debugfs_fair_server_init(void)
+static void debugfs_dl_server_init(void)
 {
-	struct dentry *d_fair;
+	struct dentry *d_server;
 	unsigned long cpu;
 
-	d_fair = debugfs_create_dir("fair_server", debugfs_sched);
-	if (!d_fair)
+	d_server = debugfs_create_dir("dl_server", debugfs_sched);
+	if (!d_server)
 		return;
 
 	for_each_possible_cpu(cpu) {
@@ -491,10 +508,10 @@ static void debugfs_fair_server_init(void)
 		char buf[32];
 
 		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
-		d_cpu = debugfs_create_dir(buf, d_fair);
+		d_cpu = debugfs_create_dir(buf, d_server);
 
-		debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &fair_server_runtime_fops);
-		debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &fair_server_period_fops);
+		debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &dl_server_runtime_fops);
+		debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &dl_server_period_fops);
 	}
 }
 
@@ -537,7 +554,7 @@ static __init int sched_init_debug(void)
 
 	debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
 
-	debugfs_fair_server_init();
+	debugfs_dl_server_init();
 
 	return 0;
 }
-- 
2.43.0

