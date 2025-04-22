Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43B199E8D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304248; cv=fail; b=MLJ7fMKnXVq7N1bwGUZ2mZC5upA19YgbfHksD8+n6sO77F8PhUT6qnU8GZoaaXj3qAQk7p4bSBhOlhcM/ZTh783+9MqkFh3FG/AZsr4mSAtbPE1aOtkNMbA1dM3/Yfn9Km+4Tdundw9JBo6Jr6fd1Cgh7WHQq9fpMYYBl+7OE/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304248; c=relaxed/simple;
	bh=PLuiotRvb1/DD72CZ5tCBKzTREaFYmZjMJ2zx9jC7KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=agjzwJ1l+ds+DXvIT3kgtrK+UYGKzGpdxYYFdH9ATaPGPxTJMeYhvBGfRyg1Z97+wMSfbue1lQ6YqLQ/Fg+OtMpdbdyi/SUxyvVD6IeEv80etizpfuhMYodeFD08kPvWFQ7FopczhmdKvAxY20fjZixjfMGiqB8rlOdOqIx0KuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TqVU0RSR; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TqVU0RSR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Viy2vqh3l9cSXBPfnBhkKCOQ9e++G5XpNCE0hLO49Ka+AaQDcwTGXviX01faNX6no56+uoFrTuZmnIIn2YJDuKNoW1TzXh4YLv0uAzmseMXVq+BY5r71MyvX+jO01DPniC2EqOgS7g812pqUfwsZhbxbBtvnYbHTwKk+z7UnDBBC22hlygFi+ZuY71iVvRbTDssKhyQFUb6R9SKA+irtU8lsI4MJPYsfx9pH1AL6N1QRavhLPqH3NliGv1vlymszgJ6aPrqP7rTrKzeayCy0q+kspBhkn2ufm8AHLgGCWr23pg7E+dxfHQUIi2R9AqHiZn0/MyJPr/UdYCbtodPjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6ujDGl54yvm1Fv2q8cjofL3YC6P/4GeVKPGNaS5c1I=;
 b=UyjvYUc/W4H3sxqjtSHt95gzn4PQHVXdGQEaTr/rb7nQrNl7LiV0Swq6o/al+HGw9g7wd6Nvy5o/OhEIZsTLOuVFmv9f6sP066mpxp5Qqdr2SRy8Scu8i+6CfHxMOSvac5wI6w6tcrpBR7LQojh+oJdUP9oqHXpUTAs1Jp9fX2BLDZlWksdSGIEfDcP2e76evPg18pRrTBrBmmDm8fhPHyLCcZzZsXAYTaVg5OZyYWNbgmd/4rcHQg71IcnUzseKW7+MFNZhhZ0Y8ydkSxESk/P8FD3BMoqPnVgFbDaTGH7jr4ubnOKErLBOUKzxbdK8B6LQoVz4a1lTk0+GccoMhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6ujDGl54yvm1Fv2q8cjofL3YC6P/4GeVKPGNaS5c1I=;
 b=TqVU0RSRhXcOscJMcD1fpWqyO0w5XnfuWDNHnJmPXyM6DKzsqIGK/vbabhBVmXWe9xHfIO84lfHr1zz+lblnWFLVbA+P4I0EnKwi5XcTDVPDGZ6o42/zHT045ul28xjTSjM2EWSICF4wxm6MLvtz41vKsO+Vz1H+0GegdFEQRNU=
Received: from CH5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:610:1f1::20)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 06:44:02 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::eb) by CH5PR03CA0010.outlook.office365.com
 (2603:10b6:610:1f1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 22 Apr 2025 06:44:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 06:44:02 +0000
Received: from [10.136.43.233] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 01:43:56 -0500
Message-ID: <70647a05-00f7-40aa-ae46-caae3c5c244a@amd.com>
Date: Tue, 22 Apr 2025 12:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<kernel-team@android.com>
References: <20250422044355.390780-1-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250422044355.390780-1-jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 26423abb-6c51-4111-d2d7-08dd816911bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UysvMlY5TFZjSXYwZTMzZHhTVE1TVkNpaXZuWHppOWlmTWdkUWFpZmxwNEIz?=
 =?utf-8?B?c3B1MXFxRnRhR3pSMkwrZDVNcXg5UnY3Zmx5VUZoaWo5V3VFd0FQeDBBOUdk?=
 =?utf-8?B?VWcxajAzVlk2dElBTUFacDdQUHVScVBoWHdFZDY0YzdFOVhRUzUvdHowbW9R?=
 =?utf-8?B?WmRmRUZTQlVtaFN2dGhqR253TkhPaXFnbWNLc1prUXo2NXZiUjRwdmZ6L0g0?=
 =?utf-8?B?Mjd0U3ZESDJnODUva3RjRFhuL2N3YlgrQS91b1YyNFprRURMcUFJbDhIUmFZ?=
 =?utf-8?B?eWdxZklXNDhzVUpPUENNamgwRHVERVJOeWFqZ2pNTGhpNXovT1pQMjF5UkRM?=
 =?utf-8?B?L3p6Q2luY0I3RTd5ejIycTFGY1dxb2NZeDdXZjZRQXZJZVAwazdjUnpXU3Rx?=
 =?utf-8?B?bDBOV2Q3SGlNK2lOdDNQMDBNSGptT21Bb3Z5MDU2d0VJekRKamlDWDVjRkFu?=
 =?utf-8?B?dW5UcklBZTRLTCtEK2JjellIOWtESVBCaUk2TFZDTDhPOXo2YU05NGdudUhq?=
 =?utf-8?B?RHBuZyt4YktPWVloUGxwQ3N4cXFEa1lQQWVqQjhXV200R1Y2VFdBRVJpVkdQ?=
 =?utf-8?B?bVhXQktXZHpYekRwNmc5RHpRa3FLemt2MkxmQnBOdExtNUJyUC80VTl3QzVv?=
 =?utf-8?B?NkF4ZVg2VkhaMUVCRHlNRCtWcGpWL2VFSE9xeG4wOUxLNHVuWXN1M0MrTUlH?=
 =?utf-8?B?Y1BmRmVFU1hUYnRKKzkxSUtGWE9GSit1Wnc2UVRtYVQ4bU8vNDZwQTFieWdM?=
 =?utf-8?B?cUYxczFMUWVpb2RQVVpQKzJEU1dQUHJGRFFLSjFiMUswRllPU3E2QmxKRXpl?=
 =?utf-8?B?Mjd1N2VtVDJUQ2RhMVpFOE5TdkdjUTJjQUNKaDBNbkhqK01zbFBLSDVIOGNw?=
 =?utf-8?B?QmNMOXdhSk1xNW43SFdxMmZPYnd5Yml6YzVBckZYWWFOQVFncXkrSllXUTdn?=
 =?utf-8?B?UXdYMTM2RllZdU5ZY3FUeWhwZ2dNbjA2S0NPYmY1MGdHYVdCNTdXOGJOa2xI?=
 =?utf-8?B?Uks5K0xLRXk3VFF1RjZZWUZRL2djK01CL1hrcU44SHl2TUxybU94TTVMcmtL?=
 =?utf-8?B?Mk5OYWZuc3RWSy9kb1Vnelp5eG5RRmJRZHpQNk5BanYxS1FWOE1hSmNDSmlm?=
 =?utf-8?B?ZTZXYzRES0dNQ3lsZkFhSnpiQ0ZVaU5qb3hpQ213cWVHUHNMZmovNy9XT0U2?=
 =?utf-8?B?UldSWUloemFjd0FYckxSeDFpaGdIdlljNnVuMXQ3ZXJwK0M3aldnelprY1NG?=
 =?utf-8?B?UDRjRXVZYzB3eEpoaGVZSlkxSDloK3l1a3lCM0ZRZzE0NkZXRU5tUExWUXJ0?=
 =?utf-8?B?WEQxMFdkZlBGbDFLcEV4cjVWMU1kb3RXdU4rcUhJTTVKWWNZemJBWjdKcWZz?=
 =?utf-8?B?czBCMEVjaWhjeU9EQjVId1Jwa3Jzd0w4cEdXREo4bXBtZWlWWUovTDVCaWE1?=
 =?utf-8?B?SG5hTGpWbS9TN2d5MVBIcXFRamRDc1oramdYS0dhQkVCNVJidmxqenBBSkpH?=
 =?utf-8?B?NjBjMjgxYnE0M3FhWkM5WVJ3YmFNSkZ2eGJNdFhrSFRpOEt4VDV4UW1ZaHd5?=
 =?utf-8?B?S0RBbzcyN2ZHUmdQVHB3RlN3alhoenNwVTdGdFVoS0ZmNDUrYXcvb01QdE1U?=
 =?utf-8?B?NGhMM01nUENzUUk5b1UxZ2dmL0U1V1JhMWpoaEJ1NkxubFYzM3BOL3ZQMHN6?=
 =?utf-8?B?cUQ2UXB0V1dENDdWNmhzNldDZ3dZRHVEQ3oxamRxVjNhc2wvRENidDEydmlF?=
 =?utf-8?B?dURkNlRYc1ZMbDRxbUMxQWo1UjV2cjMxdjhlTU1wVVZ5Rk5ualRmZHdXMk1B?=
 =?utf-8?B?WmhRaGtJNUgwZjJOQlMrTlc0Wk1uOEJXb1NBUU9wdStHYUVZN3RXK3kyMksz?=
 =?utf-8?B?UW04SFQ0bTlXQWFhaCsrUXJyL2xIN1hmVHhDck1ING5SV3Fic1lNQXAyU1ZO?=
 =?utf-8?B?b3BENG1hZWZjeVJ5RzJsdUVSU3h2eU51RnA1VTJUcXFJU3Q2TStjU0k1Z3Bh?=
 =?utf-8?B?UVRhWFpqaUtmMEhXKzVNYzVESnZPM2M0ZmRBWFJTdXhsdVgvaktMZHhPNFda?=
 =?utf-8?Q?Ea7til?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:44:02.5020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26423abb-6c51-4111-d2d7-08dd816911bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470

Hello John,

On 4/22/2025 10:13 AM, John Stultz wrote:
> It was reported that in 6.12, smpboot_create_threads() was
> taking much longer then in 6.6.
> 
> I narrowed down the call path to:
>   smpboot_create_threads()
>   -> kthread_create_on_cpu()
>      -> kthread_bind()
>         -> __kthread_bind_mask()
>            ->wait_task_inactive()
> 
> Where in wait_task_inactive() we were regularly hitting the
> queued case, which sets a 1 tick timeout, which when called
> multiple times in a row, accumulates quickly into a long
> delay.
> 
> I noticed disabling the DELAY_DEQUEUE sched feature recovered
> the performance, and it seems the newly create tasks are usually
> sched_delayed and left on the runqueue.
> 
> So in wait_task_inactive() when we see the task
> task_on_rq_queued(p) and p->se.sched_delayed, manually dequeue
> the sched_delayed task with DEQUEUE_DELAYED, so we don't have to
> constantly wait a tick.
> 
> This seems to work, but I've only lightly tested it, so I'd love
> close review and feedback in case I've missed something in
> wait_task_inactive(), or if there is a simpler alternative
> approach.
> 
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: kernel-team@android.com
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
>   kernel/sched/core.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba05..43f0931a3cd8a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2287,6 +2287,14 @@ unsigned long wait_task_inactive(struct task_struct *p, unsigned int match_state
>   		running = task_on_cpu(rq, p);
>   		queued = task_on_rq_queued(p);
>   		ncsw = 0;
> +		/*
> +		 * If task is sched_delayed, force dequeue it, to avoid always
> +		 * hitting the tick timeout in the queued case
> +		 */
> +		if (!running && queued && p->se.sched_delayed) {

I think an "update_rq_clock(rq)" is required here before dequeue but other
than that ...

> +			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);

I think this makes sense since the comment above the hrtimeout considers
a "queued" task to be preempted and still runnable but a delayed task
doesn't fit that description.

You can perhaps move dequeuing of delayed task to just after the
task_rq_lock() bit since once the rq lock and the pi_lock are acquired,
task cannot be requeued and simply checking "p->se.sched_delayed"
should be enough. Something like:

     rq = task_rq_lock(p, &rf);
     trace_sched_wait_task(p);

     if (p->se.sched_delayed) {
             update_rq_clock(rq);
             dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
     }

     queued = task_on_rq_queued(p);
     ...

Similar pattern exists for __sched_setscheduler() and
rt_mutex_setprio().

Other than that, feel free to include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

> +			queued = task_on_rq_queued(p);
> +		}
>   		if ((match = __task_state_match(p, match_state))) {
>   			/*
>   			 * When matching on p->saved_state, consider this task

-- 
Thanks and Regards,
Prateek

