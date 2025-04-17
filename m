Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A806C79F2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864745; cv=none; b=MnUHA8axEYvZAc7wi8glOffeSPTrwW2Z0j3gqVDLBEJ9DHQfG3w1r38rDbXPnWt81t93ajZ6XhFChcFwb/nuvFiJf446okR7Nq/0Butw0N9gaDFJEmxIQAdtKzYpIWCqQe4yvGMBuXLON9W3v7fnu5Nu17vM4cZQWWjds9/6TDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864745; c=relaxed/simple;
	bh=rmrMqfrgVM2s/104PEkFge+dI0TQZAYKGMW+EKZ939M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jaP5CfuEsthgwEtkTeTwUqJEUjUkE55H8SH4fa6AdhwM8hu2gBvaMOfVvGnmHnkMqH18HnkOwdG7kDjNzrjueOiVJydp6Pl5fzq0JzoLC2zhfGKiByLdYzjvVC2GuB0aXslgfLWGSgVQSqzFGiPj7Ind1LCnJ0Yv4O0aWHu7vPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m4RgsZD0; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m4RgsZD0"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c7e5f7f0e3so77050fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744864742; x=1745469542; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=10iRaLFldXjpc2qVrp58ahO+2Bmb/5Z6tVyg4OHvZeI=;
        b=m4RgsZD01gcdy96ya4rQADcqGukoKVrhUBJVGfWgmRxgk+dBFgZvJ72sVHeSYiMJeM
         p18GZNyXcGvlcsYrIVJL9SCLH9yzsR5AmmO4ItvtuEQ5NSxuK5D0btdAcXT3H2O6CYtJ
         riA4nYx+HBC94yevcW4SVX+lZvA6p8vV2ZBmvvqv8RBbmgPePslIbB3pNI8LwLbEQ1L+
         IpVmJwBotDS8XgevpaqwUnqTQeBO85jIPSqpfPB86/WPATSVHNcngW0VJ37ZF/GZmAx1
         XUdon58EmhOEnqS0hojk7LiLL2PAPn7K9hwNP7Ze88gOHp8vtrd6OfPrJFpjrSWkR+9N
         5DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864742; x=1745469542;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10iRaLFldXjpc2qVrp58ahO+2Bmb/5Z6tVyg4OHvZeI=;
        b=ZasbMg/P/IAu2zVVHjgA8407xs/0R0YTFmaWdEVOfUywKCVcIlkb9TUMsaRDClqgGK
         vB0344hwDff9ngBj4ExT1kM6Y5oDyYkgPwiGa1LgcR/5+BzAMxVFxc6/uQ1f8G1QgMWu
         L4494k1bv4QDOGdh592Q2pYTdIdLSL4xrZVIpJv9zOaNg6dnlI9Uyaqn/8WWVt2xJk2q
         ydZz7leM+9nLV0w5JXbKVIT8odBVhG4tk79oZDKMBBtbsJKUx3iHSaitaDvxo6eSxU/M
         eOA0I3/CbeHfWUHu12bmXTpCU7/Lhi9lFtPNb2tAePnHNsg4lDLHKnv7LzgIf6LFRB6W
         43SA==
X-Forwarded-Encrypted: i=1; AJvYcCXBMoLDGVeDZ5ow342zR8xQMjoh0dJEtuSLzGnJUVUTndb2GXlh7YeYIQNjSnq55vEClz46EasLS3E7Rl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZSuPtg/0BT53gzDQqtqbz/RBhZpiUQMkf403rmBwtd3JfL3e
	Li0U7ZWeFPI4IphnKBbDRHBzKAmoLR9zmeNhAnN2qhmuHkKEZp21dKzh8V5FMQ==
X-Gm-Gg: ASbGncs8I99/0z6C5eT2OtBAXrFBu3k1gKa6+sSyPU0g8my2ku7ZtcoCbp3saUKxbzM
	xRRrapzrS6wDP16cUWbTay/FsC44bz8Ehatgve9zkrYDPWJ0HN0GrNlUPyNwvRnZxLcDmGJgWsz
	eMXTfOAH40V1Hn+HHXAhCagj/LcQmzazHhjjluQgf1ampGHS/UwvyeThacPVPkdzm12cEjkcj9Z
	FZMcgfPgu7NYGDpACXNCkP2LeBbG+cM9O5IDP9U124gR4oGq4r6lH5aJLPv8Wf24G9w4mbvyDoA
	HZrZdQJMOqHQXe+KPBG+dqMStoiAgh3VkKQMY+7IuGr8lZKH2Y6anpfGku5e05ugQd8ah+lg1QB
	lsdcdiRk1A89Ap+MraGcpVCC0
X-Google-Smtp-Source: AGHT+IEd5xLqq86VBi5eN/EoU2LY/yhvy73M2exqpfZC2Jpf/FlPr/CrjfoTIjJl6gHW1Q2SHfBu4Q==
X-Received: by 2002:a05:6871:a594:b0:29e:6f32:6d91 with SMTP id 586e51a60fabf-2d4d2d8e5f3mr2774034fac.33.1744864742476;
        Wed, 16 Apr 2025 21:39:02 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm3630397fac.19.2025.04.16.21.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 21:39:01 -0700 (PDT)
Date: Wed, 16 Apr 2025 21:38:51 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Gavin Guo <gavinguo@igalia.com>
cc: linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org, 
    ziy@nvidia.com, linmiaohe@huawei.com, hughd@google.com, revest@google.com, 
    david@redhat.com, kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
In-Reply-To: <20250414072737.1698513-1-gavinguo@igalia.com>
Message-ID: <cff8d4e0-0c84-45ed-0ecb-646ec9841030@google.com>
References: <20250414072737.1698513-1-gavinguo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Gavin Guo wrote:

> When migrating a THP, concurrent access to the PMD migration entry
> during a deferred split scan can lead to a page fault, as illustrated
> below. To prevent this page fault, it is necessary to check the PMD
> migration entry and return early. In this context, there is no need to
> use pmd_to_swp_entry and pfn_swap_entry_to_page to verify the equality
> of the target folio. Since the PMD migration entry is locked, it cannot
> be served as the target.
> 
> BUG: unable to handle page fault for address: ffffea60001db008
> CPU: 0 UID: 0 PID: 2199114 Comm: tee Not tainted 6.14.0+ #4 NONE
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:split_huge_pmd_locked+0x3b5/0x2b60
> Call Trace:
> <TASK>
> try_to_migrate_one+0x28c/0x3730
> rmap_walk_anon+0x4f6/0x770
> unmap_folio+0x196/0x1f0
> split_huge_page_to_list_to_order+0x9f6/0x1560
> deferred_split_scan+0xac5/0x12a0
> shrinker_debugfs_scan_write+0x376/0x470
> full_proxy_write+0x15c/0x220
> vfs_write+0x2fc/0xcb0
> ksys_write+0x146/0x250
> do_syscall_64+0x6a/0x120
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> The bug is found by syzkaller on an internal kernel, then confirmed on
> upstream.
> 
> Fixes: 84c3fc4e9c56 ("mm: thp: check pmd migration entry in common path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gavin Guo <gavinguo@igalia.com>

Acked-by: Hugh Dickins <hughd@google.com>

> ---
>  mm/huge_memory.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2a47682d1ab7..0cb9547dcff2 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3075,6 +3075,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>  			   pmd_t *pmd, bool freeze, struct folio *folio)
>  {
> +	bool pmd_migration = is_pmd_migration_entry(*pmd);
> +
>  	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>  	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
> @@ -3085,10 +3087,18 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>  	 * require a folio to check the PMD against. Otherwise, there
>  	 * is a risk of replacing the wrong folio.
>  	 */
> -	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
> -	    is_pmd_migration_entry(*pmd)) {
> -		if (folio && folio != pmd_folio(*pmd))
> -			return;
> +	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) || pmd_migration) {
> +		if (folio) {
> +			/*
> +			 * Do not apply pmd_folio() to a migration entry; and
> +			 * folio lock guarantees that it must be of the wrong
> +			 * folio anyway.
> +			 */
> +			if (pmd_migration)
> +				return;
> +			if (folio != pmd_folio(*pmd))
> +				return;
> +		}
>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
>  	}
>  }
> 
> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> -- 
> 2.43.0
