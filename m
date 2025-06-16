Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2514222612;
	Mon, 16 Jun 2025 03:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044891; cv=fail; b=CC5v5ehKWIAVg9PWtIDfQZqeB0siB/gNoEfB9yXO5pSV22CPW/0HQTh+ZvH3z52YAG2DEyfwUfW6DyxhLLUQpP68EDBRfABPcTjpOifbh4egzPOa8TVpd59HMC3Att1w6X90GBXVAGyAw6D0gFpIc6TCb68Hu/Tt94g3XkUhpfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044891; c=relaxed/simple;
	bh=WDcpR4ZwJjVdC2XK5Ed8TS4GKU9D29JYROZuKIysv2c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JsFHnD4RhJJyAVkmy2Mbm5zVOjQSUi6KnTqQmIjob6Td3rEtl4rQMdk8Y5dz+rxuLv3O5XEbplClmfkZ3IcLakgKoig/XnKrPxRkxlrkxjx0CbnGgCNjMDVDgcxcllNhPscPFFyLKnCRK/U7kdgpzxQ4AfBdOiH//XeKZdN8d1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LetJ1JNQ; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LetJ1JNQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaoN/HU+/JvpuHUswuKu2O/IXUVggX69W9RlP6i0CD9Nfk4Yol8CfNJpN0alnHS2+xYLxuhdOzWgH0VUVLeFvffeAXBigCxXy1JIy4zOZ0p3VfUnvUB8q8ioscDjTdd9A3vS+QK9MEDZ1j+QxjgjbNlOINbcWQK9EfkW+4D1aQ0f6sab58SyNhbS3ipYAqKmrmjDgp/O2WYZLRigZ+gZjI56bFcI+M+fyR4v8DXZ9XBzFMTOgbxUT4wSjPy3oyMbapqC9FFTPPqYTxPxTy79juaPkOwQkg+vfAvK9VqbfozrF228ZvyjjA/Pw5HHIjQgC7OpOiUJOVttRp9oOT7rQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIhls/BR0R6ehXYIYaODrSn0lhyRniHGrWGiHhpsseA=;
 b=wMPFGb4VZ/6n+G7bo3xtlOqMNZB53gcgQQ4FDmHqsSeqKOlQYHgwUmN1NqsX9z/4DEBl+fspE8+DGx7/Tg2AeKcXWML238l/TeQE+Z5kO7aF2N9+4b2baiaDXcfTNrD6Aqq6fubsF/AFBYqPohhaDEqPbPMDE3LKPMuvi6ZSAAw6rKk3s98HXfSTpcBd1kuxiE9Xo6QH7KQUYkpHy4IOc6xjpObZDxDVBhL1cGAwObrNJNsIKMMJDN9pSd7alcHtPmxl7bda79U6ri0WwyufAu80sYO2ijzElnp8GIWCU+MuMx7rBuSVd5C/qyfOv/hP3xruNBAsYpggaN3X5EmRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIhls/BR0R6ehXYIYaODrSn0lhyRniHGrWGiHhpsseA=;
 b=LetJ1JNQVa6mHyvpGHxbbtR6BWDkQif1rzPCHyfxW9JGI0aiZ1YtixOZZyz59Ybzv6uStpInGWjdHNnhxxqK3dIGo+MlFNpD0wcy/5g1R67vV2myN+jnJrTL86zCVweorzcazxNeYQgJiPOZ+hjLK5e0YnAmMP0PbOZitoZBlG/76sTURXBf3nOe98AlwKwL5Ye/zX4MB5QWLgcsyQEsvahv521g39TzICkJqT24qq+6AP8ZDZH2iN7V8giWDt+BxXWmhKBl+t7s+ZRUjwbpuNC3NfSPNJOUl66aaE6RzkhZqKpOcCTJKd8urr25/ZStOqS5oUCDRQWY0RQFN7suNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 03:34:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 03:34:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Jun 2025 12:34:05 +0900
Subject: [PATCH v4 1/7] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-borrow_impls-v4-1-36f9beb3fe6a@nvidia.com>
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
X-ClientProxiedBy: TYAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:404:14::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f876054-7b8d-4ff2-b943-08ddac86bec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTVIWHRZTDl1cjgxUXM3Zm5kbUhiQ2tzL1J2blZTUk03M1VOOW4rcnY5NG9y?=
 =?utf-8?B?anNWSUhTTHpwR1A1M1RuL1VhbVhaaFMyUk9NOGp2UXdtd0NhUWhuUktCT2Rn?=
 =?utf-8?B?dkp1b1hHNVVBOUEwRjlNRTZvTWlncm12T0ZRRjUwR0FpaEZLMFFsR09PNEJq?=
 =?utf-8?B?djBvUzJJdXJQd2NCZ3VRcDRrbjg3VDZ4Yk9GeXZWQmt0LzMrZFplbDRHM3lU?=
 =?utf-8?B?Z0M1MmZsRDdSNmh3MGcxdVVJd0NzWnZqdC9pNUp3V1RmdVpKTFlQcVBiMEJo?=
 =?utf-8?B?aUhpQWdUdGd6TWo5a1hKM2o0eXFwMXBqU1QzdFFTTFhIWHh6MDlQSnFIZmVj?=
 =?utf-8?B?T0MyTXV5eE1NYVVsa2V2dmZSaEVYSkZnTGY0enp5VFhBbHEwNUcvcjJwSGZM?=
 =?utf-8?B?aHEyeFZrNUdxM2xwbzNWamcrZWczUTI2TG1uaU92UEc0VGN1d0k1NkllZFZH?=
 =?utf-8?B?RHJ0bUNWem1Ec0E4cWJjQkN4ZzdFMTdqOTZLWmRCeGFRTUJINzFsdS9ZTFdl?=
 =?utf-8?B?aFRQTXo5T1dXNkNwMFRtTHRnZEpBVlJMYVhOSFRNdm9ZNk5pTFJ4QjRIZDRt?=
 =?utf-8?B?aTlhSGdDSlVOM3A1SW5tYVdWRzJ5c2swZHo5SVJjYnRNTmhNS0EvK3VudEdK?=
 =?utf-8?B?VzFLU1B4R2FIc1JSbHVGaXFvbUoxeVBGQ2xRUVJ3UUZINnpuS21pbUdsZzFm?=
 =?utf-8?B?QWNXV2VBZlA3c1VTWDNlQ3czUE4xWjIrd1ZoeDhsWE8vajBLallsMU8yOGh5?=
 =?utf-8?B?U05ObDE2c3l6SFB5d3oxOTUxZzFaZGs0Z2c3YVp3aUp2U0t5Z1NCRkZLV3p0?=
 =?utf-8?B?Yk5JdGpOakZHb3VrT0NyZnVHcUVFV2RqZ0tTaEFYQ0NoelRyK0hvWTRaN0Y5?=
 =?utf-8?B?b05nQitjZmpDWXFaWE80anM0TnJ6TzhkYU5mZ2IvdUVOTzZBTTBPODJyM3ln?=
 =?utf-8?B?NkhzejVRYzNTdEEydXRDSXJxQ09xL0cwZFNFc3dMQXBXQXd0NmxoYTBFdEsr?=
 =?utf-8?B?WkxOS2ZCRHNTdE1OUnFmajUxYkZXbFRLZUJXMWYwRi9RRkt6ODA1M3FveGVi?=
 =?utf-8?B?YlZTTmpNL1hCOWF3VSt5cVJncnpucVJQWUxBNU94RkJ2cDRsRGZSZ0t0MHNP?=
 =?utf-8?B?TitHb1JZUTl3T3lyRWJlRUtkZFhtUmYrQTRVQ3E4MEVIZStuN0FkQWhISk1Q?=
 =?utf-8?B?Y2EzK2lqRC9mN0ZvYWlsRDZPckNhcWN2WjhRS2l3N203NFhBYVpEVUJhN2VO?=
 =?utf-8?B?ZUFtRlQwbHFKSGM4YWsyMGtIazVWa0dlVytsZ0FLeWlVbEJtcGRTQkhoNjVo?=
 =?utf-8?B?a3pnMjR0MTViUUw0bjNNd0d2K21VdDRpZjIwK2JlRTQ0bVIzYVJ5MGpGZnZq?=
 =?utf-8?B?UFJXTml5WGUyNEptTUp3Wm1pdXFBOVl1cENCaWZOdjNsWXFLa2JJZFoxRzEw?=
 =?utf-8?B?RlZHVFQxQUxEd3FpTXlBMVVQUHVQa0UzRFN3T0RERXJUQ3BuNjJpVGRsOVV1?=
 =?utf-8?B?WW40WDE5V015eGhVUTRHMFQva0I5aFJXZEo5L0hxZGVncDgxczV1SHhiMHla?=
 =?utf-8?B?UlRVTGJxMXd5Qm9aYS9NbDdhN2lRZS84RUJPTmpSNGpaM1dVWXBJdlRDd3d5?=
 =?utf-8?B?OW5IeWtHRlBpQVo4OURldjExQ3JGYkdSNWZxd3VBRVQyTDNYZno3SHRUMlJv?=
 =?utf-8?B?dG14RWVia3hFZWNob1hwMVA0eHR4b2c0NitYa1pwWDg3dCtrb085TjdGMjZX?=
 =?utf-8?B?d0pFVjJ0Rk9qZEI1bFRkeHZTRDdDYklLYkUzTjcwRUxBTUhnY3kwLyttQmRQ?=
 =?utf-8?B?VHpZU1VpY2kvYXlwR2hURVQxZit2VFJtZEpxTDRuVVpXUTY1M2YwWjhTK1FI?=
 =?utf-8?B?ZFFrdTJ3MzF3SGVCMzAyUC9QeFFQYjljZzJhSnZ4Zy9HalJlMG5PTUxOUkp3?=
 =?utf-8?B?ZjErZ3MvRWFWNUJGUk9vTVpqWVEwVDAzMHZ1RmYxdXJQOW5mdzRmN1BLbFBi?=
 =?utf-8?B?VVFpeDBwd2VRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1k0S29lRktpeGVUdUlmSm9nTjhxUjh5NTRBOU1OQW15TEpqeFE5My9ZRTlv?=
 =?utf-8?B?U3FEY25qOE4vd0ZOdmtjcC9TbEgrbmRjMGE3dkY3L0NhWmNwZVpZdnBnQkJI?=
 =?utf-8?B?RG9zQk81L01YVG5UMmJwRWdkWHJ5Z3lxRmJFWHAzb0RFakdkYU14TGdtaTV3?=
 =?utf-8?B?aUt1OGZqNVlxSEJUUTE5RDM3RHlmQ1pLUVo0Lzc0QVh5VlA0SWw2M3lic0Qv?=
 =?utf-8?B?VjhGYlZxQXU1ak1OREhsbWxaTGdpcXJBYU9DSG14WkxKY04vT1ZGYzFRallu?=
 =?utf-8?B?MS9aQ0tBWHJVaHVnTzY3cjFFcnk0N2VzZFVDZlE5d0ljV2FjMTBkbVBwRXl5?=
 =?utf-8?B?b1ArRFJ0TWlyU3F6bHpHY0lQRWxsWVBJNmtUNkV0dW1yci8rL21iVHZrZXBX?=
 =?utf-8?B?NHVlNTVqK29LczZxWVp4cmE5RUZPcWJtcXR3Vk53Q3hNcjVuZWltQi93QUZB?=
 =?utf-8?B?M1NDN290dG4yUTBxOHhEdU5zMFlVZlNsNEowMHB0ekxlRGVlRlZDZjlmeW5o?=
 =?utf-8?B?Mm5KaXNjWVJla25nbFNqa3g4YlVqV0IyMk5pOW4ya25RMDk1VDRWYXdOekpW?=
 =?utf-8?B?eEgwVUxKNUVFNm9YWGEwYUpaMy9oWHQ4ZW1XNTJ2T0kzM1hSc2RIK3dXK2Rj?=
 =?utf-8?B?R09HQnR6Qk1tbjVQSkFJWFBzLzVvQkkzLzBveC9GUWhMcGorSFplbFFybmFt?=
 =?utf-8?B?YlFndFp4SXoyTUkzRjJ5V3lOZUZwNnIvbUliajcwenZZLzFuYWdkNTd3L0Fv?=
 =?utf-8?B?ZjBueTZNZkkxalZyRHM0ak83cUo1QnZkbzRlOFJKVHo4bFZMV2p6RUdpRWJt?=
 =?utf-8?B?VDZOU2l3M0w3bmRjeUIzZGlzSXQ4N2lJVXltcUUwbW5FTmhuU2xhZ3p6aUtn?=
 =?utf-8?B?MEhDaGdsWFI4U3N4azg5ZytzMCszZUZpNndHSzlZdzdoYlRrbzd4aFFZYWI4?=
 =?utf-8?B?dlMrYUplbWFKcjQ2d3dRamdSTi8wNmpyTXQwekhEVXpCUTk0OHY0dUlCSi9k?=
 =?utf-8?B?SGczSmp5RlNyR3FCeFdyVC9NUzhaVlZyNmtSK3BkWnZFa01ORGlUSnc2V3FS?=
 =?utf-8?B?WGwwd1lGNjU3UnF3VnNsRW5VbmxCblY3M2FSNjdZSTQrVCtvWmFwSnpuYXhR?=
 =?utf-8?B?TFVWMy95dXhoSDQ0TGdPdzUrNU8vV3NHakxVSzlhd0RvZEQrdE5BaE9QL3Zi?=
 =?utf-8?B?WWlKdkhlYmlxSHJaeXUrTHhSME9VendaenZOWUNhWjBsdVBGekJKQkpoK0p3?=
 =?utf-8?B?bSsrVHdNcE11cXdvL2w2d2hsNkhpc3o5MTFPV0pTb0VTeWhBRGVERW5aYzNQ?=
 =?utf-8?B?OTlJUEZySUFmSXMrTSs5NDJncThHNDc1VFNOR0pld3liczRlS3YyblkwZkRo?=
 =?utf-8?B?eEdDMmNma1NrNHVFQVVVYVpTajVuOHVHeEpPSTlBb2ppVFF5dWpwWGdOR2VG?=
 =?utf-8?B?UDkxUlhkUFJWVjJ3NWlMaGVDRERZK2VGTjNLYUdlTVlXZHcycGpjOHhiMHp0?=
 =?utf-8?B?alFETVQzMTBralp4S2hoVGM4Mk9oK0NqTXlJdnJ3Wk5xTkZWTElmYUNVSnJD?=
 =?utf-8?B?KzFaVmYydEF2UnlyZnNMWFF5d2x2Yy84clRBOFh0cjgyUTRtMzlnZTdNalQz?=
 =?utf-8?B?Q21NSmtFcEw4b2wrZ0N4VTF0c29ScTZ1WUxpdEd6Um8xMTlteVZDWjBJNkh6?=
 =?utf-8?B?WW0yOFIrL2tSdmk1bnNtUURXaXBuaHFiZnpPUGw2eURLSEZ6QWZCeXIxb2tz?=
 =?utf-8?B?OWkxVkxrUFZTUzhTaUk1dVJISG5Vc1I2QklRcmY5d1JyZzFReE9QRENDVjZO?=
 =?utf-8?B?U1M3MHkvSG5lYW9sdjY2bVZZVUVzWjV3SDhUNlZxdDJOZ2tQM0prR0M4M25X?=
 =?utf-8?B?NjF6c3lqNjJqUXNFV0tTRkxxalpvdngrck4yblM1TndESjQvWFdxcmhDNWdF?=
 =?utf-8?B?VzFwRFo4RWt1S01JTkNPSnZ5QkY1WFhrUlpiNllvS2xBYUdOL0d4UDE1N0Ru?=
 =?utf-8?B?UEtteGtyK25iZUcva1pORzhZOGc1bmg1b2ZJeTgrS29xeStCeTdCVkNiSE1a?=
 =?utf-8?B?VXlaNWJTMS9MQlBLOHJXaFdzVVNqaElheVYvRm5FSHdvY1lQK1BmdEU1NlMr?=
 =?utf-8?B?aW9XSE4xa1VaeXplbSs1RlVtcjRreE9mL1BLZzBFR1h0aG4yOG1mbEtobUl5?=
 =?utf-8?Q?oij/GuCcLYy+eoj6IKsMhY8Rrx8qA/YjTWunyGIUozBC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f876054-7b8d-4ff2-b943-08ddac86bec0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 03:34:48.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r06KZwHOqeAyQSMtRzD6/YTlH5rMug2WHy4NMwwIA/naEbz1ONb5cdaX58vdYII+lUapSCkW4CwV/vzRoVKWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allows
`Vec<T>` to be used in generic APIs asking for types implementing those
traits. `[T; N]` and `&mut [T]` also implement those traits allowing
users to use either owned, borrowed and heap-owned values.

The implementation leverages `as_slice` and `as_mut_slice`.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kvec.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 1a0dd852a468ccda6ea1b521bc1e7dbc8d7fc79c..b121cb39de85575f4487208ad5deee3c3ac06111 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -8,6 +8,7 @@
     AllocError, Allocator, Box, Flags,
 };
 use core::{
+    borrow::{Borrow, BorrowMut},
     fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
@@ -890,6 +891,58 @@ fn deref_mut(&mut self) -> &mut [T] {
     }
 }
 
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// struct Foo<B: Borrow<[u32]>>(B);
+///
+/// // Owned array.
+/// let owned_array = Foo([1, 2, 3]);
+///
+/// // Owned vector.
+/// let owned_vec = Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
+///
+/// let arr = [1, 2, 3];
+/// // Borrowed slice from `arr`.
+/// let borrowed_slice = Foo(&arr[..]);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> Borrow<[T]> for Vec<T, A>
+where
+    A: Allocator,
+{
+    fn borrow(&self) -> &[T] {
+        self.as_slice()
+    }
+}
+
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// struct Foo<B: BorrowMut<[u32]>>(B);
+///
+/// // Owned array.
+/// let owned_array = Foo([1, 2, 3]);
+///
+/// // Owned vector.
+/// let owned_vec = Foo(KVec::from_elem(0, 3, GFP_KERNEL)?);
+///
+/// let mut arr = [1, 2, 3];
+/// // Borrowed slice from `arr`.
+/// let borrowed_slice = Foo(&mut arr[..]);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T, A> BorrowMut<[T]> for Vec<T, A>
+where
+    A: Allocator,
+{
+    fn borrow_mut(&mut self) -> &mut [T] {
+        self.as_mut_slice()
+    }
+}
+
 impl<T: Eq, A> Eq for Vec<T, A> where A: Allocator {}
 
 impl<T, I: SliceIndex<[T]>, A> Index<I> for Vec<T, A>

-- 
2.49.0

