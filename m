Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E41D95A9
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570059; cv=none; b=GjPSrUYEPTkeq+tc8FFJYOTrZh0s6cO+H8xm6YDuJmMNlVN+xsfb63csgyNVQC/3pMClh1XBJOk243UMMcUwS6WrMNL240Zugh2xEiJWFnyH3uS4B0bEiOeUUrmt5/ag2ZFMxE+eLmlprt/oXxZm5iPukuPyTq/CP68shB0fSPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570059; c=relaxed/simple;
	bh=irxJl59VOv85uFEyrqni9Se9zAhunpeUAS5gPwS4ieA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gndyjAVUb0Ipwg2FjRRo8lgwa5R4jvw+NLu9KBO9C0wplZjFYRYbtBMoKSQfauW+mzBbnPVQL4Y7kPDeUcUslsqitwfzm3l8emS1mTh/jb5sMn5uvzEOW0s9eEXP8xN/EwAql211qec3II/YxFO/vlUpTeDDr+K9YStJPdWyDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.56.205])
	by sina.com (10.182.253.25) with ESMTP
	id 67A078AB00003049; Mon, 3 Feb 2025 16:05:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9095812059037
X-SMAIL-UIID: 6C9DE7596FBE49E792FD1C83CE517E4A-20250203-160502-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+3433b5cb8b2b70933f8d@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] possible deadlock in do_ipv6_setsockopt (4)
Date: Mon,  3 Feb 2025 16:04:48 +0800
Message-ID: <20250203080449.1988-1-hdanton@sina.com>
In-Reply-To: <679feb2e.050a0220.d7c5a.0078.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 02 Feb 2025 14:01:18 -0800
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    c2933b2befe2 Merge tag 'net-6.14-rc1' of git://git.kernel...
> git tree:       net-next
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c69724580000

#syz test

--- x/net/smc/af_smc.c
+++ y/net/smc/af_smc.c
@@ -1597,6 +1597,7 @@ static void smc_connect_work(struct work
 			rc = 0;
 	}
 	release_sock(smc->clcsock->sk);
+	rtnl_lock();
 	lock_sock(&smc->sk);
 	if (rc != 0 || smc->sk.sk_err) {
 		smc->sk.sk_state = SMC_CLOSED;
@@ -1624,6 +1625,7 @@ out:
 		}
 	}
 	release_sock(&smc->sk);
+	rtnl_unlock();
 }
 
 int smc_connect(struct socket *sock, struct sockaddr *addr,
@@ -1641,6 +1643,7 @@ int smc_connect(struct socket *sock, str
 	if (addr->sa_family != AF_INET && addr->sa_family != AF_INET6)
 		goto out_err;
 
+	rtnl_lock();
 	lock_sock(sk);
 	switch (sock->state) {
 	default:
@@ -1703,6 +1706,7 @@ connected:
 	sock->state = SS_CONNECTED;
 out:
 	release_sock(sk);
+	rtnl_unlock();
 out_err:
 	return rc;
 }
--- x/net/smc/smc_core.c
+++ y/net/smc/smc_core.c
@@ -1888,6 +1888,7 @@ int smc_vlan_by_tcpsk(struct socket *clc
 	struct net_device *ndev;
 	int rc = 0;
 
+	ASSERT_RTNL();
 	ini->vlan_id = 0;
 	if (!dst) {
 		rc = -ENOTCONN;
@@ -1905,9 +1906,7 @@ int smc_vlan_by_tcpsk(struct socket *clc
 	}
 
 	priv.data = (void *)&ini->vlan_id;
-	rtnl_lock();
 	netdev_walk_all_lower_dev(ndev, smc_vlan_by_tcpsk_walk, &priv);
-	rtnl_unlock();
 
 out_rel:
 	dst_release(dst);
--
