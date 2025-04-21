Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9614F98
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214880; cv=fail; b=fDtJjSX1VOaYayT8bASGM/UfK/dmMAInuC9N7jWQ/9Ojmf6wbBdzyx5LJKZf9GsZsehQumDu37NWJHlBD1xAD8cBJRgL8BvXGv64IzTPj5hSwufJBfWWqd4HWwknKavNb30T2wva9GPDbQgQLVt8SA5B1XTjxT9BKwsYRgVfkbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214880; c=relaxed/simple;
	bh=md6/Ioyp2Wq1DwCXmLZ4R+9c3rcMO2gcSBYkEe9fDmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MbD6Ynzu/rsviAMJC1sC5LEbtz8pGIeSXq7ZLgsiIl8ZC+dS+ulqIOz+WPFk7nzOXq6l8eA+D/vMQ6QmrkOG9wkgwzn+YBnLJnjIDXTHY0TRKrAUutxO+hJ5OOHaFTRpM2K9yJazDatmy5Ks5Uzg+py3uJQ+nHKZFZhGS4oTNO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0mJo3TCA; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0mJo3TCA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhcUPmfM6zyxmQwZME2PstV8lGuyW9rs1Cv37EGzDYF8BTc2Hd8nm7jRFsFOJL3aO+DK2+8VK6GcuD26xP053qhea3Poc/E5KBNVMTYiIdEqEw8BtRTeAnw0soU4JWwqRBmeINFDGlZWhnflJIZCgXJQ0aprj9yYU/PISQX5Zxcr5q0zasw+DGKmOQL/HaHpSUt7SQ1IZXLwhZrVJDMi6X0+YDg9NLnaakVUkrRh2YtKyMMqS7HMd4vDPTi7xaeR3Sz+/y2fXKTpUaYkkYNW3Hetd15kVNZsiLC/edgL7WAWhUzB+uh6JhDhVuV19F/U4iX6k0RmyBKfDx89C7QYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiA8EobEkoQyWa1My2WyCNxfX5ooqe2ONM8XyINa/zY=;
 b=IK7hRYaLwb1jjxFDp1Bz86RcNy7GVtobbCvEQZohK0UC9XuKKEFLO0QvDcXZXokUvJkUH53xNI67XQqzo3I5g5Q+mhS39Yq114gIhopjHe+hPAYsHN3Q7Gw/7bxJYukIibIKTSPRdGzYtTF5/Pr2sj7RXe9VD37vgDeLa44lQk6qxqmIserbSUVY4AZzkm6clv2JLofMUIwux8p+TvzPxlGmBkbK5iNFfGbpejD2eJvs21pS8Ki04I1IPbRum6M97QwWu9JbU3qXpJdFH37S98yjgcAHfP1FVubEkgiXlNXBeXTJ9gzzyaeXR8JjXDubs53D687nskylMLzHhXNMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiA8EobEkoQyWa1My2WyCNxfX5ooqe2ONM8XyINa/zY=;
 b=0mJo3TCAATgtFk2pUDKmC6ZSqLZuAmN90sSM7PuaWbP0A6VPGqlJJeShfSXxUZ990TVuxDkLAZZwVA/3LY7iH192A2+9wLB6wQmkcN5PjRnvH6EIET8buSAwIador0J4J4Sg/kzt7Mmb+5FjjFHUPWpuC5mlQRy1+QSMtGVh7oY=
Received: from MW2PR2101CA0031.namprd21.prod.outlook.com (2603:10b6:302:1::44)
 by CYYPR12MB8964.namprd12.prod.outlook.com (2603:10b6:930:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 05:54:34 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:302:1:cafe::31) by MW2PR2101CA0031.outlook.office365.com
 (2603:10b6:302:1::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.10 via Frontend Transport; Mon,
 21 Apr 2025 05:54:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 05:54:32 +0000
Received: from [10.136.43.233] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 00:54:26 -0500
Message-ID: <616187d5-e178-4fa5-a0a2-1509f11d1a37@amd.com>
Date: Mon, 21 Apr 2025 11:24:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] sched/fair: Update overloaded mask in presence of
 pushable task
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>, "Dietmar
 Eggemann" <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, "Gautham R. Shenoy"
	<gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-4-kprateek.nayak@amd.com>
 <2dae733a-689c-4574-a4dc-f59f11fb0893@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <2dae733a-689c-4574-a4dc-f59f11fb0893@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 96107baf-1143-4d11-5805-08dd8098fd51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elh4a0VjL053WnhNVDAyKzM3QVk0SjJOZzJHUW54VFV1MEYyelpWT1ZPQ1ox?=
 =?utf-8?B?YlBWNDJlelN2bHQ4K3dGM1dTREJRUHdmdkRrWkZKRTRpUVVncEhSdWhqSXRj?=
 =?utf-8?B?VHF0ZS9RdXl6Q2t4dC9aSzdpNWpSODgya2NmVk9ZUEtvbE8vR0trUVRmZ2lB?=
 =?utf-8?B?NVc4clVFM2tzMU1NT21pWnRwT1ord1ZpUnJweUZXUlRGcjV1cjRwNytsanFT?=
 =?utf-8?B?K2NTU01EbmJrckpEd0dJUXFEd0N6N3EvRU5JTHR0a0xxTTlmOFh0U080OHIv?=
 =?utf-8?B?a2pXbFhrMGZsRWhnZnNzUVV2UTNPYzlXOEhkN1VJUTFFMFdGcmJtNEFRWklS?=
 =?utf-8?B?dlR1aTNycEptUEtTNmFZMmd3NVQvbXFFcE9LZE5JNkk4TDZTSEF1WUVQbUIv?=
 =?utf-8?B?M0p3ZkphT1dFTDVhK2VaZWVjSy9nZzVpdldZR2l1NDdPbG1KYk4zby9RZ3dx?=
 =?utf-8?B?RVdVa3dQRWxPQVlVODd5dURrYmJUaDBwbzVVTWp3blBiTTNDSEdTUUJyK3M0?=
 =?utf-8?B?UkwzdmFRMHlEcS9YZFQ3WGJGN3hBR2dVRzJTWENMYW9NUEpnWVBzNGJJS2Zt?=
 =?utf-8?B?cnpSb3F3Wk0zL0VWNGF0aEZ4Z081U0k0OFdUQ3VNelpjYTlXMjU1MFg3UnEy?=
 =?utf-8?B?a2Z0WnRuYS9SV01FZksrSGJnakEvWEVLei9FWkozTHl0U0VJaW1sSzYrMWYv?=
 =?utf-8?B?d0xuTG9HMnB4ZHFBTXRPdFJMdm9nWWFraEZUMlFaUlAxMUNHVWhwd2lKd3Q2?=
 =?utf-8?B?SStkVWhkcEdPTldmMjFDbFI4RHhHbFBxcFBLS0ZKdEd5WkxQMWg1QUVCbUFI?=
 =?utf-8?B?NHpDRkNERHZPTG40MzQrU2VMOTA0VE56ZTZDU3Y3bzZieHg3WXcrUjI2MkYz?=
 =?utf-8?B?Q1NncTFlcVo4Y2Q5L0ZMcmxTVm5UeDB0K0tBWUFXanFqN3U3MUpkYk1ldnEx?=
 =?utf-8?B?YmZDQ2NiWkQ5VzRQdDRnVDkvS0lRN1RuQXE2MXprZnZVWk5BNG9iS1l2MEtw?=
 =?utf-8?B?ZEFoR1M1UzZlVmxwV29ZK00wUnZXbEtaNm1qclBPOTBQMXpYOUh6T1Vad0Vy?=
 =?utf-8?B?ZGdJMlcrdXRGbjBYWjJXM2Z4OVo0US9lZEpGL2xLNWRMcmNuWldKL2ZDNUsx?=
 =?utf-8?B?aHcxcDNwSmxML0FUeHY1eXdJWDJOWjAvdUJKMWNiaHNSNEVheitrS3BhVmsw?=
 =?utf-8?B?WGhxMWVGUVdMandOYUVxS2JtUGFQYjlBcFpVWDhWS25PWlZveThuZEFPdmlZ?=
 =?utf-8?B?TVlMSTFSc0h2U3ZzUWlWWUpwM2xEUWpVcnl6NVJhVlR1N1JBNCtPaE1VRWpN?=
 =?utf-8?B?Mkdvd3lPbENjVDI0NHFzNDVmeGF3NGR4SW8vM2RacXFSRG9YQUJCUFBTWVBD?=
 =?utf-8?B?MXFEK25wcE14djZ6cEVvdUFON1YvVXcxS1FDNHRiNnhGTHZjT1Z0a0oyRlVW?=
 =?utf-8?B?ZXVtVFhVQWpNVmE2THdGZUJaOXpUNFN3RDhHcDN3ZEZUWjIyTUFLZVVoOWI2?=
 =?utf-8?B?TzhNdzloT2pqRFFlZk9rZzEvTGg2cXZXMTFNbkt1WXZzSTUrYk9pZ2lLUWt5?=
 =?utf-8?B?RVRrcVpOMlovSVowakROMERzS3I4N3dzR0EzbERqU0NENUROR0QrQ3BHdXp4?=
 =?utf-8?B?K2VuenJ2RTlGZjY3L0V5akhMTTBnS2lCcEJPdUtBbllvSW5DU3Q2Mk5mYkl6?=
 =?utf-8?B?dkkzS2s0eVVoaFBGUTZIcGRuWFI0RGZQTU5Wb244V0ZnU1dHbU9BcFMxc0tC?=
 =?utf-8?B?SHlmdTBYMXZqMHlvL2xSSUtnZXhPbjBoTTVuTTRVRTVHMUc5ckNMbW14R1R1?=
 =?utf-8?B?bFp4eENGanVCY09EOFNBbjdydWRBdFNSeUFmY01MU2l2MEFmTlIrL3NxOUha?=
 =?utf-8?B?Yld2Nk5EL1NXMld3SFBEUm9ra3Q0UXN4U0d3VVh3ZURGdVJEM0h5ZVhmMWxQ?=
 =?utf-8?B?RWpNSGRNdGd5Y2ZRTjdwdUxUY2xjRXZ1a25RVGg4dHZ0Q3BTcGQzNGhqOFpK?=
 =?utf-8?B?ejNrei8rQzU4SFprUjYzeDBNVGU0RllEK1E4LzBYWjBXOGxTNnZkQldJeEcz?=
 =?utf-8?Q?eeteWX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 05:54:32.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96107baf-1143-4d11-5805-08dd8098fd51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964

Hello Shrikanth,

On 4/21/2025 10:50 AM, Shrikanth Hegde wrote:
> 
> 
> On 4/9/25 16:45, K Prateek Nayak wrote:
> 
> Hi Prateek. Feel free to cc me in the future versions.


Will do! Thank you for taking a look at the series.

> This seems interesting way if it can get us rid of newidle balance overheads.
> 
>> In presence of pushable tasks on the CPU, set it on the newly introduced
>> "overloaded+mask" in sched_domain_shared struct. This will be used by
>> the newidle balance to limit the scanning to these overloaded CPUs since
>> they contain tasks that could be run on the newly idle target.
>>
>> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
>> ---
>>   kernel/sched/fair.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 98d3ed2078cd..834fcdd15cac 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -8559,6 +8559,24 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>>       return target;
>>   }
>> +static inline void update_overloaded_mask(int cpu, bool contains_pushable)
>> +{
>> +    struct sched_domain_shared *sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
>> +    cpumask_var_t overloaded_mask;
>> +
>> +    if (!sd_share)
>> +        return;
>> +
>> +    overloaded_mask = sd_share->overloaded_mask;
>> +    if (!overloaded_mask)
>> +        return;
>> +
>> +    if (contains_pushable)
>> +        cpumask_set_cpu(cpu, overloaded_mask);
>> +    else
>> +        cpumask_clear_cpu(cpu, overloaded_mask);
>> +}
>> +
> 
> I was getting below error when compiling. Noticed that overloaded_mask is a local update and it wouldn't
> update the actual overloaded_mask.

Interesting! Question: Do you have "CONFIG_CPUMASK_OFFSTACK" enabled in
your config? (me makes a note to test this too in the next iteration)
Looking at the arch specific Kconfigs, there is a slight difference in
how this is toggled on x86 vs powerpc and I'm wondering if that is why
I haven't seen this warning in my testing.

> 
> Compilation Error:
> kernel/sched/fair.c: In function ‘update_overloaded_mask’:
> kernel/sched/fair.c:8570:25: error: assignment to expression with array type
>   8570 |         overloaded_mask = sd_share->overloaded_mask;
>        |                         ^
> kernel/sched/fair.c:8571:13: warning: the address of ‘overloaded_mask’ will always evaluate as ‘true’ [-Waddress]
>   8571 |         if (!overloaded_mask)
> 
> 
> 
> Made the below change. Also you would need rcu protection for sd_share i think.

You are right! Thank you for the pointers and spotting my oversight.
Aaron too pointed some shortcomings here. I'll make sure to test
these bits more next time (LOCKDEP, hotplug, and
!CONFIG_CPUMASK_OFFSTACK)

-- 
Thanks and Regards,
Prateek

> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index bca3db5d0ac0..818d4769ec55 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8562,19 +8562,18 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>   static inline void update_overloaded_mask(int cpu, bool contains_pushable)
>   {
>          struct sched_domain_shared *sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
> -       cpumask_var_t overloaded_mask;
> 
>          if (!sd_share)
>                  return;
> 
> -       overloaded_mask = sd_share->overloaded_mask;
> -       if (!overloaded_mask)
> +       if (!sd_share->overloaded_mask)
>                  return;
> 
> +       guard(rcu)();
>          if (contains_pushable)
> -               cpumask_set_cpu(cpu, overloaded_mask);
> +               cpumask_set_cpu(cpu, sd_share->overloaded_mask);
>          else
> -               cpumask_clear_cpu(cpu, overloaded_mask);
> +               cpumask_clear_cpu(cpu, sd_share->overloaded_mask);
>   }
> 
>>   static inline bool fair_push_task(struct task_struct *p)
>>   {
>>       if (!task_on_rq_queued(p))
>> @@ -8606,11 +8624,17 @@ static inline void fair_queue_pushable_tasks(struct rq *rq)
>>   static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p)
>>   {
>>       plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
>> +
>> +    if (!has_pushable_tasks(rq))
>> +        update_overloaded_mask(rq->cpu, false);
>>   }
>>   static void fair_add_pushable_task(struct rq *rq, struct task_struct *p)
>>   {
>>       if (fair_push_task(p)) {
>> +        if (!has_pushable_tasks(rq))
>> +            update_overloaded_mask(rq->cpu, true);
>> +
>>           plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
>>           plist_node_init(&p->pushable_tasks, p->prio);
>>           plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> 
