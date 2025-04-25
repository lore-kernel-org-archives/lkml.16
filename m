Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58FC227EAF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581153; cv=fail; b=PQtBWpYK+2f92BTrQbCopyLeIqTeIR++O2XfBH26Ju3ikNYK9Rdb8TumyakvvaLHwGSEcxj67MkB10jBLDxQJMCH9uTCPF+/M+XRLKKOQaWRwhYszXp6aCmnGHI8INFiobeO+o5jtnfU01yhD9I4/qOl8/Ukbrfxcv+buWd1peY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581153; c=relaxed/simple;
	bh=CeNmagBlnsBAQeIbagLX8OCl0b4hTxXTjCSk6ZtuEIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=brIyFqFCs2eb5gZJR6uTmORnqYqv87UlqVRxueAYlemgTZWa0drEamM/oesSMISuLyucw5M5lOrJpb79e/AhDs5wlYRnHnI+PekAnT5Kh2rDX8RJp1klZYb7Gy+vd1nD4lpAz+jNV8GzBc7qfwpIUaYvat5vx3cSO2DVsPdehdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gTK8q+JZ; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gTK8q+JZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3j2lYGuSA5HF41m2qtNtoajIb9ovuzGwUXob1hKCDOykjcunJ4BPr1dnpNndP50oxM+N6986rhPZ/BL+7eovKESFjpMZerHsI1FAxdEyuzdl0e8yf4vOp0s9gBmnsyU2m0jyxkuVZrmjI60FD0l7fNZxOwusXX/CFHpgwVWQquPPfZmyCVTGwTzJLT4dSmO3mNT7DQTZbTtDJH+Gyxe3Bz14hueaBy41bvZQegnAUcdN7QmfWAiBq2YnFPZzNZT82oP3NRlusSGwLKCeboP7+pLCqgL22Q/JU16gn4LhshY+QvNc4bgwLrP6TgzTOY9/2ZfoIyfHVvPM9SA6BJsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/Ee260WPTqHqHeGozzn1tfRqWVcANfoB6eQGCbyFSg=;
 b=itLnHx6e5Ye8j0Yl10RC6RbOarOY7kiJ+E10FHr/gWQFu1+Ti8gbE2CV6jTNdBV6eaxfRyku1GE3puYwMHVcSZmJXY6y59RzWglLcZ4rOEG1y+HTeJyFfhULEaDFrUeMF8EZD1W06i3vkU5BOwu6pub2NeR7+ZBsKKiIbpoq328T9vit6+IEmT17+d7YWpKzycx1VAbcUynj7kzrG5tbIi4AqzYgHmUNocp7LaBIDzZNWtc3Vp5rxc4xQKRz2gCveydl/xBrqc5wHnNDUpnoYthkQs2AJy1BBysdXu9m1jCKVwmd9ZuuS9IIYVsXfBdmisJApM0e/zO9JV1PPrXT1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/Ee260WPTqHqHeGozzn1tfRqWVcANfoB6eQGCbyFSg=;
 b=gTK8q+JZiLcHI4eqRON/yZNUSJYSPLiJjawd2EoQe1ecjqSdRPvpMLhH1R+LCmZ7ZwzbZfIjPdb/CD4L/C9vQ2ZZjBhth2PHj1Cab7PxW9dZr4UVqGNe5VXxIGvwyAsH/kjJf14R21TqkJ+FQ0FDUIdKuUwKxdv30kg8h34JtvbLjaMyzGkljoi5dBNlyB17z6liN2Pn/eTqVV5n0woPf42IvybE55Z1Qs6lJp4x6FoZUPFmMFvcDQ+1HSx1mjX78lgjjAwRih0HcyT3B12FPaBUYHRthdCHG5qz2Cu4uF5pbd+ZSoAJ3RlFcyC4HAHqG2yWqy2LOzt74LFMh6R+tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB8319.namprd12.prod.outlook.com (2603:10b6:8:f7::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Fri, 25 Apr 2025 11:39:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 11:39:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, gshan@redhat.com, willy@infradead.org,
 linmiaohe@huawei.com, hughd@google.com, revest@google.com,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/huge_memory: Adjust try_to_migrate_one() and
 split_huge_pmd_locked()
Date: Fri, 25 Apr 2025 07:39:05 -0400
X-Mailer: MailMate (2.0r6238)
Message-ID: <D0013D2F-F33A-4998-AB42-448C0F284639@nvidia.com>
In-Reply-To: <96738f27-25bc-4d9e-9c4e-709e840563eb@redhat.com>
References: <20250425103859.825879-1-gavinguo@igalia.com>
 <20250425103859.825879-2-gavinguo@igalia.com>
 <40B90370-92E1-4E12-979D-7220887CB780@nvidia.com>
 <96738f27-25bc-4d9e-9c4e-709e840563eb@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL6PEPF00016417.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:5) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2447da41-c358-4fb1-67da-08dd83edca47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j6LkkCPKE0Zw+54S4tuwV1NMFUKVo+ZveLJI/ITFU8Wi6Z/JLKT74S/arTbh?=
 =?us-ascii?Q?yeBQ4cZ/MLzEKsS/MXtvp7oswgneSGejK5iUCqxwZViaRKcTlMk2c/hXDaVN?=
 =?us-ascii?Q?29Oy6sa1xw0iGdCtnItA2jhHRBD3kK/9ZWM7E5hETQQmYt7BGljJC+sWcJ57?=
 =?us-ascii?Q?vHEqxISrQvhFHcHd8Qj1xe1I5tRwZSu5Sqgk6+DxLkhtakZH1Pym7u+EikCA?=
 =?us-ascii?Q?69HDah+j/t5k+M8lw90jarBvn3YWpv03F6vIJ49c6ioi+0nX39AV6PHqhLDR?=
 =?us-ascii?Q?8aBSLMTh76cRibLlJk/wn44BaSBS+iIcptwWSIp+9jd2wPq0GUWO4yz1YXiZ?=
 =?us-ascii?Q?A7px4HHtVODgnpmJSVSNPF8XSdT7kciQIfJZDQEfpEjJmeg4y+nVrlVth6sT?=
 =?us-ascii?Q?o0AGrxZEaSpWVd5HQNyQOKXLO4elNiaeiMqChnesUMMTZ8U75ruE6mEEvMpA?=
 =?us-ascii?Q?nFa2GeVeOZS8qQmSSceb8ZdX7utvIX+YiIhWKcYsVrDLFCIaqBd3S9oCKHSR?=
 =?us-ascii?Q?1nnhVNNHDY7LZJET8D+0hZO3CyrLIWOtEWTIJogsDT6TbXWTmWu3tP2CPoLQ?=
 =?us-ascii?Q?kMxh2lqlxE8vkD0i82KPhHkD7YIyryhae4o3BFoQSZS7eIGA3mS2iADJuEaF?=
 =?us-ascii?Q?p4MyX3knjZwXu6Jxa0ASsJow1tksPfnif43I0c24yTDsiLevKXLILFN1SoNi?=
 =?us-ascii?Q?shm6LqUy30Exs/eFlkYYf4h4s+fydjV6qSnnqLQD2xEfuTnOIF2phvJFBBKZ?=
 =?us-ascii?Q?YqkiqWYhVLVHtRB55jRuBalgDk2oy8G78CKnPbhrLA9oSbbABsQvKCewitu6?=
 =?us-ascii?Q?iDRr9mgJdbkpF7ese1D5HlI77LHWiHhDq5FNwpyhTlI+0x3/fLlPxMm33UZr?=
 =?us-ascii?Q?/s6WzLGfApWL71wg9RRmMW/wKFZeZ6rKht62G0lV6Yc7dQ2bW4qvs0k7vbko?=
 =?us-ascii?Q?cgMfBZtw+xd6C63PNBzH08Oans28+38opend/Z6WLyPKYzsSW9kMgat6LXfj?=
 =?us-ascii?Q?o3ro4fL/pv0vkS3qKGhLJRAlFhlk8PbC/fpmkt/qdwNDmFoxbJnFBLo//XjZ?=
 =?us-ascii?Q?gArnYnMdSo2hXChcTCsqDdg9tRqd2+1XXmJ1w4qPEUHNylsqYeVCS546U9MZ?=
 =?us-ascii?Q?Z1pKzQ0ABqfk8F5mKwxSsuXDMKU1td1kB4V++chfP8M9rWUTNemwqnLnrYNZ?=
 =?us-ascii?Q?Nqf1Kf1yEktC74PFR1eopjMd4rYUOZnsswV1F+h3l3OlVREGCGVcZg2WEkdW?=
 =?us-ascii?Q?PxDzRt1/TRxBEkWtd/A0FDvehwyhnaqfnQSnauNmkQ81uvQGJ9CjZERkVdgZ?=
 =?us-ascii?Q?PKPVii6f5lpXrCTzXd7jRQaUQwQex/8j7pzgUVLwe+iRJFrgf/xhZy/wi2ZJ?=
 =?us-ascii?Q?hCX099CSiBwaEgvUiEb2Telkm6+x9wO9gVAqh55UZcKeICXeeUxH5IfaDpdc?=
 =?us-ascii?Q?rbkvR1mViSU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pafnUCGgU/y2balAhLfgyAmwhn543s2sd40Xg/d9Mxdoyf9DVsilXtCn9T+T?=
 =?us-ascii?Q?NNY9/FZvwdhspzCNZx68yQhzPZdZreWt4hpQVan07fxsOkgzEFepq+wVtNSh?=
 =?us-ascii?Q?w52bCupGD/9S8BV9xAtqjATg54ZJXc9BUqqFQoK6wcWqwmoGCu49yqvHI8hm?=
 =?us-ascii?Q?xXL0MJU4p/3IZMLuq5Rwh+WEFfG9PLQ6GNE21AoE9UgL3Zz4WZHRzkqUPUXJ?=
 =?us-ascii?Q?2uyFCJZ2VY/U5lSRhYvBAQZJkwqC1QolqXoIw40JYIalMERgMbY1dpD3v3hm?=
 =?us-ascii?Q?LkrW8FmMcoRATsWn6OIxOIU9nvnpyFZPltWvZ7ROG3hivkFYt5bQhm3C2/io?=
 =?us-ascii?Q?AL8KZ+PVPO30K6nGNmSeXAVnWJRTbiQwf9M1IZDVvnMEvqRDtd7MZz34Che8?=
 =?us-ascii?Q?MQfNZFyCMK7BPRCnwI3SXZ4JKZCBhazXptWLqBnk23GLx8plLKo7gOZONHnd?=
 =?us-ascii?Q?DIqIfECRO8Mn8Xk+lCle+w8JGFjWShVrSf73D5MQEyjjYYMljPkI48eSzfdA?=
 =?us-ascii?Q?PIwcX57lDmEGDLG2QnflVcf4FwFOkZ/wItEC0Rc6oHtC+iYH+WYiU943P0IF?=
 =?us-ascii?Q?UE7tLikBv8U22uV6j9JegruAXz/GGP3XI/Z/L0BdZB1SfXLu81UlPrscYT0E?=
 =?us-ascii?Q?u+zlZiMngZjfXkyTmzyHHilHKnzom1HTa9G+t24+M40Jgbyy+A0Yb1tyB4TU?=
 =?us-ascii?Q?7GhABWFhKx+ic3aMb8kIz3CMXhb5Nl248p+2Ae/Ar0kuwH28YdO5xbucAoY5?=
 =?us-ascii?Q?HqOeBo5YWIul8xjTPK0xx2uUn2VJmeaC71WrQ8wY3Lds8Kbz60VuFopP0XIY?=
 =?us-ascii?Q?7jepUS7auwzWNANAV5yVhh9QOOX4FYTEABlffVwlBGwielVHmBvL97SUhli9?=
 =?us-ascii?Q?TMIRbvwSMQFiOVVoTj/49eMT3V2aNSsFrU/JKYuOTh7KnEMUTkdRn1YV+lYc?=
 =?us-ascii?Q?x/s3d9Uz7nSa4pMvgVT4q3vLgPrn2qeeM/VES0Xv556Hl3hqZmLjB5CbdNhR?=
 =?us-ascii?Q?ulMxu9OxURXDexB4Q7CCjXzfaBA9Eu1+YfLM+SNybLQrE1yBHjShXn4AqePd?=
 =?us-ascii?Q?JxfGstk7ko7aSCrUAz8pvPiu6WrSSygm3G0hm2bRYMLU2Fk/R+1NQt3rmYWD?=
 =?us-ascii?Q?oWBu9kyiqLFZID8InLGxn43X0g6BNqORhQ6xjUvnOVECS4BfmJlXMtsBUiyq?=
 =?us-ascii?Q?NXlDMTijQmuLvPHEY38ShqyQOORwaPdKfNBN79vUJNHZUVSB6X33NyNTlWGB?=
 =?us-ascii?Q?CEFfBWiqEem+M68cfmv0uia+Hg3tdCfqTXrfIJlh1wH0nrz7NNTPcwKMjTx5?=
 =?us-ascii?Q?A1BGHVDcOzbhcun0Sb6Cq9FY3/XtRtYmd0NPbgLv0XNGfWN0Xp1FIqNbokQX?=
 =?us-ascii?Q?g2JHBnA8i7WAQ0L8veg4YLHWBdo0viCc7pCbnOnlpyPd9OlqReJtyTIdnf8x?=
 =?us-ascii?Q?tfq4cbJ3eZw+bFa26xOH9OS68m5P9j62RKhotggv2Cr63rCD+l5LfEJ6qNdj?=
 =?us-ascii?Q?5d/01dz4OydJEHyes64rI8NvS/HTe/1iMaK4TaW9ke96I+y0agyB0encPnCS?=
 =?us-ascii?Q?+a0QvkynR0HOYNDUVX3dLToAIC4yOEijHhyQtCtM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2447da41-c358-4fb1-67da-08dd83edca47
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 11:39:08.1706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xqph1MSvQlWjLRkiAnN8zdTgLZj7cf+LRthl4DSPvl94GWlHHHsnBnmiJPFXQI2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8319

On 25 Apr 2025, at 7:23, David Hildenbrand wrote:

> On 25.04.25 13:10, Zi Yan wrote:
>> On 25 Apr 2025, at 6:38, Gavin Guo wrote:
>>
>>> The split_huge_pmd_locked function currently performs redundant check=
s
>>> for migration entries and folio validation that are already handled b=
y
>>> the page_vma_mapped_walk mechanism in try_to_migrate_one.
>>>
>>> Specifically, page_vma_mapped_walk already ensures that:
>>> - The folio is properly mapped in the given VMA area
>>> - pmd_trans_huge, pmd_devmap, and migration entry validation are
>>> performed
>>>
>>> To leverage page_vma_mapped_walk's work, moving TTU_SPLIT_HUGE_PMD
>>> handling to the while loop checking and removing these duplicate chec=
ks
>>> from split_huge_pmd_locked.
>>>
>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>> Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c=
0@redhat.com/
>>> Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d=
7@redhat.com/
>>> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
>>> Acked-by: David Hildenbrand <david@redhat.com>
>>> ---
>
>>
>> I wonder if we need a WARN here to make sure when THP migration suppor=
t is not
>> present all PMDs are split in try_to_migrate_one().
>
> Can you elaborate on the condition you have in mind?
>
> If we have TTU_SPLIT_HUGE_PMD set, we'll never reach that point.
>
> Without CONFIG_ARCH_ENABLE_THP_MIGRATION, we should be running into the=

> 	VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>
> right?

Right. Missed that code, which is right at the bottom. Sorry about that.
Thank you for pointing this out.

OK, please disregard my comments. The patch is good in current form.


--
Best Regards,
Yan, Zi
