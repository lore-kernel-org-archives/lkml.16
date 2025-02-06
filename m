Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B85B23716F;
	Thu,  6 Feb 2025 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859531; cv=none; b=Oc6pg9mgFf2HQeW1e9WZOOyQ7N6D7rOeQNTh/W9EFT3+7f7//yc7ZZWJ/ei5AII1+SojiXBNxiNI5SmbuY1A9LTw/y7weCPvNv5EOljkLkWN2rPZnHKYlZowngJ48espNOyXUzrPdXCSePH/j/8BDA9hJ9oya6crVdiEwVTTyBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859531; c=relaxed/simple;
	bh=beI8cy6jJGbxuxw1uycUj+eWf0i+RTepbaYtXF2TJoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FvwxQjkLHKuAZOtB523oZ+mAx9ljiMWr/dXOAtKMeLvkHh8II2vhKI/ZehPU1Xc86O5lFvcml0bPB6VDQBbO6FiEUrQ0/Ty1bjSXwPPM1K5vYsaHg9kNBPAqhaF7LGv7OAphZGn+m1FyFeO6AsIIKrhuyBlMBvHTiwe/BftRbHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=RuaPy32H; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="RuaPy32H"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AF6871FA60;
	Thu,  6 Feb 2025 17:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738859527;
	bh=yertu9acf80JLgy/YpCZ4V84ThVWKKuLxlpR9aS+HEQ=; h=From:To:Subject;
	b=RuaPy32HNoOuyygpseFtyPMo3KKaxg5RDmR1k75uihQzdJOr5p9/BPor597bKkb+g
	 SwaEFm7rgQRCnWNUlelWj1u3s+RpuSDGRGyZpUG7+N7FKSMeCmbQ6xg8ms2tV38S85
	 ozJLZxSsJP+1p/j6vH2vMn3Uk8hEL80asyCozHu0soUyGlfhnpNg3vWVXor0WfyjSk
	 cq3N6I3QCxe0ZzpyUWb9GTUp3SFVDvXZqlxlikz8hnKFb+xDjxHnNCqCHXJnC5z89X
	 e4NF2+2s0ADA+x8NG/7DhqAaCCRkFOWUrllsA1IlnD3e0fee+l2SxYBdLj+7Okfwa0
	 Lf7ijVOu7fIow==
From: Francesco Dolcini <francesco@dolcini.it>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 3/5] ASoC: dt-bindings: wm8904: Add DMIC, GPIO, MIC and EQ support
Date: Thu,  6 Feb 2025 17:31:50 +0100
Message-Id: <20250206163152.423199-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206163152.423199-1-francesco@dolcini.it>
References: <20250206163152.423199-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add two properties to select the IN1L/DMICDAT1 and IN2R/DMICDAT2
functionality:
- wlf,in1l-as-dmicdat1
- wlf,in1r-as-dmicdat2

Add a property to describe the GPIO configuration registers, that can be
used to set the four multifunction pins:
- wlf,gpio-cfg

Add a property to describe the mic bias control registers:
- wlf,mic-cfg

Add two properties to describe the Dynamic Range Controller (DRC),
allowing multiple named configurations where each config sets the 4 DRC
registers (R40-R43):
- wlf,drc-cfg-regs
- wlf,drc-cfg-names

Add three properties to describe the equalizer (ReTune Mobile), allowing
multiple named configurations (associated with a samplerate) that set
the 24 (R134-R157) EQ registers:
- wlf,retune-mobile-cfg-regs
- wlf,retune-mobile-cfg-names
- wlf,retune-mobile-cfg-rates

Datasheet: https://statics.cirrus.com/pubs/proDatasheet/WM8904_Rev4.1.pdf
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/sound/wlf,wm8904.yaml | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8904.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
index 329260cf0fa0..b89d9db02848 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
@@ -38,6 +38,74 @@ properties:
   DCVDD-supply: true
   MICVDD-supply: true
 
+  wlf,in1l-as-dmicdat1:
+    type: boolean
+    description:
+      Use IN1L/DMICDAT1 as DMICDAT1, enabling the DMIC input path.
+
+  wlf,in1r-as-dmicdat2:
+    type: boolean
+    description:
+      Use IN1R/DMICDAT2 as DMICDAT2, enabling the DMIC input path.
+
+  wlf,gpio-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    description:
+      Default register values for R121/122/123/124 (GPIO Control).
+      If any entry has the value 0xFFFF, the related register won't be set.
+    default: [0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF]
+
+  wlf,mic-cfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description:
+      Default register values for R6/R7 (Mic Bias Control).
+    default: [0, 0]
+
+  wlf,drc-cfg-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      List of strings for the available DRC modes.
+      If absent, DRC is disabled.
+
+  wlf,drc-cfg-regs:
+    $ref: /schemas/types.yaml#/definitions/uint16-array
+    description:
+      Default register values for R40/41/42/43 (DRC).
+      The list must be 4 times the length of wlf,drc-cfg-names.
+      If absent, DRC is disabled.
+
+  wlf,retune-mobile-cfg-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      List of strings for the available retune modes.
+      If absent, retune is disabled.
+
+  wlf,retune-mobile-cfg-rates:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      List of rates for the available retune modes.
+      The list must be the same length as wlf,retune-mobile-cfg-names.
+      If absent, retune is disabled.
+
+  wlf,retune-mobile-cfg-regs:
+    $ref: /schemas/types.yaml#/definitions/uint16-array
+    description:
+      Default register values for R134/.../157 (EQ).
+      The list must be 24 times the length of wlf,retune-mobile-cfg-names.
+      If absent, retune is disabled.
+
+dependencies:
+  wlf,drc-cfg-names: [ 'wlf,drc-cfg-regs' ]
+  wlf,drc-cfg-regs: [ 'wlf,drc-cfg-names' ]
+
+  wlf,retune-mobile-cfg-names: [ 'wlf,retune-mobile-cfg-rates', 'wlf,retune-mobile-cfg-regs' ]
+  wlf,retune-mobile-cfg-regs: [ 'wlf,retune-mobile-cfg-names', 'wlf,retune-mobile-cfg-rates' ]
+  wlf,retune-mobile-cfg-rates: [ 'wlf,retune-mobile-cfg-names', 'wlf,retune-mobile-cfg-regs' ]
+
 required:
   - compatible
   - reg
@@ -70,5 +138,25 @@ examples:
             DBVDD-supply = <&reg_1p8v>;
             DCVDD-supply = <&reg_1p8v>;
             MICVDD-supply = <&reg_1p8v>;
+
+            wlf,drc-cfg-names = "default", "peaklimiter", "tradition", "soft", "music";
+            wlf,drc-cfg-regs =
+                /* coded default: KNEE_IP = KNEE_OP = 0, HI_COMP = LO_COMP = 1  */
+                /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+                /* coded default: KNEE_IP = -24, KNEE_OP = -6, HI_COMP = 1/4, LO_COMP = 1 */
+                /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+                /* coded default: KNEE_IP = -42, KNEE_OP = -3, HI_COMP = 0, LO_COMP = 1 */
+                /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+                /* coded default: KNEE_IP = -45, KNEE_OP = -9, HI_COMP = 1/8, LO_COMP = 1 */
+                /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+                /* coded default: KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1 */
+                /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+
+            wlf,gpio-cfg = <
+                0x0018 /* GPIO1 => DMIC_CLK */
+                0xffff /* GPIO2 => don't touch */
+                0xffff /* GPIO3 => don't touch */
+                0xffff /* GPIO4 => don't touch */
+            >;
         };
     };
-- 
2.39.5

