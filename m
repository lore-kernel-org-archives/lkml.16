Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41A1865EE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750911878; cv=fail; b=tJfilLzPOj8xmfo82xnWrS2R67U8fgDsGZpvAo9QiUaW70T6re7n+h7eNYrbNfniy/luNVXnDaMTMcZWCrVMTzPlsr0Guwue+vJz4u6SHFx9h+XAo+/KrlXrnnCN9gSvRbhQIl1jaOTKq2j94wlKxpM48GbdfyvWDQ8QQu91+30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750911878; c=relaxed/simple;
	bh=zBvFdbtpjd9a5DvKvYZgwGDXkMHSRnEpE3LYMxkqPIg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UbMyLlJqu5ajYikDGdiNAQ31KIJ9xHxdWyLUTRJqvtZU0nGOWyFS25fpzfOpDaaGOZyoXaWe0AbKjFsFOAQOOT2tRKrCLTWKTDUHajpszIKWIn4UifCwzYDPAqdoEotyZwYr6XTZTiwsalgRCLxxL4whyWZV4rNy75sLGkxbLTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z55249Jt; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z55249Jt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1QC0ycIn1NiAx/DHCBURMdcOCjMUbLe5FmsgyF7Pre7dScFbX8GTfXYhDoTbO6AErIbHJ4vtwqzW1FVsb4PlPyZzzWh1fqhLja0HLAwY70TyQVxXpJOVuWLUGaK4RTqsGi5PVvtoPW4lhjiK9+RCGmFeZiAm/uclOaRz7MIZJWnXWLyGfo1Fc4Thj4nVVqlV9IpIlF1hiPUX9unPoJ/i4LQ/3wF2vspu9ECrAKcmh7ejyD1ThuLRhlIq7aU64v2RblAurD++AYZBSjx6+UtVd5EhKfIMhi2e/Jk4M9E6zAdM/mGrFHDNaCosBCQ3aUrAFgIs6p4QiI04/JBrPW8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkVJWrUl+HnJO96wnswAtatcY7F0aov6YcBOm7j4XVk=;
 b=IeCd0i4SUza8oKp09o7FGXhc1fXv4t65PxVpuDZNnNt6JKnSwULLsibH4KlDI/Zz2gXq+y6YKMPqz8fE9j0boKIpPkzVttCGlaJ7W775kZzmnCODIUdwRCQTu1ckf2Rk01tiJ+XpKzm75qqCC7enH6tWp3yQjwBVUyhyDSKG/uehrxYW1k9wP3vBds5nOPYpXvH/jiwaKSrjx8q6xHqQJKwab0pZif4ewYFssNvYSVtQAxLmeZM45bRcNdv+DqDa/yYaLbexYJQk0LaXKw2qXSi4gYPEOjil11d45EHfMkipV0u4YZgi9ba0VJFD16GHH8XggGDAI2O2k6LaFaUu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkVJWrUl+HnJO96wnswAtatcY7F0aov6YcBOm7j4XVk=;
 b=Z55249JtnHg3PUoKoNBboqKYArNyC2vE8dBH50DCalbVquRx9yfV2SUzQDRPKvCm16P1H+bSPWTPv6ncr5vaQWmoxcJQqCkTlZHVmmJQFWx5xv9+Fx5I5QCErkVTcZq1fZ3mgK1jRemLcUM/tYZdkRWU0GEiabvy/pKgKc+T/84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 04:24:33 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Thu, 26 Jun 2025
 04:24:31 +0000
Message-ID: <83e1f480-e887-4b1b-875f-fac9f9392159@amd.com>
Date: Thu, 26 Jun 2025 09:54:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: Correct "sched_domains_curr_level" in
 topology_span_sane()
To: Valentin Schneider <vschneid@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org
Cc: Steve Wahl <steve.wahl@hpe.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250624041235.1589-1-kprateek.nayak@amd.com>
 <xhsmhy0tfhm5e.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <xhsmhy0tfhm5e.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::9) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f65b89c-e22f-42b7-28db-08ddb46958dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWEwbDdyNllmRXltRXh3dUpLbDJsSVZ2djRTcU1DOWovclluOXpSb0NOV2Jj?=
 =?utf-8?B?aVpKOG82QTN5MjRLdDNpUjlnYTFvVnZNZi9QRmVZN3BaSGpPR3FPa2lYYyt6?=
 =?utf-8?B?RG1uTERlNDkxSkJmOENkRHM1Uyt1VzNkMTF6RTRZdXlwMUw1WXZCSVhGOUNX?=
 =?utf-8?B?bWoza0pYUjlHck1zM2QyMU9YbUhCTzNnQnBQQVhTNGhMTWl1Y0dFSFJtNFJD?=
 =?utf-8?B?OU0yb1lPamZYTE4wOHdmSmFtNFpIOU9jdDBJY3o3bkhsZm52ZXVKSkZwYVZx?=
 =?utf-8?B?S2JqQThGY2FpOE54eTMzM01HRmhVWkIveTFPdUo2Ris2TnVIOXUxZnhEL2py?=
 =?utf-8?B?bjY4TkdsYlJRbEtGSDhCQ3lNbnNiYmFjN0RJTG5qZXRUQWtZQmNMSGtQYmJn?=
 =?utf-8?B?anByc0ZTWExiZEpBcUxnNmg2M2tTSS9qWjBLTHpyYTYzMWZ6YjllQlRZN1Vo?=
 =?utf-8?B?TnhwMUFjcHR3czdUYmtRTVJkOVhwL0l0Yys2djczWHdsWElxUVRicHVaK0x4?=
 =?utf-8?B?b3BNRDlvMkhJRUg0dUhIYk0vQ0RHRzA2YjdwbjYycm1saVdrQk84NzYvK1Bo?=
 =?utf-8?B?RGpLOUl5UkRvWEIydmRRZE96VUVZQmd0TkxWOFhDd1BrQVYvVlVNazBZUkNK?=
 =?utf-8?B?SlNCNkNWcWp3Uy9HaVV5OWNoZG5sOUdFaFRWRGE5ZXJjdkZtNkQ5S3ptang0?=
 =?utf-8?B?dHE5c1I2MFEreU03c1dDK1RqWVlReE5xVzRVMmRENUFOdHRuODRraDhlVnBE?=
 =?utf-8?B?dkNidVhEZHFGNTI5RmQ2WWVkSTlvMXBvdW56Uys5YWsxYW1GUmVmbkk0Ymdv?=
 =?utf-8?B?TW1XWTBibnR0T0Z0Q280WG1SSVlPb2lNV29oeGdpWUc0NDBNcG5DNGMvUDNm?=
 =?utf-8?B?amcybUJ2YXozYThZU0pla25TWWZxSGZpeE5kVDlLaDJPVWllYlkzOFdQeGs0?=
 =?utf-8?B?TCtEV1JWVXZBUUQwMnB5YWtOVkFjQ3MvVll5WjlsR2tQSHdONkxBY1dyKzN3?=
 =?utf-8?B?NC9DM010Vm9HbXg0bzdGSUhzU3NzQ1VaYVR1UDNtS3N6bDJ5SUgrTWl3Vi9U?=
 =?utf-8?B?VnpjSXhtYitRT2tRcmxUTUxkM0pHekhHRkhsLzdCUE1PdzF3bytIWW83VmtV?=
 =?utf-8?B?bWdLL0x0TzR6R2xUQjFRMGtZa0F5MDhxMjFLRGdzUWJJV3ZwaVFoREoyQ05l?=
 =?utf-8?B?UU56UE1lVGJjV2ZzejkzUEFmbmZKOUk4MzlDZ3lVbDVQOVJoOFVwZzNWTkQw?=
 =?utf-8?B?ZWNReFREalZrOXZYVkM2ZEIvVjZDakRCOTNoV3BHUndRWGhsbkJLR0I1aG5h?=
 =?utf-8?B?ZkxNemtZN202QWpQTE05aG9DOGw0SVBLdU5QbzR0N3VwbjhIL29ocHN1dzVD?=
 =?utf-8?B?RTdaSmszTUF6ZVZQVGJVdVQrTXFESTNWYjRWU21FTnJCOHoxeG5tTGJoTVBQ?=
 =?utf-8?B?aTlKRGRsaTA4Q2Z2ai9NOVROaVM3YStmK3RpbFR3ZG9FVEQvRFQvL3VyUDN0?=
 =?utf-8?B?Y3laOXh1MDZ3aFVReFBTMnQ2WStqUmhsWlRsc2cyem5OdHVDT3p0UkhOdHgr?=
 =?utf-8?B?ZldyN0NyN2E1MzRzbGtBbjY1NlRaNHlYS0VrVG5kRW9ScDN2MUlhUUpaQXY1?=
 =?utf-8?B?RThseWlad0d4Z0VtVHc3U3JWbWhZQVdrb1JINmIyb2xNRmFPWnlGeXl1QllT?=
 =?utf-8?B?OUJ1d2N5bmZvUVhyT1dHM3J6Q3p2UUQwR3ZqY2c2akFvdHpqQ2tSQnRPWVpW?=
 =?utf-8?B?dHRqN1k1Y29lOFMzdnFIUmdUUEhSOTYzdkVoRFp0Nnl0a0d4MVRsUjdvVVIr?=
 =?utf-8?B?M3Jtc1NNai9aTUs1ZGR4cUpieDA4aDdlS3JZckU1YmZTcW1OUlJURXA2UmtF?=
 =?utf-8?B?ZmZrbEVndU1lRmRmOUZFUVJQbG5sb2ZaVXcra1QyWG02U3FMdWw1aVFQREYr?=
 =?utf-8?Q?gJE+iwsy/ys=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC9lSkpKUk4vc1RHN3lNZEh5c3N4QWZxdFFEdEg1M0trSVM2bndaeHBKa252?=
 =?utf-8?B?aG5memFvWTZtUW9VbDRBeWd1aXlBZHVPbWpwcDdQbEtWQVc0RFFGNzM1Vjgz?=
 =?utf-8?B?ZW9sSlJPSm9jQkx2UFhsOUgwR3ZROVdzOUk1MXkwcW5Nbmw3ZWduTU9yenlp?=
 =?utf-8?B?SmhqQXV6VmJTREk0aFA3RURKQWVaQ3F1NE1USkQ4ZVpmTDdkdjdwcmhteDAx?=
 =?utf-8?B?anptOU9BbHlPRk1tZVVNN1p4QnZMQU9xWGZ4NDlmRVNyZ2E1UE1SWXRTbmpK?=
 =?utf-8?B?Y0MrTFZLaWs1ZGJNUTJ5UkdhZ1FEK2NVRFVmVjZuY3owampCSlIxdm9tVHJh?=
 =?utf-8?B?MktYTjN6UFJsWWZZc0p0V3FuTGVtRlAwWk5uVVRxS2VxUVUyYkh1Rmh4TG9q?=
 =?utf-8?B?cHA0UDdkeDBQTnZqQWxnblJGRzFKSXlmb24xR04rbUVCYlc4MXlSbWQ4T3Zp?=
 =?utf-8?B?YktDMDRyWnhYL09nY1FQT2ZRNVBjMDdLOEg2cGtDNEpQSXRJbGpwRnk2OUlL?=
 =?utf-8?B?SWlVRzNFOFhFZVpoRXNLSVJ3bmpzME1OSXhIcFFCSUQ5dm90RVYzcmZpVjhh?=
 =?utf-8?B?c1JvS1hUcmN0M3dxcEhMNldHSWF6ZUlMazdzMEcxWWI1MUs1ZERaLyszWVI4?=
 =?utf-8?B?S2Y4L25adWdPeTEyQit0enBGQ1VxaDRMSEJYbGdSclEwWnhUdC9ERlR6OGZC?=
 =?utf-8?B?MnFHS052ZGdtZ0hFbVFsTTZQdFppSVVtdXJ0VFk5VGdtSFlaTkVPOTN3UGFZ?=
 =?utf-8?B?OWtOcW5kYTZ0blEram9sSm9JWnprd2RIbGdYd1BpcWZWd2lEZjFJcGovQTJr?=
 =?utf-8?B?bjJQaTlCVGxFeWJNdkFkMzUwazVsQUFER1B4clViRytUa2lIWWw3VXVIT1NS?=
 =?utf-8?B?NkV2N3NXaS90UHBXQ0cydGhGcGE3bUk1WEpFODJkT1ZOdWUzVTR5VXNsMFZL?=
 =?utf-8?B?aUN0MkZSd2lmNERheFVvMFMrbkU0eEsvb0VjN1YvenFadEtlWGZEZElLSWxu?=
 =?utf-8?B?MkV0UVVDd3JCQ2szT3pjaHVTYURUZnFLdGFYUTVQOGhYRk5QUmJMUDRtRFFF?=
 =?utf-8?B?NlltY1VWd2k5a0NIS1ZRV3ppRHFxSGN6bllwaDdEVW9nd3Y4eVBWS1J4eE1p?=
 =?utf-8?B?eXJzOWU0ZURURkJSVm81NllQS1kwN2lhaXB4TG1PY2g0NEFtaWlUclFCMGpC?=
 =?utf-8?B?SFU2dG40L3dsYmNqZk9YdFIyQ293bFZUUnZIbVk1aXpQTG1EQm5sOTlydTZW?=
 =?utf-8?B?V1BuK004U2h3TVhGNnBWWjlLajV6WFRnQkxSdHRiSUtKSlRhb1Nrc09sYlpQ?=
 =?utf-8?B?L3JqV09ENURQMytjWGFkcVRRYUtBK3BZTXdlQkt5YlhqNVdVK3NJYndkZ1JB?=
 =?utf-8?B?ODBYcmlZTW9PQmdhWTBUOHpnMExXZGhmR25URis2cEZyeHozc0U1Z1p0MmxG?=
 =?utf-8?B?NG1nbXFJbVpHMForMmpnTXlLSVZ5WG5LZEpUQnNuTzZrUHRGTXdLU2cwMnc4?=
 =?utf-8?B?RDdNODVuTVE1dzZDdFhIYWtBV3NiQjh5NTUrZS9Cdjh4Ymk1ZWlUZ0ZHalZ4?=
 =?utf-8?B?VFc2RXU4bW8rQlNBQld1VE5CYjFYaW9UWGVXczF6dXhlL3JiaVpmV0VjQUEv?=
 =?utf-8?B?QUpOMnA4NFlrclZzMkloZ3Z5SkN6OTBnUGZlejlvRDhRdUw3NmJMSDMzOHlp?=
 =?utf-8?B?Sk4zNjhCVjJoeEpyS1JLTHBpcUx3ZHFIOTRUOHArcXdUY1lObGhXN1ptUmh4?=
 =?utf-8?B?U0NQSW1BTXZadXBPY0h3MSt1MTY3NUVsNU96S0NuVmgvWVdad1FEWGdpM1lj?=
 =?utf-8?B?TVVVWklYR3ZrbTkzdDBVUWQwaThLMzdmZFhpQ1Z5Q0hvTTRENmRpSmVxWEdI?=
 =?utf-8?B?eHVvZFNuWURZMFBhZVBuL2RnOG5mSjNOdGRCVDdPdkpYNE9SL3JIbmRqM1hJ?=
 =?utf-8?B?eG90Z3FDWmlWM2kxaTJKOWxkU1Z4VkFyNzFSU1Z1b1JUR2pjN1lNQWZjcEw3?=
 =?utf-8?B?dE9VZkZ2T3VnZ2ppVjRPTkVzQ0ZUNEdwVlhlSWRhQnppMVpqUlk2bjF3MGNC?=
 =?utf-8?B?ekhEN0htbzV2UWtQdUhhcXhvdnA0djNIc3RJR2xSRzg1K1ZVSVF2Tmtibmd0?=
 =?utf-8?Q?whOKlCMa7WhSsuy+CsFYP/aSt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f65b89c-e22f-42b7-28db-08ddb46958dc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 04:24:31.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cr8MQCaxs/XTGeZpA2Sxnv19vmITPfV786xcJ01wcDcs2UsGdQD2j7M4FvfbswU8TfhxSkjkmimtN/Nou9BlnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928

Hello Valentin,

Thank you for taking a look at the patch.

On 6/25/2025 9:02 PM, Valentin Schneider wrote:
> Hey,
> 
> First of all, thanks for looking into this!
> 
> On 24/06/25 04:12, K Prateek Nayak wrote:
>> The updated topology_span_sane() algorithm in commit ce29a7da84cd
>> ("sched/topology: Refinement to topology_span_sane speedup") works on
>> the "sched_domain_topology_level" hierarchy to detect overlap in
>> !SDTL_OVERLAP domains using the tl->mask() as opposed to the
>> sched_domain hierarchy (and the sched_domain_span()) in the previous
>> approach.
>>
> 
> The previous approach also used tl->mask() directly, but it happened
> to be called *before* the build_sched_domain() loop, so the NODE iteration
> happened with sched_domain_curr_level at its default static value of
> 0... For the first SD build that is, I assume that was then broken for any
> subsequent rebuild.

Oh right! I read it wrong. My bad. topology_span_sane() being called
before build_sched_domain() always worked on "sched_domains_curr_level"
of the previous domain and could potentially cause an issue during
rebuild if we start from the NODE domain.

> 
>> For NODE domain, the cpumask retunred by tl->mask() depends on the
>> "sched_domains_curr_level". Unless the "sched_domains_curr_level" is
>> reset during topology_span_sane(), it reflects the "numa_level" of the
>> last sched_domain created which is incorrect.
>>
>> Reset the "sched_domains_curr_level" to the "tl->numa_level" during
>> topology_span_sane(). Although setting "topology_span_sane" to 0 in
>> topology_span_sane() should be enough since all domains with
>> numa_level > 0 currently set SDTL_OVERLAP flag, setting it to
>> "tl->numa_level" makes it more explicit and future proof against changes
>> in the same area.
>>
>> Cc: Steve Wahl <steve.wahl@hpe.com>
>> Reported-by: Leon Romanovsky <leon@kernel.org>
>> Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/
>> Fixes: ce29a7da84cd ("sched/topology: Refinement to topology_span_sane speedup")
> 
> Per the above, this could probably be:
> 
> Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap")

I'll update this in the next version.

> 
>> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
>> ---
>> This issue can be reproduced on a setup with the following NUMA topology
>> shared by Leon:
>>
>>      $ sudo numactl -H
>>      available: 5 nodes (0-4)
>>      node 0 cpus: 0 1
>>      node 0 size: 2927 MB
>>      node 0 free: 1603 MB
>>      node 1 cpus: 2 3
>>      node 1 size: 3023 MB
>>      node 1 free: 3008 MB
>>      node 2 cpus: 4 5
>>      node 2 size: 3023 MB
>>      node 2 free: 3007 MB
>>      node 3 cpus: 6 7
>>      node 3 size: 3023 MB
>>      node 3 free: 3002 MB
>>      node 4 cpus: 8 9
>>      node 4 size: 3022 MB
>>      node 4 free: 2718 MB
>>      node distances:
>>      node   0   1   2   3   4
>>        0:  10  39  38  37  36
>>        1:  39  10  38  37  36
>>        2:  38  38  10  37  36
>>        3:  37  37  37  10  36
>>        4:  36  36  36  36  10
>>
>>
>> This topology can be emulated using QEMU with the following cmdline used
>> in my testing:
>>
>>       sudo ~/dev/qemu/build/qemu-system-x86_64 -enable-kvm \
>>       -cpu host \
>>       -m 20G -smp cpus=10,sockets=10 -machine q35 \
>>       -object memory-backend-ram,size=4G,id=m0 \
>>       -object memory-backend-ram,size=4G,id=m1 \
>>       -object memory-backend-ram,size=4G,id=m2 \
>>       -object memory-backend-ram,size=4G,id=m3 \
>>       -object memory-backend-ram,size=4G,id=m4 \
>>       -numa node,cpus=0-1,memdev=m0,nodeid=0 \
>>       -numa node,cpus=2-3,memdev=m1,nodeid=1 \
>>       -numa node,cpus=4-5,memdev=m2,nodeid=2 \
>>       -numa node,cpus=6-7,memdev=m3,nodeid=3 \
>>       -numa node,cpus=8-9,memdev=m4,nodeid=4 \
>>       -numa dist,src=0,dst=1,val=39 \
>>       -numa dist,src=0,dst=2,val=38 \
>>       -numa dist,src=0,dst=3,val=37 \
>>       -numa dist,src=0,dst=4,val=36 \
>>       -numa dist,src=1,dst=0,val=39 \
>>       -numa dist,src=1,dst=2,val=38 \
>>       -numa dist,src=1,dst=3,val=37 \
>>       -numa dist,src=1,dst=4,val=36 \
>>       -numa dist,src=2,dst=0,val=38 \
>>       -numa dist,src=2,dst=1,val=38 \
>>       -numa dist,src=2,dst=3,val=37 \
>>       -numa dist,src=2,dst=4,val=36 \
>>       -numa dist,src=3,dst=0,val=37 \
>>       -numa dist,src=3,dst=1,val=37 \
>>       -numa dist,src=3,dst=2,val=37 \
>>       -numa dist,src=3,dst=4,val=36 \
>>       -numa dist,src=4,dst=0,val=36 \
>>       -numa dist,src=4,dst=1,val=36 \
>>       -numa dist,src=4,dst=2,val=36 \
>>       -numa dist,src=4,dst=3,val=36 \
>>       ...
>>
> 
> It's a bit of a mouthful but I would keep that in the changelog itself
> given that it's part of reproducing the bug.

Sure thing!

> 
>>
>> Changes are based on tip:sched/urgent at commit 914873bc7df9 ("Merge tag
>> 'x86-build-2025-05-25' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
>> ---
>>   kernel/sched/topology.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
>> index a2a38e1b6f18..1d634862c8df 100644
>> --- a/kernel/sched/topology.c
>> +++ b/kernel/sched/topology.c
>> @@ -2426,6 +2426,15 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
>>                cpumask_clear(covered);
>>                cpumask_clear(id_seen);
>>
>> +#ifdef CONFIG_NUMA
>> +		/*
>> +		 * Reuse the sched_domains_curr_level hack since
>> +		 * tl->mask() below can resolve to sd_numa_mask()
>> +		 * for the NODE domain.
>> +		 */
>> +		sched_domains_curr_level = tl->numa_level;
>> +#endif
>> +
> 
> Urgh... Given this is now invoked after the build_sched_domain() loop, what
> if we directly used the sched_domain_span(), instead, i.e. use
> 
>     sched_domain_mask(per_cpu_ptr(tl->data->sd, cpu))
> 
> instead of
> 
>     tl->mask(id)
> 
> which means no indrect use of sched_domains_curr_level. Note that I'm
> currently running out of brain juice so this might be a really stupid idea :-)

Let me go try that! It should also help detect overlap in case
build_sched_domain() has fixed up domain spans when the child's span is
not a subset of the parent's span.

> 
>>                /*
>>                 * Non-NUMA levels cannot partially overlap - they must be either
>>                 * completely equal or completely disjoint. Otherwise we can end up
>>
>> base-commit: 914873bc7df913db988284876c16257e6ab772c6
>> --
>> 2.34.1
> 

-- 
Thanks and Regards,
Prateek

