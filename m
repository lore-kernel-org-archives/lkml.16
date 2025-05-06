Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8128301150;
	Tue,  6 May 2025 02:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498209; cv=none; b=TSlWX+0KheJuj3CZXzSRhEX7Le7mFhYjZjXSuWELlVPgmHOfSDt5deT4lTxifBv78DIvBQZdU33f8/ogc2vf4H6u78XzE+NF1Jf4hDdVo8EDHY8bEOysPvVEIdjeW8WP4qmQSEgvVdCPRhwzj87BAXnCoaabRGvgtn5mA/+QUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498209; c=relaxed/simple;
	bh=RB+hhkLv2Sp7aE3uPYIl7FW8uMozzf5yTNpONKxH3ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4Ut8ysIlzAvB0gUALQl58HwNAgbN3Fiqx1c5IeAylEavsm3NMAax7ZLWNibpb97/gtvchrmbduhAZ8pOs8A5jJDKF+OsaY8qXV5MPV7sVjFgToL2bBhov6VLYmdJrLzm3JGpP3D+sIcMyNp6R9e9MjaQrFPsafnaaZQPKKj/zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFN5h4MG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFN5h4MG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A374DC4CEE9;
	Tue,  6 May 2025 02:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498208;
	bh=RB+hhkLv2Sp7aE3uPYIl7FW8uMozzf5yTNpONKxH3ZE=;
	h=From:To:Cc:Subject:Date:From;
	b=EFN5h4MGn/vLqXesC7rzG5Ym4/Zdw58n5oZPxijBsJPB8TCRG6V3NEez5QScEErmr
	 zojmGlwFwBQWOcSuHJ/u7McEYpXEgWEBrR8G1zy7RQarIUNNCF9A0geA2yeMHJCYly
	 R8WrAvKqPeqTDudWBaqtsVRu+DIxL+1dO+zuqoF51eAhcUK9jN9m6Orla43xV4K3lx
	 NnCs2Xky8vV5HKr52nSsOOT4yBq43Cexq2DO2sIjWlbZPC21/N6SrdjzFSYWGqIfGI
	 NWlGpL0lcuNrGbHJS2FdCQQno5DqRSXEPq1PtEHjQxe/a9ZO1L4jXYpi1hyOJlNMsv
	 8xpnsu9ldPrEw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert st,spear-timer to DT schema
Date: Mon,  5 May 2025 21:23:25 -0500
Message-ID: <20250506022326.2589389-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ST SPEAr Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/st,spear-timer.txt         | 16 ---------
 .../bindings/timer/st,spear-timer.yaml        | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/st,spear-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/st,spear-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/st,spear-timer.txt b/Documentation/devicetree/bindings/timer/st,spear-timer.txt
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
-		compatible = "st,spear-timer";
-		reg = <0xf0000000 0x400>;
-		interrupts = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/st,spear-timer.yaml b/Documentation/devicetree/bindings/timer/st,spear-timer.yaml
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
+        compatible = "st,spear-timer";
+        reg = <0xf0000000 0x400>;
+        interrupts = <2>;
+    };
-- 
2.47.2

