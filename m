Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F441CDFCE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197478; cv=fail; b=sVLPwQJDIXPXj24J0Uq06Gfq5vBY92n346Y1voFbWfTJVKFIf++YtEs/wtxv6pNjUSBUoy3UcYvwaHvtw1i/m19/6dqYdxBxtLagHav9xrXar+S/0NUjGUvn5MQc5xlGNQFgtELl/weAQjVcCVBeiHsaH1/aN65nbIxImt/qIQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197478; c=relaxed/simple;
	bh=rDiNC8jqpEt9ErEC3uRiS5la4apkiElIcJA47c5dJmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WwelPRqqtO3FflEQHxjmkP9CNY48SQnW2IrNJkJwJwQXzcEh/F14SKEJemrgMaGCi7Rxc36mhFUbBBfwPVhXZRIYFfA6ytKIu2Y8OBwQ9S0FpK1j1Ml1b6M2ke3kihsfhhni/PHOH1dRibJ1ggNLk/6ElxqEeyUUiUd49USdqvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sPjJXiRo; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sPjJXiRo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTxHVrZeXmr/4pFI7eniyqAvEGVWXA6ErKK9ShqwvTtDADsUim8uwsTR+HuQi5ts2A+PPSqyWWr0OD4G4qJLMQnUz5yyONkiQ52OrTwUqjfRZ7gcPpr5NCuVki94UP2RUUEkbF8IEd8tiLk4Zgff30MLxv3+soAVqCQaVXjtcjMTrRHQMtUVFfIlEXBdPtL80GO66BFogQ5bvDeOUocmuP6qXn3UOeZdD0aG0ChbsVn+5GxGqs0lzpqxQVEZkyH3SKWNoZKGTD9wYrO7St35iO+PwOFONOOAmQxUmnDuAtt8Q5MhISbJXDylxLmMQnkL+PEN8YTFmygyzr/Ied6zYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLELQLMINO9qAz1byZw8ZNJQ6w80luvGuGM3eeBFQfM=;
 b=jxXJt8w4o47c0wHSwcCLukS9/aaGu/lsZ9QHHFr5PyoXkA69w8IDAWobCncEfEdH7J5qVCiq5QV3wghOdr2ZhBgmpcPUshrTeMqVvk8KcJaEuZbhz68ApKYmX+zR3iYPwO2Il/xxWdkcMawAFtyfNW12Q4kt0PCa15CvYLI6nd8wrUV55tTdBRBz425h4i5nztChuUZytE5gQeoBG7h3ssD/pEw61eFLHnIsufjjLheaGNQt/4tTCW5Obn/Mz4OyibakSr/sozTavcsfnOc8InoBko/bxZBjm1J0sR8cHhpADNyYPcCJLK7ptrOdy1mEnpIMsphLFLm5IhAp0IcfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLELQLMINO9qAz1byZw8ZNJQ6w80luvGuGM3eeBFQfM=;
 b=sPjJXiRoX/1LzvLLapKe3Qp2SmrKGtFLbM98OqvnpiywIkxMsSSVLJOFC48Z3X0ObuEqbxlPNK3HuaykAT761cB0XPwP6mvkGfob6yECmhPLB6m/yW32l1GjyRayoD/a9E092B0qqa6O0hzpe3un6boNt90OdNrDS3USX35X3CU=
Received: from BYAPR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:74::36)
 by MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Wed, 9 Apr
 2025 11:17:49 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::33) by BYAPR05CA0059.outlook.office365.com
 (2603:10b6:a03:74::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.11 via Frontend Transport; Wed,
 9 Apr 2025 11:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:17:49 +0000
Received: from [10.136.40.198] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:17:44 -0500
Message-ID: <65eddd6b-c635-4ae6-b9a7-fc62cf44caa3@amd.com>
Date: Wed, 9 Apr 2025 16:47:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] sched/fair: Idle and newidle balancing using push
 mechanism.
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250409111539.23791-1-kprateek.nayak@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|MW4PR12MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: b57b6028-e4af-4403-1e59-08dd77582989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGY3YTQzYXZoZHdrNUtURmx0S0ZuNm9MeldPVGRPTlljK1RFS0VNd2F5WmVU?=
 =?utf-8?B?WG1MUG4vaEZmYzB3VGsxbVNZUloxdHFscStNRENWamJDSE1LdUpWM3ZjV1p2?=
 =?utf-8?B?OUpnRnY1Y0xyM3crYkZJMFhRQzQ2Nkxha3BNRk1lc0NTbExkV1Y1bDF3cEp1?=
 =?utf-8?B?WTk4NlBlNlVNMXUzZzlrUUhvTUhwQWp3WU1jSktZcmRqTmk2bjBWdHZDUjRW?=
 =?utf-8?B?QU5zK1ZRamZPYVc5STl2WjlIQkFVN0gyaXVOS2tIVXpsNE92VzJZeFo3OG4w?=
 =?utf-8?B?ei9td3Y0OUN0ZkF3TkQrbzlJMVY1UkJGUVVOV2pueDVrSEczYzdhcThNajRN?=
 =?utf-8?B?ZHg5NEUvdEF4MWZlNWNMS0xBVmVHbG4ycVBWeW9FTVNiSkpOL1hZOGM2ckxK?=
 =?utf-8?B?N2QvelpWUlFWS2p5ZGplM2dVVjE1R0FHMXR5NVhPdFVHR1E0eEZDbFQ5THJu?=
 =?utf-8?B?RXhiay90eDYxQ3FxTDZQaDQ3Y2VyNjRFUCt5RWIrZmJ5akxkSFZHNFBkaVJU?=
 =?utf-8?B?LzEzZGZ2elFHbUw2VzZjbDRIZWVRR1UrMHlsdk9SclNPOWpOWk56NnpxM3c0?=
 =?utf-8?B?V29UTFRPdGZSVmlYUVpKcVFiOUc4QTZKZSs5YzNxWlBCT1lOc2pnNWZLUHJQ?=
 =?utf-8?B?VXpla20reFVHRkJNYTZCYUd4Z2JpQUM5NUxhNVlCTEVtR2FZb0ZnYkFUcFQ2?=
 =?utf-8?B?UEg0cVR1OUVCVXVQOFJqU0duTjg0RUVibDVzWjA3dlhxRk9yTDFyeFhOMXln?=
 =?utf-8?B?M2o5OTN0Y1Q5RWFQR1M0a1NhUkl6eTVaSjFSSUdzSCs4cVQyZDJWeXhkQjI4?=
 =?utf-8?B?L1IxL0EyVmtNNDhxU0k5K3JFeVhvc0VqNUFmVGUwdUNTMG4zL0JCaTRSZW01?=
 =?utf-8?B?Q01lNm5Ld3ZVaHArc3pKV0pWZHkxZ1dyS2tRSUxVVmZlcFRmN200MlVWTDMy?=
 =?utf-8?B?bm5FOG00a1hWN0FiODZnZmRtQTI2TGp2MnBSd2EyU1NWTVdoTWR5WlB1NHpL?=
 =?utf-8?B?eTZnRmZFR1lBVUJ6RmpteDdBMmE4NXVXWXp4aCtzaWI2d05vRDd5WHNFN2pY?=
 =?utf-8?B?VjlCVElZeDJCOC9jQkFHN0lTcTE5ck0zT1ZhZnJ2UmpXZWZqN0xQK3BtSGUy?=
 =?utf-8?B?SmprM0pSRGVqN2lDZFZpUVZpTXJTQ2hiZGZvcTQzWlVhZnloWUsxWVNXU1Yz?=
 =?utf-8?B?LzJWdnhsZHZNa2ROcEt1VmNiRGw4a1NGaWJMaG14S3VFc1c5UTBFZUZ2ak5j?=
 =?utf-8?B?SDFjNXBHZGlBVWpIT293SDVSTnhrODZyY0NqRXpsanZNOFVFNlRUeHc1Tzhx?=
 =?utf-8?B?Um9sYVJDYjVERGNiR0g0UFNvRWRtVktsRmoxOENQK2RVd1FwQUFyWDJBcFpz?=
 =?utf-8?B?TmNLM2dxRFNqRGFNWXI4a0Fmcmk1Um1TSU5EbGNCNy9kemRIcC9Udno5c1B5?=
 =?utf-8?B?WVFOeGJHSy9NaFZqdTUyZzMyUk1NSHhZdFhpamp6bTN1SXpPWXFBaTJsZElP?=
 =?utf-8?B?Z3V4NGYveVNQYktsNkY0RmVNdWpnMzYwczdUUG85Ym5sbGZIK2FQWkMyRjFh?=
 =?utf-8?B?U3RRdnlJd3NnMHE3QUxRWFA0SUVtcDdDRUJTbUZZKzFuZXN0M0VoeHFPSmFW?=
 =?utf-8?B?K3JLcDJVZStTUHc1ZTFkVXUwRm1JMFV2Q3dzWENzWVdxOVc1c2hWNUVvKzZH?=
 =?utf-8?B?Qm43MGJmMDBYb0NoVjFmdUFmeTFXdDFrUWRVS25mdk81T0hWcmNRVnR0cUd3?=
 =?utf-8?B?TzV5VUVIdUZHcG9BOUk3cHIrZlNhSFFZYW9uZzR0TUlCODVseENjcGVDNW5E?=
 =?utf-8?B?bVlTSUZPbFVZN21GQ2FVMUp2ZWg4bUkyb05UWWZ6d21qVXdkQ0F2c0JWZTJ2?=
 =?utf-8?B?dGE0aHRGa1JpK3B1U092UXZ4K0s0Q0dGbW1ya2pHZ2NTZjl1STJCaFB5Mmhy?=
 =?utf-8?B?OXc1VVVyblREUjJpQ2ZTa25KWGFYdCtiY0tPQVhwV3V2QkdMaE0rb2plQk9r?=
 =?utf-8?B?QURRVGZOa0FZKzBXSlJYSjdIL1RNcTdxcTRsaUZKZTI0THpuQ09SMVpXc1Z1?=
 =?utf-8?B?SnZuZ3NPTkdrdGc4elhuL0RMazN4blhGTDMwUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:17:49.2751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57b6028-e4af-4403-1e59-08dd77582989
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873

Missed the most important part ...

Subject: sched/fair: Idle and newidle balancing using push mechanism.

-- 
Thanks and Regards,
Prateek

On 4/9/2025 4:45 PM, K Prateek Nayak wrote:
> Hello everyone,
> 
> There was some interest at OSPM'25 to explore using the push task
> mechanism for idle and newidle balance. This series implements one such
> idea. The main reason for the RFC is to understand if this is the
> implementation people were in favor of before trying to optimize it for
> all the workloads from my test setup.
> 
> Note: The current performance of the prototype is rough. I haven't
> optimized it yet since I would love some feedback first on the approach.
> 
> 
> Current approach
> ================
> 
> The push task framework for fair class has been cherry-pick from
> Vincent's series and has been implemented for !EAS case.
> 
> This series implements the idea from Valentin [2] where, in presence of
> pushable tasks, the CPU will set itself on a per-LLC "overloaded_mask".
> 
> The inter-NUMA newidle balance has been modified to traverse the CPUs
> set on the overloaded mask, first in the local-LLC, and then CPUs set on
> overloaded mask of other LLCs in same NUMA node with the goal of pulling
> a single task towards itself rather than performing a full fledged load
> balancing.
> 
> This implements some of the ideas from David Vernet's SAHRED_RUNQ
> prototype [3] except, instead of a single SHARED_RUNQ per-LLC /
> per-shard, the overloaded mask serves an indicator of per-CPU rq(s)
> containing pushable task that can be migrated to the CPU going idle.
> This avoids having a per-SHARED_RUNQ lock at the expense of maintaining
> the overloaded cpumask.
> 
> The push callback itself has been modified to try push the tasks on the
> pushable task list to one of the CPUs on the "nohz.idle_cpus_mask"
> taking the load off of idle balancing.
> 
> 
> Clarification required
> ======================
> 
> I believe using the per-CPU pushable task list as a proxy for a single
> SHARED_RUNQ was the idea Peter was implying during the discussion. Is
> this correct or did I completely misunderstand it? P.S. SHARED_RUNQ
> could also be modelled as a large per-LLC push list.
> 
> An alternate implementation is to allow CPUs to go to idle as quickly as
> possible and then rely completely on push mechanism and the
> "idle_cpu_mask" to push task to an idle CPU however this puts the burden
> of moving tasks on a busy overloaded CPU which may not be ideal.
> 
> Since folks mentioned using "push mechanism" for newidle balance, was
> the above idea the one they had in mind?
> 
> There seems to be some clear advantage from doing a complete balance in
> the newidle path. Since the schedstats are not rigged up yet for the new
> approach, I'm not completely sure where the advantages vs disadvantages
> are currently.
> 
> If the current approach is right, I'll dig deeper to try address all the
> shortcomings of this prototype.
> 
> Systems with unified LLC will likely run into bottlenecks to maintain a
> large per-LLC mask that can have multiple concurrent updates. I have
> plans to implement a "sd_shard" which shards the large LLC making the
> cpumask maintenance less heavy on these systems.
> 
> 
> References
> ==========
> 
> [1] https://lore.kernel.org/lkml/20250302210539.1563190-6-vincent.guittot@linaro.org/
> [2] https://lore.kernel.org/lkml/xhsmh1putoxbz.mognet@vschneid-thinkpadt14sgen2i.remote.csb/
> [3] https://lore.kernel.org/lkml/20231212003141.216236-1-void@manifault.com/
> 
> --
> K Prateek Nayak (4):
>    sched/fair: Introduce overloaded_mask in sched_domain_shared
>    sched/fair: Update overloaded mask in presence of pushable task
>    sched/fair: Rework inter-NUMA newidle balancing
>    sched/fair: Proactive idle balance using push mechanism
> 
> Vincent Guittot (1):
>    sched/fair: Add push task framework
> 
>   include/linux/sched/topology.h |   1 +
>   kernel/sched/fair.c            | 297 +++++++++++++++++++++++++++++++--
>   kernel/sched/sched.h           |   2 +
>   kernel/sched/topology.c        |  25 ++-
>   4 files changed, 306 insertions(+), 19 deletions(-)
> 
> 
> base-commit: 6432e163ba1b7d80b5876792ce53e511f041ab91


