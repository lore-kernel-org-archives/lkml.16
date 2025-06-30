Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A14428CF76
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293235; cv=none; b=DxJJy+HSKSZNRMGukm4ORjjxXrmIWIJVhDScPWqOHGE3pJm1Abvg6tftyirVNSgdP5JDs7plnDZVa7YDDj7W/QlGWJuZ3ahq+Ejgj0A3O63pvmcBBKyjsK8Mb50Fjj2zU7wJ74iZ12EqEGCnbj+AmQ756jcoVAuW2nn+oVu5WHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293235; c=relaxed/simple;
	bh=kmRTm9kyR+46n0xfucUpkYJjdAw04RXMg4vx4GWGzVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J98ZxKd0EOt6pxr42YEYAOvYBSVXjB55itjUix7PWWt+dTBrHdC7PXVOB+5FPnJSaP8VTxsAvgJ09JikinepZKgHS4bt+syAJ4lZnyU52SJUaraVnvmc9Csa0AN8wW2hm/+Eta5H07JyshBdwSMFKMlMZ4mtdkCxZ9Kcwq9sq68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nHY+cQxO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nHY+cQxO"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b3316160so2452442e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293231; x=1751898031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvxAKM98pb9QJ/qUv4r/ub1kcRedtcU6A5oFVUSoXHg=;
        b=nHY+cQxOegHmIhApJxtAfPoHjiwNj+UOT35mKM6B2f7oMf4PSqx/Pp1IibkisSCK+J
         AbcWBuasVrTRkGxGdyntt1HA9xv+02Cr6RqQi0YQMUNjq/DQi+Tz2qXNh06mGe70RR4n
         1mDlBtR0ahnIgpb0pM6c6xj0sNbVwfWdqybnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293232; x=1751898032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvxAKM98pb9QJ/qUv4r/ub1kcRedtcU6A5oFVUSoXHg=;
        b=xDCZUCkSdpEQ9RnMww26pLLXtDTTJMIS3K+S37O8KjnRhcxsIgsVbMnu4xQdMmKhD8
         pR5uQOQoTkE8p34vuBRY18WFcTZWqMm4sjgVtj0tTAzCKJ/GAZwUIQftdu7/JXgGXWsJ
         k1YVqKOojUtrkIecvwxdtKTYo0Os5DtvzuRbYz9YUwIpDdHVyLr7PIPLJpP/+j+EOBEy
         uRN/sVb5YXhRMGr6urz3mcYF3vyWQ1wO+g/oi9PkhkpmhWJsftMKl//2gd5QjZumizpu
         U/RUR8Ke9QrwvneDtM2onPh1wmyPwaMz75CWnQpwn1wrKYPGTyaO0up9vFjlJVNFrnCm
         sC7g==
X-Forwarded-Encrypted: i=1; AJvYcCX4ge2ezTBkesw65hw7tieefuH5w9SYMgTrhrVrUJ/sMCAea9gBKEbGGIkpRKT4mBh73tPnOvk9QjyouaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOvcy0XX40pShe14uYFBph+lyj3s0uWtqG92G9cSG+Rk1QO1Zb
	AwlAzIT6MMKqdVw8O0oBdwUz0ATlRVUdUUkfWVXK1V6pFjk3XQXCUi+kMXnLNzQ19XC4UhQAC82
	KlB9fSQ==
X-Gm-Gg: ASbGncu/4OFDEc6DxmJmNqvArgWhhu0RHGeQ/2AXqbnT0yKqsjsL4uXDaXgsCYpyvJL
	sFyBWdqlu5TX4FjbmygESj8V8IGQ2ycs9whVO3uOnZDna5Dayo0yy28w8SS9wSTRyKBlbbAIMVL
	vOvbXTyhxozLR7OdQ95/kPA8ubmcYtOPNqZ+jqkhmHb2Yl7/1PlyLPxZ+CfyuwBptIf0X+r71Xh
	yNBwH0KJ+1o1L5Flr4SmW64D3Ty7m+9p9lVqcfIWPFNDIjq81NIRZiQpLlrW+iL0Jf6juoaNRoo
	B06Cjfx/U/b3FmJnUx5HeimiOPALcDHbo4I67I4PDjFSdvPHflHM+SZ0GhVPIRAPHjZK8M+JoiU
	pbmpsERVh3GiWLwNhRlHRxg7Js10dU1F9/98McBHz+g==
X-Google-Smtp-Source: AGHT+IFKrR5YCaYnhS5iD0uImmyjOzhm8bzbacAYk7AWZ1KupjzDmN0IxVjJ2iXbSGGDEwb9B5VosQ==
X-Received: by 2002:a05:6512:3d1e:b0:553:3892:5ecc with SMTP id 2adb3069b0e04-5550b8ce576mr3858682e87.36.1751293231523;
        Mon, 30 Jun 2025 07:20:31 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:30 +0000
Subject: [PATCH v3 5/8] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-5-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If we subscribe to an event with V4L2_EVENT_SUB_FL_SEND_INITIAL, the
driver needs to report back some values that require the camera to be
powered on. But VIDIOC_SUBSCRIBE_EVENT is not part of the ioctls that
turn on the camera.

We could unconditionally turn on the camera during
VIDIOC_SUBSCRIBE_EVENT, but it is more efficient to turn it on only
during V4L2_EVENT_SUB_FL_SEND_INITIAL, which we believe is not a common
usecase.

To avoid a list_del if uvc_pm_get() fails, we move list_add_tail to the
end of the function.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Fixes: d1b618e79548 ("media: uvcvideo: Do not turn on the camera for some ioctls")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 303b7509ec47964dc1bf0e28127075b4a3867511..e84aaf130c73403a6c818deceadf404a2975c816 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2072,18 +2072,23 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		goto done;
 	}
 
-	list_add_tail(&sev->node, &mapping->ev_subs);
 	if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) {
 		struct v4l2_event ev;
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
+		ret = uvc_pm_get(handle->chain->dev);
+		if (ret)
+			goto done;
+
 		if (uvc_ctrl_mapping_is_compound(mapping) ||
 		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
 				    changes);
+
+		uvc_pm_put(handle->chain->dev);
 		/*
 		 * Mark the queue as active, allowing this initial event to be
 		 * accepted.
@@ -2092,6 +2097,7 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		v4l2_event_queue_fh(sev->fh, &ev);
 	}
 
+	list_add_tail(&sev->node, &mapping->ev_subs);
 done:
 	mutex_unlock(&handle->chain->ctrl_mutex);
 	return ret;

-- 
2.50.0.727.gbf7dc18ff4-goog

