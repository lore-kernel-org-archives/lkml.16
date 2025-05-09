Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B723D280
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815058; cv=none; b=tx//L3KBw9D3qR4izl/z6cqhLkozwHZoQWsersK77m0gYNfwOPawuWaeZ2vJVk93AWtx+omFLnbXRCzJ4t39J/IIs7WHcbAuaFbW2nox0ora5M2j7Sv7LScpR5FAUqsPTRU+2ttX6veJXZgtNl9kVjM3dydRSKbE7mCCj1dp98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815058; c=relaxed/simple;
	bh=zFV4u4xYrdJXQYQST/NOy93iVerYdoMEvRx9i5izrDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y16zin0zEXkrzHlLOJOg7nQ3OPaaCAuNUh/FZkyb85YBn6JpSfzdc4gGmkrp5tluzwLvtPfqVKr7pdCWlqbikxJH6eW0L3GuqKkms48nI/aVtO6NA1VJ8+WCZ0wLuYcR8LpNv08kFAZdqxuc0296rHKu06NvXYGXgag4y7wrfnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kz93+UpO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kz93+UpO"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso3008245e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815054; x=1747419854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yi5XaVNppgwZ+7IG1Lz4V8UPUgu4s/f0SGWRQuuh7uw=;
        b=Kz93+UpOIxMebqw9iGgAs3Sdq2rhRiybIwuuUew88UCNr5zOFaNTJj73KzLLN0IN1D
         GJL8WUbMDlwmexHov5u0lXN5ReoDYLB/Xi36I5O7QSDoxUnB8eHWuOJWuj1BxNvmLZWE
         uSYQJYz5l2yDpdQ9buE+fCupqZY4j2lTD3BCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815054; x=1747419854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yi5XaVNppgwZ+7IG1Lz4V8UPUgu4s/f0SGWRQuuh7uw=;
        b=r66M22Oqlu2jLS7Vu8xuHeAu3Lwr2hsB13ch8cS3pUWJx+5Ia8BwA/jJRR5VY1RjBX
         GJ1/hsVHbVMxuFGIqY5OcfuNRArn240qQZOsTFtNbxhe3Z7w3Q+VHj6hexjWYj+cRp88
         UyP9Bfa5f5D3PKkCsVWOyfyN+dxP99hyYM1R6ynGBSCCbrIJxLfNcj2P0QkSGgYLe/rz
         JsaMztN5Hp954g6gYVz8GTkvOF72xOXwE8Kngwn6BAnXtGV7QmIxpZNHMIhjdGoIMjpg
         D9gwQzpoKqpJkMGUUN0AbaPzukB3xaBVawB9+Ml3GKfD9Dv98A1Zlk27Y0EMMjQcH3BB
         5wgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGo1aVOClbQgEAPPhg1hiAqtpoy06huZH4/KShQ8h0cNhqGHs/4wG8a0UMQOCCMULruEAn7PxOYESo4s8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuE87NJa9zSz/PnH2Ul3LR3jiK+/Ro0Ks9spuq2zheRDIin6a
	EFT25z/96vZY1hCq2Fl5+gRfDasvyEcNdwO625+DxPZYrAY3q8C/3LNp+7RCD1BFqPgA5vQAaCE
	=
X-Gm-Gg: ASbGncsAguwTPQm0aJ15pli+IwP05NckYu8632jB7bzRX2h3InX1KMsn4GwbPGbGbEo
	s10cMpWir6vldIGvd0itAFvIqlkvf6lIR1Y7av+7gu/FeKtsXzVcAF/YZKDCBvNFUXt4UvW1qRj
	RRe1ZufmqptgMX9fjAfK2US1T37k+H/J6Mt+lKM2B+141zVqPNBih9J8gX1gxiNvP5cfeU8UFy8
	NVrxwby8aiGCpniXrwGq93il1w2hoPc2vTgICrsaJd0G/BR2BrwUHYChvMuKRobO2BYBjkFyHZj
	PeyyevIiXtVa2b/reWxoH5zk+4W5MlTIFGyKC/5vSiumBEzPJ+dtQ6C34ufMVewSH+4aPG7fiHF
	V18IlGfEscSzqXZmRwyemFivRLzi4sTU=
X-Google-Smtp-Source: AGHT+IHPOHJuwzRwwthAHfX0RVaD2nwsVxCj0w/t87pjwfGTdyTLGs9Grg4VR0ctezRgetwQoyhrqg==
X-Received: by 2002:a05:6512:670b:b0:54e:9038:d835 with SMTP id 2adb3069b0e04-54fc67c4734mr1262503e87.20.1746815054485;
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:13 +0000
Subject: [PATCH 1/4] media: uvcvideo: Refactor uvc_ctrl_set_handle()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Today uvc_ctrl_set_handle() covers two use-uses: setting the handle and
clearing the handle. The only common code between the two cases is the
lockdep_assert_held.

The code looks cleaner if we split these two usecases in two functions.

We also take this opportunity to use pending_async_ctrls from ctrl where
possible.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 65 +++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..26be1d0a1891cf3a9a7489f60f9a2931c78d3239 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1812,48 +1812,53 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
-static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
-			       struct uvc_fh *new_handle)
+static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
 {
-	lockdep_assert_held(&handle->chain->ctrl_mutex);
-
-	if (new_handle) {
-		int ret;
+	int ret;
 
-		if (ctrl->handle)
-			dev_warn_ratelimited(&handle->stream->dev->udev->dev,
-					     "UVC non compliance: Setting an async control with a pending operation.");
+	lockdep_assert_held(&handle->chain->ctrl_mutex);
 
-		if (new_handle == ctrl->handle)
-			return 0;
+	if (ctrl->handle) {
+		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
+				     "UVC non compliance: Setting an async control with a pending operation.");
 
-		if (ctrl->handle) {
-			WARN_ON(!ctrl->handle->pending_async_ctrls);
-			if (ctrl->handle->pending_async_ctrls)
-				ctrl->handle->pending_async_ctrls--;
-			ctrl->handle = new_handle;
-			handle->pending_async_ctrls++;
+		if (ctrl->handle == handle)
 			return 0;
-		}
-
-		ret = uvc_pm_get(handle->chain->dev);
-		if (ret)
-			return ret;
 
-		ctrl->handle = new_handle;
-		handle->pending_async_ctrls++;
+		WARN_ON(!ctrl->handle->pending_async_ctrls);
+		if (ctrl->handle->pending_async_ctrls)
+			ctrl->handle->pending_async_ctrls--;
+		ctrl->handle = handle;
+		ctrl->handle->pending_async_ctrls++;
 		return 0;
 	}
 
+	ret = uvc_pm_get(handle->chain->dev);
+	if (ret)
+		return ret;
+
+	ctrl->handle = handle;
+	ctrl->handle->pending_async_ctrls++;
+	return 0;
+}
+
+static int uvc_ctrl_clear_handle(struct uvc_fh *handle,
+				 struct uvc_control *ctrl)
+{
+	lockdep_assert_held(&handle->chain->ctrl_mutex);
+
 	/* Cannot clear the handle for a control not owned by us.*/
 	if (WARN_ON(ctrl->handle != handle))
 		return -EINVAL;
 
-	ctrl->handle = NULL;
-	if (WARN_ON(!handle->pending_async_ctrls))
+	if (WARN_ON(!ctrl->handle->pending_async_ctrls)) {
+		ctrl->handle = NULL;
 		return -EINVAL;
-	handle->pending_async_ctrls--;
+	}
+
+	ctrl->handle->pending_async_ctrls--;
 	uvc_pm_put(handle->chain->dev);
+	ctrl->handle = NULL;
 	return 0;
 }
 
@@ -1871,7 +1876,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 
 	handle = ctrl->handle;
 	if (handle)
-		uvc_ctrl_set_handle(handle, ctrl, NULL);
+		uvc_ctrl_clear_handle(handle, ctrl);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
 		s32 value;
@@ -2161,7 +2166,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
 		if (!rollback && handle && !ret &&
 		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
-			ret = uvc_ctrl_set_handle(handle, ctrl, handle);
+			ret = uvc_ctrl_set_handle(handle, ctrl);
 
 		if (ret < 0 && !rollback) {
 			if (err_ctrl)
@@ -3271,7 +3276,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
 			if (entity->controls[i].handle != handle)
 				continue;
-			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
+			uvc_ctrl_clear_handle(handle, &entity->controls[i]);
 		}
 	}
 

-- 
2.49.0.1015.ga840276032-goog

