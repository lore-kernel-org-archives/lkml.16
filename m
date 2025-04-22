Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AFF296D06
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344785; cv=none; b=XHuwoAX2Egk7wxxZWqC1fwH5ucewDIu1M86LZmoeVOYRl/tAJg0v19isq43JkioASnbvl9t7HioXPsWsHjCtynfzLr///2Rv93a0+oPApiUVe6f6WAe1N93aQPriLdhagb8CDslA2dgRJBSjWy/KBd5R2l5/T55sgOx2BaNobzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344785; c=relaxed/simple;
	bh=rX4pZAx+Fw4Z9aS7brID/2V6XdrCArIiB7uoJZcdUlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QedisXcVDpNRvJrJOXAJqOgoZIkSiwmI6cq7caKAiZU6AAtZeyno24k4ibsKkVJaI3slN2Xdk/sXNynGIlpa9T3XQd1oQTTk2tBwTy7E5XbT8sFbX4uuRcCsT+Cw5WSYeymfMBwfOCJClkL8cnj+Rgv0P8LRe3YU8tKgUjDZHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conclusive.pl; spf=pass smtp.mailfrom=conclusive.pl; dkim=pass (2048-bit key) header.d=conclusive.pl header.i=@conclusive.pl header.b=Jw2SoAzL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conclusive.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conclusive.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conclusive.pl header.i=@conclusive.pl header.b="Jw2SoAzL"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2963dc379so816706466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conclusive.pl; s=google; t=1745344780; x=1745949580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsoqhQJqReGblLVET6rA99edyyj8MD7IJfz2aWYWya0=;
        b=Jw2SoAzLD0Ux3rSnqVrTEAPE7WXaDzdhOAAOCq/bNU/+JscOL6pMXRYeIXwAbET/h/
         Knn2hxyAVlGe3GsfgR7ObUoihLgzvklcbSME5ETE7cFIsyKktuoYyD9RZat9YrKopSfK
         8tJo/Z5r4dW1y9g8vjZdfvNd/UoNZy9AW/zQUVgt0jziPy/u7lRwAA1RbRdNCMn30+1A
         OCHEuB+tcY8kx9ojykrs7tJgqafO+tgCKhdVZqoJgOhBJ5W67yQ7NvrFwCgC2bo+v8g/
         PMNV18vvFyikDIDDNhKo8NGMH/rIXxcLgn6Pe0ZGwnaOsaymK481O69uu+SJjIxG55P5
         hKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344780; x=1745949580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsoqhQJqReGblLVET6rA99edyyj8MD7IJfz2aWYWya0=;
        b=WVW00fXFmedQ2x0OKz0VkCseggg/VFXhVArHBHaHNhX1/JR1+0Hys31QxEeDJnVnY4
         OkCdjlYzL/2ZJgjUxI2RWJ47g9vojE2uAsQRwuBrKEIbrteBk3CdaAsPNmiXfnIf57aj
         yiSgCb5uSujePaOcJK7NCgz7lw1w4nP+w6FpXx4p7d5t5s5DrY3aY4hjq0B1Qrztrn6R
         ITwwecamefWaHbfb/F9OwyO7Z4wC26YRm8hZzJnZbtp8vEpzbtvnORWrHUwsFEo2NhYm
         w7EucBL90qguLUvuEXZ6FXv+XchOiJPwbkUn9P2UPaKfD4sfU0SgsENnXVj/ftnB99II
         V+rA==
X-Forwarded-Encrypted: i=1; AJvYcCWFVaraWPW/FOzuyy1mWA/q/U+08anDPkIhG0d+OtMgJtCe8Elbv+kXg/JjtM6Gp19MoB1DZp9rzt6Ur84=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSiFV8ZLZkImtjy8/3l3GkDi7Nnpyud91QRpgbSOdil5SYV4A
	LcLbSWKb6zsE8q0V0Ukcl1Pt59W9MRBU3aw+cNbWxk48nXbWumS1pd3UDGha2Kk=
X-Gm-Gg: ASbGncumnAuP8JRVkgxr9iL/rE8TQlicbNQedEKv/mIth8mrYhPp3zHmHq84G53cdyo
	OIPUpNHYMFdfY6zT1UOrWJXnmJWLbLcamD8fWq7vD0fIEXDp/LTie3Ah5HKYaqIoF+wiLth7qYB
	AMHEK+ZSKaBe3c5wekgIvWGHlyTFpyjD1koJp89K+DgjHBdOv09sq3TPZItwXw1/z+TpqFGagWh
	du5VgpoYQY+s/PJme+47cBMgEAC96OjSU8UfDVzsvLEiwT6XErrvjZcyRc6E0KuM1vf1NTcElTC
	6UicGDpL24nAxFOm50eby+Et5dTCQckWp8pEA2nXlQV4jI6rpvtTe+11ftthhD4fk1CS4kRykP5
	82CP3W5VY
X-Google-Smtp-Source: AGHT+IFDevBClHWL43+s8ObNwls2JReJQHbOXyOW76f7cvBTjIZlKeT5m3zNvNHjFdlY+e7U8WVEGA==
X-Received: by 2002:a17:907:da2:b0:ac4:169:3664 with SMTP id a640c23a62f3a-acb74b7b640mr1311993966b.33.1745344780516;
        Tue, 22 Apr 2025 10:59:40 -0700 (PDT)
Received: from wiesia.conclusive.pl (host-89.25.128.123.static.3s.pl. [89.25.128.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef47733sm690208466b.144.2025.04.22.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:59:40 -0700 (PDT)
From: Artur Rojek <artur@conclusive.pl>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakub Klama <jakub@conclusive.pl>,
	Wojciech Kloska <wojciech@conclusive.pl>,
	Ulf Axelsson <ulf.axelsson@nordicsemi.no>,
	Artur Rojek <artur@conclusive.pl>
Subject: [RFC PATCH v2 1/2] dt-bindings: wifi: Add support for Nordic nRF70
Date: Tue, 22 Apr 2025 19:59:17 +0200
Message-ID: <20250422175918.585022-2-artur@conclusive.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422175918.585022-1-artur@conclusive.pl>
References: <20250422175918.585022-1-artur@conclusive.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a documentation file to describe the Device Tree bindings for the
Nordic Semiconductor nRF70 series wireless companion IC.

Signed-off-by: Artur Rojek <artur@conclusive.pl>
---

v2: - rename the patch subject to comply with DT submission rules 
    - fix a typo in reg property name and correct its indentation
    - replace all gpio based properties as follows:
      - irq-gpios with interrupts/interrupt-names
      - bucken-gpios/iovdd-gpios with vpwr-supply/vio-supply
    - clarify usage of said properties in their descriptions
    - add a reference to spi-peripheral-props.yaml#
    - specify unevaluatedProperties
    - drop unused voltage-ranges property
    - update bindings example accordingly w/ above changes

 .../bindings/net/wireless/nordic,nrf70.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/nordic,nrf70.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/nordic,nrf70.yaml b/Documentation/devicetree/bindings/net/wireless/nordic,nrf70.yaml
new file mode 100644
index 000000000000..c9a41b61c624
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/nordic,nrf70.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/nordic,nrf70.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nordic Semiconductor nRF70 series wireless companion IC
+
+maintainers:
+  - Artur Rojek <artur@conclusive.tech>
+
+properties:
+  compatible:
+    const: nordic,nrf70
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: HOST_IRQ line, used for host processor interrupt requests.
+
+  interrupt-names:
+    description: Name for the HOST_IRQ line. This must be set to "host-irq".
+    const: host-irq
+
+  vpwr-supply:
+    description: BUCKEN line, used for PWR IP state control.
+
+  vio-supply:
+    description: IOVDD line, used for I/O pins voltage control. Optional.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - vpwr-supply
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    reg_nrf70_buck: regulator-nrf70-buck {
+        compatible = "regulator-fixed";
+        regulator-name = "nrf70_buck";
+        gpio = <&gpio2 24 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nrf7002@0 {
+            compatible = "nordic,nrf70";
+            reg = <0>;
+            spi-max-frequency = <32000000>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <13 GPIO_ACTIVE_HIGH>;
+            interrupt-names = "host-irq";
+            vpwr-supply = <&reg_nrf70_buck>;
+            spi-rx-bus-width = <4>;
+            spi-tx-bus-width = <4>;
+        };
+    };
-- 
2.49.0

