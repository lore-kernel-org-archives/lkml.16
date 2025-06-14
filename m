Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2349257458
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894862; cv=none; b=V8w48A4ET+tGNcW+XnbuzzD728TM7KTY3zLmlr+/mPu7qkmg2SaqhGHoFg2v5Ier/l82IXNe7IHXBiHlR5Uc9jmMS150UIZtSRogJmXB2DR440N1T4qxAPaT5p10jzGtaVbm26X/pSRaYttFsKgt86TbbDLGdLE1b882Zwm+e7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894862; c=relaxed/simple;
	bh=dG1ssyasJyjtU9vkTNfZ76hCjcwYZKPPRGfq5YfvYE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jSes3gp2Q2It59Hs3blB+WdNTI09nW2dDJkqG76bpRaom8QEkXg5XuPJap+iWQUvuErAVP9W3e6aPXNvDygSW5zP6IpFJYhKUL1DGQfEQCffCIi4GdPelbjWtn+6MJnA4qSiCCr9ruYgiWezChYRdMNmKB8kFubCRz4snbm8Kh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3pjECzx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3pjECzx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so19355805e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894857; x=1750499657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6AwblgqjFfv250dWTS4cP7IPuV5Z5gc9JjcTsPRvzc=;
        b=j3pjECzxlyD9nvIYyqUjJHpL3t13+BHSy+Rj4cuvnpEBotGNdYZ0pBD/PpWIYlBz7o
         zqEjvB5cu7WBDpyfFDiqEJLvMNjWyNlROWo/ZoXjrLobd210m/xLEsXt5fG+F3zt1ZgP
         dponcy0RyOzQuQscCc/rwy7y0M+WGRKZaFsJnKlv+QSMnYNxJoscJQTUoLP0Iz79Hj0q
         XdispHWfxsjybsJtZvPpcX/0gA59xxkBdRONT2/kIoszyVL58w6/scfBfU1k51hj6brj
         +Y+R3wP4aUPeSGnxgU7FCUEaLGatwMyHCkAB3492a/BQ+bj9tzGxow59USeWSXKPNv7K
         Es2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894857; x=1750499657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6AwblgqjFfv250dWTS4cP7IPuV5Z5gc9JjcTsPRvzc=;
        b=Jbx06ucRkpF2p7pBneB4cLFJEhXDZA58X2KTF5lM1kTs/Rl5ml76tNReAbrCmPbYkn
         H7Bdnrbda4EabRxyXhtCa+NyWmDnOIAWg+DNEwl/T3E6YAxQ4Mzu1cFjuJl5sEriWAc7
         kVqB0Eq939LjsWFm3rKaNQQ9rWhiu6RbmOilEd8ixmtQHoQFi47YIjhg4KW1Mmc4SizZ
         9VCz6hmtYaCjcN+JASrIQHNjLqvecy0cuHFdyblTjYDKwmVRP3CgIW6y0qJSp8mQyTtM
         PtYN2P2o36J+AHshPV35Lrth9RV6rr8S8xsSzH4nc04666Rp4S2+02JelslprYkH8srk
         hqlg==
X-Forwarded-Encrypted: i=1; AJvYcCXT1yje4fkPoMDppMvj4qLZ3ZA4xm6xY9/CikUTEZJHOnQjm/sUzP0Gxj8lQ3oagjC7LEqhe+64gWcji+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAk2kWd9aJ7ypdBI25HbhbqqwrmVzbul3ah3Yf7uUukgwgc+S3
	MjRQRS0QyU3AbmixAUI9VtdxYYIjXOafNGG0rmwgLz+Dbrh8JMUtrHSx
X-Gm-Gg: ASbGncuVfn6+alk7lFo0T8SfCExxLfXeTMI3WnjCnrBqBCyRxVNGmcZB2OWb5cU5F/4
	/KhvSI/wUaFCWzCWqx1GLs4COVjyA78WiFL002lewI2IgTKqLYfqOscRzOkC0laOQ8k3nrffu+F
	WfvDaTDI91mZAUqDxnAv0rWOTqqrprOACfeB9Rzdp+qIIfTz80eFQXgXiE+ff2qgqX1F+NNzT9w
	B/6WNO4OzPxCKG/rdKFSL4zKGfwOEnt6QSyNfDTm7f11mAbFUvzTneTvyakXKx9DOcz8gPRFP9b
	V5BSAO8qXqmc7uBZ0vleguw2EEavk6pbsOblvEsTY7BUOmXqYHD717lEuOJiIx/bJa4v8ucmXxS
	8DdYjdpBTXVaLhkLNt1CQvDZNV1gXGdFoiYB4rwZEQg4=
X-Google-Smtp-Source: AGHT+IEcPZHfQsXkx6bHbhcM9iJSTKc3QJHEBv91uXTk4MUcoIJLLMnTTk/gpFeBWs1ggfq173oF0Q==
X-Received: by 2002:a05:600c:3505:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-4533cadf55emr25556665e9.6.1749894857099;
        Sat, 14 Jun 2025 02:54:17 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:16 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the divide code
Date: Sat, 14 Jun 2025 10:53:45 +0100
Message-Id: <20250614095346.69130-10-david.laight.linux@gmail.com>
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

Replace the bit by bit algorithm with one that generates 16 bits
per iteration on 32bit architectures and 32 bits on 64bit ones.

On my zen 5 this reduces the time for the tests (using the generic
code) from ~3350ns to ~1000ns.

Running the 32bit algorithm on 64bit x86 takes ~1500ns.
It'll be slightly slower on a real 32bit system, mostly due
to register pressure.

The savings for 32bit x86 are much higher (tested in userspace).
The worst case (lots of bits in the quotient) drops from ~900 clocks
to ~130 (pretty much independant of the arguments).
Other 32bit architectures may see better savings.

It is possibly to optimise for divisors that span less than
__LONG_WIDTH__/2 bits. However I suspect they don't happen that often
and it doesn't remove any slow cpu divide instructions which dominate
the result.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

new patch for v3.

 lib/math/div64.c | 124 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 87 insertions(+), 37 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index fb77fd9d999d..bb318ff2ad87 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -221,11 +221,37 @@ static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)
 
 #endif
 
+#ifndef BITS_PER_ITER
+#define BITS_PER_ITER (__LONG_WIDTH__ >= 64 ? 32 : 16)
+#endif
+
+#if BITS_PER_ITER == 32
+#define mul_u64_long_add_u64(p_lo, a, b, c) mul_u64_u64_add_u64(p_lo, a, b, c)
+#define add_u64_long(a, b) ((a) + (b))
+
+#else
+static inline u32 mul_u64_long_add_u64(u64 *p_lo, u64 a, u32 b, u64 c)
+{
+	u64 n_lo = mul_add(a, b, c);
+	u64 n_med = mul_add(a >> 32, b, c >> 32);
+
+	n_med = add_u64_u32(n_med, n_lo >> 32);
+	*p_lo = n_med << 32 | (u32)n_lo;
+	return n_med >> 32;
+}
+
+#define add_u64_long(a, b) add_u64_u32(a, b)
+
+#endif
+
 u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
-	u64 n_lo, n_hi;
+	unsigned long d_msig, q_digit;
+	unsigned int reps, d_z_hi;
+	u64 quotient, n_lo, n_hi;
+	u32 overflow;
 
 	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
 		      __func__, a, b, c )) {
 		/*
 		 * Return 0 (rather than ~(u64)0) because it is less likely to
@@ -243,46 +269,70 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 		      __func__, a, b, c, n_hi, n_lo, d))
 		return ~(u64)0;
 
-	int shift = __builtin_ctzll(d);
-
-	/* try reducing the fraction in case the dividend becomes <= 64 bits */
-	if ((n_hi >> shift) == 0) {
-		u64 n = shift ? (n_lo >> shift) | (n_hi << (64 - shift)) : n_lo;
-
-		return div64_u64(n, d >> shift);
-		/*
-		 * The remainder value if needed would be:
-		 *   res = div64_u64_rem(n, d >> shift, &rem);
-		 *   rem = (rem << shift) + (n_lo - (n << shift));
-		 */
+	/* Left align the divisor, shifting the dividend to match */
+	d_z_hi = __builtin_clzll(d);
+	if (d_z_hi) {
+		d <<= d_z_hi;
+		n_hi = n_hi << d_z_hi | n_lo >> (64 - d_z_hi);
+		n_lo <<= d_z_hi;
 	}
 
-	/* Do the full 128 by 64 bits division */
-
-	shift = __builtin_clzll(d);
-	d <<= shift;
-
-	int p = 64 + shift;
-	u64 res = 0;
-	bool carry;
+	reps = 64 / BITS_PER_ITER;
+	/* Optimise loop count for small dividends */
+	if (!(u32)(n_hi >> 32)) {
+		reps -= 32 / BITS_PER_ITER;
+		n_hi = n_hi << 32 | n_lo >> 32;
+		n_lo <<= 32;
+	}
+#if BITS_PER_ITER == 16
+	if (!(u32)(n_hi >> 48)) {
+		reps--;
+		n_hi = add_u64_u32(n_hi << 16, n_lo >> 48);
+		n_lo <<= 16;
+	}
+#endif
 
-	do {
-		carry = n_hi >> 63;
-		shift = carry ? 1 : __builtin_clzll(n_hi);
-		if (p < shift)
-			break;
-		p -= shift;
-		n_hi <<= shift;
-		n_hi |= n_lo >> (64 - shift);
-		n_lo <<= shift;
-		if (carry || (n_hi >= d)) {
-			n_hi -= d;
-			res |= 1ULL << p;
+	/* Invert the dividend so we can use add instead of subtract. */
+	n_lo = ~n_lo;
+	n_hi = ~n_hi;
+
+	/*
+	 * Get the most significant BITS_PER_ITER bits of the divisor.
+	 * This is used to get a low 'guestimate' of the quotient digit.
+	 */
+	d_msig = (d >> (64 - BITS_PER_ITER)) + 1;
+
+	/*
+	 * Now do a 'long division' with BITS_PER_ITER bit 'digits'.
+	 * The 'guess' quotient digit can be low and BITS_PER_ITER+1 bits.
+	 * The worst case is dividing ~0 by 0x8000 which requires two subtracts.
+	 */
+	quotient = 0;
+	while (reps--) {
+		q_digit = (unsigned long)(~n_hi >> (64 - 2 * BITS_PER_ITER)) / d_msig;
+		/* Shift 'n' left to align with the product q_digit * d */
+		overflow = n_hi >> (64 - BITS_PER_ITER);
+		n_hi = add_u64_u32(n_hi << BITS_PER_ITER, n_lo >> (64 - BITS_PER_ITER));
+		n_lo <<= BITS_PER_ITER;
+		/* Add product to negated divisor */
+		overflow += mul_u64_long_add_u64(&n_hi, d, q_digit, n_hi);
+		/* Adjust for the q_digit 'guestimate' being low */
+		while (overflow < 0xffffffff >> (32 - BITS_PER_ITER)) {
+			q_digit++;
+			n_hi += d;
+			overflow += n_hi < d;
 		}
-	} while (n_hi);
-	/* The remainder value if needed would be n_hi << p */
+		quotient = add_u64_long(quotient << BITS_PER_ITER, q_digit);
+	}
 
-	return res;
+	/*
+	 * The above only ensures the remainder doesn't overflow,
+	 * it can still be possible to add (aka subtract) another copy
+	 * of the divisor.
+	 */
+	if ((n_hi + d) > n_hi)
+		quotient++;
+	return quotient;
 }
 #if !defined(test_mul_u64_add_u64_div_u64)
 EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
-- 
2.39.5

