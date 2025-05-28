Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912AF284B37
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455096; cv=none; b=TycdYWnUQzJX0oFYgg/B6g/98YXleLuzoOcbuXPrc+nwERCwPfWVZrENhMGsaVLBi40PgiwkPyHAENzoG074SZKgBpaKQYpvrtSiHXrijwzvUGsfRvQS5KYkSX/0bud5QVhlAajyUIZSFvFp4TOPkneBFaJCUzyF+GWzs9KWZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455096; c=relaxed/simple;
	bh=Wu8Qd9FiU6inqCzueW3NRzh0omS6N0fenEqb36T6nFw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h2Vyz/IHUzdysmQxmxM9yWZxUs2HinZnFfQzKRXXpbFtv/u3AatCBkWFaxRiZy6QW3IpPbhMZSdrgh0eNgyks/lz51b/8FtjPIeZSNMf97KD+avxYM0iiRJ77XJSBbDf43+qn1ivNY1rQOlALmsuWzUu6JQlr9PzcR9JT0GQmEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZImflwET; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZImflwET"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-551fe46934eso152172e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455093; x=1749059893; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kzFgavdSyDqHHNXkt2J4xgZKm3j7gao2JNbhpmib1do=;
        b=ZImflwETacRDOChq28AYpDpHWZ3OFKOcYbveJlg/FqC/5dwpuvGC1FWjEXtQ3as8PX
         vkx4mhMHzMseMZ1eK+g3Gk4wATIBRbBuMCjeerLnZuyc7MesGV0ua8wdyFQwx/p7MfEU
         234nBbG1GQRpyvPvlxchprmujHe6fXe1KKO50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455093; x=1749059893;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzFgavdSyDqHHNXkt2J4xgZKm3j7gao2JNbhpmib1do=;
        b=VLR+es+J5yynewQLGd51xLiK3jR+3aXmNZfKZn3MQtVEOMsF0YJRee0XkmnHDcC15r
         eFC6DU+ZP2Rtb63fTmHqNZUuis/2Tw5qXKmPShqOOkSpnRcnmL89cq4I9su6zQjJX+Pp
         Tj4cnhtxEeIZgp6/XT2zTn34Yyh7WQPsvy1K1l56rlxUyVfZ27rOH/DO2V+1IfrP+wiW
         SYVAcm+qz1Rs72fGfzCAD+lDOo1NbjUru6ucAanQ4aT82ZZ2TCOPRspkm5ei/CnInM3J
         l2sNjTSXMOZbMeWjKtKAYpJGbkeWqU6NyNVYeaXuZaYAnzD6M1PZleuzlNUslAQnfq+S
         a5cw==
X-Forwarded-Encrypted: i=1; AJvYcCUpdrAC62gyFw27bDd/070/2VE0mqJCG/tsr3Ju3qm+1ZeVFekQRPhFNOhgYEFycojqkami1bQs3fG5k5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzn9/04vevg8AYSMcOCVFekCCAAHUBdGCIQZUpR/873CNsZf2
	NV+wkh3T2Y/OxrOVqXTXfdq4wy8Gn9j7UrcVQJKXT+19lpg4AXFASzLjrQYsVqpxjA==
X-Gm-Gg: ASbGncvSX0RnPBkvoTkPaq5+BVje0sPSx3lL4bKGiPzgYNw2n7UOZ7EqZedrhayNDyO
	pfTbzKjM+FcLX3AC066mk05RxaIz1lchjthihr6yDCK0aoSyo6H9X8f+IoekbKlk38BjxrN3Bf5
	+HdTQMrFnk8VX9Guci5M9+W/cYCHvZuRYJtEjqlPF3tgeFoaztfQteQc7ls2617dq6AJD/RWdYb
	M/lf7rgJC+W7KNGLqzz0OKTNOxFz0CVJQ443IgNWgtAbIqBoZg6EKhcn/sV1GZbsymC+3YWeeHf
	XvAYuRJd4WttKgcCzqpXNrA3m8dc5ErO7JIqlZwyzPRvw16WEbrMw1nKDPmiKd9Wm4ImHT1AJ2u
	3Wn26nZR9EJA8acD8skhChXOzeQ==
X-Google-Smtp-Source: AGHT+IFmXNA1x3cKGkohmbscbqDVnwjr1zoq1zU6zt0PGtiaKkkbxw9BXda045Z3E4GwMNEGnr5Krg==
X-Received: by 2002:a05:6512:138d:b0:549:8c0c:ea15 with SMTP id 2adb3069b0e04-55335ac3bc8mr222761e87.0.1748455092601;
        Wed, 28 May 2025 10:58:12 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/9] media: uvcvideo: Invert granular PM logic + PM fix
Date: Wed, 28 May 2025 17:57:55 +0000
Message-Id: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKRON2gC/x3MQQqEMAxA0atI1gZsa8HOVQYXpUYNSBzSsQji3
 S0u3+L/CzIpU4ZPc4FS4cy7VJi2gbRGWQh5qgbbWd95O+BREi4aRY4tKrIU0j+aECfXJx9cMFD
 Tn9LM57v9jvf9AHOO1o9mAAAA
X-Change-ID: 20250528-uvc-grannular-invert-19ad34c59391
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

It makes more sense to have a list of the ioctls that need power than
the other way around. This patchset takes care of this.

It also fixes one error in the PM logic introduced in a recent patchset.

To support CI I have included two patches that are in uvc/next but not
in media-committer:
media: uvcvideo: Refactor uvc_queue_streamon
media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
Do not review them again.

To avoid conflicts I am adding the fop patchset as well:
media: uvcvideo: Use vb2 ioctl and fop helpers
media: uvcvideo: Remove stream->is_streaming field
Please review them in https://patchwork.linuxtv.org/project/linux-media/list/?series=15514

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (8):
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
      media: uvcvideo: Do not enable camera during UVCIOC_CTRL_MAP32
      media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic
      media: uvcvideo: Do not turn on the camera unless is needed
      media: uvcvideo: Support granular power saving for compat syscalls

 drivers/media/usb/uvc/uvc_ctrl.c     |   8 +
 drivers/media/usb/uvc/uvc_driver.c   |  34 +---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 143 ---------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 339 +++++++----------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  38 +---
 drivers/media/v4l2-core/v4l2-ioctl.c |   3 +-
 include/media/v4l2-ioctl.h           |   1 +
 8 files changed, 87 insertions(+), 487 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250528-uvc-grannular-invert-19ad34c59391

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

