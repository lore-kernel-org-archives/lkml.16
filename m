Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC731E0DE4;
	Wed,  5 Feb 2025 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785460; cv=none; b=EmKEGGJEr9y+Kd/qMpKghrfdpCetBhqrweA5gnvnbhVGp++XOCRA01GPJLgmGubR3WivATmbxaLGtzs3F0WiqvBm8R4wonM++av+aC9qMKr3G8gXSdR3dK3O3QHqjKqtNV1f6DozxCD8LQkczrwgU4lfJ78g/31KoXZUSImMePM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785460; c=relaxed/simple;
	bh=9HR7Vozs1dntR1ZRv7pelV/MJV5PwKSbAHdkRkpsW8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpeLCYZ6y2gCwsFpIWzCnvrk6b4P0/2r90VrRyOUr5QYws/Pwfn55S6664L5i4UdSfG1MxoBFXPaL+Z+4pR2ixbuLnnHyb8c0cWm31JFEFwbiUNaNTkZgzF5MZOy6lym/c22TVUuBk4MK2RtxCkS2K+GK8P3mIRe/jYrgO+UQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEmHbfVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEmHbfVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A885C4CED1;
	Wed,  5 Feb 2025 19:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738785460;
	bh=9HR7Vozs1dntR1ZRv7pelV/MJV5PwKSbAHdkRkpsW8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEmHbfVeQ4oI3uI7DDcbfR8Ww8Y8TP2ZEHWvarvsbimvoAayVMVoxJD8DIAzsL54b
	 k83dJmcdU4WDlBrShfluuFB15+b7VV/IKYC53CxK7Fua0iH1bCXxRCsJF26nDAh1UC
	 Yf82nQ/C9pQ2xJ9oI3zbkD6MXUlA668znt+u4wfz4paF/WJ7JeGJkCefC99074MQ/a
	 Zdlz5RxGV+37uKOCeDzPKtQzlwu+UPciT+/Ti3uB5VzpjKR2ciiNEk9qFp3NKshFl2
	 KmIvUh/Iu5L2PTDSub1igt8YsnFh8PYAX1lLp292ZneJdPILruJeakOBzQfmd0glrG
	 PlTi9A6EYty1Q==
Date: Wed, 5 Feb 2025 12:57:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	kent.overstreet@linux.dev, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] alloc_tag: work around clang-14 issue with
 __builtin_object_size()
Message-ID: <20250205195735.GA1444602@ax162>
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

I bisected the fix in LLVM 15 to
https://github.com/llvm/llvm-project/commit/d8e0a6d5e9dd2311641f9a8a5d2bf90829951ddc,
which certainly makes sense. Given the commit mentions phi nodes and
folding means that maybe there is a branch that was not getting
eliminated before this change? I have not really looked into the call
chain here.

> To Kent's comment[1], I believe I was using __builtin_object_size() here
> because I have a knee-jerk aversion to sizeof() due to it blowing up on
> flexible arrays, but that's not relevant here. ARRAY_SIZE() would work,
> but only if type checking to "char *" succeeds, as Kent suggests.
> 
> Let me see if making those changes survives testing...

If that suggestion works, I would certainly prefer that to a compiler
version workaround. Worst case, we could bump the minimum supported LLVM
version over this but it does not seem serious enough to do so at the
moment.

Cheers,
Nathan
