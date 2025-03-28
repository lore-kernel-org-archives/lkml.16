Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA7E573;
	Fri, 28 Mar 2025 00:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743122632; cv=fail; b=ixoZHjqYvrIbPIPqMBPQjn/W6Bsl4uGCWAt5t6Edd+VzbZeBIOOpkOqExWTRk2mWp9V1CdJAe1jLcYUV5Ekg8GLzokTHUayzPaAXMkeh9JTFnJAU4nFs2rNatwFlg7GQV5ZU8RRGY2Q+hLf0oWZpv8lf8qFKyOBJpSU3uIcJzQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743122632; c=relaxed/simple;
	bh=PE/u3L9IUY2mzcD3DoucWM25P9AD5VcdsAJADzJTA5M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gRVVrAzhjiWlRSkmC1I/wQo6nP4VlMqrCOnh0MwRCYR8IOB87iwj8W0BEN/Vi2kht0pumPbwiuYNQPAlud0hsOEdiCm/nyDQaIjLGmXhb7NteqI2adpX6m7x47IJfcpcCRULgfguHmN8te9SMGj+DgrfpcsXkD8D/urx2belWs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R6ZRntET; arc=fail smtp.client-ip=40.107.100.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R6ZRntET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxW/2Poa6QaIy+Uneik+dhAAAk9+1guCJA8ut7BE+7ky0RjNSckdqEfnw83UKlXJGaPUKBSjf4Q/gcs6K/RN3b8UVeOZ9I6SIm3aLbXjfpKE49QnYd7MgOOsu5wLIYRlitnQYiYdoB75EmPRJuc6eN5wbz++VvSD8iXVW/RUmmhCcXzSb6LcUh3OhwxKrIeSWrX3QhN2IOfpMLYrWagmZc99K/ArwbzVQWvgnsqYkJxtYZSpcpco4mNh/auh0gDYiLUgwJK4jGaydg6hctjQkNb5j7CGXlwT6sA2PiJHND0oU2rpgT59efNzYiZQWFrB96jvMdLJb0ZkhAd61rg3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgPoNmnVTPJmTIDcScgVs0yDzvWuFLnIzxJFNhox3/w=;
 b=hZcATgbfpaqZEVapo6c/uyKa2HO8zOdFZSJh3DRhe7mIDbAyp+rN4Rw2tV7Tgkv4eBGSoQ7e+DBYh9TUsiQi75vbMCypi47WSGxNNbv2ldAmKHHxA4h2v1xjI2OEsZJc5N5m+G5rh+Y0d10uSmr0bKw4MuhX2S1poq0ysASQCL7jpHEuVtfd2trGyZIPVK1L3W87FcbT50d775AG4cBMfK2EoYK9DBLmEi1ILMzpPNBnStzjFvQW8EoxhFYCsjkZO5pZb6JRB3zBtpKEAIyndVzc57HCGUcszIpIoMjTqejFcLiWVJkqp/1nWLUf5lw5rf9PemsLCtSnbSDb4ieV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgPoNmnVTPJmTIDcScgVs0yDzvWuFLnIzxJFNhox3/w=;
 b=R6ZRntETpJGz/igpAS2Hig5Q4RWkLNRh5nE/kGglbZ/Mb4qR/h+iWJGQbJ2bCvApJwVCWssx9g3KskTwY5GhbJ5WOa9YdONkfWj6ZQmY38tz8UGhXrguDPuZKw7WuOaez7YKT7aypRnD7uQOaDkl0F2rf1a6QB1pHv6ptrCuqx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 00:43:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 00:43:47 +0000
Message-ID: <c9f4996a-0091-4649-a7d4-563685a6427c@amd.com>
Date: Thu, 27 Mar 2025 19:43:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com
References: <20250327221423.1248521-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250327221423.1248521-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0136.namprd11.prod.outlook.com
 (2603:10b6:806:131::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc60314-2955-4cc9-d448-08dd6d9199b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjJuWWNpNnpQczJyTVNhd04yQjdwdEFaYmRKUzdXVy81c3F2ZzlocitLMk52?=
 =?utf-8?B?R3ljbHJiZ2dSVkFBc2hQa3AvRk01MHJjc1E0c21iWHRXaExFS2tmK0crQlQw?=
 =?utf-8?B?WEI1UTNIV2xIeUxUY3JCWmR3aXJ3YVE0aHVXTzRWSzdiTmhoSFZBK09NMmFS?=
 =?utf-8?B?KzNYKzhjbnhHUk1KTTRUY0EzQXMxOUtVNURSY2tkYU0vbkhGZFZLZzB2R0xw?=
 =?utf-8?B?Z2VZbnFleG5mU0FqMnV1VWtDaGRseHdBdk5zQlkrWlpKbjRnS0haSDJKVDA5?=
 =?utf-8?B?a2lpTG5xSktYOXZGTER6bU9QdjFCb3dpR3k0NlBmYnhKVmErRXVOdXc0ZUNC?=
 =?utf-8?B?aGg2czJMZUEwUDh6Lzh4d3M4N1NkVkUvRDdGT09VYTRPaFZOcDNGRDZQYi8x?=
 =?utf-8?B?enl6NGg4WXEvSnhwU3NjL2VKY1BQZVFWUGcyQTJOU1ZFVWs0QVNTZnAzZUIv?=
 =?utf-8?B?bGRMdkZLQ0R3cXNLY2tlU2MvMkExdVVUUGhiMThkUzQxSmJ0RGtmbkNQQzQ0?=
 =?utf-8?B?S0JuTHFzcnExSURqQ21GNGY2dVppUzQ2Y0tVNFF4d1cwaUpsT1lIaFJSZUtn?=
 =?utf-8?B?dnhVSS9uaGJNOTA3ZUlhS0dLbmFGR2hmRE9malpiMW0rM1JzNjMrODkyVHdo?=
 =?utf-8?B?c090RytXdEJBVTdNRVRRN2pVZnNsS0FDejUyRThNcFNJblkzRjlYZzFsSGVD?=
 =?utf-8?B?NlIzNjlHUTVQUkFsbmR0Tkx4QzNVc0RNWlZpWG84WVFkZGc1K0VHRUd5Y3NJ?=
 =?utf-8?B?TGRPdHBuVmU2Mk1XdG02eFVzUUpNUHRQWXNlZDZjUFB3NnczZ2h5SjZxNXZr?=
 =?utf-8?B?UUhPdVVXdkxtQjVDeVdwWmRPbWFZL1UzNkJrNTdhbVpzTUhYT1F1N3BuQ01H?=
 =?utf-8?B?d1hVYVRHdi9hbWdPejhLTG10RGtFc2xNNmVqYm10MUNRaXF0bHFJQ0ZXU1dp?=
 =?utf-8?B?YmdtOGZGRGg3QlpORXBjcmFCTkliSlNSaUU1WnI4YzdzMnhtT2NPMzlLN3Rn?=
 =?utf-8?B?clNBZGxtMkpoZUwrbGVid3BpemQ2ZDhteXRpd09CQkx4TFhwQmoveEQ4ODJa?=
 =?utf-8?B?SDY0VWlzdllpekxaWmpiVFh1M1pUZWtjMVorSFlnSmJXaE1XS0Y5a1FDaXhI?=
 =?utf-8?B?Ri8rUnRYRllPamxBZW41enVZY2Vha2FTeUN5aDB5RkdXZHVRY1dvMWpDcWJ1?=
 =?utf-8?B?em12WUVxb1B3Snc4N3Z6U1VPRXNkVkdrenJZTkZoeXhnb3h1WTlRcVhOdDNx?=
 =?utf-8?B?T2lTWkdnYWJxeFpHQzBpeVAraUJNZ1hqV0lGQnhMdmJKSndLZEF4cnJTbUlu?=
 =?utf-8?B?bWpJVitWVUhhWmN1dFFZMmNyRGdQdVpWM0ZDSDFTNlN1T09YZ1dyVWpid3N1?=
 =?utf-8?B?ckw4WFZHVDgzcnVCTEhhM0hnRmprdU4wWHYrRUtva0NwZ0hqcjNrYUVvU3ZV?=
 =?utf-8?B?U3YrWDdHUGcwZnQ3cmpoVE5kZ3lQaEhVNW9ubTAzc0tvMFljb2dWUDlVYjNj?=
 =?utf-8?B?N0wwdE9pbklvamQ0N1NpSDR0REw0L3huSnJ2eGlEeWt0R2hPMmduUDlqSkcy?=
 =?utf-8?B?elJrSnJTVDE2V1dMM1hlTWZIaUJrdkI0TmxBNzF6aTdCbzB1c2NNcTBER2lU?=
 =?utf-8?B?UHgvbmVrekJpdDRsa3ovUHNtNDZ6b0xTc2hpRzY4WkJzN25sU3Q4TGJqZ2Zk?=
 =?utf-8?B?L3U3Q09HK1JuR1JNMnhUNW5ERTl6VWlNbkVaeFFQRWxNZVV6L3ozYUxENUo4?=
 =?utf-8?B?YS9JMjV1SjJId2lrSDJ5ZDlZdUQ5MGdrT1lFeEVPclJMVms2aVI2NkZRNjVr?=
 =?utf-8?B?Rm05Z0I2UmhjTS9ZN29hemVLZDR4L1BMTlZzc0xMNnhDUGhiMHZHTEt3c1JJ?=
 =?utf-8?Q?vINmnefPqcV6H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJZNzBjblQrUzB5dWxvNElXY25TZ1hneGYwa1d2SVcrQmRQSXcxWUhLY3Vv?=
 =?utf-8?B?cjNWbFErQlR6MFplMkZrUWF2TWJkR3k3TjkvSUpUUGd3WmtWWFMwT2I1SDIr?=
 =?utf-8?B?TTNoM3Y5RW9PUGdHYVlxZHkxOHhkZ0xzbGllZm1GT0Z3dURadFZRWGxEd0xw?=
 =?utf-8?B?UDhuT3grOU51K3BLRmR3cXBkd2ZQdjNlN0l0Z21LQTE1c2tTR081U2JhaEpp?=
 =?utf-8?B?WkNxT3NQUGtUR0F1S2w4NEhaTElUcWs0UmlnR0F2ZjB4WmlwL3RSTzFOWVBK?=
 =?utf-8?B?bzNERUtQOEYvZWc4aXJWZmR2a0wwdnVnU3pmTmp5Zm9YckxUOCsvVmYwVFhv?=
 =?utf-8?B?VllPSVRPV1Y3SzArK0IwRlU1eG5WMXd5WW9qYTc0QmFFOXl6Vm0yS1lFWC94?=
 =?utf-8?B?YTV6NWdDMG5MU0lLZlJERnh3am9JY2R4WTNONTJNQndzVUJlakpWN2s3ZGRW?=
 =?utf-8?B?MXJVYWxzdFhFcEhPaXlnK1lSL29pbWlCeFV5SHNTSlhpTW4rVVJ3RkljVTdp?=
 =?utf-8?B?dXNpd3ZMMEFvbmoyUTNvU093TGZNOWVPUTZFWk1ZUzNmd093LzFyekdFZFhq?=
 =?utf-8?B?YlVYYmFVd2dhUXlnbU5VWjhrNEhaUFY2S043WVNrTitNZnB6bVlSZTFhaTNP?=
 =?utf-8?B?UFdIVmxKcTZwN2hNT0ZQdmU5SmwwQjM4ZlIvOElaTzNVWUk5VFJ0Ym05VzVn?=
 =?utf-8?B?OEJHZm9ab05Ta2psVmN0bFlBcjQ4ZndXU09yK3VkZlU3Y3k1a0RCUGc4Qmtp?=
 =?utf-8?B?blhMWnJLOXFuLzZ4TmU1d212dWdycFVUY2VvZVFUdWlDV09PMkpXQjl5V1dx?=
 =?utf-8?B?TVcvU2k3UTRUWEF4V29LTG5qa1ZiSEg2cWRRaE40UE1nWndMaXpsQjEyUmtv?=
 =?utf-8?B?bTdNcTBxclVDNDVFZ24zMDF3NjR2TXhiT3Rydy9rT0w2TGJtellsdFd4KzZw?=
 =?utf-8?B?MTc3M2FDZThCRHNibjNXRlh4cFZWcDUvT3pRb29ZdXJDd3FvSDZHa3U4NER4?=
 =?utf-8?B?NzJzSHFpTjZjUjJCUmNEN0p6eElWZVhvZmJqWEVqT0E3OGFQMFRRcDRnaFdZ?=
 =?utf-8?B?Ung0UVNrbWNIdE93TGNPMWxMZ2FZbGlocWJnTm5zVGJpM2Z1a2R2anBwNk0z?=
 =?utf-8?B?WGpCbUNYKzV1TWcydUVrNUxoaXlPYUgyellPbGg5RG9lVFZ3MWFIWXJZbUNz?=
 =?utf-8?B?TytqeFdkQ3BJUDlXaXBGbVg1R3cxeDg5aUZEY0Z1aUFVS2hzakVnWmtIeGl0?=
 =?utf-8?B?QmUvNmJZZXRiTG9nc2hSbGoyWG5WMjEwY1BLYmJ6cnJVbFVCUkZURDNDMTFC?=
 =?utf-8?B?Y1dtVWp5WVMrYjZ3ejN1RklhVHBkSnZWMlFOVzN0Wmh6WUN6V2krakZqdWky?=
 =?utf-8?B?VVVtQTVieW85K25vUlBSdEw5aWxvUzJ0THRucWU3WldoR1NhVTNMdEtUOC9k?=
 =?utf-8?B?L0JJWmFYRmxiZUZOSGlqUGorRU5mRHN2QUNvKzNjYkE0bWVuZi84a1o2YjFO?=
 =?utf-8?B?M01zZ3g2akVIS2dyVk1uUi9TZGVweVZ2OVErSkIrVGlSTzVOMS9QS3NucjBY?=
 =?utf-8?B?K2FnOG9tNnNqUjM3eDhIWGxyeG53VXZ1MldmNzlVOTYyM1duZ3JTRFFiMXBH?=
 =?utf-8?B?MzRjSFVNM1JjU0JYbnl0akQ0elV2TVVGR082U0cxR0ZyUkFIOEhlTjFsZHQz?=
 =?utf-8?B?TC9EclV4Znl3YzAra3BGa3hzYjAwV0FxNmljL2RRaUFhcnNLUFh6NlQ5UXE5?=
 =?utf-8?B?elZraVlDMWQ1Zm5CWDBMNWRTTXc0M3pXZEIrTmNhYTJVSGtia0tPRGtJMXN6?=
 =?utf-8?B?c216KzlBSXIrRytyUUpaWDFTQ2crdTdkdjBoaVo3UFJDK1dta2l2cTI5NEN6?=
 =?utf-8?B?cjFTeVpPUFhPcUVBcTByb0pIb3VqWUUzdGJqd2JIRzRNaStTWUh3NFdnaTYy?=
 =?utf-8?B?bUVUM2srS0l2U3lkUG14ZndML3dmdmc1OWpvcjcrL041WjhHejJ6TzA4UnV4?=
 =?utf-8?B?WjkwVDZ1SEQ5NG9EdXlqOENxdFN1VmtEYUJJN1ozSW94YVAvZUpnQmhCN2cw?=
 =?utf-8?B?V2ljZmFycTlTeWJaZDVTSlpvNVhoLzZmUUVISDZyMnk2Q1JYTDRYMGdYNGVY?=
 =?utf-8?Q?3bQ0F+5i7hbxrQBqI9c28b9ph?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc60314-2955-4cc9-d448-08dd6d9199b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 00:43:47.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Tiueq4f49vcrhEApbF/WmytTazZ6t0MeL7H8mu4KtlsYHtjNq4eZaEIXzdmJgB6X1OEJXqKa6W9OF/2HjHu1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463

On 3/27/2025 17:11, Pratap Nirujogi wrote:
> ISP device specific configuration is not available in ACPI. Add
> swnode graph to configure the missing device properties for the
> OV05C10 camera device supported on amdisp platform.
> 
> Add support to create i2c-client dynamically when amdisp i2c
> adapter is available.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
> ---
> v2 -> v3:
> 
> - Remodelled as ACPI driver to bind the device when matching
> acpi sensor device is detected. This eliminated the need for
> dmi checks for platform validation.
> 
> - Added software nodes to align with camera device-tree format
> to capture the camera device properties missing in the ACPI.
> 
> - Constructed swnode graph in the below format to successfully
> parse the endpoint node using v4l2_fwnode_endpoint_alloc_parse().
> 
> OMNI5C10 {
> 	refclk = 24MHz;
> 	ports {
> 		port@ {
> 			endpoint {
> 				bus-type = 4;
> 				data-lanes = <1 2>;
> 				link-frequencies = 925MHz;
> 				remote-endpoint = &ov05c10_refs;
> 			};
> 		};
> 	};
> };
> 
> - GPIO sensor lookup is moved out of this driver scope, it is taken care
> in isp driver module init.
> 
> - This platform driver is specific to AMD ISP4, hence renamed driver
> name as "amd-isp4".
> 
>   drivers/platform/x86/amd/Kconfig    |  11 +
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 354 ++++++++++++++++++++++++++++
>   3 files changed, 366 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c

Pratap,

Overall I like the direction of this improvement.  A few small comments 
I notice below.

> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c3e086ea64fc..4b373edd750d 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>   
>   	  This mechanism will only be activated on platforms that advertise a
>   	  need for it.
> +
> +config AMD_ISP_PLATFORM
> +	bool "AMD platform with ISP4 that supports Camera sensor device"

Now that this is an ACPI driver this should be tristate because it can 
now be a module.

> +	depends on I2C && X86_64 && AMD_ISP4

Now that this is an ACPI driver there should be a:

depends on ACPI

> +	help
> +	  For AMD platform that support Image signal processor generation 4, it
> +	  is necessary to add platform specific camera sensor module board info
> +	  which includes the sensor driver device id and the i2c address.
> +
> +	  If you have a AMD platform that support ISP4 and with a sensor
> +	  connected to it, say Y here
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index c6c40bdcbded..b0e284b5d497 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
>   obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>   obj-$(CONFIG_AMD_PMF)		+= pmf/
>   obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> +obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> new file mode 100644
> index 000000000000..c4dce3779543
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ISP platform driver for sensor i2-client instantiation
> + *
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device/bus.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/units.h>
> +
> +#define AMDISP_OV05C10_I2C_ADDR		0x10
> +#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
> +#define AMDISP_OV05C10_HID		"OMNI5C10"
> +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
> +
> +/*
> + * AMD ISP platform definition to configure the device properites

properties

> + * missing in the ACPI table.
> + */
> +struct amdisp_platform {
> +	const char *name;
> +	struct i2c_board_info board_info;
> +	u8 i2c_addr;
> +	struct i2c_client *i2c_dev;
> +	u8 max_num_swnodes;
> +	struct software_node **swnodes;
> +};
> +
> +static struct amdisp_platform *ov05c10_amdisp;
> +
> +/* Top-level OV05C10 camera node property table */
> +static const struct property_entry ov05c10_camera_props[] __initconst = {
> +	PROPERTY_ENTRY_U32("refclk", 24 * HZ_PER_MHZ),
> +	{ }
> +};
> +
> +/* Root AMD ISP OV05C10 camera node definition */
> +static const struct software_node camera_node = {
> +	.name = AMDISP_OV05C10_HID,
> +	.properties = ov05c10_camera_props,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Ports node definition. No properties defined for
> + * ports node for OV05C10.
> + */
> +static const struct software_node ports = {
> +	.name = "ports",
> +	.parent = &camera_node,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Port node definition. No properties defined for
> + * port node for OV05C10.
> + */
> +static const struct software_node port_node = {
> +	.name = "port@",
> +	.parent = &ports,
> +};
> +
> +/*
> + * Remote endpoint AMD ISP node definition. No properties defined for
> + * remote endpoint node for OV05C10.
> + */
> +static const struct software_node remote_ep_isp_node = {
> +	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
> +};
> +
> +/*
> + * Remote endpoint reference for isp node included in the
> + * OV05C10 endpoint.
> + */
> +static const struct software_node_ref_args ov05c10_refs[] __initconst = {
> +	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +};
> +
> +/* OV05C supports one single link frequency */
> +static const u64 ov05c10_link_freqs[] __initconst = {
> +	925 * HZ_PER_MHZ,
> +};
> +
> +/* OV05C supports only 2-lane configuration */
> +static const u32 ov05c10_data_lanes[] __initconst = {
> +	1,
> +	2,
> +};
> +
> +/* OV05C10 endpoint node properties table */
> +static const struct property_entry ov05c10_endpoint_props[] __initconst = {
> +	PROPERTY_ENTRY_U32("bus-type", 4),
> +	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
> +				     ARRAY_SIZE(ov05c10_data_lanes)),
> +	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
> +				     ARRAY_SIZE(ov05c10_link_freqs)),
> +	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
> +	{ }
> +};
> +
> +/* AMD ISP endpoint node definition */
> +static const struct software_node endpoint_node = {
> +	.name = "endpoint",
> +	.parent = &port_node,
> +	.properties = ov05c10_endpoint_props,
> +};
> +
> +/*
> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
> + * fixed to align with the structure that v4l2 expects for successful
> + * endpoint fwnode parsing.
> + *
> + * It is only the node property_entries that will vary for each platform
> + * supporting different sensor modules.
> + */
> +#define NUM_SW_NODES 5
> +
> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
> +	&camera_node,
> +	&ports,
> +	&port_node,
> +	&endpoint_node,
> +	&remote_ep_isp_node,
> +	NULL
> +};
> +
> +/* OV05C10 specific AMD ISP platform configuration */
> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
> +	.name = AMDISP_OV05C10_PLAT_NAME,
> +	.board_info = {
> +		.dev_name = "ov05c10",
> +		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> +	},
> +	.i2c_addr = AMDISP_OV05C10_I2C_ADDR,
> +	.max_num_swnodes = NUM_SW_NODES,
> +	.swnodes = (struct software_node **)ov05c10_nodes,
> +};
> +
> +static const struct acpi_device_id amdisp_sensor_ids[] = {
> +	{ AMDISP_OV05C10_HID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> +
> +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> +{
> +	return !strncmp(adap->owner->name, "i2c_designware_amdisp", 48);
> +}
> +
> +static void instantiate_isp_i2c_client(struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info = &ov05c10_amdisp->board_info;
> +	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
> +
> +	if (i2c_dev)
> +		return;
> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
> +			ov05c10_amdisp->i2c_addr);
> +		return;
> +	}
> +
> +	i2c_dev = i2c_new_client_device(adap, info);
> +	if (IS_ERR(i2c_dev)) {
> +		dev_err(&adap->dev, "error %ld registering isp i2c_client\n",
> +			PTR_ERR(i2c_dev));
> +		i2c_dev = NULL;
> +	} else {
> +		dev_dbg(&adap->dev, "registered amdisp i2c_client on address 0x%02x\n",
> +			info->addr);
> +	}
> +	i2c_put_adapter(adap);
> +}
> +
> +static int isp_i2c_bus_notify(struct notifier_block *nb,
> +			      unsigned long action, void *data)
> +{
> +	struct device *dev = data;
> +	struct i2c_client *client;
> +	struct i2c_adapter *adap;
> +	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		adap = i2c_verify_adapter(dev);
> +		if (!adap)
> +			break;
> +		if (is_isp_i2c_adapter(adap))
> +			instantiate_isp_i2c_client(adap);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client = i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +		if (i2c_dev == client) {
> +			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +			i2c_dev = NULL;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block isp_i2c_nb = { .notifier_call = isp_i2c_bus_notify };
> +
> +static int release_amdisp_swnode_props(struct software_node **swnodes,
> +				       u8 num_swnodes)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_swnodes; i++) {
> +		if (swnodes[i] &&
> +		    !IS_ERR_OR_NULL(swnodes[i]->properties)) {
> +			property_entries_free(swnodes[i]->properties);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int initialize_ov05c10_swnode_props(struct amdisp_platform *p)
> +{
> +	struct software_node *sw_node;
> +	int ret;
> +	int i;
> +
> +	if (strncmp(p->name, AMDISP_OV05C10_PLAT_NAME,
> +		    strlen(AMDISP_OV05C10_PLAT_NAME)))
> +		return -EINVAL;
> +
> +	/* Initialize platform specific props for each node */
> +	for (i = 0; i < p->max_num_swnodes; i++) {
> +		sw_node = p->swnodes[i];
> +
> +		if (sw_node->properties) {
> +			sw_node->properties = property_entries_dup(sw_node->properties);
> +			if (IS_ERR(sw_node->properties)) {
> +				ret = PTR_ERR(sw_node->properties);
> +				goto error_release_node_props;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +
> +error_release_node_props:
> +	release_amdisp_swnode_props(p->swnodes, p->max_num_swnodes);
> +	return ret;
> +}
> +
> +static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	const struct software_node **sw_nodes;
> +	const struct software_node *sw_node;
> +	struct i2c_board_info *info;
> +	int ret;
> +
> +	isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = initialize_ov05c10_swnode_props(isp_ov05c10);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	info = &isp_ov05c10->board_info;
> +
> +	sw_nodes = (const struct software_node **)src->swnodes;
> +	ret = software_node_register_node_group(sw_nodes);
> +	if (ret)
> +		goto error_unregister_sw_node;
> +
> +	sw_node = (const struct software_node *)src->swnodes[0];
> +	info->fwnode = software_node_fwnode(sw_node);
> +	if (IS_ERR(info->fwnode)) {
> +		ret = PTR_ERR(info->fwnode);
> +		goto error_unregister_sw_node;
> +	}
> +
> +	return isp_ov05c10;
> +
> +error_unregister_sw_node:
> +	software_node_unregister_node_group(sw_nodes);
> +
> +error_free_platform:
> +	kfree(isp_ov05c10);
> +	return ERR_PTR(ret);
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ov05c10_amdisp = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
> +	if (IS_ERR(ov05c10_amdisp)) {
> +		pr_err("failed to prepare amdisp platform fw node");
> +		return PTR_ERR(ov05c10_amdisp);
> +	}
> +
> +	/*
> +	 * Register notifier to instantiate i2c client when AMD ISP adapter
> +	 * is ready.
> +	 */
> +	ret = bus_register_notifier(&i2c_bus_type, &isp_i2c_nb);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	return ret;
> +
> +error_free_platform:
> +	kfree(ov05c10_amdisp);
> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	bus_unregister_notifier(&i2c_bus_type, &isp_i2c_nb);
> +	i2c_unregister_device(ov05c10_amdisp->i2c_dev);
> +	release_amdisp_swnode_props(ov05c10_amdisp->swnodes,
> +				    ov05c10_amdisp->max_num_swnodes);
> +	software_node_unregister_node_group((const struct software_node **)
> +					    ov05c10_amdisp->swnodes);
> +	kfree(ov05c10_amdisp);
> +}
> +
> +static struct platform_driver amd_isp_platform_driver = {
> +	.driver	= {
> +		.name			= AMD_ISP_PLAT_DRV_NAME,
> +		.acpi_match_table	= amdisp_sensor_ids,
> +	},
> +	.probe	= amd_isp_probe,
> +	.remove	= amd_isp_remove,
> +};
> +
> +module_platform_driver(amd_isp_platform_driver);
> +
> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
> +MODULE_LICENSE("GPL");

