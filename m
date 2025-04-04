Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01FA20328
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731120; cv=none; b=Rp1yuKgnbe4tAUHYqUV39LebuoV7xNa28NLcZtR77/CWDZyFDild12Ij98yiWLKjk3u138U7kJe18uVssIuOnb6mefLefYi+NO/QDKvFH5F1hTTKVEUVeFWCFcZU87/VvfBw+/F6sbxbxUirIg321JJBQlFHyHWEb2GhRFgBYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731120; c=relaxed/simple;
	bh=n3Kn7kAHOLRMaEZFmxJZo2Ms0Jh5Vsq8CS8CKBw7xUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PudcfYW/RgpJ5QuNCxRdgssruBTEJqG+Pgp3aq/b53eobd0I7xEAkecfe+248yhZfYHoHXBMEZAWfSO+BZRjLeZtMSTHa1riefGs4cTNVSf9au3OQsvIBVujRYa0ZxrR8fq06Xok7tsWMi6HsKPdx3B6j+6vWOGFwSjUinPPRq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ko3jfXYV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ko3jfXYV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1235816b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 18:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743731117; x=1744335917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbl06tvWC+FxEdMBUfkTSr6qAT6T9YsYFXQDKwpOtkg=;
        b=ko3jfXYVucHW+RZgKX4c9MJD/Q+obe7r5hoOIwapnyKz363dRKFQBHQCp69y5IjUVH
         xWSVqi5E2sgfDvixNRAGt65dowy9VduCZ1YCQmsYB9wtO1mv8f6JyvkOmoznNPbHt0G6
         oiiE6NroI1UyGpYsEK2RhcKWu98oQOvOf6zS6K7VNSQ32eBhZ9SXyEa7ulqCBhB0LFN2
         sBpKbB3JG/4J4NFk6T+9ijPXw6PhRhJ+6Jb7nDlGlxoLB9LVKv8Soux2F9SBplglU1Af
         VSSF2Hz0c462PGAtCTU8MtvOgprPNvNuEi4jUeHuyHdVjhgNS7b5o+Au+D1DsWgZdP0Q
         HQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731117; x=1744335917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbl06tvWC+FxEdMBUfkTSr6qAT6T9YsYFXQDKwpOtkg=;
        b=RnUhWoeto+ZTzAuYM6OOcZ0boDMny8871u6O0xtwpZM7XLii4AiwwaKjrr2AApzJra
         2LiabZoLTLIfTW2wm59VOog22XqcYGcwCuAjN8GyzMaoTmUoUqgj0k9r3jyVV7m/vzDU
         1rcr2HnSJgwFTkEIJ26Uc1hbgjJzfBYxIXr5lpNqyh7GZsFM6HbosrSGi20WEb68IBhT
         u5wWRdVpcCe8+HENPNtf7keIW59Bq7lyjfwdXk6YZLi0eP4pwrOaLXA47wdYZ458yfUe
         qkM+0xv3vk3f98xztudnJB/EKwPGVZsgt7PXd3D3fp82djwxZE6RSDwn/Mv0T7Q+FY4L
         X8dw==
X-Forwarded-Encrypted: i=1; AJvYcCW7b20MxgUC1HCdDDaMwuRid+EU3ZSW5IpuayeWFO5GX7GgC0so13agkwGq+pQ8H/YSaPgQ5kRuIbR4QZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydEhEaAH3fiKhTWleyl8eysPoicR7ZWVdCHpuNIfNpuQguIFau
	KKReSm1XrjbDanZ4cCj59+knGPAAZZ/Z35dFQtaZO6Bue/ZcQAIXRMkn/Jkg8zY=
X-Gm-Gg: ASbGncub/kx8UKDv/5fJzANkcBi5e5yzlygz9UIJMSYWI1cgsB0gML+YlxpC0hyG9iA
	tDnmePKiDlUPI4Help7h2cVMbnWXjB8BJOrx4EuzZGym/APD8FS8DoikWIBtGZg2HscRPL6BRct
	vzRE/NVES2JRaIjGfoUAHrZTZ4Z2W5jFef1JIAVf5pVVvBog76Y1uA7edrohZHMj5JRzQ/epBTA
	A73TXuYRyYtSrBoZrV/HY5sxqImU1uBp0P3aTwxETRR6++CXW2ZgiXC17DBb42pIeNIwmUxxBS5
	/foKjBxuUCeMoe9kOCusPNjjLxEtwuO1CEGjXfnu0KkY2rJxnjJLqGYY1rZZpoDc3FFibC+XwHR
	hls1Ib7U=
X-Google-Smtp-Source: AGHT+IGB7VVxlcH4mCeKmWqDq8Mj2hEIg+V5vVlAvNYDbmq7B6sl/ThuxlEmXAG7xfEyGBUtBDzzWA==
X-Received: by 2002:a05:6a00:1707:b0:736:4c93:1bdf with SMTP id d2e1a72fcca58-739e4b667b9mr2374369b3a.18.1743731116724;
        Thu, 03 Apr 2025 18:45:16 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3184sm2195304b3a.160.2025.04.03.18.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:45:16 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: ti: Convert to yaml
Date: Thu,  3 Apr 2025 18:44:57 -0700
Message-Id: <20250404014500.2789830-2-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404014500.2789830-1-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Covert TI autoidle clock txt binding to yaml.

AutoIdle clock is not an individual clock; it is always a
derivate of some basic clock like a gate, divider, or fixed-factor.
This binding will be referred in ti,divider-clock.yaml, and
ti,fixed-factor-clock.yaml.

As all clocks don't support the autoidle feature e.g.,
in DRA77xx/AM57xx[1], dpll_abe_x2* and dpll_per_x2 don't have
autoidle, remove required properties from the binding.
Clean up the example to meet the current standards.

Add the creator of the original binding as a maintainer.

[1] https://www.ti.com/lit/ug/spruhz6l/spruhz6l.pdf

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../devicetree/bindings/clock/ti/autoidle.txt | 37 --------------
 .../bindings/clock/ti/ti,autoidle.yaml        | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/autoidle.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/autoidle.txt b/Documentation/devicetree/bindings/clock/ti/autoidle.txt
deleted file mode 100644
index 05645a10a9e3..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/autoidle.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Binding for Texas Instruments autoidle clock.
-
-This binding uses the common clock binding[1]. It assumes a register mapped
-clock which can be put to idle automatically by hardware based on the usage
-and a configuration bit setting. Autoidle clock is never an individual
-clock, it is always a derivative of some basic clock like a gate, divider,
-or fixed-factor.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- reg : offset for the register controlling the autoidle
-- ti,autoidle-shift : bit shift of the autoidle enable bit
-- ti,invert-autoidle-bit : autoidle is enabled by setting the bit to 0
-
-Examples:
-	dpll_core_m4_ck: dpll_core_m4_ck {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll_core_x2_ck>;
-		ti,max-div = <31>;
-		ti,autoidle-shift = <8>;
-		reg = <0x2d38>;
-		ti,index-starts-at-one;
-		ti,invert-autoidle-bit;
-	};
-
-	dpll_usb_clkdcoldo_ck: dpll_usb_clkdcoldo_ck {
-		#clock-cells = <0>;
-		compatible = "ti,fixed-factor-clock";
-		clocks = <&dpll_usb_ck>;
-		ti,clock-div = <1>;
-		ti,autoidle-shift = <8>;
-		reg = <0x01b4>;
-		ti,clock-mult = <1>;
-		ti,invert-autoidle-bit;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml b/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
new file mode 100644
index 000000000000..c995dae65cd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,autoidle.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI autoidle clock
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+  - Sukrut Bellary <sbellary@baylibre.com>
+
+description: |
+  In TI SoC, some of the clocks support autoidle feature.
+  It assumes a register mapped clock which can be put to idle automatically
+  by hardware based on the usage and a configuration bit setting.
+  Autoidle clock is never an individual clock, it is always a derivative
+  of some basic clock like a gate, divider or fixed-factor.
+
+properties:
+  reg:
+    maxItems: 1
+
+  ti,autoidle-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      bit shift of the autoidle enable bit for the clock
+    maximum: 31
+    default: 0
+
+  ti,invert-autoidle-bit:
+    type: boolean
+    description:
+      autoidle is enabled by setting the bit to 0
+
+additionalProperties: true
+
+examples:
+  - |
+    bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clock@1b4 {
+        reg = <0x01b4>;
+        ti,autoidle-shift = <8>;
+        ti,invert-autoidle-bit;
+      };
+    };
-- 
2.34.1

