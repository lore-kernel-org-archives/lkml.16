Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4301E411C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894860; cv=none; b=fxQYy9xEAlXKuh5h/O/VwUiLy6KnLjllALlUyrk6bis6DyPgE1LTDtl+I8OBeBonjnpJ10AsG7DOeYWsNj6g7dn2HC59L94KOYJJ+ByL+0W/4RyqirBIHTUU/Zrd1l1b/aNrzRrj+bM/qDo9RQzC38nG2gQAwmnZVMPqasWylN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894860; c=relaxed/simple;
	bh=f6VoYaziB6JRa0uECDBQhDG51vS3VudPWkMC9wC2bFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JYtfOgB+Wb85O396WzI7X0QEzaO0vF02bUYU97BhBaVlBMdh4jxJbiPMg7JgGPWVgxll/paaP4RrsvNKHWKSY560wGyTE1/Gy+YepxQbXKvjJzOYx16cdzfaDtEvPaFaT5jKAl3BRWpG5Dm7vtsua5L+7f6hoGlsOJeRrKWs5x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjvD9Jwi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjvD9Jwi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d3f72391so35717205e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894857; x=1750499657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsjJMTsptJdgGk7nbEvhtT2Jyi35Ikr94jQB9Jmrevg=;
        b=JjvD9JwilNhEtHFP3Ry5xHFCM7h0OxPSFjLbrEj3auFk7SSN7VRnQe0pYbapr1uFsY
         RcpCOLsnKWUA+w8Baeu1xmWL489LQYAtGwk95KTTCwN8H4I6U40NkeaENm2CLQbqiYg3
         SFZrKWX6Sn8iWiY5YO8hr5mA/X7jtYXlReksnKRhCiYBbjxs2X7yAK+eFVqmQ57q4tY1
         p4mtW9RjkiT5Nco+cAzY8p95filpT21piqoLvhkCOh9+PPSKcfp1eiv7i7i8+1vcxG03
         EdW5/JXb5PLaS8dbSoVtgepVg7HYpo2SGat1lJA8cJRIhbvzujJ5Vcf3sOrOTdz5ZbVU
         1zQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894857; x=1750499657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsjJMTsptJdgGk7nbEvhtT2Jyi35Ikr94jQB9Jmrevg=;
        b=rWTt9nFzMtAX9qVzZQ4uDWMjpbYFvTgiVHFdLt3pud1C+/y9XIFcsQkBELqD+A4H3b
         Dv2eVn6ZTH71UVJMzdq5a7LV85PHCalF7Sv9FYRAA6FR+W/TWiJFDOJXbPn+44SKU8Qd
         PZxEHM2IzLH3Q/+hHM7P/XSpPwCBJUjJ5gVs1Wv39lpN+IYj6WefMaQJTddz6pWAcoQi
         7kmArc//7XbQrl1OYTxdzbRNK5HB0HQ9cZGwOp0a9JAhDag3mGBPef24DjWGski7qCLS
         NvuIr8Npv/UYjmKUtWLEy4p2U+D5M1E1MXxlm+4g+62f8aDCFLVl1BifZgbEIrGEZD3E
         evUA==
X-Forwarded-Encrypted: i=1; AJvYcCV+/inT1UTTKZPv63wIXk1HTwsN+jnMcLXX73D1fsJ5MWFh+/e595wyyviznTJhVizktiOwxDJK2CCKjm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh2br2K4svil/Kq/OQO08Gkgn1tIMpPiq5wuLL2CorPcukldCP
	zFuOe2lKXvBsudD0wjYMsCwN8gQ9UmisC4oDOE++Nb12NrT0GucjdNz9
X-Gm-Gg: ASbGnctkuYp8d8icd6uFvdbFZu9J9hY08v8BMME33LMxaCL/XYFUuSw1gV+4sAv7BtY
	TRukwpHWkDHGjLKwisfmfjI2+Zds/S56iERXcxj65fcZC8oJREGd6PYEGhJnSMQhvKEHq04gsNc
	I8w8l5cp/LcajUUmxE51gbkbay1ot/BdcahY582RF24Et77BcWmXEOlwuEU7zOTyh+/M0qNfIbl
	0gRLHuRahklSCa++1jOQzALQYiHAf7NNCBBcSImuKv8Rn78wruTzwzn4VenOnvkjUNISNydKXfm
	5DWfJ8XheXPcGaeqjZ1z8LCJEslq85LWksgQW9afhPD+Z/CvyFztZO8o2ikLGl7I1Ae23oLE8Qf
	uecXgCZX5i/gjenTbR8V4ON2LgrXsM5APFceCj8OC7Jk=
X-Google-Smtp-Source: AGHT+IERN1ooEDtZI6VI3kgNKHhz6VB6qACq35VnuE44l1ar0jAEXBqaRGMQvyFsmn+R4Vr0Ne5rgw==
X-Received: by 2002:a05:600c:1c1b:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-4533cab8332mr26434225e9.17.1749894856577;
        Sat, 14 Jun 2025 02:54:16 -0700 (PDT)
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
Subject: [PATCH v3 next 08/10] lib: mul_u64_u64_div_u64() Separate multiply to a helper for clarity
Date: Sat, 14 Jun 2025 10:53:44 +0100
Message-Id: <20250614095346.69130-9-david.laight.linux@gmail.com>
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

Move the 64x64 => 128 multiply into a static inline helper function
for code clarity.
No need for the a/b_hi/lo variables, the implicit casts on the function
calls do the work for us.
Should have minimal effect on the generated code.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

new patch for v3.

 lib/math/div64.c | 54 +++++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 2ac7e25039a1..fb77fd9d999d 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -193,42 +193,48 @@ static u64 mul_add(u32 a, u32 b, u32 c)
 	return add_u64_u32(mul_u32_u32(a, b), c);
 }
 
-u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
-{
-	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
-		      __func__, a, b, c)) {
-		/*
-		 * Return 0 (rather than ~(u64)0) because it is less likely to
-		 * have unexpected side effects.
-		 */
-		return 0;
-	}
-
 #if defined(__SIZEOF_INT128__) && !defined(test_mul_u64_add_u64_div_u64)
-
+static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)
+{
 	/* native 64x64=128 bits multiplication */
 	u128 prod = (u128)a * b + c;
-	u64 n_lo = prod, n_hi = prod >> 64;
 
-#else
+	*p_lo = prod;
+	return prod >> 64;
+}
 
-	/* perform a 64x64=128 bits multiplication manually */
-	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
+#else
+static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)
+{
+	/* perform a 64x64=128 bits multiplication in 32bit chunks */
 	u64 x, y, z;
 
 	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
-	x = mul_add(a_lo, b_lo, c);
-	y = mul_add(a_lo, b_hi, c >> 32);
+	x = mul_add(a, b, c);
+	y = mul_add(a, b >> 32, c >> 32);
 	y = add_u64_u32(y, x >> 32);
-	z = mul_add(a_hi, b_hi, y >> 32);
-	y = mul_add(a_hi, b_lo, y);
-	z = add_u64_u32(z, y >> 32);
-	x = (y << 32) + (u32)x;
-
-	u64 n_lo = x, n_hi = z;
+	z = mul_add(a >> 32, b >> 32, y >> 32);
+	y = mul_add(a >> 32, b, y);
+	*p_lo = (y << 32) + (u32)x;
+	return add_u64_u32(z, y >> 32);
+}
 
 #endif
 
+u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
+{
+	u64 n_lo, n_hi;
+
+	if (WARN_ONCE(!d, "%s: division of (%llx * %llx + %llx) by zero, returning 0",
+		      __func__, a, b, c )) {
+		/*
+		 * Return 0 (rather than ~(u64)0) because it is less likely to
+		 * have unexpected side effects.
+		 */
+		return 0;
+	}
+
+	n_hi = mul_u64_u64_add_u64(&n_lo, a, b, c);
 	if (!n_hi)
 		return div64_u64(n_lo, d);
 
-- 
2.39.5

