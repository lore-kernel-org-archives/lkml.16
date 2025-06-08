Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA73FC2;
	Sun,  8 Jun 2025 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749341081; cv=fail; b=NbldD2bQF9oRMzE5K2w8XlKyWwEnJDJFwURzrFU3og8wIL1Ecrgyk50z53JWQv1lT6Eq8mCpc0qKe7dBamk0ZLGzr8XcZ9NkNvb5a11jqy2utB5F3s5ddbNfbCz6JZyk37b+TEZJHbhcv0129GVoqWbReas1hrArobafWa6b0R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749341081; c=relaxed/simple;
	bh=eGTixoqaaQVX15Ed/nxytD8lRA41DxI+9lsKJjcEqxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Je7L0fNqkO4mjhu0aN/6KxvaoMYigTpdv1gwtRQItTpunPB5hfMz2CC29L0yVSGMlfwxNlijsDwU2rj5dKSu3pUcVRBjRc1g9aKR806N0T+VBioKL/hvrSZPsKaybXIq30u8UYB9VPb1nLwvpHUKH2JjFE/Vg9Ft/K0M3/bbqG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PfEGTtX/; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PfEGTtX/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pESkFsvbMJziDHoCn/3RoMEh4iIeYLivijot0C2lQ8g+HhUbYBLo5bX50E51T5ZrIVigpJSIGFbXvkAw53Q5VRaOYV0r46IteDrUAHIF2aKyQ0FTUg4y0VLdhST9YGPyFQzJxJS2jrIxHSNs+GRGo9MoCjowaqTCN52ni/jNXPx4gI1m7rkSiKTfhbrFRNznkhGqKoPZi1jSpGM0lNWBR64T2xgbImrXY0LlCzZecPM0MfZ/UoJLd4MaCvuXbGfKBNw66glXVpfEo0xE1PJqy1C0ZVVCDbgvJRED98/C8Z0Dlp/KQb5lJBoY/7vo9lWnPHh5a0054S62Fd7snRGV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3e575dWEfj2Bcv3BxaIg+g4FS3FZOfGB+oc9Cx0/TI=;
 b=cTUg+nA87lVFTllmZ7Pp46ynQOH5ZeT7I9iHR7gyGWBAoNK3Lzdp69ZjjywmLkKu/n+5T0BZLcaYsMbohViBc7s5AvBPZPVrd5h4xMh/MOi++2nRcDRmk0nUe+VuREE03xGJcd/D6OyjBArMANUhX2nqEVRe2IzAVIxR1dSVuwp5wzwmGnyJBdPJA9QJN+EJt58emlZ0OcvImov0jYleocc7JnlyUNsWOoebxRo4QJ0GpHNqmAsoUbJkxvdh3nN2yGoR9WW3/uNBY8wUqyJSuqExES8vpMHygk5O1bmw689fdMguqgxwKc65YJkRpHqkNuZIj1Ld9QSSb/A+a+usuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3e575dWEfj2Bcv3BxaIg+g4FS3FZOfGB+oc9Cx0/TI=;
 b=PfEGTtX/x2lta5GHWuYiXAloAMJ7DfrzIk1P9hq/O74E3tXzY5yd+oFkudh7yWnEKH99zV7OhDuL6lI5swM2BcFWbPX8RS57RNuWIalTkLHoJyKX2byGkwOL+CaYdQElSV7tfyUPB9vVgReO0X0GgW7qgfOu9Ipa1CdfuTrGJtaSb9XNaLvphTGSn6pjFVO+GnXm7im/DfgDCjBxxNw2Xhv5PZNJOqnfbLjJXTn4odhAKRd8uFUqIYTAP8O4CceMxCRWEhwtweITPXkaT1TjHlz7VLkbUxK0c87CAT+vuM5fZDOhlJks/D7C387sukwS1P3ax0v+zsW3guQqVBnopQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA0PR12MB7004.namprd12.prod.outlook.com (2603:10b6:806:2c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Sun, 8 Jun 2025 00:04:36 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Sun, 8 Jun 2025
 00:04:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Sat, 07 Jun 2025 20:04:32 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <CEC45D33-53C3-4D74-A70C-2FCE8A3911D5@nvidia.com>
In-Reply-To: <c6f3a80e-b5d0-4790-a783-69f47c31c39c@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c6f3a80e-b5d0-4790-a783-69f47c31c39c@lucifer.local>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0072.namprd19.prod.outlook.com
 (2603:10b6:208:19b::49) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA0PR12MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 3126e2be-c385-457c-febd-08dda6200d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qkUA4Xi/fQaH62zgcHsupGw1fUoESn+AQFhCcWcYjcb3DRqPOSUnpy+nXNww?=
 =?us-ascii?Q?oTneQhzeWyJcpmZSuxtBifjvmGth9u8ovG1voglaOkzeroQ/RS5z5D8EMCvY?=
 =?us-ascii?Q?/gHVydtUEiASoLYhkG0zZTPq9O57EjU8cmu4tz3+s2UaUrJbXQF55rmPw2c0?=
 =?us-ascii?Q?QvGa3jcZamOAbUX4OG7iYbetWI51QfDhreffQk8NAYqw7S/6MyXmrt/BTWG9?=
 =?us-ascii?Q?ZHK+IO81258Vt+349lSeq7hPv5zzHMVfMGDTQIEHFGdX7MDa5HERxGDbjtvk?=
 =?us-ascii?Q?ah4oR5ISTfbTp32QEkdl5GJGJRqWkthSS6/Ks60+cTxVyXiswUqxBJsXNRRu?=
 =?us-ascii?Q?5gSlCN56mt51E1H5HBk4ztQGUPXb1l1AQu+wp/wJt9N9oEtkaL9Aq75mqfTn?=
 =?us-ascii?Q?gbuxJ0WHIaBIwePYa1z15S2EROoh1bsizL1K40ZYe2CoQ06Ex/tqgXZVmUhK?=
 =?us-ascii?Q?LRV8JCHfGhk8n3eCc4QuqgJQG2dtbYwgWCUIMWsYPZBF98mgAkNxwKM0cYSP?=
 =?us-ascii?Q?02RY5VyPc5bbuKNqlqGs+DgiKEoK7RuNrEYp905A3JHakjiXflniOGpYK4Bd?=
 =?us-ascii?Q?vWpiVbluB6qoT2brG+UZiJ3qHaDEI1cQS5gIv1A16cztOF5HBywSyKlDU90m?=
 =?us-ascii?Q?Oavc+xHZ97AaNwZCfjKK0O7ciwzp2UgmiT5P1O8PEJ14Oh8NYNp9tfSM5BhJ?=
 =?us-ascii?Q?dF0xvZcY65geMFCsx+1NvFPrpQvz2k/ZKkOuT3xTgh23F1BmbQzhDXGOIZlj?=
 =?us-ascii?Q?CzmAM9CuxF3YcjxWLpwMcRukUtUZTE+aqsUlIPtLlCK+eTRSsXLbZazPE0iT?=
 =?us-ascii?Q?dMsw4zCGymSYgxtjg4l7jUJ8alelLOb9qSaynHnAaS1d17MANtOuqXOs6m+m?=
 =?us-ascii?Q?BxzWnfAS/LMX8TkWNe7hd/I0Sx/JJFYGG089KDwVkgmxiLTNWmp358nVB8KA?=
 =?us-ascii?Q?NFrmyNOCjVzH2JZp26zDBlB70UqLeGAaxyJ8emibFClzz5QCF13k/pMoAzZ2?=
 =?us-ascii?Q?61H0Ns7uedL/8cHp4ORxYHRgMS473aTp0VUhfJYKurB4lD7peNtz5xn0yD2w?=
 =?us-ascii?Q?3NgxnxlUAO34UVNvjNICCLTaaJ4BhItqGvP/wmegd+7TkpqlES4XD3iX/CR5?=
 =?us-ascii?Q?bvk671zIS7FHeCjpiQIU1KArsp1Nkdqcba9Isi8xpjA+kSvLhaYS+GFgK3yn?=
 =?us-ascii?Q?UqtEt4bUTyb7M5sic+FQfJsXZGYFPVhBLcQE7j/a018zp4G03PXfhYVHyY64?=
 =?us-ascii?Q?eRRlN7/IgtQVtuL0UyyuVXo5yRrS3FusvuQRTBT7U6ZFKtL+RR0klvPnuq+z?=
 =?us-ascii?Q?FkFKkG+hm8cvkOfHjQ9JuhfmxWOfFaMOTRMThQOFhWLoNsmKkIbCJmD2qGZB?=
 =?us-ascii?Q?SNQXpbCPUfnvXJ+OZX6tjkCVo8V6rx4QnTin3WoeKVa5anVq9AHzrQoZbaYH?=
 =?us-ascii?Q?O8ocziAChOg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kkGAgi5nhX3OLRxZtKBUiTr4LdRuT60AVaU9UWc/aMjBFNLnsAZySf8ZWKOf?=
 =?us-ascii?Q?+JFU9Xk2IUxNyfV4rlZ+BHQrT2HHblupMaFB4aQMzJYE/M+DkZNOZb5Yv63U?=
 =?us-ascii?Q?jKzsNy198f0VBaKHYY9BkoqN7/Lnb7eKmrOYONnSr+eebd0k7Mg4sRVBeE7L?=
 =?us-ascii?Q?WVOxUggCi7GV76X43kthuh7r01BJdeLVTTF27L8Qb1boElauUqBgYBr79VVe?=
 =?us-ascii?Q?Fy4/FPUa9LoP3ilSzWTOEeWGUHENiVeKz9oec3IY+39ktT/EBgPlFTKh1/Rp?=
 =?us-ascii?Q?3R/ExsKZiLS4mrpIDU/bRtXVLdRr336r+vTuaB5t+9sXek6iWd2kqrRmBHDq?=
 =?us-ascii?Q?zpByyoYBPJPJaxM1UGgbuTbSC+tfONNnsdc5QoI1bXnhGhJIQxLfc6gN/ToZ?=
 =?us-ascii?Q?a/glDPwKbow2Y1D/MzX3PsPXKqZPdkqdw9rhyTw5TRxhwHGs9JDPIdejGRhm?=
 =?us-ascii?Q?rWszst3SaiJbAsZLQ2qI27r8sOKIs8ceWDELFhhzFyc5oXH1b+pDpCXCetqR?=
 =?us-ascii?Q?oUqKcyYpM4ov7sJdpNAgzdtoCEjdz2gZSO269H1cgvfx2SrGcU037NZsd+fL?=
 =?us-ascii?Q?DhWrLx+lbr4SEkKjyHqym+Z45teBl9OfW8DFtZJRpBUXcAWc/ZwvJG5mOVOy?=
 =?us-ascii?Q?4Z1BR64YoVXmvf8Iff/qADVOR48ZKfvliUGeyTXSjb/7hZsjjRmlZsSNxrWW?=
 =?us-ascii?Q?MPS1deHQ5LyTlICuxIiUJBrZKv5xIMqUhJQWokGtK0nBJWwgDHhoS/jCvMn1?=
 =?us-ascii?Q?VHwj0xha8dCk1KVc2tgGrItlv/eiPOgXbkjxvFWGq29HJwd7JxWgk8veUT9T?=
 =?us-ascii?Q?Jve2oAzNLYRiLZ7QHSBFJ/N0v3DQEf1uzVUZcibDpwFE7OTtGCc46gF4KWFF?=
 =?us-ascii?Q?Jpmbk2etqGHQYGLLlSY9OyPI/PtpDyqn/RrgtZO7kSOG11h76KsWpydRsy0B?=
 =?us-ascii?Q?NL/RucSQdtI60gHuukfdDjnskxUGVs6ok/iUtoGwFFczDsBunDGF5Obe5tQY?=
 =?us-ascii?Q?G5MyVq6xRMPGjURAzT+FqMwhlxESsKd4O9NdO+gSdhB4ZPZ8VWLeI3hJ1mtS?=
 =?us-ascii?Q?DSjvwM4th9/ECHSQteqpVJGred0/ptaEL/194Ue58Hsyith0dkccTYRpwc5l?=
 =?us-ascii?Q?+OIwFScrCQNuWwbuSiqkNMcoDxowHTV2LCHoCOYDTPDv+KdcTlBeEJOWpGuu?=
 =?us-ascii?Q?kZGOcSJmcGHH3q6vACKiAxYL0SsXnDbLU7kT/Vb3LZlnpmiwpnZKWS9qqfPv?=
 =?us-ascii?Q?GtuV3zf8Ce/+j/WlnidCFAWBPuTT6kVwCpPAgJJPhetgoJPmMMhS/+Wtaiq+?=
 =?us-ascii?Q?agY66tUgi+Nu4PGgj0lK/Y2UzTXVRph6XB/LG3x9NJWB1YIZdGfL5B+/dpEs?=
 =?us-ascii?Q?pZ+9Gd/LfpSHfdVTP4aW9VUL9IHDE+WW4+igw9pK22uvyIJab5cqugxb0Yr0?=
 =?us-ascii?Q?t/GkmPGvAf3ZBer5U/LoAd+fxtpRwpQmVHQTiZ3twLEEXkVKDsH0jMIZrcpc?=
 =?us-ascii?Q?Nj/8Cj0vgS5rgmuMp6wMcnqmnyXTzMyWxUEde5d6nIjziOXaJc6XPl9+y1MD?=
 =?us-ascii?Q?bywiy/CnA/popsaxrWDdEASf1oJfsXEjGN853e/c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3126e2be-c385-457c-febd-08dda6200d7e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 00:04:35.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAMxxRw8JpZ4ExW9OMYDl2Z77EFIMEn5eEtXxB6ro/xX2qmbLt8qvzaDc5mauB3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7004

On 7 Jun 2025, at 4:35, Lorenzo Stoakes wrote:

> On Fri, Jun 06, 2025 at 12:10:43PM -0400, Zi Yan wrote:
>> On 6 Jun 2025, at 11:38, Usama Arif wrote:
>>
>>> On 06/06/2025 16:18, Zi Yan wrote:
>>>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
>>>>
>>>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
>>>>> watermarks are evaluated to extremely high values, for e.g. a server with
>>>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
>>>>> of the sizes set to never, the min, low and high watermarks evaluate to
>>>>> 11.2G, 14G and 16.8G respectively.
>>>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
>>>>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
>>>>> and 1G respectively.
>>>>> This is because set_recommended_min_free_kbytes is designed for PMD
>>>>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
>>>>> Such high watermark values can cause performance and latency issues in
>>>>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
>>>>> most of them would never actually use a 512M PMD THP.
>>>>>
>>>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
>>>>> folio order enabled in set_recommended_min_free_kbytes.
>>>>> With this patch, when only 2M THP hugepage size is set to madvise for the
>>>>> same machine with 64K page size, with the rest of the sizes set to never,
>>>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>>>>> respectively. When 512M THP hugepage size is set to madvise for the same
>>>>> machine with 64K page size, the min, low and high watermarks evaluate to
>>>>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
>>>>
>>>> Getting pageblock_order involved here might be confusing. I think you just
>>>> want to adjust min, low and high watermarks to reasonable values.
>>>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
>>>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
>>>> look reasonable to me.
>>>
>>> Hi Zi,
>>>
>>> Thanks for the review!
>>>
>>> I forgot to change it in another place, sorry about that! So can't move
>>> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
>>> Have added the additional place where min_thp_pageblock_nr_pages() is called
>>> as a fixlet here:
>>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
>>>
>>> I think atleast in this context the orginal name pageblock_nr_pages isn't
>>> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
>>> The new name min_thp_pageblock_nr_pages is also not really good, so happy
>>> to change it to something appropriate.
>>
>> Got it. pageblock is the defragmentation granularity. If user only wants
>> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
>> kernel will defragment at 512MB granularity, which might not be efficient.
>> Maybe make pageblock_order a boot time parameter?
>>
>> In addition, we are mixing two things together:
>> 1. min, low, and high watermarks: they affect when memory reclaim and compaction
>>    will be triggered;
>> 2. pageblock order: it is the granularity of defragmentation for creating
>>    mTHP/THP.
>>
>> In your use case, you want to lower watermarks, right? Considering what you
>> said below, I wonder if we want a way of enforcing vm.min_free_kbytes,
>> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestion
>> is lame, sorry).
>
> Hmmm :>) I really think this is something we should do automatically.
>
> I know it's becoming silly as Usama and others have clearly demonstrated the 'T'
> in THP doesn't stand for transparent, but I think providing a new sysctl for an
> apparently automated system is not the way to go, especially as we intend to
> make it more automagic in future.

Right. I think current setting, which boosts watermarks based on THP sizes,
seems too conservative, implying we are so afraid of not being able to provide
a THP when there is not enough memory. But that prevents user from using all
available memory is silly. Maybe just get rid of the watermark change code
in khugepaged. If user wants to use all available memory, they pay the penalty
of not easily getting THPs from the system. Kernel should not make the decision
for user.

>
>>
>> I think for 2, we might want to decouple pageblock order from defragmentation
>> granularity.
>
> Well, isn't pageblock order explicitly a heuristic for defragmenting physical
> memory for the purposes of higher order allocations?
>
> I don't think we can decouple that.

Yes, but pageblock is also used for memory hotadd and hotremove as the minimal
unit, so bigger pageblock is not memory hotplug friendly. And the main use
is pageblock isolation to remove free pages from any possible user.

In terms of defragmentation, pageblock has two purposes: 1) pageblock size
matches THP size, so memory compaction can migrate in-use pages to create
an THP-size free page; 2) avoid mixing movable and unmovable pages to avoid
wasting memory compaction effort, since a single unmovable page makes
a whole pageblock not suitable for THP creation with the help of memory
compaction.

Now we have mTHP, whose sizes varies from order-1 (anon starts from order-2)
to PMD-order. But if user only wants a smaller size mTHP (like in this case
2MB mTHP in a system with 512MB THP), having a large pageblock might not be
efficient, since why defragmenting 512MB range for a 2MB mTHP.
I do not have data to support my claim yet, since it is possible that
defragmenting at > THP size range can provide better THP creation success
rate. So some study is needed to understand the impact of defragmentation
granularity on THP creation.

A single granularity, i.e., one pageblock size, which determines defragmentation
granularity, cannot rule all mTHP sizes. That is why I am thinking about decouple
pageblock size from defragmentation granularity.


>
> But I think we can say, as the existence of PAGE_BLOCK_MAX_ORDER already sort of
> implies, 'we are fine with increasing the chances of fragmentation of
> <ridiculously huge page size> in order to improve reclaim behaviour'.

Right, especially these huge page sizes are rarely used.

>
> And again really strikes me that the parameter to adjust here is pageblock size,
> maybe default max size for systems with very large page table size.

Short term, yes. Since watermarks are tied to pageblock size and the rationale
is that pageblock size is equal to THP size and we want to make some guarantee
on THP creation.
>
> The THP mechanism is meant to be 'best effort' and opportunistic right? So it's
> ok if we aren't quite perfect in providing crazy huge page sizes.

Yes. And changing pageblock size to lower watermarks give more available free
memory to user might be better than having guarantees on creating a rarely
used THP size.

>
> I think 'on arm64 64KB we give up on page block beyond sensible mTHP size' is
> really a fine thing to do, and implementable by just... changing max pageblock
> order :>)
>
> Not having pageblocks at the crazy size doesn't mean those regions won't exist,
> it just means they're more likely not to due to fragmentation.
>
> 512MB PMD's... man haha.

Right. One caveat is that pageblock size currently can only be changed via
Kconfig, so if user wants a different mTHP size than 2MB, they will need
to build a different kernel. Yes, we can make pageblock a boot time parameter
(I proposed it in Juan's patch). That implies if user wants a different mTHP
size, they need to reboot the machine. It is slightly better than kernel
compilation. Making pageblock size changeable at runtime might be too
complicated and involve a lot of runtime cost to merging and splitting pageblocks.
That is why I want to decouple pageblock from defragmentation granularity.
Yeah, it is going to be a big project. :)

>
>>
>>
>>>>
>>>> Another concern on tying watermarks to highest THP order is that if
>>>> user enables PMD THP on such systems with 2MB mTHP enabled initially,
>>>> it could trigger unexpected memory reclaim and compaction, right?
>>>> That might surprise user, since they just want to adjust availability
>>>> of THP sizes, but the whole system suddenly begins to be busy.
>>>> Have you experimented with it?
>>>>
>>>
>>> Yes I would imagine it would trigger reclaim and compaction if the system memory
>>> is too low, but that should hopefully be expected? If the user is enabling 512M
>>> THP, they should expect changes by kernel to allow them to give hugepage of
>>> that size.
>>> Also hopefully, no one is enabling PMD THPs when the system is so low on
>>> memory that it triggers reclaim! There would be an OOM after just a few
>>> of those are faulted in.


--
Best Regards,
Yan, Zi
