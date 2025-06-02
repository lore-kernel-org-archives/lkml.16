Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051FE21C9F8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869591; cv=none; b=QUCjdzt5j5BO85Hiwm8CSwu4xordzrcUzUQao5WlQM1J4avPJtCNxgbv+6ytV3ZcpRAnQiuPXygVugxcTpvBX5E14l/ebtQzILF8ggUuKtzV9K8TUi7fQYv05urM0fb2EFxKcAH+erRNKip/GqAfbqeRHH2lUz0SxP63PLVwJms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869591; c=relaxed/simple;
	bh=sSgoKwSCkGSrgSxUaAApWkbAYdHmTLvI5MN0jsMZPOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sel0sjfmOD48+tsbRNIX50w7KGj791PCAvvJ38LopxnSzUrwDXj3utBpNYi4bEdIBS+RTg7NWZDnJzTN5t2HPZFEBNLTZLGEdtfVRMdi1iIk3f8Qu2/IAO/XGf0aX4Guq2rIs1psGUKYvrNZFJspVTVVT2q+maGBjjV7ZUjAVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZleF+aVH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZleF+aVH"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5533a86a134so3842417e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869588; x=1749474388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+dcDh3ncyETsHrh6KLOXKd8aIlzxGuGTMucdNvN9Go=;
        b=ZleF+aVHknn+GmYDW6FYAIAOEnJcELmNWmBFp4Ej0XmOWuHHKRHsI4o2MiGir23kMp
         1WBIXERmqWoQKqVBECH6A9oXGN+Qsh1+KC+lzBW2hwefcq2xhfUhJZBCZN9WukuLLHnS
         tbZ5+cAc7rCHUBPqiku9a2cr4exHAyeMsxozg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869588; x=1749474388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+dcDh3ncyETsHrh6KLOXKd8aIlzxGuGTMucdNvN9Go=;
        b=DERmaGlxxI25Q+C6dpVzk/YvTCASKMbleGXon6SlErnO0WkY4ozyxVkg0KMBmBtn4L
         0YyS/aNnKqQJtNj9cuF9CeLBz0eUeLX1mvv3OAKXrKRwRsvxOGWzGxpuDPP7VQ7PnP7v
         IyUy0hQvKi+09GExp6PTTHxDD05/OnwaftnAIbrOjsCHpUV1e7e6jdTsX47C0l+e/9x0
         odjRFuxX+YxGuGZlwPzrlKbN5dOH/OfZ54RDl2fE7p6RyHKAYqFUQhxs5wlDWenMm/pO
         WMdpRWdEDDdM8UNbmESJ8HTiJuRwDIkAwPo1N+VlpOa+e0E3/ku4HJTlYUgThnchDlWG
         M0mw==
X-Forwarded-Encrypted: i=1; AJvYcCXXDx9r+YqW+hv2EvtAwF4JQmTKNsAyRWJxjPrnivH3UVcJuu4hbUt6HvKU8tDQfQ7tXBEG9c4se0MnRpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdI2VfwMraclBnNr+hBmcY/qjd+xXSprWZxLpvWyqIhH8S3rXX
	KGYSbeV+tjVeRsZcjofyq5gARITq0U6n3PGhLUWrD3EdVKquHXWDLJzt44u02XbOVg==
X-Gm-Gg: ASbGncshFE5+7vWM146aONIo+7WtzNkRolKC5Y23OCceRKVq4D+Ucuek7AJByIxAEtT
	Iyjoms6X/qbX7iRO4WVaz69rba+SXJNcSWMChrRFvbNqK9qFQznu5SxTLyJbdHvAEGAA/us8ajX
	3JMmpwgMIWC3KfCS5ptHww7bcYNM1WOmOcROYJvQ3WiO14Waj7RMGFy/+9DxIkD6JNjIsHCnJYw
	z8j7ugXctplrcsXYJk4pZ/mnvqrejI3b4dF+irEBlU30qh8tvJmIevVmTw0gzTWgi7WlxbjGiJs
	BGMLJvZmuhirSGPPHGRs2o4Blwy7pURfSg7qqDEX1RpOKCVYtRBBE+0Eqeho+9NZqupLLQXSVo0
	LMr8Kc8XrqiPTiSl5ZlTfgkYpzQdCdY2xglTE
X-Google-Smtp-Source: AGHT+IH2K9PXLBHDUDhCn5sZ3snhKvXMgEsIcjV1/WkDTdHxSDkoR7XVPHxr+I11p3iKRmT+T/XhIQ==
X-Received: by 2002:a05:6512:3d9e:b0:553:341f:12a3 with SMTP id 2adb3069b0e04-5533d1ab162mr3177110e87.39.1748869587880;
        Mon, 02 Jun 2025 06:06:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:17 +0000
Subject: [PATCH v2 5/9] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-5-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
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
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..ceff17d65c60761703f473f13d87c8f2b5f25129 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2033,18 +2033,23 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
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
@@ -2053,6 +2058,7 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		v4l2_event_queue_fh(sev->fh, &ev);
 	}
 
+	list_add_tail(&sev->node, &mapping->ev_subs);
 done:
 	mutex_unlock(&handle->chain->ctrl_mutex);
 	return ret;

-- 
2.49.0.1266.g31b7d2e469-goog

