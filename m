Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2951E32A3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234478; cv=none; b=MtUqmCPZhcVbDhdOjULYzn+AoY2uUkWysI4fkla2OhCjaIOVR36Rg5gjC2eEg/eq6jAQlz0+RfLGARrS8UfYE+4ZtwJDI2aaZdLYtdSRnOTGccBya+KSmiLZ9Hsw3Xy+9WEfArSQZe/IpJHA393fdvDP00r/gZNWqrCtW3LJAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234478; c=relaxed/simple;
	bh=wwQNq2Q0TBrFSrOZM1DftROi8CAvU51ZzQxaUwKNLLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fv8oEV0+lvZEbUGSy6U//v9RS6DAimHmYJZ4U302adj8ZW7mMrlI0IOWdcry2sLCdlxBUUv1EYJCISbdJq77Haf7TF3aXs2A68ZvNaEwArUR4zxsjoELQRXVnV06w49+sXN73M1CaF6ONT63Tm1cQl7Us4LWYt34hHJn7mcCJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=chqLDSHg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="chqLDSHg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4393f6a2c1bso10856115e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1739234473; x=1739839273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9UHiO1m55OSa5PQN2n1Z3N7lCeet+dh1oBKi1r2jE=;
        b=chqLDSHgUSpn+HiMI8ZPVTCYPDecRZ3Tcdo+KsZMUU3mmrX+3bSIeMGDNq6PIqs7xs
         Xsrs+jGdXf3zJLc4ipGzh9KbvAXVsnCyMhkYSxXdfag/sD8/pEP3Yqygh5LCnKo4Adck
         4Uj0yNbEn6Z/MScGDR2oymg81/Anp7ykGNiuqWqwqyW6wEbsAH0iIz0dBITzq+IRchir
         hA9dnDmAJxcCvEs/lZ4sViFSFVCQyMt4pwwJmBOfiAZEwwh2hvi+a99VjayA5GYBlqx/
         LXj+3i54u30Gv5zIP1FHRP/prxVcZqQQM85GUhcBTebdvhHIYDS28zCmzibarOyJ+tL6
         bh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234473; x=1739839273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ9UHiO1m55OSa5PQN2n1Z3N7lCeet+dh1oBKi1r2jE=;
        b=gGx+3mu0nXtBBYHs5GFC5ZIYF+itBD4devGXghDv/yDmvRrExe/8mU5OrFqPeGGOFs
         PUVLWkUFQlqq+q0n7hsyltuPOmf3VHPiV9L1wCWFfS6xQIObKLRIQs58xYzfoyPDzrZs
         rTedhMIL/43UeQRIxpBm/4pj2FWYhc2tb/rFNVMKWrQV9zdW9xOUqazFzHJbOGNHorry
         lvnMzWgE6iazQ6/fAD79auB7dxFTncYc1/QlMx7k8G8oiGHofGthuMj4RZTxEQzgZR8U
         WqPWMhnQ4fJey673ilhv1AZc97IQ97SrgsWF793zsXzfQasZQ4JEdD9DRinGUKgkW4vX
         PMdw==
X-Forwarded-Encrypted: i=1; AJvYcCVMY9js56W7JADmQgV0to5ioQnqREoeyf68pbEsF6czqPDe6ITKAjJfdQAQKbJPn8GWuXm6ifTgGmNKnIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcrq5aB5WE8w3JKfkT0U8HyBhYLl2bx0xxUqX9u0OF/Umr55Gi
	HrfnO5eQA5vtQqMkqC4exPwDxMeB3dPQMWaXPuDDbZCae9IwO0vZO+/5O3DTl4o=
X-Gm-Gg: ASbGncuy4Akt+bCOjwqvip1USvH5nye5hLX9FSpbG4C/D6PGXdVbmcQlXValAMcN9b1
	Kh+jj1kZivhy0GdKc/+YRhZC78mxVwLUVhF62Kxk7JWbCK8w8NXfU93wxUvw+e+a4lqTVWf7aod
	WumDYgAtdmG2m25ein82rixNk9fOgVz4SPizZD3BE9jDoYxwDJEJoY0wMBI5CBqo4G/bCjkLHsW
	bM01YHAzhzBCn9tkEzXLGQ5ErGPsFnA+G3LJnm2VC7V5hpiKPswRLDfVImyK9WjPTqt6VSOMudK
	cd5lBdUVf2LZxYsOh2xV+cgJoUU=
X-Google-Smtp-Source: AGHT+IE4DiC670IHEBjyjmj/cV0FLBPUPMeA1fUHppbR6djpiGVPa/vsnKqpm0NTDg/1eugCgJe/wQ==
X-Received: by 2002:a05:600c:3ba4:b0:439:4c7f:e167 with SMTP id 5b1f17b1804b1-4394ceb0ef5mr10580125e9.1.1739234472960;
        Mon, 10 Feb 2025 16:41:12 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1255:949f:f81c:4f95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc1bed2sm3388435e9.0.2025.02.10.16.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:41:11 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 11 Feb 2025 01:40:03 +0100
Subject: [PATCH net-next v19 10/26] ovpn: store tunnel and transport
 statistics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-b4-ovpn-v19-10-86d5daf2a47a@openvpn.net>
References: <20250211-b4-ovpn-v19-0-86d5daf2a47a@openvpn.net>
In-Reply-To: <20250211-b4-ovpn-v19-0-86d5daf2a47a@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7109; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=wwQNq2Q0TBrFSrOZM1DftROi8CAvU51ZzQxaUwKNLLo=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBnqpyN4x7Lmu4CWFZAm3jGl+zHPwwPvZNkGJoNF
 D6qiaYCrdSJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ6qcjQAKCRALcOU6oDjV
 hy5CCACLEtAxHzIDso4ajThT2HDI6sItY0+8E8EG8otg+zgktqiF1+DaksVHOezMN3Beg/nCEN2
 s2fB0Qo7NSUZ0N9HPO7v4nfF9xbQq+yK2BqBM2vEtl0dIBz99evdEkegSYsrZy1XayrHsIlM3+d
 C72P58RI8DGntEpnc8Dcmw6VUcMi6vD8Kqc03pYKVzv8jbPq0NqW2sWSjUMxnK9llFe0gYtPLGn
 Ci2266y0dV7zbE0TH3AhD+FyoTgMN/BOWnOH/yaimYbnnRXxebECEXMntdsUJVqVwVIgsW33clW
 CKpCUMZ8LlVzOnOIiKDyvNYLieDQlApYWh1jvxJuJmA0BCih
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

Byte/packet counters for in-tunnel and transport streams
are now initialized and updated as needed.

To be exported via netlink.

Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/Makefile |  1 +
 drivers/net/ovpn/io.c     | 12 +++++++++++-
 drivers/net/ovpn/peer.c   |  2 ++
 drivers/net/ovpn/peer.h   |  5 +++++
 drivers/net/ovpn/stats.c  | 21 +++++++++++++++++++++
 drivers/net/ovpn/stats.h  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ovpn/Makefile b/drivers/net/ovpn/Makefile
index ccdaeced1982c851475657860a005ff2b9dfbd13..d43fda72646bdc7644d9a878b56da0a0e5680c98 100644
--- a/drivers/net/ovpn/Makefile
+++ b/drivers/net/ovpn/Makefile
@@ -17,4 +17,5 @@ ovpn-y += netlink-gen.o
 ovpn-y += peer.o
 ovpn-y += pktid.o
 ovpn-y += socket.o
+ovpn-y += stats.o
 ovpn-y += udp.o
diff --git a/drivers/net/ovpn/io.c b/drivers/net/ovpn/io.c
index 2cbae584efe946813d0857c7c2c3d3ec2965c3a5..34753eea78aa634f2e01370797e243b615d0c996 100644
--- a/drivers/net/ovpn/io.c
+++ b/drivers/net/ovpn/io.c
@@ -12,6 +12,7 @@
 #include <linux/skbuff.h>
 #include <net/gro_cells.h>
 #include <net/gso.h>
+#include <net/ip.h>
 
 #include "ovpnpriv.h"
 #include "peer.h"
@@ -55,9 +56,11 @@ static void ovpn_netdev_write(struct ovpn_peer *peer, struct sk_buff *skb)
 	/* cause packet to be "received" by the interface */
 	pkt_len = skb->len;
 	ret = gro_cells_receive(&peer->ovpn->gro_cells, skb);
-	if (likely(ret == NET_RX_SUCCESS))
+	if (likely(ret == NET_RX_SUCCESS)) {
 		/* update RX stats with the size of decrypted packet */
+		ovpn_peer_stats_increment_rx(&peer->vpn_stats, pkt_len);
 		dev_sw_netstats_rx_add(peer->ovpn->dev, pkt_len);
+	}
 }
 
 void ovpn_decrypt_post(void *data, int ret)
@@ -158,6 +161,8 @@ void ovpn_recv(struct ovpn_peer *peer, struct sk_buff *skb)
 	struct ovpn_crypto_key_slot *ks;
 	u8 key_id;
 
+	ovpn_peer_stats_increment_rx(&peer->link_stats, skb->len);
+
 	/* get the key slot matching the key ID in the received packet */
 	key_id = ovpn_key_id_from_skb(skb);
 	ks = ovpn_crypto_key_id_to_slot(&peer->crypto, key_id);
@@ -181,6 +186,7 @@ void ovpn_encrypt_post(void *data, int ret)
 	struct sk_buff *skb = data;
 	struct ovpn_socket *sock;
 	struct ovpn_peer *peer;
+	unsigned int orig_len;
 
 	/* encryption is happening asynchronously. This function will be
 	 * called later by the crypto callback with a proper return value
@@ -206,6 +212,7 @@ void ovpn_encrypt_post(void *data, int ret)
 		goto err;
 
 	skb_mark_not_on_list(skb);
+	orig_len = skb->len;
 
 	rcu_read_lock();
 	sock = rcu_dereference(peer->sock);
@@ -220,6 +227,8 @@ void ovpn_encrypt_post(void *data, int ret)
 		/* no transport configured yet */
 		goto err_unlock;
 	}
+
+	ovpn_peer_stats_increment_tx(&peer->link_stats, orig_len);
 	/* skb passed down the stack - don't free it */
 	skb = NULL;
 err_unlock:
@@ -341,6 +350,7 @@ netdev_tx_t ovpn_net_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto drop;
 	}
 
+	ovpn_peer_stats_increment_tx(&peer->vpn_stats, skb->len);
 	ovpn_send(ovpn, skb_list.next, peer);
 
 	return NETDEV_TX_OK;
diff --git a/drivers/net/ovpn/peer.c b/drivers/net/ovpn/peer.c
index 0988b48e30d3b041d971e717313b05446e2ab2e2..2e69b098d53bd8c2e549b712530d746f5125cff0 100644
--- a/drivers/net/ovpn/peer.c
+++ b/drivers/net/ovpn/peer.c
@@ -47,6 +47,8 @@ struct ovpn_peer *ovpn_peer_new(struct ovpn_priv *ovpn, u32 id)
 	ovpn_crypto_state_init(&peer->crypto);
 	spin_lock_init(&peer->lock);
 	kref_init(&peer->refcount);
+	ovpn_peer_stats_init(&peer->vpn_stats);
+	ovpn_peer_stats_init(&peer->link_stats);
 
 	ret = dst_cache_init(&peer->dst_cache, GFP_KERNEL);
 	if (ret < 0) {
diff --git a/drivers/net/ovpn/peer.h b/drivers/net/ovpn/peer.h
index aae4611cf22519d00f3e4b63fc6546433c315648..9cc25ab350f4af98f8af3b75dfd57b8a493d433a 100644
--- a/drivers/net/ovpn/peer.h
+++ b/drivers/net/ovpn/peer.h
@@ -14,6 +14,7 @@
 
 #include "crypto.h"
 #include "socket.h"
+#include "stats.h"
 
 /**
  * struct ovpn_peer - the main remote peer object
@@ -27,6 +28,8 @@
  * @crypto: the crypto configuration (ciphers, keys, etc..)
  * @dst_cache: cache for dst_entry used to send to peer
  * @bind: remote peer binding
+ * @vpn_stats: per-peer in-VPN TX/RX stats
+ * @link_stats: per-peer link/transport TX/RX stats
  * @delete_reason: why peer was deleted (i.e. timeout, transport error, ..)
  * @lock: protects binding to peer (bind)
  * @refcount: reference counter
@@ -45,6 +48,8 @@ struct ovpn_peer {
 	struct ovpn_crypto_state crypto;
 	struct dst_cache dst_cache;
 	struct ovpn_bind __rcu *bind;
+	struct ovpn_peer_stats vpn_stats;
+	struct ovpn_peer_stats link_stats;
 	enum ovpn_del_peer_reason delete_reason;
 	spinlock_t lock; /* protects bind */
 	struct kref refcount;
diff --git a/drivers/net/ovpn/stats.c b/drivers/net/ovpn/stats.c
new file mode 100644
index 0000000000000000000000000000000000000000..a383842c3449b73694c318837b0b92eb9afaec22
--- /dev/null
+++ b/drivers/net/ovpn/stats.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*  OpenVPN data channel offload
+ *
+ *  Copyright (C) 2020-2024 OpenVPN, Inc.
+ *
+ *  Author:	James Yonan <james@openvpn.net>
+ *		Antonio Quartulli <antonio@openvpn.net>
+ */
+
+#include <linux/atomic.h>
+
+#include "stats.h"
+
+void ovpn_peer_stats_init(struct ovpn_peer_stats *ps)
+{
+	atomic64_set(&ps->rx.bytes, 0);
+	atomic64_set(&ps->rx.packets, 0);
+
+	atomic64_set(&ps->tx.bytes, 0);
+	atomic64_set(&ps->tx.packets, 0);
+}
diff --git a/drivers/net/ovpn/stats.h b/drivers/net/ovpn/stats.h
new file mode 100644
index 0000000000000000000000000000000000000000..868f49d25eaa8fef04a02a61c363d95f9c9ef80a
--- /dev/null
+++ b/drivers/net/ovpn/stats.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*  OpenVPN data channel offload
+ *
+ *  Copyright (C) 2020-2024 OpenVPN, Inc.
+ *
+ *  Author:	James Yonan <james@openvpn.net>
+ *		Antonio Quartulli <antonio@openvpn.net>
+ *		Lev Stipakov <lev@openvpn.net>
+ */
+
+#ifndef _NET_OVPN_OVPNSTATS_H_
+#define _NET_OVPN_OVPNSTATS_H_
+
+/* one stat */
+struct ovpn_peer_stat {
+	atomic64_t bytes;
+	atomic64_t packets;
+};
+
+/* rx and tx stats combined */
+struct ovpn_peer_stats {
+	struct ovpn_peer_stat rx;
+	struct ovpn_peer_stat tx;
+};
+
+void ovpn_peer_stats_init(struct ovpn_peer_stats *ps);
+
+static inline void ovpn_peer_stats_increment(struct ovpn_peer_stat *stat,
+					     const unsigned int n)
+{
+	atomic64_add(n, &stat->bytes);
+	atomic64_inc(&stat->packets);
+}
+
+static inline void ovpn_peer_stats_increment_rx(struct ovpn_peer_stats *stats,
+						const unsigned int n)
+{
+	ovpn_peer_stats_increment(&stats->rx, n);
+}
+
+static inline void ovpn_peer_stats_increment_tx(struct ovpn_peer_stats *stats,
+						const unsigned int n)
+{
+	ovpn_peer_stats_increment(&stats->tx, n);
+}
+
+#endif /* _NET_OVPN_OVPNSTATS_H_ */

-- 
2.45.3

