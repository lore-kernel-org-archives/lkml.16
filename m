Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E9C2797B0;
	Mon, 19 May 2025 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665834; cv=fail; b=Srn2PcmdRIVdh+FU/SGU5d1J+iM4K4lVwlXRBPClxXg2FwjHM9arHWu+jVCPOP9QdznbAm+NrXDMBAolFUXoc5vR24bOu9Zl9ISm92WedWNFOFhBWqEWKUb1NeOdRN/RrhKA1XxlnUBbXd6tFkVqMffENWWVuCRM2UqIBEpXkEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665834; c=relaxed/simple;
	bh=AcaVtQQIRBCl7IF0ft+xHiPFV+Ax/V86K8VD4Vwd83Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Tgl6f4Hir9YPe4iwAxqX3/ZRHq4NGutgOCpgSan8b115S9DVlbI7vG+PKb0r2hHVG34Q2r3ZtZMXdOx/J4TfAA13HT+elIp+Zk8phENISonrLC1FrGLYB9FvZD5Jd6nVrtmt2m8VQfs7tuTvyOzxAuRd6upChNvcdvu9sLmSndw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gmaCPHjc; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gmaCPHjc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWFIMCdb482hmkKapX4KgBljYDZKqTLWFOLZYvIT3EvpbelAX/N2tXZ14k7XJIzK7r0N8C+0mRXOVpnVNicBAOG5DOuwNsHzCwQCTyUuvZvG7/tEZE8J3W/aGIxBlnp50CGjA6kULpo1nT0bDj8jEpzrK7C7TB7ZlGN1XlBufN6ElZU/tL/TSw0k/ysVwu/H5OeZ0nmMOC1u0D/g9TiHmXZH+QMpc1sHgmMtKtGHUpBuvR7qMUWtBxgDgWOr8inERE0x8/G+b3rnmtROv4IIki8dgoFgbA2eu7FEWJvcU7mjvBlfpd8bdXHPO2YAvEABCW088wVRZeOvGTL3Wv9LGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcaVtQQIRBCl7IF0ft+xHiPFV+Ax/V86K8VD4Vwd83Y=;
 b=Uqmh9kEiMgRim9bDqRX0p0KRVjQDDM3r35YzywWoH93zauoWHQtliPI21rhbRTjzS+zjga8ciC6llsQrmSxSpzpQA7cNfX2lvMoNRl/8UXe4bvUaFgcSpnNXXtoVUCq1XdGYwFkfIak92WoBx5fOWSRhRTJl81WMdGk0Zpp3nDDf5elOrPYTGBsWff3S1iTzUvM4dmjJGlDu+7wxUEXP86IYyFXsiSvs3XOdn+fLMj9QG3ANFdN2WgNe6oLoe20bVIMu1NEJw3WaGZf4QuExW5i9VQFyb9pGWWHSg4rFqAU5Lqv9lt6Iv7Xc15zIc2hKUMJD+6d5qMhxLgGVDA/new==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcaVtQQIRBCl7IF0ft+xHiPFV+Ax/V86K8VD4Vwd83Y=;
 b=gmaCPHjc4hOe7jRKPUBg1q2ax0f3moPQ2ih6QcTEwD9xMMIONaGjfRYZz8XdapdhZbMhCVPcpaUzNTCCp90fviuUiBXevjvYXJ8gt0tHO0OKGH6nFe1wXc4Bzx1qzAX5fyciwCC753GF7k18b+ZCRiXqe4Nvv9HfyeyBMIl6+6Hrw+9FqtSBldGDAOqB8sngGYtPmnga+/jQlTsq/RJaGPKhhoGmNx9hzX+cAo3cp49wXCxXtSiTGY0Zt1I7/+MU+GErjOjdX2ThrHKYnYQvY7Pct2ONyOfTHRLd2GSzA0hA9vvqxKtNN8GmAo9a37+wxR0qyiudAilHw221x5l3Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 14:43:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 14:43:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 23:43:44 +0900
Message-Id: <DA07TW3IGHW7.1QVLH8XUMWQ8Y@nvidia.com>
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
To: "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
 <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
 <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
 <DA048ETXB1Q1.3KVZ2FHENWKDL@kernel.org>
In-Reply-To: <DA048ETXB1Q1.3KVZ2FHENWKDL@kernel.org>
X-ClientProxiedBy: OS3P286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:201::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac0eb72-c32f-4a53-8b5c-08dd96e39058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1hzU0Uzb3U2M3R5eUtkclNUL2pIQjZwcDBVUFpNSTlDdWl4bmlDcGFXbjhm?=
 =?utf-8?B?YksxNExjOFFYZFZ2bTZHN1JkUGVGWGpGaWErSjRPUXdpaExBVkdvMEo3OEFv?=
 =?utf-8?B?T3ZJL3QwdHA4NlJmcVVGREFKVHRuSEZaLzYzQnAxbDNQc3phZ1lvblU0Y0Rq?=
 =?utf-8?B?RWt4YW0zN3BOUkI5cUl2aTFDeTFDTFpSTG5yTXRsVld3NUlDYVFxc284bHpj?=
 =?utf-8?B?eS9jS09QQTlpby83bG1wa2xDU0NueHdkQVgvNnBPT0FXbVJJWGhHUjFZOW5r?=
 =?utf-8?B?blROZXd6Yy9aeVVhZ3VKM0tBaktUeXFVSjlxWGFZZXNaMEdDOXVicWZRTWhH?=
 =?utf-8?B?NEZ0a1VzOWx1bUdMcFF2YU5BTjNLZ1FoR0RaSTRQczl2TEcwdUpvc094Mlg2?=
 =?utf-8?B?Vm8rbmJlOEZVWUxwV045d1o1dTk4ZTRJVFZjM0VOVEkwd0NwZ281QldYUGpZ?=
 =?utf-8?B?eU9WcmxSTC9WN1NVVE9xd3dkQzhHZ3dyMmlLMFc1Q203akpZd3ZiNUdLYnQ0?=
 =?utf-8?B?dTJRTWVJWS83SVhqN1R1cmMvRDZsYUFmQ2VOclhvTFpGOWdwNmJjaUw1NFhk?=
 =?utf-8?B?M29acmlVcHoxTUtIR00vSXVUSGtoTFF6SnluYklwNHRWazFIem1QSVYwMHgr?=
 =?utf-8?B?SWgzUWVRL2ZnNUxaSFhMQXNtOXVZcGp6Vm9sVks3aFRKV0NSaFR2NDRnTHFI?=
 =?utf-8?B?NmF2aVhaRFNZTXAyZWplT1U5UTVVSEpHM0FFcUZVMlMzYnd1Ri8remRpNUtB?=
 =?utf-8?B?bUJ0TzgzcjJWN2tpc2NKR1BVcW1jV1U3L3hBdXE4MHRUdXduYVhZUjc4VjRr?=
 =?utf-8?B?NXppV2U0RDVDR09udWJXWHBTM2c0eXZ2a2NhclRtMHpvMmZQMmI0NmZOV1hz?=
 =?utf-8?B?R2crZmNXU1BLREpmU2dlVGh2eEpGVWpCR1RrMDJMbHJkd0xEaHoxcVNLMHk4?=
 =?utf-8?B?NlRzMnhuNmJjSHoweStUS3F5b0RZMlRqNVZMNU10eWZvT3lSR3RaVmRIZjAr?=
 =?utf-8?B?bnV4czFORFVDS3R0dEk2Q3pwa3VTQ1RYUGU3VXJ5alFYcGsveUtyTU8yRWZC?=
 =?utf-8?B?TCtCem1LSHM4RDAxSTN6a3V5aTZwS1JLY29wZ20vMXpZakVhdDFpdjhmNEI0?=
 =?utf-8?B?VkVSckROcXB6WjhhdmExMkhiRHdBVGRoejQyY1UxVEpqSGNOQ0NoV1k0WFVr?=
 =?utf-8?B?UW85aStBYVNoQUdIQzNmVWszWHlVT1ZCQ3ZhbHE0RlcxV2NxeHhxVG16SFFN?=
 =?utf-8?B?SnBtSUh6S0NFc3RXRVI2eVgxUnpsMUZnbEJYU3BnWGVGTXdGcVhNclVHMmh6?=
 =?utf-8?B?d2tVQWpqY0pIdDZkdHhMRUxtYWtpRThwb3JtZjZVbE1rOGVsMllEVUxtU2s3?=
 =?utf-8?B?Z3RBQ3lXT1diSUwvNWFtbGFINlZPT0VYMktVUEcwN1puRm91YWJLV0RmN0RS?=
 =?utf-8?B?REE2a3JlcCt0YWZHd3RSZ0g5UkpVWkE5cEk0Q3l6cjVmeVJqZDN1K0d6bElB?=
 =?utf-8?B?eGFLdHo5bEtNeEhhZU12OFFxeXBjeHBHWnN2Y2xFSU9XTWtCTldPQm1Cdzg2?=
 =?utf-8?B?TmJkSm1GRGZ4U01wQWNsV0l4SWJOMVJLMWdVU2NjTjJoY29NWXZkc0JlcDFK?=
 =?utf-8?B?cFV6dGR5ZndpbGo5K2FoMmQyeXFqUU8rOFRHbE9FNGJUcERhenEzT252bG04?=
 =?utf-8?B?U0E0blJRVm4wUGZwa29XM3psYkRCSVhxZjRmb0htRHM4MEl6bkNwZnErd1Qr?=
 =?utf-8?B?TGZUVzRwMzVwNXFVWktkSys2Tk1aY21zRHlEeE4zamhMUE9SV3B2VmxIa3hD?=
 =?utf-8?B?R2E2VXp5RnVyT1VIYXVXYlhrVklDYUxHTCtXK3VIN0RvNGc1SlZUbnRWRVlX?=
 =?utf-8?B?TVYxMGlNQ3kvZGFOaHFZTjFOS3B3YWZJZDBwU0FveWpBUmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJFcEhkcDJVSk9ldjVLOWNjV3NuM0ZSajh0blAwVTlkWFVKZkFZaW9zcndz?=
 =?utf-8?B?ZXZ5Zk8vc0lhUGQxcTVzUU5xVnRPajcxdnB3YkVtVW1ncDlXeFRMWVpvdE9y?=
 =?utf-8?B?WmlHRnRXbEtRTG9pblRIbWpoLzZlaGlPd3NWU2lmYWVuS1JuYzRwR1NLVUJt?=
 =?utf-8?B?cUoxLy9DbnFNbFR6MU5hZktrYWJ4Zk1nbTJPTjNGRUNCMXM1Q3R4WHcvYnU0?=
 =?utf-8?B?K0EzZnY5Wm00U1BpVmVZYUgrYWtLNkdzNWd4eWNEQXU0aG11VmNSL0RCd3ZV?=
 =?utf-8?B?bVl4QXVRUVNnZWhka1ZmcGhJRkVGbk5NZzk2VlRGUGVoNWtGTGFUU3lISWpG?=
 =?utf-8?B?Uk9SYjdqdEYvbmV0T0JFcVQ2elhHZkk2Q0ErWEFVeWVPOURxRktSV3hLWnZF?=
 =?utf-8?B?QXVBZ3RXQ3FDTGdaQjRyQnRZcG43YjNDbVBQcSswREVBdmh6QjRkMERMbDdL?=
 =?utf-8?B?dVU2a3o0YXFXMFVMWWxINTBrMU9JVUxIVGpYd216WUsxODd2SVAxNFMvcGxF?=
 =?utf-8?B?V0docXlWZys0TnAwN2l1emh2Q0EwMkRRclNrYlRXVExQOUVkUFh1aExKQUg4?=
 =?utf-8?B?Q2dMNndmTzNJY2RJam51WEZjOHFpSGF6SW94YStPTFkvTWVQc0dMSFBpWFFK?=
 =?utf-8?B?Mkh3NXU2R0VMMGVRQThvRHJXTUUxdi9vcG96d09NNUlWWkkwZXd4a1R1dyto?=
 =?utf-8?B?WVdVQXNqaXcrQTZCTmdyZW4yM2ZCTmlsN2FOMzc2VngvMHh2b1hXeTltKzNW?=
 =?utf-8?B?VlB3R1ppTDZYOFhJOGhBbkZWZjdaU21HcUIvd2pwSkUwdkNWb01IT29FMkVu?=
 =?utf-8?B?MkcwUGNkUkdvSC9DWUJDSnpZVTY5eHYwelFMNk1SSTBPNWVFNDB3QjZ5VG1D?=
 =?utf-8?B?TWgraTFmNm9BTXN5c3czdlZMc2c5NjA5M3IxdGtOZEl0Z2NZR2EyVTJDL2pP?=
 =?utf-8?B?U21sT1dqNFJoMTdmbzlTOUhhd29jMmhZZGNoTjNycGdUQ3NOcjRvYnVhWG9v?=
 =?utf-8?B?MVlEdnFXdjdmSlRDQUdRSUJYSURsMXdUVzhzQkE4M2lDL3l6RHhKU2lnekZF?=
 =?utf-8?B?WEhGL0UrZFNicHhkWmJGUE1rR2htdkFhTGpLQ2NhYXNjMTJNZ0dEc0hoemlG?=
 =?utf-8?B?UWhzbGlRVldJTyt1OS95QjRVampERFpHdXExcnY1M1NVVjlCTW1FbmJHYW81?=
 =?utf-8?B?bW9pLytRVDRwSlpSY2ppaHdlSi9RU1p2RHBhSDhWUXJQUVFxRnhaVXd0YlUx?=
 =?utf-8?B?aXFJN0ZFbWZNVWE5MEJTTTBabXZ4RU9nRHJUYVEvM1RGNkZrL0h3clZZVzlW?=
 =?utf-8?B?Z1c5NVNWUUY0ck5Nd21IVkZZMlBmTzN0UmZiQ3k3aHBhSkFMSHBiT0dFWlJZ?=
 =?utf-8?B?WDhvdkIxSU0vYjEvUlRaRnB6b3RsLzNkcW5aeE5kcWxYaFZ2SEVHMDFvSVRj?=
 =?utf-8?B?NGtmREIvVXdQR0s0TGYvNTM5M2VwUXAwaWFYLzFRRnFFaVNBS296YU03Rno2?=
 =?utf-8?B?VjdmQWpDNkFROWd6R2xXbFF4M2k2eHBRNmpIN2VlOXRXMVFEZzZYaFRVUCt2?=
 =?utf-8?B?VGxDQlhmVjZxeEFSOVJyZFUxbHdVQUZSaVhuaXhzT1B2SWMzZ2xTZ3FWTW16?=
 =?utf-8?B?MWNWQzJqUng2NGxtakVCTTd4Q3lRL1FnNG1CeWxWbEVWNEV6dm9NUEhKQ0h1?=
 =?utf-8?B?TU1ac3hSTmN4NmtRaXBwMXFQbjFtdGxQUTJkMlR5YlJSK1JMRGd5dXpUcGJl?=
 =?utf-8?B?NXJZUWlndmVRUUNvcTFaUlBsejBFNmhmZGlrck05MGdQekRYT3dtVUpqWlhY?=
 =?utf-8?B?U1NwR2oyOW5xcVU3c08rSk5LYTJCQjdVMy9LdGJrcGp1QzFUN0V5VmVqUWY2?=
 =?utf-8?B?UVh1ZGVTU1hHcXJUMVZCaWQxNFVlNEF3WVoyU1M5MHU4UHhaTmlmbk1VdWY0?=
 =?utf-8?B?SnkyMTFvS2NmeWNKUHpiM3J5dThtaThlUHpyWWwwNEg1MjI3ZkIxRWlrUGFH?=
 =?utf-8?B?RHBWSjdSTjlGWDlaZFprQ3RHU2djbHpxTDE2SkwrazhrbklPQjJSMmhOZDdR?=
 =?utf-8?B?UlROVTUvalN6WEROeU1JdkppQ0ptUFpZTFNOelRVRGRrRTVBWGtGVXRrLzgz?=
 =?utf-8?B?TmZJM0NZdFNYYnZIZ0thZXpaR0xCcVNvZHN0R3g5M21ETjNubFlKL3Y5MGNY?=
 =?utf-8?Q?mhJxtzDrMdd1dPR6AIHsQHmNE6fl2iaVfKCOrGL7RZm8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac0eb72-c32f-4a53-8b5c-08dd96e39058
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:43:49.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yD2Ds47zrI7KD/6XM79fWc2derUqI0GAA7Sn4ODFvFR9Mo6SmgMKTW3S7lhIlZj1M/AYfPqHKvZdkuS4nF4xbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996

On Mon May 19, 2025 at 8:54 PM JST, Benno Lossin wrote:
> On Mon May 19, 2025 at 12:52 PM CEST, Daniel Almeida wrote:
>>> I just mean the cases where users will want to enable and disable the
>>> regulator more frequently than just enabling it at probe time.
>>
>> This is already possible through kernel::types::Either.=20
>>
>> i.e.: the current design - or the proposed typestate one - can already s=
witch
>> back and forth between Regulator and EnabledRegulator. Using Either make=
s it
>> just work, because you can change the variant at runtime without hassle.=
 This
>> lets you consume self in an ergonomic way.
>
> Have you tried to write such a use-case using `Either`? My personal
> experience with `Either` was pretty horrible, since you always have to
> match on it before you can do anything to the values. It's not really
> ergonomic.
>
> I think we should remove it, as it also doesn't have any users at the
> moment. Anyone that needs it should define a custom enum for their
> use-case.
>
> And effectively an `Either<Regulator, EnabledRegulator>` is just a
> `Regulator<Switch>` in Alexandre's proposal if I understood it
> correctly.

Exactly. And btw, there is no reason to block the merging of a simple
version with just enabled and disabled types while we discuss the rest,
as long as it is implemented as a typestate. Adding more ways to control
the enabled status just involves adding new types to be given as
arguments to `Regulator<>` and their respective `impl` blocks, so it can
be done incrementally on top of that base, which I believe everybody
agrees is sound.
