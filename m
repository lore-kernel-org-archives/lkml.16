Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B21C8FB5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109487; cv=fail; b=uyCk2GtWrnnJuAW0JZLydpVxNPJm9SCZGNi29f1FmqKwQunbnNvTDk8p3DyHZ3CiIQhVMgyvxjjeRzEgWC3PZFRfyIPKFFrIx5ubqTG6/0zZVvtofJnJFNK9V5HJRutXm5L1wkn+eUxhQuBlszl/sMIoQUrCONBfpExvRZ8hGaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109487; c=relaxed/simple;
	bh=3gaaqmRQnjFxQY5QuN/GnhK6cgFggjW2dTGcug4al+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WABZC6yfc1arBH477OQcSVOfjhAGVpHC1BtXcdNzUDr/46DIi4cpsySyuDd4TTKRDpUS4b0G9+vh69XwjMXTnPt+B4aGCMwVRuNxHLgypNiDokKIBg/G4fw+FjoaIQhVWq2UXHISUe9EWcqIfhWPm3tIo7/hKZQDPHJGhLHixYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uEcz02WT; arc=fail smtp.client-ip=40.107.95.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uEcz02WT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRU2bUZw7y475JWF4OWv7H39OYILksIx9PbRZJ0OU/KuyJOz29OMvN6W59XCw9xQp1FvByCsNHjDQMcQ/B2+7ZpqKXuz3sdOpLLMmBnGyqVq6zqHoDjb7QaGUvXKW7TBP3OxnjDKL1tTpvXBD5wy3tZmTvvFchspOW+eo2GO4GsiSpAwT/FL6RMFszxvqJXDFVuVJZ1FUlD+tIsBQVyw0obgO+avf4BoadIYaQcEuY4PspAqg2v2rLgYvTYVEyxG83inYEPvpghhBvuSSC6ZcuHbsCVAWDWDd/VhboKtkvkdhK0fXibTh+zNmt59chNcGmzKJtcYTJrFXFCsQDY5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n/t0Cu5poOCuXA8iB5p44sH1+Ej5Y2xTlgYN0+BLks=;
 b=fY4gu7R2IjflljdlLMXh0QdTA8AO/RsCMJu9R4eyXsOE6ATqUXp5IsrlCIJIQFY18EjqVjHRJ+NHGsIPQev/t7euBzNunKsy2EV+xTF8UwpwuVmgT1iaxU35L8YpHqwFtVQZAWzZXL5kPg67/6mMP/9HT380Othibb73n4XRPDHnq8/hD75LtGhmhjt/Js4pAIWg/L3IsS9V+0uV5qsww45lfcrdzrAgNZmikSJt8LJqdEn+1+dYqG192EcBpxuxgt+s0nGqhM2k03tum1YiISRHYjRGMEtI0K5ZM/DP05wfdV8uHcjo93XGHIS1W9I5vny5PzniM2/bB1oxe2WmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n/t0Cu5poOCuXA8iB5p44sH1+Ej5Y2xTlgYN0+BLks=;
 b=uEcz02WTaEFaC2q/nhfxWbGqTqH/UHNbTtlp05cbM0nSHkrpOOYzapuMtdFfDZec0f31WnPVoQ4ONPe8AbVGICtShkcb+iwiS8x05wqjbnRszJLrwVX5hISzuno9xe+OzQgEQaKjVvAlF/+U89wbcXWpLImZuJxcDkp5ujU1+04rtTjooV9H36wOp9xGTJ+uHNxmnfUhGB7VmQXyIYRc45vI2sPxmisSbTEadwbI9amaYMEKycYLqQAjceNSiRBDEdoF1IPZGO38GpwQS0N05w0SP0Lq3mPZ37viEc66irM5D/d48PlOf4ABBv1U+hkPyVOjaTxEZcYUMDbDQf3tFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB6784.namprd12.prod.outlook.com (2603:10b6:a03:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Thu, 1 May
 2025 14:24:40 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 14:24:39 +0000
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
Date: Thu, 01 May 2025 10:24:37 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
In-Reply-To: <20250501052532.1903125-1-jyescas@google.com>
References: <20250501052532.1903125-1-jyescas@google.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2c095d-a90f-4aee-1b7f-08dd88bbe87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bXKDoNxeyJjCkU/eqKFE0OSW3c6SghQtnOEkWjoJKNyL+9YQVQELpG4Qh7pS?=
 =?us-ascii?Q?6ZaKGKSK0EQnYYk3iI7Vvhc1rYftYbn7YlykTzTsXoCUqEnBWhmZ/LxVUvyc?=
 =?us-ascii?Q?O+FkSNT6Dar2Jd5mVgoi8SL/ZezXKN1pIAd0UFNWYQbrePMOqJSrDAZ5/6hx?=
 =?us-ascii?Q?VyxifJ7EKFc79DbN6Ongz1a8Uz9xAmPSbVoqdRnXjYqHShY8O28yT9WuJyzp?=
 =?us-ascii?Q?Hp4oe/csox/HBz4x5gMZG5VYUZEVnayrdwHjdAZsvC6eyX85hg8f/QhHkA5W?=
 =?us-ascii?Q?fsjpwfqliy3BaxyYrCNa373H3uZ9ctN1AwrKYGraO8Os0IQ9Fg8Nb2MKhxtL?=
 =?us-ascii?Q?v1EYyk7fr7WOXoYA143UcgvKHgXiR/gRRyxtXxCO72HBtj+Kxf0XuYjZX8jC?=
 =?us-ascii?Q?pGzQbj2Wyn5/EY7ORoqIwkQuh3GeT4Ce+oV9PtYBo1pZFpaLa26akTA8tJgI?=
 =?us-ascii?Q?LDuzi9BUVeFUMfg7jizCTLmq5YvqtXlberQdwXwNGWubWOtFN8/cbmPu2EFc?=
 =?us-ascii?Q?ZlCJaUgT1oZE7vFqDiZxhUqoJ38k0Oyboq0ssmPFPj0BYPmllAuyi2FvtC7a?=
 =?us-ascii?Q?QcqX9IktdmdGPNqbWfVlcZg0lTbZpk/wpALNecYtbjJxHx1+PyvYj7w8dZwt?=
 =?us-ascii?Q?vOJYLmCirdzchnx2YHSt9e8n/NkRtQJqOj79HxMmaXzSrFojeeFU4zepYGpw?=
 =?us-ascii?Q?A8s94+OKmNTgSuvSa53gA+YyyhaWgZ9EJWoh72FCgxCR7iASvovkEeNDR99N?=
 =?us-ascii?Q?fPWlEWYODwEJ3pTSDV9Bo/A4/Spowla9gqtRrulW0jDUlfnnEAPjTP2p6ut1?=
 =?us-ascii?Q?xRo78GeWMwwd2sRca9hjIvl+fuDLwLQ1MHxLvUHcwTAyg/ziv3ybxmt2s4YI?=
 =?us-ascii?Q?c3CeDxD1NrgAKIlUtp13PLIXDiI5ry7yugBguWJPkDdNMIOwDeqgxhrlIN6U?=
 =?us-ascii?Q?vaYXJ//LOg9kF8syOSr5OiOj4sTmRguGNRlOKLCXxsyq5093Xvz8YJYt5h3q?=
 =?us-ascii?Q?xwaZJvjJzcw6dmtNM1H3hD6m6Iaj1l7/oaNVQeJ/kY+5OLND3FNDUl1QOk4/?=
 =?us-ascii?Q?xaAX/HBGAWdJGc7oKTKZsCGPJ/6/avtEY2mNMA8oPiiY2YbG02OF4FyekmbX?=
 =?us-ascii?Q?0C0rHCABpHDPXBXASOUeyP10D90NIXVusTfn3B0vdOKslw//VWu010N73dE7?=
 =?us-ascii?Q?R69gLmWaU41xJT3B8oIyBBtgQU9/WUTHdlqC0Fne7o/Q9OC7YbIccWm5Cp2T?=
 =?us-ascii?Q?OQX3tFgHxKzvmeAnXuCUQbEIpDN7wH8IShXUOE0f6/ZECxp+ORJ9zEiyfT9O?=
 =?us-ascii?Q?4IgnjmJxRvzcIrdNxeiO3a61g+MHhrkOofRVFdgdl2fEddM2eJo5FyaU3kRh?=
 =?us-ascii?Q?DxipnKiUvAdGzSbfOWcLiCJSmEdULBNVexgb4HKiWEcaRQ83IWABmn9fQG39?=
 =?us-ascii?Q?N5AIobmoRe4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SGvtJJhyhjmYdnDju35vYxS3nFT5hG3cqrqWdzu2Oe8lg2XQTUN65n38REhO?=
 =?us-ascii?Q?QhkeuFn9dNjsBNvqUDaEiDkT18vyd5l51Y/3cif8uo+iaoqMwLo5OYUNzY67?=
 =?us-ascii?Q?GzFqEVtsvQXay2XtXT6Rqz+ydGTCu48huut8tgzYVGPgYKSfWoWCVEuVabXm?=
 =?us-ascii?Q?182wJMXtS+mU2Bz7i2eYpNx7KDYbCOHf7Q3v5u96/LmL/J3x3hY1fIZRAwQL?=
 =?us-ascii?Q?/wFkbcT5PF1sH6zJdCutc5nb6AYLM0ytP0cO9FVuXA5inh3jYcBy/qjVTu41?=
 =?us-ascii?Q?kP86XFGxCUIZLsdOHvQZE+PhG6qDZc25SilLE1T2R3L7H+BTVZYviMh3HoVk?=
 =?us-ascii?Q?E8cP0ej5xNUNemG+vIV9pJQ/ZswrwSTKRsvFEl/LDv1Ug+qz3ewOh1Xvli7y?=
 =?us-ascii?Q?KUh5TPpgS2GqWc90RBybpEQWg84tpaukIB7caBJTe3RHcSPKjnarU6La/n4r?=
 =?us-ascii?Q?eCavHcLydXaOyGmj9HjNV+4TTKN8dPHL4XwFb0bsi9K1Bdn86O3IK7sa9Xed?=
 =?us-ascii?Q?E6vU2CWQ8j2cVz5zk3uTWM1923ZTLkFgzAMzA8E+JvJFJyt4RDg5gXPSmEI2?=
 =?us-ascii?Q?Qseb4jSToHmatsje+oWDl0+6yTOyLATqO6MNgeDHyOaz2XGwEcyfIe0eaJNA?=
 =?us-ascii?Q?qz/6h/mznjQ7BX/7zxn9g6SFBAGeDkgeS1LPgaWfHf62Zal+kMOPrYKuEsJd?=
 =?us-ascii?Q?FkVWYy9rG3wK2Vhc25pCkByDYAe0SuBQkkGCtDeiktRG0TmI6IRaL0PGX81D?=
 =?us-ascii?Q?jyzq0msDXFK4A+BI0DlRWKEf5swZyQMLem1kytklUypfiAkUvXVD9OgGDGeE?=
 =?us-ascii?Q?5Q/K7CpHxFbpf3Ll6jztuQd2sagQZUi7rVFmG7A4ZKYKpM+LmfpAxFc4Y2bL?=
 =?us-ascii?Q?VPa+PNRIlxWU6WiWB0Vmr81LymHa0dyT6ZQvsFm1fliIlL6+wn6BbDutDDDa?=
 =?us-ascii?Q?tf622thJ/ik73/oUfh8e9vF0r4jIbdpvXF/U8o9FofKJ6yx9yzxn+8veaDJD?=
 =?us-ascii?Q?o+Lvi3taI16cIPYlz2RyaTnYyzCqPmazSYNKc+5k2M3ZV84W27Wi0uEVmOfn?=
 =?us-ascii?Q?SA2sgYZDXL8LeMOxqWqqIqo5nPSyjBoGsKhTYs1PMRnSMv6XTCjd9sMKsWDl?=
 =?us-ascii?Q?WkeypcvlFI2cV10O9SnWfcMA3Fs6Vlncma6S9LlKNuRrqUUc7thZToz0IrYD?=
 =?us-ascii?Q?34Ia12OqiTPomiKigwgL3qKWgmEKftZoGEkXeCZXVQ+U+UDtFsK6AYPZH8TT?=
 =?us-ascii?Q?oHcl/1cgXH5KuZibOV4qYy6cOd2c4T27ZxH2Iynxru7Rxcia3MlzkpKNEUj6?=
 =?us-ascii?Q?PlgLYslkNmrgmKEKG4tXl5Bn0dwtjRaskd5gTxk3Zu2nsSA0Oa0XvHSJ1Pgu?=
 =?us-ascii?Q?88pdkGp4Pu+Pr1BFYyfPGbnm+gSnDKNR0+oXKnnJdKWj2NuLFJ5DuBc9MqfD?=
 =?us-ascii?Q?/OwbVz0Dg4RPiRI+OQNiQo71nu7S8PplloPxXB2Ikxv2WuESIeOB87Q5ugXt?=
 =?us-ascii?Q?OHn+Vr7Yx9O4DznForwY/KjMdCcFtFxOKtqeWptyFBHWoMgpYQe0t6Bo0PF5?=
 =?us-ascii?Q?XatglLCwTn12syz7AMa5hvXvG17QbNFhsl9a++nO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2c095d-a90f-4aee-1b7f-08dd88bbe87e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 14:24:39.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys20O/IByAgQqU8rFF/4+0eid0uJe3ILZZMVXzH1t+SjRNP7G/Xz6zpNFFNQdK/z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6784

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

Why not use a boot time parameter to change page block order?
Otherwise, you will need to maintain an additional kernel
binary for your use case.

--
Best Regards,
Yan, Zi
