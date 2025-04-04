Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADA41F3D45;
	Fri,  4 Apr 2025 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776831; cv=none; b=UE3pkGFg3IDcRSHL4R3/o2sOWP17raDxi8US5umFBJRSD7x9D+mEYqF0OxNxH6ToFvzzeJ71lLUVuoGlJYAQSjxjgWy5N9IuEMAgbAe2GZQt3tvvWKA7335jxzGdjSrN0+7wKtREQ4XUHH3sFCvN3ycDBH9oqwQo6VY3kd+pG8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776831; c=relaxed/simple;
	bh=1v2fNj+ZRCH03wb1jR5/4jjouhgvW/iVVXH/Yp1f5e8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zkg4Ik/KlTNQPBJ6Pl0672+sYeMgpG4hMdm9jPhk6VYSoURFKm0qOwtrDrSxDkrfhhWdXyj/STpPyXF7wYDz58k0azQ/oFiKla1xKwUMf60JK+VOJAQl7cTE4BuuSBBTaL4/1mmSJr7itwfhHOyfAVBJgLy3f5QA+bXvSrm38ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=H3dOP6/X; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=MKH70pwR; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="H3dOP6/X";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="MKH70pwR"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776827;
	bh=yINRnx4qe6G9Tgz3KPBYmrtVIJiw731YNMNOfYkm8ds=; l=1712;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=H3dOP6/X5md4nuTc94DyT7W2XOh6eNsxK5lZNdpL/ru7PksShfGaQFUhkH/oW/zFZ
	 TJ050h1PuZE46KgrbOzWT/SIh6VUweQcsKUL8GpBKXtp4Qf0SrES8pbY8Kze2sqoIO
	 E1694ZCzf33eKhN4tHby+NKov0FcgP6iejgXbOzvatJ0P2AlsrhA6YPRXDX7V56OrQ
	 18VAL5+/7JKw2+fv/XqGhJ/9G/Y0dMkHJ6r8IciKKI9h3ycJABm/QgtFMMSi++jIAH
	 gbZMeLKINQcVhyBdjiEe6P7p0XjVPrJYQS1qwSMxJFbnq1U0bbMReKACoDs7/Xr9Y/
	 1C0+xGq0XZs0A==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128081:0:AUTH_RELAY)
	(envelope-from <prvs=11846F16CF=cy_huang@richtek.com>); Fri, 04 Apr 2025 22:26:58 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776818;
	bh=yINRnx4qe6G9Tgz3KPBYmrtVIJiw731YNMNOfYkm8ds=; l=1712;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MKH70pwRRD3fB5kxmWXIhVM1OldeI0VFH7Pn++gTz7umddg7cvKXq+CzOyBc9OrDH
	 60R+UrErhTHNNsKba//U8Ul+MXwDclHTzqqeP/KBdLF+hCtCeBd3aR/fNd8Bu1ikhO
	 Z4XT/2o5WCAj5awVahpNsSvR8xZv9OxYuB5ep8qPxxJSB2auUHcdGLTgNEnlSyf9Em
	 EGXnrWCJPi5JIUbFsGPp727DSmK0bbLl0qgUMOgAbVppHr2D0iMNWbVNKyZ+y2wySo
	 v2Ygx6RfIEdb+wzIZ2WkrCN1ImjlKk+Y3/tkEHQGbvUH10d227RxF2Yh6EyerJkTyW
	 lP/L4t8C/LKoQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1629328:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 04 Apr 2025 22:21:09 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 4 Apr
 2025 22:21:09 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Fri, 4 Apr 2025 22:21:09 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ChiYuan
 Huang <cy_huang@richtek.com>, Otto lin <otto_lin@richtek.com>, Allen Lin
	<allen_lin@richtek.com>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] ASoC: dt-bindings: Add bindings for Richtek rt9123p
Date: Fri, 4 Apr 2025 22:22:13 +0800
Message-ID: <61a77673fabc4f9109b05c19fad4ef1087eccfa5.1743774849.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1743774849.git.cy_huang@richtek.com>
References: <cover.1743774849.git.cy_huang@richtek.com>
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
 .../bindings/sound/richtek,rt9123p.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml

diff --git a/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml b/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
new file mode 100644
index 000000000000..836cd369a68c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
@@ -0,0 +1,50 @@
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
+  enable-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Delay time for 'ENABLE' pin changes intended to make I2S clocks ready to
+      prevent speaker pop noise. The unit is in millisecond.
+    default: 0
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

