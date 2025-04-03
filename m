Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F91FFC49
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707788; cv=none; b=h1MFb+9vctMOvdm/7tnLZpch+QgpCvbFrHQW9u3ZlihgSxJfzFNtOzXK2PNss4fluY7otz4zGP3xW+xhJVn2okIR+BwbePuAcQfYmjgtQpXtVBNgPEf6qOJxRYALW2KncXxSikW+Xy+LJj4BrK0lsOuMRL6KGF3oLdDMg9hSncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707788; c=relaxed/simple;
	bh=OOu5uUVRp5bNrm10Y7Elq88mwpICvefQHhKqbDlAYuk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BndwEoD8exqthPeKmcJI12jUG8j+6MdplKFmCv0pLT0oenSPgV3nrbT3CtBywsYFij4S7rZMM9r5UNKvDg16WZdXHHPj0rd0kg1RnqT8wBP0WmuhnEh4TpgmG9gvL9I13agaUs09HJ25eXDBo/pclS+sTASJ9LRP0fhJQUNv38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ti7K4rIS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ti7K4rIS"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b166fa41bso1343794e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707784; x=1744312584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZyzJh3mfyCoTqN5jp6PExNK9PmJ9vF6+zZHPXer6SU=;
        b=Ti7K4rISjY6mhIQl+zP5GZy5YPbxtfCe6iavRQPGqdPKc5uzi2nZuciqu/iSLRBDVw
         ZbWFw4knoE4i5JOm5ULBMG5OYQKPwdFI91cnQQiA7V2Ww+A95w8FQGjAoKwU0FRTA800
         QPFS++f9v32o1JpsDpt71asE+Bf2Cfwd2RqMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707784; x=1744312584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZyzJh3mfyCoTqN5jp6PExNK9PmJ9vF6+zZHPXer6SU=;
        b=heo1CuJXOzM+kLdkYnGlPUnJvzaw51/Y99py3ReJI3cJVt3YWFjsb3f3w5kR1EbaCc
         2s7z4OydKhJ/5DGojB0z+zepH01artdmvtljBCXEax+DtpTpg3X2VYifjnsJDOlZfVCH
         x13biBz026v9OJexnkDSyJHJkC1+4/jF1xZbj0yr7HwZQGj6b1nBMQ9SgBdC4y2P4Nbk
         oOrOIN/uIbt7Fgf+SkrQi5PIdL1odtPWy6ZaAVyJw4SnbVr+TStVFWqKofnGsMcExW1E
         RUh1UhdfqlMokqFwcExJ7guNIe/YvSb1rFOZ9CME32HFZhVKujQzQsxy2YXSZnNI/SIW
         BzRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp0eJ5PYCzI6m8+cFMcd1NaI+qsAhipOn1UrSTJh/2L4B0Ij80eJqMoMrey1SILHPiWZTowawnVyPB4+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GgXNtbW2vhZrlBpWTbhfKYEi3iEgKrtXGAMf01n0Dux+JuZr
	XwvwdVFqw1olTzRKMJ3AKj/8xTAbOxc0QRtwHiHw62hrlyPcyDNGkhhYPynZWw==
X-Gm-Gg: ASbGncvXoog3BtX3JH1wUiI15CIajQ1vvfSk4XubzxMoYnt1/d1J3PmG+HiiQ7DfSWW
	7XEOvZGSfx3OE3k82M6M5JY8wJxfyIiG0rvH1GPu3lwfOjll7qNj0oK5w1A3+jBXsq3Tr8IXEPJ
	zED5tjAHCiIdZLXPP2hSu+GoKJ+AXlpeaI44z5rQ/qZffy7z8Bl2iR0FommJgs7BnF+xDzIxe9S
	8tifI0mSO+4SWQc7AR96tRcTHQxZQ/XtHEA8S2Hmm2F66OWOtLtUfTpdHDDi94xPTRTT7pKFmZH
	SjUFRD9BdhDxjRDnF5iJsx5uM8kdkMaj2Jcp0eGYIkrdJQ1PEXnH/ememAACMlXkKNehR/XD7WL
	myxLaPLkXBMPt0lnfGwN2eXzR
X-Google-Smtp-Source: AGHT+IHifPA8y75Uvt8/h5dkWWov6ic9+zVOw/bPq0NuxszaJoiYbn+TCyRg03Rw66ZLpx8pcdWWfA==
X-Received: by 2002:a05:6512:1389:b0:54a:cc11:b55f with SMTP id 2adb3069b0e04-54c22785246mr117481e87.22.1743707783922;
        Thu, 03 Apr 2025 12:16:23 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/8] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_SENSOR_ORIENTATION
Date: Thu, 03 Apr 2025 19:16:11 +0000
Message-Id: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHve7mcC/x2MQQqAIBAAvyJ7TjBLor4SHUzX2ouFmgTR31s6D
 szMAxkTYYZJPJCwUqYjMrSNALfbuKEkzwxaaaN61cmrOnlwEost7EoThtCO3hrrV+DqTBjo/o/
 z8r4fZe88mGEAAAA=
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
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

The ACPI has ways to annotate the location of a USB device. Wire that
annotation to a v4l2 control.

To support all possible devices, add a way to annotate USB devices on DT
as well. The original binding discussion happened here:
https://lore.kernel.org/linux-devicetree/20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org/

This set includes a couple of patches that are "under review" but
conflict.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (8):
      media: uvcvideo: Fix deferred probing error
      media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional
      media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
      media: ipu-bridge: Use v4l2_fwnode_device_parse helper
      dt-bindings: usb: usb-device: Add orientation
      media: uvcvideo: Factor out gpio functions to its own file
      media: uvcvideo: Add support for V4L2_CID_CAMERA_ORIENTATION
      media: uvcvideo: Do not create MC entities for virtual entities

 .../devicetree/bindings/usb/usb-device.yaml        |   5 +
 drivers/media/pci/intel/ipu-bridge.c               |  32 +----
 drivers/media/usb/uvc/Makefile                     |   3 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  21 +++
 drivers/media/usb/uvc/uvc_driver.c                 | 159 +++++----------------
 drivers/media/usb/uvc/uvc_entity.c                 |  11 ++
 drivers/media/usb/uvc/uvc_fwnode.c                 |  73 ++++++++++
 drivers/media/usb/uvc/uvc_gpio.c                   | 123 ++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h                   |  21 +++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  58 +++++++-
 include/linux/usb/uvc.h                            |   3 +
 11 files changed, 349 insertions(+), 160 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-orientation-5f7f19da5adb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

