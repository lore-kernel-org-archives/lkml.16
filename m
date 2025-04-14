Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807C2750F5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637884; cv=fail; b=OXJpwtuoGXpCtJC4ZApL15ewPuIi18/oup5DYy2x9ZHGwXAhxFWanXlJSbUApLiP7mOM/IwB37LPFordB9q+yMC4xdBHNa1xuzqRzRpSSf6PCb5vrTST4USC1A5xZyORCEwz0HTq19l/iup4uNpeU1jtiS34IeRdaxuiZL/WdM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637884; c=relaxed/simple;
	bh=G1WITmKOqrIHSHoi05tyLc4LRkpgFsOQeXfiRaKOSUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e+bvBIvWWnmXwhNzFLlYYVdlIqQP2Hr6XxukOgQHTntmyDZSsxx5wyZDlODQ40vbXpF/BZnU0ROB/ElXyJhzjrIMUfL79l9e7Zfrd+JIvgE/X7uHWhryzxuN+pSYbKjEZ3pKzdmL2B+kW7KIBCi3kYdUObMdIxXwSigqdBKuZxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tlMnWg2n; arc=fail smtp.client-ip=40.107.244.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tlMnWg2n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHyOxY9XUgPl2sOtcTitPJde/zsoIyWWx1Xbv/UPO7au/Dg37cfcrBsDot18gCzUW2Iqnc3UiZHfqiCQXZSJAQ17a28p7ypOOgNyar+obhnrtW0x18xdXcao0M5ySrvnaGVt1f1Whn6vdgtaUr6mc8uMKaUxcSA1E9Xkg1vRXjBwY3+V5+iMmkQrHXa1L4x+Xf24AEmtpPJt6d3NNQGBTvIxIFBCBg6px7GQlK9Ls6ifNncoHld3pWfUphR8haAto05sbWicSGzyzzoKgDX3A0nsGJhIrFqMkrgRVTDasl2my3+Qj+S+VFRa2B/JA4UtGKImfAX5iEcxhkPLIUZxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYx4nn2zk5iMhP1q3roVwVG2Nx83Q4AZY9lcnY3P2xc=;
 b=SQSyEO+cW1MgBq6U+m7rOoILUDfey6cKQUeQ6jva4jPWbn1zF0BWaoE/Y4b3b7CVDCMDbJ+48rUN08asXux54wQIshlBCBzWqyblhklqNlV8huHs5c8mCcv+pEVU8K2UNc4wftYKNTLRRF9IByAr+PnBo1JxyYRfb6yneYizI+v5rra9ahpIB3WLvZYlav18O5/keW1PfMJwxuB9ywHPxtQB/YKeGtvRaV79oC2LfZ3tL9+pAg95qWPwLJag/iaDq1bzpo8FE9CT805Cg58EnPYV//FDTkhEZSshNILFWl4o5o5/0TQDEmaWwI1vWwuS3fCDmnaKHGdsfUSKwyRe3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYx4nn2zk5iMhP1q3roVwVG2Nx83Q4AZY9lcnY3P2xc=;
 b=tlMnWg2nbCm+z4ADb1h743UtBZcMGu/kJd1MRB+Mrj0VAJwndQ+clBvFcHnDE7D/BCTiNJcoMD9JLr1c3x05KgH2dk6gm/+O+tiVHKFfe6fvYbapbaolMr5dwr8ZA5oGZCn/7Us+Cu0QgdArREnZp1d/pun9b11i4oC7UY0yNhg=
Received: from SA0PR11CA0207.namprd11.prod.outlook.com (2603:10b6:806:1bc::32)
 by DS0PR12MB6461.namprd12.prod.outlook.com (2603:10b6:8:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 13:37:57 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::f) by SA0PR11CA0207.outlook.office365.com
 (2603:10b6:806:1bc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 13:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 13:37:56 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 08:37:52 -0500
Message-ID: <b730d177-db05-44c1-b2c8-19290286f79d@amd.com>
Date: Mon, 14 Apr 2025 19:07:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/7] sched/fair: Add related data structure for
 task based throttle
To: Aaron Lu <ziqianlu@bytedance.com>
CC: Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi
 Wang <xii@google.com>, <linux-kernel@vger.kernel.org>, Juri Lelli
	<juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven
 Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Chengming Zhou
	<chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-2-ziqianlu@bytedance.com>
 <a227dd46-e6ec-4cc3-a0a3-427c4ffc9d07@amd.com>
 <20250414115509.GB3558904@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250414115509.GB3558904@bytedance>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DS0PR12MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 8270a33d-0a9e-45cc-d154-08dd7b5990e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlQyQ2diVXh0eHhOcmRnODRFSnJGOWtuYWs5bHplNXBwdHhMSHhvbXY1Q3ZL?=
 =?utf-8?B?VncxL3g1cThJOG81SzRNaUtlT1ZQZE51NUNMTVVhbjd3aDMyZUVQV0xYUnRG?=
 =?utf-8?B?alBCRVFxcWZGR3JHblpiZVBtTEJsbzZCOW1DQjVvZThnK0dYL1VKV2U5enY3?=
 =?utf-8?B?aE1JODN0a3c3eFFvb3VFVFNrTVdPVmZFdElua0x4UFRDK0d0b1RiQ0lmd0xv?=
 =?utf-8?B?TzZ3elp5NE0wQTRVRjAwYjBXWStUcVNOUEh1YzFmdTduRHpJTFBKd05xanVh?=
 =?utf-8?B?VzJrN2RkVnVzeWpOeDZTM0YwM29Ca3RzSUVxN00xajFiV3JLNXZHUlJFUXly?=
 =?utf-8?B?MUVDMHpFNjQwTG4vTm1vQkpyL2pXZmVQSFR5RUtMWUtzWlFza3NnM3REUkR5?=
 =?utf-8?B?eHAwNGxSM2JRSHJXL3NUbEJpdHVRV3dObjYxc0pkUm0vM2dvWFNmWm5ZRnlp?=
 =?utf-8?B?L1h1L2xSdWRrSzJOMC9PNVN5T2FrVnlGUm9zYnUxRHNzb21QRzJrSEE0amVm?=
 =?utf-8?B?Q1NPSi9lV3RseERhZkpDbVdRREZyMkZtZ3Fkck9pV0IrWWFUYmpxMTg5TFkw?=
 =?utf-8?B?dHFKVFNyMEQ1bkNMd1NXMTl4aGh1M2I2VzFsbjdzNEo5MmZTMzFJVklhYzc3?=
 =?utf-8?B?ZkU0Skd6bTNpOXd3cGJpSVFIY0gvUFM0aWFUdFhpSlFuM2gyejFldlpmWWh5?=
 =?utf-8?B?ZDZXY2wxZVh5TkFKUnJpMEJWY0g0ajEzRWVVd09aenc4bDlPS05QTkdUcnI5?=
 =?utf-8?B?WW9URHBGc0xLVlVxbDNpajY0a1ZCbkQxUVVhRTkzR25GUmRhNnZQUzZyc2Q4?=
 =?utf-8?B?K2pLckRLaGxsQ2ROTjh6em03bjAvR1kwUWVENWhpYXBlK2ZTU3pLUkd6VmVj?=
 =?utf-8?B?TDcxSTF0R1ZNUXBGODY2ME9IZXlycUlKVHcwbE11MWptZmFvMmFDL3hHa0xH?=
 =?utf-8?B?dGgxVjZhVEMydDJCb3c1amJyZ1Zic3RCRlV3OEZ3VmhiYitCRHhhZENOY1VR?=
 =?utf-8?B?VW9ULzQ4YnlKaW9MakNvS0lVeUtOVFFnRVlxRlk2YUs2TWhCay9RbFZxVDND?=
 =?utf-8?B?Yk9FY2J6WTl3dUF6ZEU5NE5NU3c4RnF0M05UNmFrV2dIRkdVSEsyL2txTElo?=
 =?utf-8?B?Y1dIbjlGZXdlbllCdlRLSG1LdUprWlQ0aVR5RVlPMGd4YmxQcGo1OURQaENQ?=
 =?utf-8?B?QmhVbE9GUFkyYW5ObDgzNkQwUDI3ZnYydDRIdDdIcTdzVHJ6VkpRY3NxWlIx?=
 =?utf-8?B?L21OUDdxLzhJYzhoQWpsR2kwM1UzcDhZTitrY2hadWoyRU4vK0l0aldJRi9F?=
 =?utf-8?B?dkpjTUVHemVvTDNGcVM2emQvajIzUUhqVXhLOXUxdmliZjVRMHRqeU5Gdmpl?=
 =?utf-8?B?cThIdmhRSW5GRFg1WUhDeDRlNkd6Mk1Udjk2Zi85SWp3T01VYVBDc0xROEp4?=
 =?utf-8?B?STNFZVFoRWtjYVNINXF4QXBOTjhTUm9Qa3Q5eW1kVUFFdStDaXZUbk9tTXFt?=
 =?utf-8?B?RU96V1NQdGJ5UW4vYnE3RElzdG5MZVdaaGxwRmNiMGVwOFh1eHJpTmpWTFNx?=
 =?utf-8?B?dVFxemdZL05sQjBPa3lVN2Q0aUEwV2s5RzhuaEp2QjFUSWR3T1lST0FlQnpY?=
 =?utf-8?B?MzUvWGRxbzhNVzd1NDcxQUpBemZMTEt5bVd0amNRdWFmV2N6Z2R0MTVyRFBI?=
 =?utf-8?B?UlY3WHI3elVmZXAxT2xkbk9sWGl2MWlOVGozWDJkRjJqTHp3QUo5VXJTKy9p?=
 =?utf-8?B?Y0lobXUrMEVIUm82YUJXRzlIeTRybVZ1bVlvbmI3bHdpYTZ0N0VBMVdyNms1?=
 =?utf-8?B?UGNYRkpvNXc5dGtFSlpzdnBCa3pJNVczeExpeXh0TUFnVXpUbTNjVDk5MDlN?=
 =?utf-8?B?b3FMdy9wTTdJQ0xzcHRsOGZEWU1TNi9kc2tzOVBGOWZGTFlubksvZ0tXcWRN?=
 =?utf-8?B?R3MvZFhQTHA1clUrQWExWDlXc05Xc2x6dThLNzJWWDZFdWJQb0VKVFdlVzVI?=
 =?utf-8?B?OVBzL3QzR3RuUXZidVNocFlwWWx1eTVsUUpCRFBkRmF2czF4Y3BCS2pLQXJT?=
 =?utf-8?Q?dGvX0H?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:37:56.9074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8270a33d-0a9e-45cc-d154-08dd7b5990e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461

Hello Aaron,

On 4/14/2025 5:25 PM, Aaron Lu wrote:
> On Mon, Apr 14, 2025 at 09:28:36AM +0530, K Prateek Nayak wrote:
>> Hello Aaron,
>>
>> On 4/9/2025 5:37 PM, Aaron Lu wrote:
>>> From: Valentin Schneider <vschneid@redhat.com>
>>>
>>> Add related data structures for this new throttle functionality.
>>>
>>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>>> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
>>> ---
>>>    include/linux/sched.h |  4 ++++
>>>    kernel/sched/core.c   |  3 +++
>>>    kernel/sched/fair.c   | 12 ++++++++++++
>>>    kernel/sched/sched.h  |  2 ++
>>>    4 files changed, 21 insertions(+)
>>>
>>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>>> index f96ac19828934..0b55c79fee209 100644
>>> --- a/include/linux/sched.h
>>> +++ b/include/linux/sched.h
>>> @@ -880,6 +880,10 @@ struct task_struct {
>>>    #ifdef CONFIG_CGROUP_SCHED
>>>    	struct task_group		*sched_task_group;
>>> +#ifdef CONFIG_CFS_BANDWIDTH
>>> +	struct callback_head		sched_throttle_work;
>>> +	struct list_head		throttle_node;
>>
>> Since throttled tasks are fully dequeued before placing on the
>> "throttled_limbo_list", is it possible to reuse "p->se.group_node"?
> 
> I think it might be possible.
> 
>> Currently, it is used to track the task on "rq->cfs_tasks" and during
>> load-balancing when moving a bunch of tasks between CPUs but since a
>> fully throttled task is not tracked by either, it should be safe to
>> reuse this bit (CONFIG_DEBUG_LIST will scream if I'm wrong) and save
>> up on some space in the  task_struct.
>>
>> Thoughts?
> 
> Is it that adding throttle_node would cause task_struct to just cross a
> cacheline boundary? :-)
> 
> Or it's mainly a concern that system could have many tasks and any saving
> in task_struct is worth to try?

Mostly this :)

> 
> I can see reusing another field would cause task_is_throttled() more
> obscure to digest and implement, but I think it is doable.

I completely overlooked task_is_throttled() use-case. I think the
current implementation is much cleaner in that aspect; no need to
overload "p->se.group_node" and over-complicate this.

If we really want some space saving , declaring a "unsigned char
sched_throttled" in the hole next to "sched_delayed" would be cleaner
but I'd wait on Valentin and Peter's comments before going down that
path.

> 
> Thanks,
> Aaron

-- 
Thanks and Regards,
Prateek

