Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2089.outbound.protection.outlook.com [40.107.101.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC531E5B81;
	Sat,  5 Apr 2025 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743861067; cv=fail; b=ArBSL6PDiGSVhcp4J06Kkgp/s5Q8l3WvOf5qa5zObT7xizCcS0YmBTXeuZt/x4+ddz573SMYmMZcLwx/sFOfmQB6i9zGPdoou59eH4z0dxyT9DU/UyOwroSekrmZgdBVQFlrY+rzsXdsaTH0OVz/AiGeiN0APdgxj8CZmNFeFq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743861067; c=relaxed/simple;
	bh=gm0sKRRDe8jz9nqqF+OuVSeDJHutCSTQoBQyvn2ZDxY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=UkBzun9yzgAR1la3A06Lyzz+d830VXVizgHJOYSddCbmn7LQejyr4M2nDQTGoXbCKDKtgdflHtin3yG38LbtGwx7ilvOoG+tPaVSj1Hfb3gE3rphE49Tf+CQ9g9Nole5MyDZ9TEWsji5DplM4mQCgiRPGmGa/aev9oxhgMPMOLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sw8kjN/a; arc=fail smtp.client-ip=40.107.101.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sw8kjN/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sl8sZ9I2kmfsH5Mpr7D9RZoGtrE/p3rGRLNz7x9edRqsM+i7PLLj7Y0f4qMH2BrH+XuWN6O0DqW24R5LmzfOM6CkJ+6GmzX4VllUyk5jp+L3hVjdPs/xDA5VrStZXm19NdWoZh7+cX5pYLZ3Q4RGsJd6FkmhELG+k2PB8K7P9+jWH5uqrnEillUYi2EZB/kza1C4N4C5yPIdfeWF4cMx4Aahpjj9hunIqSaEaHyaXWPRvMzB4UZvgVxpaSUMRaQaarQypBKaV91qLTM2F2Q+QtjYW53PdtSTSiIDQNf2jXN1rvKG4TmRFewJYMT/UDXniYIi7ubQ1ODS9ToIpLyfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm0sKRRDe8jz9nqqF+OuVSeDJHutCSTQoBQyvn2ZDxY=;
 b=TQXJb7bYK5+LLrzfL8yVc9VUEII23ZEcpCq+QIA280sA2D6LDsT+uoDxfbDacbIjRmuKpcLYA2hJDY74NFENsPbZcycfHl6fpqGQuR40Hy42SaGKtaXWiG9qQh9d0N7EPZH9G3IqcvDNSa1e41TlHXjo2SRVRf8ecJJIkKHk+2dHbYcvV53nSMukRCR9EjTi6sRw52nRlWG7YtKxnS+GvBrL/KhWr5NqO8VCkqW1tXfVhnpcQZD4h9zMV7YaGG1M7a7abnTDflW4slRsP7EFSBxwW2b4K02TRFWCxHdTIcJSBk/hLAwMD+2jQImWdlVmQoxu02LeYwKoT3HT0zRcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm0sKRRDe8jz9nqqF+OuVSeDJHutCSTQoBQyvn2ZDxY=;
 b=Sw8kjN/a+xp4+qers5i7qfzcFlHbiNPyl8ox2DHMNzt+tT/V3VkpfFLgxAfOcON3xNyXjo6QQkimbhhlhQIF9mYGNAazyD4IFAxz0jCkdEkyLsEOG3NRSzeeoi7rxhdyd4BrWeEj/Apbn6V+cHoeJ+7VTXpe1Svse/nuBX5cj4S2h+1velzdylf0DFzqKVULaKdiT9APaYkcoyx+b+vZHGNuetFK/BPTfRryzeoMctPoj1Psv+dtJrP5tVf41a5reh0VtJJ8iTXvRicggDsfMxC6rQSr6Stkiszl6s6ddaN8thb6dD7vh2Nvz4Vh0w8lcBodMDFmHH1l0R4m3QLWVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Sat, 5 Apr
 2025 13:51:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8606.027; Sat, 5 Apr 2025
 13:51:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Apr 2025 22:51:00 +0900
Message-Id: <D8YR5JN9RZY0.3S26QBYXWDIK5@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: implement `extend` for `Vec`
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250405-vec_extend-v1-1-bb7d19b47adc@nvidia.com>
In-Reply-To: <20250405-vec_extend-v1-1-bb7d19b47adc@nvidia.com>
X-ClientProxiedBy: OSTP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:216::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 1641de5e-74a2-43af-23cb-08dd7448e7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0x2QU9lNVQ4SStwS1JpN3JvV3VTQklaaXhtcXdGYis2N2lwVys4cTd3U0lj?=
 =?utf-8?B?RlNZdW9JNHBGRmZaYTV4a1VUZGhnRDljUWZJSjlNYnlTQWtrTnFyOEtiM3Zm?=
 =?utf-8?B?K2J3VXFVbVlOaEwrMVFEc1pQT2xScTRGb0ppNmJYVnpDVWE2Tk9oN3BDTjFu?=
 =?utf-8?B?eUJBektuRVhuNzJnN3BPaDhwamo2aVQ2NU9MNUJLTlBCOVdwOXpLVUpYdXk4?=
 =?utf-8?B?Q0J1U21qU3dPRXZ6UEN3S3VXNzA2WENRYzFjSVE4RjlET09hK3UyVjZDeGkv?=
 =?utf-8?B?V05ncUkvY2dTQWhyenFwSHUwOGtNb1FCL3ZkQmtja2loRk1pZDA5U1hGL3c2?=
 =?utf-8?B?MkQzYm41MWlpdFZJaUM4a0ZLS3B3RXNTM1BCZmx5Z2Ntd3NOLzJzSmo2cmNv?=
 =?utf-8?B?Tnp5eTQxNGp1RFNYNlpPb0loWnZiUzc5QVNMa2Vsdi94a0FnT09Gejl6SVA3?=
 =?utf-8?B?MkZqRzZlYUYxanpsRlJPdGtqM2g5MzdESGFlckJKQ3VDS1N6cDh1VlBpcFcw?=
 =?utf-8?B?dG9JZ2c2Qlk4YjBOSjM0d3lSL2ZIR1RXeGJlUkdKcHZXa1JzeHJaeWpEeXZY?=
 =?utf-8?B?SCtzYWRuQlRaTDByM01KWFlGU2lwL2loNUFTd1A4emVrcUVIaTEwbzFpUXd0?=
 =?utf-8?B?bmduWjFocGVTdFhBV1RGcnhWM2JLY1BrZnR5Z1ZXcGE2TWkwSzBtOWNYbXhK?=
 =?utf-8?B?WEVWSitJK0lTQUlyeUpKUkUzSytKREZsRFlHRlI3a2dlenVqY2NiVE0zcWx4?=
 =?utf-8?B?SXF0eTYvMVdlVFRMMUJOeENsVFcvVHRWSkdHOGx2dGZNY3pqTy84M0VkK0U5?=
 =?utf-8?B?Q1VGejVOK1ozS3pITkhOSVdNWnR1YUt4bEFSMWZTbDAxeEFNUjFQNjMzU0hk?=
 =?utf-8?B?dVVEYWxDQTNNVDlyS0dGQXVYTEk1Q2I5cTZmemt6UHZSTjZ2UE9ZQmM2U0or?=
 =?utf-8?B?Yk4yVlpLbDV1R2prQWdUSkI3V1BTREpLM3k3di9vT0NQblVoU3hwcjZva01F?=
 =?utf-8?B?TldLVDlYZUViSUg0M0pCRklqNm1vQjdUVnlGQ1JXU1BjQWhnUnFrdzE0Umov?=
 =?utf-8?B?SDRyWDh2WnpwN0tGdEVsNGp1V1BKNzl0Znl2L3hhK05MSUY3cG02emh4L1Fx?=
 =?utf-8?B?cWJqazZWUFJldi82S1AzOU5EaHBVSkxYcjk5L0hWWkQ3SmtYOFBKaW5HZ2Zl?=
 =?utf-8?B?RkViYnBRZkJJUkFXb0ZQUktPTDZTcDlvRkU0ckd3eEF6MmpZYTBLT29GWmNG?=
 =?utf-8?B?aTU3TmdhT09nSDRhcncwZ3p2THRZTDhXdDlwcytEK1V4a1kyTDZ4aVRCczAz?=
 =?utf-8?B?bUFhcDE0b0lhVlB3dnlVQzBpWnBlQlp3dXhJdWVUUlNPcGI2VHFMUnZnRUxB?=
 =?utf-8?B?M1ZYVG1aWlpURXoxZ3R0aitaRzh6TG8vT29mdWg0R1dvVEl5R1FyK1NrazRx?=
 =?utf-8?B?RUVWSU5lamxGLzd6dzRyK3ZKemdQZjQwWmNqM1M0UVNmQVBYNkNoS1E3aWo4?=
 =?utf-8?B?eVNzZ0NLVzR2VVNMNmRyMXA3SVcvVVFoRnN4RCtvNCtBMEczeDFXN1MrZkcy?=
 =?utf-8?B?ZHh0bThLd1YyYm5iVTVSRUg4bzkyMUg3ancyTlNiRUxvQWZFMFZFMnN0U1o4?=
 =?utf-8?B?eCtTWTlxZ21sc28xZUVSbDl0SUxtdlpPMGVUaGpKSGlIb2doMkFCNFhSOFVJ?=
 =?utf-8?B?dHZQOFVFQTVrTFRseUl0Zm8wdzc5K2R0N3Fva0w2U2lIQ0k1TkIrTFc3UGVT?=
 =?utf-8?B?ZUcwQlJuZXlQRTB5SVlxOVZxcFVlVkV4SldRWDdZS3g1NzVVcDFtUVEvbnNw?=
 =?utf-8?B?SDh2T3BwTkYycUF2N2pJMEZrc2x2dElCenluNDVLS0l6R3VDRWk4MHQ2WG8z?=
 =?utf-8?B?K3M2TlJUa3I5TnY1TEpqaytHWUd6TlJZamdaMUdsSEo0c3ZmZkVEajRzVEY0?=
 =?utf-8?Q?azHCd4cNVJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhpamFmSmdhRmpScDAyeUpJUTdEMEx4MzlzcCt3TzlKVGQwT2ROK1dkMERm?=
 =?utf-8?B?VEJkUnl6NkhqV2kzelhTRk43c0ZVMDZZa1JsbXlrcjdWZnhQT2M2S0I5Tkh1?=
 =?utf-8?B?VFBoaldyamRucmFpMEZrWjdydS8wbDk3UHlUWldRU0ZucDFwMTRENHI2RVlM?=
 =?utf-8?B?WEMvQUlYUVlzOXQrdUljejV5QkhrYVJkNGluOXVwNzBmZ214ZEttZVJUaEFH?=
 =?utf-8?B?K0ZydmI5eG5jbmd4MVBlbzhsRHByTG9hNnlMMStiMEwvREE1RzFJYkFlNUNk?=
 =?utf-8?B?RDdjak10VXhXc2dPR1B5QWdIbWNmNnpZNEhxam1CUEF5OExKTEViWEw2aWRT?=
 =?utf-8?B?L2xFZjYxNitZeDduNkdnNzdnSnBLTy9Zd0F4MjVzalcreSsrZ0E1Um9xeFp5?=
 =?utf-8?B?ZVpnWkREdVZVNkVYYmZSbktJNHlhaXFUNTVCMHdyaVptZEZtY0Jxb2ZmMkE1?=
 =?utf-8?B?MXVHaDJjTzNUVk15WkNyV2NkSDdjZXdQY1pNK0FFK0E0YzBWVUpzdEM2TVI0?=
 =?utf-8?B?RlpIU1FWaTdlN0E0KzhBckNaMjYrKzBqRlpvWC9rRksrUlhOd3huMy9hY0lL?=
 =?utf-8?B?akRTS0QwZU9wRTRoSjhFcUdRU1lhU0lnR2xmVkhUZzl3cUlpSlNjWDZMYlZN?=
 =?utf-8?B?QkJpRGJWaDlTUWRMRm1GYnpyYUp0TFpHSkVVd0EvVWx6dkx0eXdXRmRicERS?=
 =?utf-8?B?N0t2VXpERFROTFIvRm5aMXRNdE1WaEtrTWpVNzJaaWNQOG1yNU9Db1ptWTBh?=
 =?utf-8?B?THpobk5OS05NY2QvYWdZM25NTmQxUTZ4anlrMGc1TlZ5TTYrb01HQVhBMDNp?=
 =?utf-8?B?RllHaUNudnBBQVdBcDc1SDFselFwaFV4SHBna0VndlhzY1hjK1pnaHlIbFdU?=
 =?utf-8?B?N0ZEa1ozOVIyNWR4cHhReUZzb01iMURmY1J0a0ZvT2J3M1pVMmpQbkd0VXNt?=
 =?utf-8?B?Yjk3U3ZZeWR6QldKYWQ1WVIzSEVZNDRjSW1QT0JBbVI2cnJYVmtWMHlXdG8y?=
 =?utf-8?B?Wi9ZUklQOGZzTjVlSnBPVW1qVjRWeGJBZ05pM3Vrc2ZkMkZhdnJVWVpaSWNO?=
 =?utf-8?B?cFJCOGFwdVNsc1p5N1luaTlQc2ZJb3R6NFIwWVNTaDFycU5mVGErYnlPSGtW?=
 =?utf-8?B?bXVBNjJIVnhWOGZOVE4xeXowWWlhNGRRc29Gc2RVcUV0bDVJK1NQR1VOZHpt?=
 =?utf-8?B?WnlkSExhWEIrbWI1eHU1dVF1aWtSSWpNb2U3UC8xVG5rU1VWL3VZRFNldWRG?=
 =?utf-8?B?NjBEOCtQSEtlc2FWWVRNVjBLVXhOaHJCdlMxUjJEZmIvbjBhejV5RWl0K1pQ?=
 =?utf-8?B?aHFQVFZBUisxKzIyZEQ2MWxFK2R2dE9jcm8xYVpsSXIvSFNnV2EwaVdySDV3?=
 =?utf-8?B?SFVWa0tLdmltbUc3cTc2bWhnRWdoUVhnMUlJeDkrUVJGdEoweTY0dDY2M0dh?=
 =?utf-8?B?OHJuU1I4SEFUQjg1cFphK29BQkJjNXRIOUYwOC81WnMyWWRuTGlqdFZhbVZq?=
 =?utf-8?B?d3RSOFhPV1Jqdk13Ky93RzJVdkk0Tm5xOXJiL2NQWW5iM0dMd3ZwNkhtUnZV?=
 =?utf-8?B?c2dTMUJVVFdPdlJjNHVXd2c4NTY1YUNuamhKNGMyd01neDB3N2hwNkx0ZXRY?=
 =?utf-8?B?eWI4dlRuaDhSYkM0Rkh5eGdXUTJoTXVBRjNhQmNUOTY2RmlFSVZ2STVHeWlP?=
 =?utf-8?B?QVZmY1liMFkzRDRSdSsvYVhGOVEvREo5cWgzUEF1d2JsUi9KREhGRjg1QTVU?=
 =?utf-8?B?bmhOaEdyVDF4Sy9ESGMxa0hyS2tGRkVSU3dGTFBaY1o0ZUF1Sk85ZUh6NFJx?=
 =?utf-8?B?eTRDNmFZTVoxb2g3SG1EV2tNQzJXWUxLbDFQOGZhcm43VWRQWGVLV0xKMXlZ?=
 =?utf-8?B?c2MrLzRWbXZOMWdLeHJmUW1JRUdmQk5wQUxsejUzNkphaXlJL1d0MUJ3RU9Q?=
 =?utf-8?B?QWplS0luSXhEWGFnZ3h1VWVrOE9LandxM2JTSkN1RnNnQmd0U0ZYR2dTVDVP?=
 =?utf-8?B?dm5BUFRaWEZEVGs2K0hwVEc1ellpSmhYVVBrcGUvZENzZ2FkYmo4SENPRVhR?=
 =?utf-8?B?MkcvRGsxZTJKb3Fabnd6V3J1aU44Mk93TkkvZ0k1MmFNdUQ1SEdEb045ZlNz?=
 =?utf-8?B?Umlhem8zdkowUHFUUFRiaGN0c3F3b1NDN0RuWmk1K1NqcU1ueEJQUEM0VFla?=
 =?utf-8?Q?sSY+iu6w53A6tTyqo5GagainhKDC57EMjzBuXDdWvSsu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1641de5e-74a2-43af-23cb-08dd7448e7ff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:51:03.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EIw85Nyjo5J6+bzv3lO86IkecMGLEVVn7Por17OmeV7pXY85yJx4sGk1jcGPTWGe+xO0lFq0eM+jjnx7Gvwzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496

On Sat Apr 5, 2025 at 10:26 PM JST, Alexandre Courbot wrote:
> KVec currently has `extend_with` and `extend_from_slice` methods, but no
> way extend a vector from a regular iterator as provided by the `Extend`
> trait.
>
> Due to the need to provide the GFP flags, `Extend` cannot be implemented
> directly, so simply define a homonymous method that takes an extra
> `flags` argument.
>
> The aforementioned `extend_with` and `extend_from_slice` can then be
> reimplemented as direct invocations of this new method - maybe they can
> eventually be removed.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Argh, I did not notice that the code in the diff was no needlessly
intermingled. Let me change the diff algorithm and send a more readable
version.
