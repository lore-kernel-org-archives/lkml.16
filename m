Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6B20C025
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743068197; cv=none; b=ERVy8+PmZL018b/X0DfPPH86doztpndFndaRczyEpbn7/57j0CXz7Hxiun+WnsitKTH/4+byJwn0TKpjkkFUbwSPkA8K/nE33KKBxFmod1fYEPHxpXeNS7anJmaNn4IrgR3eGCf36AMyF+bbIt51OkpTN+u7FFh5Q3RETcJP8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743068197; c=relaxed/simple;
	bh=bZhE3bjLYhBkFnRZcm1kLv51TZMsYQg3FaSHG239LRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuWMxwI7pp1ZjczG36g6CF8e+lVsSB871wLBrbSKjql+HPhjatnNgPHQKUxxSHCUWNeq8W92ELqVNqVFiVuq7n4dhxgqt/YQH7U+GsD6n3qo+AOHVZJn9kbWb8+RTs0CoQ9pEcpguN1Ak8d6fj+0UYkAbR/kFcGBQ8Yw9Iwh4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geg2uA8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geg2uA8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F372AC4CEEA;
	Thu, 27 Mar 2025 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743068197;
	bh=bZhE3bjLYhBkFnRZcm1kLv51TZMsYQg3FaSHG239LRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geg2uA8tbxXWb8pT4jufA8lnH/AnEHbUUZ7Dzobj3zppV66qR5AOqLGdBShF8sk9n
	 6V063O3WYmxmnHG+gkqHDB+F35bE8HcAnJ2rw8h3pceLwbT2iPiq5oqHRMjJvM4evx
	 udGFVX8Hgf9xf0mk85WTgtiTD//8vwDZu5SewxSUlbcHzC6P5OhGBhQFr1yDRBYdGa
	 2HPKCUCjYUFKWv19GCWLmCvipQhwD4xhP8eMGROWDMh3PBVntIdKCiSn66Y4vxeVxB
	 E9SCkRrdGD8wxx1zYpOhTwnhrx3rF7MpcsIoXcZy4J5uyQMyzINraVdxW5cVLPy2z/
	 oXamAzbdB8u6Q==
Date: Thu, 27 Mar 2025 10:36:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 4/5] bugs/x86: Augment warnings output by concatenating
 'cond_str' with the regular __FILE__ string in _BUG_FLAGS()
Message-ID: <Z-UcIJAQsNXoxMXG@gmail.com>
References: <20250326084751.2260634-1-mingo@kernel.org>
 <20250326084751.2260634-5-mingo@kernel.org>
 <20250326085343.GB25239@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326085343.GB25239@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Mar 26, 2025 at 09:47:49AM +0100, Ingo Molnar wrote:
> > This allows the reuse of the UD2 based 'struct bug_entry' low-overhead
> > _BUG_FLAGS() implementation and string-printing backend, without
> > having to add a new field.
> > 
> > An example:
> > 
> > If we have the following WARN_ON_ONCE() in kernel/sched/core.c:
> > 
> > 	WARN_ON_ONCE(idx < 0 && ptr);
> > 
> > Then previously _BUG_FLAGS() would store this string in bug_entry::file:
> > 
> > 	"kernel/sched/core.c"
> > 
> > After this patch, it would store and print:
> > 
> > 	"[idx < 0 && ptr] kernel/sched/core.c"
> > 
> > Which is an extended string that will be printed in warnings.
> > 
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > ---
> >  arch/x86/include/asm/bug.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> > index aff1c6b7a7f3..e966199c8ef7 100644
> > --- a/arch/x86/include/asm/bug.h
> > +++ b/arch/x86/include/asm/bug.h
> > @@ -50,7 +50,7 @@ do {									\
> >  		     "\t.org 2b+%c3\n"					\
> >  		     ".popsection\n"					\
> >  		     extra						\
> > -		     : : "i" (__FILE__), "i" (__LINE__),		\
> > +		     : : "i" (cond_str __FILE__), "i" (__LINE__),		\
> >  			 "i" (flags),					\
> >  			 "i" (sizeof(struct bug_entry)));		\
> >  } while (0)
> 
> Sneaky :-)

BTW., any reason why we go all the trouble with the bug_entry::line u16 
number, instead of storing it in the bug_entry::file string with a
:__LINE__ postfix or so?

Using 4 bytes doesn't even save any RAM, given that the average line 
position number within the kernel is around 3 bytes:

 $ for N in $(git grep -lE 'WARN_ON|BUG_ON|WARN\(|BUG\(' -- '*.[ch]'); do echo -n $(($(cat $N | wc -l)/2)) | wc -c; done | sort -n | uniq -c

     10 1
   1209 2
   6645 3
   1582 4
     10 5

( This is the histogram of the length of average line numbers within 
  the kernel's ~9,400 .[ch] source code files that are using these 
  facilities. )

So concatenation would save on complexity, IMHO, and it would give us 
flexibility as well, if we passed in the string from higher layers. We 
wouldn't have to change architecture level code at all for this series 
for example.

Not to mention that some files within the kernel are beyond the 16-bit 
limit already, 38K to 222K lines of code:

  starship:~/tip> wc -l drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h
  222,948 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h

  starship:~/tip> wc -l crypto/testmgr.h
  38,897 crypto/testmgr.h

So u16 line numbers are also a (minor) breakage waiting to happen.

Thanks,

	Ingo
