Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03olkn2046.outbound.protection.outlook.com [40.92.59.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349029D05;
	Thu, 27 Mar 2025 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.59.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075395; cv=fail; b=qIuote/iMvRbUO87NJTHK7d4liZkdwpuX0wdxjwjy6cXVsNNprAKsjvj/LJ/doh1zr+DhN9XI5O2rYzUuWvXqqSZ6AUcJxfVq1X9v70mZROdVUam+wywRwihFCl29Ak3r27PV+j3Z5X47nLainj3/E2f4+FBvtX4yPP/QVyd5e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075395; c=relaxed/simple;
	bh=OOhKh3uAOQFfmA9Q/ltYZFieDXRuRJLTnHRvt4HXlrs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eROemubca6DfE7+MsBOcrTmf1Umn8L1JJPw2vgVhGNexg/E0SYWvHuPkgTihBAcVtOaZJFkiH8BU/J0++PXzsAMrp2607d6GxtatEHWtiDPcL3/uE8h15eC/A/ho1dKrrFdhOfgoip5EZIsy5GY+tJCdcX8QZWWA2XqS4DFyKJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=d8dzWNzZ; arc=fail smtp.client-ip=40.92.59.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="d8dzWNzZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lT69DWOKkZoE8hvipjgF0HkIdX622Vyflle0dmRvaz0eS7TczkNe/4ZQzl2aMHDqDZD1hALOjAvoQ7UF8RUUp1qmUkslqVislvW4MMbNuOanKLPDYU8JRsfH7E3vAcAYBQjqLk/LGpr8BmP4KssqBxVOGqegCYRSya3/Te+ziXjmrJblLjEJb5yZHCV3TADjktOmrg+XvLeb1Mn9YxOFyvALnBs0Mr5SMYuu4q9DlBP/r2pAGh6IUkYeT4UaI20t9r+jYtS1Kv5qq4b5xDBpzfsTCGtT82fwJK1k1D39b/JEzCoVmELcvpjnWU+zOx6UMXZVYwWGiJvxwLQd4tOZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0x4hPLdlTUMrqy9G+4y5VRxCYWGOUohaQBmuPI4Qnk=;
 b=hHFW2quHa0wqXAzAoU/WSUMKmt3ltYl2Dl4VrN7nvx8XhAaj+O8XFpD322p00jnlzKvw0pqmO22dANNsgfhLJmaXCUtpT9Nb0R3HUw6hpF1ZQ8gYefG4OJqORlGNR9rsLZNKS/lQlhgrJ4EFN5AmsT0JX5c1o88bw50Q5FpzkRmsSQySsoA5vHfPr1giEwVsTCZKae9+Nh8TRbVoCrfs9gX0s9wDCEnF5MPO1yKxSRVUrMSuWaijJeVQouP/Z6ILMs5REaj/tUj9Bz7UPr84JUG102X/99fySe1pEHwgaEgY4XtJU/mVb5DCURzRhvgIAfS3vgxYVzjN80JAwy9P0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0x4hPLdlTUMrqy9G+4y5VRxCYWGOUohaQBmuPI4Qnk=;
 b=d8dzWNzZfxajqQP4VkfofxhUfP5yDGtuhXw18j8SnWyVEmejsg1j0VVSH9ckxb5c7xRVwPjlpuuINWAqTIA/XZPRpF3DfAxVpRySKZ1z4eUPKP0E9f0yRp3npVp/zomaEQZY8q+Sa7yN7+dwEqBvop/15wWTmGni3WhhHamto/ilawuWoKWwFVL8dWcSXFilhvYA3Q3HggVgelP1lkP6rO4OVhrsne18qSPQtZF9VaJSoU3UaxvzNaGdRRhQJldChI57QKDBi4fcz1BFPGs5tXU484FOYcOwNTgwrmLVGK0H5NgYD67NYxCEyywiAoLZz4EskXzKOlUGxPZWjrc1ZA==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DB8P189MB0652.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:125::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:36:30 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 11:36:24 +0000
Message-ID:
 <AM7P189MB1009748DBA1F99F2BBEC2292E3A12@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Thu, 27 Mar 2025 12:36:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
To: Mark Brown <broonie@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
 <a98eb789-4c49-4607-ad15-76e260888d64@sirena.org.uk>
 <0698A75E-D43C-4D02-B734-BFE1B3CC5D34@collabora.com>
 <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::32) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <1ed8e07e-597a-47ed-baa6-15e696a2c1d4@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DB8P189MB0652:EE_
X-MS-Office365-Filtering-Correlation-Id: d08c52a0-ac52-472d-3413-08dd6d239a4b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|15080799006|6090799003|19110799003|5072599009|8060799006|440099028|3412199025|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0FKOFFCWmc3UlNDRGxyMy9EY2xjdnI3THRYeUFBZllQWWFUbkhuVEJVNmJi?=
 =?utf-8?B?dzdLdC9RZDNrRkdkY3kvbnhGRFZxQzlMWGhMa2xnakljSlcwY3RjMmdtWXp1?=
 =?utf-8?B?c20vc0xJc003OTczdFB5anlXWWRVUk9ycmVWU09IaU5hM3VIdWp2bjhhNUlM?=
 =?utf-8?B?SGNPR2RBaTVLcEM2VmRPRnlwODFRMnhKTm94UlZnRFg2OFh3eFdpWjIwaDZL?=
 =?utf-8?B?MWFGSk9kVFJkdldsZVB6LzFKL2RXdC8zWkR2M2VsV2Rjblh5UGYzWGdxNVFa?=
 =?utf-8?B?RC85c0JiWm9OMmVKc0xiTVljYTBVSmFMenZySXE4cUZja01mRndoYlVvb2li?=
 =?utf-8?B?TzgrVzI5SmN6ajBuSmIzWXU2UjVkdCtOa1NIdmhIa1NadG05Yk11NHl5NFo5?=
 =?utf-8?B?cFo1YW1rbWhqOXFxMm9FbExDbHdFMXBxMHZ5OXRUTHYzZTd0OUZMbFpRalE2?=
 =?utf-8?B?MC9GNnVZazk1OUd0K2dxVFlBSHBWeFFmQ0d4Y3UwMVRPMmdUem1IRW9rYit4?=
 =?utf-8?B?NklEeW9wNmplcUdhb3NLM2xid1VTUzdoREc1M29mbExrVVJjT0ltSU94a1Uz?=
 =?utf-8?B?OHNwUncxanhkVWYzTGc2UERpSzd3dEx3ZkhDbEFEVjhCWmFvNGNvdHVGajJK?=
 =?utf-8?B?Wkt6aGNCZStKY0F5REVWN2E4OXNLTUV4Q2xSMURKY3luWjNmUG1telloYlZ0?=
 =?utf-8?B?djFaRk1SUUloY3kyYSsxWGgzUVZ3SWowQlFnTmxRZlovWjk3YWhvWkZnanpH?=
 =?utf-8?B?QWZINEN2T0pLZVMwSlBKdEdzeG1EemRrUG5WK2Ercnl4S0czS09XU3hkaWpw?=
 =?utf-8?B?cmNqM3RLLzBzTGVoTll6REJhVDFENXYraDdGUFhCRlpHVWVqS0hvWXRvREpo?=
 =?utf-8?B?MWhkSElCOVBBNDkvbU50S3lON3l5MGovcW0rZkdHQStEZTUzeHhiS1l3Q0s3?=
 =?utf-8?B?cS9ic09qUzl5cFpIMnpwNit5RjYycHIyUjZyNVN3ZW0va1drNXhPZzhDaGRl?=
 =?utf-8?B?ZUh0VjUzRmE4dUR0TU5XQTlXaFlMbXBJdzJWTVZEdSt1VEFva1p3cjc3Q21p?=
 =?utf-8?B?anR3VndPQzU5c3NUL2RoYU5DYVoxVUJRSTJBUzE2RXRoZHdhbVo4VnMwa29n?=
 =?utf-8?B?bGpia3RDRkppZ2cyL1k4STJZZGZMTEozQUJ2dnBEZXJ3SUErQ2E0Sy9RVWZS?=
 =?utf-8?B?MytMMzE1b0huMEFBcTBYSWw2cUFsSjd4SkFJL3pwRXFmc0FVYXcvZ2hvQ01Z?=
 =?utf-8?B?T25GdEtBSUJkdE5XNVhTVnNKNldwOWlhUTNIVVc1Rk8wbWRlM2lEZGpZOXM1?=
 =?utf-8?B?dHVFcG5xQkpDa2RTTTBHcTZPRlBJdVR5TmN6S0U4eGZiZDh1MlVadytNTlFR?=
 =?utf-8?B?WUtUQ0hWeHRMcnNiOVl5dkZ5dndiU1ptbVovcXBDQU1JZ0g4NjkyN08wQyts?=
 =?utf-8?B?WG9EdXZEd2J1dit5UmYxaWIvVUVPKyt4UXdkK1BMZGhGUGYxMk5BWnhWdk9j?=
 =?utf-8?B?THZBL2NvY2k3UWovZ3NLTENPZCttekVKZW5Qb3FkS2pqVmt0KzVxUWZPM2Jo?=
 =?utf-8?B?clMxZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2tYQ1ZlRnlZNDRXOWlEcmhXQ0tTYWZrVFVQZzJTQW9NMEVpb3gxUzVOZFNR?=
 =?utf-8?B?bzhHVWg3N0NaQzNQWkFBNkhxeFQ5OU4yTy9EWXlacjBkckYycGZrNmx5WGQ5?=
 =?utf-8?B?NGYzMnhRdG5tVEdOckk1eTJEZjVKSXBHbU50cVltaytsbE1vMzNnazNTOWpZ?=
 =?utf-8?B?RXJxWEtsYnIzQVdhWmdzeWdGam1QSU94eXVLK3ZrZXIvRWZrVE51Q28rUWRv?=
 =?utf-8?B?NkkwbFR3ajY1Q21GYzZPSFAzdG5EeWFBQ2MzdklxM1Z3S0RUNDZ4ZmpOV1JK?=
 =?utf-8?B?VnAvS0tYckVkNDI4ZzFuQzlOMXJiZXhyR2NXWHZoYi81dHlqV2NMRlRHWHRX?=
 =?utf-8?B?c3VsU29TTjNlN0NWNVZOa0Q0WitPOUJUSmxSbjEvQXNYeUZhQVNUeTJtUmVq?=
 =?utf-8?B?Vi9DdUNhMEpNVWVkemx1bjYvcUdHaFFuMk5kODFvNEJKbXBwZFh5RUYrKzdr?=
 =?utf-8?B?Uk8wRVpFNkRiV3dDaElDQzZBVzFGTENVSWdENWRTc0NRdHZRbFZQZEtmNFA3?=
 =?utf-8?B?V1VMM3YzS3hoSVYxWTFHOXNKR3dOQnNJem95WTl1Q1g1a05vVSs1UEZFTGtt?=
 =?utf-8?B?ckxMT21kMVk2Vm1PWERxWEtRRkpaN1JvME05Rml5RWNOazR0U3FSN0pCYVhL?=
 =?utf-8?B?Szd0ZkpmeCs4TGRkdGtrc1g1ZlFEREVycnFTWnA5bG44b0EzK1NwcndzcGl1?=
 =?utf-8?B?UVVHbGYrT25zOXc2S3hoSVMrMTJVMWFjMmlZMjUvRDZVaDFRSTF0TmNxOG9m?=
 =?utf-8?B?YTh2QnJUWnV1TlJydjZxYloyWkJsbDl0aHpFZ0QvamVrclNBUXVhSCtmQ0dh?=
 =?utf-8?B?RDUxTEFySzZTaGprRzVmV2tJakhRVHZJMGRMVVBWY2g4eWVCUERZWFIrOEpy?=
 =?utf-8?B?dFA5T1FhTTU1V0NnZEZ2a2RVc0luVUJheUdSY0pMUWdSTFMwc0tTalIxZVRW?=
 =?utf-8?B?NUNlZTZvRkRmdkZMUjFPOWNrdFgwNzlOckk3RG9XcXUzQkY5Tm5pR2RidG8v?=
 =?utf-8?B?Q0J6WWRReTcrTnowb2k5akMrdThFR1pTU3ZVOVhVSm5TY2p0MEFkR1gwOExS?=
 =?utf-8?B?ZmtWdW1LNitNMS9iYjZMSm8vNnRuZ0diaG5oYUJ4Sk14R1RXVFV6Rmg0dnZt?=
 =?utf-8?B?aW0vSFdva3BXcGR5a1BIanBESkRDKzJ1ZXA5LzFuek5CWjdVQWhMOEdKY2NG?=
 =?utf-8?B?SGNJQ2d3UytJaFdvQ2xkbkU0bnZLZXBWOTZ3TURFaDZMeDdrcGJiZ1BWajA1?=
 =?utf-8?B?akhFM2Zwc0QwMWNzakhIdWFxS0p3VUtGOU45TjYvVVp0MkFVaWs5aXZnMEtk?=
 =?utf-8?B?R3dnQ0RjZXpnd0dCUUZPLzlkeElmRENZTXByaklwV3BqTG1WeEIxaElvK3Fv?=
 =?utf-8?B?bzNaRGduMEpkdG5UdFAvWE5SazhKS1dzbDJqRms1Y1RVL05lTVpjTUhCRlJM?=
 =?utf-8?B?aVJxNUpUZEwvckE3ZkM4Q2lWYXlJYnBOMVFFaEpSYjErZEFWMld3MjIzbFAr?=
 =?utf-8?B?aTVSa2RybWxtUzd5ZTJWOUZReDdMQ1c5Q0I2MHZGU3NlSEhVeXVSRGtPVUtW?=
 =?utf-8?B?Sll3MFd4dFdXQjE0MUsxd1k0cEtnSGtCdng4RXgzVHlhNmZQMjBoY0l5QUk2?=
 =?utf-8?B?ejdQZlE2RE4yV2htYnVkTmNPT1VBLzB2cnJqNW51WWFyVk52czl0YVp4VlRo?=
 =?utf-8?B?MEk0c1huZy9HZW96ZXNaV1IrK2hueWhwbU8vZUNrcFlpc25BbXYzbDJnanFW?=
 =?utf-8?Q?8UKZcHdWylc7eCDjOq4r9j++Oft1z2tPgHwpAQq?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d08c52a0-ac52-472d-3413-08dd6d239a4b
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 11:36:24.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0652



On 3/27/25 12:32, Mark Brown wrote:
> On Wed, Mar 26, 2025 at 04:49:26PM -0300, Daniel Almeida wrote:
>>> On 26 Mar 2025, at 15:56, Mark Brown <broonie@kernel.org> wrote:
> 
>>>> +    /// Disables the regulator.
>>>> +    pub fn disable(self) -> Result<Regulator> {
>>>> +        // Keep the count on `regulator_get()`.
>>>> +        let regulator = ManuallyDrop::new(self);
> 
>>> This looks like user code could manually call it which feels like asking
>>> for trouble?
> 
>> Yes, user code can call this. My understanding is that drivers may want to
>> disable the regulator at runtime, possibly to save power when the device is
>> idle?
> 
>> What trouble are you referring to?
> 
> My understanding was that the enable was done by transforming a
> Regulator into an EnabledRegulator but if you can explicitly call
> disable() on an EnabledRegulator without destroying it then you've got
> an EnabledRegulator which isn't actually enabled.  Perhaps it's not
> clear to me how the API should work?

 From my understanding, disable() takes ownership of self, it does not 
take a reference, so the EnabledRegulator is consumed and the Regulator 
is returned through the result. So EnabledRegulator will get dropped in 
this function which owns it.
