Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D026981E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388203; cv=none; b=NIDYsXci2CRb9wRC4QglwEShN99JCgdENLqtEAq83c810DFa7a3pdTrRF1FZbBBW7Ltf4CJb3lsjCYH6FRxJirvaZvFYjVGzwWst/WNmX/803wBxcwBmT5mey/T0JCPyyfVCLcF47wLg3Tj/MmT7TAlPBnpEoCW0vJMxgBUOjmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388203; c=relaxed/simple;
	bh=hkq6fHmdJC3Lk8cO5+DRsRwOVcxTWLet80Z76mwc3rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+I2GWTsd5DgosgYZfeRRY8kFcRbbpgro2SlvO505TnbkR20bSKnokh4N3uTH3zFiLnOuAeL30c+qCmvetdmTX3h50qXQe6PaqU3nJX4MrPKXl9k3c6n3iAqqxSdbYhHmtU+bpbaru6VDwlL4ZBD3RzPenuD3mWfCFgQm5p2VXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=P625Zp0j; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="P625Zp0j"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2c663a3daso980250466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388199; x=1745992999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=P625Zp0jczns1ZSi5WPIf6dbVXWksPnRToz2OsyR0jp2DCgEjhqmOSh4KAVW73Htnm
         qfC1rp4xGtRVtQm5unCo8twqHEtuujeTisSLD+wivAzRJz60Nb2HBpvRSd3q8cz0tQgF
         qGi6NkZ1QmKcLGpt9GHoKane8l/hyKhN1/Lew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388199; x=1745992999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=KKzuBfO7/eekIPU0hVhNbKmWhIo1/KOedxLdgwXDAw8IRiBYvSITwvo3Umyq6epi4P
         XajW3LgzCK3n0DDS3BitLW17ItP/z8SJZoqQodrmW9yj6QTiBXaShzBWCiC3SBXnp8Zg
         uk/7l7XwN+6Efam6IXzIry6q8LPa5j6hFVyYOOFe53Pfsfm+t/2EiRNlW9vKyDr3+nzC
         jEZ2hhDU5vyYC6cb2j6ckMDB47X6vqEsmotGP5x/hGi65FevVlSa6OUNQbUkIsWPgyOq
         Hkb387mrEYZXVD6G4x7blgwIhiVCqTJXtg1y66CKjfb1/Wp2xaZqKvK4JqpuuefQjZG+
         5qzQ==
X-Gm-Message-State: AOJu0YwqoVj6o6xE22AeaTfN7tWmtCt6/tLO2HYnEIULmKhbEvZF24Gf
	Ye7hxQdOBn2iXmwwc1afBkTrtGiVrMz9P+knTfMzWqdXwZmp5y9Q9Qy57lEXhwYIS49Vhv2AZgk
	V
X-Gm-Gg: ASbGncsXAUj2kY8g7gJ9VRcd3KSe+30uyqa0hj1Acw8W22M/01akfKu3RUxGOEf2iTS
	MNtxJVRl+Z6xQDscvoKT/VxFfv1B7DqeTKQPZGxbC0gq+/WWvw3Fy5vdDIjPfrdEOnAmsrUBHZ8
	w0SKz+YYImQtidHgYS1ponTJRHsw8v9HcRI0aOSHtyUivcy/wrdTdWxN9rWRgXaEEWoi2vfO6Ou
	IEKCmABWSxeSb39aAWG3lNMJiLKxWQ4R1+JBLuU/QNWat3nBmbUa/xel0USHWWjEHB7o8gkDpB/
	ShXG+K+A3YFOYvbK6t5UI8dN0i/eJcuOpo1YUWXbUuzHdYbLheu1Epkxb2pNN36wxCl8irLp/9i
	sM4RZ
X-Google-Smtp-Source: AGHT+IFXK5t2CjXs/VSaGgLG16geNEJEoOfNTY2wN1N5E9kGgqXmwH2XgsdysdftJFFBu3tzrfnH1g==
X-Received: by 2002:a17:906:c154:b0:aca:a162:8707 with SMTP id a640c23a62f3a-acb74ad9629mr1643817866b.7.1745388199239;
        Tue, 22 Apr 2025 23:03:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 15/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Wed, 23 Apr 2025 08:02:32 +0200
Message-ID: <20250423060241.95521-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v11:
- Fix conflict while rebasing on master

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 4fec55832702..e83f08abd44c 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -93,6 +93,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -102,20 +106,31 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
         fsl,operating-mode = "nominal";
     };
 
-- 
2.43.0

