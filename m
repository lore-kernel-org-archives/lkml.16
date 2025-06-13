Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ECB19CC39;
	Fri, 13 Jun 2025 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749795357; cv=fail; b=Ir2QMETsi+0cUK+420E9CfpxDZWo7DkxXhckR7cyXXzUyerF9H0hfBKHiCnXln8THg2NS/i5GWs9UEbR0UXF87OHMNGTdYzZeJOyaFt5sioRaOLccf1D5lcaWksKvzDOlCyYjnPp1k9yW+v6C0h5SvCd1jnu/Te8MNoysK8iL/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749795357; c=relaxed/simple;
	bh=rahy/O8/2sfvE2OxMbeQ0KELroZTgQ4PfjeQxUJHxiI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mNzDXQZ8RYaJjKWtXUW4pENZSt1lbtIjVZ6n/F1nvj4lIZ9xhQgNm0e0njUM6tl1n8m6ODposqSvCrnv+sp0FWAFNgJhFiTq6O3oPXgLrH+EVOfrCTZXDGubN4ZQfZdn9w98ib4XBq3/2fjr3o3gfWlJoO/cLRDs3JHP/mvfgUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mHmZ2ThW; arc=fail smtp.client-ip=40.107.237.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mHmZ2ThW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4RTH62Ea+wZjlobB6FfYIbPpf1SYX2Fhyr0rHTOdPzEUNiuklh+Prxue0nGbF0chCbARIeD6YqqyP8dFGKsGCZxeFPukPmViQ7T7SSibQuLtAoJDJlfCE6G2M3UZyb2KMmIedgjzabI2kF9wDlCF665AoEEIkMhYbFgx7o4QAWXNdvDC1OoAkv+D30XaYqrrSweNoRM33OD5K+2NrqgkFbG/BnjuTwKHIDnJWp/muCXmqgeaFNcJejx+aW5rnExQgr797VRmyK3fH3/iRr3bCD/dTd9IE9+4niyUcG7d8mA3B0rEQ3BWui0ClKQLFnAl/FRV7wWZzDAzviXy4utLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7icrw8hgoWmhRKjrKTOPS2CS5cxmTSBLYHdmeLqLSE8=;
 b=pGoX3tFYPVL8ZGKXSKEpPcd9AOXQ5VMWFIseyFzP4rdJNIQh4Gj09o3diqnHOfHQ06gzmvbthzFJSNjcrDsQeQx5apxOfoceQnavZxpxo5V9IXFGi/LGzubd83emlerJ4V8YaH5p4VYZ9h1TUC4GPCELr18HZpjRVz8Pzbvz2/phRcEpZU0Kci4ZlEi18wlDiqGfOACwArh8SjxcKvbzsAJ9mh09fMTxqc0xYEHMoqimt+5AcbsGHqgPeDKp/RkbZGQ4TL90fKg+G5boVwh0z5F4/5RNMGXOnyFmcFs6yMQ368sCYHoiHXkg+4fDqAtidVXATvSbRpf3seIDhTOyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7icrw8hgoWmhRKjrKTOPS2CS5cxmTSBLYHdmeLqLSE8=;
 b=mHmZ2ThWfc37TsH9qf+mZZzc9HlMfbJ5woUNrKSDLVXKzc+rJQb4shj6C9JUJ/4WKSCD4OfskpYDq2KWK+y9mlupRiXcwmWUJievh85ShVF1aYEeIvwKO8hzYb8JmoQK3cw0HZjiZ+5UcxI732nlpd8JWX21EaIyrYsj96htroVJ3Z65IW4F5I4UV5toe2n26/gnFFTFhPxIRqQ3lTw8XWvsji6IVC7hylmlLhj/59+5HSKPfAm0LeX7Kge8+HuTo/f/tPW/DZtGSl3ke1O4/PaXCsNaC2NFb69WwsUCKPoScf9oC7uBjie9SR6KaphPffDWZQzgVHoY5EFpIVdRkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 06:15:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 06:15:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:15:47 +0900
Message-Id: <DAL6OLAG7R5W.3U3TNG58QUO04@nvidia.com>
Cc: "Benno Lossin" <lossin@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
 <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
 <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com> <aD29_GfdV02X4q5N@Mac.home>
In-Reply-To: <aD29_GfdV02X4q5N@Mac.home>
X-ClientProxiedBy: TYCP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: fc042c44-b97d-4cf0-3b81-08ddaa41be52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sm5PUU9qL0JHbXZGZkxtK0gzZTAxN3o3cHRPbjAreU9pVXlGUDJYN29LUms4?=
 =?utf-8?B?ck5yM0JmMTI5ZFZ5VXhYaXFLZVdoUWR4ZkIwaytjekJDMGJOUHkxTTd4aklR?=
 =?utf-8?B?QzVja2tSNkdmdUNjcGpZcHZUeHM5WnBjWXQ2OTNNditWaHl3amFoWUZmSmZB?=
 =?utf-8?B?djFMTFByaTZEKzZINWQ4ZGlUdFBYQWZMU0lPZmY1bkVTbGZDQ2tsQ1RVMW1G?=
 =?utf-8?B?Wm9YeU8rbkdOS21FMkIyWjAzNERFRTJoNEJZZmh0L1dWeFdyQmZCZ0V2R0ox?=
 =?utf-8?B?UEJ2MmVlSUxXVE95T3M4NExjV0pmMk96YXNRcGJudnNtTGRoRXBFZGVIamdJ?=
 =?utf-8?B?VmFQWFNtUVNoL21QVFhmSDZLMjZibUlORm0wKzN0aDl6c0FZeC9DcTEzam9l?=
 =?utf-8?B?L1VNRXcwL3YzbVZvS0hNSUhPNU9BZFRzWGx6RUo3anB0OS9LQndQVTVGa1Er?=
 =?utf-8?B?RUIzYURHdUZWQ2NOWGNVUDdSVUkvYlB4cERLTU91cmhwSGtIQmJvUXpQTUJI?=
 =?utf-8?B?Y0VsMmtHWjNCYUg1dzFxdkUzcG9TWnVlbmg4MzFkODZ0Y3dMY1FqVWd3enNk?=
 =?utf-8?B?YTNRSHpuNmpETWpUQmtVUWpoME14SmNBTmNmN09qWW1CemdDdWFURkxUb204?=
 =?utf-8?B?SEJBc3IwdUN5bEU2WUU3WFhSUS83MWNaSDV2cjJGRHdXZEJNa2k1bFN2aFRY?=
 =?utf-8?B?YnB4V1l6VnVmYi9NN0VDNWxiTVlGMTBhb3dXSDJyZzJjQVZYOHRIbVJac1gx?=
 =?utf-8?B?bWdZWG05VTJhNjc4YURRdkdnZWRqRTd2UVAxM3hOK2tVMXczdThKQVJ6V2dH?=
 =?utf-8?B?SGh4NENnd2NpMlUyWG5EY25vMGZUeWN4UnFhcTFScURBei8xY0hwV3d0QjZv?=
 =?utf-8?B?ZXpkM3FtS3VYUXRNQ3FrUXBuUjYvZnRJWE1DWlJ4d0xzRkM0a2hpeWd4SDV5?=
 =?utf-8?B?MTc5NytERnBrOTFOdXdLUGRqNkt1S3RZUjY1VWZGSUl6WFAwVWRHendBcWE0?=
 =?utf-8?B?YlEzNFZsVVB6a3RTb3NVT3J1S3hQY0tsbytmakNDTnlyVXhCdDNkWkJyeloy?=
 =?utf-8?B?enlMOGREd28xalRMQ3cyUWU3NHhqOUd5Y05QWklJT2RraXVqMXJBSFkvdXl2?=
 =?utf-8?B?ZHpqT0NhRzgrZEdlbzRkYWlpWUNJTmNZdHlZU2VJbkM1dXhtZHUzUExseEhZ?=
 =?utf-8?B?U3BuKzNnTXZuSUhpYmhCRXVzT0pGanNWZlR4VllFc2lkV0FNdk5xbFJpMUxi?=
 =?utf-8?B?Unk2TmJaWFlPaUloSVVOSlFGUjVkeTFaNm8wMmhvdGtzbzRiNC92S3BkZ0ww?=
 =?utf-8?B?ckkvcFdVeEFWUUc5b0FPdndTaitKaUJWaFZYVzJIMGVITC9OV3NUOHc2RkNk?=
 =?utf-8?B?bHBoQlpBRGUwSVV2TUo1TmNiQ3RIUnNVYTV6T25FSVJVL1owWDV5cEhTSG1z?=
 =?utf-8?B?SSt1d0h5d0ErU3dzVHVUb0hmWDVnWDZWdXVsaGlSZmNxeG9qODUwMGxnb2V1?=
 =?utf-8?B?ZHEyS1o0czUzempNSCtGR1g3Q29HSGtjQUdMaEpqbnMwYzQrVTlFOFFqYW1o?=
 =?utf-8?B?djVCT3NmQmJpNlpET0ozcjl5bm5IS3lFTENxRm5UY1pnY2VsaldJQ0t1UTBW?=
 =?utf-8?B?VnVxc0g2REIyRVhKemUwekpBVXd3dkxkcGFNTWRBaFUwdFllRmd2LzlRa0lm?=
 =?utf-8?B?N2xpMitFc25zNXNVMVZDV2pDTEI1OHBxWWc5VG1LL1p2NmxZN0dtd240ckEx?=
 =?utf-8?B?M3QrYnd6VmhEZWJhZTk0QlRYYTdNVy9xN1A0aHh6RnFRZlJPek1LQkw3UTR2?=
 =?utf-8?B?dldWOXJkMnpxeHRaMGFQYzZaTGZQdWFURjVIVEZyU014SnpEK3JvMnY0bFRZ?=
 =?utf-8?B?a3gxZFNJbis4YkdzdHFGdGxJZ3BDbXJka2IzaXRkdGgvUkI0bzZ2akUvZjNP?=
 =?utf-8?Q?nL22w5cNYRc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZtclBaaGZTdjZvRm5sMVN1STFMZkFscjMxajdHNWtWcHFza2k5WDRDa1R2?=
 =?utf-8?B?b2E5RVYxSUNZSVVPSWRsK2NpMEV6a1RDZXlqc2Mra3V0RGNydCtEMHRJWExx?=
 =?utf-8?B?QWVnUEtzRExDUytxOWdJZjkvdVBmcy9Lc1hoSDM5NzkvamRpYlhzVjBJUGd3?=
 =?utf-8?B?KzFaWWhvSHZJZU82REtOblJmTTFJZXhvd1NYSjJzcDNlMWZXa0tmR3lPZ0xL?=
 =?utf-8?B?SnUyQVd3ejViUFhNcGJxVjY3VFlCZVh2ZmZwaHBYUjZSREh3MGR6YzdUUTZr?=
 =?utf-8?B?dWdCMWd4ZUFRUXNZVFJPS2pOUk1JcFRuVUNpMW9hWEVOYmxqdWZRZlNaUXE4?=
 =?utf-8?B?cDRRcC9jWm8vTnRXbVd6L1NPWXlPUk16VlN2MmxJZ1JmTURjZUpHczc0c2l2?=
 =?utf-8?B?TUI0bjJ4MmNXWGtxUjVaTjlQWGJCd3FVYUdLY3g3OVJUWWJJZXUxc1hMUWpn?=
 =?utf-8?B?UEVod1U4elQ4RUs1L1M5ZkhrRjY0NkhzQ1oxZFpGSWd1SUNieWtMamJycjF4?=
 =?utf-8?B?UEU1a01hNW1uNUFFN0VyZEFpcTloQzFJNkt2UnZxNVNLL2l0K2pkVytvclBJ?=
 =?utf-8?B?UjU4bW01R2lYYjRWYWFOQmJoTnlxSnFqRmZpLzZxd2xQcjg0NDMrK3htUld5?=
 =?utf-8?B?MXRMMzNTVGgrQzFHcFFkdzc1SkFRVTE0V1ExaW5wWVdJUkRWN2xCUEgrYXV5?=
 =?utf-8?B?NDk4amc3dkJMaS9TdWJrZ2xoOGwrMXpxNy9GOC9pcVc3czBYNnhURVBWVjFq?=
 =?utf-8?B?MFBvVlk1ZUpUWmdZanY4Z3pOdkN2NzNkckdnakZHdGdOVHozbUNkYTZnbVdD?=
 =?utf-8?B?NjdrTDBpblV0QWhqL3E4Q0x6WWxqaDFseTVGaElqaUZHSjErbnhlc2l3dlh4?=
 =?utf-8?B?UFZBb2VxRDQ1eXpRVDFZMkRvRjkrU2VUaDJKOFZ3UWVuZ0NKTTdPMityVVBF?=
 =?utf-8?B?aHZFeVFWTFJETUFHNVBRWnl4NitoNUNEcTROcTJmSlJGSzJaU1JCdjRSbkVP?=
 =?utf-8?B?bU5jSmRJNkdoRURPS3h6M2IrMFE0R3F2THRxTkhyNzFoeDV1NEROSmFoY1g4?=
 =?utf-8?B?dGZLS0Fad3Mya2lKdWpqZ1lMa1hLWjJYMmNla21NVTM1dGxnOVYxaVZpUDQz?=
 =?utf-8?B?Ui9xWHl3T1ZLdktlbVhlT1pMclhIcUJzSDg1L2pvVzFWMUgwa0Rack05SVAw?=
 =?utf-8?B?TnZNRGszUDV3cmF0NGtLUk1OclBmMmZNRE5tSUkra3dUK3lGL05MLzF4NUsz?=
 =?utf-8?B?Q2Q0R05rczU1UExjakJhQXFXbGYvWkg3WWtuZ2w1V0JBdm1RM21qMHhBUG5v?=
 =?utf-8?B?MEloa1B1OC9XcUhETElrcEVKSGJNSmkyTzBLbkp4MFNJb05XOVliL2VSbldO?=
 =?utf-8?B?T1pVbVBiT0svUnhRdzJGWEZqTnRBZGs2dUluUzVYeURHckppeXVxZHgyZkUy?=
 =?utf-8?B?bHJab01ia0szbUJjaDFYREVxMnYyUXVpcFF3dElwclRqZTlHTUNsbVRHOVBz?=
 =?utf-8?B?VEJ3T203K1FzU0F0L1daeEFPNHNGQUhwR2FhYStpbmZlT0FuVWl0bG9ndXBP?=
 =?utf-8?B?ZWhtK3FUTEV6U3VTbkkyMm9jUUtxN3k0elBoRTJJVFQyRVh2NHE3ZUFJVVow?=
 =?utf-8?B?bjRlQnFlTjR0ZUdiNnB4MFUvWGNrUy9zK3FxT1FkcVBUWGZGclV0VzUvM1Jt?=
 =?utf-8?B?bnNtMnlLS1U5eGxRVWFsa0JlbUU4S21UTzUvZFdpQmlhNWc3aEppa1BuK3BO?=
 =?utf-8?B?M2w1clhuVUJNYXJac3FCVHZibzZKR0N1c09ManpvL2tDL0NYa0lVUnhLVkN0?=
 =?utf-8?B?c2ZLZzBiOUJ3Rno0MEc4MFhXU1ZoK2MvNEtVY3l5YlMzYkRvc1pUSDJDMjhs?=
 =?utf-8?B?Q3MzT1F4eDFBeXpFZzNCUVJxZVF5NDU5ZkJKYkt3aTBKY3JjRHhqd1JKbzFQ?=
 =?utf-8?B?dmczM2Qycm5KM1pURU05V051QTJXbEt0S0FYS05uNHlycjB5YkkrQk5VQ1g1?=
 =?utf-8?B?SVZzRnNLN1RtYm02c3JBL3d4d3IxYmxkdEpVRXpTbU1aNlRVNW9nalVFbnZN?=
 =?utf-8?B?cmpXcjFrekp4THBQTDF2OUNqZkhJQ0sybzlaWkxJNmlJeGNERGJYSnlLRkZa?=
 =?utf-8?B?bUFxc2NVY0xxdTRhSmNaWEUxN0FsdXJmTnNRSGNTTDZnZkF4eDREL2NoeGVu?=
 =?utf-8?Q?nr7b7XPBeDOYNJxm3dh9GeT425RItDwwwhjee6ydS5mP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc042c44-b97d-4cf0-3b81-08ddaa41be52
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 06:15:50.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUXNOa8Fr03E9VfgJJQb2uamiSWNJgXDGiTs4E8ZucplK9RCaEZoQhfz5CpbvO0B4h5V6G1a7DI3qahSBtI0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035

On Tue Jun 3, 2025 at 12:06 AM JST, Boqun Feng wrote:
> On Mon, Jun 02, 2025 at 10:13:22AM +0900, Alexandre Courbot wrote:
>> Hi Benno,
>>=20
>> On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
>> > On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
>> >> Implement these two common traits, which allow generic types to store
>> >> either an owned value or a reference to it.
>> >
>> > I don't understand the second part of the sentence.
>>=20
>> I want to say that Borrow allows you to do something like:
>>=20
>>     struct Foo<B: Borrow<u32>>(B);
>>=20
>>     // `foo1` owns its value...
>>     let foo1 =3D Foo(0x12);
>>=20
>>     let i =3D 0x24;
>>     // ... but `foo2` just borrows it, subject to the lifetime of `i`.
>>     let foo2 =3D Foo(&i);
>>=20
>> And the implementations in this series also let you do:
>>=20
>>     // `foo3`'s value is owned, but heap-allocated
>>     let foo3 =3D Arc::new(KBox::new(0x56, GFP_KERNEL)?);
>>=20
>>     let j =3D Arc::new(0x78, GFP_KERNEL)?;
>>     // `foo4`'s value is shared and its lifetime runtime-managed.
>>     let foo4 =3D Foo(j.clone());
>
> Maybe you could put these in the "# Examples" section before impl
> blocks. E.g
>
> 	/// # Examples
> 	/// ```
> 	/// <you case above>
> 	/// ```
> 	impl<T, A> Borrow<[T]> for Vec<T, A> ...

I've started doing this, but it felt like I was writing down the obvious
as this kind of use is precisely what Borrow is intended for. I think
Benno's suggestion for the commit log addresses your request for
clarification, but let me add these on v2 anyway - we can always remove
them if we conclude they are unnecessary.
