Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE312701A1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062368; cv=none; b=qfks20IbkDDfKRbDTUl9sVVUSp39ZZQApeqEnMmJjxMlhj5qKyUJ6PBFNRhy0USwr7Z5FZ5ccUwjcK3jWetOxiGNu3kCFdiYyXTSPnAsUXLmYygatubcanXVbNicSh7WLinOmJ8l7UPJ+e2RpalJMZWDcKsdqw+bDZnCBLRa8L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062368; c=relaxed/simple;
	bh=nIFwCL3LvvMf1hnbugVDczRpMa79tK9rhUWMUPxuzCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hhrp2ZhZpKME9W3wY4zRUzm/x0QxQI6Y8sOznGbtZNcVuGJX7sz1X7uowEL+y32qDkmnmDnNiZwgwrvKJQh+Fb7pe7FRS04or0oYwhnGA8Ab7nbJEcddQ+J+0qamsYZQxhc1YWmG2IyfvZk81K3hzedi/5dt0Acqr+EVg4TTlHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tf1acYZl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tf1acYZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750062365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxybsHFSbwGIVra5UuwiFVDVlrGXPEIskHhrIt4Gepc=;
	b=Tf1acYZlhjs8gHqAevb+cl/jXNK/GNRyj2YY3TlVvqgPLvJTN5Zy4t52GJlQoHlU15U8ah
	50MUNV3dVIi5SB9BYyTyZrr8WsTCJ8K2+KO37AT1dpNPQletkvBY+XC5mcUOCUBhuZ1SYK
	tqqGLJmaK8So7xyxLVFbXkoxDoqPCd4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-OiTGQ_V9O5KXnL9I-ppH4g-1; Mon,
 16 Jun 2025 04:26:03 -0400
X-MC-Unique: OiTGQ_V9O5KXnL9I-ppH4g-1
X-Mimecast-MFC-AGG-ID: OiTGQ_V9O5KXnL9I-ppH4g_1750062362
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 172B81809C80;
	Mon, 16 Jun 2025 08:26:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.72.112.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 025C218003FC;
	Mon, 16 Jun 2025 08:25:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 09/19] virtio_ring: use vring_virtqueue for enable_cb_delayed variants
Date: Mon, 16 Jun 2025 16:25:07 +0800
Message-ID: <20250616082518.10411-10-jasowang@redhat.com>
In-Reply-To: <20250616082518.10411-1-jasowang@redhat.com>
References: <20250616082518.10411-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Those variants are used internally so let's switch to use
vring_virtqueue as parameter to be consistent with other internal
virtqueue helpers.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 8c18f3edda00..a85db8c8cb24 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -917,9 +917,8 @@ static unsigned int virtqueue_enable_cb_prepare_split(struct vring_virtqueue *vq
 	return last_used_idx;
 }
 
-static bool virtqueue_enable_cb_delayed_split(struct virtqueue *_vq)
+static bool virtqueue_enable_cb_delayed_split(struct vring_virtqueue *vq)
 {
-	struct vring_virtqueue *vq = to_vvq(_vq);
 	u16 bufs;
 
 	START_USE(vq);
@@ -933,7 +932,7 @@ static bool virtqueue_enable_cb_delayed_split(struct virtqueue *_vq)
 		vq->split.avail_flags_shadow &= ~VRING_AVAIL_F_NO_INTERRUPT;
 		if (!vq->event)
 			vq->split.vring.avail->flags =
-				cpu_to_virtio16(_vq->vdev,
+				cpu_to_virtio16(vq->vq.vdev,
 						vq->split.avail_flags_shadow);
 	}
 	/* TODO: tune this threshold */
@@ -941,9 +940,9 @@ static bool virtqueue_enable_cb_delayed_split(struct virtqueue *_vq)
 
 	virtio_store_mb(vq->weak_barriers,
 			&vring_used_event(&vq->split.vring),
-			cpu_to_virtio16(_vq->vdev, vq->last_used_idx + bufs));
+			cpu_to_virtio16(vq->vq.vdev, vq->last_used_idx + bufs));
 
-	if (unlikely((u16)(virtio16_to_cpu(_vq->vdev, vq->split.vring.used->idx)
+	if (unlikely((u16)(virtio16_to_cpu(vq->vq.vdev, vq->split.vring.used->idx)
 					- vq->last_used_idx) > bufs)) {
 		END_USE(vq);
 		return false;
@@ -1837,9 +1836,8 @@ static unsigned int virtqueue_enable_cb_prepare_packed(struct vring_virtqueue *v
 	return vq->last_used_idx;
 }
 
-static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
+static bool virtqueue_enable_cb_delayed_packed(struct vring_virtqueue *vq)
 {
-	struct vring_virtqueue *vq = to_vvq(_vq);
 	u16 used_idx, wrap_counter, last_used_idx;
 	u16 bufs;
 
@@ -2631,8 +2629,8 @@ bool virtqueue_enable_cb_delayed(struct virtqueue *_vq)
 	if (vq->event_triggered)
 		data_race(vq->event_triggered = false);
 
-	return vq->packed_ring ? virtqueue_enable_cb_delayed_packed(_vq) :
-				 virtqueue_enable_cb_delayed_split(_vq);
+	return vq->packed_ring ? virtqueue_enable_cb_delayed_packed(vq) :
+				 virtqueue_enable_cb_delayed_split(vq);
 }
 EXPORT_SYMBOL_GPL(virtqueue_enable_cb_delayed);
 
-- 
2.34.1

