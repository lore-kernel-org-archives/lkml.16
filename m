Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3B01C28E;
	Mon, 10 Feb 2025 02:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739156207; cv=fail; b=MlZOREcrfJh+2TYc9trxbFEUiUnbnU5bnARj1D0DcdfTi3S2g0D5Gx9kTG8uXWvQqTL9WdCftaWPSftt4/rETdqEYyhEM4UhdKMh6GtQy6Bf8IzA2crzyvBl3C6b1IaltbtXdzGaVYce5bvQpC9M6hk2ZBfv4BMJvYQrKvwa5R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739156207; c=relaxed/simple;
	bh=UqZq4OXwLoEI+BKUJi9ffYqpiBWIAV0SR/O4nenmgkc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HylOS3k/31tnRGJegzZlWAqDVsvN2Pk9Row0JX2D2junmFgNkrN1ksuUxqwk9inKi/VuTBs2Az52HrEZMrBER589mILuiASyobvouB+vBFqEC1SYAuI16SJ01fiyNpX+fw5WLQ8tCwTpyUC5f9SVlo5xym3D/BL7XDw27T7fCtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lvRbNj8Z; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lvRbNj8Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/ewq5GYFt+5XK4oR4Ygv2OuD+vBAarSGvz3PI2t5pks37JjHqDFd0qlh2RYkT3g4lXamEQrHhz88HoOQ+uMn+KFkVTBSJRsgex2aAWBXp5qnEa7kLI/TUfokhCV0/9IfU+ryHRmbReewSaJeIwQF9KROidFU44AAxWJjsW6jlvfKN9BbZsyAZKQRBLxyvt6o9/rhU7ndgQftIiAazM2xQUt6tCYrxbDdkn1WPlB8swgT5JHHoQ7D7rtqMSe12cfmege6WdCNWHpyP1/JJc0EFlneDOIaNHqkSlBpzlQV/DXsyCdxAU97DStsNYOrgoF0a2V0xSRYec4Yhr6oklimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tCu8uOc6h8wWfp8FvTTV6HHimo2HXIyfFI80OfLD9Q=;
 b=YqZ45uoB+SblhTaGaNjMqO8Ml1W1UtUMJiFq+CRgAG6kK4TqiVhWVgHsJhCEZELqOj/3TBKIcQ8SDcnoXXZmMBmdYju+30WRSbDsNtjyigQ0qWbiutL6ZEsh7lP20OzEpBfcmB1RgdupcfFgZheQ3B2RToJ4lrcp/nz0IIWL5OWvu/JcLUpUOfZ+PQDDBuOg9bMz2h/kFpDzeZLxqcIPDQ/viqCHxxgJZQd4nlhw7wmedujZSlsPLXjHpZGo7dOv1SErHgiOguqfwe4afPQRjD85LhAf/Q2odQvfXRcr3FqfClPgGiY6TU5Ij/LEZBsEm/y/fzBh66UIv6kz2fLsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tCu8uOc6h8wWfp8FvTTV6HHimo2HXIyfFI80OfLD9Q=;
 b=lvRbNj8ZwPZmo4/7BQG+fta5MBqTKnbFmQltrCbwyfkijfzCoSgKe6IaDXfyPk9AbfD8zzsxf6PnQue/IfxVg2FSKuSavyV15V6g8uFLs5nBbwZ1GheOvPATFd1vhy6xDi7RCsPFdg3XhaMjTZXiFdSLH+Rzd30JpeMG/AxdKv35Y/hDQcdHiCePdcL3M7ISNmzcozTPIGItB7eLv7yhrh2jHHhR8j2oTClFiHOLoQ/azhuruhx+W+H5mDTL08J1DZoG0Y9kPPjca9TmQd43LTh6bLd2JIDfLOdjmp9OX0zM++l29fXfYdGvH5PpEYJv29gRuk2LL6oQYJv45WiLwA==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by MAYPR01MB10650.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:158::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 02:56:37 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%7]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 02:56:37 +0000
Message-ID:
 <BMXPR01MB2440FA4006BA4E3EDC0CD11AFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Feb 2025 10:56:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Longbin Li <looong.bin@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
 <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
 <20250210012045-GYA12775@gentoo>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250210012045-GYA12775@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <e26f1b31-abbe-46f2-9295-72b1d5f93ee8@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|MAYPR01MB10650:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cd7250-3f0d-4c4d-0ba2-08dd497e88e7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|6090799003|8060799006|461199028|7092599003|15080799006|4302099013|3412199025|10035399004|440099028|41001999003|21061999003|12091999003|12071999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWpYY1lEL1lGbDIyVTNaK1I5SjFOck92cm1lNTNxMEtHaXRqS0lucWNpZHJK?=
 =?utf-8?B?dG9vbExhU3VUNGJUODJ4UXJWUENTZDQwUXZ3aTJWNXBqOWthNHZaaTV4VVVR?=
 =?utf-8?B?TDJncVpnSTZrS1BKcHAzUlg2R0EzRktoNjM4N2RUSW5sT0tyb0diNDU1ZEVN?=
 =?utf-8?B?NUNZanRkc1ZEMit2a3hGOXBBKytzOTAvS0FvVnQwTWZBQnppb3NNaGcxMGxj?=
 =?utf-8?B?b3hJU1pCQ1BjN3BrT3N1TVBkc2UrQkZYbk5GVzc4QVYydlNRbWNBcDdqK1gw?=
 =?utf-8?B?cGZ0eGh4bUZGKzRtZ3kveVdLS1VBazNuNDZzTktDWFhlUkdKUDlkNmVvSURG?=
 =?utf-8?B?VEsrMUhyaDVOL0d2T1U2ZVd0T3hpSHIzY21NZjdubktFRUR6L3lid1JvUCtO?=
 =?utf-8?B?aDJUcE5RN2Jua3lKaGs1Z0kzc1BUT2FRNFNNaHdZYlRDYm54ZjVjb0NhOUJU?=
 =?utf-8?B?SUdURTg4czF1ZVU1MHJJbXZ2VFZIVmRRUWFncE9YOVpZNTl4c2ora3VmU2Jt?=
 =?utf-8?B?S29oYS9aK2xEUkZFNzFza3Y2N0U2TXJyVWMzWHh2Z0l2MklrQUZSOTRVWWk0?=
 =?utf-8?B?RTUxbDNLLzBtSUZNcmx1TTBiMG9hZi8rb1dTd29zZ3puS0QreGtreUdXTHpG?=
 =?utf-8?B?MU02Rkp4U2NiVW16bkoyWlpzQ1lJTnljSVdDdFcvWk5oaDREUEhlZkxPRktL?=
 =?utf-8?B?NUdha20vWVJxVTd4SHQwa0ZHMFRJMTBUOEFIOVdjZmlFVmlLSytUZDBpdlRM?=
 =?utf-8?B?c0syN2kzZkNnWjBpOTlNRmxpUEl6RVJuWlNKdnBGb1FyT2JLc3RFSHJFK1NS?=
 =?utf-8?B?emhiSTI2VTUzcEIveDJyNERvM0NsOHN2VGRVczdwYklTMWQxcDBiNnFuRVlB?=
 =?utf-8?B?YWxHR3lTRW81TlVZeEpJSG1KK2VuR1lnV1dnSlV6TkZkQWJxcXRLdEFDV0pq?=
 =?utf-8?B?UGtzbTRLRnZQb3VTSlpmTmFpbG1zZjhFNVJSemxvUzVlaXY3QkxzSTZrTDYv?=
 =?utf-8?B?cTdWMmQvUlZyNWY5ZjJXMVBnL1JzQjArMDVzR0VOSm5PNnZuQXc2Qk5YdWFM?=
 =?utf-8?B?QTlkUWZyTnNPM2lERkt3dDIzS09oWkY1TWk3MEpMSkRzV0xlOTJSaC8xMDMy?=
 =?utf-8?B?WHZFelZJdlJ6aHdHa1hXbTlUVmljOW5EWXF5aW9EVGt0QXM1dHFtTVp1VlFl?=
 =?utf-8?B?WXZXaUlGeWpWTnlPSHd4cWN0MHNTWTQ0M3FOTWFhOUc1OU9tV1BBMEV3dEtH?=
 =?utf-8?B?Ny9zUkV3TEdiS1p1dFZaYitUNVRzaXltRE11MExjbzQyV0dMRkFObktMRW5X?=
 =?utf-8?B?dmtZSjg0RVJHYlowLzd6ZnoyVnRNZUZDSmVBN2tLRWVWVnZzblhkYUdxNVdp?=
 =?utf-8?B?ME4wYitzbkdMbHhOcmJpVi9OSDVsdVo4QllzcUlGbDFyK0VyVWJvNjgwZ3RG?=
 =?utf-8?B?MG84TGdwMkhOeUhJeEJtYm15M1dCbWsrejBibW1CK0dpMmdTNW02NWZ6b25U?=
 =?utf-8?B?TzQ5a0NydlJGUnlTdENXdVBmTHJWWHVZTnBvRkM2eHNiTkpnZE1QMk1DOC9y?=
 =?utf-8?B?TlJjWkdRdUgvcWRHbXQzZGVpdHVqR3VoZGZaTTNqWExaRm1OR1dubHRkaGI0?=
 =?utf-8?B?UW9FaUZLMWt3ZWd3a3o4L2dEME8zMlF5Ukh1TzlEYjUvdjNiNXVKRzJsb25M?=
 =?utf-8?B?b0Z4R3Qwb2cxSk5nSDFxenBhZnFScHNxcytKSWthWjNUcFluelZ0MG1TaEth?=
 =?utf-8?B?a0hSeWtaWVN0WkVUbXlZWFVnR1d6TGxPb1hzdVoxZm4wK0lZQk8zaVpLcmxy?=
 =?utf-8?B?RjZBMU1NSXhqZlluYWFpb09JSUdxdmVBb3hWdWFqT2VGaW5sTExST1lRZkJy?=
 =?utf-8?B?d2V1cXNGV20vd2hmaFhvaDNWLzdQbzV0MjU4OS91SW1yVUE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emNCMFNwM3NoWDk1cUdNMEtKZSs2djIvU0VJcW43SjAzOVN4U05MODNLWjZw?=
 =?utf-8?B?THJLWHNOV0JxT0o3Und0U2JYUk5mNEFFWk5FVGJLTDVyWlNEanhENWZhNlox?=
 =?utf-8?B?TTRibGd3UVBkSFF6YXFmclprMDloaHZhR1FMbEo0RHFLTTlyWEFhbDNhNDlm?=
 =?utf-8?B?UDU4RFFGODhldHZ0QWRXV2ZFOTJ1OWRBdTNWbDlEeW8wci9DTmJNbHRHaXlS?=
 =?utf-8?B?YVdKUjVHZE96NmdkbE1SZnJSbThCRWF1eGVkZmgwdmxFTUtCUWp4bGpjajFG?=
 =?utf-8?B?MUlKVTdUNzFuNVdBK3RTUmVXazE1UHJRSFdEV2t0RWY5YVpKR2VmZ2tXU2VN?=
 =?utf-8?B?QWdYZE4rcXRhZFRwR09ZL0tGelhFdElkd0tpcWxEbXF4bUlnaTNXNzZWTUx5?=
 =?utf-8?B?cnFKdUhVak1KSWx6bDRzV1FIU3JlYjdlSSt3ZGlidVN1NXU2Um5tRmk1aWZX?=
 =?utf-8?B?UGhTS3g1NnkwVzlkaUZaNEtqNG1GbzBrM3pHL1JuSk90UGYzb0trZXU5anRN?=
 =?utf-8?B?VnROOE91WGJqWHNWK3NiT0lPNG9scEphOW5wZFVVaitCbGY4S2lkckVISDJV?=
 =?utf-8?B?SkxoU3E3cmpuNlh2RUo0NHZJQWFmY0xYOE9IM3lPci94VFBuNDBHR3U0WFBh?=
 =?utf-8?B?dStBOXJuUVJvWGZSY1o4R3ZSK3hGODZHSWZjRC9iR1ZQZUFCSWZPL3ZwdEJB?=
 =?utf-8?B?MXBtazZpdWVuUWJKY3dycDF1Mm1LNlFxUExRam9GZ2x1ZnlQYTdsYUExTXJt?=
 =?utf-8?B?WkxWR3doUnB3SGswK21VckkvNGY0QjJkY2c5Z3VKZDhQSVpjWUNNT2lBYjRv?=
 =?utf-8?B?Y2tmdzRoYVB0aWpIZUMxRWhwV24wazIzWXBZSFMzR1ZqSXdlc1puOTVPNllj?=
 =?utf-8?B?TnZQZlhGZkdNRXlLWGRkaXk0cko2QTZ4VDhYWFNlOG5xVWlJdUNjSEpVelFX?=
 =?utf-8?B?MVV0QnE0ZzQyTFhEY2pjK1RqMDlldjNBTjhCQTVkMzA5ZWVGbXpGUVhQc3Vr?=
 =?utf-8?B?UkpxdWR0RGZ6K1BJa3NtOTEwMnNLN2FxSm9zSjJ4OXV6aWxVY1dvSzBsSnln?=
 =?utf-8?B?R2tpQndySnI3RUU4ZEpDNEs4Tk1lKzlDaHBES3ZlLzZZZW5MUFA0aDVOaStq?=
 =?utf-8?B?dHdkaWFLMS82T0ZqcWJCT1dadHZnS0ZrQUFnVENhTVMxUUJGeEJEcCtsOTBT?=
 =?utf-8?B?RXU5VXJ1aDF4enJ3Q0ZSVm1VWmxOU2h4eE1RbXZHTlhWMWNxR2Z1aEhNOWtY?=
 =?utf-8?B?WHdab1RjckE1MmZKa0FWZ3JXZ0J5UTNQektld0NDb0h4a013WFROOFpzQmtM?=
 =?utf-8?B?RUVjZXkwYSs0cGo4WHZVd1V6aFEzazBLUzZ6T3lVbUxLZklTKzlJMG80UTNt?=
 =?utf-8?B?QlJxeW1YdGZnWno3d1FQbEJKbURYalB6T0RYMzVmQXZZOFBYU0lnZUxmMjBN?=
 =?utf-8?B?dDVhTXlSWlkxbEhCVkZxUk1IN2ZDeHB3UXZsbTVJWDJzOCtBdUoxUDRXdDZ1?=
 =?utf-8?B?bzFWa1AwcXRQWit0Z2dmUjJjUVQ5dHpoYlIxc1hWWlczNVF5TGFKamk0NVdI?=
 =?utf-8?B?a2xWM1luN0FWVDFVejJMYmdUdWUzM2puWXJZTmRmeWlMVlhyWjF2QnRKUTQv?=
 =?utf-8?B?K2dVZXAwaWxLKzhUbnk3d05yblcrZWZDT25YbDJPYWVkMzBWbVVYdkNwZ3pi?=
 =?utf-8?B?VytRcXBOdEVLNFVKemY4ZmxvTFFWSmJzLysvbWRkNTZKc0ZldHJkZ0JFcUVO?=
 =?utf-8?Q?nKr0gZIO8+DGIwPq24JuqEZBpoogBoJKJwlS3D4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cd7250-3f0d-4c4d-0ba2-08dd497e88e7
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 02:56:37.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10650


On 2025/2/10 9:20, Yixun Lan wrote:
> Hi Chen:
>
> On 08:55 Mon 10 Feb     , Chen Wang wrote:
>> On 2025/2/9 20:29, Inochi Amaoto wrote:
>>> Add reset generator node for all CV18XX series SoC.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> ---
>>>    arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
>> Why it's not include/dt-bindings/reset/sophgo,cv18xx-reset.h?
>>
> then first need to answer if it's really a binding, there are some disucssions
> I personally favor Inochi's way here
>
> https://lore.kernel.org/linux-devicetree/c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org
> https://lore.kernel.org/linux-devicetree/c088e01c-0714-82be-8347-6140daf56640@linaro.org/

Well, it's fine if you don't want to define it as binding just because 
the ids are not continuous. In fact, for simple-reset, I think there is 
no big problem to define it as bindings.

Actually, in the first link upon, I see Krzysztof also said 
"simple-reset is an exception."

I recall we ever discussed this when Jisheng submitted the first version 
of reset driver for cv18xx. FYI. See 
https://lore.kernel.org/linux-riscv/42ad3f60-2755-4d3b-a766-8e4404f76a7c@linaro.org/.

>> Regards,
>>
>> Chen
>>
>>>    arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
>>>    2 files changed, 105 insertions(+)
>>>    create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>>> new file mode 100644
>>> index 000000000000..3d9aa9ec7e90
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>>> @@ -0,0 +1,98 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
>>> +/*
>>> + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
>>> + */
>>> +
>>> +#ifndef _SOPHGO_CV18XX_RESET
>>> +#define _SOPHGO_CV18XX_RESET
>>> +
>>> +#define RST_DDR				2
>>> +#define RST_H264C			3
>>> +#define RST_JPEG			4
>>> +#define RST_H265C			5
>>> +#define RST_VIPSYS			6
>>> +#define RST_TDMA			7
>>> +#define RST_TPU				8
>>> +#define RST_TPUSYS			9
>>> +#define RST_USB				11
>>> +#define RST_ETH0			12
>>> +#define RST_ETH1			13
>>> +#define RST_NAND			14
>>> +#define RST_EMMC			15
>>> +#define RST_SD0				16
>>> +#define RST_SDMA			18
>>> +#define RST_I2S0			19
>>> +#define RST_I2S1			20
>>> +#define RST_I2S2			21
>>> +#define RST_I2S3			22
>>> +#define RST_UART0			23
>>> +#define RST_UART1			24
>>> +#define RST_UART2			25
>>> +#define RST_UART3			26
>>> +#define RST_I2C0			27
>>> +#define RST_I2C1			28
>>> +#define RST_I2C2			29
>>> +#define RST_I2C3			30
>>> +#define RST_I2C4			31
>>> +#define RST_PWM0			32
>>> +#define RST_PWM1			33
>>> +#define RST_PWM2			34
>>> +#define RST_PWM3			35
>>> +#define RST_SPI0			40
>>> +#define RST_SPI1			41
>>> +#define RST_SPI2			42
>>> +#define RST_SPI3			43
>>> +#define RST_GPIO0			44
>>> +#define RST_GPIO1			45
>>> +#define RST_GPIO2			46
>>> +#define RST_EFUSE			47
>>> +#define RST_WDT				48
>>> +#define RST_AHB_ROM			49
>>> +#define RST_SPIC			50
>>> +#define RST_TEMPSEN			51
>>> +#define RST_SARADC			52
>>> +#define RST_COMBO_PHY0			58
>>> +#define RST_SPI_NAND			61
>>> +#define RST_SE				62
>>> +#define RST_UART4			74
>>> +#define RST_GPIO3			75
>>> +#define RST_SYSTEM			76
>>> +#define RST_TIMER			77
>>> +#define RST_TIMER0			78
>>> +#define RST_TIMER1			79
>>> +#define RST_TIMER2			80
>>> +#define RST_TIMER3			81
>>> +#define RST_TIMER4			82
>>> +#define RST_TIMER5			83
>>> +#define RST_TIMER6			84
>>> +#define RST_TIMER7			85
>>> +#define RST_WGN0			86
>>> +#define RST_WGN1			87
>>> +#define RST_WGN2			88
>>> +#define RST_KEYSCAN			89
>>> +#define RST_AUDDAC			91
>>> +#define RST_AUDDAC_APB			92
>>> +#define RST_AUDADC			93
>>> +#define RST_VCSYS			95
>>> +#define RST_ETHPHY			96
>>> +#define RST_ETHPHY_APB			97
>>> +#define RST_AUDSRC			98
>>> +#define RST_VIP_CAM0			99
>>> +#define RST_WDT1			100
>>> +#define RST_WDT2			101
>>> +#define RST_AUTOCLEAR_CPUCORE0		128
>>> +#define RST_AUTOCLEAR_CPUCORE1		129
>>> +#define RST_AUTOCLEAR_CPUCORE2		130
>>> +#define RST_AUTOCLEAR_CPUCORE3		131
>>> +#define RST_AUTOCLEAR_CPUSYS0		132
>>> +#define RST_AUTOCLEAR_CPUSYS1		133
>>> +#define RST_AUTOCLEAR_CPUSYS2		134
>>> +#define RST_CPUCORE0			160
>>> +#define RST_CPUCORE1			161
>>> +#define RST_CPUCORE2			162
>>> +#define RST_CPUCORE3			163
>>> +#define RST_CPUSYS0			164
>>> +#define RST_CPUSYS1			165
>>> +#define RST_CPUSYS2			166
>>> +
>>> +#endif /* _SOPHGO_CV18XX_RESET */
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> index c18822ec849f..9aa28ade73a4 100644
>>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> @@ -7,6 +7,7 @@
>>>    #include <dt-bindings/clock/sophgo,cv1800.h>
>>>    #include <dt-bindings/gpio/gpio.h>
>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>> +#include "cv18xx-reset.h"
>>>    
>>>    / {
>>>    	#address-cells = <1>;
>>> @@ -61,6 +62,12 @@ clk: clock-controller@3002000 {
>>>    			#clock-cells = <1>;
>>>    		};
>>>    
>>> +		rst: reset-controller@3003000 {
>>> +			compatible = "sophgo,cv1800b-reset";
>>> +			reg = <0x3003000 0x1000>;
>>> +			#reset-cells = <1>;
>>> +		};
>>> +
>>>    		gpio0: gpio@3020000 {
>>>    			compatible = "snps,dw-apb-gpio";
>>>    			reg = <0x3020000 0x1000>;
