Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34021E22FC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253732; cv=none; b=FtuyV/8gPuJzXpi5sjUrUr8P3t+Hiw1UM8Moq0qEinJh31uoHlyYA7QvD7iAtDXJ4uqo65z9nb1PQT68VAMfHTyvU662rzjHwkiXDCbNEFch3g6HJZrS2oEaFYXY+IW9dEWcZN7YGg0FElo3sn61amiqDEWSAiJ+U7pQ9NWw/mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253732; c=relaxed/simple;
	bh=SW4V5hITFkxVqEx9wgBTm1FK1FOMP7NvSMKBks1Bcqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEOpHMDZimYnJf5NEcJoXlwdjaMTIeFlOaRdRV2eCCw8Lka240AIg6oiP77Q+hyftQrlY0AYDhzK4FTUwc6dWCCOG9yfaioIfz8Wj+uppHMMYpkJgKHvIIqPk5YoZDkHm8+EtGBY+F6ABOxYU7TG1ZjzHDZ49ngTWYZt2v5tKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amWAKzZp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amWAKzZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85872C4CEE4;
	Mon, 21 Apr 2025 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745253732;
	bh=SW4V5hITFkxVqEx9wgBTm1FK1FOMP7NvSMKBks1Bcqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amWAKzZpTbYrg1NLEyFdke9pQmtCVwqZSM2F7YhYWq9kNROjn/AGuOAJH6yLqOHF+
	 Pl8Vwc2T1bRY7X95UedrGU4uCxcUuwxPvZhBsrLQlarfTQU5UxYx+YFNSxBn6/jZR8
	 C1+6+14XHUHYGeW8ydzNZ8QELXCbKWH+Hy5BnY8fIUwYpbWXCRIIOni/F4NWAfe57j
	 /R7INpOpvDnRjcvE//gWmoJTXF5182wTXhZ5EOoii3ccAQAxpqttSAX34dFm9mxJCt
	 ltp6M+/voLIW1oeXnsT0x9Lmsi/XzgrpsvtzYv5hwm0aRhp5MldR9kaXwWvYqV6p2E
	 s2f+xt1YGGi6g==
Date: Mon, 21 Apr 2025 19:42:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Fix typos in comments in mm_init.c
Message-ID: <aAZ1XnTO4xUQf9ow@kernel.org>
References: <20250420140440.18817-1-pvkumar5749404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420140440.18817-1-pvkumar5749404@gmail.com>

On Sun, Apr 20, 2025 at 07:34:40PM +0530, Prabhav Kumar Vaish wrote:
> Corrected minor typos in comments:
> 	- 'contigious' -> 'contiguous'
> 	- 'hierarcy' -> 'hierarchy'
> 
> This is a non-functional change in comment text only.
> 
> Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/mm_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 9659689b8ace..7f3361fd5392 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -828,7 +828,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
>   * - physical memory bank size is not necessarily the exact multiple of the
>   *   arbitrary section size
>   * - early reserved memory may not be listed in memblock.memory
> - * - non-memory regions covered by the contigious flatmem mapping
> + * - non-memory regions covered by the contiguous flatmem mapping
>   * - memory layouts defined with memmap= kernel parameter may not align
>   *   nicely with memmap sections
>   *
> @@ -1908,7 +1908,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
>  		free_area_init_node(nid);
>  
>  		/*
> -		 * No sysfs hierarcy will be created via register_one_node()
> +		 * No sysfs hierarchy will be created via register_one_node()
>  		 *for memory-less node because here it's not marked as N_MEMORY
>  		 *and won't be set online later. The benefit is userspace
>  		 *program won't be confused by sysfs files/directories of
> -- 
> 2.34.1
> 

-- 
Sincerely yours,
Mike.
