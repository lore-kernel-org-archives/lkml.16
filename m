Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C1918E050
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936732; cv=none; b=reN6X4yA8/1jGF752RSL+IgiJjV316AO5Kv4N8SPR463cx/9RXoGXICCFVfYFgGvf8vX8O/3WNguIgg+WLT9QGT6xpzCmq3rzeORhXLf+fJyS8Rra1wEP/4wKgG0DB/Hxw1iu8UrTe1sXW9mFAjW/y/b9UYlpSi1v+y5ShdRl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936732; c=relaxed/simple;
	bh=QcG3SUn+imyDe25SjF5FB7e+cnIdZBxIsQWIVlcGZhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SO0mjGbZvlY9M0W4f7VKWRpGVRzfAqcnDC0AnTKK8dmjlr+JLS9s/VLnn04mo5BWKuL50ThpRF/pSA7hBXS4+huZqn1/Mm6hjPswp4TTExAzQFtE01W0CeP21S2l5p5E9UTiH+p/xgPEe8RMnezaz7DQNNSPlQM8RTeZyIRccVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J9oaSQmC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J9oaSQmC"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-551ed0038a0so6723594e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747936728; x=1748541528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq6hiXCLW/5+B6e/F9cx3BxUfpM989hM42lId2PS3xs=;
        b=J9oaSQmC5nZ644gvntnIywShg3iVyL5HLmt3gVNNMEPoRpg0yTjvPaaJVG9dERZ0NW
         mxp4J0WyREo5QI6Q2ifvWZCoJxVV8p6w20XV2Ti7x5EJT5Y1wXHp9gWuBZKBgjJnxP2X
         Z3/SAHcD9yIt070L3zb7wNsFO8tBVS88nVihg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936728; x=1748541528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq6hiXCLW/5+B6e/F9cx3BxUfpM989hM42lId2PS3xs=;
        b=qRssSPHoR4amQrL6XThw8WUamIVeR4hphHZC1v3uh/alH56xcs/J9Atmi7OozMiKpd
         RSjG6Ekc7rP2Fgi6ysqryQKyqdl5DSpAePDhAFGVtBdv7CTflCT+7c5aXm1NavVHLe5G
         oWmPWuI+3BBSPiVWrrMsGf5nxB9WO8/TBgc3oG5+aZwHBCa4tAASm8qq8JHIk/tc4hU+
         QMQ944z7rJ7HR60VOmlJOuWJ3PkF7YMNNk8SjLsEYXEFD4GGTZ+zzZ/2YVimK5N8n/px
         G38gNOuC2EnSqNe8h0PFFg+X+VlNQDCoBK8GT3qcuV59yx1rZdFUpdNX1VpCNS/6DUjZ
         tfwg==
X-Forwarded-Encrypted: i=1; AJvYcCUpXyipWUEv8LvWgxJCVX+RAj+TY/lfTd7xvvfgOxdtm/aWfoyGuLuqD+EHND3KMFISqdb3RWKE0M/a2h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRrCPZgM9qaCUo8+amhWjgfLhIQEEr3VkhLanHUblhB9m2M64u
	OP165XMCq9xmfq4A3QA3DRG3zgG8CKZxl90/by++ySmfm6kFgENxGWX5ACK7U0DT7A==
X-Gm-Gg: ASbGnct4VizooXyUQFALKLGz9kOfLz7aI6IwwBpguOVv5GKjeS5IARH/4gLn9kfutZB
	dBGqwHVGmpENq4rJazUzUOYQOaZHZstSA+2WRZXcjHz5U4xnpQvnU6Kj1hyA1gQwFUMGRZQZoWR
	v0A1YYoMudi20igcJn0EDiige6LIUg9j1+cvgrw52jJOWtb5DhfTR4KPbi4JljEGh38PhjPpoK/
	tVElQREeMDqmGD7WKUDSL+OOIxQhsoQdUoiaMr9b+1+rD0/0+gXqK0yEV3FbXWws8Slj0aTHlfj
	zXAvmh+Rj+BPGyRrItC0WnIdKbXhzGuxDuWEiX43pkEqtLSgOWOqZDwM8KUR0KEXNrhTDx/JjrA
	jVTIKBLRpGJ4cZXFzN0ktXtoldQ==
X-Google-Smtp-Source: AGHT+IHtz+09CN3dUILoE5bvCx936+0JcoTZUsSxmv1K+SqjZ4Dfvhh4AkX2J/5LPVoG9ByQqGjbnQ==
X-Received: by 2002:a05:6512:39c9:b0:545:1104:617d with SMTP id 2adb3069b0e04-550e7195516mr10182880e87.11.1747936728367;
        Thu, 22 May 2025 10:58:48 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e858sm3483992e87.227.2025.05.22.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:58:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 22 May 2025 17:58:46 +0000
Subject: [PATCH 1/3] media: uvcvideo: Refactor uvc_queue_streamon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-uvc-fop-v1-1-3bfe7a00f31d@chromium.org>
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
In-Reply-To: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Do uvc_pm_get before we call uvc_queue_streamon. Although the current
code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
this change makes the code more resiliant to future changes.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.49.0.1151.ga128411c76-goog

