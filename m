Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173E233D98
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407467; cv=none; b=NiaAPwc7IvaEjeXCotwwcw1DatIhJrhGHFDHsW6s8EilsMv02fVuVTGC2TnRaLuegHC/zvIz5RK2GlhDFngWMOHEKjo+SgNJQbcolIY8GZ6EFz6WOJdLU7Dqu47uH0H64DBXHmg73DOEp4ZGasEFDwMIqN7HpHtGGJOp6LiFjb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407467; c=relaxed/simple;
	bh=EET+Ub2PCmP7Q4lxK8BbW1nyMdsbzr6cy2tkrC92uK4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 MIME-Version:Date; b=oKzFynKGJYGvacXlAuU9Isl1ax4cs0KEJqisWtyz8qI3hvwZjb+NF0687sL9Pm9YdYBiVZEuLKy+TXs5BsNr7RvEDJ5WREcyXq695qp/f+skeY6ZRSYvxuDhql1IyRUK13jL7SAD4OluRkXQq1/bh8CXiCW201ZJ398a7VSCV/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=ejzSGMQx; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="ejzSGMQx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Date:MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Cc:To:From:Subject:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=7jx/91bHphTZFNH/U6DqHakgzRWsMhRo3MBcddPZayU=;
	t=1750407465; x=1751617065; b=ejzSGMQxn+WBszZULZ1tJBOetdf4DZzpeVvKiSgGdCB7JVl
	0UOYD42x+1IpbWDBzFRGVZcNUAo1X0wIB58ywE3JPoMRjHNxI/hUCK4mhcPnOFl5+fnUsRThltRX6
	BcXDR2oljm7GxXq9gPxbQ+3meoQ2iWBb8Z4f+nDP5PF9Popo2JluCbmqU9aeCXF/m/B9jRNYYTHwH
	IqpEhC6E55xKjY0qDlTYMSEMZp44bOWSCtkk8MwD2mlz0Vk9fYW/VelB6fWMCoEAQii336iBCGPaL
	TxjinF/G3H3xRnVI799Sy2C1zMuY1WUl6L2+nADX9DTalyVDVPG3k1AiIlExciJw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1uSWau-00000002Yjk-2ZjM;
	Fri, 20 Jun 2025 09:55:29 +0200
Message-ID: <d1d08a207844b98d0beba96f48beaf73e30c3bd2.camel@sipsolutions.net>
Subject: Re: [PATCH v9 04/13] x86/um: nommu: syscall handling
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Hajime Tazaki <thehajime@gmail.com>, linux-um@lists.infradead.org
Cc: ricarkol@google.com, Liam.Howlett@oracle.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <bc5a2a14d41add7a2a44b12a21d9ccfa68a6baa5.1750294482.git.thehajime@gmail.com> (sfid-20250619_030454_005867_6CC4C80D)
References: <cover.1750294482.git.thehajime@gmail.com>
	 <bc5a2a14d41add7a2a44b12a21d9ccfa68a6baa5.1750294482.git.thehajime@gmail.com>
	 (sfid-20250619_030454_005867_6CC4C80D)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Jun 2025 12:31:53 +0200
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-malware-bazaar: not-scanned

Hi,

On Thu, 2025-06-19 at 10:04 +0900, Hajime Tazaki wrote:
> This commit introduces an entry point of syscall interface for !MMU
> mode. It uses an entry function, __kernel_vsyscall, a kernel-wide global
> symbol accessible from any locations.
>=20
> Although it isn't in the scope of this commit, it can be also exposed
> via vdso image which is directly accessible from userspace. A standard
> library (i.e., libc) can utilize this entry point to implement syscall
> wrapper; we can also use this by hooking syscall for unmodified userspace
> applications/libraries, which will be implemented in the subsequent
> commit.
>=20
> This only supports 64-bit mode of x86 architecture.
>=20
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> Signed-off-by: Ricardo Koller <ricarkol@google.com>
> ---
> =C2=A0arch/x86/um/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++
> =C2=A0arch/x86/um/nommu/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++
> =C2=A0arch/x86/um/nommu/do_syscall_64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 37 ++++++++++
> =C2=A0arch/x86/um/nommu/entry_64.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 91 +++++++++++++++++++++++++
> =C2=A0arch/x86/um/nommu/syscalls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++
> =C2=A0arch/x86/um/shared/sysdep/syscalls_64.h |=C2=A0 6 ++
> =C2=A06 files changed, 162 insertions(+)
> =C2=A0create mode 100644 arch/x86/um/nommu/Makefile
> =C2=A0create mode 100644 arch/x86/um/nommu/do_syscall_64.c
> =C2=A0create mode 100644 arch/x86/um/nommu/entry_64.S
> =C2=A0create mode 100644 arch/x86/um/nommu/syscalls.h
>=20
> diff --git a/arch/x86/um/Makefile b/arch/x86/um/Makefile
> index b42c31cd2390..227af2a987e2 100644
> --- a/arch/x86/um/Makefile
> +++ b/arch/x86/um/Makefile
> @@ -32,6 +32,10 @@ obj-y +=3D syscalls_64.o vdso/
> =C2=A0subarch-y =3D ../lib/csum-partial_64.o ../lib/memcpy_64.o \
> =C2=A0	../lib/memmove_64.o ../lib/memset_64.o
> =C2=A0
> +ifneq ($(CONFIG_MMU),y)
> +obj-y +=3D nommu/
> +endif
> +
> =C2=A0endif
> =C2=A0
> =C2=A0subarch-$(CONFIG_MODULES) +=3D ../kernel/module.o
> diff --git a/arch/x86/um/nommu/Makefile b/arch/x86/um/nommu/Makefile
> new file mode 100644
> index 000000000000..d72c63afffa5
> --- /dev/null
> +++ b/arch/x86/um/nommu/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +ifeq ($(CONFIG_X86_32),y)
> +	BITS :=3D 32
> +else
> +	BITS :=3D 64
> +endif
> +
> +obj-y =3D do_syscall_$(BITS).o entry_$(BITS).o
> diff --git a/arch/x86/um/nommu/do_syscall_64.c b/arch/x86/um/nommu/do_sys=
call_64.c
> new file mode 100644
> index 000000000000..5d0fa83e7fdc
> --- /dev/null
> +++ b/arch/x86/um/nommu/do_syscall_64.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kernel.h>
> +#include <linux/ptrace.h>
> +#include <kern_util.h>
> +#include <sysdep/syscalls.h>
> +#include <os.h>
> +
> +__visible void do_syscall_64(struct pt_regs *regs)
> +{
> +	int syscall;
> +
> +	syscall =3D PT_SYSCALL_NR(regs->regs.gp);
> +	UPT_SYSCALL_NR(&regs->regs) =3D syscall;
> +
> +	pr_debug("syscall(%d) (current=3D%lx) (fn=3D%lx)\n",
> +		 syscall, (unsigned long)current,
> +		 (unsigned long)sys_call_table[syscall]);

You probably want to drop the pr_debug from the syscall path.

> +	if (likely(syscall < NR_syscalls)) {
> +		PT_REGS_SET_SYSCALL_RETURN(regs,
> +				EXECUTE_SYSCALL(syscall, regs));
> +	}
> +
> +	pr_debug("syscall(%d) --> %lx\n", syscall,
> +		regs->regs.gp[HOST_AX]);
> +
> +	PT_REGS_SYSCALL_RET(regs) =3D regs->regs.gp[HOST_AX];
> +
> +	/* execve succeeded */
> +	if (syscall =3D=3D __NR_execve && regs->regs.gp[HOST_AX] =3D=3D 0)
> +		userspace(&current->thread.regs.regs);

That said, this is what I am stumbling over. Why do you need to jump
into userspace() here? It seems odd to me to need a special case in the
syscall path itself.
Aren't there other possibilities to hook/override the kernel task
state?

> +
> +	/* force do_signal() --> is_syscall() */
> +	set_thread_flag(TIF_SIGPENDING);
> +	interrupt_end();

Same here. The MMU UML code seems to also do this, but restricted to
ptrace'd processes? Maybe I am just missing something obvious =E2=80=A6

Benjamin

> +}
> diff --git a/arch/x86/um/nommu/entry_64.S b/arch/x86/um/nommu/entry_64.S
> new file mode 100644
> index 000000000000..e9bfc7b93c84
> --- /dev/null
> +++ b/arch/x86/um/nommu/entry_64.S
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/errno.h>
> +
> +#include <linux/linkage.h>
> +#include <asm/percpu.h>
> +#include <asm/desc.h>
> +
> +#include "../entry/calling.h"
> +
> +#ifdef CONFIG_SMP
> +#error need to stash these variables somewhere else
> +#endif
> +
> +#define UM_GLOBAL_VAR(x) .data; .align 8; .globl x; x:; .long 0
> +
> +UM_GLOBAL_VAR(current_top_of_stack)
> +UM_GLOBAL_VAR(current_ptregs)
> +
> +.code64
> +.section .entry.text, "ax"
> +
> +.align 8
> +#undef ENTRY
> +#define ENTRY(x) .text; .globl x; .type x,%function; x:
> +#undef END
> +#define END(x)=C2=A0=C2=A0 .size x, . - x
> +
> +/*
> + * %rcx has the return address (we set it before entering __kernel_vsysc=
all).
> + *
> + * Registers on entry:
> + * rax=C2=A0 system call number
> + * rcx=C2=A0 return address
> + * rdi=C2=A0 arg0
> + * rsi=C2=A0 arg1
> + * rdx=C2=A0 arg2
> + * r10=C2=A0 arg3
> + * r8=C2=A0=C2=A0 arg4
> + * r9=C2=A0=C2=A0 arg5
> + *
> + * (note: we are allowed to mess with r11: r11 is callee-clobbered
> + * register in C ABI)
> + */
> +ENTRY(__kernel_vsyscall)
> +
> +	movq	%rsp, %r11
> +
> +	/* Point rsp to the top of the ptregs array, so we can
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 just fill i=
t with a bunch of push'es. */
> +	movq	current_ptregs, %rsp
> +
> +	/* 8 bytes * 20 registers (plus 8 for the push) */
> +	addq	$168, %rsp
> +
> +	/* Construct struct pt_regs on stack */
> +	pushq	$0		/* pt_regs->ss (index 20) */
> +	pushq=C2=A0=C2=A0 %r11		/* pt_regs->sp */
> +	pushfq			/* pt_regs->flags */
> +	pushq	$0		/* pt_regs->cs */
> +	pushq	%rcx		/* pt_regs->ip */
> +	pushq	%rax		/* pt_regs->orig_ax */
> +
> +	PUSH_AND_CLEAR_REGS rax=3D$-ENOSYS
> +
> +	mov %rsp, %rdi
> +
> +	/*
> +	 * Switch to current top of stack, so "current->" points
> +	 * to the right task.
> +	 */
> +	movq	current_top_of_stack, %rsp
> +
> +	call	do_syscall_64
> +
> +	movq	current_ptregs, %rsp
> +
> +	POP_REGS
> +
> +	addq	$8, %rsp	/* skip orig_ax */
> +	popq	%rcx		/* pt_regs->ip */
> +	addq	$8, %rsp	/* skip cs */
> +	addq	$8, %rsp	/* skip flags */
> +	popq	%rsp
> +
> +	/*
> +	* not return w/ ret but w/ jmp as the stack is already popped before
> +	* entering __kernel_vsyscall
> +	*/
> +	jmp	*%rcx
> +
> +END(__kernel_vsyscall)
> diff --git a/arch/x86/um/nommu/syscalls.h b/arch/x86/um/nommu/syscalls.h
> new file mode 100644
> index 000000000000..a2433756b1fc
> --- /dev/null
> +++ b/arch/x86/um/nommu/syscalls.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __UM_NOMMU_SYSCALLS_H
> +#define __UM_NOMMU_SYSCALLS_H
> +
> +
> +#define task_top_of_stack(task) \
> +({									\
> +	unsigned long __ptr =3D (unsigned long)task->stack;	\
> +	__ptr +=3D THREAD_SIZE;			\
> +	__ptr;					\
> +})
> +
> +extern long current_top_of_stack;
> +extern long current_ptregs;
> +
> +#endif
> diff --git a/arch/x86/um/shared/sysdep/syscalls_64.h b/arch/x86/um/shared=
/sysdep/syscalls_64.h
> index b6b997225841..ffd80ee3b9dc 100644
> --- a/arch/x86/um/shared/sysdep/syscalls_64.h
> +++ b/arch/x86/um/shared/sysdep/syscalls_64.h
> @@ -25,4 +25,10 @@ extern syscall_handler_t *sys_call_table[];
> =C2=A0extern syscall_handler_t sys_modify_ldt;
> =C2=A0extern syscall_handler_t sys_arch_prctl;
> =C2=A0
> +#ifndef CONFIG_MMU
> +extern void do_syscall_64(struct pt_regs *regs);
> +extern long __kernel_vsyscall(int64_t a0, int64_t a1, int64_t a2, int64_=
t a3,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int64_t a4, int64_t a5, int64_t a6);
> +#endif
> +
> =C2=A0#endif

