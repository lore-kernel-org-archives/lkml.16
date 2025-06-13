Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D3111BF;
	Fri, 13 Jun 2025 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821577; cv=fail; b=AcpZwdZvzaqdTYXQMTDVn75J2DybNgflqVKUUyiWQBhhYh4u/thIAcNSuICvCBrkNt3l6C6t4fm5CrIErWhLR444Y6VPNU1CVYZw395aqlaPttM4LQkBDH7Fzi88lFd/GdzD4UkK3VhvhnHth+A4fVUUCBN/zw6GVYcPoKx4FMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821577; c=relaxed/simple;
	bh=Yk3ANqENYvJVmPyTCy8zgDs00tLlF9l7tKRvm2FDmh8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=n/+wXYeZ0Cjm+i9ooDKQpSZ5vReg/3C3iSVWGx5FaaCRVAaPD8KbYYA1BQ6E2W3nPkBIRU+M2piwIVTOOaf/mNvi55pMICtFQrQ9OyAdajcrmHXqZt8jVJszZbJ4IPzTVbiX1AdJDztyLimNmFnVhuGL284cvxY3yKVXymDdFUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HeFVMGS7; arc=fail smtp.client-ip=40.107.220.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HeFVMGS7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5rI/nQ3Ms0u6phv/iii5IF2t36TioKnWJ9zUO3y2ZYQzbV6Pr3UaQptASXn3R/SDqaK+Q5HwRTuIzTyOHkxbMiA9KyvIw5ibIYYQn4YwMe4AIpH2iRcER2dcrxlT9axzIvBuCOUJy4sbkXrXFyPm6PH3BPfBjchEO0HHrHuK2udcmMuwgboQ5u4gjZYDyg7YyjHeYWmF49FKtbiekl/p4SJQS/R0r9rBUK/HZRj0+9g+jQ0bLokASxUATXXjvUxcgbUDccZDTZItB7REgiXyl/R5vyFQZX+TVO/0Vf8Oo/V+t6rZ9dWSf6yu6dOqMVcKygDobfcfL+SlKoCeAxiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj2/97Oj2cRVUYUNtXAeICEfO10ON4J8slYARa05h/s=;
 b=F5JQ8gVBsQraI3IZ7jWOVHSxZlqZ/CfqmVFdfCx4JKKaXGO9hdHv1VJrcXpwV5GxorsWGfAC9aVSDJ85SFQrBoIYashE3SViWiMU0LMFfRpkSfOeuBdYg3buQ9FqHaB3R7hacMP2/eT3LMRy/pROrxhkEiERc9xHhD7XxC7femyTeliQrW6obXZJHHsMgRp7gfp+9V1Z5iLzVxMA3ZsIppp5+5xOkcIBeH54lk2aTv3b3rzjIjr2slZCeYV3Am4rMoPrBYDxFRNc2BMK/6LWgDawlf6quJyD0ynueFofLdVo1OY1eXevf/wf337isM4TqsqcKvK7IDXgn/SJL9zR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj2/97Oj2cRVUYUNtXAeICEfO10ON4J8slYARa05h/s=;
 b=HeFVMGS7l+KDZKVOwJOygCT1/kRgOt5ZGTYWq92l/CW8FCKtXB8X9H5Q1iOiFC3HGGmiu4XUks//3Ep5az3JFSy1iKlTqxqD6eRD35gRNB2Q3IH/7F/kE2ksHyrqeMN4jR7RQDilzT1Q3gIaKDhKc0PqTAH/JlZsvzjHBdI5PmlkTgda4IGJD8xmdOcZ/Nkt3RET8G/YjHwL130pWBYFWHWQLbU2SbVx5FXanEouIbHc6UeuDOyii0glTyIj9nPV5XF8kW9O+MRCnWDVt0tc9tQo1jCpZP4bl/inUbUk0NwW4c4ZZ+EQq7zhxeZtNtLYTHIBJIMgxqNRW6yjj+hnFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 13:32:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 13:32:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 22:32:47 +0900
Message-Id: <DALFZ6YG8KPZ.2OQ25ED53ZI5X@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: math: Add KernelMathExt trait with a mul_div
 helper
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Marek Szyprowski" <m.szyprowski@samsung.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <CGME20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9@eucas1p2.samsung.com> <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>
In-Reply-To: <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 81be932e-d68c-4277-33e4-08ddaa7ecb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0ZkREJIUWtJWDg3VVpISHJHN1hRNEdPTjlvUmszM3RIQWlBUmFuT2Y0UGFr?=
 =?utf-8?B?aDliUEJackFqUEJZbGJBd2M5U205VTZhQ1pXUVhlV2ZrV3FSU0ppZnFsNTBD?=
 =?utf-8?B?MHJjU3lpZHdOWXd5cUg2RVpTM1FxMVVCMmN1K2tCc0diQ0paWHFFd0d4L0x6?=
 =?utf-8?B?UEN1d2lERkdnUzl1cnpBRFluMTE5RmRvcjA0WWRQK1JIVFdKS1pCTnZLL0d4?=
 =?utf-8?B?MkNWc1hsaEluY1JBR0hVck1hVWltU3BNMW5oZUJiVDV2Zk5wQjhqaEdjcis0?=
 =?utf-8?B?Yms3U2xXRDhEUGlKd0l4VU5PQXp2Q2R3Q2I4ZHRDbktoWHJLWUllR2xMRTBI?=
 =?utf-8?B?eHkya0REN0xib3kzN1lHTUJCQ2xZaERpdjNSRVAwNzFVSDM4WisvR2h2dFhu?=
 =?utf-8?B?ckN4WDJpa2NwWXoyOVVTYnN2a3NVeUxGY1pjazhOQWhrUlN0WmNSZllFQUVs?=
 =?utf-8?B?cG5TTThvWU91UVRsbVJqbHUzL3ZMVnV4a2xmUXNGRldhY29wcGdMOEFWTnVM?=
 =?utf-8?B?bm1ISW9nd09GcG5MRjQ4Zis0TTBpNmMvV3kxRkRNajJzRE9aSGhReUtySll6?=
 =?utf-8?B?SVZDSXU1TEkwQVhzOXlvQzFvdGhaUDFUTXg1c1REOUhOaHlTUjE3dDF0MWFk?=
 =?utf-8?B?SStCTUJwZTVCbFhEMjNMUFR4bUpFUVEvVU11TmZvYXFybEhHMm9hTVRlcDA5?=
 =?utf-8?B?T0RNM3Q1NnFkbW5YUGo0cHQvcXBESkJqQm1ieFQvYmVjdWVMVER4M2JZZVFT?=
 =?utf-8?B?RElNNlFIYTZwUjE5UDFBMmljWDNUeE8xd3h0cmJVR3pNWEw3MHNjWGRmSlp3?=
 =?utf-8?B?S3R0bnh0blVlVnBIOEorZjJnbFFydmZodXd6UEdzRm0yazZ3ckswSFlyYktP?=
 =?utf-8?B?YitGZzFlOC95bDcycWtPb0pPcDNyV0pCNHdUVUZEK1pFUkdFZnpJcWNlRlFH?=
 =?utf-8?B?M3poRWk2RW0zUmwxVGxjRGdBL3BERVZBKzl3dFZua0tvL3FGWUdQNzZZSTRl?=
 =?utf-8?B?c1JTRGFxckgrbmxaNUhzWGZIZExKVkVRMUx1M2dmejFNY0VwMm1mYUtQdEdD?=
 =?utf-8?B?SE5mdEpGYk00RnAvWEdSOXRFN3VmanpYM2p2RUNydGNmTnhVb0F3UlJrcTBP?=
 =?utf-8?B?Ujg3NXo1MGMxRE1KT09mMlNHaFh3UkNxY0FyTWpkMGNxeFdsOGJHQ0VrTXZW?=
 =?utf-8?B?WjM4SFNPQmdlVHduWGhUUXIwTUxJdXhSOGs2cGJiNU1DMTcvNnppRmNrYXM0?=
 =?utf-8?B?THJNR0d6MXcwSzhWYWJCSncwNis0WWErSjVJWDJacXlzbFRHZWN6Y0dBUlB0?=
 =?utf-8?B?YzNrVkFCeW5obElicUh2K3ZPVUQ3cjgvcys2UjhTTjdJdzRPaE5UZGtrV25n?=
 =?utf-8?B?dzBuMUtiVUNKY0NLZHB2VnQwdnFlbkUxSG4rMk5TNHFWTU9GOU1XajI5U0dV?=
 =?utf-8?B?S1pOMitPM0grYzFWUVdSL2Nra2hCTUt3Y3pKR3FjZ2gxRklKUlB6NVFRbi9w?=
 =?utf-8?B?cjA4TXdmTkhqUUkzNzZuN2kzL2hSaVJuODVXdHV0UlRMdG8xRzVIaWNEdnVr?=
 =?utf-8?B?dW1JWDhwZzc2RVUvS1Y2SzYxTkNjb0hzaTFzY0JYZnFsNVExYkt1QUFwL3l3?=
 =?utf-8?B?Si9vTkZBNFJrS1dJY2grRjNCVnBtaGxXR0NzSExHNlo5T1FpZXk0blZEVVBu?=
 =?utf-8?B?ZTc2eVNDbXN3YUhOdkMzNHV2V2luR3MxVkh2VHY4d0pNY3RtUE9aL0VlMjhH?=
 =?utf-8?B?UHhxb1JrbEZMUkF3c1NrTk1wNk5oSkFvTjliQ29wV3VSZDFEcUtLU01qaE1a?=
 =?utf-8?B?Qkc4aDM4cVZmNXU4d0VsU0g0VHBNMGlaRWxPc0NvejBOL3U1UGtCTE1NU1I0?=
 =?utf-8?B?RDZXRXQvZDBYc0NOT2VCRis3V2F5VjVUK3FqOU1zZ3UwWG83M3BPU044NG1u?=
 =?utf-8?B?OG1Pc2VUdnIzUjd2cUEwK1FrM2dGenhodEIzeTVVRmlGUVdLM1hRN0NsUlc5?=
 =?utf-8?B?Y0YxWG8ySTJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEpPYzFDcWlBMG8zaXdhY3Y3cFoxRVVGV2s5YjF3YkFZOUpWVVJWTFBGdzQ1?=
 =?utf-8?B?QmczcWtKSldxTDBRMnFVa2pSc2Z3RCtINUkva0J6YkUzWnlKdzdrVWx1dElm?=
 =?utf-8?B?emc0cW5tSDFjdDgzWm1VSzdnZXFuOVd0djA2VGJXOE5WNkt0aURCcnFNNzZI?=
 =?utf-8?B?dWZadlc3TWtVVjRBazRyc0xoa1dyLzJ6L3dYR09IYWFMS1hUWmVUU3R1M2Nz?=
 =?utf-8?B?aklVOUV0RHVaaGs2UmQ4dGJFQkFrbkVWZnFON2dQdHB3clA5SmJnWHJiT1FK?=
 =?utf-8?B?Qm1NeWppSWFsSTNOU1hWQ3o1VG04RC9mck1TdjFCa3dWMTdRWkFla1RTWWV2?=
 =?utf-8?B?NEE2N0daVTNYaitKZHFReHpIVVBneW9ocFZHZTdvNmlKaGdjTElTd0dwME4y?=
 =?utf-8?B?TG1KLzRIaGZpblRlNys2ZWJseFErNkxTdk5NY0s0eklIakZUVVVXd21HMThV?=
 =?utf-8?B?RVpZMkZwOVE0K1RmSURYRnlSU09tdTEyTk5XRWV1SkxUdHJQdnA1Wi9JRjVY?=
 =?utf-8?B?aXpKRXFkRCtvV3ozZVpOZ0RFRE9COEFtNmFXSmxYY0JuR0hWTnJDaGYrMDlX?=
 =?utf-8?B?Q04wS0VlMWVndldqNzJJRFpGdXhaWjZTYTFabERobXRVWVNXdWt4TWk2UW8w?=
 =?utf-8?B?RERSMXlyZm1YckJyOU1ocmN2R2E2cy9kRzBVelh0cDllbnd5bXBIYVp4K3NL?=
 =?utf-8?B?a1NhNjQ2ckZDTUFZKzN6TmdocTNiWGcvMmwrZ3o1dko4L3ZhM2gvTzFaeFgz?=
 =?utf-8?B?VGtBaTB6bGc4OGcvbHA0VFVyWmNkN21BcVYwQlFRVDFib25VVlMyVENHZmxs?=
 =?utf-8?B?SDZqOEdYalpqVkZnWWlsRzlXYncxbzBybEtkUFZicktPZE5ZSEhwckFXUE4y?=
 =?utf-8?B?TWhpR2NxbzVSeFZydGFaTFdtbHVzZ0FRWmVTSnJmMnhHTXZVNzJabmtMMXZF?=
 =?utf-8?B?UkRrR1IxbzAxRVh6R0lMZE5wbStwTGQreUZ3V1JZWFdXb3RhYk5LcU8wNGdh?=
 =?utf-8?B?RDlkcEZIeUtJOFJMdnRab0dnMFVRbUFVdEppRGRKSjVMekZTVENzVlZNYzIy?=
 =?utf-8?B?cmdIeit1djFVS3lneWtLb0x1M3FWQTNOVW5nN1Q4cEpnTks5OG15MnRxTkJv?=
 =?utf-8?B?cUwxOVhvYlo5NFZPVUFqaTIxQU8wSmdTc2c0RDZiR2VGdy9ML1lqSU5PUnph?=
 =?utf-8?B?TUU2bm5uMFd3SjVhK3hDR0xWbkVpYVFqcklpUmlPZVVucG5LN1gxYkZ5a3gw?=
 =?utf-8?B?QnBwQTlyTWpIdGsyeGJJbUpydnFJcjBCMTBoZUMvWVk3c0toSjVhVUtpTEs3?=
 =?utf-8?B?OFRVY1MwTlkrM1dXRDZkbm0yZE5temZtWU1CR3lBQm8xQ2MyLzVDUFoydTR4?=
 =?utf-8?B?TnJ6TWR6MHhmUkhVRUFQSjBjYjE1ZTZDZzVBSWpLYnduNmtVUUEvQW5ZbGZr?=
 =?utf-8?B?eU9uNm03WXU4SWJNdGJTeGFOYlRKWWdqU0NzbDZNRnNhN0tQSm5qdS91a1N1?=
 =?utf-8?B?c1pGdmZERUIraW5PN29TVFB5VW1SWml1cTZVbGdSOTZsSkVPcHBWcnZ2Ymdp?=
 =?utf-8?B?QXFrWDdnL2FyL0dQMjFvN1M1T3VZTGUrUXNtN3hoUmZKZWwrclFDL1pIbzFm?=
 =?utf-8?B?Z0p0WEVtaHpXa1htcURlWUwvaEprdXdPYUlSblNQVEJPTHh1WkExVEJxWFE5?=
 =?utf-8?B?cHNuSDlLVHExdmE5K0VPVU1mWm9IVkJhc0RzVVF2V0RLdy9ZVFNnV3FWRkdl?=
 =?utf-8?B?RGgzSmJCTk1lWDJnWlpVZWJYRjQrenNCU1JqbmJ2TGEzWTRxK2pMZmlSTmNY?=
 =?utf-8?B?cmowb25HUU5UaGNNYUpDaW9CMWJhRk1DcUhpL2hvdk1pUWs1M0svdnl2Nmlp?=
 =?utf-8?B?NmxaQk52WmxWQ3RHUHEzelFpOHA3c1RyY1AyNHhaZW5mMzNpbitTUXMxOHN6?=
 =?utf-8?B?R25HZC9DTUNXK0R0Yjd4NStxSDhHakxDRUVwR21ISllycFozaUhUUEdObkJ1?=
 =?utf-8?B?LzVYdjB0M1ZsSmhMUTRsVng3WVlreGluVFhWeEQwd3RwNE5PTFpaUDhZOGpP?=
 =?utf-8?B?ZTZWbW53SHpEVHpXMXU1bndaR0lzajhzNGZzRW9vNUdVNStJL2lJOWh0UWxh?=
 =?utf-8?B?dVlDczh6Vlk2bS85cnozK2c3aE4yc09qc0gvaHdtT0EyVHJhdGlhR084K0I0?=
 =?utf-8?Q?JEdh3EA0WJZpTLiDyQ7dZobc/vV3QgEgyti9rdqmhmDD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81be932e-d68c-4277-33e4-08ddaa7ecb24
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:32:51.2581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEGH0QmShNKbjmlYSGEldQrvEmb909A2jaYeBMcZMn9UrdTC76dVEFNFTOLRfVQgU4RACpqERH55crOVIUYdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041

On Tue Jun 10, 2025 at 6:53 AM JST, Michal Wilczynski wrote:
> The PWM subsystem and other kernel modules often need to perform a
> 64 by 64-bit multiplication followed by a 64-bit division. Performing
> this naively in Rust risks overflow on the intermediate multiplication.
> The kernel provides the C helper 'mul_u64_u64_div_u64' for this exact
> purpose.
>
> Introduce a safe Rust wrapper for this function to make it available to
> Rust drivers.
>
> Following feedback from the mailing list [1], this functionality is
> provided via a 'KernelMathExt' extension trait. This allows for
> idiomatic, method style calls (e.g. val.mul_div()) and provides a
> scalable pattern for adding helpers for other integer types in the
> future.
>
> The safe wrapper is named 'mul_div' and not 'mul_u64_u64_div_u64' [2]
> because its behavior differs from the underlying C function. The C
> helper traps on a division by zero, whereas this safe wrapper returns
> `None`, thus exhibiting different and safer behavior.
>
> This is required for the Rust PWM TH1520 driver [3].
>
> [1] - https://lore.kernel.org/all/DAFQ19RBBSQL.3OGUXOQ0PA9YH@kernel.org/
> [2] - https://lore.kernel.org/all/CANiq72kVvLogBSVKz0eRg6V4LDB1z7b-6y1WPL=
SQfXXLW7X3cw@mail.gmail.com/
> [3] - https://lore.kernel.org/all/20250524-rust-next-pwm-working-fan-for-=
sending-v1-2-bdd2d5094ff7@samsung.com/
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/math.rs | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c37f4da1866e993be6230bc6715841..d652c92633b82525f37e5cd8a=
040d268e0c191d1 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -85,6 +85,7 @@
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
>  pub mod list;
> +pub mod math;
>  pub mod miscdevice;
>  pub mod mm;
>  #[cfg(CONFIG_NET)]
> diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..b89e23f9266117dcf96561fbf=
13b1c66a4851b48
> --- /dev/null
> +++ b/rust/kernel/math.rs
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2025 Samsung Electronics Co., Ltd.
> +// Author: Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +//! Safe wrappers for kernel math helpers.
> +//!
> +//! This module provides safe, idiomatic Rust wrappers for C functions, =
whose
> +//! FFI bindings are auto-generated in the `bindings` crate.
> +
> +use crate::bindings;
> +
> +/// An extension trait that provides access to kernel math helpers on pr=
imitive integer types.
> +pub trait KernelMathExt: Sized {
> +    /// Multiplies self by `multiplier and divides by divisor.
> +    ///
> +    /// This wrapper around the kernel's `mul_u64_u64_div_u64` C helper =
ensures that no
> +    /// overflow occurs during the intermediate multiplication.
> +    ///
> +    /// # Returns
> +    /// * Some(result) if the division is successful.
> +    /// * None if the divisor is zero.
> +    fn mul_div(self, multiplier: Self, divisor: Self) -> Option<Self>;
> +}
> +
> +impl KernelMathExt for u64 {
> +    fn mul_div(self, multiplier: u64, divisor: u64) -> Option<u64> {
> +        if divisor =3D=3D 0 {
> +            return None;
> +        }

Would it make sense to turn `divisor` into a `NonZero<Self>` and return
`u64`? This could remove the need for the caller to perform a check if
it can statically infer that the divisor is not zero.
