Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF91F5425
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435604; cv=none; b=uweh0SdX7wvTyoV99huHBz/VCAZqCi4KNB1zAfTXiJWTAZxgvCZNqL+CUqPHmW3nGlNwS7vXum4VagNfMxW+jDk7ASgH67L9aJVPS9KCTY2s+/f6WYwQH4DQvv47P6S9U+2hFR0dt5DbFtojJF//vOACvTv0n9uGCGovhUo8XHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435604; c=relaxed/simple;
	bh=4ujhfnsD9gR0dVbtPkG6+9ZOl4u1TOz+cGHcmkSuqBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWJ/ZLZ42wj2p1W5mJn7QWhyQAIqg7iQlJ2ouTIWYjsZ3EUn19W1noxzKRXkYcvX2+3jN1knXXEPSogeioq6/daQacUUgBlUiX7A5rNhupX4rxefTIoMpIWM+SNSBt9DAAYnZP6GCOuCBtkzdAvr31HiTP8LlHoygrOUDlcT8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nD1SFOAP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nD1SFOAP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so34889775e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435601; x=1747040401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S92e1vh4VqkP6Isn8EhCS9MZeN0/LLF2cWcJYmEVWj4=;
        b=nD1SFOAP9tjgY55Ka22meOpH8vyPOHms+rdbWJ7SnGQJ+jENQ9+WstFSY7xLxQIab6
         hEBT0nVpxkLXSZ9CCdVS4mIlg5bASBrzeGenyhAkrT6/hjjbS1j+/kEwmJI/h8u+I8AS
         BtuiaoeVnsyX69/T/m12Bnh68rdopDCOm3vv6WSTSxEk69TC0D01uMvzHscC8udqY/Za
         dq7iAwdarQ7cOZOnG+ERAbFWzYECvEhz/ft4IR3kyaHGrYJohuQJbBW3e44cbkr18JRS
         exnum6cCNyVuNlR4tEcFVaZJKZhmrLVhHJ3GyJDzWW34MHDS5VITF2AcN+yFHwdecA/3
         dPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435601; x=1747040401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S92e1vh4VqkP6Isn8EhCS9MZeN0/LLF2cWcJYmEVWj4=;
        b=ue3gnZzQcD2McJHuVKbEgdt6lUC36YEmK5jpPrX6eVaSBWwDTQoSYRcFtuNDDwgDjz
         lLVbIhIldiFBgVt8tpxqUVNYBw4BO2TkeU6S4KRoehTYYIrIMkE6o6dMy5/J1bB9jL4G
         YNSohSzEfCzT5mrIWqSakkaEe8M/S69l0nGeAX2gki5SR5MiDEDc4cG9n+VUI+4mzVmz
         8P+DNw72fR6cuk0LvrK55SceLHmTxAHYjzfXrbVmngBNKv5/MNAoXus1qsb1dEc6bwWa
         6jtEQ45U85bo8tVI0Kw2OBzit6z5a5OkCMW4UAtkGgGPWjzbCb8JgzOdPTjIeAFGQ//p
         bHDA==
X-Forwarded-Encrypted: i=1; AJvYcCWdqS3dWxM93vMFJsEFEKxfAZizfAnfNtzvyoSYKYUxlUlCCO1Wul8D0li/8stELIfaovt7xkppwT75FzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxOz7xXOVlIQvB5Lb1UoIyihEi2UXxfbO07GOabvVLK4scce9/
	oze8k+N0EYEpAvFO0JiHnnMRlWIdFavRP/620LcX2ifRS0oWOIflabqVFjzKb1c=
X-Gm-Gg: ASbGncuhRbTCef1LRUsEzdu1Y+DkVjBf/tZjZKWRmgEF4Umctsq1hCO86Hb0zu+mnlL
	AEtgNB5WsOUCt+041GPrZgfieEqOCNsfrkp0LzIrooP4KbUgjY+BDhTIZf8obORgqGyWr5YwRMh
	+HQzIc6/i/jp02UAUdzdGVpP5CMMSYcn44sabn0vrRjNNW2E6Fp03xInxJFFoZ3t7OHKnAeWVHU
	amce0WiYtsYr3g7XXB3b3Dll7/3UNyKGOV32jzKDqXdjpFZUy6If4zNY6VQkmF6qmdX+F5DJnFQ
	F5SerjXQWOPDN6bE+4o6PEp4Z4GKxH/LFtKztGNAthnD0J5RnyGGuFDGU47gCl5OowxsyZbYoFq
	DEuuxFJ1Vj1yni8U=
X-Google-Smtp-Source: AGHT+IHjn0WyAvaUOF4DlLpk6vtF8Nr+Hc5ikZjH0bnD+F7TX2WdfOdAMYnVE4VqixoQkEYwPJFamw==
X-Received: by 2002:a05:600c:37ce:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-441c48d16ddmr50750345e9.18.1746435600672;
        Mon, 05 May 2025 02:00:00 -0700 (PDT)
Received: from [127.0.1.1] (adsl-186.37.6.163.tellas.gr. [37.6.163.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28045sm170432475e9.35.2025.05.05.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:00:00 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 05 May 2025 11:59:15 +0300
Subject: [PATCH 2/3] virtgpu: add virtio_gpu_fence_cleanup()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-virtgpu-queue-cleanup-v1-v1-2-810923da2b1e@linaro.org>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2670;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=4ujhfnsD9gR0dVbtPkG6+9ZOl4u1TOz+cGHcmkSuqBg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9HSDRMSkxTOFIxYU8xdmI3Z2kyZkpSYUYwVWc5CnQzaGcwdkg1WUw0UkJzSXFU
 dnVKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUJoK0N3QUt
 DUkIzS2Nkd2YzNEowUGhtRC85S0h6ZFVTRGdlZHdreWhPWHdiNWp5R0ZiY1NSRDNGczMxUHh2SA
 owMzBDK3ptczh3aFpRUWkyWjhIckp1NDZzb1pDcUlSREVkemRkWjBuUzZmbE4wVUlpSE5LTDdSV
 TFZcTBVT1R5CmpTMzdZbkx6NmlWQjlydFQxcUdnd05sOXM4bGZCdWxxNEFNUW5hd3lxRVhyd0ti
 UGw1SjcwbDBRMnVxSHNzcTIKTktjYVRQdThDUncrNkUwS3d4Wlh2Snd5dVBsRmo5YlRvZStJZXh
 BVUFSb0tteWtDNmtMUXpyYkMzVnNUc2pTaApzbUg0V093ZDUrMWkra2dYS0VKc3VvV25LZGFEcX
 FqL2dKSTBSUGtKc3FvazBoclF1S3BRSFFsaTBYWThpUStwCitoaElrQ0dvOERZSjVZR2V3bWxQR
 EMxbGtvR0h1K1ZUY0RSTW9iZk9mSVBrcWt0TjNmOTQyMEFHb0VYV01yYnEKb2JkUzd1VU52WW1B
 YUVnTzJaMVhZOUtZWkkrUW9TTzB5b3NrcWgyUjdOVkhrbG9iZ1FGWFBKYkpDejJ2U3FwaApXZkF
 DVTIvekxmencrdTNzaWNyaEQvc3dYVWErLzIxV2tzMnhWbWU2ZnJEREhXbzdZMXNWNmNFQk5uaz
 ArQXpyCkxkOHp4Nm14cFVaLzk0QlJWeG5waDJGbWhJZTUzVFpoS213bVlrdlJpcFRuUytuQ3R2T
 DkvOXdTZENtcFBIMjIKNy9HMjN4cVRNS0s4a2pwZncvNE13ZGhNSjcwVHl5UVh6UG94VERxQzAv
 ejIxN2lDQW9mZkdYUVh3MlBiWVhQbAorNncvY2MyZTk0RS9VbVlhUnVYUEpEejN4b1lHeUxSMyt
 kNVFjbi84N3d1dXdpVWxTalI4OTQ4TlFJMTNaMHk4CitTVEluQT09Cj1SY1FOCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

When virtio_gpu_remove() is called, there might be in-flight command
objects in the virtqueues that the VIRTIO device hasn't processed. These
commands might use fences, which end up being leaked, as reported by
/sys/kernel/debug/kmemleak.

This commit adds a cleanup function that lowers the reference count of
all in-flight fences, resulting in their de-allocation.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b3d367be6f204dbc98bf1c6e5c43a37ac8c0d8b3..c94b5edb2aec42fe5cd6416e243cf40e4e2b060f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -465,6 +465,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_fence *fence);
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
 				    u64 fence_id);
+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vdev);
 
 /* virtgpu_object.c */
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 44c1d8ef3c4d07881e2c4c92cc67f6aba7a5df4f..3e536d190c0464f4db8955605bbf0aa4aa3612bd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -157,3 +157,15 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 	}
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
 }
+
+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
+	struct virtio_gpu_fence *curr, *tmp;
+
+	list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
+		dma_fence_signal_locked(&curr->f);
+		list_del(&curr->node);
+		dma_fence_put(&curr->f);
+	}
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index da70d9248072b64786a5d48b71bccaa80b8aae8f..7b3c4d314f8eee692e2842a7056d6dc64936fc2f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -286,6 +286,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->cursorq.dequeue_work);
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
+	virtio_gpu_fence_cleanup(vgdev);
 	virtio_gpu_queue_cleanup(vgdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 }

-- 
2.47.2

