Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB929827B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306400; cv=fail; b=Rwijm6sWjGrgMh38v5PCQDeVyN38quubNm06+b1/RVb+u+Dx3sc9N35ANEK4lPAHrqqs7wkQEADUwiL+DyH/2gBkZTpbE7Shja1MwjM4pdW/HsX3MxsjUzFKjdaXxVVxg1FR+3N4zA7tc/VUvrcRFkxvwmn4tnAmi7JBkMVvprI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306400; c=relaxed/simple;
	bh=ZRV/s4XLlT3/qIXBJrxrahZ053jgobhhqUl9XWnufwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TObckk5FmKWpjrloBaGU1cx1ovVhNq6E3vFPNNPDdogExxvQryJ9LPNr+4f+227pPbnMbrmh4zPufdeRTKw/0w5E7Ey9znolR+slnoT/VkelZJEZ7cQisTsYtljJnmeFWJZXxcS5iB2dmpRyiBAHcxJzXGkiybyZlOeeqYRWoI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MMaeZxOQ; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MMaeZxOQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxsupEZCx5YGorR5C/rn8EckfCFHYJ55N9bb0WxiM2GYYCEbwy4RQ18FyliHpGGROKD0p+NtXihDO26aLv64YQi9CJz+MdRx4n4OTi+h4PacJ0fAhJoCyVpYnlkqYmrPOPQ9+16uZdJBSvGKzg3gcg6ty2oVmEA3bPhkeBEwCiq+yrDagpEkXdFJG30VzNmuh26GEKgEvVouy7mIbZOcaqR/X07vuRLSvoQgcyE854bSVXW3uc4BDGOhXEIgPGrVW11BsjN3cghxXRqexAgS2NHqTWnIqlAMeiWumZL1hGAFQvWMmKRyIqO3POTyYC5e18GXSPjsLy6jmw0iGXMLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIj8pukLw/FxI8cgVpIWPoo66DAS0QfDHPoeub54dSw=;
 b=Pl67ezi72g2OJIrQQ9dX3kNRh/MkjW2ke3MQyrn/VuJlRciXqH++2Nyeyjv3zx9/GoWvWLeUYtTDHytSlkPjwg+Uju9oJcmLvabuh5j74noXWknTzIZIHA7IFxHAsdjsw6Pl0G+hhwwpuMuY/OqYXFVdRuzmM3a/ydBeUzk9lhdqdhnZaojOtqzxow04vvHtsYHLQkcSm+/8xv8Xee0epYlh653mMa+FyqPSr/NN0Uu/CChyomURThH92qISf15czdrzXggnQPbTZXlYLUb2Lnl50TcNmTp3GUisH/e8llMV5GDYMvSMlhmn4fOE5u10IARF464ywk4kGkEirBiVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIj8pukLw/FxI8cgVpIWPoo66DAS0QfDHPoeub54dSw=;
 b=MMaeZxOQ/Zmql/D/Jix/uNC/9n1LxX3eSJqJtyymnSq2Qb0cS/DuPEMR/wv+I+EU+RFMARlrZKdQ7a8aboTA8pAt5dUco0dd5BM49A9EJP6Fo6gFa4Y6tHuSYoNybt6A6yJrIEyp3Fc9Er7v9gKFk5yz5cxZCYM4T6NK1dk5M+QqygM1rmj0LBJMrhfc4Ly80C3TCJPY1L8HO+hwpFPukN/HMpRchXo8MvbelVAgKSCGO/6vvXcnBxAf/vRi4hkFqmZl0qSwJWnn46/Di44f9YgRNYANBshcKJqGN5dQjnrsaZzVDf3o39YWGTxS/j1FRSMPO+2OA54gLdTJfoWhfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.17; Mon, 30 Jun 2025 17:59:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 17:59:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
Date: Mon, 30 Jun 2025 13:59:52 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <EB391EDC-4CDC-4B18-BE95-7DEFE43109DF@nvidia.com>
In-Reply-To: <20250627115510.3273675-5-david@redhat.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-5-david@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0342.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 477d5b9c-4812-4ab2-7e9f-08ddb7ffeb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J6DX5tBxhNHX/iQjvmU4T9djzBW5F3iFlX1AaB/mdXCDOR6X6TXMbESf9NdZ?=
 =?us-ascii?Q?NQUzIFJcHW8PT+swQZH9jzhfydC97hKWJO28teyGQfcoJso/bt9kXZa67l1C?=
 =?us-ascii?Q?5NIk5Ud9m/7xzzbU4QKULSit5bonNrgE+4i92tiUFRT1SN5ACrNMUHUygh6p?=
 =?us-ascii?Q?qMvfHIlKd8JKIz1HcyFfTqZLccbHA3yGUDeGVhZDxrL3orEf6fY+2tM6niW2?=
 =?us-ascii?Q?LPjO54mf+RmYj0DuRokjAtd+DnCPCrdLxlYnwxNP3Iq8anxpDaHQ4xV/7iD9?=
 =?us-ascii?Q?6mhqqXjfIH1tDeDjKs2Sfk/S/woCxf1vwB47BZIrFAaeC2MN0ayb4f3X6TWC?=
 =?us-ascii?Q?1FoiE2ksy5GIIY5oOhkmV2bTAHdtMY1d5EbGfZzmxHwCsMelVWabIGty4YGY?=
 =?us-ascii?Q?82BUHe41sqOMlsKwmv/CAgVYvZoaSBTs28c+9I34UAfmcoyTz94IsoA4vCVp?=
 =?us-ascii?Q?rA6P8k/etfvXWYG1DglXwKdIYGjTF3rOR58Z3ignGWPWzrxkiFOxdGArv3kF?=
 =?us-ascii?Q?lsstUnse+4Q5BWmFA7Uwdly1v+zymw1TpZbkUaW5f8FXYud1WMOtynu9/2r/?=
 =?us-ascii?Q?L06N9BlmWJOjNuNkkWaiwiGVWLgQxNZJJSstQj6J2z2Tm/SS3kQbXYcaK8oc?=
 =?us-ascii?Q?TLgo5Pj3+aqtkq6FobR3TFOca+e1MatQVaJGn7JRpizmZ6gvUBXsh4dPnCuF?=
 =?us-ascii?Q?2BLTr5ZvSyAWidnDBQTMgt+PXf/g5mmuvayveofslwjWD9ZN5hpPHg9/UcJQ?=
 =?us-ascii?Q?+HiPXn+xK4UqZkKFSj4AZTeUpMiUbC7xEnMY0XE4PsJ85jCUfnT0CVqIoTFS?=
 =?us-ascii?Q?uf6WiXWGeN8o3q3GuBYsDRTMsHefZIM063k2eDD4m2t1A/oX8tTiIFlmcelk?=
 =?us-ascii?Q?LH+SavL5URpaFRwGMiQ61E4pJLvlhXlpHTvSgDYc+wSWiLgo+XQC0iNarqfW?=
 =?us-ascii?Q?aUZlhhOfL4JOk7AMnSXxtVkq5wE2bZGNBAIEdjpHlWqSEbvpxtyn9GsU7gO3?=
 =?us-ascii?Q?Xc4OSvj8fLfA34bY65eYGrReb0sxqZi4G+C6bmJzAyy/LBWF+mMhTJ//5FF4?=
 =?us-ascii?Q?lc+M8bJbb5FRNHQpxHGkbweWXstOvasuuPi50DZFHLfeLNtRa/vosTcpAh0K?=
 =?us-ascii?Q?pBLh/PaKlYoacOtz+PBUeiCNGQJdGBzWIW7k1VV7iWLuNs3pOdR7tKi5tHLh?=
 =?us-ascii?Q?ar/2i9Pr0PvfI0deProESjpUNWY+vZSo3OGp8jh7ULmwbi2+7f+75S6D5f/0?=
 =?us-ascii?Q?KnTWOjIKoM8c6jpWS3eg/Uq7/G8Jf34eJE87RVrLRv2m62PklLkLakSAWCOj?=
 =?us-ascii?Q?5HAFac8+yoa5b7Z9EZBAMq0UX95ghU1FkDDp/1yHuWS+6QL4l/0TCxQeLx2C?=
 =?us-ascii?Q?wTg9hBSF0MhnbwSyshxS8aH3vDXWjxgmD0v/hHQhzOGsPCMEOMaW4vf7fGQC?=
 =?us-ascii?Q?07fJXUy6PKk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iwMcftwDfHtAuLmw8PAbiZ6cUCGy0HLBCyXlE3UUwYXEuPEetJmt+TTf7Ov0?=
 =?us-ascii?Q?QnV/JILh+0XdX65FtRpmSYxKklpUAlg5z+8R+UIb05Jw21QTRDbueKffOQi1?=
 =?us-ascii?Q?i19oiWF37mk2PLm0PNHNAxZ0jqgfqjeZBTiiAbgx4/Duv5ON4k4eHs8/6MG/?=
 =?us-ascii?Q?t4ba35vqYkimusbd6LeONmFW3Ak1pr2NiaI5akhXCiZTGDdItIpVTn5wyLkf?=
 =?us-ascii?Q?qayu38X8jA+2h6MuDZ4yEY9x3eU6EbOXTj7gJB60vr8rjfIGKYh/8fYZ8gxt?=
 =?us-ascii?Q?W+BE4SC0W7tLuJpzSlWE3fbunNR2A1WnxmafZXv2ovWqjs64Jqb8dydggn/C?=
 =?us-ascii?Q?KVTYmU5+ew0ybZahXc4AMVc5MZT3TCNAIMOyB++lvZDdaCzohSM1e8Y7SQyh?=
 =?us-ascii?Q?52MSV8YdGc+uMXYgR2YTqM9YodCDM5FmxZrH+vqVXkAYNLsf9TxE1dTkx4F+?=
 =?us-ascii?Q?FZNHKPrhhPfwzSY9BDIGkge/6pyNOXS0NucDmupXKv6Eglq8SHp8BYS2Gt2M?=
 =?us-ascii?Q?1VhMZkat4/MUVrWMxBy4+iopm4izFN4jB7iWPpox6L1MN2eGuqcDIkcydqYV?=
 =?us-ascii?Q?dqPSA4yFSoZunJLhJAp2tvwCYzFYURxotB3PtnGJq1CYdJ1Jb3EeGPsJNrMf?=
 =?us-ascii?Q?wZ/agXPlGW7hOo6bxjjU9aJ9Bw09C+x19YFwjpe+IvFIEa9NXb68y02Ke5VH?=
 =?us-ascii?Q?vvn2F9hnBNAGkB9fnfCY/zAzV/AgNp6m2zwydGQYPskyYwvXPNv2PVgIXs+W?=
 =?us-ascii?Q?/fa5GL8ev0+Ju2Pn0DIyzALWg5DAHbjHPEsaFkWVqmzVJ+8jp7Um8sYmZqhm?=
 =?us-ascii?Q?oOfGIMlkyx0xroXaISfj3CJd32hRs5THvjk/arCClIkfKyGoy73yiPvOHu6a?=
 =?us-ascii?Q?JpTej+SPGIMI0ZZjtKlrUHHJ4cA21W3EMPZSmtK351S68ML4ukCEVmXkPZ6q?=
 =?us-ascii?Q?lV2bmrQ1tEA4a7uc/mlH47F0rcHWSUtaUC3ckzlAH8lI7XMy/m3RLGw5fVAS?=
 =?us-ascii?Q?i+F2fEWSECA80/KsHnhEpCfioyqdu6/ZA8uxcapDUQv71p2xw2nh09IHhF3e?=
 =?us-ascii?Q?NXBlF5yUInPtNIF94J1CQb8WjAoNh6Qh36T3Vu3CwkfM36I65+rqIVzxrFe+?=
 =?us-ascii?Q?hCqTafOGvj84hIeuNrOeBAm0IxEbE8KJEpv9x8nRswZqQhaTqCYxC28qSwWE?=
 =?us-ascii?Q?M22jO+8rXeZWQULyHQkmUXMYddZy85fKO8xJx6zSyPqv0y+DfMDaYkzCUk29?=
 =?us-ascii?Q?R6U44bcQB8gwh9utacWJQQTlluZseVY0T/1Zh/jYWOH2nxDPBcG0eJnXjaK3?=
 =?us-ascii?Q?AfBc3t0qMy5zqT4W1pf469Jejl6xlrsSc1QhIH9fRy90JR9gknEV1OS0FZbm?=
 =?us-ascii?Q?BvctZtuxy6kj9hcn7YePuUc85ksVC5keWHF3gk9pu1bZkjb1prBMAIg8z7kt?=
 =?us-ascii?Q?iwv5cQi0Mx0DTJEFx1+U4AkO8Hqruqrz0beP9RwbXZl+1veO5MY46olaFOgK?=
 =?us-ascii?Q?brb4+TwES6Bsoel06tYhuSGrFt68JyNafrOlbAvM6QA/G8rBu75Ipa6uimNB?=
 =?us-ascii?Q?2bMeAUv/FEy5ZFaiN6+8j8pS0I3IFVg4toOzGPOH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477d5b9c-4812-4ab2-7e9f-08ddb7ffeb7d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 17:59:55.4155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCr5tgsAn28atT8oyacOw0tstwJc2bkAsLYaQtUlpnZyPMjinMAf/hvr4GXwQ2te
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

On 27 Jun 2025, at 7:55, David Hildenbrand wrote:

> Instead, let's just allow for specifying through flags whether we want
> to have bits merged into the original PTE.
>
> For the madvise() case, simplify by having only a single parameter for
> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging th=
e
> dirty bit is not required, but also not harmful. This code is not that
> performance critical after all to really force all micro-optimizations.=

>
> As we now have two pte_t * parameters, use PageTable() to make sure we
> are actually given a pointer at a copy of the PTE, not a pointer into
> an actual page table.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------=

>  mm/madvise.c  | 26 +++++------------------
>  mm/memory.c   |  8 ++-----
>  mm/util.c     |  2 +-
>  4 files changed, 43 insertions(+), 51 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 6000b683f68ee..fe69e21b34a24 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
>  /* Compare PTEs honoring the soft-dirty bit. */
>  #define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
>
> +/*
> + * Merge PTE write bits: if any PTE in the batch is writable, modify t=
he
> + * PTE at @ptentp to be writable.
> + */
> +#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
> +
> +/*
> + * Merge PTE young and dirty bits: if any PTE in the batch is young or=
 dirty,
> + * modify the PTE at @ptentp to be young or dirty, respectively.
> + */
> +#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
> +
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  {
>  	if (!(flags & FPB_HONOR_DIRTY))
> @@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte=
_t pte, fpb_t flags)
>  /**
>   * folio_pte_batch_ext - detect a PTE batch for a large folio
>   * @folio: The large folio to detect a PTE batch for.
> + * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be=
 NULL.
>   * @ptep: Page table pointer for the first entry.
> - * @pte: Page table entry for the first page.
> + * @ptentp: Pointer at a copy of the first page table entry.
>   * @max_nr: The maximum number of table entries to consider.
>   * @flags: Flags to modify the PTE batch semantics.
> - * @any_writable: Optional pointer to indicate whether any entry excep=
t the
> - *		  first one is writable.
> - * @any_young: Optional pointer to indicate whether any entry except t=
he
> - *		  first one is young.
> - * @any_dirty: Optional pointer to indicate whether any entry except t=
he
> - *		  first one is dirty.
>   *
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive=

>   * pages of the same large folio in a single VMA and a single page tab=
le.
> @@ -242,28 +249,26 @@ static inline pte_t __pte_batch_clear_ignored(pte=
_t pte, fpb_t flags)
>   * must be limited by the caller so scanning cannot exceed a single VM=
A and
>   * a single page table.
>   *
> + * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
> + * be modified.
> + *
>   * This function will be inlined to optimize based on the input parame=
ters;
>   * consider using folio_pte_batch() instead if applicable.
>   *
>   * Return: the number of table entries in the batch.
>   */
>  static inline unsigned int folio_pte_batch_ext(struct folio *folio,
> -		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
> -		bool *any_writable, bool *any_young, bool *any_dirty)
> +		struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
> +		unsigned int max_nr, fpb_t flags)
>  {
> +	bool any_writable =3D false, any_young =3D false, any_dirty =3D false=
;
> +	pte_t expected_pte, pte =3D *ptentp;
>  	unsigned int nr, cur_nr;
> -	pte_t expected_pte;
> -
> -	if (any_writable)
> -		*any_writable =3D false;
> -	if (any_young)
> -		*any_young =3D false;
> -	if (any_dirty)
> -		*any_dirty =3D false;
>
>  	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>  	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>  	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) !=3D folio, fo=
lio);
> +	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp))=
);

Why not just VM_WARN_ON(!pte_same(*ptep, *ptentp)) ?

ptep points to the first page table entry and ptentp points to the copy o=
f it.
I assume ptep should point to a valid page table entry to begin with.

Best Regards,
Yan, Zi
