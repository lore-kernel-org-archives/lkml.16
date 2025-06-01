Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E367E0E4;
	Sun,  1 Jun 2025 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748746858; cv=fail; b=m30gkiP3Mo7aqfFznVffZ74aE5huNTmyb7cdEOrl9sZ58C9HOdBxqLiHxIMmVwbmSmnSLO76SkYdbI5bGmkkAyZQqbWKJXz4PeW44vxlCytUb6vJGw2XQcUOg/Yl55KggvkCAFgp52gMc0ulHgRmXyEucD0F+2fkQr4ZQs16MTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748746858; c=relaxed/simple;
	bh=eaXK5mnzwWdzW9OrI1hUQQmzsojc+QI/JkgRudbtKEU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oTcFu4JvA6jgdv5kHb6BpUAQXWkOIpBpLwDOjko7T7tLSSoo95tA8aETzM3sXR6vw46VGaqEDwB2vacnsPgIRsdVNBeLIemAY/dvzPIwbJqqd827YrhlamenWjKYf/U9H1zK9BzrmXQKY5qw7Y/oSE2/VGOF1gWAvi/L4SJa98c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QN4/01wk; arc=fail smtp.client-ip=40.107.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QN4/01wk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKP4LioyAAg80S+0YC0QrcXEjWewOo7MrGU8y6ADhwcJufx2y0vkSsYuMX3IsRqKF56qO2p3fYuIAHD4f6wIkHKGR6QVPzntvDHq4PVtUKkFK2vv9b4kF7HmLNlw9P5GIYs6sGZCdYFGud2jb83jt0CXZ1yyQQqgn5vzGFmOn6PPaAKxG8umctDrhm+x+yZ4+0keIVwJoiqdCiHdXqGOlFuFmJSJ1QdnjAyWM5l8X5PpPzzKR75/0eY390fSt+LJzaH12OfItBGONkW/3n5ZErAeSmG7OmerLIpi7MRlT9MhQf9MbxNcZNBSaXBEjV/32unj4Buq9Aik9wBAUquyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEYW1E/oawWhPioCdxXtIhrmaOIB+urdAyvEsD35Wv4=;
 b=lAZ55QBLJPyjK+SskVaKUk44MkRSHoWHx3zUcMGg6OFfxPArcUezVW5WG2XT4HpZIq3k3eG/RRQR0d9boUSvi0/eiz0EbOWNECntrdCTrewH0wXDA7d+VcdiaAyCdeqMKA86kx5bMJ9g0/9YYs3TjCEv/2b0ZCAlbi/1IjdNCqZGJsdCqaROl/HZ7yPKFYNTWMxtcLrGeDTU3tgalcoSmBDMCA34shCbH+6Kl97ZVqqrilqWFFA3lNfNJ4+0k0oyxMRZrleyL2hK6wdSdFO0dNDiMvW181fxs3CPl0fN6q5vgqcR8UEquSZM6a/VxDvUh2GgbVMqZ2PR4mtXSK0VlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEYW1E/oawWhPioCdxXtIhrmaOIB+urdAyvEsD35Wv4=;
 b=QN4/01wkpM7v4anNP84ivMRwuQzUJA8mflhQmLx/io7zeA9GAb9J1uBoscya2aJ6BDn5tn8vNIlma0jpjDSnsb/REZ9j5mZVc2JlWZ76ZJnC4B/omdwjmQFRSDIfJhIRFWGdfXOANZ8StC76U/vCEKmEeOEbHyz2Wx4NKO3DgVhvR+5F8ToM+h3YRaRzfeKFwr56qNwW2PErO/upSG//CP3jgl7WlUTK88zlvRAp5QOnyaLfHx91SVKYmjhjFaqgCh0AIyLi8yXB+qbQfS+SzTREWgrmU/4PdgHFYQiLvJMIPpDhccs2vU0v3UfYL5X7IDFwXFaD7xn2SEXBirAi4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sun, 1 Jun
 2025 03:00:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Sun, 1 Jun 2025
 03:00:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Jun 2025 12:00:40 +0900
Subject: [PATCH 2/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Arc` types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-borrow_impls-v1-2-e1caeb428db4@nvidia.com>
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
X-ClientProxiedBy: TYAPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:404::21)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5c3c1c-c4e0-4c4c-4406-08dda0b8864d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q09WcXpSR2FMQkc0ay9keTRCcFZUZzFYMXByN2JjSnRWR2Z3QmgwWC9rMnpI?=
 =?utf-8?B?eUhLVUxXaW0wWWJkd2dXdURNN0FobUc4QXJwVTZuT01rc08zZFNNZmVNS3Vz?=
 =?utf-8?B?Rm1TK1JHSDlxaUdSc3F5ZjVVbWZhM2kxUG1weTV6MlhNd3VmdVNUSGRNMlRS?=
 =?utf-8?B?clIyVDZBelB5Qkl6Y25Pd2tLV1YzN3p4anh3Wmk1aHMrUS9SZHdVUThDSU52?=
 =?utf-8?B?OFdxNmVwT1IrcmZGSTBmMURQRm03c3hLajk4TWYzbThtODZkR3pVbnROUXpi?=
 =?utf-8?B?N1VLRmpJMHZCNTdzMTl1aEhuNlluQndKV1JtcHg5UDRENmdpSTNTQWVEUXNr?=
 =?utf-8?B?bzhlZFZyWG5VYmMxQ3FIWjcwTmd6ZWorOE1Ic0wzUmpBRmkwM2pGYTNNYVZt?=
 =?utf-8?B?WE42N2xGKzRvMjI3cjlrRUkzbkRXRWtyRDREeXV6bGNCWWtoV1lUd0kvVGxk?=
 =?utf-8?B?NXNWSHBybUpHb3czWGU2RjMvUGxPNHZpZnBNZ0t5eHVHSWFFYVRZaTE4R050?=
 =?utf-8?B?aGFrWkx6RXFCOHd4Nmc4RS9YWlBxM0lWUXVYL0w3R3kwREZuOEpMUHZ5cDhh?=
 =?utf-8?B?WWhkR0hPVTRjRS9yK1FtTTliQkMvWUNFNHN4UjVabjJnVEdJM2t2N1locjVC?=
 =?utf-8?B?VjYveXpWaG5UUHAzbllHelVqdkozbC9jbmZlZ0RRbyt0ek4rNlhyN3dYVkRI?=
 =?utf-8?B?Zlh6dUJKZEwxZVFwdGVwSnBaSHNaV2dEMHlzY2NSTk5DSCswLzhQaEVqUm5a?=
 =?utf-8?B?OW0xcEFxNklRWTV4ZGdyRTNOekljUThBMm1Tb1BhUGxTVVZTL2JHS0V1N0xw?=
 =?utf-8?B?djNxUUhWaUFUdXZPV05uT3FKRXJ0ZHFQRllZMFU2N21jNWtGL0lsUncrZG1L?=
 =?utf-8?B?bWpENjJVQmJTMjNrQjNCZXBvVVRvQ0RWYUQxYk5QZ1orSmxSaWlEd0FkbXlQ?=
 =?utf-8?B?b1ovWDhBTk44QkM3R0tjZGhVMjNLaDVoWnp6dFFYMFhrTzVqcDdUNlh0NWlr?=
 =?utf-8?B?d2VXSlNHRkNzYnk2UklPOGtsV3VudlZ1bzY3ZmhkWWVwd2dpTCszczZnSElB?=
 =?utf-8?B?azhLemdmcGl6TEQ5NDkwbk8wZ1YrZzNwZDBZV2cvTFozZEZQMFA3K1VQZmlM?=
 =?utf-8?B?MTVaSWhMc2NGTWdWY0VLdkFsVnJ0MkgzUXVLeDA1V2xRQ3hyd2tYd1I0SFUr?=
 =?utf-8?B?Szcza0hpYzY2SjZ5dEhHWVB3eDVVaFJxSm9URWpGaUFCbERUWXdNMXZhR2FR?=
 =?utf-8?B?cThpWTRVYlBlWUlUUE1MSGUzemQxRVZQeWhvN2dYZ0ZRTFZNemVyNFE3MnpS?=
 =?utf-8?B?NnpQeGxwakhqVVM5WFBITEVnM2NVWWpkWjRSOVJ5dG52Mnl5SWh3Z3dmK3BU?=
 =?utf-8?B?ZGxBVWNnWnNiOVZNM1Z2SERxQU9yNEtEVDF6UHhlZjZWT0paQUpBYlZYb3gr?=
 =?utf-8?B?bjhaajE1S1N3RHl4YTRVV3F5SWs0VDdlRGJsbHVXWWlpbm4wNWxET2VCQm9J?=
 =?utf-8?B?UlpGdDJLUnp6bFcrQmtyanRMakxKOG9hcENMbUFBRTBvbzFKampybHUrMW5U?=
 =?utf-8?B?clNpV3JhQzVhOG9wM2dhUk13WlV0YTdSMExCZ0FSY0pIZ3ZVSm1UcjFiWEo4?=
 =?utf-8?B?YzlIQ1h5UlFzUGtua3piSEJ3Z1VFNktFdkNaaW4waEwvWUpKSHlQYmVtb2I1?=
 =?utf-8?B?T1hWa3o3ZFNIMXFHcTZ1UmdxQ2FsNWFpUkVIcFMrUFBLOG9JY2tZYTF1d0p4?=
 =?utf-8?B?UEZBcExBWEpDdjdiWEtaMXFOTjE2QnJVcTRRazdoaUl5UzAzSG1ya29VbnJX?=
 =?utf-8?B?Z0M0b3hLRkZGRnY4c1R5aFMvZGt1V1NMbjMrRW9HL2xmOGp3NzVZa01kWlNz?=
 =?utf-8?B?VHlpcTEyVWJzUUlxSVFZK0FKWVJpNFZkaDRxRUFnSjV4R3l2U2Fyb00zcUU0?=
 =?utf-8?B?SzZ1Y3hOeTVxNTBaem1qU0FubXJXeVVEd1ZWang1OW9rdTQyQm9XV3lpWU9F?=
 =?utf-8?B?NmtjcDhvQTdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWJheThBN0RLYlhud0psRFoxQUVsL0tqU2N6cGJwUkZRV2pzdjdlUTE0N2dX?=
 =?utf-8?B?QVlnekdWNHVRbmdMQThqT3FrKzNycHpDUmdyQXVOd3laTTgxQ2xQNzRHVSto?=
 =?utf-8?B?cGxLNnpGOTZsbmQ5ZXVyUzZmdjVwUnIwMHNVUE1lcldkQlptMW5DNjl4Q2Q4?=
 =?utf-8?B?M0dFUHVJMnV3RDBhVGhhUjNnR2xNZVZvamNGWVk5SUZmMEc0Q3lzUVl1T3hZ?=
 =?utf-8?B?SVgxMExZVmpRNjZyZVI0K2QvRERxMnU5OEVHQkNCeGRjSHdvNVo3cVZZSFdR?=
 =?utf-8?B?R3VpbkpJQStSM2FyVDZjNHlKTmdGbmFHV2JsMUoxa1Zoa3FLVzRyWTIxRnRM?=
 =?utf-8?B?alVMaGptTmlvY01XMktqR3gycnoyclBneHhTWmJwYlN0c0J6Uzk5d3dNZ3N5?=
 =?utf-8?B?bWUxUzRiMGFvbGtrUzNhNHQxSjhXQy9NZVZndzJEelBoS2piWTRVSTNhYlVk?=
 =?utf-8?B?eGFLMDF2UDZMNmdnZnF4TUY2d1grSzNlUnVzN1RES255MW9lekYvelJrdFVR?=
 =?utf-8?B?RTcvU2ZuY05jUCtrdFgrTCtkajhGRDlmekd1VFczOFRScklZZUhqZVVRMGNt?=
 =?utf-8?B?dFhUd1c5bUlxUmlHVFBab3VMajQwWGJiYnRHdUVid1FhbkRJaktoL0Q2T0d3?=
 =?utf-8?B?QjY5VTNiaFdiZGRYTmx2bXM3SFJGWlNVa3doTjlaaUI3YnR1VThCdGJZbVcz?=
 =?utf-8?B?czhRbDBZb1VLeWtwd09tekYzVzVWZG5qYXliRjBPZzZjTGYyTlRXVThjbDEx?=
 =?utf-8?B?d0FmcVN4anBPZzhBem1oZkY0djhacUE0c3RvL29vaVZlZEtzWWhXZjBhWk1O?=
 =?utf-8?B?UHVzV2NXaGhKaUFyMUdkb0ZORGVuRWswTmszRHE3ckdRUGo4V3hZb0ttYW0z?=
 =?utf-8?B?aXdCY2ZHZmtxRjFnam1jNWxoSzJ0eXE1V0U0NHpqbXVsTG5TaHpmbmpvNWMv?=
 =?utf-8?B?eGh6MVczT28rWk5uV0E0UFVRd3IwWG5Cbk82TzZCelRGYWtDb0pBTWVoNHRx?=
 =?utf-8?B?MGlMKzE3cFVvZllNYXlUMEtoYWI5QjJ6V3ZTamJnT3JnNHl0RVF0U20wSGFp?=
 =?utf-8?B?b2NML20zNC9zRlB3UjYrKytNYmJiZGJIYmluNFJrTUk5VjhzOHk0MGZ5NlNY?=
 =?utf-8?B?ZDViblRNUGNYSXgzYStnTVlWN2Z1SDExUTZxSXdQZEtEc3U2NGVMZFJTWVAv?=
 =?utf-8?B?OGtrTUNHeEIvY2VERE5NTTZLYlZLUmQ5d3dwOENiMEJlUElpSGRNT3lqN1F4?=
 =?utf-8?B?eTJHczhla2FHb2tjSzlEVFdYZWdrWXFVS3oyc0dZM0pKcE9USGJsTGpNMUlu?=
 =?utf-8?B?Q2tyd1RhNjBuK1pXTEc4dDVwU0tKRUFMTk91OHhYb2pNTk5IT1Q4OGtQdHor?=
 =?utf-8?B?a2xlalRncnNuWHRFSmdHV1J2aUcrcnlXK1ExVi94T3Z5ZS9WZmwrd1NsYlZW?=
 =?utf-8?B?S1JQVm1wazVPbFFtVnI3STd4Yy9xMGM1YXNFUDd1NVZ1cEE3WWtQaHlFWVpl?=
 =?utf-8?B?emF6RU1xMVJld2M1MmF6OGRFYmRta2JlREN5bnJ1RVJENVIwU0ljQ2FCcFBy?=
 =?utf-8?B?Y0JtTnE5REF0NTJPU1lJZHBxNFNvOWxsTEpBeU5TenozRWJMcEluYjlzek85?=
 =?utf-8?B?c1c5L3dVS3ZpMzhsSnI3d2ZXS1J2YnRoVno5NHB1aFE5QVFEbEdzdGJNWWtn?=
 =?utf-8?B?RHN0bXRwc1RkREpYNHhDZ2Y2cklOVXJLYmV2U0tmN1hLVlE4MHdxVUJrRU50?=
 =?utf-8?B?QStsQXVIVnZiN3FHdGw0RkJrZjFKMWszTU5FNXNycUZ3NndOUDlBNGlyZjBw?=
 =?utf-8?B?dmhTWXRLQzJZeHpZQ05iNjFQenNJU21PcjM0VFJLQWpQdjdQVUpUVUNjQWxx?=
 =?utf-8?B?cjJMYXJ5SnFFZ3RMb0NiTmlwUVVOSHIvaFlNWHVOZW9UYm13TVVvMGhsZTFM?=
 =?utf-8?B?MTBwbzNDT3RiVmlrWHN6ZVBzOFhoaFpqditoWmQzaGw1bkw3Qjd0RnJDZXRD?=
 =?utf-8?B?bGZVZFJyL1RKMkFHNkhoUEJqVW9SclFoUlBqYXBLL1V2Qkd2aHg5TkFvdmN5?=
 =?utf-8?B?UkVSa0kwTHJ6c2grcTFQUUJSeGJFeU1OK3V4ZkRFbGl4eEJNTFduMTh0Q0dD?=
 =?utf-8?B?NnY1WmV4SFZMdGw2ZGZocUxBVXZsK29rT0dVMGd2TCtzQUNtZVA1Y3lFcWti?=
 =?utf-8?Q?AyCIupmvFTzB1OPlrIPl5Zm+aHYEprGlJO0mviz5rtoK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5c3c1c-c4e0-4c4c-4406-08dda0b8864d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 03:00:54.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/7UyJrBw7pf8o529a3MHqqA99rj1UUo2pW94S+uJvJ0VTZwNM95o6ost1rPwXrjpaigQ5+AsUR3Ewq8ooiHYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

Implement these two common traits, which allow generic types to store
either an owned value or a reference to it, leveraging the `Deref`
implementation.

`Arc` can only implement `Borrow`, but `UniqueArc` is able to support
both.

`ForeignOwnable` makes a call to its own `borrow` method which must be
disambiguated.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/sync/arc.rs | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index c7af0aa48a0a049bfeeba3a81080355f4d381738..40507e8901c349ba5f782457c203ff4cc181dd6c 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -25,6 +25,7 @@
 };
 use core::{
     alloc::Layout,
+    borrow::{Borrow, BorrowMut},
     fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
@@ -406,7 +407,7 @@ unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
     unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
         // SAFETY: The safety requirements for `borrow_mut` are a superset of the safety
         // requirements for `borrow`.
-        unsafe { Self::borrow(ptr) }
+        unsafe { <Self as ForeignOwnable>::borrow(ptr) }
     }
 }
 
@@ -426,6 +427,12 @@ fn as_ref(&self) -> &T {
     }
 }
 
+impl<T: ?Sized> Borrow<T> for Arc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
         // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
@@ -834,6 +841,18 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+impl<T: ?Sized> Borrow<T> for UniqueArc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+impl<T: ?Sized> BorrowMut<T> for UniqueArc<T> {
+    fn borrow_mut(&mut self) -> &mut T {
+        self.deref_mut()
+    }
+}
+
 impl<T: fmt::Display + ?Sized> fmt::Display for UniqueArc<T> {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         fmt::Display::fmt(self.deref(), f)

-- 
2.49.0

