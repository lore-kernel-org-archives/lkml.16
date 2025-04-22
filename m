Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F82980A4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310618; cv=none; b=gAcodTw/BEPsu0RgtSpud4DriKXQrauoVKp5ujWjGi7Pjrrwe+nQO8ibdw6kvrZ0xuRvW+T+4OK4yb83oA9hOiMlqsI6mKsF7x8VX8UNaRFDTVE6NRQegQNW+E929ii5+2435gpxfU1axiJdHeTf845pqJfsHMU9rJWTkYSDhyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310618; c=relaxed/simple;
	bh=mxkGjy74EQbDXjJNT5mOuVxMkvs+6xBiyP2rOL0F1RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkakxEryRxhl1/N+jOn8OuyNp/ahxceosyQfbwS5nSuSGFUVeZkPl3aqfndx9MaQuqq9AarEJVvV9Wdg5JdekkoHIja9pgdIFXDh/dPyeockSuqaKHCxqfO36KoBQ3hBQzjWbybfLWc/c655YpsUmSbxQXpiV1c84QL2/qityW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=geVCaNVv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="geVCaNVv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so4387223b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310616; x=1745915416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MvplzL87H/4ihBut+ua8FE1FYMETCy70fkGX4prNlk=;
        b=geVCaNVviqD2Xuo2KtoRHS3e/kH9HRrbW3YAIxGOsZyzHZxSXNbPGN2a17flByESIT
         fyfyURSn9bQMJtdTAxuRxF8eh6Rdg90Vz6JSyx1ZAbXTTtkHCoVDgXbZ7qBKo+5oG0VM
         Shk4ygUQZzakH1a9GnDr9fF2XfJTwBd8LBg2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310616; x=1745915416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MvplzL87H/4ihBut+ua8FE1FYMETCy70fkGX4prNlk=;
        b=AVUvueOAN4jwnmPdRdYBfQYMDBdYwXe9wrIfp1r+J9665lLoikiW7RhhQwtA/SrrRf
         LheuuC0ihzyblJi5NlLX8GoB5/3D29Dl77Ut77u1i/7+13sdElM9esr2HPd2+MK1cCfw
         SF/jrbAkGdWN/5+r5s1pUY7aNeYJQiDuAg9L5xVq/L2sXi8CMQIrFg+nHinrELy51MFM
         baUtF8MEzWvbMHObd0agZFTXMmb2ujvE5gMpMQwn2H0bKIimBDSKD4BBHEpq5GLIO7sG
         1ncQKO6Q/oYWScsUxGFufwCLErGn63UDHXGKfzc6XRmJ/sI0jRy+YCaMacgqDVIH2NjC
         fA5w==
X-Forwarded-Encrypted: i=1; AJvYcCWVPZFoQy8dmOqP2z4ASvUaTjqqBKd+bgdf/HqKVZaGPlxzK6zy33gtKE0+pfTYnodipY7Yf4lpojCc7L4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJw1++zwUbsIAtKGbju+ZCYz58FD52K7onhnaaS8kM2sn+52n9
	lz70cvdDzTkAVW+m1T21rIxQytdEgG8WeCB96j4GljEOJRcz9nUMQoycefO7Og==
X-Gm-Gg: ASbGnculQObIQBRKPAXFyAJZLFkGgFGljtDg0CcsD90bbbxfZWScnhO3Pn2Gt64IkcP
	2VYKP/89wd2RZ6Ak+zh1YCG6Um14u9pVhGmThSQg8+a2f+X6x7q1TLXQO2VzU1CAv5SjTwMiS1N
	XiciWZOEr3p7Qz+O8vebUbGpGRxBJiS/eeBn9yRdyxVa05zmdKkws3BnCmdegh6f9VwMmTdurFr
	E7qrAlIEOq4KlhZjf2qBIT1ZgnZt5SxIuZzDbh9haOg1Y7ALSMaWYOKldppSj+BEeiT0opuamIE
	dF01bDNLtdYaOJujBl0wPLBun8kRrQax0P+ACowGHTXyjy+Wn34Ay08Y73UenkoA
X-Google-Smtp-Source: AGHT+IHELay4Fe7ScimI0hCKyiKwYc7S7OtU/xOLpm2AArEqdrf4gn0UkIULLKLNLVAOqFO0noMvEw==
X-Received: by 2002:a05:6a00:32ce:b0:736:3954:d78c with SMTP id d2e1a72fcca58-73dc14a11b9mr18582101b3a.6.1745310616207;
        Tue, 22 Apr 2025 01:30:16 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:15 -0700 (PDT)
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
Subject: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
Date: Tue, 22 Apr 2025 16:28:29 +0800
Message-ID: <20250422082957.2058229-4-treapking@chromium.org>
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

Inherit usb-hub.yaml and remove duplicated schemas.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Remove redundant schemas
- Update the schema for downstream ports and devices

Changes in v2:
- New in v2

 .../bindings/usb/realtek,rts5411.yaml         | 52 +++++--------------
 1 file changed, 13 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index 6577a61cc07531..a020afaf2d6e7a 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Matthias Kaehlcke <mka@chromium.org>
 
 allOf:
-  - $ref: usb-device.yaml#
+  - $ref: usb-hub.yaml#
 
 properties:
   compatible:
@@ -19,61 +19,35 @@ properties:
           - usbbda,5411
           - usbbda,411
 
-  reg: true
-
-  '#address-cells':
-    const: 1
-
-  '#size-cells':
-    const: 0
-
   vdd-supply:
     description:
       phandle to the regulator that provides power to the hub.
 
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
+  peer-hub: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          1st downstream facing USB port
-
-      port@2:
+    patternProperties:
+      '^port@':
         $ref: /schemas/graph.yaml#/properties/port
-        description:
-          2nd downstream facing USB port
 
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          3rd downstream facing USB port
+        properties:
+          reg:
+            minimum: 1
+            maximum: 4
 
-      port@4:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          4th downstream facing USB port
-
-patternProperties:
-  '^.*@[1-4]$':
-    description: The hard wired USB devices
-    type: object
-    $ref: /schemas/usb/usb-device.yaml
-    additionalProperties: true
+additionalProperties:
+  properties:
+    reg:
+      minimum: 1
+      maximum: 4
 
 required:
   - peer-hub
   - compatible
   - reg
 
-additionalProperties: false
-
 examples:
   - |
     usb {
-- 
2.49.0.805.g082f7c87e0-goog

