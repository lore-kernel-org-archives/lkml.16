Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AACF2C2AA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757281; cv=none; b=WFZ9yP/JtICkiiwq8YZC9A45Xqzdca8Z+fQfmK15wsHhflg4VdZcOULShlNlMsjsRJ6lswBu/DvkJK1Y94pSqkZ4UIwGSfprr7yO/6lY+EEvExArZQeOV1/XO0HdywfsrmdVOU5l9b07cwgPRnQoNBbNM0LRMcByhJCJ66nxfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757281; c=relaxed/simple;
	bh=cQDqckBf0hmDXK4g9ynIco3ZrZkTnIyGRhG/+zQ4Cws=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NyEbZknFs5g9HXkMlmfuXFH+5HF5A7TtCheNKZ/OrCUM7VKLUyWTYXIRsCq8F8yx5MzsUR9AfG5HQ6ntx+tvP4FphsPHjnmGOCC/YNwHotYguAUQZ1KhgRIL6YjGdWV5GSK13LCZhQbqiXjI4KPUXBWarmmRxc/WuLzBh2e6ykk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3qz6yR0F; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3qz6yR0F"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so6356540a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744757278; x=1745362078; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZMYJ9mghgsGT04ywh+6f5ef6ONFOD7mnlTWJ6KE3E4s=;
        b=3qz6yR0FiMUEFUB1Nrq/27lO5WG0ZimiJYgxRhcc23eI35T6nCVB8QWXisDHK5Df1p
         EbaQ2tbbuGdeBsVo0oTsTokr/aZtSCgRhK3ThClF4AI45m2ujigIrdXol89LLGIfWAJe
         210jqNjkmUlSQh5kqoBhvX80l8+CjTfxVDjrjae6yYRcN/wdeQyQahiAfUQzWrVwBB1i
         0RGBlGwOvT3GA2Rd/oqrxErsybrmBbcbnYaUcHGWJ1Y86ZRAkHwcaQv9T1QXz28e4rJR
         /b8EsVT2eKtYJ52wx3rwln/w3bAQXskXqBeU3CPkN6BLClkv0M3z1hrVJmRZIwUkwFAa
         cehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744757278; x=1745362078;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZMYJ9mghgsGT04ywh+6f5ef6ONFOD7mnlTWJ6KE3E4s=;
        b=SoGGoFjS9YRDlFaPJ5M0dXxok99Dy8Sz5roPPKogfqmNu+iHVfGDbtdJZzplnLGnoQ
         w0DgmAWn4hsrcVP8sPutIVOFdcAGrqOScsZpzFsyMsDggA9Orxyrt5s+LGFDQYaLxkVB
         1GT2h85tiVug3BW9EC5A2S6T0QhECO/u5bvzAjevUmumK6LV/ppNNIkzf7f+Z2GDph4n
         PFMwAp1PXWhkrU/Mhy1B4i9E0M4ssxPAbouybsXrNWUTRp7lv8op4MgfmG09pTHCYTpb
         QgXQq0ghjzENYIedtl7MfGAw5aXLg2hHlRzHs6jHLwCVXWP3qbkSLA56MphpL9Y7VcXE
         M/6w==
X-Forwarded-Encrypted: i=1; AJvYcCWKCllT7t6c5ruR7AUqbR9MK/oKm3STT8P3A/pXkV3WNadls0x8Fhn0Bpp4RFvNWlX1jrrFdr0H1Cyg+Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzVWWGJKVf1WS5IJIzIz6XB+NAL/sU34spZ/a/izjLKCavMxC
	i4kkVXoY7nITQWlypI80bFKTltbRRQRNKkq+I6YdK6fRWEwoJwwCxKvmWveV9sKcrxOisHNzFkz
	Hrp8fBi84+hSDm9+MGEcGoQ==
X-Google-Smtp-Source: AGHT+IGJWEyQPog40oxrMqoGsHI/uR3lYwzFocZD/EUJPpg1Ph4n4p94UxN7V/pG7QlDhDYzCI99CzW4KOsDU+Dcvw==
X-Received: from pjbso12.prod.google.com ([2002:a17:90b:1f8c:b0:2fc:13d6:b4cb])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c8a:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-3085ef200bemr1637324a91.15.1744757278334;
 Tue, 15 Apr 2025 15:47:58 -0700 (PDT)
Date: Tue, 15 Apr 2025 22:47:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250415224756.152002-1-almasrymina@google.com>
Subject: [PATCH net-next v8 1/9] netmem: add niov->type attribute to
 distinguish different net_iov types
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

base-commit: bbfc077d457272bcea4f14b3a28247ade99b196d
-- 
2.49.0.777.g153de2bbd5-goog

