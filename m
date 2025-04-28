Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF127462
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745817226; cv=fail; b=fPJMD/tIq3ksHAmFvT0OWgyEScUQvB5BmDhxn02yFniMCO3usy6PHTgXKSvilT5zpdFVTbTlnbAHjZSMb+B7v9ExRAZyx8ZECtUbjH7k5EYIA7elLPYPc6PFs7bDxSYXqY1Jtu4cg3XKdKggzUW39GemJ8LjT3NyhJSPAyN/rx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745817226; c=relaxed/simple;
	bh=0YTnJ7pAlRueDwXMCyYrx2X5n20kaEiajktC8/yVU3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UesXZ/WhA+j7S4Vm7//kJa2ks1S3arcKY1WXzfeJZwor5BirleMcksuZ/MZfTP7B11R8KqpWz/WIi0KywrYxeutb4NqMa9Yd2YYlY+v7TFYQISe+4g8sYn4wOO1Cg69oI5emW4YOi4iDW2+7ITpsD8aoip62Sg0WIHQ+Eni9oWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aaSW04H+; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aaSW04H+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2PzQEgVeesAIVEJFbbV2SmOoXp4GFc/0aSBfbaWNBSznZf3hjb/5P+v7KDv96BLpmV/QUyLn/54LvyVUapVxRIopjpGEZGk64ReyIyCdmBGupkBbaDGw5p6kK7BOYPEzveyt5twpXnzrbmP0dGLNlEXQ8x92wkU4/03e/HKyb37GJ87RM3Quk2fekf/8xakc7d3NvlajqFBJy6SDeb0bk06uV92P0dzU3rE3YcvQ/m79jcl5KMPrnDnou1HLVq0NeexNytFgcrYoBuOIHLFpqBk/L4SYRuFgzVU+Q0SbZJdi2Bc31ILmOwYgS3a5oEyEV+L5ychGO1sBs9h694avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leXFxjYQxpYqSr4USVaTyljyqQK19M/Gcoc9O3tPqeM=;
 b=UDmEeU4p6iX3HJB5Y3dhsI0btjdlHYw1ne/TU32AxBoiTvDxoK6eg0WmokIffq336LnMSCdzkP6Hzpy7J5rhDZM0HUqdIH06NedNNRWDtw3IgXCKrvu80KO2cjDOm6dMJkpdvrK9Myv/u+r0r2oIA17vld9diO4H7kcbS2MwCuSslNzq2J8rGXpLt1BFJIVpNMrzCU7WWHE16ckBrzgceSgN/hXBFJPC6XGVR2scfVi8dzRTwmO1TCMkUj56hG8RNdM03EqqfHrNobTuVRdPgz7HrxeSDlufoOcCHcGmBwibtSxwT6jfrJg5DxCMGOzbRhzDG8K889B9u3awAYsGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leXFxjYQxpYqSr4USVaTyljyqQK19M/Gcoc9O3tPqeM=;
 b=aaSW04H+z8qGR503GKoTAO9OasQEeKH/AYJmEQYdd3nTXXJ4pUiJJKPgd40LBkp5El14kt3KiKTQn1S/khLoTts38w+kvIF7Qgskk97Qi2mvCMz3iEcnAvGZPCZJ6bf/3Lr3KsbU+jv1cEkHssFwy+aL1IsZWfmCDV3gezCSZa0=
Received: from CH5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:1f4::12)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 05:13:37 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::df) by CH5PR04CA0003.outlook.office365.com
 (2603:10b6:610:1f4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 05:13:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 05:13:36 +0000
Received: from [10.136.42.115] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 00:13:31 -0500
Message-ID: <1d6574dd-ece9-4826-95a3-1ce6a84f7d77@amd.com>
Date: Mon, 28 Apr 2025 10:43:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<kernel-team@android.com>, <peter-yc.chang@mediatek.com>
References: <20250425195757.2139558-1-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250425195757.2139558-1-jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4b9e59-26bc-4f72-a170-08dd86136e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amZwVjdFdDdHUVNQVFc3ZklkSHVZRWc5MXVDR3Bncm5EWUZnSTJ0eWRSdHN3?=
 =?utf-8?B?ZEFWd1lkS2xmeFBwcmZYSGc4ZERTM0E0MG40b3Vyc1hqVXcyclJRZnhiSy9E?=
 =?utf-8?B?VXI1b2ZXaGpkR0ZTRklrK0svSmxMT2VUdUhsWko3Q2I5UDMzTFFSNHhTNk5v?=
 =?utf-8?B?RlNmWTA4NVYvME55emQreGlYZVNQOTlydGZFQjRqaGZHYWljWHZGeVhWUE5H?=
 =?utf-8?B?YzM2K2hEZmw2R0ZmL2tXMVltRXF2Vk5GWTE0TjRTem1uOGZoWWhMejR6WWVs?=
 =?utf-8?B?Wmg2UEJCa2U4Vy9HYzUxekh4b00wOWtUS09NNTBwOW5JVVdSWHJheFNqRDhv?=
 =?utf-8?B?OG9pTTYwNW1QVGhPV01tZVpPU2J6Y3hUR2ZySDR5eDQyVHg5LytWQmFUbVpI?=
 =?utf-8?B?NUswL0ZuV005OXVlZE4xc2o0eU1UZG4zY0FBL2RDcDJabFhmVGRCald5Zjds?=
 =?utf-8?B?UndhVXZWdjMzMDdmVXVmMmF1RkxOUWxteWJ3Q0FOd21GOXFqdEVxNjJvMzBk?=
 =?utf-8?B?RnFDQVVFMERJcnh3QjZkbFRDaVlKRGN5K3NEZUI2b0diNHdWSCt0eHNud2tP?=
 =?utf-8?B?VlppbnFOQnFQRWE0UmJIMWh2eGtvQXRNRllJVVVaOWdUUVpZLzAzbXU3Wm0z?=
 =?utf-8?B?eFpOalN4T3d0bzNnekozZ1Bmeldsc210cDVFMTZHOW5hcmlpNi9MZWhWT1Vo?=
 =?utf-8?B?VzhVQU90S2JSSnBhMnpCWGpCY0YrL2RvVVgrUE0wbzhyN3JKRDZzMHJQbDky?=
 =?utf-8?B?b3VhNlBIRm03TGVEVXkvcEJvcWRZV2lHQXgrMXlUWFpyTnczMlU0VXgwdFlr?=
 =?utf-8?B?TXJRMUFtWm5haG8yNDJORTdPVGM1anZJSlY1disyMTZFZDUrSkRpNjNYYkxB?=
 =?utf-8?B?SHZYRUs1VVBITXYzTW5TLzlNVXZFQThLdnpmZkozYWp2Z2NqOWRXQ2NMWmt0?=
 =?utf-8?B?UmlwZHNudjNXd0NEZWcyYlJVSTk1aHVod0VQczVGZzR1blZTak5NaXk0WDhP?=
 =?utf-8?B?NU1ZdVRhT0RWNVdaVkFadjI1WHlxdlhpajNxMHE0UXdOeE9VL3F1YVlGUU56?=
 =?utf-8?B?VXZKQjNUeHl5NHpiU1JzZnZCZ3p1czlyQ2N2WU9zd3lzK0xUd1FVUFp0RUNX?=
 =?utf-8?B?ZkpQN2pma2h1WFhQdTJjYUhvdEpVTlNZUWV3cU9NOHU3Z2NvN3dSY0syKzR0?=
 =?utf-8?B?enI3ZCtWZ3pBazRMVytMcTNSMVRwK09ra2ZmNGppS0F6RGQ3aVFBTlZHb2NS?=
 =?utf-8?B?NW5GaDZJM1YvTkhPaTJOOGZUNzI1c2VkcnY4Y3RldG1TVW5RazNYOVkwUHFm?=
 =?utf-8?B?NzNUNUVxYVhnVnpRTlBzdTYxaGJXbW16aXRPbzFPd09PZ2p2SDBVdmxxTXNl?=
 =?utf-8?B?OUF6VUhsYTNXdnlMblJJeXVwTlltbnhsSDVMSTlPRzJnbC9sSnkwWlBkUFVD?=
 =?utf-8?B?VDNpRk9rNjVRTlZYK3B2TmJicWtiYTBQMFRqMTBtamRxOVpZQUROby9rT0RL?=
 =?utf-8?B?QXBHNU13WjRUL0pvR3pvWVIvSnVLM2k0SlVPWlpVTlg0bFk4RHRwN2NETVNV?=
 =?utf-8?B?RFVNbkFxYUtIb1dwVnVSdTgzeHdYdW5ZMGk0cmhQRG50bjFhamNoR1ozWk0x?=
 =?utf-8?B?MCtNdDFacFdBWjZsTDhMcWhZVUlWaFpnQkpSVmdBSnRDUzJiUVU0bWR3eGVB?=
 =?utf-8?B?WmJsZEtRVUQ4WW4rM2R0RXNIblozak9aZEZVSHo1c0JsNUc1enJFTDlFbUNw?=
 =?utf-8?B?MitseDUyRWd5SFJMRVFEd2FhRDR6UTY5bzNKWE1Xb25jZVU1aSs1OHpzcC9a?=
 =?utf-8?B?NkM1ZzVwUDRXR3U3dnZidFF2NjlzUkdnOGlmcHliL2ZiQ1UzREFCckRFUDU1?=
 =?utf-8?B?UE1NSmhEZktmbHpQMkVWNVpiczgrQ2U5MVhlNkRZa2oySVlaSmUxbXZEZ29x?=
 =?utf-8?B?Q3EvaUUwQ2F5RTJuUkFnSGRSWTN6anB4bzd3TG9wZGl3dHlJV2dJU3YyWGox?=
 =?utf-8?B?T2dPVkE4YlBqRWluSmZJdGFvNHJ6RFpyYm5KR2thR2NicnlGYVBTSkRQeVV1?=
 =?utf-8?B?WllBdXdkZ1hXWEQ1dG1peURITVhPck0yR1NqQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 05:13:36.5895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4b9e59-26bc-4f72-a170-08dd86136e21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759

Hello John,

On 4/26/2025 1:27 AM, John Stultz wrote:
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
> p->se.sched_delayed, manually dequeue the sched_delayed task
> with DEQUEUE_DELAYED, so we don't have to constantly wait a
> tick.
> 
> This seems to work, but I've only lightly tested it, so I'd love
> close review and feedback in case I've missed something in
> wait_task_inactive(), or if there is a simpler alternative
> approach.
> 
> NOTE: Peter did highlight[1] his general distaste for the
> kthread_bind() through wait_task_inactive() functions, which
> suggests a deeper rework might be better, but I'm not familiar
> enough with all its users to have a sense of how that might be
> done, and this fix seems to address the problem and be more
> easily backported to 6.12-stable, so I wanted to submit it
> again, as a potentially more short-term solution.
> 
> [1]: https://lore.kernel.org/lkml/20250422085628.GA14170@noisy.programming.kicks-ass.net/
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
> Reported-by: peter-yc.chang@mediatek.com

Perhaps a Fixes tag to help with backporting:

Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")

other than thank, feel free to include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

-- 
Thanks and Regards,
Prateek

> Signed-off-by: John Stultz <jstultz@google.com>> ---
> v2:
> * Rework & simplify the check as suggested by K Prateek Nayak
> * Added Reported-by tag for proper attribution
> ---
>   kernel/sched/core.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba05..b986cd2fb19b7 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2283,6 +2283,12 @@ unsigned long wait_task_inactive(struct task_struct *p, unsigned int match_state
>   		 * just go back and repeat.
>   		 */
>   		rq = task_rq_lock(p, &rf);
> +		/*
> +		 * If task is sched_delayed, force dequeue it, to avoid always
> +		 * hitting the tick timeout in the queued case
> +		 */
> +		if (p->se.sched_delayed)
> +			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
>   		trace_sched_wait_task(p);
>   		running = task_on_cpu(rq, p);
>   		queued = task_on_rq_queued(p);


