Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE302580D0;
	Wed, 23 Apr 2025 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392445; cv=none; b=sI4r6azxftnP2yKbcTIw4VU8Z/fu2q4vdkxeXhhR8MrgKLxFdQ14m8fQDHTfXsvJ2kpwIL1woEgCAkKv5IvISX7LMXOArWDsItdADaMGtech7fsX/LycIflDMnRZNDxh9fi1d76BAyN9qPgp98trFhm841FSvDZ4Uff8ZV1d0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392445; c=relaxed/simple;
	bh=YB3U1vGWiGbGv/SZx3xK3oLfCX1vsYzknR/aXytg8xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuluvW/OffDytkLevlcLkm2MvPnWB+nEs1wa5FGPbiB/2mc9Izi/t5Eh9GY5c5ZaWElFq3Bn+sZKKnJyqmv0aebYUM/dVcVnP51Mw3HJNx1ft+1myKcC6zA9i/hpI91Rx9zs/koC/dGaMdOSwQd629pjB2ifPnhDl+6QpYqFb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hN0KSyrw; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hN0KSyrw"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-548409cd2a8so7870625e87.3;
        Wed, 23 Apr 2025 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745392441; x=1745997241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
        b=hN0KSyrwjHZDhGbQ4GCrxW8Z9rSgc3BbuIVDZL/DO9pvcrwyXGRIM6Likfdx7guR2u
         zC5AYiFWROe6Si7idLsrADGErPrYC4MfpWozDVSURWzZbptuApAJht7bRl2AYeeuWroF
         rKFBdK6bpMmvStDMv4nkk5YeYkDrXBLCnNufpYlr9JQCGJo46jx1AFmd+Lj6XhyG4uix
         hu95WUwCSX7MklG648rYnIIM+11Rjt71ZKeIjXI3k1kfmFgrs3KYB9ijyUCzJjfEcMxJ
         8biPRRM1duGJxcZMHkM/DDpcZmY7YzhIBt90WRqKgIJNdk4mSY/0du98DQvEci3aWdLY
         84eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392441; x=1745997241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
        b=BU9/SIF3amDKEnkIc6RgTutv5QiCm0RF4MbowKT7lKT1qvC2+Cwf21gxiSJNo6X8hW
         6tKGU3/kS2rgI04fpSQJbv2jVzl3tfSPnQPXqTgvZv1ThM2Mbpx8jm5GnGx/YNq+0E9Q
         bpBxVRMuRjK/cOTW3/NryYxlOhWK4R0ErvNIk0VRpGvB93jFpW/w8kYYRw1SKA6OXcbt
         0WSTFAlMDYVzmSI3KaqqiWFElOVPhRX9yU59vfavfbnl2LnQofHgYsT8cPCPbB5PtgSw
         GGiTDJGbuOO8X1Y8ZCZWmd57YyWIVGWMlrklAiB0NPRF3Y0qLRZlolybP0XpjGnuZI5f
         reMA==
X-Forwarded-Encrypted: i=1; AJvYcCUxvNu/fmx44c3Gz8XTkjtWwgyQsbMyJN6pn8wKaqt/DMI6glYU3JZtNvBIvUYVWKL2eHf4ed2sT8qV@vger.kernel.org, AJvYcCXjv+QJ5kweVyVZaQkLvpR0LjJtqWCAjCVSI5tWJ8F+9LgjN8+y7X+NwfSxo9GDJXAQLZxNKlMT33MxV8FX@vger.kernel.org
X-Gm-Message-State: AOJu0YzwNjN6FzIgZEBjUj3ygKryQsKNSXYy9erQG1D2sWaZnoGo0QQ6
	7yjf4IgPcIZKPfnAzcMP674pzVl8uCQSvdrtqNIkU3+8ZLQt54ZH
X-Gm-Gg: ASbGncuGUTkR3gmYL8lOrI/Mep8cSK3UTRYTSXpECze5uMLfHsoapcXkRCzOMRcqpIy
	c5Kj4/+2w1tbmsX/mX4F/x4ec/hSGZFFpzt0lfSVQywU34fogP4CQM9zi5nCwHdsXciyUrdbDcQ
	wbHq+W4KFEwaBGpSAUhEcGMUDtbvXfrdh4t29vYp48639/f4T0I3XFmGM0j27CVfz4EqbP+Wnln
	SwTsmBXF4SNtpyuqtlqih7hNERBzHJrITQMOozgiJCexttfxXw8kOiixV+KLMgT0x+B7O1lYIXK
	Y4TYYznRkEX6oKNF27Ssbt4cgbEDhtx9Ne72o5EXMGK002uc7AEtmMea6lZU54lQLz9yVlB+9Rr
	UcpBQfCPj
X-Google-Smtp-Source: AGHT+IGvowmu55PG6LtPWhPWoZ5Kg5bAoX9r8U7PcI5/15ZB2sjHiJaCS9lWdbPisTPDmn+Kuh46aQ==
X-Received: by 2002:a05:6512:3b29:b0:54d:676c:ddfa with SMTP id 2adb3069b0e04-54d6e61609bmr5153223e87.4.1745392440901;
        Wed, 23 Apr 2025 00:14:00 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e524645sm1428793e87.41.2025.04.23.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:14:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 09:13:33 +0200
Subject: [PATCH v5 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v5-1-a283b752ad39@gmail.com>
References: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
In-Reply-To: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
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
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCJMnpPP5Uv6KlMXzj7js3h5xWuDgruYzpR5Sd
 WzqEPK5ggKJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAiTJwAKCRCIgE5vWV1S
 MpSwD/4j7O0k2Ad7fUd2A/3jFfXd8tieImPyatFp/ocYrhFuwHgCNlFMNNBSdvXohr0zsC3nPYL
 7z/Uk+rymGBQSd1HEnR+7rvK5A5mWEw428SZa8BHkVPW8HKL+N3pSjcsOdA/l/+Uug8FuMKi1iK
 puCQ5veEdSvMaC6DAEf+jy0M4OVdsnxq6HezsvCoW8gxR3Bulw6+6NDykonYt9FPU4NlRBxYYGC
 iN47n5dG0VoDyJ0B8+31vg0ffnyRmVRYt/FbEWOqAQiSPCvxKsonsNYbUmjVBKlR0Nj+86EQ3K+
 aoTQAwBIEaDTitJAYHsn+7KgWoAWhl0MVgT0N41pUaf+CReNuR3hbtzd0xSrECdbjroQQ0Iq61T
 hGTbQhwaHqeuo8x6cURqFPqmqS9mUOA1RAVihCALkUoW2kBG7tsfKDrWTV4zFhL9soCYgE8cAGP
 JWJ5wA4+ancz+jU+DrviMEJaSEbVSmgjESQ96YEJpP6Vn4qRsrFiXuw1h2EWs8n2ZHI1QWBKPGo
 q7mSH7NDV9/wtlAC7VEBdUgx3kUquZcT0jxXenZMuJc9rJdWNukKhZCllPiMaaTJBj+Ty7fgUIa
 Mqp4BSkGWi78eqU67xsfuokWdnA4AZb8VFFgimDCOjt+zJpoo04heFW2Sswmofaf/ajNEy5vZA0
 YyHHDD3DeckjZug==
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

