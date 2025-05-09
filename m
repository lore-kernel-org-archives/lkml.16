Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A90226CF4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826185; cv=none; b=cFFVTZcuLhUERMLm3ndg5NZdH+LECFfergZJEBkdMoQF6lH86uad4jTBRXkp3tWWz3/zC9P6EiVEmVP1MURYXhDzfdCKHemklg/T97y7FnvRkdRwor0OAHuISBCgKMYXrxZoLh5rLF33vnWk2GwpMF/Psi1+J0KqvjKyTMMK1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826185; c=relaxed/simple;
	bh=TALgcSGJ3eoOeMhnfbPJ1FbEpCzVUh+W7VSWvP2wL4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kiP2tBjqhKf6pfZdKtANmkwfaLVSOs22ShhtbIx4oK5vARX0YNsJOaFghp5laydOWNyu3D7vfN1n9cuiaZId+bqb/FBcLSqeIFnjVjhSHFcH8cPOvmpfHbisI/5oQfMIHzZ93sEikuyn1/suRyWI+RNnbwmXXMjepkm9qkWvtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3uRw4vh; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3uRw4vh"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b245ff89c99so936105a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746826182; x=1747430982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=meqvWLOgNDkKrnW/6AikmkhA6lmFYYhW4IJ5f3/mKsw=;
        b=W3uRw4vhKAG9e37FOpLLjs2vDvrtFLXCVwK8x74H2p6f54VrrWLyUlR2itczMY7Mb9
         np5lHTZwbvZVWPAeuhagwewJsV7LLgB+iCvEmxcvqJmz9yNN+7owUUooeDJ8Dz3MOE1R
         4uUCXNWdObKJJRI8Dp+GHtGYUg8Nc8mamlp0mQRii7c3WxBAB/bpqj8ZIq7icKz7usNF
         0LINyY7SHmsPwGzSeDnAiiFq+F5HZ6Wsz97vNn71vTE2EyaaQx303og3DH/oK+z3F3vN
         OdYETpIAQZvnjd70NbHoe+RBQkf404cbkM8C3SmT0xqymClnTduhue2lWHs2aIlBEaQc
         qtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746826182; x=1747430982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meqvWLOgNDkKrnW/6AikmkhA6lmFYYhW4IJ5f3/mKsw=;
        b=RgzuZfW5H6NgSPfgCelboZrX74+v1LU1UFGiqhSOHHABeoa7OK81WlmeThXQV+037l
         f1ETrDfgWaDhp2QaBd9LiUANpCLB2IxpTVhpCO2jtcKc1riZ1gtrI+o3T8NX/G20HyWu
         9VECOEc9YZfv0evrq5XmQRQaQDa+xZ17VStmKDYLJH9uehsmEZwATM2HvhTIoZ1GmJA5
         U0hreR3ikanVPP5tVHUK9/87Wi/0EFtbX94lsTwEXkj4zGFICMy5VWp+PZf2YwdOILOi
         rLPiPv3UZQRtk6sYihKiCXEJVoEsqnKh1wd5G79UiQlVwRywCw5c+khfpuQTB9Rj+3fa
         BV8w==
X-Forwarded-Encrypted: i=1; AJvYcCVIj2/WOP/PRDuyhf9nJiFj7GNW20IiLmEx+08TgGuWq8H1dXoOzEwBfHh0CKjIIdOeCBCBG2qAseDCUpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0hHjcQCuOanViUSKvpB9tNF3InbVFsjlPu/mt8XG51HrkTm47
	D4CBOzS/iwkPBJub8HJ/xjNQPTpyvtWq/CdpSHt0Ni/D5GmTByjS
X-Gm-Gg: ASbGncuKfxSpNOwpMhybTVfJCdzv3GSmvgsvUanEXvBi0QcOFm71lprjlSAuuYJJ6NH
	u49JgLllwdzH4q0hqeJJ85SVXGbnZsUi7nsmwVNHB1E7JNfLI4lHg16YSp1qW2HD/JND5peQff+
	zqI8X5hoHQIKm3nRBklvMiFVDXnYfKMoOrZGKJ9+BWAq7bZ+Rh+aZZsvaD/d2yR3BptsixxrHsv
	mss0E2fNEjUvhoZUi0qEXGun4TJ1iJI8X9oCsvrpX3fg3MCuetAo3nobQhTE19hW+65+moFYUlm
	Su7fIhJkMgpe4lpYELFjvD9aSSnThBHGHMWN3mNK4zykKkdm+Kxq9MONgQzVm5SDNN9qZ00TPs7
	mfjpVl7hqG7+0D7+CWIgEeJlWJ6RtZNarFFon
X-Google-Smtp-Source: AGHT+IF+ITeKptIhdcgHoefjVGiD98M1Z4dXIaMfBsSQt0Vu2agyrzMpqT1JrwblQq1fRY7cXkIygw==
X-Received: by 2002:a17:903:186:b0:224:c46:d162 with SMTP id d9443c01a7336-22fc8b3d8b2mr58540265ad.20.1746826181925;
        Fri, 09 May 2025 14:29:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc764a541sm22276735ad.65.2025.05.09.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 14:29:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
Date: Fri,  9 May 2025 14:29:36 -0700
Message-ID: <20250509212936.490048-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The fence can outlive the sched, so it is not safe to dereference the
sched in drm_sched_fence_get_timeline_name()

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c |  3 ++-
 include/drm/gpu_scheduler.h             | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..4e529c3ba6d4 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -92,7 +92,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
 {
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
-	return (const char *)fence->sched->name;
+	return fence->name;
 }
 
 static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
@@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	unsigned seq;
 
 	fence->sched = entity->rq->sched;
+	fence->name  = fence->sched->name;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 0ae108f6fcaf..d830ffe083f1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -295,6 +295,9 @@ struct drm_sched_fence {
         /**
          * @sched: the scheduler instance to which the job having this struct
          * belongs to.
+         *
+         * Some care must be taken as to where the sched is derefed, as the
+         * fence can outlive the sched.
          */
 	struct drm_gpu_scheduler	*sched;
         /**
@@ -305,6 +308,14 @@ struct drm_sched_fence {
          * @owner: job owner for debugging
          */
 	void				*owner;
+
+	/**
+	 * @name: the timeline name
+	 *
+	 * This comes from the @sched, but since the fence can outlive the
+	 * sched, we need to keep our own copy.
+	 */
+	const char			*name;
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
-- 
2.49.0

