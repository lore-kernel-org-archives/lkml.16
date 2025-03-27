Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E514375D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109531; cv=none; b=gOOiI1liYNwBUbbDBCq+eBpi6cqZEfnaY0Z4nFGvrV+ztszOyWLA7Ue1m/9+AVV58omE/GwnbJdHvgKeC5nsulYYHO/IUwkk+TDh2EUEGzxaOPoJ027aewDr0ocmBg9HRvuPhbY5wxrn7nFXIJmLwKr8nO0ft0IFjfcfN6SdHas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109531; c=relaxed/simple;
	bh=MAaDOHpVk8l5y3Bvz9xUmbXMFyQputnUsTd8zkUItDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=StlK+8G84cnAwxduBz+nwhesQ4PwnyK8JAQbtxjItogYO4gDauwLjo4lK9KZXItIi+6aALdIaM1UzzIJizB55J8Hu98ubhUS7igtSsMSpfVNWZ+f16kS+Srk+zLGWuuVaEwp4vaUakc78nw8l9spg11VWfdq+LCimtgJ7krSVhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMrY91Tq; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMrY91Tq"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4775ce8a4b0so24958241cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109529; x=1743714329; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMYLMropbZCSC63vr44ogB0dG7buG5/6/cXoTt5SubM=;
        b=nMrY91TqdLHbONpYUdn1xVBQ/Q4UWkiMP+YpCe3hU51p27y0YbirGOMVwjKh9hygW4
         TXvxAB1YsDS6tnIKBVHbCE7V2St1W4I/oSYtlOGDXFRvYJSktY9czhJWkknD3/gvaYF2
         pigNyEAHpskkgQP72kS1zbIT/uDw9YPezH+j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109529; x=1743714329;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMYLMropbZCSC63vr44ogB0dG7buG5/6/cXoTt5SubM=;
        b=lZUH2Ep2u93UdcPodhMZIG14dlFs4vYMfmUV7ZxQzO4zGh2X6H1M8B4BXyUZOecbR2
         Dl21Yx80UsJF5DJegJ0/vrueD15eTnsUrUyWrBt7iiOSU87fmypdy8tHsXgu7OlMGKuz
         hqLcY6Bs4xCi4ScJ25oPSq6V1jAKgdjXHZWXirSilKvy9lMyLPYkdTNEWqngST2DxesJ
         J106DnyojBOhU/wtwe0aG3SdOHV3u1GfcD3V0siyjjy63ysXrptxXRK2KmySYVqOtonZ
         uGIgwmbu88tP57Syz0DokuiqGA+sw8/Rg+HrkIsH5yrFzQT0xn2ZyraoYJbY598o3k10
         zE5g==
X-Forwarded-Encrypted: i=1; AJvYcCWi4JjDNKFoXwtfzXrMm6/scifvWOvhA5ll2I+AvhWNW9aImL8o4p39r44UQ8/5wdg9B0DQ2zXv2LtkZHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaK/Nc145ZzJpqlrjYccS3nCnjtVZ9ropmhWm2dntBHTrh652d
	0AjzImEmDNaQVskPhZEFS6Hdp9p3RBpcDNQ/kJgTgbJQE+FHAx5RpPTDs35VpQ==
X-Gm-Gg: ASbGncv8Kr//foBkG01hZrusKcGYWGZqyCTw8SGuEKNbcKPC/yHrrg2w/bHF2VSeZnY
	3IRqtwHWg1digBZ2iisWKAVOH81NzRsHr5ju8EhtOJAjVF0pMPTuutG/+1uE8WJv7APl3ptHdKP
	nSY3YXho273JGnuVIu9xHjhtYQ7GkCSAZXhrSLs0WYqtuGQyoZXNWUoqx5PCheLsTFlJ1zUEd+N
	q56wXiiKZDH90SWHqdVifdNU2CNtOmrgZMLg8Z9mr1YNb7khwUQzfjQk/wpsBKzldts49AMeygL
	AEcuzjn36kBBkT3QbLuGYpAG6hsxA1xY8kBsttLfCfA+fAaG1xLvGSHWT8qbX/jybwQ+LcHrbkH
	A/SAT8+sq+FjkdG20mLmbfA==
X-Google-Smtp-Source: AGHT+IGxrFio8vLeHzf4wv6jvGI2BMAIrzLkUQHAsBHF+m1IKzHOTH/P1z2k+W/U3eea8RgAMDwHRA==
X-Received: by 2002:a05:622a:40cd:b0:476:af54:5038 with SMTP id d75a77b69052e-4776e0ed305mr81222221cf.22.1743109528984;
        Thu, 27 Mar 2025 14:05:28 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/5] media: uvcvideo: Implement Granular Power Saving
Date: Thu, 27 Mar 2025 21:05:26 +0000
Message-Id: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa95WcC/33PTW7DIBAF4KtErEs1DD8OWfUeVRcGBptFTIQb2
 iry3YsjVY0q1OUbab6Zd2MrlUQrOx1urFBNa8pLC+bpwPw8LhPxFFpmCKiEQMOv1fOpjMslf1D
 hy8TBWHHUowlqUKytXQrF9HknX99antP6nsvX/UIV+/QfrAoO3EiBLqLRyvoXP5d8Ttfzcy4T2
 72KP4YGBNkxsBmOonJa0+DM0DHko9H7QzZDYoAwOPA6HDuGejC6XdRukLeOLBhQPUP/GrLbRTd
 jlCE6QhvJij/Gtm3fBRVZqsMBAAA=
X-Change-ID: 20241126-uvc-granpower-ng-069185a6d474
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Right now we power-up the device when a user open() the device and we
power it off when the last user close() the first video node.

This behaviour affects the power consumption of the device is multiple
use cases, such as:
- Polling the privacy gpio
- udev probing the device

This patchset introduces a more granular power saving behaviour where
the camera is only awaken when needed. It is compatible with
asynchronous controls.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v6:
- Improve error handling
- Use __free instead of guards()
- Rename uvc_v4l2_unlocked_ioctl
- Link to v5: https://lore.kernel.org/r/20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org

Changes in v5:
- Improve "media: uvcvideo: Make power management granular" commit
  message.
- Link to v4: https://lore.kernel.org/r/20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org

Changes in v4:
- CodeStyle
- Create uvc_pm_ functions
- Link to v3: https://lore.kernel.org/r/20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org

Changes in v3:
- Fix build error on sh4.
- Link to v2: https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org

Changes in v2:
- Add missing semicolon.
- Rebase on top of media-committers/next
- Link to v1: https://lore.kernel.org/r/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: Keep streaming state in the file handle
      media: uvcvideo: Create uvc_pm_(get|put) functions
      media: uvcvideo: Increase/decrease the PM counter per IOCTL
      media: uvcvideo: Make power management granular
      media: uvcvideo: Do not turn on the camera for some ioctls

 drivers/media/usb/uvc/uvc_ctrl.c |  37 +++++++++----
 drivers/media/usb/uvc/uvc_v4l2.c | 115 +++++++++++++++++++++++++++++++--------
 drivers/media/usb/uvc/uvcvideo.h |   5 ++
 3 files changed, 123 insertions(+), 34 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

