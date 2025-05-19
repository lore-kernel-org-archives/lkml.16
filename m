Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8F738B
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622123; cv=none; b=kq/YU+HV211xzkdxempqMe1eFmxe74C+FrZrKYmNZ1u33yABqtuPg4osiKjftKoEXEwTZG+j531mkdjg9o3EH5+3NJsREHbqWdw2GUECID+duM1plWpikx5nTYBc+NXP93JRUjKdWi+zsqWbvarVsQFBZZauQKQZMEoGkPha/cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622123; c=relaxed/simple;
	bh=ZS34Cvz02/vnDD36atJAHqch4t580yf9dD/ZkBaC9P4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XDXp/v8kOqFWEJucGBtCG74JTG/hgs6G5YnaCdidUh9wcEq1JN/eDxrM5tVYBz8LM8lUUJXPdk0qeZfzhxCUuJp6Tf1wxycfJH1LARu+cCvSLIqF/S5yIRMjzGXaufsNNmiP6Jiy9XdSRBkoasj5rpa9Rv8RKFNG+MzRBrh329E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U2wlKOWZ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U2wlKOWZ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22c31b55ac6so66825805ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747622121; x=1748226921; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NWTJVNW3YHtUCUhr40523AtMDA0/wA+qLJ0JBpFh9lY=;
        b=U2wlKOWZWp1gVugQIvwe7At+5u3H/XJOdV7SLf629E/tDUcWfYh/9lx6NKClh0vMZh
         EmE3kAa6qylvCaq8PJgtOQHlHSp09qD+u/5EUOEq31tgut4/Hus2d4WrEH5DE8ELZ5IJ
         Bhjm+gHly8m4AsbLOsqukvW2G84s12N3iW8ilgWaSnufhA/2rAhb7XPaXuiNQUycUraC
         ufRw5VJoOulh//9+/gVcP3VS97byi8xN7cRGz496YcBtShN1fHBX9AoQa8SjnjWDtqZM
         +WxEcEXykn9Bb44/gPh2t2SI39xAtWfn2CNMB2h/Z5ockE362QFJMPrO+kDix5V2h1fW
         H1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622121; x=1748226921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NWTJVNW3YHtUCUhr40523AtMDA0/wA+qLJ0JBpFh9lY=;
        b=WTgBuLLR0vROxuq/Nvghpsi3Rgt3QF9IDUpis6jmqMT8iw1kUMeyr1NLxb6dnGyZnI
         CT9R4xP/24mIXcoRjMYY4CFzgcJCc9qlNP2WlF6f5jrx5/ynQ3U7cy7e/LQZVKtF4Umq
         PrOQtn2UYpwK8weqjz9+b2WISvvHaN9O9Y443rnYTIev95HsczsIo0wxyxRd/fSMKLF5
         mDBqnfnoS59syQpLtwxfJvosZsWnf18UwnyL8hUMEo9hn5j88bCkPxLL3W4SHBajnwEU
         MEB5irIudeQSZK5L+tBA2ejHCsthmIyDxvXsmPO0lMl59ckcUn2M+QCGU1u28j4MGMvM
         BsnA==
X-Forwarded-Encrypted: i=1; AJvYcCXFD6/eHTiwgmeFznIco+x1GADDM73J1uvJkwKTRVc2ewVt32sN5IvTivPWB8eWv8/FqbeBSF2vE5AK3pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWK8x+QdCfL8JNL9Wh5E064TkXSoWVEtlbaJbH12PufnjUB7zK
	uOFgF5ke4/9TPsXptpClG7yQL2qacfM39S6jqYnSQaIpOB0kBa/sovR/zzCrUJl40rrqwjf5iJX
	ys5ctM5XeMIS+PgephF5IbOm6Xw==
X-Google-Smtp-Source: AGHT+IHHnpya9LgxFUJ+pdYLo7X5YnZkXRpI9Yli/3/2VBAPkdccDSoRBmBGpbwXjjZ03aoSSFbYgVF9lwKokTnJ0Q==
X-Received: from plbmu14.prod.google.com ([2002:a17:903:b4e:b0:231:e2ee:34c9])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e78c:b0:231:d156:b26b with SMTP id d9443c01a7336-231d4598d28mr176848355ad.38.1747622121254;
 Sun, 18 May 2025 19:35:21 -0700 (PDT)
Date: Mon, 19 May 2025 02:35:09 +0000
In-Reply-To: <20250519023517.4062941-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519023517.4062941-2-almasrymina@google.com>
Subject: [PATCH net-next v1 1/9] net: devmem: move list_add to net_devmem_bind_dmabuf.
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"

It's annoying for the list_add to be outside net_devmem_bind_dmabuf, but
the list_del is in net_devmem_unbind_dmabuf. Make it consistent by
having both the list_add/del be inside the net_devmem_[un]bind_dmabuf.

Cc: ap420073@gmail.com
Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 net/core/devmem.c      | 5 ++++-
 net/core/devmem.h      | 5 ++++-
 net/core/netdev-genl.c | 8 ++------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 0dba26baae18..b3a62ca0df65 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -178,7 +178,8 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev,
 		       enum dma_data_direction direction,
-		       unsigned int dmabuf_fd, struct netlink_ext_ack *extack)
+		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
+		       struct netlink_ext_ack *extack)
 {
 	struct net_devmem_dmabuf_binding *binding;
 	static u32 id_alloc_next;
@@ -299,6 +300,8 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 	if (err < 0)
 		goto err_free_chunks;
 
+	list_add(&binding->list, &priv->bindings);
+
 	return binding;
 
 err_free_chunks:
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 58d8d3c1b945..e7ba77050b8f 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -11,6 +11,7 @@
 #define _NET_DEVMEM_H
 
 #include <net/netmem.h>
+#include <net/netdev_netlink.h>
 
 struct netlink_ext_ack;
 
@@ -82,7 +83,8 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
 struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev,
 		       enum dma_data_direction direction,
-		       unsigned int dmabuf_fd, struct netlink_ext_ack *extack);
+		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
+		       struct netlink_ext_ack *extack);
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
@@ -170,6 +172,7 @@ static inline void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 static inline struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 		       enum dma_data_direction direction,
+		       struct netdev_nl_sock *priv,
 		       struct netlink_ext_ack *extack)
 {
 	return ERR_PTR(-EOPNOTSUPP);
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 762570dcda61..2afa7b2141aa 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -908,7 +908,7 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	binding = net_devmem_bind_dmabuf(netdev, DMA_FROM_DEVICE, dmabuf_fd,
-					 info->extack);
+					 priv, info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_unlock;
@@ -943,8 +943,6 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 			goto err_unbind;
 	}
 
-	list_add(&binding->list, &priv->bindings);
-
 	nla_put_u32(rsp, NETDEV_A_DMABUF_ID, binding->id);
 	genlmsg_end(rsp, hdr);
 
@@ -1020,15 +1018,13 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock_netdev;
 	}
 
-	binding = net_devmem_bind_dmabuf(netdev, DMA_TO_DEVICE, dmabuf_fd,
+	binding = net_devmem_bind_dmabuf(netdev, DMA_TO_DEVICE, dmabuf_fd, priv,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_unlock_netdev;
 	}
 
-	list_add(&binding->list, &priv->bindings);
-
 	nla_put_u32(rsp, NETDEV_A_DMABUF_ID, binding->id);
 	genlmsg_end(rsp, hdr);
 
-- 
2.49.0.1101.gccaa498523-goog

