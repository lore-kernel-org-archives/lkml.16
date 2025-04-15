Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D7297A74
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728615; cv=none; b=odDJaUkHGaas1tw3fO7VyRlvgEd9QueKBfgkgPkRyd+uxzKWfBO8TAX+Q9Texr8fq/uSq8DReOEWeN0SLhqwYmfuC7dmFfrQcqmsXX/gFQBaBL5QHKGgMoe6A5DxqOWwjZ1Nhyk5yvCIIi67gyul9wojtUjHjRUasTd92pYBfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728615; c=relaxed/simple;
	bh=rFY3Uz+5Cg+Hms8YcmOjpiGJwkwP4E5PFhqVE2K/cso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qyJEiZ6C5reB+kxIHemSKlgy27m4cV26caNrJPQjdnnHNTV76YTxLgALurIFjx3isGOfqcjDkNfuDM1b3twIo2+NyDv+rlWc6ONLp+eFVcf7i4o7tcgPn3tjD3/ilJxrzhtZu/JRsgWeR33BvudCJnM2KpSwO7ECY37XEPY2iOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZcRWK3KJhz6Zx;
	Tue, 15 Apr 2025 16:34:37 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZcRWJ3zn6zZNH;
	Tue, 15 Apr 2025 16:34:36 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 15 Apr 2025 16:34:27 +0200
Subject: [PATCH] dt-bindings: usb: usb-device: allow multiple compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de>
X-B4-Tracking: v=1; b=H4sIAHJu/mcC/x2NQQqEMAwAvyI5G2hFsfgV8dC0UQO7VRoVQfz7l
 j3OYWYeUM7CCkP1QOZLVLZUwNYVhNWnhVFiYWhM05nWdhgPJElR0oKnEsbiBMawfXd/CH1Y0To
 392S8s9RC6eyZZ7n/j3F63x/JizVQcwAAAA==
X-Change-ID: 20250415-dt-binding-usb-device-compatibles-188f7b0a81b4
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?=C5=81ukasz_Czechowski?= <lukasz.czechowski@thaumatec.com>, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The dt-core typically allows multiple compatibles[1] but usb-device
currently forces a single compatible.

This is an issue when multiple devices with slightly different productID
all behave the same. This would require the driver to keep updating its
compatible matching table and the bindings to include this new productID
instead of doing what is usually done: have two compatibles, the
leftmost which matches exactly the HW device definition, and the
rightmost one as a fallback which is assumed to be 100% compatible with
the device at hand. If this assumption turns out to be wrong, it is easy
to work around this without having to modify the device tree by handling
the leftmost compatible in the driver.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/dt-core.yaml#L21-L25

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This came up while working on fixing USB on an RK3399 Puma which has an
onboard USB hub whose productID isn't in any driver compatible list
but which can be supported by a driver with a slightly different
productID matching another variant of the same IC, from the same
datasheet.

See https://lore.kernel.org/linux-rockchip/20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com/
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index c676956810331b81f11f3624340fc3e612c98315..9d55be4fb5981164cca969dbda5ba70ab3a87773 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -28,7 +28,8 @@ description: |
 
 properties:
   compatible:
-    pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
+    items:
+      pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
     description: Device nodes or combined nodes.
       "usbVID,PID", where VID is the vendor id and PID the product id.
       The textual representation of VID and PID shall be in lower case

---
base-commit: 834a4a689699090a406d1662b03affa8b155d025
change-id: 20250415-dt-binding-usb-device-compatibles-188f7b0a81b4

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

