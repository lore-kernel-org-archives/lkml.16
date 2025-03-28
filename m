Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98C54C6E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743137140; cv=fail; b=nvnWM4jP/0k15wvaVuQ5WWgjU5Rf9oAtlW5NQIuV5dFNPWzQ/FDjLosZvB1grjoY/lmlDkeFnw2kLIsOYH9Aesd+1Kfas5xJi5QzmWmlR6vfo3sX4xoKlvgPW1TimfSmUjDjdlXT/IVHHM3ci7kGKWQNyRJcvItRzzMCEtNX0dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743137140; c=relaxed/simple;
	bh=7fFbUw1U/2QQzRDr45khMaERBVpSzu6OjuqfVgCakjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uKSDzGpP1eKqSrZ0+6R1R14ODhUPh/JMMzTloI2mYAW7YEr9aLacQ0cqAFyjLObz7+lWpaUpe2fl8jouYoaQ5JXRCVQtFeH1wROXF8vAq6mRMNzmJ23r69eyQpmmRNj8AXpmp612UpBbZnrFvJCaByimhV/jQF5hfbDWc2FGgeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3KjlgqjZ; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3KjlgqjZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlmQCeHM3HMC+LDtHtImQSOwWHRQcW1IEKOP1z1Cr9M/0yqbhZHcctdjIx2lGYF5PbDm+Z3kf9K+cqFVqpUMFfjKXD3LS6TYUf1OtUZK1ZlMwOoc8TiRy2bRRQiGiVmE1BDcMreElmJEvr/Nqq7fmSwpGcmmOkkZ6tpuA1n5erNoMWbKDi+pWb7qMXfB44HG0v7xSL9DBT5L1efIURHU1JTNqLmck3QyXMd+qfWI0ylvM+Axr4tC226uoxMPV+/yZmhWWkFWVWQP8PPyXurxKqEFPMe4jKGDLm8v5qvJh+bQaN2fJyfXXdCECQKEOvPjgfpFPifSDT86C1k5/lNjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq87KmsYX2tTYhx+3jG+niCt0w+6XloK8AJDmu2phrA=;
 b=BAkj2lbo08eFsemM7TFfvWvbU760NMqUkEaFYEvbA1V97T2xrHzaLgvao+ZH9b4fI4C+Yxd5Kf5cJY0frkkEliYp2HX84ISCJsTukz+/u7QEURcZsh0/08axlWbxgRNwkb7+mdUkQyo7C0BYz0/YDeKnEeEzV2n16L2rHLaTuvrRmXfS8mM7yi7DX4jHLH1b4TMIqBLIwgpqHZ9TIxwGJLHB6c8bsv13zVuvRBgoKGGTtUtNdePn7b02mn229dt4e2rW/E52imNa0cWUBIshFJ7tBr/9MSsmSMKfeEQqqOjSkrZsrjMHChXTxIgcBVYf1Ke+XVWDss3YSEDntvVSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq87KmsYX2tTYhx+3jG+niCt0w+6XloK8AJDmu2phrA=;
 b=3KjlgqjZKUCGSu0oAIiYzIK/y0OnmWDV/kCouS2WqVl54guhplG6j0iQqFjdxz/SW/UR5MXd1A9BLWc5duGaSEbujbzhE6o7decc7kxnk746nNJNtvOnT93V8q/0o0QSCRkYfTxNdtFK0r8efD9nrr6gzp//ReGjN38S5FbIK3A=
Received: from BYAPR07CA0099.namprd07.prod.outlook.com (2603:10b6:a03:12b::40)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Fri, 28 Mar
 2025 04:45:35 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::b3) by BYAPR07CA0099.outlook.office365.com
 (2603:10b6:a03:12b::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Fri,
 28 Mar 2025 04:45:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 04:45:33 +0000
Received: from [10.136.37.166] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 23:45:24 -0500
Message-ID: <e6b6970f-43fe-4d3b-812b-7326507ece7a@amd.com>
Date: Fri, 28 Mar 2025 10:15:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v15 6/7] sched: Fix proxy/current (push,pull)ability
To: Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>
CC: LKML <linux-kernel@vger.kernel.org>, Valentin Schneider
	<valentin.schneider@arm.com>, Joel Fernandes <joelagnelf@nvidia.com>, Qais
 Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider
	<vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman
	<mgorman@suse.de>, Will Deacon <will@kernel.org>, Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, Xuewen Yan
	<xuewen.yan94@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Suleiman Souhlal <suleiman@google.com>,
	<kernel-team@android.com>, Connor O'Brien <connoro@google.com>
References: <20250312221147.1865364-1-jstultz@google.com>
 <20250312221147.1865364-7-jstultz@google.com>
 <20250317140754.GD36386@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250317140754.GD36386@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|DM6PR12MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b648435-de20-4772-cce7-08dd6db3603e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTczZ1AyWjhvbUVMbkpWQnRGbXI0dnozYXBPUDJJT2V1dndYeFF6M3REK1Z3?=
 =?utf-8?B?YzBTL2taQ2hNcC9CR0dtM1FGZVg4TDdGeUN6Ynd2SXFlM2FjbmIxaDh4S1J0?=
 =?utf-8?B?MTNydkRLV2NoYkhNWDUvSXUrSlRwZnBzYnpjbzFtWlpodzlES0xubEhhbXpj?=
 =?utf-8?B?aG9GeUl1MGdjL3VpUWJFVXV4c1M5TERrQmd5aW9pZWsxTW9xbUJleWNZWENn?=
 =?utf-8?B?bVhQU0xLWFVSeERXcUtyMHZsM1BYZkF5RUp5OXN2QitqRUd2QlZwMko0MjRw?=
 =?utf-8?B?azdRL3BpdEV1SVprQWwxbUk1cEhtOCtBSTl1QmVnRWdaeWtEYTRxcG1nZFcy?=
 =?utf-8?B?RnU0TG5pUlJpL0NWWS9YekdmRWpmaGRnOUNBbityL0tJV1QvQ3ZEK3c1Q1FO?=
 =?utf-8?B?RlI2a3E3NmloK0pLS3Vhc294Um1QUmYwcFVFbDRtdCtkazJYcDdVc1pMMGw2?=
 =?utf-8?B?Y1lLYURBamNxeDdtMDRWOXRjY1ZlWTh1S0tBVi9GUmJMc1NuYWFHQWk3RzNu?=
 =?utf-8?B?Qll4amg5UFc5REpnWnhyQW41YkN4MlgvVnlKeGNqdWUxMjJ3djlNYVBkcjBO?=
 =?utf-8?B?dkNra3hsbjdTbkR6M3JVOHZOWUxnaUJ1MHhjMWhCMklvUFRRdHpGbjUzclg1?=
 =?utf-8?B?M2YzWmNkamUyb1VyMjZhNkY2OGV4RDUxc3N3cVZ3YnNvWWFwd2UvbVBOT2px?=
 =?utf-8?B?SnFSM1ZVMWs0QUF6aUZXMmhGMGpLbFJKclNleUsvM2VOMWIyYUo5TDlMVG1v?=
 =?utf-8?B?MjV6Z1Nuc3pkaEdPcFpTMDlMN0Q3c1RCQ2x1ZHhJOVlaOEZpdWpLbUVRNXB2?=
 =?utf-8?B?ZU5URFJzMnJEejhDeVRvQm1NQ3NrZjkra3R3K3pWT2ZFdURLZTFiRm1jUkU4?=
 =?utf-8?B?a29SNUNrQzhTOGg0NU1XQU9ZZ1Vid3ZubTUyNStkd0VFR1Fua1ozMEtzQk9R?=
 =?utf-8?B?a0JzZzN1LzdEVWlRSlEwNC8wVDhMS3pmdEhiaWRjZVFjV25ZeWFiMWFQdWxv?=
 =?utf-8?B?U2JkM09DZ2hPSk1jSDhPMENUYjRxR0l1dU93a014eXovZXBMTVd1M1BwRjZY?=
 =?utf-8?B?OXkwcGJtZEJkN2dYVkFUSU1LNWJYSHpsVzg5cy9TZEdhQ0FKblVraSt0ZWZj?=
 =?utf-8?B?ZE41T2ZaNXZKeWpRME9HUXlDbkRMSHZhWGtHc1diNlRJR2pWdVpVZlZoeXVE?=
 =?utf-8?B?WDFkVmpuWTV6T0h0cjY4Vm5adnZaa0UwMzJNd2dnMndBdFBoT2s0SnZuYldG?=
 =?utf-8?B?NndicnlmaU9YenhCS3o3dGJPSjJFRFIwVmpJWml3QUJyR1lnUHNTTkdHSG5p?=
 =?utf-8?B?bmlMMy9oSmk5NnV5cDBkaW85Qk1ONk9obDZOOG9qZEdUTmx3RHdUTXlkQjAz?=
 =?utf-8?B?UTJoTkh4SkthRzhRNFZheEJqand2TWNIT3FYdkN1NklDZXF4ZnpxTFRqMTll?=
 =?utf-8?B?TTloWEFUMklNQnpGZkZHajZpOGRaMkZYVDkvODVUdmpsNE9Nb1FUTWpQOTJO?=
 =?utf-8?B?KzRXQkFHTHk1TzVkNWs5aXEzSHRLZWF6Skw2TzM5L214RmtXdkcvYW1JUHdU?=
 =?utf-8?B?RXR5M2RaaUptR0VTdXdvR0N6SisxaFJCbEordlg2TXdLenozZmd3ZEM3NDI4?=
 =?utf-8?B?NkgvczZCUm1DekN4ZlhNbVVCRlAyZ3RVcEk0U2l5Ly9Yck8zUVgvdnlNUnhu?=
 =?utf-8?B?dzY0V1A0YmI5UlpFeFBIZnZIbGpaTmhUZUlhNytkcTcrdkEvZjEwMzlyS0J3?=
 =?utf-8?B?RTYyYkF5RTdLbjJFV05lVmVya2V3T1J2S1BxMGxOYTk4VktXU1dJT1c0MjNI?=
 =?utf-8?B?aWFWcFRCaGllMkJVdE4vVm9ucXRHVTMyb3ZnRjM2Ri9lYXF3WFRna1NEZDZQ?=
 =?utf-8?B?UDdaK3RNTG53Tk1YalRVYXBxZDNkWG8zWmdDL2NzVVVTNjVGdTMrMkQ2N0Vo?=
 =?utf-8?B?RDJlazd4NWFjRVIyVW9zeDQ1eUZVbldETnVjRTBOV0JhTUJySitScXpkQ0Uv?=
 =?utf-8?B?ZytEZWordWN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 04:45:33.6998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b648435-de20-4772-cce7-08dd6db3603e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153

Hello John, Peter,

On 3/17/2025 7:37 PM, Peter Zijlstra wrote:
> On Wed, Mar 12, 2025 at 03:11:36PM -0700, John Stultz wrote:
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index b4f7b14f62a24..3596244f613f8 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -6722,6 +6722,23 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>>   }
>>   #endif /* SCHED_PROXY_EXEC */
>>   
>> +static inline void proxy_tag_curr(struct rq *rq, struct task_struct *owner)
>> +{
>> +	if (!sched_proxy_exec())
>> +		return;
>> +	/*
>> +	 * pick_next_task() calls set_next_task() on the chosen task
>> +	 * at some point, which ensures it is not push/pullable.
>> +	 * However, the chosen/donor task *and* the mutex owner form an
>> +	 * atomic pair wrt push/pull.
>> +	 *
>> +	 * Make sure owner we run is not pushable. Unfortunately we can
>> +	 * only deal with that by means of a dequeue/enqueue cycle. :-/
>> +	 */
>> +	dequeue_task(rq, owner, DEQUEUE_NOCLOCK | DEQUEUE_SAVE);
>> +	enqueue_task(rq, owner, ENQUEUE_NOCLOCK | ENQUEUE_RESTORE);
>> +}
> 
> So this is probably fine at this point; but we should eventually look at
> fixing this.
> 
> We can probably look at (ab)using sched_class::set_cpus_allowed() for
> this.

Isn't the net result in this case just "dequeue_pushable_task()"?

Can it be defined as a class callback to avoid a full dequeue + requeue
overhead for the fair class during proxy?

-- 
Thanks and Regards,
Prateek

