Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447728C85B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298973; cv=none; b=gn0NNUC7xTOZVjvfYR0QfaMfKcA1vWEJF8BD4ZRhij9z5T+jLiy7zFazWr3e4eogncn/nu3efgPT863x6GBY8ipD0FcYfhkinkiUpOZVNpjqC7SDbARG7ZkoMq0bj/bADUUsiHhu/H//11V/dOQapnpvwCZ2QpzN5PXBEGcP/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298973; c=relaxed/simple;
	bh=GXQLlBGkESa73JDeg9lAcZht900M2pOJKw4fLsLGiyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edFh6fCMWiVa7Cp6IkceAYodr2NtWOuzRlGg7DaO36sN2C/MNgV3vHXcKwO4wgKEgzeH6KG2CKFsCPx4lGpnWhxRK4kySImAb0N8ltikWBtPWsiitKmbyLxnhLNfxNpWW/6VtzJJZBWJNH4be7Jn/gWCftk1q7cuqEXqJjuNsWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaUH9PJL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaUH9PJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34E4C4CEE7;
	Thu, 15 May 2025 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747298972;
	bh=GXQLlBGkESa73JDeg9lAcZht900M2pOJKw4fLsLGiyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaUH9PJL4Ca7+96F2efoB+Wsds28d5NkT8gRlydt3GASFTkDnoSRYWhvWJeVK8rqS
	 A1+yRTbqKeH7z57brgV4NAXN+z2FC0wgr/fjVArylf0K4jk5OOE+0jgyzsm//xI9y0
	 BEEIkkGK6ayN/yIp+Gkv8qowZJksiImHZqxXR250ROGPifIn8brUy5wkariPxbvR4n
	 g03OKpxBtvEFZAl++C+LmvyFTqsdQUi8CmhRk3zUlbQqh/4ODGPSlCWVz3jrdvK2yl
	 JFS9CkvihpFY5xMAY0KjSqVVDa/gyMHPxbkqiQ+C/cmMvKA5H+Ow0UW9xr1TiwnkdJ
	 tnmGezUzTLr2g==
Date: Thu, 15 May 2025 10:49:27 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 15/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
Message-ID: <aCWql__AlUA2fnLe@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-16-mingo@kernel.org>
 <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com>
 <aA3qGMf759kePUFI@gmail.com>
 <CAFULd4Za6kV0BuaDwi5j4Sz3LSX0VGef2Jfx9=Y0LYR-LKKaRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4Za6kV0BuaDwi5j4Sz3LSX0VGef2Jfx9=Y0LYR-LKKaRQ@mail.gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> On Sun, Apr 27, 2025 at 10:26 AM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > >
> > >
> > > On 25. 04. 25 10:42, Ingo Molnar wrote:
> > >
> > > > -#endif
> > > > +#define arch_cmpxchg64                     __cmpxchg64
> > > > +#define arch_cmpxchg64_local               __cmpxchg64_local
> > > > +#define arch_try_cmpxchg64         __try_cmpxchg64
> > > > +#define arch_try_cmpxchg64_local   __try_cmpxchg64_local
> > > >   #define system_has_cmpxchg64()            boot_cpu_has(X86_FEATURE_CX8)
> > >
> > > #define system_has_cmpxchg64()                1
> >
> > Thanks, I've updated the patch with the change below.
> 
> I think you also want to change:
> 
> > diff --git a/lib/atomic64_test.c b/lib/atomic64_test.c
> > index d726068358c7de..352e811c99ce9e 100644
> > --- a/lib/atomic64_test.c
> > +++ b/lib/atomic64_test.c
> > @@ -254,10 +254,8 @@ static __init int test_atomics_init(void)
> > pr_info("passed for %s platform %s CX8 and %s SSE\n",
> > #ifdef CONFIG_X86_64
> > "x86-64",
> > -#elif defined(CONFIG_X86_CX8)
> > - "i586+",
> > #else
> > - "i386+",
> > + "i586+",
> > #endif
> > boot_cpu_has(X86_FEATURE_CX8) ? "with" : "without",
> 
> X86_FEATURE_CX8 is now always defined, so the "without" part is now a
> dead code. Perhaps the info message should be updated to always say
> "... platform with CX8 and ..." or even to remove this part.

Yeah, agreed. I've folded in the delta change below.

Thanks,

	Ingo

---
 lib/atomic64_test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/atomic64_test.c b/lib/atomic64_test.c
index 352e811c99ce..d7697c09041f 100644
--- a/lib/atomic64_test.c
+++ b/lib/atomic64_test.c
@@ -251,13 +251,12 @@ static __init int test_atomics_init(void)
 	test_atomic64();
 
 #ifdef CONFIG_X86
-	pr_info("passed for %s platform %s CX8 and %s SSE\n",
+	pr_info("passed for %s platform with CX8 and %s SSE\n",
 #ifdef CONFIG_X86_64
 		"x86-64",
 #else
 		"i586+",
 #endif
-	       boot_cpu_has(X86_FEATURE_CX8) ? "with" : "without",
 	       boot_cpu_has(X86_FEATURE_XMM) ? "with" : "without");
 #else
 	pr_info("passed\n");
