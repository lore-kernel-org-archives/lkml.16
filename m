Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C8B14A619
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748662; cv=none; b=apN7HBozNkKVZW2B5Gogcu1/lcgATQOmrzvwYK3UfXhlERsE9dwIrV3lt+jWifCMX4IcxPi/Si5lfIQJsrRASxZVMfmjSmlkL3dR79GYPPVaUkSfhWaP2AMBV645LvqnJx2fTMq6sGM+SfdwFv2dZtgs0rw45IDB03KT3lLKZDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748662; c=relaxed/simple;
	bh=dRcNcXMhQCLQSc8KolpqK0jy3kQMHaeA6z8Dx0eFyNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ad2MkpIBq5eFwCECmGr4YhYd+XRaxeKOyZubmrxnQ6xpk9wyTvBk9iY9KL7bYLPF06S9D+OIh8aPb0ODGyud2t64c3ewnhCSSriQu/y4bxu4yq72CezF7xwM7plsO4YvHVxEFQkZkVRaF1bpTAHDmI238NFL24p06ctmw7g9K98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lua6EUnN; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lua6EUnN"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1925119e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 23:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748657; x=1744353457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2/0MoQri2+kgKRxHCnO5QrE0iduVLuICWxx2heDZSo=;
        b=lua6EUnNIp42CF4fHgE1cVjU7MIZye6Jqk9SgwfvRSHd4/DpUUABYRo+j9phh788v0
         crENzkRXA0AeCUyjbE9SBRLtki94/2taQXJG3UNceu8wuz6DC3hOgvR1vHMJLGtBgCLM
         y/TR28oQLUb9OP4W9/op2++IotqXEhIMrGCy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748657; x=1744353457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2/0MoQri2+kgKRxHCnO5QrE0iduVLuICWxx2heDZSo=;
        b=Rl3J0g/r7hTB3qNTQSfHObKzEc21nYzgLdUz9Hi3CWBoHkWQpFGsJPRkFe6Oi/falM
         AdfKZDeaTMn04bOOJ3+bmmlDoEHCwv9vcx+epXfxKIZHeUPGOrmWSlW1fSksuFKfynuL
         65iqyuH4saBNv9UTrsVj88fRbtuNjiCCJ/OBF+oNkfqj0aOaGyUI9KSFpppEufQy7FEP
         /Kk4CQETQu2iqSUT7VHBfMiYlYwC56Q7jBpuGVAkDVcrPxFLsQ8j+UKcZFdSJHT3cQYY
         PNhWLzwGpElxwkvXlHKTI/Zy61WioKW04Jq6ykj3255YHPMh5riFjeAdh4hE8dq/+jfw
         6wOg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1GXFdhKFvVSEcqpdOad41IZen4XluMeVwYz2WQ+D/PJKOn9Fj3lkYUNpb9vN8MLbDhLY6FCCMk0Gi48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMiA0wWV4BxIodyDM52V4tVQx/mDpdHzNJTm1kQF71MOA87ta3
	KM3mIqXJdHWjlGu8c2EK7Oxcd1qamh3AsUUyFrXhK4+Hp9wDCRSqArWhHEsUXg==
X-Gm-Gg: ASbGncuYuZTksSvoce4ParAiTt49ljErr7FNK68WbbnOMLhkMVJacwfMA1Ucpk870p4
	SaDvsImtMaBHrZKQVnvlpST5fltuto8e46aNduXrViL9z6GI148wzNJ2xtdno7XUb0/Ig9wkx8s
	/Pb6a0mmT84EThxVIY1X2HTG8GXQEdb6bxqdndH7fy9Wbx6adxKNezsBM/SCzz1XzkHeH0N6LLs
	YBwHkWB0ywxMdAikt3wRuZrBfk6ebfNgHFT/mGS+YbsYh0x4+ylqyXxjjhSzGwue9b9uaZcFoNM
	zrOfpihHz4knBML0LJYygIlVzdEeDJLuj+/4Ae01Ir92NH+sFaLX366JX7qpFpm/4eivIAuVTrZ
	6WVQJevhhZXOINptamXHJTbVuu+gboAhdy24=
X-Google-Smtp-Source: AGHT+IEOmx3SeghSSudCtmkKz07r0+wsw6tchEuaUxXFBzVyqDR4IR4qqRks8m0vtjYZGMsLKvWevQ==
X-Received: by 2002:a05:6512:15a6:b0:542:28b4:23ad with SMTP id 2adb3069b0e04-54c22776e3amr581480e87.16.1743748657175;
        Thu, 03 Apr 2025 23:37:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Fri, 04 Apr 2025 06:37:33 +0000
Message-Id: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1+72cC/23MQQ7CIBCF4as0sxaDlCnalfcwXRA6llm0GGiJp
 uHuYtcu/5eXb4dEkSlB3+wQKXPisNTAUwPO22UiwWNtUFKh1LIVW3ZiptUKQuyMaceLsgT1/or
 05PdBPYbantMa4ueQs/6tf5CshRRXY6zttMGbwbvzMcy8zecQJxhKKV+xnqynowAAAA==
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
Changes in v5:
- Fix codestyle and kerneldoc warnings reported by media-ci
- Link to v4: https://lore.kernel.org/r/20250403-uvc-meta-v4-0-877aa6475975@chromium.org

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
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 +++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 +-
 MAINTAINERS                                        |  1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 97 ++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  | 12 +--
 drivers/media/usb/uvc/uvcvideo.h                   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/linux/usb/uvc.h                            |  3 +
 include/uapi/linux/videodev2.h                     |  1 +
 10 files changed, 131 insertions(+), 13 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

