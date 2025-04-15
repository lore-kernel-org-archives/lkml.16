Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F52D1F48
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757291; cv=none; b=qAYCMYwwakw6ZKQ+jBco04I5S3+sVTNnnPjDo+cWjbzwgYFn08kqAVQiJfyJrQ8u70X2bpu0iPdhSetA59CCDqPT8N8icIPVT5o4e0cXLc2nSRrYF9y0kOchnvtFn0M2whAZgNycQ0FGYFct/p1kHnxhqYzTKtwawE46kzgbvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757291; c=relaxed/simple;
	bh=Cqzn0jIx+ICXy20erkdmco/hDp3aOf21xpNbmkO7QhI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GUhtnXDevet5MqHt/nKUoDscI2qYzvcEzVjcSQfMWrE1uAy/9u6osNm3CKYjflUoJkApx66BUJUvihPYpH32jTjM7tPKeZDH2D2GEC3rEVeb+42IeE3NeuvmAayMfW/8BVi6AppsgQFfgq1H1gJbzaO16bZcH0+asENoXP2x4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3kXIV5mn; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3kXIV5mn"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7395095a505so4757414b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744757289; x=1745362089; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y0gt4KGR4y8gxIG8GX1gRAmwKzn/ocefSDNpr0C4Oc=;
        b=3kXIV5mnKO5VpqEaBODRszdZqoMY0FbDDCZCWlhmyJjxgvYgxfbo6uHL4/LUMWAxuD
         wEjQ5v+BSKJmp2r85VBN4BP0g1g6/xNNiZ+wrB3GFPxEXCfEc9qjvoaAcdbcPAoEWcyW
         LjsG0+2FVOybX8rmEuFEJ60Id5BYtKaNA4dG8u9+DvOwGouRe7En31p2sfnysW8bVUEx
         nTNcPSgB4u4JmOoGCihAW8cv8stL1PxexuhBNSbYHBOIoJ1oaNTyi9gS2xudQ9F3cZUU
         ZHkP+7TzpZBjHZy1P/WlGkT0m6PDzIHT4z2k4HCE2pM2Tsl3o8XsS7lxKA/XI/AQhBpp
         ZA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744757289; x=1745362089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y0gt4KGR4y8gxIG8GX1gRAmwKzn/ocefSDNpr0C4Oc=;
        b=gEid6NiSg9nLDTkCKQ3MIWthGcmHWmaoST4Sd6rtVuk+qQHfXhQ1WD+Oj12DDWygno
         ExPAmLHdmk9EpGGQkrYBHx58jrIvJ4qHlmcygMSZPJ+KfmuQfApMqlmAkmOXFckwDL2N
         czpSeBJUxHMyZ4dNbN8OR7jKNgCJyiIsd2fkvHWZrWlj5CcVzMsB3XCGUM/Jk3RPKMZH
         9S0WCeIJOK15m1fKq1VnGXG4rXrqjnXUXR38u4PQ11Uu/7y9tJ4Vr/+ltBMq/r54+w9y
         1DKJAdkDsYbBegvx4VvYWCngg1apwMTcU7EDrfyMKedwUfH5UBI1FZ52bW0W8MbXu6nX
         uLBg==
X-Forwarded-Encrypted: i=1; AJvYcCXLnUYnNEhYaxD+kUOUL5ZZu8Q6T7aqGtlf9VJnijvFAY0NFYZjJA3hRvxU1NubaQSlfXbMrapKUIP4PUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRUdVA/jX90Kg4re/+X/V7RtFctYCR2HwZ8BJek/0qjxA+Yil
	ci0BkkBRTCmqn9F4OYt3uDNJS9mCgGMkEB781xnAMJD8RTUGaN2uA9QnikT64xbj7KQmx7FxxOD
	ES/hAUUBdpuDhlw4PQwlFqw==
X-Google-Smtp-Source: AGHT+IG5NdGfYD5N9W8W7UHWdGCQl03DIg/olddW2S6Vpl+mwIRiJnb8xyrZV4MMvX8nbx7uCAGqaaZxX+2uVhCWMg==
X-Received: from pfbi30.prod.google.com ([2002:a05:6a00:af1e:b0:736:4313:e6bc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:21c4:b0:730:9946:5973 with SMTP id d2e1a72fcca58-73c1f8c6c69mr1778523b3a.5.1744757288544;
 Tue, 15 Apr 2025 15:48:08 -0700 (PDT)
Date: Tue, 15 Apr 2025 22:47:54 +0000
In-Reply-To: <20250415224756.152002-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250415224756.152002-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250415224756.152002-7-almasrymina@google.com>
Subject: [PATCH net-next v8 7/9] gve: add netmem TX support to GVE DQO-RDA mode
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use netmem_dma_*() helpers in gve_tx_dqo.c DQO-RDA paths to
enable netmem TX support in that mode.

Declare support for netmem TX in GVE DQO-RDA mode.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v4:
- New patch
---
 drivers/net/ethernet/google/gve/gve_main.c   | 4 ++++
 drivers/net/ethernet/google/gve/gve_tx_dqo.c | 8 +++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 8aaac9101377..430314225d4d 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -2665,6 +2665,10 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	dev_info(&pdev->dev, "GVE version %s\n", gve_version_str);
 	dev_info(&pdev->dev, "GVE queue format %d\n", (int)priv->queue_format);
+
+	if (!gve_is_gqi(priv) && !gve_is_qpl(priv))
+		dev->netmem_tx = true;
+
 	gve_clear_probe_in_progress(priv);
 	queue_work(priv->gve_wq, &priv->service_task);
 	return 0;
diff --git a/drivers/net/ethernet/google/gve/gve_tx_dqo.c b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
index 2eba868d8037..a27f1574a733 100644
--- a/drivers/net/ethernet/google/gve/gve_tx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
@@ -660,7 +660,8 @@ static int gve_tx_add_skb_no_copy_dqo(struct gve_tx_ring *tx,
 			goto err;
 
 		dma_unmap_len_set(pkt, len[pkt->num_bufs], len);
-		dma_unmap_addr_set(pkt, dma[pkt->num_bufs], addr);
+		netmem_dma_unmap_addr_set(skb_frag_netmem(frag), pkt,
+					  dma[pkt->num_bufs], addr);
 		++pkt->num_bufs;
 
 		gve_tx_fill_pkt_desc_dqo(tx, desc_idx, skb, len, addr,
@@ -1038,8 +1039,9 @@ static void gve_unmap_packet(struct device *dev,
 	dma_unmap_single(dev, dma_unmap_addr(pkt, dma[0]),
 			 dma_unmap_len(pkt, len[0]), DMA_TO_DEVICE);
 	for (i = 1; i < pkt->num_bufs; i++) {
-		dma_unmap_page(dev, dma_unmap_addr(pkt, dma[i]),
-			       dma_unmap_len(pkt, len[i]), DMA_TO_DEVICE);
+		netmem_dma_unmap_page_attrs(dev, dma_unmap_addr(pkt, dma[i]),
+					    dma_unmap_len(pkt, len[i]),
+					    DMA_TO_DEVICE, 0);
 	}
 	pkt->num_bufs = 0;
 }
-- 
2.49.0.777.g153de2bbd5-goog

