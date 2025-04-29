Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC026187550
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898479; cv=fail; b=GZvBpuuBp+MR5TCqzQ7ONbEQKGXEsNJ9jflQgDCc6vi6XleUKQl+p47yTZBEfG6uhidz8bRbEbxx5mUUqrueVMXIpEuVe2KEQlxPRneHBu15RKlzutyQUmDzoH8XIUVaA3G38Rrt1/VCZkhI3HcZftGnMuqNWNxBOvF0U4p9ffQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898479; c=relaxed/simple;
	bh=eTTfMAC4rspxdBYNcncqpLA6hd8dPILWrPn3mCgKuUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S7BPGOGaJrr3WeWrmQCfq2XuUfLPvwWXaEtR8Ff0AzkNVMND1wqXvGx0PZGKQfZF+Kg0qG8fqSZ4BlcMHrguKzOtabpx+8xC2Z1vEgd62pfoibh0kWUZoZOZz3lrblfTBzwjX/9LIvGFv3DDmz+wkKtDeWA9NeBntsJDv57PSMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NDs823NL; arc=fail smtp.client-ip=40.107.93.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NDs823NL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7NyRInQdwnXdBD5Of2W91UdZJwuCglEL+dQNG6jtT18dSotlRrYsKnZVRhtrJ6Z8fExN7HG8tFS/PC00Esnl/VXwqmIseArhvo0ohU7Eyj/VHpDE6FkwoEFjdyHDZ/LLGhvWCjHlwcsh3HcbP6/tG0DSOiEQrYSHP5ayTp4hIW6RvUog7HYdYRwD0o50EPmtiXesKXh8TKwKf1OML0PYt6kW2LVmxeYVWMNgBE+3ofBrSL9pU/3lTuCSUwJRSZYjd5qDmMxkbay3veqZcmtWOc9AOJbvB6/7mk0lT/Ih3tyWwLUAdjTp0usyHdIw56qZ/vtb6rPHWQs9LvHgPufDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UtuXgJto1J1NZe8htNoC/VySuSqkkO28kinJNcbSWE=;
 b=x7N5Z73rJerNKA98+xrP6y1OZRHML0MN2sRwBdt4aBTPYyAnvxh5HECOahyMNkdA3ief4BKTdUbrizApWhPG7eU2szKjH7cSxqCjDODrGM9w3pMGWszQG2MoPdbuo20HeBb2JcTfRCLcIs9Vcvs+JHjF9C0ZeD1FnR453zEFKEBYGR4eMrMmBUrxltEsF/GJtXc306uGa5FlPZG6dqsFrFRdYwAOfh+pw/5ohylYrzmtZFGDme0YP/3ve4fFfdfQ1MlP2cHgfU19I2uE+6ix1qh3T8fUBjNlIwxOchE/OBagOBMn6W/X/DzyYmQ5/yX6Rj7bMT0hAEIHPurKxN+a5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UtuXgJto1J1NZe8htNoC/VySuSqkkO28kinJNcbSWE=;
 b=NDs823NLvVqV4D6RjJUW/H4wmU0BiFiHxtkstRGNRptln6VxpcwA5Dj0HWlD2FEtLgk30WSQpKkTbR2CwanY4LsYRTCQusSwrRVQOrqqTzeydi5fsQwen7ZeVQWBSAwMnnWmS6SGBBllAH949ChamSN4dVkNwIQmmM6QYP4DmB4=
Received: from SN6PR08CA0011.namprd08.prod.outlook.com (2603:10b6:805:66::24)
 by SA3PR12MB7974.namprd12.prod.outlook.com (2603:10b6:806:307::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 03:47:51 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::ff) by SN6PR08CA0011.outlook.office365.com
 (2603:10b6:805:66::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 03:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 03:47:51 +0000
Received: from [10.136.42.115] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 22:47:46 -0500
Message-ID: <7c5fcd32-1f0f-4148-ab0e-0a25ea11c10f@amd.com>
Date: Tue, 29 Apr 2025 09:17:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] sched: Introduce Cache aware scheduling
To: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	"Ingo Molnar" <mingo@redhat.com>, "Gautham R . Shenoy"
	<gautham.shenoy@amd.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, <linux-kernel@vger.kernel.org>
References: <cover.1745199017.git.yu.c.chen@intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <cover.1745199017.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|SA3PR12MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 403f36a9-0595-4d49-4f30-08dd86d09da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V080ZERnTkhLVTdRK1MrdjRCUERyVFE3SkFyb2NzL2FPVTBOTVhTVEFSZW80?=
 =?utf-8?B?c0dsa3JZRmQ3OGwrZzc0ZFNPK1FtWDhRTWVoWWdCQ084ekwzWTJTS1VVUUNC?=
 =?utf-8?B?aWE3V3F4N1hKWjh0Vi9YNGFDTHVMSzV2bkNYQlR1TURLekhGVURkSmdRaTFV?=
 =?utf-8?B?QlNrNVVBMlVadVNURmVLQzllTHlZeElaNStMYTczWWZZazF1Uk1LTmZQaGh6?=
 =?utf-8?B?SDRrZy9QTWg4VXFUNXczeDdidUYzeGFKeGY1MlFrUU4ybTZScHZodm9LRkx3?=
 =?utf-8?B?MCtJY2MyOVBONUN2bUl1eTdXTlYxQmRPY2lVclVMcnhrRzJJOFZ4bEZhMDhk?=
 =?utf-8?B?aktpcExaSzZCYmMvWk9VeXdvUUxRYkpVaDVQemx0WGliYm9zN1Q4Y3JldUdG?=
 =?utf-8?B?L05HaEhIRnpaVUEyUEFrZzNJSHFlYzc4ZVVlNjhvS3VoOFE0NEZPMVFua21I?=
 =?utf-8?B?YjAzZkkzSUF1dWh4NlpIMWQzWFFnN2hxWk1VM2JtQWdLV3VaaTIzTGZNanEw?=
 =?utf-8?B?dEc5R1NvK2FZMlJIa3UzVlh1bjY4d3M4Nko4Z3JBNE9vcTN0RFdreUpRUllo?=
 =?utf-8?B?MitwRE5TN3djb2FmeFQxOW00N3JiZkloQkxwSXU0K0Nvc0kxK28zenc4WGJV?=
 =?utf-8?B?akNsc3NTczNubzgxVGx0bDczNENmYnF3VU9UaGsxd3JidzYwclk5STAvZjR1?=
 =?utf-8?B?S0grY01vdUlrZ0ZSOG0wc3R3U1RNV3FXTTFIaFZQbFRTdm5UbHRoNnhodjZT?=
 =?utf-8?B?SVM0SDVIc0FEWHo2aVVaTjBXdlZLWXVROG5ZRmM3WXdOQkZiSnErMlU2QWVx?=
 =?utf-8?B?aGhxNjNOM0hYSWJTMUM5dHk2d2VVRTVjUW9zVjJnOHJiZlJBSnh3YktMdTY5?=
 =?utf-8?B?WXh1bW53dENCaUdmOVJjUTNpU1Bkeng3Mk1GaGYwY1RWVGNlcXFIQWh1U211?=
 =?utf-8?B?aHRJY25odUIyMVV1ZVE1cUpEOGprZks5NHA3UUU4bWRHTVhWaWdSMkVxTlJa?=
 =?utf-8?B?V2w1ZjNmUGgzQmE1eEZ4YlphU1RhblFtQTNZdXZJblJTejIwWWVsVXIzU3B1?=
 =?utf-8?B?dmRjWWxmYm1pcUMxV0x5VTc1SjRrRVVobmpEUDNNSU1aUmVpOUE5WHlWRWo3?=
 =?utf-8?B?ZHBTdlQwQWpGdTdZK1hveWhzWTBjZXBoUnlOQTRTVHlYTjlPNHRHZ2E0dUN6?=
 =?utf-8?B?dlZreG1hUEZXc2hvM0tuZUFoYlhFUFArbzV2cFdWNjlJcXcxcm5kdW4wQWFK?=
 =?utf-8?B?YWVTQS9DODBoUDlWa051VXJtcFNPQW83LzYxWDhpU3JUVnhxNnhkUUpMd3By?=
 =?utf-8?B?VXlWRFBkbjlZWGdHSGlsRndWOTBKeXNvS2YvbDhObm5HRDdOV1ZTRGdkaVhB?=
 =?utf-8?B?TFJ0K1FsaHRPZGc2ZVpVT1FpOVlReU9HM2RHNk4zV1l1MVZ3bjlzdTlCSTIw?=
 =?utf-8?B?NmFZd0NDUFV3Y0Y2Slp5L3pSZFBCUDlnb2dYd2pjcWdrc0tFUDNCenRMdVZm?=
 =?utf-8?B?eEYwNEhiQ01mc0xEb2xyN3d6VXNuUmVEdlBpNnZubWdTOTNLR0loNGRJWFhv?=
 =?utf-8?B?bkZUdm5sMll6OXhnV242bXNpSGdGc1Zhbk90NzgwV3ErVkRlbW1NZlVnTE4v?=
 =?utf-8?B?aDhHS3VKQnhzR2c0emhJV1VvZUMvbjRVUllndXFvMHVvemdKOFI5Qjd5dTZW?=
 =?utf-8?B?R0NBdHltVHZDZnJ2WXJyS244NGdWSCttckhsbTN6dUlnektqRzMwZ1pKcE5X?=
 =?utf-8?B?N0FSUWxDMEJjVm4xaFNiVGNkWkNTb2p6czZBY1dQMjhGaEFMU093OE5ackxL?=
 =?utf-8?B?NkEyMzZaK0hMdFQ3R3U2N29HQnV2VzJMdTllY2M5SDhoNEMwQ1QrR1FzL3Ux?=
 =?utf-8?B?R2ZiWDZLVnVKYUlYVEtoZ0Z2anV5YzVMR1QrMnREVnlZb0ZZS3U1Q2dDR3J5?=
 =?utf-8?B?eEJ6cWJ3RXo2Nko1Qmt6NE9WTUJ6WW1VR3A5SUlLTVZOcGUyZzFGaitiQkE2?=
 =?utf-8?B?dzQ3eXk5dkFhQUF6OUR2cEJubGpKclVUcW9ZZUVDZVY2TU1odTVjQWJQOXNB?=
 =?utf-8?B?OGRkRTRlM0tiM3RFcTNKL20ydnlXcG02R1BTUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 03:47:51.1907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403f36a9-0595-4d49-4f30-08dd86d09da2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7974

Hello Chenyu,

On 4/21/2025 8:53 AM, Chen Yu wrote:
> This is a respin of the cache-aware scheduling proposed by Peter[1].
> In this patch set, some known issues in [1] were addressed, and the performance
> regression was investigated and mitigated.
> 
> Cache-aware scheduling aims to aggregate tasks with potential shared resources
> into the same cache domain. This approach enhances cache locality, thereby optimizing
> system performance by reducing cache misses and improving data access efficiency.
> 
> In the current implementation, threads within the same process are considered as
> entities that potentially share resources. Cache-aware scheduling monitors the CPU
> occupancy of each cache domain for every process. Based on this monitoring, it endeavors
> to migrate threads within a given process to its cache-hot domains, with the goal of
> maximizing cache locality.
> 
> Patch 1 constitutes the fundamental cache-aware scheduling. It is the same patch as [1].
> Patch 2 comprises a series of fixes for Patch 1, including compiling warnings and functional
> fixes.
> Patch 3 fixes performance degradation that arise from excessive task migrations within the
> preferred LLC domain.
> Patch 4 further alleviates performance regressions when the preferred LLC becomes saturated.
> Patch 5 introduces ftrace events, which is used to track task migrations triggered by wakeup
> and load balancer. This addition facilitate performance regression analysis.
> 
> The patch set is applied on top of v6.14 sched/core,
> commit 4ba7518327c6 ("sched/debug: Print the local group's asym_prefer_cpu")
> 

Thank you for working on this! I have been a bit preoccupied but I
promise to look into the regressions I've reported below sometime
this week and report back soon on what seems to make them unhappy.

tl;dr

o Most regressions aren't as severe as v1 thanks to all the work
   from you and Abel.

o I too see schbench regress in fully loaded cases but the old
   schbench tail latencies improve when #threads < #CPUs in LLC

o There is a consistent regression in tbench - what I presume is
   happening there is all threads of "tbench_srv" share an mm and
   and all the tbench clients share an mm but for best performance,
   the wakeups between client and server must be local (same core /
   same LLC) but either the cost of additional search build up or
   the clients get co-located as one set of entities and the
   servers get colocated as another set of entities leading to
   mostly remote wakeups.

   Not too sure if netperf has similar architecture as tbench but
   that too sees a regression.

o Longer running benchmarks see a regression. Still not sure if
   this is because of additional search or something else.

I'll leave the full results below:

o Machine details

- 3rd Generation EPYC System
- 2 sockets each with 64C/128T
- NPS1 (Each socket is a NUMA node)
- C2 Disabled (POLL and C1(MWAIT) remained enabled)

o Benchmark results

   ==================================================================
   Test          : hackbench
   Units         : Normalized time in seconds
   Interpretation: Lower is better
   Statistic     : AMean
   ==================================================================
   Case:           tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
    1-groups     1.00 [ -0.00]( 9.02)     1.03 [ -3.38](11.44)
    2-groups     1.00 [ -0.00]( 6.86)     0.98 [  2.20]( 6.61)
    4-groups     1.00 [ -0.00]( 2.73)     1.00 [  0.42]( 4.00)
    8-groups     1.00 [ -0.00]( 1.21)     1.04 [ -4.00]( 5.59)
   16-groups     1.00 [ -0.00]( 0.97)     1.01 [ -0.52]( 2.12)


   ==================================================================
   Test          : tbench
   Units         : Normalized throughput
   Interpretation: Higher is better
   Statistic     : AMean
   ==================================================================
   Clients:    tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
       1     1.00 [  0.00]( 0.67)     0.96 [ -3.95]( 0.55)
       2     1.00 [  0.00]( 0.85)     0.98 [ -1.69]( 0.65)
       4     1.00 [  0.00]( 0.52)     0.96 [ -3.68]( 0.09)
       8     1.00 [  0.00]( 0.92)     0.96 [ -4.06]( 0.43)
      16     1.00 [  0.00]( 1.01)     0.95 [ -5.19]( 1.65)
      32     1.00 [  0.00]( 1.35)     0.95 [ -4.79]( 0.29)
      64     1.00 [  0.00]( 1.22)     0.94 [ -6.49]( 1.46)
     128     1.00 [  0.00]( 2.39)     0.92 [ -7.61]( 1.41)
     256     1.00 [  0.00]( 1.83)     0.92 [ -8.24]( 0.35)
     512     1.00 [  0.00]( 0.17)     0.93 [ -7.08]( 0.22)
    1024     1.00 [  0.00]( 0.31)     0.91 [ -8.57]( 0.29)


   ==================================================================
   Test          : stream-10
   Units         : Normalized Bandwidth, MB/s
   Interpretation: Higher is better
   Statistic     : HMean
   ==================================================================
   Test:       tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
    Copy     1.00 [  0.00]( 8.24)     1.03 [  2.66]( 6.15)
   Scale     1.00 [  0.00]( 5.62)     0.99 [ -1.43]( 6.32)
     Add     1.00 [  0.00]( 6.18)     0.97 [ -3.12]( 5.70)
   Triad     1.00 [  0.00]( 5.29)     1.01 [  1.31]( 3.82)


   ==================================================================
   Test          : stream-100
   Units         : Normalized Bandwidth, MB/s
   Interpretation: Higher is better
   Statistic     : HMean
   ==================================================================
   Test:       tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
    Copy     1.00 [  0.00]( 2.92)     0.99 [ -1.47]( 5.02)
   Scale     1.00 [  0.00]( 4.80)     0.98 [ -2.08]( 5.53)
     Add     1.00 [  0.00]( 4.35)     0.98 [ -1.85]( 4.26)
   Triad     1.00 [  0.00]( 2.30)     0.99 [ -0.84]( 1.83)


   ==================================================================
   Test          : netperf
   Units         : Normalized Througput
   Interpretation: Higher is better
   Statistic     : AMean
   ==================================================================
   Clients:         tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
    1-clients     1.00 [  0.00]( 0.17)     0.97 [ -2.55]( 0.50)
    2-clients     1.00 [  0.00]( 0.77)     0.97 [ -2.52]( 0.20)
    4-clients     1.00 [  0.00]( 0.93)     0.97 [ -3.30]( 0.54)
    8-clients     1.00 [  0.00]( 0.87)     0.96 [ -3.98]( 1.19)
   16-clients     1.00 [  0.00]( 1.15)     0.96 [ -4.16]( 1.06)
   32-clients     1.00 [  0.00]( 1.00)     0.95 [ -5.47]( 0.96)
   64-clients     1.00 [  0.00]( 1.37)     0.94 [ -5.75]( 1.64)
   128-clients    1.00 [  0.00]( 0.99)     0.92 [ -8.50]( 1.49)
   256-clients    1.00 [  0.00]( 3.23)     0.90 [-10.22]( 2.86)
   512-clients    1.00 [  0.00](58.43)     0.90 [-10.28](47.59)


   ==================================================================
   Test          : schbench
   Units         : Normalized 99th percentile latency in us
   Interpretation: Lower is better
   Statistic     : Median
   ==================================================================
   #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
     1     1.00 [ -0.00]( 5.59)     0.55 [ 45.00](11.17)
     2     1.00 [ -0.00](14.29)     0.52 [ 47.62]( 7.53)
     4     1.00 [ -0.00]( 1.24)     0.57 [ 42.55]( 5.73)
     8     1.00 [ -0.00](11.16)     1.06 [ -6.12]( 2.92)
    16     1.00 [ -0.00]( 6.81)     1.12 [-12.28](11.09)
    32     1.00 [ -0.00]( 6.99)     1.05 [ -5.26](12.48)
    64     1.00 [ -0.00]( 6.00)     0.96 [  4.21](18.31)
   128     1.00 [ -0.00]( 3.26)     1.63 [-62.84](36.71)
   256     1.00 [ -0.00](19.29)     0.97 [  3.25]( 4.94)
   512     1.00 [ -0.00]( 1.48)     1.05 [ -4.71]( 5.11)


   ==================================================================
   Test          : new-schbench-requests-per-second
   Units         : Normalized Requests per second
   Interpretation: Higher is better
   Statistic     : Median
   ==================================================================
   #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
     1     1.00 [  0.00]( 0.00)     0.95 [ -4.99]( 0.48)
     2     1.00 [  0.00]( 0.26)     0.96 [ -3.82]( 0.55)
     4     1.00 [  0.00]( 0.15)     0.95 [ -4.96]( 0.27)
     8     1.00 [  0.00]( 0.15)     0.99 [ -0.58]( 0.00)
    16     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.15)
    32     1.00 [  0.00]( 4.88)     1.04 [  4.27]( 2.42)
    64     1.00 [  0.00]( 5.57)     0.87 [-13.10](11.51)
   128     1.00 [  0.00]( 0.34)     0.97 [ -3.13]( 0.58)
   256     1.00 [  0.00]( 1.95)     1.02 [  1.83]( 0.15)
   512     1.00 [  0.00]( 0.44)     1.00 [  0.48]( 0.12)


   ==================================================================
   Test          : new-schbench-wakeup-latency
   Units         : Normalized 99th percentile latency in us
   Interpretation: Lower is better
   Statistic     : Median
   ==================================================================
   #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
     1     1.00 [ -0.00]( 4.19)     1.00 [ -0.00](14.91)
     2     1.00 [ -0.00]( 3.78)     0.93 [  7.14]( 0.00)
     4     1.00 [ -0.00]( 8.91)     0.80 [ 20.00]( 4.43)
     8     1.00 [ -0.00]( 7.45)     1.00 [ -0.00]( 7.45)
    16     1.00 [ -0.00]( 4.08)     1.00 [ -0.00](10.79)
    32     1.00 [ -0.00](16.90)     0.93 [  6.67](10.00)
    64     1.00 [ -0.00]( 9.11)     1.12 [-12.50]( 0.00)
   128     1.00 [ -0.00]( 7.05)     2.43 [-142.86](24.47)
   256     1.00 [ -0.00]( 4.32)     1.02 [ -2.34]( 1.20)
   512     1.00 [ -0.00]( 0.35)     1.01 [ -0.77]( 0.40)


   ==================================================================
   Test          : new-schbench-request-latency
   Units         : Normalized 99th percentile latency in us
   Interpretation: Lower is better
   Statistic     : Median
   ==================================================================
   #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
     1     1.00 [ -0.00]( 0.78)     1.16 [-15.70]( 2.14)
     2     1.00 [ -0.00]( 0.81)     1.13 [-13.11]( 0.62)
     4     1.00 [ -0.00]( 0.24)     1.26 [-26.11](16.43)
     8     1.00 [ -0.00]( 1.30)     1.03 [ -3.46]( 0.81)
    16     1.00 [ -0.00]( 1.11)     1.02 [ -2.12]( 1.85)
    32     1.00 [ -0.00]( 5.94)     0.96 [  4.05]( 4.48)
    64     1.00 [ -0.00]( 6.27)     1.06 [ -6.01]( 6.67)
   128     1.00 [ -0.00]( 0.21)     1.12 [-12.31]( 2.61)
   256     1.00 [ -0.00](13.73)     1.06 [ -6.30]( 3.37)
   512     1.00 [ -0.00]( 0.95)     1.05 [ -4.85]( 0.61)


   ==================================================================
   Test          : Various longer running benchmarks
   Units         : %diff in throughput reported
   Interpretation: Higher is better
   Statistic     : Median
   ==================================================================
   Benchmarks:                 %diff
   ycsb-cassandra              -1.21%
   ycsb-mongodb                -0.69%

   deathstarbench-1x           -7.40%
   deathstarbench-2x           -3.80%
   deathstarbench-3x           -3.99%
   deathstarbench-6x           -3.02%

   hammerdb+mysql 16VU         -2.59%
   hammerdb+mysql 64VU         -1.05%


Also, could you fold the below diff into your Patch2:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index eb5a2572b4f8..6c51dd2b7b32 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7694,8 +7694,6 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
  	int i, cpu, idle_cpu = -1, nr = INT_MAX;
  	struct sched_domain_shared *sd_share;
  
-	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
-
  	if (sched_feat(SIS_UTIL)) {
  		sd_share = rcu_dereference(per_cpu(sd_llc_shared, target));
  		if (sd_share) {
@@ -7707,6 +7705,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
  		}
  	}
  
+	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
+
  	if (static_branch_unlikely(&sched_cluster_active)) {
  		struct sched_group *sg = sd->groups;
  
---

If the SIS_UTIL cut off hits, that result of the cpumask_and() is of no
use. To save some additional cycles, especially in cases where we target
the LLC frequently and the search bails out because the LLC is busy,
this overhead can be easily avoided. Since select_idle_cpu() can now be
called twice per wakeup, this overhead can be visible in benchmarks like
hackbench.

-- 
Thanks and Regards,
Prateek

> schbench was tested on EMR and Zen3 Milan. An improvement in tail latency was observed when
> the LLC was underloaded; however, some regressions were still evident when the LLC was
> saturated. Additionally, the load balance should be adjusted to further address these
> regressions.
> 
> [1] https://lore.kernel.org/all/20250325120952.GJ36322@noisy.programming.kicks-ass.net/
> 
> 
> Chen Yu (4):
>    sched: Several fixes for cache aware scheduling
>    sched: Avoid task migration within its preferred LLC
>    sched: Inhibit cache aware scheduling if the preferred LLC is over
>      aggregated
>    sched: Add ftrace to track task migration and load balance within and
>      across LLC
> 
> Peter Zijlstra (1):
>    sched: Cache aware load-balancing
> 
