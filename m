Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFCC1B0430
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745552940; cv=fail; b=iTRNP2WXQXNN2U/RqIRHMDUpSPpBknVRSVzfJ628E7YOtDjU0n5065oLOIZUCF6/QWYAqJynb1d4mMQyY+qZoNneCPHaDhq2DZugDdcFA+ElNDJf9I/P+uHLNdSkHT/NJAw0T0fMAaR9wUJPpLV/Sm7LMOvM8h4ADRuQXI5LooM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745552940; c=relaxed/simple;
	bh=JmhF1Z4MfxhBry5tVMAPms1kspvibOtuHDPORPafbmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YO9C+7A+3waDIDcVhbolzWCy1SqmpzVMPHuOVHqxfNRvBqWTjOnSaRz+DnHt9SyYRN07GsPf/MVtG9Ntr3eHFHtC9viF7Io8uphM0qAgRQgw1ku1+0Dpq/84TTUX24/QkWpUu+TXtWUv5HDAmvTD9TmEGx9pOKPW9BoCzt51wkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NmMXaRsx; arc=fail smtp.client-ip=40.107.223.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NmMXaRsx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0RCGgLKW2kZdMmYXzafQHE1A4wQcxInDSo7PZMJ9A3NS3BoaUgQi+SC41q8mn2OhR6SBHtJgIUwD73at+ZB3osnJOLdXCM3o0RXrx2PoYte3NwE/Apgbk3/0ovWPoiD3t69747i5i7M3kL7TBgNXsCGL52p1yHAU+xSXCwBAn3cMA2S7fZpuckfB0Quhwqw62JQTDDRbfIttkkfMFithxeWLSNqLNzna5qaHbDTHGMXOH5X4ei0vDtlWzCpAgfxpcbjYKSMosTZyMXfzCkP3BjGMK1cTIDTFFU2UYChz/hKuNyEHH5zARXAVnuZ8qLGOP3o9Ew3VzpbifGRYC+fFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arh1hy98O7Tc3sthjRlH/8Cnh1y6FGSKLYiUyOLUJ1A=;
 b=SXiLglx/64ls4t64QiYQLCD4esDcLTMZ/o8Couua973nWoQ98HC4gPlqHe+o5ayAeMb5KAMKtv6bVHkh3w3c6jX+jpzeae54W8CNhopH+Moh/av2z8VxANRewLE0Ts3GVj94wpYsJM1IVINcRCWHLsPZWTtW5UOomJcDOCBrACGGY5f+ZUyPmZuaQd5SMa11G1ZzYv1gXow960isrJDIhM7ySW8gSfUesCaNEpJD+paPV7qL9T1R8xzgR8WvrEgVGgw7LkmCIxwmJQfR4EguzXQiNZWX4ST/2B7k4CmWavVxISJc6dH7N7SsyZvSlzCDf7LAS/hJxqFKKQlIpuj/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arh1hy98O7Tc3sthjRlH/8Cnh1y6FGSKLYiUyOLUJ1A=;
 b=NmMXaRsxi9LgJgSOxp9qnoBvgbec3bbnRdh2bUcR9F3gw+hYfqgnFlD9Wdn1t7nxDVRXHQMKsDyOIJhl0s9L4zkD+A9WDuP12I7QThGiE2uwCIYRFJk5X7yCi0byjfBO3MheZzl8ptIZBtLex2YPDFcqWMtCfECiRV+uQaUfKN4=
Received: from SN7PR04CA0018.namprd04.prod.outlook.com (2603:10b6:806:f2::23)
 by DS0PR12MB7560.namprd12.prod.outlook.com (2603:10b6:8:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Fri, 25 Apr
 2025 03:48:55 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::1a) by SN7PR04CA0018.outlook.office365.com
 (2603:10b6:806:f2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 03:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 03:48:55 +0000
Received: from [10.136.38.60] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 22:48:52 -0500
Message-ID: <3fb752bb-793d-4c0b-bf7f-12d04a4e7cc0@amd.com>
Date: Fri, 25 Apr 2025 09:18:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] Sched: Scheduler time slice extension
To: Prakash Sangappa <prakash.sangappa@oracle.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>, "tglx@linutronix.de" <tglx@linutronix.de>
References: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
 <20250418193410.2010058-2-prakash.sangappa@oracle.com>
 <20250424141345.7F42GFmZ@linutronix.de>
 <DE11FCAF-4686-44AC-82AD-F0672FE450E1@oracle.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <DE11FCAF-4686-44AC-82AD-F0672FE450E1@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DS0PR12MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: da0593e2-5dd1-47df-2834-08dd83ac1a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDhuL0VOalVQTDlzUm9BamxkN1lhb0NkNUU2MXN1bWhWRUlXTGYyNXBLTDQ5?=
 =?utf-8?B?ZFl4REhTVVVxRGEyZ2dPMzQyUWcyS0hzak1jdHY0djU5NG5KQmFLajBWNnU5?=
 =?utf-8?B?YWpIQWU5U2x0VnVEcDBiYWpwR09MVkNQMW9scC84blRWMjdLVDlTc284Qzh3?=
 =?utf-8?B?NDZEU255TW5RbjVENUl6dlIxUUpJVVhRQ1FEZU5oUjc0Sy9kV0N4dStEV3c2?=
 =?utf-8?B?KzhZSVo0Mm1qN3FtRzQzWFpXU2hzajNjeGhlSUllN0NrQWlkY0FvZWpuUmxB?=
 =?utf-8?B?R0pjYVM1RHhrL0lHamxwdjNTanRQSzBsb3ZCRC8wSDJKcmhMWTRVZCtMN3BW?=
 =?utf-8?B?V0h0bjIvN2hTcWxubmZZQTB3b2VjSW9JMVZ0OWc4Tm0xSnNORWFyU1JPRjJO?=
 =?utf-8?B?akVLZmZsMC92ZWhxYS8vYmJDaXd0MElHSkNQSlBFVll4a3psQXJ4Sk5yMFMz?=
 =?utf-8?B?Y2tKS2hIbnBzai93NjgxRWpYY2RldVh5YU1RY3Bkdll3SGhJM0dGMFhkYnVO?=
 =?utf-8?B?SzRObHB0S28xU0lmUEdGM3NVUmNyRUNVUVBwWGZxcDE4ZVhncVIybHNST2Np?=
 =?utf-8?B?c0tiQXRQbTVpVEFjNmRMRkd1eHVYbkdaRU1VcEV3QmlSVndyR2FXYkRoMk4z?=
 =?utf-8?B?c2Z5Y1RMVFovakRpYjBCcmkrSGVVS0hXdjBqM09kQ0ZFMVRaOWxZaWhQeXZz?=
 =?utf-8?B?UVIyVEU1YjJkaW94dUJ1Tm5lNS9ZMDlvaXBiWUV3bHBHQklaZkxhZDcxK3BY?=
 =?utf-8?B?MW1sa0J2MHluQ2ZHcUlCWXJCT0p3VFNaaHlQTVJ5TzdHZkJSZUNXT1hkUXpB?=
 =?utf-8?B?aEhvSnU2MFh3VEdKQTFqOGZWaEwweUo1eXgzOHY1WGwrdExjMk5GVEtxcGV0?=
 =?utf-8?B?dkVaQmhZZXRyVlVDZ3VVWUc1b0JiVUppQ1liSjFNZVh1cXMwOGFvb1BoQ3pZ?=
 =?utf-8?B?VWwzUTVzSFRLTjV6QWhXVldTQmpPcnlxTzdibnA5WnFRMUdvT00yZEE0TkJZ?=
 =?utf-8?B?dy9PZWd6ZVlFNFhmVnoyYzBQYzRiclBJWGFCYmtqYUNYS29TZFRUK2lEeTVy?=
 =?utf-8?B?ZEcrWXU1ZitweFJhbFVEQzZjRUgxcXhHK0pFT3ZqRGd6UWVUQldQWElpcGdS?=
 =?utf-8?B?Tm9Selppdkl4SEcxM3RIYWRFWDJSVTRpaXFFVWhhQ3YzVjJnS2E2SDJnQVV5?=
 =?utf-8?B?d3ZXM2pPZ3o2UEhsTmtXbktUS0JkRUdUWFFxb3pFSUxZRmcrQmpDVSttdWxM?=
 =?utf-8?B?amk4Mm1pRitwNDlac29UVERHZ1Znem9ySFdCOENrY0NBSnRuWmFEdW92RGYw?=
 =?utf-8?B?bTRJMFNpU1dnNzZOYnhrN1k4TkQzU1phenl1YkdLV090Q1ZXMEQ3ZVRFbTdv?=
 =?utf-8?B?VmdaamxZcnZMRi9oZVhwREorR2hybHVqSWo4VXBWRG9RdTFRaUoxWWFDdDlP?=
 =?utf-8?B?WSt6aWxtTzIraXU1T0o1UVRERDZ1VGxYMCtHd3lVaFlkeGFZNGtkZDU5dTVs?=
 =?utf-8?B?MndtMUxuQmN0dm1QTXVwQnhybTFmUWcxZTVGdEtpalUrcjVzTVczaUswWWlv?=
 =?utf-8?B?NjFCOUVFTThYZ2VoT3FsQUlodGhlQTNTNzhJRXNPS01GVEZRcTFVTktrWGpk?=
 =?utf-8?B?ejFwaHordFk2SXFROGFIalh5YXhyaTlUNWEvR005TzMxRDBpR2YwOWwrMG1T?=
 =?utf-8?B?RXZpSnovNEx6U085UFZvWWhFK0M2R3RkTy93UFF6UEw0dlZDNFZQMGh1Z3VR?=
 =?utf-8?B?cWJvc0pNNENIQlVKSE9yYVRYUDBnbkVPM21tQ21ESWFZQlB5Qy9nT2M5SEdE?=
 =?utf-8?B?WXpmWmNUOFM3QWlvN25tN2hKN2tnSXJEREJxemsyZm9hUlN6aEM5SE1TdmRO?=
 =?utf-8?B?WDdOaDVGWWdxOWFvcDJqVnBZTXAwVVZmb0JuYzg4dHNpcG1INi9XRGJPS0I5?=
 =?utf-8?B?V1A3bk5adGhOVFhGVTNrelNmdjIyeXN4RVE1TThaa09BU0I3d2JDcHNEdVFS?=
 =?utf-8?B?YlF5MWdJWXVyZWFzd2ZiRVN1aVhCM0xCaVgrL3NobXQwaUwyT3k0bSs2dXRy?=
 =?utf-8?Q?cNk4Dy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 03:48:55.2634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da0593e2-5dd1-47df-2834-08dd83ac1a2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7560

Hello Prakash,

On 4/25/2025 6:49 AM, Prakash Sangappa wrote:
>>> static void hrtick_clear(struct rq *rq)
>>> {
>>> +	rseq_delay_resched_tick();
>> This is called from __schedule(). If you set the need-resched flag here,
>> it gets removed shortly after. Do I miss something?
> hrtick_clear() is also called when the cpu is being removed in sched_cpu_dying().
> We need to set resched there?

sched_cpu_dying() is called from the cpuhp thread which will go away
once the hotplug is done and shouldn't need this. Furthermore, cpuhp
thread will not use the "rseq_sched_delay" API so removing this should
be fine.

-- 
Thanks and Regards,
Prateek

