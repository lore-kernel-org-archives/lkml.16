Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60481EEA3C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138090; cv=none; b=hms0Xf3dTieg3Bhc5hQ7vGDnca5Pi8dMnm8aNxriLwnr7o0LlJj6Dk85XjXazXlqg3p9okldvwWd27efmoF6ilgPeGG/PVF9gvwcUq5yE84Oi5IodoGDxphW2pFBHP3OAiBzJtMmL9CVbLqGSUPzYlUf2KYl2NwGzgh7Jv3civY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138090; c=relaxed/simple;
	bh=nmfuwsHfObbwfOxWN3QCkxhDB/TrN7Ik4c69MJA6cTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLg+SNgxHEaQy7BPA5PpAwce8Cpb3Eh67VE9t4T38ylSr5qasbvaztpGtucEeS8WZUj+ytq8WmwM++6eKrMhoRhmBJPpBDyjWG7hOS0/XBcdjEFWko9OYf3M0Y5hjfz65WUTs6D13f2fuEH4tzkoyAtcpitdJAVWq0QLgBo7xIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCpZl743dztGn;
	Thu,  5 Jun 2025 17:41:19 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCpZl1zQJzpLP;
	Thu,  5 Jun 2025 17:41:19 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 05 Jun 2025 17:41:06 +0200
Subject: [PATCH v2 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
In-Reply-To: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC allows to configure its reset/restart behavior whenever
the PMIC is reset either programmatically or via some external pins
(e.g. PWRCTRL or RESETB).

The following modes exist:
 - 0 (RK806_RESTART) restart PMU,
 - 1 (RK806_RESET) reset all power off reset registers and force
   state to switch to ACTIVE mode,
 - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
   RESETB pin down for 5ms,

For example, some hardware may require a full restart
(RK806_RESTART mode) in order to function properly as regulators
are shortly interrupted in this mode.

This is the case for RK3588 Jaguar and RK3588 Tiger which have a
companion microcontroller running on an independent power supply and
monitoring the PMIC power rail to know the state of the main system.
When it detects a restart, it resets its own IPs exposed to the main
system as if to simulate its own reset. Failing to perform this fake
reset of the microcontroller may break things (e.g. watchdog not
automatically disabled, buzzer still running until manually disabled,
leftover configuration from previous main system state, etc...).

Some other systems may be depending on the power rails to not be
interrupted even for a small amount of time[1].

This allows to specify how the PMIC should perform on the hardware level
and may differ between harwdare designs, so a DT property seems
warranted. I unfortunately do not see how this could be made generic
enough to make it a non-vendor property.

[1] https://lore.kernel.org/linux-rockchip/2577051.irdbgypaU6@workhorse/
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 23 ++++++++++++++++++++++
 include/dt-bindings/mfd/rockchip,rk8xx.h           | 17 ++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..c555b5956cea9f594d80ebd3b27e8489e520d97d 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,29 @@ properties:
 
   system-power-controller: true
 
+  rockchip,reset-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    description:
+      Mode to use when a reset of the PMIC is triggered.
+
+      The reset can be triggered either programmatically, via one of
+      the PWRCTRL pins (provided additional configuration) or
+      asserting RESETB pin low.
+
+      The following modes are supported (see also
+      include/dt-bindings/mfd/rockchip,rk8xx.h)
+
+      - 0 (RK806_RESTART) restart PMU,
+      - 1 (RK806_RESET) reset all power off reset registers and force
+        state to switch to ACTIVE mode,
+      - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
+        RESETB pin down for 5ms,
+
+      For example, some hardware may require a full restart
+      (RK806_RESTART mode) in order to function properly as regulators
+      are shortly interrupted in this mode.
+
   vcc1-supply:
     description:
       The input supply for dcdc-reg1.
diff --git a/include/dt-bindings/mfd/rockchip,rk8xx.h b/include/dt-bindings/mfd/rockchip,rk8xx.h
new file mode 100644
index 0000000000000000000000000000000000000000..f058ed1ca661185f79738a358aa2d4f04539c590
--- /dev/null
+++ b/include/dt-bindings/mfd/rockchip,rk8xx.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Device Tree defines for Rockchip RK8xx PMICs
+ *
+ * Copyright 2025 Cherry Embedded Solutions GmbH
+ *
+ * Author: Quentin Schulz <quentin.schulz@cherry.de>
+ */
+
+#ifndef _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
+#define _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
+
+#define RK806_RESTART		0
+#define RK806_RESET		1
+#define RK806_RESET_NOTIFY	2
+
+#endif

-- 
2.49.0

