Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4BB5383
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629322; cv=none; b=GYMcBPF6mqWyv8kFUuF82bR8Km/pNwEWixP4J+VOxCfj+G01ZSR3WJ+ClYYP8IBABy7EmQIgQKrfhOifki184e8tEym32rOoLE28dX3AoLdzlw6jn7QCpsY08YNLewrJZ3K3yBc6GrhuIzwxQ7FFVCs/9WfDxf35YgTiyQrXDlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629322; c=relaxed/simple;
	bh=GNXfe1uIU/lcIia/1DMzPSfOKMfznBBPrT5kxC2E1zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOa8H7XWXjNc/H7Kaald+uu+xJhHv5O+x3/q3+l8jTERJYpuprrQiKWphSTC29sIYA9GbOwCzKSMfUyyeS3ms4quIJfE3h9cYmyvkIQq7PbUvCNbqEbZYhQcOKckH3Yzrhhz8BAe+YM0oipppmdyumguzPWivKCGlnlmJrdw3i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.56.205])
	by sina.com (10.182.253.25) with ESMTP
	id 67A1602E00007E96; Tue, 4 Feb 2025 08:32:49 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 21685912059153
X-SMAIL-UIID: 3FD35C5CEFF142A8A09291E788819D45-20250204-083249-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in add_wait_queue
Date: Tue,  4 Feb 2025 08:32:33 +0800
Message-ID: <20250204003234.2063-1-hdanton@sina.com>
In-Reply-To: <67a09300.050a0220.d7c5a.008b.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 03 Feb 2025 01:57:20 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    c2933b2befe2 Merge tag 'net-6.14-rc1' of git://git.kernel...
> git tree:       net-next
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12418518580000

#syz test

--- x/net/vmw_vsock/af_vsock.c
+++ y/net/vmw_vsock/af_vsock.c
@@ -824,13 +824,12 @@ static void __vsock_release(struct sock
 	 */
 	lock_sock_nested(sk, level);
 
-	sock_orphan(sk);
-
 	if (vsk->transport)
 		vsk->transport->release(vsk);
 	else if (sock_type_connectible(sk->sk_type))
 		vsock_remove_sock(vsk);
 
+	sock_orphan(sk);
 	sk->sk_shutdown = SHUTDOWN_MASK;
 
 	skb_queue_purge(&sk->sk_receive_queue);
--
