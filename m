Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984BD1EA65;
	Tue,  8 Apr 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119285; cv=fail; b=lZ1xSxEQ1zgZ9XTAdJD6bbdBU6R0wBLOjesUAqLJd/3+ddPzFzSAT7J+gyoX/lywASQK7C/hHRl2+Mxv6a6X8CTlpBHKDxYtyAIZPNEcMHj9EexSOVczFtZoMsFKkfSlohGUxuSGbyW8/wviotKx5I74VwTsFkjOfs08LCWfz10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119285; c=relaxed/simple;
	bh=Qv9Bz0dugkDiZVY/vTqQwzuzXhdUdeELHpuOIacTdJA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=vEw4Mo2D8WtiCYAn3IhjEuNnrcanFUKcdbhxyWi44OgSqKNQC07SfUBWwLdvQEC+AV901zAsAMdWvGRdHnnXkW4FIHpX93wnSTxHY78x0inUpu+it/du/1/Q+MgZC6eUtiwo2VdHVcTyjmXWu9wM1yiTFvzE72wYVWOk3wvKrZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IeEmyrXY; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IeEmyrXY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZvz5geoHdl3zN0CKn/GrNnt6QVeBy3dWxSMzrWoj8ZuS0RK+WuYwRNxGQr2k0enL6YFrSKFgbf7SNrXmh/1yy8bB72e1HcN7zS57Pb2krvHXdHNvdh2WM3EvL6Yf5aZpYQ+P1lef1qwz0uweMu2lX8g5Z5koBgySH8/R9lProqlv71UFPpzRLJykLIubokJ2fcuCj8ZvEabH5TA9P9Ftf89IMsOXYXivPNFK+68+1fl4G8KEZEX9/k9luVCwvAkvsdkJHUGUztKHcd37JRjvA84zanD6foG0Hb+7Ig2UnWngXlPaikorjyRS1geHpL9sh9EEaumDCRli0BVmbBMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDM2WvWDcFNgsvtK9aphueTHanyPBphSmQGcYNoKw8w=;
 b=cJH6ggHGBcEM32Q56PZMUZS7kBkbCZzCyIZ3uVndhn6VqPvyaR97B7DEmTT0PQJZgUWId6L8fDY08LURWQX+cB8aDRhWTihmiGaaW/dB6Y6m2Mh3BDrxEw4o2MR4kxIf3mCeeaOo7EEI7UrdHxoaP2g/gj4Fo1BtAMYXWLWmP495Byg/SLtt9b5WSEA326/ZMmJfeQ2ukgQZ08DWppu+Xepm3L9OHQ/p2cKcb9VuhoK2W7N900M6FIMME9y8/FPx5nA65Fsapk9jXxms89uYOQhsGVPGGyOxtsSF9HyxNKbTV29D+dR0sH/GQeAZjt9BFBOlMXpWtRAzBoXyqo0UGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDM2WvWDcFNgsvtK9aphueTHanyPBphSmQGcYNoKw8w=;
 b=IeEmyrXY+g8A2Y/j6xk8H7TrMwEZ/1B/gBVF0ZYb7O2OM7ADgdVCFcSjg+G5IyeqdXMlnwp2lPnn62MNA50uPlQbL9tL8cVcQnOG4uRa0w4oPt//3nL3EYjljrrLravzq/UnCc6rwoStuU46Ky9Zoi7JI2DjWO+gWkF+LES76UvDhnD2b+XneqxveuW1d+0zThuLnSojaEJc31D2qDUMJi6M6rOoNb3+iwWbqdgS++r9rkXTnFhnhrFubbP6lJKoXbRrtVSacC3lvWBwtlLEVEIjsc3Dkx3+2KHyuWzn57iQ/VgX/aqThfoK937kUrvW9IXOf8fOF3D9slmtVbKcbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 13:34:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 13:34:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 22:34:32 +0900
Message-Id: <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
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
 <Z_OwmEKHgsZlt2cs@pollux>
In-Reply-To: <Z_OwmEKHgsZlt2cs@pollux>
X-ClientProxiedBy: OS0PR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:604:9b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f726dc-40de-470d-d4cb-08dd76a21ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0o0OElIaHhZMC81OUtKcXVFZzlKcEM4RzNZWWNoL3dHY3RFb0tBellBKy8z?=
 =?utf-8?B?NTc0blRjUEtjZGJpOTBLbS9NbkJkM2d0SGQ5ZWYvb3pFTEpWb3VhZGF2bXFi?=
 =?utf-8?B?bUdVNHQyajlmYmRTcVhWVE1OSWdBMENoMEZEQ21McE1XMHVhYWVQcjRUS0ZK?=
 =?utf-8?B?UUVLMGNpZ285dFdnZzhocVhVbjhscnZiKzhPLzZPcXZYYisrbVpmbW8rUzZY?=
 =?utf-8?B?TFNTaS8vUTcxdFJmWm9VZUtOYnp5aG5PK2JpK0lsWTFBQ3NDbFcvenZXY3V5?=
 =?utf-8?B?ZDdXSG9iZStpREtzQVdhSVBLMC9yMHRxTlpoTjFYalkxZGZpUUZ4U2JWSmV2?=
 =?utf-8?B?VHFhMlNXUUpRRCs4SFphekF1d29Ec2ZiM2dPSXZSSnd3cUxmeThmMy9lSXRq?=
 =?utf-8?B?V3QvR2dINWZwdkNjWHB5MGJla2VJdmRJaGk1RndmZU10TkI4aGlybHQyK0Vw?=
 =?utf-8?B?WGo3VTRXWUljUUswVDRNU0RHYk9xK3NtMFBFdjBDNEFTTzFWMEtkUVN6S0k5?=
 =?utf-8?B?UWxMMHhuY2JMNmd1NmJRcXRWV290Nm9WdmpSbkc0eEV2S3YxNndyOTRVbzlr?=
 =?utf-8?B?SW5LM1dtc3FvTUZyYkd1RHJ3enpaM3ZHZ2kycHpDdXYzRndnVmQrcW5ESUND?=
 =?utf-8?B?a3lvdmNmaWM0VDM4Vkw0MXZyc3I5Z0lIY3hWMkdLMHdsUlkxbERYcFRhdE50?=
 =?utf-8?B?L1FVZVNUc2lNbHlPMytJWWVEMGFkZktNVDBRL1Nzd093dlVkeVl2dnV1LzAx?=
 =?utf-8?B?czlkUVBpZnFKdHNFUlpSbnRTcTNvOFVTaUxrWk85b0Y3QVdYcDNrSFBXNUFy?=
 =?utf-8?B?SFEySmJCcFdmdEhQalRaandmWmIrekV3MXd3Vk5DR3BZL2MvSXp0ZTJFakxz?=
 =?utf-8?B?SW1JdGNISUxsTDM2ZDZUNWQyemVXaUNEaEJUdkp4K09ZeHR5eGlQTVpCSE9p?=
 =?utf-8?B?a3J0bTVpV2xvOGRyWlpzVENQZGUxUE5LQWIrT2pDVXZBSWtxdXpWMnZDUENC?=
 =?utf-8?B?akJjMEZXQWdUemU4MTdSQ0FvSFkzTk9LV0YvTzVVRE52NVZXVTVGWVBYYm0x?=
 =?utf-8?B?bzdlNHlCSU4wZ2s1YUMxclV0cEhlZnlRbzM2WlV3T2hFOUNMajJYSk9aK3Ba?=
 =?utf-8?B?aWE4c0t6eUR0ZWswa1ZhRlJNRTBPU3lnWUFrZEcxWDJZZjJPWW9vYlpMV0tt?=
 =?utf-8?B?VjJJYWNOZGx3REtkU2JSazJ5YjZnNzRwMktCSHM0YUlQWGQwelNONStJNHkr?=
 =?utf-8?B?UXpYeUUxa3ptQUE2UVBCV3IrTEQrTHlwSFBtZ05tR0hZUXBMOEhqNmlPOHdy?=
 =?utf-8?B?cC9lL2hQL2xwRmg3R01jQkhSSnFFK1A4ditPY0hQTTdKTGN2dWtBRUNxbDV1?=
 =?utf-8?B?aXJBN1RrblNXYk15VHA1U1BhT2k3bTBQaVEySmhqR2JXamxXamhVWnR3N1hV?=
 =?utf-8?B?RlMvUkdMaU9jOTBlS1ArVi9udzRDVFZpMmVhWS9udkZkR0lUalBZSnNNbW5W?=
 =?utf-8?B?bFdBKzB1SWJMc09vMWJTK1QrNldCTGgrWGFaaXNqTEVFV3VtRFdpUUUzVzBO?=
 =?utf-8?B?Vmw2V0d2RHFGdlJzRGlxd2xmcVd3NUlNZ0ppU1BKTGtwNDdsRC9VK3dHR3J1?=
 =?utf-8?B?d1NKMnRONldIbjRsSDNxMWl6VlBXUGU1eXBuc3VDN3hXWW9sdmRhVTVOTERS?=
 =?utf-8?B?NkZ1TzhpRnBtQ2p3ZEhXNVFTNVZCR0lmZktTT1NZVkp1RU4xNk9obWRWbmg2?=
 =?utf-8?B?NC8wK3VOdzlCQjhrekcvT2hCOVpMOWF1Z2x2SHRJbDdUUjVtUms2UDl3VjQr?=
 =?utf-8?B?K1drMUpzamgvS1lyNVhaTit4b0VYdFZHb2hQRU9TS2tYdU02SVUyT09VVHov?=
 =?utf-8?Q?07/ylwckNDCbm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk5ZRmIveHFuK1o4WGJxT1lYWm5Rc0dkYnI5S3VVbHI5M0tXb0tiZHBCU25J?=
 =?utf-8?B?RGRiTUUrSkE4OUJjV2dQa2JBTTE2WDBwc2pzZVJvSHF5RUE4Sk1mVzltZjBi?=
 =?utf-8?B?Q3N0dTd6bk5UeVBWa0VsTXZGL3dPTXAxRU5JNmpLZVBGTi96c0kveEFGVnhn?=
 =?utf-8?B?cEpOaW9XN1hEWjRlWXFBUldMYTY2K1NwUGVPMlBUc2NMR2k5WUJGV2pmUDc3?=
 =?utf-8?B?YW9Md2FsZVRSK0NtVUIrNGIvTkxCUHlKbEVsNndLdC94cW4yUGJ3MzI3Y25u?=
 =?utf-8?B?b3UwdSszYm9WTGRZRmlKR2R3dDhNVGRHLzJRN3RxNUF4anhickpOSmRTbWVr?=
 =?utf-8?B?bDB1bDErUjVpT0hPMGtmcW9zK1dRTHBweVRSNTRuZWxubzVMUHZ2WG5rOXZI?=
 =?utf-8?B?Zm55bTJQMHF3NllrWFZqWjdlK0RnQVhaS3UybGZ3Z1NZbmdsYmVidjNIcTlK?=
 =?utf-8?B?RDBYNE9vV0NsNEVpS1ZLQkQxMzJheU51YjBMWVExOEIwSTB0Vlk5UE00OGpI?=
 =?utf-8?B?aDNCcU9NZDlkREFRcUo5T3FLcHZML0VrVHljZFpkS3ZvejRBVUtvWEJ6YkRC?=
 =?utf-8?B?U1k2UTlrVmh2UG9oYmhLOGNLQTR4ZjFTTGEyT3AyRW5JWHdsWnFoOWQwYTZp?=
 =?utf-8?B?VkN5Rk9MVDBOTnNnYjdUZG05bmN2b293bGJ5c0s1VTQ0SGo3eDJjZnlwWUZO?=
 =?utf-8?B?ZHFWNVVFbEhmeloyR3hrL0IvamdML1NUYkJlZEJLSHM4SWs1L0R2cXhSd0NX?=
 =?utf-8?B?SG9xNFNqZGIwWWJhS0NaUGV6WThwclpsRzM5OGpxdjlqdzRtcTAwTnltYnVM?=
 =?utf-8?B?cmMzb0RlVWpMMnY4dlF0bDZFbitWNXVrdWw0SmUzMHEzWGRtckQrTldBMjlM?=
 =?utf-8?B?ZFVFYzFUZlNzVVVCZEljaXRVWXBSa0NEUm9zai94MHhQbmtqZ0JtZlZXZGYz?=
 =?utf-8?B?b0UvTW91d3B5a21ZUnhaMUswejZGRHNTTkhLd093anRhZFFicHAyY1RqcXN3?=
 =?utf-8?B?Y0pyS2tkOXFEcktVbkQ3b3RwYkhETmFkSXFUeTBNWU9OU2FuUi8yS3BJMzJL?=
 =?utf-8?B?Yy9lNXZxSnhPZDl1NHd1Zm9HTFZOL0ppNlNRam1qYXkvaTZtd0F4MHBlYkMr?=
 =?utf-8?B?ZjdrTHdUQTJ0aHh6V2luT0o2elQySHhkbktDbVdmYUNFU1lPRm5USlJ6ZGJR?=
 =?utf-8?B?cWVtUEkrWkgybnpxU1FHOE9IRnZMVTh3cyttRWhWekhmdWVsSEtDYTA5TmxK?=
 =?utf-8?B?ZFNzSGFNbDFwS1JDLzJYRkFHdnp1TXVhMTBMdFN3TXV4WTlnaU9aTjgxKzVy?=
 =?utf-8?B?UVhIYzZQS3dHdmlEa2ZDenl2MDRJb01sVi9RSC9lV0NMUmJ3L3Q4dXAwb1FN?=
 =?utf-8?B?ZVdNSUptb3JwdEJxRTEwNUI5QmI3SkhoRzl4aGJRZTNlaTludktvMG5TSER2?=
 =?utf-8?B?d1ZEWWU3cUxLZXBaNHpjOWlWNkV0NVhlL3JOM05hYTRmYUVZZU9LVXpuZ2VM?=
 =?utf-8?B?d08xQXlsdDloWFhhR3NPRXVKY251TEdxK3VCb0Y2czhpZUozRFNwdEN3WWxw?=
 =?utf-8?B?UlhPOGxZeFFVampxTjBwalNRdnNyVXBjdkplNExPYkNyV1V2bFRaNDFNQ0VY?=
 =?utf-8?B?Vm9GUzBhdGVUcTVpK0pMc0s5ME5oT0FNMDQyYmFKNmw4VGh3c2JHa3FMbmVV?=
 =?utf-8?B?L0NydWF6S3FEZWNDMnY1RVliTlZPa0tQa01ham5WVzBOOW9FMExlOGJ5eHRO?=
 =?utf-8?B?Q29USGplUHpwY2JPWE5waGlpOGg3OXpaUEhaa01YTTVzRmNWOGxLSEwrUFB0?=
 =?utf-8?B?YnMyWUxWUWVsN24zZmlINWZhSmFHeXlETVhLSzBtYzJNNDRyTHlIRm9DcWRD?=
 =?utf-8?B?MGJtUzRjZU5pWEsxNXNUN20ycjFvQlNLZ0VuV2YzckMvaE1ZRGRWTUNxOUJU?=
 =?utf-8?B?UlRJRXA0NTd4UTBGVTR2ZTBvWXpQSDB5VWhZeEFML1A0bmtBbkg0MU1jSmFu?=
 =?utf-8?B?MjhSZnNxQW9aaDUrdWorWWZBWDhDOStSL04yVE03WCtSWTh0VGFqZkpYSmQv?=
 =?utf-8?B?RFZvMVJMcWEvQ3liV3k4NTVUZndJbE90V0FWVXN2dWNZa2ZNMVprdHd1OGtl?=
 =?utf-8?B?OUFmZDl3c1BnTkJsUEcxMm9ZOHJhOXJMcVJLN2xjdXE4Q2tRNitnaVdsN2xR?=
 =?utf-8?Q?8U23S9/dHcgpNFGk8IG5jpXf/HUEhD11yIBNdLFY7oKW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f726dc-40de-470d-d4cb-08dd76a21ae6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:34:36.7307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZG+Csn7wKarhnRVzzqRDzXr8ovxxYFL/ZIxnp8Y9HLuZdwRg+IIzPU2hODMs1LgNVq9GAzKh7ru/ISktiCqjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775

On Mon Apr 7, 2025 at 8:01 PM JST, Danilo Krummrich wrote:
> On Sun, Apr 06, 2025 at 10:01:55PM +0900, Alexandre Courbot wrote:
>> KVec currently has `extend_with` and `extend_from_slice` methods, but no
>> way extend a vector from a regular iterator as provided by the `Extend`
>> trait.
>>=20
>> Due to the need to provide the GFP flags, `Extend` cannot be implemented
>> directly, so simply define a homonymous method that takes an extra
>> `flags` argument.
>
> This is the same approach I took with Vec::collect(); I think this is fin=
e for
> now. One we attempt to implement more collections, we should implement ou=
r own
> Extend and FromIterator traits.
>
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index ae9d072741cedbb34bed0be0c20cc75472aa53be..b3c4227e232cca3b5c17930a=
bc63810240b9c4da 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -454,30 +454,86 @@ pub fn reserve(&mut self, additional: usize, flags=
: Flags) -> Result<(), AllocEr
>>      }
>>  }
>> =20
>> +impl<T, A: Allocator> Vec<T, A> {
>
> Please re-use the existing impl block above, i.e.
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index b3c4227e232c..72659b017553 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -452,9 +452,7 @@ pub fn reserve(&mut self, additional: usize, flags: F=
lags) -> Result<(), AllocEr
>
>          Ok(())
>      }
> -}
>
> -impl<T, A: Allocator> Vec<T, A> {
>      /// Extends the vector by the elements of `iter`.
>      ///
>      /// This uses [`Iterator::size_hint`] to optimize memory reallocatio=
ns, but will work even with
>
>> +    /// Extends the vector by the elements of `iter`.
>> +    ///
>> +    /// This uses [`Iterator::size_hint`] to optimize memory reallocati=
ons, but will work even with
>> +    /// imprecise implementations - albeit in a non-optimal way.
>> +    ///
>> +    /// This method returns an error if a memory reallocation required =
to accommodate the new items
>> +    /// failed. In this case, callers must assume that some (but not al=
l) elements of `iter` might
>> +    /// have been added to the vector.
>> +    ///
>> +    /// # Note on optimal behavior and correctness
>> +    ///
>> +    /// The efficiency of this method depends on how reliable the [`Ite=
rator::size_hint`]
>> +    /// implementation of the `iter` is.
>> +    ///
>> +    /// It performs optimally with at most a single memory reallocation=
 if the lower bound of
>> +    /// `size_hint` is the exact number of items actually yielded.
>> +    ///
>> +    /// If `size_hint` is more vague, there may be as many memory reall=
ocations as necessary to
>> +    /// cover the whole iterator from the successive lower bounds retur=
ned by `size_hint`.
>> +    ///
>> +    /// If `size_hint` signals more items than actually yielded by the =
iterator, some unused memory
>> +    /// might be reserved.
>> +    ///
>> +    /// Finally, whenever `size_hint` returns `(0, Some(0))`, the metho=
d assumes that no more items
>> +    /// are yielded by the iterator and returns. This may result in som=
e items not being added if
>> +    /// there were still some remaining.
>> +    ///
>> +    /// In the kernel most iterators are expected to have a precise and=
 correct `size_hint`
>> +    /// implementation, so this should nicely optimize out for these ca=
ses.
>
> I agree, hence I think we should enforce to be provided with a guaranteed
> correct size hint and simplify the code. I think we should extend the sig=
nature.
>
>      pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), All=
ocError>
>      where
>          I: IntoIterator<Item =3D T>,
>          I::IntoIter: ExactSizeIterator,
>
> And implement ExactSizeIterator for IntoIter.
>
> The only thing that bothers me a bit is that the documentation [1] of
> ExactSizeIterator sounds a bit ambiguous.
>
> It says: "When implementing an ExactSizeIterator, you must also implement
> Iterator. When doing so, the implementation of Iterator::size_hint *must*
> return the exact size of the iterator."
>
> But it also says: "Note that this trait is a safe trait and as such does =
not and
> cannot guarantee that the returned length is correct. This means that uns=
afe
> code must not rely on the correctness of Iterator::size_hint. The unstabl=
e and
> unsafe TrustedLen trait gives this additional guarantee."

Yeah ExactSizeIterator is not the solution to this, since it can be
implemented without an unsafe block and the implementer is perfectly
free to provide an incorrect value - so we cannot trust its result.

>
> Acknowledging the latter, I think we should implement our own trait for t=
his
> instead. Our own version of TrustedLen seems reasonable to me.

That sounds reasonable and would greatly simplify the code (and remove
most of my fears about its optimization). Let me explore that direction.

Thanks,
Alex.

