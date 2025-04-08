Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583081C2324
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127306; cv=none; b=NgqfnM3wbNdts6hO7sT0SmBxnNEWu+3z18PsJc+FTF0uT+OfN3pyWi15fSn5Mnjr6+ixcsKe6JzxI6mNTkWJxCP58D7m+4IJ5N3bRZPbkxthY4OTk2lwOeUJ+nGKqWuG6CTiNqeppSnntBIi5XMol/QL3JCvOtP5OJjztX6SW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127306; c=relaxed/simple;
	bh=+dkpx2n/R+Cl5Bj8W/GV2cw7w/4rYtmA3C3jnJoH4dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WODJJx59YK30GeKe9qoH2YKrbg//F5hYMdx0pxeDX+Gp5vV0V0CTE6i11xkv7oupaqZWYSaosNjXC99z6HWQE1rJ8Qs8qGaGUuz/LMaYMGPLV5CiCXzFhdcHjGZ/WAJy16yuPfjlsmwM+Wfl6to3Ioqudnj5Ds8NNeK5575fJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrVGhxOO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrVGhxOO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so6041315e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127303; x=1744732103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMCa4mYnL9/jZeEpICSWWjgokdOUsHJ8MFHq70ctWwg=;
        b=OrVGhxOOLX+1iZ119equrXkFVd7d6CgrRtGNyENdowPffSeTL33vNpC+Hu4+667GJw
         Sy1T0VyRksOn/emnYZlmqe2pdVsxz6sUMw9rY8J/o2oyQHn5KihG1pIzxSWIRrftGLjE
         KgrLWd8LlzqtOrSKfpt0An9IaaJmNy2Wvk2IU4bugbP+VDWnJQV++jNLP190BOUaeUYY
         +SAC+SiUDt0RUnzuS0y0TRFmff7K07AY0VPsk6/7n4tu15AzAHdyB4HlZWc8i9DmQkI5
         Y6srcIrZzXsZO8NIqI2sBSyGM3Dd7kO32DyCqno6bAi9YcnpM9UsU2LMtK1pPLsmAKQI
         uZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127303; x=1744732103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMCa4mYnL9/jZeEpICSWWjgokdOUsHJ8MFHq70ctWwg=;
        b=a1Bv1+FIgNH7XDZIm7RsMa7X6eJgjNcJ5HoxJ+p4wbSk0do/bXsoqggyJXM52kkwth
         qxos1dL/z7Du0zKLQ/n2PSnv8fhe/IV12dvusej31gc3+QT1Z25+CV4rnMKNmfITS0NJ
         YDOre9ig4d7CsamXgHoinoYchE6kUI/nnjpifIbz89YI7CB7h/AxA/6QEsdDUgEY0WUv
         8gXBK2RenJHrZG3jRR/rE7b2LoImP1twrnoSfVr5Ao21sBzVceSUYKiQC+tWQDW9PMK/
         R0wWROOgi0re2vXq8FuclUN5gD8vCjVxk5N3i2ZLmDsodtuWd+UvPX110TDkqK4hb3Qw
         PXMA==
X-Forwarded-Encrypted: i=1; AJvYcCXyaB5AGHBt1fJk9Z33SGQ+bCw6G7sDvan7mC96wT4HFsZa/7Xc0Y9+ujKBMWyIIfaW0bBF2Gw2pepnCJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBKgh2mT9mzO7V+XAGIqdr0pOp+xH8HAG+c+F408S/aK/fj14r
	mMwNKUgeMhrNl8EyB/UXVuo3Xly73q9qG+UK/ZDb2xF8dSbAdP3K
X-Gm-Gg: ASbGncsO3nB7IR4w+D3edj97mZb6hcaXx2QbytIm2Cu443CefJwZw9h7OeLzhzxXt/X
	X/EE7tdk7d02Xd3FV4yXMmj3k3X/fWJHXcmrA1F76FhpsS4AHbR+d0c8EJxgh0KJfRp56iNnNQ3
	CICanQsdXZNMdjDSLxj7DZrFzacu2I4df/UKYU6I8mRCWehwSWZ1OI9PwVvh24Evcmt+ltnoui5
	cqwVsF/XxmnDq7HgbXaudgJfmx8W8a0w1OdFPOe+k3qMpgReCikWNnKKgdyVaAAnm2GrLKgyGNl
	EvEqBknB43huVCGrJrw57NVbJMEte4A3lQj4ovI9pJDB7Nk6/3OHmj5Z
X-Google-Smtp-Source: AGHT+IEJza/VE3KBD99Of28IXNQNtvTH+ABObaWU5NenBD0MKdnhctsS+DNaE8DwiFwsLSovcTMx3A==
X-Received: by 2002:a05:600c:4fc6:b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-43ecf85fec7mr55367495e9.3.1744127302549;
        Tue, 08 Apr 2025 08:48:22 -0700 (PDT)
Received: from mosaic.enunes.eu.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366b571sm166903995e9.40.2025.04.08.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:48:22 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>
Cc: christian.koenig@amd.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 1/1] drm/lima: implement the file flush callback
Date: Tue,  8 Apr 2025 17:46:37 +0200
Message-ID: <20250408154637.1637082-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408154637.1637082-1-nunes.erico@gmail.com>
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With this callback implemented, a terminating application will wait for
the sched entity to be flushed out to the hardware and cancel all other
pending jobs before destroying its context.
This prevents applications with multiple contexts from running into a
race condition between running tasks and context destroy when
terminating.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_ctx.h |  1 +
 drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
index 0e668fc1e0f9..e8fb5788ca69 100644
--- a/drivers/gpu/drm/lima/lima_ctx.c
+++ b/drivers/gpu/drm/lima/lima_ctx.c
@@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
 	xa_destroy(&mgr->handles);
 	mutex_destroy(&mgr->lock);
 }
+
+long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
+{
+	struct lima_ctx *ctx;
+	unsigned long id;
+
+	mutex_lock(&mgr->lock);
+	xa_for_each(&mgr->handles, id, ctx) {
+		for (int i = 0; i < lima_pipe_num; i++) {
+			struct lima_sched_context *context = &ctx->context[i];
+			struct drm_sched_entity *entity = &context->base;
+
+			timeout = drm_sched_entity_flush(entity, timeout);
+		}
+	}
+	mutex_unlock(&mgr->lock);
+	return timeout;
+}
diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_ctx.h
index 5b1063ce968b..ff133db6ae4c 100644
--- a/drivers/gpu/drm/lima/lima_ctx.h
+++ b/drivers/gpu/drm/lima/lima_ctx.h
@@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *mgr, u32 id);
 void lima_ctx_put(struct lima_ctx *ctx);
 void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
 void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
+long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
 
 #endif
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 11ace5cebf4c..08169b0d9c28 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
+static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
+{
+	struct drm_file *file = filp->private_data;
+	struct lima_drm_priv *priv = file->driver_priv;
+	long timeout = MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
+
+	timeout = lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
+
+	return timeout >= 0 ? 0 : timeout;
+}
+
+static const struct file_operations lima_drm_driver_fops = {
+	.owner = THIS_MODULE,
+	.flush = lima_drm_driver_flush,
+	DRM_GEM_FOPS,
+};
 
 /*
  * Changelog:
-- 
2.49.0

