Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB1212B2F;
	Fri, 30 May 2025 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615650; cv=fail; b=eQPgz+vu0VyLdZ85VCXAdjd5be+g4CEWIsR3TnyqD+HpJs8gquSSalYK2xQ9wGF7R//hg6VAScrVB+mPoV0veSxj5auEqniSjTZ3yLobuPdUehWcKz/9l+2sWH6Nfi0cWa+MzmKLSaRM/EV4naD2RHr9SVy4Y1plI1hSYpQ1wR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615650; c=relaxed/simple;
	bh=sdS+cgcLPObodTAwDK5ZQBqmaxL1M0uEErnF0bOkIDc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=euBpSO7fosQ54je96eKTWNEjI0YF/dQ0c8Rg9T3euDzO1TrzwwCtr8EHDadE41eyQRZvqFwj0hVwhxhyORr2IPdMVwBxAr2+7Rq16cag2MZJff/IMA4rVdsQvL3gEoqwO1B+AkoIZpsl+13vhB0kjWPE/p30utldn/iPr478IdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GdqYnG2B; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GdqYnG2B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtVNBsmSbqmokmtlYDHSYqv2vHqyrRjWEtpZiQ0iHcfLVSe/9y2tTb+eMpyePFG3ODWCcHVRLSj/rOi8xGE9EG/l3a31ZbdBu9I6FaMv8bMR93r4bSYUmtHEyObj48d9nxtmk+z7dgy+wwXKeu3u+/cscs2rsMjCNmhJu4zYf6ZhEywyzzgYo53C2V2P1YyhSn0znkfLEpC4GYWZ7mNSPyXh33wWIxqwTcVaHj55CTCtlJxMbWgwASvZEcfQ7f5X62TTKVAq/Z/PiDqjgYjX26363cuewbXGDoL1uYoxa7brVZdfMSxo3ysWHE8dC4PlH3nhxYMFrq8tElZOrQlT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kODLLcToKCOvnGzp7tlVwnJ+dLd7x30BtxVjBzlwnEA=;
 b=qwDfHCp1Gu/qsR7C49pUcIij0CA+XFksfB3PfV00KLYcdgj6FwE1IDaNtUkg5sa93TYUhQDcjvShgl+KRhEeLJFgYH9ypIgbHf6NOU9ltZgnqrVQTeY+VfYJwgfDUKZJWEXd0IkjPr2YYC8LoDyejA6N6EQvfpVedPF+xLv0dI7Zl5E+CzASRMDWVfakT8uA3SsiCxzIOFr0+pM/q+Lsrg90YI2tSGVkOy1RHZs+aDIHx6LlqMlV7PI1/vacrB/3YLHWYDA5E0elO2vFN9sTbTW7NUoXpJYj+SMH9IaX9+Cy4U9OqYR4mONX5iiOLF3epaUCBnQ8OsJ6gB73iQPVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kODLLcToKCOvnGzp7tlVwnJ+dLd7x30BtxVjBzlwnEA=;
 b=GdqYnG2Bvn+4+FHw1/IHKdpd1/bwF5HT1KkHNnMlknxKU5ivA6fZAi6Kn3nbCksEWJukV+nWaqKuDd0PTclJq81/0enuxoSN0S0e9dJy0kohMs2E4snqsDnGCb+GSrOD1kctOGMWsnnCmJNSDQGJRa35hFtuGfIPxbtcYP0DzkL+GOG/hzAD7ZckWq7sUNueLz1Tsi2HMThh/FtpLCuqel8hlDfpyLxGkLOw9kGoGfpfJNfqkxN4Qw4Ghmk0aiY0ZuMy1SYCCG9pFrbfWJ4IFShReTqyjfuBCoZDMJ2ROwaeBBp3yX9qJlds87udr97WRYFbngx1kXs9EC5ZnOpt+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8548.namprd12.prod.outlook.com (2603:10b6:610:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 30 May
 2025 14:34:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 14:34:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 23:34:02 +0900
Message-Id: <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <timur@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
 <aCc_PSOPkLWTcTru@pollux> <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
In-Reply-To: <2025053050-maggot-landfall-d5eb@gregkh>
X-ClientProxiedBy: TYAPR01CA0238.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::34) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: d730726f-424d-424f-2553-08dd9f8707b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGRhVFd4dWczVS9CdlJqN09kTGtOc0s5N3NZdTRBWmt2by9XSGJtWG14bHd4?=
 =?utf-8?B?SWM2TVMrZFFPaWhFUC8xcHZmOGcxWHFwL0ZTU1lsK0VmeUFTL2R5ZVdxcjlk?=
 =?utf-8?B?M1cyQ21wTFRNNzdJREtEWEgrZWJHWEh2OTYxV29STXBRdXF4bUhFOTVvbjA1?=
 =?utf-8?B?eUVrNTlrL3h6NklMZjRpdWFHQ0k3aEZsRFNXQXRBaGtIZzNEbzVVcE1tVUxR?=
 =?utf-8?B?bUNVbmxsYmVNcXFNTzFnYld0MitqN2FzMG9kdkw1S0tYdnJtK0lPWjVvT0Q4?=
 =?utf-8?B?M0thQ3d1bndlUXFpTVNSVkJ3Z0hYNWhTZGgzMnFLTVJGbldyNis0akR4QzdH?=
 =?utf-8?B?UEN5VnJVeUpWNjVNN2hBNHZQcXBjODhmS2RQK3A4UkRnMXp6cEZQcFdxdjZu?=
 =?utf-8?B?M2lMOVlXYmZabSsyNXQ3YktmQmEvZkNkQkwvWUZFOGRLaUpHaHZpYXZuUWZL?=
 =?utf-8?B?N0VnRHdycUJONEc2djJHZy9IWnNOVGFQa3l6USthZjJqaVpoak9FYXdmbVlO?=
 =?utf-8?B?R0JCamcxNTlVdlpzdHJ4TjF1citvZm5Hdk0wUUVIS0NiOUU4SUZKeTRCVlcw?=
 =?utf-8?B?KzRXS242bXVVUjBoOXZ0elBjYkVQZmlNZTlzNHVISSt0NVlTa1ljcG9aRk9N?=
 =?utf-8?B?bUpPd1pqaFkwVHVzN1FvRjBvaEluemZMRDdEem9PdWpQNDlHVUtKWjJuU1FR?=
 =?utf-8?B?RWFpaFUxY2dXZUtBMjlyTVFEZlhsQmV0dzdRdGxkaU9JTzdiYXNDNFJzczZT?=
 =?utf-8?B?cnZIZm9iNmxFVVN0VGVINTNZMVptMU9HM1Q1d2tZNGQ3c2RERXVsMHZ3ZC81?=
 =?utf-8?B?NjBkVk5kMTBpalRWRnFrNHUvM2dlQ0RHc256Sy9UM0NCeHQvaFhLNUhaTGhB?=
 =?utf-8?B?Wnh5Vi9PNmRWMUE2bzVRRlhOcmdxeVVoZmJ0ZkxOcUNPUTI2NCtMV2s2Mk82?=
 =?utf-8?B?V2o3MmUyQ2xkdHdvMWFKMHFXeStxM1g2cUlBcDZHcGc2VGhkVm1LQ1J0YmdO?=
 =?utf-8?B?V0ZtMldYOVdsVXYzdEJGVWthS3drYjNTOTF2N2hSRXVySXVkdE4wNTBHcFYr?=
 =?utf-8?B?VlJVNHdQNnphdVpyckRVdlhOZ1pJNkxnbU5OWkdpUkFneGpiNFU1YWRoM3o0?=
 =?utf-8?B?TWE0Qy8vMkNHbVhmMFJOMDhydHhDTkQ0cEM4cEFBcmQrcmlxOHBJaUxQQ2pN?=
 =?utf-8?B?aFVYMVdIWlJJUTc4OEJOZmptc2MxN3o2cHdHR1VSTEZjaU0xdml1WnpmSTEv?=
 =?utf-8?B?OUY2ejdBMkE5NG5oandxMytWZGwzMWlhMFVsUitwSFpYcU80OGQ4eEREL1h5?=
 =?utf-8?B?SWRqT0Q0YWR4OE13ZVI2QTZmWm9QOHV6Uk1IV1JuQitUdW9pYUpPcTJhK1A2?=
 =?utf-8?B?WTVsVUVTa3JqZE52MDRyallMUXozcUdRaDBpVFNwdnVDcytGTnVEUFU2YndD?=
 =?utf-8?B?QTg3a3kyU1kwdmJYS1RGQXR0bFU1SlRTNmpUc1Nndjk5Y0lBYy9RdmNGUmd5?=
 =?utf-8?B?b3dxZlVGbDgvSnprdEpvUzhlSzFuVlFEWDhZQXRBMnpGVjBkV05GTzRUZ2J2?=
 =?utf-8?B?TTkvMFJ3M3NBV3V1Vmh1ME14d0VPM1FocjBRSHpkbU5LWUJwbzRZNnlSTS9u?=
 =?utf-8?B?K01FdnBJZW5mNExlSkZ0NTZqY25GV0h2T3BCTTZzMnVjK0FVeWxHUHBFcXJC?=
 =?utf-8?B?L3JINjcvYlBpMU45WUh0OFdDY2FnZFREeHVtc0xhTVlnQnlOVHBWd0xTWmZy?=
 =?utf-8?B?ajNrVDNSR2JRWEtOdkwrMk5iaUZCejQybXlRS0NUR2twSHZvYkkxT1gvUWI0?=
 =?utf-8?B?RUI4TzdYQXlMRk5aR3dkVnE3NVY3NG4yMEJmUFkwZjVQd1R6T1RtWWhIc1FU?=
 =?utf-8?B?cUh5YVEydFdqTmd6UklJMnJ3VUMrQ3RzODBidXlIemlqSG5tclZzSE55dnFN?=
 =?utf-8?Q?c8E3hQvyRxg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eExhNzFGQVhBVFI5elRsV3FqK3hqZGtlb3ZzdWpqa1gzZ1VEN3E5alRFSWN3?=
 =?utf-8?B?alpGS2VwNEp0ZUVaZnNEdklKTDJiS2ZLY3Qwd1F1UzliY1FUQUZxMGd3MzZF?=
 =?utf-8?B?WTlrRktUMXBwb295aER3WnBtSno1WmpzNTZYN1JlWmJYemdsc04rQkd0bktF?=
 =?utf-8?B?OVFIWE9BQ3JxeVpNVEwreVVVZzIrcEFzQ0dDUHRaNkpWZ2QvcXhrOERqSzBD?=
 =?utf-8?B?TE5qRzBXMkFHcDZKSGhlcjduSW1BVHdjK2V6b1pIZDdkbVRHM0hWZ1JHakVR?=
 =?utf-8?B?cVd4bElBZTlGMDk5bHlxTzgrQVo5Qm5POWxhWDIwNDdhTUVOakxxRitSQTNE?=
 =?utf-8?B?TkMyOC9YMWRWOEFtY3UzOTFVWi92eVBhd28rRlVUbE0xZDAyVHpyYUErOUtU?=
 =?utf-8?B?MmlXYU5rcE0xQk85R1NvRURPWERyNjQrd3FnbWV2cVFjQlJKMzhNOUI2RVZv?=
 =?utf-8?B?MzljT2JTaGVndUpXdWdTV1I2VFdkTWszZml5V1luVSsyWXFSc3JoWEYyMVRk?=
 =?utf-8?B?SEl6Y0psS3dnNS9aamloa2FLOVNFQ2J5c1BjVGEyWStsc09XbXlBakh0Yk9j?=
 =?utf-8?B?aVlwTWg2eWhwRnBPYVRNQWtNbGhrM2N6RmRMSVNLQ0RhOVZRVU9lQ1dQTE5t?=
 =?utf-8?B?N2xZQ3pHT0JDMGEzcmJ1QTNIZ0F1UTByaXJoTEpxbjJleG1mVFpBcEtXN2FR?=
 =?utf-8?B?bU5OdWdkMm5GNWo5dkhZREtqbm9jbkQzYVFCS3NqejhmaUpld0lhVXdnOFdh?=
 =?utf-8?B?NlM4S0tMSHk4TFM4blNrWHRubXV1ZWl4a3l4RXhsTjhUdFI2ZnNRalVYQy9D?=
 =?utf-8?B?bng1ZW1xRnZoNzhxdUczbmZGWVlzMDZUc0ZROGNadXVLZWlOdytiNGE1NW52?=
 =?utf-8?B?WU1haVZlUVhremtiZXFMMm9qSHZ4WU1mTkVBSnp4Y3NwcWpBenF0Y0lEWTly?=
 =?utf-8?B?LzlnaDJXczR3dHV6QjdzWTUwVUViVCtzL29oUzZMUGliRjFhbVZHZTVpUTls?=
 =?utf-8?B?NkYxVm1IRnRheUxCTldNei9NM2dmU0lEbHZEaHNKK0VOdUJPdHp5R0Jibkd5?=
 =?utf-8?B?R2hrUkxSWklrbVNCNGNrNkRScGdmS2hXTEZJUmV0SWFRWWFXQkVmeWFUTG9s?=
 =?utf-8?B?M0pud0NXcTBJejJvRTdCTUVhNnlSbmNEeVZsQisxMmZKRWhnMzNabVZ1enZZ?=
 =?utf-8?B?WlRtNXI2aUhUMDd6bjNKRUt5eTB0RDFXNGcxWU84K2UrVk41aCt3L3hqV1VS?=
 =?utf-8?B?QU12aDJTcFpUSG92ajBieXNtcUVWMk9qc29RaURHbE1GdzdmZjFrR0MxRXNx?=
 =?utf-8?B?UEZyZ1Biak1lUlZTbGpXTmllbys4NjA5bW0vTzRpZFFLMTVBZkpnRExZcHhE?=
 =?utf-8?B?aVRmZ2NNaEk5L2pjbjMyKzJaZHJ3UkZBRm0wY0dvcWp0VkpLa3BjZTd6Ni9v?=
 =?utf-8?B?cGZuWkUwTVZWVk1LZE16MjFLYVV0UzlUNThqYkZEOUJQWnBXdjY2SytKOVRQ?=
 =?utf-8?B?WnBQZGZnZzdKZ1FyRkJwNk11K2pEK2JuK0VYTEd0V2IySm1pbDgxVU9RK3hu?=
 =?utf-8?B?emhCUmcyTVNWZmhjN0c2amxNQnZMOTJYYTlCQkU2V21rZlFSUXVGamlzVVIv?=
 =?utf-8?B?M1FjWGN4aDRZY3hKUDdyUUtEUXJDYWRWYkpqY3g5WDNUaE9IajhhU1R5YUdq?=
 =?utf-8?B?eVJZeTBqVFZ0elMzK09hd3R0d2lOT0VkenBSd3FsVFNRWlVyeGc2TXhWNFZ4?=
 =?utf-8?B?cEhtRFAzMS9jcG9LclRpM1VCMXp4aStUdmpldDhWTkJ5WTdiZmdxOGVOOC90?=
 =?utf-8?B?ejF0Z3FETVhxY1NUaEZmMTk1aW42eHcxMUFHUm50aFRxZmdRSzNlNkM1RWNZ?=
 =?utf-8?B?N2M2MWtiQW5BalNQN0I3elFjSDM4RFF2N3VPRXFjTVJXcXJXdXVPRGh0aFlP?=
 =?utf-8?B?dkdmUmVHdVlnMUxMN2l1aFp0aTlYdlBhbXRWS0lvV3RJWmZabDcwT2ZDMStl?=
 =?utf-8?B?cm0ySFN6eW1paTdCazlkZ21nSXpaUTVoejNoeG9pQ0hXd1orZzdBcFArUmxs?=
 =?utf-8?B?SjkrTFlqd1lYK0dMVTMvT2cyRmFXYTUwTFVGR3gxYnEzc3BzellWV1c1TDd5?=
 =?utf-8?B?cVBwc3lCY1Fjb0tuRUoxbVd5cmRPakxhdU14OFdsTjVhNTliNkg5VWhZNUwx?=
 =?utf-8?Q?7JmwnXja59c2wQOay1HiAepisXu1mNmi6iopg8C4ZFkD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d730726f-424d-424f-2553-08dd9f8707b4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 14:34:05.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1T5J3ALMB6xUMDWkRFDwck8MWaDDqbXyytjfOs32OcST6Y8iAvGdExyB5ehH7DiQGKpRCIa+gQ8XSD+bT/P+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548

On Fri May 30, 2025 at 6:01 PM JST, Greg KH wrote:
> On Fri, May 30, 2025 at 03:59:03PM +0900, Alexandre Courbot wrote:
>> On Fri May 30, 2025 at 3:22 PM JST, Greg KH wrote:
>> > On Fri, May 30, 2025 at 09:58:02AM +0900, Alexandre Courbot wrote:
>> >> However, Nova also supports a couple of older chip generations that u=
se
>> >> the same GSP firmware -  it is for these that the ELF unpacking must
>> >> occur in the kernel. IIUC this has to do with the capabilities of the
>> >> microcontroller that ultimately does the loading (more capable RISC-V=
 on
>> >> Hopper+ vs. older and more limited Falcon).
>> >
>> > Why specifically does the kernel have to get involved here?  What
>> > requires it to do it that userspace can not?
>>=20
>> I don't know of a user-space tool that is readily available and could
>> perform such extraction of the ELF content upon kernel request. Is there
>> anything like this?
>
> libelf provides you with the needed tools for this.
>
> And you didn't answer my question.

Yes, extracting a section of an ELF file is as trivial as calling
objcopy, no issue with that.

What I don't understand is, who calls objcopy to do that in the first
place, when, and how is the extracted section passed to the kernel?
After digging a bit I found out about CONFIG_FW_LOADER_USER_HELPER which
looks like it could help, but that option is disabled even on my Arch
stock kernel.

But even assuming it was readily available, how to use it is not clear
to me and I could not find a single actual example. I assumed a udev
rule could catch the uevent and call a script that extracts the section
and load it through the sysfs loading interface, but
fallback-mechanisms.rst mentions that "...however firmware loading
support was removed from udev as of systemd commit be2ea723b1d0". Which
makes this idea look like a dead-end.

So to try to answer your question, I am not disagreeing that userspace
is capable of doing what we currently do in the kernel. My follow-up
questions to that are: how do we command userspace to do that work for
us when we request the firmware, how do we provide the result to the
kernel, and is this something that distros can adopt easily? I'm happy
to consider doing things this way, but would need a few pointers to look
into.
