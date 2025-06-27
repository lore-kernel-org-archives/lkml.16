Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB22EBB86;
	Fri, 27 Jun 2025 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049443; cv=none; b=bqkxSiS3ZYdxxJgOifECF1JMyEXoDWwFSnSb8sphaW31CsbYvMSwN0dJxtrxLLRZ/eE+8nqGpe8p2WKf7WAW/C/o9fZBfkCrCAE3U4hFH2hJby3/lSrMslnIpJ4sNtdgRzgYoVDtS+zYj39938kc2C3waeMuwUROgD7yqPvwUKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049443; c=relaxed/simple;
	bh=n4I1t10u+1TLvpEKHa1L2Jl/GLtVz26vUrNW5m6uLk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfOkbiu5Z/xanOD0+XXex44e1wv9kfd5ZMZtZnB4s2zVuRlnyqSRDdAblzsSkOJbPuSLgi4SmTIkIXjalw3FePp1V1V1SvBakXvWicxzRrVKr2dYIgY3m1yMYuJcJTDEM2xl9jjqSEZnuFMNnAWvV3g0CV0hxdX2dJkQnzrP/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeJZAlqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeJZAlqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F090C4CEE3;
	Fri, 27 Jun 2025 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751049443;
	bh=n4I1t10u+1TLvpEKHa1L2Jl/GLtVz26vUrNW5m6uLk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeJZAlqMau3jCZQEn4scg3KB/9TSIdvbdgV3CL+bVMiZkLJaseDhqvZVQVvzl9Xa1
	 fUU78Bp1PzC3d6Ch6mbrt6swVxKPeEOjF09HdAOXH8g7/ie6sGKOn7fDHWjygmEqbr
	 7YNwSefJ/qENwVzQbSWwl9CYoi5d0BfG8Bz2jQegMr3uISW7hH3szy5xcQLnaYUzib
	 3RilmUkh4iWmGarA9CEfQn70Gsd9mOefcphXghhrcngIr1btasn+ejIO6Dx5B03Tiu
	 u52AiUBw3zmsUItRgkwxVLbakRddvV8fSYYhYBs4Nidu/6GDuSYgFMsOexRJSBuKUE
	 prfj7P8LeKutw==
Date: Fri, 27 Jun 2025 20:37:18 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 4/4] rust: support large alignments in allocations
Message-ID: <aF7k3grxI2Y80sFo@pollux>
References: <20250627181505.2080916-1-vitaly.wool@konsulko.se>
 <20250627181650.2081123-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627181650.2081123-1-vitaly.wool@konsulko.se>

On Fri, Jun 27, 2025 at 08:16:50PM +0200, Vitaly Wool wrote:
> Add support for large (> PAGE_SIZE) alignments in Rust allocators.
> All the preparations on the C side are already done, we just need
> to add bindings for <alloc>_node_align() functions and start
> using those.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> ---
>  rust/helpers/slab.c            | 14 ++++++++++++++
>  rust/helpers/vmalloc.c         |  7 +++++++
>  rust/kernel/alloc/allocator.rs | 34 +++++++++++-----------------------
>  3 files changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
> index 5abd552ccbd4..c4bb451bcf4e 100644
> --- a/rust/helpers/slab.c
> +++ b/rust/helpers/slab.c
> @@ -25,3 +25,17 @@ rust_helper_kvrealloc_node(const void *p, size_t size, gfp_t flags, int node)
>  {
>  	return kvrealloc_node(p, size, flags, node);
>  }
> +
> +void * __must_check __realloc_size(2)
> +rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
> +				gfp_t flags, int node)
> +{
> +	return krealloc_node_align(objp, new_size, align, flags, node);
> +}
> +
> +void * __must_check __realloc_size(2)
> +rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
> +				gfp_t flags, int node)
> +{
> +	return kvrealloc_node_align(p, size, align, flags, node);
> +}
> diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
> index e6c796c65ee1..09aee472340f 100644
> --- a/rust/helpers/vmalloc.c
> +++ b/rust/helpers/vmalloc.c
> @@ -13,3 +13,10 @@ rust_helper_vrealloc_node(const void *p, size_t size, gfp_t flags, int node)
>  {
>  	return vrealloc_node(p, size, flags, node);
>  }
> +
> +void * __must_check __realloc_size(2)
> +rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
> +				gfp_t flags, int node)
> +{
> +	return vrealloc_node_align(p, size, align, flags, node);
> +}

Here and in the previous patch, please remove unused helper functions when you
replace their usage with new ones.

Thanks,
Danilo
