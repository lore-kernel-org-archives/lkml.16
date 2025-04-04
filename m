Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC141F3D30;
	Fri,  4 Apr 2025 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776832; cv=none; b=pNhhvqFRhJ25Wy4J1TF5XN0R0qNNis1ZFy3FYpULQD7XphfeVQsUqKHGW759c1HR/ijb9YRC4K/G46HpChFvRWSeAyBm6rnC/E/nGqZm1UVUfzNuv+TErNE6RG4xwAUB2yFcPaauAB2qLc3MXtaQbopbmLEu1DQiAHYp+vrLjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776832; c=relaxed/simple;
	bh=IZf/xxGcYBAihPyiyMwq84uot911iPHskOgruSFtiJE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOtJAXd51THSxO+ZmbW1BnbrK/s4yIUFxLwvHpm6MuTI/YSJeKgXJOKxJYGaBnAY8BZpyD7SX/1ZtHQozZWnpcqy79J06uuzvmMoWclEiBiUs/Jjt1XXxzwPJT9tl6E9XUjs3rwVqXFAh93yuJ+ayO+cXS4cWQQ87NsemCYY9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=scsCbRvj; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=khIM76ro; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="scsCbRvj";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="khIM76ro"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776827;
	bh=BXieB1tP6ySclyMCYJn0N7Bd99EORXPRe8SwVTykICw=; l=1778;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=scsCbRvjh9jzLrhAvKtXhb+b3kElrEhqo6iLxbJlKIeTMjJK/jhAjNFj/o7nhu2vc
	 ThOdFpfI7CscS1q8HBKTajiCrXahieityiNo+oJiDmmaPKSkkvaE2fgnNAKqXc9eAR
	 kzf7WdJ8QCHkOirOe6xSoJtL/JLkwKyo+6SZe9I8trHeV3cyEH3hYyBov/TvjNMsDV
	 V8EL0agI3Wm3W7Z760AWHSqooVJgXy7q1sBJWZJYAMnft075NcbaHaCo4qdQVqrTzj
	 Z1hA28xGrQ43c8Uz4LSA/WezfFnmM6dHW3ING5ghsdTNGv4FWH5sLnYjzv3hO0NfJn
	 KQGfCaRTHL04w==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128078:0:AUTH_RELAY)
	(envelope-from <prvs=11846F16CF=cy_huang@richtek.com>); Fri, 04 Apr 2025 22:26:58 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776818;
	bh=BXieB1tP6ySclyMCYJn0N7Bd99EORXPRe8SwVTykICw=; l=1778;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=khIM76rolzfviPgrJK/AeI6sPI2Jua9XaGSvRAGIt4aEIlHRli736fqSGafkDsnzs
	 ClM9ecGsVAHINU98QzR+MyCOGXZnUoMtcbUcEOL0kwybvBKESNpsDTL0ylkaLpy+1R
	 /gmiTVtn/XmAoH2F0hjXyXKl3PTK/NQo4JDMk11UsWoUXEro8XXw4KoaxbbvMPOSEr
	 0bztuXIXU84VVQ9+eLvtLMbtLVjz5+VUDUr5Qx0bJlmNaqdyjhULbob5moiCSqqFw+
	 ZjqeJbo/u3HBzDOl/z8BS7nhYPZAp0DJdusc6ZjJhL4muQvLTwdgpTVj1b5zRW/7E2
	 +cUqOftNTZi9A==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1629328:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 04 Apr 2025 22:21:09 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 4 Apr
 2025 22:21:08 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Fri, 4 Apr 2025 22:21:08 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ChiYuan
 Huang <cy_huang@richtek.com>, Otto lin <otto_lin@richtek.com>, Allen Lin
	<allen_lin@richtek.com>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] ASoC: dt-bindings: Add bindings for Richtek rt9123
Date: Fri, 4 Apr 2025 22:22:11 +0800
Message-ID: <5e71cd584b1e96cb34375b00a1be67d108d3a08b.1743774849.git.cy_huang@richtek.com>
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

