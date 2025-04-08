Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC42229B23;
	Tue,  8 Apr 2025 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126029; cv=none; b=pj+7Xx19haSudxAIB4WX/WLcY3xNDmJgSECzKufO8Ebw2qfXLVJx2RHYoFImNxEY/2bEOGSZeghy2E3HjB0URWfEgRi0Cdc3dNzARe9jzceCPe3PaqYDmDl19y+CjSUIxJNZIl3ISboQLZtvdfAObvZaK0Hb5tYPaa52EXzglIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126029; c=relaxed/simple;
	bh=/qURbs4+6HrEkmXRc9kCuVNQPAB8uTUgfCHtSi61HW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gg8iUzUXnXpYIzxFYiLJGYV7FIli4LEBoQzf3DelopdvZfoJBUAHTo4bJcC8yKF5LpWWWY4WzF1UF+Iq20UCstu1mxTKbnZsWNAqpsypxZxxMHng/QkJPN3hz6ghvMrLm5OqlOtj8IhfUBW+Xi14K7Wx4wEnMRSSO2gDocO7cHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HpizRBVA; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HpizRBVA"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C49443C7;
	Tue,  8 Apr 2025 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744126025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcXfDagnWGodjrLY8rm4oGEwQluwSkfRo86/Yikyi58=;
	b=HpizRBVA5L/ws3FIlFwztlMaHrGEErygckVcKcBfR+r1cxzp3LKLsc10Fy4iwXovCXsAuN
	C/n4lKCYkrunmwBVukXFSdoHesWk6M8CA1NSQyD94NvnGJ+YQFi1VPPAGZgrZ8RMoVh3VU
	o7P93LgQDnxuHKN9ZiJid7oi28LEzHUAWLQI8J9rSnPTusI0W8/JQ21hgby4ZSmIesIrzc
	JuYQ6oFS9oZlpZO4M1WGi841OeLfSzutlWyWeXiXvQsajsuAI/bX0whGM9rELy+PiZJaSo
	QcEOJVwMSC97lEfStuNjAg6RT3J3nT5yLj4kXodDb4aLkXxWCNG37uN/h0YiXg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 08 Apr 2025 17:27:02 +0200
Subject: [PATCH 3/4] dt-bindings: ili9881c: Add Saef SFTO340XC support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-feature_sfto340xc-v1-3-f303d1b9a996@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Document the compatible value for Saef SFTO340XC panels.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index e36550616f6aac86c79832a48132ce8c11ebcf7a..7e47564cf1f18a9ea9e64deded7a7edbff133406 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -19,6 +19,7 @@ properties:
           - ampire,am8001280g
           - bananapi,lhr050h41
           - feixin,k101-im2byl02
+          - saef,sfto340xc
           - startek,kd050hdfia020
           - tdo,tl050hdv35
           - wanchanglong,w552946aba

-- 
2.34.1

