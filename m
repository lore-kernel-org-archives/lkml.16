Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD3275112
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 05:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866327; cv=fail; b=lpcoZVk5JV+n7u4OcwM8pfL9jsqlIIOe4ZKGyRorYagaSUjoB52Zd1QRtRy9FfQ1pw8p2waqLgnX5pfVsRb1ZUhHYw0ds1vAu/iVQsEHjxtfm6SF7oDqHgIf3AduHT2osy9XSuABTdOr2gSnlwSxEyezr/Pt+4PFniyLHAqnYoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866327; c=relaxed/simple;
	bh=bzITirStrKlHq/RYTbWupsi1JZ7PY2sgDt/0mh0JbcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mj7H3EI4+LulEjav365hVdswobGDKDXvE2ZegRDkfOlmaoq5p+rITEmaW5vjnR4IlhANBOfKvrbMkiZnsR4QjdfPqyzAPnunPiCvt/JLiXQL3js7QDJ7TIpC1oFW3WoWVqQmAmSMQp/tC6V17pB/SlL7DyJvHrIlwBvWKq84yFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gN3dLPyx reason="signature verification failed"; arc=fail smtp.client-ip=40.107.101.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gN3dLPyx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKtCt7N/zGLsAVA4LXPrk25W+2uFlQxQQCBDR3SGLVuTOHhCynSQpkB9asWjo8pwFbUrqol1DtjKKuDHT6Wij3V1+1k5QUrpVFBmfhFrPKyA1eVzH9I3f1SEDYnt0i6T9pSE1/fiSDL2wnDDXr42niB/4VmY/Z3aoEBkI0ZrUzgg6jeoLRrI9tXUFIe/i3GNsCaKVCcBLXz2r+HlYFu6YnnucgyUWvXOgQdHkhF9HMSAa0YLtAq02l+KW//JjkudMdsQEawc8PD9Dv9JOkUZUKk3l9ji9BjSvTRTOv8JUsgM3U4txc3resJvDTiKUtADcYmNZQvfKrB3QqXz5fQ6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXR3vqaQd/dtyMM+/BbA+/vkmSB3rzo33/jbnoefHNE=;
 b=pGJzNIT1zjVHbGEJ6pSNXljUYVq13dWkU6HGRE1Wn5Gfgv58v40BtSDEosyHR6RoBtc+xkzLP+CvdeFnK8WQIJTQbBsvd7JOd5QjPrs/f36MYryx3H5/+FXczZ/Gqz3NXMPX7AkrWjJC4QKEVlwtScNu0JXmVEqYfGxVlNMgMI4vyCTvjNGBVpo79TJfKbn5twhZtdU5/Rll8hRLf3V5ocXjYBRaxKwO551I1XQIAfKXu9SYrMcity4JpMgQ0YNsUw3Z7jj8ZB3gOcsB3RKF1Las+E1Q1T4rzv647eZcIv2pN8KNYAnPSLWviLxHuDkjt58Vf8AzakAh6Cqyea1Pqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXR3vqaQd/dtyMM+/BbA+/vkmSB3rzo33/jbnoefHNE=;
 b=gN3dLPyxowNgNL4fhe1eIehCpMGnYi+JwnH/UXSb6nCzsuqsxA00SyNI+nO0hRWNu5wOEQ7Qr4aUNjkV27dzRnHK/mQ/cZ80TyaZC2vrsYySehUVESZSeQsKF8vCj3/iHkVBBg9+ZG1CGtkxnJPyHrc9U0TjC/drjz6emce6Jy21H2zWHxLlou6FdsSIvN+PPMQnTvys+7vrplw5vO8Ct19zFWTdikooYQtkpGveBQ9F5RQagNvIDNC3KTWJYpKpNoZ056D1prnk49Dce8OFrZu34V/yMpeV5gb1dME9aiBTRWOs1XuqTmIIxobwl5b1+nFeni3pOLWmPbvLoKBY/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH1PPF68E8581EB.namprd12.prod.outlook.com (2603:10b6:61f:fc00::611) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 7 Jul
 2025 05:32:03 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 05:32:03 +0000
Date: Mon, 7 Jul 2025 15:31:58 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, 
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 02/12] mm/migrate_device: flags for selecting device
 private THP pages
Message-ID: <ln75hcgtiuutmlbamc4yd2sbwcada35daz5zufrrz3ad5ids3x@vtq2kntpg74s>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-3-balbirs@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703233511.2028395-3-balbirs@nvidia.com>
X-ClientProxiedBy: SYCPR01CA0020.ausprd01.prod.outlook.com
 (2603:10c6:10:31::32) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH1PPF68E8581EB:EE_
X-MS-Office365-Filtering-Correlation-Id: 1374d2ba-122e-4a2f-387e-08ddbd179ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?jt+Tp3/9x8J1rj3+0W4EyaS4XxwEv/bJCh6cWphza8V5qENZdZxJioQ4it?=
 =?iso-8859-1?Q?nwDtFe4vo+zJp6ivNX5cW2YNTdqdxevF6jtwlCEkRO2ID8nD2OF6EFz3ku?=
 =?iso-8859-1?Q?sknJbSyvCKLUVvDWYKzgrkWeSsJdPUixLa1nE7L+LYHbK6Mn8shrK3jIej?=
 =?iso-8859-1?Q?MxYa50AJOKewIyAqWE2XKNhNAa2mSkC2cBVwkQwqixnez8jAqb+pPqCNJt?=
 =?iso-8859-1?Q?yYwEJAathgzpits64CjOvZitcdr7B5RYLyVEzFOnhmlRSUBOA9sB1bGZbD?=
 =?iso-8859-1?Q?7DUF14gXKOjLBwTu6SavtvRLPEoB4yN4gpuOHmz1usVh2pJStOJYBjdCUp?=
 =?iso-8859-1?Q?2qjn/myPy2zKqHtqXY00XTb+8VP9Gfy+K7enxCk0Yc5j99L7wxiZjFmgGK?=
 =?iso-8859-1?Q?xucwdyp8TxyCVXQiVGktpTGxP74SsF4VqQf4cqAlEz5ZQ3p4ednY21NsHO?=
 =?iso-8859-1?Q?23pBN4GDrUUAH9GhrEpPLmAvaeqwebmLbDLWvs71GYohH9q27l+6iCdP8x?=
 =?iso-8859-1?Q?wpE1bKpEs4xOS0UKxymWHHmkUJv1aissf74reedTUXl7SK1grCY3sI7Yxh?=
 =?iso-8859-1?Q?sIWV2D/oynRFqWeSG3X6K1MHVtW6gmG5rvvCfer9jbcXSDJyHF0TTnwNCx?=
 =?iso-8859-1?Q?0yiO0xvCjWEHRVqKKMVa7gmV5KdX/PtDQXfb0oPWdef8KQcaXd/RAC1neE?=
 =?iso-8859-1?Q?2Xkhtqs5dR2sWmn3IJ/4M6skUEjq55NSlsvnrjrPVaqAaSbqaq9Ct9JoBA?=
 =?iso-8859-1?Q?Jp5cstsvXqPkCku/p7ZehS9ts4hO1+/VQxdYFtbIK9NBbMByHUdg4y7fQJ?=
 =?iso-8859-1?Q?znHZvyFdV3cya8s7F01I3mIG+dk8Bmvi51zhtDc4rkbATOyC7GTX3J1yXs?=
 =?iso-8859-1?Q?ik8RlwdCUDQ8Pw/3U7iJDUh2lDU0Igu5/uYXphS67tbPGAUEWdKPu9j7Rh?=
 =?iso-8859-1?Q?drHvr4Ks4fktktMTbvvyeITiT22B6b/Wo4hWKNzAZWnVcXqdkbTOqj75TS?=
 =?iso-8859-1?Q?xBdkGXpXzL5N308hXOA41ziImMQL0KZUdHiSRknPbS8g9EJgEAF4UPDb7T?=
 =?iso-8859-1?Q?iPneDbeVpzXCYWoOUG2vgqgClXxOaOhQfMxtIUTSKJdz8dy6V8VvQDojEx?=
 =?iso-8859-1?Q?90nn4wEn6oslkEB+iV+I3tvRrx6wcNaWO+ckX1SI2NDnRnAIZBt0jfAxGA?=
 =?iso-8859-1?Q?L2u6V6PxQ1XnSteg6CT27hsyuFzjzSDbsJyu6NV/XbSn70kTvzOnFWNZwH?=
 =?iso-8859-1?Q?7F3W0JCf0Nw3O+h1OeQ9uFEVGEnLNXalhbO3IXt9aAhdSa8i+itBNwd6HJ?=
 =?iso-8859-1?Q?UvlsqVZQZ2kLqXYR5L61DC381eQj/hIjKu0C+sv6qv4VYXdYq4UwVneDcn?=
 =?iso-8859-1?Q?oe5NE/PpS62RNpX5ikTajmjYr4aRvQVxdp4B9BiMOiEzRjxNetPGP16HS0?=
 =?iso-8859-1?Q?cSZ85rCTOh2DUNSKd64aq9TdEsCCJbc3OOc30nNRzafKDUsLREM3de23+O?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mfP+43z92xrUC/7XyTpPSUbHaDwJPdejj6HSgI6vMgQ3aeFMBFuChxTiIG?=
 =?iso-8859-1?Q?dFqNFavhF8z593/AXwu/lS+PZXWqot3z1fDiW3TUr+Rr49Ri95+aetP010?=
 =?iso-8859-1?Q?YxAvX4e5i+jUpkI8qzrAxttPOKw7Ifxg5ybUdADFSCxRpxDYx601ruK6Vb?=
 =?iso-8859-1?Q?s7okFsoguwh/+1ETlDGVY0OAnITRzSeP+yhy+nW9o4KjdqHA3pWsIMAkOI?=
 =?iso-8859-1?Q?9DQh5hDIlORvWgb9Njw+WGj/16wgyTpwxsrJuYOvRu93fmVLmchncA3JqQ?=
 =?iso-8859-1?Q?y1X7ffTvuA6tA2cvW4Fgl8ZU7ghfOWi2eqPtlN5Bi/3zt+syV1XB6neMTB?=
 =?iso-8859-1?Q?O6dJ9zfqJkxOx1UqgbFXRkeFT7aDr7HuV1lKMaTpY17U+o5qRnmT2rn/Nx?=
 =?iso-8859-1?Q?JOAJpiIUQOGu0CN2BnOF+MPmubperKuRGqUXdEGM+CCA+SF97+zBjnp+lg?=
 =?iso-8859-1?Q?rrTzYvZh79iglQk0hj+7+UAmho03ciZXb66wfAQpMAB5Abd0fqAJhMcnQR?=
 =?iso-8859-1?Q?XP+Szs+WTl1sQeTQ8Yfkewh5pDysQVdLiEmO1QuSmPeb6NNXTf0olHGk13?=
 =?iso-8859-1?Q?pe0gfR4Ew+EdUqKdJp5/JKf2Qjkpdtf1QQp6yW1M9mpu7o6WNlOQYjtN7V?=
 =?iso-8859-1?Q?NbsXu/NS7CQpkIMpaUqx6VGk/35DxtyfXC72V3NvhpuuE2WeUaBzyaUcNw?=
 =?iso-8859-1?Q?kjpWcM+Qusro61klC+duT6ZYA19vEtpvE7X7UT5y2GIlOWau3uNsr0j8Vz?=
 =?iso-8859-1?Q?+2YbvlGv1GpGNGOuKYZh2gG5zF/uQo6WltgE210/u0v7ljhkv2JULZkPB/?=
 =?iso-8859-1?Q?hudyU4Fe2mIZKBB5qhsZJcFRJl0QEL9OkeiXXUCdb96xzGThBog6HUK6E4?=
 =?iso-8859-1?Q?+TrDW6aTVJ38dULoxzTTCUBHhIFd5v9QO1T8S7o1YJbzL7jVeAnEaKmfn4?=
 =?iso-8859-1?Q?K4HS8jWVNWzhfwaahd1YYIw1fU5WLTKsOgTOulu9M3k6Xce57lpBOFkm6x?=
 =?iso-8859-1?Q?MANhxlcdiKAXd5n0QhA20VWs0sD4QzR8uy3cGfOk9Is1j1FofKVdaCGkgh?=
 =?iso-8859-1?Q?wOzUnGLH5hYvLSmQbLYXDL1Ee767GUFMk0qqSivNXr6m1qfrrFRzHDmuHO?=
 =?iso-8859-1?Q?X/zdCZkWAo0r8k8dQI2AY2SogTNvEQO2xacyzGawsX0beR08+HxvtWnFUW?=
 =?iso-8859-1?Q?aMIzM/C/8vuhi6j3DcR5IGtvGVS1Png+lnbTPTr9w7iDB/BOrmgLjURCwV?=
 =?iso-8859-1?Q?RYgmASiRpEGlnRznhmZ2Mp0bm/nqwXfBCRmcfaZxTXQUDI0RJpqdAyp9Tf?=
 =?iso-8859-1?Q?zCrkMVWNNrI0hoec+6awyJG0Uc7nskh+VH/43k4c0ZdzAypSMq8rWzysM/?=
 =?iso-8859-1?Q?VfPG8fOmGOyCL73TQnQT8qatkJZDTKPQwseP+JWpVSFTU9pEv7Nne/TZj5?=
 =?iso-8859-1?Q?CDNTreLcM5zMhgt0ezRGRYuBSp+Tq2GeEozBadje03J/3ti5lMXlBttXly?=
 =?iso-8859-1?Q?fzEA/Tb4DX7aMQDJN+QSBU61KnKSoN7EP0jt/+j/cIkrsIp94WkaKRZEPG?=
 =?iso-8859-1?Q?4pGhcPiJ65C7L70FcJ5p+HUE2yEE8uf5L6ZMblVV644Px5wffA0BUtaLHB?=
 =?iso-8859-1?Q?h03Ri0nem/xiHrqYAfTwFCsKAGg02yA2Qj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1374d2ba-122e-4a2f-387e-08ddbd179ad9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 05:32:03.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tGnQonvPiDf8ApjGsNNZFBk39PXaQMSlw+4gxtmFlCodQPGJb9xYZMr0aqWy4GINM715jsLjj/w+wLRbfradw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF68E8581EB

On Fri, Jul 04, 2025 at 09:35:01AM +1000, Balbir Singh wrote:
> Add flags to mark zone device migration pages.
> 
> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
> device pages as compound pages during device pfn migration.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Jane Chu <jane.chu@oracle.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/migrate.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index aaa2114498d6..1661e2d5479a 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -167,6 +167,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>  #define MIGRATE_PFN_VALID	(1UL << 0)
>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>  #define MIGRATE_PFN_WRITE	(1UL << 3)
> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)

Why is this necessary? Couldn't migrate_vma just use folio_order() to figure out
if it's a compound page or not?

>  #define MIGRATE_PFN_SHIFT	6
>  
>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> @@ -185,6 +186,7 @@ enum migrate_vma_direction {
>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>  };
>  
>  struct migrate_vma {
> -- 
> 2.49.0
> 
