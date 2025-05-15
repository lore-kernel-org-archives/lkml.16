Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC05925B66A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333233; cv=fail; b=snQqJxH3elmkSZ8W3W8ohMXEDajxb9MgiDk/ZfrZj8pEOkdtVabUtaCX4Rrfg/JsBGNAclJRfp88vHvFyzMSbLF1TFZlPYMIu0QEjZP1I+vfrac3fNyiIG/5mGv8SS/hMcr5A/oqpTHZVpaQOiLZz21+6mUaU9Cy//UXZT6GvJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333233; c=relaxed/simple;
	bh=gEpVDjcBrt0x1E+LpoJbwitz4Yzr0gThN+7VuOluuhc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V7GorX2h1hU1ZXqX8oeXTvKvhpDVfdT9XKqMkA2hlHeSLsASf3RW3HFt60bQx18Rd7Npm1ejFMW/Ul+h2Cx7+rpMi8QlvnlkdOO31C68KUI3Re2JvnWLX14+vp8mO0x3l9cQyRkVUKBu8SSV6Tnxdqmkf+xVRXYtvheqAtDGIMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r66dQzfY; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r66dQzfY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kih9mlQ4yKGcIpvbXtJBXrL3YpRP4HcngpD0J+VLz36diYGzsgSEy3Di0l3hZelwN4aXZBpVT6bnk98HXGJF84Sok8ABTYy78EaaEWcQEi7cfVj2+NYGkisen6dz986pQO9xhJlmiFMWWuEFiWBI7jgQPXElMUzvSXphIRXSt6Zv1t8qU34AzBTZQ4RdztX7sHjCAxCbjpnRAIZ/v4gtE9WEGpaEHlvdDqa48S2jFBI2HbwEGvUl6RraVaYiZ09bZNcAtoZWo0+sfdFIFYZ9EVRycuompx8U5ahK+6V4ygbzpPrccIvLsNpY1SO4NBs6fySkIpI4CzfGPYA1FFkrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BZsdvZtJnhhupqh1SvTqIYLgNUxnIO2ExDXAMEHFDY=;
 b=nhPh36jqWyLSKkBOSiQR7Ly79jpLLuJSOiLkCEL687bhiwgkJkvoEzrKDy5nO9lpjim+c3hCbP5TQCVsanp5tix/7zGxe/CBCUoqQ6mVAgbeCBPCL2l265k3B615B+paskaiY40BC4ZcPbfqh2mC7WvLI0qGnmgQWvTMZT12vlqs6Z4BKT4/n1eVJ9tYc5DRdul9roJzmLl3r84Gqa+UeMsYV6CduNYkWQCCU74sUwo11+ZlOmgk3Nw6CcUNCkG94CLEsZLHKctJN82hstcFVqcu2YMse2vGfIveVYSMs7gI+ACxiBVI++cjCDMVG5xU6tSf/KIVthdMyGK4rxppcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BZsdvZtJnhhupqh1SvTqIYLgNUxnIO2ExDXAMEHFDY=;
 b=r66dQzfYTNYZol9EmA8bcdDYH2OEGhvzbYopHd41MO/F0+novMX16OoWF+MjVnQxqfHXzMvjpq6RWHTMQ9TFbBxHdHNfp0xAtW8dzUNAG1/5vhmiDqFGx74ciZjLhe9Il61btzF+KD/ZaLfMAtNWp8bZFTQZ5/4FkSXA2vwm9x0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 18:20:25 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:20:25 +0000
Message-ID: <7c315a0d-1508-4310-b584-ecaeaba52296@amd.com>
Date: Thu, 15 May 2025 23:50:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
To: Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Brian Gerst <brgerst@gmail.com>, "Rao, Bharata Bhasker" <bharata@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
 <20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::18) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|DM6PR12MB4297:EE_
X-MS-Office365-Filtering-Correlation-Id: 3229f538-c56b-46d2-c593-08dd93dd29ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVJBNGJSbGIwN3RNYWU0WlFJYStpWUc4Wmpvb0I5cFA2WnZ4eWZNUTI3cWUx?=
 =?utf-8?B?em5zZUt2QjE2ZTVPZ3hDamhKY1dOUXlGejZtVnFnTjJyOGR4U3RaU2IwczRE?=
 =?utf-8?B?bmdmOEdDQWQyNUZWeXdDMzNCTDJsKzZnOU84ZWYwVnhZcHZsS2x6NGMzREdT?=
 =?utf-8?B?WFBSRUtUeGJtNFVuRmNzWlh6a2NYaGorem1JRWJUUGgzc2pWUnJINHhwZWlh?=
 =?utf-8?B?bGJmVkNnTS83YWt3L1hHZmt5OExuU2F6MFZUc1loeUVjVGdkeTBOR0hzOWQz?=
 =?utf-8?B?N0hsVGdCS2l1WHlUMS9MWjJSenRkbXZ3SWk2L0pSYk8yTWN2a3hmbWpVSXBR?=
 =?utf-8?B?UzFkUWZNL29sRGN2WmI2aGphYlVwRjJpamtDZzkyOXZHMlhmaTU1OVgxNTRZ?=
 =?utf-8?B?RVIxOVhzbWh0aWJDWGFKOTV2MHBwTmlhWTdCcjZGZEpETlFBRVd6Y2xlaUIx?=
 =?utf-8?B?QnBISEN5eVVPSklOL1hMbFIwMlR6cnp6MVBkTU5BWk8rUnUzNnFOajhmaVJF?=
 =?utf-8?B?WGdQNUkrWUk1Z1l5UWYyMXVXQnhRdVMwWm90amIrNk9lSFpKY2xNMTc5Smty?=
 =?utf-8?B?SHVHK0JHQ3VsUVN6Tk5VeGRrVEtIZmZpa3pDK2pwQzhVeHhubnptWWJxZkU4?=
 =?utf-8?B?VXZxbXNvMGJjMi80Z3oxT3pUSG8vYThJQnFOOFRMcHVVZHdqUnRCY3A3UFFq?=
 =?utf-8?B?RWRjZTVmbDBROFh1cWkxaTNkWU5CdGk1K1ZHLzVLa1lOV2d5eW9EbzBiajh5?=
 =?utf-8?B?QUFSYmVWb0hMSE1kQ2NiaE8yeUdFVExESFliQkZSWHRSUWJ3TjZDL1F2eTRa?=
 =?utf-8?B?KzRQMGxpUjlKN1QyVUNPVVN1VDBDQ2VKMmtISnp4OFlSWUtlajdBUzBaNUFx?=
 =?utf-8?B?NCtnVDlsNWpjUjg1Rm84ZXpnb1NheDdXMnA1bVA0cVdJMTNwNW1mODVKeXF4?=
 =?utf-8?B?bTdEekI4dHdlN2ZBTC8yWld4Z1Y0b1QwZUlqQ2tVQnJEbFBleTJFZ0FQVVZm?=
 =?utf-8?B?N3lQcHJFWnhDVzZOVnhxRmpwZno3Q1hVK3dLak9Pc1JZNi9uZTZ1aExiY3h0?=
 =?utf-8?B?SW93S3dGMnVhclZ2dTQ5TU9md1diTGIyTEpNN0xCOHhwUzJNT0ZrdjZ1ZWpq?=
 =?utf-8?B?T3FEYnF2T0NoMXUxdC9ob3BNVUMvU1N3VVdqL25ZWW1xQjFMbk9SdlVNZTQ0?=
 =?utf-8?B?aFhiVXZaV09xemtRYklUdzJiNkM1NWhkV3p0WklzWUVocFJqV2ZHZUtPZXR0?=
 =?utf-8?B?MXRCSStVOVlUcW5LczlCd0RURnB3OG50d3BIMjN2UWgyZ0J1MlRJQ1FHMG9r?=
 =?utf-8?B?Y3g5ZENyUnpVU0U4U1hHK2JWcDMzQmN4ZjkxYmRuK3BDUDRTNkcvOXp5OTYw?=
 =?utf-8?B?RnN6eFFSKyt2K29EalB0cFpiYTNobzVLQjJGdzA2YTdVaDBrVU5qaXMyWkY1?=
 =?utf-8?B?QUVxS1k2VmlVTmJqdm8yQ1JwUXlIV2lUN3F1QzlvY1Nwdnk3V1llOXJPdCtt?=
 =?utf-8?B?d2pUZGpTU0hQd2U1MXhJNjZESDBEUDlKejI1MzNnMTd5YjUwRUlwMjRzODdC?=
 =?utf-8?B?YmFvWmlQSUdzL2Faa0M4YktNdW5aaExNamx4YmVPemF0ckw3R0RUY3FjSENO?=
 =?utf-8?B?NHJGcHJQbHl4endsekVEYXhaaHYxSGl5Mlc0bHJMUldKSkZkaDhpekpRTXk1?=
 =?utf-8?B?V3V3Qjd0ckFvOEpFbjZOSkFwZDdoaEZPcS9hckZHNmErOVRUeE1jNE9YMXBR?=
 =?utf-8?B?MXdtTjNma1JISmZJNDFVb3ZKV1dRNWlyK2hmUGdYT1lwR25acUFKcVhzb2Vy?=
 =?utf-8?B?dW5WMG8zZjlhSThpV2hQY2Rwc3RWV3NNR2hsRmpHK0RadXdKQzNzRVdqbEg3?=
 =?utf-8?B?SVBHdy82MFh4TC9ocXU0ajE2aXNHd1hpNGRFUDhIdU45TklFYmxPR0pIa0JF?=
 =?utf-8?Q?yiPmxhZu9Nhze215AQobTUCr1av/kn4g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0VBbWJSekhGdFpkNFJQcTNxLzZsRnpZQVdOZzg0TVZKdjJDZDNOSXBka2lB?=
 =?utf-8?B?TzRTOU9jcWZsZ3RhSXNtNnZsRk12Wmd1YnlyV0tySzYzVWRlZnpFdHk4YUQy?=
 =?utf-8?B?Y3RCTzZ2T0NBQytFQ0hzeHdhOG91RU1oNTdKc2Z3cXNCM0djMFlPSFZMVjBp?=
 =?utf-8?B?Z3FuZjRMbHF3M2I1d3FtbzdhT0h5N1IxUTJLTFVPbmtkazYzajc5RjJyYWk0?=
 =?utf-8?B?ekpPT2w5bForU2dHTmpZYmh4WjVsSFlMdWRmQXc4WXp4K1oreU5VUDRrVjVY?=
 =?utf-8?B?UW1UQTVWZHNVVEgzTXNKVXppbDBQUWE3a241NFZZcGVkRnlGQWVyaE9yTW9J?=
 =?utf-8?B?L2xHOU1NTmxuRXFqWmhEZUVJMU9zSGxKanlaODdiZ0MxclI5SGpYb2NuTTBl?=
 =?utf-8?B?UEJmeklnanpMdk1hRURzbEhoS1E2MWZybngxSVhVMm9GQWhrTkZwUm90bm85?=
 =?utf-8?B?K0FDeUxvTkZENlYvSVFZNFFvSTF5Z3ZKaVdyMWFDL3RLeU5hbzZ3YmwxNXdm?=
 =?utf-8?B?Y1gvQkVmMFVoRU5wa3N6bXRLcW1FVDVjWU5KQ1JYTXR4aWpDaDRBbUhTeVRD?=
 =?utf-8?B?Z1pSYkhSb0M3VjR6QTd0ZzQ0ZmF2R0U1dSt4eVlVM0hudVFKdllTV3RRVm1H?=
 =?utf-8?B?ajZqTFBSMzN1a3lpaUpqUTg0VGNEU3VmUDJVdWtYZ0JwZkFtektzeGdQY0N5?=
 =?utf-8?B?VzJJYW9oeExjTXZHQ0V6ZE4rZzdXVUZMUUdyUitaa0hQN0NuNHBFaFpmQy9j?=
 =?utf-8?B?ckVSanl0MEZjeE9EN3BHN29OZTJaTTcwSG5PUUVWbzdJamo4Sm1ONGdTWXZP?=
 =?utf-8?B?WDNOUS9MRERKeFo1MkQvSDJkMXNxb2hiVGxQUTRpYmU4ZytEMnJoWW5zdDBu?=
 =?utf-8?B?WkhlNUFoQjZYMXZ0U3NoWlhUNDFmWEdEVVB3YnErc1ZrZXVmdGl0N2NhSENL?=
 =?utf-8?B?M2R1eHk0SjRvMkI5Z1JOYVhUMUsxTjNBOVpLSTFXNVQ3VCtsK1hCWUlxdE9r?=
 =?utf-8?B?Q3FSQkJwTU52WWVEQmJuOHkyOVU3am1MTmhSYU1yeFdTWERHUktQTG1ZT2JC?=
 =?utf-8?B?N2dBbG1GbVhSc2dzd05qWEE3ME1mQmRCYjhoM3dPcFRNc0R6SmVwU1dXTWVo?=
 =?utf-8?B?dUlKZ1pvV1lRNHM5d2lEUlYwU0lPLzhGUERhcnJ1SFZMdWVNMW1rZjQ5eXZs?=
 =?utf-8?B?SVY0Y2Fjb1hmamhvR24wdzVKcjhrRmh0L3VHa21BM3VEUmZ5V0NFbzZGaTdD?=
 =?utf-8?B?V2JwdDFVODdEWUVVOTBlSGZjN0h1RVU4b2M3ODNaSEpxUXZTc0VuLzExZ3pF?=
 =?utf-8?B?UkhWT3M5Q3hCOFdXR3NMU2pGU0g4eGlsUEZjdDhYUy9GODhrSUxoU0NSSjll?=
 =?utf-8?B?aXYrcjkrZ3h1Y2xCaVZWTSs0ZXBwTUhVT0U3VzR1NGw1REJDMjlFeHZybHAy?=
 =?utf-8?B?QnJ3TU5aNFhwSjUrZmpKQ2tlbGlJdFU1VGo3aXdGaFJ2QndWaDVZbjlYeThL?=
 =?utf-8?B?UUlVTkhTMTVNZTBmZ2R6ZVVWSGRBZ0t0SFBRbmFKVTROK2o4ZGFjL29OUHdx?=
 =?utf-8?B?aHVNcHFaemNNbUp4L1VEckNxREpxN0NXL1JlZmxWS0pqdDZrYWlJWGdQaXNT?=
 =?utf-8?B?QU1ucDlOS2poRURRczhrcUVackVoaDFxTVZUbEh4cEZaWXdLaXZnQllZSWJW?=
 =?utf-8?B?NlZmaU5EeXJQOXNpS1NpZG9HcTRXaHpmdWdWS2x3SE95TW44Q3NCSDlJOHUv?=
 =?utf-8?B?OVNINWUwWDNVY1dOK0dhK1RzaDFzRERjd1NJdWhSUVBUbEZWcjZEQVpvMmJD?=
 =?utf-8?B?QkZQakFETDhkL3lSL0R5aDRXYzhneEdBV1VFWnJWNThGdVgwa1NtTkIrY3VV?=
 =?utf-8?B?bzZEdWxiUXRQb3JlbXRDNmJITDZTUlNoL0RDdFUvQjd0dVZJZ1JyaXZEL0ky?=
 =?utf-8?B?UWN1U3llemUxNkhTdGk5NlZ6amZlaWhTUkpIdm90YUR6UTBLbGlnZHB0ZGRE?=
 =?utf-8?B?Ni90T3N1cGdpV1pBdy9ObkNEU09QRzgraGNNNlI5aFVtVkdIdU0vcExjaEN1?=
 =?utf-8?B?MlZOY1IzZ1l3bnhiN0RjRkk1VGFGa3NBenJDRlE3ZFQ3WkpMTEVMdHNYNWtM?=
 =?utf-8?Q?9ZSeAQ1GF991e6G3U8TsWJT/S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3229f538-c56b-46d2-c593-08dd93dd29ae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:20:25.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiKxunMnDs7yMWzqNOFIrZq9JPdd7C7UMJhWurMvqf2b8doEAobDG1qv2K4T/N5Y7xgjEe34H/rwGdiAgQExMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4297



On 5/15/2025 6:41 PM, Borislav Petkov wrote:
> On Wed, May 14, 2025 at 12:42:44PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Currently, the LA57 CPU feature flag is taken to mean two different
>> things at once:
>> - whether the CPU implements the LA57 extension, and is therefore
>>   capable of supporting 5 level paging;
>> - whether 5 level paging is currently in use.
> 
> Btw, that gunk:
> 
> We had started simplifying the whole 5-level crap:
> 
> https://lore.kernel.org/all/20240621164406.256314-1-kirill.shutemov@linux.intel.com/
> 
> Shivank, I hear the performance issues got resolved in the meantime?
> 
> Thx.
> 

Hi Boris,

I've re-tested the performance concerns we discussed earlier regarding 5-level paging.
Recent tests on a current kernel don't show any performance issues:

AMD EPYC Zen 5 (SMT enabled).
Linux HEAD 6.15.0-rc6+ 088d13246a46

lmbench/lat_pagefault:
numactl --membind=1 --cpunodebind=1 bin/x86_64-linux-gnu/lat_pagefault -N 100 1GB_randomfile

Output values (50 runs, Mean, 2.5 percentile and 97.5 percentile, in microseconds):

4-level (no5lvl option)
Mean: 0.138876
     2.5%     97.5%
0.1384988 0.1392532

4-level (CONFIG_X86_5LEVEL=n)
Mean: 0.137958
     2.5%     97.5%
0.1376473 0.1382687

5-level
Mean: 0.138904
     2.5%     97.5%
0.1384789 0.1393291

After repeating the experiments a few times, the observed difference(~1%) in mean values
is under noise levels.
I think these results address the performance concerns previously raised[1]. I don't
foresee any issues in proceeding with the 5-level paging implementation
simplification efforts[2].

[1] https://lore.kernel.org/all/80734605-1926-4ac7-9c63-006fe3ea6b6a@amd.com
[2] https://lore.kernel.org/all/20240621164406.256314-1-kirill.shutemov@linux.intel.com

Thanks,
Shivank

