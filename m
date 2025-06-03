Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D823A99E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962517; cv=fail; b=tJVnkyt8kVdd7NCyxiHY4qS0cjwjnDAreqBworGmLh5H34++RduwJ8XuO8wt9C8i8p9EktXH6o+r2IRH8324YiDrcem0ZyIeQgaznKs1tMMABAoUMqzMFgx2ahtXuxuJEs598icr26gg6C+0r6/Nr5jkq7iPznkwN0T5DdOT8OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962517; c=relaxed/simple;
	bh=NpJ6OI66ai0g9XZCBQbR5y0HHWw6+1AP57jAI6okHxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KdLWKNLmYMVeS8DX9mSw0vm1FeaOH0rT1m9BKl2ZzCJhd9s9CMeTpr1NYWoREkJqxLPzOE6VzC1qpLYLjuN4IBjah18oCXGiTK8Znp+yY2g501yxHZE9fDRUSU6uCJrIp8TPVNdEHR3UzeC0YdnC1bC68+4JoKYlJT+mlBBnXgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hJmr+9IL; arc=fail smtp.client-ip=40.107.223.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hJmr+9IL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gxn3PjBoM0NcgZgAYMI9hqW9c9q46Pm9BOYn5kERPeabERTyocBZXA1KFsIhlUmZX63284KJRaIYmRflFGLtHId98bKKx8X4bVs0DlXYLhyiiET98liqd/kGhWLms0AQ5ZNfQgNqlOMFodooXw/k1ylIKAJqyqDV43fJMSsUTjqdFBQvj88xDq7OVvfJkyVMp5P6gB6RsFohz6dyjSjjhvuqbzODcMeMb0lQHrlAhxEash/UdgQB0UT8i1MpWQb1xdOUE/2k8CXAJJFFkkaJlX7oKGA3mXUUfnOoAyiky0uzUjKWRiI8rEKzEarkt1JjF3dBoz37aOnxGPkRpZKz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=717JbeJe0w9xEoHSdQ4Q1TVL5FtPzL4nwYOPIjvsaIE=;
 b=DTz/7Cj5ZIWHaiIEm2lH/8KjvmlGp2FQem5FV5rmxLeZ+xyUPQxGUpYZYKxFdz9C5yJ9SOadKWqerLK59xKSaicMvTsQoZKn6jso1leX3W2OIGjpUqrBFbR3eF5pHanghxZNNOBg+C43ORh8cIRz5N1c+ZxYxUZ6yLsvqKgJZha5tTkkR8zy20s7sXUnGaOIhLWyXp/6OGCGXU6T1QOqFMJp+9xWJSNPIOgGtbeIyq6zXeOYQdJ9Xb0qYW9xYznTirUmq+OzyJkDTW1uDR+GKWun2fFrSJiQG33j5SzJM+T9W4mtPM90P9P6uVj75gp95tY/SFq/O39kmlQFlvBbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=717JbeJe0w9xEoHSdQ4Q1TVL5FtPzL4nwYOPIjvsaIE=;
 b=hJmr+9ILYDuKkHJobnfiTLXa8FJd+QtXanFxJIzieZXIgQoscsuHbcE+ZkTis9rLZRp5CWplcVPLebnI3Z/EDv+UgErJb7OsTeZTilPTUBosbesxUI4bQVD0pHURe+pJ5qGJf8kJMrMuCoNLRDWkLlEbvm1A2Y8ovu2xQx+2VSyws0Fxug/Ugd3/xiQ5NpWiCtwT2/LZApRlpM0rczJXvSsqivTaHnNRw9jBSN1CDOhgFZ23UlRRcHnsVww7atTCqwBTundFv+B677ScONlYc0DY7+PjR5m4B73PwmqMAdsECP3K2F/TjW3l6aDZ622NhKzZ85sr7tSLK5qSO4LSIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Tue, 3 Jun 2025 14:55:07 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 14:55:07 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, kaleshsingh@google.com, masahiroy@kernel.org,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v7] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Tue, 03 Jun 2025 10:55:04 -0400
X-Mailer: MailMate (2.0r6257)
Message-ID: <51739EAE-32CB-43AD-A969-B24FE3DAA351@nvidia.com>
In-Reply-To: <54943dbb-45fe-4b69-a6a8-96381304a268@redhat.com>
References: <20250521215807.1860663-1-jyescas@google.com>
 <54943dbb-45fe-4b69-a6a8-96381304a268@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0485.namprd03.prod.outlook.com
 (2603:10b6:408:130::10) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 66102fa8-eed0-4258-54bc-08dda2aea128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tQjRlg1Mry2MpOai44y4wkLHHmJLDeELKvlIXG5Gq11X+FqA1eNsxgfGu8S7?=
 =?us-ascii?Q?XCWVKX7+RXMX4ukrUoMmWL+7drMjb8z9T2UiKflKd04mUI1G2/zkSOQPsKJW?=
 =?us-ascii?Q?5W/AwbohgRm/nl3Aj2LrGmKoDWCQf6Uq9+DzQr5W8+Kcp0baqcDXlDNHlvEr?=
 =?us-ascii?Q?RH8YC2yBC0d+2HjPRRJXvY5xOw3DhtjY5uROu78wNT5FUoYepbnZHs3PBug+?=
 =?us-ascii?Q?+nqJUescrj6PPR0VlwCDwgnPcP9NSvbtb+kBnWiPAN2L70h3TSSkZ45MjxJU?=
 =?us-ascii?Q?/LRR15xSEgoWRCbJjp1XFEyC6sBmhqudYdBQ8uQaVOgtTULNgOddfB0RRgSO?=
 =?us-ascii?Q?lzZ9B9Pfo12JAKU9q5b2PJ+6SZ7GzfQzx5ejRa+MnJG0mZa2/+0RxR7xsuG0?=
 =?us-ascii?Q?M4OBRDW+y+vozSGMkYHb0z01Y4B71cXeboiLAQkEV9hOAzJlP8xC9Xm530RF?=
 =?us-ascii?Q?+b/Q8rWIni3N29vIsr4NZuzVNKDRIMKkjPOZFPxzjjNIk6jsV9jsQF2DBUph?=
 =?us-ascii?Q?mJoY3xFRakLGIfVA2AJMZwm8Qp9twLt35zWOP4tAhgHJQ7OjhXaSS1vNhPrM?=
 =?us-ascii?Q?uz5FPYPI7jnHAXrH8FgU6+G1QytgBbV6uNTbFrwBNUcviiEmZGiiojqy4Hlp?=
 =?us-ascii?Q?t95dcpFHRTSI43tysapT0S1X/NRZjH77tDPIMTsy0tBL7HgQ4WfNmTH1KgoT?=
 =?us-ascii?Q?5+4/i/IUkePm6CO2v+F33n8259KlslooCmAxz0NhFve4FVVn9ns8I9W0DYW8?=
 =?us-ascii?Q?/DVFQmHqfUrEosdrNPKnAOmPWewJqIg/wlmDL5LFR79DDey53jDVnHRsMQj/?=
 =?us-ascii?Q?+Q7n+SkUbB80thuCWsSWFyDQQ8A2sCyu2e/W8pDQcOJOQtuJH78m7NlGm03T?=
 =?us-ascii?Q?XwiboMhN6SSTn5R1IXm2Uk6aRZXB7daN6s8K0g0V4mCYbsKEsYjG4hva24nW?=
 =?us-ascii?Q?7TVuS8WbsKIvBEg5ekGpjCrh/YjnAbUKRBGc7SsLNcAiqPP55/JSO61T6gZn?=
 =?us-ascii?Q?iyuGbXvLQq1MlN2h+xcw/rSYQ0BJ8zKbpW89XS8t2X5eZHBSDwX1Ne++TkTF?=
 =?us-ascii?Q?3bl2V2WfoUqhtJMO/C1TzwVPwXY2cg8+6bRTd0usbWTam1cA04iqCyNPYY7y?=
 =?us-ascii?Q?a4yaJ7gNp6bC1t1NQpadBbEYu/3qn+dJBY2oNNuokXFMYxPBR4qIa6XAE4ma?=
 =?us-ascii?Q?1TlB374oCO+Zwf6rIUeqSwnAiayElbMv/fXERPMysqMxEv0sxDuy/ey59oJC?=
 =?us-ascii?Q?u1KNzorvnxN+I3o1pORiPFLd43GR0Hx63F+kb7Uo/lmEPZ3uFuiV0H4nzTCu?=
 =?us-ascii?Q?oy0B6/TP/8HKfr1Z4+OuUmrMrfQhTupL/KjPY8t996q63g3jsCFa1EMfU15p?=
 =?us-ascii?Q?0icMH+ilTIx/hIsNGNebsm2o1qGQ64E+ZhBFIP9m7vcLR4s/H3zetMT/7lK6?=
 =?us-ascii?Q?bK0Vad1R5K0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y3Dznh8ntaHNWolKa1PvEWCg8uSaQ6IiTqMOOIEsInea0eKbI0upQ+AyBJuF?=
 =?us-ascii?Q?toGE4y/1Vb/63vOi+ITgHKfb1t4qG1nPMsQ+J/Hp0/VesErjf0397q98ILbr?=
 =?us-ascii?Q?cXtggqeaNrxZ/RA/0XaJuluN9c+FHpzM886aN7dgbjhABjsKyrKgAm86NUQx?=
 =?us-ascii?Q?RnWfm6p/4YOgM7N3ikHB0gZ5fcesway/UrO8W9002pemLqwf5wjvS7qznrGk?=
 =?us-ascii?Q?cQF7E2fneA+FS3Et+J58lkIiVxMwnHdCVLnxgXq5DSSJzfMAhSdeT7yBPmy8?=
 =?us-ascii?Q?/eiyBR3VVMD7UKXfRoEdZ8d0bydwXx11zAclG9yv3swPcBK35wo7aXO8qGpP?=
 =?us-ascii?Q?uDp/m14zjN959sorjzqh49TLnn/lZZK1q/11xDhgliDOsiikcRDJtCPgxyrI?=
 =?us-ascii?Q?Fb1hemwk8qIVVjBmi3YoqOTfCGIFln2UPzg48xtYMfkA1VCoOEuMIHDLbCe5?=
 =?us-ascii?Q?GewU7TrVyUr6qGnFlWyedAOvqDdCmr15eT8aVB3SGY2tnd5iMvsEE8XmhHz+?=
 =?us-ascii?Q?q3JDpGFG+jai3In8lncy8hmE3RvWKXB6fFAwfWXF0j2YXfvyus8vlXa+myKL?=
 =?us-ascii?Q?oNPXMGl/WWe7N5O4DZZC7UX7OQEtd6IzpH8WwgXz+ujntbTDiDcIgkX46ewZ?=
 =?us-ascii?Q?d1U8U759F4nyzDTQVX3H4qPJyMzZWLcf2jwCL3q+z0tdHd106czKpWWcblXU?=
 =?us-ascii?Q?Eaz2OBZMeiolwcBU8O9hvbJ70CNzo7NYBn1/DJi8CofvJD6A+BBRNB2pqaWp?=
 =?us-ascii?Q?aCwJwVattROLxfCk4V3CvYXlToIDAte03Eg+JuxtWad94Nd6qvmD33O/Dv6N?=
 =?us-ascii?Q?kihwVJ2BSX45gDF3+XJHZPb7Hj7M77FMBYScFHenSUJAqjSBEone64cmFZnu?=
 =?us-ascii?Q?GXIEuWn+N8UmkOTj61Y12hAOab+HT3KsWF9fZ586uI6qbBkSMFiu+FLrnkER?=
 =?us-ascii?Q?4LYWQAm+5kLYlukMKdPXZjtFDl0HmBP1z0IUOAEZ2uv0e6zuotmTS8V4ONf0?=
 =?us-ascii?Q?h1TXo9+1HS9hfbmhCTcONci5gWumD3i9nmRoNQFI7vd0uOLbsNQ/G6JcOayt?=
 =?us-ascii?Q?lF6PXZaH08hOXjGLh1r3tMeCVD3iY0b1zK4niBD136nn/Po8sGlgz0ElfbQ3?=
 =?us-ascii?Q?uIb1/NmcLYHguyu7cnsLskw36Coq6S1+eyHR4uczKkxlBQ1pT/UYNVfztZP0?=
 =?us-ascii?Q?7HwUpqFAl2UuZw7Hgo4ecA13fNYdNJXbFDiLmP0bXX0q/20jH0cHANuWHuRg?=
 =?us-ascii?Q?05nnTqqwSmMYmG/V2AwWCecOfKl53K1wsSYBAV6ZEwZlPnZLIxXTQqMhBy81?=
 =?us-ascii?Q?Kfrc0cQ2Iaa2zLxwx2Mx+xPMQfFHTZA6xhNYzvAsc8NFgeJmSy5rdmXlyflH?=
 =?us-ascii?Q?Nt4cB3ghIubdkKTsdhNpRT3EYokrYJJNfkD3HW+/DphS61+S5dqUqfzCLULP?=
 =?us-ascii?Q?KT4ztr/yK6hdl9UTlwFrabeindKp/vuGYqfiBDdJ/EgyUPTmteH2Lp7tvRDS?=
 =?us-ascii?Q?Ue1rpYRfB1ZfduC4irfBUNPYrz+P8t9C2Co3fFm8HmQG4iPDUuPninnVYH6a?=
 =?us-ascii?Q?5S5tXofcl790oZUUkrkG7vHmM0C+sjT83ZW7qfSW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66102fa8-eed0-4258-54bc-08dda2aea128
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:55:06.9672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7ZPKKvzCMQsqQzTgyBxR+4VxS2VUN5HQ8uQUem0UDj6a2eoVlcYtLV+XrqK9ufS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

On 3 Jun 2025, at 9:03, David Hildenbrand wrote:

> On 21.05.25 23:57, Juan Yescas wrote:
>> Problem: On large page size configurations (16KiB, 64KiB), the CMA
>> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably=
,
>> and this causes the CMA reservations to be larger than necessary.
>> This means that system will have less available MIGRATE_UNMOVABLE and
>> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to th=
em.
>>
>> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
>> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
>> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>>
>> For example, in ARM, the CMA alignment requirement when:
>>
>> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
>> - CONFIG_TRANSPARENT_HUGEPAGE is set:
>>
>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES=

>> ----------------------------------------------------------------------=
-
>>     4KiB   |      10        |       9         |  4KiB * (2 ^  9) =3D  =
 2MiB
>>    16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D  =
32MiB
>>    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 5=
12MiB
>>
>> There are some extreme cases for the CMA alignment requirement when:
>>
>> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
>> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
>> - CONFIG_HUGETLB_PAGE is NOT set
>>
>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTE=
S
>> ----------------------------------------------------------------------=
--
>>     4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D 1=
28MiB
>>    16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D 1=
28MiB
>>    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 5=
12MiB
>>
>> This affects the CMA reservations for the drivers. If a driver in a
>> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
>> reservation has to be 32MiB due to the alignment requirements:
>>
>> reserved-memory {
>>      ...
>>      cma_test_reserve: cma_test_reserve {
>>          compatible =3D "shared-dma-pool";
>>          size =3D <0x0 0x400000>; /* 4 MiB */
>>          ...
>>      };
>> };
>>
>> reserved-memory {
>>      ...
>>      cma_test_reserve: cma_test_reserve {
>>          compatible =3D "shared-dma-pool";
>>          size =3D <0x0 0x2000000>; /* 32 MiB */
>>          ...
>>      };
>> };
>>
>> Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
>> allows to set the page block order in all the architectures.
>> The maximum page block order will be given by
>> ARCH_FORCE_MAX_ORDER.
>>
>> By default, CONFIG_PAGE_BLOCK_ORDER will have the same
>> value that ARCH_FORCE_MAX_ORDER. This will make sure that
>> current kernel configurations won't be affected by this
>> change. It is a opt-in change.
>>
>> This patch will allow to have the same CMA alignment
>> requirements for large page sizes (16KiB, 64KiB) as that
>> in 4kb kernels by setting a lower pageblock_order.
>>
>> Tests:
>>
>> - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
>> on 4k and 16k kernels.
>>
>> - Verified that Transparent Huge Pages work when pageblock_order
>> is 1, 7, 10 on 4k and 16k kernels.
>>
>> - Verified that dma-buf heaps allocations work when pageblock_order
>> is 1, 7, 10 on 4k and 16k kernels.
>>
>> Benchmarks:
>>
>> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The=

>> reason for the pageblock_order 7 is because this value makes the min
>> CMA alignment requirement the same as that in 4kb kernels (2MB).
>>
>> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
>> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
>> (https://developer.android.com/ndk/guides/simpleperf) to measure
>> the # of instructions and page-faults on 16k kernels.
>> The benchmark was executed 10 times. The averages are below:
>>
>>             # instructions         |     #page-faults
>>      order 10     |  order 7       | order 10 | order 7
>> --------------------------------------------------------
>>   13,891,765,770	 | 11,425,777,314 |    220   |   217
>>   14,456,293,487	 | 12,660,819,302 |    224   |   219
>>   13,924,261,018	 | 13,243,970,736 |    217   |   221
>>   13,910,886,504	 | 13,845,519,630 |    217   |   221
>>   14,388,071,190	 | 13,498,583,098 |    223   |   224
>>   13,656,442,167	 | 12,915,831,681 |    216   |   218
>>   13,300,268,343	 | 12,930,484,776 |    222   |   218
>>   13,625,470,223	 | 14,234,092,777 |    219   |   218
>>   13,508,964,965	 | 13,432,689,094 |    225   |   219
>>   13,368,950,667	 | 13,683,587,37  |    219   |   225
>> -------------------------------------------------------------------
>>   13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
>>
>> There were 4.85% #instructions when order was 7, in comparison
>> with order 10.
>>
>>       13,803,137,433 - 13,131,974,268 =3D -671,163,166 (-4.86%)
>>
>> The number of page faults in order 7 and 10 were the same.
>>
>> These results didn't show any significant regression when the
>> pageblock_order is set to 7 on 16kb kernels.
>>
>> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 tim=
es
>>   on the 16k kernels with pageblock_order 7 and 10.
>>
>> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
>> -------------------------------------------------------------------
>>    15.8	 |  16.4    |         0.6        |     3.80%
>>    16.4	 |  16.2    |        -0.2        |    -1.22%
>>    16.6	 |  16.3    |        -0.3        |    -1.81%
>>    16.8	 |  16.3    |        -0.5        |    -2.98%
>>    16.6	 |  16.8    |         0.2        |     1.20%
>> -------------------------------------------------------------------
>>    16.44     16.4            -0.04	          -0.24%   Averages
>>
>> The results didn't show any significant regression when the
>> pageblock_order is set to 7 on 16kb kernels.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> CC: Mike Rapoport <rppt@kernel.org>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Minchan Kim <minchan@kernel.org>
>> Signed-off-by: Juan Yescas <jyescas@google.com>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> ---
>> Changes in v7:
>>    - Update alignment calculation to 2MiB as per David's
>>      observation.
>>    - Update page block order calculation in mm/mm_init.c for
>>      powerpc when CONFIG_HUGETLB_PAGE_SIZE_VARIABLE is set.
>>
>> Changes in v6:
>>    - Applied the change provided by Zi Yan to fix
>>      the Kconfig. The change consists in evaluating
>>      to true or false in the if expression for range:
>>      range 1 <symbol> if <expression to eval true/false>.
>>
>> Changes in v5:
>>    - Remove the ranges for CONFIG_PAGE_BLOCK_ORDER. The
>>      ranges with config definitions don't work in Kconfig,
>>      for example (range 1 MY_CONFIG).
>>    - Add PAGE_BLOCK_ORDER_MANUAL config for the
>>      page block order number. The default value was not
>>      defined.
>>    - Fix typos reported by Andrew.
>>    - Test default configs in powerpc.
>>
>> Changes in v4:
>>    - Set PAGE_BLOCK_ORDER in incluxe/linux/mmzone.h to
>>      validate that MAX_PAGE_ORDER >=3D PAGE_BLOCK_ORDER at
>>      compile time.
>>    - This change fixes the warning in:
>>     https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@in=
tel.com/
>>
>> Changes in v3:
>>    - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
>>      as per Matthew's suggestion.
>>    - Update comments in pageblock-flags.h for pageblock_order
>>      value when THP or HugeTLB are not used.
>>
>> Changes in v2:
>>    - Add Zi's Acked-by tag.
>>    - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
>>      per Zi and Matthew suggestion so it is available to
>>      all the architectures.
>>    - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
>>      ARCH_FORCE_MAX_ORDER is not available.
>>
>>   include/linux/mmzone.h          | 16 ++++++++++++++++
>>   include/linux/pageblock-flags.h |  8 ++++----
>>   mm/Kconfig                      | 34 +++++++++++++++++++++++++++++++=
++
>>   mm/mm_init.c                    |  2 +-
>>   4 files changed, 55 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 6ccec1bf2896..05610337bbb6 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -37,6 +37,22 @@
>>    #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
>>  +/* Defines the order for the number of pages that have a migrate typ=
e. */
>> +#ifndef CONFIG_PAGE_BLOCK_ORDER
>> +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
>> +#else
>> +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>> +#endif /* CONFIG_PAGE_BLOCK_ORDER */
>> +
>> +/*
>> + * The MAX_PAGE_ORDER, which defines the max order of pages to be all=
ocated
>> + * by the buddy allocator, has to be larger or equal to the PAGE_BLOC=
K_ORDER,
>> + * which defines the order for the number of pages that can have a mi=
grate type
>> + */
>> +#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
>> +#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>> +#endif
>> +
>>   /*
>>    * PAGE_ALLOC_COSTLY_ORDER is the order at which allocations are dee=
med
>>    * costly to service.  That is between allocation orders which shoul=
d
>> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock=
-flags.h
>> index fc6b9c87cb0a..e73a4292ef02 100644
>> --- a/include/linux/pageblock-flags.h
>> +++ b/include/linux/pageblock-flags.h
>> @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
>>    * Huge pages are a constant size, but don't exceed the maximum allo=
cation
>>    * granularity.
>>    */
>> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_=
PAGE_ORDER)
>> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE=
_BLOCK_ORDER)
>>    #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>>    #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>>  -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PA=
GE_ORDER)
>> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BL=
OCK_ORDER)
>>    #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>>  -/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
>> -#define pageblock_order		MAX_PAGE_ORDER
>> +/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
>> +#define pageblock_order		PAGE_BLOCK_ORDER
>>    #endif /* CONFIG_HUGETLB_PAGE */
>>  diff --git a/mm/Kconfig b/mm/Kconfig
>> index e113f713b493..13a5c4f6e6b6 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -989,6 +989,40 @@ config CMA_AREAS
>>    	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
>>  +#
>> +# Select this config option from the architecture Kconfig, if availab=
le, to set
>> +# the max page order for physically contiguous allocations.
>> +#
>> +config ARCH_FORCE_MAX_ORDER
>> +	int
>> +
>> +#
>> +# When ARCH_FORCE_MAX_ORDER is not defined,
>> +# the default page block order is MAX_PAGE_ORDER (10) as per
>> +# include/linux/mmzone.h.
>> +#
>> +config PAGE_BLOCK_ORDER
>> +	int "Page Block Order"
>> +	range 1 10 if ARCH_FORCE_MAX_ORDER =3D 0
>> +	default 10 if ARCH_FORCE_MAX_ORDER =3D 0
>> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
>> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
>> +	help
>> +	  The page block order refers to the power of two number of pages th=
at
>> +	  are physically contiguous and can have a migrate type associated t=
o
>> +	  them. The maximum size of the page block order is limited by
>> +	  ARCH_FORCE_MAX_ORDER.
>> +
>> +	  This config allows overriding the default page block order when th=
e
>> +	  page block order is required to be smaller than ARCH_FORCE_MAX_ORD=
ER
>> +	  or MAX_PAGE_ORDER.
>> +
>> +	  Reducing pageblock order can negatively impact THP generation
>> +	  success rate. If your workloads uses THP heavily, please use this
>> +	  option with caution.
>> +
>> +	  Don't change if unsure.
>
>
> The semantics are now very confusing [1]. The default in x86-64 will be=
 10, so we'll have
>
> CONFIG_PAGE_BLOCK_ORDER=3D10
>
>
> But then, we'll do this
>
> #define pageblock_order MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK=
_ORDER)
>
>
> So the actual pageblock order will be different than CONFIG_PAGE_BLOCK_=
ORDER.
>
> Confusing.
>
> Either CONFIG_PAGE_BLOCK_ORDER is misnamed (CONFIG_PAGE_BLOCK_ORDER_CEI=
L ? CONFIG_PAGE_BLOCK_ORDER_LIMIT ?), or the semantics should be changed.=


IIRC, Juan's intention is to limit/lower pageblock order to reduce CMA re=
gion
size. CONFIG_PAGE_BLOCK_ORDER_LIMIT sounds reasonable to me.

>
> [1] https://gitlab.com/cki-project/kernel-ark/-/merge_requests/3928
>


--
Best Regards,
Yan, Zi
