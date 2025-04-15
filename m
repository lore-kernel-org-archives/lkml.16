Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE2218589
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744697120; cv=fail; b=mA2B3MbHFmeduIpLQ7S87sQFcumLQvU8V4gRpZpWJfU0ryZK3jSEbevf5t8YjTBMJjI1j6mfbcS4Gk/gsYSysw/J57wdtfSCsiTIxMBlVI/d41vIk1lRtpW5hsRLs0lFdWWSKG8g6/9aZiNGE9LTJ8FhfGw0rFlo+ZyAHO2pw6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744697120; c=relaxed/simple;
	bh=b5dDM9E4FxGBTfuhrxkvSZ5m4GyQqC5NzMNylEbD2WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kPmdm3FNei5USBwzMje5px1c0M79SEeVSGgakpWpzBuahjgOXde0JURrLDVn56pVMhR0KAJZQlhaSIb59/RPi/31SZplTOfxYzdINKyPJZxEZ8c006MjwYMtSnqAv3mjUdHCcpo68j0/NhutAzX7PZ4j5Gdi7nOccmcRFgjyFX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KH5Sk1A1; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KH5Sk1A1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMN5iK32j+wNQ3u3/LpCVegNtK6BAgO06Jnegmr3KZah3WwVgKIemHLqJWNe08//MDAOYmKP83QyE/WJgSVahPydSy2h17KmxeEqXLMs5sTUEF5plrU4fHY5R1VPoNww7i6VCxeEZq4qINQ7U/AGUECDHbfAXqd3BjFfDsG3wcBjqNR51pyhbtsFrCRhavp/84R+woBA+G6xH0HGujEny/kL5t+bD7KNDgQJMb4Is82qvhwqjL81FGm8nERfcxMcMY7oYhhsq9cb48WBBmXBETn3yNdQiGXa1xEGDfWB6NbfLS8EqZShOHKzxHfoI/cS8AHiFw37cgFebmZwDnmxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQxxBkg0bv5FC9HcCe6q821mST4uxZgnPKD48GlT/Qw=;
 b=jq9HUfcGcaJOvGNh8JdzRu/NuMWwDWdTFW98ThCP6L5YTA2bpIWHGZ113fatTO6qYIVvR6pA0WIxLJFa8Im02LhYbdcv42LmoSqz159I14Muzi6lc7rJ1IETFZgLBBS2JpcKkHZt14q9Rc+5LCXzMmZFcQ+qNKcZ2if0AtQzE1bvbjOja0JclbMBU+ZrCKz1yc98MKliczi3gICd/MQps++2amhWCBKXkV4o8factEileYcrciz4d5+85EtkdaVAjTLwGDZIyt4xtU5/va/bHvOCg7y0GyVVvenfL5URP0wWKHCiDDndmcksq54IkfBI/dvOtWiryJbOe69ujHwSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=siemens.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQxxBkg0bv5FC9HcCe6q821mST4uxZgnPKD48GlT/Qw=;
 b=KH5Sk1A1cy9m7yimhU1AQZBv8Ji/i2369GXdfP+++jy8jQe2V3qCF/1p7vPAJXjqYz4K2dOkFyhOaZfxylMHQBOdpwqVPJBnZHKoLgVqrPAaUixF7LbPTUd6t1oRaZve+iFCIKrwQbC7mq36yqF/hOm43WxLsftMTltKVLBSPJE=
Received: from CH0PR04CA0093.namprd04.prod.outlook.com (2603:10b6:610:75::8)
 by CY1PR12MB9625.namprd12.prod.outlook.com (2603:10b6:930:106::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 06:05:15 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::52) by CH0PR04CA0093.outlook.office365.com
 (2603:10b6:610:75::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Tue,
 15 Apr 2025 06:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 06:05:15 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 01:05:09 -0500
Message-ID: <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
Date: Tue, 15 Apr 2025 11:35:06 +0530
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
	<chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
 <20250414120407.GC3558904@bytedance>
 <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|CY1PR12MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ebfa84-84d0-4173-65e0-08dd7be37da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amFzeTFRQVZPMGNUN3RDSVp6NERqUU9ZOWRyOW13NEx6TjU5bGU2bUU2aHRF?=
 =?utf-8?B?NU5Pb1YyandnQ3pJYUhPRkZaR1Y2MkFWMHhqamk3SmVmNGNaNDcxY0Z1Rjg2?=
 =?utf-8?B?eUlvV0FOR2lWaHQ1SFBkd0FGSHFwVmdlUWg2UDVFa21ZWmtYNTJFNVZneHBR?=
 =?utf-8?B?RUhpdGFmVUZzWHdOVTg3TmZxWE9lTjF2MFpLcUYwcjhSNHFqQkI1MFBrcG9j?=
 =?utf-8?B?TmdqV1FOQWRvakovVmlNK3U5d3hzb2kwZzBNU25RbDBTNHJzUDVyL1paVlZt?=
 =?utf-8?B?UURYWk5XUzg0UHFEcm5qNmpGb0FPM2FaVE95NnVvNU1YQXRVeHBqUEwwL2RR?=
 =?utf-8?B?M0Qydjc4TUo2VnUxUGc5WUhKb2hLblJKZG1uZVluRjdWcUQ3ZW90enhFVnM2?=
 =?utf-8?B?bkJtRy9ybUJvMmIyOHgzWSt3ZUJTdE1KQkRCSE9GZmw3VElLZGlUL1ljbGhx?=
 =?utf-8?B?dnV2cmZCckVUSk9PNHZKZFpRWVVuYkFEbk1SMGdmL2RjQmh2MlRJRkFPczFi?=
 =?utf-8?B?aldmK2hEZkNNSlp3ZHJSTjhpUmZuTms5RGh2c1o3d1Z1RDVDN1lnbWhMd1ZR?=
 =?utf-8?B?NGg3UnV1aDBib055Mmt2NGY4a2p2bVkrRnZoRnEvK1VtdlR4ODlSQXNwZktB?=
 =?utf-8?B?NEo3Y0Ewd01BaEl0TVRsblZWU3BsMWtwSWRvRVd1b1JmSUV5YTlFSHpZYkow?=
 =?utf-8?B?a05HZzc0NDhwa2FDdVYrRnVUd0tTTHV4MnphaWRYUDA5U3M5dFIwdTlEZDlJ?=
 =?utf-8?B?U3RuZTc1M1MrVW5nMTU4QkVKNytWT0c0UUpIV0kvUC9FQ041WkJKZzZ2N052?=
 =?utf-8?B?ZldSSHExdmo5Z3h2bkV4L2R5WHNlU0RSL1hHd1ZEcHRyUzFKc29TMWk0YU5U?=
 =?utf-8?B?Z0JZeXV4MlA1YUttc1FqLzA5TXJRUXhJc3VTdXM4TVRaZDNVYjRYYkRUY0RG?=
 =?utf-8?B?U2xqd1pzdnVvVVNRNzJLK0RxS3RWKzhQbExZZHc4bkY3K1I1MDJjZFNuT2p1?=
 =?utf-8?B?SExHcTlyT09kemhQS2xsRTJGSWFyREpoTEFiUDlZczd1dVVWcUhQVG15WThG?=
 =?utf-8?B?QzQ5UmJpTlpKVzZRZ0FmUk4ralJLNWZWbWpjUnova05Yck82c3Q2RFowOXl4?=
 =?utf-8?B?ODZvSWF6VUlXenA3YzIyTXFPa3NoQVdiWlJUNUJ4R0xnZnF4ZEF1L0pFK0dQ?=
 =?utf-8?B?QVYwS2NwMXgrMm5pZFZGNkUzVXd0NkY5Qm1RT1M1emZ1Q0ZRei8wOU5qeTZM?=
 =?utf-8?B?WFJPTFJzVmZtRVN6akliM21JTmRrWUpMcWk3ZzkxMC9sejlndU11RnJRMmZQ?=
 =?utf-8?B?bE1raHdUWjkwMTlYNTBOMEoxMlc4VjU4Q3BKNDVoa3JuTERadFUrdE45V3JL?=
 =?utf-8?B?dzZVamM1ZGVVQk9lRXBJdEdmSjBZUnY4UHJFb0prVm9rK0hHSjY4VDR0R3FM?=
 =?utf-8?B?Tlo3SkNDU1p3U0hqM3dOZ3RSeTVsTnpQSnlnc1gwdmVrZnlGZGdyVWpNdFJm?=
 =?utf-8?B?SU51SWdzKzQ5QXFlSktpRDZLcnpSaGJDWXdrN25aaElJdk1laEFCYTF0bHRw?=
 =?utf-8?B?YlZTUXNDaHMyOFVSSE9xaDl6Z2ROcEl2YkliUzhPZnA5SU9pZWFVaFdxQUpi?=
 =?utf-8?B?ektMN0c4dW5tdmpGUHI5Uk9nMFhleW9rMitmQzVsbW03ek9naVRsSWJlQ1Jv?=
 =?utf-8?B?QkJrdWh0bVZKSEZiMVRSR2xmanYrWEIvWjVURDNGMDBrK3FSMjhkZTZ0Ykla?=
 =?utf-8?B?enhMaStSZERabXZ2NHZQT1laM1d3V0ZPQjM4Rjc2ZUtBSjlkNW9sL3FsUW9n?=
 =?utf-8?B?ZnZ3dm1XaHFqM0cvd2RhN0xEZTlEYUNBdmUxVkN6U21JTHFTVkNzZzE4SHFs?=
 =?utf-8?B?ZTh3RHFpZW1KeTVlaGpneDBkVGZNZVRiRFNRWlJMS3hSelU0eHV3blpGdWpH?=
 =?utf-8?B?UnYwMnBWSDJOdnA5MDVCWXVUUS9sZ0h4bTZ4bUM4TzV0ODJ5K2VaUGVWcVNB?=
 =?utf-8?B?Q3JoZlpwOUdoT2hxRURsN3RFTTV4aEZScmQvR0h0ZTAzWk1DU2J3RElYUm14?=
 =?utf-8?Q?6oPtLU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:05:15.1153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ebfa84-84d0-4173-65e0-08dd7be37da0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9625

Hello Jan,

On 4/15/2025 10:59 AM, Jan Kiszka wrote:
> On 14.04.25 14:04, Aaron Lu wrote:
>> Hi Florian,
>>
>> On Mon, Apr 14, 2025 at 10:54:48AM +0200, Florian Bezdeka wrote:
>>> Hi Aaron, Hi Valentin,
>>>
>>> On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
>>>> This is a continuous work based on Valentin Schneider's posting here:
>>>> Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
>>>> https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/
>>>>
>>>> Valentin has described the problem very well in the above link. We also
>>>> have task hung problem from time to time in our environment due to cfs quota.
>>>> It is mostly visible with rwsem: when a reader is throttled, writer comes in
>>>> and has to wait, the writer also makes all subsequent readers wait,
>>>> causing problems of priority inversion or even whole system hung.
>>>
>>> for testing purposes I backported this series to 6.14. We're currently
>>> hunting for a sporadic bug with PREEMPT_RT enabled. We see RCU stalls
>>> and complete system freezes after a couple of days with some container
>>> workload deployed. See [1].
>>
>> I tried to make a setup last week to reproduce the RT/cfs throttle
>> deadlock issue Valentin described but haven't succeeded yet...
>>
> 
> Attached the bits with which we succeeded, sometimes. Setup: Debian 12,
> RT kernel, 2-4 cores VM, 1-5 instances of the test, 2 min - 2 h
> patience. As we have to succeed with at least 3 race conditions in a
> row, that is still not bad... But maybe someone has an idea how to
> increase probabilities further.

Looking at run.sh, there are only fair tasks with one of them being run
with cfs bandwidth constraints. Are you saying something goes wrong on
PREEMPT_RT as a result of using bandwidth control on fair tasks?

What exactly is the symptom you are observing? Does one of the assert()
trip during the run? Do you see a stall logged on dmesg? Can you provide
more information on what to expect in this 2min - 2hr window?

Additionally, do you have RT throttling enabled in your setup? Can long
running RT tasks starve fair tasks on your setup?

> 
> Jan
> 

-- 
Thanks and Regards,
Prateek

