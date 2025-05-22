Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30FA225412;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747932698; cv=none; b=AMvJlTN6amFZV+3sep0Hzb300kiK5osN3ItGNs7csPz3wmYXeh7gtSQqJecY91ED32oRFZvBWK9XrO+qDYY41+btahYDQH8Vr+iOCGXLT4ZF/RwFgZllZwyytZHjwu58RivZrwGfO+0FYeNPKNAZSDfLCYe3L3yBq2TOrEPVZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747932698; c=relaxed/simple;
	bh=XqRKlmwtskDBzgjp9eBWrIxZScG8XDNG6qHQOIsuaGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJTZzNeSHMahklJsR9UhvyTXAo195h2hhmKwly9XEW7YacUNtXhRquBT07att5X8T6kBBJeUEQkHRacDnzm/VDKEriC1GkkQNe3GtWgVTOpmksW69+4BPw45z2kP/BNVf7TaD12j7RP0Q362JwF2yzKICjkIrX7j9l3gIxpO9Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDBCMx4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDBCMx4r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7701BC4CEED;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747932697;
	bh=XqRKlmwtskDBzgjp9eBWrIxZScG8XDNG6qHQOIsuaGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BDBCMx4rMOVfWemhvYqVCQ9CzTDfGSDqAuvmeKySp11XmKVY1NwTOQOoOjeCRZ+VU
	 TL+qZ0ogbsWGFCY7pk5yxSq+/xrI2wopAN6BcBtw0vEV59qPfLxUfSiR5s9c9Kymvu
	 RVCqfu+ZA1nT5BN0pYI57QbUCknUmsHNhEGFsF9xT8UxRa4CZVeo9OD14rydcU5Dtj
	 0FwVOud0lk1zbfztIb6rY+Bw9Z24MISZITRNtCQnv5QBnRNFGy9CuAaJUntvQGJuLI
	 CPtC6Jrix3Xv5EaVcnIPOaXHvNta4OrsCR845zUy0zlwoKoGTZUE4Yjs60Y+Yi+jaN
	 AP9DZzSGwCE9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FB3C54E90;
	Thu, 22 May 2025 16:51:37 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Thu, 22 May 2025 18:51:04 +0200
Subject: [PATCH v2 1/2] dt-bindings: gnss: u-blox: add "safeboot-gpios"
 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-ubx-safeboot-v2-1-08c22378b8c9@geotab.com>
References: <20250522-ubx-safeboot-v2-0-08c22378b8c9@geotab.com>
In-Reply-To: <20250522-ubx-safeboot-v2-0-08c22378b8c9@geotab.com>
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747932696; l=1890;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=Qgfr/42Hk/Jl7APKEe5TWsDxVDS5VL624ZuNvtX/yFo=;
 b=RR2rXONjgeJOS3q2oViWu/z3Xnbe5J92rwAaRkPUD7Qyz+Y1SzrloMBVy85A836QHokJ3IKM7
 gzG8Zfod1wmASeNBXZSLofMLUo2Cg9EBkYPokgOiwW0SHVU66lhLf1G
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

U-Blox 8/M8/M9 chip have a pin to start it in safeboot mode, to be
used to recover from situations where the flash content has become
corrupted and needs to be restored. Introduce a binding to support
this safeboot pin.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..7589327a77da5c70bfebe57685e2a4bbfd95934c 100644
--- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
+++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
@@ -6,10 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: U-blox GNSS Receiver
 
-allOf:
-  - $ref: gnss-common.yaml#
-  - $ref: /schemas/serial/serial-peripheral-props.yaml#
-
 maintainers:
   - Johan Hovold <johan@kernel.org>
 
@@ -32,6 +28,9 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  safeboot-gpios:
+    maxItems: 1
+
   vcc-supply:
     description: >
       Main voltage regulator
@@ -49,6 +48,18 @@ required:
   - compatible
   - vcc-supply
 
+allOf:
+  - $ref: gnss-common.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: u-blox,neo-6m
+    then:
+      properties:
+        safeboot-gpios: false
+
 unevaluatedProperties: false
 
 examples:
@@ -61,5 +72,6 @@ examples:
             v-bckp-supply = <&gnss_v_bckp_reg>;
             vcc-supply = <&gnss_vcc_reg>;
             reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+            safeboot-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
         };
     };

-- 
2.34.1


