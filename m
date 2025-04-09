Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2077.outbound.protection.outlook.com [40.107.247.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7626B2D1;
	Wed,  9 Apr 2025 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216011; cv=fail; b=Tm63bEnV3RyKiSZ2FS6ZOXH8s9Hb394QygQrzir820i5uEmTy1TFwrVw/3C1HBIKsJ4vwxPdtWRL0KerhhLzvHRgDWRtSEik9Bh3RCSe0TRMbKLWQcnsI3+AGiF3OnV8if/5mFASIYxKU5pQ/3HxRB6HHOa4aDvS4FMTQBfvADk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216011; c=relaxed/simple;
	bh=Cgj9zq35+tXPARe33Aq6QEduF1rdeKGs+9PFGTDYWV4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b1Te7WkWXdStFHG1G2gKHZI6HxT80g2cuA5hHqV9Yhrc5DowV3/TFINku6jviS+DDrnoLe8+kCIER9CgbBkuGen+6Zj4pgMrd/FLLlwp7Tx6u3ygZjTGu8tbMduTEJ9omLkTAm1Sv/XCGsl+aXbmYtJijFfqoE2/Spku8BJvgS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=SmVhTG3Z; arc=fail smtp.client-ip=40.107.247.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="SmVhTG3Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p54TNEg1zUfrj+II1+VRUeAjXIaafuiXoD4ysAJGkcehGHkw2tw8ODCi62Qd8cFiiTdFLIWPtRpPQkel/sIk5cTjVVh/l0X4iVB3Z0R3EahfsUv8OFCJm82aS6OOTQJoTWEboA1ZXOkQj1H+8aybLp2z+is0RQZ8UlhaSmiJWXCR+P9uE1tDFvlCG++zUnFpalEGQAVZnfseIUnL3YziiGsBgC6ocQA16kQT4AKH2YP0cFh/CAZgMHBdrZjlt6MQaSOBF38K/ls5bCniyHFveaUepFuKIqzbcTDT0kypEe7mn9i8xM0w6VckceN6KwkGEpkhV/TB1gj2KQXvx0+18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUw+jU74cJsaVH4d80pif1Y0IVb4Mcv9ya38QnS46+s=;
 b=r9Y9DFKuE/XxC3IfI5xNkzJF+NFZ0X78jf9EdAotGK4XmtFMs+sx1F3qtHhRYTA9AHd+vZqsPejdqT7bcBq0vIYjoUDjtzkmVRWpp/uJA6xzeckzkIk2nJcL4vnD7RBFZK2ZSv/H5HxgSK1dqSmifIIDG+nbPs98LNiK9X2RGoIOPELkhofnE41sWqtuhI+wKAkOhex97eXBDD/J3NPUeJgQvOK5oeAaNYAMGVtbu+wAFTJUPoPzfOiYgMmq9g8tk6LeMZO0pvssonvj12TPjdyNKMakLRLVUwkdkIkpc+mhJtlKtzxT6skH9sJfylXlNO8OxFIF7j88URF0ycmdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUw+jU74cJsaVH4d80pif1Y0IVb4Mcv9ya38QnS46+s=;
 b=SmVhTG3ZcaeyV0dElTy7ZFsavwLG8p/BgyP0tVOjZJ3TzBpEhPWkcxTLRKBD1WKeSpOF/DuLJNXtnrDApmpYSjwse5HlFrchQAoFuIR+FpLiveuzKqH/2f0oERGtelMLehX4I33kH6qtaWyghAWTBCubrDelOE3NOdJXKT5bTzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 16:26:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 16:26:45 +0000
Message-ID: <cc49276b-f64f-42a8-b4b4-61bde17b61e3@cherry.de>
Date: Wed, 9 Apr 2025 18:26:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
To: Conor Dooley <conor@kernel.org>,
 =?UTF-8?Q?=C5=81ukasz_Czechowski?= <lukasz.czechowski@thaumatec.com>
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Klaus Goger <klaus.goger@theobroma-systems.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
 <20250326-fanatic-onion-5f6bf8ec97e3@spud>
 <CABd623tEGh=qtpF0h7PkRBBrR7V9EaxUv9HregqbPcLU_2Exbg@mail.gmail.com>
 <20250409-commend-brewing-7c541aec26a9@spud>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250409-commend-brewing-7c541aec26a9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6b4b00-33f5-42d4-23e6-08dd77835176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjRqZmovVHhYbFI2VTRrb3NXQ0lSaDlvK3B6QVE2am9vQnNWclVmdC9sWWQy?=
 =?utf-8?B?OWszdEp2ZkViUkFrbUVzRDNoeTRnTW1uYUllNzB3NGlvSlBOa1FiR3Zpdm9E?=
 =?utf-8?B?VXZneCsvbWVaM1ZWQmtHSmh1UEhXQTVhTnJyeExwZ2lVRnp1cnZmSUNjWWgy?=
 =?utf-8?B?T0RWYk8vL2VWKzAxMEJtaEhDNExKM3laa0EyRVhlVlNtVmc5ZmszSnpJN0x3?=
 =?utf-8?B?MVF6emxFMlp2MHc3dE1nNXJjSk5QcjZhdEQwVUZuUTBGRVJxTjcvYnJxVTFX?=
 =?utf-8?B?Wk92RzJxMmVVdlFTaTAxck9PcmNmZ2pkQ1MwZGYzMHFuSXg0MVVaY0tyeExm?=
 =?utf-8?B?T255ell5NFI0akVLVkY5SWZGUlQvODd4cHFSQ3NsaE5ob3FZTGJWdUdEY21S?=
 =?utf-8?B?NHBCYXpvUnEydWY3dDRVdkJrWG5QcHRGV0U1R0JnazNJOGVURHBjOVRpa2JK?=
 =?utf-8?B?dW1hNGNNQ2xhZGE5T0duNnMrZ0VjT1BadGtxVUs0Zy9WekdNVm1hWEJrRyt6?=
 =?utf-8?B?TzQ1b2psVUlKVEM3azJicVBRR0VwSisxNmFSMURrUUJZVUlqWnhVTEZnNStj?=
 =?utf-8?B?YlIraXZzUG04MGdTQXFDRDI0VlR3MTliaVY2NThXUDZYbnFuS29tQzEyUGxh?=
 =?utf-8?B?c25HUXU4L2xabTRxZzd5bGs2L3dhNEFEV0ZLSDFEY1B3Y0Npb0tHL3QvTUZl?=
 =?utf-8?B?OFp4M0NZeHh5RHAydGhiNFM0eE13RG04NTkzNnNwcEg1aTdmSGpvREFCZ0RX?=
 =?utf-8?B?VkRUYmtVZEpuUURTRlpQUDRmbXBHWXlBV1VGNXpxK3dXaGYycXBMeHVnY1pW?=
 =?utf-8?B?RUJaMFY2bjVpckIveDZIYnErZERPcnBSQmZzekpwRkEwQUlURjBRWUdFWHlh?=
 =?utf-8?B?ZmRYOTVGc3kxazNnMUVRRVhTL243cU5rbEtJOVozNDByRGtDOEViS1JGejFF?=
 =?utf-8?B?Z0JyMFhINHhXVExuM3lIb0Q3ZHVmanl1QWVmaHFQYjcrdEdkVFBzWXRjUFFm?=
 =?utf-8?B?UnJVTGhwQnpZY28zOWdZbGIzSVpZczZBMGcyU2ZlQ1p3U3FDbkpvY3hUMmNQ?=
 =?utf-8?B?UXZuQkRvWnR4ZXp2WEk5M1NzN1o3bHpOZGhWdFcwTDNnblBkUUpGa3lTb1JW?=
 =?utf-8?B?c2dybjBFbkFvSWZnanYyUmxoWEt2Q2J1WmJzWWlrRmdjSFBaNEE5N05FQzE2?=
 =?utf-8?B?UmdDSFRRY1piWHo3NEpMdGUwdkx2WVZXTTVCMU1vQ2k5Qzc0T1MvU3VIZFBC?=
 =?utf-8?B?NnpKNTllNWVtRlpWOFVYYzc1bDBSd1Uvd3hPZC9HWXJQMXFBUkY5N1hZMDlh?=
 =?utf-8?B?Q2pTVjBMdE5sTWp0RHU4TW81ZXVsaUlFdXpPWHUvWTVVWDlXOEJZSVJBbnZj?=
 =?utf-8?B?Yk5Eczczb1dGSzdNcHRhaHlQb0k0T1FPaUprS0JvUnBWa29lRU0zVEZKZGpT?=
 =?utf-8?B?QytJb1dJeXN2T3hUcXpqZzJ4NFJDUnVKcGI2N21aUXE3em9OaW1uMlRQMVZ3?=
 =?utf-8?B?R3VRbmxvU28zeUxjTVF6S1l2MGdEM3ZlQVhMM05PZm9IMWN0eDk0RmtwaENU?=
 =?utf-8?B?b1BTa25sSWZ3Z3NiSlVjWE1UMllzeW5YaWZlM2o2cGltUDlMbTVlQnZLMnFx?=
 =?utf-8?B?WTdhdGk2Qmc2RlRyd1Y1SHdXRVVmSklZUDBnanduSWpub3RMRzNKOHpXaW9m?=
 =?utf-8?B?Z3NyeTBRZTY1dWdVb1VubzNyaWk5NEw5ems1eEd4TjdlRE1jd2VacXdvSEpD?=
 =?utf-8?B?TU1BdEwzTnE3bThtZnJFQTM1OWJpUG12dU5ZaERKNEc3T1BLcXY3UlVXTnQz?=
 =?utf-8?Q?GK89hVQ5ti+mMOMX2E5PKSmPf2XkVzZ471yG0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWtKVHBxdzNTMUVpMURTNVduQnh3SmZUNEcxekNuUkszWjVHMkVYbXUvYTZZ?=
 =?utf-8?B?UkIvd1VRNkdZV2phdERtZ0JYQ2NDWmNqWmp0cVJRNFBXbGJBaG9NTm04cFlI?=
 =?utf-8?B?UVhPaG1HNDNrYVd0MHY2aDRZM3dqVWptK3EreEdvc0Q2TWVoK1BsUjUxdDVP?=
 =?utf-8?B?VnlvVitmdlp3TzhJTmZzL3lLa0JOaWwxMUFRWDJ5Z2taTmN5bm84VkgyM2w2?=
 =?utf-8?B?M0lpdThEbjd5YmV2VXl5SFJ3LzVwTHF3Rk1sMitZSFFqTG82YzU5MEFBVTBk?=
 =?utf-8?B?M0luRFgxOVVNTGNoY0NrUmRmYkVzcTlmVHpQR2JZT1pReXNZeXNuTTcvVVg0?=
 =?utf-8?B?WThTdVZzbDI0SUhkcnZMcjY2RU5sSlpBWWQwajZTMWVIejB5SUFUU0l3TWFE?=
 =?utf-8?B?R1htU1pML3d3NmozWnBiMTBCM1NJU01FNWU3aWdFTG5EVFZQVE84ekZNQThR?=
 =?utf-8?B?ZGUrT3paNWJncnNtaWlYY1NHR25yT3NjL1NaYXhFcDFVMnVHOUdZWVUwNDhT?=
 =?utf-8?B?OFB6ZmR1U2tDM1d5UUtUUzBrOHo0Z0R6T0I5dW4zT2tOaC92YllhWGVzV3Zt?=
 =?utf-8?B?Y3lLempjQ3Z4YjBSRG9QNWVPZ0ZGditYSWlPQ0NoK2N3YXVDMlhKUytQMUx1?=
 =?utf-8?B?Zlg0MWo0eGdWMWIvdlZxMk9hRmtRWHNXY0tSamttM3ZOWG4rMDlpN3EvS1p5?=
 =?utf-8?B?K2xEL2hvVXRvR1pISzMvcXlEY28zc1ZldkhlZ01wVUY2cDVSR0RzL2hEZjNz?=
 =?utf-8?B?WFFYbEswMlBhWjltK2ZwY2lXMERWU1VENnNmOHRvWGQwSEh1bjRCUVlsTlM4?=
 =?utf-8?B?aWFSNThkbWZ5K1pwS2FWOFV0enI3TzZJVE5RVzhvWkFqajVnN01qWm5UUVd1?=
 =?utf-8?B?M1V1bTU4MW54d1VqL3dNZkQwM2ljdUx5aFF3bi9CL2dmQkpFOEpnZkJ6VG9I?=
 =?utf-8?B?aU4ra05IM3hXaUhwRkUzQmNZcHErdEp5ek9JRUw3S2RNRzJMZ012ZUJRVll2?=
 =?utf-8?B?TW1PRmV3VXFkRHhTQ1pSOW1DS2JtdVpFdUxNQ2hycVA1YVViRXRGTTYzb1Vr?=
 =?utf-8?B?b2YxTTdpdEE2Tm90QnFWczYvcFZXVXJUWDJ1RURjQXZTTmN5WW5aVENWdWFm?=
 =?utf-8?B?eWVMdFJ3QnFGdGxiMkhpWDJIWmQxNlJkWVhJcTdTVnJoT01sNTFQNHk5QWVM?=
 =?utf-8?B?R08zdGl6T1FlZjN1VjVURzRHMitXdVc2eHJpWExYbUkvV1U3WEx4MHlaWC9r?=
 =?utf-8?B?MjlPTDU2emFuaVcyMUl5SEsyeFZSYngyaTEwSVNxV3kwd1RxQnN5dWhCLysw?=
 =?utf-8?B?SmM3WEg2QmF0U2U3VlVHVzZheHZnOWxpai9ucFBWQnUxTUJ2Qi9mWVNzeDVj?=
 =?utf-8?B?dVhockpVM2tzakk3eDhWbDVrc0hDRmVLbUlOYUNlMVNBbGI2K0lwYks5WkF1?=
 =?utf-8?B?WThIVzBacWdiZnBaU3AydC84ZTZlcEd0VTBjaGE1d0hyT1pYYU5wMjhZWGRu?=
 =?utf-8?B?NGNhUVB3Nkg4SGNyV0pjMnZkM3N6eG04RHBYRitBRkdYZi9nb2xxOXgzaVFX?=
 =?utf-8?B?eFl2UTI0d2xEaGxjaHR5cUJlczRZOVJuemxGeTdTOC85b2RPOUNsTEM3Nnhr?=
 =?utf-8?B?NWtjYXMxQ2p5NWZzWlRYOTNTUWY5MDVhT1JSOVVPRUpRZmRORUtqZ2ZPRVhK?=
 =?utf-8?B?NE9wb2VFOFQ4blZjQzBTbUc4NHowd0JDVDVJVEJsQXFzaU4yQ0xMSUIrdUFu?=
 =?utf-8?B?aEx0d2J4a2ZHOXdiV1VreUcxUjlUNzhhUzZYa0xCK2k1ZjJDbHd0aFowUHFn?=
 =?utf-8?B?T1FoazZlOUZpdDlTVUFDYjY2M1RxaDNGTHFHZGJjWlVKRGgwbUV3ajU4dWRO?=
 =?utf-8?B?SkRMWFlJYmh2OU5tc05EaEhBVU5GZnZkRzVVU2ZtdVhLTXVUdTd6a3hxeDIx?=
 =?utf-8?B?QzJiQUdQdTBuSzBna3JEWVlPbVZadUw5Z3NKMTFYbXhKbHcrN09YQ3FZZ3Bq?=
 =?utf-8?B?RzUxY3ZIUzV3eG5Xckd6MEloUW5BQ0ZOTXVwTEVaWXZER0IxWjYzTzZsdkVT?=
 =?utf-8?B?a2dMUGRjK3pKSktFNmd5YnNVSEgyUmQvM282SzMrRHE2WldKa2FRRG95akJp?=
 =?utf-8?B?czRpb0hPNm8yVld2c1ljcGhwOHYrRG4yZGZIL05Yb2paaVhkYW9JMjdnYmkz?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6b4b00-33f5-42d4-23e6-08dd77835176
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:26:45.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWHy0IeI6FCp1OYrNWJL8W7xRZTnG40NhVuVZ1L/wehHu4AS5XcvI2sQjl2UWJoNXwoeoK9X9X2dF0oyZlz5XoTt8HXQaZBJhq5F1AX7JvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

Hi Conor,

On 4/9/25 6:18 PM, Conor Dooley wrote:
> On Tue, Apr 08, 2025 at 06:36:04PM +0200, Łukasz Czechowski wrote:
>> Hello,
>>
>> śr., 26 mar 2025 o 18:58 Conor Dooley <conor@kernel.org> napisał(a):
>>>
>>> On Wed, Mar 26, 2025 at 05:22:57PM +0100, Lukasz Czechowski wrote:
>>>> The Cypress HX3 hubs use different default PID value depending
>>>> on the variant. Update compatibles list.
>>>>
>>>> Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3.0 family")
>>>> Cc: stable@vger.kernel.org # 6.6
>>>> Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb/misc/onboard_usb_dev.{c,h} driver
>>>> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>> index 1033b7a4b8f9..f0b93002bd02 100644
>>>> --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>> @@ -15,8 +15,14 @@ allOf:
>>>>   properties:
>>>>     compatible:
>>>>       enum:
>>>> +      - usb4b4,6500
>>>> +      - usb4b4,6502
>>>> +      - usb4b4,6503
>>>>         - usb4b4,6504
>>>>         - usb4b4,6506
>>>> +      - usb4b4,6507
>>>> +      - usb4b4,6508
>>>> +      - usb4b4,650a
>>>
>>> All these devices seem to have the same match data, why is a fallback
>>> not suitable?
>>>
>>
>> Thank you for the suggestion. Indeed the fallback compatible appears
>> to work fine in this case,
>> and I am able to avoid additional entries in onboard_dev_match table
>> as added in the first patch in this series.
>>
>> However, after I've updated the cypress,hx3.yaml schema file and
>> rk3399-puma.dtsi file,
>> I get the following warnings, when running "make dtbs_check":
>>
>> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1:
>> compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
>>   from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
>> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2:
>> compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
>>   from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
>>
>> Below is the diff of my changes:
>>
>> diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>> b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>> index f0b93002bd02..d6eac1213228 100644
>> --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>> @@ -14,15 +14,22 @@ allOf:
>>
>>   properties:
>>     compatible:
>> -    enum:
>> -      - usb4b4,6500
>> -      - usb4b4,6502
>> -      - usb4b4,6503
>> -      - usb4b4,6504
>> -      - usb4b4,6506
>> -      - usb4b4,6507
>> -      - usb4b4,6508
>> -      - usb4b4,650a
>> +    oneOf:
>> +      - enum:
>> +          - usb4b4,6504
>> +          - usb4b4,6506
>> +      - items:
>> +          - enum:
>> +              - usb4b4,6500
>> +              - usb4b4,6508
>> +          - const: usb4b4,6504
>> +      - items:
>> +          - enum:
>> +              - usb4b4,6502
>> +              - usb4b4,6503
>> +              - usb4b4,6507
>> +              - usb4b4,650a
>> +          - const: usb4b4,6506
>>
>>     reg: true
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>> index d0d867374b3f..7fac61f95fc6 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>> @@ -594,14 +594,14 @@ &usbdrd_dwc3_1 {
>>          #size-cells = <0>;
>>
>>          hub_2_0: hub@1 {
>> -               compatible = "usb4b4,6502";
>> +               compatible = "usb4b4,6502", "usb4b4,6506";
>>                  reg = <1>;
>>                  peer-hub = <&hub_3_0>;
>>                  reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
>>          };
>>
>>          hub_3_0: hub@2 {
>> -               compatible = "usb4b4,6500";
>> +               compatible = "usb4b4,6500", "usb4b4,6504";
>>                  reg = <2>;
>>                  peer-hub = <&hub_2_0>;
>>                  reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
>>
>>
>> Do you have any suggestions on how I can properly update the schema
>> files to avoid the above warnings?
> 
> The diffs you have here look okay, not really sure what you're asking
> for.

It fails dtbs_check:

linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1: 
compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
  from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2: 
compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
  from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#

I'm not sure we're allowed to add new errors with dtbs_check (and would 
like to avoid it in any case).

Cheers,
Quentin
