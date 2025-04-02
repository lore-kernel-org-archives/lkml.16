Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E76E23534D;
	Wed,  2 Apr 2025 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589324; cv=none; b=WDjlSi9S9K1+uk6q/ykdf9t5o4NF811G9V3DKHzzOiZAXSqkjt2/eIfg4m9vm/Cu2Dd6J4G93CvzmpCJ65b44s+UIqV3/p6tz/1aZD6fHOpEg5bxIzhIpK6YEVFK+98oX97QxV/eCDNSpyaQhCJsAcM8Y2hQJHA2vjOucM12gF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589324; c=relaxed/simple;
	bh=oPk6ucGcDI1wEgXM+63PrveBDg05TKuPFs6H/5AgwpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FXcEJrHuY5WyelYxIu65TyYwF3uGpuMlolxy92ZDbH9cIbdDLM4gnwC3ejgqzOvHiuV7BeV5QQTKMLql+Ga1LhTeUNpu6OwNDz/HWAijKwnth5eTfpD7OkyIkAO51DwQK/U5Sk34bs8Uv2FbkA7bjT2YW7L24TCvwipjQDDi+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=r2wXuuto; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="r2wXuuto"
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 19F6F1F936;
	Wed,  2 Apr 2025 12:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743589313;
	bh=U0nPMu7F4Ahw1UZcx/AIz4XJ14OTdfCkOQ65to8yGPo=; h=From:To:Subject;
	b=r2wXuutoPk+kTdd849Dkw7VavNojN8naow68u6fboOdY8y/L384ISL7lB1HjOHHiI
	 +Xd3evMsy4TZ/DQTKP75k/Wv/NYJV/wyxdZ4w3LQ4QC4kbKYVbXLIcmVSlrrjpJLr4
	 3b5srBpiOJEyFqwZNXFCjSIsSdlAt2dg++PRjgkcoFXto+z7jJlg4vGuVwVETlzUSw
	 /DPJAqrc28jGsnxCgCn1PaUxmM3F5RxFQahSysu2+tChyg7VVdiuI3U09ngkuXQVii
	 erzIdNMqaXfBaIGRuma+OqBaRIbP7t/lr5otBTZSvNKmqbjyhuQKlAGapu4+8EFqOE
	 ve20ofcO2ahZw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: hwmon: amc6821: add fan and PWM output
Date: Wed,  2 Apr 2025 12:21:45 +0200
Message-Id: <20250402102146.65406-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402102146.65406-1-francesco@dolcini.it>
References: <20250402102146.65406-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add properties to describe the fan and the PWM controller output.

Link: https://www.ti.com/lit/gpn/amc6821
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4:
 - add #pwm-cells description
 - remove useless first #pwm-cells, that was supposed to be the instance
   number
v3: https://lore.kernel.org/all/20250331155229.147879-2-francesco@dolcini.it/
 - explicitly describe the fan, use standard PWM and FAN bindings
 - pwm.yaml cannot be referenced, because of the $nodename pattern that is
   enforced there
v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
 - no changes
v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
---
 .../devicetree/bindings/hwmon/ti,amc6821.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
index 5d33f1a23d03..9ca7356760a7 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -28,6 +28,17 @@ properties:
   i2c-mux:
     type: object
 
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+  "#pwm-cells":
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
 required:
   - compatible
   - reg
@@ -50,9 +61,14 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        fan@18 {
+        fan_controller: fan@18 {
             compatible = "ti,amc6821";
             reg = <0x18>;
+            #pwm-cells = <2>;
+
+            fan {
+                pwms = <&fan_controller 40000 0>;
+            };
         };
     };
 
-- 
2.39.5

