Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09F4A35
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159088; cv=none; b=SWwpXnL8xAm6Sva4/EhLOsyN8vWjNNy63ojBDyqMQYg4os6Kgh9DOpzTzQYw5sVxCzjXG0OurFYvDhSyvQ7eK10qdrnpKRSzcEC69nG4XwBjTdafeeyRB/Nr1UNJ/8k/8zUo82UJejUt8pZxiuhP89+DfmL/ypl0WPHuw4Y5tkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159088; c=relaxed/simple;
	bh=xYXo/AkChMu0jY7VwOHqjMJgNLi95yqKZnjfXu+TjI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0lAyg+90fd43DjhZGH2/TU59wnvzvf7HPCWWJcMKA0Z8Ifsj/Dmk43H9yNw3GXpDuzupMS787JDUQQWb6WadT4INCmhQE2EMTiuri50aXR0V6TGwIgrZgSiyH8E7EO5DtQbjmmUb3dAoqFYkIWskhLha9iV6G1hhX4Cbic61S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyYEsca2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyYEsca2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA67C4CEE5;
	Wed,  9 Apr 2025 00:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744159087;
	bh=xYXo/AkChMu0jY7VwOHqjMJgNLi95yqKZnjfXu+TjI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyYEsca2QsW5BZ7I/2QUhDe9vcNdBLehZn41qrW58OQP2bEGNPHJTW38L3GKiqgZW
	 z+qk3wDdSaIiXx1F3S/+zG8oYbLxVkECjb7+Ak6PcvL42F3b40xCX97dEojcs5IvkP
	 EOWRbPurudVfeITi9YrI0ytLnJVOnt+XGcT40WDBPEY6hweeAkzVGVNxZnBw1EiGRH
	 RPg7gxIrHz3xcf+mxXJ/NXCsfMrrDEajzw+/43bKrM8/eiguKT5FeoTz3E4amqCnoF
	 o6pSq/OcG/mDYRzdGeMIYtuzjjlYnr23FBRjyulFoChEar1RM0CYaiHe+bDOoZTh6F
	 b7TqiWU1hPvhA==
Date: Tue, 8 Apr 2025 17:38:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409003803.GA2876360@ax162>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408223611.GA26876@strace.io>

On Wed, Apr 09, 2025 at 01:36:11AM +0300, Dmitry V. Levin wrote:
> On Tue, Apr 08, 2025 at 02:31:31PM -0700, Nathan Chancellor wrote:
> > On Mon, Mar 03, 2025 at 01:20:09PM +0200, Dmitry V. Levin wrote:
> > > +static inline void syscall_set_arguments(struct task_struct *task,
> > > +					 struct pt_regs *regs,
> > > +					 const unsigned long *args)
> > > +{
> > > +	regs->orig_a0 = args[0];
> > > +	args++;
> > > +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > +}
> > 
> > This upsets the compiletime fortify checks, as I see a warning after
> > syscall_set_arguments() starts being used in kernel/ptrace.c later in
> > the series.
> > 
> >   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- allmodconfig kernel/ptrace.o
> >   In file included from include/linux/string.h:392,
> >                    from include/linux/bitmap.h:13,
> >                    from include/linux/cpumask.h:12,
> >                    from arch/riscv/include/asm/processor.h:55,
> >                    from include/linux/sched.h:13,
> >                    from kernel/ptrace.c:13:
> >   In function 'fortify_memcpy_chk',
> >       inlined from 'syscall_set_arguments.isra' at arch/riscv/include/asm/syscall.h:82:2:
> >   include/linux/fortify-string.h:571:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >     571 |                         __write_overflow_field(p_size_field, size);
> >         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   cc1: all warnings being treated as errors
> 
> I certainly tested the series on riscv64, but somehow I haven't seen this
> compiler diagnostics before.

Maybe CONFIG_FORTIFY_SOURCE was not enabled? This comes from the
kernel's fortified memcpy checking function, fortify_memcpy_chk(), not
necessarily the compiler itself.

> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index a5281cdf2b10..70ec19dc8506 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -78,8 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >                                          const unsigned long *args)
> >  {
> >         regs->orig_a0 = args[0];
> > -       args++;
> > -       memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > +       regs->a1 = args[1];
> > +       regs->a2 = args[2];
> > +       regs->a3 = args[3];
> > +       regs->a4 = args[4];
> > +       regs->a5 = args[5];
> >  }
> 
> I don't mind eliminating the memcpy() altogether, but
> I'd like to note that syscall_set_arguments() is an exact mirror
> of syscall_get_arguments(), so if the intentional overwrite in
> syscall_set_arguments() is not acceptable, then the intentional
> overread in syscall_get_arguments() shouldn't be acceptable either.

Yes, I noticed the symmetry too but I was only looking at it from the
overwrite perspective, not the overread one. That reminded me to double
check what fortify_memcpy_chk() actually checks for and I remembered
that the overread version of this warning is hidden under W=1 (I guess
because it happens more frequently).

  $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- W=1 allmodconfig kernel/ptrace.o
  In file included from include/linux/string.h:392,
                   from include/linux/bitmap.h:13,
                   from include/linux/cpumask.h:12,
                   from arch/riscv/include/asm/processor.h:55,
                   from include/linux/sched.h:13,
                   from kernel/ptrace.c:13:
  In function 'fortify_memcpy_chk',
      inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:73:2:
  include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
    580 |                         __read_overflow2_field(q_size_field, size);
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

So memcpy() should indeed be eliminated from both, which obviously
clears up the warnings.

Cheers,
Nathan

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index a5281cdf2b10..34313387f977 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 unsigned long *args)
 {
 	args[0] = regs->orig_a0;
-	args++;
-	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
+	args[1] = regs->a1;
+	args[2] = regs->a2;
+	args[3] = regs->a3;
+	args[4] = regs->a4;
+	args[5] = regs->a5;
 }
 
 static inline void syscall_set_arguments(struct task_struct *task,
@@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
 					 const unsigned long *args)
 {
 	regs->orig_a0 = args[0];
-	args++;
-	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
+	regs->a1 = args[1];
+	regs->a2 = args[2];
+	regs->a3 = args[3];
+	regs->a4 = args[4];
+	regs->a5 = args[5];
 }
 
 static inline int syscall_get_arch(struct task_struct *task)
