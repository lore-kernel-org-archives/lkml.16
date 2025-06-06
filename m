Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3C289801
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222199; cv=none; b=q39WTtjczFVeJk6bX7x7DAqi06BivOTh6wKD9jLzCsINtVViOhzyyrdGqIZaC9303fg5L3cPY/iXOblHDH+xaDSc2fbzOEPlW1je/EZ/8XLzHkQuY5dfx3HQ10/SL5jEQs/K5C3t5A60wBAuIs/7zhMXQ3kDsjbD032+o3MX9v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222199; c=relaxed/simple;
	bh=s3mSTfiKouX/DXZqGMbD6vxo0PP5K4YwGopbgIII0PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmE7apSHx31x0rJ4eQ7aVh2yWf5HY0uIhexou9gvhQd9I8vs3jzb3kzqSS38RGzl6D2UnsNyDQW2U1jnkkaDJgsP0Fo3j4gSzn/RuG7oTjZTuBCZVteWJBflzpvR6mhTBkVcs9/D4ndk26tpl85c8lgrCeN+1VPjJMof03bk8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eM1g3U1O; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eM1g3U1O"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so1822380a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222195; x=1749826995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw33Rl+thTuvgJB34fURNPMx+D4YtoSUdiE6dWyoZ50=;
        b=eM1g3U1O2uzDpXS0/4K/PxaAesbUbaOYOCP2bw8bYazgOjdO3oSklAXWmk9eCgEr1W
         b5b9+gImP13hu7YPBbSDv3DhROwop/cV9fvw0puMyIfuhAUVUiYuupeEf/fKmCANLxfB
         eJ4c57MBOu9ALKTSOCg4ay9mkKE5w/RHsh03gBAUi1Q9SHhVXktLB7f0iI1auIJK+SfA
         K56hwa7gu1nyM6bxbEwNjNdXlrt8nUJt4yeNC5Rnt4v5oHyavUouMRZbaUxYbsHSFZgs
         0p8K0xPhubPD8D5CoILpexugJ5bwfZqbso26IWTxI2BtXAFtIlWEKZxGx0ClHIaTqrAw
         wthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222195; x=1749826995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw33Rl+thTuvgJB34fURNPMx+D4YtoSUdiE6dWyoZ50=;
        b=vQ4z5lYGqwnGBzcqyKujaXJB/jgKJV13us5gTjdlg16TuH4tTKSaGlMBIhId6tMF4K
         dvJBVz4VMy9TvIMTuLrNgQ8fOY2HOOya2KY/GDw1hXPtY97UF//TSmAxwBmsQXNAGKfD
         p7oa1XVnW1B8yeKQHjzBhulvY4KRvd4YvmyXYlcYxpwWJz+h4J0/ipuerWNaf/HJDfC8
         2AocPMeVZElFJEFQIUQnqXDy0fQxL6FLpuFP8YjZmTjwR6KYefyuPGcoeqde3V+BLmKB
         K44ISYmzCDZz3Yue+pjpGcSwN/DH9MQDc+NUz5zNGD9g+Xf83lsItKg8B7X2mcWnBPvD
         xiJw==
X-Forwarded-Encrypted: i=1; AJvYcCV8+Zr3LKhKi18RbeO3wxDaJRGEWVJrrwNdkyJPTUXnUcU9Cwb4Axlj2yilaqxb7xvLxvaO8nurWzSRbjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhd6/pdIPcOP5y+jzPD0dIK9DkT3+EgM28+dAg3USaEqaDbVNx
	6KHkTFEWuB5ADaUizQaO1sZ8AYe1ffN5UfKXEPNDOhJ0CyTO+0ebBZK/bwB7Dc6f648=
X-Gm-Gg: ASbGncs/P0vpokABn/MwYDdaAIUurJpD5D8iLFzuhXcUIyhueNpzKPXq6y7JTZSqoJp
	HbaxaC9unjwJhG0QTnRJYxvoP4/VpCmQJuxe7De1VJK1R2f1KU2DRrNh8TtshCIrkeya8zamHTh
	po8/9jeYGWXn1UUy2UCAjQKBBv7c2mBof55QsAGJ87+dHMVSmEA8KRMyE5E/CkMzcb0n3pFt6Yp
	0ycMnrv7YojPVfGdBVGfCPOB62tutv8jD9Un614fTlrmvYxkZ4H9NEVKS/AHgdON8r5ZhIYupCi
	HN9y+UHqdwcohgysq6nlzLnEo6mH22S1OyNOl8X//XjPZY4PVKQpTgZHyIpL3yRUHaThGzyLxe5
	0/rrGRbO84vN1d5BPUcOJnBj7xPzsg9hGwXOYJLTD2zikIw==
X-Google-Smtp-Source: AGHT+IHbWi8jsL6tIHBW7of/W9kUs+W2SnVGPOjs734Ix0yZ3GKT9YaBdqKy5cjONZI5b7CnH58irQ==
X-Received: by 2002:a17:907:5c1:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ade1abc5eb0mr323702866b.54.1749222194282;
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:01 +0100
Subject: [PATCH v2 05/17] dt-bindings: mfd: samsung,s2mps11: add
 s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-5-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
supported by this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, and additional GPIO interfaces
and typically complements an S2MPG10 PMIC in a main/sub configuration
as the sub-PMIC.

Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
firmware, it therefore doesn't need a 'reg' property but needs to be a
child of the ACPM firmware node instead.

Add the PMIC, the regulators node, and the supply inputs of the
regulator rails, with the supply names matching the datasheet.

Note: S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- add | to vinb*-supply description for better formatting to mark as
  literal style
- mention GPIOs in commit message
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 70 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 0b834a02368f7867a2d093cbb3a9f374bb2acf41..a6a10d23a480b460c66be2df5bfdef5ea3024ce1 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - samsung,s2mpg10-pmic
+      - samsung,s2mpg11-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -70,21 +71,46 @@ required:
 unevaluatedProperties: false
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        system-power-controller: false
+
   - if:
       properties:
         compatible:
           contains:
-            const: samsung,s2mpg10-pmic
+            enum:
+              - samsung,s2mpg10-pmic
+              - samsung,s2mpg11-pmic
     then:
       properties:
         reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      required:
+        - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
         regulators:
           $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
 
-        samsung,s2mps11-acokb-ground: false
-        samsung,s2mps11-wrstbi-ground: false
-
       patternProperties:
         "^vinb([1-9]|10)m-supply$":
           description:
@@ -112,16 +138,36 @@ allOf:
               vinl14m - ldo21m
               vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
 
-      oneOf:
-        - required: [interrupts]
-        - required: [interrupts-extended]
-
-    else:
+  - if:
       properties:
-        system-power-controller: false
+        compatible:
+          contains:
+            const: samsung,s2mpg11-pmic
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg11-regulator.yaml
 
-      required:
-        - reg
+      patternProperties:
+        "^vinb(([1-9]|10)s|[abd])-supply$":
+          description: |
+            Phandle to the power supply for each buck rail of this PMIC. There
+            is a 1:1 mapping of numbered supply to rail, e.g. vinb1s-supply
+            supplies buck1s. The remaining mapping is as follows
+              vinba - bucka
+              vinbb - buck boost
+              vinbd - buckd
+
+        "^vinl[1-6]s-supply$":
+          description: |
+            Phandle to the power supply for one or multiple LDO rails of this
+            PMIC. The mapping of supply to rail(s) is as follows
+              vinl1s - ldo1s, ldo2s
+              vinl2s - ldo8s, ldo9s
+              vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
+              vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
+              vinl5s - ldo4s, ldo6s
+              vinl6s - ldo13s
 
   - if:
       properties:

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

