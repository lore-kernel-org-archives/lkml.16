Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010015.outbound.protection.outlook.com [52.103.67.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746025B673;
	Wed,  9 Apr 2025 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185494; cv=fail; b=cn+qyOppGdkMsvqpN9Q1C3s4K+QZ3WLTRDM0Y/lUAM6RbVIWaJcFXcIa3M9bLPaRCfmLTge7KefoCdkyErpjZC85yI7svha29tqJfjnNIjoXO6uT8R6n8jldAdcizyslbNzcx+LlAiEOhikK9noFyM0NB9tG5cRM8kjR2lMrZR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185494; c=relaxed/simple;
	bh=s1Uo4/Hs4opudZMBKNQ7C9RBu+ZKcqSu4PlAX6hkJ6k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ln1VDrkI3pj3EFOhUAyypo/qolTX4h1VCw/Dxzr3BOD9hTUrdbPpaJOe7ysH5eJ6tM9UpA/JZMA4JHgB980w07D8aWreKL4/n3iJq7UBq8PYWL2ncIfOR4FpNrx38DL7kWZRXiEHkxD4cS+R4CLvP1aT2JDKR6+SaBW+Qual32c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CYIVHgs8; arc=fail smtp.client-ip=52.103.67.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CYIVHgs8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fW3D2R7is2JnNMe32Pomb9gVI486ZUX1JPd/ZpVQOETvspjWL90FTvpyvXq7s6Ev3y8Y6wJpLCY4Y3Be/JcHRVXix4KMCEvIvYOVQKgCHYjFGsyXGZS37fj2b4l3XwvshGOQJJGRso82RIMMnXeJZ3r430gc+ukfKQDMlD25PnIZ43xWbm3lBHpqpmwSBBihTc06ZvdopIv4yINK2/CeMIea8WeR9j/X9Zu17YMOLqptv9BzIeo4PQe9X0FvCGDQ2R9E811hnIPboGUd0Ybe2j0e6NjBQH7PN/RKdkFFPDLf82IbzSRibTwSVMdda6WcfDHU7RMW+lOBQkyBMMZQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Hq68s2sKu7qZVISx5OZpMZIOZ+3ve5yFJxYwCHEIcU=;
 b=rKALfKJNMA+Brhwp0ehS99t95Poo9e2QIDrNVaHp2BM4uE3k+egI8MjR/bgWdjRKhPvd9omx9dC55EEB88q7fJOC+F/brPze2NzJ8LY2+ljFcKdFEhuHSClLOPj8yiphYTf7SF60Ly9SCczftLyNdHG789aRMWukJP9VHmoF9qRM9Q01JwPdHQ0COpE79d0eMt/V2IlJCuEMk08A/oqCqt3XhUq31O7FBG3JTYGlNr9JDE3EIJnCXoGe8tdA4jOB9JXeClzGNE+ZEEH6031o6L454Bos24Fcqxmg/JEiaGx6AnjT31e9nxLg1OvBlIByRRuj+wnI3WuR2TZTKdXfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Hq68s2sKu7qZVISx5OZpMZIOZ+3ve5yFJxYwCHEIcU=;
 b=CYIVHgs8icNWSBi5KX9bJJW1xu6NW28DX3QWUdXhhHflhJmssedPnUzOfABTZTfVGKUfPhyLdFCaWTQVG5vrA2SpmpivfMRe1NlD4l+v6vRtHkg40xqfH+WeRnBGi+7WE9yaOys6QGQSg6fWXQCWUdrulNsmfwEXoTpHimY/EABXmpTTuRwEhqDzHGBa2mEDf9GAkAmWjKiCGM93SxejbXy67VITdMCSoUhK+MOHfY0J0RuyGFeWLAweN1oyr06bhovSFbT72bO4EVOAv6ingdhMcFOWE46kUeVhXKfhIkK0KvNtZfTNZZgroWbStF+eJauEGIrTsCzO73UgbJHL8A==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0819.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 07:58:07 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:58:07 +0000
Message-ID:
 <MA0P287MB2262C8666D01FDE4B6497D64FEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 15:58:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250408050147.774987-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250408050147.774987-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <9aa680a1-943c-4896-9ab9-27216141751c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0819:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b01ed59-3200-4be0-5e38-08dd773c4350
X-MS-Exchange-SLBlob-MailProps:
	Z68gl6A5j2+rXb3faMtF+Xaa30Omw8BTXrDA4Wm2l4ReuyTazl8YOFzD/+Z7nqjDrnmlQahs5Zp0nLGCTR9sBn/Pfy+hgWmzO9TuUfZuJCE5Ng05W7dWxk2aAF7OAQgbY2ZO7UGp5NdFpiUl3UAMid3csEoHYij6hKff5Ud9Jv/MBJjzAwm312vSMRk/bWe63bs+p9KZxx9y9uI1s0RLdtpqqwU9fFV+KtGliYVhra2/PefMMF2rErn+04IU7rDmEAiX5afFuSHdG3nzh1umV1lrSO9NowIn7v+cz+V+5xFpN1NiAT1/MgVgfQFoA/cR5oG+PwluRhJAC1IwVA9jufOJ9SPRFuBdA9gLCg9qeLnko2UrwCfIFuYBSdMXn1vPzbVIQmkP5UnFI3+x3z8zbECt320da5A+jw4kLSjjpN/ez98SemHScSP6JaRs0ViNDyT/NtZH4waqvHHqlSyzG0cf/6PSg92Ohf5gRUW0twiyDqVpBtGUVSkmO5jl7+cU41emGD2OFY+8VtnPi7Zte7ugstZv9voE9un/dBQX0z7B0hSKuOpinzisxomqZCrdM/IdKnY8cdLxWmSLE8RYmDmzOlR1jekykdCFZsm6HcrDI+OKBZH0hR/pHDe9vXU1gB5SFREIGcEzV05JqLTeWGIK5P59zj0HpOqY6U9WoVfaPxtSAz+hvW2i5MKEGDQePtop2cOsajFRbGtbRPlufLPEor2aEE/no439vpWtCfJaSPnxoFQpheEYDOp9pHIWfQZFDmevZNbS+4XNn4DZuzJ7WqNUvm+r/ZCVwNesEatIF80fLHlRu20FST7hQgss
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|6090799003|5072599009|7092599003|19110799003|15080799006|10035399004|4302099013|3412199025|440099028|41001999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1dnSmp4RmFPRXRQbXFiVE1wcDl5RVJEaEJRSFl5M0dYR243SDBiM0lXRTRW?=
 =?utf-8?B?MHMxek1vRmlscW9raHFuQjY0SmtxTUpDR1U4Qlo3Tkw5QVlhMUJ2cVpyR1VD?=
 =?utf-8?B?VjYzcFMyTnBKWXJTcjFvSnhiVi9IMlNJdlkrOURCTitVSUt4M1RwL3ZPc2Rq?=
 =?utf-8?B?Q0FGL2VBTGxxU0lsaWVIUXR0aCsxdnFKQ0hTc01SSW1ZeHFaWlN6QXNraHJx?=
 =?utf-8?B?cThTbmR3WURCL25HSG9FT00rZ0dXZldmZE9kblRjUlFJcEI0R0x0MEVPZERG?=
 =?utf-8?B?QVdVaDBXdk9JZFA0TW45ZkpYa3ZmL3hXRHQ4aldqcHNJT1BEaENubmt0cEJ5?=
 =?utf-8?B?VENKckplcis4QXVNN3hCSVVYTFk0eW1BVlV4U3FkeDgxaXg3eHk4WUlrUi90?=
 =?utf-8?B?QzNONFJ4eGVKSWN5NlhJT3NRWFFGU1J6Vkt1MzIvOUthQkxoZ3RaYmNreTBu?=
 =?utf-8?B?azlqQmUzK2ZjSE9vVkVNem9pNFJGQm1iRTVJcHhabmdCZjltNU9xOGpFRkUr?=
 =?utf-8?B?M2NObkhIL2pvL2hsYTYwZ3lpdG9xRTBieU5idEo4Z2x0MnQyakhaQURlZ08w?=
 =?utf-8?B?akhZb2xBQ3l4a3lkWVN0MU9NdTlKZ2Z4SEhaOTVadVJBcDF6VGtoWGczR2pk?=
 =?utf-8?B?UVZpQVphVUZjOElkMW1nYU9GcVZ6VWpQd0g3bGh4V25xT1dVZEdaak9JQTdM?=
 =?utf-8?B?VkZEcllmbkdQR2FINHBHSTg4NU05SUQ1TklZM1o3ZEk0cDJtRXoyWWR5eS9r?=
 =?utf-8?B?ZWozdFZML1lNOEZmQit1aENmRWJFNnl6NitKcDRpcE1Jam1xWlpQOC9VY2hr?=
 =?utf-8?B?ajY5bkxMUmtDU3pyN1JqZm9FdTVwOStKSzZ3ekJlQWYyZ0ZQc1ArN2xiSUdP?=
 =?utf-8?B?QzVyMlg4eUovWXpNdFFDaXFKc2lTLytHZmJnTmtYYUZvUHNoRGpaWXJMOTFV?=
 =?utf-8?B?RkRZYWwzZmF1NW1zMFdsRFl2ZVpiaG9JL0hzZ042R0dPTlhURFd5bTFFdHV3?=
 =?utf-8?B?U1QvbG5ZMEJPRFJmNm1IRHBUVFpXOHkvQi8wck9VRXd6OER5NlQxUEJ3NVVY?=
 =?utf-8?B?cGhCVExsUUpjVTlvenJXYjV6N1dnQlNHenRmTWU4RitTbzhXRkNTWEgyeW85?=
 =?utf-8?B?OW1qSTlBUkh0Y1p3RXJkNGo0eXg4QXJ5b2phM0VabU5LQ1IxRFRtcXo0REZM?=
 =?utf-8?B?eHJ3STB4MEIxMkdnSHIyVFpYdmQ2dU9MSjBpYUZKQTNzSnBLZkJqNWo0RTd5?=
 =?utf-8?B?WlBkZHhXZzdkdDFYYU1kMW85SUcxL2d1TXpJZEMwRllvZlRHYXA4VEtBVnFl?=
 =?utf-8?B?YzFaeDJGODRvTWFDZjFvOWlhNDhFVzFVaDEvdXRwSGJyRDdDMGZoRXdmeVZx?=
 =?utf-8?B?Um1lSzQrSjhudHFGcXowOXdQVFdVMlljaXZ5SjZDaWwzQ2Jib2NlM0RObmJB?=
 =?utf-8?B?aVZDdGsyQmsrcVBHZCtydFRNelhONW9SOUxTS1NkYWJuTVE1Uyt5TDNkMHBU?=
 =?utf-8?B?SFJsVUhoMmRSY2NGejNib0w5SG9SWG9EOHBuc05tKzQ0YUVSdGZWQTN5Qmxp?=
 =?utf-8?B?ZCtHMWNNb1Y5TlJIa255SldUZXgwSWgxcTd0VmZ3WlI4RGYzdXA3a0V0Rk1U?=
 =?utf-8?B?bXNvZWZLd0NwQWJ2U2x1SjU1aU1aQy91S1pQWDd4NWYzNTBLcFlHZ3ZnMjdi?=
 =?utf-8?B?NlZmV1Z4MWtaWmJnS0MrQ1huWXBnTkNBUVgxdDhkZ2lpYW00U3RQSkEyVkdj?=
 =?utf-8?B?em0xNVg3UDAvKzFpZjZxcXQ5Snk2dVhobk5Ob216ZXVrbGFUSWt5UUpDS09l?=
 =?utf-8?B?Vklzb2REQmJ5c09TdE9wQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWtZYUZ5UGhPOGI5OU5PMStXK3IxVFVER1RNNWVvalFjb3ZhWDBuQ1lORjY1?=
 =?utf-8?B?TmtZUU1qVDRYRlBndE9YZjZBL0dZc3IvVXErc2R4T2tuZHBTaXQ5cm9LTDhT?=
 =?utf-8?B?aXk4R0paeTg5SjR5bzBEQTBzUnowVmJ0ekQzUlBGWFpnWVhsbWZJbG1MdmVL?=
 =?utf-8?B?OC81SFdMT1FkMkxtYjF4WHdXTUxHZkl2TkpjcnRkVGZpR285SVpFS3MxZDdR?=
 =?utf-8?B?UFJUZStYcFVIR0FEbkRhZEt2RlNJYm1HR1FqRU43d05vY0FqL1dsQUVZYWx6?=
 =?utf-8?B?ZWQyR3lkOE5BeVNISVljeDN6NjB5RXhmQ25vZTlMSE5IQ3lUYm9yWjEvRG5D?=
 =?utf-8?B?VFB6VlM1MEp4Q3JYa2hPUlhVS0o1Q3FPSDduWlJnek5lQWI2d0d3Y3FjeXh4?=
 =?utf-8?B?TngyWEhaZTdpQ0FZZ3JpZUUrYXdKbkZnS2NtUEN1UzRZTlQwbEptKy9LMElY?=
 =?utf-8?B?MmV1RTNCZnZuUTVRcXA2QmM1aXZSa3VVbDRJSVoya1U3RXF2MmRjUXlGZFow?=
 =?utf-8?B?SXliakxrMFZ6VHhJVVlqMlpxeUhERTRJVWxycWRWM0x1QlJHb25EOHZJaG1Z?=
 =?utf-8?B?clppU1dvSHRMQzYvLzE4TzdNN0RNWEozMHowNEtMeXlVNkdyOEZoVmlvYmJW?=
 =?utf-8?B?NCtqdkFDdGR4aWozSzM2NFVQWk9JOGUyZEk0TUxzdVROSCt0a3NSKzdrMXRY?=
 =?utf-8?B?clB1TkZNZ3VqWk4zUHVLb3BYTTR6a3U0VWdnMDArUUpheG5vNnVPSXh6RXhM?=
 =?utf-8?B?RlFJTHJOTTE3WDQrMGFTTGpUT216b0Y0Vk5HT3J5dVpxZkJOMVRUaklscU80?=
 =?utf-8?B?Znc0RjlBeFdqYjRKa0kzdkJoczFNWERGeDkyK2dFN1lEZ0xKYi91eG94NndL?=
 =?utf-8?B?QTNNUzh4UmJGVVhOQmRjQlAzY3JrQlIzZTVURjQ5N1hlNlczcEF0b2hUUVkz?=
 =?utf-8?B?VUM4QjV5T2xOenlFa041T3E3akNMSVg5OFNvRGlUSkcxb0ticHJKc0VuTVl6?=
 =?utf-8?B?UUpnOGVyUzJ5SjYvcGRHM2dTdjdJTjZNcHd1STQ5VHhXL2Y2bkNwcDByc3oz?=
 =?utf-8?B?VldZTlk4TGk0NTZEaDNvNVBISWJFQk5hc05XMU9ldElmRmszL2tPb0Y3SHZr?=
 =?utf-8?B?RlpQaEMycE1LTGZvYVhVVGNSdGVoTFpQVkY0Vkw4enJSWlV3eEpvL252TEkr?=
 =?utf-8?B?cWVPTTlkZjhCK3lqb1dTNkd6MndwVjlKckNlZlpzcHZJNENQeWYzVlZSWEZB?=
 =?utf-8?B?aEdEQjc4QzZOQ1hsVmJSc2xmK1VYeWZIMGdJckdjUlVKd1Jxd1NPaUkyMEhL?=
 =?utf-8?B?K1Q3aWFFRlduRW05ZWxpaXlzbXZKYkgxa2RVUURUdmlKT0ZIellRVXVwU2Jp?=
 =?utf-8?B?YTNvRURDZkpBVjQ3SXVKTUl4NUdaQk5kWE02aTM0b2dEWmlYNEZya2FkQ3Ni?=
 =?utf-8?B?MkNaZktKRjlQckVXc1NHdERkSEV5M3pDSWt1QnhEOUYzbXA2alRjVlY0QTZr?=
 =?utf-8?B?eUN6MXhMWVdITXcxN0RwQlJyUmxRd1QvREhjSm5vTmI5OFdzNWVJQVhxa0U1?=
 =?utf-8?B?TTVVT25PNXRrN285WlBNeUpkNnErM2R6VjVIY3haMjBpZWp1UmxFc1ZOOXQ3?=
 =?utf-8?B?MkFDUE1pN0pnL244QlRhdjRTUXcrcU1xazdXM1J4RUliN3JEZTF3cnNOQjNl?=
 =?utf-8?B?UHordkFsaDVDVVJQamJrT1NLMzBIeGkrVkxBYmhsQTFQYlRDcC9lTmhXWEcv?=
 =?utf-8?Q?Mu4wEQhLaAQPQfcZ7vh5c6b1l+m/F/paCYl+Muf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b01ed59-3200-4be0-5e38-08dd773c4350
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:58:06.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0819


On 2025/4/8 13:01, Inochi Amaoto wrote:
> Like Sophgo SG2042, SG2044 also uses an external interrupt controller
> to handle MSI/MSI-X. It supports more interrupt and has a different
> msi message address mapping.
>
> Changed from v2:
> 1. patch 1: separate from patch 2 of v2 for better reviewing
> 2. patch 2: separate from patch 2 of v2 for better reviewing
> 3. patch 3: apply Chen'tag
>
> Changed from v1:
> - https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com/
> 1. patch 1: apply Conor's tag
> 2. patch 1: improve the bindings comments.
> 3. patch 2: rebased on tips:irq/drivers patch
> 4. patch 2: remove unused macro "SG2042_MAX_MSI_VECTOR"
> 5. patch 2: rename generic structure name to match sg204x.
> 6. patch 2: rename info field name to avoid misunderstanding.
>
> Inochi Amaoto (4):
>    dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
>    irqchip/sg2042-msi: rename generic function and structure
>    irqchip/sg2042-msi: introduce configurable chipinfo for sg2042
>    irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
>
>   .../sophgo,sg2042-msi.yaml                    |   4 +-
>   drivers/irqchip/irq-sg2042-msi.c              | 149 ++++++++++++++----
>   2 files changed, 119 insertions(+), 34 deletions(-)
>
> --
> 2.49.0

Tested-by: Chen Wang <wangchen20@iscas.ac.cn>

I only tested this patchset on Pioneerbox(SG2042), I don't have SG2044 now.

It works with another bugfix patch [1] applied.

Link: 
https://lore.kernel.org/lkml/20250405055625.1530180-1-inochiama@gmail.com/ 
[1]


