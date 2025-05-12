Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B29251782
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067808; cv=fail; b=CUHcEO3aHUAJtKEXf7gvlqe3o2L1sDy90OWcdpCAu4yoXUWGgdid6PUhYToKE/ipXTPeMQkEjccz2P8r2+xuJP0DIQOkgKAURj8LG/6/eJutU+IF9S/LQy5tIqL5StDjpidhv8uTqAqqAhBGoY+mRtFTmPhM1ZWnEzeU3wu/wR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067808; c=relaxed/simple;
	bh=H2x4gz3nJSDcCtM0t0HkSiYmKblu3p+WrqfKSEHJjeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LG0M8fpy8eTwh0r0CnmYfzXh7BNpvLNQlnoZap0xHjzDH0TcPxg633zxISyiDdiNi6S5UT4yZovIrpz9/kNaKZn22aCrOxibACOE/1QyEOqbCIF9lOrU980llc1UYkFJZgPyUiNKpAFyx5vGkFExD6ELNK6PdrAxIKJdDBHJEjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hy85CeHR; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hy85CeHR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHQn+wsmrqEXKs645G48zhzhbTSEPVY+gdQyH0XQG6FgUxqpCkEOBw2ny4QwK2Vy9Vkpny/wPvJw2ryWE97kGE05q2sEBbVh6SKtkmVmsNrPwO9PX8rEmfca8cs5kgndUYrqEDRoxaZGlMLKbbEyREN1SXut9nNSeTaMSKpagFboFvIuCkkkN0qY8doT1GzZDHRbgl6y6fDwOG9djKvDNeDSFhku2ctwGhMs9HiEx5INiGjtpDO93aJTBemUWe1GRafq9+uDKKYYx/suWE/fpa1OqJUxPjj5wl+ws8yB+rVtFThfo3F+NLLXWH7iwV2eIafpzAUHhrPDUGE8WaTb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caQy/yJq9Y6SdTFDIP76+y+uHo894sK+LLMcczzRjDk=;
 b=dVmcFi27Hx3BrWA3aA2OKCk8WKOZOFC7ZbY8PRHYP18TFUkMTDL3l5o9g+xQ3JxDvYWYy16S2Xei9qaaLVtU8A1P4L3Jb0PQ3vOg3kjgI4bzvi74IW2DC8YV7KmDR2wIkCaMkZtdN6i4oYOVTVoZa7zUho2qhFha8mz41UI0hGyRZSqD6mZH12iVAnQRsfXBNX2MdyVxbXMgtcK7ilnaoEMM0aYEyHg9nqYz1E5uRw3kBCJ/3bCu4py+PFnvY7Vhns0XF4B9Edw15oguZFnqIr713Q4m1IJe+5yk/6kBjwo6DGGGUf7uOFd6wGwlhylBpV0hIqReqPVbzp4eDrEP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caQy/yJq9Y6SdTFDIP76+y+uHo894sK+LLMcczzRjDk=;
 b=hy85CeHRpawnbAymM43NHtFHJ44f/iI1LYP9Jsd+Brbtlroz89huyl8fkf1mO1r054yFvFi1dmym+KGBEQNidqSvUMMkG2+tkhClNwPtkzGU5m5bUlKlNfAVoDBCHV6Se0iZ+QrXg+i2/qAKDlUcxz6S3QloL7VJKiath1pXBJoXIQN0gvLTgb+GMhGAB/ASSl8H1z84x1hWQ7tZU+ISkdc0ttKRxKudV2yyWU4htqKSzt+dYfmCxs4OrUcGka64F/nW/w2uofnGdDoEwScBWbnLqiyTDK5tn3Cs0MPMgXrX7WgxtngiwIkYQIvQ1hhCuynXPPt02MJLU2PU+VcG1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Mon, 12 May
 2025 16:36:43 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 16:36:43 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] MAINTAINERS: update page allocator section
Date: Mon, 12 May 2025 12:36:41 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <08F7FCAB-B873-4360-8066-0C8D74213B74@nvidia.com>
In-Reply-To: <20250512144603.90379-1-lorenzo.stoakes@oracle.com>
References: <20250512144603.90379-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0249.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 453da4a9-cbfb-4032-2929-08dd91732da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AIrzpQrmm8//chN1WfBpxRjXNH4yhKBRs/PvspDIMG3eJuuRl2fQYKy3/bqV?=
 =?us-ascii?Q?4yMuCeiql1UawAc0yZqDmwoLbM5BJzBzEdBCtluPkebj9emQp9kMiVtcE+OH?=
 =?us-ascii?Q?m5+YmoxEmmNzgWoKkfOKPF8w0UOW/Uvk+/C1EQ6oL0LpXdVa3VgnpEQXlHWJ?=
 =?us-ascii?Q?PlTJ6PfGBAoPmeYh4b+RBcwzhl9Y4VgDDKqyn/LcdLnAhiYW3qFArZMLk7iI?=
 =?us-ascii?Q?gcByciR4jj8YDo+K8jOs0tDRaxpVoF4QnQLPZpiSDII2oo1UXJn3Jhad1NUA?=
 =?us-ascii?Q?Iqb9av0YhYenHA8g0CSjECApJnLcgaa0O8rfb4cMHG/wdhSFmfnoSu0wyJh3?=
 =?us-ascii?Q?tFajZeZ1BmVNZM/mB+KzNqw5+ibbuFSV3l8Y7VlmSZdZLKNQBO9jnKdOag2Z?=
 =?us-ascii?Q?Z3fVBuYLkAbCI0Gl4kRUFmTCkpZ5lBA53xORZIrkNrzIIF3Uc5NlqnXcmzAR?=
 =?us-ascii?Q?ocz+Ya26JxGIYAAqyKFxbj4odusnisnpSGsKx24mazGOjvtuM3Dr8t4r1OWg?=
 =?us-ascii?Q?1GkoMFP0za5AVbArOCzMK4Dy7+p7ubyu7Ugjm0hrF+bHUJ9GMk7f3t1SBzGy?=
 =?us-ascii?Q?524lyd1RUchkNEVG3+HYI+6p/ASMAGsxRYvjaSdbxqjbmCMM2NdIaXjZt4Q9?=
 =?us-ascii?Q?gIJydtBw6IzWJwPKlcxgrOSf7eD17Xq51Mz6J12yJKbn4Tq23BPhO21rE6sA?=
 =?us-ascii?Q?EIcBrkyzf1Nl6RK8qwd83gW9IAyqTRT/R6svQWy88oq+AxxSe1uXBTa36taO?=
 =?us-ascii?Q?9Gv803nq5jGxVPMo/4Br1rUaG5Orbw29/HnQELacgmDqC2RhmyOTT6KNNCx1?=
 =?us-ascii?Q?tuCAr1TnVmfeX3dZ/AIeKP9+PkOyM85ORqxCwnlQnFGKu3QfJEBX63R+qznJ?=
 =?us-ascii?Q?nXhQONwPmf8pWI6ZdPOVU9mzpJhlgocvubBgM0hNHIJI8or/NOrwuNr9o9MT?=
 =?us-ascii?Q?Y0ekAdrBQpwSIDj/t5HT+fbghRoa/qzPESsetocYY0Cyg6NTjxWoF8CKkren?=
 =?us-ascii?Q?PkbhxrA8QEYzUcyqLMEeVSjvAjbV7uool3mK8CCZl19Uaakt4CfH+fEDGgHm?=
 =?us-ascii?Q?CjWHW1GspQ9pyqhxb3QCG3fMEibPPZ1vxRmd9NWXqqKdfqS1rFhwyRM8MN0K?=
 =?us-ascii?Q?CYG2voKS+nXgjg7CnCBuLKOom60h5WcZQx5/YG57UNzlXWwRcl7UQRmRIf/Y?=
 =?us-ascii?Q?gSlljuC78tLojM6tVCpts4/ZQ6suh/pbAASm67t+LQODtjHpCqkqWyC6InZd?=
 =?us-ascii?Q?g345ygBQ/v+Da65oTJORXDOtv8vipPxlAJJkTKdwCdguLtLJGq1gpWo5kq7k?=
 =?us-ascii?Q?BMbYRkfFOt8nbgLImwkavchNrf7qrHoQpi8bs8bPUvXOva7gEG59/k3Hxv8H?=
 =?us-ascii?Q?T6osf7cVWSqQMMq9NQjVr1h8LMrsW+iTPxIrTxankM2IzULXA3uLFJpRgzsX?=
 =?us-ascii?Q?h82/qsFtAdg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y5CtLYPlEYZvJxnEZazUDPWaCMQ9SQn9wEZoNjkWR2dgzfmUANs1U66tF4v/?=
 =?us-ascii?Q?LsEJ6UvwuaP0//6kAajoELvSP36gMDZgzMGYJrGVhUep+gz5YOLnGKquSkUe?=
 =?us-ascii?Q?D3xioFH2cp2qPZqx/N5YNOEUDZuDlSX4yliv75CI6r17hq4yn4uPEAkCi6Qx?=
 =?us-ascii?Q?SNDoqFM4XftnR+EwG/unfBiSczW/Wwewt1ztZkKy9Rwcbn5tjqZpNR2mI09E?=
 =?us-ascii?Q?i255ZDn6hm4MknqXb/FF8UOtfW36otz1ym3PXbJFzt5yFyGRuqtLagQoJLv5?=
 =?us-ascii?Q?CZD2OD4Dre7da+UC+arJmzy1LLKCZ0p+EmtGgNT4CsTut/whLRdPMAHMdaFG?=
 =?us-ascii?Q?upQTnvagvdUPiJ/BN/0n0Vx8tq2SztdXOKV7w3yNvmQtDvNjbPIqgYiOIZCM?=
 =?us-ascii?Q?LMYNEAGDIR41J8EcR6thNV4yXXcP832OmsqkLdCoNqcwtREKuBKFtYA5W0bM?=
 =?us-ascii?Q?K7bCMgRxiRDJEXo0Ud7ff+TyT4jcbKQpN0X3kHYa5E2aOjywB61zDl+vJOtQ?=
 =?us-ascii?Q?uzpddQSKIPaDHOC0BHPznNTXu2E+i4+xcoxiSm3YEIYSuxKSWkWeIHUiyrLu?=
 =?us-ascii?Q?q/KvDW1ORP1d4bwlKAUUc8HnqAHlMPzlc86TEiqdgO9lCBA3N2pRRj3clIb0?=
 =?us-ascii?Q?YK0NXrd/rU8aAPUQKpmZ445lPFa/JdLxagi88otfXdH12fd4S4A1g63nqgqi?=
 =?us-ascii?Q?wPZNExq7/9+4ILRImAUZowqB+elAnChIjl6yQPZ2dzaJAf0SmTl1bO/LzaPv?=
 =?us-ascii?Q?Sm85FKPwUDS5ezo6fDTzCXb09pkzu4JNvpEY7dW6lMrCPcdJQSNXR0YpFAjx?=
 =?us-ascii?Q?rA2ZORHm5fMOfzAG8mzIJK5PN2sbHqNBR33EeZQZ9ymlkR3WnJZW/q7qUDVZ?=
 =?us-ascii?Q?AwGk2/FMli0gPGz8nIxMM1TEB3QAv5e6DPfMOWTx9qk3BIwt85HOZl4+TM0N?=
 =?us-ascii?Q?gPEv01Mh/qzgOuhdsQB4jxn7lg4BvXo1OnvoSAOPH9Ak7yZcH+47PAMBIpkt?=
 =?us-ascii?Q?H/ouMN3bEavtZYGnnrRLenDZ3Z/z4wH4XDu4FULVeHZzGDSiceZWVrhOvPIP?=
 =?us-ascii?Q?5Ra4BR9TkJG5IZWoFiI8qv+WyKkV470JWbStO38eF4v/ZGCfAfmEfRfiuCi5?=
 =?us-ascii?Q?UlmsSAVSaA2ttgO1VT50HbyfCD3gVwC3GWkBZ0AD9K56ASPXOpEgM1k5dhUw?=
 =?us-ascii?Q?Wnfi6RSaPVWNTiWukX6dWOsGW2zIrk/p1uPhKzalrc1ZOWvt9M1qxFxqBOES?=
 =?us-ascii?Q?jisQhCD2Hng/KdhFPWcZw3qNgmDiov+lkSUFw419FOPPFa6kpcKl0FGcjccF?=
 =?us-ascii?Q?RB8/VkgBmDmj72QfcniJKot7BocDcb5hH9h075rXUP4WTO0dl5n7/PrJMT23?=
 =?us-ascii?Q?9V3nTOBJVfImoQGeCC/Id259TovQg3Vz2M8cE6A9Fdf9UOv9ULNyhWVF6cbt?=
 =?us-ascii?Q?HG9LL3tjZKefYBM39JWLLfSmp7Qx030IL+sfokCWNr9Q2RdS9cmmyKCwW3Tl?=
 =?us-ascii?Q?Hilsl9rWGEf+WcYB+q8EawAJkCvWk0HRY5jGaphbmwXnHA+Z4a4mkgEe8B20?=
 =?us-ascii?Q?GWImrWo5pwKMM7hwOYQ9cxt8BQwVi25jJGCUDr7F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453da4a9-cbfb-4032-2929-08dd91732da7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 16:36:43.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcGHOGe+ivwmmie6DH7KnwnXiJBLKJK//W6SERQ16BVlI87qVsh+ETZxLXBp25Hf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739

On 12 May 2025, at 10:46, Lorenzo Stoakes wrote:

> Make Vlastimil maintainer of this section (with thanks to Vlastimil for
> agreeing to this!) and add page isolation files for which this section seem
> most appropriate.
>
> We may wish to, in future, refactor/rename some of these files to more
> logically fit what is actually being performed, but for the time being this
> seems the most sensible place.
>
> Additionally, fix the alphabetical ordering of files.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> ---
> (sent original without mailing lists cc'd, resending...)
>
>  MAINTAINERS | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
