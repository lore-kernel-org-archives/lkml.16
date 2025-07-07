Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F72566E2;
	Mon,  7 Jul 2025 05:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865293; cv=fail; b=ORJXSHYJnmG9Vw5hOboh2QcGS4ubBqxA13C9Mj7xlvLKzr6p3CBqGA65Ggwj4dd4gNJtOllcDXpj44ucOze/ET3tmxlfs83RrqlLWTN5nFsoKoz21oaQkLvP/3FBAdDZdlfq/sF7jgCxV6gTDqPTofztgrJ78Qb0LqlAUGLSLqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865293; c=relaxed/simple;
	bh=bCKehGSghexXVFBQ1yKl4/vJmLUOU9k87TwH+KC+LrI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ThucNqBgTmJol9CM1iiFblKToXiXljdRvuCXTKv3GtLoFVVvh99XyYeZu7HAWjqHtBfkO7uJG52TUgx6+n7NN2fOVbHVUtew0VCEbDuNy3u+GR6zD7XcWJo6STHRlTv/Vq6nZ5hpnH2Rwoo8UEAf0pGnqjQZyGIvpnWfFAZ5sgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tf5KWDI1; arc=fail smtp.client-ip=40.107.96.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tf5KWDI1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNJtqKzefNUU5zlJJpoHiUbSo0BnWczi5BUJy8gQlng0Wosh/BbLHhyVlC2Df70Pa1YttLncyPBCGjEMgKb8ahAe7tFFoMXgR07Sk907671/FbDF8Km8cj1xg39lYAgjC5ZjgVpaQBSrJrejQh4Brda0/d9+MN3ayxrpHWmLAKMxZpMx1U1ifyCx/8UXG0dMPTlGsIkbtaVBZ+m3/e0DZQjOwrI7pRSM0fgnI1KT2LtPvASvrE8+EWVpYBNSPUP45gaRmRDq8H1KBff25b15yhIYObUZU4Yfn6lDIg2Dt8trWay+SZTFgj5qE2MVStA/DfZtL1B34iCrh+yzQzM8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDX2X/mYpHb+wyTAJKMhQursjiR1QhNkjLqaYqilzIg=;
 b=N4FoV+EtLS6knUgAZzbToAiNsfC++ymtLNJ5KJOHC8/yo5bCWQlj/4VbD837tnbfzbf0Obxmi3gBGisPGMHQmyEUdgALwpFBdHhGdwb7VsyjvsHrFEO5Hc+f/d68WYaov9gCVN4RQwayp/JTK+NjVHZ1SxVAQGAm0Ez8BA6Kd81qdpPejpjo3vbihCVYesGYiC+XmOxmBUNcVV4v4hxv+zH8awH3Qqk4Lk0bDPpQpIniwH86BIU/Key1u42fUIX3qYymAxavjVeCnrrRTpIWlBtmpVvTgH4FlVA4WavoTT1bGaHhhpwhZbu5N2mQM+rxQJYz8qvFIxWYst/JwNFPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDX2X/mYpHb+wyTAJKMhQursjiR1QhNkjLqaYqilzIg=;
 b=tf5KWDI10+/vFgWGCUVeCBsvEcG3gXUvgV5CxVtv/5VCeiRz6lumV7qUXtGvWaiVnlzjivXj9t1DUBKYwmLnD9TNNrgIcxdgFNmPGwfP+Xe8UuUcpZ41LvjP+ItlufPCYqKLSNorrYY289ygVThT+dOUZd61xNsjtcdL/Cdi6l5SiIaF5HiZzyjtldytmcLuGcjoizsPy9PC134RPUWR9katQcqs+FfFCk/I1UCCYOKmxqKfhJTKGRsW/tXleArrbN3W1Tl9ILYcGL33+K2GXyfg0ka1NMTc0/P4bYqoE3MklM3eVwj3sgNJtxActvzEhNVEiKn9FMquHFFYGZ1E1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 05:14:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 05:14:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 14:14:43 +0900
Message-Id: <DB5KEWX9EJ2Q.3CX5EGS66OVHH@nvidia.com>
Subject: Re: [PATCH v8] rust: transmute: Add methods for FromBytes trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Christian S. Lima" <christiansantoslima21@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~lkcamp/patches@lists.sr.ht>,
 <richard120310@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250624042802.105623-1-christiansantoslima21@gmail.com>
In-Reply-To: <20250624042802.105623-1-christiansantoslima21@gmail.com>
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: 87960ba3-7cf9-4cff-7907-08ddbd153096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUdBYWplMlZ6UHUzT1dHMFpaZFRZa1JFWjViN1JYUGFHNmE1RDRXNk1ORWdF?=
 =?utf-8?B?cklYSlVhV0tMaVRnMG9vMnJoMVVjRnRaeEFVR2RtYTEwUVk0L3czdVVZL3I5?=
 =?utf-8?B?alpjdGpnMHFvYk85dnR0eTRvTGwyL3VFaUxKS1dWWi9BaXVtQStmZUlxYjZ2?=
 =?utf-8?B?czN1cUp3VTRkREkxQmFqOUxMS1pHV2FRK3NycnNXckVxOFlTUE9jcWZhVi9N?=
 =?utf-8?B?UnAyN3g2Ni9YUTZ0ZzZSYWtHOTFXd3JxYjNpaVpDUDJna2FVbGR6N01tUlBR?=
 =?utf-8?B?L0h3dlZpOUY5aCszVm9yQXVxNzVwVm5WeXowMkFTczZHTjhScDFjOHd1QWY1?=
 =?utf-8?B?WGp6NG8vMUxwQXJNakUrYjJOb3BKVi9laXRISlZUeUUyVktTWml3ZkhwZGVD?=
 =?utf-8?B?b3k1RDlSejBtUEJlWjl6RzRJdlRzdUhlK2JWeWQ4UmVRVG92ZU1ZYU9iVDBM?=
 =?utf-8?B?N3Q4TzIvdVlBY3N1MW10eW00VFpHVzlpTGNxL2tRcmpVQ0NmbTJGQUNYb0Q0?=
 =?utf-8?B?WGNCS3RVNjJBV21xcTNwbDdHNE1BcU9Vd0NmT005QnNnMjdmNzVwUHFnSkNO?=
 =?utf-8?B?NlNqVFhSUDFwU3V5NlFya0Z1NG03REJTRFJyanRFa2QxUG1QdHJDdHJMcEh1?=
 =?utf-8?B?clJOYVN5MkxDMks2V1l5WTQ5Njdva2lLUktpYVpBUmI3TUhUM0t6SmRscU1S?=
 =?utf-8?B?VldWdkNqaGp1TlZHSDZTaFl2ZlNqV2Eyd0syamhSb0tXVlAzSVRTK2ZwOXlF?=
 =?utf-8?B?UE8wUHhiRFU2L2Y4UFBFNEtUNVNOcDQ4MjFuK09IZmFWSW96RnV0d1diM2Fu?=
 =?utf-8?B?R3QwSW9JNWNwSWZDdWY4UnNLVk1jb0RkajQzT20vZmVuR041UXBrYjFGWklv?=
 =?utf-8?B?UjJ6aXp3cUhDdklTRlNCamtJakRRMUZqYmpmQlFXNzkvdld6Y2VLaXpjUlNQ?=
 =?utf-8?B?bDhaLy9mUzNUcWtWMzVtVjV5bVRtSFNYQjdwOVg5Z2RQenNEcTd2YjVaZmhm?=
 =?utf-8?B?NFhQN01lMkVPUVRVbFNkR3RZYjY2TDh2UGRjOUhEclhDNkY2aTFsTDR0OUlq?=
 =?utf-8?B?dkN6U1Erby9uZ0FEU1VpaTd3eUxoNXdKTHJwNFFpdTlqS1p6R1pueGppNUlH?=
 =?utf-8?B?RGhjOGRMNmZpSHdEY2JnNEVvNy9RUXV4ZUJFMi9wS1Zva2d2QWJrdTgvRFZO?=
 =?utf-8?B?Ui9ucW5ka2xXZU1vWnR5cUVLTHIzMWVtS0VJekFQSzFBZ1lsV2t6d0duTGRk?=
 =?utf-8?B?enFZQk1ZcjM1WS8zWTQvS1Nia0N5M2hSN1pIV3dRV0FtR0dicUZCL0FmZXFi?=
 =?utf-8?B?U2NWUTluMWVFRUpUSWNheGtPaWp4OU1CR3g0dStkVlBoT0tnSm5XRUwyb0tp?=
 =?utf-8?B?VEJQcU5NMW9kREoxTHdYdDIyOFpSQTdqMitBRFRwQUVEaElTMnREOW1DdVVm?=
 =?utf-8?B?RGdDMDNlVE1ENStYck5aL0dtNUlNK1QwYXhZYVZmVmdSaXNBaHZ5czVMOE8y?=
 =?utf-8?B?WVRYd0lLdWc1RkNiNlIxeUI0SkxTNVJjZzZwZnpwYzdlK002Nmoxd1p4aHhk?=
 =?utf-8?B?dnZzL2hOdCtWWWhISlZENUJFRllMUGdlRS9oVENVb28xMVFGZFh2TWdjYnpo?=
 =?utf-8?B?b1ZRLzBvNC9wYUlpa3JvbUFNZ1B4U2tuVGVlSkFUR0Q0RkNMaG82Z01uTGNL?=
 =?utf-8?B?RXh0eFhaZEZvTCtyREJPZk5FWHpzWUNRSG4rZ1dwQ3NFWWRFaFU4YkRqc2J3?=
 =?utf-8?B?M3hRK1d1WkpOcGVUeHFYZlJHWHJJOFhqaUFWRWJLeCs5OEpFVW9KZHE5U0JO?=
 =?utf-8?B?aHNvQ2NBT1JOTXFpT1hxNEdXZWwxWGNud1FVTWJISUtwNWtpRTZSR1N3bjQv?=
 =?utf-8?B?b01TR094Z0lkUG5SM284bzk5OHA3TXVOTEZEWjIycUEyeHlrQ1lzUVJiQ3Zj?=
 =?utf-8?B?SXFKQWt6RVVUR1krSkZOdmJIR3AxNGU2MUpNWHYvS3M2SnhjcDBBb1JVV0sw?=
 =?utf-8?B?N1R2VVppeTl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJhSlMrcW1sZXpyYVlDaUY0dlBjOUxpZjBGNUZROTJmcm1SM2lvZ0JXYnJC?=
 =?utf-8?B?VGo3Y1o5WDVQTGFrWmdpeWQxMk5qVkpPQUFjS2JGMm8wdzRsanAvbzkrOTdX?=
 =?utf-8?B?aGxkWUh1aklOV2tGSWR1bW9ZbHlMMUlBL0NUYmJLSnBYU0liSXpoakZWOEsx?=
 =?utf-8?B?dTQ3M24zL0h0SmFtUUdBUTVRRWY1Y1J5Tk9TUlg3VWg1bWN4MGhEUHQ3YW5T?=
 =?utf-8?B?Z2RQNUNGNW5CUFZ6NDhQK0NFLzRscWsvdXJBVjlDQlJIVFB5dENtVGJvVzJn?=
 =?utf-8?B?OW1IOUpOL1o1QTk1VW9nUU9XekpPOEJTMWozRkxMWTZyWXZYVUIxMnFLd0Vp?=
 =?utf-8?B?d2ttMzNBbDRqanR4ektQWm1uVXdhK2lkNjU1bkZHYTd0dU0zWWpFa2JtV2c1?=
 =?utf-8?B?aWVjRlFOUzR0TDhFNkVMTGV0OVZqUXh5Nks4TWFETjVXbXplT012ZS9sdFNz?=
 =?utf-8?B?U2RpVCtCdDVzaFgxYUc0MEk3cVVaUFNpQ25jMHNjUTNCZXJaUmM5Y0gwVHNJ?=
 =?utf-8?B?dlZaN3JoTm53alBCWE03WUNGWVdPRWJXT2d2RnZkTmhCeGJRQzFyVTRUTXc4?=
 =?utf-8?B?NHR6aEVONHpnZVRqVG5pYUV2YlRmWEI5aDFMZTBXd081MG9ORnhFWWtiaHFw?=
 =?utf-8?B?d3JpTkZUc003d2RaUWUrdWRyeld1alUvL1FJOTlMakFWRE9VSkMxT3pEMDZv?=
 =?utf-8?B?aEVNblFCekk0NEs4c21PemI5T0NzWEdtcElYZTg4NUxkR2JiYWM1ejFvb1ZY?=
 =?utf-8?B?cDNrV3k4eSs5K095a2k5WXczTHJ2aVFrODV0eWpMckF4bkdmNWhJSEJKczlY?=
 =?utf-8?B?UFZubU1TcFhsbDZIV3ZobFFpd1NZM0lqQ2NXSEdwUE4waUtJMzl2ckl3V0lN?=
 =?utf-8?B?SDgvalRHV1pmSWI1RXdaUmt5Z0U3Q3NnMUNQSGFkRk5udjVaa1VZRFNsdk1v?=
 =?utf-8?B?bVMrdWZoRk5WQ0ZLSzI1aTBucytNNlF2c2J6MUFvTWk3MjNCU2pSQTZRU0t3?=
 =?utf-8?B?UnlsdnFnMmIranRsL0Y4RWVJTlZlNmFvcnRaZVJhOGFnVHJpVnlSV0F6aWNm?=
 =?utf-8?B?a0dLd1ZURTErNkJsQzcxYXBxNUdyMXdrOGtLUFZTMVEyR2cxMUd3THRhMkZy?=
 =?utf-8?B?Mmxpai9TSGxaUlJqZmg2ZldxSXQ2YUxOU25FTmFvNUVQdnpoSDllaGFOaDFF?=
 =?utf-8?B?eXlSOTRmRHY2eFJleFpJZW5LVWdTa2tPTDYvQkQyS1o0UTd0UWQ2aUFWVGx2?=
 =?utf-8?B?dnk1amp6UGFGbGxSU3cwOUtVWGxrZzZHMDVJSmVVMmJGU04xaGwyaDZIRlRY?=
 =?utf-8?B?YlhvZVlpQVdIUkZXbG1aYmpWU1J0eU1kR2Z5aDhCMFN0MEJBdER0RDAxUGdz?=
 =?utf-8?B?cmVVOThEUzN5ZmpBMmxScW1yRGRPNzQxa1JYbXFNZTlPOTlWdERMMk03OHY3?=
 =?utf-8?B?b3ozbHdpMEo4eWd5YmI5eHZXN2dabGp3UnhUbWl5MHZXYVZiNWxpTHlPRzd0?=
 =?utf-8?B?eDlKUzVINmM0cWVtbFlUc2NaRWVpZlhPR2JlOWVkUjdMWDF4ZDQ3Z3dmRGZn?=
 =?utf-8?B?eFNWemtIeXNFTVk0WFhBck9ZckFGRng2Nk9QNnFtci9QSmtlMU9nanQwQUxy?=
 =?utf-8?B?UEVucUxyNDU5R2IyaHlrRGlDVzVuaXhQM0FaMCtja1BlVlBIc2xtSEN5VUtO?=
 =?utf-8?B?SzZ6SjhpdVdENlV2UFh2ZmVmb0cwcjU1YzBFanJncFdzc1o5UGtPVTV2VnB3?=
 =?utf-8?B?dHlZOHhFeGhKNHFrOGdnTENsdGlzOVJiSk9tL2hJeEE4Y0pzOUNxY2tjbVV5?=
 =?utf-8?B?WjBRMi9Qc1N3dTkxT1Y0dmtQdGtYTk9UbzUxMDRKcVlRb0t6b0NTOFFnUk45?=
 =?utf-8?B?WExoWDIrSzFEckJuNTFOTDFzU3lScUE1cFg0RlVZcWhjaHdPVit0eHVsT3pK?=
 =?utf-8?B?ZGErTWJkUkdJeFMxQUpEVVdicWRJZ2UvOVc5SkFvZGY2ZlZDb2pVcW4wT1VB?=
 =?utf-8?B?TzBzK2pDOXhqYTYxQ2hZWFVXdWd1dEtoWEo2V0R5dCsxcXFXV1pTeFdrajlK?=
 =?utf-8?B?akloR2J4M3A2WXdaRmRyN3JSVXg4K3BoSlJvREc5eEZ6cW9STldjb0thT0Vn?=
 =?utf-8?B?b0s2RDJQckpFUTJUS0lrOFBUOEkwOXlPTnhrTXRKWDhNN3NqWlllOENURlFq?=
 =?utf-8?Q?I/n8yZyc0HpycuQHClzObswksBTPoZ+amBDY11YAEfBh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87960ba3-7cf9-4cff-7907-08ddbd153096
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 05:14:46.9196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VIax14uXcVHbt1ppyHZSr54jC5sfRUn1ZDebIVM5uTsJinW4YVCEOdeQz1Eo3+9M9hWq/7PCiKFFR7OqbMynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044

Hi Christian,

Thanks for this version! (and sorry for being late to come back to it) I
think it looks pretty good and  could adapt the nova-core code to use it
without any issue. A few comments inline:

On Tue Jun 24, 2025 at 1:28 PM JST, Christian S. Lima wrote:
> The two methods added take a slice of bytes and return those bytes in a
> specific type. These methods are useful when we need to transform the
> stream of bytes into specific type.
>
> The `FromBytesSized` trait was added to make it easier to implement other
> user defined types within the codebase. With the current implementation,
> there's no way to interact without implementing `from_bytes` and
> `from_mut_bytes`for every new type, and this would end up generating a lo=
t
> of duplicate code. By using FromBytesSized as a proxy trait, we can avoid
> this without generating a direct dependecy. If necessary, the user can

nit: s/dependecy/dependency.

<snip>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 1c7d43771a37..832c65a1239c 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -9,27 +9,115 @@
>  ///
>  /// It's okay for the type to have padding, as initializing those bytes =
has no effect.
>  ///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::transmute::FromBytes;
> +///
> +/// let foo =3D [1, 2, 3, 4];
> +///
> +/// let result =3D u32::from_bytes(&foo)?;
> +///
> +/// #[cfg(target_endian =3D "little")]
> +/// assert_eq!(*result, 0x4030201);
> +///
> +/// #[cfg(target_endian =3D "big")]
> +/// assert_eq!(*result, 0x1020304);
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

Let's elaborate on when it is "possible", i.e. the reference is properly
aligned, and the size of the slice is equal to that of `T`. Let's also
clarify that `None` is returned in other cases.

> +    fn from_bytes(bytes: &[u8]) -> Option<&Self>;
> +
> +    /// Converts a mutable slice of bytes to a reference to `Self` when =
possible.

Same here.

> +    fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>

`from_bytes_mut` sounds like a more idiomatic name for this method.

> +    where
> +        Self: AsBytes;
> +}

Note that `samples/rust/rust_dma.rs` will fail to compile due to this
change - you must make it derive `FromBytesSized` instead. There may be
other implementors of `FromBytes` so please make sure to track and
update them to avoid breaking the build.

nova-next also adds new implementations of `FromBytes`, and since they
are not in mainline yet this will make it harder to adapt them... I see
two possible solutions if we want this for the next cycle:

- Take this patch into nova-next and update `FromBytes` implementations
  in lockstep,
- Add temporary default implementations for `from_bytes` and
  `from_mut_bytes` that simply return `None` so current implementors
  keep building.

> =20
> -macro_rules! impl_frombytes {
> +/// Just a proxy trait for FromBytes, if you need an implementation for =
your type use this instead.

Let's explain the reason for having this type (provide an
auto-implementation of `FromBytes`'s methods for all sized types),
otherwise it may be confusing.

> +///
> +/// # Safety
> +///
> +/// All bit-patterns must be valid for this type. This type must not hav=
e interior mutability.
> +pub unsafe trait FromBytesSized: Sized {}
> +
> +macro_rules! impl_frombytessized {
>      ($($({$($generics:tt)*})? $t:ty, )*) =3D> {
>          // SAFETY: Safety comments written in the macro invocation.
> -        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
> +        $(unsafe impl$($($generics)*)? FromBytesSized for $t {})*
>      };
>  }
> =20
> -impl_frombytes! {
> +impl_frombytessized! {
>      // SAFETY: All bit patterns are acceptable values of the types below=
.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> =20
>      // SAFETY: If all bit patterns are acceptable for individual values =
in an array, then all bit
>      // patterns are also acceptable for arrays of that type.
> -    {<T: FromBytes>} [T],
> -    {<T: FromBytes, const N: usize>} [T; N],
> +    {<T: FromBytesSized, const N: usize>} [T; N],
> +}
> +
> +// SAFETY: All bit patterns are acceptable values of the types and in ar=
ray case if all bit patterns

SAFETY: The `FromBytesSized` implementation guarantees that all bit
patterns ...

> +// are acceptable for individual values in an array, then all bit patter=
ns are also acceptable
> +// for arrays of that type.

I don't think this implementation takes care of arrays?

