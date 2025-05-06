Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7B6300366;
	Tue,  6 May 2025 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498205; cv=none; b=puU+RgRbBIP+AF3L6GFVroXEYZh134+4kf0n18EFcYy218IHAMQcMCYW7dt1PHRldRyJIE3h5PC3N5Vb+XdacA57tkv1gtx++SyAZ7yDP9FlfdksdV8aLER9ceg2nnBU0p//ir/OXAULuhbZEFSxQdGfu3KrMxNIVqNENosHkzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498205; c=relaxed/simple;
	bh=VYqt9DWjk14rZvscK0rSZmyFfhPRc7UasEOv2asQgE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDhQQnzd4D9KWEADNILo9vrOJ6WjHyrRrfGqT8uEbthB/YK1X28GwOZHlNx4G/e9KbPKo3B4iAt+4oLxijZNQI8a9EqXGyXY/VPWGmOSFj1oU/K4hfds7WA7TnCzNiWFtPSInZV+saGt6xVE5ZpHtUDlEEqsYJTPYTwwjfBwEeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IX2absoE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IX2absoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77979C4CEE4;
	Tue,  6 May 2025 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498204;
	bh=VYqt9DWjk14rZvscK0rSZmyFfhPRc7UasEOv2asQgE0=;
	h=From:To:Cc:Subject:Date:From;
	b=IX2absoElCxa0lrfcxKxpXMMm3r/7y7tKfSFFK+snkogVDpKeTPLx0uOG8fX7tHza
	 dNjDvkkLGHieTF0LV3Nv+NUmuKCnZMwt0r30RqaAzWgJaYyXn/uKlE5GYiphePB/b7
	 gtbKoZf6hFem3dv5EXFyPa8iUczbdlRujZVa8zNcWUNNR+gwiVack78/xnwk3r6UMV
	 90CrheoiBjqwdFlk4etxy0vb2VwrUqqc6pHO6Qw0GqAfXrbyfP6EB7zRKwuIFRfnKT
	 eyxPJldC34Tyrmugk8gDAmL9ZaFYUMOmEHMBekac9EY+dB3ZxCZybZebNpwVPP5U+B
	 UdXBwaXo5LsDA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: timer: Convert socionext,milbeaut-timer to DT schema
Date: Mon,  5 May 2025 21:23:20 -0500
Message-ID: <20250506022322.2589193-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Socionext Milbeaut Timer binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../timer/socionext,milbeaut-timer.txt        | 17 --------
 .../timer/socionext,milbeaut-timer.yaml       | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
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
-	compatible = "socionext,milbeaut-timer";
-	reg = <0x1e000050 0x20>
-	interrupts = <0 91 4>;
-	clocks = <&clk 4>;
-};
diff --git a/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml b/Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml
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
+        compatible = "socionext,milbeaut-timer";
+        reg = <0x1e000050 0x20>;
+        interrupts = <0 91 4>;
+        clocks = <&clk 4>;
+    };
-- 
2.47.2

