Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE72D6614
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534562; cv=none; b=pCeCy5du3fui+Z2jdHU6KtpnBXBf4+ns5bEnSbqOndvnjryVwBY4/P5dGvWM22942Z2Kh4/kot2kYMSvBx4o5OKB0G1wibepSevIzchsvE9oMyYsQ23mNNUJhquRMC5uzGYLQ00yUanBNYeqMDdipODZpRVDOHniag0iWHEVDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534562; c=relaxed/simple;
	bh=h0OYEhRgg6QSJuxBR6K/CBtNlaG4cBCtpSWy04aBlmc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KHLaQ6imKlw1oYuz9GcOMSRjWONtIQKunX9c+4vwr5He9kbcgUwdftNfri2eFz6jZK4nWqf5rypbrm+AAHcHcvBHQTOuGJYWuCSEYhaAqxY2uWmkfD6F/++KRm866Ez1AsSHT2bb12tXKtZj83xSs5VKiWMrBZfN6/vc7Hnvmn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cf9bad8e9so579364139f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534560; x=1752139360;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tCAySEFqv3epv6j+Rlkm/8+5LnRbIWUydqjhwg4UTY=;
        b=IFPg3B3o6FiDPKRJ3PJfQ6m23ZQHyD2ssnCtn+IDQj6AkCIVj8chU41iNldjrues5K
         Rikmpf5lTCcYB5D+9osaZ3cyTzcJTznRQQlu50row1FZXp+GMy0pmxHGnnibs+V4JDe/
         IL8FSbQGTYNjNCyLVCSB3y/1Bc+o6niQ8a5Lpch6nsZgCUt25BmFLL6OqpT780vJFDgO
         0jzfxC7erG2iiU6BtKbTPIqiHGzPlFJkAnvEaI5QaxMOVJQJtX80HGkuT5Dysi8skNwS
         Jvx5HfELISv3xg5q6w3xF+1GhVaYp79u2j5epMgVgLOUWETBT5oEdBmMpcSlWVm52e1r
         ZN/w==
X-Gm-Message-State: AOJu0YzA1iN9ItC8HK4PrcEQE0IVC794THVOcXWUlxmh3TExMR/nt5HE
	RdRXdmEecmnz0QKZjNON9alsopcOUeqUFH2fEYEkpeMli1lj9vAiv/Z7IJEJIV+e0yWy2BMWLBt
	Ysj+NN1rnlcbX23t7SEOshRZkSK7gHCE0JnNum3Fh7voFsAf36KmgfGi0dWM=
X-Google-Smtp-Source: AGHT+IEeVvk3UPo5gaggsFanR8r8mY4VsatSTXd29CqUZbuTZWFlAcaUVi0B8/xNB8gMR4tUjIXLQZOSoZfFW+RKG+hJ65XoCYXw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7190:b0:86c:fdb3:2798 with SMTP id
 ca18e2360f4ac-876c6a7fb36mr769096139f.11.1751534559896; Thu, 03 Jul 2025
 02:22:39 -0700 (PDT)
Date: Thu, 03 Jul 2025 02:22:39 -0700
In-Reply-To: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68664bdf.a70a0220.5d25f.0863.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
Author: lizhi.xu@windriver.com

#syz test

diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index 0bd1df2ebb47..e30270e5883a 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -175,7 +175,7 @@ rpc_close_pipes(struct dentry *dentry)
 	int need_release;
 	LIST_HEAD(free_list);
 
-	inode_lock(inode);
+	inode_lock_nested(inode, I_MUTEX_CHILD);
 	spin_lock(&pipe->lock);
 	need_release = pipe->nreaders != 0 || pipe->nwriters != 0;
 	pipe->nreaders = 0;
