Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09451D5ACF;
	Fri, 11 Apr 2025 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378360; cv=fail; b=U5kj7hNj2/FnnmUStyyl2XS04NqDZBQzePRJrWVvH7YKpNS4jaFRCS+ySKIcA8EQsi16BGovPYm/Srvp1Z3AcOjTKTzDqlWd5P1uFvMbjD6PH8SjiEq79HIiS7cbsK2iv/cTl8KYgFGwdZ6AYUhrfToejaAU8K0TXmDMaTi2Dv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378360; c=relaxed/simple;
	bh=L7YaPZek/+StylSfTbX03OG9pV+YBRygeKLkIrw7uTY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tM7wObM7lvJMOnEPMG+i8hpKKy1eZKwAw3mD5otZWLWc/p1i5Thl+RWNxxn7F0Gn8G+U7o8qlAKZK9GpVNkDrFkXpoEz9MsvHgucpXLbn+N+QmU93aoqY3vxuQHf3Q1rU1yn+1glPbORLTWxYLRvILoLU3Fs6pC/ACzeS6SYuDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jbxAQLzp; arc=fail smtp.client-ip=40.107.236.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jbxAQLzp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gei4SRf7+YkQlpxVvjLlvnt4frxzXDIbXXoRmYsNRz1tW7WhKPuqrJEzTA/KChH8AEPYEh3DHH1vDpown+cr9/SiK/hYv9Gd+potizQuIQfHlHzV87Jz/MGwvFgI6QG6OqHsHHeD0RMDHqf7scKgf+Un8c3mC+NMDbhrNx9C5ZshSiAEs6P50BNnUsaz/bmJImvajj1wMUXXrvCXSWwy4mz/LXp0kyt4vzeMNidkUmw8rafVC+83wBeYw6AWRQ0RjiheoU2ZShsjZoYu7+qvSOsmSZP/fQD00XllR5seSAH1MMNJhLfQrSuvKrxIzi0I7QAgpqw1DqeOYc7oyQWxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVymckmImNAcvuYXvF1B4p+7oFtYb2RW+QHcFJZN2cM=;
 b=X9gFwAoKK53RzEtp9Twm2rfqxSD6l5iD2XTWHxC9n0WnWlUgDxXJPLgxqKUYQFvRPjmhvefPuLvc0FxH+fPmxLmP9K5/XOGOvUQW+xazbt38jI5AUE2iOxSo0kqlJW7De2skvVObADbTVqURxgWhTEHKocufNZhMc8TDAhmaW8KqIV9mkowI/j2PJ0ZU8n15alpCzWIaG7vbQMUOf3CwWE9Butil9R53yDInbNj1QFA2ubWExVPmb0SJw2nPNSgKRLxI7JbXJAzZCCYEkA5u/rSsW7I3kfAXn7vdBrL2gncVapYVigs0cTZYZtZSXS5sF1qt4tfjEgMrf4SNK57TJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVymckmImNAcvuYXvF1B4p+7oFtYb2RW+QHcFJZN2cM=;
 b=jbxAQLzpXjHwVdosE67H74yk+DUjYNS1U/VcpoKUIzi4oG/YzM38jQJkoduyIVibNDrS6J5aFi5A2astKaVWl9+Zf8nB+Qn0fORZeExvJeqs1DST32TNvsZBhk5OFzKdy52kZg9cgtvaPfBjWupA2CPb4Bp9kmsox1sNNHiksKibHXxwk2s04xxKbQ61ht+TwXjggmod1h0x86yBcp8n1Y93GKcd6nW44bfUiFtvwkFpbti/SkDV8v5XSf5DJlt6oWO5bZsacQTlMqpvZDjx8tRa4Sha4eZ//14AQ3G0+FP5656vTsoUIQ3uGZhCWLDRfZUVeD8VSUWFGveat/0jiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 13:32:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:32:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 22:32:32 +0900
Message-Id: <D93UIO9E7HBY.3USCKDO42JP5C@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: alloc: allow coercion from `Box<T>` to
 `Box<dyn U>` if T implements U
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <benno.lossin@proton.me>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
 <D93TGVDQS6B6.1V6CKR5QSEWF6@proton.me>
In-Reply-To: <D93TGVDQS6B6.1V6CKR5QSEWF6@proton.me>
X-ClientProxiedBy: TYCPR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:4::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 179c4027-e3cc-4a9c-ee5c-08dd78fd520e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjhMaWpoYmxDaklFUlJBSTNmTFhibXZqSlZzd0RRdndrNy9xNnRUeHNiWGFT?=
 =?utf-8?B?R2lLd2lGbEgrRFpadGVadzYrcjY5Y0piV28rVkFtbWQ2L1J2SlZoa0xndWRG?=
 =?utf-8?B?L1lGTE1kTUZFemdCVTdEL0d1d2tYYndxdTZCQmZWbnRJWFVYU01xOE4waTk3?=
 =?utf-8?B?M3ZQYWw3RFdhcHJIVS9aYWxUbjdFS2F3VmdhdTBwbXBBQ1J3ZWFLbGdxRUdl?=
 =?utf-8?B?amd3cFlwdWZLOXMyQjl5dkI0T2dzRndYVmZGU2tQVmsvVG9HMFd0YUgwQ1la?=
 =?utf-8?B?akdJV0l1UXVrZDM2c29JTmFZNFJvRFlzTE1hYmNQY3J4TWw2T05aaklaUFJw?=
 =?utf-8?B?dVpJOFlxWVJUdklFem5hUTBwa3JLc0R2V3RxeVdNMVVvRmw5cnZlbHFMMk8v?=
 =?utf-8?B?OFUwQ05XNTlKaS9rdWRKN1RIM0hrelRWbXRaUTFDQkdmRGdWZXliRkJGT0FR?=
 =?utf-8?B?T2p1WkYyNUJ4VFltUEs2VWUrTXZ1aVZxb0M5M3E0SzkwOXFIRWh2L1oxQXg5?=
 =?utf-8?B?QVF1RUN4bHpGblZwcXBRZGltWnc4bXhBdzB0WTZ2aDA5OTlPN2dCWTRpV2tn?=
 =?utf-8?B?S0pmWUNoZ2I0L0lHWG1Fb2YyVWtZd1NaVVpDdm80b3VrS3BNM1JzdVZSalN5?=
 =?utf-8?B?SFRDV1EvdWl3RWlRdUNpQkhWdmFrNEo1NkVNTHRHcWdpREdwUkdSaTNRaTRJ?=
 =?utf-8?B?dmlwcmczT3VLbFJYU1RGZlY4Y2V2QVIwWkdnSjVSNDdtWG9oRU5FNmtLYzdT?=
 =?utf-8?B?ZWpIY1o2b2pOaXA4L0FmaHFsU2x2YkdXM084WXJWRXRiRkZQcHhsR0Q1dFg1?=
 =?utf-8?B?R09KSnpPNnc0azcrWk1aaWx1L3VvRU5hREpFcmRGVWd2TE1wR084cE1aSHZQ?=
 =?utf-8?B?SUtpZDBtZGlSR1BlRXdhN20ydzFJMGlTb2xzSyt1QjNBV2REdGh5ajlhNmtJ?=
 =?utf-8?B?MnhPek5ZZ3JvT1RMWG1GMXNLMkV6bmFQN3F6NHRHRnpRWThiMVk3L2E2YnRt?=
 =?utf-8?B?UXNGSEdPZlZ0NXFNYnNNRitRUzd5VmF2SlNPb1AyYkVyOEF2QzdOK0RFTm1y?=
 =?utf-8?B?bEZIVm1TNjMzVEZXTCtYUVFkOUFReHlmL2xQOXEzbldveG02U3BmaGxYTDNh?=
 =?utf-8?B?bGtkYzMrdC9VaG54OXgrcU9ON3FmOWJDMGRxR2YrYU1wY3h3T29kMU1xcHRn?=
 =?utf-8?B?N1Vsc2xjTDNBTXB6OXE2TklWZkd6R0puNFdsNDF5a1ZyaEh6MHlrdFV3dFRG?=
 =?utf-8?B?N0hxSTVVUDJ1SFdBM1lnNUNJUm11dDZEOXl3NStFZDltR1EvVk02dkFSa0FC?=
 =?utf-8?B?T3JBSGxqcVBCQ3JTd3ROOUZDTkpaR0xLK0FPa2VLbmZHV1ZLaXoweENlWVZ5?=
 =?utf-8?B?dk1YaDRlcGFXYTRscFcxQkY0eUE1NU96aUp1WVJuMGlaYW5KTklpOTlVMGtB?=
 =?utf-8?B?ZWRVWU5qR2FscUcyZXhiMFV6a1hycVVqS0VnbVVXOUplTVRHcHJmUUtRbWVS?=
 =?utf-8?B?MmZrcjdqYjUwM1d0QU1DaGpCNjFxY0ZDdkVUT3VRWTJmVWRIRkdvejdYRGIx?=
 =?utf-8?B?UFdFaTNtNnNNK0RsRFZUbDFpakdUVUtHT0lJQjlwbU1OUm8xbFk1TmNPdDg0?=
 =?utf-8?B?djZlMFpsZ1h4dTNZTXo1V01TWFFBVUxLQ3AyZnc0V2h3a1F0a09sRG5zNHRE?=
 =?utf-8?B?QlBGNXQzNzIyY2E0aXZ1N0pPd1l1a29RYWt4K21VemNPOFI3WER6VzhkL0tt?=
 =?utf-8?B?eWl1RUZuUmRCZVA4L3luWk9SM2tzbzY5MzVrRk9CR3ByQ0QrQ2t5MzVXQzBK?=
 =?utf-8?B?V1dDNGE4UVU3R0FRRWlnaFFhaDJxc3BTZnRBbGdFK0NjOHdMOUN5MkJLaFdt?=
 =?utf-8?B?bDdkaWR1NlVZNnBhVVRYSStqRkc0WHcrVmV4Z3FZYUNZUXNRZVE4d0ZYV01E?=
 =?utf-8?B?b003Qk1KWVNlU1REZTBnOVB6eWZiSnd4d01kSFdXM3RrNnJUTi9oNTNNWmZl?=
 =?utf-8?B?ZnVRZERCUk5nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVFRTndGSFdVQjkxNmxYVGt0Y2o3SHBSOXlwc01UaTRHa3lnUG9FZmdoc0VR?=
 =?utf-8?B?OHFXbitTcDNhS0U5K3pLcWsrYUk1c1c1VnM0VytscUEralNubXlxS1hlbWxm?=
 =?utf-8?B?SnptSGd4UHloVmd0K0VhZkZ6ZkNxSXVYQkY0NURSc0JiZEQ3NytmVlR0UEtD?=
 =?utf-8?B?VnI5bzlWbm4zd2lHZFgzdzBYMW05cDV4S0pxZ0VBYkl3SVJZZkhuSFhKVFRp?=
 =?utf-8?B?TkNXL0NWb0N4ZmhKNGQwM2VCcWoyRnBsUEtaTHR1Qlc2ZGRTalorMCtpMHZS?=
 =?utf-8?B?UTE1dDNYd3ZnZ0hLSjB4REdaSnNSWkRTeXZ0UGg1R1AxczZON3lRL0pMOGdV?=
 =?utf-8?B?ajR4cU94d0ovZjR5dGppUDYyazNwV0tDakRsUWFoYXRKRG10dnl0SjZpeWJX?=
 =?utf-8?B?Qmk5M1dlWmFVdkxFczR4UmF5TllsZkgySDNIRlNzelBMSjdpWHl3bkswcDlN?=
 =?utf-8?B?bGlVeWpHNGtYamNBakxxYmFhcDIwd2ovRWJpRTZvbm5wTno2ZnNMcTQ0TGxH?=
 =?utf-8?B?ZW5wVWJwVUhKU1NDVkJkcXMvK2FhRHJnYkV0NDZKbCtkaXl5VnpyWjdzc2dQ?=
 =?utf-8?B?U1NnTEFHMzUydGk0ZEtlTWtDYUxvZFVzejhFUEdndmFZSWN3emZwSW5tVk1t?=
 =?utf-8?B?Z21wd3VweXF2NUlOK1cyeWRoZStTa3Q2anVDbmV5d1BmbGhEZFljOVRtQ0NO?=
 =?utf-8?B?MGV3VDlLRXp4RDN3VVRUdVFQV2ZZZGdwVFBRL3o1dGp0Y2NIOW1CaU4rNzMw?=
 =?utf-8?B?U1dYcTFmb1E2cktyTlI4TTB1SnpKQktCWEhLajhkc2ZVOUg5RUJlYmlBNkVY?=
 =?utf-8?B?VWlXVFlTeXBPTms4RTFLajVvZThhRS8yVlBkeXl3dDdXUkxVWTlaVkwxR2hw?=
 =?utf-8?B?N090VmZRU2pHUnF6QjkzSW5pZ3dIVmp3MVRwdzRPc214ZW9tZjI4UW9Ga3pa?=
 =?utf-8?B?Ym5iZTZtem9rS1BVUy8rRGp0VWEvQ2Z6VlY0cVJEZWxhNks4eWdDUzY4WjQy?=
 =?utf-8?B?K2RDc09TaURvSE5hM0FDelVScU12L3BIVVZYYWpJSS9MTm1ZVzgrQjhnTGRO?=
 =?utf-8?B?OE02MmRyVFVSc09YRVJMK1hkVWNiUU5vb2tCNjUwekFnaDN4bzBXOThjdnRD?=
 =?utf-8?B?aXhZQUdpK01yNXMwajRxV2NxQnZrUzlJMC8yYzJwQjFDUi9uNytTYlZDN0dG?=
 =?utf-8?B?WUtZM01ZMmZyWmh3N3Y1REhjWUxEb0NGTDRpNjlqcW80eVRKR2o5ZGtWcWQr?=
 =?utf-8?B?c3k1djdoVDE3TEJYQ3YxYmZNZUNxRFRkTDRoTUVaN2d4cVNBbGQ5ZHZoMzdr?=
 =?utf-8?B?RE1zejFSNGVCb05uMi9jRVlMeU9WeUtkeUNtSS9hOU9yci9pY3NyVEpuUHcz?=
 =?utf-8?B?RUtlTVJ0T25lK2UrTmJmL3FsdDFNVmNWSUIrbTBtdmljVGR2eVVBVnBxSFZU?=
 =?utf-8?B?ZlZmeTBpSjJOUnl5YkZXU0sxTFdCSHk4QWhuK3RmMHlkc0tWTmNydGNsVWt4?=
 =?utf-8?B?VFpKK3FQN1ZIZ1huWm8wak9ZWWtjbEZRUzdNT3hVQUpaa3pDaXF0aTlHN2xs?=
 =?utf-8?B?T0ZvMjhaMmNnemR3NEVUdVY1NG9BYnY2bG0wd1pwcXhTTnV2Q2RzQVk4aTht?=
 =?utf-8?B?anBBQ2xRRmdKTHJ5d2pDZGNyVWJlaW5rQjRhWVhzYTFsaEpHQzZwN28vb2RE?=
 =?utf-8?B?K0ljRjZyeUVsL0pHZDJHdTEybmhINWt1WFVMdjVQMG1JeVlJTzA1aDV4UEM1?=
 =?utf-8?B?cXZtR2VQZlRtcFNhN2tQcnlKTVVxNWRiQXp0UnB0UitNOGpXdmw3MmxDRlN3?=
 =?utf-8?B?T3JiOFRVcmFCODZhdzhrV05DOUJxRGZGYVZPRlZDd2YxRDEwNTdYNVJwTjYy?=
 =?utf-8?B?WlZROWxQZmRDMnBGUzFLaE52alY1U0RTcVNSblBMNU5LZzBXY0hHdnY5a0s1?=
 =?utf-8?B?QXh4ajdCaFM5TjNmdldpSTRNQ3I0dUJ4TUthOE00S2N5djhpTDYzcXZ3NnY0?=
 =?utf-8?B?UFZvR1RrN0RzcC81Y2hEUjJwN1d3Y2dYcHZubUxKT3lCL2JkNk15Z3A0elBv?=
 =?utf-8?B?bDJEeWhJekZiZ0x6WUhIOXRzYmRLeXJ6UFFyTGdZN1dNWms5RzhLWFlBVzYz?=
 =?utf-8?B?MmJaVXZHbkJkZGFkNVNHUG1UYS9wWGV2ZCt2dVlsRVowbElENW9oVjkyVGp5?=
 =?utf-8?Q?353sJVK9gx7IBZ6LQui1yrx5rWMAwyNRVlUG5oE3uF37?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179c4027-e3cc-4a9c-ee5c-08dd78fd520e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:32:35.6596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owudpgQzV2nfzB6G2ZJwAo2oCCAlq9X5YwQ7U6bU1BeA4B+TSpgFd9qjQdZaa8WQBR20QJteegyGRi5PyqCBqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

On Fri Apr 11, 2025 at 9:43 PM JST, Benno Lossin wrote:
> On Fri Apr 11, 2025 at 2:07 PM CEST, Alexandre Courbot wrote:
>> This enables the creation of trait objects backed by a Box, similarly to
>> what can be done with the standard library.
>>
>> Suggested-by: Benno Lossin <benno.lossin@proton.me>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
>
>> ---
>> From this discussion on Zulip [1].
>>
>> Heavily inspired from the similar feature on `Arc`.
>>
>> [1] https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/top=
ic/Trait.20objects.3F/with/510689662
>> ---
>> Changes in v2:
>> - Use where clauses to improve readability.
>> - Fix build with rustc 1.78.
>> - Link to v1: https://lore.kernel.org/r/20250408-box_trait_objs-v1-1-58d=
8e78b0fb2@nvidia.com
>> ---
>>  rust/kernel/alloc/kbox.rs | 30 +++++++++++++++++++++++++++++-
>>  1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
>> index b77d32f3a58bab5ec73c612bdaaba0d79bfdff65..b9a905cd4bd285782b0db284=
b6771aec03e0c10b 100644
>> --- a/rust/kernel/alloc/kbox.rs
>> +++ b/rust/kernel/alloc/kbox.rs
>> @@ -32,6 +32,8 @@
>>  ///
>>  /// When dropping a [`Box`], the value is also dropped and the heap mem=
ory is automatically freed.
>>  ///
>> +/// [`Box`]es can also be used to store trait objects by coercing their=
 type.
>> +///
>>  /// # Examples
>
> I agree with Miguel, you could move the added line above down here and
> also provide a simple example.

Oops, I completely forgot to address Miguel's comment, sorry about that.
Will send a new version.
