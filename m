Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE182046BD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273609; cv=none; b=IBxcvv2Rzz7u8y9RmkgXWypRVB1GnOabkr/jR3G9JW3hjEPoL1npLzAnCBoxjzTPm1gIft0DCLMLb8L+HGgQoncVFoQbJzHBTxmEJ78sHEj3/WQ8c2Nx+JFpIGLMGMVCNewfUmQoPFzpnKdn+HXQ1e8yt5F71IdemjE1dd4LvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273609; c=relaxed/simple;
	bh=Qw+ihHzG5xct+geio3rYuIIVhgSwwRDJSCuqYbtpH4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjLqPMLsV0n5K1uG1DTguMZwABiv7laCxR9zY/zQjrtz8P0HtBj6/cpyc+U0xr3HaIuuQNEZoIZeHT+oATfTNmpozpDt45v4uNvqWzNNg2XGbaALHmPTMg4t+xdTlcQYvPUeJp9/3D56Q56bb28tWpilPVkHPSrtiF/fUFK9/pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S67htKsN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S67htKsN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f2f391864so226087f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744273606; x=1744878406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoLuuoO2Fvx4pIGyt5bGUZIVskYzSTtG3IaMJttRhAg=;
        b=S67htKsNjmw9XgntdxzuX+TxJRFXrkBYb2J6hbSnES4mk33LR3Ay3lyy4VuWSeAzSi
         LLAoWcw3OI9JUvD5BR/CknWHTM2OUd8uLXN522Oi2oZCwPDl9ksJeaB9rNGBuVN8y+eq
         3vbvYHhAKpA70zfoYEz6ZAMRh9OqSYRaamrrWtrOLMEDIaqU2LkAcmk7sB2CMYiw5WBF
         MmUHvWbGRaBJ98/I26MnYRgwhBWdAeoQjqoJC/06NvXOGJlX+QbVaMixWFPvWkeE9CH3
         PmY0GZ5drccFuHtX9yDzFxFBvDRpEJ1RP0B/hYkK406od8b1LxRMJNie6Dhfhyi/qwaU
         /cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744273606; x=1744878406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoLuuoO2Fvx4pIGyt5bGUZIVskYzSTtG3IaMJttRhAg=;
        b=QkayPhWHEfpLMJzFScs9CYO4xYEnCXi8ZsWXhZH7C8rzEDLq76htMaTtiRAgoQG5ts
         pyCsazUKh48s4KI+Yk9ltPfuKZf/tyQuKanvIN/n/oRXUqfdDxrJY+XO3Uoovpsp2tXK
         3QPQq+YFa4vdmM+bX8vPiDHoCjcE7Z02F9uqpFwMME8LlR8M0SR8eRUzutxzU+O/l/u4
         di40ndEu2tW+zR3uW8Ite2/UDtaaRQvUUlk7Wf/K+U1DRXvhAIsf5I6guJgdyHS9cB5X
         kFB80G3r4FHshkb5l6INR8/YwCh9/zkxk/mIcqoA62c2ISQ46E3TQTCksVchb594zvRN
         m4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWc8V07lRBPU9fe+sBpUlcT2qulInjSzbnfRdSfvMne4JCLboarrKtXrbTQAX5B2CBBq6/w545TiRCnjFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU1YNPlqFg1XLdD2RVMdTiAMmmy+pLBzSTkbQ0SxJU2oyeU0wC
	rkCjnp6pJ+Mhrmv2ameHNGueeywH5OW9zm20m+DQFBNF4J/4EWp17NJZlpACWDE=
X-Gm-Gg: ASbGnctcjkTipgKB5TNO6UGdw44frSZ9gL621RjhvF/x1nUtmPM/CtTVmd+Q3Agn0gI
	Urz90xiQTtjPovmKCoPXASWW07VMcFI12WH7v952e98zudTNmKmBWM1KOmGnEfw1Oh3F7i9vo6P
	o+CMayLhlvwuYGUj19EctjUJm8+Kk3EqJh4gPVPZDwg0JxT1wQ1dxJpEXXK+pczRVJHz+rTmyvY
	kzqauOej6VqMTpWjSmdNrXfQD9iYN1zfzuqC+Ssnr6EAOQ1IaOeymXWtkpwPyqXA1QXvkvt6s++
	FzmLw9VxrX8xr9GAktTqQmzzClZy8FiEaY69VUxpd8l5Bno333+BAMqZZDi0Ld0LIi4=
X-Google-Smtp-Source: AGHT+IFJAAYpm4ch8BzX/j32mCSfuBT0k4tmo3Fc4S6M/p1AIC8JN3xN7HEUUqArc7BN3Wfv8o/vIA==
X-Received: by 2002:a5d:5889:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-39d8fd52397mr1003636f8f.29.1744273606025;
        Thu, 10 Apr 2025 01:26:46 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c84sm42884645e9.11.2025.04.10.01.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:26:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	S32@nxp.com,
	ghennadi.procopciuc@nxp.com,
	thomas.fossati@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	alexandru-catalin.ionita@nxp.com
Subject: [PATCH v4 1/2] dt-bindings: watchdog: Add NXP Software Watchdog Timer
Date: Thu, 10 Apr 2025 10:26:13 +0200
Message-ID: <20250410082616.1855860-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Software Watchdog Timer available on the S32G platforms.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/watchdog/nxp,s32g2-swt.yaml      | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
new file mode 100644
index 000000000000..8f168a05b50c
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nxp,s32g2-swt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Software Watchdog Timer (SWT)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-swt
+      - items:
+          - const: nxp,s32g3-swt
+          - const: nxp,s32g2-swt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@40100000 {
+        compatible = "nxp,s32g2-swt";
+        reg = <0x40100000 0x1000>;
+        clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3c>;
+        clock-names = "counter", "module", "register";
+        timeout-sec = <10>;
+    };
-- 
2.43.0

