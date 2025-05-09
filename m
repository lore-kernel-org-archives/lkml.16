Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C52356BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815057; cv=none; b=iuRGzB40xG59YiG8T6p3A9BxQ89CpeTdmb1Myj4yVs5+jBS4J/+rptNcpF1T4jR2CbQ3heG98aENKWbXOhnzuGjGXk3Dme2MmJnWLRooxoiWd51UkDYgRudWh57m6CBvNN8llsd2uKolk2lsAly8wHx1Oy3InAtm6Coz2iM9ORI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815057; c=relaxed/simple;
	bh=IpC8RcuIwfI3OgkUggMtDbw2gxMgTV9yOOhSg3TjgCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l9IugKFkugDbbDRtqEoSNHwGrqODh/DAENLF7ILicQ2PcNv43Sk06d/ATlVzkT0IpnE4oWcq5sLQY7948DZW//P3io+Md2g/5ZrYpseVOMgZysFDaSH8lGrHEpFJqW4Svkb28OhWjsgUHIyNzAn5yD94AzslsenjW4Dgqih6SrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SzNumrrV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SzNumrrV"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso1718746e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815054; x=1747419854; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJrXUpzSNf4IvL3dxKR6foV/mhV+u8Bk+pi5m/OcRjs=;
        b=SzNumrrVfY1GiZFB9n6R3PO2eUkja6VHkV5Pfm58Fo6AABR8yOLtxx6iRJHh0r5e6e
         h0qmeYAwGwZiZBz73kqpL5tsCTYeTxGbKeZoMzzCl69p25F+odw/sii5+kZzK4ZVg4mT
         My4Vsy07FQZPOkSbXgBtC+YPpnlSSuh2oaudY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815054; x=1747419854;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJrXUpzSNf4IvL3dxKR6foV/mhV+u8Bk+pi5m/OcRjs=;
        b=fsBSxAXvKesZNvPUD2rKk2OyK+6VSfbMKY7DLtLlnGs8cx8FDZCwlDOyu/VueMmhPg
         YhuDXDCz4d0HcCppGK6/6/Cbl3R8AzqHjvoaPQZFqCeDzlOqhZqU0uNod+0SiJHSGuZK
         LBFeeNQkGH1PMuq1QtoE7vGT3YIeJZvcv1VsGaqVrR5VVG40hMMz0OcoT8qQaemH6a6l
         5n7jh+LuakBQfZyvGpZ0zzaZ/obrZghB1vSvnPBpl62tpelDwzNB/4mhU2wAJfsQr5A3
         N3DLR78+j31CNOdU1EwqjSjTnA/R2bN1Y3KgAi4uJgh1N6pFB3dpwC4QI4vK5jpT1CzB
         UOBg==
X-Forwarded-Encrypted: i=1; AJvYcCX2MgNc8fdubFGXj6V9jy+9XexT0ucRh0+e63uz54SH8j/FXS4hS4yO5f2YH8fuxCO+uDDJXvd1lNxnDAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqg1Bf5xOuWK8e5iV+o8PD91nh8OmcDYimMJwMwTztOI3MYgW
	DLiucW/FV8Q5d42a2YFi4kjmb4qjV3ba1jjkwVev1No9/5Fsai19lgttjq8R6w==
X-Gm-Gg: ASbGncsqm7b4STXScav10X4iwWJ1PxzBR/yus9BcEhiy27sC7W/aT7oLa1y8tHALPf5
	GS8DicQjsmgt1iDHXDtpq7FFDe67Ut8+gISgAjdYsIwIZhXbdPUqWBcxxDJH5+eJUG9u8XlXU76
	c9kaf1EUi+lMQuFErwov/qLoJ23B9K6Q2FbXEZWdhWzlghSDh9j5XHKhTcDqeyS2zijM69SzW8b
	BzCTo/dqRHqTAxlJ3+qnoFgXvYE8n3pC28hDAmXWCQzwhbAfKhwU9sUYJWxHA7Z5ynaIPOV4f2o
	BomEF0UaGRL4YoYjE4rhkPeKHlDR13fyRGKGtBZusD5QTxErMqt+3J2iXCKx/vtrrE7ubU/jEHk
	Vanrt5O9vKDO3jVE5ZaoXkfriCPpA3TU=
X-Google-Smtp-Source: AGHT+IE7cqsQ01lo17QS0S4hreD/9oqCB1/vySDaDuMTft6wOCgkf7LKFycNBCqGK9KqVZXTmtpnSQ==
X-Received: by 2002:a05:6512:3b99:b0:54f:c56a:5952 with SMTP id 2adb3069b0e04-54fc67ecf93mr1745638e87.52.1746815054138;
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] media: uvcvideo: Follow-up patches for
 next-media-uvc-20250509
Date: Fri, 09 May 2025 18:24:12 +0000
Message-Id: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAExIHmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwNL3dKyZN20/Jyc/PLSAt0US/O0NFMz45Q0S1MloJaCotS0zAqwcdG
 xtbUAicyfaF4AAAA=
X-Change-ID: 20250509-uvc-followup-d97ff563df95
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

CodeStyle and refactor patches after the last uvc Pull Request.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (4):
      media: uvcvideo: Refactor uvc_ctrl_set_handle()
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
      media: uvcvideo: Populate all errors in uvc_probe()

 drivers/media/usb/uvc/uvc_ctrl.c   | 65 ++++++++++++++++++++------------------
 drivers/media/usb/uvc/uvc_driver.c | 15 +++------
 drivers/media/usb/uvc/uvc_v4l2.c   | 28 ++++++++--------
 3 files changed, 52 insertions(+), 56 deletions(-)
---
base-commit: 3328eb4dfec23cb3055cda24087cd1cdee925676
change-id: 20250509-uvc-followup-d97ff563df95

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

