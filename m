Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3899223DCD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880413; cv=none; b=Biw+wAKTt56C66Cx6bLxzpPwpRn0a+VoPIjkbDQJuKeUFRwKZJWJj401d15b1EsotYylR60KNNNB/tpNxXylko7J5EVE86PWdw/pQVESqw1vn5ln8IFEvQVOq6irSfk4tfOOs/M9nFZi30BV2MZivmu0v7Dwe7GvHwuXxbwkvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880413; c=relaxed/simple;
	bh=pAwYR7oteo3vN3c/HkFqcbWJsyd0dKKMMaP2gKBrNyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trcIgTMRUjgC252GpWtor9MvEjILo02V6LsD1yRDF96fYHOzCAl4NwRSd+u2XLty4VSg2ny+74zj+FuxByZrWxdHMaH9jMSmU0w26D0xdJhLZYECle0nMdJwGrzN0t8A4kRgaaG+CqHLNJQBXOAfogCR2tBopevEJWoLKj5Zg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DdTblg0f; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DdTblg0f"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5534edc6493so923462e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748880410; x=1749485210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=DdTblg0fU3pwzPcNeLqzAj7tg1yU9UKx9BkUA+EuKggptE/0NLuOrVNLrA1p2WTCh9
         Tmekuq4lCWCknT2pgp3KRlywD9RMnjlaLmrMgJB3SHdJDdBnGtnJJRuBiFEOq8LpayHu
         18rLYzF7V9oG+r0uCWxyEd0rp40a8AXboe8Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880410; x=1749485210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YmjTdxkPOA1uf9GrAFrNIGDFJaY+dZi3frhM7shyiw=;
        b=Wszm1VkFH1aNONCZkatQNIlzzKxjt7eiKpjopZ2U1myinaSj3cqYQFI8l03g6msSeI
         but+Vbgtavb3m90v5qY8v0rEaef2cjXsm0aC2p7LkSwCQa+0K7U8xCZGMqnXXRrtCYoe
         pQKb2S9Qbmr5RgD69nL0LItnIwKaxgzivILFul5Ksetoc+HVR0G9JGV+NL2NltE0oY/S
         Ud1UbZqZHEFHtJKYZ23O3g442B+C/mdYshvQCH61TQ352MWuLFBWCCcjCy6KouH3wpHm
         lTqzKu/n0d75MsVLt5T437TdrWE14kaY88RGfLjGA9hS00pvLpcnz9q6QL+3+WYrAccH
         1Y3w==
X-Forwarded-Encrypted: i=1; AJvYcCW/43fHXmC6GN3QUinFm5ONC5k14MYvy5fm30S4ZRTomMWI3nzOjIjLrhyvQoPqveb8kz4Orek/PbHrNNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhdTQlvz49hTlyKOTu15vg73Tzwq4CTHhroiYS2st5p1cMlKD
	t4oA8VkXI3WZuQ9Ao56p35UQBhinMRunHzVK+CK8IJxZ+n61NszRcld9znbV1+Q4KQYFVQLMn7D
	klCY=
X-Gm-Gg: ASbGnctg+RNw+iwVKIwwsqqh2nmoK2CIKgk0Pk3NoKzts3eo1JN4kSOBCx39/KZrylO
	YwtzPSsH/06GB85GLmVhJcg9McNVHXrRiXA3xmSUv2voXch7yCtqPyR/6tiHNNVbEGMdCzgm9Xy
	TPKlrv4yVb4GFG/922tDxI9QgDoXXDIZmOf1r8sJNjlV3uiDTC4gXMBmBzp0ELDXew5m0fDgnzU
	p1S0cRk54Ky2CnqA7eOcHkp4za58tJyJDZLyDRsoTCWDS9c7jfmYzVhQt1C+ntdXTjrP1sDim5o
	8WIklPAmq5hUnVD7AB03HQ63ym9MSko9zgXiugGWYBlhNDxsV2hNJBO9KO483x5w/hSKAOK4FgI
	YwOpWwLRhOgRVxMPo6RaeR9ed1g==
X-Google-Smtp-Source: AGHT+IGf8qGyIk7sMvU/JNZkuZUxxkGbZxcH8ZPvBXOi4UVuVYBe6H8zUb+NJG1maSMKMAj/rJEYQw==
X-Received: by 2002:a05:6512:39c1:b0:553:2fec:b149 with SMTP id 2adb3069b0e04-5533d14f162mr3527974e87.10.1748880409806;
        Mon, 02 Jun 2025 09:06:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533789ff59sm1685113e87.70.2025.06.02.09.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:06:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 16:06:44 +0000
Subject: [PATCH v3 1/5] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v3-1-a99e18f65640@chromium.org>
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
In-Reply-To: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is always called after uvc_pm_get,
this change makes the code more resiliant to future changes.

This change also avoids calling streamoff, which is a rather ugly thing
to do.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 668a4e9d772c6d91f045ca75e2744b3a6c69da6b..862b4e34e5b629cf324479a9bb59ebe8784ccd5d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -853,15 +853,16 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (handle->is_streaming)
 		return 0;
 
-	ret = uvc_queue_streamon(&stream->queue, type);
+	ret = uvc_pm_get(stream->dev);
 	if (ret)
 		return ret;
 
-	ret = uvc_pm_get(stream->dev);
+	ret = uvc_queue_streamon(&stream->queue, type);
 	if (ret) {
-		uvc_queue_streamoff(&stream->queue, type);
+		uvc_pm_put(stream->dev);
 		return ret;
 	}
+
 	handle->is_streaming = true;
 
 	return 0;

-- 
2.49.0.1266.g31b7d2e469-goog

