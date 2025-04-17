Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD22B2DFA56
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853310; cv=none; b=EgO+LHW0OYnKx0EVRNWU5D3xg8+mtJUCJ1+zl4uzpBB0tikHRFvaWo8satUeGTgOWaH85QOdjJZgQcGnQ3IgMIkeugi6cm1B+u/y4TbhCgj66XmVXhitiHjBhA313huKEGDtnvIkz4m+IDYufo27U2vhv8LdNnzO+K+zUkE8h/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853310; c=relaxed/simple;
	bh=AYo/5za/1R1q9XRadHM+Z/+GYRmY4y6c3WSUoQN6ZPc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=T9DbbSGmdoUb8utgusR7Nb0jAIXGcsAcHIa3FhjwbjwBycJEEfoPd7p03vp9EYLQ1MzzNpUBLehMA+I/0ThbQneLW1e0+WEgHWJIwVwfAQD2fj4M9Kk3TJN+pxpfcYmpMPxyluvqXW5QdsCASAzfRt65W05YWM2KOfTO7TpzHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TKcD+2C0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TKcD+2C0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D2DC4CEE2;
	Thu, 17 Apr 2025 01:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744853309;
	bh=AYo/5za/1R1q9XRadHM+Z/+GYRmY4y6c3WSUoQN6ZPc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TKcD+2C0SqRS0g+QepWitAAWvj93i7dH5iy0pHn5oMFN1T4Yp7xpNjxuKfZuNbamc
	 M6XKsntqkzReU8JspA871O7uXdSxx+LbfSwMXjy8P/akMteg29ZZ90PVZ/Gnwl0hZL
	 FU3AEHkZD6bDgSZP+JXDBH47ztPL6yzU/jHX/Sng=
Date: Wed, 16 Apr 2025 18:28:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] x86/Kconfig: Fix allyesconfig
Message-Id: <20250416182828.9e2b312a75ed90b706483250@linux-foundation.org>
In-Reply-To: <4d9cb937-2a8a-4b3c-af32-f8fae922aa5c@roeck-us.net>
References: <20250416230559.2017012-1-linux@roeck-us.net>
	<20250416170359.a0267b77d3db85ff6d5f8ac0@linux-foundation.org>
	<4d9cb937-2a8a-4b3c-af32-f8fae922aa5c@roeck-us.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 17:17:00 -0700 Guenter Roeck <linux@roeck-us.net> wrote:

> On 4/16/25 17:03, Andrew Morton wrote:
> > On Wed, 16 Apr 2025 16:05:59 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> 64-bit allyesconfig builds fail with
> >>
> >> x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
> >>
> >> Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
> >> testing") as the responsible commit. Reverting that patch does indeed
> >> fix the problem. Further analysis shows that disabling SLUB_TINY enables
> >> KASAN, and that KASAN is responsible for the image size increase.
> >>
> >> Solve the build problem by disabling KASAN for test builds.
> >>
> > 
> > Excluding KASAN from COMPILE_TEST builds is regrettable.
> > 
> > Can we address this some other way?  One way might be to alter or
> > disable the KERNEL_IMAGE_SIZE check if COMPILE_TEST?  That will be sad
> > for anyone who tries to boot a COMPILE_TEST kernel, but who the heck
> > does that?
> 
> I tried increasing the limit. It didn't work. With the RFC I sent earlier
> I made it dependent on allmodconfig, but Linus said I should just disable
> it for test builds (which was the cases anyway until commit 6f110a5e4f99).
> 
> Personally I don't have a preference either way. I can also do nothing and
> stop testing allyesconfig. That would help reducing the load on my testbed,
> so I would be all for it.

How about this?



--- a/arch/x86/kernel/vmlinux.lds.S~a
+++ a/arch/x86/kernel/vmlinux.lds.S
@@ -466,10 +466,19 @@ SECTIONS
 }
 
 /*
- * The ASSERT() sink to . is intentional, for binutils 2.14 compatibility:
+ * COMPILE_TEST kernels can be large - CONFIG_KASAN, for example, can cause
+ * this.  Let's assume that nobody will be running a COMPILE_TEST kernel and
+ * let's assert that fuller build coverage is more valuable than being able to
+ * run a COMPILE_TEST kernel.
+ */
+#ifndef CONFIG_COMPILE_TEST
+/*
+/*
+ * The ASSERT() sync to . is intentional, for binutils 2.14 compatibility:
  */
 . = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
 	   "kernel image bigger than KERNEL_IMAGE_SIZE");
+#endif
 
 /* needed for Clang - see arch/x86/entry/entry.S */
 PROVIDE(__ref_stack_chk_guard = __stack_chk_guard);
_


(contains gratuitous s/sink/sync/)


I'd like to add

#else
	WARN((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
 	   "kernel image bigger than KERNEL_IMAGE_SIZE - kernel probably will not work");
#endif	/* CONFIG_COMPILE_TEST */

but I lack the patience to figure out how to do that.
