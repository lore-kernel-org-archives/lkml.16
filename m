Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3FB1D54D1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894858; cv=none; b=qZRZUmHJW8RTJKdzvyVFUG2DI5MlWdHW8eS17CgA6TCMNCi+6tlbRsMovXNWWetND0PmaJmwOOsa9dGTLmEod06Wrf5YVYAmNn5h8/gMKmSg5mfTdRSEMf/Fb37uWdwQhEO6HmmYQh6ipD61w91JhzYWO0yjDYZmaw+S8zB4cKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894858; c=relaxed/simple;
	bh=V5A8c4F+Anra4BnQo+Mv9DZzO6ZTA0M1l0EhuD5TBgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eYdNA1sjXD8J1k+vBMrreIVe275CQR64phmYbHkW0UuCOR3xkpTPcrE+mjd3L+NYsH67h1Yd6hmtDJUGNUj9pc+rZQvWGAAUtBMxgDTtw8mGCdLAKizSdLxU+cNnX9ohKnJYzg16yx96rBkzvwt+aCd59UpajuHhJQrrig+NQfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkLE41Gd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkLE41Gd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so22620715e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894855; x=1750499655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRv07B3uuhx1oL47u14W0Ds8EkcLpM2/A7/p5FHeIT8=;
        b=DkLE41GdHMH1XJo+NfcUH5JjEAFNYIHUY9b0GhSR8JDjMxBHn2rXeqUyQdfHJJYQBh
         CcFXk8hNdp1DLQyuoern3LX1foKWPU2dBs1e6NzIb6GEmAzC/WOZjA/s4YVmTdiWmf7e
         bFb994HoJPsOWlQTZRk8/Qgwx4Wewp9njOPypGU1tmXCubfOZam8fHDfKeBTmpNA4rwu
         nVU9J/AtysLJb/1lDXEZzXPYlzu9Vu4HH/flAHvsyN/TD7/CvpMhAxQ/4ReJi5O534+s
         aCQXd/CpYKMlsw6te2gvvIVGj1aG7UvJC3XYkYIO6R7SbGf6e4+wOgav56/8YlI8jc4s
         AHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894855; x=1750499655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRv07B3uuhx1oL47u14W0Ds8EkcLpM2/A7/p5FHeIT8=;
        b=M24H6o/16p1Pd1W5MOVtDtAUcjjFUUPErAD5gpGWonuZHKjV5a9gvPMjbi/lKQb2ea
         50IGtMVRbfONSVLW+fYPQgEf+pp23LYTDOx+mH2Q0iN/IalRZ6XJ451qJxyt0ldW7CcO
         nrgV/myYPn5ySpvbl66CYyUwhwZ+cndlC0qglpQrKeSk4ZkEyfxWvUuDoCA7MG6QOMhT
         FVd1ji6bJKvbCsJ29s04OT7m2nb9LsA0U7n8jnV1Z/A030SL7KQnqqRsTI2hfBz759lB
         BdCr/hixIrGaO8z+7C04DhL6WTP+OPlhoEVd6N5VuVAnzvXhrIFoWLWg59vn3pLZRwb9
         VrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6rvNQ67dE5EaPH1IBHoDINGjTpddsJW2mP1OZNd+PFaqveTgzDXo+VhbVUwZG7seQNiRiwTSdU6fYAJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbItNlqmOxbgqPkeAAItJWzTl9mTREy/1ZEwWvfdtNMyeMcNl1
	pf6mKCy5iZXGlBFmf4NGwDjK4Rpbafg9fISmLrQfFeXUolwnOCkfvnihb8R0EQ==
X-Gm-Gg: ASbGncuSqzb11+7On/g76aDlQ5I7q38t+sDi7POi1KqEPdtrsxjReel4tW8WLgF1Iqc
	V9Tb5HNAnzP6uca4UQATPAcjV/CFZQfV05KB+MO5LjHvRFRemjj0AEkyNWY9yYQymhlJyWCm8st
	B0X6bHwSZuW9/HkcVviWQ+NGIy1crydLOgrLhPNqzUnjjS2FFjoPynRUWWP6z5UIAkn3qziDhZ4
	9+7DIJ9GkUjC6cIjpj4LyZaJM/PpR0Z5oG2KhUsPoxYNCrJ7ofdsLCywaCrqYcfkRy/4dpKoNVf
	5QQ5tE+sXYvENXazDSX6qx6tH6Ai9RuA7OnTZWsSN/PuhPE8+glk3eWXdBcGMY45rp798XBn6X3
	Su7p3bdI9fFwcM6limdNBLF9aqMupkhqmwZucmsKddsM=
X-Google-Smtp-Source: AGHT+IF3OOcl+tXXUMMYOpw+OOYGfeCIfuL1vnnTOB42visF2nbrl9E8AE5w/J9WjsQF4BZyPVK+zw==
X-Received: by 2002:a05:600c:1f94:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-4533ca54b90mr36464145e9.10.1749894854533;
        Sat, 14 Jun 2025 02:54:14 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:14 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 04/10] lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
Date: Sat, 14 Jun 2025 10:53:40 +0100
Message-Id: <20250614095346.69130-5-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250614095346.69130-1-david.laight.linux@gmail.com>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
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

Add kerndoc definitions for all three functions.

Signed-off-by: David Laight <david.laight.linux@gmail.com>

Changes for v2 (formally patch 1/3):
- Reinstate the early call to div64_u64() on 32bit when 'c' is zero.
  Although I'm not convinced the path is common enough to be worth
  the two ilog2() calls.

Changes for v3 (formally patch 3/4):
- The early call to div64_u64() has been removed by patch 3.
  Pretty much guaranteed to be a pessimisation.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 arch/x86/include/asm/div64.h | 19 ++++++++++-----
 include/linux/math64.h       | 45 +++++++++++++++++++++++++++++++++++-
 lib/math/div64.c             | 22 ++++++++++--------
 3 files changed, 69 insertions(+), 17 deletions(-)

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
@@ -282,7 +282,53 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
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
+ * Generic code returns 0 if @d is zero and ~0 if the quotient exceeds 64 bits.
+ * Architecture specific code may trap on zero or overflow.
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
+ * Generic code returns 0 if @d is zero and ~0 if the quotient exceeds 64 bits.
+ * Architecture specific code may trap on zero or overflow.
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
+ * Generic code returns 0 if @d is zero and ~0 if the quotient exceeds 64 bits.
+ * Architecture specific code may trap on zero or overflow.
+ *
+ * Return: (@a * @b + @d - 1) / @d
+ */
+#define mul_u64_u64_div_u64_roundup(a, b, d) \
+	({ u64 _tmp = (d); mul_u64_add_u64_div_u64(a, b, _tmp - 1, _tmp); })
+
 
 /**
  * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rounded up
diff --git a/lib/math/div64.c b/lib/math/div64.c
index ed9475b9e1ef..7850cc0a7596 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -184,11 +184,11 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 }
 EXPORT_SYMBOL(iter_div_u64_rem);
 
-#ifndef mul_u64_u64_div_u64
-u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
+#ifndef mul_u64_add_u64_div_u64
+u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
-	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx) by zero, returning 0",
-		      __func__, a, b)) {
+	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
+		      __func__, a, b, c)) {
 		/*
 		 * Return 0 (rather than ~(u64)0) because it is less likely to
 		 * have unexpected side effects.
@@ -199,7 +199,7 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 #if defined(__SIZEOF_INT128__)
 
 	/* native 64x64=128 bits multiplication */
-	u128 prod = (u128)a * b;
+	u128 prod = (u128)a * b + c;
 	u64 n_lo = prod, n_hi = prod >> 64;
 
 #else
@@ -208,8 +208,10 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
 	u64 x, y, z;
 
-	x = (u64)a_lo * b_lo;
-	y = (u64)a_lo * b_hi + (u32)(x >> 32);
+	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
+	x = (u64)a_lo * b_lo + (u32)c;
+	y = (u64)a_lo * b_hi + (u32)(c >> 32);
+	y += (u32)(x >> 32);
 	z = (u64)a_hi * b_hi + (u32)(y >> 32);
 	y = (u64)a_hi * b_lo + (u32)y;
 	z += (u32)(y >> 32);
@@ -223,8 +225,8 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 		return div64_u64(n_lo, d);
 
 	if (WARN_ONCE(n_hi >= d,
-		      "%s: division of (%#llx * %#llx = %#llx%016llx) by %#llx overflows, returning ~0",
-		      __func__, a, b, n_hi, n_lo, d))
+		      "%s: division of (%#llx * %#llx + %#llx = %#llx%016llx) by %#llx overflows, returning ~0",
+		      __func__, a, b, c, n_hi, n_lo, d))
 		return ~(u64)0;
 
 	int shift = __builtin_ctzll(d);
@@ -268,5 +270,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 
 	return res;
 }
-EXPORT_SYMBOL(mul_u64_u64_div_u64);
+EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
 #endif
-- 
2.39.5

