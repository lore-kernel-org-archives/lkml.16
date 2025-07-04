Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC032222CC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628131; cv=none; b=CA+4gMd2G7E2/RGxxBBk4Z61ivKD5zmyQDqvsmpab3OyFXeyLmew3AbdINkpy4FipjAuNW+hNtZZwxZT9qyoa65Uyf5eyRpQS0QkL7EqHvktLHd1YDltWap7e0lFZgsgIypzxxFi8NR+QaVtObQEYDTuBsap62Qq3RqERSo/0K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628131; c=relaxed/simple;
	bh=kw1Ts3/LTsZ4+wKtri5gY1iYq+HjlpSCJi/WkIwgMnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtYoOasDzbnWRs2apBZ/qeRMXbedtk4Y8A3LlhmQFQXKoJkr80nSEAZm2+2LjOInvxVbk9EUlixgj1xi4qpRp5+tFPdlte5A+AyE+wZdbPiMip9MaaVXEMAscy1lV0NDTN4vsVqTc66halfWN6LiUZNp0PVu6HgrqyVKhrjn1Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA469C4CEEF;
	Fri,  4 Jul 2025 11:22:08 +0000 (UTC)
Date: Fri, 4 Jul 2025 12:22:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aGe5XjWKhgjzcw7L@arm.com>
References: <20250626052524.332-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626052524.332-1-dev.jain@arm.com>

On Thu, Jun 26, 2025 at 10:55:24AM +0530, Dev Jain wrote:
> @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	}
>  
>  	table = pmd_offset(pudp, addr);
> +	/*
> +	 * Isolate the PMD table; in case of race with ptdump, this helps
> +	 * us to avoid taking the lock in __pmd_free_pte_page().
> +	 *
> +	 * Static key logic:
> +	 *
> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> +	 * execute the if block, then this patches in the read lock, ptdump has
> +	 * the write lock patched in, therefore ptdump will never read from
> +	 * a potentially freed PMD table.
> +	 *
> +	 * Case 2: If the if block starts executing before ptdump's
> +	 * static_branch_enable(), then no locking synchronization
> +	 * will be done. However, pud_clear() + the dsb() in
> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an

Statements like "observes" really need to be relative, not absolute.
Like in "observes an empty PUD before/after ...".

> +	 * empty PUD. Thus, it will never walk over a potentially freed
> +	 * PMD table.
> +	 */
> +	pud_clear(pudp);
> +	__flush_tlb_kernel_pgtable(addr);
> +	if (static_branch_unlikely(&ptdump_lock_key)) {
> +		mmap_read_lock(&init_mm);
> +		mmap_read_unlock(&init_mm);
> +	}

This needs a formal model ;).

static_branch_enable() is called before the mmap_write_lock(), so even
if the above observes the new branch, it may do the read_unlock() before
the ptdump_walk_pgd() attempted the write lock. So your case 1
description is not entirely correct.

I don't get case 2. You want to ensure pud_clear() is observed by the
ptdump code before the pmd_free(). The DSB in the TLB flushing code
ensures some ordering between the pud_clear() and presumably something
that the ptdump code can observe as well. Would that be the mmap
semaphore? However, the read_lock would only be attempted if this code
is seeing the static branch update, which is not guaranteed. I don't
think it even matters since the lock may be released anyway before the
write_lock in ptdump.

For example, you do a pud_clear() above, skip the whole static branch.
The ptdump comes along on another CPU but does not observe the
pud_clear() since there's no synchronisation. It goes ahead and
dereferences it while this CPU does a pmd_free().

And I can't get my head around memory ordering, it doesn't look sound.
static_branch_enable() I don't think has acquire semantics, at least not
in relation to the actual branch update. The static_branch_unlikely()
test, again, not sure what guarantees it has (I don't think it has any
in relation to memory loads). Maybe you have worked it all out and is
fine but it needs a better explanation and ideally some simple formal
model. Show it's correct with a global variable first and then we can
optimise with static branches.

-- 
Catalin
