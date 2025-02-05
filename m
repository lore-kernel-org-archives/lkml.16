Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB32163BE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749684; cv=none; b=AZcZXVaDouFFLfviWPZbL6wcHSk//Qrjr+NpCnpSoW7HCM5AtQTabsjzJ/8bVb+zsnlMz9t4XckkrTr/OvLwyXiKF0McOD5NAK3ue1WgIC3TkomJwfiEctZU60iYpBkaur1RNOWP0NQLlD0nAKNl0HTWZwol50A6XSoibdWlodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749684; c=relaxed/simple;
	bh=qxQVPA/WkzIwKFhwjbzk0asjMT7Gj4GjjUTIhYbbZSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ff3vpjQp5P+mmMn/QVXutQWyAEEVvmMR1Yi9JIBBQL+FTspYFjTcPAPfjucTJko6nq60HjXv3wYQtH8bEBjD9UV42TU2aJw5MvlH6Jx2UoeqQknkcfP+DQ6jySuowzzYmqltUEomWWbTjMlWEVRdzLTGxTmNTtlnb9OQHeskauM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SmfawLuR; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SmfawLuR"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dca4521b95so6757970a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738749680; x=1739354480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PawpytiL+xRKfNoRH6voDpQKdEbDcwFfD1fKVQrBak4=;
        b=SmfawLuRPd5EuKSnmk74AuoxJX6nLusbRL10fM33owwxTeX/OgjNvxN77F026LfYaV
         7F1qgtTLh8HZxngQKdGeIFFXAu/j9zVyTDMUHym2vRCDHsASK+ufQLKm6e/jOMOmI5Gy
         JUJSbK4K6gJGbGSVOIK3FthrAMLOBDfqsQVsaMWCHLQM5HPj/xZPBLkTqaZ1Zb7yA7Ot
         oH+KHvsjmly/B0SkRQubfTXW0/MxOKHc51TYGmRPVHenEXvhcPc/XHuZ3eZdzAnswVSS
         aZmwaYT145wI5YhFwJ1QZg/FQHcprxLMRSflhKnePwUIlpz3taWJrltzb14QOi5RwTAI
         hnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749680; x=1739354480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PawpytiL+xRKfNoRH6voDpQKdEbDcwFfD1fKVQrBak4=;
        b=EogwJ1AMU7pnKLy441H2DiyW8dObUAm0Z/7z73N8lLF75EankcHOEeYg2J2YVBwvi+
         wk8o1AuZocl+yeYYN183fPYBKvK3VPNtMy5vUklVI8GCmGveMF+o9/YoF11QV38Yv4DI
         fRct1wB9dh/6omx3sWdTZp8X+dLJEZEk8+E+PbhQQZzqQx5bfsDwXJfD+snhPQpXadtz
         ACaccQGOk0Cfhgo3biHP9/WoTRAWzWzkk6+KqUHooM2QbWbFOzCW+XWRLBjzdbrGzGpk
         5GckDz1bhhcLYo1n5pBjCpHRMZkOxQF75UOqlzLt4tWuWzVacTFNQw6G2Pv7GQB2LgVj
         aYjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUeo9J2JcwZmK3jVRu15p4GxnkYsSAg9ahyYYYvOJjij3xkJu63/ehsTC35yCYbD2s6XZqsgR6ZCfyX4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRo3C0cKU84NX9+hiTTLKHS42znZuPj3B7j5P8AA4M04Gt6nU
	gWxMIMf9jZfAOTYgY3BFu6vXmYsM9E4gDiFuwDs3R//prQmUDkgaxFTXWGrZtKyBoY3ymkK1HyT
	W
X-Gm-Gg: ASbGncsGYhAYCc0ovo64/ME3uREIgoqiGwC+SVwL5h94Hnifj6xF8/mqFFf5cwAWFWt
	b68k0Lg7lKAlrtDAW1A08vJXltojUr891X6e1ZhEjzMUiwCj5P8jv74c3Kjv2I7U6ZqciE9DGtk
	jPUudOTRyA1ut/ImCQUaTI9Kv/z0KQ3ikA5a/SDGN5XBGqdMy2LBeyB91xqu2zFRTtPsM11fb3R
	2Uwah0lKVAU4uH6R/QiP956gBqno2GXOV0mpCypWUK/vSuoLq9voj2EYDIknMb+yDgS5Q2Jx7+6
	qxOKXEqI8eoqtYOBkxEjwzHI3e2I5uXXfpCe/SLicvdk7A==
X-Google-Smtp-Source: AGHT+IGRR+qNVvpkRYMLNfhpFnPmKPB/WLt/GMn1HCiYzOXe8y+iOI6UbcyDsiRPDcMDjFnJzsBNKw==
X-Received: by 2002:a05:6402:280d:b0:5db:d9ac:b302 with SMTP id 4fb4d7f45d1cf-5dcdb77fcb0mr2613484a12.32.1738749680235;
        Wed, 05 Feb 2025 02:01:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724d9de2sm11130554a12.81.2025.02.05.02.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 02:01:19 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for pull up/down
Date: Wed,  5 Feb 2025 12:01:16 +0200
Message-ID: <20250205100116.2032765-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S supports a power-saving mode where power to most of the
SoC components is lost, including the PIN controller. Save and restore the
pull-up/pull-down register contents to ensure the functionality is
preserved after a suspend/resume cycle.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 4fae24453c11..7eb91ac5ba42 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -318,6 +318,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @pmc: PMC registers cache
  * @pfc: PFC registers cache
  * @iolh: IOLH registers cache
+ * @pupd: PUPD registers cache
  * @ien: IEN registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
@@ -331,6 +332,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*pfc;
 	u32	*iolh[2];
 	u32	*ien[2];
+	u32	*pupd[2];
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	eth_mode;
@@ -2712,6 +2714,11 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 		if (!cache->ien[i])
 			return -ENOMEM;
 
+		cache->pupd[i] = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->pupd[i]),
+					      GFP_KERNEL);
+		if (!cache->pupd[i])
+			return -ENOMEM;
+
 		/* Allocate dedicated cache. */
 		dedicated_cache->iolh[i] = devm_kcalloc(pctrl->dev, n_dedicated_pins,
 							sizeof(*dedicated_cache->iolh[i]),
@@ -2953,7 +2960,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 
 	for (u32 port = 0; port < nports; port++) {
-		bool has_iolh, has_ien;
+		bool has_iolh, has_ien, has_pupd;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -2965,6 +2972,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		caps = FIELD_GET(PIN_CFG_MASK, cfg);
 		has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
 		has_ien = !!(caps & PIN_CFG_IEN);
+		has_pupd = !!(caps & PIN_CFG_PUPD);
 
 		if (suspend)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PFC(off), cache->pfc[port]);
@@ -2983,6 +2991,15 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 			}
 		}
 
+		if (has_pupd) {
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
+						 cache->pupd[0][port]);
+			if (pincnt >= 4) {
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
+							 cache->pupd[1][port]);
+			}
+		}
+
 		RZG2L_PCTRL_REG_ACCESS16(suspend, pctrl->base + PM(off), cache->pm[port]);
 		RZG2L_PCTRL_REG_ACCESS8(suspend, pctrl->base + P(off), cache->p[port]);
 
-- 
2.43.0

