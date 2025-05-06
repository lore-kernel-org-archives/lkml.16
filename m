Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4F54279;
	Tue,  6 May 2025 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516760; cv=none; b=fiS13RwXYjfzZb1B/Lzku8JBYdvgvqRatbBtyBFAS+votq3zHfwm65ufCh68t+i5J6K0eM+nkSrzqZJG19LWpUN0QiyM4N8yx4mKP+a5jfNCHBKylet+F7O3Eq89Wu6t7jcUjNg/tOyNJt3R2e7JBKLDPWktDMxKMgK12nqfwLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516760; c=relaxed/simple;
	bh=tSYibCA2U304RVSD+IC6XcToVn685bQxxkzGg+pGRqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKfodQV098E+uNrz6N6zHePECgo1bM+KSTZbOjrNBG5NHp4mZBQ28sArhUjdEPXmpZc7avE2DYaREyuwm4DCX6zs9Lq4xaGKA4YCd3gyHcczFIMbBitNiCEnX3//1UvE8KPQ+WQg8+JemxJfhlkkp6BwlqDpMXmqBZnpStrL9tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdXXv4zS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdXXv4zS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so4915449a12.1;
        Tue, 06 May 2025 00:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746516757; x=1747121557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBtya4jYn2IVgmzlcVAY04Zn94TK/SVoaiCIFxCJfBA=;
        b=EdXXv4zSyMM8JaRXcGxs4p+FaAvd0FFNiwKDliS47ocWIBPvdcUxw0suFup8NsPBjU
         wbRJPizyH1NLN0IPWowFh0QcIQTOXxu47spDMsCk8Mz2C6CCZkMtN2k8iL7EMl+23+DT
         ZGco71CfwB1az1ONEn2dqZMf/pwifNH8K8jG2jV4KvnuH8Ovlq8rGHRfO2dwwBsYzMym
         I5BBXaQldmCDoS7FBxXBWJ895PoWavCk2xnTLSExNNPatQ+Z+eZGNLxwaOYSNyInHDM0
         xg0HHrBTaGtjpKxE8gQE6ZdjIj2JUualdn5qjJ6oJwv2lq5oJAqjMCnEKaXqFvQ2yCst
         kEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746516757; x=1747121557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBtya4jYn2IVgmzlcVAY04Zn94TK/SVoaiCIFxCJfBA=;
        b=n2qltOudP12UOQl2zPpA4CTEnUVgZO60XtiJ/wNXrm2uaCzc/pd68N0X8UvxL/N2rH
         E+qsijHNUKmJP1kDfKSZ8wreGdTeqHQED9IhAZHGhrdaJN/UuzQWJ4vkWONPr9LN6HvO
         JCukVUyuuHRWeBFDWjVI3S+JJE16gysMHWgSAp+3eciOYPV0r2oDuBavJ9p8g0AG46oc
         E4NjhtbUYvHU1owjPV58hnefwNJZaqnVHUOi/7+k5O2L2dhNvX+NOEr26lFn6K9dsLkE
         SxXSGP98774hl3KZEDL7B98jZUR1+O9iB9+U7SQ2b9hP+aOxyG4OMeACDQcX02rYUzZP
         b2pA==
X-Forwarded-Encrypted: i=1; AJvYcCUd8UOOr+SCRrIYIZzsBZ1pEQ4IcpG9ikNRGYWinGvt6cfvtmOvPf7l4qRWZSomPyI0xvVAK0Xbp8xA@vger.kernel.org
X-Gm-Message-State: AOJu0YziSU8JL0LEdxxetbLp3a3Juye2ar27V83t31ttJbW7Cww6Vvi3
	U+PiTtF5PHdMkw2WK13VtUDoEAygCfmwj/6Y8UOBcApsmHGAH+3C
X-Gm-Gg: ASbGnctlnyGM1oJszZ/XOTJ3uLXGkq6/6Wl542xdv+4J91YOtGBd3g3VKoNU79F1tcP
	47uHdkCDTRBb0uns8H6yeKb2DMZ8+MczFhDAtSVky/0uFsNhgHn7YRz0cxVYHNyFx/DjK6W5weW
	hBqqyjWw6upQyCcif0QbxrlnXpHLxIU7kUp0wholhkS1gXuqh46+33RtWDaDXNzFU0Razxx9nzw
	x/DhSuegzUQ5Lxvgd9cRj1DgnYZYu4Ia0Yc8LszINQPbVNuMCCOYdgwG/fPZmfiRTXwz/aqjH59
	hPoYCKLLF4745vTvzpEBJg4pEM3F65qg
X-Google-Smtp-Source: AGHT+IHFPdEpTxbcHry90jd+zjMYuIM0GvFJbPKx0f9bdaoPF5L6IT9tnQ9fWHp7S+jgXbBIYCHLVA==
X-Received: by 2002:a05:6402:84d:b0:5f7:efa2:87b8 with SMTP id 4fb4d7f45d1cf-5fb700a39cbmr1751644a12.18.1746516756419;
        Tue, 06 May 2025 00:32:36 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa778188acsm6937219a12.35.2025.05.06.00.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 00:32:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: extcon: Document Maxim MAX14526 MUIC
Date: Tue,  6 May 2025 10:32:15 +0300
Message-ID: <20250506073216.43059-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506073216.43059-1-clamor95@gmail.com>
References: <20250506073216.43059-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Maxim MAX14526 MicroUSB Integrated Circuit.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/extcon/maxim,max14526.yaml       | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/maxim,max14526.yaml

diff --git a/Documentation/devicetree/bindings/extcon/maxim,max14526.yaml b/Documentation/devicetree/bindings/extcon/maxim,max14526.yaml
new file mode 100644
index 000000000000..7eb5918df1c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/maxim,max14526.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/maxim,max14526.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX14526 MicroUSB Integrated Circuit (MUIC)
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: maxim,max14526
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - connector
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        muic@44 {
+            compatible = "maxim,max14526";
+            reg = <0x44>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <72 IRQ_TYPE_EDGE_FALLING>;
+
+            connector {
+                compatible = "usb-b-connector";
+                label = "micro-USB";
+                type = "micro";
+            };
+
+            port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                muic_to_charger: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&charger_input>;
+                };
+
+                muic_to_usb: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&usb_input>;
+                };
+
+                muic_to_mhl: endpoint@2 {
+                    reg = <2>;
+                    remote-endpoint = <&mhl_input>;
+                };
+            };
+        };
+    };
+...
-- 
2.48.1

