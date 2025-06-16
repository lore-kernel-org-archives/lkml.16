Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A61A1A0BF1;
	Mon, 16 Jun 2025 03:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044895; cv=fail; b=D4iXgWUr6x4qzvl+sO5qVaX6eKv7VZuLYv0rXPZlZ0lP+45kryEu7y36Vh0/OzjG8B5Js9htGDmEyoBCFLGDs+ijid2MbvVyJQ8rmk49ZzAOTQ5VtiINgnEKsOnkdNxEt2kSJvYG9woXOw2l2OXOsGxyCdeqkMmcVR95HEBLOjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044895; c=relaxed/simple;
	bh=Cluk1Vhjjvr9bC1rTDi6Qi4ez1Wu2L/1YN4vJS8kIeI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oVkgWTDCZ0Ic4prbira+hG+XaK4i0n94D9sV0WbiUtI1EpCs0ddgxS53Yz3fw4k+PuvFQ61v48qRP3fXXKlD2f7SUcS7jljfqmOYhz/WiGc+eDg4DaI0QnOR+ZEKpoFNTtITpeWAHVjxF0Pn7R22IURk31o7aiSmo3ztFflWGdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d+Vu1jRd; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d+Vu1jRd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ko6ZmCHoZSEWgmNRoYIx/BF81uH9nYRYRlEV17nsnzUWIsuPkH67Qvcxl4NS1WGoUjXLJQabxkEcxdK7iC+U0YCdTiU0qpmXZbx1HsGi2pt4IsOCqV7HUu8gXTOCMVAp629gbKAZPmdcxKyafTOAzZFbynL+mQUzt7pnMd7kceYSDygr64OzIZNxJ2PiTtK4GMlOM5mJFPrW+mWVWq/ZoUr262GkxhO+a/P+jaDWsMiSKgjXDNYRsmPFv8O3Rzz1gOQLFmkWE5Z/tveMjwvnYb3+KDcHucmmXlhh+Ey/dqrA0F33U1d7rSbj58j/OTA1IxLlh0IcuKYyLDuDyu+i7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4HO+hHHowXcP2TzFszJvChfqZkfDrnM/iWbwWesEKM=;
 b=VV5+mFpdH5CAxU2XLdcBwrS4PYAqPKe5ptrrT3eEyqcu8oy/WRl81hzNJsDAHs/GYPR3tawNIxFqYUwNJBG1hhpFRRcjKJawby0JwXGBDF9iW+gGs5OSbgO/LnWVV5BK3kV7wpwfdDKrnfm8B0dPQLrz5xcMDKs7U/qa4/krKg4xEZBNijAYmd6oR5UZmnq+NK07GN2weUSCkPouKeTUMEe+8UT4XkP5uPy7DuxiWg7FUilY930geaYA5L8H2VI1ruOYvAuy/PAjWsZ48ABLP7x6oEvu63e9QkSO1sMS2nIwKXG5PJuh9vc3akQ27k8ysnEJJaZS18M9wHAyTijRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4HO+hHHowXcP2TzFszJvChfqZkfDrnM/iWbwWesEKM=;
 b=d+Vu1jRdi4QCX+4SFC2iAvY8MFlWLBm8lwPWkTyab9pz1j6IBwpvmIYzq0QVOnFvmMTDI3X6Yx78FK65g8E7hjksvAN/N977zf4s0YlCthHbZW+MTMHsWVO42iMfQcqnLX8Krn0tiedt2FZybONH+t/GpHKCNWDDl43/Fj3TnyNkLfEyxffs16Ae7nnPwMg9ssx7LIkjrcFr0ZjIlOV8cBdLr0qRnH7YLcolESIyeK4lE0ZrgIYQnrcakC34p3wXRxP0L4OsBJQQ6Hv+yvwY6jvyDVaLf31Afci6JKHIfvj/u8emeTSEik3JG1rPEsDLVfZZE8gR1tjxHX9Um40N8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:34:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:34:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Jun 2025 12:34:06 +0900
Subject: [PATCH v4 2/7] rust: sync: implement `Borrow` and `BorrowMut` for
 `Arc` types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-borrow_impls-v4-2-36f9beb3fe6a@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: 11304472-097e-49a4-ee65-08ddac86c0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk5vR3pTTlhhWTc5bTlETm5nbzRYV21Ocm5jMmJIOEpiQUFsbDhFd21lK3RT?=
 =?utf-8?B?Vm5LVnlmVncydlk4MGtrM1haRVRRQlgxcGR4K2hqMHQwblJKS2laRmU2L0xP?=
 =?utf-8?B?YXhvQWo2cWNtZEpxelRIdGc5WjNBc3RrKzl2Ymw3akhUN2tsd0J6VXkwQlV1?=
 =?utf-8?B?TGNrMFlVYlVrcDQ5emV5eTZodHc0RENWbXZOSEpaWG1NTGhDL0RkN1VyWEx6?=
 =?utf-8?B?eUEyaFF1U2Zicm8wcTFRNkxDa0xvMUJEQUtWMjU5UHBGQW1STDVzdC92UGh4?=
 =?utf-8?B?R3JTUm1sTTIzaTkwczVyTkZmcnZBMThlb0pnWEJSdmpFcHdLVFgvQThDV1lC?=
 =?utf-8?B?bkpEc3NRUml2YWQ3anlxT3BKZ2ROeUJvb2xwd3JsRGdpcERRZnU5TWtmdUNR?=
 =?utf-8?B?RTFUMjdibTlCME5waU00aEJERUJneGJWem5VUjZDSCt3bTlHTk03OGlBYXI0?=
 =?utf-8?B?OXVUYnlkekc4RGUzN3Z1TmIrZi8ySmx2Qi82OGxUd1hMbSswK2pJeGZOdUZL?=
 =?utf-8?B?Zm4wQy9PSmhsQVpINk1pMG1sc0tYMHlScGozU0hWZlZpRm92ekFIWno3K2Qz?=
 =?utf-8?B?Z2dXZ1RZcmRVSkZlcUllYnpYM2VKaUhxOEdSZUJrYW9KVG8ySkV4VGRXT1hR?=
 =?utf-8?B?bmgxNnZjbUQ1RGE1Tm51bmY0SHB3ZlQyUjB4SXlFcnBzRGJHdEJ4NXFrdTJ3?=
 =?utf-8?B?STRJQUEvejR5TWJ2cGZxUmhDTHBSODQ0VUdjMVBKVUUzTU5NU0k5bzR6cGpB?=
 =?utf-8?B?eVZaNExiMVo5QzRjKzA3RzBVSVQyWFd4Q0pFSWxCTUppWEgyR1NBWkVVS2xZ?=
 =?utf-8?B?K3d1Zk1ld2NHenhOOEEydVlFWFhncXdlZC9SaTZIeFo4dUNLR2dwU1NVMmpv?=
 =?utf-8?B?V3BNaFZjMUlncjNrYlY2dXMzVnJOQVhYSCt0QkZ5ZFBGS01OS2R2dzlnN3Fa?=
 =?utf-8?B?aWRuV1NTWjNsbHU1OUlmTmFXcGVxTExMWjltQm4xSDJWQm5lcmh2Vm9BeGZy?=
 =?utf-8?B?eWxuTVdCMXcrU3QxM09rTnhIY09kVXBMSit6NzRTVmk4cC9XR25YbHh1cmh3?=
 =?utf-8?B?b0ZkVUgraXRSVVVDU01IOW5PSTIyd1NqUE5talBCTDBTeDNtbHd4WGhmWWps?=
 =?utf-8?B?ZDhIMDFpTUlwOHQzZURZdWZZY1ZzR21WaG05NXNKeS9MUld2Wncrdmw0Qjls?=
 =?utf-8?B?ZEVTWmpCS3o2ZnVqZDM5aVlrcVkySUdwbkRFTlRPdEV2R3hFQkdnNDhvU0o0?=
 =?utf-8?B?dnRaK0NnK2x2OGs0TW1wOW5WekRBbkVaNytObjBpT0lqc3VZZmhWSjM2SUo3?=
 =?utf-8?B?VGh5K0F6anRlNG8ydmI1VEJPc2hxaFl5OUhOeEl4VUhMYlBWZ04xMURZM0Qx?=
 =?utf-8?B?djdDMlRENFMrdERRZkIzRElaRFJiMFpPQjBicjhZRlhFM2g5Nit2Vzd5RU9o?=
 =?utf-8?B?TVE0N2FmOExhT2k5bm5BV2h4TUdiRGdUUTlJWTgweWd6SnNQL01TbHBYdk50?=
 =?utf-8?B?cVJZMFBOdS91cWhkdFNQa0xHTDBiUUlFNkw4b3pHZVRLOUFrNlQ5czNobE9Z?=
 =?utf-8?B?VlVUMTc1VFd2d202eHJXVE5leDd2MG1XQVN6VVM4a3ErNzcyYnJYSHJ3dk1Y?=
 =?utf-8?B?RTZKSFR4cU8xTnZJQXlKOW1lUElwYlc3N0dZZFVTelJjWXRhNkhrV1lFOHNW?=
 =?utf-8?B?UFBYV0JVUTIzVXR5aUUwYVhoWXpGQWJBdXJYbm5UNkJxb1Z6TFNnb3FnekJV?=
 =?utf-8?B?UDI5VE5ydGE1V041ZDd2OFFTbHVIeVd2WGoyN2J2VVBrVXBjY3pIRlNMcmI3?=
 =?utf-8?B?UVhtUkFBOWJ6eXNvRVdOOE03NlB5SW5OZ202VWkxS3NCcHFCQnQzdVFYOE4y?=
 =?utf-8?B?Mi90am5adUpjTkp1Z0cxNlBwaHVyM3U4eDFRbU92Ry9KMWhGM3k1T2NqWlFJ?=
 =?utf-8?B?TXZKY1lrOHBhRlE3RDlGaDJudEtnZHJ4U1Z2aUpReUpoaVFaNXNDc082Y0Rp?=
 =?utf-8?B?KzBJUmYrd1FRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk5mOVVTUi8wbUxMY3dEQUlQODNWZk0wdUdMUmY5VlI5MzlaT1p0eEZSRHRu?=
 =?utf-8?B?OTlwL0RUaXhvaGd5L2REWmZRT21KS1NKc1F4WGdOK0lLT3NuQzRUeGlXZzZr?=
 =?utf-8?B?NGxhVE40U01ENWhIQitwcjZxdWtkeW81M3lScStRbFBlK1BrbE9qV3JLRjY4?=
 =?utf-8?B?QTdGMEh5MlhhY25WbDVZMmtFa3FBaElYZ1JoRnZrWXA3VjhyR2NYcGF5b1Jz?=
 =?utf-8?B?dVQxbkF6SUdvbmhreVo4RDh1d1k3SGJGanRFSzlIWGpNMXo2a0tXN3htSklm?=
 =?utf-8?B?OXJqcjFTc1dONWJIL0pvZUN1UVNReFptSUdmVm5kdFhuMGsvSFU4ZVkyMDBl?=
 =?utf-8?B?WE93VGFrblJNWXNGaWZuT2ZFSzhMYVNQdi9CeTc3MWtyVThHS01wOHVBUHhp?=
 =?utf-8?B?YkpEV3FCcXBtTmphYkhwTUNtSGNVb0VsWHl4V2I4OHlYVDhTZnd5NFJiaFZt?=
 =?utf-8?B?M2JiVnlEUDdiNnVXYnF3OUV0bVh4MWFqaXdZM1lwb3AyRHlWTlg3MFVrWWJQ?=
 =?utf-8?B?ZTBaYTY5NHhDekVrZUpuRm1wNTFCcnVGZ0NJWkRTSGJsZE1iYWFtRm16QjRZ?=
 =?utf-8?B?YWZ6Q2xpWWI1QjZQTnZ4Vlo0dkMzRzI2Z1JjS2Z2QXZRWkcvSWVUeG5ra3Ex?=
 =?utf-8?B?d2E1NlFYRytOL1Z0NmRGWVlGZm9yVnJhbUxzeFFtc2NWbGV3dDBIWWZncXg4?=
 =?utf-8?B?eFJpYlNqcnVqM21iazZvTGRDZUJ2bzd2Ui91cVFLWVVJZUVPY3p6NGw1UlZw?=
 =?utf-8?B?ckhmaU51VEcxVDh6aXNiejczSnFYU1VXQkE2RG9jemZ4UWRBbUJYaHBmVnJB?=
 =?utf-8?B?RUZGU0VFS2RZU3N2UXQyeWUyOVhQTVV3RjkybkJhVXFURnlPQlUxejFRQ01Z?=
 =?utf-8?B?VXZwd1Fib1JNS0NPNXdxNzRrVG9zM21SYmZxWjhVOXU3dFNpcGJwSGkvTVp1?=
 =?utf-8?B?bTlIZWRuRVZSZ3EyTDJHMkJuVGFGaUpmdmc3T2lLNHBFNDFpZ1gyZFZWV3J0?=
 =?utf-8?B?RCttem5KUEZOcktpQk1jQU4rdjFLaUNrbXJITEdpWmp5TFZLSDFiblBRNHln?=
 =?utf-8?B?TG16WnZaS1dOcmt4RjV6bE83RU5uc05jZWdGR1NlRHhMNlo5cGxYZjFycWZD?=
 =?utf-8?B?SnZ2dDFDc1dadkt0OElqQzB1K2czVURaVXl0RDYxQmxIbG5HTzFyWmtlcG9L?=
 =?utf-8?B?YkNsa0J1TllzcUI1NC9xbWlER0RaRDBUR3lrSlVlQmdhcGN6bnhSd0pwRlhh?=
 =?utf-8?B?R25odEJ6ejRyQ1FjQjhVTndGZGlBdTEySEJjV0VxM3NpTmk3OFJTa2JvbUJC?=
 =?utf-8?B?QWVJTzNKSVVNUGRmT0hsQVFURHZnZWRhNWRyMitobGV6Zm5ia2JPYzU4akNn?=
 =?utf-8?B?ZEVBRzRrcWF1TDVjRUlFbGluU0dGZWY3clFENjJpektuc0hHVlk3SDFLd0lr?=
 =?utf-8?B?Yklncy9yV3lGUmJHODQ4b3NSZy92OXllb21sTGYwWTVMZEhzcjZ5TWpPZ29S?=
 =?utf-8?B?NDZCM1REUDE2U1B3Ny9QeWhkV3d4YVhuZ1c5bkdVN3E5ZmQ5Z3dBc2l3am9L?=
 =?utf-8?B?aituSlArZlllVzB3Wm5jOC9lUlh1SWVJMmVJQ2hUSVZROU93THRqcDRGL3A1?=
 =?utf-8?B?bk1xdDNQT25XdGhhMVF1YlpRaUtEeWJBVkpTTUhBY05QMFh2Y2taOTJ2NDZ6?=
 =?utf-8?B?aFdSWnE1R1doM2cwRHdWK09EL2dyOStaQmp6SFFGKy9yY3NYR3hKOFBUVTBW?=
 =?utf-8?B?T3FVODJ2Uk9LMlJmK3pZaEV6clc3bWVHRVE3ZFpEdkhoenVQVXBCbFJzdHdM?=
 =?utf-8?B?WG55dmtnZ05Ma282TnE5VGpuTm1uaXlUdnBNbmpEdUMxTS9ETDAwRXNTSnpM?=
 =?utf-8?B?Mmh6N0VvMzdFQW9aSklYNXBzbThieFVtT3hoQzgzZ1pWUTd3cWxGLzVKU1VR?=
 =?utf-8?B?NURXalo0QUpOMHZ3VTJOaGEwL1N2eUZPbGFSekVONzNsUW9kZ2lGczFaczVF?=
 =?utf-8?B?QmE4elRBc3NKS0dMc3RKdVZqYWFVVUNFRDliQjdlck9qN3pwdTNQbHlPY3A1?=
 =?utf-8?B?ZXlxWjRJdk9TdjNIaGNmaXdXTXNuZmJiakJaeFZBMUpJajc3NkMyb29FSnV1?=
 =?utf-8?B?Uk1RTkJGbmRRT1JQS2dYa0g1U3ZLQkRrM2dueUcyWFJmT3dCMFd6TTFsckVN?=
 =?utf-8?Q?cQiYLYOFUly9LIsVnRPhDhmQHv7CimNebkI4oKpCbn/0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11304472-097e-49a4-ee65-08ddac86c0b3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:34:51.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkdCR5gbeBoJPFdanJGaSew9Gx7LSM2hgO1J7rn2itAxeyX2FjFafHevAXx1Ubl9Jh0eMcd/hgZDMFfrlXB9Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

Implement `Borrow<T>` and `BorrowMut<T>` for `UniqueArc<T>`, and
`Borrow<T>` for `Arc<T>`. This allows these containers to be used in
generic APIs asking for types implementing those traits. `T` and `&mut
T` also implement those traits allowing users to use either owned,
shared or borrowed values.

`ForeignOwnable` makes a call to its own `borrow` method which must be
disambiguated.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/sync/arc.rs | 78 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index c7af0aa48a0a049bfeeba3a81080355f4d381738..499175f637a78f15d522007f2ebbbee9c4eb6c91 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -25,6 +25,7 @@
 };
 use core::{
     alloc::Layout,
+    borrow::{Borrow, BorrowMut},
     fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
@@ -406,7 +407,7 @@ unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
     unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
         // SAFETY: The safety requirements for `borrow_mut` are a superset of the safety
         // requirements for `borrow`.
-        unsafe { Self::borrow(ptr) }
+        unsafe { <Self as ForeignOwnable>::borrow(ptr) }
     }
 }
 
@@ -426,6 +427,31 @@ fn as_ref(&self) -> &T {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::sync::Arc;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let owned = Foo(1);
+///
+/// // Shared instance.
+/// let arc = Arc::new(1, GFP_KERNEL)?;
+/// let shared = Foo(arc.clone());
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> Borrow<T> for Arc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
         // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
@@ -834,6 +860,56 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::sync::UniqueArc;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let owned = Foo(1);
+///
+/// // Owned instance using `UniqueArc`.
+/// let arc = UniqueArc::new(1, GFP_KERNEL)?;
+/// let shared = Foo(arc);
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> Borrow<T> for UniqueArc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// # use kernel::sync::UniqueArc;
+/// struct Foo<B: BorrowMut<u32>>(B);
+///
+/// // Owned instance.
+/// let owned = Foo(1);
+///
+/// // Owned instance using `UniqueArc`.
+/// let arc = UniqueArc::new(1, GFP_KERNEL)?;
+/// let shared = Foo(arc);
+///
+/// let mut i = 1;
+/// // Borrowed from `i`.
+/// let borrowed = Foo(&mut i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> BorrowMut<T> for UniqueArc<T> {
+    fn borrow_mut(&mut self) -> &mut T {
+        self.deref_mut()
+    }
+}
+
 impl<T: fmt::Display + ?Sized> fmt::Display for UniqueArc<T> {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         fmt::Display::fmt(self.deref(), f)

-- 
2.49.0

