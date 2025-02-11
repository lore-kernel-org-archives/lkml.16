Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8C1EF0AE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234497; cv=none; b=cYmLP+t3gxQ8DFCtSgUW2z8UUXJnZ1m1g+hv9jWKNsBJC14cYMbj/U2Fre9YWUFr26/CLbQ3Yiu42oL92cVrKXT8KGbXf4NOTd+ffVMBamGHF6W6h6F4Zk0FXfe67noDggbh1GDkNeJqgpFNwwM48VkoXgr2so2LhRSgpX2K6WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234497; c=relaxed/simple;
	bh=EYnyLwUfNc/BvCrdAHkp1RmPDq4HPh4r2Zz9vyUOYAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igXIasb3V2ZlFKUbNE2a/pn9Fl6gTPOcFCjhT0AdWzJkwQI5UqO0DvDLhCZNXryBENVK623OgsbvjC4nnMwjznhAjf72PWg756zjor0hMqW3MkIg7PI8zVt1kV+5GUTWjTIimImHJfjaEsxMD8rythyt829ZvlnBVf30xNcx+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=fxj9Pxtx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="fxj9Pxtx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so3236873f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1739234492; x=1739839292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXo6xZocIRzlc0t5uNNOuBLNVtQWODldTIZ/hpFJiog=;
        b=fxj9Pxtxf8z8hQgDEzT4ITmrB7SYe9TRKPR7RZn/M6XFjoNmVJes1tWr/X7XFghJFb
         EgfHEXJmvo1Sn+HYyjiXCWuPeZp1lz7DQ1DgoXxWczF9YS9RxlPNbN1qUn8A7y0gD03o
         5vlf8Hg2FXktAwt43BYJnkNWGjGOIDBxGOhSCfFM3RsVePNjeMnR4gn4lRjPi5SPU2GZ
         LFvA3HzJJKDUHiGx3Dwj9RQKxr86kTyrHhP8OMu6qor/PId0E3BA9mm9ESWsCued9zoe
         9UijA5U67toTxyvor4p5Xt51mXhr/iD5XWvrtm0/kowqngyx2aJ2cEcyR/2oNKo4+Evm
         hGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234492; x=1739839292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXo6xZocIRzlc0t5uNNOuBLNVtQWODldTIZ/hpFJiog=;
        b=jOnKHCazG1hdYT2E98oA0J4aG/e9hzTce5/wFK1QgWBxO/eQ4ws6SQSS3uyCYgJ1SK
         h4QmLYRPr3BuF52t+583ofyiBBpt7dQFX9gK0kGyrBZwJEyWCUOY/OYcitE0cqRozwgA
         ksZgxmiabZxNTXJTYHIb14n8Vdot1IgWAamhXwGQzKYvJ9TuDsqfWvWzWlcVO3eyQQan
         ro+JKD42RhYvd2WkFnMqM25zTvnpvypUsgNldQNlCd3yfD3TyUrcmKWNGDa2dNKR1RIc
         e89w66clRx0YEXJmheyQC7FDhpN/OvBX10sigv3id85s2W1ObXjKqZEQec1ywkGaQXcI
         FvUA==
X-Forwarded-Encrypted: i=1; AJvYcCWaSorPlPfcs+cYofU9Sdj31pGIrzKhLwlYvi5ZWB0IoTt5BprxYaC/mVe/YOtQ6IWlQQLdfzr511UXjBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvjb/t9mWAxIQkfs5ki9mVMxkgFhVPuxOHPKXEtVfiLofx0YyP
	dyYVmZR7K6prE7dP9c/O3i/XeQDMrEZbDWwjcITqKmYyOjrIKUnLUE4qibDhKVA=
X-Gm-Gg: ASbGnctZl5Vq8BRaDthGdR+8tz68k5DnbuEFpt+V5DfEAnbVD2GqeiMas5Tb7Sn3ZAg
	ndH2pitgC6eR40hGh0kBtx4N3KUTBfANpP0L9P8DoduqA2d0xHDF9JUkw7eubjh1DR/DuHLLhvR
	NYqf4qIBLcf4qiw4YFi8IjLzatduM6CwQPyCujzgmGgLjb9E6PLMZffE5oKJIdIKJbV+Y/3o50w
	2D88tCd/LnhGoGo/W9T30/qGI7Z1Rz1wrdJiLSQwawuXpRFVjq7aNBoGRUs4B1Ub5ayHeBGe9K1
	IRB0S5zgsomjV9qdZU16LIaGiZc=
X-Google-Smtp-Source: AGHT+IF2vjnF/mfO7DPkNFP1pjzkrtzpjWq/01kdNjsemhLzW1mYbEpbBZQE8tnX/1U6/cd0ayGIaA==
X-Received: by 2002:a5d:47cf:0:b0:38d:ca55:76c3 with SMTP id ffacd0b85a97d-38dca5578ebmr11616930f8f.11.1739234492236;
        Mon, 10 Feb 2025 16:41:32 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1255:949f:f81c:4f95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc1bed2sm3388435e9.0.2025.02.10.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:41:30 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 11 Feb 2025 01:40:15 +0100
Subject: [PATCH net-next v19 22/26] ovpn: kill key and notify userspace in
 case of IV exhaustion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-b4-ovpn-v19-22-86d5daf2a47a@openvpn.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5907; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=EYnyLwUfNc/BvCrdAHkp1RmPDq4HPh4r2Zz9vyUOYAs=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBnqpyOtwboo9lQ9JxR4Gl3oUGXofAKHBfebzePA
 YeHNlBTzKCJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ6qcjgAKCRALcOU6oDjV
 hwFNB/96q+tZuOOROCYA0JheQ4UDlewWjiWdn4kt5Q8RW0o2sluOasEsGniLP2mUjq15V3wgBpZ
 swp6s+38vq4PbkYP9AczL6xP1Eb3a6PgaaqB1hfkMBi/C++xDongrJHXjXa83CYQ9sB2bkirUt9
 j4sgNwfswX1UMduAn/XwabCoIxFeoDSbGBDkJzz642LuH+ygjtUuy/U6qSAfDILeHo2GCQRuXCM
 wFi3lrIJ5sxNPz/kcdHHISbFhNPlVJCi69pjdOmD+3+KPa96ZMWPfzKXiZaGtRwEny4vid1DdnB
 DLJUSl9dZwSlpBa6AFQzExcW96oksRbQ/J5B+mlidyhP3ott
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

IV wrap-around is cryptographically dangerous for a number of ciphers,
therefore kill the key and inform userspace (via netlink) should the
IV space go exhausted.

Userspace has two ways of deciding when the key has to be renewed before
exhausting the IV space:
1) time based approach:
   after X seconds/minutes userspace generates a new key and sends it
   to the kernel. This is based on guestimate and normally default
   timer value works well.

2) packet count based approach:
   after X packets/bytes userspace generates a new key and sends it to
   the kernel. Userspace keeps track of the amount of traffic by
   periodically polling GET_PEER and fetching the VPN/LINK stats.

Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/crypto.c  | 19 ++++++++++++++
 drivers/net/ovpn/crypto.h  |  2 ++
 drivers/net/ovpn/io.c      | 13 ++++++++++
 drivers/net/ovpn/netlink.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/ovpn/netlink.h |  2 ++
 5 files changed, 100 insertions(+)

diff --git a/drivers/net/ovpn/crypto.c b/drivers/net/ovpn/crypto.c
index 5f382d8a46f21af3e9cbbdf5651659c10292e857..8e7cdf8dd8ee4f9e67982f918ab163913a805f3a 100644
--- a/drivers/net/ovpn/crypto.c
+++ b/drivers/net/ovpn/crypto.c
@@ -54,6 +54,25 @@ void ovpn_crypto_state_release(struct ovpn_crypto_state *cs)
 	}
 }
 
+/* removes the key matching the specified id from the crypto context */
+void ovpn_crypto_kill_key(struct ovpn_crypto_state *cs, u8 key_id)
+{
+	struct ovpn_crypto_key_slot *ks = NULL;
+
+	spin_lock_bh(&cs->lock);
+	if (rcu_access_pointer(cs->slots[0])->key_id == key_id) {
+		ks = rcu_replace_pointer(cs->slots[0], NULL,
+					 lockdep_is_held(&cs->lock));
+	} else if (rcu_access_pointer(cs->slots[1])->key_id == key_id) {
+		ks = rcu_replace_pointer(cs->slots[1], NULL,
+					 lockdep_is_held(&cs->lock));
+	}
+	spin_unlock_bh(&cs->lock);
+
+	if (ks)
+		ovpn_crypto_key_slot_put(ks);
+}
+
 /* Reset the ovpn_crypto_state object in a way that is atomic
  * to RCU readers.
  */
diff --git a/drivers/net/ovpn/crypto.h b/drivers/net/ovpn/crypto.h
index 87addc7bf07c02c3c23da7e6d1f86249d1d867c6..30df70525bbf106a70da758532f1bd6ef1a02369 100644
--- a/drivers/net/ovpn/crypto.h
+++ b/drivers/net/ovpn/crypto.h
@@ -140,4 +140,6 @@ int ovpn_crypto_config_get(struct ovpn_crypto_state *cs,
 			   enum ovpn_key_slot slot,
 			   struct ovpn_key_config *keyconf);
 
+void ovpn_crypto_kill_key(struct ovpn_crypto_state *cs, u8 key_id);
+
 #endif /* _NET_OVPN_OVPNCRYPTO_H_ */
diff --git a/drivers/net/ovpn/io.c b/drivers/net/ovpn/io.c
index f95fe52d84b1767334c3b8a4fe20210cc6f0bd04..4a56e8420c4a8efec11b5ea1b1561df20b3c6e12 100644
--- a/drivers/net/ovpn/io.c
+++ b/drivers/net/ovpn/io.c
@@ -255,6 +255,19 @@ void ovpn_encrypt_post(void *data, int ret)
 	if (likely(ovpn_skb_cb(skb)->req))
 		aead_request_free(ovpn_skb_cb(skb)->req);
 
+	if (unlikely(ret == -ERANGE)) {
+		/* we ran out of IVs and we must kill the key as it can't be
+		 * use anymore
+		 */
+		netdev_warn(peer->ovpn->dev,
+			    "killing key %u for peer %u\n", ks->key_id,
+			    peer->id);
+		ovpn_crypto_kill_key(&peer->crypto, ks->key_id);
+		/* let userspace know so that a new key must be negotiated */
+		ovpn_nl_key_swap_notify(peer, ks->key_id);
+		goto err;
+	}
+
 	if (unlikely(ret < 0))
 		goto err;
 
diff --git a/drivers/net/ovpn/netlink.c b/drivers/net/ovpn/netlink.c
index c62ac542d6dbd79229d3c6457b5c910b77ab533a..86114e5aa76be1595edfabaedfd8996c2d9398b3 100644
--- a/drivers/net/ovpn/netlink.c
+++ b/drivers/net/ovpn/netlink.c
@@ -1093,6 +1093,70 @@ int ovpn_nl_key_del_doit(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
+/**
+ * ovpn_nl_key_swap_notify - notify userspace peer's key must be renewed
+ * @peer: the peer whose key needs to be renewed
+ * @key_id: the ID of the key that needs to be renewed
+ *
+ * Return: 0 on success or a negative error code otherwise
+ */
+int ovpn_nl_key_swap_notify(struct ovpn_peer *peer, u8 key_id)
+{
+	struct ovpn_socket *sock;
+	struct nlattr *k_attr;
+	struct sk_buff *msg;
+	int ret = -EMSGSIZE;
+	void *hdr;
+
+	netdev_info(peer->ovpn->dev, "peer with id %u must rekey - primary key unusable.\n",
+		    peer->id);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(msg, 0, 0, &ovpn_nl_family, 0, OVPN_CMD_KEY_SWAP_NTF);
+	if (!hdr) {
+		ret = -ENOBUFS;
+		goto err_free_msg;
+	}
+
+	if (nla_put_u32(msg, OVPN_A_IFINDEX, peer->ovpn->dev->ifindex))
+		goto err_cancel_msg;
+
+	k_attr = nla_nest_start(msg, OVPN_A_KEYCONF);
+	if (!k_attr)
+		goto err_cancel_msg;
+
+	if (nla_put_u32(msg, OVPN_A_KEYCONF_PEER_ID, peer->id))
+		goto err_cancel_msg;
+
+	if (nla_put_u16(msg, OVPN_A_KEYCONF_KEY_ID, key_id))
+		goto err_cancel_msg;
+
+	nla_nest_end(msg, k_attr);
+	genlmsg_end(msg, hdr);
+
+	rcu_read_lock();
+	sock = rcu_dereference(peer->sock);
+	if (!sock) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+	genlmsg_multicast_netns(&ovpn_nl_family, sock_net(sock->sock->sk),
+				msg, 0, OVPN_NLGRP_PEERS, GFP_ATOMIC);
+	rcu_read_unlock();
+
+	return 0;
+err_unlock:
+	rcu_read_unlock();
+err_cancel_msg:
+	genlmsg_cancel(msg, hdr);
+err_free_msg:
+	nlmsg_free(msg);
+	return ret;
+}
+
 /**
  * ovpn_nl_register - perform any needed registration in the NL subsustem
  *
diff --git a/drivers/net/ovpn/netlink.h b/drivers/net/ovpn/netlink.h
index 9e87cf11d1e9813b7a75ddf3705ab7d5fabe899f..33390b13c8904d40b629662005a9eb92ff617c3b 100644
--- a/drivers/net/ovpn/netlink.h
+++ b/drivers/net/ovpn/netlink.h
@@ -12,4 +12,6 @@
 int ovpn_nl_register(void);
 void ovpn_nl_unregister(void);
 
+int ovpn_nl_key_swap_notify(struct ovpn_peer *peer, u8 key_id);
+
 #endif /* _NET_OVPN_NETLINK_H_ */

-- 
2.45.3

