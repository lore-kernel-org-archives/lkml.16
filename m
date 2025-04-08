Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B6E8F5A;
	Tue,  8 Apr 2025 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126027; cv=none; b=Rrfmpg2gppjOXbOcxkZM/WjsntE+5K1rKYfbg51IQCWvA0TzD+jj4ctmKzUOMZeCUMb4je1851wh6z2W2gAV8FubkPqj5He3wbBDexh7KXVoMlIYY6KidiFi7Ydhvjvnsvoy8bBhEnwyEdYGcbHcSvKGja3a05Cjxz51nvY5cuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126027; c=relaxed/simple;
	bh=onBIrP3+NLc+xs22yPLSnivp0ZQZjdl7sA4TdUIhX0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aXavjuXZLHXqOIo1arZBG5+bHqY5lf3njTaOyynCBK2P6UsOkv6mIFth8L3TTCKF1rf7/0FDQYuREn0nWKpr5u1unyAKWLi7jkqTE9ZyKdzUjB8nHaLFEMvChcxmQdd2H/AT5bFF3pOYKhFc6lbzHhtPzoKqhvm7RdrfHF4Sp1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B+vW1Cpx; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B+vW1Cpx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B832C443CD;
	Tue,  8 Apr 2025 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744126023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LfAx4lVS0KGN2cWpFco43WjIJVHZrufPU/v15sg8xV4=;
	b=B+vW1Cpxk2j9SQVdgSnkzsXvOJaa6m77+oYmpQJJHMQlkUbGEW+2k/zQzrHttaCtyVDItA
	kzeycUUKa+pgBiIObvDHvnTRtemTdsNobjZ2VQwRHTIApLh6k/qSXXd/UOlCb9StpCW6Ie
	Il8OXZ9H0zk4KyhQ3/zOHKxjo2R32NuCA6haMuHz1oSd5Q6Um3OQrv+HhRslVnmAV8Vqys
	xSHqtdoIsgpQ1Wpq+FPduhQy8nyDzHazCTiIA7Z+YQwonp6h+AWRpNhhV4JhBhpAGXk+Ti
	msT+jUGqEZZWRQhq46wQAfVt4sW5vmJkhvULf7LjVcEfPrO2/DeaZOta7gslBQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH 0/4] Add support for Saef SFTO340XC panel.
Date: Tue, 08 Apr 2025 17:26:59 +0200
Message-Id: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAENA9WcC/x3MTQqAIBBA4avErBNsUvq5SkRojTWbCq0IxLsnL
 b/FexECeaYAfRHB08OBjz2jKguYN7OvJHjJBpSoZYWdcGSu29MU3HXUSr6zWNCiNtrqRrWQu9O
 T4/d/DmNKH7t+hRFjAAAA
X-Change-ID: 20250129-feature_sfto340xc-d2b25a5b5748
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugefgudfftefhtdeghedtieeiueevleeludeiieetjeekteehleehfeetuefggeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvi
 hgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Add support for Saef Technology Limited SFTO340XC LCD panel.
Add alongside the number of lanes configuration in the ili9881c driver
as the board on my desc use the panel with only two lanes.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Kory Maincent (4):
      dt-bindings: display: panel: ili9881c: Add dsi-lanes property
      drm/panel: ilitek-ili9881c: Add support for two-lane configuration
      dt-bindings: ili9881c: Add Saef SFTO340XC support
      drm: panel: Add Saef SFTO340XC LCD panel

 .../bindings/display/panel/ilitek,ili9881c.yaml    |   6 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 267 ++++++++++++++++++++-
 2 files changed, 271 insertions(+), 2 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250129-feature_sfto340xc-d2b25a5b5748

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

