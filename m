Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EBB248176;
	Thu,  3 Jul 2025 03:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515054; cv=none; b=XQzxp2jp50pQSx03VUXu6e6OjJYo/SJ2y8/wwQDMzwm8ZoKSBgZTmSARi02sZv63KWqJ5wHTnp24DMNVoCPugu+wuSjGnpMua0qJIk3CS98isrOifObfVPjgiqAI7hKsg07K0ysjez3m0ovae0n7uOuyLnwH4iOhCL7pOET8PBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515054; c=relaxed/simple;
	bh=0PH3RleiQVZirHA9rNg1jSP0dpI/yPUZ6g0dS5Dblzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XeIgO1w5hU0stuj/qUr6LP7fUESiNMPOYmxOjZVUIN71IgvdYFsRNuYCBwbeRBSi0u7vecj/X1T+CTjc+EfxJL7sGsF/e8CovkBOAcd+9210zW5r+/gET4MsH5btjjfNvTWvpCjLgIjrOLHDPW9Kc6faQwsrqQJIpX9g0bzklpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz3t1751515009t6ec01799
X-QQ-Originating-IP: IrMCZzZH/SSvv+5Zs0eaiJTfTMdC+E+N7fClkF2UMXY=
Received: from localhost.localdomain ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Jul 2025 11:56:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14627184243716884690
EX-QQ-RecipientCnt: 14
From: Nick <nick.li@foursemi.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nick.li@foursemi.com
Cc: like.sin@gmail.com,
	xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S audio amplifiers
Date: Thu,  3 Jul 2025 11:56:38 +0800
Message-Id: <20250703035639.7252-4-nick.li@foursemi.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703035639.7252-1-nick.li@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N8Jy6PtD39R8/A5cfXntuBO/1BEfJNI6rYbyRHY/TXKU9gOCL/R6z3B7
	DfTpFTUFPxAS60jl4QeicrpGYUJzPHnVuY1m3joC4Ehb1rrz+mG0Hrk3vyIWJOQupzoWkwn
	01aW4plVcabqlBoCGvvq1ZnXJ4mUD9coM2cgAfjIfwRGlKMOylfqN9o117NqRZmZjIYi/eG
	ae7wWms5oXtEXN0GGl5KiDPL9XkFVF82UFH52TaIe2a5HhPbugXognjkNKCQv+7xt1rsNs8
	9GCWi2z6mRN1viRXq55BlyfUqIUZ5O7Fv1h2RoJbl8p/WO04o4ItqgeyGLcL92QQSq8xMh5
	Ua4vfIbUhxF8Dc5KkoPU86T5cggM6p86OY6WuBU/y/Olo2nf1FpsNJY9N0aPjytOn1Fij4b
	Fqsjg0OlrZKdyTC9sQ+U+mDodftwp+XQVxCdQgFQPYA0BLyXPn0Xvh/vdz32eM7lRp9ta4b
	F1e9V6uypJMtAlcOkY+CcaAAQTaJcPyjsVxyRcXc2pGCrz/12oj58ExWDk/xoCacEKe2Jiz
	hDVUQ3nRR0DiK2fHjjTvn82W0UWjcJQyrrvm6iQZ3F7IgnVph7J+SRrul5uU26vu2M/8Og4
	voKxkkvCu/9kRqLMBIHpuk0p6Xkvch9fm5ImoMC9FLkOaa7+0T6z/Km3h5/vKdT/UMx9LGq
	KT7LwdLmbL8Ep00eO47GVJLgMUuticEK3Dr3X0jkaBqeij2PQqAHWv9zbrDaQ5e1aONCgLZ
	XqQqXkQP9jsPlDGMnAksGYCH2hoOwAHaH0EPl7dKPjAEvC5D7+uR06oo55o0O9O80AZTKwz
	KanbhCIkDZ0MrVzjKIvOltSmK6EH53A4UR5PUJjjSd+Nqjl0ycGIVNbGNBZ94wIDYC20JLg
	V/laK+pFoRnfg0TKsTZuGdPeQUMI31Uqkv4fuYEnPhzWKhH34x+WFA5lTtLAk7mnCJtUbUd
	FsUUfQGQjCo3KKf8rN2bO0qJGGz3ac2m5z3HFWjUOmRsLxAh8CyqxWH5rBkkWQ10JIv6MCV
	i1BEEOBrMjrR9VVFBwvKskfEFLRhzVtOgOkiR+4M/o/i7Im2r3NdoHfRHUoCTzHt9TyH4pM
	ZppClULRKgU
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

From: Nick Li <nick.li@foursemi.com>

This patch adds bindings for FourSemi FS2104/5S audio amplifiers
which can support both I2S and I2C interface.

Signed-off-by: Nick Li <nick.li@foursemi.com>
---
 .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml

diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
new file mode 100644
index 000000000..3a1aba9b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/foursemi,fs210x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FourSemi FS2104/5S Digital Audio Amplifier
+
+maintainers:
+  - Nick <nick.li@foursemi.com>
+
+description: |
+    The FS2104 is a 15W Inductor-Less, Stereo, Closed-Loop,
+    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
+    The FS2105S is a 30W Inductor-Less, Stereo, Closed-Loop,
+    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
+
+properties:
+  compatible:
+    enum:
+      - foursemi,fs2104
+      - foursemi,fs2105s
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the amplifier. Refer to datasheet for possible values:
+      0x68/0x69/0x6A/0x6B
+
+  clocks:
+    items:
+      - description: The clock of I2S BCLK
+
+  clock-names:
+    items:
+      - const: bclk
+
+  '#sound-dai-cells':
+    const: 0
+
+  pvdd-supply:
+    description: |
+      Regulator for power supply(PVDD in datasheet).
+
+  dvdd-supply:
+    description: |
+      Regulator for digital supply(DVDD in datasheet).
+
+  sdz-gpios:
+    maxItems: 1
+    description: |
+      SDZ(Shut Down) pin is active low, it will power down the chip,
+      and then reset the chip to shut down state.
+
+  fs,fwm-name:
+    description: |
+      The name of firmware that should be loaded for this
+      instance. The firmware is gernerated by FourSemi's tuning tool.
+    $ref: /schemas/types.yaml#/definitions/string
+
+  fs,dai-name:
+    description: |
+      The name of FS210x DAI, it can be set different name when
+      there are multiple FS210x devices in the system.
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - reg
+  - sdz-gpios
+  - fs,fwm-name
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@68 {
+            compatible = "foursemi,fs2105s";
+            reg = <0x68>;
+            pvdd-supply = <&pvdd_supply>;
+            dvdd-supply = <&dvdd_supply>;
+            sdz-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&fs210x_pins_default>;
+            fs,fwm-name = "fs2105s-btl-2p0-0s.bin";
+            clocks = <&clocks 18>;
+            clock-names = "bclk";
+            #sound-dai-cells = <0>;
+        };
+    };
-- 
2.39.5

