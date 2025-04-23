Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694072701BB;
	Wed, 23 Apr 2025 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414144; cv=fail; b=RfK6ckQ0ek8FhQisoXsuHjucTHf7n4/wkEjFXZvJuYPInzsBVlJO6u7vuGWGzB5+DMRJWiwVBpfYpL/Nn1TJjlWFKK6fjvgIu4yVbKfePbpFry4xPd9jTZhPiuE4v69XKVqNS63gBx/+cXyiPbn+3y+7ivDqEKxhfRzjG6UC+ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414144; c=relaxed/simple;
	bh=YWzL3i+cEYAAXjTT0Kfg3B2Vi2adFRb/ULoTgAMMvpc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jIJaUqh5MpTmMXPBlzhW2LHXZCgymqOpHgH9cRx5g2EzCyvmm4iZbpZtz90tA6ZdLfFtEXMRtncyGW0WXG/bRlIYPFOQjxWow/1+00kgdM13Vmpq7GaXt2vloU2EL6oCTPDJ8wSdIo78GjE3iVT9ZDzmDdowlxEdUGktAEx2C1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U/wta1Hf; arc=fail smtp.client-ip=40.107.100.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U/wta1Hf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXmTxwUIc43dVbxij6TS515lYj8+AD+cMkFQHOjNcXelfkqYSSyx84ddv63TH6uaYnP52wUK0klv1S8GNpAK3vwyIzTFClnroOBqGrM5vvVYrNnROvMVUTRuRsPSm7uk1d7SKqEwmHAu6rU5Zq3Rps43a5h2ShhlNW8vgxbFDnjeHbmsWZmJf8jTc1TuznP6xswFh193AWzpT9KibsfXkpVtW8jR+6MyTT6KXTDaLl7357Ct5uJT8H8UFNJL1I/DdueccGsx4yfNbW1riJ//tfQIG3jSZnpSkxILtEPVFNhRaugVUTUBBWc1KGIisNhE2UwDumhWlvLAaXQnEMpOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaFFffOityEMVSIxhyrNcX3eEIqgEjlXkeWB2HSXei0=;
 b=AmMrX/afPd5wU5mKBd1wueEP9UDTTW6TI1ywn5xPaQUbL1bikWRivySDRY7D5j75rjfgpbRZD4JxAuGissKScUNc1M58aVCh/I49ZIrG4b7b/iUJPF9Ekxh+CJbdooBuwatab2m8RaCAvWv2J8kmS258sdJzXu8xNz8K6F65rpqG7GxNV73DRD3l+4UHRc6zkLGFpVMB151MmJHXdQLrnItfKd98djXoQeQg45u3pxWJPdlCZ9oUUGOl++F6ZYlJnHI+tYzFmAA4D7yiefnYb6LhyXOKNuuSd5c6oJG6mhF45XAGze8K2r/H9CUOccJXRxJSxMhinZQy5tcBNGyXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaFFffOityEMVSIxhyrNcX3eEIqgEjlXkeWB2HSXei0=;
 b=U/wta1HfeC3sgvB6qpmZeWRFgF4W7J1mVdSeZLx8POKQI+5wbIZBA75vnviqVMIDNu5+a9fTtykUmxCwTVLSu6u9XcsaDUa3EEUpzSLHvXP0X39P0wl009CNk91krqAkIwpvpHVImFvWGo94JxZhoQjcJSA5bSmvJvVKMQYNWxOdpqF+n6VVvh3tIzeVJaw0jVXcQM9hDgBAQAWvZ1rmokCw5GgJMDC3n97Szej4GkHA2AyJhU+IleTKMNNWMQ38NuQjIgJURZc5tDY3wBqHeQ7qclluHXuQsgH0d8y1f8p+7ojMw7s0erIAK2y8NH/ZQaK0GANdrbXPnHXltKaN7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7234.namprd12.prod.outlook.com (2603:10b6:510:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 13:15:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 13:15:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 22:15:33 +0900
Message-Id: <D9E1O7J3CTBY.31DRCTB9Q3EHU@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux> <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com> <aAfL-e6qA9oBce5t@cassiopeiae>
 <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com> <aAi3SMn2MgGv8eWB@pollux>
In-Reply-To: <aAi3SMn2MgGv8eWB@pollux>
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 065ef3bf-21f1-4186-b5a2-08dd8268ef7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkJrZmRBdnpGVWFCT2lXTzhMbzhNcUNuRjZQbm05dnpIT2Q3QUxNeVNYNlZl?=
 =?utf-8?B?N3g5WnR5dU9Da1UweXRlTkNic3hxaTlYMG8xWWFidlhSS00xU2dzdWQ1dzZ5?=
 =?utf-8?B?aUNRdkJRRE9NYVVPazRIdHF5TTdyS3Z0b28reEVoc1Z3VXprRVpsSjFFa0k0?=
 =?utf-8?B?ckJBT2RlREVjRlllSDhUbkxlYzVLVHBMeDJMNWt5QmJObnhpKzFtTXFyQnpQ?=
 =?utf-8?B?VFM1cWUvTHc3dVlzZnRpMWV0NkNGRnpCYlRtVWxOMGdtSXd4QVpheVhSdXZR?=
 =?utf-8?B?RVVtTEk3QnhUVEp3SmZsRithdEpGcWlSWndpWmhWUmdlWUprMHZWZS83V2Vs?=
 =?utf-8?B?YlQ1VzR5UHkrQStrYWFRWk45enRhZG92cys3TWtqS2N5Ri9OaGcweTcrV1NK?=
 =?utf-8?B?bnBpOVIvcDR5MUJVTEk3dUlib0sxU01GKys5UXU0dzRCbFNib1RXSEtHV3JY?=
 =?utf-8?B?Rm1sM3UyTUI2dzlpSHkremtrWDZQQVloZHBGcGRzcjdOMi9yQU15Z2ZYZWJv?=
 =?utf-8?B?d3B1d3dhS3lQSjBxTGhIc1VTczNMWVRpanhDVWRDWXNrWHFyeFRaeXk0MDBD?=
 =?utf-8?B?d2ljR2Q4TE9HY2E1WGRoMWs5dlI1aTZYcmxBeFV4bkZleFVwQW1KMEdLOUJv?=
 =?utf-8?B?Z1ZQWnZ2UmJFb0JMK28wVXovU2RzNGFyVGIyTHpvUGRjNURpWHZqSWd4MnpE?=
 =?utf-8?B?ZTQ1QXkzVHFlYUc3STFpdkZSM0JhelhyVnhSYmMvUTdJRm1lUnkrUjNEcGZD?=
 =?utf-8?B?b0RQT3o0eHN0Q2RxWkpOVnNOR1JRc01lWWZ3eE83Z1V6UnQ1UUFTQWcrMUxN?=
 =?utf-8?B?S3oxY0pKeVV2THZOSmJ3WVBsYXBaUXdmUzh1bUVxU3hhT1FSYkZMbkF3V0lZ?=
 =?utf-8?B?MGRtKzJ0VEJSWGtGUGRIVlBGbCtiekFST3RVY21vcW9BRGF1LzRYbFg5ak9r?=
 =?utf-8?B?Um1sc0NnMFoxUzFsQ29tNVBVajBuSkdmbTR3aC8rNlpsK3dnNFU4eFFwNkFK?=
 =?utf-8?B?QzY0RjNXYlFCTXVYbkpHVXlWd2xaazV5SXZuRlhTV3RJMnEvbC9uVUZMakpz?=
 =?utf-8?B?QjhtYnlKSGR3ampiWWVsNnpnQmJGQi91bHpQVVQxZko1TjZXanZLNkM3Nkxq?=
 =?utf-8?B?Z3RVU3hzNDlBU2QxSklPYlRCajdUU1l3Y29tMGpWa1R0YUN2NkI3R2JmTnBW?=
 =?utf-8?B?U1ZNNUhGVHNyYmJaUVRRbVAzb1ZaMDF3eW1kcUx4dnAwbHh3VUZjL1BZRjZv?=
 =?utf-8?B?b28xYXZ4czRaVHFMVUlaaUhaemJzVzVqVFcyVncvRDlSVHBCUTVjMkE4ZTNR?=
 =?utf-8?B?Q2lzM0V3bFhQb2lOVXZVdkRhVVd2Y25UMEhHdmVtVWsxOGN0aXRyclBkSnlR?=
 =?utf-8?B?RkpPLzJQZzUrTjNLb0pJRlJ5eFVkN20yTC9xL1V6ZUs2alJNMnFrWExISm9i?=
 =?utf-8?B?dHgrTlFEc201cWlJRUdUL3pSeTBONGdqdE45bXdRcFpiRXJQMWgrZkt1WTZC?=
 =?utf-8?B?clJ4bjNVenFZUVVHSW51dVZtczBXVGVxVmk2aVNYODNJOWZxMWRURnVubW1W?=
 =?utf-8?B?dkxhbGNNS3pwU3NxOEJFL05KQ0xNNWhBeFZxYStCTCt4cys0azJMNHpTeC9w?=
 =?utf-8?B?TzY4bTZhckY4VzMvS1Zha2FIWGFhL013dmNEWWdnVFgyMVkxUElyKzVkaS9L?=
 =?utf-8?B?OW0wRjg0NSsyeXFiaVZOS0JxcXY2SWs5ZjEwY2tsaXV0TVhLT2R2ajhid0NK?=
 =?utf-8?B?YjJyeVVtc2JmTy9XeUpSUy91ak1Xa0szbDk5MVNHcCtJamZCdkNvbVhkTG1x?=
 =?utf-8?B?RlZHb2ZmcXlqVHZxSEd4aGdSVkJMNkJ4YnpFZmpzbEN1Q2lXb3lWZGRPSGph?=
 =?utf-8?B?Mzlzd09jTDV0aS9zRmFNd1VIR0NMNzhBWEh3N29kUWIyZUhEeEFtS1VRbHZz?=
 =?utf-8?Q?ZdjhPGkhFWU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjFCZzlyUU5JclJFdG8wUEltdDlkcjRWWGxrTkZyRjRKWWlUZEZmcjNqaGNv?=
 =?utf-8?B?UTZCajViYjFpMGlaWmFvRkc5Z1huelpPU2RrbkVhaXFuVGFvRTNGUzhvWFB2?=
 =?utf-8?B?aE1aRGp2bDFJZjRZOG5vUXVNZ0Zod0FTS0pYUVRoZ0ZqQWV5WktRdHZ2d1RQ?=
 =?utf-8?B?UHp3VE5YVy91UDlvZEpYOUFFTlRBTmtXdERISkJXNDJoNEhkMUo2RTBndlA4?=
 =?utf-8?B?VVN4VjZzWFZQKytOMktnRHRaY1h5MXBXWkQ5a2w4dWpQbTZCT04xSTNMc1dh?=
 =?utf-8?B?VmJBdlA5VDFoUyt4b3Y1ZGh1am9iL1JrTFhYa1FMaWhOcTRKeEs3WWxBRmJj?=
 =?utf-8?B?Q3NqWGZFQnptU1RRTEJ3dU11cnBaM25WcDFmeXVkTWpnWVMyOVAxaFNCZ25h?=
 =?utf-8?B?ZjUzajJwNzB0bCt4em82bDRUTGs3ZDhpTDlpZmpZcSsvcEhkdFgxbTBWTXdC?=
 =?utf-8?B?NHozNkhOSlV4RmswQ0lxRVhrQzNMSFY1NW9la3l5cUxNL1lFM1JyWjArWXQ3?=
 =?utf-8?B?blBCRUJEZkp0YmdRcHU2elp2SmpjUFRtWWk0K3hOMEpwdjhRZnExYXE5eFRH?=
 =?utf-8?B?NXRHTFhhc3VMc3BtMjFJU2lBZjJ0ZEVYVmxyN2E2QlhqTmtHYi9kQzFmdmdN?=
 =?utf-8?B?VllrQVgwbWVhdFlmbFVPeC95TVd0MExDNDR6MlpqZSt1RG1Ib2VFbGw3Qlls?=
 =?utf-8?B?Mzh5dzB4UmpoWjNYLzlpVWIxOGtVd0NlMXhOUWlKR2d2MExWWVEzZHA4a202?=
 =?utf-8?B?TWwzOVlnSTIrckV2NzM0dSt2cEtRaDQxT3VmWGpvNmk5czJnMGRoRFJDOGFU?=
 =?utf-8?B?MnNId05jVjVFM2R2R2prbVFBY2xraklYc1VlVzUvaEMwRWZ4N2J3NVJCMGNq?=
 =?utf-8?B?NTlwNms2OUZuL0NMZmlUZFhSRFF1a2pXVGptdVBLdTZnd05VcEdtMFMwNjhR?=
 =?utf-8?B?bWVJTWEvdGFodHVBbEFjMmpVZ1Z1bVJwcG5uYjJNbVFCQ0EvQU93ZmhaMnFs?=
 =?utf-8?B?MkFtRnlUckc5dnZNdkppZ0ZtRDY5QWxoeU9BQjVjM0N1cnVCMk1PLzF3aS9q?=
 =?utf-8?B?NXphSWtGeUwzSmJKOFpJa3Rhd3hobzI0UGlCNzFUNXpPRWFvdGlMdjhjckJP?=
 =?utf-8?B?MlVJa05Ec0xqVHA5ajAvZnBZU0pBVlBOZmg2K1BpdHpTdlZvU1lPTUR6dlVN?=
 =?utf-8?B?K0R1YUdVakVkS2Y0REJMZEpuMkw3R3NlOHRUck1CZEJBT093cEdBS1NRUUsw?=
 =?utf-8?B?cU9oT2ZZTjJ2MSsvVlMyVjZCb0RaNE9aa1BCN2ZxNzlaREZrTGpUTjFzUzFu?=
 =?utf-8?B?MkYrTEdaNEhEUFZlSGt2RHRNMmRMK2NWY3FxQjZyUnNqeGUvSjdocW1yZWZO?=
 =?utf-8?B?Mm9RNEx4TWZ4U2d1cWc1bThZd1JwREQyRndHV09zWXhoRHM4SXBGaFZvUlow?=
 =?utf-8?B?VUMrQ2w0Y3FoeHRzVUhtWDFkVmJIWVdQY0FHMVNxeFNSU2ZZUFMrTW1ZeXo1?=
 =?utf-8?B?RFBhMnFRREUvRHpPWjFvQld6a2s2eDduUktNV1RDUFNpME1rbEIxUEx5b3lT?=
 =?utf-8?B?bmZJdHh1V3NpUjdsSmdXNEk4NUozRUNRYnp6MUpBQWh5RXFxdHNyZjJ5QkZC?=
 =?utf-8?B?WllIZy9MQWhnOHR1YmlSQjIzaDNrRDJEc2F2QWZvNGRaK2pQVG1oWlAvTzll?=
 =?utf-8?B?SExBVGxXamEyOGUwenBoL2dQTjdRZThKTm5kc2I5RlVtVXdKb2RrcWpsNytw?=
 =?utf-8?B?dVdERStySm9HYWhXUVVtVnVlYk4xeWtsb1R2cGVHdllBU0R1YWtuaU5MUTJh?=
 =?utf-8?B?d1BOTzdqMzZhNjA3MUc1YXBMM0htVzRYYTgxZGJ2R01XN1FOcHEvUEd3RC96?=
 =?utf-8?B?MGlYM0VJMVF2L25vejFRbnB2MVl1empyTUlhSXVIZDZiRWlmN3d2OGhqakhF?=
 =?utf-8?B?ek9WbC95cGMrbEw2SWt5ZCtVanpYSjRkL1ZMeS91eTcyelFUVCtwa3hKcjdM?=
 =?utf-8?B?ekd4Mk9id3pIVG52VmdEdmlHNWFkMDdTTm5tNlE3ZXBCU0NTMHJ6akRYeXd4?=
 =?utf-8?B?Nld3NFFmVmh0WTVVY05hSXlQbjlGSVFYcjAwV1BuYUl5QWJLdmdLU05RdVBN?=
 =?utf-8?B?M1pBbVRRRmVQd0pKdUxHMkQ1UjRjK3hGcTlYZ21ydW9LdWR6SVFucmNac1p3?=
 =?utf-8?Q?Mz8O0ay+prV47ehIbugigMg7Sjq+KHZ12YlXJqzt5Uv3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065ef3bf-21f1-4186-b5a2-08dd8268ef7e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:15:36.4830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBgieIBciTRIeHdz1gLDk/Fb4b3Z08oJt/9GbUlrumowunptyuFiqLvGrNsddp5E1UpbtJuTWoz6+hqRVpBtig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7234

On Wed Apr 23, 2025 at 6:47 PM JST, Danilo Krummrich wrote:
> On Wed, Apr 23, 2025 at 10:02:58AM +0900, Alexandre Courbot wrote:
>> On Wed Apr 23, 2025 at 2:03 AM JST, Danilo Krummrich wrote:
>> >> Well, that turned out to be an interesting rabbit hole.
>> >>=20
>> >> Leveraging the existing traits seems a bit difficult:
>> >>=20
>> >> - `ExactSizeIterator` cannot be implemented for adapters that increas=
e the
>> >>   length of their iterators, because if one of them is already `usize=
::MAX` long
>> >>   then the size wouldn't be exact anymore. [1]
>> >>=20
>> >> - And `TrustedLen` cannot be implemented for adapters that make an it=
erator
>> >>   shorter, because if the iterator returns more than `usize::MAX` ite=
ms (i.e.
>> >>   has an upper bound set to `None`) then the adapter can't predict th=
e actual
>> >>   length. [2]
>> >
>> > Why is this a problem for the above implementation of Vec::extend()?
>> >
>> > I just looked it up and it seems that std [1] does the same thing. Do =
I miss
>> > anything?
>> >
>> > [1] https://github.com/rust-lang/rust/blob/master/library/alloc/src/ve=
c/spec_extend.rs#L25
>>=20
>> The problem I see is that if you try and do something like:
>>=20
>>   vec.extend((0..10).into_iter().skip(2));
>>=20
>> with the standard library, then the use of `skip` will remove the
>> `TrustedLen` implementation from the resulting iterator
>
> Skip implements TrustedLen, no?

According to TrustedLen's documentation it doesn't:

> This is why Skip<I> isn=E2=80=99t TrustedLen, even when I implements Trus=
tedLen.

(https://doc.rust-lang.org/std/iter/trait.TrustedLen.html#when-shouldnt-an-=
adapter-be-trustedlen)

But if I look at the code for `Skip`, well sure enough it's there:

https://doc.rust-lang.org/src/core/iter/adapters/skip.rs.html#289

... with the caveat that `TrustedRandomAccess` must also be implemented.
Now that makes sense!

>
>> and
>> `extend_desugared` will be called instead of `extend_trusted`, which
>> could add some unwanted (and unexpected) overhead.
>>=20
>> If we want an implementation of `extend` as simple as "confidently
>> increase the length of the vector and copy the new items into it, once",
>> then we need a trait that can be implemented on both shrinking and
>> extending adapters. Anything else and we might trick the caller into a
>> code path less efficient than expected (i.e. my original version, which
>> generates more core even for the obvious cases that are `extend_with`
>> and `extend_from_slice`). Or if we rely on `TrustedLen` solely in the
>> kernel, then `extend` could not be called at all with this particular
>> iterator.
>
> I think you can't solve all problems within this single function, since o=
ther
> than std we don't have spcialization.
>
> So, if we need both the fastpath and the slowpath it needs to be separate
> methods unfortunately. I'd rather stick to the fastpath for now. Unless y=
ou have
> a specific use-case for something else?

No, and that's also basically what I was suggesting with the
`ExactSizeCollectible` trait, something that works only for the fast
path. I don't think there is much use (if any) for the slow path in the
kernel anyway.

So I think the idea will be to introduce that `ExactSizeCollectible`
unsafe trait that would be a mix of `TrustedLen` and
`TrustedRandomAccess`. Then we can hand-pick all the iterator types and
adapters that should implement it.

Thanks for the fruitful discussion - I didn't know about the use of
specialization in the standard library.

Cheers,
Alex.

