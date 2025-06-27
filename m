Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF69339A8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021663; cv=none; b=QA5XPls5os6BWPWvzjhSkgJWfBJdSprFwJOVOzFdU+acdySHL9as0Wz6gYaLLmmfWI7jIQQVlVMLgQvB44zlErAOY3ncVYgPZT9d2NsgNLfZ2dyJ2+U5+CDSsgTNcOViVqMFJ7lbfl2dWW5kTGZz8ydf6MbuGIuDVsTb/z/bIdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021663; c=relaxed/simple;
	bh=ps8TnDc3mwOIZCMqh0n9tjAgd+5Ba8NAdAEEqvpYOjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ee4eVq/jT2HSQSG7xDlSvH6arFJQKVn2IcqNS9mDqoPULB5Z0l1GtU7MfGk+i4Nynr4YbcVW+yY1tZM5dhLr33nqtJPEx3e4QtH9L69ntP+X5Z7VHXp3h/jILis/oOHmCX6tVBVashIfCNL9tUJzWNmmEmeofdUb753cUhN3/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bTC9K2yQlzYWw;
	Fri, 27 Jun 2025 12:54:13 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bTC9J29nszy7b;
	Fri, 27 Jun 2025 12:54:12 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 27 Jun 2025 12:53:53 +0200
Subject: [PATCH v4 1/5] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rk8xx-rst-fun-v4-1-ce05d041b45f@cherry.de>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
In-Reply-To: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC allows to configure its reset/restart behavior whenever
the PMIC is reset either programmatically or via some external pins
(e.g. PWRCTRL or RESETB).

The following modes exist:
 - 0; restart PMU,
 - 1; reset all power off reset registers and force state to switch to
   ACTIVE mode,
 - 2; same as mode 1 and also pull RESETB pin down for 5ms,

For example, some hardware may require a full restart (mode 0) in order
to function properly as regulators are shortly interrupted in this mode.

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../devicetree/bindings/mfd/rockchip,rk806.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..eb5bca31948ef0d39c46025d0cca65b8b4105a50 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,27 @@ properties:
 
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
+      The following modes are supported
+
+      - 0; restart PMU,
+      - 1; reset all power off reset registers and force state to
+        switch to ACTIVE mode,
+      - 2; same as mode 1 and also pull RESETB pin down for 5ms,
+
+      For example, some hardware may require a full restart (mode 0)
+      in order to function properly as regulators are shortly
+      interrupted in this mode.
+
   vcc1-supply:
     description:
       The input supply for dcdc-reg1.

-- 
2.50.0

