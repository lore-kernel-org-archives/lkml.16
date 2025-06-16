Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6D26E70B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062380; cv=none; b=OFXNKFpwJzC/9SDCQYvHPXk9HLYef1YNQbvh1VbUsxlt/k3kSMe9U0UeY0XOsjvQdYrIpk7q32StCDfY3ssPs43T7ycED1Nn2UIDaOjFCg/iMoK1quNSfMdhlGuID2BS2QvgM/4WFc7zVCj4N2m3IuaVUl7sWifZyuhcck7Bi1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062380; c=relaxed/simple;
	bh=pQ/qBfAP/YbFsSYZtTQm4Ikle06B8+fuTgKHV4RDXvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYFloGO5lDHZfxqaDILk+ad9jDVW8USvy+bP60Z0sk3kK1KF5j+Df1EuoW7XYAIT7+/Q21CEcasbDFwwjnaMKn5eN0NcN2yyyW2lnxZmTclwLBS/zhaHD0qr19HK6+iTEL8Xq1OHP4s6ju1Q5ff4hqu4N9r9CKRG+7FqY5wLjZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhaD8uxE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhaD8uxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750062375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvMUw2OR66zDeWl5WPW7OL4jldXV0p/bHVpq4+2s510=;
	b=dhaD8uxEwbOSkcXKTh+4aomRjSH1UanKVhkGy4yfTXuJy+eehyvkgWLrUB3P0nc2XCbJ+Y
	r7apbqJGDb7Z6+JFqjVtJCCI6jJCTgrLSCZ+muUHXyY0dHbhYjm8zK3WSfCAaLHn1Kk//3
	WQlIJ3nSABxYYO1wQjg5czAZQMguLUs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-gayUxoA2M7WPYk809Sj3Hg-1; Mon,
 16 Jun 2025 04:26:07 -0400
X-MC-Unique: gayUxoA2M7WPYk809Sj3Hg-1
X-Mimecast-MFC-AGG-ID: gayUxoA2M7WPYk809Sj3Hg_1750062366
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23CEC180ABFF;
	Mon, 16 Jun 2025 08:26:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.72.112.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF3E418002B9;
	Mon, 16 Jun 2025 08:26:02 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 10/19] virtio_ring: switch to use vring_virtqueue for disable_cb variants
Date: Mon, 16 Jun 2025 16:25:08 +0800
Message-ID: <20250616082518.10411-11-jasowang@redhat.com>
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
 drivers/virtio/virtio_ring.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a85db8c8cb24..4af29a6e15e8 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -869,10 +869,8 @@ static void *virtqueue_get_buf_ctx_split(struct vring_virtqueue *vq,
 	return ret;
 }
 
-static void virtqueue_disable_cb_split(struct virtqueue *_vq)
+static void virtqueue_disable_cb_split(struct vring_virtqueue *vq)
 {
-	struct vring_virtqueue *vq = to_vvq(_vq);
-
 	if (!(vq->split.avail_flags_shadow & VRING_AVAIL_F_NO_INTERRUPT)) {
 		vq->split.avail_flags_shadow |= VRING_AVAIL_F_NO_INTERRUPT;
 
@@ -888,7 +886,7 @@ static void virtqueue_disable_cb_split(struct virtqueue *_vq)
 			vring_used_event(&vq->split.vring) = 0x0;
 		else
 			vq->split.vring.avail->flags =
-				cpu_to_virtio16(_vq->vdev,
+				cpu_to_virtio16(vq->vq.vdev,
 						vq->split.avail_flags_shadow);
 	}
 }
@@ -1786,10 +1784,8 @@ static void *virtqueue_get_buf_ctx_packed(struct vring_virtqueue *vq,
 	return ret;
 }
 
-static void virtqueue_disable_cb_packed(struct virtqueue *_vq)
+static void virtqueue_disable_cb_packed(struct vring_virtqueue *vq)
 {
-	struct vring_virtqueue *vq = to_vvq(_vq);
-
 	if (vq->packed.event_flags_shadow != VRING_PACKED_EVENT_FLAG_DISABLE) {
 		vq->packed.event_flags_shadow = VRING_PACKED_EVENT_FLAG_DISABLE;
 
@@ -2538,9 +2534,9 @@ void virtqueue_disable_cb(struct virtqueue *_vq)
 	struct vring_virtqueue *vq = to_vvq(_vq);
 
 	if (vq->packed_ring)
-		virtqueue_disable_cb_packed(_vq);
+		virtqueue_disable_cb_packed(vq);
 	else
-		virtqueue_disable_cb_split(_vq);
+		virtqueue_disable_cb_split(vq);
 }
 EXPORT_SYMBOL_GPL(virtqueue_disable_cb);
 
-- 
2.34.1

