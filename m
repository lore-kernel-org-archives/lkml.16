Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DA1F03C9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123513; cv=none; b=NXj3RqAGQZPJEJqsUw56YNOCK+qZqQD+5Tbsq9kfCnPoV09ktZpBKwKa1FnBHl7Rr8F4zWDMDnqAs0SQ9Q2tg2fbjtJR4LX1c51cQMMq3YTulgDy3zRf/LRcnSptC9QBRMubacxh+8aiHRS5KIMjnA4GSiyBHmxJojApRgJikAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123513; c=relaxed/simple;
	bh=Bs65hmBerDzw86WHcuc6JfzqzQ0LGwVtKANJRqGPlxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsBCXAZEx6RvEXxg/k+6RN37r1ckoxdASLFo7TiIqicyR0um0/D0bsLOdL/nNVwq4yapT8I4+YoQG5h9uPgK+lgOA97gPJqHmler487fd8CKUMfv4rajgq643/gXxzRqb5gqX7IqYW2MiwFJ5W9on1BLsx+6/Ag5q2wOfsWvwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDWsfJo0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDWsfJo0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1929355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746123510; x=1746728310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/UMJQK0fDPFna6VgYR5otfjgezyEmqdwAo+cCcx8Gs=;
        b=cDWsfJo09kgn5BR1GSNs4UNnKs4n97/87Z/Cg5NNfk+ESkXHlThSfxH1U3Vr77KVD1
         uTd7cGsYiOX4TK2yvTxk+MZ3YYpkb4Eo/zbPLiZ9wNhHe+DuD3YiKoMYS+l7VCHHKX8W
         UHDXF4nbBG9jccGlWEyzxucgNpREfUqtN2gG987cDKYxxJaN1joNj0eVp9vil8g7XEn2
         FsdxFKw3JoiTU8PcN58AONDAJDj14dl92nu5tw6IdMIgeOdnUv94l02J71bb4E1eykVs
         nEWD5htJY/SV+nOMPmKaL2AkY7cr5e3+/jydlhjj156iletSZqlTpB+JCbdIOcQ3Hsyj
         d7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123510; x=1746728310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/UMJQK0fDPFna6VgYR5otfjgezyEmqdwAo+cCcx8Gs=;
        b=AfxBa+2FbzDjCUquJhkxliqlx3B3FPRE8r/bl+dpqOGeQYzdvHI7WJRBezd72HmVDI
         7vDzUOd9ScOeYKLka7wW7KibXgNKFbesJJeegtPd6tDV7aNIxLKlO5iy7dw0F4pf70ss
         FesUPGydXyjfqktj1L+WhNpklzz6BTP+pT+nYn4iRcNEF04F8bkMbzKdeRsIMQYfv942
         WCSHSBnA29QLI027y/B6njKSDKcnvNiNEg/JKYNBAlB1LNV8CMsH5uk8KfUL1K1OkTV6
         PEpSx76F1iF14phOHMHTe//nOJiU8iU4laDfgflJK0fQJQ9ZC/VbLF0uv+ANT0lBoBZI
         E9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBilr1bPiU75FLwThsuJ1UtdTN1rnP2LThVfUBhTvwrC/AnNz0eiGChCV6dACtQ4Znk6k/yMtLeiBbcIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjgOBoJ5XZ+aJ/Er51fVD5SQ7LNQs5KvKStXMp7tQHY6PiVfWc
	zNKIrEui8+eYI1XcdEc6Wunf8JsTw6QL6kaab67pJFOP+L2LOgN64iF/12H/jMU=
X-Gm-Gg: ASbGncsQ1fDo2Y2x9HEw4Qjoe5lUq/ZBFxzMX1MFwhcja+0FZaBJjrMIMoI32I1HEXp
	aBH69CbIzvN4YJ8qzo23lT0ZN0NgTftStycdSLFWs/LQM4YgCC9ml/66LQLUqR8L8oFY6uMNtPY
	IoEJ6C0XLXy5eUf7IHsaU5739qEatvSmTNe+4mZeY1EwUBWd3cUf4qEXdZsDLO33nldbWjeGVnU
	7lOtWxiAZOVFSG8TuBC2mEV6cTsetf+cVBwM7Y1TkIRFDtOK5mOpCX+3X48Mza1eeg19cct2IMp
	UbbO5G+fSQJCsAjWfsAag93Dw0PqP0zIC7WKnbgkBWqUvzZ37Q==
X-Google-Smtp-Source: AGHT+IHIEo+ZAu1k9D4WsfxJ/FXqeihHwzbmWF84AvD4XscMnqNtzTlfERKxnMsBfMPW4udchgmQjQ==
X-Received: by 2002:a05:600c:c13:b0:439:930a:58a6 with SMTP id 5b1f17b1804b1-441b2dfb921mr26362435e9.8.1746123510017;
        Thu, 01 May 2025 11:18:30 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28dadsm66947615e9.40.2025.05.01.11.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:18:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mircea Caprioru <mircea.caprioru@analog.com>,
	Peter Rosin <peda@axentia.se>,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning
Date: Thu,  1 May 2025 20:18:20 +0200
Message-ID: <20250501181819.164207-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Bs65hmBerDzw86WHcuc6JfzqzQ0LGwVtKANJRqGPlxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7rr52rnbp6J10hjkoCkTBnbws299vlnojR5b
 tMyhIcjrHCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBO66wAKCRDBN2bmhouD
 11NUEACJRat7dfQhKRLOKvPe2J7Fbg3zCopIC7s0WKOWA4iG8DmhHWjxOI+l84kugo3I4Zd0Mke
 2JnDwn6R+nNejHBKc5UyTNBYeMh188of/kP8IvR3vb5nDH2J65pLwPXbH3Est1ucDA9y0j/0mLY
 O/5Qrr4FhnLksHLlgV1WQeOP4Ld6GI6B3zEetXZupXhLwDmOJA+ficbJEZZt8oX4H0/wPNJTDMl
 A6oyWVOg+ab05Z5l+81IRLfBq/szZjytyedRqaHsjxwhtd6x05erAVBJJRvMIgNrDmgMKouAkDm
 agDRDVFjwkFe3Ti+zOCMRRzuHczzOnwdQHHIZP6s70x+2mjTJh4fzpAuOTnIukV4dVqEDqhu3ce
 uMy7DBD18k5ltSqyLcAe9mlA485gY0JQZRlpb27YV+NTbM4txmg1NMWTYMnqlimKNo7EKCGXeQo
 mDEJj7QqoCxdAOLKnUR3JnfovNEv67LS5xN2Koh7uO1nwpUpZgvImKzVLZcd3qWU3TmIAx5JUlF
 WmzqaL1f6wSAwN95ErQDONQhdsBTUufOWkjNgAAeV9rHyRXkPzox7NRRgogXO+ewg7dg9KlplC7
 Yw61SMstL1P1nfFC+jJoPA4x0+x/iweVsB6mtUJmfpCExCQWKTCU3dgJYMweTxPU2RvMnXmdkIp ioLisIwKuvFeGqg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

'chip_id' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  adgs1408.c:63:12: error: cast to smaller integer type 'enum adgs1408_chip_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Use kernel_ulong_t instead of uintptr_t
2. Rebase

Patch from 2023:
Link: https://lore.kernel.org/r/20230810095822.123181-1-krzysztof.kozlowski@linaro.org
---
 drivers/mux/adgs1408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mux/adgs1408.c b/drivers/mux/adgs1408.c
index 5386cfedcb06..5eaf07d09ac9 100644
--- a/drivers/mux/adgs1408.c
+++ b/drivers/mux/adgs1408.c
@@ -59,7 +59,7 @@ static int adgs1408_probe(struct spi_device *spi)
 	s32 idle_state;
 	int ret;
 
-	chip_id = (enum adgs1408_chip_id)spi_get_device_match_data(spi);
+	chip_id = (kernel_ulong_t)spi_get_device_match_data(spi);
 
 	mux_chip = devm_mux_chip_alloc(dev, 1, 0);
 	if (IS_ERR(mux_chip))
-- 
2.45.2

