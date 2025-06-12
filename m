Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37576142E73
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712464; cv=none; b=XIiTZYx3qHZfQJXEhvGodA5AxctJnCe5UOI/YJT//jo5zle9pL17eoBJrWMUen28NK3q1CbsxBEv++pbH8s8xTQVUNrdEaGmLUzVgiFJBz7Ij2AKwDdN+oQlKtXs0jwY9/8BTSbqZzCxn8OhOZlcAOKM/Ul9N0vejsiedJFWF7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712464; c=relaxed/simple;
	bh=Pqxuqye5i13D3CMk5hsg5z77ObC4KM6Jikm4tsqg1Bk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dNOHvrH1Ta0eTZzN+kK5//3vId+BcaH8TRMMF8Wx9cB72caEIVzIUUePNAxa+kDFg4O1+eUmwQO22swBshECvZz9JkCzRqo8fvFcG2XvptfzBksMeHNL63MaJQ+ADlJPTje4Yqdo2YZFcWDUxmwQ2DRD0C51nwWIIeoonuFSzg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8730ca8143eso173548139f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712462; x=1750317262;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JISNHND5oALJPkGfh/nVytdioAF1VcJaZ/6BpCKwmFU=;
        b=xQ/Y8lEYZVZFCVuXntDv9hWCMowA84CZHQhGLOLSNvSK7c9I/2cwnG76NBnk548agI
         I2X9RNwtlQNiX+9ZxJD/x4wVr9mQA9pzp6QkrFRQsFNyhuP4PXWJKVDozjNSwjL2KI2z
         RumCS13OdAaZv9OsIiheYpcfWoC4950UHu3spQuuDcjzE7CbfYN3A6jID1+lwR/UEVDn
         s+RusSmR25CqJ94lZzr5ce9eySCGrLgdAqTeROpU8wi19keyp7NIyPaGyj3+Z855Pqiw
         US9drqydFe8L+Eb9cmbJWzJNBhImGtpwhlsFNjVHrliZI0cm0UVsE3LdlfMPoRhvmz+y
         89qw==
X-Gm-Message-State: AOJu0YxAGHrj9V1/y2WGiSUxQd5AQsDBcycM29++yxHO6NqXOstvQxc+
	7Q6tmlmhNv4euPXgcCYFB0hZ0ySxJveFwgro9+0o9BKXhHqDgTH1Prys/TZ3lce3uhw9QjDzd8X
	4OWyO4SHHuHFOycztLbvFqdvzyvx5FrRKGFpNy8zovBuGe9mvriaHRzVEZi8=
X-Google-Smtp-Source: AGHT+IGtTUSYsQqQ6u8lvek8sitpRMiSNUg64JIpMOtJGKrb3gAx1cig9qdI/p3xkpE3rHWajSv7R7gtUvzFI+iV8DXlxf9VPj0e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:4a11:0:b0:3dd:a0fc:1990 with SMTP id
 e9e14a558f8ab-3ddfadc4e2dmr24756515ab.3.1749712462309; Thu, 12 Jun 2025
 00:14:22 -0700 (PDT)
Date: Thu, 12 Jun 2025 00:14:22 -0700
In-Reply-To: <6828591c.a00a0220.398d88.0248.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684a7e4e.050a0220.be214.028b.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
From: syzbot <syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
Author: lizhi.xu@windriver.com

#syz test

diff --git a/fs/overlayfs/xattrs.c b/fs/overlayfs/xattrs.c
index 88055deca936..69e17db853f5 100644
--- a/fs/overlayfs/xattrs.c
+++ b/fs/overlayfs/xattrs.c
@@ -122,6 +122,7 @@ ssize_t ovl_listxattr(struct dentry *dentry, char *list, size_t size)
 	old_cred = ovl_override_creds(dentry->d_sb);
 	res = vfs_listxattr(realdentry, list, size);
 	ovl_revert_creds(old_cred);
+	printk("buf: %s, size: %lu, res: %ld, %s\n", list, size, res, __func__);
 	if (res <= 0 || size == 0)
 		return res;
 
@@ -131,6 +132,7 @@ ssize_t ovl_listxattr(struct dentry *dentry, char *list, size_t size)
 	/* filter out private xattrs */
 	for (s = list, len = res; len;) {
 		size_t slen = strnlen(s, len) + 1;
+		printk("s: %s, len: %lu, slen: %lu, %s\n", s, len, slen, __func__);
 
 		/* underlying fs providing us with an broken xattr list? */
 		if (WARN_ON(slen > len))
