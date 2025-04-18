Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2378634C;
	Fri, 18 Apr 2025 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744984661; cv=none; b=ZfEgI8HAhqA229s/BtZxL4Dr+B9DKA3NKuD9NEUQqXNcqr4YtuOvfCKCBTSWNY0VPkZkbibuKNZlylbW78V3dkLEmuyQGbbm9mrUor15ZVVcMH+Symeiln07zIUFOB4maAlBrPJ31PbISAwh9Nz/rHVXi27k/8AKqTbGG9g6c2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744984661; c=relaxed/simple;
	bh=ajVr3yuI4k7/Pim7AdIiw4kKFIHaClFo40nc4H6fqBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bUF7NUjNRY6CqkURtIX5jAOV28fuzkgamFBMxn9MTgixbOLbhtSKxodnPPeVSKTXTpF1A/uPtRH8FYJ7P8od9GIsWX4hOIztPaekwj/33497iZC+RLpwnWHhjH5+6qkw9edf+2+wMlZaImDfWSYP5W6n7LSfPgW77dnoDPuYqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfuaEvbl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfuaEvbl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0782d787so13548645e9.0;
        Fri, 18 Apr 2025 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984658; x=1745589458; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUUEBM3tYUb/t6AkwMd62lhApOXYl97kh+AIMbiifmg=;
        b=HfuaEvblwuufalBCLbJQNJDxoPt3NMlyTX3lzMGIBf4xcCmCM76IHbnkS3AcbDYTBv
         m9mGWus0lOx3iqFSBZ9tOpO0iwhiFzGrr/T4W/qFcKyfA8aPTkgRy2FVSApc3ij72aCg
         rQfwLFRSSKltcTm5FSbJb7YHOA2077pbypQAFSRprIyrgG5dCyMJMB/RXNrZeEOVrb/w
         CyQSujDg9h+mb6C6CD+PB6NV8X3aHQRP6dgqTqXW+OuOfnRBVgt3yo6GK8KP0DAMx0Sb
         3DSewQmBi8aU4ojkagwYWytpZlhR35uLJlJHSbLdEVAaOdpEv5LCwygSwexKtMcSPBQg
         KxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984658; x=1745589458;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUUEBM3tYUb/t6AkwMd62lhApOXYl97kh+AIMbiifmg=;
        b=XexKzQ3ySGA6J3peJeUtxWTNKfaVHhqLhqVjR9KD+iiFNJToNHkITCLJnptCMPIuu4
         wT5OeB4W1/8461lBeQoTdb2ICIelLV+MYlIactY9WeXGGUStl7QJt3cIDuNcX6d4dGuQ
         4DyMEQVIT0GMwOudrkXdmg7lP7P/o1A8Afyoj0to8LYbdXMzoITKH3z7W4FQHttRzlm4
         V9Y75zv2tv/EjQRdUy9ez4nP7J+2JG3gdYDQxGtz0XxJtbRDGE9PNhJOMMU0KCGRn2Wt
         utWsSKbBXH0BF3qLJgjh4KN0Zv9emShuXfcP0CgwBuB0KSREgpVYij3+0WDTetimFofI
         aqyA==
X-Forwarded-Encrypted: i=1; AJvYcCXgQRvjpPUGnXBu7Qvl7MP6lEpAjAng+h5XrO1z/x6YphupC7Xi2kDichVfa4aanKGbriMQCiH7NfZ4@vger.kernel.org
X-Gm-Message-State: AOJu0YyZkKWzZArbRhtRfwbxkz1g74UVXBGd2naEeplFg2TwTDIiCW5u
	Y6se2L98j56d3VpnFF75DahpuhmmfEO2CRDjlsbJ3xJ1t+zmRk/K
X-Gm-Gg: ASbGncsoehN1ULEZafd7g8xxIWxX+SkJbj9BnJ0N4+2MzkQGthfnEPuGLsC2VRDL4dp
	IKtZsCfDhHXkLAkw9kFlIk+MWDPEaXuiMmPW7epkjoklOweZYd0BsK5iyDROK4plHZ6gX6kcZiC
	KPuA+w/WcBBK69+aAmppDCk/UDzGpEzZyBXm4G7I/VqW0n+MZzO3AXDlWSNmOrG/tga8KxI7lGG
	5OVR9i1b5kfyPQ3ZupbtpZcwvjRR6UuGg7W4JLdfAFA0ahNWtX1ktbucv3r4bkeE9DhMfIvHExm
	6dJWDBzm8DrwY3wEKOaGeCIaPOLX3tE2Ion7O6zpvAhd0GgahZv0
X-Google-Smtp-Source: AGHT+IHGw4uQbywJb5vE8Eiogx+8whJZ0txrLQuGF1Ig4JvfkEMUcOo9p/AQGsffVLl8DH3+8WKBng==
X-Received: by 2002:a05:6000:40cf:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-39efbb1a366mr2018094f8f.55.1744984658009;
        Fri, 18 Apr 2025 06:57:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332b2sm2884691f8f.30.2025.04.18.06.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:57:37 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 17:57:25 +0400
Subject: [PATCH v2] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-via_intc_binding-v2-1-b649ce737f71@gmail.com>
X-B4-Tracking: v=1; b=H4sIAERaAmgC/x3MSwqAMAxF0a1IxhY0+N+KSLEa9U2itCKCuHeLw
 zO496EgHhKoSx7yciFg1whOE5q2UVcxmKOJMy6zIm/MhdFCz8k66AxdTS2tc9xUXNQ5xezwsuD
 +l/3wvh8xRwrIYgAAAA==
X-Change-ID: 20250418-via_intc_binding-7e9bb2862471
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744984663; l=5333;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ajVr3yuI4k7/Pim7AdIiw4kKFIHaClFo40nc4H6fqBk=;
 b=EnlSEOAw4wpYdueqn4gI8kfDgR4AfCA1yks+ccgbdmVGF1i1d2KcpNBD046D0P46Cs5p0BYZD
 5+Aej3TIm2jD1+sQhWVEjuDdTdZFMZz8pRr0G1GfSL9p4zXwpKzLtCM
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia interrupt
controller as YAML schema.

The original textual version did not contain information about the
usage of 'interrupts' to describe the connection of a chained
controller to its parent, add it here. A chained controller can
trigger up to 8 different interrupts (IRQ0~7) on its parent.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Split the series from v1 into separate bindings patches so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com/
---
 .../interrupt-controller/via,vt8500-intc.txt       | 16 -----
 .../interrupt-controller/via,vt8500-intc.yaml      | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 77 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
deleted file mode 100644
index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-VIA/Wondermedia VT8500 Interrupt Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-intc"
-- reg : Should contain 1 register ranges(address and length)
-- #interrupt-cells : should be <1>
-
-Example:
-
-	intc: interrupt-controller@d8140000 {
-		compatible = "via,vt8500-intc";
-		interrupt-controller;
-		reg = <0xd8140000 0x10000>;
-		#interrupt-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bc14c74bf7d57d6da75135cbb4ae27ed59c6b9e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA and WonderMedia SoCs Interrupt Controller
+
+description:
+  This is the interrupt controller used in single-core ARM SoCs made by
+  VIA and WonderMedia (up to and including WM8950). Each block handles
+  up to 64 interrupt sources (level or edge triggered) and can generate
+  up to 8 interrupts to its parent when used in a chained configuration.
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: via,vt8500-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description:
+          Interrupt number raised by the IRQ0 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ1 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ2 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ3 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ4 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ5 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ6 output of this controller
+          Only used if this controller is chained
+      - description:
+          Interrupt number raised by the IRQ7 output of this controller
+          Only used if this controller is chained
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@d8140000 {
+        compatible = "via,vt8500-intc";
+        interrupt-controller;
+        reg = <0xd8140000 0x10000>;
+        #interrupt-cells = <1>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..d3d8e31e547e8775272911df156d6574ae7acdac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,6 +3428,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-via_intc_binding-7e9bb2862471

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

