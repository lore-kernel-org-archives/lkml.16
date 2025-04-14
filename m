Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF5327FD58;
	Mon, 14 Apr 2025 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651634; cv=none; b=SHWACSseKk5WBmWfp13Hb2XCDPi8JRV0hf3GbKBmK3kyD/RrLfZasLb6xT/jzSvmjpJzwxMGl+14Mtj6CkwWJkgrliiO5icMutO/GiYZuC5Xm0FRysKFavhSHToYkyVue7+wCHDD9HvCDcC3XuauQWFQWmTOnh/SVB0AsZno5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651634; c=relaxed/simple;
	bh=wLOB9y4DPXrEOgyrYWOp5459K3Z4tRh8BQGjKP8S8V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oj95kTjyD+JpxmAmG1maLBjwepoE/T2jPs3SZn+7y1ZhMc57GZg7tvvHsUDq0AqOYrabyOoRriUsmMdfV/Cci4vmheRHhgRc0udLaXcjdqmBhkaYotBupdSHH71zChmoJoo4P1nFIdDwis4BJAOn45bF1aJDwnT/qPzgiQqw7xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrQ5ArSK; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrQ5ArSK"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso38349431fa.3;
        Mon, 14 Apr 2025 10:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744651631; x=1745256431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
        b=jrQ5ArSKE6q0RKNPJrxi6wn0qvyEly5CXjWVON/efvNwSd6X9zBp9VNA2uroin5KbX
         Q6U/NtMS6eUjiu1ySDUV+D6bNTgEB9wpPoia3kL8qYxO4lRerkzR62hKqa/lm2KE5leR
         aKKS0AsrY7ozLYnhqMO+bX2bi95bUKu0s9OiGylN9xxUHeQyFzH4LaFdiO07sNDrmsTD
         4JtQC3QhWGWH1QvvIrCeRvZYhyG15fKwnOSiU1tz15rk6Mh3n7fkgyV28y6i6vuB6pQh
         5Jx0cx73PK8yNYpDl39GXJr9ckPsQQEeRj10WCJA+KWwN2LiDRCqi84uF+dlPCcCwS+N
         PYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744651631; x=1745256431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
        b=IRdp8c45TfE4t7keATlt+JRjL10phFFS9qO3NwW02src9qA9DI+G96StC7UQpw/x6l
         IuvSrBh9yyt86hBE/k3GLAICqzy9/5yYBYyPqhUucsrNFp6+0ty6XcPqInv8ObIhgTsp
         SnhhIcciB9sFMobNl5b8FjUSiEr//JQRzzCjMtThNvdDYOjrHF4BwxbazehV7XaqjHj8
         uAwqibA/25VNsOg54cxIXK8eS3XWCs3o7wvpyjtvSKQFlmSPr+cu5yIRcmJ7nObOf6vQ
         SuXEK3vjwklFluXovCBrPcYooev+ivDlf9BcMSiCQQFztVd3iYWeJJ7yAIvhIHOTse9P
         4ekg==
X-Forwarded-Encrypted: i=1; AJvYcCWHWSMKNy2Fa3soPWBo/DsFZyOggeDjCP7U1SqJ5V1UNSkkKArkwbTFXZ+IiiFR52frVXVyOln48/V4@vger.kernel.org, AJvYcCWhpgZbZ7CLXf/IC5ZsbQHWkOGwdq7W8M3DhRJT5jJJguBK2ch1JB2k+nZ5DK8I2jj7XGvSBK/ssPFzAn1j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hnrAUTYM08iW5bDQSkPAY2VTs0CX61OxFULT88GLsKhFR4nZ
	bxwn7yIvRaXqPXcsg9HQ4WYLPmIxN2vNDehkfl7HKPurDS3iXyRa
X-Gm-Gg: ASbGncvWgEGUuN3vyfyenEysUcd60oKsoEUtq34oY02IdqT5/NFe09liokev8oqSmhU
	oWSW6yrmHlBgijQwBYiDWTnXHks4llze4VCpo8NFpO+V4PUDD5zakuO6wIVA8k5BeFmRlFxcHIz
	dfEq2pD+iePKACH4AHTj/VtGOi1VtdEAmulUk+hbtBRXZaaLTS5wHVMKzCNjdioWdXYi2l1zKY1
	KBqVk5TfkKvxHg99a2ZLCEHs+tsik5UoplzvGJFOfrEcOYNy6+DAf4uRIUPez6SLaZCg0S+xspl
	HPNm+7JUAV2VXPVvJpmOtaKLwS+MAOPszZupIWm4TigjvunFHImWVg==
X-Google-Smtp-Source: AGHT+IGgjSXe5IWtLluH2GntJzwOjsy2WB5Lo1pm3+iVVmyosyR4TtTS+V3H0VrRqIoq/Kv9yfreOA==
X-Received: by 2002:a2e:a544:0:b0:30b:c91d:35cb with SMTP id 38308e7fff4ca-310499b4aaemr33720081fa.4.1744651630766;
        Mon, 14 Apr 2025 10:27:10 -0700 (PDT)
Received: from PilotMainTrash.lan ([178.34.180.83])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cc441sm17806061fa.35.2025.04.14.10.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 10:27:10 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Visionox G2647FB105
Date: Mon, 14 Apr 2025 20:26:31 +0300
Message-ID: <20250414172637.197792-2-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414172637.197792-1-sanyapilot496@gmail.com>
References: <20250414172637.197792-1-sanyapilot496@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DT binding for the Visionox G2647FB105, a 6.47 inch 1080x2340
MIPI-DSI CMD mode AMOLED panel used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Xiaomi likes to use different panels in various revisions of the same
device. A factory panel even can be replaced with another model in a
service center.
So, the power configuration of this panel is similar to
some Samsung AMOLED panels, e.g. samsung,ams639rq08, which can be found on
other sm7150 Xiaomi devices. Even though Samsung panels weren't used
in sm7150-xiaomi-tucana and toco, the described voltage rails exist
(confirmed by schematics of the device).

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/visionox,g2647fb105.yaml    | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
new file mode 100644
index 000000000000..49dcd9b8f670
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,g2647fb105.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox G2647FB105 6.47" 1080x2340 MIPI-DSI Panel
+
+maintainers:
+  - Alexander Baransky <sanyapilot496@gmail.com>
+
+description:
+  The Visionox G2647FB105 is a 6.47 inch 1080x2340 MIPI-DSI CMD mode OLED panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,g2647fb105
+
+  reg:
+    maxItems: 1
+
+  vdd3p3-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd3p3-supply
+  - vddio-supply
+  - vsn-supply
+  - vsp-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "visionox,g2647fb105";
+            reg = <0>;
+
+            vdd3p3-supply = <&vreg_l7c_3p0>;
+            vddio-supply = <&vreg_l13a_1p8>;
+            vsn-supply = <&vreg_ibb>;
+            vsp-supply = <&vreg_lab>;
+
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.49.0

