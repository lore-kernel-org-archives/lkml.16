Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D325D1519BF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985329; cv=none; b=u6zv5Pv+mq5oaJYH5EVVsoLxduZucRQzbKER41rD/Y2QyLHprkeb2k9M/K+rd03T5hpXRWOmIZ2re2VKVzJ1poCh8ieTf72m7R+o+BsaDmcm1429QQMF8cfKNYULCNIv4yIjt/DsV1bPnZBfs7g920ywOzT1BtseK95H/cvcs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985329; c=relaxed/simple;
	bh=lu1thmBnmj6RCUgXCdD4m/vjaN2AsZlWOYwTDC0zvCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ls/0cy39QywBZXqncjomkdKghR9kxQiN2i2stO24RVEtXL7a9t+8AA3r6yX6BvbG304c8pTIZZwi/UWWe+A55cQX9h0dv47MAyHA9TIATeIihXsWoykoQ0nNs95GR3fpZtvqfFnsu8lUsTwB41Tz4ROvAshOiddQbTE5sdSc54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZfGny40gGzjJm;
	Fri, 18 Apr 2025 16:08:38 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZfGnx2HJKzrrT;
	Fri, 18 Apr 2025 16:08:37 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 18 Apr 2025 16:08:20 +0200
Subject: [PATCH v2] dt-bindings: usb: usb-device: relax compatible pattern
 to a contains
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-dt-binding-usb-device-compatibles-v2-1-b3029f14e800@cherry.de>
X-B4-Tracking: v=1; b=H4sIANNcAmgC/5WNTQ6CMBBGr0Jm7Zi2QERX3sOw6M8UJtFCWiQS0
 rtbuYHL9yXfezskikwJbtUOkVZOPIUC6lSBHXUYCNkVBiVUKxrZolvQcHAcBnwng658LKGdXrN
 e2Dwpoew6fzFCd9I0UDxzJM+fo/HoC4+cliluR3KVv/Uf+ypR4lX42npfK63F3Y4U43Z2BH3O+
 Qv5Ahiv0gAAAA==
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
compatible matching table to include this new productID instead of doing
what is usually done: have two compatibles, the leftmost which matches
exactly the HW device definition, and the rightmost one as a fallback
which is assumed to be 100% compatible with the device at hand. If this
assumption turns out to be wrong, it is easy to work around this without
having to modify the device tree by handling the leftmost compatible in the driver.

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
Changes in v2:
- use contains: instead of pattern: to relax the check, similarly to
  what's done for PCI (suggested by Rob),
- Link to v1: https://lore.kernel.org/r/20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index c676956810331b81f11f3624340fc3e612c98315..09fceb469f10525e9dcdb91435b142b0d21964b8 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -28,7 +28,8 @@ description: |
 
 properties:
   compatible:
-    pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
+    contains:
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

