Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22A21147A;
	Mon, 31 Mar 2025 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436360; cv=none; b=ZVO4sRAot6Guohr4/T5siRe676Uf4b6ULsNx+frKrStjjSK7uOH47U8WfwTmsY6PQcXoD0ItxxU23ssNE6Ei4Faz/nvC7D4fde7sXOxrmdwwaP2qqKBnr7aemqZYRU6sW38p3KZGOecGfvPl3TPwFv2L8seZsxxIxDMWDK1ZDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436360; c=relaxed/simple;
	bh=z+OhnofA166k/30CaNloxYejPREjsHP463osLIA9kh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IXCJC9XlbXM61bNdVdNb5QgzwvBAexGlH8OUuCkjhXZluV46UfkA7xckhmq/635k8KrnXSEdKm0GIv6DvHRgaPKDVF53H4UDIYKYna3vNmooAnzsqFkqVDbi9qs/LKE+wMg10oMvk0wqZlMbLIDZkEmcGs4PsndErHcC72TLUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=kYos5sKB; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="kYos5sKB"
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id CEA8B1F9F4;
	Mon, 31 Mar 2025 17:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743436355;
	bh=SJgfb8TQpY0ee2eKfxl66K4dUcxi4hrZyAmL4y/2lB0=; h=From:To:Subject;
	b=kYos5sKBC0NrQtVXC3EiRbd8lHaI/hsFeJmDyIbMMpHbf9B27JE9j/fcLfIqxuYxx
	 45Kz7RTTfDoDVrRwa8+HRkiMMyH/z6vtC4jgdXcbUi/Cg7Z9Egs0HEVqHkHs6EPKXo
	 +S+3NFVJaxW6ON1kP/JV/5sl+uQuwKlZw0Lh74E5n9z6oWYmyqlyWUQDgjSyZ5AjgY
	 zhy8+trvBabbKNfUb1pGIBumsSDl2hsv+4OFnwr6YgLXgVfH4//IOXNP/wLdW3wRXg
	 WwlKMOCrBmBqn5WidZgNzNIni3C8qzGnutqfZYrLw4Rfix+GcJ3bKbOruN3a3FlS0J
	 iaGlyf9AHB8DA==
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
Subject: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM output
Date: Mon, 31 Mar 2025 17:52:28 +0200
Message-Id: <20250331155229.147879-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331155229.147879-1-francesco@dolcini.it>
References: <20250331155229.147879-1-francesco@dolcini.it>
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
v3:
 - explicitly describe the fan, use standard PWM and FAN bindings
 - pwm.yaml cannot be referenced, because of the $nodename pattern that is
   enforced there
v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
 - no changes
v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
---
 .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
index 5d33f1a23d03..94aca9c378e6 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -28,6 +28,13 @@ properties:
   i2c-mux:
     type: object
 
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+  "#pwm-cells":
+    const: 3
+
 required:
   - compatible
   - reg
@@ -50,9 +57,14 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        fan@18 {
+        fan_controller: fan@18 {
             compatible = "ti,amc6821";
             reg = <0x18>;
+            #pwm-cells = <3>;
+
+            fan {
+                pwms = <&fan_controller 0 40000 0>;
+            };
         };
     };
 
-- 
2.39.5

