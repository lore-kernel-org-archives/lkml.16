Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B64442C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974305; cv=none; b=B0swMLNJmBhQMApaHNKU0HWF1UCNSFJieNE5tkGdlBpExskuCzHOaGDFFA+dj4Yfr8WLLrwxj4guXd5H5dNsTH5SIyLHr/iiK6LC+zY7aF63R+ULp11J9nqQpp8ZGrJ16R4J+2VUr6P/sG2y0EcS1Fg7WzAhPU3Ep3GuI+MYpHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974305; c=relaxed/simple;
	bh=jmFIV0qSNR0d+Hh1rNNJ1YB0nQuwhgkZjz5sXnM72vM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lkCAQ21AbmYrjI/SmfQ8afZkD1aq7FuUhp8F+72Djdz3W8RjboIr91qhIhFVC5COHr9V4MVYF5s3y2n2K+y/6XCuX3JlcN7u+sQb1BfyezH2P7SP/VVRqfHpGkY+EHJjiapgweUqGGUgH+EvsLYXK0pEFuCYOhPJY3rYngjBE48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EaoRCh2U; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EaoRCh2U"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso1798502a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750974299; x=1751579099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSv8Y+Px5oxqi5OrqwYvXAbyxQm2lDW00pM2xXiCpK8=;
        b=EaoRCh2UwZgZYyJxyWfQ0xYo9HHQ2hHO5AejwsnsTOEd3//DdxIGHk50x+449EZ2va
         2o56Fvn65zhfhQeDNcxCVxvQxJmdzWYYf0SUXzBp8+YzStFS7J8gUdTBEYXHxy1VT8v0
         WElQuuEsYWGtODO1R1BkQ3T7Ku/Wz0WOqpbxb0daCM7VelfwubBGOfftXtUmSPZVtK6g
         ufAb4/o6YcPBhYM627SXCIWpnc2WPkwlrJVcNkcawZIU2Alr/pFSGpTqlJQEuyi9QhWy
         JshshG+DhrwcA5ia4Oc2wagtTkupFE+FyFhwn2a2yoEmWZEAG6mGhoOpZgacY10Mfrwy
         VYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974299; x=1751579099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSv8Y+Px5oxqi5OrqwYvXAbyxQm2lDW00pM2xXiCpK8=;
        b=KRJ3Ga0bhAGC+OtUeas/2WCjfQlVzkWimmh320MN/FgW0N61ZliCmyfveOa+g16jyG
         NfgxToM0Cl4TqfUDd+W1lh31dk+O+YiRxebIxyghW9BDpB1NcPe4Ps5+tlnB+hy8HJx9
         V7COQwMWkuyW7qiXd12Oikfscz+ZJJNLnSwgLDJ7BIA9zPmfPc4IA3x6djA4uAoehXAb
         RPCiwjEYppDRuUM8D82xPeLvNNk6hGZ7X8HtYGidKW6uqc8RXqwFpjjEuA7m0tBebPqX
         gXO8FQ/6OhCdWoexgYM7nasGsWvFXvGT95zxAYd1WPBgtm86bhQfURzLBa/p9Xmknynd
         jfAw==
X-Gm-Message-State: AOJu0YysWU83G2/oHjYw9lvZ5m2OWU5sgbTs2bpqwaEIVMw+B94OD6PS
	nw9wXvv72DR+IMkLaVASX50EgbuwSIitRB+RdT3Ytj3dL185ILZXNFv9ak7uKvb/tpVY8uNi2yj
	VSkq6tlk=
X-Gm-Gg: ASbGncvXbXt0BuiQ3wmmnZ/vjjGel2BnU+Fr8eYFkm1X9HIKSJnaTO4I9s7oF3ZCSht
	FXum7NU3rJ492ofPXleUvRRfnQmVyXSjsghanXPdPIGMcB/W/F27EADgFFwwBTwyxlddMU6XHbF
	Ih0/R8nGi0nUBOWZm0xp/8iiqE3S1G/paEBavZ5m5/PVFATsKonAm2kwaXy2Qo0Nb2jy6Qqt5yB
	OJXZHcNk2irRtydJW9GWEHgCERupwZVbqTGwRcjTlirEjOfM3GZcc0v5YX1SlvqcTXHi63UvBVz
	QGwdvQipA9NSbJ2EgifJcPNhJC60db6HkuL9c7wHTAiKSlH7Dudft1QbpTlUdFdQYJb5KmfO6m5
	plVg=
X-Google-Smtp-Source: AGHT+IFiy5e6/4y1eFV+YvUEGHahmgZinDJOFgk030JCyZD7g1g2fcqvRs62GWyAsZRroQu2Up37HA==
X-Received: by 2002:a17:90b:3e8a:b0:311:ff18:b83e with SMTP id 98e67ed59e1d1-318c8feefcemr835440a91.9.1750974299152;
        Thu, 26 Jun 2025 14:44:59 -0700 (PDT)
Received: from fw-ubuntu.hq.rivosinc.com ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14e290dsm621241a91.30.2025.06.26.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:44:58 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vineetg@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>
Subject: [PATCH] RISC-V: avoid using t6/x31 in hand asm
Date: Thu, 26 Jun 2025 14:44:55 -0700
Message-ID: <20250626214455.285086-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is technically NFC as nothing functional changes, except for usage
of different regs in some of the asm code.

This paves the way for using t6 as a global reg for say hoisting percpu
base address (with further compiler toggles suh as -ffixed-t6.

Lightly tested on QEMU: survives boot/hachbench (thx Atish for the
testing).

Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 arch/riscv/kernel/entry.S       | 14 +++----
 arch/riscv/kernel/mcount.S      |  4 +-
 arch/riscv/lib/memcpy.S         | 66 ++++++++++++++++-----------------
 arch/riscv/lib/memmove.S        | 20 +++++-----
 arch/riscv/lib/strncmp.S        |  6 +--
 arch/riscv/lib/uaccess.S        | 24 ++++++------
 arch/riscv/lib/uaccess_vector.S | 12 +++---
 7 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 75656afa2d6b..0b5791feae5f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -285,13 +285,13 @@ ASM_NOKPROBE(ret_from_exception)
 #ifdef CONFIG_VMAP_STACK
 SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	/* we reach here from kernel context, sscratch must be 0 */
-	csrrw x31, CSR_SCRATCH, x31
-	asm_per_cpu sp, overflow_stack, x31
-	li x31, OVERFLOW_STACK_SIZE
-	add sp, sp, x31
-	/* zero out x31 again and restore x31 */
-	xor x31, x31, x31
-	csrrw x31, CSR_SCRATCH, x31
+	csrrw x30, CSR_SCRATCH, x30
+	asm_per_cpu sp, overflow_stack, x30
+	li x30, OVERFLOW_STACK_SIZE
+	add sp, sp, x30
+	/* zero out x30 again and restore x30 */
+	xor x30, x30, x30
+	csrrw x30, CSR_SCRATCH, x30
 
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 
diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index da4a4000e57e..d7e4303a18a4 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -89,8 +89,8 @@ SYM_FUNC_START(_mcount)
 
 	la	t3, ftrace_graph_entry
 	REG_L	t2, 0(t3)
-	la	t6, ftrace_graph_entry_stub
-	bne	t2, t6, .Ldo_ftrace_graph_caller
+	la	t5, ftrace_graph_entry_stub
+	bne	t2, t5, .Ldo_ftrace_graph_caller
 #endif
 	la	t3, ftrace_trace_function
 	REG_L	t5, 0(t3)
diff --git a/arch/riscv/lib/memcpy.S b/arch/riscv/lib/memcpy.S
index 44e009ec5fef..37ebe9f2b355 100644
--- a/arch/riscv/lib/memcpy.S
+++ b/arch/riscv/lib/memcpy.S
@@ -8,13 +8,13 @@
 
 /* void *memcpy(void *, const void *, size_t) */
 SYM_FUNC_START(__memcpy)
-	move t6, a0  /* Preserve return value */
+	move t5, a0  /* Preserve return value */
 
 	/* Defer to byte-oriented copy for small sizes */
 	sltiu a3, a2, 128
 	bnez a3, 4f
 	/* Use word-oriented copy only if low-order bits match */
-	andi a3, t6, SZREG-1
+	andi a3, a0, SZREG-1
 	andi a4, a1, SZREG-1
 	bne a3, a4, 4f
 
@@ -30,8 +30,8 @@ SYM_FUNC_START(__memcpy)
 1:
 	lb a5, 0(a1)
 	addi a1, a1, 1
-	sb a5, 0(t6)
-	addi t6, t6, 1
+	sb a5, 0(t5)
+	addi t5, t5, 1
 	bltu a1, a3, 1b
 	sub a2, a2, a4  /* Update count */
 
@@ -49,31 +49,31 @@ SYM_FUNC_START(__memcpy)
 	REG_L t2, 6*SZREG(a1)
 	REG_L t3, 7*SZREG(a1)
 	REG_L t4, 8*SZREG(a1)
-	REG_L t5, 9*SZREG(a1)
-	REG_S a4,       0(t6)
-	REG_S a5,   SZREG(t6)
-	REG_S a6, 2*SZREG(t6)
-	REG_S a7, 3*SZREG(t6)
-	REG_S t0, 4*SZREG(t6)
-	REG_S t1, 5*SZREG(t6)
-	REG_S t2, 6*SZREG(t6)
-	REG_S t3, 7*SZREG(t6)
-	REG_S t4, 8*SZREG(t6)
-	REG_S t5, 9*SZREG(t6)
-	REG_L a4, 10*SZREG(a1)
-	REG_L a5, 11*SZREG(a1)
-	REG_L a6, 12*SZREG(a1)
-	REG_L a7, 13*SZREG(a1)
-	REG_L t0, 14*SZREG(a1)
-	REG_L t1, 15*SZREG(a1)
+	REG_S a4,       0(t5)
+	REG_S a5,   SZREG(t5)
+	REG_S a6, 2*SZREG(t5)
+	REG_S a7, 3*SZREG(t5)
+	REG_S t0, 4*SZREG(t5)
+	REG_S t1, 5*SZREG(t5)
+	REG_S t2, 6*SZREG(t5)
+	REG_S t3, 7*SZREG(t5)
+	REG_S t4, 8*SZREG(t5)
+	REG_L a4, 9*SZREG(a1)
+	REG_L a5, 10*SZREG(a1)
+	REG_L a6, 11*SZREG(a1)
+	REG_L a7, 12*SZREG(a1)
+	REG_L t0, 13*SZREG(a1)
+	REG_L t1, 14*SZREG(a1)
+	REG_L t2, 15*SZREG(a1)
 	addi a1, a1, 16*SZREG
-	REG_S a4, 10*SZREG(t6)
-	REG_S a5, 11*SZREG(t6)
-	REG_S a6, 12*SZREG(t6)
-	REG_S a7, 13*SZREG(t6)
-	REG_S t0, 14*SZREG(t6)
-	REG_S t1, 15*SZREG(t6)
-	addi t6, t6, 16*SZREG
+	REG_S a4, 9*SZREG(t5)
+	REG_S a5, 10*SZREG(t5)
+	REG_S a6, 11*SZREG(t5)
+	REG_S a7, 12*SZREG(t5)
+	REG_S t0, 13*SZREG(t5)
+	REG_S t1, 14*SZREG(t5)
+	REG_S t2, 15*SZREG(t5)
+	addi t5, t5, 16*SZREG
 	bltu a1, a3, 3b
 	andi a2, a2, (16*SZREG)-1  /* Update count */
 
@@ -83,15 +83,15 @@ SYM_FUNC_START(__memcpy)
 	add a3, a1, a2
 
 	/* Use word-oriented copy if co-aligned to word boundary */
-	or a5, a1, t6
+	or a5, a1, t5
 	or a5, a5, a3
 	andi a5, a5, 3
 	bnez a5, 5f
 7:
 	lw a4, 0(a1)
 	addi a1, a1, 4
-	sw a4, 0(t6)
-	addi t6, t6, 4
+	sw a4, 0(t5)
+	addi t5, t5, 4
 	bltu a1, a3, 7b
 
 	ret
@@ -99,8 +99,8 @@ SYM_FUNC_START(__memcpy)
 5:
 	lb a4, 0(a1)
 	addi a1, a1, 1
-	sb a4, 0(t6)
-	addi t6, t6, 1
+	sb a4, 0(t5)
+	addi t5, t5, 1
 	bltu a1, a3, 5b
 6:
 	ret
diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
index cb3e2e7ef0ba..5fbd84c2cf18 100644
--- a/arch/riscv/lib/memmove.S
+++ b/arch/riscv/lib/memmove.S
@@ -35,7 +35,7 @@ SYM_FUNC_START(__memmove)
 	 *      Forward Copy: t3 - Index counter of dest
 	 *      Reverse Copy: t4 - Index counter of dest
 	 *   Both Copy Modes: t5 - Inclusive first multibyte/aligned of dest
-	 *   Both Copy Modes: t6 - Non-Inclusive last multibyte/aligned of dest
+	 *   Both Copy Modes: a3 - Non-Inclusive last multibyte/aligned of dest
 	 *   Both Copy Modes: t0 - Link / Temporary for load-store
 	 *   Both Copy Modes: t1 - Temporary for load-store
 	 *   Both Copy Modes: t2 - Temporary for load-store
@@ -47,7 +47,7 @@ SYM_FUNC_START(__memmove)
 
 	/*
 	 * Solve for some register values now.
-	 * Byte copy does not need t5 or t6.
+	 * Byte copy does not need t5 or a3.
 	 */
 	mv   t3, a0
 	add  t4, a0, a2
@@ -62,10 +62,10 @@ SYM_FUNC_START(__memmove)
 	beqz t0, .Lbyte_copy
 
 	/*
-	 * Now solve for t5 and t6.
+	 * Now solve for t5 and a3.
 	 */
 	andi t5, t3, -SZREG
-	andi t6, t4, -SZREG
+	andi a3, t4, -SZREG
 	/*
 	 * If dest(Register t3) rounded down to the nearest naturally
 	 * aligned SZREG address, does not equal dest, then add SZREG
@@ -99,7 +99,7 @@ SYM_FUNC_START(__memmove)
 	slli a6, a5, 3 /* Multiply by 8 to convert that to bits to shift */
 	sub  a5, a1, t3 /* Find the difference between src and dest */
 	andi a1, a1, -SZREG /* Align the src pointer */
-	addi a2, t6, SZREG /* The other breakpoint for the unrolled loop*/
+	addi a2, a3, SZREG /* The other breakpoint for the unrolled loop*/
 
 	/*
 	 * Compute The Inverse Shift
@@ -147,9 +147,9 @@ SYM_FUNC_START(__memmove)
 	or    t2, t1, t2
 	REG_S t2, ((1 * SZREG) - (2 * SZREG))(t3)
 
-	bne   t3, t6, 1b
+	bne   t3, a3, 1b
 	2:
-	mv    t3, t6 /* Fix the dest pointer in case the loop was broken */
+	mv    t3, a3 /* Fix the dest pointer in case the loop was broken */
 
 	add  a1, t3, a5 /* Restore the src pointer */
 	j .Lbyte_copy_forward /* Copy any remaining bytes */
@@ -232,7 +232,7 @@ SYM_FUNC_START(__memmove)
 	addi  a1, a1, SZREG
 	addi  t3, t3, SZREG
 	REG_S t1, (-1 * SZREG)(t3)
-	bne   t3, t6, 1b
+	bne   t3, a3, 1b
 
 	j .Lbyte_copy_forward /* Copy any remaining bytes */
 
@@ -269,13 +269,13 @@ SYM_FUNC_START(__memmove)
 	jalr zero, 0x0(t0) /* Return to multibyte copy loop */
 
 .Lbyte_copy_until_aligned_reverse:
-	beq  t4, t6, 2f
+	beq  t4, a3, 2f
 	1:
 	lb   t1, -1(a4)
 	addi a4, a4, -1
 	addi t4, t4, -1
 	sb   t1,  0(t4)
-	bne  t4, t6, 1b
+	bne  t4, a3, 1b
 	2:
 	jalr zero, 0x0(t0) /* Return to multibyte copy loop */
 
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index 062000c468c8..536d8ba8caa1 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -63,7 +63,7 @@ strncmp_zbb:
 	 *   a2 - number of characters to compare
 	 *
 	 * Clobbers
-	 *   t0, t1, t2, t3, t4, t5, t6
+	 *   t0, t1, t2, t3, t4, t5
 	 */
 
 	or	t2, a0, a1
@@ -73,12 +73,12 @@ strncmp_zbb:
 	bnez	t2, 3f
 
 	/* Adjust limit for fast-path.  */
-	andi	t6, t4, -SZREG
+	andi	t0, t4, -SZREG
 
 	/* Main loop for aligned string.  */
 	.p2align 3
 1:
-	bge	a0, t6, 3f
+	bge	a0, t0, 3f
 	REG_L	t0, 0(a0)
 	REG_L	t1, 0(a1)
 	orc.b	t3, t0
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4efea1b3326c..25fdedc0efdb 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -27,16 +27,16 @@ EXPORT_SYMBOL(__asm_copy_from_user)
 
 SYM_FUNC_START(fallback_scalar_usercopy)
 	/* Enable access to user memory */
-	li	t6, SR_SUM
-	csrs 	CSR_STATUS, t6
-	mv 	t6, ra
+	li	a7, SR_SUM
+	csrs 	CSR_STATUS, a7
+	mv 	a7, ra
 
 	call 	fallback_scalar_usercopy_sum_enabled
 
 	/* Disable access to user memory */
-	mv 	ra, t6
-	li 	t6, SR_SUM
-	csrc 	CSR_STATUS, t6
+	mv 	ra, a7
+	li 	a7, SR_SUM
+	csrc 	CSR_STATUS, a7
 	ret
 SYM_FUNC_END(fallback_scalar_usercopy)
 
@@ -117,7 +117,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	fixup REG_L   a4,        0(a1), 10f
 	fixup REG_L   a5,    SZREG(a1), 10f
 	fixup REG_L   a6,  2*SZREG(a1), 10f
-	fixup REG_L   a7,  3*SZREG(a1), 10f
+	fixup REG_L   a2,  3*SZREG(a1), 10f
 	fixup REG_L   t1,  4*SZREG(a1), 10f
 	fixup REG_L   t2,  5*SZREG(a1), 10f
 	fixup REG_L   t3,  6*SZREG(a1), 10f
@@ -125,7 +125,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	fixup REG_S   a4,        0(a0), 10f
 	fixup REG_S   a5,    SZREG(a0), 10f
 	fixup REG_S   a6,  2*SZREG(a0), 10f
-	fixup REG_S   a7,  3*SZREG(a0), 10f
+	fixup REG_S   a2,  3*SZREG(a0), 10f
 	fixup REG_S   t1,  4*SZREG(a0), 10f
 	fixup REG_S   t2,  5*SZREG(a0), 10f
 	fixup REG_S   t3,  6*SZREG(a0), 10f
@@ -217,8 +217,8 @@ SYM_FUNC_END(fallback_scalar_usercopy_sum_enabled)
 SYM_FUNC_START(__clear_user)
 
 	/* Enable access to user memory */
-	li t6, SR_SUM
-	csrs CSR_STATUS, t6
+	li t5, SR_SUM
+	csrs CSR_STATUS, t5
 
 	add a3, a0, a1
 	addi t0, a0, SZREG-1
@@ -240,7 +240,7 @@ SYM_FUNC_START(__clear_user)
 
 3:
 	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
+	csrc CSR_STATUS, t5
 	li a0, 0
 	ret
 4: /* Edge case: unalignment */
@@ -257,7 +257,7 @@ SYM_FUNC_START(__clear_user)
 	/* Exception fixup code */
 11:
 	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
+	csrc CSR_STATUS, t5
 	sub a0, a3, a0
 	ret
 SYM_FUNC_END(__clear_user)
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
index 03b5560609a2..401fde708c77 100644
--- a/arch/riscv/lib/uaccess_vector.S
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -22,16 +22,16 @@
 
 SYM_FUNC_START(__asm_vector_usercopy)
 	/* Enable access to user memory */
-	li	t6, SR_SUM
-	csrs	CSR_STATUS, t6
-	mv	t6, ra
+	li	a7, SR_SUM
+	csrs	CSR_STATUS, a7
+	mv	a7, ra
 
 	call 	__asm_vector_usercopy_sum_enabled
 
 	/* Disable access to user memory */
-	mv 	ra, t6
-	li 	t6, SR_SUM
-	csrc	CSR_STATUS, t6
+	mv 	ra, a7
+	li 	a7, SR_SUM
+	csrc	CSR_STATUS, a7
 	ret
 SYM_FUNC_END(__asm_vector_usercopy)
 
-- 
2.43.0

