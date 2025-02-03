Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A8200BBF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585650; cv=none; b=jxWGdyFKZyzdTxvUxkChIF5W3B8nw4+IxytmDkZdaAfif7k7WURhin6cU9XkxNnH8J/H7vP/20WLhtaMBmI+i5e/5FcBD7k+sRuuIRFLBiU5Ta+5aTaPhHEEmjW6mM4FAvMwmTpJijNM76oC/ORoJKpJPW9Ek9c9IBgueist8pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585650; c=relaxed/simple;
	bh=nYPlbjG7L0aNiv+8EnU1RmzRlpaVyv+jcDtLaPfyTSw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZH2kH7Pf7r0LF79CS/mLSwILQOfQe3a1RtKcbXUZxrQHr3zgDIU9EzY6n/4GMNor95ld2PIFT6QzfPqCCnPXdF1fu/DD8f/ng6pBLCi0NUmlAQAXOc9qnisC3h15NLYi4yrwkZ7AbQWakP+4pzMztffnFoGD2L5WxpCGvFge728=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e+p069yt; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e+p069yt"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46fd4bf03cbso55733381cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585647; x=1739190447; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwkI6GW2UxTs2aslAYBxTHXmRJrLYPCzR0fgg6McKTI=;
        b=e+p069ytFWfQ1JCyDDbQk2S3t54viYJiD2YQklH00yDJPkQ05lxPIopKqpWnvkh8Mz
         sg61BHPhl3GzpnirEUXuEoV/UtnYSpyY+eddiSvDxPHOSGwyF+7GxRWyJ7GNiHwvKsei
         RD0nebylISlRQOXaoS4of9wpa1XNI996PQ+so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585647; x=1739190447;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwkI6GW2UxTs2aslAYBxTHXmRJrLYPCzR0fgg6McKTI=;
        b=qB41U1BIHvkF0ZEX8V54sI7nH0I/sbXyd+6PfbvKs07Q47QpFhBUenGv+IbHEiOpA0
         7J7YUnTJ2qZ23cAHgwXJuWJQ6B+HXimG1SS39LjZX32Ya+J+Qs8L4yr/BIdJdMB5cxat
         2Ai2aQ05W7+iB2SR1puwSNPmSs3z0XoM3pK2WwCSOmRUbsgrm0Blp8ExkkPqItvSHaEO
         04o20KNy7zdyds12r263twhCf/CvH9GgrRatOyeawkjuaSRdvJn//Ytf45hahNuXJWkm
         +W5ZFfcvAQfP93pKUCtlczRCvpLMOqBbA+Bi2crrxxVXFq6WVkRwOxT44lDs8pnt7Ixi
         s/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVRq5mqVQZ9fp1WU63oMtcWu2rIBiti1DyDV3XEsohbDRM99q0pskNshrjx7govCDiYgNyWGjF9CJlYLJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxk/XIiUeBpnmlLLNcthEhF7LrLNUydAuBvB10nqeK46OeUYbS
	LG1FyE8I16RAGp1y1cbwY5grEh4tJdXbxKkZyIS1wk3DalmjSY3jarkE9tAtlg==
X-Gm-Gg: ASbGncuk7CDdDDJoGbf2TjWibOFc69OJ58ZGeuZHNA4KYYuGkontXSN19tDjuKIPC3Z
	Oh5PK513q9QhcLZEbdyCk/vzQjqyv5nk+DNmTI0Fhfrzh3N9oXTJ6g+CjWquznkPfLuNCrntZDc
	UfXTszqWN0jXO/LOGsL5no3f9SoKTC4WK6RmwaOaUbbucWESMNp/Msh468kUyN80+KUXVfpCvtv
	Re5E9z6uVmajCyLoLPN3SxiR1ovAKsumTt28n5tvtDTh8jEGMWv5aDCQ9PyPe7+sYadJIaPitBm
	2YX3XCOBxDzz0FB6Wsd8hfW6fdUM7N9Xl6ATG7OBTMjr3ftruCh91FUgHtvBR8oMUA==
X-Google-Smtp-Source: AGHT+IE58iHFnV7ApUIvQmJIJTd1uz5+4McRl8q5rVT9hvFp4daQjMPaP/n2MXUt0czDcuSoUmxe8Q==
X-Received: by 2002:ac8:7f50:0:b0:467:8765:51bb with SMTP id d75a77b69052e-46fd0b6da91mr319785941cf.37.1738585647239;
        Mon, 03 Feb 2025 04:27:27 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:26 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: uvcvideo: Implement Granular Power Saving
Date: Mon, 03 Feb 2025 12:26:19 +0000
Message-Id: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOu1oGcC/32NQQ6CMBBFr0Jm7RhaSxVX3sOwwFLKLGjJVKqG9
 O5WDuDyveS/v0G0TDbCtdqAbaJIwReQhwrM1HtnkYbCIGuphJAa12TQce+X8LKM3mGtW3Fpej2
 os4IyW9iO9N6T967wRPEZ+LM/JPGzf2JJYI36JORjlLpRrbmZicNM63wM7KDLOX8BE0DBgbMAA
 AA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Right now we power-up the device when a user open() the device and we
power it off when the last user close() the first video node.

This behaviour affects the power consumption of the device is multiple
use cases, such as:
- Polling the privacy gpio
- udev probing the device

This patchset introduces a more granular power saving behaviour where
the camera is only awaken when needed. It is compatible with
asynchronous controls.

While developing this patchset, two bugs were found. The patchset has
been developed so these fixes can be taken independently.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add missing semicolon.
- Rebase on top of media-committers/next
- Link to v1: https://lore.kernel.org/r/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org

---
Ricardo Ribalda (6):
      media: uvcvideo: Keep streaming state in the file handle
      media: uvcvideo: Move usb_autopm_(get|put)_interface to status_get
      media: uvcvideo: Add a uvc_status guard
      media: uvcvideo: Increase/decrease the PM counter per IOCTL
      media: uvcvideo: Make power management granular
      media: uvcvideo: Do not turn on the camera for some ioctls

 drivers/media/usb/uvc/uvc_ctrl.c   | 13 ++++++-
 drivers/media/usb/uvc/uvc_status.c | 38 ++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c   | 76 ++++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h   |  3 ++
 4 files changed, 100 insertions(+), 30 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

