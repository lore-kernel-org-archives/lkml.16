Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9340291165
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715682; cv=fail; b=a+OLo1kEWd9u5Pguu8O+9H+Ox06ydohcVumWGhiHYDC4XRqZIaZ8x1k+EgUL31NV2SRaEcIFvaOhuXn1FDhD30em5Bo/ByUQtVhmMT5MO1OnX1do8Zp1g82aRIMm5jA4S0uLjjGiZU67gLBR8CEK6kXSe8JAZkJVDWfoFc9XlfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715682; c=relaxed/simple;
	bh=ayMs/NIg4VgJBkz/Yily8fGkOp041awPUfYsTUmvNv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HRoBpsFoMmhqpIosVGCETvSLf4t9Cn9kDHtHZsOU080DPZOgc0drueuSnsfo+5e5wYiRlyByjbBl3SMJ0JE06ASdXRzSYBzhmo+/ksl8tcyKhvu5AIBTQrB5jNdzD5Kl/NogJMhOqzUvaXcUpEYZfzbrP/pU3P8TfjWyDA3LbZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vKweG7Hf; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vKweG7Hf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LawaWy/QdgE4eY7D74/2oLrqVrrxTZ6XzHcEDXIwramKSrDjS0BdWCbDRdA7bKOPO3PVZvEuFtj+w4dUNmZN3z5/b4PWLPAuaP2SkdopfyVrqZlOYy+i7jZv3jnoam8K0HSjfPNG5uCQkzVWpDqE2G4lbvmNLd6AKyfofqKOYb5GUBrwM0IQmMmfdJNYThcE91YpZCQtAwqXSCCVAi40YrouJJKSmka7SxuPtBIsy0MJjTwHRvDZiEmRrPGClxb+iqWCL5dNE+sJjHNriLgFC5KrJgYBBv8ep3Qy3S1NwZ4blgoIXwL6moVVjS0ifTNGOKeW2tIycNBCJlMHmSloUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foHLMuVGAEQArnAplX/J2aAYQAlsS2fVtZWhNcL4d6w=;
 b=yzWElIT4vmDW7r6Q7PCK5e/G6H9esLGc0FC9165JD2VgUKjnjnPsLr1uEDBBxZ4DfW5v0RyIl6CH2+cmbMI1g0eYAV2Y0Jau9+4Y0bnEiRr8WdFMDalwn0VcrEQ8i98OXkOl5wlsE7DEWxbluNNgt4aNJDCWKP5B/74b5WIfjNJGjIlRuYf9klfiBKi87QYoAv3O+w8iv1CpfAiUykXCDwPIk+CJlpEBfXraEiZo96s4e2fql+nkE2jfsrSP5BF+wrx5EjaKcB2+n8RC3Rvlq6aUhCKpOPaas7IisIAztqWhNBIyDeS7PxIAnb6yhNuJVV2IX5zXib3HPFTqpCY0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=siemens.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foHLMuVGAEQArnAplX/J2aAYQAlsS2fVtZWhNcL4d6w=;
 b=vKweG7HfCFdM2D1qY4RZawNaqiNKhRryAVzula/qVWFvTKrcPECzjAKsyjV/KWgZyzidhUM3u7RxFtzSCEwvRzRp3QwTA9izmKDt4IENk6YS19HKRr2S69gmsYypKe9VtHcS5AUh2/kTB98dE0NqiNz/Dzk0N3mw43IXuNCfPLA=
Received: from PH8PR05CA0003.namprd05.prod.outlook.com (2603:10b6:510:2cc::24)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 11:14:36 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::42) by PH8PR05CA0003.outlook.office365.com
 (2603:10b6:510:2cc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.14 via Frontend Transport; Tue,
 15 Apr 2025 11:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 11:14:36 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 06:14:31 -0500
Message-ID: <de07d4a9-0807-4ce9-a91f-1747239f5080@amd.com>
Date: Tue, 15 Apr 2025 16:44:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
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
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <f5111e9f-bdee-480a-b29a-d8d1c207a600@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: bedf5a2f-c6af-43eb-0659-08dd7c0eb4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUkyVGZoWVFqeGlDbzhTZVFnMzZDam5PT3MwM0lkNzhpbE9XVHF1cTJ5QVE5?=
 =?utf-8?B?RWxaSlloZDJhb1dFY0doRGlLaEp4VjVoV0FRR1JLQmFTZnNJUmc5YWJDbGVX?=
 =?utf-8?B?aEJUaE9DSGhqMGJvdExEWXBLdytySnVEWVVrZURZSVFVMlNCcWE4V0xCbXdw?=
 =?utf-8?B?TXkwOXMwRCtod3JyZHowbkFneTN6elRTSnJYdkwzQlJUZUpTT0JpR2lVK2E4?=
 =?utf-8?B?NXNsai85UHZHditPb0FSTG8xclV1UCtHYi9tR2R3YWc1RkpSMElNbk9RSll5?=
 =?utf-8?B?RU51RHFtOGhRRnBDVTQ0aUcwNE1VYTc4cHVJVlZOcTJQd3ZaalRSbmhlbVh1?=
 =?utf-8?B?K2QrNENPNFBnVzR4QUtPbm5WVkttczlFeDlxR281VGFFak0rZXQ3MEZ6S1Va?=
 =?utf-8?B?Q01DVG56ZHFNWXBtTFVPM0xzR210WkQ2dkxCT2R3K2VTOGV3K05RK0tPR0hv?=
 =?utf-8?B?eW0yUWl6THd5a0YzK3VNbG1MZkJMUkZVTFpQbFhiT0ZUckVkRUlxRUpRVG03?=
 =?utf-8?B?NGluVzRHcnFqamw1ZmxiME9ldUovZWxEQ2UvbGdxWE9CNzBzajhxU0tDc2Fu?=
 =?utf-8?B?UHdvYzU4TmVjdVIxZzFKWEVkb1F4alFpTnZsZDlQU0w2cHA3R0NvYllhY3lN?=
 =?utf-8?B?QWR5S01tMVR1VmdoaE16Y2NqQnBxVG96TjgxWWFqNGYwOWx2dldvakhEU3Ns?=
 =?utf-8?B?RGtrbXM3K2ZDc2xpMit5Tmw4SVNOM0pWTnFOeW8ybXU5REdkNGdpK3BZUi8r?=
 =?utf-8?B?Y2laSDhYanlsdjBxSFFKMThjT2UxaUY5ZnB0dWdCb055cVJ1dmhUKzg4aldt?=
 =?utf-8?B?bVNIdHVmQ2sycVVaMk1EMWJjUHpHYTNZM3duSTFHQkU4NmlrVkhQbDJqZ3Jz?=
 =?utf-8?B?OW45QzZqTy9DQngxdGpqMjlEUWlvdlRjZnNzMUN3TTJLZ3I1aVNEMFRtTkwr?=
 =?utf-8?B?SWJUdU5xaE1LTGNnSG9XMUh6NnlHeGp1U3BzOVBCMkdza0swNjdrVTk2bXNu?=
 =?utf-8?B?dEllbkY0blBMaGpXT3VwdjVYMDNjOXAwOU1tVVZwVitIc1B6UjZWSDJzdVR5?=
 =?utf-8?B?cy9RWWVhcEVGTVhDYnQvVFhGU0tvZVdpYXBrS2tudS91Z2RnY0JrcDVaVlJ0?=
 =?utf-8?B?azRlbldlajE2aUtHaG5sNUdWeENTV2NIaWphcnE1ZXI4R3Uzbml1bUNuUjF5?=
 =?utf-8?B?UjNmZGpzTEJ6ZHcxRHM2NHEyeTU2OTFhOTdYN1JsODVJcE9FMExwT3NUbGdV?=
 =?utf-8?B?V1ovNzdFM0xnUzBJTHExbkpJVG9iMXZnUjZ4OWl3a0hIMjFwcXNRVHRwbkxy?=
 =?utf-8?B?WTdYaklwbkpjaXZTNnZWSjlZWHBuakxrWTlkYnhrV3RIUW1ld3RtVUt0UXpM?=
 =?utf-8?B?WHJ3N1pxZ1ZlQzRiT1RDQktDa3hkQkNOaFRSK3pjeXY1Yk5hejZ3R1lJSVhT?=
 =?utf-8?B?T2JjRlMra0xLd3pRYlNNanFTcSsyRFpwZ2h3TDVFL1ByeUwzWmNWVjB1WGlo?=
 =?utf-8?B?dHVNdTFtWldVZnIxTmxINFFFU0IreVJPNldQQW9VakQ0M3IxRzMzZmNGTHUz?=
 =?utf-8?B?N2dwMVR1ZVZHd3hZUzYwdjJEcFZwcGRabFFhOGxFUHBlWEJBV3N3bkpEbXJU?=
 =?utf-8?B?dVRFZHR4Yzg3elhma2dVeDMzdDFOdTYrVk5RRHpxVnZER1RlRWQyV2dxRGNY?=
 =?utf-8?B?ZjZLcllBVEJOdmRqVUxxWXZDemxsbkdlUXJjajNhYlpWTStseDdSSlBXWEtT?=
 =?utf-8?B?VWo3bmlpR2Uwd1p6TSt3ekw5T2hzT1hsemVpQU4yREoxeEM4bjk0dGRRZStk?=
 =?utf-8?B?clF0QmFSUnA1WG14eWtnaTZUamhrcjV1RmhUbm11bVNTalJRVzNMeXBvU0R0?=
 =?utf-8?B?SitScnpydXlBcGdCOUhucnVzVktkRDNocG9NSGpmbHRTZmdrUzh6THFBZTly?=
 =?utf-8?B?cVZmUXRnOS83aDFiZDcwQmFOeVVJeC9ZNnc5UGszUlpWZC83dzVUazBmMTJ3?=
 =?utf-8?B?cTdDUGR1ZytvZEJlTitFSVRZS1g5ZHl6S1JNNFI1b3JBdzI1K203TVlGSWw1?=
 =?utf-8?B?N2xqbzY2OHlTOUZlOUE5SDF3SzBKSTRHQmxjQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:14:36.2848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bedf5a2f-c6af-43eb-0659-08dd7c0eb4fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425

Hello Jan,

On 4/15/2025 3:51 PM, Jan Kiszka wrote:
>> Is this in line with what you are seeing?
>>
> 
> Yes, and if you wait a bit longer for the second reporting round, you
> should get more task backtraces as well.

So looking at the backtrace [1], Aaron's patch should help with the
stalls you are seeing.

timerfd that queues a hrtimer also uses ep_poll_callback() to wakeup
the epoll waiter which queues ahead of the bandwidth timer and
requires the read lock but now since the writer tried to grab the
lock pushing readers on the slowpath. if epoll-stall-writer is now
throttled, it needs ktimer to replenish its bandwidth which cannot
happen without it grabbing the read lock first.

# epoll-stall-writer

ep_poll()
{
	...
	/*
	 * Does not disable IRQ / preemption on PREEMPT_RT; sends future readers on
	 * rwlock slowpath and they have to wait until epoll-stall-writer acquires
	 * and drops the write lock.
	 */
	write_lock_irq(&ep->lock);

	__set_current_state(TASK_INTERRUPTIBLE);

	/************** Preempted due to lack of bandwidth **************/

	...
	eavail = ep_events_available(ep);
	if (!eavail)
		__add_wait_queue_exclusive(&ep->wq, &wait);

	/* Never reaches here waiting for bandwidth */
	write_unlock_irq(&ep->lock);
}


# ktimers

ep_poll_callback(...)
{
	...

	/*
	 * Does not disable interrupts on PREEMPT_RT; ktimers needs the
	 * epoll-stall-writer to take the write lock and drop it to
	 * proceed but epoll-stall-writer requires ktimers to run the
	 * bandwidth timer to be runnable again. Deadlock!
  	 */
	read_lock_irqsave(&ep->lock, flags);

	...

	/* wakeup within read side critical section */
	if (sync)
		wake_up_sync(&ep->wq);
	else
		wake_up(&ep->wq);

	...

	read_unlock_irqrestore(&ep->lock, flags);
}

[1] https://lore.kernel.org/all/62304351-7fc0-48b6-883b-d346886dac8e@amd.com/

> 
> Jan
> 

-- 
Thanks and Regards,
Prateek

