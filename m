Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B54923ED7B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889508; cv=fail; b=CMS391WeaYMyR93YocqMDHgUiP2AuxNnlhUZDy9ADftWbGBvCMlOOPy4y9v6LOK9v88EyUe/Nr4MPaYAEE7EENLuRBDZDZ4Ab8YPsBOLRNqvtJ84YxAKFl6o01gUkcpXrllpEXd4VAJFOquDHHSVMJsQz1o2LSOr4MzOOzxKJkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889508; c=relaxed/simple;
	bh=SjWdyWhNqYuf/kqv29ORwC5zyFbdGBexbq6p7nI397A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hQ0MX4XD9u84ykjki0ifks2RIrgidRGW1FBrCuIaYiuP6cd5ixJLcv4W7Bk2MJZivwduQbAN6s2OJip0eNwTGQQ9zIMqasXJ1ocWjo+35EMGZ+PQN2QWERpql3ufELre8krSnW7LRFP0CUB016qW6UangYBDyvZDb3kb5G3XIiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N0GzXhZx; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N0GzXhZx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOzoCE8X4BLPkkUciOLUpundzsll7EqSsraC5h/ycGnm6GTstzMx75C/mxGMUqqf5nu44lvSUItpHCsnEKpcgo40iCWxCnvQiQ7f1iP3fcYk3D0WKFUFqEzb5qraoG9lSLzcXJHpiBm7Zfqz58cRdTIQB/VrsmEHg3XL3O4xyQDqHvkhKrO4t3FDIUXvZ02M525KGFQtQt6NkC0H6ieEQ/+hgSA2rEZpsPbbgXD18vUJJEEjQqb2gJ9ZreX7zSx5Y3ZOkns+satKPFEy8k7aIN6T6o1zERgM9QpZKXH1VqTwuFvqjrJeYWilvclMf6mWKzZK07dLCmyb80R/F1o5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzsDmK2dUGd7O7wEz9ojv9xizJ/yrT7ox6GxdbpgS6Y=;
 b=XGRGBsIX/KLMqYd2XOvMm2WWeRwEFPC4FpvtQpRDW1INPLRlEfdeqqAbrk53EXcJL4jzHQ9394UMrgMSMNz3NvQK/hOdEYF3tz+AkCZCf9d1jfUqpDKUB9sj8iAXNnpyx9PSCYZrWQWkLBGVU5pS5nYpYpTLwijaBWwgmBPdN5/L1smuMdlpBmzp0VWXUGwibtLZBCc08OzcGxgS+QNAu0UCCD43h+46WGVKtK1x8fo20FTI2n/g1pntuPFyrQo0ULpFL3NFgVCPMPuSQI5A2hO3TSjedDCtAuWq5RtfuBU4tVstsTInGjtRDPBmYgXJritY4oUsHAzHnEXSY2rL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzsDmK2dUGd7O7wEz9ojv9xizJ/yrT7ox6GxdbpgS6Y=;
 b=N0GzXhZxytIblr+V5Y9I21RwS9M2D1FDAZvAjIoV6zRhJYO2tbChMyfxijjDE15RCT2RxkYFQnnBuGvlsZc1gxUgFbHfhhyxJr0RGQ0jfDKq4fFkEz1jFs555Na2HFI7DK2+x2aXq/E9jo/5F4YJiGkIcHq5XaTnJsLK4HCrD4Q=
Received: from CY5PR03CA0001.namprd03.prod.outlook.com (2603:10b6:930:8::29)
 by IA0PR12MB8086.namprd12.prod.outlook.com (2603:10b6:208:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.42; Thu, 17 Apr
 2025 11:31:44 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::1b) by CY5PR03CA0001.outlook.office365.com
 (2603:10b6:930:8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Thu,
 17 Apr 2025 11:31:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 11:31:43 +0000
Received: from [10.136.45.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 06:31:40 -0500
Message-ID: <7a5a5f1f-0bbc-4a63-b2aa-67bc6c724b2d@amd.com>
Date: Thu, 17 Apr 2025 17:01:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Vincent Guittot <vincent.guittot@linaro.org>, Shrikanth Hegde
	<sshegde@linux.ibm.com>
CC: "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Doug
 Nelson <doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>,
	<linux-kernel@vger.kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|IA0PR12MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: e768f4ee-386d-42dd-0027-08dd7da36df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2I5dG1rTmR5dlQ4Zmg2YzVVb3RuaWw0eitoc1JTK1diQ1llN2ZLeGJWclNH?=
 =?utf-8?B?WTJLM2srV0lLb3NIUHFVcm8yY0FKY2dOeDFXRkxnZFpUU0hUN2F5a2ZEaVAv?=
 =?utf-8?B?ckhsMTdkaStWQ1dEL3huS0lGWFNJRDAxZDlkUmMwdWNlc3duNkxqVWEvZGVT?=
 =?utf-8?B?YzhieUdVRmpDMEFjdk5SdWJqOFY2V3YzOWExUWM1MktiMVZxTWoyTmt1RjV4?=
 =?utf-8?B?Y3Nyb2h1NVZzVjJ0eEhIM1cyaktRZ1ZHOEVma0Fkd0hweXJzVTJqUFEwb2hL?=
 =?utf-8?B?N3F2Zi9tRm1CcloxMXR0eTJWWU9DdU9kcC9hS045dnRLU0swa04za1FtNG9x?=
 =?utf-8?B?WWZXSUhNNzJxZmd5QUNEa1VYVGFiZEFZaFd2OU1BTy9najEzL2VkcnlNYUdN?=
 =?utf-8?B?eDdWeEJ2aFRDTWRJUS8ySlgvcFdIY2E1N1pSNVpGcDE5NTVUanNjZW50NjRR?=
 =?utf-8?B?Q3gxSnU0VElvS21TOFdpdllrallGTTQ3Vk1reTdmR2NjTFV1dW1wam5WeEYw?=
 =?utf-8?B?TG1QR1EveThsWXN4WUNzVnM1OWhZVFFkZ24ralFmYU5zazlIVzZQUkJ0WGJt?=
 =?utf-8?B?MUZ2c004RFpPK2dYVXRhdTVjSGM4aFZsc2pGalp4OThRakNvNDRPNlRTWDZp?=
 =?utf-8?B?QTN6cVJwN0JObmdwV2VreXhhSDhQMkRMUlB0cXpUTFQwSjcxWklZUi9Beis3?=
 =?utf-8?B?dWxiNHN6aGcxTzBtT1RnUEw5bWI0Q0p6ODlpaHhVbENLdnBnclpoR0ZEK1lp?=
 =?utf-8?B?cTIzbjVlTXZmd0N3Ti9DYmVTVmFoVGZDRHdIbE8rVDUxMVVBc1V1Y3A4VnZQ?=
 =?utf-8?B?M0hTRmErUW96TFBWNThEMTdIUUxINm1kQkdLdy94NTVaLzRucTNRSzUvS1M2?=
 =?utf-8?B?dk1uSExHUlpGTklLaUprai9GMEk3WU9kaWhxbFYxdEZSL2pRRHRKRFprM2xr?=
 =?utf-8?B?bzlBLzd4elU1d2lIOXVMTTRQYnJDZXlOMTRWbEJCQXlKR005R0hTNHJSSFo3?=
 =?utf-8?B?Ymtzenc4aHBEaXpqL2Y0K0dGWWVHdzdoKzJzdjYwbXhUbFVmOXA4N1p3dUMx?=
 =?utf-8?B?cWVVc0IwLzZZR3pzV095aVB5aHRrVFE4aVZ1SFVXNUo3Z2F0SE9Cc05iblhv?=
 =?utf-8?B?UHVNZlMyVk5YRlVCYTV0S3JiTmhNSkl2RENjcGJIWUx1L0sxSkVoejhtOWpm?=
 =?utf-8?B?bVlPYVRValkvSHBiVW1hc3Radzg3N0NDRFRJSmZKNEhaanpQYlRtYmVzbnJP?=
 =?utf-8?B?UUltakhqSjlaZ3hrVC9TdUxIdE45Ly9VRW1sd3h1RWRIQ09OaE5ONWZDODRy?=
 =?utf-8?B?akxrQ2lwZTBFNGZGazlLZXVaL3BhYTlhV2NsVFQ3c21vUXh1UkRVVUpMdDgv?=
 =?utf-8?B?UG1Ha2wwQU1DVWR2MmZDQWJYMVdsTnlBZ0x3aEMrM2E1WVc3MjR6a3ZwbWU3?=
 =?utf-8?B?M0NVWUpNUkl3bHZRTmRsWGhPUFhYcUkzYTgyQ2gxdW5INW1oMU01VXF4MUtS?=
 =?utf-8?B?cCtnbkw2Yk9weWFveEs5NFF1WEMyMEsvcm5uVlMxSFV2Nk4xV1A5YkFWVS9C?=
 =?utf-8?B?YzBpNy9GSHVaY1lzcGc5V1JlTWhFeDZNRzNueThLK0N2aTJBUGNzUmQ3d3VB?=
 =?utf-8?B?TmEyMjFHUmtYZ01YM09Nenl0bXVSZERNV01CenlpNVc1NCt4Q2ZvVGtPcVNy?=
 =?utf-8?B?am80ck11eTRRakxkVXMzWm9jblpidDQwWG9sUXk1YzdDSnM4ZUtLNW5YNDZC?=
 =?utf-8?B?cm5CS3J1UEJMZ0ZvNkdnQ2hxVUpSSkRVcXJoZFpQUnpPSCtLbnJDQlZ2Q0ds?=
 =?utf-8?B?YklHdWdnSk5VZU1LVVp5QUV4c1dwS05nSlRha3hTRHRad3JjcVZmWm1jbkdH?=
 =?utf-8?B?WWZDUFFUUVVCd3dRNkUxYTFKTTR4d3BqTlNRWEEwTGErd2VFQ3VRQWtiYmp4?=
 =?utf-8?B?UGFjTllqc2ZSYlFGREU3L0RZVUluNFg2OEtQL3RWZkx1bVlPMFBnRnlYWXhE?=
 =?utf-8?B?MFpscW5XRzA3K1dOeFRSazdIWFo5RWpQdENDRS9seFdYdDd0UnlPZWxTbExv?=
 =?utf-8?Q?seMMry?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:31:43.2699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e768f4ee-386d-42dd-0027-08dd7da36df3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8086

On 4/16/2025 3:17 PM, Vincent Guittot wrote:
>>
>> Sorry, forgot to add.
>>
>> Do we really need newidle running all the way till NUMA? or if it runs till PKG is it enough?
>> the regular (idle) can take care for NUMA by serializing it?
>>
>> -               if (sd->flags & SD_BALANCE_NEWIDLE) {
>> +               if (sd->flags & SD_BALANCE_NEWIDLE && !(sd->flags & SD_SERIALIZE)) {
> 
> Why not just clearing SD_BALANCE_NEWIDLE in your sched domain when you
> set SD_SERIALIZE

I've some questions around "sched_balance_running":

o Since this is a single flag across the entire system, it also implies
   CPUs cannon concurrently do load balancing across different NUMA
   domains which seems reasonable since a load balance at lower NUMA
   domain can potentially change the "nr_numa_running" and
   "nr_preferred_running" stats for the higher domain but if this is the
   case, a newidle balance at lower NUMA domain can interfere with a
   concurrent busy / newidle load balancing at higher NUMA domain.
   Is this expected? Should newidle balance be serialized too?

   (P.S. I copied over the serialize logic from sched_balance_domains()
    into sched_balance_newidle() and did not see any difference in my
    testing but perhaps there are benchmarks out there that care for
    this)

o If the intention of SD_SERIALIZE was to actually "serializes
   load-balancing passes over large domains (above the NODE topology
   level)" as the comment above "sched_balance_running" states, and
   this question is specific to x86 - when enabling SNC on Intel or
   NPS on AMD servers, the first NUMA domain is in fact as big as the
   NODE (now PKG domain) if not smaller. Is it okay to clear
   SD_SERIALIZE for these domains since they are small enough now?

-- 
Thanks and Regards,
Prateek

