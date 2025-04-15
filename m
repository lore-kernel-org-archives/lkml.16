Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7379B8633F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713265; cv=fail; b=tndSWqhXjLbPac1u8mfJypAJRRmS/gyUPdEXf0pZEwwVOeB6KuzhW/+omfxuZr+1B1bMQE/V4Z0M168N/Aj1i/y5JwCb137WHzm8INa4ZQFB5W/VN8hteQt8PhusqfYNXPgsaHt9krAnBKNEwafIW14hLU79oRL9oVy92v4RShk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713265; c=relaxed/simple;
	bh=b8156jox10HQUNzqWUS4QrYAU9hMKE1cofrt7WDdVpU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=VP+LHsxH4B2bBulDcZdp9iWc2zcSyIYzm7t1gQWLi28ClWwKy/NVyMcBp/CcA/VVFIpashts6ZwojxcQATpVivti4JUAwNTOZ/b7bt8L82/Gi80WLxTEyqxr/GIeAjtxISy+Nk77syjv+CnGzF5Xg4/MlPQFfyHNGtWTYdoXwBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kZVgvjTT; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kZVgvjTT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smpYdDj7Z7wSnQx7PHoyMdb3VssgGOGs0NiCIfKnx+06n8yfq4owRul0XggnGaqq7114LjcHqoi2kf33U1yZdZtbbaIb2706sHgm/w19bDbvjDCbVtOlQx3aZF/NXymcCT/+CpSoqfJTJcQsRt+t+PQ6n2IHD7+7rZDLQ27rnjJlrVOXZHhXc2weCKgj8zzBkTRAVt++Aw/9tzPkLyUfOqDKg4RZFV7/HBC5S9ANQSroy4VSF3t2GWUBiGa17AqahG/VfG6/ypvSaYyXkhv/gJ4OW43JMCc3siH4Yh+YfOHsoXJiWQcOaBBF3bcZjk1NGEdU2DinjJDy+k8kUorIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlvucRu5Gzo34wIU8A6mWA4I73vzC2lgvPiX7yXm0L4=;
 b=CEWe6ohYVzwFSMzFs5btdbpqDuiHmGVzfy+PpuCTt3OzCRmfjS3+837JjmrX0OjUrYsMSMKzts3fCodmW1TnhiK9QW87cyWdsh7LIr0OtslzKb66GdGca06u5GhlE/gFWMG9cb2WGMhDGdlNvX4Q798wT/tYW+AKvVwBVRh05NlJ79KKEbW6JSo9q3I0XiH7IDBAVg3Tq3ncGXKzr+VKM5y2Q4PidTH1njF3raC5eZQT0M0AVWlrRtIwqcrvrcQW+uiC9T9zyFmo96gchHCk3u6VNhDUR1xwzXcTcXtYAc9su9ZCwXO3/Rl+nsN/3PLreQTIWfYx0YxP8TWyzchguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=siemens.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlvucRu5Gzo34wIU8A6mWA4I73vzC2lgvPiX7yXm0L4=;
 b=kZVgvjTT+ME9oPyIEDEgoAuuLZ4SxDD6MN6WMVZ3pfWX6xzoDyZzuCrP/gnoMmO+6J0lh1ojO4UkRlrkQaFcE3bid8XraXvUb1HxrTa9GrCS0CoyXRM5hVybLD7rSXa9AAYof7sDRwVgeJp8LijEWljLe4GZVhxFhgERZxh/Lvo=
Received: from DS7PR03CA0207.namprd03.prod.outlook.com (2603:10b6:5:3b6::32)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Tue, 15 Apr
 2025 10:34:19 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::9a) by DS7PR03CA0207.outlook.office365.com
 (2603:10b6:5:3b6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 10:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 10:34:19 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 05:34:14 -0500
Message-ID: <62304351-7fc0-48b6-883b-d346886dac8e@amd.com>
Date: Tue, 15 Apr 2025 16:04:11 +0530
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
Content-Language: en-US
In-Reply-To: <5e919998-338c-4055-b58a-e4586134956c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 4677fccc-20a0-450a-a3ee-08dd7c091438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cllsdnlmNVpvSENjTFRpVGJJWnlWVE56czA1TW5nYStVRHVjdWFJNWIyR0dM?=
 =?utf-8?B?dGF0Wm9KUWh0T1BFR0RlenQ3RGFGc2pZY0o1V3Vyb0t4NlhQdXdCanJ0QnZz?=
 =?utf-8?B?YmROZ2F4cnhmWXlCYW0xRmN2NEMyeGVST2dLWi9mUVltbGlVVVd2aTVpWWxL?=
 =?utf-8?B?LzBTai82WTNXRFlvYmNhalhRNlJwbHZGOXhIZTFkbEhHTktZcDlFZWUzMUxD?=
 =?utf-8?B?QmcrOXMvVzhpWThnazR5NXVZQi9YdGpNRVVBa1NlbzBmbzNSc2h4SldIN0pB?=
 =?utf-8?B?UUFFcUlyekZ6UHhKM01BUGI4bjdpazRWSDhtRGdCZ1paOWl5Sm9CeTRCRWM4?=
 =?utf-8?B?SjhodDNNQUt0YXQyNk9rSmFRYjR2cS9VQlRIWU5tWnpqZERzWDk5bVhJbVVp?=
 =?utf-8?B?Mmo0eWdXazBhL3pDWFAvVWdKeDhzczNtT1NRNjJSaXYrUHIzbkkxajV0Vy9r?=
 =?utf-8?B?QVJ1eGxxNmQ2czhVSzMyUHhORW4xTmkxT1VPMWx2R096dFVmNFR1N3Rvam51?=
 =?utf-8?B?MTJQUXZDQndhUWV2RExlYytYTW5iblFTUkJXa0V6a3VsOHIwVDZ1cVJJd050?=
 =?utf-8?B?Z2lJRUJNSVZLMFlzNy9Oa1R4MjhaODBWTHNrNGFTd3RJSkswVzh3MndIUmU3?=
 =?utf-8?B?WlhJTWdCbmtiOEVrd1lNM0VVbE1CbEtJRWd0QUpraFVpcXB0M1FmdVI4TW5S?=
 =?utf-8?B?TUMrVWlwY1BYOW5Za0kwR1dsUVdHQjg0cHo1QmdsZWQ4cWtEUVEwb0RyRklM?=
 =?utf-8?B?c1djTXNGbXF3YzV3T0ZnSDZHNllDdk5WMit6enZWV21iaVM1TWFsTW1wRWVz?=
 =?utf-8?B?UTFoTVppZTNtRmFySmh6V0NLVStlVS9nTnMxMU5hQ2x1a3dqb0tDU1ZhM3Vz?=
 =?utf-8?B?S3lMNDg0R2JrOWFmR1Q5eWVwejVzdFRpQXh0dTRkZjhENndFTU1SVlNYSFJX?=
 =?utf-8?B?YnNGWnd4T1RWSGNzejZqa24rVGhOQm44TG01QzNuMmh0MXYzdklpUGFyVW1i?=
 =?utf-8?B?QjFIa2lwU2hTaytlZDFXWXRzUExUZ2kwM0cyK0RETUs4eXcxekNYNUdGU2hQ?=
 =?utf-8?B?SjFQMW42eFgrRlV2UjViYnFsSCt0aUJWSG9scWZ3VEhReUxwTmtHSDFhSld3?=
 =?utf-8?B?ems3M1Fveld4ZW5PNkk2ZWRhSGw5Z0RaR0dFSk0raUtEd0VFKzBSKzdSMlZa?=
 =?utf-8?B?QzFmTnZZK3JlNUNOb2JWQjc4NFp6cy9EYlM2L3lUUVlzNmpjVmEzb1g2VEF3?=
 =?utf-8?B?OW5Uc2ZuVzNpTS96aFhqU3lOQWc1bEtrYTZBeFRNK2NDZWNLeFNLbVNDWERP?=
 =?utf-8?B?YXRGVVk0TG9yVEM3a2s1WFovK1VXdFlNNVlHakJ0dVVpUSsra2ZZSXNLeGFV?=
 =?utf-8?B?VFh2U0ZTOUVsV2N3ZEJQdEthZktibnI5V2lmSDhCWkdLMFh1b3M3M1FxM29D?=
 =?utf-8?B?eXZVaTA4K1BhY3NLdGFBN2E5ZWpvN01JbXEzNzVPZmYreEMyR2RrVlVRWUFn?=
 =?utf-8?B?NmEvNVpic0kxaktLQ0J0MmQzcGIyaCtneEE4ekVwZ3FReGlSQUU3aXoxMjIy?=
 =?utf-8?B?ZjlmalBqZDM5Z1BINHZ3T0doRGs4NlNTS0NtUWRIVHpjU2w2VFRSZVh1SVpT?=
 =?utf-8?B?amFDeVlTaU9YWHkxQzdRRG9YT0UvU3IvTUsxNkNVTXFRUGJGdVZWRXZKRkNj?=
 =?utf-8?B?Ykh2UFdHZFpNV0VVV2JIdE9ta2VFMnlINTVMd3BZM2xOZUlaVWFjOGpSbE1G?=
 =?utf-8?B?ckh0Wm5POGNnRkx2MVNDcjBZblBPdFcwN25JaCt1WVBWby8wUS9jdVNpcUNn?=
 =?utf-8?B?NUxKZFlrdEIvOG5vdjRzZzQ2Z3dQaVVEQTljbGVXQXVyaHdsM3pSTUxSTFg1?=
 =?utf-8?B?djRZZmkvVUhmdTNWUFpveWxKSWFNT01DREZGOFRSMmN2VWp3OXhVaXRtdGxU?=
 =?utf-8?B?K1B4WEZQVWprcExqQlhFOWZscFFmT0VMK2hQb3lVWkx5UGZOZ0hNRUNBK3h5?=
 =?utf-8?B?SkxtUGRrU1pvOEhiMXNiSlNYcTYwK1JQRDVWclBkU0ZNb2IzbE9TdUM2TjFB?=
 =?utf-8?Q?geRfc8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 10:34:19.0878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4677fccc-20a0-450a-a3ee-08dd7c091438
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561

On 4/15/2025 2:15 PM, K Prateek Nayak wrote:
> (+ Sebastian)
> 
> Hello Jan,
> 
> On 4/15/2025 11:39 AM, Jan Kiszka wrote:
>>>> Attached the bits with which we succeeded, sometimes. Setup: Debian 12,
>>>> RT kernel, 2-4 cores VM, 1-5 instances of the test, 2 min - 2 h

To improve the reproducibility, I pinned the two tasks to the same CPU
as the bandwidth timer and I could hit this consistently within a few
minutes at the most.

>>>> patience. As we have to succeed with at least 3 race conditions in a
>>>> row, that is still not bad... But maybe someone has an idea how to
>>>> increase probabilities further.
>>>
>>> Looking at run.sh, there are only fair tasks with one of them being run
>>> with cfs bandwidth constraints. Are you saying something goes wrong on
>>> PREEMPT_RT as a result of using bandwidth control on fair tasks?
>>
>> Yes, exactly. Also our in-field workload that triggers (most likely)
>> this issue is not using RT tasks itself. Only kernel threads are RT here.
>>
>>>
>>> What exactly is the symptom you are observing? Does one of the assert()
>>> trip during the run? Do you see a stall logged on dmesg? Can you provide
>>> more information on what to expect in this 2min - 2hr window?
>>
>> I've just lost my traces from yesterday ("you have 0 minutes to find a
>> power adapter"), but I got nice RCU stall warnings in the VM, including
>> backtraces from the involved tasks (minus the read-lock holder IIRC).
>> Maybe Florian can drop one of his dumps.
> 
> So I ran your reproducer on a 2vCPU VM running v6.15-rc1 PREEMPT_RT
> and I saw:
> 
>      rcu: INFO: rcu_preempt self-detected stall on CPU
>      rcu:     0-...!: (15000 ticks this GP) idle=8a74/0/0x1 softirq=0/0 fqs=0
>      rcu:     (t=15001 jiffies g=12713 q=24 ncpus=2)
>      rcu: rcu_preempt kthread timer wakeup didn't happen for 15000 jiffies! g12713 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
>      rcu:     Possible timer handling issue on cpu=0 timer-softirq=17688
>      rcu: rcu_preempt kthread starved for 15001 jiffies! g12713 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
>      rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
>      rcu: RCU grace-period kthread stack dump:
>      task:rcu_preempt     state:I stack:0     pid:17    tgid:17    ppid:2      task_flags:0x208040 flags:0x00004000
>      Call Trace:
>       <TASK>
>       __schedule+0x401/0x15a0
>       ? srso_alias_return_thunk+0x5/0xfbef5
>       ? lock_timer_base+0x77/0xb0
>       ? srso_alias_return_thunk+0x5/0xfbef5
>       ? __pfx_rcu_gp_kthread+0x10/0x10
>       schedule+0x27/0xd0
>       schedule_timeout+0x76/0x100
>       ? __pfx_process_timeout+0x10/0x10
>       rcu_gp_fqs_loop+0x10a/0x4b0
>       rcu_gp_kthread+0xd3/0x160
>       kthread+0xff/0x210
>       ? rt_spin_lock+0x3c/0xc0
>       ? __pfx_kthread+0x10/0x10
>       ret_from_fork+0x34/0x50
>       ? __pfx_kthread+0x10/0x10
>       ret_from_fork_asm+0x1a/0x30
>       </TASK>
>      CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc1-test-dirty #746 PREEMPT_{RT,(full)}
>      Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
>      RIP: 0010:pv_native_safe_halt+0xf/0x20
>      Code: 22 df e9 1f 08 e5 fe 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 85 96 15 00 fb f4 <e9> f7 07 e5 fe 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90
>      RSP: 0018:ffffffff95803e50 EFLAGS: 00000216
>      RAX: ffff8e2d61534000 RBX: 0000000000000000 RCX: 0000000000000000
>      RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000081f8a6c
>      RBP: ffffffff9581d280 R08: 0000000000000000 R09: ffff8e2cf7d32301
>      R10: ffff8e2be11ae5c8 R11: 0000000000000001 R12: 0000000000000000
>      R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000147b0
>      FS:  0000000000000000(0000) GS:ffff8e2d61534000(0000) knlGS:0000000000000000
>      CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>      CR2: 000055e77c3a5128 CR3: 000000010ff78003 CR4: 0000000000770ef0
>      PKRU: 55555554
>      Call Trace:
>       <TASK>
>       default_idle+0x9/0x20
>       default_idle_call+0x30/0x100
>       do_idle+0x20f/0x250
>       ? do_idle+0xb/0x250
>       cpu_startup_entry+0x29/0x30
>       rest_init+0xde/0x100
>       start_kernel+0x733/0xb20
>       ? copy_bootdata+0x9/0xb0
>       x86_64_start_reservations+0x18/0x30
>       x86_64_start_kernel+0xba/0x110
>       common_startup_64+0x13e/0x141
>       </TASK>
> 
> Is this in line with what you are seeing?

These are the backtrace for timer and the individual
epoll-stall threads:

[  539.155042] task:ktimers/1       state:D stack:0     pid:31    tgid:31    ppid:2      task_flags:0x4208040 flags:0x00004000
[  539.155047] Call Trace:
[  539.155049]  <TASK>
[  539.155051]  __schedule+0x401/0x15a0
[  539.155055]  ? srso_alias_return_thunk+0x5/0xfbef5
[  539.155059]  ? propagate_entity_cfs_rq+0x115/0x290
[  539.155063]  ? srso_alias_return_thunk+0x5/0xfbef5
[  539.155067]  ? srso_alias_return_thunk+0x5/0xfbef5
[  539.155070]  ? rt_mutex_setprio+0x1c2/0x480
[  539.155075]  schedule_rtlock+0x1e/0x40
[  539.155078]  rtlock_slowlock_locked+0x20e/0xc60
[  539.155088]  ? srso_alias_return_thunk+0x5/0xfbef5
[  539.155093]  rt_read_lock+0x8f/0x190
[  539.155099]  ep_poll_callback+0x37/0x2b0
[  539.155105]  __wake_up_common+0x78/0xa0
[  539.155110]  timerfd_tmrproc+0x43/0x60
[  539.155114]  ? __pfx_timerfd_tmrproc+0x10/0x10
[  539.155116]  __hrtimer_run_queues+0xfd/0x2e0
[  539.155124]  hrtimer_run_softirq+0x9d/0xf0
[  539.155128]  handle_softirqs.constprop.0+0xc1/0x2a0
[  539.155134]  ? __pfx_smpboot_thread_fn+0x10/0x10
[  539.155139]  run_ktimerd+0x3e/0x80
[  539.155142]  smpboot_thread_fn+0xf3/0x220
[  539.155147]  kthread+0xff/0x210
[  539.155151]  ? rt_spin_lock+0x3c/0xc0
[  539.155155]  ? __pfx_kthread+0x10/0x10
[  539.155159]  ret_from_fork+0x34/0x50
[  539.155165]  ? __pfx_kthread+0x10/0x10
[  539.155168]  ret_from_fork_asm+0x1a/0x30
[  539.155176]  </TASK>

[  557.323846] task:epoll-stall     state:D stack:0     pid:885   tgid:885   ppid:1      task_flags:0x400000 flags:0x00004002
[  557.323848] Call Trace:
[  557.323849]  <TASK>
[  557.323851]  __schedule+0x401/0x15a0
[  557.323853]  ? rt_write_lock+0x108/0x260
[  557.323858]  schedule_rtlock+0x1e/0x40
[  557.323860]  rt_write_lock+0xaa/0x260
[  557.323864]  do_epoll_wait+0x21f/0x4a0
[  557.323869]  ? __pfx_ep_autoremove_wake_function+0x10/0x10
[  557.323872]  __x64_sys_epoll_wait+0x63/0x100
[  557.323876]  do_syscall_64+0x6f/0x120
[  557.323879]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323881]  ? ksys_read+0x6b/0xe0
[  557.323883]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323885]  ? syscall_exit_to_user_mode+0x51/0x1a0
[  557.323887]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323889]  ? do_syscall_64+0x7b/0x120
[  557.323890]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323892]  ? ep_send_events+0x26d/0x2b0
[  557.323896]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323898]  ? do_epoll_wait+0x17e/0x4a0
[  557.323900]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323902]  ? __rseq_handle_notify_resume+0xa7/0x500
[  557.323905]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323907]  ? aa_file_perm+0x123/0x4e0
[  557.323911]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323912]  ? get_nohz_timer_target+0x2a/0x180
[  557.323914]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323916]  ? _copy_to_iter+0xa3/0x630
[  557.323920]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323922]  ? timerqueue_add+0x6a/0xc0
[  557.323924]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323926]  ? hrtimer_start_range_ns+0x2e7/0x4a0
[  557.323931]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323932]  ? timerfd_read_iter+0x141/0x2b0
[  557.323934]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323936]  ? security_file_permission+0x123/0x140
[  557.323940]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323942]  ? vfs_read+0x264/0x340
[  557.323946]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323948]  ? ksys_read+0x6b/0xe0
[  557.323950]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323951]  ? syscall_exit_to_user_mode+0x51/0x1a0
[  557.323953]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323955]  ? do_syscall_64+0x7b/0x120
[  557.323957]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323958]  ? syscall_exit_to_user_mode+0x168/0x1a0
[  557.323960]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323962]  ? do_syscall_64+0x7b/0x120
[  557.323963]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.323965]  ? do_syscall_64+0x7b/0x120
[  557.323967]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  557.323968] RIP: 0033:0x7f0371fd3dea
[  557.323970] RSP: 002b:00007ffd1062cd68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e8
[  557.323971] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0371fd3dea
[  557.323972] RDX: 0000000000000001 RSI: 00007ffd1062cda4 RDI: 0000000000000005
[  557.323973] RBP: 00007ffd1062ce00 R08: 0000000000000000 R09: 000055ea1d8f12a0
[  557.323974] R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffd1062cf18
[  557.323975] R13: 000055ea03253249 R14: 000055ea03255d80 R15: 00007f0372121040
[  557.323979]  </TASK>

[  557.431402] task:epoll-stall-wri state:R  running task     stack:0     pid:887   tgid:887   ppid:1      task_flags:0x400100 flags:0x00000002
[  557.431405] Call Trace:
[  557.431406]  <TASK>
[  557.431408]  __schedule+0x401/0x15a0
[  557.431410]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431412]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431414]  ? psi_group_change+0x212/0x460
[  557.431417]  ? pick_eevdf+0x71/0x180
[  557.431419]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431421]  ? update_curr+0x8d/0x240
[  557.431425]  preempt_schedule+0x41/0x60
[  557.431427]  preempt_schedule_thunk+0x16/0x30
[  557.431431]  try_to_wake_up+0x2f6/0x6e0
[  557.431433]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431437]  ep_autoremove_wake_function+0x12/0x40
[  557.431439]  __wake_up_common+0x78/0xa0
[  557.431443]  __wake_up_sync+0x34/0x50
[  557.431445]  ep_poll_callback+0x13e/0x2b0
[  557.431448]  ? aa_file_perm+0x123/0x4e0
[  557.431451]  __wake_up_common+0x78/0xa0
[  557.431454]  __wake_up_sync_key+0x38/0x50
[  557.431456]  anon_pipe_write+0x43b/0x6d0
[  557.431461]  fifo_pipe_write+0x13/0xe0
[  557.431463]  vfs_write+0x374/0x420
[  557.431468]  ksys_write+0xc9/0xe0
[  557.431471]  do_syscall_64+0x6f/0x120
[  557.431473]  ? current_time+0x30/0x130
[  557.431476]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431479]  ? vfs_write+0x1bd/0x420
[  557.431481]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431483]  ? vfs_write+0x1bd/0x420
[  557.431487]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431489]  ? ksys_write+0xc9/0xe0
[  557.431491]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431492]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431494]  ? syscall_exit_to_user_mode+0x51/0x1a0
[  557.431496]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431498]  ? do_syscall_64+0x7b/0x120
[  557.431501]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431502]  ? ksys_write+0xc9/0xe0
[  557.431504]  ? do_syscall_64+0x7b/0x120
[  557.431506]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431508]  ? syscall_exit_to_user_mode+0x51/0x1a0
[  557.431510]  ? srso_alias_return_thunk+0x5/0xfbef5
[  557.431511]  ? do_syscall_64+0x7b/0x120
[  557.431513]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  557.431515] RIP: 0033:0x7f0ef191c887
[  557.431516] RSP: 002b:00007ffc15f50948 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  557.431517] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0ef191c887
[  557.431518] RDX: 0000000000000001 RSI: 0000561a16a0203d RDI: 0000000000000003
[  557.431519] RBP: 00007ffc15f50970 R08: 0000000000000065 R09: 0000561a45f0e2a0
[  557.431520] R10: 0000000000000077 R11: 0000000000000246 R12: 00007ffc15f50a88
[  557.431521] R13: 0000561a16a011a9 R14: 0000561a16a03da8 R15: 00007f0ef1a7b040
[  557.431525]  </TASK>

> 
>>
>>>
>>> Additionally, do you have RT throttling enabled in your setup? Can long
>>> running RT tasks starve fair tasks on your setup?
>>
>> RT throttling is enabled (default settings) but was not kicking in - why
>> should it in that scenario? The only RT thread, ktimers, ran into the
>> held lock and stopped.
>>
>> Jan
>>
> 

-- 
Thanks and Regards,
Prateek

