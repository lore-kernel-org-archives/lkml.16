Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F327FB35
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536432; cv=none; b=tGi224Wps+ZStaBzYRW7oM3KD1t2yMyr3xYWLpq/iHcIu5qVh/HL/OOAxg5lKmbFIzUXdiUivvgQasZh2oBawRtjw9gcoPFIJkwp0EBQFm/V5HaLOje0tiEuVDzkNSojJyJVtGCf8sQOR42StRdrn8+VTeJKorevwNSmT9ax3kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536432; c=relaxed/simple;
	bh=YpcCm3ixJtyKoDeaEHvDdM6RI//PQBk5X5XHs0wO/08=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Jum4aP/2wVKJMLxdzF5NoV1cMDyE+0cHLYNKyrYEAOnzd/9ZYp3D43RME7FFYWKl3zSJX2MWEYFvwLbkAvfPEOQduCz4TtOuflfiw1hbF1J43HUsPKm4aOb4axBhKxZLoUB4ulhtV+zWSB7MbTx2qYUjFr6vQbkStrYh5J0Q/aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso620587439f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536430; x=1747141230;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5b8Nl2cx+CY1/Fk0OG0GSfqzO4vb4XZ39VX/XX/vMM=;
        b=H/zjNBrT8f1m16WXEefHreNEB5VZLLZZ1s4T2t8uLaq7LjaW+vSJkVVptwz3ji5j0g
         tvgUU5aZPrrMa6nT5xpuWUXwhg1ZjDagpzvTjYZoshdNIkR9ePG2+lSPZ4lwVyQrVm8q
         XEyfFSabrFeI5MZFtOMWDxei5xTRg6xE5SprCmhyyh7SjlD35I42fNd8bF4/touP9+ZE
         WoPOYtl3o3pDIGqcEvhS5Ubmve6tig9Bit4UKRN1IRLdlRvL+AdvKUpO9QNf310H9u2j
         pv50zh/SWQXTJjUiKuXPCUBhovzkKfkFhEylTqJfZ3a0gCy+CXXogh5pb1+zoxYqkYLB
         J7wQ==
X-Gm-Message-State: AOJu0YyW8EB5AkpgtNA01INUM+zYrhhTayv7xYPuQWI65VcE3btrG3Cu
	/wu8glfOovEr0RbYE6mDGWDs0miuIK+OYUGs8wgikKx2STgji6vql1bxCpb3/MyfsHBiEOwvzE7
	XDx+h5WHhkX0xxuNuoCRIwoExB59vGW3Cx3sr80x2NDUHkISRQU3oGhM=
X-Google-Smtp-Source: AGHT+IEvuCmr2CrZ5ojWszA9e7HnYiBDWHQPyRyLn7apWbOHbpxhTR3HlCMAaUpltvjL2g3fU+PurmWU/oWNMVtVCR92x/+xScCu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1685:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3da6ce07600mr36667555ab.19.1746536430203; Tue, 06 May 2025
 06:00:30 -0700 (PDT)
Date: Tue, 06 May 2025 06:00:30 -0700
In-Reply-To: <68197d2b.050a0220.23d401.2859.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681a07ee.050a0220.a19a9.000a.GAE@google.com>
Subject: Re: [syzbot] [PATCH] Re: [syzbot] [jfs?] KMSAN: uninit-value in BT_STACK_DUMP
From: syzbot <syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] Re: [syzbot] [jfs?] KMSAN: uninit-value in BT_STACK_DUMP
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 02ddfb981de8

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/jfs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/namei.c b/fs/jfs/namei.c
index 65a218eba8fa..937a7fae0e31 100644
--- a/fs/jfs/namei.c
+++ b/fs/jfs/namei.c
@@ -1448,7 +1448,7 @@ static int jfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 
 static struct dentry *jfs_lookup(struct inode *dip, struct dentry *dentry, unsigned int flags)
 {
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	ino_t inum;
 	struct inode *ip;
 	struct component_name key;
-- 
2.43.0

