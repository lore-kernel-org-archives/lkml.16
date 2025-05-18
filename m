Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326051FDA
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 00:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747527611; cv=fail; b=NjsYtfI4sDDUWDlsLHUAGPijc0YJgULothHqkj3uXPs+jaecR4aeAXd2yQnK3FlPrKP7n4geVrE7IexPRpXlbzjikTL5rulH+UZOxn0Sq6rbyCr+P3xYiWskW8aX6evEHTRTZc8iKc4u5q4mm0aPEYqZfMcbHR2dFnqIpl9bj/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747527611; c=relaxed/simple;
	bh=FQ7IFYOE/N0zOW/pHvg+Y7HhI600eKtZ1NJ94dTxBws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uLDdNP+AXeg728ef1lyeLF/7d4bOisoQD4x/Y/MbbyXFsgPpFObDFRZxpmbncPckRSyGRxehWaoE9w9qsBG64Kcb/G5usArdXuJcnBA0JZNI2GBaCFgjJjLzwHqR8lFdLBWtMAPY0L9Tch8n7N2nb7xVxjNaQxDz51pRCFinoMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OOZJnjl5; arc=fail smtp.client-ip=40.107.93.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OOZJnjl5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jqim8weP9/xTgWIT+MbavKZXoVMgcBCZvu8GXIPtfjJ+6/+t1iLLtCR8GxIzGaxf+6SAn3uNvnL8/r6fdyYLcnNIf/BmptNBSHwbEg1nbaVWIo6AuQMtr24QntWAd2mofpNTZRAxAV96Ai0yRfAgc4zGgLW7IdHV0En3/T8v2TJJ09vCcxKeWmQ0Vd9aRQvfOuv79dcm72mt7c6YfeUWHUbo6ZNO1hrCCW82Ou21jb3Gkw1NQyWrOljzpL8wpZu23q1rELdX6X+6B0ch4TbLzcx3VdFVSnM5N97VaTKNi1YIOTDwV7fkj9MrYadLOCJ5TUMNXxBSuD5oLxhFdGSFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQ7IFYOE/N0zOW/pHvg+Y7HhI600eKtZ1NJ94dTxBws=;
 b=vCkALnPAVnHDCHWdZvLcuANb7Ap48mJT+R1q0mAn97DI6mAk3fgKJT3WtXhL+ck26Ul9ZRtVu9fgXoSMZ4c17IxuI+NCsaUc4Cqd0Ic9+fnDBFLo1utfgFmiPcUPl4zrkI0YK07GY09kNWeQlgfQob/hjFzdor0H7ukHFMmqp7SxiQkYA55341xEpBQ0VEikrZ//XUfHhJHlf0poMZZRunUxS0vVLUhfU0E8nxesG8UPD4frrW4aQX9L3JlNv1AU4mlhI5e6al5QpZlrVAzicwNXfkYZlMUKhY7COgPWVQwZAd0e7EhmBBr3QWFzT+2hCVYAe+2Umnosw/CccEPPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQ7IFYOE/N0zOW/pHvg+Y7HhI600eKtZ1NJ94dTxBws=;
 b=OOZJnjl5IPs8Y0YfYPpNgYD+lfElO3/3ibWeqPvf+jfaPdxD5kOjQVLf4ugUYIOq5mjwefviKIwHKLFfRqODdkkvn6HlHxTP61SNjFMvFI1uf10KIxBald3YMf358aToGb7F3/vuQpwhSYt0P7l6NPt6JB0cto6pykrsF0auhllPvdJXvXYVFpRz1y2sdT8H6Kl6xqSULssnMrV4Gc5v6QbhDiunuetOTbsegdsqep4T3Po6QpoUILrQH+N/CTOUhR210x/4dA2dImncF2tTIz/vmWp4Q1+2UfoHNtwUuZwfg+eJT9Gd1bHJKxzjAG0BrJP8bsJVgrNMp2w8W6G9VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB8915.namprd12.prod.outlook.com (2603:10b6:303:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sun, 18 May
 2025 00:20:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 00:20:05 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
Date: Sat, 17 May 2025 20:20:03 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
In-Reply-To: <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:408:112::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a51c64c-fdad-4a86-7fb4-08dd95a1bd4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Du2g/hhxGRyup0mCx2TRbeTTa9gQA/m0i9bH5ZXnQWbMeKBvZ9WH9FgzbusZ?=
 =?us-ascii?Q?g8o+LSrVexWB9C0Y4Ih1jNL2/u8F9/f0kWFko0ku0Xop1ySZ/bmzHMSBxF6l?=
 =?us-ascii?Q?gdtnhbw6bMG3VyLudpAZCz161y2NuhZ+imtYVVHo3NJReebLuC5Pxp37LF6c?=
 =?us-ascii?Q?8zahrjoBWenZUaeE318DSvriAGcK+DwLippKfwM04f3pdO2AVaAi/jf6Emr9?=
 =?us-ascii?Q?G4skU/dP+5aR/bvXUspLt61Vsr21W3OOXKwQSJD7vNriWctjgOVr+NWsUd9y?=
 =?us-ascii?Q?CvYtPf3pfpUwemJUXsCctwCFbGiEs0uTjq3+zeEYxexsC+usBY9aP/Ta/cte?=
 =?us-ascii?Q?2A2sKCeji7Db9SqM1YBihHo8dXKnQ7VeNasmh3tzBhWZZJzA6FWI/hHdeftT?=
 =?us-ascii?Q?Ya5cNLw8yZSXHpSLq4qvgA/kHb2aN9hIOk9XQ6C71QWK0C4NHMvtqdySmx5E?=
 =?us-ascii?Q?t58iCdXVYFQb/uO+xrLRIrMUNzO0Agg0Rc86iH/yG1rEYkf3ZcVI8nOiYsgy?=
 =?us-ascii?Q?NMsCxuqV4wr+01ja4jJpnmwlb95lC1AgAozUfB+zQVekhSzRCn6BFxLWDcjC?=
 =?us-ascii?Q?wChAZcEiudkmHhWZ9co9qfWQrgiRYSIQgi7dq+4VduURjMiLo67Stah32cZA?=
 =?us-ascii?Q?4Jci9ybuXaDX5D7xW2utu9z5Wpwj/y13PURiOibijovxXO7RFE5EVmUy5hec?=
 =?us-ascii?Q?Ebz93Ngt/L5TQGoDc9/nW8FvoIVyOn31IIp8qkKEUbtDnohdsCA+g1QFESLM?=
 =?us-ascii?Q?jAC6QcQFwTG5n4WfgW+uXU8XwqFWCBWsuFT+kB/2Mkr79LjQerHblht9Px0w?=
 =?us-ascii?Q?sY89KxuAxbrJLALXFxYSybtWLInruQ9XM1S8+s/0xax1DoKgKgM+8W2RniIF?=
 =?us-ascii?Q?IO1PCEiiH2pqFkewcLIQalXuzG2/AGyFBriPYas3ZYMOcCSmwLZese+zeBwD?=
 =?us-ascii?Q?And9SRlgJjrSVlDCSCqM5hK5iw6MwgZ1j97N0JOV0ScO7MCRAMCI72o5vR9s?=
 =?us-ascii?Q?ftyCDEYTmGBtTRAhXLkt5aBIilMuLIFkCgvGNeLrcHagxqrXMiyw58dodI7v?=
 =?us-ascii?Q?JcGBdKM3NnCTEKDPywwT7v+t4V/WqnAiUNQ4OLlbNPtXK11FTxs1rBcu7ASB?=
 =?us-ascii?Q?T9V9bjPxb0P++8qi2GIqOn31mmKCepK5a4HijrIdmwUNng95kCYISlLXl1cP?=
 =?us-ascii?Q?Pg2l5K/UWLb378kN/HDXj+Lqq8P4DtC+e6055DU7Lu/TCOZ1RYv4SgD/+7cr?=
 =?us-ascii?Q?gsq9GUx+TH4ZIbaDtcIM53LAmjvbDPvb2o4H0QkcNX1JI4kUWdzdjLtIRjGD?=
 =?us-ascii?Q?D48LmYMMSXTc60b+nUQ/X+p1RG+1qLmZCR0Ui0qotrqEiMO8Q8wE4Vm+c65N?=
 =?us-ascii?Q?i4Mbce3jfYZkz7WlZ/LlScHwE/UnkRVTx3f05cbk/xPsxAURYl3Gyk5xCqFk?=
 =?us-ascii?Q?dwAI4z+U3uY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZiZ7oIFOQA8byhhXIGFQl/G5516WLSQIRS77I1ArWJOohMhHz31ko8lJB6M?=
 =?us-ascii?Q?PlQSV40PFQCBVlTkylAKoTB7hKcduwtNzIT1VOuvNu6eTyjL4Gr0Dd7vPfF7?=
 =?us-ascii?Q?h0n3YFh1QgJDDpaBpiR5vwtQozAXKdwyIXALuQb+u8SopV6Nf3rAXZf2afkU?=
 =?us-ascii?Q?Pnfg7LpVroerFySYly7Gn9O6qxgFtrRpcXzgKYLMbqLDY3O7L7tKftqtdGTh?=
 =?us-ascii?Q?dNZ2WOpZ9UIlXNINw2Q9DbEKruOtAlNI7Iemv/euEh3N36V1bXotBt2IJNv5?=
 =?us-ascii?Q?46H7wkhn+xI8I0eRrF+Vkol20XiZiROHQPCQQtiB8BeOZxkAIwawPfHCJhKf?=
 =?us-ascii?Q?PYrH5t8WGfi5IwTpWOgF2btvNzDrdBFJilLYbz5sKclLn3ZLGgmMlDCrV/BH?=
 =?us-ascii?Q?1PEOH+vVBWYviVvvAoIeubwrwUICYf1tvlx3bektl8jGRGNbj8QAJwuPkjI1?=
 =?us-ascii?Q?aaEtH5oU7himz3MeIH+ABx0hMrGCROemzLASzE/aSzaEunQABfQWrl8NzzWD?=
 =?us-ascii?Q?iVdimrx7cDogX3G4cFr8sEyT7MdjCsyIUelZ7xi9QQL8xTH1zkjk3SneVjVI?=
 =?us-ascii?Q?bjomNegZhUkfaUD3YFgbC6SK4eFhMb2TLexKM9O4JYZBuwW/ZbqghyYCrTWB?=
 =?us-ascii?Q?xkneDrJp7dRJYU0hCTnLBsmRocjO0FpbGh3zIs02UhHJQt+rmzet6WCgUnB9?=
 =?us-ascii?Q?JWIem8W9KEmFJnYQ2qFnj8HT+0SV6XHiOlSkWPgRjxugvZh3XlgYP98BKzor?=
 =?us-ascii?Q?prxYDlsWKvYCrOjxzeIXAnCvcIWIRo3DQInOlvJcTVJnDray51O74vmWQorp?=
 =?us-ascii?Q?mJza7v8Orwlup9oRN+8UQDXDZpOkp51mrPpLK6sD9pguAOkJeeCjiY+P73xu?=
 =?us-ascii?Q?zFSwgHUvW6Yamfh8O9y8p7AbUH4BhdGy7DRnV6OVsUxkVGUjMJq2KiozA5eI?=
 =?us-ascii?Q?Sc8Ki0A8n90CzFSFK8bbQknbgSjmHqFlRtuH0jqJ0wUs335ZZmN7hgZVopFz?=
 =?us-ascii?Q?ietplcJ0tiJK2QC8qEm+95Mhoc5V+Ie4Tre010esW2tH2NRNTrfYcqB5nC2F?=
 =?us-ascii?Q?mFsTex0qtOHDZiCYqQlAYlwiPzM1QeV1jwvjFXkIUVZ1ed2tHyCx68TOLf0B?=
 =?us-ascii?Q?tkcRe9jK8rH+erXOqSfDST6GZjqben1aISJt5C8H41J/MgUu/coTUahx1sKF?=
 =?us-ascii?Q?sGjawApO4xtXWRpZWTMDRFq0xHrQLSxUxhW+ASijJLFCQPkg2AWvKNpPtz5+?=
 =?us-ascii?Q?YfQylDbIjDCxQcmKxjPimfUzAH9uLpe1chdDp0Y4c4ewqjF5Jaryr9FBiyhk?=
 =?us-ascii?Q?ywguvmSJhEjZFdKQ9w8QY6pfZk2xfEbNFHEQNM7QNF57bGXxub1hEnPBQMFm?=
 =?us-ascii?Q?A24ECf8daUP9BVEOLcRXW34xWFgO2G+pXKf6bf/A0DxpoMnLF7x8IT0hSwqa?=
 =?us-ascii?Q?9Vv8URJu6sIiPyNkatLPB5mjuWm9lG1zdKgQT5sdhKwkBmLqdJjtnCqaHmko?=
 =?us-ascii?Q?rw+VChUOIbHxN7CjRLpL2zFeqCBO0ay35MUK3iUQwXCC/6OlzChu6ipiZcSy?=
 =?us-ascii?Q?b/gQ/E3UBRCScIlVvtYdNqgBHp95PhfeZOG0GeQG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a51c64c-fdad-4a86-7fb4-08dd95a1bd4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 00:20:05.6110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0cBrcVbx8K6L/SS1NDI94orKLM7v/ptVCNZmB11Y1Iahs/y6gyIFsVb47kvoPf5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8915

On 17 May 2025, at 16:26, Vlastimil Babka wrote:

> On 5/9/25 22:01, Zi Yan wrote:
>> Hi David and Oscar,
>>
>> Can you take a look at Patch 2, which changes how online_pages() set
>> online pageblock migratetypes? It used to first set all pageblocks to
>> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblocks
>> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, all
>> online pageblocks need to have a migratetype other than MIGRATE_ISOLATE.
>> Let me know if there is any issue with my changes.
>>
>> Hi Johannes,
>>
>> Patch 2 now have set_pageblock_migratetype() not accepting
>> MIGRATE_ISOLATE. I think it makes code better. Thank you for the great
>> feedback.
>>
>> Hi all,
>>
>> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
>> being overwritten during pageblock isolation process. Currently,
>> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
>> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
>> migratetype. This causes pageblock migratetype loss during
>> alloc_contig_range() and memory offline, especially when the process
>> fails due to a failed pageblock isolation and the code tries to undo the
>> finished pageblock isolations.
>
> Seems mostly fine to me, just sent suggestion for 4/4.

Thanks.

> I was kinda hoping that MIGRATE_ISOLATE could stop being a migratetype. But
> I also see that it's useful for it to be because then it means it has the
> freelists in the buddy allocator, can work via __move_freepages_block() etc.

Yeah, I wanted to remove MIGRATE_ISOLATE from migratetype too, but there
is a MIGRATE_ISOLATE freelist and /proc/pagetypeinfo also shows isolated
free pages.

> Oh well. So it's still a migratetype, but the pageblock handling is now
> different.

Yep. We also have PB_migrate_skip, a bit in pageblock_bits used for memory
compaction and not part of migratetype.

--
Best Regards,
Yan, Zi
