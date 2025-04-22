Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAF135A63
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303006; cv=fail; b=cD/UYF6mdC0x5PbjRHusDObs6mixxTKClJlQ/SKIxNlg9JY5SCXrG90EhmEU0FAztXFlTYTwZwBX19oGtEPEkpwWeLAl5fZ8qDDdPqmjd+YWI2Zy6cveEDdwZ2c+0TqNMSQWigIwdQFmaVkCNmCNHdBXw8HoaaygTR322BWiBL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303006; c=relaxed/simple;
	bh=joRcOWA/mERi0vKD+cgofqnCHSV/WDtkEsGXOuL7DlY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OMvGRAXcD1pnnG/6/V8jYLNxnX1Y13qmm3xDCZ3x6XdVrcBBCMfGGHc+inJIyGf0oJWy2eTEvh1CcuJSVrIpKQzWAmI+ViaqRh11IQICcsVgyNox0tCm+PkSyCDgP9i/81r6l8e9Pokt2ul9nWpMBVdruL065lcXOvF7rCTA5Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UVvfTvVD; arc=fail smtp.client-ip=40.107.92.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UVvfTvVD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnyrvGktj+IniHmXOdd84/MFUgkoKy2JgTpC9EWosaRNhLaDsQHSjzRV6EpJnPGGIizjJxPrZZopyH40nGlgmE8gIjPBwq5eHYx9608ahp3w5EUDD3hkzKJlHCxbzjEbtCkdlNmr3jVwSJuNp6cS7jsEd5QA1W5eZP54A+F3w5nY2fDEd94inYZSTUNJM5CYY16G/+hLl8VHqmlzEvYgjsqlBWqgYp5UQP1YY5cjVEJOIsbJsjZpbJDrje9tfYPEtJpcpAkSzFHGi33AJx0/ujlAadYtN3JPn6WZ99RZppIw3SYtLc+mjaX7dWr6DzRK1hyOf2Ef6fI6Nlvu1YJ6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=As+B6kvs6Kph+TsK2Y0UpslvghPTg3UAxISzQ540f+Q=;
 b=gUvueutACsEHkOedlA0Lvp9ssDW4GGYKFjvbzzQ87YMJRHKgE8AkYXKZ6w5OscwwZKUYbZqNCelbGdrxo3ccv/UZRh0tteTfTLBhGmJbXRCHIIWERqOD9KL0nwgXUHxlJS589P6zF9lloYCr4oXX5qxwBBfifI12ReuBod5xJ/nedzf++kV+4UWXRzLx9vb0US/nzCnsgWh49T3CVLNh6tRCQ7ISphOjcApIG8ThRJbuP29m8gk2X4GroRkpEJg17jdzVAY8TU07iW8MUXcRcf+HsOxkK7Jt/1bUsIbhTndYAsCGJYMVKf0Gglm/2at4Pslgcpum6JJuvbuXpTLpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=As+B6kvs6Kph+TsK2Y0UpslvghPTg3UAxISzQ540f+Q=;
 b=UVvfTvVDTAt8losLe8TWH6fPEvVxFYWF0bWEI9Ojrid3YIBTX/+7xC8QXZG3WkvAaJUztcZ60kKv1i6mHrliI3AVIRf7XuhnB1gE5lp1U8Qq4rko2t35+oXitoLyh7bMrXBTYXXcXZwQmwZ2eJTqg7CuOpj6RBk5Xc2M2eDCAro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 06:23:17 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 06:23:17 +0000
Message-ID: <0d6ba41c-0c90-4130-896a-26eabbd5bd24@amd.com>
Date: Tue, 22 Apr 2025 11:53:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
 luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
 rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
 jon.grimm@amd.com, bharata@amd.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::6) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: d053041b-eb31-4355-95fd-08dd81662b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFQ1WW5WZDZMUXJITk5rUlN0cnVVWmFyRmdmVnkvcjQrOHdxVTlGMU12NWdB?=
 =?utf-8?B?RXBpaFlibERNWHVaNW5MZitIZFRhVkpUMWdCdWlTNFFYd04vR1ZHUTh5OG1H?=
 =?utf-8?B?RjZtck8xMU81emFJZHhQR2kzV1lqUlJtZHVmcW44RHBrMzJQaE9LVFVENysw?=
 =?utf-8?B?QWVxTU5TUExOTHcvRGZpSGVPOStVbFl4S2g2VmhRUFdLQnY0ajdmc1Q5RXNs?=
 =?utf-8?B?TU9uVlJVV3VoZU9uY29KNnpXREQvbmdGQnpBOGo0cmpMVWVrOUxtdWtaeDhV?=
 =?utf-8?B?Y1lkZWx3T05adU1UZnpXdysvWEVsc1FDTjV2VTE4Z1ZVQUl0VUhja0lvSG9D?=
 =?utf-8?B?NlNubEhta2hzSjcwekJTUUg2aHJXWlJHd3c1NDN2WTlWY3JWU1hEL3RFcjF2?=
 =?utf-8?B?NncwMGlhWlRLdkN1TlVEM0VaaU9NRzJaOU9lRk1EUGoxa3dJNVNlOGNFbUYv?=
 =?utf-8?B?U3dxZnlxWGlqaFFIZWl6NVVuOXRGbEhHU29iMlk5TkJCS0xaOW1rZ0FvODJH?=
 =?utf-8?B?eUp2RVR6MG56TEVZUEd5SjFRcWdvT0pzVzQwVnNBaXB1OURiVUhxNTZMTVhs?=
 =?utf-8?B?OEdNYThZZ2ZhcDViZHgxcHNCQ2FYVnBkYUNFeENSY08vMzNzU2JDQWw0blhV?=
 =?utf-8?B?QUI0MHdvRkw5WlptUUVxOVB3eTVUTTJXbFhqUVllTmtOQUdYY3MrK25aM2Uz?=
 =?utf-8?B?M2tBSnBzVzNxem5NU0xEZWF4M2tOdnVWN3dHREhVdUMvZlZUTkhyYXMraGR4?=
 =?utf-8?B?ODRUbUVOTE9mcUtKTUYrUEpoQ2VneGNGKzA1b09aeFBDR2VpRE5ybE55TXI1?=
 =?utf-8?B?eldpblhnVGdYR0pzNkFuK3BJTGw2Umkva3krRE5peTg0UXhXaWVOeUVvME1P?=
 =?utf-8?B?SmVySUhyL0Q4NGhFb1dIeGRXZVlSNmVYZmhUMEVCZXdqY1hHZ3czVHdQNnZp?=
 =?utf-8?B?aFhubzZPM3lKRGt5emF2eVd2Tmp6MVBaekcvSUx1UmRXbE5QZFhBS1dlVjh6?=
 =?utf-8?B?NlZZdXR1T1hYTDRCWHlqdE1WOUJwUWxxc3pGNlU4Mkt3c0kwYzE3bW5yUkhP?=
 =?utf-8?B?WGpYQ1dNVkxKN2tUd3JJWjhTQWthVkYvWGRxY3kwNzg0cG5EWDM5QlVUcUNi?=
 =?utf-8?B?SHVpZjkrU1VueFpjMlgyNlVsTjMrbnpCVDFIM3ZXOFNsNlJGQlN3TERrQ0po?=
 =?utf-8?B?TzVzMHlOTHk2TEdic05mQnp2WHRabGVTOThESzFGUUkxcTltRFZ0K2gxeUp2?=
 =?utf-8?B?TGwxODBUc3VURUJGUEFYS2dRbTRhekR0SGpBUi9JRlZiN2V5Qzh3UFdZelM3?=
 =?utf-8?B?YUF4bHBQNXR1OW14SzdCbEM0V3BXUHRZMG02c2lIa0dteXNDOXhveUlkekJ1?=
 =?utf-8?B?R0xwQVpCSkNOZlYvWllLVmlVZnRWaSs0SnJZeGozOWdCWUFIY3AzWkMveHJv?=
 =?utf-8?B?cDRtTml2eVlRSENGZkVpUXNRbStnTFpoc092Y3B5Y09tRHNrdHdidW81UzI5?=
 =?utf-8?B?NkxLMkF1NktuWDF1dnVuZUt5MWsvV2grVTZZRy9EbWNpYzFYZUJiSDZrS3dC?=
 =?utf-8?B?NUJJWUdtalMwcWlPR3cxczhkMkdRQ0tJcGFnZzFoWFh0OS9WWm02WEQrL2ps?=
 =?utf-8?B?VnZhMHBNSEM4VGVJVjFZblY2SUhiSllDcDkvWU02VzJURWpyVVNHYitVWnky?=
 =?utf-8?B?YXFta0ZUUzhDTEJDZUVBNEtTOXRsUHJUSnhwQmx0aVUrQ1ZiajRZbzhYbkI0?=
 =?utf-8?B?eEVMS1lMMklvcFFhYmZlbnFrUGExNm94NHhMSkF3SFl5eEtHOGQ2WUZOd3FI?=
 =?utf-8?B?QlB3djhJMHpMQmtCRlhVeFp5YlBETXgvNGNqSkE1M1hNTVBHMnBHYzVTWmxD?=
 =?utf-8?B?eTh0bE1ack0zWDdaaUhvNnNWY2VNVjkrdllCOWkxaXMxem1rRUhsK0R2NUtk?=
 =?utf-8?Q?q5ZbiVrR1C0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXhvRnoxc0JtcWw1bnJhUnZOZnVKSjlJYlJIaDVsMHNzTmtoaWdyY2MxRTE0?=
 =?utf-8?B?UGU4ZDRRN0EvRGU3QTZPbGJIOUwwZ09vM0VZdXpEMFRMdUlSWWhjcGRuMHds?=
 =?utf-8?B?cHZHUmZvTm80bWJxRXVFYSttb3FxSGNUR0Iva0M5MXlTc2x2RjdWS3p0SVlt?=
 =?utf-8?B?N0x2UGlVaCtYU2djYWVoQm1EeDh5RWYvd1lHOUo1aDc4MXhoRGtIN2xDenh6?=
 =?utf-8?B?YUJ5dTBoa3lBWmRKVDVuZlA5SHNiRCtodnpOdWE0ZVdsSWJZck5oSHVmSmtV?=
 =?utf-8?B?WHJYcXZyQzdhanRlSTJZQ3dQd2dhYmpWcjdLb21wQ2pwSDhlOFFGWEp5NUZ6?=
 =?utf-8?B?bHVUalh1OVdDTVpGWnJibVVqWjEvVzFBZW9hYWp6R2x6dmM1ZUJJYlZiR294?=
 =?utf-8?B?UGQzdXIrRitPd2d5UVBaelkwUnZGY29Fa3N6Rjl0VFU4MktLLzg1Z0syMUk2?=
 =?utf-8?B?Ujd0OW1vZUp6cG1IdXFpUGlKMy8xK1BEVkZ5NjRCaHhydkZ4Q1Q4bHFRZGtp?=
 =?utf-8?B?djhYc3ZKRGplUGxmaytWMExaNlBHbEJoRjhOVGtJalhjSk51dTR3MW5VWmNO?=
 =?utf-8?B?OVBpTk43Q2pCY1Z2NFpCMXRFWXlnVDdEV2hjaFdJS0pBdFNwY2piT0VSbU1G?=
 =?utf-8?B?bWJkY0RQckc5cFpxeXFNMmtWUUNMTFBrYkdhQ2RMUjZrcU9Gckt5bWxFOExn?=
 =?utf-8?B?MlRPOFMxSkNuYk9oMDJVR1lkZVhzNG44aDhaTEU3WmU2aE9QMzBBYU4zRk1D?=
 =?utf-8?B?dngxOUFPT1owdU1uS0drdlFQUlZrNFA1dERVSmRzV1FKU2c1Z2MyNjdCeS83?=
 =?utf-8?B?Y25QNHljV2dEV09JNDN4ZnZsRGJMZkRod0lCSGE3M2hVejg5MzllTnNUYjJV?=
 =?utf-8?B?d01xWGVlU3BuUHdaMFZNejg2TFFEeWdjOWdTemwxeGVGRWNvakRuYmxLZGty?=
 =?utf-8?B?S0h2VUsrNG05TXlBRG9WVWh6S3pVQXE5dGFSaU92SXRMcVladFpxZUtCS1JJ?=
 =?utf-8?B?MzN4ZEtOd1ByK0pTeDdoQk4yQmsxUXJaaU5zbDZ0blBnVVNJVnBHMnZoS0xB?=
 =?utf-8?B?TXZUOG1NVzYzV2RmOFZoNHhSYngvVUlLOCswU21jMUh2dVcycUM0V0ZycGFM?=
 =?utf-8?B?QmpTTHMzVDk0NURadkVWT3QrdFF4aTAycG9lRVJWK1ZhN1hEVDVTQUtsNEtM?=
 =?utf-8?B?bHRDLzQ1Uk0yZndZKy9jcEtPb2pneUZmaE1Cb2tQK1hyQlcwVmZqaWUwcGdl?=
 =?utf-8?B?YTRxeW1qMVJaZlovdCtNbUZlNVY1OTJwSGJKZjFuekJRdk5OWGUrRlJvbWhv?=
 =?utf-8?B?dDlIaEVTZlgwTEZocGlZZTFiUFNjSkZZKytRVjRQM1FmZzRuUVhsM3crN1A0?=
 =?utf-8?B?eXpHdW9xbVEvTEVlb1dib0tzRjQ5OUJXRk93R2dHOWRZN3pxVkdvNkZYMGc2?=
 =?utf-8?B?dld3aTZYQzd1NUVrUktSYmpmNHRLek1nbWpOQXd6TndJN0FlajQ5dTJaSHAx?=
 =?utf-8?B?THY3eHM4bUZuVklySk40OUpDWnhPd2EvdS9sZFpMejNybXdWVTY3RjkvYldq?=
 =?utf-8?B?WUhGRkN4VkVYVHdWTWdvaVFPNGlCQnJ3VUpDSzFad1Q0SXo1aWU0TWJlTTYz?=
 =?utf-8?B?ZVZGVTR0RWY4dnFsU0ZhZllxcUQzdnZaSXpzaS9JUWxmeE9tM2xtMnp6UkRL?=
 =?utf-8?B?UVYvUW1GZ1RkVEQzdE9HOWRjSEVRZzhHdkZJUXRaRFk4QmY4dUJnMi9ZZUE2?=
 =?utf-8?B?MzFYOS9hS2ZkTnZja1ZaQ3BPeEFLSFFpWlJHUHlPVGFNdzhFMTlLYi90NSth?=
 =?utf-8?B?RTdqL1hhMVhuY1ZRaGcyNUhQRW9pV1RCZks5cXNJVFUrM3VuNm9YaUNUdlJI?=
 =?utf-8?B?eTJwc2NkYlVYZ1RJUHVQaFlCbFFvVFk2VW1EckNZNG9Yc3BaR25tbm42b2p2?=
 =?utf-8?B?VFJCUWRtMER0NDZhS0NYeWpFbWpWRlFmdVQrV2NQcW5aWEpWQ09wOEJ6Z3RF?=
 =?utf-8?B?RlR3NytNU2x5OGg1UGpSL1htalovd3pIY1M1bUR5TWZMUWdleFpJN0tOWTZP?=
 =?utf-8?B?Zm5XeEpTQXcrNnRFZ1ZDdjNRQzVkRSttS2FVT2hQbHRETm1RN0Y5bVQvdi92?=
 =?utf-8?Q?xM/l/6vFZsCZO1o68an/tAlnK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d053041b-eb31-4355-95fd-08dd81662b52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:23:17.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gz/8ot/uKl879awUF72DClqRNMkRACq04fdBdGm9BUWNcKOyPOdZDI1ERs1QDJxocr21wm+RpRQhJ7OHTlTvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338



On 4/14/2025 9:16 AM, Ankur Arora wrote:
> This series adds multi-page clearing for hugepages. It is a rework
> of [1] which took a detour through PREEMPT_LAZY [2].
> 
> Why multi-page clearing?: multi-page clearing improves upon the
> current page-at-a-time approach by providing the processor with a
> hint as to the real region size. A processor could use this hint to,
> for instance, elide cacheline allocation when clearing a large
> region.
> 
> This optimization in particular is done by REP; STOS on AMD Zen
> where regions larger than L3-size use non-temporal stores.
> 
> This results in significantly better performance.
> 
> We also see performance improvement for cases where this optimization is
> unavailable (pg-sz=2MB on AMD, and pg-sz=2MB|1GB on Intel) because
> REP; STOS is typically microcoded which can now be amortized over
> larger regions and the hint allows the hardware prefetcher to do a
> better job.
> 
> Milan (EPYC 7J13, boost=0, preempt=full|lazy):
> 
>                   mm/folio_zero_user    x86/folio_zero_user     change
>                    (GB/s  +- stddev)      (GB/s  +- stddev)
> 
>    pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%
>    pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%
> 
> Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):
> 
>                   mm/folio_zero_user    x86/folio_zero_user     change
>                    (GB/s +- stddev)      (GB/s +- stddev)
> 
>    pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%
>    pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%
> 
[...]

Hello Ankur,

Thank you for the patches. Was able to test briefly w/ lazy preempt
mode.

(I do understand that, there could be lot of churn based on Ingo,
Mateusz and others' comments)
But here it goes:

SUT: AMD EPYC 9B24 (Genoa) preempt=lazy

metric = time taken in sec (lower is better). total SIZE=64GB
                  mm/folio_zero_user    x86/folio_zero_user     change
   pg-sz=1GB       2.47044  +-  0.38%    1.060877  +-  0.07%    57.06
   pg-sz=2MB       5.098403 +-  0.01%    2.52015   +-  0.36%    50.57

More details (1G example run):

base kernel    =   6.14 (preempt = lazy)

mm/folio_zero_user
Performance counter stats for 'numactl -m 0 -N 0 map_hugetlb_1G' (10 runs):

           2,476.47 msec task-clock                       #    1.002 
CPUs utilized            ( +-  0.39% )
                  5      context-switches                 #    2.025 
/sec                     ( +- 29.70% )
                  2      cpu-migrations                   #    0.810 
/sec                     ( +- 21.15% )
                202      page-faults                      #   81.806 
/sec                     ( +-  0.18% )
      7,348,664,233      cycles                           #    2.976 GHz 
                      ( +-  0.38% )  (38.39%)
        878,805,326      stalled-cycles-frontend          #   11.99% 
frontend cycles idle     ( +-  0.74% )  (38.43%)
        339,023,729      instructions                     #    0.05 
insn per cycle
                                                   #    2.53  stalled 
cycles per insn  ( +-  0.08% )  (38.47%)
         88,579,915      branches                         #   35.873 
M/sec                    ( +-  0.06% )  (38.51%)
         17,369,776      branch-misses                    #   19.55% of 
all branches          ( +-  0.04% )  (38.55%)
      2,261,339,695      L1-dcache-loads                  #  915.795 
M/sec                    ( +-  0.06% )  (38.56%)
      1,073,880,164      L1-dcache-load-misses            #   47.48% of 
all L1-dcache accesses  ( +-  0.05% )  (38.56%)
          511,231,988      L1-icache-loads                  #  207.038 
M/sec                    ( +-  0.25% )  (38.52%)
            128,533      L1-icache-load-misses            #    0.02% of 
all L1-icache accesses  ( +-  0.40% )  (38.48%)
             38,134      dTLB-loads                       #   15.443 
K/sec                    ( +-  4.22% )  (38.44%)
             33,992      dTLB-load-misses                 #  114.39% of 
all dTLB cache accesses  ( +-  9.42% )  (38.40%)
                156      iTLB-loads                       #   63.177 
/sec                     ( +- 13.34% )  (38.36%)
                156      iTLB-load-misses                 #  102.50% of 
all iTLB cache accesses  ( +- 25.98% )  (38.36%)

            2.47044 +- 0.00949 seconds time elapsed  ( +-  0.38% )

x86/folio_zero_user
           1,056.72 msec task-clock                       #    0.996 
CPUs utilized            ( +-  0.07% )
                 10      context-switches                 #    9.436 
/sec                     ( +-  3.59% )
                  3      cpu-migrations                   #    2.831 
/sec                     ( +- 11.33% )
                200      page-faults                      #  188.718 
/sec                     ( +-  0.15% )
      3,146,571,264      cycles                           #    2.969 GHz 
                      ( +-  0.07% )  (38.35%)
         17,226,261      stalled-cycles-frontend          #    0.55% 
frontend cycles idle     ( +-  4.12% )  (38.44%)
         14,130,553      instructions                     #    0.00 
insn per cycle
                                                   #    1.39  stalled 
cycles per insn  ( +-  1.59% )  (38.53%)
          3,578,614      branches                         #    3.377 
M/sec                    ( +-  1.54% )  (38.62%)
            415,807      branch-misses                    #   12.45% of 
all branches          ( +-  1.17% )  (38.62%)
         22,208,699      L1-dcache-loads                  #   20.956 
M/sec                    ( +-  5.27% )  (38.60%)
          7,312,684      L1-dcache-load-misses            #   27.79% of 
all L1-dcache accesses  ( +-  8.46% )  (38.51%)
            4,032,315      L1-icache-loads                  #    3.805 
M/sec                    ( +-  1.29% )  (38.48%)
             15,094      L1-icache-load-misses            #    0.38% of 
all L1-icache accesses  ( +-  1.14% )  (38.39%)
             14,365      dTLB-loads                       #   13.555 
K/sec                    ( +-  7.23% )  (38.38%)
              9,477      dTLB-load-misses                 #   65.36% of 
all dTLB cache accesses  ( +- 12.05% )  (38.38%)
                 18      iTLB-loads                       #   16.985 
/sec                     ( +- 34.84% )  (38.38%)
                 67      iTLB-load-misses                 #  158.39% of 
all iTLB cache accesses  ( +- 48.32% )  (38.32%)

           1.060877 +- 0.000766 seconds time elapsed  ( +-  0.07% )

Thanks and Regards
- Raghu

