Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C141E45BEC;
	Fri, 31 Jan 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738305868; cv=none; b=AIFEVGD3/98qkiFk/uhkRNXIYlWYXcz5loXXT224tsD7ERRllSsPKAh50ll42HYL6eMt6hkrRxNi8DPAWq+rnU/8ixCwx3EjqIZZdlCUgHiBTaqT7RcLGTw34as7M9FAd4UsrMubi/Xi0oxBtmwdMurqD+VmLa6RwKaLVrzRNR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738305868; c=relaxed/simple;
	bh=JqUUVtSONE0JJxPAWygXBPBc8OiSlotJiLHJOl2xsQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DbqFkE+/9Lqaq11YHx4Uu8wopsjNdj9pmU8JytwvtGZZvMg2ZL5TO7d4q8czOoApxFYNUpVdzDo4jtRX5JuDHcg39HQ1aaroperchsr2JkcxDhTWC0/VKZ2sf0DKPHcndXFxXhpQDc+Ae22F1mOhsp3Bq/rs++XGaDMT7ftLTT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdnqSe04; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdnqSe04"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so2833296a91.2;
        Thu, 30 Jan 2025 22:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738305866; x=1738910666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8wLuo6Y8PuSoWmYGpdb9OZTpSpfN0loU20jIS3gbiQ=;
        b=EdnqSe04n/EQkguUvhNPO3YxLHJvCBoJARtNySeYuEPbzpd6E4SkANk9IuA6L3m/E/
         mdVmLG1QqPQUVFhs5ay7czW7anCJuaiHJFdqDperNQi0MCujr9Cr2C9Bvle6iPIOITpp
         6IB+2TY2sq7HRWgro1FwyYVPYWG3dDjstsxBdJoyjUswaQ2haULydXFtq5KaQCyUOuEU
         IX9JjXZYH3KaZn+bxo91Ae1LViKL50gVrzaiKX+YTyEY9hSVoxiLkKnF/LMGYe1m463A
         wyifk7ZWGij+NuzLTLmVuVSkPggOCouB+tGAiQs75WXTJ06RyeKHBq2bTprjg7xgn3/q
         Namw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305866; x=1738910666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8wLuo6Y8PuSoWmYGpdb9OZTpSpfN0loU20jIS3gbiQ=;
        b=FosTpJXDVpd6lLBgo/4UQjNnQLXaohtx1QndR0j9eA2sY+y6lWJLWKLuDSLB7eL91x
         tmesld6rj1PUNR2ZgVhZF3M/pjJtnF0WbRy09se1///H7yhH1G9dgAuSWr4YuSfbEvtT
         NbPQq2jws1cj0h3a2VGGodKKW9bdNoawbF8eVJfQSCPwRm2pAp+74k2jDHoK35Z5gEsb
         NrAYIkd9JOct5ir1oGu/GeNPIOiHmR5EG3pdEZPSfh8F6zCv8Kj5JrGpoBmqADtxv9uw
         +/Fxa9VEms5r+A5d3nNLZksy34c3xPS+DveK7cjMswtt0agiF/1RUeWTWaiGCOIS9lHp
         Sf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN8z5KYLB5oqu0dkkz68afAz7YjqyjOb7EJsUChqIare/IuFKNlHeCCEv52XNtCH0AjivQo6ZHSzFu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4v5HLS3GzJk/3rvoZ9JKLXnXcIzZgqH36Y5wSolBzyLQxVHAp
	7x7OpD/qlJKNK27/Qx5HoYK2Kz4+A3xL9g2p+nQbKU8HdJ3Wm5HzJQV6P6WX
X-Gm-Gg: ASbGncukcFibJmcClKnL+CdhGxgjNtiA+DIgzCkflk3OkAikp+PJCatCMHa66uTh4BO
	72cpVTCy92ypN7mi8dwcB4RcwmeQbkFh0d4gwG/HiXAcoLVcpm2pel0mV9N7s97FSTZgEru2g74
	p9K6CTw/nwrOd9ajBofVUq5FPgAhFDouK/4Hl93AboCD0bh6TzkLgXGmlL5I7mAIHW2tcMRrq+5
	TcEIK0isC8SVufPXwbuVHmTFnGd9Pjta6H+D2urWdMZpsAqUaYXnOf41Qm1tqqANqcUa3COs22V
	WxfE5RcT8rhcvOrqh9UAhxxSdpM=
X-Google-Smtp-Source: AGHT+IHz6VGpOU7Q2P2FSU44mu0Jwe+DIUCfoPCztH6MLZjXZrB1gVjhllou8+ScJgH3BIUqDlne6g==
X-Received: by 2002:a17:90b:2f06:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2f83abab52cmr14551878a91.4.1738305865882;
        Thu, 30 Jan 2025 22:44:25 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfc0ddbsm5098947a91.45.2025.01.30.22.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:44:25 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] drm: panel: Add Generic MIPI Panel Driver
Date: Fri, 31 Jan 2025 15:43:52 +0900
Message-ID: <20250131064354.4163579-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a Generic MIPI-DSI / DPI(+SPI) dual stack panel driver.

Although the MIPI specifications define how to communicate with a panel
to display an image, some panels still require a panel-specific
initialization sequence to be sent.

While there are many dedicated drivers for such panels, they are very
similar to each other, except for the configuration parameters, including
the initialization sequence for each panel.
Since there are numerous panels in the wild, adding parameters to
the driver for each panel every time is a pain.

Instead, this driver offers more generic and convenient method.

Its fundamental approach is similar to the `panel-mipi-dbi` driver,
which sends an initialization sequence stored in a firmware file.

Moreover, this driver allows display modes, timings, and panel
configuration parameters to be stored in the same file or in DT.

I've also come up with a firmware generator:
https://kikuchan.github.io/panel-firmware-generator/
It helps to create and configure the panel parameters on the web.

As a reference, similar generic drivers currently exist:
  * drivers/gpu/drm/panel/panel-simple.c
    - Supports wide variety of panels, but no init-sequence support
  * drivers/gpu/drm/tiny/panel-mipi-dbi.c
    - Supports init-sequence, but only supports DBI panels
  * drivers/gpu/drm/panel/panel-dsi-cm.c
    - Supports DSI Command Mode, but no init-sequence support

Regards,
kikuchan.

Hironori KIKUCHI (2):
  dt-bindings: display: panel: Add generic MIPI-DSI/DPI panels
  drm: panel: Add a driver for Generic MIPI-DSI/DPI(+SPI) panels

 .../bindings/display/panel/panel-mipi.yaml    |  244 +++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-mipi.c            | 1355 +++++++++++++++++
 4 files changed, 1610 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-mipi.c

-- 
2.48.1

