Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE21F221F01
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931747; cv=none; b=nee3pNe3zKhSOGCoIzUUornMZOra1eQoKAR5/m+2i7GYYgkW2SYtjZUGKaCYCpSKalc/BcGj1NXbssSK/1f8FLmIdAfXE2/a0Wsh4YVTP4t7WDC07k92RdTrGXd9AVO9n1LX9I9BgV4dzkfHIk5kIPgdCVL5hedVxNCd6LUWjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931747; c=relaxed/simple;
	bh=PxUi6PMnLLjyTGTj+svoqP26/eSAQtm8kaSii0Qle9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W6rzSVThOBuV/E6MieYxwvzzLrgjuwVeJoibKbBjXPP4V7aw52e0A+1Np7JZ9VxlL4sed9bId+aL5pJEaZl8zjHYL/vb6wp9sMoPGFY1rRqZy5CF1awF9r5geaZGS/KqCOfRsqbRI3AupKCCokl+VFS/ZOlt3PQt1qXT3p/vjvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rcnhr6A5; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rcnhr6A5"
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-2c855402a6dso795025fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931744; x=1745536544; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5104Ofe9FKOPF1WtDB1Sgb/hE4K8EHHAmPkusRmzhtE=;
        b=Rcnhr6A5922oc567uGa9Cogy1I9/JVrphcfdTGwmbB9Puf3WgPES8gajKSeFWiGW4w
         O0PIn+mRS3mU5MmATgRmnDI2LrsAc5B+PFJJsxf9Q9LdbLEJ0xYDIjzRYMZxf92PM6Uh
         MX9Pujgaed8GqKcjZuTWiDoxdcI/Xuek9UpgwXWmsl8XHBi2fgW6YjBtI3tJYUja9LUZ
         1JYZh+siyKMEnQfTuFiC0117zrDZtBEk7R2OEoRw42LDZgRcvZ5Lv1gk1rgMGmbtNhoS
         bEXVhWbQl39EvsTk5mdyJvkN6YfHmo7VAFu/MXopamCf0DQsDtvidQgspvF2399dHU3r
         hVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931744; x=1745536544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5104Ofe9FKOPF1WtDB1Sgb/hE4K8EHHAmPkusRmzhtE=;
        b=VbYtBtpBo+PDE6Tzk+dqHsY3k+ppYcZB6AxKH8sPncXV1rdoqYPRRkhz1HN4+07xtO
         D1QTdRgkOXTOq34iZhSTKFys/zOimThoA563iDJDckiQuLRZ7rHfH+shw1XmZ3iYG6D7
         46FXpbiSWtVn0MHS+I3PwgR4XvFwbCSqoSwskqAC21pe4Vm4KpZTVT1p2Xt5CvTKs+XW
         0Axfxa7Q1CCWs2nvpUSKjOZvOqeThDrZMEc/cKlrwWcE62jTeygcoBKKUZlgSsEdIk/h
         ZKAr3gQxN7Ib0VlEw5VJARf3z61rUTbEDxypfeGmBVI1oxpAEOJvkKjXWMhdNkoPyU0M
         ncgg==
X-Forwarded-Encrypted: i=1; AJvYcCWCVxYfWOAPyDHU/9DVgkelfz4HLlcU9xsO7q8hpBfJ+1RZSv7qQC81HlSh5haA/yHdAIRNIE4jKQVCbDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGtiA376Nn6xrL+RrJWEspgw2R8+vo9b2QhViIVn1dKsiQe9d
	FCSSZXIlXPZ4YkFub0YCh6S6d/2NDZTDI7+01FztDtTzsSEkuLcXqSJXmVomCeGsoL6lPMq8cNd
	2ukV0BgIDyz/wO4meMkM+QQ==
X-Google-Smtp-Source: AGHT+IEMqL9YOVOmk+jyRPo0f1di937KXmsXcGEDfTc+n7gctIS6OyoI5UKywgc4XZvX4lCMTpokjhEqxuCoIrGZyg==
X-Received: from oabvp23.prod.google.com ([2002:a05:6871:a017:b0:2b8:1fa:4ac5])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:6216:b0:2c2:b85b:71ff with SMTP id 586e51a60fabf-2d526973eafmr406639fac.8.1744931744709;
 Thu, 17 Apr 2025 16:15:44 -0700 (PDT)
Date: Thu, 17 Apr 2025 23:15:32 +0000
In-Reply-To: <20250417231540.2780723-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250417231540.2780723-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417231540.2780723-2-almasrymina@google.com>
Subject: [PATCH net-next v9 1/9] netmem: add niov->type attribute to
 distinguish different net_iov types
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Later patches in the series adds TX net_iovs where there is no pp
associated, so we can't rely on niov->pp->mp_ops to tell what is the
type of the net_iov.

Add a type enum to the net_iov which tells us the net_iov type.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v8:
- Since io_uring zcrx is now in net-next, update io_uring net_iov type
  setting and remove the NET_IOV_UNSPECIFIED type

v7:
- New patch


fix iouring

---
 include/net/netmem.h | 11 ++++++++++-
 io_uring/zcrx.c      |  1 +
 net/core/devmem.c    |  3 ++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index c61d5b21e7b4..64af9a288c80 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -20,8 +20,17 @@ DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
  */
 #define NET_IOV 0x01UL
 
+enum net_iov_type {
+	NET_IOV_DMABUF,
+	NET_IOV_IOURING,
+
+	/* Force size to unsigned long to make the NET_IOV_ASSERTS below pass.
+	 */
+	NET_IOV_MAX = ULONG_MAX,
+};
+
 struct net_iov {
-	unsigned long __unused_padding;
+	enum net_iov_type type;
 	unsigned long pp_magic;
 	struct page_pool *pp;
 	struct net_iov_area *owner;
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 0f46e0404c04..17a54e74ed5d 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -247,6 +247,7 @@ static int io_zcrx_create_area(struct io_zcrx_ifq *ifq,
 		niov->owner = &area->nia;
 		area->freelist[i] = i;
 		atomic_set(&area->user_refs[i], 0);
+		niov->type = NET_IOV_IOURING;
 	}
 
 	area->free_count = nr_iovs;
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 6e27a47d0493..f5c3a7e6dbb7 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -30,7 +30,7 @@ static const struct memory_provider_ops dmabuf_devmem_ops;
 
 bool net_is_devmem_iov(struct net_iov *niov)
 {
-	return niov->pp->mp_ops == &dmabuf_devmem_ops;
+	return niov->type == NET_IOV_DMABUF;
 }
 
 static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
@@ -266,6 +266,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 
 		for (i = 0; i < owner->area.num_niovs; i++) {
 			niov = &owner->area.niovs[i];
+			niov->type = NET_IOV_DMABUF;
 			niov->owner = &owner->area;
 			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
 						      net_devmem_get_dma_addr(niov));
-- 
2.49.0.805.g082f7c87e0-goog

