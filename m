Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0815C2820AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648461; cv=fail; b=f+ckRmvfutzscvMLh6I1AKUlKrhK/0ngNiuA0xHB6orABCqQzRl2X0VNA8lUIeg2gce+I2/hJ9wi5mALFrp0m+XWQBj1+bycQXWBj54YvnZpCkvj7HzF76pbf71R1QyU3ObveSFXFr46glCxBHKAZXCjyaEqbZMR4mMTGPIQEO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648461; c=relaxed/simple;
	bh=HsfuFZ0S0mx1SdeNf8muuOWmaJwIH2jTJhG+pNIocRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jI2Vd2l85VrLhZAsVvEswY7z86jqCUoVpQs5d0CAOFFj25kN5Bj9iAQ/AtK9ee8URzgfZfuF3pY/YIJ6TFYwCJNJp58OztGtw450Sdfbbhc6u0NqPkt6AQ095qqs8H36Ml0NJcGQl1j9/goe4IIN3bV3+AkeFsK9R8UoAkdaGXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Hx+5IjJt; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hx+5IjJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppKRIU7ygnMKJDMUOlahqTn5gRpIUDGY1751DVp7OwdHf2eY6Nobp1RBgN+KS9ZWmzyaYBV0/eLIHRFbJDpyzDQA5YLK84G6FLA5UKazQWBu8FmC33NIlPNJGY8OiqsF/fVC5TYfdVEmfEXiOSkygJnjFCQM908DWnjSlFjV9/FN4A2lMcKrektvnKwcMR++OziCjsB8WCNhXefuxNCxzFc5em2KO91Sgjo9oIPbTrLf2NnS1WmOGipFdnHPxbNVHp4tYnvQI0+fvq6MCj4xJUHqX7yvVWN7QOgegtp+KeHqV5O9DlNM+J3GHM5XpusgCiT/Cok4t0G/L62T8hlbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8F/VwwmgMwmYCSuOEU7DHRCnmGl0Qksav4FvBT5IdM=;
 b=moNo/VHpQz7QXWTvmJtObwEnRNxDxPlckhhy4kpXL5nLJLdZC6BNyjikPxsobcflrNXrJGk9IbvCy0lxsdYlWFyS117UzYc/BdPz/gtfuttMU7gZyRFuDGd6KwmWV5J/7PssCZxN2oTF8ml5GS4Ua0mOoFdrvkay7g7GVdEL1QZUGB+o7Achg6OwbeVur3fD+z4LKRMskqASY1lDc3LI11m51sryJQ8RB5NK4S5CmaJThtWxrk5qYk2jnonGceipJzwLle2P8rqazFaes9aRNKXaYJIO+PtyvROR4oI2KnVk6tdqMYbkxh52a+B8gjyP7dDvht7kCZIoAc6lr7fCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8F/VwwmgMwmYCSuOEU7DHRCnmGl0Qksav4FvBT5IdM=;
 b=Hx+5IjJtNXy06D64B8IIGWZHN6n1Ghhgbo+Vzsypjv+aysRw3aPGno3+qMHvIBAHvgK6DcwmC/rXHoJqEn8axnYx6/6mToGt5u1mAYEEnkII1f9zoCV6VMGcfZACzqX9pSDaGE1vJzMScLAKi8p8KrEmlpK71WaJhDJ/ieDc7Pc=
Received: from BLAPR03CA0034.namprd03.prod.outlook.com (2603:10b6:208:32d::9)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.28; Mon, 14 Apr 2025 16:34:10 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::58) by BLAPR03CA0034.outlook.office365.com
 (2603:10b6:208:32d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 16:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 16:34:09 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:34:04 -0500
Message-ID: <ded06050-83c1-49f3-8eb2-bb086930e226@amd.com>
Date: Mon, 14 Apr 2025 22:04:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
To: Aaron Lu <ziqianlu@bytedance.com>, Valentin Schneider
	<vschneid@redhat.com>, Ben Segall <bsegall@google.com>, Peter Zijlstra
	<peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo Molnar
	<mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi Wang
	<xii@google.com>
CC: <linux-kernel@vger.kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Chengming Zhou
	<chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250409120746.635476-1-ziqianlu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: c94e00dc-2a93-408c-9099-08dd7b722edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGw4VURPOG5QcXJEeVZyZGZkbFEzYzUwZEt6TGVvdDVJTDZpNHJtVWJtSExx?=
 =?utf-8?B?Ylk2c1BrTkJoUit2MG1lL0V0NkNWMnJZUThydEs0WnhFOXA3VXNoMTN6OWFK?=
 =?utf-8?B?Ym9LT1VzWmNRVis3WkNha2J6WHpPUnhzdTB0TGdWSVA5LzU0eDExSnViZENj?=
 =?utf-8?B?dFByUHJ1Z1I5NHZWQUR0R3hHeHVaTzNDZ2M0ckVkTFZoZW5KVHpBMWhrV0dH?=
 =?utf-8?B?cmpsSjFCWjFUemxVTlpLNm9VRWdvdzd6aDFkLzZPeXRrc3dxcmYvWTRZdlFT?=
 =?utf-8?B?bVN5VlEzdVZnUFZvdUFRd1JHenl5OGM0NHFoSUQ4NjJzSUx2VG1yZVo1YTQv?=
 =?utf-8?B?cHdkQmE5Q1BrWDd1VlJxR0lkM2JtOHRqdU9zSFM4eGxOVlVqQlFacGswU1V3?=
 =?utf-8?B?MFhuNk5yZGltei9iOXA1K2cvaldFazZ4MVZuTnk3NmpYUy9paXJJbThUdWMy?=
 =?utf-8?B?WS9uWDRDckhoMmlEYmU0RHJFVUlrQVNWeEIvUyt0cmtGcUJaMmlqUGFqcHZV?=
 =?utf-8?B?QldJYzJlNkptckp2cWNBV3psL3RJZ0dOdlZxb3hGRGVkYUhYcW9SOEVLeEYy?=
 =?utf-8?B?VE9PbFlzb1U1UUd5VFdYUVc0U1FlMzVwemtWa0RJVmxVNTVQcHFpSGVOKzgz?=
 =?utf-8?B?T0V0QWdRc0hrZjloblprQ09PS3pPbTFwVVRVTEhFNlNucXpiSWJ2RjNiYXRt?=
 =?utf-8?B?a3V3SjM1cEdSK2RRQ2wvN1NmVGFBMmVEaWZXNEZidVVDWlNtVTg0TUNPWWho?=
 =?utf-8?B?WnNoZnYwRGlzbjFqWHVvallNMEZTWnF3MDE1OTJnanR4Z2llUS9PNjViV3Ar?=
 =?utf-8?B?ZmxHTjZCUkV6bUl0b2xLejFzaDRIV3doRnk5SVQxZW9Ub0Z2cmkxVmpLdmJR?=
 =?utf-8?B?dFkvYVNzcktXRi8xZ3RmSG0vSGFjTCt1eWx1TUhuamZJQVJhVVFqblAzTzRi?=
 =?utf-8?B?clN6TXNMM0drcE44L2d1alFNbldkQ08wQzFBWmNSWXArVTZjOFZZUGJFbzh4?=
 =?utf-8?B?N0pMTDQ1Y29zdUNWYWFnVXVScktiMzFIZUxPQVR2RlcvTWVRd2RKT2o5TFZC?=
 =?utf-8?B?RXZuek82MWJXa3BVL0F1WGFHWjNCTmRrcDRrUDFpM3FRN2x4TCtzaFZYRkl0?=
 =?utf-8?B?NHZYQkFuamhxZWVKZ3YvaGUvVFJaUnBiUWpmZXMwNHlhZVIrSkxNZ1VlSnBJ?=
 =?utf-8?B?Skp3NzBaSGhDdStEVHdCRU0yQzFPcUM3REhlYnlFdDIxd08rVS95K1B2N1hN?=
 =?utf-8?B?VDlXTFFaeXArT3NzQ1VsdStRTXBETlpLcVQyVGlRT1lZZkhta21LZ1V3T0tY?=
 =?utf-8?B?a2FLVzVUN0NzQW8zeHpRcUt2M1h3c2RWYUhTeXVuQ0VyU1NqMThRMnQ1T2cr?=
 =?utf-8?B?SXZKc3BNMWFQZVZqbEllODdVV01kU05TOURiK0Y1SXdqcFZyTlIzVEhkaTYy?=
 =?utf-8?B?NXpIc2NKVEk0bkdaVHdOZVdtaTliQTJKV0sxUUtSV2hTUlJSMUs1MFR0MnFU?=
 =?utf-8?B?cTNQL1JqOTgxcGtFUVlFU3FJdGpnUkFObmtjYVhJVUJna0tqa0VZTXdFMmpD?=
 =?utf-8?B?TWxxNFNHSk5sbGFpeWtqTUs4Nys3dFNFcmxNUEI0QjNyMm1PQmtwWjlQREw0?=
 =?utf-8?B?NlBpeWJCb1FvTWptV1R4QzIvY3FONGkrV25wQXV5ZjBPZ1FOa3ViSXp2QmtS?=
 =?utf-8?B?S1BLNkdUTkRPQitTaTdzaU9YVjFuV01yVGFyV1RkQ1JCMy9sclVERE01Nm5B?=
 =?utf-8?B?M2J5bENYaEF1bzFtQU9IUnpjYi9ZQ1kwWlZ4VHRRSk81aEdZeDI0ZXYrZEhM?=
 =?utf-8?B?eEpxR2lqZ0xYRHBsTXFFMEVOd2FiY1pHR1JNUndoYmxQcFBGeFkxRFpydldR?=
 =?utf-8?B?SytFUWg5b0svRDBJbU1nMUhzQTRTMHVsSjNoQ2dob0pEUlROazh3ZGxjaEd5?=
 =?utf-8?B?bm1HNUF3MHF5WHM1VG1XNU56ODUrNTRDd2p1MktnVDZPTjJCRmpHdzhsN0Er?=
 =?utf-8?B?NVgxT2x6SHFGYVVEc0Fyb3dHNXBFRE9LNEp2RXpzbmdRVHJLUHZsQ2FDV2Fo?=
 =?utf-8?B?MDNOeTJSUThkcURDbG1aUmRKU3hocG9mV2xrQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:34:09.8901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c94e00dc-2a93-408c-9099-08dd7b722edf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285

Hello Aaron,

On 4/9/2025 5:37 PM, Aaron Lu wrote:
> This is a continuous work based on Valentin Schneider's posting here:
> Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
> https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/
> 
> Valentin has described the problem very well in the above link. We also
> have task hung problem from time to time in our environment due to cfs quota.
> It is mostly visible with rwsem: when a reader is throttled, writer comes in
> and has to wait, the writer also makes all subsequent readers wait,
> causing problems of priority inversion or even whole system hung.
> 
> To improve this situation, change the throttle model to task based, i.e.
> when a cfs_rq is throttled, mark its throttled status but do not
> remove it from cpu's rq. Instead, for tasks that belong to this cfs_rq,
> when they get picked, add a task work to them so that when they return
> to user, they can be dequeued. In this way, tasks throttled will not
> hold any kernel resources. When cfs_rq gets unthrottled, enqueue back
> those throttled tasks.

I tried to reproduce the scenario that Valentin describes in the
parallel thread [1] and I haven't run into a stall yet with this
series applied on top of v6.15-rc1 [2].

So for Patch 1-6, feel free to add:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

I'm slowly crawling through the series and haven't gotten to the Patch 7
yet but so far I haven't seen anything unexpected in my initial testing
and it seems to solve possible circular dependency on PREEMPT_RT with
bandwidth replenishment (Sebastian has some doubts if my reproducer is
correct but that discussion is for the other thread)

Thank you for working on this and a big thanks to Valentin for the solid
groundwork.

[1] https://lore.kernel.org/linux-rt-users/f2e2c74c-b15d-4185-a6ea-4a19eee02417@amd.com/
[2] https://lore.kernel.org/linux-rt-users/534df953-3cfb-4b3d-8953-5ed9ef24eabc@amd.com/

> 
> There are consequences because of this new throttle model, e.g. for a
> cfs_rq that has 3 tasks attached, when 2 tasks are throttled on their
> return2user path, one task still running in kernel mode, this cfs_rq is
> in a partial throttled state:
> - Should its pelt clock be frozen?
> - Should this state be accounted into throttled_time?
> 
> For pelt clock, I chose to keep the current behavior to freeze it on
> cfs_rq's throttle time. The assumption is that tasks running in kernel
> mode should not last too long, freezing the cfs_rq's pelt clock can keep
> its load and its corresponding sched_entity's weight. Hopefully, this can
> result in a stable situation for the remaining running tasks to quickly
> finish their jobs in kernel mode.
> 
> For throttle time accounting, I can see several possibilities:
> - Similar to current behavior: starts accounting when cfs_rq gets
>    throttled(if cfs_rq->nr_queued > 0) and stops accounting when cfs_rq
>    gets unthrottled. This has one drawback, e.g. if this cfs_rq has one
>    task when it gets throttled and eventually, that task doesn't return
>    to user but blocks, then this cfs_rq has no tasks on throttled list
>    but time is accounted as throttled; Patch2 and patch3 implements this
>    accounting(simple, fewer code change).
> - Starts accounting when the throttled cfs_rq has at least one task on
>    its throttled list; stops accounting when it's unthrottled. This kind
>    of over accounts throttled time because partial throttle state is
>    accounted.
> - Starts accounting when the throttled cfs_rq has no tasks left and its
>    throttled list is not empty; stops accounting when this cfs_rq is
>    unthrottled; This kind of under accounts throttled time because partial
>    throttle state is not accounted. Patch7 implements this accounting.
> I do not have a strong feeling which accounting is the best, it's open
> for discussion.
> 
> There is also the concern of increased duration of (un)throttle operations
> in v1. I've done some tests and with a 2000 cgroups/20K runnable tasks
> setup on a 2sockets/384cpus AMD server, the longest duration of
> distribute_cfs_runtime() is in the 2ms-4ms range. For details, please see:
> https://lore.kernel.org/lkml/20250324085822.GA732629@bytedance/
> For throttle path, with Chengming's suggestion to move "task work setup"
> from throttle time to pick time, it's not an issue anymore.
> 

[..snip..]

-- 
Thanks and Regards,
Prateek

