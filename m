Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D7267B9B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954790; cv=fail; b=VwlexlrtK6YUH0ZgkL/LJO2Zh3svX9o2BoWYBcx8nTQTxAm7c11PiYkDLVCrzTjNuFc/ysqnMxCNaJDgeJrU1Xx6xp8NqA3/F/WOUHJIJB8ci45JLS2EkBfuQo9UcgQOrOk7MBGIcTO467GQNpZBU5HrqnfAq9KYz90KzDfN/BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954790; c=relaxed/simple;
	bh=RSRleAlUmXtJ1RK723WbV2S4B82TMGC00fS5b8QSMEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lcI7vXk/Xc0ProNT1gX+Au5PeG3/0ZGBC3BGYwy2PMl1GHJIfNiJQBFXrPR5+IRF1MBL9M/FdGaiDNafGWdLxdX6YZtCUqKK0ODumsdRHZDW5mHdoq97tDs2X3DU/dtFDK2+KZyjI86i9gaFqhgGOVa0Xa96oFAAr9vrOIwcHMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VaKpOAnH; arc=fail smtp.client-ip=40.107.243.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VaKpOAnH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ji1E8/cfQPYykFB102Xx+W0Ac540g0UxKoNrmptTr/yaeduMDYRH1CTJ8eX0hW0gvB8+81RQHIfadeAVZD0KSHuBIs8SYpKjsZJYDH1mmEmFb9CU8A3/pK3RSTvqt2Az6xz7XTI6WN1Q0wSfLQGcKwFNgAFbCc9c0lv1EGHaiAbD4tk6a+iErdi1d9Ai9DUY2VmqV13x5Lb81iXMfjnnj9Y7fCDD6BP24lCOQpQar3/CmI/7uZQZpEp9UMBaqKRpURmiKfSpRyr+9brl9bVNLS5QKzIwOjjrvmFhoR68fOnnrGSGG+sl/gvPHVfuO6tYnKmkA1CkGpoKkQ4liyDyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXplMbyNJLA3EnuUR/A+w55UnlKOuA5eovAmzsFKHKk=;
 b=ogzEdRYQjHYRYZBSe7hy2pZWQfMkR2/Nk5za8Kxc+KYKkB0Qt85reS7+3xNZNsiimxsCnZg2fuf1eINnrfRaPcFcub7QFwzN1jmvVU+WlzmoAYJ6gsugBTUhOAEcEF+kXxouTpvdmAfGNgH4B9kuDWBNomFZ4zYMgkGlYZ/6LTFihKsUp1t0vVAi5S7aE9nmzqvIe6EVljBhps7jolopi4DaC1c6uIDm2EY5ocK7J5CO3BWZXKelFn/nTZ2yHo6c7nTRgFvvmnCKNWcy51oVCfTQ8ajteXeu47UD5jO+x+yt3YIbL1m42s30SDe6ZIKkUJGJHEhn+ew9ynfdpRzsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXplMbyNJLA3EnuUR/A+w55UnlKOuA5eovAmzsFKHKk=;
 b=VaKpOAnHdQVXOweaAgDEhtul1+22mNCeNMfCbmPlayyGaklLoK3SiCj3jif1km7v9fviBqeB00R/35p97lv4Zl1UgnWioiVMmBoyBvi/s2TPGUKQVf101naPcU/407h/8yT7qhVgjX6qtqA4tMj5XDQRnW0lfX1sx1eCFHnncXYvfe/ANUOHULNaAJQ7LAa9N2OXXLz4Dtne2rpMi7lUk3j874DgEx3evqSCvKOEQYE7PK/3fV66PMdvnCRZpDCj5ifLbqZx6+pZh3HoilsgG9tqOAdVJHJYFUUqGiuMQWO98Dv/gtr44DfzQST+eu/7uhMpNniJAnzfpH+vq/8/rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 22:59:45 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 22:59:45 +0000
Date: Fri, 23 May 2025 08:59:40 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mmu_notifiers: remove leftover stub macros
Message-ID: <avp2gdsb5vsgmyik2o3mfmaa2ahapski6ud2iw6wuenothlauu@5zjt5rfyg3x4>
References: <20250523-mmu-notifier-cleanup-unused-v1-1-cc1f47ebec33@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-mmu-notifier-cleanup-unused-v1-1-cc1f47ebec33@google.com>
X-ClientProxiedBy: SY6PR01CA0081.ausprd01.prod.outlook.com
 (2603:10c6:10:110::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: bf30b455-a6a1-48dc-b3d8-08dd99845808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GxPMRb1R8G4IWM2DTTbBHmm0e5KNPvLcBuXMFBwwMxPP1aRklnNin1cFUYKz?=
 =?us-ascii?Q?BQ6Q3C6DCJTHGVRyc6oXz/uvOSc4BGaN6yDtRqNtqAQviG72l/TgyV7tXtNO?=
 =?us-ascii?Q?5uYrF665/CGdNGhwEUxAXb3z5249Hr9K/Do05+2HEGnP2g2hGzruLon1Rn70?=
 =?us-ascii?Q?DF7U5fdhCjWpehxvhEj0xapsgVd6A3npk44y/ntadVJwKtI4KaKTPg66hf0/?=
 =?us-ascii?Q?51QjsIJY5aPUBobaxLfhk1rOkI7pcg13xWc6UmcOQUjLCGaOTSrKB2uhpcg/?=
 =?us-ascii?Q?dMwM0vbFRoexv6g8+mRg02E/vV4VVM3tykwOvKhGjrnz1QO72EUfmv0lF98I?=
 =?us-ascii?Q?0ffHYFaa4WDIuV6kGjorwcdab75HIkNWOBU4wifGYCgeH1cg5wZRSkDP0GcX?=
 =?us-ascii?Q?oMmeUP8vjXsTJv/jM9pr5qzrTCInoFn59TxmsKZihPHCaEODg3N73ShP6jw6?=
 =?us-ascii?Q?QJHp2koGvsV6C2qZST45Vt1TXdAe9k12mQop8/L7Z6/epb07rxf0byf6vcxS?=
 =?us-ascii?Q?imQXdO1SuseBfeJ/SRCf8HYsN33ronqQ52xcAoN+6VtJz48I2qjQJ86xTvzk?=
 =?us-ascii?Q?nyMF1oDvBn/pm3Dfc2ctkUXVeHnm0DFituoYR3TPJ3GihySfBMdsO8HuP66C?=
 =?us-ascii?Q?Kg16dFiGld3LNOy/9RWarUavc97EDOd7jQFiNHEMcCBO69pkoehYY9DMCeaI?=
 =?us-ascii?Q?qKckv4UbsNzeuZaWdUXGXp5bHFtwcSFEAXG5ovBJPya6RIo0sbwucfGHgGhp?=
 =?us-ascii?Q?itGbhFP65N+438fFRIi+34a+UX8+za6MntqBUjbFCgo/YXbBg18cNPRfNx8S?=
 =?us-ascii?Q?GYAobU1IsO7Q54NZfj6wPRl3GJbUD8glSrsxoQWLiFuqghQgTqu67fzU/px9?=
 =?us-ascii?Q?4O6J0cFLmPpT3ck+OHoVSyYKRZTXQvfGxGY7Dpr+xd8+f248j7JNb35TiBZj?=
 =?us-ascii?Q?yD1r0yEr2h0D9SgyNFuu9+InNx+Le+Ab3ilK/I9TLqyVI6CC/EyqVWdB/7Ff?=
 =?us-ascii?Q?T1a7qCdjcjsUMA50JUamW1bpDrr446AhJq9/6yky4QXsXFs89lQ8lXMLKeKC?=
 =?us-ascii?Q?6+5ZJOJXNX+pNtjtfe7FIyeuhErwmjxklZU7k6nxIc8GfH3LL8zPXscHyg8H?=
 =?us-ascii?Q?vsao7TmTBTYQFfGzJ8jszGG7MeToOVOFQPwFJx49Ls+szYM+Ht7UID3Rj3Ez?=
 =?us-ascii?Q?EkqTmbp7vvvqU+Nwq2jgapx8c7nTKT85Ydwy0teiB3a5YH6h+rl1QgUVdQvl?=
 =?us-ascii?Q?kzGrlb0Hob1aZNUnaYgo/vB1x8RQwJP41j39SSQHpPqHhsp5MqNlHdxarvKQ?=
 =?us-ascii?Q?DZOyyCD/3651cqzNhFU+2Bpw+7o0CJkVBs0csS68JhlkoOQnE5ob3WsCvGJp?=
 =?us-ascii?Q?MHK+p2L6xXR7LR+bNYmBfcC6f2QESTAc+d7Y3b4NDCNRKgbGEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yryI55Y3kU1DC/RUbkSnLX8hCLn1w43h3Zhswd6qhTyXO+raVwUPkUfd8SqO?=
 =?us-ascii?Q?8gY4kJt8jm1VqqWC9G+Q0rdChhfYNVcBA+kAJLu9EI3db/DYfAsla61jsBw5?=
 =?us-ascii?Q?ucLe3rywhPO+cfUNcmcRKCWeFLWL2sXoQN55/YvzKaKoIpaMAanEKHm1aFJ5?=
 =?us-ascii?Q?qIEhPU7S6fcFvckZDB9Ex3N53yD+YAd6jb7Q/E6Rm+4X8evRuGqAv9BEjEKo?=
 =?us-ascii?Q?MrZEPxl2AtNiQofCyKCQaC35K0iZ3hi/H5XqdAFWB4P02jp+xJK0ktFqU3WG?=
 =?us-ascii?Q?WBJKxZUf4cXSpVdA8BHflyhjoKWXNXUHIV6uCD87wJnKnYytJ/5T0/virG3I?=
 =?us-ascii?Q?nmCetE6pxWjdE9YuE+BuweYlkUlo4UHJFu4YOH+enPHL/4DA5KD2nNFE6d4X?=
 =?us-ascii?Q?Du1907q8SZrcckvim+FPYFoU8lTeGdoknI0iwafm/EO/ohbttVmxQRWu4vaV?=
 =?us-ascii?Q?yHxOUxAP7i6ylBtljPWTGcORRHcoyzAPMsk6Uceris61y97mN8fBxw466N67?=
 =?us-ascii?Q?cfJ+JLoJPOQBWnYR/qDvSLwKOOkg9jCOsKvQwuqRt04SbzPMFFY5THkrtJRg?=
 =?us-ascii?Q?NlCqDmRNfXcrvy9eDGf1QbmBXX8H/BohmcHL0t211ul8g0JmAySI2+WCmT/h?=
 =?us-ascii?Q?MK4aD5uJ/MfNez2iGDd+E7YS6GjjKjhla9zNkeLH8sQy2zcDLruWb4IazpPB?=
 =?us-ascii?Q?7DM4jNZqE5mS6CXq3GScjD47WoWHFDiG4VYS5myYWWxNXcxyJqedjqdgtYdr?=
 =?us-ascii?Q?E2oO1l2Tp12ILcT9Rj10V39oBFC2LEOSDAybLpaVY6+sZtPrKHi1v7kUlLSp?=
 =?us-ascii?Q?VL9ntpPmPs+E20Vj5M+3TMkLhll3af1pJsWwJSCEUgvD4gnehstwLaKPLOVt?=
 =?us-ascii?Q?eNuf+TLTk5Oqem4DDMHvN9nsEIKKoDp3wz8faVZ6x/BBtiqqkk+9z/8K/r39?=
 =?us-ascii?Q?Vi0C7WaL+ICgb5PQ0Y3J0T0EnLbPDcw8jACyy9Kw4P3kJIIRqluIbH0ZUJPU?=
 =?us-ascii?Q?oYwVSNmH3hz+KZyT/Yibciw8Pt6kKJNaf/uUJ3aInGtj87Wwd0NwKr9IIcz6?=
 =?us-ascii?Q?ssFUXvDcttrczDKdc8JqybwecG4yHiPDGXSOK3jIpsjS0kDzhR4pd1hzO+uJ?=
 =?us-ascii?Q?pNQvVa1L42Xrd0QABSClzxhWuA5vvHKLQb0va43zhWNKUrkpr971uVnWEi6o?=
 =?us-ascii?Q?T7PJ+IgXeljfFqEySQBxbHH3izWxPgTx2UiaTYbqSMcBEK02Ytrl9wrsCulQ?=
 =?us-ascii?Q?iiA8rWb/bnEUcq1YSpFISHKqzBv4L+yR5+LKtY0I4tbq1y05/AAYyp66vS4J?=
 =?us-ascii?Q?r+lWMQos9orWNEgzX5pSYah6qsdZJJ/MeBjgmalcZtmmh+mnoejIxv1EokH5?=
 =?us-ascii?Q?l6pjpV8UaNUkozm7fU8harXF+caCying4AKNNu+4TKtnyNiGiWb8wiRaopxD?=
 =?us-ascii?Q?PhkT3uH2/QMGQE0tlgy0i+nv70Wi/jTNAOYZNv0U8m70pmERHS5Kl/c/pyO1?=
 =?us-ascii?Q?nK+J9elo1NvDHiZssBdvn5/vQkngyQPpFlqzEx5eb5X6FaTRvWGSj6aBvmkN?=
 =?us-ascii?Q?qQbLbFwRbBTToU/5XV/vNl3LRNFl1J4iaEMVGzK+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf30b455-a6a1-48dc-b3d8-08dd99845808
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 22:59:44.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeLk5vs0HzyYXXv+sGmHXU2Z3OCML7VMeR/7yLQGBDoz/qU49WW4gdjR7ezxFOgmMffEH3lA7JbIZ8V5T0wPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091

Thanks.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Fri, May 23, 2025 at 12:30:17AM +0200, Jann Horn wrote:
> Commit ec8832d007cb ("mmu_notifiers: don't invalidate secondary TLBs as
> part of mmu_notifier_invalidate_range_end()") removed the main definitions
> of {ptep,pmdp_huge,pudp_huge}_clear_flush_notify; just their
> !CONFIG_MMU_NOTIFIER stubs are left behind, remove them.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  include/linux/mmu_notifier.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index bc2402a45741..d1094c2d5fb6 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -654,9 +654,6 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
>  #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
>  #define ptep_clear_young_notify ptep_test_and_clear_young
>  #define pmdp_clear_young_notify pmdp_test_and_clear_young
> -#define	ptep_clear_flush_notify ptep_clear_flush
> -#define pmdp_huge_clear_flush_notify pmdp_huge_clear_flush
> -#define pudp_huge_clear_flush_notify pudp_huge_clear_flush
>  
>  static inline void mmu_notifier_synchronize(void)
>  {
> 
> ---
> base-commit: e85dea591fbf900330c796579314bfb7cc399d31
> change-id: 20250523-mmu-notifier-cleanup-unused-238762302a66
> 
> -- 
> Jann Horn <jannh@google.com>
> 
