Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F129116F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716226; cv=none; b=Gi89iQ2oeuX1dy3QkByNphPJpiN6MifdNWCxxPIg3YdAUG1RGdVqbHE7LjkPIp4k6rQPlF5K838WD17HXcX4lfkkqMSIcLVvA4P8+vKDN7sMr/dhnnrOyfownD8xzNmUXK+uVobdA+N6wJPdNmBhdJ/I+gzM2JuXXK2sZ7E2M2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716226; c=relaxed/simple;
	bh=PF3l3c0RlgTSrkT0Lcop8ROwRYuJe0YUYCpoN+ANMf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m+ozlt5SUNUXfx+s1c3HqcrnZOn7JM4B1tZ4TsvctMy5H5D6qxPBylGdRE5+FwoMTS97+83U6G+Az5joj3E4sxtExUiScs9IhYzpvH2ztfbTIX/NuIODKLzCRI+LEEZX1YX6H65dPQ+0VzGOh8txqTqcfQkYF+prbwwjiiCniNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M8HnkicC; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M8HnkicC"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4603811b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744716224; x=1745321024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xqiBmH3cXQhVO3Oi9TyesxzQNNmvWhKNONR9ZJLERQE=;
        b=M8HnkicCO+jItc2zihqNpMBT5YFs3bbhUk2b0WuOaHFPTkfgH7sBUbaez1Iv+qHACv
         zIUYvZ/dsaFrt4OTrTFAg09XW0ZYEBZG5yS67TkhMgBeIvWcXqzrG8rwWTtwA6RFC7E4
         wgm4EMXSFb5CW6Q2LQ7O3EfThyOFTY+w9FGmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716224; x=1745321024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqiBmH3cXQhVO3Oi9TyesxzQNNmvWhKNONR9ZJLERQE=;
        b=uASLq9DrbGAcOxp0Su0tqLr4iGFTaFAXQcBc/TTuBCR4hBcDa6RlZO6E2B1MuIsqH/
         IC7DSgfIl3fE0SaJNsKarDWbx/fJd3rFf8C89u8+Au+l001m4wmA+FBpV5DxnvEuKXhp
         tIO43crrtKVU1SgMjh/Vgf4vYOdpFP2VwmnMKYj9q8No7/gYwN/lQv45j7NG3Z+roHjb
         gN5iW/vWbOywkBXV5RjgSab5NYki6RRAL0QxWT8mjoF+N0tiTvxRbccl99PJUpdbCOsi
         IcodEXF3eUmd0QlIbXaFRMCgZRe+YwFemvCjr8TEjpHTSEL4NZ7JbD/zlINHFMY2ErMm
         hsdg==
X-Forwarded-Encrypted: i=1; AJvYcCW4efGbtwVCkUxDwoyC6oy5k2N2r27l2AWb7cJIDWmxDi3hNuO6F9dXj3JQX7UP+wPyczZdjYjfHh0pljo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgA7gGUZwI6O4UcJDYWpPJsfxVTpvnM7+4gquG75Wdkn6N4XxC
	uq2vIC10jTKZnwL+b3xUHSObVzD46rPo5zOAwtirOpaUBD5FuXzD527LMkQKHA==
X-Gm-Gg: ASbGnctBjG0WhBcEkx+fpvMoBUQ8TN4ZLVV9rkK3E1xTU9s0epxR8Nf2a0h+Mv7lSFJ
	F+8tz/U+j0QHdEe8pR7cEe3jE2K/e/CDCXlhGYYXRiNA708mUHjJR77QH5Ra8vPG5aSdnnJmPnV
	nxlDJ5rindbEGKfqFKiAgVGlz2r0oxjhJVIvc5liIDnJzwBuJ0kFlj6nm2eaquK29SRHk3FlGSq
	CKcI7cqS5yLisrv1bmXWSGX1MQ6HMLiYt8XmFbcdJ5mF5fytQViLMsX1C3FzRgPXs4A9crjtSse
	5Nvq7yR8h+bnvvwTjlo2a7rDwyERGt15xVhKrdw9P2uLuydU2mi8CumWvQ==
X-Google-Smtp-Source: AGHT+IHLztgc2AXA8MRVXKVLULr5aHlO9vKzoTKy2KAhml+hRnJpGVjxL+/NKMKFeR5E/N1M9tqKmA==
X-Received: by 2002:a05:6a00:1481:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73bd0e97a1emr19543011b3a.0.1744716224175;
        Tue, 15 Apr 2025 04:23:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:558:e14a:ece3:dc28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f105asm8244136b3a.116.2025.04.15.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:23:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
Date: Tue, 15 Apr 2025 19:23:37 +0800
Message-ID: <20250415112339.2385454-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When EINT support for multiple addresses was introduced, the driver
library for the older generations (pinctrl-mtk-common) was not fixed
together. This resulted in invalid pointer accesses.

Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
what is now expected by the mtk-eint library.

Reported-by: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn/
Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Stepped on this today on an MT8173 Chromebook. Thanks goes out to Uwe
for pointing out what was broken.

This should be applied and sent to Torvald's tree ASAP.

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 91edb539925a..7585de11854b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1015,7 +1015,13 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	if (!pctl->eint)
 		return -ENOMEM;
 
-	pctl->eint->base = devm_platform_ioremap_resource(pdev, 0);
+	pctl->eint->nbase = 1;
+	/* mtk-eint expects an array */
+	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
+	if (IS_ERR(pctl->eint->base))
+		return -ENOMEM;
+
+	pctl->eint->base[0] = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctl->eint->base))
 		return PTR_ERR(pctl->eint->base);
 
-- 
2.49.0.604.gff1f9ca942-goog

