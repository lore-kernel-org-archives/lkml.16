Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03C1CCB40
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894857; cv=none; b=b8eMIJKdy1mN0HvNKYgWxM5opOkiK6Q2yxgy99mp3DHZ2bHUn6CPoPSEAPtV4PiKG9+BcywX34W7FrIlxRxQPOtAjZ9qxBO9v6VOCf5mdlW6sFC7lwe2esBURgYK2lsRw3pdaFMYMvi46EOL+AI3BePlWB+ULjdE7SR15sAyCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894857; c=relaxed/simple;
	bh=/DAhbAalRWUaIbB1SD5U9rjy+L7LK5uvY2pUXmbFHSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eNltBUcm3jB0VZKImnDTi3JWkw0D9NnoSi4FA+dbrX8ihSUhcg2jilaaIeHCHX2+o1WAqVYJ6clh1nq6LqQfZh8z3ceVNF4OB93Z8CFpxpjfWJTK8C+WAsCk3jjAqQ0ZArP0OfOmFXYqqxdxjJ0j5wzf0+bgyWDCWSqYDu/soXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFdQWiis; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFdQWiis"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4533bf4d817so4219995e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894854; x=1750499654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndZldl+b//mjmwm6Wu4ORnjQlkIiVaXqckuA68ipUcs=;
        b=fFdQWiiswUx6tE4KzmPOVqZvMz26yyA02Y1S5XsaaXGZJbMYWNpq8zZ8RnJUid7uvN
         SVEa0tIJekEKRO8zTqowNNOXi696EYi9xMm+mV1xuFW1xueYXfFV65WUL015m8ZwYu5i
         WMtb7vFD/32HWHJfQAacP9n60nnbE4k0b6J3g7myJF2tw38UktDbuc2Bc/7tuN5klRRS
         msFaU90X7+A4FXR2u5Nchphx4tD1vkDh2dCUcBxXCk1VBqSIUdSVLJka6N8w6oMok0CZ
         rsiE/grUvs+W/YVH7u24ksC0dRlJTwHfQ6TVfHOa8+f+kkwEvA9ENwF3wsiZym+lNp5K
         DxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894854; x=1750499654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndZldl+b//mjmwm6Wu4ORnjQlkIiVaXqckuA68ipUcs=;
        b=wvAOYwQWHL/NHMK9lU4cLyyXQxfgMABTwYnSvl6qdH80385lnUsI3uiFMQotaSqauA
         wsLAdWgkGdPHVwcFGC24+S4Tiq4NhvjdUBJinEo4uRxVeQFHP+BoQAXoHZEyqnDQ9HLP
         xO0wFvC0kOrOE5DYf1FD5eW4lYvLi+xA9LbuKX/H6NQ55CSaME4Q9D/3eQFPlGS1pzpz
         QWROq3EbhP047RHsNaHhomHsfW9m4tVipI+ZcmpWYe6NhRZQRs/bgJmz7MhjN/05BuwT
         QyAxU9h61pvn21RumVtcZh35Xagh+F1vt5Lr40UVzrwssAaGRLp0iecFIr4n4ZrrL7YO
         HZKg==
X-Forwarded-Encrypted: i=1; AJvYcCWCIUMtxmAlC69J8fpUOP+ykYlQR37imTY0E6F7UpaAaw7A2oqA1J/gl6O7fWM3sdEGKruZrTU/SypqJhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmfv20G/yw28kkgROu8XLbw5VSxmaOOelpqtLaebSz6qISB6Vf
	/PTFV2dRJkgicCthE3acgXhgXeRmFeUND2YNxlfX5roWh4vWqMcYuOy9
X-Gm-Gg: ASbGnctVUsBHOgTr2sZ/0RKCK+oDThN3S1ClzzBACPcS7NnroooJpvubWgNrrkkJuiV
	bOuW/zfg03VzLkVSXrcdA63+mBeWYkz/Yt1CEaR+6N86TmzO9q4SRqAPkGY9TmaiKgtckZiz1gL
	DutMx/sVHoFsuC3aJS7TxKLu6lwwvA9DYNBMnsLER6aq0PHEdX/Yr3i9+1FpiJAYtecVwjGaH+6
	4xT28GosMN314QreH+XZkHgdIB+CXMKAGOJihVQ+XDOb1GUN/uxKV/CPf4iG53qFaHGNXPjC0yT
	uQyOoJSNKcZ1Ooq38DNcjlwyIFuh+XWcRBg5GeT59Og04UrxTikhGRgK50hLtjPtsX0FpG7fYFp
	dMYt2s4o/tw8Abboyeeh+iM49Faqyy4xXz/2mP0K+izg=
X-Google-Smtp-Source: AGHT+IGSjd/kO18b5Ye+GM/X/c+MeEZNGDbYMf1Lskkd6Y0qzZzOQkIOeqoOJECwhIbt6WAL9LSdCA==
X-Received: by 2002:a05:600c:1d07:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-4533cab5335mr25414685e9.23.1749894853548;
        Sat, 14 Jun 2025 02:54:13 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:13 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 02/10] lib: mul_u64_u64_div_u64() Use WARN_ONCE() for divide errors.
Date: Sat, 14 Jun 2025 10:53:38 +0100
Message-Id: <20250614095346.69130-3-david.laight.linux@gmail.com>
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

Do an explicit WARN_ONCE(!divisor) instead of hoping the 'undefined
behaviour' the compiler generates for a compile-time 1/0 is in any
way useful.

Return 0 (rather than ~(u64)0) because it is less likely to cause
further serious issues.

Add WARN_ONCE() in the divide overflow path.

A new change for v2 of the patchset.
Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
continue and generate 'random' results for any 'undefined behaviour'.

v3: Use WARN_ONCE() and return 0 instead of BUG_ON().
    Explicitely #include <linux/bug.h>

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/math/div64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index a5c966a36836..397578dc9a0b 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -19,6 +19,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/bug.h>
 #include <linux/export.h>
 #include <linux/math.h>
 #include <linux/math64.h>
@@ -186,6 +187,15 @@ EXPORT_SYMBOL(iter_div_u64_rem);
 #ifndef mul_u64_u64_div_u64
 u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 {
+	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx) by zero, returning 0",
+		      __func__, a, b)) {
+		/*
+		 * Return 0 (rather than ~(u64)0) because it is less likely to
+		 * have unexpected side effects.
+		 */
+		return 0;
+	}
+
 	if (ilog2(a) + ilog2(b) <= 62)
 		return div64_u64(a * b, d);
 
@@ -212,12 +222,10 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 
 #endif
 
-	/* make sure d is not zero, trigger exception otherwise */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wdiv-by-zero"
-	if (unlikely(d == 0))
-		return 1/0;
-#pragma GCC diagnostic pop
+	if (WARN_ONCE(n_hi >= d,
+		      "%s: division of (%#llx * %#llx = %#llx%016llx) by %#llx overflows, returning ~0",
+		      __func__, a, b, n_hi, n_lo, d))
+		return ~(u64)0;
 
 	int shift = __builtin_ctzll(d);
 
@@ -233,11 +241,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 		 */
 	}
 
-	if (n_hi >= d) {
-		/* overflow: result is unrepresentable in a u64 */
-		return -1;
-	}
-
 	/* Do the full 128 by 64 bits division */
 
 	shift = __builtin_clzll(d);
-- 
2.39.5

