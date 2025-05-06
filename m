Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E1300A46;
	Tue,  6 May 2025 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498197; cv=none; b=H5TaowvhzaKCoNJVezZw5Aab8N/+GpN95ko/TvImWUDKgDQlyLdADAUXfNNMl9k5Ox73lqA6IK8B2PoI3ByTU9sKDwPxKybPmss8dDhTmhWqf2U6uhJ14nrZgt++e/DbP65S+FyjdRtlFA4phVVHSCw7kCin+PnPYY2bi2q1d3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498197; c=relaxed/simple;
	bh=TApq+MXWn/hLf6nDKWmi38HNuqTWN9RUCiR7P5farig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ea+XOjCkvwq/z8Ed+21ml8mAArbvd+1LGcfikv8RTjmpAdLuNFMxYsOdAHuZ67lJBDncVjy580/9GrsuOSWNkDQXwGSXqmhhJdfa6hlR86/wHFhVtwZYF+cHfAFMLDAvx4MqjRtFbW+oxcmnfLViJgO7K09A3ZeHuWN8PiHXm+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=troK/Hnw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="troK/Hnw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CBAC4CEE4;
	Tue,  6 May 2025 02:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498196;
	bh=TApq+MXWn/hLf6nDKWmi38HNuqTWN9RUCiR7P5farig=;
	h=From:To:Cc:Subject:Date:From;
	b=troK/Hnw5piMe/lPwsaCq9h61MLz4dTl5BPWWjgIwybfSf9noqu98uUCyPjFVlG0b
	 Q/UcF/s8sf04e7FSbWb9Kum6enJ0K6rx8yKlpiYLzWJka3RP36cibFr6891IAoV5jt
	 pL33uek2umi3BSQgSoj8L5X8nCGNRbAC9ZMmSAKDuLioFHp0LBcWgs2kK0/f6EaYcR
	 ymqmCk2yx61SliZDnvcwVK5oS3zzHFJtE6OkN5wzrBIy3XvojYqiUrHNxj31DeWv4N
	 wXlTLwkUxVwp8oKFehK0rFYKvaurodUV+ir62RY1jP1Z3VUtWrJqrGjhKNVG5ZzW2L
	 PlsaeQjshmxBg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vineet Gupta <vgupta@synopsys.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert snps,archs-rtc to DT schema
Date: Mon,  5 May 2025 21:23:12 -0500
Message-ID: <20250506022313.2588796-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Synopsys ARC HS RTC Timer binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/snps,archs-rtc.txt         | 14 ---------
 .../bindings/timer/snps,archs-rtc.yaml        | 30 +++++++++++++++++++
 2 files changed, 30 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.yaml

diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
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
-		compatible = "snps,arc-rtc";
-		clocks = <&core_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.yaml b/Documentation/devicetree/bindings/timer/snps,archs-rtc.yaml
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
+      compatible = "snps,archs-rtc";
+      clocks = <&core_clk>;
+    };
-- 
2.47.2

