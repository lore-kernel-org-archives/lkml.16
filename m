Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1521481D
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747507909; cv=fail; b=CmfRy+aoDwShzBRhUFuuREZtBhat7j/M6MWOqCliLmvO0F96W6B4Ect5Ov6p81d4WFQHnsXv5PIH5bApgBtNN8T+bOlyd1bD/xa8Cuujdo+azq13WkSjWr1rIQ8e5fNHBU0mtCfeLd/I3xlTx/bLp8LLDNPrj0sNT+1xgzFaM68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747507909; c=relaxed/simple;
	bh=st/6EvTwFsElHd4A4/+flWF6jUrLr/bGvlof0KMzT3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A/RRXyxObF2/xHuXLqsclZeSiCa7Er/OcHetHffTO7hY5sc9uNorkBv1SN/hD3Fin+ou1WtlVmzHyajvO7fX/tyiCiiqqzy6m0CZjN4++bXh86u71W7+bKDrn7euemE7W6/ekyfHO/KyRSLupyj9yx4or8Hl5RgrAT88P9323RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NyS4mrpS; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NyS4mrpS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fd3LkKlgoR8Nbr8VvAmv1m48YkV+41YnNMkdlY0KqD6cxspllaoYBgcndJ4CbpA6R7zrcUL6zcw2XUOBeNPrJjywO/34btr47pzf9mprtdRRseec0gMBWXrYO4FMJ4ihn4ptM5MUCtQOdUo8b081u2ctsAZcA/ZxNeZqZC3HWmVMfviTJDFcal9/avmTrO4NtRjWezdr3FvVkD9GCH24lT3h9rGftwhvXjKu2CW6Flu79o5BOh227ot8yB0qZUDRuhSL70HezU81niWv9ipmtaUUQBOAMAgUqm4M9U1YG3YJYwfJDMgX6PDvC+qhREz9T8MSn5jYALSPhVe+H13l3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF+sX931u23cGMu75MOf+qT/rbwV5x4nifDoqw6A2o4=;
 b=bEaTjcUedMzOu0f81NvmIUb5yOdMJKA3SeO8ETgJHjX42ZK5i1irbijkGzKoFNkOkQ2hDl2nDAugWgBqHUj36/0XRKabjw/wZx+fC1CJUcQwErZFlj167rhJwJaWrrSNq0jWQ31DV9a4o7kjT8WJ0wvRqJPdDrHRmO0vmlYoe7Ln8xlt6mWriJ67ER1bUkTxrNGOJAMF+PbbTgAsSmZGFWldX4pWQ2OUNEXFOj+SS3FLsSax+N3NYRALJ0Bbz1vxA+0eAA1J7xIOkt3iPVZW43ecz2THyxdnDUQLU28xdYTkEAYKNirR+HwgEYTFMYc6MUDREM5EaDeVOsAYKZWEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF+sX931u23cGMu75MOf+qT/rbwV5x4nifDoqw6A2o4=;
 b=NyS4mrpScGZ/4MHScv1iikH0auaXip5i18NKwQ0/b9EqOQ+6t139CYWvDXWLURtVC4U8VdTlZbby2XAhhOLFpf+IfNrvZRbXX+ZeWX/MdDCpFLKtrhP8YuI3QDxge9EvJcp/cdnaQTPIcwI10t5lxEf/XPW0jTPyojlLukX344PPDAxCKA0KtRlIXqFWMskgtSBfB7bS6jNHDi121DwUk1UUJrtNHbHaiKLrFcoEYRkiCZ2XvFKbJvD4pL8sjV3ZAK/xOBwYyoruEISDtD5zbDjLnEGlSrRSvtxa/Vokkzfi7tcOYEcMLyfsMGhlsyifxi4ZfZ4QmLguiCmaGjlZzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 18:51:38 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 18:51:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: Juan Yescas <jyescas@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Sat, 17 May 2025 14:51:36 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <8E999CBA-6F55-4DCA-8BE3-569B1C537802@nvidia.com>
In-Reply-To: <20250510010338.3978696-1-jyescas@google.com>
References: <20250510010338.3978696-1-jyescas@google.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0787.namprd03.prod.outlook.com
 (2603:10b6:408:13f::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d7696a-ac04-4da8-fb1e-08dd9573dae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WsMk9buWHtoXlbneSKPa3MjPZjqbK8MkSYFnXayD9uFJsabcXuXN7DoqhqL5?=
 =?us-ascii?Q?2O0aKP9BEFyT7mLUaIK5EoIe+fN44HaDepoilE8764Ill9J2g7HQ15L56lRw?=
 =?us-ascii?Q?aWy5dNF76Je5Al2kobJvLrh8Hy5I4JDB0d1H9LoCJ+1KBLBEfdSwzaaqOiuU?=
 =?us-ascii?Q?HJhBAkBv+wdNFlhdwHeU8W2m9KMxsJCeROph8RCzYCphoXrNoqj+gJIzRzR8?=
 =?us-ascii?Q?QE58+MnDtRqCCXJFvQCKca/opVEexQjVHQ6hC3iWzAgiCGJNnshYMTcIZKxN?=
 =?us-ascii?Q?N8gea+ioItDCi0up9RgG16wxJq0Luep32YD1ZroggiDEVk05j/HeEIHJs3Qd?=
 =?us-ascii?Q?LOeklr3gdzvDOInoFveYc0wxK589hy+jlbf8eMhff8LC8Jm3Z6zMjkTQtLne?=
 =?us-ascii?Q?c8URFrsnLi6PIwcmW4HL1u4D/QfxyzLTVBrZAUVhkAY6C8Ng/WWzFT5tqY9g?=
 =?us-ascii?Q?jTB6MvFvRSHmk0nc055fIazS2aDL9yKSJ+0DFAvDNKgqKbgQeAr3Az55gfFo?=
 =?us-ascii?Q?v8pfy10Vh3qZ3e87O4xmH1/dFVgdnoF0LmMlgR2YPzOWELiV7EIFC/fs+C75?=
 =?us-ascii?Q?bGh3hu6FvNlhWWm4NeK42o7nRj4niUrN50SyJWkuQaXWSbbv/sPTAaN7t7ul?=
 =?us-ascii?Q?cav4Mzkm9w7eCM2++9AsLcEMDd2tXhVuPGVtlqPqSPLPbBVp5TutQznpKDip?=
 =?us-ascii?Q?QC7gN4mndvGxsdWWtjFnYyQTil+GBBB/4dg8q3s2KEeodCEkjHML6bWfwE3I?=
 =?us-ascii?Q?0BD7DWrDLl2jTINSJKYy3WN7pdetH6mT5NMpk1P2P0ozSyYnyvCshkKucTvW?=
 =?us-ascii?Q?aGDyjgzOXIKzHQPTHd2/TFn0rmYBIljYm5DtKL+aIZMWG00xsj8il7cDUCwu?=
 =?us-ascii?Q?AuH0QH19nF10y4+ZqlI32Mnwwtp1w2kjNzyPvp/KBJ0TvWoV0ky6GRMHAnmf?=
 =?us-ascii?Q?bjQ7b4fVQeYIGX1G+WQdUOPgsp7YwjvGEA3GEXAVU4AGVVx2wna1N61FBD3x?=
 =?us-ascii?Q?SwWBE5818I/x9OcYoG/TPrHt+0sFbYB3VU7Ti2RLU2kdkwfMwGLYhnWFfQNZ?=
 =?us-ascii?Q?9K3F9hxYFepPXFHIivxD9qwNkGaezZoqMZXrbNFwICGZUiMuoYY9cHjJ2ahb?=
 =?us-ascii?Q?T2o1MzT4KGI52Xqev4jNqAAIdKXnKVL+3BJa96Z59bYicNoeGdz33Vv3jBRm?=
 =?us-ascii?Q?X9p/Dy4W4RLzuFeloBiTOsuaaDdEmCIdaPDf1Xv9XNViGa5dU+ZiWUzp+wof?=
 =?us-ascii?Q?iRk81b6rzqXwNarG8dH7Z/JakHLIzN04CR79oNyL7Nn19Mwg7e05Yb4jf6oE?=
 =?us-ascii?Q?qhWviHWEFZOS9v101TBevWrABi2/he48Uqotdqh6EmrlQ2pwzOzZqRmPuetB?=
 =?us-ascii?Q?GlZDMrxr4w/6Kh7skszYnUQKnnT7TDl5/8x2/OxQ2bokWc+jj8GhSZ6MCysN?=
 =?us-ascii?Q?xWj1dAHxwHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/bNBvcoUE4NWcX67KGrMVNDatQCcXQY8DkxSl7amZ8R+Rx/g/zis2Kw+sRJ3?=
 =?us-ascii?Q?CgvH5tBnxQz6RTtm6iUCzoYy5wmBzcybTuUCaDyZ/wrwkA5Qz/ZCl0dSZZZ2?=
 =?us-ascii?Q?J+MK8ZfQgCSrADeSju4fgWcbXWvydDWMOK/VIyhopgDRAfKvD0FF3b3VplgY?=
 =?us-ascii?Q?Pyy717FPfo4nMA+X+nGZL1anjy2Ae+ENC2LwEaq6kbCr2A6qMYH4zmgj0he3?=
 =?us-ascii?Q?gf1n7pc/BRieLILjvb1rOqr19tyUhm8NBj+h9lPL8UA+rC3g1Ke2VnKWiaKS?=
 =?us-ascii?Q?rJWD9371+hdLBiVVLuKJVjl0irRJIW0EMUqek6wQg/VkZyQtexbi3l40M4tH?=
 =?us-ascii?Q?niH6nw3sdymwZBDdAT0b/3dGEY4u7MHTZw/VgjORU/3DAMnQU3uV1vePx1sZ?=
 =?us-ascii?Q?Md7LEsynwZPD9BadHuq9gzDvN0Roy1BaPfzNH4Aq7pYH2WvAzLGHdlARvYPE?=
 =?us-ascii?Q?GBTiiEw2DAq7Wo6hry8Ssm7a1CM8uivzbMNh/CdVBThVmN9RiPx+ef+5rEvI?=
 =?us-ascii?Q?VfEAEOHepcuBEyQGZ6PBtdZmPZ4NX/z/mbASkKnhkMUEpYyywL1ePkGHGkeq?=
 =?us-ascii?Q?FCHuqOx0Te8BDHlIPtgeSovvYgxpTn+EIyMr3wDwAXdn/Y1k4GugcInOdLm0?=
 =?us-ascii?Q?LFaQx9x6fv47Q/9ey0padpXGMfyqdcqv8z/kd36KmnnTIzk9btF7y9dz4Btr?=
 =?us-ascii?Q?gOrUDT9mzRGxpqdKUOpqlz/oBlZcrmcFT0t2xu+fdeJIbQHSGfdPVPLXE71s?=
 =?us-ascii?Q?Wl0SZXNWM1kcGs6MzQ5RR1GAfttWr3y1X9t1Y/QJS2OjOBIADHsylvH3++kq?=
 =?us-ascii?Q?yfaj7g6xqfNXw4Ps+dSDtu7yA3LQd3IFfy/+sos2AFH5o8NOh9FM1uWgVihx?=
 =?us-ascii?Q?35KU6Ku0+C4nxzfqTIgm6Lg2heEK+j8lInFFcyTufvo2If7IUlz48r1KHIxo?=
 =?us-ascii?Q?5pbGqYkE7KXq3qMCx6O7K1LVPXXuBCyuO7fxZ7aEq8YGpnre8QZRqw0on2RN?=
 =?us-ascii?Q?5YNcnxTz6byAlfkxteW/zALmEE++oj0SDiax8yBdmETSnAN+KJwvGXcX5Km2?=
 =?us-ascii?Q?eTXvy4hG1Pb9uurxu3dZO64oEu1MlkL0SgpC/s0opcgNQgz2yJoeneM6MXlJ?=
 =?us-ascii?Q?dGmgU+oOrY1y71Sca5ymRdQNtVgBQAyFuOEq89aaiHBMxHX/KuyF5DilzUYi?=
 =?us-ascii?Q?NRcfFJqH/P06wEd9EOEJAk0JuQBrX5bI4gBA55NfHaQ3Aoib3upuJ3Z1bZGn?=
 =?us-ascii?Q?V2Mg5UFRndpfCJWhrJYQnA/rYLpr+eLvfA0M6CzYrgwxwIiqZlqaUv4kvnBk?=
 =?us-ascii?Q?2cZ5eieU6QL5aHjt4gssZ8g+hDMdCJ0bcD9/W8+L15SN4iU48vTzyFkxS64Y?=
 =?us-ascii?Q?q03Bp+mvwRn+a2kW2a8wvp+m+KC/VImdtLFGlLkKIXZ4EU9q/6ajoxfydn64?=
 =?us-ascii?Q?oYYyz8JhVuwAbDix8zt7rtOJz0RHfwBQjRWf1SmxKpkhGhhDKwRCBLEB2IIK?=
 =?us-ascii?Q?9Si0/sDevhpbmF3Hlsfr0lwm/OUlJnJ3IWqUiNP7OyGE0e8PFZ5mfp2BRABk?=
 =?us-ascii?Q?ZKzRUVt3Uu0CLuCYa2vOUclRx5YPPldYY3gNyqu1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d7696a-ac04-4da8-fb1e-08dd9573dae0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 18:51:38.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82GOoxmh1xLqsXm5tawE0LNS0WgPPSZoZbpUJr879OnxoXctUvr82B1fFOMdz9AH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013

On 9 May 2025, at 21:02, Juan Yescas wrote:

> Problem: On large page size configurations (16KiB, 64KiB), the CMA
> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> and this causes the CMA reservations to be larger than necessary.
> This means that system will have less available MIGRATE_UNMOVABLE and
> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
>
> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>
> For example, in ARM, the CMA alignment requirement when:
>
> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> - CONFIG_TRANSPARENT_HUGEPAGE is set:
>
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
> -----------------------------------------------------------------------
>    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =  4MiB
>   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>
> There are some extreme cases for the CMA alignment requirement when:
>
> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> - CONFIG_HUGETLB_PAGE is NOT set
>
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
> ------------------------------------------------------------------------
>    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
>   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>
> This affects the CMA reservations for the drivers. If a driver in a
> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> reservation has to be 32MiB due to the alignment requirements:
>
> reserved-memory {
>     ...
>     cma_test_reserve: cma_test_reserve {
>         compatible = "shared-dma-pool";
>         size = <0x0 0x400000>; /* 4 MiB */
>         ...
>     };
> };
>
> reserved-memory {
>     ...
>     cma_test_reserve: cma_test_reserve {
>         compatible = "shared-dma-pool";
>         size = <0x0 0x2000000>; /* 32 MiB */
>         ...
>     };
> };
>
> Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
> allows to set the page block order in all the architectures.
> The maximum page block order will be given by
> ARCH_FORCE_MAX_ORDER.
>
> By default, CONFIG_PAGE_BLOCK_ORDER will have the same
> value that ARCH_FORCE_MAX_ORDER. This will make sure that
> current kernel configurations won't be affected by this
> change. It is a opt-in change.
>
> This patch will allow to have the same CMA alignment
> requirements for large page sizes (16KiB, 64KiB) as that
> in 4kb kernels by setting a lower pageblock_order.
>
> Tests:
>
> - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
> on 4k and 16k kernels.
>
> - Verified that Transparent Huge Pages work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.
>
> - Verified that dma-buf heaps allocations work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.
>
> Benchmarks:
>
> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
> reason for the pageblock_order 7 is because this value makes the min
> CMA alignment requirement the same as that in 4kb kernels (2MB).
>
> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
> (https://developer.android.com/ndk/guides/simpleperf) to measure
> the # of instructions and page-faults on 16k kernels.
> The benchmark was executed 10 times. The averages are below:
>
>            # instructions         |     #page-faults
>     order 10     |  order 7       | order 10 | order 7
> --------------------------------------------------------
>  13,891,765,770	 | 11,425,777,314 |    220   |   217
>  14,456,293,487	 | 12,660,819,302 |    224   |   219
>  13,924,261,018	 | 13,243,970,736 |    217   |   221
>  13,910,886,504	 | 13,845,519,630 |    217   |   221
>  14,388,071,190	 | 13,498,583,098 |    223   |   224
>  13,656,442,167	 | 12,915,831,681 |    216   |   218
>  13,300,268,343	 | 12,930,484,776 |    222   |   218
>  13,625,470,223	 | 14,234,092,777 |    219   |   218
>  13,508,964,965	 | 13,432,689,094 |    225   |   219
>  13,368,950,667	 | 13,683,587,37  |    219   |   225
> -------------------------------------------------------------------
>  13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
>
> There were 4.85% #instructions when order was 7, in comparison
> with order 10.
>
>      13,803,137,433 - 13,131,974,268 = -671,163,166 (-4.86%)
>
> The number of page faults in order 7 and 10 were the same.
>
> These results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
>
> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 times
>  on the 16k kernels with pageblock_order 7 and 10.
>
> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
> -------------------------------------------------------------------
>   15.8	 |  16.4    |         0.6        |     3.80%
>   16.4	 |  16.2    |        -0.2        |    -1.22%
>   16.6	 |  16.3    |        -0.3        |    -1.81%
>   16.8	 |  16.3    |        -0.5        |    -2.98%
>   16.6	 |  16.8    |         0.2        |     1.20%
> -------------------------------------------------------------------
>   16.44     16.4            -0.04	          -0.24%   Averages
>
> The results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> CC: Mike Rapoport <rppt@kernel.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Juan Yescas <jyescas@google.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> ---
> Changes in v4:
>   - Set PAGE_BLOCK_ORDER in incluxe/linux/mmzone.h to
>     validate that MAX_PAGE_ORDER >= PAGE_BLOCK_ORDER at
>     compile time.
>   - This change fixes the warning in:
>    https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@intel.com/
>
> Changes in v3:
>   - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
>     as per Matthew's suggestion.
>   - Update comments in pageblock-flags.h for pageblock_order
>     value when THP or HugeTLB are not used.
>
> Changes in v2:
>   - Add Zi's Acked-by tag.
>   - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
>     per Zi and Matthew suggestion so it is available to
>     all the architectures.
>   - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
>     ARCH_FORCE_MAX_ORDER is not available.
>
>
>  include/linux/mmzone.h          | 16 ++++++++++++++++
>  include/linux/pageblock-flags.h |  8 ++++----
>  mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 51 insertions(+), 4 deletions(-)

Hi Juan,

The patch below on top of your v4 fixed powerpc build issue, as I tested
it locally.

From 5c2ae4dfca135e99da45302e4f5d96a315a99603 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Sat, 17 May 2025 14:49:39 -0400
Subject: [PATCH] fix CONFIG_PAGE_BLOCK_ORDER

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 79237842f7e2..af0dd42e3506 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1016,10 +1016,10 @@ config ARCH_FORCE_MAX_ORDER
 # as per include/linux/mmzone.h.
 config PAGE_BLOCK_ORDER
 	int "Page Block Order"
-	range 1 10 if !ARCH_FORCE_MAX_ORDER
-	default 10 if !ARCH_FORCE_MAX_ORDER
-	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
-	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
+	range 1 10 if ARCH_FORCE_MAX_ORDER = 0
+	default 10 if ARCH_FORCE_MAX_ORDER = 0
+	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
+	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0

 	help
 	  The page block order refers to the power of two number of pages that
-- 
2.47.2




--
Best Regards,
Yan, Zi
