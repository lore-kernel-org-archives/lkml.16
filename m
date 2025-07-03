Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708D215853B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506988; cv=none; b=ooitI8SgP5XQ3bb/XRTw27gFKIl+4iF08CMoqkEOwoXb+Ac1xeNYJBC9YwxBfHiUK2tHElWVjLhrGbtXCSZD7FZNijWCKw4PirkGLrF33JzUREQQWAmPMyzHWLel6O3cHIdPyK6KNkEMnPSr6bbhmjk1M8vhAJ0YOkt7TJb4c3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506988; c=relaxed/simple;
	bh=s5cPhxS7pYFoy2OKcxdoQA90D/axtVsY7Fu4yGjKmD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gonlt1FHE7ZZMRVt6cQmRxb+nN7SHe3RsznqbqVKHyrBYl4N6Fe/xgMH/ETuc7FkPt6SPw1iN/mEo3FeIm5weQrLRDotn/jdFCM7jGcO6nmia1CeGc1xL0TYCebas9hLFTwd+iq4gmMUR4xfIfPqAjgk73ufg3sjrTuaenEsCjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=Vx3qWVCG; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="Vx3qWVCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751506979;
	bh=TeRZReLIfofy8377Zy6Eg/P7XVkSXEXYy6epNo7p6io=;
	h=From:Subject:Date:Message-ID;
	b=Vx3qWVCGFaCj5nN32IDHJ289miTXXRs0T4rmltLqFWirW8ygs6cCpMV+QmCWjOiCQ
	 YUgH74YZ94VnIuVoIcZPBxFQR7f2HMW1KQPnTCIf0AzHC5W7ZkenwTharuoad1lXQO
	 fojfNXIM5iz11L2ChtAxKCFuIxJ83KmF/rQiFTsQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 6865DF8E00007559; Thu, 3 Jul 2025 09:40:31 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6969216292399
X-SMAIL-UIID: 6FDA661471FA48248BD2EBF80B95A794-20250703-094031-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
Date: Thu,  3 Jul 2025 09:40:11 +0800
Message-ID: <20250703014020.2257-1-hdanton@sina.com>
In-Reply-To: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 02 Jul 2025 10:41:32 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    50c8770a42fa Add linux-next specific files for 20250702
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=162e7982580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=70c16e4e191115d4
> dashboard link: https://syzkaller.appspot.com/bug?extid=169de184e9defe7fe709
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1247d770580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ffe48c580000

#syz test

--- x/net/sunrpc/rpc_pipe.c
+++ y/net/sunrpc/rpc_pipe.c
@@ -175,7 +175,7 @@ rpc_close_pipes(struct dentry *dentry)
 	int need_release;
 	LIST_HEAD(free_list);
 
-	inode_lock(inode);
+	inode_lock_nested(inode, 1);
 	spin_lock(&pipe->lock);
 	need_release = pipe->nreaders != 0 || pipe->nwriters != 0;
 	pipe->nreaders = 0;
--
