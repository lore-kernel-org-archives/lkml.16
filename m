Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF408BFF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359987; cv=none; b=hXP5n5whdvJBU/aN59zuYpBrs11ttcjfrF/cjvpJDC/DP9vmmufgByPNeocsqW+qvCNI3t1JQcEN7VBBD41Ozs94BglXn0SNXAFB4h/vG9ntHn4eJCPM94noV6RDumeNNGn5oKNOrma6KPw+S+EWKAUxp+OFjUQUbITL00hjSx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359987; c=relaxed/simple;
	bh=yfjKBHnTVtwShoqXo4Rw6Q99WKmdGizSxxu6sLbzcaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eb36NRHds1ME1nLPYd7jZTSCSumBIgMrZqr7fWrF0CMryH/++x/pSii+VolZ42ovsUPMXvqoHHfew9Rch8GRdhu5U5sKR+snZHlKw7kie4W5WIrVh/8r2EUJB9PlGo/qsbeCibprcWUp1/EN8yrfVM1ARl8Ss9wuVjD/ITkgJGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EzXyxKjm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EzXyxKjm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so185087f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750359983; x=1750964783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrhXfHH0ZaJc/g5RZjo66BPzn38jEd2Bp18an//cBwM=;
        b=EzXyxKjmbcB5u4SKgtuey2Svp64sl+Mu9E0Fsxeh80cjGTLCPLvi7zxVv5IcXCVVQG
         8JqGEx3LMhevGw9RJ/zxsTwmP6tqhcod7ti4ulJzitTLxFP5RqcY5s7vDY2LUD0U/4OI
         G3B5hA9PInATZCzWVWF93OzJ7M9TlbSvvOJybx2DZ/jig+CWfwc3qFH0XXxU1+grmvW9
         8UahQ25KaFPxJwcpnjjZV9kLpBtQcTSCdMFubh+mjSFIRpDLRCVbN9kQx5Zl1INWufgk
         AMyl1WpFM+LWjSjXjmL824aVDIU2mtn+vh+wV6Z//FdMn8DbnTy/YuoCtdiRpnbNyVpR
         aUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359983; x=1750964783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrhXfHH0ZaJc/g5RZjo66BPzn38jEd2Bp18an//cBwM=;
        b=lv5xSB/4BnBOmOVOJCYz4wvKCaFKe+3FmKhZsuMwZBVUR+69M+cyhMw/aoqeZAPe9L
         iduh/VLR9X+c25HDcfGAgC+5wxJbF1uxfQ/FFAV/Nt+lHx40BWPPvbEV+xYPcHX+2Kuc
         E+qkDcDlP4H4yYrCMXFxlSP465NJJXSq7B5DtQPUoJaHf/3B3qM99qOOgGOO/syygWHw
         V1e2+77W74ZIt8WxQUhIhJ7FC22WxHnHrI48GVosc43mIFntfraM8ok3vb/P/RLaZeRB
         Q6MDEcg3q7z1kR0fiw7rhWKrS0neHLHt+R+QIoCF+Mi2SzGkyE/+rRHuZbSsNu9WT0W2
         SH5A==
X-Gm-Message-State: AOJu0Yx5BmlWvzWOzZM5UGtFV+1vJuhiTW78t5DUCOxLoH105iAu7Gfi
	jtNwmhHJzxwjyGpFmnUrK+FLFr9D6YralSRk7AfeZeyMJtV0EDCT10Jy9J1p0MDfd7M=
X-Gm-Gg: ASbGncvB+d8DG87V8geICyJRTlfWonItA2V1irnzgVW3NPiQoF00kxHcxREw349PDSG
	nDc5IExNnLu/9+XvlxLTGO2EX+lXLw+LQsUHaoWnL4DXwxxC12YjsG8vRtAgPZ+e683f9LXkENE
	89wrFZ6bbf/4wE2Piif61BGDJ8jyaV73Adf0s5kEpPKu9tsCIX6KokLPulAED1gSxBECy5erfL1
	YI2oC7x5szDMjLdhDLMDjF71Y5CeKAh6zUqncCDzX14jtRgm/nGjMytEIuMfCrRDBXpq4VoymP8
	SH5WI+r2CiOvJk/Goqokorp+WvLtUhmIYGvpmxvSpOA/LhKr3G91eGKCL/PdSdYq4aJOhA==
X-Google-Smtp-Source: AGHT+IFGlNynqilunH7006RLyqoG/RvcqNhW6FA2jjSZiPOPnnEmStmUUb1XVQJc1igbdVTDjQYXtQ==
X-Received: by 2002:a5d:64cb:0:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3a6d12ad8a9mr63368f8f.8.1750359983417;
        Thu, 19 Jun 2025 12:06:23 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:5b14:46b0:5c7a:61f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18152sm156048f8f.27.2025.06.19.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:06:22 -0700 (PDT)
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
Subject: [PATCH v2 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
Date: Thu, 19 Jun 2025 21:03:13 +0200
Message-ID: <20250619190315.2603194-2-rkrcmar@ventanamicro.com>
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

The SBI ecall interface has 0~6 arguments in a0~a5, and undefined
arguments are not reserved, so we don't have to zero the registers.

The current sbi_ecall forces programmers to pad the argument count,
which makes it hard to distinguish what is a value 0, and what is the
padding, because 0 was traditionally used for padding as well.

Turn sbi_ecall into a variadic macro that accepts 2~8 arguments, and
where only the specified arguments get passed to the ecall instruction.

The register a1 is zeroed if unused, to prevent unnecessary leaks of
kernel register state from the tracepoints.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
Do we actually care if user authorized to do tracing sees random kernel
registers state?  I'd like to remove the code comment and the line that
sets the register to 0.

v2:
 * use linux/args.h [Thomas]
 * completely rewrite
 * remove __sbi_ecall
---
 arch/riscv/include/asm/sbi.h  | 81 ++++++++++++++++++++++++++++++++---
 arch/riscv/kernel/sbi_ecall.c | 38 ++++++----------
 2 files changed, 87 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..7aff31583a3d 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -7,9 +7,11 @@
 #ifndef _ASM_RISCV_SBI_H
 #define _ASM_RISCV_SBI_H
 
+#include <linux/args.h>
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <linux/tracepoint-defs.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
@@ -459,14 +461,81 @@ struct sbiret {
 	long value;
 };
 
+#ifdef CONFIG_TRACEPOINTS
+DECLARE_TRACEPOINT(sbi_call);
+DECLARE_TRACEPOINT(sbi_return);
+extern void do_trace_sbi_call(int ext, int fid);
+extern void do_trace_sbi_return(int ext, long error, long value);
+#else
+static inline void do_trace_sbi_call(int ext, int fid) {};
+static inline void do_trace_sbi_return(int ext, long error, long value) {};
+#endif
+
 void sbi_init(void);
 long __sbi_base_ecall(int fid);
-struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
-			  unsigned long arg2, unsigned long arg3,
-			  unsigned long arg4, unsigned long arg5,
-			  int fid, int ext);
-#define sbi_ecall(e, f, a0, a1, a2, a3, a4, a5)	\
-		__sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
+
+#define __sbi_ecall_args2(e, f) \
+	uintptr_t __ta7 = (uintptr_t)(e); \
+	uintptr_t __ta6 = (uintptr_t)(f)
+#define __sbi_ecall_args3(e, f, a0) \
+	__sbi_ecall_args2(e, f); uintptr_t __ta0 = (uintptr_t)(a0)
+#define __sbi_ecall_args4(e, f, a0, a1) \
+	__sbi_ecall_args3(e, f, a0); uintptr_t __ta1 = (uintptr_t)(a1)
+#define __sbi_ecall_args5(e, f, a0, a1, a2) \
+	__sbi_ecall_args4(e, f, a0, a1); uintptr_t __ta2 = (uintptr_t)(a2)
+#define __sbi_ecall_args6(e, f, a0, a1, a2, a3) \
+	__sbi_ecall_args5(e, f, a0, a1, a2); uintptr_t __ta3 = (uintptr_t)(a3)
+#define __sbi_ecall_args7(e, f, a0, a1, a2, a3, a4) \
+	__sbi_ecall_args6(e, f, a0, a1, a2, a3); uintptr_t __ta4 = (uintptr_t)(a4)
+#define __sbi_ecall_args8(e, f, a0, a1, a2, a3, a4, a5) \
+	__sbi_ecall_args7(e, f, a0, a1, a2, a3, a4); uintptr_t __ta5 = (uintptr_t)(a5)
+
+#define __sbi_ecall_regs2 \
+	register uintptr_t __a7 asm ("a7") = __ta7; \
+	register uintptr_t __a6 asm ("a6") = __ta6
+#define __sbi_ecall_regs3  __sbi_ecall_regs2; register uintptr_t __a0 asm ("a0") = __ta0
+#define __sbi_ecall_regs4  __sbi_ecall_regs3; register uintptr_t __a1 asm ("a1") = __ta1
+#define __sbi_ecall_regs5  __sbi_ecall_regs4; register uintptr_t __a2 asm ("a2") = __ta2
+#define __sbi_ecall_regs6  __sbi_ecall_regs5; register uintptr_t __a3 asm ("a3") = __ta3
+#define __sbi_ecall_regs7  __sbi_ecall_regs6; register uintptr_t __a4 asm ("a4") = __ta4
+#define __sbi_ecall_regs8  __sbi_ecall_regs7; register uintptr_t __a5 asm ("a5") = __ta5
+
+#define __sbi_ecall_constraints1                            "r" (__a7)
+#define __sbi_ecall_constraints2  __sbi_ecall_constraints1, "r" (__a6)
+#define __sbi_ecall_constraints3  __sbi_ecall_constraints2, "r" (__a0)
+#define __sbi_ecall_constraints4  __sbi_ecall_constraints3, "r" (__a1)
+#define __sbi_ecall_constraints5  __sbi_ecall_constraints4, "r" (__a2)
+#define __sbi_ecall_constraints6  __sbi_ecall_constraints5, "r" (__a3)
+#define __sbi_ecall_constraints7  __sbi_ecall_constraints6, "r" (__a4)
+#define __sbi_ecall_constraints8  __sbi_ecall_constraints7, "r" (__a5)
+
+#define __sbi_ecall_trace_call() \
+	if (tracepoint_enabled(sbi_call)) \
+		do_trace_sbi_call(__ta7, __ta6)
+
+#define __sbi_ecall_trace_return() \
+	if (tracepoint_enabled(sbi_return)) \
+		do_trace_sbi_return(__ta7, __ret.error, __ret.value)
+
+/*
+ * Clear a1 to avoid leaking unrelated kernel state through tracepoints in case
+ * the register doesn't get overwritten by the ecall nor the arguments.
+ */
+#define sbi_ecall(A...) \
+({ \
+	CONCATENATE(__sbi_ecall_args, COUNT_ARGS(A))(A); \
+	__sbi_ecall_trace_call(); \
+	register uintptr_t __r0 asm ("a0"); \
+	register uintptr_t __r1 asm ("a1") = 0; \
+	CONCATENATE(__sbi_ecall_regs, COUNT_ARGS(A)); \
+	asm volatile ("ecall" \
+			: "=r" (__r0), "=r" (__r1) \
+			: CONCATENATE(__sbi_ecall_constraints, COUNT_ARGS(A)) \
+			: "memory"); \
+	struct sbiret __ret = {.error = __r0, .value = __r1}; \
+	__sbi_ecall_trace_return(); \
+	__ret; \
+})
 
 #ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
diff --git a/arch/riscv/kernel/sbi_ecall.c b/arch/riscv/kernel/sbi_ecall.c
index 24aabb4fbde3..2a3f31edb08f 100644
--- a/arch/riscv/kernel/sbi_ecall.c
+++ b/arch/riscv/kernel/sbi_ecall.c
@@ -17,32 +17,18 @@ long __sbi_base_ecall(int fid)
 }
 EXPORT_SYMBOL(__sbi_base_ecall);
 
-struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
-			  unsigned long arg2, unsigned long arg3,
-			  unsigned long arg4, unsigned long arg5,
-			  int fid, int ext)
+#ifdef CONFIG_TRACEPOINTS
+void do_trace_sbi_call(int ext, int fid)
 {
-	struct sbiret ret;
-
 	trace_sbi_call(ext, fid);
-
-	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
-	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
-	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
-	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
-	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
-	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
-	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
-	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
-	asm volatile ("ecall"
-		       : "+r" (a0), "+r" (a1)
-		       : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
-		       : "memory");
-	ret.error = a0;
-	ret.value = a1;
-
-	trace_sbi_return(ext, ret.error, ret.value);
-
-	return ret;
 }
-EXPORT_SYMBOL(__sbi_ecall);
+EXPORT_SYMBOL(do_trace_sbi_call);
+EXPORT_TRACEPOINT_SYMBOL(sbi_call);
+
+void do_trace_sbi_return(int ext, long error, long value)
+{
+	trace_sbi_return(ext, error, value);
+}
+EXPORT_SYMBOL(do_trace_sbi_return);
+EXPORT_TRACEPOINT_SYMBOL(sbi_return);
+#endif
-- 
2.49.0

