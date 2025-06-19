Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A80265637;
	Thu, 19 Jun 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340645; cv=fail; b=TKNHh1usAy2zVQqLN2umdfLTfUCTXomQs3ZH2QGP0fUcsAHlIvrk5/oTk4MEKW/L/+tVdJOm7YLris9x7JGEBSDE6OINkdNWP66/M9ihjjy0dDJxFhOcxdCYnYlEboSGELTf1Ds9gigvlGVkexyEC/U/LbA2No/82OUl3Ty9C+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340645; c=relaxed/simple;
	bh=aXIt2ABgLpncUUD9EjNCyX/nYVqzIDBnroP9W6LDzcc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dvA/px61GDYn+o9edQ2mJFcSh2YGJXWea0Smr87/WE+DgivpJk0Sq6ZyiXt1JNvmaIJuGeeRgNdL+719DK/HdFckrvtRyaNZJM8/TVjcukJjm8Ps3FPF6BWG9S/lDyTt+LX/FqbWFXWQME+EU/r0zKNx1QRdyx/P2e1UYGW7MOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jgP5R028; arc=fail smtp.client-ip=40.107.244.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jgP5R028"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnFpEQUMXv8MUn1GX0plA+LmwZqG1LABFzWcMjB1wjyHGe8MkEdRZW8SDNGxsClsQfAwR+iNUQCcr7o1TYu3AwZJC+FzBBblmCgCHt5HIRBXNLO5RhiYNf0P1tqxDUL4Vl05hMjMqcSWQR/jrf/AmKc35lq/Tbn04VXb1qswuFWuE35RELURB5FFasLJhxS3JQ7Vc5rrIdM+6qE66uf2P+KO1fGUAFPvnCh9k31QcyZZPOb3bbIAtbd2R4PrIXkJjt6R5EzHxFLKTvKR8dwXDHCmdg0XiK3u8IKQZ0PTFRO6H60Evh62Q0MByu3yg13Kk7n26oeNihM/Yx08xoEedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXIt2ABgLpncUUD9EjNCyX/nYVqzIDBnroP9W6LDzcc=;
 b=LyAgSUbscYoRtFRkXzxPhVSx2syq1NRvZlbc93WXu+5/nJx5Sh+qdjZKWTrXzOT3yvXnt86HrJkhJ3mVlggOOnm3tIQu4M+cKNhvL57Qs4yg/Ys87tmw0hGyMXF01bjRLvM63llRviYEE3l3AVPED64NWlK4EhD26KYs7sOQ9Fxb8HRraqs7+vA6M9FoOEnC21N0vZvntBun+lRspW4ggIa08hiXJLrMJLPNYHSi33SmSGSWD2EGt9BKeWwv8BpBO0tVtM1smGCfxzZYinwzHOtBrUzWxc/uu+oIjF4sGvrr7FnRInsI+JKeq5fNGrmXyjqXK27MRml5TVdLelbDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXIt2ABgLpncUUD9EjNCyX/nYVqzIDBnroP9W6LDzcc=;
 b=jgP5R028+OP+X6akR0muSLs/AkIfIARnEN2VHZtuWtSIuhUfl6l3+VoJyKf+QU/kDcIBdhfqOEVpCfM5tjbpqurTfjNfmdBJ07Xex5ORAIP9HTEXtRNrTLtoxRM6yfID7g5W0Xc5ZfW5hfiW+DeNAFdxXMWdrXVXCBVCrR2Vx1ejarX1hu3dgmjzB5E6uagm3U8XnnL3+UMILY1mBN32pxbuLBAYmMpBv90IPxbIrDoOwd87eiDyESjzvXsygiWmpSd3ojGdic5CeqqeYSxhtAoy/A7XfDTvoWXbwszgEr2Yn6cH6rLF5yoKeZBRb4deU/40J1pnZPV11rD2JUiBmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7729.namprd12.prod.outlook.com (2603:10b6:930:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 13:44:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:44:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 22:43:58 +0900
Message-Id: <DAQJZ0S13JFQ.MZK6YE6XK084@nvidia.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>
Subject: Re: [PATCH] rust: replace literals with constants in `clk::Hertz`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250618092810.29370-1-work@onurozkan.dev>
In-Reply-To: <20250618092810.29370-1-work@onurozkan.dev>
X-ClientProxiedBy: TY2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:404:e2::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 62aa489d-1a7a-45fe-7c8b-08ddaf3759ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rkd4VVVtay9TUk5UVkU3WXNsSndVQkJVMnVSOTdrMmdrQzVjbk0rd3dRRkQr?=
 =?utf-8?B?TTQ0U3NEYVV2MFpaS1F0ZlpVbU1BOUJ2YkRIekJYbldZaTJ1ZEtEU2kvb3kv?=
 =?utf-8?B?RVIySnVGOXRZd0dkc3FBdUJhQXBUejlDZlRvRlZjc0F4WkJzWkxDWThJYkJK?=
 =?utf-8?B?QS9QeHFFdmNlODJqamZoUnNGd1ErTEYyYUtRSWgzU1J1dURSYmNiTFNXVU1W?=
 =?utf-8?B?MWNFR2NGV0JWeUswK3g4RlNkSjF2WHc3dmdqcEFza3JIQ2FpMEZmRk91VHlB?=
 =?utf-8?B?R3VoeTkvR2VTS1JVZFhpazVtZ1M5cGVraVVWemNJc3hRdzRIa0J3ZFVsTXQy?=
 =?utf-8?B?dE9XUEd6ZW9MYmIvNzVsVGVURXR6Y2pDelhCdmNIMDhEdm5mWUZWM251cnFL?=
 =?utf-8?B?cWtVWE5rS2FJQ0JTY3loUGJnNENCOEhYVnRPRU04WVBzbW1WY05JTFBOc3Bo?=
 =?utf-8?B?d1RUdUxnbTg3YTAwamJrYktvSldhLzR5QnVvZHZOU3FwS2lYVjU2cHJQanMy?=
 =?utf-8?B?d2FUanNqQ09WNGp2WUlVWnpxSVlDMWkwdGRHNWtmZEZRaXZwUEdWRTBpY1NS?=
 =?utf-8?B?Z2lrYlEwYllzVDl3a1l3YWxzY2FlUXc0c3BOM1hGSVppb2E5eDlQQnoyM0hl?=
 =?utf-8?B?ZjRva1NsTng4akRtSmo2OU9oUnczK1Nxb1I5U2Z5WGJSaWkyd1RSSEQ3TmVK?=
 =?utf-8?B?Z05tcHBWYWdaZ05wNjl4Z0ZndDVFN052TlZEVjYvTkN1SU9NakhrUVl6TFg5?=
 =?utf-8?B?VTVsNnJYNVQvRE9hU2tpM0dFb0d4YklFLy9tSE0yREc1RVlZU09BL1EvdDRm?=
 =?utf-8?B?MWhnMW5aeStqOWxLbU1SNGMrQlEwV2tYMUJVUmtHKzY3d1lPWE15QjZjc3o1?=
 =?utf-8?B?dFVsbmI2UUlpNFp1R1R1d1piUExobS94dk1KdHVsdDBJRWx1MTFQMHNQMFM3?=
 =?utf-8?B?K0pyQjJrOW45ZEZtZFBqVGdUU3dPYXBMeU9kQm5CbXJkN1grYkVxdEg4UkMz?=
 =?utf-8?B?bWhkbFFBRWNZQnpLSXNiM0FxWGZhV1kzRENvTVpLK0NBRWFlaGRPaDVQU21U?=
 =?utf-8?B?RDhRdWhnUHY3ejdoSUs1dFAxK3hrdzVWaUdoeFhST3F2MkMwS0E3NXlQWU5X?=
 =?utf-8?B?UnJGcUsxZXNURHk5RGZTL0FjSTExNzJodHJDOG0xK0tUSXlBK0VHWVBnUkpH?=
 =?utf-8?B?WUI2N1B3RDZkYWpNdDN4bzhPNy9nbkxWaTI2YjVlV3RDNWtjU0JLZEpzK01i?=
 =?utf-8?B?YzNtZVNCemZudHdRWW5EVEd1bktyRkk2Y0JoK2VhSHllMndmS3huRGhkeVhH?=
 =?utf-8?B?T3g4Wm85UUhtOWpVQzY2aXBLckZqNVRKWkhIMUNyZHFiRmN4dGFmT1dnaUtQ?=
 =?utf-8?B?UHpFTHR1WlIxOStYbjdTSVk4cHNXT1d3VmE4ZlVuTzJhUHNLeUdjUi9oaXVT?=
 =?utf-8?B?RUVMSDlhYUhOa2JIbVVUY2tZNDMvcGRySmY4WFUzenluWmR5M3krTzNzanNG?=
 =?utf-8?B?Qjh4WHhMOVRHZ2hWaHdYSTRKRWpocmRDdXNmNUlJanROMjI0d3RyYUtNdkZG?=
 =?utf-8?B?MG10cmJjaGhhWWpjaFRORGtSbFpEellrNllpMkl5RkRTRUNSUWpmM2lBVlpL?=
 =?utf-8?B?MXFIdXFyWjk1dDJMVWNBTXpvVUNPOEwwT0RzWEFuRTNsUkE1aDY1V3lQV3BU?=
 =?utf-8?B?dnQxUGxjaU44cFdmaVFzR1BwYVhabHU3REcrdDVYY0gxMVlLRkpoZmRTSGVZ?=
 =?utf-8?B?Q1p0VXNzU1FGMVN1aVFMK1p4dlltamxVQlQrN2RTUjZaRkI2TUFMR1p0TzFF?=
 =?utf-8?B?dm8wU0RUV0QxVU9PbUsvYXBFOENPb1g2WEVqNzdad3N6aVNpZFRPM2tsZEJ1?=
 =?utf-8?B?RllJOUtCOGQvR1k1ZjE0OXVUb1c4V1pLZzVLUEpPKzFJMm1nUFNwd3k3Z054?=
 =?utf-8?Q?Tg/nN8C3m2c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9GWTlRVmJmSlp5c1JxS0pmYXkwZytGWDcwVUliZXJDK0E1cnJCVFhibG82?=
 =?utf-8?B?TkNEeUkrRFY1TmJxQ2s1SzhVTXArV2w3c3FENENiZG9NQXNOZDg1TXZYZXp0?=
 =?utf-8?B?VjFRQU1XTTRyajNSMVZmTzhQMlFtQUtnL0FDbFgydk5YdGkvTEZoVlhrRFdW?=
 =?utf-8?B?WGVFVHhmVW9MQWFWVDNIWnFCNm94aFZLZitWQTE0MVJUNTY2VGp0OGI0ZEds?=
 =?utf-8?B?RDBKYmZPc2Rvd3ZteVRxNFNyZEZOTlhiNzJvMEFjYUlIUkdIL3F4ODNkVllK?=
 =?utf-8?B?eW5UaVd0RFBFMHhvLzc4RkIrQ0NpWEZaeU05OHZkRlVYWGJUZ3dhN3VGRm5v?=
 =?utf-8?B?YlNTMEwzMW1zOGhzb1NYbWRMVWxOUU42NTZ0UmRmUVhiNi9pS0R1WmlveDEr?=
 =?utf-8?B?bXczdE1XUFRiZUxhNGUxMG1VZ3JwM0JBUkYyczRkQ3Uwa0RvMDFQV0NjZVpN?=
 =?utf-8?B?UkQ2NHlseHQ0TWRlbC8zbHFIajd1RkcvdHBjWWdqQ3lwaFM1MkFqaGtseGJy?=
 =?utf-8?B?OXM5THFpczd3NHBhTnZBbnV0bmNzKzZHLy9jMGVlaTltTUIzSnpaanJURDJ2?=
 =?utf-8?B?ZDNLcFN3d2ZJZEJwdmNLL1Q0SDlJcG10OUpkSnh2MThPNEN4Tis4M1ArV2Vj?=
 =?utf-8?B?WTNWSy9OeVFJN3hUOXNTNVFBdEpJUkRGUnhRSHNIVENDQUhaVSt6TlJqaFpV?=
 =?utf-8?B?WDNuMlA4MWZ5TnFNTEdONnVST0QwWFBTWkM4Vk5Cc2gzajdXZ3EyMWsxUnd0?=
 =?utf-8?B?UlJxU1ZlbDBVQ0NMMXhXN084amN0UXRQK2pldjU1bVc2RWlGOVk1NjVHd3ZM?=
 =?utf-8?B?TW8zMVdVTWJaSHdUNlZXZUVoWklmMUpxdkVlYlFkWnExcHZXUXF5SklVT1hx?=
 =?utf-8?B?T3EybzVIUlNRdkxIOE5wOHlLVU9tZkJIbW9WY1NjR0Q1YkZjRytEK0ZsdE0y?=
 =?utf-8?B?MW5UQ0RONVdsdGlYV3VNaWJnR3F3WDRMdG1FM2tGVjg3WS9JUnRKS0NkUDNn?=
 =?utf-8?B?UzFNOGJZOWRJdllWeTBsV0JVazg5a01YUUNGaVZqSXZ2VmswQjR2MzRnZXM3?=
 =?utf-8?B?enV5YldkQmdmUWc5T1IwV1lWQW5mY3h6cklHcFVqZmZUWDVWekl6UythRVhp?=
 =?utf-8?B?T1U1QVorenVWd3pPQ2pxekpTNzdaLyt6NUd5ek1yQ1U2bU5RRjNWWHcvdmNy?=
 =?utf-8?B?MVRQTmx6UVRtalIrbHlVMjlaaW9XQVM4cnlHb2ZTcVhTNW9MbDlPbnluWXJi?=
 =?utf-8?B?WGszZklwK0h5c2dQUnYyeWh4VkZZZUNiNkl0Q0Nwb0VPcDU2MjJRUkRXaXhi?=
 =?utf-8?B?dzB5cXdNUFVDSkZXZkRTcmRRdlhrQy9CWGN0NSsvYi9BR0pXaW1RTUtMVUVp?=
 =?utf-8?B?ZUFhczdCcDVzUmp2dHltZnExZlpsMGp0WXJ2T2dpTHVERk5IQ0F2aURxbE9D?=
 =?utf-8?B?emxYa2pNYWZGdUJkWndtODJ3WDRFSHliRUozSEdobzJ3U2N4WVZkcmtSTzFn?=
 =?utf-8?B?KzlBSEYwNk1yaGVvYjZFME9ieGtQSlJEVitraXFaVWtmYWpTOVMvYWdBM1JF?=
 =?utf-8?B?cUV3RUZqVjFRai9idzU3Q3pKblF3RkZIMURUZ0Y1THdsWk1sdnRRalAwZTl4?=
 =?utf-8?B?TE9kY2d4UTA1OWpqbFV5dDF5UDJ1ZzRUZjI0SUppUDRNU3RSTDJGM3QzTGo0?=
 =?utf-8?B?VktpcnF0SEVYWDBGd2F4Y3VPalRVaXpMdlNSVWZHYkY0aUQxNGxGZFVDN1VL?=
 =?utf-8?B?MXpPaUZROXVCK1NBL24ra09PYXdFMm1kaE9ONkVTQnFPMm5GRXlyTUFPS3V6?=
 =?utf-8?B?cDhwaTFSbmx5Y3QxNklKR1pRQXNxYU9wd3dEb0JENWlXSzdNVHR0OEY4SUlW?=
 =?utf-8?B?YjFvUHVjNEpzQ2JHSi9vL3dIUVZRNElCMzA3MEpvMHZJL3VTd2hSaTdTSVZP?=
 =?utf-8?B?cFNScXhaWG5jS1R6Y2RiV1dBNVVqVFk1anAxYlllS25LOE5aWGZmS29Ob0pH?=
 =?utf-8?B?enl4RVZ2ajY5bmtocFljTzdTYWkweXlsRERQN3htenZZdFE0bnlucjNMRXZQ?=
 =?utf-8?B?YTlsNUZCVW1rci9PTUlUWGxQdGZrR2dneXIyYlNNNDBvdEVFdDNDT3V3NXd0?=
 =?utf-8?B?NmpORnVPemwwUnMybDZvRFUxeXlGOHFpUURUSGNzWUpnalRjNDlzTUNDcGE1?=
 =?utf-8?Q?53d/OAr2yD5VvkPmzYFI7STtmLjqmJi0HSUHRnn+oZFu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62aa489d-1a7a-45fe-7c8b-08ddaf3759ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:44:02.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lxF2zFWr2TMnvxi16PIozQPlPe8IoXPauTcjYeVIXDwT0IFGOxEP+1eemWMYJFhghFzL9ToiC2tUK3nU1hTEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7729

On Wed Jun 18, 2025 at 6:28 PM JST, Onur =C3=96zkan wrote:
> Replaces repeated numeric literals in `Hertz` conversions
> with named constants.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

