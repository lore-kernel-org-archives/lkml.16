Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5624B1E7A;
	Tue,  6 May 2025 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561361; cv=pass; b=bHujGD8tp1uGj/MIZFesweouRReJJpYjyFnypZei0sLOKJlIQmqh4h5zJMyEhhuMa0wh8XCma7sAC+W5R/NPL3hpXlPwTh0vP+7vBbTUFNGwKbYbJk4EZ2ouwIH/Md6mOEcWEduJmYRupqZX19qikFC7+3jnJN6dxnX9zvMBvKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561361; c=relaxed/simple;
	bh=dpOQOwmZwxz5yxg6dU34b7vRGoW+3W6OH3VKZZ80vQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=un2F1I58KhcSaBg1zACYL2urWN3bfRyanBlJ0uDfWoBNbuXr9a5L9orTpVgnZ/nX4xRsfB8wUpMgPP5zztBEv1KHmsb6ewS945wjWjpjUkpNsHb8crNP8cFnSveZptIKfwbqKPW4KyXGOqKq0MRUrjsTUveY5CfFWmBEnvj9z6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de; spf=pass smtp.mailfrom=a98shuttle.de; dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=PlivN+BK; dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=e14vL1jp; arc=pass smtp.client-ip=81.169.146.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a98shuttle.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="PlivN+BK";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="e14vL1jp"
ARC-Seal: i=1; a=rsa-sha256; t=1746561353; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=iItlDEyQQkRMyzY8ze3m0HcU17dosn8Pkvvj+GX1tMTR08hGW36/BjwUFy8TVi6su/
    7GJo6rR47gHauQ6hB5UW1ex24N1+9vu5ZJJemyYFXsCjfLyUXWkuDGcZmhNikl+aPF7f
    tzk1aah9lLzfp78p/eTZCzfjTC+YJSwD/eZkdAa2vTbV2Zu1XDf9Q56F32LdKEUvucxa
    ZU4iR6j/USyNSw1OPXyX9g5U3+u4xjOW7CQOO9WlcuOcz/aD/S2s9atzhIHO+IBUPX9c
    nkNcH3IJHziYk7/SZvApQknO3NMyjXkZPYXm6Mna8KQ/8klPmCqxEDqHN5KsinyDzKa9
    Qnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1746561353;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=SHGcwlXyO0VPtrwwQiIYT7gn7XIrOvrSomEywP3J7og=;
    b=WhyD+tdjourEJZIX8lGosf0o8NIq3AuRggcPX2NOjOJPMj+Zf7RCMjExxw5btSkgQm
    rJ+E1WNop8vHHawAX1pUoYziuBrrCkxOj8cjU4FmKtT/4xLvSp7AM9Kx9By7gvhwerWp
    We0PU3ADcNsuhZZ4wu7URnriIEGBpcRjf/o1+ieuHxGOo6XjZ5gYz4sBi3BgY2WbeHyJ
    TdFpDCV83A+fvGds/Kn4hOiD21YVxlR2wFIDIJkpuhfaMzTDSTUe3z0ZP6RZXrZQrnJu
    1kNXC0olQnB8XZ2Kp9A13bV0WLO2XALNOIRlC+MRlzQ+0U22oBe5Y8Krqaj2fNHq4wzE
    /j2g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746561353;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=SHGcwlXyO0VPtrwwQiIYT7gn7XIrOvrSomEywP3J7og=;
    b=PlivN+BKYFOt78sn38yRJhJMT5IJNBMKR2aJfujdg6FJj4moe3ieCoI+XyTi1DKslY
    TY0Edu9vIPrWiRpA/GCWvV7L+QnXxjNeUmJoS8w1Ptea9aY1sse0R8vXUviJLMevWItP
    58vWuWWerIGW3shhzZDOpqNm8Myob7+kuuMd0hEBfBi2hrPSoOrXxXkpiAQxydmAyN2G
    ENLctgZHWLDaPWb65zxgBW+ox9JWe3MV/oT/Nod6FJNZ4ricpZKqmZbULLN/vE5UcDQW
    RQTrJTZQ0KrpDdRxWztBsczYjUKPI4BlJhdGRMWfSX2MWLwI6WWV8wGto5+t+shmNvZP
    Visg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746561353;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=SHGcwlXyO0VPtrwwQiIYT7gn7XIrOvrSomEywP3J7og=;
    b=e14vL1jpjJXxoo3bX97kkuUXfmD11zmNoRFt8Q89JoNLbqCqgBMsawyAZsNd1Atw8B
    GIZ8SV7pIdK2v8JZ2/BQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b35146JtqAsr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 6 May 2025 21:55:52 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with smtp (Exim 4.96)
	(envelope-from <michael@a98shuttle.de>)
	id 1uCOON-0000ia-1r;
	Tue, 06 May 2025 21:55:51 +0200
Received: (nullmailer pid 601301 invoked by uid 502);
	Tue, 06 May 2025 19:55:51 -0000
From: Michael Klein <michael@fossekall.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: bananapi: add support for PHY LEDs
Date: Tue,  6 May 2025 21:55:24 +0200
Message-Id: <20250506195524.601268-1-michael@fossekall.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
Add the corresponding nodes to the device tree.

Signed-off-by: Michael Klein <michael@fossekall.de>
---
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

