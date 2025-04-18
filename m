Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71463267F42
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744953978; cv=fail; b=TL/AciCYUkekp5dhdfCWeNBtLfQClNw2mYCDYr17k2MiQF2vVrsHDYOrFmIbcmJls1j90GuYR419//I28fo7+Q4lhl1w/JbXaHCZlwUBGcXiUzcEyp5vA4guVMWPqGkArqIuBJZnBQ89bCgupCS53dq468EtbHbyatMP+1gobQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744953978; c=relaxed/simple;
	bh=1HSigN/2/zJaS2dhfeUlYis23zRR5GnNsWHugEsC92Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b9NLH8xc7AyuxD1MJ/E4uhNzmfYOvwKfwbBxnyhQ6/yVWsEbQcdi9fq51B28R5mRol/JOyig9QL0SKyoCJjF5D7zl4ypWDz3/Lpd33iysHr9rO0uvQ5miuMBw//97kXEE+5Oh6kiXQxgX4Il5MI+v0Zsr3uzLz15jm7JKqPHk8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jzXOZe3+; arc=fail smtp.client-ip=40.107.96.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jzXOZe3+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twYcuSkug+vhEPhvBr9WWDTKpA36wFJNZIOhH9oJI+HLMWYw41p7njTJByQmrJmUZz1+y5iN9hp3RHsszDSP+DAW1gwFPaEMIdOsF5NHGwD9PBVT/bXceuzALQf1/KHuFrYl0BtIZ8gFWsCIDDz8nsw/axD06wvuP4bAQ7uFHYtudxj/xTJbIv0IQOCA7tFBXT6gLn0Fuqq0Mf7HLuxQmzMCJNRdP9vkWswd2uGlqlF1wOKXPYiMG84Lnaj2AqatrHyTVZOv6UGxuJ9rLFuD0eB/9uHBpeCZqkuSwXojbwx6YXA+/tO71MvspCIy3KaKh4lSXfXxJGH23sN+h7aD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOpZmL+fCf/coZc4/9t6R2OzoUOk86u6Y5/kBSiZ67s=;
 b=CSQ9MQY8edwS10En2lIVWy3VkFWoYXG4vTVqDiyGbAXU2UlpMCaG+M15T4oYg9iX7HNZZtiFDrs3zu0t/ge/gAGMuEs1kPHbOzsnfB2v0+7YpoOXc1MpNMaLt8BQvRd8D1tbTqF0nPtTyScMae6IqpsV6uK/4exWXXdpIRAOIaO0QqHb/2GVWnEg6sXU48OkIbfKq9LRX9I9eeXTb4RuMgn7yMQejqllLbERBBXmy0Li0yKuJ3QdzCwB9uhdoFZqZvAFNN8JjXn+KKAGCCVoIEPjeaMFBbWzfwvUxir+Euwnq8f//E9mjqgKGpVjxDwvte2kByYfEI680XtBRziOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOpZmL+fCf/coZc4/9t6R2OzoUOk86u6Y5/kBSiZ67s=;
 b=jzXOZe3+SOJ3aFPrtQuLoNKbStgBwP8xiAxYIaF9SW63VABMkDQiAB9oRsS7KbEL6K13mXdqot5VFIAg/Hu8F8ZQ0GSnvop1OA/2U2udy4pvWflplTm9BZ1Fct0VcnnW3WfloqpRWVirvW/fC3A4NwOwi85VkBD3naVtq0OwqNo=
Received: from CH2PR02CA0009.namprd02.prod.outlook.com (2603:10b6:610:4e::19)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.37; Fri, 18 Apr
 2025 05:26:10 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:4e:cafe::5) by CH2PR02CA0009.outlook.office365.com
 (2603:10b6:610:4e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 05:26:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Fri, 18 Apr 2025 05:26:09 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 00:26:06 -0500
Message-ID: <87728994-b928-45b3-a6a0-258af6e81294@amd.com>
Date: Fri, 18 Apr 2025 10:56:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Peter Zijlstra <peterz@infradead.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>, Shrikanth Hegde
	<sshegde@linux.ibm.com>, "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Doug Nelson
	<doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>,
	<linux-kernel@vger.kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
 <7a5a5f1f-0bbc-4a63-b2aa-67bc6c724b2d@amd.com>
 <20250417120130.GE17910@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250417120130.GE17910@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 14196abe-1c1e-4f64-e43d-08dd7e398701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWZRcWN4bEw5WUZZRFliWFJ3U09UaTd1NUplaTV1ckowaEdETkVNSWlwdUFV?=
 =?utf-8?B?Mm02Z3Yrb2l2aTRwZ01CbEphL3NnTWo1ektYRVJ0QWFYWlQzQ1RJajBENy9k?=
 =?utf-8?B?elF3dWNBaXF2TEdVNC8xdUh1L0V2bEpsN3REZ3lQK0E4RzJsdENwTE5xTG5I?=
 =?utf-8?B?SEtDcldacTdoaXFzYUVtOCs5NjVKTGZjQVcraUpiY0hBWGxBV1RnLzFoUXdn?=
 =?utf-8?B?RkhWaEdqcm5FaDlta1oxdWFURDI5d2dpUHB6M3BnMmEzWG4rT0l5UEpvaHRo?=
 =?utf-8?B?T3FxOWdQU1JoQTVzWTdWd3F3Zm9FTnpBSmFXeUJQNmczdUIzNlpPSW4yMGhX?=
 =?utf-8?B?SHhRUEhoMEJ3TklnTWhSV0VXTlpQd24rbEhJTElFSFhMQkVTTkhmbXhPdTJG?=
 =?utf-8?B?b1p2cG5DMjdnc2VsZ3hlNmVsUlBUSUFmckZzZ0pBMFpnV3J0b1k1WSs2QVZZ?=
 =?utf-8?B?OHVuTUQwbHppbEcwTkd0djlSNFJVN25pbHprNFNnbXpuOFlva21TeUJaMWRr?=
 =?utf-8?B?TUZHTHNRVEJldkdFY0JRYkpoTUJreDVZaE9vT205b3JLR1VmU01UdVRYYnkw?=
 =?utf-8?B?eDU5ME03V25RYmgyenJTQTl6a2dsVVZBTHpkYS9uVmlMMm1XQVczZ3d6dzJv?=
 =?utf-8?B?MUFBem1UZnZKQlVHSXgxQTN6RFNQUWpsajdTOGtnSCtSd0wreW4wald6S3BQ?=
 =?utf-8?B?cDczN3d3RGViUFVtakNGYWV4djBqcHZ4N3V0NVFyQ1M0T0RuMGdhMVkwMjlJ?=
 =?utf-8?B?SmdnZHdoL0xaVFovb1p1aXZsMTRFclN3VEcyRlNhYXdGV0tPNVZkRjIzQVdl?=
 =?utf-8?B?V01UVXZoUDE5dlRJN003eU5UVHV1YjQvOG12ak5XUWp0SWlNZm5iZ3ZwTnY0?=
 =?utf-8?B?MHppeWJJNFlmK0xuYjZUa0h3WHNGSk55Z2VpdHQrbmtDaDJYa3FnMzEvVGxu?=
 =?utf-8?B?a2wxbVcveFdTQzJ6OCtVY21HMThNeUdmTXlyMklJMURDZ3hZejE1OWUvd3Zm?=
 =?utf-8?B?azRqemhSMjdLV0hTSGhnblRxa2JTbE8wSmFUWjRZSGFDK3pBVkJPdHNkZkV3?=
 =?utf-8?B?b2VITWt2NUZuVlVINzZwczVidzVlcis3N0VpM2xqWFAwSGU2UkhTcXVUVG5n?=
 =?utf-8?B?UXVVNW9EL1hWWWFaVHdGSUp1WVdyWnhibnFWY3VNSnRVa3pHNWxjQWlEV0xS?=
 =?utf-8?B?cXlKSzZFRUozTjM0OXBhbUg1RGplOHFTd2NKZmtsN2QvSGJ0SHRrbUZweExy?=
 =?utf-8?B?ekhRNFkwRlNMUmhEOTNlSjNZRU11Y2dPQUtPRVpKek51bkd2RHB2b0ZaZDI3?=
 =?utf-8?B?ZmVyVkdYaFo2ZzVlUGVXaVRsYlErU0JzNFdHVU9FL2NHd00veHltQUFwV1lQ?=
 =?utf-8?B?MkMrWEpob0dPZDl4ZWowaThjS2NlTHEvNTV4WUQ2Z3lDVUNINU9NZVU2WW43?=
 =?utf-8?B?VXUybDk4UHpSTzlrRUswaXdJVWFkeGM2YWNvdjVKYTdITUtyTVh2d1NiZmtF?=
 =?utf-8?B?SGRRQ0xWVHlTS3Ftd1JOYkhjdEIrZ0hhYXYwWUZUTkZoTU9zcnloVURIaFJ3?=
 =?utf-8?B?VWFaU2xNdGh2VkIzSi9Majd0eXNhWm1ScTFLMkhXOWQveWVSWkd5SjlDYnM2?=
 =?utf-8?B?czJQZzczUnhyYTh0dWZvOXNld2k5cWJJeGViVndGbStOOTA3OStWbSt1R2xo?=
 =?utf-8?B?TXVsQWdJYkJXNHZGNTNiTnh6YVZkeXF4TXVzUmxGQThTZGh4TEIvRzFiSUkz?=
 =?utf-8?B?UDdkNlRrc0l3RCsydVYzM1YvK2R0dXRLMS93dWNVVTllb2ZCYzVwNFdNSEFy?=
 =?utf-8?B?Z0E4NDR2WHJvQjlvQVd3ZkNLU2svK0cxRDdrQjBjdlR0d1h4Tk9yR01FbEpD?=
 =?utf-8?B?VlM5TDhjTmgxcllxNjI2WXdXVWVEN2pBRU1oOHlFZExlVGZxRGRrYTN5YnNw?=
 =?utf-8?B?UDFINUdQRUxWeS83L29XM2pSd0I2SFM0QlhCdlJXdjYwbFUza1NZeXNRMzJr?=
 =?utf-8?B?VEhiWU42R3hJbWxCZHppS3k3RytyTDYyNzlGZHhIWjBkSFpaLzhLZ05UM1hn?=
 =?utf-8?Q?TKIpXe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 05:26:09.9117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14196abe-1c1e-4f64-e43d-08dd7e398701
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151

Hello Peter,

On 4/17/2025 5:31 PM, Peter Zijlstra wrote:
>> o Since this is a single flag across the entire system, it also implies
>>    CPUs cannon concurrently do load balancing across different NUMA
>>    domains which seems reasonable since a load balance at lower NUMA
>>    domain can potentially change the "nr_numa_running" and
>>    "nr_preferred_running" stats for the higher domain but if this is the
>>    case, a newidle balance at lower NUMA domain can interfere with a
>>    concurrent busy / newidle load balancing at higher NUMA domain.
>>    Is this expected? Should newidle balance be serialized too?
> 
> Serializing new-idle might create too much idle time.

In the context of busy and idle balancing, What are your thoughts on a
per sd "serialize' flag?

> 
>>    (P.S. I copied over the serialize logic from sched_balance_domains()
>>     into sched_balance_newidle() and did not see any difference in my
>>     testing but perhaps there are benchmarks out there that care for
>>     this)
>>
>> o If the intention of SD_SERIALIZE was to actually "serializes
>>    load-balancing passes over large domains (above the NODE topology
>>    level)" as the comment above "sched_balance_running" states, and
>>    this question is specific to x86 - when enabling SNC on Intel or
>>    NPS on AMD servers, the first NUMA domain is in fact as big as the
>>    NODE (now PKG domain) if not smaller. Is it okay to clear
>>    SD_SERIALIZE for these domains since they are small enough now?
> 
> You'll have to dive into the history here, but IIRC it was from SGI back
> in the day, where NUMA factors were quite large and load-balancing
> across numa was a pain.

Let me dig up the git history and see if any interesting details hide
there.

> 
> Small really isn't the criteria, but inter-node latency might be, we
> also have this node_reclaim_distance thing.
> 
> Not quite sure what makes sense, someone should tinker I suppose, see
> what works with today's hardare.

I'll try some experiments over the weekend to see if my machine turns
up happy with non-serialized lb for inter-PKG load balancing with NPS
turned on. I'll probably piggy back off of "node_reclaim_distance"
heuristics.

-- 
Thanks and Regards,
Prateek

