Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C021B0F32
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041821; cv=none; b=AOp+bQHUdZ/ZwzKHuX82uQ18dXCLEPnfWlK56MoPI+mb8wbwrWkuFmuwyNS4SkwmJOqALupQ9dBMSFMaOnLNVNSiUP3tZqwBSbW9XVSp7rMspP0c4bxY3pXV3KsNL5ZrD1q9ITbdqK0hnOnF2Ngi5mHujBMmmfhtVb1b9SWLl38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041821; c=relaxed/simple;
	bh=cwUg5LduXXZcufnnSzBfEonNlCK2lmvkVORVQf2hbvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rc6EuNvA+uJ8tP2EE+CKrkvLItz99Bvi81Ml+++5opPqpGEofEFZuKnvYt0CStSeoZXHXFkLvrg86oa/TsSw4uMrNxND0j2e6hToF93tIMNoIqBDyvvKGNteZhS9DC707mSVDhVr/rF5piDqOB+JodlaMjXowDyDfr6OIGJ0rlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZ0gSQ+k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZ0gSQ+k"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso45729045e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041818; x=1744646618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbL55eomgr//IZJoFaosxxTA80M3t+xWAEMNMsogd4o=;
        b=dZ0gSQ+k/qITe+teA4mXmxNx0O6eTsggoiImqwRIx3eJDpQTV5I/d6mSdXVOxAKU1c
         M7pK4DjGxjPzk9PKe/DbzaYLGzIbyNFhbYIQl78Ur5FPC5OymDvdQwXkvc7U57Wpn7Mw
         ZvvO5swq6FpOuMjP95lAhxvHptKO7jqOwri0A+xxQLoMjzgorBdOQ/pPvtgGN9Q8YQup
         DLxcz4mGgcZwu52aSEqIJpU7ul+Clsod/A1k+BUVhw/YE1UF1mfhu3Skv7TSTW19Z6iZ
         FNwoQZSb46qNZuFQdcP896RnHiXdPMQFA84P+gX/ULYgWW20/hRZslfnB+ChMm92lXIB
         sX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041818; x=1744646618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbL55eomgr//IZJoFaosxxTA80M3t+xWAEMNMsogd4o=;
        b=JcTMieXs2f/sAPzqNDd1Mn+ZKttBK8Du63TCXS4meITNS7TR+29+pMcrXuEr4hG7VN
         jpDs9Y09Fz5CC6jkTe/soKixDYOH+Sl0nCYX7aVJvNwUfHJ8Z1if8Vi+/dQN7SdFbaew
         /kM0ofMVQuJYboEff2So6vWIkr1xzZpXljE93zBPnqRnGmQVEbccEqzV7QX6JSR2OYIb
         TjyCrpcIWiNTCLiLPC8hOh2WTko6Hj1CD8iRJHDbO9f4ZaJ56iBNkP+JBgFeq9c02kDi
         /D/GtVlzvsgViHDbxFeYJX3l9v/RPYBlNE4R7hvG8aui4a9bfi2CnbgOoHaptGF95G5W
         khOw==
X-Forwarded-Encrypted: i=1; AJvYcCU9MPtOEKG2pfBBtvc2BJB4XWbisStcb+gR52rIlj8ANeLbVdrkJcRTgZoY60D6QfmdJLei6E3euj5zqPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcs7PCzHwpVig+1mqM3jv4FPQV5xBOLatydhu4KMyDMIU71Txr
	kp+5tG/2fhOcbxJSlSYo1fbzNgLo1MpzhcMJrzQpoLEhEdEwmkvR25mzJwm9cKk=
X-Gm-Gg: ASbGncs5lqVP7GhcpDw7wQlHbXs8299hL5CEp6jTyDFP4maWYpLVsLxvfHUCQRZz/2G
	9jVtmWWzMOthAMlbiTMz7biKHg5R8HJPO725Yp8HxKXogIw7r/Rh5a2VYPWTh/nboeBy7C0BH9h
	VCjLi9gxyhP0ZUJhUgyEgYz35y+F7b1XFgmxq6g36DktskybhQH2gsi4r98nxXZOK9CEaZRxoi/
	rFjBu2kIxb8HeNavudiBaPjshJtLptDrC7eK47UReePWHhmtU5CyflX1ZuC4yiRFd34t9W0BNfO
	EUfhqhGN/9FT3tTke8yTDkUdORqL2V3UueDTtiwW/FnM0ZqJgjNLIrsiIGWTzYnquD0Kmfw=
X-Google-Smtp-Source: AGHT+IGz+Q5GGF73nsTcrEA6hA6PV9lyUFIqD+pbjsmX9Oz/pnvq3IzYO9Cy6F+x+KrU3yJohdTA8Q==
X-Received: by 2002:a05:6000:1a87:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39d1475794amr11311063f8f.53.1744041817603;
        Mon, 07 Apr 2025 09:03:37 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b3572sm137701205e9.39.2025.04.07.09.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:03:33 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: watchdog: Add NXP Software Watchdog Timer
Date: Mon,  7 Apr 2025 18:03:16 +0200
Message-ID: <20250407160318.936142-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407160318.936142-1-daniel.lezcano@linaro.org>
References: <20250407160318.936142-1-daniel.lezcano@linaro.org>
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
 .../bindings/watchdog/nxp,s32g2-swt.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
new file mode 100644
index 000000000000..48ba9e9979ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
@@ -0,0 +1,56 @@
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
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+    minItems: 1
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
+        clocks = <&clks 0x3a>, <&clks 0x3b>;
+        clock-names = "counter", "module";
+        timeout-sec = <10>;
+    };
-- 
2.43.0

