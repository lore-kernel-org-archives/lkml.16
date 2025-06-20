Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625762472A2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750463477; cv=none; b=X3oEBuBvAHOdglM3MeObGzn2jlmTGlw8Cwuc9iOtMOfhqcUqnSwTeuidn8u7vsU+tMebC2omsob0ATJXoSlWH74CmiwOaAKQxWKAxSnlKWNcpYyuZpSurD0YfYbXp1SNJvTNJVjwhy7NYVQeEYdq6j8LROdksE/VDI7IcKVr5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750463477; c=relaxed/simple;
	bh=rXVwxZWJoCB2oz5CkHpcJBFbu6LRZ/lYVk7OW6Ml4iw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A49afeNTPddgzgU+jcIQ82bivSIGRZIg+FwOy8SBosO7tz0fZoRj3TQ2OhmTxnU3osZ4WXKJZYumNtSQijm+DlX4We1Pcb9vCXNf/Uh4FNz89obUq3smb6cyu3R+5JcnAUTbng52Kr1lI5H1LQ1GObOO8VqkAA8RMBTNUUg76U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlL3Jm7Z; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlL3Jm7Z"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ea292956so26029855ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750463473; x=1751068273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vvox43cD9NYrsjyf5GKXqlmstOaekHhc5zLK9+dlWE=;
        b=GlL3Jm7ZvVqqLrGfT0p8QlaGk6A7GrnN6hLQwpVgw+EwWhVvfQ86gm7+mIvEJK1C6h
         bH9pdbXzBKnDXq3I9oxL4GlO3nGNTANnXPl2jSvG9LGagzXF3Xls4cTJV4Nn/uO/tQIk
         oLMa4kHAwp9QWxbeytIc2+9wOkn7E3f43lHngn03XdidgdofSZuVR5IUHwfSXa6etzLA
         sQVs4TC7XOcrsOj2iyfaxmwQMUrwt2gZ1Gk68l5cp7B5N588OT0Sgb1vGnmkKX+AXMVb
         XMFPBj9JC028TRYrEfVtNcN06oxO4D8cMwnFmXL4qfR5EtBvgSS2nyBnbXBcqUSZYYHa
         l7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750463473; x=1751068273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vvox43cD9NYrsjyf5GKXqlmstOaekHhc5zLK9+dlWE=;
        b=O8It+RxqaIViiwXA4oJCHzSmqGB1hkbDXd0Qpx0a/l8apm3ALjUJk45YfsTk8lhFVB
         k1TvKEBrCfF6YCZ9aqAC0Hz1+f7jS6NHyhyiPBM7zaRUj9BmlSyqpayfyV88d3LKF2sW
         VmY+2r1cINxnEL+dJEEtu45NSTDl+/r/0UE9MPW4WBmEJCvH1+ZNM664DiiLbpdbYaoj
         ecyRBD6FM5Nxh8uPCKuwfHio45pXzdvl2NRAaVK6C7YLkIj3aF7AW9TT0W6KhYVKhhii
         miHBxzLt15YQKk0fNuFOmfcQ8hJJ7NedVY74JFzSuWCrM8Kk4zvQcF1slKbqESXgl4kL
         lklg==
X-Forwarded-Encrypted: i=1; AJvYcCWnq+6WAntucICN5ACganEnotmCXwdfpqghqg/nGvZ14YVT+0vbeGCdyvBXrzL6oxjFir+tKkxiJU9M0Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3nHGP9wpN3UvipVOw/6x8xW27txALuJZG5+YGZ845BzVBdof
	hYzu4aRXggRMDbvq3dM0DiWmV4PNwXR24aKG3L1LxOQcNWoHkqxTStQ0zfFLOpL6
X-Gm-Gg: ASbGncv275d+7mZ2QplO6L9kEMVHza7YFGvX23PPjpI8bgI45DmBYIOltushTRBbwij
	HW6zUc1C/CxeXyPDa/S2BlikqoV8zNK/PxfBfP1F7J+6ebaS4kNyFS3IrHN2+Gj2NT7IH9/A09Z
	+2Iay16mF4ycPgcH5m35i43+sgOLYc0DwVsvjInqn3hHc4EzYESKXwnG4xT7cjyr8zJFDioCkCS
	86zw+0xLMoArOSBxQQ/viaAsvQpxbJtF5Tkp6oT9f5K+8iZ0LBbnr3widYkS0NNzOEtKRoz32z3
	VwunRXOYkhc/UaWk6LD6Z1yGyP1+Nm3muT8TrEwsRZgnDVzJuq7n2YCKmoL3uH29PRJZd0KD8AC
	kNg7Qo6gQjWzaQUJ4x3kD05TGDG5dg7k=
X-Google-Smtp-Source: AGHT+IEG79oOLnu9PJ+AZ0fBSiD3lvfh6w0jAZd3L7P7KwYuJo5rGFZkWrNOQGbpSZwQOidQim91Kg==
X-Received: by 2002:a17:902:ea0c:b0:235:e71e:a37b with SMTP id d9443c01a7336-237d99bcf92mr70013385ad.34.1750463473536;
        Fri, 20 Jun 2025 16:51:13 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com. [34.125.18.212])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d86d5ea7sm26670035ad.206.2025.06.20.16.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:51:13 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] panthor: dump task pid and comm on gpu errors
Date: Fri, 20 Jun 2025 16:50:53 -0700
Message-ID: <20250620235053.164614-5-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <20250620235053.164614-1-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is useful to know which tasks cause gpu errors.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 485072904cd7d..f44cf95e8f1d1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1359,8 +1359,12 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 	fatal = cs_iface->output->fatal;
 	info = cs_iface->output->fatal_info;
 
-	if (group)
+	if (group) {
+		drm_warn(&ptdev->base, "CS_FATAL: pid=%d, comm=%s\n",
+			 group->pfile->pid, group->pfile->comm);
+
 		group->fatal_queues |= BIT(cs_id);
+	}
 
 	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {
 		/* If this exception is unrecoverable, queue a reset, and make
@@ -1420,6 +1424,11 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 		spin_unlock(&queue->fence_ctx.lock);
 	}
 
+	if (group) {
+		drm_warn(&ptdev->base, "CS_FAULT: pid=%d, comm=%s\n",
+			 group->pfile->pid, group->pfile->comm);
+	}
+
 	drm_warn(&ptdev->base,
 		 "CSG slot %d CS slot: %d\n"
 		 "CS_FAULT.EXCEPTION_TYPE: 0x%x (%s)\n"
@@ -1636,11 +1645,16 @@ csg_slot_process_progress_timer_event_locked(struct panthor_device *ptdev, u32 c
 
 	lockdep_assert_held(&sched->lock);
 
-	drm_warn(&ptdev->base, "CSG slot %d progress timeout\n", csg_id);
-
 	group = csg_slot->group;
-	if (!drm_WARN_ON(&ptdev->base, !group))
+	if (!drm_WARN_ON(&ptdev->base, !group)) {
+		drm_warn(&ptdev->base,
+			 "CSG_PROGRESS_TIMER_EVENT: pid=%d, comm=%s\n",
+			 group->pfile->pid, group->pfile->comm);
+
 		group->timedout = true;
+	}
+
+	drm_warn(&ptdev->base, "CSG slot %d progress timeout\n", csg_id);
 
 	sched_queue_delayed_work(sched, tick, 0);
 }
@@ -3222,7 +3236,8 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_queue *queue = group->queues[job->queue_idx];
 
-	drm_warn(&ptdev->base, "job timeout\n");
+	drm_warn(&ptdev->base, "job timeout: pid=%d, comm=%s, seqno=%llu\n",
+		 group->pfile->pid, group->pfile->comm, job->done_fence->seqno);
 
 	drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
 
-- 
2.50.0.714.g196bf9f422-goog

