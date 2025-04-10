Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250091EE031
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302364; cv=none; b=u9TPvgEEW1YjLXKmi8dviqn4I5YEioJhzkbeLgA1O3G3qzEE3i9faPoepk/vEmGmuiwItqKP1Bd2mZCAzmXv7UfHunIY693ZEmV80OZ61mszGPB/KtBMxiC1+YtEslNQ6uaaVMyl9+dvjJ8IyBFEzL2GkxbrtkniiQJUaXo9GfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302364; c=relaxed/simple;
	bh=qdNQpt1IxuK26bC1rgtZNTumpElowFEQmphU0VoR6QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbAO1/MQO+S6sfuAe17yJedQCDYlz09xOwRQc9y4kMxs9TwP2AV6IOpDEobOjznG2HHMIp90ULIcxRaFeQm4TLyqfPpKxPJaYM9FtBoji7NDUVwCVYm2EIHzbFVuXutrrxpW5p2d9B2sHMiooYIzpOQ9tQb9ScS0MxgKdwRXDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C56gbxfp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C56gbxfp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ede096d73so7975815e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302360; x=1744907160; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4B/rb3eqZsvw3yjsS1uWgq6RoSmyPvIP2UaYAZZK0nc=;
        b=C56gbxfpcxB8JnIIr4uckCEX7zTTl1+4ICtPmtdXZZBBg8R/MV0LZzhMjcpfHfUacn
         gRKRvJNRn9BegvxN3UqUc8XTFTIugyQnCeocolbUxifHOPt+vwLH+CI6wemlarfh6XvN
         2QlqYSg3saQ70oljbcqln+h80O6eDeNbYosvGBzv/Mv8yXG9FphZxEprWX6Z4c/lVHy4
         p0tgE53fyQRjj6jb9U66QmbFAn/nUx245Nsc7NtMdCFxf5ciMNkDcBg5FRk0xajVmEbk
         //CJ6/ibTeycHRbvplJmFOx6ByrRvqHX6i2E4S+7abmMIzJ+Z2/KnOz01ApR/MfphYCu
         5aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302360; x=1744907160;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4B/rb3eqZsvw3yjsS1uWgq6RoSmyPvIP2UaYAZZK0nc=;
        b=tIt1WIJeqOiRp6vS7Z+gR9IE0v8MD7h12h/4QmyvxkPeHUd+sfc/9oLnOkI9Pwmcm7
         anDsCuFwHRyjNHDtQPTw2hjc1Y/Uh81FeocRTL7LxQipmU/CMvMZ3eGrNqgfQjX/32kB
         c+BofOz9WIbrX3Tf+xKDIFqTgP5Xu8Wz3kIImUAFp8eyPU7eFaof1BubnJc3OugLBF2U
         Ji9qGw++koT7bjpo3HGE32BSfit5tumWSJlb26a3XBUGL+8uag3GZzCqYGNeQc2FhSjz
         /HFGi5GoX3i0pMfyzrQ2FJbn2yZh2ODOpJo94KWPUWlL1AreMH+a65vs2zJGQWtgoMpY
         /VUw==
X-Forwarded-Encrypted: i=1; AJvYcCWpow9Yt4te61uIwnsULWuqejQCMSBdKcAyo56uzdhP7mUhd/5pjVHfwSLEgyvNdDRTfZDPlRqZqhmbesk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyB2T6Ran/E1EbN9gtByYzA7uOishN4GpLI87p/Sg4CGbiRrym
	Vjtq6BC/Lob4JmptQQfAi9HF4j1COQsK1kG63VvCJF0432AM1RAISkVBrijUfQM=
X-Gm-Gg: ASbGncs5s+kU19pATNtLwB9hw8cfgFVHyKmp9mIDI79lTp+YLJjXB0nR5VYDuOxH6Qs
	dfOGkvyIU+B2+s5kt501lLwzW67NLZRJlzdiFkB+UrYdYuh5TZ5P1RBkiWJqReZG3SXokPbcEJc
	Lb5rO0vkcrwtH1hasv1CSa0mUPRknTOuKjqgUKc0MIjNmvteIwMnTyEX6WKK1olH3/eR8aMlFuC
	1izCZK176qpa5s/1AE+WmYEluvlcbtbP4SaR9C6RoLDNpA4ro22NzvwOZn4hzE7nzBrKvWva16H
	sZTnFK3zxLG0ofrwl6dudqeLdtasUqrerD5vr8D1TmljxA==
X-Google-Smtp-Source: AGHT+IHlDUACoR6HuZ5lIjnATvfRIBZPmJdAtBlTqtWbFzHfLPmS+68O7mhgc9NM65uSvBvM+8cTrw==
X-Received: by 2002:a05:600c:19d0:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43f2ffa2ee7mr34541075e9.31.1744302360514;
        Thu, 10 Apr 2025 09:26:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893773c1sm5166880f8f.24.2025.04.10.09.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:26:00 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:25:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/syncobj: Fix leak in
 drm_syncobj_import_sync_file_fence()
Message-ID: <c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to cleanup if the chain = dma_fence_chain_alloc() allocation
fails.  Now that we have multiple error returns in this function, switch
to using an unwind ladder for cleanup.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 636cd83ca29e..c136d0c772dc 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -745,21 +745,24 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret;
 
 	if (!fence)
 		return -EINVAL;
 
 	syncobj = drm_syncobj_find(file_private, handle);
 	if (!syncobj) {
-		dma_fence_put(fence);
-		return -ENOENT;
+		ret = -ENOENT;
+		goto err_put_fence;
 	}
 
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
-			return -ENOMEM;
+		if (!chain) {
+			ret = -ENOMEM;
+			goto err_put_syncobj;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
@@ -769,6 +772,13 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
 	return 0;
+
+err_put_syncobj:
+	drm_syncobj_put(syncobj);
+err_put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-- 
2.47.2

