Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787BEAE7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751243258; cv=none; b=N9xVJ/DJ3xbcWisyRk4I+P/cewcaRNMzStwAnlU5p5V5/eY9BTC3TfWdIIPy9hJw9dGmuczSw6nmNaKP9wKncx5oC10YGB8RhSfVryhn1Qg1BychyXktQbNTysPM+FkzWk4+/rWtsM+BEnZUL8qwdPAsYVjzLPDlXOmpQBWZRe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751243258; c=relaxed/simple;
	bh=VACOG8UPYMTDI+vVYR3moTtMVpYQswLxyz1q4XdGTf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/OMrEVNcqpMv++ElMWVNqjzxZ1eUdnGbdQzsKio6NacrJ9ZVr1K5OnWj+2wSjgbcxCpld7RLk3RkZb57d6ewsTwak3Us+EGSoWE3vLxfcvVjo1Te4MI6KSf49LOwN6cMHyQrAG/tLdmbV9iuX9VE+c4Zqxk3d/uo2SXNpvjLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=rtKBuEk3; arc=none smtp.client-ip=202.108.3.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="rtKBuEk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751243252;
	bh=9PP+yNOYhQa6UpB6aAnhwK6ILOmEiyDz9vvXgmp0VLI=;
	h=From:Subject:Date:Message-ID;
	b=rtKBuEk3oDdfYh4mp9S+E4NjDpB0KO1jZb8JaUJN7YHT9R2aW08TpRa0vG1NZqOga
	 JjtanfRSxX2uUzN3OGcfA8Fqy4VVft6d2sIHr/q2roS+6f+OvpcUXUDj0sDe8zgmgn
	 6A6hrN9Tf3GiTo3zNObEhknnxRtPeoKvcCqdj46c=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 6861D9EA000071DA; Mon, 30 Jun 2025 08:27:23 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4374186816207
X-SMAIL-UIID: 9934736ED8F944C084A3D3D591B8B2A5-20250630-082723-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+827ae2bfb3a3529333e9@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [rdma?] [s390?] [net?] KASAN: null-ptr-deref Read in smc_tcp_syn_recv_sock
Date: Mon, 30 Jun 2025 08:27:11 +0800
Message-ID: <20250630002712.2109-1-hdanton@sina.com>
In-Reply-To: <67eaf9b8.050a0220.3c3d88.004a.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 31 Mar 2025 13:23:20 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    850925a8133c Merge tag '9p-for-6.12-rc5' of https://github..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1227aa87980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=17c0d505695d6b0
> dashboard link: https://syzkaller.appspot.com/bug?extid=827ae2bfb3a3529333e9
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15489230580000

#syz test upstream   master

--- x/net/smc/af_smc.c
+++ y/net/smc/af_smc.c
@@ -127,6 +127,8 @@ static struct sock *smc_tcp_syn_recv_soc
 	struct sock *child;
 
 	smc = smc_clcsock_user_data(sk);
+	if (!smc)
+		goto drop;
 
 	if (READ_ONCE(sk->sk_ack_backlog) + atomic_read(&smc->queued_smc_hs) >
 				sk->sk_max_ack_backlog)
--
