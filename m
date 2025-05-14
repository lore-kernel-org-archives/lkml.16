Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4EE21A428;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212743; cv=none; b=JKoEp8N0gP5H3dEv3tfCKQOWOcv2QX/LrLLaEL4Xg19r1X2FMpA09+wOVC+z2pwkTRFhe9fEdsIiRSMamK6AEmCMRqIsrbYyZgmxQxFqDbVR1stwf784lmOhMruMK0B0r0psAHurbrtafCjC+JFTH4L3pvptykjEaz38nnxG2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212743; c=relaxed/simple;
	bh=lvH4KVUWdDq9a9MwZjjMb15JvVXgbgvQwr6KF7wllzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEKysivyHJdKez+0BJoK1rDR5sYPmzb0zKIcrF79QIn4AjKiEeK1KyIbS4X6JMkkoeGlRwJs9dV4va51PX0anFP+uPMTuO1GwL2eo9vgTQisIEPb0AEfKzThPQrgNmQ2aOJs9PEtmB1qkqw+dK3+cbGoikSkIugFVd4KTSghEEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNT2ter8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNT2ter8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B826C4CEF0;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212743;
	bh=lvH4KVUWdDq9a9MwZjjMb15JvVXgbgvQwr6KF7wllzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GNT2ter8uV5dQI1NAeeKP0ngsy6iBeJcdaVJ/gNftQxT3oTBVG1VvrQ+faxJXpYuN
	 Ir1kAtJlnKwsspjtJLxPhVadt5KWjxP991O7nNBOx8HLtT0st7eUJA6A9toV+JoNB8
	 Gw4tTcEWMIKWC5Y/tpC/TPqNYYjPkSM7jkNHGduRIIKEpsRneDHLKhZLlCBBZa75Ua
	 NGPGBU08+RCOeQGsNhRax6xOQKuP6SO0uipZ4mTS2frDzbMIGmNhaXVMMg+zSm3sdz
	 LROtq8JlMQkpby/rLDOLCKg2ECsX0+83e6kvu67Ufhxs4m5C6GvY24FjRPqGoqSPEA
	 iXEvMw9af3Y0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1A2C3ABDA;
	Wed, 14 May 2025 08:52:23 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 14 May 2025 10:51:50 +0200
Subject: [PATCH v4 1/2] dt-bindings: timer: mti,gcru
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-riscv-time-mmio-v4-1-cb0cf2922d66@htecgroup.com>
References: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
In-Reply-To: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747212741; l=1731;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=bavSLGIvQI52iBpPwSEEg1jcYvhis52EMItmcd2/Qlo=;
 b=g89qj4IiCI3QUes9/qSdtJSGECHU1IQBnqo4tR1iKJGDCUEP+o96M4G01g92qOz4ZjiH3qmBX
 gnd8g3ieVr/BCvXawkU3WUt4LtIP7G3gjQca6sfVPJOMUCkKaMPFu2H
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
platforms. The GCR.U memory region contains shadow copies of the RISC-V
mtime register and the hrtime Global Configuration Register.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../devicetree/bindings/timer/mti,gcru.yaml        | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/mti,gcru.yaml b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ceaf90bad5332b64f3c1f28bebdc28d78443898a
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GCR.U timer device for RISC-V platforms
+
+maintainers:
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  The GCR.U memory region contains memory mapped shadow copies of
+  mtime and hrtime Global Configuration Registers,
+  which software can choose to make accessible from user mode.
+
+properties:
+  compatible:
+    const: mti,gcru
+
+  reg:
+    items:
+      - description: Read-only shadow copy of the RISC-V mtime register.
+      - description: Read-only shadow copy of the high resolution timer register.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1617f000 {
+        compatible = "mti,gcru";
+        reg = <0x1617f050 0x8>,
+              <0x1617f090 0x8>;
+    };

-- 
2.34.1


