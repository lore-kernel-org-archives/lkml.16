Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC523BCE3;
	Wed, 11 Jun 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630368; cv=none; b=PDXg0r2fN9ygtDcpqj9JFchzR9O77slUXGG0Rhl5VENn1XLSUsx7hQgbVIUzWXEWaL4S63N68YynXEZ/CilKr+mEFrY00y82Og2cPDebYqVwVGPD0R1EWAaiRUODm2Uo2Bs+NDn4JTvCgY8McTtWw7BLZAFzMZxONwfhTC5cKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630368; c=relaxed/simple;
	bh=petEES/Z+au0Ki6jNUYdO7rS7mfcTqHdfaHqLrnu2xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNVTzrW4h+0jBLHF8XVQumF34U6TfLqyN18gi8X2wu2L0GgY7DljLTY64uOrcENqKq+Y4T2KtoSJL8oDIJ6M3ydkjgCV3bF9Yf54nzYmy+YD0yIf+/jGPVLy2t2FkLk6V1J8R3heXDYikcSBNUkPxKaA1/GiO8YgfzdpLPhT0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1Mmclx5; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1Mmclx5"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d0a47f6692so638134585a.1;
        Wed, 11 Jun 2025 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630366; x=1750235166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgBBlgf2A0kFvnU+OMHuSn1vM73oxJmf1nlExlQ6RqI=;
        b=d1Mmclx5wPB3xWYSeG5b9EGFQWJ7p/2G/UKqg9z8Rk8kGj70kGn54fDSd6+GsJSZbz
         BWLviBs5pC4xa8TXaXPO/P7JctPuI0/D22k3FQIl/OcocbTEt06aR/Zb3kvB0rQJ8N+r
         ZfRBM/kWqbbqRoKd7WXwhwvj23VecyJOxB11GnmGB/MhsRPpWibSmjXJotEVnfh9eL9v
         eI9WzeJZ5sTX4LQNKqF4MSHyKBzNTpGUZXkBxQ/ZrVwsV348VUJTH0QouoynyWG8C6i/
         oW2wLthlCdxca7gYICePOH8gKYMdAfLcQ1MQNvUoG9RGaNSJfDFTYK/on149hvFMtuMF
         WSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630366; x=1750235166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgBBlgf2A0kFvnU+OMHuSn1vM73oxJmf1nlExlQ6RqI=;
        b=Diww0Pt5Q4bWcsjEYPKxpQCR1DeQco8v+2AlxPF2+kHLuxR3QGuAx5bgGmeM4gaXdj
         CyFnL+FKjukrPhmR5m/dt1e7JEWu1i3ejM4PTS02iWHzGWcz776N53AMhTBPKlV7V9Qd
         oCy0Sh0NzIhIO33gzAJGVxFtrtAbfrg64izIvOufV644IlPvdK3dpbjKr0fJhx/93Uek
         w/GvDu2SY6OSiiIGNOUWlT8V9Gc9lz9DTLZ8vgrqND5NXcwIkalArPBSeVGaqRXUovk4
         NVBScCmht4z8gfIJYi8kAl+OSFqQKDdAXa6kuaNqyOvYegUIkvNiX9/3K3sBsNQj1Rps
         S6nw==
X-Forwarded-Encrypted: i=1; AJvYcCVGrsyFYb89yU+zslwd7zwL57yIqU63wCCrH30WBwOjj3w1JUqhYl7YXW1ZiIX4UaMuG/Dp6sQT7TGPoWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXuSCrcLqoflepdgKMTAaBphjtp+49GthaRJQzgVYzBdI2p/A
	ulXgv1mewDZbmHbiC5bMBMObLHHkKafTLs09DrYrJ6buL0UZKZho982F
X-Gm-Gg: ASbGncskMtsWS/bMTpyewwAebYAPEnF142PopApwu92UzUxlYLsFS3NAKA1x6gRpRdf
	Prsdn4kku9/fZZ2vKnXu7sizzxXBuFUBFCBfd2SQu3/Ckl75s1WngM9FlzSY34M7h9K1qxkWd+X
	fcr/vK/IIgUVOH9iwm0dCMvj4EXUfHQEvs+R6Tq2zzUb78spMGr7SwIWArVGt8kGznkPjyKPwyd
	tW8z7c8Miy/EcQKl+SLGr4WOMbof/bQpUcVfSnTF8/VKQXLaCCoSzU5ZBnuijWE3f2zGhlzJ+jK
	7kpqr3xJUzzlSTitI70/JsQpo6sjaw015Zbv6A==
X-Google-Smtp-Source: AGHT+IG7wxcIgsJM1bVKh08YV2G5x6CsGODd+WUWOe41/FWpBrES04p7hjkIFnpAjS6EYVZdpYt5CQ==
X-Received: by 2002:a05:620a:4014:b0:7d3:8a6b:d24d with SMTP id af79cd13be357-7d3a883473dmr332522985a.24.1749630365571;
        Wed, 11 Jun 2025 01:26:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a5948f8sm838959685a.49.2025.06.11.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Wed, 11 Jun 2025 16:24:49 +0800
Message-ID: <20250611082452.1218817-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sophgo CV1800/SG2000 SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..e8093a558c4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV18XX/SG200X SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,cv1800b-top-syscon
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "dma-router@[0-9a-f]+$":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+
+  "phy@[0-9a-f]+$":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@3000000 {
+      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+    };
+
+...
-- 
2.49.0

