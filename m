Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B82571DF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614082; cv=none; b=a5gb6f5uBhr/29+5jseGlSKryXcY32SMgNuayf15LTjawogRN5DqkbxiRrsY8r2WfCS95UUPyXtz42qLS8D22yQX4cNYpcav05rA67vXYYnInNj4fALfx4x6kUhtOjfpBs28q8dpMifM1PgfsAhDCJ7sit+kJsBfukPrIfWKjWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614082; c=relaxed/simple;
	bh=IqsfQhrBtY/uIgA0HP7SJ1VUXOKuOAdjCdaXsDurLeM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I4CS1k8+vUukjBHY2lJTCDgoVKolcwqk7gVeC9MqwUh3oLl1R7Fo9+hJ2QDJVrI7NWwBcG4SuZrrMTRc5ycViR1yRLMVt4lUc98miELm64Rbcz8vh0npS+cEcXkm5pbaQ++0LaF9pdufzQllxGbu0NJWtEQ4O7zpV9PMKP/ge1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gck3Ox8N; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gck3Ox8N"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af8f28f85a7so1628989a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745614080; x=1746218880; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=enOs7QykkTtNaI2qaSAZnEBkFkPUOBhTrAhJqBADVAA=;
        b=gck3Ox8N3l+5EPI1lefL58pZPp3aVM2kEUCChhxJctaALiZplvPpUN2DreShB+Q6dW
         9FfWc12VSqnMYjpA61NzwLOlQyvG3asjflTygx/WK8Wfkx1UJ6LGklxod8DLg8cP30mP
         p0t0x/dK1WTvTpmI6gwoduF6NoOUwVs+kuLl2U38ll+Hp5lgb8DWQoSEIKYfNtzbCLAT
         Gh8kJ9K3/J2nNXCqgYGuDmVOdSGEIziQZ0a134hddJfxCG3I5glbI8n8Ent4+VynmQwv
         XiugGMg4rITDQDE6Ra0iwo8sUV3EycElshgZBaWy1mxh0nQOGwhP5yId8wfYjwKpuw/7
         LWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614080; x=1746218880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enOs7QykkTtNaI2qaSAZnEBkFkPUOBhTrAhJqBADVAA=;
        b=quc0PRGstcYZjM7V0GunA2Sy9UHBx0+prEDDhVJYIk/29HO8zkmyBMNPyq5AUmL49l
         uUoZV5Ndn1lhjiQdIl8wIuai0xdopDK2KANShV5v9z4VpFgd5T9iP2beLptaEmHAYeeY
         nln1ZxFSqBvSo6dex9P1tPLOQkERyn2/kl3fYfAzZZWDP5LUVQZXrNT0ojVWLzsIFi8R
         iDuXmuiPVO8vTpV/4gD2PUIcH6yI60eB19E9DU498MPMFZBO4k4O2JNYaQ6VAe00usl6
         SJ6rlgejYCjBhwmJtP+MEWDo1feQm3OKrLQIa5+FD+FR0q1T1/oH4+mvREpgk1vLqPCw
         NbzA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Cici1eMPgBQCvA2d4czhT5x9BBX+onZqpSerhvqjhgeUHEHXerM+GViflN1ZtIPx/NiSTRsy+V877E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuEN0lpz1HNavAVH39dc5yvijXflBwIQUI3A0kaJmL3SepZzti
	IdEUdJVhnpaBCiERIEQVRE76yToIx4oPern3IR41XNJs1j7qrMCaONFrh26coJOdXGpQ1C3d97M
	DHnNgV8nzFtez8kWntoDByA==
X-Google-Smtp-Source: AGHT+IHcjFhgbZOspdHgxUsPOfyrBROyrCg8nBVVwhtEsRnrdryXYVVZvBNaSdH0Tt8bNLe6UvZbFPOh7gN4ZRQYNw==
X-Received: from pfbld18.prod.google.com ([2002:a05:6a00:4f92:b0:73c:257c:fd5f])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9016:b0:1f5:8de8:3b1a with SMTP id adf61e73a8af0-2046a430706mr855699637.13.1745614079664;
 Fri, 25 Apr 2025 13:47:59 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:47:42 +0000
In-Reply-To: <20250425204743.617260-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250425204743.617260-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250425204743.617260-9-almasrymina@google.com>
Subject: [PATCH net-next v12 8/9] net: check for driver support in netmem TX
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
	Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

We should not enable netmem TX for drivers that don't declare support.

Check for driver netmem TX support during devmem TX binding and fail if
the driver does not have the functionality.

Check for driver support in validate_xmit_skb as well.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>

---

v8:
- Rebase on latest net-next and resolve conflict.
- Remove likely (Paolo)

v5: https://lore.kernel.org/netdev/20250227041209.2031104-8-almasrymina@google.com/
- Check that the dmabuf mappings belongs to the specific device the TX
  is being sent from (Jakub)

v4:
- New patch

---
 net/core/dev.c         | 34 ++++++++++++++++++++++++++++++++--
 net/core/devmem.h      |  6 ++++++
 net/core/netdev-genl.c |  7 +++++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index d1a8cad0c99c4..66f0c122de80e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3896,12 +3896,42 @@ int skb_csum_hwoffload_help(struct sk_buff *skb,
 }
 EXPORT_SYMBOL(skb_csum_hwoffload_help);
 
+static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
+						    struct net_device *dev)
+{
+	struct skb_shared_info *shinfo;
+	struct net_iov *niov;
+
+	if (likely(skb_frags_readable(skb)))
+		goto out;
+
+	if (!dev->netmem_tx)
+		goto out_free;
+
+	shinfo = skb_shinfo(skb);
+
+	if (shinfo->nr_frags > 0) {
+		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
+		if (net_is_devmem_iov(niov) &&
+		    net_devmem_iov_binding(niov)->dev != dev)
+			goto out_free;
+	}
+
+out:
+	return skb;
+
+out_free:
+	kfree_skb(skb);
+	return NULL;
+}
+
 static struct sk_buff *validate_xmit_skb(struct sk_buff *skb, struct net_device *dev, bool *again)
 {
 	netdev_features_t features;
 
-	if (!skb_frags_readable(skb))
-		goto out_kfree_skb;
+	skb = validate_xmit_unreadable_skb(skb, dev);
+	if (unlikely(!skb))
+		goto out_null;
 
 	features = netif_skb_features(skb);
 	skb = validate_xmit_vlan(skb, features);
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 67168aae5e5b3..919e6ed28fdcd 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -229,6 +229,12 @@ net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding, size_t addr,
 {
 	return NULL;
 }
+
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_iov_binding(const struct net_iov *niov)
+{
+	return NULL;
+}
 #endif
 
 #endif /* _NET_DEVMEM_H */
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index db0e9a6a4badc..119f4fbc0c944 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -982,6 +982,13 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock_netdev;
 	}
 
+	if (!netdev->netmem_tx) {
+		err = -EOPNOTSUPP;
+		NL_SET_ERR_MSG(info->extack,
+			       "Driver does not support netmem TX");
+		goto err_unlock_netdev;
+	}
+
 	binding = net_devmem_bind_dmabuf(netdev, DMA_TO_DEVICE, dmabuf_fd,
 					 info->extack);
 	if (IS_ERR(binding)) {
-- 
2.49.0.850.g28803427d3-goog

