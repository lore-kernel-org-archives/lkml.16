Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B83231A2B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021267; cv=none; b=bYeLeV/laYKyIUplz8Oq7TR1TJjMlAG2CbLXw3YAL+NoUH1EJjbIywO6KPKBKtgiPzc23RqWPmYcDCymRgrlvmMI5rc5vQqt/tXGVaTkWR+K5zIqyLjyyOTG8BzqFmEadOPvNOal88gp6LXwDAAjljxCTzQIu0y8ZNhkJ16QQUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021267; c=relaxed/simple;
	bh=DnYw7IC8xWuMG+UL/gQ5prUj9HOQyrvroe8K4Ecs5ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwhK2KOipn6ghHOvyO+Eb1hUaSP+g+5DI70spgg6W6Kc94NLlhPF0+d15TgQtYip3Yq3SyOwAtS8I0gIH7Gt6Z996gyEAaaeHvs8JFHLfBHOXYMaOXSiZF2tQTsz48qtH7LcrborTI3JYDWVgHNtvqU7TSIxUU8cwu+nuJwS7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hifiphile.com; spf=none smtp.mailfrom=hifiphile.com; dkim=pass (2048-bit key) header.d=hifiphile-com.20230601.gappssmtp.com header.i=@hifiphile-com.20230601.gappssmtp.com header.b=xsgOGhhZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hifiphile.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hifiphile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hifiphile-com.20230601.gappssmtp.com header.i=@hifiphile-com.20230601.gappssmtp.com header.b="xsgOGhhZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39727fe912cso1761234f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1744021264; x=1744626064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5jGr+pI3zOZTWXmjHZAncBL8qM4rtZILEfUKQGcw3Q=;
        b=xsgOGhhZ6JgjDw+UVon4kCJDL0z2E7tbvcdnLQwKXhhw/SqwATEsZidArfJeGsYHpw
         yUMNDBGoUJbhw0hufEoRJb8fRASlzLhY4Jn5fpLuhjUey8Mxnv0fBQtneBf8GOnDI6Tg
         jSHo8i6Mr8mzR7Uqq8PiiDFG0rz3QMrMsu9laAZZFWWmdiM7qNz44r4IbrUO6Su+6o69
         miw2w4JrNldvXBspT5qqy5rbGiOz5WUgUIBRXjjlAjqgOq5KGHUVMMZf5NkCT9+3O+Nc
         Mlzf+YQuUIp/+Lv5KwV2SZgS/dqt8TDWzsjr/KSXbC1CvdENaZIiCCuMUYDSGq2pCrkA
         IzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021264; x=1744626064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5jGr+pI3zOZTWXmjHZAncBL8qM4rtZILEfUKQGcw3Q=;
        b=Mom7SfJywnpJLNHaFOl5kZamBsdDdrXE1YQnRm6xCAcXY3GS6L1GIRp9lPBQgZKnkj
         JXAnaHKCocOVMlxJ5aIuQHMS/VkUjDBKysrhcOCgHGC/3UCrnc2zDAN9y3GHmq0OYHBf
         Dsh4qxyihJp7IYECnaPHMGaD1tC+WugqsXUP4fB28J6xPcDV9GKliH4z2gBf/2CpIg7V
         PEK06Y5JBYBgpomYfJxbCS7KXWdbIy8bOPJvlCYVupXae9dwHi8iklsV4bk8TR+L/NGv
         g0SjD8KYBj7AFOvDGPi1XBt0wo6m6x34z/PoaNoA8jF1mNbRR2XR1ykk5V7kxJR/vWQ6
         0sbg==
X-Forwarded-Encrypted: i=1; AJvYcCX/HBEt4JbmjjCpPIh3mwv2itfIE0L7hpyo1gv9UdE4uBSePc0Pu5vl32d/emtB8TsldTezfXJFjoSTmzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLMwVQXyqb5vxV9yl3XnPFTRVhAzYSE01TvU6SftUlk7y+Ah84
	0UJ5DGJVyPNbQOgr8Tn1XKSMg1H2glMX414xhc88Kj5DBpcxfenr8Xqk89n76woWeCKWhZ5dAW0
	gm1E=
X-Gm-Gg: ASbGncv9nQ4UqbND2Kb4OrcHxcUylnhm+TB0fOb6IKtyoo7KOEc3ZdBohtZ/URAyT+F
	UznZOtZ1jz0KPyVdaKQ0PwPJe69EcYM+Z8i0RlAIi0/eIcGEPdXK8/ch/oHAW6o8qwhUsRIv10V
	PIOTf1ENgxd9qdNfpzFdZpkHhWHDF07dQnoEGWWOttL6WgutDvpCTbaiAlafIkJpton5/Dcr44a
	csVKphF4FZUTk9saBV7ivGbtuQHeym/G44MYTCEn4CmCvEpfJVngXVAvQQJXQtHRZhCLDLeZsnb
	a4c1pr5rbogLsDtIoyGtQLzije8aDrEu59XQqG3VkncrXUPBMjAciuao
X-Google-Smtp-Source: AGHT+IHIVQFFxQYUM9c9p5jCB+KaT/H7u/LzBHBry2a7T1ZwTP6sqndz9DYPvtVDPTHqnOcrzzxy+w==
X-Received: by 2002:a05:6000:2907:b0:39c:1258:2dc8 with SMTP id ffacd0b85a97d-39d6fd0756emr5600592f8f.57.1744021264047;
        Mon, 07 Apr 2025 03:21:04 -0700 (PDT)
Received: from localhost.localdomain ([78.199.60.143])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c30096896sm11740533f8f.19.2025.04.07.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:21:03 -0700 (PDT)
From: Zixun LI <admin@hifiphile.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Zixun LI <admin@hifiphile.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: atmel - add CRYPTO_ALG_KERN_DRIVER_ONLY flag to atmel-aes, atmel-sha, atmel-tdes drivers
Date: Mon,  7 Apr 2025 12:20:49 +0200
Message-ID: <20250407102050.1747860-1-admin@hifiphile.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the CRYPTO_ALG_KERN_DRIVER_ONLY flag to the
atmel-aes, atmel-sha, and atmel-tdes drivers. This flag is set for
hardware accelerated ciphers accessible through a kernel driver only,
which is the case of these drivers.

Signed-off-by: Zixun LI <admin@hifiphile.com>
---

v2: fix indentaion
---
 drivers/crypto/atmel-aes.c  | 5 +++--
 drivers/crypto/atmel-sha.c  | 6 ++++--
 drivers/crypto/atmel-tdes.c | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index f3cb73df941e..266e1d0aca3c 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -1948,7 +1948,8 @@ static struct skcipher_alg aes_xts_alg = {
 	.base.cra_driver_name	= "atmel-xts-aes",
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct atmel_aes_xts_ctx),
-	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK,
+	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK |
+				  CRYPTO_ALG_KERN_DRIVER_ONLY,

 	.min_keysize		= 2 * AES_MIN_KEY_SIZE,
 	.max_keysize		= 2 * AES_MAX_KEY_SIZE,
@@ -2471,7 +2472,7 @@ static void atmel_aes_unregister_algs(struct atmel_aes_dev *dd)

 static void atmel_aes_crypto_alg_init(struct crypto_alg *alg)
 {
-	alg->cra_flags |= CRYPTO_ALG_ASYNC;
+	alg->cra_flags |= CRYPTO_ALG_ASYNC | CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->cra_alignmask = 0xf;
 	alg->cra_priority = ATMEL_AES_PRIORITY;
 	alg->cra_module = THIS_MODULE;
diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 095ba254a25c..b4e917a8465e 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -1254,7 +1254,8 @@ static int atmel_sha_cra_init(struct crypto_tfm *tfm)
 static void atmel_sha_alg_init(struct ahash_alg *alg)
 {
 	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
-	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
+				   CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->halg.base.cra_ctxsize = sizeof(struct atmel_sha_ctx);
 	alg->halg.base.cra_module = THIS_MODULE;
 	alg->halg.base.cra_init = atmel_sha_cra_init;
@@ -2043,7 +2044,8 @@ static void atmel_sha_hmac_cra_exit(struct crypto_tfm *tfm)
 static void atmel_sha_hmac_alg_init(struct ahash_alg *alg)
 {
 	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
-	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
+				   CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->halg.base.cra_ctxsize = sizeof(struct atmel_sha_hmac_ctx);
 	alg->halg.base.cra_module = THIS_MODULE;
 	alg->halg.base.cra_init	= atmel_sha_hmac_cra_init;
diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 099b32a10dd7..96fc19cd62a2 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -898,7 +898,7 @@ static int atmel_tdes_init_tfm(struct crypto_skcipher *tfm)
 static void atmel_tdes_skcipher_alg_init(struct skcipher_alg *alg)
 {
 	alg->base.cra_priority = ATMEL_TDES_PRIORITY;
-	alg->base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->base.cra_flags = CRYPTO_ALG_ASYNC | CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->base.cra_ctxsize = sizeof(struct atmel_tdes_ctx);
 	alg->base.cra_module = THIS_MODULE;

--
2.49.0

