Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6A1A3BD7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308867; cv=none; b=MUjzq7GLbznp2UcbYWO5WSTP2kMX7oj9d3/95rjcWi37p9QW5vTQKPz+DmZM203j/06EnklN68s5BYHUg8fPW8M+sb024hAQGeL90nc7vNHuMZE72xP2hJD6yw2cVqhQcm1N2pY8sVheWU7JkP+i9IBjdVkEjf39tVFGTALzYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308867; c=relaxed/simple;
	bh=wn3mPPR27RYVkuHWJkv09h07bHWGcncI5FZuMl88yoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+w60d3cHgQ/NM50BdEULCk99wcYMsqZscpDKvwCfnl6DiVYDcepMUYfTzsvftFRxGZ1ti5fwIa41ET+MekoSLBSe/6tQQk+CWLJJT3bOrTRtvI2ts20UPCDPBp223IwqFBN6RPBV4NFfYuuZo5rwFbMdkqNxCEy4V6hee03Oa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEwQefQH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEwQefQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F7CC4CEDD;
	Thu, 10 Apr 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744308866;
	bh=wn3mPPR27RYVkuHWJkv09h07bHWGcncI5FZuMl88yoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEwQefQHMvoaGAPG5Jq1tyUxVrHdrtUKIqxCAYJU99HmpQSU677N0ZPBiJXv3NIyf
	 VGb9OtOZXSVbihGsbbvNzX8WPzcPPx36xbK8MWa6P8r25IJzavqyF7efUwnJxi0pRY
	 H46RO/VR4zQF36e10Juec6x5qb/Cv+lfCOUKG9/0Sj+Cl0kqBGuB9oWXCJ8I29Q0QW
	 IpCCdbf2X/j1vNCXC4HwCWg54ojPhXBbzE/vsRWtqUEz4jJ7n9HFVi0RCqdlQKWEIG
	 ibbxP5/bF7AOobnmz1uJiR0J5jQNEQcUuicn8gx5vOLd1Q+K47znTeUUX9/HGfH5Tr
	 tmSt0AkwI3nvA==
Date: Thu, 10 Apr 2025 11:14:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250410181422.GA3431770@ax162>
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

Hi Andrew,

Can you please fold the diff at the end of my message into
syscallh-add-syscall_set_arguments.patch? It sounds like Palmer will
apply the same diff to syscall_get_arguments():
https://lore.kernel.org/mhng-cf999eb1-59c4-4784-8c01-44b1e2482a50@palmer-ri-x1c9a/

Thanks!
Nathan

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
> 
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
> 
>  static inline int syscall_get_arch(struct task_struct *task)
