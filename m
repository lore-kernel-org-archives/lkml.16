Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731582F2A;
	Fri,  6 Jun 2025 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237765; cv=none; b=hqs+v808Lw8g9y63d0iQOH8roalpKBRNRhr3hRGKY1lGsqwAXmyzpRdUnnOf63+9MgSKlZh/h/fPmzVx+64B55yZRqbHi3ZFTMg44qDmWcGo4a6wbkhTa7v2AOUP2K2wgnt9AnarHNovH9BRVVAwzHr88xYff0GvDu1X2l5C08k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237765; c=relaxed/simple;
	bh=pk5sqaWyVOCeg9A0A6ORoy7cPCv3D8IxSHFZUu84Hjk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7a+YmSifO1R9mwrRQsMQ2tFcLq7rOz+zVvSHEmBaznxAhOuvWYHpMfKuzueX/Aml2ygdhwotoO9RethCa6kKwyATsjRfKGIqVtfehTDgDrjZ0Ac+Ct6oXNyJ+PHqi6+dsMbJ9tidsM0j1haLAAcuO5DQBAVi7KuTrCwH97D9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMYxN5lG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMYxN5lG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441ab63a415so24575605e9.3;
        Fri, 06 Jun 2025 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237761; x=1749842561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GEf6kEPNtA5FLbGic7DPjqE9UvrGi4qpC5CByFjtls=;
        b=LMYxN5lGwIoCse+hFpQWt89RSICNalr7vk3mGdfdXl/SHJsBwYA2PgtKi1W556WPAN
         5my5LyTLjuZJ1L5crUAO/rty7AplnqfFkYlG6hsoeuqqnXpdQ2zVLoBC91EfMle80kI7
         4NnlRp7PP7yrWUQRZRv3VhMtjJyH5OkWAGcReB+UjRr2ymeA7jLaVwDYIYPlSmG6ffwv
         uqOmGpOa8bZm1TZD4F6D+1lmxRvwA0U0yml3Uobv8jKWmcgVVjSnh9sjIN+/Kx0mgPqu
         0VDhRqv4Z4IHtG4q4L5ay5458rcnwBVnooPJVO53l7bWpj/VT6/TVAnoTwNeGUXAP+YH
         /NYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237761; x=1749842561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GEf6kEPNtA5FLbGic7DPjqE9UvrGi4qpC5CByFjtls=;
        b=TXaOxvx3aSK8zx6pe8v/BlVnzu4Ddp6Frpuo19u61pfFFoICUs3Bezfc/jo7PG3lbu
         CCtFcF7YgMHAHoCsBLxABNpfkbXuR/T7D3vrv/g5GX91xrs5GrAZE88kHhpwGjeI1Gsy
         kZ7lj08sREeXvFgVBG8Wuq7CBibZxOVCERlPzofoCRWcm0Z0DJUKTIodfNHc3xpia+9D
         84QJmV83KUyp5GmdHjQsqQ0m6PWZ/44fwQ77iLVeYbQPOzwal4mNXH2LYqqJVew5mO6P
         +llvirnoHa/zjUsx/XeV4qoN0Bdmf+lKtCEBqDlqveFzdWDlzXtIMcUlsebIRSv9KwaX
         OZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2VdIbdhh2Ewhpr6jwA0Yy+d+uNxLB38n3a8YC5+8msEV9/zgiXV3S54i10sLib/7xwWzGxtNuXByL@vger.kernel.org, AJvYcCX8DpHcpk/ELXgaGITQ6Q7GtLkExvwHDDyjDbpJiwde20YFsaUR5UhYM/4CpQQhZ4w+zEqvHkdFsfO8nPKQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0ImBwI9LI9W0mz670BIQtl+/2zrbmZ+8at+opdMhLLVEy056
	WjmWcjvk93T0PFhPmrdFERUxzHiv5nYt4/mQf6XN5xStI6t+5rbtZLUs
X-Gm-Gg: ASbGnctzmUep8C8eKAZmWuczFihtoeLL6A5a99Oa6PgrfcYKEdMxajuLq8cIembq6xp
	q+oig/Tebqb9jduNo3bpGI8TIZF3eM/LnkDo6PQwk0wRJ2cMXjcwGoI3uamhfe+zskJwyoNgMeD
	lceWxGt3Z/Wy9kL/WdJ3fCSlWwTOlXiza8WHZHkd/OishKXldVBtEEUzatCxdYRUYI47eNOkLtG
	wrZKTIoEwq7StAz5AkSmxcjOtN4RXSZt9D5L7K1Bp0WGxOAII+ghPrAjtHPVQoT307zzaDVVjJd
	4DmWQqnEEdW9zBff5/+EvtHFua+qOfQl7peJTuKhT6C37gT4Ok2nmoYu7xF3mXrDTSMJunVU6pg
	8d7wkJuAUsBTEENjs/eBa
X-Google-Smtp-Source: AGHT+IEC3Sjc2VlYygLATA0RuWgVQsarnnCoqzFIWxR4i0/tT0CzSrNBQ0SYjbZbfbyjlO6aHoDzMg==
X-Received: by 2002:a05:600c:8b72:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-452013683b6mr51761175e9.3.1749237761483;
        Fri, 06 Jun 2025 12:22:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: phy: airoha: Document support for AN7583 PCIe PHY
Date: Fri,  6 Jun 2025 21:22:04 +0200
Message-ID: <20250606192208.26465-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192208.26465-1-ansuelsmth@gmail.com>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the rwquired register to configure the PCIe PHY and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
new file mode 100644
index 000000000000..93252092c2e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE QPhy analog base address
+      - description: PCIE QPhy PMA base address
+      - description: PCIE QPhy diagnostic base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: qp-ana
+      - const: qp-pma
+      - const: qp-dig
+      - const: xr-dtime
+      - const: rx-aeq
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@11e80000 {
+            compatible = "airoha,an7583-pcie-phy";
+            #phy-cells = <0>;
+            reg = <0x0 0x1fc7f000 0x0 0xfff>,
+                  <0x0 0x1fc7e000 0x0 0xfff>,
+                  <0x0 0x1fa5f000 0x0 0xff>,
+                  <0x0 0x1fa5e000 0x0 0x8ff>,
+                  <0x0 0x1fa5a000 0x0 0x3ff>,
+                  <0x0 0x1fc30044 0x0 0x4>,
+                  <0x0 0x1fc35030 0x0 0x4>;
+            reg-names = "g3-ana", "g3-pma",
+                        "qp-ana", "qp-pma", "qp-dig",
+                        "xr-dtime", "rx-aeq";
+        };
+    };
-- 
2.48.1

