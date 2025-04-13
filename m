Received: from out162-62-58-69.mail.qq.com (out162-62-58-69.mail.qq.com [162.62.58.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59FB54764
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744525758; cv=none; b=LMoA1SYzxZw6GU5t4z7fvLeIofaKVx+00ay58J+WE4QVRBiugrN7QewmOhOg9U0lTuaYeNOn/pJssZEISqhbHWzbFPUfyQb4JCLHXcSF9wH+LJIdoFH5tA4zxrYTtAkGs1cYjKGsyIVY4zGKk3C7xyTQUQR80SgpEqE7lEIziqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744525758; c=relaxed/simple;
	bh=VfjOKrdlXknj6vXHwWJVj/PZAb+mg4jlr/TvsLO2kuQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=mPPl9qGvWI/XqPDGiBNJzS8//c59FnxT28G9ft1jL6vUnz4TTcO8Ak3dA7mDoASutR7vg44ZLoYS9L/p8oyeizb6rNPoPvmj/HCASdrOfgsIJoybX6g4EhYdgNSAw1s7Br24wkAA9qHwDMwbySN7rOS6jn42/Ba0JmCPDbKtBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mgnEflpp; arc=none smtp.client-ip=162.62.58.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mgnEflpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744525750; bh=D0ZirlimTq5Afw6FKAt5hzKPG4G54aL2TbVMhjYhzlk=;
	h=From:To:Cc:Subject:Date;
	b=mgnEflppUO9gQryvS9cohbmo5vJBkpFbReG+FRBLdOnb1ObWH0+8dOHhZyyJqkyml
	 eM7DHzKfgVY2MNoTx9yRKzIzgYzdEHrHRtvOpeBi0pr2ox8JkL8yvctL1e8Zb08bmT
	 T6RBiNiVIikD31Q+r5WnySeUkxqU6+4EIDKglbVo=
Received: from ground-ThinkStation-P3-Tower.. ([159.226.94.115])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 42AADAF5; Sun, 13 Apr 2025 14:16:42 +0800
X-QQ-mid: xmsmtpt1744525002t7211d50w
Message-ID: <tencent_20ED8A5A99ECCFE616B18F17D8056B5AF707@qq.com>
X-QQ-XMAILINFO: OQ59tfF64tJLUuC/UaBXPGpc48yfl8ikeVT8EldQ9/JSA1xi0KT6CnB5h+ygdL
	 yAi4dcg4GWRX5w0iOjTgpCPgf7owO7fFlHn1rO0nyeZqLbXnmmdif5W6ZLwrvIV2P24TWPIi//vw
	 hVEROrgssqRDOdjKnqkcGnM5tsNSGuZ5gz+gZ8LbND6+xUE9O/KnIYMK2VOBknTrZQaMG+Q8Nedr
	 uE2h7mPKWRcoT1CoRLIONBVSkLewM9jxmmbNUEhisK+1jdHXDMXJSplC8RaMBFSVveOXf+7UVdGP
	 2TjrV93cYnI4xAmX4KJyp5BF4DMDBmFPrbTvAwO7LkdoDRw7WUd140GPSfW0MBxE9+9YskhEUjO/
	 sNfT8FdcFs1x66drPsgfHXfwOiikiMtZtUHqBI3gDNJP7N2qVUt8EzkXCcbxYs9kHPtjajmLvq9N
	 QEWe9eMgQl4a3YJN7TsGTc8py4pUkXPLRu/qFGej1fr1V3ONfUnLuuWlXcEohUsicEa1CkkHsJNM
	 7tt8iSg6IWpoij83wpzK4QZOTrXXJmBoN0uGRB5qD8ZXKD7AB4Me8bja0DdQyg1nzR7Kr/ymeGm+
	 MN8qPN94abOG134g/V1J4aPa28fJAnqzSV5twvkrJGv82xnc0nHVwz1TCnKQOcvHIeyPghEegyOl
	 98Qjv4GUQk6sLRO+ul/XzdDB/uecJsaEGKVEJBXiV0VNZCu07rZc0/83ckrH5PeBzhX6CflZDhbD
	 RsayhWW/hCBBsw0AovPIEIABRUzM7DPQYRjMp/X+FoVWfuQD3IiKeKGVe0TZkZXt6uItgRWj4CHP
	 wf2/Xoq+2X+wAb62oEgk1LKEyiV37/GMNzlLL3vPdvYSTlgakkbBAx9yaKYe3dUYX3Prvuy8EUaP
	 Pha73Z/JlqhDlj9LSbAIpT2PRoUkWA6u4wcx2Gw44x0JeJu3kxDlyVt0r4Zzqfmvv6j6DfFOdc
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: cxxz16 <990492108@qq.com>
To: sgoutham@marvell.com,
	gakula@marvell.com,
	sbhatta@marvell.com,
	hkelam@marvell.com,
	bbhushan2@marvell.com,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	cxxz16 <990492108@qq.com>
Subject: [Patch next] octeontx2-pf: fix potential double free in rvu_rep_create()
Date: Sun, 13 Apr 2025 14:16:39 +0800
X-OQ-MSGID: <20250413061639.2162285-1-990492108@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rvu_rep_create(), the netdev is allocated via alloc_etherdev()
and assigned to rep->netdev. This rep structure is then stored
in the priv->reps array indexed by rep_id.

If either rvu_rep_devlink_port_register() or register_netdev() fails,
the function frees ndev using free_netdev(ndev) before jumping to 
the 'exit:' label. However, in the 'exit:' section, the function 
iterates over priv->reps[] and again frees rep->netdev, which points 
to the same ndev.

This results in a potential double free of the same netdev pointer,
which can cause memory corruption or crashes.

To fix this, avoid calling free_netdev(ndev) before jumping to 'exit:'.
The cleanup logic at 'exit:' should handle the freeing safely.

Signed-off-by: cxxz16 <990492108@qq.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/rep.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
index 04e08e06f30f..de9a50f2fc39 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
@@ -681,7 +681,6 @@ int rvu_rep_create(struct otx2_nic *priv, struct netlink_ext_ack *extack)
 		eth_hw_addr_random(ndev);
 		err = rvu_rep_devlink_port_register(rep);
 		if (err) {
-			free_netdev(ndev);
 			goto exit;
 		}
 
@@ -691,7 +690,6 @@ int rvu_rep_create(struct otx2_nic *priv, struct netlink_ext_ack *extack)
 			NL_SET_ERR_MSG_MOD(extack,
 					   "PFVF representor registration failed");
 			rvu_rep_devlink_port_unregister(rep);
-			free_netdev(ndev);
 			goto exit;
 		}
 
-- 
2.34.1

