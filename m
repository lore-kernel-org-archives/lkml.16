Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F43B20408A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583744; cv=none; b=Hw0bEzw2IheDl80suHwPA9kVuX9IYu6Gj+0dJTzJhrSjcFhsFrxjBfb+v4qwutt2R2/HRbPcl8Tsg3JRbv+PR9k5/ZFYZby+H2BvBmlZDWNmho847g84tCzZXRBmxuzWqC+5CzUlRFNQKy9FOygIhqAcHKypOKFyTmG739ZcLEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583744; c=relaxed/simple;
	bh=EsPCOcfHX++lYkOKqYtMC5V4g3bTre4opIa+vFXe444=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ej9vwpqSMXan2PerkgnWROEQtHuJ16TpgZtx6vjyRtraxvuC1wenHagJ8LyzTLpirUWwsqYPBOnwSlci679URA87MB5C34V0BD6mqyqdZQGETutYVyO4WKPPbcmcEl7Sd3rAEPgVJAaHreBSaxr2bniF6h5SBZGIVlaFsW8xbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YFEXtTUW; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YFEXtTUW"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afdf8520c2so1323591137.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583741; x=1739188541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GacMvNXhqvCRLQph1oVuufh3vc3K/MAX4smWP5V4jW8=;
        b=YFEXtTUWkzCkHZX/+vgiKjNP0ZpDDEHd3MKNWkZ99HoWTRm5sqXp/N0g7bhxU5BxFw
         Hx3VpdzLRTANTt2XyjJj2olJm8F959goBk8dRxhsdSWIb7BKmGuwKrc54fq/xR0d1NZn
         r0/QQ3sdq1lgOg8eCUDCvYp0/gYp0O/l4txFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583741; x=1739188541;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GacMvNXhqvCRLQph1oVuufh3vc3K/MAX4smWP5V4jW8=;
        b=rLQAolhjjMzsCMZD6esJLzGe+C4hXmNFCWZsJNOjg//2c982vdhWa3V+q0wBe+8TW9
         UUDWMow9VVkG296SzpwA4ncg3rHRXjHHXuEhVSknqRHLls59EWGx7luHrLKvYYVYIRaH
         NRCRGl+VPvIYW00uy/RZvZHnDnfnPGFP3OSIgLJ5aKCPjoLDIEwttam1AFgMYn1fZvXs
         n0EpkmfQM1QFURDZ5nZ0cbKwohPlHZ64oyW/U4wE9AiihTtbhNAhlAOybxCnWEV+J1NW
         yMzLF+Bbpxrdm3dZMB5otsAvctO3xCvjla6OkQCK2vTpbVTrCjQUOawL/ZXHHRsESbHf
         V2vw==
X-Forwarded-Encrypted: i=1; AJvYcCXhVAqI9j6yka9MrlqGctvGKiVt6INHdq4x2f0RtXfiZYsdhNOmGDuUrTf51nFMkA+GlMdEicW5x+VvUE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxNpCJuREytv+KLH0IMMeW+xzuCXnx4092fbDRVytO0ZffAzSc
	1BL+JLiZAMWUUiz+XtLwQUfkAy4uj5jMuiisaEMIKKnMbynWtuwfrN/myqClgA==
X-Gm-Gg: ASbGncvLun1Bq+9rEKRv+4+TQ+tHvQL0xw8KVjfDwUyxCM/el1x91158gyPtfYN16qs
	cwPpe8ks8La69K4Z64yJeSp01C3HYZhwxGeLVG5CqLrZxy33JOa0LNUYejCzut5SJxf6SDqmaKk
	Ox4QxMvdzO+LE8PRrBHPIRdz9Tdrn00VpoZR6BZmnoHd2X+FEnldVT84QA5aXkPgirO9W0ykBI/
	2muv5iD6NDKwmQN3L7q+fcpl3b7NCW1EZWgFgBIqhd8+pBC73Pn5nEXnnM+ntyqyp2BTCxYCC+h
	o6lcB1w9AptpbuTV5SO5xYDinyJTo9ho8h/9k8BKFdF9+I6QnKwgdP0LrH1IfH7CYg==
X-Google-Smtp-Source: AGHT+IE1lmg1KWeJ7UDgINieW2YJl2Q3eq5iYfGmNtJ1ohWQAd4rsPyIocygagEmGkKZp8YBU6ENDw==
X-Received: by 2002:a05:6102:224d:b0:4b0:2542:d2d1 with SMTP id ada2fe7eead31-4b9a4f57cbemr11336527137.11.1738583741231;
        Mon, 03 Feb 2025 03:55:41 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v17 00/17] media: uvcvideo: Implement UVC v1.5 ROI
Date: Mon, 03 Feb 2025 11:55:36 +0000
Message-Id: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmuoGcC/12Myw6CMBBFf8V0bU2nloG48j+MCyhTmAXUtNJoC
 P9uIfERl/dxziwiBaYoTrtZBEoc2Y85QLnfCdvXY0eS21wIrbQBgKOckpXBs0RsWrSuBkIj8vs
 WyPFjU12uOfcc7z48N3OCYq3fEvOR5EEqicY6agps0FVn2wc/8DQcfOjEKkqAX1iD+oExw1RpB
 a6kioryD16W5QUYIe0O4QAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.13.0

This patchset implements UVC v1.5 region of interest using V4L2
control API.

ROI control is consisted two uvc specific controls.
1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
2. An auto control with type bitmask.

V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.

The corresponding v4l-utils series can be found at
https://patchwork.linuxtv.org/project/linux-media/list/?series=11069 .

Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
VIVID with a newly added V4L2_CTRL_TYPE_RECT control.

This set includes also the patch:
media: uvcvideo: Fix event flags in uvc_ctrl_send_events
It is not technically part of this change, but we conflict with it.

I am continuing the work that Yunke did.

Changes in v17:
- Rebase on latest media-committers/next
- Link to v16: https://lore.kernel.org/r/20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org

Changes in v16:
- add documentation
- discard re-style
- refactor -ENOMEM
- remove "Use the camera to clamp compound controls"
- move uvc_rect
- data_out = 0
- s/max/min in uvc_set_rect()
- Return -EINVAL in uvc_ioctl_xu_ctrl_map instead of -ENOTTY.
- Use switch inside uvc_set_le_value.
- Link to v15: https://lore.kernel.org/r/20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org

Changes in v15:
- Modify mapping set/get to support any size
- Remove v4l2_size field. It is not needed, we can use the v4l2_type to
  infer it.
- Improve documentation.
- Lots of refactoring, now adding compound and roi are very small
  patches.
- Remove rectangle clamping, not supported by some firmware.
- Remove init, we can add it later.
- Move uvc_cid to USER_BASE

- Link to v14: https://lore.kernel.org/linux-media/20231201071907.3080126-1-yunkec@google.com/

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hans Verkuil (1):
      media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Ricardo Ribalda (10):
      media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
      media: uvcvideo: Handle uvc menu translation inside uvc_set_le_value
      media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
      media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls: handle NoP case
      media: uvcvideo: Support any size for mapping get/set
      media: uvcvideo: Factor out clamping from uvc_ctrl_set
      media: uvcvideo: Factor out query_boundaries from query_ctrl
      media: uvcvideo: let v4l2_query_v4l2_ctrl() work with v4l2_query_ext_ctrl
      media: uvcvideo: Introduce uvc_mapping_v4l2_size
      media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map

Yunke Cao (6):
      media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
      media: vivid: Add a rectangle control
      media: uvcvideo: add support for compound controls
      media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
      media: uvcvideo: implement UVC v1.5 ROI
      media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst       |  64 ++
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  26 +-
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |  14 +
 .../userspace-api/media/videodev2.h.rst.exceptions |   4 +
 drivers/media/i2c/imx214.c                         |   4 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |   9 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |  34 +
 drivers/media/usb/uvc/uvc_ctrl.c                   | 799 ++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c                   |  77 +-
 drivers/media/usb/uvc/uvcvideo.h                   |  25 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |  54 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 167 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +-
 include/media/v4l2-ctrls.h                         |  38 +-
 include/uapi/linux/usb/video.h                     |   1 +
 include/uapi/linux/uvcvideo.h                      |  13 +
 include/uapi/linux/v4l2-controls.h                 |   7 +
 include/uapi/linux/videodev2.h                     |   5 +
 18 files changed, 1058 insertions(+), 287 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241113-uvc-roi-66bd6cfa1e64

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

