Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B281DE3B5;
	Mon, 16 Jun 2025 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044910; cv=fail; b=fko/SvKB6v1AA53UvDQ9YyRao0BevmBPYoakzY+ITbIv8neKPPC9uSJF6b3mVXbLJogQ2M3wg91a8/NRHGrXT/lXH4W4POxu24t4vLFoyRk63iuYu752AUbj5afzAIvnbGJTykFz1CKmZirbnASw5Ix9piK+Gnwxl3mfBhuxwWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044910; c=relaxed/simple;
	bh=OsLlz7DH8K2wc0JQpojZshHJFGcFXKURw40uS213LZ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RdLnLXduRkXYinUaeqc+AuL+/vgwDyHY1kwBfHVZD6RMO0Fb6sB2Msg1t1C9gabWTYm30qUaqxyOdKEWUosSnAXBJv6RNA1EPPyk7DRqthGPzbjh4vvYV2txMBmr3At8md2RpdtFFgI4g5aNuM9W/SW8RtytsUzb49xRimUY9vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XO9z3Gnp; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XO9z3Gnp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaBwTmBKO5PcUq/e1SbulB5kecoFxXF/7CiqlNIMZFyC4dxpXUdAK0vD8zShBBlT4UG5YP6ryJz+PritkurXmuAnss80DxK/d0LWryQLAv2Jk8uVRYx9UJmNjMPjF2aqRYDx2svBEe4ZxAVJLFFQNgmGHtmR8vS9Ibjg5zcMOJy1MaLQYSJMaI7GLjbNCCBt+ICvijbhLsDR5+ZM0v/GmEENQUx8gRMnLqpN5r14LrzEQayfomy227jSZ2Mmt9ZaKxWbDuqDMZKAdxkBeaINbclBCJj1G+lg42q0AxF84D0Oul8MnEct3rGX+Jv25h3wC5T0BdYUD6m3VnO4CYAtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCuRdTDayKU+PANJf2GkXcsaEtJOH3xd8CcSrcPegPg=;
 b=nf4E1HrvB+tmys/DIbqNbzf2wN+O2c4aDI6fyky/40RIwTsq1RKQMX2wyF0nIMUQviGcniT0vb3TyHOhvUu3wkQgwLxuMjWOGlhT0rr49oGZk6Q+V0krNCIT/lN8mAi3k5BAquiEaWNWiNSq7+1QjvZ1io39sJpRkcBor7xHZtSBzKyGEODXyT7Cp6shFLE+uGwwOi38SlsPJOYLnB5Sb8J2SiYAn47AZBfpENKO4gis0CpKk7ioXinZY6p6HkPzcl6wSNAVr4MkHOy+UlpbI0uj73q89B0tASv3sLOjRueXQFFZqdV+U1TE19BkjWrt/JTkYE/MdS2XvnHlX8k15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCuRdTDayKU+PANJf2GkXcsaEtJOH3xd8CcSrcPegPg=;
 b=XO9z3GnpjVKTvGOD9uBMgCYpXboKl0DkZaYb2he0CW6tMHiC5MfrvN6ICPq/RAT2im/xkCm6TBtFQHA9Nl7rKPSxPbTBUI2cmXGUEpuTL8O+akhJ5kQgLWU+2l9w61s/YKnTSabSKUnhZn74XDmYBUfrx3OekwfZ/OnThbYu1qayRx6ynXPBmOsQiFkzPFT6N4NM2bT5suvh/fK9fYr0tS+rpwfalmucPYLmjdYwFdODl0hVAwFsbj3M9DUL7LIPFx0eycuyTYhQxTuHHm1ZHXhsfktaSSpsspGgwIqyLzBffyFhyeJ8NZD0j8jybzfWbaTAC0/MJoaT42QWDSu8iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:35:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:35:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Jun 2025 12:34:11 +0900
Subject: [PATCH v4 7/7] rust: str: implement `Borrow` and `BorrowMut` for
 `CString`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-borrow_impls-v4-7-36f9beb3fe6a@nvidia.com>
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
In-Reply-To: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: e2449b0a-79da-4b9c-b446-08ddac86c99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTRpb0FUWmg2Z0RPeGhwTWU2YUxKaStVekRMcGNoTVBIY2doa0owcm9MRG1H?=
 =?utf-8?B?OUlHQ3I0TW4rRnNPcURkZlpnamNIQzRBNXc5SmVpYk9iWU4rL0JSd2hsSUFo?=
 =?utf-8?B?NGpNZUhaMHFrdXQ3ZE56TkhDQU9PemxYdWQ5TEIwcFVEU0s2aCtBMkxKR3hN?=
 =?utf-8?B?WERkWjNNeTRhSEUxY2l4WXBGV0RnS3J6dDAwUHFDMzVWUnVWbkxiSUZ3Q3Jn?=
 =?utf-8?B?OGJYZFBNNDVxeUc2YTBkQXd3d25MUUN6TDc2ZmE3K0hmeUxqYmVqK2U4RnRy?=
 =?utf-8?B?UjgyVUpOZFV4OGJFSHZucTYzYmxSQmpZQ2JucDZnTlpxQmkvY3FQUG9RRFp0?=
 =?utf-8?B?eXU1YVFGTEFhMksvK201TW9YTHZVODhaNHVlUFVQT0FxVUJ3by95R1FWbzVu?=
 =?utf-8?B?ZFJwZWpaa2xoZVU0S2xySkh2RG5BbEpvaUhxYVpFZm5DaFFscEhFZ2xhZVhF?=
 =?utf-8?B?NEc0Ym41T25Ea2dvcllDcWI0TlBXTnNtTktoOG0xb2c5cWZIRDdKZ1pucTBa?=
 =?utf-8?B?YTd0cXBENHRnT1ZTK1prRUhwY2dONGc3bWpxZitESEM2UmFhRkNVdWl0QUZH?=
 =?utf-8?B?c2RFNWRnekp1M1JvNUZVeE5lelFjdTlTY25DZFgzVmFYVmZHOHEraE9DZ1JE?=
 =?utf-8?B?K3JDSVcxbVdmUDIxZnBGTldLQVQ1OWcyMmczRFFmYzNBa1BTZytHK3hpNmRv?=
 =?utf-8?B?ZE5lOGtQYWhyWXJYcGtGY1QvNWpmbkNRNWFHOEtaU3ZPckxQb1haL0Z6WlZ1?=
 =?utf-8?B?ZzVFM2NSanFPbHpiVWljWERXc1JuNEd4M3VEbm1KRnlTSjlWUThJd05xbXZZ?=
 =?utf-8?B?YVYyWkdBMVFtZ3pSRzQ2UkRMQ3c5NmpySnRwUXlWcWdncVVreXpwbHlBZERU?=
 =?utf-8?B?RWhXc2lPYng3MTRaV2daUlV3NTNDcXEyMWZPYytqZWV3TTFlVHdQTFA3aStI?=
 =?utf-8?B?K1dCQXBlaWZOYlNubDBvUVZKZ09zWkVxbnFjZ3RlRUJGbnU4eUJGdmtJYjYr?=
 =?utf-8?B?UjhwUGZXQlVaQmdOcGY2RzVGOXdZRldlRVRIc0daU3ZVdTc0RFY5dnlIRlEw?=
 =?utf-8?B?Rmd3YVB0Q05xVGVoRVh1SkpLMDNGM09kQlY4LytQSytWUXdQcjJVSk1ZTmg5?=
 =?utf-8?B?MlB2QUR3UlFIay9IOHVGYlVMcEY3VWZkc1NnT0dIdU1DR2tGSEMxOFhkMWln?=
 =?utf-8?B?U3ZtYkx6aGhLZ1I4ekpNUlJLejRxUWVPaDB1VzdUYnJyenBxUGNOQUNjZXV3?=
 =?utf-8?B?MzVmZXdCbjUyeXpVcFZwM3QyaWtQMG14Mjg2ck1ucHc3Zzd6UzM3YjZyM3VP?=
 =?utf-8?B?UlF4T3Q4Q242d3ZvRnFPeE1wUWlvNWRLYm9Xdlgxby8zazIzOGxLZE5SQnJJ?=
 =?utf-8?B?YXpYM3NPSDduczZjc0VSRDZhNmVGZ0czM2luWTNCQkJjd3hKcEMxTzhhUEZt?=
 =?utf-8?B?cnNLUm1PNVcra1BnbHk1Z1B2bkZzd0h2bXlzM25qTmhTR0xXTXRtMDRMOW5D?=
 =?utf-8?B?c1VMamRGRTJLS0FQbnV4bDM4VU5YTFZTdXFvaFljbXQ1T0pMZ2V0cUNRZldM?=
 =?utf-8?B?SWREc2xFYTR4SlRxQndzUmtjdHlXVzM3TjRRS3ErWTdXVSthYmhhUGtFR3Fk?=
 =?utf-8?B?NlJPcnhpQ3JhRWlWbmVTVkZ4RFlLYXZEdHRQUUU4MjBYV3ZydFVvRURQRWF0?=
 =?utf-8?B?dnhLQWJ4dmsxZUVuQ29jZTFPWmJrQmJQV3l3UldnL2NNTlc2Q1lTTGJjSDZt?=
 =?utf-8?B?SEVlUkdsTDdnWFQ2Q21NVGF0OWN6ZVg1Wk1uQVF5SjVvaC9tSThoWTFsY0tm?=
 =?utf-8?B?am1xYWpheTZUYUIwclBYQ2tvYmZOazAyclZXeHNwZEtEa2EzZXhtelJJbEVV?=
 =?utf-8?B?TkVoSTVUT1h0R2hBVFIzYjh5VWZ3MThEcGVhTGtxSjBpMWlHWDBCTGowNHdx?=
 =?utf-8?B?Um4zcWI2aEt0aVQyK3BGWmhXdzYyZjlHbjJZbDB4QVp2ZFlyQkwwL0VJRzh3?=
 =?utf-8?B?SEY2SGVlTFNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVdMQzhHcmljNDg5a0w5U2FUZnR2ejBJR2oyQXAzb3FaaytiaXBOZHNGQjZx?=
 =?utf-8?B?RE15bEJuSXY5WXQzN3hZcEE4MnRmVis1eWU2dE56eFlUN0QzOE1vUUlmcDZY?=
 =?utf-8?B?YldCZnhQbkk3OGhwRy9aOU1IN1plcnpzbE5pcUF4NmJpSWwrRXZaS3JleFAr?=
 =?utf-8?B?MGZkdlNUdjNYODV3SXgxMmQySnd0SDJ0K3pZdXhxVFdPRGx6N2tCTjRMdzhh?=
 =?utf-8?B?YTYra0UvOWZOajRYdEQ0N0dlSEFUZm5vS2FZYkRleWhxQ3dUMXNmUjBLa1pV?=
 =?utf-8?B?OWJLTW1OeEc4Nkd2UUFFdyt6NmJWbC9ydXNWUWZjaEIwZk5nVHJ2MUVyRytU?=
 =?utf-8?B?WXk3eHJjRkQxSm9IaG9OZFhKeHRZTWg4THgxMnM5bE9jSm9DdHdWTktiSzNw?=
 =?utf-8?B?TGh0UXdYbTdBUjE5Y3FKNE9BL1BUUTFaWUMyN2NuVHRHYVpSdVNlUTFjUmx6?=
 =?utf-8?B?aGxncEdXZksyTmwzRk5YYjl3YzdwOXRUa1JlRjh0c0VyOW9FMlFRS1JFbzQz?=
 =?utf-8?B?ZjFGZlRaWmpRb0o5RVY4MWdVL3I5THp4MzBxdUc0Z0RIdy9lazJTcWduci9u?=
 =?utf-8?B?Q281bkVPRDNYQnYraUFUWUZrdlloamhmL2hSZVVlQ2ZGZnd6TjZQWnVtbTdK?=
 =?utf-8?B?bW5HKzdRbmlud2xVeWo5NENxaXdIeDhDeXlBa3ZKTlRuOEQ3dXgyZHJ3M05p?=
 =?utf-8?B?VXdFbG84K1dYSHBLNnUwTHI3bzBtREVOYkVad2l0Y0RtTEhjeXRRTVNybkc5?=
 =?utf-8?B?U2QwRUpQZGF6eTQxUngyNm9EMTB0VHozNld5dUhwcjhDQjhXK2V2WUw0M2NY?=
 =?utf-8?B?RGsvaXJtbUNmNzArdjZzbW1oU2lDZVFPY3ZEdlB1Y1lVZ0ZsdTJmY3V6Zmd4?=
 =?utf-8?B?VWJTY085VDJFTDF0NitlY2l3WGppc0kwWEh2QkhoYktiOHdtSzJzeFl5ZkJ2?=
 =?utf-8?B?c1VqYTcvaEg4ZnhMbGE0aFQwVUJBZVNKODNoSGlzU2Vvb0NRdzJweFZMQWl1?=
 =?utf-8?B?ZEtTS0ZVSVlUVDZWTFZwekloT3d5cm1EY3RwVGNIWjVvRzFHYnd4bUZJRFgv?=
 =?utf-8?B?Y3FLWmhYVXZGZEVzSjRaZTM1cFRxL0xic0NKT0d1MUhCcFBuQllRUG5oVjdF?=
 =?utf-8?B?WTZqUjNaVVV4OGFnMDdLOXoxT1V6SGp3RmlmK3dHMHI3Ny9vbzc3N1NTOEV6?=
 =?utf-8?B?elhCR1dpeG9GZkRvQmppYWhmN2xXbkRVbGNJa0IyRW5YMGFFbXg5aHZmNXdk?=
 =?utf-8?B?bGJvS1YvLytmVFoxMzdiN0pCampvR0RrSlE3SENmMm84SHRSbkhhNE5sVFYv?=
 =?utf-8?B?Y0d0WUZpL3IzWWFuM0VoNWpmc3UwaC9PY0FSME1OeXNmUVlVRWZiaHlTOExC?=
 =?utf-8?B?VGVCWFpHU0taNjh1S2pOK20wcVBFZG42QVl4R25rcDBpR0dXYVdrOVVEZUdo?=
 =?utf-8?B?d0tPdjZveUZacjZpeUNUbFh3Mm9wWlhoenFJeTZ4aUQrQjBVSVVuWkNldVlt?=
 =?utf-8?B?ckJYb0hwWG5sclBCQ1NMYm1OSlZmYVcySGt5cHRNU0ROOEFRMGRWcFpSUnFu?=
 =?utf-8?B?aCtiOGpaNVNOVGFNRmRqNm8vK1hVWlJ0cldLanVrUjh5WEdESUd2MThieVNT?=
 =?utf-8?B?N2dvcVBxUzBuRjdxYll1NmtZWGJETE5BSGZGcGhmQUpRQ1VwU0ducXBsWkZs?=
 =?utf-8?B?QzdMeVQwNWdQYXBoZksvMVNMbzF4bkZCRG02N1V2bVo1dnFQUExCM3BzUXZn?=
 =?utf-8?B?Smx3Z2FHZ2ozNzVTSVhsamVQK3FzRm9qRHA0SmNLMzNsdjlNSUN3VkRYT2lW?=
 =?utf-8?B?UVhQWG8wL1FTYmY0L01TVVpsZXlDZkJkY0Fxd011eDZZODZaejRZNFFHVHVl?=
 =?utf-8?B?d0Vick4xclhFRENvSmhwV0wyeTl6TnNGakcyaUxUcXREcnA2bm5iMzc2MVNK?=
 =?utf-8?B?SHExTTdqTS92Q2FXQXdNYVpVbC9uU0s3a0pJRHdxL1ExOTJyS0w3VXJqUFFZ?=
 =?utf-8?B?T3NOdFlsWUlsUzdIT3ZoeFNpREhyUE1aY2VqbVV1SmhaenlsTVgzY3ROZ1Bo?=
 =?utf-8?B?UnVLN3VrV0QxUlFGYjg0RFNPSGp6bWF6RExreG5ndjgyU0x6YlArMDJCQjZO?=
 =?utf-8?B?di9Bc0dRZ3NXLzdHQ044THB3TnQ0YU9zUkJiT3VUNlRZRWpMOVpCWWNyQ25M?=
 =?utf-8?Q?O0n3b0w5J9dkFm+bZPqJ+GGpJHHUk59edr7+e654aV71?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2449b0a-79da-4b9c-b446-08ddac86c99f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:35:06.5705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7lB2jeiuPG5nMQeqsQvF9vgaa9fBVnfSX14MPMdJ7FF1z6A3myCOw440CnwWKVWVBT/5Xa5YxxTMU37GfAJOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

Implement `Borrow<CStr>` and `BorrowMut<CStr>` for `CString`. This
allows `CString` to be used in generic APIs asking for types
implementing those traits. `&CStr` and `&mut CStr` also implement those
traits allowing users to use either owned or borrowed values.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 21d6f8801ea84686d4aa909fbb52578af96fe2d8..82924113bfecc41d9e16ba28d9dfb08d3a51d0bc 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::borrow::{Borrow, BorrowMut};
 use core::fmt::{self, Write};
 use core::ops::{self, Deref, DerefMut, Index};
 
@@ -936,6 +937,50 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::str::{CStr, CString};
+/// # use kernel::fmt;
+/// struct Foo<B: Borrow<CStr>>(B);
+///
+/// // Owned instance using `CString`.
+/// let owned_cstring = Foo(CString::try_from_fmt(fmt!("{}", "abc"))?);
+///
+/// let str_data = b"abc\0";
+/// // Borrowed from `str_data`.
+/// let borrowed_cstr = Foo(CStr::from_bytes_with_nul(str_data)?);
+/// # Ok::<(), Error>(())
+/// ```
+impl Borrow<CStr> for CString {
+    fn borrow(&self) -> &CStr {
+        self.deref()
+    }
+}
+
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// # use kernel::str::{CStr, CString};
+/// # use kernel::fmt;
+/// struct Foo<B: BorrowMut<CStr>>(B);
+///
+/// // Owned instance using `CString`.
+/// let owned_cstring = Foo(CString::try_from_fmt(fmt!("{}", "abc"))?);
+///
+/// let mut str_data = [b'a', b'b', b'c', 0];
+/// // Borrowed from `str_data`.
+/// let borrowed_cstr = Foo(CStr::from_bytes_with_nul_mut(&mut str_data)?);
+/// # Ok::<(), Error>(())
+/// ```
+impl BorrowMut<CStr> for CString {
+    fn borrow_mut(&mut self) -> &mut CStr {
+        self.deref_mut()
+    }
+}
+
 impl<'a> TryFrom<&'a CStr> for CString {
     type Error = AllocError;
 

-- 
2.49.0

