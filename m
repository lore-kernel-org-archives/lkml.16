Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5274292B40
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152154; cv=fail; b=Sgmh8KaovzlWaGtL+/wghfk0LNY8SAgJ2B4/i2J2buDVJqffF8AKuUR2pG6tr1xvKG8TMPizcoJ+fuRTr118TtKLeptA2aXS7KEsahq8Tm/D/cqhvpmyLKmx2hdvQFjY6PaCQ/60lDWMA3iCSqF1C7A0LQfIqHU44Lbq/RFBfBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152154; c=relaxed/simple;
	bh=t41CEDnMaq5uXPj4WERzcY9rfCtHUr+D4PM4LpnZSbs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=toVSGsmJZ03Y1INF3rrwLFDWA72BPAWZoqzDfuG26hAOaOeoUtIxmvRifZ+bgOp9fJL/RYI34JI3VOterDb3nM3FOVC0mYTJG7xGiU3a96rb26kXzhOalv37TRkfAncaTYrwjb2hhaFmu/F2aYv55jPdprYKudCIelw7zlZyaVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3b4weJCT; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3b4weJCT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUpmJmWqHYSvTA+YSGLdA109YX042xU3CFU7vwMczFTD1HZG8YoOLX/T9R5fuAk+jITwVu0NVL9bbeo/S2AFhJHaFA4P29X3sPgSFYrIiTPPiMajgr07xKTEnMuIIEHOpO4EUsdo5gwo79bIPCs6RoPfRB3mm6ifIwH8mMLSpxo81AqgAG9nnZk7LzvIDgb8VczYN8sXhhQjILJacFj31pI3YR6d2EAhNKYw+NRspaDe/Z0dHyBTY56596keE0uZK5+J2UQ6cD7RVa5Knt21wnLS+WI6c4VfpYOjOgPHDrW/X42LJh8GJTXBYonXGYpuHom+o/Pc7TU6RbbrtGvCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqZ1HqBiySoEhxrLA4azc5I/Kw5P6Y780UP638cM4Hw=;
 b=enr2Mzz0jydPPdQmFK3bZ9xS93BE/hRkUKw7Ft/76rFXuic9F6JXNzDvMy8z93jKn+9+y9s7NodN8Bv8DhTyZKYtH/aa7GGkezuIIHmKKmOp8u5iWDwgNKcXPZCSd/oEDVOj+Pe4ELDdpWvZB6CIRTHCJluAmBLVQJQfgjay8w9UoUtTLZ7CjI41ieM3kBFTtbmskuvMBEZZBNYDDuYFj+UKnKylCc0Aa8+FQfXa2nyQetvoNHkdbsfq3FMf/W5vFV7kiQh6TOWrYburMhArvbDAu4bcCAPcWk/UwZnLlzDM+crcTKvUXd1wPFymtjQPe+CrAt14lLoIR3jSlYn+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqZ1HqBiySoEhxrLA4azc5I/Kw5P6Y780UP638cM4Hw=;
 b=3b4weJCT3y23fNBmhcDmJ4MAagteRfOSFAjkKxInE6jvVBAC5U7g0digmNM/qglgZgVwORbXDjzIWCvFGQ+DVxNK2R25084JkFR5hM6dMvftQXs194Bz9Y2y1CphW0I8bwftk0nrDnt2IofwSl29KWHmCDbogY9/pOqGGI7nm/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:22:29 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Tue, 17 Jun 2025
 09:22:29 +0000
Message-ID: <dcc9a2de-95ee-466e-b6d4-64658e315781@amd.com>
Date: Tue, 17 Jun 2025 14:52:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
To: Leon Romanovsky <leon@kernel.org>, Steve Wahl <steve.wahl@hpe.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org, Vishal Chourasia <vishalc@linux.ibm.com>,
 samir <samir@linux.ibm.com>, Naman Jain <namjain@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 Michael Kelley <mhklinux@outlook.com>, Russ Anderson <rja@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>
References: <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com> <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
 <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
 <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>
 <20250615064207.GA750234@unreal> <aFAnwZLdGn8zrrqG@swahl-home.5wahls.com>
 <20250617073442.GG750234@unreal>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250617073442.GG750234@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::8) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d957c2-1557-4495-03f9-08ddad807aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkxyVFl2cHYzSEEyN1ZDVjlyS2plcC9Dbm9jaG91YWttUCtFU0tHUUtKZWJ3?=
 =?utf-8?B?RUQ1L3hPZEgzdGhXODRtdjcvanZqeCthRHo0L0RFRnJWQlo0R3NJZFRqMEEr?=
 =?utf-8?B?dk82S3l5WTMwSHBjMkNRYTMvaXRCeEMzYUpobE9oNHcrS3RxVUtnSHVZdDBH?=
 =?utf-8?B?QTBxSEs4aXkvRUpyRnA5WVBCZGw4WWxRMjZhbU8xQVovbFovUkQ5dGxLSmxx?=
 =?utf-8?B?SjlZV1d5RnRQTlE5dnJhaDZwQU9nTDdOdjdLQlJQckdBZi8zZ0QwNFU5NVhH?=
 =?utf-8?B?bWRGM3EzRnZhaWgvWGNrMUdiUmYxL0hxMWpXbnNDclNXeG9IQm1ESzZVOWlK?=
 =?utf-8?B?dWE4Q2FKVzN4ajQwUWdRUU00WGhYdm5kWFEveldtek9XZVQvMUhKYzlmZi96?=
 =?utf-8?B?dE9ERUpwdk84Q1k3S0VuQnRySm1zTUpQd2wyS3FvY2JVYzVlRlVKd0dZKytZ?=
 =?utf-8?B?cHJFRG4rNFRtbSs0RzduMEtmKzk4MDlsN2xhR0MveFMyRmpQSzRpWHRSeXhP?=
 =?utf-8?B?S0ordWN5cUlyUWN3Ry9QV2lFLysxLzMwUU45T2JqUDdERExlU0RlOUx2ZjVt?=
 =?utf-8?B?dFRSWjNNaHpPbmREcUdaQkZ1d3dqcXRRaUUrU04zVVUxejdkdCt1Mks5a3pk?=
 =?utf-8?B?ek9jUHlHOWNaQ2NnZW41RlcxUGVEcmJ4b0cxVmZaQ1FvdHkyNS9pcFdqVlln?=
 =?utf-8?B?TDBqK09Ma0dBdUJNZ2FXWVJaQVk3Q0xIWGd1Mjg0N08zQ1QyaDdrOWxqL2xi?=
 =?utf-8?B?b3M0NENxWWo3VzhpOHhOWlZscmkrRVhBdkpOZXpheS9pSWcxcG9YcmtnM2dN?=
 =?utf-8?B?UjNVcFgySXZ3RTVTQXdJblEwVHVWWmlab1lkUzBCY09URUVSeDBIc294SG5K?=
 =?utf-8?B?OXA0aVpyRVdZbHBnV3BwbnlSbHJpNU95UlM3Q2kvc1ZjOFhncUtTTUdJVS9i?=
 =?utf-8?B?WStRZU5XTzIrMEllWllTUzVzcFkxT3Z5dXlxVHpsVmQ1UjZxRFU3OXBFKy84?=
 =?utf-8?B?NzhlT0NhbjdqZmdveXVkbTB3OVVqR0kyQ0hEVjBRcE9qMnhwN3FDTitncFFs?=
 =?utf-8?B?VTJMUmhOZmZKbzNRZDA5ZWNHdzcxdjlabXBXeG5YVFpteDVNOTB6cjRTdFRz?=
 =?utf-8?B?SWMwcUZIKy9VV1NYWjdUMXpaVWcyRFpscGpVNyswbjVjTmh3SUI0U3g3dmlX?=
 =?utf-8?B?elJ0bm9RTkludlgrbXJsSTdSQW9mZnBYck9HTVlBSkJKWms1QTNERW9RMW41?=
 =?utf-8?B?cmViWjBaOUxURlB1RWZNOEx6WVNaTnpIWVhBQVJiN0c3dFozSDk3cTc1RUlQ?=
 =?utf-8?B?aHRrbzFaUkRKVU90ckFka3dYSkZtSVVpaTdmSHRwQjNRakRJQXZEZUpZM3R5?=
 =?utf-8?B?T2FnYmdKQnZzTE9aN0ZHQTBXbFNkV3cxMXFZcEQvM1N4elJ4enRycTF6bEgw?=
 =?utf-8?B?TUVMSFdEY1lFQjZpbTlwMlh0UnRub2JXdGVCNTNBWE5RMXdPRzZUWHl6enoy?=
 =?utf-8?B?a21IRFRvSW8wQ2cvR0ZydkFxWjROQXAwd1lMZXk4UmxyWTRRTFhvK1djUWdL?=
 =?utf-8?B?b0pOZUhNbkFuN0VaeWlua2hBeFNyVy9oSTEza2xnZVZqLzkzV0dmZFpDVEl5?=
 =?utf-8?B?L3NjQXFjOWpDOEFLMXZneG1uUjhDWm95T21GMHh6bUJFSDZOSWNJSDhqOERz?=
 =?utf-8?B?aitxVzlQalNCb0loK1p5UG9mQnMrVmFTVngvWmZUdXBDRUNieXlDL0tIWitp?=
 =?utf-8?B?RS9iejR3bWtUenU0TGlPRHQzS2w4Qjh0ZXg5Mk9EaHV1OW92UkhRSjBJVUlT?=
 =?utf-8?B?M1hqbmdxSHJuRnB0cGozVVdaR2tUUGZQS3FPclFhWGduTU4xaFhLRXRrdmtL?=
 =?utf-8?B?OVJlUGRXamgwdUZkYWF1YWxmRUt0TWg2RXdCc2J0TW9CYTZVbEhyNG1Mclcx?=
 =?utf-8?Q?pXbawJw3wgQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZsRk43aEVoejcvbnc0aEFGQ3l3WGxiUmRDeDZsUVB0TjQ3ZFNqQ282M01s?=
 =?utf-8?B?NWRwYlYva3FIR2FNSWtGbm9WSGhMUlhLOUlhL0NTSDU3QTVTdjZIRTlmQ0ph?=
 =?utf-8?B?czFXMUN3RW83cWhPQkc2Mm1OSjM0bzkrbG1mS1YvZmRpN3lCNmdPOWFHQUpB?=
 =?utf-8?B?Y09MM1NiR1Z5clFMZjJKNDU5RFI0cWEyMU9xODJhSFZnUFRxNm96ZldWQU9K?=
 =?utf-8?B?MDgxVjJ5UkFxWkxhdGlsVHgrNUhiQnRTQnhuNlRPY3FNdmVPbnVleGxxYWkv?=
 =?utf-8?B?SDRQbklJNDYyU2I2eTUvczkydGYvS2xqbUQyNHZuNTRoLzAyaTNzNjZuMTlw?=
 =?utf-8?B?eHBvNVp5V1VmRjhmTDRvemNUUWo3NCt3VmhwZzFlK0d4L1dJK1BZY01iaXZY?=
 =?utf-8?B?dlY4N2JUVDVNU05td3pXbjBkbGluWCtRL3BDSnlpQjFwVkQwWlZWWFJvbkp0?=
 =?utf-8?B?RGttV0IzUHpmWXp3UEF4ZzBaZUVWSlhZMEh1N3JLdi94WEE0VmdmZUNxVEYr?=
 =?utf-8?B?Z3Nad0JXSjlrK05PTXNHYTVkT3dFNGhpR3VXUW1hWnBGUndGeXFJL0JXdGNY?=
 =?utf-8?B?OENQSXBxODRSMTNNOHowNy9yUDhxZCtOeHBKYWNNSDVNYVd4TFJ4ZnVucUlp?=
 =?utf-8?B?WEsvUG0wQjRzSzgyek1TR24rekMwT1NvZFkyNSs4ZG1NTW5LVkE2ZGd5OEsv?=
 =?utf-8?B?bHhSWGVzZm4yV0ZSOFBYaEFwdHczcUs1NTBOVU93MDM4bUpaMWJFalhNNUls?=
 =?utf-8?B?YkNzQ0pPME9qMEJtL2EzbDN5cEJ5dXVoVEhRRnk1MmZrdGVRN0Z3MjhreWhW?=
 =?utf-8?B?OTNZbFFQaWhyaGdoNlFFcHFJdDVQY2Q3NG5xdUhaVGtGTFdoYzA1V1ovWWox?=
 =?utf-8?B?Z2REeDR4eWtnSlA2WkZBN2FoaDVtWVJSUWl5RXpXUEdERVFrWXdFZk1zaEdk?=
 =?utf-8?B?Yjlwa0p2U3RyVzJFMzM5OW8yMFN6VlNKbXZxMjlXaS85RVlvT2pVWThPWkJ6?=
 =?utf-8?B?YmdhQXYwUHRIRWxuRXVEMHMwcDd2c2xtRTFCekRTaDRXdmlwNTJKQ09IbS9K?=
 =?utf-8?B?a2QzaW1mVVJMaVJDSXNpcU83eDZCeml6eWFNTVZua2xGaGF4c1J4NFc3SVBr?=
 =?utf-8?B?Wmk3ZGZVSVVCMVZhLzFlQTFhcWUrUyt6MXA0bCtoY25TSkprZWROK2JTbkM3?=
 =?utf-8?B?YjNjOVF4V2tZd3UwOCtQVytCQ2xEbUxLaFZOQ0crQ0U0dVZCYzd1eTgvQTZF?=
 =?utf-8?B?UG9pdFA0dUtpWmU0REsxbm1IRDN3aUJmcmlYNUx5WUpsWlNmL21FUElXZVhJ?=
 =?utf-8?B?cmQwbW5YRWhxSDVzdmpYYVZHWi9mRGRGUlVPZkdvSVVTd0Q0dWUwZHlJK2RE?=
 =?utf-8?B?RDNvU1k4SnNrdjBuUXgzaTBNL043T09MS010cFFQQUpjTndxUFh1SVhVTkpG?=
 =?utf-8?B?OWg0RklvdjB2WmVnM3d6blhmWVhBMmFscEsySDJQV1F0V2lOcUJQWkRoVzhr?=
 =?utf-8?B?amxwSHJlcFZxcDdDYjFTdEo0R3YxdWhjVDF1SDhBVDBvdW9xZk1WdG10WDc4?=
 =?utf-8?B?cVN1WUJtTFA5dGMrdzNob3pFaWZkUWJ6UFMybWZGVTVGbllXdXc0ZE0xUTlF?=
 =?utf-8?B?Q1k3RlhxRXFWbGdlQnFOYWxjUEZIV3dqaXoybW9pTUVWNkRId1MrTTRlYjNz?=
 =?utf-8?B?TTRZWmFoNER5RmFDbXNiM1hodTgyK1Z6VmdVMlI5TEtJRjNTYlhxMnNsNW9w?=
 =?utf-8?B?RmxFekdwQmFsV3NPZHVmdm53aGp6bE1GUzZSejZJekgxV2pVSjlwT1NVODBm?=
 =?utf-8?B?NzdZWGh1SUJFMjhRSWFvaDF2bDJHeURobzJnZUZRTXRiaVAwa1JtUnZTSCts?=
 =?utf-8?B?ZWI0b1VIRlZtRDBKM1hhd1NpOS92VXNvUlRwYzJ5VXlFazh5czRxTEdUSE9j?=
 =?utf-8?B?NzFBL1Vrb1lqYWl3cnhXNVFJK0Q0Q1FLdzR5VjltOTZtbGtaSlA5VGpiS3NI?=
 =?utf-8?B?di83SzdtTDJHUHN1d2xWbHZqdGFwWTY4dnUybkduOFFQTncvaE9hbDI3VDVt?=
 =?utf-8?B?N2dtZkI5K0V0UWU5WDgxWHlzTXdIeHZ3czZhOU5jUTZDSk5pY1BaVzlYZ3pB?=
 =?utf-8?Q?04tC8Cx/NXf94zKJrK8yykChX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d957c2-1557-4495-03f9-08ddad807aea
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:22:29.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqwzHuJo6tc8henrOMbiRQVJD30WTuFLsjvuDjSz6/Wkhy3pWZ6ZIpJU0DyxauPXpncSWZvwe1cYemcS1IywRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765

Hello Leon,

On 6/17/2025 1:04 PM, Leon Romanovsky wrote:
> On Mon, Jun 16, 2025 at 09:18:41AM -0500, Steve Wahl wrote:
>> On Sun, Jun 15, 2025 at 09:42:07AM +0300, Leon Romanovsky wrote:
>>> On Thu, Jun 12, 2025 at 04:11:52PM +0530, K Prateek Nayak wrote:
>>>> On 6/12/2025 3:00 PM, K Prateek Nayak wrote:
>>>>> Ah! Since this happens so early topology isn't created yet for
>>>>> the debug prints to hit! Is it possible to get a dmesg with
>>>>> "ignore_loglevel" and "sched_verbose" on an older kernel that
>>>>> did not throw this error on the same host?
>>>
>>> This is dmesg with reverted two commits "ched/topology: Refinement to
>>> topology_span_sane speedup" and "sched/topology: improve
>>> topology_span_sane speed"
> 
> <...>
> 
>>>>
>>>> One better would be running with the following diff on top of v6.16-rc1
>>>> is possible:
>>>
>>> We are working to get this one too.

Thank you for all the data! Using the NUMA topology from the other
thread:

On 6/17/2025 1:25 PM, Leon Romanovsky wrote:
> [leonro@vm ~]$ sudo numactl -H
> available: 5 nodes (0-4)
> node 0 cpus: 0 1
> node 0 size: 2927 MB
> node 0 free: 1603 MB
> node 1 cpus: 2 3
> node 1 size: 3023 MB
> node 1 free: 3008 MB
> node 2 cpus: 4 5
> node 2 size: 3023 MB
> node 2 free: 3007 MB
> node 3 cpus: 6 7
> node 3 size: 3023 MB
> node 3 free: 3002 MB
> node 4 cpus: 8 9
> node 4 size: 3022 MB
> node 4 free: 2718 MB
> node distances:
> node   0   1   2   3   4
>    0:  10  39  38  37  36
>    1:  39  10  38  37  36
>    2:  38  38  10  37  36
>    3:  37  37  37  10  36
>    4:  36  36  36  36  10 

I could reproduce the warning using:

     sudo ~/dev/qemu/build/qemu-system-x86_64 -enable-kvm \
     -cpu host \
     -m 20G -smp cpus=10,sockets=10 -machine q35 \
     -object memory-backend-ram,size=4G,id=m0 \
     -object memory-backend-ram,size=4G,id=m1 \
     -object memory-backend-ram,size=4G,id=m2 \
     -object memory-backend-ram,size=4G,id=m3 \
     -object memory-backend-ram,size=4G,id=m4 \
     -numa node,cpus=0-1,memdev=m0,nodeid=0 \
     -numa node,cpus=2-3,memdev=m1,nodeid=1 \
     -numa node,cpus=4-5,memdev=m2,nodeid=2 \
     -numa node,cpus=6-7,memdev=m3,nodeid=3 \
     -numa node,cpus=8-9,memdev=m4,nodeid=4 \
     -numa dist,src=0,dst=1,val=39 \
     -numa dist,src=0,dst=2,val=38 \
     -numa dist,src=0,dst=3,val=37 \
     -numa dist,src=0,dst=4,val=36 \
     -numa dist,src=1,dst=0,val=39 \
     -numa dist,src=1,dst=2,val=38 \
     -numa dist,src=1,dst=3,val=37 \
     -numa dist,src=1,dst=4,val=36 \
     -numa dist,src=2,dst=0,val=38 \
     -numa dist,src=2,dst=1,val=38 \
     -numa dist,src=2,dst=3,val=37 \
     -numa dist,src=2,dst=4,val=36 \
     -numa dist,src=3,dst=0,val=37 \
     -numa dist,src=3,dst=1,val=37 \
     -numa dist,src=3,dst=2,val=37 \
     -numa dist,src=3,dst=4,val=36 \
     -numa dist,src=4,dst=0,val=36 \
     -numa dist,src=4,dst=1,val=36 \
     -numa dist,src=4,dst=2,val=36 \
     -numa dist,src=4,dst=3,val=36 \
     ...

> 
>   [    0.435961] smp: Bringing up secondary CPUs ...
>   [    0.437573] smpboot: x86: Booting SMP configuration:
>   [    0.438611] .... node  #0, CPUs:        #1
>   [    0.440449] .... node  #1, CPUs:    #2  #3
>   [    0.442906] .... node  #2, CPUs:    #4  #5
>   [    0.445298] .... node  #3, CPUs:    #6  #7
>   [    0.447715] .... node  #4, CPUs:    #8  #9
>   [    0.481482] smp: Brought up 5 nodes, 10 CPUs
>   [    0.483160] smpboot: Total of 10 processors activated (45892.16 BogoMIPS)
>   [    0.486872] tl(SMT) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
>   [    0.488029] tl(SMT) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
>   [    0.489151] tl(SMT) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
>   [    0.489761] tl(SMT) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
>   [    0.490876] tl(SMT) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
>   [    0.491996] tl(SMT) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
>   [    0.493115] tl(SMT) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
>   [    0.493754] tl(SMT) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
>   [    0.494875] tl(SMT) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
>   [    0.496008] tl(SMT) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
>   [    0.497129] tl(PKG) CPU(0) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
>   [    0.497763] tl(PKG) CPU(1) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
>   [    0.498954] tl(PKG) CPU(2) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
>   [    0.500167] tl(PKG) CPU(3) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
>   [    0.501371] tl(PKG) CPU(4) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
>   [    0.501792] tl(PKG) CPU(5) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
>   [    0.503001] tl(PKG) CPU(6) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
>   [    0.504202] tl(PKG) CPU(7) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
>   [    0.505419] tl(PKG) CPU(8) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
>   [    0.506637] tl(PKG) CPU(9) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
>   [    0.507843] tl(NODE) CPU(0) ID(0) CPU_TL_SPAN(0-1,8-9) ID_TL_SPAN(0-1,8-9)
>   [    0.509199] tl(NODE) CPU(1) ID(0) CPU_TL_SPAN(0-1,8-9) ID_TL_SPAN(0-1,8-9)
>   [    0.509792] tl(NODE) CPU(2) ID(2) CPU_TL_SPAN(2-3,8-9) ID_TL_SPAN(2-3,8-9)

Looking at this, NODE should be a SD_OVERLAP domain here since the spans
across the nodes overlap. The following solves the warning for me:

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 8e06b1d22e91..759f7b8e24e6 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2010,6 +2010,7 @@ void sched_init_numa(int offline_node)
  	 */
  	tl[i++] = (struct sched_domain_topology_level){
  		.mask = sd_numa_mask,
+		.flags = SDTL_OVERLAP,
  		.numa_level = 0,
  		SD_INIT_NAME(NODE)
  	};
--

NODE domain gets degenerated eventually via the default return in
sd_parent_degenerate() based on my tracing since "~cflags & pflags"
between PKG and NODE is 0 (node always has 1 group) but I'm not
sure if this requires more fundamental modification to
"sd_numa_mask".

Valentin, Peter, what is the right solution here?

>   [    0.511143] Failed tl: NODE
>   [    0.511789] Failed for CPU: 2
>   [    0.512466] ID CPU at tl: 2
>   [    0.513115] Failed CPU span at tl: 2-3,8-9
>   [    0.513701] ID CPU span: 2-3,8-9
>   [    0.514419] ID CPUs seen: 0
>   [    0.515055] CPUs covered: 0-1,8-9 
-- 
Thanks and Regards,
Prateek

