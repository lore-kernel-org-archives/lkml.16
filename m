Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967C92AD04;
	Fri, 13 Jun 2025 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792920; cv=fail; b=DephCrm4hZXNLkGV9YdErToXcqSQz91cxJfqn79ZRPCU8yfeeurBM9dfnj2qSF0LFqHh1Hmeyll8U7mVsc+jXNFFMRAv0ZKeKhxCtyvAg2nuOS0RnWaed8pQN8tpE8+tsco2w2ceTB1wDVfayevdet+2EVtQHNVOA9jqW1UG6fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792920; c=relaxed/simple;
	bh=ihB6mBVVAyg/BsUssDtW5JFhsNzpqjCn9kKYrWUoG1M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ql3w++QxAnR+A6OCUFy2wLKqAX6QTO8ouj3VIKCnfp1VU7c9KGwdy7JiFEhN6Ocr7kt5OhPxVmecl0BqQgJT88VcjYXRH0qnqq4FNft1HcBVANAeN99SIyAVKnkXL5HDxxSjUeo5POB98ksJKxrHJyFdwHcTacds7dFV8iri7Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EhivBDPT; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EhivBDPT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju0CJSEgVtWRlSxRTniQ8rkMRhXt+xNF0vgfLxNED4w++xJAQ1zzx3M2jKF5EZGGfc8S0q7+vo6epwT6J8ygqizzDOXvUrWSKYwvrviQ9eItwuXirhbmKox6updDMTcgTgOtntlqZUJ/qe0Kcp0JWT8xWXuWfdn6l2gq2GSQ/YAz9KTwHZAHd0yOkkcnbBUwyXLPSTDbUJDYMYTF1I2GsuQr70hC3m8U0YExz0NwFTKmTMR0Ra1/zFrS00sb2AdS5TGAFCFEhef/lrcxIvUWs7QqEOykYvbfaFZLG4On+dyWl2ELV1cFZedLR2SKSovXnCgZw6w9PlK1uLm07pDeow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN41J0y8b45HovYcKJ3h8gzRahLa2RZXnCQTvKSrmFs=;
 b=gk7m0GEoZMxVhzaCM7yvQ6EMjAt4Sl/J7KgPJ7pJp77zcTB0ytCTHBTJV2rII7exS6W35/+CUQYkmnn3AGHmXr1/z0O/Iv5cQDTD1wRahXQAsTiA6fRk21TJTNf6bpLb8g1+6Q2fGl3C5TqI6p7L5FtPLQ7LyAIfH7DA4E4U6j1b+lFUugxiJp7HcczmpXUjlBRA4cW4HMKdLYRR65uojPELjeknCq45+BaPOFmf0pJrixAuwaSLBr94zhYAxQfFqfjRhb7CPK091VrhpKVkbSfuQTuVQGtlGjQ4GmgAYJ9Z+XlnuPHBLLHMKe14nmv7gue5Xq936laglzfuEl7BDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN41J0y8b45HovYcKJ3h8gzRahLa2RZXnCQTvKSrmFs=;
 b=EhivBDPTONSaJl5DN80GmtcigNyaoQz6lb++CxJJYutvh/QkZ9QNcqXl4VuSxBdRGfofy2LnvSnMYluml76KdHHcS7ttHSaWsQTbc2M+bhzQrajLyCwCrml+J7+EKriY/AtYvtLHSPm3JESUl3P80JJAASyecnQ7dyBYvOT70yYF79hMAsWcoqKPn+azw26S97V1AnmD7NAF5SE+zl2gIHZug+jtKiwM6Hk26YnhWL2dBVTgxJk2IGeLXsxG4RnbXOgeOoRkrQ6T/cLsA/nfd9o8b1Z2m6FB2QuRZgL9YgXIZj721QD9f8WjnhcC7PSEIQVmTanMWiqCHOoNRBw21g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:35:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 05:35:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 14:35:09 +0900
Message-Id: <DAL5THET602V.345BOV2PJGATF@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
 <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
 <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com>
 <DADKPKS4EAWU.D1UJEEBXKS8R@kernel.org>
In-Reply-To: <DADKPKS4EAWU.D1UJEEBXKS8R@kernel.org>
X-ClientProxiedBy: TY2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:404:56::30) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: eea5998c-12a5-4f12-daf6-08ddaa3c1161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUNSckNjODE5NnQvdER2VWR2SkdhYjc5bnlrU0EwQ1lBUmFHek53bTFWTlV1?=
 =?utf-8?B?cU05MkRJQ2ZMZnlwZVlLbzZPYzB2MXFBWmk3RnlzeXpiNnpyK1A1NEtiK2w2?=
 =?utf-8?B?UGV1YWtKOTdvTWhVcmt3OWg0THB2eDRNVHFpZkREMU9KNDliUVhNUE95MUFr?=
 =?utf-8?B?TmhieTcvZEQzdHRDb2RnV1Zwa0tna3Y5a3FoWCt6MmppUlpsclVVK2laU1B3?=
 =?utf-8?B?MkthZFI2U1FxcVBUVTd5WEdIdFlweEJQMGlSazU0UTFxMzErMzVrK0o2WTlr?=
 =?utf-8?B?ZTFUVHQ3RlNQTyttSnZyRDFaTWRQSU1sT1FkVnlUUUdqT25jRlVNM3QrUUdm?=
 =?utf-8?B?blk1NHJkWXNMY2IzNTFGZXpHVVNjWnBqVFI3OVVHL1F3ci9hR3J6VjZiSGg2?=
 =?utf-8?B?R25sL0ZoZkpwZzNxbVRUaytwZDV2OUFRZHBremY5bkhBNm5XakNCY3ZHQXAy?=
 =?utf-8?B?MWk0QStERWE4U3Z1dWpaMEYxcGxwaFlZVjFnR1RmSGtlSXJPc1Z3OEtUYTJN?=
 =?utf-8?B?MUowc1JWWGpxMjFUUCtVd0NDa0xLVnhJeG9jUTlKcVIwU0pvUlBQc3hQVzRj?=
 =?utf-8?B?Zlh3UW0xWFNvSEZsRW9ZSEwvdnhOMDVpb2ZQQmtFQy9YeGJtYWJOQlJza2hu?=
 =?utf-8?B?WHpGR1NpM0VjRzAwNGlYZ2s3MXRuMGQ2VGY1UFdZN3RxOGszcjhQMDFYczVj?=
 =?utf-8?B?V3BUSGsrYTVlMzMxOWFaRzljbmpnYkorY1plR05ZckwvYnlWNnllaGRGdDZp?=
 =?utf-8?B?VTFwaWVlbUo0QmxiWWgxUTB6RXRhV3BGME5lemxoeHpXZXFiclhEUDVaYUo1?=
 =?utf-8?B?T2NGdUgvTnV3SWFFNGQxdVZHUnNFUWxVc2MrSnJ0OE9qUm5wS2w1YnFQUXFY?=
 =?utf-8?B?Wkhmem82NWtLWWpiVEFPT3czUm5RZVhadVN0SmF0Q3ZVRmpzNjJyU3lVcDRh?=
 =?utf-8?B?RW5jUDRyckZDck1VdTBGVVhBVlpXMXFvK2FtM00vMUtCMGdGQlFTR3FPVFMv?=
 =?utf-8?B?VXVJc0dCZVZCem1tTkpRcVJmd1ZFR0hoYll5Qnl5VVIrL05UdHBnYXZoVFdk?=
 =?utf-8?B?SnZzL1FnWWNiVlFGY3NhSko5RmdFaHJNWDNKVXFCR3hOOWFTV1lBQ3FzbkNK?=
 =?utf-8?B?NkQ3bUtmQlMzdjFuV0Z5c3dJMmVzVDBVWXl4Z1A0b2VqODNoTS8rMFVhYUd4?=
 =?utf-8?B?VDl6N0RxZVV5ZjN3MXlPTzM0K3Y1OUgyWG1FQnJmUi9FbE9FRUlXZ1FkbWo2?=
 =?utf-8?B?a1NQQjhmT0Y5TDNZeFo2dXNwc2pNTnJPS05taktaMk1nR2d1OWpqS01BRzZZ?=
 =?utf-8?B?NTdmWjV1Z0szK3BURXNBVjgvQkZSZEJWb0NSbXR5Sk5QcFVPaDJ6T2x2OVZJ?=
 =?utf-8?B?cm1UcU5NRnBmOEZnUHQrcDF1M005M294UFN1VCtCaWpXeUtTSURlZXNhSnRS?=
 =?utf-8?B?WE9nbU1QblRxUGFiWXYrci9SZ0VBcHE4K2dsQWFsbEtaVEJ5QUlER0hlWmZn?=
 =?utf-8?B?dzNReU1SbFZFc2NKazJJNGpacjlEc2owd2xZR0UrZDZVNkNSZnNSSVU2WTVs?=
 =?utf-8?B?Zi96SWowaktrTW92cytuOEVkemdLdDFuZzJKZEluWThzcm43bnVVUkJVVnZQ?=
 =?utf-8?B?TE84SWFiczJ1MzQyckhDSGRBSTd6ZlY2MnllMk9TWXFueWdGbU1vWmhhaUJq?=
 =?utf-8?B?M3p2bnNSSFVCVGVhK3ZTRlNqek5reE9xbFR0S1BUUVlYcjhJNEw1M0c1ek0y?=
 =?utf-8?B?MFp5amx5all2R0Rqemh4S0NqUjUwaGZpQ1hwTklSSHZLcEV1eUpEU3RRRUZl?=
 =?utf-8?B?dEhVQzRhT3c0NDhvNlQvSEV6WWZwUE8rQWhlMGQ5QUg3Vk5lQkVpdTZkZ0tB?=
 =?utf-8?B?Ui9SM0lnSmQ0TzhwaW9nZ2FhZUVhaEloelQwUGhvd0N0T1pUd3MwSytMN010?=
 =?utf-8?B?TGpKamVwelVGVEVyQnF0OGlSWWlHaEdDOHZsZFQ4cms5TjVJNmZSZ3dIeTNt?=
 =?utf-8?B?bUJrQmovTDRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXhnQjhTcTN0MnNjQXErRXdIdENnYTVBOG5sUTZmMFBod3I3LzFnTkdFY2Ev?=
 =?utf-8?B?Tklod3MwMWZ4cUFGazlBcUROTW9EdGtZUlJpTHZWVTJtcnpsVHpFSFZXdXVt?=
 =?utf-8?B?S0ljdU91OTV2cVhoSnkvSkN2cHhuSVJJTXhJa0lUM3dNV0wwNlBqZmlrcytm?=
 =?utf-8?B?TXZGYWxtNGFzQy83Y0VyVFB5VSt5dCt0ZjFJWFFQWE9tQUlhKzhEUC9FSjIx?=
 =?utf-8?B?bjBhek9UczQ3TXlDOG9aR3IzeVQrWXRoZVlGRlVrWjJycDFFN2VBd2RZaTd0?=
 =?utf-8?B?eS9JUW1sWXVPOGhKcG9haHJER1kvOGlZV0lQZStaNnB1dHhIM25ISnBnenNM?=
 =?utf-8?B?TXZ0aUhrMVdLclpOL3dtMEQzYWxrWUI5RlZNZU5UMkpPUUt3MXczTnpITFg4?=
 =?utf-8?B?M2UvOWoyN2Q0cGFSTkdiQWJkTWl1bkt4a2ozRnlKRzl0WmZzQ2EvcndJWlpO?=
 =?utf-8?B?YXVHUGJ1TDAxNi96OVl2UkZRMXJCQXdreFBINWU3TlZuMWlaekV0ZnNLS3Rh?=
 =?utf-8?B?Uk9aanR1ZWlMbzE1eHhGd2lsRXJVbjlZTXVtTFNVazM5WEZqK05WSVp2b1Bs?=
 =?utf-8?B?UXI3dnEweUFINzJsMHFoQWluazJ5TllUdHgvMUx2MEpINGQ3bTdCMnpHd3Mz?=
 =?utf-8?B?cjR5UmR2QVpVcFZWakpFWWx1L25lLzFTTjdneGdOZEdseW14TG5qcTdRQ3BN?=
 =?utf-8?B?d0pHem14WFlvMnBvK1RMUWVCMDlhTFAzaWI4NVVxR0NFay92VXJCL1JhZWd2?=
 =?utf-8?B?ZC85dEFsVTlncGlFU0xNbHNJUU1hTnkwY09qRFpacjJ0cjhIRkVLZjZuMnNY?=
 =?utf-8?B?OW5qcFdoMWZ1c3FlOWRnU2JVK3FSV01QaVNkckI4V2F0bzZFcHozZ0xick9k?=
 =?utf-8?B?U2pMcHVhM0tRSzNQckVzZE8zeWxMYjhueXZQVnlQR3FTaVdETWw5OUNkbnRN?=
 =?utf-8?B?N0hlMjhyK2YveHNLendTOC9qVVV2ZVhQMjNJYzk0ZFFzK3hQcUsxOThwYTdu?=
 =?utf-8?B?ZUdVRGtIREN0SVdrVmpQZ1pmdThzWFQ4WEhpK3V3LzJPRWpBVUVXMVlrVWlv?=
 =?utf-8?B?R2tkZHBxUjdETk9kdDlOcVFZMU43VWMvL0xYQ3Z6M3RvbUd3TzNSSSszalUx?=
 =?utf-8?B?emlYZndLaTkzZWJwajNyclZraWFkMmRwTDk5UHRlNmd1SGdJUVNNMktPUHU1?=
 =?utf-8?B?SWNMMFhRaU9meGZscWlZUllxcnF6M0ZTS2pIMWQ4Z09acnpZSVNwV1BsWitY?=
 =?utf-8?B?dnFOTGtDWU1SQWIvcllsa0l2T0JTT3RqRlc1RVNoNlQ2Si9qN1FOc05PU3NW?=
 =?utf-8?B?cDlQZGtXNnpwNk1LSEwrY0pnS1ZKV0FpSUtSbDlOTkg5Y3VmQnozUEpBYVRM?=
 =?utf-8?B?dERJNHpTcmFhWjdTckFoT3NUbDZKVktCZjUvUEEvRXNIU21GK3dyem9lVHJY?=
 =?utf-8?B?L1R4RVZETXBuTGpWR3FJcFlwaE9qVmh4aUY1ZWZRdm5XTzdnSEtoeVRjWUly?=
 =?utf-8?B?Z3ltQlZiLzBKL0pXajBVRFpnZzN0djhqd0RkSDdGNjg1ckg1ZmJKZEFTdTQv?=
 =?utf-8?B?T09GVitJc2E0enBOU0RCWlZuWVpORlNCWjJ5NGxzcDhRUGVxQVo1eVBmNTIz?=
 =?utf-8?B?L0JQbkJ3MVdLcy9aay9LRlpSR291d1dtVEhnWlZJeFBoakkxZ3ZMYmh1WjFE?=
 =?utf-8?B?VElibG43azF4YkcyYzVTcWs2VXB2WFd3OGdydUZoMFFONzJZNzVJRDZyNzMw?=
 =?utf-8?B?TzdpT1pBVTEzUSs3a0luck9wMnZ2Q3hsT1VMa2UvUkdraWdIMTdTU0FvcGww?=
 =?utf-8?B?RHB5MWdoSU1TV3plNGthWURqa3k3cFltMWpqWGxaVkZYdG8xUVNRMzlQbjFH?=
 =?utf-8?B?T3BCeG9PRHMzYkNjRUp1RS9vZXZlOTNucWd0cmY4c01uWDdHZTZTcDNsS2JS?=
 =?utf-8?B?ZmhwV1FWREZTL003Q2dPNG90QUR1SWFmZUpGdzErVmhpK3VHMEFwRGVCMTVW?=
 =?utf-8?B?bnpkd0IvLzB1OU5LMEZlSWhDWXhRQitJS1lFQ2dTQ0hybWlVWXZIT2lXMlN3?=
 =?utf-8?B?SXE0cXU3dzF5SENaS1ZDeEdua01TdTBVMjVMTm52MTRQLzRJRnZ1ZnFhQmpR?=
 =?utf-8?B?UjJjYmNBWm9mYmc2MUhjUmUrQzNvTDQ5YUc5a1dUaWdhN3l0UmdOSjlZcGg4?=
 =?utf-8?Q?NQoSQ6fKofzPHp8UNPFJ6w1O5Paqht+uXw3uUPGK+fwJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea5998c-12a5-4f12-daf6-08ddaa3c1161
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:35:12.5287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIRQAlSHlizEYwY3tjcyj2tZZKG9IDsHicyjHH+/U+D3HpOoYM4/cDz1Od1wYzZsS7xrTPEFqf5Cq2aWkN07Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551

On Wed Jun 4, 2025 at 4:34 PM JST, Benno Lossin wrote:
> On Mon Jun 2, 2025 at 3:13 AM CEST, Alexandre Courbot wrote:
>> Hi Benno,
>>
>> On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
>>> On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
>>>> Implement these two common traits, which allow generic types to store
>>>> either an owned value or a reference to it.
>>>
>>> I don't understand the second part of the sentence.
>>
>> I want to say that Borrow allows you to do something like:
>>
>>     struct Foo<B: Borrow<u32>>(B);
>>
>>     // `foo1` owns its value...
>>     let foo1 =3D Foo(0x12);
>>
>>     let i =3D 0x24;
>>     // ... but `foo2` just borrows it, subject to the lifetime of `i`.
>>     let foo2 =3D Foo(&i);
>>
>> And the implementations in this series also let you do:
>>
>>     // `foo3`'s value is owned, but heap-allocated
>>     let foo3 =3D Arc::new(KBox::new(0x56, GFP_KERNEL)?);
>>
>>     let j =3D Arc::new(0x78, GFP_KERNEL)?;
>>     // `foo4`'s value is shared and its lifetime runtime-managed.
>>     let foo4 =3D Foo(j.clone());
>
> How about something like:
>
>     Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allow=
s
>     `Vec<T>` to be used in generic APIs asking for types implementing tho=
se
>     traits. `[T; N]` and `&mut [T]` also implement those traits allowing
>     users to use either owned, borrowed and heap-owned values.

This is super clear, and I think I'll just reuse this message as-is if
that's ok with you. Thanks!
