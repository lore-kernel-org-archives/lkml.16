Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3142B23D2A9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894860; cv=none; b=Yr7w96+f9+VUDG08rA+2G8B8azRczTX/u55fkI1Ue/i7tY8+EW6jsEwBeSJ8fArhXCBZhMGy9u2U96GZKE8tsB2ygGZ/SMvzncPdbaO+C8DAOfe+FmYfxijhc0XoMkhCwVpkdGfrHazCDzowsem/6kn9YV6uHz9Ncbp4i7a6RLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894860; c=relaxed/simple;
	bh=P7fZLPmZMmNJxuvvhuZX2hlKlRwIdsmOpsscv3/F8r4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lwBUprdA8Og9GlkMU8CsrRI//3+HLe0EH8WGnTMr7GvLV4ozd+TF2GXIKxQNOrFA8rtMBYswU2/1v0ugC5UvgS0hVJOUkPfTTnWmlQCwX8yBrYAn9dM415EseDimgS5Mu+8jwpq2Q/hr5afDV9tNr9W4hRBrpHKCQMqWFg8kwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCaEumiy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCaEumiy"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so2453000f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894856; x=1750499656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S6RWHkm8g4r7/EkPnCUIyR/CtOndR5cnePpxZF3FoU=;
        b=bCaEumiyWKjpGEE2orqlvWcENavtsPq/If6TKcmXopWsZhAHfQPDdiw3oEVEpjE2kK
         r/cs4nLQzAlCRrlt5fkiKeDf/RjR9CbmIHuvyIgjDhvUV43nayzar0xgacWpbbQ7V+No
         slz9UmvCyVptB/vxsfg0+HFzKoqEOYw3ZaVqb6itS4Yl4JTGUlR4A//JAtdUSqr4Ldhc
         P4SM4CKyxnkYkud0vW6LbWuTEEah584WEzso7f3DXrHiVpWybC1bTnFk0AScPl2LqR83
         xMIHi4lXjM5dSYtd2ucmOOBoDXasdyHQ91JPvRVzDd3/P8l0Nr8weccCFuXdVZk8r3nQ
         ieZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894856; x=1750499656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S6RWHkm8g4r7/EkPnCUIyR/CtOndR5cnePpxZF3FoU=;
        b=YLrxyH1mp9PuXT3v/ggrS0pEwnbIrvtc50FGLBkwWOr3lUhob67fngzWWxvEGdwCxA
         J7yvPi7UlGFF/VxwNbdrU8uMqwCVHY+Oj6sHvrb7wG9BCYkjSccZP/alsO9yCzK326Qg
         nN0C8bSSX3yONJP2N6viV+nOFiCshthYOFzRoTX8lY5KAkwB1+8DcuIosMGysyrZIo2n
         EvcfSQvPuaZBRHAvUJ4lSyiMgVft1z40lyxHaAxmdts/B3kBANcmC45FEc/qX1TOgdXv
         Znyv2DoinmUmo1KBxxtcix5ySrJtFCMr3sWbfRV/ozSfDUQJ/EVblBpqCEsOAZK5O/6Z
         1TcA==
X-Forwarded-Encrypted: i=1; AJvYcCWFyybMbAS6+bIfOpFk+si/b1ZDvYiftc4iteKl9KYIImgQ8n7u9DE7Sc5lLgU3y7oHnUAvocNCvcr1nkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwADmDWQYWEh7nLLZJAacgEvOMhc/gcxfsODvvPMTGz7G+MLbHf
	av248IkK2Iu5Z7VMba0NRWT7NTbw0QpAujXP0Xr7MGYavPBgWikfAnxG
X-Gm-Gg: ASbGnctfeZdMwfgzeBo+k4yy6UxozvRl7Dun9eJUruqTguCeM0IeCMvYDAuIkDVnEq8
	uKe4NBVZ4RB6GEE2StUr5AgFFiDdjGvzgjSSCbhabGAb+BZQh7x4x5Gq+hN57V4J9sE/NZ48S+0
	Jkv29vx8YTvysaUbyjo0DLnuuNuX0lQ+bVbR3Z/ukPv4NTlCgeOQ6J0tdJgZd/96aCxgOJLd5xc
	tNsRFAcoe0N8iDZ2wn2UkdTgUCBzj4SH/JBSdqgn+hQ3aXx7MKhNBbBFaCtfN4bO3hzqgMgCTrS
	U1CEJq47lbHDLCqFAaaem9pRVjGI9HlUS6UrNEZFtPQR0bDXIq+y7f/BU3gKeYdxk7igaE8Sv1j
	eiCf1z2qJrgEHC5+2tRzGSJ++1LJ0BN7hmZVWoMjO9io=
X-Google-Smtp-Source: AGHT+IERW2dM2HCSqWNUXKt0pJsjtju7uQZsZMFyYm9x1Il+B6p60Uts7Er67qVj3AGDBgeCxt1UXQ==
X-Received: by 2002:a5d:5f8f:0:b0:3a4:f439:e715 with SMTP id ffacd0b85a97d-3a572398eb0mr2599419f8f.9.1749894856099;
        Sat, 14 Jun 2025 02:54:16 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:15 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 07/10] lib: mul_u64_u64_div_u64() optimise multiply on 32bit x86
Date: Sat, 14 Jun 2025 10:53:43 +0100
Message-Id: <20250614095346.69130-8-david.laight.linux@gmail.com>
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

gcc generates horrid code for both ((u64)u32_a * u32_b) and (u64_a + u32_b).
As well as the extra instructions it can generate a lot of spills to stack
(including spills of constant zeros and even multiplies by constant zero).

mul_u32_u32() already exists to optimise the multiply.
Add a similar add_u64_32() for the addition.
Disable both for clang - it generates better code without them.

Use mul_u32_u32() and add_u64_u32() in the 64x64 => 128 multiply
in mul_u64_add_u64_div_u64().

Tested by forcing the amd64 build of test_mul_u64_u64_div_u64.ko
to use the 32bit asm code.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

New patch for v3.

 arch/x86/include/asm/div64.h | 14 ++++++++++++++
 include/linux/math64.h       | 11 +++++++++++
 lib/math/div64.c             | 18 ++++++++++++------
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
index 7a0a916a2d7d..4a4c29e8602d 100644
--- a/arch/x86/include/asm/div64.h
+++ b/arch/x86/include/asm/div64.h
@@ -60,6 +60,7 @@ static inline u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
 }
 #define div_u64_rem	div_u64_rem
 
+#ifndef __clang__
 static inline u64 mul_u32_u32(u32 a, u32 b)
 {
 	u32 high, low;
@@ -71,6 +72,19 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
 }
 #define mul_u32_u32 mul_u32_u32
 
+static inline u64 add_u64_u32(u64 a, u32 b)
+{
+	u32 high = a >> 32, low = a;
+
+	asm ("addl %[b], %[low]; adcl $0, %[high]"
+		: [low] "+r" (low), [high] "+r" (high)
+		: [b] "rm" (b) );
+
+	return low | (u64)high << 32;
+}
+#define add_u64_u32 add_u64_u32
+#endif
+
 /*
  * __div64_32() is never called on x86, so prevent the
  * generic definition from getting built.
diff --git a/include/linux/math64.h b/include/linux/math64.h
index e1c2e3642cec..5e497836e975 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -158,6 +158,17 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
 }
 #endif
 
+#ifndef add_u64_u32
+/*
+ * Many a GCC version also messes this up.
+ * Zero extending b and then spilling everything to stack.
+ */
+static inline u64 add_u64_u32(u64 a, u32 b)
+{
+	return a + b;
+}
+#endif
+
 #if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
 
 #ifndef mul_u64_u32_shr
diff --git a/lib/math/div64.c b/lib/math/div64.c
index 22433e5565c4..2ac7e25039a1 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -187,6 +187,12 @@ EXPORT_SYMBOL(iter_div_u64_rem);
 #endif
 
 #if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
+
+static u64 mul_add(u32 a, u32 b, u32 c)
+{
+	return add_u64_u32(mul_u32_u32(a, b), c);
+}
+
 u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
 	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
@@ -211,12 +217,12 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 	u64 x, y, z;
 
 	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
-	x = (u64)a_lo * b_lo + (u32)c;
-	y = (u64)a_lo * b_hi + (u32)(c >> 32);
-	y += (u32)(x >> 32);
-	z = (u64)a_hi * b_hi + (u32)(y >> 32);
-	y = (u64)a_hi * b_lo + (u32)y;
-	z += (u32)(y >> 32);
+	x = mul_add(a_lo, b_lo, c);
+	y = mul_add(a_lo, b_hi, c >> 32);
+	y = add_u64_u32(y, x >> 32);
+	z = mul_add(a_hi, b_hi, y >> 32);
+	y = mul_add(a_hi, b_lo, y);
+	z = add_u64_u32(z, y >> 32);
 	x = (y << 32) + (u32)x;
 
 	u64 n_lo = x, n_hi = z;
-- 
2.39.5

