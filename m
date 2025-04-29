Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B947326B2B2;
	Tue, 29 Apr 2025 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958497; cv=fail; b=VXfXfeypb037CObKSH16/AeKw5CHToYPYr1EbKEe2pbm5pgF7KTKtjYD2OGy2zKq4/kCGHdGn0qD603sMQHKgS+87sp+mXRHVxcJFFXGZhcKTsiM93DJ2wXdYA82SiWnJQUG9BKr159zwpt2ubj4C9gDthciaNl+wY0OoKDwAng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958497; c=relaxed/simple;
	bh=OIbjxSrZzlxLjJW9p9wYdekUshsuNJSwNU1zkrOjM04=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H43EAAUFY7hTwc1fxrQXTis2majV+bt+tOF1J7TOHJ581Exi95CwAs3Kax6QIBl/P8Cq5Qy9RIQ1S6eTmaze0R2B0ox9G78v7hPR5X0belsCmY+qU1ZIWSjuVGdrBWNy3Xk6cJGxylVWDgMz27zEp70fLKHoSKZ/eE//L78bphk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ROQXXRTM; arc=fail smtp.client-ip=40.107.244.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ROQXXRTM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scuBpI0fjQGlUTkbVyz+QjfXJ7/LCcQEFT2mGSjnpoMEjOQPHitd0YyoqVf6VGlr6aK7J18nMB+NLkAE+7z1bngGjsb0j3U2ejuBJVaztCzZTJvdmNZAfFtU7HhkXm4uOM+145DHj6fGkC14ceOUX6v/tCj8LH5no2IfklBu95g4Y72Qf6vPMgddxxHhLih+YqcZp0YpXEeV6kkQl3pHCsicwdzD6ok6sNzC7m42SnLOKZYLkY78lIbG9hqrSPtjPOyOqayvJ38sz+AGQjwMYYIzO1JAfoPS02NDeTbj8GWt2Q/i28gn6+OWO3ivAcHCie5CkHi1j956EWby7od3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/K28B4DheQRwTXkFQKK/m3YKYf8bX1jjwS7i5dneC4=;
 b=FeDl16nEGJgxQDOdtvLCxPjkqezBrY6KmJ/QpEdsCBeq4OzGSZiTgQHGKTxoojpAZ2NuQpXSA6Uh7WO69jjUteXyKq0fkllKLHLG4jLHyQq0M9trXvn9xDDYnQSbzj9Nva3i+TqEXJnZFvjrfsLfcfqNvew2TqUvooMC3ycGcT83PIMvLumfQXdKhkDQFlc8R+BDy25KLi+6w4+ArcerKBJncSD2ChRcdPCNK1783HmqZ6mji51pDlddBGoOfZBAxRSGrhvvbrjYNqtGILvMrLt5KesUb8UkiGCfSw5Jdv3bBF+W2q7JNWF02C1cPbwg4ys7FHMHXHEHq9QmCwxWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/K28B4DheQRwTXkFQKK/m3YKYf8bX1jjwS7i5dneC4=;
 b=ROQXXRTMKb1WCQK1HkIBrw/JqEj6xmAqt9KGAkRkLBqfZ0SXuQmym748Ru9EP7hwY9pXiXyzSYnB3GcS9SutDFac8YriL0XosnDuXLJYgMFL7jIhFoP88tiH8QWT3jXQtAEet8bbnAR3uAMmeyE68FnbehjUYVTX6j56ouGa1jf1pVt39wFNowhJnEUJVq3ig2ujh0m/Gl/QCOja7mo5eyYP6e9MGMBPy9rWA0rShflv89taFpu+19w+9iBw1eKELGqMgdDyiICMNPrta2dYNCNXyv7RF25FOv5XDRlYC2cj7opDsYQhF46RcKqVrZB1ydouJ9oRmELmTac45lub2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.35; Tue, 29 Apr
 2025 20:28:12 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 20:28:12 +0000
Message-ID: <0ac7cfba-6b69-439e-a9ee-1175ca8d0913@nvidia.com>
Date: Tue, 29 Apr 2025 13:28:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
To: Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com>
 <68110cce.c80a0220.3b03fb.43d0@mx.google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <68110cce.c80a0220.3b03fb.43d0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::29) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CH2PR12MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: e32ce9db-f372-4cfd-918b-08dd875c5ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2dsUkNWeHdXK01oUVR5REEveWY1VC9Eb0pFbUpGNG5Sdk0rWklpQXhoZlk3?=
 =?utf-8?B?aEFvVzFRMzlhRlFYdkY1dG9NRmZqRTNhbCtEcmhhWlJjbnZwRlNMUzZSK1hs?=
 =?utf-8?B?a3dlNmEyckJETVFLMnR6Q2Nuak1SZGpFdWtWaHlRMlNNQzh2YlRXL3BaLzY3?=
 =?utf-8?B?Nnkvd0FJRHpvaEpnY0wyRzd3Q0xITDVjdTc3WEI5TzdsQnBjQUhvMnR2TXVh?=
 =?utf-8?B?blc3Y0pUampFTklzTUplREtLWnRhakFjNm5hV0F2TG1zRjJMdlNwZUZxM2lw?=
 =?utf-8?B?Yzl6YnZIcTlIbFFFTFZMc1dSd2JVcnpKb2tTN011R0Uxc0VESk56LzlIZDZu?=
 =?utf-8?B?WFNkVzhzOVN3d21oSFR1TkRHTDZFaXRaSWE5emJIMGpvSEpycWdsOGk3SENa?=
 =?utf-8?B?QmY0TzZkY1Vlbml0cENmRFpXNnBJNFZIL2tnakprLzRwSzFHQW1QcHVRSzB3?=
 =?utf-8?B?NFhiTDhwem5LbytGU01LZGs1R2g3WC9tbkdPSmRJMVhZQkpMc1lKM2VLSU1J?=
 =?utf-8?B?VDZ0c216dm5PYVQ4NFZMWkt3bjJEWmJESFUwL2RXMHp6WkNsWlpIQW1MeE1L?=
 =?utf-8?B?RXZYNUxKV3ZxdklDZGRTVUtuU0VXQ0h5LzBCQk0vZEtHdDZGM1pEWTMrd2Rs?=
 =?utf-8?B?WEtMNFQ5Mk40SzZLNHlRem42NVZma3RneUtaenlHV3RoSEdEWGVSeGkzSVlt?=
 =?utf-8?B?ZFQ5ZFNzdnVOM2l6R1FWWUwvRkNvVVNRL1NRSDRPOFJLVGcvUTdDZXFJYWg5?=
 =?utf-8?B?MDF1bmNPdlQ5NnNtYzQxWFdGckJBejBTNkVtODJ0d3psbko0bXZncSs1aXhk?=
 =?utf-8?B?U1lKVjVCL3Jxd2hOaGpzVWE4TVFqTDF1ZTMrQ3JWaEhqaDdzN3FkVFJiMUV6?=
 =?utf-8?B?SzJrMDJCWWtDZ095QVpGbGtZWEZ5dDVkYS8rdlROb0FuamtaRmNKZElwL2VD?=
 =?utf-8?B?ZXdjTDRVbWpmVFd0b25VTmdpRXRlTmg3MzlGQnFBQjVEZ1o4L3ZMeWxkdlJU?=
 =?utf-8?B?ZzRXWTViYUJlZ0FHbml3d01jZkJXNDJIL2g1MVdoaldHWXRDM1NEOEUySFZP?=
 =?utf-8?B?RUZ6ZWR4MmNUcWc4U2tjNWZnNVI0ejlMUTFXUExRMG94Z0tZNjVRZVhpNDVD?=
 =?utf-8?B?NnhuUjFQZlVjTTR4bXM1M25pNGlzdEUvWndjSDhIVnFpQ3dXVm9iL3lIZksr?=
 =?utf-8?B?c1FnMTJKMGloaVFTN3QvQ2d1cTdoamhTUjhJSGhyUVQ1MDVpc3VNV2s2ZE01?=
 =?utf-8?B?QU01WTZiOVZjeE80S2FWMlRnU3JqM2V1Z0hjNDVxOHllVkJkS0JqOGVYcTht?=
 =?utf-8?B?MGxoMTRyVkE0VERrNnVIYmZjS252cm5ibDJwZ01XbUdNaXAzdEh5aFhwamdV?=
 =?utf-8?B?ZUtHUHZOTFovby9nZEwxMWtMblUxMWZKM2RIaEtjQStkbFFyZ2V5UkVvYTZO?=
 =?utf-8?B?RjhDUmduMWN0NlVxdm55OUtuWUt4V0Rpc0FGcFhNK1kyb2NsdnIyUXExS3pw?=
 =?utf-8?B?Y0F4WEVVb1R4NHBSQW9IYysrdjdiRzFHOTd3WWNpb0tudVUwTHNGU2pXL05j?=
 =?utf-8?B?NWRvZXpiM3ozZCtrZklVTHk1OVdyL0p2bitxclFiVUZvMFZTMDUya2R4YTlG?=
 =?utf-8?B?NE1RenZFeHNwSHJUZkFPYlEvQmJ3bllSK1dLVUI4NXJwZWJEejNSK0psdXFT?=
 =?utf-8?B?aDROaEdZN3ZBRHY2VWVMbkZFcWtkaUFyNGxkTWNrM216eHhjc3lOVnQ0SjZE?=
 =?utf-8?B?TFZnTWFaM1Q2dmV0WWJsc2kydHhRN1JWZ1dza1dLdU5LaWloZ25EMjFSaWNW?=
 =?utf-8?B?bUYxdE1DdkhzdVNvMUxMZmtKRlJ0NFl6aENucVk2VmpDYXZZYStQRzZML1ZK?=
 =?utf-8?B?LzJGcysvQkZ3WExqSU56MFRPYzZEbU9jV2FmZ3FNSlpTcVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWtMcldxUFFvS3ZPVVVZR1NsQUhqZEdhcWlWTkw2RWdPYjB4TFJYUHVIRUxS?=
 =?utf-8?B?eXFRRE5hTXpkclk3WmxmMitGN25xbkM3a1Z1WEhyVWowVEVBUUgwcnRLb2ZE?=
 =?utf-8?B?VitSbVZ4OUoxUnQxRmltWFNMN0ZQWjBPRSthZjFqNHZBZ1RvWkxGU2ZZQUFI?=
 =?utf-8?B?RmFtMk0vM1NINktJM2JiY3Z6cXJTT0kwS1RZam9pQTdraEhRdWpoN3BIVHI4?=
 =?utf-8?B?dHQ4V1NGdjJCY3NDVG0wVGRpRGlRNm13VlJIMlNuQmx2b0xjTXRqelU0RmJs?=
 =?utf-8?B?TmFJa3ZWSlZOQ0xsUzY5MVBIV0tYeGx5Q3pSSVE4aU40cDd2NWlzMEJTcnNv?=
 =?utf-8?B?ZGplSWxzaDFNYUlCU014VjBUYTN3dWNpb2lzbHFFODRBREMyemg5Z2NOSjl1?=
 =?utf-8?B?cWM1bml2NHJuSEZjb3N5MmRsSDJmSmhBbTlNOWk1Y2Uxc1RlSFZNNkJRQWdB?=
 =?utf-8?B?R2NLcUpqbGg2Y3JGVFR0Z2ZjNUlLb250NVMrNUlhc3Ftd2s5UnphN0NXRjZ4?=
 =?utf-8?B?T2JwZC95Q2JMbDJyMUwrSmp6TndlUzBiYVBsam1pZi9Kc2VCZm41RXVpbzhh?=
 =?utf-8?B?VU5XT1BucFcxc3hXS08vY3lOaGhOY2puRXhUYWxWNlpXTFM3cEpoL0NWaEpn?=
 =?utf-8?B?UXhjcUNncmxxM29lNGtuWDBwU3o4bmFJS1FqSHFVcit1OFFRSlJmYjZNc2RL?=
 =?utf-8?B?MFAyb0EwUVhPMG9ucWRPME9JUExURUlkbU56aXBqSXRZcWdySXI5VWFwWHZu?=
 =?utf-8?B?TmhtWkxYMnhwVVJLUlZvc0FSdTVFNDdac1BGT3JSS21PQWtyM09RUmNXU1VK?=
 =?utf-8?B?Uno5RG9zRTdINndEdXU3cUFlV1JKY3ZtOXJxNXl2eks2Mmdod1dPZ01CbCtM?=
 =?utf-8?B?ZS9HZXRlZ2xpbUMzbU1OQ2hDb0g4REpzcG1QNVc0bk4zdXJnemh0THFjLzQv?=
 =?utf-8?B?Mks0SjVYT0h4aTBzc3RGWVUxZjVCaDlGQ2ZCS3BlWHpSaXpWY2tQWExSdG9C?=
 =?utf-8?B?ekxDRC9TVmg0WWEvYXZERkhpUlhreHYzUVUxN0JmekJUQkR6a1dWK2F5QjN2?=
 =?utf-8?B?aUtjUW5iUjdhZCszUmx5OEFWZEF0M1Y2TGpGME11ZTYzZkQ4Wi91MVBaVVdU?=
 =?utf-8?B?VUx5UzhNd2g4MDBuOHowQ05GdGFoZ1hUVUFqYW1CT0g2VkNjRGsySjBaa3c2?=
 =?utf-8?B?dFJueHcveUpvMmRucU9ZaE10UWlhTG5SbGkvVmRqTjBMRVRkcjIxdWFTMHUr?=
 =?utf-8?B?WkxFYlJIdThmNm1neXZkUmcrcUpmRUc5Z2U4S3dZbkxLa3Y4a3Z5Ukt2QlZy?=
 =?utf-8?B?TEM4UjZKbGRmTk5tYk85SWJ4eW9DOVg5T1BnbjR2bVJBNkppWk8vWjZVSjcx?=
 =?utf-8?B?MXNibzVreURtSGNuUXh6TmN0NjlsN2xCYzQrdEVjT1lsTVlkaXdzNWVPWlJJ?=
 =?utf-8?B?QXZJK2pRZnFXdGVlTVQ2Q0ZwOTN1VVFCRFFucUc2VUNIZkFRNTQzc3JkSWUz?=
 =?utf-8?B?d3ZBNXJRVXdwQVlROGM1eWtUTUtTbDRPZ0RFdXhMNmUxQmpRNis3UlVGazgy?=
 =?utf-8?B?NVY2bkUvNmQvdzhMT09QcEtlMXQrdkthWGx5a3FFTkFCVW1IaitqK25vd0dF?=
 =?utf-8?B?N2dRcnBXN210UW85Q3l1cnhxaFN1SjJBQmFKejhXK2FqMkdIVWxTVDBQa2xl?=
 =?utf-8?B?Tys5TDFscFpFMHNDUHliclFsU2kzR0xXMG1ZQXRsVTZONXRMN1RmcUVtUXJY?=
 =?utf-8?B?WEFVeGpxcEwydGNGOTRJRWZNcGVEY2NWTmJkYjM3cTJWRWxlTlhUV2g2TXhP?=
 =?utf-8?B?YUtScUoyaG1UU3VpMkNTUWxMSGVGRitCT25LTGpPb0JrOHRWaVRLUzJUSkU0?=
 =?utf-8?B?QXlzb1N0WFpIYTg3ck5vTTBwbUpoYStOVG15bWhlZ2p0bmRzTG9IdVVlZ0JW?=
 =?utf-8?B?cjB1QXpzMUNQenZON0t2ZVFaK3hKbC9VU014RXRQVjFOeWF0S3drcEwyNnV2?=
 =?utf-8?B?TGp5dytybFNqVHVLOG90cTJvZldnbUJGUk9DbnA1WVdnVWJ1cTc3SDdYUG0x?=
 =?utf-8?B?UGZEMVlob0gybGRpOGt6ZDB2R0FnWkIwV1J6NU1mZHh6RS9ZMzl5d3dQZWhX?=
 =?utf-8?Q?dlNXm8wMiapdwqtYRWuRWt7KZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32ce9db-f372-4cfd-918b-08dd875c5ce4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 20:28:12.4516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6D8bbn1IBbaQ3qhJR1247BFA9aygHy8QP8F0XMkPksLaz6Xg+jpcf1ERmtKNGuMQ4hJ6ir4KvCeu0x2fMkdOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296

On 4/29/25 10:30 AM, Boqun Feng wrote:
> On Tue, Apr 29, 2025 at 09:02:22AM +0000, Alice Ryhl wrote:
...
>> +#[inline]
>> +pub fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
>> +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
>> +    let len = buf.len() as isize;
>> +
>> +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
>> +    let res = unsafe {
>> +        bindings::strncpy_from_user(buf.as_mut_ptr().cast::<c_char>(), ptr as *const c_char, len)
>> +    };
>> +
>> +    if res < 0 {
>> +        return Err(Error::from_errno(res as i32));
>> +    }
>> +
> 
> Nit: this can be a
> 
> 	let copy_len = kernel::error::to_result(res)?;
> 

Doesn't that discard the length, though, by returning Ok(()) ?


thanks,
-- 
John Hubbard

