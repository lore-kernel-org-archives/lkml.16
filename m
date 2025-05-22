Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40501A239A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936731; cv=none; b=QyU2FmfUmXQP4V2HG8D0yg9gPgnq6TNpMxAkVBJ6PsHhqKF84+Z8YVJRlaXbz1fxG/LAuyDZMXl5WLZE/KRborg1LLAdBzF+5YR1rJvS5nK5aBW1BfuAigoO/uTanX7Uackr892qI0/BHJdDIHA7TCcNeeJ/QXrKXW9T0ip/oI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936731; c=relaxed/simple;
	bh=WM4mqGnwWIq+GTvd/qPwycbFRDlvw8qxvlWEL7IVcs0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mThWBn2OKvRHPnaKZAwMCOKtbzY3NSG9yTbPx/t8VUubs4VcGDyZROdpP948WCDI0U8NJ9FcWtWTlQyXk4I4EfZsIa3f4uvXODzusS4sEM9A8nZuy/BTaey4CEvC94HCLB4Ev0pEcG9onU6vyNHgeTPV3scFK3Kgx1ExNK7L6Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cZaVIeN+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cZaVIeN+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d6f933152so12985806e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747936728; x=1748541528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wvsVpWo8EPBJSTQDNOJLYM4ywiA/AIZNjwiuBOar6y8=;
        b=cZaVIeN+FFG62w9IbhzdLdksZBg0ehpMso1mNEb/BK4hbeT397myMdgsJqwiVmUPW7
         2dn/L1dy8jChcReBsMYn3TfL6k8ltQBewZSdqa8Ozpzo3P01nbD8ChXDLx7VoPAtC+G5
         PZSUmV/w7GWIAGSIVbE5+8R/y5riLw9fO4mNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936728; x=1748541528;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvsVpWo8EPBJSTQDNOJLYM4ywiA/AIZNjwiuBOar6y8=;
        b=Qdg9wszU3tKDFFnAh0dUkKWR+AS5o6lSfTNslAFSRF6tTtK2pcPSq1dRGP4WVqZ9Ze
         hoDRd8J14CzuX1x+hKAqHBcS09OcZTNS3jIO+qub4WMZpBbov/9yRqayGrHfquRN5HEL
         DlYDKAVhz6Pe00OHpCaoPICk4iuGSackqQZwCFZkFpTnRIRFYhC8CnUX8zdx9zDDabEK
         +I/a0BPBAzTG94J76qpb3AgO4L8NObYJ4F+aLo0HUv4/d3hWC9DJhUZZI4YjfE7OUXKa
         mxTqpMFnyLr2odX9Mdr827yHpPU4Ml+xeBzRiIjJxNSuyik+4s8NRb32+4UzaG0Dc92E
         QyKw==
X-Forwarded-Encrypted: i=1; AJvYcCWjg5w6NjGKKXeI2he0HfJVXa64QloFknhkgkbJzkyzwWW+K8shy5qWMOHt0I2t9j4k5rfuB1egFAvCyuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQfJyktsOSGzILviEm9YqcsBWXZUfc/LMi4CHQAPsC07feDXMC
	OJe2gO9sjwnf8DuWgTH5Ee3Nq9R4I+IYJegVkeDFetuO5QqICgYlHQhe3NFMtuEeZA==
X-Gm-Gg: ASbGnct6sNY9VR5QHQqjwAUU8lNMotPsfeoKFwaSQtceNC7ROxgOu/333ph8jhwkeFO
	yua2rssK2N4I5evtCpo3ZD08QHmu0ljnOC7eLS0ibBZONuylRNFW6KAf4qxSEieZ2rGcm18QtVg
	aWRAdv7R+ZlAttDcZb/O2UWoPlJrv/b9CF4H9d9bnlHU+KXugeNwabF6DG7Uo3gWlMJRyHS7ZB6
	/0zDiciD7UZGITv8P7vY0YN/ho5tH/VxZOv9hfNOvcGqbjsVNnfi9hMioWn1ctEgtvrCVHOo+J+
	cmk30b/KM1bUKo0FiEVzrn0L10a1PP8Cc8XqPlAXNBaDe1VmY8LRcgh5nXW6J0gER9Tp5ELd9dB
	U6pa0mpBia2fq3wipeHFe6YrMsw==
X-Google-Smtp-Source: AGHT+IFSfeToHQUzVi5cb09lELuZzLZ3wmsYR2bFg7GXWzUJQ40UCqhOzDaitIua2ApXg39bwqKMaw==
X-Received: by 2002:a05:6512:3d05:b0:549:4bf7:6463 with SMTP id 2adb3069b0e04-550e98ff25dmr9583995e87.44.1747936727987;
        Thu, 22 May 2025 10:58:47 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e858sm3483992e87.227.2025.05.22.10.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:58:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: use vb2 ioctl and fop helpers
Date: Thu, 22 May 2025 17:58:45 +0000
Message-Id: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVlL2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyND3dKyZN20/ALdJHOTVEsDA/OUFFNDJaDqgqLUtMwKsEnRsbW1ALc
 sRPJZAAAA
X-Change-ID: 20250521-uvc-fop-b74e9007dd51
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This is a rebump of a 4 years old patch from Hans.
https://lore.kernel.org/linux-media/20210618122923.385938-21-ribalda@chromium.org/

It brings "new" helpers to the uvcdriver and removes tons of code.

The first patch of this series is part of another series:
https://patchwork.linuxtv.org/project/linux-media/list/?series=15227

I have uploaded my working tree at:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/b4/uvc-fop
which shows the differences from the original patch, this is mainly for
helping the review to people familiar with the previous patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (2):
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Remove stream->is_streaming field

 drivers/media/usb/uvc/uvc_driver.c   |  34 +----
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 143 -------------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 266 ++++-------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  38 +----
 5 files changed, 37 insertions(+), 452 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250521-uvc-fop-b74e9007dd51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

