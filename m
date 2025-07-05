Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9994689
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677116; cv=fail; b=mvWyDT84KxMR5u4SpNOjCwybYrHSYLb3Y211ULZQJYcDIWNbefK7bR/vnUaq2GDMjO37AGWI8bPrLIdJzQSJEnbF8s6I56cPt7VcDmbP6BZnBWBQ+pFz1DifUr0Cbz4hexFhX4ejmLTnZLmoXc3YWsZvU5jIFttkse+wQHn8lv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677116; c=relaxed/simple;
	bh=Ky4Z8OKUyw4OJ5wXQdUKahfHSp1q+pBls/9JEKmDH94=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EpDRqmdalaAWNy6sAiqfXPx49mFh6TaUOtDNT0c4082A1yXfxin54jkAXW3/ajZc3V/N1P1WILoc1Yf1nL5xrKlKXGw6IDRj4l6IJujaF6uE0AtE8iWLHvnGgXL+4YVqBVoSImxdU92h+3vnxZzSh6oJKLmyrIVMwqXepX7x7Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SsfJ7TWL; arc=fail smtp.client-ip=40.107.100.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SsfJ7TWL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G35B2jtW3m66XKinU4/zaNWAVyMKHlZ61Dmri2PEijByXW1puVEKb+9HcKqqhqR1mlC8dWoyHXuyLmOVzGzY7wCcvj9JL/LpXR29tshi+Lb1KPsIq7q01430w0E5jarM88lxka4P+L7XOcXyMODC7Kb6zmlZl/j47sVf3CsR0ugWaafzqNwIlUpKXWyKk+V9wBsEFHvoc0VVOLxsBxhe2nS34+wgnpeLNdraUm7uoz1LILNXUZEjtZ6cVf6SY4tA9VyLUr+Xx4eEbh5wDirGaPUDP4UO+p9aeVPu6YE9lgeaXSu+hlyaBaWbIEuvEoAg2cYKYLtJwjMuwNYVG2Aj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBSQw6kDE1GtdnBiftkgEFXJWT36QPHoKIXuVXqlaKc=;
 b=aGZbWel80tmB7n/IfRqcrwNBkymecSEiYDcQywgXAaiJ1811vOxD5OIYtOJa+uGS91Z9x4zU4R4TpLlja7ReG1GtSrerr4o81CInA1UPPlpm9e8vdQs8OY/S5cu7x5aUSvRYBn2nNU/A6kHGsei78zutucIAO+/OkJy84doZrd3RQScPq2/tmNLBcJzGr0mlmfXBzcmztHF0JAso6/s4MJWpmLtc/cGfJXbgSKmqTKBiPOHOoupOqYpGezOu8yVan+RPwuyJQokH2KGMg4AxGq7YqUKOp4mKHNSEdb67UkK+KemmbeoUE0xaelf9NfB4NYRJIEq+Nytp+EfudPdO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBSQw6kDE1GtdnBiftkgEFXJWT36QPHoKIXuVXqlaKc=;
 b=SsfJ7TWLtyM8XisAjJ/6DVxgdeAQhmd3+2AjNCIhXKy7fa9zy67XSMbZkTHSTxBJj+8J93qg/uIPjuxvYHjFObd+DbY/ydcLm8tXs/mYQn/q7oLGug7hTnyt8Ovfk4vTVoLhztFCDTSCyWa+jt+7sr4pmAEToYJMarJ0ANTDl/4qpHGeQZKYb/a3D0n2Jlp9zDevevGG/NpNnEbxQ7cW+Z4RMpARV45czolabCMu69Bix+bKMCXBwdR2CePhz7UvhYIxHJPmH2NoZ9UamJ8wt++vNQmRQIVKTcoXSIYM/DJsWBI8n/oICLM8jl1G3uJynjgn0qr+UEFFYUMyYXW3LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 00:58:31 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 00:58:31 +0000
Message-ID: <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
Date: Sat, 5 Jul 2025 10:58:24 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fcb8f7-f566-43fd-ac7f-08ddbb5f0f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUo3K3hPN3BpSGxBcVFoN2lBRVZtTndUcHU4OUpEc1llZ3NBcno4cUFJU0RV?=
 =?utf-8?B?VFNwUTFEbDlCOEZXSlN2RGRGR21sTmwza2hmM2hMeUxpRmpVdWMzaWpEVnNC?=
 =?utf-8?B?S3JEdkpXd0JKemloMjJjSXc3NElXNUhyNVdvT2F2N2xMMUtiTkF6ck9DTDZX?=
 =?utf-8?B?QmFwa3psbVJNUFgrNHJ6N0lNU3U1S2R1K2poOVN0cUN0bGZsMDVNYzMwNWR5?=
 =?utf-8?B?anhTQlpoa2UwSVRGeFNZSExDWW5oSUcxTVJlTksrZXhYR1VFbUhEb0JzVHVl?=
 =?utf-8?B?a0FVZ1pLRG1ib2ZSaXpaQ3k3MFZUZUZ4TEdxZ0JhWmVoZU1XMkQ2WENPVnZa?=
 =?utf-8?B?ZHRxT09wMDFzL2h4WFB4bUtPenlodWRNNjN4TVZaY2N1eW1FWk5pdDB6b0Vl?=
 =?utf-8?B?cE5tV2VjZVRJRUJkUGMydmtjWG9jUWpsNkRaT1MzdVlQaFNUdHRRaW4yN2cv?=
 =?utf-8?B?cnF2Qy9oQjVWWkx3Zkd4ZXhPSnRQWTJNV1U3S2IwWlF2VzVLWGdSc1pGK1Vo?=
 =?utf-8?B?Y2hNVndlVlM2YkhMUUpndjczRUdpQWNCRlVocEYrSjZMVUVSZXZZYU54ZGNz?=
 =?utf-8?B?Zm1PeWR0SmFKelVod1dYQ2FyL3lkYnI3elMyYVFYMExMK2ZqdUQ4dWR5LzJJ?=
 =?utf-8?B?MklsRU04R25JR1J3b01KdFRSckx0VzltQVJOcFlud2MrcU5iZ2VrU1d6Z0Rj?=
 =?utf-8?B?cHRUdUZIWStjUkpETmh4MHZhaWhCSEdyamZNZzQvT1g2K28xRnlYVVp2RXFM?=
 =?utf-8?B?dGdQcEhDb2dGcjZwNWRCOFJ3TWZhSzBqNnRvaUJ4c1diOVRRanBxb09zQ1da?=
 =?utf-8?B?aGtiWVVGTXN6cTdlWFRUclNnWHdvTS9wY0VJZXZ5MmprdjQwdVFDOWhaSlVU?=
 =?utf-8?B?aU5jTXZWTVdVSUhvbEd4aVh5UWUxNTVEa0h6a1dLeVFWbU9BdDA3RDRrckdr?=
 =?utf-8?B?Y0tuZklXdU15a3hhWWFOaUZ6U2FMZkd4VVZhOWhlYUJCN242NGJTbmRRU2Vs?=
 =?utf-8?B?N1BkcHEyanc2VzNRc3dVSnFoUU5wa0VMRWRkU0JyTE5MNnJzaFlwYzI0SDlY?=
 =?utf-8?B?eU5kZm01MmU1WCt4a1ZxeGZFM0FQZHpLTHJ5UWFOM2MvOUx2ZmdZS0RCVGEz?=
 =?utf-8?B?SWovUUNqM2FMZGVVM1UrOVZCQ3pKUHRLcmsvOHY5M1F5M2s0d3lLelI1cCt2?=
 =?utf-8?B?NlIyS1lqNWZyaUtqV0dWZW5UTVlya2dHeW5hWGtOQVhnd3Y4WWZ3US9SaWNZ?=
 =?utf-8?B?ZjZBRytKZGxzVVdZK0U4eEZuTlV5Z1BudlRCcjIzajlVZHBBTWxtbjdNZVFR?=
 =?utf-8?B?U1dCWnU5VXNLN01XaDVpclNCTHVxeEdqcGNtTFUyMFBiZlNZYWh0dk5zSzB1?=
 =?utf-8?B?cUEramJYeWcyU1JCL3NPa2o3SnczVlVpR3ljODdFdzBkUmhjRjMrcUF5L3l1?=
 =?utf-8?B?V1dNUXByR3JOZG1tVGdOUmp3dlozYXFsdjhFTWhJMnptNWppZ0hzdnNNNUow?=
 =?utf-8?B?OUIveENNd2FueS9NQ3l0RGs4R29MWFJ5cGpRS1V3OEJBN1pvOGNlK2Z2MFpY?=
 =?utf-8?B?ai9FRUlOQmZWc0xoeU1Mc3JudmloL0o0cjVrc2VwRlhqVFowRUJNUGJJN25a?=
 =?utf-8?B?bEJOUFdScVlYZVV3RXR0TnFYU0lxRkZzWmtHZ255Y25odmFxYmx5cDQ5NXBi?=
 =?utf-8?B?L2k3RFllU0F5Uzh1MEJOamJvT2FROTRtaTFiKzFVN2xxZFRWY0ZVaWdMYWJE?=
 =?utf-8?B?UEYwQjhaL3hWV1lzNUVEN1lYc0x2eFhPa3BLeWE1MkpaU1ZYYmhLNEtHdTlj?=
 =?utf-8?B?YXRINFQyZWRSWkxUVW1rTHFodS9qN0Rja2VVVmQ3N0NINWZpQUZaWTVBbElQ?=
 =?utf-8?B?SzRmbGJVajRUd290cUZlODk5YUZpRDFwazJkSFdoWHpPUTFLTk5LWDBrL25y?=
 =?utf-8?Q?q/Eo3W2w5dY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTJMSTlkWkpKNzJGTTZ0cjJpTFpQTkRTeEdkajUxbG4xcmhsaWgwOVBnZVVr?=
 =?utf-8?B?YlJXTXVTcTR2RXJWNVFLMEQ4MGVDRDEwbkh2Si96SlV6MDFaeEQ5VzRBRDgz?=
 =?utf-8?B?YXNZci9JQ3FSYldZMXcvQTIzRDlBT0FnWEhPSjg3V001b2R5L1YzT1hBZGRr?=
 =?utf-8?B?a3FDdklRT3FLY0ZPbWk4dnU1NjJXVXJ6Z1prRnFHOG84QWVJWXM0bWcvOTFT?=
 =?utf-8?B?S21Ba3g0bHhOZVBQZzFkc0RVVXpBeXhweFRMMnNHZTg0Z0QxNFdqZTlPNWxQ?=
 =?utf-8?B?aGVrRSt5aEM0cWZZMTBocSs3WkVlcmt4MGNhZjFsTDVjUU8yZzZ6MDBvMzd3?=
 =?utf-8?B?T0JNS1p1a3dQYmF3SmM3V2dqZzMyN1VsU0RlSEZ0Z1M5b1BHNnh3bGYzcmtG?=
 =?utf-8?B?aFoxV21hRXROM0JNOTRPRHZOLzNFY3ROTnFzZ3Y5ZlB4YldpbThPTzB2LzFP?=
 =?utf-8?B?YTloMUJZUjk3TVZXSTArNTcyK2Q5Mk1tSWFSa1dxbHUwaDhKTEdYai9zdFF1?=
 =?utf-8?B?ZVl0ZkdmNzdaMnVtNFh4ajJPb0lyQk1pMkhUcGUyTE4waDRMNnVoQVpCVjZ6?=
 =?utf-8?B?cFdvSU5KU0wxNGtBa0xZTWd3ekk1RnhVMVdWdXhScGVyRFo0bDlRVDJVd2Qr?=
 =?utf-8?B?b3ZVcVVqeHphQVF0bU5YK0J1VmorcW5idHhCKzZCUGZHZGNVeGlRY3luZFJF?=
 =?utf-8?B?dzJBbjFlS1J6cUtaaklYUlZwY1hDYWhOOUN6eWpja3FOMnR4V0cydHNUY0Ny?=
 =?utf-8?B?OGhweHNLSm1ZR2dQTVp5NDhscmNFaWhRYzFFY2Nia3VGbWNNY003eDhxWmNj?=
 =?utf-8?B?azZ3bFBMQTQwWUZOUCsxQnNBRHNmWHV6YU4xUDI3MjAvbTdCQS9IUEhVVFpo?=
 =?utf-8?B?M3ZCWHFGZHJCRTYrbURvQVdmS2ZJc2VxNVBScGVmZTlsVHd2a01hOU5Ka3cz?=
 =?utf-8?B?K1h5N1BPa01rcy9xVHphOU15ZjdsYzlvUkdTK0cya2hKQjhGNkptMjNJNDkw?=
 =?utf-8?B?L2JtL25UaE03RVhKRktJN2dQY3hUVm9uWXVRYW1ob2kvRjNkVGNMQk9qVHpx?=
 =?utf-8?B?SnJUN0NLZVFsT1RMOEZTYk9xVE1mRUFiUVM1b3VYU25nYmo3bjNoTlUyekp6?=
 =?utf-8?B?NmVzdEpKZElCYm5oK2wvWU1uVFNQSnVWYy8zMlJsRkR2bzRYTXg4M0NVSG9k?=
 =?utf-8?B?dUszWkdjN0trY3l6RDNxTDJvYjZMV1ZmL0g5dEJOdU5PSkxtRVVXbURQUzlp?=
 =?utf-8?B?K0VQbkp1aCsvemVKaGRKeHVYMHRYNDZzR0lVYURTMS9jdU9TMFd5VHlrTmZ2?=
 =?utf-8?B?QmZmSXoyQnNkV1owRG1tZ21FcjRCTFh4Kzl1UjBkbXpRQ1NJYTU4b2lEeEo4?=
 =?utf-8?B?VHJBaHh5ZGJmM3VPQjZRVnhxK0E3U0ZDemRXaTBrTHNGUjNpQWY1cTczc1Q3?=
 =?utf-8?B?TW83V3E2VGhzaXdoVy9aOWVWRHpBOG5iVU50aS90bjVQSjh1OHh1ck96ejFt?=
 =?utf-8?B?c0xiU1B4eFAwOTM1RXM5aURyVE51NXJvK2FVQUdicEdBZXluMnZpOUd5bmlo?=
 =?utf-8?B?TGp5RUc4YmsyeUtmT3VtWHA4ZDg4VDU1MVJFZ2ZmRWRCRFpGcWNMZmVQaVhy?=
 =?utf-8?B?SzZHUnAvb2VFajNmZG9rbEFYb1p4NEFNWDhrTzdTRHlpend2WWhhYkxwN0Rp?=
 =?utf-8?B?ZmtMT2dUZVg4SVpoUTBLSDR1aVhVWWNKRXJZOEFNb2I4MnVyMzdodDNzdTd3?=
 =?utf-8?B?UGF3WVdiZ3p3V2NRemtpR0lrYkorTTVFV212NWM3czhEZFFvUXRrcFZnV2Vm?=
 =?utf-8?B?SVdCSFRjUFZBLzJjYXdEYWVzM1BYczNvRnpNWjdhYmh2OUk2NEdqTVA3L0Ur?=
 =?utf-8?B?bzdqRkx6K3JHTUxXTzF4cXowK1gyenZIcEt6ajZhbU1IRm1qOGhMYTdBTXRo?=
 =?utf-8?B?bG9ycFYwUHBTaGU3Y3kyRDdYc3hqWjdvdFFDWVZCWmV1TUFKTVNBUEFrN0NP?=
 =?utf-8?B?bm1jcTIwWnN1c1kraEg5a2JxOS8yV2o4VTNoOGRyRUNSY2o4Ty8xd0M2cktv?=
 =?utf-8?B?UjRZeWUxdXVzelVOdEJkY25OaHJ4NlFEYmpUeVUwT292ajdSZGFrMFdvM0J5?=
 =?utf-8?Q?tMCX9rjqoa7TgsDF++hkYDNbV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fcb8f7-f566-43fd-ac7f-08ddbb5f0f36
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:58:31.0041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ah+KQrJaTknUPrbAt6JcATMEr38U99Pm7i9NqlYpnvnX07zJbcKLJ0XPCAy+bVYmlV5/p+YqzVHAxcGAWYXZ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655

On 7/4/25 21:24, Zi Yan wrote:
> 
> s/pages/folio
> 

Thanks, will make the changes

> Why name it isolated if the folio is unmapped? Isolated folios often mean
> they are removed from LRU lists. isolated here causes confusion.
> 

Ack, will change the name


>>   *
>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>   * It is in charge of checking whether the split is supported or not and
>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>   */
>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		struct page *split_at, struct page *lock_at,
>> -		struct list_head *list, bool uniform_split)
>> +		struct list_head *list, bool uniform_split, bool isolated)
>>  {
>>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		 * is taken to serialise against parallel split or collapse
>>  		 * operations.
>>  		 */
>> -		anon_vma = folio_get_anon_vma(folio);
>> -		if (!anon_vma) {
>> -			ret = -EBUSY;
>> -			goto out;
>> +		if (!isolated) {
>> +			anon_vma = folio_get_anon_vma(folio);
>> +			if (!anon_vma) {
>> +				ret = -EBUSY;
>> +				goto out;
>> +			}
>> +			anon_vma_lock_write(anon_vma);
>>  		}
>>  		end = -1;
>>  		mapping = NULL;
>> -		anon_vma_lock_write(anon_vma);
>>  	} else {
>>  		unsigned int min_order;
>>  		gfp_t gfp;
>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		goto out_unlock;
>>  	}
>>
>> -	unmap_folio(folio);
>> +	if (!isolated)
>> +		unmap_folio(folio);
>>
>>  	/* block interrupt reentry in xa_lock and spinlock */
>>  	local_irq_disable();
>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>
>>  		ret = __split_unmapped_folio(folio, new_order,
>>  				split_at, lock_at, list, end, &xas, mapping,
>> -				uniform_split);
>> +				uniform_split, isolated);
>>  	} else {
>>  		spin_unlock(&ds_queue->split_queue_lock);
>>  fail:
>>  		if (mapping)
>>  			xas_unlock(&xas);
>>  		local_irq_enable();
>> -		remap_page(folio, folio_nr_pages(folio), 0);
>> +		if (!isolated)
>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>  		ret = -EAGAIN;
>>  	}
> 
> These "isolated" special handlings does not look good, I wonder if there
> is a way of letting split code handle device private folios more gracefully.
> It also causes confusions, since why does "isolated/unmapped" folios
> not need to unmap_page(), remap_page(), or unlock?
> 
> 

There are two reasons for going down the current code path

1. if the isolated check is not present, folio_get_anon_vma will fail and cause
   the split routine to return with -EBUSY
2. Going through unmap_page(), remap_page() causes a full page table walk, which
   the migrate_device API has already just done as a part of the migration. The
   entries under consideration are already migration entries in this case.
   This is wasteful and in some case unexpected.


Thanks for the review,
Balbir Singh
