Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25F8EEB1;
	Sun, 15 Jun 2025 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991002; cv=fail; b=urgGK++qS2xPZXEC/HPrCHakEqvt07Lzj/Kf+9WeTDn6bZAAicN5482KBUNDXyCiY1RP7fC+mBpGOaS1gZxNUHQu7HRdR6+0cTrw77zsakNf/LWw6D1HGXkOOTG3OEu6ml5EVRX3dZE6RZWg0cXCSGSex2Dekt8GzDTZ5RHOB3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991002; c=relaxed/simple;
	bh=ekMgh7WGcBZKgWQhGnUMW69FsmiYeXnH0wQqc63b7vE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Y3g3Hivh5U6zeFnXBxXW0FLGy2nWKtrx648fpYlN79AeYQyPamxCZjBO8cwllPob9TFwBVPFEarT+J2I5OA9NdGJRCX4HYS6BO7fYiHXF2p5tbylI7tnZrgH0R6dgRem7UIeA7nzdiYTFtKA7oxKX3AiArcjSeg4gg29+rHm1lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ENwVomhW; arc=fail smtp.client-ip=40.107.223.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ENwVomhW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIUm/S2ENY2LrKAPBiVNuBA5MuB1jZ07sz0IPlHllqBf2+X6Od2yucZ0yaECkzOgz9o1u5Wen6Z0H5d6Ljx1VO4j1XCuKXcue5Y/WKTqnvDZOXdxiYLipOHh1JonyfmsjL2FO+/rdrIM0LPSZodLFonbpPZJpnYtXdiDC3A1Vgp5nwvOlx7HvmqdiEXmtdbfEjxD54nDiAdDwQAy//9L09Tm34RXNTPqXuKB6pvei46GPDLuIcI05BpTnymQkNonaV4lsNAbYIYOQWhWIcGudFFABbgB5FVKkEphwOu0qytFzB/V6Ey+yftBq+N0R4VLVyZUheRaIp0Km93jrp9QZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiexWSRQuSYwxo71uKGr4txaC/d41JnrhAFpz1cK/ys=;
 b=vF/mxP9CdjZcrrg9Aeat8blx/mUjD3JVCsJdssSHCj4Le9fZkZ5e+b100BwYtY0ImmuAYc5w/gB0NXagFYJxJazjin5sD1JgTrV8iCd5TZbRkOhtJ7pw3esRi5e/Z1tbx32aW5mYU2vRcyYeGZDWX/O5dDrYXSCCk469xSm13yF83fKkQxnhi12jWhe37vO5FY6FPITKP2H/pZxGyE5LItoDEyxC3U7H7myTsxM54d9D1/esCUA5NSPIC2e0htx1PyC1WL4VT55Bop7JOy6WgyqG3VA0ziZMdOZS5dsjC2qYv2//Q81o8kCkwUgczeKYn12kc9xHi6/XJp6AkEjTvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiexWSRQuSYwxo71uKGr4txaC/d41JnrhAFpz1cK/ys=;
 b=ENwVomhWznTWuKanB/4cnhd/e9R9S87OvFE2L3VPkAYcNxta7OqagSel+11pn8KPtT6pF9QFk89LIKbVHxOlxIZ06u1WAepExZFzYE2+hgD5czVT7DvWiQmLKuIbUkDxwr9Nc9g7bppE/y0j2b5zPPdkrCa5nf7fKd7i9EThN5oog9kTJ4ojMioZkfU064whwGRLnKyixYr+hSPdvv20f8TJb1x9G/Bh1B5Cdan6ucM8r2j0A+Ose3F40F81d+to9wV3vc8cGKPcNFNbYMqF6WfBW+r+5tMGqUQP4BwDdnJBYXvkWdt2wwt1sum4sqZWS7bT38Fa/dNtVLZGEu/oMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Sun, 15 Jun
 2025 12:36:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 12:36:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 21:36:32 +0900
Message-Id: <DAN417QCDAVJ.1TNY82G9ZVDYF@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] rust: alloc: implement `Borrow` and `BorrowMut`
 for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
 <20250613-borrow_impls-v2-1-6120e1958199@nvidia.com>
 <DAMHZIN35QQ9.3N5WSB58J4WG9@kernel.org>
In-Reply-To: <DAMHZIN35QQ9.3N5WSB58J4WG9@kernel.org>
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 282338e5-e429-4ede-ece6-08ddac09447a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU5ZVWlUUWoyb25rR1dEb2VRQ2hLd253Ull2SG84VkZsRzNZT3BiVVBESnp5?=
 =?utf-8?B?TzFvemk5UjY5OEFJaEdpVlpXSjdFa29oWDVHTHVXZjQ0L1hJcVBZRDhseTMz?=
 =?utf-8?B?OTI1NnI4a0hXZjUzVDA3bjVpV2lFWWJKbmZRMlVyRmhRR2JXNjV5NXNBWThY?=
 =?utf-8?B?VEd6UFB3RWFMbUZzZE50ZjdLbEVTaURLUlJaNzVFMHVwcnlqQVNLbWNoM29V?=
 =?utf-8?B?cGR0eStmWFU1NHZqZTlLdlhTVG9Kdll6QVVIMWJicU9ZbWFGbXEzclNHTkw5?=
 =?utf-8?B?K1lWSFBIT3lxbVJrQytzZ01panFzS2xBdTFUV2VJOThyMktUeVN5V3dRWjl5?=
 =?utf-8?B?U0JKWDlGN0VROGhXS2RYdFU5M1pKMnB3YnZTMnM0V3hoNTdsSnhZY1FIc2wy?=
 =?utf-8?B?b01aYmVvNitrRno1ZVNFb0xKQ3pJeThaTW5GcHFUbVdyRkVnSWxISXR0ajht?=
 =?utf-8?B?ajN0RFVRNmpoSFVtT3ozbU1OYU9neE5RZWt2WjlwSks0QWxMZlNqbUFmVm8x?=
 =?utf-8?B?UmZHUUdFSUpVUlBvUG1PZjdXNlB5Q0JOUmpXN0w3amhXNjM5ZkRCaUR5Q0c1?=
 =?utf-8?B?d05zd0U0cnZXVmt5REZHOGo5M1ZMZ041ZWovS0R2THhyNXBCTFNoY2pZVWJm?=
 =?utf-8?B?L1g0UW95ZGNVYmw4eFF2TEJob2NvY1F0U1craUdvMy9TOGpaY3FjdW5xQXht?=
 =?utf-8?B?M1ZMdS9EQkJvSUVDeGxSZXRUNGw1N1M2M2JLSU5pOWJyS3MzZU5KcUZMYytT?=
 =?utf-8?B?ZFJPVkROczR1NmdZdzYzQkJWSEhOdDdKUXczTkI0YWZwV2lJSGRzRnFya0x1?=
 =?utf-8?B?d2ZYSXhhZW1KYVJNYXB1QlNQZUpUN2lSWElLclc3eituM3RFbTJXenlFZEtZ?=
 =?utf-8?B?TVpHR3pUakE1UUpqWjgyQ3htdzY4TnhnY05rRWd1QXRVTVRlQkRDM29WMVV0?=
 =?utf-8?B?V1VRSytoRHBBZW9BRGltY0VJdGJBeGRjTitnWFJYRUtnR3ZKZnB6Y1RVcnZu?=
 =?utf-8?B?YUZ0SjQ5a1VxSHN4cjd2SUFJOVhYZ2tJUnJZaGsyVUlFWWtVSVlGS0pxbmNY?=
 =?utf-8?B?Uk9SR3RYRnRIVUt0K25lMVFhTGUwanBYaXJvZ2h1R1htNUE1S0xsL3RNSHgv?=
 =?utf-8?B?NndqNTRVenZxdGg4SUc1MVVkSDNzOE52Qm9MeUpBbW5HZk45R0pxcWs4UDdS?=
 =?utf-8?B?SFh5WkpGd1NhMDlvVHpCMDRYNHlmejd6YW5pUS9qeXdnSlhJUUsxZ0MvTGd2?=
 =?utf-8?B?bkdpV3Vrb0kwdEw0NGdWeGNpZ01hSDV3YXFzSW16U2tsbzBLZTV4RFFQMUlz?=
 =?utf-8?B?NWhRREE1TVdEdmJHMmh2VFJkbWN1MXZCQWlKNUFWZUlSM3RVdm80WmNMazBD?=
 =?utf-8?B?R3RIQW5JWGdicElIL0NkYTNaS0s5bnRsY1o0MWh5RmhrV1MxZ1dpR01hWmc5?=
 =?utf-8?B?QTlSOS9lQ3BuVFpyZkpneGdXWEkwUUI4V0phb0RJRWU5TldiVEpLekk1bjBt?=
 =?utf-8?B?VGl4bFpzZjFkREtNMStaMGl2YklRb3dYZnBwU3d4TzRWK3c3ZFNQNTlZbUYr?=
 =?utf-8?B?aTE3R205WGExRzZFUnpnSzVnMVkrK2x5QmhNVU9JcTdhQjlzUlZ1VmI5V2NI?=
 =?utf-8?B?NjFMNERjeVBIa3M5VEpKVldyT3RwTzI0WjJpSE1waTFiS002YnZVZFVXTXBO?=
 =?utf-8?B?NHZnS3hzaHFPTWlQeWtRc255ZTA4SGF3YjRHaWxQN2RuSHJCb3JrTC9nb2xs?=
 =?utf-8?B?SkIvc09VQU1ZOGMyZFpaY2M1MzZ2N2FoVGgyQldrN3pBNjF2T2xsU0dJM3dC?=
 =?utf-8?B?RUlMenFRcmRCZG1YK3YrckdWNnc4UENEVkNHSTg5dW9xK3A0OHNFbVRiYjh5?=
 =?utf-8?B?N3ZMY0RuNE5WL3pTdGwzRUdFdSsrYkJzVE5vclFkOUZMZXBxWGREbUZPTmhL?=
 =?utf-8?B?alM3c2oyMkxHYnozMnI0VUc2QXR5MS9FQ1l2cldXSFp6THAxUG9HdUlZUmly?=
 =?utf-8?B?ZnZDSjE3REpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFGOFcvSmRhYkY1ZnZUWnVTTWx6TkZOZ2lhOXVienl3MWFicjJCYU1Salc5?=
 =?utf-8?B?SnJkKzFSSnlnbU8rSjBTbWNOejdIb3NEbHhvYk44K2NYeGVYMzZuMWRjTE5q?=
 =?utf-8?B?aVA3ekFHRnc2NmFHeWV4MW1wQ2VMa1NNeGd2T3VEUnRhcWJEZTNLSFR5bDRB?=
 =?utf-8?B?SHdPQzdTM2Irb25YdENJUmFZUHBEMGNSNUR3ZDFoQkk1Q3NzU1ZMVlVFUUdh?=
 =?utf-8?B?SXlNQ3FhMXpDb05PVDkyeXYwbUR3bE54eHN1SHFYNlZJSXkyakxYMlNuS2xC?=
 =?utf-8?B?OGpRMGxVUXBFOEd4eXU2bXJVMmpCK3lLbW94L1NTbGdGSWpFclJPdlZnMkh6?=
 =?utf-8?B?b3p2UjVHUDZWVHV2MW5sNk12V1kra1o5djkwaitGbEdDOVJjRVpmY2I5Z3JM?=
 =?utf-8?B?S0srRGN0UUhCV3NCa0dtOW9FU1JVN3VIRk80NVU1ZEhsZmpWQ2h3M29jS0dZ?=
 =?utf-8?B?d09wc1JKamNXSGVoMzNPUGtFTVBYYXFEcm1vSGh0UFk1aS94dXN4VVFPUktW?=
 =?utf-8?B?anhPOE84L1FTNmlkVVZ6NDMrN2lrVHBkcFp0T1o5SGMzSGk5ZXkrMnIrUHBN?=
 =?utf-8?B?WDJXSzlpeEp6UlBzc1YyKzV3SWdGS2w2dEtGZHhmeUhINkNtVzZlTmthbVph?=
 =?utf-8?B?M21GcDlnbnhJbHpuM2ZUR09CVll2RVFGVjQ1V2s5L0VMWVhtZFYxeE92R0VI?=
 =?utf-8?B?S1poMjltZ2RRZ3I2dUswTjdXSVpTR09kd1N6bS9La3MzM2EvSTM0YWVEWHNx?=
 =?utf-8?B?UVQ3Q1JSN0ZtN3JOVHEvcnhXeDcrbTJzendLeEZoSjJuR1ZPbFc5SVFIOFYz?=
 =?utf-8?B?VzFUV21nNlJEUUdIMDM4WVMwdVhqK1cvZFgwa05TZzZ6T3BUMEZXNXE2TE02?=
 =?utf-8?B?dWtMR3dmS01DM0lONkJ0bVAzMkM4eGhpVTRBa0tEdE1FZU91ZGJjQi8yeDVY?=
 =?utf-8?B?VTlYMmU2QUxqZFowcFFOaTNlU3VSUEV6YUZYTzBLSEtwdFpEQng4WFMzWXlE?=
 =?utf-8?B?NWV1YnNjMHpHeitjVjU2eDd3and5SnNXN2ZRU0pLdU0zdFBJUFBOWmQ0Yi9G?=
 =?utf-8?B?WElhUHN0MGlBaFhJclBpd0E1VTluZVQ4L2lONWY4a2IrUWtTdThoS2xEQkZY?=
 =?utf-8?B?aVdIQ1IwZlNxK3REZ1hvWlN0S2FvS2U5VjZ1UUU0UmxOVnltcmxWam45ancz?=
 =?utf-8?B?aldpeHVXbHZZM2NXbFBlRlYzVmdsU0R2b1NNS3hyc0FMYUNwWnp3WkpsaVQy?=
 =?utf-8?B?ek5ZMG1mMm4wU05OSFpEVDRNczRlVjZ2T3JkY3c4YWVoaW8wNy9xVGFDUjZK?=
 =?utf-8?B?WEx3ZVhITXdqb2ltbVBGdnpZNnFkcmlSQ3ltMWl5cnFzV2w3U05NVGx2SzJ3?=
 =?utf-8?B?WHhDVnQyMnNYZkx2U0x5SXlGbVcyYXhrM3lKcktpWnBvQU5QUTVSN1Z0MkhY?=
 =?utf-8?B?VUdxTFpoZjJBeE1mK04zVUJOTFprRTlwNTFmbkIwMGdYVHE5VFNSbWZyV2Jo?=
 =?utf-8?B?YnpVM3UzOFpwbXI0MlFnTlJRcmNUN0pDbWRnbWxaSThTWWo3U3BFb3dEVnlq?=
 =?utf-8?B?ZUhmeGRxa1lydU9DSTRjYWQzMEdYOHZCeGtTRGliVGs3RkVIbUk0azBCRlpv?=
 =?utf-8?B?TXhDYWxBQTlVNmJZT2Z3cHNwZldxMzFwMUZkdmltSUZZT1lPelpmQWZJL28w?=
 =?utf-8?B?SlJTdDhrNlJSWEpuMkNHQjgrSDFJTkEraHpRVGRhM3A3TEtDdXdYL05uTVpZ?=
 =?utf-8?B?SEZQNXN6WXdIN3QyeUs3YmVERnl5SlRzY3RtV0ZFRkdiZHpGRmQ5emMwTTFM?=
 =?utf-8?B?WG4wcll2dFFOZHdDN2ZvQm1Uc3AyYWVFOER5K1VtTnd5dHB5QnZnTkVZREpo?=
 =?utf-8?B?dmlMTlhlbnlmUktYQnBLRnJUVkN3YlZDc2NQOUdqRWJkVHpjaXRscFF4RlBh?=
 =?utf-8?B?TW5BelRla3NTUm9vODZkb3FjaW43TFo5cGd2c2hWWFpHYy8vdXFGSloyOUtj?=
 =?utf-8?B?NmdDSmdLU1k1UHZzaUg0NURDelZQNkFtbWFlWVlxejVuOEtHUmVuTUI5eEJo?=
 =?utf-8?B?VCt5YXRNdmVBcnViZG5Ka1IwUHZDNC8zMTZ1WFNxR2EyamFBTEk3VEZlVExV?=
 =?utf-8?B?OXlOcExIeWtTRnRKcUZPWEJjc2ZEK1huclQ4UlVMaWFpbEx0RUp3bzQ2RUNv?=
 =?utf-8?Q?BR8kSicGyIp87HmH4eirGyzR/jl+TWjzqNOfPC6QW26D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282338e5-e429-4ede-ece6-08ddac09447a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 12:36:36.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaOqIL4z2UNTOVGMPqL40c5lSJLRXa3pokE+ZlFg1UMIWou13yKhYRzr5jM1qL6/oli4hs/02MBBu+7gUbHtQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

On Sun Jun 15, 2025 at 4:19 AM JST, Benno Lossin wrote:
> On Fri Jun 13, 2025 at 3:46 PM CEST, Alexandre Courbot wrote:
>> Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allows
>> `Vec<T>` to be used in generic APIs asking for types implementing those
>> traits. `[T; N]` and `&mut [T]` also implement those traits allowing
>> users to use either owned, borrowed and heap-owned values.
>>
>> The implementation leverages `as_slice` and `as_mut_slice`.
>>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> One comment below, with that fixed:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
>> ---
>>  rust/kernel/alloc/kvec.rs | 57 ++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 57 insertions(+)
>>
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index 1a0dd852a468ccda6ea1b521bc1e7dbc8d7fc79c..3f368d4a67683ac5a0ff87d7=
df33a3bb640ced59 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -8,6 +8,7 @@
>>      AllocError, Allocator, Box, Flags,
>>  };
>>  use core::{
>> +    borrow::{Borrow, BorrowMut},
>>      fmt,
>>      marker::PhantomData,
>>      mem::{ManuallyDrop, MaybeUninit},
>> @@ -890,6 +891,62 @@ fn deref_mut(&mut self) -> &mut [T] {
>>      }
>>  }
>> =20
>> +/// Allows `Vec<T>` to be used as a `Borrow<[T]>`.
>
> I personally would vote against this first line description here. I
> don't think that it will show up in a summary view of rust doc (since
> trait impls don't appear in searches or module overviews). Additionally,
> this first sentence seems like this kind of comment:
>
>     // call `foo`:
>     foo();
>
> So let's just remove it and directly start with the examples :)

That's fine by me, I was just a bit nervous to start a doccomment
directly with the examples, but in this context it appears to make
sense.

Thanks for the review!
