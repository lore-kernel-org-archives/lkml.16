Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC904289351;
	Wed, 23 Apr 2025 19:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435029; cv=none; b=Lm3C9wWjATMnzjstIAO4nR+lQg8GY4mPZ5Q0kivY6vIi8CoVqGdcJzqwZgYQ/KGO5bkkJ5PUUefcLQVWmmocgK67+2RCesIQ33ahGgueTcfckDH28W581jksa83uZ7zaI+7W+SN+6wgL2x1Aby8NVM8KL5FP4EOPVXNxdg3cqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435029; c=relaxed/simple;
	bh=YB3U1vGWiGbGv/SZx3xK3oLfCX1vsYzknR/aXytg8xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfU3k94OIeWcT7eEWynVnxfH2wraP/twiSCbqmJPJ5kgOkNc3lJi0lvx17wLNAQT2myxdzmz2lEnbfaSmTzFOgPszWOXWKh1c47yxFjm5h333KH3agP/sMf49RUoXvee5WEkOtqb/e5nttOhBvU4Ltjy3QOMwrFvAbzL4kk3Tbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsHAM2pn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsHAM2pn"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso2917371fa.0;
        Wed, 23 Apr 2025 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435026; x=1746039826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
        b=HsHAM2pnl0nhAQifP9+3kH/9Kj9YNy1+ZqZ+ZeK3ROUEbrY/OKvM5vMKCwSwofy/+7
         pnUKkdaKEwEoThuRcB1KisMSaMP67VDH5m3bTrgU4+qoMG1XsMTU74sbu5ZfzQXXyqpV
         Ks+NpmqVZ1Df7yeDfF4Gu0wwDfxb6xT1RT7hPcFH80qWNqDJpxOcoSFsQeb3PfWvEfss
         OQjX0KH38dB/9VQSdR7sjX3AhzOROV191SPIouYp5C4Ce4V7V0f0AJmuHpcmyJCvtZ5s
         Ji38uPuYLW/oRJzBzG1HTQs2ec7wboc0fvieyVFln2DY0oERnQbF1uGY8sqeUsrOFICq
         3Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435026; x=1746039826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
        b=GOb9z2pcrba4fMVhqCfBfT8hCy+KRecEmQxKqTLahAe8ZiDl41XTSxf1X2Zq7Leuke
         vixU6hhzlhYZ3U0mLcTKUDPLrUV/Kh8yJ/uMdLBD6zZfJg/gbbQd8HQeXGiG7fqG0Fi3
         V/UgItrWIwHh7zFIhhq5TYghOnkTDrb3HuSHJQD6Y+JsxexlA06HVgaq5Ze/6azoZZ2E
         WqaEPJ8IlDn8hLA5a694wmgTZIOo/WcAUlSJu+w/gqvKzFNkrVuEqg6oG/oUNQnx9Lgo
         jiw5oc0ErpbChKSyQ2sI6tzNWG3nRp7Mx9UqDdnawD77mkPGd1E8uyJuPoHK1OrNnEcV
         K34g==
X-Forwarded-Encrypted: i=1; AJvYcCU6MTAQXe1C8v0YLFR9zc3C0LXMpOHQEKNhuh8qjqRXTdb7Rqu86Y2MraS5sOzNuQoLN7njVuoJ/gRnpCmV@vger.kernel.org, AJvYcCWooO8iueOOeOl6FtBa3UEV6usacKv0x26atM4c4MLCJPP9stcVppZOsywiXZvBm5zn4PrTdt2qO4E4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FbjD/x/onRf8I9h6vW49WRt7SIuJyE4d8YRCrX49pECx9a1e
	lzyYjqFpIKJ6kuKo4QmjkwT3qObQLw6K28bYX0SNwGUwg0ULZaBYxLEtu7uhJ34=
X-Gm-Gg: ASbGncv/4CENKC9eAtGbaxYZF7a5GP+DZoj170VwoqJ5OGL5HwATRyTFiISP5TpDevm
	d7Lq+ueTy74Nvbdfwb2cCU0Yz2NbnKMUIi2R6Y6wIQ6qPgK+dc9xqDCgNn/r8z9VwMhv7rHuyIz
	CuxjHHJe4ZalZz23r8+b+88c1LU3C5+/L3d4iVd76IFa4itCVkbf0qcDCd3C9KiPw42/NNjjpi+
	VwkOtL9uTGw74P/9djFQm55HeAZV15JOuNiOkTKz1pa/dggxS6vHj5jP60Eb+4vAZpTdBqm42wt
	USHtbx+dmmwa60tM67KpS1LqUBtQxbmEQ8I1CQCHUHnkYfq0PAUmJGVsw3ZUvGALFSLnM7J53BF
	Ik0zAeiNM
X-Google-Smtp-Source: AGHT+IFVUqnkPxzVU0dxRxKgF4bR1zHN4w3Z5gy5sPUltUjF68ONNzb05hHfxxkeTf8Ty235gE5MgA==
X-Received: by 2002:a2e:bc18:0:b0:30b:be23:3ad with SMTP id 38308e7fff4ca-3179e5ea616mr387011fa.10.1745435025414;
        Wed, 23 Apr 2025 12:03:45 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d9d0sm19475141fa.97.2025.04.23.12.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:03:44 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 21:03:20 +0200
Subject: [PATCH v6 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v6-1-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
In-Reply-To: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YB3U1vGWiGbGv/SZx3xK3oLfCX1vsYzknR/aXytg8xc=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCTl/qZH/tsu2jjI4XQEggmBnixfzIpp8xX6gc
 2vkbdn4cWOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAk5fwAKCRCIgE5vWV1S
 MmpFD/4uqUYIyR02el2J/y9lrf96YQJlG22nGZUYBU+0dzQExzz+s2HD97/k1jxnlLA5jYHq3VX
 1NGEWQSIfx9iFNlcApMkYpQd20qorhWdK/lYHJbyJ7mRO/4lnlthVaDYHdFKuxSMwl6hstl3MjF
 jmU/rr1WYwIqLf77SjOkTQlMp59LeXgR35JW1buHGCMzObgcZfV6JzQ3IhJidy3e2ZXHoM+hhlA
 GX7G8dgRSBDkslab61I1mx5Wp6yeVmGcqBTT8Vg+dyrXlOpyVzrF3wJPMGg9g8g0M+Ma3C7P+cP
 3UTs7iHUzbxcYL4twXz3ag0L5q0z2C67wK48oL5fZPFMG/qZtGroAbGCZ7xLE8FMEvf34a6oeSr
 Umvr2pRQhwK3u0A2Sf/F6M49zM3XGatAPItW2CDRY0CwjzQGwvPjrRqukkkc+amKo2CvDxK0hy1
 D+jd2cnKUIWfYJxqCrkSoS5O7XgUki4yYzD2rNN07R9cvT4ntWI0CDd93PI9yawOizKI9ebmJCa
 JqbFtBYLqvvKc0KH/CGNGH0utqHl62pPtayw47WoRcnqOdxhZD9dt+ghE81GRI14xi7Aw98NR1b
 coqbu+tTfRy/1p890wanPI9toDUffw0taFi3iavhvX6Zrtzn6EFaW+jrkbz04xKvWmpXgAebRit
 gIAz+eydJtAZxhw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Sitronix ST7571 is a dot matrix LCD controller supporting
both 4bit grayscale and monochrome LCDs.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4fea782fccd701f5095a08290c13722a12a58b52
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7571.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7571 Display Controller
+
+maintainers:
+  - Marcus Folkesson <marcus.folkesson@gmail.com>
+
+description:
+  Sitronix ST7571 is a driver and controller for 4-level gray
+  scale and monochrome dot matrix LCD panels.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7571
+
+  reg:
+    maxItems: 1
+
+  sitronix,grayscale:
+    type: boolean
+    description:
+      Display supports 4-level grayscale.
+
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@3f {
+        compatible = "sitronix,st7571";
+        reg = <0x3f>;
+        reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+        width-mm = <37>;
+        height-mm = <27>;
+
+        panel-timing {
+          hactive = <128>;
+          vactive = <96>;
+          hback-porch = <0>;
+          vback-porch = <0>;
+          clock-frequency = <0>;
+          hfront-porch = <0>;
+          hsync-len = <0>;
+          vfront-porch = <0>;
+          vsync-len = <0>;
+        };
+      };
+    };

-- 
2.49.0

