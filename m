Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF93E2727F8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062409; cv=none; b=bgdX5YnlxsPSseR0ZSMjV0HG+AfjnM3RTrWVm2KDsa2fzhqgwXUwTKf+mTtl2o6dkI/Gid4KkutGIPq212BuxnLWfFAEGPYDOD2hrI54kOuYUcs2HScLuXIWFgRi3U5LEEcbZg/UJuVjOAWs49frWqbs1ryfaLwNqo4c0NCjAeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062409; c=relaxed/simple;
	bh=VkMffjC3br4KqWb9F1BjbMrO6wT3d18hmzyLnKHBA0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDxIziVeQk7ezwrOaGLbWOJ1A6f4anZxcm+T5hCPtxaM+r3XoqB2iJBFqPhaP0mq3kOeo+dU6a7R1QUZ3w/PPO8kdI4DwKJET9hJCNzoks4A2nj2xixhAHmaV9YjuhIeREE8akd4VOy0BvtLISlZAGmWU+uyt4yZzN64V+tJNyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QaNjJlNV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QaNjJlNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750062403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjU0N2LMlgapfpld7SchegzzL+cNmGtiDFPxiXYw+T0=;
	b=QaNjJlNVafJW9h2T70vo78u0uN8uZC4Kl+2cDUJHTHVgHuB42+KkctJzgLSlGwd/QruqRO
	SuBjFtAEYG64KaLc/W3kc6I4GglICeJlTjLjZT2W9lyXLIY0T1LRxKa3zWRz0f5BBiTKH9
	VwOcRhqFIRBFSmhHasrQMrUv0eq73sE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-249-N3rQzruDMFy6UQJY9VZqWA-1; Mon,
 16 Jun 2025 04:26:40 -0400
X-MC-Unique: N3rQzruDMFy6UQJY9VZqWA-1
X-Mimecast-MFC-AGG-ID: N3rQzruDMFy6UQJY9VZqWA_1750062399
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39591195608C;
	Mon, 16 Jun 2025 08:26:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.72.112.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A366180045B;
	Mon, 16 Jun 2025 08:26:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 18/19] virtio_ring: factor out split detaching logic
Date: Mon, 16 Jun 2025 16:25:16 +0800
Message-ID: <20250616082518.10411-19-jasowang@redhat.com>
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

This patch factors out the split core detaching logic that could be
reused by in order feature into a dedicated function.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 259380797ec4..27a9459a0555 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -804,8 +804,9 @@ static void detach_indirect_split(struct vring_virtqueue *vq,
 	vq->split.desc_state[head].indir_desc = NULL;
 }
 
-static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
-			     void **ctx)
+static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
+					  unsigned int head,
+					  void **ctx)
 {
 	struct vring_desc_extra *extra;
 	unsigned int i;
@@ -826,8 +827,6 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 	}
 
 	vring_unmap_one_split(vq, &extra[i]);
-	vq->split.desc_extra[i].next = vq->free_head;
-	vq->free_head = head;
 
 	/* Plus final descriptor */
 	vq->vq.num_free++;
@@ -836,6 +835,17 @@ static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
 		detach_indirect_split(vq, head);
 	else if (ctx)
 		*ctx = vq->split.desc_state[head].indir_desc;
+
+	return i;
+}
+
+static void detach_buf_split(struct vring_virtqueue *vq, unsigned int head,
+			     void **ctx)
+{
+	unsigned int i = detach_buf_split_in_order(vq, head, ctx);
+
+	vq->split.desc_extra[i].next = vq->free_head;
+	vq->free_head = head;
 }
 
 static bool virtqueue_poll_split(const struct vring_virtqueue *vq,
-- 
2.34.1

