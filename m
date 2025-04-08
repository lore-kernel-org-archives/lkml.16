Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D97C255230
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744147896; cv=none; b=J2IOQ88vHyN8CcUDn/Ha3BSVBtf224szP+VG8Nvf2IDuGFDPsmMduQ0NYAZaHjLAfuojccHJ/m59Bdp/zu0SHbaG1iDR6tUDwFjJ2COp8u9a+TdF+Rt3RtqMAT0UJu9p1vEl8ZdlfdE8fmXC2+a78OjB0rcHhBzmgTSMRhrtqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744147896; c=relaxed/simple;
	bh=i2/vDRlfpffmboNAdB2RhvhuQdFfbEnJ2xP4l9EWlSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyqJFRJX/eeDYIt4oTBRUwSrs2mNLwZY1y/e2F17hUgmzcCNE6jPUAzmwO1+7JzOCJTiHikyIxFjBNYjWswVUiTFIlwGAVyshMnF/OGrDKtx+6AOWn5oA2MnrpOEOY5pL4MUTknj7pVCr/wstrM6GZF3gaFd5yFdngUstepmRQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1dMFUgG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1dMFUgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C870AC4CEE5;
	Tue,  8 Apr 2025 21:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744147895;
	bh=i2/vDRlfpffmboNAdB2RhvhuQdFfbEnJ2xP4l9EWlSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1dMFUgGdq/9nZWq7JNPoKm9uhI5lljtTBhOBN00mZDn87cNF1hV4Fx0r8xcmPtWl
	 lb7G7wNwXCqp9ir9jAL6yv2tIjAZpXcHmug2HLMs2OqOdd0ZUu3XTt1c963H5KQRlN
	 O6kuizVdKHQj5RnqjHuZaXnzv+uiQ0l5mKg4WRQ281Ega4WYXMZlO4Qrr2RJsUGyBf
	 4wJGT3JzOA17jz0s8na0eJXrj2TW75RWaOk84jinKtkyxqd5ZyE0FIRyfaVkszetJy
	 2vipdhZQ3qRNaJT3Hzfv8RoFkJCS6EFZI/+ZHGQiRf+fBfGW7q3UgmSvEVDwUEIB7Z
	 +hVN5oA2SKW7w==
Date: Tue, 8 Apr 2025 14:31:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250408213131.GA2872426@ax162>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303112009.GC24170@strace.io>

Hi Dmitry,

[dropping majority of folks since this seems irrelevant to them]

On Mon, Mar 03, 2025 at 01:20:09PM +0200, Dmitry V. Levin wrote:
> This function is going to be needed on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.
> 
> This partially reverts commit 7962c2eddbfe ("arch: remove unused
> function syscall_set_arguments()") by reusing some of old
> syscall_set_arguments() implementations.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Helge Deller <deller@gmx.de> # parisc
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk> # mips
...
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce..8d389ba995c8 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -66,6 +66,15 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->orig_a0 = args[0];
> +	args++;
> +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +}

This upsets the compiletime fortify checks, as I see a warning after
syscall_set_arguments() starts being used in kernel/ptrace.c later in
the series.

  $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- allmodconfig kernel/ptrace.o
  In file included from include/linux/string.h:392,
                   from include/linux/bitmap.h:13,
                   from include/linux/cpumask.h:12,
                   from arch/riscv/include/asm/processor.h:55,
                   from include/linux/sched.h:13,
                   from kernel/ptrace.c:13:
  In function 'fortify_memcpy_chk',
      inlined from 'syscall_set_arguments.isra' at arch/riscv/include/asm/syscall.h:82:2:
  include/linux/fortify-string.h:571:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
    571 |                         __write_overflow_field(p_size_field, size);
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

The compiler knows the size of the destination and the size to be copied
so it knows there will be an (intentional) overwrite here.
struct_group() would normally work but I think this structure already
has a struct_group() around some of the members that would be needed. I
build tested eliminating the memcpy() altogether, which would appear to
work, but I am not sure if there is a better solution, hence just the
report.

Cheers,
Nathan

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index a5281cdf2b10..70ec19dc8506 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -78,8 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
                                         const unsigned long *args)
 {
        regs->orig_a0 = args[0];
-       args++;
-       memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
+       regs->a1 = args[1];
+       regs->a2 = args[2];
+       regs->a3 = args[3];
+       regs->a4 = args[4];
+       regs->a5 = args[5];
 }

 static inline int syscall_get_arch(struct task_struct *task)
