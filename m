Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAE2E36F6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751764551; cv=fail; b=t08fWgr6/BuGH8NhyBLWzjHyg5Qm32TA6bxpvfxYZml9ELavswwTSPKpwoZrOuZpFkpAul7uY8I7Zv2hjUC27lB3wSfSa/FQgfCEjcIgqKEGz5YgTO/X3UQVyt4/dlxJVR7GDaSLko9xXNFWf1d0tL+Wgq41gneMkyVNGumBODE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751764551; c=relaxed/simple;
	bh=NnFcMFxGPcgI+zv8g8dG6+P41Tbp3SomU0TI5UApF4c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tkCL1W3nU5q4cmNP1WD88pb3KDK6g5+PkK41l+6U2JM/w9vqw5LBY9gZ0uUy5gUhzYoeDELFmQWJT2b7PxHxLkwq4NE0RlSDi7jPxcGbVGUFopcAcdO2M65dey763CvdFfHdmDzVKQq2gZ76LkbIamdbkIpw/K8rPs+0eZQltRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bimXHdGC; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bimXHdGC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbxKLknb2n85EzNl+Un3/dRGSs5IEuK2qF3x3feDWnplhM2T5uQ4uEbhIDfhp5Ooy5eoONTNZz4LnOgtFKvCx6UqLPfLAX4Ax/upFRg3fMPtuuOL/ORrvgyHpf/81/FBS2Ds55hQ+8bso2HNzRFnvj7qr8UvXgRooRP4diZUA+1RxBmRqvkYFeuP2G1P6lac9vddUZWzIb7M3hBNQ3P+3pB16DoIcNeqYmWFNVhPkCMNR9EN3+PngBk4VYvYe7hbl0YjHO1xHhr1IhhqW4eOdyBp8uKNYcKStGCbUA0ixbJoCfbYLNZtP+JeEt5KeF4ZjZDUM1x+YhxYquFIbpDjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFrH3+/EG53z3qrtoiOeZmBRxFmi6caNqxAzG88CG6s=;
 b=OX6G9MSxjy0ROdS6ybTF+CDuQF16nbVZTWRrWZkt57b6dvJQ9YGGQAr87khSgIkBZUd04+zRF2ikdElRR6ytAWh5HfQkixKt/R15H1Fm6bo/jD9KhLfiwZX66/wjTU23F/yagruDMjvZDcZH4cq5nb383lqGJtH5HGrZMhFWKiEYa78pUQQG2ga8X/+5QNe4wCLB/hZUIY0fXq1MVmE5t2vZ7orQLjQpIKS2QXVd9RiumzYl6VPQkJzQVzr/Sid6V1qkGYuvHWnUjLeLLr4Ius+nzkwVw81TNAuHNB4LhsZOM6h0jYx6Lx9m1R3DGgsS2tVMWYAvi/q5EqYhRHijZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFrH3+/EG53z3qrtoiOeZmBRxFmi6caNqxAzG88CG6s=;
 b=bimXHdGCq837N2o9xx12tpqjIOgo4bgALS0lA2LVQka4zvVCMbuKiAcrZB+IRImaC/45Agv1VLAHgAe0wPGRMzFZvKVIFAEr4dHrTMfM1UeOrcC6vpkPV3rM4o2sYBdNKwLGIzMEcKq12aEHa7zL7Sw4yR37i82hcnulbeDr75R1V+lPW3w9dzvFRE299q0bEbACZ1ssQdxszaj0H5fDh7ejgGKXJLaK7dqTFBk4pmswYMDXFXixACT5wS7/1XG+Gprf8Ijr8O9rGNay+rnn4I+cxW/56ln2+tMNxCortn7Y8UsYFE6cjOKfMF6JHI9O1JNS97vM3KX6NiHHhhCscw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CYYPR12MB8890.namprd12.prod.outlook.com (2603:10b6:930:c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Sun, 6 Jul
 2025 01:15:45 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:15:44 +0000
Message-ID: <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
Date: Sun, 6 Jul 2025 11:15:37 +1000
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
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
 <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17)
 To PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CYYPR12MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: bc90c921-d205-4117-e4c0-08ddbc2aa1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2dRWjNlTVNiOEZFaEl0cE5DQ2V0amtiU0UxR0lqZlJXcmU2MjRINVNpYTgw?=
 =?utf-8?B?RVRYRktoS3VTZGNiMDN6U05lRVRqRmJJd3BlRTluYXpIZzhKTDU0ZG1mbXBI?=
 =?utf-8?B?dldUL1lnWnh5WFpXSzl1RWoyK2RUR1pUTVJ2aWM5ei9zYm1yVlU0akJFRWZM?=
 =?utf-8?B?QXVwVWkvVGNUYndabzNwY1F0RUh0V1M0SkpTVUNVbnhCdUx0b1FhMnRLejFs?=
 =?utf-8?B?ZkdQeU9OSXU4bUo2dXRIMVJpQnJrbmEvY3VSYk1xSklVVys3d0RIU3dUMmkv?=
 =?utf-8?B?QTZ3ZGVoUURkQWZlNlJHMkhOS0F3MW54QWswV1pIdlRieU9EazliU3FndW82?=
 =?utf-8?B?WGRJSllvWFY4RXBqZkpEbGtNNkNzMDhKdjFMakFBbWp6Tkh1Y0w1QXMzUFk5?=
 =?utf-8?B?SnU3OElueEh2UWJBMEFYalhKaEkrVzdsaDczejFRbzd3RUVmRCtFRmJ4Nllk?=
 =?utf-8?B?dFN3NmtvKzYwTkdZZHBXeUhKemI0N3lUMkxIZldqQm0zUlpiZzRoNkswZHpV?=
 =?utf-8?B?Vk1vOEtoWVBFejUxY2VIZURJSTFYeGllV2lLK0x6N2dxaGtuelJFMkU5cGtQ?=
 =?utf-8?B?bFVoVkQ0Vk1BOHdLTGoxMkNFUEJ2NjRSYWxBN3EvS0JjdlVDZy9SVytwbHBJ?=
 =?utf-8?B?c3VSbGxxVkQweXZobmNua0REVkdlRFJ6dU9BanZjeUMvcUd5TE9JcFpBek40?=
 =?utf-8?B?TUhRak5sc1BVQnhHcXg0bDlSbTlUZGg4WWQ4NlEvYXZra2JMbk5kOUxIYlhY?=
 =?utf-8?B?SE1XOHRRdUxydmRXRUZGODZSRzV2T3FYcDRsR3o1NmxnbndteTJoWlJSUVhx?=
 =?utf-8?B?dXZFZ0htRHhnbGoyTkRqZFRXUU1LMHhSeGt1UkI3QnhXY2ZlZGR2WmM5TUZv?=
 =?utf-8?B?R0Vselh6cHdvWkFmNUdScjJ6cHlMOEZEUHlSRCtDMFNld3o2UXBwbHNjanZ2?=
 =?utf-8?B?d0t2cGVxc2RUYnlTWWlrd3ZINENzenNUbXZ4Y1l2UWNxeTFJS2ljekJDUUU0?=
 =?utf-8?B?UWxEa2haWXgvT09Lbk03TzBGSFV0TzdDTmYvYnlPZVhKdkVWSzMyK0dmbzlT?=
 =?utf-8?B?dFBzN2t5UGZVV0hCTUlOckVvNlZHNjBHRkVqakg0Qzg2SVphWTdiekpuZC9Y?=
 =?utf-8?B?SUxPUFNTdnUvaDJ3bWJzWEZtZDJuWEdlRkRDZXhzVlk4RTZVamlqTEs5c2x6?=
 =?utf-8?B?UENRSDBQb0oxUll3MjdhTjc3VmxqRy8wZWNzTXBFaDRVMHJxdVhTVUduOHFK?=
 =?utf-8?B?RndnSUhLNFNlUUEvQllKemdkWk92ci8wUU1lZHNRWkErazJYZ0laTlVpOTNp?=
 =?utf-8?B?aGwvVUdaQXFLU0tHaGw5ZjB4SU5Kb2hBd0NKTlNHckhISitEdW54TkNLdHFF?=
 =?utf-8?B?TThxMVFwaGxDZE0zL3pKY3UxbjNyQzFBcmhmOEN0ditpd0trRlF0ek9zdkdT?=
 =?utf-8?B?ZDd0Ynd5V0dncHczazFqc1FweDByREpvdmtIbERxM1hWQUVqdFE3OTZucllY?=
 =?utf-8?B?VXJlK05nNEg1K2lWLzYzS28xenk4YiszK1hBZS9PcG9FN0UrUkI5Q2dPY2dX?=
 =?utf-8?B?RDVhbUxabGVRRExlN1NmTFlzbzJhRklHSFpsNVZ0MGRiV1piemlJMk9LVlEv?=
 =?utf-8?B?OG9qeDJYOXhrTXUyRlNrMTVXS29vQ0UvK092akM1dmJVQjltbVN4WTRZUkph?=
 =?utf-8?B?Zm5CWnNMRlg2STZkeEFKVGlkK0ZVUFdocXJldGMzNEtNRmVtYWp1Yk1zeEVV?=
 =?utf-8?B?RzFQUGI3RzdnenJ1RmQwd0JtTWtvWWdxT0IyTlZRVHNTa1BJd0sxeWZtdlps?=
 =?utf-8?B?KzJPMUU1R25pYmdHOGcwanJPb1U3UG1qMTI0SXIvdzZsSHpWem9VTUlWQTVr?=
 =?utf-8?B?OVFVR1VRVG84bHpvcTZQc29NTmdKTEtiZy9EZXV6dHFHNU5OZnprS0ZlMVJH?=
 =?utf-8?Q?FCLuURZemgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhXVDBVcEJUOEMzNVRSa0RLakNtUGlwd1VxYWJ0bVJ1NkFIYzRuRU9GVHNq?=
 =?utf-8?B?b0ZvdDdkcnQ4UVZ3SEIrbTdKZWg3elo3dmdzTnlGSVZiUTZDSFlTUVB1bGFO?=
 =?utf-8?B?U1dlL0R5QVg5MTB5RHY3VnB1YlVodlhrTm9LWUMrTjU1L3NsYnFtNHNTRjRX?=
 =?utf-8?B?MytHdTFkZnBkcFZxaUFENVpRQ0NDTjRtTVN4bmVpY214QXNWM09hYTUrYlhC?=
 =?utf-8?B?WmpOQXd0Z2VsSkxvd0tLU0RNdUUweG8rSE9VRmUxamRlTXBZZGJ0QjBJbG4z?=
 =?utf-8?B?blB2eXJTc2kyT1lvK1dlUXp1MC8rMTA4eWhqb3JBT2k0QTRsSXN3Mk5Bc1FJ?=
 =?utf-8?B?SjJIMkxyaHhkNmhXL3EvRUZndTFhczdrcU91YU9Fa3RENTEweTNpYjRqZXZQ?=
 =?utf-8?B?cXloKzFLRXcwR0hGWlY2RG1la3BXSjh3LzVHeUFhSGwwUUJveVhIY1E0WEt5?=
 =?utf-8?B?Q2czTzBiZE9nZEhRTlpHQjNFakxyNVk1Q2gwV1RjbjRUYmEyQkljNmtlWFJS?=
 =?utf-8?B?U1FnQWd6anVCYTFHUzdWSGIydVlHSE5DVUJXRnBOZjdZQ09zU254QWhqbHBk?=
 =?utf-8?B?eVB6RkozaTF2YmVXWXdnUUllTUxsNElZMUNoWEFWK05kVTJYYUQyQTYrczNj?=
 =?utf-8?B?N2RyM2pqWDE0UGk2Q1ozbTQ4WFk5bEpxay9QOE1ackxFUHJISjVwZnNRMDJT?=
 =?utf-8?B?enpGeU0zN0xTREh3VlFqZ2pXblZLbVZjU05qSy9TOTFyeGltVTU0YTMrcDhX?=
 =?utf-8?B?VFdEWjlIQWUzTDZEcjMzVnlXRThqYWkwS2tNaUhMV1FCa3N3L1MvK3ZCa3k0?=
 =?utf-8?B?NGFBWC9HdkRjMzArQlc0Y1BrQ2p5SGRLUXJrUENTdFpBOUQ5R0kwUXN6UUI4?=
 =?utf-8?B?bXFMSXVXcUdMa253bGxuR3EvMzRiVXdGRi9QcFBYcWxFSXBwTWdvc2VzRmxV?=
 =?utf-8?B?Tk0wZU9rWXhIR25nZ2pNQWlIYTVpaENudkk5MWlFMlZ3NVczencvNDdrOUJa?=
 =?utf-8?B?ZncvMncxNnVrRWY0T3cwb2xVZmNZUTY1eUMxak15WGlnTnFTakU4elZwbW5H?=
 =?utf-8?B?aGd1MlhkVjNneWJCTzRZZk9LRTQ3ZUZIa09MaFdkMS81MWxBRy9CZUJVRFlM?=
 =?utf-8?B?Ky9Fanh4V2Q0VHR0Y2JtMmptdzVERHJoa0FVcENzVVAwREo1bmtGZTVYYkRF?=
 =?utf-8?B?bmQ2dDNjTDQ4TUNYTHBZUThhdmxxZ1ZyU2RCbS9tRlNLVWYzVTdNeDhEOTht?=
 =?utf-8?B?eHNUVUJLOUN2QnFZTkJuR3Z4YlpvNTFtR0o1QVdpaDR5QkE4enpPcFBaRnRx?=
 =?utf-8?B?dGVMUmticUVibW14bmNtMURkdFRYOWJiTUVueXJhMXJDRHBEakhXbWFLVWRV?=
 =?utf-8?B?WmtDUld1RDdVUFZINU12bTF5bGs2MVc5MkRpWWNINE1hYnFoRGF2L0x0WEUw?=
 =?utf-8?B?U3Rta1VKR29nRWNjb0U4ZjIwKzNOZm0vM2xKcERQT2E1cVFzbWFJZXJwaXNN?=
 =?utf-8?B?QWczT3c5SGdmSXhRclZ2VjJnRXRHRElzRWloUDljdTZTL2hXOEVZbTdPRytK?=
 =?utf-8?B?VFB4bmpXNWhtNUVsZUthUVMxRFp4Q3FjU3IvUGd6UlpLWG0zMHp1Q1Q0QlB2?=
 =?utf-8?B?MGllODFoWURPeCtId1hha1RhaDlGb1dzODI1aVAxSmQ0bU1xMTBFNnFObGdz?=
 =?utf-8?B?eFFJbnJUblduZ3dUZGFnZGxlb0VKNUp4NTM4UlA1dEZ6R3VEc25pb1JiUzZH?=
 =?utf-8?B?YVd4djF6SWlmOWdPdlJMZGQxbnBRamdvOG9QbVY2NE4rc2JhMW93UWxsT0RM?=
 =?utf-8?B?R0JaOVVWQVJKYXFpQ0JHdktIanVpcFg0NzhjbEFJWWZDN2FpMXNzSnFmWVJS?=
 =?utf-8?B?NU1sQVo1dngrTnVpekxpeWFEM2FBWWlnTEVlcFhjbzRxdUpsL05GMDZSTm9t?=
 =?utf-8?B?YUlpbVF6eUxxbFh6WkQ5dlBFN09HQmFoYU1kTjdoY2hqd2U0Uy9HTEZxY1Vn?=
 =?utf-8?B?cTRhQVZkN0lML3kvdUoybGZ2REJwNGJDSmovWnBVbFB6eFdRV0FGb3U2YzBD?=
 =?utf-8?B?TC9uQktlcVllZHpBZ21YTUMvYjVob3kyRTFYVUdnTm5XVlFwTVZkb0RyWGIx?=
 =?utf-8?Q?s4sDS863A0q7+lbvr4ZKTs0uH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc90c921-d205-4117-e4c0-08ddbc2aa1d6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:15:44.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTxhh9fz69X2rFvhDLdaVoBkHHxq6NC8oIO55GFLI9W+KCPqnVYdhPVJc5fRFWEr+gfJ1M9s3b29h00C0dfj+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8890

On 7/5/25 11:55, Zi Yan wrote:
> On 4 Jul 2025, at 20:58, Balbir Singh wrote:
> 
>> On 7/4/25 21:24, Zi Yan wrote:
>>>
>>> s/pages/folio
>>>
>>
>> Thanks, will make the changes
>>
>>> Why name it isolated if the folio is unmapped? Isolated folios often mean
>>> they are removed from LRU lists. isolated here causes confusion.
>>>
>>
>> Ack, will change the name
>>
>>
>>>>   *
>>>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>>>   * It is in charge of checking whether the split is supported or not and
>>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>   */
>>>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		struct page *split_at, struct page *lock_at,
>>>> -		struct list_head *list, bool uniform_split)
>>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>>  {
>>>>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		 * is taken to serialise against parallel split or collapse
>>>>  		 * operations.
>>>>  		 */
>>>> -		anon_vma = folio_get_anon_vma(folio);
>>>> -		if (!anon_vma) {
>>>> -			ret = -EBUSY;
>>>> -			goto out;
>>>> +		if (!isolated) {
>>>> +			anon_vma = folio_get_anon_vma(folio);
>>>> +			if (!anon_vma) {
>>>> +				ret = -EBUSY;
>>>> +				goto out;
>>>> +			}
>>>> +			anon_vma_lock_write(anon_vma);
>>>>  		}
>>>>  		end = -1;
>>>>  		mapping = NULL;
>>>> -		anon_vma_lock_write(anon_vma);
>>>>  	} else {
>>>>  		unsigned int min_order;
>>>>  		gfp_t gfp;
>>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		goto out_unlock;
>>>>  	}
>>>>
>>>> -	unmap_folio(folio);
>>>> +	if (!isolated)
>>>> +		unmap_folio(folio);
>>>>
>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>  	local_irq_disable();
>>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>
>>>>  		ret = __split_unmapped_folio(folio, new_order,
>>>>  				split_at, lock_at, list, end, &xas, mapping,
>>>> -				uniform_split);
>>>> +				uniform_split, isolated);
>>>>  	} else {
>>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>>  fail:
>>>>  		if (mapping)
>>>>  			xas_unlock(&xas);
>>>>  		local_irq_enable();
>>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>>> +		if (!isolated)
>>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>>  		ret = -EAGAIN;
>>>>  	}
>>>
>>> These "isolated" special handlings does not look good, I wonder if there
>>> is a way of letting split code handle device private folios more gracefully.
>>> It also causes confusions, since why does "isolated/unmapped" folios
>>> not need to unmap_page(), remap_page(), or unlock?
>>>
>>>
>>
>> There are two reasons for going down the current code path
> 
> After thinking more, I think adding isolated/unmapped is not the right
> way, since unmapped folio is a very generic concept. If you add it,
> one can easily misuse the folio split code by first unmapping a folio
> and trying to split it with unmapped = true. I do not think that is
> supported and your patch does not prevent that from happening in the future.
> 

I don't understand the misuse case you mention, I assume you mean someone can
get the usage wrong? The responsibility is on the caller to do the right thing
if calling the API with unmapped

> You should teach different parts of folio split code path to handle
> device private folios properly. Details are below.
> 
>>
>> 1. if the isolated check is not present, folio_get_anon_vma will fail and cause
>>    the split routine to return with -EBUSY
> 
> You do something below instead.
> 
> if (!anon_vma && !folio_is_device_private(folio)) {
> 	ret = -EBUSY;
> 	goto out;
> } else if (anon_vma) {
> 	anon_vma_lock_write(anon_vma);
> }
> 

folio_get_anon() cannot be called for unmapped folios. In our case the page has
already been unmapped. Is there a reason why you mix anon_vma_lock_write with
the check for device private folios?

> People can know device private folio split needs a special handling.
> 
> BTW, why a device private folio can also be anonymous? Does it mean
> if a page cache folio is migrated to device private, kernel also
> sees it as both device private and file-backed?
> 

FYI: device private folios only work with anonymous private pages, hence
the name device private.

> 
>> 2. Going through unmap_page(), remap_page() causes a full page table walk, which
>>    the migrate_device API has already just done as a part of the migration. The
>>    entries under consideration are already migration entries in this case.
>>    This is wasteful and in some case unexpected.
> 
> unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
> PMD mapping, which you did in migrate_vma_split_pages(). You probably
> can teach either try_to_migrate() or try_to_unmap() to just split
> device private PMD mapping. Or if that is not preferred,
> you can simply call split_huge_pmd_address() when unmap_folio()
> sees a device private folio.
> 
> For remap_page(), you can simply return for device private folios
> like it is currently doing for non anonymous folios.
> 

Doing a full rmap walk does not make sense with unmap_folio() and
remap_folio(), because

1. We need to do a page table walk/rmap walk again
2. We'll need special handling of migration <-> migration entries
   in the rmap handling (set/remove migration ptes)
3. In this context, the code is already in the middle of migration,
   so trying to do that again does not make sense.


> 
> For lru_add_split_folio(), you can skip it if a device private
> folio is seen.
> 
> Last, for unlock part, why do you need to keep all after-split folios
> locked? It should be possible to just keep the to-be-migrated folio
> locked and unlock the rest for a later retry. But I could miss something
> since I am not familiar with device private migration code.
> 

Not sure I follow this comment

Balbir
