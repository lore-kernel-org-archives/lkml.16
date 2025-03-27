Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93C1586C8;
	Thu, 27 Mar 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093518; cv=none; b=qQc99Cer98lx/gie+Mx1T+vuvmhEIkDy5WYmmqwx9XPy/erRW6oveUT/qRNhhVU2g1Kg3X4PveXmkF8gFRZsgEkiHUjDEryl5dzoVeI307iae77iuHdlNLQ3YbRw2T3WQZAMQuh15clEzCBKlt2J7T1/ufVN1ZXrzg7z+7B/+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093518; c=relaxed/simple;
	bh=0VL5IT0thy2MWB+1ad+ibGOcycK23WTiOqVf89IlNSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IR4lfqZTTAz9nr5YuPJIcJyOwKp7ODB2kPhBK6K2Evq0lljAnNt1ukuMdw9Lf1jiE6sQOG2WiuzePMJ2NFB9ECQFY35aTmttZnPCPUzHvOU8yDrPa4nl6EF756dgat0GRGLCU5Vv+GFdy4ToWRwueddVO2OHDIQO7ljlkw2TJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kd0UnV6l; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kd0UnV6l"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-54af20849adso1189208e87.1;
        Thu, 27 Mar 2025 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093515; x=1743698315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MCipadPWDc9+WNsaYqHuzZhnDYq2MJBL/KTC3dNV0xw=;
        b=Kd0UnV6lDPJ8jCC92OU7HAwCx85ZQv4TEfGE6n0ozEQ/l2ZUCW7QO+KaJGTJNEMtF2
         ZfIgWLxrDRL7zfkLTkhvkqFWSvwYTN7/MbWzQVoWBIfHQrL5o178uR6hlHNoRUMiLAFp
         Bn1XrsWfcuQnwQBl0wI6x9riuVlAywscxnUqRlEWSXPCIrHo3Y2Y7YdjKSXSSKkj5AxN
         0n5c/69YCbahRK1kFx/HBOVt2jFbujclLtRpj5P6J0p1tx8SBzViQ2KLx5ZnBIMsFvsD
         PHGaBXpTA4457KP1UCoHjqagG7kCO7aI4ED0FcOYbtLejN/JUHOggy44AuHF7/x0Y3mK
         f+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093515; x=1743698315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCipadPWDc9+WNsaYqHuzZhnDYq2MJBL/KTC3dNV0xw=;
        b=mc52cT24DpnmgWLitplGYjNKvkMQnQnjpmn4OoLvPRUTmYRSlKvMeWVY/A0t4ygGER
         7FfrMHXjEu47aPjOhxGMng5BN1fIDS0VcVqvyWH56Rh/UoHLSjPt8Np95oncsUkcoDVx
         vCWML66DmoXXfFb1sZnxoSkCxZFr8ODZZTgCMkx2nrsLxhlJ73veLwjuRSsVd8YqtLPj
         b8+P7YoPQA0Yoh5qNf1imFU3bGRj9hk1qeVaBxmkFUVeIG89K6T0jOOLo49ROc1mXm1o
         CoLj9uQxG1BJlCk8bdP/KBXNVzkLNFc0WWhVI9xKkuaaxw5pgmYIeqSXtxlU/l+Npkgu
         xVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0n4D7Nu81lbvJ/O40MDmvskt/FN5E39BTrHZW1lVVWe3/6G5DRhnC2Li2rHpJPVVwxUIwbhPuDWlK@vger.kernel.org, AJvYcCXFF0vQ5i2ln9pZ+XcVreOQ6i8eJu+Ym4bfrDlXaU9xzqn8qHNXWLA0zXL/Yfjn5LMRcnGMWrPsEHF9Skmi@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7khBdW14s7bPjBzmI/KRewrftmeW6DhVsqxK33N9AeOzCsGS
	mGIU/BLHbRY//Z7kXOqxtd8d8Biiv/BH9nvUQeoKsv0tuoGhtZ+Y
X-Gm-Gg: ASbGnctd6B6wSXJ7CTev8PR8CkiyQOUPrMMDT7WCcFLeIahqnX1VqrhlMJ4gnIkqhPl
	py9AYEHX0QojcGi0F1pOHjoBIEjiG4ZnJYfFARxWd16lD+E6Qpg8MDW+w8C5tF1DOaJVLOExegw
	uB439zpOO58bDd/gukGjzLQzpva1DTZiiW1OLRAlGffAqAXUAqZyROE3woiSWXL+mVcr1tpLI3v
	heGLnlcvN+Dub0T7qK9YFJMGGYDiAMjNQsSVQBu45y57QMTI8NwEJwqQhPbu/K6EtwCigz28qon
	uyuGLLPV6Kmg4EHJ5m9yNUNADTESFO04QR7Zu7Q5r0gtIAUqy7OE8vBaCAWdKj+ZEpL0
X-Google-Smtp-Source: AGHT+IE2P34XSAHmzmsA5k5rQZOJz8G4YUEkCHQ1A39qmpTMqdjFzDpAeyy8rjX1BH6WCbNx9lRzLw==
X-Received: by 2002:ac2:4bc6:0:b0:549:68a7:177c with SMTP id 2adb3069b0e04-54b08b38577mr533774e87.7.1743093515026;
        Thu, 27 Mar 2025 09:38:35 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957feedsm10150e87.110.2025.03.27.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:38:33 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add Visionox G2647FB105 panel support
Date: Thu, 27 Mar 2025 19:37:43 +0300
Message-ID: <20250327163750.986815-1-sanyapilot496@gmail.com>
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

Changes in v2:
- Describe the power configuration in commit message (and fix the sentence style) in patch 1
- Add Krzysztof's Reviewed-by tag to patch 1
- Use a static const struct for supplies in patch 2
- Fix identations in patch 2
Link to v1: https://lore.kernel.org/all/20250325155756.703907-1-sanyapilot496@gmail.com/

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>

Alexander Baransky (2):
  dt-bindings: display: panel: Add Visionox G2647FB105
  drm/panel: Add Visionox G2647FB105 panel driver

 .../display/panel/visionox,g2647fb105.yaml    |  79 +++++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 282 ++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

-- 
2.49.0

