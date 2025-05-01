Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55932DC78C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746125372; cv=fail; b=ZawqkhyEOiwSwevwU+T9F+JF297t7UcvXznCEXykVL6NG30/Lm4n+RG/1yFUpos8G7s+Y0bw4Dc4CmSN+gszEZ3NYrCw261tiHnUMmmOd3RzMsWKDQMEKwaKaMydmIyhZ1IYZ6LlT90/kwuCGg+vN8lAsFVMCgVQnG5rZiTPowo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746125372; c=relaxed/simple;
	bh=ShytwsT/wVcdJq74ud7VV067z+j0w+1oz6t9gNyQJjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TIJq6cYWo3BRm4hCb4XRVomcJHASjnxhXwLaLyLxvWriPEG4N6z8WfvpbQVGMXo/yM5tfip7Qnlesqbqu+C6lskidORzWJBfsFdaSfO4Y7FRJZQ6Cex1pb0xfQ8dHn3fAGWpT2GmvW0mdq/FYUp3uoSmkQo79aYrVryC7GmxBIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sP3EXgNC; arc=fail smtp.client-ip=40.107.100.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sP3EXgNC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLCMlpTvwnEWBW/MsICzZGsBGwEkqQ7NtJVtSF08acSk5M+MyGvwxkA87J4g6NjJhyCDC8rYmLK9kqPy/RB/d7yUua6XhXniMnG1/jG4XQ/T/nj1RCxSuNpnYh+GNiE6SlYEveHdUTivo69pICe1+fC5ymF/5Vu7HI5WXIUyQ6ioPTzaHxZBlk0Qc0uTSS4RLkyfy/hOmw88VuQJ4QtIszuZJPGe3LPhOO8sZL8KsonL3c8D/k/tq53d8LUO6naMxUcCyTOAN/GOzIh2vkUAkEr+1KHUhYj+DAOJhZSVYaUBIPTfrcwXZq+ARkf/DNiUISqftnbM9Lu2tERncsLuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LatOSNnxxkryEsvBRI/66HabOiRW4kQiOFbVbM7SRlo=;
 b=aV5WQk3p+4jJpRj8M9FYWpsuzB/JgZm6IdmoCzktFfnCj7GAu+wpw8SIwOYY5rViWBbdlrTMOjA2sXtH16fIGryWkdwE7inejBCIBF8+U4TG7ymq/nBPBNILymHHOZ6zfRCybGmWp0pdT/lqsGgUG6P16OJvU+D7XgfiyaTulxleviphyb8ybFEMVAqSQDaiPqNemxzSloWRuAv+ZvPvlZlHnd2+ew2PSYjVnVqcqsD8t+QK6l0Yx7dKCdHwpX6Qmd3wG6Xo9D0th5rUya/M253cjahF9mB35+LO5NAL2nnPKRco/Xu0sCYd66p0fSCkQ/e9brkOw8gqKjUyb9/L9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LatOSNnxxkryEsvBRI/66HabOiRW4kQiOFbVbM7SRlo=;
 b=sP3EXgNCKqhDNoFWWlzQnXa6kJ8UFvPvlEJq9asX3P8SLKjh4s55URa0Cch6b4ku0hVhs+yTZomu0ROwZHQiv7cOH8d828xTNlNm0Z9S7zTZsd0JDQEgoaF0WdushAFKiTAm3EuKO4FVJdLXD1MSKIzV/BvEsRtcKC9RLQGPBMb/RdeQfpNs1o68HRrj8EHzHmKKERwaP/bp8nyvkRATWhS3mQ/8rOaBSsRHOU13OKHvBRibc8sQHsrYIl4BGlacUpJAg2AoCepYWUdYSNKzIWSESjZKK4s/U636TtyVBkIIEch6GU4eNmo9nboaH1vsvfr9ey9ksCSBEI+KUoxGrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Thu, 1 May 2025 18:49:23 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 18:49:23 +0000
From: Zi Yan <ziy@nvidia.com>
To: Juan Yescas <jyescas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tjmercier@google.com, isaacmanjarres@google.com,
 surenb@google.com, kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block
 order
Date: Thu, 01 May 2025 14:49:21 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <15428BF6-A7DD-44ED-B225-AECD7866394C@nvidia.com>
In-Reply-To: <20250501052532.1903125-1-jyescas@google.com>
References: <20250501052532.1903125-1-jyescas@google.com>
Content-Type: text/plain
X-ClientProxiedBy: BN1PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:408:e2::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 51878c6f-5e4f-4807-ebe6-08dd88e0e40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uynssQ3pvhQLEVC9Hr/RroOxtkLslPsbGfQAbwKSTxFbdiIesnuMek6UMiYF?=
 =?us-ascii?Q?AOxTXR5x/VQZ6eleQKde6Xu1x3FZvodu15vkVAyOYgs9KZCoTdrQ3bi8qXFT?=
 =?us-ascii?Q?AbEvEMbWLkRet46O+jocC1/cIcCA4L3eLoOm3Omkch/BePHB1h+PuBazmTNK?=
 =?us-ascii?Q?tPOl3YNFOZ6hBsx+8NtZUQwZkAGpl2Iv+1AfTJVCGlmxbBI83oGjOhhQAk7w?=
 =?us-ascii?Q?9nKTMOwqmGkyeFNS50HWO4q844ZPZJSi+wDHlSoMeyGuwiTxKA/NSGKc/p4U?=
 =?us-ascii?Q?0/RY6Dsszqkbg45QKmBFv8gaHHvLbPjE0XtbgReahUfkoCis7BtPNJMymPa+?=
 =?us-ascii?Q?YfVZxGEWbYXcNoWdPXfC9gQWNzYHLxFcbyuXDvMT6HBGkn1eFpyJ0jMDGHv2?=
 =?us-ascii?Q?NNnR+65vVvHRIDyS6E1A0cYlrkTUVY9cGrlCzWSMd1BgJBKMzibMTEcR+zWn?=
 =?us-ascii?Q?Wzw4V9yl046oV91irRYFLdJNGJ3mu/1cYJyWkeXGvnP1fz1/W72U6T/vr3w7?=
 =?us-ascii?Q?omqkZWvgVkDnttQl3Mfiv5XIrVHcMuM95jEw3g58dv239bMFSrsHA0d19B5Y?=
 =?us-ascii?Q?KmoikjULHgGdZ6rCSvR/4Xc9KwgTTJ6RT4Sv1qFo41WV3nV+pKji9RDTmr1D?=
 =?us-ascii?Q?W5Q39ieRzsO7TFbtjcHK1O0MNmEo8VsdCPrKY5jWjtEHoiMR/Bjg3yaO8o8J?=
 =?us-ascii?Q?+CkHmz6qGQ6QgVd7KI5Nqu1NxXOKAekcH4zlZVq0eIQmUBIknVGCuQyqW88B?=
 =?us-ascii?Q?vh0SEoETOmSi6Wsrs3MgGkEFAlhq09kT8E5lxpS7o4AEzVzP3mgEFgIPTKZT?=
 =?us-ascii?Q?GWDmryWOpAM4iNZLuGuFfVqNgSiJD03CIfImkKF9nMoQCRNcg24T8AvWAwpA?=
 =?us-ascii?Q?a/r/q403votPN8Ho/+ZBstdIF8LbuA4tRGAyb6FVjVsG8wZYCeBoeQ0ixDpX?=
 =?us-ascii?Q?fwpHYV3YGoG6EzdeGplUswEFH1Px8uiaCsncnuJu8FN69lG328iIHT0B4DoX?=
 =?us-ascii?Q?l6b7wLY38LJ7mAqv4DqRPKQO/P2vcuKGv4e2OVow2rDtAEz6tKX4auKEHRmS?=
 =?us-ascii?Q?3wTzRj1oIdMLlJveIh0QojWj3leTAv0FVNE0TpEmWWCrOBKB8K44QPEaELjY?=
 =?us-ascii?Q?Q2PYKeDSNAGsfd3O6MuzRJQbkkw+PqSpqUTuVpub1I4Ul50J/R8jN4xUCDLa?=
 =?us-ascii?Q?l0211so934Ya0eJEn+ZWxBaXW4kFDvSR5vsrBnR0WTcfPP/bztDedsPH/yo1?=
 =?us-ascii?Q?aghwNvD+sBHmn5XFLtkTfUvf0iNzIKbB66EhdKI0xi/YIjPQ26WiQcyS3b1O?=
 =?us-ascii?Q?1ZwMJ/gz5rKddA9O/hhKb78GXneulV9ciadNuyN4VnuLCVlLNCAek3NhGV2p?=
 =?us-ascii?Q?G/KV81YTCxNF1JhyvvBEm41rZ/Bb0kCdODO/67f9Iqzl1ZZaIMEweBg3wing?=
 =?us-ascii?Q?t7pzbC6KLCQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yz55waXDhT38D00/2Zu5DWjLv0oEuFbgC2Fq1COLcyCXojP1l9tkAUnTXK7l?=
 =?us-ascii?Q?NdS3q1lGjo0azX7bdVictalqt6zNgnqifMOpNq5BogB4umXAKJqDWNUdQCN0?=
 =?us-ascii?Q?dYqN94Vm98cpvnjpAgR35+egiripTGJf3C0bMOLfD4vPPu2ACBbY2iOicMif?=
 =?us-ascii?Q?tpnX3AVBVR/IrwJI5OlkVL1ErD3DPOkuiFJUqAURnGHt2x0WpUqP7z2WpKTv?=
 =?us-ascii?Q?g37MSspTb1RbsJcMpEwTVd4Qxb4PaYqm7kf0G1t/cwzezNnAJ3M6PRSdGomG?=
 =?us-ascii?Q?II+GggfcVf4YSR+WxR84mXJPzjoL4VDLQlzatr1+X4vfxQx/C1+InHfFoKL1?=
 =?us-ascii?Q?DBRsfer6bmjZ/+76LVV8bDHTEbSqwByM5gGU4kgd2Uh7apMmjyoJOaS3AvUd?=
 =?us-ascii?Q?EdksUWqbprhNbiIAOfDsLW9TcxHGOuw4qyfLrF6T/adcemxcDOUimRCcCC7t?=
 =?us-ascii?Q?ixeNk2xf+gfna0UyhkPQxWCMPt+5kPz+y4ewG8nwAX/A6Cd5YcZ6oQyrDtUU?=
 =?us-ascii?Q?rkfT+LkQoafINZaKPBiRCiNVQb6TKdhf2ckyeKdJd5CpwMJoowdKYQ0Sj4vL?=
 =?us-ascii?Q?woB1Hih6xtAFqXxbSffcBhq1zC+1DB8P40thIA/2P6HzxT5UtpSvg9IeiUO8?=
 =?us-ascii?Q?L0gBhaMQ0ejneLARqlDs31bhR1kosBy0u18jgg8YUbv+K8LxhEXTdg+Vmbsa?=
 =?us-ascii?Q?cHLXyi/WQNZVinfp69ZHshWdoVuAB1LCqER1aMRI4/Ehrflkq74GD9Jtx5bx?=
 =?us-ascii?Q?l7qjVWJlI48m4TTkyg9IP5qiNInCox3p20b/SXU13175Gf4xKhVlefs2pPVO?=
 =?us-ascii?Q?qylNsvO5S3xShUqz+8BwvlLIWLVBZl8Ij6jChpVizqpWNtc6Ms0fr9gwRnC/?=
 =?us-ascii?Q?WyKxR03dW8G/+4jfOkbM/OegivGfg53fC93eHXjRuSeyJEcGjLAokvNVuYMA?=
 =?us-ascii?Q?AE9HXGkbAr/DX7Cvsl62bwRKaNruqdtpxa0mHt/2j87aH/xutJATTLbcjCx2?=
 =?us-ascii?Q?o4GEealcYzPdv6p3AnSLMwjhfe6P1xe6YcyHTgnk6nAiLSR9jcdHIh+3Ywaq?=
 =?us-ascii?Q?doCWuzNQjwZbriYJM3F26ofM57H1Nm5zLWgGzCDKwi7Hjc0Tr3rKHv0tN5mi?=
 =?us-ascii?Q?4+X/yRYRL9kO/WzWroiPsC25V5mmdO4Ndb9826nLykZ3OTlZFy7bPRMH+iYO?=
 =?us-ascii?Q?md8/+93+OideTBUDdDWo1Qwp3NC3l+xg3HggKCKkC3rEqtF5l0+ZXFI5bHCv?=
 =?us-ascii?Q?3SCQ+Y82JMeF2t5vWJaffBlxZvS7pNy5tCQtec0zm2C0+WUQycgd/yOa3LxV?=
 =?us-ascii?Q?suDCuzSf2ZO2xa5QG3MDiKKOv7csD+sDhFDH41PHJgawYEmjbyUB0mkLkTVG?=
 =?us-ascii?Q?moUlxgMEKu1zNddnG0mWwS/wogbymKRTQogVqkCgGMihQISEKypEcyWkdj9l?=
 =?us-ascii?Q?ON3d3oQ2jCAU/XySyeemFZLvPHG/rEuPOP7njE4NxlbI5N5Tf+q7zzl5tTf0?=
 =?us-ascii?Q?nsVpDs4Bs81r5JU0Yf4MjqdFro27HL8Cx3+1G5sH+d/AfEnnkjx64QHBg2Lu?=
 =?us-ascii?Q?T2kumLaz9DwnYOjNzYpnJJYJ3RDVV7GrN6i/soso?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51878c6f-5e4f-4807-ebe6-08dd88e0e40d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:49:23.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/zoQnIKW1ewwHn3xleyumwZ1ajYBwlWBxpNGeCk7U80z8JK+IcIcStuLQCQWDKk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932

On 1 May 2025, at 1:25, Juan Yescas wrote:

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
> For example, the CMA alignment requirement when:
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
> Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> allows to set the page block order. The maximum page block
> order will be given by ARCH_FORCE_MAX_ORDER.
>
> By default, ARCH_FORCE_PAGE_BLOCK_ORDER will have the same
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
> ---
>  arch/arm64/Kconfig              | 14 ++++++++++++++
>  include/linux/pageblock-flags.h | 12 +++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a182295e6f08..d784049e1e01 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1658,6 +1658,20 @@ config ARCH_FORCE_MAX_ORDER
>
>  	  Don't change if unsure.
>
> +config ARCH_FORCE_PAGE_BLOCK_ORDER
> +	int "Page Block Order"
> +	range 1 ARCH_FORCE_MAX_ORDER
> +	default ARCH_FORCE_MAX_ORDER
> +	help
> +	  The page block order refers to the power of two number of pages that
> +	  are physically contiguous and can have a migrate type associated to them.
> +	  The maximum size of the page block order is limited by ARCH_FORCE_MAX_ORDER.

Since memory compaction operates at pageblock granularity and pageblock size
usually matches THP size, a smaller pageblock size degrades kernel
anti-fragmentation mechanism for THP significantly. Can you add something like
the text below to the help section?

"Reducing pageblock order can negatively impact THP generation successful rate.
If your workloads uses THP heavily, please use this option with caution."

Otherwise, Acked-by: Zi Yan <ziy@nvidia.com>

I am also OK if you move this to mm/Kconfig.

> +
> +	  This option allows overriding the default setting when the page
> +	  block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
> +
> +	  Don't change if unsure.
> +
>  config UNMAP_KERNEL_AT_EL0
>  	bool "Unmap kernel when running in userspace (KPTI)" if EXPERT
>  	default y
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index fc6b9c87cb0a..ab3de96bb50c 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -28,6 +28,12 @@ enum pageblock_bits {
>  	NR_PAGEBLOCK_BITS
>  };
>
> +#if defined(CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER)
> +#define PAGE_BLOCK_ORDER CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER
> +#else
> +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> +#endif /* CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER */
> +
>  #if defined(CONFIG_HUGETLB_PAGE)
>
>  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
> @@ -41,18 +47,18 @@ extern unsigned int pageblock_order;
>   * Huge pages are a constant size, but don't exceed the maximum allocation
>   * granularity.
>   */
> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_PAGE_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
>
>  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>
>  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>
> -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
>
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>
>  /* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> -#define pageblock_order		MAX_PAGE_ORDER
> +#define pageblock_order		PAGE_BLOCK_ORDER
>
>  #endif /* CONFIG_HUGETLB_PAGE */
>
> -- 
> 2.49.0.906.g1f30a19c02-goog


--
Best Regards,
Yan, Zi
