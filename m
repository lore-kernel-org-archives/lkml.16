Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2096.outbound.protection.outlook.com [40.107.117.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBC11F0982;
	Fri, 11 Apr 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371141; cv=fail; b=UOJgTiiUgAfHsQhzKcOQVhSzeMs0Z5gMnEA3D6sTXCtkz3pdGp0wUc+Q2uGGm/9gscLV17iK45513Rk6breIFrncs2vQyLLmCPGLYe1Vk/hC3u4rBzv0mfv4bW7XSqbnOFYrOhMwM3gEXHWQ5AnHo2wHYAHMni8dmGmGBBZP1UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371141; c=relaxed/simple;
	bh=kg6zTGm6eABzvhQH8vllF90yEOrHfyGjbvN59lYiUuo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bwTaJKsw91mTiUTeWc1lJe8AqqpQtmH+eF/aTEhHkEmGG+IM1rs4wqNyzuQwYfcOpFSOdpCca2i2AmQ1H9/3XWhXOqXfMWrHpHG92A8I777Up36HjRCsd1QM4dz+MnIMSJbV4h1eqDRa1SxdzAWzdYA9xL5x5rScsBeRxR84sfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=u4oIyz/9; arc=fail smtp.client-ip=40.107.117.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="u4oIyz/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYw4BVIP9fd4S4OlPstEKBze6x5Yc2ftYftDPWfGkmEnHrZj2XLfansxw5XiZSPaGClPIojta1qyxMmfSHSZU73loLfyTw3t3Th6qFRu9J6sZG8pbpjU7ExjUmxggUE/Sr31qHb4BV3N+4fl9b9KdLTW3Fwd2rSBPlRczOgdMqDyveboXmfNuOHmHlLTtWKXj6m5gtRZDmu8+EQgs5P/gsNCpzDMuiezJN3L6GZUPHTVbQTxoI9U9ycdG9Qn9qFawNUHPr8/30jF0qcZPzTYfi3euHdvAIXai/eZ5P4Zvdavm7E72VI+62XHyDisqBM9NnWTP+IKkZuv9WT+HOk0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3xyKlQp2AfWxRuw6wYAPh30sfOwFjmP5LqczqL1hoc=;
 b=XP3y9pUkB+g0bOXZ9ZVgAeBBDBdJoT/I2c4indbmeG2W+nRsUrXLoBfcBxMIooWktCrDR/U2HTdV1pXRx68Pwz8LIFkuChbMuIV1rDzuUSYHArOQ3OVaGf2GpqN3S06mVYchCuWxII6mYKybVhL6z0Eib5uEuOaqGF7jZf06icqy2bAHRGZtCyDvhjsw2nJPXJiWJnuiBJMkCtG145tC23oL94uppnFuboAkyr54pCnEBKcxMsmlBKUjYREJdxYbHkcHai2o2/T1Rr3ANusCI7O83Izt4ERz0X0jY/ODO02q9j3Fq02vOJtfy/15mHaS2UWIcidVbUFYTYywHtKMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3xyKlQp2AfWxRuw6wYAPh30sfOwFjmP5LqczqL1hoc=;
 b=u4oIyz/9oqbS9WF2ZGA8HfuKtnSgNmbE6l77/4pPJwNIIiWRgMxqMdnHy4d13MSnaRdVAkK+Vra+peI64CZL7V8DvFNTZdDVSyEhKJ2jSUzxlnA2P1ydVrpoSnAr7dFs7LcAiEbaggHfp0mnsuk32X3+f7lrOfre79PPFFEqqfZDqF1BKktcT75BRRv/BKFurt1GtW4b+A8pJ24x/vYlkwaeq/KL0SKfpSi5jYTOAGTHtWgHryAI5chXx55C7Jq1lhef46UFGjYQBYsbMEcGRWOwqIMyGrvkEqHh84P8+smNNkuCTpnmF9sSizu5hTPgEYHTFpyym2xfXcpaF6rzpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com (2603:1096:990:11::8)
 by SI2PR03MB6806.apcprd03.prod.outlook.com (2603:1096:4:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 11:32:16 +0000
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732]) by JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 11:32:14 +0000
Message-ID: <4c0683eb-794c-49e8-a313-267e32146f40@amlogic.com>
Date: Fri, 11 Apr 2025 19:32:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Add support for Amlogic A4/A5 Reset
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Zelong
 Dong" <zelong.dong@amlogic.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
Content-Language: en-US
In-Reply-To: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To JH0PR03MB7384.apcprd03.prod.outlook.com (2603:1096:990:11::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7384:EE_|SI2PR03MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: a49603fd-6334-4e0e-3673-08dd78ec81f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dExueUhYUlBLaDk1YlNFTDQxVzMzQytLWjFtM0xBaW9scEZVbHVGMVFKajJy?=
 =?utf-8?B?WEczSHBWM016UEV3MzJnYUtBbzhaYzluNENteVI3VmIyRHhucWd3dFlwM0U4?=
 =?utf-8?B?M2xXbkxmYU5TdVlaUldiTXJyUzZyY1UxUU16VzAxZEh0eitFeEF2VmlGOTBS?=
 =?utf-8?B?Qnc1azRXL2QwUmRDQVpMMm5uMnNkUHQ0ejFnYmF4MGtkc0tXQ1p4SVI3MVVV?=
 =?utf-8?B?RmtoeWtyKzVVdnhoTGJQdDRmV0x0Y3g4UUxPRFNIMG1NMFc5WXN2Mk5ITjM4?=
 =?utf-8?B?dlFERUJiOWRvQXY3SWlUOVRMRCt0eHladlJCd1YwbldtVmExbDZyaUlDeHp0?=
 =?utf-8?B?MkNhTTRyUmdGb21qaHZQMUs4M2RKRWl2d0tueVNyTUhtUmJsTEhGTyt4c3dz?=
 =?utf-8?B?bjhFYjJZdUZXMnlZQ3VRSlZJOUZQcGVJMHI2ZzFLTVQzcDBhUmF2aGdRT2Vz?=
 =?utf-8?B?dUJmSmZqWWJhU24rNERPalZVY1ZyaGRUOVNKVy9JOEJ6RXhCcStaTUtxa0dy?=
 =?utf-8?B?WW8vbUM4Z3Y1ejFRTlZJbVk5OE8yWXJyRyt5SVVjaWNTeExNUlZzTWxJdjlD?=
 =?utf-8?B?TWVUd1ZMWE5TTGFLK0ZlbWl2dTJXWWJ2b1QxdFhsRmFHNzV0c1NpZFZ0L0w1?=
 =?utf-8?B?enJtNWVjVUJYZFhQTFE2TUI3R1F1UzRTYkVMSy9zTzBaVExuckpmZFVwcVR0?=
 =?utf-8?B?RUV6MHJMSlRWOXhzZ0psbWkvbWJIQUhqOVZkbDU0ajdhY3VMSC90OFpMQjc4?=
 =?utf-8?B?NEhwcHdYR0FYUmRIOUJINVRGdWQ5a2hiaFF1UllCcWExSGVwZEZtUDFHb0U3?=
 =?utf-8?B?M2NjLzVVRm53VGdmR3ljWGUrYzl0UU1kQVNrOEUycVZiL0l4M1ZjNm40TUR5?=
 =?utf-8?B?WmEzTk56eHJBV1F1UTlnYU92ekY3YkN2TU1TeEEvWGVOOGVubDh6RnI4K01H?=
 =?utf-8?B?b2tDRndaVjhDVDJtVHZGUkNVR3lGQk5EQVI1SDNndTdHUFFJc0s2dEN3N0Ur?=
 =?utf-8?B?SGVNelNsdEd5SzNRakM5Q3oxejAxRW8wa0pibG01d0M5WjVYWExZdjZZQmp6?=
 =?utf-8?B?RHJDOCtsWTQwWFR2MDNvZnpZa3RZSnhsRmw0TnBqdHNVSjRqV0hjSHM5ZFVG?=
 =?utf-8?B?cTlMcVpWdjE1RXI1YVQxR1RyNjhnTVNFUkVRRElsVVloRFVMcDdnZmNmU3Ey?=
 =?utf-8?B?Wnpjck01andNOVp2bFhVZGcvRjZRVUpMZWxPVWFmdmlEMDVMQ1NFcndKYURU?=
 =?utf-8?B?UFh3dDA1WEx3SW1DcmhRcTU1VGJlZG84YjI5U1kySEo4VEZDU0YzVlB2QkNo?=
 =?utf-8?B?TEdSaW93TExWR3lnb1VtekFRdXBqT1g3MCtrYUtscTBGY3RKdDBycVd1UGVU?=
 =?utf-8?B?RFBvd3JhSVVDYjNMWlBoNzhOSHlQUVFsdi9BWmhqWFJZOHFJbEpRNm5KenpF?=
 =?utf-8?B?V2RSSE9aRHBBMVlRQitEUEE4bEt4STVHcXM2dGFRQVExRlZzMU5UckpCRHlp?=
 =?utf-8?B?ZWdyOW5DRTlIeldIVGY5WlBMbUtkbkh1L2dwbVl5T2Nsa1k1ZFg2a1EzS0N5?=
 =?utf-8?B?UWw3bHlIeEp6bFZIVm1xT2lONmpDeGZEcUpkZXRQUWlibWkwYVVsb05JRGky?=
 =?utf-8?B?MzdDREl4QUJKOGlKeVIzVEo1Y0ZrdFhwUEo3dHB4MXFpTE82bVhwVVp0V2xN?=
 =?utf-8?B?b3FsNG9ZVDZ2dEZhMXlXbjdFUXNMN2d5azhVTjJtR0VmSkp5aEhadFVJTFFI?=
 =?utf-8?B?emdLaWlUVTV1NFo4QzRGRmNUQ1krUXZoSkJGQjVsTDNjRHgyYUJLM3hwWUIz?=
 =?utf-8?B?VXM4NVg2M1A5cWR5TmdNZVluby9vUkt4ejEyVk9vNjNmblZHVXlGNEpwVE14?=
 =?utf-8?Q?oKIb4CLOnWm45?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7384.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEVFU3VFakxxNzA1VnN2VW03ZVI0MlZEYnNQUGJoOHc3QTJRWW9UZTl0QkYw?=
 =?utf-8?B?b25MeTVwWnZnZVhLRVlJd2ZyMUtjNExQaS9GOXcwMnA2UldpRFM0MUl6akIz?=
 =?utf-8?B?Z1pWK2dMYm9tR21lbWNNUW5hWHhPbmRid1F6ZEdYZ2xBcHZ4dXpaSjFsUWxK?=
 =?utf-8?B?QURhN3RTeDVBanpuM3JpeGM4cVZDWG9WKytSaW41RDZCTjgzNVNLWlFGclFz?=
 =?utf-8?B?clNGM3pwUUpCeTlDUS9YY2pBRHBQdjhsQ0Y1WWpMNzI0T01BY2VSd1cvZ29S?=
 =?utf-8?B?QVJkM0hqTG9PbFhzRjVJenBMMFNCaTR6MnB2SFRGQkhQNHVzdFpWNEpCUUZB?=
 =?utf-8?B?ejBoWFRQZk1wSTZGdUIxUXZTeWlMQ1cxVGdwalZOYUlYWm9TeEN5YnZwZzlK?=
 =?utf-8?B?ZE1rWXNoaHlMTVRHaHdmeEhGYmlOUWZpQVF1WmdBS0p3Y0R4UkpBdVQ4bWh4?=
 =?utf-8?B?VE1neWNmL3lTTVJHVFI0ZWs3UzNyN1AzK1phdHhaNDNiY21YNHpKUVl0RXd0?=
 =?utf-8?B?cElVRmovV00vQ2dLNDVRdEdreUhKemVyUmdKOXh4UVU3dnlNWUN6aFJ3VGxL?=
 =?utf-8?B?YXd5YjlZNDIvYlFzMVBGenZieW52Z2s2VHlXdnA0VlZmdEtaZlA3RWViMkh5?=
 =?utf-8?B?Wmd1RHZpeTBubkh4UDJTQVJwWGl3RG5hdVZ6OUZiaE9jeE1JWWJrSFI3M0Jp?=
 =?utf-8?B?TDg3YndjRFNXSWVUaHlTSjVIYjZ0MmxXWmhGLzJYUktRblkxbUdKQ2dZbTdC?=
 =?utf-8?B?RFZtclFXOGdNNnBhczNDRE03a2pnbmJnR09CNndJRVRjMkdzRTlHV3hJMmdW?=
 =?utf-8?B?a2lMd0N2YW0wUlZuSGVaTXp0YnBUMkkrRkdCdlFlUkY2TFNrMTZoaVhWYk9v?=
 =?utf-8?B?NCtTejZOZ3drb2RET1NROUFldWExOHgvblV0ZWRiZzI1SHVXTGFDdDNsS2lU?=
 =?utf-8?B?Snh5RGY0UklyMEZvUlJFNDRNUnR6ZndadmU3NS8wRHdvaDJyd2gyeGxwem9v?=
 =?utf-8?B?elVBYS9yVldmeG1WZlFtOXRseTU5bWdOSmZRQWVacm5OZGtrSUFkU2h1UVY2?=
 =?utf-8?B?L3hLaGJoRTc0M2YrQlhZVjJveDlqQnR4alhLa2FIU0lPVkI1RFc2dE0zSHp4?=
 =?utf-8?B?NlFjUlFnTkZJTlRIMXlBUGZBU0x4THBtekVlaHZjWWNjdDlEZ2FIU3ZOSkZO?=
 =?utf-8?B?YVVwNzRYVmZzUDZKRXpRTjBLb0EvM0xNdFRmb1RGQmtvN0Q3eUFMMXUrQzJy?=
 =?utf-8?B?Q0NGMVVXdzZQWC9DNG1EUTFPdkJNYXNzcDBSZGRLQXlvZEJnY0VwMWw1QUhH?=
 =?utf-8?B?alAyQTRCVlNjWU9ldW1ZYzdEcVo2a2k4aVFaTm0vN09KYzN5N2lzaW15V1Bl?=
 =?utf-8?B?WWpnanMwcXRHVHk5YlZ2N2J2Rm5LQ2xPV0lBS2lnd1hPQ1JwUHVoTVlzOTBv?=
 =?utf-8?B?M0JMM25iTlFUQXFjbGxPSHJqTlUwSjl6Wko3UUpqU0tsTGpoMjYyMzhwR25h?=
 =?utf-8?B?Q3djRnZjbzJONnozT1ljclpCMjJkckEzS0ROelZMZlFzNzBrTmJtL0pWVFBN?=
 =?utf-8?B?SW0zZ2pGZ01JeHpGb0RxdGRYQlBWRmdjdEh2Tk0wdFpZVFNER2h2UGw2b2Jl?=
 =?utf-8?B?ZXBBVUFhZ2FJR0o1L1k3cEZjdGhTWGd0QUxmYzJCSHNGQjhhbndIZHhETENG?=
 =?utf-8?B?dFErV3Z1SUJDUHFubFVLVUdlWVZrUkFxUHhwUUlEUnNNRS9WWEhsNUl4OFM5?=
 =?utf-8?B?MTU5aWVVNmZtVGR6Tlh5dVdYUFlZUDVseU9wbGhaOTJPZWlVczRnU2JxNVV3?=
 =?utf-8?B?QkIyaEJrUEh2VWtSMDcwTEtJOHBocW0vZloxVlgraWZLSURWNE0rSUZvWWI1?=
 =?utf-8?B?Vk1VRWZLYlJqTmtORjlUT2p2NHFrZTJGRmQ0Z0pyV051YzlFR3puMlRFbG96?=
 =?utf-8?B?Nzgrc0VJUVdwOHpYYW5XRkM5aTA3bktTcmVZKy9XRTNSbk9nQzltRHhXRFFJ?=
 =?utf-8?B?Rlp6dFVXS1NMc21OV09FNWRtL1g2VUZFZ0ozNVNkZUFrb0RYVnZmSWNLN0xW?=
 =?utf-8?B?cmF4VU9neU1tQTFDNEIwek5sTkExQk1Sd2RSeVFtYTgyU045VVVtcXlTRHg1?=
 =?utf-8?B?dkZ2QXFiTklYd1ZmT3REZG0rb1BPZEFmRGxqUVBvZWZRZzNaaWN2Rmh4bWJR?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49603fd-6334-4e0e-3673-08dd78ec81f0
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:32:14.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aomylD8QHcEQ26/3Jr+o/csVEeuowgNc+xu8wXQxDBD0l8Bd/7ugpllDjiiLrEiL2A9mvp2cZgGPp9icWTwXBfOjI5+UfGuKKRlKRkfWiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6806

Hi Neil,

Sorry for the wrong version.
Please ignore this patchset.
v6 will be sent shortly.

On 2025/4/11 19:27, Kelvin Zhang via B4 Relay wrote:
> 
> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
> 
> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
> 
> Changes in v6:
> - Rebased onto the latest v6.16/arm64-dt.
> - Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com
> 
> Changes in v5:
> - Rebasing on top of the latest upstream changes.
> - Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com
> 
> Changes in v4:
> - Remove the superfluous 'items' in the dt-binding.
> - Rebasing due to recent upstream changes.
> - Link to v3: https://lore.kernel.org/all/20240918074211.8067-1-zelong.dong@amlogic.com/
> 
> Changes in v3:
> - rebase on 'amlogic,t7-reset' patchset
> - Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/
> 
> Changes in v2:
> - remove 'amlogic,t7-reset'
> - move 'amlogic,c3-reset' to the other enum list
> - move reset node from amlogic-a4-common.dtsi to
>    amlogic-a4.dtsi/amlogic-a5.dtsi
> - Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/
> 
> ---
> Zelong Dong (3):
>        dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
>        arm64: dts: amlogic: Add A4 Reset Controller
>        arm64: dts: amlogic: Add A5 Reset Controller
> 
>   .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
>   arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
>   arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  8 ++
>   5 files changed, 218 insertions(+), 8 deletions(-)
> ---
> base-commit: 4bc28af2da876531e5183d25ae807e608c816d18
> change-id: 20250313-a4-a5-reset-6696e5b18e10
> 
> Best regards,
> --
> Kelvin Zhang <kelvin.zhang@amlogic.com>
> 
> 

-- 
Best regards,

Kelvin Zhang

