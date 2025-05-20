Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7055276022
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739617; cv=none; b=OUowjdaYS5ILu5vy//zWmkQxwJ1Vx5Jzt5LJ0pG7fSEJcF8a7AWA6UHu1HcSu0l4u3S37Z2WlfDUQ4VNlUuaBvvcPvCndu+sfugKIkIznSeBg2ySvFlReuu1ICRTDBV+1MMbjBEatTWT97/ZW+TL8N8on/KVK9XEG2Sa6gNH15E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739617; c=relaxed/simple;
	bh=exVZFWCvYTW3X5Aq8gygTLrHXFVVVXwyjtGZsGCFRu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vD4yp2N7bK66C8Zp5saknKOk02zdK6ooXluQGo6YFZzqR9SO3wvDtg9zy07IwHJs0lYliXxXGGHvXJN5BN1Pv4y1Hc4QYK5ZN0/E+8x9DfjnpGfcEQ6o4Vx7pP0vr5JLJGIPzczOUb5vhJEyhGm+KLr2eG6RLG/KVmJavgy4PwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7oJTeUX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7oJTeUX"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad5767b448aso20443166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747739614; x=1748344414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
        b=y7oJTeUX8dZ1zGGLPG38SWW+mw6sJQ/TMzTCBJSlWHwfrJyI2RbFXJxxhYb3agbmHA
         MvorxyXOn2Mx4eLXuaaJP3lLmOmy3GeQviI+e/xmUXZzzp6rCzQGrfUhm1Je1wHBIxDQ
         60eElrpc4jWbsCxClLyf5agjq/cTsPXtFcJlnNehd2odGM94vZ6ZE2dCKn5VGgQZsY9S
         N2kNlSoG3Oi1e2aZtb0mVYC8AjgObXHy6XKm44GKOq5HC0pBuLFn8kbJmhVCg1I/rjgS
         SHdYKKkHQxUl/N9aXX4F5vAQkCilbSyoO+m3mPKswcDkSvPeIeDWzu6UJ5wbj3tdHqeA
         K+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739614; x=1748344414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
        b=HvWZMSSc9FjnLNXtgYmyeK8ASs2yRHShommBmwq1e86+7GSsDQwmme8wDcazzTNq0+
         q+ql8D6ThgLqqCh+YBrSD87+bJMaT2HnjtppNfphF/pmF0Fw2IGQosEmd7mdd45V06+g
         zYiryzWyNH2TcBCCJ4Vx/+zxed+I/+FRVCQBogkKKXMwE1W722RPsZd4RJF05KhhZBo6
         tRMR0cGcntzRKQCIkWlVGP7e0o9VOFD4U3VKm688qYtpth5FmySHZjaQe0/X4ebrG8DQ
         lf1C9/r/dBdQTuXhCs+1jxZzqsmCKnRzo3p2P29RnKcsxkDjFNn2eud91rzfxI7rFOQ2
         9SgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsb1zpjvct1aF8CitIz3DodXNooGvgdqMhgtlzmF2bd3z0mIVZCi93zlaowQOQ4+E+8foVs+qU3vpy/xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/H3G7NWuuUffK4/Qs/kttQZeAfGWQs3ya7K1xTpecKhk0TFY
	UjM54dnhpw4023jFSNN4C5OV+AtvbkUxSO2CtfKwp1SoU77hlxSTi2ht4In+qsH1X5s=
X-Gm-Gg: ASbGnctOpeDRWA2N56PKSKI3bLDL09Z00fVTduvalaiNy5htbSmDidB4PLUhh+yLkCE
	pabQb2PubaH23MlXUb/oZ7itP+35snY6IQL9WUP2h99u8OICVY6NkEzfPyqi7v/0LGQRd4Q8voF
	40QqYbibYRzFUSlnGYTW7dU/SdVxGSo2xSwhlpta3rQlVoUgs7Uw+w7rA3RCfw86yJex6CyRzG0
	e7ZZsIOquwM9oiwe9Cg9W9xrR2I21nbH7mXDvcJ/1Uv4bSbLRVyHMuUn9jsxQlPmBiku0RNw+8L
	YGaw6+OlCdxjGI+eB0lhUPtSLcs95IhqyU06Mc4PDPGyKwWhEZrNwmseXg6tsg==
X-Google-Smtp-Source: AGHT+IFFcBDcparokAPL5zf+2MVmyXm6MMa40X1yEJQwnjwLJ2/1hy2g6L0BYpZ3G9y+lJt2xMiYYg==
X-Received: by 2002:a17:907:2ce7:b0:ad5:28f5:fe2b with SMTP id a640c23a62f3a-ad52d4ce281mr470163266b.8.1747739614072;
        Tue, 20 May 2025 04:13:34 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06dcafsm729676766b.54.2025.05.20.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:13:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Date: Tue, 20 May 2025 13:13:26 +0200
Message-ID: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=exVZFWCvYTW3X5Aq8gygTLrHXFVVVXwyjtGZsGCFRu4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLGPVUPKROx0QJfCbeV9e4WfBu8DXgXuh8g72/
 jKif7Qo68CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCxj1QAKCRDBN2bmhouD
 10/kD/9jtNDXdVvPG/epppsydCeNKKYkfy5GiosLMLkTw2AlTI+faS7MwaR/KH12qRYSn9JpZ3S
 vhFnGpBmA0ZAKfCYKRFc6pCmbdvAVp4oc9I3PQSbUrgUJDMbVclf9wZu8QC7QdrYJaJjhhI6Fyy
 95I96JTEEIlHZ++cJCGIm3N3rCw45GJaUlaIIIvfV7mzU0906I2WR+vJPpJ/5V9LhufwDtdMAJG
 rZdiO976aT+nt5kaN5gkaux274MOL9WVK2wNfHpVd3BmoE9f7ktSQgcuX1dzcDcNu0bMLvcDuki
 DjS4XAwZcVRH86XSeoLxEKwySguj5fZeSvMtlk9ZqfPXWzgr/Q4RTRlwI5/q9pPL/bNK2b8Glp+
 O22ndNnkmA6wfpyCKxkliWxS+RBI8RBF8M1Wtu0Qu+BP6P2+GhVKsODGFPFPTX7+PXFi25vvxWU
 lnFxnZ4D1+5E/1UPmEiZcx001aLXa6e48MwkWCVGB8C9yuHEONKd19pyRv4ytTqnpS1RPe4awgR
 9+k5aNcBvgDyc8rnjaXWfUV3sqVIeM7NYHOt1q+03j4FNY0f9yjoGVnDWk4IymXQAtTcXVEsoff
 W3QVUZk9QlqM05zZyWOlsR2Sgt8cf36zRZpq4Hz8s9/IMk5x+QjW7dk8KVB5igadGjjLJXRQPZS 2T9qrqXbYy3b7SA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver unconditionally saves current state on first init in
dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
divider registers.  The state is then restored during probe/enable via
msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
dsi_10nm_pll_restore_state().

Restoring calls dsi_pll_10nm_vco_set_rate() with
pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
VCO and messes with clock hierarchy, by setting frequency to 0 to clock
tree.  This makes anyway little sense - VCO rate was not saved, so
should not be restored.

If PLL was not configured configure it to minimum rate to avoid glitches
and configuring entire in clock hierarchy to 0 Hz.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 9812b4d69197..af2e30f3f842 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_phy_pll_save_state(phy);
 
+	/*
+	 * Store also proper vco_current_rate, because its value will be used in
+	 * dsi_10nm_pll_restore_state().
+	 */
+	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
+		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
+
 	return 0;
 }
 
-- 
2.45.2

