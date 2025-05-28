Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD4320A5F2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464321; cv=none; b=fGiefpx6N+DOCLnez6kVHJHEPiktIRrWMeW+0O5rJhB9LqmbplUato5xuxXYhmXCQJZ7dARn9dAJ0CX76o/BOu8FZrYYjwAkvficyjobXXWHt6PJ/Isx2Y5LNepTW4hpqhKg75rXBVcb5mZW/gYiTmyiFOuflh4oCfIEQCt49T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464321; c=relaxed/simple;
	bh=BrBbR5CbQI4aYUBRypucmSqCUVq5TrcbJLGOVPXbW0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jtt9GpsGZNZ8+Zoc92bF/ZQCIlgxSPle+wEF12UyFzgLFGC8LX6AMOCkCzlP6kuZGUHr8z+AFa7QKgj/bnQ6RxwkjEDf8noeZpIjSxKziB+lTYaXxD+rFAglGwDydc9jX5i/hRfdecfS5yx4RlYT/wUavGz1Ui/9XWOu/sBP5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=H/pj6v40; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="H/pj6v40"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a37a243388so153253f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748464317; x=1749069117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSWXgr0Rc+W5KMUBLUdxw5Riulc06AxCHfqoKhxLOoQ=;
        b=H/pj6v40epSxPzsz5NOLTEW4bEevGT4CPwr8NtlX9ehbR5H/6Tj4P8D8mkVOsOaL0Q
         W0TvAf60MD5WKVjfx9y2t3uQ1XP0Hl7rpNyrK0VqVHWF+H8XRS/1jL2eG4ePBTESzMdu
         ojveZz2CbqP7rf95JslNfNh1M2o6NHXJEZOzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464317; x=1749069117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSWXgr0Rc+W5KMUBLUdxw5Riulc06AxCHfqoKhxLOoQ=;
        b=Z8dWVM8BCrdCW5Rw5VPFP24UsnWuJuBkO0cmHRCQ2F5iRYQadeQRARoA6MV1nFD32y
         u4EGxYYLxmTgZQhvPfSKC1dPFQq6om7RwK9R6XS/01TdvlEcjj3WwWEuWn65z6SNMfGO
         kUmpiPqE6fU0C03uYFXvV0eNwYIw5f1mRg9bd5ZedfPfQpKsDPCdjSwRqWnLGjAZ2X5w
         fApsttUIxnpSJ9MnlyyYQH4MuiXj5tlwz0oFYZWybjl8wh9Ej7JKp4y3461IrvrpYci3
         5bHrjAAgMAAqyS38M8EL4H30nwzMcjcih5WOxY8t37XQ3ngW2PPnyUy3WcELOoKRyfB1
         EMLg==
X-Forwarded-Encrypted: i=1; AJvYcCXBdze8Rf+/x82wbT7wSx/uhLCgl6PzOXwsnxfYZRl78JJmxI7bAn2XefkuXjMDA5EqdUCsiLqlvRCpOMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSRwJD8IsBDBxA/9Lx9v9jFvkRWcdS8anB7b30toNgMe69cF//
	p5+cjI6fWAVs/I5jvRk/WKKaD0Uiv1LYhlzfIeiKS0WM2HFZ/t099xT/WXYDDC6TVSc=
X-Gm-Gg: ASbGncvAeZCml1rjmy/F3syEQYfzh418Z7tozsIqZ6WvN5Yz/PJRIlJ3+2hw2hHDShO
	BOg2i4u2zPe6YXpaG3B/WUI9DlwLx2iBhrYr96UNX26+Dshz0hdWxdw7fJFjhx2DabqJyLIyZjk
	/BZOCjPjHvcafx1Lkiscqmkzaerucre1e9nJEtmKl1nsDTQKJWuCvcBbVjQq4u5laAqj8ZTTVy4
	1u1187JEq+DGnAFfVeQkXOePn7g1TNyr6CoqOVUJnzU++TItixuCz7921gVxgyzwm2qV5uG54Ly
	Cvef3boz5ravQTO+KSis0Hi/5TOFIBV0E1aH855w4rlDgvtdq+y4VTLGQHlfGUk=
X-Google-Smtp-Source: AGHT+IFQ2szQOUKTYzQfDg5v2dEo7jM5cHq832S17GBiq2kI8tiPg0A1o7C6s+Meugy/KOsjoVv/2w==
X-Received: by 2002:a05:6000:2087:b0:3a4:e706:5328 with SMTP id ffacd0b85a97d-3a4e70655cbmr4586644f8f.48.1748464317574;
        Wed, 28 May 2025 13:31:57 -0700 (PDT)
Received: from heaven.lan ([2001:861:3080:b0f0:6448:db2c:bea7:b817])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eacd8f0bsm2391181f8f.75.2025.05.28.13.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:31:57 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>,
	Woojung Huh <Woojung.Huh@microchip.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: dsa: microchip: add bit-banged SMI example
Date: Wed, 28 May 2025 22:31:51 +0200
Message-ID: <20250528203152.628818-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KSZ8863 can be configured using I2C, SPI or Microchip SMI. The latter is
similar to MDIO, but uses a different protocol. If the hardware doesn't
support this, SMI bit banging can help. This commit adds an device tree
example that uses the CONFIG_MDIO_GPIO driver for SMI bit banging.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 .../bindings/net/dsa/microchip,ksz.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
index 62ca63e8a26f..6cab0100065b 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
@@ -242,3 +242,60 @@ examples:
         };
     };
 ...
+  # KSZ8863 with bit-banged SMI
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    // Ethernet switch connected via SMI to the host, CPU port wired to eth0:
+    ethernet0 {
+        phy-mode = "rmii";
+
+        fixed-link {
+            speed = <100>;
+            full-duplex;
+            pause;
+        };
+    };
+
+    mdio: mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "microchip,mdio-smi0";
+        gpios = <&gpioc 1 GPIO_ACTIVE_HIGH>,
+            <&gpioa 2 GPIO_ACTIVE_HIGH>;
+        status = "okay";
+
+        switch@0 {
+            compatible = "microchip,ksz8863";
+            reg = <0>;
+            reset-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
+            status = "okay";
+
+            ethernet-ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                lan1: port@0 {
+                    reg = <0>;
+                    label = "lan1";
+                    phy-mode = "internal";
+                };
+                lan2: port@1 {
+                    reg = <1>;
+                    label = "lan2";
+                    phy-mode = "internal";
+                };
+                port@2 {
+                    reg = <2>;
+                    label = "cpu";
+                    ethernet = <&ethernet0>;
+                    phy-mode = "rmii";
+                    microchip,rmii-clk-internal;
+
+                    fixed-link {
+                        speed = <100>;
+                        full-duplex;
+                    };
+                };
+            };
+        };
+   };
-- 
2.49.0

