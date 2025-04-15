Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A929E079
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715881; cv=none; b=HtZrg0rn2PSaM4WxrzfgI5JEPPERIbDSojHYPdR5wpR2DOc1JPB4o2WjDsC2pvoYxBvMDB4Of2osDSNjnX00+JpRE9dX1Yg9KHZiLkViEjyRETbczQckC9nt6/wH9QtJermgmVrmQOb5UFhmn+NKYso14OL9WfFaXY9Pm0Pt1sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715881; c=relaxed/simple;
	bh=msH2j+Q6ALu9sPaWC8c9A15IHOtUvKpWFZuqoXCVm1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNMpsDpn3jW5YokCkn4NKzAzkmpLmEzYPD4AQArIdIAY+P3lo06ht60o97euoxVCHPRlzCLyBgis9gHMY2ZL9f6/ItZFAqw+TZStapc6DO+z8zNBaDNySvEAQaPVoZY+f7IvW3D2zPF6JflsChnBRaQ/m/55WpVFAw4zF4v0QNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=WZq1u/x+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="WZq1u/x+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so34400275e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744715874; x=1745320674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DObrEelohmbhDtacq4AF90RWgYCcWXl9R0gtuBJxDJI=;
        b=WZq1u/x+s4paJ9CTh4SIeJFodMQcJd5tIKU+cLCiYqw5ds/yX/1bxgtbNxW7dq4XTu
         C8tLIYiRcdr1XbC9G4NQI04U4DJ9RUd3Io3KWU1EqaqasJ7L0OmF9wdDOHuYV+D6R/p7
         UfIBEFXZpk2AWh8RVstqTOVIpAZvMXUJ8priwqeiZUSxqoz/LAEQD0lyrr8CAjDOTfwe
         on1/Z659wshxslWY0XEo+rB1xmThnq0qr0Ym2vrrNxSnrv4U2KmDowDVs2TS26y7iCdB
         15mjYLKROSa5LRnNOQVtFcuFP9yb/NLaGqkE92a5zwxX2BXYyMXWDdyky0hmqKeHvRwD
         qfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715874; x=1745320674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DObrEelohmbhDtacq4AF90RWgYCcWXl9R0gtuBJxDJI=;
        b=TpnQ0iGrh8tQGzlV1t+3Z0vi1lWamOl116Ru2fdG0g3waJPuErjKHVz4vStYTEgUxT
         9bsEvBiZ9069YUf5ii7z9eesuVPTRMqJ/zhkmxv0yHdsZ6VacW2GSb89e2Cau17hNDCj
         VFF5+vsXDLsP38Nrlb0cADCGShbrQONOTJsT1+0JphVBIHbXo5tDl3JB6ahtTRKbNKnq
         TTQwDu4o3SG7IDo95KTL9gpFsx1vwWlcYDZlj4tOA9yYnVVUKonzI20QM5neTRLvvr0j
         uED+Wn97KyWZF1EkBvP4754bFVGOuErHswb3Bsg02/3EwvNY7pX4WXG6lz4KiT7r1CNa
         8a/w==
X-Forwarded-Encrypted: i=1; AJvYcCVs7tQ9s5mXyhTJuEHou14rDAlZbHYdsk89tw99LNuIPViBxVizSjtLmV6RseYVxnelqQwaJWm/xwHQpH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3jDf7sGWPF+kInysK9A7q4QyeDVzoIP+xq5ojrCzRH1PLjUT
	2vFtFSWoTA0CGhbzWVHFakouWNg4edmzkcFlWsngwpwlLcayFwdEzi/fW+gZQM2DRKIyirfWRm+
	VLxVCD5RWG9AfkJbD86RK3HtzdrOb65MkfuFkPiBcrzvhyoMi+j9YR3M=
X-Gm-Gg: ASbGncvoaWs19a+IGdfJYIGN0zOjy8LtRBnjXyrE3Q2z8O/2y6aCFUyhLY2pH0vvPYh
	O6IGD56K9SQMXHflBGPc1pBxf34wygdc/EqepePwvhGSHkUHkUDs3G5GX2Wra9K/x0PEj1QCemy
	FEVXatjUrXF+FKBQg5ecaT9FASJwGA1t7aw/p8nBXELMV176Vvx1lW49/4z6q/92Gabohn0bMvK
	suXNyftfo+IU7wV3qAuvT9YXWj6j2S+C9dKCDlifpgiJrgLIbFYzysQHFfGTgdP13LddvkhG1Um
	1qwO8K3E8+Kl2rBa3DD+U3uzEhoHBnzdH3MugA==
X-Google-Smtp-Source: AGHT+IEVtyPWfeEm0iAB1SWN457EOBw6FOEMlM/OCAQt4uzO7AOZNHLuBgdFeFZZEcrRfbgsh3KthQ==
X-Received: by 2002:a05:600c:35c5:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43f99889ad0mr22670395e9.3.1744715874331;
        Tue, 15 Apr 2025 04:17:54 -0700 (PDT)
Received: from [127.0.0.1] ([2001:67c:2fbc:1:83ac:73b4:720f:dc99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d26bsm210836255e9.22.2025.04.15.04.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:17:53 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 15 Apr 2025 13:17:38 +0200
Subject: [PATCH net-next v26 21/23] ovpn: notify userspace when a peer is
 deleted
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-b4-ovpn-v26-21-577f6097b964@openvpn.net>
References: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
In-Reply-To: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3532; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=msH2j+Q6ALu9sPaWC8c9A15IHOtUvKpWFZuqoXCVm1E=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBn/kBC251cpPT2Ir32maxXT+1GseMs0GX5F3HpU
 izTyIMkSiyJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ/5AQgAKCRALcOU6oDjV
 h43yB/oCyuzwiHH/C2i4SGt96BFO8DmgMOKrjPMmw6zYgOTTb6RFgTOLtYKTY3L9orFc3eiWphX
 Z4bBwgHqlyDU7b0ApH1oeCg3Xzr1Ef2x7d9m6k7NK9V2mLsDxk+PIDwAG5m//IkP8TxbGb/Twfo
 e+7HtRxIPW/8vyx6OTazLFNWHMhS5HMjPcKwltX/YTBdTQT+Q2uawJ8wQmsBoF61+keCPaWclQk
 rizH+J9ZnTg/KydSKaqWEuf4BpEfPjLTTHKl5MExeOJQprLU/+iob4aL1lVUegrlmn9en+VJtoF
 aOyJK8WOkQzAwRV3k7G8qRjen5MUNsxDjzYyRRicigiz0qpb
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
index f0b5716059364a1deee1c7d4da1d5341b53dffca..bea03913bfb1e1948d57bd613d2bc6241c76fc06 100644
--- a/drivers/net/ovpn/netlink.c
+++ b/drivers/net/ovpn/netlink.c
@@ -1103,6 +1103,71 @@ int ovpn_nl_key_del_doit(struct sk_buff *skb, struct genl_info *info)
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
+	if (nla_put_u32(msg, OVPN_A_PEER_DEL_REASON, peer->delete_reason))
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
index 5dc84c8e5e803014053faa0d892fc3a7259d40e5..8615dfc3c4720a2a550b5cd1a8454ccc58a3c6ba 100644
--- a/drivers/net/ovpn/netlink.h
+++ b/drivers/net/ovpn/netlink.h
@@ -12,6 +12,7 @@
 int ovpn_nl_register(void);
 void ovpn_nl_unregister(void);
 
+int ovpn_nl_peer_del_notify(struct ovpn_peer *peer);
 int ovpn_nl_key_swap_notify(struct ovpn_peer *peer, u8 key_id);
 
 #endif /* _NET_OVPN_NETLINK_H_ */
diff --git a/drivers/net/ovpn/peer.c b/drivers/net/ovpn/peer.c
index 0469afd6da238d795b63b9e68c8c728fa324de98..a37f89fffb02efbb6468d54c93247b170b5d11f6 100644
--- a/drivers/net/ovpn/peer.c
+++ b/drivers/net/ovpn/peer.c
@@ -706,6 +706,7 @@ static void ovpn_peer_remove(struct ovpn_peer *peer,
 	}
 
 	peer->delete_reason = reason;
+	ovpn_nl_peer_del_notify(peer);
 
 	/* append to provided list for later socket release and ref drop */
 	llist_add(&peer->release_entry, release_list);

-- 
2.49.0

