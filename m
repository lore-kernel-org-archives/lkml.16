Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19E1E3DDB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218324; cv=none; b=CQJy7V3pSGAo7tG7VJTXOcws+wHy9J/R2XGvFsxmy8hbzAqZgoGbljzxpHe+mBh2uJLb0K+h3aK16exsjwaBJyBXVcZUtN5BwAJM8GUi/uyy1rxCRhiWXB/g4yhiUFCT6uztaBbOZA8Ea8rDnFwQxAqRaTT11WHszBSud4JtC88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218324; c=relaxed/simple;
	bh=STQFIw/HBbytBvJ+PRmnIgJclCk6u5HUCjOZVgh2ma4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IiGCPV7sDFG8Q7bxKXCToXLgaZOzDbAnBLbC7mi6pNXmF4Pgydo80QdcdQPFq4WSPDmCePzsQ8sY+Z88RdF/DQgWncm+OhskqWqSv1+XcoBPhWFB6pqQve7m7Oo1vHaDg8gzptsl1GV3lyxZBTtmr5LA23XYXu3ktxFk9L772ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IhlTPjp3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IhlTPjp3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23649faf69fso64065385ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750218322; x=1750823122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp8L94txKLX1tUimj0aQ6VWmmlTjnaKy7G6s2XINkmg=;
        b=IhlTPjp3IgsZxXiHL5sh3ecz2abdL7xOW7taXZwDT77ftfUNTsO5tj6zpI6s8+ZUkU
         Q4Aba9acHE+KlKo/7GGD0y6xw3OKTuiXsUeow3ktVUw22Wg9JdMqBGAhEeuL9NmYI941
         koY2Xk/jhpwBky/pWSI9PphUmO2nwf4OKTM480yGN9i2EUMQkXXVFNfaFQLYxknwPXLt
         wC7OaVE2rtxgjGUAevCfosi2SpyZVhTxnLBd8t6+CKPUCuZr9v8YaLSeNgPpvzoDeOTE
         HvlnPCobLiT1RZWvPxbZZagCZSNQGjjPYAc6fjiIxCnO0f7LZM6ScTFT36O9AYfJur7J
         Qwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750218322; x=1750823122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp8L94txKLX1tUimj0aQ6VWmmlTjnaKy7G6s2XINkmg=;
        b=eoLWgrh1u/2WyIrUzMKQl3V9PvoI9qZtVMjEvOu+1Ter4CpFEgUA66yIK2T4QCNsMJ
         aUfT9vEt/u0eKQOEk955NUrEJsvZatWjNiYp6k8WQzoz3BnEJPqHx82/Jk6/bQU67DPz
         JdEx9h7Te33X92um5OYil5Vb7YWMOAgNcWMwPRQPmWzaMV83ViHAaWHr/tmfqxV6Bi10
         cQ0w20czeDv4VgNrIO3+IIaelyUAE7XHgdnzE8MXh2QWbgfTE+1Q3ul4/kbJa36Kdpws
         XFgca2IPQui1bG4Q4lqijLbOiA+GbNxuVwjllms6r2DdEZlil+ofVq2b+fJosg5UHwy3
         azcA==
X-Forwarded-Encrypted: i=1; AJvYcCUSqiM0lqg4S2Cxon1scsi5X0hijWm9FXaMXr0OL4RKDPl+dVQ8al8Lw/SKF5KA2vB0T8cA34xjzzerAn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeo7at0QmzqXcwLVRCRIp4vR9Zmnihkdh5JP3VDx6e0HRyQbAA
	6bIWp3oKiIJAig1IUVAVuU9VFwX2CDv9S5wNP9BkwOB7uNIz5EozUDYlWyup7iRtOVA=
X-Gm-Gg: ASbGnctx3PnqQK35hguz/ypd8f/tYUSmRNMTF72KKf5xoMJxWFp/Vi7U9JsbgNHVi+G
	+pmN6TaDCv0fEqlzVd5X7IfEzsUR4kfyJt6vZSll4qZgMoDhN2zNBeAEWKbwujrTY2SJSFxggfp
	sgIH5JMnCbtuFoydQuU/iCHGfZtz1LjfhssI0u3q3/pJcEat/6KnRDZ3lNgc9GxWYYngN3bD8Yj
	NpxAm4ImeQm/AHay7M3Df97Wlec3Ux1ytWVzxgko+5s9sIFjQrT/I7qZptAmif6OsRuvy4hpCbM
	HOTCtqXMxRanT9ak4RFUK3J2VvZeBkDJNtRtrpLXp7Cy5UEyTGFiUoQHxeExpRAlliDPLXSs0O1
	4yUEzr2Ulb8v3n77mnWU2
X-Google-Smtp-Source: AGHT+IEA0+X7Rq7uEiWaNQh9VQpdhXbmkqBls8uQoP0FInjy3wJkHVsazcz6bn1o9ZKNOUFg3FwI3Q==
X-Received: by 2002:a17:902:ec8a:b0:235:f143:9b07 with SMTP id d9443c01a7336-2366afe98a9mr233361965ad.5.1750218322135;
        Tue, 17 Jun 2025 20:45:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1ab8sm89333465ad.84.2025.06.17.20.45.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 20:45:21 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	linux-mm@kvack.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH RFC 2/2] riscv: introduce percpu.h into include/asm
Date: Wed, 18 Jun 2025 11:43:28 +0800
Message-Id: <20250618034328.21904-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250618034328.21904-1-cuiyunhui@bytedance.com>
References: <20250618034328.21904-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current percpu operations rely on generic implementations, where
raw_local_irq_save() introduces substantial overhead. Optimization
is achieved through atomic operations and preemption disabling.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 138 ++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000000..423c0d01f874c
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+#include <linux/preempt.h>
+
+#define PERCPU_RW_OPS(sz)						\
+static inline unsigned long __percpu_read_##sz(void *ptr)		\
+{									\
+	return READ_ONCE(*(u##sz *)ptr);				\
+}									\
+									\
+static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
+{									\
+	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
+}
+
+#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)			\
+static inline void							\
+__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)		\
+{									\
+	asm volatile (							\
+	"amo" #amo_insn #sfx " zero, %[val], %[ptr]"			\
+	: [ptr] "+A" (*(u##sz *)ptr)					\
+	: [val] "r" ((u##sz)(val))					\
+	: "memory");							\
+}
+
+#define __PERCPU_AMO_RET_OP_CASE(sfx, name, sz, amo_insn)		\
+static inline u##sz							\
+__percpu_##name##_return_amo_case_##sz(void *ptr, unsigned long val)	\
+{									\
+	register u##sz ret;						\
+									\
+	asm volatile (							\
+	"amo" #amo_insn #sfx " %[ret], %[val], %[ptr]"			\
+	: [ptr] "+A" (*(u##sz *)ptr), [ret] "=r" (ret)			\
+	: [val] "r" ((u##sz)(val))					\
+	: "memory");							\
+									\
+	return ret + val;						\
+}
+
+#define PERCPU_OP(name, amo_insn)					\
+	__PERCPU_AMO_OP_CASE(.b, name, 8, amo_insn)			\
+	__PERCPU_AMO_OP_CASE(.h, name, 16, amo_insn)			\
+	__PERCPU_AMO_OP_CASE(.w, name, 32, amo_insn)			\
+	__PERCPU_AMO_OP_CASE(.d, name, 64, amo_insn)			\
+
+#define PERCPU_RET_OP(name, amo_insn)					\
+	__PERCPU_AMO_RET_OP_CASE(.b, name, 8, amo_insn)			\
+	__PERCPU_AMO_RET_OP_CASE(.h, name, 16, amo_insn)		\
+	__PERCPU_AMO_RET_OP_CASE(.w, name, 32, amo_insn)		\
+	__PERCPU_AMO_RET_OP_CASE(.d, name, 64, amo_insn)
+
+PERCPU_RW_OPS(8)
+PERCPU_RW_OPS(16)
+PERCPU_RW_OPS(32)
+PERCPU_RW_OPS(64)
+
+PERCPU_OP(add, add)
+PERCPU_OP(andnot, and)
+PERCPU_OP(or, or)
+PERCPU_RET_OP(add, add)
+
+#undef PERCPU_RW_OPS
+#undef __PERCPU_AMO_OP_CASE
+#undef __PERCPU_AMO_RET_OP_CASE
+#undef PERCPU_OP
+#undef PERCPU_RET_OP
+
+#define _pcp_protect(op, pcp, ...)					\
+({									\
+	preempt_disable_notrace();					\
+	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
+	preempt_enable_notrace();					\
+})
+
+#define _pcp_protect_return(op, pcp, args...)				\
+({									\
+	typeof(pcp) __retval;						\
+	preempt_disable_notrace();					\
+	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
+	preempt_enable_notrace();					\
+	__retval;							\
+})
+
+#define this_cpu_read_1(pcp)		_pcp_protect_return(__percpu_read_8, pcp)
+#define this_cpu_read_2(pcp)		_pcp_protect_return(__percpu_read_16, pcp)
+#define this_cpu_read_4(pcp)		_pcp_protect_return(__percpu_read_32, pcp)
+#define this_cpu_read_8(pcp)		_pcp_protect_return(__percpu_read_64, pcp)
+
+#define this_cpu_write_1(pcp, val)	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
+#define this_cpu_write_2(pcp, val)	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
+#define this_cpu_write_4(pcp, val)	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
+#define this_cpu_write_8(pcp, val)	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
+
+#define this_cpu_add_1(pcp, val)	_pcp_protect(__percpu_add_amo_case_8, pcp, val)
+#define this_cpu_add_2(pcp, val)	_pcp_protect(__percpu_add_amo_case_16, pcp, val)
+#define this_cpu_add_4(pcp, val)	_pcp_protect(__percpu_add_amo_case_32, pcp, val)
+#define this_cpu_add_8(pcp, val)	_pcp_protect(__percpu_add_amo_case_64, pcp, val)
+
+#define this_cpu_add_return_1(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_8, pcp, val)
+
+#define this_cpu_add_return_2(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_16, pcp, val)
+
+#define this_cpu_add_return_4(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_32, pcp, val)
+
+#define this_cpu_add_return_8(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_64, pcp, val)
+
+#define this_cpu_and_1(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_8, pcp, ~val)
+#define this_cpu_and_2(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_16, pcp, ~val)
+#define this_cpu_and_4(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_32, pcp, ~val)
+#define this_cpu_and_8(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_64, pcp, ~val)
+
+#define this_cpu_or_1(pcp, val)	_pcp_protect(__percpu_or_amo_case_8, pcp, val)
+#define this_cpu_or_2(pcp, val)	_pcp_protect(__percpu_or_amo_case_16, pcp, val)
+#define this_cpu_or_4(pcp, val)	_pcp_protect(__percpu_or_amo_case_32, pcp, val)
+#define this_cpu_or_8(pcp, val)	_pcp_protect(__percpu_or_amo_case_64, pcp, val)
+
+#define this_cpu_xchg_1(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_2(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_4(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_8(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+
+#define this_cpu_cmpxchg_1(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+#define this_cpu_cmpxchg_2(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+#define this_cpu_cmpxchg_4(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+#define this_cpu_cmpxchg_8(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+
+#include <asm-generic/percpu.h>
+
+#endif /* __ASM_PERCPU_H */
-- 
2.39.5

