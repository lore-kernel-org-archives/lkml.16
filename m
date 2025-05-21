Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732827FB18
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836626; cv=none; b=D2js3ilJdp15GLmhKf9fjq9PTVlXmRS9c40LQEXQhBOZgzQPf/2bvYSr1H8jB7eXLi8jJwtF85WMsobD+kVNhMj7Uo0SvPAe2t75XeRvkUkihPI50xkiBNF7Jiz13Eq6YPpfRZhWjWRvD1Ou+zioA+3L3rBFJjYAXEYFbbaR8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836626; c=relaxed/simple;
	bh=JJa/9IwPJecX/xNlhRP+TBQ06Cx+ZcSiINzaYtzoSNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7Ep3O22ffLtKQNe34U9mrQgSoSYfMiuH2E/CSC3WPugR7FGehPU1fQdDbgtTvs6l1SDR6SCJN8XCp+AwZD3uxRS9si1GoadmUX0tInXVYGRc/27aazsAOvZbeeeCOPpaScO2FZYge4e8k5PHn9uJZQW+GYU3/IK1KX1yY0LNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GT/SAugZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GT/SAugZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad5740dd20eso552462566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836623; x=1748441423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axrizH4VwOODtm6rlbHWFXbGvGcBXbHyDloVMVUxuZA=;
        b=GT/SAugZYTXikLWi4SsHKHZ395rKLtQsh7bHhZOX+4tpzv2DwfQW7s9x+8aQCIDoaG
         gxwIqXRuOmc242Ck1mrL9lLbgeuyzwSfJj224odW/72NwhXOtRFyIT2QdQ2ya0xsdMAU
         Mp7YCsLofyAmZG2GgExx6wqJBMdfR49LXkBkS6c2CENWKOBm3WWwHloMSymKp/BOlazF
         1zN20zy5pLw7f33TyI84V7atwZ9Hnp9Mwy8AB1lclOaoKD08f9NnkiTu6MvrOsfJkd5n
         z67TtMNsvAt3x8F0rnEGZV5CCuUNc9X6RAZ0o8gHRnUq8pmVqRq7EgiAibXLrRXsV9hm
         wamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836623; x=1748441423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axrizH4VwOODtm6rlbHWFXbGvGcBXbHyDloVMVUxuZA=;
        b=ReotPa3mubRku9NJgLpjhH9LQ/cy0ewkL1gYqz8FtuFboEXmWqgBpyi2kQ5ULIyekK
         +QlmBvjEuFxVlpiifPs0dUzPa2DpK0Ue6Lnieq5nf7WwuOwn2gn6KkLn7FpDxy148f05
         aU1/JXlEDYWZowuqVwxemok1hbkHqWqz9JaRPs/DlviqQZyDUvfa/CKzLD4hKMz+TxgJ
         xlDUm1vwVuPbKLHJp2E+5i/zcHFmWttCoGnfJNzFw8zKbU9gC4zsDXTYqTO4/PI7ry3A
         kq8Vl2F0kdUlpBy+V1n7bVqyX/HYo1wxqFnHWwD+Pod+s6yPPycWcKRPzx0phYhzdEOw
         260g==
X-Forwarded-Encrypted: i=1; AJvYcCUWYtj09XjIlnBWGz4DTjzNRyqo3qrFQ35Q2FLdtcXw9MC/W/V3hLP7ogVx8WA4im80ujdQY5g77RTjkfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgdQJFAVi0bPUrcrrGyIbnXgmKSIqvNNanwm+/rR5hgolqo3by
	fBSY0klpjJE4DgPwn/D+G7Fdv0gYBZBtEPZ7b3vIKtjzhcAV5/vRJDn56DzwhSFaMv4=
X-Gm-Gg: ASbGncuiAY1TvpD2VkMk3p0AB2AFCka1pqLbQ+eeM+bu+P7cD85xOsMgyeWxmIwD6dt
	tebPqwZcBG6+Q8Vi9FSRhEil6VyVWBbfFzXGs+O6CKTkn4qfYRqUshAfxhpFEav2rg6dnG5XU67
	pNMblKv4USGnjqWppbmOiMsMFfWl7Wqh2ZDxdXhSDP5gj32z7evPHK4oOzAHteH6Ov4XpcdMTGh
	OLSDLEojBvI74lTLYLSZsp22t+qMXTtPEl6SlU5F7XEs6xMaflzsh0oFyI/UnjBuaJnQmaWCxhb
	bvaj9qDEYytmG/pLaYyFQ4lqcRONeTxLKpTRkgX0D6phvqjEFAb/fG4rZZ6eNoWJzUv+HFIlQJg
	bvIo2
X-Google-Smtp-Source: AGHT+IH3mjW85lP5lOF5G/GhwZ6sMJSToBEkgbvpm+r4oUg10WnOp4gbvX5AAF37R+msjZhvebr+eQ==
X-Received: by 2002:a17:907:3fa8:b0:ad5:60f7:b2ab with SMTP id a640c23a62f3a-ad560f7b749mr1377568066b.36.1747836622552;
        Wed, 21 May 2025 07:10:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 09/12] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
Date: Wed, 21 May 2025 17:09:40 +0300
Message-ID: <20250521140943.3830195-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas USB PHY hardware block receives an input signal from the system
controller. This signal must be controlled during power-on, power-off, and
system suspend/resume sequences as follows:
- during power-on/resume, it must be de-asserted before enabling clocks and
  modules
- during power-off/suspend, it must be asserted after disabling clocks and
  modules

Add the renesas,sysc-signals device tree property, which allows the
reset-rzg2l-usbphy-ctrl driver to parse, map, and control the system
controller signal at the appropriate time. Along with it add a new
compatible for the RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 38 ++++++++++++++++---
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index b0b20af15313..75134330f797 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -15,12 +15,15 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
-          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
-          - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
-      - const: renesas,rzg2l-usbphy-ctrl
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
+              - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
+              - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
+          - const: renesas,rzg2l-usbphy-ctrl
+
+      - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
 
   reg:
     maxItems: 1
@@ -48,6 +51,16 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  renesas,sysc-signals:
+    description: System controller phandle, specifying the register
+      offset and bitmask associated with a specific system controller signal
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: system controller phandle
+          - description: register offset associated with a signal
+          - description: register bitmask associated with a signal
+
 required:
   - compatible
   - reg
@@ -57,6 +70,19 @@ required:
   - '#reset-cells'
   - regulator-vbus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-usbphy-ctrl
+    then:
+      required:
+        - renesas,sysc-signals
+    else:
+      properties:
+        renesas,sysc-signals: false
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

