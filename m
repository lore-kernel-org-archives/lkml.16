Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C12E57C93
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744601358; cv=fail; b=X+rgNVIsB+eF8Dyq5Jx4pFBV4b8LCG7kjMk4/ECxUmUx3oWlpg+LeJetaRS/okMlnkut0j/YspRZqyrFjJ5Vv+48dqD4J6TjixQanxvJt6zdJFo6H/1M/3I7MKzqKaeinSaZlPU/5+nwY631bcvqtK5KN/l9yLEM35SOl6N5yy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744601358; c=relaxed/simple;
	bh=HAararilcPUb0OA3wGBS6vvCzfd8HOuo6ynExChhZQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IlVtjzQeHYqw2JL/xSgZ83CDdAE2HFDGbbJihMTMEUxr5FfnyRAmxsBaYNxwd8Kx1X2zrMR4fT/WlAuXu4x7QyQiYQJ6Rgp+BaKmB9Kh4iJ7wnjsgF19oJVLykQ2Pb6r9Lf3/xS5RCaw9CHDoVC6bPKvLucxDVAWb+aw2NVZCno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vdy+1WIm; arc=fail smtp.client-ip=40.107.93.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vdy+1WIm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RF4gC9MKYn0+czcUE5OZKU5xFL/g7Mc6N/v9ZYFXVCmtuBMTJBgH4HvvkxZVYHA+a6/uEKBWxhnEvtPsQGhCikMBMFypiPP9Awe3YUtAZ8OWx4mt0ozWFqpKYlKC2OJ4sqUib3x/gR6Nxq4neXbKASjbum6M9iqhf/qMKPSzxewL6xj+4yaMbZ1eSc2Xy9WikTiVooy2nJqOD5fCDSmDPpQy9X8FKRujvIsQCiu8KvXitFYZGi6xRvotMTImpMeFVHyh3himOdBiNpxKIgN1DGQl7gvKlk9sGpzTGW/XhbNbRPnvncwZzyW3CxwotN/vaEzAkUm75HUj2v9mtYcLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpQDmOzUr2fbRJBv60nYhXLkezfTxV/hvS+fSWg58jw=;
 b=RBMsGmx4iydlQxO1Wxa1khqTNwirCmuOABRQhEtKqXPq03HjSlIKmvDhJfFZw0bbmion5H0eT4Swqmw0PMvpA5tHItZC++ut3nEt7nI+sYsEPhrnDJ5fZBAG4WHF/pSWJkha6KglR6zvZISR3rr9HXcLAn10ue13af4+yZVY5aEcZ1u1NGmdekiKQblYNr5DQSlQcrJsx56TqfhUVwYhZ+U4Y7fM34zSoPL0hdBBVAaP8S8IcXUfD7g9HXe/A5n+aOe2yLreh6IGrlyzHhTjk79n38x/WZHh2o3vPAJpbtkJiENcfQYw35wgo0QOzxyCosBRLfIv2Oq39So8PUWSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpQDmOzUr2fbRJBv60nYhXLkezfTxV/hvS+fSWg58jw=;
 b=vdy+1WImLGDFdt1Na4eBkDFatIwPGPHlEsfzhrfsBbJi3n+7ksrxeevOU77hkKDpu2s9MBTaBw+xj+wZ82bL0geMe0QBYJi9hMcSqxbKzuB6Sz/l46+e8kWZaMEx9WVKYicFYWSPTdSN/gF1Cg+JobatXQ+lJLlF5WgFBmsJfts=
Received: from BYAPR02CA0030.namprd02.prod.outlook.com (2603:10b6:a02:ee::43)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 03:29:13 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::ad) by BYAPR02CA0030.outlook.office365.com
 (2603:10b6:a02:ee::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 03:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 03:29:13 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Apr
 2025 22:29:06 -0500
Message-ID: <c0ac6885-96df-4a44-9ab8-f80f5f334e84@amd.com>
Date: Mon, 14 Apr 2025 08:58:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 6/7] sched: Fix proxy/current (push,pull)ability
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: Valentin Schneider <valentin.schneider@arm.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, Ingo Molnar
	<mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
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
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-7-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250412060258.3844594-7-jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e5bccf-0b8f-48bf-862b-08dd7b04875f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z25rN2lCR2I0NXFqZFpnTzczNkk0eWVBOFFTOG4zYnI4dStXdzYvbUFYd1Nr?=
 =?utf-8?B?SmNBM1ozV0FZcnlYaU9sQUx6aHR0clJuT3lldDlKL2E3bW9UU2pvR2JMZktq?=
 =?utf-8?B?clFPVk9kZFpjSHBTcWxPdi90dHVVTEFXOHNCQ1ZBZzVUWU5sYWdqME14NzFL?=
 =?utf-8?B?S2RtcEJWdUhrVzBtOTh3TXNiUGpEZnRLNG96TFJEUFV4Tk4weEJ6V25WZUpy?=
 =?utf-8?B?ODVxMVFMRDZQVXJ0RkRTMFdNakxKY3Q3SnpFa3pSWktTSXlBcEFRckdZQ1dX?=
 =?utf-8?B?U2dKNndCREU0amxLb0M3MERKcEhzQ1ZGWlhhTGlDT0wwRUVxTVRlbm95UDhI?=
 =?utf-8?B?QU1mUE9pSHNCTU9sR3FlZ1Y1Zm83V1MzeEtpclJUSU43Y1VZUW02L3h1VG1T?=
 =?utf-8?B?N3E2S281eEFVNmpOWkd6T21SbitQdHp0SzhvWHBkREd1Q0JxekZBYVRncXlp?=
 =?utf-8?B?K0R1YlVZVEFRZUw3Z055QVEwWEZ5RDZYeXMyMEZ1NEFkZUZVeXFYb2M5RVJ4?=
 =?utf-8?B?TE1LbUoyR1M3bUdSc0lIbFlWMGo4c0tocG9wVHFaaGZqYkl6SXVsdTI1M1l0?=
 =?utf-8?B?bFlFbzA3RFYwQnlXQ2lkOCs0dG9VZVlMN0pUZWNlZkI0QlI0Y0trWFpXSWtQ?=
 =?utf-8?B?NkkzeUJJZUY4bHc2MW1mRGdIZFNDUXlaTlZMWXAyOTBDYnhNdnRIejYzT1ZY?=
 =?utf-8?B?cElubXhxVkZKS1NuWUNGVnNiTEZwbTI2WG1RNU13dWJFSC9pblZOU2hJQjhB?=
 =?utf-8?B?Z1dKUGhKdjlJTThFWHB2enRoZEIvKy9UUkxxbGVaSVNtNnBuaHRkZitKdW5j?=
 =?utf-8?B?TnllWnlDL0VIVHRhQnltRWY0WDNtdXhmUXBSR2RKM21XV3FVd0lUcU1YdXhm?=
 =?utf-8?B?MmNIRjRXbEthNThZY0VQc1pvTnhSSVpaK3lROFVIN3Z4MzhGLzlkQ3B0UEM3?=
 =?utf-8?B?N1l6b003RDJFcnBpRkJxazVCdFJJb0hrQXZobWZNd3QxMHhGcE5RdjZNTUI4?=
 =?utf-8?B?TkJVT2lUMjJlNUM5OEx5eS85RkdmbFVmYjM2M28xOWUvNTFZL1BXYjg5YWl2?=
 =?utf-8?B?TTBQVXdSTHMxWU5Ud0xTSUh2M24vbFY3MVJRemhsak5wNHo3YUxtdDgwVnIx?=
 =?utf-8?B?VE1vRURFcUcxUlZib04vSEx5M0tsaE1PTjFQQkl6cFpLc00reFU5MGdPNWtn?=
 =?utf-8?B?K3BtUXppVXNjTnErbjNpemZkb1BObnd1MHZFL2xvd1hsNzFkWHEyY0RBM0Vm?=
 =?utf-8?B?OVVuemlDNHV5elZPR3c5Um44eW50QllUYUYxWGFnbVFGU3ZORXE4STd1MExC?=
 =?utf-8?B?NVNHQ3VyYzVLSmJzcEVZQW1jRTFZODJHK0tYUm1vZEVpQ2xXMlJMZGV3dFZZ?=
 =?utf-8?B?NnBpYk1GTG9jVDhzamdwcHc1YUFXT0FORTRPMFFPUzI5Y0xqNTRpZVczU1lB?=
 =?utf-8?B?Q2dtRlcrcFQ2NDhXdnZaQWZnL3Avc1dOeHNiL1RpU25mc3VSa2FlSzJsZVNI?=
 =?utf-8?B?Zi8yNCtQOCtGYkdubHhhbDdER0JXYnpReUdKSUhSSnhrTERSRkVvL204UnIx?=
 =?utf-8?B?MTVTWXdQelZmTkhNTUMzN2Y1V24wZC9id3Rabjd5eGpDdlV0K3JNL2RKTFFP?=
 =?utf-8?B?VkJGcTY1cG9vaStTQ3lMZWhHdEt2QWhuOWwwRU05OGxMN3FQMzlMRVRPaXZK?=
 =?utf-8?B?MHBqWmh1dFFCcmhyRGhrWk9ZUUd4blAraWphRDZETEcrWnZZSkNLak5xNWFK?=
 =?utf-8?B?T1NvQkI0TkNsMEFzRHFkelkzSFQ2aGlhMTVvNkRNN3Z5Y1I0dnFjSGY3QVFQ?=
 =?utf-8?B?Z09hNDMra0t3SXpERThNTUw3VVN0Qk5weHFVOTdtbFoyMlpXRTZSNUttZW9L?=
 =?utf-8?B?b1NTNnphWEt6K2VrQm54eExQSkpoc2xJV3M1M3YyVmwrVDJMdU90UEFEZDhw?=
 =?utf-8?B?ei8rQytwTnJhTnRQOGdNY0laRnR1UVVjeERtY2ZpdXR0NE1YK1phcTA4czVS?=
 =?utf-8?B?aDJpV1BaNUVqakYxSzlzSk1GeElNSHJZTGdFN0o5ZFY1WWxLN0ZuS2NqVzJR?=
 =?utf-8?Q?OYSNpp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:29:13.6967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e5bccf-0b8f-48bf-862b-08dd7b04875f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169

Hello John,

On 4/12/2025 11:32 AM, John Stultz wrote:
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245e..eb07c3a1b8fa4 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2166,6 +2166,9 @@ static void enqueue_task_dl(struct rq *rq, struct task_struct *p, int flags)
>   	if (dl_server(&p->dl))
>   		return;
>   
> +	if (task_is_blocked(p))
> +		return;
> +
>   	if (!task_current(rq, p) && !p->dl.dl_throttled && p->nr_cpus_allowed > 1)
>   		enqueue_pushable_dl_task(rq, p);
>   }

Do we need an early return in put_prev_task_dl() similar to the one in
put_prev_task_rt()?

> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index fa03ec3ed56a2..87ccd5d5375a3 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1477,6 +1477,9 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
>   
>   	enqueue_rt_entity(rt_se, flags);
>   
> +	if (task_is_blocked(p))
> +		return;
> +
>   	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
>   		enqueue_pushable_task(rq, p);
>   }
> @@ -1757,6 +1760,8 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
>   
>   	update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
>   
> +	if (task_is_blocked(p))
> +		return;
>   	/*
>   	 * The previous task needs to be made eligible for pushing
>   	 * if it is still active

-- 
Thanks and Regards,
Prateek

