Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0A7188A0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744978431; cv=fail; b=jeH3bIHMBf40OtlOZiPvkCj5MVJpuTEKWxacQKSFJiK1Qn6jxbYp7g5BsLdkxMWPvU48O0XUCEJ38NipffK9ZwUhRnCeCpfl3Q3th2TcbdsOhr94LGy6GwhxwWWPJ9PLRx9auCC9uY01jViHvrkFuQUDAeC7cqNF1ij4HNVxLis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744978431; c=relaxed/simple;
	bh=65C2JDuPcfQIyrGwCugB1/G1tulYQPujZ5K6TGV5DWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iAUcrgO7MPiMz7T4lVXRYyMMuVOLhYBoiqirz/mYlQEcceYdhHG2MY9/6FMSFXnxQWSUQvJgof4U1C+qrJZO0Sc45Yz1DnJzmaSVD8BdNEvEVzK0ie7TtLucbwLRbmsJnbahxLD/EFNxmZlZAEKC/XllJFbmx+oAzREhUCbgY3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rQc+JCEx; arc=fail smtp.client-ip=40.107.92.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rQc+JCEx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXYN2PI3okWzOZIsoAAa5X3PDwoGpC8tmddAQdelaeCYwu//Wi9kjTQO2kR4yrG8zbGjfg4zvtZL8Pva/+OWhbb4a/dSjVqWFTDZVZgk4sVuqZ6fKBgWJUCAKbA6Wyoc8XDJkczVIXrz+mjHZqlKsOEMGovAyQDXXsaLFxbwGwfnfj2EEHC4QrnKKtG8y/TCsp23zsaxBGRVcZdJIsdeFvvl4r1rNq9pYVGW1VOzGhErQsOomQXBcZHdlFBAvi+IgeJlaEEAm/jtsMAayaPaDGGT5aALmk5O80oNoq4pBGe9UzJzV6nVNAA2czW9SI1xfVBu21xOMQmbx+UuS9wtMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFXPigtRuHhwR+qYP2xNsXMMmcCfF9LfNind8E/frzc=;
 b=JD/rdsvHAAd6NsW13qFBfR2pghElKennHsZwDx6HurpE0L0SBjfCR7ZXFy+8Rph1JCpNkHwKVJyna1ugWfYt7KMq3c7M6tec9c2XKVqYVDa7oK7/wpxR25680+71J2S0pbrLWNd4b0uaWDMuGnQxNee24xHFlHkwI3gr1m1Cynv2VdaW3k3RyabjoXM5n2qG4QmN/4VBiwJM/5KdFUcWaQUtA6YZyvxPo6SQiewnYArS9xHpVPryUIN0NzYW1PN+E/+Mr3KEi1r2USAkDQRqk0pp82dfMu2/TaSYLvgEWs8X8vHvU9wNfIhE160HVQk+a4gLnNLXlU0qeyUp7LYqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFXPigtRuHhwR+qYP2xNsXMMmcCfF9LfNind8E/frzc=;
 b=rQc+JCEx66SEHmyE6Glr9XJUWQDI2Wadw03FJk3HZO+PX4/UtikQTcf+ABPkGChee9HLVvVqaDqba3tV+u+9jM2GgNF5KZ1HeUqqQXVCdPdtfXTWcMUH1jICgX+jeXpcxnaOj8efqtckOsaR57a+j02I2XHc+uxQUNT7woZEd0I=
Received: from SA9PR11CA0015.namprd11.prod.outlook.com (2603:10b6:806:6e::20)
 by PH0PR12MB8030.namprd12.prod.outlook.com (2603:10b6:510:28d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Fri, 18 Apr
 2025 12:13:41 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::cd) by SA9PR11CA0015.outlook.office365.com
 (2603:10b6:806:6e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 12:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 12:13:40 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 07:13:37 -0500
Message-ID: <331fb3d6-33f3-4656-a134-3ab3a245e477@amd.com>
Date: Fri, 18 Apr 2025 17:43:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Peter Zijlstra <peterz@infradead.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>, Shrikanth Hegde
	<sshegde@linux.ibm.com>, "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Doug Nelson
	<doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>,
	<linux-kernel@vger.kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
 <7a5a5f1f-0bbc-4a63-b2aa-67bc6c724b2d@amd.com>
 <20250417120130.GE17910@noisy.programming.kicks-ass.net>
 <87728994-b928-45b3-a6a0-258af6e81294@amd.com>
 <20250418092828.GP38216@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250418092828.GP38216@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|PH0PR12MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 274d03db-bc76-46d2-9775-08dd7e7274eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXg4SXRjWHRnNXFReFBvVjl2YmYwSy9jMXl5Ym9kSFV5aWZlN1NCV0hUUDVQ?=
 =?utf-8?B?RVQ2T3BGQ2FDdEJEMFJKeEhZL3FHM2g4VFBkYVkxVktuaTNYRnIxVG16YThD?=
 =?utf-8?B?Unpxdm8vMWN6R0dic1JubFE3SDY3eU5aemFZWlBQV3hwQzEzckJoYU9MbEh5?=
 =?utf-8?B?ai9LWFZzTDFCS2F3Q0FvUyt0bzljTTl2MThZdHZaL2VCdlVCdnRXVHNTbEZ2?=
 =?utf-8?B?MUhuVS9BdVdMN2s5M1h6N2ttM0svRGRYNUl1K2orckRRemVsWEl5Y3JHNHRj?=
 =?utf-8?B?U2ZXRFc2aXBadnFoVGpCeWlRTVhzb2tWbGpiRWFxUVovZC9xVXVJd3UvQ1Q4?=
 =?utf-8?B?QUhCSFQyMWNJUzJpWklSU2ZDRTQzR29mdWdnSCttejJiR3M5SEZvRHpJaXkw?=
 =?utf-8?B?Zng4VldkZzZqT2RpdEo0ZTlwaG1MV2U4WjdoUkl6Q3NoY3lZemVNZ2sya1B3?=
 =?utf-8?B?Z3llUGtqQUxZMzhpWEFJL3hVQ05sUjJUeDA3a2NoTm43RUg2LzhxQ1ZYci9G?=
 =?utf-8?B?Z2h1d0NSWXd3a2FFY1lRd3k2eGF0YzN2d3lqMUZHSVRrS25qMEY2UTdTVTdB?=
 =?utf-8?B?UVNLeTZ2cC9mZEpMbnZSL0FHcS9pdXdXcnVPVHlZaUNJdmxRclRhVnk4Z3Zo?=
 =?utf-8?B?S2dRcXZnNDhpazVQN1BNb0tLc1Bkd2MxdUVxdFFkUGpuVlB5VmJiZW5MaVI4?=
 =?utf-8?B?TTlGNkgzTWZyYkxnUDlTc09QS3Nxa2ZhWTVWN0lhYUhrRmI1YThUdGhSb2I4?=
 =?utf-8?B?QWYzK1hHeUtHSGNVZWxSL2JJeVhhMmFraFdqc3Vkb2xrMXozQjRBZE9kV2Z3?=
 =?utf-8?B?MkxNdXVreUNGRFBCTFB2eTZObGY5cVc5ZFZUL0RrbG16eEFUYnJmZmY0Z0s0?=
 =?utf-8?B?WTQvVnp1dlJ5cHlyWExkV0VtSWVOWlg2Y0ZSOWJZUHNyLy9FbE56QXdSeWlv?=
 =?utf-8?B?cmtZYWt1UDFVMzQ0ZXRkUDJSMTVMUFBVNlYxVFliRzhUQTBua3ZMV1dORVkx?=
 =?utf-8?B?TDdXK1RyTVB4MnJQdXJUMWlYTmVWenlLY2M0MWFnUjJSSDk1M2thSXVlSkNI?=
 =?utf-8?B?d3AxWllTd3lHM0ppQWJWSjk0bHZ3dVpEVWNURjlLZmNwS1R2YmE0WU50ZDFu?=
 =?utf-8?B?bFcvck9sT1phNDJCdUs5NVBSYnUyYzVQVU0vbEhqTXFqV05sNVQrVFZvK3Ir?=
 =?utf-8?B?TkxHcHRUUUNvZmVJMUtMdUd0ajFrUUZZTWtpRmMvMlJjRkhXdVhUeVRjMHRH?=
 =?utf-8?B?VTZCSzY3VXBKbnVZWjN2QnFkNXYvQTN1b2ttdVFLNU5xMEI1UG04Rmt6ZUhG?=
 =?utf-8?B?bDJ4ajZ2V2hRNFlQNlJuZ1Q2azBsS0t3ME5BN2NRZkNpMFdGRFF0VHBmMGhx?=
 =?utf-8?B?TkVFTEZEc3dVZXFEblljYmRtNk81cURkajFFSTlYb3h6WVJIZVVDUUN3ZGRq?=
 =?utf-8?B?OTNsdytEQTA0dEV2WlR1bHpEcG82TWkvblVuekFLQjhVa0JOcGN6VTFQWnFN?=
 =?utf-8?B?aWx0M0orS3pZSzNpTENjNjlLV2d2Vk82Qlgwd1hGQUErZTlxck9sSWJpWFFz?=
 =?utf-8?B?U05SK3VXWmgvNUxId2phMGFhQXI4K2tWM2RpWkZhOUNQa2laaXdIM1BwWG9X?=
 =?utf-8?B?NEVUOU0zTjVSYkI2V2hhTWJqSXh0UjB2aGRGTTE3a3lONHlnKzNpTmZ3RlJD?=
 =?utf-8?B?VWRwTGVGQVc3S3U0OW5IczhwTjdBbldQeXBCRlJYcmx1b0ZYcUZ3Sk14cHhM?=
 =?utf-8?B?SkU4NWkyVFkrNUNXalBIR3piM3dsR3dubXdLNXViT1N5azlvWHQxakRWeTVW?=
 =?utf-8?B?NUs3VGJJRFVQUGIvZXpHcENxUDB5OWZ1bENlZEkySHhaYXZiai9vUkkzck84?=
 =?utf-8?B?RVV5V1FwbkJ0c2lKcFM4NWRrWUIwcCsyYlBaMHRtWUFFK01xM0greHA3dmR6?=
 =?utf-8?B?d2hHTlhwc0JWd0oxb1lYZis2bGFkbWtuWkthT3JwOWFyb1pBOWNqUWpZekJZ?=
 =?utf-8?B?MVdpdFZwVVZQaGVRU0lORTlwUWpSSDNzdzE3Yyt0bStzRi96TDhqZlBnY0h1?=
 =?utf-8?Q?AM3ujy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 12:13:40.8821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 274d03db-bc76-46d2-9775-08dd7e7274eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8030

Hello Peter,

On 4/18/2025 2:58 PM, Peter Zijlstra wrote:
> On Fri, Apr 18, 2025 at 10:56:04AM +0530, K Prateek Nayak wrote:
>> Hello Peter,
>>
>> On 4/17/2025 5:31 PM, Peter Zijlstra wrote:
>>>> o Since this is a single flag across the entire system, it also implies
>>>>     CPUs cannon concurrently do load balancing across different NUMA
>>>>     domains which seems reasonable since a load balance at lower NUMA
>>>>     domain can potentially change the "nr_numa_running" and
>>>>     "nr_preferred_running" stats for the higher domain but if this is the
>>>>     case, a newidle balance at lower NUMA domain can interfere with a
>>>>     concurrent busy / newidle load balancing at higher NUMA domain.
>>>>     Is this expected? Should newidle balance be serialized too?
>>>
>>> Serializing new-idle might create too much idle time.
>>
>> In the context of busy and idle balancing, What are your thoughts on a
>> per sd "serialize' flag?
> 
> My sekret hope is that this push stuff can rid us all the idle balance
> bits. But yeah, early days on that.
> 
> Other than that, I don't quite see why we should split that, busy
> balancing is the one that runs more often and is the one that should be
> serialized to avoid too much cross node traffic and all that, no?
> 
> The idle thing is less often, why not limit that?

Makes sense. I'll add it to the set of my weekend experiment runs.

-- 
Thanks and Regards,
Prateek

