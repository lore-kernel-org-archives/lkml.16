Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6814829ACEE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892644; cv=none; b=ss5Fp14H2KcxXvoXu32H/Il2iwGxQ4ao0EJJtAFoFF1w5tWb650kVzinNl1w5HlmLZ/9oEbeufbc5/R+KG1e7ZQvHNyk57gw+GGPYjuJ5r6tR+zUWRaw3nSgBirituBlVahg4vd9r7ol8qIXV64kxx5aysSIWldY5OixQRmdOB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892644; c=relaxed/simple;
	bh=OvbwvHy8NKIk2Ezwx0joZLsA+nIKCuJt511I75yLdvo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=p1wjcgo0LiidIsTfhiioz4imswOuaFT24K+wTbP4q6iZgUQKJBXFatmWFX+v9Ac403OYzUF1lRCoAvI4mDp06ty4HAeAnWe3AZMcns5lYUjklCcI2TZO6dhr2jLLXQbVeNbMgmIBH0KJagM6qj13/QnaWr+zbQfk74FOl4PzM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=G4GjxMA7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="G4GjxMA7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b20fcbaf3aso545665f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751892641; x=1752497441; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft2gGM1xdSh/BYGEm14JWzh26OBrCpmeDTwJtAeavYc=;
        b=G4GjxMA7W+KAnFsfNJfF5p6F+dXfkrsX82jBy+5bgRiKLxwjStK2dHzl5lGHu2qOen
         CkJQWhwRGPXLOLcS/zGXxJGcGozKrgWlLDba7ov0FNLkS4IxIOiAqIUZfqp/KbttHUq7
         nmFR+xcB82XRsLaUH3a036vbv0qCa9cHA5JXLh0onOURy1W/xMESV+shSJfiobzOENbU
         bew3l6b/9fAK+2fjj5dCAoGsqBx4E6tEtwmhGsAINHp1ukjUz0IPKq9wwPbR2gwg3hgb
         ZIEOGg7eH3OmM4cBv0FTxSFudp8wK2jNzDZUnJHFCEmADlArVkJNOS6nLHPtYdBBuk2v
         9NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892641; x=1752497441;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ft2gGM1xdSh/BYGEm14JWzh26OBrCpmeDTwJtAeavYc=;
        b=NGEprXUpVp2quYYaOtgsMsJYhyii0p9Ga9yciP4H3m/NiBgg1I9Le3PgxuDt3rMBI1
         0rc5CL+jBqj5lsMSFZKQOPuBg4XbO9oKSUvS7kJzxsKEDXHkI87LyRG4FzISUaAtLuRN
         B8JLQnjhZBPekeCaDC8BF98ZhZb4YVRYLDQpLZZ7AngkUpDZJ3pRuLZnyw6JOR1F6/sd
         xcXoTPaM1qn40OimBRtuNayWc9yWcz3DrnKdkGJ9RUF13eqLehUkgXw3rZm1Y4Hv2ETY
         4DF63a4IopZuCARTUPyAiy1jHY2xpY08NuTixO3oHxXlvHM8BpZDpKV9Jrb9eHOv2jr3
         X5kg==
X-Forwarded-Encrypted: i=1; AJvYcCXJRniG3e1vtQp1uHl8dWpe+CJSWWpXyJZwcjBX3Ezar4FagYpvtuiGnztW8i41EBev4zc2pRaVvSnMTho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/PAJmYWqajy3jZABRiR+GmYhvopIEMvrx1Y0Uny5iNEzb9FNT
	mic/XH2LcfooRN3LhgLCX4iN1FDWSRl0m4+hvaYiVh/Szu5RWnolJLY1Vxx2NyXt4uk=
X-Gm-Gg: ASbGncv7slcwTm3l/CkRsiungsFHVodMCfSTcqE5uL7V+jp8yTsw9wrazTgtVvq6BPj
	zQ3ZEtZz9r1twYjkHbM6lsvhVZXQkSg7AlSYk1/+H4r/zwXuJZz4rCAl9oIalEtHOx6CRjbl0eg
	al5hP7hxN5uOEFKzRx46JOPMzhHcf7cziDbhFmN0ycJjCFmvo+HPQpFbxnzCgHW3kSqOeV90Q9H
	dum6x8ZBVt0dydiyQH//oQzJeM/7Fbw4I8pxHUcKQtpDRrnP6aS40QNe7kxNYz/Euy7bNr9KwTd
	+9fPZf28XXijLg1/rp3aKz0V1MS3bWSieN6m9rtHr0jZR8t+Zx86LQ1QYuy0Fiy9fUUk
X-Google-Smtp-Source: AGHT+IEe0+QxHUH3lQ2uYaYi9vgxze6Sq1IneFmRKgL0IxDHY9UDkF9+kDTqonNSeqj2Uz7UzM76SQ==
X-Received: by 2002:a05:6000:2086:b0:3a4:eb46:7258 with SMTP id ffacd0b85a97d-3b496617d36mr3681711f8f.15.1751892640390;
        Mon, 07 Jul 2025 05:50:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:df6:4ed7:c6e7:1ee1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285bdf8sm9939855f8f.87.2025.07.07.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 05:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 14:50:39 +0200
Message-Id: <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
Subject: [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, <masahiroy@kernel.org>,
 <nathan@kernel.org>, <nicolas.schier@linux.dev>, <dennis@kernel.org>,
 <tj@kernel.org>, <cl@gentwo.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <andybnac@gmail.com>, <bjorn@rivosinc.com>, <cyrilbur@tenstorrent.com>,
 <rostedt@goodmis.org>, <puranjay@kernel.org>, <ben.dooks@codethink.co.uk>,
 <zhangchunyan@iscas.ac.cn>, <ruanjinjie@huawei.com>, <jszhang@kernel.org>,
 <charlie@rivosinc.com>, <cleger@rivosinc.com>, <antonb@tenstorrent.com>,
 <ajones@ventanamicro.com>, <debug@rivosinc.com>, <haibo1.xu@intel.com>,
 <samuel.holland@sifive.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250704084500.62688-1-cuiyunhui@bytedance.com>

2025-07-04T16:45:00+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> The following data was collected from tests conducted on the
> Spacemit(R) X60 using the fixed register method:
> [...]
> The fixed register method reduced performance by 5.29%.
> The per-CPU offset optimization improved performance by 2.52%.

What is the performance if you use the scratch register?

The patch below is completely unoptimized as I didn't want to shuffle
code around too much, but it could give a rough idea.

Thanks.

---8<---
The scratch register currently denotes the mode before exception, but we
can just use two different exception entry points to provide the same
information, which frees the scratch register for the percpu offset.

The user/kernel entry paths need more through rewrite, because they are
terribly wasteful right now.
---
Applies on top of d7b8f8e20813f0179d8ef519541a3527e7661d3a (v6.16-rc5)

 arch/riscv/include/asm/percpu.h | 13 ++++++++++
 arch/riscv/kernel/entry.S       | 46 ++++++++++++++++++++-------------
 arch/riscv/kernel/head.S        |  7 +----
 arch/riscv/kernel/smpboot.c     |  7 +++++
 arch/riscv/kernel/stacktrace.c  |  4 +--
 5 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percp=
u.h
new file mode 100644
index 000000000000..2c838514e3ea
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+static inline void set_my_cpu_offset(unsigned long off)
+{
+	csr_write(CSR_SCRATCH, off);
+}
+
+#define __my_cpu_offset csr_read(CSR_SCRATCH)
+
+#include <asm-generic/percpu.h>
+
+#endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 75656afa2d6b..e48c553d6779 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -91,18 +91,8 @@
 	REG_L	a0, TASK_TI_A0(tp)
 .endm
=20
-
-SYM_CODE_START(handle_exception)
-	/*
-	 * If coming from userspace, preserve the user thread pointer and load
-	 * the kernel thread pointer.  If we came from the kernel, the scratch
-	 * register will contain 0, and we should continue on the current TP.
-	 */
-	csrrw tp, CSR_SCRATCH, tp
-	bnez tp, .Lsave_context
-
-.Lrestore_kernel_tpsp:
-	csrr tp, CSR_SCRATCH
+SYM_CODE_START(handle_kernel_exception)
+	csrw CSR_SCRATCH, tp
=20
 #ifdef CONFIG_64BIT
 	/*
@@ -126,8 +116,22 @@ SYM_CODE_START(handle_exception)
 	bnez sp, handle_kernel_stack_overflow
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 #endif
+	j handle_exception
+ASM_NOKPROBE(handle_kernel_exception)
+SYM_CODE_END(handle_kernel_exception)
=20
-.Lsave_context:
+SYM_CODE_START(handle_user_exception)
+	/*
+	 * If coming from userspace, preserve the user thread pointer and load
+	 * the kernel thread pointer.
+	 */
+	csrrw tp, CSR_SCRATCH, tp
+	j handle_exception
+
+SYM_CODE_END(handle_user_exception)
+ASM_NOKPROBE(handle_user_exception)
+
+SYM_CODE_START_NOALIGN(handle_exception)
 	REG_S sp, TASK_TI_USER_SP(tp)
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
@@ -158,11 +162,15 @@ SYM_CODE_START(handle_exception)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
=20
-	/*
-	 * Set the scratch register to 0, so that if a recursive exception
-	 * occurs, the exception vector knows it came from the kernel
-	 */
-	csrw CSR_SCRATCH, x0
+	REG_L s0, TASK_TI_CPU(tp)
+	slli s0, s0, 3
+	la s1, __per_cpu_offset
+	add s1, s1, s0
+	REG_L s1, 0(s1)
+
+	csrw CSR_SCRATCH, s1
+	la s1, handle_kernel_exception
+	csrw CSR_TVEC, s1
=20
 	/* Load the global pointer */
 	load_global_pointer
@@ -236,6 +244,8 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 * structures again.
 	 */
 	csrw CSR_SCRATCH, tp
+	la a0, handle_user_exception
+	csrw CSR_TVEC, a0
 1:
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..d8858334af2d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -188,14 +188,9 @@ secondary_start_sbi:
 .align 2
 .Lsetup_trap_vector:
 	/* Set trap vector to exception handler */
-	la a0, handle_exception
+	la a0, handle_kernel_exception
 	csrw CSR_TVEC, a0
=20
-	/*
-	 * Set sup0 scratch register to 0, indicating to exception vector that
-	 * we are presently executing in kernel.
-	 */
-	csrw CSR_SCRATCH, zero
 	ret
=20
 SYM_CODE_END(_start)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 601a321e0f17..2db44b10bedb 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -41,6 +41,11 @@
=20
 static DECLARE_COMPLETION(cpu_running);
=20
+void __init smp_prepare_boot_cpu(void)
+{
+	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
+}
+
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int cpuid;
@@ -225,6 +230,8 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm =3D mm;
=20
+	set_my_cpu_offset(per_cpu_offset(curr_cpuid));
+
 	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
=20
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.=
c
index 3fe9e6edef8f..69b2f390a2d4 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,7 +16,7 @@
=20
 #ifdef CONFIG_FRAME_POINTER
=20
-extern asmlinkage void handle_exception(void);
+extern asmlinkage void handle_kernel_exception(void);
 extern unsigned long ret_from_exception_end;
=20
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
@@ -72,7 +72,7 @@ void notrace walk_stackframe(struct task_struct *task, st=
ruct pt_regs *regs,
 			fp =3D frame->fp;
 			pc =3D ftrace_graph_ret_addr(current, &graph_idx, frame->ra,
 						   &frame->ra);
-			if (pc >=3D (unsigned long)handle_exception &&
+			if (pc >=3D (unsigned long)handle_kernel_exception &&
 			    pc < (unsigned long)&ret_from_exception_end) {
 				if (unlikely(!fn(arg, pc)))
 					break;
