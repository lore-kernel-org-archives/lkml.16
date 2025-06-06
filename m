Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D35525B669
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193821; cv=none; b=lGPfSlCFrEKQth1ALLCupMXtoivmUGeJPcoG+YWCdyNZX6kkEMpJcZAm4OzxOoEBOWULilp8oJ9UePTMobNeCrd7PCT31sQgnZRAoA/p9nIeX2MyCrQulqWIRs0LVnPwAO6MJLPbEiiaehFfKfOLRDQUtgbA6XU0ouoBi1bTj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193821; c=relaxed/simple;
	bh=gT+oyS6AitwM2mEsNEMoTcbnOGnn2yfhndv7qj9uwbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeUubCpLf71ZpnZOoWaj+gr7peaxnS5MsozvaakfNMF+SNUJhd80MpysE7//Anr9NBg0OEEdFrqa8r3a156nVtPUKhxcRCIytmep/+TxQomjwUwx2sNhxWtPtqINTyQQ7Qh98jvhKUfpEq7Z17XR8/j1af1DtgEiXjnAXDEiYpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdvX9F/S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdvX9F/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749193814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwMlarzxgWj8wvwi+ADdq/R03FB9UH2tUA+wS2aboGQ=;
	b=BdvX9F/SkikP0sXe2srsHxqIFI5enk3uMueN2r0n3LPxbujOVKHjyPJtzTyk21jqpRWzlv
	X13OIvX1HaKX/U3obK0sTJ5QoQxc9xHbL2ON4ywYALJukQ3+pcZZvMYs3hPOLiCjhUG/X5
	gBhgisDJK1LVR4lwWO10SEJ+/2W3KHM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-uYtdVTPaPyqBP_mY4TqTKQ-1; Fri,
 06 Jun 2025 03:10:09 -0400
X-MC-Unique: uYtdVTPaPyqBP_mY4TqTKQ-1
X-Mimecast-MFC-AGG-ID: uYtdVTPaPyqBP_mY4TqTKQ_1749193808
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD9C019560A3;
	Fri,  6 Jun 2025 07:10:07 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F20018003FD;
	Fri,  6 Jun 2025 07:10:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
Date: Fri,  6 Jun 2025 09:09:52 +0200
Message-ID: <20250606070952.498274-3-thuth@redhat.com>
In-Reply-To: <20250606070952.498274-1-thuth@redhat.com>
References: <20250606070952.498274-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize on
the __ASSEMBLER__ macro that is provided by the compilers now.

This originally was a completely mechanical patch (done with a
simple "sed -i" statement), with some manual fixups during
rebasing of the patch later.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/riscv/include/asm/alternative-macros.h   | 12 ++++++------
 arch/riscv/include/asm/alternative.h          |  2 +-
 arch/riscv/include/asm/asm-extable.h          |  6 +++---
 arch/riscv/include/asm/asm.h                  | 10 +++++-----
 arch/riscv/include/asm/assembler.h            |  2 +-
 arch/riscv/include/asm/barrier.h              |  4 ++--
 arch/riscv/include/asm/cache.h                |  4 ++--
 arch/riscv/include/asm/cpu_ops_sbi.h          |  2 +-
 arch/riscv/include/asm/csr.h                  |  4 ++--
 arch/riscv/include/asm/current.h              |  4 ++--
 arch/riscv/include/asm/errata_list.h          |  6 +++---
 arch/riscv/include/asm/ftrace.h               |  6 +++---
 arch/riscv/include/asm/gpr-num.h              |  6 +++---
 arch/riscv/include/asm/image.h                |  4 ++--
 arch/riscv/include/asm/insn-def.h             |  8 ++++----
 arch/riscv/include/asm/jump_label.h           |  4 ++--
 arch/riscv/include/asm/kasan.h                |  2 +-
 arch/riscv/include/asm/kgdb.h                 |  4 ++--
 arch/riscv/include/asm/mmu.h                  |  4 ++--
 arch/riscv/include/asm/page.h                 |  4 ++--
 arch/riscv/include/asm/pgtable.h              |  4 ++--
 arch/riscv/include/asm/processor.h            |  4 ++--
 arch/riscv/include/asm/ptrace.h               |  4 ++--
 arch/riscv/include/asm/scs.h                  |  4 ++--
 arch/riscv/include/asm/set_memory.h           |  4 ++--
 arch/riscv/include/asm/thread_info.h          |  4 ++--
 arch/riscv/include/asm/vdso.h                 |  4 ++--
 arch/riscv/include/asm/vdso/getrandom.h       |  4 ++--
 arch/riscv/include/asm/vdso/gettimeofday.h    |  4 ++--
 arch/riscv/include/asm/vdso/processor.h       |  4 ++--
 arch/riscv/include/asm/vdso/vsyscall.h        |  4 ++--
 tools/arch/riscv/include/asm/csr.h            |  6 +++---
 tools/arch/riscv/include/asm/vdso/processor.h |  4 ++--
 33 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 231d777d936c2..9619bd5c8ebaa 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -4,7 +4,7 @@
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 .macro ALT_ENTRY oldptr newptr vendor_id patch_id new_len
 	.4byte \oldptr - .
@@ -53,7 +53,7 @@
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
 
-#else /* !__ASSEMBLY__ */
+#else /* !__ASSEMBLER__ */
 
 #include <asm/asm.h>
 #include <linux/stringify.h>
@@ -98,7 +98,7 @@
 	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, CONFIG_k)	\
 	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
@@ -109,7 +109,7 @@
 				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 .macro ALTERNATIVE_CFG old_c
 	\old_c
@@ -118,12 +118,12 @@
 #define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
 #define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
 
-#else /* !__ASSEMBLY__ */
+#else /* !__ASSEMBLER__ */
 
 #define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
 #define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
 #define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 3c2b59b250179..0e95539ba451b 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -8,7 +8,7 @@
 
 #include <asm/alternative-macros.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
 
diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 0c8bfd54fc4e0..37d425d7a7629 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -10,7 +10,7 @@
 
 #ifdef CONFIG_MMU
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
 	.pushsection	__ex_table, "a";		\
@@ -25,7 +25,7 @@
 	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
 	.endm
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 #include <linux/bits.h>
 #include <linux/stringify.h>
@@ -77,7 +77,7 @@
 			    EX_DATA_REG(ADDR, addr)				\
 			  ")")
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #else /* CONFIG_MMU */
 	#define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)
diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index a8a2af6dfe9d2..7634c4897b564 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_RISCV_ASM_H
 #define _ASM_RISCV_ASM_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define __ASM_STR(x)	x
 #else
 #define __ASM_STR(x)	#x
@@ -30,7 +30,7 @@
 #define SRLI		__REG_SEL(srliw, srli)
 
 #if __SIZEOF_POINTER__ == 8
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define RISCV_PTR		.dword
 #define RISCV_SZPTR		8
 #define RISCV_LGPTR		3
@@ -40,7 +40,7 @@
 #define RISCV_LGPTR		"3"
 #endif
 #elif __SIZEOF_POINTER__ == 4
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define RISCV_PTR		.word
 #define RISCV_SZPTR		4
 #define RISCV_LGPTR		2
@@ -69,7 +69,7 @@
 #error "Unexpected __SIZEOF_SHORT__"
 #endif
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #include <asm/asm-offsets.h>
 
 /* Common assembly source macros */
@@ -194,6 +194,6 @@
 #define ASM_NOKPROBE(name)
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_ASM_H */
diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
index 44b1457d3e956..16931712beab6 100644
--- a/arch/riscv/include/asm/assembler.h
+++ b/arch/riscv/include/asm/assembler.h
@@ -5,7 +5,7 @@
  * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #error "Only include this from assembly code"
 #endif
 
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index b8c5726d86acb..700ba3f922cb5 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -10,7 +10,7 @@
 #ifndef _ASM_RISCV_BARRIER_H
 #define _ASM_RISCV_BARRIER_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/cmpxchg.h>
 #include <asm/fence.h>
 
@@ -82,6 +82,6 @@ do {									\
 
 #include <asm-generic/barrier.h>
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_BARRIER_H */
diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
index 570e9d8acad1e..eb42b739d1328 100644
--- a/arch/riscv/include/asm/cache.h
+++ b/arch/riscv/include/asm/cache.h
@@ -24,7 +24,7 @@
 #define ARCH_SLAB_MINALIGN	16
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern int dma_cache_alignment;
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
@@ -35,6 +35,6 @@ static inline int dma_get_cache_alignment(void)
 }
 #endif
 
-#endif	/* __ASSEMBLY__ */
+#endif	/* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_CACHE_H */
diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
index d6e4665b31954..776fa55fbaa45 100644
--- a/arch/riscv/include/asm/cpu_ops_sbi.h
+++ b/arch/riscv/include/asm/cpu_ops_sbi.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_CPU_OPS_SBI_H
 #define __ASM_CPU_OPS_SBI_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/threads.h>
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e377059..4a37a98398ad3 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -513,7 +513,7 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define csr_swap(csr, val)					\
 ({								\
@@ -575,6 +575,6 @@
 			      : "memory");			\
 })
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_CSR_H */
diff --git a/arch/riscv/include/asm/current.h b/arch/riscv/include/asm/current.h
index 21774d868c65b..ba5aa72aff631 100644
--- a/arch/riscv/include/asm/current.h
+++ b/arch/riscv/include/asm/current.h
@@ -13,7 +13,7 @@
 #include <linux/bug.h>
 #include <linux/compiler.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct task_struct;
 
@@ -35,6 +35,6 @@ static __always_inline struct task_struct *get_current(void)
 
 register unsigned long current_stack_pointer __asm__("sp");
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_CURRENT_H */
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 6e426ed7919a4..e17d6c98b3bfd 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -29,7 +29,7 @@
 #define	ERRATA_THEAD_NUMBER 3
 #endif
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #define ALT_INSN_FAULT(x)						\
 ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),			\
@@ -42,7 +42,7 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
 	    __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),	\
 	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
 	    CONFIG_ERRATA_SIFIVE_CIP_453)
-#else /* !__ASSEMBLY__ */
+#else /* !__ASSEMBLER__ */
 
 #define ALT_SFENCE_VMA_ASID(asid)					\
 asm(ALTERNATIVE("sfence.vma x0, %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
@@ -123,6 +123,6 @@ asm volatile(ALTERNATIVE(						\
 #define THEAD_C9XX_RV_IRQ_PMU			17
 #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 22ebea3c2b26c..e5026cd8f022f 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -13,7 +13,7 @@
 #endif
 
 #define ARCH_SUPPORTS_FTRACE_OPS 1
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern void *return_address(unsigned int level);
 
@@ -112,7 +112,7 @@ do {									\
 #define MCOUNT_JALR_SIZE	4
 #define MCOUNT_NOP4_SIZE	4
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct dyn_ftrace;
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
@@ -235,7 +235,7 @@ static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs, unsi
 
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
diff --git a/arch/riscv/include/asm/gpr-num.h b/arch/riscv/include/asm/gpr-num.h
index efeb5edf8a3af..b499cf8327341 100644
--- a/arch/riscv/include/asm/gpr-num.h
+++ b/arch/riscv/include/asm/gpr-num.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_GPR_NUM_H
 #define __ASM_GPR_NUM_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
 	.equ	.L__gpr_num_x\num, \num
@@ -41,7 +41,7 @@
 	.equ	.L__gpr_num_t5,		30
 	.equ	.L__gpr_num_t6,		31
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 #define __DEFINE_ASM_GPR_NUMS					\
 "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31\n" \
@@ -80,6 +80,6 @@
 "	.equ	.L__gpr_num_t5,		30\n"			\
 "	.equ	.L__gpr_num_t6,		31\n"
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_GPR_NUM_H */
diff --git a/arch/riscv/include/asm/image.h b/arch/riscv/include/asm/image.h
index 8927a6ea1127e..899254966e858 100644
--- a/arch/riscv/include/asm/image.h
+++ b/arch/riscv/include/asm/image.h
@@ -29,7 +29,7 @@
 #define RISCV_HEADER_VERSION (RISCV_HEADER_VERSION_MAJOR << 16 | \
 			      RISCV_HEADER_VERSION_MINOR)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #define riscv_image_flag_field(flags, field)\
 			       (((flags) >> field##_SHIFT) & field##_MASK)
 /**
@@ -63,5 +63,5 @@ struct riscv_image_header {
 	u32 magic2;
 	u32 res3;
 };
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* _ASM_RISCV_IMAGE_H */
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index d5adbaec1d010..c9cfcea52cbbc 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -25,7 +25,7 @@
 #define INSN_S_SIMM5_SHIFT		 7
 #define INSN_S_OPCODE_SHIFT		 0
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #ifdef CONFIG_AS_HAS_INSN
 
@@ -77,7 +77,7 @@
 #define __INSN_I(...)	insn_i __VA_ARGS__
 #define __INSN_S(...)	insn_s __VA_ARGS__
 
-#else /* ! __ASSEMBLY__ */
+#else /* ! __ASSEMBLER__ */
 
 #ifdef CONFIG_AS_HAS_INSN
 
@@ -153,7 +153,7 @@
 
 #endif
 
-#endif /* ! __ASSEMBLY__ */
+#endif /* ! __ASSEMBLER__ */
 
 #define INSN_R(opcode, func3, func7, rd, rs1, rs2)		\
 	__INSN_R(RV_##opcode, RV_##func3, RV_##func7,		\
@@ -263,7 +263,7 @@
 
 #define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #define nop()           __asm__ __volatile__ ("nop")
 #define __nops(n)       ".rept  " #n "\nnop\n.endr\n"
 #define nops(n)         __asm__ __volatile__ (__nops(n))
diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 87a71cc6d146c..3ab5f2e3212be 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_JUMP_LABEL_H
 #define __ASM_JUMP_LABEL_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 #include <asm/asm.h>
@@ -66,5 +66,5 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 	return true;
 }
 
-#endif  /* __ASSEMBLY__ */
+#endif  /* __ASSEMBLER__ */
 #endif	/* __ASM_JUMP_LABEL_H */
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index e6a0071bdb56c..60af6691f9032 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -4,7 +4,7 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * The following comment was copied from arm64:
diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index cc11c4544cffd..7559d728c5ff9 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -17,12 +17,12 @@
 #define BREAK_INSTR_SIZE	4
 #endif
 
-#ifndef	__ASSEMBLY__
+#ifndef	__ASSEMBLER__
 
 void arch_kgdb_breakpoint(void);
 extern unsigned long kgdb_compiled_break;
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #define DBG_REG_ZERO "zero"
 #define DBG_REG_RA "ra"
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 1cc90465d75b1..cf8e6eac77d52 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -7,7 +7,7 @@
 #ifndef _ASM_RISCV_MMU_H
 #define _ASM_RISCV_MMU_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 typedef struct {
 #ifndef CONFIG_MMU
@@ -40,6 +40,6 @@ typedef struct {
 
 void __meminit create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa, phys_addr_t sz,
 				  pgprot_t prot);
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_MMU_H */
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 572a141ddecdb..ffe213ad65a4e 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -41,7 +41,7 @@
 #define PAGE_OFFSET		((unsigned long)phys_ram_base)
 #endif /* CONFIG_MMU */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifdef CONFIG_RISCV_ISA_ZICBOZ
 void clear_page(void *page);
@@ -199,7 +199,7 @@ static __always_inline void *pfn_to_kaddr(unsigned long pfn)
 	return __va(pfn << PAGE_SHIFT);
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #define virt_addr_valid(vaddr)	({						\
 	unsigned long _addr = (unsigned long)vaddr;				\
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a11816bbf9e7f..0f4f6e69a661e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -111,7 +111,7 @@
 
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/page.h>
 #include <asm/tlbflush.h>
@@ -1141,6 +1141,6 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
 	set_pgd(pgdp, pgd); \
 })
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_PGTABLE_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 24d3af4d3807e..da5426122d280 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -54,7 +54,7 @@
 #define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct task_struct;
 struct pt_regs;
@@ -215,6 +215,6 @@ long get_tagged_addr_ctrl(struct task_struct *task);
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index a7dc0e3307579..addc8188152f7 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -10,7 +10,7 @@
 #include <asm/csr.h>
 #include <linux/compiler.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct pt_regs {
 	unsigned long epc;
@@ -180,6 +180,6 @@ static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
 	return !(regs->status & SR_PIE);
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 0e45db78b24bf..ab7714aa93bdc 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_SCS_H
 #define _ASM_SCS_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #include <asm/asm-offsets.h>
 
 #ifdef CONFIG_SHADOW_CALL_STACK
@@ -49,6 +49,6 @@
 .endm
 
 #endif /* CONFIG_SHADOW_CALL_STACK */
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_SCS_H */
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index ea263d3683ef6..87389e93325a3 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_RISCV_SET_MEMORY_H
 #define _ASM_RISCV_SET_MEMORY_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /*
  * Functions to change memory attributes.
  */
@@ -45,7 +45,7 @@ int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_XIP_KERNEL)
 #ifdef CONFIG_64BIT
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index f5916a70879a8..c33d8b7dd4880 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -37,7 +37,7 @@
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/processor.h>
 #include <asm/csr.h>
@@ -98,7 +98,7 @@ struct thread_info {
 void arch_release_task_struct(struct task_struct *tsk);
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /*
  * thread information flags
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index c130d8100232c..f80357fe24d11 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -16,7 +16,7 @@
 
 #define __VDSO_PAGES    4
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <generated/vdso-offsets.h>
 
 #define VDSO_SYMBOL(base, name)							\
@@ -34,7 +34,7 @@ extern char compat_vdso_start[], compat_vdso_end[];
 
 extern char vdso_start[], vdso_end[];
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/asm/vdso/getrandom.h
index 8dc92441702a9..267fc159d60f7 100644
--- a/arch/riscv/include/asm/vdso/getrandom.h
+++ b/arch/riscv/include/asm/vdso/getrandom.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_VDSO_GETRANDOM_H
 #define __ASM_VDSO_GETRANDOM_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/unistd.h>
 
@@ -25,6 +25,6 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
 	return ret;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_GETRANDOM_H */
diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h b/arch/riscv/include/asm/vdso/gettimeofday.h
index 29164f84f93ce..9ec08fa04d35a 100644
--- a/arch/riscv/include/asm/vdso/gettimeofday.h
+++ b/arch/riscv/include/asm/vdso/gettimeofday.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_VDSO_GETTIMEOFDAY_H
 #define __ASM_VDSO_GETTIMEOFDAY_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/barrier.h>
 #include <asm/unistd.h>
@@ -79,6 +79,6 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return csr_read(CSR_TIME);
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index 8f383f05a290f..98fb44336c055 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_VDSO_PROCESSOR_H
 #define __ASM_VDSO_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/barrier.h>
 #include <asm/insn-def.h>
@@ -23,6 +23,6 @@ static inline void cpu_relax(void)
 	barrier();
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/vdso/vsyscall.h
index 1140b54b4bc82..558eb9dfda520 100644
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ b/arch/riscv/include/asm/vdso/vsyscall.h
@@ -2,13 +2,13 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <vdso/datapage.h>
 
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
index 0dfc09254f99a..56d7367ee344c 100644
--- a/tools/arch/riscv/include/asm/csr.h
+++ b/tools/arch/riscv/include/asm/csr.h
@@ -468,13 +468,13 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define __ASM_STR(x)    x
 #else
 #define __ASM_STR(x)    #x
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define csr_swap(csr, val)					\
 ({								\
@@ -536,6 +536,6 @@
 			      : "memory");			\
 })
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_RISCV_CSR_H */
diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
index 662aca0398481..0665b117f30f2 100644
--- a/tools/arch/riscv/include/asm/vdso/processor.h
+++ b/tools/arch/riscv/include/asm/vdso/processor.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_VDSO_PROCESSOR_H
 #define __ASM_VDSO_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm-generic/barrier.h>
 
@@ -27,6 +27,6 @@ static inline void cpu_relax(void)
 	barrier();
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_PROCESSOR_H */
-- 
2.49.0

