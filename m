Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5D23A9AD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963683; cv=fail; b=clI+7Ewq04TInDOBDjyaTZe+3Dht6LKGxgg1mdS64yWqE7xpU1h97Bq3aQe6j24kjS9n72+6A5Ea2fKL93YSsvbuOBStoWM1rcNapq4lMgtdtstz5gMqR3PevlKZa1DpmADu/orjUbEMbiTe2L32SkKpm5GVYt/s4EBQgxDfkDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963683; c=relaxed/simple;
	bh=1CD0B4FTE7ti8CqFQ9mFufdpeVXCtTfwKpQD8Eb5Wu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GOzu7w6UBVlIYeMLqZnVwU/WRUCcV6bzyiyaUu+58EWI6CJlykpu8OxAjVf2IjvGrtMVPHcUhBvtUOEdOETZZx8R/QyQ/If0DxyRiHq56DTrRAhp85EtrvwgjCbAmh88RH68lIMxORuJAse3aTqGZ/o+GCmvcGmsjipyqh5+LZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ORnQ7LjI; arc=fail smtp.client-ip=40.107.237.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ORnQ7LjI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLanlz/3Xw52yZdj0t+QvkdsxUuHJjOVQoM87pZ3T6fkMGDQSPPA26frsdzxL+mIVu7kPBtx+F5gxNRqVMaNE5QQidlNWfONUqBrMJC15wbwT0wm7eEfdDOUV5fNkpjzevzAWIDqG15ol3Z3b1D5EIjnGlI2bDZIQnXHrzesIurbOxyuCYVYdU2ySKSH3H4r90xbkbnRaNjOoiDyXBzSYXoXuVb4RUmzhdW0jb8K46yRPYgxUmcKPtyAi0prW52JgaDuw/SmHpOLzx+F68fVM77VmNi+zY3z98WdUaGu/hB12FzGeELPjzSSU816dWJqZFEh4+uEx1VJ/AYekyIrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT1QA1kT9enUTpfMtTCZNUrLxO+HYqvKZa4G71y1h3E=;
 b=Xz3AVt12E/CzMofv6B90iQXJeEv7vhljm2fiTEjFzsUf0NsEbAIOmx+54I4LEWfE91N1FYckVnLRX2gA3HtMwmfuG0LWej2YPgiITSvZ4J4ltGUWjHGnhADQGW2idd4if4cUlQDfOnHfCi4+b0+F9xby5bTyAx1RWLU3bBVWZ1faWCynAB2Kp0amGhQ2+2U3t4CQgbundp+KKtrmc2PyFT5yUToQy9MA4FoOAuJxaUGmJui+49GBFlv10KvD+1/RvR1yjfMOslkFzFPvknPMVSQkfO7muY7ghSZPK7wdcgQc8cdWl5J9cjjPUKLapWEoOXeQsNd7U35whytOl3elrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT1QA1kT9enUTpfMtTCZNUrLxO+HYqvKZa4G71y1h3E=;
 b=ORnQ7LjIGC9aU/3IRLK5KStm7m+55CQdwZ5O+rd1l6A2Otv0nIIQwMrzAaNX3LRjqqAoxoRi2f+2eldyMWvWM+vu8ptC33/1/UnNsMSy4aPoi5GKfb5RtLd6Uum8M/4Ol9XQsDx6o+98Duh1j9+X1Atwi0cmLUbhb68NoeN5xi48kdwsEzRe4GkpyJS4wtvtPh/bZC5fW4/b1OyvzJIkZwnc7M1ECCEGET+kD/31vUEssS1IgZDY3c/pcYwqpcW7BUCOsDZfQpNdPCLOwd7B8H/6g26N0K0GwzEKq4cZavvykzhLx/Gl4kuGJFKPa4XfE5UBXEoHI77tD7zrE4yB0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8278.namprd12.prod.outlook.com (2603:10b6:208:3dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 15:14:36 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 15:14:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <tjmercier@google.com>,
 <isaacmanjarres@google.com>, <kaleshsingh@google.com>,
 <masahiroy@kernel.org>, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v7] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Tue, 03 Jun 2025 11:14:33 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <74955261-748E-4E91-8D55-6ECAEBFB3F70@nvidia.com>
In-Reply-To: <51739EAE-32CB-43AD-A969-B24FE3DAA351@nvidia.com>
References: <20250521215807.1860663-1-jyescas@google.com>
 <54943dbb-45fe-4b69-a6a8-96381304a268@redhat.com>
 <51739EAE-32CB-43AD-A969-B24FE3DAA351@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR20CA0057.namprd20.prod.outlook.com
 (2603:10b6:208:235::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 02957049-3e1a-47f7-9227-08dda2b159fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7yLSweik7BizBvx8riJoziqefpGeCQyo6/eGH2n85aFtMeDhcbBw66uaxSNI?=
 =?us-ascii?Q?4AI3lzgIlux81IRpoITrF5cldCJ4cFO5RgxUm/t6zGCTRb04Sgiq2VT7QjGJ?=
 =?us-ascii?Q?ibnHIjof4+odsp/MB6qxFLKDSCI48NtLZBuOOe6UjG1bySKidMU3BekcLNav?=
 =?us-ascii?Q?PfBj37feQDh+HJK9hCUQUjppyZPDRpf24L3MkQu1hjrfQLrXnQJ+4TtzpcqA?=
 =?us-ascii?Q?yOYwXfFk6Kmm2IDFJkWlls/AbQa54+Arvvd/d8nwMuidzUkt5nLaU3A+JZtV?=
 =?us-ascii?Q?gudWZ7vCoOsXLe4mYxy9aKDigjCqN8tYXKlFn+AWV/OQHXs2S47Y5YNuM2LA?=
 =?us-ascii?Q?NWy5H4ik4R3+wIu1sD+t7advJXm9GQs19TDLTp5W/M519cAfANVPydSxAZF+?=
 =?us-ascii?Q?+XQPcnge18UERZHT7+f7lRAGUMUGOyXzmUBWjGWs9iLsy7kpMU2m5UAcMgaZ?=
 =?us-ascii?Q?8lDvle3XSuldlcdh3gqvTsTuLYe/yoQqgeeGJgK/jirtbt8biVxQPJ0MBcch?=
 =?us-ascii?Q?tB+SdeQ2Vus6Gkfag57Aqr6SVjrIPxwuGWGcK5IoKKpvZzlnM8wOkEN8oc/V?=
 =?us-ascii?Q?WoPThCS9Bo4Y2lz5clSuxzownly9uFI60CPO858N2gCNEK/GLXRcjIrCw+jG?=
 =?us-ascii?Q?znjdZVlmdAL1yM3pNPhSH/qz6bJ9NiJEoX1HCSpoEePoPL4KPurnaM2KJL60?=
 =?us-ascii?Q?cLQiSrzDKSTFfdrSFuMzMyeiw4VWWLtwEPg9s+D4klVwMn+VZ1MrZaseP2AM?=
 =?us-ascii?Q?mJ0i2l8m6tznj5D4UiEs8yjGpJGE83hWWCSzQkSsjMdiTlVAPjPB9GkUQR46?=
 =?us-ascii?Q?OcTv2yS7TUgJHkCaWPfmGV5nVEcOSkOrCXf6pvuWjDswIqYsxQzty0M54WFe?=
 =?us-ascii?Q?bmoWfHC6KMxk2p47qHRcBqSsK6MaKRX6nJ947qmM2RDGr5VxnyR7yDPqI6g1?=
 =?us-ascii?Q?/nNFamBxxXBzTTIdw4QZMbrZ51CZxAmSeVkpK52pqjuoKptRFEQKBiiagylW?=
 =?us-ascii?Q?rz14gdSviDN2JTeRFVfWL9g9EKZcaTSWZQBULYAZiR1zoMljXZhMcMKa6LI/?=
 =?us-ascii?Q?op42W36AMxy4y0A0OEcndDgbUjR1kTZOfevQ1xupDUyvmAEgn5Hl4TbVwExD?=
 =?us-ascii?Q?/ZpR6asbT1izsYQDSx4CWNG/K/PKATsYazErIbRZnGE5bA3yhfkdCCgWergj?=
 =?us-ascii?Q?tDisMQH3P5Nv57HDLlpTahrPxfP5oGFeUbwocaeGjYcis0OjlmI/MuNdE/G3?=
 =?us-ascii?Q?XE5Y9XFiNp9JuBzZ3NebNrwVnDBqmkkz15mmyaHFghMpMKnCVZN909SOgK20?=
 =?us-ascii?Q?Mda/QdPTl6l4qER5pLhCxw+5OT+imtH47WhQAr0i3ZYCIKOWA4/Y5j+Ddggc?=
 =?us-ascii?Q?I4JlLsMEFaLUB4GwrknjxecLL0KZgXkSDSmq5MGdLfurHO7Ev7zBZgqYFcIf?=
 =?us-ascii?Q?ZV1tmrUeHWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3hFK72uTd9VGtkWHqG0hl9s5weFP7wN0bxodBaNJPkulqDF4otPqyWK4b3g?=
 =?us-ascii?Q?vOkJC0qRr0gXYmmHxzFJFfWszQ/D3LANFqHr9nEnxeTaggagV+kX8TalO17z?=
 =?us-ascii?Q?LOY0OTrvdQmyk5UGo3Y6jPmEVTqejyBhfXN6fbkFSZwi24uYtdaPsJrq/1LA?=
 =?us-ascii?Q?3xG6IQypiF4CAdY/92CbcWeNseya9k2eesUC4//QIwSnveKgi5ZUkMjmtf5/?=
 =?us-ascii?Q?xFV5enQCvfMWdmh88tbcpZDP7I4ZoY2mDOw9lusfVhMdN+qayxhamOWHiinf?=
 =?us-ascii?Q?IffgQOqVgJTgd5KwqKyJ+kRR+eOcRE84jV7cRNO7k51OEt/gcgdUohdXC7qK?=
 =?us-ascii?Q?q2sGDo1LV+8pdkbMyt0aSOOW61Ckg4fQWs4AMtrR2UhdKt2vPC5kcUkdlOBF?=
 =?us-ascii?Q?W+3Kptm77pzA9Y6OJLgpsJio5qG70yoPTCU7XBaA2LacPbm3SRGx+IxP5ZZq?=
 =?us-ascii?Q?jx3flI4z4cga/YOGfd4k0lgm7HdnnCD6IIpovu1uKg7nVJBoNu9mYmNjio+L?=
 =?us-ascii?Q?gU4ZLEaxDSE4Xb8IWAJx8vJQ2t9Jh+wjmNQaw585BK10lsuFPoqbSCQbBO0N?=
 =?us-ascii?Q?Qqm6QPwRs2EEDNr20bxFN23YRlZmn1tRQ6O72KaH07VTg3QDJsMqhfslQeV2?=
 =?us-ascii?Q?jLa/YD48ugKIKS9qIguJgqm5eXrI1rt+ta+PuRu3xf5+2E3LEMSKMzN7qYfU?=
 =?us-ascii?Q?tD01q9XU3YS9rHucv7FXP8mSuZnDYyxTS376DFS7IVKD+nuzBZZAwMa/QFFN?=
 =?us-ascii?Q?XAjKiTOIWoFWpsNTNNfHlIWxP4ab/RJE6oWy9N7f3w1WKUvbkx8tajpRkwnb?=
 =?us-ascii?Q?XLoEXtoRuoQESuv0h0LgY88W5ZhOEncrLvsbpF0yYmeZICOXL2zAmSJyfv8b?=
 =?us-ascii?Q?GOKHcogTvgNKthWym12ccNzyhzj6Mtf9B5xbmPkAXamkAmIZTdRePlWl3TLU?=
 =?us-ascii?Q?FBlQX0iRvolXsKepvL+SwLEzqvyVipM4mdKTaQ42U+VcHU74H/kSE7K2nhdI?=
 =?us-ascii?Q?Qb8BpPozvQroPLHbUwmvA9HUsSsN93UanlYIoHjNQ2Q7ahXNqJgfQM8tpFUs?=
 =?us-ascii?Q?aNr+E9ZeeYCQK8NIpLARu4lAXatr0nB9IYmBsgQQN2MwctCwC3Ks0XItmNbE?=
 =?us-ascii?Q?DybMok8EOBhFKeKmTHQX6FqR+viIjwhoPU4ARidnXUDYktgo43MdYHlEEGAR?=
 =?us-ascii?Q?BhbpC2kkb7d2bYaPA1csxVMtftPWW5iXn5LQZefK+O3xgxIyJ1ibWeNILhtg?=
 =?us-ascii?Q?e/u/VHaizl+kZ42a69qEmh+O267UjOiiiayQZLI67wX+w2+/FiuT+Wk3Ocr3?=
 =?us-ascii?Q?nvtISQb2s2KUt2/nNlYvQjdsYXILD/jGsl2oQqKuc0id5beH3AVIpYKztBFm?=
 =?us-ascii?Q?jXn9swp23Tida1VTr+AGUIcPOQQtMt1Ozj/bSioIscEIWihrYQd+T/BSdozH?=
 =?us-ascii?Q?9woZR2/qUl8adcZryGPAYBxqHi5SDpF3Ody9yOpQa6U7NMF0iT5+V5EsgeUD?=
 =?us-ascii?Q?q5/GiSgTVmquYq1Nr68oT5jJJ76QLSVQ2Y6I84095YWlTq4tDzAxvjGxuFQ0?=
 =?us-ascii?Q?IMt+3fsvcNv7ZXMb8hGclWSyrtp9NZdp8AMtMKFq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02957049-3e1a-47f7-9227-08dda2b159fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:14:36.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJaihGA4xAGZsjuchh96oKgiQ/vdKnzMGkz0WyLBqXy02PN//bZsD/s/RK1Q2WtB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8278

On 3 Jun 2025, at 10:55, Zi Yan wrote:

> On 3 Jun 2025, at 9:03, David Hildenbrand wrote:
>
>> On 21.05.25 23:57, Juan Yescas wrote:
>>> Problem: On large page size configurations (16KiB, 64KiB), the CMA
>>> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerabl=
y,
>>> and this causes the CMA reservations to be larger than necessary.
>>> This means that system will have less available MIGRATE_UNMOVABLE and=

>>> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to t=
hem.
>>>
>>> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
>>> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
>>> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>>>
>>> For example, in ARM, the CMA alignment requirement when:
>>>
>>> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
>>> - CONFIG_TRANSPARENT_HUGEPAGE is set:
>>>
>>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTE=
S
>>> ---------------------------------------------------------------------=
--
>>>     4KiB   |      10        |       9         |  4KiB * (2 ^  9) =3D =
  2MiB
>>>    16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D =
 32MiB
>>>    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D =
512MiB
>>>
>>> There are some extreme cases for the CMA alignment requirement when:
>>>
>>> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
>>> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
>>> - CONFIG_HUGETLB_PAGE is NOT set
>>>
>>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYT=
ES
>>> ---------------------------------------------------------------------=
---
>>>     4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D =
128MiB
>>>    16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D =
128MiB
>>>    64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D =
512MiB
>>>
>>> This affects the CMA reservations for the drivers. If a driver in a
>>> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
>>> reservation has to be 32MiB due to the alignment requirements:
>>>
>>> reserved-memory {
>>>      ...
>>>      cma_test_reserve: cma_test_reserve {
>>>          compatible =3D "shared-dma-pool";
>>>          size =3D <0x0 0x400000>; /* 4 MiB */
>>>          ...
>>>      };
>>> };
>>>
>>> reserved-memory {
>>>      ...
>>>      cma_test_reserve: cma_test_reserve {
>>>          compatible =3D "shared-dma-pool";
>>>          size =3D <0x0 0x2000000>; /* 32 MiB */
>>>          ...
>>>      };
>>> };
>>>
>>> Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
>>> allows to set the page block order in all the architectures.
>>> The maximum page block order will be given by
>>> ARCH_FORCE_MAX_ORDER.
>>>
>>> By default, CONFIG_PAGE_BLOCK_ORDER will have the same
>>> value that ARCH_FORCE_MAX_ORDER. This will make sure that
>>> current kernel configurations won't be affected by this
>>> change. It is a opt-in change.
>>>
>>> This patch will allow to have the same CMA alignment
>>> requirements for large page sizes (16KiB, 64KiB) as that
>>> in 4kb kernels by setting a lower pageblock_order.
>>>
>>> Tests:
>>>
>>> - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
>>> on 4k and 16k kernels.
>>>
>>> - Verified that Transparent Huge Pages work when pageblock_order
>>> is 1, 7, 10 on 4k and 16k kernels.
>>>
>>> - Verified that dma-buf heaps allocations work when pageblock_order
>>> is 1, 7, 10 on 4k and 16k kernels.
>>>
>>> Benchmarks:
>>>
>>> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. Th=
e
>>> reason for the pageblock_order 7 is because this value makes the min
>>> CMA alignment requirement the same as that in 4kb kernels (2MB).
>>>
>>> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
>>> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
>>> (https://developer.android.com/ndk/guides/simpleperf) to measure
>>> the # of instructions and page-faults on 16k kernels.
>>> The benchmark was executed 10 times. The averages are below:
>>>
>>>             # instructions         |     #page-faults
>>>      order 10     |  order 7       | order 10 | order 7
>>> --------------------------------------------------------
>>>   13,891,765,770	 | 11,425,777,314 |    220   |   217
>>>   14,456,293,487	 | 12,660,819,302 |    224   |   219
>>>   13,924,261,018	 | 13,243,970,736 |    217   |   221
>>>   13,910,886,504	 | 13,845,519,630 |    217   |   221
>>>   14,388,071,190	 | 13,498,583,098 |    223   |   224
>>>   13,656,442,167	 | 12,915,831,681 |    216   |   218
>>>   13,300,268,343	 | 12,930,484,776 |    222   |   218
>>>   13,625,470,223	 | 14,234,092,777 |    219   |   218
>>>   13,508,964,965	 | 13,432,689,094 |    225   |   219
>>>   13,368,950,667	 | 13,683,587,37  |    219   |   225
>>> -------------------------------------------------------------------
>>>   13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
>>>
>>> There were 4.85% #instructions when order was 7, in comparison
>>> with order 10.
>>>
>>>       13,803,137,433 - 13,131,974,268 =3D -671,163,166 (-4.86%)
>>>
>>> The number of page faults in order 7 and 10 were the same.
>>>
>>> These results didn't show any significant regression when the
>>> pageblock_order is set to 7 on 16kb kernels.
>>>
>>> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 ti=
mes
>>>   on the 16k kernels with pageblock_order 7 and 10.
>>>
>>> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
>>> -------------------------------------------------------------------
>>>    15.8	 |  16.4    |         0.6        |     3.80%
>>>    16.4	 |  16.2    |        -0.2        |    -1.22%
>>>    16.6	 |  16.3    |        -0.3        |    -1.81%
>>>    16.8	 |  16.3    |        -0.5        |    -2.98%
>>>    16.6	 |  16.8    |         0.2        |     1.20%
>>> -------------------------------------------------------------------
>>>    16.44     16.4            -0.04	          -0.24%   Averages
>>>
>>> The results didn't show any significant regression when the
>>> pageblock_order is set to 7 on 16kb kernels.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> CC: Mike Rapoport <rppt@kernel.org>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>> Cc: Minchan Kim <minchan@kernel.org>
>>> Signed-off-by: Juan Yescas <jyescas@google.com>
>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>> ---
>>> Changes in v7:
>>>    - Update alignment calculation to 2MiB as per David's
>>>      observation.
>>>    - Update page block order calculation in mm/mm_init.c for
>>>      powerpc when CONFIG_HUGETLB_PAGE_SIZE_VARIABLE is set.
>>>
>>> Changes in v6:
>>>    - Applied the change provided by Zi Yan to fix
>>>      the Kconfig. The change consists in evaluating
>>>      to true or false in the if expression for range:
>>>      range 1 <symbol> if <expression to eval true/false>.
>>>
>>> Changes in v5:
>>>    - Remove the ranges for CONFIG_PAGE_BLOCK_ORDER. The
>>>      ranges with config definitions don't work in Kconfig,
>>>      for example (range 1 MY_CONFIG).
>>>    - Add PAGE_BLOCK_ORDER_MANUAL config for the
>>>      page block order number. The default value was not
>>>      defined.
>>>    - Fix typos reported by Andrew.
>>>    - Test default configs in powerpc.
>>>
>>> Changes in v4:
>>>    - Set PAGE_BLOCK_ORDER in incluxe/linux/mmzone.h to
>>>      validate that MAX_PAGE_ORDER >=3D PAGE_BLOCK_ORDER at
>>>      compile time.
>>>    - This change fixes the warning in:
>>>    https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@in=
tel.com/
>>>
>>> Changes in v3:
>>>    - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
>>>      as per Matthew's suggestion.
>>>    - Update comments in pageblock-flags.h for pageblock_order
>>>      value when THP or HugeTLB are not used.
>>>
>>> Changes in v2:
>>>    - Add Zi's Acked-by tag.
>>>    - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
>>>      per Zi and Matthew suggestion so it is available to
>>>      all the architectures.
>>>    - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
>>>      ARCH_FORCE_MAX_ORDER is not available.
>>>
>>>   include/linux/mmzone.h          | 16 ++++++++++++++++
>>>   include/linux/pageblock-flags.h |  8 ++++----
>>>   mm/Kconfig                      | 34 ++++++++++++++++++++++++++++++=
+++
>>>   mm/mm_init.c                    |  2 +-
>>>   4 files changed, 55 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>> index 6ccec1bf2896..05610337bbb6 100644
>>> --- a/include/linux/mmzone.h
>>> +++ b/include/linux/mmzone.h
>>> @@ -37,6 +37,22 @@
>>>    #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
>>>  +/* Defines the order for the number of pages that have a migrate ty=
pe. */
>>> +#ifndef CONFIG_PAGE_BLOCK_ORDER
>>> +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
>>> +#else
>>> +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>>> +#endif /* CONFIG_PAGE_BLOCK_ORDER */
>>> +
>>> +/*
>>> + * The MAX_PAGE_ORDER, which defines the max order of pages to be al=
located
>>> + * by the buddy allocator, has to be larger or equal to the PAGE_BLO=
CK_ORDER,
>>> + * which defines the order for the number of pages that can have a m=
igrate type
>>> + */
>>> +#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
>>> +#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>>> +#endif
>>> +
>>>   /*
>>>    * PAGE_ALLOC_COSTLY_ORDER is the order at which allocations are de=
emed
>>>    * costly to service.  That is between allocation orders which shou=
ld
>>> diff --git a/include/linux/pageblock-flags.h b/include/linux/pagebloc=
k-flags.h
>>> index fc6b9c87cb0a..e73a4292ef02 100644
>>> --- a/include/linux/pageblock-flags.h
>>> +++ b/include/linux/pageblock-flags.h
>>> @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
>>>    * Huge pages are a constant size, but don't exceed the maximum all=
ocation
>>>    * granularity.
>>>    */
>>> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX=
_PAGE_ORDER)
>>> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAG=
E_BLOCK_ORDER)
>>>    #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>>>    #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>>>  -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_P=
AGE_ORDER)
>>> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_B=
LOCK_ORDER)
>>>    #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>>>  -/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
>>> -#define pageblock_order		MAX_PAGE_ORDER
>>> +/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
>>> +#define pageblock_order		PAGE_BLOCK_ORDER
>>>    #endif /* CONFIG_HUGETLB_PAGE */
>>>  diff --git a/mm/Kconfig b/mm/Kconfig
>>> index e113f713b493..13a5c4f6e6b6 100644
>>> --- a/mm/Kconfig
>>> +++ b/mm/Kconfig
>>> @@ -989,6 +989,40 @@ config CMA_AREAS
>>>    	  If unsure, leave the default value "8" in UMA and "20" in NUMA.=

>>>  +#
>>> +# Select this config option from the architecture Kconfig, if availa=
ble, to set
>>> +# the max page order for physically contiguous allocations.
>>> +#
>>> +config ARCH_FORCE_MAX_ORDER
>>> +	int
>>> +
>>> +#
>>> +# When ARCH_FORCE_MAX_ORDER is not defined,
>>> +# the default page block order is MAX_PAGE_ORDER (10) as per
>>> +# include/linux/mmzone.h.
>>> +#
>>> +config PAGE_BLOCK_ORDER
>>> +	int "Page Block Order"
>>> +	range 1 10 if ARCH_FORCE_MAX_ORDER =3D 0
>>> +	default 10 if ARCH_FORCE_MAX_ORDER =3D 0
>>> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
>>> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
>>> +	help
>>> +	  The page block order refers to the power of two number of pages t=
hat
>>> +	  are physically contiguous and can have a migrate type associated =
to
>>> +	  them. The maximum size of the page block order is limited by
>>> +	  ARCH_FORCE_MAX_ORDER.
>>> +
>>> +	  This config allows overriding the default page block order when t=
he
>>> +	  page block order is required to be smaller than ARCH_FORCE_MAX_OR=
DER
>>> +	  or MAX_PAGE_ORDER.
>>> +
>>> +	  Reducing pageblock order can negatively impact THP generation
>>> +	  success rate. If your workloads uses THP heavily, please use this=

>>> +	  option with caution.
>>> +
>>> +	  Don't change if unsure.
>>
>>
>> The semantics are now very confusing [1]. The default in x86-64 will b=
e 10, so we'll have
>>
>> CONFIG_PAGE_BLOCK_ORDER=3D10
>>
>>
>> But then, we'll do this
>>
>> #define pageblock_order MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOC=
K_ORDER)
>>
>>
>> So the actual pageblock order will be different than CONFIG_PAGE_BLOCK=
_ORDER.
>>
>> Confusing.
>>
>> Either CONFIG_PAGE_BLOCK_ORDER is misnamed (CONFIG_PAGE_BLOCK_ORDER_CE=
IL ? CONFIG_PAGE_BLOCK_ORDER_LIMIT ?), or the semantics should be changed=
=2E
>
> IIRC, Juan's intention is to limit/lower pageblock order to reduce CMA =
region
> size. CONFIG_PAGE_BLOCK_ORDER_LIMIT sounds reasonable to me.

LIMIT might be still ambiguous, since it can be lower limit or upper limi=
t.
CONFIG_PAGE_BLOCK_ORDER_CEIL is better. Here is the patch I come up with,=

if it looks good to you, I can send it out properly.

=46rom 7fff4fd87ed3aa160db8d2f0d9e5b219321df4f9 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Tue, 3 Jun 2025 11:09:37 -0400
Subject: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_ORDER_CEIL.

The config is in fact an additional upper limit of pageblock_order, so
rename it to avoid confusion.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h          | 14 +++++++-------
 include/linux/pageblock-flags.h |  8 ++++----
 mm/Kconfig                      | 15 ++++++++-------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 283913d42d7b..523b407e63e8 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -38,19 +38,19 @@
 #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)

 /* Defines the order for the number of pages that have a migrate type. *=
/
-#ifndef CONFIG_PAGE_BLOCK_ORDER
-#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
+#ifndef CONFIG_PAGE_BLOCK_ORDER_CEIL
+#define PAGE_BLOCK_ORDER_CEIL MAX_PAGE_ORDER
 #else
-#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
-#endif /* CONFIG_PAGE_BLOCK_ORDER */
+#define PAGE_BLOCK_ORDER_CEIL CONFIG_PAGE_BLOCK_ORDER_CEIL
+#endif /* CONFIG_PAGE_BLOCK_ORDER_CEIL */

 /*
  * The MAX_PAGE_ORDER, which defines the max order of pages to be alloca=
ted
- * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_O=
RDER,
+ * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_O=
RDER_CEIL,
  * which defines the order for the number of pages that can have a migra=
te type
  */
-#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
-#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
+#if (PAGE_BLOCK_ORDER_CEIL > MAX_PAGE_ORDER)
+#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER_CEIL
 #endif

 /*
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-fl=
ags.h
index e73a4292ef02..e7a86cd238c2 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
  * Huge pages are a constant size, but don't exceed the maximum allocati=
on
  * granularity.
  */
-#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BL=
OCK_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BL=
OCK_ORDER_CEIL)

 #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */

 #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)

-#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK=
_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK=
_ORDER_CEIL)

 #else /* CONFIG_TRANSPARENT_HUGEPAGE */

-/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
-#define pageblock_order		PAGE_BLOCK_ORDER
+/* If huge pages are not used, group by PAGE_BLOCK_ORDER_CEIL */
+#define pageblock_order		PAGE_BLOCK_ORDER_CEIL

 #endif /* CONFIG_HUGETLB_PAGE */

diff --git a/mm/Kconfig b/mm/Kconfig
index eccb2e46ffcb..3b27e644bd1f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1017,8 +1017,8 @@ config ARCH_FORCE_MAX_ORDER
 # the default page block order is MAX_PAGE_ORDER (10) as per
 # include/linux/mmzone.h.
 #
-config PAGE_BLOCK_ORDER
-	int "Page Block Order"
+config PAGE_BLOCK_ORDER_CEIL
+	int "Page Block Order Upper Limit"
 	range 1 10 if ARCH_FORCE_MAX_ORDER =3D 0
 	default 10 if ARCH_FORCE_MAX_ORDER =3D 0
 	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER !=3D 0
@@ -1026,12 +1026,13 @@ config PAGE_BLOCK_ORDER
 	help
 	  The page block order refers to the power of two number of pages that
 	  are physically contiguous and can have a migrate type associated to
-	  them. The maximum size of the page block order is limited by
-	  ARCH_FORCE_MAX_ORDER.
+	  them. The maximum size of the page block order is at least limited by=

+	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER.

-	  This config allows overriding the default page block order when the
-	  page block order is required to be smaller than ARCH_FORCE_MAX_ORDER
-	  or MAX_PAGE_ORDER.
+	  This config adds a new upper limit of default page block
+	  order when the page block order is required to be smaller than
+	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER or other limits
+	  (see include/linux/pageblock-flags.h for details).

 	  Reducing pageblock order can negatively impact THP generation
 	  success rate. If your workloads uses THP heavily, please use this
-- =

2.47.2



Best Regards,
Yan, Zi
