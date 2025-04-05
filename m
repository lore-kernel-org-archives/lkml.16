Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9425771
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743885951; cv=none; b=a1T3VE39sdIj9sSj/2TPC/1m5Ryj7BfqO1Je8TgFOGoUA/5ByIjh7WahHaICmfnhmVfVjMEvyD1udgSDQyHJqpTUintYON5xFGOjxqhlA3rqTELehylGocEtxWk2sckRcHM1rEol7gNpQydE/D90l7T+6S0HZHuKYyghaPieUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743885951; c=relaxed/simple;
	bh=s9r26I+RGKj7rY8vb7pTzw6SeJlgrigg6Nh5273WfiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7ussTK98eDkYTpUc5nLu5lTTosx0Ysvzu/eX2lJzDv1LU2xdmAn41EoeF/iWCYSAoSpMviHsxivqO9izlHNaZhPwmH3Qn81akMn0yAJ46fob7UedfEEyTGuEbbk4fT3VA+jlqS3XBN6UPBIvSwe1gH3zweJBvML+0SMl1SCn/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1TnvrM6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1TnvrM6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso33722655e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 13:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743885947; x=1744490747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV2xeGslNntA8K4QBVE7zznhARoWcXM7uY7IPOStDHw=;
        b=J1TnvrM66WsPLoZ1WjgmaZOxae+hSCa+v758OqfRZ53cBAbKof2hEwnKFqUrSoGZ3k
         k7NRmnqMcXOGUjKCISYHaCS17hC6XXkJnk/k0r11SWvDMjm9CXPVCv1fOOr6EaqTjHzt
         ExvB6p24xzEXHxQ5drnhbK3ajf8V31GPZS7mfJdVz+V7s4NizINIKam+vkcd/E+x/PyG
         4vPC2ijruIKGm4edp8gDubayLdVYW+y1jaTvS3WG9GqBIR2Mkx2J3ZZ2R/EmtO7lNsTd
         DbfVFfiQB7Eg1OiJKM8XELAD0pTSdMSV1p7PQs184Ict5M7RqioARML0x5wdSOsDWQe+
         AI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743885947; x=1744490747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uV2xeGslNntA8K4QBVE7zznhARoWcXM7uY7IPOStDHw=;
        b=b2CTzB2SVQZyCGhVFThCy/lr7x4Mkreo/G+QZ+B7YARw/5dNgnafEs3hsvGM8DXBZi
         2ySnjapW0AOFVqqnVz+DcD9nQdC1ppo64PhAjXzXbGhRcpk9dHJ0DKPh4a6S34zhxxTJ
         BoP6HoIUiuGHOgJM8D7O7gURbWkFf4BGa88mHP+E2T5o0+4MsgPiqtpeZfbfWbR2ItYg
         wWltlAvUttJnMf7BdNSCE3T/LWGnptqgROMV4zScn0uDUmgeUhgI275hK0cdanUmkuAp
         fopSHOFcbJDWiE+SPesQEM1uUzZfR7fey7gEy9l3uW3xmgVIWDGopGXES6AywqusQws4
         79Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXqq3yvGBPVZCxwn2s2vDG8phaD8lMKmiuJckPKMzAxbFxC1b0f9f4KIHsf02ykl5OE+p9ijvTmEh12yUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvcNE5xMT+ZWCAJ/5khkLKcBkH0NSVM/BZYj+ptuipC03dipqo
	Eovljw55GccqFAJLFspHOHmnOgmfFMcQYDvs9CuM0QgYHcOczQBh
X-Gm-Gg: ASbGncsBzUCFAbmLRlg7OonqqnuhmGWjNX+ikIVY5wKnHqMkjc2ij7CpfyZGuCzTwGG
	CoWVQD53oRfnsRlEL+CArcO9VViD8KUEkU1TwvSthwqGd5+2uC6/lZxybXLG6QJX/MoBPYzkZIX
	qeyPHHSN20uUenXhiASW7pUSpID0Tdro/og+0z2EAMLuDlTwyCO+YMkf63NtrIihymiZncXAKGK
	wZTFU9BezJfCGJg7lwdkk99VRNVt76DtaGgtTfS9iGSTVBFKi3TFksNAAA7fUL11bLh5TPYc3wA
	dL4pVkCLSXlnwOGxDZFXWpBlgICcVIPm9aU2bPvzwAQRHX+aEJOfj4ggjrbKsG5uTQ4Useq3mg0
	20PlR6B29G9oMrfLrz0UZhDEnnw==
X-Google-Smtp-Source: AGHT+IF8mG42c0LiVysMf2k818lF8aU9BZSAuyxDy7T6VsEspcUcwgWHqWDfkHzpvqnuT8FlVKEAig==
X-Received: by 2002:a05:600c:5346:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43eda5d8460mr33465395e9.1.1743885947251;
        Sat, 05 Apr 2025 13:45:47 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ecasm8027042f8f.18.2025.04.05.13.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:45:46 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/3] lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
Date: Sat,  5 Apr 2025 21:45:28 +0100
Message-Id: <20250405204530.186242-2-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250405204530.186242-1-david.laight.linux@gmail.com>
References: <20250405204530.186242-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
variant needs 'divisor - 1' adding in between the multiply and
divide so cannot easily be done by a caller.

Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
and implement the 'round down' and 'round up' using it.

Update the x86-64 asm to optimise for 'c' being a constant zero.

For architectures that support u128 check for a 64bit product after
the multiply (will be cheap).
Leave in the early check for other architectures (mostly 32bit) when
'c' is zero to avoid the multi-part multiply.

Note that the cost of the 128bit divide will dwarf the rest of the code.
This function is very slow on everything except x86-64 (very very slow
on 32bit).

Add kerndoc definitions for all three functions.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 arch/x86/include/asm/div64.h | 19 +++++++++++-----
 include/linux/math64.h       | 44 +++++++++++++++++++++++++++++++++++-
 lib/math/div64.c             | 41 ++++++++++++++++++---------------
 3 files changed, 79 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
index 9931e4c7d73f..9322a35f6a39 100644
--- a/arch/x86/include/asm/div64.h
+++ b/arch/x86/include/asm/div64.h
@@ -84,21 +84,28 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
  * Will generate an #DE when the result doesn't fit u64, could fix with an
  * __ex_table[] entry when it becomes an issue.
  */
-static inline u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div)
+static inline u64 mul_u64_add_u64_div_u64(u64 a, u64 mul, u64 add, u64 div)
 {
 	u64 q;
 
-	asm ("mulq %2; divq %3" : "=a" (q)
-				: "a" (a), "rm" (mul), "rm" (div)
-				: "rdx");
+	if (statically_true(!add)) {
+		asm ("mulq %2; divq %3" : "=a" (q)
+					: "a" (a), "rm" (mul), "rm" (div)
+					: "rdx");
+	} else {
+		asm ("mulq %2; addq %4,%%rax; adcq $0,%%rdx; divq %3"
+			: "=a" (q)
+			: "a" (a), "rm" (mul), "rm" (div), "rm" (add)
+			: "rdx");
+	}
 
 	return q;
 }
-#define mul_u64_u64_div_u64 mul_u64_u64_div_u64
+#define mul_u64_add_u64_div_u64 mul_u64_add_u64_div_u64
 
 static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 div)
 {
-	return mul_u64_u64_div_u64(a, mul, div);
+	return mul_u64_add_u64_div_u64(a, mul, 0, div);
 }
 #define mul_u64_u32_div	mul_u64_u32_div
 
diff --git a/include/linux/math64.h b/include/linux/math64.h
index 6aaccc1626ab..e958170e64ab 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -282,7 +282,49 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
 }
 #endif /* mul_u64_u32_div */
 
-u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
+/**
+ * mul_u64_add_u64_div_u64 - unsigned 64bit multiply, add, and divide
+ * @a: first unsigned 64bit multiplicand
+ * @b: second unsigned 64bit multiplicand
+ * @c: unsigned 64bit addend
+ * @d: unsigned 64bit divisor
+ *
+ * Multiply two 64bit values together to generate a 128bit product
+ * add a third value and then divide by a fourth.
+ * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
+ *
+ * Return: (@a * @b + @c) / @d
+ */
+u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d);
+
+/**
+ * mul_u64_u64_div_u64 - unsigned 64bit multiply and divide
+ * @a: first unsigned 64bit multiplicand
+ * @b: second unsigned 64bit multiplicand
+ * @d: unsigned 64bit divisor
+ *
+ * Multiply two 64bit values together to generate a 128bit product
+ * and then divide by a third value.
+ * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
+ *
+ * Return: @a * @b / @d
+ */
+#define mul_u64_u64_div_u64(a, b, d) mul_u64_add_u64_div_u64(a, b, 0, d)
+
+/**
+ * mul_u64_u64_div_u64_roundup - unsigned 64bit multiply and divide rounded up
+ * @a: first unsigned 64bit multiplicand
+ * @b: second unsigned 64bit multiplicand
+ * @d: unsigned 64bit divisor
+ *
+ * Multiply two 64bit values together to generate a 128bit product
+ * and then divide and round up.
+ * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
+ *
+ * Return: (@a * @b + @d - 1) / @d
+ */
+#define mul_u64_u64_div_u64_roundup(a, b, d) \
+	({ u64 _tmp = (d); mul_u64_add_u64_div_u64(a, b, _tmp - 1, _tmp); })
 
 /**
  * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rounded up
diff --git a/lib/math/div64.c b/lib/math/div64.c
index 5faa29208bdb..50e025174495 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -183,26 +183,28 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 }
 EXPORT_SYMBOL(iter_div_u64_rem);
 
-#ifndef mul_u64_u64_div_u64
-u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
+#if !defined(mul_u64_add_u64_div_u64)
+u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
-	if (ilog2(a) + ilog2(b) <= 62)
-		return div64_u64(a * b, c);
-
 #if defined(__SIZEOF_INT128__)
 
 	/* native 64x64=128 bits multiplication */
-	u128 prod = (u128)a * b;
+	u128 prod = (u128)a * b + c;
 	u64 n_lo = prod, n_hi = prod >> 64;
 
 #else
 
+	if (!c && ilog2(a) + ilog2(b) <= 62)
+		return div64_u64(a * b, d);
+
 	/* perform a 64x64=128 bits multiplication manually */
 	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
 	u64 x, y, z;
 
-	x = (u64)a_lo * b_lo;
+	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
+	x = (u64)a_lo * b_lo + (u32)c;
 	y = (u64)a_lo * b_hi + (u32)(x >> 32);
+	y += (u32)(c >> 32);
 	z = (u64)a_hi * b_hi + (u32)(y >> 32);
 	y = (u64)a_hi * b_lo + (u32)y;
 	z += (u32)(y >> 32);
@@ -212,36 +214,39 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
 
 #endif
 
-	/* make sure c is not zero, trigger exception otherwise */
+	if (!n_hi)
+		return div64_u64(n_lo, d);
+
+	/* make sure d is not zero, trigger exception otherwise */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wdiv-by-zero"
-	if (unlikely(c == 0))
+	if (unlikely(d == 0))
 		return 1/0;
 #pragma GCC diagnostic pop
 
-	int shift = __builtin_ctzll(c);
+	int shift = __builtin_ctzll(d);
 
 	/* try reducing the fraction in case the dividend becomes <= 64 bits */
 	if ((n_hi >> shift) == 0) {
 		u64 n = shift ? (n_lo >> shift) | (n_hi << (64 - shift)) : n_lo;
 
-		return div64_u64(n, c >> shift);
+		return div64_u64(n, d >> shift);
 		/*
 		 * The remainder value if needed would be:
-		 *   res = div64_u64_rem(n, c >> shift, &rem);
+		 *   res = div64_u64_rem(n, d >> shift, &rem);
 		 *   rem = (rem << shift) + (n_lo - (n << shift));
 		 */
 	}
 
-	if (n_hi >= c) {
+	if (n_hi >= d) {
 		/* overflow: result is unrepresentable in a u64 */
 		return -1;
 	}
 
 	/* Do the full 128 by 64 bits division */
 
-	shift = __builtin_clzll(c);
-	c <<= shift;
+	shift = __builtin_clzll(d);
+	d <<= shift;
 
 	int p = 64 + shift;
 	u64 res = 0;
@@ -256,8 +261,8 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
 		n_hi <<= shift;
 		n_hi |= n_lo >> (64 - shift);
 		n_lo <<= shift;
-		if (carry || (n_hi >= c)) {
-			n_hi -= c;
+		if (carry || (n_hi >= d)) {
+			n_hi -= d;
 			res |= 1ULL << p;
 		}
 	} while (n_hi);
@@ -265,5 +270,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
 
 	return res;
 }
-EXPORT_SYMBOL(mul_u64_u64_div_u64);
+EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
 #endif
-- 
2.39.5

