Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96D15533F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751339577; cv=fail; b=Upr5yvpGFulaAZT5D+Dtdkfo1AHV+XNRimbyoKja9krb8Zb5u6AMF1LfSWlAQc7Eomhiq9UX72l40XmLfYOUJpcT0aAIAVUFI31ldk3nWENF96jHpZotVuxYpeDvD6n3IyeXyG9ohosdX13AzTzvMMXC3nDzJ+JuiAnVxkNH69U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751339577; c=relaxed/simple;
	bh=Iaq1w/XfK+xP0ep1C5yVZc1x749ZTAn61FqRXmJcriU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ih2VxQHUdCUdXBTJnKAO1m7HjCRXpwcvn5PJNSph2ll6quyR05N5f/wnaBoQMTFDz4a9t++MLGFaqdRZAyEOvbub0YMFsleUK9xR1sTr0840xwkho1M6vcQCfkMyLou7DIn3OPKlkny1uLdpOF1skJyY6u3kc/Q1LFOsNCvX4Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BvMeoq5N; arc=fail smtp.client-ip=40.107.96.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BvMeoq5N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXO7LUTuisEteu077RiJChO9pRlG6RaNRuLEYZtIu3TQZ9euO+mSnP9Whi+B6zk8j++PtEXMnigYviN8y5c1kHp04V7ichtxq0xbdbX8PAlSAN5AVe8IqY3WWrTIwX2WG0HGgQHWUy5vxa4F3URRQaRr279LWRUosh0laAQ3RgjLkOR/4U8hh0cDmo3YL2qODD8DtQ7gRSpiTMtu5SvNIjmsrH1DyGpitkwTPJbfKzE9X8hWGT1Wd+J0YzTj3QC1pnYyOp/N7zjgYE5hqRE5ZuYpaTF31u0dhd9bIopMACQ1Q7eNW2KuJ2MFYCCcAJpPW5RJawJkvbAeSQWgo3btfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VohEBXVS6aANyteGqO/MccFJTUKgAJDXz5ZZVRxgK2A=;
 b=nKURLE0FwVGlTD1HWY3XKoAzaGtaWif5+6zX9ne6ZCLN7ePgAfAnQ82Rbiys/4O1aO65Xd+V/lAVmuc6PqYeADw9y8GWdZ/AI/HqxuyXPJZXLWs1rgYzDlHj/Dw7np9+U6OfqasZm7UTI+QjNnDgG7dZC/FiRUOmbGcwlMyAS6LeET71PZ3a+OE8CzKnly1x/T3gYWrTMT7B0rc42LrXhnKh0aNfOYrOsqiGGAwQ/V+9S4a40iVslKQbImp70I1HZBN4yh3256iLCR/AVuP3OzDt0z6TIr6iMAOI0fKqoVwSj9jX+AwG5Ea29Rx9yQ596r7Wk6tAd0O8Rmi8HPDAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VohEBXVS6aANyteGqO/MccFJTUKgAJDXz5ZZVRxgK2A=;
 b=BvMeoq5NM+5uStD8+OZHyGxYpolkcrXJg2jEK1fWVdPDzrMFsPmJHm105nXMhbIIB4mT8kbibvZyUpMAfdVSzz10f4JeegmgiyyI////cAhLoIoLglc1FjIQ/sFkAKQODZWGZ3VwxDpkEEZkLwY3q6PhybqEISzeLBt96Q4jOfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 03:12:51 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 03:12:50 +0000
Message-ID: <953c7749-5c91-40d9-ab1a-bdf82987d256@amd.com>
Date: Tue, 1 Jul 2025 08:42:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 7/7] Introduce a config option for scheduler time slice
 extension feature
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, tglx@linutronix.de, bigeasy@linutronix.de,
 vineethr@linux.ibm.com
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-8-prakash.sangappa@oracle.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250701003749.50525-8-prakash.sangappa@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::7) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: c44ced5b-0842-4b94-4cdb-08ddb84d2922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDIvVXdQWDNSL0JtNW11NUxBbHk2NGdWYWpjYm02NTZxL2pra3NmWjlWUWEw?=
 =?utf-8?B?cGNVVVZPVWRFVG4vTnZiN0VIWHZXWm5PUVp4emRHOXlqQlJsZjNkVTRWU0pY?=
 =?utf-8?B?K1I5Y0ZuTXB1eWw1RDVtU3M0MWtNa3RTd0NvNW5jMCt4NjJYY3NUNThiNi9P?=
 =?utf-8?B?Ty9GYXFNa0ZDeHJGanFudXN1UldWTUIwZkpidVZnbkdCOFBSNlFLcXRiTUdQ?=
 =?utf-8?B?M25JczM0eEZJZU5mcTdJaVorUzNYaXB3cUVjU2NmM3c2UThjOVp2eElMaXg3?=
 =?utf-8?B?SHloRy9YdVdpUU12YmJyd2pnT1k3aFlRZzZXRkMrWDF3TlF4aktaNFNqdkhW?=
 =?utf-8?B?ZDd0S1JHS0VFbmpPR2xtRFY0andQZEc2M3NtR3RjQmJzdmVacEM1RnhjdGp5?=
 =?utf-8?B?RkdsMXZTLzF3Y2tQM2dJbW5zWThvOXd4TEhaNHhwZlRMR1UxV3dIc052MTFr?=
 =?utf-8?B?andJTlhqek5halZOUGY3SHVZWGxIUmJSbG5veWIrOW9wRzgrVFNYeGZxbHZi?=
 =?utf-8?B?K0tiakwxTUFmSjVSb2REaWpuemsvdnU1ZzBtSE8yUTJKWHUybGcyYlorYjIv?=
 =?utf-8?B?N1RWZW8zcnhIMERwa2w0NTRkMXdROHRxREZGUkhTUTZ4RVFZOWQ5cFBnbGFV?=
 =?utf-8?B?SkRoNk1PQk4rSHBxSVRUMVFYcnRSckJsRlNhUDlKdElxN0xUTDNreTFDeGJ1?=
 =?utf-8?B?dXgvWnFyUGsrdkMvY0FDWCtQSE1DNGlmK0g4aUF5WkNnWUU5RTRqWm9paGRv?=
 =?utf-8?B?VVYyRFR3SkRTSXUvdzZobVEyUk5XM29Va3N3OG41WXN2a1UwTDV4K3ArYk5K?=
 =?utf-8?B?Sjc4VHdpeFFOcTU0MURDYUpXOUpnTTl2eVlYd0xVb09LZWlsaWg1SG1jR0lm?=
 =?utf-8?B?T1RPNEk4clMrcFdTN2tJMXZLMEQ3Q1JqN1ZPMzZTMFZnQUJUU2J1SFkvaHJn?=
 =?utf-8?B?RiszOHcrM09tUUp3bFI4SjlNVkpiS1VTLytLWDBpeHVmT1hrb243WWhrTGpw?=
 =?utf-8?B?WnV2eTg3UEw1T1NtanRqaXZoS0trZ1dKSlJFY3FUeGJvOUJZMk9HWXovZUQy?=
 =?utf-8?B?eFZBd3NkTG9vdi9rbnRheTJGb1lmMytwNGtGYUM2OTdQdXBBSjM5Q1JiQ0NY?=
 =?utf-8?B?N05jd0p6MVNmYitQeDZCZENMZHFzRG0yUHdWeDZUSytnTVlhYmc5R1VjVllq?=
 =?utf-8?B?MkRvUVBnZmRMSkwvOGxyVHNWYXJZZ0EvU3hDN0RhdGQ4REV4ek5QekNDa2Yx?=
 =?utf-8?B?d0xhMDM5RUxhQ2tXdXZTU0psQjhrQTNCRUVMTjBQcnV0QzNDS1ZhbFVjSUVY?=
 =?utf-8?B?b0FudFJXZDdZM0llZzdMcHlnSjhnK2hoVEY0SEl5Qmo2bjg1eWErV1BQQUFy?=
 =?utf-8?B?S2VtQXVDbkRFYWI3OS85WVFDV0loUEVDeDFEOWEvQlpoRHUvM0o5STNqdmxY?=
 =?utf-8?B?NEZUY1ZvdFpXTXo1TnRscy9wSWtZYm0ybUxpbm9ndmhoL0RnZ0VIQmFkRk9X?=
 =?utf-8?B?Y0xVNzFJbVdCaG9TeEUyQjBnOEppVUxsSm5kbmhBc0hHOWNkeVEvRjVQWk5l?=
 =?utf-8?B?OUVUUjBITXJweUJvelI2MUZKSzJwOVVyRFM2OFB1RWcvZ0tVMmh5SUhVejc4?=
 =?utf-8?B?TDVTWTVuL0VwN2NhOUFFVUFtRWdCOFQ5bUMxS0xpNWUvT2hqRU1jWFhnV1hU?=
 =?utf-8?B?alNsTHJTZERMZENRUk8vYzQ1VWlyRDRra0dPU2J3dyt3WkVPWW12QWkrRE9k?=
 =?utf-8?B?WDBweTRnMWNncExPa05UWXIvUVAxWWhyaUhUZG1DZVV5R0N4UkU1VUFPRjJu?=
 =?utf-8?B?VW0vYytEVDZLSnpLMnhidWFrMnhkVWc4N2w1VmRKWjJOTFVNUWsrZTVSVG1m?=
 =?utf-8?B?WHNDTzBmTzkrM2luTnFDMmxxZW9OMC9iZzE5emtTaTViRG0zazVoMit6c1ln?=
 =?utf-8?Q?b3yHKoxMt54=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5GNlBiTWNBVnVydzlDM3dySEZzWE11Ymd2YVBmTU9VYmFVT09QNnFqcVRp?=
 =?utf-8?B?dVVUWDBJU3VzSStkaGE1NnJIQjJYL2lUVGwxY1BQeExLWXZIY3hDM2IyNlRn?=
 =?utf-8?B?SGRsWk1VekRCdTU4S05rQkovSGhjY1BVcXg3cDByRmJ1dU00bVFnUGRvU2FN?=
 =?utf-8?B?aEtBQTgza1kvVFFnODFWK2RaVDNwTWt0V3Z5OVJMSDFwaGNkKzNjdU02eEN5?=
 =?utf-8?B?SFYxZjAvOVNUNDFlMEFreVQrdGdtUkQwYWs4SVlwaW5NcDcvRDVzTWV6RkJm?=
 =?utf-8?B?bDkyUE5wWW85NFFLcmVCcmxkS01uOGxDMmhpd01DYnNTM2M3d1M5clVxRStw?=
 =?utf-8?B?SDRjV3NTajFVQnAxN1U4ZTgrRkVnZDl2U2NPT2QwL2dGNlRBbUJQeDdiMkl1?=
 =?utf-8?B?K091WTV3T282Z3R4M1lpZVNiaS85d3NxSjg3OGhIV01XdGdaampOZWl0RCtk?=
 =?utf-8?B?RVNEdE5sbWdMRWlVamsydzYxR3QrbVNyQ0JuaEhJL2Njb1pFNlVrNk0rNWll?=
 =?utf-8?B?N0tBS0dyOGNCV2tqMTRIMG1DVUx5NEp0allvOGJFSTlGM1Bzbld5Und4L28r?=
 =?utf-8?B?cDQxUGY3T28wdzJnVm0wZFN0OWRyOWsrQTFLTnFyZ01Hdmdzb3NhVFM4alpB?=
 =?utf-8?B?UEZyOTY1bHpucFdvcERQbHZMQ3NpUG5hZC9sU3JSenRZUEp2M3dMbXR2WmRu?=
 =?utf-8?B?QUVNYkU1eXVjZjhWTmx0NTY5eUU3VWpISUg4N0VMMUR6a2lBNEs3amhtekpH?=
 =?utf-8?B?REg4UWExTVRLZEprQ2FIZkgrZ1FLY3ZlN2IxVkZrSXNRNTRML0xyNFdLU1dE?=
 =?utf-8?B?VU4va1BEQVhNUk5Jb202c2RvdDlYaEdFT3R3eDJHbzAvTXJhNWM1SXN4UVFX?=
 =?utf-8?B?dENzT05IeGVuRzdNajdIWnQrOVQ3VVJsZmJNZHNBZTVtSDU2NDFWNG9uSUJS?=
 =?utf-8?B?YkduMk9md2NLZll3T2ttOG1FM2pWL1Y0T3ZpK0c4c1hyQmVVMEs0VmVXWFor?=
 =?utf-8?B?WHdxZURxL1M1aTRjOHF0TTdXZEN3TlBmaHZYcEVmZFVwSTY3LzNPcisrL1VW?=
 =?utf-8?B?Y3RYcDdEaFkwTmdGcGhhZEZVZWRpZGFETmQ1RytRVU1CZXptY2tUV0RDclMr?=
 =?utf-8?B?cW83cUQva1MxbUNXVVd5ZlRrNHJZQUFpVzBHSHEyMUJ2bkN2YWlTYnltTjV3?=
 =?utf-8?B?aTM5NUlXbXZ6M0NrVTBWcVNqeFpNRlozVlp2NnZ5NCs5ODNZWFV5bzVZQ0tC?=
 =?utf-8?B?SEl5TUZUSmsyeUFyMUpPTUlNTy9hTFFjY2JKYllYeXRaZmtaQzE2N1A3RjJz?=
 =?utf-8?B?S00ybmpudGpkekJFSUV2Q01CdzhoL2pKVjhIMS9NbFJ2V3NvbVB1aTh1U3lN?=
 =?utf-8?B?NWd4a0VtKy8reE9JeHVnbHo5TlpZZ05YVFR3QVVhekZEQ1B5aWNKYkFPQTls?=
 =?utf-8?B?Sk0rdElWRCs3WEhReEMxcm1Ja0lGZFNIS2lNWE4zejM5cU5JYm9zMjAwNlRJ?=
 =?utf-8?B?eWQ5MldObEU3b1lMREhKZmw5YXVvQ3VBSTR5bWQ4Vld4aElYU2hvNk5wdkV2?=
 =?utf-8?B?cVlScDhEdzIrcE5nSEp2aFBiRDBsRDhoeTM1bEVJY2dHOEhBYmZoQXhncHJp?=
 =?utf-8?B?SHdyaEdjMDhFQ0hXR2VLYTdzRWFrVWd6QytNUk4ycFJlR3VUN2wwcGhvUmNL?=
 =?utf-8?B?TCs2STVQS2J3cFpoaWdvbXZhWHpXa2pWSG5ENUQ5Z0M5aW16RXhpR0dLZDZN?=
 =?utf-8?B?SEtHbXpBZGtFN3EwUVBmakplbm1nRXRTeVY5YVJtamIxejNaQnhDdGZFMi9C?=
 =?utf-8?B?WndsZnJYL0lDZFBjbjFUZFU4ZkZtOVZxdk84N21KallTMFFJTjV0TFpmNFZv?=
 =?utf-8?B?L1pEV0FBaXo0cVRJeGEzUkJhU3cxN0F4YTFSTE9VL0wrTUNzeE14cFRwcnEr?=
 =?utf-8?B?M3l1RVcwM3BiM3pFN2ozWFlBcjdiV082bXNyV1FBTzVvdmcvVHRtUjZETFhP?=
 =?utf-8?B?U25xZDg4ZUdCdUh1MllxYWRURDNIWFJsendGNkhmSngrQS95YVdHZUlzaVE3?=
 =?utf-8?B?RklHbUZNV2VoRU84bUdOK0lHcGxVMitsTjZzRERaZjNha0JxTlF4KzZsOHZt?=
 =?utf-8?Q?rQNjOMXDUO4hjcyws345xIZo8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44ced5b-0842-4b94-4cdb-08ddb84d2922
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 03:12:50.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tCTZW4wIOQ1w2HwsfGV7bM3OaM+XT8NA5+34tpwtVnJIwAV27X8VbLrSXJdStUJ2hmLi5xxYa36EuZXcQpaCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660

Hello Prakash,

Couple of nits. inlined below.

On 7/1/2025 6:07 AM, Prakash Sangappa wrote:
> Add a config option to enable schedule time slice extension.
> 
> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
> ---
>   include/linux/entry-common.h |  2 +-
>   include/linux/sched.h        |  8 ++++----
>   init/Kconfig                 |  7 +++++++
>   kernel/rseq.c                |  5 ++++-
>   kernel/sched/core.c          | 12 ++++++------
>   kernel/sched/debug.c         |  2 +-
>   kernel/sched/syscalls.c      |  3 ++-
>   7 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index d4fa952e394e..351c9dc159bc 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -402,7 +402,7 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>   	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
>   
>   	/* reschedule if sched delay was granted */
> -	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay)
> +	if (IS_ENABLED(CONFIG_SCHED_PREEMPT_DELAY) && current->sched_time_delay)

A wrapper around this would be nice. Something like
sched_delay_resched()? It can also be reused in do_sched_yield() then.
Thoughts?

>   		set_tsk_need_resched(current);
>   
>   	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {

[..snip..]

> diff --git a/init/Kconfig b/init/Kconfig
> index ce76e913aa2b..2f5f603d175a 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1130,6 +1130,13 @@ config SCHED_MM_CID
>   	def_bool y
>   	depends on SMP && RSEQ
>   
> +config SCHED_PREEMPT_DELAY
> +	def_bool y
> +	depends on SMP && RSEQ

         && SCHED_HRTICK

and then you can avoid the ugly "!IS_ENABLED(CONFIG_SCHED_HRTICK)"
checks and keep all the SCHED_PREEMPT_DELAY bits in one place
without the need to put them in the "#ifdef  CONFIG_SCHED_HRTICK"
block.

Also, are we settling for 30us delay for PREEMPT_RT too or should
this also include "&& !PREEMPT_RT"?

> +	help
> +	  This feature enables a thread to request extending its time slice on
> +	  the cpu by delaying preemption.
> +
>   config UCLAMP_TASK_GROUP
>   	bool "Utilization clamping per group of tasks"
>   	depends on CGROUP_SCHED

-- 
Thanks and Regards,
Prateek

