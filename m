Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3FB673
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743477439; cv=fail; b=EHt9tfAZQtlsdZOCD8AjbrRHPS8K2XZIQ7Wl1UaYYki4C91dDvxkYpbgooxQerC25NOzP2398AFa2bvj1gQJ8NtLzVvDN8edC2ZANAGSaxvoGwtVd4eiglFtjxiU8eI+acBJa7JbIwKrAt2M2obXid6o6U6qbkCMVSuUaXebPoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743477439; c=relaxed/simple;
	bh=P+1dKVSe7eE1h5d3eZ3gn/9nY6G6b4dCVJ15DLel0BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tr1bgxKbii+l3NPRGnAmHqTMQSZmVVA7KHYEbCNRlWNXzaKCQLG6CyM4lqvj4A2GyoRkKeL7ZMC6LA5esbjvspx5LM5LQShegjIWvHrKkCu0sfH0jhWhabPRNSVugHT6I6Mg6fd6udRDYQwZyE5RnDSDEfUSRjDm6wmc6om9+Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sFnBFzLY; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sFnBFzLY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdrY7AtPpqpD25gVGbsG/lg2qnvnxx97WeoOlhbmVwXCtnxqIYZs8+uM6vW7VbzR9PebWKZ7mmNmUblj5fB205AoBaIHf8BNdGa/eXahaBfcI14m6Iuw5eaD/ESEISPTuAs0H3MU7j2zVxz30XPB3aaYFxCbLHuqXYF217VAcxNVc+8Hqv4nd99JMtJHcgf7CJgfiRUpt6faYmBV5UV2MV/FMqahzC1k5/jfj1JTg13SKsjwqCh9PeiPoZ8lDgKheYfUPF6XMw0BnWh9X1oWWNTxekwaH+4KPD1fqATnQsVHJJ8g1LsWjEgp2ZO8I5Iq2RHtrc7Z8WY+lAQZgiA0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSHjscl498UZ6Q8HP8F3yciMqxHk0jRGv+8NjXugrIs=;
 b=kJQ/lxf+pQd7QdtKZJt4ssRVCEn90Mrr+R3xccAucKwyQaWT2rZl6Jl7zOF5J6yVYv3Z76gwb912w1ARys6VPcpe5ekQYTl+nG44H7ASKSSE5aiV9tGr0jSgfRfmTeM3J6rF8AtqgWVVOjU2sT4WkkRNhNUeUkjjpOOKQNi6VK7H5RciAVQT9WruIlh3hHwQ4WyTT1aGNohcrPAMSQvT06ed64meFn/HyCAsDipc9Mu1UmLuMJOtpT+o/PNQevwJ7x3nV1AxZNFYYnqnCuVCPIgL44fbA/Ri40Chpw2irYCTr+Uz4h0Ucv27bQUUxEt1heItdvELSDDMm6RfjLxuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSHjscl498UZ6Q8HP8F3yciMqxHk0jRGv+8NjXugrIs=;
 b=sFnBFzLY1qy4u2Lpl5Qa9hKHaLvts6qjVBmMumKOdRZ+7TACO0KDQLwtStWkmIQEjMbMokaqtbhXR3EuAu1SazI21uttC4cORPrpiIQc7WyJeyA1dNlKi9CCe5/EgCbFy95WOXFRz/ZB1/Ji2hDHBB0X67j5/Xy9jKQb68KaxIE=
Received: from BYAPR07CA0067.namprd07.prod.outlook.com (2603:10b6:a03:60::44)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 03:17:13 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::ee) by BYAPR07CA0067.outlook.office365.com
 (2603:10b6:a03:60::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 03:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 03:17:12 +0000
Received: from [10.136.38.96] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 22:17:05 -0500
Message-ID: <e9aae247-5347-4748-ac5e-9f54f733e230@amd.com>
Date: Tue, 1 Apr 2025 08:47:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] sched/fair: fix tasks_rcu with task based
 throttle
To: Aaron Lu <ziqianlu@bytedance.com>
CC: Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<linux-kernel@vger.kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>, Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GehTMm3sbtXMy9MMFtG=kPYpHiFwy63OO4+dmXh68bWfA@mail.gmail.com>
 <28267ba4-94a2-4a77-9c34-7273a102c183@amd.com>
 <20250331061949.GA1571554@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250331061949.GA1571554@bytedance>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CY8PR12MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a48946-e40a-4ee4-0639-08dd70cbb1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVdyQ2JBcVFNcjJXNm5HY1ZhWVY2V0hMcXM2bGo0QmJBQXpVUkJnakZ4VUdY?=
 =?utf-8?B?NjIvaVFPa1o5MWppbTVBZFZoSzAyVitCTDVXTk91dG9NTGFwN04zdW03MXpa?=
 =?utf-8?B?TTJiVXdOb2VoakFXdWNiUW4zNy9BWDRQR2RrNW0yc1QzZG1WS04rVUtLb25F?=
 =?utf-8?B?bWgvTzJoNllQT2hDTGxmOFZTdjV2UEtDVVBqSnJkWjRjTHhiYXJtV3h1WDBp?=
 =?utf-8?B?aFBCaHdDbUt1Z1Z6VVBhVEgwb2ZwSUw5NFV3SzNoWDVmSit5T2JHU2xNSHNC?=
 =?utf-8?B?MEQramZsZDNBcVIweDBVTlJrZGVmMW9yZGRVVGZsUFJnSU9lMmxuWmhxVjVr?=
 =?utf-8?B?WC93SGVzNHNDMnMweHhQOHB1QXJLVkFleWxMZzVoSXZ0REk1N2owcmZyM255?=
 =?utf-8?B?YlBmOEVlMVpLcHUxMEl1cUFVdWYyT0Z4b3FyREFCblRKMlRMUTlqdGU4YkFD?=
 =?utf-8?B?dVEwZ2txRGJyWFZKanNhOWM2TklpdS8rQ2oyY09xUE1UODRJNGRnaHRSYU91?=
 =?utf-8?B?dkprOWZQdUNUdHJpMk15MDFyZUlVcnlGR3Z0TlhZU3lBYk53MGFtUFpnY2l5?=
 =?utf-8?B?L2UyRENTdi9QcUJXWFIwTEdGdjJmenZoWGJidVNJa2dld01xMnBXWnVBL2pZ?=
 =?utf-8?B?SVRuTEg4Wnk0Zy9Eb2M2VnhWY2ZnNFpwUDM3VnkvS3VMVWZXalNCR2lDT2tx?=
 =?utf-8?B?NVJ6eFJiOE1xaWY5Z3VTbytVdEowSCtPWlNobG5LT0pCUjkzczVUMVF6dW9z?=
 =?utf-8?B?S3A2NHlsb1RIcEdMOGF6SHJHMWttZUk5NkFoaGNEZmpabmFHOUQ0Qld2ZG5x?=
 =?utf-8?B?QlAzQnYzRUJnZkNXVmwwT1BTZlM4UDNoV1VFNy9YOFppSU5rT0xQZkh0eTBp?=
 =?utf-8?B?SXE2dEo1ZGZPQW1DU2xwdWZkR0VOODJjZ1R5blZ0blVHUldIeXdVdXlCTEZ1?=
 =?utf-8?B?ck5BQmJiMnhWc0FpbVdVTmdNcWV1Wnk2Z3lSTVk5SzlQb2t2Nk9ObXErNHBF?=
 =?utf-8?B?N3ZMMitob2tpOWgxVGkzRlJ0T0VBWlV5QnVVdWlPSGFCZU5JSXN4Y3FRbC9I?=
 =?utf-8?B?OGZmejI5UTRxT01MUlpUVGgxMmxnRmt3ZFRwajl2MGsraUVEOEMrc3VOdUtN?=
 =?utf-8?B?VkdkRVA2QjlFQUwvaStjZG5jblV5SnZVd3lIbTRlMklTZWVURXkrZEhFVVor?=
 =?utf-8?B?VlBzNlVwVURqRkpIVGhLSHI3WEljS21tRUU4UFhseTU0a3RCc2dJTHZZdUtj?=
 =?utf-8?B?K25sOEFxUjFheWIrSlZwNXdYdStZMmQxRDNVSHN6eEM4N2FwblN0YXFVakhV?=
 =?utf-8?B?Smc1TGt2WDJnTHl0UTF6UFUvcEd6QnR2cEN6K0RKZUN0MmNxdklwbUNiVDFC?=
 =?utf-8?B?Zzk5eVNMZForb3lNbXMzYTNPN0ViendKVUtJdWVIMExNV0x4VlhtcUszSTZZ?=
 =?utf-8?B?S3NSR3I0SjFIRmhjWkdQQUxycXVyVXNiTkhCa2IzdU5NMnFwQnMzeVFOalRs?=
 =?utf-8?B?TG04ZUg0enBvU1Z6ellDclpTNWZLM3JPQ25YRmtKMW5acnBaUGlQZWtTbE9t?=
 =?utf-8?B?YkhzbG5VR1pyeXJHejdUUnhsQmtnbzd2bjlqUVJGSFA3VTFuODRVOExqNHFE?=
 =?utf-8?B?bnZFVnNlQU1iSysyYVV5MndyRlo3UVpGOFYranpIVWpYd2VZYmE4ZC9VSUlX?=
 =?utf-8?B?bTM4Z01hdWhyYXFEVnNQUkdzVVRjU0FsWmlLcVp3KzdCQlFSZHpKL0FENHBn?=
 =?utf-8?B?SVAwU3pwbnRxTHhFV3dVZGFueUpWL1ppQjFFOG5LOTBCRTFxWkgvQUpaK3NV?=
 =?utf-8?B?bWtYclZSUjcvcUhkVzR1ZXo5UFlDdzZnSk9RSE5pVVRmV2VWYTZKUUZJLzU4?=
 =?utf-8?B?Q2VmQWtmRDMxa21Ec1YvZWR0K0pJMzgzeEVZcURxK2dvQ3ZnY3FKemgxU1ZM?=
 =?utf-8?B?dGtoTHNqYlE2RFVWNExqdWZKYUxQUDJ2d3F6enpKamRXM0U5bW1rOG8xWk1z?=
 =?utf-8?B?UkpVbzIwZTN3S292MUhxZzRjejhPdjVDM3dETzQyKzZqc1lkclpKOGFtWUVk?=
 =?utf-8?Q?MD7JbU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 03:17:12.1082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a48946-e40a-4ee4-0639-08dd70cbb1f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684

Hello Aaron,

On 3/31/2025 11:49 AM, Aaron Lu wrote:
>>> Taskes throttled on exit to user path are scheduled by cond_resched() in
>>> task_work_run() but that is a preempt schedule and doesn't mark a task
>>> rcu quiescent state.

So browsing through kernel/rcu/task.h, I found the
cond_resched_tasks_rcu_qs() that basically clears task holdout before
calling schedule(). The question is, is it safe to be used in the
task_work_run() context? I have no idea but you can do a resched_curr()
followed by a cond_resched_tasks_rcu_qs() in throttle_cfs_rq_work() and
that should give you the same effect as doing a schedule().

Thoughts?

>>>
>>> Fix this by directly calling schedule() in throttle_cfs_rq_work().
>> Perhaps that can be gotten around by just using set_ti_thread_flag()
>> resched_curr() will also call set_preempt_need_resched() which allows
>> cond_resched() to resched the task.
>>
>> Since exit_to_user_mode_loop() will run once again seeing that
>> TIF_NEED_RESCHED is set, schedule() should follow soon. Thoughts?
>>
> I tried this and noticed an unexpected consequence: get_signal() will
> also run task works and if the signal is kill, then it can happen:
> exit_to_user_mode_loop() -> get_signal() -> throttle_task_work() ->
> do_exit() -> exit_signals() -> percpu_rwsem_wait() -> schedule() ->
> try_to_block_task() -> dequeue_task_fair().
> 
> I would like to avoid this path, at least for now. I want to make sure
> for throttled tasks, only events like task group change, affinity change
> etc. can cause it dequeue from core, that's why I added
> SCHED_WARN_ON(flags & DEQUEUE_SLEEP) in dequeue_task_fair(). I think
> this can help me capture any unexpected events like this.
> 
> Besides, I think explicitely calling schedule() has the advantage of not
> relying on other code, i.e. it doesn't matter if someone removed
> cond_resched() in task_work_run() some time later or someone changed the
> logic in exit_to_user_mode_loop().
> 
> So I hope you don't mind I keep schedule() in throttle_cfs_rq_work(),
> but if you see anything wrong of doing this, feel free to let me know,
> thanks.

I don't have any strong feelings. Just that the open-coded schedule()
struck out like a sore thumb and since you mention future changes, the
"local_irq_enable_exit_to_user(ti_work)" could perhaps one day be
extended to not disable IRQs in exit_to_user_mode_loop() in which case
a direct call to schedule() can cause scheduling while atomic warnings.

IMO using cond_resched_tasks_rcu_qs() is cleaner and it is obvious that
the throttle work wants to call schedule() asap while also clearing the
RCU holdout but I'll wait for others to comment if it is safe to do so
or if we are missing something.

-- 
Thanks and Regards,
Prateek

