Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBF17C21B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747847634; cv=none; b=ctojuU4xjFmWrrfzsUvtgfVXezwemLvKrZ33mIGg98T4POrFRCJNQ1VOPdRWX4nDYGbi369ZBSVorzFhMdhDqWx39gri8JTGLCHdBr4kbBx/xO+PqzTEj1Rfke9D37OSIc6wwzvKP6qB6f3ZbO5Njf4QgXZEFGmZQpqkXnBMyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747847634; c=relaxed/simple;
	bh=r087XpowPnE82rSEu0s4EyotDuRJ2rWFHxIzgSQU4zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4tmFUFxSwaTwTP6I4nSo+8HS6893F8zDPEbaCKq5xE4hFDCi8a98NeW39pWAX+uCWLrk8jbBn7fThrOzQrvsOAYraM3CqUUvWYni0aSWMkAeFzl0nxIhQ+bJeMwiGQ6qy/LGS8DDqKaF58AOJqgeqmys9ezzDMLSWdDdiEKEXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=gwY2F9p6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="gwY2F9p6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ede096d73so51978085e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1747847628; x=1748452428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4Wpj+08Oo1lb+5/wcT6jGPqCh/JkNX/ZcwBtUntRV8=;
        b=gwY2F9p6BabWiLFMrXZij/vmRZ4Iw6pAWkEvGEc6atw6h94/QX4XAaLw0Ie8JrZfyU
         /Elp8vAfErPlRyCT/YoEMfQQUpgvCF2hTyc8C/aEF1IbEP2vle2S8Nj/ALLR1R/cWqCf
         X3jQ9jIZyH2ByuVl3sz9rmTKCIsDkqgRn3V9woThXMqqNYdN/KSiIrxaHyfUwGwnsx8A
         ox+08z8cAb6OylEbXvAeZTdZJnnv96CFjHGRS9dyIrablfpFNYarsWDYoYP6kuZNZ5PV
         kP/42G3zPCbqL8BkZcI0W47Z6cEKXJsG4aSBchpxOROnIIJeIuyt7Fur//VtTahizPKn
         IsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747847628; x=1748452428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4Wpj+08Oo1lb+5/wcT6jGPqCh/JkNX/ZcwBtUntRV8=;
        b=HBj1TB2bd1/Ekadf/MLkCq3Vn2U47HXoVXydOU2NYye0KYTtcxPcypnnH0+otOs944
         eEz5TilE9kemJyjA8182pHH+lHVZ6N750zzcjZE+zmkS6wkcQbY/YafdLdHoDvZuf76c
         SFpGQaOO+z1QEEMldG9oUY+PxYiqx6Y8nlHnvMbZp+Fd9B3P6AUnoPFLd3NUX8Gtsl5D
         5K2uF7fQAOiDhQPjn9z92qk+oEnDH4QtTFsDe4m1pbZNw4ebWXkayKmMOzqKy5IJUX1A
         lofRkX/569PaL+4VqekG/GHNyfpn/TE1P4879O32cDqYYsTLYwuSyMWzubj4RiqOeT2r
         2/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXcLwmX3HcsbPl/on65brtcFGyvkWP6qTsOtGEO5lh+avoM0oGZqLEC+g5/KZwiSWzRO2gxLYFtOhK3XFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxndoI34jD12vYG0TZ7xnfY5kKne1kNy+nM0MoBMsHAcw3GlTwl
	t8FcfIPvqkUySReZ3i9VrRHnk/Kwf8EaINZcdLZHXm9vEqwQ3AyKO4I0O41RU0yMqYw=
X-Gm-Gg: ASbGnctL6oYTLPACwHy02lA9L0Jo33FCcMyVdvsm7xwzke7uEp3nE6bOP0so4piKZyu
	g8A+4+R/XDKfELL7OpV3Bwk04I4VhsCGCO72YTuC/UAXiMS/mcizJJTl1Wsw3VFpqlRNwGs9QX+
	dcpHVcskqSdVwPO/hEi7bzikQGE5RJVOMHs1Mk9H/etuEqPeqfVqkVNoYW31HtQ/qLJeZU9QNq4
	XfyiAnDW7p1lJwr3/Vwr/KHejC35D+lH+ejoGp7uoWMF95TeUIcrA5D9FjUgTU0wRHjGOSPIcsa
	kUAzidks3fHpdzw0EtZ3Y9obgwjZHYNfbqni36So40QZaQa6EjbO6jSuWp/wCGwcopb6/C0TGyI
	7Ts8GWBxQ
X-Google-Smtp-Source: AGHT+IFy5IUd1UkVJrmSLFpjpfOsLkeM5dc7cAFKomY2DMNBiqcgb9Jx007KRTZ7EPEsdOPmrlKCrA==
X-Received: by 2002:a05:600c:4f42:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-442fd60b64dmr189847355e9.6.1747847628484;
        Wed, 21 May 2025 10:13:48 -0700 (PDT)
Received: from odysseia.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889e6sm20387933f8f.71.2025.05.21.10.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 10:13:47 -0700 (PDT)
From: Marios Makassikis <mmakassikis@freebox.fr>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	mcroce@microsoft.com,
	marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Marios Makassikis <mmakassikis@freebox.fr>
Subject: [REPOST PATCH] drivers: net: mvpp2: attempt to refill rx before allocating skb
Date: Wed, 21 May 2025 19:10:22 +0200
Message-ID: <20250521171021.2978273-2-mmakassikis@freebox.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515080039.12c47bd3@kernel.org>
References: <20250515080039.12c47bd3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on mvpp2_rx_refill() failure, the freshly allocated skb is freed,
the rx error counter is incremented and the descriptor currently
being processed is rearmed through mvpp2_bm_pool_put().

the logic is that the system is low on memory so it's not possible
to allocate both a rx descriptor and an skb, so we might as well
drop the skb and return the descriptor to the rx pool to avoid
draining it (and preventing any future packet reception).

the skb freeing is unfortunate, as build_skb() takes ownership
of the 'data' buffer:
 - build_skb() calls  __finalize_skb_around() which sets skb->head
 and skb->data to point to 'data'
 - dev_free_skb_any() may call skb_free_frag() on skb->head

thus, the final mvpp2_bm_pool_put() rearms a descriptor that was
just freed.

call mvpp2_rx_refill() first, so there's no skb to free.

incidentally, doing rx refill prior to skb allocation is what is
done in marvell's mvneta driver for armada 370 (mvneta_rx_hwbm() in
mvneta.c)

Fixes: d6526926de739 ("net: mvpp2: fix memory leak in mvpp2_rx")
Signed-off-by: Marios Makassikis <mmakassikis@freebox.fr>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 416a926a8281..e13055ec4483 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -4003,6 +4003,12 @@ static int mvpp2_rx(struct mvpp2_port *port, struct napi_struct *napi,
 			metasize = xdp.data - xdp.data_meta;
 		}
 
+		err = mvpp2_rx_refill(port, bm_pool, pp, pool);
+		if (err) {
+			netdev_err(port->dev, "failed to refill BM pools\n");
+			goto err_drop_frame;
+		}
+
 		if (frag_size)
 			skb = build_skb(data, frag_size);
 		else
@@ -4021,13 +4027,6 @@ static int mvpp2_rx(struct mvpp2_port *port, struct napi_struct *napi,
 					 skb_hwtstamps(skb));
 		}
 
-		err = mvpp2_rx_refill(port, bm_pool, pp, pool);
-		if (err) {
-			netdev_err(port->dev, "failed to refill BM pools\n");
-			dev_kfree_skb_any(skb);
-			goto err_drop_frame;
-		}
-
 		if (pp)
 			skb_mark_for_recycle(skb);
 		else
-- 
2.49.0

