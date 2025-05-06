Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC25300292;
	Tue,  6 May 2025 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498133; cv=none; b=ejm6PwMNqNTZ7y4B2x96wMqBBh2Z67H56Kb6lu05eAyFEsHMRASiXnAH5NDV9dFvD+JayXnmmeLRFvuiZGb5+2cjDrCJ73B+kD+kbD5+IJ0+Pt2bddgAMz0yPHv52pOyCS+t42XZ1iNfWzX5SnYILzh3nsjPYDo5pXuAjwu5DwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498133; c=relaxed/simple;
	bh=RiJq8QEBNv4xAQ1Xr1EM5XwHlybZfqBM4JI17uR/log=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIg66kVO6/ojyhLJ1l//8TlPOJ3MXsjoTXm7sza2MpyYMWhsW49sZd4npIshIYpqEUk0AeQDzR+qb4DfEo9c3VvaFXccXh7EmfQpoDS8ulTjhASkImprdmXnbUR8p8IIIXZtFZRwca38sJ1nTNw6a+eywZ9VRpfaSNWkmrQ+iRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZe1fasu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZe1fasu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25543C4CEE4;
	Tue,  6 May 2025 02:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498129;
	bh=RiJq8QEBNv4xAQ1Xr1EM5XwHlybZfqBM4JI17uR/log=;
	h=From:To:Cc:Subject:Date:From;
	b=EZe1fasuCnW8lOPKSir4NGHK6ZGkRUMnfzRC+6wHK1fgHBHo4kHGMkWcSFe/Vvs9o
	 pEOtE7PGEx1s89TIOnHwRG+0jh8ejKQU9PX8ieIedxuJUOo3ktpf/T/QuwT0r2PmpO
	 vwxk8gPzRWXMMTUovqPtp7OrJHaNtx7wQlAWsHX6cVpQxzsXs92GIgd9issCCWeSoG
	 C7orTRy6cIqoXg3wJyEct4xvn/CnBn5OYIlNKMcYXqhPSaqq3Pfb1HzcelRhvJg0ed
	 q/n38dQTZfWg1a4T2jBkFmizbRrBai97uvh2WUgpgaIVfX8DTGDgFmWaDYbJy5jLDA
	 SXFkQmyDc1LGQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert altr,timer-1.0 to DT schema
Date: Mon,  5 May 2025 21:22:01 -0500
Message-ID: <20250506022202.2586157-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Altera Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/altr,timer-1.0.txt         | 18 ---------
 .../bindings/timer/altr,timer-1.0.yaml        | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/altr,timer-1.0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/altr,timer-1.0.yaml

diff --git a/Documentation/devicetree/bindings/timer/altr,timer-1.0.txt b/Documentation/devicetree/bindings/timer/altr,timer-1.0.txt
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
-- clock-frequency : The frequency of the clock that drives the counter, in Hz.
-
-Example:
-
-timer {
-	compatible = "altr,timer-1.0";
-	reg = <0x00400000 0x00000020>;
-	interrupt-parent = <&cpu>;
-	interrupts = <11>;
-	clock-frequency = <125000000>;
-};
diff --git a/Documentation/devicetree/bindings/timer/altr,timer-1.0.yaml b/Documentation/devicetree/bindings/timer/altr,timer-1.0.yaml
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
+        compatible = "altr,timer-1.0";
+        reg = <0x00400000 0x00000020>;
+        interrupts = <11>;
+        clock-frequency = <125000000>;
+    };
-- 
2.47.2

