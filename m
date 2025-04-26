Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA257A13A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655766; cv=none; b=p7lJ/mFBrr3cM7U1+wNLfGpByZx1fHBPJqbK+zk2lER6/Dcylr150YibR7xQO9PaEaT4jyNjIRrwU/Xjs1rsP86MCWhThCB5qvmB6kKorGdAUZRNsa21bNY2n5hLTna3REDdR5az5WrjmiLs4RgaVpH/rd3rMw4Ll/kAfaiojNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655766; c=relaxed/simple;
	bh=7Bl7de4B1CcHT/qr+JjEpriesTtHJODEoTtEeQXzAkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcI6teKM0gHa9jvbsKZ+mU03v/CG6uB5ENBHTHZTB6+bqB2OJR4nnWJXjLvtMbMzWVR3qFAInf4PvuvbDdFKb1GZ3wYv20pu+ZRYSIJSXeuzJEXdMFa25atxotIERmEjxnRcR8IF9t5JZUx1WkeM6b+/itCLfWiobn9u6TQGG+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJHaeRL1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJHaeRL1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98959C4CEE2;
	Sat, 26 Apr 2025 08:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745655765;
	bh=7Bl7de4B1CcHT/qr+JjEpriesTtHJODEoTtEeQXzAkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJHaeRL12xwlkkkBC+jsJeEVr9fi1ApDZSdVzQ5yOExRKsw6gBHotqsfnF2oz3Lk/
	 ruaQsnEyhzIOfF9lwX1R0X8/HV08J/+ceGT8uPxsBd4nCnNuozq635mUBDDj+hpr3P
	 2n1zBihSzqe7gKpB1YMe8u5ib2FbvioCKlszUGnJenADLpkgXwddcrBYDzxjnqlfgu
	 XDxXV0E6/YMVCctw8wNmeAqu4EVSUMJSo9wYSl7nIj3eosllzvHr+yD85QZEX6WHk/
	 f6VQfAvY0Kfp21TtpwnDW5PiAKqbhdpfrd+Dq7yuBvI5jBULIB/DVoBklcfTneVw3u
	 0XzDbQFewiNdQ==
Date: Sat, 26 Apr 2025 11:22:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Bernardo C. Gutierrez Cantu" <bercantu@amazon.de>
Cc: akpm@linux-foundation.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lkp@intel.com,
	yajun.deng@linux.dev
Subject: Re: [PATCH] mm: memblock: Fix arguments passed to memblock_set_node()
Message-ID: <aAyXzywgqH2qFRKn@kernel.org>
References: <bd5842a92bd340799a74063f8da83d96@amazon.de>
 <20250425102003.64122-1-bercantu@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425102003.64122-1-bercantu@amazon.de>

Hi Bernardo,

On Fri, Apr 25, 2025 at 10:20:03AM +0000, Bernardo C. Gutierrez Cantu wrote:
> memblock_set_node() receives a `base` and a `size` arguments, but we are
> passing the `start` and `end` of the memory regions when iterating over
> them in memmap_init_reserved_pages() to set their node ids.
> 
> This results in the function setting the node ids for the reserved memory
> regions in `[base, base + base + size)` instead of `[base, base + size)`.
> 
> Pass `start` and `size`, so that we iterate over the correct range.
> 
> Fixes: 61167ad5fecd ("mm: pass nid to reserve_bootmem_region()")
> 
> Signed-off-by: Bernardo C. Gutierrez Cantu <bercantu@amazon.de>

There's already a fix in memblock tree:
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git/commit/?h=for-next&id=06eaa824fd239edd1eab2754f29b2d03da313003

Will send PR to Linus soon.

> ---
>  mm/memblock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 0a53db4d9f7b..9639f04b4fdf 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2196,7 +2196,7 @@ static void __init memmap_init_reserved_pages(void)
>  		if (memblock_is_nomap(region))
>  			reserve_bootmem_region(start, end, nid);
>  
> -		memblock_set_node(start, end, &memblock.reserved, nid);
> +		memblock_set_node(start, region->size, &memblock.reserved, nid);
>  	}
>  
>  	/*
> -- 
> 2.47.1

-- 
Sincerely yours,
Mike.
