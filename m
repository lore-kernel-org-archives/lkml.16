Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D032586EE
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748500428; cv=none; b=s+LBPLmwLS9DmzcETK7OkK8P9R1AY50PrOwPwppGl/v8cbvUWP/duUEkCemeYLTu227+R7kxp6z0WRp/WaaDNc4pOzRqP0Z/wUvsRR27vVOvja5VoC/Qr98MnUTFpS8BTzeC/USn0rwclyqgjnkVGVDwH+PsgKOuYLL7D/vc4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748500428; c=relaxed/simple;
	bh=7b378+3r0+KWEehULfd4J/Tt+ZUTOYUqhTFUYPGmOiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sMKPAiAYBJVa9AwMhIgArG4GNu6NczdkivzUQahwZnwhTxCC457LF18N57YsUnOCylqt1U4OG2IXPk5EgwW5rrzdNWv2G1ejmLVNyCun4bwOIjdMqmrDwvf1lME/OIOGYy4wnv4r173npx6l/vGLmCcYwXl9vwF2nAlm9O52p3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4KojXUf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4KojXUf"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad89c10dfabso7899866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748500424; x=1749105224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBsN2M5plJXvWWWmLLNmPiCk2P2hllHuLwIt4QtOdi8=;
        b=H4KojXUfNJGZVXgtxOYWz4OqGl4MldNnJo7qsB3SrjeRoFwYc1NcMZ69+IP22yulGd
         mnc3AepzmYrC408YkHLF65LMz0PEynz6QY8abEfFSGUEF0m+APW2sPX+64/BZQJFnczZ
         l4UijyXG6TKl43cg79vRdSceuMAjUqC+f77xunbtZkEXz0Wbi3o/uCkat4Q2mGyiNpy+
         Gbno4tIYnmTWPifVcJqJ4ols4akyCDg2l0dOqA0pAQSJiQUtIqya2r2QlHbPbnjaGgk3
         XZs89onozPEmftOv4O569airGsmJwVxaayPHMxGsfSobd84FwBc1ry07uYWLHkjhTRV5
         znRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748500424; x=1749105224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBsN2M5plJXvWWWmLLNmPiCk2P2hllHuLwIt4QtOdi8=;
        b=XaJON3ElHR/ElHDxcOljiAdFr7IuA0cRG7OrEG2X68B0+pzHN6ZNb52w6X41GOSGHx
         BAuLCum13FPRfkr0lqTVr+8aXZomR8K1EfDm8D/2xTskxzlJMM5LeBJ43Lr7o2zgESRS
         wihruK03PzGtC3dUM0MjVauW40gzzjZdnKJgl8rVfag8h4A0wVp70lfBNkMqqVQ3G42b
         hWJH17adsrErlajK5gO1FrJy9RxNB3kfrK0Alnep1Hb4iHdUW8jGZuIF/Z2D6B/NeLZI
         eVR24RcF0+8FGd/eEqdhuTXc/CNu+sNKZDS+AYny9eQwzyNs+0rYepcOycLLdNaz1Srv
         +7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKefIBupCApqg+J5Zhmm+r+R2f+An+QVNQXYyVhnP+Ogl36dK2ewKZV+OF7MRa8A/ZJskV+U01R9vYeY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEHsyjuFO0EIUCqSfEI7atKdTD/t/7TvkkTINi191wWFbkjvVB
	ObvZghxlgT6+m7Ngacfyik5NfCrRD9/yL0oWg0jSr8IaE7IKhvjVqzyTIk6MVgiAkkWsoK6wC0p
	Iwsqv
X-Gm-Gg: ASbGncs/k9PVqCAfLN0LF+rAxRRlddducZIcsDHoOIjsUoIKx7NQb8vLVrLvren2A4L
	pu7XIdsZp0l9zDsDOf76NNt4jw2DXzT20lw6YjytSy3gADrj95ci/Z61oMyu5MrxDgFFqTRdCgn
	jXRSdQcWbM2wvoDCCx+2wy9xPYPg9jSlS6cuTYbJOIHhRCqMAjc9eRs7MX7VIgOdfFZtD5R2oze
	dmkCaOkmRRyoBFYXID/ME1qjB4st9G5aa63mTBtAm7ogZbz2x0X2PO1rFpyZ/01Be7c60FmFpBc
	zsApiaa1Tl3Mzycq64SwWpMUOBPp5xx/voRAQcrFKHyUD0DYJN0d0WLn4Gjfbg==
X-Google-Smtp-Source: AGHT+IG+2/O+2ZJBt/UVY6s6MTq2JMb3gjEh9I1cjlAGWV8qiz6P8CgGN3urpopaSLsBQ3Rzphej4w==
X-Received: by 2002:a17:907:7ba3:b0:ad8:8189:2563 with SMTP id a640c23a62f3a-ad881892688mr429545966b.12.1748500424567;
        Wed, 28 May 2025 23:33:44 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d97csm83083966b.60.2025.05.28.23.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 23:33:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] leds: flash: leds-qcom-flash: Fix registry access after re-bind
Date: Thu, 29 May 2025 08:33:36 +0200
Message-ID: <20250529063335.8785-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=7b378+3r0+KWEehULfd4J/Tt+ZUTOYUqhTFUYPGmOiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN/+/tDqCl4lA2lvhDWUP21ndaCSqzhLp82GTZ
 /yRK3QzeOOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDf/vwAKCRDBN2bmhouD
 1wwyD/46PZAK5YWqFkYuY2KPmKMDVO2FnM6uM/TnbjMZJmvWS8VyyaXctFifhG4+l82SSZduf9R
 30A+GCAuN27v+wRjjZ2uYlz1876muO8PzIh0mATcjS4VABBwMP7uXDe5aiP8XNUSni9gI9h/g6J
 gL2X0PrryiluyeiOB5yMioUYpRAqqRVEW0NYqvceCVQA3Q6+bY1czWNfEQJXV1QiE3W3xHF661W
 hi2saekDSqiReXzSfPsIPUIbfkux+wi4R+oymfpCa4/zFF54lclu+5uXqVkXvNhYRDksiyBVAdS
 3EgQdFg8EP9SJdWLf6lnPNmxD3rrwiQxAWD4mR2Xe1oozLvcPysAmU5Cj2r3Ix9rhAxYp4dp9j7
 IWsxGp7NvqDuTgLnvnbdSciUaKPYfrapVOa2atkbC8zVQlOQNBI+MvulyuU3nQK5i9wvloDChti
 RZ2Fd0aZhB7aBfEOZCz9v/HcAX8C4XS+Vm1ifT0c1SYIvqwuc0qVCvlreZMX2AbpZ+wedt6dXwy
 zyEHXL0bVXqqWA79RE/Em26mFnkNMkvnineYjFDjkDVtyQUAzY/OPtJvg5KCDZh4Swu1+uX5fsi
 yVOIcrXbrC5kzGJh2o2dZ1KhoBKqUJ9EGfMAEbIi2GpebPHWDvYdLaZZGmu3e593iNvlhfsqf2x jJA2Dx7qO5CSv+A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver in probe() updates each of 'reg_field' with 'reg_base':

	for (i = 0; i < REG_MAX_COUNT; i++)
		regs[i].reg += reg_base;

'reg_field' array (under variable 'regs' above) is statically allocated,
thus each re-bind would add another 'reg_base' leading to bogus
register addresses.  Constify the local 'reg_field' array and duplicate
it in probe to solve this.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix sizeof() argument (Fenglin Wu)

This is a nice example why constifying static memory is useful.
---
 drivers/leds/flash/leds-qcom-flash.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index b4c19be51c4d..89cf5120f5d5 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -117,7 +117,7 @@ enum {
 	REG_MAX_COUNT,
 };
 
-static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
+static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x08, 0, 7),			/* status1	*/
 	REG_FIELD(0x09, 0, 7),                  /* status2	*/
 	REG_FIELD(0x0a, 0, 7),                  /* status3	*/
@@ -132,7 +132,7 @@ static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
 };
 
-static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
+static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x06, 0, 7),			/* status1	*/
 	REG_FIELD(0x07, 0, 6),			/* status2	*/
 	REG_FIELD(0x09, 0, 7),			/* status3	*/
@@ -854,11 +854,17 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_3CH;
 		flash_data->max_channels = 3;
-		regs = mvflash_3ch_regs;
+		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
+				    GFP_KERNEL);
+		if (!regs)
+			return -ENOMEM;
 	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_4CH;
 		flash_data->max_channels = 4;
-		regs = mvflash_4ch_regs;
+		regs = devm_kmemdup(dev, mvflash_4ch_regs, sizeof(mvflash_4ch_regs),
+				    GFP_KERNEL);
+		if (!regs)
+			return -ENOMEM;
 
 		rc = regmap_read(regmap, reg_base + FLASH_REVISION_REG, &val);
 		if (rc < 0) {
@@ -880,6 +886,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to allocate regmap field, rc=%d\n", rc);
 		return rc;
 	}
+	devm_kfree(dev, regs); /* devm_regmap_field_bulk_alloc() makes copies */
 
 	platform_set_drvdata(pdev, flash_data);
 	mutex_init(&flash_data->lock);
-- 
2.45.2

