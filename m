Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C223FFD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894856; cv=none; b=o/5jUevPr2BK3BQdBYy2uOQBdSsvgabJ3t9IaCzoXPxuzVKPjcpemP7ooH2L0tWcyNlS7FZjaoxDzyxs2b6cA8510ue+CDabek2ULRQijKLwiOBUJlCt5Kfv2Vci7YJLfIBTkfk8L88fpDG7ASUwoa+NmV/0M/mAm1cBzFHbb44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894856; c=relaxed/simple;
	bh=EOVDbuv7TFQlHss93ohFwrc/tQHT72C+uLsvZ3IoSzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/N9JrBA91hdLjNwQ4qw1WFQRJ8DYsZHk0Jv44sL87ZXXv7YifLhDgW9UUfFc1HCDAgQiGin7l85ZBGgSFpP4O8lS6GGe1szylgLqYiiprBKYJhk+I2GFaOnLqbNoG4Pi367HVg5Nkg9HunCyagCwR0qSYgU7fabjsqj03Rrz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHaTjL+w; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHaTjL+w"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2665255f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894853; x=1750499653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkCL/Vt5q5OcKwnPeY8ySV0HKzOdZLzX2zncNiWmtWQ=;
        b=PHaTjL+wIvzPkMj+vzN+bMQO4r75DUeMarL68yffB1VFxvw+8gvyQQT7UGYtNR0fDd
         QRQ+K8eO/64P4B7/ACqttMmYcVzwDYlCi7c5Bl8nOzFWAQ3WzBCxzHOgGoy9F0Fnz7xW
         gAwavk6DEhg4+2+lSZ0ciQg0V+R4uo7NkvE+Ra9sAs62xQGKJEhEE912HelogGHNFTIG
         tQF2PMnV8Y0AbUicPH0oJzPrXJ3htEjdOM97Sj0fOXOQvheOo+Cg+74uujPW25GYam6H
         XXhvDTrhLF/rW7a3mmB80ZcStVMhu3TRhZeG9xLk9/RObIiZtGHqsZJHvQyHdP70H/gy
         lU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894853; x=1750499653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkCL/Vt5q5OcKwnPeY8ySV0HKzOdZLzX2zncNiWmtWQ=;
        b=j3TrWXnjO02lk6uBB5ZNxokSOfxmDuSt83nWhLOY9nEcTuDj8sGD3b3zwdyzv869zO
         S5V4OC4p6dUozWSTqy8xJYxCiGG+Xooaafdye0wZxDkhivL83SmTjA5BqRPPX0XI4eei
         VDYGvvWibjy7bUv5jj2mE+YPA7bxebiBmvuC1DrEk2UUZvUrG+cu1lQCie7lILW8+A+o
         2nf8EgVTb1yG2WbAYdvkkaV5onGVaOQddeQMLizMBqPCunJWX/fecqOTHlT+sUqvFE+Q
         BSJz2iOiApP994+ePAQeMKwcCqe1rapwdqXHRyjGfma2x+4i7zfuqMfHNHp2htaIJUda
         CB0w==
X-Forwarded-Encrypted: i=1; AJvYcCU5TtCDLbHVulBMXjUZmhVpC8VbNCK6iHARgRNGHPcpd8Rq0EiUKTeU90qUzXU/4haTihAfYybXSObegdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVejj86gx19UpGC7FfILTH47EG6C2G8cE17smbamGlsogKjIuD
	BgZrfI9RBtJkjT5a7dG3gUGO+gdFqwsLnD3nxnsTs3bqeojHOt3lJN8bU5vbuQ==
X-Gm-Gg: ASbGnctd8bRIUaO6l0Fx7/IerkawkdbgV/ZAY8PMadLfOaKns0+CkDGjuqbmpyuI+nN
	iIliGU3I/jPgDr6weVR8Az5t4TjGsY39Uvx2NR4JnfkUmZs84NnaeiqNssBgHGQP+ZrUswRN8Aj
	H24uJtJ7NWaxc8djHxJJ15qHRH5OQYtEBCxMzEZo/tn+VibslMSLo5joU9xFXfoZXr7jJqei7sG
	qoQ+IEVp2mWSXmV4UFRNfqf/OC+5OIl2xQygSrNdQx+wJcyOIb5y0W4HgOfXLVxdDpvOZCc34gp
	A1yXNYjwXHwtMpXhtTK0CjSAsmf3Hg7TRfVk/Gieg4MlOLum2FLMDB4IjlPXmPly7gyH3u5i66a
	CLtTy/8KFme2Q1yvtQzBf/taqA7Lfk3J/nhAw0csvBr0=
X-Google-Smtp-Source: AGHT+IFlzdzTjVJtPmR+g6aY5/br4zeP0j7xtigVPw1IDEECv7yqLscSed0KvEFbpYg+t1QOB7yDkQ==
X-Received: by 2002:a05:6000:26cd:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a572e79674mr1962401f8f.41.1749894853065;
        Sat, 14 Jun 2025 02:54:13 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:12 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 01/10] lib: mul_u64_u64_div_u64() rename parameter 'c' to 'd'
Date: Sat, 14 Jun 2025 10:53:37 +0100
Message-Id: <20250614095346.69130-2-david.laight.linux@gmail.com>
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

Change to prototype from mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
to mul_u64_u64_div_u64(u64 a, u64 b, u64 d).
Using 'd' for 'divisor' makes more sense.

Am upcoming change adds a 'c' parameter to calculate (a * b + c)/d.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
Reviewed-by: Nicolas Pitre <npitre@baylibre.com>
---
 lib/math/div64.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 5faa29208bdb..a5c966a36836 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -184,10 +184,10 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 EXPORT_SYMBOL(iter_div_u64_rem);
 
 #ifndef mul_u64_u64_div_u64
-u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
+u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 {
 	if (ilog2(a) + ilog2(b) <= 62)
-		return div64_u64(a * b, c);
+		return div64_u64(a * b, d);
 
 #if defined(__SIZEOF_INT128__)
 
@@ -212,36 +212,36 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
 
 #endif
 
-	/* make sure c is not zero, trigger exception otherwise */
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
@@ -256,8 +256,8 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
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
-- 
2.39.5

