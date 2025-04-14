Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A617A2FF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744603130; cv=fail; b=T+f38rvR/SrzHsYkttvk4oDkP+0E4yRZqu+jPn0SVRWTWLKR8tbG/qNz0dZ8WtK62EptFCxiSROCfcXr8vnl8G8cF5CbJNb7J651q0bdJi3aOidh5UtPpoPweFPbHeQg7tnhC6rwqga7L/i1RPbFP6PjGVRjYSwaqdhH4Vv5Dqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744603130; c=relaxed/simple;
	bh=KhO94GY7l6+4EzeGgcoDRAIgeBaGczWQdHmygBDzgnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=juuRVP2uVhOgkDv3RNIXEMH/4tqRhQYMgKqhGYzlCyZ620ARF6UUPzZ/HJYkL1iCV/5Cn60ogV9goiJXxCNgqGlJYD6Euyp6DcsGldzFWvea0aSzdJC+E96tPSqX6P83sIyUr1IpBEOBe0XKIVN/PiVo84+gESAXU7Py+Zi0hjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RUtFGKKy; arc=fail smtp.client-ip=40.107.96.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RUtFGKKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXm4mjh928SfNWzUXHKRMXhIoq3o+0d63/08edVj2iG5w0SeIrufcUYKxOFbltNnFSX/E0Y2CHc3ethdAcC9YDEh/1pXxFoXdOTtbuI4Y6I9tDsPyVnbIcuG4AdqUYabl2lm8w2PBYMU9F0rM/fcn5Qli/xiQF2SGFi6DlCyR0ebB6XixMGe4S5td5LbYBTncn8JnB9pZm9i7T5Hx3rslIfuYBczZDYAVQ70ObZYLHb2n7Kf+ka/GsqqMV22EUeK4uxI5fqvqgOc2e6WXgZm0xbqcdiAN7Jh++l0C8PIvOqJETpVDCnzu9kkz3jIaLbPoIi+TX2LJ3G1JC/6c/44wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L0W7h3Ix6iz3Vynwdh/MH3CdcoRCMoxd3JEbtdToQ8=;
 b=TNxu2Vtr23F4+AhPOB9rAvo8g92BGv76zCrBnL5HV2LGCYiRPc5oCSSvO8+RBJUrwXaBC2gunsvfqWJjd4xD1a0hwMzpmq8WQmJH7J34+NtQZmipPWd9b/g9Sf1IxKtdR6OpRqvXvvhjZBTu6TQfwd0Ld/BjtqZjQWCsGjswcXJF74fRw2iZKOJN9f1NdbY1VaWesVN8plx25WZ3mtThMqNjnjO3qWjjGC3aBeNeafVgA52B6A1TSBgDYtKXnehOyRT8fWYF68UTw3khTdi36fK1XFya0rTqjcMNKwJmDTJp2+0dmZ6UGMoAbz6Ev6ckJPRVG56SNpv//JJL5f6FFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L0W7h3Ix6iz3Vynwdh/MH3CdcoRCMoxd3JEbtdToQ8=;
 b=RUtFGKKyT7dGzYGkvMgielPBG/YVUx4k+hjdsjd+Om05Q/z36oA7Prg7SEkWz3SBf0CKsm/sWqvXYTZ6WIKc80ZTiFqjp/Kjh8DPhpRs1/CNnZ59LkNZNRBEC587o9jTAOV6A2EuJ21a9onzPRCH27mKRQ/WWLUjJVRnckNDh54=
Received: from CH5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:610:1f4::19)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:58:44 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::9a) by CH5PR04CA0022.outlook.office365.com
 (2603:10b6:610:1f4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 03:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 03:58:43 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Apr
 2025 22:58:38 -0500
Message-ID: <a227dd46-e6ec-4cc3-a0a3-427c4ffc9d07@amd.com>
Date: Mon, 14 Apr 2025 09:28:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/7] sched/fair: Add related data structure for
 task based throttle
To: Aaron Lu <ziqianlu@bytedance.com>, Valentin Schneider
	<vschneid@redhat.com>, Ben Segall <bsegall@google.com>, Peter Zijlstra
	<peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo Molnar
	<mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi Wang
	<xii@google.com>
CC: <linux-kernel@vger.kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Chengming Zhou
	<chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-2-ziqianlu@bytedance.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250409120746.635476-2-ziqianlu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c246fe2-0f8a-4636-56ca-08dd7b08a600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEhlRnBZMjhudHVVSVhDQWNCT3ZVZVNycmJJUDlYRU9QRmpGTTJjSHF2ZUZ6?=
 =?utf-8?B?VlN6VjdEYUdjRWJEU1I1U2lZcWdrc1MzNlQ0QjYyR0NEVVg5bURocjhjR3NN?=
 =?utf-8?B?Nnd6UGhxeE1UWFFLTWl0Y0xtK3JUUXl1UEYxTTdObXQyOU9OQlpLcW95Tjdr?=
 =?utf-8?B?WUg3OEI1MHhsYjVLdU04VEVDNFpXUGllTXRmcUhZb0tDbUFSK2E4SFhiNmJq?=
 =?utf-8?B?YWxPc2M2cXYyaFdzQzRVVSszZW1Zdmo5ZkxVWE1ybEN2emZQdXYwRTRFTE1H?=
 =?utf-8?B?bHVEUTF3VU0vc2wvM29lZXNvNVN6WW15dUd0djVuLzZSVjRyc0NlbE02dlFL?=
 =?utf-8?B?ZkVwYzNXL0RReVhVcVBIUzk3UmJlRGlnWTgrMVlySEh3NTdFcmwwa2cyWDRU?=
 =?utf-8?B?Y0NKYit4MHJxWUFTWnBEZkpuMjEwVlNjUStmYlFPWm5yV1pXb3ExM3VQcVlE?=
 =?utf-8?B?eDVKaXNyTmtvZGs5UG9hajZQbC9IVVJFT0puVU0rVmc0YkVwZGcxalFEUEV2?=
 =?utf-8?B?d1RvNWhhQUN3eThhRnlwdThiZFpOQllWZ2RETWpmL0pNOXV4RCtCMDVWS1Nw?=
 =?utf-8?B?MGhyRzJJZElZNlhNOHpnd0RjKzBqb3BmSWgwL21lb1pwc29ZVVdVeWQzeTJh?=
 =?utf-8?B?RzVJZk5WZzNCdlNTT1ZZVHlaWnV2ZlExT3JRUWFuSi9KVnBIeVVIWDRGTzdz?=
 =?utf-8?B?VW1BV3drUytSWVBFUHkxQ1ZTeE1WR2JwT0J4SmRjZ0xXNWRUOFNvSUQ5LzZK?=
 =?utf-8?B?TWNncnBTYU85RHc3bzRwdFhiUVdrTS8vV2lqbGdDVWw5N25nZHhPQmgwMDhP?=
 =?utf-8?B?SS8yR2dQU0FxYUozRzEwRi9oQUZqdStYbEpTR2pDVzlUOUtBZC9aU053RDZt?=
 =?utf-8?B?dmxRMEJXdmFWa25sQnI1ckJKVjM1QzNsK3c1a2lhazVoc2x6cVN1SHNvZFZ6?=
 =?utf-8?B?d051L0ZIUGQvMDN2NnVPeHVsdWJsMjVpbDgwR3h5WmpsNUMyTjJQaHYzYmVl?=
 =?utf-8?B?SGxVcGhOc2xrZ0FXcjFGaVNLVWJDKzJwZStubWExMGt2dDFsQ05LRDhrcHJU?=
 =?utf-8?B?THN6N0R5dUpqYzg5RmVnUElaOGZPMkUyaSswSDJBczErM2MwRFdRMDFxeXdB?=
 =?utf-8?B?ODdwSlk5UHl2Vk5wb3VvdTZBejE4dTNJdVdsdXBPeVI1NzRNeVZWVmhtRG4x?=
 =?utf-8?B?dFhseDB1WnB3RjJZS1hUZThIemM2YldmVzdZSHpiUWhFRUxCa2t5WVJPYm9Q?=
 =?utf-8?B?S0VaenM0Umh2WC9rTHNYSVpPR1dFa0FOM2pucmV1MWpyY0d4LzVjemVGZmR6?=
 =?utf-8?B?ZmprVlVuMU55NU9acVBLV0hqVFFBMC9udjlRSjR1MVJiMUNTdHM3eVJjb1lX?=
 =?utf-8?B?aEQxbWlQakVrb3VxdW5ZbVBQRVlwY1F6Uld1Q0NhZ2l0R3p6REpDVjcwc3Vk?=
 =?utf-8?B?NFdyVVhhQ2xpU1VvQnRBUUxKNUN5dXAxcTdjS0hNM0NLYmtJNnh3b1h6Rytj?=
 =?utf-8?B?WUhKNzVFdVF5NXJWb000MFhzdHNCeTFSYUpwQzhjS241SnUyR1RnaHArbDkv?=
 =?utf-8?B?eDczK3Y0MzBrWTFWcmc2M2ZQN3pqa1gzMGVXdytUSVlERnRtOW1ZcVpTQ21V?=
 =?utf-8?B?ZitVazJzMHhPNWtSUGVtVnF3bWZWYXpjQzF0YWRPamZDYlZhdCtGUGhNOTBE?=
 =?utf-8?B?cTBHNU0vKy9oc0FVdExNcW44a2JGRzROVUFVR3A0RWtNTXpGaUV2d0FxUnlR?=
 =?utf-8?B?dFk1cmhYTVZDblhPT2lWUWJKYzZ6UGVVVE9YQ3hyQUdQU2NiQ3NlU1MwUG9Z?=
 =?utf-8?B?SFhncXJLaUVDSWZ0eTc1S1NtNm5rbTZNQ1NDM2x2bU1LRk5YL2FHb1QydUxG?=
 =?utf-8?B?TkpvRDJLSVNwNXZZRlBPVFZ3M3pTNUtDd1o1bEhKUzcweUlNdVkvckxuQVVl?=
 =?utf-8?B?SHVvRWVXd1JJZStpUWJXbGNYbDVZNkU0UVk3WGR5TFBjVUlELytyZzZxSVZE?=
 =?utf-8?B?REJUUkc0cit3YzY4N0Z6SmVXVlMyZXBDVWdhLy9KVWlFU21ocmJSc0VVYnI2?=
 =?utf-8?Q?x2Se4C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:58:43.0848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c246fe2-0f8a-4636-56ca-08dd7b08a600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371

Hello Aaron,

On 4/9/2025 5:37 PM, Aaron Lu wrote:
> From: Valentin Schneider <vschneid@redhat.com>
> 
> Add related data structures for this new throttle functionality.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> ---
>   include/linux/sched.h |  4 ++++
>   kernel/sched/core.c   |  3 +++
>   kernel/sched/fair.c   | 12 ++++++++++++
>   kernel/sched/sched.h  |  2 ++
>   4 files changed, 21 insertions(+)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f96ac19828934..0b55c79fee209 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -880,6 +880,10 @@ struct task_struct {
>   
>   #ifdef CONFIG_CGROUP_SCHED
>   	struct task_group		*sched_task_group;
> +#ifdef CONFIG_CFS_BANDWIDTH
> +	struct callback_head		sched_throttle_work;
> +	struct list_head		throttle_node;

Since throttled tasks are fully dequeued before placing on the
"throttled_limbo_list", is it possible to reuse "p->se.group_node"?

Currently, it is used to track the task on "rq->cfs_tasks" and during
load-balancing when moving a bunch of tasks between CPUs but since a
fully throttled task is not tracked by either, it should be safe to
reuse this bit (CONFIG_DEBUG_LIST will scream if I'm wrong) and save
up on some space in the  task_struct.

Thoughts?

-- 
Thanks and Regards,
Prateek

> +#endif
>   #endif
>


