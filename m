Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A747080D;
	Fri, 30 May 2025 00:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748566692; cv=fail; b=C84GNox9e0maYHB8BlGJ/SM9mL+4zz7FQr/IxbwTQDPLgQCXZa9tlckXvTC4hOYdqavA4ZfQwdvhO3z0bNvjBhiqqqv/A8OLbylwu5BgmYhw2DSytT0Xj6+tzfNtvs+GoLosU6Gg4TtHC7kWhoezI4h5OpalbgCMYQf++We8Ywo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748566692; c=relaxed/simple;
	bh=ge/VA0KMUuSnNUQP+v29XFWAgP0phLXVF2U0Y5hPcy4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KR6L4WogudZxKnGU7HRG1JvuxEkDyK7Aqj8ejEjKKaWy4NFH3mI+nA8JBy/EvAiaD9H0oKCIaVyywJR3vhgyL/i7C4XjgbVJZoOqticXFB2/drK/0ztcnUbmgo03fCwtfEJaJljInTaQmd5h+PMQLi3Nd/rMmEcPJbsktHuXA08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nh4t12aP; arc=fail smtp.client-ip=40.107.220.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nh4t12aP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2GS4Cg4sEXM5Ldql1Im+SaviZhaAfmMYNoUxRG56LEg/L0mqeNvMYTXtkr+OokGRhny2XlW1nb3S6ejI93KUyX0Rd80kXZAN6GeoLunSEW4czFpIUkFqM1vo9PmoTTZSO0QsULBOWy3le27Kdpp4yW66XHpjnW6moIbXiKiLigTF0Q6ndG4MF57U/zTG8pYA67zq0MqgDqaPvQpV7XCRwCtv+VwMbT8a8ys1iSkrIHOUGB6pKMf4GUe2eOc27u+PiqEhzvMU3fFmM6rhtW3CgsL5vKGtouInldnyk2mfofV1i7t9sx87mC8eMuR09P3v6se1i1q3c/35YjfeBngcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEs9YHwVQAPAM3SAPGSvY/1wB45EWm16twTP2vUQCg0=;
 b=B3SWcHsxqSQcL7lhFlI87YP9i2UyIsBOI6UzMsvkOOk3E8y3lbzaXLgHtngAwrg9aufRqixblJGnKGDJJywFKtuLo3Qs2jqLS0M7SPWmdxsq94A3lMDb05CyItUbmuAsqeSVaxRVMw+7vK2E6QCULqQaDRbocp45pjoSeFcVWwHjoR6XQVrR+hUC4uQm3jMFv1jCeEVGoKqmSzgteXBhbtnTiobqI2+aeVXe7Fc+8LoiFpRhHPm5V6N5Flv6vgNDeFpKvx/+hlIK8rrqdV9/a7JQMi7/GzN2leeuNVGFVxU7nTQE95UrCgKXn3wNkzTPGs90wDr08/RyEolow/5tBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEs9YHwVQAPAM3SAPGSvY/1wB45EWm16twTP2vUQCg0=;
 b=Nh4t12aPTzs6wTWgXWfI/WkFWFJ6PQ3gGbJBo5hbXLGgUTMrAc3aBLILHCCNrrM2fGw/tlYmvAzepPy3fVyWf3Bq9Nqa5MUC36GR1jQFPjc7fdoLCaEmmF+QLss+7+2AGRJlO5AwNT2lDe8TKVZF2Zhfcgqk61tf8ijJVzdD9jKeaxlY0ENEapgyUGIRrpOQ1RohlmN46XsyXqGG4eIqMt61OIPAXyBSosCS/DymyTjMOetc2j3Dt6zr+5bkK5AzgFE7cwB7mXmtMiKAEpVFVKPkzTKvd9OzKgRANeNZU1JCbKS44I7h2LTjQoH+W2OhemXTPSMXEmuY9LlNtAtNkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8783.namprd12.prod.outlook.com (2603:10b6:a03:4d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 00:58:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 00:58:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 09:58:02 +0900
Message-Id: <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <timur@kernel.org>,
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
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
In-Reply-To: <2025052932-pyramid-unvisited-68f7@gregkh>
X-ClientProxiedBy: TYAPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:404:28::25) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a5e4c7-77d1-4e4a-e27e-08dd9f15096e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHk5bEtYY2J3UFVCa0hoU3A1Wk1tdEtIZU5kcDY4Qk53Smt5SGtuSGVHam10?=
 =?utf-8?B?emhkUWlUS2d5a2ltZkR2Tk5acFdiWWsrQ1V0K0E0WDRYWVhRRkRRN0VPREtw?=
 =?utf-8?B?RDVRK0FUTDV1dTRXTWZSd0hjdEVBdHF3VW9HWUJLVVV0ZDRHL2pKOFdlRlBT?=
 =?utf-8?B?UUZ6VGZCWlhsRkFKYWFhbE5CUHV6ajdPakpIWXdnN0h0VzhkWElxSWM2Qk9U?=
 =?utf-8?B?Si9CZDJpc3VXbUxJaVE1NTlwZzJTSUpXMzBWczVmdVpwTzdGbWJ6VkI5c2pn?=
 =?utf-8?B?RXhaMnZDSW41b2Vsai9mT0hjM1EvYUdQT1U0R0R2dGZQMTNNZ0lhZ0VGQTlX?=
 =?utf-8?B?dS9ucnVma0o3MVV5anBMR1JVV3VMQU51eUlRK2Z0MTIxbFI4OFkraEJIV0JG?=
 =?utf-8?B?SngrS3U0d3Z6K3d6NjAxSUtqUzkybGw0bXRDeXdjUXZRTG1VMFZTR1FsTkVH?=
 =?utf-8?B?blNGZjdyajBLMmNSM1hieG1EOUhVMjFhdHNxenhaRitCeEhDK1JKVC9UWjhZ?=
 =?utf-8?B?aWd1QmpqTEFtdDBKOHIyamw0MGV0cElMRkRraVZ3RlA5bC90UXdMWkQyNG11?=
 =?utf-8?B?OFlIUURNdjdIM0lmSjJyaVMzam1nWkdudDIxeFk5akhFOFZGTnVYVms1Wm5Z?=
 =?utf-8?B?UjR3a1UxOUh2SGxzRW96SGZ2aTg1elI0bnY0a0Y1ZXdSU3J4Nzkxc016N0ox?=
 =?utf-8?B?NjRnWUgrZndFOWdwL3M1dmkyZlRwNnAybHJIeXNuZi9Ib05UVVdydG5KR1po?=
 =?utf-8?B?aThaZ2I4SFV1WjhFV1hpQ0RxbllBYmVCbzJlWDNCWC8vNlBmZjJ2R3IzRmxn?=
 =?utf-8?B?b2NvZmlPSE0yOGZHd2YxSE13aGM1cUlxYWpSaWIyRjlPU0JIbXU1TDNNazdY?=
 =?utf-8?B?T0w1K1ZSeUlta2NvcGdDZ2c4b1JET3czWTAyRytGWVdUL3lQdGFobW1uSklE?=
 =?utf-8?B?eWFrRjJzU2FnNUNQYVZDWXdFd0xnSjVkdDNpQ1VCNUFzS3VnKzRKVHZ1emRt?=
 =?utf-8?B?eDE4YmNXT3RBUHdqS2RpUllDa2dURjIrcnhJQ3FwWk41NVdZdEx5eC9YcG0r?=
 =?utf-8?B?elFMTHpsRWhiT3RucHdpZ3Y0bVgwN3BIeXdOZVp2TS81Y214SFY3d3hCcWdO?=
 =?utf-8?B?alU0YWlJL0tGNzh3ZDlYSzBxNzdYK0Zpc3VuRndOYVhCOFRlVUl4dUNLdngr?=
 =?utf-8?B?T3ZWTDZWZTAvbWJ5UzdNcDhvUEJ1ek5PdmVzdDZGMDhkdHpmNC91aW43ak81?=
 =?utf-8?B?eDZxSlFOTHlDUjNJOGZmQW5IR3VTSFRpT0o4QTd3ZEpkVkgyMHFSNmlkaUIw?=
 =?utf-8?B?Y0kwSklibDJ2NzgvUWpLalJkcWY2L2xQdnF5UVZGS09QcURRUDNYdnB0WWpq?=
 =?utf-8?B?Rk01UFErZzV4dXhjQ3UxKzdYSnRmdk5iQ1RjTEFtVTdVRWxVWjZZZVBESllL?=
 =?utf-8?B?ZVJvWGNSTnhhTDI4ancxaUJ1U25tTnowY1dsK3JtMU45REFGTm01amswTnAr?=
 =?utf-8?B?Q3EyeVphZW5MRnJwTzFUSlRRb3RQbWNuS0QwWnhGM3ZIdmQyQkV6REZIdzBO?=
 =?utf-8?B?end6R1AxTkJxNnZkaXp4UGFHdkNvbFVoazRSTzRjZUJmVVV0NTdWZmFXRC82?=
 =?utf-8?B?OElWRTVlWXc5V0Iyek10VHdsQ2gwYW5CaGU1WWpCclg0UlpRc2NveFFHU20x?=
 =?utf-8?B?b3I4ZXFMZmJTRTlJZ0ptNHB4Sm1DYlBoZjA4Z1dSQUhLb0tWcVZ4L3Q0dDZE?=
 =?utf-8?B?T2IyS2x0Wnk5N3hJVWM0WDVhSGlxUmo0NXhoZUJUbm5BdnVyVzAyNlVTRHd2?=
 =?utf-8?B?Y3ZuOFJXQnNybTM2eHNOQmlDY1hjYi9PaEc0bHRleTZ2ZjZyZ2p5VEpraDlT?=
 =?utf-8?B?aC9zQ2ZsWWR3UVNOWHFmS3c5eGdSaFlQUTZXbXV6czFuRE5iUEUxUGJkbVE2?=
 =?utf-8?Q?JpMhhxWRDr8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXhBTCtqY096RWhHd1daZDgrQ2F1UFM5L2NITzRIa1BJVGZ0bWZuNWxoSmR3?=
 =?utf-8?B?MHVLYk1QWHc0a1h2cnI0eUEyQW1HRWM3dGtKeE9UZmJkTGZtRkoyOGJlenpY?=
 =?utf-8?B?ZFBRV1Jxb3AzWkR5RVVoY1pvWWlRSGpHN2pPV3dxL1kzSmZYazByZ3RhS2tm?=
 =?utf-8?B?K3RKRC9QWC9ySmpQbGdKSjdnem5lUVN3QzhkRmZiK3F5ck1BdEdqeisxdjVD?=
 =?utf-8?B?RDQ2THVmdVdFYlAreVYxTEhINXF2dWpZK2FRV1lqckVuL0VsRE0zL0lmWElo?=
 =?utf-8?B?UU9iY1lQOHplSHUxYnB1blRDdkw1ZVA2clZ6MC81MHRMT3U2aWRvVTZ5ZkZV?=
 =?utf-8?B?QjdZdXFmMVQ2cDQ5c3Rhemp5UEp1TGdLS01QRWNzczM5dTdHZ2hFM3FrNVJl?=
 =?utf-8?B?TGNUREpDeUFWdFJiN2VLRXk4ZG5GdndYMWI5aXZ1S3dHczBnODh5bWtjUzNL?=
 =?utf-8?B?U3pNNDhaL3NEUVZhOFgwaXRnTCtiVGFLREp1dUIvdjZxWnh2UW1od1dTMWxQ?=
 =?utf-8?B?S0JmcVJlSGV0M3hCQTUxaWhjNEZUSzNMSTBlZDBJd2h6ZnQ2MURielIxT0Q3?=
 =?utf-8?B?QmpBZWl4bUFSZzR0akZtL054aUxwTDRTZ1lERlNZRXNNcXMrQ0JGNHVoeVVi?=
 =?utf-8?B?cEFJeHhsQ1FqYnJKUEdkS3l1S0RQSFhwcDh2U2xDQkdLaGp2SCtJQTFtaFVa?=
 =?utf-8?B?SS9lbHA2UHhMNkxvMnFRVnlLQjRrTXZScWpMS3pNU2JIK2w4WjFGcnBFWlBz?=
 =?utf-8?B?TjB5UXhkY1BOOFBVZnp2SVViaU1abzdnSTNRM24yTjVDK1VsaTJJSnJUeWhE?=
 =?utf-8?B?Zzk1QTJNQlFPNjVENWx2Tm5sZmZFTkhDYlpPNG5lOUxWak5tL01vSFJjVVNK?=
 =?utf-8?B?bTQzQnlTNGJTRy80a1F5Z3BIRm5GSVlnanpWS1Y5dFlEYmtoU1VTdzNZb2dS?=
 =?utf-8?B?bUdxQ0x1QzFSQmRSNlM1OC9rdUZyNFBVOGRzWGw5MDQ0bTU5MDJ1Sjh4OEFu?=
 =?utf-8?B?dVVwR3BzTXNTZ2tiUjN4VnlraFV3dU9WMHZQTEZtbUlra1hBWVozUEVQMXdH?=
 =?utf-8?B?Z0JJNFU2UytNTXBCYWM2aVlwQnFEc3lMcmVCaHg1L1J6YnhWNG0wRFBCVE9R?=
 =?utf-8?B?a0k1ZkV1V3g2eEV5WmRreE9iZS9KNGdVSElLbVJDbXAyeGxWZEp5Y1czKzY4?=
 =?utf-8?B?U0ZEelBjbWFuUEpoOTNyNGErU1VueEZWa2dvVzZWQ21XbHNDOWFkaTNkcVZP?=
 =?utf-8?B?NThORE1SRzlKaTZiUmlhbVdMMWlZODQ4T2hYVXI4Yy9UVEZnNGxGTmQ4azN0?=
 =?utf-8?B?MmVvUnJsRzc1TmlJY1JmWTUzWndrY0thNDRWU1M2MVpFK1dlam9TR3ZlYTlo?=
 =?utf-8?B?Vk9MRlNzbGFhWkhNM0pGdEtHVWVNT0UxU0kveDNkcjJNQWVsNXRaRHc2czlk?=
 =?utf-8?B?ZjFPVTlwY1NiUW5FNWhnMTRHa25nNjFrNjNET2VzYVBWV005NUNaMjY3S3BF?=
 =?utf-8?B?VjlHWHNhNGYrZXlSdWU0MXd4YjhBM20yUTl4Ni9pNS9ycTFiK1hpOFdWU1Ji?=
 =?utf-8?B?VGlLbk5GdFV5bjZDUkJsclpNRzRiT0swUFFQdWNiNnZCU21QUnFtRjI4TmFG?=
 =?utf-8?B?dW9KMHk0TzVOaDBYb24wNStMYkZFUk5HTW9PeUdqVDd3WDdlYit1RnBVbFdQ?=
 =?utf-8?B?emNWQWsyd3ZoWlM4SlNrcVVYbUZtTWVyZWQxdjBpYVJtYS9RZEhuQUUzTnpr?=
 =?utf-8?B?ejRyVFppR3NsenNiMk8xZ3c5V1N2UE9RSGt5cVNuTzlyU1Y3cDBOa3lPR1Zj?=
 =?utf-8?B?SS90TXV3UHNtakk4Q2NZVXg4UWZ1M0xZby9qNTNrVm41TVZ5NlJ0RE96UDhq?=
 =?utf-8?B?bDN6WFluV3JnanhHalpWVUlZOWpacjdhbDJEd0pBZm84UVJqRXpuei9VNTJq?=
 =?utf-8?B?TCtNd2dMa21ZMWR0NzloWStmVzN1bVg1TlBsaEoxWmFzZ2RiSFBLY1IyZnlJ?=
 =?utf-8?B?c1dZT1FzQWtzYmQxbXFsc29sL3B0WDdXdjdZak5aTC9CbW5pcHh6aW41cGdG?=
 =?utf-8?B?Y2dCTTQ5Rmp4SDhFNXFsWWdmTm1lR0tLdFI2VWhjZmxXZzJTWmYrenRRNzQ4?=
 =?utf-8?B?cG9hOGdKM1VoRXZ0QjlkSGZ1Wi9DRWdQaExsMlhDajZzTXRHaWpPWEtzblRv?=
 =?utf-8?Q?hVsxL5kshzqA5WQBGAUNuU1YPO3PRa/avuUIT8ExHZOO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a5e4c7-77d1-4e4a-e27e-08dd9f15096e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 00:58:06.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwG6CD/l3+NLBCLvqQ6ac5CDf6z6oOw2lGiApe+LJOeH9w4J4IZYt5UtGypehBOMaTMWdGNK1EiO+1DNG2QS/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8783

On Thu May 29, 2025 at 5:01 PM JST, Greg KH wrote:
> On Thu, May 29, 2025 at 03:53:42PM +0900, Alexandre Courbot wrote:
>> Hi Greg,
>>=20
>> On Sat May 17, 2025 at 9:51 AM JST, Alexandre Courbot wrote:
>> > On Sat May 17, 2025 at 1:28 AM JST, Timur Tabi wrote:
>> >> On Fri, May 16, 2025 at 9:35=E2=80=AFAM Alexandre Courbot <acourbot@n=
vidia.com> wrote:
>> >>>
>> >>> We use ELF as a container format to associate binary blobs with name=
d
>> >>> sections. Can we extract these sections into individual files that w=
e
>> >>> load using request_firmware()? Why yes, we could.
>> >>
>> >> Actually, I don't think we can.  This is the actual GSP-RM ELF image
>> >> you're talking about.  This comes packaged as one binary blob and it'=
s
>> >> intended to be mostly opaque.  We can't just disassemble the ELF
>> >> sections and then re-assemble them in the driver.
>> >>
>> >> Unfortunately, for pre-Hopper booting, we need to do a little
>> >> pre-processing on the image, referencing the ELF sections, and based
>> >> on data from fuses that cannot be read in user-space.
>> >
>> > I'd like to reinforce Timur's point a bit because it is crucial to
q> > understanding why we need an ELF parser here.
>> >
>> > On post-Hopper, the GSP ELF binary is passed as-is to the booter
>> > firmware and it is the latter that performs the blob extraction from t=
he
>> > ELF sections. So for these chips no ELF parsing takes place in the
>> > kernel which actually acts as a dumb pipe.
>> >
>> > However, pre-Hopper does not work like that, and for these the same GS=
P
>> > image (coming from the same ELF file) needs to be extracted by the
>> > kernel and handed out to booter. It's for these that we need to do the
>> > light parsing introduced by this patch.
>> >
>> > So while I believe this provides a strong justification for having the
>> > parser, I also understand Greg's reluctance to make this available to
>> > everyone when nova-core is the only user in sight and the general
>> > guideline is to avoid processing in the kernel.
>> >
>> > OTOH, it is quite short and trivial, and if some drivers need a
>> > packaging format then it might as well be ELF. The imagination DRM
>> > driver for instance appears to load firmware parts from an ELF binary
>> > obtained using request_firmware (lookup `process_elf_command_stream`) =
-
>> > very similar to what we are doing here.
>> >
>> > `drivers/remoteproc` also has what appears to be a complete ELF parser
>> > and loader, which it uses on firmware obtained using `request_firmware=
`
>> > (check `remoteproc_elf_loader.c` and how the arguments to the function=
s
>> > defined there are `struct firmware *`). Admittedly, it's probably easi=
er
>> > to justify here, but the core principle is the same and we are just
>> > doing a much simpler version of that.
>> >
>> > And there are likely more examples, so there might be a case for a
>> > shared ELF parser. For nova-core purposes, either way would work.
>>=20
>> Gentle ping on this, as you can there are other drivers using ELF as a
>> container format for firmware. In light of this information, I guess
>> there is a point for having a common parser in the kernel. What do you
>> think?
>>=20
>
> I think that the other examples should be fixed up to not do that :)
>
> remoteproc is one example, that elf logic should all be done in
> userspace, but as it's been in the tree "for forever", changing it is
> not going to be possible.
>
> Same for the existing users, changing their user/kernel api is not going
> to be a simple task given that there are running systems relying on
> them.
>
> But, going forward, I think you need an explicit "this is the ONLY way
> we can do this so it MUST be in the kernel" justification for adding
> this type of api.

I think we do have such a case with Nova. On Hopper+ chips, the loaded
ELF binary is passed as-is to the GSP, which does the unpacking itself -
so no parsing needs to be done by the kernel whatsoever.

However, Nova also supports a couple of older chip generations that use
the same GSP firmware -  it is for these that the ELF unpacking must
occur in the kernel. IIUC this has to do with the capabilities of the
microcontroller that ultimately does the loading (more capable RISC-V on
Hopper+ vs. older and more limited Falcon).

So the "good news" is that this parser is only needed for 2 families of
older chips, with newer (and future) ones not exercising it at all.

> AND if that happens, THEN it should be in generic
> code ONCE there are multiple users of it.

Ok, we can definitely limit this to Nova.

>
> But for now, doing it in generic code, that all systems end up loading,
> yet very very very few would ever actually use makes no sense.  And
> adding it to a driver also doesn't make sense as you can define your
> user/kernel api now, it's not set in stone at all given that there is no
> existing code merged.

Eschewing this from the driver would require duplicating the GSP
firmware (a healthy 26MB compressed binary) in linux-firmware to provide
both ELF and non-ELF versions of the same code, and also store the other
ELF sections as their own files. I expect this to be a hard sell for
linux-firmware.

Cheers,
Alex.

