Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760428F528
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710161; cv=none; b=ERzM82hBaWDjQAdNl/ipIleF8NoDaOF6gbkQKjHNVdoakFGDkDWNQSpb0NrKcoCNIow0hdGQv0WmJSQyuHinM1Gpc86poly74jmqiYz9G7jlN2twYGjqP4/UdqBZBDfdQWcsbIjiydZWQxgAzVTjd9eDbkd28yX4VCuwzX7jwd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710161; c=relaxed/simple;
	bh=u/xh1SzwJolarxDS+l2/MHtZxOawnZxq4T8iPrK6eHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Coa4MivPunLBAuQnWXDP0Aw6M2+IMxqf85uUYSQeJs7IB4MrPd4Ydfdn8dgp3HMlKTZNaxQ5NKBGGp3uzIyt9Z2pfcFtXYW5QlZzEOXJ1ono1jLKxrWoHmnalSeLGiJ4CpIy9jbmpF00map4mBOlg0uDXXjsETlyi6KAazj1iBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N3aFnQd7; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N3aFnQd7"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af589091049so3629649a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744710159; x=1745314959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqjBaj3EhtrpvOSdInIc8UJK8DAPvGXIW4PIR9rJ1xU=;
        b=N3aFnQd7apItLEn/o5GVf0a0Dki9x0VLj/8ukbraPcyNNp6c08gDCZ2cFscSP+oLMC
         ztKl/Tq3mZUAfcNKyKYsVW6YD3blqimcOgFdtmbOHVQ1nRQbwUE/6ycKOot1PHj+OUB5
         l4s7f7p+Z6hFrxLH/RxV9H75k2uwSBc9RRCy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710159; x=1745314959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqjBaj3EhtrpvOSdInIc8UJK8DAPvGXIW4PIR9rJ1xU=;
        b=P8rKazvKUSki8Fwq2TMoXxLKUfMDERVcUcLrl7rd6bYyxZ82bxB7mQHW6v9Jcqe5LK
         8DCXRLlkObST5M72ubp889MZAcMFIEsQB7xEVH4DLbbDXS8HW0pGezldJB6U4RnV8NaD
         ZYBRFmrAU24w2PPglMP5DPPIs0FLES4L2+5cl4OIw1CQyPp7uzwOgKTwk2QiMA7q3LR+
         xTnBZ9fWAx+F5uJRlbHq3oGA3+I/c/WtHZSNef3HH/0cmxowzt/4seGCIasSMFZ7uTWE
         ++/stHmLJ/QK9+DdFY1ib9TXjjnuqN0jeAilhKmM34K8fQQ4wNP1mVj+vi7MBQrfatdJ
         ZaRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyR/ETqgZ4NPIhUm6G1tK9gvEfxL58JNcw1sPqDqoGZXnyEen9foUjGKA/cMUrZ8ZdDRSmR2IdeVrI9D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhJj6WN3PwkAHnZBTA7RPuQhABUpVal4D6Be8Y2OyMHNwNNGv
	RrSAWj1NlJiES+NiYi6Q6Us4oFZHFfMp4pTHMXXGBo2ivxf7UpxJkpDQvB2Tkw==
X-Gm-Gg: ASbGncvO9+I+KyOoE8Tz3yj96Th1Ih+hbiCg0foTf4TiraMmcgTTSrJRhRAipa+NLo0
	0oST59hx5g2VGuTC9Bnxi1KfMuROYGu11ESbbKqzkpljpWNsTOWhdFJea5hK9Knklmtgv+u5pPx
	QezZgNlSeGzxTDUqYNY2mfmqm6Qf8Fx/0uTMiHTxyiksCuN1O4tliAQk8tfuxmQi+h3xIHRIlmb
	seyOHtQqiBQEx2la2frLcc9XPJKbTmy2R59V36zfbrF7/+dahZvOLgnZ/Zq3PRmotulF9QZXIit
	aL0OiGW8j60iDodNeQlCzdXrmxP4c8bViBCOQd83eqWnpkGI/Y8rNZsGR0KfxQ5g
X-Google-Smtp-Source: AGHT+IHTPefmEfMnTS/yOpKZkHtZEcW7+f3HO/Nzl4fBj1qjIetkYxcjVASlATaL9A0c6R8fuH9P0w==
X-Received: by 2002:a17:90b:274e:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-30823670d71mr26179495a91.14.1744710158710;
        Tue, 15 Apr 2025 02:42:38 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7d0d:86ea:ee84:cd08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca5asm113135215ad.254.2025.04.15.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:42:38 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: usb: Introduce usb-hub.yaml
Date: Tue, 15 Apr 2025 17:41:58 +0800
Message-ID: <20250415094227.3629916-2-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
In-Reply-To: <20250415094227.3629916-1-treapking@chromium.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a general USB hub binding that describes downstream ports
and hard wired USB devices for on-board USB hubs.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- New in v2

 .../devicetree/bindings/usb/usb-hub.yaml      | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hub.yaml b/Documentation/devicetree/bindings/usb/usb-hub.yaml
new file mode 100644
index 00000000000000..34cd248fa43c2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-hub.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB Hub
+
+maintainers:
+  - Pin-yen Lin <treapking@chromium.org>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible: true
+
+  reg: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      The downstream facing USB ports
+
+    patternProperties:
+      "^port@[1-9]$":
+        $ref: /schemas/graph.yaml#/properties/port
+
+patternProperties:
+  '^.*@[1-9]$':
+    description: The hard wired USB devices
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb123,4567";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* USB 2.0 device on port 5 */
+            device@5 {
+                reg = <5>;
+                compatible = "usb765,4321";
+            };
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+            compatible = "usb123,abcd";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                /* Type-A connector on port 3 */
+                port@3 {
+                    reg = <3>;
+                    endpoint {
+                        remote-endpoint = <&usb_a0_ss>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.49.0.777.g153de2bbd5-goog

