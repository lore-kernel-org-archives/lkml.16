Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33442DECC0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585774; cv=fail; b=DDdh6KNDw2nL7vndJJrT/JZQo7BsaWLykhd0hopc3LnbfQzxQ8kEQc4jErgTWY9IWZzUb2UBxOEH3j59UHPGo4z//PvvTfVWqsiOCTURiOoJ0zyx9mpklCqnuQ1Uc4iZg5IzBNXH9Iv7334Fsd7F55vTAwcVUNiR1GmN9drLe88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585774; c=relaxed/simple;
	bh=p1+cMhGaW3o9Rnvmc+LatIO5B3DLFMTa9O7bCSFqhCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fXxu3FsfP9Nkqmd5tyspLx2m+8NDcb31XwYCdnsrZLze9F1qYqup2GFTRcVQieNDOCDbO73csExss/z6Y7Z2LDeUiZ/IAfWg/d9ILGETKbLfINqCJk3yR6mMQWY2vch9gWMwSsehRpYCbcgH6VOSfnaxwkIva4OHfp+hDyUgW9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hz9ouv+A; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hz9ouv+A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxF0UqVLw6sUgTWqTg/r02lL2TNwpTl2HMKGrLdu6ZTpRKi/hyItL6MWKDTAo4YKMcIH7cyoiEvzn7ayBzp1B2A5z8UWs0qpatJxfttYAzoruiiOUOF95wA24FdjjAdFFJQLGCKvyxDxZNzP54pbzAE+Bo08WG5vFQD6YuMP0o1i9Hz7G5iiLGw9VK5nrin6oPOy6MGyF/eVb4x8oihmPzcO3wDOBqJDYMr78srgx2FSgRXhOelGJNTs4NBVpNceGxrkPkmZOpsMhhgRA60bLnOdwV4B1n8+JNwomkhVjb7R4Vh984Z8fSTTSCiN6Mk5NFc8SOWRoNW3b7hQisgLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2Twnfkee27OAosTaHBtM7m6m4tYYoTzl+AXbw3wF4Y=;
 b=jISl1VHUtxSXzusv5JwsMBajjw95JYpOq0oJ17LXSc+s46Au0xwsfLsDQoDc2syIJ0DcgUrwN+kNdAlHVF4uskBZEwKPldpXX+pb52FI/J9k5xtom/sPzKhZRguePISDRlpN3j71qLrIMIZII8bG1vo6x+LJ0SqbIsEdgnOzHW5mSv5rWi5rlFXAlDcpCDVA34cL+zw9cUfx0j26cy6TQXz9D3Gd3/Pw/eNkQ08yd2ctu7JggObODHYMNgyLW79DbInyduvAxH5Wf14m/+eEv/Fz44ZlFDVIOTrHfPxOABmFzrAg/HiOoT0r+tueX54FISW/y5VTWJct06iJKMRedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2Twnfkee27OAosTaHBtM7m6m4tYYoTzl+AXbw3wF4Y=;
 b=Hz9ouv+AwUNSete+wujY/EBxQQvfn0PO5eMWG7PrNqf9bvcDvyLf+ADvd4ZkzuCB9Jv4g3UZxNkixcB+TFCkYlKHQPMhT1eByGoNoqevfepnheuz4yFhaL5jDS/Z5vhNqVwzn8euqkP4cwHOE00c0OJUWHibJJObB5Tun4TDVs8apLoCBZsIjlAKH8A0apU7c3GW6iB6rUWZ9DE8ad+8H4YI+IqsS+HJTWBpCfEEeu0k7gCZh23+2TNOUL9MIWkO2VeQytoYzWbZzPyidifdLXLdgL3aA5QzYdAMCFuxfXKu10XFmVAhwABOODgjWw2DmtjpA0/zHYKjIO6uryiBGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:36:09 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:09 +0000
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
Subject: [v1 resend 07/12] mm/memremap: add folio_split support
Date: Fri,  4 Jul 2025 09:35:06 +1000
Message-ID: <20250703233511.2028395-8-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR01CA0022.prod.exchangelabs.com (2603:10b6:805:b6::35)
 To PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6e0693-94d2-42e0-b3c2-08ddba8a6370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEdoVWJnbEEvVWlYRzlGYzRmcVdQOCtzSTJ3UlRZaHIvYVQwOVN4Q1NPZk5a?=
 =?utf-8?B?K3ExcDFZTUsySjVQMHQzR0h4Ry9BWmhwNlJ0UWdPV1hhQ20vblV3cWZZRFQ5?=
 =?utf-8?B?di9ueFU5bnN6b2UxTXVQUy9PWWVLaTRXd2RFcjlLOU5uWTdBblg1SVRqVzRB?=
 =?utf-8?B?OWsycHNENFRSZ1FwVDFrTFdxa3N5cGZrOTFKRks2MXBIbXNJRGRkdUpWNW1s?=
 =?utf-8?B?c2oyODhSYkNDd3kxYUdzYWpDYmVzcnZDM09neGdIQUMzaFRkWDUydS92TWtz?=
 =?utf-8?B?SkpwSGJnTzZlaFN5WStMbHdBNjlKcVVUdHlWdDdFQ3lFUXRlcE9pbW5jUFZX?=
 =?utf-8?B?OGVROEFtQis3MUcwa2Z1T2xrRUhCbEdiSnN0M2NoaW8xbTYvenN2VmUwcXFZ?=
 =?utf-8?B?bkNBQ0ZaSFluREQrQUdWNWIzRDg5dmNhWU5iR3JDb1Q5VjRDdUVpNmlqMU1Q?=
 =?utf-8?B?TmJ3bkFRSGdFRTNsL1RoQjZRQWJhR29QMmlteERGdHJVU2xoVGl5anBVNlVM?=
 =?utf-8?B?bWpWa0QrTUZIbW53aW9RS0ZreUt2allXSWV2SGtnWDUyK3VhNm1sM1lKVE9K?=
 =?utf-8?B?WFV6dDE4aC84NUhhOTAySmVHTi9mMnBOSG1rWGhqSHlCczNrdHV4TnJaUmhC?=
 =?utf-8?B?ekVsNkIwczE1cnFkc1lHVDkvQnFHS3lSYmkwbVBhSnk4RUhCSjBqcUF6Zitp?=
 =?utf-8?B?R0lIU2kyWUYvZEE0bzNyS2xDVUJsZTF2VFZZU2tMcEwvbnZFcjMvV25kOGJS?=
 =?utf-8?B?ZHZoYndlaWhvWUoyMDFjbVZ1MFFvZnVNWjBBenhMMlYrTHpuOUxZYjBET1pH?=
 =?utf-8?B?K1UyZXNKZFFYaUFLelFWUVpvaHVzb3VRb1NEVTJEdUZmNWlOREY2TmhXWjRQ?=
 =?utf-8?B?TFdmem5HdEY4dlBsU0JCVzhIZmVVVDIrMjBpS1phYm84VFpKOVU1MkxkQVRY?=
 =?utf-8?B?eEd5S3F1b1pmdVlqdDJ3aEczSHkxdlZ1NFNVblNsbHRKcmluMXFLcDZWMWRa?=
 =?utf-8?B?SGNlcFU3bXRHYVk4WlRFa3V4Z3RjMVA0cWx5aWYzTWZDbXBOUjJQRlJ5Mm9v?=
 =?utf-8?B?aFVNN3NlbXVNaExtYmpWZWJqZk9KM1FINC96N3dnSkNLVWsrZWNsb2JRMnJI?=
 =?utf-8?B?VkJDclo1aTlpZFppd0ZsaXc0VWZpME83aFhUczNXUTJsVGp3cTF5dGVwd1l2?=
 =?utf-8?B?VUlQUWlMbmlIM3lWZHdNYlJCRTAxb0hjTGtlUXg2YjNzSU11T3c0V2RpTW5z?=
 =?utf-8?B?dlp1dk9oNk43L1pIL3BoNENPNDdhLzdwK3RaT0Q2ZkN2Ly8vdUNRWFhFSFZC?=
 =?utf-8?B?aWt4ZkhrNDUxUlV6ZjU0Ynd6MFFDeDZ4eVVoZzZRcXVkS3RlbmRaSHdjZ2Y1?=
 =?utf-8?B?QUk2MEZyL1ZwOEh0UjVqMXp4Kzl1Wis3M3duVzZ3ei9zYy9ZQzJkUU5kWnRU?=
 =?utf-8?B?QWR3eGxrWTVCUS9XaWRXNUNGbWJYZjNkM29TN1hHekZXMjRpYktLalFWbVll?=
 =?utf-8?B?RVduNWVEK3cyNEpIb1J4Q0kzU3VHOHUzMkdjTHJpcjQxN1Y1bVUzWHdGbHFv?=
 =?utf-8?B?MW5xUzhPZzV4UFd5dzNsMHp1cHRRVzFzWjlDUHFoYnV2Yys4Y2RjWDdXODRE?=
 =?utf-8?B?QzR5Q3N1R1RyUE9ubGhMZkNjZ1ZYNjZ1UUpHYTVZZ2ZLcTZvM1phaXkvY2dx?=
 =?utf-8?B?b29TS3Z6eC83dGpOQkF1SEZ5TmxuQTNJNFkrM3Iyc0Z4bEJGNnNDZlphZ0VO?=
 =?utf-8?B?SkJoeDExZDdZZlZhN0lWeTZCU1cxb29XbGxVTGl3cVNKZFNlUHVla2ZmSVlC?=
 =?utf-8?B?dTZ4bHN1OGZBdGI4dkZZOFVIbzN0dHp0VFNEblR4RTdMbzViNmkvM0JhUUlj?=
 =?utf-8?B?RkpNYThZNHppNHRRYVFvNlQyY043bXhHZHphWVlESWFkSDI3cWRpcDllYVhy?=
 =?utf-8?Q?wCBQSD5boBE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFlFTUJ6Z3Y5SUFkd2cwUG9hc01CNVd5b01STlhvb1hhNkc0MUQxVFdJcU5j?=
 =?utf-8?B?ZlRQUWI3TVBCcE16SXA1aTdqQi9kdHJWUUdnZ3dhRHBCenpHaUkyUTNQVlo4?=
 =?utf-8?B?eTkxdGVidXB0c1V6L2lGc2lWMXhVZENOZFEyWTBMenRDY0hJbFhySVFtR1Ar?=
 =?utf-8?B?T01RRGlQWnJtemJxcDhjckNuN1hOWjNMWEhBTU4yNnNLYS9TUmJiTG5SQkt5?=
 =?utf-8?B?UHh5OFliek1jV1c4RUJwNmYzK2pXbW9YR2s3ckN3RGlsKytObU1iWUxxOGVM?=
 =?utf-8?B?SU4zek41bWFnZjFNLzhLaEJsdUJsdVh0VS9SeEJzS1VQVytFUFljaXYrV2J4?=
 =?utf-8?B?Q2hMMktibklOUWRUREo1UE5ha2piMzNxUFhaK2dFM1B5SStnbDdmOHdXRVFY?=
 =?utf-8?B?a2xXQ2dlZFVUejk4a1hyYXh3MlFFcjRjUkljM01NeWMzK204NHJRSmQ3aTN4?=
 =?utf-8?B?YkpWZVhjSDROQWxnenFXaERDb3E1T2RYeTBYTGNpemFOM05XLzVHcHF0Tys4?=
 =?utf-8?B?K0hyMXZibXd5QWIwQzBXUmJ2ZTBpVXZtdUtCVG5PSk45MnJTZkZ0UmV3aThz?=
 =?utf-8?B?NjcyTXJNSisxQlFCWjNPV0ZmOUVQVTZtWVQvQkoxK29kNUxYd1pKQmZ0NFVo?=
 =?utf-8?B?Nlk0eWVudW40RzJHQlZWTDU5K1ZZSG5xMXI0QnRtVFNQT3dEWFQzNmdlUm5L?=
 =?utf-8?B?K1A0WjNLR1RrUTJKc2FHT1k1UkZ0cjd3bWxDUG9jTERYNC9uSjVjY2Q3eFlq?=
 =?utf-8?B?SmhScEU0a29xMlU3OXAxQ3I5ZVY4YlNqcm1EajNMdjhZN3BtV3FydEhiWG02?=
 =?utf-8?B?ZUx0a0UyN3JTcFo0MkRPNEVyWkpxR3hHV1AxcmN3UUNNSURTeHB5T1RrU3JS?=
 =?utf-8?B?TmtIbW5wZFBXSUQyTmFFMWppdVdxOEVYbFNlOFA1ak92QXRRT0JpOElpY0lD?=
 =?utf-8?B?MWR3UHFLYUtoUi9xeDU5QTFGZExYSEFuaGZvMHhib0FaWEFWTmF1dnloK0sr?=
 =?utf-8?B?NkV2V1VYRWdKWlZsYW5vVlkwOWtxTW9UbDB4NmZ0S1Q2QVlHSlVvTzVKbVRj?=
 =?utf-8?B?KzkwZU1RUGhKYjlWb1JlMW1zSktSOVhvWHZDdk1xRGozSStqeUhsbUJhcXZK?=
 =?utf-8?B?d1lEdGJYVnBJT2FUOHZtNlJYWm1HK2Y1cytBN0xQSVdSVmJCcHpKdVhBdm1J?=
 =?utf-8?B?cnoxOE5FVFVreWMrSk80T3NqV1l6eGYrS3htNUV5bmlUaGVjQzByVkZEcGtP?=
 =?utf-8?B?c1dzZE5VcVF0YXNJeWVSeXRXZUNkS2dNRVQ0SHlwb3d3ZGFhL3hINWlmYTdN?=
 =?utf-8?B?ajMzSG1aNEJHcE9nVDZ4UWpVOVRTK3lteTNZNjV1SnpMNUNVcy9DSUh5UlJW?=
 =?utf-8?B?RTZvckV2UnY1MVg5dDVJNkRxOEJCQktpbjhuMy9kcUEyN1VlVHRPWW0rTzFw?=
 =?utf-8?B?ZktPaHdINFE1QzNtNEMwVm9LNFJCVE5Cc1VrYWVFOWhHRlZpZWJkY0NzN3I0?=
 =?utf-8?B?YVZ4S0NrTEhQTHR5WkhhcjR3Q0ZJSG5xSFMwMGxxbzFwL2ZMU2RUbFJRTGJX?=
 =?utf-8?B?dDNlK0F0RGNTNk1FUnZYRkpKZUNYNXJkbU02OUthWU1OcFY4YSt4OEZRZWFQ?=
 =?utf-8?B?NlRVdjhrQTJMdUJOR3ZnKzZNZ1FmTXh2eVRDcjJyMWhUNndKR2Z6cjNoOS9n?=
 =?utf-8?B?aVlxaUdRWVQ0TEV5aTB6eFdLa0JWeXlnTzkrQXR4QlRMKzVLVjQvNE9aV0ZN?=
 =?utf-8?B?ZDJYR1M0S1Vhb3UvSk1ZNjBTMEVhUE1xYjltem1LUUM3ZmYrazVuWWF6QzNj?=
 =?utf-8?B?T0RFUVRlNDhDRE1RN2t5Q3ZaQmVzM1BHMHRKNmZzZkhyTDVHR20wUm9sQnky?=
 =?utf-8?B?L1hQZkVHUFFOS1BML2RqSFppTHcwRXppZmc4a1B1MWlmM2RHOENKS3ZiZ2FO?=
 =?utf-8?B?OFRCNEhBbDdreU1BaWNNbnBTd1duRDZrek5JNFo1eUpIK041SDhsOFJlZkhr?=
 =?utf-8?B?T1dZdFJOQ0RFVTZkMms5ZTBqQ1U5dWs4SHR3R3Nwdkg3eG9IbVpVeDQ0KzNz?=
 =?utf-8?B?MmNKK2ZyUjlmWWY1Rlg0T3BFMHNIR0lmODJraExPclMxaHczSVpxd2F0N1g2?=
 =?utf-8?Q?a4il8M/tCZsJ9Y/9GHAw/vdaz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6e0693-94d2-42e0-b3c2-08ddba8a6370
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:09.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qK+GwPH0om/3RD7wlovPyRl3jhIoTF7bKC1uhrMeMrCSoaXwPZ5fgWYnop/ZYWvX2QjDh4c77PaAieT7Bs4TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

When a zone device page is split (via huge pmd folio split). The
driver callback for folio_split is invoked to let the device driver
know that the folio size has been split into a smaller order.

The HMM test driver has been updated to handle the split, since the
test driver uses backing pages, it requires a mechanism of reorganizing
the backing pages (backing pages are used to create a mirror device)
again into the right sized order pages. This is supported by exporting
prep_compound_page().

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
 include/linux/memremap.h |  7 +++++++
 include/linux/mm.h       |  1 +
 lib/test_hmm.c           | 42 ++++++++++++++++++++++++++++++++++++++++
 mm/huge_memory.c         | 14 ++++++++++++++
 mm/page_alloc.c          |  1 +
 5 files changed, 65 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 11d586dd8ef1..2091b754f1da 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -100,6 +100,13 @@ struct dev_pagemap_ops {
 	 */
 	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
 			      unsigned long nr_pages, int mf_flags);
+
+	/*
+	 * Used for private (un-addressable) device memory only.
+	 * This callback is used when a folio is split into
+	 * a smaller folio
+	 */
+	void (*folio_split)(struct folio *head, struct folio *tail);
 };
 
 #define PGMAP_ALTMAP_VALID	(1 << 0)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef40f68c1183..f7bda8b1e46c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1183,6 +1183,7 @@ static inline struct folio *virt_to_folio(const void *x)
 void __folio_put(struct folio *folio);
 
 void split_page(struct page *page, unsigned int order);
+void prep_compound_page(struct page *page, unsigned int order);
 void folio_copy(struct folio *dst, struct folio *src);
 int folio_mc_copy(struct folio *dst, struct folio *src);
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 95b4276a17fd..e20021fb7c69 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1646,9 +1646,51 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
+{
+	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
+	struct page *rpage_tail;
+	struct folio *rfolio;
+	unsigned long offset = 0;
+	unsigned int tail_order;
+	unsigned int head_order = folio_order(head);
+
+	if (!rpage) {
+		tail->page.zone_device_data = NULL;
+		return;
+	}
+
+	rfolio = page_folio(rpage);
+
+	if (tail == NULL) {
+		folio_reset_order(rfolio);
+		rfolio->mapping = NULL;
+		if (head_order)
+			prep_compound_page(rpage, head_order);
+		folio_set_count(rfolio, 1 << head_order);
+		return;
+	}
+
+	offset = folio_pfn(tail) - folio_pfn(head);
+
+	rpage_tail = folio_page(rfolio, offset);
+	tail->page.zone_device_data = rpage_tail;
+	clear_compound_head(rpage_tail);
+	rpage_tail->mapping = NULL;
+
+	tail_order = folio_order(tail);
+	if (tail_order)
+		prep_compound_page(rpage_tail, tail_order);
+
+	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
+	tail->pgmap = head->pgmap;
+	folio_set_count(page_folio(rpage_tail), 1 << tail_order);
+}
+
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
 	.page_free	= dmirror_devmem_free,
 	.migrate_to_ram	= dmirror_devmem_fault,
+	.folio_split	= dmirror_devmem_folio_split,
 };
 
 static int dmirror_device_init(struct dmirror_device *mdevice, int id)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f29add796931..d55e36ae0c39 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3630,6 +3630,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 			if (release == origin_folio)
 				continue;
 
+			if (folio_is_device_private(origin_folio) &&
+					origin_folio->pgmap->ops->folio_split)
+				origin_folio->pgmap->ops->folio_split(
+					origin_folio, release);
+
 			folio_ref_unfreeze(release, 1 +
 					((mapping || swap_cache) ?
 						folio_nr_pages(release) : 0));
@@ -3661,6 +3666,15 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		}
 	}
 
+	/*
+	 * Mark the end of the split, so that the driver can setup origin_folio's
+	 * order and other metadata
+	 */
+	if (folio_is_device_private(origin_folio) &&
+			origin_folio->pgmap->ops->folio_split)
+		origin_folio->pgmap->ops->folio_split(
+			origin_folio, NULL);
+
 	/*
 	 * Unfreeze origin_folio only after all page cache entries, which used
 	 * to point to it, have been updated with new folios. Otherwise,
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4f55f8ed65c7..0a538e9c24bd 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -722,6 +722,7 @@ void prep_compound_page(struct page *page, unsigned int order)
 
 	prep_compound_head(page, order);
 }
+EXPORT_SYMBOL_GPL(prep_compound_page);
 
 static inline void set_buddy_order(struct page *page, unsigned int order)
 {
-- 
2.49.0

