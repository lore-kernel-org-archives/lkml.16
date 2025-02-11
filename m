Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC11F03D8
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234499; cv=none; b=jqSYlMOQO6aGMVMmxIH7UV6zYij2t+I27ukqKdzvbZGI2zr71m/z9BVn9EiRW9OUikk5IleSD4eARIRt7cA0AuolN30IU99JOtQshcga8On4cnRElXvr3Ev1OqE3gE8APF9wqeqcIWGAbUjiqNH2tirilaqPz3WB200ZqCpcUa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234499; c=relaxed/simple;
	bh=yszauvfHR5CJoqGS7dRg39k9lBfvZ8YEOGy7XiNcbl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTM3bYfGZOiCC2/sx5nuHxE3BzOQB1l9bPat+W2US6SMiKVjBuHdAJNmZSXq7o6+ZweIbxt/36bK335Xfw7w4H3J93b7zzsnyLsCSfWvT0BdiMDT2oQVX3oiocrYCd2gId7JZSOxLt92na8yrO+FEeZB+DdxClVK+bfIRr1jgjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=f9P2VrSq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="f9P2VrSq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4368a293339so55519295e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1739234494; x=1739839294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DAovT2W7HziHzik7go4TCDAdNaqmBB80x80023BUq4=;
        b=f9P2VrSq+2xsszn1tEquicPnRcPNFJ8UEzp1tGHq41qY8QCwOdnSuXuxbhiOpYeaZs
         dPYwdmZYusz0fcHpDdYOaqjf0K1PmJKYT7gBWxRhFvS6covSc8hFfTKicVfFeN7fxKXS
         qZQ+9XS8DfmAg33iv5LmIse+Y/eiWiWiZITZpGwYnUILzVKRYccalxMMa8LUTnhRQ5a6
         IHATZdajRjS9EupOp3Iido1zjxVJN9Va+WAu5eDhlFmCZatEVi1WeJStBmV3wv41+nUs
         N4uF467FgtRBjh6X3h1dEKPjyhcN2ihxRv/rYlBkGORCXKcBxs2iY85iTXxYeqc/Sup3
         tJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234494; x=1739839294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DAovT2W7HziHzik7go4TCDAdNaqmBB80x80023BUq4=;
        b=bC+H/LaOhii3A5Qh/YrrVhBqw/87rO/tOSm5CQLIQV+js2NX2qwD09YIAieDfM8xnT
         YX/EUN/e2BcI7YNoiPolQ6qgjy5YyYY5gqegIV+66VZF74iE3gRT5EQSEkAmwX/rBFCC
         9N2tfBiB7aomMKfOCNQvo+PmVp9nQzyXGcXl0/iISLOm7FGlVT/Ud8KPtBXGVlbxKSNG
         IAPh3+3b7p/2rbpOiB5D3JswdqB8Mt1u0agAqFm2OfRGwlpuGufTa/C+HWT8/1oFdNhi
         JbCbpOQBVjDjf0a3Q8LefQzx2ZE+ZRYv/wBeDpQwqGj3kGMBrCKJpoaYARdaTWhN5NiV
         gp/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSpPnxfV8hjHxslPtMneBQWwyD8KRj2bYTaLj/LQroJMTvTNmzvNaIZdcwQWwShhv1sUHyYU+MEmygm2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx7MgqwZlY3h9hbXT/Xi/gEkuhGAaX/uPoeqUJJetwfEz/fDUd
	e3uZUHfBY97hXnAccL1MEdfo32xBD0nn5pQy5AtVc8b98jMjCfv1UQkp7zsCQAA=
X-Gm-Gg: ASbGnctuHxcrFPt1m3yitwxalvolOA2fPEMViGlXMhC6hNJ1ryMpnhUzNJdaA7O4jgr
	he9TGJATPpxK9RZ1k0H9uqsqcMWJsLBz0FI3tCu8+LAYsRT001mSGrwJBah+b6Yv72794gy4P7D
	fPEZC/Vwl/2CB62T5fZz01LZH/DT5eiUXGCOOO6fh/LNyTliL6la6OdVwAG/q0mdHjtvJdtf8A8
	iy2lMTI+Jyu76vLTkrA5VOJDrbTsJXKJZTEqpRylU6T+Vhuh8OjkZw8YtvL5Z/xI277DrHE9a9c
	jrwv/sAwqbJslVdgO1zYWT1pH48=
X-Google-Smtp-Source: AGHT+IGyrKv62JtEJRpaC2UKjYSB9M4z/yXJLJ2z+txHNc/jelHKjUCHQI84HAHiShjDTmMVKALivw==
X-Received: by 2002:a05:600c:468c:b0:435:23c:e23e with SMTP id 5b1f17b1804b1-4392498a1eemr134633965e9.12.1739234494398;
        Mon, 10 Feb 2025 16:41:34 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1255:949f:f81c:4f95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc1bed2sm3388435e9.0.2025.02.10.16.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:41:33 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 11 Feb 2025 01:40:16 +0100
Subject: [PATCH net-next v19 23/26] ovpn: notify userspace when a peer is
 deleted
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-b4-ovpn-v19-23-86d5daf2a47a@openvpn.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=yszauvfHR5CJoqGS7dRg39k9lBfvZ8YEOGy7XiNcbl4=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBnqpyOLHHD7zDZ7YQoQEFysuBVyh71soZA1Gt8J
 63AosCZoVOJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ6qcjgAKCRALcOU6oDjV
 h8sJB/9t4Q3nacED0Fhos6WAmjgJe7lROiuoM9oyl7TSASxaNvIDME58HIs46Nz5kLHGaQC00oG
 5huLJAucr/jdhrE0klJe9lgu0fp0S2vbTciHhRsV81o3TaEH2sYIqCLNhcdlTrg05Wszb/9n0l/
 wt9x5rh76R9Y8sl3Nq7FPUePTCkwxjD2RsEkecmkG79aVCC5EZCuW1zHz31xZNgMylbbcW5maTI
 FNIVDeSMa1VkX99N4EYBMbnnysmwIwGf98PiqFxsbCfc00jOIvKyc52mYDxMwbgalYl4Hkaiyfk
 eWFYamAt5assDPJlkTNrWqeOn53Tgs7ykdtUtYgyFxDewd3a
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

Whenever a peer is deleted, send a notification to userspace so that it
can react accordingly.

This is most important when a peer is deleted due to ping timeout,
because it all happens in kernelspace and thus userspace has no direct
way to learn about it.

Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/netlink.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/ovpn/netlink.h |  1 +
 drivers/net/ovpn/peer.c    |  1 +
 3 files changed, 67 insertions(+)

diff --git a/drivers/net/ovpn/netlink.c b/drivers/net/ovpn/netlink.c
index 86114e5aa76be1595edfabaedfd8996c2d9398b3..40ea87b9860c38284979b7fb26f99b5510dffd5d 100644
--- a/drivers/net/ovpn/netlink.c
+++ b/drivers/net/ovpn/netlink.c
@@ -1093,6 +1093,71 @@ int ovpn_nl_key_del_doit(struct sk_buff *skb, struct genl_info *info)
 	return 0;
 }
 
+/**
+ * ovpn_nl_peer_del_notify - notify userspace about peer being deleted
+ * @peer: the peer being deleted
+ *
+ * Return: 0 on success or a negative error code otherwise
+ */
+int ovpn_nl_peer_del_notify(struct ovpn_peer *peer)
+{
+	struct ovpn_socket *sock;
+	struct sk_buff *msg;
+	struct nlattr *attr;
+	int ret = -EMSGSIZE;
+	void *hdr;
+
+	netdev_info(peer->ovpn->dev, "deleting peer with id %u, reason %d\n",
+		    peer->id, peer->delete_reason);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(msg, 0, 0, &ovpn_nl_family, 0, OVPN_CMD_PEER_DEL_NTF);
+	if (!hdr) {
+		ret = -ENOBUFS;
+		goto err_free_msg;
+	}
+
+	if (nla_put_u32(msg, OVPN_A_IFINDEX, peer->ovpn->dev->ifindex))
+		goto err_cancel_msg;
+
+	attr = nla_nest_start(msg, OVPN_A_PEER);
+	if (!attr)
+		goto err_cancel_msg;
+
+	if (nla_put_u8(msg, OVPN_A_PEER_DEL_REASON, peer->delete_reason))
+		goto err_cancel_msg;
+
+	if (nla_put_u32(msg, OVPN_A_PEER_ID, peer->id))
+		goto err_cancel_msg;
+
+	nla_nest_end(msg, attr);
+
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
+
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
  * ovpn_nl_key_swap_notify - notify userspace peer's key must be renewed
  * @peer: the peer whose key needs to be renewed
diff --git a/drivers/net/ovpn/netlink.h b/drivers/net/ovpn/netlink.h
index 33390b13c8904d40b629662005a9eb92ff617c3b..4ab3abcf23dba11f6b92e3d69e700693adbc671b 100644
--- a/drivers/net/ovpn/netlink.h
+++ b/drivers/net/ovpn/netlink.h
@@ -12,6 +12,7 @@
 int ovpn_nl_register(void);
 void ovpn_nl_unregister(void);
 
+int ovpn_nl_peer_del_notify(struct ovpn_peer *peer);
 int ovpn_nl_key_swap_notify(struct ovpn_peer *peer, u8 key_id);
 
 #endif /* _NET_OVPN_NETLINK_H_ */
diff --git a/drivers/net/ovpn/peer.c b/drivers/net/ovpn/peer.c
index 6bec5cad5fd88b1e9dbb32fc64d208c9b4ccc965..ef317f18c112ef51afc934e02b4c1135afb23a13 100644
--- a/drivers/net/ovpn/peer.c
+++ b/drivers/net/ovpn/peer.c
@@ -681,6 +681,7 @@ static void ovpn_peer_remove(struct ovpn_peer *peer,
 	}
 
 	peer->delete_reason = reason;
+	ovpn_nl_peer_del_notify(peer);
 
 	INIT_WORK(&peer->remove_work, ovpn_peer_remove_work);
 	schedule_work(&peer->remove_work);

-- 
2.45.3

