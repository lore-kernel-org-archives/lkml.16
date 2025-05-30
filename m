Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6291E21C9FE
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601240; cv=none; b=VBsS3Fxk7Dd9LZy9v+hnovEy88LaDoN5MYOEKmuu3efmgw8CSHpQxYqUB5ucemveAoMTOuzV2ZyunSEt9rPV37U7qrXhRVU0XK4o2ckWs96ZNw64/6Ri6oW1rM/uYpkdwmSkXFToJUNGaO5hN69OAbok0DJs41nSc8m/bv5dkVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601240; c=relaxed/simple;
	bh=GMHzIEGr/CpDfGlfqcaKSrpWBKWgh/dv2XQ678hz2PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSMmHyjrhpNK8cczEJ5HpkijomCrTzTV438oEL98ZQAS+J1FwS1I60hMS8BdIb6zJ1AoRtE3cB4HcJcoH/KuN+GOBnXAQkEVS9zJYCK4c1tacNpyIwyvzborrVWiCM5sLsewazs/cp2sJ0KtcDd1I27C8TTJFCL6Lz2kSgq9xXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E46BB16F2;
	Fri, 30 May 2025 03:33:40 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B6553F673;
	Fri, 30 May 2025 03:33:54 -0700 (PDT)
Message-ID: <1c17a9e6-b04b-4754-8af5-521fcadba1bd@arm.com>
Date: Fri, 30 May 2025 11:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: Allow pagewalk without locks
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org, yang@os.amperecomputing.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-2-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250530090407.19237-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2025 10:04, Dev Jain wrote:
> It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> This being a non-sleepable context, we cannot take the init_mm mmap lock.
> Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
> locks.

It looks like riscv solved this problem by moving from walk_page_range_novma()
to apply_to_existing_page_range() in Commit fb1cf0878328 ("riscv: rewrite
__kernel_map_pages() to fix sleeping in invalid context"). That won't work for
us because the whole point is that we want to support changing permissions on
block mappings.

Yang:

Not directly relavent to this patch, but I do worry about the potential need to
split the range here though once Yang's series comes in - we would need to
allocate memory for pgtables atomically in softirq context. KFENCE is intended
to be enabled in production IIRC, so we can't just not allow block mapping when
KFENCE is enabled and will likely need to think of a solution for this?


> 
> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pagewalk.h |  2 ++
>  mm/pagewalk.c            | 12 ++++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 9700a29f8afb..9bc8853ed3de 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -14,6 +14,8 @@ enum page_walk_lock {
>  	PGWALK_WRLOCK = 1,
>  	/* vma is expected to be already write-locked during the walk */
>  	PGWALK_WRLOCK_VERIFY = 2,
> +	/* no lock is needed */
> +	PGWALK_NOLOCK = 3,

I'd imagine you either want to explicitly forbid this option for the other
entrypoints (i.e. the non- _novma variants) or you need to be able to handle
this option being passed in to the other functions, which you currently don't
do. I'd vote for explcitly disallowing (document it and return error if passed in).

>  };
>  
>  /**
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e478777c86e1..9657cf4664b2 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>  	case PGWALK_RDLOCK:
>  		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>  		break;
> +	default:
> +		break;
>  	}
>  #endif
>  }
> @@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
>  	 * specified address range from being freed. The caller should take
>  	 * other actions to prevent this race.
>  	 */
> -	if (mm == &init_mm)
> -		mmap_assert_locked(walk.mm);

Given apply_to_page_range() doesn't do any locking for kernel pgtable walking, I
can be convinced that it's also not required for our case using this framework.
But why does this framework believe it is necessary? Should the comment above
this at least be updated?

Thanks,
Ryan

> -	else
> -		mmap_assert_write_locked(walk.mm);
> +	if (ops->walk_lock != PGWALK_NOLOCK) {
> +		if (mm == &init_mm)
> +			mmap_assert_locked(walk.mm);
> +		else
> +			mmap_assert_write_locked(walk.mm);
> +	}
>  
>  	return walk_pgd_range(start, end, &walk);
>  }

