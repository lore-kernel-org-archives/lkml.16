Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757821AD3E0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871226; cv=none; b=uHiY6Oj9eqzMLvdbVAW+bwcOIx+1voWfevyXC7D4LKN1a1KzPMm4aupwatOQXv/dwCaQMo3tWcgoHX9xgcdpQYoHKAz2jw0FRUgZ+GCpcyGxZzKWW+AFy9GXzYqjds6g6RlH03bXs6AiX3fF3YdN76c7O3Gi84Mcy5sALrX6h6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871226; c=relaxed/simple;
	bh=mSYqliF1vjjOjuczmAgr2IAOGjo6nGOqDBo3KZjJ0GY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c9TvfZ4zwTyFLF4yoirnRSDBnDfOsPKliOQpGbQdcNnppqR5XUT95j2tBDW32eSKPAAMwmZDT+9v4Wv7yiCm1L3ZUOKSGjsHuH21UypA3QjOFrA6GdkD0S9pXIqdfEztOcYVxxsXNYVI3FJYKY3uqMD6iHEiK0j1kj5sLcIUF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JIuewdwJ; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JIuewdwJ"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e4277e4791so7421706d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738871223; x=1739476023; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Snn0OCP59RzzUH7AjbRTRIE3uWooKPx3a9hzf99beTQ=;
        b=JIuewdwJXbbspuTtrdzg2tPGaTVinGXdmydChgqjcvrtQFpde2RrAZ8GnCeumWLP1D
         FqDwpwekHWH1ATZ24BSNk5+H5lX0fBoc2DmP7JLab/r92f78U1byEAQJz2V7OWTAJYFf
         IJD1xqOkyBGrGdDHCAXlCoSZSWp9JGWvJxn4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871223; x=1739476023;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Snn0OCP59RzzUH7AjbRTRIE3uWooKPx3a9hzf99beTQ=;
        b=O+tJnPOX8zEzY1ZJwuQm3fFXFTApR2YdvfPfEXPa51lSGXBSL08YbVkm4MGx+6m5kY
         jN02Vlf2XDceuR8AO7Dbfu+fXeCqoyPr4ijm/DYzp8oLVgTAQFnKD/wwxibQI4Ge+xwS
         d5d4gNLbRfMz7RvYltNbKDDUCbyD1W4Q/Hxkg9hySRrLASUGgBd7tIQSCGTUfQFXeBI+
         /CdU2mM1dr74wntSBuRK+UreaGYqVPxxxG1oYtjZtQOGaABcozvO/eroVOlB6KxlsWkr
         TpiAJ15i+eO+3mhG07JhG/7bwTDFjW2T8/Hy8MZXKjb+W58033DGUcbJRzQ/oTEWm2/u
         Ifdg==
X-Forwarded-Encrypted: i=1; AJvYcCX02RpAo/J8/akGy2sDXrLLb94WxGzssm+PkXbCrdACu34AQ4Z7qDgx9XjZ8YpslxWTla73GnIlAZCCbGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxljKcXJuT8R4bbAc4Bck01STlAhm4QCo2Glyd/lOSPJsy4ITpB
	U3GCHPN5kGgUp/6SSOPQIrhmiUZFADY5URapmot+PH/RvCk3IkjeCsqBKh0ktg==
X-Gm-Gg: ASbGnctxd+dIi8cXyK7dISZNPcUczSh95eibrdXO8zkCHlgS8zr429Cje2+nLn4epQf
	4kiy3DF57RrJmwu9yMkw7SyadS/XOZufPxIdAktBXn1XwA8WclUXCX+P16PkauxLDtA/TRxb7k6
	zAXe30BBqVzHfzbcagk5WWBnL6gnrk/EGjEWGMwmSPZpPZGBdnOb8E9x5lyNClWI5fjr/oWbh9q
	CSG7Ra4J3AndpdBIkeBAM1UUjaF/SqnIcEO+712wT8WjS5uwIxgiqp0jKB0I4rtSGiQjzbwY2h5
	Y47A0nEd9dLBAf9R3H6aGepyUoRZXdc6QcWPdbkEJ9dx8zycS8dw3kKCnr5uKKSZvw==
X-Google-Smtp-Source: AGHT+IG7710lKPwc4g3R1MXtAKWl7/7MRbJw1ZjgnArPu6tCoZPH7EoBjg4NQgLKJ10ymQuidhIx6A==
X-Received: by 2002:a05:6214:cc9:b0:6e2:43d1:5fd0 with SMTP id 6a1803df08f44-6e4456bd2a6mr4658486d6.31.1738871222005;
        Thu, 06 Feb 2025 11:47:02 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bacb6c5sm8756386d6.102.2025.02.06.11.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:47:01 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/6] media: uvcvideo: Implement Granular Power Saving
Date: Thu, 06 Feb 2025 19:46:59 +0000
Message-Id: <20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMRpWcC/33NQQ7CIBCF4as0rMXAFKh15T2Mi0KnlEVLAxY1T
 e8ubeLGGJf/S+abhUQMDiM5FwsJmFx0fsxRHgpi+ma0SF2bmwADwTkoOidDbWjGyT8w0NFSpmp
 +ko1qRSVIPpsCdu65k9db7t7Fuw+v/UPi2/oHS5wyqkoOugMlRW0upg9+cPNw9MGSzUvwMSQDV
 v4wIBsaO6GlxEqr6stY1/UNJPJrVPcAAAA=
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
Changes in v3:
- Fix build error on sh4.
- Link to v2: https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org

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
base-commit: 39e3f5bc0ab4a86b0c8fcda0688d21651ec17242
change-id: 20241126-uvc-granpower-ng-069185a6d474

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

