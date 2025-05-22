Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689C29A33D;
	Thu, 22 May 2025 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930773; cv=none; b=SF7W6BL/Ueq41R+I9dU7j/GNUvan5lnxN76xADveGuH81ReQ+PcbwcYMQVNo4SfXFsErE5WXtubLJoFUrZch7qw0otFJ6jPjs7fwsCrBFGfPI0mZa2v+ybh0nX7/r3mOYdkzoFp5MwntxkEphS4YzwJWrEA/JxuatZEK2BgfuI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930773; c=relaxed/simple;
	bh=5sGsWn9w8s+oMgEYou4FZnNBF76aTQSa8acdMWwrMmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qQYGK8KRw41dcHqrlFIZsG/LVKVBJgGun0J6kV3BEOgM3lof0OXHrbOcKbr+AFFZuducm/+ft+hPRe5ZuRnTdYOkzu/BbrkXOmvFUaXz9EEdBm8ZJFtpWFQvMbRmNjI9ZqAyndsWZBx9ekM7t/7J95osxNSnZB5IuYQp7Jdth2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4evEDLK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4evEDLK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7D17C4CEEA;
	Thu, 22 May 2025 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747930773;
	bh=5sGsWn9w8s+oMgEYou4FZnNBF76aTQSa8acdMWwrMmw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Y4evEDLKmUbymXxPSdPalM8Gh0KqQs+91ELJfJyzSyINWB0ZhZRytcCMW8LAAzHvU
	 flD067BB/x2fAX9aiOvYWcSWunn4zR6khsZMYMlllDA0rTZTphzKx0QDrILP9e3VFn
	 j2YzyVnpHUxEuAfKO4V08lfDz4w9WPNEWd/+UG4Ehiv2TXiZ/Q1zAwTip5/ieHJDU9
	 hYDYkrk05vHxo+g0wWRCMSDSEAJ1be/whuvOKzWiGT4t9Qb1AO0uNpaQ79O9YZ9wJC
	 c3a5YsU5/imkQeqysV52UP+UW2sgcIcDCr3urJj3f9nhv2w+Nep+T3KAKGypmCngJJ
	 Vu1W6Bx9OoByA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B37C54E90;
	Thu, 22 May 2025 16:19:32 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Thu, 22 May 2025 18:18:53 +0200
Subject: [PATCH v2] dt-bindings: gnss: add u-blox,neo-9m compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-ubx-m9-v2-1-6ecd470527bc@geotab.com>
X-B4-Tracking: v=1; b=H4sIAGxOL2gC/2XMSw6DIBSF4a2YOy4NL6N05D4aB4AXZaA0YImNY
 e+lTjv8T06+ExJGjwkezQkRs08+bDX4rQG76G1G4qfawClvacskeZuDrIp0dHLUTb2VvYF6fkV
 0/rig51h78WkP8XO5mf3WPyIzQglTQnVCSyesHmYMuzZ3G1YYSylfcOKvU50AAAA=
X-Change-ID: 20250514-ubx-m9-70df0fd8c48b
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747930772; l=2006;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=t0h9nv36tZoG6bCZ31dIAWWzsXZFdgQLmDpUFpX3zjs=;
 b=EhlRZpfjBQLxmdyD8lQdg6w8IHy+r4AlzNb+4MatuJ3P0EVtYYbxqRBPgFdJfFxnOxavcDWEH
 hmJj0sr1djpDg9WMCqanO1aja/WbhQUJt7KJ4MT1i+xqUdV6lcE6w0l
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

Add compatible for u-blox NEO-9M GPS module.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
This series just add the compatible string for u-blox NEO-9M module,
using neo-m8 as fallback. I have tested the driver with such a module
and it is working fine.
---
Changes in v2:
- Modify the binding to allow falling back to neo-m8
- Remove compatible string from u-blox driver
- Link to v1: https://lore.kernel.org/r/20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com
---
 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..215f8931ca08c1b0954fc2f70eabe3ec8d89edea 100644
--- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
+++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
@@ -18,10 +18,16 @@ description: >
 
 properties:
   compatible:
-    enum:
-      - u-blox,neo-6m
-      - u-blox,neo-8
-      - u-blox,neo-m8
+    oneOf:
+      - items:
+          - enum:
+              - u-blox,neo-6m
+              - u-blox,neo-8
+              - u-blox,neo-m8
+
+      - items:
+          - const: u-blox,neo-m9
+          - const: u-blox,neo-m8
 
   reg:
     description: >
@@ -63,3 +69,14 @@ examples:
             reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        gnss {
+            compatible = "u-blox,neo-m9", "u-blox,neo-m8";
+            v-bckp-supply = <&gnss_v_bckp_reg>;
+            vcc-supply = <&gnss_vcc_reg>;
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+        };
+    };

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250514-ubx-m9-70df0fd8c48b

Best regards,
-- 
Alejandro Enrique <alejandroe1@geotab.com>


