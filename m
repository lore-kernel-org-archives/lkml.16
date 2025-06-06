Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2DC28980E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222200; cv=none; b=gGmgEq3yOpFy21irB+nWwrnyAyJHK/B9I6DHu1iL8b76H1q2ZgLpwA6oGMkHasc/xlKIpUnOHLtQHQ5D7zbCmeSpjoOUhIQdOX0xyWO6acty8ggEO/8bWlmaPgX+Ji4D2VuzSrPyYHbLoIAQpBBGU2aMvM0NULGlvT+BGeuwpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222200; c=relaxed/simple;
	bh=m6C+4e8MF9g9uyaiWWf0DHMTRnXGKt+eaez/jyh0Jb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzpUtT6K/Jp3BvE0O49+W8MJ40BcQQyPMRGMhAYw5zwlLWvjvFbyiI2dLCNUXPE9kI0wOyI9UiBmZLfkUAdDW8ndP23SKEOOVT9Y2xnapWqqrMUwB5b3HHTLGiYdhu6IkXlFUkY3O8L5cOJ5pX+u9BpmYyXLzB9N3NT3XNAxUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec1L5vsC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ec1L5vsC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so4353615a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222195; x=1749826995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcdkpDlPLd/iSFNV2Kj6M/PjoKJqD05ckr9tkCHHeGY=;
        b=ec1L5vsC4FwYLCU6CodPUPMVj9fbeo7x+WlOFJiS9TpWpW8isRG/iNqRobRNxLaWHu
         BcjW2WEAWxhzlKTLOjrx2BgsO2c2zXf4hW+iIt/es7ijylZSFKEzJlnuSPFVqYYt0EFX
         XP1JEPaRxp/J0Vx4BPyRl2JEbb+Ml5dr2aH1RclyW3/Zt6wRQcAfIgpsM0lABvyjHEps
         /RxDZeLhnJMCKbg38CSAfSEiMQRGqBSZK9elGB2Osd+VItvqLi8/SwK2CvwuePm7W5Ni
         K2BLMOXgtJgQHGd+nvkSlyEvsYcJ6HAN+N/rw6u5GktiWud69jKAgZpkhTf6e+jQQ7O4
         qiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222195; x=1749826995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcdkpDlPLd/iSFNV2Kj6M/PjoKJqD05ckr9tkCHHeGY=;
        b=PwzRpps7iAWix3YCbMS1/x35lgwc+fV8zPcNu6lpPW//X5VQHWV1cnrqIcO3ebIXhP
         e7hvbtzPuN5oJUhsv8QIQYDFbMrojT8zPhhYFhaULlDyKOY+opaG9IGHFkO09fphEQxI
         ZsN6klyG/C9rr8vUd+hB5tWxMWubrY5STuWhpNmshCFKjTHunMv6W4UC6A95TgHoCBax
         Rhd0iFhTo2Wroi/ZF6j4/VLRz8lLOQbGbOsssVTKLJS7ZpVl5mUwQUIGP/Cei1O7xUlE
         lRBqOc6hfcGISVuWsxyv/9jEoTlVlJTy2CXfoorUmL7vfUPGeVznE2CUIYk60lIZ/iXR
         aEfw==
X-Forwarded-Encrypted: i=1; AJvYcCWyoVVlylcJN2uv1KkmDzX3t3+L0tNPQWRCS86JMNlGLl1Qqm2sWwAOhJ9o5hcdFkHV94Ac74p68UpA3eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLOVPsBpgXnR/MuS72kyNoPtKLsH+3oqIhox81h8TZhfk+Axu
	kRyPJ7vH5nssGlwTsE06wouQ6ihCuIaYy6bJn2NB5m66L8pKOI0qa954o9IQV4VGc7U=
X-Gm-Gg: ASbGncvS7e9Lv1ibafXT3qgHhM2S/f0U+lpcXu76YD3H1Ge7vmhgshDUU7RuNJOgIC7
	9/ibfzIkQGMwh3ttcOLVR2A/U6MTQQn15+TgEGUcQvObMXhFHL6RLHbDTGbK62uicbwI+c7pqOw
	BFUooh/EI//9lEyefJtiRggPsLm2LOgKlBpyB2rg4W+kj0SaM4Im6YUgyN4BJEUaN1SgSh6VXDW
	ns9+Cjxs6EX3XJp1t9xSv7A/pihtYfxj/xk2nJATFBv02quh6S3FCgF0zAEvQ2sODo2TgBT7TCj
	S8uq41myN6/XtaHxkpq6OAN/b1kvlunJjjfHPXPw0sn66RijMLMjUD22gIxAN/xekIKH8tBB4fp
	kDFw9qim5JmZoKZ0Jo/qsKDFVhTsrAAPbruw=
X-Google-Smtp-Source: AGHT+IGi995dmBrb/2Bf+v4TOAYVLEzAcRx6/H11eC1SAEVv/9wy2tgK9WC20nkFydysTHvJuQz9Ug==
X-Received: by 2002:a17:907:7295:b0:ad2:2dc9:e3d3 with SMTP id a640c23a62f3a-ade1ab32464mr349066166b.57.1749222194843;
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:02 +0100
Subject: [PATCH v2 06/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-6-b03feffd2621@linaro.org>
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

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
example here to describe the connection for both.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 62a3a7dac5bd250a7f216c72f3315cd9632d93e1..408cf84e426b80b6c06e69fda87d0f8bfc61498d 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -36,6 +36,15 @@ properties:
       compatible:
         const: samsung,s2mpg10-pmic
 
+  pmic2:
+    description: Child node describing the sub PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg11-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -52,7 +61,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -63,12 +74,20 @@ examples:
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
+            vinl3m-supply = <&buck8m>;
+
             regulators {
                 ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
-                    regulator-always-on;
+                };
+
+                ldo20m {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    samsung,ext-control = <S2MPG10_PCTRLSEL_LDO20M_EN>;
                 };
 
                 // ...
@@ -77,8 +96,23 @@ examples:
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;
-                    regulator-always-on;
-                    regulator-boot-on;
+                    regulator-ramp-delay = <6250>;
+                };
+            };
+        };
+
+        pmic2 {
+            compatible = "samsung,s2mpg11-pmic";
+            interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+
+            vinl1s-supply = <&buck8m>;
+            vinl2s-supply = <&buck6s>;
+
+            regulators {
+                buckd {
+                    regulator-ramp-delay = <6250>;
+                    samsung,ext-control = <S2MPG11_PCTRLSEL_UFS_EN>;
+                    samsung,ext-control-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
                 };
             };
         };

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

