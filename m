Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135C24A07B;
	Sun, 27 Apr 2025 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745085; cv=none; b=Htm37DFWxyxkCWlFh7pgsTtRwUBH/J7G7KlzFxn6gNONCuDl3jQexEBBH2yc+xbpuKLy/BFYuEdQTdGMcwZSqxFaDy9I79eD5QgHglzSywiMSgfzUYZz65ZDu1lXDFyltOWbUY2VGXQYiAieUikYCOxWRNPEJEZEvkHx09fMnGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745085; c=relaxed/simple;
	bh=QdLkz9HIQwG0Lztr/8GKFq4ltt3zfOwpXgoolgkFwhw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LaCJZKlEXq9pBnWnFGi/NU1x6BtTx7XvtaXlJ7KvKo6OTgbsgn+K7YSNUEdWfaIDcBnGVIXgiyI5xb+6Z/mJ8Yj7niEHkPhEqQMMXG7n50Q9g35nqcNBp4ajorJEG3AKo/OOMU7sMOzcHO9H3Goy1NUMXf6/U8+VQ4Z+3lYGyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=X8p3q0j+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="X8p3q0j+"
Received: from [192.168.80.162] (254C2712.nat.pool.telekom.hu [37.76.39.18])
	by mail.mainlining.org (Postfix) with ESMTPSA id DFCBBBBAC4;
	Sun, 27 Apr 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745745075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fhWq+YLEhSYtuiJd7ME2LnrPPOIcmR8L3Aqjf8KIYI8=;
	b=X8p3q0j+10RjfxkQH6cnTW076eux+Gjy0ds5Roe/C4y2nh63gEbwk8TdtqC1lXQWmslEC7
	7Bybg5h0O1zHsyIgFyV2vGlPUozIQWq9wsZPxIi0WSax+nwYX3lJ8tZZkEBOaMZUIkNXwo
	dJFx8MF8HfJe+8psN0luNU6ZLPx2xuk89Q/pC2XkqUE+PK/SygZPSDrpYm5sj0M5xDQaUh
	QBUoGs63N0jHp/WcZkrLScLYRyjpQD9mqXMzIjqUF+PFfLZVQQgSEoUCUvwg3QL5LUgNfW
	JL42eOgvwMxpEJMmcA4Ck7EyANNLTGdN2wCcquXQtNpeE4n60sFIpUnC8tjwog==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] BOE TD4320 panel
Date: Sun, 27 Apr 2025 11:11:10 +0200
Message-Id: <20250427-lavender-panel-v1-0-b2611674166c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK70DWgC/x3MQQqAIBBA0avIrBN0sKCuEi1MxxoICwUJxLsnL
 d/i/wqZElOGRVRIVDjzHTv0IMCdNh4k2XcDKhyVwUletlD0lORjI10SgzbG4Oyc3qFHT6LA7z9
 ct9Y+HiDDzWAAAAA=
X-Change-ID: 20250426-lavender-panel-2f144429cc1b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745745074; l=770;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=QdLkz9HIQwG0Lztr/8GKFq4ltt3zfOwpXgoolgkFwhw=;
 b=XTt+GUT7Xba1BsNgCZvGcr6f4GQDyvbIuUdFu8DvFjlqfiFJ/T3mcQv8pzSekP1GdyP2d/lSv
 fAg5U+LElu7B43PY2NoQ482JK5F3SArdI+Xqr2oluUrqho+qHo0BlqW
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add driver for BOE TD4320 DSI panel, used in Xiaomi Redmi Note 7
smartphones.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (2):
      dt-bindings: display: panel: Add BOE TD4320
      drivers: gpu: drm: panel: Add BOE TD4320

 .../bindings/display/panel/boe,td4320.yaml         |  55 +++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-td4320.c           | 224 +++++++++++++++++++++
 4 files changed, 289 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-lavender-panel-2f144429cc1b

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

