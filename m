Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F321A0BF1;
	Fri, 16 May 2025 19:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422018; cv=fail; b=DaJrvNQe27k/8+sXkafAG5xDDQ1Ub/2n4/1kVXjIAQZTsK+5bvkPjtik3kMsaawdj8qxpT51GQqgTE47uKoDrAaYPuYf0MsFuhhenKmf/1dZPCKiIzfZaw6va+N6OTn7/LxrMwiKKly/UUCrQ+oqYkZmazAyKsJUaVnEdcVUCNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422018; c=relaxed/simple;
	bh=CbRKFkCotnJMRFFY19Tr3Zm8BGH5Mh+MVzCeX82e4eY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PGEm5cAW5gCiW/hXSbzmUtT6PY72+VDNNj3oXJWuc8uFZnBdqMoaqQfKTm+oOPWX+haa3whJT3WUXsoPhuAYSueMYZVw8fuWMgabHPEFGwNvg5yH5VfBxSEOwyGMJtWxt2/kB4AfZy7WWpPDfGrgbU14a9F+Ob3TO7Cj4m14+xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HoASBeZN; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HoASBeZN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDALG25czJlyceC5dnfk7VVyUbiasx2EMFsG1oVUhUIaL6nKgKlYbjB/g17WPflrfsLUTJaLZdrvqFxiTuehV3S4R/ZpXaiPjUuricSose3wuB99aCADg26YNNM59UPCjOo7oq1aTiMod3CtDaohxnsaokkizaYnL+nDIT6yyXtj/tXsII4lQU3mL/Si90rDfBVdQzEznz4vLyukOVZJuHutyqKnoFU5xy+ipd0wR/LXsO50C+rdFTngBBqcKbrfUM39csLsO0Bde52RIC9ImO3d5RtffetMxSJqhiLPtibIJP/zO0Se/KHYWCtWTkOJM0swVFlov09E/y1OTgD+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rAEckfGx8InbGiMZ141hf0sWvusmmNHlzwYK77N610=;
 b=XZCv7ujok9MwpJBd7jfo6CRK+Vg9y839E3xKrl3L+L+4p5FG1m4zRKmYkzn9r1SM7Ru9ZUG/n9Ap6T5R3c2EtoQmLf3u/CWSfIFenF59oh5tdbVrwoyQlvjdCgiYNK60SHK0xb+5JI8wLjsUlanGdeH3rZ57POZiKQXnm2WwKLYQJCCmMpbmTxDmsF3OgI0u3X7mrFaDnCUJbvTiGT/PiJ/CeKywd1f7VOGpQSl1f/n/xmfgcBJpyEkSww3Z/kEeg8DfdvW30nZtCRcz+E+PanWtMLC6pWHUVQ3dXU8JjleaEZh82GTRmq7fTMpKZZG/eaWcA7WJHlRcF392ufYFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rAEckfGx8InbGiMZ141hf0sWvusmmNHlzwYK77N610=;
 b=HoASBeZNTw1f27qp0U9Yxxm805/gabHbZnqnMiFV+ptjVBC1Tq01gfIOst7FJINpRorY3Vp9eLbYegJolIX879Qk1o5Vnj11C8234L3/asA4tv8uK1t9QZLq7EjlkmCbUGb86c6Wm2LV9St4IdvMKsBS5Mz4J+AlKfnRM3LpKVFpDxa0Sd7WWnjzfAjjeqdQyJhcywQ9XLYtrro0Iu8hQA8c3ZJtB63MQvSZqRWLDr4b8q/sRU1dNyeOI89LDKHS4+tCFkYyXNu+HRSpHfgX1PMyBoGH9sKPJGk2gnK7GKsL6cucFCr7XbWWwjPoXDH3RHEUyi7tHbZ0DI9vs/AN4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by IA1PR12MB9523.namprd12.prod.outlook.com (2603:10b6:208:595::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 19:00:13 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 19:00:13 +0000
Message-ID: <08a91cb8-2e08-44a5-9d5c-c2c223aaa71d@nvidia.com>
Date: Fri, 16 May 2025 12:00:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add basic ELF sections parser
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com> <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com> <aCdhS10JCh6HRpqV@pollux>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aCdhS10JCh6HRpqV@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|IA1PR12MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: e97c84f4-f372-4c9e-1507-08dd94abe376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1VaeThubXdubWtsdkVWV1Q5U1ZGY0RidnhncUxxUW5UcktJMGpSN1ZRbkVq?=
 =?utf-8?B?MHlYU2ZqTTBMQ2ZvdTZyN0ozM0YvSThob1l0c0lBbjljVHdUQmdtZE1LZFQx?=
 =?utf-8?B?RnJDelptZVB6TzlJMFFJZVVjTmNsZlBCNjJvclRKSlhya29YZkRTWDRBcHRI?=
 =?utf-8?B?U0hIaWJqdXJSdVlqbDhueVBiMGdCWVcwdjYxV3pRNFhHM1RnOWNkTzg4MUdn?=
 =?utf-8?B?SURiWTNUWkhiQzVLVnNPVEtnbFg3SEZMNmdkNnQzcmEwc3Zjd29Lc05RK3Bj?=
 =?utf-8?B?VHd2bjMvbThKc2lzOWlSVlkrbVJ6L09qeEdsV1cyNDFLTGV4SFcxbExzTWZO?=
 =?utf-8?B?VlNrQU9VVUhCNmdhRFVnWkdESWNIV082K2NXUjd3bm1JYkc1bWNuSC9tRTZM?=
 =?utf-8?B?UmlRbEh6Tm1ETG5FMTJmRFBWNVI1QnVyYi9LZ2RWMS8vWU5RTUFJcXlNUjlC?=
 =?utf-8?B?ZjU3QXJLZDlSaDdBTFd1Rk5zUzJnK1N5YmUyN2RoZGpRQ2d4bCsrZ2gwZ0p3?=
 =?utf-8?B?b1JPUGNmWXIyVlAxSnkxTTczT2JJTlNQcWY4YWhFcnF2RW9VZ1EzUi84VUQw?=
 =?utf-8?B?VUMwTVVyOFpUNnM1VEVMeVNaN0U5OHlTbEFNVHEvdTkwRm92Z1JHcGkyUFhu?=
 =?utf-8?B?RXY1VnlZbHdIcHVxZEZaMDdVTWxoQWpoTGNFeHpBS3kwVi9KYmh4ZUcxQ2oz?=
 =?utf-8?B?Y0h1VDZiRmxVbUh2MGlGQm5ZejlsUk4yczNZK1o2WGxJeGdjWkpJVHFHNnRI?=
 =?utf-8?B?NFY4TjIrSlc4LytlVEdmWUx5ZEpBeW1wc0tmQ1QwWWt2MjhjZFEreXk3QTAz?=
 =?utf-8?B?NGpiNTVCa1g3b1VMVUZHMjBhYnNwZ1FrTWhYMk9BdW5NZExXamxGN1NjYzZJ?=
 =?utf-8?B?anVVV3lqYWVwRG1MME5PVUEyUm1WZUo5MnNGUldmNUxNeVpQMzZ2ekdKYW1y?=
 =?utf-8?B?ZitIZjNLREM4SHF0Um82K1Q5UksweU4ydVFYSnV3Z0gvWGE1anA3cWNyOGFu?=
 =?utf-8?B?R1lIY3JJYjBwWkl0dXZNTGVqTDAyNndUQ2orYmhXR2NycklTQ1V0dUYrM2Q2?=
 =?utf-8?B?ODVDVjVUb285SWt6YXh5VlNRMUpLcHp1eUZ3a2gxNEt5TXhRNlU0VWpPS3Rx?=
 =?utf-8?B?VFdsaTdZVUd6czM0dlNmSTdablJEdjUyQXVmWjdnWVdWaUtQcHF3ckNtTUhI?=
 =?utf-8?B?em1sRjRXZGtySW1xaU00M3pjZmNSRVc5a2huenlwYTcyZUx1WnUxVWg4aGpK?=
 =?utf-8?B?RjlDYUxTY2lwNk1vM1R6N2hXVkdrdk1CV0lXZjlpRUpBY3R0dnVNWDhzZzdn?=
 =?utf-8?B?OG1weXdsY1orSU5teXRsTE5XNmNvbnVUWUFxeWRNSFRhZ29sYTExdzJzMjFy?=
 =?utf-8?B?VEpsdk5MMlFHTTRrd25zUThIOGRzczF6RGFXT3JDdmZaeDlvYjBJTXdqSlly?=
 =?utf-8?B?akpwSCtKenRkek8vSGFxWmhDUGJFdzhkWSsrRDBwSWZncnR4cUx1QjJtY1NO?=
 =?utf-8?B?RnF6M0I5UFUxU3huZGxGYVZra0U0ZjJXVHVrNzA1RFdpeXpwY1paTjA4UGF6?=
 =?utf-8?B?ZWo4OTRkTUdreGUzZjd3eG1aS0FINHhsUzk0RjdnelVtaTU0VmJIbzFnQXRL?=
 =?utf-8?B?UjR1KzRYbDQzQVVNM1I3NlFwSHVLRDE2Q1g0OVhNRVdTaFhGUjhzanFzTlMw?=
 =?utf-8?B?SjFVZVd6M3p5V080LzVlMFBVOVVTWHRwU3VRSkpqV3hTMG8zdmgyUUdoSzNw?=
 =?utf-8?B?ZUx5eU52TzlzYjByOTlTUEdiSWIxUmx0VndJK3VFdVUwTnhXK0ZDWktQM1Nr?=
 =?utf-8?B?UExudHNpR1JLUG5nUXZ4bzQya2VwUUN5OFBxNUZPMzBCZTExVFYvNGxNYzFh?=
 =?utf-8?B?WXZ2Qi9SMWorTFRFZjVINm01UHE4Q0h1MUQzaCt6SGI1Qys5UFFNeThaV2ll?=
 =?utf-8?Q?wZ7Tt4gMDfQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk5TVzlkTk91OHV1QUtCRzNJYW9JeE82YjRIaXEyY3dNTDZxQkRzZW9sU2px?=
 =?utf-8?B?czN5RHRaWE9LSVZSUkVPQ3hoR1Z5R2ZpSTJVNDhaWGcweWQwWmlrSEcxakZ1?=
 =?utf-8?B?dERLSW5ncjdHcVg0QTAreld3aFUzTGFYN21hbXRDUnNBempBN2t0SkU5NlpP?=
 =?utf-8?B?MVE2VmJUMUtTdjZna09PMEEzc3JBbGo1L3ZPNFk3eFYwbTd6aVJ6ZnZDdzhj?=
 =?utf-8?B?L21SeWZmRTM3dXNQVFBvY3lFYVgvZUc0bzRIMEtOVmMvdnV5L1QvNlRET2tE?=
 =?utf-8?B?dWM1YzZvdk1PeUR5MTR1VXY1eThkajRYVVVlMHBmdjJqTFpXRE4rOEJFUytw?=
 =?utf-8?B?elEwb3lJMkVqVGNJVUdRaGZudXV0MWxQOWxrZnAvQUNudnJ5dXAxTXpsZ0dn?=
 =?utf-8?B?QzhWRUV0Q3RncWtVWG8yUHNMUTRHeG9WMmljMjBVS3Nsa2svdGFpbXN1b3ox?=
 =?utf-8?B?VE50d3hwOGNXd2FhbldEQkJtOGZUWWNzcnZCVHoyeXRsSzUrVWh0bm42S3VQ?=
 =?utf-8?B?VXdlTlVsZ1VOU3NCSE1TWXhPOEV2ZEdiU2JBY1UrZVJJRUluSldJcUNyQW16?=
 =?utf-8?B?RXlaby9jSSt5OGJPRTl1VGwwNjRtMmRCUDB0OUZXVEFjSmhmNkhCdXpmaHlC?=
 =?utf-8?B?S2xZM3BXTCt2aGQwTnk5aFc5aDdvY0hlVXY4Y3pQbnF4VzdBYTFyOUgrWWRK?=
 =?utf-8?B?ZzV4VnRWVTd3RHh3SjVsMEJGeDdSaXFic09abzFUN25PMWppZStrQkI3VFZM?=
 =?utf-8?B?Uy9aaXVkUGxXNGhnc3ZTN0FUVHJhQ1l6cDB3OUViM05ZN3RiUVJzWUVKWk4z?=
 =?utf-8?B?dG1GeVVWR0JsOTVSRkplODdqUTAwamozWXJXNGFnYjNRU0dQSjhjZm9FakdZ?=
 =?utf-8?B?Q1ZqeXlsRGR6ckR5bHFKNy9IbTQzSityS3F5M2tiVHAvRkdTbmVuRXh2Tkp6?=
 =?utf-8?B?UjE3L0REekxLSjdHSHpZRVFNWjZzbktUUzJDQjNQSE1nOS9xazZueFVKZ2JY?=
 =?utf-8?B?bk9KaG5yNHpUcWNZNHMzbXc0bDJScXRRcVhBZGMyTWRnTU45Ym51ZkE3TW9z?=
 =?utf-8?B?dGhHT0ttLzR5MVJydkZnTEVuSjFESSsyeURLR2FhTHo0eE54MFlEb2xMMjdG?=
 =?utf-8?B?V3MyZy9HSmlIcktxaitURkVGUXJOUEtJSkpuNmpvRlYzRzZPdXNwbGFZTktG?=
 =?utf-8?B?RFpjQzR0RjhHZ01QamZTTzIzL1l2MXpkSytlbmhhZ0U0NkREZkJucWQ4R2JO?=
 =?utf-8?B?emZBT3J4azQvZVVpSlkrazhKbDVJZk9SV1J2YUNMaTZuam04QmxPQ3gxSWN0?=
 =?utf-8?B?RE4zK1JYMzNLc09QcTNTR3lpN1dLelRjOVZrQnJuamh6WUlkUWF3MElpeXNs?=
 =?utf-8?B?c3luNk9vUldONzBMU2tRQVFhM1N0dUFlRVFpS0NtTFVlcytTNUVwQXR3MUh5?=
 =?utf-8?B?aTk0b1Q0ckR2RVltQ2lCbm96UlRudEZGNGNIZ2lpMmkxVG9QdVp1dUVaREJn?=
 =?utf-8?B?YUJVeDM3OWNQOG02c2k4WXhsMm92Q2YzdW9LajRGdFFLZkVDYjZXSHUvbTVq?=
 =?utf-8?B?aGFjamNsOURNM0FxVWhwUld5TGtjMmVnN0hDeEhURkRMZkRFVWdVa1hqSjNi?=
 =?utf-8?B?V0FoQkJoWlRSRzR2T3oxUDNkOWg3SGI0SllzWERHNTRobldKWnE2dEkvTThz?=
 =?utf-8?B?QktSUGxvcjdybzFpUC8wbWxSMXVkY3MzWGlOWUMyem9qS1JNL3JVSUxzNnpN?=
 =?utf-8?B?ZUZtbU9pYlB2d3g1dTlmQyszSkZJQyt3eitrNjZyVE5VZml3cXFxY1BweTdx?=
 =?utf-8?B?c01aTTk3a1JnVUQ4bkJ6K2hJRU9SK21MSXZ3YkU1eWJDRUJBeURjY0FwQnRi?=
 =?utf-8?B?RkFlVzVtdzUwMHJYT2s1c2pyWU16WEkyYlFYM2I5Wjh0bEpuTUw5bjBHTzNZ?=
 =?utf-8?B?T2N4L0NKQnliMTVSdFBZZUtkVGRacE5EU2tWNmlWS0JIUW9NdTlubTlGdEU0?=
 =?utf-8?B?N1RrY29QOWlPaFdYMnVXUG5Sa3ZRWlpTd0grZVI2ZU93N2xrbTZqTm5HRmdG?=
 =?utf-8?B?TERpbFNpNGZ4bkprRGRFMTArcUVKVTB1R1pFS1dSV2JpSko2V05pdTM1SjZ2?=
 =?utf-8?B?ZFpkamZUMzAzcGQ2NWVUK0hZekFjUURHMlZsRHBpRjcrbzlxVVd0ZFRWQkhv?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97c84f4-f372-4c9e-1507-08dd94abe376
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 19:00:13.4602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFHvCiORL4wH5cEyI9clRfgmkSm/0eG3GWQHKqo6COxSfMS4Hy3qqiltysuSAKAFzywTh+R/DDL/tHGJzLw/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9523

On 5/16/25 9:01 AM, Danilo Krummrich wrote:
> On Fri, May 16, 2025 at 11:35:42PM +0900, Alexandre Courbot wrote:
>> On Fri May 16, 2025 at 10:35 PM JST, Danilo Krummrich wrote:
...
>> Now the GSP firmware for GA102 contains the following sections (skipped
>> the ones that don't need to be extracted):
>>
>>    [ 1] .fwimage          PROGBITS         0000000000000000  00000040
>>    [ 2] .fwversion        PROGBITS         0000000000000000  02448040
>>    [ 3] .fwsignature[...] PROGBITS         0000000000000000  0244804b
>>    [ 4] .fwsignature[...] PROGBITS         0000000000000000  0244904b
>>    [ 5] .fwsignature[...] PROGBITS         0000000000000000  0244a04b
>>    [ 6] .fwsignature[...] PROGBITS         0000000000000000  0244b04b
>>
>> That's 6 files instead of 1, for serving the same purpose. And the number of

gaahhh!

We are already at 252 files, *before* artificially exploding the GSP
into sub-files:

$ find /lib/firmware/nvidia -type f | wc -l
252

...
>> I would push back really hard on that one, unless you agree to go after all the
>> drivers that do the same thing (and I have names).
> 
> Great, but then why did you back off in your discussion with Greg? Given that
> you are convinced that this is a valid thing to do for drivers, you should keep
> discussing it with the target to make it common infrastructure.
> 

One way forward would be to apply this to one or two other drivers.
Alex, you said you have names, can you please list those names here?

> I did not argue for or against it -- what I do disagree with is that we seem to
> just agree to disagree and stuff a generic piece of code into nova-core after
> three mails back and forth.
> 
> Please keep discussing the above with Greg until we get to a real conclusion.
> 
> - Danilo

Danilo, this is a small amount of code. Is there any real problem with
a compromise, that starts out with Greg's approach of putting this code
in Nova?

And then we can promote it if and when we can make a good case for that.

But in the meantime, we really need to be able to take "yes" (from Greg)
for an answer! I don't want to blow up the firmware images, shred
the "Nouveau and Nova can use the same images" story, and delay merging,
all over 100 lines of code.

Yes?

thanks,
-- 
John Hubbard

