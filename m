Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EBF1A8409
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206435; cv=none; b=EsCxBLXx7k43fFpRTquWEOvPvpjY3WN4izhiJMo1+1T6PUuiuHRCU+BHbhNRymFLXQF3PNCTw2MbgyKQjPTtZWa3zdw5YpD7Yk+R5zQX/t/bm/cYw2oEln+5BSpToA2txJzSqZ6WFLQhusvpT0BDAujcLN0aHZ++mjAbZOAUN9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206435; c=relaxed/simple;
	bh=7Uk5zhbkQEWDc1iudIrb85hWUkOfY8K0hYE5Hfchnmc=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=HLELgTVg+lndIqAfAPpTuvA/la1owi1CYl83uWxB1KRxP2v5kyXBxGAIL22XPIpkvVdP3pqYcI9vmvk2gK63i9p/h0jbglLlrGYoZfr5nYM1F+8OkvCZrprKige+x/dOZB2Mb1wisuG+pfldv8aWIrrqXYN55wajyIu5YKMk7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3Sfp6Z+c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9jSbV6FP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3Sfp6Z+c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9jSbV6FP"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=ZrYaRLgLsGDJwJzgM3HHjOpVuFshy/sKZ4sIpsUaHvI=;
	b=3Sfp6Z+ceHowitH849daMjqldLek5FIFPrfoRX2DFjSeHuFsSfhu9Fuu7UWDzHENxBMmrz
	9xXXH9KJ3aFeuFSiO2Znz0q3LOQXJAYSF6aZF9x42PSN6MfF+R3qlk8DtbitIgr98ND8ai
	ssMZCyudqZrriJrdhL2yjNaZWqb1z6+Tm5+nGLKHoc2L+qG8+fMFID2sx26z8y4xzZPDFS
	Em95YF0W72GDMJcKAk2GIbWLO7bxAHKvW8bQSQkDAAZdKBhx4JSMvn3w7r7gnhz17enrN9
	q2kjTp8PW7jrCQYT9mB3YKt8vtbl+UKEiuPVICfkF7gtanLsnndOWCgMX7w2IA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=ZrYaRLgLsGDJwJzgM3HHjOpVuFshy/sKZ4sIpsUaHvI=;
	b=9jSbV6FPjbLX3zXpz6SykfLYiKgJBsoVmvK6xEZHZmqwa6efDdG9PFhJJuU2PxpiVSyjw1
	Pvwg0gUSGStKRNCw==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/clocksource for v6.16-rc1
References: <174820637262.238682.1985899398053030312.tglx@xen13>
Message-ID: <174820638317.238682.3878315364921093216.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:47 +0200 (CEST)

Linus,

please pull the latest timers/clocksource branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksour=
ce-2025-05-25

up to:  29857e6f4e30: Merge tag 'timers-v6.16-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/daniel.lezcano/linux into timers/drivers


Updates for clocksource/clockevent drivers:

 - The final conversion of text formatted device tree binding to schemas.

 - A new driver fot the System Timer Module on S32G NXP SoCs.

 - A new driver fot the Econet HPT timer

 - The usual improvements and device tree binding updates


Thanks,

	tglx

------------------>
Arnd Bergmann (1):
      clocksource/drivers/atmel_tcb: Fix kconfig dependency

Caleb James DeLisle (2):
      dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
      clocksource/drivers: Add EcoNet Timer HPT driver

Daniel Lezcano (2):
      dt-bindings: timer: Add NXP System Timer Module
      clocksource/drivers/nxp-timer: Add the System Timer Module for the s32g=
x platforms

Darshan Prajapati (1):
      dt-bindings: timer: Add ESWIN EIC7700 CLINT

Inochi Amaoto (1):
      dt-bindings: timer: Add Sophgo SG2044 ACLINT timer

J. Neusch=C3=A4fer (1):
      dt-bindings: timer: Convert fsl,gtm to YAML

Lad Prabhakar (2):
      dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
      clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support

Pohsun Su (2):
      clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support
      clocksource/drivers/timer-tegra186: Fix watchdog self-pinging

Rob Herring (Arm) (18):
      dt-bindings: timer: Convert marvell,orion-timer to DT schema
      dt-bindings: timer: Convert csky,mptimer to DT schema
      dt-bindings: timer: Convert csky,gx6605s-timer to DT schema
      dt-bindings: timer: Convert cnxt,cx92755-timer to DT schema
      dt-bindings: timer: Convert arm,mps2-timer to DT schema
      dt-bindings: timer: Convert altr,timer-1.0 to DT schema
      dt-bindings: timer: Convert cirrus,clps711x-timer to DT schema
      dt-bindings: timer: Convert ezchip,nps400-timer to DT schema
      dt-bindings: timer: Convert img,pistachio-gptimer to DT schema
      dt-bindings: timer: Convert jcore,pit to DT schema
      dt-bindings: timer: Convert lsi,zevio-timer to DT schema
      dt-bindings: timer: Convert snps,archs-gfrc to DT schema
      dt-bindings: timer: Convert snps,archs-rtc to DT schema
      dt-bindings: timer: Convert snps,arc-timer to DT schema
      dt-bindings: timer: Convert socionext,milbeaut-timer to DT schema
      dt-bindings: timer: Convert st,spear-timer to DT schema
      dt-bindings: timer: Convert ti,keystone-timer to DT schema
      dt-bindings: timer: Convert marvell,armada-370-timer to DT schema

robelin (1):
      clocksource/drivers/timer-tegra186: Remove unused bits


 .../devicetree/bindings/timer/altr,timer-1.0.txt   |  18 -
 .../devicetree/bindings/timer/altr,timer-1.0.yaml  |  39 ++
 .../devicetree/bindings/timer/arm,mps2-timer.txt   |  28 --
 .../devicetree/bindings/timer/arm,mps2-timer.yaml  |  49 ++
 .../bindings/timer/cirrus,clps711x-timer.txt       |  29 --
 .../bindings/timer/cirrus,clps711x-timer.yaml      |  45 ++
 .../bindings/timer/cnxt,cx92755-timer.yaml         |  49 ++
 .../bindings/timer/csky,gx6605s-timer.txt          |  42 --
 .../bindings/timer/csky,gx6605s-timer.yaml         |  40 ++
 .../devicetree/bindings/timer/csky,mptimer.txt     |  42 --
 .../devicetree/bindings/timer/csky,mptimer.yaml    |  46 ++
 .../devicetree/bindings/timer/digicolor-timer.txt  |  18 -
 .../bindings/timer/econet,en751221-timer.yaml      |  80 ++++
 .../bindings/timer/ezchip,nps400-timer.yaml        |  45 ++
 .../bindings/timer/ezchip,nps400-timer0.txt        |  17 -
 .../bindings/timer/ezchip,nps400-timer1.txt        |  15 -
 .../devicetree/bindings/timer/fsl,gtm.txt          |  30 --
 .../devicetree/bindings/timer/fsl,gtm.yaml         |  83 ++++
 .../bindings/timer/img,pistachio-gptimer.txt       |  28 --
 .../bindings/timer/img,pistachio-gptimer.yaml      |  69 +++
 .../devicetree/bindings/timer/jcore,pit.txt        |  24 -
 .../devicetree/bindings/timer/jcore,pit.yaml       |  43 ++
 .../devicetree/bindings/timer/lsi,zevio-timer.txt  |  33 --
 .../devicetree/bindings/timer/lsi,zevio-timer.yaml |  56 +++
 .../bindings/timer/marvell,armada-370-timer.yaml   |  88 ++++
 .../bindings/timer/marvell,armada-370-xp-timer.txt |  44 --
 .../bindings/timer/marvell,orion-timer.txt         |  16 -
 .../bindings/timer/marvell,orion-timer.yaml        |  43 ++
 .../devicetree/bindings/timer/nxp,s32g2-stm.yaml   |  64 +++
 .../devicetree/bindings/timer/renesas,ostm.yaml    |  12 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/timer/snps,arc-timer.txt   |  27 --
 .../devicetree/bindings/timer/snps,arc-timer.yaml  |  45 ++
 .../devicetree/bindings/timer/snps,archs-gfrc.txt  |  14 -
 .../devicetree/bindings/timer/snps,archs-gfrc.yaml |  30 ++
 .../devicetree/bindings/timer/snps,archs-rtc.txt   |  14 -
 .../devicetree/bindings/timer/snps,archs-rtc.yaml  |  30 ++
 .../bindings/timer/socionext,milbeaut-timer.txt    |  17 -
 .../bindings/timer/socionext,milbeaut-timer.yaml   |  40 ++
 .../devicetree/bindings/timer/st,spear-timer.txt   |  16 -
 .../devicetree/bindings/timer/st,spear-timer.yaml  |  36 ++
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |   1 +
 .../bindings/timer/ti,keystone-timer.txt           |  29 --
 .../bindings/timer/ti,keystone-timer.yaml          |  63 +++
 drivers/clocksource/Kconfig                        |  20 +-
 drivers/clocksource/Makefile                       |   2 +
 drivers/clocksource/renesas-ostm.c                 |   4 +-
 drivers/clocksource/timer-econet-en751221.c        | 216 +++++++++
 drivers/clocksource/timer-nxp-stm.c                | 495 +++++++++++++++++++=
++
 drivers/clocksource/timer-tegra186.c               | 100 +++--
 50 files changed, 1886 insertions(+), 549 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/altr,timer-1.0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/altr,timer-1.0.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/timer/cirrus,clps711x-t=
imer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/cirrus,clps711x-t=
imer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/cnxt,cx92755-time=
r.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-time=
r.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-time=
r.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/digicolor-timer.t=
xt
 create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-t=
imer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-tim=
er.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-tim=
er0.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-tim=
er1.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.txt
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gpt=
imer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gpt=
imer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.txt
 create mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/lsi,zevio-timer.t=
xt
 create mode 100644 Documentation/devicetree/bindings/timer/lsi,zevio-timer.y=
aml
 create mode 100644 Documentation/devicetree/bindings/timer/marvell,armada-37=
0-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/marvell,armada-37=
0-xp-timer.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/marvell,orion-tim=
er.txt
 create mode 100644 Documentation/devicetree/bindings/timer/marvell,orion-tim=
er.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.t=
xt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeau=
t-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeau=
t-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/st,spear-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/st,spear-timer.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,keystone-timer=
.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ti,keystone-timer=
.yaml
 create mode 100644 drivers/clocksource/timer-econet-en751221.c
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

diff --git a/Documentation/devicetree/bindings/timer/altr,timer-1.0.txt b/Doc=
umentation/devicetree/bindings/timer/altr,timer-1.0.txt
deleted file mode 100644
index e698e3488735..000000000000
--- a/Documentation/devicetree/bindings/timer/altr,timer-1.0.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Altera Timer
-
-Required properties:
-
-- compatible : should be "altr,timer-1.0"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : Should contain the timer interrupt number
-- clock-frequency : The frequency of the clock that drives the counter, in H=
z.
-
-Example:
-
-timer {
-	compatible =3D "altr,timer-1.0";
-	reg =3D <0x00400000 0x00000020>;
-	interrupt-parent =3D <&cpu>;
-	interrupts =3D <11>;
-	clock-frequency =3D <125000000>;
-};
diff --git a/Documentation/devicetree/bindings/timer/altr,timer-1.0.yaml b/Do=
cumentation/devicetree/bindings/timer/altr,timer-1.0.yaml
new file mode 100644
index 000000000000..576260c72d42
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/altr,timer-1.0.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/altr,timer-1.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Timer
+
+maintainers:
+  - Dinh Nguyen <dinguyen@kernel.org>
+
+properties:
+  compatible:
+    const: altr,timer-1.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    description: Frequency of the clock that drives the counter, in Hz.
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
+    timer@400000 {
+        compatible =3D "altr,timer-1.0";
+        reg =3D <0x00400000 0x00000020>;
+        interrupts =3D <11>;
+        clock-frequency =3D <125000000>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt b/Doc=
umentation/devicetree/bindings/timer/arm,mps2-timer.txt
deleted file mode 100644
index 48f84d74edde..000000000000
--- a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-ARM MPS2 timer
-
-The MPS2 platform has simple general-purpose 32 bits timers.
-
-Required properties:
-- compatible	: Should be "arm,mps2-timer"
-- reg		: Address and length of the register set
-- interrupts	: Reference to the timer interrupt
-
-Required clocking property, have to be one of:
-- clocks	  : The input clock of the timer
-- clock-frequency : The rate in HZ in input of the ARM MPS2 timer
-
-Examples:
-
-timer1: mps2-timer@40000000 {
-	compatible =3D "arm,mps2-timer";
-	reg =3D <0x40000000 0x1000>;
-	interrupts =3D <8>;
-	clocks =3D <&sysclk>;
-};
-
-timer2: mps2-timer@40001000 {
-	compatible =3D "arm,mps2-timer";
-	reg =3D <0x40001000 0x1000>;
-	interrupts =3D <9>;
-	clock-frequency =3D <25000000>;
-};
diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml b/Do=
cumentation/devicetree/bindings/timer/arm,mps2-timer.yaml
new file mode 100644
index 000000000000..64c6aedd7e8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm,mps2-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM MPS2 timer
+
+maintainers:
+  - Vladimir Murzin <vladimir.murzin@arm.com>
+
+description:
+  The MPS2 platform has simple general-purpose 32 bits timers.
+
+properties:
+  compatible:
+    const: arm,mps2-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Rate in Hz of the timer input clock
+
+oneOf:
+  - required: [clocks]
+  - required: [clock-frequency]
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
+    timer@40000000 {
+        compatible =3D "arm,mps2-timer";
+        reg =3D <0x40000000 0x1000>;
+        interrupts =3D <8>;
+        clocks =3D <&sysclk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.tx=
t b/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.txt
deleted file mode 100644
index d4c62e7b1714..000000000000
--- a/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Cirrus Logic CLPS711X Timer Counter
-
-Required properties:
-- compatible: Shall contain "cirrus,ep7209-timer".
-- reg       : Address and length of the register set.
-- interrupts: The interrupt number of the timer.
-- clocks    : phandle of timer reference clock.
-
-Note: Each timer should have an alias correctly numbered in "aliases" node.
-
-Example:
-	aliases {
-		timer0 =3D &timer1;
-		timer1 =3D &timer2;
-	};
-
-	timer1: timer@80000300 {
-		compatible =3D "cirrus,ep7312-timer", "cirrus,ep7209-timer";
-		reg =3D <0x80000300 0x4>;
-		interrupts =3D <8>;
-		clocks =3D <&clks 5>;
-	};
-
-	timer2: timer@80000340 {
-		compatible =3D "cirrus,ep7312-timer", "cirrus,ep7209-timer";
-		reg =3D <0x80000340 0x4>;
-		interrupts =3D <9>;
-		clocks =3D <&clks 6>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.ya=
ml b/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.yaml
new file mode 100644
index 000000000000..507b777e16bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/cirrus,clps711x-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CLPS711X Timer Counter
+
+maintainers:
+  - Alexander Shiyan <shc_work@mail.ru>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - cirrus,ep7312-timer
+          - const: cirrus,ep7209-timer
+      - const: cirrus,ep7209-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@80000300 {
+        compatible =3D "cirrus,ep7312-timer", "cirrus,ep7209-timer";
+        reg =3D <0x80000300 0x4>;
+        interrupts =3D <8>;
+        clocks =3D <&clks 5>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml =
b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
new file mode 100644
index 000000000000..8f1a5af32a36
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cnxt,cx92755-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor SoCs Timer Controller
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+properties:
+  compatible:
+    const: cnxt,cx92755-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Contains 8 interrupts, one for each timer
+    items:
+      - description: interrupt for timer 0
+      - description: interrupt for timer 1
+      - description: interrupt for timer 2
+      - description: interrupt for timer 3
+      - description: interrupt for timer 4
+      - description: interrupt for timer 5
+      - description: interrupt for timer 6
+      - description: interrupt for timer 7
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@f0000fc0 {
+      compatible =3D "cnxt,cx92755-timer";
+      reg =3D <0xf0000fc0 0x40>;
+      interrupts =3D <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
+      clocks =3D <&main_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt b=
/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
deleted file mode 100644
index 6b04344f4bea..000000000000
--- a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-gx6605s SOC Timer
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The timer is used in gx6605s soc as system timer and the driver
-contain clk event and clk source.
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-timer node bindings definition
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-
-	Description: Describes gx6605s SOC timer
-
-	PROPERTIES
-
-	- compatible
-		Usage: required
-		Value type: <string>
-		Definition: must be "csky,gx6605s-timer"
-	- reg
-		Usage: required
-		Value type: <u32 u32>
-		Definition: <phyaddr size> in soc from cpu view
-	- clocks
-		Usage: required
-		Value type: phandle + clock specifier cells
-		Definition: must be input clk node
-	- interrupt
-		Usage: required
-		Value type: <u32>
-		Definition: must be timer irq num defined by soc
-
-Examples:
----------
-
-	timer0: timer@20a000 {
-		compatible =3D "csky,gx6605s-timer";
-		reg =3D <0x0020a000 0x400>;
-		clocks =3D <&dummy_apb_clk>;
-		interrupts =3D <10>;
-		interrupt-parent =3D <&intc>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml =
b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml
new file mode 100644
index 000000000000..888fc8113996
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/csky,gx6605s-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: gx6605s SOC Timer
+
+maintainers:
+  - Guo Ren <guoren@kernel.org>
+
+properties:
+  compatible:
+    const: csky,gx6605s-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@20a000 {
+        compatible =3D "csky,gx6605s-timer";
+        reg =3D <0x0020a000 0x400>;
+        clocks =3D <&dummy_apb_clk>;
+        interrupts =3D <10>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/Docum=
entation/devicetree/bindings/timer/csky,mptimer.txt
deleted file mode 100644
index f5c7e99cf52b..000000000000
--- a/Documentation/devicetree/bindings/timer/csky,mptimer.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-C-SKY Multi-processors Timer
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-
-C-SKY multi-processors timer is designed for C-SKY SMP system and the
-regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
-
- - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
- - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
- - PTIM_CCVR "cr<3, 14>" Current counter value reg.
- - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-timer node bindings definition
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-
-	Description: Describes SMP timer
-
-	PROPERTIES
-
-	- compatible
-		Usage: required
-		Value type: <string>
-		Definition: must be "csky,mptimer"
-	- clocks
-		Usage: required
-		Value type: <node>
-		Definition: must be input clk node
-	- interrupts
-		Usage: required
-		Value type: <u32>
-		Definition: must be timer irq num defined by soc
-
-Examples:
----------
-
-	timer: timer {
-		compatible =3D "csky,mptimer";
-		clocks =3D <&dummy_apb_clk>;
-		interrupts =3D <16>;
-		interrupt-parent =3D <&intc>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.yaml b/Docu=
mentation/devicetree/bindings/timer/csky,mptimer.yaml
new file mode 100644
index 000000000000..12cc5282c8f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/csky,mptimer.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/csky,mptimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: C-SKY Multi-processors Timer
+
+maintainers:
+  - Flavio Suligoi <f.suligoi@asem.it>
+  - Guo Ren <guoren@kernel.org>
+
+description: |
+  C-SKY multi-processors timer is designed for C-SKY SMP system and the regs=
 are
+  accessed by cpu co-processor 4 registers with mtcr/mfcr.
+
+   - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
+   - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
+   - PTIM_CCVR "cr<3, 14>" Current counter value reg.
+   - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
+
+properties:
+  compatible:
+    items:
+      - const: csky,mptimer
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer {
+        compatible =3D "csky,mptimer";
+        clocks =3D <&dummy_apb_clk>;
+        interrupts =3D <16>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/digicolor-timer.txt b/Do=
cumentation/devicetree/bindings/timer/digicolor-timer.txt
deleted file mode 100644
index d1b659bbc29f..000000000000
--- a/Documentation/devicetree/bindings/timer/digicolor-timer.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Conexant Digicolor SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "cnxt,cx92755-timer"
-- reg : Specifies base physical address and size of the "Agent Communication"
-  timer registers
-- interrupts : Contains 8 interrupts, one for each timer
-- clocks: phandle to the main clock
-
-Example:
-
-	timer@f0000fc0 {
-		compatible =3D "cnxt,cx92755-timer";
-		reg =3D <0xf0000fc0 0x40>;
-		interrupts =3D <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
-		clocks =3D <&main_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.ya=
ml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
new file mode 100644
index 000000000000..c1e7c2b6afde
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/econet,en751221-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 High Precision Timer (HPT)
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The EcoNet High Precision Timer (HPT) is a timer peripheral found in vario=
us
+  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per=
-VPE
+  count/compare registers and a per-CPU control register, with a single inte=
rrupt
+  line using a percpu-devid interrupt mechanism.
+
+properties:
+  compatible:
+    oneOf:
+      - const: econet,en751221-timer
+      - items:
+          - const: econet,en751627-timer
+          - const: econet,en751221-timer
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+    description: A percpu-devid timer interrupt shared across CPUs.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: econet,en751627-timer
+    then:
+      properties:
+        reg:
+          items:
+            - description: VPE timers 0 and 1
+            - description: VPE timers 2 and 3
+    else:
+      properties:
+        reg:
+          items:
+            - description: VPE timers 0 and 1
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1fbf0400 {
+        compatible =3D "econet,en751627-timer", "econet,en751221-timer";
+        reg =3D <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
+        interrupt-parent =3D <&intc>;
+        interrupts =3D <30>;
+        clocks =3D <&hpt_clock>;
+    };
+  - |
+    timer@1fbf0400 {
+        compatible =3D "econet,en751221-timer";
+        reg =3D <0x1fbe0400 0x100>;
+        interrupt-parent =3D <&intc>;
+        interrupts =3D <30>;
+        clocks =3D <&hpt_clock>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml=
 b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml
new file mode 100644
index 000000000000..317c5010c4c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ezchip,nps400-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EZChip NPS400 Timers
+
+maintainers:
+  - Noam Camus <noamca@mellanox.com>
+
+properties:
+  compatible:
+    enum:
+      - ezchip,nps400-timer0
+      - ezchip,nps400-timer1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ezchip,nps400-timer0
+    then:
+      required: [ interrupts ]
+
+examples:
+  - |
+    timer {
+        compatible =3D "ezchip,nps400-timer0";
+        interrupts =3D <3>;
+        clocks =3D <&sysclk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt=
 b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
deleted file mode 100644
index e3cfce8fecc5..000000000000
--- a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-NPS Network Processor
-
-Required properties:
-
-- compatible :	should be "ezchip,nps400-timer0"
-
-Clocks required for compatible =3D "ezchip,nps400-timer0":
-- interrupts : The interrupt of the first timer
-- clocks : Must contain a single entry describing the clock input
-
-Example:
-
-timer {
-	compatible =3D "ezchip,nps400-timer0";
-	interrupts =3D <3>;
-	clocks =3D <&sysclk>;
-};
diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt=
 b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
deleted file mode 100644
index c0ab4190b8fb..000000000000
--- a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-NPS Network Processor
-
-Required properties:
-
-- compatible :	should be "ezchip,nps400-timer1"
-
-Clocks required for compatible =3D "ezchip,nps400-timer1":
-- clocks : Must contain a single entry describing the clock input
-
-Example:
-
-timer {
-	compatible =3D "ezchip,nps400-timer1";
-	clocks =3D <&sysclk>;
-};
diff --git a/Documentation/devicetree/bindings/timer/fsl,gtm.txt b/Documentat=
ion/devicetree/bindings/timer/fsl,gtm.txt
deleted file mode 100644
index fc1c571f7412..000000000000
--- a/Documentation/devicetree/bindings/timer/fsl,gtm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Freescale General-purpose Timers Module
-
-Required properties:
-  - compatible : should be
-    "fsl,<chip>-gtm", "fsl,gtm" for SOC GTMs
-    "fsl,<chip>-qe-gtm", "fsl,qe-gtm", "fsl,gtm" for QE GTMs
-    "fsl,<chip>-cpm2-gtm", "fsl,cpm2-gtm", "fsl,gtm" for CPM2 GTMs
-  - reg : should contain gtm registers location and length (0x40).
-  - interrupts : should contain four interrupts.
-  - clock-frequency : specifies the frequency driving the timer.
-
-Example:
-
-timer@500 {
-	compatible =3D "fsl,mpc8360-gtm", "fsl,gtm";
-	reg =3D <0x500 0x40>;
-	interrupts =3D <90 8 78 8 84 8 72 8>;
-	interrupt-parent =3D <&ipic>;
-	/* filled by u-boot */
-	clock-frequency =3D <0>;
-};
-
-timer@440 {
-	compatible =3D "fsl,mpc8360-qe-gtm", "fsl,qe-gtm", "fsl,gtm";
-	reg =3D <0x440 0x40>;
-	interrupts =3D <12 13 14 15>;
-	interrupt-parent =3D <&qeic>;
-	/* filled by u-boot */
-	clock-frequency =3D <0>;
-};
diff --git a/Documentation/devicetree/bindings/timer/fsl,gtm.yaml b/Documenta=
tion/devicetree/bindings/timer/fsl,gtm.yaml
new file mode 100644
index 000000000000..1f35f1ee0be2
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,gtm.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/fsl,gtm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale General-purpose Timers Module
+
+maintainers:
+  - J. Neusch=C3=A4fer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    oneOf:
+      # for SoC GTMs
+      - items:
+          - enum:
+              - fsl,mpc8308-gtm
+              - fsl,mpc8313-gtm
+              - fsl,mpc8315-gtm
+              - fsl,mpc8360-gtm
+          - const: fsl,gtm
+
+      # for QE GTMs
+      - items:
+          - enum:
+              - fsl,mpc8360-qe-gtm
+              - fsl,mpc8569-qe-gtm
+          - const: fsl,qe-gtm
+          - const: fsl,gtm
+
+      # for CPM2 GTMs (no known examples)
+      - items:
+          # - enum:
+          #     - fsl,<chip>-cpm2-gtm
+          - const: fsl,cpm2-gtm
+          - const: fsl,gtm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Interrupt for timer 1 (e.g. GTM1 or GTM5)
+      - description: Interrupt for timer 2 (e.g. GTM2 or GTM6)
+      - description: Interrupt for timer 3 (e.g. GTM3 or GTM7)
+      - description: Interrupt for timer 4 (e.g. GTM4 or GTM8)
+
+  clock-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    timer@500 {
+        compatible =3D "fsl,mpc8360-gtm", "fsl,gtm";
+        reg =3D <0x500 0x40>;
+        interrupts =3D <90 IRQ_TYPE_LEVEL_LOW>,
+                     <78 IRQ_TYPE_LEVEL_LOW>,
+                     <84 IRQ_TYPE_LEVEL_LOW>,
+                     <72 IRQ_TYPE_LEVEL_LOW>;
+        /* filled by u-boot */
+        clock-frequency =3D <0>;
+    };
+
+  - |
+    timer@440 {
+        compatible =3D "fsl,mpc8360-qe-gtm", "fsl,qe-gtm", "fsl,gtm";
+        reg =3D <0x440 0x40>;
+        interrupts =3D <12>, <13>, <14>, <15>;
+        /* filled by u-boot */
+        clock-frequency =3D <0>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.tx=
t b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
deleted file mode 100644
index 7afce80bf6a0..000000000000
--- a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Pistachio general-purpose timer based clocksource
-
-Required properties:
- - compatible: "img,pistachio-gptimer".
- - reg: Address range of the timer registers.
- - interrupts: An interrupt for each of the four timers
- - clocks: Should contain a clock specifier for each entry in clock-names
- - clock-names: Should contain the following entries:
-                "sys", interface clock
-                "slow", slow counter clock
-                "fast", fast counter clock
- - img,cr-periph: Must contain a phandle to the peripheral control
-		  syscon node.
-
-Example:
-	timer: timer@18102000 {
-		compatible =3D "img,pistachio-gptimer";
-		reg =3D <0x18102000 0x100>;
-		interrupts =3D <GIC_SHARED 60 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SHARED 61 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SHARED 62 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SHARED 63 IRQ_TYPE_LEVEL_HIGH>;
-		clocks =3D <&clk_periph PERIPH_CLK_COUNTER_FAST>,
-		         <&clk_periph PERIPH_CLK_COUNTER_SLOW>,
-			 <&cr_periph SYS_CLK_TIMER>;
-		clock-names =3D "fast", "slow", "sys";
-		img,cr-periph =3D <&cr_periph>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.ya=
ml b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.yaml
new file mode 100644
index 000000000000..a8654bcf68a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/img,pistachio-gptimer.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/img,pistachio-gptimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pistachio general-purpose timer
+
+maintainers:
+  - Ezequiel Garcia <ezequiel.garcia@imgtec.com>
+
+properties:
+  compatible:
+    const: img,pistachio-gptimer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Timer0 interrupt
+      - description: Timer1 interrupt
+      - description: Timer2 interrupt
+      - description: Timer3 interrupt
+
+  clocks:
+    items:
+      - description: Fast counter clock
+      - description: Slow counter clock
+      - description: Interface clock
+
+  clock-names:
+    items:
+      - const: fast
+      - const: slow
+      - const: sys
+
+  img,cr-periph:
+    description: Peripheral control syscon phandle
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - img,cr-periph
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/clock/pistachio-clk.h>
+
+    timer@18102000 {
+        compatible =3D "img,pistachio-gptimer";
+        reg =3D <0x18102000 0x100>;
+        interrupts =3D <GIC_SHARED 60 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 61 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 62 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 63 IRQ_TYPE_LEVEL_HIGH>;
+        clocks =3D <&clk_periph PERIPH_CLK_COUNTER_FAST>,
+                 <&clk_periph PERIPH_CLK_COUNTER_SLOW>,
+                 <&cr_periph SYS_CLK_TIMER>;
+        clock-names =3D "fast", "slow", "sys";
+        img,cr-periph =3D <&cr_periph>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/jcore,pit.txt b/Document=
ation/devicetree/bindings/timer/jcore,pit.txt
deleted file mode 100644
index af5dd35469d7..000000000000
--- a/Documentation/devicetree/bindings/timer/jcore,pit.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-J-Core Programmable Interval Timer and Clocksource
-
-Required properties:
-
-- compatible: Must be "jcore,pit".
-
-- reg: Memory region(s) for timer/clocksource registers. For SMP,
-  there should be one region per cpu, indexed by the sequential,
-  zero-based hardware cpu number.
-
-- interrupts: An interrupt to assign for the timer. The actual pit
-  core is integrated with the aic and allows the timer interrupt
-  assignment to be programmed by software, but this property is
-  required in order to reserve an interrupt number that doesn't
-  conflict with other devices.
-
-
-Example:
-
-timer@200 {
-	compatible =3D "jcore,pit";
-	reg =3D < 0x200 0x30 0x500 0x30 >;
-	interrupts =3D < 0x48 >;
-};
diff --git a/Documentation/devicetree/bindings/timer/jcore,pit.yaml b/Documen=
tation/devicetree/bindings/timer/jcore,pit.yaml
new file mode 100644
index 000000000000..9e6e25b75293
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/jcore,pit.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/jcore,pit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: J-Core Programmable Interval Timer and Clocksource
+
+maintainers:
+  - Rich Felker <dalias@libc.org>
+
+properties:
+  compatible:
+    const: jcore,pit
+
+  reg:
+    description:
+      Memory region(s) for timer/clocksource registers. For SMP, there shoul=
d be
+      one region per cpu, indexed by the sequential, zero-based hardware cpu
+      number.
+
+  interrupts:
+    description:
+      An interrupt to assign for the timer. The actual pit core is integrated
+      with the aic and allows the timer interrupt assignment to be programme=
d by
+      software, but this property is required in order to reserve an interru=
pt
+      number that doesn't conflict with other devices.
+    maxItems: 1
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
+    timer@200 {
+        compatible =3D "jcore,pit";
+        reg =3D <0x200 0x30 0x500 0x30>;
+        interrupts =3D <0x48>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/lsi,zevio-timer.txt b/Do=
cumentation/devicetree/bindings/timer/lsi,zevio-timer.txt
deleted file mode 100644
index b2d07ad90e9a..000000000000
--- a/Documentation/devicetree/bindings/timer/lsi,zevio-timer.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-TI-NSPIRE timer
-
-Required properties:
-
-- compatible : should be "lsi,zevio-timer".
-- reg : The physical base address and size of the timer (always first).
-- clocks: phandle to the source clock.
-
-Optional properties:
-
-- interrupts : The interrupt number of the first timer.
-- reg : The interrupt acknowledgement registers
-	(always after timer base address)
-
-If any of the optional properties are not given, the timer is added as a
-clock-source only.
-
-Example:
-
-timer {
-	compatible =3D "lsi,zevio-timer";
-	reg =3D <0x900D0000 0x1000>, <0x900A0020 0x8>;
-	interrupts =3D <19>;
-	clocks =3D <&timer_clk>;
-};
-
-Example (no clock-events):
-
-timer {
-	compatible =3D "lsi,zevio-timer";
-	reg =3D <0x900D0000 0x1000>;
-	clocks =3D <&timer_clk>;
-};
diff --git a/Documentation/devicetree/bindings/timer/lsi,zevio-timer.yaml b/D=
ocumentation/devicetree/bindings/timer/lsi,zevio-timer.yaml
new file mode 100644
index 000000000000..358455d8e7a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/lsi,zevio-timer.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI-NSPIRE timer
+
+maintainers:
+  - Daniel Tang <dt.tangr@gmail.com>
+
+properties:
+  compatible:
+    const: lsi,zevio-timer
+
+  reg:
+    minItems: 1
+    items:
+      - description: Timer registers
+      - description: Interrupt acknowledgement registers (optional)
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - if:
+      required: [ interrupts ]
+    then:
+      properties:
+        reg:
+          minItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@900d0000 {
+        compatible =3D "lsi,zevio-timer";
+        reg =3D <0x900D0000 0x1000>, <0x900A0020 0x8>;
+        interrupts =3D <19>;
+        clocks =3D <&timer_clk>;
+    };
+  - |
+    timer@900d0000 {
+        compatible =3D "lsi,zevio-timer";
+        reg =3D <0x900D0000 0x1000>;
+        clocks =3D <&timer_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/marvell,armada-370-timer=
.yaml b/Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
new file mode 100644
index 000000000000..bc0677fe86eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/marvell,armada-370-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 370, 375, 380 and XP Timers
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: marvell,armada-380-timer
+          - const: marvell,armada-xp-timer
+      - items:
+          - const: marvell,armada-375-timer
+          - const: marvell,armada-370-timer
+      - enum:
+          - marvell,armada-370-timer
+          - marvell,armada-xp-timer
+
+  reg:
+    items:
+      - description: Global timer registers
+      - description: Local/private timer registers
+
+  interrupts:
+    items:
+      - description: Global timer interrupt 0
+      - description: Global timer interrupt 1
+      - description: Global timer interrupt 2
+      - description: Global timer interrupt 3
+      - description: First private timer interrupt
+      - description: Second private timer interrupt
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: nbclk
+      - const: fixed
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,armada-375-timer
+              - marvell,armada-xp-timer
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
+examples:
+  - |
+    timer@20300 {
+        compatible =3D "marvell,armada-xp-timer";
+        reg =3D <0x20300 0x30>, <0x21040 0x30>;
+        interrupts =3D <37>, <38>, <39>, <40>, <5>, <6>;
+        clocks =3D <&coreclk 2>, <&refclk>;
+        clock-names =3D "nbclk", "fixed";
+    };
diff --git a/Documentation/devicetree/bindings/timer/marvell,armada-370-xp-ti=
mer.txt b/Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer=
.txt
deleted file mode 100644
index e9c78ce880e6..000000000000
--- a/Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Marvell Armada 370 and Armada XP Timers
----------------------------------------
-
-Required properties:
-- compatible: Should be one of the following
-              "marvell,armada-370-timer",
-	      "marvell,armada-375-timer",
-	      "marvell,armada-xp-timer".
-- interrupts: Should contain the list of Global Timer interrupts and
-  then local timer interrupts
-- reg: Should contain location and length for timers register. First
-  pair for the Global Timer registers, second pair for the
-  local/private timers.
-
-Clocks required for compatible =3D "marvell,armada-370-timer":
-- clocks : Must contain a single entry describing the clock input
-
-Clocks required for compatibles =3D "marvell,armada-xp-timer",
-				  "marvell,armada-375-timer":
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names : Must include the following entries:
-  "nbclk" (L2/coherency fabric clock),
-  "fixed" (Reference 25 MHz fixed-clock).
-
-Examples:
-
-- Armada 370:
-
-	timer {
-		compatible =3D "marvell,armada-370-timer";
-		reg =3D <0x20300 0x30>, <0x21040 0x30>;
-		interrupts =3D <37>, <38>, <39>, <40>, <5>, <6>;
-		clocks =3D <&coreclk 2>;
-	};
-
-- Armada XP:
-
-	timer {
-		compatible =3D "marvell,armada-xp-timer";
-		reg =3D <0x20300 0x30>, <0x21040 0x30>;
-		interrupts =3D <37>, <38>, <39>, <40>, <5>, <6>;
-		clocks =3D <&coreclk 2>, <&refclk>;
-		clock-names =3D "nbclk", "fixed";
-	};
diff --git a/Documentation/devicetree/bindings/timer/marvell,orion-timer.txt =
b/Documentation/devicetree/bindings/timer/marvell,orion-timer.txt
deleted file mode 100644
index cd1a0c256f94..000000000000
--- a/Documentation/devicetree/bindings/timer/marvell,orion-timer.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Marvell Orion SoC timer
-
-Required properties:
-- compatible: shall be "marvell,orion-timer"
-- reg: base address of the timer register starting with TIMERS CONTROL regis=
ter
-- interrupts: should contain the interrupts for Timer0 and Timer1
-- clocks: phandle of timer reference clock (tclk)
-
-Example:
-	timer: timer {
-		compatible =3D "marvell,orion-timer";
-		reg =3D <0x20300 0x20>;
-		interrupt-parent =3D <&bridge_intc>;
-		interrupts =3D <1>, <2>;
-		clocks =3D <&core_clk 0>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml=
 b/Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml
new file mode 100644
index 000000000000..f973afffa5ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/marvell,orion-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Orion SoC timer
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    const: marvell,orion-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Timer0 interrupt
+      - description: Timer1 interrupt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@20300 {
+        compatible =3D "marvell,orion-timer";
+        reg =3D <0x20300 0x20>;
+        interrupts =3D <1>, <2>;
+        clocks =3D <&core_clk 0>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml b/Doc=
umentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
new file mode 100644
index 000000000000..b44b9794bb85
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,s32g2-stm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The timer is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm
+      - items:
+          - const: nxp,s32g3-stm
+          - const: nxp,s32g2-stm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible =3D "nxp,s32g2-stm";
+        reg =3D <0x4011c000 0x3000>;
+        interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks =3D <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+        clock-names =3D "counter", "module", "register";
+    };
diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Docu=
mentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..0983c1efec80 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
=20
@@ -54,12 +55,11 @@ required:
 if:
   properties:
     compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-ostm
-          - renesas,r9a07g044-ostm
-          - renesas,r9a07g054-ostm
-          - renesas,r9a09g057-ostm
+      not:
+        contains:
+          enum:
+            - renesas,r7s72100-ostm
+            - renesas,r7s9210-ostm
 then:
   required:
     - resets
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Docu=
mentation/devicetree/bindings/timer/sifive,clint.yaml
index 653e2e0ca878..d85a1a088b35 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
+              - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
               - starfive,jh7100-clint   # StarFive JH7100
diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer.txt b/Doc=
umentation/devicetree/bindings/timer/snps,arc-timer.txt
deleted file mode 100644
index b02ab0af10ce..000000000000
--- a/Documentation/devicetree/bindings/timer/snps,arc-timer.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Synopsys ARC Local Timer with Interrupt Capabilities
-- Found on all ARC CPUs (ARC700/ARCHS)
-- Can be optionally programmed to interrupt on Limit
-- Two identical copies TIMER0 and TIMER1 exist in ARC cores and historically
-  TIMER0 used as clockevent provider (true for all ARC cores)
-  TIMER1 used for clocksource (mandatory for ARC700, optional for ARC HS)
-
-Required properties:
-
-- compatible : should be "snps,arc-timer"
-- interrupts : single Interrupt going into parent intc
-	       (16 for ARCHS cores, 3 for ARC700 cores)
-- clocks     : phandle to the source clock
-
-Example:
-
-	timer0 {
-		compatible =3D "snps,arc-timer";
-		interrupts =3D <3>;
-		interrupt-parent =3D <&core_intc>;
-		clocks =3D <&core_clk>;
-	};
-
-	timer1 {
-		compatible =3D "snps,arc-timer";
-		clocks =3D <&core_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer.yaml b/Do=
cumentation/devicetree/bindings/timer/snps,arc-timer.yaml
new file mode 100644
index 000000000000..0d1e37db6f8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,arc-timer.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/snps,arc-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys ARC Local Timer
+
+maintainers:
+  - Vineet Gupta <vgupta@synopsys.com>
+
+description: >
+  Synopsys ARC Local Timer with Interrupt Capabilities
+
+    - Found on all ARC CPUs (ARC700/ARCHS)
+    - Can be optionally programmed to interrupt on Limit
+    - Two identical copies TIMER0 and TIMER1 exist in ARC cores and historic=
ally
+      TIMER0 used as clockevent provider (true for all ARC cores)
+      TIMER1 used for clocksource (mandatory for ARC700, optional for ARC HS)
+
+properties:
+  compatible:
+    const: snps,arc-timer
+
+  interrupts:
+    maxItems: 1
+    description: A single timer interrupt going into the parent interrupt co=
ntroller.
+      Use <16> for ARCHS cores, <3> for ARC700 cores.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer0 {
+        compatible =3D "snps,arc-timer";
+        interrupts =3D <3>;
+        clocks =3D <&core_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt b/Do=
cumentation/devicetree/bindings/timer/snps,archs-gfrc.txt
deleted file mode 100644
index b6cd1b3922de..000000000000
--- a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
-- clocksource provider for SMP SoC
-
-Required properties:
-
-- compatible : should be "snps,archs-gfrc"
-- clocks     : phandle to the source clock
-
-Example:
-
-	gfrc {
-		compatible =3D "snps,archs-gfrc";
-		clocks =3D <&core_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.yaml b/D=
ocumentation/devicetree/bindings/timer/snps,archs-gfrc.yaml
new file mode 100644
index 000000000000..fb16f4aba1c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/snps,archs-gfrc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
+
+maintainers:
+  - Vineet Gupta <vgupta@synopsys.com>
+
+properties:
+  compatible:
+    const: snps,archs-gfrc
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer {
+        compatible =3D "snps,archs-gfrc";
+        clocks =3D <&core_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt b/Doc=
umentation/devicetree/bindings/timer/snps,archs-rtc.txt
deleted file mode 100644
index 47bd7a702f3f..000000000000
--- a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Synopsys ARC Free Running 64-bit Local Timer for ARC HS CPUs
-- clocksource provider for UP SoC
-
-Required properties:
-
-- compatible : should be "snps,archs-rtc"
-- clocks     : phandle to the source clock
-
-Example:
-
-	rtc {
-		compatible =3D "snps,arc-rtc";
-		clocks =3D <&core_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.yaml b/Do=
cumentation/devicetree/bindings/timer/snps,archs-rtc.yaml
new file mode 100644
index 000000000000..7478810eb24a
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,archs-rtc.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/snps,archs-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys ARC Free Running 64-bit Local Timer for ARC HS CPUs
+
+maintainers:
+  - Vineet Gupta <vgupta@synopsys.com>
+
+properties:
+  compatible:
+    const: snps,archs-rtc
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+      compatible =3D "snps,archs-rtc";
+      clocks =3D <&core_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer=
.txt b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
deleted file mode 100644
index ac44c4b67530..000000000000
--- a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Milbeaut SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "socionext,milbeaut-timer".
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The interrupt of the first timer.
-- clocks: phandle to the input clk.
-
-Example:
-
-timer {
-	compatible =3D "socionext,milbeaut-timer";
-	reg =3D <0x1e000050 0x20>
-	interrupts =3D <0 91 4>;
-	clocks =3D <&clk 4>;
-};
diff --git a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer=
.yaml b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml
new file mode 100644
index 000000000000..9ab72b762314
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/socionext,milbeaut-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Milbeaut SoCs Timer Controller
+
+maintainers:
+  - Sugaya Taichi <sugaya.taichi@socionext.com>
+
+properties:
+  compatible:
+    const: socionext,milbeaut-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1e000050 {
+        compatible =3D "socionext,milbeaut-timer";
+        reg =3D <0x1e000050 0x20>;
+        interrupts =3D <0 91 4>;
+        clocks =3D <&clk 4>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/st,spear-timer.txt b/Doc=
umentation/devicetree/bindings/timer/st,spear-timer.txt
deleted file mode 100644
index b5238a07da17..000000000000
--- a/Documentation/devicetree/bindings/timer/st,spear-timer.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-* SPEAr ARM Timer
-
-** Timer node required properties:
-
-- compatible : Should be:
-	"st,spear-timer"
-- reg: Address range of the timer registers
-- interrupt: Should contain the timer interrupt number
-
-Example:
-
-	timer@f0000000 {
-		compatible =3D "st,spear-timer";
-		reg =3D <0xf0000000 0x400>;
-		interrupts =3D <2>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/st,spear-timer.yaml b/Do=
cumentation/devicetree/bindings/timer/st,spear-timer.yaml
new file mode 100644
index 000000000000..9f26b5f2b38a
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/st,spear-timer.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/st,spear-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPEAr ARM Timer
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+  - Shiraz Hashim <shiraz.linux.kernel@gmail.com>
+
+properties:
+  compatible:
+    const: st,spear-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+    timer@f0000000 {
+        compatible =3D "st,spear-timer";
+        reg =3D <0xf0000000 0x400>;
+        interrupts =3D <2>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer=
.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index 2e92bcdeb423..4ed30efe4052 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mtimer
+          - sophgo,sg2044-aclint-mtimer
       - const: thead,c900-aclint-mtimer
=20
   reg:
diff --git a/Documentation/devicetree/bindings/timer/ti,keystone-timer.txt b/=
Documentation/devicetree/bindings/timer/ti,keystone-timer.txt
deleted file mode 100644
index d3905a5412b8..000000000000
--- a/Documentation/devicetree/bindings/timer/ti,keystone-timer.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Device tree bindings for Texas instruments Keystone timer
-
-This document provides bindings for the 64-bit timer in the KeyStone
-architecture devices. The timer can be configured as a general-purpose 64-bit
-timer, dual general-purpose 32-bit timers. When configured as dual 32-bit
-timers, each half can operate in conjunction (chain mode) or independently
-(unchained mode) of each other.
-
-It is global timer is a free running up-counter and can generate interrupt
-when the counter reaches preset counter values.
-
-Documentation:
-https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
-
-Required properties:
-
-- compatible : should be "ti,keystone-timer".
-- reg : specifies base physical address and count of the registers.
-- interrupts : interrupt generated by the timer.
-- clocks : the clock feeding the timer clock.
-
-Example:
-
-timer@22f0000 {
-	compatible =3D "ti,keystone-timer";
-	reg =3D <0x022f0000 0x80>;
-	interrupts =3D <GIC_SPI 110 IRQ_TYPE_EDGE_RISING>;
-	clocks =3D <&clktimer15>;
-};
diff --git a/Documentation/devicetree/bindings/timer/ti,keystone-timer.yaml b=
/Documentation/devicetree/bindings/timer/ti,keystone-timer.yaml
new file mode 100644
index 000000000000..1caf5ce64f01
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ti,keystone-timer.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ti,keystone-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Keystone timer
+
+maintainers:
+  - Alexander A. Klimov <grandmaster@al2klimov.de>
+  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
+
+description: >
+  A 64-bit timer in the KeyStone architecture devices. The timer can be
+  configured as a general-purpose 64-bit timer, dual general-purpose 32-bit
+  timers. When configured as dual 32-bit timers, each half can operate in
+  conjunction (chain mode) or independently (unchained mode) of each other.
+
+  It is global timer is a free running up-counter and can generate interrupt
+  when the counter reaches preset counter values.
+
+  Documentation:
+  https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
+
+properties:
+  compatible:
+    const: ti,keystone-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: irq
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: timer
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    timer@22f0000 {
+        compatible =3D "ti,keystone-timer";
+        reg =3D <0x022f0000 0x80>;
+        interrupts =3D <110 IRQ_TYPE_EDGE_RISING>;
+        clocks =3D <&clktimer15>;
+    };
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..645f517a1ac2 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -73,6 +73,14 @@ config DW_APB_TIMER_OF
 	select DW_APB_TIMER
 	select TIMER_OF
=20
+config ECONET_EN751221_TIMER
+	bool "EcoNet EN751221 High Precision Timer" if COMPILE_TEST
+	depends on HAS_IOMEM
+	select CLKSRC_MMIO
+	select TIMER_OF
+	help
+	  Support for CPU timer found on EcoNet MIPS based SoCs.
+
 config FTTMR010_TIMER
 	bool "Faraday Technology timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
@@ -437,8 +445,8 @@ config ATMEL_ST
=20
 config ATMEL_TCB_CLKSRC
 	bool "Atmel TC Block timer driver" if COMPILE_TEST
-	depends on ARM && HAS_IOMEM
-	select TIMER_OF if OF
+	depends on ARM && OF && HAS_IOMEM
+	select TIMER_OF
 	help
 	  Support for Timer Counter Blocks on Atmel SoCs.
=20
@@ -763,4 +771,12 @@ config RALINK_TIMER
 	  Enables support for system tick counter present on
 	  Ralink SoCs RT3352 and MT7620.
=20
+config NXP_STM_TIMER
+	bool "NXP System Timer Module driver"
+	depends on ARCH_S32 || COMPILE_TEST
+	select CLKSRC_MMIO
+	help
+          Enables the support for NXP System Timer Module found in the
+          s32g NXP platform series.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 43ef16a4efa6..205bf3b0a8f3 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_CLKBLD_I8253)	+=3D i8253.o
 obj-$(CONFIG_CLKSRC_MMIO)	+=3D mmio.o
 obj-$(CONFIG_DAVINCI_TIMER)	+=3D timer-davinci.o
 obj-$(CONFIG_DIGICOLOR_TIMER)	+=3D timer-digicolor.o
+obj-$(CONFIG_ECONET_EN751221_TIMER)	+=3D timer-econet-en751221.o
 obj-$(CONFIG_OMAP_DM_TIMER)	+=3D timer-ti-dm.o
 obj-$(CONFIG_OMAP_DM_SYSTIMER)	+=3D timer-ti-dm-systimer.o
 obj-$(CONFIG_DW_APB_TIMER)	+=3D dw_apb_timer.o
@@ -92,3 +93,4 @@ obj-$(CONFIG_GXP_TIMER)			+=3D timer-gxp.o
 obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+=3D timer-loongson1-pwm.o
 obj-$(CONFIG_EP93XX_TIMER)		+=3D timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+=3D timer-ralink.o
+obj-$(CONFIG_NXP_STM_TIMER)		+=3D timer-nxp-stm.o
diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas=
-ostm.c
index 3fcbd02b2483..2089aeaae225 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,6 @@ static int __init ostm_init(struct device_node *np)
=20
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
=20
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -233,7 +232,7 @@ static int __init ostm_probe(struct platform_device *pdev)
 	return ostm_init(dev->of_node);
 }
=20
-static const struct of_device_id ostm_of_table[] =3D {
+static const struct of_device_id __maybe_unused ostm_of_table[] =3D {
 	{ .compatible =3D "renesas,ostm", },
 	{ /* sentinel */ }
 };
@@ -246,4 +245,3 @@ static struct platform_driver ostm_device_driver =3D {
 	},
 };
 builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
-#endif
diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksourc=
e/timer-econet-en751221.c
new file mode 100644
index 000000000000..3b449fdaafee
--- /dev/null
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Timer present on EcoNet EN75xx MIPS based SoCs.
+ *
+ * Copyright (C) 2025 by Caleb James DeLisle <cjd@cjdns.fr>
+ */
+
+#include <linux/io.h>
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/clockchips.h>
+#include <linux/sched_clock.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/cpuhotplug.h>
+#include <linux/clk.h>
+
+#define ECONET_BITS			32
+#define ECONET_MIN_DELTA		0x00001000
+#define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
+/* 34Kc hardware has 1 block and 1004Kc has 2. */
+#define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
+
+static struct {
+	void __iomem	*membase[ECONET_NUM_BLOCKS];
+	u32		freq_hz;
+} econet_timer __ro_after_init;
+
+static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
+
+/* Each memory block has 2 timers, the order of registers is:
+ * CTL, CMR0, CNT0, CMR1, CNT1
+ */
+static inline void __iomem *reg_ctl(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1];
+}
+
+static inline void __iomem *reg_compare(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x04;
+}
+
+static inline void __iomem *reg_count(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x08;
+}
+
+static inline u32 ctl_bit_enabled(u32 timer_n)
+{
+	return 1U << (timer_n & 1);
+}
+
+static inline u32 ctl_bit_pending(u32 timer_n)
+{
+	return 1U << ((timer_n & 1) + 16);
+}
+
+static bool cevt_is_pending(int cpu_id)
+{
+	return ioread32(reg_ctl(cpu_id)) & ctl_bit_pending(cpu_id);
+}
+
+static irqreturn_t cevt_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *dev =3D this_cpu_ptr(&econet_timer_pcpu);
+	int cpu =3D cpumask_first(dev->cpumask);
+
+	/* Each VPE has its own events,
+	 * so this will only happen on spurious interrupt.
+	 */
+	if (!cevt_is_pending(cpu))
+		return IRQ_NONE;
+
+	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
+	dev->event_handler(dev);
+	return IRQ_HANDLED;
+}
+
+static int cevt_set_next_event(ulong delta, struct clock_event_device *dev)
+{
+	u32 next;
+	int cpu;
+
+	cpu =3D cpumask_first(dev->cpumask);
+	next =3D ioread32(reg_count(cpu)) + delta;
+	iowrite32(next, reg_compare(cpu));
+
+	if ((s32)(next - ioread32(reg_count(cpu))) < ECONET_MIN_DELTA / 2)
+		return -ETIME;
+
+	return 0;
+}
+
+static int cevt_init_cpu(uint cpu)
+{
+	struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, cpu);
+	u32 reg;
+
+	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
+
+	reg =3D ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
+	iowrite32(reg, reg_ctl(cpu));
+
+	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+
+	/* Do this last because it synchronously configures the timer */
+	clockevents_config_and_register(cd, econet_timer.freq_hz,
+					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
+
+	return 0;
+}
+
+static u64 notrace sched_clock_read(void)
+{
+	/* Always read from clock zero no matter the CPU */
+	return (u64)ioread32(reg_count(0));
+}
+
+/* Init */
+
+static void __init cevt_dev_init(uint cpu)
+{
+	iowrite32(0, reg_count(cpu));
+	iowrite32(U32_MAX, reg_compare(cpu));
+}
+
+static int __init cevt_init(struct device_node *np)
+{
+	int i, irq, ret;
+
+	irq =3D irq_of_parse_and_map(np, 0);
+	if (irq <=3D 0) {
+		pr_err("%pOFn: irq_of_parse_and_map failed", np);
+		return -EINVAL;
+	}
+
+	ret =3D request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcp=
u);
+
+	if (ret < 0) {
+		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
+		goto err_unmap_irq;
+	}
+
+	for_each_possible_cpu(i) {
+		struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, i);
+
+		cd->rating		=3D 310,
+		cd->features		=3D CLOCK_EVT_FEAT_ONESHOT |
+					  CLOCK_EVT_FEAT_C3STOP |
+					  CLOCK_EVT_FEAT_PERCPU;
+		cd->set_next_event	=3D cevt_set_next_event;
+		cd->irq			=3D irq;
+		cd->cpumask		=3D cpumask_of(i);
+		cd->name		=3D np->name;
+
+		cevt_dev_init(i);
+	}
+
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			  "clockevents/econet/timer:starting",
+			  cevt_init_cpu, NULL);
+	return 0;
+
+err_unmap_irq:
+	irq_dispose_mapping(irq);
+	return ret;
+}
+
+static int __init timer_init(struct device_node *np)
+{
+	int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
+	struct clk *clk;
+	int ret;
+
+	clk =3D of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		pr_err("%pOFn: Failed to get CPU clock from DT %ld\n", np, PTR_ERR(clk));
+		return PTR_ERR(clk);
+	}
+
+	econet_timer.freq_hz =3D clk_get_rate(clk);
+
+	for (int i =3D 0; i < num_blocks; i++) {
+		econet_timer.membase[i] =3D of_iomap(np, i);
+		if (!econet_timer.membase[i]) {
+			pr_err("%pOFn: failed to map register [%d]\n", np, i);
+			return -ENXIO;
+		}
+	}
+
+	/* For clocksource purposes always read clock zero, whatever the CPU */
+	ret =3D clocksource_mmio_init(reg_count(0), np->name,
+				    econet_timer.freq_hz, 301, ECONET_BITS,
+				    clocksource_mmio_readl_up);
+	if (ret) {
+		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
+		return ret;
+	}
+
+	ret =3D cevt_init(np);
+	if (ret < 0)
+		return ret;
+
+	sched_clock_register(sched_clock_read, ECONET_BITS,
+			     econet_timer.freq_hz);
+
+	pr_info("%pOFn: using %u.%03u MHz high precision timer\n", np,
+		econet_timer.freq_hz / 1000000,
+		(econet_timer.freq_hz / 1000) % 1000);
+
+	return 0;
+}
+
+TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-=
nxp-stm.c
new file mode 100644
index 000000000000..d7ccf9001729
--- /dev/null
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ * Copyright 2018,2021-2025 NXP
+ *
+ * NXP System Timer Module:
+ *
+ *  STM supports commonly required system and application software
+ *  timing functions. STM includes a 32-bit count-up timer and four
+ *  32-bit compare channels with a separate interrupt source for each
+ *  channel. The timer is driven by the STM module clock divided by an
+ *  8-bit prescale value (1 to 256). It has ability to stop the timer
+ *  in Debug mode
+ */
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/cpuhotplug.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/sched_clock.h>
+#include <linux/units.h>
+
+#define STM_CR(__base)		(__base)
+
+#define STM_CR_TEN		BIT(0)
+#define STM_CR_FRZ		BIT(1)
+#define STM_CR_CPS_OFFSET	8u
+#define STM_CR_CPS_MASK		GENMASK(15, STM_CR_CPS_OFFSET)
+
+#define STM_CNT(__base)		((__base) + 0x04)
+
+#define STM_CCR0(__base)	((__base) + 0x10)
+#define STM_CCR1(__base)	((__base) + 0x20)
+#define STM_CCR2(__base)	((__base) + 0x30)
+#define STM_CCR3(__base)	((__base) + 0x40)
+
+#define STM_CCR_CEN		BIT(0)
+
+#define STM_CIR0(__base)	((__base) + 0x14)
+#define STM_CIR1(__base)	((__base) + 0x24)
+#define STM_CIR2(__base)	((__base) + 0x34)
+#define STM_CIR3(__base)	((__base) + 0x44)
+
+#define STM_CIR_CIF		BIT(0)
+
+#define STM_CMP0(__base)	((__base) + 0x18)
+#define STM_CMP1(__base)	((__base) + 0x28)
+#define STM_CMP2(__base)	((__base) + 0x38)
+#define STM_CMP3(__base)	((__base) + 0x48)
+
+#define STM_ENABLE_MASK	(STM_CR_FRZ | STM_CR_TEN)
+
+struct stm_timer {
+	void __iomem *base;
+	unsigned long rate;
+	unsigned long delta;
+	unsigned long counter;
+	struct clock_event_device ced;
+	struct clocksource cs;
+	atomic_t refcnt;
+};
+
+static DEFINE_PER_CPU(struct stm_timer *, stm_timers);
+
+static struct stm_timer *stm_sched_clock;
+
+/*
+ * Global structure for multiple STMs initialization
+ */
+static int stm_instances;
+
+/*
+ * This global lock is used to prevent race conditions with the
+ * stm_instances in case the driver is using the ASYNC option
+ */
+static DEFINE_MUTEX(stm_instances_lock);
+
+DEFINE_GUARD(stm_instances, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
+
+static struct stm_timer *cs_to_stm(struct clocksource *cs)
+{
+	return container_of(cs, struct stm_timer, cs);
+}
+
+static struct stm_timer *ced_to_stm(struct clock_event_device *ced)
+{
+	return container_of(ced, struct stm_timer, ced);
+}
+
+static u64 notrace nxp_stm_read_sched_clock(void)
+{
+	return readl(STM_CNT(stm_sched_clock->base));
+}
+
+static u32 nxp_stm_clocksource_getcnt(struct stm_timer *stm_timer)
+{
+	return readl(STM_CNT(stm_timer->base));
+}
+
+static void nxp_stm_clocksource_setcnt(struct stm_timer *stm_timer, u32 cnt)
+{
+	writel(cnt, STM_CNT(stm_timer->base));
+}
+
+static u64 nxp_stm_clocksource_read(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer =3D cs_to_stm(cs);
+
+	return (u64)nxp_stm_clocksource_getcnt(stm_timer);
+}
+
+static void nxp_stm_module_enable(struct stm_timer *stm_timer)
+{
+	u32 reg;
+
+	reg =3D readl(STM_CR(stm_timer->base));
+
+	reg |=3D STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_timer->base));
+}
+
+static void nxp_stm_module_disable(struct stm_timer *stm_timer)
+{
+	u32 reg;
+
+	reg =3D readl(STM_CR(stm_timer->base));
+
+	reg &=3D ~STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_timer->base));
+}
+
+static void nxp_stm_module_put(struct stm_timer *stm_timer)
+{
+	if (atomic_dec_and_test(&stm_timer->refcnt))
+		nxp_stm_module_disable(stm_timer);
+}
+
+static void nxp_stm_module_get(struct stm_timer *stm_timer)
+{
+	if (atomic_inc_return(&stm_timer->refcnt) =3D=3D 1)
+		nxp_stm_module_enable(stm_timer);
+}
+
+static int nxp_stm_clocksource_enable(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer =3D cs_to_stm(cs);
+
+	nxp_stm_module_get(stm_timer);
+
+	return 0;
+}
+
+static void nxp_stm_clocksource_disable(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer =3D cs_to_stm(cs);
+
+	nxp_stm_module_put(stm_timer);
+}
+
+static void nxp_stm_clocksource_suspend(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer =3D cs_to_stm(cs);
+
+	nxp_stm_clocksource_disable(cs);
+	stm_timer->counter =3D nxp_stm_clocksource_getcnt(stm_timer);
+}
+
+static void nxp_stm_clocksource_resume(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer =3D cs_to_stm(cs);
+
+	nxp_stm_clocksource_setcnt(stm_timer, stm_timer->counter);
+	nxp_stm_clocksource_enable(cs);
+}
+
+static void __init devm_clocksource_unregister(void *data)
+{
+	struct stm_timer *stm_timer =3D data;
+
+	clocksource_unregister(&stm_timer->cs);
+}
+
+static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_ti=
mer *stm_timer,
+					   const char *name, void __iomem *base, struct clk *clk)
+{
+	int ret;
+
+	stm_timer->base =3D base;
+	stm_timer->rate =3D clk_get_rate(clk);
+
+	stm_timer->cs.name =3D name;
+	stm_timer->cs.rating =3D 460;
+	stm_timer->cs.read =3D nxp_stm_clocksource_read;
+	stm_timer->cs.enable =3D nxp_stm_clocksource_enable;
+	stm_timer->cs.disable =3D nxp_stm_clocksource_disable;
+	stm_timer->cs.suspend =3D nxp_stm_clocksource_suspend;
+	stm_timer->cs.resume =3D nxp_stm_clocksource_resume;
+	stm_timer->cs.mask =3D CLOCKSOURCE_MASK(32);
+	stm_timer->cs.flags =3D CLOCK_SOURCE_IS_CONTINUOUS;
+
+	ret =3D clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
+	if (ret)
+		return ret;
+
+	ret =3D devm_add_action_or_reset(dev, devm_clocksource_unregister, stm_time=
r);
+	if (ret) {
+		clocksource_unregister(&stm_timer->cs);
+		return ret;
+	}
+
+	stm_sched_clock =3D stm_timer;
+
+	sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
+
+	dev_dbg(dev, "Registered clocksource %s\n", name);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_read_counter(struct stm_timer *stm_timer)
+{
+	return readl(STM_CNT(stm_timer->base));
+}
+
+static void nxp_stm_clockevent_disable(struct stm_timer *stm_timer)
+{
+	writel(0, STM_CCR0(stm_timer->base));
+}
+
+static void nxp_stm_clockevent_enable(struct stm_timer *stm_timer)
+{
+	writel(STM_CCR_CEN, STM_CCR0(stm_timer->base));
+}
+
+static int nxp_stm_clockevent_shutdown(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer =3D ced_to_stm(ced);
+
+	nxp_stm_clockevent_disable(stm_timer);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clo=
ck_event_device *ced)
+{
+	struct stm_timer *stm_timer =3D ced_to_stm(ced);
+	u32 val;
+
+	nxp_stm_clockevent_disable(stm_timer);
+
+	stm_timer->delta =3D delta;
+
+	val =3D nxp_stm_clockevent_read_counter(stm_timer) + delta;
+
+	writel(val, STM_CMP0(stm_timer->base));
+
+	/*
+	 * The counter is shared across the channels and can not be
+	 * stopped while we are setting the next event. If the delta
+	 * is very small it is possible the counter increases above
+	 * the computed 'val'. The min_delta value specified when
+	 * registering the clockevent will prevent that. The second
+	 * case is if the counter wraps while we compute the 'val' and
+	 * before writing the comparator register. We read the counter,
+	 * check if we are back in time and abort the timer with -ETIME.
+	 */
+	if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
+		return -ETIME;
+
+	nxp_stm_clockevent_enable(stm_timer);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_set_periodic(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer =3D ced_to_stm(ced);
+
+	return nxp_stm_clockevent_set_next_event(stm_timer->rate, ced);
+}
+
+static void nxp_stm_clockevent_suspend(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer =3D ced_to_stm(ced);
+
+	nxp_stm_module_put(stm_timer);
+}
+
+static void nxp_stm_clockevent_resume(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer =3D ced_to_stm(ced);
+
+	nxp_stm_module_get(stm_timer);
+}
+
+static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct=
 stm_timer *stm_timer,
+						  const char *name, void __iomem *base, int irq,
+						  struct clk *clk, int cpu)
+{
+	stm_timer->base =3D base;
+	stm_timer->rate =3D clk_get_rate(clk);
+
+	stm_timer->ced.name =3D name;
+	stm_timer->ced.features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHO=
T;
+	stm_timer->ced.set_state_shutdown =3D nxp_stm_clockevent_shutdown;
+	stm_timer->ced.set_state_periodic =3D nxp_stm_clockevent_set_periodic;
+	stm_timer->ced.set_next_event =3D nxp_stm_clockevent_set_next_event;
+	stm_timer->ced.suspend =3D nxp_stm_clockevent_suspend;
+	stm_timer->ced.resume =3D nxp_stm_clockevent_resume;
+	stm_timer->ced.cpumask =3D cpumask_of(cpu);
+	stm_timer->ced.rating =3D 460;
+	stm_timer->ced.irq =3D irq;
+
+	per_cpu(stm_timers, cpu) =3D stm_timer;
+
+	nxp_stm_module_get(stm_timer);
+
+	dev_dbg(dev, "Initialized per cpu clockevent name=3D%s, irq=3D%d, cpu=3D%d\=
n", name, irq, cpu);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
+{
+	struct stm_timer *stm_timer =3D per_cpu(stm_timers, cpu);
+	int ret;
+
+	if (WARN_ON(!stm_timer))
+		return -EFAULT;
+
+	ret =3D irq_force_affinity(stm_timer->ced.irq, cpumask_of(cpu));
+	if (ret)
+		return ret;
+
+	/*
+	 * The timings measurement show reading the counter register
+	 * and writing to the comparator register takes as a maximum
+	 * value 1100 ns at 133MHz rate frequency. The timer must be
+	 * set above this value and to be secure we set the minimum
+	 * value equal to 2000ns, so 2us.
+	 *
+	 * minimum ticks =3D (rate / MICRO) * 2
+	 */
+	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
+					(stm_timer->rate / MICRO) * 2, ULONG_MAX);
+
+	return 0;
+}
+
+static irqreturn_t nxp_stm_module_interrupt(int irq, void *dev_id)
+{
+	struct stm_timer *stm_timer =3D dev_id;
+	struct clock_event_device *ced =3D &stm_timer->ced;
+	u32 val;
+
+	/*
+	 * The interrupt is shared across the channels in the
+	 * module. But this one is configured to run only one channel,
+	 * consequently it is pointless to test the interrupt flags
+	 * before and we can directly reset the channel 0 irq flag
+	 * register.
+	 */
+	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
+
+	/*
+	 * Update STM_CMP value using the counter value
+	 */
+	val =3D nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->delta;
+
+	writel(val, STM_CMP0(stm_timer->base));
+
+	/*
+	 * stm hardware doesn't support oneshot, it will generate an
+	 * interrupt and start the counter again so software needs to
+	 * disable the timer to stop the counter loop in ONESHOT mode.
+	 */
+	if (likely(clockevent_state_oneshot(ced)))
+		nxp_stm_clockevent_disable(stm_timer);
+
+	ced->event_handler(ced);
+
+	return IRQ_HANDLED;
+}
+
+static int __init nxp_stm_timer_probe(struct platform_device *pdev)
+{
+	struct stm_timer *stm_timer;
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	const char *name =3D of_node_full_name(np);
+	struct clk *clk;
+	void __iomem *base;
+	int irq, ret;
+
+	/*
+	 * The device tree can have multiple STM nodes described, so
+	 * it makes this driver a good candidate for the async probe.
+	 * It is still unclear if the time framework correctly handles
+	 * parallel loading of the timers but at least this driver is
+	 * ready to support the option.
+	 */
+	guard(stm_instances)(&stm_instances_lock);
+
+	/*
+	 * The S32Gx are SoCs featuring a diverse set of cores. Linux
+	 * is expected to run on Cortex-A53 cores, while other
+	 * software stacks will operate on Cortex-M cores. The number
+	 * of STM instances has been sized to include at most one
+	 * instance per core.
+	 *
+	 * As we need a clocksource and a clockevent per cpu, we
+	 * simply initialize a clocksource per cpu along with the
+	 * clockevent which makes the resulting code simpler.
+	 *
+	 * However if the device tree is describing more STM instances
+	 * than the number of cores, then we ignore them.
+	 */
+	if (stm_instances >=3D num_possible_cpus())
+		return 0;
+
+	base =3D devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base), "Failed to iomap %pOFn\n", np);
+
+	irq =3D platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	clk =3D devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Clock not found\n");
+
+	stm_timer =3D devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
+	if (!stm_timer)
+		return -ENOMEM;
+
+	ret =3D devm_request_irq(dev, irq, nxp_stm_module_interrupt,
+			       IRQF_TIMER | IRQF_NOBALANCING, name, stm_timer);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to allocate interrupt line\n");
+
+	ret =3D nxp_stm_clocksource_init(dev, stm_timer, name, base, clk);
+	if (ret)
+		return ret;
+
+	/*
+	 * Next probed STM will be a per CPU clockevent, until we
+	 * probe as many as we have CPUs available on the system, we
+	 * do a partial initialization
+	 */
+	ret =3D nxp_stm_clockevent_per_cpu_init(dev, stm_timer, name,
+					      base, irq, clk,
+					      stm_instances);
+	if (ret)
+		return ret;
+
+	stm_instances++;
+
+	/*
+	 * The number of probed STMs for per CPU clockevent is
+	 * equal to the number of available CPUs on the
+	 * system. We install the cpu hotplug to finish the
+	 * initialization by registering the clockevents
+	 */
+	if (stm_instances =3D=3D num_possible_cpus()) {
+		ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "STM timer:starting",
+					nxp_stm_clockevent_starting_cpu, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id nxp_stm_of_match[] =3D {
+	{ .compatible =3D "nxp,s32g2-stm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
+
+static struct platform_driver nxp_stm_probe =3D {
+	.probe	=3D nxp_stm_timer_probe,
+	.driver	=3D {
+		.name		=3D "nxp-stm",
+		.of_match_table	=3D nxp_stm_of_match,
+	},
+};
+module_platform_driver(nxp_stm_probe);
+
+MODULE_DESCRIPTION("NXP System Timer Module driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer=
-tegra186.c
index 5d4cf5237a11..e5394f98a02e 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
+ * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
  */
=20
+#include <linux/bitfield.h>
 #include <linux/clocksource.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -29,6 +30,7 @@
=20
 #define TMRSR 0x004
 #define  TMRSR_INTR_CLR BIT(30)
+#define  TMRSR_PCV GENMASK(28, 0)
=20
 #define TMRCSSR 0x008
 #define  TMRCSSR_SRC_USEC (0 << 0)
@@ -45,6 +47,9 @@
 #define  WDTCR_TIMER_SOURCE_MASK 0xf
 #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
=20
+#define WDTSR 0x004
+#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
+
 #define WDTCMDR 0x008
 #define  WDTCMDR_DISABLE_COUNTER BIT(1)
 #define  WDTCMDR_START_COUNTER BIT(0)
@@ -169,18 +174,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &=3D ~WDTCR_PERIOD_MASK;
 		value |=3D WDTCR_PERIOD(1);
=20
-		/* enable local interrupt for WDT petting */
-		value |=3D WDTCR_LOCAL_INT_ENABLE;
-
-		/* enable local FIQ and remote interrupt for debug dump */
-		if (0)
-			value |=3D WDTCR_REMOTE_INT_ENABLE |
-				 WDTCR_LOCAL_FIQ_ENABLE;
-
-		/* enable system debug reset (doesn't properly reboot) */
-		if (0)
-			value |=3D WDTCR_SYSTEM_DEBUG_RESET_ENABLE;
-
 		/* enable system POR reset */
 		value |=3D WDTCR_SYSTEM_POR_RESET_ENABLE;
=20
@@ -234,12 +227,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_dev=
ice *wdd,
 	return 0;
 }
=20
+static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt =3D to_tegra186_wdt(wdd);
+	u32 expiration, val;
+	u64 timeleft;
+
+	if (!watchdog_active(&wdt->base)) {
+		/* return zero if the watchdog timer is not activated. */
+		return 0;
+	}
+
+	/*
+	 * Reset occurs on the fifth expiration of the
+	 * watchdog timer and so when the watchdog timer is configured,
+	 * the actual value programmed into the counter is 1/5 of the
+	 * timeout value. Once the counter reaches 0, expiration count
+	 * will be increased by 1 and the down counter restarts.
+	 * Hence to get the time left before system reset we must
+	 * combine 2 parts:
+	 * 1. value of the current down counter
+	 * 2. (number of counter expirations remaining) * (timeout/5)
+	 */
+
+	/* Get the current number of counter expirations. Should be a
+	 * value between 0 and 4
+	 */
+	val =3D readl_relaxed(wdt->regs + WDTSR);
+	expiration =3D FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
+	if (WARN_ON_ONCE(expiration > 4))
+		return 0;
+
+	/* Get the current counter value in microsecond. */
+	val =3D readl_relaxed(wdt->tmr->regs + TMRSR);
+	timeleft =3D FIELD_GET(TMRSR_PCV, val);
+
+	/*
+	 * Calculate the time remaining by adding the time for the
+	 * counter value to the time of the counter expirations that
+	 * remain.
+	 */
+	timeleft +=3D (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expirati=
on);
+
+	/*
+	 * Convert the current counter value to seconds,
+	 * rounding up to the nearest second. Cast u64 to
+	 * u32 under the assumption that no overflow happens
+	 * when coverting to seconds.
+	 */
+	timeleft =3D DIV_ROUND_CLOSEST_ULL(timeleft, USEC_PER_SEC);
+
+	if (WARN_ON_ONCE(timeleft > U32_MAX))
+		return U32_MAX;
+
+	return lower_32_bits(timeleft);
+}
+
 static const struct watchdog_ops tegra186_wdt_ops =3D {
 	.owner =3D THIS_MODULE,
 	.start =3D tegra186_wdt_start,
 	.stop =3D tegra186_wdt_stop,
 	.ping =3D tegra186_wdt_ping,
 	.set_timeout =3D tegra186_wdt_set_timeout,
+	.get_timeleft =3D tegra186_wdt_get_timeleft,
 };
=20
 static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
@@ -365,23 +415,10 @@ static int tegra186_timer_usec_init(struct tegra186_tim=
er *tegra)
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
=20
-static irqreturn_t tegra186_timer_irq(int irq, void *data)
-{
-	struct tegra186_timer *tegra =3D data;
-
-	if (watchdog_active(&tegra->wdt->base)) {
-		tegra186_wdt_disable(tegra->wdt);
-		tegra186_wdt_enable(tegra->wdt);
-	}
-
-	return IRQ_HANDLED;
-}
-
 static int tegra186_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
 	struct tegra186_timer *tegra;
-	unsigned int irq;
 	int err;
=20
 	tegra =3D devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
@@ -400,8 +437,6 @@ static int tegra186_timer_probe(struct platform_device *p=
dev)
 	if (err < 0)
 		return err;
=20
-	irq =3D err;
-
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt =3D tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
@@ -428,17 +463,8 @@ static int tegra186_timer_probe(struct platform_device *=
pdev)
 		goto unregister_osc;
 	}
=20
-	err =3D devm_request_irq(dev, irq, tegra186_timer_irq, 0,
-			       "tegra186-timer", tegra);
-	if (err < 0) {
-		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
-		goto unregister_usec;
-	}
-
 	return 0;
=20
-unregister_usec:
-	clocksource_unregister(&tegra->usec);
 unregister_osc:
 	clocksource_unregister(&tegra->osc);
 unregister_tsc:

