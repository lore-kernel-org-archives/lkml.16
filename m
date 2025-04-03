Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF9A24290C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682039; cv=none; b=mCBippclXP4OeBVQ5lWHJDLK+kzuNmD7ph3xkgPONdJsQU2vS8zi71Cr2sAAPdvnQUpfAn1Qd765FnX8jgKVoon0tLnrFrFcFdJ3rH+u+vhARkpKpobLdV4bD6qHtrcfOv5YEOnlWixxcnOja/pNRiWNrOYE9dQv32CSMXOyHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682039; c=relaxed/simple;
	bh=Xx/uMGGpXFLCyWzmxzh6q2J1QlB9kyM+j2hMV5QDQLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEoMuBCD4BNGUTHMoKgml9G1vR4q97snawpY61cFS3sRyjM6U3ojBGIl4RURmeV4AxweTjqSrJmh08ty16OZmN+6Q7RC1M/SOCyT9z565mAKUVJ8sGST+1SJt62n3OXMdH9zPc7g/BA0/uzd5YaDrz3SUUZv0g99hU9kHm256cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8KzDTQp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8KzDTQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743682038; x=1775218038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Xx/uMGGpXFLCyWzmxzh6q2J1QlB9kyM+j2hMV5QDQLU=;
  b=n8KzDTQpkb+pjY62glG6TVickAZlYqMMtBGOmLDW17wRVrmfqG0lEZ4y
   Q6rqLFWKQ7Qp2gbeAsZnqDBKcFrsCqfeBGYEz1DAg71XB5+bmdr6An7im
   PFFeHtADLj0AoW3CDB/fFvEsNiPm7B1wJ08LaD6vAP0SdUBbHh45mKHL/
   Wxt5jsRUOGX8ACU5wnrAE5WHsdeJGE7vp2q7GrqgWuHgjxiU5J5NTnBV0
   bo64VeuyrGvUHMsbHdtlnlrqdnBpQqAMJTPjLBUTJOCy6+KtZg7AAStog
   sENLUsNKyM0c6t86u0RgaosqSM3xq4e1P/L1WoD5rLE3QKr5MxRizb2aE
   A==;
X-CSE-ConnectionGUID: xgF+9dsBRuqrLktMzJkQYA==
X-CSE-MsgGUID: ykXYT3npSNueyTqDqEd1cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56073508"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56073508"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 05:07:16 -0700
X-CSE-ConnectionGUID: OiPK3NiMQ7qQuETJGLy4/w==
X-CSE-MsgGUID: RCrZeVECR8ivG9FP9Q09Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132114751"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 05:07:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0JLh-00000008nZY-31sR;
	Thu, 03 Apr 2025 15:07:09 +0300
Date: Thu, 3 Apr 2025 15:07:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <Z-557YrwVr8bONq4@smile.fi.intel.com>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
 <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
 <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
 <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>
 <20250402203422.GA655609@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402203422.GA655609@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 02, 2025 at 01:34:22PM -0700, Nathan Chancellor wrote:
> On Wed, Apr 02, 2025 at 10:25:46PM +0300, Andy Shevchenko wrote:
> > +Cc: Kees and Nathan (I believe this discussion has some material for
> > you, folks, to think of / comment on / etc)
> 
> Thanks, I have commented on the part of the message that seem relevant
> for me.

Thank you!

> > On Wed, Apr 2, 2025 at 10:06 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > On Wed, 2 Apr 2025 at 11:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > Yes. Clang complains on unknown pragma.
> > >
> > > What a crock.
> > >
> > > It says GCC, for chrissake!
> > >
> > > And clang clearly doesn't complain about
> > >
> > > >   +#pragma GCC diagnostic push
> > > >   +#pragma GCC diagnostic pop
> > >
> > > which are *not* protected by that #ifndef __clang__ thing.
> > >
> > > So this smells like a clang bug to me.
> 
> Yes, clang implements support for '#pragma GCC' for compatability with
> existing source code:
> 
> https://clang.llvm.org/docs/UsersManual.html#controlling-diagnostics-via-pragmas
> 
> Otherwise, the pragma would need to be duplicated if the warning was
> shared between the compilers (as many are nowadays).
> 
> It complains specifically about an unknown warning being passed to
> 'diagnostic ignored':
> 
>   lib/vsprintf.c:1703:32: error: unknown warning group '-Wsuggest-attribute=format', ignored [-Werror,-Wunknown-warning-option]
>    1703 | #pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
>         |                                ^
>   1 error generated.
> 
> Which I suppose you could argue is a bug since it is a GCC pragma,
> although warning on an unknown option to the ignored diagnostic pragma
> is what GCC does as well (it just ignores '#pragma clang' altogether):
> 
>   $ echo '#pragma GCC diagnostic ignored "-Wfoo"' | gcc -fsyntax-only -x c -
>   <stdin>:1:32: warning: unknown option after ‘#pragma GCC diagnostic’ kind [-Wpragmas]
> 
> I can look into filing a report upstream about this, however...
> 
> > > Can we please use wrapper defines instead so that we don't have that
> > > #ifndef in the middle of code? And since those don't work with
> > > '#pragma', they need to use the _Pragma() operator instead.
> > >
> > > Something like
> > >
> > >    #define GCC_PRAGMA(x) _Pragma(#x)
> > >
> > > in compiler-gcc.h, and then add a
> > >
> > >   #ifndef GCC_PRAGMA
> > >     #define GCC_PRAGMA(x) /* Nothing */
> > >   #endif
> > >
> > > and then you can just do
> > >
> > >    GCC_PRAGMA(Wsuggest-attribute=format)
> > >
> > > in places like this?
> > >
> > > (Entirely untested: I *despise* pragma in general).
> 
> We have the __diag() infrastructure for this already. I think this issue
> would be as simple as the following diff, which makes clang and GCC
> happy without any obvious ifdeffery.

FWIW, I have tested this in my case for both compilers and they are happy with it.

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> diff --git a/include/linux/compiler-igcc.h b/include/linux/compiler-gcc.h
> index 32048052c64a..5d07c469b571 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -127,6 +127,8 @@
>  #define __diag_GCC_8(s)
>  #endif
>  
> +#define __diag_GCC_all(s)	__diag(s)
> +
>  #define __diag_ignore_all(option, comment) \
>  	__diag(__diag_GCC_ignore option)
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 01699852f30c..6ff4d85e144e 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1699,10 +1699,8 @@ char *escaped_string(char *buf, char *end, u8 *addr, struct printf_spec spec,
>  	return buf;
>  }
>  
> -#pragma GCC diagnostic push
> -#ifndef __clang__
> -#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
> -#endif
> +__diag_push();
> +__diag_ignore(GCC, all, "-Wsuggest-attribute=format", "<reason>");
>  static char *va_format(char *buf, char *end, struct va_format *va_fmt,
>  		       struct printf_spec spec)
>  {
> @@ -1717,7 +1715,7 @@ static char *va_format(char *buf, char *end, struct va_format *va_fmt,
>  
>  	return buf;
>  }
> -#pragma GCC diagnostic pop
> +__diag_pop();
>  
>  static noinline_for_stack
>  char *uuid_string(char *buf, char *end, const u8 *addr,

-- 
With Best Regards,
Andy Shevchenko


