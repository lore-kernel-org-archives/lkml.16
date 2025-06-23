Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B91D6DA9;
	Mon, 23 Jun 2025 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666532; cv=none; b=Uw62GqeCGmejfTaoZQNc6WYaixUhM+OKkM3FsnNVIdfSmc5aozruGJ6Oj8jBveHA9jv8A1PvZsDHHgYUwD3KD0A0jLHCDWRFCbb2E1YJDS9U3swqIUvHhfkzNucDEeyR2jJDhsGum90JaaidQWnTOBRNDzI5s1p57P3mET0dLmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666532; c=relaxed/simple;
	bh=+4EkPOAC+jo3nBTeLG/ZDMlpH/1kxXxzJRqMDzyCsfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zaz34f7M7wRXBCzXmHcevCiZ8S10rfwyKSGu1Fxpk7o7REv1k6vtVOedM4RkgOoMbi055FB3AQZiOhZWNinPK68YGVbok20h7qQqRF0S9ntEnBRMba3dBclcpOr4cb7DBcsKlN6TiXc7HqgRvzgqcqHiUMG6AmLrhGCxoGbIoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxK18cbf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxK18cbf"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so3746536e87.0;
        Mon, 23 Jun 2025 01:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750666529; x=1751271329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEQjQUYSKvzxJm5N20PdRW2h2XKmpKdlgrVQR8zsmLo=;
        b=LxK18cbfBm+InThHlVu3c5YkAGTrWT8PBTRBgSC451C46fr97W4afRQh1LCalCzGbq
         JwZ3U8nJ8sb5AznoLF5OsRJiLH26t8uCFeLvwwbCi73ltEqdH81YZcB/YH4BJyRYVDwS
         hl0EpA0TuEZZMx/WhtO8PuHioKAtwRktR4SrUhf3Tv2+AWTQhD0M72wLGArYK3FZbdkV
         U+ut74tAEYSSUumAveXqsUlX3TgSPg4vReFULJ6xXjZ/RDXWodt+Ix/UggQM/XCv0WN6
         5TwAjfM3Pr1ORiPoGZW39CpWUE4Jz5R1qmyEcw6W48BFOyMu/mXRLaCOozt1pKRYtfeo
         uQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666529; x=1751271329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEQjQUYSKvzxJm5N20PdRW2h2XKmpKdlgrVQR8zsmLo=;
        b=HVqO0AlC1kaKvK9EJU/Fql4hMevk6jtOtYB1Guzd/s7ZNXyN4vbWgldmnlCQ/n3sVX
         XGwV96gcI5Xil3ksW4/SPfdi/cC5BvlSb2+j2ZJ2R5j1y/EHwu7cRdgnakFcZAqJPRpv
         oATr14O+GEfZebcLlk2PKEeJ/ifH6sw/C2f4j6gvaad+uc1gM79iH7iCRMM8KDmGhDbq
         tbA8iDPg+T4FRqoWP1WXFQuPzkB7KAWXYe7WFVqUMmXuNIGhX0emy0xZnR4TFW2biihg
         oFfwY1uekS+SiT84svVRN/dU60WYIpma97/FrOwyL2gkh6262/VHhTjUoxLyhwdXcF+A
         xVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEty1R4BywMFDQyuvRPAIJPDwv2Lk9j0SZ4VNwBwqLsf9ZRl4nHQYV+aDd6RWrTOp/BJ8jcMH2dCNR@vger.kernel.org, AJvYcCXUGMtpLxWNffNfZcbb/P6m61O86wRHws69vAYgslQtfRyDO2W0wTkTc37XT8YL6yP1byD6pvMEK8Cs3bNe@vger.kernel.org
X-Gm-Message-State: AOJu0YxnM5YQK6o6Bd5/Hzm2cdwz4LJ4353klE9wyPNJeC9lMYyNXhCb
	hfamI3xoChmC7EkBXzQwTXLIGH+z0tHlTPOeCut3mLFuiWI7JyzXP7GH
X-Gm-Gg: ASbGncsV0me8ebbuRKQoa2r/G9wJOUciM1VgXqPgsBBp0/n0vJgzftKaztDzdFTGAjV
	8frAyJIHp8ZeIYLTTrhVqco+QxltO1cSjh8Ahjl0XdUGB9dSsWPXg9/69gt8mLsHnIyVuvkcyB0
	8eQYpISgl8Ikd7aOf845aKEYSPD2PpsRuzX2zKuwgkK3KteVLhAJT5aL1QpaVLN5cAXZ99oEMq7
	0RaOAabNexopfvzpULBGTd06TGfoc9iS2u/SrfHSEy4M69T33wl9GQq0xkmJFY83wEZhULzirKu
	a2lyMHSKqTxkCmD9728XxQzLIlxt659deoKWCwDw8CpMeZ49sz0Nn031Gl0CqOXA
X-Google-Smtp-Source: AGHT+IFjSEME9axbEezabsS1db2kU9eJeB6ycyGrcQnUZEvKISlUaTokNROFLP51ZCePkc/xrdMAAQ==
X-Received: by 2002:a05:6512:31d5:b0:553:2d93:d31 with SMTP id 2adb3069b0e04-553e3bd0367mr3782171e87.22.1750666528523;
        Mon, 23 Jun 2025 01:15:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414483asm1308072e87.52.2025.06.23.01.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:15:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Mon, 23 Jun 2025 11:15:02 +0300
Message-ID: <20250623081504.58622-1-clamor95@gmail.com>
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
Changes on switching from v6 to v7:
- removed enabled checks
- configuration complete quirk moved from host_transfer to
  atomic_enable
- switched to devm_drm_bridge_alloc
- removed redundant dev_set_drvdata use

Changes on switching from v5 to v6:
- set correct module name in Kconfig help
- return error if spi sync failed for reading

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

 .../display/bridge/solomon,ssd2825.yaml       | 141 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 775 ++++++++++++++++++
 4 files changed, 930 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1

