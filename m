Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E06AF9D9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842525; cv=none; b=Ew74ImCpnLm6JtbB5kyjG5gIH0moLJ0RXB/TInwmB8VGzfkPNufkUP1XtZ++lv3dOMD3bYShUKhArAyHB+32iX/4UFWqRqUhY0x1amOcTW+768kmYgHxcMxLLED9GGwIaVd/ibFTJmUnvYlx71Mld2NCki53TiPwu5c7Yb7pm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842525; c=relaxed/simple;
	bh=UEFna+Fm2dCI10qgoYtLLtWje8Jeiejw+Hk0uP0V6E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVVadGEB+V+UL5uXpx0lQpZe/gJM2l8B2cKDf8dClUxbsR6eZ/+BssO4OGKl/sqCT3MwNzqOe9eJKd+lM0iAsKmE+DK6JfB+I2+bv3VTjKolESI2P7Rb4r3MQKpDAn53Jq+SocOvL6VMTGqFIBJ6+Nghw9GIsYkmx3eJo+24rzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B55371516;
	Mon, 28 Apr 2025 05:15:16 -0700 (PDT)
Received: from [10.163.50.165] (unknown [10.163.50.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67F383F66E;
	Mon, 28 Apr 2025 05:15:18 -0700 (PDT)
Message-ID: <e3ff5b41-85ed-4a42-aaf0-ab4f16006aab@arm.com>
Date: Mon, 28 Apr 2025 17:45:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm/io-mapping: precompute remap protection flags for
 clarity
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, david@redhat.com,
 harry.yoo@oracle.com, riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-2-ye.liu@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250427100442.958352-2-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 15:34, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> In io_mapping_map_user(), precompute the page protection flags in a local
> variable before calling remap_pfn_range_notrack().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
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

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
