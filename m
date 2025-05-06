Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73427AC2C;
	Tue,  6 May 2025 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524033; cv=none; b=WC54TvGZKXOMHBF4G9qohuZhCxbJIdkMGP43hTZdxxygIBWXcGp6PTa7lpPM4/bjiaU4PIh4taQfn+q4JTGmZap1uKivC8zqRFgJtUi2nyPnceN8VxIMmXTddKrMJIlwVgYRTNPKHZa2lxl8nzIV5rAVxBqFWTirIr6Gh7Ri1no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524033; c=relaxed/simple;
	bh=APC8QsC5XamjErstpEMfewD9e2T7e8D4sb8+2hZZVbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mxUErfdQT5brAnA9zfaImB0yUqOgkFTknG5bLHhpaXbK8T5jhOa5zihw9Uj0ZJTFxF5bjSHFXur2qQW+VUNhr5939N7Q8evInWRzsOsjDA7BSMHOg0JSxaEI05RvSYLuoie4SNNNAcBejhMyrCTRPvxblOsNC1vabKTI7h8Cz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie5RNn/W; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie5RNn/W"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f861d16622so9331184a12.2;
        Tue, 06 May 2025 02:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524029; x=1747128829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUmVy1erubqo8DKwJt3dysVszYaW23+/y8mD480tYSU=;
        b=ie5RNn/WaAbxLiFfpVq1w4K5W7YDnw1VFqTfZalT4c1ZvJgNXKuIqcB3jyYtiiCudT
         ey5/nBnK0pjycmOuZDan2+1Iwkf3bHQoriPRKlmQTI49WWIhUDw8bY8WgTGSnKgInSPz
         cGyweQuC0jYc+CP/0JnplB5bx3JW3uGje3qzSb5wnlg9jtA9ILQuPkLs26hebUr/9hm7
         vKIKMItdr/jNCL4XTYZZRcFvARvpCqsVTYOXU/kzbcvQuBSxNWckcqoRkXlzMutq4fE0
         QiHx2HNYt9RfxINy7XZlouinvGQI2eiDwt0gZGaSFPjeP39x+o/Rr0T0iLRBLuo106g4
         eY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524029; x=1747128829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUmVy1erubqo8DKwJt3dysVszYaW23+/y8mD480tYSU=;
        b=Fp3SvSl9QdwcHvnq7ewgt1Xt7LuaCsox4gjf5x3QPrPjXZlDShYdgEwHBZur/U3LVz
         ThfVDiWgWcKLlKcdJYHjcbiG8S5m7PCvEzJOA225iHo9yYrvQfzKLsk7cH0Ia0oSYZa6
         KmYtxHZJODOcUEFNGbEz7R3wNdxEs9LWPslTOxVqypIfS2nd0sQ0pDY2U+pi/4e1UQzK
         pQqUGFVGPrmWSb6sSBf8gkyQZ3TMCVDIECHfVO6jZj+u2IoabKGp6+WHHSZOX1SCLMfg
         9TVcRCKeSDekqK2Kx0tSxEwj6GROJJ1k+OS5iaHGqIpnemNsJDijNcWw80M4F1t6PcNz
         f4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk8ONILK7+4G3cXRwDn28Yq3bLZZ0zli5EmHJwgHYbuXoxudYv9z6Zo5XL2/V/7NHpW+RFuNx7af8SYdUi@vger.kernel.org, AJvYcCVxEjEc2b6FoEy/6ezXqWyC/cQRKuniZGVbBu9hKqCR42BcA29sWhdpl44aIkm/yp2/lwOZDDJNclCr@vger.kernel.org
X-Gm-Message-State: AOJu0YwnPr/A/1kxDp3pKTAc/wB2ScgImT2t7NKUbP7H+Ln6LbRFiCYC
	vmUonJLQWw3Y6/RKfLqENca//8ADwt107tN8KhNWBl5OQUOcSu2o
X-Gm-Gg: ASbGncsJzS84QQ+PEjaCOJrLLrBvxy06ENYBV0hcVGyDcYy20frCkrxGeHP1kz2nboK
	OqxTe7lbQCBklw4xbAyX4y1WdTBUHZZqB97yUCYu5xuIyU+HjxCvwS2XxZ/t1ELCeY8T+deihb8
	SI3lrf2D+U+Puc2HPhmJRa4M1QFF37IBVxEpfYcjyFVOCi6vn4eoKgdeAyNcEkgAOefKFccxA4x
	Ebm0ZzbuCOo86eWdp7bXWf7ED/nl+K/vpH31B1f5O5XehxkkXHEOuEUOSlhRmuDTHz51eAAMUCQ
	TDUKYe3lbJm138X55kZYqnzTVzBF9FCM
X-Google-Smtp-Source: AGHT+IFunOPAi5lNpQEz2am+muFSqRgNnILvh4u9PAiY5CHL3xqm1l6WqdPBO0kK9vDkP0eCSnyH6Q==
X-Received: by 2002:a17:907:f496:b0:ac7:c79d:f8ce with SMTP id a640c23a62f3a-ad1a4b7c7c6mr915428066b.57.1746524029335;
        Tue, 06 May 2025 02:33:49 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1e1292696sm25594666b.111.2025.05.06.02.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Tue,  6 May 2025 12:33:38 +0300
Message-ID: <20250506093340.106575-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

---
Changes on switching from v4 to v5:
- rebased on top of drm-misc-next with adjustments to fit

Changes on switching from v3 to v4:
- no changes, resend

Changes on switching from v2 to v3:
- added mutex guard
- configuration register flags parametrized using panel flags
- removed unneded debug messages
- removed unimplemented modes checks
- added check for maximum pixel row length
- use types header
- remove ssd2825_to_ns
- shift bridge setup into atomic pre-enable
- cleaned default values of hzd and hpd

Changes on switching from v1 to v2:
- added description for clock
- removed clock-names
- added boundries for hs-zero-delay-ns and hs-prep-delay-ns
- added mutex lock for host transfers
- converted to atomic ops
- get drm_display_mode mode with atomic helpers
- parameterized INTERFACE_CTRL_REG_6 configuration
- added video mode validation and fixup
- removed clock name
- switched to devm_regulator_bulk_get_const
- added default timings
---

Svyatoslav Ryhel (2):
  dt-bindings: display: bridge: Document Solomon SSD2825
  drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge

 .../display/bridge/solomon,ssd2825.yaml       | 141 +++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 812 ++++++++++++++++++
 4 files changed, 967 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1

