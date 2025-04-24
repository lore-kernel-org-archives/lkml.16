Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55302701C1;
	Thu, 24 Apr 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507316; cv=none; b=YOjNRSVhe/sobfz3KEXzoVFtDsZ58VfOVmmDaVg0eRI/4vdTyHEGkiaPb35GVbZjvwrK3aFQN9t9NOzZB/cIpUqDWIhU4+0y7QMabmEuWJXeC2zU1kCYUUDVrN4XeKyPNXS4NMEKuZ+qijMQUfIbr9U8gimyeX1xePT/ZZcGfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507316; c=relaxed/simple;
	bh=ysqejkYfjxpCIrghiIwEv4Qf5J8es5gI+FCSdP8BhKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7cSRAYb/d3VlV6T7AU19OFeunYCAiAvAQzGeDeDJZDb75IPKAK/LnTcfj0twPLvr31rEu+weS1xvk89wYriEYwMiTMdPuf464JxclJH6OQ4SDOoOJG6acL6c8Fl4aMU19jay5jGa1QuijpbVI/7mNfL9sdoyJcTlks/etzJNAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RYvwIIx4; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RYvwIIx4"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A1DB43B33;
	Thu, 24 Apr 2025 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745507305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajfOfaTCL2MKfS2x+WJYBG1jd3ZTHqHodE2MhOxxRPM=;
	b=RYvwIIx4HZt/EFktTkspO9vNzsFMFwQdKiamtGHRCuoBcSr82nbq1Fk/M66NDRSeUQz0vN
	lsK7oM9T8vvDSlUoDSXFFoWlSfSQ0wMOi78t5+VsgcXDiaGTpZx1muCvLKtgIA4q/Sc7E3
	mjLTLtYgqBerEqXu53Q0s0zM9LjlTA6/k3f6x9Cku2FcRe/TiNnLsQUGrgDN6IKYYQ/GMM
	EabeS/hLmreGuEfWq2fISip41vDbrW03cGEMnBsuOrX3yLsaMtC4mnITE9EDbTZUxNAjy0
	aHrfKG5XnQQIXUIzuPjlgkKNHPEKiW0tVYGJZi+XmQaqj3WB63/3nl2av1cRpw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 24 Apr 2025 17:07:40 +0200
Subject: [PATCH RFC v2 2/5] dt-bindings: display: panel: ili9881c: Add
 data-lanes property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-feature_sfto340xc-v2-2-ff7da6192df2@bootlin.com>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
In-Reply-To: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeljeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Add the data-lanes property to specify the number of DSI lanes used by the
panel. This allows configuring the panel for either two, three or four
lanes.

At the same time, extend the devicetree example with an endpoint node for
better clarity.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Use data-lanes property from video-interfaces.yaml
- Add endpoint description example
---
 .../bindings/display/panel/ilitek,ili9881c.yaml      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5ebdd92f460a78d0e56e1b45e7dd323..3a897e464178dfc8a7c70e0fafb51184c50a520b 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -27,6 +27,20 @@ properties:
   reg:
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
   backlight: true
   power-supply: true
   reset-gpios: true
@@ -53,6 +67,12 @@ examples:
             power-supply = <&reg_display>;
             reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
             backlight = <&pwm_bl>;
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                    data-lanes = <1 2>;
+                };
+            };
         };
     };
 

-- 
2.34.1

