Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7AD27466;
	Tue, 22 Apr 2025 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330996; cv=fail; b=nKOWICS1mGNxoHzN6wgqbir1CcCSJAucWhomWPub7yt3V21OzqgYavVwqIUs9coBGCy/sKAKsbF8BXA7bJgleV9epixHpJwYS0vfPI4nKVQQGEQs+5dOhkLjdW/xnZqI4Wj6A5sQ+EfXIj3jhG0CJ2Zw43JlTokg2PBTL4SHV/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330996; c=relaxed/simple;
	bh=2mFqTJMq/g21ivmzZC+FS+Nr/Is4O0FCImY1pQs6R3k=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ktKOMwEHyf5ya5lKkOqVI6pe5YeKneIy60Pc2qd6mo5YOSX+hgAsl0zJFBALG5T2l236GnB/yx77V7HH9xnpdxf/uxRo25KW6MydsGgEAeYXCr2BoVusQPMSQfpC764dIdju+pP42N+XeWZs4ncmsSNTbbw7ByJnwxijzICfY/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bIq2SvG7; arc=fail smtp.client-ip=40.107.220.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bIq2SvG7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yk70ebqJ6nUF81oeuyAmzkd8Wpwfwh0Pm0yYYrzPStNIRXdvsNxgcdwcqM42+Asj7TrLmpxNgXGGh9OLxNI9Wc7A8FouS4O7vxLXAyEqVSdZIKoe2V69a3K+8BWlEktJjq4iZYptkd7Moo3blMv57p6MJdjWkZdnOvGsPkuSUi4PhPQVFYHp6G4I3cTRUU2MEOz3RAXZeN1Tg2YsboPN7mOaICt37+gzd5ti4b7mtTU0CLi9yHu/VgB8UgMeEh7doHmKhNtibPzlT6gj0Fe3gZSm09f4EK8i3tST4+pl9sDgFwTytOICFvKdnf0dRK8gT9Rc9VeM+OiDgbvrK8udbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3BTzr7bkZfQiRiBAAdH58ZEXdNwvoKmZMgeaNovsNc=;
 b=K/vOneygaE/xZw7/IqJhYKOQdZL5jdmWm77/IBKtkeY1OJsmvoj8BzGGxSjsF8FhO4SIHelmzLQXA3IjJun4mQb4ZzTKncurjgl6dDMuXYbGuOyCf78IKmnrC1/TIkyfTnhOqjvFoO1oCwYM6pt9B41yAMcmuQkBkWg9H0Ynmh0UjxoMk4QInzojCCI+Xp+LjsujAl9c/LikksVpH6xxXWWeEQUz/ecu0iX1GuNY/LXZi0qHlKA0xAqo6jpayQ+WVgG0tjT2Yg+Uxab9lioe7tbd+M4u3la1OfNs7gFpComFnS5o2JOu0oA73lAwEkOK4Hay0LY2X5FeSpiuS0/QGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3BTzr7bkZfQiRiBAAdH58ZEXdNwvoKmZMgeaNovsNc=;
 b=bIq2SvG7hGw47+fUcQUi784JzkXkrmOYCvrZ6Yz+R1QmqCiC3t4HRUPOFrIkXBr5ph5CQ5Y2Q2I+eymvxrYmXa7sVuW93rJ1xBSoRmho9kcsoqi+FnjALSHSh0y/+fHbtvJujNnCJOEUXezc8V3UG6MgYExElAwatQS2Jh4Xr83t//K1Yt91k5KIXXm2vKB4AbdzSpPZeY0YbvuFdslXEpiO7QXrW+oaIloCwoNCYqU9uRlkZBlTVp8g8qmG+S+32Ld8zBdu6Qf8DdhHdXnoMmzjOTzQVDtcKA6ppYrcDpea+ZBv388Z3jQbPy/6uYrjl9KUD24VqlHQldqs0ZQKkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8822.namprd12.prod.outlook.com (2603:10b6:510:28d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 14:09:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:09:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 23:09:47 +0900
Message-Id: <D9D876NZCA5O.KFO526Q4HEED@nvidia.com>
Subject: Re: [PATCH v6] rust: transmute: Add methods for FromBytes trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Christian S. Lima" <christiansantoslima21@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <~lkcamp/patches@lists.sr.ht>,
 <richard120310@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250330234039.29814-1-christiansantoslima21@gmail.com>
In-Reply-To: <20250330234039.29814-1-christiansantoslima21@gmail.com>
X-ClientProxiedBy: TYAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:404:15::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fc8aea-0fef-4e8a-1cb4-08dd81a7586e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1RZT25CWDNZT3I1aVUva0R1RDJmYnNtTzdRdmJ0bWZNOWZsblFNY01IOVdo?=
 =?utf-8?B?YmpRRHBNRno4dzdlTDE5WXpoU2NGeUJwNGwzTkZIbExIc0VaVmhOcnpnSEZ4?=
 =?utf-8?B?YWxuUzhwVC9aRE1UQzJEWUxUUVFlTE5rTjZROEoxNXlPb3gzTzZBVHlSUm9C?=
 =?utf-8?B?a3YvR3NCVmlLby9PU1NRM3dVblFYQk1HMXhLaTQ1amlVUzFKQWxUMVNBRVN1?=
 =?utf-8?B?MXZhQVE4U0kxOGg3SzZybDNxaVJzUTA0YmpxWXNwS1JZdkhlTmpPWG1EUnJh?=
 =?utf-8?B?Q00yb2x1UmZ5Q2dVTTlLYmM1cUVUUmhrdzJLbVhqZTVQOEZhWVNtUitXbWdP?=
 =?utf-8?B?Q0JKbHlvZ3F0ZXRHZkJlZjd0YVlHMk1BYmt1RFd1VDFVbXpFT3piMUJ0cHFO?=
 =?utf-8?B?T3hoZjg5MXRBd2wvQWZuT3dTRlUxcVZmVytFK2NxK1drUVhSYnRwUUFhZHg4?=
 =?utf-8?B?TFQwS0RXN0EwcG00Wm5jbWRUdCt2YldIVTg0UE1ya3IxZFVpQmV1c1kyak52?=
 =?utf-8?B?QkdoM2VxeThSUVU1bHpEVDBveDUzRWdWWE55QkRKOVhVS0NTcnZ0eVhoNHBq?=
 =?utf-8?B?V3BEK0xNMkY2THhINUwrMXdnbEN0MDhpNXUrN25OdmlPMDRxdnJRbUYvV3Jh?=
 =?utf-8?B?cGtmcjhTcWlKckVrRTFwbTR6S0hXN1djaHNVV1pTN21sTHFZSEVramcvbVcy?=
 =?utf-8?B?d2tNRHkzWG5KcDFJaExRTC82VGQ2KzVhNFN1dkNUNDlJVFg2VEw2WWhKN0xw?=
 =?utf-8?B?ODUvRFU0YkRwL0xXWkUrdlhqSGduV2RCaE1kb21GQm5LWUllVW90dU42clVp?=
 =?utf-8?B?U25DbXlqajh3ait5UUl6UkxGb2VZZmFNTTB6V1RnWWlDQnBuQ0xHVGhJcHZM?=
 =?utf-8?B?R0RMQlZGT0N2VXdqbkY2QXFBT1AwRjBDNitIZ0ErV1FOalJWaEZ4QjdTYlhv?=
 =?utf-8?B?OXU5MG82eFRjeUR3RE9kMjZXUFRXakp4SU5HRk5Cb1hUYVQrV0IxTVVISjNy?=
 =?utf-8?B?dktPb2xsTmVTUTJIZVVEQVFNYVFUdUoyQTU4RUc4WFZ4OFpYaDZXRDE2VUZP?=
 =?utf-8?B?b1RSTWRBUjRVL3A5QXVybXIyb1J1YU1iQldmZVp6MG1ZeXdDb01uRUY1bXly?=
 =?utf-8?B?VUtPYURyWHFJaksrN0h1d1Y4ZmVSV0U5SXJhdTcwQlR5dGJTaFYxRmdyakdY?=
 =?utf-8?B?TXEzTERIZFA0VnMvNm5TRVV2c3BnUDBRaGI3U0hXcVhmUVpIN3QvL3p5RjVl?=
 =?utf-8?B?aEpWZnE4VFk0REVCclc1YTBJa2hlVWdsRk0zbGRvMC9TRHZReXhLVm9kVWxO?=
 =?utf-8?B?UmFwb3JqZTN0czZQR0RZYzdRKzJnRlRjUDM4cmJhQVduamZRc09oOU9uRlZX?=
 =?utf-8?B?ZDFVdUZzeEgveFpGKzRCSWEwR2pVakV6aXVPaVdjWGdKRzFNMXFwcUl6UUpi?=
 =?utf-8?B?ZFhvN25MZWUrN0lpckNtbjU0eDdPdklzRGpZVlhFY1lpNHpOeUE5YXlZY2tO?=
 =?utf-8?B?K1NHMktjVVNlL1ZERlZhZGhtRSttUE5vaDZXekV3Q2MzamlYRldBMVdDQmZo?=
 =?utf-8?B?NDZMNHo1VjBnK0dFQ2lObFRTcTNHTEFGeklsYlgxR0p0WHhWNnpoODE0K2Nn?=
 =?utf-8?B?YmYwRXNQQzdMVXVFVEZJK2ZNRGhiNUVMd09tOTRmQ2FGV1BqUUd6Q1JrZzU0?=
 =?utf-8?B?blpPd1NtV3luYkMvc3hYMS9FQ1UvV2hVcUhSN1NiRDhJUXZvQW10VU56ZXRY?=
 =?utf-8?B?Wm1JcXN5bTVSamQvM1hROE9DREY3L2NQN0lxdTQ5NnZtdlBUOUd4VUdpU2ds?=
 =?utf-8?B?WkpORzhzWDY4T3lWSmkwQjR6V3RRcGNNVFdqT0dub1h1MWFJNEgvTXlIQXZW?=
 =?utf-8?B?bmJuNmtMY29hd2FWYnFNQmF3OVRHdHVtVW1NQmFkU2N5cGFtSFBQT1Y2MjBj?=
 =?utf-8?B?Q215aUdjdXA1RlpRSVRkN3FxUG9OY3ZmS01JN2l6eFZhRDRRMWF3dlAza05w?=
 =?utf-8?B?engrUFVPYWtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDEvZFh5aWM5L0VxdFRHb3d5OHo4UzBXMnVqWkJFbWhoZjlOeGFQaHBFbVhD?=
 =?utf-8?B?MzMwUVRJWEMrVkVXTjR3YzZ4K2VaSzNyb0doYmxmWDVQTFplbXh4amhVUzRq?=
 =?utf-8?B?MnZ4ZnJWZW0vNUM0bmQzenZ5YzJmbDRwNFdrMmVrem9IWDdTYTBMbC82QjBW?=
 =?utf-8?B?WHh1T2haRTFtM0VPSDd4MHl4K1NrRFRvcUcvRS95UU40VUsvSVFRUW4vS3k2?=
 =?utf-8?B?N2czSnpLOGhzZForWDRQaVlxTkhKL0YyRTdvdUU4cnNWOGs2TFhrNmwwdU5j?=
 =?utf-8?B?SG5VejloUFhEYWF4VDFsejdjZDZUczVSVnlBVFlpd0NIZVlZNlRPQTJRVEZh?=
 =?utf-8?B?WnBpN0Y1MnE2VURtMjEwbFkzRlY3QkF1bnhVM2RKM3VUNDhwbHorRXNocHFa?=
 =?utf-8?B?enhxTWJvY3ZmRmJsOE1zbDVCeWxZQ2FyeU1Lbys4NUp6dm5ndVpGRFM0VG00?=
 =?utf-8?B?TmpYQ0xlMXlWeWlqWEVnSzIxTm5XdExSNzNYNHcyS1NqTm5XZGxyUllSNmU3?=
 =?utf-8?B?MHgwS0kyY215UCtFNXY0M1hiUkt0bHJyWUhIdTZyMjBzaFdLWTJRV3orY01U?=
 =?utf-8?B?ODA4S0hLMFB5RFpncEwxR3ArU05UZXpTWkszTU1lZFlGNUdOM29UcjFaV2dC?=
 =?utf-8?B?SG9IbG9GK21YSjZCanpuZGpuQURHdGc2ZUlsK0RzdUZGVk95ekpYaGl1Zlh4?=
 =?utf-8?B?dDlpUDFGaVI1SjlOaFpCZEVNN0FKeXRSYTR4U3ROYUd1Z2ExRkdKR25jc25h?=
 =?utf-8?B?aVdOQVVuWEpZTU9qWHZlUE5sVTUwZzVmOTVsNzJJWVdlVEI3RHFVSlJWdlVR?=
 =?utf-8?B?RUh6R0NLb2U3Qkp6aURtajhNdWppUk5GZ01QOU9sUUNNalJjcC80L1VyVmha?=
 =?utf-8?B?WHYvNkRpaklqWUV0TEN5T3M4ZFNpd01uMkZ4MHRHSEtwaGdsRWE1NXM1ekNl?=
 =?utf-8?B?cWNNK2tVQkE0N2xtK1VLNkJkSlhYVmk5QlJVcXYwbWpvaDBhTEJTTWVBTS9M?=
 =?utf-8?B?ZkZCeVhDdUIzellBUE1TVnlwTDRYQ3g5aUNac3A3K3kxakxvQURYWm9GRXRJ?=
 =?utf-8?B?Y0dld0pzai8reVkwZGFKVjVwbWtIQ2tzYjBYcUNjWkpQSFNlWTIyU1ZWWFJq?=
 =?utf-8?B?VHh5cWQ5ZkZOZitRczN6dzMvOWhTa0xST2FQY2o4Y2lPSkY4MGp0L1pMY09R?=
 =?utf-8?B?emVXMkFkKzltR0VXKytOdUhPOGlNMnVlaTUrSXFBaHpSN0xNSzFEVUltRWUv?=
 =?utf-8?B?ZGJyTWVOSlZaYUduNGF2L0RwNUZNcTBLMjM1NWtoTkFuTmN3QkhYRnl6Y2F6?=
 =?utf-8?B?c0lPc29wZXk0NW1QZmtvN0phY040bXB0aGtOb2xENWpHU045Ly9mZUF5VndS?=
 =?utf-8?B?MUo0dHNteVcxd0ZPeXFlV0tvMEtjbVdUbDhuUkRvZGUza3NxeFpBWFhLOWtr?=
 =?utf-8?B?MmxFejhxV083bUxQeDcweTJzZGdqazlEUFZyT2J4OEMrOGY1TTFPbU1aYmR3?=
 =?utf-8?B?R1NjY3ljK2ZMaVFMNm9FNGI5bituTFZMb2RiaEZZMzZkb0F4UWEyeVhNbVVD?=
 =?utf-8?B?Z0Z6UU5RM1VRRnQvWkFsWWU3emlJS1g1Qjkyb0JQb2g0YXFvSjNtVGJHZDRx?=
 =?utf-8?B?cTNuR2ZOSnF1K2V4WGZHNlJ4aGVYK25SeXVLWThmWU0zYnIvODlBK05iUDRi?=
 =?utf-8?B?Nkw0c2MvckM3SXUzU3lweWxqa3I2Tkc3cWl1WmFNNlNhSTYyaTRLMUJLL253?=
 =?utf-8?B?ZUZMM1FYMHErSk96NGdla2k4bHBIN1VCS05vSWt5blBQcG9yaFFXWERmRFNC?=
 =?utf-8?B?cElnUnQrWWwyRWQxak1aaUdQczFORU10eEcyN1M5d2l2d3pWcjZiV2E4OWNS?=
 =?utf-8?B?ODNVWi9ZckRLOGFveHI2cG9Xam5WZGNFSGhuVEdEemhvLzBCMDBCYXd1N2Iw?=
 =?utf-8?B?ZFdUczJTVDR3TE0vU2FjNkJJNHJ4UHB3ejVFTWZOZzd0eldubU5EU3hnRU9I?=
 =?utf-8?B?eG1PbERpUnVIK2lnVnRXOGxBTUN1bGN6L2RLOGhYL2RvRDdWejMrTG13ejBJ?=
 =?utf-8?B?K05RcThTaUdDTDg5cTZXb25CNk42cFZXVXpIMVM3b3lUdkVjeHhveTU1eGdN?=
 =?utf-8?B?TUpLMkpBeUc1Y081MTBtRG5ibGZhUnpKcUxYOU80SXc2bnNMM09LRTJaZEZ6?=
 =?utf-8?Q?xMgkcB9fPTmgxLhR5HGRZDxNUL8spHLyl60rWhnkOzQh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fc8aea-0fef-4e8a-1cb4-08dd81a7586e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 14:09:50.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFREV/5HgUwgVH1RjJFau9Vd3UVXJGrwMwwbd5kRO8lgshw66Ewb7rfY0IQYbVG2iNVOijmfVlf4HJxpGApXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8822

On Mon Mar 31, 2025 at 8:40 AM JST, Christian S. Lima wrote:
> Methods receive a slice and perform size check to add a valid way to make
> conversion safe. An Option is used, in error case just return `None`.
>
> The conversion between slices `[T]` is separated from others, because I
> couldn't implement it in the same way as the other conversions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1119
> Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>
> ---
> Changes in v2:
> - Rollback the implementation for the macro in the repository and impleme=
nt
>   methods in trait
> - Link to v2: https://lore.kernel.org/rust-for-linux/20241012193657.290cc=
79c@eugeo/T/#t
>
> Changes in v3:
> - Fix grammar errors
> - Remove repeated tests
> - Fix alignment errors
> - Fix tests not building
> - Link to v3: https://lore.kernel.org/rust-for-linux/20241109055442.85190=
-1-christiansantoslima21@gmail.com/
>
> Changes in v4:
> - Removed core::simd::ToBytes
> - Changed trait and methods to safe Add
> - Result<&Self, Error> in order to make safe methods
> - Link to v4: https://lore.kernel.org/rust-for-linux/20250314034910.13446=
3-1-christiansantoslima21@gmail.com/
>
> Changes in v5:
> - Changed from Result to Option
> - Removed commentaries
> - Returned trait impl to unsafe
> - Link to v5: https://lore.kernel.org/rust-for-linux/20250320014041.10147=
0-1-christiansantoslima21@gmail.com/
>
> Changes in v6:
> - Add endianess check to doc test and use match to check
> success case
> - Reformulated safety comments
> ---
>  rust/kernel/transmute.rs | 89 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 83 insertions(+), 6 deletions(-)
>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 1c7d43771a37..16dfa5c7d467 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -9,29 +9,106 @@
>  ///
>  /// It's okay for the type to have padding, as initializing those bytes =
has no effect.
>  ///
> +/// # Example
> +/// ```
> +/// let foo =3D &[1, 2, 3, 4];
> +///
> +/// let result =3D u32::from_bytes(foo);
> +///
> +/// #[cfg(target_endian =3D "little")]
> +/// match result {
> +///     Some(x) =3D> assert_eq!(*x, 0x4030201),
> +///     None =3D> unreachable!()
> +/// }
> +///
> +/// #[cfg(target_endian =3D "big")]
> +/// match result {
> +///     Some(x) =3D> assert_eq!(*x, 0x1020304),
> +///     None =3D> unreachable!()
> +/// }
> +/// ```
> +///
>  /// # Safety
>  ///
>  /// All bit-patterns must be valid for this type. This type must not hav=
e interior mutability.
> -pub unsafe trait FromBytes {}
> +pub unsafe trait FromBytes {
> +    /// Converts a slice of bytes to a reference to `Self` when possible=
.
> +    fn from_bytes(bytes: &[u8]) -> Option<&Self>;
> +
> +    /// Converts a mutable slice of bytes to a reference to `Self` when =
possible.
> +    fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
> +    where
> +        Self: AsBytes;
> +}
> =20
>  macro_rules! impl_frombytes {
>      ($($({$($generics:tt)*})? $t:ty, )*) =3D> {
>          // SAFETY: Safety comments written in the macro invocation.
> -        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
> +        $(unsafe impl$($($generics)*)? FromBytes for $t {
> +            fn from_bytes(bytes: &[u8]) -> Option<&$t> {
> +                if bytes.len() =3D=3D core::mem::size_of::<$t>() {
> +                    let slice_ptr =3D bytes.as_ptr().cast::<$t>();
> +                    unsafe { Some(&*slice_ptr) }
> +                } else {
> +                    None
> +                }
> +            }

This is probably a naive question, but is there a reason why this cannot
be the default implementation of `from_bytes`? IIUC other implementors
would have to come with their own implementation, which adds an extra
burden.

