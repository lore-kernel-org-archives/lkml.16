Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D234E26E143
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062400; cv=none; b=qjuSpEhnuIjLuWrTI1DrxX/hzoitCni6J+daPTI1yeYdnBLOEthf2kS3a9BjqHnsOmxys9x9zdzqZAwai5/jhCjWWRdv1mpMpY0c2FzYdz0PqIjYXRDOWyf7v0hyx+/sqcatT95jRTpNhdkRfYF+a06LO4h1BZ3HL4bRd6aR/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062400; c=relaxed/simple;
	bh=6qM3MRfri/1e0rmpMhrib0LrcCkVIs1t7ATyLsuudVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjWOdShJSd4557pS6hDNnvEZHN5+LVr+7/oAJDpiFKfoBX88KZ3gv3Yin8eHPGRcTYlp6nVDznJlJxCfmk8sJc8o8k60DcRPTfk9v4K4tka0SVRZFruXKCy+xuTyfvuRAXi7dLPtaVsvK/o3WdCQWehiaLHCib9o/TJZF4ByouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BNdG+Sew; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BNdG+Sew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750062396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvwJpvAV0V8j8IC4lojknQV0rvDLo94+r3JtkXAzhRg=;
	b=BNdG+SewRQ9yFMYuw8B2o0vtejpiYMq6x20ZXIEMzjmWuPhsBiYur36T3dNvG1f+r1l7YT
	du9zKE8lzQSYLndjlvCu74vZ3Bf87Vw+lPw9bE10klQXFE5SB5GHutuwC4Us7g/pyMcBA2
	3TuwQDqEM6cIz77X+Fi9kdnD1qV1r8E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-bSqgSvcfP5SvZuX7nUToCg-1; Mon,
 16 Jun 2025 04:26:31 -0400
X-MC-Unique: bSqgSvcfP5SvZuX7nUToCg-1
X-Mimecast-MFC-AGG-ID: bSqgSvcfP5SvZuX7nUToCg_1750062390
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A9D5195608C;
	Mon, 16 Jun 2025 08:26:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.72.112.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C08418003FC;
	Mon, 16 Jun 2025 08:26:27 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 16/19] virtio_ring: factor out core logic for updating last_used_idx
Date: Mon, 16 Jun 2025 16:25:14 +0800
Message-ID: <20250616082518.10411-17-jasowang@redhat.com>
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

Factor out the core logic for updating last_used_idx to be reused by
the packed in order implementation.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/virtio/virtio_ring.c | 43 +++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 1bdd332d515e..e8e0d1204f52 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1757,6 +1757,30 @@ static bool more_used_packed(const struct vring_virtqueue *vq)
 	return virtqueue_poll_packed(vq, READ_ONCE(vq->last_used_idx));
 }
 
+static void update_last_used_idx_packed(struct vring_virtqueue *vq,
+					u16 id, u16 last_used,
+					u16 used_wrap_counter)
+{
+	last_used += vq->packed.desc_state[id].num;
+	if (unlikely(last_used >= vq->packed.vring.num)) {
+		last_used -= vq->packed.vring.num;
+		used_wrap_counter ^= 1;
+	}
+
+	last_used = (last_used | (used_wrap_counter << VRING_PACKED_EVENT_F_WRAP_CTR));
+	WRITE_ONCE(vq->last_used_idx, last_used);
+
+	/*
+	 * If we expect an interrupt for the next entry, tell host
+	 * by writing event index and flush out the write before
+	 * the read in the next get_buf call.
+	 */
+	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DESC)
+		virtio_store_mb(vq->weak_barriers,
+				&vq->packed.vring.driver->off_wrap,
+				cpu_to_le16(vq->last_used_idx));
+}
+
 static void *virtqueue_get_buf_ctx_packed(struct vring_virtqueue *vq,
 					  unsigned int *len,
 					  void **ctx)
@@ -1800,24 +1824,7 @@ static void *virtqueue_get_buf_ctx_packed(struct vring_virtqueue *vq,
 	ret = vq->packed.desc_state[id].data;
 	detach_buf_packed(vq, id, ctx);
 
-	last_used += vq->packed.desc_state[id].num;
-	if (unlikely(last_used >= vq->packed.vring.num)) {
-		last_used -= vq->packed.vring.num;
-		used_wrap_counter ^= 1;
-	}
-
-	last_used = (last_used | (used_wrap_counter << VRING_PACKED_EVENT_F_WRAP_CTR));
-	WRITE_ONCE(vq->last_used_idx, last_used);
-
-	/*
-	 * If we expect an interrupt for the next entry, tell host
-	 * by writing event index and flush out the write before
-	 * the read in the next get_buf call.
-	 */
-	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DESC)
-		virtio_store_mb(vq->weak_barriers,
-				&vq->packed.vring.driver->off_wrap,
-				cpu_to_le16(vq->last_used_idx));
+	update_last_used_idx_packed(vq, id, last_used, used_wrap_counter);
 
 	LAST_ADD_TIME_INVALID(vq);
 
-- 
2.34.1

