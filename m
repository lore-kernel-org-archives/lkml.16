Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5611214234;
	Thu,  8 May 2025 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725843; cv=pass; b=s12tP6xA34QkT3e+IT5c+U7DAKX5j9LXVS/Pp7GAvCuwIPoWrRBLNmcAkDCMYtJhr+rkHq8udrX7dMSUL/Zlb1fTbJDaVtJ2uXpMdZfEebRs1URwGVOdVlPVgs0c33CCgTU6/XhgbiXkAi19FOejW2lplYPxWIlX+N50UBst35A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725843; c=relaxed/simple;
	bh=Mpdz11lRfSda/bN0TCgdCGp+o75tqHieLP1wvt8v/N0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=il6CHEhmWMraWggr0AEoGrZzJeNXxliUacKRXBPkVtQ5nphu4/59zb86B/Uh5mpX8T6E6ulZx4IsRZlVKv0zOMkefjK3DclLAuX/HwDMutihvRaCQXGz8puotK77QLMHQ5hUdr15JriFQ3yEzoRriVcI0VefJAGFpcE/qvd+KII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de; spf=pass smtp.mailfrom=a98shuttle.de; dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=ZVvyJCRK; dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=AyNZaAhz; arc=pass smtp.client-ip=85.215.255.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a98shuttle.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="ZVvyJCRK";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="AyNZaAhz"
ARC-Seal: i=1; a=rsa-sha256; t=1746725831; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=E/hu1PaHoB4ZtYo7xbH8KOeUnfSUrqpnCYMfSSUbAop2QsDmf1BV7UbxD+zXSQRAVl
    vYsFookEPeSjaQth2lgeCP1bZa9kc6BvFOFZEHKf7wTX2kOYFuG5PPhLDuDfj6E8wd7n
    EV+qgxyO1R/vhLQPoJVFmL0tHBNJPOIC6BUNdullnZUeMXqFXGIy0nZShulYFDzm645c
    rS085v08u8XAiw7GBKR6sNZQDR7BHFPU9ASQY88B3GCzGEETAVQqCCscXr79zFFBqgWa
    EC9D5YsrAqw8ffe5HSGCJicicmDJ97rNDoymj04tl7mg/A6YMJNTH1d8lb3fApf1LItp
    jR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1746725831;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6EUN3uH+cBsC/FYES8tXDJVOJ0qqEl8LtFAqKxXbW7w=;
    b=YdoZCzkrPzOWFHEOng6OrmkO5BxHIsFRQuquLSiMbe/5lp1nNEJf061tcueoavvzQc
    gmnVzvY08u52HrIBTDIKRjJQqzuml0Ian8LrBQ8TgPBX1bZLpiGslP0/Ij9/qmMs2NNF
    7Epc0rVQA9qNqTyw1CD3KuccSMxhfioO94T/v80Bu/ORtGiThn7qkdgbc68aXVGzjk5p
    a7Qs4GyTImU3Y6AKezxWj4KD9rGQuh/ixEl6DTiayFvVewFxtIaWM15O+freWOTL8yLo
    Of44MROQiH8z/bgsf4k+s675pBA8E1eZE4zXFX6J+Vo9DXrNlHLyS7dnpgjJsBeB8MfQ
    gXwQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746725831;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6EUN3uH+cBsC/FYES8tXDJVOJ0qqEl8LtFAqKxXbW7w=;
    b=ZVvyJCRKpmBeBE/RO8xHt/Oq8MuvgFFnkbDfFfF0sff1gZ65r3C1zL+X4c58WTwXNr
    Y6/RAyUtEaJ6Zu6Yz1QV8e8XpTDAFEAOA+ldPreO1jCEjsEo9lz01W/+iTL6qEUWZGqm
    I0XQqg3RRvfOfVnuc42lhlCPBfsD8dm6B1O6iJzhG1WdeCrO8GlPT6vfORldxe3cXLUu
    RzzDRvBIdAXHiOzsCZgaMjhXRVCd8oxf/AGfXC72Qu3l+b48KPJtmNzM/na8NJ4ZAPmz
    jNpOuUwi42M1kAf9knCJ1l0c29WEeh9noXsXfosnz/RihcLn1lKyaM5JRbrZ3fLu+KcT
    G9Gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746725831;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6EUN3uH+cBsC/FYES8tXDJVOJ0qqEl8LtFAqKxXbW7w=;
    b=AyNZaAhzM3eRbO/LdasN+IUEhKYe/C47l6PUCtor5g33FLlsfIgzuzxmpjJAUCx9g5
    THDWVrLM0wtlyjmCyyAA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b35148HbBLQC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 8 May 2025 19:37:11 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with smtp (Exim 4.96)
	(envelope-from <michael@a98shuttle.de>)
	id 1uD5BG-0007JD-0K;
	Thu, 08 May 2025 19:37:10 +0200
Received: (nullmailer pid 8724 invoked by uid 502);
	Thu, 08 May 2025 17:37:10 -0000
From: Michael Klein <michael@fossekall.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] ARM: dts: bananapi: add support for PHY LEDs
Date: Thu,  8 May 2025 19:36:56 +0200
Message-Id: <20250508173657.8695-1-michael@fossekall.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The RTL8211E ethernet PHY driver has recently gained support for
controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
the device tree.

Signed-off-by: Michael Klein <michael@fossekall.de>
---

v2: Refine commit message
v3: Move patch changelog below commit message separator

 .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
index 46ecf9db2324..d8b362c9661a 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
@@ -48,6 +48,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "LeMaker Banana Pi";
@@ -169,6 +170,32 @@ &ir0 {
 &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
 	};
 };
 
-- 
2.39.5

