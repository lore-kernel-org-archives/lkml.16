Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B7219311
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747575543; cv=none; b=iK8ErA98SDAtgq/GHfCAbvWp3LG9U0/1Re6JZdAeNdCbYqNwe6nButN9qpDDLhkdRDopOOeIJEOK0D/PlSXmnwmU0SZVy5hjOKjekWC7PnGKq4mXdlvdxT1kO0VK4TwQujzoCi0gjTab0pupIgEOC2rlwXFPOBcfwZ7wOKK+6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747575543; c=relaxed/simple;
	bh=VcTY3ATs49wdmFeijGtBSwT2eDFNAmdiz8oLBVsqvsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7ZCjXM/Z1QbkGuB8u9iKjPg2TmASMaKRXGw6yMh2nTQGUFNGetX10yXExF8kLZRAxjv5GDdP4UNGQDvE/arPBJiKHuDX9GULzpOhTy+3O4KtID9T+8vdmvwTyhucqh6J1kyolc1tLbt9YzrKvDycf22raGyvaVlE5Nti2o8mT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5U001J9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5U001J9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36f26584bso71676f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747575540; x=1748180340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ff4zjuq6YR8BU4ZJhNeIt/UngqbNKAR/HUeaqnUWpSs=;
        b=H5U001J9A568LpowWhGb/JSKz7pUtovTDRQQQezXseh9H0cwO+O4T+igzUvJltKICs
         iz8mgm9eY4voHkAC8Zcfhyf+YLWuAtMRsMuMGZ4EMBSZsAuUXRat58JUg6oGiUIiGRjc
         YepE2SK/QOyZdvB8DfvtRaY+YXLSFcqr1v6LGJEoYxmnyYoLX5+NLt8dctjSpMngD7Nw
         dLxlLmAIzOOd7jKeFstG2ILwYJv0QYNVGzybXE46uT3djm1Y6ZkBPPvfvUxhwUZnO7e2
         ANRnjgsoafgo59ZDLLk1T0LqIV0h7PrmmpSN7SIZK/oLhIdyC9OTXgUlA4vCdA5jPVw/
         aBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747575540; x=1748180340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ff4zjuq6YR8BU4ZJhNeIt/UngqbNKAR/HUeaqnUWpSs=;
        b=m3qk8y5/y+QfbOb/ChkMLgJZflLFPQ3CpN2zQ3KnUAX7v3l6KLGga6SK5ZuuI/7zOS
         R/ngqP8CeTR3vEzwiJKfITrWxgeDC4SNBOCLjS6DomXPVAWbRGM/f5r7YnxD1uwo4Ir1
         erUKfAqyKLCLuP+sZYBSvRodEP21fvrZl2v6C4XYtes7Wk3BlxsXbLwGo3daSY1Ppgsj
         3UvWsXEmNrfiGtQpF61arLo+Jd0JcHsr2aNCZH/YAIhsJKbVBiyAdCH4q6yUqR6orOXO
         aMlbNLJ4FcZxDq/GLJtr0z4lVCn8/oqBuoLo12izzQNFq7BTaOwBUSQut1uNvipXvRA3
         Cv5g==
X-Forwarded-Encrypted: i=1; AJvYcCXf0mQcB9xlfkyN8kV1wHdGM3tIKMwbf1DfJfL6Gl6P8AdAt1RFzn4OxIt5sZVef7Sqgxj0xxAWefv0Egs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6uF8/jbWXfZXsmCDvJ388CqARcSOLR+Z+6e9DH32GCRrA2f+i
	pLexpebczSZmFISNYgfFDShF4plckBrtGfbAJYF8iFAPV0N0s8Kc6rw3
X-Gm-Gg: ASbGnctG1MULSsDwp/cN9ewrK1e4uJhQpnYQffH7dDsovnPsXuqmYs9/+6F/RA7roPs
	lwjk8X8chv4bnYFjKsey6cHf3JoBZTyi9UNiYgtxxjdCRZ6HpJDcwtNp2FaX2bue7DF/ajfH+oW
	ZaS/7PpZE8QK0+GZ9iSwinzJbzBRrmQyi8/K9ywsy6YmqiH1EGVElOvOfFt2JB8coY2eSonwxni
	znKdpvLc4N7jtu4YN0Sqi96N7Kvm7cqm5ADUSD09x/aJV42/8FMPiK+n8RHCWaUCyt2zg190zuK
	EaXqag+XXkzNxgVi9Aaz7avWJCj5hmKrPs0uQQ3UnRmdV/bkSqRlaZiEdJ3CnXy7p+lP03Eu9Pe
	FP8pUkAbEqNnUOn6w2iY6eFno/abjZEx5
X-Google-Smtp-Source: AGHT+IE6HIuFs5i40XK9rYYMZBxnHklain7m6LQ4pUyx98ocCo1SNY0WkHtjlOyWTrjT3YtpA8WvaA==
X-Received: by 2002:a05:6000:2ae:b0:3a1:f655:c5b2 with SMTP id ffacd0b85a97d-3a3600da099mr7842194f8f.39.1747575539699;
        Sun, 18 May 2025 06:38:59 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a7d6sm9429508f8f.30.2025.05.18.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 06:38:59 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 next 3/4] lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
Date: Sun, 18 May 2025 14:38:47 +0100
Message-Id: <20250518133848.5811-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518133848.5811-1-david.laight.linux@gmail.com>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
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
Changes for v2 (formally patch 1/3):
- Reinstate the early call to div64_u64() on 32bit when 'c' is zero.
  Although I'm not convinced the path is common enough to be worth
  the two ilog2() calls.

 arch/x86/include/asm/div64.h | 19 ++++++++++-----
 include/linux/math64.h       | 45 +++++++++++++++++++++++++++++++++++-
 lib/math/div64.c             | 21 ++++++++++-------
 3 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
index 9931e4c7d73f..7a0a916a2d7d 100644
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
+		asm ("mulq %2; addq %3, %%rax; adcq $0, %%rdx; divq %4"
+			: "=a" (q)
+			: "a" (a), "rm" (mul), "rm" (add), "rm" (div)
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
index 6aaccc1626ab..e1c2e3642cec 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -282,7 +282,50 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
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
+
 
 /**
  * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rounded up
diff --git a/lib/math/div64.c b/lib/math/div64.c
index c426fa0660bc..66bfb6159f02 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -183,29 +183,31 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 }
 EXPORT_SYMBOL(iter_div_u64_rem);
 
-#ifndef mul_u64_u64_div_u64
-u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
+#ifndef mul_u64_add_u64_div_u64
+u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
 	/* Trigger exception if divisor is zero */
 	BUG_ON(!d);
 
-	if (ilog2(a) + ilog2(b) <= 62)
-		return div64_u64(a * b, d);
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
@@ -215,6 +217,9 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 
 #endif
 
+	if (!n_hi)
+		return div64_u64(n_lo, d);
+
 	int shift = __builtin_ctzll(d);
 
 	/* try reducing the fraction in case the dividend becomes <= 64 bits */
@@ -261,5 +266,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 
 	return res;
 }
-EXPORT_SYMBOL(mul_u64_u64_div_u64);
+EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
 #endif
-- 
2.39.5

