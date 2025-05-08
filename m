Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808BE4B1E76
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 02:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746669665; cv=fail; b=iWN497IvKzJlEuQ0VSprFvXiors5JjGQLhqro3OqOgUJOeJe9/BKThWokYSld8pKzGatEMzXWMax2PLOs8im7vDbRoPvt3qr0XvIo6WvB902GwTJJHwfNMxl6KTWHlPbU9eyI40AVo1T38Bm5L/PVm9hs5bJsYeeFDX0FsDLJYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746669665; c=relaxed/simple;
	bh=RdnAlNkksiinCpcw3f4QuKy32NueUE3YyMvjmE9BGVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X0gfxhkfGXHk8pIG+kV+r3iTQBJbQLWno2Fv6waEx1QCAvvy9OSutjlLZdZoBxbgZSD1SUM4Dgcs/0dhO6dTL1tp3U+iniIkJGbeuTaCVawCKH6AO8KTR0Lnsv+cZdUubrM1waJALCR65+EwAFOqa6MitxtdJb1IMkdNi37GszI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=STrh5X0H; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="STrh5X0H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpdHHlHMvO+t5fTluH/RlYN353NDENo3Fw2AKhRvNw1BF8iwDNLEBbcIBBGZR57m/ZAlOiB23AOuG30rw8orhwz0JiFG3pGo8knna685lELp25FsxHtTZ7Ow4LP7NWKpeFTC7amg2XsIhxBWduYGPZ65bthiTYj41DYodlyMZHfzBmRf315F5MMIBTfdm5AEnuxXZfhJK53h5q05/aYXUfaE1RmPfOU0kIxwAepZfZpdvuJMjMPw9pcORZLJ0GgZeiXsFrbV7lOD20XqPqV8DWGWEGUjmSxS2Tdp0Hux2RXBHI3K6PFPG2rb6r3CSQ86fS1P5SPI8AOc9/NC6zTicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nupWDiDkSzcAvHEwrWt/qMoG3HJtOBFGimS8CiYjsOE=;
 b=pW/y38paPZcq+q9YqcXj0Y9BBi5Iz7CDTG2oAs4iryUYVZ0YuEqZtOrEZGN8Y2ZMagrcjnYoqQFS1nvcKyjOTpq/sMo/6x8iPOMtBvbRbMw4gUGn9EUXD6QgWJr9pxOfV0eP8aScWkiBdA1vFXE7GOIbdjLDoNMTtUcTu+Qv2n8NESJKXIjCJxRkeeDLobEdI2tXKkEFNvboQT0paN3V4Jt/5T60dL+2pJLQIoCYvYh3VHjI5d3n0STe8g/94QDCTgET5VQ8WO2ywjY5jwanF+PUfAkf6FN3eQVmlk82nqm5V4Mio0MIBV3n/uaEO4QNm1tlb1LiiMB4jA1t6ld+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nupWDiDkSzcAvHEwrWt/qMoG3HJtOBFGimS8CiYjsOE=;
 b=STrh5X0HQ9piwHxzzZTMedbhQedZv5uTo5KxvCQdQEw7RroTXIKiwsiySRvPALLWRGn9ApyowfFhQQjKye9a1wXG4ng5WJWHkHwZ0aSZc5g2GguoyYlBTcERv4PQ3IpXiEMr8AErJXmMgAelrSU15y1Z2Dnvnn6GH3Vo3RAE5/AWUJxycSZk5IajL/hBzjLDZdtslKOkM3TO807tAXtKVTnpKRuDecgNk3QKwLMiROIcdk5xvHM/8xJGvtBewCnKbsIcpIALYt7NazgkP225/EBMKSUxw5iO7xYyxXC8tOSSM32R2NKday8xgwbvXhos7j1QsArRF0sVJH1iBUkm4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 8 May
 2025 02:00:58 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 02:00:58 +0000
From: Zi Yan <ziy@nvidia.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
 libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com,
 baohua@kernel.org, anshuman.khandual@arm.com, willy@infradead.org,
 ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, hughd@google.com
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
Date: Wed, 07 May 2025 22:00:55 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <74FDF9E1-3148-460B-8E3C-5EE156A3FA93@nvidia.com>
In-Reply-To: <20250507060256.78278-3-dev.jain@arm.com>
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:408:141::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2b29f3-3f99-4626-8fba-08dd8dd42d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ponxtL2Tzev9w/erIqiKtI8cjnYEiB6a0S/I2/3f/EyT6eDyu5XpCbwN2uIf?=
 =?us-ascii?Q?2zpI75mtbpPIhajdkNx2dSLHE+4//L9Ie8IKgQn4paE2D1UpKc61nDWA9fVY?=
 =?us-ascii?Q?3G7JQM0l8HzE4uFMlAGZVETqIBByUUAmkSNW+2eOaAXN7rmV7ZAzIUS2oyUn?=
 =?us-ascii?Q?X7QgnyCb6iadV8Z15RHEDHZkKUZPjiHmhinm2ne+BhZakpZRBgwF3LRayou7?=
 =?us-ascii?Q?ns26yrcZLeqjc4wF1RtG0H6T7ML91rNfmTT3x+GTDS7HZvLH8FMmU9OT7wA9?=
 =?us-ascii?Q?/6kfxnRzIWEoYBfUu6/6WHv0NI4QrdFr3g35p6gg1ip/OUr8S81FT259F4JJ?=
 =?us-ascii?Q?0Sao6eFIo0hjONMZjWWyEwriGsZZmW7uGIOx1PZkmGSJix3L2LpBc4QByYSH?=
 =?us-ascii?Q?mS73H5zwul1iCRqccrEr/DnYXxJ2X8B0z17WFTpCCXnSuEKHA+3Q0cAFIbrS?=
 =?us-ascii?Q?ybcr8mOERrmjlqLEJ2znM4681Fst7TigyhaLfD/x8z6OEEAOE8HIxYWEN7fl?=
 =?us-ascii?Q?g8FucYOkzy9sbecCgjj//6fnegs8ZoXAarztt+aTPDvQM4NYQvoPpqrKYm5F?=
 =?us-ascii?Q?8qahRL9XKYpnN3gv+IjURvOWiGE3mo5guB3JxlspDt+3Jcq/1K5IwdOpoRbS?=
 =?us-ascii?Q?U4RnfiTNPOPf1mLaYiaG+bSXd7ln2mllGKD90ZCq7p1Gu/6fUR1RvruPVfX8?=
 =?us-ascii?Q?Cd4IbGkkTrJcoPl7qpeqtkhI/RmEDwQQViJ5AxA3+uFkI5eFnmgb4pxgH+bX?=
 =?us-ascii?Q?y3DP622siOnGSonRGQ2XSucrawHjy4lt+QQQWltXXL1U4i64sWpZDbFsyT8M?=
 =?us-ascii?Q?GSGbPZtaAEwJ01TnUmiA5VOaisM4hxcK+LYRXCZDvQupLc5F4V8sHDkczOM7?=
 =?us-ascii?Q?WUQgGsCrr/0Tu+XvBZuAV6s8j/b6NkU6XVbnE4e1uarEwHFohhGoLzaya+2q?=
 =?us-ascii?Q?tyI1mqZdAxcO5yo+y80yoCPxpgtGnabP2PdTe50rHpNydbN1LFV7yNigXINc?=
 =?us-ascii?Q?C3wcMb7klb7rpbiYBRDaTnEDwZ58pK1wsaYt5u2WAOCGUn8sHxtsibuPF3JU?=
 =?us-ascii?Q?MQZoPRwNGtVJ2CzZ+IcQvYA3rBJ8xG7cvGJSIp3glEGDHOc6QHePX1mFOMwc?=
 =?us-ascii?Q?tFIMrp34MKA+h+RxACDAMjlsipO9/i76rGeirN44F2vc/vSgZqq5SFRsFIsp?=
 =?us-ascii?Q?mtLKheBUJrghlwZuxlC9o2neLwb+kqRMMij+GtSM0GdCPSVu6/ren+EpFNIH?=
 =?us-ascii?Q?WDfe6pBBedpdRnoDlb0vB6QMJc0Dq7S5M54navgREm+Pc5N/i0rCQRo2dfLe?=
 =?us-ascii?Q?Q6xXWWQBXNjXnvmmHXGYggbFWX8/U4fUWVV9M3k5mVgn6/GhdKJXJzcdHLwo?=
 =?us-ascii?Q?bnfeSw9sC7jMZnkiRMzMaNuVFiQEfdiE7DO4WWMzdlqlSmtfSjWMNYzyb6LX?=
 =?us-ascii?Q?nI2wgkr8WfE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p51oMGAuFsu4hVAKDVypNav9cNqfVpOqvG2oX93S/mv+cOb88XG59/DBuPsX?=
 =?us-ascii?Q?coYE4Nvfn0yENH2exA5/nuiZhUDQW7yIZdDoPuOKTW3squAVhTxVeJi4MKVO?=
 =?us-ascii?Q?lIxwv9Hsyo2Q+gBsI2vB9xhi3Ygmia2vNxs/2qoH7F4H0ueh4F/F2BpKUCmq?=
 =?us-ascii?Q?Sj/F83RK71ChH97SPsLGDTjFVDHjy3NdauCUWMQyuPcXGWSH7UuP9X/xsYB3?=
 =?us-ascii?Q?IBIwnIerYVW2FZ6gePL5xBeHE6E5U7WpML5AeaXgkYbfjxHIK1Qxe4UQp0b4?=
 =?us-ascii?Q?dGhXpIn43scmErGHHe6Sv6InBfqSH7RYODVkmOAeeVj+zlST+Qcgz2jCc1hZ?=
 =?us-ascii?Q?DfC6CxynuQU5WLp3l7CAs74b9aKyErsq6Rtd89aYpY2lYtPf4FGOtZ4cP7Ye?=
 =?us-ascii?Q?SzI3ZYkT2P4JVYoIWC8bYk567YbUNPn57G11d6B3FHjv5jUtfxEoCJfC7JRM?=
 =?us-ascii?Q?wEhT79gHTLs5O2YdKjg+ZfNcKH58D4dSGVsOzC4/6RSIWD7lnhjSv2w3UcAy?=
 =?us-ascii?Q?lndhNEcwlMskepfsVVsTxPc4jomp0TFQwoHQzqto1MPElYxhMlayQHg24ror?=
 =?us-ascii?Q?LBuQ8PEQDDwy1IslNxVYK7kvMahxeUPkW2VLK7LRUYRnLW4oSZIJBQA3K5pp?=
 =?us-ascii?Q?LtShlZvsrmZ4KoVjnBGKwIGtllNLQFenFfKZcbC5Jc1Np0+e9pevGOlJo34I?=
 =?us-ascii?Q?JcAHWXSHtgmFBKqgqw0fYz0Tjg/xsfC6z142p7Q0Za6uXZgx/3NM9ybqaut6?=
 =?us-ascii?Q?YKhVDhuWgEhft4YVHO6+TbT/k6oYDY8zxmFjCUhnBSo/qdolHPi601HBEZs2?=
 =?us-ascii?Q?i4aN77gV+7ZRDrJ8T8XB/bzAylleDpcik2gfke92kVZzsMHRoasG8lgtaAXn?=
 =?us-ascii?Q?NecaUka7TvbiYP8asstV8sjlwt2Q+lDmqfbECZmstz/09HKJOij2aTvTU4m8?=
 =?us-ascii?Q?/sNNsZnCc+vgdcJ33clAT0LKwt5lhKdCr0kE+7QxrQ3Ow4uZ0y9uRHoQiSCy?=
 =?us-ascii?Q?ObziZ6s80cFLIbXcEOpAYYF6VXMcmam9vB1f21GjcNztCPEEoSs4oc1L6E8Q?=
 =?us-ascii?Q?i2rOiXUIdupVYNRtj27SfCOA4qQqzvcHdsmufKyXtLweoyhmwg5rR7rOzmk2?=
 =?us-ascii?Q?HqmB0yNcIxeuPTbloiMqEJQaGLXmGH8gLwRKQrWpe1eu4XY21M8pV4zYMOvT?=
 =?us-ascii?Q?FuWzwajzXMrGZqHvjga5PEm5ih7Tr8TPq4Bq5uHahYJavY2Y6SVWJbpmdZHK?=
 =?us-ascii?Q?KVIFPePZ+/A1W8lWtURSTiI7ly1Qqg+J7BbskURcxxSqQlOpHdcOAeP+bjXa?=
 =?us-ascii?Q?AV006r7IVrT4UBWhxUASQqp2C5lzGGK4zS0kGVk2Nvk5GlGstzvfPXZva5Qv?=
 =?us-ascii?Q?oOQ4UTHle07AJzUT64H4rUgVyyxK7YwDCqeEW/kE7V8CCnk0V6FKKoki+XKp?=
 =?us-ascii?Q?0gOsX8oNMiagwumxcqSVKfa7NrNZJSOAQYr4LH82tm1e0nrgkURE4o4/CyaG?=
 =?us-ascii?Q?Pw5mPWMHmes/skXIMt5IFNyNi964zvms4PWWU9MAbJXFpTGonAPujKsbgpjz?=
 =?us-ascii?Q?PP9CVRRMeJ4jhtPyBQm9wmjSHZPsmPlDzeSg3omC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2b29f3-3f99-4626-8fba-08dd8dd42d0a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 02:00:58.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkjKE+urRr/52m6PaCjuhZmU1EzdAwxZbKLFJUsslg5GJSCVuELHbHaAfv4vbHTH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598

On 7 May 2025, at 2:02, Dev Jain wrote:

> To use PTE batching, we want to determine whether the folio mapped by
> the PTE is large, thus requiring the use of vm_normal_folio(). We want
> to avoid the cost of vm_normal_folio() if the code path doesn't already
> require the folio. For arm64, pte_batch_hint() does the job. To generalize
> this hint, add a helper which will determine whether two consecutive PTEs
> point to consecutive PFNs, in which case there is a high probability that
> the underlying folio is large.
> Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>  mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
>  2 files changed, 59 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..38dab1f562ed 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>  }
>  #endif
>
> +/**
> + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
> + * to a large folio.
> + * @ptep: Pointer to the page table entry.
> + * @pte: The page table entry.
> + *
> + * This helper is invoked when the caller wants to batch over a set of ptes
> + * mapping a large folio, but the concerned code path does not already have
> + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
> + * the underlying folio was small; i.e keep the small folio case as fast as
> + * possible.
> + *
> + * The caller must ensure that ptep + 1 exists.

ptep points to an entry in a PTE page. As long as it is not pointing
to the last entry, ptep+1 should always exist. With PTRS_PER_PTE and
sizeof(pte_t), you can check ptep address to figure out whether it
is the last entry of a PTE page, right? Let me know if I misunderstand
anything.


--
Best Regards,
Yan, Zi
