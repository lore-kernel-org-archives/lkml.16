Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F12F2D
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748200387; cv=none; b=DxFVlDIGBHai09gOSJgB0FdEQTIZJIF+BxSuAVAP6Aa1+k9U3Pzhii1a8TmsEtxIjOyvLHubG72qi4Szx5fKzFTnETreU2KdPTha725cPlRiAMJFrRJwrItU4Gm9C6PQg3vr4sZapBpfDiHZXIfdIPf5PtCis+gj1DMEm5XLtyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748200387; c=relaxed/simple;
	bh=UodeGMQ8/36hFynpdApuECu5dDrxfqy7USHoaaccAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A6UQdiWl4dlE+1wGlpIDwGRaC4pV2FBkeQMGBz1vKQRIQsxIXCxWy0/fUjID0+5hVzP8fuL7qr9pPCDy9W9bkGt1b4irF/WKlox9Etcs8eSvzr7qiYs4ntq8QfLyQQiD1pYi4yAeTBiH5coEmHrPI1LZPMv0O0GQO4J7J0zj9U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dipe8c/X; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dipe8c/X"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-600454d4798so248278a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 12:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748200384; x=1748805184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ucq3gyLAIGSeXu4sFQOwhmUA0D2m+wAOAZQ5q93w2I=;
        b=Dipe8c/XA8PxCSNwhw447aFdu6xFSjfdfHbdcyFBo9++e4J7XquA9do/JyplGQr3l3
         +nGwQbvvzelpEiFRkiFNC6Hk4oo59+XMnkG+X4Lb/kaVHE73j/LVMDzo+npOSFh/OEZ7
         1zbtye4V1IUKI04tHKLa3ZWJeX3vN7jit/OkeMgxFiuebWrjzFyIMy0FAgRn5tVZT6+V
         nP7g5Cjy35m0Cu7D9PyOdZyISTjgtH1bqebVwAdXPoBcUNRThJ2uhv318dpDKeLu3EiQ
         VyAN+LFT03Xn45m69sD5cQQmoj/+JPmkLs2kS+Kc1xOoFZcM3NhlvIeMUl2gHpwWan8E
         bl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748200384; x=1748805184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ucq3gyLAIGSeXu4sFQOwhmUA0D2m+wAOAZQ5q93w2I=;
        b=arwj7/P8w+nDlYN1VScz+g1D/wZLGu00Age1hfi1Vt29bSaz0IXTRfgFV8MB0M4AvX
         jMpSML0Phxrx8Az0dhVsOqOOl/7vEE7zP1qzYwZU6s90ut21CE1pH6v4NE2HFxzzLlU1
         Gx173tX1GlT/B7Ilr7HsTE5+yiy4PlhYub+2fneqcs/By5SezwcdQuAfHtP0bmiknVru
         8hfl9du5qAAhPx3YGpkSsJSpb0miiRwhUirg3z+XCmkWrR4rLJgcnld9a+qQMnuh3jUk
         bM9TXXc+WP34a5n218AZSeh11V8bvU9i5NSSicdK7U65XPvCKGeC5xmPWG1wEpWJKYrU
         +xCw==
X-Forwarded-Encrypted: i=1; AJvYcCU1ShkSclPwN56YuvDg8GEsq3+QpYyD8gzT6EjMVxdBvhfW4Tw24KHZiVE8cxsgpsLBozvfdHtxzoupRIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZXLQANigWtR2gYKg3AHbGMMxxP0RrMh1wPyAaOJPg0ARuN0r
	A94QAHgJj60515YNoXtmvuCpao1kfu1mkU+5CXuugp3pGhUdp4vE5ZnO588JPP8k4KA=
X-Gm-Gg: ASbGncvOvvzM9NmvDz8dOLopYeSSqWiS1YCuN6aAHmzEBEzYfINpCYZfAKQIPM1F+q5
	zvDj/nQMLG0cwVxEp1QExRkY6EnZUAW+75mPudu5Rp83Y4OQ0FO4FDF+dZb1iO6m0dJNfN+YfH7
	2z8JKa6FY2Zt5WlU8lu6r2w2G0LVVww9b0FhlQhYvu4exxgZtnxUHv5OrgHw/uPgLCDQ304cwL+
	XPj3HrqU9nX29YPVUb/kf0xp41RO/ow8FgtLf6TJpZk2RVEZzGnLXUY+Umw8DDcXXoGYlYtHmId
	ZgEAZ3gvkGey3G5wWeQFjSTfMvqbalwsl/5Ea/tjTFX4TUNMIKGTBrcp4cakcg==
X-Google-Smtp-Source: AGHT+IGf+2TeC9QK6dYZbJRoR56I7p53ILlhtD29asCKt0/mN+wu+zXhz6Rm84i7lO34hXxNMSklQA==
X-Received: by 2002:a17:907:2ceb:b0:ad5:1ba6:2177 with SMTP id a640c23a62f3a-ad85b07045emr167132666b.1.1748200383657;
        Sun, 25 May 2025 12:13:03 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cbe90sm1554533466b.165.2025.05.25.12.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:13:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] memory: stm32_omm: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 25 May 2025 21:13:00 +0200
Message-ID: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=UodeGMQ8/36hFynpdApuECu5dDrxfqy7USHoaaccAzU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM2u8ux0aH1Fna9DGhdBNraJjTPdmFk5vieE69
 Bby+tFVA0GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNrvAAKCRDBN2bmhouD
 17PsD/9JDR2rnMkSvRHRyOxDJn9SHRhKbdOGbr/z2BZUD2Q3Udhuoagd9HJVcK/w8YczZc4hURK
 lU8HwJvJQmqZeNl52AbkfdE8AQwCm3Gq527piNZIF670p3fu4fvO6TTCfr0/7pQ0EypWkBTUMAq
 g3ntprR9Ltc0PvMRv6JoILjlg6iFlt+RPV1uWm9Dgs04QX40e9IoEmD/s/eX22eKaAMQKWiqInb
 i95/ALzUOFJK0UCt3WclL5kUv+Nm1jfgr27hV1A8uHuWQox2jpxqG+M2DxVenEhV8trKn7kaPPj
 AfYUg9qHg2KcZRAxoitg157g0y51YJDMWzRIyBRJuhO4b0H+w0X05yLS06CpdyY7dBQpjFFXv0G
 choT6n8YDDBtNDizwrSFeULMn0ASaThqtVctlLgzTUnbK+2br1abXSYlqOwaMiA7+twzcsX0yBa
 6+ko27RDUB7Kbu4FPFa5Iwl5VUqXK/oleCKlFPDdcGj/qYBEYASbYoH4wKYXy2OeKD3vFQHzL3x
 4qvgO67NFLfAV5+qEpCKQ9LcmImXPccX4GmIpiX96mGIm1gmmmwV5bCuNVOS5XlxHHpuyD4mLzb
 DLz3cX+M4ExbFfiSOMwBZQkd3UEOIohp5u2llvVQJY8ncZ+byPDkrSrYrUPLOMJV2JWJnR0tvzW 88dCxUyJBpvPfPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 drivers/memory/stm32_omm.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 79ceb1635698..bee2ecc8c2b9 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -46,7 +46,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 	struct regmap *syscfg_regmap;
 	struct device_node *node;
 	struct resource res, res1;
-	u32 amcr_base, amcr_mask;
+	unsigned int syscon_args[2];
 	int ret, idx;
 	unsigned int i, amcr, read_amcr;
 
@@ -98,29 +98,20 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
 		of_node_put(node);
 	}
 
-	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
+	syscfg_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg-amcr",
+							     2, syscon_args);
 	if (IS_ERR(syscfg_regmap))
 		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
 				     "Failed to get st,syscfg-amcr property\n");
 
-	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
-					 &amcr_base);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
-					 &amcr_mask);
-	if (ret)
-		return ret;
-
 	amcr = mm_ospi2_size / SZ_64M;
 
 	if (set)
-		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
+		regmap_update_bits(syscfg_regmap, syscon_args[0], syscon_args[1], amcr);
 
 	/* read AMCR and check coherency with memory-map areas defined in DT */
-	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
-	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
+	regmap_read(syscfg_regmap, syscon_args[0], &read_amcr);
+	read_amcr = read_amcr >> (ffs(syscon_args[1]) - 1);
 
 	if (amcr != read_amcr) {
 		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
-- 
2.45.2

