Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F96293475
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799070; cv=fail; b=EVAxaqyPIpgBD4WDHJosqlNDb0Kl6NBPxxF6Ij5wPbcZttnLUHaudzjnbfNkRu/8L5/9bP3LJO+hJ6qva9CD9lROZeQLTtSxiS0w87hhEjGfRPSqniFiEQ28N2x4iCdyzpy3NzCZieCPpwfFrItANU0gdVDTPK9TPIzrXuWSomk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799070; c=relaxed/simple;
	bh=4MmUVwH0JOLQSKgToKiFh4qtwoyqb3zUUXj3B7bKHyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eI+knD2Y6+xx/Ndb/qS2HKma6nBQbTtI0nyCuOlWAqFl8ySpq5WiXZ0jPAZdsCgv+p/Kdkdd25cb57nO/4VVo3mVTZXRwI9e9NEr7bf6CWaSrFzkqqs2R+RdSOmLJbRCLFCqS71p13TiGCyuxTCbEtxnCIAD7OP/h4CL5HVOD2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kNdWfC6b; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kNdWfC6b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwrVjEAVqMqsCN6/dtl+jZSnbryBIIq9xdAH64h9iPjldWxdEDRV5nKU5qRqZaqUErHFNxULkwqIG75gzh5TJEJNOgj19kzbUUBm3C8JqAjAosHUztSc4CSvAZ3immKBL6mhHjy61SKM7b3D+3hGZPXSvR7jTeEVzJBg9nSEWsSORcxeMB74k00zW+czjX056VMm5+KrOT1AonkIuBT9W6FworQmRJAEPfLlMGarLi64yoMyk+7XQIoFsbUZcI0FZ7tU0OeWx0X5LTh12C21gykCmxR8EkhL+HvzLHLA8JFIDtmw1Z3Y2J6oduHyOqftqsU7WOrH47znB9IsTOOEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHczbDNbTlaadvEajBVggjpPXlOyPZAhc5Ov3kkMKlQ=;
 b=lwCIAGlMDuYHhCGnrnMKGQhdzNNsdC+p5CdJ/1zayP0KSFvmBsQXeOcYitaqNYVyzwopQ6EbCZtad/03SJb9bQKu44rlAPjCS6muSb7knGykuppRTfgip2oEB+a6yyMQBQ4FZ81dGn/CpYQXRZdXRJzIdtTpeEOGmI08vl7E3S5DR6IVI2SiY3hCih9m+H8qGwjwU80+3MDLaas5mI0g3xuOSpH3uyPAhN1maN/yepqxQFTj+2fft9sD2wDKw+/wH7IbMHOmhyGMlBNolVETi+FBZOAEydG6amkWarjg1UdaqgudRufOp5QKxflj6nLCh4EhDuKoXykJvORyRmI2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHczbDNbTlaadvEajBVggjpPXlOyPZAhc5Ov3kkMKlQ=;
 b=kNdWfC6byjala3cOXAnOi8pJzDg/WIGw1aUrIJH8Toffd9MCtrPLlrpxvpTQ568M5jJNL0XHynywJiBt+ipXA0Q6dnflREz3Zjjw8BaBtnE5wZKYHBUd8RbmAtr5aChk8yMjTBxSv/wA6SShcRzGsCPj+rBhmqY177rXZAsK3BnkDg30cvwWtEM/1wlS7eE15EK1aAYQqlS7xz19c7cECkGRaInke6rtmjumwLl9BxR5lueBOD6xlvVXXekuvQu1fMkyiJwQnPeXY1wQO15rDvfWE5yPeN30AuMpktyHwMwM8i0hZRKOxlMksjQCBaNvOjUqnHjCq/zFtzgAGrkSjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 13:57:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 13:57:44 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Fri, 09 May 2025 09:57:42 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <E40B7150-70AA-4D51-B5F3-4FF22AD887FD@nvidia.com>
In-Reply-To: <50BB00FF-746E-4623-8F48-F74209EDBD0A@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <50BB00FF-746E-4623-8F48-F74209EDBD0A@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:208:32f::34) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: a9944d60-078c-4b59-ef19-08dd8f0178b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkJsV1FLdjlrc2pTUjFhWG9jSXhiTm01ZHZrOTNlOUUzU3UyRjUrNWRnbjUw?=
 =?utf-8?B?SUtiVWlEK3FLL3BaNVpjTnd0ckE0YUVBajBxcVVOc210UDNTYnMyT3Zoa3dh?=
 =?utf-8?B?T3lrVEZrTHN3K1Y2WERrY0NKYjBaMHYxWnZib05raTlpSCtDY0MrZkM4S28v?=
 =?utf-8?B?L1ZwVU1GSC84Z2FQVTlZTmpwbXlsRFBGZEovTmQ5MWV1aHphcXJWZGt4NFRU?=
 =?utf-8?B?WlppTUQzYjh1bkVkTU9PNjh5MlAyWUhHNC9leEl2Vm5zdlhxVm5NZjZUZlpB?=
 =?utf-8?B?bnVJZDAyL0FaSFdCSzdvNnFBN0owRU1sTWNYWlEzZFFEOUI4UldlYjJzc29Z?=
 =?utf-8?B?WlFFNjVKbENRWEMvNm5IUHdkMmJ2MnFxZnIxVVVjUWNxOWVOZ0JsbDNDUzhk?=
 =?utf-8?B?aXhFZC9yeitKdVBvdjVoY3BhN3lPdGQ0RE8zNFVEZXVXUnZDTzRXSVdITjVB?=
 =?utf-8?B?Z0FRakVaNVZxR2ZSSUFDTHVSNlRidGlWZjhCRDRvV0FHeVhTcWRmRjJCOXFy?=
 =?utf-8?B?RjdueHcrSU0zbDFVdTV4Nk5JeDl6QysrcHE3WEJPdnlacUpkOGhwVkppcUxj?=
 =?utf-8?B?ODA3VlFSMVMrVGFHU1FaVEpoc0VYOUlldUQxZkFFeHAvcGdGMnI4RXFyMzBy?=
 =?utf-8?B?eVFhRG1mL1lJdkdYUkNtSWJKeFh4TkMzbmhPWE5PdFE4WmRpQWtrTEIyekhM?=
 =?utf-8?B?ZHUxQlUzMzlIUVFxTUorSjcveWxBd3VzRCtWOXB1R3dNd0tWSG0wL0gxNTBj?=
 =?utf-8?B?Q2IzNXBIQnJvSnNzTTBIditoR214TXdIeU80cTE4eGpqbjBKbUoxc3pRQ05k?=
 =?utf-8?B?MW4yU0toS2dvb3JTVDhNRFhjZTExbDIrTC9tOXdCeGNBV3RTaEFrNnEzRy9O?=
 =?utf-8?B?VXk1cTNyeS9icG9JTjB1MjNEdDB4d3poSE01ZjJmUUpTR01qYTdNVjFnQlJQ?=
 =?utf-8?B?c0VEOG4yZmU2bVo3SXNzaU9aRjl3UDRVTFFxRFlnVWdHUGI5d1VWNnpQaHJV?=
 =?utf-8?B?cTMwREorc01td2p4V2FySE1ibTQ1Z05PdkhUWkhJbitTNEE1UFV3a2NSbmps?=
 =?utf-8?B?RTFuUTVrdGtMOTdRQW8yb016MkZGQjNVSDVaSXVUQmtVdUZJdnF4VHArYitn?=
 =?utf-8?B?Z3NHSnZ2SmRmRVdpaVBjLzBjSGY1UFh6WC95MGtFTit4dWV2dzdPbUFsblFF?=
 =?utf-8?B?eG1PN2ZwdXgrQkIrSDg3YUx0Yys2aWxNK3hNeTlmNGVNUDlnNWFRSzU3dEo0?=
 =?utf-8?B?MW5jUmNjckFHQmxhUnJ3UFFRUEtId1RqdmxWU0dNTUZPd1JuSkJVeE5oRURB?=
 =?utf-8?B?RzRPTVJqUnRZckFkUHhhNGlLUWZOR1J2SHorb1Z3MGQ1eVJrcFdiOGlQbGpv?=
 =?utf-8?B?WkgzRVp3NGpKQ2lURkgrUUJuU2dmWXhZbStJdW9PV2twQVJpUHk2Wjd3N3Jp?=
 =?utf-8?B?aDBVaHQwUFdGK1kwYTFON3Z6KzFjS3hKU2VnZ1gvbHptR29MUU9ZUmJ0WmN2?=
 =?utf-8?B?ZFB3cUlkU1FMQTY5allsRjdDWXFzbVhHNEdCSDlnV2lhVlBvQnYrVUdQd0FE?=
 =?utf-8?B?ckpVZTNjRTNpUWJmdGp4cU1KSlZPSnE1SWtxb2JiU0VwME1QdHpkYjdSQ1c3?=
 =?utf-8?B?TkNNVWlJR2RlVnVNWkhOZFIzUEFSU0g0NmplSzBxeU1hQlg4SkYza2ZtZUFF?=
 =?utf-8?B?aWtrT3FlWk8yNmxpQW1QQmpIQUhjVjY2a1lIWWJNTktveStxZGR5K3RZTElt?=
 =?utf-8?B?VWVPMU84b2I1MlNiRFNjOTRnSmdhdU4xUW1Yb1VEK0p4MXpKK0VTYWNnMWV2?=
 =?utf-8?B?akEvR3ZWbHpjMXVscnAxMkRMd3hZcDN4Vm9WVk96QUlYMU5rT3hQcW5Jd1dZ?=
 =?utf-8?B?MXB4elVYYzQ1ZDM0d1ZQZGQyZnNQQVV2cEdrSHh1MnF5RVRTZUhQZ0VnTmN5?=
 =?utf-8?Q?CcEx5UIDaPY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVNWdis0RmdUVElrVGpjVVZBUlMrWWtCeURMYm9Yd0VFTlV4aDdRUXlORm1X?=
 =?utf-8?B?WHMvQ2dNUkQyWmZPMnNHNnZvelNXUStlT05DSjVVNXFMcmNVUUNaZnovYkpw?=
 =?utf-8?B?Rit3YUpGRU5yZkNuMDZDRXBTc3FFNTVsV1hacE1yOUQ5YjRjSXg2RzBmYU93?=
 =?utf-8?B?bEdtOG83SklvY0p1SmYrd1d1RWNiMlQrbGUrbmFJVjJLZXorRklmWEFYZSsx?=
 =?utf-8?B?NVYwcmJxVnVhL0FnbmxzdTBIVUY0bTg5MXJycUE5OUEydVZwMXFsaGt2cEtm?=
 =?utf-8?B?anlzTUVBOTN2VzEzd0J0ejdURGJjSitZY1gvR3pKZXNFaExQUlppTlhFeERh?=
 =?utf-8?B?T3JwY29JWHB4aGJqYzM5SHMwY2kvczFsRE0wcTNaY2p4b3JySlIrSXprMGhL?=
 =?utf-8?B?UnJUTXNRMHlGTzdEdDNKRlNJeFBpOGxFQkd2STBURVAxd1B6OXNMM2hmbVNE?=
 =?utf-8?B?NXRXNmQvR2xaNWFpenVzaVhrdlQ4MS96UFIwNnlJeHhZMHdRUldwRytHNUxU?=
 =?utf-8?B?czV3VkJxRkpDVGxML2syNVdSOEdmZFhZOGFkQlRFVU1DWW1nWkRoNWlCbWVU?=
 =?utf-8?B?TG5TTnFkMjFBRUVLQlF1OU5KOFY4R3Nkd0dHbGxvcHdFVHRucjVFRXFNZkdj?=
 =?utf-8?B?dzd3Mi9KakM3M1BJamFGMDNvMlN0T1pJTGJZVHNWcmlHdmtvd0Y1WUtpOUtI?=
 =?utf-8?B?NWp5OWNjYzU5VzltYnQzM0pERHpkVkpQWk5hZm5JeUQxcVlWQjl1eEIzemxv?=
 =?utf-8?B?a25zNzREaUk3eHZJUUJjeFdQTnRKYXBWZzNBQWo5NEl4VURiUjFVV1VDTHd4?=
 =?utf-8?B?bmZiNDlxM2MzdjVuais2WG9sbnV6VHpvb2tRamdibXVEdkNNQjRJWTZMd2NT?=
 =?utf-8?B?eXYzeExqQ3pTRU5uNFlCVVNDcmVZclo5Y3N3dkZYL3FIK29TM1ptUVd4K0kx?=
 =?utf-8?B?SnZrS0xYUTlqMUhxWjJEcFR4UE5pY1pqSkhOOHhCR2xWV3RWYmY1UFcwcTJX?=
 =?utf-8?B?cjBxdWo2V2J1dFZYbTNqRWswNExLRUhXaStwU25FSS9VejNMbG5DL2Z6VWlP?=
 =?utf-8?B?YlZtK2tUWjdKTlAzTjdrVUlReUV6VmpTZGhkL0dVMkFxN2E1bTFqbmxhZGNI?=
 =?utf-8?B?Q3ZVWTZGN2lRTFBsRXM2QVVUUDVBZ2VDRFdhbk9wWUt5NktodnBnb09PdU1Y?=
 =?utf-8?B?QW5udDlHZWdDWkI1Slp6U2ZORElPaWpILzJEUTNYZXNUc1dpbEVaSTVqcXF3?=
 =?utf-8?B?c09GNW9vYWdkK1lqWFVsaXNuL2MyR2ppTm5lVlU1WWQyWktJWmdPTFQvN3VS?=
 =?utf-8?B?blZXbXYwQlhDenI2TldCOXlCSWdxSnF3VWw1eEhMU2tFUzZMV1FKNFdEcGJB?=
 =?utf-8?B?aXJSR3VKa2gxWFdHU2ozeXc1Rnd4czQvK3kzWkZtQ0xOeitaK0ZjY0RxTUpB?=
 =?utf-8?B?OGZkdEI0dk02NzhlY09oSHJhUXFMamxNeDlRbXlwbjlRUGVtU0xZZm5WQWJ3?=
 =?utf-8?B?U1RkR2VUdUlRMXlFdUFEa0Q5emUyR2dTSWZqbXQ2aFI4Mi92NDVNbWNYQ0RZ?=
 =?utf-8?B?bS9LSU0vSnZtS3ZMaXlEZXRFRnlyRDRIRGY3UjZLQ3NvVXpHaDNaWElTN3BY?=
 =?utf-8?B?bkMwaU9CcG0yR1ZGOWg2TmNZaHRGaE9VMHdpb0lhelplS0pvc1cvdGVXVDA5?=
 =?utf-8?B?aXczS2RxMFcxTmJja1ZBaDNaaTlGczV0cjlKNzREYTNrTXNRdUVnT3puUEto?=
 =?utf-8?B?NDhnWFF0MG5mMEdLUzluZEhXLytLNURnWGszOHk2cGpBcDRJd2I4aU9FYXR2?=
 =?utf-8?B?UWRiRTZ5YzB2SG5SeW5yd2F3UVpYT0FxV0lpTEo2RGFwN29FOVkyYkZWQW55?=
 =?utf-8?B?ajNTWVFHWUp4aUVFNThLa1lpMk8rYjJ4WmM4WGZxcUQvcG9CUnpKaHRuYlZL?=
 =?utf-8?B?QWEyeElUS0F3QjU1Umd1WjhPQmt1dVovMWtONlRlbm00WDZmZFd3NmkwcWFo?=
 =?utf-8?B?aFROd3hGZUFsaHc2VHZaTDAyeXF5Nm1VL1I2VHJQWjAvTDZjR0E0QzBXNGhn?=
 =?utf-8?B?M2N3OWY5S0Zub1NFMTg5TzFyUm91VTBVcmtBelo0bW55N3JCckgwSzMrTHlZ?=
 =?utf-8?Q?Ae+U1/zXu/BrDDp9yC40oRqVd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9944d60-078c-4b59-ef19-08dd8f0178b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 13:57:44.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz2PL8C44IGRiO9mlA6eVYTEOJT2YLG7cv46OPLBC6UxUsxZPe/7Qo3BKX6g6sZo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687

On 8 May 2025, at 16:22, Zi Yan wrote:

> On 7 May 2025, at 17:10, Zi Yan wrote:
>
>> During page isolation, the original migratetype is overwritten, since
>> MIGRATE_* are enums and stored in pageblock bitmaps. Change
>> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
>> PB_migrate_skip, so that migratetype is not lost during pageblock
>> isolation. pageblock bits needs to be word aligned, so expand
>> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  include/linux/mmzone.h          | 17 ++++++++++----
>>  include/linux/page-isolation.h  |  2 +-
>>  include/linux/pageblock-flags.h | 33 +++++++++++++++++++++++++-
>>  mm/page_alloc.c                 | 41 ++++++++++++++++++++++++++++++++-
>>  4 files changed, 86 insertions(+), 7 deletions(-)
>>
>
> Here is the fixup 1/3 to address Johannes’ comments.
>
> From 7eb1d9fa58fdab216862436181e5d2baf2958c54 Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Thu, 8 May 2025 12:05:59 -0400
> Subject: [PATCH] fixup for mm/page_isolation: make page isolation a standalone
>  bit
>
> 1. keep the original is_migrate_isolate_page()
> 2. move {get,set,clear}_pageblock_isolate() to mm/page_isolation.c
> 3. use a single version for get_pageblock_migratetype() and
>    get_pfnblock_migratetype().
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h          |  6 ------
>  include/linux/page-isolation.h  |  2 +-
>  include/linux/pageblock-flags.h | 24 ------------------------
>  mm/page_alloc.c                 | 25 ++++++++++---------------
>  mm/page_isolation.c             | 17 +++++++++++++++++
>  5 files changed, 28 insertions(+), 46 deletions(-)
>

Hi Andrew,

This fixup gets rid of the unused function warning[1].

BTW, this series gets several fixups. Let me know if you think a V4
is necessary. Thanks.

[1] https://lore.kernel.org/linux-mm/202505092126.yRGhLhg1-lkp@intel.com/

From 126d116cb737bf3d8c475460b9b48edc6696e6dc Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Fri, 9 May 2025 09:29:09 -0400
Subject: [PATCH] fix unused function warnings

1. add __maybe_unused to get_pageblock_isolate(), which is used in
   VM_BUG_ON only.
2. remove unused set_pageblock_isolate().

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/page_isolation.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b0f83a7c508d..ce7e38c9f839 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -15,7 +15,7 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/page_isolation.h>

-static inline bool get_pageblock_isolate(struct page *page)
+static inline bool __maybe_unused get_pageblock_isolate(struct page *page)
 {
 	return get_pfnblock_flags_mask(page, page_to_pfn(page),
 			PB_migrate_isolate_bit);
@@ -25,12 +25,6 @@ static inline void clear_pageblock_isolate(struct page *page)
 	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
 			PB_migrate_isolate_bit);
 }
-static inline void set_pageblock_isolate(struct page *page)
-{
-	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
-			page_to_pfn(page),
-			PB_migrate_isolate_bit);
-}

 /*
  * This function checks whether the range [start_pfn, end_pfn) includes
-- 
2.47.2



--
Best Regards,
Yan, Zi
