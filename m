Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5B2C1A2;
	Fri, 18 Apr 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744986826; cv=none; b=jxd/XmEf+y57YoTpRAHB6a45+DvKx9T26+c9TZ5+PgBRy2cEfntL1rLrXGc5gREHjbQ8wVd4sSKDh7iiJOgi6ch+MGvTFTQ4XPfzGs3JmiHxB0wLMj/JZc/jbTEMPmzp4vm4IgvMH8TDSULF97hz9iDEoUM0IuokGIrSKngqAmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744986826; c=relaxed/simple;
	bh=8hvzQpevJpd8opdibOVe4+Ri5sQRV3J/5rabA+wMngg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uaiNDQiW0wY+psavmpmBJhS04cGaWM0v3i8AywDqfz0Ktj6dnJsPfCp6V9B2ozNR//7S7zmX19cZM+ohRKQySeUosj4hh6CME6jir7M8rQxFZknpt1khW/O/81wD8t7ItMYR4ApfDcQ+3diShA/atQjD7cp8OclpMMppnwCWmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgzvwuV9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgzvwuV9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb5ec407b1so288898466b.1;
        Fri, 18 Apr 2025 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744986823; x=1745591623; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xWBrhMoZbugc1pyBrVITkVru2bavizkyHIBfAy50sk=;
        b=jgzvwuV9jGE+3rRRzeaERsfeVvJSkSB8q1NPjpb7ku/bDuc3tCAIpv61/OI348q20Y
         fpH8CpJv8M7iLxXywvfa2zWDq0TTYuaN3WeWGdES8lBdUX+kFVFkzZHC7z64S0F3OnnS
         Xi0HvBaXXIe7cJc0v5vareUoyxwDLd3f9rx+oCtLlMpL905YFVGM+6gmCrDvLNewV6zU
         cFpd2wvoIEW14F8qPE8WUTR65Vjf9QKzs+8oDvQZIt2UAxmtkIxwk1Ld65DsW6bH3q3I
         wPPo1IT+te8mojAiAjrBPNSiE5Y0qc91puM9znElU31uQnuHHIL6Mmhbt98+muViPHjU
         g4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986823; x=1745591623;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xWBrhMoZbugc1pyBrVITkVru2bavizkyHIBfAy50sk=;
        b=A641pigHiCCrsHE9/eevNCwB0cMZ5lx3A/IojQxDSpBxpYV/Wqrv8SZsqg0k0ZtAOj
         UqVJxcJD8JFqdMxLhQkEiTk0m49G9vdSFKuxDe+JTjFnSkqtetK7bmOVnTUb007SYBu3
         eawSrXqYlcd+tMsQnUCByqfx8JXG2lGkdZUYnhpcTaJaCdYVe7jDWtfq0Jn6j6MmrIjS
         mzm0L2Lo0Q2/4O5t7yYm/+qC2Nb24Ib3e0Kb7DCHr+v7WxlRJ1SY1fWE5j7Ot6nWm9T3
         ysh8okBRTeZkIrYG5lTnJ6aYmBbyXeTqXDTP1YUBm9eYRYxiNqAnGe2+kntsn/hQlfM9
         kgBw==
X-Forwarded-Encrypted: i=1; AJvYcCXkxwVaPDPgjgNEPcK+ltHL5M9THDVPWe5ELVWnP6kmNkGyMTd76eRQ9HpTM0XFqbda4LmLPR5pE1AZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yze86IfTUSkzvC6Gc16A13fN1FBlpO6Z7O4GBHOrs2fzMe2tx9V
	VKN02jzvuuEhF4VW7g7W8dvF0HErL2biQEB3fjaDo0fv0uSNRnxVWomF/+UIUDU=
X-Gm-Gg: ASbGncsLzxjzS+gZ2o4rt0JwEKZdsCrvUSmDap6QBL26+e7g34DZiaYpvFq0PD3O/Ei
	5n5RerqYqGLc66ccLI7EgWno9v2BoqPSo6sQhWOjzpnpHKrOrh5STirDcCoN9Z6Ojsf2BuDFu8+
	PoWlaY/qCLGVZZsQaGgH2rYNng0J8p0Bia6Y8dYcJXDMHb3wztwZMdb9DtZ1ScE9q4Oj6pK0dpm
	YPaKguTfnuxhznTB3QIowEHRDYn9LvMjE5OnpKNu13n1NoCv6q6V1xO739BqbKzi1W7Cc++lbYI
	D4G2Kmr0zCVKGc00khnYpCmfV7R1c3qqB+HC2xqifZ/vQVjOuJKn
X-Google-Smtp-Source: AGHT+IEcnxUHY3/54G2wHOQst0KE+WrBA6XR3tiAQlrpS/18wB0AktIZqdCpGIWVrwq8J9kwLSsU2A==
X-Received: by 2002:a17:907:2da4:b0:aca:cad6:458e with SMTP id a640c23a62f3a-acb74dd6021mr281005866b.43.1744986822447;
        Fri, 18 Apr 2025 07:33:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b1e4sm127453666b.34.2025.04.18.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:33:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 18:33:45 +0400
Subject: [PATCH v2] dt-bindings: timer: via,vt8500-timer: Convert to YAML
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMhiAmgC/02O0YrCMBBFf6XMs4VkbNNpf0WkZJKpOw+NmmbLg
 vjvBoXFx3Ph3nsesElW2WBqHpBl102vqQIeGgg/Pl2k1VgZ0GBvOkvtrn7eC/XGzEVXyTNripo
 u7WjQchyoFzJQ67csi/69p0/nD2e5/9aH8gmB/SZtuK6rlqkxfsHFsVjukOyRenaWApPzceycR
 ImGRh8Ivs2q6LeXphL+fQYZmZEcdoOddoTz8/kCohaAFO4AAAA=
X-Change-ID: 20250418-via_vt8500_timer_binding-9021bd785e80
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744986827; l=4470;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=8hvzQpevJpd8opdibOVe4+Ri5sQRV3J/5rabA+wMngg=;
 b=WUeT1BUiZFwvLtY9348IfWL78Tc2LE+rMnaK205tuNUhTEf/IqweRGtmSetty1wwIDgqp9Nbc
 7AdZc/B/wnbAHr9/QUM2L6JrLq8215rVwD6vRpJu6XMuYG+ckRyVsge
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia timer
as YAML schema.

The IP can generate up to four interrupts from four respective match
registers, so reflect that in the schema.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Split the series from v1 into separate bindings patches so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- added description for the four possible interrupts (thanks Rob)
- added overall description of the IC block

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
---
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
 .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 3 files changed, 53 insertions(+), 15 deletions(-)

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
index 96b82704950184bd71623ff41fc4df31e4c7fe87..ed5d6ea34959d11624732ea7601e4d51ad19eac2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,6 +3428,8 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-via_vt8500_timer_binding-9021bd785e80
prerequisite-change-id: 20250418-via_intc_binding-7e9bb2862471:v2
prerequisite-patch-id: c53a4f3be5edb497bb9ff8fcad6cdba382d07fc6

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

