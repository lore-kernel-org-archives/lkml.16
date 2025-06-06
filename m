Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D58284670;
	Fri,  6 Jun 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198558; cv=none; b=YeawlX9iDlGLgQiZWS32GzDvSEphXxHRDOL4f1/mRuZhya/544rvwy5/qg0ZjU6hweGBTkgVpvYylIagC84ZEtnI4L2lZkU4nprEeqyMVbSJXAQbaF0JM/3h9RqsbUEa3WOCUfpb6kzMShKx6K51ocd0XHGXbU+/jxhF/7o6WIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198558; c=relaxed/simple;
	bh=aeb8YZ3rkWCgJJFLDmSCoVv9Kx534KYDCzXryvMOT4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3n1DmWW54guCFXxHWPTl7cCrArSbgpwEXjKCSnD+0onGHjLrJpmyjK9BtKm3QmbUGSd/uhTFw/CtcJzDLJYOFi4WBJtUW+bOiblbaRvaWDJEA9BFpmlobf/GHTsu9InSj8vZKiN78gBCFcRJlgA8hZvJX+RXxft8z1ZKPcKm+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=jQQB7Uyv; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=Jnxxs8v5; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="jQQB7Uyv";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="Jnxxs8v5"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1749198552;
	bh=yCxQkChvI+T2FrCwzH5lv0C/Xi+V64Np5dKIOwgxUjU=; l=1879;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jQQB7UyvZShApMjyZ5vSHVsqqfx5gVzu6/j6IKvF+cX7BCbePHfX4cTc+bDCfVBMR
	 xHZVaWTBPzZ9IF7O7VsqcfQOfAuQ3qynyTe8cc0LmFCaEcL/iQBkm1hcq3D1wSEAdl
	 CV52Y+DBajSLJ7GGLvSXfLYJAP4F8EEtGdaeXWqh1l5tXX+K9oUcMQregCPuFFWYxK
	 OPdPEWHR6TtI5t7S/TBwXkNmFTMWYAJrqcOAS8b1BZmOXKODc5uZLs8QoJpho0O//b
	 gR/Ib8kPD8uYQr61deqyzoWDHXF2Uj4ACTOSx9a8h7cmmpSbX9CqzPvao4gewmiwCW
	 moodW8gRTiEAw==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128078:0:AUTH_RELAY)
	(envelope-from <prvs=1247BEB82F=cy_huang@richtek.com>); Fri, 06 Jun 2025 16:29:11 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1749198551;
	bh=yCxQkChvI+T2FrCwzH5lv0C/Xi+V64Np5dKIOwgxUjU=; l=1879;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Jnxxs8v53arqjOKR/e/BSCtFpeDz9z8oL18IEQcesQk8fsdT9PyXTLGv/2peJfvpi
	 5ZWGX60dTQlTqT5NPegDiXbz5L/ggMkhXMqL9hP0ECniDz56NeUMkwBDp0j5zM2+IF
	 hfLExwDQ9L07OVSpSzgQrKXU5YPGUGYlB2fmZTMQAE6vu1angr2+Da6ftSHWB8pNTo
	 h/9BjQ+H+dBPdWY3m92eM3p1b9K6BZ/cZCX94vX62Cr/vCxlaFqmlWrgP4ptODoJAu
	 ZDHaeEgPEJzK6s7sp4WpIMVEzFzFZYzc8NkOUgSOPrkUly51ztqX9GY7/weYt3+sJ1
	 ZIIFR5Ej2cOmQ==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2288486:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 06 Jun 2025 16:24:26 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Jun
 2025 16:24:25 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Fri, 6 Jun 2025 16:24:25 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ChiYuan
 Huang <cy_huang@richtek.com>, Roy Chiu <roy_chiu@richtek.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: Add Richtek RTQ9124
Date: Fri, 6 Jun 2025 16:24:34 +0800
Message-ID: <b95d701e5eb93d011a9e428adede845a309d1f12.1749197773.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1749197773.git.cy_huang@richtek.com>
References: <cover.1749197773.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Document the ASoC Richtek RTQ9124.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/sound/richtek,rtq9124.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rtq9124.yaml

diff --git a/Documentation/devicetree/bindings/sound/richtek,rtq9124.yaml b/Documentation/devicetree/bindings/sound/richtek,rtq9124.yaml
new file mode 100644
index 000000000000..875f0fb226ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/richtek,rtq9124.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/richtek,rtq9124.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RTQ9124 Automotive Audio Amplifier
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description:
+  RTQ9124 is an ultra-low output noise, digital input, mono-channel Class-D
+  power amplifier that supports a 2.1MHz switching frequency. It integrates
+  both DC and AC load diagnostics, as well as real-time load monitoring to
+  assess speaker condition. The device operates from 4.5V to 18V and delivers
+  up to 30W output power.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - richtek,rtq9124
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
+        amplifier@13 {
+            compatible = "richtek,rtq9124";
+            reg = <0x13>;
+            enable-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
+            #sound-dai-cells = <0>;
+        };
+    };
-- 
2.34.1

