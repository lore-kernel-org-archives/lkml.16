Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BCC2505D2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152218; cv=none; b=QD7OY68nfyErO4QX1ABp9dxvnyCuNTOlCCyNdq/UqcArgsIsrviO3j148olfk5THVh562t2245KbaUu1v2v2ArRRrgkwF1/5jo+8ZZULdMudLVT97s7Y18/NnSDD1VutRGh+MHtbJi/qTwBAF25JzKMPc/B4aFtuTZbwTfnuMek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152218; c=relaxed/simple;
	bh=AmYdHqfVjCD657SNQEqPNHqdMzSO27jBYYDSCQbGIPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrSZTlct7k8gct4REB3kWe730Wv3YVrOixedQe+sGXb+JcgTlSs0bqzKTWWNEYJxv8V5QOwNNhttiYdEvOQ70JmPTr303p0F+9wmHK/1gKROJ4kSdUL0Pj6o+aiU/nTvBfzucZa/w63HceYXOWcIrQ1d/ytu6roMQ7Lva5d20yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 0DEF672C8CC;
	Wed,  9 Apr 2025 01:36:12 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 0053E7CCB3A; Wed,  9 Apr 2025 01:36:11 +0300 (IDT)
Date: Wed, 9 Apr 2025 01:36:11 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250408223611.GA26876@strace.io>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408213131.GA2872426@ax162>

Hi Nathan,

On Tue, Apr 08, 2025 at 02:31:31PM -0700, Nathan Chancellor wrote:
> Hi Dmitry,
> 
> [dropping majority of folks since this seems irrelevant to them]
> 
> On Mon, Mar 03, 2025 at 01:20:09PM +0200, Dmitry V. Levin wrote:
> > This function is going to be needed on all HAVE_ARCH_TRACEHOOK
> > architectures to implement PTRACE_SET_SYSCALL_INFO API.
> > 
> > This partially reverts commit 7962c2eddbfe ("arch: remove unused
> > function syscall_set_arguments()") by reusing some of old
> > syscall_set_arguments() implementations.
> > 
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > Acked-by: Helge Deller <deller@gmx.de> # parisc
> > Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk> # mips
> ...
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index 121fff429dce..8d389ba995c8 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -66,6 +66,15 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> >  }
> >  
> > +static inline void syscall_set_arguments(struct task_struct *task,
> > +					 struct pt_regs *regs,
> > +					 const unsigned long *args)
> > +{
> > +	regs->orig_a0 = args[0];
> > +	args++;
> > +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > +}
> 
> This upsets the compiletime fortify checks, as I see a warning after
> syscall_set_arguments() starts being used in kernel/ptrace.c later in
> the series.
> 
>   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- allmodconfig kernel/ptrace.o
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_set_arguments.isra' at arch/riscv/include/asm/syscall.h:82:2:
>   include/linux/fortify-string.h:571:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     571 |                         __write_overflow_field(p_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors

I certainly tested the series on riscv64, but somehow I haven't seen this
compiler diagnostics before.

> The compiler knows the size of the destination and the size to be copied
> so it knows there will be an (intentional) overwrite here.
> struct_group() would normally work but I think this structure already
> has a struct_group() around some of the members that would be needed. I
> build tested eliminating the memcpy() altogether, which would appear to
> work, but I am not sure if there is a better solution, hence just the
> report.
> 
> Cheers,
> Nathan
> 
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index a5281cdf2b10..70ec19dc8506 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -78,8 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
>                                          const unsigned long *args)
>  {
>         regs->orig_a0 = args[0];
> -       args++;
> -       memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +       regs->a1 = args[1];
> +       regs->a2 = args[2];
> +       regs->a3 = args[3];
> +       regs->a4 = args[4];
> +       regs->a5 = args[5];
>  }

I don't mind eliminating the memcpy() altogether, but
I'd like to note that syscall_set_arguments() is an exact mirror
of syscall_get_arguments(), so if the intentional overwrite in
syscall_set_arguments() is not acceptable, then the intentional
overread in syscall_get_arguments() shouldn't be acceptable either.


-- 
ldv
