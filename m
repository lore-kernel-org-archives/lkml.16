Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91911DF26E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 19:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743275250; cv=none; b=UkOv9BjpftioBdRIuYJ7JjEl6R1awV6Ocor4VhLdS3Wy+fF7jt9RJTQwHGbMFQtYo0G7ymOdXrTQrYtuglV8T/XteWyi4Wsm96YfGpQCXVkYisirHDYGaCCKX/uKJXQm3+Wx7579w+ZNEVEIUtz3+fxwhbvNjNFmyovFXjA0yMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743275250; c=relaxed/simple;
	bh=4zP+jYalZt30nqxNJ61sdyKXLyBC1cY5RSVeldqbHHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHO9p+1nFuI+dExH4HQ70skvhwMVYtfQcoK+C4NcilStN1N0IxTrpe10MFu6j9AUqL37PYrYzhpj1iqeDHFBMVpJIJ2JPQU+iO2Ep1wsaG7Oq9n9d0GLuasO7uPnvxMh8ysBNhXBLEgxhMPU+izpdpaliOHrrNiFkhf/Sm6RJ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=BEiqiAwb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BEiqiAwb"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so4978135a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743275247; x=1743880047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zCE82IEEUW3OgJQOexggjw77Krndyt+WM9SEFSCbzs=;
        b=BEiqiAwbJB0zTuKzsRT5Z2WsrdRZd1DRUnpTNNNIQKn22XAzxH9o4s3dz5lESPzbyh
         2mXC+gwNxauklbWP0Xz7gbhq/IRScNsflQ9JHeBG7P41z6y9H4bJB4Q1Mggexqcjpbxr
         90mc7SxDMlO8yyuX6JbPjflLElIL6O1p8GD+FuzWNWmMPA3d/M04K/2lSvDtmKkkjfZL
         k49VzN3Dg28a1Owz1OvjMuv0HqVf/HTiLac3i4FzhqDJL/rYkJsGRVIvaBkAB2qj6lQB
         vkfct9O69G+XyRdUAMJbX7d9MgA7huNv3x5MB7I+RoOdc34jUCsxsdbiiosPCd9lfUeR
         bFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275247; x=1743880047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zCE82IEEUW3OgJQOexggjw77Krndyt+WM9SEFSCbzs=;
        b=OtN3vfsAKDnceetqcPMeM7Evo45ZyrIw3ixMoyjnDjSlYYxiEwACoBd+xDixyEIysO
         3lDwr+PxI7+FV2WRUl3LOSriKkeIYyxVfRxlqCjOR0cCwppHI1l7xFH24+H9uvCd7jbn
         hAAUbAujPsodh+lzCf6sj1Ir5G9OWc2Y7VEtD0HRBoViW0tAS18N4E/OjX4p8081hJQz
         ebQY470RPzqYIEbEY7grKqawXrkqQeayZvV+ZjbAksuPO2WX8Da5H+XYImZ6gt1r+ZEy
         d1ruRTwglHiXPDS0117wp0LeMY25Lk7YGfh6cg6AFgWtPdDR93h0cH4fQEp8L6Yl6u1B
         BNIg==
X-Gm-Message-State: AOJu0Ywv+mhTDzGWHmJvTF7X6mPSLlNEHId0Fh6s2sB6GfDUK9PPQm2Q
	3X9BK+b/E3V1NI7RGzFD+aJx2tWp7Ix7DpWU6jn24U6B+OgJ/GQF
X-Gm-Gg: ASbGncuYE0GfJHL0WCS+e6DJKtX8XUQXLcf1E0O0dz1/fa+uGn/gebUzoqVUoqQsrdO
	01q6DUR1afftHGAmxQcP8Edq0zbsZLaqTxu49S6zW5QIv81gyvGdv1qK757fG7wBcozPHzbwPOM
	Yx7JffYTA0BqoycfPOMf6CJfM65sCTMC8O4LAxCOwXUyerUu+WHpuRQHgrLregxjsRQK78MkrnH
	EvzWJO1Z0xJ9nHEsljs9mOK28O/1RLqbjXOupQLW/DX0Bqwr+To7ieG2ggbIYR1FSAPktBon3GM
	fjDU6ZBdlDq07FqGisEPaIWy7r/BhIb9OiZoqeKDvg0L6DXdCt1ggOwlqm5AsPhiK7tgh/pmSGI
	p5HpWZq1ZoRf0rn4s3xKmcLIsKz3rXd3fAB+t4w+BUhsK71wnD8P57FzzeyWOavddm5Dadw==
X-Google-Smtp-Source: AGHT+IEWt7Qj737jJHCaN2ZyByecAgGhDvAAdbgZl/B8p5LpJrELRizAUQQWktSqw+FFBr/8ZteT5g==
X-Received: by 2002:a05:6402:2689:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5edfde2067bmr3759805a12.27.1743275246879;
        Sat, 29 Mar 2025 12:07:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aac05sm3275271a12.3.2025.03.29.12.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:07:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 2/2] phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers
Date: Sat, 29 Mar 2025 20:07:12 +0100
Message-ID: <20250329190712.858349-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These require less code, reduce the chance of typos and overall make the
intent clearer. No functional changes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 28 ++++++++++----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d9c761b7c15c..a553231a9f7c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -165,8 +165,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 		return ret;
 	}
 
-	regmap_update_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL,
-			   REG_CONFIG_CLK_32k_ALTSEL);
+	regmap_set_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL);
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
 			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
@@ -175,23 +174,20 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
 
 	/* reset the PHY */
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-			   REG_CTRL_POWER_ON_RESET);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 	udelay(RESET_COMPLETE_TIME);
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET, 0);
+	regmap_clear_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 	udelay(RESET_COMPLETE_TIME);
 
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
-			   REG_CTRL_SOF_TOGGLE_OUT);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT);
 
 	if (priv->dr_mode == USB_DR_MODE_HOST) {
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ, 0);
+		regmap_clear_bits(priv->regmap, REG_DBG_UART,
+				  REG_DBG_UART_SET_IDDQ);
 
 		if (priv->match->host_enable_aca) {
-			regmap_update_bits(priv->regmap, REG_ADP_BC,
-					   REG_ADP_BC_ACA_ENABLE,
-					   REG_ADP_BC_ACA_ENABLE);
+			regmap_set_bits(priv->regmap, REG_ADP_BC,
+					REG_ADP_BC_ACA_ENABLE);
 
 			udelay(ACA_ENABLE_COMPLETE_TIME);
 
@@ -214,17 +210,15 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 
 	if (priv->dr_mode == USB_DR_MODE_HOST)
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ,
-				   REG_DBG_UART_SET_IDDQ);
+		regmap_set_bits(priv->regmap, REG_DBG_UART,
+				REG_DBG_UART_SET_IDDQ);
 
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
 	reset_control_rearm(priv->reset);
 
 	/* power off the PHY by putting it into reset mode */
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-			   REG_CTRL_POWER_ON_RESET);
+	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
 
 	return 0;
 }
-- 
2.49.0

