Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A2B25DB0B;
	Thu, 19 Jun 2025 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318252; cv=fail; b=JLvcinDmeQtCxs1+CcrPoCscTAD0c4OP8IMjW8XUM0jN3EpuhzQBhNue+VFiqOu13zh7gMgfrczlmXjOPn899d1ftmQWageA87BKUuDq3fbTNz+GEjEh5N6nMZ98ERIAUWq1LxvBe8GPhC1i+MaTEYwp301RaUi0BMb7cjAR6b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318252; c=relaxed/simple;
	bh=ldNZrW60LNT0QWgpDja2sYAYQiZSGIZ6BV1DPbR8bbs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P8Rg0j1GEDF6K2qXHZ2nQap9rpM+5bodcucy2ioRKIcU3vRnxFqv5+1BrqKeht2Tz28bH5g7t+GJ42tEVS8QDESCTNXpluEAP5+1tTMUskFTMMR+xpCbWnIhvIEr4tjs3etJVN5sZx+y8BDwt46AVAOcuO5hUmpBI1KFEz0JPw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=EBTqB2yL; arc=fail smtp.client-ip=52.103.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="EBTqB2yL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dntzjtXIJXF8e+hNVlaB1EbfuAcc9JGmZqkZpuyeK/lDqaKIMm88uKUWw7afjJgc80wttIgRZoOV2+jtCwzETXlSeQC7nXt+5AHBtJ/xXtSIFo/PoXFxLDvmrDzv8vSTe97MNq2W7Q6bwwDJ36abnSKEQxgQf/TtKAeoUiGnGvuAZB0vl6P0xONGlu/QTdS9rBjIXiiRM0YFpZOQ2merzDI3ZOHu1ndeEY93iJWTAbYfcxaEBuUbcEdxmrvgULZLa4TafsaRUAnvPF0Ww/OOTmhEQc3KHSFsdslM3yYJCqD8cqp6ZYpsKBXtvtshx4XsM4S2I7GOwI9egMH3o7paCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qFU7jFfawnZrirkptHldHvPeuUgH00LkqkjD6ZGWKQ=;
 b=W4oha5yC0zVa28XXk8GNDC8as7rIRHhOH2ehaG4PwtfIc4a+qMLKrWjvWg2uKhOPWF3KZm9b95fU0Nvvo4lWpQXxNW8RY8TWlL1r7YErnBelnkkZEy8y/1300rHIZhwKzDSqfGAlEEtvUzdZxJLB+bjMQ34fiahp+dXfoOzvsA+zpzYkJDc/oKM0nzPVO8GciugOTIfyUUbPlJHad9S/XPiR3K0lMkdgvTBOw6j6XJI+fcnpIheswow2muFWS4ItztkeWcdSOiUkTkenwn3VhykZdBG2KaeSlHMOLQGneO2TFZO9jpaO2yBrR6XdU30aU0sf4dQmlomTbaVJ7NZVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qFU7jFfawnZrirkptHldHvPeuUgH00LkqkjD6ZGWKQ=;
 b=EBTqB2yLq42y3fWhf8x92plCFhT9PleCXIOxsLrbISoivNWpmzs1u/N5OWxr24zKnFVN5oxeJBtsnfWHdbPUDNvbUG8KMB5zOlhp1uh7q8B6EegTqj3chtC4DSdgx1ZBumUVagYJlzFV5Qo2nZmY0W0YAcgNIwq8cXgppt9v3HEagIcpopu5OH1VglPk9jbXFt3CeFIkdcJwQo3p1v++Eqjy034A/0Xm/QGZJsAytnK2ps2pb9GYsTzGxrBPnInQwmFtWoXz5b6GfgKsaTRrBMI0QbqHhzHmiY1C9agSpLjUqwkUdLa5tJ/OJVzL4PeEhKQ12Q9jcKDZAJ8EWRqwIQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3PPFA16F39546.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 07:30:38 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 07:30:37 +0000
Message-ID:
 <MA0P287MB226203FCCC7A25D2140ACE01FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 19 Jun 2025 15:30:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: Add missing
 riscv,cbop-block-size property
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20250613074513.1683624-1-inochiama@gmail.com>
 <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <8ff27e79-9697-4acf-bb44-37bb743ff401@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3PPFA16F39546:EE_
X-MS-Office365-Filtering-Correlation-Id: 441e7282-9ad0-4720-5d81-08ddaf032f9f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|21061999006|5072599009|8060799009|7092599006|15080799009|461199028|19110799006|6090799003|440099028|3412199025|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUV5YnprYzkvRXRnUklGbVAzbUhnTUxMQUZEb0wwd1lTTDlWOGRBenBRRnN2?=
 =?utf-8?B?UTBmd0dXREh5MSs1UG9VbjRhZnVZbnJabXVnajh5V010SGNTVGdjZk9pNnBN?=
 =?utf-8?B?SWtrSlJQeDZpYVFqMUFXZmI3ZUxuSEtTQmlGRXBCeHkzK3lGaExDZE1BQlZ4?=
 =?utf-8?B?RG9hMkUwUUFsL3ljbk1QRzNlcW5OQUxLbU5XSmJtb0RTcmVaV3FoalZNanM5?=
 =?utf-8?B?bzBNMmgxRE5aTjNBN2hQdDNoUGFCbUhtU3luUVFZYXBRSHFVZ21rclBXaFhC?=
 =?utf-8?B?aHdUSEEwTUVYZjlCbVB4RVU5ald5bFBEelg4S2RuTjNmc1RWK3BmUS9LNTVK?=
 =?utf-8?B?VXdzS0Z3QUkybElkdW5tb1ZPVjFyY0lSc2E0citGRDRxVnBGendWWlJwOEZU?=
 =?utf-8?B?TkRJajU4YTA1cCtrbDRmMHJUWmxDQ3ZNSTBXTGRKUEpVcEhNZFNlVEZUbW1M?=
 =?utf-8?B?T0o4Nytoa2xVZjR4V3R3N0tWUStpUng4SytlYWJHb2c2T01iUzZ4UjIySFRF?=
 =?utf-8?B?a2x5OXFOcm9zUEhZaFU0bWd6K0pTdk5EbGRWT24rSno2NS9VcXlvTXQ0N1ZV?=
 =?utf-8?B?ZCtZdEovb05QckI4VkJMbThQZWJzemFCcHNLOXJYVHMrSkJtOFN2aENPcXdJ?=
 =?utf-8?B?eUxCcHRBeW1kTXBBRDdPMk9LbG9lYUMybkcrRi9CUjRvbyt3WUlqV3ZQazZE?=
 =?utf-8?B?U0YwaHVZRlNoc3hJUHhuMHVCaUpQcElUTG5GbXZZNnByVGt5bys5WmVjakhi?=
 =?utf-8?B?T0NqMGlrYi9HT3pkN20rYWdHQzZTbnJCNXQ1aFJaNnh2c1dhTmhxSzFibHda?=
 =?utf-8?B?N3pINVRWbTM3c3l0cnEyWkNObjhFdDRsUXgxYm9KeW1XaytvUG9nZHczR3Fy?=
 =?utf-8?B?ZEszMHA0WmlJVy96a013a1kwdFArUHR2Y21CZnAvakpUTkRuYzN2eEU3Z3Zn?=
 =?utf-8?B?RFg0NDY3TXVkM0E5N2xhaU9xZFIxR2FaOWp4ejczRjFXakNrZXJMalFld2Iv?=
 =?utf-8?B?UHVWWlNXMjNLNnFqc0hYVVVvdUdYZVpka0xvVWdsK3phUTVNMDkzcWJ5ZjZK?=
 =?utf-8?B?UWNHL1psUjA4NGlRYjZ0dHdWb3lud0w0NE5HaWlESGZGb3RjbHQweGJhN2VL?=
 =?utf-8?B?TXl6MlNBcnk1bXhYcDRHbEttRE1JUHM3Z2dadzQ3UWZzYTFRK3B6SUwzZDRi?=
 =?utf-8?B?MGtKNVdCUzRqTWlFKysvR3FJY1pTTGZ1c2JtN3ZhYmRpbUlTdUJRR0pCYkRx?=
 =?utf-8?B?Q2RLd0tiVDBUK3JGRm8vUTlhUXVKQmt6bzhXalRlOGhxcStJdkNXTDhNTExp?=
 =?utf-8?B?bFVKQWhiZUhodHNYRGp5aUkyQjBiUitSMHF4c01yWFJRajlocXJwTXJ0M1F2?=
 =?utf-8?B?Wm1uaTdHc0ZJbUhmVFBRb2lwbU9iL3FkcWhUK3ZoRzREbjVTMFFUVmpRMXpK?=
 =?utf-8?B?WWlWQjVGVklSSmRQSGV4Q3hQejJxS2R6YkY3dHpvbkhCb2NmMXZqNnY4ZWZr?=
 =?utf-8?B?N0tDMXhONjQydmF6ci80STRMVDRCMTVHT0k4bThUcjFiZlhRUFpFbnVsbXZC?=
 =?utf-8?B?Ym5OSDI1RFJTYzJaMU5xWThKbnB6Z1h2QllwU1U5OERhWHZ1d21BWFpIbzZ2?=
 =?utf-8?B?TkJNcGdmbjV6RjF5Z1RrMy9LMGpEcmpJZmhGVSszMG1Ucjg1TEVTMWJibHVt?=
 =?utf-8?B?dllGNjNSTy9WT00wZVdxNUZaUUd4N3I0elF3ZEExZ29rcWtEQzdiMlJBcTU4?=
 =?utf-8?Q?hdQYiSW1eUBUQc0szbrl4odrjvrKxDmup7qqQkT?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy8rTm05VlV0RktIdjZGSnRPNjB3Tll2eGttdGp4a0lTaTJWanI1QzFvcWFh?=
 =?utf-8?B?dTZpUEdZYXFITFJIZHdSUFB2UUI5b2pBRG1rU0NzK1hkUktlZGRzWVBoV3BR?=
 =?utf-8?B?b2FnNStwbVMwUmNCSC91c3dvOUhtdjJkVFlmLzArUjQ3amE2RzE1aXhuWHlx?=
 =?utf-8?B?c0k4b0V1WWZ5QmQ2TjgvNVkzNkZNaitBVHl3MDdtUzg5ekY0R3M5S0c2VDI2?=
 =?utf-8?B?Vmx5azYzOUtLWDY2N1IwSFREbzgyaWlEMlhIVzNFNklBNXE4N0lXK00zOVZu?=
 =?utf-8?B?Wk96WWVPMjNFMDlqRVByY2p2cDNhd1BqdGJtRVlpY2FsZUJzNWliTjExNE4x?=
 =?utf-8?B?U0RyOXgrVGdET21JQTk1bFNxR215YmVBckVtMllDY0VHS3BqcDVsUXh1UXFm?=
 =?utf-8?B?bE9uSmtxbU1JejdyMVp6bnZFcU9ybUlvbzJUMVdWckFKU2VHbFVEV0RkMEpu?=
 =?utf-8?B?UG1ST3VmcU9DNVAxeStSUFZtaGN2NnlZbkFkOHo5eVNPakVnWHltajQzcFZs?=
 =?utf-8?B?RE5Ib0lNWlZacm1SVnl1MDZuK2xRNjZ5eHZSWXUwek5GaUxJYUF5WVg2dkRP?=
 =?utf-8?B?eFVaeHhUOTU4dTd2c1c1cmhubnY4SXpsbUREUEpIZ2lqWEwvajlIY0FuYzZ2?=
 =?utf-8?B?Nnl6VXVBMzBLWTRvd09XcHlwUkY5ZHBJaERNbWNnRkQ0RVFKZHJmOGpGa1FC?=
 =?utf-8?B?NjNlNzZKYUpocDhhNUpTdFZEb0pqNG43YzhuOEJBV0owa0dyM3B2eS9NM3hh?=
 =?utf-8?B?RGNxbkdVSHl3bndITWlGbnBzM2lqcUlpUWFQNzM0Q0p1cHFkQlJZbnhzUVRK?=
 =?utf-8?B?SWRjUGZPL2RpelEwM01CUll5b01YcUhUMnBFYVpmaFhsejBBTjBvSlA3bE03?=
 =?utf-8?B?cnZQQWUxZ2hJWTh1TlZYVXhzdVBZYmx3ZnltUXNpajVQNitscWdnTHRYcWR6?=
 =?utf-8?B?TW95TURackt1N3hadWlHdEgxckwzMjJHUkdYOU50WHdQeHlUeTZBVVpQcTJj?=
 =?utf-8?B?RlVoczFleW4wUjZSRXNGZHVtOXZWUXVFbk9veFBkNUp0RHJqbG5GQmZSZzQv?=
 =?utf-8?B?NFJmbmJtUVRKdzVEeTlTQ0NROTRFcEVvT2JNSmZjTDRSWW1DRlg4OFkyb3c1?=
 =?utf-8?B?VlVEOU1WMWtBVUcrRXVQemV2KzZTVzFmS0xvamI4SnQwdzFNTFhKRlVpN2lk?=
 =?utf-8?B?Y2xhcmhqYjM5eE5jeklCYVdwSUtCU1U4cXdtaWpTUlNhN1ZVWGdqQXVGZkk2?=
 =?utf-8?B?OXN6YjM3K3h0L3piRkFmUVBSUTluNFh0SGlIOHRLTTBSaUZKNjZSQnUvV0pH?=
 =?utf-8?B?K2FOWjRLcmNWR1U2dTd1RFM5OFY4eEZRRDBwRHl0eGk0cDZ3SjBlK0R4dG1l?=
 =?utf-8?B?N0RyOEd6dXdidFNkbFR0bXpETk0xYk1uY2kxUC94Y1AxZ1NyOElZVVhmbXNP?=
 =?utf-8?B?KytkREc1a01jSUNNd3hyamFMdGRCUEZZdVFtWUg2ajdHWmQ5dWxSNVdPaERP?=
 =?utf-8?B?QytVNjBGOWo3WmRheG4wTmVpTTVheUlSSDhsS3UzbGlJK3FzWkR3S3dvS095?=
 =?utf-8?B?Vjd2WGwybWZLNTh1cUlNNllHVTU4cnhaTm1uVWxJak1qc2EzRWdhT2hhZGRY?=
 =?utf-8?B?b3lVS2NYbE53TURENVhoK25BSDYxZFRSRTljMlh5cVJvbU9kZlBSck9aK3ZJ?=
 =?utf-8?B?a2F2dXM1SHVZZlpvRmk5bEhFbzZnZ1Qzd2FIOU13NDk3OVlxYkZCTWVtcVpr?=
 =?utf-8?Q?L/RFL3nH5rTgdee5vdjV+lyGWxPURyU7Jj5X1r+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441e7282-9ad0-4720-5d81-08ddaf032f9f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:30:37.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPFA16F39546

Why not apply this to fixes so we can pull this soon?

On 2025/6/17 13:07, Inochi Amaoto wrote:
> On Fri, 13 Jun 2025 15:45:12 +0800, Inochi Amaoto wrote:
>> The kernel complains no "riscv,cbop-block-size" and disables the Zicbop
>> extension. Add the missing property to keep it functional.
>>
>>
> Applied to for-next, thanks!
>
> [1/1] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
>        https://github.com/sophgo/linux/commit/b8518378ffd3469b5ba871ee0210b3c16de45d66
>
> Thanks,
> Inochi
>
