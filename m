Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237520B7EF;
	Mon,  3 Feb 2025 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602097; cv=none; b=U8tX5D061tbz9Fp9D4WYcYFScByeffyt96gz+74Insn94LnFSQoGbeF3pG/nkWefUYi41Jgs9UGR+mvztw8mG/SJWHW75fukrYWNv3U3m/FpPfNwgv+1EYT7lzh7AIJu9CcQUR6HFYZR3Ri4NSbi635iSg/GgrQcB+t/0cYqTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602097; c=relaxed/simple;
	bh=GjD/LZLYFXKkveRtwJedOaVJm9eVxLgw652JNr6llgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGEemfMjthIx0pDQFXalLwLOKGxHPqrVJaE5PL+ADslEuaWRQ58m/tT5KvQw/GGiOGgonbnBJ7igYjI3C07aXJ/BVY5K+9PAVFZ1yucVOS4OmrwFSN3xpHaIG5gRpDRGs3xg39aQni/QT3urRqTx6C8ETQrq7lyyVO0AWxKOo6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0D4U+Za; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0D4U+Za"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso4034549f8f.0;
        Mon, 03 Feb 2025 09:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738602092; x=1739206892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bif4hUYa0bFbnBBMOVylM+oWc6yHvve+zQn7rU29CiQ=;
        b=g0D4U+ZajZlLzmMMcP2I/c1pGifypyWIAu3K6oHE46T9/+d7luFM6VSABTIorfiGMT
         iN861NfATMa9MrqTGrUPnKBSqwY2ZINLvUTox9/4CHnNZf6/piPwxnkcJO0BVvgy0iU8
         vDZOZDPFMqKgqtbuP4lO9RXHGggTQq57CHCoZxUGk825/S7hc0cK/DkrOb5bmO9my2EC
         jSX98+OE9uBQo0ChZDX58MwdQePIzKwAzakBQgbbhcHzPvAmhs7UpQT7e5tQfeNPna8/
         x5b+Nobx03Kc1RiOHO+6DeQRZSCGkS40LrljshCEz6JDDGmvP4ffCIuGzAA1nAgMix7H
         r6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602092; x=1739206892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bif4hUYa0bFbnBBMOVylM+oWc6yHvve+zQn7rU29CiQ=;
        b=jax0fYKFKXx0LtOQLfHg2DPGCsfxtjROqw1jHecwtn5BACtLuY5g7n7Qx8QoSYy8E0
         K1b92N2aw7g3W/LC4oKi9PXPn5nC+/0IGXhA3mN/QbZhgUH6HRKaT2HJJ87mES1P8Ewk
         vWeOFKCOGXIV1Rlp4yj18bSj30/XrPBHMJ4Qt6qRNFFC/swr0pOkSp3BxOoBV+3P9WQp
         HIBBVmU1ELjPJxb7OTpP9xHeYJHZLAAhGP9VgAp2gHnGkqV6+dGdI82wNYbQ213CXDML
         WChESHN9NLjWv0wYjMytKJZltB0mme1N52T6LGEA7QqXImN/cSp6qyFevufrpTYuidbh
         hARA==
X-Forwarded-Encrypted: i=1; AJvYcCUHTJutJC6QebHRp35Fwq1PLFB5Ln0IMGC3HSsRClMwJgAXVTAJEXYrsn/puAd5QhU5TgXNYrbarsMXV3Pp@vger.kernel.org, AJvYcCWebjQVaMLZsMZ8A0DRDG3AcQwfrSnZPRb5zzPs7bucyjcN9YiBW10lNXN3FRrXSnWjqatGnRgQHbQf@vger.kernel.org, AJvYcCXsMC72Ohp4C1dtsqbduXb1RfU1gp20qEwnskt60qUfBxMLpC0oxwxscJt32HcsAHN9urLqZ/P/ntt7sVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0gblMQPbjwUuvdbQFtPFAx412sgEBBeLGa/R9rEkEpc0DIsE7
	/Myv5mBtGB+w4Lu7KFJWbmtulR0f1BHrzwfnJAPeXz8odkq5qH4flzYesk9C
X-Gm-Gg: ASbGncs0YM5dPX5tpbqF2GaerfANs2MKcLapwOW9cMWgkUcoSoY9nmpgACLQ45fJNwR
	avrBfE6aVUJmBUjfeuliKxciJuEt5KqkPBond5CuI6zRuBt024it7Rj09hpqjHZfg254VFz7t1S
	S+M7joPca1FV4TLPVYzlbhH/7i3eJfExVvGvUfJCCYDTEAmumhN+LuQXJLjruEeXr6tkT0eB7N+
	/ukmUpmmGyQc43zMyt1cz4N5B+o8rJv/dImbkPUthZVv0Fy2EjCOdc2XJm0oQs+VaAvQNWG2bC3
	hgTeEK2Kj5hqpJ09A5Edw8MJvB/z5MM=
X-Google-Smtp-Source: AGHT+IEpmEIxTPHpCSqZdtf60uXS6s4uWbghnnyLXKpPEyxw+pWy6C7vh9pI5b7wDTOq4ycwku8EmQ==
X-Received: by 2002:a5d:588f:0:b0:386:375a:8322 with SMTP id ffacd0b85a97d-38c519506eamr23231762f8f.13.1738602079969;
        Mon, 03 Feb 2025 09:01:19 -0800 (PST)
Received: from CYBER-ABAKUS.kucica ([87.116.134.57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec80esm13468582f8f.10.2025.02.03.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:01:19 -0800 (PST)
From: Nikola Jelic <nikola.jelic83@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: rwalton@cmlmicro.com
Subject: [PATCH 1/2] ASoC: dt-bindings: Add cmx655 codec
Date: Mon,  3 Feb 2025 18:01:16 +0100
Message-ID: <20250203170117.12004-1-nikola.jelic83@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nikola Jelic <nikola.jelic83@gmail.com>
---
 .../bindings/sound/cml,cmx655d.yaml           | 79 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cml,cmx655d.yaml

diff --git a/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml b/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml
new file mode 100644
index 000000000000..ea2cdce80ea3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cml,cmx655d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CML Micro CMX655D codec
+
+maintainers:
+  - Richard Walton <rwalton@cmlmicro.com>
+  - Nikola Jelic <nikola.jelic83@gmail.com>
+
+description: |
+  The CMX655D is an ultra-low power voice codec.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cml,cmx655d
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  reset-gpios:
+    description: GPIO used for codec reset, negative logic
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  pinctrl-names:
+    maxItems: 1
+
+  pinctr-0:
+    maxItems: 1
+
+  cmx655,classd-oc-reset-attempts:
+    description: Maximum number of times to reset CMX655 class-D
+      following a overcurrent event.
+      Default = 5, >10000 = disable limit.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 5
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        status = "okay";
+        codec: cmx655 {
+            reg = <0x54>;
+            #sound-dai-cells = <0>;
+            compatible = "cml,cmx655d";
+            reset-gpios = <&gpio 24 1>;
+            interrupt-parent = <&gpio>;
+            interrupts = <25 0x2>;
+            interrupt-names = "irq";
+            pinctrl-names = "default";
+            pinctrl-0 = <&ev6550DHAT_pins>;
+            cmx655,classd-oc-reset-attempts = <5>;
+        };
+
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..c471a4b905cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -308,6 +308,8 @@ patternProperties:
     description: Carl Cloos Schweisstechnik GmbH.
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
+  "^cml,.*":
+    description: CML Micro, Ltd.
   "^cnm,.*":
     description: Chips&Media, Inc.
   "^cnxt,.*":
-- 
2.47.2

