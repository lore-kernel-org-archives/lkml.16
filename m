Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A23D1DE4CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706717; cv=fail; b=WWlrcGM8sf0U/jNG8mI8C6ooZZdCgQD4+uBnLFQvpBCdSOI1JiUjM9j9/LmBMfi76a/PW7Wek0lO+NJ/K0W0pl77Z8VKsgRS3HDg4FOOTo05o0MP+0WVmQdtS0djdlzSC0/YuuvKY2Q5fxJtLjDWgPRbSqy6WMEg4vMWHOvCq0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706717; c=relaxed/simple;
	bh=IkcD4xXEBGlOe1jc7CVxsvcq8PyLqvlbCv+Hddrsi2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vCdjdVo7ipWsUfz/UX7GMQCfljdJrkFUsN7m4nWrc9lJFn/mGDpc12l1vRWyLchyl1nY+5KaJTLnRi46XyPAM0jL+j0IY92gWYL2mhJN4CFTPn8uNONbjkyaKAffpFdzbHfdWGKWPlf6E90lyScZAQX57jRCTVqpz+L3y+w/1jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Igxs4co0; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Igxs4co0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeGd2wVHiu0CWunKvJ/p/iQtWatMqaPUpG6DXEqurOqNris7Lm8m54uWmkexYajiXrJ4I1MkXG0crzp/nX+NcNOziPMXVuSS6PHSaTWYlhghniZKVWAe8w8IZuNE5hffz7FL/paxm6g+fKas3zcpvu63evg9A/cL7E/UV6oceQeX+Ap0HOcAH1Z03O4SXeUgzcDG5A74Jrvsrufsl4RWK0HJr0wkj7EE7Up5JSWindZWo9664qJij71lUohD3KMmPjh7IKCg+wu0CSYv4eaWVj0lc4q7AdL/+KlWLROPLy9mfTvuBkmANwd/3KhR9YcAZkO+McPYw8GZEEuJ8MG5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVrlxHmqkF9Zc4qIICliFvRemKFeJ5pOznyGAbYnJOU=;
 b=BuddQKdivPhRBPvrwWidHeuy46orrhJcLh6fktFr4STeKQnQhB+K35e3k2cU2WTf2UP/K5U4prylQlNTzwzXCtKAWmlnknm1MaAXS5e7APNy7NrKo8Fnavmi/F7LSLUwQAC+yjRSjXE9r1z/qMJmD41mS7oX82M+bxmOwnTytbKue8Cb1tbsvmNd1SitD7D18Xin89G8bHefFmdRQVjxynZ6+k0O4mZQ2WOa6pkXonyhPPREzeTiabjW/sYP3CYH9A1NhkPCLA1wH8tgOBq6m9sANBMt4QyBGOuHpVd7ce0tKtlqvh/9xgLRzxNY+4FjBtyjukt0b9ZGjLm7rP6Zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=siemens.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVrlxHmqkF9Zc4qIICliFvRemKFeJ5pOznyGAbYnJOU=;
 b=Igxs4co0SS+72QtWtR+yVmqpNFjE/OdxAUdjCiL1FmFtuomrgmK/wdkKaYgofsnuZc5Ps8jIHn19YNkz2tRA65Jm1Ze4Cg/26fsb2EMLgGtCP3+aF0wydNdhGgJGUSkzpBIhEAEelgq9t68Bb0p2uTxsSGNOZTqzGAbj/AsGpPQ=
Received: from BY3PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:217::13)
 by IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 08:45:11 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::35) by BY3PR04CA0008.outlook.office365.com
 (2603:10b6:a03:217::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 08:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 08:45:10 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 03:45:04 -0500
Message-ID: <5e919998-338c-4055-b58a-e4586134956c@amd.com>
Date: Tue, 15 Apr 2025 14:15:02 +0530
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
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <55687bb5-7e8a-4d7d-a597-6f97087cab32@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|IA0PR12MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 422d32b2-24d7-4077-912a-08dd7bf9d52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEJ2RnFQR2g4bnlFcGZ0bzJSRXZVWWdLNTQ3T2FXNWVzZlFWY0dXTnM1VVNy?=
 =?utf-8?B?SDAvNDVsbURmbGFzcWlNZlJsRGVuVFd0Wm5BbkhSRmNrZXZkb3ZDVWl3eDln?=
 =?utf-8?B?WXh4a2ZZb3NnRWJjdlNHVkhSTU00VHFiOGNNa0RxTS9oMDdqL1ZHTFpiQk8r?=
 =?utf-8?B?T01kNVo5bWJWb2dOa2o3b2dUNlA1TThVbzJNRGZYdWprYnh4OWlBRjh6WkEw?=
 =?utf-8?B?bGF4N2MxZG9aWkJvY2xNbkdCT3QyQlhlWXVZZnUvcUJ3ak1hQTYwN3ZCcjFa?=
 =?utf-8?B?azRzZlJEQ2dVODkyQlhIMkFGWWFnVzNCZ2hEeDZOY3pFZFNldUpuZWRnbGU4?=
 =?utf-8?B?QjFDSndOb2ZrMlZNWHFCT2E3dEtSQUZVK1V3b29iZHlzVXh5NEcwOFBkV2d3?=
 =?utf-8?B?aWxxREZyaTBDNjYybit4b280cFRkNElMdDNreVA2V3o3NTRnSnE0Um9COE4z?=
 =?utf-8?B?VEN5ZktCOGFnQUJNdlU4bmtBWnhqNnBVSktaOGJIZTA3TExhU2oyTHI3SXdl?=
 =?utf-8?B?c2VYQzRZNEJqTkQ2dWgySk13ckRja0lRdHRvWTFOeDJRcGp4bVU0S0tWQkxa?=
 =?utf-8?B?a3JhbEFWN3dac3d6Y2ROdXM2VEJEMWJhWFdEMDE0NnJaV2p1VEhaL2tjS0Yy?=
 =?utf-8?B?T0JCQWd0Y3Q0Yms0ZFpwNXBMZjJHRDRWS09zTmcyWWcyemJDVFZicnZ3TkV2?=
 =?utf-8?B?S2w5eE5xWGZEbkRXVUVkSnBWM2svRSs2QTdhZ05NZmd3S3NBV3VlV3ZBenZU?=
 =?utf-8?B?RDRMejFVd2VnWFpXWkJwcEZDQUczNCtzY29QUnNHOWhiSjRBNm1aU244WElw?=
 =?utf-8?B?OWVmR3Y0dkF6dGNFeUQ0bFZIbWJBSE0zL0g4dmZEOTNOV1NIQlZsK0NGTXJx?=
 =?utf-8?B?VUNybUo5ZVhndHZGd2pvUVAvYXprbXE0ajVpYjZKdzNDejFCNU5meHQrWVRG?=
 =?utf-8?B?MXhzT0h1azhBWEJTVTRBSmJFcXBrSkVJdGoxc0dQczFJeVZSZUlwWkk5bDFh?=
 =?utf-8?B?QU02YW1INytncU5IL2o1YVkxNmp5b3JLcDVBWHdpWDlPWktxQXdkU00xY2Vq?=
 =?utf-8?B?YmRnZW5QWGdha0U2NVkxaTlPWU5CVDJqL0twTG43ZVRvc0szdTFJNGFNeGJJ?=
 =?utf-8?B?eDVMckZJcThubnYwMTZhSGFVZXc2QXdzTVRMK3FSNW83Wk00WExZNzVZTUMv?=
 =?utf-8?B?OFhiblVTOUdWREhJN1BHNkVzMDVyOUVDbFkwQjFjcktCcXZHMGtzZ3g1akpj?=
 =?utf-8?B?dkZaK0NDUmFnVmpHVlhtSlh6RWlCMDVSWTVYb1lrV2lsYVBzaXF3Uld4UXBF?=
 =?utf-8?B?K1o2Y3VqOUhINDFhSHVMVk1hck55T0w4aXVTMFlmT2xRWXd3d08vSm9DVDIw?=
 =?utf-8?B?KzRrZ2laWFFHWlQzSktQcWlFOFBSOW1vTk45aUQ5YXFLSUFQT3lmWTd1VU9S?=
 =?utf-8?B?NGtCMUpIL29QbjV2Mjh4Z2UraU8xSS9pa1ZYVzFjQkJrOW03b3hpdW9BblZi?=
 =?utf-8?B?czlTbGFHSDNGdDJYVUIvZkUrWWhVUk4wY3lSNElBTkF0cDljTlVzOEpURlY3?=
 =?utf-8?B?RFhyOCtCYmg4S3VJd3BlMWJ2WnVFVXlJUWpJOThUTXZISnVlK2ZEKzgxbW1M?=
 =?utf-8?B?VFp4WWx5UkpNMGFYS0UxdDd6Q29odnRkbDFWLythdFdqTkpCaDVIbEJWY1Nt?=
 =?utf-8?B?MTF4aUsyNEtoMGlxTE5qZ3YzVWIzZFJxOXM3cFRpdTY3a0xVcTE4eG1uUHlI?=
 =?utf-8?B?cUp6YSt0MVpvYWtGc0QrWU5GelZBSEYxWXR2dlVnWE5oRW5zaFZVeVY2TDVq?=
 =?utf-8?B?bDgxSktwczBsTmtmNHVIYVhnY2NjTnNRYllZVE9QaFR6SkRUWVlkSElPQmRW?=
 =?utf-8?B?c01aZm1UWEVIL21nZ1FFSjZscCttZHpFamZWelF2VEsvS3c5M2FHOCtZY3Ew?=
 =?utf-8?B?Rnk4L3RGaElRRTJxdFZ5eEVvdXNza3ZUTzVTWUxnZ2pSOGZNQWM3TU4rRlhU?=
 =?utf-8?B?VGhuVlJvTFREQjEyZ1kzZlc1U2JPWnZtVHlYR29DVWRtT1doR2Y5ZHF3UFMy?=
 =?utf-8?Q?mnOKFK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 08:45:10.8547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 422d32b2-24d7-4077-912a-08dd7bf9d52b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7721

(+ Sebastian)

Hello Jan,

On 4/15/2025 11:39 AM, Jan Kiszka wrote:
>>> Attached the bits with which we succeeded, sometimes. Setup: Debian 12,
>>> RT kernel, 2-4 cores VM, 1-5 instances of the test, 2 min - 2 h
>>> patience. As we have to succeed with at least 3 race conditions in a
>>> row, that is still not bad... But maybe someone has an idea how to
>>> increase probabilities further.
>>
>> Looking at run.sh, there are only fair tasks with one of them being run
>> with cfs bandwidth constraints. Are you saying something goes wrong on
>> PREEMPT_RT as a result of using bandwidth control on fair tasks?
> 
> Yes, exactly. Also our in-field workload that triggers (most likely)
> this issue is not using RT tasks itself. Only kernel threads are RT here.
> 
>>
>> What exactly is the symptom you are observing? Does one of the assert()
>> trip during the run? Do you see a stall logged on dmesg? Can you provide
>> more information on what to expect in this 2min - 2hr window?
> 
> I've just lost my traces from yesterday ("you have 0 minutes to find a
> power adapter"), but I got nice RCU stall warnings in the VM, including
> backtraces from the involved tasks (minus the read-lock holder IIRC).
> Maybe Florian can drop one of his dumps.

So I ran your reproducer on a 2vCPU VM running v6.15-rc1 PREEMPT_RT
and I saw:

     rcu: INFO: rcu_preempt self-detected stall on CPU
     rcu:     0-...!: (15000 ticks this GP) idle=8a74/0/0x1 softirq=0/0 fqs=0
     rcu:     (t=15001 jiffies g=12713 q=24 ncpus=2)
     rcu: rcu_preempt kthread timer wakeup didn't happen for 15000 jiffies! g12713 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
     rcu:     Possible timer handling issue on cpu=0 timer-softirq=17688
     rcu: rcu_preempt kthread starved for 15001 jiffies! g12713 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
     rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
     rcu: RCU grace-period kthread stack dump:
     task:rcu_preempt     state:I stack:0     pid:17    tgid:17    ppid:2      task_flags:0x208040 flags:0x00004000
     Call Trace:
      <TASK>
      __schedule+0x401/0x15a0
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? lock_timer_base+0x77/0xb0
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? __pfx_rcu_gp_kthread+0x10/0x10
      schedule+0x27/0xd0
      schedule_timeout+0x76/0x100
      ? __pfx_process_timeout+0x10/0x10
      rcu_gp_fqs_loop+0x10a/0x4b0
      rcu_gp_kthread+0xd3/0x160
      kthread+0xff/0x210
      ? rt_spin_lock+0x3c/0xc0
      ? __pfx_kthread+0x10/0x10
      ret_from_fork+0x34/0x50
      ? __pfx_kthread+0x10/0x10
      ret_from_fork_asm+0x1a/0x30
      </TASK>
     CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc1-test-dirty #746 PREEMPT_{RT,(full)}
     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
     RIP: 0010:pv_native_safe_halt+0xf/0x20
     Code: 22 df e9 1f 08 e5 fe 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 85 96 15 00 fb f4 <e9> f7 07 e5 fe 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90
     RSP: 0018:ffffffff95803e50 EFLAGS: 00000216
     RAX: ffff8e2d61534000 RBX: 0000000000000000 RCX: 0000000000000000
     RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000081f8a6c
     RBP: ffffffff9581d280 R08: 0000000000000000 R09: ffff8e2cf7d32301
     R10: ffff8e2be11ae5c8 R11: 0000000000000001 R12: 0000000000000000
     R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000147b0
     FS:  0000000000000000(0000) GS:ffff8e2d61534000(0000) knlGS:0000000000000000
     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
     CR2: 000055e77c3a5128 CR3: 000000010ff78003 CR4: 0000000000770ef0
     PKRU: 55555554
     Call Trace:
      <TASK>
      default_idle+0x9/0x20
      default_idle_call+0x30/0x100
      do_idle+0x20f/0x250
      ? do_idle+0xb/0x250
      cpu_startup_entry+0x29/0x30
      rest_init+0xde/0x100
      start_kernel+0x733/0xb20
      ? copy_bootdata+0x9/0xb0
      x86_64_start_reservations+0x18/0x30
      x86_64_start_kernel+0xba/0x110
      common_startup_64+0x13e/0x141
      </TASK>

Is this in line with what you are seeing?

> 
>>
>> Additionally, do you have RT throttling enabled in your setup? Can long
>> running RT tasks starve fair tasks on your setup?
> 
> RT throttling is enabled (default settings) but was not kicking in - why
> should it in that scenario? The only RT thread, ktimers, ran into the
> held lock and stopped.
> 
> Jan
> 

-- 
Thanks and Regards,
Prateek

