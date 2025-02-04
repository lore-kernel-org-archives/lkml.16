Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0804C20765D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659134; cv=none; b=XsjiZfefsyEin5PHPJmprbk5wgE6WeuNVFn35Gor+FNX0ox+kabP2N6DDd7Bi5J9HhC9tSnNhaH4DMD4uWJ75o2vkjXkoWWvffwWnxGDFUXeYiDI8y8KweTMHyQhtrxpFj69Sxi5aKbPBO8o9YmaFSpSyfc5RvcY0bk51gZz+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659134; c=relaxed/simple;
	bh=CfdrN5KwMDNTn0u864Qi3J5fvFlVoWNlZsoSlpdUyR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s8fyD+rDdQcbdFp1uBJeSRiVyWQ0y3NO/a7+z2U1LyPSBhOmTzM640PLWIe8vG7ZgumtAvk8dmpBRJZ1e2C7ELVIpGYiYxE+x04KpcOG3ARH0Dn8GkuRC7wi8boPbfeBfDq5whI175wz+XGeWOfKFyA/7cc6rFIQsBoUN5kOgoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IG+DsLH1; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IG+DsLH1"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6CC2442B8;
	Tue,  4 Feb 2025 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738659129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OkTbcjoIffMaSQaVJKCMVU7fDL9DGYAiY6/3g5tiNHI=;
	b=IG+DsLH1+RIjKXlAFMQ78qXBwSg/WId94sDWh1ThupraQMnPE/IsLBR0WrKw9/IrJB21Me
	p6TdC0rNUGFd6eFPIGwlOGV9cEy0FE1kr12T6ZTpfHLbzX4Ns80TcDqnKi9aizk9sLPKb5
	R00jLP40vLhtx7apA9lK/WtEX5GsQU1qEzKqJIyAAKIOIAP3LgwS6nZF9J4sNS0TQsZLye
	z0ranEaRbH9OO4N+V8/ukCc2V9d9wGh1XmxOKibKIBKmhsYjeO9OBf1Q8LWLEj1gcMVUa2
	7ZXavh2Iod7EyFSNzOjISrmFM7qLWll/bgf8vugJqjxyOGWIBbjy06yT2w4fiw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 0/2] DRM: small improvements
Date: Tue, 04 Feb 2025 09:51:57 +0100
Message-Id: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3VoWcC/4XNwQ6CMAyA4VchOzuzDhzgyfcwHsboZAljZCOLh
 vDuDi5qIvH4N+3XmQT0BgM5ZzPxGE0wbkhRHDKiOjnckZo2NeGMF8Cgoq23NFjZ99TY0buIFoc
 pUGiBFUoB4xUj6Xj0qM1jg6+31J0Jk/PP7U+EdfqXjEAZVSoHgSDrStWXxrmpN8NROUtWNPI3B
 EzsQjxBWiCXqCtRwg8o/4AAdqE8QbLWp1KkraaAb2hZlhfCopNHUAEAAA==
X-Change-ID: 20241018-drm-small-improvements-1d104cc10280
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfeiteekkefgtdduveeuffeuffevkeehieduhfefvdfhueekuefhhfdttddvkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumedvfhdtsgemledusggsmegufheiugemtggufedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumedvfhdtsgemledusggsmegufheiugemtggufedupdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This series brings small improvements to the DRM documentation and logging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v4:
- Removed pathches 3 and 4 because the added warning has false positives
  when cleaning up a connector in the init error path
- Updated acked-by tags
- Link to v3: https://lore.kernel.org/r/20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com

Changes in v3:
- patch 3: various fixes suggested by Jani Nikula and kernel test robot
- Updated reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com

Changes in v2:
- Added patches 3 and 4
- Updated reviewed-by tags
- Link to v1: https://lore.kernel.org/r/20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com

---
Luca Ceresoli (2):
      drm/drm_mode_object: fix typo in kerneldoc
      drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message

 drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
 include/drm/drm_mode_object.h       | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241018-drm-small-improvements-1d104cc10280

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

