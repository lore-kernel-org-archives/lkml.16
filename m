Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB12F2A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749085666; cv=fail; b=gN3fCMEpExmFZEn6jX3+fFCKShsLR1s+WcM0qHO6W4AwXSAz9hs4tOWBS1M1KvPonJLq+yDY85ki0rRUHE6rCq834gnfNSn+FrbFb5QNDLlt6cXwo2yX9rgXTqi9LCVUXMlLOhabdljIDZv/sBFIxZzQn44bEl2dgM41n9gIIVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749085666; c=relaxed/simple;
	bh=sH/9lXdfmLn8rvCt1H/D2imzL3wRzzzjIqP6sWzi6+s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=buqXKPUs3P+g6x4wZhOc68xzG1Du/72m7kMuUhDKPpLCaDVC3EKF9KN51BpTY97TWJJQAi6iTDLs/e1ZBvOvPLR5xlau04EJtQdq1UaI2ptsbs9b883YsJbLv9AwqGIze34UIydraooC+xDOS40Jjp37wFQZ0zNUk30eozjlzZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nxv1LLm0; arc=fail smtp.client-ip=40.107.244.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nxv1LLm0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uazg2QJvLwAqC5RnSeH15eDfTgQ8eguro6FxG8tuiWWE1FdHRz/LZn1uKajEvixzfZT4NRm/Pck2WDVKY47Yz0ILEoXu5G9t0U+YT45pNKW3hlC+ZceAcLwZ7wFa4bQZ7g5baVACOGS4RWi8S7/onrdX9ielcrm8c/q5X8GLssdm5AAh0YrCbFfFawgn1tt3lN2o7co+LJN2DV8lwwjSDa0FwEwt9S06yMZyPV3GODITwhIvhHIFSsonkZpaMCxOdBQvTuSKjoNMxlEdLmh73aXgCmYGwLL5X7CJ5JaQHbHLsxL+iwPJKx+Bn2rZWCYeyHUn3fSBT2fphcd8AH6Nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRtumIrAUon4gTqGDN09bfxNIXJP09VYk1yNAXv6dn4=;
 b=alwysqZbYgklpXsjLmnNAmvJ5xxijAsVp8n4tZRZA15XDCYriDESFVEA4LRy+yJ3hRw3jRvbKWOY+jfycy4EnxBoo6jKqjUTpIYpcIQHIt4JRBRJneBpXX/I2TB/8quObl575rMs3DLONaKiMBjIKIumGv2v8NOT4EknZs9e/umrw7yvryrP4PcDXzftcKvAnUchJi2x+8al0xeCJKSrlf7B8fv7LtwwPZ+3TPYCZMW+/jERRJqZKtYLMnL46gQB828Wk6GO02H7Erm7NMlKWbFc2UK7qqQbAQGmYaHNXBrbOJyGyA+Q3lkOPQEmLnb8WXST0r5U0zU6hyCduLEB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRtumIrAUon4gTqGDN09bfxNIXJP09VYk1yNAXv6dn4=;
 b=nxv1LLm0Lk9/eG8pGqJ39LSqmrAlugydGpYAemlWUB/SynYeja6sEGY+LTssuWIoXCSglAnwK9xeT2A0ZUEAL9LVRfv/Jv7+bEmQyOky1hREnH9NIX5OQmO6fACB/t9CH2E8aT/poiVS5LOfaxXoYLAyVFpJeKQwjj7/XWCV9E4cXrPywU83BVvN44x4DFmM/GQmhdVgbpjzfRhnGLNZV58ToIBckM6jYfSFqAdsSPhsueuusMprP40aSVs9feVRmIKK4OvaSUfr8J2kpTDBM0y0W/OR2/D76rQa3oalOk1lklEvZSbAnoG+RCjrTh+wyNjB1ZPEL3Pr/31xzsMT6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 01:07:40 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 01:07:39 +0000
Message-ID: <d08f2cb4-f76b-4ffb-b6fa-2a5a419fb86b@nvidia.com>
Date: Wed, 4 Jun 2025 18:07:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250604140544.688711-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::10) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: ba561e3e-6eab-40f1-0245-08dda3cd5dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODY3N2FvZkdSTWNyUG5mMGxHd2hRYVBsUmE2QkprTFg4b2kxckMvNGVRS296?=
 =?utf-8?B?ZEpCTG5EdEZVN1M5bGMvcGJoNnVLMEoxYVhydjZjeldXYllma0F4UUsvM0lj?=
 =?utf-8?B?SndNQy9rcXdEbmJORy9NRWtHaWNuVU5ZWllMekdvTUV4MVFuRldKUEFDTlBR?=
 =?utf-8?B?SlhFdXlyWXY5T1VTakswbTNTN283b29CdlRiOGI1TEdHUWZ6enpoKzdVdFlL?=
 =?utf-8?B?OThUMzNuNm03ZGJXR2k1MS9lZE9qaHJ5R1hrM1d5VnI1aVAzcWVNc0ZJWGFv?=
 =?utf-8?B?Nm9BMm56eFB6YndXTEE4ZDcvM0JMcTdLVjhPVXlsMmVkZ1A5TStnQVZudWxl?=
 =?utf-8?B?NW9ZTlFtWXlFa0ZKYkxiSU9tTitiVitkT0c0ZU5vbFFURm1UL1B3bytmUHo4?=
 =?utf-8?B?UVFZNy8xUXBOclFtQm40dmF6bENSeFM0V0ZLVEltRy95VTdsNFEzeXJXY09Q?=
 =?utf-8?B?VTM5VytERzYxazJkMkRGQkZrSmxIYW5TaTRKK1pEU3N1bDd5TE00SjhRTEwy?=
 =?utf-8?B?Ni81QVYwclBrVzZOb0pOY3ZtS29Ib2I3bEltWmVDL21BUHV5NTlnUU0rZjlB?=
 =?utf-8?B?TC9nU001WVV5am9heWdLU2xaZU41S0hYS2dxQktXQUtHd2hyajlDMk5JUVc0?=
 =?utf-8?B?VUNFTEhQeGRWcUpPZko5cllFRURyZTNHeEV1RUlsVVBycnZWT2JJSFNUTW9G?=
 =?utf-8?B?dVJJSExoUWQ2WmlReTkrQ2FSVk9TWmVIakR4d2ZWU29rN1RvdXVqaGNVbkpy?=
 =?utf-8?B?b2srbXlKcC9IU2VkWHI5ZFloSi8xelI4NEZ3bkpOVjlMYlprQ3ZFYkFjMlBn?=
 =?utf-8?B?bTJMb29EUVZ3QXd6eWJRK2RrMkRRUjVmeUhYNVpaMWVsL0JPOWg4ZGlubUc5?=
 =?utf-8?B?Yk5tb1Q1ZjZZQXlvb1RoUmdYTGZzN2VMdHlOMHFRdWcvMkszZDlrSDdEckUz?=
 =?utf-8?B?djJuenlrNU95d21sZ2x1SDZuNkJzM3ZRWHNaOVNXQnp4VXpIMEN3NmVpSWVE?=
 =?utf-8?B?Y3lBaFNsNC8rWVVkTkpWV3dtbHlNN3FsdkdzRHNzSkx3TWVFeGtqOGNweCt6?=
 =?utf-8?B?ZFZUVGRCWkhSalFYZi9sSmRsdFRGWEx3SFVDb09HSFBXMEJKclBBYXJNV1Zs?=
 =?utf-8?B?QnRzR085NU9YMlBLc1k3WGFSYW5lUng5Z1RlTkU4a2l5ZE9nZFc0dG5qUThm?=
 =?utf-8?B?VTZsZ3lUcUZhM3ZpZzVNb3NBYXhsVFRkT1h6ZzhvS1NjclZRYXNyYzA5SktU?=
 =?utf-8?B?ZU4wMG92azZLQkt6N251c0l3eUhXZTZkUnZvSDlPbUxrSkxwR0F4NGJnSm50?=
 =?utf-8?B?TWFFM2xxQTY0UWRYVXFmV2VCMHQyLzViS0FXeThFelZxcitaOHJzWVRGOHVy?=
 =?utf-8?B?dkhPdDJYZ2hGN0x3NXVzNHhtMVJLd1NPK2NiSFl1M3liREFrdXZkYXBMTmN3?=
 =?utf-8?B?TTgwZ2Y5eXRJb2pkTjNnaWlFL1VNNE9ZZDM3NFkwcTd3bUhRbW84MTZ4azg2?=
 =?utf-8?B?ZFhrbDRiZEVvWTZOYkhnQkU2a2R3TUFGUUtmcTRET0xmWTQ1UHlnek1DaGFQ?=
 =?utf-8?B?NlVBZ21aSENCbUNoKzZQeS8xK3Q5aHljdElmQzNtVFkyRWxzM09oaS81emlM?=
 =?utf-8?B?TDh3T2JhaVVEb3hRM3pDKzd2ZCtTR1lockJKZ0JhOFVKUHZOU2xlQ0FjcEVJ?=
 =?utf-8?B?TzEvajlyaXRObVJjMkFrSzh6ZnFuNldBcFByMytSYjdIRVUvMXZMMzhGdmVS?=
 =?utf-8?B?UFEvMnRhV05SejhOb20yQ0ZHemdJbWdGUkZ5YU5qV3pldWZoeHNvSXF5Z2NX?=
 =?utf-8?B?MCtzV2R5YWNvc0NQTG1zQnBZSmUvVTd4YlQrdGd5Tk8xUXFQbjBtVE4xQkFG?=
 =?utf-8?B?UUtqTW5ONk5jTFR0clMyTFdPUGNwK3RVMVM5TWE0bERhcHJJYnZHMnppZ3VM?=
 =?utf-8?Q?T1VzdKnVr2M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUJBZzRjSW82YXVBVXFVY1ZzY0U3V2dNS0RBOVZGZGJKb1BZVlVjVkpqOG5M?=
 =?utf-8?B?aTJhQnk3ZkVxM0IrMjJpQUt0aDkwS1BwUklwRkROc1VFNXRUcHhKZFUrNkpt?=
 =?utf-8?B?QjV3UjMvSVVOTXVVeVdxbmtSemlkcW4wbXJZeDhaRkR6K0VObjVLcGx5eVBF?=
 =?utf-8?B?UEFudnNxNVEwVVUxUjF4ditGTTlrcEl4TUVIZHZwQmdnbkg0b3ViNzNOU0w1?=
 =?utf-8?B?Rkg5ZEhEOUJOUjNONmE4eDkvQThCNE9TN3hkTEpmNngyYjdHNVZVWjJneUhK?=
 =?utf-8?B?TDYxYUVia29VeTZPT1E1MHJWQ3hTTFZ1VzhQOG56cUFDeW55TkErSDA3S1ZC?=
 =?utf-8?B?T2lEVjhpa0tDZE42WUc2TTVGY3pwMFN2QVZvTDMxUGVENDArazZxZXFVVkNW?=
 =?utf-8?B?UmRvWmNmd3B0MHAyempxWEw1SHZLRlpjeWRyVWlCME02aE1naWJVN3Q5VzBw?=
 =?utf-8?B?QWdxdnVDeFRDVHZqSk5SNWo5c3lxY1Vzc2pOdXRiM2xrV2w1OWNwZmhQUDBk?=
 =?utf-8?B?NDA2dHIreEM4Y3o4U0JyendKOENwZURXemM3MWRVTlhndkptTHU1cTl1Sy9n?=
 =?utf-8?B?UVFHTFpCZFR5MHVoK29JQ3NmNVNqOXpFUE93K3FPTi93RHNoR3JqYnRLdnly?=
 =?utf-8?B?VmFybnZ0U0NpRWF1dHFvQU94amVnOVBsRkRENlROeXNZSGRjVFU4VjBpZTJk?=
 =?utf-8?B?NzZBYU0vRGx0dkkzQm8rckhZRDI3aVlSeG9YeEM2OE1oMVpwUUs4TVNXR054?=
 =?utf-8?B?YnQ4YkRMUStjcS95byszMDZlaFBpTjBGYnVxMlpFalVkdVcvelc2c0Q1eUJC?=
 =?utf-8?B?WmdwTzh4dGY1Ui9hVHR5Z1dza2ZtSU51OVpJak9PNmtQVGZTYjZwSjNic3lz?=
 =?utf-8?B?VWRNcEpRY1hpVDE2TkthWWRnMEhXcnpBb2FqN1JCeWJqbWlsaHBYYUdGQnU2?=
 =?utf-8?B?Mld5UXdKbm9vS2VBLytmOUNpaFFOdWFMbm5WMFYwK0pXVGd4dHpDb1d0elRj?=
 =?utf-8?B?MXdHL0lwbGtRd01Ia011MElWTGlla2drcnR4WElqck9ZbEFLTnhsc21pWWpD?=
 =?utf-8?B?MlR1ajRWeGVHTTBHWFNkUDZrcEpZcENFUGY2d0pKd3UzUzhoSHZNRXIybUpw?=
 =?utf-8?B?VFBJUUUxd0xjRVpSMnJMclVWM3duUk1vZWFOcHhXQ2RieUZYdXV0aEZqc1BS?=
 =?utf-8?B?N2MyY2h3WGUzTFg2cFhDYlptMmNRYU82TklBUUllVnpQcHhYSTZtd2RKckQ3?=
 =?utf-8?B?bUVVdVJwdkdiRVpBVEYvMzA1Mm5jS2EzWU4rUlRFZWhHNnZnQjcyRHdBTTBN?=
 =?utf-8?B?eWVESHlIQUFHQ2k5TkRrRUMrZGp6VXQ4Z0RkaC9pbHQ3ME9NS2pLN3dLbkIv?=
 =?utf-8?B?Z3UweGlidnErNnpmeHdLbEQrMU1jcUFicHI4V0ZZQ09COVRCWVdDdVZCR3p6?=
 =?utf-8?B?Ryt5UnM3N2h2bUJnaXR1a2Q4dWkxTitSSm1veU14RllCcTZDOWhJc05QVDJi?=
 =?utf-8?B?R3AzOE1NUHA4bkErdWdLbTF2VUxrR3dtSmV6REl0dFhNb0VpWCtiU1MydElB?=
 =?utf-8?B?LzRKempuODI0V0N2ZUF6amZRRlNublBIcWRZS0pXWUppeWVuSUxWbk9FZDgw?=
 =?utf-8?B?N1RsUHpDUjFEMllsRVlSYkxmUTF4YnpvOFlHQmYxMEhJaUNaK2pOdllxaUQz?=
 =?utf-8?B?dkkvWkxkb2I1Y1NNY2hINDVocmNjQ2ptdlNBZ1VmNUZmeFMvUHI3dHpsUlJu?=
 =?utf-8?B?SVBsTkdHRGhiZ1dqWkN5dnZ4U2VvUXVzUVl1Yzk5WFE5ZkZ2T1FnemsybTZH?=
 =?utf-8?B?YmxGTWRsckZzM2lBV050cXMvM2R5eVJjTFdaYWVqUjdKamhBMmVFMy9wTzl2?=
 =?utf-8?B?dEVwbldHVlJZRS95L1RnZjJiTE03ZXVoMmM3c3F2U0gveHg5MXZqLzBjdi90?=
 =?utf-8?B?TFVLWlFuV0F5VHRVeFJudzdEZGd0RG9aSC9zM3ZtbEQwclJpaFI5a2hjNXNK?=
 =?utf-8?B?V2s2NnRVdzFuV0hmWGlnazBpZytlWXo2enJaOHhGSDRaZFFFNHQxWi94NFRx?=
 =?utf-8?B?ZWVyQ09PNzMvYnV1bFVodlZjcm1EMktUWGtQSnpDVGQzN3I2NnVZQStwRjNR?=
 =?utf-8?Q?/SRx+HR0yhGmbwYLiwYZFPNbF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba561e3e-6eab-40f1-0245-08dda3cd5dfa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:07:39.8802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgxonBD+k0envyyCioQpsVRwXyQblCKmA+LQr0MNLmV1FR+ZfQWNyzVCpWV11N34PcvHH+hKYMkplp95A92NHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691

On 6/4/25 7:05 AM, David Hildenbrand wrote:
> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.
> 
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.

It would be a nice touch to add Linus' notes here, with the BUG() history
and all. It answers a FAQ about BUG vs. WARN* that is really nice
to have in the commit log.

This looks great.

Looking ahead, should we also *delete* VM_BUG_ON*() items? (Not as part 
of this patch, of course.)

In any case, 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> 
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> happen", but more reasonable to check for during early testing.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Wanted to do this for a long time, but my todo list keeps growing ...
> 
> Based on mm/mm-unstable
> 
> ---
>  include/linux/mmdebug.h | 12 ++++++++++++
>  mm/gup.c                | 41 +++++++++++++++++++----------------------
>  2 files changed, 31 insertions(+), 22 deletions(-)
> 
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index a0a3894900ed4..14a45979cccc9 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	}								\
>  	unlikely(__ret_warn_once);					\
>  })
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
> +	static bool __section(".data..once") __warned;			\
> +	int __ret_warn_once = !!(cond);					\
> +									\
> +	if (unlikely(__ret_warn_once && !__warned)) {			\
> +		dump_vma(vma);						\
> +		__warned = true;					\
> +		WARN_ON(1);						\
> +	}								\
> +	unlikely(__ret_warn_once);					\
> +})
>  #define VM_WARN_ON_VMG(cond, vmg)		({			\
>  	int __ret_warn = !!(cond);					\
>  									\
> @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
> diff --git a/mm/gup.c b/mm/gup.c
> index e065a49842a87..3c3931fcdd820 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
>  		    !folio_test_anon(folio))
>  			continue;
>  		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
>  		else
>  			/* Either a PTE-mapped or a PMD-mapped THP. */
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
> -				       !PageAnonExclusive(page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
> +					     !PageAnonExclusive(page), page);
>  	}
>  }
>  
> @@ -760,8 +760,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
>  	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
>  		return ERR_PTR(-EMLINK);
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -			!PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	ret = try_grab_folio(page_folio(page), 1, flags);
>  	if (ret)
> @@ -899,8 +899,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		goto out;
>  	}
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -		       !PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
>  	ret = try_grab_folio(folio, 1, flags);
> @@ -1180,7 +1180,7 @@ static int faultin_page(struct vm_area_struct *vma,
>  	if (unshare) {
>  		fault_flags |= FAULT_FLAG_UNSHARE;
>  		/* FAULT_FLAG_WRITE and FAULT_FLAG_UNSHARE are incompatible */
> -		VM_BUG_ON(fault_flags & FAULT_FLAG_WRITE);
> +		VM_WARN_ON_ONCE(fault_flags & FAULT_FLAG_WRITE);
>  	}
>  
>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> @@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  		}
>  
>  		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
> -		if (!*locked) {
> -			BUG_ON(ret < 0);
> -			BUG_ON(ret >= nr_pages);
> -		}
> +		VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >= nr_pages));
>  
>  		if (ret > 0) {
>  			nr_pages -= ret;
> @@ -1808,7 +1805,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  
>  		ret = mmap_read_lock_killable(mm);
>  		if (ret) {
> -			BUG_ON(ret > 0);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1819,11 +1815,11 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  				       pages, locked);
>  		if (!*locked) {
>  			/* Continue to retry until we succeeded */
> -			BUG_ON(ret != 0);
> +			VM_WARN_ON_ONCE(ret != 0);
>  			goto retry;
>  		}
>  		if (ret != 1) {
> -			BUG_ON(ret > 1);
> +			VM_WARN_ON_ONCE(ret > 1);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1885,10 +1881,10 @@ long populate_vma_page_range(struct vm_area_struct *vma,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> -	VM_BUG_ON_VMA(start < vma->vm_start, vma);
> -	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE_VMA(start < vma->vm_start, vma);
> +	VM_WARN_ON_ONCE_VMA(end   > vma->vm_end, vma);
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -1957,8 +1953,8 @@ long faultin_page_range(struct mm_struct *mm, unsigned long start,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -2908,7 +2904,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>  		} else if (pte_special(pte))
>  			goto pte_unmap;
>  
> -		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> +		/* If it's not marked as special it must have a valid memmap. */
> +		VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
>  		page = pte_page(pte);
>  
>  		folio = try_grab_folio_fast(page, 1, flags);
> 
> base-commit: 2d0c297637e7d59771c1533847c666cdddc19884


