Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0136D221D88;
	Tue,  8 Apr 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126028; cv=none; b=HwMAKUbvDXp+0n6OzRBXGyE7ugQIXOhKZePAvlRZBTR8LpXSE/fdDpQ+YzstP0HzvKGHHA8581E4/zlUmgm+h6Qv1RedGO7JdcEr+0AkChyc6XAh3BUE7G2q2QyKU6zv2v2VhqX0xZqRlhyZq998d48pIujRVN8GIrXIhuyk/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126028; c=relaxed/simple;
	bh=z7kzxQaU2JIMrVi715B6mT06jRfQhT4siJ2MqcT0pzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrPB+Woq3bH+6aardN0zbeCDlvTtK/339ZaUPo3v/NRo7bj7wh/2tcooaE42rFfa093W22ingbURfbq/LP8wxCtsm6FqXl5+FPipxyeVpt9+4pB3+21iXWHMeHfghW6FPjn/pINoidpQzbaAIMpZZmBkblR9N1RlVI5v1m0QNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UlgbwyNm; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UlgbwyNm"
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE7E843291;
	Tue,  8 Apr 2025 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744126024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5PsY8isH+UjJ+MTxXst2noiDEN9q4jOAnmVDjsyuK8=;
	b=UlgbwyNmvvnklgknEmVfg3W7VwujEMBrRRgaRs4C2cV469sNy/iZ7cTl4LpPMK1GMalfZw
	VwaVn7+68Xax4VDzeXxQzC3fZ6rZEUMFky02GKOy0EbRnvk+5lzNAEb32m14dSwaJEhwSZ
	jyzlCU3wAy+USiAgZN3Hkw+0kGgo0k+4MKfF60i5QUYqFqo96rsld/mkuYpkA2MWGkAMh/
	6/B1nBdH9KWbFiFJFnJ3QXzkR3QkhJ/YUXPumL/pr6f/izNrHZILx+FCNy1qIGdjWNPfoD
	ija50DgpzedZkJ+Bi6MLAQCMIF6uNEQ/rn9C1CXyYGs8Uf91wG0zEsT/8ZpDFg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 08 Apr 2025 17:27:00 +0200
Subject: [PATCH 1/4] dt-bindings: display: panel: ili9881c: Add dsi-lanes
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-feature_sfto340xc-v1-1-f303d1b9a996@bootlin.com>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
In-Reply-To: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Add the dsi-lanes property to specify the number of DSI lanes used by the
panel. This allows configuring the panel for either two, three or four
lanes.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5ebdd92f460a78d0e56e1b45e7dd323..e36550616f6aac86c79832a48132ce8c11ebcf7a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -27,6 +27,11 @@ properties:
   reg:
     maxItems: 1
 
+  dsi-lanes:
+    description: Number of DSI lanes to be used must be <2>, <3> or <4>
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 3, 4]
+
   backlight: true
   power-supply: true
   reset-gpios: true

-- 
2.34.1

