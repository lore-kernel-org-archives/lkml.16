Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03041E5B94
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298758; cv=fail; b=kaFXWTmEWHOmrvVGfdb9f9vAefmjyy3c7/x6+jTw5q8TFdMKJPH2BwabQxa+b5W1dJS0+PAotaVDGrOiIpj3JgnO7BHZ16kIJ2sagzu4C1LIucyIe7rMbB3YKOrhr2syJ8dllKGUFkW0giegaQMraSuq/tGV7ZcqowcppFeodQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298758; c=relaxed/simple;
	bh=gG7EKl5BcJjS7tyCInuUQER/THoI3yq0fpcGt5lhReY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KV8rwdC3lBW4LdKvHK0hac6i/jdkkudrFO98+8k+409/6XKGbePW2UjMVApkLBWejNSH/f+XTm/OzyEsrc/FsDhYmAweOfq60DLtsy7Du+onA4OBjcAz14wplGXMgqf9Df9OQGLAfkcz8eE3Mpv7mw6aC6Y+NdHqfu9lxdBAkOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XM8ZsrPg; arc=fail smtp.client-ip=40.107.102.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XM8ZsrPg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAx4qR0+rpVtp6ocUZW41GPHB2p1KgDycFp4VxoihfMu7qtXMSwMMe71JCvUyYcCxaAbYCoLFdBmAv7IhFoibPShyHu0j4ZwR1pAcJT/MjZ37fqTLd52t/flvKHFz+H6k0/y235KxNCGUj2uuXhAsH4c/mHACVOppiNsShMHhnaHqaTgdW+QUO51ZPXDRui3/gHfKEuCJvKzgAUG5fowBrjxfB0n40C2BcaPeOB8uHg4Ps2ox3V/0QUcvy6/iu88l8vTZCR+3Zk5y/dt0HZll484S6rrD/XEShVqwxl3qwF0lo8dOA1VXcp92Jt9+ko+p1I8RKtnaRHkF0WIkdVLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riEkG+B78yOJbj+9nhGzzV2wIXodZVTCah32Pga6nHc=;
 b=jamQ/qYOUfNL9cTAcO526VZ+z93F+75xTtReUot7g9adEYs6zNvpjcs1klBDgGmlg6ZLqqu8NKibKa6Om6GGFebW4512JCtHR/mFFGCijSqa80hSLRgDpc/KykDk6OKkR5GeAi5ezSw29lnBGthKy+500r2u/q2Be3+eYvDDUOBKxHQ9nlgP9kTTrYRUcDQ3uzwyhu5iEucB3GICbPNxORvllvQ9J/N6qBXx0VVXKSlOnaURVICvajZeEgnMOH4wglQvWc8TcVmFMyXJhKKCKyJEVmi79Swsw1irhdWkC/G1n4FAA+G/Il6clvaPUQvtTKiBmbyhklg2ps/hkf/vbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riEkG+B78yOJbj+9nhGzzV2wIXodZVTCah32Pga6nHc=;
 b=XM8ZsrPgMYIhqm4Ueq2cAa2793iyzmsaK0Qo4MfIkUAzfw0tcD0wUZZoj7PsdJVPcWwzZ7dSgCIIw5dVSZiz1usyVEh2gYJw3T8/EbFGDx+t5beRjpU4Hrge6mLC6/XUdrBMEqKhiDBTzKxxiQqciHQPLktwMSlpAMSMLypq9Gg=
Received: from SJ0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:a03:3a0::24)
 by CH3PR12MB9146.namprd12.prod.outlook.com (2603:10b6:610:19c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 15:25:52 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::f3) by SJ0PR03CA0259.outlook.office365.com
 (2603:10b6:a03:3a0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Thu,
 10 Apr 2025 15:25:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 15:25:50 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 10:25:47 -0500
Message-ID: <d58c8e54-1eb0-4b71-bb19-a6737829a4aa@amd.com>
Date: Thu, 10 Apr 2025 20:55:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] sched/fair: Add push task framework
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-2-kprateek.nayak@amd.com>
 <20250410100022.GA30687@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250410100022.GA30687@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|CH3PR12MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de2934c-b299-46af-905d-08dd7843fa15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1hWcFErVjdmKzlrQUpjcU5HdE5JT2JxQnN2czlQRVRXQVZoVm5KMlNwM2Js?=
 =?utf-8?B?eFk2RjhqSEhmckUzV1NVdDk1SU5SU3lnN1JSZEl6R25ScVpmKzA3VTBaSzlM?=
 =?utf-8?B?cTJ6dWZFNGNsRGxmUEdnOGhTaW9lMzFyVVorNXVBa3Q3K25NMEhQcnV3cjli?=
 =?utf-8?B?djFlSXY3YUNqOTY3Y0toRWNma2llMzIwWmdCQ0p5YklDZU8xWS9oQkloOFQ4?=
 =?utf-8?B?QVFDc3lMYjRrVWNUM1F5WWZPTTRHWEUwWTVBVU53ZUlqT0JuTmxmaWlTOWlN?=
 =?utf-8?B?ME1TeTZxcjh1WWdUUEkxdUUxUGxJcldlWklzc1ErcUhhM2JhWXN4eFMyQnFn?=
 =?utf-8?B?NVVQbVpmc2RZcTFRRWJTcDczSkNxelg2RncxWFRCMGtFK1JiU0I0Q3lWbWoy?=
 =?utf-8?B?aE5Rb0lOWnpOeXRvUWZrM0pPdFgycXI0Z3hKUnhpVDg3cTdLVkdoSEF1Q2JY?=
 =?utf-8?B?ZlhWWFJERHUvb1ZoL3BnL0cyVkZHd0lFVFVUME5vVDVUUDNia1BVWU1ERnBz?=
 =?utf-8?B?V21zWTFIeWhjenkzRjZPekw1S0ZwckpvbktMRHo2YVNycmdTSjl1QldvVnRu?=
 =?utf-8?B?K0U5Ris2bnhXZVNtbytoTkliWkpyT2dQU3lvS09xQWtiYzNTOHdnU3hGUFBh?=
 =?utf-8?B?M1duc1hscXR5RWhyY2svbW9JbHQ0bUFsajdmNkRybC9zQXNYZWw1R2sxUGJF?=
 =?utf-8?B?WDBhNURaWXNma0FkRDVma21QWXdJNHdWUnMrb2Y4UVdZdENyTlRCcXVoQ2l6?=
 =?utf-8?B?OGpTY0hQUzVIaC9lYjMxQjNDdkhNOXowZ1NmREZPKzNLNmFxOUpqMU9xU2dl?=
 =?utf-8?B?N3BXSVFLbG9Rak5pMmY2QzFPdThnTW9YL08xQ3ZKZHNzNzhwU21TSzFHZm90?=
 =?utf-8?B?RW1DUEc3RDVFa3hkSjlCZm1hZVg3THV5REhsd1dkTGdYSUFZNitJZVR5Ymtu?=
 =?utf-8?B?aUhzRDR0cXQxK2JnU0c2M0NNdGsydUVxU1dmbUttTDBGVG56VWt2VDFRUUxn?=
 =?utf-8?B?bnpodnlQdjJpdzdOOE5KQUZqSXlhZzNXcE9MS0MxWUYvYzJVZ3NhbFZVcklP?=
 =?utf-8?B?d2NacHJsWW11YS90OEhxU2FOTHZXNGFBMGttcHdxalFMd1J5aGtHUDgwRjBV?=
 =?utf-8?B?ajR5ZW5wSWZ6cUpyS1FwTksvamowRjlLRFdudVJqdnAwd1hmTFZOT0hSN2t5?=
 =?utf-8?B?cTB1clZCQWVLWk1vNWRYRFdyOWdpblppVVlzVFFydHlYajg3ZUJyV3FvRDQy?=
 =?utf-8?B?OGx2N09IVytKcFVGM2x2MFpKaS93ajB1VjU1Y3lucndxdjhJTU53MnZYRC9J?=
 =?utf-8?B?Mk81aGZWaXdJRzNJVzloallVVlMxeEk2NXlvWk53WkNMRFprMFU4biswTVdY?=
 =?utf-8?B?MnBRYVNTVExkWVRRS0E3WTBKQ1lZTDJsQS9XVGo1dFM0YlFXT3RkWGdvWWlN?=
 =?utf-8?B?RndWZ1pJcDBEV0NTdzhPV2Q0Q1JRTkhUZyttRHhPMjE3aVpYaS9HUE5OdWxp?=
 =?utf-8?B?OVdHbEcxdFUxVjdQVlE0M0tyenh3VEZ6Nll2VGd1QXl1S1lydkRTcis5bW03?=
 =?utf-8?B?R3NEa2cvaW1PZUxWWWYrSGovMVJyOWwxUXBJaERxMFVjeUZXb2pzTndZUFJZ?=
 =?utf-8?B?RU5UdDJwc1pwTk96Wmd5QURLRW1RMHpUVXJkS2ZZZUJQaWtOVHRtRVAxNGdP?=
 =?utf-8?B?NnJZTDcrMXJqa0hjTG1Nem9tcDBTV2Q4U1hFQzBpaUtyb3VSUnJYQzBVNzk0?=
 =?utf-8?B?Y1cyQUpZOFFKTExxdzhpTmFialhvenpCME90N1lkWEt6ZXlkUmxLc3FyOThj?=
 =?utf-8?B?SGZzWnh6T201MkhxZlhJb04vdWc5RExETVpPM00zOFZXZC9YazdZdSt6OVFy?=
 =?utf-8?B?QmRrdXVIZkJWUWRJMGdhd2tvUnJkdlNGRVBjUzdiOXE4MkNXQ2RQeEVvT0k0?=
 =?utf-8?B?SzgveWVtZ0pTNUxkUjVxdzZXdXNkNGZXWmQrd2czWHVYVTZpaXltVmZBNUVj?=
 =?utf-8?B?cUFwamRiaUlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:25:50.8775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de2934c-b299-46af-905d-08dd7843fa15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9146

Hello Peter,

Thank you for the review.

On 4/10/2025 3:30 PM, Peter Zijlstra wrote:
> On Wed, Apr 09, 2025 at 11:15:35AM +0000, K Prateek Nayak wrote:
> 
>> +static void fair_add_pushable_task(struct rq *rq, struct task_struct *p)
>> +{
>> +	if (fair_push_task(p)) {
>> +		plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
>> +		plist_node_init(&p->pushable_tasks, p->prio);
> 
> I gotta aks, why do we care about ordering the push list on p->prio for
> fair?

This bit was carried over from Vincent's series. I assume it was
inspired by the RT, DL's push mechanism. Perhaps fair can get away with
MRU ordering similar to rq->cfs_tasks?

> 
>> +		plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
>> +	}
>> +}
>> +
>>   /*
>>    * select_task_rq_fair: Select target runqueue for the waking task in domains
>>    * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> 
>> @@ -8914,6 +8978,12 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
>>   		put_prev_entity(cfs_rq, pse);
>>   		set_next_entity(cfs_rq, se);
>>   
>> +		/*
>> +		 * The previous task might be eligible for being pushed on
>> +		 * another cpu if it is still active.
>> +		 */
>> +		fair_add_pushable_task(rq, prev);
>> +
>>   		__set_next_task_fair(rq, p, true);

So __set_next_task_fair() removes the current task from the pushable list
when it is picked ...

>>   	}
>>   
>> @@ -8986,6 +9056,13 @@ static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct t
>>   		cfs_rq = cfs_rq_of(se);
>>   		put_prev_entity(cfs_rq, se);
>>   	}
>> +
>> +	/*
>> +	 * The previous task might be eligible for being pushed on another cpu
>> +	 * if it is still active.
>> +	 */
>> +	fair_add_pushable_task(rq, prev);
>> +
>>   }
> 
> These two are tricky; while they will work with a push balance callback,
> they will cause some pain with pulling from the push lists; a-la
> newidle.
> 
> Notably, we must be sure to check ->on_cpu.

... so we should be safe here. Other considerations are covered by
detach_task() but pushable task lists to only contain queued tasks
that can run on more than one CPU and Vincent was cautious enough to
place a bunch of WARN_ON_ONCE() in pick_next_pushable_fair_task() to
catch those cases :)

> 
> Perhaps later patches add this, let me continue reading...

-- 
Thanks and Regards,
Prateek

