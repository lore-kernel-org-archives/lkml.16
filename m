Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28FA25B30D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293231; cv=none; b=oNt/JDsphB1hVKIZGr2BgBjYxZlZPXj/sU0Nrx2NJdzibGTXJoRuDYXUeqxtTstYb3NI5eeKuFwgVnD+EK6kFAim0rl1fvQrAk512ymH7qwWdcAK0J88ZcUKjzjuaLIF7N6VBO3OnZs8I/zK0pXw94vzSLDNss7RflR29v8D+2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293231; c=relaxed/simple;
	bh=OafmBIcOTF47LRhSiURHmAtXcB8tK+H+W9mG9qIszg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r7vL/TzCB5vO+Mhge3wpdaIXGHLzA2BjjLm5hPWHApWqp1rFRfKADnnkbyvsTghd3SNjPPmDSBcLv/EHDoL6XkPCCnCsspvjgOD1XyyIbZGX6fxgRNWYsz1yf5Jk3Gr09U7/OVO6H+ihSFiskhsraf0giBGKA9G4Ok19iI+YwwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YWJlR7E1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YWJlR7E1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b3316160so2452360e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293228; x=1751898028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7qo43JiUv9pfOvnEmucu4vwD92N40JPzjyRBFKlC38=;
        b=YWJlR7E1JyQip78iNTgadjgmC1u0Vr2nP8MhCL339s4Ht25wytDe7K69vI/jNFsE9F
         yRvWaTU/rmP9AUtRc9/JsxoC/+rmOiDL/bzW8kRalZ/qv2zSsdwLVd3Ou7yYcK1IXNYq
         TpOGN96MQTNeEm09D+rlmx51dMjBeoF/xMUn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293228; x=1751898028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7qo43JiUv9pfOvnEmucu4vwD92N40JPzjyRBFKlC38=;
        b=rHJZdxYIe8WlZk7JnkXGx2qz8y6O+A2YsBPWOUMYZ/6w/K60o9eRheCWSFgqhLDLaf
         07AbDJzIVB1lrjzDqPs0SfKuA42Qzow3EV+LZS7g2mDjQVgaX/iWf5xy1uB+FoxPvjPX
         9FH+l/sIi1qEFn8H5Nsz7Lr94Qv5fFbozLs2fcvcFWp5Ub7QXCFGjO99lzs1fThOpmZE
         IjwmWkOUZ4U6liKkPY6ioVdWJJLdTYSV3kxUHxfvl6rBfrcKTGFnnPJ2CzwDzNSd2PQW
         7nUd2/cmQ4RocvB1HsSQvDjbU9T1MDtoAHZXiXLw+BYB0ah5NOH3nPAncbuxnvAKMM5H
         4Zhw==
X-Forwarded-Encrypted: i=1; AJvYcCUDViZDO61e6u3tMGhrqO6cjNbX+csWuakZLL9saVmg4Xpcx2UJImg0ouGhBquhl+kLBIZTQFbRC8KSMo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6uHm3/hLeg/CoyTh/2MghTu1w1AU0qk1w2rCEK6ZOxL6odfO
	u8Y6dspm5L97SiK61zqEm7QtHrB0IQgB/1rYg88CE7E20S0Bt8/0GeuPTTJwgeMZ79r9zyWF/m5
	CBQgiEw==
X-Gm-Gg: ASbGncsegOXN0T2g7q72S2tyxpRuUHKjimzQ/mQfD69jbr7qrgI8I62d1Mg/NH3uqES
	nawV4R01xLh8p1GaXtdEKL0uD/V4LAFba9NMWl4Ff1BOd7uwsHJFbSyN0iRyXUmNodsr2dCGLPS
	Qyp63WUpPQc9tTC1H8GdJf5qhjvuCVFJvb3BnKV6EPjHJehrfpKG7cNS8CR5ubTpojdI6MOhlAr
	6bBjyadeIDVv/H0+T/9CZR46Ne8X6wpvJuKPnXb1xM/zqHvXmvJGmoQmItNy8elB55A7eo3JZH9
	tK8hRvCdYtKRRXUDMCNZ5t/9KegOovpzCvxYeMh+cVw1XO4jx9mrXXvK0nHpvpXQHdLkLR876L9
	6uHaJxQBwXsH9/Boz/4h3e9sWwtSvzuFT/hGO5Dm3qg==
X-Google-Smtp-Source: AGHT+IFjUPnnIKIepFsVN49yk2JqozD2vxKepCaQ0GoGH+mEklLWPTsXJ5Iglvrd61PZzLFUVGZmVQ==
X-Received: by 2002:a05:6512:3d2a:b0:553:2ef3:f73d with SMTP id 2adb3069b0e04-5550b82effcmr4220413e87.14.1751293227739;
        Mon, 30 Jun 2025 07:20:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/8] media: uvcvideo: Invert granular PM logic + PM fix
Date: Mon, 30 Jun 2025 14:20:25 +0000
Message-Id: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqdYmgC/4XNTQrCMBCG4atI1kby02jiynuIi5Ck7YBNZNIGp
 fTupt0Igrh8P5hnZpIDQsjkvJsJhgIZUqwh9zviehu7QMHXJoIJxZTQdCqOdmhjnO4WKcQScKT
 cWC8bp4w0nNTTB4YWnht7vdXuIY8JX9uXwtf1D1g4ZdQzrjRvjXNCXVyPaYBpOCTsyGoW8XGOT
 PxwRHWcPnEjG+u1Zl/OsixvMkNWRQMBAAA=
X-Change-ID: 20250528-uvc-grannular-invert-19ad34c59391
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

It makes more sense to have a list of the ioctls that need power than
the other way around. This patchset takes care of this.

It also fixes one error in the PM logic introduced in a recent patchset.

To support CI I have included patches that are in uvc/for-next but not
in media-committer:
media: uvcvideo: Remove stream->is_streaming field
media: uvcvideo: Split uvc_stop_streaming()
media: uvcvideo: Handle locks in uvc_queue_return_buffers
media: uvcvideo: Use vb2 ioctl and fop helpers
Do not review them again.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Rebase
- Merge Invert PM patch with add support for compat ioctls
- Export different core function
- Inline the pm_ioctl patch
- Fix typo in comment
- Link to v2: https://lore.kernel.org/r/20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org

Changes in v2. Thanks HdG:
- Rebase fop
- CodeStyle
- Refactor SEND_INITIAL to avoid lis_del()
- Squash "invert PM logic" and "unless is needed"
- Link to v1: https://lore.kernel.org/r/20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org

---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (7):
      media: uvcvideo: Handle locks in uvc_queue_return_buffers
      media: uvcvideo: Split uvc_stop_streaming()
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
      media: uvcvideo: Do not enable camera during UVCIOC_CTRL_MAP*
      media: core: export v4l2_translate_cmd
      media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic

 drivers/media/usb/uvc/uvc_ctrl.c     |   8 +-
 drivers/media/usb/uvc/uvc_driver.c   |  37 +---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 199 +++++---------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 356 +++++------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  37 +---
 drivers/media/v4l2-core/v4l2-ioctl.c |   5 +-
 include/media/v4l2-ioctl.h           |   1 +
 8 files changed, 115 insertions(+), 536 deletions(-)
---
base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
change-id: 20250528-uvc-grannular-invert-19ad34c59391

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

