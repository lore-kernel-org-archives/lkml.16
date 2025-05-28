Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323927587D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424133; cv=none; b=AaDXDCKNck+rNMY+71vcSNKBLClk/t/GF6zNU6uOvmHSiV+rLlYZKHssDsT0i/H0xvKTwOJdn7da9QBDAkGHmdvQSZB00w4Q/+R/VxQLK+Yd4+kJ2zO9CAN8cZVc5Kzo88LevV4lnC+7eNsavOZl9rTmZTI0oTMOLaLLhML3/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424133; c=relaxed/simple;
	bh=NBrvQMrhx/6hLM6e+tUOgjMzy9y+05NeL0rQjwNG5cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nntjn2ECDbsyq2NtrIN1GG/62LyCmvfecU8BgrtpqcKJRhq0kXwyMYVuWO4ipKLmfIa9q3DgR2Zuyx3fHjeQGnIaOU4/SlUW39L9YsIHQvd5/Ps7zKu+wWuCO66TYJ1pns7cJ2PZOhDqzafVV45L+iR3WeHHZ3K0d82Qz4vLqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECxbcPC1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECxbcPC1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a362e099cfso721019f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748424129; x=1749028929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx2tOr2eY+H+fF6DPR+iLBfDIJ9wmmt75sHUbD+GTn4=;
        b=ECxbcPC1ydBl4yLBQgv/GGSpkdnxTqo+47dQCTLN17F3tHi7wbu5/1KtGkvny8tAT1
         uoXban1vEGgzL55napFURZbapa1c84rVkLwcWOQv0CD5VE9SeM3YFQKvjtzAG9hWsxVT
         Oy50027rbutS3az3vTy116YKiXYnT5C9+BlcOiXG52EwE6ylTDbJGCZobZgSg9ElBN09
         S9DlMST/oPLT9AAXoT4cQ7pcgQGquUBpVzr8hmkZ82+ZVQj4bZsZJXl2Dkc1LN6B7FGE
         PqtTXV4W/oko5hzUDLsDQkYZ6l/Kr2tmzZxkTE9Spu4yu6zgTCcubC2m6n0gslXrNEFn
         Mb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424129; x=1749028929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rx2tOr2eY+H+fF6DPR+iLBfDIJ9wmmt75sHUbD+GTn4=;
        b=ksTDFFkB1OtaS92luvLxMpnJpdg6tyQpaJguuUO/miNuV4ZhOb06mocs1JlJZ4Aibw
         RKZYWY5AQiYYSXQ+GiG8V5gEWzsPGrusGGXOgrutayLKdFSV3/37OhEia9C7vUFjeJpB
         h8bG1dAZ1tgyj/6xFkC5Xh81FtVJxqWvxL2Y4Duv1m+XAWLUim23IANFVkVHlItJpwxs
         Rb0bnXQPIoZndWp7/3lBLWq1wnU5NDRbT+Z9jgnihlO105EWvGFs41Pef3LorXtzzQ81
         Nf1Cqus9xACL90z1GrRs5v3/xz0mfS6YQpEYTNwNgh7R9pqkb6hIu3OW8EgtZnEMzgF8
         gfeg==
X-Forwarded-Encrypted: i=1; AJvYcCVQTYcgf33zFLIJF1XT3sySgN/jN6dXvf/WyyFQ0Qr6RWM5WS5Yb5TruXe4u5ik/uoTesnX6JBli6HzAyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHTY0zgF3pAdWraKysl77qvD9m6HjPwv7JGa4lE5n39JRRpAZ
	vWwx3iPqaSePQTiYrDdc2s7NrIUdt7gn28o4YL3bfFWWNgIjBJrmiVRigpXrzb2aG+E=
X-Gm-Gg: ASbGnctGBB1qfY6fF1CEPXqoHqjxqo+AM078XCq9OmgU3l4GGgIZtcBBg0DsZL9/ulS
	7PZerPFuq5qSnutPXyS70ZcW+gxyCtWDi5I9GvPph/MWZvZAS42KIVEj5Xg1oddTSLNDmxCJY9/
	RGbQg/5dkUK5bVIkuT7M+ImzEbX9Av1FNt3ZT3F21SZhOf02iZBsI6x5KhqeiKU0ao55JK29DCh
	aUHtjqnMczroXSq71Qs/1HVyjtT+rYivCezeQBUKD64McjT3hvCCV1oXKxliAoJMkuZ+s2K73T3
	JZiGhIrusw5BhXuQ/cSsNDMFK8AxySHAZUc6dRGpqSWjC8fXoJ8GJijiZtakMA==
X-Google-Smtp-Source: AGHT+IH5TQnhBjLCtJ2q/cfEBit7Ui0hALJWg1qthF8GaTLBAj1glOoq4NR08mgOFCiTUbTFHl0ZOQ==
X-Received: by 2002:a05:600c:4752:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-44c93caeb6amr53578465e9.9.1748424129243;
        Wed, 28 May 2025 02:22:09 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450787d3be4sm11249795e9.35.2025.05.28.02.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:22:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: st: Drop unused st_gpio_bank() function
Date: Wed, 28 May 2025 11:22:02 +0200
Message-ID: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=NBrvQMrhx/6hLM6e+tUOgjMzy9y+05NeL0rQjwNG5cg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNtW5SA81tOIk5iN4B9Z+3BqC9/qHt646YY3YJ
 uI9jWgBt8WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDbVuQAKCRDBN2bmhouD
 19i9D/0eBMcTsNOBBePfRl2DZ3L4ypubeOhVG44mTQpYX2zsIdOEgGmwhjuOd077CghdZii0sJk
 qdSkTwdpZ28eXWCuOkwDDskSzmWCaZF/9Ex5OQFRSEsJQe337Ltz4y3+KFb/E5hh09XzvuVMbCG
 aPwR0jTfawKW8vW72lIZ70d/gyNq2gM9/pRpb6Nci1v8b7d1f0RNr623SXEO9fd6ELCz8aKP83k
 mJ3aoCIqhO6iXRbo2mwKoEmdyI5x6qqyWlYZrDsC+UsgNNiPS6nzSUq7Dvbg1i90WdlEylZGv8M
 cl6GK84UxYlWEmYX5abbyMAdsT0O0/MTHOua6jdDgbjZapsX+ypR/cBmzjjcVwVuJvr4j0PYjrX
 pVY5fxYML23Z60GMa+8SSNTHEZgQZ9p+CUqmEdV3KBWStCv5ufMECiXT8tnYpbnWaaUrr9ggYd9
 sB69rRw2YhtFFpAj00TrAkfzVzHyDRBo6LgDCu82aOjC6wInFLqaLOeCSkVEn8NHWgDcGs80eL5
 rILPvqvOCf45rWEOVgDTL/i42dseGOcwN0CjxDZ5p2foOGCt3EYQdn6RewBhkmhviwZIcWA7a3c
 JgiZtccCOEtRxwsNF8G6PLwEecG4yqwi7MZIbcK/AI3iNZIkIx9G41SX9Iy9kjb35LpddAxw/6G eIDbZeugPNeCrQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Static inline st_gpio_bank() function is not referenced:

  pinctrl-st.c:377:19: error: unused function 'st_gpio_bank' [-Werror,-Wunused-function]

Fixes: 701016c0cba5 ("pinctrl: st: Add pinctrl and pinconf support.")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index fe2d52e434db..8a2ef74862d3 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -374,11 +374,6 @@ static struct st_pio_control *st_get_pio_control(
 }
 
 /* Low level functions.. */
-static inline int st_gpio_bank(int gpio)
-{
-	return gpio/ST_GPIO_PINS_PER_BANK;
-}
-
 static inline int st_gpio_pin(int gpio)
 {
 	return gpio%ST_GPIO_PINS_PER_BANK;
-- 
2.45.2

