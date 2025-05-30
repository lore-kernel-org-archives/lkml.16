Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B0283C9E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638018; cv=fail; b=Hxy3Tf+dTXHAfmf4ijfTZxa1XP11bV6WoXCzBbK4scWu1/+Kjk9li/6E3wfVbejUZk+jD0Cb5x0+AHC1glsQ6EQNCZv+2FLxWTVBkWpg3uQ9KTzo4HEfsVNNlkISz96l5QvO+cY+h6YQEhXU72AIytsL3W+YQJpm9OyqGq2JcuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638018; c=relaxed/simple;
	bh=z2vGsRxvNz48Aj3ZMsZvLhnK2A/pKJ8YCV3GT2O5Id8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O1vA389pMfwEmLJ8/g74up9Ybk848L/yY1+2C47JiGYcivMrjvt55iBl6qbFOqeYtD1ipTaPakOsDjUyEghj34X3b+PX1NFpuEnvviir1fra9L7ZPddOITWHFwxfDMahOuVBRbyH/x3EDoPysGXyixb0X3VCeevG/g2AvdAcrGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KOi8WZNN; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KOi8WZNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGkQR0U91VExf0StrDhwWdWRI62L4g2x1DJuVgo+ncQVJuUxlB1nvpMsKG/WQorPuNuXSpZkq9wddo9dyOVYlgC16ox0teby3VytwZH53IhUqATSwhk3xFPcS5CekatS/pvGW8lelxN1xZz2U82DPDqf5zh8iAELiBeAgjIhbZlLpUemuEb7l10CLgGXa1Bd4kMwExPNhRABHb+0f01fyfeBuENDNrFP1NF5nAIJ/cVR6yRqHI40GyVmNL25dU0KuAvH1XJmcfHcuO8mrL1/6n+ZvRwwpyiLHNct1uoRMlEWdcsePI+8RW/oTOEf5rQ02JGcm+MwRf2qu9b3lZz19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjJbRXPj1eK9dG0hfNkuiSbTM0NUOKtHqNOIAtSZ2ks=;
 b=LLF8eftbZdGJ6DEkEk7EW+T66utx1swm8ycXAtVpkq811O+UWfiGeAzf2FYOvet+jPC6/sl5mFdmv7wZe6O9WVq5My6TI3T/jOLntrcozIXR+7TYE1gyXf1XfoM8NVBo318r4nBXqFrqzIx3uxTclxc3VFQErDH9b/55+2eayB2OvwOCinlELbSt+jManOPYVmcnq05R8l+vi94ZHBmwTsWwA4krMCJz8oU1wf/0N8pgJHiqjXDiW6I3eCA7mM+n4r2I9zhthJqILo0J9xmPfNIPINyXNgUwX1CPMQQnaj89+q4rLg6x4fhtlSPV3rpSZzJtvyA3TqNhw215mJjTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjJbRXPj1eK9dG0hfNkuiSbTM0NUOKtHqNOIAtSZ2ks=;
 b=KOi8WZNNJg77AwWZdboJSnxA8G85LCc/pezoMBvhFVGnUdYZ7GwH847HaVFGbpTGNyAjZtIPva5fM6trS03P/XYCb1QbkxaxPlekDuCT8lD+efdWHDf9LBvzyaSgk6/Msym6eZ2T3TGk37VFGcy0DpZSq9qhBnYrMLLGeKK3k13rr9fM4lCUUncwZ9fJAne0IJQqCeapFuk87pbARO8v8T/mPZxpq6DnEotsiC0BmNO1ByxX294z9I7U941iPPuwF8tpAAk9feqgOIDFrrZi9WJ2Fd/xxMGKx5SKIwlrlhtkBDcfsd4CqGCkgpkhU7bD4grxvxANbI3tHUmAP51L0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Fri, 30 May 2025 20:46:51 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 20:46:51 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Fri, 30 May 2025 16:46:49 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <BA6A258B-04D4-48F3-BB47-1F1DDAA0BDED@nvidia.com>
In-Reply-To: <50da1626-5894-42ef-b3fd-935a331f14c4@redhat.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-7-ziy@nvidia.com>
 <ac7351c1-cffe-4da6-9397-f9421e53f59f@redhat.com>
 <8C1EFB3C-0F1C-46DE-878A-3546A86A141F@nvidia.com>
 <50da1626-5894-42ef-b3fd-935a331f14c4@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:208:32d::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 21878c39-76f4-4aff-a6b8-08dd9fbb1ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3tpSFy3tWgxbU2aJP04rXUgXeYGfGDFVHVmBI2DLonfxAIdPlmyCx3EeFZHF?=
 =?us-ascii?Q?hNcJP6a31UB20KH1RPMeZThKZ8Um1ZGqIACYd8jj8KacM7i+4x2Z4SNZ6Zy/?=
 =?us-ascii?Q?OIHy5xb7xzf4N4SwvIMwoMeHw7EftkJXZbOiYKfzo0LzU8HJHoGNpwRxhPDE?=
 =?us-ascii?Q?fZ9AocGFhbuqFR7DPBgMiN6BP4OP0GC4SeO+bi8LzwpHcnF8wIRoAGlHeSCp?=
 =?us-ascii?Q?CP6YoXgpzxXh37Mbj88JITa9VYDib4sgQ2BRqYH6RIpu4Ea3TGDLIdmEiZsl?=
 =?us-ascii?Q?2VlwvnL93dmFtL8joEM2SqafYDH2dDZ4+4qHY3trbkjJbJ2zriaKKhhSrxj8?=
 =?us-ascii?Q?OhIgJoy16joUCVzgfgzuQtahDI4xJWUkgOptnxQVHEM9uVtH80MMkm+E2mob?=
 =?us-ascii?Q?2A1hOPJ572WtWXvDswZdpkdCTJBalWtBRLEseknJMBo/RD75gHgA2mU1kGLI?=
 =?us-ascii?Q?5tevuowpV8RqXhF6edttYz8APZnetrnXkKWv6R1A0fVJtsBuCdxwk+D4CTS4?=
 =?us-ascii?Q?yQK0g3TaKIzgZ1SbZGeIm4YgW2zmkaAO9UzjWL9f01ubvYXGYNMp3fAIlb/N?=
 =?us-ascii?Q?WGDiHTBKcgcfXf5o423guu1Mwpr3TPbYg5Sx2Go3HU4qvj83GxVz55J6O6za?=
 =?us-ascii?Q?RbKcarhLjcwHxQgdWMBgyL0D+1tKu43JGmNV+N+ulGWdEyj3NWYGovM0Mk65?=
 =?us-ascii?Q?ERUSibSHnQnoRBM33gze8S5eD2JEST42maYZ2vDAHzG+hEbY+kv/SEybFLcR?=
 =?us-ascii?Q?hczz+dNFkreSQGFaMZ7gF9EdMk20p619+fiNfHiVEUIT6tICsM9jgCcyAPVx?=
 =?us-ascii?Q?HCjIb8Hp4mcs7k9JmDwP58MYtAFWk96w8VSt4n9x5JcV3bS8XvvDdQQp73+4?=
 =?us-ascii?Q?1+XbJDRywnu+pkD0KE+k0yMN/DYbYjG3EGDhh6elEpSDZQ3sy7YlJT5Wj+t0?=
 =?us-ascii?Q?N623x5mWBXIImrRZlMAdvqfRpV1iOSBmSi0SoPlWiA4xLExaLMpR50bnLYid?=
 =?us-ascii?Q?siR513HHLgjcz4wCG4/EfsfqWfXo7XTutEdPoldUCyJxtrrDMjRrfmYNdwpP?=
 =?us-ascii?Q?DunnZGnAZBSACuWVB2W8dxE7hDYCJAMjMQ+ZI0nEkyYtR0kGU6GqSOH+bvzi?=
 =?us-ascii?Q?g+Iwjmcj74zvniK37XWTn7WRAJHnAmT5KRNX3rEYBtQxSu3Ab9a26LLQfFOK?=
 =?us-ascii?Q?e/U57trkQtrScY+DvrqfyD3cK3Mp1jC9O/jPTnqJP+J6/N0NWydfFolqh1uK?=
 =?us-ascii?Q?Y2eU67Ku2xGV98GlJ9a+tubYQqzIoHL+qDgvy9zrgyxMzRv9jYQoV1grvIAf?=
 =?us-ascii?Q?EBkBbIAL2wITSI3efUVRzsfBMJfbNScEPxC2uJuF6/QffKrbBjr8F+RsL6Ck?=
 =?us-ascii?Q?sh+WbZvVY1WGBiDYsNBzYU+9jdSSXLKIRdMWqF0xB1QJNTC/lTcvMWHXBc6w?=
 =?us-ascii?Q?Qc37yFRsnw4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GxpW/Nke2yxII7Y4wzJY3ZuXMuFUngQmNVP7IfcErYGZqu2T6B5dLpZMmLk2?=
 =?us-ascii?Q?bLNxmIAyM13WnJ18TsR39A8xeRWRudpOPl9NixKwJnNRqCBvFi1PQcaoUU5t?=
 =?us-ascii?Q?BiAEnoYvmUjDqLzFvlVfGkFGKHyW4qUcwTtOPKo+Z8LVUPgUox4wyujm7Qfv?=
 =?us-ascii?Q?0zOebLfP52QO9zuznvohbc9zDidZ0S9hm/2wnpxuHIJGuhdC4s6OrYEcXZbZ?=
 =?us-ascii?Q?FeOZwx85rIi3Xgj40PsDAgH16U2Dc7RB/SZT54zVuZOImclTQJrMDD5Z8qhb?=
 =?us-ascii?Q?KMVzMXIfZq/BMmizEkOoFKhZjpubjH0pgO+BSH5A8x+PzbZNJ1un6XF6WQRx?=
 =?us-ascii?Q?9GCd+XZE51azyiNHq4aqPniJzwLmBOrBCmonsvC4hVXscnZ2Wwo8qMY8QX2p?=
 =?us-ascii?Q?ewOIZLyKrBVQY/1EYYb2J6hAQ/qQbHt/0iDpLcqgJhk0MyDPsbYNPQrjBrxv?=
 =?us-ascii?Q?F5C5IhuDZBVOTQOHiJtd6gEObnm7zfmhhQW+oMLTOhd7dqKQBtrZEWOyuRdj?=
 =?us-ascii?Q?I3MpTLJ4P6FBMs9l81hPJqHBl8nbvbIJbBhI6pJCGbz+qlpeSjb+/+iwMlCk?=
 =?us-ascii?Q?6FjLrdDBsiycpqOHX/RayUlk0CFapN72P+k6ZAfveyVowGtFMdPC+K7nTlmT?=
 =?us-ascii?Q?zctQCXw9HWxRFIrbFIgRtlUPfcxDkuxal2AMeAw7tNO9YQw6LsVKnuW0++fO?=
 =?us-ascii?Q?6xyaWyjhStgY3b2kkleLqHxx42H6BqT4oXFlu+ds+FoSlhQkoC/v0hJWVOaa?=
 =?us-ascii?Q?ACdjWjRnWisuB7+6uRo6rIDUFHNHiVa2bJGrrAmlc3Z0U7TSXaaFB7jFetiO?=
 =?us-ascii?Q?u7F1d7dc/NgFNmiwYrkp81++ckvaMCO9Z2TlDFvWtbD0R5tE6jYJhyUkMvVp?=
 =?us-ascii?Q?aC/6fz/pKy05kEf/SgB71PrMOPorbpIRWrJ03rpS+hmfesOvDsBjnI05+UiZ?=
 =?us-ascii?Q?DjdOUaLlVRQ2mEUreDtcJoEA9ZRXkBW+pfATUnPBT/MbqUVlNcPoUHI2i/+a?=
 =?us-ascii?Q?mar/z1Jh2BR6JeGzm+QjCyuhmp4IsxQ2DWfdhY94UGJ3/Hl1/XYsYYRcKusQ?=
 =?us-ascii?Q?QVIpbKnA1sFOnIZbCXR1JFRRaqCZN+BnGKcfnnknIqYCREYn6cL9BZdOSGcj?=
 =?us-ascii?Q?hZ0zz1vrjcurvmPy+VLsW1xXya7iWAW8de9TEWw9agQ1nGO2i0SnPggBcqdD?=
 =?us-ascii?Q?dWF3IafugAuDHfsBcmjmpaDX+lGVo7RYS5ayw0iYXdgqxZQhaey3ePPjyYiO?=
 =?us-ascii?Q?aZ/A+sQrr6epEcepLsTQZiaY6zoRvM94VK7Rx6LSGxXd11tGZ7KDKDTwBJvY?=
 =?us-ascii?Q?ChYsus9XKm8btC0rS88JlPz4s2dviadcHYBxQzLjbPQDRJS9YjtnSb0leWtR?=
 =?us-ascii?Q?mNHlkrM/5mHQ/tWeqXuOBI+rshMkqPA01oHvnZd8WfTDDNbtLaKMXRzg2wiC?=
 =?us-ascii?Q?umOoJNsWQu6SCYgZYqHyjzBZotxzvfT31uAg4+tXhwlgyFzHppxxR8bTG+69?=
 =?us-ascii?Q?hA1njrAMV/UoMoFEcOWOo3ITN0d/b7baKRC78Lz5GoVxZpjQyOMxu9hzH1hB?=
 =?us-ascii?Q?1ie6HVDljwOw1Y2Z3W3HTUQYJnQasCACQG+Q0i/P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21878c39-76f4-4aff-a6b8-08dd9fbb1ad4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 20:46:51.5521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD0mmBAWdJ8eEGhzNARqmy8Ax4jNjVUY8aLz+HXldlHazNPM0MYdQOLe5RrCpWYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7208

On 30 May 2025, at 16:08, David Hildenbrand wrote:

> On 30.05.25 21:58, Zi Yan wrote:
>> On 30 May 2025, at 15:56, David Hildenbrand wrote:
>>
>>> On 30.05.25 18:22, Zi Yan wrote:
>>>> migratetype is no longer overwritten during pageblock isolation,
>>>> start_isolate_page_range(), has_unmovable_pages(), and
>>>> set_migratetype_isolate() no longer need which migratetype to restor=
e
>>>> during isolation failure.
>>>>
>>>> For has_unmoable_pages(), it needs to know if the isolation is for C=
MA
>>>> allocation, so adding CMA_ALLOCATION to provide the information. At =
the
>>>> same time change isolation flags to enum pb_isolate_mode
>>>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>>>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>>>> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE repor=
ts
>>>> isolation failures.
>>>>
>>>> alloc_contig_range() no longer needs migratetype. Replace it with
>>>> enum acr_flags_t to tell if an allocation is for CMA. So does
>>>> __alloc_contig_migrate_range().
>>>>
>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>> ---
>>>>    drivers/virtio/virtio_mem.c    |  2 +-
>>>>    include/linux/gfp.h            |  9 ++++-
>>>>    include/linux/page-isolation.h | 20 ++++++++--
>>>>    include/trace/events/kmem.h    | 14 ++++---
>>>>    mm/cma.c                       |  2 +-
>>>>    mm/memory_hotplug.c            |  6 +--
>>>>    mm/page_alloc.c                | 27 ++++++-------
>>>>    mm/page_isolation.c            | 70 +++++++++++++++--------------=
-----
>>>>    8 files changed, 82 insertions(+), 68 deletions(-)
>>>>
>>>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem=
=2Ec
>>>> index 56d0dbe62163..6bce70b139b2 100644
>>>> --- a/drivers/virtio/virtio_mem.c
>>>> +++ b/drivers/virtio/virtio_mem.c
>>>> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virt=
io_mem *vm, unsigned long pfn,
>>>>    		if (atomic_read(&vm->config_changed))
>>>>    			return -EAGAIN;
>>>>   -		rc =3D alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,=

>>>> +		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>>>>    					GFP_KERNEL);
>>>>    		if (rc =3D=3D -ENOMEM)
>>>>    			/* whoops, out of memory */
>>>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>>>> index be160e8d8bcb..51990d571e3e 100644
>>>> --- a/include/linux/gfp.h
>>>> +++ b/include/linux/gfp.h
>>>> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t=
 gfp_mask)
>>>>    extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>>>>     #ifdef CONFIG_CONTIG_ALLOC
>>>> +
>>>> +enum acr_flags_t {
>>>> +	ACR_CMA,	// CMA allocation
>>>> +	ACR_OTHER,	// other allocation
>>>> +};
>>>
>>> Hm, enum !=3D flags.
>>>
>>> If you want to use flags, then just have ACR_CMA. ACR_OTHER is implie=
d if not set.
>>>
>>> And ACR_CMA would then have to be "1" etc.
>>
>> I have a fixup to change acr_flags_t to acr_mode.
>>
>>>
>>>> +
>>>>    /* The below functions must be run on a range from a single zone.=
 */
>>>>    extern int alloc_contig_range_noprof(unsigned long start, unsigne=
d long end,
>>>> -			      unsigned migratetype, gfp_t gfp_mask);
>>>> +				     enum acr_flags_t alloc_flags,
>>>> +				     gfp_t gfp_mask);
>>>>    #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_=
noprof(__VA_ARGS__))
>>>>     extern struct page *alloc_contig_pages_noprof(unsigned long nr_p=
ages, gfp_t gfp_mask,
>>>> diff --git a/include/linux/page-isolation.h b/include/linux/page-iso=
lation.h
>>>> index 7a681a49e73c..3e2f960e166c 100644
>>>> --- a/include/linux/page-isolation.h
>>>> +++ b/include/linux/page-isolation.h
>>>> @@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct p=
age *page)
>>>>    }
>>>>    #endif
>>>>   -#define MEMORY_OFFLINE	0x1
>>>> -#define REPORT_FAILURE	0x2
>>>> +/*
>>>> + * Pageblock isolation modes:
>>>> + * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) mem=
ory
>>>> + *				 e.g., skip over PageHWPoison() pages and
>>>> + *				 PageOffline() pages. Unmovable pages will be
>>>> + *				 reported in this mode.
>>>> + * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
>>>> + * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
>>>> + */
>>>> +enum pb_isolate_mode {
>>>> +	PB_ISOLATE_MODE_MEM_OFFLINE,
>>>> +	PB_ISOLATE_MODE_CMA_ALLOC,
>>>> +	PB_ISOLATE_MODE_OTHER,
>>>> +};
>>>
>>> It's late on friady, but it looks like we are duplicating things here=
=2E
>>>
>>> Let me think about that once my brain is recharged :)
>>
>> Sure. Take your time.
>
> Could we abstract both settings and use a single one? Then, we could si=
mply reject if MEM_OFFLINE is passed into alloc_contig_range().
>
> alloc_contig_pages and page isolation, hmmmm, MEM_OFFLINE is kind-of an=
 allocation. CMA is an allocation.
>
> Just an idea, not sure ...

I think so.

This is the fixup of removing acr_flags_t. It is on top of the original
patch. Take your time. I guess I will send V7 with all fixups next week.

The one strange part is that in virtio_mem_fake_offline,
PB_ISOLATE_MODE_OTHER is used instead of PB_ISOLATE_MODE_MEM_OFFLINE.
I guess you do not want to report failures there.

=46rom b4bed6ec8bd07df40952bff2009905ae4093b3be Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Fri, 30 May 2025 13:58:11 -0400
Subject: [PATCH] remove acr_flags_t and use enum pb_isolate_mode instead.=


Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c    |  4 ++--
 include/linux/gfp.h            | 19 ++++++++++++++-----
 include/linux/page-isolation.h | 15 ---------------
 include/trace/events/kmem.h    | 12 ++++++------
 mm/cma.c                       |  3 ++-
 mm/page_alloc.c                | 24 ++++++++++++------------
 6 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 6bce70b139b2..535680a54ff5 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,8 +1243,8 @@ static int virtio_mem_fake_offline(struct virtio_me=
m *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;

-		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
-					GFP_KERNEL);
+		rc =3D alloc_contig_range(pfn, pfn + nr_pages,
+					PB_ISOLATE_MODE_OTHER, GFP_KERNEL);
 		if (rc =3D=3D -ENOMEM)
 			/* whoops, out of memory */
 			return rc;
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 51990d571e3e..17b92888d6de 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,15 +423,24 @@ static inline bool gfp_compaction_allowed(gfp_t gfp=
_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);

 #ifdef CONFIG_CONTIG_ALLOC
-
-enum acr_flags_t {
-	ACR_CMA,	// CMA allocation
-	ACR_OTHER,	// other allocation
+/*
+ * Pageblock isolation modes:
+ * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
+ *				 e.g., skip over PageHWPoison() pages and
+ *				 PageOffline() pages. Unmovable pages will be
+ *				 reported in this mode.
+ * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
+ * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
+ */
+enum pb_isolate_mode {
+	PB_ISOLATE_MODE_MEM_OFFLINE,
+	PB_ISOLATE_MODE_CMA_ALLOC,
+	PB_ISOLATE_MODE_OTHER,
 };

 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long =
end,
-				     enum acr_flags_t alloc_flags,
+				     enum pb_isolate_mode isol_mode,
 				     gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(=
__VA_ARGS__))

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolatio=
n.h
index 3e2f960e166c..7ed60a339a02 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -38,21 +38,6 @@ static inline void set_pageblock_isolate(struct page *=
page)
 }
 #endif

-/*
- * Pageblock isolation modes:
- * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
- *				 e.g., skip over PageHWPoison() pages and
- *				 PageOffline() pages. Unmovable pages will be
- *				 reported in this mode.
- * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
- * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
- */
-enum pb_isolate_mode {
-	PB_ISOLATE_MODE_MEM_OFFLINE,
-	PB_ISOLATE_MODE_CMA_ALLOC,
-	PB_ISOLATE_MODE_OTHER,
-};
-
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
 					  bool isolate);
diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index 7c4e2e703a23..e0bcbc43a548 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -312,9 +312,9 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		 unsigned long nr_migrated,
 		 unsigned long nr_reclaimed,
 		 unsigned long nr_mapped,
-		 enum acr_flags_t alloc_flags),
+		 enum pb_isolate_mode isol_mode),

-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_flags),=

+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, isol_mode),

 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -322,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(enum acr_flags_t, alloc_flags)
+		__field(enum pb_isolate_mode, isol_mode)
 	),

 	TP_fast_assign(
@@ -331,13 +331,13 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__entry->nr_migrated =3D nr_migrated;
 		__entry->nr_reclaimed =3D nr_reclaimed;
 		__entry->nr_mapped =3D nr_mapped;
-		__entry->alloc_flags =3D alloc_flags;
+		__entry->isol_mode =3D isol_mode;
 	),

-	TP_printk("start=3D0x%lx end=3D0x%lx alloc_flags=3D%d nr_migrated=3D%lu=
 nr_reclaimed=3D%lu nr_mapped=3D%lu",
+	TP_printk("start=3D0x%lx end=3D0x%lx isol_mode=3D%d nr_migrated=3D%lu n=
r_reclaimed=3D%lu nr_mapped=3D%lu",
 		  __entry->start,
 		  __entry->end,
-		  __entry->alloc_flags,
+		  __entry->isol_mode,
 		  __entry->nr_migrated,
 		  __entry->nr_reclaimed,
 		  __entry->nr_mapped)
diff --git a/mm/cma.c b/mm/cma.c
index 9ee8fad797bc..23aa35193122 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -822,7 +822,8 @@ static int cma_range_alloc(struct cma *cma, struct cm=
a_memrange *cmr,

 		pfn =3D cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret =3D alloc_contig_range(pfn, pfn + count, ACR_CMA, gfp);
+		ret =3D alloc_contig_range(pfn, pfn + count,
+					 PB_ISOLATE_MODE_CMA_ALLOC, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret =3D=3D 0) {
 			page =3D pfn_to_page(pfn);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index dd761f5e6310..619b1a9de9b7 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6696,12 +6696,12 @@ static void alloc_contig_dump_pages(struct list_h=
ead *page_list)

 /*
  * [start, end) must belong to a single zone.
- * @alloc_flags: using acr_flags_t to filter the type of migration in
+ * @isol_mode: using pb_isolate_mode filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
 					unsigned long start, unsigned long end,
-					enum acr_flags_t alloc_flags)
+					enum pb_isolate_mode isol_mode)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6773,7 +6773,7 @@ static int __alloc_contig_migrate_range(struct comp=
act_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}

-	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
+	trace_mm_alloc_contig_migrate_range_info(start, end, isol_mode,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6844,7 +6844,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp=
_mask, gfp_t *gfp_cc_mask)
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
- * @alloc_flags:	allocation information
+ * @isol_mode:	allocation information used for pageblock isolation
  * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some=

  *		action and reclaim modifiers are supported. Reclaim modifiers
  *		control allocation behavior during compaction/migration/reclaim.
@@ -6861,7 +6861,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp=
_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      enum acr_flags_t alloc_flags, gfp_t gfp_mask)
+			      enum pb_isolate_mode isol_mode, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret =3D 0;
@@ -6876,9 +6876,9 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 		.alloc_contig =3D true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
-	enum pb_isolate_mode mode =3D (alloc_flags =3D=3D ACR_CMA) ?
-					    PB_ISOLATE_MODE_CMA_ALLOC :
-					    PB_ISOLATE_MODE_OTHER;
+
+	if (isol_mode =3D=3D PB_ISOLATE_MODE_MEM_OFFLINE)
+		return -EINVAL;

 	gfp_mask =3D current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6905,7 +6905,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */

-	ret =3D start_isolate_page_range(start, end, mode);
+	ret =3D start_isolate_page_range(start, end, isol_mode);
 	if (ret)
 		goto done;

@@ -6921,7 +6921,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret =3D __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
+	ret =3D __alloc_contig_migrate_range(&cc, start, end, isol_mode);
 	if (ret && ret !=3D -EBUSY)
 		goto done;

@@ -6955,7 +6955,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	outer_start =3D find_large_buddy(start);

 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, mode)) {
+	if (test_pages_isolated(outer_start, end, isol_mode)) {
 		ret =3D -EBUSY;
 		goto done;
 	}
@@ -6998,7 +6998,7 @@ static int __alloc_contig_pages(unsigned long start=
_pfn,
 {
 	unsigned long end_pfn =3D start_pfn + nr_pages;

-	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_OTHER,
+	return alloc_contig_range_noprof(start_pfn, end_pfn, PB_ISOLATE_MODE_OT=
HER,
 					 gfp_mask);
 }

-- =

2.47.2



Best Regards,
Yan, Zi
