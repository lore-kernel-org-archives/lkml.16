Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A18A5234
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225685; cv=fail; b=TIcgkAHzLEoKioXNfxIh7qrnDQi0yxhybNz1XMohmPIAbtnvfKU163LQFwyGjKvHY03Xil2NmtLYUmT2RDxQ5eQgBHikjOIsmKtsNYDwbzBMGwWzsyMsMJoCcSmr1tTkv7XT4Q+xvrFK7GcNbGtQA28QQhswKrLBuC7C8cR3knw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225685; c=relaxed/simple;
	bh=FTT9zeSBirB/CCrU3NRtl6WBM+/+E/k2TUFxTKUrBao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kNO6XT3Qo4Aejcs/42PezQCy9uOSabfgapnwSbsfSVPEOTMIt52KQMnl0SUgf0U4HVwD8j7m02gzf5W30N1EvUKSdBpI1/g8yD/Wf1sTx8Uxjk+pVf5yyt2vxUymOLjH3syi+W0jNk8g/xOdvMiNO2AhN840EJJUBG0z0qPusOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LvgQSjO3; arc=fail smtp.client-ip=40.107.100.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LvgQSjO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuFWBO8xXNlsn/9YnrdRehT5+jvum1V0CGE1gSf5BdtTL5AaDBlTp42yFKBJO6c565dF+nw7tZMAAJspJBP6jL41gxrqnGSTqjTRt41ugOMMjYJ5ugoJpc2bYbEhEf7X8x3hXcLcvbo00Gwm2Z7LU/G4PgzWFyEg9rrqlqdTnzxu1uqcoqf2HUHYVOoB2OQ7MwgR9DDhQFn2xU3+DkrKdbWcB8zkKgsSx2dNwQgbm48D93zXSLwPrJMntE5JbvpkWBTtyCBwfUa4CJtHp0kPCF6MbEeGjcxevxtHmcpEtVYXE75u335WhiL/ICtXb3jTNCbyPb21ulXkhnQnA14LuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95my0NugT/rb/skPvc8KlSmkJ33+9iH/VWzaAPr4a/8=;
 b=cqshMknsROaAEyEzTTj0fZxXUqoUSeYdKtChVQgRmGnzwkJNNfXxIKkUkcQ0bCStUU2JEmC/yx7FHfpeR5Ztya+FlZqNPYmUNgNYBMELJEM0L0XoQYpjMz5QkBMK8+200I3fnOmLtm6Rlj2R50gUvCyl7UjKHiu9oqqui4NfHLOfjMiSh03baVLKXgHKmp4hI+825+mAYp7ipUkruIN0p/BEoDXXLlm0OO1MOox+8dYiod27qVbQ+1GYWHGywKsQaIZe7nLdj721oCPqdLl/slfcywiSI+OAzWFd43EqSHH8KakaOnJNuk/4QnBrk5HUG/dfwjdt360soX327ypo2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95my0NugT/rb/skPvc8KlSmkJ33+9iH/VWzaAPr4a/8=;
 b=LvgQSjO3HEW/YIE1Onsr3ZsNrPvkt2xUv6mxfFRhkQZm0MQBiG07XcKtbXBj0zBQU9tOv2zfujQxziUSHAJxrp4BsvZO1Jy/LM+urleKBgBrHXQakq97wx2FOASlGi67f9GH9oGCkSNBLNt+vC2spJQtRdXB2EfVGUCSH1eB7sk=
Received: from MN2PR12CA0002.namprd12.prod.outlook.com (2603:10b6:208:a8::15)
 by MW4PR12MB7016.namprd12.prod.outlook.com (2603:10b6:303:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:54:39 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::a3) by MN2PR12CA0002.outlook.office365.com
 (2603:10b6:208:a8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 08:54:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 08:54:38 +0000
Received: from [10.136.43.233] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 03:54:34 -0500
Message-ID: <b1c835f3-a574-4201-8628-c5e813a0e19f@amd.com>
Date: Mon, 21 Apr 2025 14:24:26 +0530
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
 <616187d5-e178-4fa5-a0a2-1509f11d1a37@amd.com>
 <97aaf3e5-22d7-4020-964c-891ad619bf4f@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <97aaf3e5-22d7-4020-964c-891ad619bf4f@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|MW4PR12MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d794319-2959-4a13-65db-08dd80b2262c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGI1TmdMdUd2eTEreWNmU0E0bnVjdDk3TmtJK253bFpFeUM5b1JTVDRpOG40?=
 =?utf-8?B?SVd1Qk1Tay9UY1JDOFZ6OWxIUzdOajBIc0tzSG1zWVl1YklDMjExTVdERjVy?=
 =?utf-8?B?T0JzVzVUT3hGOWVvbnRRTS9Rd20vbHQyK2N3WS9Tdk9vU3MrcEc5R005N1Ni?=
 =?utf-8?B?V0Z5Slp0emZaQTJkalFYbWVFSWlsQ0theGxvVCs2UGJ6ckFYVUZPUXNhQThL?=
 =?utf-8?B?akxQZDVXUTRkZ1NNSDdIZWNrMFBrNGlmcHh1SFhWZnltWUdRWVBVQU55Y1dy?=
 =?utf-8?B?QTFBbWRJTExNRjZteXpCMzcyUWV3Rko0RXlmY0tnc3pqOHFFbFBxY21QQkgr?=
 =?utf-8?B?bzhCZm9ZR2tia3A5QVdySnZQR0RzRko0YWNvcW95WUw4UXJURldCcnA4Ty8x?=
 =?utf-8?B?TDZlWEIrWFJ1SVlzMXRzU3JOZy9tRHhTRTgvSm9yRnE4YXpjbGpjSHJhdHVn?=
 =?utf-8?B?QTJpOTdBZzM4bXFRMVFuNWUvaGlNNEVwazhTY3BJckdqdlJhZGMva2MzU09p?=
 =?utf-8?B?WWRRTy84dUF3NjYvNmNxbkFTN3FtNlkzbnZYVDJyY0VxSjZTa1VDenFlQVJ3?=
 =?utf-8?B?L241STFNZ240cGpUT0tOYnJjVm9BSGJvcW56NkE3dzN5djVSZXRLeWJacjZt?=
 =?utf-8?B?T1lmRklZZEhQVkFNQlZhS01rb0F0OHFJWWFtR1d0WlNabGFMRVN3R1EzY1ZQ?=
 =?utf-8?B?eTB5QVVHSXgxTHJoZHFZM2tuT0s5NjNvcU5ic1dhSUc2dlU4U2N5VUZST1FP?=
 =?utf-8?B?cGJTODVDWDBZSDVWMTBkK0JtbDN4VWZnTlZkMVliNm1lUExIOEFBTWowZXRt?=
 =?utf-8?B?Uzl3TjVsSHNCSzNNa2lrS1dveXFUYjNGRWczdU4rUUFlTDhBZU9nRnBLZm5X?=
 =?utf-8?B?ME1ROHE4UGFMQVFGM2Z4blBVVWliYWNzRkZEb0gvaTJGZnJWc0daWEJPbVZB?=
 =?utf-8?B?Vjg3VDNxby9NMnRMUHZaQ2F6YkNYUldLaGVrdUJ1eFFacmVvMTlsNXhqdUJG?=
 =?utf-8?B?N2JPK2gyVzZSN1Fya2Y4ZmN4azZKSWJ5SG43ZHVQSyszRHlTRjM0YlVkaUhN?=
 =?utf-8?B?bGlPTVBDcE1vc21zNEJYckxtZWsxOERpZzZ2cXN4aEQ5Vk5Mbk4zY2RPZnBm?=
 =?utf-8?B?U25UK3lMT0lLc3d1UTd2QitOSkVOQ1ovdlVDRkxFMWNrOXpDbFhOSUI3aGdG?=
 =?utf-8?B?cGNBZ0s0Vk5ZWnp3V0o1NFErV3E3M2wzUWlLK3o2ZXU5OEtpQXlYa0lQU1ZK?=
 =?utf-8?B?UDIvazh3RUlveU1QbzRCTDVLUFI1RWNPZnlRSmRjV0cvZjJna3ZGTHRIVmpK?=
 =?utf-8?B?OXcvYlVQTkhkOVg0YlozbVg2THVCZ3A5cHcwWDc2Sy9qN0x2QldOUmNPQ1lX?=
 =?utf-8?B?VEQvM0xCQ0VGbTJSRTdGL1hMWkUwZ2VDelJUTkNZbHoxVXM5SmlKRDBMcEpQ?=
 =?utf-8?B?a2djRlIvU25YYkZXVjdFWWo5TERETmFXMENGOFVTZVgzeFlLRkV1UkdCTVc4?=
 =?utf-8?B?SDVQaEM4RmlmTXNqU21LOEpHSVRuSDFFOUJ2OUFjR0s5dXZWYkZwRnhvU0ZX?=
 =?utf-8?B?NUFwL09IZjNYeEltcnlaY2lqNDY2aW1wNXoxS0NjWVBKRjNWZ0ZLODRhdHd5?=
 =?utf-8?B?UXppWmVJVzJBaVRtYUVSbjR1VEFsWGpybVN2OXozdTNsSkE3Q0czSG9pMG1Y?=
 =?utf-8?B?THlqS1JoY04yZ04wVE1mYU5iZzBCQWpwZkpwNS8waXI4K2RBQjNyaDd5WW5Z?=
 =?utf-8?B?b3ErL0xHc0dSRFJncEd1YUIyZUVxM1JVNEsvdjIycmJSWm5BUkpyZzBWeGEy?=
 =?utf-8?B?bzVJbG1vd3hqeTg5b0J4eGFzWXVuQWlqODh1My9SSzFMcDA3TVRUVTlWdVB0?=
 =?utf-8?B?eUhUS0FMckNWeTFWcExxYVZhajBuM2FmekhCYjJYMEtETEhKYTczUmVBUThm?=
 =?utf-8?B?Z0djSVhwbUNYODdkU1lObURGSWNYTUdIWTJLR0VEaVkvK0pnb3B5ZlRGdWFM?=
 =?utf-8?B?cGRxZHBZWGt3VkFTYTcyM0kzclhnTE93MnFBNWV4YSsvenJCemwrMWVZd2to?=
 =?utf-8?Q?GSyZHu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:54:38.9021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d794319-2959-4a13-65db-08dd80b2262c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7016

Hello Shrikanth,

On 4/21/2025 1:33 PM, Shrikanth Hegde wrote:
>>> I was getting below error when compiling. Noticed that overloaded_mask is a local update and it wouldn't
>>> update the actual overloaded_mask.
>>
>> Interesting! Question: Do you have "CONFIG_CPUMASK_OFFSTACK" enabled in
>> your config? (me makes a note to test this too in the next iteration)
>> Looking at the arch specific Kconfigs, there is a slight difference in
>> how this is toggled on x86 vs powerpc and I'm wondering if that is why
>> I haven't seen this warning in my testing.
>>
> 
> Yes, that's the reason you didn't run into.
> for me, CONFIG_CPUMASK_OFFSTACK is not set.

Thank you for confirming!

> 
>>>
>>> Compilation Error:
>>> kernel/sched/fair.c: In function ‘update_overloaded_mask’:
>>> kernel/sched/fair.c:8570:25: error: assignment to expression with array type
>>>   8570 |         overloaded_mask = sd_share->overloaded_mask;
>>>        |                         ^
>>> kernel/sched/fair.c:8571:13: warning: the address of ‘overloaded_mask’ will always evaluate as ‘true’ [-Waddress]
>>>   8571 |         if (!overloaded_mask)
>>>
>>>
>>>
>>> Made the below change. Also you would need rcu protection for sd_share i think.
> 
> Or you need to use like below. This also works (Not tested on x86)
> 
> struct cpumask*  overloaded_mask;

Ack! Perhaps that is the way to go. I'll take some inspiration from
other cpumask usage in kernel and adjust this accordingly. Thanks a ton
for testing.

> 
>>
>> You are right! Thank you for the pointers and spotting my oversight.
>> Aaron too pointed some shortcomings here. I'll make sure to test
>> these bits more next time (LOCKDEP, hotplug, and
>> !CONFIG_CPUMASK_OFFSTACK)

-- 
Thanks and Regards,
Prateek

