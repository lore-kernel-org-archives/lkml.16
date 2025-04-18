Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E441B5EB5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744987432; cv=fail; b=HA46wqhdLHze/mPumlLmQPbwJlsbRdOILdvTzsCP61WoFx6QPTqX4lybZiMh5XCKNFzjXNNoOWY9SZQaFCwzadmsYdoAKtoGKGOtVJxbMhsge+RlLmJpiy8qcrpyAUbJW2EnReDd3GXuCJBPdxTXOgVqQrqhMS9bO0n6usXJ6m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744987432; c=relaxed/simple;
	bh=GzVguczR8zAirnN3X5+PlKTNx6MQU+GOxrAf6VuiZDs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JSJRK5F1UqEyE8dfroX9W913zYrKyuo2qzFks9l9eTS7JkNoqGUZDgMe5elPzbKPQOcgXBM5Cn2H1cA09jlIdTzVirG3L1a7UC5GttVsvqNG8+9l+opj0MXHosbMYeJ7AAk2Q84vgofE5bC22ZgwuNcqjWadhC5Olnfnhr+2pNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lhVTeROG; arc=fail smtp.client-ip=40.107.223.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lhVTeROG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO7J0x+KB8yfDXzTTQDYsgKEoSkWbA65YdeXZ0dfcIgN+4HvRt4iTQDzs5mi5DjfoG+faAf5pJ/TvQCURAdY7ahFJEJmkcw3jjbN+b6YHLC0ukgC18UO/71Y3D2oM5xC6cfAAjvq0GCeWRZeQaF2fgO1m0mvn2TLPulIxUmzZy5lVDu6FF7oYsBYrH0ZvEsMLf8wa0R7nysp0WRjbyjpYqVgn+iu6Rv38EaCFZQ4ThU6tabpS11ePp00WVM1RWx2wLydvjaf9Hd4V42zQmEluE16Ykrdv/CCpz7Zn/y/sMM5Hg0jnMqx36RtrTn9RIkHAHwKjB1A0heFSYsbRfUzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81awHGM2rL3QgdRoJVtnNQ/xzgr4Al9Ha7athDqgddI=;
 b=aUhKq3KQXCtY1OQxQDAatNmFlU9tQR02jeyx02rFt2F2pInKR5xQaRVd6mQcTNEwwCKTY60G/hBbdk7FhRV8t53L1wUo74yCk9QCofuE3Xy3qOp6JryGo7CiSuJcFYxmYF/Qt5AEmkS8l+llDYnub6XSD1B9cWoha3GK32EAKkw0uc46OSyRaDABGdGRFcFzwezowSenDfvl5Dig2gqRvwq5cEiquRMmpWoQvL41XLoZTUTq5zsNnwMst5D6TJbSeZtOBhbbE3LoxiqqbFW8TOUR47ae21q/UO5sX2Q0m+h07Pwuib4kdlplZhXrz+QS/5PabTOa8Zs7MBuiMI0Nhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81awHGM2rL3QgdRoJVtnNQ/xzgr4Al9Ha7athDqgddI=;
 b=lhVTeROGkylykAuYmE1gKVE5bqokbvMN7z0zZAySfQyZvbxTOXuJp9mxrOnWgx8NsHGR6xo/mGIqWswakZRdwnxRNncQpf7aX+aXIA4gJpvtF1H7LrPObESIObgUA2DB8z8QTYfjqif0lCHMRFutp0wcGadwMWxxqGNvJ4KQCnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Fri, 18 Apr
 2025 14:43:48 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 14:43:48 +0000
Message-ID: <05f00515-1400-2f39-0bdb-b963994bf882@amd.com>
Date: Fri, 18 Apr 2025 09:43:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/ioremap: Fix off-by-one in e820 check in
 memremap_should_map_decrypted()
Content-Language: en-US
To: Dmytro Maluka <dmaluka@chromium.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "open list:X86 MM" <linux-kernel@vger.kernel.org>
References: <20250418135955.58190-1-dmaluka@chromium.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20250418135955.58190-1-dmaluka@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0012.namprd18.prod.outlook.com
 (2603:10b6:806:f3::35) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|DS0PR12MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 11745bb1-db1b-4c32-90fe-08dd7e876d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzFxZWFlRmRSNTN0T2RoQjN3M1NRMDFuS0xkM0h6ZEMxVWRYYVhpc3I4bUNC?=
 =?utf-8?B?LzF3ckFORjRFdm9iRzdiQktiTWNOa0NoNHpxZXZDcEg5U0ZKaytzektWUXk2?=
 =?utf-8?B?bm1pdVZlK0crSklxeVBNR0swd2JJYjNxRjR3b2hlNEdKaHhxd0xlbjlWZ05J?=
 =?utf-8?B?RnNEM1hjM014QnBwT3Z1NTM3aW1IVnBzaVZlc1NUUjRBNHZpNzRHbWdhTkFp?=
 =?utf-8?B?RUN2MFdFWHp3N2x4UUpWVENWWnJoclJobVhPL0E0L1BEUUExRGd0cE15bE9n?=
 =?utf-8?B?c0NRTmora2FOQzU0VVNCVDNUSzRWZ0xVUGJwaUFCOVB6clAxTnJpY2RLZ0wy?=
 =?utf-8?B?blB3Nk90bzRxYWxFclRua2paKzNSOC8zTS95NWFCSkQ4QkRrUGVQTU1HOXdj?=
 =?utf-8?B?bmRBa0llQnF4cEdMU2d3a0ZicjZJRDhKMDM2dERZVlpGWUVqaUs2dFkvZEVv?=
 =?utf-8?B?S1U3VVdOV3RPSGNyMzhsd3puWWg4dmdGRXVSVy9SZUozWXJrTEo2OW52TGdL?=
 =?utf-8?B?dmZiVnBWb2dPNy9RcWtOcDRPUFlzOXE3bDJBVzlOQUZ5d2IxMldqMmU3SGFu?=
 =?utf-8?B?WDhrVUUxMjBBd2dPWnZ4QTA4ZTUyZnNxM1FmdG5ycm1qaFZKaEVDUXpyYjZK?=
 =?utf-8?B?VENrYXdvYmRiTlUvaDNKZWo1V0d3TjF6UWFBajg3WEhaS1AwajdEZFQwU0xl?=
 =?utf-8?B?Z2lKL3d1Uk5KdHNkdGtMMURnNmdUNmRacGdDZWlUYXJNNW5Pb09Iak9UY3Nh?=
 =?utf-8?B?b2RzOEhFVnRZaEZCRDJWQzNLUi82cUVDeTNoZGE5YzFvU3BWMTM5QS9uV3kr?=
 =?utf-8?B?RU1ZaG9ONmg3TmxPL25UVFd5dmRvWDd1M3ZnT2QybW9NUW9ic2lrWmdEVzBC?=
 =?utf-8?B?bGlWL29oVnA4K2tJYUdsV2ptTGs0dmpJenFCUGNWbTdadG02SjRFU3UzTkNo?=
 =?utf-8?B?VmFVRGpmZzFjT1VrelM1QlNKalo1SzRoN1l0SmxrYU9wb012WnJGSEl2TFpN?=
 =?utf-8?B?VlphelpjcC9TMTZMbk5iaDhPUEpjc0FkRVBaRWlxdFVxS1NrRXQyeG9VU28v?=
 =?utf-8?B?UzFIR2ZsckZXdGJBVVVBMSs5bVpYSzdQVzlXVGtMVVN5S3ppT2RDVDA3Vkt2?=
 =?utf-8?B?SGF3c3J4TzRPTFphOW1uQnpob3VTNGcxWm42a2I5REtaVnMwcDN5RTUwZTZx?=
 =?utf-8?B?eWVxZUZ5RFVyd2M3cFIzOGdUOUZuNzNSM2xaM2x6NFEzczFEQVNjUWEvd281?=
 =?utf-8?B?b0VWRU1zdGs1cy9qSFJEZzV0eVdCZmRBNFNXOXE3a0k1dUpmMC9KYnBvZG9w?=
 =?utf-8?B?Rmd4YUtHekp5anpwdzNOdEJDY3ZNa3VYak10NXg2VjViTTJMUWQ2S0s1Ly8r?=
 =?utf-8?B?RG1xQ2xPZjV4Z0l0WE9sd1R6TTM3dDd2R081aXE1bGo3b21KMStPOTNMOUlN?=
 =?utf-8?B?NFZnM25IdWxQZ296M296ZUNCYzBJVVlXSDVETXFlYjNIVFhUSFZiV3lBWFRL?=
 =?utf-8?B?ZTExWUFkRVcwZW5meE1NQTlVbm1RV3I0Y2VmcXhPbk5QTmlQb2JsTnBlZis2?=
 =?utf-8?B?Z1A1emZXdllBcDJkS2cvQ2pEekl2WnNzWE53NmlaTkxKaGlhS0VEbG53cnEz?=
 =?utf-8?B?aG8zdmFkWU1Wajd0WGtUaERCMnZWU04yMDJ3ZWUwRUJvdkZmYXpRcllWTFBJ?=
 =?utf-8?B?RUVWTXRUZEM0WVcvVktoWWtMU0M0RmR4TEI0Z3BPUDByY2J3UFRyQ0M1bFk4?=
 =?utf-8?B?SG80ekRydk85ZWpzODRMbXgwcXlocjVWZm5kTkFkNWdIcHRGbFVUWDU0dDZw?=
 =?utf-8?B?UkFRREVuOVcyOU1nWHQrdVFOUXBQSGVmWDNnWUdxQWtRRHQ1TStEdWsrcEZq?=
 =?utf-8?B?RXVXUTlJdUQwSnp2SEFDMUNWUndqd3VDb0hOQTZyb2c4cXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjJDQlBKNTc1OGlwbUY3UHBHMGVFS21xSXVseEVkM0N1TklUUFlWc0JmeGU3?=
 =?utf-8?B?S1VtUjVzVjV5dmFpQklMSFNNbFYyVEhndFMwQXFpcjJRWVoxanRHWUtRM2ti?=
 =?utf-8?B?YWZrVW45Sm43K2l0WEhoNGxOeXlnTkRRbnBzeWVnUlBlZFN0cGg0aThZT0g0?=
 =?utf-8?B?V091eDFJeWwvOE9leTVhNjNUUDduZ0JDNWhoMzhsYktiUno0L1ZMb0lFYk5Q?=
 =?utf-8?B?di95dWFxQmIzTUpueWtSZVdFV0lIM3FtYUU0Uk0zQzdBUVFIUkE3d3ZncVpY?=
 =?utf-8?B?UnRvS1NvWk5wbEVseVJBZ21Wamg5OGtnNGhZNHdhZDdNYW9OcGNpbzF1dTlB?=
 =?utf-8?B?SnhhbHdiOUJzTVgxQVg0ZmhNWGxaVHp2a0ZmamtxWXJmSEltQ2hKN0pkMlBD?=
 =?utf-8?B?V3Fma1ZNMG1oM0ZKK3loQUUyYTZQS1B2WE1kOTRiQkVsUzJHc1JZSVFZSkZ3?=
 =?utf-8?B?bVYrb2pIL1BhOTRmWkxsSFloSklhZ0FuSVdLVGhZRFF5Vzd4M0tIc3QrTThJ?=
 =?utf-8?B?cVBITlkyU3p4dS9LQ3VyY1A2eFVnOFNGQ3YwU20vY1FvNGJWcWhrTEtGakdQ?=
 =?utf-8?B?eG1qRmRtaldjRFFKNUJxR1g1djd3bjVwekcrM0IzQTlBcXRwRExRNm51ay8z?=
 =?utf-8?B?Y3RsYW5PUkI3elFmOHp1cWJJRDhadk1xdzVjdmNaeGlCZW5HaDNHelBibnVx?=
 =?utf-8?B?SUxJWWVBRXlXOWtLQzU4aTFEMTdad0RJN0FvMm9sUjJMRkt3QlBxLzZ1YzVt?=
 =?utf-8?B?OHRPRGREVFk2aTloMUNlOGxmbzMvdXZRTmhnYW1aZng1ZVVzQ2JHV0E0UWNZ?=
 =?utf-8?B?c084c0k5cXFPcExpeFZwNVVVZHRxQk5jQlVVU1g0eTRGTmJYL3Y3dm80eDds?=
 =?utf-8?B?RUpaTU9sTExSai94YjdlQlFWcU9wU0FyMzhwQVhWR1c1Mys5dnlUaTVTL0x1?=
 =?utf-8?B?cXg0TDZubG9yOE5ZL25CUGw3cm5JUDJSdDFXMUhnZjRZYjlDMFVUY2xZN2tj?=
 =?utf-8?B?RFJEc1kxR21neHBBNmZ2MkhNai9UTHVpYThEVkduS2wrWDZtOHdLUUQ1MlB6?=
 =?utf-8?B?LzY3Z1Y4YWl1dkxJMkl2L0lXVWg4YWdRTElNN21sdTY2aFJRSE9TZGFhUlJh?=
 =?utf-8?B?NG5jeVNjVlBjUklyb1ZsMjNxMk1pbkd3MHE2NFlIbkRRd3BHUmdENjh3YnR3?=
 =?utf-8?B?dkxDbVYrNXJQUGRQa05TNDcvQUhHUzRWNkhVN2M3TXFhc3NoVVl2cmlGOTFF?=
 =?utf-8?B?OHZKVUdrdFArOGp3M1BFekxtR3lHNFZWMlRsd0ZwU2RBc1VEckpvK01XK2hS?=
 =?utf-8?B?bmcrY3ltcER6RmVXZVJ5MnB5WGFFRGIrRnY1UCsrQ3N5amdEZnQyS29UTXU2?=
 =?utf-8?B?bnN2eUs2aVNFREt5OUpUVUVZQStENWhMOC9odkRVQ0ltTHFzRnRYcXZkKzJo?=
 =?utf-8?B?TkdqSURaYWFQb0F0NG9DVWVPNlZYRlpyRFo1RFdhSkNkWUE2M0FHcHA5QmR0?=
 =?utf-8?B?WmMyci9ScXRiTjBkL01pdy9BdVFKdzRrQlVZTkdETVNxVDh2dEMxamMxWWpZ?=
 =?utf-8?B?VjlrYWZjN0dILytTd3h6Yjh5RVFhMkFFREpGTUJSSytTdEZaOWoxZ3dHYmlK?=
 =?utf-8?B?MTEzcmhTR2gzSlhKbDkxdGQzMk45QlFnT3VkcERUMFFuTzduSVZqTy9CcmlP?=
 =?utf-8?B?UWJ0WkhMajFXNzlObXpweWtrS0FxR3lpa00xNUVBc2dHK1hKbW5ja2FuTy9G?=
 =?utf-8?B?T255WUdSYUwyRVpLOEh3T0VpeGtnWWR2NnNxS3ovUFBYWWMvZjViZGhYblpI?=
 =?utf-8?B?Sm1IV1pGcERvb0FPa090TUl5Qm5iWEZmWTJscVJWamVJdGpOMnRXdUFPUm84?=
 =?utf-8?B?bnBSbzFueGJQOFZ5YmpQdmdrS1lVR0NZeXhZUzdXOWVCUEpWbGxURi9MakZj?=
 =?utf-8?B?V1BNK2h6SGVLbmFoQ2Z0VktUcHVlNEFtUXRnV21VQXExN0xMdERqbFhJUmVJ?=
 =?utf-8?B?MGVCSEM4MUMzMHpBcXFCQlIxd0ljbmxEZTZqMS9QU25Lb3lMSmpSamt6SUti?=
 =?utf-8?B?WG9ld3lPVXpCQlZsaStUSWdjZnlGNDY0UXBhbDRVN2U4aDZsekxzYzN0Nlky?=
 =?utf-8?Q?sKQEf9agagzOxS9Nq9H72WXdy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11745bb1-db1b-4c32-90fe-08dd7e876d88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 14:43:48.1505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmWisCEl9QMjSSGPLSEOcPMGY9P7HdWiSNub/zK2ZZLEB0dDa3a635nThP5IfVAQ/9p6/2zUFc5gc8OV/HZ4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019

On 4/18/25 08:59, Dmytro Maluka wrote:
> The end address in e820__get_entry_type() is exclusive, not inclusive.
> 
> Note: untested, bug found by code inspection.
> 
> Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
> ---
>  arch/x86/mm/ioremap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 331e101bf801..a44800a6196e 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -578,7 +578,7 @@ static bool memremap_should_map_decrypted(resource_size_t phys_addr,
>  	}
>  
>  	/* Check if the address is outside kernel usable area */
> -	switch (e820__get_entry_type(phys_addr, phys_addr + size - 1)) {
> +	switch (e820__get_entry_type(phys_addr, phys_addr + size)) {

I don't think removing the " - 1" is correct. For example, if you are
mapping a page-aligned value for page-size (4K), then not subtracting 1
will place you on the next page, which is incorrect, because you are not
mapping that page.

Thanks,
Tom

>  	case E820_TYPE_RESERVED:
>  	case E820_TYPE_ACPI:
>  	case E820_TYPE_NVS:
