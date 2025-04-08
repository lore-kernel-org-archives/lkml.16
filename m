Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F2217F5D;
	Tue,  8 Apr 2025 07:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095902; cv=none; b=hKq4bIwM9Q4L+rZ00lDGyo5P6yqRepWJR6Eq9Yb1k9iGTXvjTQ0Gpg13MoKtpOhR3/46+UXkR2O1K5zbV7+6EAymfTyk7+5v6q6HtbcMrzPDlqi+V03Sgylg672oPGPowppRrLIeFG6Rj9/aLeQzxBCIe0Y9rCbvyNt/p80uj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095902; c=relaxed/simple;
	bh=8jsXPoD8/rVl7BQngK3NPkNA5m5l8CicRc1UHvgLl8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFL19X63qpCu1pEYnNy1QvhYrJQGuTVXfhwhFyivLUF8bQoD1Mnornh/0VAamYkJJ56+5bWLR2wFGYGDTPtelqgTHVcwFt6GtLYo7pRVo0AlzbW19oCPFqkBDpk27U6g8yPvIWfrzBUFRFSjLWnBYCmL258pXLFWwQ+c0u3jWeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPSM2pbF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPSM2pbF"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54addb5a139so5830483e87.0;
        Tue, 08 Apr 2025 00:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744095899; x=1744700699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q29XRV8jow8lez0T1Keu8H56xuoR4eRfKdNnJPNuVxs=;
        b=DPSM2pbF79T/QVOxCm7PBZpJQGmBji5SmQSVImHMt+VikZwefNvAN/Rih0XrGD26ad
         Ln9Qap3lKNIVjg3mLOuVO5lLnW4tWk0fCa0/HV9qh1zicYht7KxtuaUVPLy1qGG1oO5G
         LstIHuWbhG3eMI5O2fX2HLYt4z7MtNAaW+4CDBixSF6BcnzWfv6FfeBSOx8CRnmKgWdi
         az+Pgroy7nObZMD1lUWahNAwEmEKm+s3yFMSS3EleSTxN2j/iOBQwWRe24BLsDrTmmKC
         HhAUu4ESGGcLlBmZqnwke0cswMME365viopattdF6pyibfpA+BpvPttwqrBw8Bc8JG05
         DUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095899; x=1744700699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q29XRV8jow8lez0T1Keu8H56xuoR4eRfKdNnJPNuVxs=;
        b=o0rNP+I8SMWNL6RkRhd71MZx578aLctrN4cB9DvLpZZPCX2ZJUWCPA0M/fWieyUOTq
         c6wv6GJOR4v7h0WDeGdBkCMm2kgiD4pCMtScyv7dRzceeJ9hycZZ3NEoDff8ZTopHNL7
         GYFhukHQEyPdBwzSGdOi0ewwnGXSukBEmxWqLy4uqJY+SD+Z56TYmw4hDFepHGWoIngK
         MTYu3heMygRJ4pIQCIqsjajceRrT5/xEVI1by3SO10XivbS8ivGls/eGGcDuHAXXFfQN
         GpFAP5TddDvB4OqoEOrHsDjG0N3BG1SBjru3WyCbNhRNg62Qg36wesi/88fvSL8iwfM9
         E9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuxzNU92vPSzUwaEndv0dUMq1E+yyPyfwrPegUdui1Uwk9HP7jpjhgLWPs/gEPwV8eMkzfTWWW6uScsD/l@vger.kernel.org, AJvYcCWfHMnWbSIG3m1pQijTUYTAh01bGVNwNxICEEm6iWLrwvhK0uP+XXPy27rP2ICXsQFYT9GomOnztYB4@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQ9tGJyAVf0QkwNoWCtcK9GLyZEwPI9Ei3B2do3tlOP8Tqyrh
	dxC1F7d55J5Ic4RW5F+5f7iz5y0d6dqcBYFLZJIV/5bd6g+Mw+E8
X-Gm-Gg: ASbGnctWdbMV+xAiwwBrwG7ORVWHOkQ3KT8O4yvsYQhnDjBJOgcQ/T6VCWgvK08z4vj
	GYX1LVZNXeHLrGrTCb+aSlS2SIY8WKjRlB7NhmYd1uH6oYqR5Ac+uiZkFiMrOwc0EXBHOoGt86p
	FdTwCwmtKLa8d25FXSjNsp6l2Oy+1MK7GQDc8jgLH6px92BDZluc7oy5YLcQw5MRhnjuI0VU35Y
	vUcqvgsSTxU37Bve3gJkIgHt3SyPWfrQl1rgLq3l4DWVlFQBEveGGdiKSOwhFxzxb/ADKjMeGD0
	B0aYkMVhfZhCpM7x2pSaEPQfbg9QK6kkEDIf0Pn0ZrhowKI6zRca0QVrkBgZDu08ERs6Ix714yy
	6IAn6ZVzUpIChISuqq8nhUSE=
X-Google-Smtp-Source: AGHT+IEXZr3tAghBsf0ciq11I50CFCGHpuS2+SMnSBhb393VI13306cCOCwdFiGQXaSZdEP8pRZ0Ow==
X-Received: by 2002:a2e:ad90:0:b0:307:dc1f:e465 with SMTP id 38308e7fff4ca-30f0a133afamr53460981fa.22.1744095898940;
        Tue, 08 Apr 2025 00:04:58 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcd37sm19252841fa.76.2025.04.08.00.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:04:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 08 Apr 2025 09:04:28 +0200
Subject: [PATCH v3 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-st7571-v3-1-200693efec57@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
In-Reply-To: <20250408-st7571-v3-0-200693efec57@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=8jsXPoD8/rVl7BQngK3NPkNA5m5l8CicRc1UHvgLl8Q=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn9MqI/6MAlJHkJFAGEAFtgGr3nulYXwgfcprBv
 UZsVFY9NFaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/TKiAAKCRCIgE5vWV1S
 MuTCEADWG6b4liMCpVeV5PsvAuNakNCEUFL7uQEazaVoNugFyqXWyvXpsEaWhruzGt7WV0ik7EH
 RcrJiptSDU/0QE7mLKYw7lMdPHGOQBE0P4ARo6gEY1CUPMnTE0RUENvzoA0JQkWbtjPyXiPRHt3
 X40P2JJoe7Yqvom4D6S5PFv2Q+BlR5fna45TO/cP4xy/d0PiKsqJLR4/3GZrDwBW0Z6SRXxac5T
 zdv4f2uc3owp2vIR0tQp2RnpihkmimfOttg4cC4BrTF9tCJirmTLZQt/Whi6yFgu5aONwC5wYMh
 KMRx0NehGGZusaalAwHkWbRkyhAVG3zioY7Pt35q3h3x3M4FmvPKujMAK4jueJRMZRLu2LK4FSU
 FfqzraJSyzchYX4Kh/kNFJDLTOlzPXYdU7lQDfTbqKzrqwOeYpNPOHPrjY6FrwGSmdd5iHi5bSX
 NHuSgrXNLTV+nFyJ8e49V53t7rYtSc8E5l0sG3ViKDulywob/jMfLuCcVdS6Vos+Oc44rXSoFox
 tom9zRA5iinjgmOXzRuaioYKjvsFykGc+L+JX7Y/rvqHMH3ocQg1WsU1oMfMf5eacGP/9w6AdXS
 KJXW/KCEaAmIXYKWSACTNvraVPZiehCXs7/USjKmGRPmrOLU2FIwHZpFpV1R1bJPzj5xI2pPDbg
 WfXOjyIQdnlXLew==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a25d2820be27fe580b6d1aaddd9c610383b73b3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -0,0 +1,70 @@
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
+  Sitronix ST7571 is a driver and controller for up to 4-level gray
+  scale dot matrix LCD panels.
+  The controller is designed for use with LCD panels that have
+  a resolution of up to 128x128 pixels.
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

