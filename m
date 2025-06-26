Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114E31F1517
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750978354; cv=none; b=Lri+JdsN3BF0d15mK4t/KyIqzEYK0R+kxH9xYTPxlyeW7AGXXm5sUwUjyBIXeLm3S2aTL3mewM6yzCVyhHTRgGxWK+zXkDXb+p+xu69csee8GruRtNOJjz6pDoZMX6KzQfuOVF/iDcyhqjq/4kfGsErixwSU1XetjVXwbmmVC98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750978354; c=relaxed/simple;
	bh=oO9xXlEmDjfJ0TmucBn0cdmIBWgPOsAA5hV8uywnh2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkFt5L0xN6vI7aPuUhTzvwOiAztCV/2iMSR6Xu/dVDYF+aQ+qfdfFb9Cq9NvhJtRg0yNfl887iFG8BEDdhn+Y4I4XXviyuiLF8YtOyq6g191JQ6omCqlM/k+KHorVwEumygZ8d9+bHlman6mStpkVm2m9FAAZcBpQVZjFVDgh/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 685DCF2400007EBB; Thu, 27 Jun 2025 06:52:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3690114456921
X-SMAIL-UIID: 56F7B027901B4BE1BCE184E36B9B96A8-20250627-065222-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
Date: Fri, 27 Jun 2025 06:52:09 +0800
Message-ID: <20250626225210.1924-1-hdanton@sina.com>
In-Reply-To: <685db3be.a00a0220.2e5631.0362.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Thu, 26 Jun 2025 13:55:26 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    ee88bddf7f2f Merge tag 'bpf-fixes' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14367182580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
> dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10e9008c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c12f0c580000

#syz test

--- x/drivers/infiniband/sw/rxe/rxe_net.c
+++ y/drivers/infiniband/sw/rxe/rxe_net.c
@@ -471,6 +471,7 @@ struct sk_buff *rxe_init_packet(struct r
 	struct net_device *ndev;
 	const struct ib_gid_attr *attr;
 	const int port_num = 1;
+	struct rxe_dev *rdev;
 
 	attr = rdma_get_gid_attr(&rxe->ib_dev, port_num, av->grh.sgid_index);
 	if (IS_ERR(attr))
@@ -503,6 +504,17 @@ struct sk_buff *rxe_init_packet(struct r
 	skb->dev	= ndev;
 	rcu_read_unlock();
 
+	rdev = rxe_get_dev_from_net(ndev);
+	if (!rdev && is_vlan_dev(ndev))
+		rdev = rxe_get_dev_from_net(vlan_dev_real_dev(ndev));
+	if (rdev)
+		ib_device_put(&rdev->ib_dev);
+	if (rdev != rxe) {
+		kfree_skb(skb);
+		skb = NULL;
+		goto out;
+	}
+
 	if (av->network_type == RXE_NETWORK_TYPE_IPV4)
 		skb->protocol = htons(ETH_P_IP);
 	else
--
