Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1425CC58
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536395; cv=fail; b=U+LKIkhW5pUTZ82jf1kMbDa8+SYLWj9xgdvTWwMQvAfT2KUbQgegdac/+SIl+qA0jnSJz0UddKqTDkGpQIwsPbLZvDidPPQHFg4K/JRFZIEa4JLvnArXybYGcUVjvXd68bitvw+N3naYy+R/bezy8qMca9x42dajQWPOlCLg6pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536395; c=relaxed/simple;
	bh=bmnk7z5+8rti2ZD+9Dt1KT7EYAiJuS7robjE2X6D2fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g28gYc+Kcy/2/gd/l+fDayaZEfGngNPGmrA15Y28Z3GWD7KmR1feMaeZLQJAKMJOWL+05uplc348Zcv6XH/3DryEJFUd1B2KUK8SHEIa3CzsuXnqoVaoXcQdV7RAB+F9RZVvXBeb9J7ik7+ajM2mGFa89pKjz67iWFCMjfpWeFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JjlYHAHX; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JjlYHAHX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhrSopMVcNyC5VLDYeSInLBYMIcW7D1GZG+s4jiI+rjdRE70/4YMsNaFxDDKlZr78pEe8LsKmGbeM4SLjK7rkebHJhxHm+gXUKEtd2BmjyqB/TUDEA6zYLRw/hH9+oCiBbjsX2QpAuqUO3aAPfVRPnThlYsQWlgm6mWrB0+VWMFJHcgsLpYP8WFuJG57TQOI3+vNgwpJurKvxMUU3J+K2vtTtndbAwEHLF40jn0Mww5vFQ3TALW5uXbagBYLkJFqC1ebbNNnsOiM8FA6Ziue7XnerLY2JfD3EA5LODi3WrZx1YEV43DVGAiYfH0Gbv5Y0PEa6dSOYAoBrjUYwm3Guw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ/EAfJENo3TLx2kvcFkhlm5UHVWQn4eWH7ltaTtkBg=;
 b=M+jwAeihsh3H+/E5DJRJ229cPuH019DvY3e9sCyPbUgCvWSwVm/6wVTDYQ7NFEHzONnZ7MuhSFmeCdmg/8dA8eSqSsblWq/nSYSmoiejKgjzYHq2y185XVd/Ke4YbTjzKmHYDgGXoEZjNzfnJQqqB1BpE+zF5Y9r9w6fkHz5B9JSp+8vNlZPeQla2uXIcxtwFnuOobrp9IrEx/ySeEPhPr7uP+RijKfxNPLYhiy3gz/4w3+9211OkChROvrL24lXqV1nUZrRAjg05l4wJoX9/hBPIILK+Iowkty30bM7JQFpp7gX6QhgEWELjhlcaEpOAvhUlMfc4f4+Dj7J5u4O0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ/EAfJENo3TLx2kvcFkhlm5UHVWQn4eWH7ltaTtkBg=;
 b=JjlYHAHXX46VfX0n35Xs+xbuIAvytThUJxel+OEgBtqegKo7h+reed7CJfIojnYlUMmEBizx6mw6sxTNjlZG0l9X4bvm2DhLmBB1bWkXQGRqwFv4imVNaaqwaMfrrXIJB3r+i1aoPxWZHdy1GWdJUuVev3//6y1m3fkIdLtK3gT4BiYaKimeU6zp774wtZDs4uBDhsUumZMx8OdwfsrNwZmwgS3g7IqjeVSCHvC2OgiztPVN2XYOAeey+OLcHx4YFc38L266H3z9riybvBkjLPCsOWGKd7rEvhEZYFbf3yIR8f8uy9hEfRdum1njSZ9HFLaTneu7vcWTP6B6izoX7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ5PPFF62310189.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 6 May
 2025 12:59:46 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 12:59:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Tue, 06 May 2025 08:59:43 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <76A363AB-13DD-4969-B58B-9A56BB4E409E@nvidia.com>
In-Reply-To: <64a0c678-ead9-4620-b69b-e631d6e540f9@arm.com>
References: <20250506002319.513795-1-jyescas@google.com>
 <64a0c678-ead9-4620-b69b-e631d6e540f9@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:408:e8::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ5PPFF62310189:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c93b7b-6f51-4476-dcf4-08dd8c9de06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WJQ+uqJ0MOvUnZWZEOP/Zelzh9la/CKckM8G20DE+TkxPxgwZMKl3LYJLfcr?=
 =?us-ascii?Q?7rkN5iUiVjzAOMlhXnpMknCKjDz9zskmi7CK0AUZHLirV8eV/Rjw8C0xiDc+?=
 =?us-ascii?Q?reQ0+MvxdBPjYPXnjounI5H9/SiNlyNlDFvu16xos0KVzUqgER/QIIPwOk9d?=
 =?us-ascii?Q?StD1Eq4Y7Gi98HW7177q9cH6sxOALTgM0hx9MHpuHUHX8KggkU5Uj40oopL6?=
 =?us-ascii?Q?dzRy+dEOwJL8n1XklfbcUlFC7pGGzvsyE9HPW7iyWQ65O6vSGdWx3abVPbsf?=
 =?us-ascii?Q?HcvRT0UHIMqJHnLNPf603AlP4JVNPqOWIf287qUnXg5atu3tYBCHlabBUAsR?=
 =?us-ascii?Q?DWXOqzR+F/w7GbJHUdii8dWfYw2BiRroX+UUsixtyxUcpp7n18RrZqeykN3+?=
 =?us-ascii?Q?mXTWTpvk1vILUl6zX8j8ucJriUd2b7giHVPz8L7TKgz/JBwwJcllCBosMFyQ?=
 =?us-ascii?Q?GOOS7klLWASwmn5SjnKtDTGVYTfrfpbPbJ0nbJ3LreIMmnClLzPw8oq5nEn/?=
 =?us-ascii?Q?MbdYHsSf29FRsIgRft5rBxcA2siJ9H7Jvdydf4doZqh2k9Su2jbNi1JLZ6ky?=
 =?us-ascii?Q?jN0fp81LIBl5xNKqTRh/oUBcyLVXAkosULNoB14alqa4oQOORrXcpBfgszjS?=
 =?us-ascii?Q?0/HgY5MHIcAXJRFNT7Su+gphH0kbdDBu1RkFlpntpeJDkCFecX07vo3nTHXv?=
 =?us-ascii?Q?w5b99hymWG0Wxk5jpLoGUCey3dXQQOJ/V0XIDL15OwYVD0hvu+aYx+fIxUP0?=
 =?us-ascii?Q?257Qu7WlnXfvCcUQEQvaBAdF3wjBhAL9R4uSTy45iihM/qynz+5y2XeFWDWw?=
 =?us-ascii?Q?0k/Sdv/qJ3lugMdBexx4EQQMrVGI4AUBRdC6+tM47ViSCEHCfi0Tm4iEDvI3?=
 =?us-ascii?Q?s/O3c41zBdEUR19AHyRui5kBabQKTH29KRQY8n/cKYiLELYENudEg++7ZO5j?=
 =?us-ascii?Q?m4waj5OCdsfR/fLsKa2Rluoaqn3qlvgtY5a17DeqzDhVCAf2Js2p619WlVvB?=
 =?us-ascii?Q?EPZk7IraIO9Spx9pmdSpBz9lBA8ee9bQ0OEBPDLGsN2pERHo0d+LyLGsptB3?=
 =?us-ascii?Q?uPovFD9+CxowWCHtvraLbOB7xbGKcK4gntGcVAnm6RoPus4U3VJdc52kKoFl?=
 =?us-ascii?Q?ypGTzKFZ/6Kx6O3AXrFD8BKi0jF/AnN1tcXIAQE6hNtMdA4VGsLuTfRouuR7?=
 =?us-ascii?Q?LDjot6CLZRA5+eloNMfyZ+Rd6H8fJPg8gtXHCSigiXBUuJmVvZtte1iNk2jw?=
 =?us-ascii?Q?0Yu/0L/WdDgSHNbrdCMUjYasIKPAAL9PZt4SNmzDxMGmD5zsEEe1k6EboGkQ?=
 =?us-ascii?Q?gXxYQzZ20V7GFAzwITBT7DHLgZogH/WSKsC70z9B1l+7zE418CD56nHf6Fo8?=
 =?us-ascii?Q?b0NcBnzl9rUVBM6u4s30w3lZv3x49o2fd6HqZTsBVOLN2a0pBo2jyw/H7bTU?=
 =?us-ascii?Q?HisDdBUfeyQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+1+0EJq116p6Fe21UhNZZkx5a/IOi5PKnTnJu3LdnV/7NblQTyQJz3WJGyfv?=
 =?us-ascii?Q?ohXLTHVFIu/VSMescxv6B5J4RM5I3QwWR3QrmeM3NGN53LAN+GKkRwSlVjtd?=
 =?us-ascii?Q?Ned/MwbE8m2+sliaDOlzkXLyIIfGakeMtD3sFVBbs6L8coaO/Zmva760utey?=
 =?us-ascii?Q?7czpaYQ55lo9ADq2OF9vQrJqZ3JX4I3M/v15zb9MYUVtTcXCjcHlNJ1HCzI/?=
 =?us-ascii?Q?I4rDNuzmVtNAHeakCoPI/iSfWoY8LAuKesuOixp7HvSUHVb/eWLl8hC7KrW6?=
 =?us-ascii?Q?G43ycqrhF3yKRanZkuFe9X1ewZSTYrvWKCKwXnX5j88+tQoouLnWWpVjs6p1?=
 =?us-ascii?Q?kLVnh7n40BOVyyKkkfS6O/LrkSvhTL3nGXrKwz/w3lCjf9P5n5JlCVsvdMGb?=
 =?us-ascii?Q?TMaVTL4De1udjozeVYsUkwAcOqz3wFaZkScwjffhYzYdjCsK0eEiNPkYJmDm?=
 =?us-ascii?Q?6DnnlFrKU4QU6J7dNh1MgPvPLLN4v8yqfQ8ipC6kB/5Xi5GddFCB1ec2FjFT?=
 =?us-ascii?Q?S00RMsrqzCd31pk9W5ZvLWBlpNHPJ00iA2FyVJswt/C7F2vVkeapojGswQvp?=
 =?us-ascii?Q?KmG0hASx2QUZMxBi4FYJc8BEdc3ryHHV6AbsULb43zqyjeMD6+mDqBNUvlWu?=
 =?us-ascii?Q?Avvd4hJvLmmWSqQrRGvS/S8HHummFzxdb//GCLxgvrR587LKFIm7xQ5/N0ue?=
 =?us-ascii?Q?kwph0MjM/sarwvU/XIHFcGAGycAMor8W7ugSkFJh+SM1AqcpfFnuttqQ92Rz?=
 =?us-ascii?Q?JKjwuPGDNv97bCNs+EZPvuGwIwdhBa7r612WIOUlayYM51VOc05IaD9+rSnP?=
 =?us-ascii?Q?PMjr38DNIM+ZPU45iV6yHH9W2Pnzv2AfbXtfwmsh7gFZhREhbLTZIpdIGtSo?=
 =?us-ascii?Q?kDwb+KHavJF9bEX/s1MbSG1CJRaJtCObh5bC4TwtuoCa6HQqnUJwcutaULwn?=
 =?us-ascii?Q?Q9sq563k20nPVozCf1GhnZKo25Ontnzb2tmXi0rCriMujNuUDcj8ULsHLo1W?=
 =?us-ascii?Q?FVIvdT8wP6Eerc+Tqw8RVpUVlMDFdMQQKIFaijf/eiM80wNS066Eq4UPZUnE?=
 =?us-ascii?Q?yEdhZCIhURqtkXVstXzbS/lPb53diMjrSFD7v+xu6fA0rd9wkUWyLnOFdYfy?=
 =?us-ascii?Q?agJNGhzIOtXqS74v66wXZoBokoygkmQgmGbWRfnR61EXaivMUqxsy8f++Cbs?=
 =?us-ascii?Q?E/ZM5XbW9+LG5aTfEwFcGlKsf7nqFUsBQ0gERz3BHcFZ5y1ivJ+sfEmDTAri?=
 =?us-ascii?Q?HSq7ibJDnbe3HiGvnhNeJ1UkP78kIlsDmx+8BC7+l1cgMf6P8v6LD2S747rf?=
 =?us-ascii?Q?EaMd+C9vHk4MZzK2uNQGKeMcShz+UJxbuEYDT996MK00QRNM/1d0hk50Kqky?=
 =?us-ascii?Q?6A/MebGbmxp6UR0cUgDR1ue2v8H25CQTbjSkb7eI2c2lRqXDkihRNRHa+j6K?=
 =?us-ascii?Q?LhUODdyEZqTSeMQj73Y0U310xlHuT7KF0jxN5yrrGiNtC9S+p08OkJMQt9nw?=
 =?us-ascii?Q?kTlPSS3l7kVFuagoLCNwuJmNYH+5fu2mLho6n2sKEgnTuuWxdvvqR++n6Kaw?=
 =?us-ascii?Q?kCINryTU1kMoQ8Nbe+MgheiATum5da0N87tc+pEA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c93b7b-6f51-4476-dcf4-08dd8c9de06e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:59:46.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV4v2gDA5jkj2ims4WfMsVVh6ccEDXPo0M5ttv8PM17ukgIxlop/ezz8bDcSm77T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF62310189

On 6 May 2025, at 2:53, Anshuman Khandual wrote:

> On 5/6/25 05:52, Juan Yescas wrote:
>> Problem: On large page size configurations (16KiB, 64KiB), the CMA
>> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
>> and this causes the CMA reservations to be larger than necessary.
>> This means that system will have less available MIGRATE_UNMOVABLE and
>> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
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
>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
>> -----------------------------------------------------------------------
>>    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =  4MiB
>>   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
>>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>>
>> There are some extreme cases for the CMA alignment requirement when:
>>
>> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
>> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
>> - CONFIG_HUGETLB_PAGE is NOT set
>>
>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
>> ------------------------------------------------------------------------
>>    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
>>   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
>>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>>
>> This affects the CMA reservations for the drivers. If a driver in a
>> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
>> reservation has to be 32MiB due to the alignment requirements:
>>
>> reserved-memory {
>>     ...
>>     cma_test_reserve: cma_test_reserve {
>>         compatible = "shared-dma-pool";
>>         size = <0x0 0x400000>; /* 4 MiB */
>>         ...
>>     };
>> };
>>
>> reserved-memory {
>>     ...
>>     cma_test_reserve: cma_test_reserve {
>>         compatible = "shared-dma-pool";
>>         size = <0x0 0x2000000>; /* 32 MiB */
>>         ...
>>     };
>> };
>
> This indeed is a valid problem which reduces available memory for
> non-CMA page blocks on system required for general memory usage.
>
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
>
> Right.
>
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
>
> pageblock_order are choosen as 1, 7 and 10 to cover the entire possible
> range for ARCH_FORCE_MAX_ORDER. Although kernel CI should test this for
> all values in the range. Because this now opens up different ranges for
> different platforms which were never tested earlier.
>
>>
>> Benchmarks:
>>
>> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
>> reason for the pageblock_order 7 is because this value makes the min
>> CMA alignment requirement the same as that in 4kb kernels (2MB).
>>
>> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
>> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
>> (https://developer.android.com/ndk/guides/simpleperf) to measure
>> the # of instructions and page-faults on 16k kernels.
>> The benchmark was executed 10 times. The averages are below:
>>
>>            # instructions         |     #page-faults
>>     order 10     |  order 7       | order 10 | order 7
>> --------------------------------------------------------
>>  13,891,765,770	 | 11,425,777,314 |    220   |   217
>>  14,456,293,487	 | 12,660,819,302 |    224   |   219
>>  13,924,261,018	 | 13,243,970,736 |    217   |   221
>>  13,910,886,504	 | 13,845,519,630 |    217   |   221
>>  14,388,071,190	 | 13,498,583,098 |    223   |   224
>>  13,656,442,167	 | 12,915,831,681 |    216   |   218
>>  13,300,268,343	 | 12,930,484,776 |    222   |   218
>>  13,625,470,223	 | 14,234,092,777 |    219   |   218
>>  13,508,964,965	 | 13,432,689,094 |    225   |   219
>>  13,368,950,667	 | 13,683,587,37  |    219   |   225
>> -------------------------------------------------------------------
>>  13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
>>
>> There were 4.85% #instructions when order was 7, in comparison
>> with order 10.
>>
>>      13,803,137,433 - 13,131,974,268 = -671,163,166 (-4.86%)
>>
>> The number of page faults in order 7 and 10 were the same.
>>
>> These results didn't show any significant regression when the
>> pageblock_order is set to 7 on 16kb kernels.
>>
>> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 times
>>  on the 16k kernels with pageblock_order 7 and 10.
>>
>> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
>> -------------------------------------------------------------------
>>   15.8	 |  16.4    |         0.6        |     3.80%
>>   16.4	 |  16.2    |        -0.2        |    -1.22%
>>   16.6	 |  16.3    |        -0.3        |    -1.81%
>>   16.8	 |  16.3    |        -0.5        |    -2.98%
>>   16.6	 |  16.8    |         0.2        |     1.20%
>> -------------------------------------------------------------------
>>   16.44     16.4            -0.04	          -0.24%   Averages
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
>> Changes in v3:
>>   - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
>>     as per Matthew's suggestion.
>>   - Update comments in pageblock-flags.h for pageblock_order
>>     value when THP or HugeTLB are not used.
>>
>> Changes in v2:
>>   - Add Zi's Acked-by tag.
>>   - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
>>     per Zi and Matthew suggestion so it is available to
>>     all the architectures.
>>   - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
>>     ARCH_FORCE_MAX_ORDER is not available.
>>
>>
>>
>>
>>  include/linux/pageblock-flags.h | 14 ++++++++++----
>>  mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
>>  2 files changed, 41 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
>> index fc6b9c87cb0a..0c4963339f0b 100644
>> --- a/include/linux/pageblock-flags.h
>> +++ b/include/linux/pageblock-flags.h
>> @@ -28,6 +28,12 @@ enum pageblock_bits {
>>  	NR_PAGEBLOCK_BITS
>>  };
>>
>> +#if defined(CONFIG_PAGE_BLOCK_ORDER)
>> +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>> +#else
>> +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
>> +#endif /* CONFIG_PAGE_BLOCK_ORDER */
>> +
>>  #if defined(CONFIG_HUGETLB_PAGE)
>>
>>  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
>> @@ -41,18 +47,18 @@ extern unsigned int pageblock_order;
>>   * Huge pages are a constant size, but don't exceed the maximum allocation
>>   * granularity.
>>   */
>> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_PAGE_ORDER)
>> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
>>
>>  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>>
>>  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>>
>> -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)
>> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
>>
>>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>>
>> -/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
>> -#define pageblock_order		MAX_PAGE_ORDER
>> +/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
>> +#define pageblock_order		PAGE_BLOCK_ORDER
>>
>>  #endif /* CONFIG_HUGETLB_PAGE */
>>
>
> These all look good.
>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index e113f713b493..c52be3489aa3 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -989,6 +989,37 @@ config CMA_AREAS
>>
>>  	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
>>
>> +#
>> +# Select this config option from the architecture Kconfig, if available, to set
>> +# the max page order for physically contiguous allocations.
>> +#
>> +config ARCH_FORCE_MAX_ORDER
>> +	int
>
> ARCH_FORCE_MAX_ORDER needs to be defined here first before PAGE_BLOCK_ORDER
> could use that subsequently.But ARCH_FORCE_MAX_ORDER is defined in various
> architectures in 'int' or 'int "<description>"' formats. So could there be
> a problem for this config to be defined both in generic and platform code ?
> But clearly ARCH_FORCE_MAX_ORDER still remains a arch specific config.
>
> #git grep "config ARCH_FORCE_MAX_ORDER"
> arch/arc/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/arm/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/arm64/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/loongarch/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/m68k/Kconfig.cpu:config ARCH_FORCE_MAX_ORDER
> arch/mips/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/nios2/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/powerpc/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/sh/mm/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/sparc/Kconfig:config ARCH_FORCE_MAX_ORDER
> arch/xtensa/Kconfig:config ARCH_FORCE_MAX_ORDER
> mm/Kconfig:config ARCH_FORCE_MAX_ORDER
>
> arch/arc/
>
> config ARCH_FORCE_MAX_ORDER
>         int "Maximum zone order"
>
> arch/arm/
>
> config ARCH_FORCE_MAX_ORDER
>         int "Order of maximal physically contiguous allocations"
>
> arch/arm64/
>
> config ARCH_FORCE_MAX_ORDER
>         int
> ...........
>
> arch/sparc/
>
> config ARCH_FORCE_MAX_ORDER
>         int "Order of maximal physically contiguous allocations"
>
>> +
>> +# When ARCH_FORCE_MAX_ORDER is not defined, the default page block order is 10,
>
> Just wondering - why the default is 10 ?

For x86_64, MAX_PAGE_ORDER is 10. I wonder if it is related.

>
>> +# as per include/linux/mmzone.h.
>> +config PAGE_BLOCK_ORDER
>> +	int "Page Block Order"
>> +	range 1 10 if !ARCH_FORCE_MAX_ORDER
>
> Also why the range is restricted to 10 ?
>
>> +	default 10 if !ARCH_FORCE_MAX_ORDER
>> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>
> We still have the MAX_PAGE_ORDER which maps into ARCH_FORCE_MAX_ORDER
> when available or otherwise just falls back as 10.
>
> /* Free memory management - zoned buddy allocator.  */
> #ifndef CONFIG_ARCH_FORCE_MAX_ORDER
> #define MAX_PAGE_ORDER 10
> #else
> #define MAX_PAGE_ORDER CONFIG_ARCH_FORCE_MAX_ORDER
> #endif
>
> Hence could PAGE_BLOCK_ORDER config description block be simplified as
>
> config PAGE_BLOCK_ORDER
> 	int "Page Block Order"
> 	range 1 MAX_PAGE_ORDER
> 	default MAX_PAGE_ORDER

Could this work? MAX_PAGE_ORDER is a macro defined in linux/mmzone.h.
Can Kconfig access it? I am not an expert on Kconfig.

>
> As MAX_PAGE_ORDER could switch between ARCH_FORCE_MAX_ORDER and 10 as
> and when required.

If the above Kconfig code work, that would be great.

>
>> +
>> +	help
>> +	  The page block order refers to the power of two number of pages that
>> +	  are physically contiguous and can have a migrate type associated to
>> +	  them. The maximum size of the page block order is limited by
>> +	  ARCH_FORCE_MAX_ORDER.
>
> s/ARCH_FORCE_MAX_ORDER/ARCH_FORCE_MAX_ORDER when available on the platform/ ?
>
> Also mention about max range when ARCH_FORCE_MAX_ORDER is not available.
>
>> +
>> +	  This option allows overriding the default setting when the page
>> +	  block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
>> +
>> +	  Reducing pageblock order can negatively impact THP generation
>> +	  successful rate. If your workloads uses THP heavily, please use this
>> +	  option with caution.
>
> Just wondering - could there be any other side effects besides THP ? Will it
> be better to depend on CONFIG_EXPERT while selecting anything other than the
> default option i.e ARCH_FORCE_MAX_ORDER or 10 from the value range.

Another side effect (or maybe benefit) is that things like virtio-balloon free
page reporting, virtio-mem using pageblock in their work can have smaller
granularity with a reduced pageblock size.


--
Best Regards,
Yan, Zi
