Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800A7083C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745290498; cv=fail; b=hCYxiYH5mWo0eUNnOcRRhvoqO6T+VDUnqqzgCDT4D9gTkwLPWohexNoC5M6IBvziB8DFrkhF1zo5lefdau7l/F/KkzNEgadTa6gr1DUAZGmLALgk6fiw37u85X/9PQGWTLtgJJ+rJrpYCMoBp3bNvR+Q7GmkmRZmlMUGTD5jw6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745290498; c=relaxed/simple;
	bh=OCIeFwo36Hv1/iuksakpIUtPBFJC8zoKV8u20Si+41o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tzaklzkp3G/whXRQB7GHLdu5ElhwytN8krN5QYr549PK1sohj86S3uGmJmZktgBHwbGUqewcgaJ7wCY8cskANSSXmfqsemCBV+B52X1GUmcCVMN1Ok0Wu+yga5Fcj57ZlFOyMyWMWfLfa2D002cweB5l6qTl3L+6JCj9c/ekhns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LqUMy7Nb; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LqUMy7Nb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXdsNcH5KhgswsxO+vKKOHYzaRuDAq/MeCLZQ7AjJNvRdFMsckPbf4uTt67Ddft0EFCsx7h0mYnuzUZPopMTN6fBtqPlCGHUX4Kj9LPFMe0OWXjZu4YB9kMeifKBf5izdfxUSS1yypVbLKINC5cfZMo7njTaZRaW5OQLB9XbTPIHoqmS7LsFQ7vbW3yRB6RNBDbXkg3ESZ0uOERmQ3AO4W2VyLQew5Z2iH9vFbTDWV1tXeHIib0Ebl13TwcDGr4VE1YDxnug/QFVw6YmRRVBKF5tVC+CWzXbnkXcxzvnKgxLxN7ze5rrm3y1+O1+/LtJw5EmXtNlEMBuNEAnh/7spA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRVUzHGLDWhOHh4U/7SBW9pDBZGQVYBrxg6BvUQ1g9w=;
 b=YCJncb6Hc5Uy3BzN8OEafeYvbgCMgifcYAvmdzmgMkvMLRE7MbH+Ps+JQziPYH5EWRpPQp5VybXzxsjF1/IKJqnGrpSZEZtHAuJ5PXmYsJW8Mbz7EsBCzxC5WwY1xsCb/InOBwUnwwWKhbEfS1DTjuRUhlPccwUI923YRtDmJM+Sap+pRNI5EGmiOwHwtKEfMubzf22XvYdtM2gWwTFNDf5qzZoaDCsQl/3b+COap9E1j28gR9S34gl6bb/invY4gwPUoHh7Q2+UpMJrYlQKOu7LfgacC6LrFdl9hykQQTOw2thwnvyMCS+gmEUwsojqGIZLlgLBkKfu/P7xchDpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRVUzHGLDWhOHh4U/7SBW9pDBZGQVYBrxg6BvUQ1g9w=;
 b=LqUMy7NbZrMAOpXUnE54+Zn1gCIDQhmDuGXx4hrfqriLAtsdh3gATtV9iNE2kgu2BFOQA047YKpEdX6FO/ZeS8wrFYGfFz5L8COZvLo8ff3UkKYM66l6plsrJTMnZsVSudBB22/Zzg3hmbHWoTm0OPsxVVixP1zpSyndpGHSpU0=
Received: from SA1P222CA0063.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::12)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 02:54:52 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:2c1:cafe::8a) by SA1P222CA0063.outlook.office365.com
 (2603:10b6:806:2c1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 02:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 02:54:51 +0000
Received: from [10.136.43.233] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 21:54:46 -0500
Message-ID: <610fcbfa-a8e7-483c-a112-579879628b99@amd.com>
Date: Tue, 22 Apr 2025 08:24:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
To: Aaron Lu <ziqianlu@bytedance.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, Florian Bezdeka
	<florian.bezdeka@siemens.com>, Valentin Schneider <vschneid@redhat.com>, Ben
 Segall <bsegall@google.com>, Peter Zijlstra <peterz@infradead.org>, Josh Don
	<joshdon@google.com>, Ingo Molnar <mingo@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
	<linux-kernel@vger.kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>, Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>, "Sebastian Andrzej Siewior,"
	<bigeasy@linutronix.de>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
 <20250414120407.GC3558904@bytedance>
 <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
 <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
 <55687bb5-7e8a-4d7d-a597-6f97087cab32@siemens.com>
 <5e919998-338c-4055-b58a-e4586134956c@amd.com>
 <f5111e9f-bdee-480a-b29a-d8d1c207a600@siemens.com>
 <ec2cea83-07fe-472f-8320-911d215473fd@amd.com>
 <e65a32af-271b-4de6-937a-1a1049bbf511@amd.com>
 <20250421120648.GA3357499@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250421120648.GA3357499@bytedance>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 2542db0b-7e2b-4fe5-83df-08dd81490d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1ZqYjlRcy9hR1k4MS91WTllUE5KekhXSkRWL2NONDJzTEJienc0T0RFOTI1?=
 =?utf-8?B?UytRTTdqblpRa2F4ZmRwbnVMSmNnSVc3bmlRRDcyV3c3cXd6cDBFbWovcEZK?=
 =?utf-8?B?ODR4WGRxODA0bzA5OHU3bVFWV2F0ZVRodWxqSDhzdXBXUFJSd0JyUUY5dHU1?=
 =?utf-8?B?UmhFK0RNcGN1VnRaMlVkU3pnVVhrUlVWYjd6NUpGM1hRSkcwWHhRNDFlRGNG?=
 =?utf-8?B?aUtiaDRrZFFiemF1YkdqdGhsTmhQd0V4N2JQMTVOQkE3VmU3c0l0VHV3ZFkz?=
 =?utf-8?B?WW1ob3B4aGt5UmVQVWRsejNrc0FROXJCSm41Qys1d1cxRG8rNit5Yk82QWRW?=
 =?utf-8?B?b0dNaDFqQkxBZjV3NEY0UllZODJPcGJRczdsaUpRK3YzNFBxbVVtdFNKalgw?=
 =?utf-8?B?SCtkM2FPUzlsK0FTWE1aVXJULzQxcGVwYXV2SHl4SXNkR2htT0ZRSVc2dHNU?=
 =?utf-8?B?RndDakxwTTV0WTg1UlV0UHV4ZHVRaWxpaW90ck5RUU5MQmVHWTVER0FWeHk2?=
 =?utf-8?B?dFdWQnFWQ04wZHhxdnpoUVZmSElYSVJRQndyaC93YkgzSzFGeDcvOUcwaVZh?=
 =?utf-8?B?Z2hhUVVRMm8rLzRMdXVwU1dRNmpBRERTUUtDYkZ1cCs1eWRqU3dhWkZkKzVM?=
 =?utf-8?B?NmJsTkpVZXNBREwwdWNBbDRaTFFXTHk5c2F5YU9XbDl3eEVjclZyZm5sRmF5?=
 =?utf-8?B?ZERQRGlONHNWZi9USjJ0UlNobGp2Y2pXUVZsOTFsUmhRMk42ZWRmMWZhRnha?=
 =?utf-8?B?VWlWWnlIVGZLS3RRUk5MSGtmNFExbHVBa01UZ2pNLy9iQnBIY0J6Qy9qd2hX?=
 =?utf-8?B?d3JJeCtoU2UyQWxDc0trc2E4ZXlhNHpUV2xXbDh5aXBKc1RRaDNZVFVwdytV?=
 =?utf-8?B?L0tDcXY3NkhKM1JPUTI4R2FVaXBYTXFzRjhVb3FraW9URFIrRlBYT0RtQjM0?=
 =?utf-8?B?S1k0aTYvR20zUzM1MTNGQWtOQ3RsSFdrdTRFZFpKQW9NRTQ1Smh6bExsL3dV?=
 =?utf-8?B?YWxvUytUTE5xN0syL1lyajRjSzJ1SDZicXRFeDZJN1lLY0VHMld5dHhURXhZ?=
 =?utf-8?B?TTNEMXNXUEFlbWtGWkpXK1M2OU50K1VEd21Wc2EzazkvemZWazlwREZKelha?=
 =?utf-8?B?YzdXU2ZiMkhXS2RndmxuNDZqL0hiRlY1OWxFMmdDZ1lRdGk3RjVRWEpSY2Zj?=
 =?utf-8?B?bldMbkcvc0gwMThDWVVZYXNJNGI2SkhPRzN6T1VDajhDQ1F2VHpTNmUyTXh3?=
 =?utf-8?B?M0tvaFh4dzExajVuQUU1L0hxOUxLOWVYTWs2QzFDZjNxVW9xc3ZyMUtPOU01?=
 =?utf-8?B?dDdTN2ZOZ25kRDl4cFFrNHgvc0RHNC9wQjY1TE9saVE5cEM1dGY4ampjaEV1?=
 =?utf-8?B?bW95M1Y2ZzJIRkRWclI3MDlLNXRMOEo0dVY2NERYOStRUW5wZnd3bkg4TWtt?=
 =?utf-8?B?b2ptNkxjeTRGVzhaSWpWRkQ3M2RCM1I5SHAyUXZ1bkE3T3Q2YmNhb3NNUUhj?=
 =?utf-8?B?OWQ1cDAxUTNxMTV5bmtTaTAyTU0wVHlpSFhLeDRhZVd6MVFSV0VJRUVjdWxp?=
 =?utf-8?B?b3pqbkNHOHNDLzEvSVF2RHNobHRidk5hcUVHK09GbjVpWElTWGhnQWc1VEk2?=
 =?utf-8?B?WDV6dk93Sk54UENDNVZXTkhGUGo0czdueGxjbnNDYVlLa3lWKzRFODVyaXly?=
 =?utf-8?B?cXZaUmllNTVPanUyWVk3OU04OGVxcEVvbDBKeXR4dERtb2FWTmVuSUdXTFZ0?=
 =?utf-8?B?MU5CRXZMeGdBUm94NVg3ekpQWmJvS0l1VnN4SFVYazZoeVJVSi8vOEdWRzdx?=
 =?utf-8?B?eTAzUURsZk9Rbmh2TDFBR09nbUlPTDdzMXZtWUEyQkc3aE01dUpNYUJpWGFN?=
 =?utf-8?B?bEl3V2RVV0dnSFBZdDhUVlBBZDdPN243amZJdmxTNHhRTlNZajZRZ1lGUUo0?=
 =?utf-8?B?dGZkUXZmdldQeC9MK1VhM01uWEtocmMwcUV2ZTMybVNXMEhsT3BLaCt0R3JX?=
 =?utf-8?B?NE5uckZiTEZpaFV3TWZ4Zk5ZdDkwTHpSb3llQzJtb0NYa2F5SWw2Z2xlNk1W?=
 =?utf-8?Q?IE5Gzw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 02:54:51.6023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2542db0b-7e2b-4fe5-83df-08dd81490d90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346

Hello Aaron,

On 4/22/2025 7:40 AM, Aaron Lu wrote:
>> anon_pipe_write()
>>    __wake_up_common()
>>      ep_poll_callback() {
>>        read_lock_irq(&ep->lock)		/* Read lock acquired here */
> I was confused by this function's name. I had thought irq is off but
> then realized under PREEMPT_RT, read_lock_irq() doesn't disable irq...

Yup! Most of the interrupt handlers are run by the IRQ threads on
PREEMPT_RT and the ones that do run in the interrupt context have all
been adapted to use non-blocking locks whose *_irq variants disables
interrupts on PREEMPT_RT too.

> 
>>        __wake_up_common()
>>          ep_autoremove_wake_function()
>>            try_to_wake_up()		/* Wakes up "epoll-stall" */
>>              preempt_schedule()
>>              ...
>>
>> # "epoll-stall-writer" has run out of bandwidth, needs replenish to run
> Luckily in this "only throttle when ret2user" model, epoll-stall-writer
> does not need replenish to run again(and then unblock the others).

I can confirm that throttle deferral solves this issue. I have run Jan's
reproducer for a long time without seeing any hangs on your series. I
hope Florian can confirm the same.

-- 
Thanks and Regards,
Prateek

