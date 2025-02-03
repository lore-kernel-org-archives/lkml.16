Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CEB204F78
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585655; cv=none; b=IqCZtP5NJTKfNxzrkJ36jyna6iGfB1PFaeBx+0ewdfWb81JR7TfhhHQLXts4QwDHpxky3txVZTr+7qyG91qUbpqxkBb3F86pnQNxnb/Z41OYoDcir3HlLE0byJOAjwN1vWYiiK8U7f+w93HU1KW7A1QPZuKcPhT316PS9N23GB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585655; c=relaxed/simple;
	bh=miU1oeGfq2puBnEEsn/CIUWxyN3yf8vwEyCqnsdbUQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z5m+CNUNqJ0e2aPDw4lcEX7cOgLBLN8neBMahXktB3dgMWEgigG4sa9nRlMZ67ZJB505ivzPJa/r19AF6hXzxkAzjxP9N10nIkRq4F64J9PXkQOpvksqVMgLoozQFBob5Qajsdt3sblEtio+uoQTDzvvG8S5/fjfpT4EEIaCNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pwh+EB8k; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pwh+EB8k"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-46783d44db0so40322051cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585653; x=1739190453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtqj4+IbNmzvRx6uGlPp8wYTVx+vhgS082GDqFP9Plk=;
        b=Pwh+EB8kzyWT2kvphPFr5tYDUxKzPvz0faPjH/tAW4GST1pP/Ns5QybJsX6ytUcK33
         df12l+BWiSpROh8aHuaArKaf40MEfqgaa6OJNM8/p+0tU5fp42AP8LFRt7oY0yFrJI0m
         GU9xgNeAsULPtYUBqeTas3J1tC+AOKDyi2H0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585653; x=1739190453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtqj4+IbNmzvRx6uGlPp8wYTVx+vhgS082GDqFP9Plk=;
        b=k8+eNHS861eVxQRmdc+Ksebo9gcBG6YUPM46U3BSFDwealxyu5gcB5h55245OL0DOK
         CIai0wmVdwBvWqvoVyi8qi9A71TwI+ei5h4Ish8VO2sGOvttjF46KwW6E4R6o/X7sxC2
         pAC6Bt8Eq8xjqd2/YelbzAvVVDz3lxPegfdl+xVnPVfrImp1zMVu2/Y6FgQK0vbu7A05
         jFmrzTybrPTTUnrHxkgmQo7iDnRsqdZb6zPLfT0IM1Czuzbg9UBlh+0Is7x5Kdtlt3Nx
         YbjcDcw3NLkgsraVIeP9fzHmEqYmBKX/MugdwiasaiF713EdKmwjAPohpSZJr9Rq57CD
         gRug==
X-Forwarded-Encrypted: i=1; AJvYcCWEVUpWDAVYYHLDzsZx6npuJYKq2hWI4UHuaaCfKoe7LCB8tpKSha+Eba+EixvDww82VFSuMJs/0OXgGcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUN47yDHmc3bBRzJeki13+47pfwOlw/iGk3Gq6u78ptvXGq/Qi
	D56IepwFW76DoTeuJqKCpX1AVO/rAw9C1ya+IeXggA3mTd6ngF9NBviMuhE/bA==
X-Gm-Gg: ASbGnct4qqiJrmVjjGvp3+JxPXkJ14Sw/+xlRUjxcB+MBBpTYJ/u2HGhg646qGjJ4LY
	fz5rdyqvAVB+MYwynhOxWX6vpaP9k2KsWa/cWckK3ZFVKbRODeIBIU9sfLHSdU5K5ypEwsxasLX
	DJ0h+jpZxSdSXWqkp7wgkRLEQ4Q8EqOVlfuLgiOO19lKNWaHXg3Y0itLvbdxxq1oaWNdbLYY+Pq
	rU0nO3X6a0En7jdczANTZkB7QoSLGeUGoAQ44fZHyH8Oc6jWh43ihEwEMWGjXQIGYav2cmzCAvh
	EnbcGkzaXP32J0jmuqNv3RipOg2pNVav7fXKyjzCNUyFqk15HBH0ZhKVJScMpYmkTg==
X-Google-Smtp-Source: AGHT+IG3CpIs4JsMUIfUgUI2ZmvPf7JQ0NDzYOoU8ixfzLE1RSI9XcehHCjZaBSO3YAMEr3FOh7yyA==
X-Received: by 2002:a05:622a:210:b0:460:a82a:39a8 with SMTP id d75a77b69052e-46fd0a97307mr341265011cf.13.1738585653202;
        Mon, 03 Feb 2025 04:27:33 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:32 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:24 +0000
Subject: [PATCH v2 5/6] media: uvcvideo: Make power management granular
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-5-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now that every ioctl takes care of their power management we can remove
the "global" power management.

Despite its size, this is a relatively big change. We hope that there
are no size effects of it. If there are some specific devices that
miss-behave, we can add a small quirk for them.

This patch introduces a behavioral change for the uvc "trigger" button.
It will not work unless the camera is streaming. We consider that this
the most common (if not the only) usecase and therefore we do not consider
it a regression.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5d6935539e0a..90ec6f0015ca 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -631,7 +631,6 @@ static int uvc_v4l2_open(struct file *file)
 {
 	struct uvc_streaming *stream;
 	struct uvc_fh *handle;
-	int ret = 0;
 
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -641,12 +640,6 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = uvc_status_get(stream->dev);
-	if (ret) {
-		kfree(handle);
-		return ret;
-	}
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -680,7 +673,6 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_status_put(stream->dev);
 	return 0;
 }
 

-- 
2.48.1.362.g079036d154-goog

