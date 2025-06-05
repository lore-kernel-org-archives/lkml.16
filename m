Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3E9278153
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145986; cv=none; b=Omle86JY0xePTnylObXMMe5xEmn/5wAbm7K3VugMLqeDMCoXScL3jx2tV+OrBDwmEIyPgoli1kpLgDLfsmA16kcvroz6r/7JJpRFS1nehFKH7zVvwnLsb01mfRk7xggZxVJrC23D13oj3TzojbettxQYznNhgXIQfLGG+0ixnjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145986; c=relaxed/simple;
	bh=9bzS54upE3rRAonWBAvA9rFLasmw9Br1LIIjE4DGYuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QaVhHoFLCMA01+Reuc/4pnXkhCs2ih4vLMKwLgjbhjrEe7i8nS/qN+yAkCPCY6JOod23y/97mQXu8kZH2Sc7pdDfbPWJ8Xu0yJh4ONfY3KOfV1TvGnoVHhEd6ytmGcc3YMfXYy8c1oQD7ac4GR7m2Z0biTKbCxKKRBKk7KROxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N3kPXvIw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N3kPXvIw"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10594812so1423840e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145982; x=1749750782; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qg8B5BhnvwwywdhBinf22u9UEobn5/4x1o1lWUndYM0=;
        b=N3kPXvIwmX+CDcGbVtvQyBHqnAw4wRwfWsKoRmpClmjchCcMtJsDTnkxxp8Bq86x4m
         4k5IFnZBE+AX4YgIUEa3F3+/bbOlXV7uVaGZ4T5P5bP6HUcTr6GlUgciNTod9rnBMhyp
         cCcAARQwisqCyj+yGzLEcOVsrZECC8+UPVg2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145982; x=1749750782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qg8B5BhnvwwywdhBinf22u9UEobn5/4x1o1lWUndYM0=;
        b=uA65kcQR8EgTsGSVZLC8sKF4oju6/BsPUnRekhuOtmQ/TQ6V9bdjdnMeKP/nBsGD7M
         VSaEnw7Hxln+4KQIFdG73eIJAMblpqTIS0FzOCnjApIgiCu0b+va73ZML1JifmDXgZgV
         nIyA2skJwqpyswKvLZArz0k6Vy5bSvQxsxvoGGSEsFzMuLpp0UW/2UlJKca89HrS82g6
         41/1WA6Ki3fx9U8gnb/hneZ/ySXijJSSpXGuOlKVy840zGXbKw1WneRr3tm9/mYnOUTX
         LzOQ/ZE3zjqe2buX6Wm6PEr7eD0NG+GCAZp+Yo394I8IrqoM21w+n0+hNcH4ohQcxFjD
         j+iA==
X-Forwarded-Encrypted: i=1; AJvYcCVEFjf6tbktQd/GhCWeboHY61MKkd1L5drkweYsihOHTMa5T2anMVG/vlweQX/VClSMfoJZo2z6fD5QDPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBk9GftqBoIKwQRw7f/qwRQx7yJMdt7Jmd5SZvZ8SmuNnk4siV
	DDnaGT5XhV8CyZal9iYPpE3UVd51w4LQ8AvEdIyvTjrBvkjHSVOSOBz1VE1JRqTxbBPoJgGI9zM
	3Euc=
X-Gm-Gg: ASbGncuUN6csAcgVHLq4LPRP0r34sNuHs9fpW1vBklTTObAfvpVkpOTo6mj48nid18I
	nyN0TQHHppBzhTiqu2CjCE2izt6nNCTJcQbYH24O+HYlGFlsZQUOowdJo2UPzFGmbpSmqYFh4Sg
	EsBnpIxi151U0KO7jRAeh3VWGPpbQ51B5V0cDwdcgSHbPAPYv70jFH458booiQzFFWeLoVRYVm5
	a3bItbDKN94rLm+7NzqEhuitu4AfwMTNIfS49Dco+1BtqPXgZpm/O/wdYUWx0v34pJWSqX6vyBs
	lJQZTnYgeAmkZGm2XaPfTpMooxBYucFCF4B90bX5G3JPjbOF+5D94nLHt6ULW6i4brb+fyYDCJx
	GertB4iLNvxRY9Pjw5ckPQj/xmQ==
X-Google-Smtp-Source: AGHT+IGFGY6JTGI6n0VkqKupH8+3OyGz0rwOerV6A58fRuz/+CnpGIvq6+ZmFKqYacJXbJhZzyj18Q==
X-Received: by 2002:a05:6512:3b89:b0:553:3892:5ead with SMTP id 2adb3069b0e04-55366bd23bbmr23901e87.2.1749145982087;
        Thu, 05 Jun 2025 10:53:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 00/12] media: uvcvideo: Add support for orientation and
 rotation.
Date: Thu, 05 Jun 2025 17:52:53 +0000
Message-Id: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXZQWgC/3WNyw7CIBREf6W5azGAoqkr/8N0gTzKXRTMhRJNw
 7+L3bs8kzkzG2RH6DLchg3IVcyYYgd5GMAEHWfH0HYGyaXiZ35iazUsdSUWXXqXKX/1YrRaafu
 Ebr3IeXzvi4+pc8BcEn32gyp+6f+tKhhnQnNj1Kj0Rdq7CZQWXJdjohmm1toXP2vZL7EAAAA=
X-Change-ID: 20250403-uvc-orientation-5f7f19da5adb
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The ACPI has ways to annotate the location of a USB device. Wire that
annotation to a v4l2 control.

To support all possible devices, add a way to annotate USB devices on DT
as well. The original binding discussion happened here:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

The following patches are needed regardless if we finally add support
for orientation and rotation or not:
- media: uvcvideo: Always set default_value
- media: uvcvideo: Do not create MC entities for virtual entities

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add support for rotation
- Rename fwnode to swentity
- Remove the patch to move the gpio file
- Remove patches already in media-committers
- Change priority of data origins
- Patch mipi-disco
- Link to v1: https://lore.kernel.org/r/20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org

---
Ricardo Ribalda (12):
      media: uvcvideo: Always set default_value
      media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
      ACPI: mipi-disco-img: Do not duplicate rotation info into swnodes
      media: ipu-bridge: Use v4l2_fwnode_device_parse helper
      media: ipu-bridge: Use v4l2_fwnode for unknown rotations
      dt-bindings: usb: usb-device: Add orientation and rotation
      media: uvcvideo: Make uvc_alloc_entity non static
      media: uvcvideo: Add support for V4L2_CID_CAMERA_ORIENTATION
      media: uvcvideo: Add uvc_ctrl_query_entity helper
      media: uvcvideo: Add get_* functions to uvc_entity
      media: uvcvideo: Add support for V4L2_CID_CAMERA_ROTATION
      media: uvcvideo: Do not create MC entities for virtual entities

 .../devicetree/bindings/usb/usb-device.yaml        |  10 ++
 drivers/acpi/mipi-disco-img.c                      |  15 ---
 drivers/media/pci/intel/ipu-bridge.c               |  52 ++++----
 drivers/media/usb/uvc/Makefile                     |   3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   | 132 ++++++++++++++-------
 drivers/media/usb/uvc/uvc_driver.c                 |  18 ++-
 drivers/media/usb/uvc/uvc_entity.c                 |  11 ++
 drivers/media/usb/uvc/uvc_swentity.c               | 118 ++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h                   |  29 +++++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  85 ++++++++++++-
 include/linux/usb/uvc.h                            |   3 +
 11 files changed, 377 insertions(+), 99 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250403-uvc-orientation-5f7f19da5adb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

