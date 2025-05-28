Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C14244663
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748414582; cv=none; b=r1HheNMq/05NCxduNEKb8M7xbzay3lIFhEzBMlumg3FG83SvcZ6NSvUKa5uO+ZnLHSqeEITxkLCd+Infz+Fftqx4YKfHnmsXOpTPJ/S123Z7rRhmIaT6BZme8QUuqEB0d2uIdCqcgQt6d0vLLaRoc1IhP2y/8x2P0eVzVdgEj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748414582; c=relaxed/simple;
	bh=iZw+MmZaa8hyOzdvW0QmRSDT0mhN7jh0ZqFOw9wsVaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUd2YSKXBJGpJi9+9AYZcTBlew06xsS6rUugWhPKi8pISpb0BFa5unElPhnPrwQfCm/u8X47/CDkA1PT/rKp1n8txYZk9QpPproFny/OUADa0ql6C/MJ0iH1vKWyIDfkagO3taiOcwYgiwvufXIpJrzqRi8Dz22azasAxSSl8IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kt0+Sn0w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kt0+Sn0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748414579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqV7iOjG5sgRx5yUdmoqilCTFjCqtA+JL8NmepveSGo=;
	b=Kt0+Sn0wDwc9pC1mT3HvTJ6a0isR8oDrYK+m0rwQtwdHdb2NmCwOXx89Z9LHp5T5uq8nSl
	FqbK4WWMq6oWux0ABs1U0PiVqF3JS5Y6Gbkh8UDtz8A93bFLv44hcMTCUEXn+5wLc64gI4
	iLppSZ3g3ZkAK5x574xyALTi3HZ8fTA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-Hh-rU475NjWTsGxQATz6VA-1; Wed,
 28 May 2025 02:42:55 -0400
X-MC-Unique: Hh-rU475NjWTsGxQATz6VA-1
X-Mimecast-MFC-AGG-ID: Hh-rU475NjWTsGxQATz6VA_1748414574
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8CA591956096;
	Wed, 28 May 2025 06:42:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.72.112.248])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 09F641955F1B;
	Wed, 28 May 2025 06:42:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 03/19] virtio_ring: unify logic of virtqueue_poll() and more_used()
Date: Wed, 28 May 2025 14:42:18 +0800
Message-ID: <20250528064234.12228-4-jasowang@redhat.com>
In-Reply-To: <20250528064234.12228-1-jasowang@redhat.com>
References: <20250528064234.12228-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

This patch unifies the logic of virtqueue_poll() and more_used() for
better code reusing and ease the future in order implementation.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 48 +++++++++++++++---------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 9bc6c30458b5..633379b2dc42 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -802,12 +802,18 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 	}
 }
 
-static bool more_used_split(const struct vring_virtqueue *vq)
+static bool virtqueue_poll_split(const struct vring_virtqueue *vq,
+				 unsigned int last_used_idx)
 {
-	return vq->last_used_idx != virtio16_to_cpu(vq->vq.vdev,
+	return (u16)last_used_idx != virtio16_to_cpu(vq->vq.vdev,
 			vq->split.vring.used->idx);
 }
 
+static bool more_used_split(const struct vring_virtqueue *vq)
+{
+	return virtqueue_poll_split(vq, vq->last_used_idx);
+}
+
 static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
 					 unsigned int *len,
 					 void **ctx)
@@ -915,13 +921,6 @@ static unsigned int virtqueue_enable_cb_prepare_split(struct virtqueue *_vq)
 	return last_used_idx;
 }
 
-static bool virtqueue_poll_split(struct vring_virtqueue *vq,
-				 unsigned int last_used_idx)
-{
-	return (u16)last_used_idx != virtio16_to_cpu(vq->vq.vdev,
-			vq->split.vring.used->idx);
-}
-
 static bool virtqueue_enable_cb_delayed_split(struct virtqueue *_vq)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
@@ -1711,16 +1710,20 @@ static inline bool is_used_desc_packed(const struct vring_virtqueue *vq,
 	return avail == used && used == used_wrap_counter;
 }
 
-static bool more_used_packed(const struct vring_virtqueue *vq)
+static bool virtqueue_poll_packed(const struct vring_virtqueue *vq, u16 off_wrap)
 {
-	u16 last_used;
-	u16 last_used_idx;
-	bool used_wrap_counter;
+	bool wrap_counter;
+	u16 used_idx;
 
-	last_used_idx = READ_ONCE(vq->last_used_idx);
-	last_used = packed_last_used(last_used_idx);
-	used_wrap_counter = packed_used_wrap_counter(last_used_idx);
-	return is_used_desc_packed(vq, last_used, used_wrap_counter);
+	wrap_counter = off_wrap >> VRING_PACKED_EVENT_F_WRAP_CTR;
+	used_idx = off_wrap & ~(1 << VRING_PACKED_EVENT_F_WRAP_CTR);
+
+	return is_used_desc_packed(vq, used_idx, wrap_counter);
+}
+
+static bool more_used_packed(const struct vring_virtqueue *vq)
+{
+	return virtqueue_poll_packed(vq, READ_ONCE(vq->last_used_idx));
 }
 
 static void *virtqueue_get_buf_ctx_packed(struct virtqueue *_vq,
@@ -1844,17 +1847,6 @@ static unsigned int virtqueue_enable_cb_prepare_packed(struct virtqueue *_vq)
 	return vq->last_used_idx;
 }
 
-static bool virtqueue_poll_packed(struct vring_virtqueue *vq, u16 off_wrap)
-{
-	bool wrap_counter;
-	u16 used_idx;
-
-	wrap_counter = off_wrap >> VRING_PACKED_EVENT_F_WRAP_CTR;
-	used_idx = off_wrap & ~(1 << VRING_PACKED_EVENT_F_WRAP_CTR);
-
-	return is_used_desc_packed(vq, used_idx, wrap_counter);
-}
-
 static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
-- 
2.31.1

