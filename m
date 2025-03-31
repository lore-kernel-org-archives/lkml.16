Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1F1D5165
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408834; cv=none; b=TNNpXO7/SP4DzY1OkOE/xv3Pab2RG6MpN8aoFBLvXrJ2T6e2R5ei8HJVZCcM8e8V2SDzmQuUERzuNO1BnoSME3ox75JJUTkBa0Yb2yhDmaQg2/jihFHCkbsL4Dony2OFBn6qhCcluN/xG1Qp5oOUbh4p4PnZi04+pH0lXonvOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408834; c=relaxed/simple;
	bh=PnPHPhffTnddLWPJO2b0NVvsFyRaj4XlZxugAhEj3Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8mp1aN+grrVGzXucolpk9B/hcP0a1ibHJDeuXln2Du3uh2GwbBiMsx3kjc4hNsEOc8oYqB0yM+C2+ib5rLpkF0y8eeq9FPdzpR/N5Wc8dcPTXD/rrkuR4fhSxu7FbPcmazuZaDDoHG0MqzEsMO9+ByluKrq6KfDeFxN/Hzx3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIyoD3MG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIyoD3MG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3978ef9a778so261210f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743408831; x=1744013631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXxDv8uEzzOupk29klLSAOEKgKM6kgXgixs38bcJdPU=;
        b=EIyoD3MGBKYccRvAW3U5cEheg0/7caqGci2rFAyCdB0nS7+5bu2r//QmwDBQzGBETv
         bb3dDhzwmz+e85f2AwtjzubQe1X7mhxKxsrrDEGky8PW25d9SEIu103+2aoLtVgKDej5
         3MKq8zAIOHJ36WGsb9z8D8GciKlZVAM3hxe6XPdTmGBuiEd0FNAvt5fW7zMd6XkBHcVG
         dSRQsxRrZOzq0Dvx2vre91gmFNVwN5p7NBT10FLHotMrp5CoOqRbu1wb7NyZ8zZwceVI
         iOc3A5sunMLxgm2Byu7C2vMnfgX7Ejqm0OuEd4ZMALytBxTNaqa51VY9Xg0M4PiKoHdX
         TOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743408831; x=1744013631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXxDv8uEzzOupk29klLSAOEKgKM6kgXgixs38bcJdPU=;
        b=U7V+w+boz7MTApQCyH9Gj49rMGw6M1DOYwNgsZOq0Jm+1fFB1vutNB5gUHS4DXgIdk
         fkIT8QeaRT8yR/XJ0BOBxWB7arUWLDHZx/pxI5Mk8sLqS1xD86V4BoCFeEfdAZT5Kstu
         4wRaStmzQ587Ov43bwpxA101TtGjIeYCqyZZYOnfWvwfRUWuuaDsleXvqY4wXUxHipGF
         KXbvGKKbvsF3BChdJNdjUMgLhmNDCKuK8QzV8AAqGhDG/4dhCo6aYPUypxMznqrvRQiR
         fIR1Xh1mRw24As00i+hAvcgT9ALz5xQ7hXRi+q/M/soSmms4BMF/CHNYXlHY8NELeYut
         Wd4A==
X-Forwarded-Encrypted: i=1; AJvYcCXKK3bEGt9W/rxU985twM1wkTUkyX5MbSUESYFBeqpDKtcsL3fG4xig2VZKpQrUbKDhfM+J+O8xVRyBdlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZQ5JPBSRU94XhqXBsk0kIF8SV/wI7S7Tcn9hz04dBRqbBQ/O
	O4egwVNlrz6SrtdRLqV+0WFFRft8NzXYTtnv5+9MZIgdTg4CAPHuGLOV8kBnDZU=
X-Gm-Gg: ASbGnct9NaZ5Rc3OYRjCjsDGqMnC8ogoRcY+AVaznZdruWkYkc02XYV/klRwneTMYwI
	LMVcU5IfxdBq300g74SRuzMsau7RIYQVwKIJ9dlUHylBogBaLvqAp3IfJ3uG9TamN4obUjuLjiZ
	VYfYXQ9UavWQa/orT8MDltT7gFzOeoaFaf8Yw7qGXsMNbrsADkmAJGbeohmsYXSncXR0RN66Gcm
	E1D1RzXziinwQqc/RTT3ujFrAMC8mJ8BKd0u4a99HmXcgeYjYJseBW1MeQVinJ9g3JpAo0Xp9c6
	qSOlM9EOUorCwBhqb+Lgei+vui485nKqTH9Wq4+Sh49Cs2PrLg8XMVppHw==
X-Google-Smtp-Source: AGHT+IEFGA4sZLXqBCtCmvy8ZrF9tSMkgWI/FRxF2a0s+L5qTZ33ZYOB11B37AkE0XnWLTlVxskmiQ==
X-Received: by 2002:a05:600c:4e52:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-43ea47eff0dmr101735e9.8.1743408830627;
        Mon, 31 Mar 2025 01:13:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8f404ac3sm119812305e9.0.2025.03.31.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:13:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: writing-schema: Explain sub-nodes with additionalProperties:true
Date: Mon, 31 Mar 2025 10:13:45 +0200
Message-ID: <20250331081345.37103-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document recently introduced pattern of using additionalProperties: true
for sub-nodes with their own schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/example-schema.yaml       | 15 ++++++++++++++-
 .../devicetree/bindings/writing-schema.rst        | 11 ++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index 484f8babcda4..c731d5045e80 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -178,7 +178,9 @@ properties:
     description: Child nodes are just another property from a json-schema
       perspective.
     type: object  # DT nodes are json objects
-    # Child nodes also need additionalProperties or unevaluatedProperties
+    # Child nodes also need additionalProperties or unevaluatedProperties, where
+    # 'false' should be used in most cases (see 'child-node-with-own-schema'
+    # below).
     additionalProperties: false
     properties:
       vendor,a-child-node-property:
@@ -189,6 +191,17 @@ properties:
     required:
       - vendor,a-child-node-property
 
+  child-node-with-own-schema:
+    description: |
+      Child node with their own compatible and device schema which ends in
+      'additionalProperties: false' or 'unevaluatedProperties: false' can
+      mention only the compatible and use here 'additionalProperties: true'.
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: vendor,sub-device
+
 # Describe the relationship between different properties
 dependencies:
   # 'vendor,bool-property' is only allowed when 'vendor,string-array-property'
diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index eb8ced400c7e..fc73072f12fc 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -117,9 +117,14 @@ additionalProperties / unevaluatedProperties
       should be allowed.
 
   * additionalProperties: true
-      Rare case, used for schemas implementing common set of properties. Such
-      schemas are supposed to be referenced by other schemas, which then use
-      'unevaluatedProperties: false'.  Typically bus or common-part schemas.
+      - Top-level part:
+        Rare case, used for schemas implementing common set of properties. Such
+        schemas are supposed to be referenced by other schemas, which then use
+        'unevaluatedProperties: false'.  Typically bus or common-part schemas.
+      - Nested node:
+        When listing only the expected compatible of the nested node and there
+        is an another schema matching that compatible which ends with one of
+        two above cases ('false').
 
 examples
   Optional. A list of one or more DTS hunks implementing this binding only.
-- 
2.43.0

