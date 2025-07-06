Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE01EF36B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795898; cv=none; b=BMhx3LUJ6fCWjFSL7Oq+L+lbkhkevGfnL4WGVUZaT06d6PcZSkICgf2AnYDBxnHKx1g5un8aglez0Gcd8QiTkbb1t8VB8/agRwmYuem+RUtoUn8vto6jxRLbHDiLgebvqwQcZ3xolq8b5EArrIKGiWH7acF6cF7bImkZtfD7Cbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795898; c=relaxed/simple;
	bh=xEkFef12nFlLIernh+CF1AUuIuQaso5KF89j0Sbippw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTBuHphdBeyCyAXYXSfguQ2RmQOdMD2QUSwU1G0c6BE94EG2vS9oF4xYnQBQPnzklZy9Eg5pXTRnQS61Qas/jH+HkW22JjsqFN4VdrefzylA2zPR0cH9lmPGnzTyi/ElL4s+J1grBwvaRSZh/HMb01tzMrfl6aG0tGws7Jn237g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCznP/p4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCznP/p4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so354231f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751795895; x=1752400695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLJzcUMiXBad4V8OJNPvhYHlVWs0EasjPm7tIFAml9w=;
        b=rCznP/p4jY1g41PPwRuiJbLPGIeopUVZsKzECqIA9yQa7IGnc+G40ZBZd/DYIojnjp
         kPZ/HUKIszrZZ+4nHAXA6oNJ+IcJEPNFZCBN5Xr08yUoqL+g1Z8K4HTL9UvEK3BpwWhw
         wRORSG4RH/oS0pLCbmw2qFRGiMu2v+A66pgCqcTc9a4k6stgQbwC4hz3Bpi7Y+Z8EbFi
         HOoOC+3CWbEymQVlLTwz/7k7/k6YcVKzp7CXBFWkJufn2URrBzFwOQR4F/sfFdJxgKhY
         UW+c/EzDO/bGyapMFP7rDHdy1dpgcPe9kW2pO8ZxmEO8aylgI5oQHznmKmiLRFHHPy8t
         fWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751795895; x=1752400695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLJzcUMiXBad4V8OJNPvhYHlVWs0EasjPm7tIFAml9w=;
        b=AhzMaQxCTBvy2HiUyHuS4W/h/Ffuf6RW+LsHA2lpNCtCuPJY/06lIdiWqHcHmlPKoG
         SFaxRWQdJC4nk76g0b4lmO8G2bkiWxp6XnKcjaV0DJyQnWi3wN6ra05vT0g2C6lIah1P
         Osl6VCSSoZ3TjHHl4Ogs51k6LiwVy3nuvx1PknMmwzH6heIiX0ha2WhEOJF2Jkw2gtFs
         jaxDcB70K1OG+6LpmM9aLCRuCduaWOEalh1tAJZdlhM3E/aMFsTEWkUAxkSQR+a2UG8y
         6fq+FHQMUdArO6+46EIBuJp56M+S0LirUkW3MVmBkMQPkxtrCIP61Y87BeemQfBMO8aK
         uJig==
X-Forwarded-Encrypted: i=1; AJvYcCVKzh0iTtwD2SH/t8hfo01fW5Cfc2V3T+gwj8VsVa/dPDNcFy2Sf4OkG7L9FrVe52ZF/47ORptulgaY7bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMf7F0HgyuwfNMszCHSNaw82/4tepkV8585AcrMcOwjIhuQebJ
	FOVAOkNa/MByElxcKMtFHUq0NNjOKLIWf9eQvk4nGnBz2FysUDIw5/qDLkrTdBVZGaI=
X-Gm-Gg: ASbGnctw3qNoV9sNEFGZhc3n0eDxqjmuUk2dj1PZU9lcbvwCrbRDAFID3Mave4/GWT5
	3NEvyEUPwcOqquxHzSC0hYIFOnJBo1ud9BXss4mtMtiWqrd8q2BXHPR8ER6Q5SgwV1VqLwoDnyM
	UZi2ESFZkwrurQIlYOUFCt7Eb1s+fGEcLiyGom4alw95GFobmmLO9Qtcr42LZZsxsM9hjSX5U2e
	BV9/M4JSJiqCWjRWT4QprZ2XfjVZJx7VpSMenqSGtj0kParcM9xggZ+YfuIt25FA6rJk9jzw4e6
	1A4DE1eZfVhkVxkwtXN6DcKuswAqeLZVV6czSdHmJlaLp3pfzUG3ljWTRROoLnyN4BbCg+Omc2w
	=
X-Google-Smtp-Source: AGHT+IF4Ul/n9fVhzwVBg+BkNmoc/enxNYd0kHRns4nCK3XCzT0Bu7DVEcYAKqiVo/IOvxaJHXGIXg==
X-Received: by 2002:a05:600c:1d1d:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-454b35ee163mr29792145e9.1.1751795894893;
        Sun, 06 Jul 2025 02:58:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a642sm6999179f8f.80.2025.07.06.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 02:58:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	lukas.schmid@netcube.li
Subject: [PATCH] dt-bindings: arm: sunxi: Combine board variants into enums
Date: Sun,  6 Jul 2025 11:58:05 +0200
Message-ID: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=xEkFef12nFlLIernh+CF1AUuIuQaso5KF89j0Sbippw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoakisY7M+9sD/W82rRJY9pnJ5W32Esc4uTl7gm
 diY585f+f+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGpIrAAKCRDBN2bmhouD
 13dcEACUhoM6D4bSGQjt2Ey7hYNh3NNu0aL3b1bop290qElz/yIWyx/Ed7e0ir4nWCGwfsSep/M
 q2UTunPLsBVwyCrIMDKY2gbsSwXz4i1KRfYeyRvBgMnsju7yaMGTJ2mjuNYexZ8XshvNg2DruMC
 ku1hpslsC3Sl1kfBnUWNWh6qyp0ujEltp7l0nV1usgwgDJU/FmgIgdQN586f7kQz07gc52epvKJ
 sOJqc7NYwntKKe2x9K18tPjcbX91tm4tpymuj756Fmw0waFuj5kfWxcvYUXTsOdXJHQ2Tgef+9u
 BqDLdnRYNnYXKjZ7RXernj+KGF3tWbDRk1+y+gTc0omR0gN6EFNL/9LzMn1imJj8umAs3ckxsMg
 nPFM+rHKIJ69dhINz47oVGYY3U7wG92WOVeNbDHHqDofmE2d0r4H6JhTpyL6xWuFyUX19Uk9YQa
 D/lhMQDim1MckV+sJ6durjiVvlKZAfqyanVh1mQJ6vK3j0NtqPaaEJTRRAgmVLin0Z0vrnVPVzb
 eyXdwKOEG7mv98I6Mt4t0g9ygbLmFUGb4bxjyfc9CVAyDIshCvT+JhEpL94RrP5HZ/3fwt6Riub
 pXjVbsVl+tGtDeeGemxDwWQ9y/QUwA1GqYpgnRo0QG5bgczyBU/3uy46LYEncGTnv1vjlxzuzKS 0O1UQ0NuNdsN6KQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The common style in all bindings for enumerating similar variants is to
use 'enum', not 'oneOf', so all boards of same variant or using same SoM
should be grouped under enum.  It is more readable, more compact and
makes easier to find actual devices from the same family/type.  Also
there is completely no point to repeat the compatible in the description
(incircuit,icnova-a20-adb4006 implies this is "ICnova A20 ADB4006" and
pine64,pinephone-1.2 implies "Pine64 PinePhone (1.2)").

Combine two easily visible cases: ICnova A20 and Pine64 PinePhone.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: lukas.schmid@netcube.li
---
 .../devicetree/bindings/arm/sunxi.yaml        | 31 ++++++-------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613258..f10c6ee6a0aa 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -341,15 +341,11 @@ properties:
           - const: allwinner,i12-tvbox
           - const: allwinner,sun7i-a20
 
-      - description: ICnova A20 ADB4006
+      - description: ICnova A20
         items:
-          - const: incircuit,icnova-a20-adb4006
-          - const: incircuit,icnova-a20
-          - const: allwinner,sun7i-a20
-
-      - description: ICNova A20 SWAC
-        items:
-          - const: incircuit,icnova-a20-swac
+          - enum:
+              - incircuit,icnova-a20-adb4006
+              - incircuit,icnova-a20-swac
           - const: incircuit,icnova-a20
           - const: allwinner,sun7i-a20
 
@@ -760,21 +756,12 @@ properties:
           - const: pine64,pinebook
           - const: allwinner,sun50i-a64
 
-      - description: Pine64 PinePhone Developer Batch (1.0)
+      - description: Pine64 PinePhone
         items:
-          - const: pine64,pinephone-1.0
-          - const: pine64,pinephone
-          - const: allwinner,sun50i-a64
-
-      - description: Pine64 PinePhone Braveheart (1.1)
-        items:
-          - const: pine64,pinephone-1.1
-          - const: pine64,pinephone
-          - const: allwinner,sun50i-a64
-
-      - description: Pine64 PinePhone (1.2)
-        items:
-          - const: pine64,pinephone-1.2
+          - enum:
+              - pine64,pinephone-1.0 # Developer Batch (1.0)
+              - pine64,pinephone-1.1 # Braveheart (1.1)
+              - pine64,pinephone-1.2
           - const: pine64,pinephone
           - const: allwinner,sun50i-a64
 
-- 
2.43.0

