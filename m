Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22491EF0A3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715890; cv=none; b=OQhIw5+yMxLyEFnMWbvoAltt6z250BEjNj0fzx5KigxBtWwmEAOaynvEeFpwwHRaEsu78h7l03ijipKWyfOvoDgYVbBX73UmCeW2r5jhYkObAD2AktiWcwQIPlpBCEL1iYIcvMeDDNP9D5nDhF+VCqSEyC+KeLU5kkCQPMql+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715890; c=relaxed/simple;
	bh=wmH981GE7NB8avOxeQuOBjPEsDZkeKkAIkl4REbfjxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UYQj2ncSNv++TQ/YTc6lGujP2qo4SeD8zuxUbNQewIBSSq1lYyqBwZoLQMisN33TF0+Sn/7W7syhzEv6gOfmQO7zDZoEbnLQuV/01nG6ZTgYr2kjftlz+wbwVJ9o5hsLoHwW9fvC6S5aT1IOMUAgEQGS+EDyYx5HnaKsZVv+EkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B5vuQkS/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B5vuQkS/"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549946c5346so1583235e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715886; x=1744320686; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hjSF7rIGuoGtaKvs9zxkuKyK56xOJ/Ay8l6UKNTY2Eo=;
        b=B5vuQkS/k/MYI4QvGeEVjT6XEvXOwnP4U5bJoMT3krrQ9O8CpXybI2JDfxZmWGlHjB
         sVR7k1tvrdcj3PzTJ/dNVugZ3eK1dyhBD5DYH1HtDeToYoEjXrOjVc+UlOVhNqbSks7u
         zY90pL0SXAxeS+V+Xv/qXn0+mriP7ylXLy5F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715886; x=1744320686;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjSF7rIGuoGtaKvs9zxkuKyK56xOJ/Ay8l6UKNTY2Eo=;
        b=jPZ1BrpVWP45zglBwuc3p1bu9COWTP1i0ibU3x228F/POIB4pKaocK8sNpjDISTBWN
         r67QMwFzZBen6zPQrZLJvIWvfHvpT6eQlfGbtK2zVkie5qwHWn06+Zv0eCLHlmc9ThFL
         r+48Iv+bOt+/A08XFtrFOkzPnYGffTxiaqCTjGNd1xkj5x0UgyDWtY4Cof3ZDYqludau
         Cly6CdzMfYtsQY7ij4jXBZFUb+uSpjYnfvmei56Cx+OwDQKFUmQJGDrTx0YPCt2TLqQ1
         F/3Yc3mts3GoXOiwWTW+z8ksjp85y5DTQ9lrF8qls2orAR5gf14FxLstn7Hn2AFGyvGd
         u8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK+Yl2X7ql3tYKiOZXwR1CDb98Yv1dsAmGlhoFb1tF8sKoUb+tt1Hbh4JhD0gCYJygAigg5ecR891NAbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1Kr7Y9AXuFr48xfgI4fi9M1qd+0LaJodXBabXReX1qyznj4d
	k/CVjh4CGdXk2BmPwVAfWzjuDOFM0TZjd39RyLadqX4WJVEx96tNk9+K/OBRzpv151tZo7PexTw
	=
X-Gm-Gg: ASbGnctMcRKjg8ob8dpkqfxILG4QXFiZZP7YH1HnK4kCctI0loF1j8zO4UunPIYttsN
	NTYTAKYVsJKzLtDcreXWJeUBYaoVhHwGTiFDMZsA6w0zIE8UdVAWKoNhp/aZ29gB8sW9p763rP0
	I+pty28+uhCIoybF9bgVlhoCyV0s6HrSORF1fNlKQmSD1FkESZnkm205FyYUQF62YnGq3xAKKP+
	I0O9pgWRQsNgyrxO+fXu5X4usfQxJGA0HOgBVDyBJm3bwapQBGsQCb4bUlgCUFBoVxB67lW+o+A
	9MXLs2I/b2UBsQ1aJZphUBiz1N5aG0mCsz3WJqmud5IMSjJ4x5WEXqxRtHQ6hPz0z+gP6i4F+75
	KtyMAOeom3nzuXOW3bfJPJRii
X-Google-Smtp-Source: AGHT+IFGh41JyNQ0kY4SKRyKQPfhOBTc1Kd5OKVwu4LAE7c7CdYOFKWYEFFOQUbjdl57cF/YjkaUvQ==
X-Received: by 2002:a05:6512:334e:b0:549:8963:eb05 with SMTP id 2adb3069b0e04-54c227dd3ddmr150486e87.37.1743715886542;
        Thu, 03 Apr 2025 14:31:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Thu, 03 Apr 2025 21:31:23 +0000
Message-Id: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACv+7mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNj3dKyZN3c1JJE3VRTUzNzc+MUQ6PEVCWg8oKi1LTMCrBR0bG1tQD
 z0bzRWgAAAA==
X-Change-ID: 20250403-uvc-meta-e556773d12ae
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

This series introduces a new metadata format for UVC cameras and adds a
couple of improvements to the UVC metadata handling.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v4:
- Rename format to V4L2_META_FMT_UVC_MSXU_1_5 (Thanks Mauro)
- Flag the new format with a quirk.
- Autodetect MSXU devices.
- Link to v3: https://lore.kernel.org/linux-media/20250313-uvc-metadata-v3-0-c467af869c60@chromium.org/

Changes in v3:
- Fix doc syntax errors.
- Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org

Changes in v2:
- Add metadata invalid fix
- Move doc note to a separate patch
- Introuce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
- Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org

---
Ricardo Ribalda (4):
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
      media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META

 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 +-
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 96 ++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  | 12 +--
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/linux/usb/uvc.h                            |  3 +
 include/uapi/linux/videodev2.h                     |  1 +
 10 files changed, 130 insertions(+), 13 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

