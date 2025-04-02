Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB962E3385
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626067; cv=none; b=gMEpsmjbvf89IGMltoYyXl8wIb8i0uQMRvAhuld88v0PDPCOaHTfh2ucyiIF5LJX8uHHfsmmSFcGtz7gzxV7Cnm8oDB+XOUk0hKnek+brq7pJyxy4wZN0D4UVeM9L7rnnDqgm25FIXFY9hxPJB0kbIyk3fFJLv1XVl8oAe0JztU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626067; c=relaxed/simple;
	bh=vmyD9NqZHTQ4XnnmlcSTbgv4EvwriTLjHpT0f/1xbgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kckoPwWb7fmp/RkgR7ZhrzYFCk1FYorC99YcG8WX2RkQ/MVmiIiv4E2CE3z7MyRVn9eZdRKpW63tWOFrA3+caakKZEk/OWBfNsJ5v1qBNrP4mS25SwVTtLONEs6XLhcGNSZgzdZX3IfjG/mw/pNt/63b933dJ7wYiDAxsIunaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9l4XYN9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9l4XYN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6DBC4CEDD;
	Wed,  2 Apr 2025 20:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743626067;
	bh=vmyD9NqZHTQ4XnnmlcSTbgv4EvwriTLjHpT0f/1xbgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9l4XYN9tMSMj2RhsrcQ1tCSn90naQiy+VSr4xf+pAvUIhCEOiC2Xcos5pg+gpo1+
	 BJSQtf79PVkhHW94vpr9UQDrfNlnri+fvvS3La5HqobwmBTRCliRIUTEqPyPnESt9t
	 qAE4Nmmp/JfKTFrEmpL/HOvev+aLzrHfcoT26UdEcKJTUUdEuAkBrGzGGb+UVGVQLr
	 8rUqOI/VIZFnYD9eqEvLpwCMswtQZdXGSNLUoVxfs4J7/6txlKzvCaTl/THBGkGStq
	 HMK1Drr1eqC6aVGyILBJoNgDgkhTy6wnQKzy5kQYaknShQt7T9CyBbgw0HcOQzC2O1
	 NiG8CwNLdr0qg==
Date: Wed, 2 Apr 2025 13:34:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <20250402203422.GA655609@ax162>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
 <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
 <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
 <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>

On Wed, Apr 02, 2025 at 10:25:46PM +0300, Andy Shevchenko wrote:
> +Cc: Kees and Nathan (I believe this discussion has some material for
> you, folks, to think of / comment on / etc)

Thanks, I have commented on the part of the message that seem relevant
for me.

> On Wed, Apr 2, 2025 at 10:06 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Wed, 2 Apr 2025 at 11:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >
> > > Yes. Clang complains on unknown pragma.
> >
> > What a crock.
> >
> > It says GCC, for chrissake!
> >
> > And clang clearly doesn't complain about
> >
> > >   +#pragma GCC diagnostic push
> > >   +#pragma GCC diagnostic pop
> >
> > which are *not* protected by that #ifndef __clang__ thing.
> >
> > So this smells like a clang bug to me.

Yes, clang implements support for '#pragma GCC' for compatability with
existing source code:

https://clang.llvm.org/docs/UsersManual.html#controlling-diagnostics-via-pragmas

Otherwise, the pragma would need to be duplicated if the warning was
shared between the compilers (as many are nowadays).

It complains specifically about an unknown warning being passed to
'diagnostic ignored':

  lib/vsprintf.c:1703:32: error: unknown warning group '-Wsuggest-attribute=format', ignored [-Werror,-Wunknown-warning-option]
   1703 | #pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
        |                                ^
  1 error generated.

Which I suppose you could argue is a bug since it is a GCC pragma,
although warning on an unknown option to the ignored diagnostic pragma
is what GCC does as well (it just ignores '#pragma clang' altogether):

  $ echo '#pragma GCC diagnostic ignored "-Wfoo"' | gcc -fsyntax-only -x c -
  <stdin>:1:32: warning: unknown option after ‘#pragma GCC diagnostic’ kind [-Wpragmas]

I can look into filing a report upstream about this, however...

> > Can we please use wrapper defines instead so that we don't have that
> > #ifndef in the middle of code? And since those don't work with
> > '#pragma', they need to use the _Pragma() operator instead.
> >
> > Something like
> >
> >    #define GCC_PRAGMA(x) _Pragma(#x)
> >
> > in compiler-gcc.h, and then add a
> >
> >   #ifndef GCC_PRAGMA
> >     #define GCC_PRAGMA(x) /* Nothing */
> >   #endif
> >
> > and then you can just do
> >
> >    GCC_PRAGMA(Wsuggest-attribute=format)
> >
> > in places like this?
> >
> > (Entirely untested: I *despise* pragma in general).

We have the __diag() infrastructure for this already. I think this issue
would be as simple as the following diff, which makes clang and GCC
happy without any obvious ifdeffery.

Cheers,
Nathan

diff --git a/include/linux/compiler-igcc.h b/include/linux/compiler-gcc.h
index 32048052c64a..5d07c469b571 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -127,6 +127,8 @@
 #define __diag_GCC_8(s)
 #endif
 
+#define __diag_GCC_all(s)	__diag(s)
+
 #define __diag_ignore_all(option, comment) \
 	__diag(__diag_GCC_ignore option)
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 01699852f30c..6ff4d85e144e 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1699,10 +1699,8 @@ char *escaped_string(char *buf, char *end, u8 *addr, struct printf_spec spec,
 	return buf;
 }
 
-#pragma GCC diagnostic push
-#ifndef __clang__
-#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
-#endif
+__diag_push();
+__diag_ignore(GCC, all, "-Wsuggest-attribute=format", "<reason>");
 static char *va_format(char *buf, char *end, struct va_format *va_fmt,
 		       struct printf_spec spec)
 {
@@ -1717,7 +1715,7 @@ static char *va_format(char *buf, char *end, struct va_format *va_fmt,
 
 	return buf;
 }
-#pragma GCC diagnostic pop
+__diag_pop();
 
 static noinline_for_stack
 char *uuid_string(char *buf, char *end, const u8 *addr,
