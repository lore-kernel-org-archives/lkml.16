Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0B211491;
	Wed,  7 May 2025 06:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601129; cv=none; b=QS7SHt1gn+AlpfdWDQK3wWHAkBRAjAKULO9ZDpwLNWswP4ZhxBfTrWWuq76yuCtXwCOIBqv3YUOosQeUOq7R9aR9AbIlgA18YwgCEN8pAVlzTis/pgWO8aMgtshC5fiLmB9i7N+Iks5WR7JG1l+t3MF0sHGCB11wZ5jmeuqTUM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601129; c=relaxed/simple;
	bh=8ur7PF+h+OoYNnx+CEH0MbXd0jVGhfPuCWw2eRDq/R0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1FA/0PHwr54y2Lf6mmU2cvNF2pnbGPhVK6KfQk6CTeffSJLVgM1LkhQGMGAtNPzeAOhX3NL4ZFDMciJLC7NQf6hXp2CJt73ufvzQIDeI7z9c0Kha2n2+0qAAhZ6o4NHTkNB8qGK/DCMQEXs/Im8fFXZopi2OK+MAnE6K32ZRZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCLiDimw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCLiDimw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af908bb32fdso555649a12.1;
        Tue, 06 May 2025 23:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601126; x=1747205926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VFeUtVSK+P31BKn8p8TOmZdmNczMOu9CNSWqC4iQ/A=;
        b=gCLiDimwbaKGv/8hjYalQbtHl8LAwQKEzHJY4HZtb0vtyNxho7UWgXc9k7Dmmmw7TJ
         Tsb4qundUkOnj2Wb0y2HzALzgqPA8e2irdHbGR7KBvcFJ2xBw00VyV+KoNr9VLzMf0FW
         +Ovq5+4NkssXLat7DUH/rXqQXH//0aRfVuqKdp4QMsojwNnzgIuvse5U1fed1d7ns7c5
         Ezw9G0tH4DQjRrdKTM2mrPH/M20lURyePyzXQZwPc05u8kjg+nuoMGAFrB5ug1jo9UII
         uDYRTkttVeRqbM2FvLtYbHNmudecFD3BLjK28DBkOe6wMNblrbCI29SynU5YmC1OWx6f
         6uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601126; x=1747205926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VFeUtVSK+P31BKn8p8TOmZdmNczMOu9CNSWqC4iQ/A=;
        b=nP80atnBkw8haOflkCYfOI12R22OJxpNbk2lsRa84ZRtQAR3VBVnmR3TCkG4XV+a4L
         YivR4TBOUY15a3JvgtaqDMa2rnIWpWBcKbKBexcZ212FAmLDRy27NiWVFWVkY6vuF4mV
         ivNkhQX9uybjOHgQuYX946Dzg+DmYrldkPXoZBB5gHKpdfwN0v4ivkRzXcHh6VGl7avM
         5Wz8BApGU7o0hdsQUd+s90GSk1FWubhoi5rxB4OZ2Im9P/Y3NDUOiUt26uPA/hbVa46C
         uLDVZDwiWpgnR1s9IBc4SoEG2JWkJ+Kn/SKHcGZ9YqsraeQsbGojI2PRVFBOZr0jEcXp
         QJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNzm4iENZeGruEwYxi7gETqbc6C7RI+o8oPTZ0RMJ2IRLC5mk++/RoaG1SRNEJC0XY0NvO/JPxAT5P@vger.kernel.org, AJvYcCXXrHnut3nGzT/htlYkaqLR9wQXgheBXrvhaFDcuRCKrLtWPAokMZGVIXe8HWT3al7hS2guNlw3XHAeQhDf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1eCH2hec5OFFSifcU4YfLHXGOOEHkR0wFokJBs19auSGq7VZk
	0L0BiGCDwlnm0Xn4SLqBP0VwkaOKsiWiZ5J24OnR7YUHN4QGW4CUXkxMaF2uY3A+0A==
X-Gm-Gg: ASbGncudI08Hc1ntRcHDwh4DpuIl2r8dRV26cuFaTAMGyHlH0hCZk3RhrqGAHWQ2S3Q
	j70ywvQfc37sw5Vro8/GBnsIzgdNcvQG+HuhRSsD3xbqDB3hJcTkwIDt3enSjMP3RCX+Rv7nJzB
	s3vbNKMcMLk88aLB3pYZQGwpS8zcgn2iCCj5P/sHphV9rxecq1LfbhwzrkuN8E23cTrCCsEhcJc
	w5hHx9jXyGPHAkfbSGr+EvTpSfSX8DDNVwyIxP3qevojVpbiCDT1+PNweuPIZcTYou7g72/XVz4
	P5xINMxCwhwNWwvEVJ1hG3zmYy8vXW1nJa2MN5A4Cjpe7mOrjsZB
X-Google-Smtp-Source: AGHT+IFWFsMpADeikjRihtABsrJqSE4NbJAS2GkCODo9n7rqiq9wTg7u55ZgGsyb7HunzWU8SJznsg==
X-Received: by 2002:a17:90b:1d8a:b0:2fa:3b6b:3370 with SMTP id 98e67ed59e1d1-30aa8829e61mr3655144a91.16.1746601126272;
        Tue, 06 May 2025 23:58:46 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:45 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:30 +0400
Subject: [PATCH v2 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-1-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=3856;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=8ur7PF+h+OoYNnx+CEH0MbXd0jVGhfPuCWw2eRDq/R0=;
 b=lhE5lWPmUzXCbmWvbeOwQgJMVk1YQ1w5MFmgMOhRfho594LWwPSCvWhcrNB/QZCJF9Me0JwNa
 o7U4TEIhxNqBkkKvgiCqek98wq8QKMYQ0bgDGp4TiocThkarTIKEs7D
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia timer
as YAML schema.

The IP can generate up to four interrupts from four respective match
registers, so reflect that in the schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
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

-- 
2.49.0

