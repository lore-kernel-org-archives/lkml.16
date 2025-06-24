Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334ED30E84D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750741258; cv=fail; b=GHsNaAg1JVCZz5PrN8Pj9BRgb7VC0rFzchYCjGSIOWe7eFK1wwTH45ofND04KNLvBd/ER6n4aBmKCxpHYOP4R3cAuYmmQimWxahhcpfgySorxxLND92AdmwBFcgcH6RmxvszYNOFZ3Nw9jsFWAD7tdBLr5TvgP0sN9Em4XCR4GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750741258; c=relaxed/simple;
	bh=C3umYLVacCxaqrwXZXc6R7Aad7sJpJzwYEKCrwh1Apo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OLulm1t74eqwhktYrIjYDB23ssfC2R8XdR/Yn3wGM0GPHfTEB4Yf0/zGKJ+Bi1FEOlh/Oc3OruwzZoFhUQ6Il8kZVy/r5TH9rmSKoWYdGAwiuVILo7hqgP7lI2UuJhEPUgVA6cbecQW3r0KlJLcqJsO6zdt4S9aGnXjxHpJf73E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ijZcwOxM; arc=fail smtp.client-ip=40.107.220.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ijZcwOxM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0Wupa9elZ7V2Bz6hrNRnLJMD5wZ/pT4T+wOthid+g70g0/JNVtfL1RmAGJ7GtvsNpU+6Hznk6k1wENYcNxzo7vKLdqFLiXXhxjxa9am6wn33sdrnhci7GEosY0jTZjursVIbTpVfqZpfP9jzcrQISOYL1nF3c3tPSfYZ4xbQhJZmO6Zk7f3fZNTBac+OPKBdn5Pqes32XWqns7YQQiD029L+JKbYpNSfk4pZV4Zfi+czCwLLgHZ2QTA9yh17Z97AmP4vxZy/rA5rnMfPavW68xZgaIhmpDn0CQNKfIGEV2UEJh6sLftt40hUeDAL0Ap5ITWu+xW6NzlDn6wlEdQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdPz2rJYJ0c8gQO5kJYnNLzeFYEixiOPvC3PAWNDPJk=;
 b=ofvOPtE7oplCYDtWtcIgx9Wn9LnQo5AfaMta/KRXwuBvp1Zz8Va/JRs8z6hhaMcqKLsBPgvoiW8DetARqUHkPZTPqXjW/XDNDmGC7ljgUN1gvVf0SNbWsM8IGbTyDhjuhy5fhdhDDxlzJopTWQfllfKA4ON7u4Z4Cbq3HIaTv43XLjx8uYV6iWIY+0Piy5kq705NEPxJWIzas+jLnVzLO2yVc+UqAr3N+O/A64thPOBqsSeCi/cNeECKbaV9m2LUseJt2gHYgylPg9H93afSQU13FwUa/cJGLCkVKDcRdjrTvdyv01dtbraomI6hyo8xOOfmHnN+RrQnDO2DBiCW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdPz2rJYJ0c8gQO5kJYnNLzeFYEixiOPvC3PAWNDPJk=;
 b=ijZcwOxMacX8IlE/V/ztUShPBZjHJ4ge7w7yRyrTzqCCe2WXITj+bPo3yg4GADpnqIohfo3cgTvC+t/WQ8pWCGVsj6oRv9EAI5mLMr8KB3eCxZ8QnZNPCNftQHe7n38oUvAwDA83EjZ6e7p8v0CiA+GnhdoqTkSm0Y/hmbAsQNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 24 Jun
 2025 05:00:54 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Tue, 24 Jun 2025
 05:00:53 +0000
Message-ID: <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
Date: Tue, 24 Jun 2025 10:30:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: Tim Chen <tim.c.chen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
 linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::11) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 91cc4251-968f-47a5-1d82-08ddb2dc18a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTJPa001dUhKZ1Nka1cvWDVnSzJlY1F0UFRBUWRoUkN4WjhFQlE3YUc1TFE2?=
 =?utf-8?B?eFpoWFhQNEdWSkdJcUk3YndNbzgyeGxFUEkwT2Rzc0tVK0RQZnpWZ2FkU2hF?=
 =?utf-8?B?ZjEraFZ2am9rdEp2YUtkVUtocXExNDJvd1liUVRuSnJWbXp1OUtXWll0ZTBv?=
 =?utf-8?B?a0E4ODhlbVNhbHhoUTZCVkIvSUxNSVdQRDJFZDU0N2YxOFl1QmpOMVgrMldC?=
 =?utf-8?B?SFNHM2QyS3lPV0R1WDREUDQyczNsTThpdWRyZTJUT0lZMFh5RCtXdldaWVVl?=
 =?utf-8?B?Vml5RWlqdGE1bXVpK3pFYW12K0FTc1IwaEgxbksvMEVXaWpaWkhzY1dIWkFQ?=
 =?utf-8?B?ZzhIUE4rUTRnRDkwS1doYjRoRWc2RHdYWDBDTDNvVDlUZXR0M1Z0cHRvUnJ6?=
 =?utf-8?B?QldqZGNtcHBKU080KzAydHBOUDZJSE90djQrdGpPSWRzWnh1L050NTlYZHVu?=
 =?utf-8?B?RC92N25TcXFuL0hDR3JnZXY5c0ZmNEEraTN4YjEzMmx1Y21weVJxN3hwZ215?=
 =?utf-8?B?NTlKbUVzbThqRmQwM0pyZVFCbmJIRGl0NUNXdmlBN3pwTEJjR09EZWlrOGxy?=
 =?utf-8?B?SjVlK3oxVnJPQlBySVRnWmRpemdKU3BzTHJlT21xV0FGd05aTm43WVU3M1JI?=
 =?utf-8?B?c1gzL2k1YVVGdWNMR2RzZloxSWMvZGxYTW5RNVJaTVAxb0JBWWdPcEkwRmxj?=
 =?utf-8?B?VTE1SERmalVUTWJabWFITXp5RUM1WlVFYVZQaDZXM2czSmwyWnJBZFprUW9v?=
 =?utf-8?B?bUNYRW1oQjB5TGpKUmt2MmRPOHg5em5VL2t4cng2ZUM3NXA1RmhwRG10Q2hh?=
 =?utf-8?B?UTdXdFRaYWkvOU8vZkJFQ2RZRjdVM1owdDJNRmUzVEJ1bHpFeXRNYW5TV0Zi?=
 =?utf-8?B?V3RVK0tLcjZidXQzdTRDLzNyMk1GNytHanVmbzB6bXZIbDI3ZHkvV0dwemw3?=
 =?utf-8?B?aFl1czJndjlkamJEeVphZThWTXZCOERmcFJueUxtdmhIYVpEZGM3NklxdzB3?=
 =?utf-8?B?REcvdjN0ejRyRy9YS2J2WlZObXg2aXk0elRnVjRKU1RDaHZZRmpmNk5HZ2NN?=
 =?utf-8?B?eFROZUMvcnJhN21udXl5eFF5RUlqSk4xMGJRNVNNcGxQaGluWDcxbVlpWWYw?=
 =?utf-8?B?NGIwK2pEajZaMGRjUXNmTmhuL2JDSDRodHhYVFNVSWE4RjNCZ2dKV1NZTjMv?=
 =?utf-8?B?aVAxQzBFcEZqank2ZjdpVEw3NTdRZUNXc1hWWm9XNUpreU45akZEK1krMnZx?=
 =?utf-8?B?SkZxSW9mVG5iQ25VK2xmOG1tM0MzbVcxMWZjWHJIM1didGxiSnZkSWFQQU01?=
 =?utf-8?B?M2ZrazN1eE1oYVluTTNaWUM5emVwSGRYYVV6ejBtM1JrVTM0UENhVysvdzdR?=
 =?utf-8?B?VVNqSVJYZzJxSE1QemYrN3FVVldlcXpvOExjVGFRN0ppL1crVklZc3NLTUpX?=
 =?utf-8?B?YkhoM3QrRkQyemVWMnd6MERSbkRjR2xHNkkxeldJeEJsVjAyR25kRHplTjlW?=
 =?utf-8?B?aUxiakcxTEJiM2NRdFNqa1AwaVpSWEx6ZkQrOEd6VUtnbUFLZldncTgrZ29U?=
 =?utf-8?B?SHM0MkZCZ2hwdElycitORlZ5WHBmaGtkZHFIV2V5SUZ2NmJUZGhDZDJCaXkz?=
 =?utf-8?B?RTJsNm4wQVRZNUIwQ1FKYUt2TEk1NGR3d0dsTFVSNWt4cGcrblpDY21BYUpK?=
 =?utf-8?B?ekUwZVQ2SlVvUlZlTjBXUG5uYlFxZjd6TjNnK0tIN1pqV2NIVFpnUHA4UTQx?=
 =?utf-8?B?dkQvbWV4QzcrbkxsYjJKdGFITDJWZ1FsQ3luSlhGM0w4dWtsZ1I2azRSeVZq?=
 =?utf-8?B?WW9VSzg0bXFSTjJPMmpBSUllNldXSmF4M29XY0ZhOVYxOUhrM3EzZW52WHYv?=
 =?utf-8?B?aVQ3UlJPV2kwbi9HVXd6S1pFUEcwVXMwbEFuUzhMbjh1UDZSMXlBRWxUNXhB?=
 =?utf-8?Q?XrjKm+O54Kg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1ZIQ0RJWG9XYy9ScUcvdkhFekFtTytaMUw1ekVKWXVGdHF5bytvMFZ2LzlP?=
 =?utf-8?B?YjFvc3EzcklJTkFydkx5U3pPTGJXSGwxV3pzMyszbXQwOXp1aFg5WWJNQzdo?=
 =?utf-8?B?R1NhWWU5KzhRcU03ckhrYmUzcjAwTHBFbzU2T0h6TGFKK3lEc2oycExkbDRI?=
 =?utf-8?B?RldIZUQ2RW84eDdybHhmZTE2OEgyOU1PWTg1aGtQK0R1cmhkMlJXTWRjRVZz?=
 =?utf-8?B?UXBMNTBnVzR1UjBMTE9xMVFNbFBhYTQ0QjBQNFhTZmlxZ2I2bUFRdEs5OEJp?=
 =?utf-8?B?ZURVN2ZtV0NCOUMxdHNNK3IxWFNLeERLZWIvVFdzbUc4QUVxcG9lSkRKeHZy?=
 =?utf-8?B?eU5RSkdNb1BSL2dlOGpRdS9paGFxUWg2Y0JJUTJNVGFuYzZHNXBESkpONzBm?=
 =?utf-8?B?ZnZoZTU0ZWlHMC81RlFhNFBncmJlWlhtVGlJT0VQMDVKdGhTYU91MFF2VnBB?=
 =?utf-8?B?T0NseHhTVUM5NkdIdkFZRk1nZ0JJNFJSUGY0dy9GMTBIY3BLMk0yemFOT2Rn?=
 =?utf-8?B?Q2xVMVNXQmpLTHkwc2tUNXZPWXhhNytLbC9TMmYraC9UUFMrenhlRktra1VS?=
 =?utf-8?B?QXcwZGRtUUlMSnRHRDRLOUtDZnhyVjF4cEU0K1ludUpremp0OXlnTFp4bE9y?=
 =?utf-8?B?eHBuNzlrTmpxbTR5WXdHVW52Y050ZUVmOXo0OVpzSFFkSHdIaW4wcFhRZmtt?=
 =?utf-8?B?WE5Vd1l0QVBEUFByQ3liVmpUTEFoYlhUaUtMWHM3c1dmcGI4cWhxbVVPdVla?=
 =?utf-8?B?V3JuczVjOGFDa29QVG15WXl3ZDl0UXJwY3c3aDZrUG9XRGdWZU5MT3l5UlBl?=
 =?utf-8?B?ZUVwV1pJNjBaMmJBNXFLRG4venN5ZlZ2RWdRSitSZjRTR0F2NTIxb043cTls?=
 =?utf-8?B?cDM0K2FGeG84L1JnZktlanJYZDlxdDBJMEFOR1NNcjdQWFk1RVRIMTF3OVll?=
 =?utf-8?B?Z3NPcGJxZ0tIMGtnbHFucDVVZEUwTnhpeTEvc1JrcTVEalBQRGRLeWlraXNs?=
 =?utf-8?B?dXpuSGhCVXFsQlhING5CUXB6VFJVdzE2M0pwYVpmUXRyRkpnOVFvallTWWly?=
 =?utf-8?B?ci8zZ3lBZzVHaC9ZSDQzQ0o5SzNyZVIzMDVHUEx3MmJKdXpwSU5QWmsxcFc3?=
 =?utf-8?B?UnZGTllJU0RJMGpBQ1dqRzd3R29uNG5ZeDBNdVZ0cWI5RmxxTk1Vdm94ak1z?=
 =?utf-8?B?MjIzakoyN1M0ODZlbEsyc1JVZ2dMTHJvbFB2MDZIWlRhelc4OEY0NXNmRlBU?=
 =?utf-8?B?WEtVWjNOTXppK1BhL0lCVkpkVS9TM0R2bzArR0crZjlrK3dKekg4cUZVQ2xX?=
 =?utf-8?B?RWIvYXVBcDFMQXQyN0EwdDNpSzBHbVhVMHVTM0ZMNEQrMEVxRGJBNmM2akJR?=
 =?utf-8?B?clp4WkhsbzhYWFJ3V3liNmVhRHdPYzRtKzV3YzM4U25CU0lUR0xvTWNpbGJG?=
 =?utf-8?B?Uk13ZGlrYmtxVktHalUvQ0NtNkYwUThoVm5pLytyRWNqK0VxS2R6WVprVytQ?=
 =?utf-8?B?QzVqV3ZleWhVT0tYNENka2J0a3h1b0krazNlc1VETVhkZzVoRTRzeVB4RkQ4?=
 =?utf-8?B?dHhZMGFOZXVidGNrUGFzVFRuUW9qUC9DcUpVaWFncnFnOHJBZjgyUTQ4ak81?=
 =?utf-8?B?VkNSUTZyTlU2MUduR1BMUkZBeUxvWmY1eStxSWc1dWhITXVUaGdpVHN2eWI1?=
 =?utf-8?B?L3BMajdzdWp4WnQ3RFFJZHRsdEg4WkptcXNiQTFybWoxSWE2WDFybk92bEht?=
 =?utf-8?B?Rkk0MVc2WnNseDBvdVJLcGc1Q29XRmk4OW1zcWlLKzJiYkVlaWowcXdITXNK?=
 =?utf-8?B?ZW5YbEpTQklSNlQwTUx5ekVDSEV6NW5Sb2xreC9KUytkWjdzWlBsTEJ0UDdm?=
 =?utf-8?B?VzdCRWt6b2o0RElIMHlPd1V4em52cjRmRFJjWG5kQjZxZDVlQUNZZW12S0ti?=
 =?utf-8?B?SGp5bndrYTFVdGcvZnhEVS9Yb2Y2SXh3M2Fad2pGbzJvY1IyUzRIMUpTSDNS?=
 =?utf-8?B?MG04S2FJcXpvZCtGYVV6Yk9VN0hMcGNDVDA4QktBL3dCSEIrWjJZSGtES0tj?=
 =?utf-8?B?Y2c3dlAzVGJLeDMxRSt5V3RCZnUrZko3K3AzN0xqaWo3MllvZFJRLzUwWFo1?=
 =?utf-8?Q?cOifQMlh2K+riq8WjBV90h9Ih?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cc4251-968f-47a5-1d82-08ddb2dc18a4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:00:53.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqrWwoVaioHzl8glbBqvUvvboVz0LDftXWYIehhKOncId5lJ0wgNLVBt8el2ng8M20ahZZoLkkh/w52Soucz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663

Hello Tim,

On 6/18/2025 11:57 PM, Tim Chen wrote:
> AMD Milan is also tested. There are 4 Nodes and 32 CPUs per node.
> Each node has 4 CCX(shared LLC) and each CCX has 8 CPUs. Hackbench
> with 1 group test scenario benefits from cache aware load balance
> too:
> 
> hackbench(1 group and fd ranges in [1,6]:
> case                    load            baseline(std%)  compare%( std%)
> threads-pipe-1          1-groups         1.00 (  1.22)   +2.84 (  0.51)
> threads-pipe-2          1-groups         1.00 (  5.82)  +42.82 ( 43.61)
> threads-pipe-3          1-groups         1.00 (  3.49)  +17.33 ( 18.68)
> threads-pipe-4          1-groups         1.00 (  2.49)  +12.49 (  5.89)
> threads-pipe-5          1-groups         1.00 (  1.46)   +8.62 (  4.43)
> threads-pipe-6          1-groups         1.00 (  2.83)  +12.73 (  8.94)
> threads-sockets-1       1-groups         1.00 (  1.31)  +28.68 (  2.25)
> threads-sockets-2       1-groups         1.00 (  5.17)  +34.84 ( 36.90)
> threads-sockets-3       1-groups         1.00 (  1.57)   +9.15 (  5.52)
> threads-sockets-4       1-groups         1.00 (  1.99)  +16.51 (  6.04)
> threads-sockets-5       1-groups         1.00 (  2.39)  +10.88 (  2.17)
> threads-sockets-6       1-groups         1.00 (  1.62)   +7.22 (  2.00)
> 
> Besides a single instance of hackbench, four instances of hackbench are
> also tested on Milan. The test results show that different instances of
> hackbench are aggregated to dedicated LLCs, and performance improvement
> is observed.
> 
> schbench mmtests(unstable)
>                                    baseline              nowake_lb
> Lat 50.0th-qrtle-1         9.00 (   0.00%)        8.00 (  11.11%)
> Lat 90.0th-qrtle-1        12.00 (   0.00%)       10.00 (  16.67%)
> Lat 99.0th-qrtle-1        16.00 (   0.00%)       14.00 (  12.50%)
> Lat 99.9th-qrtle-1        22.00 (   0.00%)       21.00 (   4.55%)
> Lat 20.0th-qrtle-1       759.00 (   0.00%)      759.00 (   0.00%)
> Lat 50.0th-qrtle-2         9.00 (   0.00%)        7.00 (  22.22%)
> Lat 90.0th-qrtle-2        12.00 (   0.00%)       12.00 (   0.00%)
> Lat 99.0th-qrtle-2        16.00 (   0.00%)       15.00 (   6.25%)
> Lat 99.9th-qrtle-2        22.00 (   0.00%)       21.00 (   4.55%)
> Lat 20.0th-qrtle-2      1534.00 (   0.00%)     1510.00 (   1.56%)
> Lat 50.0th-qrtle-4         8.00 (   0.00%)        9.00 ( -12.50%)
> Lat 90.0th-qrtle-4        12.00 (   0.00%)       12.00 (   0.00%)
> Lat 99.0th-qrtle-4        15.00 (   0.00%)       16.00 (  -6.67%)
> Lat 99.9th-qrtle-4        21.00 (   0.00%)       23.00 (  -9.52%)
> Lat 20.0th-qrtle-4      3076.00 (   0.00%)     2860.00 (   7.02%)
> Lat 50.0th-qrtle-8        10.00 (   0.00%)        9.00 (  10.00%)
> Lat 90.0th-qrtle-8        12.00 (   0.00%)       13.00 (  -8.33%)
> Lat 99.0th-qrtle-8        17.00 (   0.00%)       17.00 (   0.00%)
> Lat 99.9th-qrtle-8        22.00 (   0.00%)       24.00 (  -9.09%)
> Lat 20.0th-qrtle-8      6232.00 (   0.00%)     5896.00 (   5.39%)
> Lat 50.0th-qrtle-16        9.00 (   0.00%)        9.00 (   0.00%)
> Lat 90.0th-qrtle-16       13.00 (   0.00%)       13.00 (   0.00%)
> Lat 99.0th-qrtle-16       17.00 (   0.00%)       18.00 (  -5.88%)
> Lat 99.9th-qrtle-16       23.00 (   0.00%)       26.00 ( -13.04%)
> Lat 20.0th-qrtle-16    10096.00 (   0.00%)    10352.00 (  -2.54%)
> Lat 50.0th-qrtle-32       15.00 (   0.00%)       15.00 (   0.00%)
> Lat 90.0th-qrtle-32       25.00 (   0.00%)       26.00 (  -4.00%)
> Lat 99.0th-qrtle-32       49.00 (   0.00%)       50.00 (  -2.04%)
> Lat 99.9th-qrtle-32      945.00 (   0.00%)     1005.00 (  -6.35%)
> Lat 20.0th-qrtle-32    11600.00 (   0.00%)    11632.00 (  -0.28%)
> 
> Netperf/Tbench have not been tested yet. As they are single-process
> benchmarks that are not the target of this cache-aware scheduling.
> Additionally, client and server components should be tested on
> different machines or bound to different nodes. Otherwise,
> cache-aware scheduling might harm their performance: placing client
> and server in the same LLC could yield higher throughput due to
> improved cache locality in the TCP/IP stack, whereas cache-aware
> scheduling aims to place them in dedicated LLCs.

I have similar observation from my testing.

tl;dr

o Benchmark that prefer co-location and run in threaded mode see
   a benefit including hackbench at high utilization and schbench
   at low utilization.

o schbench (both new and old but particularly the old) regresses
   quite a bit on the tial latency metric when #workers cross the
   LLC size.

o client-server benchmarks where client and servers are threads
   from different processes (netserver-netperf, tbench_srv-tbench,
   services of DeathStarBench) seem to noticeably regress due to
   lack of co-location between the communicating client and server.

   Not sure if WF_SYNC can be an indicator to temporarily ignore
   the preferred LLC hint.

o stream regresses in some runs where the occupancy metrics trip
   and assign a preferred LLC for all the stream threads bringing
   down performance in !50% of the runs.

Full data from my testing is as follows:

o Machine details

- 3rd Generation EPYC System
- 2 sockets each with 64C/128T
- NPS1 (Each socket is a NUMA node)
- C2 Disabled (POLL and C1(MWAIT) remained enabled)

o Kernel details

tip:	  tip:sched/core at commit 914873bc7df9 ("Merge tag
            'x86-build-2025-05-25' of
            git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")

llc-aware-lb-v3: tip + this series as is

o Benchmark results

     ==================================================================
     Test          : hackbench
     Units         : Normalized time in seconds
     Interpretation: Lower is better
     Statistic     : AMean
     ==================================================================
     Case:           tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
      1-groups     1.00 [ -0.00](13.74)     1.03 [ -2.77](12.01)
      2-groups     1.00 [ -0.00]( 9.58)     1.02 [ -1.78]( 6.12)
      4-groups     1.00 [ -0.00]( 2.10)     1.01 [ -0.87]( 0.91)
      8-groups     1.00 [ -0.00]( 1.51)     1.03 [ -3.31]( 2.06)
     16-groups     1.00 [ -0.00]( 1.10)     0.95 [  5.36]( 1.67)


     ==================================================================
     Test          : tbench
     Units         : Normalized throughput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:    tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
         1     1.00 [  0.00]( 0.82)     0.96 [ -3.68]( 1.23)
         2     1.00 [  0.00]( 1.13)     0.98 [ -2.30]( 0.51)
         4     1.00 [  0.00]( 1.12)     0.96 [ -4.14]( 0.22)
         8     1.00 [  0.00]( 0.93)     0.96 [ -3.61]( 0.46)
        16     1.00 [  0.00]( 0.38)     0.95 [ -4.98]( 1.26)
        32     1.00 [  0.00]( 0.66)     0.93 [ -7.12]( 2.22)
        64     1.00 [  0.00]( 1.18)     0.95 [ -5.44]( 0.37)
       128     1.00 [  0.00]( 1.12)     0.93 [ -6.78]( 0.64)
       256     1.00 [  0.00]( 0.42)     0.94 [ -6.45]( 0.47)
       512     1.00 [  0.00]( 0.14)     0.93 [ -7.26]( 0.27)
      1024     1.00 [  0.00]( 0.26)     0.92 [ -7.57]( 0.31)


     ==================================================================
     Test          : stream-10
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
      Copy     1.00 [  0.00]( 8.37)     0.39 [-61.05](44.88)
     Scale     1.00 [  0.00]( 2.85)     0.43 [-57.26](40.60)
       Add     1.00 [  0.00]( 3.39)     0.40 [-59.88](42.02)
     Triad     1.00 [  0.00]( 6.39)     0.41 [-58.93](42.98)


     ==================================================================
     Test          : stream-100
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
      Copy     1.00 [  0.00]( 3.91)     0.36 [-63.95](51.04)
     Scale     1.00 [  0.00]( 4.34)     0.40 [-60.31](43.12)
       Add     1.00 [  0.00]( 4.14)     0.38 [-62.46](43.40)
     Triad     1.00 [  0.00]( 1.00)     0.36 [-64.38](43.12)


     ==================================================================
     Test          : netperf
     Units         : Normalized Througput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:         tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
      1-clients     1.00 [  0.00]( 0.41)     0.97 [ -3.26]( 1.30)
      2-clients     1.00 [  0.00]( 0.58)     0.96 [ -4.24]( 0.71)
      4-clients     1.00 [  0.00]( 0.35)     0.96 [ -4.19]( 0.67)
      8-clients     1.00 [  0.00]( 0.48)     0.95 [ -5.41]( 1.36)
     16-clients     1.00 [  0.00]( 0.66)     0.95 [ -5.31]( 0.93)
     32-clients     1.00 [  0.00]( 1.15)     0.94 [ -6.43]( 1.44)
     64-clients     1.00 [  0.00]( 1.38)     0.93 [ -7.14]( 1.63)
     128-clients    1.00 [  0.00]( 0.87)     0.89 [-10.62]( 0.78)
     256-clients    1.00 [  0.00]( 5.36)     0.92 [ -8.04]( 2.64)
     512-clients    1.00 [  0.00](54.39)     0.88 [-12.12](48.87)


     ==================================================================
     Test          : schbench
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
       1     1.00 [ -0.00]( 8.54)     0.54 [ 45.65](28.79)
       2     1.00 [ -0.00]( 1.15)     0.56 [ 44.00]( 2.09)
       4     1.00 [ -0.00](13.46)     0.67 [ 33.33](35.68)
       8     1.00 [ -0.00]( 7.14)     0.63 [ 36.84]( 4.28)
      16     1.00 [ -0.00]( 3.49)     1.05 [ -5.08]( 9.13)
      32     1.00 [ -0.00]( 1.06)    32.04 [-3104.26](81.31)
      64     1.00 [ -0.00]( 5.48)    24.51 [-2351.16](81.18)
     128     1.00 [ -0.00](10.45)    14.56 [-1356.07]( 5.35)
     256     1.00 [ -0.00](31.14)     0.95 [  4.80](20.88)
     512     1.00 [ -0.00]( 1.52)     1.00 [ -0.25]( 1.26)


     ==================================================================
     Test          : new-schbench-requests-per-second
     Units         : Normalized Requests per second
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
       1     1.00 [  0.00]( 1.07)     0.97 [ -3.24]( 0.98)
       2     1.00 [  0.00]( 0.00)     0.99 [ -1.17]( 0.15)
       4     1.00 [  0.00]( 0.00)     0.96 [ -3.50]( 0.56)
       8     1.00 [  0.00]( 0.15)     0.98 [ -1.76]( 0.31)
      16     1.00 [  0.00]( 0.00)     0.94 [ -6.13]( 1.93)
      32     1.00 [  0.00]( 3.41)     0.97 [ -3.18]( 2.10)
      64     1.00 [  0.00]( 1.05)     0.82 [-18.14](18.41)
     128     1.00 [  0.00]( 0.00)     0.98 [ -2.27]( 0.20)
     256     1.00 [  0.00]( 0.72)     1.01 [  1.23]( 0.31)
     512     1.00 [  0.00]( 0.57)     1.00 [  0.00]( 0.12)


     ==================================================================
     Test          : new-schbench-wakeup-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
       1     1.00 [ -0.00]( 9.11)     0.88 [ 12.50](11.92)
       2     1.00 [ -0.00]( 0.00)     0.86 [ 14.29](11.92)
       4     1.00 [ -0.00]( 3.78)     0.93 [  7.14]( 4.08)
       8     1.00 [ -0.00]( 0.00)     0.83 [ 16.67]( 5.34)
      16     1.00 [ -0.00]( 7.56)     0.85 [ 15.38]( 0.00)
      32     1.00 [ -0.00](15.11)     0.80 [ 20.00]( 4.19)
      64     1.00 [ -0.00]( 9.63)     1.05 [ -5.00](24.47)
     128     1.00 [ -0.00]( 4.86)     1.57 [-56.78](68.52)
     256     1.00 [ -0.00]( 2.34)     1.00 [ -0.00]( 0.57)
     512     1.00 [ -0.00]( 0.40)     1.00 [ -0.00]( 0.34)


     ==================================================================
     Test          : new-schbench-request-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)    llc-aware-lb-v3[pct imp](CV)
       1     1.00 [ -0.00]( 2.73)     1.06 [ -5.71]( 0.25)
       2     1.00 [ -0.00]( 0.87)     1.08 [ -8.37]( 0.78)
       4     1.00 [ -0.00]( 1.21)     1.09 [ -9.15]( 0.79)
       8     1.00 [ -0.00]( 0.27)     1.06 [ -6.31]( 0.51)
      16     1.00 [ -0.00]( 4.04)     1.85 [-84.55]( 5.11)
      32     1.00 [ -0.00]( 7.35)     1.52 [-52.16]( 0.83)
      64     1.00 [ -0.00]( 3.54)     1.06 [ -5.77]( 2.62)
     128     1.00 [ -0.00]( 0.37)     1.09 [ -9.18](28.47)
     256     1.00 [ -0.00]( 9.57)     0.99 [  0.60]( 0.48)
     512     1.00 [ -0.00]( 1.82)     1.03 [ -2.80]( 1.16)


     ==================================================================
     Test          : Various longer running benchmarks
     Units         : %diff in throughput reported
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     Benchmarks:                  %diff
     ycsb-cassandra              -0.99%
     ycsb-mongodb                -0.96%
     deathstarbench-1x           -2.09%
     deathstarbench-2x           -0.26%
     deathstarbench-3x           -3.34%
     deathstarbench-6x           -3.03%
     hammerdb+mysql 16VU         -2.15%
     hammerdb+mysql 64VU         -3.77%

> 
> This patch set is applied on v6.15 kernel.
>   
> There are some further work needed for future versions in this
> patch set.  We will need to align NUMA balancing with LLC aggregations
> such that LLC aggregation will align with the preferred NUMA node.
> 
> Comments and tests are much appreciated.

I'll rerun the test once with the SCHED_FEAT() disabled just to make
sure I'm not regressing because of some other factors. For the major
regressions, I'll get the "perf sched stats" data to see if anything
stands out.

I'm also planning on getting the data from a Zen5c system with larger
LLC to see if there is any difference in the trend (I'll start with the
microbenchmarks since setting the larger ones will take some time)

Sorry for the lack of engagement on previous versions but I plan on
taking a better look at the series this time around. If you need any
specific data from my setup, please do let me know.

-- 
Thanks and Regards,
Prateek

