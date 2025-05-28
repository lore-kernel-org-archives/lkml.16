Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977328E5EC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455099; cv=none; b=shkoupcGTq6MowcJWAxsPsmtXwrescwYTEUqfNpDvSmGOiskEwECCwCz5qbqwbmBoFeWPvnjM15XDMbYNmm6cK0VQAfx2V80ndz464NORC/epnzMpZ9FGF9Q8h0R8GFovhfcucRfyGf2asJm1Yke11B2QJgryAFQdcjG8hM7WqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455099; c=relaxed/simple;
	bh=F/97iF/ItJJa7/aRxsY5F4HPpR4b4coIcvx15QKghxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZekwpOiAOp/ym+Bq8R956JI8/CtKbPcj7cqQj+kiNDvyuYZS3qu3Z+6gRKhiQpVn14r2FdGQOOlEBfrf8jJZpocP55d4q86HVwiY+1sduZaBAQ4Vvf1zEleWQJofInP3+yZ9kYE59iBG1DuspMw4vdk5/VOlBW1yQrjuhN38l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fUmqRmHK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fUmqRmHK"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e7967cf67so26450e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455096; x=1749059896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvYmz65GXYt3jp4V315G3baP5IGhVnkC1QR+lx5dgJA=;
        b=fUmqRmHKV2RqCT5o9rbhkOTCf1Re83wlojqzEecc1CfRpccJAPJrbj1t2FiRopbvUh
         Rhc4WgGGpuzj20SnDHzvSYfks0efHFub5OWsif5yITkDga1NpHWdP/G1+ottLhvxmCL7
         PRpIDTWbja+anEHJZFpdRQFfHOxWsg2quxoT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455096; x=1749059896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvYmz65GXYt3jp4V315G3baP5IGhVnkC1QR+lx5dgJA=;
        b=lZPQopRNhF6tRAmE+eOQ7PvEnGf5JeaiAt5/8tcwWlii0DqMNlRjCmhKP3uR+/SRPs
         AroXNfKXhuhJ864hqgs5Ea+7PukCdNv5ei2xfe3zSqnT38A0w/14+KkvJ8VFCzXIAa78
         3WYttM5xzrzDaLOnCGen/QJKoAZSeqCFQ0xon+zAuIzdUaFgijdeVXHenXaMXZitCUu/
         AXIxVp8uQIWX1kRvZWOj8oabtl8wKrxfAkh4bASX/l5m0temmN5hxQEsXEg8dw0exTO0
         ztJtyTOWTH/KdVatEPV4IC5ivrVJfAN2oA/qOVb+1I67yZ0kpZaQfs01qCqWkWKyCbSO
         h/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVyTRQNnED2W2TyHBiOWRE2ldHWry8bqhXGev2BllQOt2E0vYUWBtL5dMCH9QIFa0kYkfp7pkqJQTMY1Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9jtn7isIodkD720xckMVcW+y/wwn67Yf12V8EqGc1Fz2xU6Zd
	iRb0FtTpCWSi/sUKwMDWcncQbPQQeqaxFbULWcO/PSO4We1m91+k641ybXvfyPEwuw==
X-Gm-Gg: ASbGncvnJ2aFFwq23DwI4w9Wnz5zI4Reh0N0lbOiyEikxjKwkAvk+X+ZSuPqqfHrYJn
	apn4eyMYgsN7fpBFSqtcNBl8NGR8xv2fr5ctp+cs3am92qXw1c5H5cHkSn7PD50YpI7rBwxMA0S
	a16Vtz0yimR/chK6kaVyunZ8Rg+n0AzcNBr8FT6YcqW23pTiNzvYX9JjRgRKvNKmqQiRi68q+8e
	FAb4qB8/P3hpv2PIzgqgCaa8covuNQtEp4VodSF1+EZB7aiY7rLUpoQBygvZ0jMXuVyzNwlqQJm
	iIDbGb2nQkbPAWL1bvToQ6AKE6BnqFx8/3maspKBPazNAs6ik95UeTtcVLgNZhMLRnvF6Ic/u60
	L9RrguaFf6i0wI+mMAIgooS6o5Q==
X-Google-Smtp-Source: AGHT+IFoG83ruA8rtMIVQn+vU7qG8UmWXw9OexU7JHNlvvCvw+i3UNkVyAeah4qU6pfBrGgO8yn+LA==
X-Received: by 2002:a05:6512:3b28:b0:553:3492:b717 with SMTP id 2adb3069b0e04-5533492b8ecmr818896e87.51.1748455095737;
        Wed, 28 May 2025 10:58:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:58:00 +0000
Subject: [PATCH 5/9] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-5-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
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

Fixes: d1b618e79548 ("media: uvcvideo: Do not turn on the camera for some ioctls")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..a7b8f3ea01edd8157e0d8cc36351d511225f89d7 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2039,6 +2039,12 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
+		ret = uvc_pm_get(handle->chain->dev);
+		if (ret) {
+			list_del(&sev->node);
+			goto done;
+		}
+
 		if (uvc_ctrl_mapping_is_compound(mapping) ||
 		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
@@ -2051,6 +2057,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		 */
 		sev->elems = elems;
 		v4l2_event_queue_fh(sev->fh, &ev);
+
+		uvc_pm_put(handle->chain->dev);
 	}
 
 done:

-- 
2.49.0.1266.g31b7d2e469-goog

