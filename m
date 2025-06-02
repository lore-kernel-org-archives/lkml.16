Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F3222595
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869601; cv=none; b=VKioGgu7fTM/qH6/YjR1MEK3muSimy4lUk+LrRH+5/zf/EoDlzXXUeRaVW043fiej2bUfHolsEJpN5fT1XxFr+V/WDZ/cxhDzI+wCeGepaT6uHDe+1CZ9ZexpienNQYqnICj/NGoBTrPJClZ13IV4sIZ0wYwrVhUohonbvvDFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869601; c=relaxed/simple;
	bh=s2fTm5oyVsyETmrw7htvXbIfGrXW6uLj/89qBBxdQx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enuCEAL2GIA7PQjc9bM8bH6ZyjbdhRps70rWU6ybab7lLI9wTcNMFqPRp5SaAy29/M0dFxdTQD0axkgHCJxlV7TpaOW8r2lO1GmCEBNXzkipWRFINtqINng4ZmrFIWxL7+FKKfU/F4GrU84xsmtrXCMEtzC50Vr/lrEhoSy/hAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RDDOb4HY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RDDOb4HY"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54e816aeca6so5667405e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869598; x=1749474398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbA76Sy+7dv3Hy+WD50S5fx7NglU/kONFwY4cFw22AQ=;
        b=RDDOb4HYsy7vJPgTgtVtYRzpHe0KjW5vl7sIPtj/llKWJdEH4kBJuQ0siKcCNCtbxD
         XyDBjMoMRkQ2uM0NRnTtLjMflT7vhxB0x/n1vl56Djm2OmvcV2v4JE6S+AdymDNwmbtC
         V6UHNKoJmnnRiwaWWJSXsilcp/2dWLGeaxDp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869598; x=1749474398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbA76Sy+7dv3Hy+WD50S5fx7NglU/kONFwY4cFw22AQ=;
        b=SqyeNK81Aa9/4wr1mF23ZoDqy9C1OsN3g8LG24CZhVvPhc4Il6rs+FUIrKrdA14+yJ
         x8x3JvDmn79aw66VGRSHn5ncD6yCsUL27kr7cPwJbM3tbom7SJwNPUCALezkN/qV+Vbj
         OkwZT+FCTky977rqEEMEwkfgkAmrEVd18c6bb523pkHK+7HQgC3+uFuYfJAL2ia++owL
         yzBO3CyX35KAVo2/5s9Zewd+hVVkAoFeyFg9/LYaSucEmwU03ifCURAspjIHCzZsd5kR
         RK/+Kkp373VtVysSxEaccpYs6DUpUvmkkElCuirvZXRMdZSBw5N5k2AMeA0HNngoPcIJ
         onvw==
X-Forwarded-Encrypted: i=1; AJvYcCUtp4IYGGmeKwhIkFzcqMKK0lg1b4u1tinq/hqEMkxS00MdfXF1aRbZw02amazwSZ0ApAEUTzBjV2gHQnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9mqB/icZjS7D03WIm0yCeDddqSxoboTVKfY6pViuxz+kNlC/X
	TQjJeDxgeCtI1opMK9cwFEet83hOmMM9K1okDUBSvYvYtcSz2MfbyMwGXOdpSbhHCg==
X-Gm-Gg: ASbGncsb4rYQZOxzMwg0BSzGbamKai7yhp6KZlD0qqsKILUmdBmtl8ZetsAlLd/qyyE
	f9qhadVrJgVs7wO1vAEFhIYNM7Ry/WtLIjcYnN2oGZ6En7EbEUvmVO2nkz+JGsuu/Ht6hhIU6R4
	X1wp+XIAxvComVuJH3BugyjcEZqdT5+UbZQZIWvpncLElwOnfyS8bhF6p0RWcMHJlCy+vFSiCGO
	WRrzdBXALhskduhk67VB4T1qyvFY1KdEW8P4sK7BgwBUZ2Hn6yzIBu45oT3Y5JYiOGJgWvelk35
	wQfrt/zoowaagg5P8T4UyeaN2Kv9wMDLd+ygAbe5/Eqa8JCrsTmo0tpTje5IAnpHYz+RlLDIkQj
	zvSik9V3PUWd2+kSnKenb4ifHcQ==
X-Google-Smtp-Source: AGHT+IHe1vf7/F+KCeNYZJxpJFI7hvw+HxaaxkgDjKbbve9meQSh2ZyQ+hIz8qoG/mtgFJgJ8UxrEw==
X-Received: by 2002:a05:6512:3dac:b0:553:23fb:595 with SMTP id 2adb3069b0e04-5533b8f3be4mr4267094e87.14.1748869597674;
        Mon, 02 Jun 2025 06:06:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:21 +0000
Subject: [PATCH v2 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-9-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Right now we cannot support granular power saving on compat syscalls
because the VIDIOC_*32 NRs defines are not accessible to drivers.

Use the v4l2_compat_translate_cmd  helper to convert the compat syscall
NRs into syscall NRs.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 13388879091c46ff74582226146521b5b5eb3d10..8358ca54b248dd1cf7c984b206b8e550cd883e54 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1237,15 +1237,13 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
 static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
-	/*
-	 * For now, we do not support granular power saving for compat
-	 * syscalls.
-	 */
+	unsigned int converted_cmd = cmd;
+
 	if (in_compat_syscall())
-		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+		converted_cmd = v4l2_compat_translate_cmd(cmd);
 
 	/* The following IOCTLs do need to turn on the camera. */
-	switch (cmd) {
+	switch (converted_cmd) {
 	case UVCIOC_CTRL_QUERY:
 	case VIDIOC_G_CTRL:
 	case VIDIOC_G_EXT_CTRLS:

-- 
2.49.0.1266.g31b7d2e469-goog

