Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83B284685;
	Mon, 14 Apr 2025 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651617; cv=none; b=q0QdooSSja2lxOBC2e33AuNu0Y8uLwVRrH3q0Fon+MAirOMbHHf7g655gZRqPuy8Rjj2o6qRLkqSa6DEOj10l9V+zWf5CN0QJRGIx8IxbCQWHhbBML2tU0fuWkZqhumctzGBUtYz52Z4X088dW6F7Ts8V8//AfNG2exVuhh4KMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651617; c=relaxed/simple;
	bh=ThNJddarP2B7vCsnrJtSN79qPvh6RaRDA6glZv/nudQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2gkjdQDI5lreybpQgp49WXjocazUrJAzu1JW6vKBW+2f3zx0ZgABP1jl4TWjWD50EXWzCce4PJBkktTcUQ2iTVyRXfPoGLvbUnqYfBTcJSY58O7aYDXawG5o4Nywu5fsHmyKUoCiKhsbKtvB6ZP5IJDa9yzBqDvzN2Lg8bq44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjABQsdS; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjABQsdS"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso38346581fa.3;
        Mon, 14 Apr 2025 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744651614; x=1745256414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Q9W/UyINLoujjybEOJmE4FHkHZ3d3gRZqNAi4IuHs=;
        b=FjABQsdSpVVOHIbgZXrA4o/9RwM6SQgwZ9b6At4ZotYjeHkbTqtm+dy6n1U+G/BBd2
         +FzawMlOgPRFx62Nuhh9LOYHMY2r5IFdQEEnvmXwGwCGUWekqUAdLY7HQjJEkeVeLS5z
         1AgzfEMatQSqAoYYNMuPE9EkKmfW1Epmq8wZ+lcQ3HjSMLUlKJDXcyrOvB5kavd1DP6E
         gOOmUomoo9wNCI8GAGcYk9OdDY94KfXYQHhAdADUd7GaG9PFEZiV3ukYbeLKyPV7hVqu
         CNHzHg++3+f+ZZ+Hu5W7F/UtDqtZbbhh4/4eb4+fQCgwiSDlIgubx4vKGodGZdcUU7qK
         u2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744651614; x=1745256414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0Q9W/UyINLoujjybEOJmE4FHkHZ3d3gRZqNAi4IuHs=;
        b=FxaLG91/p9B4rChHdfkpFZ3s13vGPncmo0DwZ1gMk46Gd1lMSxSIqq1kbdRwOYC0wN
         k5rR+c/ynIxHRgwxqEU2mR6iUR3jH6aHA+O9uJkLHga06h33TNxaxxd4o0Wpu9/aBowu
         CkJAPl9cuFlAKGCqRtKMn3fRx+cT5M2HuvlbQkXp+yIF/GbG6WjPRIDSXkrq48WbzdhL
         +2tOu1sFrv+mSrAaVCowIFuZ7oz7mgP7g9KYKm0r/CmdoqLUhmBPiQfHt49XeCzWSLxE
         pX3VJimsqWNDOIrfga+oB0dBfvkYcIz6HuEVKKIuSSfnqNI7yL03ktzgT+pOVZuSbawy
         aNVw==
X-Forwarded-Encrypted: i=1; AJvYcCVUZrlfpbgURTTnd9e/hRyZZ3M5X8ZEN/1TVkg6BKLtHPQWuGdHyCxQoprUrWN/P0JWxkMmcq2sLjy/EloP@vger.kernel.org, AJvYcCXliAYMoK5MbdL/lfBa9Sc6wz6GPHaiUeyIJQ3cPwHP+YaVhGbaQ7R491aIVziHmI3SHIUmKSp5XUiN@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbem+NfUEakIzqHcVkFas1rQHdg5ev5MbQwcd05c11nHxWM1+
	rrNrKO5uJy1Vh6Cl+DrEUX4Ku48Z94eP5uJ01oMeza0YtUV2NzVntnDgfUKuOsfYHQ==
X-Gm-Gg: ASbGncu6muWuq4+AzG35fJ2uTAs4jfMU9QLBqPIZerpnYF2obejqCOTJZgqygnB5t4s
	7TiOHhfKdd6vTVuY2dhG7ZS+M+nMcdQk7eEves2KgZewkgLk0O9le9B45RA5dBwzA7/uQxt8uch
	v/0SIWVZ+c/GwqU3ZsKwjWv1nCDiSR07kwY7ZusunnqKvxp63zKQZHpuGug7Fg5XNkeSeai3WPw
	j0sjEYCpdGQnjikpP9QzFRBFsY9FkYcnBxuNPpHO9vSD/gI6qGyMTPi9USAWD0BLY+78PjPuXtC
	JvkBdUpCF7Jj5teRSHwyxXZ22+dowfJmEwKi79feg63H1FwiTduLUw==
X-Google-Smtp-Source: AGHT+IFBUL3NrvZFbM5PiBSoVRPxqIUBIH5mBMeFKQSY+Dkpj+L+r0Dze4HH2rB7/wId7ZvW3RgEIA==
X-Received: by 2002:a2e:9a04:0:b0:30b:f0fd:fd19 with SMTP id 38308e7fff4ca-310499e1c62mr42302931fa.16.1744651613492;
        Mon, 14 Apr 2025 10:26:53 -0700 (PDT)
Received: from PilotMainTrash.lan ([178.34.180.83])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cc441sm17806061fa.35.2025.04.14.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 10:26:52 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add Visionox G2647FB105 panel support
Date: Mon, 14 Apr 2025 20:26:30 +0300
Message-ID: <20250414172637.197792-1-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Visionox G2647FB105 panel, used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Testing has been done by me on sm7150-xiaomi-tucana. According to the
downstream DTS, this driver should be fully compatible with the
sm7150-xiaomi-toco (unfortunately not tested) without requiring any
modifications.

Changes in v3:
- Don't disable regulators in visionox_g2647fb105_prepare() if
visionox_g2647fb105_on() fails (in patch 1)
Link to v2:
https://lore.kernel.org/all/20250327163750.986815-1-sanyapilot496@gmail.com/

Changes in v2:
- Describe the power configuration in commit message
(and fix the sentence style) in patch 1
- Add Krzysztof's Reviewed-by tag to patch 1
- Use a static const struct for supplies in patch 2
- Fix identations in patch 2
Link to v1:
https://lore.kernel.org/all/20250325155756.703907-1-sanyapilot496@gmail.com/

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>

Alexander Baransky (2):
  dt-bindings: display: panel: Add Visionox G2647FB105
  drm/panel: Add Visionox G2647FB105 panel driver

 .../display/panel/visionox,g2647fb105.yaml    |  79 +++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 280 ++++++++++++++++++
 4 files changed, 369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

-- 
2.49.0

