Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5490262FCD
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827253; cv=none; b=G2LllCP52IHrPTcNYqpAhXZai0c9jHqc4YqzMTgrmgoA7NPXz9tmYBrraHlgwtJf2527VrZb1faviWOJdZHubBwoA0qoySHEcT1/KgAlQnsmPKHsYEHMUMg3DKBL8WZFnbD9HpXtmXiiSDTOAAEv7tAI25Mf8kcmbHB2cc6RSZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827253; c=relaxed/simple;
	bh=YmK9jUVMjyM4XGpiOToRK6zoyZKLYlRbYzUIMY0DNzk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PWNDwerY8XzpE5O9kb1dI6PdTi1k4Y3iQISzkSvcOub2nETmE0ha0HSRzVZg1i/68Kt3k7I9jZmOSh+xsFRB2P/miSYs0vQKYz2vxS8IMN1Af0UOmd+hHFBHw2w5uI+5g4jCGvTblEcsbv5950FK23YNF1mchSvyEIResdi0MTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh2ga3l6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh2ga3l6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30e7bfef27dso4437832a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747827249; x=1748432049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+4xzIECcnulitki27nkBn5Q23UYHsSRhtXD1c9rOoA=;
        b=Yh2ga3l6Lsu2/jgp1CpVJJvczB3VIby0X5ka6PPgL3GO58Wp0k+KV4q/M166bY6DNk
         JwHO8M1LgSAi9atE1y+4G9gwW4ecFKDOiI6kDk95zOMMXZ05iI0q4rSAl4ciwzsdFQDV
         ht2dgVD8XFVSOrJN+ObJ/4fZCD/RlVzD9+hdHBJDxXdTNwLzVOGoTLJb76tDa9xGjMp7
         cNPAbfAO8/rnZttRqW5bKkOlQGkcEM37xtpw0CsvAeUfh5phqrbcBPn+fGBrKsqQMqgd
         iiHOr50k3B5WPPyZ/FXdth8P9HPnEY3OCG0IZhwFAqvu4aKVxbvxWDkmjcUjK7kdN9aZ
         wOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827249; x=1748432049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+4xzIECcnulitki27nkBn5Q23UYHsSRhtXD1c9rOoA=;
        b=KTycKVgYHzj5jZTczWxrj145f3s1szDYNE91M+OHiv8lBtVkh5xVj8mfgbkGWa7cJo
         VhgNtSZq3NGYJ8Xmeq/K6DtAhNSQqeM5K+69TgG4scbz+acT/UD8qkgK7/+XLpGrja/z
         O0lwWB+1aKBuYFPrS7fCj86LLjv5MRi4+/jawpUCvNq5j4N1pcZA75Sf1wZbIIxuuDkN
         jULH5n/NmkRvJq33TuHRYdsf8J+7BoX4yXGIUPYwVE41vmsO8yAP8SaUBjhHBRUbx3vF
         Wq21gPPBOORtqo/w0oQPw2Lwb19UFF4ahpckMjUKrvU1t260qUAYkT8XS7Kr6VTQeIaR
         hHEg==
X-Forwarded-Encrypted: i=1; AJvYcCVUrGRNTQAsoveHWBFg+Vogb7guWGVH4itZrEokrHp7J+4r4Y/1U2aHPaavvPFDIqA7GHdKfqEbcx3bJxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8BSFr+jnwIdz1oNReEhzOMdX31KglsSKDwDURET9+iOEKBMPq
	hDiIOKNYeN1jymDWXsW99/vehpBCryXU/Q/VLg3wMR0OZmyQdDnAH9rPMLuN/jnjndQ=
X-Gm-Gg: ASbGnctCAohK3CgvoKZ9XncwUcjTSG1rJ/ainShbOZIHleSarVIOsM5jNA5rHgnnJTm
	ygxhPXTrjmJk4WlbXdJxG0/faPkQ7G1XjUEADBSxsF72xKl2JOOjTIH8UlyuFLJU5cXiCfPt2rV
	r4N03BxY/aYWcIaNRIYJifhIrhgHZvanuBWXDsQaaGzo2Gs/5Ib2qIWefe3n9wXb8j1kV9k2I2m
	2H0tuEg34VabRdlbkFyuF1E1BkmPq7l2hJLhEVWUJFnFPbJwn7NfDq9Pikqtw6bCGM7dWMKKcWS
	v4IFJVeSbtOn9UYIthltWAjJbkOCBfCJbSDCAMSyW4kjSOqpO+8g
X-Google-Smtp-Source: AGHT+IHEP4cY4L10ow0JzAIxRCHqZRLKI4tTfPyWgXFzxw0d78MaqKPCU0DzphedaKmdHEozMC86Eg==
X-Received: by 2002:a17:90b:55cc:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-30e830ebe05mr35629396a91.11.1747827249017;
        Wed, 21 May 2025 04:34:09 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36385b68sm3437381a91.11.2025.05.21.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 04:34:08 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] virtio-mmio: Remove virtqueue list from mmio device
Date: Wed, 21 May 2025 17:03:46 +0530
Message-Id: <3e56c6f74002987e22f364d883cbad177cd9ad9c.1747827066.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MMIO transport implementation creates a list of virtqueues for a
virtio device, while the same is already available in the struct
virtio_device.

Don't create a duplicate list, and use the other one instead.

While at it, fix the virtio_device_for_each_vq() macro to accept an
argument like "&vm_dev->vdev" (which currently fails to build).

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
I have tested this with a Xen/Qemu based setup to test guest to host virtio-i2c
communication. Works fine, not sure why this code was added in the first place.

 drivers/virtio/virtio_mmio.c | 52 +++---------------------------------
 include/linux/virtio.h       |  2 +-
 2 files changed, 4 insertions(+), 50 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 5d78c2d572ab..b152a1eca05a 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -65,7 +65,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <uapi/linux/virtio_mmio.h>
@@ -88,22 +87,8 @@ struct virtio_mmio_device {
 
 	void __iomem *base;
 	unsigned long version;
-
-	/* a list of queues so we can dispatch IRQs */
-	spinlock_t lock;
-	struct list_head virtqueues;
-};
-
-struct virtio_mmio_vq_info {
-	/* the actual virtqueue */
-	struct virtqueue *vq;
-
-	/* the list node for the virtqueues list */
-	struct list_head node;
 };
 
-
-
 /* Configuration interface */
 
 static u64 vm_get_features(struct virtio_device *vdev)
@@ -300,9 +285,8 @@ static bool vm_notify_with_data(struct virtqueue *vq)
 static irqreturn_t vm_interrupt(int irq, void *opaque)
 {
 	struct virtio_mmio_device *vm_dev = opaque;
-	struct virtio_mmio_vq_info *info;
+	struct virtqueue *vq;
 	unsigned long status;
-	unsigned long flags;
 	irqreturn_t ret = IRQ_NONE;
 
 	/* Read and acknowledge interrupts */
@@ -315,10 +299,8 @@ static irqreturn_t vm_interrupt(int irq, void *opaque)
 	}
 
 	if (likely(status & VIRTIO_MMIO_INT_VRING)) {
-		spin_lock_irqsave(&vm_dev->lock, flags);
-		list_for_each_entry(info, &vm_dev->virtqueues, node)
-			ret |= vring_interrupt(irq, info->vq);
-		spin_unlock_irqrestore(&vm_dev->lock, flags);
+		virtio_device_for_each_vq(&vm_dev->vdev, vq)
+			ret |= vring_interrupt(irq, vq);
 	}
 
 	return ret;
@@ -329,14 +311,8 @@ static irqreturn_t vm_interrupt(int irq, void *opaque)
 static void vm_del_vq(struct virtqueue *vq)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vq->vdev);
-	struct virtio_mmio_vq_info *info = vq->priv;
-	unsigned long flags;
 	unsigned int index = vq->index;
 
-	spin_lock_irqsave(&vm_dev->lock, flags);
-	list_del(&info->node);
-	spin_unlock_irqrestore(&vm_dev->lock, flags);
-
 	/* Select and deactivate the queue */
 	writel(index, vm_dev->base + VIRTIO_MMIO_QUEUE_SEL);
 	if (vm_dev->version == 1) {
@@ -347,8 +323,6 @@ static void vm_del_vq(struct virtqueue *vq)
 	}
 
 	vring_del_virtqueue(vq);
-
-	kfree(info);
 }
 
 static void vm_del_vqs(struct virtio_device *vdev)
@@ -375,9 +349,7 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
 	bool (*notify)(struct virtqueue *vq);
-	struct virtio_mmio_vq_info *info;
 	struct virtqueue *vq;
-	unsigned long flags;
 	unsigned int num;
 	int err;
 
@@ -399,13 +371,6 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 		goto error_available;
 	}
 
-	/* Allocate and fill out our active queue description */
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
-	if (!info) {
-		err = -ENOMEM;
-		goto error_kmalloc;
-	}
-
 	num = readl(vm_dev->base + VIRTIO_MMIO_QUEUE_NUM_MAX);
 	if (num == 0) {
 		err = -ENOENT;
@@ -463,13 +428,6 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 		writel(1, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
 	}
 
-	vq->priv = info;
-	info->vq = vq;
-
-	spin_lock_irqsave(&vm_dev->lock, flags);
-	list_add(&info->node, &vm_dev->virtqueues);
-	spin_unlock_irqrestore(&vm_dev->lock, flags);
-
 	return vq;
 
 error_bad_pfn:
@@ -481,8 +439,6 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 		writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
 		WARN_ON(readl(vm_dev->base + VIRTIO_MMIO_QUEUE_READY));
 	}
-	kfree(info);
-error_kmalloc:
 error_available:
 	return ERR_PTR(err);
 }
@@ -627,8 +583,6 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 	vm_dev->vdev.dev.release = virtio_mmio_release_dev;
 	vm_dev->vdev.config = &virtio_mmio_config_ops;
 	vm_dev->pdev = pdev;
-	INIT_LIST_HEAD(&vm_dev->virtqueues);
-	spin_lock_init(&vm_dev->lock);
 
 	vm_dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vm_dev->base)) {
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 64cb4b04be7a..8b745ce0cf5f 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -196,7 +196,7 @@ int virtio_device_reset_done(struct virtio_device *dev);
 size_t virtio_max_dma_size(const struct virtio_device *vdev);
 
 #define virtio_device_for_each_vq(vdev, vq) \
-	list_for_each_entry(vq, &vdev->vqs, list)
+	list_for_each_entry(vq, &(vdev)->vqs, list)
 
 /**
  * struct virtio_driver - operations for a virtio I/O driver
-- 
2.31.1.272.g89b43f80a514

