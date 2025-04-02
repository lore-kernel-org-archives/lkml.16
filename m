Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617551A316B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614707; cv=fail; b=H8N91JhJ7/qxg72Omsvl+tqIStZU65bDgCA809hTWTXNQy1HeqUEpKXNMFC4cNIYz80NKKr9Rahc4F49OzP8oLsIJni1Z4rJEJfiVwgilpVXz6SLO19zRDiSVcV9/9IquvgiJlewwUMvp+wiuWwwFPSB1r4whw+eI39cIxX47Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614707; c=relaxed/simple;
	bh=81kECVhePLXz9iCe4bQbT2WWwcBi8dWOxXv510GpVdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p+9xiTA/GaLSMfN2KFlwahXGIyNpHk/2kT8Z/nE1MOryHO2D5gJhrEWo7Q3J0WnLNbw2nKLtAFWCGnFShnjYWdewBp3m+HVgahpn7g+nmoO9yS16oWdp5U1p9oGjoAoBnZLadp6s/olXwUo6lIvVjEXKWwrE6pdKWVcih5WZK3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MxJ0cHG6; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MxJ0cHG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChRscMN5qsO/mYVJ00udkZFo90pBlS/+afpa3N6XadyCq05JBVEnXnu6QpA6xTDmzv0DNDfDcGC7ajVYwkEIgxUsAs7yFTJka9YyoNAN3ne3DTnZm6/XRR47Rn9CmO3HchH0YgI/fneyHKYVPJP9eaUN3KoXEmVFJk8IQ/p8o6vaLgwwKCKm8ZvNUP77x37PSfbdG8tUKLnc5G4nsLjlcYmD1Maqj6cPy3265Oc5X6b/Mhemv2E8XxCFlWDXuFPtuhD86l8YSk2DI0vaPp1FxKanwJ5Jk/uvVSALrzljARMZfOinp8pKBmWRdPmFviZ3afuN6iLkYM1A+6umFj8FOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bna+9qb4R26gEJGjV3pvUS5BOma8uxxgHEKnsvfSBTQ=;
 b=SvySPOd+wTdvCsfY00bmBouZ3jSsvij3E5awwM0D5+XEPGLl5Kb4Kr+9Kh1KH77eSq1C/uDbRRTHBmb8UnQX+JmBhNhjpwAuRcQ4zXzq7sRXDYUeh3AjAJvOXWQbFEkWqQQ9hkLlf0bi6c4k8XkXKHjDtSavI9AHMV/q7SBG3fVm3nAQX9PhSngtyPG/VoGB4UEiC4Gl4ik03p/rZQVUmaiY8vjhs9HsWX1RVtfjQK3LTo/kbVjRPTUEqd9wJt34FxSUPRXTKfCo5Mz7+uObDB7suwACbtblrSXlBVdcNNaZxEtfP35pCgqxT/JAzHlpSvCUMigFyvQe1PHX/s827Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bna+9qb4R26gEJGjV3pvUS5BOma8uxxgHEKnsvfSBTQ=;
 b=MxJ0cHG6ha7r3xOOg5219PWaHhm2kYvXRcQa0CgqsN7Qe9ZsAmGMvzfcCCQecsTBqraLQp+AUEyNNWZwrmN/xSft5La9/3Uf3kf/xd98eaRqJc0aIfVVOZnRxT2XpDKcWNJS9VCnhDLcF/JHAxf4KCbbscKGrStzyUnx1Wi2KuU=
Received: from BN8PR12CA0008.namprd12.prod.outlook.com (2603:10b6:408:60::21)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 17:25:03 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:60:cafe::da) by BN8PR12CA0008.outlook.office365.com
 (2603:10b6:408:60::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 17:25:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.2 via Frontend Transport; Wed, 2 Apr 2025 17:25:01 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 12:24:57 -0500
Message-ID: <5dc150a8-8c96-446e-aa6b-f5c1e46b5b2a@amd.com>
Date: Wed, 2 Apr 2025 22:54:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] sched/fair: Handle unthrottle path for task based
 throttle
To: Aaron Lu <ziqianlu@bytedance.com>
CC: Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<linux-kernel@vger.kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>, Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GcAic5QThYG-r9CaXPgZtXJuB0RuCW5Y0SyBn7VyOQi=g@mail.gmail.com>
 <3fdb7163-d1f0-45c8-89fa-7c904b567696@amd.com>
 <20250314104315.GE1633113@bytedance>
 <dd749cb4-fcf7-4007-a68e-3ca405925e9d@amd.com>
 <20250402092505.GA643711@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250402092505.GA643711@bytedance>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 00caa59a-3df1-419a-04f5-08dd720b4c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUpVTFM1QmRaVVkrNmRDRXU0U09GM0ZDYkpFOXU3NDZMQVQvZ2VvbUlhSXVs?=
 =?utf-8?B?MG5NdXhxdUNzWnhraHdCWFMxeEJ3UnZweUN0WDBYMnpvZEVqWFgzakFhbVFY?=
 =?utf-8?B?RlZGaXBNY2I1MWswNHpSZFVQTW1ZRkcyOWpXWVZPeWNjYkY3V3NJSWtBM3ho?=
 =?utf-8?B?S1hsUGVYQ1ZoQmdwZGN4S3V6N3ZrZUo1VU9FK3lGR3lhZyt3a1BTQkx0M3JF?=
 =?utf-8?B?WHVqWHBMMFlXRU5yZnQzOEp4QjR5cjVhcGtlMjZjM0o2c2VoakVUN1YvWkt1?=
 =?utf-8?B?NDdHSXJETXFKWjZORWpzVnVrK3E2cUhndWw0OWh3WStDdXJibGNaR1JJZXI4?=
 =?utf-8?B?QzBkSWROOWNKRDBhNTQ0TytoT01RaVd6MnkwUjNqaFQ1Sm81VmpIeEtPRkNU?=
 =?utf-8?B?a0QwRy9oYVhRT0UzcEF3Q2pXRE9kTHFwaC82bFJlMktZVW9DM2NWTnZVMzNG?=
 =?utf-8?B?NUVtT01VaXNzZFl1V0hCQjRoeXBmQjlDbWtoZkVQeE11WWxMSTZ1Y2I2dFBD?=
 =?utf-8?B?eHR0K1AwOEJNMkZ4MTV3RWtKdi9qbFhPK2d5bytVbzhVeXZiR2MxVzZrTFp3?=
 =?utf-8?B?MUhmT1p3U2U5LytLaU9VeEQ0UDh0dGFCQWVveklYUXR0SDJVYjQ5SUhKWS9Z?=
 =?utf-8?B?U3pDU2wvZm1nYm1Cc2RtUTl6UWF5bnB5K3I3djNnOWoxUWFJN2NKR1RXVlY0?=
 =?utf-8?B?bG5SUXR1aThRZnZBN0gzekswaEhvWnRlcDVDSG9WbG9POSsyRWwwNTJYVEgz?=
 =?utf-8?B?dXNMc25QeVFKd2x5OGtBTU9TWXVrb2lZbzcvNVRZZXdTZENJM1lYelE3YTZT?=
 =?utf-8?B?czNHenllcnVDeDVUSlN6Z2gyR2RQMlR4NEdkTVJkSXB5dDFZaUp2cllkMkNY?=
 =?utf-8?B?S2Jnb3A3L2JFeFljQ3lDUGNjbWd5K0N6Y0hldFZUQVNOYVczeVdob05vSEVP?=
 =?utf-8?B?MGl5NzZTS0llaHZnUXhkbjZSUDRnNmFXNmNDYTdhTUt5NHg4QlYwRTZ5akgz?=
 =?utf-8?B?UzFIL0lpdHB2d24zQnZ3ZHhDU1ZtTzd4OXpKNzF0dFI5SWFNNnFJMi9yaHN4?=
 =?utf-8?B?Z0QwQ3BjZzVrK0pGcU5GZGRkRmdKb1JiZlQvUHU0ZS9BckZiRndrSk4vRkEr?=
 =?utf-8?B?by9RZE1WSXliOGhheXZxU2hYWWJvdk1qODBidVF4dE04dXI0S09WWmRwNDVL?=
 =?utf-8?B?Q3Zxbm44eFlnQVhRcG80bm5oWXNLb3FrU2N0UUFueEgvNmxwT0owRkR5TXQz?=
 =?utf-8?B?NndtaDV4M1BXV1pFeTRzMmlYSjZ0aG9HLzhRZlc0ZnN1b1BQSE04Z2ZVa2JH?=
 =?utf-8?B?RmNDVjNFUllmbzNrdjMwekMwR3pPRnJTMVdaRytIZjg2L0ZFR2JGOEhkYjFE?=
 =?utf-8?B?djYzTk9GNnU0VHVvNTZibXp5NUVWQVdOVmNPMHZLN3MvWGxQeXdyOUJFSkZs?=
 =?utf-8?B?b0dOblVRa0F2TGVrdDZRdkZYVVVsSm5kUFdHOGVtWk54T2VMaTdrQkFuYU1o?=
 =?utf-8?B?Z1hyT05PTnV6d3hMUUZPMmhpN3VTRmJtbHhIdWRIZFUwVHVtblczQ0ZuZE55?=
 =?utf-8?B?ZjR5SEhudC9ZY3ZLQXgzWDVsYVVZUXg3TTQ1M2p5Y1pZMThLMmVvbkRyZStH?=
 =?utf-8?B?MVg5Q2FIMVJleXNDQ05LVGNqdStrbkVaZWhGdUpSWkFPSDZkQi9tak9aZFMz?=
 =?utf-8?B?bTBSU3FtTzl3dzJwRERqSVNsVThpRk1BeWluZDllRWNSd0NnWldnMWNJV25Z?=
 =?utf-8?B?WVVjVUNkZTZINkxrMVhnZTBFTHVvV2pIQTVUUjNIS0hyY01GaVNib2xqWEU1?=
 =?utf-8?B?UmplQkcySU9idDNUdHZjOGNieURNVkZyVTl5ODVUMllVTnc0UFBmOEFhNGls?=
 =?utf-8?B?a01HZGxoTkczYXFFcHlVRGZSZVAxSWlnbE5Pb2VlTUNDZWdtejc3YW5tWCtr?=
 =?utf-8?B?cVdwdGpmTlhybW1ZUVF3cnpqVXNaSVdqNnB0dHI3ZGtHRkRPbG5UWlAvUkw4?=
 =?utf-8?B?TENBOERVZ3l3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 17:25:01.1675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00caa59a-3df1-419a-04f5-08dd720b4c9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

Hello Aaron,

On 4/2/2025 2:55 PM, Aaron Lu wrote:
> Hi Prateek,
> 
> On Fri, Mar 14, 2025 at 11:22:20PM +0530, K Prateek Nayak wrote:
> ... ...
>> but with per-task model, it is probably the amount of time that
>> "throttled_limbo_list" has a task on it since they are runnable
>> but are in-fact waiting for an unthrottle.
> 
> I tried this way of accounting and realized a problem. Assume a
> hierarchy like this: /sys/fs/cgroup/1/1_1, quota configured at
> /sys/fs/cgroup/1 level. When throttle happend and tasks of 1_1 get
> throttled, the limbo list of /sys/fs/cgroup/1 will always be empty so
> its "throttled_clock_self_time" is always 0...This doesn't match
> throttled_clock_self_time's semantic. "throttled_time" is similar.
> 
> I suppose we can somehow fix this by introducing something like
> h_nr_throttled, but I feel that's an overkill. So I'll probabaly just
> keep the current accounting as is in the next version, feel free to let
> me know if you have other thoughts.

I agree it might an overkill. We can discuss this more on v2.

-- 
Thanks and Regards,
Prateek

> 
> Thanks.
> 
>> If a task enqueues itself on a throttled hierarchy and then blocks
>> again before exiting to the userspace, it should not count in
>> "throttled_clock_self_time" since the task was runnable the whole
>> time despite the hierarchy being frozen.

