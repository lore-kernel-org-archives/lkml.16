Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591BC145329;
	Sun,  1 Jun 2025 03:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748746862; cv=fail; b=Avvvq94DL8vIwkeprpBFaw2EkB+W0GeDj8RE2KczJLTg2YZg48tJ8u6DTkRk0d8jHA8WzsBgjTSYv6B8Zl7tc+NAeWCYNVf5P2Pazj6mEpaTWpe5pH/ztgURxgAsZXTfdwxntQ/asnzh5h9j4/H7+MLCfSgR+aAgUPj+FTK+SZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748746862; c=relaxed/simple;
	bh=ebcvq3z6t9AuUKzqD5MysyAPT7vVf1/sKy+/t9w/YK4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ckr80V8VoHrACUSZ6tce95IcltMUn2JjSimDBOjn+2tIwp4Nd2lK7JVV3TejcNYH4XYOQWGa6X0Mzx/JzlLn32qHletNsk+K1Vn0EDhueLSnr0sq5TtmwV6WSMZqZCrUgwYbza96hFpi7qi/s4xOmyDQJboQuK0xb6rJT6+vyAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=neDVOIVy; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="neDVOIVy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMOuhOhAdzp5tnckC4y+siU3HPj3go0p8fP6+jrwqANModaaCOxvM20DuYtLK541j4gMmG4ejXtbWJ/sHx9eF57AHEuh3zYMdUIMXxMBNkHRKVWyO7DVN+m+Lznq9nzDbH9pzo8QMhJu1T3q+UOw4CgmucCPUGz1DqrwHn/w/B4MAlJalr1Cdu5A0PVttHbOF8rWs0+p1qLqYHg28ajqa+gdm+AE7RTSd4v578/dZYPWv58xN39MbjRjMCw0crOQs6pySPHoGn1O8AgQCvVoIDKV0+hPS86y/XkooPjODZdpVus/uCj2P/jy67EPSeIfruqYClX5YCw22qE+rW6VUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XKRc3h8Gz7saJKHEi9GRCXRi6s1HSztmuk0QTFKvPo=;
 b=niurBEyKwb8hf6dvN1gvn5O1jrdV8jeoOwcMtKl4fE71D6abEBquKs9RHDD4cNT2Nt5P2PhHau1n9f8Z1emn+8ChvMROABofCI4HasZcYlppCNE3vcKcAA0bpW0l9q756LwVSRyrACHSd0lWQ3QLxefq+f8HUinfmlnvkKq15rby5BWRk6PrhV1/A4On2ZV3z8dP7/pR/bGQXurGZi4j8WaxhJGK6d9XqdWyr32Nr3cHpYY7McEdsBd6Hfk/GxQDFlHmvZW5jEjNRa28JEk4yLTNSbPoJvhpagP1HLGLRdTh2ECsZ6A+ehTIVYSAVL9odi0KCGCWKaB9gvYwt5vXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XKRc3h8Gz7saJKHEi9GRCXRi6s1HSztmuk0QTFKvPo=;
 b=neDVOIVyaTsx6CJDU+nSX6VYHJ71nN8pU9iv4clWqxbBTNQuNv5A+dmm1bRs9v3gg2kvItORpC1cIfJK7lYL7xC47BLXxsJeGT6IWmEgkyFKG/3IBmCjWYbVRxdZctwyB5wWktTPbrdBKn2UDgwoSuD074AS04Uuw10E6kLh2h1Jfz7LFk+6NByNxNugCq8u4PiXnkfg2KXUammmGigG6WfIijraadWArmufFuUod83VFML0I67yyrIbib5WSPwiGyawz9EbwN7wXXB0MS0Sk/d6Q6ewpwrTypJWkEvXHp7nwSxO4OalG1g1fX7IETQ3uKjLZA7ojQMxfScqb9kkwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sun, 1 Jun
 2025 03:00:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Sun, 1 Jun 2025
 03:00:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Jun 2025 12:00:41 +0900
Subject: [PATCH 3/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `KBox`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-borrow_impls-v1-3-e1caeb428db4@nvidia.com>
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
In-Reply-To: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4P286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 501af6c6-fa34-45e1-cca8-08dda0b888aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2hPSmp4WlpuNUVFTVlZRVFnZTYzTU80ajJzZWtTdWV1YmZ5ZHdaQitwTWlG?=
 =?utf-8?B?VlFjWXBzSDBPN2EwUXFwd3BnZXdLUmNYSFpDTlI1SkdNZ0Q0aDVyZjZGWmxh?=
 =?utf-8?B?UGVRa3cyVk9LYkRLU3VYd2hQbC9IWGpRbTdFOWNHSEUybHVidEhuck0yNEJo?=
 =?utf-8?B?VW83VHdPa2JGUEd6d05vMk9NeDJBVlcxOW5PeFNmYjdNam5GNFJSenphUlBj?=
 =?utf-8?B?YjYxT0tPTDltUzl2UWMxVmxNSGdwa0JTcUh2SUVqc2c3Y2JTR3FkYi9JV2ZF?=
 =?utf-8?B?VURHOHl1dUlHZ3lhWTB4b245bWlVQmZRQmwvdnhFRzhxWFI4ejlLbS8xUDlJ?=
 =?utf-8?B?MDJGWHQyUE1RN3BQWWRDVFg1YmV6cW9qaEZkTmljTnAycGNuOCszNHZneUky?=
 =?utf-8?B?cm1kSUZkTEZEMCtvaU5YTGo2YXl2SE1kRVNJcW9IamgrQ0o3ZHNjTE9tOUZm?=
 =?utf-8?B?RHBqUVUzRDU5dnEvU244TUNYNWlwL1IxNXlJejBjWXFvcVA2T250WHZtSUhx?=
 =?utf-8?B?dGwzYW5MNWswR09qb08zYkVvenZXaFlLUDFiaXRHZlBlT0VRS2RCbzJuME1h?=
 =?utf-8?B?cE9JdDVoeC94T05zSHhZZm1EQTl5WVVSdXVjZER2TUNLTTd0bHpqWkpSWHBq?=
 =?utf-8?B?UFA5Z3FGbVZ1MHQ0aVEydDJNRnFFaWxuMkVQN2MxMHkvSldBS1lRdEhLSDhI?=
 =?utf-8?B?K3VXL2lNYUJiemVaTEFTeVExeSt0dXJUdkc5YTE5K3UzcmNOZ2IrcERsSC9n?=
 =?utf-8?B?WmROSzJLZ01PbUp3N05jUnFrWHg4bDVzak9GMzQzMFNIanpIN1RSSTFrTkl4?=
 =?utf-8?B?ZUR5QVNHMG53M0YrcjduMW1RcklzRmdkWUE5bjhJSno1TnVyK3dWanRYUFZ1?=
 =?utf-8?B?eS9jRk8vUm9iYlhEVW1uYVFnaTl4NjRhSGRCK0U2Ym5JWHBONk1IS0RTeVRs?=
 =?utf-8?B?ZW9VU1ZKeWFYaUx1NUR3NzlkSnI1YVR1Y1hlUXFUSktEM2pNakF3d3JBWGhM?=
 =?utf-8?B?YnBEMVFjL2txVC9aNWpXZnRjamlLNURMYTZlRjFmUmJyTDVta0lXZnlKRjFn?=
 =?utf-8?B?aUUwM2RGY1hvSWVVRitGWUJxVjFmQnJlWGhLeFFsckFyZ1pkYmNBeFZhcU8v?=
 =?utf-8?B?alhKZ2ZYelR4WkhZKzduYXpZOGlzbVFBemcrVitUblBIR2lzTXFrME9VT0dW?=
 =?utf-8?B?amlBbHphVlNOZ3NjbVBuczh4cElma296a1gxdkxtNnBYVVpDeHNXa3J0aVZH?=
 =?utf-8?B?cVBhVmw4bnNRekMwV1krL3R6WC9GT0FEVTNWYjZhdy9laDNiWDJaci9lUE1Z?=
 =?utf-8?B?dWkyclYrZm83dFJ1ajZSWW5WSkRMUU1oSGVIczVQZU9GSGpyUGJqYWd0MGhU?=
 =?utf-8?B?Y0dCVm15clp3UUh4RWN4OVBhM2ZQN3N6dXQwUU12YnphQWt2TGJmdW9ycVlu?=
 =?utf-8?B?RHBhaDdhNk1SdUFXdkNSejlDeU5FT29WN0JaVWJoUStsZkVITnlTQVJuUUdK?=
 =?utf-8?B?Y0o3OWx6OTAwSmczbUd1NWlSTXhLdElvemNYU2RQRzFZZjY3ZmJlV2hHZmZR?=
 =?utf-8?B?bjVqdldoZmN5c29maFFOd3VBa3RjRlZncDB0aFZLMjZUbm5XbldNSG5NS09j?=
 =?utf-8?B?WTQvaG40SE05bnFIbUZwUWdhYjY4UTNLZG0zd0F3Ym5EaE1XMVFQQUhCdUwr?=
 =?utf-8?B?dy9rbTY1VFR2Y0xMNTU1YXFWS3hZUVdFWGlLR29CbGhCU2kxdm1PT2ptdzBr?=
 =?utf-8?B?cEtUNUVGWDhQR3NRTjFOYVZac3JOVUUzdUhaRzl3bXZhbU5iUlF5Rnp6emxj?=
 =?utf-8?B?a1E0UTB5K05xSkduZFQwYVhIUGRsQWFXZGozZWQrZEJzaThOaXZUa2paZUtj?=
 =?utf-8?B?aUFVNUlVdkMzbndGZ1FQWWMwNkxoSjA2TjJSVXpGVEVZKzVxaGNTc3lvcG0w?=
 =?utf-8?B?WHJ3TThXNmtBc3p2cXhsYVVpYnpRVHNVV09rYm92K1loVXZIaFdOZmlwTGdZ?=
 =?utf-8?B?SWhXblJIWEJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVNEbStzb3F4bGtmWEdoM2pjVE5ocVV0czdUVFRHZmdIUFdKOTlYajZGRE5T?=
 =?utf-8?B?Y0hhUk55TWpJaUVPN0NaZnNlbWlwc05mN3VzbTl0WnNPcXltNDNlaDlBZWJs?=
 =?utf-8?B?N3UrQ3I5Z1hGbVQxVVZiK3oxTXlKWjB3MVFiSmtESzlPdDdEbFNhb21IK2x5?=
 =?utf-8?B?eUtlYWcwMmNCYkloRnNDdUhjbEU2K1lNb0tia2VDRTRRZE5iMGFYYTJvdjN5?=
 =?utf-8?B?M3VRUFJJZDhQV2t5ZWQ3Zjh0d3czdU9abXBMZk5YYk8vWlVTRXAyRjFCUTBu?=
 =?utf-8?B?UnVtNGtNczZ5T3J6MERkdXBlNnV1Ymh5WGlUYW5mYUgzZ2RiaTcrUDQwQndm?=
 =?utf-8?B?TTBGbTh5Vmo1cDlIY1hGSzB4RUFSc3V6MU9WTDVFOU9jY1NPRG9mTVd6ZG5x?=
 =?utf-8?B?cHJWbWxwL25jbDM5QlFzRVVkbEd2dnpVS0U2ODJMQUIvZzJvVmdDQzI5dUxF?=
 =?utf-8?B?cG96aGcrWEQveExaM2pBQ3VaKzBhWVlnN3V1enJHZ21tRjluTUcrQUQ5TXVx?=
 =?utf-8?B?YU1LdnpDVmZPbk1HUllBUzZ0K0ZEbmE1R0xoa1ZxNkV0VXA4VklHWlEzUkFG?=
 =?utf-8?B?UUxUejUxYWZIN1U5ZjVxSGV6N2xuNkhUdkhJRndWaUJwWWdCTmoyeVlvZXVS?=
 =?utf-8?B?N3hGZ3dPc3E4NFF0L1BtMzZTekdhV3FhbVFHdXVZNExLazc2S1FTenRBcFNn?=
 =?utf-8?B?bDRhM1dSZktDeUNIdU03UXY3SVRNbWNnRGMvSW1RL0xDSGRucFltRWJyUUJD?=
 =?utf-8?B?MFN0UE5jaUtCY1Y1MSswVjFwNTJXUm1ydXZZaHNTSzd3elBxdUhGdFNSK1lk?=
 =?utf-8?B?SHVPbW1yRTd0ZXlKam80SFdVWkRvZFN1YnZrQU56S01UdCtUaDI3R2NEVFFz?=
 =?utf-8?B?UXpjMU1menVmZzljQTlIRU1CSGV4VjU0cUJWS0p4cXNKRDZFK3ZPNVYvRkV0?=
 =?utf-8?B?TmhtVmw5ak9JRkJZenplajV3TUUzbUpOM0hWRmREZ0MzdEpGaXZvdVBYNDZq?=
 =?utf-8?B?VTFHV3hDdTlBR1Facmo0WkFSR09lOHNVci8vRTF1R1JlMGhiVGtzVlJDYUZt?=
 =?utf-8?B?T0ZEdXFKOUJSem4vUklkVktwNVh5bGl5ZzhTTXdSalcvQkxUYkFVREwwa0l2?=
 =?utf-8?B?TTVDU2xaMWtXTDE4dEk1WGZISHBXbmM5azFEUnZ1QmxWZHdRQ0ZlTXNQNDdq?=
 =?utf-8?B?WE5DK2ltWlc3Z3F4UGF2alREQjdlUjJ2QVZuMEZWWUppRkdKaFZGdXQ5SkhX?=
 =?utf-8?B?YWswWnFHeWJIZkw2NTBuOTRBcUExd3lZVzN0b29COTFoVG50UkYrVW9OdG01?=
 =?utf-8?B?eTR6a09SS1dYWTRDT09vMUFCeHFwMGVEckRPQ29MK0tFZUVLVk50VkR3S1o4?=
 =?utf-8?B?d2IxdzVpNXd6RGd4MnM4U1ZRSExYa3IvTU43RFlyaThSZXlWdmFRTkZrNXU3?=
 =?utf-8?B?b2NMd1E3cG11TFZ6Yzdnc1pjVlAvMkRNNW5zZndDNDFSTVZVSUl4cjF0eGZ4?=
 =?utf-8?B?b3dMUWFvT044bW00ZXJYZFo1NGhBK2VOQmcreE82MytwTnNaUG53NDZkb2Nl?=
 =?utf-8?B?MEx5NmFqRFRMOUI5ZGxscEtHOHlsTDF0RE1EL2tUVzFObUd1WEVVVTkzYTQ5?=
 =?utf-8?B?dks4bStmTzZGQm5vcldRendncHhtQTlYaWg2TldpY2RvbVFUS1NrRjNNU2s4?=
 =?utf-8?B?dGVFSUEvWGdkd2I5ekl0U29jbUNERUhxV2pTYkI3NU43TEd6K0pQVDNmdXJv?=
 =?utf-8?B?aDQrMzdNT09MdTdtSzFRVUdhYkNVK0NySVlzRDAzUFpmbExlMXkxbGpBUUxR?=
 =?utf-8?B?QWlQdFN0QVM4NjVGMzBUS0hUajRLWEpHZWZzemRHMzVodklKd3FhVXRZZjFV?=
 =?utf-8?B?S0dFL0ViOFFpcWNUb01lMTVlUEwyUTJvSzFRZGdBMW03akYzQ3U3SHVRNXZq?=
 =?utf-8?B?OHNQZGxlb1U2SktvSHNJUUR5UlluTWRDbGZJWGQxNGtpdVp5bTM3aHg3cml2?=
 =?utf-8?B?c3BKSDM3TEU1NnF6ZzNhcHkrcStKOE15Ung1ODRYUUdZRDdoeDFkUXBLRTZz?=
 =?utf-8?B?V2N6VjBhMVlqZCt4UGVVcmJiVHZoWWxhdm9YMjRqcTZaWEU2N0NqRk9SYWJJ?=
 =?utf-8?B?dU1JbThuTVVaMEN2eTh0MWlZVWZ6dnNEd3JTTHllZTNYQmxNUVJ0ekZFVEcv?=
 =?utf-8?Q?foDcn5sJUdntJqiZKjsJoR7PbUtc/gh0EQ6LSlswhBSO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501af6c6-fa34-45e1-cca8-08dda0b888aa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 03:00:58.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTH0g1emfFxK29SzqwXjNepkAo28uqrgZyF9uQF9SkGzOiWhKW4yVBG3Vh0kJGv7cF1CRXkLe7Ek1GTKvGk9nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

Implement these two common traits, which allow generic types to store
either an owned value or a reference to it, leveraging the `Deref`
implementation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kbox.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index c386ff771d506a2eb4c211a93ea9b59bc04c93f5..73e66b4118b723a5e54de53144e4c1884098342f 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -6,6 +6,7 @@
 use super::allocator::{KVmalloc, Kmalloc, Vmalloc};
 use super::{AllocError, Allocator, Flags};
 use core::alloc::Layout;
+use core::borrow::{Borrow, BorrowMut};
 use core::fmt;
 use core::marker::PhantomData;
 use core::mem::ManuallyDrop;
@@ -499,6 +500,26 @@ fn deref_mut(&mut self) -> &mut T {
     }
 }
 
+impl<T, A> Borrow<T> for Box<T, A>
+where
+    T: ?Sized,
+    A: Allocator,
+{
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+impl<T, A> BorrowMut<T> for Box<T, A>
+where
+    T: ?Sized,
+    A: Allocator,
+{
+    fn borrow_mut(&mut self) -> &mut T {
+        self.deref_mut()
+    }
+}
+
 impl<T, A> fmt::Display for Box<T, A>
 where
     T: ?Sized + fmt::Display,

-- 
2.49.0

