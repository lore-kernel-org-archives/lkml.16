Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BA72741AF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642996; cv=fail; b=lErET93gmmqeIK5gt3PUTzmY45SWSgslvKK7DBlgp+j9fp5fJfvdFQmhfjZN8RKnTEFyYj2bQGRBlw00N0bg//P4c24vitWT2XGPGYQzep5MjoCmAr6sx0Wj3VVZsmsixcMcfutR7v+pEuq6RuCVrXYsnywa9BQKsvhJ1NxyRKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642996; c=relaxed/simple;
	bh=4iTHno7786/wgeUHJ3jkxIVMCHZFQf6sl2sZQIzLfZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cq2/HtOim2jixeDaZJkGUCK1WgaZpFpUMPwfGdHFABlB8dwkKY9BCijgBqHP2HIctyB8Mg/k83D8XKtlxsGUmIr4msbGGqqdrm97XZ/FtgxUfrG3Pxc1pWndg8cMWnesHa84FwMB/P2qRQJ8kuBboxL1pRjkW76/Lgl1t6a9Y64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2XIWFCfo; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2XIWFCfo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWI1d72WrWYTto5xVakzx6YtvdaZ11+LY0M2Cg8EEnOB9lf2yCbIg499TT1ql+eyJXtdd2ATZK4tXAaNYVS1x2L0BOVkX/3tnmgoO4yxSl7ySfXx777UxTNIvSzcDufn3Duh+9VK01x7/XD4rDgkVuGNYbB77KNL/tZfoCAZVw4i01gxTeNu+x0Ntv6aFuq2DTKqfh0iico7NmN13AYpSixjBTCfG8SKF44AXeSPZrrIv2rfJHCnd/d2MQKVosAm4zRfHkQOLayKDpUAXj1SnaSmamMMtIPBf/mYRS+6lLYxHPXokyAQrHknM3vMhi1QC5x7NmC8UosPeper5pXNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSOwS4L5Xbq8hC1yyNVN7HLLkuRxikkr/nwxRPuB780=;
 b=M61nnpqegMKrcOOnF8Wy6u/eMeHkVRDGaq6A4dnGivBY4PPo/eqAvE9MF88o4/KPHOFPIeVnhF+lQY3nqO7gRSaAn9ogEGAbGj+mxRM8fzsHLhMJ8NlwPqGAQqkKkjz9nUl56FjAF5lWqfXy668oHIl28OKc2dOlW0ZDCimOq6CPVLCUZ20JMI9UsofY1U3bkknlVXkbQNtjVaUs204bA6KuYiUIXGzvHDUbFKVaXtSXAdGqNDiUDoRzXuBD8G7PSf1jZdrUcp2lZTNXUBTuqIavoY+O6NbVrFNqji3AJEBMpP+DXjth8YWUpQ9LSNtRJl40Q9sNznHTyns1bESx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=siemens.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSOwS4L5Xbq8hC1yyNVN7HLLkuRxikkr/nwxRPuB780=;
 b=2XIWFCfois3XqgQo7HbzMuVjptxLCPngEIs4z6HftgLY8T/GSCPr6vyQVspoou6yPgC7qiKl24q1UaexH4uI3n/+EXHBY1yalu8JBp+CrF14XsMRR6OulLy12+O3K+Pa8qlTUOnynqzd05K2XBaPtuI7TaJFWILWxGSWT03s7HY=
Received: from MW4PR04CA0232.namprd04.prod.outlook.com (2603:10b6:303:87::27)
 by PH8PR12MB6771.namprd12.prod.outlook.com (2603:10b6:510:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 14 Apr
 2025 15:03:09 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::dd) by MW4PR04CA0232.outlook.office365.com
 (2603:10b6:303:87::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 15:03:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 15:03:08 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 10:02:58 -0500
Message-ID: <7da1f784-cf67-43fa-8ec1-999891823bde@amd.com>
Date: Mon, 14 Apr 2025 20:32:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/7] sched/fair: Handle throttle path for task
 based throttle
To: Florian Bezdeka <florian.bezdeka@siemens.com>, Aaron Lu
	<ziqianlu@bytedance.com>, Valentin Schneider <vschneid@redhat.com>, Ben
 Segall <bsegall@google.com>, Peter Zijlstra <peterz@infradead.org>, Josh Don
	<joshdon@google.com>, Ingo Molnar <mingo@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Xi Wang <xii@google.com>
CC: <linux-kernel@vger.kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Chengming Zhou
	<chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-3-ziqianlu@bytedance.com>
 <7ad8e4fe779d9a63de999aa5572ff204302351f7.camel@siemens.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <7ad8e4fe779d9a63de999aa5572ff204302351f7.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|PH8PR12MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c73d4e-b02d-4d3b-b6de-08dd7b6577cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEs4bFpNeEZuMWo4d2RESE9NeWwzKzVhbGZsWFZSOGFuYjNMN1BhU3YzcEJS?=
 =?utf-8?B?N1FmTFp6YWRHR2t4TmJqWjZEZWpOakdwT2VGbGNhZVh2TGJIRFJKeTdqbWln?=
 =?utf-8?B?ZlVKTG9VeVVXUTBEWXlUZVZPNkJQRy9FdHNWUnVRUys1b0lTcE16MVpURjRw?=
 =?utf-8?B?V1hqTk0yNG1NZWNkVTVlQ3dLeEdINmNTWWJzb0w2Z2lCVmpESEtrY3FtMHBr?=
 =?utf-8?B?MGJBVSswTlA4elNZTXFrd2JXa0tXNExqZVNsOGpKNkJadnJHZ3p2MjJkSGht?=
 =?utf-8?B?R2xRUm1ERlBuM1lqc1NsblpDRW1Ha2FVRE56ZnpodkNEV2RPRUsxanJNRlM2?=
 =?utf-8?B?UUdHQ0gzOUxjSkRsK09wekhSTDQwZmdQMXFuVmkvcFhqd3ZvYzBMSWx6VWlL?=
 =?utf-8?B?ZTl4VCtvNUNkclR2dVp4T1VPK0hCVDYveDRDdHdXZzNNR2t3MzZCYUFtbGY2?=
 =?utf-8?B?bEJzaHRBZEZ4RkZiT1BBZHJMdEZHMTNDdWI0QzJ0dktSNDdreU5pU05TSzR2?=
 =?utf-8?B?ODZBay9iaG5rRk0wK3NsRS9wUlU4VCtlVXVOZ0t2aU10aFlxY2NuTGtHOEhV?=
 =?utf-8?B?TW9BVjFaWFlxcmlVQ3U0eXhDUGVCSmJJL05aNnQ0MWtEcGxxQ2swVUcxby9R?=
 =?utf-8?B?c1Z4SHQzWjk4ZTcwTlZVc1YwZFU5MnR4VkdvaktFd1NHR1FRcXlxcWJSUVI0?=
 =?utf-8?B?ZEtBRE95MnE0MncyMHJpb01LUjdZZzVDMURabXRTUUFiWU02SjBNdklIVnZC?=
 =?utf-8?B?cnM2ZHJ2M1ZzS1hvRVZ4ZHhmOTNvVklkelFNaFl1eEhpUmpLbkNzWEdoaDBs?=
 =?utf-8?B?TXF3bGg5RDczeDVwUi9lNFVEVE1MN1N0Si9JTkNEbENWUDg3UXFNL1dqdXB5?=
 =?utf-8?B?MzNoWXVmT2VPQW0wYm1mQU5tV2FvRWtScHJ2N0RWaitOYWRHWVVsQ2dQMXBI?=
 =?utf-8?B?QUNIVk9kOGJGSDZVVTVBS0dxYThSYTNlU1pMcDBzU01TZGhxV0piS1JWbmgw?=
 =?utf-8?B?djNVcmtUZlZQZjNVSHVaejdPakpKbVpQU25tdXp5RFBxU3pOSk9HU2NQWVg4?=
 =?utf-8?B?clAvaTlVYklxbWFRNjZ5RDJMTjM2eDkxaXM3cHFhNzRUdGlhUEs1N05LWDZk?=
 =?utf-8?B?ZUZyY0c3cUcvelRNaUVpc2h3QXJtb0E1cUJ4eU9iZ1p0T2Q2Q21WUHozNk5I?=
 =?utf-8?B?VHM3ZE41b1JlUlE0YzhXUWdERGN2YlM0QTBLWGwzdnEwRGVla21Yd0ZwdTho?=
 =?utf-8?B?SVB0U3h3cThZU0VrTnZWZ0puaktQa1ZzcHgvRkxidmJmdTJob1ZGamVBSE1R?=
 =?utf-8?B?eUMxdkNJbm9UMmpMOER0MjFGSUFRRERVM1hkRmlEUDV4WFBRSFRSK3lraUJF?=
 =?utf-8?B?T3MyTEx5c09qcDVYVy9JRTZxT3lQSG1OQmZrd3FWNTdwNUcyeGQ4ZWlqWEhL?=
 =?utf-8?B?eXE3SEVva2xJRytyU2ZiUlI3dSsydXpBY2VmeE5BQUYxUlFVdU4rb3Zxbmll?=
 =?utf-8?B?dW9uak9JZHlXeGNxM1lPOW55UkRPcHJpVTc1UDVFSHplc1JlbVV6Zld6Kzl4?=
 =?utf-8?B?WjA4SklUdU5nRzNtcDBPejUrZlA5Sm52NGQwdnpPa2pxalAyRVJMbTFoQ1ZX?=
 =?utf-8?B?M0c5YlpPSEhHemRmYjh6dUt5eHg5eEJlUDhZTkNpWEZqc1owL0RlSzY0WWVn?=
 =?utf-8?B?UHVpclVKL1YyQ2NvZVEwa2VMVnVzM3k3UXVrTlIxeVlDZWxyTlFUSkUxRkZU?=
 =?utf-8?B?amhxOGJ3b2FXM2VQcWExQ2hORENsU1lnRE91SVlnMU56TVlCcmY4bEJWS2FK?=
 =?utf-8?B?alZKVlB4TkFxTERHa1I3d2FmSEpjeFdSa3hlczBzWDZwQi9DNmV6a1FXTmNC?=
 =?utf-8?B?TjRzK1RvN2dIWnNvV1VrUHFGd283MTFNWitSOHBXaUVtdGZvYi9idU82U0hl?=
 =?utf-8?B?SEpNSWhzM2sxRFZWbGpkbGtOU0hZNlhVVlhOM2lGcUZMbHBGNlNkTnpLdTlS?=
 =?utf-8?B?UlczVFVJZnZNWDV4Rkl2YVB3UzFjUW94d0YybS9oQnI4aDE2bklEcDlrUFRH?=
 =?utf-8?Q?X0Jjqg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:03:08.6799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c73d4e-b02d-4d3b-b6de-08dd7b6577cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6771

Hello Florian,

On 4/14/2025 8:09 PM, Florian Bezdeka wrote:
> On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
>> @@ -8888,6 +8884,9 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
>>   		goto idle;
>>   	se = &p->se;
>>   
>> +	if (throttled_hierarchy(cfs_rq_of(se)))
>> +		task_throttle_setup_work(p);
>> +
>>   #ifdef CONFIG_FAIR_GROUP_SCHED
>>   	if (prev->sched_class != &fair_sched_class)
>>   		goto simple;
> 
> For testing purposes I would like to backport that to 6.1-stable. The
> situation around pick_next_task_fair() seems to have changed meanwhile:
> 
> - it moved out of the CONFIG_SMP guard
> - Completely different implementation
> 
> Backporting to 6.12 looks doable, but 6.6 and below looks challenging

v6.6 introduced the EEVDF algorithm that changes a fair bit of
fair.c but the bandwidth control bits are mostly same and they all
get ripped out in Patch 2 and Patch 3.

> at first glance. Do you have any insights that could help backporting,
> especially for this hunk, but maybe even in general?

For the particular hunk, on v6.5, you can do:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b3e25be58e2b..2a8d9f19d0db 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8173,6 +8173,11 @@ done: __maybe_unused;
  
  	update_misfit_status(p, rq);
  
+#ifdef CONFIG_CFS_BANDWIDTH
+	if (throttled_hierarchy(cfs_rq_of(&p->se)))
+		task_throttle_setup_work(p);
+#endif
+
  	return p;
  
  idle:
--

Add task work just before you return "p" after the "done" label.

For most part, this should be easily portable since the bandwidth
control mechanism hasn't seen much changes except for the async
throttling and few bits around throttled time accounting. Also, you can
drop all the bits that refer "delayed" of "DEQUEUE_DELAYED" since those
are EEVDF specific (Patch 6 can be fully dropped on versions < v6.6).

> 
> Best regards,
> Florian

-- 
Thanks and Regards,
Prateek

