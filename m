Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D797FBAC;
	Thu, 10 Apr 2025 00:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246659; cv=none; b=HmWDhWkvOEMmgMhKhI6+EUx1w0K/OhD5O5miATe2Sp9x6cWmcuzbfCDgetZq7DV8jbBcZ35jI4lcg1hx1+3bas5weXFAfNPHn7xrSSWhkXETqdFbB78iiEnZEfe1QXqk1BUjn9sCTvthzseQdnTwNjQ9alOIahVexyL5ULcoQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246659; c=relaxed/simple;
	bh=2g4xJzTbmNKk/9he4TLcxLALW+5TEBNVHWT2L3DnLKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5wQYohQpA1gpr1o6RQVBH7MBYgC+dxYOt8I2ITqsh6h4adb+vacGnbhX6KtSvPTGr9F7px3LNyJMREHZPv4gq8roi+1auxjPZrV4ridaSq3HKkzVgO2p4uPRvnBj3/sg488U80dKpQD0sSFfeMBUAM1wCLUsqK78AOxjG4RLE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=DMw+M0kd; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="DMw+M0kd"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1744246647;
	bh=DYRoX2r8ApqVFeQ1OMHbCiSpFUsUi/HMCrGR9u7M3eA=; l=1768;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DMw+M0kd8SyoTNwWkCepujmwkT435Bsd1vXaYevPzQJQM/LDaog6Q4cd7XZzot1kz
	 Y0tICJ9XIH9SHM8pEhPhotPzQIAHYyCkrGjd70FmkQNsXfYTnkZ7JL8yOJogMHRWV/
	 iQa2PRhqULj/epvGqsEL3vmOBTMhsT1qNKyw2wF5rx/2X8Qzp0RJftYojwJpl7YFVt
	 fWDHRObE4Of9jQecX1ZMq5hHQma2WOljrrnAUaf8ZpcfsXZZbJ+RPkStA0pnb8m715
	 Lr+EmDJk57zGUbXYdyNPllms2cz+Ki3t1dIO3rZzr3yqz93hnKHkK2oZwF4dmgXYrh
	 kfAPRxZ74o1nQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2132252:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 10 Apr 2025 08:56:57 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Apr
 2025 08:56:57 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Thu, 10 Apr 2025 08:56:57 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>, Otto lin
	<otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] ASoC: dt-bindings: Add bindings for Richtek rt9123p
Date: Thu, 10 Apr 2025 08:58:12 +0800
Message-ID: <0c80e1c6165fee5e9884d541167eee0a7f676c06.1744245663.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1744245663.git.cy_huang@richtek.com>
References: <cover.1744245663.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Document the ASoC Richtek rt9123p.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
v2
- Modify the property name from 'enable-delay' to 'enable-delay-ms' to make the
  time unit more specific
---
 .../bindings/sound/richtek,rt9123p.yaml       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml

diff --git a/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml b/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
new file mode 100644
index 000000000000..693511dfdda4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/richtek,rt9123p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT9123P Audio Amplifier
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description:
+  RT9123P is a RT9123 variant which does not support I2C control.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - richtek,rt9123p
+
+  '#sound-dai-cells':
+    const: 0
+
+  enable-gpios:
+    maxItems: 1
+
+  enable-delay-ms:
+    description:
+      Delay time for 'ENABLE' pin changes intended to make I2S clocks ready to
+      prevent speaker pop noise. The unit is in millisecond.
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    amplifier {
+        compatible = "richtek,rt9123p";
+        enable-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
+        #sound-dai-cells = <0>;
+    };
-- 
2.34.1

