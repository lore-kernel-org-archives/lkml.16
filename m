Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA5D78F4E;
	Thu, 10 Apr 2025 00:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246658; cv=none; b=HwkiN8ub8Co74wuqt52bupsBTFCOQRJbCpwUUuXrFJ/szqnIv/hCdm+BSWtyiv0HK8TLR7JkwmN0KhtqoLu2cWO/XjLE0CEf8bsNfWbGxDZITyKhDVkzXb5BGB4jincjAEzLms646Pk2AuPJplhADSwNHFL5oyqEuMLEYC2+hNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246658; c=relaxed/simple;
	bh=IZf/xxGcYBAihPyiyMwq84uot911iPHskOgruSFtiJE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7PiNVjWbtOlWD0hqQLfW2MXRXBxcDj0bggCViL1HL4lFtggMP6Xvaf7OI7a/7573egCUXzrpeBZ8GpY0s3PjViN/WGBNAYZUXfHUN/yGpKiEUSdleuG5Ht+jleV0swuQTYsXUW9H6OOedR0r40ck/kQRHDLscAPfdk3QzfzF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=aUBMHp+V; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="aUBMHp+V"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1744246647;
	bh=BXieB1tP6ySclyMCYJn0N7Bd99EORXPRe8SwVTykICw=; l=1778;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=aUBMHp+Vf3gJO+W07Ui5SOz8PwJic0Hr3zBFamLY6dRfInOT+IgLyAuaDxQMyrpo+
	 bdLWfMxt+gtFl+y7pj+JNlY2Gqh7j+/rsIAGvAQxckRWplmZjFiIUqJdL7pG3HmqD8
	 v0Vv2rmcfxc7xpDlXqjzMGIaAh9ImdD6GGCUwq15cybs/dnLcaia9a47MP8U83GttL
	 uvNiJ2REjdBfrNzvabRO2efOo/0rWXfFBMoNDnylnXFZfGFzs/4SAtSDQPpy5SlfhV
	 5RfVn5KsuVgu6xH3cSdbInFrYzyyqsj09lzvHarTJ2o8FOrj1k3Z/inP0p4G9FNcOO
	 haCSJZ5kykTog==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2132240:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 10 Apr 2025 08:56:57 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Apr
 2025 08:56:56 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Thu, 10 Apr 2025 08:56:56 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>, Otto lin
	<otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] ASoC: dt-bindings: Add bindings for Richtek rt9123
Date: Thu, 10 Apr 2025 08:58:10 +0800
Message-ID: <4a0b67438f82e7d8ed9968cc90acf419fc9c22cf.1744245663.git.cy_huang@richtek.com>
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

Document the ASoC Richtek rt9123.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/sound/richtek,rt9123.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123.yaml

diff --git a/Documentation/devicetree/bindings/sound/richtek,rt9123.yaml b/Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
new file mode 100644
index 000000000000..5acb05cdfefd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/richtek,rt9123.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT9123 Audio Amplifier
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description:
+  RT9123 is a 3.2W mono Class-D audio amplifier that features high efficiency
+  and performance with ultra-low quiescent current. The digital audio interface
+  support various formats, including I2S, left-justified, right-justified, and
+  TDM formats.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - richtek,rt9123
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  enable-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@5e {
+            compatible = "richtek,rt9123";
+            reg = <0x5e>;
+            enable-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
+            #sound-dai-cells = <0>;
+        };
+    };
-- 
2.34.1

