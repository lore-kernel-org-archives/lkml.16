Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C742957DE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310614; cv=none; b=Q1husmkXmtPgBfUGqTfcxWix1LHmpO6E1MCh+Tyb/FsuBcXSDlL+2MjqvaM//goHSKdR3PqDcftP+kqyujdVt0WDgKqxvZSH9uZAJcSRd5Kn1XksNUOXC6AFBageA31ySg/ny+/itvKj/ZQXY8Dyv+Uug1GRWG/WeZFNSc6T490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310614; c=relaxed/simple;
	bh=1T63O1OlCD9JKHcCQsup6IB7KusjwVZkSD/cwdn6G4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwW7tJC/H11bLuJN5aMc44MFnDiUhqbsKmze0RcfyW2DqdYvzau+sZOm9RLUAyCRPcvJgd+Cr3odvFBAZNb67aJNQMHATbQL06vWhUkwwZAc9iuc+yRuZheqXnp0chvKW0ap/MgEfo0JEhEhRSk6VjP7KAedkzrlNEUWmJu6N+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nFgCO6mJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nFgCO6mJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso4176007b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310611; x=1745915411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfY1cqMOlZNgD6sYRBGuCkyMRj2zV1J4ZTJazFwtz0s=;
        b=nFgCO6mJNRou2JyEHaI0dgJR+8f4zPcDFyNcmqxwtdNVJ6r5AwAOAn5fkivajbK3UA
         eJ8gk0LjUpunDK11AOslJxhOn+8tpgyQGNx/ZM6OtTlK98S9RiiJywSJ6ixc4XopfSiQ
         FO8FjHQjXvvLvs7kxecL3Vk8XoWTvznZWxSHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310611; x=1745915411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfY1cqMOlZNgD6sYRBGuCkyMRj2zV1J4ZTJazFwtz0s=;
        b=kfFHp7sIkGydgCCcuCNbxSeBvcpmhQYm2hy/5ozA7eQLquGhrU7jRv2z9QD6Otppi4
         /LZtkoCss+wbyOiwqo3y5iuTEKQHd6qnXB/tYZbxHcV2K038SP5gAxDgNdtehJ7YX0JZ
         xrrQYEevuT++YWMqD2YmWi1poqGrq1L7XrihzI4pZKgaDHHf4yrWpbCYCoOcp7lJAojh
         ZUjAx3k+G0cLnIIxWYZK/KAwiQlBEvZ2qB+BzmRrul7+wdOqojIMH98tWnysWggAPrJd
         2w6vqK9pfTKMtfuqe1SidIJwORGG6FXm0zFsJBDJNQkwlgPmDb7OuonFQYuow3Tj+Fmr
         V+KA==
X-Forwarded-Encrypted: i=1; AJvYcCUU7nZYyI66WW+DgYsa0jDXKmcip5UsclGxQBl6DqsKdNQGEyuWV50rFckawV9wuRWkb5JiA7IA7kICuj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVC0oQI6cY1nZGQJQhSskWbjGMoa8bnLIY+/lqPMRgV7QMW8WK
	LcbBc3xFbiIBJcXxqQALIlhxvEkzoo/gYu7HOqd3Mq4YNxp8tKKAsLevIdHrbA==
X-Gm-Gg: ASbGncvlNlW2Eo0Ko5WQs02EZ9LuRo/62zQBPCB6KgWdcuC8fC/2RX4Ux0HV8glIAk/
	DzTAm7F5dH/HPgvtPZDDJTFBZYHr1V+9h41sYeKZXKkYJ7kbszeb6cnHdnZKk3zNywhk/tOavU1
	EV8rw5wl9ONzbSSGuFqPYg7hW/6jFB7H1A8xPz5Q3bfxMs3VOWFcSiOb9IjA4+lzzwu+wEyRsyA
	9PXuSLxp4Gn+xoXpTFxJyWwvyO25AeaWn5FzaAQKC7wOdqH0lyW97Vt8xAuUuuklWz5JBQgvmpn
	4u1TRF+C7RNgjwHb/cwKBptYqec+nFBHI5U3j/Whe+fpBUj5vA/Zk+k5VMeFosrP
X-Google-Smtp-Source: AGHT+IFrR0SjHePrcDyloZ0SNU3e0mpIkK38kOSsRhDb/AUvmUbpn+VO4MBvrhULKtBCtjCKg1/Cug==
X-Received: by 2002:a05:6a00:2e1b:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73dc1616d31mr21371230b3a.24.1745310611398;
        Tue, 22 Apr 2025 01:30:11 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:11 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: usb: Introduce usb-hub.yaml
Date: Tue, 22 Apr 2025 16:28:27 +0800
Message-ID: <20250422082957.2058229-2-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250422082957.2058229-1-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
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

Changes in v3:
- Remove redundant schemas

Changes in v2:
- New in v2

 .../devicetree/bindings/usb/usb-hub.yaml      | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hub.yaml b/Documentation/devicetree/bindings/usb/usb-hub.yaml
new file mode 100644
index 00000000000000..5238ab10576308
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-hub.yaml
@@ -0,0 +1,84 @@
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
+  '#address-cells':
+    const: 1
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
+      "^port@[1-9a-f][0-9a-f]*$":
+        $ref: /schemas/graph.yaml#/properties/port
+
+patternProperties:
+  '^.*@[1-9a-f][0-9a-f]*$':
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
2.49.0.805.g082f7c87e0-goog

