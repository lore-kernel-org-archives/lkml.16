Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8D2C3253
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893473; cv=none; b=j2bfsDWgLpAZkQvCWOaDCYetTRSzZoQLET48FxsbGHrNoAPf3HuhulXGPAmzRgur97GtRnq6E+VwE5pXg5eitTgWSS67dGIqdSsj1eiLDnNX6kYLVlysYQk19z45eq3LTpR2sr1HAXImnFOntoFXH3qupC1tOqYT+BCWvh6xpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893473; c=relaxed/simple;
	bh=RQQS9wykCAKPz7cXHAoZxH3SjVHqtw9yqXXjVL2LqLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfwA+j4ZzBqLRPbBThYcXBXbB8ZyWE00EaVNzpFW8/FBMKHkFEaFLQg2IYqEEvZhxekp7cOYfyEBLqKZVMV9MzBs6Gt1lJBavRp26YAoFa1dKGs2JpcWVe3j2l5JHp3rYNV7d9/9QFJnC7Z5RFQZ/OuG26iuJdX6ykHX6mHlwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CzXYifg7; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CzXYifg7"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23035b3edf1so43555055ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893471; x=1749498271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zur8vnBL/aIBIBT0v6Ls3k2PGwSe6i2tzuRUsrSMGvQ=;
        b=CzXYifg7IJLsa0KlJZUcMPdt7psNV8Ay7hrahoE1D+TCM4U1xHrBMgvebaqbdqQKKP
         jVBCX1iAm3R6GCGA/xrK4x2Dn+Y/9EuPDW0V9lxK150SunSMGHmdM22zTG+QEbRca10F
         sZf22cmL1UUFncwy6+LZzy/7l0ZW8dP6+40Arxm1Za5NN3iuVc8U3OnhPcFVLyGM8ecI
         ON+HuYzbBJmcXfHFguh7KndTMs64TAnoLqq70bQ58Zala0pOmTeYQhKh1Spq61rAjWzN
         oY+yyTSHudfDjmAhN5xASYlrgW2wlz+bQ0sBNMILRR4qUI95zLq52FW0dIwEEgll9Ypn
         1NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893471; x=1749498271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zur8vnBL/aIBIBT0v6Ls3k2PGwSe6i2tzuRUsrSMGvQ=;
        b=ZhM09fTgAdU2GA658eEyt30P+e4/nyh4QCKRTuto0xTQMiB9ZHaYxZaGdmspR70LIP
         QGZg4d2A4bUvt9k+o5f9b2QnQpdIBoGejbOeqOImUwWH2EkzH3zP8DBzBLhI8Tol/0eh
         D6MeJHObHZznNihb/f57qfzaDbE/CxW92OI/OMvvawJqi3n39M73a+em/C2Z9UdOVUp5
         syUIfu97zzDyg9PIK4uf/aCIrFUBdzJ2ge1psAdInXJmIVAIIBxbXomppSlPcnNVaR7X
         GiNEAuSPnN78SBjlmO/gIQgahCB8YLiLX/Q7VuaZ02fT2imxXtip8RKkwp532SgWMn7F
         jJzA==
X-Forwarded-Encrypted: i=1; AJvYcCXL2kz90Ba7VXIDCR0oVCiIgcCHqA9SLyfR69UcdayBSdrBXCki4G+HjaHs8iA4myG/3AXw9yKIeu/yPgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKe1TMOYLkM8OYLWOSJQ0RMe6/EFpYOxBYhEGx02xOBAwt/azd
	C28wmElnm5eXHLKbQmweQtT0fTfGA7/yPWomA0aA3FtRp6bX0RoGxnPQPgJMQPi8iHo=
X-Gm-Gg: ASbGncu0vMjfto0SjqP05LUAFOCR2weS4GLISxgIclxx92mHN7QHIKV4Yt4S4QcAsHv
	AEW14JSEOwTAd6EbbhIGHKv6p+xR0d1VEkP5hnoACa3ZL+CemBP7QpqkqfH/SzLtsuQAGjzm80I
	m1h2Zojxuiur3ZsQFLQQQATWCWAGj5JZPWJz4C2111nx3kRxy8NfSz8x3S360asdktxwcNs5CD7
	QMT9g7o75EVgFnCIjeN1sNkigS0CFvCqrF3xaK0D7cEOm7mBwX1UUcf8i9AtliN4BpVkOnX7Ekz
	j5HNNCfDUmnLtL9vaNGmQOAhsoXbmmIYsMhOg/QcJ4EHacEsqzaB
X-Google-Smtp-Source: AGHT+IGGiWE+FvM3qtu3me1rB36Kwx5uGw0pOGBY7v2J71v6g26D+49dy3A/NTvFDvJEI5GYayYmlg==
X-Received: by 2002:a17:902:ea08:b0:234:a063:e2ac with SMTP id d9443c01a7336-23528fedd7bmr219553865ad.2.1748893470551;
        Mon, 02 Jun 2025 12:44:30 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	David Laight <david.laight.linux@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/3] riscv: make unsafe user copy routines use existing assembly routines
Date: Mon,  2 Jun 2025 21:39:14 +0200
Message-ID: <20250602193918.868962-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandre Ghiti <alexghiti@rivosinc.com>

The current implementation is underperforming and in addition, it
triggers misaligned access traps on platforms which do not handle
misaligned accesses in hardware.

Use the existing assembly routines to solve both problems at once.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  2 +-
 arch/riscv/include/asm/uaccess.h        | 33 ++++------------
 arch/riscv/lib/riscv_v_helpers.c        | 11 ++++--
 arch/riscv/lib/uaccess.S                | 50 +++++++++++++++++--------
 arch/riscv/lib/uaccess_vector.S         | 15 ++++++--
 5 files changed, 63 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5d10edde6d17 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -12,7 +12,7 @@ long long __ashlti3(long long a, int b);
 #ifdef CONFIG_RISCV_ISA_V
 
 #ifdef CONFIG_MMU
-asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n);
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n, bool enable_sum);
 #endif /* CONFIG_MMU  */
 
 void xor_regs_2_(unsigned long bytes, unsigned long *__restrict p1,
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 87d01168f80a..046de7ced09c 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -450,35 +450,18 @@ static inline void user_access_restore(unsigned long enabled) { }
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
 } while (0)
 
-#define unsafe_copy_loop(dst, src, len, type, op, label)		\
-	while (len >= sizeof(type)) {					\
-		op(*(type *)(src), (type __user *)(dst), label);	\
-		dst += sizeof(type);					\
-		src += sizeof(type);					\
-		len -= sizeof(type);					\
-	}
+unsigned long __must_check __asm_copy_to_user_sum_enabled(void __user *to,
+	const void *from, unsigned long n);
+unsigned long __must_check __asm_copy_from_user_sum_enabled(void *to,
+	const void __user *from, unsigned long n);
 
 #define unsafe_copy_to_user(_dst, _src, _len, label)			\
-do {									\
-	char __user *__ucu_dst = (_dst);				\
-	const char *__ucu_src = (_src);					\
-	size_t __ucu_len = (_len);					\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_put_user, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_put_user, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_put_user, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_put_user, label);	\
-} while (0)
+	if (__asm_copy_to_user_sum_enabled(_dst, _src, _len))		\
+		goto label;
 
 #define unsafe_copy_from_user(_dst, _src, _len, label)			\
-do {									\
-	char *__ucu_dst = (_dst);					\
-	const char __user *__ucu_src = (_src);				\
-	size_t __ucu_len = (_len);					\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u64, unsafe_get_user, label);	\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u32, unsafe_get_user, label);	\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u16, unsafe_get_user, label);	\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u8, unsafe_get_user, label);	\
-} while (0)
+	if (__asm_copy_from_user_sum_enabled(_dst, _src, _len))		\
+		goto label;
 
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
index be38a93cedae..7bbdfc6d4552 100644
--- a/arch/riscv/lib/riscv_v_helpers.c
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -16,8 +16,11 @@
 #ifdef CONFIG_MMU
 size_t riscv_v_usercopy_threshold = CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD;
 int __asm_vector_usercopy(void *dst, void *src, size_t n);
+int __asm_vector_usercopy_sum_enabled(void *dst, void *src, size_t n);
 int fallback_scalar_usercopy(void *dst, void *src, size_t n);
-asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
+int fallback_scalar_usercopy_sum_enabled(void *dst, void *src, size_t n);
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n,
+				     bool enable_sum)
 {
 	size_t remain, copied;
 
@@ -26,7 +29,8 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 		goto fallback;
 
 	kernel_vector_begin();
-	remain = __asm_vector_usercopy(dst, src, n);
+	remain = enable_sum ? __asm_vector_usercopy(dst, src, n) :
+			      __asm_vector_usercopy_sum_enabled(dst, src, n);
 	kernel_vector_end();
 
 	if (remain) {
@@ -40,6 +44,7 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 	return remain;
 
 fallback:
-	return fallback_scalar_usercopy(dst, src, n);
+	return enable_sum ? fallback_scalar_usercopy(dst, src, n) :
+			    fallback_scalar_usercopy_sum_enabled(dst, src, n);
 }
 #endif
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 6a9f116bb545..4efea1b3326c 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -17,14 +17,43 @@ SYM_FUNC_START(__asm_copy_to_user)
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
-	tail enter_vector_usercopy
+	li	a3, 1
+	tail 	enter_vector_usercopy
 #endif
-SYM_FUNC_START(fallback_scalar_usercopy)
+SYM_FUNC_END(__asm_copy_to_user)
+EXPORT_SYMBOL(__asm_copy_to_user)
+SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
+EXPORT_SYMBOL(__asm_copy_from_user)
 
+SYM_FUNC_START(fallback_scalar_usercopy)
 	/* Enable access to user memory */
-	li t6, SR_SUM
-	csrs CSR_STATUS, t6
+	li	t6, SR_SUM
+	csrs 	CSR_STATUS, t6
+	mv 	t6, ra
 
+	call 	fallback_scalar_usercopy_sum_enabled
+
+	/* Disable access to user memory */
+	mv 	ra, t6
+	li 	t6, SR_SUM
+	csrc 	CSR_STATUS, t6
+	ret
+SYM_FUNC_END(fallback_scalar_usercopy)
+
+SYM_FUNC_START(__asm_copy_to_user_sum_enabled)
+#ifdef CONFIG_RISCV_ISA_V
+	ALTERNATIVE("j fallback_scalar_usercopy_sum_enabled", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
+	REG_L	t0, riscv_v_usercopy_threshold
+	bltu	a2, t0, fallback_scalar_usercopy_sum_enabled
+	li	a3, 0
+	tail 	enter_vector_usercopy
+#endif
+SYM_FUNC_END(__asm_copy_to_user_sum_enabled)
+SYM_FUNC_ALIAS(__asm_copy_from_user_sum_enabled, __asm_copy_to_user_sum_enabled)
+EXPORT_SYMBOL(__asm_copy_from_user_sum_enabled)
+EXPORT_SYMBOL(__asm_copy_to_user_sum_enabled)
+
+SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	/*
 	 * Save the terminal address which will be used to compute the number
 	 * of bytes copied in case of a fixup exception.
@@ -178,23 +207,12 @@ SYM_FUNC_START(fallback_scalar_usercopy)
 	bltu	a0, t0, 4b	/* t0 - end of dst */
 
 .Lout_copy_user:
-	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
 	li	a0, 0
 	ret
-
-	/* Exception fixup code */
 10:
-	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
 	sub a0, t5, a0
 	ret
-SYM_FUNC_END(__asm_copy_to_user)
-SYM_FUNC_END(fallback_scalar_usercopy)
-EXPORT_SYMBOL(__asm_copy_to_user)
-SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
-EXPORT_SYMBOL(__asm_copy_from_user)
-
+SYM_FUNC_END(fallback_scalar_usercopy_sum_enabled)
 
 SYM_FUNC_START(__clear_user)
 
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
index 7c45f26de4f7..03b5560609a2 100644
--- a/arch/riscv/lib/uaccess_vector.S
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -24,7 +24,18 @@ SYM_FUNC_START(__asm_vector_usercopy)
 	/* Enable access to user memory */
 	li	t6, SR_SUM
 	csrs	CSR_STATUS, t6
+	mv	t6, ra
 
+	call 	__asm_vector_usercopy_sum_enabled
+
+	/* Disable access to user memory */
+	mv 	ra, t6
+	li 	t6, SR_SUM
+	csrc	CSR_STATUS, t6
+	ret
+SYM_FUNC_END(__asm_vector_usercopy)
+
+SYM_FUNC_START(__asm_vector_usercopy_sum_enabled)
 loop:
 	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
 	fixup vle8.v vData, (pSrc), 10f
@@ -36,8 +47,6 @@ loop:
 
 	/* Exception fixup for vector load is shared with normal exit */
 10:
-	/* Disable access to user memory */
-	csrc	CSR_STATUS, t6
 	mv	a0, iNum
 	ret
 
@@ -49,4 +58,4 @@ loop:
 	csrr	t2, CSR_VSTART
 	sub	iNum, iNum, t2
 	j	10b
-SYM_FUNC_END(__asm_vector_usercopy)
+SYM_FUNC_END(__asm_vector_usercopy_sum_enabled)
-- 
2.49.0

