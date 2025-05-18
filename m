Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD61DD877
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747575542; cv=none; b=Vmh9NQPovFYV6H/bfKZBrBwnK9Fnxx/dch89jf/n16HX/Yv90jNjRe+W4zw/enlsBbvsKvUmAZPCFwAI9URU2dBRqbk6kVRl6RgWT+rFe6iBxMhSYoqomvODj2WADp98rA8SRTNaeVdkv5XB6KG5IL/1lrZhX7Fu9oDS4SJK5EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747575542; c=relaxed/simple;
	bh=QJ3yOJOT1zzdfKoKBAGKSk8xnN0U7WXtl4zPnr/y+8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Am/v5+Har6/ZzGQmFQFU3YZ/2R6/mZyfywRARGme/3zNahyIGCV/8ocXhU5i0HsB0rtJ76AyecEhnW70k7ugdHQlmNCt7F2uxGFS/nPKAHJPtU378apYBlPOdbGj5s3VMhNaP2IEWvjs/tOpVv2RV8ZtX+3BceE8k1QR9WtmwfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv5rRnLg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv5rRnLg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a064a3e143so1817563f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747575539; x=1748180339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1+kNrtA3xdQK8Wggj2tCmDdplh3SmM+EQ04B7r6wEw=;
        b=Rv5rRnLgtGHYLf0QykAhcGGsR/If7r8AXKbcjth6mlu8cJ1bdn7zh1OwlN+XC51rmE
         0outFyOxvwEHqA9t5B+TSr60x0Zrn9a8IsMj2q5vBXx/OZd1R/sNhWlRzXo4hglA9J1a
         THJ6BL5BLX/NCPO3lHHJe36rywjpnL1ZnWNbtIUUQBQvT7KivT8XaVAwFR3nDdeSGukZ
         X7UoBRF2ynDc/hmoVV95SydixdNMsY7KTPOTroYN9Xk2AjGtpWkytWSBKf47ZlA/unVY
         gtuYkaNrmh/qnYEk8eUToSlcl3/oypDtXNYCW/NvZXGVVVyzCqLaC07jPGJOoadl3M7z
         SUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747575539; x=1748180339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1+kNrtA3xdQK8Wggj2tCmDdplh3SmM+EQ04B7r6wEw=;
        b=fwlSiBHMzJqZmKhXMoNVNQNQAGlp/iWRghVlcibg1vscKf10nXfdj7TfC59bjM9+xw
         PnOCMSayeRT//IpDBffHpyroFl2EpdA/999oTfP812VKpN9kNT9xO1gTuSk4CsCwOf8h
         QwzK1RN+0vpZnIFRLnSbfqflZ4kcR644tBZUSy5/z1rxmP8Wfr/A8jwqazd/ZM0bjO+j
         zsf7t/myCznxoxXFQ0JEaqQO88qBbvEqABGFnqeL/p62Afut0xKz+u2UwYYxrYzBr0L5
         2ViV9h5W4Vo28GFcoYjS5bTd3R76uPL/nMhLxt2WaTJwRgAymPs4BbQNvsQ06CnCpAOc
         dn4A==
X-Forwarded-Encrypted: i=1; AJvYcCXutYRB3dVSWHkvPQ2awttv/RgzLcDe0P5MyWMakjAYWHLqBMBsXFa2d9lR8Z6YpTsNkqW2NQr2esj11GI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWsRj7ptY9K/S3L9Rno/3TGwqWqLQ97kRpVZJwv//tNZRTkK8
	L3551qvZRUuxOzXLlq+oePFrdNYoUwxFKiWvOG4th8+bSMn+FHu2vOzq
X-Gm-Gg: ASbGncvQbEKSuorjkO1EMbFOaiN/GiCwODqnIfV1dewi+qhDJDq8qKWrSW/4nZpFKgt
	ETSd2eAHZlsdIi7jKGWPwoIPBdHPa6e/XCu1Pt7REFKXhHRKKDsv9G5OBSiV9qz/+DqhhccLo/A
	uO4yBFeQcPg7feMd97B5TI71+sWz7HLlwj6xOviZvAxhg3yp9+sfPqzQjMoM3qB6CG4bYQCdzAP
	ebfOkRropCSpS8qpDEOUyXi8acqoVdxkc/XijD9UPRPjJRTzFcRkx4vRK7+HoW7XfFdG3qQAl5a
	CCjeOXNgm5H0Mm+JYaYf1XBoQuci2NUeUxsBXHopgELgbgXd35n7fLzCnMxVouA3vWMiuAoQnn0
	nnkjzuY6vGZZxh4Mn0xRpN13WjdYvqbbx
X-Google-Smtp-Source: AGHT+IFL6CE2YZvlcQRHkSkyRhGvvKJFWqxyMyhnBqiAsvx8o2d0Ljtcr7D+xItujCwIYAwDFnoQzQ==
X-Received: by 2002:a05:6000:186d:b0:3a3:6b0c:a8a3 with SMTP id ffacd0b85a97d-3a36b0ca9b1mr1818031f8f.17.1747575538877;
        Sun, 18 May 2025 06:38:58 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a7d6sm9429508f8f.30.2025.05.18.06.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 06:38:58 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 next 1/4] lib: mul_u64_u64_div_u64() rename parameter 'c' to 'd'
Date: Sun, 18 May 2025 14:38:45 +0100
Message-Id: <20250518133848.5811-2-david.laight.linux@gmail.com>
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

Change to prototype from mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
to mul_u64_u64_div_u64(u64 a, u64 b, u64 d).
Using 'd' for 'divisor' makes more sense.

Am upcoming change adds a 'c' parameter to calculate (a * b + c)/d.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

Note v1 of the patchset had mul_u64_add_u64_div_u64(a, b, add, c).

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

