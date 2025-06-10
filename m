Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010011.outbound.protection.outlook.com [52.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA73010C;
	Tue, 10 Jun 2025 03:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749526042; cv=fail; b=QIdp2WJ5l4tjAeaQYC1rDYwy92WZ7Bjdc+Z+FMED8HmrD6z8oC+qpcFNJxGFt/GSHOt9rfz5MNrEhi98LsaUlZxcIu9FlZRmXHSX8CAcMBclW5ldxmv2VOvf0qUcfUn+Wttf1eb6pO7LnAXBJWmAYyJr5axgv9qi/hZ9ppzGbJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749526042; c=relaxed/simple;
	bh=F3UwjSJsQWrE/HgzHLjqtCcPtVDJNQO7NYwK52eH/AI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A54D1cX7ASmS433xIrbIggOSI6s7pM0vEzntltpyGzy0qAIDW/pI+fQFAtvqDFEmbBmxffDOYyOOiwCuUBnW+a3yKRcY1Mc1XVwPyqfegXOvcshvHW+kAHlPH7iRuVGuiNhDslEyZ30OS0gfbPZMm3HmuXE5sJMJKquT7jiBGU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YpHE3L42; arc=fail smtp.client-ip=52.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YpHE3L42"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+2MZhKbez3QFLkdWq2BeCa0XUZ4NKu3Vh3pvEIJspIzXu7gKS8BH/xbJpk7BgwKARpf/UR2bJ9vt0wx11CLm++UuyL4AaxGvND3OlPlHRxh6KhnDyAP0jh9bGIMnVCAXlImfseKhhTwy67BPB1pG4YP1C6p5Sbu02xFe8diWzkHMdOxPstVxdIg0n7zVsryDkNGOVD+QiNzJYIOosbsA0mtCrF7ifjgrrsjSnwiEHPUTFd98DXdCEAewlW4zG+887pQXTM/K6A+JX2LmIsW0t5hZJpIrFo9gXAoCitvXqKR59VtUhljiU3w+DHscVyUbYVmVE4bZNXEJwjL38ttsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2GXy9v2x8VCp4HpmmW1BR46W+q1WnLg9vVSUNGjVh0=;
 b=UKBtaDkDoCRx0QU8UVezzyo8/JH3guxtsuQtwB3uaUdItc9cEx6flZJBXrMGUg8VvCNeNWqceIss2ng1F61z1P9OjnzwOgYn4h3sb/yTC1WSNY0dR3UNnryPC1yjWp9waIgq47Ghd1jgTtxkMIFHP0ZXpOIcIatdYNriMpvKo7/tSkUpDohkemTYZuAZDzjMsXMfAI7kYWcz1MT4P9nBFPye3EFARswY38H2zzF1EC8Ckz+HJgock8dOvDrayA2nY/Z6P/RTbDObB7R/6G1T4UCWnTCsn5ln+UcHNzLunLY98vr0DhLJgawUrCCdyq6f2Vh6ChjYWyH4kzYfQBr5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2GXy9v2x8VCp4HpmmW1BR46W+q1WnLg9vVSUNGjVh0=;
 b=YpHE3L42exYjJuiGzvSbeDrJzo9fSDRbvCVgrrRroqFwsrkgNXrAteuL2W/mg/UQx/DSPK4u3gE0HcjWdAaicO4NIaHMv07/144oVGsx/TrUlKWFdN5ggEIPxApgWN2l3vSrFjFI97IvyrthkOjPA00fKVB3MfMDi+OrK5TFAJON9XHRz5oBMGKFLpfed/JcbQ3RepweWU0LHNl4fR8TSEIyqWIL+3TqEaTfaiXzlOC0Wu44HwE9YY/UfbFwPWn0zKClpprlINAjruKogpfW0diKOatl0f6VAjH+1+nYUa9kwGP/rZ9uOAyVTTrtxw+8mkXP1BYPLc0Zl32JfMXcxg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB0254.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 03:27:08 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 03:27:08 +0000
Message-ID:
 <MA0P287MB2262D3E1D44D6B4C5E9A06C1FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 10 Jun 2025 11:27:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] riscv: sophgo: cv18xx: Add reset generator support
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Yixun Lan <dlan@gentoo.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <683d4783-dc05-4e31-bb60-eb5503667818@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB0254:EE_
X-MS-Office365-Filtering-Correlation-Id: f75e2949-6821-477f-9b57-08dda7ceadbd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|21061999006|461199028|19110799006|15080799009|8060799009|7092599006|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjBKazBTZEJhT1g4S3ZSaDR0WjB1TUVabXdmNlFQQ2tNNzhvdUd3VXpiN3Rh?=
 =?utf-8?B?UjlRaEhTNVF0cGtGWjJOVzRPSU1tWGk1V1VQbGZjcXJKZ1BML0xLM1pUdG4x?=
 =?utf-8?B?elFRcFloV2tWZTl0S1gvSTFQYWwzRzB2dWRMb0h1dXNkdkVJUUNydWpnSEs2?=
 =?utf-8?B?TjFjaDdwc0lZTkJKUkt0K1NsNDZLcXd2UlpKTzdvSk16dllXZ0hnK0lSZlZH?=
 =?utf-8?B?cm1MTWwzMVVtYndjeEgwUFptRWZUY1NjVlFST1BSQmVLNmZmWnJ0aWlXMnhu?=
 =?utf-8?B?aDlIcHVjTm4wMXBNUWk3aTA5MW9TT04zRkxkTEpwczR6RlBpMmdUWnhoSmpG?=
 =?utf-8?B?Z2FpbTU1Zm9GNDhNSnIwbjFtd2RQaGxDN3FjMCsvNTBIR3NCYVVFd1dZVVZP?=
 =?utf-8?B?enZ2Z3BOWUFGSDVLcmphQnd0UVNaU1dhMzlHNUVKamJaMWJFVSsxZlJjRWtK?=
 =?utf-8?B?OEp5QlZxU040eGZXRDlWRHBLdzRQRDI1RHpsSHloRUtzUDRCRmY2cXBBWm1P?=
 =?utf-8?B?bEFKN2ttbUVzZjlxUUgweG9RSzU1bklsazhwV2lvbWVGTjIvdk9EemQzRG0z?=
 =?utf-8?B?NUxONjc5MUJyQytkVnBKQncvbDdiU2ZvN0QrQ0hxWDNIYWNCZEw5NXV1cUE1?=
 =?utf-8?B?bnNYMEZSblpTQ3JTclhCYlZndEhpN29Rdm1xSE5SeFhHT0tyL0luTWdGYTQ3?=
 =?utf-8?B?KzhNVTZadnp3STJITWRJdnc5dzlZa1ErWHFqUDBaaVZIY0ZRemZrQ2NYRGhE?=
 =?utf-8?B?R2FTeXpPOGZqd2dxaW8yejkrUG1acTZETEhQOG5WTVV6eXQvYnl4TDFJNXpX?=
 =?utf-8?B?ak92TmJnOWZJV2habEFzd0lqSkJxS21vNlIzbHA3S3kwQ3JYVmI4dUdBNkJW?=
 =?utf-8?B?ajZnWDJEcERkS0NINitCT2lnd0hVaUU0ZEJMVEpMa3NVSUF0UGd2MTQ3dGJt?=
 =?utf-8?B?eXkyYllmcmJYTG45dTFIVkNvMGhtSUNDRnRRQmV6RUc2ekJTMGhQTndLK3Vx?=
 =?utf-8?B?dkx0RlpwdTFIT0R6VG0wMm5Ga2ZoNHVWK1RLZ2pzQU1LdzdBUzZESjdaelky?=
 =?utf-8?B?eitlVGorVUU3NklPNnBxOENPY2ZuY3U3Z05kaUJITXZzaHhyaGdyVnR2NGZz?=
 =?utf-8?B?VWhiOFluanhMT3V6RFVSZW05Nk8yVTIzbW0yK3JBVitseDlHL0JzYWJuaU1K?=
 =?utf-8?B?a2FHQ3h0NjQ0ZjlQZ2ppVXVWTGNLbjlYOXdmQ2dLbDE2ZC90U0ExUWt6QmM4?=
 =?utf-8?B?RE8zNW0zRTZ1K3NHQkVraWViaXlqSC9mMGtpUExFa1NySFhBa3dWSUpUajVS?=
 =?utf-8?B?OUlGTHBrZEZlVnVhTUNsSDlyTEZyM2c4dEp0UWY0WHN6MGt6MmtQRWkxdm9Y?=
 =?utf-8?B?c0ViTVFNZnRQZ3hzamRoZUZXUEFpaTZGdGJoL0pkek1iSWdjNGhKN0N6ZlVt?=
 =?utf-8?B?Z21tZURmMUNKUWc1eVNVK1NiU3gzcGJGMGx3dlY5K0FQTEI2V3FadGdlQ1VX?=
 =?utf-8?B?Q1habWxMcnhrUWtVa09QbStTUVUxMzJrVlZnZE9oaUJwR2hGcW1rYU1lUUV4?=
 =?utf-8?B?NWR1U0g1amJRYlBYOEZuRUFlVGt4T0hsVDRtRHRDOXAxZjB2ek5HVDVIUXhG?=
 =?utf-8?B?b1hGd3N4bE5UdmNYK2p0NjgwWVQxTkNGdVg0bVM3UTlEd1h0SDZuRVlLQUxn?=
 =?utf-8?B?UUZYN2hHT3hhVlgyTlMrUmVsWk5pUlZDKzN0RTF6WlROdGJUS1NmbjNsR2lX?=
 =?utf-8?B?NWxTZzk2TmZ3VkNBdDI2WHZwS0lwUlo4WkpxSi9XdS9yNGdQZC9qczJJQkxS?=
 =?utf-8?B?bUVLOWEvUyt6ekpCeUdmUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anRHN1Z5RmM2Tk9uR2N2anJvMGFYTVNOaUxqeWpRUHhLVE55K1hISGRrVVFL?=
 =?utf-8?B?ZGpmY3J3V0JMZFRUSVlzL1FZT3NNMEsvZTc1WEI0cDNIR2tDZnNTMSsyNUVM?=
 =?utf-8?B?RjVFSlZXcCtvSVlhWEQ5OFNBRWZpdVJDYTVxOHNNek1yNEJPZTlRalBpVHYy?=
 =?utf-8?B?NGd4bVZrL3o4NmlvZU1PbGpzeWpwV1lSdFBMN25wbW5LYklxUE0vZ0E4MTlv?=
 =?utf-8?B?SkJXV2MxTXg0aktNTis0SktMQlhkNzlPTUNuVERtbUY3MTl3UnhVS0tSNXpG?=
 =?utf-8?B?Tk4zQjBVRzdWUWZ2VDNoNUsxc0hOSzY5K1ZTRjRsUS9EeG8rYy9EdnpvU1lW?=
 =?utf-8?B?MDV4R3I4ZnE0QnFQa29hdThkT2hWaGFXS0phdnVpYnZ0bUJuVU1Iai8weVRO?=
 =?utf-8?B?bStBQ3Z1NmF0azZKWnJHOExsbmJ0dmlQTTJaUlBTcjgwTlhCdmxleE9lT3g5?=
 =?utf-8?B?amN5OERjNUk3QTFQVHN3QmVpcDJTU0g2Sm4rb3RQbm9nZ2dIQjdCbFlwNjg4?=
 =?utf-8?B?MlcrZW5SeW0yTlQvY2hCL1VCTnhsTStpZWVrOEhpOGo5WWR1NUpQTVl1ZGtP?=
 =?utf-8?B?cnpnai9tZzhGajE2V2x0TG5LUWNmM3Vnb1NvSFpXZVpqUlBpd1hDS3BMZmxk?=
 =?utf-8?B?SjVqSUhhYnFpWVVFTkJPTVBuaElnMHVRWWgwV2JJWHlmdFNib2h4L0I2RFlR?=
 =?utf-8?B?SklJYnp0VEs4bkRqdlpybzZrVjdqeXI0Q3pvUUlBNGRYOWRJZStGbFJLTFFY?=
 =?utf-8?B?QjdIc0lEWUM2cHVadERWcDgzMFhYRmNOY1ZJVHdGM2l3K0RzUDJQVnUrQVpT?=
 =?utf-8?B?WXZBTys4QzBSVUt1clJlaFFLRW1YNmRpRlVpb1gybHVnUzV4ZEFEQ0tVcjRk?=
 =?utf-8?B?ZFRudHVwV1lhVGd1UW1jbVIvem9BTGtSMnozUnFRNlhwRldiajFpNXI4MmNa?=
 =?utf-8?B?eSs5Q2huQUQzay9ZeEttMWhNU2RyRStBdTBiY2VDczVQSnR3YmhtZXhzbXFk?=
 =?utf-8?B?b2RCMDlycUZnS3ZxVjM1K0FHZ1N6b1RrcElwNXFKZmlLUEVhSmZVenhQMnVZ?=
 =?utf-8?B?QkNyWUVGb2NqcTlHSGVCS1VCUVVxYjAyclFmYy9vSXpFUXcyREFnSi92bnZj?=
 =?utf-8?B?b2FaSHBQMFRMYmZMYVNKZWtWY3d5ajRyZkF0UFZWdytyYzRUcHJhd0N6Q0lY?=
 =?utf-8?B?dXdoemNGYzlmb0c5dUNibVExRUNBSjNFc2dFcHZUL0JyT2hKVWxhVDVTYng3?=
 =?utf-8?B?VGgzMjZaV1l4ZUU1cUNMTmtzMDVDV2tnVG0yLzVxb2NBUjdPYThyL1NFU1Vs?=
 =?utf-8?B?MSswZCtqdXNMNlJZeEVNOTBwZC9KTUp2YndTSVN1U1NYNHg5elBWR3hwRjhm?=
 =?utf-8?B?WEFibWlQRkZyQlVjcEYrOUllZm1COFNlUGdKMWlhWUliejFRc09EaEVoYnd6?=
 =?utf-8?B?QlFSK29nVHdZR3ZQSFRLMnloQWVTc2c1ZDRqSmduZmNGWEJ1VDMraktnSisx?=
 =?utf-8?B?MFIyS2NjZklOV1NRckEzM0F1TWRUb21aTC96NnVzTnltYThPcG02Mll5Wnpv?=
 =?utf-8?B?UC9RWmRKRkhBMlhQb0JRVndoZGc3T1d6ajdYcE8xWGNSM09FZHFTTFZwbTVK?=
 =?utf-8?B?Z2ZlenI4djAwNFV1T2Jaa2JTQWhOMkRVYnBHNGNaSWoyR0RHWmVYNVJURnox?=
 =?utf-8?B?Zk9zSE1hWTYvQXVZWjAxMi9rUUlCYVhwT0JtSFhBUnd3OTVIM1crQTE1dE55?=
 =?utf-8?Q?zlrSv21vXXMdhxufg2Cr3RbccdUR6PfpxjTL+CL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75e2949-6821-477f-9b57-08dda7ceadbd
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 03:27:08.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0254

hi, Inochi,

Judging from the title of the email, your patch should be for supporting 
all cv18xx series socs, including cv1800b/SG2002 (formerly 
CV181xC)/SG2000 (formerly CV181xH), right?
I see Alex is submiting a PR to support reset for SG2000 [1], so suggest 
you discuss with Alex and merge your work with his to avoid forking.

Link: 
https://lore.kernel.org/lkml/20250609230417.620089-1-alexander.sverdlin@gmail.com/ 
[1]

Alex Sverdlin, I see you are also in the to-list, what's your point?

Thanks,

Chen

On 2025/6/9 7:22, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.
>
> Changes from v1:
> 1. rebase to v6.16-rc1
> 2. patch 1: apply Rob's tag
> 2. patch 4: fix wrong reset ID

two 2's, makes me confused :)


>
> Inochi Amaoto (4):
>    dt-bindings: reset: sophgo: Add CV1800B support
>    reset: simple: add support for Sophgo CV1800B
>    riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
>    riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
>      SoC
>
>   .../bindings/reset/sophgo,sg2042-reset.yaml   |  1 +
>   arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
>   arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
>   drivers/reset/reset-simple.c                  |  2 +
>   4 files changed, 126 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>
> --
> 2.49.0
>
