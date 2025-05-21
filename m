Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EC240604
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819373; cv=none; b=JiKhF9Cms8pscvtyNxWG9AaFqvFJA2QyNR8wa0+iWIj51CeHnLW2mq7r8iiODi3jGSp6RIgZUhx20AIEv1sgqACrRoKDhS0v2fmEOm4+XXTNbJ5KoH73JkmoOl/weeMVb7/RTbh8zHXHEbs6z8VU3GCbKTkhp0G7IzNL9iAMohU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819373; c=relaxed/simple;
	bh=VluP8qpCkS3H4WO+0xV1NzMW93mtebEWW0WnxKY06kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuHOAB+MMMJZbPXIHr1vmaFrS2Ucz8szs3XM+m04FafKE8naqSpx4DG+teKQ2vGxIDV4s3c6EyFUdbBe1jk0LWOcNaXJG9OWmtH/mqG9MZHoJVhQHidV3VpQET4JW6G+LFtiUVAIVTuqxbKraQoN1PCjQ4iy8s4QYQ+f+sbQ+Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CX+O1uwm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CX+O1uwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747819369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCjXdTR4Wx9dhjp6rerToyVYaVci27rrR2sB2aTajX8=;
	b=CX+O1uwmbn9xWPzxkxiny2eenimaq/DmJjr6UjHwWsAIlOnNOQZaEP6QR84B5hVoPlZMOV
	Lg1KnP8owpXX89IcQzCVOvzfNm2BzUycKyYQeb6Lo+Cw7U2422BA90ucmG2YCOoIRMsrZT
	OXrHDV1FA+r/J3YsYQ7mmzaboOqHfLU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-573-HUAiizX9PKqv0gXXtfkSXQ-1; Wed,
 21 May 2025 05:22:46 -0400
X-MC-Unique: HUAiizX9PKqv0gXXtfkSXQ-1
X-Mimecast-MFC-AGG-ID: HUAiizX9PKqv0gXXtfkSXQ_1747819365
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43E2C195608A;
	Wed, 21 May 2025 09:22:45 +0000 (UTC)
Received: from lenovo-t14s.redhat.com (unknown [10.44.33.64])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 62927195608F;
	Wed, 21 May 2025 09:22:43 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH v2 2/3] virtio_net: Cleanup '2+MAX_SKB_FRAGS'
Date: Wed, 21 May 2025 11:22:35 +0200
Message-ID: <20250521092236.661410-3-lvivier@redhat.com>
In-Reply-To: <20250521092236.661410-1-lvivier@redhat.com>
References: <20250521092236.661410-1-lvivier@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Improve consistency by using everywhere it is needed
'MAX_SKB_FRAGS + 2' rather than '2+MAX_SKB_FRAGS' or
'2 + MAX_SKB_FRAGS'.

No functional change.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 drivers/net/virtio_net.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index e53ba600605a..ff4160243538 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1084,7 +1084,7 @@ static bool tx_may_stop(struct virtnet_info *vi,
 	 * Since most packets only take 1 or 2 ring slots, stopping the queue
 	 * early means 16 slots are typically wasted.
 	 */
-	if (sq->vq->num_free < 2+MAX_SKB_FRAGS) {
+	if (sq->vq->num_free < MAX_SKB_FRAGS + 2) {
 		struct netdev_queue *txq = netdev_get_tx_queue(dev, qnum);
 
 		netif_tx_stop_queue(txq);
@@ -1116,7 +1116,7 @@ static void check_sq_full_and_disable(struct virtnet_info *vi,
 		} else if (unlikely(!virtqueue_enable_cb_delayed(sq->vq))) {
 			/* More just got used, free them then recheck. */
 			free_old_xmit(sq, txq, false);
-			if (sq->vq->num_free >= 2+MAX_SKB_FRAGS) {
+			if (sq->vq->num_free >= MAX_SKB_FRAGS + 2) {
 				netif_start_subqueue(dev, qnum);
 				u64_stats_update_begin(&sq->stats.syncp);
 				u64_stats_inc(&sq->stats.wake);
@@ -2998,7 +2998,7 @@ static void virtnet_poll_cleantx(struct receive_queue *rq, int budget)
 			free_old_xmit(sq, txq, !!budget);
 		} while (unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
 
-		if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS) {
+		if (sq->vq->num_free >= MAX_SKB_FRAGS + 2) {
 			if (netif_tx_queue_stopped(txq)) {
 				u64_stats_update_begin(&sq->stats.syncp);
 				u64_stats_inc(&sq->stats.wake);
@@ -3195,7 +3195,7 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	else
 		free_old_xmit(sq, txq, !!budget);
 
-	if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS) {
+	if (sq->vq->num_free >= MAX_SKB_FRAGS + 2) {
 		if (netif_tx_queue_stopped(txq)) {
 			u64_stats_update_begin(&sq->stats.syncp);
 			u64_stats_inc(&sq->stats.wake);
-- 
2.49.0

