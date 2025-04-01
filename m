Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2296B1E9B3C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495606; cv=pass; b=LMDVoRfvrT4XJql4ZN3qIvaQQto0oj1vjYVCvn+phZF12UleIeOkCh7HVBVFKK7uuTQ1nVqxtXs73XhSD07DwueWTWRkY1x3fdYXVPJRYX1KAdWcVfOaUeHmd6YSvYOizhsI38Eu0jSAL7Zngf4qqSYqI/+NjCf4cHJMd7z5oQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495606; c=relaxed/simple;
	bh=mdFn1NSuJKdEhw2mlA0EzdjFjzcPGshomOl/WF67r8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FgT80WjqY8LQWK797HBdBbMsVuT9Z6fVDEFkU+LwOhp2FGuI/DGeGT9SQxXiQjcciRQ6KBVbUiUvo0r9s6FezduR1JKFny8YuA5WUOGehTjvOyRx7gOcEBqovUTORN65+IGNlckdiT4+p6tdYH5IGCME7vpSNUyGiXcGu5RQY24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chir.rs; spf=pass smtp.mailfrom=chir.rs; dkim=pass (1024-bit key) header.d=chir.rs header.i=lotte@chir.rs header.b=KdYygNdE; arc=pass smtp.client-ip=136.143.169.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chir.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chir.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chir.rs header.i=lotte@chir.rs header.b="KdYygNdE"
ARC-Seal: i=1; a=rsa-sha256; t=1743495566; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Fgr8zrpVbfhfS+M9LwCdXcvRN10/eXImKzmzF8rrDnQBUOnqPV1sZ/aLypKh4aQ9uZsxku/FSMBQ9eXw7elPncsVHG4SEjOUgeo1AQMKipwoX9MN6jcurAl9EVZt7S9LigfzF7mL3ANMLNaRVKGKrd1PpLFJu8VEC4UxOzWNBqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1743495566; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BdzPdRWbVUnKTjnH+i1SnxSYrp+D5xI4pwUXRe8mtb8=; 
	b=BbbE6PtZTTJRCfoGo3grepU+Zz4slho5doK9Y93op+gFFoUuZ/tYjEcZeO6Ved3gEHlePa3lxrQID+AZ2rnONflGP6IGt2JEeX2MComWD8NIykDNJHjQER6uh3+HD4z3W11l8zpf0r7wzM0RoXFmThDBDkOl1wqHV3T1XKTyOUM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=chir.rs;
	spf=pass  smtp.mailfrom=lotte@chir.rs;
	dmarc=pass header.from=<lotte@chir.rs>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743495566;
	s=zmail; d=chir.rs; i=lotte@chir.rs;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BdzPdRWbVUnKTjnH+i1SnxSYrp+D5xI4pwUXRe8mtb8=;
	b=KdYygNdEvnIrZtqRMFYn0I3bqEOnVrLjG/aG99kYSwSncpj61sKpzRqaz6iumjh8
	O38FShTLaLIsrmUYC4naLt7d/4Z9u1XjlfhX4LMyHQHrUGxXu8zu5x7boaOt179/Sb1
	cfkvvIQ75iG7Ms03vaGfdl1X9coqSPGYVWxPbVtc=
Received: by mx.zoho.eu with SMTPS id 1743495563114631.7085270615262;
	Tue, 1 Apr 2025 10:19:23 +0200 (CEST)
From: =?UTF-8?q?Charlotte=20=Dele=C5=84kec?= <lotte@chir.rs>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Charlotte=20Dele=C5=84kec?= <lotte@chir.rs>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: display: Add Clockwork CWD686 panel
Date: Tue,  1 Apr 2025 09:18:32 +0100
Message-ID: <20250401081852.283532-3-lotte@chir.rs>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401081852.283532-1-lotte@chir.rs>
References: <20250401081852.283532-1-lotte@chir.rs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Max Fierke <max@maxfierke.com>

The CWD686 is a 6.86" IPS LCD panel used as the primary
display in the ClockworkPi DevTerm portable (all cores)

Co-authored-by: Charlotte Deleńkec <lotte@chir.rs>
Signed-off-by: Charlotte Deleńkec <lotte@chir.rs>
Signed-off-by: Max Fierke <max@maxfierke.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/clockwork,cwd686.yaml       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml b/Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml
new file mode 100644
index 000000000000..70f73b67abc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/clockwork,cwd686.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/clockwork,cwd686.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clockwork CWD686 6.86" IPS LCD panel
+
+maintainers:
+  - Max Fierke <max@maxfierke.com>
+
+description: |
+  The Clockwork CWD686 is a 6.86" ICNL9707-based IPS LCD panel used within the
+  Clockwork DevTerm series of portable devices. The panel has a 480x1280
+  resolution and uses 24 bit RGB per pixel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: clockwork,cwd686
+
+  reg:
+    description: DSI virtual channel used by that screen
+    maxItems: 1
+
+  iovcc-supply:
+    description: regulator that supplies the iovcc voltage
+
+  vci-supply:
+    description: regulator that supplies the vci voltage
+
+  reset-gpios: true
+  rotation: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - reset-gpios
+  - iovcc-supply
+  - vci-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "clockwork,cwd686";
+            reg = <0>;
+            backlight = <&backlight>;
+            reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+            rotation = <90>;
+            iovcc-supply = <&vcc_1v8>;
+            vci-supply = <&vcc3v3_sys>;
+        };
+    };
-- 
2.48.1

