Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D831F180F;
	Fri,  4 Apr 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774663; cv=none; b=krI699nV4Mwnba0rbfPQXoUMBnXABC5L9R0+Ot8EjygZjCQoiKRR+JRIIuS4vdaG0lhgPMvS7KMQNbslyhsGlzLEK/6Bf0/y9dYRwmoMpuiLdiNNf4V+hEf7uyEOS+7RK9fFe506XG5cSHew7XWie0GBnldRy9I4gx0iRL62PTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774663; c=relaxed/simple;
	bh=dTeNBuF92gWicEQve9HvfkFWbBeFaR0CZPu1dkMadRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IH8U9oaaGg1NR1IsxNPKNJX7kTAzxSc//cJrVwlHcb8HR1T8qpf1mI7wjAHwYSVRuBjMITxenZEFm84dg6t/qT3DLxKuA3zN69eMhrS7H8en0JYr87HhAtpNHikYrQG0cB7+cpyXxQFyMXR1H0le0a25cnMAx9LlcaMcqTzSFpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4oUgEF+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4oUgEF+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso2359642e87.3;
        Fri, 04 Apr 2025 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743774659; x=1744379459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BB9DHwK4cROLaWjJuAZunby5TnPgVp+XcunP2n/MOHs=;
        b=C4oUgEF+ZC9ap7fnNxU4YblqU5Hxco8DZ9vLMvP4dUn+nMOaUOR3lKPRFPnI11iM4o
         3lX1NDGNd9ls20K7w9oOA7lZRspXNL+ScNtpOSfCp38GyG3vvRm675VCZODnQcWzW4Nd
         xFOugDtB4L+HeviZ8IO8tGRLYjQ/2WHgcK9RuJgzNnMb/ICFSrlX1DF4f2N8M1OXIlz0
         P/Q2DxQvvBMF2NDpwJIdHNVjq/oC4MSDXbmD4DqLFPITlgIagkuzE8S9gA1Uyl+zpjgl
         XYwJEbLl6cDolW64kwtj+C0vac9UkjcNm2Ti70zKPDU/g9QMSuAMKrknCkYnz+XyjD74
         ik5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774659; x=1744379459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BB9DHwK4cROLaWjJuAZunby5TnPgVp+XcunP2n/MOHs=;
        b=tHvWZHKc48CzZYygQ9E0uSnc/5xr/QRrJz/erSY+jp/wxd49Y7DFDQiNnHQqt4BHN/
         iS1W5/y3fIEjNB6CKOPNdhYoZalodMZNl2bApSj0GcsTOP04nWuZEAxtqDkYhjmKOKgX
         mUsrZ3G1i4VdTPWBGcSHyRwuiY24087anJRF5587+ZQhIVk4Z8lv10qxtZAkNPJt7sAr
         tc4kdW3M33ZqtOPI98ZqH2dkXXK4VYW7P7BTaAjHc4io3/aRFBekVZlAcvAQVG+/wJhs
         C/+LPboasD0kDrYpXpiCTqlXaJNhNNOl+N1fQbducOCPTfN7jw8oKav+9e1BjTV6B1hv
         hP8A==
X-Forwarded-Encrypted: i=1; AJvYcCVFCQTjiFCpDKqM1zt7Z8rJwJE+oXEpQMCOv3FD8yalBctQxW0LRIJgUIWq5eiLix7QAcYBtwlV9kqr4Lyw@vger.kernel.org, AJvYcCWbMDhElDUMHaHxkzYcUSJSXC7XsTQChVr5tHPlLiVLDaAlLrnLnU36EMPyafhkj0gI+uEULNw+aFw7@vger.kernel.org
X-Gm-Message-State: AOJu0YzC9LBxsA4eukmUppaTlkXxCF2gP5foZyWh2ac/Y5POk9D6xWyc
	LiYIgccuiFbfTYTqLSIUuIce0Io8nTTH7Ov0Qucqfwhw4XoD8IUv
X-Gm-Gg: ASbGncvQ0YEl7UAzHKvHFeabuslCOaJ8Nc8dbOLxhvG/E0knb9baKEEje8BzUK35m7Z
	3qcW4kuuYRbCoV9GEkGyMct4gng6RUoYtrMnJk8psMWghPrJX8qWabhLEzLy7H0lns+ioQEBNVn
	XxXfPySP0228cJi2L/MA2c/2kDLZKhocDaIKS4ziVWUHj+PpMp1vRMC8BUq16oZ0Nbo8Qj33r6F
	CI0CmyJyGg9GMwXc5uEfex7eS96plrubXqzcujNikFSRxMnzy/rEHI5RPJOW8lrF1qimshntZ/C
	VSYe3X0wkYURGnLU4yTRA9S3T4dl3wOJK4oPjOVd6KuYz4HtF863tmxpCbYt8x0T30Xj24Yg7Un
	UtcmeFi+NhIzWVA==
X-Google-Smtp-Source: AGHT+IGbNtBbpMpDg38XhE3xwVLelARt4F88vPDrkPUzpcNsJoq1Qb4B6PhcguN01yM4+cCMTfP8Yg==
X-Received: by 2002:a05:6512:3b9f:b0:54a:c835:cc4d with SMTP id 2adb3069b0e04-54c227fec8dmr958566e87.49.1743774658853;
        Fri, 04 Apr 2025 06:50:58 -0700 (PDT)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c7dsm436687e87.144.2025.04.04.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:50:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 04 Apr 2025 15:50:32 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: Add Sitronix ST7571 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
In-Reply-To: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2483;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=dTeNBuF92gWicEQve9HvfkFWbBeFaR0CZPu1dkMadRI=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7+Ox6WSnTaTLBN+nhOZdUI1lP4wWs1Ag8cKq4
 H9/WQry65KJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+/jsQAKCRCIgE5vWV1S
 MrBLD/9jdfQW7cH75jvbHn7mXtz0l/UZuTKvVvBku4E9JL9Le1A6oq8G2wZERMupZx/dnia1uze
 AULVrB4sBO11MQI2uwCP3Eh4ufM1oCp9MDF4EFRDh0zNQr0a8BpGEntsohjMykSKNm772VLQZQH
 qpKS4nXszHyuAWThmYMludUXOg5qpLjI954ZjdP0xLjk4bWVlC2dCQugpKH4uckiO2uqyrEOn5j
 V9thWNQQfARC/ORm8JiDKOfczWz9o3D+/Tf43KjRR03lmcd1tcG/Vhvv3L3DabcEsNoDcbh77dP
 I06fL9MOc+D2HZGexEDDq+d7UgO2VjktbGCIDL6QzLhqEgXOACQ2crpQs97RbAdY8aL678lIEe9
 bYUfmeKEne7LilXVZiX7A8MFZTctjnQ8HE72dvwmuUJmLdC703HCkQGXKEsw1PryNwOLUFa7MGE
 SeV5E5p1rDQ7Ao56+a9ziYlQLgI+6twUgvJr5ep6NTdpSQfFe5+kg578fOBdpQsG9lN9jhkuqZN
 VsCpDDjlJEL5XUVALcBkZxUzWdPvU6HcDgjf7SZUP44V82PE/bJlfVbPGFpw5+PS7UaMkI9zrs9
 szoLVigdme+HNDiyGjPJP/Yx2+Ox75K3Hn08YnbKlOZO4xy5Z4vsO0TplzLd26hGAFIcjoMOFCr
 v2Ilff0Pzryp/Hw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..11575b820c59c5ada427fbb6b015c331215c8db6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7571.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7571 Display Panels
+
+maintainers:
+  - Marcus Folkesson <marcus.folkesson@gmail.com>
+
+description:
+  This binding is for display panels using a Sitronix ST7571 controller in I2C
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7571
+
+  reg: true
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+
+  panel-timing:
+    $ref: panel/panel-timing.yaml#
+    description: |
+      The panel-timing node specifies the display resolution and timing
+      parameters. The hactive and vactive properties are mandatory.
+      The vback-porch property specifies the start line of the display.
+      The other properties should be set to zero.
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3f {
+          compatible = "sitronix,st7571";
+          reg = <0x3f>;
+          reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+          width-mm = <37>;
+          height-mm = <27>;
+
+            panel-timing {
+                hactive = <128>;
+                vactive = <96>;
+                hback-porch = <0>;
+                vback-porch = <0>;
+                clock-frequency = <0>;
+                hfront-porch = <0>;
+                hsync-len = <0>;
+                vfront-porch = <0>;
+                vsync-len = <0>;
+            };
+        };
+    };

-- 
2.49.0

