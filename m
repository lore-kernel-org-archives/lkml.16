Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10B1DED51
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989763; cv=none; b=NYrjab7scaewd1QdA/bB8ercw6xLm+C/vka+fD5E3/1EuTN+bNjuZr142ZjxSpWAUkERZR009hAqDGhvBdfSjuqxQIgjF6wElTW72hs2W82prdqwQ1cTM52jj2nL9tEW8WeA96rhOTb6V6sVdiBZUphJ+Bjnaeu7y7/9XiMBk0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989763; c=relaxed/simple;
	bh=4XaN4b6TYxor2VB6PN4UWKPPAFoVzkJsLeYA68iu9uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t0dKCXbHs7V0TOIqySbNplHVM2R12wW8NKn2qPtEhGyqB1uSNsUVARk2JMw9sLLJSE6lmb5P5hzb5yKRyf8dmdTRm9EFGaSj5X0rqe9V1gDfCkTyrDttKq/dGeXTdq79qAm/1O2sSU6qaIbOOdXJYHimAanuUr//vqCPVJokNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnTFt+ur; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnTFt+ur"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c33677183so24139815ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744989760; x=1745594560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFIgyfykMWRR/7w+FeA+/qARrKEoNmHzLEi5u8RTHaE=;
        b=CnTFt+urEGtFZeTAwA10VKm8BBJn9qNCaB6J6++Z+Xx+wc1Rvx/idYs71BZ1n3A/BP
         41awb+1KfBrvyMpT7HXL0lxVoW5RZFc8LKnYYky9DzfHoIppAtFmYxNkBMADImms1TY0
         +uzC2hxU6d0hMvEFGxcd6azOwAHT36P1GEEZZlv6CA1Uy+lvGN4lOYW3xxld9BcIS52j
         boklGnIY5bePfSrn/0UwvUBVA2IODBk1wWq5cA1hm8jxC6aPAWwJE0WhwU4YgA75JJHe
         VoedzGRO6ej4I/Y0Dc8nRkZ2zEydO9ObdGjKtDZEdSwFXP03hIsR3t8DlGeO+TKQ0xkq
         8XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989760; x=1745594560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFIgyfykMWRR/7w+FeA+/qARrKEoNmHzLEi5u8RTHaE=;
        b=GBeG4SGRzc2YGcjLPKnzIDeA1IDqymcpZfHzmTeuFFQYmsvUd5f415xt7KDsjuycIO
         FbJ8F4ncWpYWokPOIn7TbQHyPVwmBk5X6SPNNFtPAy7SgDTVQCuE1PaCwvgBB0RY5uZp
         n618LIzll26Rf+0hn9Z9oWeNhM4mAmkQq76xDc6EeLjx6nujGPtIhWxsczZZTuk7vxwt
         qq089+AYW+Ounb3Qx3YBiKBImOgACoMrcno6JtveVq1zAgcVGhGagaj7+fCtmIBu/PRJ
         /o+WPKCB9cwdHf/w5gIrYMQxh9j9AHGTSEov6wxnzGpbywKRB3evNY0Dh112NzPkuzEh
         d9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWsvkPv+SrkpYvUjCBDKPpfwRMLB11nc7SRousWJaiGB0Jg+5f2HwmctG69wEXosQePSwXuENKEj3qPfsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtPrr7Ca9SsZzxPB7KBHKtIIrghe9Bt7aLpD5LKZ5bMmHCBOL
	Zcz99iBPPvvtEIyDH/QG7Tgk7rEH27/Fadtxwphufg56dtO7SRLR
X-Gm-Gg: ASbGncvQ3qzsTR0UE/yVMk9i37ll1sF/Vgl9wqb/4ldSkGixLrfJqx6AeWZaMTjNLsh
	zrOPnXC7VVKLYSRAh0Aynh3Eo6lARSRV53MeQmm22vVS6vmNRNHWvZaoVNsn/eP7xdIrqpcpN2P
	r6gGcWYP807Xzf+2nzm6eZaeQTV7vv/c/lyOnhULXlfbsN7N6HIA9xmZfwUpYUYL59UETSiFv9C
	+ctq3/06xI95w0fkCL0eXBlJne3AR0wW074AZFWhHVbmzbYxt17POjKwL6uv0WGVTavikzkmbl+
	xchnYoj4sYCU6Jc7SLZnBQaOyGDmes9Fp2pJifNvA4Jkerih4g==
X-Google-Smtp-Source: AGHT+IHj5HSM54koysPBKGyp+aLPoWZ7WtDHkzYx6U4C4btAc09Z9zRJ5SbLA7UMM3cDDOc37Q88Ow==
X-Received: by 2002:a17:902:fc4e:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22c53664af3mr51274645ad.53.1744989760577;
        Fri, 18 Apr 2025 08:22:40 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde883sm17791325ad.242.2025.04.18.08.22.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Apr 2025 08:22:39 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for folio_test_large_maybe_mapped_shared()
Date: Fri, 18 Apr 2025 23:22:28 +0800
Message-ID: <20250418152228.20545-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

To prevent folio_test_large_maybe_mapped_shared() from being used without
CONFIG_MM_ID, we add a compile-time check rather than wrapping it in
'#ifdef', avoiding even more #ifdef in callers that already use
IS_ENABLED(CONFIG_MM_ID).

Also, we used plenty of IS_ENABLED() on purpose to keep the code free of
'#ifdef' mess.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Acked-by: David Hildenbrand <david@redhat.com>
---
v1 -> v2:
 * Update the changelog, suggested by Andrew and David
 * https://lore.kernel.org/linux-mm/20250417124908.58543-1-ioworker0@gmail.com

 include/linux/page-flags.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index d3909cb1e576..6bd9b9043976 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
 
 static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
 {
+	/* This function should never be called without CONFIG_MM_ID enabled. */
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
 	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
 }
 #undef PF_ANY
-- 
2.49.0

