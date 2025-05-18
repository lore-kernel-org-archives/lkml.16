Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFCD21171B
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747575543; cv=none; b=VtvKxAtcPm7lOITZn+PwEOE4rDDJi7HVcRacmvx49r+16f1yXWLPikIGu5/+CK6/QnzNBHtD8zskzW7R6aiYuClgcMPT5hI3OxbZeKoeEG9yWybrv0RzuiqaqRSO4yRKZKXhZzOf87JBfEPmF/qcLQjdtuT8KHBpmwHPNdV1TIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747575543; c=relaxed/simple;
	bh=Qt2xjNPt5+Dy+URK8MvzmyqOVnwPZrjCeq5xMgAe/cM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mjWi1FOutqw6I6pYkbJuD/bNqfUjuPsvcLx6XGFxps/qG0MyGE1Fgrx7bZbYstq1v+RRAgG7EcbujpciRjrXBVekdh0sBzVF8fNd4qGO6feym0hnFAgroAT3w2NNHqnL1VQ1ImIHIdL1/opmtGaLPjXbkntUQjIcCN9/bnSXK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEcmxL4C; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEcmxL4C"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-445b11306abso2412575e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747575539; x=1748180339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ulhux40xZIUdH8FPaZF/btHZ6IAcrvTToW7pK3BG2g=;
        b=UEcmxL4C0TXrRknTNKNI+WdjYj4e2BJqVDhDcmFM86AJCxC5hbch3WFG9pOBMlRqDv
         MJbtpsbJRjovb6Hf2zEzIqA4aS2a/vAr7Y3xckDeIa7upYopmfynwCVdxXkFZb6lFXIk
         caBxKZO9QUe9EMWs27sK/hDcJ6EmGIV8hEzRSXM9AZVnJB3OOTkcr17bF+lMnyQqbSLO
         UlV0yhbPmH7c0dJj1iisxhWA4Vs70rI5Wr6M/PJJ3iAapm3YsaeQuOPKe2jgFuuYlbHq
         OEy2/08rPPzu8gfkOjXQV2h8K3Gc2cSHJm+7PFM7WgWHPAJmHSH0KSIwRX1vTWVWcxGa
         awlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747575539; x=1748180339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ulhux40xZIUdH8FPaZF/btHZ6IAcrvTToW7pK3BG2g=;
        b=kV0cCASaKSkeDlN57u1mSO/NdTxD7jZxbWo8KZrvTYdM1IHFEVWMKggJYJnoUFOCil
         2qgKoTUCXYa/92YceNwHl3cNfD8nYCM6utAVgiR1H0bs6Iib47892YZoJ0773zcH8Xx7
         GQ6Rpwqwkk/FFhiCXt1v+yEIgjIIJAJfaQznKaR7WBLpuzFX4RvlHrdsUWV4EfhSIwcP
         spvgJlQhsjsR49P4JwC0b8PRScPJkXbtesNmVeEdp2F+fv0zvPbGl/tG18BswcoxisjG
         MWc+EdEttfZocuRXQiWrX87ERRqDUqqMKz8qdcJY1kCceYYFADb+WvJC/2Or7ZDWHGXC
         00mg==
X-Forwarded-Encrypted: i=1; AJvYcCVT7C9qhEFaRaQdMDOpyjELl9NQSOm8gi+OyLsSSjAV/lVa3xiYlZc/RxiBYyCegNt9SK8QtM8H6wpwtu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCphhsSfxXWZ03MrMx4l3rROF3FYXc9Xi8+lUpIa4yWxVfklOy
	4f6d/3ohSFjND9r5JUbXlI6EsczQRBEqQaEMtRo2cJc8fAnoHYDviQqo
X-Gm-Gg: ASbGncvHJWJ7afM9uNneOAlMGq4ZACQOjwz1cyF9DCqAOhyEOM3tAK2OBst7MpD4Vok
	81AjBZ2S6CGM2YFGNu0WNukP5ujeta5EoqNvov98EBpiqxCFEXiRs4imCAwSPV3VRWaZFijcYlE
	Tk013u6OGYENOu15HpUzGATWtV4EbYdsuylTDyhZu+9MI+qbOxxMLbE3ovaDoIxAFx5Go1JSPjT
	fBC3gBCEb8kCyBxhEGL+P8MqvBwQ/Gvasjtu9dMrZGU35QwNflhZByikfwdnEt72h8Objvs/SmB
	vueE7ZPD012a6lHoCzN03xUgpesbwsazfNtBgUqWIpfwcaZJSBYbIbKo8a003p5RHmsWHA64PkG
	O6SKLCiJPwbDgmzHe7oDdtTobyabapp9M
X-Google-Smtp-Source: AGHT+IEQLoZh71Y1B+UMg2W/nbn4Hld5yAILnTVv5RILKdvYlsVwHqes4M3l+Z43PlbP4mVOsgnsRw==
X-Received: by 2002:a05:600c:3588:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-442fefdad6bmr72812255e9.6.1747575539296;
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
Subject: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for divide by zero
Date: Sun, 18 May 2025 14:38:46 +0100
Message-Id: <20250518133848.5811-3-david.laight.linux@gmail.com>
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

Do an explicit BUG_ON(!divisor) instead of hoping the 'undefined
behaviour' the compiler generated for a compile-time 1/0 is in any
way useful.

It may be better to define the function to return ~(u64)0 for
divide by zero.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

A new change for v2 of the patchset.
Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
continue and generate 'random' results for any 'undefined bahaviour'.

 lib/math/div64.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index a5c966a36836..c426fa0660bc 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -186,6 +186,9 @@ EXPORT_SYMBOL(iter_div_u64_rem);
 #ifndef mul_u64_u64_div_u64
 u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 {
+	/* Trigger exception if divisor is zero */
+	BUG_ON(!d);
+
 	if (ilog2(a) + ilog2(b) <= 62)
 		return div64_u64(a * b, d);
 
@@ -212,13 +215,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 
 #endif
 
-	/* make sure d is not zero, trigger exception otherwise */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wdiv-by-zero"
-	if (unlikely(d == 0))
-		return 1/0;
-#pragma GCC diagnostic pop
-
 	int shift = __builtin_ctzll(d);
 
 	/* try reducing the fraction in case the dividend becomes <= 64 bits */
-- 
2.39.5

