Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9F1230BE5;
	Wed,  2 Apr 2025 06:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574365; cv=none; b=a4JaX070XMOtlimMBTBZ7UEdBfDNkfQs/2yI43+GMEZ29HI0+hKa2q/ByL/6hPu4fGK/n35d/ovNeL4QVu6sp3TKTMN5xmJ6wbtLkYR8uvc0nzC9EOPD2zMV8zzpbkLrbRAyDiqDRT2hpcVwMZjXA94Ps4m+wRlKqSet/aoIM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574365; c=relaxed/simple;
	bh=qYfHo2KQHvNKc0ra0XY4yHSyf5lMppizDiG5nIkJLrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrvfT5imK4NkdOMbdIP3/nm2e+qLKI5CDrMn3sAVu/vokIAhBAGbhWv717QA3aoVtz//6CWNmNcaXvZT5Fz+Z1/Lh6wvWNlbbXQzIGCg4iVi0RBVdNCw1Wv3qF7GHHHTxmhq/vv4lNnlA6BkN41VvDAhGtVUYwvkvuCsIM6+m98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcZ7hLP9; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcZ7hLP9"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db2c2c609so67832541fa.3;
        Tue, 01 Apr 2025 23:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743574361; x=1744179161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqLYe1FqZ+fWkZUMEsoaaGbBxE6T5DwROgxnXgSu3vs=;
        b=XcZ7hLP9GzaGuNnte3tsJ4aElqg6Rh8frt7qxSVclCx/zoDBBYGNK7jDnupt1IMmqN
         I9nFHBHnle/hng1258ngMu9grhdqL2jT0KcSxwDEVecnotojv7wo1qv4ym2EYnrnT5KV
         Q4Lev4sCyJccaKg3XxX658XuEaosZNu10fhO0FOK6SRyleeOzqA4bE3C/X1y7IL1+Vb3
         zLZmtqC4+jmUT8r5Wbhdva2oadQIDeubCK6Pf4Xx2Lp+pPEd3yinHhet+Mv3UowdLuTY
         bUNdI5cBYzeaHTplTV2o+qkrxFZGc/JLdQPtV0seCPMz2InW8iLHBBbyA1ZnjinvaCxY
         BHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743574361; x=1744179161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqLYe1FqZ+fWkZUMEsoaaGbBxE6T5DwROgxnXgSu3vs=;
        b=EfJdYc1MiZqRXYX/mpxWnMiUIUk0yEmtQBTUmhpWbNBSzPoQ8wru578uS9iDcd5MsK
         xSqG/IMZimIL5QZ/smP8YOZ/C+gaPr6RYk7M1ojtPLVEjK1V9XamPfDJrDMf1xfhyxGN
         /2tfe3CMUMGs5W5Or7deJAJn/iBQ7Gx6HcweNok1pJzz9fkmOL0NEY928FY0464JZBFn
         0uKvWnLj8hvnawTjHn2Q26ZHeL5pN+fQ5AKop+94vkgyGvejVfYGgZll/uU6xgvc7ste
         GxofyriKXdGFpPo64DrJaSK/VR4YAcSx8H9kYK9qijmMIE5C/bRHl04T5hL2MINCKXg3
         l5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUgHdycoOKVNAYJ3mOrSHLRBV9rrgNN8ZL4Y+OjEgr6ePgwT0IixaMn7dvkR3s9cmpG9dRizRMAtgdwBYZ@vger.kernel.org, AJvYcCUs32JkNmGBNcSFk+QswYZ4DyTALS7SsyK3A3f5W+1H1qUeLG6z0DkJWbIGTQx+PR6MLdVPps1XfY4a@vger.kernel.org
X-Gm-Message-State: AOJu0YwdVIfi8dtQEh5oK/gruCy8XK5cYmL8JQyfduw1RQRcqVHgx6bU
	fPr6o0Nl93lTv5AbRR9KL5+vgLlk17Nukz/EkL8jODSN37OQPRN7
X-Gm-Gg: ASbGncu7Slj7mNo++jVm5qWzq6tmErts9/tFvQ4JH+XCqaex28o8vcGj+sO055WVSA1
	s93+eP/QWf8UWyCk4sl2+3RT8L96xGWrPIxQwNyEe0ne7TDAY4qCRnNXAvrPdBlC1B/ZH8KuLE7
	XTpFwYsXtdzCAD1a3l4J9yO7YKkQwI8qg+rmF2u/p96n7CY1v7yJQTWf65NpPUp40ihM8JpH+iI
	SBvtMZbkevf6c5QfxoV/4+4irdn61tGZq6kii6PXlFgQFoqGh9z6/zyBdSi4yxKX55bGq5zKnSd
	jREK5qr09EpdXdChpzY5z1agVtlOO0Ns6bd2ZRyvGXBrEEJ7NTaf+cWHU96sZNLFBBt9/4IC8cG
	vKibXJCrWf4DD
X-Google-Smtp-Source: AGHT+IEOlVRNPfK6XvZfZI9GoCa8bFyIWYRL1kIm15RePsFCTW23VErkrA/u4u5KJPijLSBDY2ITUQ==
X-Received: by 2002:a05:651c:312c:b0:30c:50fd:9afe with SMTP id 38308e7fff4ca-30eecd2b14amr21036011fa.9.1743574361185;
        Tue, 01 Apr 2025 23:12:41 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa9118sm19336801fa.14.2025.04.01.23.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:12:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 02 Apr 2025 08:12:10 +0200
Subject: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
In-Reply-To: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=qYfHo2KQHvNKc0ra0XY4yHSyf5lMppizDiG5nIkJLrQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7NVH8bUZmUp+sDXnx+1m2Gbpsf0NJOj4/LoGp
 SQm5Bf40QiJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+zVRwAKCRCIgE5vWV1S
 MnfYD/9J49Orcaqbp7AXaRVq0lPTsokYkxYNLdJ/05TEhccGTRtZpDcgy3CtoMDFudImM9/+c6V
 8p7q5yQLaoq4WVfes6wtYlrfZ/13wdGlTkfh5zxuaAvdYdL5zs3MJ2ustdg0j+HF65lWmoPrgET
 VMBbhQEUOIwZ+5+h3tLZDgNbPs+lB2FbRnCDxHK0AtB3sg53EHQjMXBZgF2fn9Rggilcuno4WPW
 XvFrs51gq4gNMqkp3yn9txSMAuIlOjuev/fmFiQRNV514VRqz7VbT5ni3TLed3D+fw8npOYOLqj
 +vIXk1+a8ZuzS5LOzf20+Swrc2Kj9yrGVhW+7oyfCWBbdQ14QPIQrfrtHhmdMFPUvxQFmR87Eyl
 H/DXyvKKCSM3SlcWJBjzuYyOT+CdfALX64N0CdTnPKQBt8Yx9VNFyQ+y6UEEG6fODQqSaZXrSWx
 HlKVwEQFerc7JFyr4zA6N2PL0e87FrY4RW6pSzwTqIVaT5RqSmIX2qJaXShR8uaA5c0RDbhMsNI
 ncYga/CEXV9k3LJCxl/jMkE1Ga/SK7FsAd9YnkVLqe000He1Qa40E2qBhnvcvCmYAmyL+Mr7OwG
 zdKjqVZ1FzEux9Jlj+iXO8sPOeLc6NPu9SGdPpBnN2QO9SZcJEeFqno3nTin/N5JA9osXUjmXsw
 GeAf8A21a35u8mA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
The controller has a SPI, I2C and 8bit parallel interface, this is for
the I2C interface only.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571-i2c.yaml      | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6e5e0994a98db646a37bb17c4289332546c9266e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7571-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7571 Display Panels
+
+maintainers:
+  - Marcus Folkesson <marcus.folkesson@gmail.com>
+
+properties:
+  compatible:
+    const: sitronix,st7571-i2c
+
+  reg:
+    description: I2C address of the LCD controller
+    maxItems: 1
+
+  sitronix,panel-width-mm:
+    description: physical panel width [mm]
+
+  sitronix,panel-height-mm:
+    description: physical panel height [mm]
+
+  sitronix,panel-nlines:
+    description: Number of lines in the panel
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 128
+    default: 128
+
+  sitronix,panel-start-line:
+    description: Start line of the panel
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+    default: 0
+
+  reset-gpios:
+    description: GPIO connected to the RST_N signal.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - sitronix,panel-width-mm
+  - sitronix,panel-height-mm
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3f {
+          compatible = "sitronix,st7571-i2c";
+          reg = <0x3f>;
+
+          reset-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+          sitronix,panel-width-mm = <37>;
+          sitronix,panel-height-mm = <27>;
+          sitronix,panel-nlines = <96>;
+          sitronix,panel-start-line = <0>;
+        };
+    };

-- 
2.48.1

