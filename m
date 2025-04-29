Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA0433C4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908388; cv=none; b=hoJHRvbWc3+DHVOioNOg/L1IIDlZy4QnjuOcF4mve2TsWsJFG3/OQpJ2yVSj4dueUpyBo2wIR64xLdn8SJpzS+Beja41GzfOTjvQKumHf6tnnc1VKwhnw5+DYqiojFThiUxWTK0XbGiKpL+t5VtBz/MYCOYBrwCrQ35iNP1Aij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908388; c=relaxed/simple;
	bh=o3uMeMDU8vBwj4IGsCzOkLDIARytjMi8U3yEpW7YFRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQctczj+LciCq2XUqHnXNikhg//EY3qOzfqGbMZ4RLUxDwB0yexFUIlzm/0z3Uulvq0plpkjDHT3Z2fdnNSPUxvsgWaz6CrR0T0zPVhbfj4YnCrX1lG8HPeRjadCe9xitliWkvvXcGmaN7E5KUhYkkuV++Mm/eFa5PUD4JQUIuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRA0wOvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRA0wOvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395A7C4CEE3;
	Tue, 29 Apr 2025 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745908387;
	bh=o3uMeMDU8vBwj4IGsCzOkLDIARytjMi8U3yEpW7YFRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRA0wOvZthOvgBl+IMbHFcuIZWXvS/2tQg4zmj3FPa2bkpZI0pKCM/nGdINpAdWQB
	 dYsVOwtHHSQ2e7ISoBy9DoNcqMqyXPhsHn/1gDIJhWoYH/5zXMSC9ucUvZuHqL7K2S
	 LXT/Q5Kzax+KWY3728JuebCVbduZqHqVaer73EjA7Cm1Z+asQauZKTqQ9qMcrktGhK
	 5N4QWWjNJJW+Sp6PU6HqRTX/JefhWz0/l9qX41mM3zzqHHm678efcZwtuXpXFdytoW
	 tlmCAE5eASxF/NviiqNSXh4Az/70rjrWYknWeKW9mPYlpkH9H+vWrD09gxLnSDQWg1
	 pWZ4Gs5DI/FoA==
Date: Tue, 29 Apr 2025 09:33:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, david@redhat.com, harry.yoo@oracle.com,
	riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH 1/3] mm/io-mapping: precompute remap protection flags for
 clarity
Message-ID: <aBBynJxyJXHPG-Fn@kernel.org>
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-2-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427100442.958352-2-ye.liu@linux.dev>

On Sun, Apr 27, 2025 at 06:04:40PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> In io_mapping_map_user(), precompute the page protection flags in a local
> variable before calling remap_pfn_range_notrack().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/io-mapping.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/io-mapping.c b/mm/io-mapping.c
> index 01b362799930..f44a6a134712 100644
> --- a/mm/io-mapping.c
> +++ b/mm/io-mapping.c
> @@ -21,9 +21,10 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>  	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
>  		return -EINVAL;
>  
> +	pgprot_t remap_prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
> +				       (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
> +
>  	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> -	return remap_pfn_range_notrack(vma, addr, pfn, size,
> -		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
> -			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
> +	return remap_pfn_range_notrack(vma, addr, pfn, size, remap_prot);
>  }
>  EXPORT_SYMBOL_GPL(io_mapping_map_user);
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.
