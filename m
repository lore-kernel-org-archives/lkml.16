Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7D19CD13
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751344272; cv=fail; b=apPEPEBSLBphnHEY7qPGxUpAJ5gAuOglGcOsjKmjsuNlPcmLqWtLLZEYUcdDFhSNmBo3w9kEdz+ly+a36XSAdib8bck1vui2DOTH1m+eWOnTKfS0Mooypxh3ECyb7A3TnYm6csvkvEsYHxfDqEJBe5rgFk4vu46T+aIptmPiHNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751344272; c=relaxed/simple;
	bh=CNbknSyDtKcb/sxpll+XaVuQLOZhHhR5JZni18XbgeU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LSZ1GV4jHuRCW2K2onQgBhcSy9dgcKR9lfj0OCVg8WgN3K1JgpIHYQPU7OhIYth57gnCf6swbauLjJwXCf16eHifTXhhb48cXNWw9S37HCpBKoUHgkONmM4GHDr6LuRO41/+3sd65+1D4zHdKVZY/59yT6SkZyAb3GQ0zQaGfNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k/ergdAC; arc=fail smtp.client-ip=40.107.102.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k/ergdAC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOhjLv3AaH6gi0iC7P5UfNn4596y0+rBxYDE0YXRK2ab+/Rsq7C1bF6ashhewh256otbvn0+hMcaCVKF5k8VdbwzpONUXyOeXW4oFrZO1IIeR0T+5wdJcw3SppohC+Wk0hBqFngfw90iD1umyetIn2Xbjg3Mg4TlsCCMAWom0RmlzKxsEmixiKKuOEMWk55pGbeZmjVpDOefwPW2CtP9DCwkoi9rQN1U8vpPZTn7eTEtfyXRXigDR7az9i53rGq6Knh9UG8U52Xi+jm7uFQiw2v/S2mN2cmQXmwuMxVNVsBdsStmQeHmS06AHvELrksB6dNLG9yvXG92xZed2Tp++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVzwJkC9eHqFLJqpThFctS8x0GgVT3Zm2f+r0gFJchM=;
 b=Lv3f4XrLmFIDW+wDbQT0QMgTl78hywbnbJDJeDUsNEe8+/zP3BlJKqxSbwv7HFJoXz1CE5NLu/kc2mrtSVfjqv051HIw3LZMIRbdjN4Ftw121g1F8nDpISFuiWDRFifH9HUSebIBwsWv/f6yzudvX2F0L2BAeuZ+2zTHx25+2k0B4AJ1mUXgYgperdFQ8RU+BSsXOkHRUvi05op1JLOiLYLRtn+4nT9DlnW0h0a+DkVkVkmA1rgTkJZvR3Fu7Kc+MTbVrXX4aDiXceXYfmRdnb0X6VwvuOTAfPj90qiK8A0juMLTmt4ahNETWJczp8cAl39NMwATQGBpG/sUU6R11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVzwJkC9eHqFLJqpThFctS8x0GgVT3Zm2f+r0gFJchM=;
 b=k/ergdACzhOVPLzFU3tXSfgxCnSEJz2hHvUTs+Eeaa9+VK9/nKiXGS29wXAsScqSoz2adbnIxV92Zz8w51wByiDCTxtgzm3zh4pVNanrS1xt2SbEbR/VI4y3Xc6kOLLKW7+hHVjbrriTmXKzvZaQu4t/lpL8hWggaNLGEGBAbcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 04:31:04 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 04:31:04 +0000
Message-ID: <94190673-8978-4bcb-9755-bed718fa99ee@amd.com>
Date: Tue, 1 Jul 2025 10:00:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 0/7] Scheduler time slice extension
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, tglx@linutronix.de, bigeasy@linutronix.de,
 vineethr@linux.ibm.com
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250701003749.50525-1-prakash.sangappa@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0087.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::10) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: d60f478f-de2e-4330-0702-08ddb8581684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEFZM3NmdkUzczJ2K2xLL3pIV3hqS1YrSFFvOTFaZEtTQVdjNmdUL3l5VzRV?=
 =?utf-8?B?aFc2Q2JpSGdMc3NKUnl2MEFueXp6Y0JiQTVlaHg1V3pzeFpnS2VSZzV2aW1W?=
 =?utf-8?B?bklKcU1CSVdHVDlLcHh1eUNBaExwdGhKdjhjWlpjZDFFV0IzQ0hOdVJ4YUE0?=
 =?utf-8?B?TE00d1VDVlJIT3ZLS2RWVzdYbjBvMVJWc0ptdkJnZnRKRTlRbUlJbHIwTmJx?=
 =?utf-8?B?aC9GLzJ4MFRLUk1tUndmRFJUMjVobjU4b28yenRPdk56UG4zL3RXTk9LLzhm?=
 =?utf-8?B?RkVwb2ZDVWh4dFZHMXpUSnhFbkNFZ0tpcEREOGJ4bmlkWkVrZnB2azN2aUVy?=
 =?utf-8?B?ZU5oOXJMM2FIbjdPZW8rdFBkdXF3N0tDbzNsUm1Fdjh4Y29mdlMxOEZ6bnNm?=
 =?utf-8?B?Skgzalk1YmxZUG1JWFpJMHF3Nmk3SXhHKzVZaDJya0VqZEY2UU5TRjNXZlJh?=
 =?utf-8?B?NGc5b3pGSkVUV1ZyUjQ5RnNqNEdWZXZadldvVDhTV1dlR3FvN1VUaThOZWtq?=
 =?utf-8?B?Y2p3VGJrM0pMQWw0NEl6bjJGKzNVWFJvZVVRQmJORHhQQ2RDR0pHeURHZ1BL?=
 =?utf-8?B?Q01NRmNOOG41Q1pYQk9KWWNVaHpYNm45OFdiMW1qZkk3dHZNZVJyYXB0Mjhu?=
 =?utf-8?B?c1AvY2xRRS9UVkFMc09ucGJ0STl5RHN0QUlOdEhiVXZPZjVQZVJXNi93VWJV?=
 =?utf-8?B?QjVCdmhMVncxaWUzRENZYUU3c0M1RzF4WVdoMCtNYm93K1JuWFUrMFpVOUF0?=
 =?utf-8?B?LzdDS2h0QlJHak1WRmcxYS9YdGJ1R0hZUHMyZG5lQ3d4dG9lWTBzVU1JTWJ6?=
 =?utf-8?B?UkRGOUxlcy9wOHFURUlUTzRSTmhuZXE3bTA5WVU0TFpZSnR6Vzk4MTRhQm9C?=
 =?utf-8?B?LzJYUnVvaUZSQXg1TDl1QkdENVNVQTNoRmFDckZabnpNdXZFRjMyc2tVZTZh?=
 =?utf-8?B?cUZnR2ZnOC8xNHJHQ0p1OTU0djgwV3puRXdNUnQ2WmlmOFp3UTFybm9HbVp3?=
 =?utf-8?B?ekhab3hWN1NtbTJhSCtvZkNGR0I4d2hWUzhRL3krOFd6U0JpdnNiNm9HOUo5?=
 =?utf-8?B?NVNGdE1CVW8zTjFHdW4weTdoOXNtMUhGVmo0UUJ0RDZsWk00WUp5dm55akJx?=
 =?utf-8?B?cU9sQjhrRkZUK1RHNXhzRHZIK2w4WURwbGVyaWVDVHdDUGVybzZEdEV0WUhr?=
 =?utf-8?B?R1dKamlEdm1tczAvYlNsc2cyYnFYUEpSNDJSVnh2Vi9YblJHb0NQY0dzeUhY?=
 =?utf-8?B?YnhrYjJRRWU1VWxsL08xMUJlL0xCTjY4YU8zQnJHWDluamh4U3VzWU43R3BH?=
 =?utf-8?B?SWY1UUxvRmxpV3Vwek5ETEdnbElBMmMvWjhyQW0ySDIrQ2dBWTNBcUJMbmN2?=
 =?utf-8?B?djBZRzh3K0dJYXB4SDIzTTMvZkV3WnR5U0ZZbzRVUnYySTZUU3A0bnlNUm5V?=
 =?utf-8?B?cVZ2Skx6UmhlK0xFdXB2STNoM0RpNnkrYkoyTHpPTE10U0p3RWVuOEFJVDFJ?=
 =?utf-8?B?RURkbHRSZWVWc01MV1ZyWWJWOEtrTWR2SVgvakUyemtyZVozM29aaDlQc1B1?=
 =?utf-8?B?WXUwRjg1ZW50YlpvZ3B2VFJoRjBzbzZqR3hZMW00Y3lpZ2p0Y2Z0cmxPc0pK?=
 =?utf-8?B?a2Q3SmIzOUZqVllVM1pody9EQmlnczRMdVA5ZXEwRnEvbHVvOWFseGsvekhN?=
 =?utf-8?B?WnJLY1NLU3d4dXhWYUZmOXNLWGpLZE5EL2RGUmZzZWJ3MWVSZWpjNCtZaUVR?=
 =?utf-8?B?bDhjaGRUZW9VclR6RXhSbWw3U2s4MjlvQ0c3aldFZnh5clkwTnN6S1BzRnk0?=
 =?utf-8?B?K1VaTTRuNDBRTTVTeTFrdVhkbW9SV0hvOHBIUjUwcFZwYnhJb3RFbTErd1VD?=
 =?utf-8?B?dVpkWUxMdXV0RzRQM0lucTlxTkhQK2dJa21nc3lqZTRVOU9yMGZKUlVyd0Nm?=
 =?utf-8?Q?C9bAtkMawy8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVZLdWk2WWVOSnY3UFVNRnNGTEJlQWlWZ09JSHp6QklscDR0eVJzcm1aVEtU?=
 =?utf-8?B?NHR5dGtRYmhHOEhqa3pjRDZ3amozU1QwbitESkVPWitXTGxyZGp0Wks0V0RZ?=
 =?utf-8?B?UWRUK2h3ZENjQ0ZPWHB0WmZxdFArU1N2RXpjMThjRDhqaUVodkVXVkJ5WFZJ?=
 =?utf-8?B?cTlEQXE4U1k0S2JtMkNISi9jaU03VXB2TkRqOHZ6NnFTWHE5R3hKMU5BakhZ?=
 =?utf-8?B?NVV5MEdpNDMyTVVlTFJsOXRtRW5GVWI5RUJOdHhjNVltUEx1eDc5SzRVQUxP?=
 =?utf-8?B?TDJ0SjN4ZW13TjZ5d3A4NXpZamtJeTE4OUZ3YXpVbGxnR2R1dkRFUFVOd2lP?=
 =?utf-8?B?cTk1dHAydmlkODBqT2RWMHo0dEFIZkRiOGVTbkNwRWFpZDFJOFk5QzhRY21Q?=
 =?utf-8?B?NGQzSHROTkgwS1VDU0lSeVFVRVF6ZSszdDVYd0wzY3NOUTlyWXUyYlZZWnRt?=
 =?utf-8?B?aDhxUGZsZFMyTjhRNC9kUUMzb3pLemZScnJMbHpEWWh0dWFqVVNZZTc2MWVa?=
 =?utf-8?B?dlNLNUlWS0ppZ2w3VzEyWEhtSFEvYjBwUWVHNFMvN1lWTmU1c3ZsSVh1dEFy?=
 =?utf-8?B?VHhKS0svQ1Y3SE5qMjIrRWtaWG1aZWFvZWQyODIyOENsK0JNajBSOVl2TjhK?=
 =?utf-8?B?OU1lcW9WY2xXOUdEYUdFVVpvN2I3YUNvVE9Rekd5NmZYS1hETWtTMjNpQkgz?=
 =?utf-8?B?WGd0L3Y4QUg4dkRjN3RMQm0vUTAwdTlXOTRRWEkzMzRoSVpBSWd4c0t3RTRY?=
 =?utf-8?B?Z1p6QzRTbHJUb1BQQkFRYkxxTDZjQXNPUU96dGFla3JOVVhLclU0dG9XMzdv?=
 =?utf-8?B?a1BQS2krd09uNnpUM0NQM2VBTlNRK0NuTWhHTkpaL09ZOGhtNHNhUXVZRWZC?=
 =?utf-8?B?YjVTQWEvdTZkYStNNE04SDRLa0Y3dlMwMFVPUDNlcFpDK28vTDBsVjBLWUdh?=
 =?utf-8?B?dkRSaWxpOFRDS29BeG9kOEhGWjkzYWdZQVp5ZStGYlYzTzRFL1UyWGdnekxC?=
 =?utf-8?B?TnZlclhuV2hhMkdlZTlJbWNxeFdUNk80OW9CeDROVGF3S3I5YjhrTVBoemN2?=
 =?utf-8?B?Y2xoU0dYZmZteFBIbk9DdGNxLzlDU0tpaE1iNnNwTGdRUFFJVmJORUY2MThl?=
 =?utf-8?B?anQ5T1pNTXI3MVZoWUttU0M5RTVycCtUZmdjeDB6M0w1QWI4c0RsSUgwbjFR?=
 =?utf-8?B?VVVOOWJmaXdSaDVueEI5ZnRmYmhQOEZhR2FWZWJGSmpMdWNUSHA5L25xTW1j?=
 =?utf-8?B?cXZUU0VncUtCaVpEOGcwQ2RFNzZsbWxiN1lmTmR4QXNsajNJZVdjdE5uQ01E?=
 =?utf-8?B?RVpzZmdoKzcyUXlwd0puMjNVQ3llTGdJUHVmVjFUcWhLQ1VsWE1rZklqSzM0?=
 =?utf-8?B?MUkvMmVaRjZNMS9uOXgzU3FGdEI0S1JpdG55bEEwMFltQnRyUEZlcDRKb0FR?=
 =?utf-8?B?YW5ESmp3ajlQNXdBc3hzQkhnZUdkSm1MdWh1Y0VUNE1hUGF1K25UMjd4YUpx?=
 =?utf-8?B?NWJadkV5QXM5aGZBbVYvZktaZmpZdVpGdHVFNVRPS2ttWUxxWkpqU1ZOOTNW?=
 =?utf-8?B?OEFjSXJuSEo2L2ppVlFLTWJBMUlzRXBveUM1Tm84QXdnRHJtUG5sbTU0ZW04?=
 =?utf-8?B?Tzc3cnNaTnZlVkU5djUwWVU5d20zUkdMNDJsWnhVMkZNa09DR1o4NDJKcjdH?=
 =?utf-8?B?WXB5UlZsMFNldGJoK3hRZlJZODlWa0k1Z3IzcmtkMlBKMjJJdzV5NndOWFFK?=
 =?utf-8?B?TXk2TkNGTnhMM3lOU01vK00vdDI2Q3JYaWNqYk5kcFJEWUhRdXd0MzRFRlc3?=
 =?utf-8?B?K2JjaGJYc3JYbXkvZkdqQmplYU5CWmtuRmx4aHVnYzROUWpWUnNKOE1nQXRT?=
 =?utf-8?B?d201ek8wQ1k4VDlmVTJsZFJ3M3Q0V1dZSytqZktqU0xXYmJtWWtDeklURHJm?=
 =?utf-8?B?SG4yRmZjUEhHdGx4cDh0REROR3JvTmZadG1WczlndWVCdExkUmJBVTlmaGpD?=
 =?utf-8?B?WVArYm1hMkFSR0YvKzRGclJ0a09FQzh6SHE0RUljUnllOGk3LzR5bkNQWGRG?=
 =?utf-8?B?NktKWTJrcGFFZVpxMDJiWU5qeFV3bmZIb0MxRi9IT0lpcHZyb09UNUNJemV2?=
 =?utf-8?Q?Bq/yOdeVsnphWkS+T3ZHwJ369?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60f478f-de2e-4330-0702-08ddb8581684
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 04:31:03.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFxBJt35WJsCMEP1ONyBQHSs7K42T7ygvdb2ESLWefz6ZMYVOESrAfB8b/2RlkjyL+dPn/BF+m+A91wX9PKT7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322

Hello Prakash,

On 7/1/2025 6:07 AM, Prakash Sangappa wrote:
> Prakash Sangappa (7):
>    Sched: Scheduler time slice extension
>    Sched: Indicate if thread got rescheduled
>    Sched: Tunable to specify duration of time slice extension
>    Sched: Add scheduler stat for cpu time slice extension
>    Sched: Add tracepoint for sched time slice extension
>    Add API to query supported rseq cs flags
>    Introduce a config option for scheduler time slice extension feature

nit.

IMO, the ordering of these patches can be improved. Introduction of
CONFIG_SCHED_PREEMPT_DELAY can come first followed by incrementally
adding the scheduler bits, followed by "rseq: Add API to query supported
rseq cs flags" and then finally introduce the bits that introduces
"RSEQ_CS_FLAG_DELAY_RESCHED" and allows the user to set.

This way all the CONFIG_SCHED_PREEMPT_DELAY can live in one place and
make it easier to review the entire series.

-- 
Thanks and Regards,
Prateek

