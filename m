Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F81E38F82;
	Wed,  5 Feb 2025 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783116; cv=none; b=gZ13KbkBebCClzb91dzupW8ZlqIxkgSsaHOObxua546sk/kuurwlbmjz/S80ZnTA3CbcK5kotOyaIBWK/KxLj5d135FzO2DZVmqq0F60qD0OX3oB9Jn9GxDaA8yfMlRVjh1PAoedSUohDEjVWNgJGiz8//JbBxDnnQcOTHj/h84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783116; c=relaxed/simple;
	bh=DVJod6AgATp1O+TTYUh9eYVwho2eGupKZZkC+Z7iPgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvFd1PUOdfcwBGzwIhI6O/M5ivO6Da5XpyFkpvqv0Xo6ixUpe/xKKGAUWdqW0VtWOkDZgPcC0/6kXmUWdi527E0okp8GQ2SvhgycitzeBBx5NMcEEMxV9IebLqyCLo2ZIgb93/K/+6Lb5KvdKVBJSFLKV1OhtimzymEN+0meo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1y0PXmI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1y0PXmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836D3C4CED1;
	Wed,  5 Feb 2025 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738783115;
	bh=DVJod6AgATp1O+TTYUh9eYVwho2eGupKZZkC+Z7iPgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1y0PXmIuWyOxpHrsAsMqBmea4NZ4kA9J/I51jW+4xaiNM+390lk/iXvzK2GCTshM
	 HntQFKRRc97sl5xo31dz+/sCfM5BpuYKIQhlJ1WBRAWTUFpKzgm3wwhmJYesFgwxPb
	 qNVRGwWbiaDEn6aD9lp+SI2j6ssHDaFxozfEXW8yKr8B3qL+Dh3f6GGdCiGqIHh1j+
	 GoxoVe54eXD2jVrHCdF/DLe4pWjFEtBvnYN5W/IjrSU0/78oW7RygOet0u/OlOHOrE
	 sfN4YAlEbNcWWUAF3nIvS1pQZI/sMo6nI4VtsopErN+wjdrn6tPCyJ08lh7mdTnUmh
	 XCO7Y0w9EPWDw==
Date: Wed, 5 Feb 2025 11:18:35 -0800
From: Kees Cook <kees@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] alloc_tag: work around clang-14 issue with
 __builtin_object_size()
Message-ID: <202502051056.B910C691C@keescook>
References: <20250201200503.2532357-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201200503.2532357-1-surenb@google.com>

On Sat, Feb 01, 2025 at 12:05:03PM -0800, Suren Baghdasaryan wrote:
> Additional condition in the allocation hooks causes Clang version 14
> (tested on 14.0.6) to treat the allocated object size as unknown at
> compile-time (__builtin_object_size(obj, 1) returns -1) even though
> both branches of that condition yield the same result. Other versions
> of Clang (tested with 13.0.1, 15.0.7, 16.0.6 and 17.0.6) compile the
> same code without issues. Add build-time Clang version check which
> removes this condition and effectively restores the unconditional tag
> store/restore flow when compiled with clang-14.
> 
> Fixes: 07438779313c ("alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-lkp@intel.com/
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/alloc_tag.h | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> index a946e0203e6d..df432c2c3483 100644
> --- a/include/linux/alloc_tag.h
> +++ b/include/linux/alloc_tag.h
> @@ -222,10 +222,23 @@ static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes) {}
>  
>  #endif /* CONFIG_MEM_ALLOC_PROFILING */
>  
> +/* See https://lore.kernel.org/all/202501310832.kiAeOt2z-lkp@intel.com/ */
> +#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION >= 140000 && CONFIG_CLANG_VERSION < 150000

FWIW, this could just be "< 150000" -- < 14 doesn't warn because (as
Nathan mentioned to me today) it didn't support the build-time error
attribute, so it wouldn't have warned even if it did trip over it.

> +static inline bool store_current_tag(void)
> +{
> +	return true;
> +}
> +#else
> +static inline bool store_current_tag(void)
> +{
> +	return mem_alloc_profiling_enabled();
> +}
> +#endif
> +
>  #define alloc_hooks_tag(_tag, _do_alloc)				\
>  ({									\
>  	typeof(_do_alloc) _res;						\
> -	if (mem_alloc_profiling_enabled()) {				\
> +	if (store_current_tag()) {					\
>  		struct alloc_tag * __maybe_unused _old;			\
>  		_old = alloc_tag_save(_tag);				\
>  		_res = _do_alloc;					\

I think the work-around is fine, but I'm trying to dig into the root
cause here.

As you found, it fails on the final strtomem_pad:

	strtomem_pad(key->u.kbd.press_str, press, '\0');
	strtomem_pad(key->u.kbd.repeat_str, repeat, '\0');
	strtomem_pad(key->u.kbd.release_str, release, '\0');

(but not the earlier calls??) The destinations are:

		char press_str[sizeof(void *) + sizeof(int)] __nonstring;
		char repeat_str[sizeof(void *) + sizeof(int)] __nonstring;
		char release_str[sizeof(void *) + sizeof(int)] __nonstring;

Random thoughts include "this is the last array in the struct" which might
imply bad compiler behavior about its sizing via __builtin_object_size()
(i.e. trailing array must always be unknown size to deal with
fake flex arrays), but that wasn't fixed until Clang 16 (with
-fstrict-flex-arrays=3), so that it doesn't trip in Clang 15 is odd.

To Kent's comment[1], I believe I was using __builtin_object_size() here
because I have a knee-jerk aversion to sizeof() due to it blowing up on
flexible arrays, but that's not relevant here. ARRAY_SIZE() would work,
but only if type checking to "char *" succeeds, as Kent suggests.

Let me see if making those changes survives testing...

-Kees

[1] https://lore.kernel.org/all/qbmazoiryyqygjk2x6bc7puqvmik7gyitzo3xnryzsodnrrjek@tahia33lvpli/

> 
> base-commit: 60c828cf80c07394762a1edfaff63bea55cc8e45
> -- 
> 2.48.1.362.g079036d154-goog
> 

-- 
Kees Cook
