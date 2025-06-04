Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FA428E575
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039368; cv=none; b=tMCxTbwnSjMUcUWaj7O5t00u+5E0IaBWmnO/x2LsySqLD9MZyJnhrn+UXnx2dE0pPbiqso/YWzjyzqPKEx6xx00t0yVHsj6hQzbePBWS6HEAE0NHl2MY2pvLU88zUbQ8nhIFw6pW9PPk5liXo1zp6oDvYq7/v7qFXZSbncqKrPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039368; c=relaxed/simple;
	bh=jSBviQQTH7JAePMwo7QwRip56LEcJbJopD0NUjuBTkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrMm6PfLKsLdMe9RfoSvOWxevH0rv4dD31QW9etr1EjmxhnvrLiDhq/5wCWMQ/NQiJfCaK8woNRRGjCE8lB7N241TOFUgdJlBNW2Hr2KO4RnLXDtuH5gOceu4bjdWknM8/a/xvKYKZ+fg4InPewywG0WMqkoFqA0+sL/W/wWyTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G8iyOkHg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G8iyOkHg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so8085647e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749039364; x=1749644164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bRE2ys8mv+7tBhBfvYdhYX2EBs6/nnVBCJEn6Vbnr8=;
        b=G8iyOkHgPN+IXSQUq/50GbvfkUfYWE1dHn25TjVwlMnCI57vMa0ouZo0U5J7Om9WzN
         lSozfueM+T7UjGRuGi2SuzxlBQTWdcGNZ2gdVWffCUYLaM7Imp0a3rtLA1zD+6niy3e/
         Ddr+9OhNKBcrntuRrnBk07c37Mg5rpDdIef70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039364; x=1749644164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bRE2ys8mv+7tBhBfvYdhYX2EBs6/nnVBCJEn6Vbnr8=;
        b=bqitGkovxpUleqxagZ1AWY7uSWogLezVwN5yCXs6fzi0gtQTGgyJaVGqALZoVDeJTl
         15EE+NCUbdyHKrqLWSB/YZ1c0Kyth1e4RN7INJmcYgjgzmdCnO4+mih9OuIvYQGLL6eH
         iWmVocqFUytoK9J1MgMUXfFic8oZwQIy88Clf7WCS8U4qpPF5w5qQztgSvjGzxT24pYP
         ItcbAjZNyWM9nRbGrh0X0o8rVGAt1dd6SBEHSunwsQkAr8DT4SV+Aqu03cnihXGbN/ZG
         m20hwz0oVnQdpv30To0EiSmiS0X2ei4ouhUJS0aEZ0JayHgqqcUK6w4nM8BpqCPe1Ywy
         tEiw==
X-Forwarded-Encrypted: i=1; AJvYcCVSd1mU2DaBou+fCdHqV6CPLOnUz+0aKbhyCr6VBZLNc/+koE3y0fRCKwtYIA+T2O450DbkvUadxTmJEqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrud0eN3hSbB279hCeels9cOttY2If4/y9cjsuikyMOTVbPOan
	JfMYJ/tF0W3QAtCguyUphor3HGRNIhJNdg6Klg6PJycjCq0fD1HNErxcN++sxjoObg==
X-Gm-Gg: ASbGncvKjN1NC49ewwHMZE0OnCfHkSyz5aK7gCII0MDAwz7rTDqBT5aplzy3A4HD0xa
	SLc2taln+PNYi02SVy2I89Sd8QgLjueC8kXMpI13hwGy6981Qla2yHcAV3g98DHjlgleyo++T4A
	fpPZUoa54GMzlARyAc4ETzqbFRPPYlDWlPlgDjF/SgedemsPReoXbANiGJj/Gikd6jHtOUSL0gh
	sQj3jNpAeZWGQ2YwF2hmCDuNr8frXvAfe5PI9AzqS5S2v9EPBCrsIWOpJ78CGiUb78estGDcdhG
	dflXKKdOCJINhN85GamxlG+pwbjaQXmziJwbbwNijOAR0iKlh+H+GzTQDLqS+kNTI1+Nlgcal4F
	l/1bunvC77mXLQTEyN32E+qTrph883vzWodTh
X-Google-Smtp-Source: AGHT+IH07nfEfCPRSuygtbpDMHx2EgaT3En+BmBFDnKq74uak7z24qXSWnIDRK5q++KIzPjVa2AeUA==
X-Received: by 2002:a05:6512:3d28:b0:549:5866:6489 with SMTP id 2adb3069b0e04-55356defd46mr716577e87.47.1749039364509;
        Wed, 04 Jun 2025 05:16:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a12ecsm2289134e87.90.2025.06.04.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:16:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 04 Jun 2025 12:16:02 +0000
Subject: [PATCH v6 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-uvc-meta-v6-1-7141d48c322c@chromium.org>
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
In-Reply-To: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (!meta_buf || length == 2)
 		return;
 
-	if (meta_buf->length - meta_buf->bytesused <
-	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
-		meta_buf->error = 1;
-		return;
-	}
-
 	has_pts = mem[1] & UVC_STREAM_PTS;
 	has_scr = mem[1] & UVC_STREAM_SCR;
 
@@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 				  !memcmp(scr, stream->clock.last_scr, 6)))
 		return;
 
+	if (meta_buf->length - meta_buf->bytesused <
+	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
+		meta_buf->error = 1;
+		return;
+	}
+
 	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
 	local_irq_save(flags);
 	time = uvc_video_get_time();

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

