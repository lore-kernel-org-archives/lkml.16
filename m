Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1881E04AC;
	Wed, 23 Apr 2025 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435028; cv=none; b=cVR+1n4MAMX0Df8z5PLTjbys8XklHIvsF/TdAcY3q7IS2KIhE0YWJDSooY1csUyPU3falXZljyH0Kt2phWcmXlW/hA+XfN009gt7hdpkswDVTVjMGzXahqQc9QPTil/0xfPJkq+T80vwLIac4DavHHibN5g9HeK6DAFcTHh6Hkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435028; c=relaxed/simple;
	bh=wDlRwR+Zr8jVD3tfOS2Otjt+TATgoKLMCXzeY/ZwPw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CR8FbdoJcEv3bLTQwE6A/Va3bL5dLQ4vfwI0rGB4l9ixpVD8OYDkjAKaQBrq4kWrYKXqjnX21tW6+hsNqvfprgPbCRtX0zDj6/4f4MMHSlMvcdC+q4nKtTxc8vkuvjJLQoacencBiUaL688NFzywkryVQ4I1iKj5EgDWtjXwopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODiudV0D; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODiudV0D"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10594812so158890e87.1;
        Wed, 23 Apr 2025 12:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435024; x=1746039824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=en/iBfwqsTMhKUTpB6sf23cFVGEzkH0eP0mb15QhBmM=;
        b=ODiudV0DoLgAc3VqdEMnN8QNGF8AXqeL3lFIweU0sfWoR0IXNidoRbMTfWpTIVD0xh
         PgAkGiLEUQfJoW5uKnuYFi1aNyZiDpxLmmqB2qg9U/AVbJgVivbsXv2WZrwS7RvW277+
         M2cjnZ5RRBbchPySP7C6Zy+3Vs4NP743nFdk4Q2f21fZvdd1flgeUB5Op+Yq+WnRHj+X
         n/OJJ5tG9HTLoGJ/yqgja0DxtyPEQj6ini/oytffzxS2Y7gyyTrp6GCTf6i/eNVEeDR4
         U5bjKgj5sBzClVp5SZJTUI1SWzAPUuQNuunT+WNguFk1+fWD+ZkHY94m0TXY2zyeiG4y
         6aMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435024; x=1746039824;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=en/iBfwqsTMhKUTpB6sf23cFVGEzkH0eP0mb15QhBmM=;
        b=S4iojpSz+J1dJbW2mvxOuCK01GmpdKOo4MbbtXCfyDiKnQLpC6lJDnSMYhxR3FlLbp
         lbXke32USC0+Zuybvsj8mCIrbj7X8lvU6PE0OC9I4Aqev4nJY7Htc3/SlZr7n007eo3q
         5nU7PhD1r7dDpzHylPkYFPVZM4RaZTWVI0mxeM+XlbTB1DN8G02mpEqy6qIs9dtsHRnY
         egEM70g/VdNlowsataYauLV7E+buM7lqn4K8DYYxNmy1xHmK7KhztJfNcNig7R23fPSm
         AsSNQlCrBGjQQKDqmda9wIgCmOy8g/DduJsst1dbKkg9bGb469oXVrwGvgu1KALNr4Ot
         oTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/bVLjpuHxOCMwzlef0YseNKxgogQ73vv8wQkHFIigCP6nsSVoKUS5fE9jBiJoDJMnJTitlQvdEpPCg1GK@vger.kernel.org, AJvYcCVuKhrwPsnqbo8olatGFP8RX/OjFDarrIDpn9uQvh3zDf+KovOSz+ZgeZE90U+Sgxct8RBhKocD2FYe@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzDt1g30Tcd3t6HX99jZxcp4dWx/DL3+JCJSaIT1xRuC6l/Nb
	rGoPOtDONLowPAUZTn9IsQNMSpzJtvIvkYDZeKhv+Kuhhr7dgdCH
X-Gm-Gg: ASbGncsCsFE6+sySSbAviLg9YGDvJ5zGJCuY9SuZLKX5R1uu6nc7vYyNUFaRymzf2I4
	YSxbq4hDCehepZZuXYbZdoHs1MWDpAXWzfN+20MlVq6io/emu0DHJbkq/njMIMbI+dN70buWlnS
	e8cYhCqAsaXEJzHXZ1jRQnTgqNT+UUt3oaOXs6j21i5XLV/qNTvpm9SRN99LneSOscxgYijvjJm
	dm/JReMXzQs1I5yIxOvgiHsNSkcybZmH94mixuylWUSWKZkOeH1NTKWB0dx10o2biVfMBKxOiH1
	Qu78KcjG9zpPHpkxAK45GdGAu71EwC/Z5a9wfaaPK0o6ELBhnxAaYdPbLwrZFx4lZkTWSYr+bMG
	FKnk70A+f
X-Google-Smtp-Source: AGHT+IHGsy4ep0gTADiRvsgTHa/MWPL+04X0Wk7QfSrqXoiPZZeHYrCbDgj3uF2zm3zBGOeFS2X74Q==
X-Received: by 2002:a05:6512:3b85:b0:545:c33:40a7 with SMTP id 2adb3069b0e04-54e7c429f0emr12937e87.26.1745435023893;
        Wed, 23 Apr 2025 12:03:43 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d9d0sm19475141fa.97.2025.04.23.12.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:03:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v6 0/3] Add support for Sitronix ST7571 LCD controller
Date: Wed, 23 Apr 2025 21:03:19 +0200
Message-Id: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHc5CWgC/2XOwY7CIBDG8VcxnGUDA1NgT76H2QPQqZKo3RTTa
 EzffUcTG7Ievwm/f3iISlOhKr43DzHRXGoZLzy67UbkY7wcSJaetwAFqKzSsl4dOi2D8ZBCHrI
 yg+DHvxMN5fYK7X94H0u9jtP91Z318/pOwDsxa6mkQd13KRAlG3eHcyynrzyexTMxQ8vsyoCZz
 c7HyB/o8YOZlvmVGWagVBcMDZTR/We2YRpXZpn5hDkk8inSB8OGgVkZMovgTXIIsTehZcuy/AF
 uVDjSeAEAAA==
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thomas Zimmermann <tzimmrmann@suse.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=wDlRwR+Zr8jVD3tfOS2Otjt+TATgoKLMCXzeY/ZwPw8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCTl6+QXOcdrUB35k2619Mf1h1GPsTrmhrSqxq
 671/I5Nmw6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAk5egAKCRCIgE5vWV1S
 MgZ7D/4lvE1b1Ds+IWa+uRuXqlqGEHuAyml5i6axE9ie+xEIZgRHpIwZHTpWKy4ZNteUqrpJvYc
 RzptWInvlrDCH9jcX2XOQtZRJbFCpoBZyMWVNCHNpjOrrXqyyaP70FwTzbV3OZVzU1Ftso9NWgr
 RFFPRFbBA86wgVSn76en7ws7osPby480Qahc5pjFS+enl96w/YIGY9MNHkLg7qcMjMYy06L7OKS
 +ffhqPYJd+AX4u/XXSoSlI84AhnTgCdD6/Mr7RSoWLuOcyTz5tFNaxQCf0aY0YSwDle2eSAqWBu
 BXZj4Xu27Vqi/XIYkOcNvR0c+/9lXWM/+mrTUAnnLTvjPf36AIPL5jpI94BbI2FrpeGyLsZ8Og0
 F69Wn4PI+Cu6Q3I165EEod8y1Gsqrp9E3rGdOuCowq5Wn4JDCcK5oC16cEeq/CyKTFt7iKouLSt
 tXTEKOXUKsyaynphpbjXZvf61sG0it4uQ7A+kvTyECRcNQJ/o7/g/Dd8XP5Kj6sOddAyJupG8VE
 ss5XlHcASR0pEpXoekZRqKpK1wx9fMEUcZypjSs6DxqcO/b+FV0Y+8dJFaBoRxAIre+MeQASZ/H
 OjV5WIxamuGVwGnoVss0K2NoIJaXdNur34gzZgYW3YQMN7mip0h3S6tHa6YRaZp0wbuoxwBbvIB
 uaKJrqHLwHjNBGA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.
The controlelr supports both monochrome and grayscale displays.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v6:
- Rebase on drm-misc/drm-next
- Silent checkpatch --strict warnings
- Link to v5: https://lore.kernel.org/r/20250423-st7571-v5-0-a283b752ad39@gmail.com

Changes in v5:
- Use bitfield macros where appropriate
- Add comments where needed
- Link to v4: https://lore.kernel.org/r/20250415-st7571-v4-0-8b5c9be8bae7@gmail.com

Changes in v4:
- (dt-binding) Add sitronix,grayscale property
- Describe why ignore_nack may be needed
- Make drm_to_st7571 an inline function
- Add support to clear screen
- Change from C2 to R2
- Add support for XRGB8888
- Use dev_err_probe() where appropriate
- Make Kconfig config depend on MMU
- Introduce device data to prepare for support for other chips
- Add support for drm_encoder_helper_funcs.atomic_en(dis)able
- Link to v3: https://lore.kernel.org/r/20250408-st7571-v3-0-200693efec57@gmail.com

Changes in v3:
- (dt-binding) Use 'Controller' rather than 'Panel' in texts
- (dt-binding) Constrain the reg property
- (dt-binding) Remove panel-timing description
- (dt-binding) Change description
- Mostly cosmetic changes in the driver code
- Don't call drm_atomic_helper_shutdown() in remove()
- Link to v2: https://lore.kernel.org/r/20250404-st7571-v2-0-4c78aab9cd5a@gmail.com

Changes in v2:
- Reworked pretty much the whole driver to not use obsolete code.
- Use panel and timing bindings to specify resolution and panel size
- Link to v1: https://lore.kernel.org/r/20250402-st7571-v1-0-351d6b9eeb4a@gmail.com

---
Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 LCD Controller
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add entry for Sitronix ST7571 LCD Controller

 .../bindings/display/sitronix,st7571.yaml          |   73 ++
 MAINTAINERS                                        |    6 +
 drivers/gpu/drm/tiny/Kconfig                       |   11 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 1002 ++++++++++++++++++++
 5 files changed, 1093 insertions(+)
---
base-commit: e270b3665f8321c45ad3e9ba4e3d0fbaf8c9c720
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

