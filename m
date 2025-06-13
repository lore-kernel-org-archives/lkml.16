Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0FE1E5B8A;
	Fri, 13 Jun 2025 03:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785543; cv=fail; b=l8HdMHlfa8pHxCQXJ0I+wU2xcY03BIat4JtT/sD3yE4P3jgx6u+gUtQzuMupRdPUTRlLN+bKbbmSU+ahH4FuhS/LmTzCFCzDJAxlCnZXb7C7qrdyFvjac1ZROUWPZZbl4eJU9bWVqf7OXC7oliUL1nzPVXKOIqHtoxovuZC/XWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785543; c=relaxed/simple;
	bh=BLRp5Ge3PoDkrTgmGdSBUAsoeCPDeNk+UtBIIX28bmA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SYuvrZZjrjmvfYUxAe9o0/EYAwxqtcUve0GBwOjCaUTXnYyJMnd5koHRNd88AN0/2DltnDMrkrCpgmz43AFkuICMeHZ4wHDKsvy9fb2HWSXd+/GaLzPKJAdJcFsJsyXf6wFabFkbWDxlz0K66WCAsbRNzB0gXW9o8lor2Mq9IA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DKAG+6Aa; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DKAG+6Aa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWAQX3sahNP8gj7Whh4gappm2J+BTANq7jlwt+Un5PT48r6ZQizLeAOFrOSurBG1HthJxRfHl7jTrDOC7h7/MODWHKkBIFk0SRkIpRAoAIeZwo8/uIVejW9MF42IHbMfmvmp340IE1l/rj3uCL5iC631Y7w/3MNzvTqL2PgeKkuO51iOCB0LuEm8+5WvKXgJwdQ8YqtPqU7Stj43Xdli6DgZzAcp2os+MMgbZjcrw/RW57kZgBGQF1tNFSZ+C7fLDk1f2ztQhDixoa05h08UPVpK6U+cWTl4pAtcko9Q3tkolSpcDgYNHOCScCdweBNYWb3gTKbqjOiynRfHavPilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEPxEJikP+8R3oQ63lWben4/VYJ6SA9mH/2cnm8428c=;
 b=LvDIRrxfPwAMBbgXq9X+ayo2E5HLY5AGn/m6UZxKm7QGVp1PZ87WiP2LXkRLXIbwRo9RsyaVNI4uMzSu14H97HyuHTgYkjYricU7yZ9Bv56E8fr5gtAd6vl4pUhW0551wp0VNhOdnAtliHxfvcHdTOlOyFXySdyCRkfqNd34OmsShHNGFoBjTzYOe5WOzRignOaDBU9pLs1MP6jOO7mVpDKKl/H/ilxM+Tkigu24vhiMFT4XJ6cy4ZgbDZTRRuAXH7hQ1oajQG0UbSyAQBWmgS9lcIm/XvKIzBTxbb2zTtc9J00FknC1ypmPCLpEu/OyVK3UjovE4cZMXWcKa6u/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEPxEJikP+8R3oQ63lWben4/VYJ6SA9mH/2cnm8428c=;
 b=DKAG+6AaOgtu4F5rq6bxFM8LXvoQ9faY10ZHUfMrZ8Bo/qogQSXPxFOLLF/Pln5zyNu6i+BhHGnreHLncSL4m1GoaAD8JnD3h1WwWSGfjuvMZ3VW0wtKG3XiCew36frLFpZW7lDVUw6kNMFXuGpoAk2lNOrPkM0zL/R5zfM0keLCyN7GCqVtSAi9luftTmF4AIJd41hpWF7L8ZSbN57UeoFb8trdKijv/kTAsbmVal3KN/lzqaSBICM87Kp1UpQJFkIk7nb7UOP4+4IjOl/86yifPgNv/7ARKQsve8fA/ZE/haaCY/iATAQv/McCecib4oz6TJDGekSDwWoVLGGQew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 03:32:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 03:32:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 12:32:13 +0900
Message-Id: <DAL37D3FG3YA.TSCJ1LMJO1X8@nvidia.com>
Cc: "Timur Tabi" <timur@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <DAACKTM8B9A1.3SI9LRGNMSBH3@nvidia.com>
 <2025053117-snowy-tradition-eb9e@gregkh>
In-Reply-To: <2025053117-snowy-tradition-eb9e@gregkh>
X-ClientProxiedBy: TYCPR01CA0157.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: 6456ca12-f941-40f1-cda3-08ddaa2ae54c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1Z1WDRRR00zd0x5a0lZR0QwWUFicmZmeGprVGxwa1dmRE5iNGpja296RStR?=
 =?utf-8?B?d01UWHo0eXl2TXJuRWRDN2gwbGxOWXFxeGFqcTdjVFEwQUxOazhCSE5kQk14?=
 =?utf-8?B?V01JRzk3UElrYzIya2FXdTVTbUxFc09XWEROS2dEZ0xQK2JvZW5nbzFUNVJo?=
 =?utf-8?B?OSs0eTJxUGF1RzB3b3RqK0E4QmlLV0lWOFVZNHZvSVJwT1pZNWZYVHZHOGtt?=
 =?utf-8?B?R0NiTHFHQVVLcDhnT09kL2kxaWJqUW9iL2w2SzFLVVJuRWRRaUEyVGRBam02?=
 =?utf-8?B?OFE4RVY2dHg3RFpjUkFlTkd1TXNrUDJaVjBkUWRNbVZRbWFCNy9CbHpWRi9E?=
 =?utf-8?B?YlJ2VUhLRWFBdEpFaTRBSjh4c1ErYmF5TFVIV2lzczJOS25DTDZETk9pSm82?=
 =?utf-8?B?SnE5eXVRanJnS2xNZFRUbW9ob0phNXh1VDFkSWdPbHV2ZkhlcmROTGQ0ZHhH?=
 =?utf-8?B?NHV5dUl1cnNTdVBpb2RBazdQa3Q3VXNsZWlwc1RoR1BDV21WZ2htRFZOUkZC?=
 =?utf-8?B?eTdic0pLMVBXZnRDanRZTGhrMHQ5RmFrOWpuUjlZa1puMEpuMmdrWlF4eUF6?=
 =?utf-8?B?TE9IMFVDUWpnVFdFa0g0V2g3V2tBMng5cmZZS2JlNW5CcnFMSDdGem1BUU0x?=
 =?utf-8?B?d1RyT1IvMGg1Q0doU0ZuckpGUEFyNmVQWHZXM3JnWmVzdG5aZmdHRWdHQzdt?=
 =?utf-8?B?UlRCWndVWllFL1ZKK1FPNkZHck9sRUd2UkcvWE9DTSswSHpLNGpQQlVsMkZj?=
 =?utf-8?B?S1hzMWVBWnBxWENUTnRxbEM5SVFPUzZVZUlQa0V4Z2hFQWZ4eENlZ1VVZlJj?=
 =?utf-8?B?clZnZWZmVTNlWm9Gb3Jmc0I0eGtkbzgxTjV2ckRhbDR1NWl5TWFmdHArd1dN?=
 =?utf-8?B?eGdYbU0xWWhTallEdEkxWU9BYzFWeVZKL1dGMHJXbE53T05hSmpHTzgwMlA5?=
 =?utf-8?B?Z2dMY3YwVHZ4TWhIaExGUWdRSk1NVXdjcldPeVVUelA1MnorYktzNWM1SUxm?=
 =?utf-8?B?c0k5RWllWmttSmNXQWpzT2l5WkRIbUpPV1EzTTZ0ZUcxdk5kT2d6RmErZFZ3?=
 =?utf-8?B?THdnQ3NOZVZkRVozTXNvaDlvVDVLbEtoakVFb2VCdlpDVkdvSjYxRk9YTjYr?=
 =?utf-8?B?M05iZDdXUDFOTkt6WUlIbHZ3bHhzaURPZ1hKVEhmcWxRVWdSdXRYTWJ0cEVY?=
 =?utf-8?B?VjRiR3BQTmMreHYyelFvUXdzZlg1U1BZUklFbTRQRkpvSk43SXp4b0wxVmVh?=
 =?utf-8?B?OVpvdXlWeWQyYjIwOUhUSWNPMUcwdVowVU9TYVdVN09NRFh3SXFrLytocmF6?=
 =?utf-8?B?T0RzNnBqZ0l2SUlCbFpldE1lTE0wZWY1NndOOTRMUWZxS1RpSGhYQnc5aFk2?=
 =?utf-8?B?SDErUjhyckU1c1prcExOR3J0QUUrYjNMYlNhc3pZbEIxN3ZCbjRTZmxEK0Ev?=
 =?utf-8?B?c1JzTzlnMElJcm01bjF1S0pYT0V0WjlYOVBQdnMvYWt4SFoyM1UwK05keWdP?=
 =?utf-8?B?QnZlRitNbExzTnI1ZnlJVDhSRHczMEFIbzNCajZHUjdpSVo2WVIrUlVCbGlk?=
 =?utf-8?B?c0NjV1c1bm4ycWFyU1hMYjdWRmRYaFZpRXVBcXdHVjZvSXg5ZjhBUGEzUlc0?=
 =?utf-8?B?aFdyK2tTSWx3SmhmK3JNOUVSUkx4a2VjTjFXSFZxc20xVnhFc0dnOHlWOFl6?=
 =?utf-8?B?MXJtaVZxcXMzcDM3TXI5bURIQjYvMUk4ckR0M045aUlGQlVyODZicmtCb0xP?=
 =?utf-8?B?ckFNeWg0RDVybkxZSUpCaFdPa0Zpa0VkWnBMS3lieVArSGpoSVNxQStpd0Ry?=
 =?utf-8?B?Nk04REZjeTYyTnZwZEZLSVN5aUUxKzNRcnlKUFBYK3R0OVFtYXFYTDJmcjV4?=
 =?utf-8?B?VlkrdTlON1BtckRXMzlKVFJKWHVrUWc2Y2hPTDFNNVVOeDdFSWFwalZiVnlv?=
 =?utf-8?Q?LO45WINdMhs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzVLbzd5SDErdC9vOXNweVJ6K0FMVEw2NXZnZFpCdFZHUVJ4OWtYdFovYmZh?=
 =?utf-8?B?Y1FKWGJEelZVTEN3d25zbFJtNEEvRWFIWUhJa2g3MFdSYmptdXIzUzg3Y01D?=
 =?utf-8?B?YkZUbEtiRU0xeVZTSUtaeTdkM3Q1Qzk0a2RyNDlFalp2UWc2aUVGNzlJbjVE?=
 =?utf-8?B?Y0RDWk4xRktNc01FT3Z5MlhGWnZGdEFhdkdBUmJJVUk4Mk9STHJQaXFremtM?=
 =?utf-8?B?ZlY5NC9GVWdzNjNEVEJTejl0c0VoU0o4NGdwZEZxaXFnNmNZS1NGcTlnTDEy?=
 =?utf-8?B?MEZwR2dQVUh4aHEvTEFqdm4wSWl6SjRaTjJaQ1VTZmNZYjVMNXpwdTJ5d09m?=
 =?utf-8?B?d2JoMUlVd0pZK2pmZ3dsVEpNKzFDNlVvd0F5b0I4RGR4Q3ptckRLMTdmWEVo?=
 =?utf-8?B?L0JJRnViYVlGd3g0djBHbndCRmNvS3BoREZVTTRON1Y4eC9VSWVXYWh2eTVK?=
 =?utf-8?B?UHV3NUROU0huZDZZa2JpcmxDYWtwU0UzRzQxd25JYlNDeDhrZkd2aUlrU0hP?=
 =?utf-8?B?bGpjbXFCUUprMWRzUTV6NmErZnVPa0JqR2hGaHFWdzB4cmwxTithaVk5ZHU1?=
 =?utf-8?B?ZTNoaVNyVHQrdFJuWEhXRTBpL0hrVk1ud0txdWcvYk0yVzJNOHQvZjA2bmhu?=
 =?utf-8?B?RmtFT1VJeGlDUU1sazUxdHRTMlhoRzV1aEU5ZmRYclBNQWVseG5CU1ZRaThk?=
 =?utf-8?B?TUJ6L3VoZWtFNDJRZlhidng0UkYwc0JiUWtFbHdQclZaVHpCSjhBVUJnL1RZ?=
 =?utf-8?B?YU9WRmd4M3FnS3EzK3lYWTl3cjIybUgxa2NabnlTMTUvUlU1NEppVFpibjlv?=
 =?utf-8?B?THcyMWZ1QXVXV3UwSzhrY1VsRGpYT2FiQ0lIT2dkek9wTi9ZaHBQdC9wWXdk?=
 =?utf-8?B?MmdTRzVrRDRiM0lsMmdqVWhET2daZXlMVEpmYSthQXR3bzA4Yll4NmpPLzI3?=
 =?utf-8?B?VlpCc1d5S1dpL1M4aktiVmZ0ejdLN2ZvRy9tM08vMnpiWVJOdW1LMFpRTUNC?=
 =?utf-8?B?SHNjWnB3Ti85T2hxUFR5TGNNQzlrdTVJWFZtRlBJQWhXdkgybDVhK3EwTmlt?=
 =?utf-8?B?cnlJSEZMZk83c1h5TVlaOHU4M0hKNG5ZU3IwNkg1MGVTNTgxdzAxSlNzUzNp?=
 =?utf-8?B?K0ZwWFNXYVlmRE9RS2pwWFRrSGt3U0hnenlDcEdlVkpuL1lqenZySnlRZDU5?=
 =?utf-8?B?d0FWd1BtMVR0YUQxQWh0YmdBRStzMTNQQ2FHTkpVd2lhd0p1RHZlRDZsZTdZ?=
 =?utf-8?B?QmJMa1VzeEZqKzViMjllWk5qUHAzWkRZZWVDT0FNc2g0NVdheURGUTNOSUZV?=
 =?utf-8?B?WXc2R1N0Q2FqTUVaTHh1aFgxZk41VVhIa2hlenNSVTdQU0tQVklsK21Cakdu?=
 =?utf-8?B?UkRhRTRZTWo0QlpWQlp1azZRYVlrWjJMZ1FBYmlMTFAvZ3J2UFhQcXIycGkw?=
 =?utf-8?B?Sm15Z0xTWGJZbW5CREhQNUV3TmM5bnkzQXlPOWhSQ0JJMTJaM3A5MGZCRmJ4?=
 =?utf-8?B?dFo4MWg2NG13UHpCWnp4S3J3UGFNaGhhckhLUTl2TlNvWmZ4RUYwaWRrS2VQ?=
 =?utf-8?B?ZlRMaXg4NTk1REZKOVlreTBGdVZReFdZNWhVNWx5V1pOY2l6YkJlWUhHLzlS?=
 =?utf-8?B?cWVJTmJjakthT3V6ODMxSngwUlJ0VTRYQitieW9zZUU5TlpQcFB1czRzNERP?=
 =?utf-8?B?c24yVkZMdjlpMjhXQjBFVllYRzFURzFnTzRDcEpFUEFkR3FKTytSdmZiRkFG?=
 =?utf-8?B?QWJqR2MyQ2dkcjl1dUZxSkhyS0FZSTAwaWZZbWh2Y005aFFxV2JyUk1kSVhn?=
 =?utf-8?B?WkR2TjI0cytmQk9rT1J0ZUwyb2ZUakordDEzNDBHUlNmcVVNd0krTlNobk54?=
 =?utf-8?B?aTQ2RVM4TkRjV0d3YnhCa3ZkU0d0TVlETXJrMk03VFpLT2s4cllWcEZDMGM3?=
 =?utf-8?B?TWJlSVVYei9vZXBPdGZudXBhRFZVUHJzbk9iejZCU1g3NnVxa0JxRDluU0Vl?=
 =?utf-8?B?ZUJRYWJMbUdhT3JyeTJzLzI4S0s5TWtHeXdzRUE0UHRkWVFrNVlVQk4vbTNL?=
 =?utf-8?B?TUFMZ2lBdmhHa0R0TUs0a2Vnc2Q3MTJQb0VWcElneDVheE5qQmRORDFyOTlD?=
 =?utf-8?B?a1VnejgxY3IxUFJ2SnZQcmpiRlM4QlVGR0w1SGk3d2M2Q1pxUXpaUmNaUXhB?=
 =?utf-8?Q?rocdTIqW/Utj9NPw0nNza5svywhhVZT1oJ14eyPmiqKk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6456ca12-f941-40f1-cda3-08ddaa2ae54c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 03:32:17.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+Wru4pt+G7QbBcjI3tDwkro/7pAECIr89ICHtuRyt4nbkUNZ+JRM57EcK+cQHfG3c6DaiCQFg7WAaQFAXmT3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223

Hi Greg,

On Sat May 31, 2025 at 10:30 PM JST, Greg KH wrote:
> On Sat, May 31, 2025 at 09:33:38PM +0900, Alexandre Courbot wrote:
>> Hi Greg,
>>=20
>> On Sat May 31, 2025 at 2:45 PM JST, Greg KH wrote:
>> > On Fri, May 30, 2025 at 01:10:50PM -0500, Timur Tabi wrote:
>> >> On Fri, May 30, 2025 at 10:42=E2=80=AFAM Greg KH <gregkh@linuxfoundat=
ion.org> wrote:
>> >> >
>> >> > On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
>> >> > > So to try to answer your question, I am not disagreeing that user=
space
>> >> > > is capable of doing what we currently do in the kernel. My follow=
-up
>> >> > > questions to that are: how do we command userspace to do that wor=
k for
>> >> > > us when we request the firmware, how do we provide the result to =
the
>> >> > > kernel, and is this something that distros can adopt easily? I'm =
happy
>> >> > > to consider doing things this way, but would need a few pointers =
to look
>> >> > > into.
>> >> >
>> >> > Again, look at how your firmware for your devices in your laptop ar=
e
>> >> > loaded today.
>> >
>> > Note, I am talking about non-gpu firmare images here (wifi, usb
>> > controllers, etc.) that are using the firmware download subsystem for
>> > ages as examples of what to look at as to how to trigger a firmware
>> > image to be loaded by userspace into the device.
>>=20
>> I would really appreciate it if you could point me precisely to one
>> example (a link, a function, a file) of what you are describing because
>> I'm starting to wonder whether we are talking about the same thing.
>>=20
>> Previously I mentioned udev and CONFIG_FW_LOADER_USER_HELPER, but you
>> haven't confirmed whether that was what you had in mind or not. Assuming
>> that udev is involved, I tried to snoop events while a
>> `request_firwmare` call is performed using `udevadm monitor`, but that
>> revealed no event related to firmware loading. Then looking deeper into
>> the kernel documentation confirmed that the kernel does indeed a direct
>> filesystem lookup in request_firmware [1]. IOW, the kernel looks for the
>> requested file, and if it cannot find it it's game over. This matches my
>> observations with udevadm, as I tried requesting a non-existing file and
>> no uevent was generated. I don't see what user-space can do here.
>>=20
>> I also tried to look up this "firmware download subsystem" you
>> mentioned, but couldn't find anything under that name - I suspect you
>> are talking about the sysfs loading mechanism, but AFAIU this depends on=
=20
>> CONFIG_FW_LOADER_USER_HELPER which doesn't seem to be widely enabled
>> (not on my distro at least).
>
> Yes, that is what I am referring to, as you all seem to want to do
> "complex things without a specific filename choosen".  Look at
> Documentation/driver-api/firmware/fallback-mechanisms.rst for the
> details there.
>
> Or, better yet, just have your driver name all of the individual files
> that must be loaded and then no userspace things are needed.  That "big"
> firmware file will have already been split up into the different parts
> when you write it out to the filesystem, so no need to parse anything.
>
> If this isn't going to work for some reason, I think we need a better
> "this is EXACTLY what we need to send to the hardware for the firmware
> image(s) it requires" as I'm totally confused based on the different
> people talking on this thread about totally different hypotheticals
> (i.e. 12 line elf parsers in C vs. a giant elf parser in rust, random
> hypothetical hardware values that userspace "can not know", pointing at
> obsolete crazy interfaces like remoteproc that just happen to do crazy
> things, etc.)
>
> So step back, come up with a solid design document, and let's start over
> please.
>
> thanks,
>
> greg k-h

Sorry for the time it took to come back to you on this.

After further investigation, it appears that most of the points we
discussed were indeed orthogonal to whether we rely on ELF or the
filesystem to provide the different parts of the firmware, so I'd like
to apologize for the unneeded confusion.

We had an internal discussion with our firmware team about future
firmware releases. As it turns out, the firmware itself is undergoing an
overhaul, so we would like to take that opportunity to re-think the
release format and try to address this issue.

It will likely take a few months to reach a definitive design, and in
the meantime we would like to keep making progress on bringing up Nova
with the currently released firmware images. However, since Nova is
still in early development, we don't need to maintain long-term support
for these specific images.

Based on that, I would like to proceed as follows:

- Ask Danilo to include a stripped down (<30 LoC without comments) and
  temporary version of the ELF section unpacker in nova-core so we can
  use the images currently in linux-firmware for short-term development.
  I want to stress that this is temporary, and stable Nova will *not*
  support these images; this is solely to enable us to move forward for
  the time being.
- We (NVIDIA folks involved in Nova) will continue working with the
  firmware team to ensure that the upcoming redesign takes into account
  the kernel's requirements, especially the need to avoid unnecessary
  complexity in the firmware loading steps. There are other constraints
  of course (the hardware itself continues to evolve, with consequences
  for the firmware), and so we may or may not achieve everything we hope
  for. But we will work to keep it as simple as possible.
- Once a stable firmware ABI is established and its first instance
  released, we will make it the minimum supported firmware version on
  Nova and remove the band-aid mentioned in the first point.
- If willing, Danilo will keep us honest on all this. :)

I hope this sounds good to you.

Cheers,
Alex.

