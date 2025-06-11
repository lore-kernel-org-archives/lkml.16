Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE792367DE;
	Wed, 11 Jun 2025 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629971; cv=none; b=krkuJHbYPZwYeSik/z/Zy7FEl7dAA2FAb+lYw270kfEtaky6E5Heh0dMl+FuwQAWBvjYTbxN0VgtZtq9I0szutF4/dd/NnO6c1u+JIsR+QVRQrAFaWZcP3Wa5qcud1b50D6N5+G/HpgPzup4mc9G1Q7NGIacU63BN15pEviaUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629971; c=relaxed/simple;
	bh=/Pz+BCMnqum9DQrrlTbtUCM1X78hr/mJFmbdv3ay6cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv+9PFR07pFb0mbnBVPn+5oZEJuY7C7pBvVxD2uuowH14o0rWrJTYPQgImciB1m1gYEJZJU4EpHWHiQ1JXPjyXKPdUsto1kMe5PVYB7ZRWMcj5I3ugWTHBFSEem7B/TnJx3ETY3Z40Cx77z6hwj9E0WA2ATW99aiZYRJkNVjTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACY96aJ8; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACY96aJ8"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7cadc92771dso543914685a.1;
        Wed, 11 Jun 2025 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629969; x=1750234769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTihKaJdX7lICF61Unmn/1qC+7hZZfgUEsDAi37Fi1o=;
        b=ACY96aJ8o7NebxWccMIeSciCiR6oy9u1/fs967MhW6VTh+9XIx7zjDWj6lYywU2lDH
         evlXd+CWq0FWMkjuFLfZVC71nXevnHWe1MvGLSpG3UrbHqNlYJBIKdduyAJcSgxxP4Qq
         hReDlz4N6KIPPL/JNacdaAzxObAQZ2uBRPSV4p/W5lTMyU2wTFKbmVS+Jx30vdNuoyYB
         Zhrgaf0p9JvprQ7Mu07joFWyCrO97RIpO6hXw/M83dMt23dJLe6c0p0QPRtFeCv+m+Jj
         8Dx7O2CPJLzyFp3y0UclBvwLSA8k1Dvfs1PReHww30MQHifm3PPJnJDJiXkLu45zG6yL
         OX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629969; x=1750234769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTihKaJdX7lICF61Unmn/1qC+7hZZfgUEsDAi37Fi1o=;
        b=EPpyJxhfl4NnKmhsU+LRDrsIoCNapYMlLbHkVEGB6Zwxtlgq1P2DyVyAyiqSmiYuWz
         YzJKnB97PTGzEIJLRgDmOIUe635iScW0b+uxAaJJ9tyaB0Zm/fuYdDv0AvAX1skX3rcR
         tcx2Wjpjr50+cMFUIvsCu517B1DGsgW/Rwiam45xDPT8zXhR2hIZ8RVE6rzTL8AaDuV7
         DS9N1aKfHnxNw49dI82ycUWjKUVsDeFw4nIGZ5BmerlFg91DxsIATqT1iwd9seCSmqDW
         x/rEfJvhigmTIvan4zjK3gQDgnJ0Fj0gihEvBTs34GbiqZEKWutWBqQhO8rMBINF793A
         gA8g==
X-Forwarded-Encrypted: i=1; AJvYcCV2GCrIde+bKLIS1WBOZbCh/wMDf4Gwmy2XHKeAeKae+AcUBmk3NWeDWVJlztYNiq4Ej5DhgrZk2js8giq7@vger.kernel.org, AJvYcCWegBRVgT4iLShRb67LkIh/5Qxo+joMDkMD7F8fLQeKOS+kME7qOTMc35AuxQr6GQONE5nIr+tZQC6A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6H88fKdpIpmRTrjsfmwBJVCefEmwJ06eJ+Y4/kZ7Kfo5UgWvT
	W76tPbpAgG94S5PAW4TRQ/U7KdJlE4sZkEaoSHNgUP3ivbeNZQ5gnTJd
X-Gm-Gg: ASbGncsS88ozl5ANyQKqsyL1oPhLCond3n2+DeuQdYMDuRko73k5vv0Y700JNcN0Iv6
	RL//mUJD/mxHiCTVpk7PRZeKztytiSrNQ1tYLCVEyoEYo6iJXg66V5VbC9+xF9wDcaV1wUltg5I
	jjA1gMmDFQ9R4tAYF9REXwmUvAFScFEOwuWn+BzFMba0kheYbt+GzwiU8YWD67Wy6cwEbWhZqNj
	WiOphV/FRrW5rVe9x+yr7fvGCzqJZeF78GjQp+Agi9DdRT6GRoD53qqjjLFO7SRyJPcmO2OpvWs
	jSgkqV0pFzFtfroES6px1d4zyEbxHcjKLomBD4OY1THxQIn7
X-Google-Smtp-Source: AGHT+IE2k0Y0Y3XpkqJoreGwvkWiu0A5c1I9LUjGwUIsU+Yx8pfb5KDzmXaWEDQQc73dwOMzOri2PA==
X-Received: by 2002:a05:620a:298c:b0:7ce:e010:88b9 with SMTP id af79cd13be357-7d3a8820ef4mr372285385a.13.1749629968697;
        Wed, 11 Jun 2025 01:19:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac84cbsm79224076d6.32.2025.06.11.01.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Date: Wed, 11 Jun 2025 16:18:02 +0800
Message-ID: <20250611081804.1196397-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081804.1196397-1-inochiama@gmail.com>
References: <20250611081804.1196397-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
"VBUS_DET" to get the right operation mode. If this pin is not
connected, it only supports setting the mode manually.

Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
new file mode 100644
index 000000000000..2ff8f85d0282
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X USB 2.0 PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY app clock
+      - description: PHY stb clock
+      - description: PHY lpm clock
+
+  clock-names:
+    items:
+      - const: app
+      - const: stb
+      - const: lpm
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@48 {
+      compatible = "sophgo,cv1800b-usb2-phy";
+      reg = <0x48 0x4>;
+      #phy-cells = <0>;
+      clocks = <&clk 93>, <&clk 94>, <&clk 95>;
+      clock-names = "app", "stb", "lpm";
+      resets = <&rst 58>;
+    };
-- 
2.49.0

