Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501128313B;
	Mon, 19 May 2025 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664418; cv=fail; b=G4b3H5xq8y2fli7hwKOh6M6xfpH2CCFt1dHyskT495BLrUWoLwOVaM4JpapRUv7DPOa8A8SpEpxWlkOZfH8GN917DCpsBVmXzWEnSLZQEovyBkzlhqRSvCTvX7erMyUWbEJNPtQuAmZn45r2zL+HFkP5EE6GhX90y41d7AKLXeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664418; c=relaxed/simple;
	bh=hYPHk6IeJUJt4dHSVBTPMyHVPCffrFIQnAJC6cFRshs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lRZXu2A3QhgZr69pcABEoNdJ8WGa6zhOnhtt7icUn687WrKMgAK2xqVJQoa0degLIQs9JKZrbvZmxp2OhF2sp32KcQn0/fbto0IdRnE05GOAwW9E0gUKxK9yuMflS0Mf+l7ys2Bf4qblgPLxbpNM8WEtZaGQyC1kIN0Dt+Sn5iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qLtijD4G; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qLtijD4G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DI7flIuzuIylsYDnehBUbtAjCKZx+7RXMGA1y7zVxh89+H0apF3fD79wkrXv79gDq/AlikdU4Pfogi286u7le/lzhPiKyffU62VMyx/5L0BtqzxxwNXh+xzI7HiygpFFVR+HIYoTQkO2jAMekkLFsJ2MOoyjgPnryiMsg3VQ728fFO0Vrf/wcwFcYkaQJnq/oFGZvE++poYNPr/7ODQ0yxsz8ruBx8x0QBp7ZD1SxN/9sJsNd0CzfnWifwdYqPfseDEzdNe/PlGwaXiuUTkVOzYgI326UbhPO7CKHfXQqBvqfP7gKOSmMlMgw3DyNottNJP709qNYfolRGN4lfJnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N72I6Judwee22nGND9F88XuxNdGOteDTXQdPQZWybP8=;
 b=VawjGpneJRrThbamAJHlW0uZjAT5n1rXrpxRCezCf65hD0/qiriiBlrhSKmsQVQFIYrGELqMj6XknknuIU8A2UaoETHxUyktRSaRMnzsy6Opl4Pt6jmxvM4Ew72GPVTY2BqZElK9H+qjK6b4HbTWgv9pP0OS6GaDF2o4J3LAyGQFb4Vt4jWpTks+QaVRYOHRe9TPIGElR5KPlYWHOyTr+r0KNFf5CTmO9I5ZqS/KY42Ldx+o9O6DlqbGB14bSYjX1z0rCYwgjxVCt9DniTsHpoBBIc/ZcmsE4Jv2EtYm5YNuiuNoXE7+boIXbbopABQi3P7S17QWlAqhN5BvXelwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N72I6Judwee22nGND9F88XuxNdGOteDTXQdPQZWybP8=;
 b=qLtijD4GN2OrryKRjPzuoHfJPFlamMrl8M+aBAfTdNmAz/zGgVu1spTmqP1Tc0ldCmnLpK2kqFI5aM8FYQab1Dtgp/Dxq5LZ8fq7EEVY8LGHK5fEgnkAGwyk9rLKJY83Ljtu1AzMSNPHlqjoJ+TAi3Zq6IksxOPDk19cK9Iz1mwHXQsL7q7va5GDZ72BocV/MWdlH3oIDEREeQY5ket7zsxlDwI1NKg/BUwt2Y1VSXDZPnIdxsGhAK9gpN4ed2m1uYNJbG7ZqTgE0VTcEZWD2lrRDEpHHAoSd4p0wwdRMyT9ALNN9ABOQGo6Xjee8c8SzRPYVgi6LFhwuiNJnWE3VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 14:20:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 14:20:12 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 23:20:06 +0900
Message-Id: <DA07BSJPBP55.332DLW59WGDFA@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
 <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
 <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
In-Reply-To: <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
X-ClientProxiedBy: OS7PR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:604:256::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: b8fbc63b-feb6-4741-2d78-08dd96e043d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlNYSkUyaHZQVGdZT0t2YlpmUk80UXhDU09mRUdONkV6cTJuMEpEeUdPS3Ry?=
 =?utf-8?B?MXMwbW5ueExjaVJtUjdVaTRsUFdyVFI5L29aSS9zbWh1ckhGQTFPWUVabWh4?=
 =?utf-8?B?S2pZUmVJc1doTWNjSk1malBFWmlhY1lvYXp6NlM4RFp6WHNUc2MzbVVUdVcv?=
 =?utf-8?B?cEJNQkpFQThyWjlGUlVtOHF4eGVPSmNHWEM4enVPM1BLeXpqYjRaditGNmJk?=
 =?utf-8?B?dFZVYjJ2Ym1ha3VYMlpCR0xyeWNNK0lRenV2dmY3RS9KazhGWS8raFZQTHBt?=
 =?utf-8?B?KytzVSttREhiT1o0V1VRZFg0MUJqMHhMblhtVWs2TlRkUHJCYk5xWEFvdWpw?=
 =?utf-8?B?RHg3MXdYNXVSL3NuK093NDBrYWR3YzhRTUlRQ2hFWEs0clQyVmtDM285Qi9S?=
 =?utf-8?B?dXdtVGdZZ2tqMFE3VERPc1RtM29tcTJLOVJ6SUwyZ2NYOVVOTzBEa21tcFZG?=
 =?utf-8?B?ME1CYzQ3bnlYSFVXR3E2WGROanI3bTRrVllDYTM3b0JneDVEU3g5U084TXVv?=
 =?utf-8?B?QnRBa280SkUySUs0MEE3Y2hkSTJWVXg0a2Q0RHlXU1ozTVRuTHZTdDlrZjlr?=
 =?utf-8?B?U1ZOMVRtM3o4anRBdUJyZkVjbGZUQUJiK3hGeFJNaENWWnJtOWNHM01kZ1Rh?=
 =?utf-8?B?b3Z4Y1FNVmRBZXJUYkhHZk9RdFR2SlRPM01xZUx6Yi90dWJWS3AwWklGTzZE?=
 =?utf-8?B?LzRYOHZVNVhBWENpNE02RlFpRWlKL1kvWnNZN2VjM3MwUlpXVnFwandmZzdQ?=
 =?utf-8?B?NDJHZGd6aXN0Q0FJQ2I3YjY1WTBNaEtCVDl2RTczdlRxOGNnR3M3MjRaQkxa?=
 =?utf-8?B?QU8zUG5BSGFNTXdWdTR5TTdNZTg5T25IajQxcFlXU3BRTzdoN3ZkaTJvMkJ4?=
 =?utf-8?B?TGRqWUt0ZmxYeHhib0lDN1NzaFFaTHBISmswK2ZxajRkTEIwNm1WTlZPSkJh?=
 =?utf-8?B?RkNOaVlFYy95QXBLQjNhczJYUHRCRDNLbkE0VVgzU2dnelhEYXhaRE5PcTha?=
 =?utf-8?B?Y2U4RWJ6bEhnVWZKMDNwODFoTWlCOHV5ekdidTdDNllRUXRDaXRkUXRIWDJj?=
 =?utf-8?B?blBSdVhFdTFvSFNwc0hCOWlia1NsN2o5cVZwbUlZaEZIUTRpZVY5SHVqcHRu?=
 =?utf-8?B?ZWgxdURSTzhuMFpCRytCOFp3cUNVTU5OdGczSVRHcTFGdy9lVHVmaEdSbUZH?=
 =?utf-8?B?SUN0VzlnZHo1MUtKc1lTWVdmVS9jWk9yaDRUWEtyaU01SXR6ZjMwNUNudFE3?=
 =?utf-8?B?Q0wwc1NvYTNIbHRPbHVLeStGZUg2WmlDOUZ4UlVKVnZWUmdLSlRDTmRQcUVP?=
 =?utf-8?B?dkxLNjUzV3ZrTUVIRVBQY0dib0VhNUlMWldDb2lFWEt4Q3UxNEo4RGVCb3gz?=
 =?utf-8?B?aUFDQzN3UlJTYlpkUEorUzJCV0I4ZUpyQzRld2lRL25vZERsSVFzbUxZNjRn?=
 =?utf-8?B?MzE0Q2hqWVR1TkpTRW01VjJjRWhlaVcySXpydzNGWnhTM0pwVFpTNzNWdmdz?=
 =?utf-8?B?S01YQVlDNS9iUVBDaDFHWWVVbEJHcCs5enBvYzJITWVSb0lPeGdTMnJwWXJ5?=
 =?utf-8?B?SFJIc2pqaGpNTFErSXVWUW0wQTIxVTFyN3NEbW5yTFZTNFBsVDFyTXp4U0I5?=
 =?utf-8?B?ME8zeGxtajl3Z3dQVGNKUC9KRllrYVdraG9PWTUxZGNFMzRTeitoM21uL2FI?=
 =?utf-8?B?NHV4Zy9PclBNcUtDZm0vVE1CYS9tMU9aMnk5MndNbHp5Q3VVMGY5RHdLSXU3?=
 =?utf-8?B?NVU3Y1VYRFhlZUYrYkFxaHFPVVJqeE5UMURTY080UmRZWHNwcEw2QnhvUnNR?=
 =?utf-8?B?M3dNRHBxRkRiODg3a25IM3k0SzdSQ053OVd5emxvTjhXei8wdTRZTEgwcXRP?=
 =?utf-8?B?M29lNjkvWURHVGZWWnpRUVdkeUZublpmNXFvRzU5U0l5aUdGWlNpT3dIT25n?=
 =?utf-8?Q?GcM1HEvlWCE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlRycVJYcWVoZC9EaXNONGxuS09EMk0rOWhGa2trZlNQQ1d5ZFp1QTFOV3p5?=
 =?utf-8?B?dGVPWkxxaDFxS2QyOTFwOHBPMjhOVTAwcDZkVGd4eUhHMTVyQjFaemN5eTFa?=
 =?utf-8?B?WWN3Z2EwWGtVYVFIYUpDbXhPc1c0NmRQamoreGY3dnFiNG51M3JVenBNc0Qy?=
 =?utf-8?B?QUR4WFNNWXBiUmFENjd4Njl3WWpUUmhOMmovN1pLTkZHYU9oM0l0U296ZlNy?=
 =?utf-8?B?eERmZ29JSExBUlVGQ3c3dE5SdVltRjZiQzBMYUNEREsrRlVGMWlISEtjcE4w?=
 =?utf-8?B?OE8rdXhUMS9QNzBzNFNwalo4WFlWYUp0dGtPbE1DYll1MHhlQ2dwRC95WGNN?=
 =?utf-8?B?ZWoxWEJXMmRVK3JJbGNmeGo1cUc2eTh1ZWI4ZllOWURUbHBaNTNaSTFqelR6?=
 =?utf-8?B?Vm42cjROS1ptZnFaNFJRaUpIWmNoUjNjRm9HVFRxRi8zUGFDWlJVNHBiODRa?=
 =?utf-8?B?WWFXVFcwSFZRZ0RWdGpsdE9pMi9hN2RLbGQ4NldVMS9tMnlZVW1RZ29KcjFW?=
 =?utf-8?B?TVVaVkk1T2hxWHB6S254bk1XZFM0R2llaWZpbi8yczRZOXRoRGJOYzh2OHVx?=
 =?utf-8?B?OFhrbWN3Nk9IMklhekMzT0Q3MUpKRUVYbzB5RWUxWVZleWd4aC9CempPZkk2?=
 =?utf-8?B?dDR5dU1yZ09Qc2xIWnk4QzlTeXFRanhndktPMDNSdGpBd2VCU1UrNXYyS2Zn?=
 =?utf-8?B?dGJ0UFh2SXlYZDdKZEhLRkJwMmFNaGlVV2JPRDF3bDg1eUhRb0pDb3ZmMklT?=
 =?utf-8?B?QjQza3ovVWxNVm51RGFNUDhOQ0Rtc3FFaEJvcElhcEZUdGt6NjMramVNQkJq?=
 =?utf-8?B?eG5PVWFzZExVZ0JnNmRBL2pwMU1GNHZ2dmpnV2F1LzJqN3lzaUV0cVk4aWl4?=
 =?utf-8?B?bzdpKzNlajdaN0ZzMWlmM0xrSlFDdjNwK2p3aFZLTXlxMEErM2ZEb1pJT202?=
 =?utf-8?B?QlE5QWNydkM4UzZxUWc4MzQrbHB4SklxdXYvRDZaSUdRbVBUQWd6cmwyNWhz?=
 =?utf-8?B?cjZmN3ZJK3pMbG83MUZ4N0VVMC9tRXR1azh4c0Z6bmFZOEx6bUtsTVpzV0xZ?=
 =?utf-8?B?ODRpRUd0OGd2dUsvREV1VE9nY3Q2ZzdqODBHb0pEa25XNm5sOUhvVDVGUEtY?=
 =?utf-8?B?Vy82TkJmT3FXRkYvRXQrUWFnRDdJQ29XWU9reURtT1kwcXB6dUdmWW94N1hG?=
 =?utf-8?B?SHkxK0dScVdtUGYwbHlNTmpEbnFzdXNMSWI1UmVFU0UzVWtWK1BHc0xZRXp5?=
 =?utf-8?B?YUVqR0FXYy9GNzJjT3dpZmdWTy9Bb25wZFlQeUZ5Q1FiRmwwR0cyemxjL3pw?=
 =?utf-8?B?aTNLaVlWV0JYc2RhZEdESEdORzRUVkl1ME5iTWREOEkvQ25TK2tRSUFzMUt3?=
 =?utf-8?B?Z0tLakxkWndTZTZpNnZURGc4bitYM1B1Q1ppSHhBS0k2UjdlZHJrUC9PTXN3?=
 =?utf-8?B?clUzNnZnQ1k2aWZBVUE2MzNndlZpTEUzYmlyQThsYm0xWnpNeWRYMlRjNmEx?=
 =?utf-8?B?WTFiT05IcTFGNnIwdExsZC9mWmlyNlg1dExyRDNCd29LSjFiQjAzd1luemFM?=
 =?utf-8?B?cklRNm5tWk85ekJYYnREQkNVcHVRZy82enFMWm9pbmpZTEl6bGRyTjJLSHhi?=
 =?utf-8?B?T3FuZm9pbGgzRW5pWXRsZDZYS3oxdzFIK2wwWnFqWFpSNjdkaUx0eEU5aXNY?=
 =?utf-8?B?amNpMVlHTmdFSmVjTUhIV1R1MzZnbHJmR01DYldmZEhJRzFGR2w0ZmFsUllt?=
 =?utf-8?B?MUNDMUl2elVKcy9KcUtxaTJ6QVBaYkxLS042MzkwOGxOZHYxYnlXRDBvY08r?=
 =?utf-8?B?bDBKeXJqcEg5dE1lQ2I2Njgxc2k5MyszR3ZlRTgrSnd6ZTNIUDc5UEJWWFpP?=
 =?utf-8?B?aXIwNEpsY0hpZjVjMUY4MEFaNEJIWm9uUmRSL2Z3SktUWDZQQUlDTmplMzk3?=
 =?utf-8?B?V2RSVXJPYkx0dEdvL1lIR09uczEwNkU1SUgxV3NzZjJObGQvRjhPRE9vRUdF?=
 =?utf-8?B?akd3QnQ4S1ZRak1GRXNNUzY0elRYTEszMXM0MDVkM0ZsWnRBU0VldzkzdWhq?=
 =?utf-8?B?eDUyclE4cW9VU29RQi9qOTJ5RlhpbkRDeTJMRGxFckJyZXp4TWlNZHMwN0tx?=
 =?utf-8?B?WlBLMWd4bHR5Y3cwd0F0MHRZeTJ4dHVYNkxlTFdFRWVpMSt3dkNEN0ViWVNN?=
 =?utf-8?Q?XTm8wPWUG667mwOaF9Vf6O+1hEACFWN42Y2xcV2z/axe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fbc63b-feb6-4741-2d78-08dd96e043d2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:20:12.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/EdBaf8uDIKFrhiuwTCJtshdv9lyGD6h18VH4zdwakCEaLIMueS556LFVp3SmhFYf5XJAQnnfz2im6fUMXhMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241

Hi Daniel,

On Mon May 19, 2025 at 7:52 PM JST, Daniel Almeida wrote:
> Hi Alex,
>
> I still don=E2=80=99t understand your use case 100% :/

I should clarify that I don't have a use-case for this (yet), nor do I
foresee that Nova will need to use regulators ; it's just a drive-by
review as I am a bit familiar with the regulator consumer API thanks to
past work.

>
>>=20
>> I just mean the cases where users will want to enable and disable the
>> regulator more frequently than just enabling it at probe time.
>
> This is already possible through kernel::types::Either.=20
>
> i.e.: the current design - or the proposed typestate one - can already sw=
itch
> back and forth between Regulator and EnabledRegulator. Using Either makes=
 it
> just work, because you can change the variant at runtime without hassle. =
This
> lets you consume self in an ergonomic way.
>
> By the way, the reason I'm pushing back slightly here is because you seem
> (IIUC) to be trying to reintroduce the pattern we had to move away from i=
n v1.
>
> i.e.: we explicitly had to move away from trying to match enables and dis=
ables
> in Rust, because it was hard to get this right.
>
> The current design is a simplification that apparently works, because at =
best
> you have +1 on the count and that is encoded in the type itself, so there=
 is
> nothing to actually "track" or "balance" within a given instance. Multipl=
e
> calls to _get() or _enable() on the same instance are simply forbidden.
>
> Can you add some pseudocode that shows how this doesn't work (or is other=
wise
> unergonomic) in Nova? I think it will make your point clearer.

So let's say you have this in your device struct:

  regulator: Either<Regulator, EnabledRegulator>,

And you want to set the voltage on it. Now you need to do:

  match &self.regulator {
    Either::Left(regulator) =3D> regulator.set_voltage(...)?,
    Either::Right(regulator) =3D> regulator.set_voltage(...)?,
  }

And you need to do that for every single method that is available on
both types. It's unergonomic and cumbersome.

Conversely, if you have:

  regulator: Regulator<Switch>,

then it's simply a matter of doing

  self.regulator.set_voltage(...)?;

It's more code. More code means more bugs. :) And it's going to be quite
a common pattern, so I think we should make it convenient.

Also it looks like `Either` is going away, which means each user will
now have to implement their own enum type.

>
>>=20
>>>=20
>>>>=20
>>>> It has been proposed earlier to use a typestate, and this would indeed
>>>> provide several benefits, the first one being the ability to have shar=
ed
>>>> impl blocks (and shared documentation) between the enabled and disable=
d
>>>> states for methods like set/get_voltage().
>>>>=20
>>>> But the key benefit I see is that it could also address the
>>>> aforementioned dynamic management problem through the introduction of =
a
>>>> third state.
>>>>=20
>>>> Alongside the `Enabled` and `Disabled` states, there would be a third
>>>> state (`Dynamic`?) in which the regulator could either be enabled or
>>>> disabled. This `Dynamic` state is the only one providing `enable` and
>>>> `disable` methods (as well as `is_enabled`) to change its operational
>>>> state without affecting its type.
>>>=20
>>> Dynamic is just "Regulator" in the current version of this patch. There=
 is no
>>> "Disabled" because there is no guarantee that someone else won't enable=
 the
>>> regulator, trivially breaking this invariant at any moment.
>>=20
>> There is a core difference, which is that in your version of
>> `Regulator`, `enable` takes ownership of `self` and returns a different
>> type, whereas `Dynamic` would take `&mut self` and change its internal
>> state, like the C API does.
>
> I see now, but consuming self is something we're trying after considering=
 the
> &mut self approach, which did not work very well in v1.

Just took a look at the comments on v1 since I arrived late in the
discussion.

I think both approaches have scenarios where they apply. It's a bit like
Rust's borrow checker: whenever possible, you want the rules to be
enforced at compile-time, but sometimes the access patterns become too
complex so you resort to RefCell to enforce these rules dynamically.

So please don't get me wrong, I think having a dedicated type for an
enabled regulator is great design, and its use should be preferred
whenever possible ; most drivers just want to get and enable a regulator
at probe time, and `Regulator::<Enabled>::get()` would be perfect for
that.

But if we only provide that then we also put restrictions on what the C
API allows, and users with more complex use-cases will pay the price by
rewriting code that already exists (a bit more on that later).

The following comment was made on v1:

> It's possible there's a need to split simple and complex consumer APIs
> in Rust?

And it sounds sensible to me.
>
>>=20
>>>=20
>>> The only thing we can guarantee is "Enabled", through our own call to
>>> "regulator_enable()".
>>>=20
>>> In fact, for the typestate solution, I was thinking about "UnknownState=
" and
>>> "Enabled", or any nomenclature along these lines.
>>>=20
>>>>=20
>>>> All three states then implement `set_voltage` and `get_voltage` throug=
h
>>>> a common impl block, that could be extended with other methods from th=
e
>>>> C API that are independent of the state, as needed.
>>>>=20
>>>> To handle typestate transitions:
>>>>=20
>>>> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>>>> method to transition the regulator to the `Enabled` state.
>>>=20
>>> Why not =E2=80=9Cenable()=E2=80=9D as we currently have?
>>=20
>> `enable()` to me sounds like a method that mutates `self` in-place,
>> whereas your version consumes it and turns it into a different type.
>> Such methods are typically named `into_*`, or `try_into_*` when they can
>> fail.
>>=20
>> Actually, this could even be a `TryInto` implementation, but in this
>> particular case having methods with the target state in their names may
>> result in clearer code and allow the reader to model the transition
>> graph more easily.
>>=20
>>>=20
>>> If we go with the "Dynamic" nomenclature, and we agree that there's no
>>> "Disabled",  then we can implement "pub fn enable(self) -> Regulator<En=
abled>",
>>> for "Dynamic", which is what we currently have, but with other names.
>>=20
>> Not if we want to provide the behavior of the C consumer API, which
>> requires multiple calls to `regulator_enable()` to be matched by an equa=
l
>> number of calls to `regulator_disable()`, which could be useful to some
>> drivers (lest they reimplement their own counter).
>
> This is explicitly not supported, because (given the current code) why sh=
ould it be?
>
> If you want a given regulator to be enabled, just make sure you have
> Regulator<Enabled> in your kernel::types::Either container.
>
> You don't need a counter either: Regulator<Enabled> has a count of one, a=
nd
> when that goes out of scope, it's decremented.

That works very well for simpler scenarios, but won't cover everything
optimally.

A common pattern is a driver (sensors come to mind, and maybe codecs)
that acquire a regulator at probe time, and enable it every time
user-space opens the device (and, conversely, disable it as the user
session closes). The driver wants the regulator to be enabled if there
is at least one user-space session opened, and only disable it when all
user-space sessions are closed. With the proposed scheme, a Rust driver
would have to keep track of the opened sessions count and disable the
regulator itself when it reaches zero - effectively duplicating what the
C API would happily do for it, with the potential of bugs being
introduced in these extra lines of code.

There was also a discussion stating that it is safer (for the hardware)
to leave a regulator on than it is to switch it off when, due to a bug,
it is released while its enable count is not zero, and I think that's a
behavior we should allow if the user expresses a need for it. Safety is
not only memory safety :) (and in this case, it is not affected anyway).

>> - `Regulator<Disabled>` guarantees that the regulator is not enabled on
>>  the consumer side. It could be useful to have for drivers that use
>>  distinct types to store their state depending on their power status:
>>  the powered-on type would store a `Regulator<Enabled>`, the
>>  powered-off type a `Regulator<Disabled>`. That way you cannot even
>>  write code transitioning between the states if you omit the regulator
>>  - which I think is really neat.
>>=20
>
> I thought we had agreed that there is no =E2=80=9CDisabled=E2=80=9D, even=
 in C?

The relevant function is called `regulator_disable()`, and it may or may
not actually disable the regulator, but the consumer behaves as if it
were. I think we should keep the same nomenclature for consistency.

>> These two should cover a large percentage of consumer needs, but for
>> those that need more fine-grained control we should also have one or two
>> policies that follow the C API a bit closer, e.g.:
>>=20
>> - `Regulator<Controlled>` (or just `Regulator`): user is granted an API
>>  very close to the C one, and is responsible for balancing calls to
>>  `enable()` and `disable()`. Regulator remains in the state it was in
>>  when dropped.
>>=20
>> - `Regulator<Switch>`: calls to `enable()` and `disable()` do not need
>>  to be balanced, and the regulator always transitions to one state if
>>  it was in the other. Regulator gets automatically disabled on drop.
>>  This provides a simpler, safer alternative to `Controlled`.
>>=20
>> Note that I am not advocating for including these two policies
>> specifically, these are just examples. My main point is that we should
>> also provide a way to change the regulator's enabled state without
>> requiring a change of type ; which policy(es) to adopt will depend on
>> which restrictions we conclude are adequate to place on the C API, if
>> any.
>
> Can you expand a bit on the issues of changing types? Again, some pseudoc=
ode
> will probably help a lot :)

See my example using `Either` above. :) I hope to be forgiven for the
user-space sessions example as I believe it is easy to model.

