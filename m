Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3391A178395
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727027; cv=none; b=Qxvejpdos4iMllwrf6o9gUAWLOIR4bd7yHXPfU4hAZ/tXSoJyparND9YikaIVfaSYNs+ggDV+JyVViPYk4Sbiisf2CXH2onCLNWjWfRkEeafhDHe8S8IRfpDvYvOjK/QvefeybAVHeGINoaqLpTWxmVr6eKJq2pS99lhdt5arwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727027; c=relaxed/simple;
	bh=aNmL0+H984WKGRSWMsb/StuKFDQU1an6R5Y3td+dyM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fD9tobvjvmaP3ee3nFJDVNvJO8Te5pLdGWote2YmvNLcGvUJDGim9BHCCtDy8IXPXKnBoFBlDkk9tifarJeKDQLijj9REnUM8k28vPk2zouuz9RMkD6PursLF3s0riHwlWwMH8gPUY/DYMLdgnC1rsz23JEMLAN8H3YIZ5AJ98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSji8SUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSji8SUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28F8C4CEDD;
	Tue, 15 Apr 2025 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744727026;
	bh=aNmL0+H984WKGRSWMsb/StuKFDQU1an6R5Y3td+dyM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSji8SUddah2ECmiHhsDW1Z1tVfoNWfzNIZHgFUiVNVbvbTk9Q0Uayjc7cFFOEnQt
	 VGMG6qo8IqXiBe4+0sM4ZrHOtLhJDsrsjR4i3PJXUc4SK0O3XGHm1AiI5dJ3KVIqcR
	 L/14URvPdtJQGO48pz40qtb5a1EQIzJr7tb5q9wSW73vffvrDTB54ExE+tFGwUCLhZ
	 PaL3e4cXLbrXTHychiMS+7/UeJHQgZMoOfaAa/JsBBRcpOElHdUWuY5IQqWEidCIMa
	 EmdhJMJ+BCHekhbEUcIckjiTrfU9XcTgBMJanSRD57jKbkQCoruxZoEK1axd1ovLc8
	 71i0fLMHP4g8g==
Date: Tue, 15 Apr 2025 07:23:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Dmitry V. Levin" <ldv@strace.io>, Kees Cook <kees@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
Message-ID: <20250415142342.GA995325@ax162>
References: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
 <4a0dc950-cda6-4bb4-a4e9-460bc56b5bb1@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a0dc950-cda6-4bb4-a4e9-460bc56b5bb1@ghiti.fr>

On Tue, Apr 15, 2025 at 07:54:04AM +0200, Alexandre Ghiti wrote:
> Hi Nathan,
> 
> On 09/04/2025 23:24, Nathan Chancellor wrote:
> > When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> > because of the memcpy() in syscall_get_arguments():
> > 
> >    In file included from include/linux/string.h:392,
> >                     from include/linux/bitmap.h:13,
> >                     from include/linux/cpumask.h:12,
> >                     from arch/riscv/include/asm/processor.h:55,
> >                     from include/linux/sched.h:13,
> >                     from kernel/ptrace.c:13:
> >    In function 'fortify_memcpy_chk',
> >        inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
> >    include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >      580 |                         __read_overflow2_field(q_size_field, size);
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    cc1: all warnings being treated as errors
> > 
> > The fortified memcpy() routine enforces that the source is not overread
> > and the destination is not overwritten if the size of either field and
> > the size of the copy are known at compile time. The memcpy() in
> > syscall_get_arguments() intentionally overreads from a1 to a5 in
> > 'struct pt_regs' but this is bigger than the size of a1.
> > 
> > Normally, this could be solved by wrapping a1 through a5 with
> > struct_group() but there was already a struct_group() applied to these
> > members in commit bba547810c66 ("riscv: tracing: Fix
> > __write_overflow_field in ftrace_partial_regs()").
> > 
> > Just avoid memcpy() altogether and write the copying of args from regs
> > manually, which clears up the warning at the expense of three extra
> > lines of code.
> > 
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > I omitted a Fixes tag because I think this has always been an overread
> > if I understand correctly but it is only the addition of the checks from
> > commit f68f2ff91512 ("fortify: Detect struct member overflows in
> > memcpy() at compile-time") that it becomes a noticeable issue.
> > 
> > This came out of a discussion from the addition of
> > syscall_set_arguments(), where the same logic causes a more noticeable
> > fortify warning because it happens without W=1, as it is an overwrite:
> > https://lore.kernel.org/20250408213131.GA2872426@ax162/
> > ---
> >   arch/riscv/include/asm/syscall.h | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >   					 unsigned long *args)
> >   {
> >   	args[0] = regs->orig_a0;
> > -	args++;
> > -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> > +	args[1] = regs->a1;
> > +	args[2] = regs->a2;
> > +	args[3] = regs->a3;
> > +	args[4] = regs->a4;
> > +	args[5] = regs->a5;
> >   }
> >   static inline int syscall_get_arch(struct task_struct *task)
> > 
> > ---
> > base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> > change-id: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7
> > 
> > Best regards,
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> IIUC, Andrew took this patch, if that changes, please let me know and I'll
> merge it through the riscv tree.

Thanks, I had Andrew drop it so that it could go via the riscv tree so
please pick it up when you can.

https://lore.kernel.org/20250411211833.E3DD1C4CEE2@smtp.kernel.org/

Cheers,
Nathan
