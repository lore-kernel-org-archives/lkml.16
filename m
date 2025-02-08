Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC7323C8D4;
	Sat,  8 Feb 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739010332; cv=none; b=Nhkup0Mi8w6pfdoMAOquRMwPifll3u3Bv+LML6FSocKrl0neBVkJbbO4H4z6YIhDB1opsaeh6p9V7KzF9UoFt23iBiKcK6R/Fmnvt/xWZmBasEeoIupoDOocNkoXR0DHU2ocUJ7FIK51vv6ae9K9bsZWMwPn/K7K/1i9pGkK4fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739010332; c=relaxed/simple;
	bh=EfqY9jVjNxrrj+i6ZHLyQBRofU2Q3odZnxVSzFNdeAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAwV2qJ+4HVxJ4nXKaRXrJfwVI/YBZLuj0a9Fj+z17g6vdOigGKo9Z2sVai1+NqAX1OecbPYu4xkfTXSwv6zmj2yI19FbxYFV/NVJXc5MhkTMvrpk7YCwiYe37DcURQu5SJTxb8Ppu0w0CJqHnSXlRLNdj4rW90OIa3KlIDwmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [IPV6:240e:3b3:2c01:6750::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id a7d7b0c7;
	Sat, 8 Feb 2025 18:20:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/1] dt-bindings: net: rfkill-gpio: document reset-gpios
Date: Sat,  8 Feb 2025 18:20:09 +0800
Message-Id: <20250208102009.514525-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250208102009.514525-1-amadeus@jmu.edu.cn>
References: <20250208102009.514525-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEwdVhlOTBhPSkJOTR1DTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtKQU1MTktBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a94e513090503a2kunma7d7b0c7
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxg6Hio4HjIKHgI4C00LQjUL
	ThowCUJVSlVKTEhCS0pLS0pDSUJOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0pBTUxOS0FBSllXWQgBWUFKQ0NINwY+

Some 5G WWAN modems have multiple gpio controls. When using rfkill command
to manage it, we need to at least change the status of reset and shutdown
gpios at the same time. Also, it might be incorrect to put the reset gpio
at usb when the module is connected via USB M2 slot, there may be other
devices connected under some USB node, but the reset gpio is only used for
the WWAN module. So document the reset-gpios to rfkill-gpio as an optional
property and add it to a new example.

For example:
  - reset: modem Reset#
  - shutdown: modem WWAN_DISABLE# or FULL_CARD_POWER_OFF#

rfkill unblock wwan:
[  109.582080] usb 2-1: new SuperSpeed USB device number 2 using xhci-mtk

rfkill block wwan:
[  126.611963] usb 2-1: USB disconnect, device number 2

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/rfkill-gpio.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
index 9630c8466fac..7f297efdc976 100644
--- a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
+++ b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
@@ -29,6 +29,9 @@ properties:
       - wlan
       - wwan
 
+  reset-gpios:
+    maxItems: 1
+
   shutdown-gpios:
     maxItems: 1
 
@@ -49,3 +52,14 @@ examples:
         radio-type = "wlan";
         shutdown-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
     };
+
+  - | # 5G WWAN modem
+    #include <dt-bindings/gpio/gpio.h>
+
+    rfkill {
+        compatible = "rfkill-gpio";
+        label = "rfkill-modem";
+        radio-type = "wwan";
+        reset-gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
+        shutdown-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.25.1

