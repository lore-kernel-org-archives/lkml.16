Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7458462
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859727; cv=none; b=JicOvod8vlrY3kbTNOY8/J876LsQoql4/3SG//E79LOZjgGKf3AUupIU3dsqweHZwT9OiWXp+kAZvph/6I1mRpBW4cOULBDaDgQ8ZFz1Hm2UaQk1zhz/S2VH7m5KO2TX6WBPCyG4E3SqD3q+l9GF+EhS6JTns9wbAOy2I+ZBwYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859727; c=relaxed/simple;
	bh=RRBTu/UcJXCy6H5m8hEZ9SDf/wYMt7phWeAfO5CJBvg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hBp3+WJ4bSjQGur5VWkV7YhzyNwdhsD4U6UL78igMFKKYOR9yrF9b/NeExCgmmaCfLDWsmQhhfTR/63yV7T38DkHCXGG7cHfMYJ0YenSAPS9kMNlHjGA8EeWX+QAwpDFucMvNDAN5jarW1RJAtaV3ABaNmBhRGdz3T9s2cbkfnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=odTwI1Os; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="odTwI1Os"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2c37558eccso1934842a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749859725; x=1750464525; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDG/TDgRblDx+LSEqZBeH+bLXhEOKS8TgJ2OAQlhBo=;
        b=odTwI1OsjEWVaFb9YBnnI+ntXv7R8r9+miMrfgNXPWmkYxcRWD74T8LH+vjbhO9hIl
         +G3g9mhssQwqakKZF6HtLg9Rt8MItzzgpZvuQ1dZvyHUnavh9Z8le5vW2OwSjBHYQMfA
         ML1HKwv77QMCd1+U2parSelj10GDMzl080GB8AXjlTGEm2+G5rnXEjUxtXC2syKoV/SF
         46sKsYBDfZubG7lXsERKtVMMQ9oXTP9x+EdoZ4j2pxnj0FGxDwO2nbP6Rh3Js9yK+PXJ
         iitPJaJzf+NsErEwpICUI2VwtwRKdErzaFkeb7oBLbJ9bYku5mHtYQMdfDd+3bn2LLzu
         lKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859725; x=1750464525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDG/TDgRblDx+LSEqZBeH+bLXhEOKS8TgJ2OAQlhBo=;
        b=Ild3jVjSfKfNVhZJh13/+fP7nT7tic8rCw7nlVaI/Z4Uvg5eqvdboZE6o5bHujdtEm
         OklKkeHhWTWtTQUN/2Bs7VmJkJO7b3yKceELHzTEAk78xyIIVa6I/hYXlsIchvxt/GAP
         qiqNYTY6BpkgFHwI9U0P7vBNfO5ixhtxZi2Lyo9mYyVp1PlwQILFimzq14pAGBqZ52CO
         ckXB9E5FwISk1KIR5fWMVXdCYARqwG0ZYO6s2DQeRue8dcqinRPFvY2/8RodgvPkqNjt
         EziSaBZ5sLpJ5GC2/AMo6ROVJL8cefeIuzjJAVYNG8B2wwqiLqVeuU4yPZbAoWkJSZil
         avXA==
X-Forwarded-Encrypted: i=1; AJvYcCVmtVjp7+dqnBAeaNvJNPjuYjcAD/aAWd6j65SHSimG8vc2L7vZLwxj4VrKYFBBGaNUj+YjaBb7SnZaUWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2dOCWwVTp08/08VUAknPP60M1tS2sor0SHjhT+cXPRkqf2xPh
	1zm23xyDPr6NPzOTPYKDdk79BmE9MnmCe9ozyA8VJPkp8O4uAIcZ/oMt98V9DGvLHaD2pVXD6Wd
	VFxIHbQ==
X-Google-Smtp-Source: AGHT+IEgdl4JGvpGQHTlvQaZuMAmSd299962DqOd1Lqu7h2Sb8LIi/Q/7YD1GjewTKOR9QaSRwJAcNHb+mY=
X-Received: from pjtd4.prod.google.com ([2002:a17:90b:44:b0:311:a4ee:7c3d])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da90:b0:312:daf3:bac9
 with SMTP id 98e67ed59e1d1-313f1d07b65mr1845678a91.34.1749859725002; Fri, 13
 Jun 2025 17:08:45 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:08:27 -0700
In-Reply-To: <20250614000828.311722-1-yuzhuo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250614000828.311722-1-yuzhuo@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614000828.311722-2-yuzhuo@google.com>
Subject: [PATCH v1 1/2] crypto: Fix sha1 signed integer comparison compile error
From: Yuzhuo Jing <yuzhuo@google.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Ian Rogers <irogers@google.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Yuzhuo Jing <yuzhuo@google.com>
Content-Type: text/plain; charset="UTF-8"

On platforms where -Werror=sign-compare compiler flag is enabled, sha1
code gives errors when for signed to unsigned integer comparisons.
This patch fixes the issue.

Signed-off-by: Yuzhuo Jing <yuzhuo@google.com>
---
 include/crypto/sha1_base.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/crypto/sha1_base.h b/include/crypto/sha1_base.h
index 0c342ed0d038..3460759d31db 100644
--- a/include/crypto/sha1_base.h
+++ b/include/crypto/sha1_base.h
@@ -73,7 +73,7 @@ static inline int sha1_base_do_update(struct shash_desc *desc,
 static inline int sha1_base_do_finalize(struct shash_desc *desc,
 					sha1_block_fn *block_fn)
 {
-	const int bit_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
+	const unsigned int bit_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
 	struct sha1_state *sctx = shash_desc_ctx(desc);
 	__be64 *bits = (__be64 *)(sctx->buffer + bit_offset);
 	unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
@@ -99,7 +99,7 @@ static inline int sha1_base_finish(struct shash_desc *desc, u8 *out)
 	__be32 *digest = (__be32 *)out;
 	int i;
 
-	for (i = 0; i < SHA1_DIGEST_SIZE / sizeof(__be32); i++)
+	for (i = 0; i < SHA1_DIGEST_SIZE / (int)sizeof(__be32); i++)
 		put_unaligned_be32(sctx->state[i], digest++);
 
 	memzero_explicit(sctx, sizeof(*sctx));
-- 
2.50.0.rc1.591.g9c95f17f64-goog

