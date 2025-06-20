Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50336245032
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750463474; cv=none; b=e6vj+dqG7ZcqW0jMvlSbrR5lFLYAbw5/0avIh+2UuKI7wJDNv+lcDkVBDjaY7uiFEY1mEXG4cPQCecYknubFKgog9pJP2dGa24y4ojm5zKtQNtjcW5qJnw2iG8q41A3owcb5N3nK7bJhIDFMihENcdv7GZHZA5TtAeQ541jwMMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750463474; c=relaxed/simple;
	bh=Cj4zKs7DnKWZkJpMc8mYNlJXa1wT5pxYJ23w3j6yLXQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyKFDIeMl5pFie0l5xnTJVfI8W+cUJ5vkXLMyzKMjDyp87bBRBKAucGgm71S1i6VRikxJxiX8w+N72PXvXwWtmpB4cnEiWqr0O3LHYR8dbemHvZ0QA3CM36ySXthJe3Jz9QV7KiT3W9wDW26RSoIRUCAlMDyOgwMy7/D6lnUfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga46vXhP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga46vXhP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso1660195a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750463472; x=1751068272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJggbDFgahoVLzRwsUM10ANDxacsIIZurnN1KGmwE8c=;
        b=Ga46vXhPSSh5FRbL7bpkzoIhnMQ0/XFgXrDOZFDo64P0ieniLi19haTYLgwnbf9Rsh
         U3edu2Zp4H2KNHssZXbbLeN02Zy6RATT6f4fKa7V1q/tGiqxLYmFslUEwVrwDDDANCgC
         YeXceUNCu9h/YlHdjLEpPRf4guolrLEAkBcG0s5659AdNOK0zgMXlzoLgRQgc7f9OdcH
         kh2TEvgq4JqeN421ayiRzhuDdgqxykLuBYu23jdzj6t9leqzQg22Jtbqe0vqefWC+l0V
         QEDh6iET4Ak/Y7T/Qb5QgR09C9df7m3VfivtBhrOmUz4A/Gfk3+Dl7VbUSK4kgIDc4/1
         WZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750463472; x=1751068272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJggbDFgahoVLzRwsUM10ANDxacsIIZurnN1KGmwE8c=;
        b=oXe8ufRgb8wHo5fJ2cV/0bYx/3RW0/ajTXOLlRFBc/KxUo9AbNWJTpG7Qvta8xcSmK
         YdDJZQdJ9NLBABceVbIIjwxH0Lt98NYOzP78oeyVs5Pp5HT4z47wuBil9T/NmpttoGXj
         v5yaaLJngm3+yapBl9VpjHwLv+ApKB7RTTVQZCJgoHogAc0AQPGlYazLVhEMS0gJexOn
         W3YVpE76f2iN0Jvzj8/wMmHl8gaJX2/VioNBKqIxponj45K2XS04nT5UFkU0oEGNujuk
         E0lO5PMiAY4GuSyDTt9vdOZD2M8ztzjzt/UB8P7TudZ+0xWrqA5AOEcIcM4JrV2LS/Uh
         oSWw==
X-Forwarded-Encrypted: i=1; AJvYcCXlwGf4dYABuuWOHAzPKGqsZph8sMiONyf8EdnMmhaf6W11Z2HqLvEgKMA4LPdEai9VSd5cmyuQo+WDLRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYIUdyQRsvSDCF812NjPhiFVb+sstgN+/fAsQTmSt/2omx2W5E
	ofodzGM6umA1WEXck469nzqqhJabIhBvmO5yQ51b2D9xHtpJAkV/S0HA
X-Gm-Gg: ASbGncu+Zlb1fDoksQB/zknYriY7UtJyYdBvdspBB9nPtw4/aMBnyLF9AgVXxP5QhVE
	81z7nTM9bfhZ/vi13lPhwYQ/ekcNZgTGZNj7JOXvrsA6XOl/arJUWLdId3k4HSVdfe7n5uM0ZjB
	iaYCEHpVlE5k2RzHP5GPQlbFmo/RIE9nXv/k+otIB+6LS8tzFCaNCF6mC8occx0AGHClJvlBpLk
	rhe4/RIoyuRC7EmiGvBMyjc5XzjOQcNrz/+4cGcU5JYa/CYOE76/MoA9dcuJlCnbGl9vPOaxabJ
	lFuGchLQ8yHUl6uUr1XQlrOYaSt1FQTFEvQ27+tzBhOGzT2d75Dsoh1NJX/7l5NVy+84NZtGC0T
	7TMxFUfSxpBLABDn3ngEV
X-Google-Smtp-Source: AGHT+IE7Gf80YdauKTLlHJx/1691HQ/ZMJ5S0nDnn5dolZyGBOPtHMDrQVVP52dMvXnCzNmlqpoDlQ==
X-Received: by 2002:a17:90b:1f83:b0:310:8d4a:a246 with SMTP id 98e67ed59e1d1-3159d62bf7amr6819332a91.1.1750463472562;
        Fri, 20 Jun 2025 16:51:12 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com. [34.125.18.212])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8608e24sm27699585ad.127.2025.06.20.16.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:51:12 -0700 (PDT)
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
Subject: [PATCH 3/4] panthor: save task pid and comm in panthor_file
Date: Fri, 20 Jun 2025 16:50:52 -0700
Message-ID: <20250620235053.164614-4-olvaffe@gmail.com>
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

We would like to report them on gpu errors.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 6 ++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 75ae6fd3a5128..8c31c1d4296b6 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -257,6 +257,12 @@ struct panthor_file {
 	/** @stats: cycle and timestamp measures for job execution. */
 	struct panthor_gpu_usage stats;
 
+	/** @pid: pid of the task created this file */
+	pid_t pid;
+
+	/** @comm: comm of the task created this file */
+	char *comm;
+
 	/** @refcount: ref count of this file */
 	struct kref refcount;
 };
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index aea9609684b77..b9d86b86591db 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1400,6 +1400,7 @@ void panthor_file_release(struct kref *kref)
 
 	WARN_ON(pfile->vms || pfile->groups);
 
+	kfree(pfile->comm);
 	kfree(pfile);
 }
 
@@ -1408,6 +1409,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 	struct panthor_file *pfile;
+	struct task_struct *task;
 	int ret;
 
 	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
@@ -1436,6 +1438,13 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	if (ret)
 		goto err_destroy_vm_pool;
 
+	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
+	if (task) {
+		pfile->pid = task->pid;
+		pfile->comm = kstrdup(task->comm, GFP_KERNEL);
+		put_task_struct(task);
+	}
+
 	kref_init(&pfile->refcount);
 
 	file->driver_priv = pfile;
-- 
2.50.0.714.g196bf9f422-goog

