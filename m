Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5E23ED6A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748279678; cv=none; b=AFDDY1S+bV9C3KxLfvtnbFG6e0ndiDlDQGyobTW5nRhbw/TZZvnF/sHZsNpVCJYa/nAL7C/LCMNz17iyg0EzzHo/GvSvP47xRReyXWtu61p5L8Kyw/bUEuFhq9KubB9zu6nAKG4OjEcYO1AF/7Gzqvql75ivB9tOaRSqYut9/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748279678; c=relaxed/simple;
	bh=RCOQ0yR3/Tq04KxHilLxkDpGrxvL/qQ+UU0j1BZZrYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ly5zRo8cen7+LAIoYCWyL/OfMMEusF1AAysoEFnJHTpESsVUCQ5jzoyol1ZTo/re1MNvy+TQqxBXyg423NHmrov51DvORYdklB7hV3/pma4a7zOczUx8Ur5MsBxov+mntFpmHd/bM1l3yRTWdywCHmRnlrwwaR6H6I+om81cucY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b5hwV2HZczbDZ;
	Mon, 26 May 2025 19:05:30 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4b5hwT1GVjztYc;
	Mon, 26 May 2025 19:05:29 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 26 May 2025 19:05:15 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC reset
 method
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-rk8xx-rst-fun-v1-1-ea894d9474e0@cherry.de>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
In-Reply-To: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
bitfield for configuring the restart/reset behavior (which I assume
Rockchip calls "function") whenever the PMIC is reset (at least by
software; c.f. DEV_RST in the datasheet).

For RK806, the following values are possible for RST_FUN:

0b00 means "restart PMU"
0b01 means "Reset all the power off reset registers, forcing
            the state to switch to ACTIVE mode"
0b10 means "Reset all the power off reset registers, forcing
            the state to switch to ACTIVE mode, and simultaneously
            pull down the RESETB PIN for 5mS before releasing"
0b11 means the same as for 0b10 just above.

I don't believe this is suitable for a subsystem-generic property hence
let's make it a vendor property called rockchip,rst-fun.

The first few sentences in the description of the property are
voluntarily generic so they could be copied to the DT binding for
RK809/RK817 whenever someone wants to implement that for those PMIC.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..0f931a6da93f7596eac89c5f0deb8ee3bd934c31 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,30 @@ properties:
 
   system-power-controller: true
 
+  rockchip,rst-fun:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description:
+      RST_FUN value to set for the PMIC.
+
+      This is the value in the RST_FUN bitfield according to the
+      datasheet. I.e. if RST_FUN is bits 6 and 7 and the desired value
+      of RST_FUN is 1, this property needs to be set to 1 (and not 64,
+      0x40, or BIT(6)).
+
+      The meaning of this value is specific to the PMIC and is
+      explained in the datasheet.
+
+      For RK806, the following applies
+
+      0b00 means "restart PMU"
+      0b01 means "Reset all the power off reset registers, forcing
+                  the state to switch to ACTIVE mode"
+      0b10 means "Reset all the power off reset registers, forcing
+                  the state to switch to ACTIVE mode, and simultaneously
+                  pull down the RESETB PIN for 5mS before releasing"
+      0b11 means the same as for 0b10 just above.
+
   vcc1-supply:
     description:
       The input supply for dcdc-reg1.

-- 
2.49.0

