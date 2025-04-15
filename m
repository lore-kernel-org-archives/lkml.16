Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854E14831E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732174; cv=fail; b=nCWBNGWKnpdRDGUBbgNoX6fv50Y+JMusHLAUvzAKSv/esXU5jFsaiHW3bq5jpLup/4YEIBaCt2K4rlZ04pDOuaB0GOkmQih8uW4pizLmK0uGCr97UvfJGO33wMui6gEIbzeRm0kEdnCfmQB4mCciUPVSVaDcxlTfOgOAyx3QYnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732174; c=relaxed/simple;
	bh=B33DUNhnkZS1BLaotH85sywnGclSY2PeTC+67Pn87lc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=t3xfJspwrbHR/miSD82Ra45S6AnB866U8+22Lzwg4LnY+qsdtveL/vYYCM0dAcCdcLmiNiHZwMmI69lL1Q0bLhQ+gynHf75EKzOOFY7Av51alKMpzLrKhUlztBKyQsXU6R83y6NxQf5FTir9wYFNVYhd/Q6Q1bK6+ohmXYmUze4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kP825Omu; arc=fail smtp.client-ip=40.107.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kP825Omu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzlefByfbd0VnZdUHwWzMMjLLaoH4DiQUDu2zHva28LUUwfj2xuZzP49FdRg5+kKmOgEd4xg8PE2x4/aRkxSqqp32lEz2pCySZrcbVHXPWWsTrCYN0IB2y+staSAWNaEAoU7LMQXVfW9lbXoS9hhbD0oKf1BaTCJsW5g2qHjT4fIte37Mbi04xQL0q0lAi/GlUM5Roy4ukuZptwNAs7WuWKrcci9F4zlFmBuvaZN/PlbLriRapQlRprGZQLF9oPUE7d5SziCcXD+JpdRokRbswHq77kQCOXOY3pjvRxTyaa7ycRuPBzMqt00ruFacLcr20i3yWo6fgxnkUmfSPNjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdvXccczTHJKXOg4G9E0hNWWfN6yZJRbJQSpUnw9ldc=;
 b=guk/MWNd0BHi2dWB3bHvcp1bpaM+bops2H8Vmtkc1nmHki9SP1+0REBZT1mmu/hdWUm0WXuytR1c+/dAwvohluo9F9bX4oBqdLHZxyuJZiBTccVuzC33Db/L3xaohX/uG9R/VEbG4lXiCAgYIYKoXbpDsmuESR44LXljHR2WLiGUj9V0rCjgtL2YdC+SdHe8mw9V+zVKVad6fh+Z6H8scmUzKwqbPSQYQYFeIV4esLFJwUnQNHkk6xRROWZEKLUtjrb1lZ1ULkPyTcsPt+kfc7VOIRjeFqOtMgNMzZ5OG+LQjtxTrZUGZBUpqwVXq5nTNNk+jNZBGzNc8olCEI1ggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=siemens.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdvXccczTHJKXOg4G9E0hNWWfN6yZJRbJQSpUnw9ldc=;
 b=kP825Omu8YHanrgAL2w0GyPDjyo3MyEbI80aM5dSqbEsdACb9daS36gZsiCIWGIZY/Ll6HrCxQItcXmvewq61ojFZjJuiX6viEKTiMs+nq2RX3qZx7jK6sdQ0k4P53tmtzvsDuONEmKZ2ermR+2LcTJtIAnITq/TCJFSNW7Vr7g=
Received: from DS7PR03CA0151.namprd03.prod.outlook.com (2603:10b6:5:3b2::6) by
 DS5PPFDF2DDE6CD.namprd12.prod.outlook.com (2603:10b6:f:fc00::665) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 15:49:29 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b2:cafe::ba) by DS7PR03CA0151.outlook.office365.com
 (2603:10b6:5:3b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Tue,
 15 Apr 2025 15:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 15:49:28 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 10:49:23 -0500
Message-ID: <e65a32af-271b-4de6-937a-1a1049bbf511@amd.com>
Date: Tue, 15 Apr 2025 21:19:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Aaron Lu <ziqianlu@bytedance.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
CC: Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi
 Wang <xii@google.com>, <linux-kernel@vger.kernel.org>, Juri Lelli
	<juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven
 Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Chengming Zhou
	<chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, "Sebastian
 Andrzej Siewior," <bigeasy@linutronix.de>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
 <20250414120407.GC3558904@bytedance>
 <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
 <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
 <55687bb5-7e8a-4d7d-a597-6f97087cab32@siemens.com>
 <5e919998-338c-4055-b58a-e4586134956c@amd.com>
 <f5111e9f-bdee-480a-b29a-d8d1c207a600@siemens.com>
 <ec2cea83-07fe-472f-8320-911d215473fd@amd.com>
Content-Language: en-US
In-Reply-To: <ec2cea83-07fe-472f-8320-911d215473fd@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|DS5PPFDF2DDE6CD:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4450f5-a8b8-4599-2d76-08dd7c351b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUVzYXQvVVRjK2Q5eVBnQ1RoK1AyMGF5OXVvc0dSdm5meVFPbmdQaEZoQTJv?=
 =?utf-8?B?Mzltc045QjFxbU5RNDdkQ3l4MEZ5bTZKVmZUK2l3ZTd3WHkydXlwRUVVcnRK?=
 =?utf-8?B?VFMzaDMrbjZhVUNRT2krQ0wraGlVWmlkNVg0N1Z0ejRZT3NhNnNCeWx5YjBM?=
 =?utf-8?B?REo3K3dsamZ1eE9QZ3pleXl6a0dMTCtOVHlJblp5ZGJQMGxMTFh4d1FRZ2Z3?=
 =?utf-8?B?cTdjTzNFOWNMazNXalM3SVN5Y3JhWVdnSWU1WlJHM2JxTXpUOTFaMW9CK0tC?=
 =?utf-8?B?OElIQ1NNeFlwbC9nMFVlVTI2azFSSWZyd21Bc2xtYyt6NHJyTVJ5bzBuTUNV?=
 =?utf-8?B?N1NZS0lGTGpQVWRoSXdmZStEcVUraXphUnF4aVVwWkJKOU94dWxaUzNTRHBT?=
 =?utf-8?B?VHN3cnRYN0FzWjVtL1psT1dLUXBkcHJVVk1IUzM3V0JmaWhPNzVUcnJPMHU4?=
 =?utf-8?B?WGdMSXZmVnAxN0Yvd2NLbkFQV2p5dzBLeEhEMUd2S0VoMERIOVAwbzRYU290?=
 =?utf-8?B?eDdKM2pDeEc1S1RtU2tHK1BWdXlSVUlNWVRrbzV4L2FqVmRXWHRpeVhpcGJQ?=
 =?utf-8?B?cXpIeFhVRktOdWcxSmFTM2xCMDg1V29CY0kvYXM4MGRMMGVTdHFkTCtDN0tz?=
 =?utf-8?B?UzZDdThIZHVFRUZoNzdOVERxM2dMTkZjcUFKZmtQSzErSmluTzAvUkNvemJl?=
 =?utf-8?B?NWhyYmZMNVo3Zks5OUhlVG9KWnNyaHNhTXhsdzFBd0ZTMHR0K1BtbHlPUjNr?=
 =?utf-8?B?NU5zY1MrMWk1eWRXUC9FbFZVRUkzZEoxOUR1MkN3RTgzOUxJZTFtYVl0NkMw?=
 =?utf-8?B?cm9xUXU0ZTd4U0lZdURsaWRnTEIxL1hBWE9keDZWN2JReFRuM0FseWo5ZHN2?=
 =?utf-8?B?emczdlh2MVVKSHZzTzFxN0lNMkY1RGZ4OVJnNlhTS0ZSUUNLZW1XZkorRXZq?=
 =?utf-8?B?RndWWjFLNzZnZXNTaExjTjYxN1YrMVVWd2lNN0l0SWs4R3greVYwWmNpKy9x?=
 =?utf-8?B?UTgvYWdqWU1SYjdhek4wTk1KckJNS3FXTHlNdXRuR2JuenE4emxvSFNvWXBa?=
 =?utf-8?B?N2FadXhwdU50OGFBUnhhYlhvdHkzeDVBeGg4aExtZVozczVRQ0dIUkZZVmla?=
 =?utf-8?B?WnRhVlNIYy9ObSs2TXVMc0V6ZTRBRHFiK0Y2anUvL04zMDFsSU9XblpDZEZ6?=
 =?utf-8?B?b3FIVnRJQlpHZmZSajJhVDZzN2p1TXoxOFRnajdzRFl2Q2NyeElpOHZwR2sx?=
 =?utf-8?B?eUMyT0ZUTlZpTjV2YVp0R29OUWZadWZieEVwdmo0NkVQOFErQU51QmVUU2V4?=
 =?utf-8?B?UUU2T2NtY1lYN3p5azBrUDVqYVFvVUlvVDdPbWpmSVBaSzkzS3Rsdk9sUGlh?=
 =?utf-8?B?VmE4VDN2cVdaUjVXUVMvckdnakxqT0g4R2hDRGN0MCtnZzRHenVpbThxSzdi?=
 =?utf-8?B?ZTVya2pqRXMzUlR4QjFtdldhVExHNEhlSE56b3pWOFZHeUdCRzQ3emNKU3NU?=
 =?utf-8?B?NFVPdUtZMTRuNWJmQTRONDdoMkVzTGdSMnd5UjQyaVcveDhtT3RBdGs0aHA5?=
 =?utf-8?B?TFhlK25zL2lsWW5RSWNXL3VDUjd0WkpXZFlUTWxCT1VBbmt3RnZmTDBGVTJn?=
 =?utf-8?B?bVhJNjBEaEZNd1dMTlBIenI2VHRXU2w3b1YrUFlXUUgzRDhvUDBxem13blZv?=
 =?utf-8?B?SloxWFZFbmFiWEtjaUNVd3FqK0N4ckZXK1hqTnE2eW9BQWdybWxqd205Slll?=
 =?utf-8?B?N25YaU1uRFZzcXRsLzVIYXdYRENNbS9WdG91TzN4ckExc1dFdWRxVy9mZit4?=
 =?utf-8?B?cG9wenRGcC9TeUd1aGR0ZlQ4OVFIbzVHOEpZTWFWMmVDUkEyMzlwSU13SVRr?=
 =?utf-8?B?ZHFYT3ZFTDk2WVhQMWprZ2VleGhENlZmZTRSdWgxUDc4ZWNHSFJINzRuYUlC?=
 =?utf-8?B?NGNHTGMwaUFOalRTenlHalo1TlVEYTlZVUhlTTdRUGNVRXRJbkg5cG50cU90?=
 =?utf-8?B?QUp5bG9CdFBvQW9tWmh6d3kzc1BxUzVYYlU5NEVUYmhSNTlyRHBQMFh1SHBD?=
 =?utf-8?B?T0thOHJadm5CUWwwcUptUE1lSXdYcHh2TUlZdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:49:28.8392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4450f5-a8b8-4599-2d76-08dd7c351b46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDF2DDE6CD

Hello Jan,

Sorry for the noise.

On 4/15/2025 4:46 PM, K Prateek Nayak wrote:
> Hello Jan,
> 
> On 4/15/2025 3:51 PM, Jan Kiszka wrote:
>>> Is this in line with what you are seeing?
>>>
>>
>> Yes, and if you wait a bit longer for the second reporting round, you
>> should get more task backtraces as well.
> 
> So looking at the backtrace [1], Aaron's patch should help with the
> stalls you are seeing.
> 
> timerfd that queues a hrtimer also uses ep_poll_callback() to wakeup
> the epoll waiter which queues ahead of the bandwidth timer and
> requires the read lock but now since the writer tried to grab the
> lock pushing readers on the slowpath. if epoll-stall-writer is now
> throttled, it needs ktimer to replenish its bandwidth which cannot
> happen without it grabbing the read lock first.
> 
> # epoll-stall-writer

So I got confused between "epoll-stall" and "epoll-stall-writer" here.
Turns out the actual series of events (based on traces, and hopefully
correct this time) are slightly longer. The correct series of events
are:

# epoll-stall-writer

anon_pipe_write()
   __wake_up_common()
     ep_poll_callback() {
       read_lock_irq(&ep->lock)		/* Read lock acquired here */
       __wake_up_common()
         ep_autoremove_wake_function()
           try_to_wake_up()		/* Wakes up "epoll-stall" */
             preempt_schedule()
             ...

# "epoll-stall-writer" has run out of bandwidth, needs replenish to run
# sched_switch: "epoll-stall-writer" => "epoll-stall"

     ... /* Resumes from epoll_wait() */
     epoll_wait() => 1			/* Write to FIFO */
     read() 				/* Reads one byte of data */
     epoll_wait()
       write_lock_irq()			/* Tries to grab write lock; "epoll-stall-writer" still has read lock */
         schedule_rtlock()		/* Sleeps but put next readers on slowpath */
         ...

# sched_switch: "epoll-stall" => "swapper"
# CPU is idle

...

# Timer interrupt schedules ktimers
# sched_switch: "swapper" => "ktimers"

hrtimer_run_softirq()
   timerfd_tmrproc()
     __wake_up_common()
       ep_poll_callback() {
         read_lock_irq(&ep->lock)	/* Blocks since we are in rwlock slowpath */
           schedule_rtlock()
           ...

# sched_switch: "ktimers" => "swapper"
# Bandwidth replenish never happens
# Stall

 From a second look at trace, this should be the right series of
events since "epoll-stall-writer" with bandwidth control seems
to have cut off during while doing the wakeup and hasn't run
again.

Sorry for the noise.

[..snip..]

> 
> [1] https://lore.kernel.org/all/62304351-7fc0-48b6-883b-d346886dac8e@amd.com/
> 
>>
>> Jan
>>
> 

-- 
Thanks and Regards,
Prateek

