Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62A1531E3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883920; cv=none; b=NKeYSrlWk0bW/ynpXvmT+Zx2xW5RS02T5VKYBuabQUqrzTimxccp8cbJHTrDm8IDUFQiPnIdcFvzBvIKUOJ+VwYKB11KehasYQq6SKKDKF2awluBzPAchCluwEqCbEMoevdVGa4+V25Ff5uPgI7YpMpIvDDH8gNKyLPw24RbKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883920; c=relaxed/simple;
	bh=EVmWrbes+DrEvV763dUtaIkINBe+NAnCg0Oomi3YIH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kiO/GxrliIxCNVKMnce48rSZh610OTaMdad+dkGUoGq4f1HjPRWR1ZSVZcG2KGCXKUeLGr7BwVkxJGmOExjEi0o7Rs7FONM8EVz8vaYii2GqdZjc7bdG7WioR764gu8cf8IIY9IKddL6KgTZEC1UJHZXCYTt+1HfTLUhB/MPM+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=FJW8+aBS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="FJW8+aBS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4508287895dso33144055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748883917; x=1749488717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSmzenDLo0lOAHDwohwCizehWGuiTqHtMMxqt2ZXZoU=;
        b=FJW8+aBSU1ViX3aAlBdDU1g1V82oZVBStctV6LDBTzxorn7QZgtx67KzS3yE0WOvtN
         tXTS03QaEFb4NOib5J/jFHtRnRYxo4kyzjFODH/S5V0JiUWcOH0eiggjLiuZ0G09ze3a
         DMCTMz4EXRKqNVBYqkz8lswqLwum82x3P2zzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748883917; x=1749488717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSmzenDLo0lOAHDwohwCizehWGuiTqHtMMxqt2ZXZoU=;
        b=fdxYQZKobJ9ltbY+HWz9Fot9lXiB6Df6xPHeBSUF6QJ8o0hXvy6UxSdc5TRzr8wokA
         lGy8Qayjh/4tVnL/PFtf1aZoywmK/C0p/hU5QnaIb+pqExnq4BofAMasSX8jFkwzczKM
         6GBTp3nCXuzJfRFI5mqzvWxsNlFdrXj1lKz3MOW3keDVxlus2Q3SxkrTDV/rnQ8+XLAX
         oiUngxos/E+yCrij/aJoEj2hXwoSHYH8ljtArQZZ9D5xXTn15BExdXigdA+FDMjv2v4M
         mRE7cB766LFBTMcENA3WE996fNu9KhdSDDPc7Uy8q/1HmerseXMcL8vTP3k6nC/IMq9K
         2eDw==
X-Forwarded-Encrypted: i=1; AJvYcCV2UEJ09PheCOuJwjH/5ktza1OXlgv5sUuJtDNM8QqC/wJageVQ7FBgUR6VKo8SoLqURUMjf3LpUwpuEB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMf+idQh1ZCEG6+ZGXLEEcjuoD6o27KHQYd76l+DV/G9cN/up
	9b1kLAGrMuV1L8qPofha0B2iABcdTBZ8OSYkCEaGVcBiANAR1fc2uZVApYfurn3ett8=
X-Gm-Gg: ASbGncs9l//dEqFaTOQqsuZQYJFFSMc+KdqH8ANa+I6UFQfdFEUnyWZ8q+dIl9vj+yc
	2HFNMb+TiWJFYHpeLMyw+sKbvtMIzwnRLDTJ2vsuxBomoGgE+Sh3slLBSTmZ3gUBX1OtrbNk0HD
	83joiCRiNaO7WZ9F17hJbGEjn+bBrkxCzKzTLf0Qr2Tefq2r+WhfGKE2JwBps78E9Piip4YFVQR
	VzUmDGggEw9A0RzF9ZblwlVLI/wt8hGIWJo5kY7F9n89dlVbajtBgSJZ2Lfr00qVO83dJM58Ti9
	RaRHDlMBquXpxkLStxjiy9AuGBZsp2tvqfwMSCtkm/752J046Zvhp2jl8h+A1xMU0ffiHw==
X-Google-Smtp-Source: AGHT+IEeIEyfIdg3dwyZenyn+vmwOhfjrZrRF2OqaliD83zxTjDsg4j4B6iszO5xYR2iPbGvRrtfkA==
X-Received: by 2002:a05:600c:1906:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-451e39566cemr2068175e9.5.1748883917210;
        Mon, 02 Jun 2025 10:05:17 -0700 (PDT)
Received: from heaven.lanfs.local ([62.161.254.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8ed27sm135293415e9.2.2025.06.02.10.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 10:05:16 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: net: dsa: microchip: add bit-banged SMI example
Date: Mon,  2 Jun 2025 19:04:57 +0200
Message-ID: <20250602170458.125549-1-corentin.guillevic@smile.fr>
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
Changes in v2:
- Fix dt_binding_check errors

 .../bindings/net/dsa/microchip,ksz.yaml       | 59 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
index 62ca63e8a26f..33a067809ebe 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
@@ -241,4 +241,61 @@ examples:
             };
         };
     };
-...
+
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
+    };
-- 
2.49.0

