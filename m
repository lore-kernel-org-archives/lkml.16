Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F6257449
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352331; cv=none; b=TObDvcNzMs2uRyvrrXaxmO4wCTNDdJmf3qQO1FaftM2Xwg2mf9PlMeTc/WPBrAe8pZ6X1i/cznSw1ZRkoiWUrvuE4KBN1Va544uqBVlBlKnqSW0ZocnQgCKuCVoQYlIAYr0Hxt6xDWvePWmiAoYdPRVkbD2a4vHXLQojvDyQKec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352331; c=relaxed/simple;
	bh=T/ENgDFNkXtO15nvmRhR15iE4Gpc/i5d+Eopejkp9ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyXGl9S5+1Cn6ZIKuD7Ol9MESQU8rSZM/QoSAytAdDsrlrpEfHSiQXdMOYVwhxE469tk6yosJCCQeAicnpILt8vG7XbicYU/TV8Cf++qBSVNFi5aeL0buLqkKYgJs7GehXCZ+1igiZRp+q+NobZ5TEj44487rCwwlH73kZdsVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cVFyVHz5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cVFyVHz5"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553bcf41440so5331853e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352327; x=1751957127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZdlFdfPdmkQXJkoN8XjUo5zo6CJqcXC2iQo+5kU+Hg=;
        b=cVFyVHz54lWvTGZpZjp90kB7Ja1MJ8KStzTO1ykvoFJtoYyrxWNBRpnN5RA00LVU00
         tGzhVBzV6llqUUsVdMJqWiOpFwzz1/wDKK7x0HDj9JLRMvl0/jLxvUF7GhRaTQUGJh3d
         4O6D4/5KH9WB5amOXTaYW+RGIDGMwOq2F8ir4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352327; x=1751957127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZdlFdfPdmkQXJkoN8XjUo5zo6CJqcXC2iQo+5kU+Hg=;
        b=cXcpiDJ2A2jrejMN4kNmsUEHb3QAekZnBvw9qJsUV6bDnKYSDVljyB+rm/7128EsNn
         aMYmZHCUr8Zsy1+CkoruDuGy2TLeGTP3hRG6KXqQjefBmmRCMJEIYTRTwT+XLIzYTnsL
         A12sCwOnEhFhkxbIt756+uMofXyQRxRbkiYOVUsY8CQhJZ34/aKZCapD0YCJRuXvmFwC
         /DzRLRwUGv9HqRFz3jigiNpDv9KzROK1pB0JVd44WQgrbeTC68IWlvJIQEOjPufoRe+M
         tdhOhqXLXkHiIJoBeJyH6IymJedUu6mTTGuf1ItX2VI687NJyf+bcjHocpDcNaMNqZRI
         vPGA==
X-Forwarded-Encrypted: i=1; AJvYcCU/wThyHz5a3sAlWKvGH5YXSZqqGuvyL4y7I6VoVRksbQNoX0P6ZHTxXhAdn16TPTurbFuckGIDN7Np6CI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXqrP4o35grocrWS+lfWGYBdx6Iby2NP2gKBlD9osqq1fFA40
	CsfE7rLQlkTUPExDhgSc44Kka/Z3JhM1UQaGlQmoPnBaZ568yYxbtn6e3tdih6I8SQ==
X-Gm-Gg: ASbGncutyU7xCA0+S+qIwv4xUmyUYoeQsFTN6BbKqEnb2lReGHXvZoDNDN2AGvkrqM6
	JqL0QNMFPWPajgCWCIr4Xyg0euHJJxtcj3XD1godeJ3t1L2NNP2lgyQNvW2Pm1MBgiy3J41CyFS
	iCkrdz2yOuVfyPqgIcZGeCy6CW8+fQ+dEIW1uWTD8tWCC6yAPfDoWM3l/EvIBXnzpeLerzKpQEM
	yY/QTIsF7lKYhwjiBkHCFD6hOchi2NFS81webwrIj5b8zG4iJerYL6IptCZtSthJtHgS8/+dpFx
	mgfex2ITbAoy+tDGfXEU8oNC4sjPX75yyguaqdxhjdMyTTLnkNy25AU8UJwspaB3Qfb/H7YJnrh
	X2zwtQ+ndXr6QO61DWiQbkEj7m6EffvAc8rg1rk1kKA==
X-Google-Smtp-Source: AGHT+IFUk5DwN4L6iLti9NTtyA0INwfyi72kxI97Q28rnDFt6sVumziGfDhe56SIw4UeX08NLnkvdQ==
X-Received: by 2002:ac2:4e05:0:b0:553:33b3:b944 with SMTP id 2adb3069b0e04-5550ba44a0dmr4812865e87.54.1751352326511;
        Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:17 +0000
Subject: [PATCH v4 5/7] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-5-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 303b7509ec47964dc1bf0e28127075b4a3867511..efe609d7087752cb2ef516eef0fce12acd13e747 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2072,18 +2072,24 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
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
+
 		/*
 		 * Mark the queue as active, allowing this initial event to be
 		 * accepted.
@@ -2092,6 +2098,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		v4l2_event_queue_fh(sev->fh, &ev);
 	}
 
+	list_add_tail(&sev->node, &mapping->ev_subs);
+
 done:
 	mutex_unlock(&handle->chain->ctrl_mutex);
 	return ret;

-- 
2.50.0.727.gbf7dc18ff4-goog

