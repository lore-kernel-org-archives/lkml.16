Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45412E03E9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585779; cv=fail; b=dpWHPyLUq9QRW3IEG6mc/4qJFBBCxMFZ6wuqjV+S3l+Cgk9yF4uFraaChN4KUxMzEYCmhDCvFSQPhf50vrxLVqH0GhpJQnLoL8JKKbzZbFuGoWWB5JNcSwisDiOqJC5vbUYwCzsd6Wpgu2BzNNEChmyOruK1auChanowrXjMK8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585779; c=relaxed/simple;
	bh=ZSw9y8uOpDDE64BXTbYnmxrccd6lmphvQKTLhWLvGRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=thCBncZtClX4EW3WAfJVIYGH+RSgw5+ih0oLaTVO5lVSfZfcwW2jsmRmltXaiw5Jwf60qMDpTOgVzS8c8bWDgTmLrhWoXxTldloKG8EJ4h1GvibiJotdVUQg8nLHp8Kr/vFqDyiIMdOCn/FEpIW5HpNJVrAJZPhE1hVI43x9YVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hi/45iDW; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hi/45iDW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw4NPPsIUTHTEs0ocdUrbJjfDUUHYsaA2OwxeAeIOBzM+sSPQ7fYkJ4ZEqObZarxd1V42F+e8ckkF3v49QYyDBz5uq4XloTHCbe6IPTh2j32PbMBopPIi6F5oUYcqbH7rCV9krt/ZgmG7gvh1oeqBi8CXghdcuTaMHZRZJeo8mQBN6yCROx6TvUZdxQPRJzMYKPNlE8X/B9O/v9eCw03/fjEJ0AYshM2Kxe4db9p7UES/l4ulRVbLtmZWBJf64VwmAU+Kmn5/ugcbeCaEFh1tBsQoVvVRKFR1chFRVKRhe9WT9rY9X39bBn9DDyHaVTFZqhgmrmFoTBgzkpomZiNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNGxHqnX4poxQ2HeXGxgAA0MFEl2tNz0zY5AEO2/pTM=;
 b=KEbPfJ8DA8ZeymPnGnwPv6uvz/LkYzx8BA+yyAXZJwApK4WMEaNRb1A8TdF6cou08h6Tk5Ockjjy/xSTmqaKHQv2O8wYIfmkjXqnE5LGxfSd0SGA8Jg68NARSXRYmE7JZtMlTD2akJDYiNDiWEVoMdYugQle++LONieHkddHUpNIAMulOKnQYBuveyVccjuAei+Cge1fjv50IX8Z/7FdLif27/DCszuxUJweXQ571we5jJs3kkdFP9J1qiiCh3kMfXSdPIPAhApNUNSIEzNM5/mhj/nhTNRs159h3r62CDVl5CcYMRStiKHIm6uQxXCwzd6K4BWYpaqWw7eUFMdXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNGxHqnX4poxQ2HeXGxgAA0MFEl2tNz0zY5AEO2/pTM=;
 b=hi/45iDWe94VRRngyeX+HyxbZ451H3D0lIvjr45QBY6E/BrUWoh/qdapVamSz6Krf3HjlrgvaHJaZ9pr0g4VrPIpfvwC5CWh21xBpqtOhPqwLhl2hwa7W0mwxYsVWmj6Y5Uy3I5iON1jKMvqCxmnOotIBddKOpbTadQ2uH4U98/Fz/3qS91NKQXkNHygN8dmabpEM6CVb+IZ6be047D638Z+tqoI+L6wVv5UzjegS85cd9oS4pQY6iU/RwY9vrqsAc6E8pTc1svAEkAf0q8N6mvncr+nAlvqZBw/BqrRVRPXbMlrvbJ4jdfE9LbJQSkgW6YcLH+y49wFwaJIJJ2DUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:36:13 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:13 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 resend 08/12] mm/thp: add split during migration support
Date: Fri,  4 Jul 2025 09:35:07 +1000
Message-ID: <20250703233511.2028395-9-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::16) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 35be8a1b-8a29-494a-1650-08ddba8a6592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlJTU1RHZU94djhWRmRvRUd2VmRaOHY1TWN3UFBxMDVFWUVzbmUxZlZHKzBC?=
 =?utf-8?B?MDNwWDYxdDNXTUE5Qy9DQ0gwVzRZN3d3UEpQMEFCS2pCdU1TM2FLV0VZTm8r?=
 =?utf-8?B?Q01PcXU1a0crSHJML1M3WTlnZm9CeGRLeGUvajZmUk1nVFpKYmh6V0xkekNy?=
 =?utf-8?B?ZlY2NThxNGQ2RTNCamNEZXFITVJ2WDArSlNFNnhhMHc2VGdTRjA4WU5mdTdw?=
 =?utf-8?B?VkdCK0QrbXpWOXl5TGpXaWNRQkVyWHZFekJxd2lYbnljS2dUT3NVUFZGQ1lp?=
 =?utf-8?B?MlZtQzk2T2hKOEkzMk1NbzVhWXFVL2dmRzVaNjIwRzRhckU5Ykc0N1ZuNnpa?=
 =?utf-8?B?NHZzWk1jdENsTnVSemxkalZRa044VmlrbWthbSs4YjlLLzl4VFZBQkFLUTJt?=
 =?utf-8?B?STVIWlozTHkybnJqUk1kRUNKcGdKdDVKVVN6Y2htZ2k5UnBoTHJ4dmkrTVpH?=
 =?utf-8?B?blhOM3hpZjBXNXg4bDlvdmJ2d21KYzhLVUc5ZU5hcVVYTGN0MHR3QWdFeUpo?=
 =?utf-8?B?bmFTRkcxRTJsME9IZW8yTENDWjlKUHZ1ZERPbWttWmxsN1M4NjBsU2N2VHR3?=
 =?utf-8?B?NHNWZXkzanVLeFVMQzhpNUxBY01lalpDS0QxaEticHA2cnAyV0M1K1BJTWt0?=
 =?utf-8?B?c3JHMXYzbDA4MG5ueXJEU0R1SWdZZ0pEUE9VTUlXRER2bEtRVDBaeUtQSi85?=
 =?utf-8?B?M2c4Ti95bXRjdVdEa1V0ZzMrcllIV1lxc296S2JWNTMzMGN6eDFyTjVYVDVz?=
 =?utf-8?B?KzFHYlIzZXJYNlJhMlAvSGV1QVRKK3Y4VnA3Qy8wczhWam9iSUJKVklhbFE5?=
 =?utf-8?B?cW8yVW5Gb1gwcDlDYUZSWG1QWGl0NzRoSWdoNEZUMG1PWTdRUVlsTzRZZUdy?=
 =?utf-8?B?WmF4ZlRCSk5uMlRXaklRbUsyMTVaK2Z2Qy9kaXVCMHdCWVc4R3d2N2VDbDFn?=
 =?utf-8?B?bjJLYkJpaUI2TzIvUUNRTTA1dXd1YjAzV1NFWnNWeXl5NGoxRlpRVWx5ckNE?=
 =?utf-8?B?QmFDRWdnbGtVY2h0Skw2Y1Ixc3JVSGU5bjFqQlJBVi9aUE5EaTlsVWYxRUZ4?=
 =?utf-8?B?RWFTTDV5REVtUUpoREVYeiszUUZXOXdqZGYxdXBNUzcvYXdqTTRNOWxqWEdl?=
 =?utf-8?B?MFcrd3BpMGVRcTR1Qk4xNXFaUnRmZ1grY2NEUlhZdW80U3BlWXNyTWZkVXVB?=
 =?utf-8?B?VlJCZ1RneGRvajFtU25DUm0wbUhrSWhBc0ErbERvbnpiTTZNRzNXTE1jMUlm?=
 =?utf-8?B?QTVyR3lrM05icUVjbThWTlFIdEcrNHU3OVR4UE03WHhOT0hidi8xVmlITmxs?=
 =?utf-8?B?eWtyd3dWdnhhWEM5OFF1OGtBM0M0ZzdHam5JSi80dlQwN0NXVUJORDU1bjJX?=
 =?utf-8?B?elRnaXd4aGRaM05FQ0ZPUUQ5Sm5pV3FjMlVneFN0WEhqN3Z5bVNWa3hEYW1W?=
 =?utf-8?B?V1RZTXZkbmk0WmhLSzIzQW4vS090aVBMZkc2NnB2c3ZaeTBCbXJvQ0ZtVjRQ?=
 =?utf-8?B?NitQNStwWmdsMnZ0U0dTRmtHeTAzUkFxc1B2SmZWMVBKZHNHeW1YOXlSQlNk?=
 =?utf-8?B?WElZSzEvSEs1REFLVGRwRlI3eWpIUW1FN0VDWXpLZlhtSWZjcDk1NWtHWWhB?=
 =?utf-8?B?dE0zOFYrbG81SEJVN1hqYVU0L0hWVDd1eFUyeFdlbFlsUlo2bmsvUFF5T3Mx?=
 =?utf-8?B?bUtiU045OHp0SEROc2t1SE54ZmlmQmJPai9rUnBnRHJUUUcra0hFeUwxNEVK?=
 =?utf-8?B?TWV3UjRQaS8zclBHbFdIQ1pFU24xMDF3UE5HYzVNUExRRFAzc3dXYWpIU0RR?=
 =?utf-8?B?S0lONlQ3dWJGY05jTGlTZy9SblJuSmEvZ3dRVW5GazFFR0Z2RXZPR3NOeGZI?=
 =?utf-8?B?Sy9XUnJhaHpCSFpsTTcxSTgwRFVyN2NZTU1nckpiOUZvaXhRWkJwdmREUjFN?=
 =?utf-8?Q?8qTd2btgZ70=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEJxTjBnZU5LeE9Yb3NONUx6Si8yc1NuQTYwTWFONHFKcVBGK2YvYmNMYnhl?=
 =?utf-8?B?aElBTlRrN0E2eC9kN0pNYWpab3dLcVFZOW5MSi9WUnFqTkJ6WGg2VnJhU1NY?=
 =?utf-8?B?VmZhbWUra2I1RTBqS0tyMnhxL2JlQUNEWmptOUh0cXVCMXl4WFNMQkZ1dHMz?=
 =?utf-8?B?NS9kTk9leklIWTYzQzkxZ2hwck43L0lBbjJCdXFYRWZpOUw1SUQwU245MHY0?=
 =?utf-8?B?SEt1S1p5ak04alhoTTBrNHpBMHRNSkFaN05iQmNKb1ozRCtqdkVzNnltYytU?=
 =?utf-8?B?UlAvTE9CbGlzMXBiNnVoU3Y5QkdZNjdHanFYb3B4SlVrbDhDVWcyQ29SWGJu?=
 =?utf-8?B?MTRUR0EvdlBuQWNzMk5QSXU3ZWhsZ3FFTi9RWk41OWtlejhuV2tiamdDWDhF?=
 =?utf-8?B?N1lDUHlZbmNVb2tybnVSN2ZtcUxCOVR5ZzhXcGFBRWlKdGR3dXUxVGlyS2F6?=
 =?utf-8?B?RTZUZWtzSFZJdnFueDNGQXkyd1hvMWR3MFBUMGg1a0YxRHNhbzJNSTRSWitv?=
 =?utf-8?B?OWVtWHdUVnpacU9zYWltZ1hqa3kyV2xCUjlpSmYvL2I5dk9SbnBRVWw3b3Bl?=
 =?utf-8?B?QVkrZGpCTnRXRFh2em56c2pWQ2JoYm1iRjRnSnVIOUo5KzM2dzNOcXNscGFY?=
 =?utf-8?B?K2dGSE1KMHFPQXRKSUNmSFVlSXhFTlg5UHc3MWIyVnlDVFI0M090TVJ5YTdY?=
 =?utf-8?B?YUZoK2REMFJ1c3g2dzFRSkphKzV5T1ZIc3VneGRaRzhYNDJ4dVd5a3k3QitB?=
 =?utf-8?B?cjdLeWxYTW4vUnFQQmVtRkF6SlE2clRtemJ6T1dNbjdjaHZYR0N3NlJ3eTIv?=
 =?utf-8?B?SE81NngwVnNEVXhOQlBjMzNtczI3SnNrb29ENlBVTWdodFVvN2tBd2x4L0Nm?=
 =?utf-8?B?TmpZVnpzVkRNZThISVkxSUZ5QWFTUmU4Y2hrY2V6V2RRTmVrOWErT3NDTlBQ?=
 =?utf-8?B?UEhxaTRzWjNKcXdQM3krODQ5bW1RTVh5dk9tNGsxODUyckxEM0dvZTdES2xR?=
 =?utf-8?B?UFRRY3VCcGlvYk9oY3Nqc2M5RUc2eW0xaGJocjlReFdIMG9sT3VuMWovbHdQ?=
 =?utf-8?B?UFpjRmJBbTFzbVpYS2FNTHlMNzlycHBXd3N3akkwUWtveEMwb3dHK3Z6V0FV?=
 =?utf-8?B?Y1lwYUpxUzNGdU83eUFGU2o4S3A5cGVSUk1EdjlnUVU5blY0OWc5YW8vZC9L?=
 =?utf-8?B?TGkrN0ZERFoxc242WlRyaHFRalh1WG1yZ0pYY3dib09RS3ZDR3BTNEY2cVhU?=
 =?utf-8?B?NkFhMjF4anNLT2pqdnVvWDZHVkJLSTJub20zeVFGbEdacTg0aTNyWHg0cmt2?=
 =?utf-8?B?VklBNjcyNmcweUcwZU1SUGlqSGxRcGRWaUgvc3NPdUNLdWhDU0xGQXhjc2N6?=
 =?utf-8?B?SWludlRkN21yakszWTBNTXVpSHA2ZXZUdnVtTFc3UnhseUFpTXMwbS8veXMz?=
 =?utf-8?B?VEJieFVoSlFHL2tlelhiTWc4TDRGdFNnbW9KblpQc2htYVFNajVsLzJndzhS?=
 =?utf-8?B?QTd5S1F4bnVFRngyWTlReWVycEZuN3UrenZOZGowVldnUjZzUnNrd3BORHFR?=
 =?utf-8?B?TmN2N2ZJS2Z1ZFBGMUdUUXExNHVGdC8zTHYySTdOb3kraGRlbngrempucmw2?=
 =?utf-8?B?Vi93NFcxUjVuTUM1SVY4U0hXQzUrWDB6SllHNEtuZHF5YjU4NVpJUmJtR2Nt?=
 =?utf-8?B?NlA2akF3bEdoSDR2RUVpNnRvSVBhd1MvakJQZnA1a3dyTmFYNS9CYlByS29K?=
 =?utf-8?B?MWdrRllmMFVtaldzMGJPOHZ5akNIQzZUaXRDMS9nQVQ0dGRyNGk5T1VQN2dW?=
 =?utf-8?B?S2l2YXZ5YWMwU2MzMi9RVm52OWRiMEREa3Fuc0kwUGk4MFJ2ZEMvcXMyUWha?=
 =?utf-8?B?bmJJK3RaNnFxeFhvWU5NTEMweXdydXhFKzZ4aFlDbHhtR1h3UkdGOHZCeFpy?=
 =?utf-8?B?M212ZTROYkdvcm1PNFZTTDRaeDJ6bHdhVWJVUGl0RXJYWXp3OXBhdGl2RWRG?=
 =?utf-8?B?RHFlclVGVmt4VWFraDRURFZZbHljenY4K1ZqZ2JQODUwRGZqVlRvUmc5ZnUy?=
 =?utf-8?B?bSswdkx4WVBHNklyVGMvbjlIMHI3VWM1SjRQNjBIUUp2clI4KzYycklxSWVY?=
 =?utf-8?Q?BTrb4xTeYju+fRLh3adWIlWaT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35be8a1b-8a29-494a-1650-08ddba8a6592
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:13.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeuoCOcqHG7DQ83+2/4Yx3//vXzAEUPzR5vlTgPFr/2PrLXbah9qPDaOkSG7+BxYx0xW9fnZuCayGM3cf0qpow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

Support splitting pages during THP zone device migration as needed.
The common case that arises is that after setup, during migrate
the destination might not be able to allocate MIGRATE_PFN_COMPOUND
pages.

Add a new routine migrate_vma_split_pages() to support the splitting
of already isolated pages. The pages being migrated are already unmapped
and marked for migration during setup (via unmap). folio_split() and
__split_unmapped_folio() take additional isolated arguments, to avoid
unmapping and remaping these pages and unlocking/putting the folio.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/huge_mm.h | 11 ++++++--
 mm/huge_memory.c        | 54 ++++++++++++++++++++-----------------
 mm/migrate_device.c     | 59 ++++++++++++++++++++++++++++++++---------
 3 files changed, 85 insertions(+), 39 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 65a1bdf29bb9..5f55a754e57c 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -343,8 +343,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
 		vm_flags_t vm_flags);
 
 bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
-int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-		unsigned int new_order);
+int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+		unsigned int new_order, bool isolated);
 int min_order_for_split(struct folio *folio);
 int split_folio_to_list(struct folio *folio, struct list_head *list);
 bool uniform_split_supported(struct folio *folio, unsigned int new_order,
@@ -353,6 +353,13 @@ bool non_uniform_split_supported(struct folio *folio, unsigned int new_order,
 		bool warns);
 int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
 		struct list_head *list);
+
+static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+		unsigned int new_order)
+{
+	return __split_huge_page_to_list_to_order(page, list, new_order, false);
+}
+
 /*
  * try_folio_split - try to split a @folio at @page using non uniform split.
  * @folio: folio to be split
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d55e36ae0c39..e00ddfed22fa 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3424,15 +3424,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		new_folio->mapping = folio->mapping;
 		new_folio->index = folio->index + i;
 
-		/*
-		 * page->private should not be set in tail pages. Fix up and warn once
-		 * if private is unexpectedly set.
-		 */
-		if (unlikely(new_folio->private)) {
-			VM_WARN_ON_ONCE_PAGE(true, new_head);
-			new_folio->private = NULL;
-		}
-
 		if (folio_test_swapcache(folio))
 			new_folio->swap.val = folio->swap.val + i;
 
@@ -3519,7 +3510,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		struct page *split_at, struct page *lock_at,
 		struct list_head *list, pgoff_t end,
 		struct xa_state *xas, struct address_space *mapping,
-		bool uniform_split)
+		bool uniform_split, bool isolated)
 {
 	struct lruvec *lruvec;
 	struct address_space *swap_cache = NULL;
@@ -3643,8 +3634,9 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 				percpu_ref_get_many(&release->pgmap->ref,
 							(1 << new_order) - 1);
 
-			lru_add_split_folio(origin_folio, release, lruvec,
-					list);
+			if (!isolated)
+				lru_add_split_folio(origin_folio, release,
+							lruvec, list);
 
 			/* Some pages can be beyond EOF: drop them from cache */
 			if (release->index >= end) {
@@ -3697,6 +3689,12 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 	if (nr_dropped)
 		shmem_uncharge(mapping->host, nr_dropped);
 
+	/*
+	 * Don't remap and unlock isolated folios
+	 */
+	if (isolated)
+		return ret;
+
 	remap_page(origin_folio, 1 << order,
 			folio_test_anon(origin_folio) ?
 				RMP_USE_SHARED_ZEROPAGE : 0);
@@ -3790,6 +3788,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  * @lock_at: a page within @folio to be left locked to caller
  * @list: after-split folios will be put on it if non NULL
  * @uniform_split: perform uniform split or not (non-uniform split)
+ * @isolated: The pages are already unmapped
  *
  * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
  * It is in charge of checking whether the split is supported or not and
@@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  */
 static int __folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct page *lock_at,
-		struct list_head *list, bool uniform_split)
+		struct list_head *list, bool uniform_split, bool isolated)
 {
 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
@@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		 * is taken to serialise against parallel split or collapse
 		 * operations.
 		 */
-		anon_vma = folio_get_anon_vma(folio);
-		if (!anon_vma) {
-			ret = -EBUSY;
-			goto out;
+		if (!isolated) {
+			anon_vma = folio_get_anon_vma(folio);
+			if (!anon_vma) {
+				ret = -EBUSY;
+				goto out;
+			}
+			anon_vma_lock_write(anon_vma);
 		}
 		end = -1;
 		mapping = NULL;
-		anon_vma_lock_write(anon_vma);
 	} else {
 		unsigned int min_order;
 		gfp_t gfp;
@@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		goto out_unlock;
 	}
 
-	unmap_folio(folio);
+	if (!isolated)
+		unmap_folio(folio);
 
 	/* block interrupt reentry in xa_lock and spinlock */
 	local_irq_disable();
@@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 		ret = __split_unmapped_folio(folio, new_order,
 				split_at, lock_at, list, end, &xas, mapping,
-				uniform_split);
+				uniform_split, isolated);
 	} else {
 		spin_unlock(&ds_queue->split_queue_lock);
 fail:
 		if (mapping)
 			xas_unlock(&xas);
 		local_irq_enable();
-		remap_page(folio, folio_nr_pages(folio), 0);
+		if (!isolated)
+			remap_page(folio, folio_nr_pages(folio), 0);
 		ret = -EAGAIN;
 	}
 
@@ -4046,12 +4049,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
  * Returns -EINVAL when trying to split to an order that is incompatible
  * with the folio. Splitting to order 0 is compatible with all folios.
  */
-int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-				     unsigned int new_order)
+int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+				     unsigned int new_order, bool isolated)
 {
 	struct folio *folio = page_folio(page);
 
-	return __folio_split(folio, new_order, &folio->page, page, list, true);
+	return __folio_split(folio, new_order, &folio->page, page, list, true,
+				isolated);
 }
 
 /*
@@ -4080,7 +4084,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct list_head *list)
 {
 	return __folio_split(folio, new_order, split_at, &folio->page, list,
-			false);
+			false, false);
 }
 
 int min_order_for_split(struct folio *folio)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 41d0bd787969..acd2f03b178d 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -813,6 +813,24 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		src[i] &= ~MIGRATE_PFN_MIGRATE;
 	return 0;
 }
+
+static void migrate_vma_split_pages(struct migrate_vma *migrate,
+					unsigned long idx, unsigned long addr,
+					struct folio *folio)
+{
+	unsigned long i;
+	unsigned long pfn;
+	unsigned long flags;
+
+	folio_get(folio);
+	split_huge_pmd_address(migrate->vma, addr, true);
+	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);
+	migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
+	flags = migrate->src[idx] & ((1UL << MIGRATE_PFN_SHIFT) - 1);
+	pfn = migrate->src[idx] >> MIGRATE_PFN_SHIFT;
+	for (i = 1; i < HPAGE_PMD_NR; i++)
+		migrate->src[i+idx] = migrate_pfn(pfn + i) | flags;
+}
 #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
 static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 					 unsigned long addr,
@@ -822,6 +840,11 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 {
 	return 0;
 }
+
+static void migrate_vma_split_pages(struct migrate_vma *migrate,
+					unsigned long idx, unsigned long addr,
+					struct folio *folio)
+{}
 #endif
 
 /*
@@ -971,8 +994,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				struct migrate_vma *migrate)
 {
 	struct mmu_notifier_range range;
-	unsigned long i;
+	unsigned long i, j;
 	bool notified = false;
+	unsigned long addr;
 
 	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
@@ -1014,12 +1038,16 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
 				nr = HPAGE_PMD_NR;
 				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
-				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-				goto next;
+			} else {
+				nr = 1;
 			}
 
-			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
-						&src_pfns[i]);
+			for (j = 0; j < nr && i + j < npages; j++) {
+				src_pfns[i+j] |= MIGRATE_PFN_MIGRATE;
+				migrate_vma_insert_page(migrate,
+					addr + j * PAGE_SIZE,
+					&dst_pfns[i+j], &src_pfns[i+j]);
+			}
 			goto next;
 		}
 
@@ -1041,7 +1069,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 							 MIGRATE_PFN_COMPOUND);
 					goto next;
 				}
-				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				nr = 1 << folio_order(folio);
+				addr = migrate->start + i * PAGE_SIZE;
+				migrate_vma_split_pages(migrate, i, addr, folio);
 			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
 				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
 				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
@@ -1076,12 +1106,17 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 		BUG_ON(folio_test_writeback(folio));
 
 		if (migrate && migrate->fault_page == page)
-			extra_cnt = 1;
-		r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
-		if (r != MIGRATEPAGE_SUCCESS)
-			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-		else
-			folio_migrate_flags(newfolio, folio);
+			extra_cnt++;
+		for (j = 0; j < nr && i + j < npages; j++) {
+			folio = page_folio(migrate_pfn_to_page(src_pfns[i+j]));
+			newfolio = page_folio(migrate_pfn_to_page(dst_pfns[i+j]));
+
+			r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
+			if (r != MIGRATEPAGE_SUCCESS)
+				src_pfns[i+j] &= ~MIGRATE_PFN_MIGRATE;
+			else
+				folio_migrate_flags(newfolio, folio);
+		}
 next:
 		i += nr;
 	}
-- 
2.49.0

