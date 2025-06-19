Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00059244699
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359989; cv=none; b=YHmqfV9buTQSiy26qcyTA1dOoc1F2MtECXnrRqW4AkbxwKyDlwKstO8q0Q2dRplnzbTunO+f1NIJzO6WzjnLRkuej25hDcOGrFlvoKNZmVhPGJ9c4ACSlDMo9Ds09k39ECg/6M5IVB5Tpe6WOBMYeqg6/v4drHCJVTDf6Qg6qWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359989; c=relaxed/simple;
	bh=+GrIHTFuTUpROl92/5r/X+0zdXA6LqQVE3MUPwV/ZhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGAY19ny9VnDcxUnaqaXj5ZonV1IJIaF3n8KiQi6wPWxgWgiz+w9o3+JIsQvg+zz3Yl3r6Nil0t0qOpQJ6cVExQRjSZ95wE5x8mXnUbEn+5Oi/7q1u+rJbfayQVfvkLyizCYCYP3yJhkx3V5vXRQqLbPNVmtHeq8XCbVzW2aam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lKp3Aqy9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lKp3Aqy9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a577f164c8so189828f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750359986; x=1750964786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUgqqS33UmS8K3d8/jSIOnq3bo+bDq+T7oLLwEj0ZMo=;
        b=lKp3Aqy9ISgrA2MYN4wPpgQCY8dR3y7E1oG9tiby/EHHYdVoHTzLupvehs62/e2Rlj
         eWY1GReIVY+R1f7Pe6XJC+/Yx1ITsRPk7n2JPkKa7mfox8X2q10xuC6LBWV8vKFY2pM4
         2mQn3SMPDZgJ4zYgtgbBWXIZWRhdUB7bf6uJ50kPjPi4zOMsCBObGPzCDOFVxfh88sJn
         UGL7R0htRV+uM4gDXEDu8d2+LGfph3gl0Hk047LlKYpEa4tVghLpzbwRKpdnVtO5hNfv
         XYJGBR58a9yduxgzKyz2e/1UEIxmkyL23dijZiIN9Bg7Wfmb2BziH8GPK+qp3QITUQgr
         3+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359986; x=1750964786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUgqqS33UmS8K3d8/jSIOnq3bo+bDq+T7oLLwEj0ZMo=;
        b=ESJPe3wuNKBvA16ZEcppMMXXX/dkuvsXLiq6wnqyE12Zcp+9Eq1mFWrYnmN5h6vQI4
         54wVRA8sovxKHUwObyrQaKifxnuPzwb5ttAx9drUEe3W+NOcHz5hArWLYbfGuJemtofR
         Am8oHf5FdVmY4OmoMVxnvIlIvb6his3PaFMdwdomMW+EP7X1/aKAcmclylkvJ4Vi17oz
         3rdV8ESnuCpMNbv9Ji0kVIWCH4uJmGxhSP6LOUhz+rY7F7ZyWZwoKkf1yr0PLga0jly8
         EpFo4QyU94O2Dfy8pgc1Qm1dWxSPtyFOlZnMHOxiJ7Oh58MtQaEpP8gkLqNaGZ2SvPqh
         FWkQ==
X-Gm-Message-State: AOJu0Yyq4Iu537x/e3DVeXgMm48arZc6PcL1Cj5DlSZS7EztX3H1taLd
	LxWFIzHY7oG2M6MTVltolMKWLfmPOzplT3f/z9T1XqNv8sGJ0UbaHdtrF5HFXMa5CRw=
X-Gm-Gg: ASbGncvK6foj+F92LAd59O1jPRDz28BDu36+Wazgu+c3qr3b52DtaR+eqKQChIiCqog
	0pPzJqkXCDOy9CrukJXHnkjTj2vuZSQXJb7V1DQPG5F7rLDzYHH3Qdt1YXi8MxpMWgGH4Wyf1EU
	4lV7Hkyq4uII6p3WW8/MGdQdxb6ALFptEMGFBGwp20/a3lLB7cLY8a3CuGqB2BuAZK0nmGI34cx
	BQLhCoto+ZGLHmY3EJ9V7/MSwwSgiFBIotNZWtaaesAv0Nho3JOTej4WvUcgs6THn/UFiZCZVIy
	4OV9L+s+dNpe/IoRVcWxbR/sJAreAiagxjGNlfEYErsLGkCSbO5qjssBEGbOMs1A0pwIiQ==
X-Google-Smtp-Source: AGHT+IHuibaFNqAChrUUS/w/dvL1A03xt+pHa6kwx4Z+eNcaodjzCahV1ThOG3laDvCRTCsVwhRJtg==
X-Received: by 2002:a05:6000:220e:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a6d112f3a6mr78102f8f.0.1750359986095;
        Thu, 19 Jun 2025 12:06:26 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:5b14:46b0:5c7a:61f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10a27sm168047f8f.14.2025.06.19.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:06:25 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Date: Thu, 19 Jun 2025 21:03:15 +0200
Message-ID: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tracepoits generate bad code in the non-trace path.

The acceptable tracepoint overhead in the non-tracing path is a nop, and
possibly a second 2 byte nop for alignment, but the actual overhead is
way higher.  For example, the sbi_fwft_set with tracepoints:
   0xffffffff80022ee8 <+0>:	auipc	a5,0x2cec
   0xffffffff80022eec <+4>:	lbu	a5,1704(a5) # 0xffffffff82d0f590 <sbi_fwft_supported>
   0xffffffff80022ef0 <+8>:	beqz	a5,0xffffffff80022fa0 <sbi_fwft_set+184>
   0xffffffff80022ef2 <+10>:	addi	sp,sp,-48
   0xffffffff80022ef4 <+12>:	sd	s0,32(sp)
   0xffffffff80022ef6 <+14>:	sd	s1,24(sp)
   0xffffffff80022ef8 <+16>:	sd	s2,16(sp)
   0xffffffff80022efa <+18>:	sd	ra,40(sp)
   0xffffffff80022efc <+20>:	addi	s0,sp,48
   0xffffffff80022efe <+22>:	slli	s1,a0,0x20
   0xffffffff80022f02 <+26>:	mv	s2,a1
   0xffffffff80022f04 <+28>:	srli	s1,s1,0x20
   0xffffffff80022f06 <+30>:	nop
   0xffffffff80022f08 <+32>:	nop
   0xffffffff80022f0c <+36>:	lui	a7,0x46574
   0xffffffff80022f10 <+40>:	mv	a0,s1
   0xffffffff80022f12 <+42>:	mv	a1,s2
   0xffffffff80022f14 <+44>:	addi	a7,a7,1620 # 0x46574654
   0xffffffff80022f18 <+48>:	li	a6,0
   0xffffffff80022f1a <+50>:	ecall
   0xffffffff80022f1e <+54>:	mv	s1,a0
   0xffffffff80022f20 <+56>:	nop
   0xffffffff80022f24 <+60>:	addiw	a0,s1,14
   0xffffffff80022f28 <+64>:	li	a5,14
   0xffffffff80022f2a <+66>:	bltu	a5,a0,0xffffffff80022f9a <sbi_fwft_set+178>
   0xffffffff80022f2e <+70>:	slli	a5,a0,0x20
   0xffffffff80022f32 <+74>:	srli	a0,a5,0x1e
   0xffffffff80022f36 <+78>:	auipc	a5,0x1c75
   0xffffffff80022f3a <+82>:	addi	a5,a5,-886 # 0xffffffff81c97bc0 <CSWTCH.177>
   0xffffffff80022f3e <+86>:	add	a5,a5,a0
   0xffffffff80022f40 <+88>:	lw	a0,0(a5)
   0xffffffff80022f42 <+90>:	ld	ra,40(sp)
   0xffffffff80022f44 <+92>:	ld	s0,32(sp)
   0xffffffff80022f46 <+94>:	ld	s1,24(sp)
   0xffffffff80022f48 <+96>:	ld	s2,16(sp)
   0xffffffff80022f4a <+98>:	addi	sp,sp,48
   0xffffffff80022f4c <+100>:	ret
   [tracepoint slowpaths]
   0xffffffff80022f9a <+178>:	li	a0,-524
   0xffffffff80022f9e <+182>:	j	0xffffffff80022f42 <sbi_fwft_set+90>
   0xffffffff80022fa0 <+184>:	li	a0,-95
   0xffffffff80022fa4 <+188>:	ret

Without tracepoints:
   0xffffffff80022b40 <+0>:	addi	sp,sp,-16
   0xffffffff80022b42 <+2>:	sd	s0,0(sp)
   0xffffffff80022b44 <+4>:	sd	ra,8(sp)
   0xffffffff80022b46 <+6>:	addi	s0,sp,16
   0xffffffff80022b48 <+8>:	auipc	a5,0x2ced
   0xffffffff80022b4c <+12>:	lbu	a5,-1464(a5) # 0xffffffff82d0f590 <sbi_fwft_supported>
   0xffffffff80022b50 <+16>:	beqz	a5,0xffffffff80022b8e <sbi_fwft_set+78>
   0xffffffff80022b52 <+18>:	lui	a7,0x46574
   0xffffffff80022b56 <+22>:	slli	a0,a0,0x20
   0xffffffff80022b58 <+24>:	srli	a0,a0,0x20
   0xffffffff80022b5a <+26>:	addi	a7,a7,1620 # 0x46574654
   0xffffffff80022b5e <+30>:	li	a6,0
   0xffffffff80022b60 <+32>:	ecall
   0xffffffff80022b64 <+36>:	li	a5,14
   0xffffffff80022b66 <+38>:	addiw	a0,a0,14
   0xffffffff80022b68 <+40>:	bltu	a5,a0,0xffffffff80022b88 <sbi_fwft_set+72>
   0xffffffff80022b6c <+44>:	slli	a5,a0,0x20
   0xffffffff80022b70 <+48>:	srli	a0,a5,0x1e
   0xffffffff80022b74 <+52>:	auipc	a5,0x1c75
   0xffffffff80022b78 <+56>:	addi	a5,a5,-300 # 0xffffffff81c97a48 <CSWTCH.176>
   0xffffffff80022b7c <+60>:	add	a5,a5,a0
   0xffffffff80022b7e <+62>:	lw	a0,0(a5)
   0xffffffff80022b80 <+64>:	ld	ra,8(sp)
   0xffffffff80022b82 <+66>:	ld	s0,0(sp)
   0xffffffff80022b84 <+68>:	addi	sp,sp,16
   0xffffffff80022b86 <+70>:	ret

   0xffffffff80022b88 <+72>:	li	a0,-524
   0xffffffff80022b8c <+76>:	j	0xffffffff80022b80 <sbi_fwft_set+64>
   0xffffffff80022b8e <+78>:	li	a0,-95
   0xffffffff80022b92 <+82>:	j	0xffffffff80022b80 <sbi_fwft_set+64>

It would be nice if RISC-V had a way to tell compilers to generate the
desired code, because if this issue isn't limited to ecall tracepoints,
then disabling CONFIG_TRACEPOINTS is starting to look good. :)

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h   | 30 ++--------------------------
 arch/riscv/include/asm/trace.h | 36 ----------------------------------
 arch/riscv/kernel/sbi_ecall.c  | 18 -----------------
 3 files changed, 2 insertions(+), 82 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 7aff31583a3d..ffab0614d24a 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -11,7 +11,6 @@
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
-#include <linux/tracepoint-defs.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
@@ -461,16 +460,6 @@ struct sbiret {
 	long value;
 };
 
-#ifdef CONFIG_TRACEPOINTS
-DECLARE_TRACEPOINT(sbi_call);
-DECLARE_TRACEPOINT(sbi_return);
-extern void do_trace_sbi_call(int ext, int fid);
-extern void do_trace_sbi_return(int ext, long error, long value);
-#else
-static inline void do_trace_sbi_call(int ext, int fid) {};
-static inline void do_trace_sbi_return(int ext, long error, long value) {};
-#endif
-
 void sbi_init(void);
 long __sbi_base_ecall(int fid);
 
@@ -509,32 +498,17 @@ long __sbi_base_ecall(int fid);
 #define __sbi_ecall_constraints7  __sbi_ecall_constraints6, "r" (__a4)
 #define __sbi_ecall_constraints8  __sbi_ecall_constraints7, "r" (__a5)
 
-#define __sbi_ecall_trace_call() \
-	if (tracepoint_enabled(sbi_call)) \
-		do_trace_sbi_call(__ta7, __ta6)
-
-#define __sbi_ecall_trace_return() \
-	if (tracepoint_enabled(sbi_return)) \
-		do_trace_sbi_return(__ta7, __ret.error, __ret.value)
-
-/*
- * Clear a1 to avoid leaking unrelated kernel state through tracepoints in case
- * the register doesn't get overwritten by the ecall nor the arguments.
- */
 #define sbi_ecall(A...) \
 ({ \
 	CONCATENATE(__sbi_ecall_args, COUNT_ARGS(A))(A); \
-	__sbi_ecall_trace_call(); \
 	register uintptr_t __r0 asm ("a0"); \
-	register uintptr_t __r1 asm ("a1") = 0; \
+	register uintptr_t __r1 asm ("a1"); \
 	CONCATENATE(__sbi_ecall_regs, COUNT_ARGS(A)); \
 	asm volatile ("ecall" \
 			: "=r" (__r0), "=r" (__r1) \
 			: CONCATENATE(__sbi_ecall_constraints, COUNT_ARGS(A)) \
 			: "memory"); \
-	struct sbiret __ret = {.error = __r0, .value = __r1}; \
-	__sbi_ecall_trace_return(); \
-	__ret; \
+	(struct sbiret){.error = __r0, .value = __r1}; \
 })
 
 #ifdef CONFIG_RISCV_SBI_V01
diff --git a/arch/riscv/include/asm/trace.h b/arch/riscv/include/asm/trace.h
index 6151cee5450c..7c99d91fcce3 100644
--- a/arch/riscv/include/asm/trace.h
+++ b/arch/riscv/include/asm/trace.h
@@ -7,42 +7,6 @@
 
 #include <linux/tracepoint.h>
 
-TRACE_EVENT_CONDITION(sbi_call,
-	TP_PROTO(int ext, int fid),
-	TP_ARGS(ext, fid),
-	TP_CONDITION(ext != SBI_EXT_HSM),
-
-	TP_STRUCT__entry(
-		__field(int, ext)
-		__field(int, fid)
-	),
-
-	TP_fast_assign(
-		__entry->ext = ext;
-		__entry->fid = fid;
-	),
-
-	TP_printk("ext=0x%x fid=%d", __entry->ext, __entry->fid)
-);
-
-TRACE_EVENT_CONDITION(sbi_return,
-	TP_PROTO(int ext, long error, long value),
-	TP_ARGS(ext, error, value),
-	TP_CONDITION(ext != SBI_EXT_HSM),
-
-	TP_STRUCT__entry(
-		__field(long, error)
-		__field(long, value)
-	),
-
-	TP_fast_assign(
-		__entry->error = error;
-		__entry->value = value;
-	),
-
-	TP_printk("error=%ld value=0x%lx", __entry->error, __entry->value)
-);
-
 #endif /* _TRACE_RISCV_H */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/arch/riscv/kernel/sbi_ecall.c b/arch/riscv/kernel/sbi_ecall.c
index b783a46fff1c..62489ffeae2c 100644
--- a/arch/riscv/kernel/sbi_ecall.c
+++ b/arch/riscv/kernel/sbi_ecall.c
@@ -2,8 +2,6 @@
 /* Copyright (c) 2024 Rivos Inc. */
 
 #include <asm/sbi.h>
-#define CREATE_TRACE_POINTS
-#include <asm/trace.h>
 
 long __sbi_base_ecall(int fid)
 {
@@ -16,19 +14,3 @@ long __sbi_base_ecall(int fid)
 		return sbi_err_map_linux_errno(ret.error);
 }
 EXPORT_SYMBOL(__sbi_base_ecall);
-
-#ifdef CONFIG_TRACEPOINTS
-void do_trace_sbi_call(int ext, int fid)
-{
-	trace_sbi_call(ext, fid);
-}
-EXPORT_SYMBOL(do_trace_sbi_call);
-EXPORT_TRACEPOINT_SYMBOL(sbi_call);
-
-void do_trace_sbi_return(int ext, long error, long value)
-{
-	trace_sbi_return(ext, error, value);
-}
-EXPORT_SYMBOL(do_trace_sbi_return);
-EXPORT_TRACEPOINT_SYMBOL(sbi_return);
-#endif
-- 
2.49.0

