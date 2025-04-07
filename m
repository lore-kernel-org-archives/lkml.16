Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059C229B01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014642; cv=none; b=boUo6JzABKv4T1bMbqBGe/zWfOK+xeVXO7OUqSoXaJUbh0iURFrZibLFfA1T/Fzu40oG8QZTh4Wez+OBkv69VTAx/495sIbmd3Gjjeqd93TGeRTjeIQAgnpe74vRmI32fxqUjTDP9XKjRNVV20Sc/i+gJCAxySin8+y1hiZrF8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014642; c=relaxed/simple;
	bh=YedqApFs9Mzk8MwED0+PRJywxkX8koX/jA8u9odis6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMIc9ipmDc6lHWePGK+dbBRwXchGKSnYPrrBo6K7U1yvUfkLBh/aJeT+Xbwu1p68Tx8+2GM3xyxTOe6LiswF5aiVtrBKhv1RAroc4N7sFNJRc+J8MFY4LzFqZ+hXK2Xu5+qHfj+dyyXdn8n/4bm9t57QOWeaYH91xEiB/5E8fFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJNfFphV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJNfFphV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C210C4AF09
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744014640;
	bh=YedqApFs9Mzk8MwED0+PRJywxkX8koX/jA8u9odis6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PJNfFphVFoOyE6l/eFj8R48vm03aaxOdhIy54SZf2rrYDVXRfmax63oFKWh36dvgr
	 ezV4K7ewTFHcEgmm3dwkslCdvjfrC0G6EkeXm/6+v7vZ9eGwgaInrKG273IGyBs289
	 dp4nBrsLPXdAuY+NUILg+YTSsE3RqknXc3LydRJCfy8wtB61AzWElLcjXfLEJrTKwb
	 E0FyjCr+N1rDtzjgI5po4kSF6S0SUZC6n/8nM2TTeFg9dw3c6JCzECfmt9dj41YKDu
	 kvnEVVtK5DSUKbH5vxyFqSoMJ3LvYLnSqS6MJVGql3GFDGt3i0dPrJMJ9b+xPEvgqi
	 k4p/NhkR7Em5Q==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a04so44315501fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:30:40 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz6zomdx8iQF052eCATExxQkorf5WKb8RGkzBmWqX4zxFU10WhF
	zII1Ceq5MYSsLjCyX+aFqT8embfQE/HGAC6cQKFP5YGuVH5dc3FJ9v2eqjKpDqiRzlJbzmYJqOt
	nRGPNHr64p51PuU+zcGkoqWOYzfE=
X-Google-Smtp-Source: AGHT+IGj8q4XDQeedYmTz/yhoazUHBw0uie0pxuBF2nBxv6ED2EafzVJyfz/t0NxMAvQluOGeVahj6FfZkJZVAcK4ys=
X-Received: by 2002:a2e:bd87:0:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-30f16590f13mr29248501fa.28.1744014638633; Mon, 07 Apr 2025
 01:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401133416.1436741-11-ardb+git@google.com>
 <174396438105.31282.2243827952440371468.tip-bot2@tip-bot2> <6eb78989-efa6-4558-9637-9467560265cd@amd.com>
In-Reply-To: <6eb78989-efa6-4558-9637-9467560265cd@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 7 Apr 2025 11:30:25 +0300
X-Gmail-Original-Message-ID: <CAMj1kXHTQSfsr8m86zGZCp1cvp9_kOpOe6P1MjjjSh72HZ8PSg@mail.gmail.com>
X-Gm-Features: ATxdqUGnRAGyPcmUz6gYIu9prXmDmAkS0EZFD7PahsTaIc-3Zo7Licb3GRygd7E
Message-ID: <CAMj1kXHTQSfsr8m86zGZCp1cvp9_kOpOe6P1MjjjSh72HZ8PSg@mail.gmail.com>
Subject: Re: [tip: x86/boot] x86/boot: Move the EFI mixed mode startup code
 back under arch/x86, into startup/
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 10:38, Aithal, Srikanth <sraithal@amd.com> wrote:
>
> Hello,
>
> This commit breaks the build of next-20250407. The kernel config is
> attached here.
>
> Build error:
>
> arch/x86/boot/startup/efi-mixed.o: warning: objtool:
> efi32_stub_entry+0x0: unannotated intra-function call
> make[3]: *** [scripts/Makefile.build:335:
> arch/x86/boot/startup/efi-mixed.o] Error 255
> make[3]: *** Deleting file 'arch/x86/boot/startup/efi-mixed.o'
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:461: arch/x86/boot/startup] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/home/VT_BUILD/linux/Makefile:2006: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
>

Apologies for the breakage.

Does it help to add the following to arch/x86/boot/startup/Makefile:

OBJECT_FILES_NON_STANDARD := y

?

>
> Thanks,
> Srikanth Aithal <sraithal@amd.com>
>
>
> On 4/7/2025 12:03 AM, tip-bot2 for Ard Biesheuvel wrote:
> > The following commit has been merged into the x86/boot branch of tip:
> >
> > Commit-ID:     4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
> > Gitweb:        https://git.kernel.org/tip/4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
> > Author:        Ard Biesheuvel <ardb@kernel.org>
> > AuthorDate:    Tue, 01 Apr 2025 15:34:20 +02:00
> > Committer:     Ingo Molnar <mingo@kernel.org>
> > CommitterDate: Sun, 06 Apr 2025 20:15:14 +02:00
> >
> > x86/boot: Move the EFI mixed mode startup code back under arch/x86, into startup/
> >
> > Linus expressed a strong preference for arch-specific asm code (i.e.,
> > virtually all of it) to reside under arch/ rather than anywhere else.
> >
> > So move the EFI mixed mode startup code back, and put it under
> > arch/x86/boot/startup/ where all shared x86 startup code is going to
> > live.
> >
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > Cc: David Woodhouse <dwmw@amazon.co.uk>
> > Cc: H. Peter Anvin <hpa@zytor.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Link: https://lore.kernel.org/r/20250401133416.1436741-11-ardb+git@google.com
> > ---
> >   arch/x86/boot/startup/Makefile           |   3 +-
> >   arch/x86/boot/startup/efi-mixed.S        | 253 ++++++++++++++++++++++-
> >   drivers/firmware/efi/libstub/Makefile    |   1 +-
> >   drivers/firmware/efi/libstub/x86-mixed.S | 253 +----------------------
> >   4 files changed, 256 insertions(+), 254 deletions(-)
> >   create mode 100644 arch/x86/boot/startup/efi-mixed.S
> >   delete mode 100644 drivers/firmware/efi/libstub/x86-mixed.S
> >
> > diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
> > index 03519ef..73946a3 100644
> > --- a/arch/x86/boot/startup/Makefile
> > +++ b/arch/x86/boot/startup/Makefile
> > @@ -1,3 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >
> > +KBUILD_AFLAGS                += -D__DISABLE_EXPORTS
> > +
> >   lib-$(CONFIG_X86_64)                += la57toggle.o
> > +lib-$(CONFIG_EFI_MIXED)              += efi-mixed.o
> > diff --git a/arch/x86/boot/startup/efi-mixed.S b/arch/x86/boot/startup/efi-mixed.S
> > new file mode 100644
> > index 0000000..e04ed99
> > --- /dev/null
> > +++ b/arch/x86/boot/startup/efi-mixed.S
> > @@ -0,0 +1,253 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
> > + *
> > + * Early support for invoking 32-bit EFI services from a 64-bit kernel.
> > + *
> > + * Because this thunking occurs before ExitBootServices() we have to
> > + * restore the firmware's 32-bit GDT and IDT before we make EFI service
> > + * calls.
> > + *
> > + * On the plus side, we don't have to worry about mangling 64-bit
> > + * addresses into 32-bits because we're executing with an identity
> > + * mapped pagetable and haven't transitioned to 64-bit virtual addresses
> > + * yet.
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/desc_defs.h>
> > +#include <asm/msr.h>
> > +#include <asm/page_types.h>
> > +#include <asm/pgtable_types.h>
> > +#include <asm/processor-flags.h>
> > +#include <asm/segment.h>
> > +
> > +     .text
> > +     .code32
> > +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> > +SYM_FUNC_START(efi32_stub_entry)
> > +     call    1f
> > +1:   popl    %ecx
> > +
> > +     /* Clear BSS */
> > +     xorl    %eax, %eax
> > +     leal    (_bss - 1b)(%ecx), %edi
> > +     leal    (_ebss - 1b)(%ecx), %ecx
> > +     subl    %edi, %ecx
> > +     shrl    $2, %ecx
> > +     cld
> > +     rep     stosl
> > +
> > +     add     $0x4, %esp              /* Discard return address */
> > +     movl    8(%esp), %ebx           /* struct boot_params pointer */
> > +     jmp     efi32_startup
> > +SYM_FUNC_END(efi32_stub_entry)
> > +#endif
> > +
> > +/*
> > + * Called using a far call from __efi64_thunk() below, using the x86_64 SysV
> > + * ABI (except for R8/R9 which are inaccessible to 32-bit code - EAX/EBX are
> > + * used instead).  EBP+16 points to the arguments passed via the stack.
> > + *
> > + * The first argument (EDI) is a pointer to the boot service or protocol, to
> > + * which the remaining arguments are passed, each truncated to 32 bits.
> > + */
> > +SYM_FUNC_START_LOCAL(efi_enter32)
> > +     /*
> > +      * Convert x86-64 SysV ABI params to i386 ABI
> > +      */
> > +     pushl   32(%ebp)        /* Up to 3 args passed via the stack */
> > +     pushl   24(%ebp)
> > +     pushl   16(%ebp)
> > +     pushl   %ebx            /* R9 */
> > +     pushl   %eax            /* R8 */
> > +     pushl   %ecx
> > +     pushl   %edx
> > +     pushl   %esi
> > +
> > +     /* Disable paging */
> > +     movl    %cr0, %eax
> > +     btrl    $X86_CR0_PG_BIT, %eax
> > +     movl    %eax, %cr0
> > +
> > +     /* Disable long mode via EFER */
> > +     movl    $MSR_EFER, %ecx
> > +     rdmsr
> > +     btrl    $_EFER_LME, %eax
> > +     wrmsr
> > +
> > +     call    *%edi
> > +
> > +     /* We must preserve return value */
> > +     movl    %eax, %edi
> > +
> > +     call    efi32_enable_long_mode
> > +
> > +     addl    $32, %esp
> > +     movl    %edi, %eax
> > +     lret
> > +SYM_FUNC_END(efi_enter32)
> > +
> > +     .code64
> > +SYM_FUNC_START(__efi64_thunk)
> > +     push    %rbp
> > +     movl    %esp, %ebp
> > +     push    %rbx
> > +
> > +     /* Move args #5 and #6 into 32-bit accessible registers */
> > +     movl    %r8d, %eax
> > +     movl    %r9d, %ebx
> > +
> > +     lcalll  *efi32_call(%rip)
> > +
> > +     pop     %rbx
> > +     pop     %rbp
> > +     RET
> > +SYM_FUNC_END(__efi64_thunk)
> > +
> > +     .code32
> > +SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
> > +     movl    %cr4, %eax
> > +     btsl    $(X86_CR4_PAE_BIT), %eax
> > +     movl    %eax, %cr4
> > +
> > +     movl    $MSR_EFER, %ecx
> > +     rdmsr
> > +     btsl    $_EFER_LME, %eax
> > +     wrmsr
> > +
> > +     /* Disable interrupts - the firmware's IDT does not work in long mode */
> > +     cli
> > +
> > +     /* Enable paging */
> > +     movl    %cr0, %eax
> > +     btsl    $X86_CR0_PG_BIT, %eax
> > +     movl    %eax, %cr0
> > +     ret
> > +SYM_FUNC_END(efi32_enable_long_mode)
> > +
> > +/*
> > + * This is the common EFI stub entry point for mixed mode. It sets up the GDT
> > + * and page tables needed for 64-bit execution, after which it calls the
> > + * common 64-bit EFI entrypoint efi_stub_entry().
> > + *
> > + * Arguments:        0(%esp) image handle
> > + *           4(%esp) EFI system table pointer
> > + *           %ebx    struct boot_params pointer (or NULL)
> > + *
> > + * Since this is the point of no return for ordinary execution, no registers
> > + * are considered live except for the function parameters. [Note that the EFI
> > + * stub may still exit and return to the firmware using the Exit() EFI boot
> > + * service.]
> > + */
> > +SYM_FUNC_START_LOCAL(efi32_startup)
> > +     movl    %esp, %ebp
> > +
> > +     subl    $8, %esp
> > +     sgdtl   (%esp)                  /* Save GDT descriptor to the stack */
> > +     movl    2(%esp), %esi           /* Existing GDT pointer */
> > +     movzwl  (%esp), %ecx            /* Existing GDT limit */
> > +     inc     %ecx                    /* Existing GDT size */
> > +     andl    $~7, %ecx               /* Ensure size is multiple of 8 */
> > +
> > +     subl    %ecx, %esp              /* Allocate new GDT */
> > +     andl    $~15, %esp              /* Realign the stack */
> > +     movl    %esp, %edi              /* New GDT address */
> > +     leal    7(%ecx), %eax           /* New GDT limit */
> > +     pushw   %cx                     /* Push 64-bit CS (for LJMP below) */
> > +     pushl   %edi                    /* Push new GDT address */
> > +     pushw   %ax                     /* Push new GDT limit */
> > +
> > +     /* Copy GDT to the stack and add a 64-bit code segment at the end */
> > +     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, (%edi,%ecx)
> > +     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
> > +     shrl    $2, %ecx
> > +     cld
> > +     rep     movsl                   /* Copy the firmware GDT */
> > +     lgdtl   (%esp)                  /* Switch to the new GDT */
> > +
> > +     call    1f
> > +1:   pop     %edi
> > +
> > +     /* Record mixed mode entry */
> > +     movb    $0x0, (efi_is64 - 1b)(%edi)
> > +
> > +     /* Set up indirect far call to re-enter 32-bit mode */
> > +     leal    (efi32_call - 1b)(%edi), %eax
> > +     addl    %eax, (%eax)
> > +     movw    %cs, 4(%eax)
> > +
> > +     /* Disable paging */
> > +     movl    %cr0, %eax
> > +     btrl    $X86_CR0_PG_BIT, %eax
> > +     movl    %eax, %cr0
> > +
> > +     /* Set up 1:1 mapping */
> > +     leal    (pte - 1b)(%edi), %eax
> > +     movl    $_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
> > +     leal    (_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
> > +2:   movl    %ecx, (%eax)
> > +     addl    $8, %eax
> > +     addl    $PMD_SIZE, %ecx
> > +     jnc     2b
> > +
> > +     movl    $PAGE_SIZE, %ecx
> > +     .irpc   l, 0123
> > +     movl    %edx, \l * 8(%eax)
> > +     addl    %ecx, %edx
> > +     .endr
> > +     addl    %ecx, %eax
> > +     movl    %edx, (%eax)
> > +     movl    %eax, %cr3
> > +
> > +     call    efi32_enable_long_mode
> > +
> > +     /* Set up far jump to 64-bit mode (CS is already on the stack) */
> > +     leal    (efi_stub_entry - 1b)(%edi), %eax
> > +     movl    %eax, 2(%esp)
> > +
> > +     movl    0(%ebp), %edi
> > +     movl    4(%ebp), %esi
> > +     movl    %ebx, %edx
> > +     ljmpl   *2(%esp)
> > +SYM_FUNC_END(efi32_startup)
> > +
> > +/*
> > + * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
> > + *                          efi_system_table_32_t *sys_table)
> > + */
> > +SYM_FUNC_START(efi32_pe_entry)
> > +     pushl   %ebx                            // save callee-save registers
> > +
> > +     /* Check whether the CPU supports long mode */
> > +     movl    $0x80000001, %eax               // assume extended info support
> > +     cpuid
> > +     btl     $29, %edx                       // check long mode bit
> > +     jnc     1f
> > +     leal    8(%esp), %esp                   // preserve stack alignment
> > +     xor     %ebx, %ebx                      // no struct boot_params pointer
> > +     jmp     efi32_startup                   // only ESP and EBX remain live
> > +1:   movl    $0x80000003, %eax               // EFI_UNSUPPORTED
> > +     popl    %ebx
> > +     RET
> > +SYM_FUNC_END(efi32_pe_entry)
> > +
> > +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> > +     .org    efi32_stub_entry + 0x200
> > +     .code64
> > +SYM_FUNC_START_NOALIGN(efi64_stub_entry)
> > +     jmp     efi_handover_entry
> > +SYM_FUNC_END(efi64_stub_entry)
> > +#endif
> > +
> > +     .data
> > +     .balign 8
> > +SYM_DATA_START_LOCAL(efi32_call)
> > +     .long   efi_enter32 - .
> > +     .word   0x0
> > +SYM_DATA_END(efi32_call)
> > +SYM_DATA(efi_is64, .byte 1)
> > +
> > +     .bss
> > +     .balign PAGE_SIZE
> > +SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)
> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > index d23a1b9..2f17339 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -85,7 +85,6 @@ lib-$(CONFIG_EFI_GENERIC_STUB)      += efi-stub.o string.o intrinsics.o systable.o \
> >   lib-$(CONFIG_ARM)           += arm32-stub.o
> >   lib-$(CONFIG_ARM64)         += kaslr.o arm64.o arm64-stub.o smbios.o
> >   lib-$(CONFIG_X86)           += x86-stub.o smbios.o
> > -lib-$(CONFIG_EFI_MIXED)              += x86-mixed.o
> >   lib-$(CONFIG_X86_64)                += x86-5lvl.o
> >   lib-$(CONFIG_RISCV)         += kaslr.o riscv.o riscv-stub.o
> >   lib-$(CONFIG_LOONGARCH)             += loongarch.o loongarch-stub.o
> > diff --git a/drivers/firmware/efi/libstub/x86-mixed.S b/drivers/firmware/efi/libstub/x86-mixed.S
> > deleted file mode 100644
> > index e04ed99..0000000
> > --- a/drivers/firmware/efi/libstub/x86-mixed.S
> > +++ /dev/null
> > @@ -1,253 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -/*
> > - * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
> > - *
> > - * Early support for invoking 32-bit EFI services from a 64-bit kernel.
> > - *
> > - * Because this thunking occurs before ExitBootServices() we have to
> > - * restore the firmware's 32-bit GDT and IDT before we make EFI service
> > - * calls.
> > - *
> > - * On the plus side, we don't have to worry about mangling 64-bit
> > - * addresses into 32-bits because we're executing with an identity
> > - * mapped pagetable and haven't transitioned to 64-bit virtual addresses
> > - * yet.
> > - */
> > -
> > -#include <linux/linkage.h>
> > -#include <asm/desc_defs.h>
> > -#include <asm/msr.h>
> > -#include <asm/page_types.h>
> > -#include <asm/pgtable_types.h>
> > -#include <asm/processor-flags.h>
> > -#include <asm/segment.h>
> > -
> > -     .text
> > -     .code32
> > -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> > -SYM_FUNC_START(efi32_stub_entry)
> > -     call    1f
> > -1:   popl    %ecx
> > -
> > -     /* Clear BSS */
> > -     xorl    %eax, %eax
> > -     leal    (_bss - 1b)(%ecx), %edi
> > -     leal    (_ebss - 1b)(%ecx), %ecx
> > -     subl    %edi, %ecx
> > -     shrl    $2, %ecx
> > -     cld
> > -     rep     stosl
> > -
> > -     add     $0x4, %esp              /* Discard return address */
> > -     movl    8(%esp), %ebx           /* struct boot_params pointer */
> > -     jmp     efi32_startup
> > -SYM_FUNC_END(efi32_stub_entry)
> > -#endif
> > -
> > -/*
> > - * Called using a far call from __efi64_thunk() below, using the x86_64 SysV
> > - * ABI (except for R8/R9 which are inaccessible to 32-bit code - EAX/EBX are
> > - * used instead).  EBP+16 points to the arguments passed via the stack.
> > - *
> > - * The first argument (EDI) is a pointer to the boot service or protocol, to
> > - * which the remaining arguments are passed, each truncated to 32 bits.
> > - */
> > -SYM_FUNC_START_LOCAL(efi_enter32)
> > -     /*
> > -      * Convert x86-64 SysV ABI params to i386 ABI
> > -      */
> > -     pushl   32(%ebp)        /* Up to 3 args passed via the stack */
> > -     pushl   24(%ebp)
> > -     pushl   16(%ebp)
> > -     pushl   %ebx            /* R9 */
> > -     pushl   %eax            /* R8 */
> > -     pushl   %ecx
> > -     pushl   %edx
> > -     pushl   %esi
> > -
> > -     /* Disable paging */
> > -     movl    %cr0, %eax
> > -     btrl    $X86_CR0_PG_BIT, %eax
> > -     movl    %eax, %cr0
> > -
> > -     /* Disable long mode via EFER */
> > -     movl    $MSR_EFER, %ecx
> > -     rdmsr
> > -     btrl    $_EFER_LME, %eax
> > -     wrmsr
> > -
> > -     call    *%edi
> > -
> > -     /* We must preserve return value */
> > -     movl    %eax, %edi
> > -
> > -     call    efi32_enable_long_mode
> > -
> > -     addl    $32, %esp
> > -     movl    %edi, %eax
> > -     lret
> > -SYM_FUNC_END(efi_enter32)
> > -
> > -     .code64
> > -SYM_FUNC_START(__efi64_thunk)
> > -     push    %rbp
> > -     movl    %esp, %ebp
> > -     push    %rbx
> > -
> > -     /* Move args #5 and #6 into 32-bit accessible registers */
> > -     movl    %r8d, %eax
> > -     movl    %r9d, %ebx
> > -
> > -     lcalll  *efi32_call(%rip)
> > -
> > -     pop     %rbx
> > -     pop     %rbp
> > -     RET
> > -SYM_FUNC_END(__efi64_thunk)
> > -
> > -     .code32
> > -SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
> > -     movl    %cr4, %eax
> > -     btsl    $(X86_CR4_PAE_BIT), %eax
> > -     movl    %eax, %cr4
> > -
> > -     movl    $MSR_EFER, %ecx
> > -     rdmsr
> > -     btsl    $_EFER_LME, %eax
> > -     wrmsr
> > -
> > -     /* Disable interrupts - the firmware's IDT does not work in long mode */
> > -     cli
> > -
> > -     /* Enable paging */
> > -     movl    %cr0, %eax
> > -     btsl    $X86_CR0_PG_BIT, %eax
> > -     movl    %eax, %cr0
> > -     ret
> > -SYM_FUNC_END(efi32_enable_long_mode)
> > -
> > -/*
> > - * This is the common EFI stub entry point for mixed mode. It sets up the GDT
> > - * and page tables needed for 64-bit execution, after which it calls the
> > - * common 64-bit EFI entrypoint efi_stub_entry().
> > - *
> > - * Arguments:        0(%esp) image handle
> > - *           4(%esp) EFI system table pointer
> > - *           %ebx    struct boot_params pointer (or NULL)
> > - *
> > - * Since this is the point of no return for ordinary execution, no registers
> > - * are considered live except for the function parameters. [Note that the EFI
> > - * stub may still exit and return to the firmware using the Exit() EFI boot
> > - * service.]
> > - */
> > -SYM_FUNC_START_LOCAL(efi32_startup)
> > -     movl    %esp, %ebp
> > -
> > -     subl    $8, %esp
> > -     sgdtl   (%esp)                  /* Save GDT descriptor to the stack */
> > -     movl    2(%esp), %esi           /* Existing GDT pointer */
> > -     movzwl  (%esp), %ecx            /* Existing GDT limit */
> > -     inc     %ecx                    /* Existing GDT size */
> > -     andl    $~7, %ecx               /* Ensure size is multiple of 8 */
> > -
> > -     subl    %ecx, %esp              /* Allocate new GDT */
> > -     andl    $~15, %esp              /* Realign the stack */
> > -     movl    %esp, %edi              /* New GDT address */
> > -     leal    7(%ecx), %eax           /* New GDT limit */
> > -     pushw   %cx                     /* Push 64-bit CS (for LJMP below) */
> > -     pushl   %edi                    /* Push new GDT address */
> > -     pushw   %ax                     /* Push new GDT limit */
> > -
> > -     /* Copy GDT to the stack and add a 64-bit code segment at the end */
> > -     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, (%edi,%ecx)
> > -     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
> > -     shrl    $2, %ecx
> > -     cld
> > -     rep     movsl                   /* Copy the firmware GDT */
> > -     lgdtl   (%esp)                  /* Switch to the new GDT */
> > -
> > -     call    1f
> > -1:   pop     %edi
> > -
> > -     /* Record mixed mode entry */
> > -     movb    $0x0, (efi_is64 - 1b)(%edi)
> > -
> > -     /* Set up indirect far call to re-enter 32-bit mode */
> > -     leal    (efi32_call - 1b)(%edi), %eax
> > -     addl    %eax, (%eax)
> > -     movw    %cs, 4(%eax)
> > -
> > -     /* Disable paging */
> > -     movl    %cr0, %eax
> > -     btrl    $X86_CR0_PG_BIT, %eax
> > -     movl    %eax, %cr0
> > -
> > -     /* Set up 1:1 mapping */
> > -     leal    (pte - 1b)(%edi), %eax
> > -     movl    $_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
> > -     leal    (_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
> > -2:   movl    %ecx, (%eax)
> > -     addl    $8, %eax
> > -     addl    $PMD_SIZE, %ecx
> > -     jnc     2b
> > -
> > -     movl    $PAGE_SIZE, %ecx
> > -     .irpc   l, 0123
> > -     movl    %edx, \l * 8(%eax)
> > -     addl    %ecx, %edx
> > -     .endr
> > -     addl    %ecx, %eax
> > -     movl    %edx, (%eax)
> > -     movl    %eax, %cr3
> > -
> > -     call    efi32_enable_long_mode
> > -
> > -     /* Set up far jump to 64-bit mode (CS is already on the stack) */
> > -     leal    (efi_stub_entry - 1b)(%edi), %eax
> > -     movl    %eax, 2(%esp)
> > -
> > -     movl    0(%ebp), %edi
> > -     movl    4(%ebp), %esi
> > -     movl    %ebx, %edx
> > -     ljmpl   *2(%esp)
> > -SYM_FUNC_END(efi32_startup)
> > -
> > -/*
> > - * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
> > - *                          efi_system_table_32_t *sys_table)
> > - */
> > -SYM_FUNC_START(efi32_pe_entry)
> > -     pushl   %ebx                            // save callee-save registers
> > -
> > -     /* Check whether the CPU supports long mode */
> > -     movl    $0x80000001, %eax               // assume extended info support
> > -     cpuid
> > -     btl     $29, %edx                       // check long mode bit
> > -     jnc     1f
> > -     leal    8(%esp), %esp                   // preserve stack alignment
> > -     xor     %ebx, %ebx                      // no struct boot_params pointer
> > -     jmp     efi32_startup                   // only ESP and EBX remain live
> > -1:   movl    $0x80000003, %eax               // EFI_UNSUPPORTED
> > -     popl    %ebx
> > -     RET
> > -SYM_FUNC_END(efi32_pe_entry)
> > -
> > -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> > -     .org    efi32_stub_entry + 0x200
> > -     .code64
> > -SYM_FUNC_START_NOALIGN(efi64_stub_entry)
> > -     jmp     efi_handover_entry
> > -SYM_FUNC_END(efi64_stub_entry)
> > -#endif
> > -
> > -     .data
> > -     .balign 8
> > -SYM_DATA_START_LOCAL(efi32_call)
> > -     .long   efi_enter32 - .
> > -     .word   0x0
> > -SYM_DATA_END(efi32_call)
> > -SYM_DATA(efi_is64, .byte 1)
> > -
> > -     .bss
> > -     .balign PAGE_SIZE
> > -SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)
