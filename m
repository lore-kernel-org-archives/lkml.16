Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FA2F8C33
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645773; cv=fail; b=TRnjJCVyrAlcDI2grYBg4sgWvXeJL00Bj1FxQyGUJMelF6ai4TCGEKM7YOxwfNrZDhdMhxBopfWIxEAuNksX0Yy442kEXXKR30Bo/0fKwpTZhuBP/GRVwLuSC05d9KF/M0JCFJpgpQScH9sVR53p4K3PnPIgJkXVm0Bi/1MHfkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645773; c=relaxed/simple;
	bh=bMWOkK7jt30xL4lNYpJIB3qCpVh31UB4PhJ6LAnyB6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gUhz9+Qp2H8TTsrE68J2RYiwtUMmaVCIRWRzseinW0TM8cQNO+ST60SDHlxM8kNvsWkBOsAJ05WN5a1jslQbyf7Jo0bCgkcP1g16zxR8dDOw6nCEuhI3xAfy7k75CMhM5lXl003eORck3FVN4pSvD3UOsLRk7cTMKWVB+S+7oY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WIbIvr9G; arc=fail smtp.client-ip=40.107.220.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WIbIvr9G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfNp2SqA9pP1kn/Pd+/bb7bQPiwNMRuCvLZeJAaMo9f5y0f6cbItYOjKufWgwqvkcX7PEK8/EOLCcVi/8ck2vfvUPeLa0ihAbRCxerZWTpl8wwNcoLzqHbZmy9vpu3bghN+feEoHqRk9V5GAlYyLVOdBOeqP+l0ExwKav/2A0d0cCoDh1ynLRK7K9nvddViigUsjmL2EHcLzsiCFjm4S3UfMkE4Ox0q7rNvsOnTTvjQwBXSZVLHUUHwzaH+NwUQv72bBKTWXdfLORMklues3zDeAzQvJMw0zTGKXoHsXKD1mXPKt834I6cMOefcbxZRWGn4yXfttYQKKlr7xmWw6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wNBBbACutFtFCMFjb+0g612s/HJ7GySTCN35uL80Rc=;
 b=TKkmh79tODeXOOYsdIR36IOXrHKwO7JyytzJp6WkAtibNaEK7n9VoNgGrfxZ9fDWG833lhnb++pO2wPuLKw0PuFA6WGqWUKsPU33B9SD8X0RoE33zRnjmd/de0NzvLazY4cuzYAy9rDwjkRKDW+bwidShgiKDy7buMsS9tW2tse8q+KmgLJy/KT/qzttZG7TpE+RhxH8eIY4ZuF+X/XuPjr2kUDN1Afd/HZXFaHy5ZmSKriIWWn0QMmus8MEo8zZBlkAzef6H/qU1/LVJEepD77qBqTNdEUnacO48HJI1Ro8dkSqQHZpCYWhxhf4SMi4gmAnHs7lXEpxDRcDJ849SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wNBBbACutFtFCMFjb+0g612s/HJ7GySTCN35uL80Rc=;
 b=WIbIvr9GnFi2GDWeduL5wR3oWGSNoZxFag+brKafZc5HPV4dBk3r6pU5Jv/At/Un7z4kswUa95/hKbEnL/TMm5pj4uDdzUPSMzSlc+M990wWIYc7KpvAbp03le7Wyb2by4VAbIsQVwt3NOd2R0B5580fQeEtdw0Ziorlc3v7PFAT1l/X9utcvo0RfPgJpiUSRU9/jf32jXTx6MsK5VEyrAE9rZBH+8UsHuK792ak9NHt0O4PrlPvu5CqOz4bHQizjsXJbmWenY8HOJ1Jt6yMIC19Qqr951gCihXKvfrHd5W0ATCkey21mNo/SDokOGH4GX2iCpDzXdKpa7hJFnRa2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.28; Fri, 4 Jul 2025 16:16:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 16:16:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 00/12] THP support for zone device page migration
Date: Fri, 04 Jul 2025 12:16:05 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <106174EE-0E89-49DC-AF9D-76BE74FD2C18@nvidia.com>
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0024.namprd18.prod.outlook.com
 (2603:10b6:208:23c::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a0e665-5e55-4f27-7fc5-08ddbb16155b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SuSarnJf9FanrSaW5Z2HuQH/h7St3f5pEZkm1F2vC1+iQJXKMSYrfYd9wgeD?=
 =?us-ascii?Q?k5gOfBmTxD58FvnJRHzMU+svzRhXnZfJlip0Drg+zsOzsayIpRKbKgUkJQFR?=
 =?us-ascii?Q?L4HAk0VgoP05NhSrIH0SBhNJ1UZihwLp0uCfApjaaelWiQQqsFmAqAinGe37?=
 =?us-ascii?Q?M9YvdWaMayywfqTZ1n46Jgn1Rerpas3KHjL7p/VnYhonSPlTTe91fTMJD/5j?=
 =?us-ascii?Q?g7o4YO6mkvsmirzyWGRBKrOuKzFTc8Xb142m/IFT3JN8x6msZCnZETPNszN0?=
 =?us-ascii?Q?8bWiBnF4Jt640Xay8JyULTuMJCB/BL6tEKeu3KIQI27LTPsf+B8t5HSofeCu?=
 =?us-ascii?Q?BkGQLkVg+NCBmTUpO9LBHhiRLEskeX27yAM/t8UFBL1lY+I8WOZ5gib0O8zr?=
 =?us-ascii?Q?V6eE+9YnaaOEFjjOPpNemSHQggjPWqXHjkSAw/EFIQyggQsaFd8Bhm+l1PiZ?=
 =?us-ascii?Q?IjZjFqfq5rg8eBNI1WwVp3lVv/3baYTEIDJjA2KyXrdrotmHYKdtWPuk9RfO?=
 =?us-ascii?Q?NfR4hZ2bridvkkeSNhLz81X+imFfsaqFmo0s3YT7oxJQ9uY60SsA7S2hxM16?=
 =?us-ascii?Q?Zd6rPcUe2BLgUZWZCUa2ZE5x5ruHkUxxqImRPG6MknUOGcocnpZdntZEHgWA?=
 =?us-ascii?Q?n7nlvRcfo+KYqFDbRs7Ag2cAips77PcUdDY7KyblSTlagADbZVpmGm03IryN?=
 =?us-ascii?Q?ijmF14ogpm4R7x/NDhJjJEp+SSv8/5kcz4nlpbEkVrn1sgUOkdpAiv0XHFTV?=
 =?us-ascii?Q?G68sZwi9SXprDDMnMRRsDm/KN0Rj+GpCjYnkTu8MLFYxd9nwYWwoXKh7RzyC?=
 =?us-ascii?Q?T/qfQCDul0qcGKou4ek3r7SWBrJZLn3BUXlm0BloNjw4MVkq9DtBox/zDKsT?=
 =?us-ascii?Q?9+s+GaS/l4tpBxTrIFIE9c9zWp9/O4XazVZOMzn9pstJzng5Hec92qSg6zzg?=
 =?us-ascii?Q?XLc00C8cUZqgZmaC9GKZ/78XJTXdPpDWu9fCGsRgLut/iH3EXg/w5Flie7c1?=
 =?us-ascii?Q?Lk5wlGiVlPgsGjkFLfK3HMEFy7I8sD+bk1fbZTG3U33KwqrdaFZN1dsUr7yC?=
 =?us-ascii?Q?NYzCOEiYHb0iCBGyDsmhR6bO3qpqhw1BDl18xnQMbO1TmCjZala+kcwmoZ2c?=
 =?us-ascii?Q?aGpROzlmS+aTvoKeEaicFtqo/zGh+pzVvsn3pPcbiJ2VfDYQsUHBwRKs98rv?=
 =?us-ascii?Q?34gLEqTJmeNASyEJOaYJzX1hbuWvRw/nxlR7C8VdXUEXRTCvCXy5Iu9RAdz6?=
 =?us-ascii?Q?x9phm0eOFKPDxf23lVyVklQXEmY9nCOFJjJNmCU3kFJj2gnSetxdLQIAzrt4?=
 =?us-ascii?Q?HrqUbdV+3cxKIkLFkyAZ6iGr89MGvYFjv+az6vNqkiZDixwXtB/lLA7p6uoY?=
 =?us-ascii?Q?Hs89zFYIQNK5I70n4SiYvyp+AfpWdhh6AVhnLZ+gyKRXqYpSGj4HFFCXzcIF?=
 =?us-ascii?Q?EB45eNpLAps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qI7PcgK3LzxoRVGwUjFSBgwVSgYmbWYxYs5eV2IIeh3ZDec73OX2cRxZg6o8?=
 =?us-ascii?Q?okOMoZjfg/Ti6+jjr61IduZ3ohtTUpMLxSm674/2zY9y6S7e3/laKqesEMF6?=
 =?us-ascii?Q?nL81GNze9/Bymnp5cVrWHSVisZT5dPU027XhmCYszSZKi1fP0wRLoHjQVTLu?=
 =?us-ascii?Q?xGxwa7NSeJV1YaPw2obb2VKycgSsc8JfjTonZJNE3suDj9XBHNCpBQXwbA6X?=
 =?us-ascii?Q?ceqCg041lwv9lwyQHzIQhNOqbIP5pSoTP5qeKiacHYxPyTYL3CM4aY1fp85a?=
 =?us-ascii?Q?Z9EDjXom+zzMpZ281fHIP94dfLvumaPN6hnFIZ0MLYdX55NvVXO9YIpLq8WG?=
 =?us-ascii?Q?e8o2X/RA53Yfdu/JDnfHPpxA1lpwMaPdStFLp+0PWobsxDvrzeNDqf2UJP/o?=
 =?us-ascii?Q?B3TUTF8aP8hq9Vp88wFlhdEETwJW89n2FZBuAwUO2K0JsMaE4RZHsNpSwnQy?=
 =?us-ascii?Q?5FkvZFPMcvpcSmBpe9f6/cCzShd0B+ADEGBRH2PQ6hzlwxOGDdXS6Ui0aNXd?=
 =?us-ascii?Q?RS458Fgu+DyljMy5fBariHLC0gga+iF/0jx6ru6WQKHzgRH8zpaMVt26CB0p?=
 =?us-ascii?Q?Sz9a0Xfb7LzIZ4ULENk+ZS+gwURcWxQvjEKymK4JtuCQBmF76J3YkxNm00lx?=
 =?us-ascii?Q?tab3Az1aHPLHr6A7E6BJ01tMvfCYNRkFN2i8nfKWp+7YLfSpVkPqA7f2kZyK?=
 =?us-ascii?Q?boBazOVhNrg/L28n1tHzQ+ysSjLV3GXRYK2BG/qVLvq+JC5an4EiLnPnwMfK?=
 =?us-ascii?Q?EVBdIlwzNWhIV0FX6wnN0sdL0zmvMS0D4Pz0j0vk4Lira/MCdpkl8MmZliLU?=
 =?us-ascii?Q?qcmRAVW0/26nTatfOSCxQOH+N53QxvE436Q+rr1dbDaxPM5gRvelxPa4y3T3?=
 =?us-ascii?Q?uMOjQyYh+wG2HXTKMo6FxGVMpwijjeMclV14Q3QLKrGuMSKT16guSyf6iXkU?=
 =?us-ascii?Q?Op9GuwmuPV4RqbHaRmH2c3rmddUplW+dysyVNZ9DLZQX+5Dff9O7TbuQBXLD?=
 =?us-ascii?Q?II7swgLaMSCWNeFC67au2iP1SSYjYS8M3gprOdyVXfzwhHmjuOxHuKp3r2I6?=
 =?us-ascii?Q?trGq9zJx1pHo7wSkmoL7HFgPZ9Qrj5M6DC9L1reao2oZVDsu6ut2wEpxqXGq?=
 =?us-ascii?Q?XjlN8SSYQpI60E+QTh4zvq664upj74aCxkvGEs7hsVxLqH3kBpT0hOk93NW9?=
 =?us-ascii?Q?WMsumQJIRrLXeqCVqL3GDGU/xxKUdpyxE9RBQhW6JIcJWU5Ne1ZhdGfeAunI?=
 =?us-ascii?Q?3vyiOhABwImWq3IsJsy7RWj+k4sE1PlWsAocoa+YkOW6ck+zk1zhedeP2558?=
 =?us-ascii?Q?26/9CVurAGl6xSWaX5BrElpgPJTVcP+hgDXd6YirKRIUOOIRhjQyZOJwHc+I?=
 =?us-ascii?Q?iv9AhxPiu/Fcm/79mrbwU6qFXWZwvcD1LJe/U4a567gFjKdLcgwD+wGrErTK?=
 =?us-ascii?Q?gZHGXtvtTKbsXyPqkS2TSSld6xZ4irbQOIdl38+vOU3XW+wCU1OH3nj/Nb/J?=
 =?us-ascii?Q?jnnhqX4EuwKEnSF4LIIJsT92N6438S/CNsD0D98yOp5aHs1zSlluAkF25PqP?=
 =?us-ascii?Q?pQqcALr6MFoQrCwSCcIjEsBbE3+iASb60kfzUMK/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a0e665-5e55-4f27-7fc5-08ddbb16155b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 16:16:08.0173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPFLAvTlmeClv2nZQvJp3Tc6dvR/6hSRgqfgN60rpxOd3s/SzZwJjupftrFaDIww
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660

On 3 Jul 2025, at 19:34, Balbir Singh wrote:

> This patch series adds support for THP migration of zone device pages.
> To do so, the patches implement support for folio zone device pages
> by adding support for setting up larger order pages.
>
> These patches build on the earlier posts by Ralph Campbell [1]
>
> Two new flags are added in vma_migration to select and mark compound pages.
> migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
> support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
> is passed in as arguments.
>
> The series also adds zone device awareness to (m)THP pages along
> with fault handling of large zone device private pages. page vma walk
> and the rmap code is also zone device aware. Support has also been
> added for folios that might need to be split in the middle
> of migration (when the src and dst do not agree on
> MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
> migrate large pages, but the destination has not been able to allocate
> large pages. The code supported and used folio_split() when migrating
> THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
> as an argument to migrate_vma_setup().
>
> The test infrastructure lib/test_hmm.c has been enhanced to support THP
> migration. A new ioctl to emulate failure of large page allocations has
> been added to test the folio split code path. hmm-tests.c has new test
> cases for huge page migration and to test the folio split path. A new
> throughput test has been added as well.
>
> The nouveau dmem code has been enhanced to use the new THP migration
> capability.
>
> Feedback from the RFC [2]:
>
> It was advised that prep_compound_page() not be exposed just for the purposes
> of testing (test driver lib/test_hmm.c). Work arounds of copy and split the
> folios did not work due to lock order dependency in the callback for
> split folio.
>
> mTHP support:
>
> The patches hard code, HPAGE_PMD_NR in a few places, but the code has
> been kept generic to support various order sizes. With additional
> refactoring of the code support of different order sizes should be
> possible.
>
> The future plan is to post enhancements to support mTHP with a rough
> design as follows:
>
> 1. Add the notion of allowable thp orders to the HMM based test driver
> 2. For non PMD based THP paths in migrate_device.c, check to see if
>    a suitable order is found and supported by the driver
> 3. Iterate across orders to check the highest supported order for migration
> 4. Migrate and finalize
>
> The mTHP patches can be built on top of this series, the key design elements
> that need to be worked out are infrastructure and driver support for multiple
> ordered pages and their migration.

To help me better review the patches, can you tell me if my mental model below
for device private folios is correct or not?

1. device private folios represent device memory, but the associated PFNs
do not exist in the system. folio->pgmap contains the meta info about
device memory.

2. when data is migrated from system memory to device private memory, a device
private page table entry is established in place of the original entry.
A device private page table entry is a swap entry with a device private type.
And the swap entry points to a device private folio in which the data resides
in the device private memory.

3. when CPU tries to access an address with device private page table entry,
a fault happens and data is migrated from device private memory to system
memory. The device private folio pointed by the device private page table
entry tells driver where to look for the data on the device.

4. one of the reasons causing a large device private folio split is that
when a large device private folio is migrated back to system memory and
there is no free large folio in system memory. So that driver splits
the large device private folio and only migrate a subpage instead.

Thanks.

--
Best Regards,
Yan, Zi
