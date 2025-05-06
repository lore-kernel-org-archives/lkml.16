Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9CC27F18F;
	Tue,  6 May 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533814; cv=none; b=BMtA0BOIHyDGnNPdp09bILH8Zm6MrsSr3TKO2yfveqZDrm85MyNE0LE0IAZUdQrizuPc3GKR4WmmrZ1JUVhPDEHGQNp9QJVxpqIQdXf2AqXbtib/Mo4/iF4jpg8Dc9oc9JgH26DMTVlZqeal7F87UotDKEATaPAz3UoVu+hbRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533814; c=relaxed/simple;
	bh=uR+b9SUDz3kDfrZfVAV0AjkzWD/ARG9NGY/tJWaZ00k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MfnX05hq28IDMle+wyTZ6BC5qZdTt49S5srHeXcfq2p7NXzr0mPB2RiQeJ7vYhbquQgyWKF8Ko9P5MwijYojTv887JsGh50kosUJeT3Xv4L4BLS8nm97tVEUuK3IwgV8gd4kfQh8bK0SJjV3f86LH95c447ypBVOZln3Flqi8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUp8e5Hh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUp8e5Hh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2255003f4c6so57137115ad.0;
        Tue, 06 May 2025 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746533812; x=1747138612; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZddEGrogZHEGNQ7pcvcEYKUf9gM+B46KqH5Pfb6SAvs=;
        b=QUp8e5Hhmmxh2PnQQgopG332W7FEarARts7AlUH8yyEhtYzDWRX5zRyZ9qcGUWitFp
         Kh6ap68eAl2lnN5Mtp+/Pt3aOLBrmqAVWXO3X9YVYMpiFWldOmmoRHL9AJdqgqddzdtV
         2BIz8lCXtcDUs8l3OY+EtKiLJusiX+H+ldVL2SmCDIHWdzaclTvHdkcSFrAv0rsrxuyi
         Y6QjVfkETqxqryFGCkHYhxecqqTo0TRaRm/RcK+JU/TpjlSroJGiU+/S9E9vWXoKnbuI
         enYi+HZEsc75JmG941TQYX4AdKgdBVqxMr06TBUXPX3hpjD4FhxFCmh44aS8R4m828C8
         3A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533812; x=1747138612;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZddEGrogZHEGNQ7pcvcEYKUf9gM+B46KqH5Pfb6SAvs=;
        b=CeVhFnk0LbOwolL/dSSdmLd1wFZy/w+i63yuqYjJdYsiGyszaBpp9AL+odpYgfh8PY
         BKubMPVjIIIXZfwfH1n3g6Z/hlhQD/8tTarjRaLroBt0VWEkHxo4fZ70WhQ590iPQcAB
         PlKrRtdqgvdKAkwBCNcPY596hpeJf2gv1/xDXhF3xnV7jz3SdAgsrC+iCFtt0r87I/lA
         FU8dDVB3g8SI7qfcMD+Cpw/RzP9gVd7hkRZd53pKg4uMB+6w4bBBPOzBYqS0e0aBodbi
         DHkefH8iDObBkewra6sw7hnL0qOkWsJsc2FMuxAMZ1iqiPpGwu+RDGXODhOQO4OSXAX+
         93kA==
X-Forwarded-Encrypted: i=1; AJvYcCV9mH3xZEqPvmNYsFiy969JnZO3ucTGQzerjUuLnUegt7uxKbLxvCuj+z4BDyU582UoOcDsUEg+qmUF@vger.kernel.org
X-Gm-Message-State: AOJu0YxkXYCGjUDzPu++8WLsmMOxOcoDLJn4gH2Wjjvh+1jiGeFjyAZt
	ePAbCqU14T3KLzHxdcLculehItpcyEX7JQdjwcaq5NOeZI88mfm8
X-Gm-Gg: ASbGncucG/YRJkxX3esorfxdpDd6Vx6vaS8h+p5Aod603JcR8+lNsskvhHflzNVde/+
	QeRSpoTwRyVZbrajjwzEYKn8NNeGDudilqHu8vpfnY5b/S81sOM7PRAYbQ6aSIhS6nenTMFLoZu
	2FZqvAagZwrQWy6oQG543jwQA8lkG6prDjz9X4InTHFCWcMHISIZcqpn7zHPHk3vlOIUrlkk0KS
	XMOCizRDaq91jHFiNPolSXvvaCawvpo1rsdnT/gmevocLlw7EVtL0D+NHVEvWEuHs13iAFiH46m
	sSx/y42B2uD1bBXBADbBcryO0J/jp4y3TUdFux8h8EUfRSkYP10L
X-Google-Smtp-Source: AGHT+IHs+N0P22tjESMxWzTw9WBCdtsKHjx3p4pCRUDRfRHmJozPUqCA7yfh3OLcbsU9gVjS2h5X4A==
X-Received: by 2002:a17:902:ccc5:b0:223:5124:a16e with SMTP id d9443c01a7336-22e102b8549mr257960995ad.5.1746533812345;
        Tue, 06 May 2025 05:16:52 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e2356741asm45354235ad.35.2025.05.06.05.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:16:51 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:16:32 +0400
Subject: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ/9GWgC/42Nyw6CMBBFf4V0bc10sFpd+R+GEB4DTCJF29poC
 P9uxYVbl+ck955ZeHJMXpyyWTiK7HmyCfJNJpqhsj1JbhMLBNSwU0ZGrsoYjAYoA4/kyppty7a
 XR0BVtwejyYBI85ujjp/r9aX4sqP7IxXCTw7sw+Reaz7ix/5RiiiVzBuFWu9NB2jO/VjxddtMo
 yiWZXkDgJ5u09UAAAA=
X-Change-ID: 20250418-via_vt8500_timer_binding-9021bd785e80
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746533807; l=4585;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=uR+b9SUDz3kDfrZfVAV0AjkzWD/ARG9NGY/tJWaZ00k=;
 b=aSHwcym8c/ttItjanuxGpA+6h1oLBP/EYSQzDhjHPEU4SLfpu6MgvCnubLuKEuUcXIKz2tYV+
 27X78Tr+pTZB8dUZOdijpnZGauJ7xfHmqx7MnENiD0RYY7nNQwdTY7E
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia timer
as YAML schema.

The IP can generate up to four interrupts from four respective match
registers, so reflect that in the schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v3:
- Added Rob's review tag (thanks Rob)
- Rebased on top of next-20250506 to pull in MAINTAINERS updates
- Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com

Changes in v2:
- split out this binding change from the big series affecting multiple
  subsystems unnecessarily (thanks Rob)
- added description for the four possible interrupts (thanks Rob)
- added overall description of the IC block

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
---
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
 .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
deleted file mode 100644
index 901c73f0d8ef05fb54d517b807d04f80eef2e736..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Timer
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-timer"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : interrupt for the timer
-
-Example:
-
-	timer@d8130100 {
-		compatible = "via,vt8500-timer";
-		reg = <0xd8130100 0x28>;
-		interrupts = <36>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e748149948f3140d4a158f800b91e70bf9c4f042
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Timer
+
+description:
+  This is the timer block that is a standalone part of the system power
+  management controller on VIA/WonderMedia SoCs (VIA VT8500 and alike).
+  The hardware has a single 32-bit counter running at 3 MHz and four match
+  registers, each of which is associated with a dedicated match interrupt,
+  and the first of which can also serve as the system watchdog (if the
+  watchdog function is enabled, it will reset the system upon match instead
+  of triggering its respective interrupt)
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+properties:
+  compatible:
+    const: via,vt8500-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Channel 0 match. Note that if the watchdog function
+          is enabled, this interrupt will not fire and the system will
+          reboot instead once the counter reaches match register 0 value
+      - description: Channel 1 match
+      - description: Channel 2 match
+      - description: Channel 3 match
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@d8130100 {
+        compatible = "via,vt8500-timer";
+        reg = <0xd8130100 0x28>;
+        interrupts = <36>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 16037aaa770fc35efb45fc26555afaa5102e2640..5c38a60eb3bddc47106509d6cc6450ae93e50191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3467,6 +3467,7 @@ F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250418-via_vt8500_timer_binding-9021bd785e80

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

