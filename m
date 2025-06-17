Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC8C2FB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750127473; cv=fail; b=CGoAZcyYrGJShQDmg+h5vncA8sTYevBT7HhVRkh44IwaqcvXslwin1kYeZV1RFLPEsUEO3rKdRdcvYBEiLQ5hB5rnkiOGS9wPU1oib4oVN7bSvHCljYt8PFcRs3ErszvAlo4esm1Wc7ay654eu0xXTFT2yz0LFq4TTXXSIJFfLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750127473; c=relaxed/simple;
	bh=8cru+1IN6Pg/BeEwYX6dYxapqZ1NCDluk4P0bA8pDkU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fxf/p84RdksGaFsGx3TwTOJAbRI98ZFEIJarWi5BjeAFeS4aZIzYhx2UM44rAt4WwyWK5WIPlQ8xyXYKlLkj7pdqGxFCPgLarDqYZPslJeKOMbzC6HT7BF0RxeuXcD+EdA7Az/DmlqOMKobgYSCRisq2giwTLHXOYZZX0X38KSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qYHWnpB5; arc=fail smtp.client-ip=40.107.102.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qYHWnpB5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGCodzNYcuK3u+rz7pPxeZS3ERehhYcgYftFMxpma/zyYZH+G5dz7DVb5sKdwzBkuua3Xj92Rz/HEd5yGb0IPjSTAp5ECzEVJW4WAr3T8kiVAmumKef4u+uixqir07zo1Mpno9WCgkPeluB5/HLynklGtA9f+jttrUDsosv82rZwHKV6oiso1I6qi9C1Um8zvknpTTo0e1ADebE2xAjI1NCUgR9uPi1gG2MoF7WlFPQ0IqbrIC4qdUX9WsldMROVaL/yX/AEHZEZViYboPiTtsibQoRNvsoT2LZM0lZUNfhBXX1EAQphgtwanDlRiQtsrHVzK5Wk0nmEAqKhjlSDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSHNnn28xwQD/XFNBdoGtrPGh36SmuaCLYL26yle5wE=;
 b=gUBpInK+y+mIyp67pZNWZCPqL7/ooNc1Qc3m3nTNH3bglsNTS3ue+zmOcujrLR2OO1oFBlDVjqbeCBBUVkQscIBhNGy1+1K1m0e8OqVMZzJwBF5E+o0A6fmk2bJjGl1Xf76gQtSdxYl2ek2hhNKdonM/lEClwfSQQwHPk6ROn2ep06C0exgFHis3r9FbIyqChZLBo7Hp42EBf+XeJyyIZ8K1mMTX36qU6AQQe+5yJKHxJwH2PmNGcmsNhz9n+ZJbKVvnNmM+mTeCEQSXRW6qAGCoNMFubhj/NWZSxh89LC1t/6VBTUGbME62XbZ8v8MCFPWcPrxD3wC3UCWItNj4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSHNnn28xwQD/XFNBdoGtrPGh36SmuaCLYL26yle5wE=;
 b=qYHWnpB5FM1DAb+Zd6Ai3vA6ykV1h+HVtgEYkpwyvTfMCIFtWYNNsWZnSyekKHspiN2r02dOILF2Avxwqcn95F9hXyvuKUQd9qOxy4U+363+rjKHcXQfJNGIwBbhW4fnAXHhtICG9d9Xc/Z9unT+ZmX7vRrDADaR1OuP2WiRYFZomC1PkFE2QEBxs4SGL3SqkDwEzcVziohIDlRDq0D8eaZ6hJmN9dDfsYhd+6vhOTOS1dM9rBC9+tZeDHs0sJ5QGGRqSrgCrlncD6pOgKQTRnvUfh50gKYEfBv0WLMmCd4OJq2kr6qL0AH270L6PasTZLYhfVShLKRo2KmenqxiUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.30; Tue, 17 Jun 2025 02:31:08 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:31:08 +0000
Message-ID: <72fe8b97-6bbb-4744-ae14-a4ecdf74e573@nvidia.com>
Date: Mon, 16 Jun 2025 19:31:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add missing test files to mm gup section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250616200844.560225-1-lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250616200844.560225-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: d4eda041-101a-48e0-d520-08ddad4703fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHIvT3FmUklsU3d3OURGcGQ0YjlmQXZ0OXB0aDZtTEI3ajBieHc3OERuOVZu?=
 =?utf-8?B?eHlpVkhvNlRvc1BkQ09UN0NaWXkwMkJnNkV5cmtlTlZXa1lFVlVZVU5taWFl?=
 =?utf-8?B?Y0tNL1phZmtma2Jic1dTZVp2YU5FRTZjcUxrTmVRRE9FT2x6MitBNFczZGJP?=
 =?utf-8?B?ZXpoRXBCTDEvQjVjOE9ld1ZORXdZeE82QnZTNGJ0eTgremhlbHZISXVNcmtz?=
 =?utf-8?B?bUdqRWNXZHpGaWFYQUY2L0NyLzFxSGNuRXZpY3FKajdwQU5xSUVjUlFpQjVO?=
 =?utf-8?B?Vm00YzFGbmF2M1l2am5JcnNlM1ViVWFObTRybmJUT0d0MVQzamEweGdUZDdv?=
 =?utf-8?B?MXh2djRmbDBBQW5udnluRnVjZmk4RUxaZWZ5Wm9pVTllRHp3K0ZuZTY5SEhh?=
 =?utf-8?B?UFJaRE41Vzl1cTZFTHBoVWVuelI1MS9VRzNzYmZJYjZvb2lsOUxOWXZhU0t3?=
 =?utf-8?B?ekJBZE5lTnBnZE9VNWFia2F6THZPQ0RZaE42eU1oZHR3OThNL3BQcFZyaGhN?=
 =?utf-8?B?OURpbnV0U29aNEJzOGFMOHRCWWlpdCt3TDdNZ0pCWDRFa0J4VmN4Zkpkc0V5?=
 =?utf-8?B?ZmZaK3BmMU5jbmpMY25hKzNvRDRuRUZCOXZPWFFRNlRmZFZGcUxJQ2V2OXg4?=
 =?utf-8?B?YmFWaFpEbUN4YXZmVjEwcFFWUThONlFHdDBOZUg2cFBvQVVKTlhaRy9DaTA1?=
 =?utf-8?B?TXZWdmpWRmRzNDRZeGVsZU1SRWpGZUljZGJnNUZmWEJQVk02NEtzWmVNRkhU?=
 =?utf-8?B?QVFZOHpOVWoycFk5ZUY4NHNjQkpWTFhMOGhlTW9idEwxNFN5T0l1enhpTUNn?=
 =?utf-8?B?ZDdwYWhkQ3ZNM2dwZnE3Z3JiWXdLZ0QrU0RybEFyc2lTRTVKNkNlVXVxZHU3?=
 =?utf-8?B?K0tCQzE0UVlUdzdCVnM4aWxMZmlCNDJjNy9YUjhPT2puU1ZzaDJlNlN4cXY2?=
 =?utf-8?B?aXdRcXFvMzVUTXYrWWROOVIybDdjV01sdTFTMUl4Rnh0bVJhZGQ5TnJXV1VB?=
 =?utf-8?B?TlpxV2g2eE0rQmxBQURUaG0zdGxodE9oU3R1WkdsWEdydFNUendFRkZqTTht?=
 =?utf-8?B?bjNUQlk4N1RjQlE5TG5UczltSmZBSzh6NktaSjhxcHV6TG00YmdKTm1uVDZX?=
 =?utf-8?B?Smp5NTJJTzVsS2VqWGdJOTBGbVlYQWdtSm95dmQ1b3Ava2djVlBwTk9ONG9C?=
 =?utf-8?B?VUdzUmFxaSthaHU4Y2Jpc1gxYmpzZlVhR3hUNWwwRkZETWRNUEVPNDM4Rk5p?=
 =?utf-8?B?TE9LczY5WlRJenNIdjhTSnEzNTFkbmdBbTZuRnNDMVF0SXZoSkRoYlViakVl?=
 =?utf-8?B?S1RqWW0zU1l2MUFZdXIyVXlIamxxczArNTMvbzcvQzhuMFYxUk44M1lqNjY3?=
 =?utf-8?B?MlFOb0pFc2hHOVNldFZQM29pY0ZGSVJIWTNOUmtiRkpSeFVKWFcvL1ByU3Vk?=
 =?utf-8?B?Vko0OTRxdDFHcjI3bzBpQ3hNbHFUUllEb1Zqdk1MSE9OdE9NSktCY3RHNjA4?=
 =?utf-8?B?c25wSFdTbmlzSjVRWlB5cEtoN0RJT0hWRU5ocnNvWlJXV0trWVp0YUZBdzdR?=
 =?utf-8?B?akxjdDBQVTYxcTZkMjNVU0lpRDdRMzBFdHROdU1NYjBSc3NBZmVLcWxvM2E4?=
 =?utf-8?B?ckt5STdYRjBxSkpnWXVxbFZVTFRqNDcxYWJXK2NWdC9VVGY2UThpYmtndDJS?=
 =?utf-8?B?VTNid0J1S0grS3JJdkdhaXNqL2NOODc0dnNXc1ZaQm42QS9LMDdEbU02U1c1?=
 =?utf-8?B?eFp3ZzBhOW9rbW1BK01VZUxoTHJoVWI2ZFI3WlozTW1kcGhmSk5oZVdHYk8x?=
 =?utf-8?B?VE1ZMmRFalA1Um5NZlBxajdYdlM4aThhRDJqWGRZTHhtZ0pPSTVvQzJKN3Nq?=
 =?utf-8?B?ZEtWR0JoY0g2cGEvTlN6Tlg4QkdGM0ZQa202VkJxWGg1enRIdDNnQzRDdzlU?=
 =?utf-8?Q?VbQDSwhhxog=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aExmZ2RqUWZhTkpJUG1CV21jR2JEQVg0UU5QU0JNWXZwMzYwTzRoeU9vZVY2?=
 =?utf-8?B?N1kwd3ZEbklTRUIzdDhicnVLWlBGREZ6cnZVL0tmNm9hVWdrOWJUTmF3TGcx?=
 =?utf-8?B?QWE5czFlNnBkeG9uODBGcmh3TjVva1VmdWNBZWdOYVdPRlVlV2FuN1l1aGxs?=
 =?utf-8?B?VWpCdG5TUUIxREcwR2ZiSnhlSGtsTk4ya1Jqc3U0NUhLT21VejB3dlFWU1FY?=
 =?utf-8?B?MVJkRE9QQ0JIYUNJanlTajlJaWFZdFJzZUxibmQ2UTFQQkcvV21IL0Rsa1h4?=
 =?utf-8?B?Z0tTYU9JNTRuQm1ENGZlZm42TUdRc3U3V2Y0YjhId28xNkZUbG9MYlI0TXBZ?=
 =?utf-8?B?VVhxY0p0Qm5zbFdtaVNYbndKR21BR21JUjQ2K3JwcC9kMnVrbGJqWkd2R0po?=
 =?utf-8?B?dUF3UzVQQ2hEbjh0VzV2MW1iY1FNY29SaU9GNkdYd1gxbG1saUVsdmZJT2FM?=
 =?utf-8?B?Ty9sYWlqR3h4dk53dU9DVWtseEIrdWdTK0Z4WFI3S2hlQVdRMU1pQ3R3SVEw?=
 =?utf-8?B?TUhVN1Fmbmx5eDloUEN0cDlkR0dwQ2tUM2VMZ25PZ2FvYzB0NTQ1M0JFTEht?=
 =?utf-8?B?b3VCdjBsMEdONmpOWTlrRUVLM3JRVUQ4YUNvakVvVU5DSno0ajM3WUNQbGM2?=
 =?utf-8?B?Szh6Mm1UTm84MUtJdzFyUzRud2pQZDBhRnBFWDlCMzhuTGY5cGFtNkhnQjg5?=
 =?utf-8?B?MENVY0FIVSs3b3ZvVW56TS9DdWkvWHJTS2JXcG9TSWNEU2tMdi9lMGpHcHg5?=
 =?utf-8?B?bmZ1ajEzR3Z0UFREeFphQlNnV2pPbVFRRVhJVUExcjFNb0crU0NLWEdLTkJ2?=
 =?utf-8?B?QzdCaU13MktwVHlWeStOTlBuMWhTdnkwcjRkc0h6c0dQTXd6OVRvMTlVbkU1?=
 =?utf-8?B?M1BrS1VrMzVURTRRUUxwUFdaMFpEVVYyUTIxM2lYOElJdXAyTW1hSHNrNmVy?=
 =?utf-8?B?QXNDYmVNb0FmcHI4V0oyK0FOSlMyRC9seSt6Z2tIeGVSUWJKUmF4ck44bTRx?=
 =?utf-8?B?M0dyREF3bkdyU3FoTS9EdkJPN2Jwa3gvcWtQRHRYd2RQamk0RUFXamhWWHhB?=
 =?utf-8?B?M1lWWWszOVpOOExNbWZCZ3ZtcDJBUWplbHpGL09vZ3A3ZmtOdHFCdDZvaERm?=
 =?utf-8?B?RVpnb1VudG1POGZmVVhzdkpyekZnbHEzaDFNejVXb3gzTGFYMDlFOHBWckZz?=
 =?utf-8?B?LzlXcGp5am02TGlDa1JyRG5tc3ovdC9IbWpjY0xTL3lGWHg1eTFOaFd1NXNC?=
 =?utf-8?B?OVNUZW9oZEJzNDNQS1h4ZUJzQnJsN2JlY01iTHAzaXZxZFdUV0V0ZDJKRm1V?=
 =?utf-8?B?ZktvSWxNNmpvaVQ5WEcwVFRsOXVRUmlUMEUyellDSE9UNEx6b2VFeXBtMndw?=
 =?utf-8?B?d3dkWldRaC80Q3hVeEZZWUZ2M0xXbmpXbHcvQjZLSjVvb0JSNVhJRjNjTlJJ?=
 =?utf-8?B?Z2NVK0V3Y2hkWnlLRjA0NGtXMGhQNFd5MDJGTnF5ZFQyWjRXbVl2MFY3Skhw?=
 =?utf-8?B?dVhNZWc1R09pUS9SZk96V1g2VWJTNlVjUHM0Zm9EVU9rRWN0bStKZWRmTWVX?=
 =?utf-8?B?a0kwYzZWRlFzTGNTQ1RFbjBMMW5EVDAvZ2JmZ2pURTB6aGUvdHFMa081Z1Bw?=
 =?utf-8?B?YnY4TDNuaGFCNXZwc2syNXB0eEY2TE9qS1FvQ2tRVTFYSHVzZ0liYy9Ib2pu?=
 =?utf-8?B?VjFGRGM2VXRuQXlCYVdoSFp3a2ZXU0F6VVhFZVl6Tkg0QUFGdXNVdTJLV3Zm?=
 =?utf-8?B?enlOZ0J2UXJyQWxuSVpSWk1tN0Q3Yk9lQlNXYmdIdGFqbWlLcElpSUNZV1M5?=
 =?utf-8?B?eEVzV090c1o4UjgyOTl6akdUNTVZUUNWNUlUYndXSEtnbDI0TGQySVY3SHhY?=
 =?utf-8?B?MElzZUxHc1JGa0Y5ZTBuYnFpR3lLeURiOXdHVHM3Qm5SWDZWalNWdVdpSDBJ?=
 =?utf-8?B?N1VrRlJYVDR4QXRWdWo5dldzT1R3bUZ3Skdrc0R0NmFGd2JTWlM4ZVZ4TW0w?=
 =?utf-8?B?U3BZS2NNTG4xa0dINHBwWGg2SWdVSTh4SFhVVm9sTXVxU05Yc3V4N1A5czlr?=
 =?utf-8?B?eEk2Q1RneExjMkZFdllyU1QrdmkrVHlkSjY4WCt0U2NoYTJjVDQ5RVg0NTl5?=
 =?utf-8?Q?wiEQr5Sf0t+prVhRPOz4alfYP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4eda041-101a-48e0-d520-08ddad4703fa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:31:07.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HY+IpLVHarlkMdFE4r93sfP7icowrqa1JmRipmlNlC+dHs4W2g1J1SOiexhrtY6BkLkfy+d+eYZNq16OAywkmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285

On 6/16/25 1:08 PM, Lorenzo Stoakes wrote:
> We previously overlooked GUP test files that sensibly should belong to the
> GUP section, include them now.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4523a6409186..96407b87d1aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15795,6 +15795,10 @@ S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> +F:	mm/gup_test.c
> +F:	mm/gup_test.h
> +F:	tools/testing/selftests/mm/gup_longterm.c
> +F:	tools/testing/selftests/mm/gup_test.c
>

Yes, these are all in use. Looks good.

  
>  MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>  M:	Andrew Morton <akpm@linux-foundation.org>


Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

