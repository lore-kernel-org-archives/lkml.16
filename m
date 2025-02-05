Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB985846F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786592; cv=none; b=a2vUBSpf9aCQZCQZInNs0OOlmwU3barn/eEAZpYYFW1uUifmpgMHjDkuMtHC+1lh0SZp7jFYNo8Utnt6C+WPDJJnVJy6RxU3y3FjOVGokS99fmPNrql2rs5tT58wX6abljRGPPOHFbXRwGMNL7SvtMp4GlLXYBfnEzhYtkaHq1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786592; c=relaxed/simple;
	bh=q5Qyjks5N4JYhZt7wCgcitYxOircJZzJL8yKaBK/Rjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCJ3Srmpp7ggWuPg9ORqbyCnQU1ljo9ZvlzHUG4Vc7gtHTyl1cFS5r9rLte3HNi1ngYGtIJFOVSUYMcvVZ0he+H4otr4/GDLaV939rToqi/HBYAKgjQ1R1Fem96aIO9oZxpPxWxdaFs2NuqwMr3jCPdAhbWPBZZ9Zu+f9SWLnm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y1tn2txX; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y1tn2txX"
Date: Wed, 5 Feb 2025 15:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738786578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RY8iYnFHPWT+M4gWUF+5jQpYjoE7F10sz+0CtJqes/0=;
	b=Y1tn2txXTxCsOtNDv0r1DlhJdu03Br3UKtW7gkxpadlUmBfXv/CEcwrzhj3yOclVOPE67S
	eH39BOiJFxGsztnWJ6ma/Rm30bTfxlNbPMNnYcMWCF+K/8bPXjCyoxDn5tHZwcawNv5E7B
	qBfTGH1TlFsUrWljZ/nbZRDMbRSrh5Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] alloc_tag: work around clang-14 issue with
 __builtin_object_size()
Message-ID: <jdnvctbd4kfzgjy4s4wpd24zpv66zsn3cjgnsialjbnrl3oa4e@vexb7u4ku2tr>
References: <20250201200503.2532357-1-surenb@google.com>
 <202502051056.B910C691C@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502051056.B910C691C@keescook>
X-Migadu-Flow: FLOW_OUT

On Wed, Feb 05, 2025 at 11:18:35AM -0800, Kees Cook wrote:
> On Sat, Feb 01, 2025 at 12:05:03PM -0800, Suren Baghdasaryan wrote:
> > Additional condition in the allocation hooks causes Clang version 14
> > (tested on 14.0.6) to treat the allocated object size as unknown at
> > compile-time (__builtin_object_size(obj, 1) returns -1) even though
> > both branches of that condition yield the same result. Other versions
> > of Clang (tested with 13.0.1, 15.0.7, 16.0.6 and 17.0.6) compile the
> > same code without issues. Add build-time Clang version check which
> > removes this condition and effectively restores the unconditional tag
> > store/restore flow when compiled with clang-14.
> > 
> > Fixes: 07438779313c ("alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-lkp@intel.com/
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/alloc_tag.h | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > index a946e0203e6d..df432c2c3483 100644
> > --- a/include/linux/alloc_tag.h
> > +++ b/include/linux/alloc_tag.h
> > @@ -222,10 +222,23 @@ static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes) {}
> >  
> >  #endif /* CONFIG_MEM_ALLOC_PROFILING */
> >  
> > +/* See https://lore.kernel.org/all/202501310832.kiAeOt2z-lkp@intel.com/ */
> > +#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION >= 140000 && CONFIG_CLANG_VERSION < 150000
> 
> FWIW, this could just be "< 150000" -- < 14 doesn't warn because (as
> Nathan mentioned to me today) it didn't support the build-time error
> attribute, so it wouldn't have warned even if it did trip over it.
> 
> > +static inline bool store_current_tag(void)
> > +{
> > +	return true;
> > +}
> > +#else
> > +static inline bool store_current_tag(void)
> > +{
> > +	return mem_alloc_profiling_enabled();
> > +}
> > +#endif
> > +
> >  #define alloc_hooks_tag(_tag, _do_alloc)				\
> >  ({									\
> >  	typeof(_do_alloc) _res;						\
> > -	if (mem_alloc_profiling_enabled()) {				\
> > +	if (store_current_tag()) {					\
> >  		struct alloc_tag * __maybe_unused _old;			\
> >  		_old = alloc_tag_save(_tag);				\
> >  		_res = _do_alloc;					\
> 
> I think the work-around is fine, but I'm trying to dig into the root
> cause here.
> 
> As you found, it fails on the final strtomem_pad:
> 
> 	strtomem_pad(key->u.kbd.press_str, press, '\0');
> 	strtomem_pad(key->u.kbd.repeat_str, repeat, '\0');
> 	strtomem_pad(key->u.kbd.release_str, release, '\0');
> 
> (but not the earlier calls??) The destinations are:
> 
> 		char press_str[sizeof(void *) + sizeof(int)] __nonstring;
> 		char repeat_str[sizeof(void *) + sizeof(int)] __nonstring;
> 		char release_str[sizeof(void *) + sizeof(int)] __nonstring;
> 
> Random thoughts include "this is the last array in the struct" which might
> imply bad compiler behavior about its sizing via __builtin_object_size()
> (i.e. trailing array must always be unknown size to deal with
> fake flex arrays), but that wasn't fixed until Clang 16 (with
> -fstrict-flex-arrays=3), so that it doesn't trip in Clang 15 is odd.
> 
> To Kent's comment[1], I believe I was using __builtin_object_size() here
> because I have a knee-jerk aversion to sizeof() due to it blowing up on
> flexible arrays, but that's not relevant here. ARRAY_SIZE() would work,
> but only if type checking to "char *" succeeds, as Kent suggests.

Yeah, that rational for __builtin_object_size() makes sense - although
it's not what the gcc docs say, those talk about getting the size from
an attribute on the allocation function (!).

ARRAY_SIZE() is sizeof() underneath, just used creatively to guarantee
that the input is an array - although that property is probably what we
want here, since strtomem_pad() really only makes sense on static or
flex-arrays, no?
