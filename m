Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BE7211485
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150625; cv=none; b=Fu+ROY13PWYWZbGjLXClav48zVPYg/eEI9MhG295Eyr6+mnE4yIDOd2yUgM9LSFUeAHoLC9nom2eIIhfkKCSccICvJJHZcFoR9kUUPAiPinc5kthMls8M+8Vmm/q30cIrd7veSmMF81AYp2iTSpweldu6KfH+OGtWqilnff9FEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150625; c=relaxed/simple;
	bh=fDqF6O4FnTPiRQdfgNkPd+mtmIU2vY7UGxECVEdgvno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SdZJl42JdphO5sqUlv3m7wCpLWVi3YtlYWFYW8WBRvbkAD+DVVbxOfIb1ZbKGbFluvD6j/XUcNCgPIBhbiKYlRTK6t5BcQWttOJmsWZm2u6mrFCj8AZlnFbsQNp86QQekCSwWq++ZxkM6Yjmzm1N77QKYnwF54wH7ujfonnGTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VzBf0E0k; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VzBf0E0k"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224100e9a5cso38131355ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743150623; x=1743755423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMvSX3/8MLdcWMy6QaV85qtOi5tjLAdkUxquxvyJjpk=;
        b=VzBf0E0kLGuYHHdVFN3ZEHUhWfc8i6rVrgAk+EkgWmA2Z5LS/PyRRKgST+muqvzSaI
         j+zUvu7zs8jMjh3EzXcXPe9HLmGHWM8QErcs5jeizznoYs/jxgy2U864AN6CCoXvACRM
         5W1kXrO6XcKsr+3ZsPufFmwo+U8DTvCX404WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150623; x=1743755423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMvSX3/8MLdcWMy6QaV85qtOi5tjLAdkUxquxvyJjpk=;
        b=XaZTm5iYEVX8/4fBEnbhVqClMLTUUU1wLfRv1gXzsAKP35oj7GvZtDEkjH2Pt/qCaw
         zaTGfgzrifW39likglLkPJeSiyssd7LsbasUATAx/ydbh0IxyGHxf2oIuKyC29sh0mUP
         Pe8ogxzSt9c56VZRzuYsU8pxtWrpQIEJdklX1CTaoHuYrGohG/JtcrgwYnVB2RK0XSmG
         RSc9hRwNusJVru3m6gwJRB29ik59KNpfSAWSgkjHsnsi7228ZPHTvSXZDibo96MJlcVO
         5lf4zmTb7knjZIOD5hEDZHnmxJ6jUfmYrz9hig0SNHsOhjhegDQ/h+Sm2JQ4eranMeNB
         XJ9Q==
X-Gm-Message-State: AOJu0Yw9H5pc7aj9xu/XGHdssBeCaRaa1QzewBFOhhxZHqqV2CqeArW9
	yTfbqZlX3kPm2iqHe7GI7+WCA22iSMDHYBCTgmHbNuZ0KaLb8ul3oLaTh5pojQ==
X-Gm-Gg: ASbGnctGR84d+752maD9DukN0dDc1Zllxtshk8eyvyJNpjPs2HXMLz6zJogXLBfmyeB
	P2yz23qHsXflrXsyUo6NZ95tAGnxPFhoCmwY/tEm8GkjUf6gWIOOSDNfsa4xBOJE/OfoPsaXLJt
	wrzZko+xY2sI048Sjlhfb949oVa8bU7+MjBWOk5Ea1bcwvC9LBiqqjNk/8JhyimgVjLtG1jnzxM
	PdS1oqul2v0pZZdFgKIoTWr/XajeY+y7pqX/aETSuMxhsOnAibEYAnnMW/QmCrE4nqKX/f/bpip
	5t1aEkg9dR+S8MkjN7PUyUWqUn2QN3q9AvvuBRy9dwlAe58N9IIyOc8dvKXYBpf7xQ==
X-Google-Smtp-Source: AGHT+IHk5g+zM1oUsjRtviy05Z0HNph2qVB5VdMrxZ+hrOLHHnalDkunfM120pSNG/jfbr5zMflnrg==
X-Received: by 2002:a17:902:e886:b0:220:e63c:5b13 with SMTP id d9443c01a7336-2280491c3f4mr112692905ad.46.1743150622552;
        Fri, 28 Mar 2025 01:30:22 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:9004:7029:99b:276])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ef62asm12283775ad.217.2025.03.28.01.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 01:30:22 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: Add binding for PS5511 hub controller
Date: Fri, 28 Mar 2025 16:28:45 +0800
Message-ID: <20250328082950.1473406-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parade PS5511 is USB hub with 4 USB 3.2 compliant 5Gbps downstream(DS)
ports, and 1 extra USB 2.0 downstream port. The hub has one reset pin
control and two power supplies (3V3 and 1V1).

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 .../bindings/usb/parade,ps5511.yaml           | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml

diff --git a/Documentation/devicetree/bindings/usb/parade,ps5511.yaml b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
new file mode 100644
index 00000000000000..605f94df561428
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps5511.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/parade,ps5511.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PS5511 4+1 Port USB 3.2 Gen 1 Hub Controller
+
+maintainers:
+  - Pin-yen Lin <treapking@chromium.org>
+
+properties:
+  compatible:
+    enum:
+      - usb1da0,5511
+      - usb1da0,55a1
+
+  reg: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reset-gpios:
+    items:
+      - description: GPIO specifier for GRST# pin.
+
+  vddd11-supply:
+    description:
+      1V1 power supply to the hub
+
+  vdd33-supply:
+    description:
+      3V3 power supply to the hub
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          1st downstream facing USB port
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          2nd downstream facing USB port
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          3rd downstream facing USB port
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          4th downstream facing USB port
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          5th downstream facing USB port
+
+required:
+  - compatible
+  - reg
+  - peer-hub
+
+patternProperties:
+  '^.*@[1-5]$':
+    description: The hard wired USB devices
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    additionalProperties: true
+
+additionalProperties: false
+
+allOf:
+  - $ref: usb-device.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            enum:
+              - usb1da0,usb55a1
+    then:
+      properties:
+        port@5: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb1da0,55a1";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* USB 2.0 device on port 5 */
+            device@5 {
+                reg = <5>;
+                compatible = "usb123,4567";
+            };
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+            compatible = "usb1da0,5511";
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
2.49.0.472.ge94155a9ec-goog

