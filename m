Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725413AC1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298872; cv=fail; b=QXl/OphWOQWHMLcwEgWeNWYbyAkhPDRFlZMFTuF+zfBsb9xwv0qBlBRJJ6ra4HQ0+OnDnzI9hhX5slYLUaGInUUv4E4tkA9BWrQj8EtlJ8thUl52LvTehiPJgj+IS0wCqTW/V/Sd3Wsi5oIUkl6Z395GqYdQNxwOBP8ubvobcVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298872; c=relaxed/simple;
	bh=7uHFpL0X3tPw4FMTmuQJLbnmsaD6+p9EAMgRFS9TGGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iBod+DjEHf+VHxb97tb8wlVT0S3Hjo2iXLl2nQPhO5Bh2BdRcdKtW065hdoy4KKpIU2MaYVhTkEUW2tyMKhgj5T1RL/L1btVnibqv29ruVlM0x1KA5iufAezsZ86XqVs+F4U/5C8Q5ZxlKT3jVNaJZiMyq0ULwPTPQC3ht0i1sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ti9gQa0T; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ti9gQa0T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU2FAfLj4YNQTn8x6Bjrb6f97CgPgWx/lw7z6wgz5rBSytSIiQJf3E1B0F+gfkmIWieAap+IEI07KOoAgg+CvFh/pvmJzaCjwWxdAVrPAmMjxn+DoMDHsot81Dt3MwWUGfUkq6sAVmjdoi5PUwYswMaa/DnDdBW7thd8I4Bhpc7XxL4z9qG7X5AuL0jXIHu6GnokdOfUNktY9S8IAuRTEbihx+A7X0C27B5NQUhb5JrteJUMM7WZ+ddzKA81OZFzK/EqzYfnZs4Q6Cq2sm8+cwFMTvF1QFbRrtXF++y3M9jOyFYzegF8h1p4rQtzA6wJ8lmUMKibbcpOo9SRBF2faA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZVif2yHg87t1lJi41ZQd13ClcoagWaRbOKQSIiSU+Y=;
 b=Gb1K86Ox0LxfwZcjtAMRGK5/6TyiZLg8Rwdy+5Jqauv9VLPqW0EOYOY4JFA+7UbevaF/q+mRpjqhF5vTlE2tEMxSuhaf3QU/45GIuC4P6lSeJufmiI9o9fPC/dSFiIQ+MrNxMIns/UX/gzUgCtDqFplZCPMIWM5y1SANM7KWpoWkTXgX4xKUEmsW6leRhhVzyovFOpxzV+vn/Z7u+7S4YMZ7TJc385+0DH3NL6GCNoLMGmeZow6d8KIQ45c9Y/dGamfx7JpfvR65ETS2UqB/JZdpQd6fbCR1f3kdAHdzvUX/Fr8vZBKMRjiOXhBXwYmTKPmQ8Kc3ib/tl5QBeBWuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZVif2yHg87t1lJi41ZQd13ClcoagWaRbOKQSIiSU+Y=;
 b=Ti9gQa0TmLNoBxpVUEkoXGaiLmTAcUlFd5k+3tEnQ7K5nMp7w3xkwDZB5rIZDnYdKZGOQ+8YjvLbCcOXlReJfyGQAbkagXYzXsPvjoW8QzJWn3WtWX3En7MWMgutS7jMH1feRe6MLRYHO8Cn+L7OZh/NPRc/25ss7zXLxrsy6dg=
Received: from DS0PR17CA0001.namprd17.prod.outlook.com (2603:10b6:8:191::19)
 by DS7PR12MB8275.namprd12.prod.outlook.com (2603:10b6:8:ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 15:27:43 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::a2) by DS0PR17CA0001.outlook.office365.com
 (2603:10b6:8:191::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 15:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 15:27:43 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 10:27:39 -0500
Message-ID: <c72802d4-7155-4c51-9d55-0372e8c4b6cb@amd.com>
Date: Thu, 10 Apr 2025 20:57:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] sched/fair: Rework inter-NUMA newidle balancing
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-5-kprateek.nayak@amd.com>
 <20250410101402.GC30687@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250410101402.GC30687@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: be73865a-9bf9-4ffb-9e68-08dd78443cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXdCZ1BnWGd6M3BlZm5DTmlFc2pLNEh1SHZhZXNtZDRvakFDOUIvYTNpZEIr?=
 =?utf-8?B?MDVIcGNPSEFtOWR5emRvNE1CWmFTVkpLZmlORE9PSWZQSTdlOG1xQ3J1LzUr?=
 =?utf-8?B?QjlJODNSM2ZaYXZqcTgyaExCR3cxaTNsOUdQbXk3M2d1Y1hUNFVTNmRvNE1z?=
 =?utf-8?B?YkJCdDlpWFFLUG9nNjJPSEs2bDJhZU1pY3UzeXZIQXQ4S2hwaTNVWTlKQkJS?=
 =?utf-8?B?MGkrK0IyaVdaSEhOK08vSlNKekhhTGh5aGI4WEt2NnFkNFoxT3hBL3IrVkFU?=
 =?utf-8?B?RktHenZpVTlyVFhsYmZUdmxzcFhqR0ZuOGxJQVdmeWo0bGswNDIvS0YrQzhI?=
 =?utf-8?B?QklHTmM1U3J2RFRnSEt4MmtLUjd3U3RLclV6M0tOb1JFMkF5bWIzZHdEREtG?=
 =?utf-8?B?dDJoWnQwZFczRG0ycGZRanVlUG1RMHVMUHRLb2dBWHhXb0ptbm9QMjVkdGky?=
 =?utf-8?B?Q3M5eXZPUnJnZVIyRWpTMk84bTYxSG5mbHRMendJRlI2TW5qK1ZudkpTaE1i?=
 =?utf-8?B?TG5JSzJsL1dCVnV4aEVLK04ydjJ0RFJIYjhhT3hYOGcxbFRocTVQaW1jb3k3?=
 =?utf-8?B?WmlYeGNHOFRmSU9jUlFJTGhZbUdPZGExSW52RGN4SXEvQ2JMcUZIY3VIbXVp?=
 =?utf-8?B?dE9FZ3FObVRZOHJIQXdwSHBMcnUzSzk3aWhJR09RSjJHdGNKYWZEenZ6SGRG?=
 =?utf-8?B?YVpBdTRHaDBzZGw5MXlCVlB6UVhnblpFVHpKV2VGWEZnazRZZUtMMFkzcjIr?=
 =?utf-8?B?T2tFSFdDV3FiUEphb2lqb2xDWjVwWXdsaGNWL0t4Q2lSb05PTzRwc24rTlpm?=
 =?utf-8?B?Y2ZVMnpSS0ZuN0cvbHVLeWVlamh4TmdBZDdhRzU1VjhwYlFYaDZVNXM2dk1T?=
 =?utf-8?B?VVJSTFJDZGhWOG9aSm5ZYVI4c1d4czFTbDU0cGplUW1BT3UxZGxHeENSemhj?=
 =?utf-8?B?QlZDWFR6VW9YYWlWaUVlcTU5dGFvdDF6NUZPU2pINk9rTWJOcWpaT3pFRDhp?=
 =?utf-8?B?UWVTRUlibFJZckxEQk9rTkhwS2dIZUFmbEJKbkdOVzJpYjVITUpLNHdCOXls?=
 =?utf-8?B?ZVQ0d2labktUTytwOGtrZ2lNZjVUc3ZrM2xlZ21UZndJUGRMVmNUTUhIV3Bu?=
 =?utf-8?B?Z01tdEEyTFNjbVZZcmU3TDhTcWxSZGhvMC8ySDYydGNUczFZOGlmdHRkSnFI?=
 =?utf-8?B?K1RuWjNFRGQ3VThBemxpM00rREh4eVNpa092UVlIek1JN0ZuOVlvWDZ6RW5D?=
 =?utf-8?B?WXFYbUMyY3NTWisycEMrd1cwdDVFd3lnS2dwc1lNMFRmNjdpNjJDckliNlM0?=
 =?utf-8?B?MnhLT2RkL2s4bm00bXZmY3NxOG5EZXVwM1o5L291bU9BVDRyU3F2Y0FhRmFO?=
 =?utf-8?B?a3ZEY1ZYb3Z4UHJPbmlUY3VhWDZVTW5nNGNDK3RwS1BwbFdabjc1ekNGZXR0?=
 =?utf-8?B?SGxnRm9ORjQwYzBVNWVITFFUVTAwSHFuSnQrRFcwMmNvcHY1M3NlbTBHVHJW?=
 =?utf-8?B?TTR6TE92WXZlMTU2L1JZOTd6RitxYW5iM053bERVTXh1cHZGaEY1aGlqTzFn?=
 =?utf-8?B?MGZIUUkrUnltZnhQNkk4YmQ2K3B6MmxGOXA5V3FJSXoxUVhqbHlvRDZFN0ls?=
 =?utf-8?B?L1diWTAvaFBPanNtN2dPdnNSSkpJWVFsWFRseDhOcTlNellYVGV3VEJaS2Rq?=
 =?utf-8?B?SlFkT2ZIRDFYbi9UaitaM29tbCtWb0ZuOWloNStzQTJLckxjNUIxakRJYjJH?=
 =?utf-8?B?bXdSYmhUdVNDWDBtNy9YUjR6azhuWFlZM2x1N2h4WXlWaUFEMDg4ZDJobW82?=
 =?utf-8?B?K09OWFlkclFZZ0pXclZJa3FFdUJVR0JEaERuYkRnZ3lwNDRoWEErckExMEto?=
 =?utf-8?B?Mkh5YmZZTndSS1RsRTlTNzdoVXNta3FpbFNaYnJBc2ZXT09XejE2V2U4enU5?=
 =?utf-8?B?NGVZV1BWSHArTGw0eG82UmpPbXh5S3dJR3ZRRmUxTjdQblh4V1p0ek5JTWNY?=
 =?utf-8?B?eXY0SHJlaEE1blpBN3cvN1hvYnIzV3VVZ3pFVzRJVDZ6ZE9BZE4vbFRlYjFv?=
 =?utf-8?Q?Q+YufF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:27:43.0558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be73865a-9bf9-4ffb-9e68-08dd78443cf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

On 4/10/2025 3:44 PM, Peter Zijlstra wrote:

[..snip..]

>> +				continue;
>> +
>> +			scoped_guard (rq_lock, overloaded_rq) {
>> +				update_rq_clock(overloaded_rq);
>> +
>> +				if (!has_pushable_tasks(overloaded_rq))
>> +					break;
> 
> You can skip the clock update if there aren't any tasks to grab.

Ack.

> 
>> +
>> +				env.src_cpu = overloaded_cpu;
>> +				env.src_rq = overloaded_rq;
>> +
>> +				p = detach_one_task(&env);
> 
> Yep, detach_one_task() uses can_migrate_task() which checks
> task_on_cpu(), so that's all good :-)
> 
>> +			}
>> +
>> +			if (!p)
>> +				continue;
>> +
>> +			attach_one_task(this_rq, p);
>> +			return 1;
>> +		}
>> +
>> +		cpumask_andnot(cpus, cpus, sched_domain_span(cpu_llc));
>> +	}

-- 
Thanks and Regards,
Prateek

