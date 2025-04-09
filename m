Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3F51DE8A8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180823; cv=none; b=SLac67e5e/hEzZ4wXnkOFsa3Y18cBVOKFlqT2cl6LTvI1zuk7+x4Ov9wLtvhNla9Hp4fqB46H02gAK/mtCFWsAmiaDc+D3fvczyLb0OiEu1AG2cvp/5CZ8UJcdcgtdpj0RrCznVGsPyDYvW7q9b1PX0eSGYB5UG7+wuSgbdkvvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180823; c=relaxed/simple;
	bh=7YXqZkra420AM/seBf1ejW/4HUlOaPX4UlzKxGysi3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2P5UxJavFmN+zkU/ueGnYXathYgbfUMTwEQsTGzZKrJImoyh+QdtftNIi4OalJmwiNQPFPv0zXPPJsdFtkxSvU9gFbGHqk9gvTIR1vY0I4Vv2Q3C2GR1RwAe83FzFU1OyRxFokMtXLaTHzInjwliR6DP9V7NUrOVZUprzUjbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 319C872C8CC;
	Wed,  9 Apr 2025 09:40:18 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 0B9697CCB3A; Wed,  9 Apr 2025 09:40:18 +0300 (IDT)
Date: Wed, 9 Apr 2025 09:40:18 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409064017.GA30836@strace.io>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
 <20250409003803.GA2876360@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409003803.GA2876360@ax162>

On Tue, Apr 08, 2025 at 05:38:03PM -0700, Nathan Chancellor wrote:
> On Wed, Apr 09, 2025 at 01:36:11AM +0300, Dmitry V. Levin wrote:
> > On Tue, Apr 08, 2025 at 02:31:31PM -0700, Nathan Chancellor wrote:
> > > On Mon, Mar 03, 2025 at 01:20:09PM +0200, Dmitry V. Levin wrote:
> > > > +static inline void syscall_set_arguments(struct task_struct *task,
> > > > +					 struct pt_regs *regs,
> > > > +					 const unsigned long *args)
> > > > +{
> > > > +	regs->orig_a0 = args[0];
> > > > +	args++;
> > > > +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > > +}
> > > 
> > > This upsets the compiletime fortify checks, as I see a warning after
> > > syscall_set_arguments() starts being used in kernel/ptrace.c later in
> > > the series.
> > > 
> > >   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- allmodconfig kernel/ptrace.o
> > >   In file included from include/linux/string.h:392,
> > >                    from include/linux/bitmap.h:13,
> > >                    from include/linux/cpumask.h:12,
> > >                    from arch/riscv/include/asm/processor.h:55,
> > >                    from include/linux/sched.h:13,
> > >                    from kernel/ptrace.c:13:
> > >   In function 'fortify_memcpy_chk',
> > >       inlined from 'syscall_set_arguments.isra' at arch/riscv/include/asm/syscall.h:82:2:
> > >   include/linux/fortify-string.h:571:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> > >     571 |                         __write_overflow_field(p_size_field, size);
> > >         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   cc1: all warnings being treated as errors
> > 
> > I certainly tested the series on riscv64, but somehow I haven't seen this
> > compiler diagnostics before.
> 
> Maybe CONFIG_FORTIFY_SOURCE was not enabled? This comes from the
> kernel's fortified memcpy checking function, fortify_memcpy_chk(), not
> necessarily the compiler itself.
> 
> > > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > > index a5281cdf2b10..70ec19dc8506 100644
> > > --- a/arch/riscv/include/asm/syscall.h
> > > +++ b/arch/riscv/include/asm/syscall.h
> > > @@ -78,8 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> > >                                          const unsigned long *args)
> > >  {
> > >         regs->orig_a0 = args[0];
> > > -       args++;
> > > -       memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > +       regs->a1 = args[1];
> > > +       regs->a2 = args[2];
> > > +       regs->a3 = args[3];
> > > +       regs->a4 = args[4];
> > > +       regs->a5 = args[5];
> > >  }
> > 
> > I don't mind eliminating the memcpy() altogether, but
> > I'd like to note that syscall_set_arguments() is an exact mirror
> > of syscall_get_arguments(), so if the intentional overwrite in
> > syscall_set_arguments() is not acceptable, then the intentional
> > overread in syscall_get_arguments() shouldn't be acceptable either.
> 
> Yes, I noticed the symmetry too but I was only looking at it from the
> overwrite perspective, not the overread one. That reminded me to double
> check what fortify_memcpy_chk() actually checks for and I remembered
> that the overread version of this warning is hidden under W=1 (I guess
> because it happens more frequently).
> 
>   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- W=1 allmodconfig kernel/ptrace.o
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:73:2:
>   include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     580 |                         __read_overflow2_field(q_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> So memcpy() should indeed be eliminated from both, which obviously
> clears up the warnings.
> 
> Cheers,
> Nathan
> 
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index a5281cdf2b10..34313387f977 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 unsigned long *args)
>  {
>  	args[0] = regs->orig_a0;
> -	args++;
> -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> +	args[1] = regs->a1;
> +	args[2] = regs->a2;
> +	args[3] = regs->a3;
> +	args[4] = regs->a4;
> +	args[5] = regs->a5;
>  }
>  
>  static inline void syscall_set_arguments(struct task_struct *task,
> @@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
>  					 const unsigned long *args)
>  {
>  	regs->orig_a0 = args[0];
> -	args++;
> -	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +	regs->a1 = args[1];
> +	regs->a2 = args[2];
> +	regs->a3 = args[3];
> +	regs->a4 = args[4];
> +	regs->a5 = args[5];
>  }
>  
>  static inline int syscall_get_arch(struct task_struct *task)

Looks good, thanks.  How do we proceed from this point?


-- 
ldv
